module Gio.DBusObjectManagerClient;

import GLib.ErrorG;
import GLib.VariantG;
import GObject.DClosure;
import GObject.ObjectG;
import Gid.gid;
import Gio.AsyncInitable;
import Gio.AsyncInitableT;
import Gio.AsyncResult;
import Gio.AsyncResultT;
import Gio.Cancellable;
import Gio.DBusConnection;
import Gio.DBusObjectManager;
import Gio.DBusObjectManagerT;
import Gio.DBusObjectProxy;
import Gio.DBusProxy;
import Gio.Initable;
import Gio.InitableT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GDBusObjectManagerClient` is used to create, monitor and delete object
 * proxies for remote objects exported by a [Gio.DBusObjectManagerServer]
 * $(LPAREN)or any code implementing the
 * [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
 * interface$(RPAREN).
 * Once an instance of this type has been created, you can connect to
 * the signal@Gio.DBusObjectManager::object-added and
 * signal@Gio.DBusObjectManager::object-removed signals and inspect the
 * [Gio.DBusObjectProxy] objects returned by
 * [Gio.DBusObjectManager.getObjects].
 * If the name for a `GDBusObjectManagerClient` is not owned by anyone at
 * object construction time, the default behavior is to request the
 * message bus to launch an owner for the name. This behavior can be
 * disabled using the `G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_DO_NOT_AUTO_START`
 * flag. It’s also worth noting that this only works if the name of
 * interest is activatable in the first place. E.g. in some cases it
 * is not possible to launch an owner for the requested name. In this
 * case, `GDBusObjectManagerClient` object construction still succeeds but
 * there will be no object proxies
 * $(LPAREN)e.g. [Gio.DBusObjectManager.getObjects] returns the empty list$(RPAREN) and
 * the [Gio.DBusObjectManagerClient.name] property is `NULL`.
 * The owner of the requested name can come and go $(LPAREN)for example
 * consider a system service being restarted$(RPAREN) – `GDBusObjectManagerClient`
 * handles this case too; simply connect to the [GObject.ObjectG.notify]
 * signal to watch for changes on the
 * [Gio.DBusObjectManagerClient.name] property. When the name
 * owner vanishes, the behavior is that
 * [Gio.DBusObjectManagerClient.name] is set to `NULL` $(LPAREN)this
 * includes emission of the [GObject.ObjectG.notify] signal$(RPAREN) and then
 * signal@Gio.DBusObjectManager::object-removed signals are synthesized
 * for all currently existing object proxies. Since
 * [Gio.DBusObjectManagerClient.name] is `NULL` when this
 * happens, you can use this information to disambiguate a synthesized signal
 * from a genuine signal caused by object removal on the remote
 * [Gio.DBusObjectManager]. Similarly, when a new name owner appears,
 * signal@Gio.DBusObjectManager::object-added signals are synthesized
 * while [Gio.DBusObjectManagerClient.name] is still `NULL`. Only
 * when all object proxies have been added, the
 * [Gio.DBusObjectManagerClient.name] is set to the new name
 * owner $(LPAREN)this includes emission of the [GObject.ObjectG.notify] signal$(RPAREN).
 * Furthermore, you are guaranteed that
 * [Gio.DBusObjectManagerClient.name] will alternate between a
 * name owner $(LPAREN)e.g. `:1.42`$(RPAREN) and `NULL` even in the case where
 * the name of interest is atomically replaced
 * Ultimately, `GDBusObjectManagerClient` is used to obtain
 * [Gio.DBusProxy] instances. All signals $(LPAREN)including the
 * `org.freedesktop.DBus.Properties::PropertiesChanged` signal$(RPAREN)
 * delivered to [Gio.DBusProxy] instances are guaranteed to originate
 * from the name owner. This guarantee along with the behavior
 * described above, means that certain race conditions including the
 * “half the proxy is from the old owner and the other half is from
 * the new owner” problem cannot happen.
 * To avoid having the application connect to signals on the returned
 * [Gio.DBusObjectProxy] and [Gio.DBusProxy] objects, the
 * signal@Gio.DBusObject::interface-added,
 * signal@Gio.DBusObject::interface-removed,
 * signal@Gio.DBusProxy::g-properties-changed and
 * signal@Gio.DBusProxy::g-signal signals
 * are also emitted on the `GDBusObjectManagerClient` instance managing these
 * objects. The signals emitted are
 * signal@Gio.DBusObjectManager::interface-added,
 * signal@Gio.DBusObjectManager::interface-removed,
 * signal@Gio.DBusObjectManagerClient::interface-proxy-properties-changed and
 * signal@Gio.DBusObjectManagerClient::interface-proxy-signal.
 * Note that all callbacks and signals are emitted in the
 * thread-default main context $(LPAREN)see
 * [GLib.MainContext.pushThreadDefault]$(RPAREN) that the
 * `GDBusObjectManagerClient` object was constructed in. Additionally, the
 * [Gio.DBusObjectProxy] and [Gio.DBusProxy] objects
 * originating from the `GDBusObjectManagerClient` object will be created in
 * the same context and, consequently, will deliver signals in the
 * same main loop.
 */
class DBusObjectManagerClient : ObjectG, AsyncInitable, DBusObjectManager, Initable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_object_manager_client_get_type != &gidSymbolNotFound ? g_dbus_object_manager_client_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin AsyncInitableT!();
  mixin DBusObjectManagerT!();
  mixin InitableT!();

  /**
   * Finishes an operation started with [Gio.DBusObjectManagerClient.new_].
   * Params:
   *   res = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [Gio.DBusObjectManagerClient.new_].
   * Returns: A
   *   #GDBusObjectManagerClient object or %NULL if error is set. Free
   *   with [GObject.ObjectG.unref].
   */
  static DBusObjectManagerClient newFinish(AsyncResult res)
  {
    GDBusObjectManager* _cretval;
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_finish(res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!DBusObjectManagerClient(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Finishes an operation started with [Gio.DBusObjectManagerClient.newForBus].
   * Params:
   *   res = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [Gio.DBusObjectManagerClient.newForBus].
   * Returns: A
   *   #GDBusObjectManagerClient object or %NULL if error is set. Free
   *   with [GObject.ObjectG.unref].
   */
  static DBusObjectManagerClient newForBusFinish(AsyncResult res)
  {
    GDBusObjectManager* _cretval;
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_for_bus_finish(res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!DBusObjectManagerClient(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Like [Gio.DBusObjectManagerClient.newSync] but takes a #GBusType instead
   * of a #GDBusConnection.
   * This is a synchronous failable constructor - the calling thread is
   * blocked until a reply is received. See [Gio.DBusObjectManagerClient.newForBus]
   * for the asynchronous version.
   * Params:
   *   busType = A #GBusType.
   *   flags = Zero or more flags from the #GDBusObjectManagerClientFlags enumeration.
   *   name = The owner of the control object $(LPAREN)unique or well-known name$(RPAREN).
   *   objectPath = The object path of the control object.
   *   getProxyTypeFunc = A #GDBusProxyTypeFunc function or %NULL to always construct #GDBusProxy proxies.
   *   cancellable = A #GCancellable or %NULL
   * Returns: A
   *   #GDBusObjectManagerClient object or %NULL if error is set. Free
   *   with [GObject.ObjectG.unref].
   */
  static DBusObjectManagerClient newForBusSync(BusType busType, DBusObjectManagerClientFlags flags, string name, string objectPath, DBusProxyTypeFunc getProxyTypeFunc, Cancellable cancellable)
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data)
    {
      auto _dlg = cast(DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString(No.Free);
      string _interfaceName = interfaceName.fromCString(No.Free);

      GType _retval = (*_dlg)(ObjectG.getDObject!DBusObjectManagerClient(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      return _retval;
    }

    GDBusObjectManager* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    auto _getProxyTypeFunc = freezeDelegate(cast(void*)&getProxyTypeFunc);
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_for_bus_sync(busType, flags, _name, _objectPath, &_getProxyTypeFuncCallback, _getProxyTypeFunc, &thawDelegate, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!DBusObjectManagerClient(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a new #GDBusObjectManagerClient object.
   * This is a synchronous failable constructor - the calling thread is
   * blocked until a reply is received. See [Gio.DBusObjectManagerClient.new_]
   * for the asynchronous version.
   * Params:
   *   connection = A #GDBusConnection.
   *   flags = Zero or more flags from the #GDBusObjectManagerClientFlags enumeration.
   *   name = The owner of the control object $(LPAREN)unique or well-known name$(RPAREN), or %NULL when not using a message bus connection.
   *   objectPath = The object path of the control object.
   *   getProxyTypeFunc = A #GDBusProxyTypeFunc function or %NULL to always construct #GDBusProxy proxies.
   *   cancellable = A #GCancellable or %NULL
   * Returns: A
   *   #GDBusObjectManagerClient object or %NULL if error is set. Free
   *   with [GObject.ObjectG.unref].
   */
  static DBusObjectManagerClient newSync(DBusConnection connection, DBusObjectManagerClientFlags flags, string name, string objectPath, DBusProxyTypeFunc getProxyTypeFunc, Cancellable cancellable)
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data)
    {
      auto _dlg = cast(DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString(No.Free);
      string _interfaceName = interfaceName.fromCString(No.Free);

      GType _retval = (*_dlg)(ObjectG.getDObject!DBusObjectManagerClient(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      return _retval;
    }

    GDBusObjectManager* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    auto _getProxyTypeFunc = freezeDelegate(cast(void*)&getProxyTypeFunc);
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_sync(connection ? cast(GDBusConnection*)connection.cPtr(No.Dup) : null, flags, _name, _objectPath, &_getProxyTypeFuncCallback, _getProxyTypeFunc, &thawDelegate, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!DBusObjectManagerClient(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Asynchronously creates a new #GDBusObjectManagerClient object.
   * This is an asynchronous failable constructor. When the result is
   * ready, callback will be invoked in the
   * [thread-default main context][g-main-context-push-thread-default]
   * of the thread you are calling this method from. You can
   * then call [Gio.DBusObjectManagerClient.newFinish] to get the result. See
   * [Gio.DBusObjectManagerClient.newSync] for the synchronous version.
   * Params:
   *   connection = A #GDBusConnection.
   *   flags = Zero or more flags from the #GDBusObjectManagerClientFlags enumeration.
   *   name = The owner of the control object $(LPAREN)unique or well-known name$(RPAREN).
   *   objectPath = The object path of the control object.
   *   getProxyTypeFunc = A #GDBusProxyTypeFunc function or %NULL to always construct #GDBusProxy proxies.
   *   cancellable = A #GCancellable or %NULL
   *   callback = A #GAsyncReadyCallback to call when the request is satisfied.
   */
  static void new_(DBusConnection connection, DBusObjectManagerClientFlags flags, string name, string objectPath, DBusProxyTypeFunc getProxyTypeFunc, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data)
    {
      auto _dlg = cast(DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString(No.Free);
      string _interfaceName = interfaceName.fromCString(No.Free);

      GType _retval = (*_dlg)(ObjectG.getDObject!DBusObjectManagerClient(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      return _retval;
    }

    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }

    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    auto _getProxyTypeFunc = freezeDelegate(cast(void*)&getProxyTypeFunc);
    auto _callback = freezeDelegate(cast(void*)&callback);
    g_dbus_object_manager_client_new(connection ? cast(GDBusConnection*)connection.cPtr(No.Dup) : null, flags, _name, _objectPath, &_getProxyTypeFuncCallback, _getProxyTypeFunc, &thawDelegate, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_callbackCallback, _callback);
  }

  /**
   * Like [Gio.DBusObjectManagerClient.new_] but takes a #GBusType instead of a
   * #GDBusConnection.
   * This is an asynchronous failable constructor. When the result is
   * ready, callback will be invoked in the
   * [thread-default main loop][g-main-context-push-thread-default]
   * of the thread you are calling this method from. You can
   * then call [Gio.DBusObjectManagerClient.newForBusFinish] to get the result. See
   * [Gio.DBusObjectManagerClient.newForBusSync] for the synchronous version.
   * Params:
   *   busType = A #GBusType.
   *   flags = Zero or more flags from the #GDBusObjectManagerClientFlags enumeration.
   *   name = The owner of the control object $(LPAREN)unique or well-known name$(RPAREN).
   *   objectPath = The object path of the control object.
   *   getProxyTypeFunc = A #GDBusProxyTypeFunc function or %NULL to always construct #GDBusProxy proxies.
   *   cancellable = A #GCancellable or %NULL
   *   callback = A #GAsyncReadyCallback to call when the request is satisfied.
   */
  static void newForBus(BusType busType, DBusObjectManagerClientFlags flags, string name, string objectPath, DBusProxyTypeFunc getProxyTypeFunc, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data)
    {
      auto _dlg = cast(DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString(No.Free);
      string _interfaceName = interfaceName.fromCString(No.Free);

      GType _retval = (*_dlg)(ObjectG.getDObject!DBusObjectManagerClient(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      return _retval;
    }

    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }

    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    auto _getProxyTypeFunc = freezeDelegate(cast(void*)&getProxyTypeFunc);
    auto _callback = freezeDelegate(cast(void*)&callback);
    g_dbus_object_manager_client_new_for_bus(busType, flags, _name, _objectPath, &_getProxyTypeFuncCallback, _getProxyTypeFunc, &thawDelegate, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_callbackCallback, _callback);
  }

  /**
   * Gets the #GDBusConnection used by manager.
   * Returns: A #GDBusConnection object. Do not free,
   *   the object belongs to manager.
   */
  DBusConnection getConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_object_manager_client_get_connection(cast(GDBusObjectManagerClient*)cPtr);
    auto _retval = ObjectG.getDObject!DBusConnection(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the flags that manager was constructed with.
   * Returns: Zero of more flags from the #GDBusObjectManagerClientFlags
   *   enumeration.
   */
  DBusObjectManagerClientFlags getFlags()
  {
    GDBusObjectManagerClientFlags _cretval;
    _cretval = g_dbus_object_manager_client_get_flags(cast(GDBusObjectManagerClient*)cPtr);
    DBusObjectManagerClientFlags _retval = cast(DBusObjectManagerClientFlags)_cretval;
    return _retval;
  }

  /**
   * Gets the name that manager is for, or %NULL if not a message bus
   * connection.
   * Returns: A unique or well-known name. Do not free, the string
   *   belongs to manager.
   */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_dbus_object_manager_client_get_name(cast(GDBusObjectManagerClient*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * The unique name that owns the name that manager is for or %NULL if
   * no-one currently owns that name. You can connect to the
   * #GObject::notify signal to track changes to the
   * #GDBusObjectManagerClient:name-owner property.
   * Returns: The name owner or %NULL if no name owner
   *   exists. Free with [GLib.Global.gfree].
   */
  string getNameOwner()
  {
    char* _cretval;
    _cretval = g_dbus_object_manager_client_get_name_owner(cast(GDBusObjectManagerClient*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Emitted when one or more D-Bus properties on proxy changes. The
   * local cache has already been updated when this signal fires. Note
   * that both changed_properties and invalidated_properties are
   * guaranteed to never be %NULL $(LPAREN)either may be empty though$(RPAREN).
   * This signal exists purely as a convenience to avoid having to
   * connect signals to all interface proxies managed by manager.
   * This signal is emitted in the
   * [thread-default main context][g-main-context-push-thread-default]
   * that manager was constructed in.
   * Params
   *   objectProxy = The #GDBusObjectProxy on which an interface has properties that are changing.
   *   interfaceProxy = The #GDBusProxy that has properties that are changing.
   *   changedProperties = A #GVariant containing the properties that changed $(LPAREN)type: `a{sv}`$(RPAREN).
   *   invalidatedProperties = A %NULL terminated
   *     array of properties that were invalidated.
   *   dBusObjectManagerClient = the instance the signal is connected to
   */
  alias InterfaceProxyPropertiesChangedCallbackDlg = void delegate(DBusObjectProxy objectProxy, DBusProxy interfaceProxy, VariantG changedProperties, string[] invalidatedProperties, DBusObjectManagerClient dBusObjectManagerClient);
  alias InterfaceProxyPropertiesChangedCallbackFunc = void function(DBusObjectProxy objectProxy, DBusProxy interfaceProxy, VariantG changedProperties, string[] invalidatedProperties, DBusObjectManagerClient dBusObjectManagerClient);

  /**
   * Connect to InterfaceProxyPropertiesChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectInterfaceProxyPropertiesChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InterfaceProxyPropertiesChangedCallbackDlg) || is(T : InterfaceProxyPropertiesChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dBusObjectManagerClient = getVal!DBusObjectManagerClient(_paramVals);
      auto objectProxy = getVal!DBusObjectProxy(&_paramVals[1]);
      auto interfaceProxy = getVal!DBusProxy(&_paramVals[2]);
      auto changedProperties = getVal!VariantG(&_paramVals[3]);
      auto invalidatedProperties = getVal!(char**)(&_paramVals[4]);
      string[] _invalidatedProperties;
      uint _leninvalidatedProperties;
      if (invalidatedProperties)
        for (; invalidatedProperties[_leninvalidatedProperties] !is null; _leninvalidatedProperties++)
        break;
      foreach (i; 0 .. _leninvalidatedProperties)
        _invalidatedProperties ~= invalidatedProperties[i].fromCString(No.Free);
      _dClosure.dlg(objectProxy, interfaceProxy, changedProperties, _invalidatedProperties, dBusObjectManagerClient);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-proxy-properties-changed", closure, after);
  }

  /**
   * Emitted when a D-Bus signal is received on interface_proxy.
   * This signal exists purely as a convenience to avoid having to
   * connect signals to all interface proxies managed by manager.
   * This signal is emitted in the
   * [thread-default main context][g-main-context-push-thread-default]
   * that manager was constructed in.
   * Params
   *   objectProxy = The #GDBusObjectProxy on which an interface is emitting a D-Bus signal.
   *   interfaceProxy = The #GDBusProxy that is emitting a D-Bus signal.
   *   senderName = The sender of the signal or NULL if the connection is not a bus connection.
   *   signalName = The signal name.
   *   parameters = A #GVariant tuple with parameters for the signal.
   *   dBusObjectManagerClient = the instance the signal is connected to
   */
  alias InterfaceProxySignalCallbackDlg = void delegate(DBusObjectProxy objectProxy, DBusProxy interfaceProxy, string senderName, string signalName, VariantG parameters, DBusObjectManagerClient dBusObjectManagerClient);
  alias InterfaceProxySignalCallbackFunc = void function(DBusObjectProxy objectProxy, DBusProxy interfaceProxy, string senderName, string signalName, VariantG parameters, DBusObjectManagerClient dBusObjectManagerClient);

  /**
   * Connect to InterfaceProxySignal signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectInterfaceProxySignal(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InterfaceProxySignalCallbackDlg) || is(T : InterfaceProxySignalCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 6, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dBusObjectManagerClient = getVal!DBusObjectManagerClient(_paramVals);
      auto objectProxy = getVal!DBusObjectProxy(&_paramVals[1]);
      auto interfaceProxy = getVal!DBusProxy(&_paramVals[2]);
      auto senderName = getVal!string(&_paramVals[3]);
      auto signalName = getVal!string(&_paramVals[4]);
      auto parameters = getVal!VariantG(&_paramVals[5]);
      _dClosure.dlg(objectProxy, interfaceProxy, senderName, signalName, parameters, dBusObjectManagerClient);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-proxy-signal", closure, after);
  }
}
