/// Module for [DBusInterfaceSkeleton] class
module gio.dbus_interface_skeleton;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_connection;
import gio.dbus_interface;
import gio.dbus_interface_info;
import gio.dbus_interface_mixin;
import gio.dbus_method_invocation;
import gio.types;
import glib.error;
import glib.variant;
import gobject.dclosure;
import gobject.object;

/**
    Abstract base class for D-Bus interfaces on the service side.
*/
class DBusInterfaceSkeleton : gobject.object.ObjectWrap, gio.dbus_interface.DBusInterface
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_interface_skeleton_get_type != &gidSymbolNotFound ? g_dbus_interface_skeleton_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusInterfaceSkeleton self()
  {
    return this;
  }

  /**
      Get `gFlags` property.
      Returns: Flags from the #GDBusInterfaceSkeletonFlags enumeration.
  */
  @property gio.types.DBusInterfaceSkeletonFlags gFlags()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.types.DBusInterfaceSkeletonFlags)("g-flags");
  }

  /**
      Set `gFlags` property.
      Params:
        propval = Flags from the #GDBusInterfaceSkeletonFlags enumeration.
  */
  @property void gFlags(gio.types.DBusInterfaceSkeletonFlags propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.types.DBusInterfaceSkeletonFlags)("g-flags", propval);
  }

  mixin DBusInterfaceT!();

  /**
      Exports interface_ at object_path on connection.
      
      This can be called multiple times to export the same interface_
      onto multiple connections however the object_path provided must be
      the same for all connections.
      
      Use [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.unexport] to unexport the object.
  
      Params:
        connection = A #GDBusConnection to export interface_ on.
        objectPath = The path to export the interface at.
      Returns: true if the interface was exported on connection, otherwise false with
        error set.
      Throws: [ErrorWrap]
  */
  bool export_(gio.dbus_connection.DBusConnection connection, string objectPath)
  {
    bool _retval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_dbus_interface_skeleton_export(cast(GDBusInterfaceSkeleton*)this._cPtr, connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, _objectPath, &_err);
    if (_err)
      throw new ErrorWrap(_err);
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
  void flush()
  {
    g_dbus_interface_skeleton_flush(cast(GDBusInterfaceSkeleton*)this._cPtr);
  }

  /**
      Gets the first connection that interface_ is exported on, if any.
      Returns: A #GDBusConnection or null if interface_ is
        not exported anywhere. Do not free, the object belongs to interface_.
  */
  gio.dbus_connection.DBusConnection getConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_interface_skeleton_get_connection(cast(GDBusInterfaceSkeleton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a list of the connections that interface_ is exported on.
      Returns: A list of
          all the connections that interface_ is exported on. The returned
          list should be freed with [glib.list.List.free] after each element has
          been freed with [gobject.object.ObjectWrap.unref].
  */
  gio.dbus_connection.DBusConnection[] getConnections()
  {
    GList* _cretval;
    _cretval = g_dbus_interface_skeleton_get_connections(cast(GDBusInterfaceSkeleton*)this._cPtr);
    auto _retval = gListToD!(gio.dbus_connection.DBusConnection, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the #GDBusInterfaceSkeletonFlags that describes what the behavior
      of interface_
      Returns: One or more flags from the #GDBusInterfaceSkeletonFlags enumeration.
  */
  gio.types.DBusInterfaceSkeletonFlags getFlags()
  {
    GDBusInterfaceSkeletonFlags _cretval;
    _cretval = g_dbus_interface_skeleton_get_flags(cast(GDBusInterfaceSkeleton*)this._cPtr);
    gio.types.DBusInterfaceSkeletonFlags _retval = cast(gio.types.DBusInterfaceSkeletonFlags)_cretval;
    return _retval;
  }

  /**
      Gets D-Bus introspection information for the D-Bus interface
      implemented by interface_.
      Returns: A #GDBusInterfaceInfo (never null). Do not free.
  */
  gio.dbus_interface_info.DBusInterfaceInfo getInfo()
  {
    GDBusInterfaceInfo* _cretval;
    _cretval = g_dbus_interface_skeleton_get_info(cast(GDBusInterfaceSkeleton*)this._cPtr);
    auto _retval = _cretval ? new gio.dbus_interface_info.DBusInterfaceInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the object path that interface_ is exported on, if any.
      Returns: A string owned by interface_ or null if interface_ is not exported
        anywhere. Do not free, the string belongs to interface_.
  */
  string getObjectPath()
  {
    const(char)* _cretval;
    _cretval = g_dbus_interface_skeleton_get_object_path(cast(GDBusInterfaceSkeleton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets all D-Bus properties for interface_.
      Returns: A #GVariant of type
        ['a{sv}'][G-VARIANT-TYPE-VARDICT:CAPS].
        Free with [glib.variant.Variant.unref].
  */
  glib.variant.Variant getProperties()
  {
    GVariant* _cretval;
    _cretval = g_dbus_interface_skeleton_get_properties(cast(GDBusInterfaceSkeleton*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the interface vtable for the D-Bus interface implemented by
      interface_. The returned function pointers should expect interface_
      itself to be passed as user_data.
      Returns: the vtable of the D-Bus interface implemented by the skeleton
  */
  gio.types.DBusInterfaceVTable getVtable()
  {
    GDBusInterfaceVTable* _cretval;
    _cretval = g_dbus_interface_skeleton_get_vtable(cast(GDBusInterfaceSkeleton*)this._cPtr);
    gio.types.DBusInterfaceVTable _retval;
    if (_cretval)
      _retval = *cast(gio.types.DBusInterfaceVTable*)_cretval;
    return _retval;
  }

  /**
      Checks if interface_ is exported on connection.
  
      Params:
        connection = A #GDBusConnection.
      Returns: true if interface_ is exported on connection, false otherwise.
  */
  bool hasConnection(gio.dbus_connection.DBusConnection connection)
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
  void setFlags(gio.types.DBusInterfaceSkeletonFlags flags)
  {
    g_dbus_interface_skeleton_set_flags(cast(GDBusInterfaceSkeleton*)this._cPtr, flags);
  }

  /**
      Stops exporting interface_ on all connections it is exported on.
      
      To unexport interface_ from only a single connection, use
      [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.unexportFromConnection]
  */
  void unexport()
  {
    g_dbus_interface_skeleton_unexport(cast(GDBusInterfaceSkeleton*)this._cPtr);
  }

  /**
      Stops exporting interface_ on connection.
      
      To stop exporting on all connections the interface is exported on,
      use [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.unexport].
  
      Params:
        connection = A #GDBusConnection.
  */
  void unexportFromConnection(gio.dbus_connection.DBusConnection connection)
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
        [gio.dbus_method_invocation.DBusMethodInvocation.returnError]).
        
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
        [gio.types.DBusInterfaceSkeletonFlags.HandleMethodInvocationsInThread]
        flags set, no dedicated thread is ever used and the call will be
        handled in the same thread as the object that interface belongs
        to was exported in.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gio.dbus_method_invocation.DBusMethodInvocation invocation, gio.dbus_interface_skeleton.DBusInterfaceSkeleton dBusInterfaceSkeleton))
  
          `invocation` A #GDBusMethodInvocation. (optional)
  
          `dBusInterfaceSkeleton` the instance the signal is connected to (optional)
  
          `Returns` true if the call is authorized, false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGAuthorizeMethod(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_method_invocation.DBusMethodInvocation)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_interface_skeleton.DBusInterfaceSkeleton)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("g-authorize-method", closure, after);
  }
}
