/// Module for [DBusObjectManagerClient] class
module gio.dbus_object_manager_client;

import gid.gid;
import gio.async_initable;
import gio.async_initable_mixin;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.dbus_connection;
import gio.dbus_object_manager;
import gio.dbus_object_manager_mixin;
import gio.dbus_object_proxy;
import gio.dbus_proxy;
import gio.initable;
import gio.initable_mixin;
import gio.types;
import glib.error;
import glib.variant;
import gobject.dclosure;
import gobject.object;
import gobject.types;

/**
    [gio.dbus_object_manager_client.DBusObjectManagerClient] is used to create, monitor and delete object
    proxies for remote objects exported by a [gio.dbus_object_manager_server.DBusObjectManagerServer]
    (or any code implementing the
    [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
    interface).
    
    Once an instance of this type has been created, you can connect to
    the `signal@Gio.DBusObjectManager::object-added` and
    `signal@Gio.DBusObjectManager::object-removed signals` and inspect the
    [gio.dbus_object_proxy.DBusObjectProxy] objects returned by
    [gio.dbus_object_manager.DBusObjectManager.getObjects].
    
    If the name for a [gio.dbus_object_manager_client.DBusObjectManagerClient] is not owned by anyone at
    object construction time, the default behavior is to request the
    message bus to launch an owner for the name. This behavior can be
    disabled using the [gio.types.DBusObjectManagerClientFlags.DoNotAutoStart]
    flag. It’s also worth noting that this only works if the name of
    interest is activatable in the first place. E.g. in some cases it
    is not possible to launch an owner for the requested name. In this
    case, [gio.dbus_object_manager_client.DBusObjectManagerClient] object construction still succeeds but
    there will be no object proxies
    (e.g. [gio.dbus_object_manager.DBusObjectManager.getObjects] returns the empty list) and
    the [gio.dbus_object_manager_client.DBusObjectManagerClient.name] property is `NULL`.
    
    The owner of the requested name can come and go (for example
    consider a system service being restarted) – [gio.dbus_object_manager_client.DBusObjectManagerClient]
    handles this case too; simply connect to the [gobject.object.ObjectWrap.notify]
    signal to watch for changes on the
    [gio.dbus_object_manager_client.DBusObjectManagerClient.name] property. When the name
    owner vanishes, the behavior is that
    [gio.dbus_object_manager_client.DBusObjectManagerClient.name] is set to `NULL` (this
    includes emission of the [gobject.object.ObjectWrap.notify] signal) and then
    `signal@Gio.DBusObjectManager::object-removed` signals are synthesized
    for all currently existing object proxies. Since
    [gio.dbus_object_manager_client.DBusObjectManagerClient.name] is `NULL` when this
    happens, you can use this information to disambiguate a synthesized signal
    from a genuine signal caused by object removal on the remote
    [gio.dbus_object_manager.DBusObjectManager]. Similarly, when a new name owner appears,
    `signal@Gio.DBusObjectManager::object-added` signals are synthesized
    while [gio.dbus_object_manager_client.DBusObjectManagerClient.name] is still `NULL`. Only
    when all object proxies have been added, the
    [gio.dbus_object_manager_client.DBusObjectManagerClient.name] is set to the new name
    owner (this includes emission of the [gobject.object.ObjectWrap.notify] signal).
    Furthermore, you are guaranteed that
    [gio.dbus_object_manager_client.DBusObjectManagerClient.name] will alternate between a
    name owner (e.g. `:1.42`) and `NULL` even in the case where
    the name of interest is atomically replaced
    
    Ultimately, [gio.dbus_object_manager_client.DBusObjectManagerClient] is used to obtain
    [gio.dbus_proxy.DBusProxy] instances. All signals (including the
    `org.freedesktop.DBus.Properties::PropertiesChanged` signal)
    delivered to [gio.dbus_proxy.DBusProxy] instances are guaranteed to originate
    from the name owner. This guarantee along with the behavior
    described above, means that certain race conditions including the
    “half the proxy is from the old owner and the other half is from
    the new owner” problem cannot happen.
    
    To avoid having the application connect to signals on the returned
    [gio.dbus_object_proxy.DBusObjectProxy] and [gio.dbus_proxy.DBusProxy] objects, the
    `signal@Gio.DBusObject::interface-added`,
    `signal@Gio.DBusObject::interface-removed`,
    `signal@Gio.DBusProxy::g-properties-changed` and
    `signal@Gio.DBusProxy::g-signal` signals
    are also emitted on the [gio.dbus_object_manager_client.DBusObjectManagerClient] instance managing these
    objects. The signals emitted are
    `signal@Gio.DBusObjectManager::interface-added`,
    `signal@Gio.DBusObjectManager::interface-removed`,
    `signal@Gio.DBusObjectManagerClient::interface-proxy-properties-changed` and
    `signal@Gio.DBusObjectManagerClient::interface-proxy-signal`.
    
    Note that all callbacks and signals are emitted in the
    thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault]) that the
    [gio.dbus_object_manager_client.DBusObjectManagerClient] object was constructed in. Additionally, the
    [gio.dbus_object_proxy.DBusObjectProxy] and [gio.dbus_proxy.DBusProxy] objects
    originating from the [gio.dbus_object_manager_client.DBusObjectManagerClient] object will be created in
    the same context and, consequently, will deliver signals in the
    same main loop.
*/
class DBusObjectManagerClient : gobject.object.ObjectWrap, gio.async_initable.AsyncInitable, gio.dbus_object_manager.DBusObjectManager, gio.initable.Initable
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
    return cast(void function())g_dbus_object_manager_client_get_type != &gidSymbolNotFound ? g_dbus_object_manager_client_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusObjectManagerClient self()
  {
    return this;
  }

  /**
      Get `nameOwner` property.
      Returns: The unique name that owns #GDBusObjectManagerClient:name or null if
        no-one is currently owning the name. Connect to the
        #GObject::notify signal to track changes to this property.
  */
  @property string nameOwner()
  {
    return getNameOwner();
  }

  mixin AsyncInitableT!();
  mixin DBusObjectManagerT!();
  mixin InitableT!();

  /**
      Finishes an operation started with [gio.dbus_object_manager_client.DBusObjectManagerClient.new_].
  
      Params:
        res = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [gio.dbus_object_manager_client.DBusObjectManagerClient.new_].
      Returns: A
          #GDBusObjectManagerClient object or null if error is set. Free
          with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_object_manager_client.DBusObjectManagerClient newFinish(gio.async_result.AsyncResult res)
  {
    GDBusObjectManager* _cretval;
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_finish(res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_object_manager_client.DBusObjectManagerClient)(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finishes an operation started with [gio.dbus_object_manager_client.DBusObjectManagerClient.newForBus].
  
      Params:
        res = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [gio.dbus_object_manager_client.DBusObjectManagerClient.newForBus].
      Returns: A
          #GDBusObjectManagerClient object or null if error is set. Free
          with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_object_manager_client.DBusObjectManagerClient newForBusFinish(gio.async_result.AsyncResult res)
  {
    GDBusObjectManager* _cretval;
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_for_bus_finish(res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_object_manager_client.DBusObjectManagerClient)(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Like [gio.dbus_object_manager_client.DBusObjectManagerClient.newSync] but takes a #GBusType instead
      of a #GDBusConnection.
      
      This is a synchronous failable constructor - the calling thread is
      blocked until a reply is received. See [gio.dbus_object_manager_client.DBusObjectManagerClient.newForBus]
      for the asynchronous version.
  
      Params:
        busType = A #GBusType.
        flags = Zero or more flags from the #GDBusObjectManagerClientFlags enumeration.
        name = The owner of the control object (unique or well-known name).
        objectPath = The object path of the control object.
        getProxyTypeFunc = A #GDBusProxyTypeFunc function or null to always construct #GDBusProxy proxies.
        cancellable = A #GCancellable or null
      Returns: A
          #GDBusObjectManagerClient object or null if error is set. Free
          with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_object_manager_client.DBusObjectManagerClient newForBusSync(gio.types.BusType busType, gio.types.DBusObjectManagerClientFlags flags, string name, string objectPath, gio.types.DBusProxyTypeFunc getProxyTypeFunc = null, gio.cancellable.Cancellable cancellable = null)
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data)
    {
      gobject.types.GType _dretval;
      auto _dlg = cast(gio.types.DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString(No.Free);
      string _interfaceName = interfaceName.fromCString(No.Free);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.dbus_object_manager_client.DBusObjectManagerClient)(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      auto _retval = cast(GType)_dretval;

      return _retval;
    }
    auto _getProxyTypeFuncCB = getProxyTypeFunc ? &_getProxyTypeFuncCallback : null;
    GDBusObjectManager* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    auto _getProxyTypeFunc = getProxyTypeFunc ? freezeDelegate(cast(void*)&getProxyTypeFunc) : null;
    GDestroyNotify _getProxyTypeFuncDestroyCB = getProxyTypeFunc ? &thawDelegate : null;
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_for_bus_sync(busType, flags, _name, _objectPath, _getProxyTypeFuncCB, _getProxyTypeFunc, _getProxyTypeFuncDestroyCB, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_object_manager_client.DBusObjectManagerClient)(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GDBusObjectManagerClient object.
      
      This is a synchronous failable constructor - the calling thread is
      blocked until a reply is received. See [gio.dbus_object_manager_client.DBusObjectManagerClient.new_]
      for the asynchronous version.
  
      Params:
        connection = A #GDBusConnection.
        flags = Zero or more flags from the #GDBusObjectManagerClientFlags enumeration.
        name = The owner of the control object (unique or well-known name), or null when not using a message bus connection.
        objectPath = The object path of the control object.
        getProxyTypeFunc = A #GDBusProxyTypeFunc function or null to always construct #GDBusProxy proxies.
        cancellable = A #GCancellable or null
      Returns: A
          #GDBusObjectManagerClient object or null if error is set. Free
          with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_object_manager_client.DBusObjectManagerClient newSync(gio.dbus_connection.DBusConnection connection, gio.types.DBusObjectManagerClientFlags flags, string name, string objectPath, gio.types.DBusProxyTypeFunc getProxyTypeFunc = null, gio.cancellable.Cancellable cancellable = null)
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data)
    {
      gobject.types.GType _dretval;
      auto _dlg = cast(gio.types.DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString(No.Free);
      string _interfaceName = interfaceName.fromCString(No.Free);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.dbus_object_manager_client.DBusObjectManagerClient)(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      auto _retval = cast(GType)_dretval;

      return _retval;
    }
    auto _getProxyTypeFuncCB = getProxyTypeFunc ? &_getProxyTypeFuncCallback : null;
    GDBusObjectManager* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    auto _getProxyTypeFunc = getProxyTypeFunc ? freezeDelegate(cast(void*)&getProxyTypeFunc) : null;
    GDestroyNotify _getProxyTypeFuncDestroyCB = getProxyTypeFunc ? &thawDelegate : null;
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_sync(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, flags, _name, _objectPath, _getProxyTypeFuncCB, _getProxyTypeFunc, _getProxyTypeFuncDestroyCB, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_object_manager_client.DBusObjectManagerClient)(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a new #GDBusObjectManagerClient object.
      
      This is an asynchronous failable constructor. When the result is
      ready, callback will be invoked in the
      [thread-default main context][g-main-context-push-thread-default]
      of the thread you are calling this method from. You can
      then call [gio.dbus_object_manager_client.DBusObjectManagerClient.newFinish] to get the result. See
      [gio.dbus_object_manager_client.DBusObjectManagerClient.newSync] for the synchronous version.
  
      Params:
        connection = A #GDBusConnection.
        flags = Zero or more flags from the #GDBusObjectManagerClientFlags enumeration.
        name = The owner of the control object (unique or well-known name).
        objectPath = The object path of the control object.
        getProxyTypeFunc = A #GDBusProxyTypeFunc function or null to always construct #GDBusProxy proxies.
        cancellable = A #GCancellable or null
        callback = A #GAsyncReadyCallback to call when the request is satisfied.
  */
  static void new_(gio.dbus_connection.DBusConnection connection, gio.types.DBusObjectManagerClientFlags flags, string name, string objectPath, gio.types.DBusProxyTypeFunc getProxyTypeFunc = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data)
    {
      gobject.types.GType _dretval;
      auto _dlg = cast(gio.types.DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString(No.Free);
      string _interfaceName = interfaceName.fromCString(No.Free);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.dbus_object_manager_client.DBusObjectManagerClient)(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      auto _retval = cast(GType)_dretval;

      return _retval;
    }
    auto _getProxyTypeFuncCB = getProxyTypeFunc ? &_getProxyTypeFuncCallback : null;
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    auto _getProxyTypeFunc = getProxyTypeFunc ? freezeDelegate(cast(void*)&getProxyTypeFunc) : null;
    GDestroyNotify _getProxyTypeFuncDestroyCB = getProxyTypeFunc ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_object_manager_client_new(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, flags, _name, _objectPath, _getProxyTypeFuncCB, _getProxyTypeFunc, _getProxyTypeFuncDestroyCB, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Like [gio.dbus_object_manager_client.DBusObjectManagerClient.new_] but takes a #GBusType instead of a
      #GDBusConnection.
      
      This is an asynchronous failable constructor. When the result is
      ready, callback will be invoked in the
      [thread-default main loop][g-main-context-push-thread-default]
      of the thread you are calling this method from. You can
      then call [gio.dbus_object_manager_client.DBusObjectManagerClient.newForBusFinish] to get the result. See
      [gio.dbus_object_manager_client.DBusObjectManagerClient.newForBusSync] for the synchronous version.
  
      Params:
        busType = A #GBusType.
        flags = Zero or more flags from the #GDBusObjectManagerClientFlags enumeration.
        name = The owner of the control object (unique or well-known name).
        objectPath = The object path of the control object.
        getProxyTypeFunc = A #GDBusProxyTypeFunc function or null to always construct #GDBusProxy proxies.
        cancellable = A #GCancellable or null
        callback = A #GAsyncReadyCallback to call when the request is satisfied.
  */
  static void newForBus(gio.types.BusType busType, gio.types.DBusObjectManagerClientFlags flags, string name, string objectPath, gio.types.DBusProxyTypeFunc getProxyTypeFunc = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data)
    {
      gobject.types.GType _dretval;
      auto _dlg = cast(gio.types.DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString(No.Free);
      string _interfaceName = interfaceName.fromCString(No.Free);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.dbus_object_manager_client.DBusObjectManagerClient)(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      auto _retval = cast(GType)_dretval;

      return _retval;
    }
    auto _getProxyTypeFuncCB = getProxyTypeFunc ? &_getProxyTypeFuncCallback : null;
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    auto _getProxyTypeFunc = getProxyTypeFunc ? freezeDelegate(cast(void*)&getProxyTypeFunc) : null;
    GDestroyNotify _getProxyTypeFuncDestroyCB = getProxyTypeFunc ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_object_manager_client_new_for_bus(busType, flags, _name, _objectPath, _getProxyTypeFuncCB, _getProxyTypeFunc, _getProxyTypeFuncDestroyCB, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Gets the #GDBusConnection used by manager.
      Returns: A #GDBusConnection object. Do not free,
          the object belongs to manager.
  */
  gio.dbus_connection.DBusConnection getConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_object_manager_client_get_connection(cast(GDBusObjectManagerClient*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the flags that manager was constructed with.
      Returns: Zero of more flags from the #GDBusObjectManagerClientFlags
        enumeration.
  */
  gio.types.DBusObjectManagerClientFlags getFlags()
  {
    GDBusObjectManagerClientFlags _cretval;
    _cretval = g_dbus_object_manager_client_get_flags(cast(GDBusObjectManagerClient*)this._cPtr);
    gio.types.DBusObjectManagerClientFlags _retval = cast(gio.types.DBusObjectManagerClientFlags)_cretval;
    return _retval;
  }

  /**
      Gets the name that manager is for, or null if not a message bus
      connection.
      Returns: A unique or well-known name. Do not free, the string
        belongs to manager.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_dbus_object_manager_client_get_name(cast(GDBusObjectManagerClient*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      The unique name that owns the name that manager is for or null if
      no-one currently owns that name. You can connect to the
      #GObject::notify signal to track changes to the
      #GDBusObjectManagerClient:name-owner property.
      Returns: The name owner or null if no name owner
        exists. Free with [glib.global.gfree].
  */
  string getNameOwner()
  {
    char* _cretval;
    _cretval = g_dbus_object_manager_client_get_name_owner(cast(GDBusObjectManagerClient*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Connect to `InterfaceProxyPropertiesChanged` signal.
  
      Emitted when one or more D-Bus properties on proxy changes. The
        local cache has already been updated when this signal fires. Note
        that both changed_properties and invalidated_properties are
        guaranteed to never be null (either may be empty though).
        
        This signal exists purely as a convenience to avoid having to
        connect signals to all interface proxies managed by manager.
        
        This signal is emitted in the
        [thread-default main context][g-main-context-push-thread-default]
        that manager was constructed in.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.dbus_object_proxy.DBusObjectProxy objectProxy, gio.dbus_proxy.DBusProxy interfaceProxy, glib.variant.Variant changedProperties, string[] invalidatedProperties, gio.dbus_object_manager_client.DBusObjectManagerClient dBusObjectManagerClient))
  
          `objectProxy` The #GDBusObjectProxy on which an interface has properties that are changing. (optional)
  
          `interfaceProxy` The #GDBusProxy that has properties that are changing. (optional)
  
          `changedProperties` A #GVariant containing the properties that changed (type: `a{sv}`). (optional)
  
          `invalidatedProperties` A null terminated
              array of properties that were invalidated. (optional)
  
          `dBusObjectManagerClient` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInterfaceProxyPropertiesChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_object_proxy.DBusObjectProxy)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_proxy.DBusProxy)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == glib.variant.Variant)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == string[])))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gio.dbus_object_manager_client.DBusObjectManagerClient)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);


      static if (Parameters!T.length > 3)
      {
        auto _cArray = getVal!(char**)(&_paramVals[4]);
        string[] _dArray;
        uint _leninvalidatedProperties;
        if (_cArray)
          for (; _cArray[_leninvalidatedProperties] !is null; _leninvalidatedProperties++)
          break;
        foreach (i; 0 .. _leninvalidatedProperties)
          _dArray ~= _cArray[i].fromCString(No.Free);
        _paramTuple[3] = _dArray;
      }
      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-proxy-properties-changed", closure, after);
  }

  /**
      Connect to `InterfaceProxySignal` signal.
  
      Emitted when a D-Bus signal is received on interface_proxy.
        
        This signal exists purely as a convenience to avoid having to
        connect signals to all interface proxies managed by manager.
        
        This signal is emitted in the
        [thread-default main context][g-main-context-push-thread-default]
        that manager was constructed in.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.dbus_object_proxy.DBusObjectProxy objectProxy, gio.dbus_proxy.DBusProxy interfaceProxy, string senderName, string signalName, glib.variant.Variant parameters, gio.dbus_object_manager_client.DBusObjectManagerClient dBusObjectManagerClient))
  
          `objectProxy` The #GDBusObjectProxy on which an interface is emitting a D-Bus signal. (optional)
  
          `interfaceProxy` The #GDBusProxy that is emitting a D-Bus signal. (optional)
  
          `senderName` The sender of the signal or NULL if the connection is not a bus connection. (optional)
  
          `signalName` The signal name. (optional)
  
          `parameters` A #GVariant tuple with parameters for the signal. (optional)
  
          `dBusObjectManagerClient` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInterfaceProxySignal(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_object_proxy.DBusObjectProxy)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_proxy.DBusProxy)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == string)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == string)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] == glib.variant.Variant)))
  && (Parameters!T.length < 6 || (ParameterStorageClassTuple!T[5] == ParameterStorageClass.none && is(Parameters!T[5] : gio.dbus_object_manager_client.DBusObjectManagerClient)))
  && Parameters!T.length < 7)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 6, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);


      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[5]);

      static if (Parameters!T.length > 5)
        _paramTuple[5] = getVal!(Parameters!T[5])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-proxy-signal", closure, after);
  }
}
