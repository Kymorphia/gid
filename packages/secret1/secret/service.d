/// Module for [Service] class
module secret.service;

import gid.gid;
import gio.async_initable;
import gio.async_initable_mixin;
import gio.async_result;
import gio.cancellable;
import gio.dbus_interface;
import gio.dbus_interface_mixin;
import gio.dbus_proxy;
import gio.initable;
import gio.initable_mixin;
import gio.types;
import glib.error;
import glib.variant;
import glib.variant_type;
import gobject.object;
import gobject.types;
import secret.backend;
import secret.backend_mixin;
import secret.c.functions;
import secret.c.types;
import secret.collection;
import secret.item;
import secret.prompt;
import secret.schema;
import secret.types;
import secret.value;

/**
    A proxy object representing the Secret Service.
    
    A #SecretService object represents the Secret Service implementation which
    runs as a D-Bus service.
    
    Normally a single #SecretService object can be shared between multiple
    callers. The [secret.service.Service.get] method is used to access this #SecretService
    object. If a new independent #SecretService object is required, use
    [secret.service.Service.open].
    
    In order to securely transfer secrets to the Sercret Service, a session
    is established. This session can be established while initializing a
    #SecretService object by passing the [secret.types.ServiceFlags.OpenSession] flag
    to the [secret.service.Service.get] or [secret.service.Service.open] functions. In order to
    establish a session on an already existing #SecretService, use the
    [secret.service.Service.ensureSession] function.
    
    To search for items, use the [secret.service.Service.search] method.
    
    Multiple collections can exist in the Secret Service, each of which contains
    secret items. In order to instantiate `class@Collection` objects which
    represent those collections while initializing a #SecretService then pass
    the [secret.types.ServiceFlags.LoadCollections] flag to the [secret.service.Service.get] or
    [secret.service.Service.open] functions. In order to establish a session on an already
    existing #SecretService, use the [secret.service.Service.loadCollections] function.
    To access the list of collections use [secret.service.Service.getCollections].
    
    Certain actions on the Secret Service require user prompting to complete,
    such as creating a collection, or unlocking a collection. When such a prompt
    is necessary, then a `class@Prompt` object is created by this library, and
    passed to the [secret.service.Service.prompt] method. In this way it is handled
    automatically.
    
    In order to customize prompt handling, override the
    `vfunc@Service.prompt_async` and `vfunc@Service.prompt_finish` virtual
    methods of the #SecretService class.
*/
class Service : gio.dbus_proxy.DBusProxy, secret.backend.Backend
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
    return cast(void function())secret_service_get_type != &gidSymbolNotFound ? secret_service_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Service self()
  {
    return this;
  }

  mixin BackendT!();

  /**
      Disconnect the default #SecretService proxy returned by [secret.service.Service.get]
      and [secret.service.Service.getSync].
      
      It is not necessary to call this function, but you may choose to do so at
      program exit. It is useful for testing that memory is not leaked.
      
      This function is safe to call at any time. But if other objects in this
      library are still referenced, then this will not result in all memory
      being freed.
  */
  static void disconnect()
  {
    secret_service_disconnect();
  }

  /**
      Get a #SecretService proxy for the Secret Service.
      
      If such a proxy object already exists, then the same proxy is returned.
      
      If flags contains any flags of which parts of the secret service to
      ensure are initialized, then those will be initialized before completing.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        flags = flags for which service functionality to ensure is initialized
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  static void get(secret.types.ServiceFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_get(flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an asynchronous operation to get a #SecretService proxy for the
      Secret Service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: a new reference to a #SecretService proxy, which
          should be released with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static secret.service.Service getFinish(gio.async_result.AsyncResult result)
  {
    SecretService* _cretval;
    GError *_err;
    _cretval = secret_service_get_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.service.Service)(cast(SecretService*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a #SecretService proxy for the Secret Service.
      
      If such a proxy object already exists, then the same proxy is returned.
      
      If flags contains any flags of which parts of the secret service to
      ensure are initialized, then those will be initialized before returning.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        flags = flags for which service functionality to ensure is initialized
        cancellable = optional cancellation object
      Returns: a new reference to a #SecretService proxy, which
          should be released with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static secret.service.Service getSync(secret.types.ServiceFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    SecretService* _cretval;
    GError *_err;
    _cretval = secret_service_get_sync(flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.service.Service)(cast(SecretService*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #SecretService proxy for the Secret Service.
      
      This function is rarely used, see [secret.service.Service.get] instead.
      
      The service_gtype argument should be set to `SECRET_TYPE_SERVICE` or a the type
      of a derived class.
      
      If flags contains any flags of which parts of the secret service to
      ensure are initialized, then those will be initialized before returning.
      
      If service_bus_name is null then the default is used.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        serviceGtype = the GType of the new secret service
        serviceBusName = the D-Bus service name of the secret service
        flags = flags for which service functionality to ensure is initialized
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  static void open(gobject.types.GType serviceGtype, string serviceBusName, secret.types.ServiceFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _serviceBusName = serviceBusName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_open(serviceGtype, _serviceBusName, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an asynchronous operation to create a new #SecretService proxy for
      the Secret Service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: a new reference to a #SecretService proxy, which
          should be released with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static secret.service.Service openFinish(gio.async_result.AsyncResult result)
  {
    SecretService* _cretval;
    GError *_err;
    _cretval = secret_service_open_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.service.Service)(cast(SecretService*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #SecretService proxy for the Secret Service.
      
      This function is rarely used, see [secret.service.Service.getSync] instead.
      
      The service_gtype argument should be set to `SECRET_TYPE_SERVICE` or a the
      type of a derived class.
      
      If flags contains any flags of which parts of the secret service to
      ensure are initialized, then those will be initialized before returning.
      
      If service_bus_name is null then the default is used.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        serviceGtype = the GType of the new secret service
        serviceBusName = the D-Bus service name of the secret service
        flags = flags for which service functionality to ensure is initialized
        cancellable = optional cancellation object
      Returns: a new reference to a #SecretService proxy, which
          should be released with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static secret.service.Service openSync(gobject.types.GType serviceGtype, string serviceBusName, secret.types.ServiceFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    SecretService* _cretval;
    const(char)* _serviceBusName = serviceBusName.toCString(No.Alloc);
    GError *_err;
    _cretval = secret_service_open_sync(serviceGtype, _serviceBusName, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.service.Service)(cast(SecretService*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Remove unlocked items which match the attributes from the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If service is null, then [secret.service.Service.get] will be called to get
      the default `classService` proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        schema = the schema for the attributes
        attributes = the attribute keys and values
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void clear(secret.schema.Schema schema, string[string] attributes, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_clear(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish asynchronous operation to remove items from the secret
      service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: whether items were removed or not
      Throws: [ErrorWrap]
  */
  bool clearFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_clear_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Remove unlocked items which match the attributes from the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If service is null, then [secret.service.Service.getSync] will be called to get
      the default `classService` proxy.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        schema = the schema for the attributes
        attributes = the attribute keys and values
        cancellable = optional cancellation object
      Returns: whether items were removed or not
      Throws: [ErrorWrap]
  */
  bool clearSync(secret.schema.Schema schema, string[string] attributes, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    GError *_err;
    _retval = cast(bool)secret_service_clear_sync(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Decode a `structValue` into [glib.variant.Variant] received with the Secret Service
      DBus API.
      
      The [glib.variant.Variant] should have a `(oayays)` signature.
      
      A session must have already been established by the `classService`, and
      the encoded secret must be valid for that session.
  
      Params:
        value = the encoded secret
      Returns: the decoded secret value
  */
  secret.value.Value decodeDbusSecret(glib.variant.Variant value)
  {
    SecretValue* _cretval;
    _cretval = secret_service_decode_dbus_secret(cast(SecretService*)this._cPtr, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new secret.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Encodes a `structValue` into [glib.variant.Variant] for use with the Secret
      Service DBus API.
      
      The resulting [glib.variant.Variant] will have a `(oayays)` signature.
      
      A session must have already been established by the `classService`.
  
      Params:
        value = the secret value
      Returns: the encoded secret
  */
  glib.variant.Variant encodeDbusSecret(secret.value.Value value)
  {
    GVariant* _cretval;
    _cretval = secret_service_encode_dbus_secret(cast(SecretService*)this._cPtr, value ? cast(SecretValue*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Ensure that the #SecretService proxy has established a session with the
      Secret Service.
      
      This session is used to transfer secrets.
      
      It is not normally necessary to call this method, as the session is
      established as necessary. You can also pass the [secret.types.ServiceFlags.OpenSession]
      to [secret.service.Service.get] in order to ensure that a session has been established
      by the time you get the #SecretService proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void ensureSession(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_ensure_session(cast(SecretService*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation to ensure that the #SecretService proxy
      has established a session with the Secret Service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: whether a session is established or not
      Throws: [ErrorWrap]
  */
  bool ensureSessionFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_ensure_session_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Ensure that the #SecretService proxy has established a session with the
      Secret Service.
      
      This session is used to transfer secrets.
      
      It is not normally necessary to call this method, as the session is
      established as necessary. You can also pass the [secret.types.ServiceFlags.OpenSession]
      to [secret.service.Service.getSync] in order to ensure that a session has been
      established by the time you get the #SecretService proxy.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        cancellable = optional cancellation object
      Returns: whether a session is established or not
      Throws: [ErrorWrap]
  */
  bool ensureSessionSync(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_ensure_session_sync(cast(SecretService*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Get the GObject type for collections instantiated by this service.
      
      This will always be either `classCollection` or derived from it.
      Returns: the gobject type for collections
  */
  gobject.types.GType getCollectionGtype()
  {
    gobject.types.GType _retval;
    _retval = secret_service_get_collection_gtype(cast(SecretService*)this._cPtr);
    return _retval;
  }

  /**
      Get a list of `classCollection` objects representing all the collections
      in the secret service.
      
      If the [secret.types.ServiceFlags.LoadCollections] flag was not specified when
      initializing #SecretService proxy object, then this method will return
      null. Use [secret.service.Service.loadCollections] to load the collections.
      Returns: a
          list of the collections in the secret service
  */
  secret.collection.Collection[] getCollections()
  {
    GList* _cretval;
    _cretval = secret_service_get_collections(cast(SecretService*)this._cPtr);
    auto _retval = gListToD!(secret.collection.Collection, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  alias getFlags = gio.dbus_proxy.DBusProxy.getFlags;

  /**
      Get the flags representing what features of the #SecretService proxy
      have been initialized.
      
      Use [secret.service.Service.ensureSession] or [secret.service.Service.loadCollections]
      to initialize further features and change the flags.
      Returns: the flags for features initialized
  */
  secret.types.ServiceFlags getFlags()
  {
    SecretServiceFlags _cretval;
    _cretval = secret_service_get_flags(cast(SecretService*)this._cPtr);
    secret.types.ServiceFlags _retval = cast(secret.types.ServiceFlags)_cretval;
    return _retval;
  }

  /**
      Get the GObject type for items instantiated by this service.
      
      This will always be either `classItem` or derived from it.
      Returns: the gobject type for items
  */
  gobject.types.GType getItemGtype()
  {
    gobject.types.GType _retval;
    _retval = secret_service_get_item_gtype(cast(SecretService*)this._cPtr);
    return _retval;
  }

  /**
      Get the set of algorithms being used to transfer secrets between this
      secret service proxy and the Secret Service itself.
      
      This will be null if no session has been established. Use
      [secret.service.Service.ensureSession] to establish a session.
      Returns: a string representing the algorithms for transferring
          secrets
  */
  string getSessionAlgorithms()
  {
    const(char)* _cretval;
    _cretval = secret_service_get_session_algorithms(cast(SecretService*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the D-Bus object path of the session object being used to transfer
      secrets between this secret service proxy and the Secret Service itself.
      
      This will be null if no session has been established. Use
      [secret.service.Service.ensureSession] to establish a session.
      Returns: a string representing the D-Bus object path of the
          session
  */
  string getSessionDbusPath()
  {
    const(char)* _cretval;
    _cretval = secret_service_get_session_dbus_path(cast(SecretService*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Ensure that the #SecretService proxy has loaded all the collections present
      in the Secret Service.
      
      This affects the result of [secret.service.Service.getCollections].
      
      You can also pass the [secret.types.ServiceFlags.LoadCollections] to
      [secret.service.Service.getSync] in order to ensure that the collections have been
      loaded by the time you get the #SecretService proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void loadCollections(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_load_collections(cast(SecretService*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an asynchronous operation to ensure that the #SecretService proxy
      has loaded all the collections present in the Secret Service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: whether the load was successful or not
      Throws: [ErrorWrap]
  */
  bool loadCollectionsFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_load_collections_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Ensure that the #SecretService proxy has loaded all the collections present
      in the Secret Service.
      
      This affects the result of [secret.service.Service.getCollections].
      
      You can also pass the [secret.types.ServiceFlags.LoadCollections] to
      [secret.service.Service.getSync] in order to ensure that the collections have been
      loaded by the time you get the #SecretService proxy.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        cancellable = optional cancellation object
      Returns: whether the load was successful or not
      Throws: [ErrorWrap]
  */
  bool loadCollectionsSync(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_load_collections_sync(cast(SecretService*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Lock items or collections in the secret service.
      
      The secret service may not be able to lock items individually, and may
      lock an entire collection instead.
      
      If service is null, then [secret.service.Service.get] will be called to get
      the default `classService` proxy.
      
      This method returns immediately and completes asynchronously. The secret
      service may prompt the user. [secret.service.Service.prompt] will be used to handle
      any prompts that show up.
  
      Params:
        objects = the items or collections to lock
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void lock(gio.dbus_proxy.DBusProxy[] objects, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _objects = gListFromD!(gio.dbus_proxy.DBusProxy)(objects);
    scope(exit) containerFree!(GList*, gio.dbus_proxy.DBusProxy, GidOwnership.None)(_objects);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_lock(cast(SecretService*)this._cPtr, _objects, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to lock items or collections in the secret
      service.
      
      The secret service may not be able to lock items individually, and may
      lock an entire collection instead.
  
      Params:
        result = asynchronous result passed to the callback
        locked = location to place list of items or collections that were locked
      Returns: the number of items or collections that were locked
      Throws: [ErrorWrap]
  */
  int lockFinish(gio.async_result.AsyncResult result, out gio.dbus_proxy.DBusProxy[] locked)
  {
    int _retval;
    GList* _locked;
    GError *_err;
    _retval = secret_service_lock_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_locked, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    locked = gListToD!(gio.dbus_proxy.DBusProxy, GidOwnership.Full)(_locked);
    return _retval;
  }

  /**
      Lock items or collections in the secret service.
      
      The secret service may not be able to lock items individually, and may
      lock an entire collection instead.
      
      If service is null, then [secret.service.Service.getSync] will be called to get
      the default `classService` proxy.
      
      This method may block indefinitely and should not be used in user
      interface threads. The secret service may prompt the user.
      [secret.service.Service.prompt] will be used to handle any prompts that show up.
  
      Params:
        objects = the items or collections to lock
        cancellable = optional cancellation object
        locked = location to place list of items or collections that were locked
      Returns: the number of items or collections that were locked
      Throws: [ErrorWrap]
  */
  int lockSync(gio.dbus_proxy.DBusProxy[] objects, gio.cancellable.Cancellable cancellable, out gio.dbus_proxy.DBusProxy[] locked)
  {
    int _retval;
    auto _objects = gListFromD!(gio.dbus_proxy.DBusProxy)(objects);
    scope(exit) containerFree!(GList*, gio.dbus_proxy.DBusProxy, GidOwnership.None)(_objects);
    GList* _locked;
    GError *_err;
    _retval = secret_service_lock_sync(cast(SecretService*)this._cPtr, _objects, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_locked, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    locked = gListToD!(gio.dbus_proxy.DBusProxy, GidOwnership.Full)(_locked);
    return _retval;
  }

  /**
      Lookup a secret value in the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If service is null, then [secret.service.Service.get] will be called to get
      the default `classService` proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        schema = the schema for the attributes
        attributes = the attribute keys and values
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void lookup(secret.schema.Schema schema, string[string] attributes, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_lookup(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish asynchronous operation to lookup a secret value in the secret service.
      
      If no secret is found then null is returned.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: a newly allocated `structValue`, which should be
          released with [secret.value.Value.unref], or null if no secret found
      Throws: [ErrorWrap]
  */
  secret.value.Value lookupFinish(gio.async_result.AsyncResult result)
  {
    SecretValue* _cretval;
    GError *_err;
    _cretval = secret_service_lookup_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new secret.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Lookup a secret value in the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If service is null, then [secret.service.Service.getSync] will be called to get
      the default `classService` proxy.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        schema = the schema for the attributes
        attributes = the attribute keys and values
        cancellable = optional cancellation object
      Returns: a newly allocated `structValue`, which should be
          released with [secret.value.Value.unref], or null if no secret found
      Throws: [ErrorWrap]
  */
  secret.value.Value lookupSync(secret.schema.Schema schema, string[string] attributes, gio.cancellable.Cancellable cancellable = null)
  {
    SecretValue* _cretval;
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    GError *_err;
    _cretval = secret_service_lookup_sync(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new secret.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Perform prompting for a `classPrompt`.
      
      This function is called by other parts of this library to handle prompts
      for the various actions that can require prompting.
      
      Override the #SecretServiceClass `vfuncService.prompt_async` virtual method
      to change the behavior of the prompting. The default behavior is to simply
      run [secret.prompt.Prompt.perform] on the prompt.
  
      Params:
        prompt = the prompt
        returnType = the variant type of the prompt result
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void prompt(secret.prompt.Prompt prompt, glib.variant_type.VariantType returnType = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_prompt(cast(SecretService*)this._cPtr, prompt ? cast(SecretPrompt*)prompt._cPtr(No.Dup) : null, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to perform prompting for a `classPrompt`.
      
      Returns a variant result if the prompt was completed and not dismissed. The
      type of result depends on the action the prompt is completing, and is defined
      in the Secret Service DBus API specification.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: null if the prompt was dismissed or an error occurred,
          a variant result if the prompt was successful
      Throws: [ErrorWrap]
  */
  glib.variant.Variant promptFinish(gio.async_result.AsyncResult result)
  {
    GVariant* _cretval;
    GError *_err;
    _cretval = secret_service_prompt_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Perform prompting for a `classPrompt`.
      
      Runs a prompt and performs the prompting. Returns a variant result if the
      prompt was completed and not dismissed. The type of result depends on the
      action the prompt is completing, and is defined in the Secret Service DBus
      API specification.
      
      This function is called by other parts of this library to handle prompts
      for the various actions that can require prompting.
      
      Override the #SecretServiceClass `vfuncService.prompt_sync` virtual method
      to change the behavior of the prompting. The default behavior is to simply
      run [secret.prompt.Prompt.performSync] on the prompt with a null `window_id`.
  
      Params:
        prompt = the prompt
        cancellable = optional cancellation object
        returnType = the variant type of the prompt result
      Returns: null if the prompt was dismissed or an error occurred,
          a variant result if the prompt was successful
      Throws: [ErrorWrap]
  */
  glib.variant.Variant promptSync(secret.prompt.Prompt prompt, gio.cancellable.Cancellable cancellable, glib.variant_type.VariantType returnType)
  {
    GVariant* _cretval;
    GError *_err;
    _cretval = secret_service_prompt_sync(cast(SecretService*)this._cPtr, prompt ? cast(SecretPrompt*)prompt._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Search for items matching the attributes.
      
      All collections are searched. The attributes should be a table of string
      keys and string values.
      
      If service is null, then [secret.service.Service.get] will be called to get
      the default `classService` proxy.
      
      If [secret.types.SearchFlags.All] is set in flags, then all the items matching the
      search will be returned. Otherwise only the first item will be returned.
      This is almost always the unlocked item that was most recently stored.
      
      If [secret.types.SearchFlags.Unlock] is set in flags, then items will be unlocked
      if necessary. In either case, locked and unlocked items will match the
      search and be returned. If the unlock fails, the search does not fail.
      
      If [secret.types.SearchFlags.LoadSecrets] is set in flags, then the items will have
      their secret values loaded and available via [secret.item.Item.getSecret].
      
      This function returns immediately and completes asynchronously.
  
      Params:
        schema = the schema for the attributes
        attributes = search for items matching these attributes
        flags = search option flags
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void search(secret.schema.Schema schema, string[string] attributes, secret.types.SearchFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_search(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to search for items.
  
      Params:
        result = asynchronous result passed to callback
      Returns: a list of items that matched the search
      Throws: [ErrorWrap]
  */
  secret.item.Item[] searchFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = secret_service_search_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(secret.item.Item, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Search for items matching the attributes.
      
      All collections are searched. The attributes should be a table of string
      keys and string values.
      
      If service is null, then [secret.service.Service.getSync] will be called to get
      the default `classService` proxy.
      
      If [secret.types.SearchFlags.All] is set in flags, then all the items matching the
      search will be returned. Otherwise only the first item will be returned.
      This is almost always the unlocked item that was most recently stored.
      
      If [secret.types.SearchFlags.Unlock] is set in flags, then items will be unlocked
      if necessary. In either case, locked and unlocked items will match the
      search and be returned. If the unlock fails, the search does not fail.
      
      If [secret.types.SearchFlags.LoadSecrets] is set in flags, then the items' secret
      values will be loaded for any unlocked items. Loaded item secret values
      are available via [secret.item.Item.getSecret]. If the load of a secret values
      fail, then the
      
      This function may block indefinitely. Use the asynchronous version
      in user interface threads.
  
      Params:
        schema = the schema for the attributes
        attributes = search for items matching these attributes
        flags = search option flags
        cancellable = optional cancellation object
      Returns: a list of items that matched the search
      Throws: [ErrorWrap]
  */
  secret.item.Item[] searchSync(secret.schema.Schema schema, string[string] attributes, secret.types.SearchFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    GError *_err;
    _cretval = secret_service_search_sync(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(secret.item.Item, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Assign a collection to this alias.
      
      Aliases help determine well known collections, such as 'default'.
      
      If service is null, then [secret.service.Service.get] will be called to get
      the default `classService` proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        alias_ = the alias to assign the collection to
        collection = the collection to assign to the alias
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void setAlias(string alias_, secret.collection.Collection collection = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _alias_ = alias_.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_set_alias(cast(SecretService*)this._cPtr, _alias_, collection ? cast(SecretCollection*)collection._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation to assign a collection to an alias.
  
      Params:
        result = asynchronous result passed to callback
      Returns: true if successful
      Throws: [ErrorWrap]
  */
  bool setAliasFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_set_alias_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Assign a collection to this alias. Aliases help determine
      well known collections, such as 'default'.
      
      If service is null, then [secret.service.Service.getSync] will be called to get
      the default `classService` proxy.
      
      This method may block and should not be used in user interface threads.
  
      Params:
        alias_ = the alias to assign the collection to
        collection = the collection to assign to the alias
        cancellable = optional cancellation object
      Returns: true if successful
      Throws: [ErrorWrap]
  */
  bool setAliasSync(string alias_, secret.collection.Collection collection = null, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _alias_ = alias_.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)secret_service_set_alias_sync(cast(SecretService*)this._cPtr, _alias_, collection ? cast(SecretCollection*)collection._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Store a secret value in the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If the attributes match a secret item already stored in the collection, then
      the item will be updated with these new values.
      
      If service is null, then [secret.service.Service.get] will be called to get
      the default `classService` proxy.
      
      If collection is not specified, then the default collection will be
      used. Use `constCOLLECTION_SESSION` to store the password in the session
      collection, which doesn't get stored across login sessions.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        schema = the schema to use to check attributes
        attributes = the attribute keys and values
        collection = a collection alias, or D-Bus object path of the
            collection where to store the secret
        label = label for the secret
        value = the secret value
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void store(secret.schema.Schema schema, string[string] attributes, string collection, string label, secret.value.Value value, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    const(char)* _collection = collection.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_store(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _collection, _label, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish asynchronous operation to store a secret value in the secret service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: whether the storage was successful or not
      Throws: [ErrorWrap]
  */
  bool storeFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_store_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Store a secret value in the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If the attributes match a secret item already stored in the collection, then
      the item will be updated with these new values.
      
      If collection is null, then the default collection will be
      used. Use `constCOLLECTION_SESSION` to store the password in the session
      collection, which doesn't get stored across login sessions.
      
      If service is null, then [secret.service.Service.getSync] will be called to get
      the default `classService` proxy.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        schema = the schema for the attributes
        attributes = the attribute keys and values
        collection = a collection alias, or D-Bus object path of the
            collection where to store the secret
        label = label for the secret
        value = the secret value
        cancellable = optional cancellation object
      Returns: whether the storage was successful or not
      Throws: [ErrorWrap]
  */
  bool storeSync(secret.schema.Schema schema, string[string] attributes, string collection, string label, secret.value.Value value, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    const(char)* _collection = collection.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)secret_service_store_sync(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _collection, _label, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Unlock items or collections in the secret service.
      
      The secret service may not be able to unlock items individually, and may
      unlock an entire collection instead.
      
      If service is null, then [secret.service.Service.get] will be called to get
      the default `classService` proxy.
      
      This method may block indefinitely and should not be used in user
      interface threads. The secret service may prompt the user.
      [secret.service.Service.prompt] will be used to handle any prompts that show up.
  
      Params:
        objects = the items or collections to unlock
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void unlock(gio.dbus_proxy.DBusProxy[] objects, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _objects = gListFromD!(gio.dbus_proxy.DBusProxy)(objects);
    scope(exit) containerFree!(GList*, gio.dbus_proxy.DBusProxy, GidOwnership.None)(_objects);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_unlock(cast(SecretService*)this._cPtr, _objects, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to unlock items or collections in the secret
      service.
      
      The secret service may not be able to unlock items individually, and may
      unlock an entire collection instead.
  
      Params:
        result = asynchronous result passed to the callback
        unlocked = location to place list of items or collections that were unlocked
      Returns: the number of items or collections that were unlocked
      Throws: [ErrorWrap]
  */
  int unlockFinish(gio.async_result.AsyncResult result, out gio.dbus_proxy.DBusProxy[] unlocked)
  {
    int _retval;
    GList* _unlocked;
    GError *_err;
    _retval = secret_service_unlock_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_unlocked, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    unlocked = gListToD!(gio.dbus_proxy.DBusProxy, GidOwnership.Full)(_unlocked);
    return _retval;
  }

  /**
      Unlock items or collections in the secret service.
      
      The secret service may not be able to unlock items individually, and may
      unlock an entire collection instead.
      
      If service is null, then [secret.service.Service.getSync] will be called to get
      the default `classService` proxy.
      
      This method may block indefinitely and should not be used in user
      interface threads. The secret service may prompt the user.
      [secret.service.Service.prompt] will be used to handle any prompts that show up.
  
      Params:
        objects = the items or collections to unlock
        cancellable = optional cancellation object
        unlocked = location to place list of items or collections that were unlocked
      Returns: the number of items or collections that were unlocked
      Throws: [ErrorWrap]
  */
  int unlockSync(gio.dbus_proxy.DBusProxy[] objects, gio.cancellable.Cancellable cancellable, out gio.dbus_proxy.DBusProxy[] unlocked)
  {
    int _retval;
    auto _objects = gListFromD!(gio.dbus_proxy.DBusProxy)(objects);
    scope(exit) containerFree!(GList*, gio.dbus_proxy.DBusProxy, GidOwnership.None)(_objects);
    GList* _unlocked;
    GError *_err;
    _retval = secret_service_unlock_sync(cast(SecretService*)this._cPtr, _objects, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_unlocked, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    unlocked = gListToD!(gio.dbus_proxy.DBusProxy, GidOwnership.Full)(_unlocked);
    return _retval;
  }
}
