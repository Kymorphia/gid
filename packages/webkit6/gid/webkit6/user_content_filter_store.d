/// Module for [UserContentFilterStore] class
module gid.webkit6.user_content_filter_store;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.file;
import gid.gio2.types;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;
import gid.webkit6.user_content_filter;

/**
    Handles storage of user content filters on disk.
    
    The WebKitUserContentFilterStore provides the means to import and save
    [JSON rule sets](https://webkit.org/blog/3476/content-blockers-first-look/),
    which can be loaded later in an efficient manner. Once filters are stored,
    the #WebKitUserContentFilter objects which represent them can be added to
    a #WebKitUserContentManager with [gid.webkit6.user_content_manager.UserContentManager.addFilter].
    
    JSON rule sets are imported using [gid.webkit6.user_content_filter_store.UserContentFilterStore.save] and stored
    on disk in an implementation defined format. The contents of a filter store must be
    managed using the #WebKitUserContentFilterStore: a list of all the stored filters
    can be obtained with [gid.webkit6.user_content_filter_store.UserContentFilterStore.fetchIdentifiers],
    [gid.webkit6.user_content_filter_store.UserContentFilterStore.load] can be used to retrieve a previously saved
    filter, and removed from the store with [gid.webkit6.user_content_filter_store.UserContentFilterStore.remove].
*/
class UserContentFilterStore : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_user_content_filter_store_get_type != &gidSymbolNotFound ? webkit_user_content_filter_store_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitUserContentFilterStore";
  }

  /** Returns `this`, for use in `with` statements. */
  override UserContentFilterStore self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.user_content_filter_store.UserContentFilterStore]
      Returns: New builder object
  */
  static UserContentFilterStoreGidBuilder builder() nothrow
  {
    return new UserContentFilterStoreGidBuilder;
  }

  /**
      Get `path` property.
      Returns: The directory used for filter storage. This path is used as the base
        directory where user content filters are stored on disk.
  */
  @property string path() nothrow
  {
    return getPath();
  }

  /**
      Create a new #WebKitUserContentFilterStore to manipulate filters stored at storage_path.
      
      The path must point to a local filesystem, and will be created if needed.
  
      Params:
        storagePath = path where data for filters will be stored on disk
      Returns: a newly created #WebKitUserContentFilterStore
  */
  this(string storagePath) nothrow
  {
    WebKitUserContentFilterStore* _cretval;
    const(char)* _storagePath = storagePath.toCString!(No.Malloc, No.Nullable);
    _cretval = webkit_user_content_filter_store_new(_storagePath);
    this(_cretval, Yes.Take);
  }

  /**
      Asynchronously retrieve a list of the identifiers for all the stored filters.
      
      When the operation is finished, callback will be invoked, which then can use
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.fetchIdentifiersFinish] to obtain the list of
      filter identifiers.
  
      Params:
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the removal is completed
  */
  void fetchIdentifiers(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    webkit_user_content_filter_store_fetch_identifiers(cast(WebKitUserContentFilterStore*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous fetch of the list of stored filters.
      
      Finishes an asynchronous fetch of the list of identifiers for the stored filters previously
      started with [gid.webkit6.user_content_filter_store.UserContentFilterStore.fetchIdentifiers].
  
      Params:
        result = a #GAsyncResult
      Returns: a null-terminated list of filter identifiers.
  */
  string[] fetchIdentifiersFinish(gid.gio2.async_result.AsyncResult result) nothrow
  {
    char** _cretval;
    _cretval = webkit_user_content_filter_store_fetch_identifiers_finish(cast(WebKitUserContentFilterStore*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the storage path for user content filters.
      Returns: path, as a string.
  */
  string getPath() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_user_content_filter_store_get_path(cast(WebKitUserContentFilterStore*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Asynchronously load a content filter given its identifier.
      
      The filter must have been
      previously stored using [gid.webkit6.user_content_filter_store.UserContentFilterStore.save].
      
      When the operation is finished, callback will be invoked, which then can use
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.loadFinish] to obtain the resulting filter.
  
      Params:
        identifier = a filter identifier
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the load is completed
  */
  void load(string identifier, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_user_content_filter_store_load(cast(WebKitUserContentFilterStore*)this._cPtr, _identifier, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous filter load previously started with
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.load].
  
      Params:
        result = a #GAsyncResult
      Returns: a #WebKitUserContentFilter, or null if the load failed
      Throws: [ErrorWrap]
  */
  gid.webkit6.user_content_filter.UserContentFilter loadFinish(gid.gio2.async_result.AsyncResult result)
  {
    WebKitUserContentFilter* _cretval;
    GError *_err;
    _cretval = webkit_user_content_filter_store_load_finish(cast(WebKitUserContentFilterStore*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.webkit6.user_content_filter.UserContentFilter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asynchronously remove a content filter given its identifier.
      
      When the operation is finished, callback will be invoked, which then can use
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.removeFinish] to check whether the removal was
      successful.
  
      Params:
        identifier = a filter identifier
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the removal is completed
  */
  void remove(string identifier, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_user_content_filter_store_remove(cast(WebKitUserContentFilterStore*)this._cPtr, _identifier, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous filter removal previously started with
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.remove].
  
      Params:
        result = a #GAsyncResult
      Returns: whether the removal was successful
      Throws: [ErrorWrap]
  */
  bool removeFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_user_content_filter_store_remove_finish(cast(WebKitUserContentFilterStore*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously save a content filter from a set source rule.
      
      Asynchronously save a content filter from a source rule set in the
      [WebKit content extesions JSON format](https://webkit.org/blog/3476/content-blockers-first-look/).
      
      The identifier can be used afterwards to refer to the filter when using
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.remove] and [gid.webkit6.user_content_filter_store.UserContentFilterStore.load].
      When the identifier has been used in the past, the new filter source will replace
      the one saved beforehand for the same identifier.
      
      When the operation is finished, callback will be invoked, which then can use
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.saveFinish] to obtain the resulting filter.
  
      Params:
        identifier = a string used to identify the saved filter
        source = #GBytes containing the rule set in JSON format
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when saving is completed
  */
  void save(string identifier, gid.glib2.bytes.Bytes source, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_user_content_filter_store_save(cast(WebKitUserContentFilterStore*)this._cPtr, _identifier, source ? cast(GBytes*)source._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous filter save previously started with
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.save].
  
      Params:
        result = a #GAsyncResult
      Returns: a #WebKitUserContentFilter, or null if saving failed
      Throws: [ErrorWrap]
  */
  gid.webkit6.user_content_filter.UserContentFilter saveFinish(gid.gio2.async_result.AsyncResult result)
  {
    WebKitUserContentFilter* _cretval;
    GError *_err;
    _cretval = webkit_user_content_filter_store_save_finish(cast(WebKitUserContentFilterStore*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.webkit6.user_content_filter.UserContentFilter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asynchronously save a content filter from the contents of a file.
      
      Asynchronously save a content filter from the contents of a file, which must be
      native to the platform, as checked by [gid.gio2.file.File.isNative]. See
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.save] for more details.
      
      When the operation is finished, callback will be invoked, which then can use
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.saveFinish] to obtain the resulting filter.
  
      Params:
        identifier = a string used to identify the saved filter
        file = a #GFile containing the rule set in JSON format
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when saving is completed
  */
  void saveFromFile(string identifier, gid.gio2.file.File file, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    const(char)* _identifier = identifier.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_user_content_filter_store_save_from_file(cast(WebKitUserContentFilterStore*)this._cPtr, _identifier, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes and asynchronous filter save previously started with
      [gid.webkit6.user_content_filter_store.UserContentFilterStore.saveFromFile].
  
      Params:
        result = a #GAsyncResult
      Returns: a #WebKitUserContentFilter, or null if saving failed.
      Throws: [ErrorWrap]
  */
  gid.webkit6.user_content_filter.UserContentFilter saveFromFileFinish(gid.gio2.async_result.AsyncResult result)
  {
    WebKitUserContentFilter* _cretval;
    GError *_err;
    _cretval = webkit_user_content_filter_store_save_from_file_finish(cast(WebKitUserContentFilterStore*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.webkit6.user_content_filter.UserContentFilter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.webkit6.user_content_filter_store.UserContentFilterStore]
class UserContentFilterStoreGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `path` property.
      Params:
        propval = The directory used for filter storage. This path is used as the base
          directory where user content filters are stored on disk.
      Returns: Builder instance for fluent chaining
  */
  T path(string propval) nothrow
  {
    return setProperty("path", propval);
  }
}

/// Fluent builder for [gid.webkit6.user_content_filter_store.UserContentFilterStore]
final class UserContentFilterStoreGidBuilder : UserContentFilterStoreGidBuilderImpl!UserContentFilterStoreGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UserContentFilterStore build() nothrow
  {
    return new UserContentFilterStore(cast(void*)createGObject(UserContentFilterStore._getGType), Yes.Take);
  }
}
