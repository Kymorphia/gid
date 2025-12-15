/// Module for [UserContentFilterStore] class
module webkit.user_content_filter_store;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.file;
import gio.types;
import glib.bytes;
import glib.error;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;
import webkit.user_content_filter;

/**
    Handles storage of user content filters on disk.
    
    The WebKitUserContentFilterStore provides the means to import and save
    [JSON rule sets](https://webkit.org/blog/3476/content-blockers-first-look/),
    which can be loaded later in an efficient manner. Once filters are stored,
    the #WebKitUserContentFilter objects which represent them can be added to
    a #WebKitUserContentManager with [webkit.user_content_manager.UserContentManager.addFilter].
    
    JSON rule sets are imported using [webkit.user_content_filter_store.UserContentFilterStore.save] and stored
    on disk in an implementation defined format. The contents of a filter store must be
    managed using the #WebKitUserContentFilterStore: a list of all the stored filters
    can be obtained with [webkit.user_content_filter_store.UserContentFilterStore.fetchIdentifiers],
    [webkit.user_content_filter_store.UserContentFilterStore.load] can be used to retrieve a previously saved
    filter, and removed from the store with [webkit.user_content_filter_store.UserContentFilterStore.remove].
*/
class UserContentFilterStore : gobject.object.ObjectWrap
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
    return cast(void function())webkit_user_content_filter_store_get_type != &gidSymbolNotFound ? webkit_user_content_filter_store_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UserContentFilterStore self()
  {
    return this;
  }

  /**
      Create a new #WebKitUserContentFilterStore to manipulate filters stored at storage_path.
      
      The path must point to a local filesystem, and will be created if needed.
  
      Params:
        storagePath = path where data for filters will be stored on disk
      Returns: a newly created #WebKitUserContentFilterStore
  */
  this(string storagePath)
  {
    WebKitUserContentFilterStore* _cretval;
    const(char)* _storagePath = storagePath.toCString(No.Alloc);
    _cretval = webkit_user_content_filter_store_new(_storagePath);
    this(_cretval, Yes.Take);
  }

  /**
      Asynchronously retrieve a list of the identifiers for all the stored filters.
      
      When the operation is finished, callback will be invoked, which then can use
      [webkit.user_content_filter_store.UserContentFilterStore.fetchIdentifiersFinish] to obtain the list of
      filter identifiers.
  
      Params:
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the removal is completed
  */
  void fetchIdentifiers(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_user_content_filter_store_fetch_identifiers(cast(WebKitUserContentFilterStore*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous fetch of the list of stored filters.
      
      Finishes an asynchronous fetch of the list of identifiers for the stored filters previously
      started with [webkit.user_content_filter_store.UserContentFilterStore.fetchIdentifiers].
  
      Params:
        result = a #GAsyncResult
      Returns: a null-terminated list of filter identifiers.
  */
  string[] fetchIdentifiersFinish(gio.async_result.AsyncResult result)
  {
    char** _cretval;
    _cretval = webkit_user_content_filter_store_fetch_identifiers_finish(cast(WebKitUserContentFilterStore*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null);
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
      Gets the storage path for user content filters.
      Returns: path, as a string.
  */
  string getPath()
  {
    const(char)* _cretval;
    _cretval = webkit_user_content_filter_store_get_path(cast(WebKitUserContentFilterStore*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Asynchronously load a content filter given its identifier.
      
      The filter must have been
      previously stored using [webkit.user_content_filter_store.UserContentFilterStore.save].
      
      When the operation is finished, callback will be invoked, which then can use
      [webkit.user_content_filter_store.UserContentFilterStore.loadFinish] to obtain the resulting filter.
  
      Params:
        identifier = a filter identifier
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the load is completed
  */
  void load(string identifier, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _identifier = identifier.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_user_content_filter_store_load(cast(WebKitUserContentFilterStore*)this._cPtr, _identifier, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous filter load previously started with
      [webkit.user_content_filter_store.UserContentFilterStore.load].
  
      Params:
        result = a #GAsyncResult
      Returns: a #WebKitUserContentFilter, or null if the load failed
      Throws: [ErrorWrap]
  */
  webkit.user_content_filter.UserContentFilter loadFinish(gio.async_result.AsyncResult result)
  {
    WebKitUserContentFilter* _cretval;
    GError *_err;
    _cretval = webkit_user_content_filter_store_load_finish(cast(WebKitUserContentFilterStore*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new webkit.user_content_filter.UserContentFilter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asynchronously remove a content filter given its identifier.
      
      When the operation is finished, callback will be invoked, which then can use
      [webkit.user_content_filter_store.UserContentFilterStore.removeFinish] to check whether the removal was
      successful.
  
      Params:
        identifier = a filter identifier
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the removal is completed
  */
  void remove(string identifier, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _identifier = identifier.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_user_content_filter_store_remove(cast(WebKitUserContentFilterStore*)this._cPtr, _identifier, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous filter removal previously started with
      [webkit.user_content_filter_store.UserContentFilterStore.remove].
  
      Params:
        result = a #GAsyncResult
      Returns: whether the removal was successful
      Throws: [ErrorWrap]
  */
  bool removeFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_user_content_filter_store_remove_finish(cast(WebKitUserContentFilterStore*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously save a content filter from a set source rule.
      
      Asynchronously save a content filter from a source rule set in the
      [WebKit content extesions JSON format](https://webkit.org/blog/3476/content-blockers-first-look/).
      
      The identifier can be used afterwards to refer to the filter when using
      [webkit.user_content_filter_store.UserContentFilterStore.remove] and [webkit.user_content_filter_store.UserContentFilterStore.load].
      When the identifier has been used in the past, the new filter source will replace
      the one saved beforehand for the same identifier.
      
      When the operation is finished, callback will be invoked, which then can use
      [webkit.user_content_filter_store.UserContentFilterStore.saveFinish] to obtain the resulting filter.
  
      Params:
        identifier = a string used to identify the saved filter
        source = #GBytes containing the rule set in JSON format
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when saving is completed
  */
  void save(string identifier, glib.bytes.Bytes source, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _identifier = identifier.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_user_content_filter_store_save(cast(WebKitUserContentFilterStore*)this._cPtr, _identifier, source ? cast(GBytes*)source._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous filter save previously started with
      [webkit.user_content_filter_store.UserContentFilterStore.save].
  
      Params:
        result = a #GAsyncResult
      Returns: a #WebKitUserContentFilter, or null if saving failed
      Throws: [ErrorWrap]
  */
  webkit.user_content_filter.UserContentFilter saveFinish(gio.async_result.AsyncResult result)
  {
    WebKitUserContentFilter* _cretval;
    GError *_err;
    _cretval = webkit_user_content_filter_store_save_finish(cast(WebKitUserContentFilterStore*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new webkit.user_content_filter.UserContentFilter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asynchronously save a content filter from the contents of a file.
      
      Asynchronously save a content filter from the contents of a file, which must be
      native to the platform, as checked by [gio.file.File.isNative]. See
      [webkit.user_content_filter_store.UserContentFilterStore.save] for more details.
      
      When the operation is finished, callback will be invoked, which then can use
      [webkit.user_content_filter_store.UserContentFilterStore.saveFinish] to obtain the resulting filter.
  
      Params:
        identifier = a string used to identify the saved filter
        file = a #GFile containing the rule set in JSON format
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when saving is completed
  */
  void saveFromFile(string identifier, gio.file.File file, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _identifier = identifier.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_user_content_filter_store_save_from_file(cast(WebKitUserContentFilterStore*)this._cPtr, _identifier, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes and asynchronous filter save previously started with
      [webkit.user_content_filter_store.UserContentFilterStore.saveFromFile].
  
      Params:
        result = a #GAsyncResult
      Returns: a #WebKitUserContentFilter, or null if saving failed.
      Throws: [ErrorWrap]
  */
  webkit.user_content_filter.UserContentFilter saveFromFileFinish(gio.async_result.AsyncResult result)
  {
    WebKitUserContentFilter* _cretval;
    GError *_err;
    _cretval = webkit_user_content_filter_store_save_from_file_finish(cast(WebKitUserContentFilterStore*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new webkit.user_content_filter.UserContentFilter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
