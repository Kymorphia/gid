/// Module for [CookieManager] class
module webkit.cookie_manager;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;
import soup.cookie;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Defines how to handle cookies in a #WebKitWebContext.
    
    The WebKitCookieManager defines how to set up and handle cookies.
    You can get it from a #WebKitWebsiteDataManager with
    webkit_website_data_manager_get_cookie_manager(), and use it to set where to
    store cookies with [webkit.cookie_manager.CookieManager.setPersistentStorage],
    or to set the acceptance policy, with [webkit.cookie_manager.CookieManager.getAcceptPolicy].
*/
class CookieManager : gobject.object.ObjectWrap
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
    return cast(void function())webkit_cookie_manager_get_type != &gidSymbolNotFound ? webkit_cookie_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CookieManager self()
  {
    return this;
  }

  /**
      Asynchronously add a #SoupCookie to the underlying storage.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.cookie_manager.CookieManager.addCookieFinish] to get the result of the operation.
  
      Params:
        cookie = the #SoupCookie to be added
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void addCookie(soup.cookie.Cookie cookie, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_cookie_manager_add_cookie(cast(WebKitCookieManager*)this._cPtr, cookie ? cast(SoupCookie*)cookie._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.cookie_manager.CookieManager.addCookie].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the cookie was added or false in case of error.
      Throws: [ErrorWrap]
  */
  bool addCookieFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_cookie_manager_add_cookie_finish(cast(WebKitCookieManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously delete a #SoupCookie from the current session.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.cookie_manager.CookieManager.deleteCookieFinish] to get the result of the operation.
  
      Params:
        cookie = the #SoupCookie to be deleted
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void deleteCookie(soup.cookie.Cookie cookie, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_cookie_manager_delete_cookie(cast(WebKitCookieManager*)this._cPtr, cookie ? cast(SoupCookie*)cookie._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.cookie_manager.CookieManager.deleteCookie].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the cookie was deleted or false in case of error.
      Throws: [ErrorWrap]
  */
  bool deleteCookieFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_cookie_manager_delete_cookie_finish(cast(WebKitCookieManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously get the cookie acceptance policy of cookie_manager.
      
      Note that when policy was set to [webkit.types.CookieAcceptPolicy.NoThirdParty] and
      ITP is enabled, this will return [webkit.types.CookieAcceptPolicy.Always].
      See also webkit_website_data_manager_set_itp_enabled().
      
      When the operation is finished, callback will be called. You can then call
      [webkit.cookie_manager.CookieManager.getAcceptPolicyFinish] to get the result of the operation.
  
      Params:
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void getAcceptPolicy(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_cookie_manager_get_accept_policy(cast(WebKitCookieManager*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.cookie_manager.CookieManager.getAcceptPolicy].
  
      Params:
        result = a #GAsyncResult
      Returns: the cookie acceptance policy of cookie_manager as a #WebKitCookieAcceptPolicy.
      Throws: [ErrorWrap]
  */
  webkit.types.CookieAcceptPolicy getAcceptPolicyFinish(gio.async_result.AsyncResult result)
  {
    WebKitCookieAcceptPolicy _cretval;
    GError *_err;
    _cretval = webkit_cookie_manager_get_accept_policy_finish(cast(WebKitCookieManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    webkit.types.CookieAcceptPolicy _retval = cast(webkit.types.CookieAcceptPolicy)_cretval;
    return _retval;
  }

  /**
      Asynchronously get a list of #SoupCookie from cookie_manager.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.cookie_manager.CookieManager.getAllCookiesFinish] to get the result of the operation.
  
      Params:
        cancellable = a #GCancellable or null to ignore
        callback = (closure user_data): a #GAsyncReadyCallback to call when the request is satisfied
  */
  void getAllCookies(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_cookie_manager_get_all_cookies(cast(WebKitCookieManager*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.cookie_manager.CookieManager.getAllCookies].
      
      The return value is a #GList of #SoupCookie instances which should be released
      with [glib.list.List.freeFull] and [soup.cookie.Cookie.free].
  
      Params:
        result = a #GAsyncResult
      Returns: A #GList of #SoupCookie instances.
      Throws: [ErrorWrap]
  */
  soup.cookie.Cookie[] getAllCookiesFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = webkit_cookie_manager_get_all_cookies_finish(cast(WebKitCookieManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(soup.cookie.Cookie, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Asynchronously get a list of #SoupCookie from cookie_manager.
      
      Asynchronously get a list of #SoupCookie from cookie_manager associated with uri, which
      must be either an HTTP or an HTTPS URL.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.cookie_manager.CookieManager.getCookiesFinish] to get the result of the operation.
  
      Params:
        uri = the URI associated to the cookies to be retrieved
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void getCookies(string uri, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _uri = uri.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_cookie_manager_get_cookies(cast(WebKitCookieManager*)this._cPtr, _uri, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.cookie_manager.CookieManager.getCookies].
      
      The return value is a #GList of #SoupCookie instances which should be released
      with [glib.list.List.freeFull] and [soup.cookie.Cookie.free].
  
      Params:
        result = a #GAsyncResult
      Returns: A #GList of #SoupCookie instances.
      Throws: [ErrorWrap]
  */
  soup.cookie.Cookie[] getCookiesFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = webkit_cookie_manager_get_cookies_finish(cast(WebKitCookieManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(soup.cookie.Cookie, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Asynchronously replace all cookies in cookie_manager with the given list of cookies.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.cookie_manager.CookieManager.replaceCookiesFinish] to get the result of the operation.
  
      Params:
        cookies = a #GList of #SoupCookie to be added
        cancellable = a #GCancellable or null to ignore
        callback = (closure user_data): a #GAsyncReadyCallback to call when the request is satisfied
  */
  void replaceCookies(soup.cookie.Cookie[] cookies, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _cookies = gListFromD!(soup.cookie.Cookie)(cookies);
    scope(exit) containerFree!(GList*, soup.cookie.Cookie, GidOwnership.None)(_cookies);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_cookie_manager_replace_cookies(cast(WebKitCookieManager*)this._cPtr, _cookies, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.cookie_manager.CookieManager.replaceCookies].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the cookies were added or false in case of error.
      Throws: [ErrorWrap]
  */
  bool replaceCookiesFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_cookie_manager_replace_cookies_finish(cast(WebKitCookieManager*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Set the cookie acceptance policy of cookie_manager as policy.
      
      Note that ITP has its own way to handle third-party cookies, so when it's enabled,
      and policy is set to [webkit.types.CookieAcceptPolicy.NoThirdParty], [webkit.types.CookieAcceptPolicy.Always]
      will be used instead. Once disabled, the policy will be set back to [webkit.types.CookieAcceptPolicy.NoThirdParty].
      See also webkit_website_data_manager_set_itp_enabled().
  
      Params:
        policy = a #WebKitCookieAcceptPolicy
  */
  void setAcceptPolicy(webkit.types.CookieAcceptPolicy policy)
  {
    webkit_cookie_manager_set_accept_policy(cast(WebKitCookieManager*)this._cPtr, policy);
  }

  /**
      Set non-session cookies.
      
      Set the filename where non-session cookies are stored persistently using
      storage as the format to read/write the cookies.
      Cookies are initially read from filename to create an initial set of cookies.
      Then, non-session cookies will be written to filename when the WebKitCookieManager::changed
      signal is emitted.
      By default, cookie_manager doesn't store the cookies persistently, so you need to call this
      method to keep cookies saved across sessions.
      
      This method should never be called on a #WebKitCookieManager associated to an ephemeral #WebKitWebsiteDataManager.
  
      Params:
        filename = the filename to read to/write from
        storage = a #WebKitCookiePersistentStorage
  */
  void setPersistentStorage(string filename, webkit.types.CookiePersistentStorage storage)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    webkit_cookie_manager_set_persistent_storage(cast(WebKitCookieManager*)this._cPtr, _filename, storage);
  }

  /**
      Connect to `Changed` signal.
  
      This signal is emitted when cookies are added, removed or modified.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.cookie_manager.CookieManager cookieManager))
  
          `cookieManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.cookie_manager.CookieManager)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
