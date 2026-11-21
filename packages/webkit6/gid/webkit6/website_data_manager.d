/// Module for [WebsiteDataManager] class
module gid.webkit6.website_data_manager;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.favicon_database;
import gid.webkit6.itpthird_party;
import gid.webkit6.types;
import gid.webkit6.website_data;

/**
    Manages data stored locally by web sites.
    
    You can use WebKitWebsiteDataManager to configure the local directories
    where website data will be stored. Use #WebKitWebsiteDataManager:base-data-directory
    and #WebKitWebsiteDataManager:base-cache-directory set a common base directory for all
    website data and caches.
    
    A WebKitWebsiteDataManager can be ephemeral, in which case all the directory configuration
    is not needed because website data will never persist. You can create an ephemeral WebKitWebsiteDataManager
    with webkit_website_data_manager_new_ephemeral().
    
    WebKitWebsiteDataManager can also be used to fetch website data, remove data
    stored by particular websites, or clear data for all websites modified since a given
    period of time.
*/
class WebsiteDataManager : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_website_data_manager_get_type != &gidSymbolNotFound ? webkit_website_data_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitWebsiteDataManager";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsiteDataManager self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.website_data_manager.WebsiteDataManager]
      Returns: New builder object
  */
  static WebsiteDataManagerGidBuilder builder() nothrow
  {
    return new WebsiteDataManagerGidBuilder;
  }

  /**
      Get `baseCacheDirectory` property.
      Returns: The base directory for caches. If null, a default location will be used.
  */
  @property string baseCacheDirectory() nothrow
  {
    return getBaseCacheDirectory();
  }

  /**
      Get `baseDataDirectory` property.
      Returns: The base directory for website data. If null, a default location will be used.
  */
  @property string baseDataDirectory() nothrow
  {
    return getBaseDataDirectory();
  }

  /**
      Asynchronously clear the website data of the given types modified in the past timespan.
      
      If timespan is 0, all website data will be removed.
      
      When the operation is finished, callback will be called. You can then call
      [gid.webkit6.website_data_manager.WebsiteDataManager.clearFinish] to get the result of the operation.
      
      Due to implementation limitations, this function does not currently delete
      any stored cookies if timespan is nonzero. This behavior may change in the
      future.
  
      Params:
        types = #WebKitWebsiteDataTypes
        timespan = a #GTimeSpan
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void clear(gid.webkit6.types.WebsiteDataTypes types, gid.glib2.types.TimeSpan timespan, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    webkit_website_data_manager_clear(cast(WebKitWebsiteDataManager*)this._cPtr, types, timespan, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [gid.webkit6.website_data_manager.WebsiteDataManager.clear]
  
      Params:
        result = a #GAsyncResult
      Returns: true if website data was successfully cleared, or false otherwise.
      Throws: [ErrorWrap]
  */
  bool clearFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_website_data_manager_clear_finish(cast(WebKitWebsiteDataManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously get the list of #WebKitWebsiteData for the given types.
      
      When the operation is finished, callback will be called. You can then call
      [gid.webkit6.website_data_manager.WebsiteDataManager.fetchFinish] to get the result of the operation.
  
      Params:
        types = #WebKitWebsiteDataTypes
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void fetch(gid.webkit6.types.WebsiteDataTypes types, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    webkit_website_data_manager_fetch(cast(WebKitWebsiteDataManager*)this._cPtr, types, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [gid.webkit6.website_data_manager.WebsiteDataManager.fetch].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GList of #WebKitWebsiteData. You must free the #GList with
           [gid.glib2.list.List.free] and unref the #WebKitWebsiteData<!-- -->s with [gid.webkit6.website_data.WebsiteData.unref] when you're done with them.
      Throws: [ErrorWrap]
  */
  gid.webkit6.website_data.WebsiteData[] fetchFinish(gid.gio2.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = webkit_website_data_manager_fetch_finish(cast(WebKitWebsiteDataManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.webkit6.website_data.WebsiteData, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get the #WebKitWebsiteDataManager:base-cache-directory property.
      Returns: the base directory for caches, or null if
           #WebKitWebsiteDataManager:base-cache-directory was not provided or manager is ephemeral.
  */
  string getBaseCacheDirectory() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_website_data_manager_get_base_cache_directory(cast(WebKitWebsiteDataManager*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitWebsiteDataManager:base-data-directory property.
      Returns: the base directory for website data, or null if
           #WebKitWebsiteDataManager:base-data-directory was not provided or manager is ephemeral.
  */
  string getBaseDataDirectory() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_website_data_manager_get_base_data_directory(cast(WebKitWebsiteDataManager*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitFaviconDatabase of manager.
      Returns: a #WebKitFaviconDatabase, or null if website icons are disabled
  */
  gid.webkit6.favicon_database.FaviconDatabase getFaviconDatabase() nothrow
  {
    WebKitFaviconDatabase* _cretval;
    _cretval = webkit_website_data_manager_get_favicon_database(cast(WebKitWebsiteDataManager*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.favicon_database.FaviconDatabase)(cast(WebKitFaviconDatabase*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get whether website icons are enabled.
      Returns: true if website icons are enabled, or false otherwise.
  */
  bool getFaviconsEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_website_data_manager_get_favicons_enabled(cast(WebKitWebsiteDataManager*)this._cPtr);
    return _retval;
  }

  /**
      Asynchronously get the list of #WebKitITPThirdParty seen for manager.
      
      Every #WebKitITPThirdParty
      contains the list of #WebKitITPFirstParty under which it has been seen.
      
      When the operation is finished, callback will be called. You can then call
      [gid.webkit6.website_data_manager.WebsiteDataManager.getItpSummaryFinish] to get the result of the operation.
  
      Params:
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void getItpSummary(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    webkit_website_data_manager_get_itp_summary(cast(WebKitWebsiteDataManager*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [gid.webkit6.website_data_manager.WebsiteDataManager.getItpSummary].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GList of #WebKitITPThirdParty.
           You must free the #GList with [gid.glib2.list.List.free] and unref the #WebKitITPThirdParty<!-- -->s with
           [gid.webkit6.itpthird_party.ITPThirdParty.unref] when you're done with them.
      Throws: [ErrorWrap]
  */
  gid.webkit6.itpthird_party.ITPThirdParty[] getItpSummaryFinish(gid.gio2.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = webkit_website_data_manager_get_itp_summary_finish(cast(WebKitWebsiteDataManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.webkit6.itpthird_party.ITPThirdParty, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get whether a #WebKitWebsiteDataManager is ephemeral.
      
      See #WebKitWebsiteDataManager:is-ephemeral for more details.
      Returns: true if manager is ephemeral or false otherwise.
  */
  bool isEphemeral() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_website_data_manager_is_ephemeral(cast(WebKitWebsiteDataManager*)this._cPtr);
    return _retval;
  }

  /**
      Asynchronously removes the website data in the given website_data list.
      
      Asynchronously removes the website data of the given types for websites in the given website_data list.
      Use [gid.webkit6.website_data_manager.WebsiteDataManager.clear] if you want to remove the website data for all sites.
      
      When the operation is finished, callback will be called. You can then call
      [gid.webkit6.website_data_manager.WebsiteDataManager.removeFinish] to get the result of the operation.
  
      Params:
        types = #WebKitWebsiteDataTypes
        websiteData = a #GList of #WebKitWebsiteData
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void remove(gid.webkit6.types.WebsiteDataTypes types, gid.webkit6.website_data.WebsiteData[] websiteData, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    auto _websiteData = gListFromD!(gid.webkit6.website_data.WebsiteData)(websiteData);
    scope(exit) containerFree!(GList*, gid.webkit6.website_data.WebsiteData, GidOwnership.None)(_websiteData);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_website_data_manager_remove(cast(WebKitWebsiteDataManager*)this._cPtr, types, _websiteData, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [gid.webkit6.website_data_manager.WebsiteDataManager.remove].
  
      Params:
        result = a #GAsyncResult
      Returns: true if website data resources were successfully removed, or false otherwise.
      Throws: [ErrorWrap]
  */
  bool removeFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_website_data_manager_remove_finish(cast(WebKitWebsiteDataManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Set whether website icons are enabled. Website icons are disabled by default.
      When website icons are disabled, the #WebKitFaviconDatabase of manager is closed and
      its reference removed, so [gid.webkit6.website_data_manager.WebsiteDataManager.getFaviconDatabase] will
      return null. If website icons are enabled again, a new #WebKitFaviconDatabase will
      be created.
  
      Params:
        enabled = value to set
  */
  void setFaviconsEnabled(bool enabled) nothrow
  {
    webkit_website_data_manager_set_favicons_enabled(cast(WebKitWebsiteDataManager*)this._cPtr, enabled);
  }
}

/// Fluent builder implementation template for [gid.webkit6.website_data_manager.WebsiteDataManager]
class WebsiteDataManagerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `baseCacheDirectory` property.
      Params:
        propval = The base directory for caches. If null, a default location will be used.
      Returns: Builder instance for fluent chaining
  */
  T baseCacheDirectory(string propval) nothrow
  {
    return setProperty("base-cache-directory", propval);
  }

  /**
      Set `baseDataDirectory` property.
      Params:
        propval = The base directory for website data. If null, a default location will be used.
      Returns: Builder instance for fluent chaining
  */
  T baseDataDirectory(string propval) nothrow
  {
    return setProperty("base-data-directory", propval);
  }

  /**
      Set `originStorageRatio` property.
      Params:
        propval = The percentage of volume space that can be used for data storage for every domain.
          If the maximum storage is reached the storage request will fail with a QuotaExceededError exception.
          A value of 0.0 means that data storage is not allowed. A value of -1.0, which is the default,
          means WebKit will use the default quota (1 GiB).
      Returns: Builder instance for fluent chaining
  */
  T originStorageRatio(double propval) nothrow
  {
    return setProperty("origin-storage-ratio", propval);
  }

  /**
      Set `totalStorageRatio` property.
      Params:
        propval = The percentage of volume space that can be used for data storage for all domains.
          If the maximum storage is reached the eviction will happen.
          A value of 0.0 means that data storage is not allowed. A value of -1.0, which is the default,
          means there's no limit for the total storage.
      Returns: Builder instance for fluent chaining
  */
  T totalStorageRatio(double propval) nothrow
  {
    return setProperty("total-storage-ratio", propval);
  }
}

/// Fluent builder for [gid.webkit6.website_data_manager.WebsiteDataManager]
final class WebsiteDataManagerGidBuilder : WebsiteDataManagerGidBuilderImpl!WebsiteDataManagerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebsiteDataManager build() nothrow
  {
    return new WebsiteDataManager(cast(void*)createGObject(WebsiteDataManager._getGType), Yes.Take);
  }
}
