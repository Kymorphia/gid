/// Module for [Session] class
module gid.soup3.session;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.inet_socket_address;
import gid.gio2.input_stream;
import gid.gio2.output_stream;
import gid.gio2.proxy_resolver;
import gid.gio2.socket_connectable;
import gid.gio2.tls_database;
import gid.gio2.tls_interaction;
import gid.gio2.types;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.message;
import gid.soup3.session_feature;
import gid.soup3.types;
import gid.soup3.websocket_connection;

/**
    Soup session state object.
    
    [gid.soup3.session.Session] is the object that controls client-side HTTP. A
    [gid.soup3.session.Session] encapsulates all of the state that libsoup is keeping
    on behalf of your program; cached HTTP connections, authentication
    information, etc. It also keeps track of various global options
    and features that you are using.
    
    Most applications will only need a single [gid.soup3.session.Session]; the primary
    reason you might need multiple sessions is if you need to have
    multiple independent authentication contexts. (Eg, you are
    connecting to a server and authenticating as two different users at
    different times; the easiest way to ensure that each [gid.soup3.message.Message]
    is sent with the authentication information you intended is to use
    one session for the first user, and a second session for the other
    user.)
    
    Additional [gid.soup3.session.Session] functionality is provided by
    [gid.soup3.session_feature.SessionFeature] objects, which can be added to a session with
    [gid.soup3.session.Session.addFeature] or [gid.soup3.session.Session.addFeatureByType]
    For example, [gid.soup3.logger.Logger] provides support for
    logging HTTP traffic, [gid.soup3.content_decoder.ContentDecoder] provides support for
    compressed response handling, and [gid.soup3.content_sniffer.ContentSniffer] provides
    support for HTML5-style response body content sniffing.
    Additionally, subtypes of [gid.soup3.auth.Auth] can be added
    as features, to add support for additional authentication types.
    
    All [gid.soup3.session.Session]s are created with a [gid.soup3.auth_manager.AuthManager], and support
    for `SOUP_TYPE_AUTH_BASIC` and `SOUP_TYPE_AUTH_DIGEST`. Additionally,
    sessions using the plain [gid.soup3.session.Session] class (rather than one of its deprecated
    subtypes) have a [gid.soup3.content_decoder.ContentDecoder] by default.
    
    Note that all async methods will invoke their callbacks on the thread-default
    context at the time of the function call.
*/
@gidGir("Session", "SessionClass")
class Session : gid.gobject2.object.ObjectWrap
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
    return cast(void function())soup_session_get_type != &gidSymbolNotFound ? soup_session_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupSession";
  }

  /** Returns `this`, for use in `with` statements. */
  override Session self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.session.Session]
      Returns: New builder object
  */
  static SessionGidBuilder builder() nothrow
  {
    return new SessionGidBuilder;
  }

  /**
      Get `acceptLanguage` property.
      Returns: If non-null, the value to use for the "Accept-Language" header
        on [gid.soup3.message.Message]s sent from this session.
        
        Setting this will disable [gid.soup3.session.Session.acceptLanguageAuto].
  */
  @property string acceptLanguage() nothrow
  {
    return getAcceptLanguage();
  }

  /**
      Set `acceptLanguage` property.
      Params:
        propval = If non-null, the value to use for the "Accept-Language" header
          on [gid.soup3.message.Message]s sent from this session.
          
          Setting this will disable [gid.soup3.session.Session.acceptLanguageAuto].
  */
  @property void acceptLanguage(string propval) nothrow
  {
    setAcceptLanguage(propval);
  }

  /**
      Get `acceptLanguageAuto` property.
      Returns: If true, [gid.soup3.session.Session] will automatically set the string
        for the "Accept-Language" header on every [gid.soup3.message.Message]
        sent, based on the return value of `func@GLib.get_language_names`.
        
        Setting this will override any previous value of
        [gid.soup3.session.Session.acceptLanguage].
  */
  @property bool acceptLanguageAuto() nothrow
  {
    return getAcceptLanguageAuto();
  }

  /**
      Set `acceptLanguageAuto` property.
      Params:
        propval = If true, [gid.soup3.session.Session] will automatically set the string
          for the "Accept-Language" header on every [gid.soup3.message.Message]
          sent, based on the return value of `func@GLib.get_language_names`.
          
          Setting this will override any previous value of
          [gid.soup3.session.Session.acceptLanguage].
  */
  @property void acceptLanguageAuto(bool propval) nothrow
  {
    setAcceptLanguageAuto(propval);
  }

  /**
      Get `idleTimeout` property.
      Returns: Connection lifetime (in seconds) when idle. Any connection
        left idle longer than this will be closed.
        
        Although you can change this property at any time, it will
        only affect newly-created connections, not currently-open
        ones. You can call [gid.soup3.session.Session.abort] after setting this
        if you want to ensure that all future connections will have
        this timeout value.
  */
  @property uint idleTimeout() nothrow
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
          ones. You can call [gid.soup3.session.Session.abort] after setting this
          if you want to ensure that all future connections will have
          this timeout value.
  */
  @property void idleTimeout(uint propval) nothrow
  {
    setIdleTimeout(propval);
  }

  /**
      Get `localAddress` property.
      Returns: Sets the [gid.gio2.inet_socket_address.InetSocketAddress] to use for the client side of
        the connection.
        
        Use this property if you want for instance to bind the
        local socket to a specific IP address.
  */
  @property gid.gio2.inet_socket_address.InetSocketAddress localAddress() nothrow
  {
    return getLocalAddress();
  }

  /**
      Get `maxConns` property.
      Returns: The maximum number of connections that the session can open at once.
  */
  @property int maxConns() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("max-conns");
  }

  /**
      Get `maxConnsPerHost` property.
      Returns: The maximum number of connections that the session can open at once
        to a given host.
  */
  @property int maxConnsPerHost() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("max-conns-per-host");
  }

  /**
      Get `proxyResolver` property.
      Returns: A [gid.gio2.proxy_resolver.ProxyResolver] to use with this session.
        
        If no proxy resolver is set, then the default proxy resolver
        will be used. See [gid.gio2.proxy_resolver.ProxyResolver.getDefault].
        You can set it to null if you don't want to use proxies, or
        set it to your own [gid.gio2.proxy_resolver.ProxyResolver] if you want to control
        what proxies get used.
  */
  @property gid.gio2.proxy_resolver.ProxyResolver proxyResolver() nothrow
  {
    return getProxyResolver();
  }

  /**
      Set `proxyResolver` property.
      Params:
        propval = A [gid.gio2.proxy_resolver.ProxyResolver] to use with this session.
          
          If no proxy resolver is set, then the default proxy resolver
          will be used. See [gid.gio2.proxy_resolver.ProxyResolver.getDefault].
          You can set it to null if you don't want to use proxies, or
          set it to your own [gid.gio2.proxy_resolver.ProxyResolver] if you want to control
          what proxies get used.
  */
  @property void proxyResolver(gid.gio2.proxy_resolver.ProxyResolver propval) nothrow
  {
    setProxyResolver(propval);
  }

  /**
      Get `remoteConnectable` property.
      Returns: Sets a socket to make outgoing connections on. This will override the default
        behaviour of opening TCP/IP sockets to the hosts specified in the URIs.
        
        This function is not required for common HTTP usage, but only when connecting
        to a HTTP service that is not using standard TCP/IP sockets. An example of
        this is a local service that uses HTTP over UNIX-domain sockets, in that case
        a [gid.gio2.unix_socket_address.UnixSocketAddress] can be passed to this function.
  */
  @property gid.gio2.socket_connectable.SocketConnectable remoteConnectable() nothrow
  {
    return getRemoteConnectable();
  }

  /**
      Get `timeout` property.
      Returns: The timeout (in seconds) for socket I/O operations
        (including connecting to a server, and waiting for a reply
        to an HTTP request).
        
        Although you can change this property at any time, it will
        only affect newly-created connections, not currently-open
        ones. You can call [gid.soup3.session.Session.abort] after setting this
        if you want to ensure that all future connections will have
        this timeout value.
        
        Not to be confused with [gid.soup3.session.Session.idleTimeout] (which is
        the length of time that idle persistent connections will be
        kept open).
  */
  @property uint timeout() nothrow
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
          ones. You can call [gid.soup3.session.Session.abort] after setting this
          if you want to ensure that all future connections will have
          this timeout value.
          
          Not to be confused with [gid.soup3.session.Session.idleTimeout] (which is
          the length of time that idle persistent connections will be
          kept open).
  */
  @property void timeout(uint propval) nothrow
  {
    setTimeout(propval);
  }

  /**
      Get `tlsDatabase` property.
      Returns: Sets the [gid.gio2.tls_database.TlsDatabase] to use for validating SSL/TLS
        certificates.
        
        If no certificate database is set, then the default database will be
        used. See [gid.gio2.tls_backend.TlsBackend.getDefaultDatabase].
  */
  @property gid.gio2.tls_database.TlsDatabase tlsDatabase() nothrow
  {
    return getTlsDatabase();
  }

  /**
      Set `tlsDatabase` property.
      Params:
        propval = Sets the [gid.gio2.tls_database.TlsDatabase] to use for validating SSL/TLS
          certificates.
          
          If no certificate database is set, then the default database will be
          used. See [gid.gio2.tls_backend.TlsBackend.getDefaultDatabase].
  */
  @property void tlsDatabase(gid.gio2.tls_database.TlsDatabase propval) nothrow
  {
    setTlsDatabase(propval);
  }

  /**
      Get `tlsInteraction` property.
      Returns: A [gid.gio2.tls_interaction.TlsInteraction] object that will be passed on to any
        [gid.gio2.tls_connection.TlsConnection]s created by the session.
        
        This can be used to provide client-side certificates, for example.
  */
  @property gid.gio2.tls_interaction.TlsInteraction tlsInteraction() nothrow
  {
    return getTlsInteraction();
  }

  /**
      Set `tlsInteraction` property.
      Params:
        propval = A [gid.gio2.tls_interaction.TlsInteraction] object that will be passed on to any
          [gid.gio2.tls_connection.TlsConnection]s created by the session.
          
          This can be used to provide client-side certificates, for example.
  */
  @property void tlsInteraction(gid.gio2.tls_interaction.TlsInteraction propval) nothrow
  {
    setTlsInteraction(propval);
  }

  /**
      Get `userAgent` property.
      Returns: User-Agent string.
        
        If non-null, the value to use for the "User-Agent" header
        on [gid.soup3.message.Message]s sent from this session.
        
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
        
        If you set a [gid.soup3.session.Session.userAgent] property that has trailing
        whitespace, [gid.soup3.session.Session] will append its own product token
        (eg, `libsoup/2.3.2`) to the end of the
        header for you.
  */
  @property string userAgent() nothrow
  {
    return getUserAgent();
  }

  /**
      Set `userAgent` property.
      Params:
        propval = User-Agent string.
          
          If non-null, the value to use for the "User-Agent" header
          on [gid.soup3.message.Message]s sent from this session.
          
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
          
          If you set a [gid.soup3.session.Session.userAgent] property that has trailing
          whitespace, [gid.soup3.session.Session] will append its own product token
          (eg, `libsoup/2.3.2`) to the end of the
          header for you.
  */
  @property void userAgent(string propval) nothrow
  {
    setUserAgent(propval);
  }

  /**
      Creates a [gid.soup3.session.Session] with the default options.
      Returns: the new session.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      SoupSession* _cretval;
      _cretval = soup_session_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected void vfuncRequestQueued(gid.soup3.message.Message msg)
  {
    auto _klass = cast(SoupSessionClass*)_vfuncClass;
    if (!_klass.requestQueued)
      return;

    _klass.requestQueued(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncRequestUnqueued(gid.soup3.message.Message msg)
  {
    auto _klass = cast(SoupSessionClass*)_vfuncClass;
    if (!_klass.requestUnqueued)
      return;

    _klass.requestUnqueued(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
  }

  /**
      Cancels all pending requests in session and closes all idle
      persistent connections.
  */
  void abort() nothrow
  {
    soup_session_abort(cast(SoupSession*)this._cPtr);
  }

  /**
      Adds feature's functionality to session. You cannot add multiple
      features of the same [gid.gobject2.types.size_t] to a session.
      
      See the main [gid.soup3.session.Session] documentation for information on what
      features are present in sessions by default.
  
      Params:
        feature = an object that implements #SoupSessionFeature
  */
  void addFeature(gid.soup3.session_feature.SessionFeature feature) nothrow
  {
    soup_session_add_feature(cast(SoupSession*)this._cPtr, feature ? cast(SoupSessionFeature*)(cast(gid.gobject2.object.ObjectWrap)feature)._cPtr(No.Dup) : null);
  }

  /**
      If feature_type is the type of a class that implements
      [gid.soup3.session_feature.SessionFeature], this creates a new feature of that type and
      adds it to session as with [gid.soup3.session.Session.addFeature]. You can use
      this when you don't need to customize the new feature in any way.
      Adding multiple features of the same feature_type is not allowed.
      
      If feature_type is not a [gid.soup3.session_feature.SessionFeature] type, this gives each
      existing feature on session the chance to accept feature_type as
      a "subfeature". This can be used to add new [gid.soup3.auth.Auth] types, for instance.
      
      See the main [gid.soup3.session.Session] documentation for information on what
      features are present in sessions by default.
  
      Params:
        featureType = a #GType
  */
  void addFeatureByType(gid.gobject2.types.GType featureType) nothrow
  {
    soup_session_add_feature_by_type(cast(SoupSession*)this._cPtr, featureType);
  }

  /**
      Get the value used by session for the "Accept-Language" header on new
      requests.
      Returns: the accept language string
  */
  string getAcceptLanguage() nothrow
  {
    const(char)* _cretval;
    _cretval = soup_session_get_accept_language(cast(SoupSession*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether session automatically sets the "Accept-Language" header on new
      requests.
      Returns: true if session sets "Accept-Language" header automatically, or
          false otherwise.
  */
  bool getAcceptLanguageAuto() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_session_get_accept_language_auto(cast(SoupSession*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.soup3.message.Message] of the result asynchronous operation This is useful
      to get the [gid.soup3.message.Message] of an asynchronous operation started by session
      from its [gid.gio2.types.AsyncReadyCallback].
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: a #SoupMessage or
          null if result is not a valid session async operation result.
  */
  gid.soup3.message.Message getAsyncResultMessage(gid.gio2.async_result.AsyncResult result) nothrow
  {
    SoupMessage* _cretval;
    _cretval = soup_session_get_async_result_message(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(SoupMessage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the feature in session of type feature_type.
  
      Params:
        featureType = the #GType of the feature to get
      Returns: a #SoupSessionFeature, or null. The
          feature is owned by session.
  */
  gid.soup3.session_feature.SessionFeature getFeature(gid.gobject2.types.GType featureType) nothrow
  {
    SoupSessionFeature* _cretval;
    _cretval = soup_session_get_feature(cast(SoupSession*)this._cPtr, featureType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.session_feature.SessionFeature)(cast(SoupSessionFeature*)_cretval, No.Take);
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
  gid.soup3.session_feature.SessionFeature getFeatureForMessage(gid.gobject2.types.GType featureType, gid.soup3.message.Message msg) nothrow
  {
    SoupSessionFeature* _cretval;
    _cretval = soup_session_get_feature_for_message(cast(SoupSession*)this._cPtr, featureType, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.session_feature.SessionFeature)(cast(SoupSessionFeature*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the timeout in seconds for idle connection lifetime currently used by
      session.
      Returns: the timeout in seconds
  */
  uint getIdleTimeout() nothrow
  {
    uint _retval;
    _retval = soup_session_get_idle_timeout(cast(SoupSession*)this._cPtr);
    return _retval;
  }

  /**
      Get the [gid.gio2.inet_socket_address.InetSocketAddress] to use for the client side of
      connections in session.
      Returns: a #GInetSocketAddress
  */
  gid.gio2.inet_socket_address.InetSocketAddress getLocalAddress() nothrow
  {
    GInetSocketAddress* _cretval;
    _cretval = soup_session_get_local_address(cast(SoupSession*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.inet_socket_address.InetSocketAddress)(cast(GInetSocketAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the maximum number of connections that session can open at once.
      Returns: the maximum number of connections
  */
  uint getMaxConns() nothrow
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
  uint getMaxConnsPerHost() nothrow
  {
    uint _retval;
    _retval = soup_session_get_max_conns_per_host(cast(SoupSession*)this._cPtr);
    return _retval;
  }

  /**
      Get the [gid.gio2.proxy_resolver.ProxyResolver] currently used by session.
      Returns: a #GProxyResolver or null if proxies
          are disabled in session
  */
  gid.gio2.proxy_resolver.ProxyResolver getProxyResolver() nothrow
  {
    GProxyResolver* _cretval;
    _cretval = soup_session_get_proxy_resolver(cast(SoupSession*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.proxy_resolver.ProxyResolver)(cast(GProxyResolver*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the remote connectable if one set.
      Returns: the #GSocketConnectable
  */
  gid.gio2.socket_connectable.SocketConnectable getRemoteConnectable() nothrow
  {
    GSocketConnectable* _cretval;
    _cretval = soup_session_get_remote_connectable(cast(SoupSession*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_connectable.SocketConnectable)(cast(GSocketConnectable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the timeout in seconds for socket I/O operations currently used by
      session.
      Returns: the timeout in seconds
  */
  uint getTimeout() nothrow
  {
    uint _retval;
    _retval = soup_session_get_timeout(cast(SoupSession*)this._cPtr);
    return _retval;
  }

  /**
      Get the [gid.gio2.tls_database.TlsDatabase] currently used by session.
      Returns: a #GTlsDatabase
  */
  gid.gio2.tls_database.TlsDatabase getTlsDatabase() nothrow
  {
    GTlsDatabase* _cretval;
    _cretval = soup_session_get_tls_database(cast(SoupSession*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_database.TlsDatabase)(cast(GTlsDatabase*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the [gid.gio2.tls_interaction.TlsInteraction] currently used by session.
      Returns: a #GTlsInteraction
  */
  gid.gio2.tls_interaction.TlsInteraction getTlsInteraction() nothrow
  {
    GTlsInteraction* _cretval;
    _cretval = soup_session_get_tls_interaction(cast(SoupSession*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_interaction.TlsInteraction)(cast(GTlsInteraction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the value used by session for the "User-Agent" header on new requests.
      Returns: the user agent string
  */
  string getUserAgent() nothrow
  {
    const(char)* _cretval;
    _cretval = soup_session_get_user_agent(cast(SoupSession*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Tests if session has at a feature of type feature_type (which can
      be the type of either a [gid.soup3.session_feature.SessionFeature], or else a subtype of
      some class managed by another feature, such as [gid.soup3.auth.Auth]).
  
      Params:
        featureType = the #GType of the class of features to check for
      Returns: true or false
  */
  bool hasFeature(gid.gobject2.types.GType featureType) nothrow
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
  void preconnectAsync(gid.soup3.message.Message msg, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
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
    soup_session_preconnect_async(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete a preconnect async operation started with [gid.soup3.session.Session.preconnectAsync].
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: true if the preconnect succeeded, or false in case of error.
      Throws: [ErrorWrap]
  */
  bool preconnectFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)soup_session_preconnect_finish(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Removes feature's functionality from session.
  
      Params:
        feature = a feature that has previously been added to session
  */
  void removeFeature(gid.soup3.session_feature.SessionFeature feature) nothrow
  {
    soup_session_remove_feature(cast(SoupSession*)this._cPtr, feature ? cast(SoupSessionFeature*)(cast(gid.gobject2.object.ObjectWrap)feature)._cPtr(No.Dup) : null);
  }

  /**
      Removes all features of type feature_type (or any subclass of
      feature_type) from session.
  
      Params:
        featureType = a #GType
  */
  void removeFeatureByType(gid.gobject2.types.GType featureType) nothrow
  {
    soup_session_remove_feature_by_type(cast(SoupSession*)this._cPtr, featureType);
  }

  /**
      Synchronously sends msg and waits for the beginning of a response.
      
      On success, a [gid.gio2.input_stream.InputStream] will be returned which you can use to
      read the response body. ("Success" here means only that an HTTP
      response was received and understood; it does not necessarily mean
      that a 2xx class status code was received.)
      
      If non-null, cancellable can be used to cancel the request;
      [gid.soup3.session.Session.send] will return a [gid.gio2.types.IOErrorEnum.Cancelled] error. Note that
      with requests that have side effects (eg, `POST`, `PUT`, `DELETE`) it is
      possible that you might cancel the request after the server acts on it, but
      before it returns a response, leaving the remote resource in an unknown
      state.
      
      If msg is requeued due to a redirect or authentication, the
      initial (`3xx/401/407`) response body will be suppressed, and
      [gid.soup3.session.Session.send] will only return once a final response has been
      received.
      
      Possible error domains include [gid.soup3.types.SessionError], [gid.gio2.types.IOErrorEnum],
      and [gid.gio2.types.TlsError] which you may want to specifically handle.
  
      Params:
        msg = a #SoupMessage
        cancellable = a #GCancellable
      Returns: a #GInputStream for reading the
          response body, or null on error.
      Throws: [ErrorWrap]
  */
  gid.gio2.input_stream.InputStream send(gid.soup3.message.Message msg, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = soup_session_send(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Synchronously sends msg and reads the response body.
      
      On success, a [gid.glib2.bytes.Bytes] will be returned with the response body.
      This function should only be used when the resource to be retrieved
      is not too long and can be stored in memory.
      
      See [gid.soup3.session.Session.send] for more details on the general semantics.
  
      Params:
        msg = a #SoupMessage
        cancellable = a #GCancellable
      Returns: a #GBytes, or null on error.
      Throws: [ErrorWrap]
  */
  gid.glib2.bytes.Bytes sendAndRead(gid.soup3.message.Message msg, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = soup_session_send_and_read(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asynchronously sends msg and reads the response body.
      
      When callback is called, then either msg has been sent, and its response
      body read, or else an error has occurred. This function should only be used
      when the resource to be retrieved is not too long and can be stored in
      memory. Call [gid.soup3.session.Session.sendAndReadFinish] to get a
      [gid.glib2.bytes.Bytes] with the response body.
      
      See [gid.soup3.session.Session.send] for more details on the general semantics.
  
      Params:
        msg = a #SoupMessage
        ioPriority = the I/O priority of the request
        cancellable = a #GCancellable
        callback = the callback to invoke
  */
  void sendAndReadAsync(gid.soup3.message.Message msg, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
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
    soup_session_send_and_read_async(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Gets the response to a [gid.soup3.session.Session.sendAndReadAsync].
      
      If successful, returns a [gid.glib2.bytes.Bytes] with the response body.
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: a #GBytes, or null on error.
      Throws: [ErrorWrap]
  */
  gid.glib2.bytes.Bytes sendAndReadFinish(gid.gio2.async_result.AsyncResult result)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = soup_session_send_and_read_finish(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Synchronously sends msg and splices the response body stream into out_stream.
      
      See [gid.soup3.session.Session.send] for more details on the general semantics.
  
      Params:
        msg = a #SoupMessage
        outStream = a #GOutputStream
        flags = a set of #GOutputStreamSpliceFlags
        cancellable = a #GCancellable
      Returns: a #gssize containing the size of the data spliced, or -1 if an error occurred.
      Throws: [ErrorWrap]
  */
  ptrdiff_t sendAndSplice(gid.soup3.message.Message msg, gid.gio2.output_stream.OutputStream outStream, gid.gio2.types.OutputStreamSpliceFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = soup_session_send_and_splice(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, outStream ? cast(GOutputStream*)outStream._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously sends msg and splices the response body stream into out_stream.
      When callback is called, then either msg has been sent and its response body
      spliced, or else an error has occurred.
      
      See [gid.soup3.session.Session.send] for more details on the general semantics.
  
      Params:
        msg = a #SoupMessage
        outStream = a #GOutputStream
        flags = a set of #GOutputStreamSpliceFlags
        ioPriority = the I/O priority of the request
        cancellable = a #GCancellable
        callback = the callback to invoke
  */
  void sendAndSpliceAsync(gid.soup3.message.Message msg, gid.gio2.output_stream.OutputStream outStream, gid.gio2.types.OutputStreamSpliceFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
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
    soup_session_send_and_splice_async(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, outStream ? cast(GOutputStream*)outStream._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Gets the response to a [gid.soup3.session.Session.sendAndSpliceAsync].
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: a #gssize containing the size of the data spliced, or -1 if an error occurred.
      Throws: [ErrorWrap]
  */
  ptrdiff_t sendAndSpliceFinish(gid.gio2.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = soup_session_send_and_splice_finish(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously sends msg and waits for the beginning of a response.
      
      When callback is called, then either msg has been sent, and its response
      headers received, or else an error has occurred. Call
      [gid.soup3.session.Session.sendFinish] to get a [gid.gio2.input_stream.InputStream] for reading the
      response body.
      
      See [gid.soup3.session.Session.send] for more details on the general semantics.
  
      Params:
        msg = a #SoupMessage
        ioPriority = the I/O priority of the request
        cancellable = a #GCancellable
        callback = the callback to invoke
  */
  void sendAsync(gid.soup3.message.Message msg, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
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
    soup_session_send_async(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Gets the response to a [gid.soup3.session.Session.sendAsync] call.
      
      If successful returns a [gid.gio2.input_stream.InputStream] that can be used to read the
      response body.
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: a #GInputStream for reading the
          response body, or null on error.
      Throws: [ErrorWrap]
  */
  gid.gio2.input_stream.InputStream sendFinish(gid.gio2.async_result.AsyncResult result)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = soup_session_send_finish(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Set the value to use for the "Accept-Language" header on [gid.soup3.message.Message]s
      sent from session.
      
      If accept_language is null then no "Accept-Language" will be included in
      requests. See [gid.soup3.session.Session.acceptLanguage] for more information.
  
      Params:
        acceptLanguage = the languages string
  */
  void setAcceptLanguage(string acceptLanguage) nothrow
  {
    const(char)* _acceptLanguage = acceptLanguage.toCString!(No.Malloc, No.Nullable);
    soup_session_set_accept_language(cast(SoupSession*)this._cPtr, _acceptLanguage);
  }

  /**
      Set whether session will automatically set the "Accept-Language" header on
      requests using a value generated from system languages based on
      `funcGLib.get_language_names`.
      
      See [gid.soup3.session.Session.acceptLanguageAuto] for more information.
  
      Params:
        acceptLanguageAuto = the value to set
  */
  void setAcceptLanguageAuto(bool acceptLanguageAuto) nothrow
  {
    soup_session_set_accept_language_auto(cast(SoupSession*)this._cPtr, acceptLanguageAuto);
  }

  /**
      Set a timeout in seconds for idle connection lifetime to be used by session
      on new connections.
      
      See [gid.soup3.session.Session.idleTimeout] for more information.
  
      Params:
        timeout = a timeout in seconds
  */
  void setIdleTimeout(uint timeout) nothrow
  {
    soup_session_set_idle_timeout(cast(SoupSession*)this._cPtr, timeout);
  }

  /**
      Set a [gid.gio2.proxy_resolver.ProxyResolver] to be used by session on new connections.
      
      If proxy_resolver is null then no proxies will be used. See
      [gid.soup3.session.Session.proxyResolver] for more information.
  
      Params:
        proxyResolver = a #GProxyResolver or null
  */
  void setProxyResolver(gid.gio2.proxy_resolver.ProxyResolver proxyResolver = null) nothrow
  {
    soup_session_set_proxy_resolver(cast(SoupSession*)this._cPtr, proxyResolver ? cast(GProxyResolver*)(cast(gid.gobject2.object.ObjectWrap)proxyResolver)._cPtr(No.Dup) : null);
  }

  /**
      Set a timeout in seconds for socket I/O operations to be used by session
      on new connections.
      
      See [gid.soup3.session.Session.timeout] for more information.
  
      Params:
        timeout = a timeout in seconds
  */
  void setTimeout(uint timeout) nothrow
  {
    soup_session_set_timeout(cast(SoupSession*)this._cPtr, timeout);
  }

  /**
      Set a [gid.gio2.tls_database.TlsDatabase] to be used by session on new connections.
      
      If tls_database is null then certificate validation will always fail. See
      [gid.soup3.session.Session.tlsDatabase] for more information.
  
      Params:
        tlsDatabase = a #GTlsDatabase
  */
  void setTlsDatabase(gid.gio2.tls_database.TlsDatabase tlsDatabase = null) nothrow
  {
    soup_session_set_tls_database(cast(SoupSession*)this._cPtr, tlsDatabase ? cast(GTlsDatabase*)tlsDatabase._cPtr(No.Dup) : null);
  }

  /**
      Set a [gid.gio2.tls_interaction.TlsInteraction] to be used by session on new connections.
      
      If tls_interaction is null then client certificate validation will always
      fail.
      
      See [gid.soup3.session.Session.tlsInteraction] for more information.
  
      Params:
        tlsInteraction = a #GTlsInteraction
  */
  void setTlsInteraction(gid.gio2.tls_interaction.TlsInteraction tlsInteraction = null) nothrow
  {
    soup_session_set_tls_interaction(cast(SoupSession*)this._cPtr, tlsInteraction ? cast(GTlsInteraction*)tlsInteraction._cPtr(No.Dup) : null);
  }

  /**
      Set the value to use for the "User-Agent" header on [gid.soup3.message.Message]s sent
      from session.
      
      If user_agent has trailing whitespace, session will append its own product
      token (eg, `libsoup/3.0.0`) to the end of the header for you. If user_agent
      is null then no "User-Agent" will be included in requests. See
      [gid.soup3.session.Session.userAgent] for more information.
  
      Params:
        userAgent = the user agent string
  */
  void setUserAgent(string userAgent) nothrow
  {
    const(char)* _userAgent = userAgent.toCString!(No.Malloc, No.Nullable);
    soup_session_set_user_agent(cast(SoupSession*)this._cPtr, _userAgent);
  }

  /**
      Asynchronously creates a [gid.soup3.websocket_connection.WebsocketConnection] to communicate with a
      remote server.
      
      All necessary WebSocket-related headers will be added to msg, and
      it will then be sent and asynchronously processed normally
      (including handling of redirection and HTTP authentication).
      
      If the server returns "101 Switching Protocols", then msg's status
      code and response headers will be updated, and then the WebSocket
      handshake will be completed. On success,
      [gid.soup3.session.Session.websocketConnectFinish] will return a new
      [gid.soup3.websocket_connection.WebsocketConnection]. On failure it will return a #GError.
      
      If the server returns a status other than "101 Switching Protocols", then
      msg will contain the complete response headers and body from the server's
      response, and [gid.soup3.session.Session.websocketConnectFinish] will return
      [gid.soup3.types.WebsocketError.NotWebsocket].
  
      Params:
        msg = #SoupMessage indicating the WebSocket server to connect to
        origin = origin of the connection
        protocols = a
            null-terminated array of protocols supported
        ioPriority = the I/O priority of the request
        cancellable = a #GCancellable
        callback = the callback to invoke
  */
  void websocketConnectAsync(gid.soup3.message.Message msg, string origin, string[] protocols, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
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
    const(char)* _origin = origin.toCString!(No.Malloc, Yes.Nullable);
    auto _protocols_arr = new char*[](protocols.length + 1);
    auto _protocols = cast(char**)_protocols_arr.ptr;
    foreach (i, s; protocols) _protocols[i] = s.toCString!(No.Malloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    soup_session_websocket_connect_async(cast(SoupSession*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, _origin, _protocols, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Gets the [gid.soup3.websocket_connection.WebsocketConnection] response to a
      [gid.soup3.session.Session.websocketConnectAsync] call.
      
      If successful, returns a [gid.soup3.websocket_connection.WebsocketConnection] that can be used to
      communicate with the server.
  
      Params:
        result = the #GAsyncResult passed to your callback
      Returns: a new #SoupWebsocketConnection, or
          null on error.
      Throws: [ErrorWrap]
  */
  gid.soup3.websocket_connection.WebsocketConnection websocketConnectFinish(gid.gio2.async_result.AsyncResult result)
  {
    SoupWebsocketConnection* _cretval;
    GError *_err;
    _cretval = soup_session_websocket_connect_finish(cast(SoupSession*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.websocket_connection.WebsocketConnection)(cast(SoupWebsocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Connect to `RequestQueued` signal.
  
      Emitted when a request is queued on session.
        
        When sending a request, first [gid.soup3.session.Session.requestQueued]
        is emitted, indicating that the session has become aware of
        the request.
        
        After a connection is available to send the request various
        [gid.soup3.message.Message] signals are emitted as the message is
        processed. If the message is requeued, it will emit
        [gid.soup3.message.Message.restarted], which will then be followed by other
        [gid.soup3.message.Message] signals when the message is re-sent.
        
        Eventually, the message will emit [gid.soup3.message.Message.finished].
        Normally, this signals the completion of message
        processing. However, it is possible that the application
        will requeue the message from the "finished" handler.
        In that case the process will loop back.
        
        Eventually, a message will reach "finished" and not be
        requeued. At that point, the session will emit
        [gid.soup3.session.Session.requestUnqueued] to indicate that it is done
        with the message.
        
        To sum up: [gid.soup3.session.Session.requestQueued] and
        [gid.soup3.session.Session.requestUnqueued] are guaranteed to be emitted
        exactly once, but [gid.soup3.message.Message.finished] (and all of the other
        [gid.soup3.message.Message] signals) may be invoked multiple times for a given
        message.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message msg, gid.soup3.session.Session session)`
  
          `msg` the request that was queued (optional)
  
          `session` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRequestQueued(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.soup3.session.Session)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.session.Session.requestQueued");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-queued", closure, after);
  }

  /**
      Connect to `RequestUnqueued` signal.
  
      Emitted when a request is removed from session's queue,
        indicating that session is done with it.
        
        See [gid.soup3.session.Session.requestQueued] for a detailed description of
        the message lifecycle within a session.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.message.Message msg, gid.soup3.session.Session session)`
  
          `msg` the request that was unqueued (optional)
  
          `session` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRequestUnqueued(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.soup3.message.Message)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.soup3.session.Session)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.session.Session.requestUnqueued");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-unqueued", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Session
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.soup3.session.Session), T.stringof ~ " is not derived from gid.soup3.session.Session");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRequestQueued", true)[0]) == gid.soup3.session.Session))
      _installVfunc(klass, "request_queued");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRequestUnqueued", true)[0]) == gid.soup3.session.Session))
      _installVfunc(klass, "request_unqueued");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(SoupSessionClass*)klass;

    switch (vfunc)
    {
      case "request_queued":
      {
        static extern(C) void _vfuncRequestQueuedTramp(SoupSession* session, SoupMessage* msg) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.soup3.session.Session)(cast(void*)session);
          if (!_obj)
          {
            auto _klass = cast(SoupSessionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)session);
            if (_klass.requestQueued)
              return (cast(typeof(&_vfuncRequestQueuedTramp))_klass.requestQueued)(session, msg);
            return;
          }

          try
          {
            _obj.vfuncRequestQueued(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(void*)msg, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.session.Session.vfuncRequestQueued");
          }
        }

        _klass.requestQueued = cast(typeof(_klass.requestQueued))&_vfuncRequestQueuedTramp;
        break;
      }
      case "request_unqueued":
      {
        static extern(C) void _vfuncRequestUnqueuedTramp(SoupSession* session, SoupMessage* msg) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.soup3.session.Session)(cast(void*)session);
          if (!_obj)
          {
            auto _klass = cast(SoupSessionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)session);
            if (_klass.requestUnqueued)
              return (cast(typeof(&_vfuncRequestUnqueuedTramp))_klass.requestUnqueued)(session, msg);
            return;
          }

          try
          {
            _obj.vfuncRequestUnqueued(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(void*)msg, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.session.Session.vfuncRequestUnqueued");
          }
        }

        _klass.requestUnqueued = cast(typeof(_klass.requestUnqueued))&_vfuncRequestUnqueuedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.soup3.session.Session]
class SessionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `acceptLanguage` property.
      Params:
        propval = If non-null, the value to use for the "Accept-Language" header
          on [gid.soup3.message.Message]s sent from this session.
          
          Setting this will disable [gid.soup3.session.Session.acceptLanguageAuto].
      Returns: Builder instance for fluent chaining
  */
  T acceptLanguage(string propval) nothrow
  {
    return setProperty("accept-language", propval);
  }

  /**
      Set `acceptLanguageAuto` property.
      Params:
        propval = If true, [gid.soup3.session.Session] will automatically set the string
          for the "Accept-Language" header on every [gid.soup3.message.Message]
          sent, based on the return value of `func@GLib.get_language_names`.
          
          Setting this will override any previous value of
          [gid.soup3.session.Session.acceptLanguage].
      Returns: Builder instance for fluent chaining
  */
  T acceptLanguageAuto(bool propval) nothrow
  {
    return setProperty("accept-language-auto", propval);
  }

  /**
      Set `idleTimeout` property.
      Params:
        propval = Connection lifetime (in seconds) when idle. Any connection
          left idle longer than this will be closed.
          
          Although you can change this property at any time, it will
          only affect newly-created connections, not currently-open
          ones. You can call [gid.soup3.session.Session.abort] after setting this
          if you want to ensure that all future connections will have
          this timeout value.
      Returns: Builder instance for fluent chaining
  */
  T idleTimeout(uint propval) nothrow
  {
    return setProperty("idle-timeout", propval);
  }

  /**
      Set `localAddress` property.
      Params:
        propval = Sets the [gid.gio2.inet_socket_address.InetSocketAddress] to use for the client side of
          the connection.
          
          Use this property if you want for instance to bind the
          local socket to a specific IP address.
      Returns: Builder instance for fluent chaining
  */
  T localAddress(gid.gio2.inet_socket_address.InetSocketAddress propval) nothrow
  {
    return setProperty("local-address", propval);
  }

  /**
      Set `maxConns` property.
      Params:
        propval = The maximum number of connections that the session can open at once.
      Returns: Builder instance for fluent chaining
  */
  T maxConns(int propval) nothrow
  {
    return setProperty("max-conns", propval);
  }

  /**
      Set `maxConnsPerHost` property.
      Params:
        propval = The maximum number of connections that the session can open at once
          to a given host.
      Returns: Builder instance for fluent chaining
  */
  T maxConnsPerHost(int propval) nothrow
  {
    return setProperty("max-conns-per-host", propval);
  }

  /**
      Set `proxyResolver` property.
      Params:
        propval = A [gid.gio2.proxy_resolver.ProxyResolver] to use with this session.
          
          If no proxy resolver is set, then the default proxy resolver
          will be used. See [gid.gio2.proxy_resolver.ProxyResolver.getDefault].
          You can set it to null if you don't want to use proxies, or
          set it to your own [gid.gio2.proxy_resolver.ProxyResolver] if you want to control
          what proxies get used.
      Returns: Builder instance for fluent chaining
  */
  T proxyResolver(gid.gio2.proxy_resolver.ProxyResolver propval) nothrow
  {
    return setProperty("proxy-resolver", propval);
  }

  /**
      Set `remoteConnectable` property.
      Params:
        propval = Sets a socket to make outgoing connections on. This will override the default
          behaviour of opening TCP/IP sockets to the hosts specified in the URIs.
          
          This function is not required for common HTTP usage, but only when connecting
          to a HTTP service that is not using standard TCP/IP sockets. An example of
          this is a local service that uses HTTP over UNIX-domain sockets, in that case
          a [gid.gio2.unix_socket_address.UnixSocketAddress] can be passed to this function.
      Returns: Builder instance for fluent chaining
  */
  T remoteConnectable(gid.gio2.socket_connectable.SocketConnectable propval) nothrow
  {
    return setProperty("remote-connectable", propval);
  }

  /**
      Set `timeout` property.
      Params:
        propval = The timeout (in seconds) for socket I/O operations
          (including connecting to a server, and waiting for a reply
          to an HTTP request).
          
          Although you can change this property at any time, it will
          only affect newly-created connections, not currently-open
          ones. You can call [gid.soup3.session.Session.abort] after setting this
          if you want to ensure that all future connections will have
          this timeout value.
          
          Not to be confused with [gid.soup3.session.Session.idleTimeout] (which is
          the length of time that idle persistent connections will be
          kept open).
      Returns: Builder instance for fluent chaining
  */
  T timeout(uint propval) nothrow
  {
    return setProperty("timeout", propval);
  }

  /**
      Set `tlsDatabase` property.
      Params:
        propval = Sets the [gid.gio2.tls_database.TlsDatabase] to use for validating SSL/TLS
          certificates.
          
          If no certificate database is set, then the default database will be
          used. See [gid.gio2.tls_backend.TlsBackend.getDefaultDatabase].
      Returns: Builder instance for fluent chaining
  */
  T tlsDatabase(gid.gio2.tls_database.TlsDatabase propval) nothrow
  {
    return setProperty("tls-database", propval);
  }

  /**
      Set `tlsInteraction` property.
      Params:
        propval = A [gid.gio2.tls_interaction.TlsInteraction] object that will be passed on to any
          [gid.gio2.tls_connection.TlsConnection]s created by the session.
          
          This can be used to provide client-side certificates, for example.
      Returns: Builder instance for fluent chaining
  */
  T tlsInteraction(gid.gio2.tls_interaction.TlsInteraction propval) nothrow
  {
    return setProperty("tls-interaction", propval);
  }

  /**
      Set `userAgent` property.
      Params:
        propval = User-Agent string.
          
          If non-null, the value to use for the "User-Agent" header
          on [gid.soup3.message.Message]s sent from this session.
          
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
          
          If you set a [gid.soup3.session.Session.userAgent] property that has trailing
          whitespace, [gid.soup3.session.Session] will append its own product token
          (eg, `libsoup/2.3.2`) to the end of the
          header for you.
      Returns: Builder instance for fluent chaining
  */
  T userAgent(string propval) nothrow
  {
    return setProperty("user-agent", propval);
  }
}

/// Fluent builder for [gid.soup3.session.Session]
final class SessionGidBuilder : SessionGidBuilderImpl!SessionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Session build() nothrow
  {
    return new Session(cast(void*)createGObject(Session._getGType), Yes.Take);
  }
}
