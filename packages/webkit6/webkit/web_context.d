/// Module for [WebContext] class
module webkit.web_context;

import gid.gid;
import glib.variant;
import gobject.dclosure;
import gobject.object;
import webkit.automation_session;
import webkit.c.functions;
import webkit.c.types;
import webkit.geolocation_manager;
import webkit.network_session;
import webkit.security_manager;
import webkit.security_origin;
import webkit.types;
import webkit.urischeme_request;
import webkit.user_message;

/**
    Manages aspects common to all #WebKitWebView<!-- -->s
    
    The #WebKitWebContext manages all aspects common to all
    #WebKitWebView<!-- -->s.
    
    You can define the #WebKitCacheModel with
    [webkit.web_context.WebContext.setCacheModel], depending on the needs of
    your application. You can access the #WebKitSecurityManager to specify
    the behaviour of your application regarding security using
    [webkit.web_context.WebContext.getSecurityManager].
    
    It is also possible to change your preferred language or enable
    spell checking, using [webkit.web_context.WebContext.setPreferredLanguages],
    [webkit.web_context.WebContext.setSpellCheckingLanguages] and
    [webkit.web_context.WebContext.setSpellCheckingEnabled].
    
    You can use [webkit.web_context.WebContext.registerUriScheme] to register
    custom URI schemes, and manage several other settings.
    
    TLS certificate validation failure is now treated as a transport
    error by default. To handle TLS failures differently, you can
    connect to #WebKitWebView::load-failed-with-tls-errors.
    Alternatively, you can use webkit_web_context_set_tls_errors_policy()
    to set the policy [webkit.types.TLSErrorsPolicy.Ignore]; however, this is
    not appropriate for Internet applications.
*/
class WebContext : gobject.object.ObjectWrap
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
    return cast(void function())webkit_web_context_get_type != &gidSymbolNotFound ? webkit_web_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebContext self()
  {
    return this;
  }

  /**
      Create a new #WebKitWebContext.
      Returns: a newly created #WebKitWebContext
  */
  this()
  {
    WebKitWebContext* _cretval;
    _cretval = webkit_web_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the default web context.
      Returns: a #WebKitWebContext
  */
  static webkit.web_context.WebContext getDefault()
  {
    WebKitWebContext* _cretval;
    _cretval = webkit_web_context_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.web_context.WebContext)(cast(WebKitWebContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a path to be mounted in the sandbox.
      
      path must exist before any web process has been created. It is a fatal error
      to add paths after a web process has been spawned.
      
      Paths under `/sys`, `/proc`, and `/dev` are invalid. Attempting to
      add all of `/` is not valid. Since 2.40, adding the user's entire
      home directory or /home is also not valid.
      
      See also webkit_web_context_set_sandbox_enabled()
  
      Params:
        path = an absolute path to mount in the sandbox
        readOnly = if true the path will be read-only
  */
  void addPathToSandbox(string path, bool readOnly)
  {
    const(char)* _path = path.toCString(No.Alloc);
    webkit_web_context_add_path_to_sandbox(cast(WebKitWebContext*)this._cPtr, _path, readOnly);
  }

  /**
      Returns the current cache model.
      
      For more information about this
      value check the documentation of the function
      [webkit.web_context.WebContext.setCacheModel].
      Returns: the current #WebKitCacheModel
  */
  webkit.types.CacheModel getCacheModel()
  {
    WebKitCacheModel _cretval;
    _cretval = webkit_web_context_get_cache_model(cast(WebKitWebContext*)this._cPtr);
    webkit.types.CacheModel _retval = cast(webkit.types.CacheModel)_cretval;
    return _retval;
  }

  /**
      Get the #WebKitGeolocationManager of context.
      Returns: the #WebKitGeolocationManager of context.
  */
  webkit.geolocation_manager.GeolocationManager getGeolocationManager()
  {
    WebKitGeolocationManager* _cretval;
    _cretval = webkit_web_context_get_geolocation_manager(cast(WebKitWebContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.geolocation_manager.GeolocationManager)(cast(WebKitGeolocationManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #WebKitNetworkSession used for automation sessions started in context.
      Returns: a #WebKitNetworkSession, or null if automation is not enabled
  */
  webkit.network_session.NetworkSession getNetworkSessionForAutomation()
  {
    WebKitNetworkSession* _cretval;
    _cretval = webkit_web_context_get_network_session_for_automation(cast(WebKitWebContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.network_session.NetworkSession)(cast(WebKitNetworkSession*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #WebKitSecurityManager of context.
      Returns: the #WebKitSecurityManager of context.
  */
  webkit.security_manager.SecurityManager getSecurityManager()
  {
    WebKitSecurityManager* _cretval;
    _cretval = webkit_web_context_get_security_manager(cast(WebKitWebContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.security_manager.SecurityManager)(cast(WebKitSecurityManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get whether spell checking feature is currently enabled.
      Returns: true If spell checking is enabled, or false otherwise.
  */
  bool getSpellCheckingEnabled()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_context_get_spell_checking_enabled(cast(WebKitWebContext*)this._cPtr);
    return _retval;
  }

  /**
      Get the the list of spell checking languages.
      
      Get the the list of spell checking languages associated with
      context, or null if no languages have been previously set.
      
      See [webkit.web_context.WebContext.setSpellCheckingLanguages] for more
      details on the format of the languages in the list.
      Returns: A null-terminated
           array of languages if available, or null otherwise.
  */
  string[] getSpellCheckingLanguages()
  {
    const(char*)* _cretval;
    _cretval = webkit_web_context_get_spell_checking_languages(cast(WebKitWebContext*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Get the #WebKitWebContext:time-zone-override property.
      Returns: 
  */
  string getTimeZoneOverride()
  {
    const(char)* _cretval;
    _cretval = webkit_web_context_get_time_zone_override(cast(WebKitWebContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets initial desktop notification permissions for the context.
      
      allowed_origins and disallowed_origins must each be #GList of
      #WebKitSecurityOrigin objects representing origins that will,
      respectively, either always or never have permission to show desktop
      notifications. No #WebKitNotificationPermissionRequest will ever be
      generated for any of the security origins represented in
      allowed_origins or disallowed_origins. This function is necessary
      because some webpages proactively check whether they have permission
      to display notifications without ever creating a permission request.
      
      This function only affects web processes that have not already been
      created. The best time to call it is when handling
      #WebKitWebContext::initialize-notification-permissions so as to
      ensure that new web processes receive the most recent set of
      permissions.
  
      Params:
        allowedOrigins = a #GList of security origins
        disallowedOrigins = a #GList of security origins
  */
  void initializeNotificationPermissions(webkit.security_origin.SecurityOrigin[] allowedOrigins, webkit.security_origin.SecurityOrigin[] disallowedOrigins)
  {
    auto _allowedOrigins = gListFromD!(webkit.security_origin.SecurityOrigin)(allowedOrigins);
    scope(exit) containerFree!(GList*, webkit.security_origin.SecurityOrigin, GidOwnership.None)(_allowedOrigins);
    auto _disallowedOrigins = gListFromD!(webkit.security_origin.SecurityOrigin)(disallowedOrigins);
    scope(exit) containerFree!(GList*, webkit.security_origin.SecurityOrigin, GidOwnership.None)(_disallowedOrigins);
    webkit_web_context_initialize_notification_permissions(cast(WebKitWebContext*)this._cPtr, _allowedOrigins, _disallowedOrigins);
  }

  /**
      Get whether automation is allowed in context.
      
      See also [webkit.web_context.WebContext.setAutomationAllowed].
      Returns: true if automation is allowed or false otherwise.
  */
  bool isAutomationAllowed()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_context_is_automation_allowed(cast(WebKitWebContext*)this._cPtr);
    return _retval;
  }

  /**
      Register scheme in context.
      
      Register scheme in context, so that when an URI request with scheme is made in the
      #WebKitWebContext, the #WebKitURISchemeRequestCallback registered will be called with a
      #WebKitURISchemeRequest.
      It is possible to handle URI scheme requests asynchronously, by calling [gobject.object.ObjectWrap.ref_] on the
      #WebKitURISchemeRequest and calling [webkit.urischeme_request.URISchemeRequest.finish] later
      when the data of the request is available or
      [webkit.urischeme_request.URISchemeRequest.finishError] in case of error.
      
      ```c
      static void
      about_uri_scheme_request_cb (WebKitURISchemeRequest *request,
                                   gpointer                user_data)
      {
          GInputStream *stream;
          gsize         stream_length;
          const gchar  *path = webkit_uri_scheme_request_get_path (request);
      
          if (!g_strcmp0 (path, "memory")) {
              // Create a GInputStream with the contents of memory about page, and set its length to stream_length
          } else if (!g_strcmp0 (path, "applications")) {
              // Create a GInputStream with the contents of applications about page, and set its length to stream_length
          } else if (!g_strcmp0 (path, "example")) {
              gchar *contents = g_strdup_printf ("<html><body><p>Example about page</p></body></html>");
              stream_length = strlen (contents);
              stream = g_memory_input_stream_new_from_data (contents, stream_length, g_free);
          } else {
              GError *error = g_error_new (ABOUT_HANDLER_ERROR, ABOUT_HANDLER_ERROR_INVALID, "Invalid about:%s page.", path);
              webkit_uri_scheme_request_finish_error (request, error);
              g_error_free (error);
              return;
          }
          webkit_uri_scheme_request_finish (request, stream, stream_length, "text/html");
          g_object_unref (stream);
      }
      ```
  
      Params:
        scheme = the network scheme to register
        callback = a #WebKitURISchemeRequestCallback
  */
  void registerUriScheme(string scheme, webkit.types.URISchemeRequestCallback callback)
  {
    extern(C) void _callbackCallback(WebKitURISchemeRequest* request, void* userData)
    {
      auto _dlg = cast(webkit.types.URISchemeRequestCallback*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(webkit.urischeme_request.URISchemeRequest)(cast(void*)request, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    webkit_web_context_register_uri_scheme(cast(WebKitWebContext*)this._cPtr, _scheme, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Send message to all web process extensions associated to context.
      
      If message is floating, it's consumed.
  
      Params:
        message = a #WebKitUserMessage
  */
  void sendMessageToAllExtensions(webkit.user_message.UserMessage message)
  {
    webkit_web_context_send_message_to_all_extensions(cast(WebKitWebContext*)this._cPtr, message ? cast(WebKitUserMessage*)message._cPtr(No.Dup) : null);
  }

  /**
      Set whether automation is allowed in context.
      
      When automation is enabled the browser could
      be controlled by another process by requesting an automation session. When a new automation
      session is requested the signal #WebKitWebContext::automation-started is emitted.
      Automation is disabled by default, so you need to explicitly call this method passing true
      to enable it.
      
      Note that only one #WebKitWebContext can have automation enabled, so this will do nothing
      if there's another #WebKitWebContext with automation already enabled.
  
      Params:
        allowed = value to set
  */
  void setAutomationAllowed(bool allowed)
  {
    webkit_web_context_set_automation_allowed(cast(WebKitWebContext*)this._cPtr, allowed);
  }

  /**
      Specifies a usage model for WebViews.
      
      Specifies a usage model for WebViews, which WebKit will use to
      determine its caching behavior. All web views follow the cache
      model. This cache model determines the RAM and disk space to use
      for caching previously viewed content .
      
      Research indicates that users tend to browse within clusters of
      documents that hold resources in common, and to revisit previously
      visited documents. WebKit and the frameworks below it include
      built-in caches that take advantage of these patterns,
      substantially improving document load speed in browsing
      situations. The WebKit cache model controls the behaviors of all of
      these caches, including various WebCore caches.
      
      Browsers can improve document load speed substantially by
      specifying [webkit.types.CacheModel.WebBrowser]. Applications without a
      browsing interface can reduce memory usage substantially by
      specifying [webkit.types.CacheModel.DocumentViewer]. The default value is
      [webkit.types.CacheModel.WebBrowser].
  
      Params:
        cacheModel = a #WebKitCacheModel
  */
  void setCacheModel(webkit.types.CacheModel cacheModel)
  {
    webkit_web_context_set_cache_model(cast(WebKitWebContext*)this._cPtr, cacheModel);
  }

  /**
      Set the list of preferred languages.
      
      Set the list of preferred languages, sorted from most desirable
      to least desirable. The list will be used in the following ways:
      
      $(LIST
        * Determining how to build the `Accept-Language` HTTP header that will be
          included in the network requests started by the #WebKitWebContext.
        * Setting the values of `navigator.language` and `navigator.languages`.
        * The first item in the list sets the default locale for JavaScript
          `Intl` functions.
      )
  
      Params:
        languages = a null-terminated list of language identifiers
  */
  void setPreferredLanguages(string[] languages = null)
  {
    const(char)*[] _tmplanguages;
    foreach (s; languages)
      _tmplanguages ~= s.toCString(No.Alloc);
    _tmplanguages ~= null;
    const(char*)* _languages = _tmplanguages.ptr;

    webkit_web_context_set_preferred_languages(cast(WebKitWebContext*)this._cPtr, _languages);
  }

  /**
      Enable or disable the spell checking feature.
  
      Params:
        enabled = Value to be set
  */
  void setSpellCheckingEnabled(bool enabled)
  {
    webkit_web_context_set_spell_checking_enabled(cast(WebKitWebContext*)this._cPtr, enabled);
  }

  /**
      Set the list of spell checking languages to be used for spell
      checking.
      
      The locale string typically is in the form lang_COUNTRY, where lang
      is an ISO-639 language code, and COUNTRY is an ISO-3166 country code.
      For instance, sv_FI for Swedish as written in Finland or pt_BR
      for Portuguese as written in Brazil.
      
      You need to call this function with a valid list of languages at
      least once in order to properly enable the spell checking feature
      in WebKit.
  
      Params:
        languages = a null-terminated list of spell checking languages
  */
  void setSpellCheckingLanguages(string[] languages)
  {
    char*[] _tmplanguages;
    foreach (s; languages)
      _tmplanguages ~= s.toCString(No.Alloc);
    _tmplanguages ~= null;
    const(char*)* _languages = _tmplanguages.ptr;

    webkit_web_context_set_spell_checking_languages(cast(WebKitWebContext*)this._cPtr, _languages);
  }

  /**
      Set the directory where WebKit will look for web process extensions.
      
      This method must be called before loading anything in this context,
      otherwise it will not have any effect. You can connect to
      #WebKitWebContext::initialize-web-process-extensions to call this method
      before anything is loaded.
      
      If your web process extension is installed to an unusual location,
      then you may also need to call [webkit.web_context.WebContext.addPathToSandbox].
  
      Params:
        directory = the directory to add
  */
  void setWebProcessExtensionsDirectory(string directory)
  {
    const(char)* _directory = directory.toCString(No.Alloc);
    webkit_web_context_set_web_process_extensions_directory(cast(WebKitWebContext*)this._cPtr, _directory);
  }

  /**
      Set user data to be passed to Web Extensions on initialization.
      
      The data will be passed to the
      #WebKitWebProcessExtensionInitializeWithUserDataFunction.
      This method must be called before loading anything in this context,
      otherwise it will not have any effect. You can connect to
      #WebKitWebContext::initialize-web-process-extensions to call this method
      before anything is loaded.
  
      Params:
        userData = a #GVariant
  */
  void setWebProcessExtensionsInitializationUserData(glib.variant.Variant userData)
  {
    webkit_web_context_set_web_process_extensions_initialization_user_data(cast(WebKitWebContext*)this._cPtr, userData ? cast(GVariant*)userData._cPtr(No.Dup) : null);
  }

  /**
      Connect to `AutomationStarted` signal.
  
      This signal is emitted when a new automation request is made.
        Note that it will never be emitted if automation is not enabled in context,
        see [webkit.web_context.WebContext.setAutomationAllowed] for more details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.automation_session.AutomationSession session, webkit.web_context.WebContext webContext))
  
          `session` the #WebKitAutomationSession associated with this event (optional)
  
          `webContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAutomationStarted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.automation_session.AutomationSession)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_context.WebContext)))
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
    return connectSignalClosure("automation-started", closure, after);
  }

  /**
      Connect to `InitializeNotificationPermissions` signal.
  
      This signal is emitted when a #WebKitWebContext needs to set
        initial notification permissions for a web process. It is emitted
        when a new web process is about to be launched, and signals the
        most appropriate moment to use
        [webkit.web_context.WebContext.initializeNotificationPermissions]. If no
        notification permissions have changed since the last time this
        signal was emitted, then there is no need to call
        [webkit.web_context.WebContext.initializeNotificationPermissions] again.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.web_context.WebContext webContext))
  
          `webContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInitializeNotificationPermissions(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_context.WebContext)))
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
    return connectSignalClosure("initialize-notification-permissions", closure, after);
  }

  /**
      Connect to `InitializeWebProcessExtensions` signal.
  
      This signal is emitted when a new web process is about to be
        launched. It signals the most appropriate moment to use
        [webkit.web_context.WebContext.setWebProcessExtensionsInitializationUserData]
        and [webkit.web_context.WebContext.setWebProcessExtensionsDirectory].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.web_context.WebContext webContext))
  
          `webContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInitializeWebProcessExtensions(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_context.WebContext)))
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
    return connectSignalClosure("initialize-web-process-extensions", closure, after);
  }

  /**
      Connect to `UserMessageReceived` signal.
  
      This signal is emitted when a #WebKitUserMessage is received from a
        web process extension. You can reply to the message using
        [webkitwebprocessextension.user_message.UserMessage.sendReply].
        
        You can handle the user message asynchronously by calling [gobject.object.ObjectWrap.ref_] on
        message and returning true.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.user_message.UserMessage message, webkit.web_context.WebContext webContext))
  
          `message` the #WebKitUserMessage received (optional)
  
          `webContext` the instance the signal is connected to (optional)
  
          `Returns` true if the message was handled, or false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUserMessageReceived(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.user_message.UserMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_context.WebContext)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("user-message-received", closure, after);
  }
}
