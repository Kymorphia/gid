/// Module for [ObjectWrap] class
module gid.gobject2.object;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.types;
import gid.gobject2.binding;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.closure;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.param_spec;
import gid.gobject2.parameter;
import gid.gobject2.types;
import gid.gobject2.value;


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


/**
    The base object type.
    
    [gid.gobject2.object.ObjectWrap] is the fundamental type providing the common attributes and
    methods for all object types in GTK, Pango and other libraries
    based on GObject. The [gid.gobject2.object.ObjectWrap] class provides methods for object
    construction and destruction, property access methods, and signal
    support. Signals are described in detail [here](signals.html).
    
    For a tutorial on implementing a new [gid.gobject2.object.ObjectWrap] class, see [How to define and
    implement a new GObject](tutorial.html#how-to-define-and-implement-a-new-gobject).
    For a list of naming conventions for GObjects and their methods, see the
    [GType conventions](concepts.html#conventions). For the high-level concepts
    behind GObject, read
    [Instantiatable classed types: Objects](concepts.html#instantiatable-classed-types-objects).
    
    Since GLib 2.72, all [gid.gobject2.object.ObjectWrap]s are guaranteed to be aligned to at least the
    alignment of the largest basic GLib type (typically this is [gid.gst1.types.ulong] or
    `gdouble`). If you need larger alignment for an element in a [gid.gobject2.object.ObjectWrap], you
    should allocate it on the heap (aligned), or arrange for your [gid.gobject2.object.ObjectWrap] to be
    appropriately padded. This guarantee applies to the [gid.gobject2.object.ObjectWrap] (or derived)
    struct, the [gid.gstpbutils1.types.ObjectClass] (or derived) struct, and any private data allocated
    by `G_ADD_PRIVATE()`.
*/
@gidGir("Object", "ObjectClass")
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

    static if (is(T == interface) && is(T._gidDInterfaceOf == T)) // D-defined interface (see GInterfaceDef)
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

  /**
      Creates a new instance of a #GObject subtype and sets its properties.
      
      Construction parameters (see [gid.gobject2.types.ParamFlags.Construct], [gid.gobject2.types.ParamFlags.ConstructOnly])
      which are not explicitly specified are set to their default values.
  
      Params:
        objectType = the type id of the #GObject subtype to instantiate
        parameters = an array of #GParameter
      Returns: a new instance of
        object_type
  
      Deprecated: Use [gid.gobject2.object.ObjectWrap.newWithProperties] instead.
        deprecated. See #GParameter for more information.
  */
  static gid.gobject2.object.ObjectWrap newv(gid.gobject2.types.GType objectType, gid.gobject2.parameter.Parameter[] parameters) nothrow
  {
    GObject* _cretval;
    uint _nParameters;
    if (parameters)
      _nParameters = cast(uint)parameters.length;

    auto _parameters_arr = new GParameter[](parameters.length);
    auto _parameters = _parameters_arr.ptr;
    foreach (i, obj; parameters) _parameters[i] = *cast(GParameter*)obj._cPtr;
    _cretval = g_object_newv(objectType, _nParameters, _parameters);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    foreach (i, obj; parameters) *cast(GParameter*)obj._cPtr = _parameters[i];
    return _retval;
  }

  /** */
  static size_t compatControl(size_t what, void* data = null) nothrow
  {
    size_t _retval;
    _retval = g_object_compat_control(what, data);
    return _retval;
  }

  /**
      the constructed function is called by [gid.gobject2.object.ObjectWrap.new_] as the
       final step of the object creation process.  At the point of the call, all
       construction properties have been set on the object.  The purpose of this
       call is to allow for object initialisation steps that can only be performed
       after construction properties have been set.  constructed implementors
       should chain up to the constructed call of their parent class to allow it
       to complete its initialisation.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncConstructed` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncConstructed()
  {
    auto _klass = cast(GObjectClass*)_vfuncClass;
    if (!_klass.constructed)
      return;

    _klass.constructed(cast(GObject*)this._cPtr);
  }

  /**
      the generic getter for all properties of this type. Should be
       overridden for every type with properties.
  
      Params:
        propertyId = 
        value =  (modified in place, changes are seen by the caller)
        pspec = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetProperty` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetProperty(uint propertyId, gid.gobject2.value.Value value, gid.gobject2.param_spec.ParamSpec pspec)
  {
    auto _klass = cast(GObjectClass*)_vfuncClass;
    if (!_klass.getProperty)
      return;

    _klass.getProperty(cast(GObject*)this._cPtr, propertyId, value ? cast(GValue*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  }

  /**
      Emits a "notify" signal for the property property_name on object.
      
      When possible, eg. when signaling a property change from within the class
      that registered the property, you should use [gid.gobject2.object.ObjectWrap.notifyByPspec]
      instead.
      
      Note that emission of the notify signal may be blocked with
      [gid.gobject2.object.ObjectWrap.freezeNotify]. In this case, the signal emissions are queued
      and will be emitted (in reverse order) when [gid.gobject2.object.ObjectWrap.thawNotify] is
      called.
  
      Params:
        pspec = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNotify` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncNotify(gid.gobject2.param_spec.ParamSpec pspec)
  {
    auto _klass = cast(GObjectClass*)_vfuncClass;
    if (!_klass.notify)
      return;

    _klass.notify(cast(GObject*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  }

  /**
      the generic setter for all properties of this type. Should be
       overridden for every type with properties. If implementations of
       set_property don't emit property change notification explicitly, this will
       be done implicitly by the type system. However, if the notify signal is
       emitted explicitly, the type system will not emit it a second time.
  
      Params:
        propertyId = 
        value = 
        pspec = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetProperty` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetProperty(uint propertyId, gid.gobject2.value.Value value, gid.gobject2.param_spec.ParamSpec pspec)
  {
    auto _klass = cast(GObjectClass*)_vfuncClass;
    if (!_klass.setProperty)
      return;

    _klass.setProperty(cast(GObject*)this._cPtr, propertyId, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  }

  /**
      Creates a binding between source_property on source and target_property
      on target.
      
      Whenever the source_property is changed the target_property is
      updated using the same value. For instance:
      
      ```c
        g_object_bind_property (action, "active", widget, "sensitive", 0);
      ```
      
      Will result in the "sensitive" property of the widget #GObject instance to be
      updated with the same value of the "active" property of the action #GObject
      instance.
      
      If flags contains [gid.gobject2.types.BindingFlags.Bidirectional] then the binding will be mutual:
      if target_property on target changes then the source_property on source
      will be updated as well.
      
      The binding will automatically be removed when either the source or the
      target instances are finalized. To remove the binding without affecting the
      source and the target you can just call [gid.gobject2.object.ObjectWrap.unref] on the returned
      #GBinding instance.
      
      Removing the binding by calling [gid.gobject2.object.ObjectWrap.unref] on it must only be done if
      the binding, source and target are only used from a single thread and it
      is clear that both source and target outlive the binding. Especially it
      is not safe to rely on this if the binding, source or target can be
      finalized from different threads. Keep another reference to the binding and
      use [gid.gobject2.binding.Binding.unbind] instead to be on the safe side.
      
      A #GObject can have multiple bindings.
  
      Params:
        sourceProperty = the property on source to bind
        target = the target #GObject
        targetProperty = the property on target to bind
        flags = flags to pass to #GBinding
      Returns: the #GBinding instance representing the
            binding between the two #GObject instances. The binding is released
            whenever the #GBinding reference count reaches zero.
  */
  gid.gobject2.binding.Binding bindProperty(string sourceProperty, gid.gobject2.object.ObjectWrap target, string targetProperty, gid.gobject2.types.BindingFlags flags) nothrow
  {
    GBinding* _cretval;
    const(char)* _sourceProperty = sourceProperty.toCString!(No.Malloc, No.Nullable);
    const(char)* _targetProperty = targetProperty.toCString!(No.Malloc, No.Nullable);
    _cretval = g_object_bind_property(cast(GObject*)this._cPtr, _sourceProperty, target ? cast(GObject*)target._cPtr(No.Dup) : null, _targetProperty, flags);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.binding.Binding)(cast(GBinding*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a binding between source_property on source and target_property
      on target, allowing you to set the transformation functions to be used by
      the binding.
      
      This function is the language bindings friendly version of
      [gid.gobject2.object.ObjectWrap.bindPropertyFull], using #GClosures instead of
      function pointers.
  
      Params:
        sourceProperty = the property on source to bind
        target = the target #GObject
        targetProperty = the property on target to bind
        flags = flags to pass to #GBinding
        transformTo = a #GClosure wrapping the transformation function
              from the source to the target, or null to use the default
        transformFrom = a #GClosure wrapping the transformation function
              from the target to the source, or null to use the default
      Returns: the #GBinding instance representing the
            binding between the two #GObject instances. The binding is released
            whenever the #GBinding reference count reaches zero.
  */
  gid.gobject2.binding.Binding bindPropertyFull(string sourceProperty, gid.gobject2.object.ObjectWrap target, string targetProperty, gid.gobject2.types.BindingFlags flags, gid.gobject2.closure.Closure transformTo, gid.gobject2.closure.Closure transformFrom) nothrow
  {
    GBinding* _cretval;
    const(char)* _sourceProperty = sourceProperty.toCString!(No.Malloc, No.Nullable);
    const(char)* _targetProperty = targetProperty.toCString!(No.Malloc, No.Nullable);
    _cretval = g_object_bind_property_with_closures(cast(GObject*)this._cPtr, _sourceProperty, target ? cast(GObject*)target._cPtr(No.Dup) : null, _targetProperty, flags, transformTo ? cast(GClosure*)transformTo._cPtr(No.Dup) : null, transformFrom ? cast(GClosure*)transformFrom._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.binding.Binding)(cast(GBinding*)_cretval, No.Take);
    return _retval;
  }

  /**
      This function is intended for #GObject implementations to re-enforce
      a [floating](floating-refs.html) object reference. Doing this is seldom
      required: all #GInitiallyUnowneds are created with a floating reference
      which usually just needs to be sunken by calling [gid.gobject2.object.ObjectWrap.refSink].
  */
  void forceFloating() nothrow
  {
    g_object_force_floating(cast(GObject*)this._cPtr);
  }

  /**
      Increases the freeze count on object. If the freeze count is
      non-zero, the emission of "notify" signals on object is
      stopped. The signals are queued until the freeze count is decreased
      to zero. Duplicate notifications are squashed so that at most one
      #GObject::notify signal is emitted for each property modified while the
      object is frozen.
      
      This is necessary for accessors that modify multiple properties to prevent
      premature notification while the object is still being modified.
  */
  void freezeNotify() nothrow
  {
    g_object_freeze_notify(cast(GObject*)this._cPtr);
  }

  /**
      Gets a named field from the objects table of associations (see [gid.gobject2.object.ObjectWrap.setData]).
  
      Params:
        key = name of the key for that association
      Returns: the data if found,
                 or null if no such data exists.
  */
  void* getData(string key) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    auto _retval = g_object_get_data(cast(GObject*)this._cPtr, _key);
    return _retval;
  }

  /**
      Gets a property of an object.
      
      The value can be:
      
       - an empty #GValue initialized by `G_VALUE_INIT`, which will be
         automatically initialized with the expected type of the property
         (since GLib 2.60)
       - a #GValue initialized with the expected type of the property
       - a #GValue initialized with a type to which the expected type
         of the property can be transformed
      
      In general, a copy is made of the property contents and the caller is
      responsible for freeing the memory by calling [gid.gobject2.value.Value.unset].
      
      Note that [gid.gobject2.object.ObjectWrap.getProperty] is really intended for language
      bindings, [gid.gobject2.object.ObjectWrap.get] is much more convenient for C programming.
  
      Params:
        propertyName = the name of the property to get
        value = return location for the property value
  */
  void getProperty(string propertyName, gid.gobject2.value.Value value) nothrow
  {
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    g_object_get_property(cast(GObject*)this._cPtr, _propertyName, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /**
      This function gets back user data pointers stored via
      [gid.gobject2.object.ObjectWrap.setQdata].
  
      Params:
        quark = A #GQuark, naming the user data pointer
      Returns: The user data pointer set, or null
  */
  void* getQdata(gid.glib2.types.Quark quark) nothrow
  {
    auto _retval = g_object_get_qdata(cast(GObject*)this._cPtr, quark);
    return _retval;
  }

  /**
      Gets n_properties properties for an object.
      Obtained properties will be set to values. All properties must be valid.
      Warnings will be emitted and undefined behaviour may result if invalid
      properties are passed in.
  
      Params:
        names = the names of each property to get
        values = the values of each property to get
  */
  void getv(string[] names, gid.gobject2.value.Value[] values) nothrow
  {
    uint _nProperties;
    if (names)
      _nProperties = cast(uint)names.length;

    auto _names_arr = new char*[](names.length);
    auto _names = cast(char**)_names_arr.ptr;
    foreach (i, s; names) _names[i] = s.toCString!(No.Malloc);
    if (values)
      _nProperties = cast(uint)values.length;

    auto _values_arr = new GValue[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    g_object_getv(cast(GObject*)this._cPtr, _nProperties, _names, _values);
  }

  /**
      Checks whether object has a [floating](floating-refs.html) reference.
      Returns: true if object has a floating reference
  */
  bool isFloating() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_object_is_floating(cast(GObject*)this._cPtr);
    return _retval;
  }

  /**
      Emits a "notify" signal for the property property_name on object.
      
      When possible, eg. when signaling a property change from within the class
      that registered the property, you should use [gid.gobject2.object.ObjectWrap.notifyByPspec]
      instead.
      
      Note that emission of the notify signal may be blocked with
      [gid.gobject2.object.ObjectWrap.freezeNotify]. In this case, the signal emissions are queued
      and will be emitted (in reverse order) when [gid.gobject2.object.ObjectWrap.thawNotify] is
      called.
  
      Params:
        propertyName = the name of a property installed on the class of object.
  */
  void notify(string propertyName) nothrow
  {
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    g_object_notify(cast(GObject*)this._cPtr, _propertyName);
  }

  /**
      Emits a "notify" signal for the property specified by pspec on object.
      
      This function omits the property name lookup, hence it is faster than
      [gid.gobject2.object.ObjectWrap.notify].
      
      One way to avoid using [gid.gobject2.object.ObjectWrap.notify] from within the
      class that registered the properties, and using [gid.gobject2.object.ObjectWrap.notifyByPspec]
      instead, is to store the GParamSpec used with
      [gid.gobject2.object_class.ObjectClass.installProperty] inside a static array, e.g.:
      
      ```c
        typedef enum
        {
          PROP_FOO = 1,
          PROP_LAST
        } MyObjectProperty;
      
        static GParamSpec *properties[PROP_LAST];
      
        static void
        my_object_class_init (MyObjectClass *klass)
        {
          properties[PROP_FOO] = g_param_spec_int ("foo", NULL, NULL,
                                                   0, 100,
                                                   50,
                                                   G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
          g_object_class_install_property (gobject_class,
                                           PROP_FOO,
                                           properties[PROP_FOO]);
        }
      ```
      
      and then notify a change on the "foo" property with:
      
      ```c
        g_object_notify_by_pspec (self, properties[PROP_FOO]);
      ```
  
      Params:
        pspec = the #GParamSpec of a property installed on the class of object.
  */
  void notifyByPspec(gid.gobject2.param_spec.ParamSpec pspec) nothrow
  {
    g_object_notify_by_pspec(cast(GObject*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  }

  /**
      Increase the reference count of object, and possibly remove the
      [floating](floating-refs.html) reference, if object has a floating reference.
      
      In other words, if the object is floating, then this call "assumes
      ownership" of the floating reference, converting it to a normal
      reference by clearing the floating flag while leaving the reference
      count unchanged.  If the object is not floating, then this call
      adds a new normal reference increasing the reference count by one.
      
      Since GLib 2.56, the type of object will be propagated to the return type
      under the same conditions as for [gid.gobject2.object.ObjectWrap.ref_].
      Returns: object
  */
  gid.gobject2.object.ObjectWrap refSink() nothrow
  {
    GObject* _cretval;
    _cretval = g_object_ref_sink(cast(GObject*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Releases all references to other objects. This can be used to break
      reference cycles.
      
      This function should only be called from object system implementations.
  */
  void runDispose() nothrow
  {
    g_object_run_dispose(cast(GObject*)this._cPtr);
  }

  /**
      Each object carries around a table of associations from
      strings to pointers.  This function lets you set an association.
      
      If the object already had an association with that name,
      the old association will be destroyed.
      
      Internally, the key is converted to a #GQuark using [gid.glib2.global.quarkFromString].
      This means a copy of key is kept permanently (even after object has been
      finalized) — so it is recommended to only use a small, bounded set of values
      for key in your program, to avoid the #GQuark storage growing unbounded.
  
      Params:
        key = name of the key
        data = data to associate with that key
  */
  void setData(string key, void* data = null) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    g_object_set_data(cast(GObject*)this._cPtr, _key, data);
  }

  /**
      Sets a property on an object.
  
      Params:
        propertyName = the name of the property to set
        value = the value
  */
  void setProperty(string propertyName, gid.gobject2.value.Value value) nothrow
  {
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    g_object_set_property(cast(GObject*)this._cPtr, _propertyName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Remove a specified datum from the object's data associations,
      without invoking the association's destroy handler.
  
      Params:
        key = name of the key
      Returns: the data if found, or null
                 if no such data exists.
  */
  void* stealData(string key) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    auto _retval = g_object_steal_data(cast(GObject*)this._cPtr, _key);
    return _retval;
  }

  /**
      This function gets back user data pointers stored via
      [gid.gobject2.object.ObjectWrap.setQdata] and removes the data from object
      without invoking its destroy() function (if any was
      set).
      Usually, calling this function is only required to update
      user data pointers with a destroy notifier, for example:
      ```c
      void
      object_add_to_user_list (GObject     *object,
                               const gchar *new_string)
      {
        // the quark, naming the object data
        GQuark quark_string_list = g_quark_from_static_string ("my-string-list");
        // retrieve the old string list
        GList *list = g_object_steal_qdata (object, quark_string_list);
      
        // prepend new string
        list = g_list_prepend (list, g_strdup (new_string));
        // this changed 'list', so we need to set it again
        g_object_set_qdata_full (object, quark_string_list, list, free_string_list);
      }
      static void
      free_string_list (gpointer data)
      {
        GList *node, *list = data;
      
        for (node = list; node; node = node->next)
          g_free (node->data);
        g_list_free (list);
      }
      ```
      Using [gid.gobject2.object.ObjectWrap.getQdata] in the above example, instead of
      [gid.gobject2.object.ObjectWrap.stealQdata] would have left the destroy function set,
      and thus the partial string list would have been freed upon
      [gid.gobject2.object.ObjectWrap.setQdataFull].
  
      Params:
        quark = A #GQuark, naming the user data pointer
      Returns: The user data pointer set, or null
  */
  void* stealQdata(gid.glib2.types.Quark quark) nothrow
  {
    auto _retval = g_object_steal_qdata(cast(GObject*)this._cPtr, quark);
    return _retval;
  }

  /**
      Reverts the effect of a previous call to
      [gid.gobject2.object.ObjectWrap.freezeNotify]. The freeze count is decreased on object
      and when it reaches zero, queued "notify" signals are emitted.
      
      Duplicate notifications for each property are squashed so that at most one
      #GObject::notify signal is emitted for each property, in the reverse order
      in which they have been queued.
      
      It is an error to call this function when the freeze count is zero.
  */
  void thawNotify() nothrow
  {
    g_object_thaw_notify(cast(GObject*)this._cPtr);
  }

  /**
      This function essentially limits the life time of the closure to
      the life time of the object. That is, when the object is finalized,
      the closure is invalidated by calling [gid.gobject2.closure.Closure.invalidate] on
      it, in order to prevent invocations of the closure with a finalized
      (nonexisting) object. Also, [gid.gobject2.object.ObjectWrap.ref_] and [gid.gobject2.object.ObjectWrap.unref] are
      added as marshal guards to the closure, to ensure that an extra
      reference count is held on object during invocation of the
      closure.  Usually, this function will be called on closures that
      use this object as closure data.
  
      Params:
        closure = #GClosure to watch
  */
  void watchClosure(gid.gobject2.closure.Closure closure) nothrow
  {
    g_object_watch_closure(cast(GObject*)this._cPtr, closure ? cast(GClosure*)closure._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Notify` signal.
  
      The notify signal is emitted on an object when one of its properties has
        its value set through [gid.gobject2.object.ObjectWrap.setProperty], [gid.gobject2.object.ObjectWrap.set], et al.
        
        Note that getting this signal doesn’t itself guarantee that the value of
        the property has actually changed. When it is emitted is determined by the
        derived GObject class. If the implementor did not create the property with
        [gid.gobject2.types.ParamFlags.ExplicitNotify], then any call to [gid.gobject2.object.ObjectWrap.setProperty] results
        in ::notify being emitted, even if the new value is the same as the old.
        If they did pass [gid.gobject2.types.ParamFlags.ExplicitNotify], then this signal is emitted only
        when they explicitly call [gid.gobject2.object.ObjectWrap.notify] or [gid.gobject2.object.ObjectWrap.notifyByPspec],
        and common practice is to do that only when the value has actually changed.
        
        This signal is typically used to obtain change notification for a
        single property, by specifying the property name as a detail in the
        g_signal_connect() call, like this:
        
        ```c
        g_signal_connect (text_view->buffer, "notify::paste-target-list",
                          G_CALLBACK (gtk_text_view_target_list_notify),
                          text_view)
        ```
        
        It is important to note that you must use
        [canonical parameter names][gid.gobject2.param_spec.ParamSpec] as
        detail strings for the notify signal.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gobject2.param_spec.ParamSpec pspec, gid.gobject2.object.ObjectWrap objectWrap)`
  
          `pspec` the #GParamSpec of the property which changed. (optional)
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNotify(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gobject2.param_spec.ParamSpec)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gobject2.object.ObjectWrap)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gobject2.object.ObjectWrap.notify");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("notify"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ObjectWrap
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gobject2.object.ObjectWrap), T.stringof ~ " is not derived from gid.gobject2.object.ObjectWrap");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncConstructed", true)[0]) == gid.gobject2.object.ObjectWrap))
      _installVfunc(klass, "constructed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetProperty", true)[0]) == gid.gobject2.object.ObjectWrap))
      _installVfunc(klass, "get_property");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNotify", true)[0]) == gid.gobject2.object.ObjectWrap))
      _installVfunc(klass, "notify");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetProperty", true)[0]) == gid.gobject2.object.ObjectWrap))
      _installVfunc(klass, "set_property");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GObjectClass*)klass;

    switch (vfunc)
    {
      case "constructed":
      {
        static extern(C) void _vfuncConstructedTramp(GObject* object) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gobject2.object.ObjectWrap)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)object);
          if (!_obj)
          {
            auto _klass = cast(GObjectClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)object);
            if (_klass.constructed)
              return (cast(typeof(&_vfuncConstructedTramp))_klass.constructed)(object);
            return;
          }

          try
          {
            _obj.vfuncConstructed();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gobject2.object.ObjectWrap.vfuncConstructed");
          }
        }

        _klass.constructed = cast(typeof(_klass.constructed))&_vfuncConstructedTramp;
        break;
      }
      case "get_property":
      {
        static extern(C) void _vfuncGetPropertyTramp(GObject* object, uint propertyId, GValue* value, GParamSpec* pspec) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gobject2.object.ObjectWrap)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)object);
          if (!_obj)
          {
            auto _klass = cast(GObjectClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)object);
            if (_klass.getProperty)
              return (cast(typeof(&_vfuncGetPropertyTramp))_klass.getProperty)(object, propertyId, value, pspec);
            return;
          }

          auto _value = value ? new gid.gobject2.value.Value(cast(void*)value, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncGetProperty(propertyId, _value, pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gobject2.object.ObjectWrap.vfuncGetProperty");
          }
          if (_value)
            _value._cUnborrow;

        }

        _klass.getProperty = cast(typeof(_klass.getProperty))&_vfuncGetPropertyTramp;
        break;
      }
      case "notify":
      {
        static extern(C) void _vfuncNotifyTramp(GObject* object, GParamSpec* pspec) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gobject2.object.ObjectWrap)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)object);
          if (!_obj)
          {
            auto _klass = cast(GObjectClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)object);
            if (_klass.notify)
              return (cast(typeof(&_vfuncNotifyTramp))_klass.notify)(object, pspec);
            return;
          }

          try
          {
            _obj.vfuncNotify(pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gobject2.object.ObjectWrap.vfuncNotify");
          }
        }

        _klass.notify = cast(typeof(_klass.notify))&_vfuncNotifyTramp;
        break;
      }
      case "set_property":
      {
        static extern(C) void _vfuncSetPropertyTramp(GObject* object, uint propertyId, const(GValue)* value, GParamSpec* pspec) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gobject2.object.ObjectWrap)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)object);
          if (!_obj)
          {
            auto _klass = cast(GObjectClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)object);
            if (_klass.setProperty)
              return (cast(typeof(&_vfuncSetPropertyTramp))_klass.setProperty)(object, propertyId, value, pspec);
            return;
          }

          try
          {
            _obj.vfuncSetProperty(propertyId, value ? new gid.gobject2.value.Value(cast(void*)value, No.Take) : null, pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gobject2.object.ObjectWrap.vfuncSetProperty");
          }
        }

        _klass.setProperty = cast(typeof(_klass.setProperty))&_vfuncSetPropertyTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gobject2.object.ObjectWrap]
class ObjectWrapGidBuilderImpl(T) : gid.gobject2.gid_builder.GidBuilder!T
{
}

/// Fluent builder for [gid.gobject2.object.ObjectWrap]
final class ObjectWrapGidBuilder : ObjectWrapGidBuilderImpl!ObjectWrapGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ObjectWrap build() nothrow
  {
    return new ObjectWrap(cast(void*)createGObject(ObjectWrap._getGType), Yes.Take);
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
