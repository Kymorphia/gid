/// Module for [DBusObjectManagerClient] class
module gid.gio2.dbus_object_manager_client;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_initable;
import gid.gio2.async_initable_mixin;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.dbus_connection;
import gid.gio2.dbus_object_manager;
import gid.gio2.dbus_object_manager_mixin;
import gid.gio2.dbus_object_proxy;
import gid.gio2.dbus_proxy;
import gid.gio2.initable;
import gid.gio2.initable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.variant;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;

/**
    [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient] is used to create, monitor and delete object
    proxies for remote objects exported by a [gid.gio2.dbus_object_manager_server.DBusObjectManagerServer]
    (or any code implementing the
    [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
    interface).
    
    Once an instance of this type has been created, you can connect to
    the [gid.gio2.dbus_object_manager.DBusObjectManager.objectAdded] and
    [gid.gio2.dbus_object_manager.DBusObjectManager.objectRemoved] and inspect the
    [gid.gio2.dbus_object_proxy.DBusObjectProxy] objects returned by
    [gid.gio2.dbus_object_manager.DBusObjectManager.getObjects].
    
    If the name for a [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient] is not owned by anyone at
    object construction time, the default behavior is to request the
    message bus to launch an owner for the name. This behavior can be
    disabled using the [gid.gio2.types.DBusObjectManagerClientFlags.DoNotAutoStart]
    flag. It’s also worth noting that this only works if the name of
    interest is activatable in the first place. E.g. in some cases it
    is not possible to launch an owner for the requested name. In this
    case, [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient] object construction still succeeds but
    there will be no object proxies
    (e.g. [gid.gio2.dbus_object_manager.DBusObjectManager.getObjects] returns the empty list) and
    the [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.nameOwner] property is `NULL`.
    
    The owner of the requested name can come and go (for example
    consider a system service being restarted) – [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient]
    handles this case too; simply connect to the [gid.gobject2.object.ObjectWrap.notify]
    signal to watch for changes on the
    [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.nameOwner] property. When the name
    owner vanishes, the behavior is that
    [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.nameOwner] is set to `NULL` (this
    includes emission of the [gid.gobject2.object.ObjectWrap.notify] signal) and then
    [gid.gio2.dbus_object_manager.DBusObjectManager.objectRemoved] signals are synthesized
    for all currently existing object proxies. Since
    [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.nameOwner] is `NULL` when this
    happens, you can use this information to disambiguate a synthesized signal
    from a genuine signal caused by object removal on the remote
    [gid.gio2.dbus_object_manager.DBusObjectManager]. Similarly, when a new name owner appears,
    [gid.gio2.dbus_object_manager.DBusObjectManager.objectAdded] signals are synthesized
    while [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.nameOwner] is still `NULL`. Only
    when all object proxies have been added, the
    [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.nameOwner] is set to the new name
    owner (this includes emission of the [gid.gobject2.object.ObjectWrap.notify] signal).
    Furthermore, you are guaranteed that
    [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.nameOwner] will alternate between a
    name owner (e.g. `:1.42`) and `NULL` even in the case where
    the name of interest is atomically replaced
    
    Ultimately, [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient] is used to obtain
    [gid.gio2.dbus_proxy.DBusProxy] instances. All signals (including the
    `org.freedesktop.DBus.Properties::PropertiesChanged` signal)
    delivered to [gid.gio2.dbus_proxy.DBusProxy] instances are guaranteed to originate
    from the name owner. This guarantee along with the behavior
    described above, means that certain race conditions including the
    “half the proxy is from the old owner and the other half is from
    the new owner” problem cannot happen.
    
    To avoid having the application connect to signals on the returned
    [gid.gio2.dbus_object_proxy.DBusObjectProxy] and [gid.gio2.dbus_proxy.DBusProxy] objects, the
    [gid.gio2.dbus_object.DBusObject.interfaceAdded],
    [gid.gio2.dbus_object.DBusObject.interfaceRemoved],
    [gid.gio2.dbus_proxy.DBusProxy.gPropertiesChanged] and
    [gid.gio2.dbus_proxy.DBusProxy.gSignal] signals
    are also emitted on the [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient] instance managing these
    objects. The signals emitted are
    [gid.gio2.dbus_object_manager.DBusObjectManager.interfaceAdded],
    [gid.gio2.dbus_object_manager.DBusObjectManager.interfaceRemoved],
    [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.interfaceProxyPropertiesChanged] and
    [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.interfaceProxySignal].
    
    Note that all callbacks and signals are emitted in the
    thread-default main context (see
    [gid.glib2.main_context.MainContext.pushThreadDefault]) that the
    [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient] object was constructed in. Additionally, the
    [gid.gio2.dbus_object_proxy.DBusObjectProxy] and [gid.gio2.dbus_proxy.DBusProxy] objects
    originating from the [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient] object will be created in
    the same context and, consequently, will deliver signals in the
    same main loop.
*/
@gidGir("DBusObjectManagerClient", "DBusObjectManagerClientClass")
class DBusObjectManagerClient : gid.gobject2.object.ObjectWrap, gid.gio2.async_initable.AsyncInitable, gid.gio2.dbus_object_manager.DBusObjectManager, gid.gio2.initable.Initable
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
    return cast(void function())g_dbus_object_manager_client_get_type != &gidSymbolNotFound ? g_dbus_object_manager_client_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GDBusObjectManagerClient";
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusObjectManagerClient self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient]
      Returns: New builder object
  */
  static DBusObjectManagerClientGidBuilder builder() nothrow
  {
    return new DBusObjectManagerClientGidBuilder;
  }

  /**
      Get `connection` property.
      Returns: The #GDBusConnection to use.
  */
  @property gid.gio2.dbus_connection.DBusConnection connection() nothrow
  {
    return getConnection();
  }

  /**
      Get `flags` property.
      Returns: Flags from the #GDBusObjectManagerClientFlags enumeration.
  */
  @property gid.gio2.types.DBusObjectManagerClientFlags flags() nothrow
  {
    return getFlags();
  }

  /**
      Get `getProxyTypeDestroyNotify` property.
      Returns: A #GDestroyNotify for the #gpointer user_data in #GDBusObjectManagerClient:get-proxy-type-user-data.
  */
  @property void* getProxyTypeDestroyNotify() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(void*)("get-proxy-type-destroy-notify");
  }

  /**
      Get `getProxyTypeFunc` property.
      Returns: The #GDBusProxyTypeFunc to use when determining what #GType to
        use for interface proxies or null.
  */
  @property void* getProxyTypeFunc() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(void*)("get-proxy-type-func");
  }

  /**
      Get `getProxyTypeUserData` property.
      Returns: The #gpointer user_data to pass to #GDBusObjectManagerClient:get-proxy-type-func.
  */
  @property void* getProxyTypeUserData() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(void*)("get-proxy-type-user-data");
  }

  /**
      Get `name` property.
      Returns: The well-known name or unique name that the manager is for.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Get `nameOwner` property.
      Returns: The unique name that owns #GDBusObjectManagerClient:name or null if
        no-one is currently owning the name. Connect to the
        #GObject::notify signal to track changes to this property.
  */
  @property string nameOwner() nothrow
  {
    return getNameOwner();
  }

  /**
      Get `objectPath` property.
      Returns: The object path the manager is for.
  */
  @property string objectPath() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("object-path");
  }

  mixin AsyncInitableT!();
  mixin DBusObjectManagerT!();
  mixin InitableT!();

  /**
      Finishes an operation started with [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.new_].
  
      Params:
        res = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.new_].
      Returns: A
          #GDBusObjectManagerClient object or null if error is set. Free
          with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gid.gio2.dbus_object_manager_client.DBusObjectManagerClient newFinish(gid.gio2.async_result.AsyncResult res)
  {
    GDBusObjectManager* _cretval;
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_finish(res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finishes an operation started with [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.newForBus].
  
      Params:
        res = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.newForBus].
      Returns: A
          #GDBusObjectManagerClient object or null if error is set. Free
          with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gid.gio2.dbus_object_manager_client.DBusObjectManagerClient newForBusFinish(gid.gio2.async_result.AsyncResult res)
  {
    GDBusObjectManager* _cretval;
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_for_bus_finish(res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Like [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.newSync] but takes a #GBusType instead
      of a #GDBusConnection.
      
      This is a synchronous failable constructor - the calling thread is
      blocked until a reply is received. See [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.newForBus]
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
          with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gid.gio2.dbus_object_manager_client.DBusObjectManagerClient newForBusSync(gid.gio2.types.BusType busType, gid.gio2.types.DBusObjectManagerClientFlags flags, string name, string objectPath, gid.gio2.types.DBusProxyTypeFunc getProxyTypeFunc = null, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data) nothrow
    {
      gidAttachThread();
      gid.gobject2.types.GType _dretval;
      auto _dlg = cast(gid.gio2.types.DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString!(No.Free);
      string _interfaceName = interfaceName.fromCString!(No.Free);

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.DBusProxyTypeFunc");
      }
      auto _retval = cast(GType)_dretval;

      return _retval;
    }
    auto _getProxyTypeFuncCB = getProxyTypeFunc ? &_getProxyTypeFuncCallback : null;
    GDBusObjectManager* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    auto _getProxyTypeFunc = getProxyTypeFunc ? freezeDelegate(cast(void*)&getProxyTypeFunc) : null;
    GDestroyNotify _getProxyTypeFuncDestroyCB = getProxyTypeFunc ? &thawDelegate : null;
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_for_bus_sync(busType, flags, _name, _objectPath, _getProxyTypeFuncCB, _getProxyTypeFunc, _getProxyTypeFuncDestroyCB, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GDBusObjectManagerClient object.
      
      This is a synchronous failable constructor - the calling thread is
      blocked until a reply is received. See [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.new_]
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
          with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gid.gio2.dbus_object_manager_client.DBusObjectManagerClient newSync(gid.gio2.dbus_connection.DBusConnection connection, gid.gio2.types.DBusObjectManagerClientFlags flags, string name, string objectPath, gid.gio2.types.DBusProxyTypeFunc getProxyTypeFunc = null, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data) nothrow
    {
      gidAttachThread();
      gid.gobject2.types.GType _dretval;
      auto _dlg = cast(gid.gio2.types.DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString!(No.Free);
      string _interfaceName = interfaceName.fromCString!(No.Free);

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.DBusProxyTypeFunc");
      }
      auto _retval = cast(GType)_dretval;

      return _retval;
    }
    auto _getProxyTypeFuncCB = getProxyTypeFunc ? &_getProxyTypeFuncCallback : null;
    GDBusObjectManager* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    auto _getProxyTypeFunc = getProxyTypeFunc ? freezeDelegate(cast(void*)&getProxyTypeFunc) : null;
    GDestroyNotify _getProxyTypeFuncDestroyCB = getProxyTypeFunc ? &thawDelegate : null;
    GError *_err;
    _cretval = g_dbus_object_manager_client_new_sync(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, flags, _name, _objectPath, _getProxyTypeFuncCB, _getProxyTypeFunc, _getProxyTypeFuncDestroyCB, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)(cast(GDBusObjectManager*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a new #GDBusObjectManagerClient object.
      
      This is an asynchronous failable constructor. When the result is
      ready, callback will be invoked in the thread-default main context
      (see [gid.glib2.main_context.MainContext.pushThreadDefault])
      of the thread you are calling this method from. You can then call
      [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.newFinish] to get the result. See
      [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.newSync] for the synchronous version.
  
      Params:
        connection = A #GDBusConnection.
        flags = Zero or more flags from the #GDBusObjectManagerClientFlags enumeration.
        name = The owner of the control object (unique or well-known name).
        objectPath = The object path of the control object.
        getProxyTypeFunc = A #GDBusProxyTypeFunc function or null to always construct #GDBusProxy proxies.
        cancellable = A #GCancellable or null
        callback = A #GAsyncReadyCallback to call when the request is satisfied.
  */
  static void new_(gid.gio2.dbus_connection.DBusConnection connection, gid.gio2.types.DBusObjectManagerClientFlags flags, string name, string objectPath, gid.gio2.types.DBusProxyTypeFunc getProxyTypeFunc = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data) nothrow
    {
      gidAttachThread();
      gid.gobject2.types.GType _dretval;
      auto _dlg = cast(gid.gio2.types.DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString!(No.Free);
      string _interfaceName = interfaceName.fromCString!(No.Free);

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.DBusProxyTypeFunc");
      }
      auto _retval = cast(GType)_dretval;

      return _retval;
    }
    auto _getProxyTypeFuncCB = getProxyTypeFunc ? &_getProxyTypeFuncCallback : null;
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    auto _getProxyTypeFunc = getProxyTypeFunc ? freezeDelegate(cast(void*)&getProxyTypeFunc) : null;
    GDestroyNotify _getProxyTypeFuncDestroyCB = getProxyTypeFunc ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_object_manager_client_new(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, flags, _name, _objectPath, _getProxyTypeFuncCB, _getProxyTypeFunc, _getProxyTypeFuncDestroyCB, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Like [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.new_] but takes a #GBusType instead of a
      #GDBusConnection.
      
      This is an asynchronous failable constructor. When the result is
      ready, callback will be invoked in the thread-default main context
      (see [gid.glib2.main_context.MainContext.pushThreadDefault])
      of the thread you are calling this method from. You can
      then call [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.newForBusFinish] to get the result. See
      [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.newForBusSync] for the synchronous version.
  
      Params:
        busType = A #GBusType.
        flags = Zero or more flags from the #GDBusObjectManagerClientFlags enumeration.
        name = The owner of the control object (unique or well-known name).
        objectPath = The object path of the control object.
        getProxyTypeFunc = A #GDBusProxyTypeFunc function or null to always construct #GDBusProxy proxies.
        cancellable = A #GCancellable or null
        callback = A #GAsyncReadyCallback to call when the request is satisfied.
  */
  static void newForBus(gid.gio2.types.BusType busType, gid.gio2.types.DBusObjectManagerClientFlags flags, string name, string objectPath, gid.gio2.types.DBusProxyTypeFunc getProxyTypeFunc = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) GType _getProxyTypeFuncCallback(GDBusObjectManagerClient* manager, const(char)* objectPath, const(char)* interfaceName, void* data) nothrow
    {
      gidAttachThread();
      gid.gobject2.types.GType _dretval;
      auto _dlg = cast(gid.gio2.types.DBusProxyTypeFunc*)data;
      string _objectPath = objectPath.fromCString!(No.Free);
      string _interfaceName = interfaceName.fromCString!(No.Free);

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)(cast(void*)manager, No.Take), _objectPath, _interfaceName);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.DBusProxyTypeFunc");
      }
      auto _retval = cast(GType)_dretval;

      return _retval;
    }
    auto _getProxyTypeFuncCB = getProxyTypeFunc ? &_getProxyTypeFuncCallback : null;
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    auto _getProxyTypeFunc = getProxyTypeFunc ? freezeDelegate(cast(void*)&getProxyTypeFunc) : null;
    GDestroyNotify _getProxyTypeFuncDestroyCB = getProxyTypeFunc ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_object_manager_client_new_for_bus(busType, flags, _name, _objectPath, _getProxyTypeFuncCB, _getProxyTypeFunc, _getProxyTypeFuncDestroyCB, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Signal class handler for the #GDBusObjectManagerClient::interface-proxy-signal signal.
  
      Params:
        objectProxy = 
        interfaceProxy = 
        senderName = 
        signalName = 
        parameters = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInterfaceProxySignal` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncInterfaceProxySignal(gid.gio2.dbus_object_proxy.DBusObjectProxy objectProxy, gid.gio2.dbus_proxy.DBusProxy interfaceProxy, string senderName, string signalName, gid.glib2.variant.Variant parameters)
  {
    auto _klass = cast(GDBusObjectManagerClientClass*)_vfuncClass;
    if (!_klass.interfaceProxySignal)
      return;

    const(char)* _senderName = senderName.toCString!(No.Malloc, No.Nullable);
    const(char)* _signalName = signalName.toCString!(No.Malloc, No.Nullable);
    _klass.interfaceProxySignal(cast(GDBusObjectManagerClient*)this._cPtr, objectProxy ? cast(GDBusObjectProxy*)objectProxy._cPtr(No.Dup) : null, interfaceProxy ? cast(GDBusProxy*)interfaceProxy._cPtr(No.Dup) : null, _senderName, _signalName, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null);
  }

  /**
      Gets the #GDBusConnection used by manager.
      Returns: A #GDBusConnection object. Do not free,
          the object belongs to manager.
  */
  gid.gio2.dbus_connection.DBusConnection getConnection() nothrow
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_object_manager_client_get_connection(cast(GDBusObjectManagerClient*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the flags that manager was constructed with.
      Returns: Zero of more flags from the #GDBusObjectManagerClientFlags
        enumeration.
  */
  gid.gio2.types.DBusObjectManagerClientFlags getFlags() nothrow
  {
    GDBusObjectManagerClientFlags _cretval;
    _cretval = g_dbus_object_manager_client_get_flags(cast(GDBusObjectManagerClient*)this._cPtr);
    gid.gio2.types.DBusObjectManagerClientFlags _retval = cast(gid.gio2.types.DBusObjectManagerClientFlags)_cretval;
    return _retval;
  }

  /**
      Gets the name that manager is for, or null if not a message bus
      connection.
      Returns: A unique or well-known name. Do not free, the string
        belongs to manager.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_dbus_object_manager_client_get_name(cast(GDBusObjectManagerClient*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      The unique name that owns the name that manager is for or null if
      no-one currently owns that name. You can connect to the
      #GObject::notify signal to track changes to the
      #GDBusObjectManagerClient:name-owner property.
      Returns: The name owner or null if no name owner
        exists. Free with [gid.glib2.global.gfree].
  */
  string getNameOwner() nothrow
  {
    char* _cretval;
    _cretval = g_dbus_object_manager_client_get_name_owner(cast(GDBusObjectManagerClient*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
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
        
        This signal is emitted in the thread-default main context
        (see [gid.glib2.main_context.MainContext.pushThreadDefault])
        that manager was constructed in.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.dbus_object_proxy.DBusObjectProxy objectProxy, gid.gio2.dbus_proxy.DBusProxy interfaceProxy, gid.glib2.variant.Variant changedProperties, string[] invalidatedProperties, gid.gio2.dbus_object_manager_client.DBusObjectManagerClient dBusObjectManagerClient)`
  
          `objectProxy` The #GDBusObjectProxy on which an interface has properties that are changing. (optional)
  
          `interfaceProxy` The #GDBusProxy that has properties that are changing. (optional)
  
          `changedProperties` A #GVariant containing the properties that changed (type: `a{sv}`). (optional)
  
          `invalidatedProperties` A null terminated
              array of properties that were invalidated. (optional)
  
          `dBusObjectManagerClient` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInterfaceProxyPropertiesChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_object_proxy.DBusObjectProxy)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_proxy.DBusProxy)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.glib2.variant.Variant)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == string[])))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
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
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.interfaceProxyPropertiesChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-proxy-properties-changed", closure, after);
  }

  /**
      Connect to `InterfaceProxySignal` signal.
  
      Emitted when a D-Bus signal is received on interface_proxy.
        
        This signal exists purely as a convenience to avoid having to
        connect signals to all interface proxies managed by manager.
        
        This signal is emitted in the thread-default main context
        (see [gid.glib2.main_context.MainContext.pushThreadDefault])
        that manager was constructed in.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.dbus_object_proxy.DBusObjectProxy objectProxy, gid.gio2.dbus_proxy.DBusProxy interfaceProxy, string senderName, string signalName, gid.glib2.variant.Variant parameters, gid.gio2.dbus_object_manager_client.DBusObjectManagerClient dBusObjectManagerClient)`
  
          `objectProxy` The #GDBusObjectProxy on which an interface is emitting a D-Bus signal. (optional)
  
          `interfaceProxy` The #GDBusProxy that is emitting a D-Bus signal. (optional)
  
          `senderName` The sender of the signal or NULL if the connection is not a bus connection. (optional)
  
          `signalName` The signal name. (optional)
  
          `parameters` A #GVariant tuple with parameters for the signal. (optional)
  
          `dBusObjectManagerClient` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInterfaceProxySignal(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_object_proxy.DBusObjectProxy)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_proxy.DBusProxy)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == string)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == string)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] == gid.glib2.variant.Variant)))
  && (Parameters!T.length < 6 || (ParameterStorageClassTuple!T[5] == ParameterStorageClass.none && is(Parameters!T[5] : gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)))
  && Parameters!T.length < 7)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.interfaceProxySignal");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-proxy-signal", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from DBusObjectManagerClient
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.dbus_object_manager_client.DBusObjectManagerClient), T.stringof ~ " is not derived from gid.gio2.dbus_object_manager_client.DBusObjectManagerClient");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInterfaceProxySignal", true)[0]) == gid.gio2.dbus_object_manager_client.DBusObjectManagerClient))
      _installVfunc(klass, "interface_proxy_signal");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GDBusObjectManagerClientClass*)klass;

    switch (vfunc)
    {
      case "interface_proxy_signal":
      {
        static extern(C) void _vfuncInterfaceProxySignalTramp(GDBusObjectManagerClient* manager, GDBusObjectProxy* objectProxy, GDBusProxy* interfaceProxy, const(char)* senderName, const(char)* signalName, GVariant* parameters) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.dbus_object_manager_client.DBusObjectManagerClient)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectManagerClientClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.interfaceProxySignal)
              return (cast(typeof(&_vfuncInterfaceProxySignalTramp))_klass.interfaceProxySignal)(manager, objectProxy, interfaceProxy, senderName, signalName, parameters);
            return;
          }

          string _senderName = senderName.fromCString!(No.Free);
          string _signalName = signalName.fromCString!(No.Free);

          try
          {
            _obj.vfuncInterfaceProxySignal(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object_proxy.DBusObjectProxy)(cast(void*)objectProxy, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_proxy.DBusProxy)(cast(void*)interfaceProxy, No.Take), _senderName, _signalName, parameters ? new gid.glib2.variant.Variant(cast(void*)parameters, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager_client.DBusObjectManagerClient.vfuncInterfaceProxySignal");
          }
        }

        _klass.interfaceProxySignal = cast(typeof(_klass.interfaceProxySignal))&_vfuncInterfaceProxySignalTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient]
class DBusObjectManagerClientGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.async_initable.AsyncInitableGidBuilderImpl!T, gid.gio2.dbus_object_manager.DBusObjectManagerGidBuilderImpl!T, gid.gio2.initable.InitableGidBuilderImpl!T
{

  mixin AsyncInitableGidBuilderT!();
  mixin DBusObjectManagerGidBuilderT!();
  mixin InitableGidBuilderT!();

  /**
      Set `busType` property.
      Params:
        propval = If this property is not [gid.gio2.types.BusType.None], then
          #GDBusObjectManagerClient:connection must be null and will be set to the
          #GDBusConnection obtained by calling [gid.gio2.global.busGet] with the value
          of this property.
      Returns: Builder instance for fluent chaining
  */
  T busType(gid.gio2.types.BusType propval) nothrow
  {
    return setProperty("bus-type", propval);
  }

  /**
      Set `connection` property.
      Params:
        propval = The #GDBusConnection to use.
      Returns: Builder instance for fluent chaining
  */
  T connection(gid.gio2.dbus_connection.DBusConnection propval) nothrow
  {
    return setProperty("connection", propval);
  }

  /**
      Set `flags` property.
      Params:
        propval = Flags from the #GDBusObjectManagerClientFlags enumeration.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.gio2.types.DBusObjectManagerClientFlags propval) nothrow
  {
    return setProperty("flags", propval);
  }

  /**
      Set `getProxyTypeDestroyNotify` property.
      Params:
        propval = A #GDestroyNotify for the #gpointer user_data in #GDBusObjectManagerClient:get-proxy-type-user-data.
      Returns: Builder instance for fluent chaining
  */
  T getProxyTypeDestroyNotify(void* propval) nothrow
  {
    return setProperty("get-proxy-type-destroy-notify", propval);
  }

  /**
      Set `getProxyTypeFunc` property.
      Params:
        propval = The #GDBusProxyTypeFunc to use when determining what #GType to
          use for interface proxies or null.
      Returns: Builder instance for fluent chaining
  */
  T getProxyTypeFunc(void* propval) nothrow
  {
    return setProperty("get-proxy-type-func", propval);
  }

  /**
      Set `getProxyTypeUserData` property.
      Params:
        propval = The #gpointer user_data to pass to #GDBusObjectManagerClient:get-proxy-type-func.
      Returns: Builder instance for fluent chaining
  */
  T getProxyTypeUserData(void* propval) nothrow
  {
    return setProperty("get-proxy-type-user-data", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The well-known name or unique name that the manager is for.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `objectPath` property.
      Params:
        propval = The object path the manager is for.
      Returns: Builder instance for fluent chaining
  */
  T objectPath(string propval) nothrow
  {
    return setProperty("object-path", propval);
  }
}

/// Fluent builder for [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient]
final class DBusObjectManagerClientGidBuilder : DBusObjectManagerClientGidBuilderImpl!DBusObjectManagerClientGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DBusObjectManagerClient build() nothrow
  {
    return new DBusObjectManagerClient(cast(void*)createGObject(DBusObjectManagerClient._getGType), Yes.Take);
  }
}
