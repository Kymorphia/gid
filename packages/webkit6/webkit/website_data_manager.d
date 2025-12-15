/// Module for [WebsiteDataManager] class
module webkit.website_data_manager;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import glib.types;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.favicon_database;
import webkit.itpthird_party;
import webkit.types;
import webkit.website_data;

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
class WebsiteDataManager : gobject.object.ObjectWrap
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
    return cast(void function())webkit_website_data_manager_get_type != &gidSymbolNotFound ? webkit_website_data_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsiteDataManager self()
  {
    return this;
  }

  /**
      Asynchronously clear the website data of the given types modified in the past timespan.
      
      If timespan is 0, all website data will be removed.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.website_data_manager.WebsiteDataManager.clearFinish] to get the result of the operation.
      
      Due to implementation limitations, this function does not currently delete
      any stored cookies if timespan is nonzero. This behavior may change in the
      future.
  
      Params:
        types = #WebKitWebsiteDataTypes
        timespan = a #GTimeSpan
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void clear(webkit.types.WebsiteDataTypes types, glib.types.TimeSpan timespan, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_website_data_manager_clear(cast(WebKitWebsiteDataManager*)this._cPtr, types, timespan, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.website_data_manager.WebsiteDataManager.clear]
  
      Params:
        result = a #GAsyncResult
      Returns: true if website data was successfully cleared, or false otherwise.
      Throws: [ErrorWrap]
  */
  bool clearFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_website_data_manager_clear_finish(cast(WebKitWebsiteDataManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously get the list of #WebKitWebsiteData for the given types.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.website_data_manager.WebsiteDataManager.fetchFinish] to get the result of the operation.
  
      Params:
        types = #WebKitWebsiteDataTypes
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void fetch(webkit.types.WebsiteDataTypes types, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_website_data_manager_fetch(cast(WebKitWebsiteDataManager*)this._cPtr, types, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.website_data_manager.WebsiteDataManager.fetch].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GList of #WebKitWebsiteData. You must free the #GList with
           [glib.list.List.free] and unref the #WebKitWebsiteData<!-- -->s with [webkit.website_data.WebsiteData.unref] when you're done with them.
      Throws: [ErrorWrap]
  */
  webkit.website_data.WebsiteData[] fetchFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = webkit_website_data_manager_fetch_finish(cast(WebKitWebsiteDataManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(webkit.website_data.WebsiteData, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get the #WebKitWebsiteDataManager:base-cache-directory property.
      Returns: the base directory for caches, or null if
           #WebKitWebsiteDataManager:base-cache-directory was not provided or manager is ephemeral.
  */
  string getBaseCacheDirectory()
  {
    const(char)* _cretval;
    _cretval = webkit_website_data_manager_get_base_cache_directory(cast(WebKitWebsiteDataManager*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitWebsiteDataManager:base-data-directory property.
      Returns: the base directory for website data, or null if
           #WebKitWebsiteDataManager:base-data-directory was not provided or manager is ephemeral.
  */
  string getBaseDataDirectory()
  {
    const(char)* _cretval;
    _cretval = webkit_website_data_manager_get_base_data_directory(cast(WebKitWebsiteDataManager*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitFaviconDatabase of manager.
      Returns: a #WebKitFaviconDatabase, or null if website icons are disabled
  */
  webkit.favicon_database.FaviconDatabase getFaviconDatabase()
  {
    WebKitFaviconDatabase* _cretval;
    _cretval = webkit_website_data_manager_get_favicon_database(cast(WebKitWebsiteDataManager*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.favicon_database.FaviconDatabase)(cast(WebKitFaviconDatabase*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get whether website icons are enabled.
      Returns: true if website icons are enabled, or false otherwise.
  */
  bool getFaviconsEnabled()
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
      [webkit.website_data_manager.WebsiteDataManager.getItpSummaryFinish] to get the result of the operation.
  
      Params:
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void getItpSummary(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_website_data_manager_get_itp_summary(cast(WebKitWebsiteDataManager*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.website_data_manager.WebsiteDataManager.getItpSummary].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GList of #WebKitITPThirdParty.
           You must free the #GList with [glib.list.List.free] and unref the #WebKitITPThirdParty<!-- -->s with
           [webkit.itpthird_party.ITPThirdParty.unref] when you're done with them.
      Throws: [ErrorWrap]
  */
  webkit.itpthird_party.ITPThirdParty[] getItpSummaryFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = webkit_website_data_manager_get_itp_summary_finish(cast(WebKitWebsiteDataManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(webkit.itpthird_party.ITPThirdParty, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get whether a #WebKitWebsiteDataManager is ephemeral.
      
      See #WebKitWebsiteDataManager:is-ephemeral for more details.
      Returns: true if manager is ephemeral or false otherwise.
  */
  bool isEphemeral()
  {
    bool _retval;
    _retval = cast(bool)webkit_website_data_manager_is_ephemeral(cast(WebKitWebsiteDataManager*)this._cPtr);
    return _retval;
  }

  /**
      Asynchronously removes the website data in the given website_data list.
      
      Asynchronously removes the website data of the given types for websites in the given website_data list.
      Use [webkit.website_data_manager.WebsiteDataManager.clear] if you want to remove the website data for all sites.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.website_data_manager.WebsiteDataManager.removeFinish] to get the result of the operation.
  
      Params:
        types = #WebKitWebsiteDataTypes
        websiteData = a #GList of #WebKitWebsiteData
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void remove(webkit.types.WebsiteDataTypes types, webkit.website_data.WebsiteData[] websiteData, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _websiteData = gListFromD!(webkit.website_data.WebsiteData)(websiteData);
    scope(exit) containerFree!(GList*, webkit.website_data.WebsiteData, GidOwnership.None)(_websiteData);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_website_data_manager_remove(cast(WebKitWebsiteDataManager*)this._cPtr, types, _websiteData, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.website_data_manager.WebsiteDataManager.remove].
  
      Params:
        result = a #GAsyncResult
      Returns: true if website data resources were successfully removed, or false otherwise.
      Throws: [ErrorWrap]
  */
  bool removeFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_website_data_manager_remove_finish(cast(WebKitWebsiteDataManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Set whether website icons are enabled. Website icons are disabled by default.
      When website icons are disabled, the #WebKitFaviconDatabase of manager is closed and
      its reference removed, so [webkit.website_data_manager.WebsiteDataManager.getFaviconDatabase] will
      return null. If website icons are enabled again, a new #WebKitFaviconDatabase will
      be created.
  
      Params:
        enabled = value to set
  */
  void setFaviconsEnabled(bool enabled)
  {
    webkit_website_data_manager_set_favicons_enabled(cast(WebKitWebsiteDataManager*)this._cPtr, enabled);
  }
}
