//!class ObjectWrap pre
//!inhibit init

import core.atomic;
import std.conv : to;
public import std.typecons : Flag, No, Yes;

import glib.types;
import glib.c.functions;
import gobject.dclosure;
import gobject.value;

debug
{
  // Used for enabling GObject lifecycle debug messages by setting GID_OBJECT_DEBUG=1
  private immutable bool gidObjectDebug;

  shared static this()
  {
    import std.process : environment;
    gidObjectDebug = environment.get("GID_OBJECT_DEBUG", "0") == "1";
  }
}

shared static this()
{
  gidObjectQuark = g_quark_from_string("_gidObject");
}

private extern (C) Object _d_newclass(const TypeInfo_Class ci);

// String quark used to assign the D ObjectWrap to the C GObject keyed-data list
immutable Quark gidObjectQuark;

// One time initialized on first use and considered immutable there-after
__gshared TypeInfo_Class[GType] gtypeClasses; // Map of GTypes to D class info
__gshared TypeInfo_Class[TypeInfo_Interface] ifaceProxyClasses; // Map of interface type info to proxy class info
__gshared bool classMapsInitialized;

/**
 * A convenient string mixin to be used for ObjectWrap derived classes to declare boilerplate constructors.
 * Returns: A string value to use with mixin() within ObjectWrap derived classes.
 */
string objectMixin()
{
  return
`  this(void* cObj, Flag!"Take" take)
  {
    super(cObj, take);
  }
`;
}

class ObjectWrap
{
  protected GObject* _cInstancePtr; // Pointer to wrapped C GObject
  DClosure[ulong] signalClosures; // References to signal closures keyed by closure ID, so they don't get garbage collected until the object is finalized

  /**
   * Create an ObjectWrap which is wrapping a C GObject with the given GType.
   * Useful for creating custom D classes which are derived from ObjectWrap.
   * Params:
   *   type = The GType value to use for creating the wrapped GObject
   */
  final this(GType type)
  {
    this(g_object_new(type, null), Yes.Take);
  }

  /**
   * Constructor to wrap a C GObject with a D proxy object.
   * Params:
   *   cObj = Pointer to the GObject
   *   take = Yes.Take if the D object should take ownership of the passed reference, No.Take to add a new reference
   */
  final this(void* cObj, Flag!"Take" take)
  {
    if (!cObj)
      throw new GidConstructException("Null instance pointer for " ~ typeid(this).name);

    _setGObject(cObj, take);
  }

  ~this()
  { // D object is being garbage collected. Only happens when there is only the toggle reference on GObject and there are no more pointers to the D proxy object.
    if (_cInstancePtr) // Might be null if an exception occurred during construction
    {
      debug objectDebugLog("dtor");
      g_object_remove_toggle_ref(_cInstancePtr, &_cObjToggleNotify, cast(void*)this); // Remove the toggle reference, which will likely lead to the destruction of the GObject
    }
  }

  /**
   * Set the GObject of a D ObjectWrap wrapper.
   * Params:
   *   cObj = Pointer to the GObject
   *   take = Yes.Take if the D object should take ownership of the passed reference, No.Take to add a new reference
   */
  final void _setGObject(void* cObj, Flag!"Take" take)
  {
    assert(!_cInstancePtr);

    _cInstancePtr = cast(GObject*)cObj;

    // Add a data pointer to the D object from the C GObject
    g_object_set_qdata(_cInstancePtr, gidObjectQuark, cast(void*)this);

    // Add a toggle reference to bind the GObject to this proxy D Object to prevent the GObject from being destroyed, while also preventing ref loops.
    g_object_add_toggle_ref(_cInstancePtr, &_cObjToggleNotify, cast(void*)this);

    // Add D object as a root to garbage collector so that it doesn't get collected as long as the GObject has a strong reference on it (toggle ref + 1 or more other refs).
    // There will always be at least 2 references at this point, one from the caller and one for the toggle ref.
    ptrFreezeGC(cast(void*)this);

    // If object has a floating reference, remove it
    if (g_object_is_floating(_cInstancePtr))
    {
      g_object_ref_sink(_cInstancePtr);
      g_object_unref(_cInstancePtr);
    }

    if (take) // If taking ownership of the object, remove the extra reference. May trigger toggle notify if it is the last remaining ref
      g_object_unref(_cInstancePtr);

    debug objectDebugLog("new");
  }

  // Toggle ref callback
  extern(C) static void _cObjToggleNotify(void *dObj, GObject* gObj, gboolean isLastRef)
  {
    debug
    {
      (cast(ObjectWrap)dObj).objectDebugLog(isLastRef ? "_cObjToggleNotify isLastRef=true"
        : "_cObjToggleNotify isLastRef=false");
    }

    if (isLastRef) // Is the toggle reference the only reference?
      ptrThawGC(dObj);
    else // Toggle reference was the last reference, but now there is an additional one
      ptrFreezeGC(dObj);
  }

  /**
   * Get a pointer to the underlying C object.
   * Params:
   *   dup = Yes.Dup to add a reference with g_object_ref(), No.Dup otherwise (default)
   * Returns: The C object (reference added according to addRef parameter)
   */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    if (dup)
      g_object_ref(_cInstancePtr);

    debug
    {
      if (dup)
        objectDebugLog("_cPtr(Yes.Dup)");
    }

    return cast(void*)_cInstancePtr;
  }

  /**
   * Calls g_object_ref() on a GObject.
   * Params:
   *   gObj = The GObject to reference
   * Returns: The GObject
   */
  static void* _ref(void* gObj)
  {
    return g_object_ref(cast(GObject*)gObj);
  }

  /**
   * Calls g_object_unref() on a GObject.
   * Params:
   *   gObj = The GObject to reference
   */
  static _unref(void* gObj)
  {
    g_object_unref(cast(GObject*)gObj);
  }

  /**
   * Get the GType of an object.
   * Returns: The GType
   */
  static GType _getGType()
  {
    return g_object_get_type();
  }

  /**
   * GObject GType property.
   * Returns: The GType of the GObject class.
   */
  @property GType _gType()
  {
    return _getGType;
  }

  /**
   * Convenience method to return `this` cast to a type. For use in D with statements.
   * Returns: The object instance
   */
  ObjectWrap self()
  {
    return this;
  }

  /**
   * Template to get the D object from a C GObject and cast it to the given D object type.
   * Params:
   *   T = The D object type
   *   cptr = The C GObject (can be null, in which case null is returned)
   *   take = If Yes.Take then the D object will consume a GObject reference.
   * Returns: The D object (which may be a new object if the GObject wasn't already wrapped)
   */
  static T _getDObject(T)(void* cptr, Flag!"Take" take)
  {
    if (!cptr)
      return null;

    // Cast return value to ObjectWrap or D pointer resolution will break if T is an interface (cast from void* to Interface not the same as Object to Interface)
    if (auto dObj = cast(ObjectWrap)g_object_get_qdata(cast(GObject*)cptr, gidObjectQuark))
    {
      if (take)
        g_object_unref(cast(GObject*)cptr);

      return cast(T)dObj;
    }

    if (!atomicLoad(classMapsInitialized)) // One time initialization of class maps
    {
      synchronized
      {
        auto gobjClass = typeid(ObjectWrap);
        auto ifProxyClass = typeid(IfaceProxy);

        foreach (m; ModuleInfo)
        {
          if (!m)
            continue;

          foreach (c; m.localClasses)
          {
            if (c && ifProxyClass.isBaseOf(c))
            {
              if (c is ifProxyClass)
                continue;

              auto obj = cast(IfaceProxy)_d_newclass(c);

              if (auto ifaceInfo = obj.getIface)
                ifaceProxyClasses[ifaceInfo] = c;
            }
            else if (c && gobjClass.isBaseOf(c))
            { // Create object without calling the constructor which could have side effects - FIXME is there a better way to do this?
              auto obj = _d_newclass(c);

              if (auto gType = (cast(ObjectWrap)obj)._gType)
                gtypeClasses[gType] = c;
            }
          }
        }

        atomicStore(classMapsInitialized, true);
      }
    }

    // Traverse the C GObject type ancestry until we find a corresponding D class
    for (auto gTypeClass = (cast(GTypeInstance*)cptr).gClass; gTypeClass;
      gTypeClass = g_type_class_peek_parent(gTypeClass))
    {
      if (auto dClassType = gTypeClass.gType in gtypeClasses)
      { // If T is an interface type, make sure the matching object class implements it
        if (is(T == interface) && !typeid(T).isBaseOf(cast(const)*dClassType))
          break;

        if (auto obj = _d_newclass(cast()*dClassType))
        {
          (cast(ObjectWrap)obj)._setGObject(cptr, take);
          return cast(T)obj;
        }

        return null;
      }
    }

    static if (is(T == interface))
    {
      if (auto proxyClass = typeid(T) in ifaceProxyClasses) // Interface has a proxy object?
      {
        if (auto obj = _d_newclass(cast()*proxyClass)) // Create the object without calling the constructor
        {
          (cast(ObjectWrap)obj)._setGObject(cptr, take); // Assign the C GObject
          return cast(T)obj;
        }
      }

      return null;
    }
    else
      return new T(cptr, take); // Fallback to attempting to create Object from this template Object type
  }

  debug
  { // Function for GObject debugging output (@nogc to avoid memory issues during GC finalization)
    void objectDebugLog(string action) @nogc
    {
      if (gidObjectDebug)
      {
        import core.stdc.stdio : fwrite, stderr;
        char[16] thisHexBuf;
        char[16] cPtrHexBuf;
        char[10] refCountBuf;

        auto thisTypeName = typeid(this).name;
        toHex(thisHexBuf, cast(ulong)cast(void*)this);
        toHex(cPtrHexBuf, cast(ulong)cast(void*)_cInstancePtr);
        auto refCountBufLen = toDec(refCountBuf, _cInstancePtr.refCount);

        fwrite(action.ptr, 1, action.length, stderr);
        fwrite(" ".ptr, 1, " ".length, stderr);
        fwrite(thisTypeName.ptr, 1, thisTypeName.length, stderr);
        fwrite("@0x".ptr, 1, "@0x".length, stderr);
        fwrite(thisHexBuf.ptr, 1, thisHexBuf.length, stderr);
        fwrite("(GObject@0x".ptr, 1, "(GObject@0x".length, stderr);
        fwrite(cPtrHexBuf.ptr, 1, cPtrHexBuf.length, stderr);
        fwrite(") refcount=".ptr, 1, ") refcount=".length, stderr);
        fwrite(refCountBuf.ptr, 1, refCountBufLen, stderr);
        fwrite("\n".ptr, 1, "\n".length, stderr);
      }
    }

    private static void toHex(char[] buffer, ulong value) @nogc
    {
      foreach (i; 0 .. 16)
        buffer[i] = "0123456789ABCDEF"[(value >> (60 - i * 4)) & 0xF];
    }

    private static uint toDec(char[] buffer, uint value) @nogc
    {
      uint pos;
      uint div = 1_000_000_000;

      foreach (i; 0 .. 10)
      {
        auto digit = value / div;
        buffer[pos] = cast(char)('0' + digit);

        if (pos > 0 || digit > 0)
        {
          pos++;
          value -= digit * div;
        }

        div /= 10;
      }

      return pos > 0 ? pos : 1;
    }
  }

  /**
   * Connect a D closure to an object signal.
   * Params:
   *   signalDetail = Signal name and optional detail separated by '::'
   *   closure = Closure to connect signal to
   *   after = Yes.After to invoke the signal after the default handler, No.After to execute before (default)
   * Returns: The signal connection ID
   */
  ulong connectSignalClosure(string signalDetail, DClosure closure, Flag!"After" after = No.After)
  {
    auto gclosure = cast(GClosure*)(cast(Closure)closure)._cPtr;
    auto retval = g_signal_connect_closure(_cInstancePtr, signalDetail.toCString(No.Alloc), gclosure, after == Yes.After);
    g_object_watch_closure(_cInstancePtr, gclosure); // Invalidate closure when object is finalized

    if (retval != 0)
      signalClosures[retval] = closure;

    return retval;
  }

  /**
   * Template for setting a GObject property.
   * Params:
   *   propertyName = Name of the GObject property
   *   val = The value to assign (must match the property value type)
   */
  void setProperty(T)(string propertyName, T val)
  {
    GValue value;
    initVal!T(&value);
    setVal(&value, val);
    g_object_set_property(_cInstancePtr, toCString(propertyName, No.Alloc), &value);
    g_value_unset(&value);
  }

  /**
   * Template for getting a GObject property.
   * Params:
   *   propertyName = Name of the GObject property
   * Returns: The property value (must match the property value type)
   */
  T getProperty(T)(string propertyName) const
  {
    GValue value;
    initVal!T(&value);
    g_object_get_property(cast(GObject*)_cInstancePtr, toCString(propertyName, No.Alloc), &value);
    T retval = getVal!T(&value);
    g_value_unset(&value);
    return retval;
  }
}

/**
 * Interface proxy class - used to wrap unknown GObjects as a known interface
 */
abstract class IfaceProxy : ObjectWrap
{
  this(void* ptr, Flag!"Take" take)
  {
    super(ptr, take);
  }

  abstract TypeInfo_Interface getIface();
}
