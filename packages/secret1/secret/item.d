/// Module for [Item] class
module secret.item;

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
import gobject.object;
import secret.c.functions;
import secret.c.types;
import secret.collection;
import secret.retrievable;
import secret.retrievable_mixin;
import secret.schema;
import secret.service;
import secret.types;
import secret.value;

/**
    A secret item
    
    #SecretItem represents a secret item stored in the Secret Service.
    
    Each item has a value, represented by a `struct@Value`, which can be
    retrieved by [secret.item.Item.getSecret] or set by [secret.item.Item.setSecret].
    The item is only available when the item is not locked.
    
    Items can be locked or unlocked using the [secret.service.Service.lock] or
    [secret.service.Service.unlock] functions. The Secret Service may not be able to
    unlock individual items, and may unlock an entire collection when a single
    item is unlocked.
    
    Each item has a set of attributes, which are used to locate the item later.
    These are not stored or transferred in a secure manner. Each attribute has
    a string name and a string value. Use [secret.service.Service.search] to search for
    items based on their attributes, and [secret.item.Item.setAttributes] to change
    the attributes associated with an item.
    
    Items can be created with [secret.item.Item.create] or [secret.service.Service.store].
*/
class Item : gio.dbus_proxy.DBusProxy, secret.retrievable.Retrievable
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
    return cast(void function())secret_item_get_type != &gidSymbolNotFound ? secret_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Item self()
  {
    return this;
  }

  /**
      Get `locked` property.
      Returns: Whether the item is locked or not.
        
        An item may not be independently lockable separate from other items in
        its collection.
        
        To lock or unlock a item use the [secret.service.Service.lock] or
        [secret.service.Service.unlock] functions.
  */
  @property bool locked()
  {
    return getLocked();
  }

  mixin RetrievableT!();

  /**
      Create a new item in the secret service.
      
      If the flags contains [secret.types.ItemCreateFlags.Replace], then the secret
      service will search for an item matching the attributes, and update that item
      instead of creating a new one.
      
      This method may block indefinitely and should not be used in user interface
      threads. The secret service may prompt the user. [secret.service.Service.prompt]
      will be used to handle any prompts that are required.
  
      Params:
        collection = a secret collection to create this item in
        schema = the schema for the attributes
        attributes = attributes for the new item
        label = label for the new item
        value = secret value for the new item
        flags = flags for the creation of the new item
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  static void create(secret.collection.Collection collection, secret.schema.Schema schema, string[string] attributes, string label, secret.value.Value value, secret.types.ItemCreateFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
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
    const(char)* _label = label.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_item_create(collection ? cast(SecretCollection*)collection._cPtr(No.Dup) : null, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _label, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish operation to create a new item in the secret service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: the new item, which should be unreferenced
          with [gobject.object.ObjectWrap.unref]
      Throws: [ErrorWrap]
  */
  static secret.item.Item createFinish(gio.async_result.AsyncResult result)
  {
    SecretItem* _cretval;
    GError *_err;
    _cretval = secret_item_create_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.item.Item)(cast(SecretItem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new item in the secret service.
      
      If the flags contains [secret.types.ItemCreateFlags.Replace], then the secret
      service will search for an item matching the attributes, and update that item
      instead of creating a new one.
      
      This method may block indefinitely and should not be used in user interface
      threads. The secret service may prompt the user. [secret.service.Service.prompt]
      will be used to handle any prompts that are required.
  
      Params:
        collection = a secret collection to create this item in
        schema = the schema for the attributes
        attributes = attributes for the new item
        label = label for the new item
        value = secret value for the new item
        flags = flags for the creation of the new item
        cancellable = optional cancellation object
      Returns: the new item, which should be unreferenced
          with [gobject.object.ObjectWrap.unref]
      Throws: [ErrorWrap]
  */
  static secret.item.Item createSync(secret.collection.Collection collection, secret.schema.Schema schema, string[string] attributes, string label, secret.value.Value value, secret.types.ItemCreateFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    SecretItem* _cretval;
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    const(char)* _label = label.toCString(No.Alloc);
    GError *_err;
    _cretval = secret_item_create_sync(collection ? cast(SecretCollection*)collection._cPtr(No.Dup) : null, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _label, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.item.Item)(cast(SecretItem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Load the secret values for a secret item stored in the service.
      
      The items must all have the same `propertyItem:service` property.
      
      This function returns immediately and completes asynchronously.
  
      Params:
        items = the items to retrieve secrets for
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  static void loadSecrets(secret.item.Item[] items, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _items = gListFromD!(secret.item.Item)(items);
    scope(exit) containerFree!(GList*, secret.item.Item, GidOwnership.None)(_items);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_item_load_secrets(_items, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to load the secret values for
      secret items stored in the service.
      
      Items that are locked will not have their secrets loaded.
  
      Params:
        result = asynchronous result passed to callback
      Returns: whether the operation succeeded or not
      Throws: [ErrorWrap]
  */
  static bool loadSecretsFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_item_load_secrets_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Load the secret values for a secret item stored in the service.
      
      The items must all have the same `propertyItem:service` property.
      
      This method may block indefinitely and should not be used in user interface
      threads.
      
      Items that are locked will not have their secrets loaded.
  
      Params:
        items = the items to retrieve secrets for
        cancellable = optional cancellation object
      Returns: whether the operation succeeded or not
      Throws: [ErrorWrap]
  */
  static bool loadSecretsSync(secret.item.Item[] items, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    auto _items = gListFromD!(secret.item.Item)(items);
    scope(exit) containerFree!(GList*, secret.item.Item, GidOwnership.None)(_items);
    GError *_err;
    _retval = cast(bool)secret_item_load_secrets_sync(_items, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Delete this item.
      
      This method returns immediately and completes asynchronously. The secret
      service may prompt the user. [secret.service.Service.prompt] will be used to handle
      any prompts that show up.
  
      Params:
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void delete_(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_item_delete(cast(SecretItem*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to delete the secret item.
  
      Params:
        result = asynchronous result passed to the callback
      Returns: whether the item was successfully deleted or not
      Throws: [ErrorWrap]
  */
  bool deleteFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_item_delete_finish(cast(SecretItem*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Delete this secret item.
      
      This method may block indefinitely and should not be used in user
      interface threads. The secret service may prompt the user.
      [secret.service.Service.prompt] will be used to handle any prompts that show up.
  
      Params:
        cancellable = optional cancellation object
      Returns: whether the item was successfully deleted or not
      Throws: [ErrorWrap]
  */
  bool deleteSync(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_item_delete_sync(cast(SecretItem*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Set the attributes of this item.
      
      The attributes are a mapping of string keys to string values.
      Attributes are used to search for items. Attributes are not stored
      or transferred securely by the secret service.
      
      Do not modify the attributes returned by this method. Use
      [secret.item.Item.setAttributes] instead.
      Returns: a new reference
          to the attributes, which should not be modified, and
          released with [glib.hash_table.HashTable.unref]
  */
  string[string] getAttributes()
  {
    GHashTable* _cretval;
    _cretval = secret_item_get_attributes(cast(SecretItem*)this._cPtr);
    auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  /**
      Get the created date and time of the item.
      
      The return value is the number of seconds since the unix epoch, January 1st
      1970.
      Returns: the created date and time
  */
  ulong getCreated()
  {
    ulong _retval;
    _retval = secret_item_get_created(cast(SecretItem*)this._cPtr);
    return _retval;
  }

  alias getFlags = gio.dbus_proxy.DBusProxy.getFlags;

  /**
      Get the flags representing what features of the #SecretItem proxy
      have been initialized.
      
      Use [secret.item.Item.loadSecret] to initialize further features
      and change the flags.
      Returns: the flags for features initialized
  */
  secret.types.ItemFlags getFlags()
  {
    SecretItemFlags _cretval;
    _cretval = secret_item_get_flags(cast(SecretItem*)this._cPtr);
    secret.types.ItemFlags _retval = cast(secret.types.ItemFlags)_cretval;
    return _retval;
  }

  /**
      Get the label of this item.
      Returns: the label, which should be freed with `funcGLib.free`
  */
  string getLabel()
  {
    char* _cretval;
    _cretval = secret_item_get_label(cast(SecretItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get whether the item is locked or not.
      
      Depending on the secret service an item may not be able to be locked
      independently from the collection that it is in.
      Returns: whether the item is locked or not
  */
  bool getLocked()
  {
    bool _retval;
    _retval = cast(bool)secret_item_get_locked(cast(SecretItem*)this._cPtr);
    return _retval;
  }

  /**
      Get the modified date and time of the item.
      
      The return value is the number of seconds since the unix epoch, January 1st
      1970.
      Returns: the modified date and time
  */
  ulong getModified()
  {
    ulong _retval;
    _retval = secret_item_get_modified(cast(SecretItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the name of the schema that this item was stored with. This is also
      available at the `xdg:schema` attribute.
      Returns: the schema name
  */
  string getSchemaName()
  {
    char* _cretval;
    _cretval = secret_item_get_schema_name(cast(SecretItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the secret value of this item.
      
      If this item is locked or the secret has not yet been loaded then this will
      return null.
      
      To load the secret call the [secret.item.Item.loadSecret] method.
      Returns: the secret value which should be
          released with [secret.value.Value.unref], or null
  */
  secret.value.Value getSecret()
  {
    SecretValue* _cretval;
    _cretval = secret_item_get_secret(cast(SecretItem*)this._cPtr);
    auto _retval = _cretval ? new secret.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the Secret Service object that this item was created with.
      Returns: the Secret Service object
  */
  secret.service.Service getService()
  {
    SecretService* _cretval;
    _cretval = secret_item_get_service(cast(SecretItem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.service.Service)(cast(SecretService*)_cretval, No.Take);
    return _retval;
  }

  /**
      Load the secret value of this item.
      
      Each item has a single secret which might be a password or some
      other secret binary value.
      
      This function will fail if the secret item is locked.
      
      This function returns immediately and completes asynchronously.
  
      Params:
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void loadSecret(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_item_load_secret(cast(SecretItem*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to load the secret value of this item.
      
      The newly loaded secret value can be accessed by calling
      [secret.item.Item.getSecret].
  
      Params:
        result = asynchronous result passed to callback
      Returns: whether the secret item successfully loaded or not
      Throws: [ErrorWrap]
  */
  bool loadSecretFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_item_load_secret_finish(cast(SecretItem*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Load the secret value of this item.
      
      Each item has a single secret which might be a password or some
      other secret binary value.
      
      This function may block indefinitely. Use the asynchronous version
      in user interface threads.
  
      Params:
        cancellable = optional cancellation object
      Returns: whether the secret item successfully loaded or not
      Throws: [ErrorWrap]
  */
  bool loadSecretSync(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_item_load_secret_sync(cast(SecretItem*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Refresh the properties on this item.
      
      This fires off a request to refresh, and the properties will be updated
      later.
      
      Calling this method is not normally necessary, as the secret service
      will notify the client when properties change.
  */
  void refresh()
  {
    secret_item_refresh(cast(SecretItem*)this._cPtr);
  }

  /**
      Set the attributes of this item.
      
      The attributes are a mapping of string keys to string values.
      Attributes are used to search for items. Attributes are not stored
      or transferred securely by the secret service.
      
      This function returns immediately and completes asynchronously.
  
      Params:
        schema = the schema for the attributes
        attributes = a new set of attributes
        cancellable = optional cancellation object
        callback = called when the asynchronous operation completes
  */
  void setAttributes(secret.schema.Schema schema, string[string] attributes, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
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
    secret_item_set_attributes(cast(SecretItem*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete operation to set the attributes of this item.
  
      Params:
        result = asynchronous result passed to the callback
      Returns: whether the change was successful or not
      Throws: [ErrorWrap]
  */
  bool setAttributesFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_item_set_attributes_finish(cast(SecretItem*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Set the attributes of this item.
      
      The attributes are a mapping of string keys to string values.
      Attributes are used to search for items. Attributes are not stored
      or transferred securely by the secret service.
      
      This function may block indefinitely. Use the asynchronous version
      in user interface threads.
  
      Params:
        schema = the schema for the attributes
        attributes = a new set of attributes
        cancellable = optional cancellation object
      Returns: whether the change was successful or not
      Throws: [ErrorWrap]
  */
  bool setAttributesSync(secret.schema.Schema schema, string[string] attributes, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    auto _attributes = gHashTableFromD!(string, string)(attributes);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
    GError *_err;
    _retval = cast(bool)secret_item_set_attributes_sync(cast(SecretItem*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Set the label of this item.
      
      This function returns immediately and completes asynchronously.
  
      Params:
        label = a new label
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void setLabel(string label, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _label = label.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_item_set_label(cast(SecretItem*)this._cPtr, _label, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to set the label of this collection.
  
      Params:
        result = asynchronous result passed to callback
      Returns: whether the change was successful or not
      Throws: [ErrorWrap]
  */
  bool setLabelFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_item_set_label_finish(cast(SecretItem*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Set the label of this item.
      
      This function may block indefinitely. Use the asynchronous version
      in user interface threads.
  
      Params:
        label = a new label
        cancellable = optional cancellation object
      Returns: whether the change was successful or not
      Throws: [ErrorWrap]
  */
  bool setLabelSync(string label, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _label = label.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)secret_item_set_label_sync(cast(SecretItem*)this._cPtr, _label, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Set the secret value of this item.
      
      Each item has a single secret which might be a password or some
      other secret binary value.
      
      This function returns immediately and completes asynchronously.
  
      Params:
        value = a new secret value
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void setSecret(secret.value.Value value, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_item_set_secret(cast(SecretItem*)this._cPtr, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to set the secret value of this item.
  
      Params:
        result = asynchronous result passed to callback
      Returns: whether the change was successful or not
      Throws: [ErrorWrap]
  */
  bool setSecretFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_item_set_secret_finish(cast(SecretItem*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Set the secret value of this item.
      
      Each item has a single secret which might be a password or some
      other secret binary value.
      
      This function may block indefinitely. Use the asynchronous version
      in user interface threads.
  
      Params:
        value = a new secret value
        cancellable = optional cancellation object
      Returns: whether the change was successful or not
      Throws: [ErrorWrap]
  */
  bool setSecretSync(secret.value.Value value, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_item_set_secret_sync(cast(SecretItem*)this._cPtr, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
