/// Module for [DBusInterfaceSkeleton] class
module gid.gio2.dbus_interface_skeleton;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.dbus_connection;
import gid.gio2.dbus_interface;
import gid.gio2.dbus_interface_info;
import gid.gio2.dbus_interface_mixin;
import gid.gio2.dbus_method_invocation;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.variant;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Abstract base class for D-Bus interfaces on the service side.
*/
class DBusInterfaceSkeleton : gid.gobject2.object.ObjectWrap, gid.gio2.dbus_interface.DBusInterface
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_interface_skeleton_get_type != &gidSymbolNotFound ? g_dbus_interface_skeleton_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GDBusInterfaceSkeleton";
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusInterfaceSkeleton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton]
      Returns: New builder object
  */
  static DBusInterfaceSkeletonGidBuilder builder() nothrow
  {
    return new DBusInterfaceSkeletonGidBuilder;
  }

  /**
      Get `gFlags` property.
      Returns: Flags from the #GDBusInterfaceSkeletonFlags enumeration.
  */
  @property gid.gio2.types.DBusInterfaceSkeletonFlags gFlags() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.types.DBusInterfaceSkeletonFlags)("g-flags");
  }

  /**
      Set `gFlags` property.
      Params:
        propval = Flags from the #GDBusInterfaceSkeletonFlags enumeration.
  */
  @property void gFlags(gid.gio2.types.DBusInterfaceSkeletonFlags propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.types.DBusInterfaceSkeletonFlags)("g-flags", propval);
  }

  mixin DBusInterfaceT!();

  /**
      If interface_ has outstanding changes, request for these changes to be
      emitted immediately.
      
      For example, an exported D-Bus interface may queue up property
      changes and emit the
      `org.freedesktop.DBus.Properties.PropertiesChanged`
      signal later (e.g. in an idle handler). This technique is useful
      for collapsing multiple property changes into one.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlush` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncFlush()
  {
    auto _klass = cast(GDBusInterfaceSkeletonClass*)_vfuncClass;
    if (!_klass.flush)
      return;

    _klass.flush(cast(GDBusInterfaceSkeleton*)this._cPtr);
  }

  /**
      Signal class handler for the #GDBusInterfaceSkeleton::g-authorize-method signal.
  
      Params:
        invocation = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGAuthorizeMethod` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGAuthorizeMethod(gid.gio2.dbus_method_invocation.DBusMethodInvocation invocation)
  {
    auto _klass = cast(GDBusInterfaceSkeletonClass*)_vfuncClass;
    if (!_klass.gAuthorizeMethod)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.gAuthorizeMethod(cast(GDBusInterfaceSkeleton*)this._cPtr, invocation ? cast(GDBusMethodInvocation*)invocation._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets D-Bus introspection information for the D-Bus interface
      implemented by interface_.
      Returns: A #GDBusInterfaceInfo (never null). Do not free.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetInfo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.dbus_interface_info.DBusInterfaceInfo vfuncGetInfo()
  {
    auto _klass = cast(GDBusInterfaceSkeletonClass*)_vfuncClass;
    if (!_klass.getInfo)
      return typeof(return).init;

    GDBusInterfaceInfo* _cretval;
    _cretval = _klass.getInfo(cast(GDBusInterfaceSkeleton*)this._cPtr);
    auto _retval = _cretval ? new gid.gio2.dbus_interface_info.DBusInterfaceInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets all D-Bus properties for interface_.
      Returns: A #GVariant of type
        ['a{sv}'](../glib/gvariant-text-format.html#dictionaries-and-dictionary-entries).
        Free with [gid.glib2.variant.Variant.unref].
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetProperties` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.glib2.variant.Variant vfuncGetProperties()
  {
    auto _klass = cast(GDBusInterfaceSkeletonClass*)_vfuncClass;
    if (!_klass.getProperties)
      return typeof(return).init;

    GVariant* _cretval;
    _cretval = _klass.getProperties(cast(GDBusInterfaceSkeleton*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the interface vtable for the D-Bus interface implemented by
      interface_. The returned function pointers should expect interface_
      itself to be passed as user_data.
      Returns: the vtable of the D-Bus interface implemented by the skeleton
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetVtable` to chain up from an override.
      Overriding it from D is not supported (callback structure pointer return value with ownership 'None' is not supported).
  */
  protected gid.gio2.types.DBusInterfaceVTable vfuncGetVtable()
  {
    auto _klass = cast(GDBusInterfaceSkeletonClass*)_vfuncClass;
    if (!_klass.getVtable)
      return typeof(return).init;

    GDBusInterfaceVTable* _cretval;
    _cretval = _klass.getVtable(cast(GDBusInterfaceSkeleton*)this._cPtr);
    gid.gio2.types.DBusInterfaceVTable _retval;
    if (_cretval)
      _retval = *cast(gid.gio2.types.DBusInterfaceVTable*)_cretval;
    return _retval;
  }

  /**
      Exports interface_ at object_path on connection.
      
      This can be called multiple times to export the same interface_
      onto multiple connections however the object_path provided must be
      the same for all connections.
      
      Use [gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton.unexport] to unexport the object.
  
      Params:
        connection = A #GDBusConnection to export interface_ on.
        objectPath = The path to export the interface at.
      Returns: true if the interface was exported on connection, otherwise false with
        error set.
      Throws: [ErrorWrap]
  */
  bool export_(gid.gio2.dbus_connection.DBusConnection connection, string objectPath)
  {
    bool _retval;
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_dbus_interface_skeleton_export(cast(GDBusInterfaceSkeleton*)this._cPtr, connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, _objectPath, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      If interface_ has outstanding changes, request for these changes to be
      emitted immediately.
      
      For example, an exported D-Bus interface may queue up property
      changes and emit the
      `org.freedesktop.DBus.Properties.PropertiesChanged`
      signal later (e.g. in an idle handler). This technique is useful
      for collapsing multiple property changes into one.
  */
  void flush() nothrow
  {
    g_dbus_interface_skeleton_flush(cast(GDBusInterfaceSkeleton*)this._cPtr);
  }

  /**
      Gets the first connection that interface_ is exported on, if any.
      Returns: A #GDBusConnection or null if interface_ is
        not exported anywhere. Do not free, the object belongs to interface_.
  */
  gid.gio2.dbus_connection.DBusConnection getConnection() nothrow
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_interface_skeleton_get_connection(cast(GDBusInterfaceSkeleton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a list of the connections that interface_ is exported on.
      Returns: A list of
          all the connections that interface_ is exported on. The returned
          list should be freed with [gid.glib2.list.List.free] after each element has
          been freed with [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.dbus_connection.DBusConnection[] getConnections() nothrow
  {
    GList* _cretval;
    _cretval = g_dbus_interface_skeleton_get_connections(cast(GDBusInterfaceSkeleton*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.dbus_connection.DBusConnection, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the #GDBusInterfaceSkeletonFlags that describes what the behavior
      of interface_
      Returns: One or more flags from the #GDBusInterfaceSkeletonFlags enumeration.
  */
  gid.gio2.types.DBusInterfaceSkeletonFlags getFlags() nothrow
  {
    GDBusInterfaceSkeletonFlags _cretval;
    _cretval = g_dbus_interface_skeleton_get_flags(cast(GDBusInterfaceSkeleton*)this._cPtr);
    gid.gio2.types.DBusInterfaceSkeletonFlags _retval = cast(gid.gio2.types.DBusInterfaceSkeletonFlags)_cretval;
    return _retval;
  }

  /**
      Gets D-Bus introspection information for the D-Bus interface
      implemented by interface_.
      Returns: A #GDBusInterfaceInfo (never null). Do not free.
  */
  gid.gio2.dbus_interface_info.DBusInterfaceInfo getInfo() nothrow
  {
    GDBusInterfaceInfo* _cretval;
    _cretval = g_dbus_interface_skeleton_get_info(cast(GDBusInterfaceSkeleton*)this._cPtr);
    auto _retval = _cretval ? new gid.gio2.dbus_interface_info.DBusInterfaceInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the object path that interface_ is exported on, if any.
      Returns: A string owned by interface_ or null if interface_ is not exported
        anywhere. Do not free, the string belongs to interface_.
  */
  string getObjectPath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_dbus_interface_skeleton_get_object_path(cast(GDBusInterfaceSkeleton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets all D-Bus properties for interface_.
      Returns: A #GVariant of type
        ['a{sv}'](../glib/gvariant-text-format.html#dictionaries-and-dictionary-entries).
        Free with [gid.glib2.variant.Variant.unref].
  */
  gid.glib2.variant.Variant getProperties() nothrow
  {
    GVariant* _cretval;
    _cretval = g_dbus_interface_skeleton_get_properties(cast(GDBusInterfaceSkeleton*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the interface vtable for the D-Bus interface implemented by
      interface_. The returned function pointers should expect interface_
      itself to be passed as user_data.
      Returns: the vtable of the D-Bus interface implemented by the skeleton
  */
  gid.gio2.types.DBusInterfaceVTable getVtable() nothrow
  {
    GDBusInterfaceVTable* _cretval;
    _cretval = g_dbus_interface_skeleton_get_vtable(cast(GDBusInterfaceSkeleton*)this._cPtr);
    gid.gio2.types.DBusInterfaceVTable _retval;
    if (_cretval)
      _retval = *cast(gid.gio2.types.DBusInterfaceVTable*)_cretval;
    return _retval;
  }

  /**
      Checks if interface_ is exported on connection.
  
      Params:
        connection = A #GDBusConnection.
      Returns: true if interface_ is exported on connection, false otherwise.
  */
  bool hasConnection(gid.gio2.dbus_connection.DBusConnection connection) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_dbus_interface_skeleton_has_connection(cast(GDBusInterfaceSkeleton*)this._cPtr, connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets flags describing what the behavior of skeleton should be.
  
      Params:
        flags = Flags from the #GDBusInterfaceSkeletonFlags enumeration.
  */
  void setFlags(gid.gio2.types.DBusInterfaceSkeletonFlags flags) nothrow
  {
    g_dbus_interface_skeleton_set_flags(cast(GDBusInterfaceSkeleton*)this._cPtr, flags);
  }

  /**
      Stops exporting interface_ on all connections it is exported on.
      
      To unexport interface_ from only a single connection, use
      [gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton.unexportFromConnection]
  */
  void unexport() nothrow
  {
    g_dbus_interface_skeleton_unexport(cast(GDBusInterfaceSkeleton*)this._cPtr);
  }

  /**
      Stops exporting interface_ on connection.
      
      To stop exporting on all connections the interface is exported on,
      use [gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton.unexport].
  
      Params:
        connection = A #GDBusConnection.
  */
  void unexportFromConnection(gid.gio2.dbus_connection.DBusConnection connection) nothrow
  {
    g_dbus_interface_skeleton_unexport_from_connection(cast(GDBusInterfaceSkeleton*)this._cPtr, connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null);
  }

  /**
      Connect to `GAuthorizeMethod` signal.
  
      Emitted when a method is invoked by a remote caller and used to
        determine if the method call is authorized.
        
        Note that this signal is emitted in a thread dedicated to
        handling the method call so handlers are allowed to perform
        blocking IO. This means that it is appropriate to call e.g.
        [polkit_authority_check_authorization_sync()](http://hal.freedesktop.org/docs/polkit/PolkitAuthority.html#polkit-authority-check-authorization-sync)
        with the
        [POLKIT_CHECK_AUTHORIZATION_FLAGS_ALLOW_USER_INTERACTION](http://hal.freedesktop.org/docs/polkit/PolkitAuthority.html#POLKIT-CHECK-AUTHORIZATION-FLAGS-ALLOW-USER-INTERACTION:CAPS)
        flag set.
        
        If false is returned then no further handlers are run and the
        signal handler must take a reference to invocation and finish
        handling the call (e.g. return an error via
        [gid.gio2.dbus_method_invocation.DBusMethodInvocation.returnError]).
        
        Otherwise, if true is returned, signal emission continues. If no
        handlers return false, then the method is dispatched. If
        interface has an enclosing #GDBusObjectSkeleton, then the
        #GDBusObjectSkeleton::authorize-method signal handlers run before
        the handlers for this signal.
        
        The default class handler just returns true.
        
        Please note that the common case is optimized: if no signals
        handlers are connected and the default class handler isn't
        overridden (for both interface and the enclosing
        #GDBusObjectSkeleton, if any) and #GDBusInterfaceSkeleton:g-flags does
        not have the
        [gid.gio2.types.DBusInterfaceSkeletonFlags.HandleMethodInvocationsInThread]
        flags set, no dedicated thread is ever used and the call will be
        handled in the same thread as the object that interface belongs
        to was exported in.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gio2.dbus_method_invocation.DBusMethodInvocation invocation, gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton dBusInterfaceSkeleton)`
  
          `invocation` A #GDBusMethodInvocation. (optional)
  
          `dBusInterfaceSkeleton` the instance the signal is connected to (optional)
  
          `Returns` true if the call is authorized, false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGAuthorizeMethod(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_method_invocation.DBusMethodInvocation)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton.gAuthorizeMethod");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("g-authorize-method", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from DBusInterfaceSkeleton
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton), T.stringof ~ " is not derived from gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlush", true)[0]) == gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton))
      _installVfunc(klass, "flush");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGAuthorizeMethod", true)[0]) == gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton))
      _installVfunc(klass, "g_authorize_method");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetInfo", true)[0]) == gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton))
      _installVfunc(klass, "get_info");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetProperties", true)[0]) == gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton))
      _installVfunc(klass, "get_properties");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetVtable", true)[0]) == gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton))
      static assert(0, "Overriding gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton.vfuncGetVtable is not supported: callback structure pointer return value with ownership 'None' is not supported");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GDBusInterfaceSkeletonClass*)klass;

    switch (vfunc)
    {
      case "flush":
      {
        static extern(C) void _vfuncFlushTramp(GDBusInterfaceSkeleton* interface_) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interface_);
          if (!_obj)
          {
            auto _klass = cast(GDBusInterfaceSkeletonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interface_);
            if (_klass.flush)
              return (cast(typeof(&_vfuncFlushTramp))_klass.flush)(interface_);
            return;
          }

          try
          {
            _obj.vfuncFlush();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton.vfuncFlush");
          }
        }

        _klass.flush = cast(typeof(_klass.flush))&_vfuncFlushTramp;
        break;
      }
      case "g_authorize_method":
      {
        static extern(C) gboolean _vfuncGAuthorizeMethodTramp(GDBusInterfaceSkeleton* interface_, GDBusMethodInvocation* invocation) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interface_);
          if (!_obj)
          {
            auto _klass = cast(GDBusInterfaceSkeletonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interface_);
            if (_klass.gAuthorizeMethod)
              return (cast(typeof(&_vfuncGAuthorizeMethodTramp))_klass.gAuthorizeMethod)(interface_, invocation);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGAuthorizeMethod(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_method_invocation.DBusMethodInvocation)(cast(void*)invocation, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton.vfuncGAuthorizeMethod");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.gAuthorizeMethod = cast(typeof(_klass.gAuthorizeMethod))&_vfuncGAuthorizeMethodTramp;
        break;
      }
      case "get_info":
      {
        static extern(C) GDBusInterfaceInfo* _vfuncGetInfoTramp(GDBusInterfaceSkeleton* interface_) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interface_);
          if (!_obj)
          {
            auto _klass = cast(GDBusInterfaceSkeletonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interface_);
            if (_klass.getInfo)
              return (cast(typeof(&_vfuncGetInfoTramp))_klass.getInfo)(interface_);
            return typeof(return).init;
          }

          gid.gio2.dbus_interface_info.DBusInterfaceInfo _dretval;

          try
          {
            _dretval = _obj.vfuncGetInfo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton.vfuncGetInfo");
          }
          auto _retval = _dretval ? cast(GDBusInterfaceInfo*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getInfo = cast(typeof(_klass.getInfo))&_vfuncGetInfoTramp;
        break;
      }
      case "get_properties":
      {
        static extern(C) GVariant* _vfuncGetPropertiesTramp(GDBusInterfaceSkeleton* interface_) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interface_);
          if (!_obj)
          {
            auto _klass = cast(GDBusInterfaceSkeletonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interface_);
            if (_klass.getProperties)
              return (cast(typeof(&_vfuncGetPropertiesTramp))_klass.getProperties)(interface_);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;

          try
          {
            _dretval = _obj.vfuncGetProperties();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton.vfuncGetProperties");
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getProperties = cast(typeof(_klass.getProperties))&_vfuncGetPropertiesTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton]
class DBusInterfaceSkeletonGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.dbus_interface.DBusInterfaceGidBuilderImpl!T
{

  mixin DBusInterfaceGidBuilderT!();

  /**
      Set `gFlags` property.
      Params:
        propval = Flags from the #GDBusInterfaceSkeletonFlags enumeration.
      Returns: Builder instance for fluent chaining
  */
  T gFlags(gid.gio2.types.DBusInterfaceSkeletonFlags propval) nothrow
  {
    return setProperty("g-flags", propval);
  }
}

/// Fluent builder for [gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton]
final class DBusInterfaceSkeletonGidBuilder : DBusInterfaceSkeletonGidBuilderImpl!DBusInterfaceSkeletonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DBusInterfaceSkeleton build() nothrow
  {
    return new DBusInterfaceSkeleton(cast(void*)createGObject(DBusInterfaceSkeleton._getGType), Yes.Take);
  }
}
