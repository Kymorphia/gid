//!class ObjectWrap pre
//!inhibit init

import core.atomic;
import core.stdc.string : strlen;
import std.exception : assumeWontThrow;
public import std.typecons : Flag, No, Yes;

import gid.core.basictypes;
import gid.core.loader : gidLibHandleOfAddress, gidPackageHasLibHandle, gidPackageLibs, gidPackageOfModule, isLibAvailable;
import gid.glib2.types;
import gid.glib2.c.functions;
import gid.glib2.c.types : GLogLevelFlags;
import gid.gobject2.boxed;
import gid.gobject2.dclosure;
import gid.gobject2.value;

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
  gidSubclassQuark = g_quark_from_string("_gidSubclass");
}

private extern (C) Object _d_newclass(const TypeInfo_Class ci);

// String quark used to assign the D ObjectWrap to the C GObject keyed-data list
private immutable Quark gidObjectQuark;

// String quark used to flag a GType registered for a D subclass (GType qdata, see ObjectWrap._setDSubclassGType)
private immutable Quark gidSubclassQuark;

// One time initialized on first use and considered immutable there-after
private __gshared TypeInfo_Class[][string] gtypeNameClasses; // Map of GType names to D class info candidates, there is more than one when several versions of a library are linked (see ObjectWrap._gTypeName)
private __gshared TypeInfo_Class[GType] gtypeClasses; // Map of GTypes to D class info, for classes without a GType name
private __gshared TypeInfo_Class[TypeInfo_Interface] ifaceProxyClasses; // Map of interface type info to proxy class info
private __gshared bool classMapsInitialized;
private __gshared void*[][GType] gtypeOwnerLibs; // Cache of the libraries which registered a GType, for choosing between versions of a class

/**
 * String mixin that used to add a constructor to classes derived from ObjectWrap. No longer needed: derive from
 * ObjectWrap, call `super()`, and add `mixin GObjectSubclass;` if the class should have its own GObject type.
 * Returns: A string to use with mixin() in a class derived from ObjectWrap.
 */
deprecated("objectMixin is no longer needed: derive from ObjectWrap and call super(), optionally with mixin GObjectSubclass")
string objectMixin() nothrow
{
  return
`  this(void* cObj, Flag!"Take" take) nothrow
  {
    super(cObj, take);
  }
`;
}

/**
 * Attribute of the interface vfunc methods generated in interface mixin templates (such as `ListModelT`). A vfunc
 * method resolved through a D class without it is an override or implementation of the D class, which is installed
 * in the interface structure of its GType (see GObjectSubclass). Not for use in D classes.
 */
struct GidIfaceVfunc {}


class ObjectWrap : GidWrap
{
  protected GObject* _cInstancePtr; // Pointer to wrapped C GObject
  package DClosure[gulong] _signalClosures; // References to signal closures keyed by closure ID, so they don't get garbage collected until the object is finalized

  /**
   * Create a GObject of the given type and wrap it.
   *
   * Classes derived from ObjectWrap should call `super()` instead. If the class uses GObjectSubclass, passing a type
   * that is not the class's own type (or a type derived from it) is a critical error.
   * Params:
   *   type = The GType of the GObject to create
   */
  final this(GType type) nothrow
  {
    static void* baseDSubclassGType() nothrow // Function pointer (not a delegate) in a static context
    {
      return cast(void*)&ObjectWrap._dSubclassGType;
    }

    // Only call _dSubclassGType for GObjectSubclass classes (registers the GType of the D class)
    if (cast(void*)(&this._dSubclassGType).funcptr !is baseDSubclassGType)
    {
      auto dType = _dSubclassGType;

      if (dType && type != dType && !g_type_is_a(type, dType))
        g_log("Gid", GLogLevelFlags.LevelCritical, "%s: ObjectWrap.this(GType) called with GType %s by a class using"
          ~ " GObjectSubclass, use super() instead", g_type_name(dType), g_type_name(type));
    }

    this(createGObject(type), Yes.Take);
  }

  /**
   * Constructor to wrap a C GObject with a D proxy object.
   * Params:
   *   cObj = Pointer to the GObject
   *   take = Yes.Take if the D object should take ownership of the passed reference, No.Take to add a new reference
   */
  final this(void* cObj, Flag!"Take" take) nothrow
  {
    if (cObj && cObj !is _cInstancePtr) // Already bound for D subclass GTypes (see _newDSubclassGObject)
      _setGObject(cObj, take);
  }

  /**
   * Constructor for D subclasses. Creates a GObject of the class's type (the type registered by GObjectSubclass, or
   * the type of the GObject class being derived from).
   */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  ~this() nothrow
  { // D object is being garbage collected. Only happens when there is only the toggle reference on GObject and there are no more pointers to the D proxy object.
    static extern(C) gboolean finalUnref(void* cObj)
    { // Remove destructor reference
      g_object_unref(cast(GObject*)cObj);
      return SOURCE_REMOVE;
    }

    if (_cInstancePtr) // Might be null if an exception occurred during construction
    {
      debug objectDebugLog("dtor");
      g_object_set_qdata(_cInstancePtr, gidObjectQuark, null); // Clear C object -> D object data pointer

      // Ensure final D code unref occurs in main context so C object cleanup happens there, since some libraries such as GTK require this.
      // NOTE: If we aren't in the main context thread, then call to finalUnref() will be deferred to run in the C mainloop.
      // That won't happen, if the mainloop has already stopped during shutdown, resulting in leaks (better than crashing).
      g_object_ref(_cInstancePtr); // Turn toggle reference into a normal ref
      g_object_remove_toggle_ref(_cInstancePtr, &_cObjToggleNotify, cast(void*)this);

      // The ref above toggled the D object (frozen by _cObjToggleNotify), remove the GC root, which would otherwise
      // remain after this object is freed and keep any later allocation at the same address alive
      ptrThawGC(cast(void*)this);

      import core.memory : GC;
      if (GC.inFinalizer) // Don't do final unref if in finalizer, since object D callbacks could get invoked and allocate memory
        g_idle_add(&finalUnref, cast(void*)_cInstancePtr); // Defer to glib main loop (same note applies: if main loop does not run then a leak will result)
      else
        g_main_context_invoke(null, &finalUnref, cast(void*)_cInstancePtr);
    }
  }

  /**
   * Set the GObject of a D ObjectWrap wrapper.
   * Params:
   *   cObj = Pointer to the GObject
   *   take = Yes.Take if the D object should take ownership of the passed reference, No.Take to add a new reference
   */
  final void _setGObject(void* cObj, Flag!"Take" take) nothrow
  {
    _bindGObject(cObj);

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

  // Bind a C GObject to this D object with qdata and a toggle reference, without changing the caller's reference
  private final void _bindGObject(void* cObj) nothrow
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
  }

  // D subclass construction state (thread local, see _newDSubclassGObject and _dSubclassInstanceInit)
  private static ObjectWrap dSubclassConstructing; // D object constructing a new C instance of a D subclass GType
  private static GType dSubclassConstructingType; // GType of dSubclassConstructing's C instance
  private static GObject* dSubclassAdopt; // C created instance of a D subclass GType being bound to a new D object
  private static GType dSubclassAdoptType; // GType of dSubclassAdopt

  /**
   * GType registered for the D class by the GObjectSubclass mixin, used by constructors to create the C instance.
   * Returns: The D subclass GType or 0 if the class does not use the GObjectSubclass mixin
   */
  protected GType _dSubclassGType() nothrow
  {
    return 0;
  }

  /**
   * true if the class uses GObjectSubclass (or GObjectExport), even if GType registration failed.
   * Returns: true if the class has its own D subclass GType
   */
  protected bool _usesDSubclassGType() nothrow
  {
    return false;
  }

  /**
   * Create the C instance for a D object constructed with a D subclass GType (called by the constructors of bound
   * classes, before calling the `this(void*, Flag!"Take")` constructor with the result and Yes.Take). The C instance
   * is bound to the D object in instance_init (see _dSubclassInstanceInit), or if the D object is being constructed
   * for a C created instance (in its instance_init), that instance is bound and returned.
   * Params:
   *   type = The D subclass GType (see _dSubclassGType), 0 to create an instance of _gType
   *   argsIgnored = true if the calling constructor has arguments which are ignored (critical error)
   * Returns: The C instance, which is bound to this D object, or a new owned reference if type is 0
   */
  protected final void* _newDSubclassGObject(GType type, bool argsIgnored = false) nothrow
  {
    if (!type)
    {
      if (_usesDSubclassGType) // GObjectSubclass: type 0 means registration failed
      {
        import std.string : toStringz;
        g_log("Gid", GLogLevelFlags.LevelCritical, "Can't create %s: GType registration failed",
          typeid(this).name.toStringz);
        return null;
      }

      return createGObject(_gType);
    }

    if (argsIgnored)
      g_log("Gid", GLogLevelFlags.LevelCritical, "%s: base class constructor arguments are not supported for D"
        ~ " subclass GTypes, set properties after construction", g_type_name(type));

    if (dSubclassAdopt && dSubclassAdoptType == type) // Constructed for a C created instance?
    {
      auto cObj = dSubclassAdopt;
      dSubclassAdopt = null;
      _bindGObject(cObj);
      return cObj;
    }

    auto prevObj = dSubclassConstructing;
    auto prevType = dSubclassConstructingType;
    dSubclassConstructing = this;
    dSubclassConstructingType = type;
    auto cObj = cast(GObject*)g_object_new_with_properties(type, 0, null, null);
    dSubclassConstructing = prevObj;
    dSubclassConstructingType = prevType;

    if (cObj && cObj is _cInstancePtr) // Bound in instance_init: drop the creation reference, the toggle ref remains
    {
      if (g_object_is_floating(cObj))
        g_object_ref_sink(cObj);

      g_object_unref(cObj);
    }
    else if (cObj && g_object_is_floating(cObj))
      g_object_ref_sink(cObj); // Not bound (should not happen), the constructor binds it

    return cObj;
  }


  alias _exportGetTypeSymbol = imported!"gid.gobject2.dig"._exportGetTypeSymbol;

  /**
   * instance_init of D subclass GTypes. Binds the D object being constructed (see _newDSubclassGObject), or creates
   * a D object for an instance created from C, constructed with its default constructor if T has a public one
   * (which binds the instance instead of creating a new one) or without a constructor otherwise. Only the nearest
   * D subclass type in the instance's type ancestry creates a D object.
   */
  package static extern(C) void _dSubclassInstanceInit(T)(GTypeInstance* instance, void* klass) nothrow
  {
    gidAttachThread(); // Instances can be created by threads created by C
    auto cObj = cast(GObject*)instance;

    if (g_object_get_qdata(cObj, gidObjectQuark)) // Already bound to a D object?
      return;

    auto instType = (cast(GTypeClass*)klass).gType; // klass is the class of the type being instantiated

    if (dSubclassConstructing && dSubclassConstructingType == instType) // Constructed from D?
    {
      auto dObj = dSubclassConstructing;
      dSubclassConstructing = null; // Do not bind other instances created while constructing this one
      dObj._bindGObject(cObj);
      return;
    }

    auto nearest = instType; // Nearest D subclass GType of the instance
    while (nearest && !g_type_get_qdata(nearest, gidSubclassQuark))
      nearest = g_type_parent(nearest);

    if (nearest != T._getGType)
      return;

    static if (__traits(compiles, () => new T())) // Has a public default constructor?
    {
      auto prevObj = dSubclassAdopt;
      auto prevType = dSubclassAdoptType;
      dSubclassAdopt = cObj;
      dSubclassAdoptType = nearest;

      try
        new T();
      catch (Exception e)
        gidInvokeCallbackExceptionHandler(e, "new " ~ T.stringof);

      if (dSubclassAdopt is cObj) // The constructor did not bind the instance
        g_log("Gid", GLogLevelFlags.LevelCritical, "%s: D object constructor did not bind the C instance",
          g_type_name(instType));

      dSubclassAdopt = prevObj;
      dSubclassAdoptType = prevType;
    }
    else if (auto dObj = cast(ObjectWrap)assumeWontThrow(_d_newclass(typeid(T))))
      dObj._bindGObject(cObj);
  }

  // Toggle ref callback
  extern(C) static void _cObjToggleNotify(void *dObj, GObject* gObj, gboolean isLastRef) nothrow
  {
    gidAttachThread(); // The last reference can be dropped on a thread created by C
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
   * Create a GObject of a given type with normal reference (no floating references).
   * Params:
   *   type = Type of GObject to create
   * Returns: New GObject* of the given type or null on error
   */
  static void* createGObject(GType type) nothrow
  {
    auto obj = g_object_new(type, null);

    if (g_object_is_floating(obj))
      g_object_ref_sink(obj); // Convert floating ref to a strong owned ref (no count change)

    return obj;
  }

  /**
   * Get a pointer to the underlying C object.
   * Params:
   *   dup = Yes.Dup to add a reference with g_object_ref(), No.Dup otherwise (default)
   * Returns: The C object (reference added according to addRef parameter)
   */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
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
   * Get the C class structure used by generated `vfunc*` virtual methods to call a C implementation. This is the
   * class of the nearest type in the instance's GType ancestry, starting with the instance's own type, which is not
   * registered for a D subclass. So the C implementation of the object's actual C type is called, and chaining up
   * from a D override (`super.vfuncX()`) reaches the implementation the D type inherited rather than its own D
   * trampoline, regardless of how many D subclass levels there are. If the instance's type was registered by C
   * code as a subclass of a D subclass type, the search starts at the nearest D subclass type, because the
   * overrides of the C type have already run (they called the D type), and calling them again would never end.
   * Returns: The C class structure (a GTypeClass*, cast to the class structure of the virtual method)
   */
  protected final void* _vfuncClass() nothrow
  {
    return _vfuncClassOf(_cInstancePtr);
  }

  /**
   * Get the C class structure of a C instance used to call a C virtual method implementation (see _vfuncClass).
   * Params:
   *   cObj = The C GObject instance
   * Returns: The C class structure
   */
  static void* _vfuncClassOf(void* cObj) nothrow
  {
    auto gtype = (cast(GTypeInstance*)cObj).gClass.gType;

    // A type that C code registered as a subclass of a D type is not a D subclass type. Its class is skipped, since
    // its virtual methods call the D type, which would call it again.
    for (auto t = gtype; t; t = g_type_parent(t))
    {
      if (g_type_get_qdata(t, gidSubclassQuark))
      {
        gtype = t;
        break;
      }
    }

    while (g_type_get_qdata(gtype, gidSubclassQuark))
      gtype = g_type_parent(gtype);

    return g_type_class_peek(gtype); // Classes of an instance's ancestor types are always initialized
  }

  /**
   * Get the D object bound to a C instance for a virtual method trampoline, without creating a D object if none is
   * bound (see _installVfuncs).
   * Params:
   *   cObj = The C GObject instance
   * Returns: The D object or null
   */
  static ObjectWrap _vfuncDObject(void* cObj) nothrow
  {
    return cObj ? cast(ObjectWrap)g_object_get_qdata(cast(GObject*)cObj, gidObjectQuark) : null;
  }

  /**
   * Flag a GType as registered for a D subclass, so that vfunc methods chain up to the C implementations of its
   * nearest ancestor type which is not a D subclass type (see _vfuncClass). Called by GType registration of D
   * subclasses (see GObjectSubclass).
   * Params:
   *   gtype = The GType registered for a D subclass
   *   dClass = The D class of the GType, used to create D objects for unbound instances (see _getDObject)
   */
  static void _setDSubclassGType(GType gtype, const TypeInfo_Class dClass = null) nothrow
  {
    g_type_set_qdata(gtype, gidSubclassQuark, dClass ? cast(void*)dClass : cast(void*)1);
  }

  /**
   * Steal the C object (see GidWrap._cSteal). The D object is the unique proxy of the GObject (bound by a toggle
   * reference) and remains valid, so a new reference is returned.
   * Returns: The C object with a new reference owned by the caller
   */
  void* _cSteal() nothrow
  {
    return _cPtr(Yes.Dup);
  }

  /**
   * Calls g_object_ref() on a GObject.
   * Params:
   *   gObj = The GObject to reference
   * Returns: The GObject
   */
  static void* _cDup(void* gObj) nothrow
  {
    return gObj ? g_object_ref(cast(GObject*)gObj) : null;
  }

  /**
   * Calls g_object_unref() on a GObject.
   * Params:
   *   gObj = The GObject to reference
   */
  static void _cFree(void* gObj) nothrow
  {
    if (gObj)
      g_object_unref(cast(GObject*)gObj);
  }

  /**
   * Get the GType of an object.
   * Returns: The GType
   */
  static GType _getGType() nothrow
  {
    return g_object_get_type();
  }

  /**
   * GObject GType property.
   * Returns: The GType of the GObject class.
   */
  @property GType _gType() nothrow
  {
    return _getGType;
  }

  /**
   * GType name of the class, which is used to map GTypes to D classes (when wrapping a GObject) without calling the
   * get_type() function of every D class (which can have side effects, such as GStreamer types which require
   * gst_init()). Classes which override _gType should also override _gTypeName, otherwise _gType is called when
   * the class maps are created.
   * Returns: The GType name of the class or null if unknown
   */
  @property string _gTypeName() nothrow
  {
    return "GObject";
  }

  /**
   * Convenience method to return `this` cast to a type. For use in D with statements.
   * Returns: The object instance
   */
  ObjectWrap self() nothrow
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
  static T _getDObject(T)(void* cptr, Flag!"Take" take) nothrow
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
        if (!atomicLoad(classMapsInitialized)) // Another thread may have created them while waiting for the lock
        {
          assumeWontThrow(createClassMaps);
          atomicStore(classMapsInitialized, true);
        }
      }
    }

    // Traverse the C GObject type ancestry until we find a corresponding D class
    for (auto gTypeClass = (cast(GTypeInstance*)cptr).gClass; gTypeClass;
      gTypeClass = g_type_class_peek_parent(gTypeClass))
    {
      TypeInfo_Class dClassType;
      bool found;

      // D subclass GTypes store their D class (see _setDSubclassGType)
      auto dSubclass = g_type_get_qdata(gTypeClass.gType, gidSubclassQuark);
      auto dSubclassInfo = cast(TypeInfo_Class)dSubclass;
      if (dSubclass && dSubclass !is cast(void*)1)
      {
        dClassType = dSubclassInfo;
        found = true;
      }
      else if (auto c = gTypeClass.gType in gtypeClasses)
      {
        dClassType = *c;
        found = true;
      }
      else if (auto typeName = g_type_name(gTypeClass.gType))
      {
        if (auto cands = cast(string)typeName[0 .. strlen(typeName)] in gtypeNameClasses) // Not stored, cast is safe
        {
          found = true;
          dClassType = (*cands).length == 1 ? (*cands)[0] : selectClass!T(*cands, gTypeClass.gType);
        }
      }

      if (found)
      { // If T is an interface type, make sure the matching object class implements it (and a class was found)
        if (!dClassType || (is(T == interface) && !typeid(T).isBaseOf(cast(const)dClassType)))
          break;

        if (auto obj = assumeWontThrow(_d_newclass(cast()dClassType)))
        {
          (cast(ObjectWrap)obj)._setGObject(cptr, take);
          return cast(T)obj;
        }

        return null;
      }
    }

    static if (is(T == interface) && is(T._gidDInterfaceOf == T)) // D-defined interface (see GObjectInterface)
    {
      return cast(T)new imported!"gid.gobject2.dig_iface"._DIfaceProxy!T(cptr, take);
    }
    else static if (is(T == interface))
    {
      if (auto proxyClass = typeid(T) in ifaceProxyClasses) // Interface has a proxy object?
      {
        if (auto obj = assumeWontThrow(_d_newclass(cast()*proxyClass))) // Create the object without calling the constructor
        {
          (cast(ObjectWrap)obj)._setGObject(cptr, take); // Assign the C GObject
          return cast(T)obj;
        }
      }

      return null;
    }
    else
    {
      static if (__traits(compiles, (void* p, Flag!"Take" t) => new T(p, t))) // Lambda: the constructor may throw
      {
        T retval;

        try
          retval = new T(cptr, take); // Fallback to attempting to create Object from this template Object type
        catch (Exception e)
          gidInvokeCallbackExceptionHandler(e, "new " ~ T.stringof);

        return retval;
      }
      else
      { // D class without a wrap constructor (such as a D subclass of ObjectWrap), objects are found by their binding
        g_log("Gid", GLogLevelFlags.LevelCritical, "No D object for GObject %p (%s) and no wrap constructor in %s",
          cptr, g_type_name((cast(GTypeInstance*)cptr).gClass.gType), T.stringof.ptr);
        return null;
      }
    }
  }

  debug
  { // Function for GObject debugging output (@nogc to avoid memory issues during GC finalization)
    void objectDebugLog(string action) @nogc nothrow
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

    private static void toHex(char[] buffer, ulong value) @nogc nothrow
    {
      foreach (i; 0 .. 16)
        buffer[i] = "0123456789ABCDEF"[(value >> (60 - i * 4)) & 0xF];
    }

    private static uint toDec(char[] buffer, uint value) @nogc nothrow
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
   * Choose the D class of a GType when several D classes have its GType name, which is the case when more than one
   * version of a library is linked (`gid.gtk3.widget.Widget` and `gid.gtk4.widget.Widget`). D classes of a version
   * whose C library was not loaded can't be it. Of the others, the classes compatible with the requested type `T` are
   * kept and then the class of the library that registered the GType is chosen.
   *
   * The `get_type()` functions of the candidates are never called, since calling that of a version which didn't
   * register the GType would try to register the same GType name again.
   * Params:
   *   T = The requested D type
   *   cands = The candidate D classes, in link order
   *   gType = The GType of the C object (or one of its ancestors)
   * Returns: The D class, or null if none of the candidates can be used as `T`
   */
  static private TypeInfo_Class selectClass(T)(TypeInfo_Class[] cands, GType gType) nothrow
  {
    TypeInfo_Class[] usable;

    foreach (c; cands)
    {
      if (!typeid(T).isBaseOf(cast(const)c))
        continue;

      auto pkg = gidPackageOfModule(c.name);

      if (pkg in gidPackageLibs && !isLibAvailable(pkg)) // The library of this version wasn't found
        continue;

      usable ~= c;
    }

    if (usable.length <= 1)
      return usable.length ? usable[0] : null;

    auto owners = ownerLibs(gType);

    foreach (c; usable)
    {
      auto pkg = gidPackageOfModule(c.name);

      foreach (h; owners)
        if (gidPackageHasLibHandle(pkg, h))
          return c;
    }

    return usable[0]; // No way to tell, use the first (link order)
  }

  /**
   * Get the libraries that registered a GType, determined from the class structure of the GType. Class initialization
   * of a GType (in the library which registered it) assigns its virtual functions, so the class structure values which
   * differ from those of the parent class and point into a loaded library identify the library.
   * Params:
   *   gType = The GType, which must have an initialized class (an instance of it exists)
   * Returns: The handles of libraries found, empty if undetermined
   */
  static private void*[] ownerLibs(GType gType) nothrow
  {
    synchronized
    {
      if (auto cached = gType in gtypeOwnerLibs)
        return *cached;

      void*[] libs;

      if (auto klassPtr = g_type_class_peek(gType))
      {
        auto klass = cast(size_t*)klassPtr;
        size_t* parent;
        size_t parentSlots;
        GTypeQuery query, parentQuery;
        g_type_query(gType, &query);

        if (auto parentClass = g_type_class_peek_parent(klassPtr))
        {
          parent = cast(size_t*)parentClass;
          g_type_query(parentClass.gType, &parentQuery);
          parentSlots = parentQuery.classSize / size_t.sizeof;
        }

        foreach (i; 1 .. query.classSize / size_t.sizeof) // Skip the GType of the GTypeClass
        {
          auto val = klass[i];

          if (val == 0 || (i < parentSlots && val == parent[i])) // Unset or inherited from the parent class
            continue;

          if (auto handle = gidLibHandleOfAddress(cast(void*)val))
          {
            bool known;

            foreach (h; libs)
              known = known || h is handle;

            if (!known)
              libs ~= handle;
          }
        }
      }

      gtypeOwnerLibs[gType] = libs;
      return libs;
    }
  }

  static private void createClassMaps()
  {
    import core.memory : GC;

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
          scope(exit) GC.free(cast(void*)obj); // Probe object: free it without running the destructor

          if (auto ifaceInfo = obj.getIface)
            ifaceProxyClasses[ifaceInfo] = c;
        }
        else if (c && gobjClass.isBaseOf(c) && (c.m_flags & TypeInfo_Class.ClassFlags.isAbstract) == 0) // Don't register abstract classes
        { // Create object without calling the constructor which could have side effects - FIXME is there a better way to do this?
          if (auto obj = cast(ObjectWrap)_d_newclass(c))
          {
            // Probe objects are freed without running destructors, which could have side effects (D subclasses)
            scope(exit) GC.free(cast(void*)obj);

            if (cast(void*)(&obj._dSubclassGType).funcptr !is cast(void*)&ObjectWrap._dSubclassGType) // GObjectSubclass GTypes store their D class
              continue;

            ObjectWrap baseObj;
            scope(exit) if (baseObj) GC.free(cast(void*)baseObj);
            bool ownType = true, ownName = true;

            if (c !is gobjClass && c.base && gobjClass.isBaseOf(c.base))
            {
              baseObj = cast(ObjectWrap)_d_newclass(c.base);

              if (baseObj)
              { // Compare the virtual functions, calling _gType would call get_type()
                ownType = (&obj._gType).funcptr !is (&baseObj._gType).funcptr;
                ownName = (&obj._gTypeName).funcptr !is (&baseObj._gTypeName).funcptr;

                if (!ownType && !ownName) // D subclass without its own GType
                  continue;
              }
            }

            if (ownType && ownName) // GType name only valid if it is from the same class as _gType
            {
              if (auto name = obj._gTypeName)
              {
                gtypeNameClasses[name] ~= c;
                continue;
              }
            }

            // Class without a GType name (custom D class overriding _gType only), get its GType
            auto gType = obj._gType;
            if (!gType || (baseObj && baseObj._gType == gType)) // No GType or D subclass without its own GType
              continue;

            gtypeClasses[gType] = c;
          }
        }
      }
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
  gulong connectSignalClosure(string signalDetail, DClosure closure, Flag!"After" after = No.After) nothrow
  {
    auto gclosure = cast(GClosure*)(cast(Closure)closure)._cPtr;
    auto retval = g_signal_connect_closure(_cInstancePtr, signalDetail.toCString, gclosure, after == Yes.After);
    g_object_watch_closure(_cInstancePtr, gclosure); // Invalidate closure when object is finalized

    if (retval != 0)
      _signalClosures[retval] = closure;

    return retval;
  }

  /**
   * Template for setting a GObject property.
   * Params:
   *   propertyName = Name of the GObject property
   *   val = The value to assign
   */
  void setProperty(T)(string propertyName, T val) nothrow
  {
    auto cPropName = propertyName.toCString;
    GValue value;

    // Enums, flags and boxed classes use the property GType (D enums have no GType of their own, a null boxed value
    // has no instance to get the GType from), as well as ulong which is also GType and gulong (on 64 bit systems)
    static if (is(T == enum) || is(T : gid.gobject2.boxed.Boxed) || is(T == ulong) || is(T == long))
    {
      auto pspec = g_object_class_find_property(cast(GObjectClass*)(cast(GTypeInstance*)_cInstancePtr).gClass, cPropName);
      if (!pspec)
        return;

      g_value_init(&value, pspec.valueType);
    }
    else
      initVal!T(&value); // g_object_set_property transforms the value to the property type if needed

    setVal(&value, val);
    g_object_set_property(_cInstancePtr, cPropName, &value);
    g_value_unset(&value);
  }

  /**
   * Template for getting a GObject property.
   * Params:
   *   propertyName = Name of the GObject property
   * Returns: The property value
   */
  T getProperty(T)(string propertyName) const nothrow
  {
    auto cPropName = propertyName.toCString;
    GValue value;

    // Enums, flags and boxed classes use the property GType (D enums have no GType of their own, a null boxed value
    // has no instance to get the GType from), as well as ulong which is also GType and gulong (on 64 bit systems)
    static if (is(T == enum) || is(T : gid.gobject2.boxed.Boxed) || is(T == ulong) || is(T == long))
    {
      auto pspec = g_object_class_find_property(cast(GObjectClass*)(cast(GTypeInstance*)_cInstancePtr).gClass, cPropName);
      if (!pspec)
        return T.init;

      g_value_init(&value, pspec.valueType);
    }
    else
      initVal!T(&value); // g_object_get_property transforms the value from the property type if needed

    g_object_get_property(cast(GObject*)_cInstancePtr, cPropName, &value);
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  abstract TypeInfo_Interface getIface() nothrow;
}

public import gid.gobject2.dig;
