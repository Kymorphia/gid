/// Module for [Server] class
module soup.server;

import gid.gid;
import gio.iostream;
import gio.socket;
import gio.socket_address;
import gio.tls_certificate;
import gio.tls_database;
import gio.types;
import glib.error;
import glib.uri;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import soup.auth_domain;
import soup.c.functions;
import soup.c.types;
import soup.server_message;
import soup.types;
import soup.websocket_connection;

/**
    A HTTP server.
    
    #SoupServer implements a simple HTTP server.
    
    To begin, create a server using [soup.server.Server.new_]. Add at least one
    handler by calling [soup.server.Server.addHandler] or
    [soup.server.Server.addEarlyHandler]; the handler will be called to
    process any requests underneath the path you pass. (If you want all
    requests to go to the same handler, just pass "/" (or null) for
    the path.)
    
    When a new connection is accepted (or a new request is started on
    an existing persistent connection), the #SoupServer will emit
    `signal@Server::request-started` and then begin processing the request
    as described below, but note that once the message is assigned a
    status-code, then callbacks after that point will be
    skipped. Note also that it is not defined when the callbacks happen
    relative to various `class@ServerMessage` signals.
    
    Once the headers have been read, #SoupServer will check if there is
    a `class@AuthDomain` `(qv)` covering the Request-URI; if so, and if the
    message does not contain suitable authorization, then the
    `class@AuthDomain` will set a status of [soup.types.Status.Unauthorized] on
    the message.
    
    After checking for authorization, #SoupServer will look for "early"
    handlers (added with [soup.server.Server.addEarlyHandler]) matching the
    Request-URI. If one is found, it will be run; in particular, this
    can be used to connect to signals to do a streaming read of the
    request body.
    
    (At this point, if the request headers contain `Expect:
    100-continue`, and a status code has been set, then
    #SoupServer will skip the remaining steps and return the response.
    If the request headers contain `Expect:
    100-continue` and no status code has been set,
    #SoupServer will return a [soup.types.Status.Continue] status before
    continuing.)
    
    The server will then read in the response body (if present). At
    this point, if there are no handlers at all defined for the
    Request-URI, then the server will return [soup.types.Status.NotFound] to
    the client.
    
    Otherwise (assuming no previous step assigned a status to the
    message) any "normal" handlers (added with
    [soup.server.Server.addHandler]) for the message's Request-URI will be
    run.
    
    Then, if the path has a WebSocket handler registered (and has
    not yet been assigned a status), #SoupServer will attempt to
    validate the WebSocket handshake, filling in the response and
    setting a status of [soup.types.Status.SwitchingProtocols] or
    [soup.types.Status.BadRequest] accordingly.
    
    If the message still has no status code at this point (and has not
    been paused with [soup.server_message.ServerMessage.pause]), then it will be
    given a status of [soup.types.Status.InternalServerError] (because at
    least one handler ran, but returned without assigning a status).
    
    Finally, the server will emit `signal@Server::request-finished` (or
    `signal@Server::request-aborted` if an I/O error occurred before
    handling was completed).
    
    If you want to handle the special "*" URI (eg, "OPTIONS *"), you
    must explicitly register a handler for "*"; the default handler
    will not be used for that case.
    
    If you want to process https connections in addition to (or instead
    of) http connections, you can set the `property@Server:tls-certificate`
    property.
    
    Once the server is set up, make one or more calls to
    [soup.server.Server.listen], [soup.server.Server.listenLocal], or
    [soup.server.Server.listenAll] to tell it where to listen for
    connections. (All ports on a #SoupServer use the same handlers; if
    you need to handle some ports differently, such as returning
    different data for http and https, you'll need to create multiple
    [soup.server.Server]s, or else check the passed-in URI in the handler
    function.).
    
    #SoupServer will begin processing connections as soon as you return
    to (or start) the main loop for the current thread-default
    [glib.main_context.MainContext].
*/
class Server : gobject.object.ObjectWrap
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
    return cast(void function())soup_server_get_type != &gidSymbolNotFound ? soup_server_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Server self()
  {
    return this;
  }

  /**
      Get `serverHeader` property.
      Returns: Server header.
      
      If non-null, the value to use for the "Server" header on
      `class@ServerMessage`s processed by this server.
      
      The Server header is the server equivalent of the
      User-Agent header, and provides information about the
      server and its components. It contains a list of one or
      more product tokens, separated by whitespace, with the most
      significant product token coming first. The tokens must be
      brief, ASCII, and mostly alphanumeric (although "-", "_",
      and "." are also allowed), and may optionally include a "/"
      followed by a version string. You may also put comments,
      enclosed in parentheses, between or after the tokens.
      
      Some HTTP server implementations intentionally do not use
      version numbers in their Server header, so that
      installations running older versions of the server don't
      end up advertising their vulnerability to specific security
      holes.
      
      As with `property@Session:user_agent`, if you set a
      `property@Server:server-header` property that has trailing
      whitespace, #SoupServer will append its own product token (eg,
      `libsoup/2.3.2`) to the end of the header for you.
  */
  @property string serverHeader()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("server-header");
  }

  /**
      Set `serverHeader` property.
      Params:
        propval = Server header.
        
        If non-null, the value to use for the "Server" header on
        `class@ServerMessage`s processed by this server.
        
        The Server header is the server equivalent of the
        User-Agent header, and provides information about the
        server and its components. It contains a list of one or
        more product tokens, separated by whitespace, with the most
        significant product token coming first. The tokens must be
        brief, ASCII, and mostly alphanumeric (although "-", "_",
        and "." are also allowed), and may optionally include a "/"
        followed by a version string. You may also put comments,
        enclosed in parentheses, between or after the tokens.
        
        Some HTTP server implementations intentionally do not use
        version numbers in their Server header, so that
        installations running older versions of the server don't
        end up advertising their vulnerability to specific security
        holes.
        
        As with `property@Session:user_agent`, if you set a
        `property@Server:server-header` property that has trailing
        whitespace, #SoupServer will append its own product token (eg,
        `libsoup/2.3.2`) to the end of the header for you.
  */
  @property void serverHeader(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("server-header", propval);
  }

  /**
      Get `tlsAuthMode` property.
      Returns: A [gio.types.TlsAuthenticationMode] for SSL/TLS client authentication.
  */
  @property gio.types.TlsAuthenticationMode tlsAuthMode()
  {
    return getTlsAuthMode();
  }

  /**
      Set `tlsAuthMode` property.
      Params:
        propval = A [gio.types.TlsAuthenticationMode] for SSL/TLS client authentication.
  */
  @property void tlsAuthMode(gio.types.TlsAuthenticationMode propval)
  {
    return setTlsAuthMode(propval);
  }

  /**
      Get `tlsCertificate` property.
      Returns: A [gio.tls_certificate.TlsCertificate] that has a
      `property@Gio.TlsCertificate:private-key` set.
      
      If this is set, then the server will be able to speak
      https in addition to (or instead of) plain http.
  */
  @property gio.tls_certificate.TlsCertificate tlsCertificate()
  {
    return getTlsCertificate();
  }

  /**
      Set `tlsCertificate` property.
      Params:
        propval = A [gio.tls_certificate.TlsCertificate] that has a
        `property@Gio.TlsCertificate:private-key` set.
        
        If this is set, then the server will be able to speak
        https in addition to (or instead of) plain http.
  */
  @property void tlsCertificate(gio.tls_certificate.TlsCertificate propval)
  {
    return setTlsCertificate(propval);
  }

  /**
      Get `tlsDatabase` property.
      Returns: A [gio.tls_database.TlsDatabase] to use for validating SSL/TLS client
      certificates.
  */
  @property gio.tls_database.TlsDatabase tlsDatabase()
  {
    return getTlsDatabase();
  }

  /**
      Set `tlsDatabase` property.
      Params:
        propval = A [gio.tls_database.TlsDatabase] to use for validating SSL/TLS client
        certificates.
  */
  @property void tlsDatabase(gio.tls_database.TlsDatabase propval)
  {
    return setTlsDatabase(propval);
  }

  /**
      Adds a new client stream to the server.
  
      Params:
        stream = a #GIOStream
        localAddr = the local #GSocketAddress associated with the
            stream
        remoteAddr = the remote #GSocketAddress associated with the
            stream
      Returns: true on success, false if the stream could not be
          accepted or any other error occurred (in which case error will be
          set).
      Throws: [ErrorWrap]
  */
  bool acceptIostream(gio.iostream.IOStream stream, gio.socket_address.SocketAddress localAddr = null, gio.socket_address.SocketAddress remoteAddr = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)soup_server_accept_iostream(cast(SoupServer*)this._cPtr, stream ? cast(GIOStream*)stream._cPtr(No.Dup) : null, localAddr ? cast(GSocketAddress*)localAddr._cPtr(No.Dup) : null, remoteAddr ? cast(GSocketAddress*)remoteAddr._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Adds an authentication domain to server.
      
      Each auth domain will have the chance to require authentication for each
      request that comes in; normally auth domains will require authentication for
      requests on certain paths that they have been set up to watch, or that meet
      other criteria set by the caller. If an auth domain determines that a request
      requires authentication (and the request doesn't contain authentication),
      server will automatically reject the request with an appropriate status (401
      Unauthorized or 407 Proxy Authentication Required). If the request used the
      SoupServer:100-continue Expectation, server will reject it before the
      request body is sent.
  
      Params:
        authDomain = a #SoupAuthDomain
  */
  void addAuthDomain(soup.auth_domain.AuthDomain authDomain)
  {
    soup_server_add_auth_domain(cast(SoupServer*)this._cPtr, authDomain ? cast(SoupAuthDomain*)authDomain._cPtr(No.Dup) : null);
  }

  /**
      Adds an "early" handler to server for requests prefixed by path.
      
      Note that "normal" and "early" handlers are matched up together, so if you
      add a normal handler for "/foo" and an early handler for "/foo/bar", then a
      request to "/foo/bar" (or any path below it) will run only the early handler.
      (But if you add both handlers at the same path, then both will get run.)
      
      For requests under path (that have not already been assigned a
      status code by a `classAuthDomain` or a signal handler), callback
      will be invoked after receiving the request headers, but before
      receiving the request body; the message's method and
      request-headers properties will be set.
      
      Early handlers are generally used for processing requests with request bodies
      in a streaming fashion. If you determine that the request will contain a
      message body, normally you would call [soup.message_body.MessageBody.setAccumulate] on
      the message's request-body to turn off request-body accumulation, and connect
      to the message's `signalServerMessage::got-chunk` signal to process each
      chunk as it comes in.
      
      To complete the message processing after the full message body has
      been read, you can either also connect to `signalServerMessage::got-body`,
      or else you can register a non-early handler for path as well. As
      long as you have not set the status-code by the time
      `signalServerMessage::got-body` is emitted, the non-early handler will be
      run as well.
  
      Params:
        path = the toplevel path for the handler
        callback = callback to invoke for
            requests under path
  */
  void addEarlyHandler(string path, soup.types.ServerCallback callback)
  {
    extern(C) void _callbackCallback(SoupServer* server, SoupServerMessage* msg, const(char)* path, GHashTable* query, void* userData)
    {
      auto _dlg = cast(soup.types.ServerCallback*)userData;
      string _path = path.fromCString(No.Free);
      auto _query = gHashTableToD!(string, string, GidOwnership.None)(query);

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.server.Server)(cast(void*)server, No.Take), gobject.object.ObjectWrap._getDObject!(soup.server_message.ServerMessage)(cast(void*)msg, No.Take), _path, _query);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _path = path.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    soup_server_add_early_handler(cast(SoupServer*)this._cPtr, _path, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Adds a handler to server for requests prefixed by path.
      
      If path is null or "/", then this will be the default handler for all
      requests that don't have a more specific handler. (Note though that if you
      want to handle requests to the special "*" URI, you must explicitly register
      a handler for "*"; the default handler will not be used for that case.)
      
      For requests under path (that have not already been assigned a
      status code by a `classAuthDomain`, an early server handler, or a
      signal handler), callback will be invoked after receiving the
      request body; the `classServerMessage`'s method, request-headers,
      and request-body properties will be set.
      
      After determining what to do with the request, the callback must at a minimum
      call [soup.server_message.ServerMessage.setStatus] on the message to set the response
      status code. Additionally, it may set response headers and/or fill in the
      response body.
      
      If the callback cannot fully fill in the response before returning
      (eg, if it needs to wait for information from a database, or
      another network server), it should call [soup.server_message.ServerMessage.pause]
      to tell server to not send the response right away. When the
      response is ready, call [soup.server_message.ServerMessage.unpause] to cause it
      to be sent.
      
      To send the response body a bit at a time using "chunked" encoding, first
      call [soup.message_headers.MessageHeaders.setEncoding] to set [soup.types.Encoding.Chunked] on
      the response-headers. Then call [soup.message_body.MessageBody.append] (or
      [soup.message_body.MessageBody.appendBytes])) to append each chunk as it becomes ready,
      and [soup.server_message.ServerMessage.unpause] to make sure it's running. (The server
      will automatically pause the message if it is using chunked encoding but no
      more chunks are available.) When you are done, call
      [soup.message_body.MessageBody.complete] to indicate that no more chunks are coming.
  
      Params:
        path = the toplevel path for the handler
        callback = callback to invoke for
            requests under path
  */
  void addHandler(string path, soup.types.ServerCallback callback)
  {
    extern(C) void _callbackCallback(SoupServer* server, SoupServerMessage* msg, const(char)* path, GHashTable* query, void* userData)
    {
      auto _dlg = cast(soup.types.ServerCallback*)userData;
      string _path = path.fromCString(No.Free);
      auto _query = gHashTableToD!(string, string, GidOwnership.None)(query);

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.server.Server)(cast(void*)server, No.Take), gobject.object.ObjectWrap._getDObject!(soup.server_message.ServerMessage)(cast(void*)msg, No.Take), _path, _query);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _path = path.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    soup_server_add_handler(cast(SoupServer*)this._cPtr, _path, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Add support for a WebSocket extension of the given extension_type.
      
      When a WebSocket client requests an extension of extension_type,
      a new `classWebsocketExtension` of type extension_type will be created
      to handle the request.
      
      Note that `classWebsocketExtensionDeflate` is supported by default, use
      [soup.server.Server.removeWebsocketExtension] if you want to disable it.
  
      Params:
        extensionType = a #GType
  */
  void addWebsocketExtension(gobject.types.GType extensionType)
  {
    soup_server_add_websocket_extension(cast(SoupServer*)this._cPtr, extensionType);
  }

  /**
      Adds a WebSocket handler to server for requests prefixed by path.
      
      If path is null or "/", then this will be the default handler for all
      requests that don't have a more specific handler.
      
      When a path has a WebSocket handler registered, server will check
      incoming requests for WebSocket handshakes after all other handlers
      have run (unless some earlier handler has already set a status code
      on the message), and update the request's status, response headers,
      and response body accordingly.
      
      If origin is non-null, then only requests containing a matching
      "Origin" header will be accepted. If protocols is non-null, then
      only requests containing a compatible "Sec-WebSocket-Protocols"
      header will be accepted. More complicated requirements can be
      handled by adding a normal handler to path, and having it perform
      whatever checks are needed and
      setting a failure status code if the handshake should be rejected.
  
      Params:
        path = the toplevel path for the handler
        origin = the origin of the connection
        protocols = the protocols
            supported by this handler
        callback = callback to invoke for
            successful WebSocket requests under path
  */
  void addWebsocketHandler(string path, string origin, string[] protocols, soup.types.ServerWebsocketCallback callback)
  {
    extern(C) void _callbackCallback(SoupServer* server, SoupServerMessage* msg, const(char)* path, SoupWebsocketConnection* connection, void* userData)
    {
      auto _dlg = cast(soup.types.ServerWebsocketCallback*)userData;
      string _path = path.fromCString(No.Free);

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.server.Server)(cast(void*)server, No.Take), gobject.object.ObjectWrap._getDObject!(soup.server_message.ServerMessage)(cast(void*)msg, No.Take), _path, gobject.object.ObjectWrap._getDObject!(soup.websocket_connection.WebsocketConnection)(cast(void*)connection, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _path = path.toCString(No.Alloc);
    const(char)* _origin = origin.toCString(No.Alloc);
    char*[] _tmpprotocols;
    foreach (s; protocols)
      _tmpprotocols ~= s.toCString(No.Alloc);
    _tmpprotocols ~= null;
    char** _protocols = _tmpprotocols.ptr;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    soup_server_add_websocket_handler(cast(SoupServer*)this._cPtr, _path, _origin, _protocols, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Closes and frees server's listening sockets.
      
      Note that if there are currently requests in progress on server, that they
      will continue to be processed if server's [glib.main_context.MainContext] is still
      running.
      
      You can call [soup.server.Server.listen], etc, after calling this function
      if you want to start listening again.
  */
  void disconnect()
  {
    soup_server_disconnect(cast(SoupServer*)this._cPtr);
  }

  /**
      Gets server's list of listening sockets.
      
      You should treat these sockets as read-only; writing to or
      modifiying any of these sockets may cause server to malfunction.
      Returns: a
          list of listening sockets.
  */
  gio.socket.Socket[] getListeners()
  {
    GSList* _cretval;
    _cretval = soup_server_get_listeners(cast(SoupServer*)this._cPtr);
    auto _retval = gSListToD!(gio.socket.Socket, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Gets the server SSL/TLS client authentication mode.
      Returns: a #GTlsAuthenticationMode
  */
  gio.types.TlsAuthenticationMode getTlsAuthMode()
  {
    GTlsAuthenticationMode _cretval;
    _cretval = soup_server_get_tls_auth_mode(cast(SoupServer*)this._cPtr);
    gio.types.TlsAuthenticationMode _retval = cast(gio.types.TlsAuthenticationMode)_cretval;
    return _retval;
  }

  /**
      Gets the server SSL/TLS certificate.
      Returns: a #GTlsCertificate or null
  */
  gio.tls_certificate.TlsCertificate getTlsCertificate()
  {
    GTlsCertificate* _cretval;
    _cretval = soup_server_get_tls_certificate(cast(SoupServer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the server SSL/TLS database.
      Returns: a #GTlsDatabase
  */
  gio.tls_database.TlsDatabase getTlsDatabase()
  {
    GTlsDatabase* _cretval;
    _cretval = soup_server_get_tls_database(cast(SoupServer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_database.TlsDatabase)(cast(GTlsDatabase*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a list of URIs corresponding to the interfaces server is
      listening on.
      
      These will contain IP addresses, not hostnames, and will also indicate
      whether the given listener is http or https.
      
      Note that if you used [soup.server.Server.listenAll] the returned URIs will use
      the addresses `0.0.0.0` and `::`, rather than actually returning separate
      URIs for each interface on the system.
      Returns: a list of #GUris, which you
          must free when you are done with it.
  */
  glib.uri.Uri[] getUris()
  {
    GSList* _cretval;
    _cretval = soup_server_get_uris(cast(SoupServer*)this._cPtr);
    auto _retval = gSListToD!(glib.uri.Uri, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Checks whether server is capable of https.
      
      In order for a server to run https, you must call
      [soup.server.Server.setTlsCertificate], or set the
      `propertyServer:tls-certificate` property, to provide it with a
      certificate to use.
      
      If you are using the deprecated single-listener APIs, then a return value of
      true indicates that the #SoupServer serves https exclusively. If you are
      using [soup.server.Server.listen], etc, then a true return value merely indicates
      that the server is *able* to do https, regardless of whether it actually
      currently is or not. Use [soup.server.Server.getUris] to see if it currently has
      any https listeners.
      Returns: true if server is configured to serve https.
  */
  bool isHttps()
  {
    bool _retval;
    _retval = cast(bool)soup_server_is_https(cast(SoupServer*)this._cPtr);
    return _retval;
  }

  /**
      Attempts to set up server to listen for connections on address.
      
      If options includes [soup.types.ServerListenOptions.Https], and server has
      been configured for TLS, then server will listen for https
      connections on this port. Otherwise it will listen for plain http.
      
      You may call this method (along with the other "listen" methods)
      any number of times on a server, if you want to listen on multiple
      ports, or set up both http and https service.
      
      After calling this method, server will begin accepting and processing
      connections as soon as the appropriate [glib.main_context.MainContext] is run.
      
      Note that this API does not make use of dual IPv4/IPv6 sockets; if
      address is an IPv6 address, it will only accept IPv6 connections.
      You must configure IPv4 listening separately.
  
      Params:
        address = the address of the interface to listen on
        options = listening options for this server
      Returns: true on success, false if address could not be
          bound or any other error occurred (in which case error will be
          set).
      Throws: [ErrorWrap]
  */
  bool listen(gio.socket_address.SocketAddress address, soup.types.ServerListenOptions options)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)soup_server_listen(cast(SoupServer*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null, options, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Attempts to set up server to listen for connections on all interfaces
      on the system.
      
      That is, it listens on the addresses `0.0.0.0` and/or `::`, depending on
      whether options includes [soup.types.ServerListenOptions.Ipv4Only],
      [soup.types.ServerListenOptions.Ipv6Only], or neither.) If port is specified, server
      will listen on that port. If it is 0, server will find an unused port to
      listen on. (In that case, you can use [soup.server.Server.getUris] to find out
      what port it ended up choosing.
      
      See [soup.server.Server.listen] for more details.
  
      Params:
        port = the port to listen on, or 0
        options = listening options for this server
      Returns: true on success, false if port could not be bound
          or any other error occurred (in which case error will be set).
      Throws: [ErrorWrap]
  */
  bool listenAll(uint port, soup.types.ServerListenOptions options)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)soup_server_listen_all(cast(SoupServer*)this._cPtr, port, options, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Attempts to set up server to listen for connections on "localhost".
      
      That is, `127.0.0.1` and/or `::1`, depending on whether options includes
      [soup.types.ServerListenOptions.Ipv4Only], [soup.types.ServerListenOptions.Ipv6Only], or neither). If
      port is specified, server will listen on that port. If it is 0, server
      will find an unused port to listen on. (In that case, you can use
      [soup.server.Server.getUris] to find out what port it ended up choosing.
      
      See [soup.server.Server.listen] for more details.
  
      Params:
        port = the port to listen on, or 0
        options = listening options for this server
      Returns: true on success, false if port could not be bound
          or any other error occurred (in which case error will be set).
      Throws: [ErrorWrap]
  */
  bool listenLocal(uint port, soup.types.ServerListenOptions options)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)soup_server_listen_local(cast(SoupServer*)this._cPtr, port, options, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Attempts to set up server to listen for connections on socket.
      
      See [soup.server.Server.listen] for more details.
  
      Params:
        socket = a listening #GSocket
        options = listening options for this server
      Returns: true on success, false if an error occurred (in
          which case error will be set).
      Throws: [ErrorWrap]
  */
  bool listenSocket(gio.socket.Socket socket, soup.types.ServerListenOptions options)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)soup_server_listen_socket(cast(SoupServer*)this._cPtr, socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, options, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Pauses I/O on msg.
      
      This can be used when you need to return from the server handler without
      having the full response ready yet. Use [soup.server.Server.unpauseMessage] to
      resume I/O.
      
      This must only be called on a `classServerMessage` which was created by the
      #SoupServer and are currently doing I/O, such as those passed into a
      `callbackServerCallback` or emitted in a `signalServer::request-read`
      signal.
  
      Params:
        msg = a #SoupServerMessage associated with server.
  
      Deprecated: Use [soup.server_message.ServerMessage.pause] instead.
  */
  void pauseMessage(soup.server_message.ServerMessage msg)
  {
    soup_server_pause_message(cast(SoupServer*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null);
  }

  /**
      Removes auth_domain from server.
  
      Params:
        authDomain = a #SoupAuthDomain
  */
  void removeAuthDomain(soup.auth_domain.AuthDomain authDomain)
  {
    soup_server_remove_auth_domain(cast(SoupServer*)this._cPtr, authDomain ? cast(SoupAuthDomain*)authDomain._cPtr(No.Dup) : null);
  }

  /**
      Removes all handlers (early and normal) registered at path.
  
      Params:
        path = the toplevel path for the handler
  */
  void removeHandler(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    soup_server_remove_handler(cast(SoupServer*)this._cPtr, _path);
  }

  /**
      Removes support for WebSocket extension of type extension_type (or any subclass of
      extension_type) from server.
  
      Params:
        extensionType = a #GType
  */
  void removeWebsocketExtension(gobject.types.GType extensionType)
  {
    soup_server_remove_websocket_extension(cast(SoupServer*)this._cPtr, extensionType);
  }

  /**
      Sets server's #GTlsAuthenticationMode to use for SSL/TLS client authentication.
  
      Params:
        mode = a #GTlsAuthenticationMode
  */
  void setTlsAuthMode(gio.types.TlsAuthenticationMode mode)
  {
    soup_server_set_tls_auth_mode(cast(SoupServer*)this._cPtr, mode);
  }

  /**
      Sets server up to do https, using the given SSL/TLS certificate.
  
      Params:
        certificate = a #GTlsCertificate
  */
  void setTlsCertificate(gio.tls_certificate.TlsCertificate certificate)
  {
    soup_server_set_tls_certificate(cast(SoupServer*)this._cPtr, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null);
  }

  /**
      Sets server's #GTlsDatabase to use for validating SSL/TLS client certificates.
  
      Params:
        tlsDatabase = a #GTlsDatabase
  */
  void setTlsDatabase(gio.tls_database.TlsDatabase tlsDatabase)
  {
    soup_server_set_tls_database(cast(SoupServer*)this._cPtr, tlsDatabase ? cast(GTlsDatabase*)tlsDatabase._cPtr(No.Dup) : null);
  }

  /**
      Resumes I/O on msg.
      
      Use this to resume after calling [soup.server.Server.pauseMessage], or after
      adding a new chunk to a chunked response.
      
      I/O won't actually resume until you return to the main loop.
      
      This must only be called on a `classServerMessage` which was created by the
      #SoupServer and are currently doing I/O, such as those passed into a
      `callbackServerCallback` or emitted in a `signalServer::request-read`
      signal.
  
      Params:
        msg = a #SoupServerMessage associated with server.
  
      Deprecated: Use [soup.server_message.ServerMessage.unpause] instead.
  */
  void unpauseMessage(soup.server_message.ServerMessage msg)
  {
    soup_server_unpause_message(cast(SoupServer*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null);
  }

  /**
      Connect to `RequestAborted` signal.
  
      Emitted when processing has failed for a message.
      
      This could mean either that it could not be read (if
      `signalServer::request-read` has not been emitted for it yet), or that
      the response could not be written back (if `signalServer::request-read`
      has been emitted but `signalServer::request-finished` has not been).
      
      message is in an undefined state when this signal is
      emitted; the signal exists primarily to allow the server to
      free any state that it may have allocated in
      `signalServer::request-started`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(soup.server_message.ServerMessage message, soup.server.Server server))
  
          `message` the message (optional)
  
          `server` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRequestAborted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : soup.server_message.ServerMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : soup.server.Server)))
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
    return connectSignalClosure("request-aborted", closure, after);
  }

  /**
      Connect to `RequestFinished` signal.
  
      Emitted when the server has finished writing a response to
      a request.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(soup.server_message.ServerMessage message, soup.server.Server server))
  
          `message` the message (optional)
  
          `server` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRequestFinished(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : soup.server_message.ServerMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : soup.server.Server)))
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
    return connectSignalClosure("request-finished", closure, after);
  }

  /**
      Connect to `RequestRead` signal.
  
      Emitted when the server has successfully read a request.
      
      message will have all of its request-side information
      filled in, and if the message was authenticated, client
      will have information about that. This signal is emitted
      before any (non-early) handlers are called for the message,
      and if it sets the message's #status_code, then normal
      handler processing will be skipped.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(soup.server_message.ServerMessage message, soup.server.Server server))
  
          `message` the message (optional)
  
          `server` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRequestRead(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : soup.server_message.ServerMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : soup.server.Server)))
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
    return connectSignalClosure("request-read", closure, after);
  }

  /**
      Connect to `RequestStarted` signal.
  
      Emitted when the server has started reading a new request.
      
      message will be completely blank; not even the
      Request-Line will have been read yet. About the only thing
      you can usefully do with it is connect to its signals.
      
      If the request is read successfully, this will eventually
      be followed by a `signalServer::request_read signal`. If a
      response is then sent, the request processing will end with
      a `signalServer::request-finished` signal. If a network error
      occurs, the processing will instead end with
      `signalServer::request-aborted`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(soup.server_message.ServerMessage message, soup.server.Server server))
  
          `message` the new message (optional)
  
          `server` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRequestStarted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : soup.server_message.ServerMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : soup.server.Server)))
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
    return connectSignalClosure("request-started", closure, after);
  }
}
