/// Module for [NetworkSession] class
module webkit.network_session;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.tls_certificate;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.cookie_manager;
import webkit.download;
import webkit.itpthird_party;
import webkit.memory_pressure_settings;
import webkit.network_proxy_settings;
import webkit.types;
import webkit.website_data_manager;

/**
    Manages network configuration.
*/
class NetworkSession : gobject.object.ObjectWrap
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
    return cast(void function())webkit_network_session_get_type != &gidSymbolNotFound ? webkit_network_session_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NetworkSession self()
  {
    return this;
  }

  /**
      Creates a new #WebKitNetworkSession with a persistent #WebKitWebsiteDataManager.
      The parameters data_directory and cache_directory will be used as construct
      properties of the #WebKitWebsiteDataManager of the network session. Note that if
      null is passed, the default directory will be passed to #WebKitWebsiteDataManager
      so that [webkit.website_data_manager.WebsiteDataManager.getBaseDataDirectory] and
      [webkit.website_data_manager.WebsiteDataManager.getBaseCacheDirectory] always return a value for
      non ephemeral sessions.
      
      It must be passed as construct parameter of a #WebKitWebView.
  
      Params:
        dataDirectory = a base directory for data, or null
        cacheDirectory = a base directory for caches, or null
      Returns: the newly created #WebKitNetworkSession
  */
  this(string dataDirectory = null, string cacheDirectory = null)
  {
    WebKitNetworkSession* _cretval;
    const(char)* _dataDirectory = dataDirectory.toCString(No.Alloc);
    const(char)* _cacheDirectory = cacheDirectory.toCString(No.Alloc);
    _cretval = webkit_network_session_new(_dataDirectory, _cacheDirectory);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #WebKitNetworkSession with an ephemeral #WebKitWebsiteDataManager.
      Returns: a new ephemeral #WebKitNetworkSession.
  */
  static webkit.network_session.NetworkSession newEphemeral()
  {
    WebKitNetworkSession* _cretval;
    _cretval = webkit_network_session_new_ephemeral();
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.network_session.NetworkSession)(cast(WebKitNetworkSession*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the default network session.
      The default network session is created using [webkit.network_session.NetworkSession.new_] and passing
      null as data and cache directories.
      Returns: a #WebKitNetworkSession
  */
  static webkit.network_session.NetworkSession getDefault()
  {
    WebKitNetworkSession* _cretval;
    _cretval = webkit_network_session_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.network_session.NetworkSession)(cast(WebKitNetworkSession*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets settings as the #WebKitMemoryPressureSettings.
      
      Sets settings as the #WebKitMemoryPressureSettings to be used by the network
      process created by any instance of #WebKitNetworkSession after this function
      is called.
      
      Be sure to call this function before creating any #WebKitNetworkSession.
      
      The periodic check for used memory is disabled by default on network processes. This will
      be enabled only if custom settings have been set using this function. After that, in order
      to remove the custom settings and disable the periodic check, this function must be called
      passing null as the value of settings.
  
      Params:
        settings = a WebKitMemoryPressureSettings.
  */
  static void setMemoryPressureSettings(webkit.memory_pressure_settings.MemoryPressureSettings settings)
  {
    webkit_network_session_set_memory_pressure_settings(settings ? cast(WebKitMemoryPressureSettings*)settings._cPtr(No.Dup) : null);
  }

  /**
      Ignore further TLS errors on the host for the certificate present in info.
      
      If host is an IPv6 address, it should not be surrounded by brackets. This
      expectation matches [glib.uri.Uri.getHost].
  
      Params:
        certificate = a #GTlsCertificate
        host = the host for which a certificate is to be allowed
  */
  void allowTlsCertificateForHost(gio.tls_certificate.TlsCertificate certificate, string host)
  {
    const(char)* _host = host.toCString(No.Alloc);
    webkit_network_session_allow_tls_certificate_for_host(cast(WebKitNetworkSession*)this._cPtr, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, _host);
  }

  /**
      Requests downloading of the specified URI string.
      
      The download operation will not be associated to any #WebKitWebView,
      if you are interested in starting a download from a particular #WebKitWebView use
      [webkit.web_view.WebView.downloadUri] instead.
  
      Params:
        uri = the URI to download
      Returns: a new #WebKitDownload representing
           the download operation.
  */
  webkit.download.Download downloadUri(string uri)
  {
    WebKitDownload* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = webkit_network_session_download_uri(cast(WebKitNetworkSession*)this._cPtr, _uri);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.download.Download)(cast(WebKitDownload*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the #WebKitCookieManager of session.
      Returns: a #WebKitCookieManager
  */
  webkit.cookie_manager.CookieManager getCookieManager()
  {
    WebKitCookieManager* _cretval;
    _cretval = webkit_network_session_get_cookie_manager(cast(WebKitNetworkSession*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.cookie_manager.CookieManager)(cast(WebKitCookieManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get whether Intelligent Tracking Prevention (ITP) is enabled or not.
      Returns: true if ITP is enabled, or false otherwise.
  */
  bool getItpEnabled()
  {
    bool _retval;
    _retval = cast(bool)webkit_network_session_get_itp_enabled(cast(WebKitNetworkSession*)this._cPtr);
    return _retval;
  }

  /**
      Asynchronously get the list of #WebKitITPThirdParty seen for session.
      
      Every #WebKitITPThirdParty
      contains the list of #WebKitITPFirstParty under which it has been seen.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.network_session.NetworkSession.getItpSummaryFinish] to get the result of the operation.
  
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
    webkit_network_session_get_itp_summary(cast(WebKitNetworkSession*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.network_session.NetworkSession.getItpSummary].
  
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
    _cretval = webkit_network_session_get_itp_summary_finish(cast(WebKitNetworkSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(webkit.itpthird_party.ITPThirdParty, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get whether persistent credential storage is enabled or not.
      
      See also [webkit.network_session.NetworkSession.setPersistentCredentialStorageEnabled].
      Returns: true if persistent credential storage is enabled, or false otherwise.
  */
  bool getPersistentCredentialStorageEnabled()
  {
    bool _retval;
    _retval = cast(bool)webkit_network_session_get_persistent_credential_storage_enabled(cast(WebKitNetworkSession*)this._cPtr);
    return _retval;
  }

  /**
      Get the TLS errors policy of session.
      Returns: a #WebKitTLSErrorsPolicy
  */
  webkit.types.TLSErrorsPolicy getTlsErrorsPolicy()
  {
    WebKitTLSErrorsPolicy _cretval;
    _cretval = webkit_network_session_get_tls_errors_policy(cast(WebKitNetworkSession*)this._cPtr);
    webkit.types.TLSErrorsPolicy _retval = cast(webkit.types.TLSErrorsPolicy)_cretval;
    return _retval;
  }

  /**
      Get the #WebKitWebsiteDataManager of session.
      Returns: a #WebKitWebsiteDataManager
  */
  webkit.website_data_manager.WebsiteDataManager getWebsiteDataManager()
  {
    WebKitWebsiteDataManager* _cretval;
    _cretval = webkit_network_session_get_website_data_manager(cast(WebKitNetworkSession*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.website_data_manager.WebsiteDataManager)(cast(WebKitWebsiteDataManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get whether session is ephemeral.
      A #WebKitNetworkSession is ephemeral when its #WebKitWebsiteDataManager is ephemeral.
      See #WebKitWebsiteDataManager:is-ephemeral for more details.
      Returns: true if session is pehmeral, or false otherwise
  */
  bool isEphemeral()
  {
    bool _retval;
    _retval = cast(bool)webkit_network_session_is_ephemeral(cast(WebKitNetworkSession*)this._cPtr);
    return _retval;
  }

  /**
      Resolve the domain name of the given hostname in advance, so that if a URI
      of hostname is requested the load will be performed more quickly.
  
      Params:
        hostname = a hostname to be resolved
  */
  void prefetchDns(string hostname)
  {
    const(char)* _hostname = hostname.toCString(No.Alloc);
    webkit_network_session_prefetch_dns(cast(WebKitNetworkSession*)this._cPtr, _hostname);
  }

  /**
      Enable or disable Intelligent Tracking Prevention (ITP).
      
      When ITP is enabled resource load statistics
      are collected and used to decide whether to allow or block third-party cookies and prevent user tracking.
      Note that while ITP is enabled the accept policy [webkit.types.CookieAcceptPolicy.NoThirdParty] is ignored and
      [webkit.types.CookieAcceptPolicy.Always] is used instead. See also webkit_cookie_session_set_accept_policy().
  
      Params:
        enabled = value to set
  */
  void setItpEnabled(bool enabled)
  {
    webkit_network_session_set_itp_enabled(cast(WebKitNetworkSession*)this._cPtr, enabled);
  }

  /**
      Enable or disable persistent credential storage.
      
      When enabled, which is the default for
      non-ephemeral sessions, the network process will try to read and write HTTP authentiacation
      credentials from persistent storage.
  
      Params:
        enabled = value to set
  */
  void setPersistentCredentialStorageEnabled(bool enabled)
  {
    webkit_network_session_set_persistent_credential_storage_enabled(cast(WebKitNetworkSession*)this._cPtr, enabled);
  }

  /**
      Set the network proxy settings to be used by connections started in session session.
      
      By default [webkit.types.NetworkProxyMode.Default] is used, which means that the
      system settings will be used ([gio.proxy_resolver.ProxyResolver.getDefault]).
      If you want to override the system default settings, you can either use
      [webkit.types.NetworkProxyMode.NoProxy] to make sure no proxies are used at all,
      or [webkit.types.NetworkProxyMode.Custom] to provide your own proxy settings.
      When proxy_mode is [webkit.types.NetworkProxyMode.Custom] proxy_settings must be
      a valid #WebKitNetworkProxySettings; otherwise, proxy_settings must be null.
  
      Params:
        proxyMode = a #WebKitNetworkProxyMode
        proxySettings = a #WebKitNetworkProxySettings, or null
  */
  void setProxySettings(webkit.types.NetworkProxyMode proxyMode, webkit.network_proxy_settings.NetworkProxySettings proxySettings = null)
  {
    webkit_network_session_set_proxy_settings(cast(WebKitNetworkSession*)this._cPtr, proxyMode, proxySettings ? cast(WebKitNetworkProxySettings*)proxySettings._cPtr(No.Dup) : null);
  }

  /**
      Set the TLS errors policy of session as policy.
  
      Params:
        policy = a #WebKitTLSErrorsPolicy
  */
  void setTlsErrorsPolicy(webkit.types.TLSErrorsPolicy policy)
  {
    webkit_network_session_set_tls_errors_policy(cast(WebKitNetworkSession*)this._cPtr, policy);
  }

  /**
      Connect to `DownloadStarted` signal.
  
      This signal is emitted when a new download request is made.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.download.Download download, webkit.network_session.NetworkSession networkSession))
  
          `download` the #WebKitDownload associated with this event (optional)
  
          `networkSession` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDownloadStarted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.download.Download)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.network_session.NetworkSession)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("download-started", closure, after);
  }
}
