/// Module for [DBusProxy] class
module gio.dbus_proxy;

import gid.gid;
import gio.async_initable;
import gio.async_initable_mixin;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.dbus_connection;
import gio.dbus_interface;
import gio.dbus_interface_info;
import gio.dbus_interface_mixin;
import gio.initable;
import gio.initable_mixin;
import gio.types;
import gio.unix_fdlist;
import glib.error;
import glib.variant;
import gobject.dclosure;
import gobject.object;

/**
    [gio.dbus_proxy.DBusProxy] is a base class used for proxies to access a D-Bus
    interface on a remote object. A [gio.dbus_proxy.DBusProxy] can be constructed for
    both well-known and unique names.
    
    By default, [gio.dbus_proxy.DBusProxy] will cache all properties (and listen to
    changes) of the remote object, and proxy all signals that get
    emitted. This behaviour can be changed by passing suitable
    [gio.types.DBusProxyFlags] when the proxy is created. If the proxy is for a
    well-known name, the property cache is flushed when the name owner
    vanishes and reloaded when a name owner appears.
    
    The unique name owner of the proxy’s name is tracked and can be read from
    `property@Gio.DBusProxy:g-name-owner`. Connect to the
    [gobject.object.ObjectWrap.notify] signal to get notified of changes.
    Additionally, only signals and property changes emitted from the current name
    owner are considered and calls are always sent to the current name owner.
    This avoids a number of race conditions when the name is lost by one owner
    and claimed by another. However, if no name owner currently exists,
    then calls will be sent to the well-known name which may result in
    the message bus launching an owner (unless
    [gio.types.DBusProxyFlags.DoNotAutoStart] is set).
    
    If the proxy is for a stateless D-Bus service, where the name owner may
    be started and stopped between calls, the
    `property@Gio.DBusProxy:g-name-owner` tracking of [gio.dbus_proxy.DBusProxy] will cause the
    proxy to drop signal and property changes from the service after it has
    restarted for the first time. When interacting with a stateless D-Bus
    service, do not use [gio.dbus_proxy.DBusProxy] — use direct D-Bus method calls and signal
    connections.
    
    The generic `signal@Gio.DBusProxy::g-properties-changed` and
    `signal@Gio.DBusProxy::g-signal` signals are not very convenient to work
    with. Therefore, the recommended way of working with proxies is to subclass
    [gio.dbus_proxy.DBusProxy], and have more natural properties and signals in your derived
    class. This [example](migrating-gdbus.html#using-gdbus-codegen) shows how
    this can easily be done using the [`gdbus-codegen`](gdbus-codegen.html) tool.
    
    A [gio.dbus_proxy.DBusProxy] instance can be used from multiple threads but note
    that all signals (e.g. `signal@Gio.DBusProxy::g-signal`,
    `signal@Gio.DBusProxy::g-properties-changed` and
    [gobject.object.ObjectWrap.notify]) are emitted in the thread-default main
    context (see [glib.main_context.MainContext.pushThreadDefault]) of the thread
    where the instance was constructed.
    
    An example using a proxy for a well-known name can be found in
    [`gdbus-example-watch-proxy.c`](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-watch-proxy.c).
*/
class DBusProxy : gobject.object.ObjectWrap, gio.async_initable.AsyncInitable, gio.dbus_interface.DBusInterface, gio.initable.Initable
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
    return cast(void function())g_dbus_proxy_get_type != &gidSymbolNotFound ? g_dbus_proxy_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusProxy self()
  {
    return this;
  }

  /**
      Get `gDefaultTimeout` property.
      Returns: The timeout to use if -1 (specifying default timeout) is passed
      as @timeout_msec in the [gio.dbus_proxy.DBusProxy.call] and
      [gio.dbus_proxy.DBusProxy.callSync] functions.
      
      This allows applications to set a proxy-wide timeout for all
      remote method invocations on the proxy. If this property is -1,
      the default timeout (typically 25 seconds) is used. If set to
      `G_MAXINT`, then no timeout is used.
  */
  @property int gDefaultTimeout()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("g-default-timeout");
  }

  /**
      Set `gDefaultTimeout` property.
      Params:
        propval = The timeout to use if -1 (specifying default timeout) is passed
        as @timeout_msec in the [gio.dbus_proxy.DBusProxy.call] and
        [gio.dbus_proxy.DBusProxy.callSync] functions.
        
        This allows applications to set a proxy-wide timeout for all
        remote method invocations on the proxy. If this property is -1,
        the default timeout (typically 25 seconds) is used. If set to
        `G_MAXINT`, then no timeout is used.
  */
  @property void gDefaultTimeout(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("g-default-timeout", propval);
  }

  /**
      Get `gInterfaceInfo` property.
      Returns: Ensure that interactions with this proxy conform to the given
      interface. This is mainly to ensure that malformed data received
      from the other peer is ignored. The given #GDBusInterfaceInfo is
      said to be the "expected interface".
      
      The checks performed are:
      $(LIST
        * When completing a method call, if the type signature of
          the reply message isn't what's expected, the reply is
          discarded and the #GError is set to [gio.types.IOErrorEnum.InvalidArgument].
        
        * Received signals that have a type signature mismatch are dropped and
          a warning is logged via g_warning().
        
        * Properties received via the initial `GetAll()` call or via the
          `::PropertiesChanged` signal (on the
          [org.freedesktop.DBus.Properties](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-properties)
          interface) or set using [gio.dbus_proxy.DBusProxy.setCachedProperty]
          with a type signature mismatch are ignored and a warning is
          logged via g_warning().
      )
        
      Note that these checks are never done on methods, signals and
      properties that are not referenced in the given
      #GDBusInterfaceInfo, since extending a D-Bus interface on the
      service-side is not considered an ABI break.
  */
  @property gio.dbus_interface_info.DBusInterfaceInfo gInterfaceInfo()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.dbus_interface_info.DBusInterfaceInfo)("g-interface-info");
  }

  /**
      Set `gInterfaceInfo` property.
      Params:
        propval = Ensure that interactions with this proxy conform to the given
        interface. This is mainly to ensure that malformed data received
        from the other peer is ignored. The given #GDBusInterfaceInfo is
        said to be the "expected interface".
        
        The checks performed are:
        $(LIST
          * When completing a method call, if the type signature of
            the reply message isn't what's expected, the reply is
            discarded and the #GError is set to [gio.types.IOErrorEnum.InvalidArgument].
          
          * Received signals that have a type signature mismatch are dropped and
            a warning is logged via g_warning().
          
          * Properties received via the initial `GetAll()` call or via the
            `::PropertiesChanged` signal (on the
            [org.freedesktop.DBus.Properties](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-properties)
            interface) or set using [gio.dbus_proxy.DBusProxy.setCachedProperty]
            with a type signature mismatch are ignored and a warning is
            logged via g_warning().
        )
          
        Note that these checks are never done on methods, signals and
        properties that are not referenced in the given
        #GDBusInterfaceInfo, since extending a D-Bus interface on the
        service-side is not considered an ABI break.
  */
  @property void gInterfaceInfo(gio.dbus_interface_info.DBusInterfaceInfo propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.dbus_interface_info.DBusInterfaceInfo)("g-interface-info", propval);
  }

  /**
      Get `gNameOwner` property.
      Returns: The unique name that owns #GDBusProxy:g-name or null if no-one
      currently owns that name. You may connect to #GObject::notify signal to
      track changes to this property.
  */
  @property string gNameOwner()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("g-name-owner");
  }

  mixin AsyncInitableT!();
  mixin DBusInterfaceT!();
  mixin InitableT!();

  /**
      Finishes creating a #GDBusProxy.
  
      Params:
        res = A #GAsyncResult obtained from the #GAsyncReadyCallback function passed to [gio.dbus_proxy.DBusProxy.new_].
      Returns: A #GDBusProxy or null if error is set.
           Free with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_proxy.DBusProxy newFinish(gio.async_result.AsyncResult res)
  {
    GDBusProxy* _cretval;
    GError *_err;
    _cretval = g_dbus_proxy_new_finish(res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_proxy.DBusProxy)(cast(GDBusProxy*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finishes creating a #GDBusProxy.
  
      Params:
        res = A #GAsyncResult obtained from the #GAsyncReadyCallback function passed to [gio.dbus_proxy.DBusProxy.newForBus].
      Returns: A #GDBusProxy or null if error is set.
           Free with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_proxy.DBusProxy newForBusFinish(gio.async_result.AsyncResult res)
  {
    GDBusProxy* _cretval;
    GError *_err;
    _cretval = g_dbus_proxy_new_for_bus_finish(res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_proxy.DBusProxy)(cast(GDBusProxy*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Like [gio.dbus_proxy.DBusProxy.newSync] but takes a #GBusType instead of a #GDBusConnection.
      
      #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
  
      Params:
        busType = A #GBusType.
        flags = Flags used when constructing the proxy.
        info = A #GDBusInterfaceInfo specifying the minimal interface
                 that proxy conforms to or null.
        name = A bus name (well-known or unique).
        objectPath = An object path.
        interfaceName = A D-Bus interface name.
        cancellable = A #GCancellable or null.
      Returns: A #GDBusProxy or null if error is set.
           Free with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_proxy.DBusProxy newForBusSync(gio.types.BusType busType, gio.types.DBusProxyFlags flags, gio.dbus_interface_info.DBusInterfaceInfo info, string name, string objectPath, string interfaceName, gio.cancellable.Cancellable cancellable = null)
  {
    GDBusProxy* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_proxy_new_for_bus_sync(busType, flags, info ? cast(GDBusInterfaceInfo*)info._cPtr(No.Dup) : null, _name, _objectPath, _interfaceName, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_proxy.DBusProxy)(cast(GDBusProxy*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a proxy for accessing interface_name on the remote object
      at object_path owned by name at connection and synchronously
      loads D-Bus properties unless the
      [gio.types.DBusProxyFlags.DoNotLoadProperties] flag is used.
      
      If the [gio.types.DBusProxyFlags.DoNotConnectSignals] flag is not set, also sets up
      match rules for signals. Connect to the #GDBusProxy::g-signal signal
      to handle signals from the remote object.
      
      If both [gio.types.DBusProxyFlags.DoNotLoadProperties] and
      [gio.types.DBusProxyFlags.DoNotConnectSignals] are set, this constructor is
      guaranteed to return immediately without blocking.
      
      If name is a well-known name and the
      [gio.types.DBusProxyFlags.DoNotAutoStart] and [gio.types.DBusProxyFlags.DoNotAutoStartAtConstruction]
      flags aren't set and no name owner currently exists, the message bus
      will be requested to launch a name owner for the name.
      
      This is a synchronous failable constructor. See [gio.dbus_proxy.DBusProxy.new_]
      and [gio.dbus_proxy.DBusProxy.newFinish] for the asynchronous version.
      
      #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
  
      Params:
        connection = A #GDBusConnection.
        flags = Flags used when constructing the proxy.
        info = A #GDBusInterfaceInfo specifying the minimal interface that proxy conforms to or null.
        name = A bus name (well-known or unique) or null if connection is not a message bus connection.
        objectPath = An object path.
        interfaceName = A D-Bus interface name.
        cancellable = A #GCancellable or null.
      Returns: A #GDBusProxy or null if error is set.
           Free with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_proxy.DBusProxy newSync(gio.dbus_connection.DBusConnection connection, gio.types.DBusProxyFlags flags, gio.dbus_interface_info.DBusInterfaceInfo info, string name, string objectPath, string interfaceName, gio.cancellable.Cancellable cancellable = null)
  {
    GDBusProxy* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_proxy_new_sync(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, flags, info ? cast(GDBusInterfaceInfo*)info._cPtr(No.Dup) : null, _name, _objectPath, _interfaceName, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_proxy.DBusProxy)(cast(GDBusProxy*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a proxy for accessing interface_name on the remote object
      at object_path owned by name at connection and asynchronously
      loads D-Bus properties unless the
      [gio.types.DBusProxyFlags.DoNotLoadProperties] flag is used. Connect to
      the #GDBusProxy::g-properties-changed signal to get notified about
      property changes.
      
      If the [gio.types.DBusProxyFlags.DoNotConnectSignals] flag is not set, also sets up
      match rules for signals. Connect to the #GDBusProxy::g-signal signal
      to handle signals from the remote object.
      
      If both [gio.types.DBusProxyFlags.DoNotLoadProperties] and
      [gio.types.DBusProxyFlags.DoNotConnectSignals] are set, this constructor is
      guaranteed to complete immediately without blocking.
      
      If name is a well-known name and the
      [gio.types.DBusProxyFlags.DoNotAutoStart] and [gio.types.DBusProxyFlags.DoNotAutoStartAtConstruction]
      flags aren't set and no name owner currently exists, the message bus
      will be requested to launch a name owner for the name.
      
      This is a failable asynchronous constructor - when the proxy is
      ready, callback will be invoked and you can use
      [gio.dbus_proxy.DBusProxy.newFinish] to get the result.
      
      See [gio.dbus_proxy.DBusProxy.newSync] and for a synchronous version of this constructor.
      
      #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
  
      Params:
        connection = A #GDBusConnection.
        flags = Flags used when constructing the proxy.
        info = A #GDBusInterfaceInfo specifying the minimal interface that proxy conforms to or null.
        name = A bus name (well-known or unique) or null if connection is not a message bus connection.
        objectPath = An object path.
        interfaceName = A D-Bus interface name.
        cancellable = A #GCancellable or null.
        callback = Callback function to invoke when the proxy is ready.
  */
  static void new_(gio.dbus_connection.DBusConnection connection, gio.types.DBusProxyFlags flags, gio.dbus_interface_info.DBusInterfaceInfo info, string name, string objectPath, string interfaceName, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_proxy_new(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, flags, info ? cast(GDBusInterfaceInfo*)info._cPtr(No.Dup) : null, _name, _objectPath, _interfaceName, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Like [gio.dbus_proxy.DBusProxy.new_] but takes a #GBusType instead of a #GDBusConnection.
      
      #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
  
      Params:
        busType = A #GBusType.
        flags = Flags used when constructing the proxy.
        info = A #GDBusInterfaceInfo specifying the minimal interface that proxy conforms to or null.
        name = A bus name (well-known or unique).
        objectPath = An object path.
        interfaceName = A D-Bus interface name.
        cancellable = A #GCancellable or null.
        callback = Callback function to invoke when the proxy is ready.
  */
  static void newForBus(gio.types.BusType busType, gio.types.DBusProxyFlags flags, gio.dbus_interface_info.DBusInterfaceInfo info, string name, string objectPath, string interfaceName, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_proxy_new_for_bus(busType, flags, info ? cast(GDBusInterfaceInfo*)info._cPtr(No.Dup) : null, _name, _objectPath, _interfaceName, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Asynchronously invokes the method_name method on proxy.
      
      If method_name contains any dots, then name is split into interface and
      method name parts. This allows using proxy for invoking methods on
      other interfaces.
      
      If the #GDBusConnection associated with proxy is closed then
      the operation will fail with [gio.types.IOErrorEnum.Closed]. If
      cancellable is canceled, the operation will fail with
      [gio.types.IOErrorEnum.Cancelled]. If parameters contains a value not
      compatible with the D-Bus protocol, the operation fails with
      [gio.types.IOErrorEnum.InvalidArgument].
      
      If the parameters #GVariant is floating, it is consumed. This allows
      convenient 'inline' use of [glib.variant.Variant.new_], e.g.:
      ```c
       g_dbus_proxy_call (proxy,
                          "TwoStrings",
                          g_variant_new ("(ss)",
                                         "Thing One",
                                         "Thing Two"),
                          G_DBUS_CALL_FLAGS_NONE,
                          -1,
                          NULL,
                          (GAsyncReadyCallback) two_strings_done,
                          &data);
      ```
      
      If proxy has an expected interface (see
      #GDBusProxy:g-interface-info) and method_name is referenced by it,
      then the return value is checked against the return type.
      
      This is an asynchronous method. When the operation is finished,
      callback will be invoked in the
      [thread-default main context][g-main-context-push-thread-default]
      of the thread you are calling this method from.
      You can then call [gio.dbus_proxy.DBusProxy.callFinish] to get the result of
      the operation. See [gio.dbus_proxy.DBusProxy.callSync] for the synchronous
      version of this method.
      
      If callback is null then the D-Bus method call message will be sent with
      the [gio.types.DBusMessageFlags.NoReplyExpected] flag set.
  
      Params:
        methodName = Name of method to invoke.
        parameters = A #GVariant tuple with parameters for the signal or null if not passing parameters.
        flags = Flags from the #GDBusCallFlags enumeration.
        timeoutMsec = The timeout in milliseconds (with `G_MAXINT` meaning
                         "infinite") or -1 to use the proxy default timeout.
        cancellable = A #GCancellable or null.
        callback = A #GAsyncReadyCallback to call when the request is satisfied or null if you don't
          care about the result of the method invocation.
  */
  void call(string methodName, glib.variant.Variant parameters, gio.types.DBusCallFlags flags, int timeoutMsec, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _methodName = methodName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_proxy_call(cast(GDBusProxy*)this._cPtr, _methodName, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null, flags, timeoutMsec, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an operation started with [gio.dbus_proxy.DBusProxy.call].
  
      Params:
        res = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [gio.dbus_proxy.DBusProxy.call].
      Returns: null if error is set. Otherwise a #GVariant tuple with
        return values. Free with [glib.variant.Variant.unref].
      Throws: [ErrorWrap]
  */
  glib.variant.Variant callFinish(gio.async_result.AsyncResult res)
  {
    GVariant* _cretval;
    GError *_err;
    _cretval = g_dbus_proxy_call_finish(cast(GDBusProxy*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Synchronously invokes the method_name method on proxy.
      
      If method_name contains any dots, then name is split into interface and
      method name parts. This allows using proxy for invoking methods on
      other interfaces.
      
      If the #GDBusConnection associated with proxy is disconnected then
      the operation will fail with [gio.types.IOErrorEnum.Closed]. If
      cancellable is canceled, the operation will fail with
      [gio.types.IOErrorEnum.Cancelled]. If parameters contains a value not
      compatible with the D-Bus protocol, the operation fails with
      [gio.types.IOErrorEnum.InvalidArgument].
      
      If the parameters #GVariant is floating, it is consumed. This allows
      convenient 'inline' use of [glib.variant.Variant.new_], e.g.:
      ```c
       g_dbus_proxy_call_sync (proxy,
                               "TwoStrings",
                               g_variant_new ("(ss)",
                                              "Thing One",
                                              "Thing Two"),
                               G_DBUS_CALL_FLAGS_NONE,
                               -1,
                               NULL,
                               &error);
      ```
      
      The calling thread is blocked until a reply is received. See
      [gio.dbus_proxy.DBusProxy.call] for the asynchronous version of this
      method.
      
      If proxy has an expected interface (see
      #GDBusProxy:g-interface-info) and method_name is referenced by it,
      then the return value is checked against the return type.
  
      Params:
        methodName = Name of method to invoke.
        parameters = A #GVariant tuple with parameters for the signal
                       or null if not passing parameters.
        flags = Flags from the #GDBusCallFlags enumeration.
        timeoutMsec = The timeout in milliseconds (with `G_MAXINT` meaning
                         "infinite") or -1 to use the proxy default timeout.
        cancellable = A #GCancellable or null.
      Returns: null if error is set. Otherwise a #GVariant tuple with
        return values. Free with [glib.variant.Variant.unref].
      Throws: [ErrorWrap]
  */
  glib.variant.Variant callSync(string methodName, glib.variant.Variant parameters, gio.types.DBusCallFlags flags, int timeoutMsec, gio.cancellable.Cancellable cancellable = null)
  {
    GVariant* _cretval;
    const(char)* _methodName = methodName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_proxy_call_sync(cast(GDBusProxy*)this._cPtr, _methodName, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null, flags, timeoutMsec, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Like [gio.dbus_proxy.DBusProxy.call] but also takes a #GUnixFDList object.
      
      This method is only available on UNIX.
  
      Params:
        methodName = Name of method to invoke.
        parameters = A #GVariant tuple with parameters for the signal or null if not passing parameters.
        flags = Flags from the #GDBusCallFlags enumeration.
        timeoutMsec = The timeout in milliseconds (with `G_MAXINT` meaning
                         "infinite") or -1 to use the proxy default timeout.
        fdList = A #GUnixFDList or null.
        cancellable = A #GCancellable or null.
        callback = A #GAsyncReadyCallback to call when the request is satisfied or null if you don't
          care about the result of the method invocation.
  */
  void callWithUnixFdList(string methodName, glib.variant.Variant parameters, gio.types.DBusCallFlags flags, int timeoutMsec, gio.unix_fdlist.UnixFDList fdList = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _methodName = methodName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_proxy_call_with_unix_fd_list(cast(GDBusProxy*)this._cPtr, _methodName, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null, flags, timeoutMsec, fdList ? cast(GUnixFDList*)fdList._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an operation started with [gio.dbus_proxy.DBusProxy.callWithUnixFdList].
  
      Params:
        outFdList = Return location for a #GUnixFDList or null.
        res = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [gio.dbus_proxy.DBusProxy.callWithUnixFdList].
      Returns: null if error is set. Otherwise a #GVariant tuple with
        return values. Free with [glib.variant.Variant.unref].
      Throws: [ErrorWrap]
  */
  glib.variant.Variant callWithUnixFdListFinish(out gio.unix_fdlist.UnixFDList outFdList, gio.async_result.AsyncResult res)
  {
    GVariant* _cretval;
    GUnixFDList* _outFdList;
    GError *_err;
    _cretval = g_dbus_proxy_call_with_unix_fd_list_finish(cast(GDBusProxy*)this._cPtr, &_outFdList, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    outFdList = new gio.unix_fdlist.UnixFDList(cast(void*)_outFdList, Yes.Take);
    return _retval;
  }

  /**
      Like [gio.dbus_proxy.DBusProxy.callSync] but also takes and returns #GUnixFDList objects.
      
      This method is only available on UNIX.
  
      Params:
        methodName = Name of method to invoke.
        parameters = A #GVariant tuple with parameters for the signal
                       or null if not passing parameters.
        flags = Flags from the #GDBusCallFlags enumeration.
        timeoutMsec = The timeout in milliseconds (with `G_MAXINT` meaning
                         "infinite") or -1 to use the proxy default timeout.
        fdList = A #GUnixFDList or null.
        outFdList = Return location for a #GUnixFDList or null.
        cancellable = A #GCancellable or null.
      Returns: null if error is set. Otherwise a #GVariant tuple with
        return values. Free with [glib.variant.Variant.unref].
      Throws: [ErrorWrap]
  */
  glib.variant.Variant callWithUnixFdListSync(string methodName, glib.variant.Variant parameters, gio.types.DBusCallFlags flags, int timeoutMsec, gio.unix_fdlist.UnixFDList fdList, out gio.unix_fdlist.UnixFDList outFdList, gio.cancellable.Cancellable cancellable = null)
  {
    GVariant* _cretval;
    const(char)* _methodName = methodName.toCString(No.Alloc);
    GUnixFDList* _outFdList;
    GError *_err;
    _cretval = g_dbus_proxy_call_with_unix_fd_list_sync(cast(GDBusProxy*)this._cPtr, _methodName, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null, flags, timeoutMsec, fdList ? cast(GUnixFDList*)fdList._cPtr(No.Dup) : null, &_outFdList, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    outFdList = new gio.unix_fdlist.UnixFDList(cast(void*)_outFdList, Yes.Take);
    return _retval;
  }

  /**
      Looks up the value for a property from the cache. This call does no
      blocking IO.
      
      If proxy has an expected interface (see
      #GDBusProxy:g-interface-info) and property_name is referenced by
      it, then value is checked against the type of the property.
  
      Params:
        propertyName = Property name.
      Returns: A reference to the #GVariant instance
           that holds the value for property_name or null if the value is not in
           the cache. The returned reference must be freed with [glib.variant.Variant.unref].
  */
  glib.variant.Variant getCachedProperty(string propertyName)
  {
    GVariant* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = g_dbus_proxy_get_cached_property(cast(GDBusProxy*)this._cPtr, _propertyName);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the names of all cached properties on proxy.
      Returns: A
                 null-terminated array of strings or null if
                 proxy has no cached properties. Free the returned array with
                 [glib.global.strfreev].
  */
  string[] getCachedPropertyNames()
  {
    char** _cretval;
    _cretval = g_dbus_proxy_get_cached_property_names(cast(GDBusProxy*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the connection proxy is for.
      Returns: A #GDBusConnection owned by proxy. Do not free.
  */
  gio.dbus_connection.DBusConnection getConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_proxy_get_connection(cast(GDBusProxy*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the timeout to use if -1 (specifying default timeout) is
      passed as timeout_msec in the [gio.dbus_proxy.DBusProxy.call] and
      [gio.dbus_proxy.DBusProxy.callSync] functions.
      
      See the #GDBusProxy:g-default-timeout property for more details.
      Returns: Timeout to use for proxy.
  */
  int getDefaultTimeout()
  {
    int _retval;
    _retval = g_dbus_proxy_get_default_timeout(cast(GDBusProxy*)this._cPtr);
    return _retval;
  }

  /**
      Gets the flags that proxy was constructed with.
      Returns: Flags from the #GDBusProxyFlags enumeration.
  */
  gio.types.DBusProxyFlags getFlags()
  {
    GDBusProxyFlags _cretval;
    _cretval = g_dbus_proxy_get_flags(cast(GDBusProxy*)this._cPtr);
    gio.types.DBusProxyFlags _retval = cast(gio.types.DBusProxyFlags)_cretval;
    return _retval;
  }

  /**
      Returns the #GDBusInterfaceInfo, if any, specifying the interface
      that proxy conforms to. See the #GDBusProxy:g-interface-info
      property for more details.
      Returns: A #GDBusInterfaceInfo or null.
           Do not unref the returned object, it is owned by proxy.
  */
  gio.dbus_interface_info.DBusInterfaceInfo getInterfaceInfo()
  {
    GDBusInterfaceInfo* _cretval;
    _cretval = g_dbus_proxy_get_interface_info(cast(GDBusProxy*)this._cPtr);
    auto _retval = _cretval ? new gio.dbus_interface_info.DBusInterfaceInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the D-Bus interface name proxy is for.
      Returns: A string owned by proxy. Do not free.
  */
  string getInterfaceName()
  {
    const(char)* _cretval;
    _cretval = g_dbus_proxy_get_interface_name(cast(GDBusProxy*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the name that proxy was constructed for.
      
      When connected to a message bus, this will usually be non-null.
      However, it may be null for a proxy that communicates using a peer-to-peer
      pattern.
      Returns: A string owned by proxy. Do not free.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_dbus_proxy_get_name(cast(GDBusProxy*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      The unique name that owns the name that proxy is for or null if
      no-one currently owns that name. You may connect to the
      #GObject::notify signal to track changes to the
      #GDBusProxy:g-name-owner property.
      Returns: The name owner or null if no name
           owner exists. Free with [glib.global.gfree].
  */
  string getNameOwner()
  {
    char* _cretval;
    _cretval = g_dbus_proxy_get_name_owner(cast(GDBusProxy*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the object path proxy is for.
      Returns: A string owned by proxy. Do not free.
  */
  string getObjectPath()
  {
    const(char)* _cretval;
    _cretval = g_dbus_proxy_get_object_path(cast(GDBusProxy*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      If value is not null, sets the cached value for the property with
      name property_name to the value in value.
      
      If value is null, then the cached value is removed from the
      property cache.
      
      If proxy has an expected interface (see
      #GDBusProxy:g-interface-info) and property_name is referenced by
      it, then value is checked against the type of the property.
      
      If the value #GVariant is floating, it is consumed. This allows
      convenient 'inline' use of [glib.variant.Variant.new_], e.g.
      ```c
       g_dbus_proxy_set_cached_property (proxy,
                                         "SomeProperty",
                                         g_variant_new ("(si)",
                                                       "A String",
                                                       42));
      ```
      
      Normally you will not need to use this method since proxy
      is tracking changes using the
      `org.freedesktop.DBus.Properties.PropertiesChanged`
      D-Bus signal. However, for performance reasons an object may
      decide to not use this signal for some properties and instead
      use a proprietary out-of-band mechanism to transmit changes.
      
      As a concrete example, consider an object with a property
      `ChatroomParticipants` which is an array of strings. Instead of
      transmitting the same (long) array every time the property changes,
      it is more efficient to only transmit the delta using e.g. signals
      `ChatroomParticipantJoined(String name)` and
      `ChatroomParticipantParted(String name)`.
  
      Params:
        propertyName = Property name.
        value = Value for the property or null to remove it from the cache.
  */
  void setCachedProperty(string propertyName, glib.variant.Variant value = null)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    g_dbus_proxy_set_cached_property(cast(GDBusProxy*)this._cPtr, _propertyName, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the timeout to use if -1 (specifying default timeout) is
      passed as timeout_msec in the [gio.dbus_proxy.DBusProxy.call] and
      [gio.dbus_proxy.DBusProxy.callSync] functions.
      
      See the #GDBusProxy:g-default-timeout property for more details.
  
      Params:
        timeoutMsec = Timeout in milliseconds.
  */
  void setDefaultTimeout(int timeoutMsec)
  {
    g_dbus_proxy_set_default_timeout(cast(GDBusProxy*)this._cPtr, timeoutMsec);
  }

  /**
      Ensure that interactions with proxy conform to the given
      interface. See the #GDBusProxy:g-interface-info property for more
      details.
  
      Params:
        info = Minimum interface this proxy conforms to
             or null to unset.
  */
  void setInterfaceInfo(gio.dbus_interface_info.DBusInterfaceInfo info = null)
  {
    g_dbus_proxy_set_interface_info(cast(GDBusProxy*)this._cPtr, info ? cast(GDBusInterfaceInfo*)info._cPtr(No.Dup) : null);
  }

  /**
      Connect to `GPropertiesChanged` signal.
  
      Emitted when one or more D-Bus properties on proxy changes. The
      local cache has already been updated when this signal fires. Note
      that both changed_properties and invalidated_properties are
      guaranteed to never be null (either may be empty though).
      
      If the proxy has the flag
      [gio.types.DBusProxyFlags.GetInvalidatedProperties] set, then
      invalidated_properties will always be empty.
      
      This signal corresponds to the
      `PropertiesChanged` D-Bus signal on the
      `org.freedesktop.DBus.Properties` interface.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(glib.variant.Variant changedProperties, string[] invalidatedProperties, gio.dbus_proxy.DBusProxy dBusProxy))
  
          `changedProperties` A #GVariant containing the properties that changed (type: `a{sv}`) (optional)
  
          `invalidatedProperties` A null terminated array of properties that was invalidated (optional)
  
          `dBusProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGPropertiesChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == glib.variant.Variant)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string[])))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.dbus_proxy.DBusProxy)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);


      static if (Parameters!T.length > 1)
      {
        auto _cArray = getVal!(char**)(&_paramVals[2]);
        string[] _dArray;
        uint _leninvalidatedProperties;
        if (_cArray)
          for (; _cArray[_leninvalidatedProperties] !is null; _leninvalidatedProperties++)
          break;
        foreach (i; 0 .. _leninvalidatedProperties)
          _dArray ~= _cArray[i].fromCString(No.Free);
        _paramTuple[1] = _dArray;
      }
      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("g-properties-changed", closure, after);
  }

  /**
      Connect to `GSignal` signal.
  
      Emitted when a signal from the remote object and interface that proxy is for, has been received.
      
      Since 2.72 this signal supports detailed connections. You can connect to
      the detailed signal `g-signal::x` in order to receive callbacks only when
      signal `x` is received from the remote object.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string senderName, string signalName, glib.variant.Variant parameters, gio.dbus_proxy.DBusProxy dBusProxy))
  
          `senderName` The sender of the signal or null if the connection is not a bus connection. (optional)
  
          `signalName` The name of the signal. (optional)
  
          `parameters` A #GVariant tuple with parameters for the signal. (optional)
  
          `dBusProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGSignal(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == glib.variant.Variant)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gio.dbus_proxy.DBusProxy)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("g-signal"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
