/// Module for [Service] class
module gid.secret1.service;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_initable;
import gid.gio2.async_initable_mixin;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.dbus_interface;
import gid.gio2.dbus_interface_mixin;
import gid.gio2.dbus_proxy;
import gid.gio2.initable;
import gid.gio2.initable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.variant;
import gid.glib2.variant_type;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.secret1.backend;
import gid.secret1.backend_mixin;
import gid.secret1.c.functions;
import gid.secret1.c.types;
import gid.secret1.collection;
import gid.secret1.item;
import gid.secret1.prompt;
import gid.secret1.schema;
import gid.secret1.types;
import gid.secret1.value;

/**
    A proxy object representing the Secret Service.
    
    A #SecretService object either represents an implementation of the
    [`org.freedesktop.Secret`](https://specifications.freedesktop.org/secret-service/latest/)
    D-Bus service or a file that is encrypted using a master secret that was
    provided by the
    [secret portal](https://flatpak.github.io/xdg-desktop-portal/docs/doc-org.freedesktop.portal.Secret.html).
    
    Normally a single #SecretService object can be shared between multiple
    callers. The [gid.secret1.service.Service.get] method is used to access this #SecretService
    object. If a new independent #SecretService object is required, use
    [gid.secret1.service.Service.open].
    
    In order to securely transfer secrets to the Sercret Service, a session
    is established. This session can be established while initializing a
    #SecretService object by passing the [gid.secret1.types.ServiceFlags.OpenSession] flag
    to the [gid.secret1.service.Service.get] or [gid.secret1.service.Service.open] functions. In order to
    establish a session on an already existing #SecretService, use the
    [gid.secret1.service.Service.ensureSession] function.
    
    To search for items, use the [gid.secret1.service.Service.search] method.
    
    Multiple collections can exist in the Secret Service, each of which contains
    secret items. In order to instantiate [gid.secret1.collection.Collection] objects which
    represent those collections while initializing a #SecretService then pass
    the [gid.secret1.types.ServiceFlags.LoadCollections] flag to the [gid.secret1.service.Service.get] or
    [gid.secret1.service.Service.open] functions. In order to establish a session on an already
    existing #SecretService, use the [gid.secret1.service.Service.loadCollections] function.
    To access the list of collections use [gid.secret1.service.Service.getCollections].
    
    Certain actions on the Secret Service require user prompting to complete,
    such as creating a collection, or unlocking a collection. When such a prompt
    is necessary, then a [gid.secret1.prompt.Prompt] object is created by this library, and
    passed to the [gid.secret1.service.Service.prompt] method. In this way it is handled
    automatically.
    
    In order to customize prompt handling, override the
    `vfunc@Service.prompt_async` and `vfunc@Service.prompt_finish` virtual
    methods of the #SecretService class.
*/
class Service : gid.gio2.dbus_proxy.DBusProxy, gid.secret1.backend.Backend
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
    return cast(void function())secret_service_get_type != &gidSymbolNotFound ? secret_service_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SecretService";
  }

  /** Returns `this`, for use in `with` statements. */
  override Service self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.secret1.service.Service]
      Returns: New builder object
  */
  static ServiceGidBuilder builder() nothrow
  {
    return new ServiceGidBuilder;
  }

  mixin BackendT!();

  /**
      Disconnect the default #SecretService proxy returned by [gid.secret1.service.Service.get]
      and [gid.secret1.service.Service.getSync].
      
      It is not necessary to call this function, but you may choose to do so at
      program exit. It is useful for testing that memory is not leaked.
      
      This function is safe to call at any time. But if other objects in this
      library are still referenced, then this will not result in all memory
      being freed.
  */
  static void disconnect() nothrow
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
  static void get(gid.secret1.types.ServiceFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_get(flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an asynchronous operation to get a #SecretService proxy for the
      Secret Service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: a new reference to a #SecretService proxy, which
          should be released with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gid.secret1.service.Service getFinish(gid.gio2.async_result.AsyncResult result)
  {
    SecretService* _cretval;
    GError *_err;
    _cretval = secret_service_get_finish(result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.secret1.service.Service)(cast(SecretService*)_cretval, Yes.Take);
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
          should be released with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gid.secret1.service.Service getSync(gid.secret1.types.ServiceFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    SecretService* _cretval;
    GError *_err;
    _cretval = secret_service_get_sync(flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.secret1.service.Service)(cast(SecretService*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #SecretService proxy for the Secret Service.
      
      This function is rarely used, see [gid.secret1.service.Service.get] instead.
      
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
  static void open(gid.gobject2.types.GType serviceGtype, string serviceBusName, gid.secret1.types.ServiceFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
    const(char)* _serviceBusName = serviceBusName.toCString!(No.Malloc, Yes.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_open(serviceGtype, _serviceBusName, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an asynchronous operation to create a new #SecretService proxy for
      the Secret Service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: a new reference to a #SecretService proxy, which
          should be released with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gid.secret1.service.Service openFinish(gid.gio2.async_result.AsyncResult result)
  {
    SecretService* _cretval;
    GError *_err;
    _cretval = secret_service_open_finish(result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.secret1.service.Service)(cast(SecretService*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #SecretService proxy for the Secret Service.
      
      This function is rarely used, see [gid.secret1.service.Service.getSync] instead.
      
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
          should be released with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gid.secret1.service.Service openSync(gid.gobject2.types.GType serviceGtype, string serviceBusName, gid.secret1.types.ServiceFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    SecretService* _cretval;
    const(char)* _serviceBusName = serviceBusName.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = secret_service_open_sync(serviceGtype, _serviceBusName, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.secret1.service.Service)(cast(SecretService*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the GObject type for collections instantiated by this service.
      
      This will always be either [gid.secret1.collection.Collection] or derived from it.
      Returns: the gobject type for collections
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetCollectionGtype` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gobject2.types.GType vfuncGetCollectionGtype()
  {
    auto _klass = cast(SecretServiceClass*)_vfuncClass;
    if (!_klass.getCollectionGtype)
      return typeof(return).init;

    gid.gobject2.types.GType _retval;
    _retval = _klass.getCollectionGtype(cast(SecretService*)this._cPtr);
    return _retval;
  }

  /**
      Get the GObject type for items instantiated by this service.
      
      This will always be either [gid.secret1.item.Item] or derived from it.
      Returns: the gobject type for items
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetItemGtype` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gobject2.types.GType vfuncGetItemGtype()
  {
    auto _klass = cast(SecretServiceClass*)_vfuncClass;
    if (!_klass.getItemGtype)
      return typeof(return).init;

    gid.gobject2.types.GType _retval;
    _retval = _klass.getItemGtype(cast(SecretService*)this._cPtr);
    return _retval;
  }

  /**
      called to perform asynchronous prompting when necessary
  
      Params:
        prompt = 
        returnType = 
        cancellable = 
        callback = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPromptAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncPromptAsync(gid.secret1.prompt.Prompt prompt, gid.glib2.variant_type.VariantType returnType, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(SecretServiceClass*)_vfuncClass;
    if (!_klass.promptAsync)
      return;

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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.promptAsync(cast(SecretService*)this._cPtr, prompt ? cast(SecretPrompt*)prompt._cPtr(No.Dup) : null, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to perform prompting for a [gid.secret1.prompt.Prompt].
      
      Returns a variant result if the prompt was completed and not dismissed. The
      type of result depends on the action the prompt is completing, and is defined
      in the Secret Service DBus API specification.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: null if the prompt was dismissed or an error occurred,
          a variant result if the prompt was successful
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPromptFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.glib2.variant.Variant vfuncPromptFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(SecretServiceClass*)_vfuncClass;
    if (!_klass.promptFinish)
      return typeof(return).init;

    GVariant* _cretval;
    GError *_err;
    _cretval = _klass.promptFinish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Perform prompting for a [gid.secret1.prompt.Prompt].
      
      Runs a prompt and performs the prompting. Returns a variant result if the
      prompt was completed and not dismissed. The type of result depends on the
      action the prompt is completing, and is defined in the Secret Service DBus
      API specification.
      
      This function is called by other parts of this library to handle prompts
      for the various actions that can require prompting.
      
      Override the #SecretServiceClass `vfuncService.prompt_sync` virtual method
      to change the behavior of the prompting. The default behavior is to simply
      run [gid.secret1.prompt.Prompt.performSync] on the prompt with a null `window_id`.
  
      Params:
        prompt = the prompt
        cancellable = optional cancellation object
        returnType = the variant type of the prompt result
      Returns: null if the prompt was dismissed or an error occurred,
          a variant result if the prompt was successful
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPromptSync` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.glib2.variant.Variant vfuncPromptSync(gid.secret1.prompt.Prompt prompt, gid.gio2.cancellable.Cancellable cancellable, gid.glib2.variant_type.VariantType returnType)
  {
    auto _klass = cast(SecretServiceClass*)_vfuncClass;
    if (!_klass.promptSync)
      return typeof(return).init;

    GVariant* _cretval;
    GError *_err;
    _cretval = _klass.promptSync(cast(SecretService*)this._cPtr, prompt ? cast(SecretPrompt*)prompt._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Remove unlocked items which match the attributes from the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If service is null, then [gid.secret1.service.Service.get] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        schema = the schema for the attributes
        attributes = the attribute keys and values
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void clear(gid.secret1.schema.Schema schema, string[string] attributes, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
  bool clearFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_clear_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Remove unlocked items which match the attributes from the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If service is null, then [gid.secret1.service.Service.getSync] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        schema = the schema for the attributes
        attributes = the attribute keys and values
        cancellable = optional cancellation object
      Returns: whether items were removed or not
      Throws: [ErrorWrap]
  */
  bool clearSync(gid.secret1.schema.Schema schema, string[string] attributes, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    GError *_err;
    _retval = cast(bool)secret_service_clear_sync(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Create a new item in a secret service collection and return its D-Bus
      object path.
      
      It is often easier to use `funcpassword_store_sync` or [gid.secret1.item.Item.createSync]
      rather than using this function. Using this method requires that you setup
      a correct hash table of D-Bus properties for the new collection.
      
      If the flags contains [gid.secret1.types.ItemCreateFlags.Replace], then the secret
      service will search for an item matching the attributes, and update that item
      instead of creating a new one.
      
      properties is a set of properties for the new collection. The keys in the
      hash table should be interface.property strings like
      `org.freedesktop.Secret.Item.Label`. The values
      in the hash table should be [gid.glib2.variant.Variant] values of the properties.
      
      This method may block indefinitely and should not be used in user interface
      threads. The secret service may prompt the user. [gid.secret1.service.Service.prompt]
      will be used to handle any prompts that are required.
  
      Params:
        collectionPath = the D-Bus path of the collection in which to create item
        properties = hash table of D-Bus properties
            for the new collection
        value = the secret value to store in the item
        flags = flags for the creation of the new item
        cancellable = optional cancellation object
      Returns: a new string containing the D-Bus object path
          of the item
      Throws: [ErrorWrap]
  */
  string createItemDbusPathSync(string collectionPath, gid.glib2.variant.Variant[string] properties, gid.secret1.value.Value value, gid.secret1.types.ItemCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    char* _cretval;
    const(char)* _collectionPath = collectionPath.toCString!(No.Malloc, No.Nullable);
    auto _properties = gHashTableFromD!(string, gid.glib2.variant.Variant)(properties);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_properties);
    GError *_err;
    _cretval = secret_service_create_item_dbus_path_sync(cast(SecretService*)this._cPtr, _collectionPath, _properties, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Decode a [gid.secret1.value.Value] into [gid.glib2.variant.Variant] received with the Secret Service
      DBus API.
      
      The [gid.glib2.variant.Variant] should have a `(oayays)` signature.
      
      A session must have already been established by the [gid.secret1.service.Service], and
      the encoded secret must be valid for that session.
  
      Params:
        value = the encoded secret
      Returns: the decoded secret value
  */
  gid.secret1.value.Value decodeDbusSecret(gid.glib2.variant.Variant value) nothrow
  {
    SecretValue* _cretval;
    _cretval = secret_service_decode_dbus_secret(cast(SecretService*)this._cPtr, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.secret1.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Encodes a [gid.secret1.value.Value] into [gid.glib2.variant.Variant] for use with the Secret
      Service DBus API.
      
      The resulting [gid.glib2.variant.Variant] will have a `(oayays)` signature.
      
      A session must have already been established by the [gid.secret1.service.Service].
  
      Params:
        value = the secret value
      Returns: the encoded secret
  */
  gid.glib2.variant.Variant encodeDbusSecret(gid.secret1.value.Value value) nothrow
  {
    GVariant* _cretval;
    _cretval = secret_service_encode_dbus_secret(cast(SecretService*)this._cPtr, value ? cast(SecretValue*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Ensure that the #SecretService proxy has established a session with the
      Secret Service.
      
      This session is used to transfer secrets.
      
      It is not normally necessary to call this method, as the session is
      established as necessary. You can also pass the [gid.secret1.types.ServiceFlags.OpenSession]
      to [gid.secret1.service.Service.get] in order to ensure that a session has been established
      by the time you get the #SecretService proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void ensureSession(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
  bool ensureSessionFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_ensure_session_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Ensure that the #SecretService proxy has established a session with the
      Secret Service.
      
      This session is used to transfer secrets.
      
      It is not normally necessary to call this method, as the session is
      established as necessary. You can also pass the [gid.secret1.types.ServiceFlags.OpenSession]
      to [gid.secret1.service.Service.getSync] in order to ensure that a session has been
      established by the time you get the #SecretService proxy.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        cancellable = optional cancellation object
      Returns: whether a session is established or not
      Throws: [ErrorWrap]
  */
  bool ensureSessionSync(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_ensure_session_sync(cast(SecretService*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Get the GObject type for collections instantiated by this service.
      
      This will always be either [gid.secret1.collection.Collection] or derived from it.
      Returns: the gobject type for collections
  */
  gid.gobject2.types.GType getCollectionGtype() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = secret_service_get_collection_gtype(cast(SecretService*)this._cPtr);
    return _retval;
  }

  /**
      Get a list of [gid.secret1.collection.Collection] objects representing all the collections
      in the secret service.
      
      If the [gid.secret1.types.ServiceFlags.LoadCollections] flag was not specified when
      initializing #SecretService proxy object, then this method will return
      null. Use [gid.secret1.service.Service.loadCollections] to load the collections.
      Returns: a
          list of the collections in the secret service
  */
  gid.secret1.collection.Collection[] getCollections() nothrow
  {
    GList* _cretval;
    _cretval = secret_service_get_collections(cast(SecretService*)this._cPtr);
    auto _retval = gListToD!(gid.secret1.collection.Collection, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  alias getFlags = gid.gio2.dbus_proxy.DBusProxy.getFlags;

  /**
      Get the flags representing what features of the #SecretService proxy
      have been initialized.
      
      Use [gid.secret1.service.Service.ensureSession] or [gid.secret1.service.Service.loadCollections]
      to initialize further features and change the flags.
      Returns: the flags for features initialized
  */
  gid.secret1.types.ServiceFlags getFlags() nothrow
  {
    SecretServiceFlags _cretval;
    _cretval = secret_service_get_flags(cast(SecretService*)this._cPtr);
    gid.secret1.types.ServiceFlags _retval = cast(gid.secret1.types.ServiceFlags)_cretval;
    return _retval;
  }

  /**
      Get the GObject type for items instantiated by this service.
      
      This will always be either [gid.secret1.item.Item] or derived from it.
      Returns: the gobject type for items
  */
  gid.gobject2.types.GType getItemGtype() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = secret_service_get_item_gtype(cast(SecretService*)this._cPtr);
    return _retval;
  }

  /**
      Get the set of algorithms being used to transfer secrets between this
      secret service proxy and the Secret Service itself.
      
      This will be null if no session has been established. Use
      [gid.secret1.service.Service.ensureSession] to establish a session.
      Returns: a string representing the algorithms for transferring
          secrets
  */
  string getSessionAlgorithms() nothrow
  {
    const(char)* _cretval;
    _cretval = secret_service_get_session_algorithms(cast(SecretService*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the D-Bus object path of the session object being used to transfer
      secrets between this secret service proxy and the Secret Service itself.
      
      This will be null if no session has been established. Use
      [gid.secret1.service.Service.ensureSession] to establish a session.
      Returns: a string representing the D-Bus object path of the
          session
  */
  string getSessionDbusPath() nothrow
  {
    const(char)* _cretval;
    _cretval = secret_service_get_session_dbus_path(cast(SecretService*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Ensure that the #SecretService proxy has loaded all the collections present
      in the Secret Service.
      
      This affects the result of [gid.secret1.service.Service.getCollections].
      
      You can also pass the [gid.secret1.types.ServiceFlags.LoadCollections] to
      [gid.secret1.service.Service.getSync] in order to ensure that the collections have been
      loaded by the time you get the #SecretService proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void loadCollections(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
  bool loadCollectionsFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_load_collections_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Ensure that the #SecretService proxy has loaded all the collections present
      in the Secret Service.
      
      This affects the result of [gid.secret1.service.Service.getCollections].
      
      You can also pass the [gid.secret1.types.ServiceFlags.LoadCollections] to
      [gid.secret1.service.Service.getSync] in order to ensure that the collections have been
      loaded by the time you get the #SecretService proxy.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        cancellable = optional cancellation object
      Returns: whether the load was successful or not
      Throws: [ErrorWrap]
  */
  bool loadCollectionsSync(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_load_collections_sync(cast(SecretService*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Lock items or collections in the secret service.
      
      The secret service may not be able to lock items individually, and may
      lock an entire collection instead.
      
      If service is null, then [gid.secret1.service.Service.get] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      This method returns immediately and completes asynchronously. The secret
      service may prompt the user. [gid.secret1.service.Service.prompt] will be used to handle
      any prompts that show up.
  
      Params:
        objects = the items or collections to lock
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void lock(gid.gio2.dbus_proxy.DBusProxy[] objects, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
    auto _objects = gListFromD!(gid.gio2.dbus_proxy.DBusProxy)(objects);
    scope(exit) containerFree!(GList*, gid.gio2.dbus_proxy.DBusProxy, GidOwnership.None)(_objects);
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
  int lockFinish(gid.gio2.async_result.AsyncResult result, out gid.gio2.dbus_proxy.DBusProxy[] locked)
  {
    int _retval;
    GList* _locked;
    GError *_err;
    _retval = secret_service_lock_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_locked, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    locked = gListToD!(gid.gio2.dbus_proxy.DBusProxy, GidOwnership.Full)(_locked);
    return _retval;
  }

  /**
      Lock items or collections in the secret service.
      
      The secret service may not be able to lock items individually, and may
      lock an entire collection instead.
      
      If service is null, then [gid.secret1.service.Service.getSync] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      This method may block indefinitely and should not be used in user
      interface threads. The secret service may prompt the user.
      [gid.secret1.service.Service.prompt] will be used to handle any prompts that show up.
  
      Params:
        objects = the items or collections to lock
        cancellable = optional cancellation object
        locked = location to place list of items or collections that were locked
      Returns: the number of items or collections that were locked
      Throws: [ErrorWrap]
  */
  int lockSync(gid.gio2.dbus_proxy.DBusProxy[] objects, gid.gio2.cancellable.Cancellable cancellable, out gid.gio2.dbus_proxy.DBusProxy[] locked)
  {
    int _retval;
    auto _objects = gListFromD!(gid.gio2.dbus_proxy.DBusProxy)(objects);
    scope(exit) containerFree!(GList*, gid.gio2.dbus_proxy.DBusProxy, GidOwnership.None)(_objects);
    GList* _locked;
    GError *_err;
    _retval = secret_service_lock_sync(cast(SecretService*)this._cPtr, _objects, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_locked, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    locked = gListToD!(gid.gio2.dbus_proxy.DBusProxy, GidOwnership.Full)(_locked);
    return _retval;
  }

  /**
      Lookup a secret value in the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If service is null, then [gid.secret1.service.Service.get] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        schema = the schema for the attributes
        attributes = the attribute keys and values
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void lookup(gid.secret1.schema.Schema schema, string[string] attributes, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
      Returns: a newly allocated [gid.secret1.value.Value], which should be
          released with [gid.secret1.value.Value.unref], or null if no secret found
      Throws: [ErrorWrap]
  */
  gid.secret1.value.Value lookupFinish(gid.gio2.async_result.AsyncResult result)
  {
    SecretValue* _cretval;
    GError *_err;
    _cretval = secret_service_lookup_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.secret1.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Lookup a secret value in the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If service is null, then [gid.secret1.service.Service.getSync] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        schema = the schema for the attributes
        attributes = the attribute keys and values
        cancellable = optional cancellation object
      Returns: a newly allocated [gid.secret1.value.Value], which should be
          released with [gid.secret1.value.Value.unref], or null if no secret found
      Throws: [ErrorWrap]
  */
  gid.secret1.value.Value lookupSync(gid.secret1.schema.Schema schema, string[string] attributes, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    SecretValue* _cretval;
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    GError *_err;
    _cretval = secret_service_lookup_sync(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.secret1.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Perform prompting for a [gid.secret1.prompt.Prompt].
      
      This function is called by other parts of this library to handle prompts
      for the various actions that can require prompting.
      
      Override the #SecretServiceClass `vfuncService.prompt_async` virtual method
      to change the behavior of the prompting. The default behavior is to simply
      run [gid.secret1.prompt.Prompt.perform] on the prompt.
  
      Params:
        prompt = the prompt
        returnType = the variant type of the prompt result
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void prompt(gid.secret1.prompt.Prompt prompt, gid.glib2.variant_type.VariantType returnType = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_service_prompt(cast(SecretService*)this._cPtr, prompt ? cast(SecretPrompt*)prompt._cPtr(No.Dup) : null, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to perform prompting for a [gid.secret1.prompt.Prompt].
      
      Returns a variant result if the prompt was completed and not dismissed. The
      type of result depends on the action the prompt is completing, and is defined
      in the Secret Service DBus API specification.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: null if the prompt was dismissed or an error occurred,
          a variant result if the prompt was successful
      Throws: [ErrorWrap]
  */
  gid.glib2.variant.Variant promptFinish(gid.gio2.async_result.AsyncResult result)
  {
    GVariant* _cretval;
    GError *_err;
    _cretval = secret_service_prompt_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Perform prompting for a [gid.secret1.prompt.Prompt].
      
      Runs a prompt and performs the prompting. Returns a variant result if the
      prompt was completed and not dismissed. The type of result depends on the
      action the prompt is completing, and is defined in the Secret Service DBus
      API specification.
      
      This function is called by other parts of this library to handle prompts
      for the various actions that can require prompting.
      
      Override the #SecretServiceClass `vfuncService.prompt_sync` virtual method
      to change the behavior of the prompting. The default behavior is to simply
      run [gid.secret1.prompt.Prompt.performSync] on the prompt with a null `window_id`.
  
      Params:
        prompt = the prompt
        cancellable = optional cancellation object
        returnType = the variant type of the prompt result
      Returns: null if the prompt was dismissed or an error occurred,
          a variant result if the prompt was successful
      Throws: [ErrorWrap]
  */
  gid.glib2.variant.Variant promptSync(gid.secret1.prompt.Prompt prompt, gid.gio2.cancellable.Cancellable cancellable, gid.glib2.variant_type.VariantType returnType)
  {
    GVariant* _cretval;
    GError *_err;
    _cretval = secret_service_prompt_sync(cast(SecretService*)this._cPtr, prompt ? cast(SecretPrompt*)prompt._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Search for items matching the attributes.
      
      All collections are searched. The attributes should be a table of string
      keys and string values.
      
      If service is null, then [gid.secret1.service.Service.get] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      If [gid.secret1.types.SearchFlags.All] is set in flags, then all the items matching the
      search will be returned. Otherwise only the first item will be returned.
      This is almost always the unlocked item that was most recently stored.
      
      If [gid.secret1.types.SearchFlags.Unlock] is set in flags, then items will be unlocked
      if necessary. In either case, locked and unlocked items will match the
      search and be returned. If the unlock fails, the search does not fail.
      
      If [gid.secret1.types.SearchFlags.LoadSecrets] is set in flags, then the items will have
      their secret values loaded and available via [gid.secret1.item.Item.getSecret].
      
      This function returns immediately and completes asynchronously.
  
      Params:
        schema = the schema for the attributes
        attributes = search for items matching these attributes
        flags = search option flags
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void search(gid.secret1.schema.Schema schema, string[string] attributes, gid.secret1.types.SearchFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
  gid.secret1.item.Item[] searchFinish(gid.gio2.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = secret_service_search_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.secret1.item.Item, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Search for items matching the attributes.
      
      All collections are searched. The attributes should be a table of string
      keys and string values.
      
      If service is null, then [gid.secret1.service.Service.getSync] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      If [gid.secret1.types.SearchFlags.All] is set in flags, then all the items matching the
      search will be returned. Otherwise only the first item will be returned.
      This is almost always the unlocked item that was most recently stored.
      
      If [gid.secret1.types.SearchFlags.Unlock] is set in flags, then items will be unlocked
      if necessary. In either case, locked and unlocked items will match the
      search and be returned. If the unlock fails, the search does not fail.
      
      If [gid.secret1.types.SearchFlags.LoadSecrets] is set in flags, then the items' secret
      values will be loaded for any unlocked items. Loaded item secret values
      are available via [gid.secret1.item.Item.getSecret]. If the load of a secret values
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
  gid.secret1.item.Item[] searchSync(gid.secret1.schema.Schema schema, string[string] attributes, gid.secret1.types.SearchFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    GError *_err;
    _cretval = secret_service_search_sync(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.secret1.item.Item, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Assign a collection to this alias.
      
      Aliases help determine well known collections, such as 'default'.
      
      If service is null, then [gid.secret1.service.Service.get] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        alias_ = the alias to assign the collection to
        collection = the collection to assign to the alias
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void setAlias(string alias_, gid.secret1.collection.Collection collection = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
    const(char)* _alias_ = alias_.toCString!(No.Malloc, No.Nullable);
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
  bool setAliasFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_set_alias_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Assign a collection to this alias. Aliases help determine
      well known collections, such as 'default'.
      
      If service is null, then [gid.secret1.service.Service.getSync] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      This method may block and should not be used in user interface threads.
  
      Params:
        alias_ = the alias to assign the collection to
        collection = the collection to assign to the alias
        cancellable = optional cancellation object
      Returns: true if successful
      Throws: [ErrorWrap]
  */
  bool setAliasSync(string alias_, gid.secret1.collection.Collection collection = null, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _alias_ = alias_.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)secret_service_set_alias_sync(cast(SecretService*)this._cPtr, _alias_, collection ? cast(SecretCollection*)collection._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Store a secret value in the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If the attributes match a secret item already stored in the collection, then
      the item will be updated with these new values.
      
      If service is null, then [gid.secret1.service.Service.get] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      If collection is not specified, then the default collection will be
      used. Use [gid.secret1.types.COLLECTION_SESSION] to store the password in the session
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
  void store(gid.secret1.schema.Schema schema, string[string] attributes, string collection, string label, gid.secret1.value.Value value, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    const(char)* _collection = collection.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
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
  bool storeFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_service_store_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Store a secret value in the secret service.
      
      The attributes should be a set of key and value string pairs.
      
      If the attributes match a secret item already stored in the collection, then
      the item will be updated with these new values.
      
      If collection is null, then the default collection will be
      used. Use [gid.secret1.types.COLLECTION_SESSION] to store the password in the session
      collection, which doesn't get stored across login sessions.
      
      If service is null, then [gid.secret1.service.Service.getSync] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
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
  bool storeSync(gid.secret1.schema.Schema schema, string[string] attributes, string collection, string label, gid.secret1.value.Value value, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    const(char)* _collection = collection.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)secret_service_store_sync(cast(SecretService*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _collection, _label, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Unlock items or collections in the secret service.
      
      The secret service may not be able to unlock items individually, and may
      unlock an entire collection instead.
      
      If service is null, then [gid.secret1.service.Service.get] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      This method may block indefinitely and should not be used in user
      interface threads. The secret service may prompt the user.
      [gid.secret1.service.Service.prompt] will be used to handle any prompts that show up.
  
      Params:
        objects = the items or collections to unlock
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void unlock(gid.gio2.dbus_proxy.DBusProxy[] objects, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
    auto _objects = gListFromD!(gid.gio2.dbus_proxy.DBusProxy)(objects);
    scope(exit) containerFree!(GList*, gid.gio2.dbus_proxy.DBusProxy, GidOwnership.None)(_objects);
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
  int unlockFinish(gid.gio2.async_result.AsyncResult result, out gid.gio2.dbus_proxy.DBusProxy[] unlocked)
  {
    int _retval;
    GList* _unlocked;
    GError *_err;
    _retval = secret_service_unlock_finish(cast(SecretService*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_unlocked, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    unlocked = gListToD!(gid.gio2.dbus_proxy.DBusProxy, GidOwnership.Full)(_unlocked);
    return _retval;
  }

  /**
      Unlock items or collections in the secret service.
      
      The secret service may not be able to unlock items individually, and may
      unlock an entire collection instead.
      
      If service is null, then [gid.secret1.service.Service.getSync] will be called to get
      the default [gid.secret1.service.Service] proxy.
      
      This method may block indefinitely and should not be used in user
      interface threads. The secret service may prompt the user.
      [gid.secret1.service.Service.prompt] will be used to handle any prompts that show up.
  
      Params:
        objects = the items or collections to unlock
        cancellable = optional cancellation object
        unlocked = location to place list of items or collections that were unlocked
      Returns: the number of items or collections that were unlocked
      Throws: [ErrorWrap]
  */
  int unlockSync(gid.gio2.dbus_proxy.DBusProxy[] objects, gid.gio2.cancellable.Cancellable cancellable, out gid.gio2.dbus_proxy.DBusProxy[] unlocked)
  {
    int _retval;
    auto _objects = gListFromD!(gid.gio2.dbus_proxy.DBusProxy)(objects);
    scope(exit) containerFree!(GList*, gid.gio2.dbus_proxy.DBusProxy, GidOwnership.None)(_objects);
    GList* _unlocked;
    GError *_err;
    _retval = secret_service_unlock_sync(cast(SecretService*)this._cPtr, _objects, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_unlocked, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    unlocked = gListToD!(gid.gio2.dbus_proxy.DBusProxy, GidOwnership.Full)(_unlocked);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Service
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.secret1.service.Service), T.stringof ~ " is not derived from gid.secret1.service.Service");

    gid.gio2.dbus_proxy.DBusProxy._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetCollectionGtype", true)[0]) == gid.secret1.service.Service))
      _installVfunc(klass, "get_collection_gtype");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetItemGtype", true)[0]) == gid.secret1.service.Service))
      _installVfunc(klass, "get_item_gtype");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPromptAsync", true)[0]) == gid.secret1.service.Service))
      static assert(0, "Overriding gid.secret1.service.Service.vfuncPromptAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPromptFinish", true)[0]) == gid.secret1.service.Service))
      _installVfunc(klass, "prompt_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPromptSync", true)[0]) == gid.secret1.service.Service))
      _installVfunc(klass, "prompt_sync");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(SecretServiceClass*)klass;

    switch (vfunc)
    {
      case "get_collection_gtype":
      {
        static extern(C) GType _vfuncGetCollectionGtypeTramp(SecretService* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.secret1.service.Service)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(SecretServiceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.getCollectionGtype)
              return (cast(typeof(&_vfuncGetCollectionGtypeTramp))_klass.getCollectionGtype)(self);
            return typeof(return).init;
          }

          gid.gobject2.types.GType _dretval;

          try
          {
            _dretval = _obj.vfuncGetCollectionGtype();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.secret1.service.Service.vfuncGetCollectionGtype");
          }
          auto _retval = cast(GType)_dretval;

          return _retval;
        }

        _klass.getCollectionGtype = cast(typeof(_klass.getCollectionGtype))&_vfuncGetCollectionGtypeTramp;
        break;
      }
      case "get_item_gtype":
      {
        static extern(C) GType _vfuncGetItemGtypeTramp(SecretService* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.secret1.service.Service)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(SecretServiceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.getItemGtype)
              return (cast(typeof(&_vfuncGetItemGtypeTramp))_klass.getItemGtype)(self);
            return typeof(return).init;
          }

          gid.gobject2.types.GType _dretval;

          try
          {
            _dretval = _obj.vfuncGetItemGtype();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.secret1.service.Service.vfuncGetItemGtype");
          }
          auto _retval = cast(GType)_dretval;

          return _retval;
        }

        _klass.getItemGtype = cast(typeof(_klass.getItemGtype))&_vfuncGetItemGtypeTramp;
        break;
      }
      case "prompt_finish":
      {
        static extern(C) GVariant* _vfuncPromptFinishTramp(SecretService* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.secret1.service.Service)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(SecretServiceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.promptFinish)
              return (cast(typeof(&_vfuncPromptFinishTramp))_klass.promptFinish)(self, result, _err);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;

          try
          {
            _dretval = _obj.vfuncPromptFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.promptFinish = cast(typeof(_klass.promptFinish))&_vfuncPromptFinishTramp;
        break;
      }
      case "prompt_sync":
      {
        static extern(C) GVariant* _vfuncPromptSyncTramp(SecretService* self, SecretPrompt* prompt, GCancellable* cancellable, const(GVariantType)* returnType, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.secret1.service.Service)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(SecretServiceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.promptSync)
              return (cast(typeof(&_vfuncPromptSyncTramp))_klass.promptSync)(self, prompt, cancellable, returnType, _err);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;

          try
          {
            _dretval = _obj.vfuncPromptSync(gid.gobject2.object.ObjectWrap._getDObject!(gid.secret1.prompt.Prompt)(cast(void*)prompt, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take), returnType ? new gid.glib2.variant_type.VariantType(cast(void*)returnType, No.Take) : null);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.promptSync = cast(typeof(_klass.promptSync))&_vfuncPromptSyncTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.secret1.service.Service]
class ServiceGidBuilderImpl(T) : gid.gio2.dbus_proxy.DBusProxyGidBuilderImpl!T, gid.secret1.backend.BackendGidBuilderImpl!T
{

  mixin BackendGidBuilderT!();
}

/// Fluent builder for [gid.secret1.service.Service]
final class ServiceGidBuilder : ServiceGidBuilderImpl!ServiceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Service build() nothrow
  {
    return new Service(cast(void*)createGObject(Service._getGType), Yes.Take);
  }
}
