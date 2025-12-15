/// Module for [Session] class
module soup.session;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.inet_socket_address;
import gio.input_stream;
import gio.output_stream;
import gio.proxy_resolver;
import gio.socket_connectable;
import gio.tls_database;
import gio.tls_interaction;
import gio.types;
import glib.bytes;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import soup.c.functions;
import soup.c.types;
import soup.message;
import soup.session_feature;
import soup.types;
import soup.websocket_connection;

/**
    Soup session state object.
    
    #SoupSession is the object that controls client-side HTTP. A
    #SoupSession encapsulates all of the state that libsoup is keeping
    on behalf of your program; cached HTTP connections, authentication
    information, etc. It also keeps track of various global options
    and features that you are using.
    
    Most applications will only need a single #SoupSession; the primary
    reason you might need multiple sessions is if you need to have
    multiple independent authentication contexts. (Eg, you are
    connecting to a server and authenticating as two different users at
    different times; the easiest way to ensure that each `class@Message`
    is sent with the authentication information you intended is to use
    one session for the first user, and a second session for the other
    user.)
    
    Additional #SoupSession functionality is provided by
    `iface@SessionFeature` objects, which can be added to a session with
    [soup.session.Session.addFeature] or [soup.session.Session.addFeatureByType]
    For example, `class@Logger` provides support for
    logging HTTP traffic, `class@ContentDecoder` provides support for
    compressed response handling, and `class@ContentSniffer` provides
    support for HTML5-style response body content sniffing.
    Additionally, subtypes of `class@Auth` can be added
    as features, to add support for additional authentication types.
    
    All [soup.session.Session]s are created with a `class@AuthManager`, and support
    for `SOUP_TYPE_AUTH_BASIC` and `SOUP_TYPE_AUTH_DIGEST`. Additionally,
    sessions using the plain #SoupSession class (rather than one of its deprecated
    subtypes) have a `class@ContentDecoder` by default.
    
    Note that all async methods will invoke their callbacks on the thread-default
    context at the time of the function call.
*/
class Session : gobject.object.ObjectWrap
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
    return cast(void function())soup_session_get_type != &gidSymbolNotFound ? soup_session_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Session self()
  {
    return this;
  }

  /**
      Get `acceptLanguage` property.
      Returns: If non-null, the value to use for the "Accept-Language" header
      on `class@Message`s sent from this session.
      
      Setting this will disable `property@Session:accept-language-auto`.
  */
  @property string acceptLanguage()
  {
    return getAcceptLanguage();
  }

  /**
      Set `acceptLanguage` property.
      Params:
        propval = If non-null, the value to use for the "Accept-Language" header
        on `class@Message`s sent from this session.
        
        Setting this will disable `property@Session:accept-language-auto`.
  */
  @property void acceptLanguage(string propval)
  {
    return setAcceptLanguage(propval);
  }

  /**
      Get `acceptLanguageAuto` property.
      Returns: If true, #SoupSession will automatically set the string
      for the "Accept-Language" header on every `class@Message`
      sent, based on the return value of `func@GLib.get_language_names`.
      
      Setting this will override any previous value of
      `property@Session:accept-language`.
  */
  @property bool acceptLanguageAuto()
  {
    return getAcceptLanguageAuto();
  }

  /**
      Set `acceptLanguageAuto` property.
      Params:
        propval = If true, #SoupSession will automatically set the string
        for the "Accept-Language" header on every `class@Message`
        sent, based on the return value of `func@GLib.get_language_names`.
        
        Setting this will override any previous value of
        `property@Session:accept-language`.
  */
  @property void acceptLanguageAuto(bool propval)
  {
    return setAcceptLanguageAuto(propval);
  }

  /**
      Get `idleTimeout` property.
      Returns: Connection lifetime (in seconds) when idle. Any connection
      left idle longer than this will be closed.
      
      Although you can change this property at any time, it will
      only affect newly-created connections, not currently-open
      ones. You can call [soup.session.Session.abort] after setting this
      if you want to ensure that all future connections will have
      this timeout value.
  */
  @property uint idleTimeout()
  {
    return getIdleTimeout();
  }

  /**
      Set `idleTimeout` property.
      Params:
        propval = Connection lifetime (in seconds) when idle. Any connection
        left idle longer than this will be closed.
        
        Although you can change this property at any time, it will
        only affect newly-created connections, not currently-open
        ones. You can call [soup.session.Session.abort] after setting this
        if you want to ensure that all future connections will have
        this timeout value.
  */
  @property void idleTimeout(uint propval)
  {
    return setIdleTimeout(propval);
  }

  /**
      Get `proxyResolver` property.
      Returns: A [gio.proxy_resolver.ProxyResolver] to use with this session.
      
      If no proxy resolver is set, then the default proxy resolver
      will be used. See [gio.proxy_resolver.ProxyResolver.getDefault].
      You can set it to null if you don't want to use proxies, or
      set it to your own [gio.proxy_resolver.ProxyResolver] if you want to control
      what proxies get used.
  */
  @property gio.proxy_resolver.ProxyResolver proxyResolver()
  {
    return getProxyResolver();
  }

  /**
      Set `proxyResolver` property.
      Params:
        propval = A [gio.proxy_resolver.ProxyResolver] to use with this session.
        
        If no proxy resolver is set, then the default proxy resolver
        will be used. See [gio.proxy_resolver.ProxyResolver.getDefault].
        You can set it to null if you don't want to use proxies, or
        set it to your own [gio.proxy_resolver.ProxyResolver] if you want to control
        what proxies get used.
  */
  @property void proxyResolver(gio.proxy_resolver.ProxyResolver propval)
  {
    return setProxyResolver(propval);
  }

  /**
      Get `timeout` property.
      Returns: The timeout (in seconds) for socket I/O operations
      (including connecting to a server, and waiting for a reply
      to an HTTP request).
      
      Although you can change this property at any time, it will
      only affect newly-created connections, not currently-open
      ones. You can call [soup.session.Session.abort] after setting this
      if you want to ensure that all future connections will have
      this timeout value.
      
      Not to be confused with `property@Session:idle-timeout` (which is
      the length of time that idle persistent connections will be
      kept open).
  */
  @property uint timeout()
  {
    return getTimeout();
  }

  /**
      Set `timeout` property.
      Params:
        propval = The timeout (in seconds) for socket I/O operations
        (including connecting to a server, and waiting for a reply
        to an HTTP request).
        
        Although you can change this property at any time, it will
        only affect newly-created connections, not currently-open
        ones. You can call [soup.session.Session.abort] after setting this
        if you want to ensure that all future connections will have
        this timeout value.
        
        Not to be confused with `property@Session:idle-timeout` (which is
        the length of time that idle persistent connections will be
        kept open).
  */
  @property void timeout(uint propval)
  {
    return setTimeout(propval);
  }

  /**
      Get `tlsDatabase` property.
      Returns: Sets the [gio.tls_database.TlsDatabase] to use for validating SSL/TLS
      certificates.
      
      If no certificate database is set, then the default database will be
      used. See [gio.tls_backend.TlsBackend.getDefaultDatabase].
  */
  @property gio.tls_database.TlsDatabase tlsDatabase()
  {
    return getTlsDatabase();
  }

  /**
      Set `tlsDatabase` property.
      Params:
        propval = Sets the [gio.tls_database.TlsDatabase] to use for validating SSL/TLS
        certificates.
        
        If no certificate database is set, then the default database will be
        used. See [gio.tls_backend.TlsBackend.getDefaultDatabase].
  */
  @property void tlsDatabase(gio.tls_database.TlsDatabase propval)
  {
    return setTlsDatabase(propval);
  }

  /**
      Get `tlsInteraction` property.
      Returns: A [gio.tls_interaction.TlsInteraction] object that will be passed on to any
      [gio.tls_connection.TlsConnection]s created by the session.
      
      This can be used to provide client-side certificates, for example.
  */
  @property gio.tls_interaction.TlsInteraction tlsInteraction()
  {
    return getTlsInteraction();
  }

  /**
      Set `tlsInteraction` property.
      Params:
        propval = A [gio.tls_interaction.TlsInteraction] object that will be passed on to any
        [gio.tls_connection.TlsConnection]s created by the session.
        
        This can be used to provide client-side certificates, for example.
  */
  @property void tlsInteraction(gio.tls_interaction.TlsInteraction propval)
  {
    return setTlsInteraction(propval);
  }

  /**
      Get `userAgent` property.
      Returns: User-Agent string.
      
      If non-null, the value to use for the "User-Agent" header
      on `class@Message`s sent from this session.
      
      RFC 2616 says: "The User-Agent request-header field
      contains information about the user agent originating the
      request. This is for statistical purposes, the tracing of
      protocol violations, and automated recognition of user
      agents for the sake of tailoring responses to avoid
      particular user agent limitations. User agents SHOULD
      include this field with requests."
      
      The User-Agent header contains a list of one or more
      product tokens, separated by whitespace, with the most
      significant product token coming first. The tokens must be
      brief, ASCII, and mostly alphanumeric (although "-", "_",
      and "." are also allowed), and may optionally include a "/"
      followed by a version string. You may also put comments,
      enclosed in parentheses, between or after the tokens.
      
      If you set a `property@Session:user-agent` property that has trailing
      whitespace, #SoupSession will append its own product token
      (eg, `libsoup/2.3.2`) to the end of the
      header for you.
  */
  @property string userAgent()
  {
    return getUserAgent();
  }

  /**
      Set `userAgent` property.
      Params:
        propval = User-Agent string.
        
        If non-null, the value to use for the "User-Agent" header
        on `class@Message`s sent from this session.
        
        RFC 2616 says: "The User-Agent request-header field
        contains information about the user agent originating the
        request. This is for statistical purposes, the tracing of
        protocol violations, and automated recognition of user
        agents for the sake of tailoring responses to avoid
        particular user agent limitations. User agents SHOULD
        include this field with requests."
        
        The User-Agent header contains a list of one or more
        product tokens, separated by whitespace, with the most
        significant product token coming first. The tokens must be
        brief, ASCII, and mostly alphanumeric (although "-", "_",
        and "." are also allowed), and may optionally include a "/"
        followed by a version string. You may also put comments,
        enclosed in parentheses, between or after the tokens.
        
        If you set a `property@Session:user-agent` property that has trailing
        whitespace, #SoupSession will append its own product token
        (eg, `libsoup/2.3.2`) to the end of the
        header for you.
  */
  @property void userAgent(string propval)
  {
    return setUserAgent(propval);
  }

  /**
      Creates a #SoupSession with the default options.
      Returns: the new session.
  */
  this()
  {
    SoupSession* _cretval;
    _cretval = soup_session_new();
    this(_cretval, Yes.Take);
  }

  /**
      Cancels all pending requests in session and closes all idle
      persistent connections.
  */
  void abort()
  {
    soup_session_abort(cast(SoupSession*)this._cPtr);
  }

  /**
      Adds feature's functionality to session. You cannot add multiple
      features of the same `aliasGLib.Type` to a session.
      
      See the main #SoupSession documentation for information on what
      features are present in sessions by default.
  
      Params:
        feature = an object that implements #SoupSessionFeature
  */
  void addFeature(soup.session_feature.SessionFeature feature)
  {
    soup_session_add_feature(cast(SoupSession*)this._cPtr, feature ? cast(SoupSessionFeature*)(cast(gobject.object.ObjectWrap)feature)._cPtr(No.Dup) : null);
  }

  /**
      If feature_type is the type of a class that implements
      `ifaceSessionFeature`, this creates a new feature of that type and
      adds it to session as with [soup.session.Session.addFeature]. You can use
      this when you don't need to customize the new feature in any way.
      Adding multiple features of the same feature_type is not allowed.
      
      If feature_type is not a `ifaceSessionFeature` type, this gives each
      existing feature on session the chance to accept feature_type as
      a "subfeature". This can be used to add new `classAuth` types, for instance.
      
      See the main #SoupSession documentation for information on what
      features are present in sessions by default.
  
      Params:
        featureType = a #GType
  */
  void addFeatureByType(gobject.types.GType featureType)
  {
    soup_session_add_feature_by_type(cast(SoupSession*)this._cPtr, featureType);
  }

  /**
      Get the value used by session for the "Accept-Language" header on new
      requests.
      Returns: the accept language string
  */
  string getAcceptLanguage()
  {
    const(char)* _cretval;
    _cretval = soup_session_get_accept_language(cast(SoupSession*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether session automatically sets the "Accept-Language" header on new
      requests.
      Returns: true if session sets "Accept-Language" header automatically, or
          false otherwise.
  */
  bool getAcceptLanguageAuto()
  {
    bool _retval;
    _retval = cast(bool)soup_session_get_accept_language_auto(cast(SoupSession*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `classMessage` of the result asynchronous operation This is useful
      to get the `classMessage` of an asynchronous operation started by session
      from its [gio.types.AsyncReadyCallback].
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: a #SoupMessage or
          null if result is not a valid session async operation result.
  */
  soup.message.Message getAsyncResultMessage(gio.async_result.AsyncResult result)
  {
    SoupMessage* _cretval;
    _cretval = soup_session_get_async_result_message(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(soup.message.Message)(cast(SoupMessage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the feature in session of type feature_type.
  
      Params:
        featureType = the #GType of the feature to get
      Returns: a #SoupSessionFeature, or null. The
          feature is owned by session.
  */
  soup.session_feature.SessionFeature getFeature(gobject.types.GType featureType)
  {
    SoupSessionFeature* _cretval;
    _cretval = soup_session_get_feature(cast(SoupSession*)this._cPtr, featureType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(soup.session_feature.SessionFeature)(cast(SoupSessionFeature*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the feature in session of type feature_type, provided
      that it is not disabled for msg.
  
      Params:
        featureType = the #GType of the feature to get
        msg = a #SoupMessage
      Returns: a #SoupSessionFeature. The feature is
          owned by session.
  */
  soup.session_feature.SessionFeature getFeatureForMessage(gobject.types.GType featureType, soup.message.Message msg)
  {
    SoupSessionFeature* _cretval;
    _cretval = soup_session_get_feature_for_message(cast(SoupSession*)this._cPtr, featureType, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(soup.session_feature.SessionFeature)(cast(SoupSessionFeature*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the timeout in seconds for idle connection lifetime currently used by
      session.
      Returns: the timeout in seconds
  */
  uint getIdleTimeout()
  {
    uint _retval;
    _retval = soup_session_get_idle_timeout(cast(SoupSession*)this._cPtr);
    return _retval;
  }

  /**
      Get the [gio.inet_socket_address.InetSocketAddress] to use for the client side of
      connections in session.
      Returns: a #GInetSocketAddress
  */
  gio.inet_socket_address.InetSocketAddress getLocalAddress()
  {
    GInetSocketAddress* _cretval;
    _cretval = soup_session_get_local_address(cast(SoupSession*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.inet_socket_address.InetSocketAddress)(cast(GInetSocketAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the maximum number of connections that session can open at once.
      Returns: the maximum number of connections
  */
  uint getMaxConns()
  {
    uint _retval;
    _retval = soup_session_get_max_conns(cast(SoupSession*)this._cPtr);
    return _retval;
  }

  /**
      Get the maximum number of connections that session can open at once to a
      given host.
      Returns: the maximum number of connections per host
  */
  uint getMaxConnsPerHost()
  {
    uint _retval;
    _retval = soup_session_get_max_conns_per_host(cast(SoupSession*)this._cPtr);
    return _retval;
  }

  /**
      Get the [gio.proxy_resolver.ProxyResolver] currently used by session.
      Returns: a #GProxyResolver or null if proxies
          are disabled in session
  */
  gio.proxy_resolver.ProxyResolver getProxyResolver()
  {
    GProxyResolver* _cretval;
    _cretval = soup_session_get_proxy_resolver(cast(SoupSession*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.proxy_resolver.ProxyResolver)(cast(GProxyResolver*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the remote connectable if one set.
      Returns: the #GSocketConnectable
  */
  gio.socket_connectable.SocketConnectable getRemoteConnectable()
  {
    GSocketConnectable* _cretval;
    _cretval = soup_session_get_remote_connectable(cast(SoupSession*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connectable.SocketConnectable)(cast(GSocketConnectable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the timeout in seconds for socket I/O operations currently used by
      session.
      Returns: the timeout in seconds
  */
  uint getTimeout()
  {
    uint _retval;
    _retval = soup_session_get_timeout(cast(SoupSession*)this._cPtr);
    return _retval;
  }

  /**
      Get the [gio.tls_database.TlsDatabase] currently used by session.
      Returns: a #GTlsDatabase
  */
  gio.tls_database.TlsDatabase getTlsDatabase()
  {
    GTlsDatabase* _cretval;
    _cretval = soup_session_get_tls_database(cast(SoupSession*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_database.TlsDatabase)(cast(GTlsDatabase*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the [gio.tls_interaction.TlsInteraction] currently used by session.
      Returns: a #GTlsInteraction
  */
  gio.tls_interaction.TlsInteraction getTlsInteraction()
  {
    GTlsInteraction* _cretval;
    _cretval = soup_session_get_tls_interaction(cast(SoupSession*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_interaction.TlsInteraction)(cast(GTlsInteraction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the value used by session for the "User-Agent" header on new requests.
      Returns: the user agent string
  */
  string getUserAgent()
  {
    const(char)* _cretval;
    _cretval = soup_session_get_user_agent(cast(SoupSession*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Tests if session has at a feature of type feature_type (which can
      be the type of either a `ifaceSessionFeature`, or else a subtype of
      some class managed by another feature, such as `classAuth`).
  
      Params:
        featureType = the #GType of the class of features to check for
      Returns: true or false
  */
  bool hasFeature(gobject.types.GType featureType)
  {
    bool _retval;
    _retval = cast(bool)soup_session_has_feature(cast(SoupSession*)this._cPtr, featureType);
    return _retval;
  }

  /**
      Start a preconnection to msg.
      
      Once the connection is done, it will remain in idle state so that it can be
      reused by future requests. If there's already an idle connection for the
      given msg host, the operation finishes successfully without creating a new
      connection. If a new request for the given msg host is made while the
      preconnect is still ongoing, the request will take the ownership of the
      connection and the preconnect operation will finish successfully (if there's
      a connection error it will be handled by the request).
      
      The operation finishes when the connection is done or an error occurred.
  
      Params:
        msg = a #SoupMessage
        ioPriority = the I/O priority of the request
        cancellable = a #GCancellable
        callback = the callback to invoke when the operation finishes
  */
  void preconnectAsync(soup.message.Message msg, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    soup_session_preconnect_async(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete a preconnect async operation started with [soup.session.Session.preconnectAsync].
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: true if the preconnect succeeded, or false in case of error.
      Throws: [ErrorWrap]
  */
  bool preconnectFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)soup_session_preconnect_finish(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Removes feature's functionality from session.
  
      Params:
        feature = a feature that has previously been added to session
  */
  void removeFeature(soup.session_feature.SessionFeature feature)
  {
    soup_session_remove_feature(cast(SoupSession*)this._cPtr, feature ? cast(SoupSessionFeature*)(cast(gobject.object.ObjectWrap)feature)._cPtr(No.Dup) : null);
  }

  /**
      Removes all features of type feature_type (or any subclass of
      feature_type) from session.
  
      Params:
        featureType = a #GType
  */
  void removeFeatureByType(gobject.types.GType featureType)
  {
    soup_session_remove_feature_by_type(cast(SoupSession*)this._cPtr, featureType);
  }

  /**
      Synchronously sends msg and waits for the beginning of a response.
      
      On success, a [gio.input_stream.InputStream] will be returned which you can use to
      read the response body. ("Success" here means only that an HTTP
      response was received and understood; it does not necessarily mean
      that a 2xx class status code was received.)
      
      If non-null, cancellable can be used to cancel the request;
      [soup.session.Session.send] will return a [gio.types.IOErrorEnum.Cancelled] error. Note that
      with requests that have side effects (eg, `POST`, `PUT`, `DELETE`) it is
      possible that you might cancel the request after the server acts on it, but
      before it returns a response, leaving the remote resource in an unknown
      state.
      
      If msg is requeued due to a redirect or authentication, the
      initial (`3xx/401/407`) response body will be suppressed, and
      [soup.session.Session.send] will only return once a final response has been
      received.
  
      Params:
        msg = a #SoupMessage
        cancellable = a #GCancellable
      Returns: a #GInputStream for reading the
          response body, or null on error.
      Throws: [ErrorWrap]
  */
  gio.input_stream.InputStream send(soup.message.Message msg, gio.cancellable.Cancellable cancellable = null)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = soup_session_send(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Synchronously sends msg and reads the response body.
      
      On success, a [glib.bytes.Bytes] will be returned with the response body.
      This function should only be used when the resource to be retrieved
      is not too long and can be stored in memory.
      
      See [soup.session.Session.send] for more details on the general semantics.
  
      Params:
        msg = a #SoupMessage
        cancellable = a #GCancellable
      Returns: a #GBytes, or null on error.
      Throws: [ErrorWrap]
  */
  glib.bytes.Bytes sendAndRead(soup.message.Message msg, gio.cancellable.Cancellable cancellable = null)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = soup_session_send_and_read(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asynchronously sends msg and reads the response body.
      
      When callback is called, then either msg has been sent, and its response
      body read, or else an error has occurred. This function should only be used
      when the resource to be retrieved is not too long and can be stored in
      memory. Call [soup.session.Session.sendAndReadFinish] to get a
      [glib.bytes.Bytes] with the response body.
      
      See [soup.session.Session.send] for more details on the general semantics.
  
      Params:
        msg = a #SoupMessage
        ioPriority = the I/O priority of the request
        cancellable = a #GCancellable
        callback = the callback to invoke
  */
  void sendAndReadAsync(soup.message.Message msg, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    soup_session_send_and_read_async(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Gets the response to a [soup.session.Session.sendAndReadAsync].
      
      If successful, returns a [glib.bytes.Bytes] with the response body.
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: a #GBytes, or null on error.
      Throws: [ErrorWrap]
  */
  glib.bytes.Bytes sendAndReadFinish(gio.async_result.AsyncResult result)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = soup_session_send_and_read_finish(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Synchronously sends msg and splices the response body stream into out_stream.
      
      See [soup.session.Session.send] for more details on the general semantics.
  
      Params:
        msg = a #SoupMessage
        outStream = a #GOutputStream
        flags = a set of #GOutputStreamSpliceFlags
        cancellable = a #GCancellable
      Returns: a #gssize containing the size of the data spliced, or -1 if an error occurred.
      Throws: [ErrorWrap]
  */
  ptrdiff_t sendAndSplice(soup.message.Message msg, gio.output_stream.OutputStream outStream, gio.types.OutputStreamSpliceFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = soup_session_send_and_splice(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, outStream ? cast(GOutputStream*)outStream._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously sends msg and splices the response body stream into out_stream.
      When callback is called, then either msg has been sent and its response body
      spliced, or else an error has occurred.
      
      See [soup.session.Session.send] for more details on the general semantics.
  
      Params:
        msg = a #SoupMessage
        outStream = a #GOutputStream
        flags = a set of #GOutputStreamSpliceFlags
        ioPriority = the I/O priority of the request
        cancellable = a #GCancellable
        callback = the callback to invoke
  */
  void sendAndSpliceAsync(soup.message.Message msg, gio.output_stream.OutputStream outStream, gio.types.OutputStreamSpliceFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    soup_session_send_and_splice_async(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, outStream ? cast(GOutputStream*)outStream._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Gets the response to a [soup.session.Session.sendAndSpliceAsync].
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: a #gssize containing the size of the data spliced, or -1 if an error occurred.
      Throws: [ErrorWrap]
  */
  ptrdiff_t sendAndSpliceFinish(gio.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = soup_session_send_and_splice_finish(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously sends msg and waits for the beginning of a response.
      
      When callback is called, then either msg has been sent, and its response
      headers received, or else an error has occurred. Call
      [soup.session.Session.sendFinish] to get a [gio.input_stream.InputStream] for reading the
      response body.
      
      See [soup.session.Session.send] for more details on the general semantics.
  
      Params:
        msg = a #SoupMessage
        ioPriority = the I/O priority of the request
        cancellable = a #GCancellable
        callback = the callback to invoke
  */
  void sendAsync(soup.message.Message msg, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    soup_session_send_async(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Gets the response to a [soup.session.Session.sendAsync] call.
      
      If successful returns a [gio.input_stream.InputStream] that can be used to read the
      response body.
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: a #GInputStream for reading the
          response body, or null on error.
      Throws: [ErrorWrap]
  */
  gio.input_stream.InputStream sendFinish(gio.async_result.AsyncResult result)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = soup_session_send_finish(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Set the value to use for the "Accept-Language" header on `classMessage`s
      sent from session.
      
      If accept_language is null then no "Accept-Language" will be included in
      requests. See `propertySession:accept-language` for more information.
  
      Params:
        acceptLanguage = the languages string
  */
  void setAcceptLanguage(string acceptLanguage)
  {
    const(char)* _acceptLanguage = acceptLanguage.toCString(No.Alloc);
    soup_session_set_accept_language(cast(SoupSession*)this._cPtr, _acceptLanguage);
  }

  /**
      Set whether session will automatically set the "Accept-Language" header on
      requests using a value generated from system languages based on
      `funcGLib.get_language_names`.
      
      See `propertySession:accept-language-auto` for more information.
  
      Params:
        acceptLanguageAuto = the value to set
  */
  void setAcceptLanguageAuto(bool acceptLanguageAuto)
  {
    soup_session_set_accept_language_auto(cast(SoupSession*)this._cPtr, acceptLanguageAuto);
  }

  /**
      Set a timeout in seconds for idle connection lifetime to be used by session
      on new connections.
      
      See `propertySession:idle-timeout` for more information.
  
      Params:
        timeout = a timeout in seconds
  */
  void setIdleTimeout(uint timeout)
  {
    soup_session_set_idle_timeout(cast(SoupSession*)this._cPtr, timeout);
  }

  /**
      Set a [gio.proxy_resolver.ProxyResolver] to be used by session on new connections.
      
      If proxy_resolver is null then no proxies will be used. See
      `propertySession:proxy-resolver` for more information.
  
      Params:
        proxyResolver = a #GProxyResolver or null
  */
  void setProxyResolver(gio.proxy_resolver.ProxyResolver proxyResolver = null)
  {
    soup_session_set_proxy_resolver(cast(SoupSession*)this._cPtr, proxyResolver ? cast(GProxyResolver*)(cast(gobject.object.ObjectWrap)proxyResolver)._cPtr(No.Dup) : null);
  }

  /**
      Set a timeout in seconds for socket I/O operations to be used by session
      on new connections.
      
      See `propertySession:timeout` for more information.
  
      Params:
        timeout = a timeout in seconds
  */
  void setTimeout(uint timeout)
  {
    soup_session_set_timeout(cast(SoupSession*)this._cPtr, timeout);
  }

  /**
      Set a `classGIo.TlsDatabase` to be used by session on new connections.
      
      If tls_database is null then certificate validation will always fail. See
      `propertySession:tls-database` for more information.
  
      Params:
        tlsDatabase = a #GTlsDatabase
  */
  void setTlsDatabase(gio.tls_database.TlsDatabase tlsDatabase = null)
  {
    soup_session_set_tls_database(cast(SoupSession*)this._cPtr, tlsDatabase ? cast(GTlsDatabase*)tlsDatabase._cPtr(No.Dup) : null);
  }

  /**
      Set a [gio.tls_interaction.TlsInteraction] to be used by session on new connections.
      
      If tls_interaction is null then client certificate validation will always
      fail.
      
      See `propertySession:tls-interaction` for more information.
  
      Params:
        tlsInteraction = a #GTlsInteraction
  */
  void setTlsInteraction(gio.tls_interaction.TlsInteraction tlsInteraction = null)
  {
    soup_session_set_tls_interaction(cast(SoupSession*)this._cPtr, tlsInteraction ? cast(GTlsInteraction*)tlsInteraction._cPtr(No.Dup) : null);
  }

  /**
      Set the value to use for the "User-Agent" header on `classMessage`s sent
      from session.
      
      If user_agent has trailing whitespace, session will append its own product
      token (eg, `libsoup/3.0.0`) to the end of the header for you. If user_agent
      is null then no "User-Agent" will be included in requests. See
      `propertySession:user-agent` for more information.
  
      Params:
        userAgent = the user agent string
  */
  void setUserAgent(string userAgent)
  {
    const(char)* _userAgent = userAgent.toCString(No.Alloc);
    soup_session_set_user_agent(cast(SoupSession*)this._cPtr, _userAgent);
  }

  /**
      Asynchronously creates a `classWebsocketConnection` to communicate with a
      remote server.
      
      All necessary WebSocket-related headers will be added to msg, and
      it will then be sent and asynchronously processed normally
      (including handling of redirection and HTTP authentication).
      
      If the server returns "101 Switching Protocols", then msg's status
      code and response headers will be updated, and then the WebSocket
      handshake will be completed. On success,
      [soup.session.Session.websocketConnectFinish] will return a new
      `classWebsocketConnection`. On failure it will return a #GError.
      
      If the server returns a status other than "101 Switching Protocols", then
      msg will contain the complete response headers and body from the server's
      response, and [soup.session.Session.websocketConnectFinish] will return
      [soup.types.WebsocketError.NotWebsocket].
  
      Params:
        msg = #SoupMessage indicating the WebSocket server to connect to
        origin = origin of the connection
        protocols = a
            null-terminated array of protocols supported
        ioPriority = the I/O priority of the request
        cancellable = a #GCancellable
        callback = the callback to invoke
  */
  void websocketConnectAsync(soup.message.Message msg, string origin, string[] protocols, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _origin = origin.toCString(No.Alloc);
    char*[] _tmpprotocols;
    foreach (s; protocols)
      _tmpprotocols ~= s.toCString(No.Alloc);
    _tmpprotocols ~= null;
    char** _protocols = _tmpprotocols.ptr;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    soup_session_websocket_connect_async(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, _origin, _protocols, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Gets the `classWebsocketConnection` response to a
      [soup.session.Session.websocketConnectAsync] call.
      
      If successful, returns a `classWebsocketConnection` that can be used to
      communicate with the server.
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: a new #SoupWebsocketConnection, or
          null on error.
      Throws: [ErrorWrap]
  */
  soup.websocket_connection.WebsocketConnection websocketConnectFinish(gio.async_result.AsyncResult result)
  {
    SoupWebsocketConnection* _cretval;
    GError *_err;
    _cretval = soup_session_websocket_connect_finish(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(soup.websocket_connection.WebsocketConnection)(cast(SoupWebsocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Connect to `RequestQueued` signal.
  
      Emitted when a request is queued on session.
      
      When sending a request, first `signalSession::request-queued`
      is emitted, indicating that the session has become aware of
      the request.
      
      After a connection is available to send the request various
      `classMessage` signals are emitted as the message is
      processed. If the message is requeued, it will emit
      `signalMessage::restarted`, which will then be followed by other
      `classMessage` signals when the message is re-sent.
      
      Eventually, the message will emit `signalMessage::finished`.
      Normally, this signals the completion of message
      processing. However, it is possible that the application
      will requeue the message from the "finished" handler.
      In that case the process will loop back.
      
      Eventually, a message will reach "finished" and not be
      requeued. At that point, the session will emit
      `signalSession::request-unqueued` to indicate that it is done
      with the message.
      
      To sum up: `signalSession::request-queued` and
      `signalSession::request-unqueued` are guaranteed to be emitted
      exactly once, but `signalMessage::finished` (and all of the other
      `classMessage` signals) may be invoked multiple times for a given
      message.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(soup.message.Message msg, soup.session.Session session))
  
          `msg` the request that was queued (optional)
  
          `session` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRequestQueued(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : soup.message.Message)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : soup.session.Session)))
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
    return connectSignalClosure("request-queued", closure, after);
  }

  /**
      Connect to `RequestUnqueued` signal.
  
      Emitted when a request is removed from session's queue,
      indicating that session is done with it.
      
      See `signalSession::request-queued` for a detailed description of
      the message lifecycle within a session.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(soup.message.Message msg, soup.session.Session session))
  
          `msg` the request that was unqueued (optional)
  
          `session` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRequestUnqueued(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : soup.message.Message)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : soup.session.Session)))
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
    return connectSignalClosure("request-unqueued", closure, after);
  }
}
