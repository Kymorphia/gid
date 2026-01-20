/// Module for [Collection] class
module secret.collection;

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
import secret.item;
import secret.schema;
import secret.service;
import secret.types;

/**
    A proxy object representing a collection of secrets in the Secret Service.
    
    #SecretCollection represents a collection of secret items stored in the
    Secret Service.
    
    A collection can be in a locked or unlocked state. Use
    `method@SecretService.lock` or `method@SecretService.unlock` to lock or
    unlock the collection.
    
    Use the `property@SecretCollection:items` property or
    `method@SecretCollection.get_items` to lookup the items in the collection.
    There may not be any items exposed when the collection is locked.
*/
class Collection : gio.dbus_proxy.DBusProxy
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
    return cast(void function())secret_collection_get_type != &gidSymbolNotFound ? secret_collection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Collection self()
  {
    return this;
  }

  /**
      Get `created` property.
      Returns: The date and time (in seconds since the UNIX epoch) that this
        collection was created.
  */
  @property ulong created()
  {
    return getCreated();
  }

  /**
      Set `created` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          collection was created.
  */
  @property void created(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("created", propval);
  }

  /**
      Get `label` property.
      Returns: The human readable label for the collection.
        
        Setting this property will result in the label of the collection being
        set asynchronously. To properly track the changing of the label use the
        [secret.collection.Collection.setLabel] function.
  */
  @property string label()
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The human readable label for the collection.
          
          Setting this property will result in the label of the collection being
          set asynchronously. To properly track the changing of the label use the
          [secret.collection.Collection.setLabel] function.
  */
  @property void label(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("label", propval);
  }

  /**
      Get `locked` property.
      Returns: Whether the collection is locked or not.
        
        To lock or unlock a collection use the [secret.service.Service.lock] or
        [secret.service.Service.unlock] functions.
  */
  @property bool locked()
  {
    return getLocked();
  }

  /**
      Get `modified` property.
      Returns: The date and time (in seconds since the UNIX epoch) that this
        collection was last modified.
  */
  @property ulong modified()
  {
    return getModified();
  }

  /**
      Set `modified` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          collection was last modified.
  */
  @property void modified(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("modified", propval);
  }

  /**
      Create a new collection in the secret service.
      
      This method returns immediately and completes asynchronously. The secret
      service may prompt the user. [secret.service.Service.prompt] will be used to handle
      any prompts that are required.
      
      An alias is a well-known tag for a collection, such as 'default' (ie: the
      default collection to store items in). This allows other applications to
      easily identify and share a collection. If you specify an alias, and a
      collection with that alias already exists, then a new collection will not
      be created. The previous one will be returned instead.
      
      If service is null, then [secret.service.Service.get] will be called to get the
      default `classService` proxy.
  
      Params:
        service = a secret service object
        label = label for the new collection
        alias_ = alias to assign to the collection
        flags = currently unused
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  static void create(secret.service.Service service, string label, string alias_, secret.types.CollectionCreateFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _alias_ = alias_.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_collection_create(service ? cast(SecretService*)service._cPtr(No.Dup) : null, _label, _alias_, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish operation to create a new collection in the secret service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: the new collection, which should be unreferenced
          with [gobject.object.ObjectWrap.unref]
      Throws: [ErrorWrap]
  */
  static secret.collection.Collection createFinish(gio.async_result.AsyncResult result)
  {
    SecretCollection* _cretval;
    GError *_err;
    _cretval = secret_collection_create_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.collection.Collection)(cast(SecretCollection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new collection in the secret service.
      
      This method may block indefinitely and should not be used in user interface
      threads. The secret service may prompt the user. [secret.service.Service.prompt]
      will be used to handle any prompts that are required.
      
      An alias is a well-known tag for a collection, such as `default` (ie: the
      default collection to store items in). This allows other applications to
      easily identify and share a collection. If you specify an alias, and a
      collection with that alias already exists, then a new collection will not
      be created. The previous one will be returned instead.
      
      If service is null, then [secret.service.Service.getSync] will be called to get the
      default `classService` proxy.
  
      Params:
        service = a secret service object
        label = label for the new collection
        alias_ = alias to assign to the collection
        flags = currently unused
        cancellable = optional cancellation object
      Returns: the new collection, which should be unreferenced
          with [gobject.object.ObjectWrap.unref]
      Throws: [ErrorWrap]
  */
  static secret.collection.Collection createSync(secret.service.Service service, string label, string alias_, secret.types.CollectionCreateFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    SecretCollection* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _alias_ = alias_.toCString(No.Alloc);
    GError *_err;
    _cretval = secret_collection_create_sync(service ? cast(SecretService*)service._cPtr(No.Dup) : null, _label, _alias_, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.collection.Collection)(cast(SecretCollection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Lookup which collection is assigned to this alias. Aliases help determine
      well known collections, such as 'default'.
      
      If service is null, then [secret.service.Service.get] will be called to get the
      default `classService` proxy.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        service = a secret service object
        alias_ = the alias to lookup
        flags = options for the collection initialization
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  static void forAlias(secret.service.Service service, string alias_, secret.types.CollectionFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
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
    secret_collection_for_alias(service ? cast(SecretService*)service._cPtr(No.Dup) : null, _alias_, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation to lookup which collection is assigned
      to an alias.
  
      Params:
        result = asynchronous result passed to callback
      Returns: the collection, or null if none assigned to the alias
      Throws: [ErrorWrap]
  */
  static secret.collection.Collection forAliasFinish(gio.async_result.AsyncResult result)
  {
    SecretCollection* _cretval;
    GError *_err;
    _cretval = secret_collection_for_alias_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.collection.Collection)(cast(SecretCollection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Lookup which collection is assigned to this alias. Aliases help determine
      well known collections, such as `default`.
      
      If service is null, then [secret.service.Service.getSync] will be called to get the
      default `classService` proxy.
      
      This method may block and should not be used in user interface threads.
  
      Params:
        service = a secret service object
        alias_ = the alias to lookup
        flags = options for the collection initialization
        cancellable = optional cancellation object
      Returns: the collection, or null if none assigned to the alias
      Throws: [ErrorWrap]
  */
  static secret.collection.Collection forAliasSync(secret.service.Service service, string alias_, secret.types.CollectionFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    SecretCollection* _cretval;
    const(char)* _alias_ = alias_.toCString(No.Alloc);
    GError *_err;
    _cretval = secret_collection_for_alias_sync(service ? cast(SecretService*)service._cPtr(No.Dup) : null, _alias_, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.collection.Collection)(cast(SecretCollection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Delete this collection.
      
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
    secret_collection_delete(cast(SecretCollection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete operation to delete this collection.
  
      Params:
        result = asynchronous result passed to the callback
      Returns: whether the collection was successfully deleted or not
      Throws: [ErrorWrap]
  */
  bool deleteFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_collection_delete_finish(cast(SecretCollection*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Delete this collection.
      
      This method may block indefinitely and should not be used in user interface
      threads. The secret service may prompt the user. [secret.service.Service.prompt] will
      be used to handle any prompts that show up.
  
      Params:
        cancellable = optional cancellation object
      Returns: whether the collection was successfully deleted or not
      Throws: [ErrorWrap]
  */
  bool deleteSync(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_collection_delete_sync(cast(SecretCollection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Get the created date and time of the collection.
      
      The return value is the number of seconds since the unix epoch, January 1st
      1970.
      Returns: the created date and time
  */
  ulong getCreated()
  {
    ulong _retval;
    _retval = secret_collection_get_created(cast(SecretCollection*)this._cPtr);
    return _retval;
  }

  alias getFlags = gio.dbus_proxy.DBusProxy.getFlags;

  /**
      Get the flags representing what features of the #SecretCollection proxy
      have been initialized.
      
      Use [secret.collection.Collection.loadItems] to initialize further features and change
      the flags.
      Returns: the flags for features initialized
  */
  secret.types.CollectionFlags getFlags()
  {
    SecretCollectionFlags _cretval;
    _cretval = secret_collection_get_flags(cast(SecretCollection*)this._cPtr);
    secret.types.CollectionFlags _retval = cast(secret.types.CollectionFlags)_cretval;
    return _retval;
  }

  /**
      Get the list of items in this collection.
      Returns: a list of items, when
          done, the list should be freed with [glib.list.List.free], and each item
          should be released with [gobject.object.ObjectWrap.unref]
  */
  secret.item.Item[] getItems()
  {
    GList* _cretval;
    _cretval = secret_collection_get_items(cast(SecretCollection*)this._cPtr);
    auto _retval = gListToD!(secret.item.Item, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get the label of this collection.
      Returns: the label, which should be freed with
          `funcGLib.free`
  */
  string getLabel()
  {
    char* _cretval;
    _cretval = secret_collection_get_label(cast(SecretCollection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get whether the collection is locked or not.
      
      Use [secret.service.Service.lock] or [secret.service.Service.unlock] to lock or unlock the
      collection.
      Returns: whether the collection is locked or not
  */
  bool getLocked()
  {
    bool _retval;
    _retval = cast(bool)secret_collection_get_locked(cast(SecretCollection*)this._cPtr);
    return _retval;
  }

  /**
      Get the modified date and time of the collection.
      
      The return value is the number of seconds since the unix epoch, January 1st
      1970.
      Returns: the modified date and time
  */
  ulong getModified()
  {
    ulong _retval;
    _retval = secret_collection_get_modified(cast(SecretCollection*)this._cPtr);
    return _retval;
  }

  /**
      Get the Secret Service object that this collection was created with.
      Returns: the Secret Service object
  */
  secret.service.Service getService()
  {
    SecretService* _cretval;
    _cretval = secret_collection_get_service(cast(SecretCollection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.service.Service)(cast(SecretService*)_cretval, No.Take);
    return _retval;
  }

  /**
      Ensure that the #SecretCollection proxy has loaded all the items present
      in the Secret Service.
      
      This affects the result of [secret.collection.Collection.getItems].
      
      For collections returned from [secret.service.Service.getCollections] the items will
      have already been loaded.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void loadItems(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_collection_load_items(cast(SecretCollection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an asynchronous operation to ensure that the #SecretCollection proxy
      has loaded all the items present in the Secret Service.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: whether the load was successful or not
      Throws: [ErrorWrap]
  */
  bool loadItemsFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_collection_load_items_finish(cast(SecretCollection*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Ensure that the #SecretCollection proxy has loaded all the items present
      in the Secret Service. This affects the result of
      [secret.collection.Collection.getItems].
      
      For collections returned from [secret.service.Service.getCollections] the items
      will have already been loaded.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        cancellable = optional cancellation object
      Returns: whether the load was successful or not
      Throws: [ErrorWrap]
  */
  bool loadItemsSync(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)secret_collection_load_items_sync(cast(SecretCollection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Refresh the properties on this collection. This fires off a request to
      refresh, and the properties will be updated later.
      
      Calling this method is not normally necessary, as the secret service
      will notify the client when properties change.
  */
  void refresh()
  {
    secret_collection_refresh(cast(SecretCollection*)this._cPtr);
  }

  /**
      Search for items matching the attributes in the collection.
      The attributes should be a table of string keys and string values.
      
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
    secret_collection_search(cast(SecretCollection*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to search for items in a collection.
  
      Params:
        result = asynchronous result passed to callback
      Returns: a list of items that matched the search
      Throws: [ErrorWrap]
  */
  secret.item.Item[] searchFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = secret_collection_search_finish(cast(SecretCollection*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(secret.item.Item, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Search for items matching the attributes in the collection.
      The attributes should be a table of string keys and string values.
      
      If [secret.types.SearchFlags.All] is set in flags, then all the items matching the
      search will be returned. Otherwise only the first item will be returned.
      This is almost always the unlocked item that was most recently stored.
      
      If [secret.types.SearchFlags.Unlock] is set in flags, then items will be unlocked
      if necessary. In either case, locked and unlocked items will match the
      search and be returned. If the unlock fails, the search does not fail.
      
      If [secret.types.SearchFlags.LoadSecrets] is set in flags, then the items will have
      their secret values loaded and available via [secret.item.Item.getSecret].
      
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
    _cretval = secret_collection_search_sync(cast(SecretCollection*)this._cPtr, schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(secret.item.Item, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Set the label of this collection.
      
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
    secret_collection_set_label(cast(SecretCollection*)this._cPtr, _label, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
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
    _retval = cast(bool)secret_collection_set_label_finish(cast(SecretCollection*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Set the label of this collection.
      
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
    _retval = cast(bool)secret_collection_set_label_sync(cast(SecretCollection*)this._cPtr, _label, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
