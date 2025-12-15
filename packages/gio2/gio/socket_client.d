/// Module for [SocketClient] class
module gio.socket_client;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.iostream;
import gio.proxy_resolver;
import gio.socket_address;
import gio.socket_connectable;
import gio.socket_connection;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
    [gio.socket_client.SocketClient] is a lightweight high-level utility class for connecting to
    a network host using a connection oriented socket type.
    
    You create a [gio.socket_client.SocketClient] object, set any options you want, and then
    call a sync or async connect operation, which returns a
    [gio.socket_connection.SocketConnection] subclass on success.
    
    The type of the [gio.socket_connection.SocketConnection] object returned depends on the
    type of the underlying socket that is in use. For instance, for a TCP/IP
    connection it will be a [gio.tcp_connection.TcpConnection].
    
    As [gio.socket_client.SocketClient] is a lightweight object, you don't need to cache it. You
    can just create a new one any time you need one.
*/
class SocketClient : gobject.object.ObjectWrap
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
    return cast(void function())g_socket_client_get_type != &gidSymbolNotFound ? g_socket_client_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketClient self()
  {
    return this;
  }

  /**
      Get `enableProxy` property.
      Returns: Enable proxy support.
  */
  @property bool enableProxy()
  {
    return getEnableProxy();
  }

  /**
      Set `enableProxy` property.
      Params:
        propval = Enable proxy support.
  */
  @property void enableProxy(bool propval)
  {
    return setEnableProxy(propval);
  }

  /**
      Get `family` property.
      Returns: The address family to use for socket construction.
  */
  @property gio.types.SocketFamily family()
  {
    return getFamily();
  }

  /**
      Set `family` property.
      Params:
        propval = The address family to use for socket construction.
  */
  @property void family(gio.types.SocketFamily propval)
  {
    return setFamily(propval);
  }

  /**
      Get `localAddress` property.
      Returns: The local address constructed sockets will be bound to.
  */
  @property gio.socket_address.SocketAddress localAddress()
  {
    return getLocalAddress();
  }

  /**
      Set `localAddress` property.
      Params:
        propval = The local address constructed sockets will be bound to.
  */
  @property void localAddress(gio.socket_address.SocketAddress propval)
  {
    return setLocalAddress(propval);
  }

  /**
      Get `protocol` property.
      Returns: The protocol to use for socket construction, or `0` for default.
  */
  @property gio.types.SocketProtocol protocol()
  {
    return getProtocol();
  }

  /**
      Set `protocol` property.
      Params:
        propval = The protocol to use for socket construction, or `0` for default.
  */
  @property void protocol(gio.types.SocketProtocol propval)
  {
    return setProtocol(propval);
  }

  /**
      Get `proxyResolver` property.
      Returns: The proxy resolver to use
  */
  @property gio.proxy_resolver.ProxyResolver proxyResolver()
  {
    return getProxyResolver();
  }

  /**
      Set `proxyResolver` property.
      Params:
        propval = The proxy resolver to use
  */
  @property void proxyResolver(gio.proxy_resolver.ProxyResolver propval)
  {
    return setProxyResolver(propval);
  }

  /**
      Get `timeout` property.
      Returns: The I/O timeout for sockets, in seconds, or `0` for none.
  */
  @property uint timeout()
  {
    return getTimeout();
  }

  /**
      Set `timeout` property.
      Params:
        propval = The I/O timeout for sockets, in seconds, or `0` for none.
  */
  @property void timeout(uint propval)
  {
    return setTimeout(propval);
  }

  /**
      Get `tls` property.
      Returns: Whether to create TLS connections.
  */
  @property bool tls()
  {
    return getTls();
  }

  /**
      Set `tls` property.
      Params:
        propval = Whether to create TLS connections.
  */
  @property void tls(bool propval)
  {
    return setTls(propval);
  }

  /**
      Get `tlsValidationFlags` property.
      Returns: The TLS validation flags used when creating TLS connections. The
      default value is [gio.types.TlsCertificateFlags.ValidateAll].
      
      GLib guarantees that if certificate verification fails, at least one
      flag will be set, but it does not guarantee that all possible flags
      will be set. Accordingly, you may not safely decide to ignore any
      particular type of error. For example, it would be incorrect to mask
      [gio.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
      because this could potentially be the only error flag set even if
      other problems exist with the certificate. Therefore, there is no
      safe way to use this property. This is not a horrible problem,
      though, because you should not be attempting to ignore validation
      errors anyway. If you really must ignore TLS certificate errors,
      connect to the #GSocketClient::event signal, wait for it to be
      emitted with [gio.types.SocketClientEvent.TlsHandshaking], and use that to
      connect to #GTlsConnection::accept-certificate.
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  @property gio.types.TlsCertificateFlags tlsValidationFlags()
  {
    return getTlsValidationFlags();
  }

  /**
      Set `tlsValidationFlags` property.
      Params:
        propval = The TLS validation flags used when creating TLS connections. The
        default value is [gio.types.TlsCertificateFlags.ValidateAll].
        
        GLib guarantees that if certificate verification fails, at least one
        flag will be set, but it does not guarantee that all possible flags
        will be set. Accordingly, you may not safely decide to ignore any
        particular type of error. For example, it would be incorrect to mask
        [gio.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
        because this could potentially be the only error flag set even if
        other problems exist with the certificate. Therefore, there is no
        safe way to use this property. This is not a horrible problem,
        though, because you should not be attempting to ignore validation
        errors anyway. If you really must ignore TLS certificate errors,
        connect to the #GSocketClient::event signal, wait for it to be
        emitted with [gio.types.SocketClientEvent.TlsHandshaking], and use that to
        connect to #GTlsConnection::accept-certificate.
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  @property void tlsValidationFlags(gio.types.TlsCertificateFlags propval)
  {
    return setTlsValidationFlags(propval);
  }

  /**
      Get `type` property.
      Returns: The type to use for socket construction.
  */
  @property gio.types.SocketType type()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.types.SocketType)("type");
  }

  /**
      Set `type` property.
      Params:
        propval = The type to use for socket construction.
  */
  @property void type(gio.types.SocketType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.types.SocketType)("type", propval);
  }

  /**
      Creates a new #GSocketClient with the default options.
      Returns: a #GSocketClient.
            Free the returned object with [gobject.object.ObjectWrap.unref].
  */
  this()
  {
    GSocketClient* _cretval;
    _cretval = g_socket_client_new();
    this(_cretval, Yes.Take);
  }

  /**
      Enable proxy protocols to be handled by the application. When the
      indicated proxy protocol is returned by the #GProxyResolver,
      #GSocketClient will consider this protocol as supported but will
      not try to find a #GProxy instance to handle handshaking. The
      application must check for this case by calling
      [gio.socket_connection.SocketConnection.getRemoteAddress] on the returned
      #GSocketConnection, and seeing if it's a #GProxyAddress of the
      appropriate type, to determine whether or not it needs to handle
      the proxy handshaking itself.
      
      This should be used for proxy protocols that are dialects of
      another protocol such as HTTP proxy. It also allows cohabitation of
      proxy protocols that are reused between protocols. A good example
      is HTTP. It can be used to proxy HTTP, FTP and Gopher and can also
      be use as generic socket proxy through the HTTP CONNECT method.
      
      When the proxy is detected as being an application proxy, TLS handshake
      will be skipped. This is required to let the application do the proxy
      specific handshake.
  
      Params:
        protocol = The proxy protocol
  */
  void addApplicationProxy(string protocol)
  {
    const(char)* _protocol = protocol.toCString(No.Alloc);
    g_socket_client_add_application_proxy(cast(GSocketClient*)this._cPtr, _protocol);
  }

  /**
      Tries to resolve the connectable and make a network connection to it.
      
      Upon a successful connection, a new #GSocketConnection is constructed
      and returned.  The caller owns this new object and must drop their
      reference to it when finished with it.
      
      The type of the #GSocketConnection object returned depends on the type of
      the underlying socket that is used. For instance, for a TCP/IP connection
      it will be a #GTcpConnection.
      
      The socket created will be the same family as the address that the
      connectable resolves to, unless family is set with [gio.socket_client.SocketClient.setFamily]
      or indirectly via [gio.socket_client.SocketClient.setLocalAddress]. The socket type
      defaults to [gio.types.SocketType.Stream] but can be set with
      [gio.socket_client.SocketClient.setSocketType].
      
      If a local address is specified with [gio.socket_client.SocketClient.setLocalAddress] the
      socket will be bound to this address before connecting.
  
      Params:
        connectable = a #GSocketConnectable specifying the remote address.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket_connection.SocketConnection connect(gio.socket_connectable.SocketConnectable connectable, gio.cancellable.Cancellable cancellable = null)
  {
    GSocketConnection* _cretval;
    GError *_err;
    _cretval = g_socket_client_connect(cast(GSocketClient*)this._cPtr, connectable ? cast(GSocketConnectable*)(cast(gobject.object.ObjectWrap)connectable)._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is the asynchronous version of [gio.socket_client.SocketClient.connect].
      
      You may wish to prefer the asynchronous version even in synchronous
      command line programs because, since 2.60, it implements
      [RFC 8305](https://tools.ietf.org/html/rfc8305) "Happy Eyeballs"
      recommendations to work around long connection timeouts in networks
      where IPv6 is broken by performing an IPv4 connection simultaneously
      without waiting for IPv6 to time out, which is not supported by the
      synchronous call. (This is not an API guarantee, and may change in
      the future.)
      
      When the operation is finished callback will be
      called. You can then call [gio.socket_client.SocketClient.connectFinish] to get
      the result of the operation.
  
      Params:
        connectable = a #GSocketConnectable specifying the remote address.
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback
  */
  void connectAsync(gio.socket_connectable.SocketConnectable connectable, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_socket_client_connect_async(cast(GSocketClient*)this._cPtr, connectable ? cast(GSocketConnectable*)(cast(gobject.object.ObjectWrap)connectable)._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async connect operation. See [gio.socket_client.SocketClient.connectAsync]
  
      Params:
        result = a #GAsyncResult.
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket_connection.SocketConnection connectFinish(gio.async_result.AsyncResult result)
  {
    GSocketConnection* _cretval;
    GError *_err;
    _cretval = g_socket_client_connect_finish(cast(GSocketClient*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is a helper function for [gio.socket_client.SocketClient.connect].
      
      Attempts to create a TCP connection to the named host.
      
      host_and_port may be in any of a number of recognized formats; an IPv6
      address, an IPv4 address, or a domain name (in which case a DNS
      lookup is performed).  Quoting with [] is supported for all address
      types.  A port override may be specified in the usual way with a
      colon.  Ports may be given as decimal numbers or symbolic names (in
      which case an /etc/services lookup is performed).
      
      If no port override is given in host_and_port then default_port will be
      used as the port number to connect to.
      
      In general, host_and_port is expected to be provided by the user (allowing
      them to give the hostname, and a port override if necessary) and
      default_port is expected to be provided by the application.
      
      In the case that an IP address is given, a single connection
      attempt is made.  In the case that a name is given, multiple
      connection attempts may be made, in turn and according to the
      number of address records in DNS, until a connection succeeds.
      
      Upon a successful connection, a new #GSocketConnection is constructed
      and returned.  The caller owns this new object and must drop their
      reference to it when finished with it.
      
      In the event of any failure (DNS error, service not found, no hosts
      connectable) null is returned and error (if non-null) is set
      accordingly.
  
      Params:
        hostAndPort = the name and optionally port of the host to connect to
        defaultPort = the default port to connect to
        cancellable = a #GCancellable, or null
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket_connection.SocketConnection connectToHost(string hostAndPort, ushort defaultPort, gio.cancellable.Cancellable cancellable = null)
  {
    GSocketConnection* _cretval;
    const(char)* _hostAndPort = hostAndPort.toCString(No.Alloc);
    GError *_err;
    _cretval = g_socket_client_connect_to_host(cast(GSocketClient*)this._cPtr, _hostAndPort, defaultPort, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is the asynchronous version of [gio.socket_client.SocketClient.connectToHost].
      
      When the operation is finished callback will be
      called. You can then call [gio.socket_client.SocketClient.connectToHostFinish] to get
      the result of the operation.
  
      Params:
        hostAndPort = the name and optionally the port of the host to connect to
        defaultPort = the default port to connect to
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback
  */
  void connectToHostAsync(string hostAndPort, ushort defaultPort, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _hostAndPort = hostAndPort.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_socket_client_connect_to_host_async(cast(GSocketClient*)this._cPtr, _hostAndPort, defaultPort, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async connect operation. See [gio.socket_client.SocketClient.connectToHostAsync]
  
      Params:
        result = a #GAsyncResult.
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket_connection.SocketConnection connectToHostFinish(gio.async_result.AsyncResult result)
  {
    GSocketConnection* _cretval;
    GError *_err;
    _cretval = g_socket_client_connect_to_host_finish(cast(GSocketClient*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attempts to create a TCP connection to a service.
      
      This call looks up the SRV record for service at domain for the
      "tcp" protocol.  It then attempts to connect, in turn, to each of
      the hosts providing the service until either a connection succeeds
      or there are no hosts remaining.
      
      Upon a successful connection, a new #GSocketConnection is constructed
      and returned.  The caller owns this new object and must drop their
      reference to it when finished with it.
      
      In the event of any failure (DNS error, service not found, no hosts
      connectable) null is returned and error (if non-null) is set
      accordingly.
  
      Params:
        domain = a domain name
        service = the name of the service to connect to
        cancellable = a #GCancellable, or null
      Returns: a #GSocketConnection if successful, or null on error
      Throws: [ErrorWrap]
  */
  gio.socket_connection.SocketConnection connectToService(string domain, string service, gio.cancellable.Cancellable cancellable = null)
  {
    GSocketConnection* _cretval;
    const(char)* _domain = domain.toCString(No.Alloc);
    const(char)* _service = service.toCString(No.Alloc);
    GError *_err;
    _cretval = g_socket_client_connect_to_service(cast(GSocketClient*)this._cPtr, _domain, _service, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is the asynchronous version of
      [gio.socket_client.SocketClient.connectToService].
  
      Params:
        domain = a domain name
        service = the name of the service to connect to
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback
  */
  void connectToServiceAsync(string domain, string service, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _domain = domain.toCString(No.Alloc);
    const(char)* _service = service.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_socket_client_connect_to_service_async(cast(GSocketClient*)this._cPtr, _domain, _service, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async connect operation. See [gio.socket_client.SocketClient.connectToServiceAsync]
  
      Params:
        result = a #GAsyncResult.
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket_connection.SocketConnection connectToServiceFinish(gio.async_result.AsyncResult result)
  {
    GSocketConnection* _cretval;
    GError *_err;
    _cretval = g_socket_client_connect_to_service_finish(cast(GSocketClient*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is a helper function for [gio.socket_client.SocketClient.connect].
      
      Attempts to create a TCP connection with a network URI.
      
      uri may be any valid URI containing an "authority" (hostname/port)
      component. If a port is not specified in the URI, default_port
      will be used. TLS will be negotiated if #GSocketClient:tls is true.
      (#GSocketClient does not know to automatically assume TLS for
      certain URI schemes.)
      
      Using this rather than [gio.socket_client.SocketClient.connect] or
      [gio.socket_client.SocketClient.connectToHost] allows #GSocketClient to
      determine when to use application-specific proxy protocols.
      
      Upon a successful connection, a new #GSocketConnection is constructed
      and returned.  The caller owns this new object and must drop their
      reference to it when finished with it.
      
      In the event of any failure (DNS error, service not found, no hosts
      connectable) null is returned and error (if non-null) is set
      accordingly.
  
      Params:
        uri = A network URI
        defaultPort = the default port to connect to
        cancellable = a #GCancellable, or null
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket_connection.SocketConnection connectToUri(string uri, ushort defaultPort, gio.cancellable.Cancellable cancellable = null)
  {
    GSocketConnection* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_socket_client_connect_to_uri(cast(GSocketClient*)this._cPtr, _uri, defaultPort, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is the asynchronous version of [gio.socket_client.SocketClient.connectToUri].
      
      When the operation is finished callback will be
      called. You can then call [gio.socket_client.SocketClient.connectToUriFinish] to get
      the result of the operation.
  
      Params:
        uri = a network uri
        defaultPort = the default port to connect to
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback
  */
  void connectToUriAsync(string uri, ushort defaultPort, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
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
    g_socket_client_connect_to_uri_async(cast(GSocketClient*)this._cPtr, _uri, defaultPort, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async connect operation. See [gio.socket_client.SocketClient.connectToUriAsync]
  
      Params:
        result = a #GAsyncResult.
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket_connection.SocketConnection connectToUriFinish(gio.async_result.AsyncResult result)
  {
    GSocketConnection* _cretval;
    GError *_err;
    _cretval = g_socket_client_connect_to_uri_finish(cast(GSocketClient*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the proxy enable state; see [gio.socket_client.SocketClient.setEnableProxy]
      Returns: whether proxying is enabled
  */
  bool getEnableProxy()
  {
    bool _retval;
    _retval = cast(bool)g_socket_client_get_enable_proxy(cast(GSocketClient*)this._cPtr);
    return _retval;
  }

  /**
      Gets the socket family of the socket client.
      
      See [gio.socket_client.SocketClient.setFamily] for details.
      Returns: a #GSocketFamily
  */
  gio.types.SocketFamily getFamily()
  {
    GSocketFamily _cretval;
    _cretval = g_socket_client_get_family(cast(GSocketClient*)this._cPtr);
    gio.types.SocketFamily _retval = cast(gio.types.SocketFamily)_cretval;
    return _retval;
  }

  /**
      Gets the local address of the socket client.
      
      See [gio.socket_client.SocketClient.setLocalAddress] for details.
      Returns: a #GSocketAddress or null. Do not free.
  */
  gio.socket_address.SocketAddress getLocalAddress()
  {
    GSocketAddress* _cretval;
    _cretval = g_socket_client_get_local_address(cast(GSocketClient*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the protocol name type of the socket client.
      
      See [gio.socket_client.SocketClient.setProtocol] for details.
      Returns: a #GSocketProtocol
  */
  gio.types.SocketProtocol getProtocol()
  {
    GSocketProtocol _cretval;
    _cretval = g_socket_client_get_protocol(cast(GSocketClient*)this._cPtr);
    gio.types.SocketProtocol _retval = cast(gio.types.SocketProtocol)_cretval;
    return _retval;
  }

  /**
      Gets the #GProxyResolver being used by client. Normally, this will
      be the resolver returned by [gio.proxy_resolver.ProxyResolver.getDefault], but you
      can override it with [gio.socket_client.SocketClient.setProxyResolver].
      Returns: The #GProxyResolver being used by
          client.
  */
  gio.proxy_resolver.ProxyResolver getProxyResolver()
  {
    GProxyResolver* _cretval;
    _cretval = g_socket_client_get_proxy_resolver(cast(GSocketClient*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.proxy_resolver.ProxyResolver)(cast(GProxyResolver*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the socket type of the socket client.
      
      See [gio.socket_client.SocketClient.setSocketType] for details.
      Returns: a #GSocketFamily
  */
  gio.types.SocketType getSocketType()
  {
    GSocketType _cretval;
    _cretval = g_socket_client_get_socket_type(cast(GSocketClient*)this._cPtr);
    gio.types.SocketType _retval = cast(gio.types.SocketType)_cretval;
    return _retval;
  }

  /**
      Gets the I/O timeout time for sockets created by client.
      
      See [gio.socket_client.SocketClient.setTimeout] for details.
      Returns: the timeout in seconds
  */
  uint getTimeout()
  {
    uint _retval;
    _retval = g_socket_client_get_timeout(cast(GSocketClient*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether client creates TLS connections. See
      [gio.socket_client.SocketClient.setTls] for details.
      Returns: whether client uses TLS
  */
  bool getTls()
  {
    bool _retval;
    _retval = cast(bool)g_socket_client_get_tls(cast(GSocketClient*)this._cPtr);
    return _retval;
  }

  /**
      Gets the TLS validation flags used creating TLS connections via
      client.
      
      This function does not work as originally designed and is impossible
      to use correctly. See #GSocketClient:tls-validation-flags for more
      information.
      Returns: the TLS validation flags
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  gio.types.TlsCertificateFlags getTlsValidationFlags()
  {
    GTlsCertificateFlags _cretval;
    _cretval = g_socket_client_get_tls_validation_flags(cast(GSocketClient*)this._cPtr);
    gio.types.TlsCertificateFlags _retval = cast(gio.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
      Sets whether or not client attempts to make connections via a
      proxy server. When enabled (the default), #GSocketClient will use a
      #GProxyResolver to determine if a proxy protocol such as SOCKS is
      needed, and automatically do the necessary proxy negotiation.
      
      See also [gio.socket_client.SocketClient.setProxyResolver].
  
      Params:
        enable = whether to enable proxies
  */
  void setEnableProxy(bool enable)
  {
    g_socket_client_set_enable_proxy(cast(GSocketClient*)this._cPtr, enable);
  }

  /**
      Sets the socket family of the socket client.
      If this is set to something other than [gio.types.SocketFamily.Invalid]
      then the sockets created by this object will be of the specified
      family.
      
      This might be useful for instance if you want to force the local
      connection to be an ipv4 socket, even though the address might
      be an ipv6 mapped to ipv4 address.
  
      Params:
        family = a #GSocketFamily
  */
  void setFamily(gio.types.SocketFamily family)
  {
    g_socket_client_set_family(cast(GSocketClient*)this._cPtr, family);
  }

  /**
      Sets the local address of the socket client.
      The sockets created by this object will bound to the
      specified address (if not null) before connecting.
      
      This is useful if you want to ensure that the local
      side of the connection is on a specific port, or on
      a specific interface.
  
      Params:
        address = a #GSocketAddress, or null
  */
  void setLocalAddress(gio.socket_address.SocketAddress address = null)
  {
    g_socket_client_set_local_address(cast(GSocketClient*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null);
  }

  /**
      Sets the protocol of the socket client.
      The sockets created by this object will use of the specified
      protocol.
      
      If protocol is [gio.types.SocketProtocol.Default] that means to use the default
      protocol for the socket family and type.
  
      Params:
        protocol = a #GSocketProtocol
  */
  void setProtocol(gio.types.SocketProtocol protocol)
  {
    g_socket_client_set_protocol(cast(GSocketClient*)this._cPtr, protocol);
  }

  /**
      Overrides the #GProxyResolver used by client. You can call this if
      you want to use specific proxies, rather than using the system
      default proxy settings.
      
      Note that whether or not the proxy resolver is actually used
      depends on the setting of #GSocketClient:enable-proxy, which is not
      changed by this function (but which is true by default)
  
      Params:
        proxyResolver = a #GProxyResolver, or null for the
            default.
  */
  void setProxyResolver(gio.proxy_resolver.ProxyResolver proxyResolver = null)
  {
    g_socket_client_set_proxy_resolver(cast(GSocketClient*)this._cPtr, proxyResolver ? cast(GProxyResolver*)(cast(gobject.object.ObjectWrap)proxyResolver)._cPtr(No.Dup) : null);
  }

  /**
      Sets the socket type of the socket client.
      The sockets created by this object will be of the specified
      type.
      
      It doesn't make sense to specify a type of [gio.types.SocketType.Datagram],
      as GSocketClient is used for connection oriented services.
  
      Params:
        type = a #GSocketType
  */
  void setSocketType(gio.types.SocketType type)
  {
    g_socket_client_set_socket_type(cast(GSocketClient*)this._cPtr, type);
  }

  /**
      Sets the I/O timeout for sockets created by client. timeout is a
      time in seconds, or 0 for no timeout (the default).
      
      The timeout value affects the initial connection attempt as well,
      so setting this may cause calls to [gio.socket_client.SocketClient.connect], etc,
      to fail with [gio.types.IOErrorEnum.TimedOut].
  
      Params:
        timeout = the timeout
  */
  void setTimeout(uint timeout)
  {
    g_socket_client_set_timeout(cast(GSocketClient*)this._cPtr, timeout);
  }

  /**
      Sets whether client creates TLS (aka SSL) connections. If tls is
      true, client will wrap its connections in a #GTlsClientConnection
      and perform a TLS handshake when connecting.
      
      Note that since #GSocketClient must return a #GSocketConnection,
      but #GTlsClientConnection is not a #GSocketConnection, this
      actually wraps the resulting #GTlsClientConnection in a
      #GTcpWrapperConnection when returning it. You can use
      [gio.tcp_wrapper_connection.TcpWrapperConnection.getBaseIoStream] on the return value
      to extract the #GTlsClientConnection.
      
      If you need to modify the behavior of the TLS handshake (eg, by
      setting a client-side certificate to use, or connecting to the
      #GTlsConnection::accept-certificate signal), you can connect to
      client's #GSocketClient::event signal and wait for it to be
      emitted with [gio.types.SocketClientEvent.TlsHandshaking], which will give you
      a chance to see the #GTlsClientConnection before the handshake
      starts.
  
      Params:
        tls = whether to use TLS
  */
  void setTls(bool tls)
  {
    g_socket_client_set_tls(cast(GSocketClient*)this._cPtr, tls);
  }

  /**
      Sets the TLS validation flags used when creating TLS connections
      via client. The default value is [gio.types.TlsCertificateFlags.ValidateAll].
      
      This function does not work as originally designed and is impossible
      to use correctly. See #GSocketClient:tls-validation-flags for more
      information.
  
      Params:
        flags = the validation flags
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  void setTlsValidationFlags(gio.types.TlsCertificateFlags flags)
  {
    g_socket_client_set_tls_validation_flags(cast(GSocketClient*)this._cPtr, flags);
  }

  /**
      Connect to `Event` signal.
  
      Emitted when client's activity on connectable changes state.
      Among other things, this can be used to provide progress
      information about a network connection in the UI. The meanings of
      the different event values are as follows:
      
      $(LIST
        * [gio.types.SocketClientEvent.Resolving]: client is about to look up connectable
          in DNS. connection will be null.
        
        * [gio.types.SocketClientEvent.Resolved]:  client has successfully resolved
          connectable in DNS. connection will be null.
        
        * [gio.types.SocketClientEvent.Connecting]: client is about to make a connection
          to a remote host; either a proxy server or the destination server
          itself. connection is the #GSocketConnection, which is not yet
          connected.  Since GLib 2.40, you can access the remote
          address via [gio.socket_connection.SocketConnection.getRemoteAddress].
        
        * [gio.types.SocketClientEvent.Connected]: client has successfully connected
          to a remote host. connection is the connected #GSocketConnection.
        
        * [gio.types.SocketClientEvent.ProxyNegotiating]: client is about to negotiate
          with a proxy to get it to connect to connectable. connection is
          the #GSocketConnection to the proxy server.
        
        * [gio.types.SocketClientEvent.ProxyNegotiated]: client has negotiated a
          connection to connectable through a proxy server. connection is
          the stream returned from [gio.proxy.Proxy.connect], which may or may not
          be a #GSocketConnection.
        
        * [gio.types.SocketClientEvent.TlsHandshaking]: client is about to begin a TLS
          handshake. connection is a #GTlsClientConnection.
        
        * [gio.types.SocketClientEvent.TlsHandshaked]: client has successfully completed
          the TLS handshake. connection is a #GTlsClientConnection.
        
        * [gio.types.SocketClientEvent.Complete]: client has either successfully connected
          to connectable (in which case connection is the #GSocketConnection
          that it will be returning to the caller) or has failed (in which
          case connection is null and the client is about to return an error).
      )
        
      Each event except [gio.types.SocketClientEvent.Complete] may be emitted
      multiple times (or not at all) for a given connectable (in
      particular, if client ends up attempting to connect to more than
      one address). However, if client emits the #GSocketClient::event
      signal at all for a given connectable, then it will always emit
      it with [gio.types.SocketClientEvent.Complete] when it is done.
      
      Note that there may be additional #GSocketClientEvent values in
      the future; unrecognized event values should be ignored.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.types.SocketClientEvent event, gio.socket_connectable.SocketConnectable connectable, gio.iostream.IOStream connection, gio.socket_client.SocketClient socketClient))
  
          `event` the event that is occurring (optional)
  
          `connectable` the #GSocketConnectable that event is occurring on (optional)
  
          `connection` the current representation of the connection (optional)
  
          `socketClient` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gio.types.SocketClientEvent)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.socket_connectable.SocketConnectable)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.iostream.IOStream)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gio.socket_client.SocketClient)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event", closure, after);
  }
}
