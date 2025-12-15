/// Module for [Socket] class
module gio.socket;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.credentials;
import gio.datagram_based;
import gio.datagram_based_mixin;
import gio.inet_address;
import gio.initable;
import gio.initable_mixin;
import gio.socket_address;
import gio.socket_connection;
import gio.socket_control_message;
import gio.types;
import glib.bytes;
import glib.error;
import glib.types;
import gobject.object;

/**
    A [gio.socket.Socket] is a low-level networking primitive. It is a more or less
    direct mapping of the BSD socket API in a portable GObject based API.
    It supports both the UNIX socket implementations and winsock2 on Windows.
    
    [gio.socket.Socket] is the platform independent base upon which the higher level
    network primitives are based. Applications are not typically meant to
    use it directly, but rather through classes like [gio.socket_client.SocketClient],
    [gio.socket_service.SocketService] and [gio.socket_connection.SocketConnection]. However there may
    be cases where direct use of [gio.socket.Socket] is useful.
    
    [gio.socket.Socket] implements the [gio.initable.Initable] interface, so if it is manually
    constructed by e.g. [gobject.object.ObjectWrap.new_] you must call
    [gio.initable.Initable.init_] and check the results before using the object.
    This is done automatically in [gio.socket.Socket.new_] and
    [gio.socket.Socket.newFromFd], so these functions can return `NULL`.
    
    Sockets operate in two general modes, blocking or non-blocking. When
    in blocking mode all operations (which don’t take an explicit blocking
    parameter) block until the requested operation
    is finished or there is an error. In non-blocking mode all calls that
    would block return immediately with a [gio.types.IOErrorEnum.WouldBlock] error.
    To know when a call would successfully run you can call
    [gio.socket.Socket.conditionCheck], or [gio.socket.Socket.conditionWait].
    You can also use [gio.socket.Socket.createSource] and attach it to a
    [glib.main_context.MainContext] to get callbacks when I/O is possible.
    Note that all sockets are always set to non blocking mode in the system, and
    blocking mode is emulated in [gio.socket.Socket].
    
    When working in non-blocking mode applications should always be able to
    handle getting a [gio.types.IOErrorEnum.WouldBlock] error even when some other
    function said that I/O was possible. This can easily happen in case
    of a race condition in the application, but it can also happen for other
    reasons. For instance, on Windows a socket is always seen as writable
    until a write returns [gio.types.IOErrorEnum.WouldBlock].
    
    [gio.socket.Socket]s can be either connection oriented or datagram based.
    For connection oriented types you must first establish a connection by
    either connecting to an address or accepting a connection from another
    address. For connectionless socket types the target/source address is
    specified or received in each I/O operation.
    
    All socket file descriptors are set to be close-on-exec.
    
    Note that creating a [gio.socket.Socket] causes the signal `SIGPIPE` to be
    ignored for the remainder of the program. If you are writing a
    command-line utility that uses [gio.socket.Socket], you may need to take into
    account the fact that your program will not automatically be killed
    if it tries to write to `stdout` after it has been closed.
    
    Like most other APIs in GLib, [gio.socket.Socket] is not inherently thread safe. To use
    a [gio.socket.Socket] concurrently from multiple threads, you must implement your own
    locking.
    
    ## Nagle’s algorithm
    
    Since GLib 2.80, [gio.socket.Socket] will automatically set the `TCP_NODELAY` option on
    all [gio.types.SocketType.Stream] sockets. This disables
    [Nagle’s algorithm](https://en.wikipedia.org/wiki/Nagle`27s_algorithm`) as it
    typically does more harm than good on modern networks.
    
    If your application needs Nagle’s algorithm enabled, call
    [gio.socket.Socket.setOption] after constructing a [gio.socket.Socket] to enable it:
    ```c
    socket = g_socket_new (…, G_SOCKET_TYPE_STREAM, …);
    if (socket != NULL)
      {
        g_socket_set_option (socket, IPPROTO_TCP, TCP_NODELAY, FALSE, &local_error);
        // handle error if needed
      }
    ```
*/
class Socket : gobject.object.ObjectWrap, gio.datagram_based.DatagramBased, gio.initable.Initable
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
    return cast(void function())g_socket_get_type != &gidSymbolNotFound ? g_socket_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Socket self()
  {
    return this;
  }

  /**
      Get `blocking` property.
      Returns: Whether I/O on this socket is blocking.
  */
  @property bool blocking()
  {
    return getBlocking();
  }

  /**
      Set `blocking` property.
      Params:
        propval = Whether I/O on this socket is blocking.
  */
  @property void blocking(bool propval)
  {
    return setBlocking(propval);
  }

  /**
      Get `broadcast` property.
      Returns: Whether the socket should allow sending to broadcast addresses.
  */
  @property bool broadcast()
  {
    return getBroadcast();
  }

  /**
      Set `broadcast` property.
      Params:
        propval = Whether the socket should allow sending to broadcast addresses.
  */
  @property void broadcast(bool propval)
  {
    return setBroadcast(propval);
  }

  /**
      Get `keepalive` property.
      Returns: Whether to keep the connection alive by sending periodic pings.
  */
  @property bool keepalive()
  {
    return getKeepalive();
  }

  /**
      Set `keepalive` property.
      Params:
        propval = Whether to keep the connection alive by sending periodic pings.
  */
  @property void keepalive(bool propval)
  {
    return setKeepalive(propval);
  }

  /**
      Get `listenBacklog` property.
      Returns: The number of outstanding connections in the listen queue.
  */
  @property int listenBacklog()
  {
    return getListenBacklog();
  }

  /**
      Set `listenBacklog` property.
      Params:
        propval = The number of outstanding connections in the listen queue.
  */
  @property void listenBacklog(int propval)
  {
    return setListenBacklog(propval);
  }

  /**
      Get `localAddress` property.
      Returns: The local address the socket is bound to.
  */
  @property gio.socket_address.SocketAddress localAddress()
  {
    return getLocalAddress();
  }

  /**
      Get `multicastLoopback` property.
      Returns: Whether outgoing multicast packets loop back to the local host.
  */
  @property bool multicastLoopback()
  {
    return getMulticastLoopback();
  }

  /**
      Set `multicastLoopback` property.
      Params:
        propval = Whether outgoing multicast packets loop back to the local host.
  */
  @property void multicastLoopback(bool propval)
  {
    return setMulticastLoopback(propval);
  }

  /**
      Get `multicastTtl` property.
      Returns: Time-to-live out outgoing multicast packets
  */
  @property uint multicastTtl()
  {
    return getMulticastTtl();
  }

  /**
      Set `multicastTtl` property.
      Params:
        propval = Time-to-live out outgoing multicast packets
  */
  @property void multicastTtl(uint propval)
  {
    return setMulticastTtl(propval);
  }

  /**
      Get `remoteAddress` property.
      Returns: The remote address the socket is connected to.
  */
  @property gio.socket_address.SocketAddress remoteAddress()
  {
    return getRemoteAddress();
  }

  /**
      Get `timeout` property.
      Returns: The timeout in seconds on socket I/O
  */
  @property uint timeout()
  {
    return getTimeout();
  }

  /**
      Set `timeout` property.
      Params:
        propval = The timeout in seconds on socket I/O
  */
  @property void timeout(uint propval)
  {
    return setTimeout(propval);
  }

  /**
      Get `ttl` property.
      Returns: Time-to-live for outgoing unicast packets
  */
  @property uint ttl()
  {
    return getTtl();
  }

  /**
      Set `ttl` property.
      Params:
        propval = Time-to-live for outgoing unicast packets
  */
  @property void ttl(uint propval)
  {
    return setTtl(propval);
  }

  mixin DatagramBasedT!();
  mixin InitableT!();

  /**
      Creates a new #GSocket with the defined family, type and protocol.
      If protocol is 0 ([gio.types.SocketProtocol.Default]) the default protocol type
      for the family and type is used.
      
      The protocol is a family and type specific int that specifies what
      kind of protocol to use. #GSocketProtocol lists several common ones.
      Many families only support one protocol, and use 0 for this, others
      support several and using 0 means to use the default protocol for
      the family and type.
      
      The protocol id is passed directly to the operating
      system, so you can use protocols not listed in #GSocketProtocol if you
      know the protocol number used for it.
  
      Params:
        family = the socket family to use, e.g. [gio.types.SocketFamily.Ipv4].
        type = the socket type to use.
        protocol = the id of the protocol to use, or 0 for default.
      Returns: a #GSocket or null on error.
            Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  this(gio.types.SocketFamily family, gio.types.SocketType type, gio.types.SocketProtocol protocol)
  {
    GSocket* _cretval;
    GError *_err;
    _cretval = g_socket_new(family, type, protocol, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GSocket from a native file descriptor
      or winsock SOCKET handle.
      
      This reads all the settings from the file descriptor so that
      all properties should work. Note that the file descriptor
      will be set to non-blocking mode, independent on the blocking
      mode of the #GSocket.
      
      On success, the returned #GSocket takes ownership of fd. On failure, the
      caller must close fd themselves.
      
      Since GLib 2.46, it is no longer a fatal error to call this on a non-socket
      descriptor.  Instead, a GError will be set with code [gio.types.IOErrorEnum.Failed]
  
      Params:
        fd = a native socket file descriptor.
      Returns: a #GSocket or null on error.
            Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.socket.Socket newFromFd(int fd)
  {
    GSocket* _cretval;
    GError *_err;
    _cretval = g_socket_new_from_fd(fd, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket.Socket)(cast(GSocket*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Accept incoming connections on a connection-based socket. This removes
      the first outstanding connection request from the listening socket and
      creates a #GSocket object for it.
      
      The socket must be bound to a local address with [gio.socket.Socket.bind] and
      must be listening for incoming connections ([gio.socket.Socket.listen]).
      
      If there are no outstanding connections then the operation will block
      or return [gio.types.IOErrorEnum.WouldBlock] if non-blocking I/O is enabled.
      To be notified of an incoming connection, wait for the [glib.types.IOCondition.In] condition.
  
      Params:
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: a new #GSocket, or null on error.
            Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  gio.socket.Socket accept(gio.cancellable.Cancellable cancellable = null)
  {
    GSocket* _cretval;
    GError *_err;
    _cretval = g_socket_accept(cast(GSocket*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket.Socket)(cast(GSocket*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      When a socket is created it is attached to an address family, but it
      doesn't have an address in this family. [gio.socket.Socket.bind] assigns the
      address (sometimes called name) of the socket.
      
      It is generally required to bind to a local address before you can
      receive connections. (See [gio.socket.Socket.listen] and [gio.socket.Socket.accept] ).
      In certain situations, you may also want to bind a socket that will be
      used to initiate connections, though this is not normally required.
      
      If socket is a TCP socket, then allow_reuse controls the setting
      of the `SO_REUSEADDR` socket option; normally it should be true for
      server sockets (sockets that you will eventually call
      [gio.socket.Socket.accept] on), and false for client sockets. (Failing to
      set this flag on a server socket may cause [gio.socket.Socket.bind] to return
      [gio.types.IOErrorEnum.AddressInUse] if the server program is stopped and then
      immediately restarted.)
      
      If socket is a UDP socket, then allow_reuse determines whether or
      not other UDP sockets can be bound to the same address at the same
      time. In particular, you can have several UDP sockets bound to the
      same address, and they will all receive all of the multicast and
      broadcast packets sent to that address. (The behavior of unicast
      UDP packets to an address with multiple listeners is not defined.)
  
      Params:
        address = a #GSocketAddress specifying the local address.
        allowReuse = whether to allow reusing this address
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool bind(gio.socket_address.SocketAddress address, bool allowReuse)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_bind(cast(GSocket*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null, allowReuse, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Checks and resets the pending connect error for the socket.
      This is used to check for errors when [gio.socket.Socket.connect] is
      used in non-blocking mode.
      Returns: true if no error, false otherwise, setting error to the error
      Throws: [ErrorWrap]
  */
  bool checkConnectResult()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_check_connect_result(cast(GSocket*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Closes the socket, shutting down any active connection.
      
      Closing a socket does not wait for all outstanding I/O operations
      to finish, so the caller should not rely on them to be guaranteed
      to complete even if the close returns with no error.
      
      Once the socket is closed, all other operations will return
      [gio.types.IOErrorEnum.Closed]. Closing a socket multiple times will not
      return an error.
      
      Sockets will be automatically closed when the last reference
      is dropped, but you might want to call this function to make sure
      resources are released as early as possible.
      
      Beware that due to the way that TCP works, it is possible for
      recently-sent data to be lost if either you close a socket while the
      [glib.types.IOCondition.In] condition is set, or else if the remote connection tries to
      send something to you after you close the socket but before it has
      finished reading all of the data you sent. There is no easy generic
      way to avoid this problem; the easiest fix is to design the network
      protocol such that the client will never send data "out of turn".
      Another solution is for the server to half-close the connection by
      calling [gio.socket.Socket.shutdown] with only the shutdown_write flag set,
      and then wait for the client to notice this and close its side of the
      connection, after which the server can safely call [gio.socket.Socket.close].
      (This is what #GTcpConnection does if you call
      [gio.tcp_connection.TcpConnection.setGracefulDisconnect]. But of course, this
      only works if the client will close its connection after the server
      does.)
      Returns: true on success, false on error
      Throws: [ErrorWrap]
  */
  bool close()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_close(cast(GSocket*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Checks on the readiness of socket to perform operations.
      The operations specified in condition are checked for and masked
      against the currently-satisfied conditions on socket. The result
      is returned.
      
      Note that on Windows, it is possible for an operation to return
      [gio.types.IOErrorEnum.WouldBlock] even immediately after
      [gio.socket.Socket.conditionCheck] has claimed that the socket is ready for
      writing. Rather than calling [gio.socket.Socket.conditionCheck] and then
      writing to the socket if it succeeds, it is generally better to
      simply try writing to the socket right away, and try again later if
      the initial attempt returns [gio.types.IOErrorEnum.WouldBlock].
      
      It is meaningless to specify [glib.types.IOCondition.Err] or [glib.types.IOCondition.Hup] in condition;
      these conditions will always be set in the output if they are true.
      
      This call never blocks.
  
      Params:
        condition = a #GIOCondition mask to check
      Returns: the GIOCondition mask of the current state
  */
  glib.types.IOCondition conditionCheck(glib.types.IOCondition condition)
  {
    GIOCondition _cretval;
    _cretval = g_socket_condition_check(cast(GSocket*)this._cPtr, condition);
    glib.types.IOCondition _retval = cast(glib.types.IOCondition)_cretval;
    return _retval;
  }

  /**
      Waits for up to timeout_us microseconds for condition to become true
      on socket. If the condition is met, true is returned.
      
      If cancellable is cancelled before the condition is met, or if
      timeout_us (or the socket's #GSocket:timeout) is reached before the
      condition is met, then false is returned and error, if non-null,
      is set to the appropriate value ([gio.types.IOErrorEnum.Cancelled] or
      [gio.types.IOErrorEnum.TimedOut]).
      
      If you don't want a timeout, use [gio.socket.Socket.conditionWait].
      (Alternatively, you can pass -1 for timeout_us.)
      
      Note that although timeout_us is in microseconds for consistency with
      other GLib APIs, this function actually only has millisecond
      resolution, and the behavior is undefined if timeout_us is not an
      exact number of milliseconds.
  
      Params:
        condition = a #GIOCondition mask to wait for
        timeoutUs = the maximum time (in microseconds) to wait, or -1
        cancellable = a #GCancellable, or null
      Returns: true if the condition was met, false otherwise
      Throws: [ErrorWrap]
  */
  bool conditionTimedWait(glib.types.IOCondition condition, long timeoutUs, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_condition_timed_wait(cast(GSocket*)this._cPtr, condition, timeoutUs, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Waits for condition to become true on socket. When the condition
      is met, true is returned.
      
      If cancellable is cancelled before the condition is met, or if the
      socket has a timeout set and it is reached before the condition is
      met, then false is returned and error, if non-null, is set to
      the appropriate value ([gio.types.IOErrorEnum.Cancelled] or
      [gio.types.IOErrorEnum.TimedOut]).
      
      See also [gio.socket.Socket.conditionTimedWait].
  
      Params:
        condition = a #GIOCondition mask to wait for
        cancellable = a #GCancellable, or null
      Returns: true if the condition was met, false otherwise
      Throws: [ErrorWrap]
  */
  bool conditionWait(glib.types.IOCondition condition, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_condition_wait(cast(GSocket*)this._cPtr, condition, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Connect the socket to the specified remote address.
      
      For connection oriented socket this generally means we attempt to make
      a connection to the address. For a connection-less socket it sets
      the default address for [gio.socket.Socket.send] and discards all incoming datagrams
      from other sources.
      
      Generally connection oriented sockets can only connect once, but
      connection-less sockets can connect multiple times to change the
      default address.
      
      If the connect call needs to do network I/O it will block, unless
      non-blocking I/O is enabled. Then [gio.types.IOErrorEnum.Pending] is returned
      and the user can be notified of the connection finishing by waiting
      for the G_IO_OUT condition. The result of the connection must then be
      checked with [gio.socket.Socket.checkConnectResult].
  
      Params:
        address = a #GSocketAddress specifying the remote address.
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: true if connected, false on error.
      Throws: [ErrorWrap]
  */
  bool connect(gio.socket_address.SocketAddress address, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_connect(cast(GSocket*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates a #GSocketConnection subclass of the right type for
      socket.
      Returns: a #GSocketConnection
  */
  gio.socket_connection.SocketConnection connectionFactoryCreateConnection()
  {
    GSocketConnection* _cretval;
    _cretval = g_socket_connection_factory_create_connection(cast(GSocket*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the amount of data pending in the OS input buffer, without blocking.
      
      If socket is a UDP or SCTP socket, this will return the size of
      just the next packet, even if additional packets are buffered after
      that one.
      
      Note that on Windows, this function is rather inefficient in the
      UDP case, and so if you know any plausible upper bound on the size
      of the incoming packet, it is better to just do a
      [gio.socket.Socket.receive] with a buffer of that size, rather than calling
      [gio.socket.Socket.getAvailableBytes] first and then doing a receive of
      exactly the right size.
      Returns: the number of bytes that can be read from the socket
        without blocking or truncating, or -1 on error.
  */
  ptrdiff_t getAvailableBytes()
  {
    ptrdiff_t _retval;
    _retval = g_socket_get_available_bytes(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Gets the blocking mode of the socket. For details on blocking I/O,
      see [gio.socket.Socket.setBlocking].
      Returns: true if blocking I/O is used, false otherwise.
  */
  bool getBlocking()
  {
    bool _retval;
    _retval = cast(bool)g_socket_get_blocking(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Gets the broadcast setting on socket; if true,
      it is possible to send packets to broadcast
      addresses.
      Returns: the broadcast setting on socket
  */
  bool getBroadcast()
  {
    bool _retval;
    _retval = cast(bool)g_socket_get_broadcast(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Returns the credentials of the foreign process connected to this
      socket, if any (e.g. it is only supported for [gio.types.SocketFamily.Unix]
      sockets).
      
      If this operation isn't supported on the OS, the method fails with
      the [gio.types.IOErrorEnum.NotSupported] error. On Linux this is implemented
      by reading the `SO_PEERCRED` option on the underlying socket.
      
      This method can be expected to be available on the following platforms:
      
      $(LIST
        * Linux since GLib 2.26
        * OpenBSD since GLib 2.30
        * Solaris, Illumos and OpenSolaris since GLib 2.40
        * NetBSD since GLib 2.42
        * macOS, tvOS, iOS since GLib 2.66
      )
        
      Other ways to obtain credentials from a foreign peer includes the
      #GUnixCredentialsMessage type and
      [gio.unix_connection.UnixConnection.sendCredentials] /
      [gio.unix_connection.UnixConnection.receiveCredentials] functions.
      Returns: null if error is set, otherwise a #GCredentials object
        that must be freed with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  gio.credentials.Credentials getCredentials()
  {
    GCredentials* _cretval;
    GError *_err;
    _cretval = g_socket_get_credentials(cast(GSocket*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.credentials.Credentials)(cast(GCredentials*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the socket family of the socket.
      Returns: a #GSocketFamily
  */
  gio.types.SocketFamily getFamily()
  {
    GSocketFamily _cretval;
    _cretval = g_socket_get_family(cast(GSocket*)this._cPtr);
    gio.types.SocketFamily _retval = cast(gio.types.SocketFamily)_cretval;
    return _retval;
  }

  /**
      Returns the underlying OS socket object. On unix this
      is a socket file descriptor, and on Windows this is
      a Winsock2 SOCKET handle. This may be useful for
      doing platform specific or otherwise unusual operations
      on the socket.
      Returns: the file descriptor of the socket.
  */
  int getFd()
  {
    int _retval;
    _retval = g_socket_get_fd(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Gets the keepalive mode of the socket. For details on this,
      see [gio.socket.Socket.setKeepalive].
      Returns: true if keepalive is active, false otherwise.
  */
  bool getKeepalive()
  {
    bool _retval;
    _retval = cast(bool)g_socket_get_keepalive(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Gets the listen backlog setting of the socket. For details on this,
      see [gio.socket.Socket.setListenBacklog].
      Returns: the maximum number of pending connections.
  */
  int getListenBacklog()
  {
    int _retval;
    _retval = g_socket_get_listen_backlog(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Try to get the local address of a bound socket. This is only
      useful if the socket has been bound to a local address,
      either explicitly or implicitly when connecting.
      Returns: a #GSocketAddress or null on error.
            Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  gio.socket_address.SocketAddress getLocalAddress()
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_get_local_address(cast(GSocket*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the multicast loopback setting on socket; if true (the
      default), outgoing multicast packets will be looped back to
      multicast listeners on the same host.
      Returns: the multicast loopback setting on socket
  */
  bool getMulticastLoopback()
  {
    bool _retval;
    _retval = cast(bool)g_socket_get_multicast_loopback(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Gets the multicast time-to-live setting on socket; see
      [gio.socket.Socket.setMulticastTtl] for more details.
      Returns: the multicast time-to-live setting on socket
  */
  uint getMulticastTtl()
  {
    uint _retval;
    _retval = g_socket_get_multicast_ttl(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of an integer-valued option on socket, as with
      getsockopt(). (If you need to fetch a  non-integer-valued option,
      you will need to call getsockopt() directly.)
      
      The [<gio/gnetworking.h>][gio-gnetworking.h]
      header pulls in system headers that will define most of the
      standard/portable socket options. For unusual socket protocols or
      platform-dependent options, you may need to include additional
      headers.
      
      Note that even for socket options that are a single byte in size,
      value is still a pointer to a #gint variable, not a #guchar;
      [gio.socket.Socket.getOption] will handle the conversion internally.
  
      Params:
        level = the "API level" of the option (eg, `SOL_SOCKET`)
        optname = the "name" of the option (eg, `SO_BROADCAST`)
        value = return location for the option value
      Returns: success or failure. On failure, error will be set, and
          the system error value (`errno` or WSAGetLastError()) will still
          be set to the result of the getsockopt() call.
      Throws: [ErrorWrap]
  */
  bool getOption(int level, int optname, out int value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_get_option(cast(GSocket*)this._cPtr, level, optname, cast(int*)&value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the socket protocol id the socket was created with.
      In case the protocol is unknown, -1 is returned.
      Returns: a protocol id, or -1 if unknown
  */
  gio.types.SocketProtocol getProtocol()
  {
    GSocketProtocol _cretval;
    _cretval = g_socket_get_protocol(cast(GSocket*)this._cPtr);
    gio.types.SocketProtocol _retval = cast(gio.types.SocketProtocol)_cretval;
    return _retval;
  }

  /**
      Try to get the remote address of a connected socket. This is only
      useful for connection oriented sockets that have been connected.
      Returns: a #GSocketAddress or null on error.
            Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  gio.socket_address.SocketAddress getRemoteAddress()
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_get_remote_address(cast(GSocket*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the socket type of the socket.
      Returns: a #GSocketType
  */
  gio.types.SocketType getSocketType()
  {
    GSocketType _cretval;
    _cretval = g_socket_get_socket_type(cast(GSocket*)this._cPtr);
    gio.types.SocketType _retval = cast(gio.types.SocketType)_cretval;
    return _retval;
  }

  /**
      Gets the timeout setting of the socket. For details on this, see
      [gio.socket.Socket.setTimeout].
      Returns: the timeout in seconds
  */
  uint getTimeout()
  {
    uint _retval;
    _retval = g_socket_get_timeout(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Gets the unicast time-to-live setting on socket; see
      [gio.socket.Socket.setTtl] for more details.
      Returns: the time-to-live setting on socket
  */
  uint getTtl()
  {
    uint _retval;
    _retval = g_socket_get_ttl(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether a socket is closed.
      Returns: true if socket is closed, false otherwise
  */
  bool isClosed()
  {
    bool _retval;
    _retval = cast(bool)g_socket_is_closed(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Check whether the socket is connected. This is only useful for
      connection-oriented sockets.
      
      If using [gio.socket.Socket.shutdown], this function will return true until the
      socket has been shut down for reading and writing. If you do a non-blocking
      connect, this function will not return true until after you call
      [gio.socket.Socket.checkConnectResult].
      Returns: true if socket is connected, false otherwise.
  */
  bool isConnected()
  {
    bool _retval;
    _retval = cast(bool)g_socket_is_connected(cast(GSocket*)this._cPtr);
    return _retval;
  }

  /**
      Registers socket to receive multicast messages sent to group.
      socket must be a [gio.types.SocketType.Datagram] socket, and must have
      been bound to an appropriate interface and port with
      [gio.socket.Socket.bind].
      
      If iface is null, the system will automatically pick an interface
      to bind to based on group.
      
      If source_specific is true, source-specific multicast as defined
      in RFC 4604 is used. Note that on older platforms this may fail
      with a [gio.types.IOErrorEnum.NotSupported] error.
      
      To bind to a given source-specific multicast address, use
      [gio.socket.Socket.joinMulticastGroupSsm] instead.
  
      Params:
        group = a #GInetAddress specifying the group address to join.
        sourceSpecific = true if source-specific multicast should be used
        iface = Name of the interface to use, or null
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool joinMulticastGroup(gio.inet_address.InetAddress group, bool sourceSpecific, string iface = null)
  {
    bool _retval;
    const(char)* _iface = iface.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_socket_join_multicast_group(cast(GSocket*)this._cPtr, group ? cast(GInetAddress*)group._cPtr(No.Dup) : null, sourceSpecific, _iface, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Registers socket to receive multicast messages sent to group.
      socket must be a [gio.types.SocketType.Datagram] socket, and must have
      been bound to an appropriate interface and port with
      [gio.socket.Socket.bind].
      
      If iface is null, the system will automatically pick an interface
      to bind to based on group.
      
      If source_specific is not null, use source-specific multicast as
      defined in RFC 4604. Note that on older platforms this may fail
      with a [gio.types.IOErrorEnum.NotSupported] error.
      
      Note that this function can be called multiple times for the same
      group with different source_specific in order to receive multicast
      packets from more than one source.
  
      Params:
        group = a #GInetAddress specifying the group address to join.
        sourceSpecific = a #GInetAddress specifying the
          source-specific multicast address or null to ignore.
        iface = Name of the interface to use, or null
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool joinMulticastGroupSsm(gio.inet_address.InetAddress group, gio.inet_address.InetAddress sourceSpecific = null, string iface = null)
  {
    bool _retval;
    const(char)* _iface = iface.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_socket_join_multicast_group_ssm(cast(GSocket*)this._cPtr, group ? cast(GInetAddress*)group._cPtr(No.Dup) : null, sourceSpecific ? cast(GInetAddress*)sourceSpecific._cPtr(No.Dup) : null, _iface, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Removes socket from the multicast group defined by group, iface,
      and source_specific (which must all have the same values they had
      when you joined the group).
      
      socket remains bound to its address and port, and can still receive
      unicast messages after calling this.
      
      To unbind to a given source-specific multicast address, use
      [gio.socket.Socket.leaveMulticastGroupSsm] instead.
  
      Params:
        group = a #GInetAddress specifying the group address to leave.
        sourceSpecific = true if source-specific multicast was used
        iface = Interface used
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool leaveMulticastGroup(gio.inet_address.InetAddress group, bool sourceSpecific, string iface = null)
  {
    bool _retval;
    const(char)* _iface = iface.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_socket_leave_multicast_group(cast(GSocket*)this._cPtr, group ? cast(GInetAddress*)group._cPtr(No.Dup) : null, sourceSpecific, _iface, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Removes socket from the multicast group defined by group, iface,
      and source_specific (which must all have the same values they had
      when you joined the group).
      
      socket remains bound to its address and port, and can still receive
      unicast messages after calling this.
  
      Params:
        group = a #GInetAddress specifying the group address to leave.
        sourceSpecific = a #GInetAddress specifying the
          source-specific multicast address or null to ignore.
        iface = Name of the interface to use, or null
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool leaveMulticastGroupSsm(gio.inet_address.InetAddress group, gio.inet_address.InetAddress sourceSpecific = null, string iface = null)
  {
    bool _retval;
    const(char)* _iface = iface.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_socket_leave_multicast_group_ssm(cast(GSocket*)this._cPtr, group ? cast(GInetAddress*)group._cPtr(No.Dup) : null, sourceSpecific ? cast(GInetAddress*)sourceSpecific._cPtr(No.Dup) : null, _iface, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Marks the socket as a server socket, i.e. a socket that is used
      to accept incoming requests using [gio.socket.Socket.accept].
      
      Before calling this the socket must be bound to a local address using
      [gio.socket.Socket.bind].
      
      To set the maximum amount of outstanding clients, use
      [gio.socket.Socket.setListenBacklog].
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool listen()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_listen(cast(GSocket*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Receive data (up to size bytes) from a socket. This is mainly used by
      connection-oriented sockets; it is identical to [gio.socket.Socket.receiveFrom]
      with address set to null.
      
      For [gio.types.SocketType.Datagram] and [gio.types.SocketType.Seqpacket] sockets,
      [gio.socket.Socket.receive] will always read either 0 or 1 complete messages from
      the socket. If the received message is too large to fit in buffer, then
      the data beyond size bytes will be discarded, without any explicit
      indication that this has occurred.
      
      For [gio.types.SocketType.Stream] sockets, [gio.socket.Socket.receive] can return any
      number of bytes, up to size. If more than size bytes have been
      received, the additional data will be returned in future calls to
      [gio.socket.Socket.receive].
      
      If the socket is in blocking mode the call will block until there
      is some data to receive, the connection is closed, or there is an
      error. If there is no data available and the socket is in
      non-blocking mode, a [gio.types.IOErrorEnum.WouldBlock] error will be
      returned. To be notified when data is available, wait for the
      [glib.types.IOCondition.In] condition.
      
      On error -1 is returned and error is set accordingly.
  
      Params:
        buffer = a buffer to read data into (which should be at least size bytes long).
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: Number of bytes read, or 0 if the connection was closed by
        the peer, or -1 on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t receive(ref ubyte[] buffer, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    size_t _size;
    _size = cast(size_t)buffer.length;
    GError *_err;
    _retval = g_socket_receive(cast(GSocket*)this._cPtr, buffer.ptr, _size, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Receives data (up to size bytes) from a socket.
      
      This function is a variant of [gio.socket.Socket.receive] which returns a
      [glib.bytes.Bytes] rather than a plain buffer.
      
      Pass `-1` to timeout_us to block indefinitely until data is received (or
      the connection is closed, or there is an error). Pass `0` to use the default
      timeout from [gio.socket.Socket.timeout], or pass a positive number to wait
      for that many microseconds for data before returning [gio.types.IOErrorEnum.TimedOut].
  
      Params:
        size = the number of bytes you want to read from the socket
        timeoutUs = the timeout to wait for, in microseconds, or `-1` to block
            indefinitely
        cancellable = a [gio.cancellable.Cancellable], or `NULL`
      Returns: a bytes buffer containing the
          received bytes, or `NULL` on error
      Throws: [ErrorWrap]
  */
  glib.bytes.Bytes receiveBytes(size_t size, long timeoutUs, gio.cancellable.Cancellable cancellable = null)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = g_socket_receive_bytes(cast(GSocket*)this._cPtr, size, timeoutUs, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Receive data (up to size bytes) from a socket.
      
      This function is a variant of [gio.socket.Socket.receiveFrom] which returns
      a [glib.bytes.Bytes] rather than a plain buffer.
      
      If address is non-null then address will be set equal to the
      source address of the received packet.
      
      The address is owned by the caller.
      
      Pass `-1` to timeout_us to block indefinitely until data is received (or
      the connection is closed, or there is an error). Pass `0` to use the default
      timeout from [gio.socket.Socket.timeout], or pass a positive number to wait
      for that many microseconds for data before returning [gio.types.IOErrorEnum.TimedOut].
  
      Params:
        address = return location for a #GSocketAddress
        size = the number of bytes you want to read from the socket
        timeoutUs = the timeout to wait for, in microseconds, or `-1` to block
            indefinitely
        cancellable = a #GCancellable, or `NULL`
      Returns: a bytes buffer containing the
          received bytes, or `NULL` on error
      Throws: [ErrorWrap]
  */
  glib.bytes.Bytes receiveBytesFrom(out gio.socket_address.SocketAddress address, size_t size, long timeoutUs, gio.cancellable.Cancellable cancellable = null)
  {
    GBytes* _cretval;
    GSocketAddress* _address;
    GError *_err;
    _cretval = g_socket_receive_bytes_from(cast(GSocket*)this._cPtr, &_address, size, timeoutUs, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    address = new gio.socket_address.SocketAddress(cast(void*)_address, Yes.Take);
    return _retval;
  }

  /**
      Receive data (up to size bytes) from a socket.
      
      If address is non-null then address will be set equal to the
      source address of the received packet.
      address is owned by the caller.
      
      See [gio.socket.Socket.receive] for additional information.
  
      Params:
        address = a pointer to a #GSocketAddress
              pointer, or null
        buffer = a buffer to read data into (which should be at least size bytes long).
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: Number of bytes read, or 0 if the connection was closed by
        the peer, or -1 on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t receiveFrom(out gio.socket_address.SocketAddress address, ref ubyte[] buffer, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GSocketAddress* _address;
    size_t _size;
    _size = cast(size_t)buffer.length;
    GError *_err;
    _retval = g_socket_receive_from(cast(GSocket*)this._cPtr, &_address, buffer.ptr, _size, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    address = new gio.socket_address.SocketAddress(cast(void*)_address, Yes.Take);
    return _retval;
  }

  /**
      Receive data from a socket.  For receiving multiple messages, see
      [gio.socket.Socket.receiveMessages]; for easier use, see
      [gio.socket.Socket.receive] and [gio.socket.Socket.receiveFrom].
      
      If address is non-null then address will be set equal to the
      source address of the received packet.
      address is owned by the caller.
      
      vector must point to an array of #GInputVector structs and
      num_vectors must be the length of this array.  These structs
      describe the buffers that received data will be scattered into.
      If num_vectors is -1, then vectors is assumed to be terminated
      by a #GInputVector with a null buffer pointer.
      
      As a special case, if num_vectors is 0 (in which case, vectors
      may of course be null), then a single byte is received and
      discarded. This is to facilitate the common practice of sending a
      single '\0' byte for the purposes of transferring ancillary data.
      
      messages, if non-null, will be set to point to a newly-allocated
      array of #GSocketControlMessage instances or null if no such
      messages was received. These correspond to the control messages
      received from the kernel, one #GSocketControlMessage per message
      from the kernel. This array is null-terminated and must be freed
      by the caller using [glib.global.gfree] after calling [gobject.object.ObjectWrap.unref] on each
      element. If messages is null, any control messages received will
      be discarded.
      
      num_messages, if non-null, will be set to the number of control
      messages received.
      
      If both messages and num_messages are non-null, then
      num_messages gives the number of #GSocketControlMessage instances
      in messages (ie: not including the null terminator).
      
      flags is an in/out parameter. The commonly available arguments
      for this are available in the #GSocketMsgFlags enum, but the
      values there are the same as the system values, and the flags
      are passed in as-is, so you can pass in system-specific flags too
      (and [gio.socket.Socket.receiveMessage] may pass system-specific flags out).
      Flags passed in to the parameter affect the receive operation; flags returned
      out of it are relevant to the specific returned message.
      
      As with [gio.socket.Socket.receive], data may be discarded if socket is
      [gio.types.SocketType.Datagram] or [gio.types.SocketType.Seqpacket] and you do not
      provide enough buffer space to read a complete message. You can pass
      [gio.types.SocketMsgFlags.Peek] in flags to peek at the current message without
      removing it from the receive queue, but there is no portable way to find
      out the length of the message other than by reading it into a
      sufficiently-large buffer.
      
      If the socket is in blocking mode the call will block until there
      is some data to receive, the connection is closed, or there is an
      error. If there is no data available and the socket is in
      non-blocking mode, a [gio.types.IOErrorEnum.WouldBlock] error will be
      returned. To be notified when data is available, wait for the
      [glib.types.IOCondition.In] condition.
      
      On error -1 is returned and error is set accordingly.
  
      Params:
        address = a pointer to a #GSocketAddress
              pointer, or null
        vectors = an array of #GInputVector structs
        messages = a pointer
             which may be filled with an array of #GSocketControlMessages, or null
        flags = a pointer to an int containing #GSocketMsgFlags flags,
             which may additionally contain
             [other platform specific flags](http://man7.org/linux/man-pages/man2/recv.2.html)
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: Number of bytes read, or 0 if the connection was closed by
        the peer, or -1 on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t receiveMessage(out gio.socket_address.SocketAddress address, gio.types.InputVector[] vectors, out gio.socket_control_message.SocketControlMessage[] messages, ref int flags, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GSocketAddress* _address;
    int _numVectors;
    if (vectors)
      _numVectors = cast(int)vectors.length;

    auto _vectors = cast(GInputVector*)vectors.ptr;
    int _numMessages;
    GSocketControlMessage** _messages;
    GError *_err;
    _retval = g_socket_receive_message(cast(GSocket*)this._cPtr, &_address, _vectors, _numVectors, &_messages, &_numMessages, cast(int*)&flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    address = new gio.socket_address.SocketAddress(cast(void*)_address, Yes.Take);
    messages.length = _numMessages;
    foreach (i; 0 .. _numMessages)
      messages[i] = gobject.object.ObjectWrap._getDObject!(gio.socket_control_message.SocketControlMessage)(_messages[i], Yes.Take);
    gFree(cast(void*)_messages);
    return _retval;
  }

  /**
      This behaves exactly the same as [gio.socket.Socket.receive], except that
      the choice of blocking or non-blocking behavior is determined by
      the blocking argument rather than by socket's properties.
  
      Params:
        buffer = a buffer to read data into (which should be at least size bytes long).
        blocking = whether to do blocking or non-blocking I/O
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: Number of bytes read, or 0 if the connection was closed by
        the peer, or -1 on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t receiveWithBlocking(ref ubyte[] buffer, bool blocking, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    size_t _size;
    _size = cast(size_t)buffer.length;
    GError *_err;
    _retval = g_socket_receive_with_blocking(cast(GSocket*)this._cPtr, buffer.ptr, _size, blocking, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Tries to send size bytes from buffer on the socket. This is
      mainly used by connection-oriented sockets; it is identical to
      [gio.socket.Socket.sendTo] with address set to null.
      
      If the socket is in blocking mode the call will block until there is
      space for the data in the socket queue. If there is no space available
      and the socket is in non-blocking mode a [gio.types.IOErrorEnum.WouldBlock] error
      will be returned. To be notified when space is available, wait for the
      [glib.types.IOCondition.Out] condition. Note though that you may still receive
      [gio.types.IOErrorEnum.WouldBlock] from [gio.socket.Socket.send] even if you were previously
      notified of a [glib.types.IOCondition.Out] condition. (On Windows in particular, this is
      very common due to the way the underlying APIs work.)
      
      On error -1 is returned and error is set accordingly.
  
      Params:
        buffer = the buffer
              containing the data to send.
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: Number of bytes written (which may be less than size), or -1
        on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t send(ubyte[] buffer, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    size_t _size;
    if (buffer)
      _size = cast(size_t)buffer.length;

    auto _buffer = cast(const(ubyte)*)buffer.ptr;
    GError *_err;
    _retval = g_socket_send(cast(GSocket*)this._cPtr, _buffer, _size, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Send data to address on socket.  For sending multiple messages see
      [gio.socket.Socket.sendMessages]; for easier use, see
      [gio.socket.Socket.send] and [gio.socket.Socket.sendTo].
      
      If address is null then the message is sent to the default receiver
      (set by [gio.socket.Socket.connect]).
      
      vectors must point to an array of #GOutputVector structs and
      num_vectors must be the length of this array. (If num_vectors is -1,
      then vectors is assumed to be terminated by a #GOutputVector with a
      null buffer pointer.) The #GOutputVector structs describe the buffers
      that the sent data will be gathered from. Using multiple
      #GOutputVectors is more memory-efficient than manually copying
      data from multiple sources into a single buffer, and more
      network-efficient than making multiple calls to [gio.socket.Socket.send].
      
      messages, if non-null, is taken to point to an array of num_messages
      #GSocketControlMessage instances. These correspond to the control
      messages to be sent on the socket.
      If num_messages is -1 then messages is treated as a null-terminated
      array.
      
      flags modify how the message is sent. The commonly available arguments
      for this are available in the #GSocketMsgFlags enum, but the
      values there are the same as the system values, and the flags
      are passed in as-is, so you can pass in system-specific flags too.
      
      If the socket is in blocking mode the call will block until there is
      space for the data in the socket queue. If there is no space available
      and the socket is in non-blocking mode a [gio.types.IOErrorEnum.WouldBlock] error
      will be returned. To be notified when space is available, wait for the
      [glib.types.IOCondition.Out] condition. Note though that you may still receive
      [gio.types.IOErrorEnum.WouldBlock] from [gio.socket.Socket.send] even if you were previously
      notified of a [glib.types.IOCondition.Out] condition. (On Windows in particular, this is
      very common due to the way the underlying APIs work.)
      
      The sum of the sizes of each #GOutputVector in vectors must not be
      greater than `G_MAXSSIZE`. If the message can be larger than this,
      then it is mandatory to use the [gio.socket.Socket.sendMessageWithTimeout]
      function.
      
      On error -1 is returned and error is set accordingly.
  
      Params:
        address = a #GSocketAddress, or null
        vectors = an array of #GOutputVector structs
        messages = a pointer to an
            array of #GSocketControlMessages, or null.
        flags = an int containing #GSocketMsgFlags flags, which may additionally
             contain [other platform specific flags](http://man7.org/linux/man-pages/man2/recv.2.html)
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: Number of bytes written (which may be less than size), or -1
        on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t sendMessage(gio.socket_address.SocketAddress address, gio.types.OutputVector[] vectors, gio.socket_control_message.SocketControlMessage[] messages, int flags, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    int _numVectors;
    if (vectors)
      _numVectors = cast(int)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
    int _numMessages;
    if (messages)
      _numMessages = cast(int)messages.length;

    GSocketControlMessage*[] _tmpmessages;
    foreach (obj; messages)
      _tmpmessages ~= obj ? cast(GSocketControlMessage*)obj._cPtr : null;
    GSocketControlMessage** _messages = cast(GSocketControlMessage**)_tmpmessages.ptr;

    GError *_err;
    _retval = g_socket_send_message(cast(GSocket*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null, _vectors, _numVectors, _messages, _numMessages, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      This behaves exactly the same as [gio.socket.Socket.sendMessage], except that
      the choice of timeout behavior is determined by the timeout_us argument
      rather than by socket's properties.
      
      On error [gio.types.PollableReturn.Failed] is returned and error is set accordingly, or
      if the socket is currently not writable [gio.types.PollableReturn.WouldBlock] is
      returned. bytes_written will contain 0 in both cases.
  
      Params:
        address = a #GSocketAddress, or null
        vectors = an array of #GOutputVector structs
        messages = a pointer to an
            array of #GSocketControlMessages, or null.
        flags = an int containing #GSocketMsgFlags flags, which may additionally
             contain [other platform specific flags](http://man7.org/linux/man-pages/man2/recv.2.html)
        timeoutUs = the maximum time (in microseconds) to wait, or -1
        bytesWritten = location to store the number of bytes that were written to the socket
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: [gio.types.PollableReturn.Ok] if all data was successfully written,
        [gio.types.PollableReturn.WouldBlock] if the socket is currently not writable, or
        [gio.types.PollableReturn.Failed] if an error happened and error is set.
      Throws: [ErrorWrap]
  */
  gio.types.PollableReturn sendMessageWithTimeout(gio.socket_address.SocketAddress address, gio.types.OutputVector[] vectors, gio.socket_control_message.SocketControlMessage[] messages, int flags, long timeoutUs, out size_t bytesWritten, gio.cancellable.Cancellable cancellable = null)
  {
    GPollableReturn _cretval;
    int _numVectors;
    if (vectors)
      _numVectors = cast(int)vectors.length;

    auto _vectors = cast(const(GOutputVector)*)vectors.ptr;
    int _numMessages;
    if (messages)
      _numMessages = cast(int)messages.length;

    GSocketControlMessage*[] _tmpmessages;
    foreach (obj; messages)
      _tmpmessages ~= obj ? cast(GSocketControlMessage*)obj._cPtr : null;
    GSocketControlMessage** _messages = cast(GSocketControlMessage**)_tmpmessages.ptr;

    GError *_err;
    _cretval = g_socket_send_message_with_timeout(cast(GSocket*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null, _vectors, _numVectors, _messages, _numMessages, flags, timeoutUs, cast(size_t*)&bytesWritten, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    gio.types.PollableReturn _retval = cast(gio.types.PollableReturn)_cretval;
    return _retval;
  }

  /**
      Tries to send size bytes from buffer to address. If address is
      null then the message is sent to the default receiver (set by
      [gio.socket.Socket.connect]).
      
      See [gio.socket.Socket.send] for additional information.
  
      Params:
        address = a #GSocketAddress, or null
        buffer = the buffer
              containing the data to send.
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: Number of bytes written (which may be less than size), or -1
        on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t sendTo(gio.socket_address.SocketAddress address, ubyte[] buffer, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    size_t _size;
    if (buffer)
      _size = cast(size_t)buffer.length;

    auto _buffer = cast(const(ubyte)*)buffer.ptr;
    GError *_err;
    _retval = g_socket_send_to(cast(GSocket*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null, _buffer, _size, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      This behaves exactly the same as [gio.socket.Socket.send], except that
      the choice of blocking or non-blocking behavior is determined by
      the blocking argument rather than by socket's properties.
  
      Params:
        buffer = the buffer
              containing the data to send.
        blocking = whether to do blocking or non-blocking I/O
        cancellable = a [gio.cancellable.Cancellable] or null
      Returns: Number of bytes written (which may be less than size), or -1
        on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t sendWithBlocking(ubyte[] buffer, bool blocking, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    size_t _size;
    if (buffer)
      _size = cast(size_t)buffer.length;

    auto _buffer = cast(const(ubyte)*)buffer.ptr;
    GError *_err;
    _retval = g_socket_send_with_blocking(cast(GSocket*)this._cPtr, _buffer, _size, blocking, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets the blocking mode of the socket. In blocking mode
      all operations (which don’t take an explicit blocking parameter) block until
      they succeed or there is an error. In
      non-blocking mode all functions return results immediately or
      with a [gio.types.IOErrorEnum.WouldBlock] error.
      
      All sockets are created in blocking mode. However, note that the
      platform level socket is always non-blocking, and blocking mode
      is a GSocket level feature.
  
      Params:
        blocking = Whether to use blocking I/O or not.
  */
  void setBlocking(bool blocking)
  {
    g_socket_set_blocking(cast(GSocket*)this._cPtr, blocking);
  }

  /**
      Sets whether socket should allow sending to broadcast addresses.
      This is false by default.
  
      Params:
        broadcast = whether socket should allow sending to broadcast
              addresses
  */
  void setBroadcast(bool broadcast)
  {
    g_socket_set_broadcast(cast(GSocket*)this._cPtr, broadcast);
  }

  /**
      Sets or unsets the `SO_KEEPALIVE` flag on the underlying socket. When
      this flag is set on a socket, the system will attempt to verify that the
      remote socket endpoint is still present if a sufficiently long period of
      time passes with no data being exchanged. If the system is unable to
      verify the presence of the remote endpoint, it will automatically close
      the connection.
      
      This option is only functional on certain kinds of sockets. (Notably,
      [gio.types.SocketProtocol.Tcp] sockets.)
      
      The exact time between pings is system- and protocol-dependent, but will
      normally be at least two hours. Most commonly, you would set this flag
      on a server socket if you want to allow clients to remain idle for long
      periods of time, but also want to ensure that connections are eventually
      garbage-collected if clients crash or become unreachable.
  
      Params:
        keepalive = Value for the keepalive flag
  */
  void setKeepalive(bool keepalive)
  {
    g_socket_set_keepalive(cast(GSocket*)this._cPtr, keepalive);
  }

  /**
      Sets the maximum number of outstanding connections allowed
      when listening on this socket. If more clients than this are
      connecting to the socket and the application is not handling them
      on time then the new connections will be refused.
      
      Note that this must be called before [gio.socket.Socket.listen] and has no
      effect if called after that.
  
      Params:
        backlog = the maximum number of pending connections.
  */
  void setListenBacklog(int backlog)
  {
    g_socket_set_listen_backlog(cast(GSocket*)this._cPtr, backlog);
  }

  /**
      Sets whether outgoing multicast packets will be received by sockets
      listening on that multicast address on the same host. This is true
      by default.
  
      Params:
        loopback = whether socket should receive messages sent to its
            multicast groups from the local host
  */
  void setMulticastLoopback(bool loopback)
  {
    g_socket_set_multicast_loopback(cast(GSocket*)this._cPtr, loopback);
  }

  /**
      Sets the time-to-live for outgoing multicast datagrams on socket.
      By default, this is 1, meaning that multicast packets will not leave
      the local network.
  
      Params:
        ttl = the time-to-live value for all multicast datagrams on socket
  */
  void setMulticastTtl(uint ttl)
  {
    g_socket_set_multicast_ttl(cast(GSocket*)this._cPtr, ttl);
  }

  /**
      Sets the value of an integer-valued option on socket, as with
      setsockopt(). (If you need to set a non-integer-valued option,
      you will need to call setsockopt() directly.)
      
      The [<gio/gnetworking.h>][gio-gnetworking.h]
      header pulls in system headers that will define most of the
      standard/portable socket options. For unusual socket protocols or
      platform-dependent options, you may need to include additional
      headers.
  
      Params:
        level = the "API level" of the option (eg, `SOL_SOCKET`)
        optname = the "name" of the option (eg, `SO_BROADCAST`)
        value = the value to set the option to
      Returns: success or failure. On failure, error will be set, and
          the system error value (`errno` or WSAGetLastError()) will still
          be set to the result of the setsockopt() call.
      Throws: [ErrorWrap]
  */
  bool setOption(int level, int optname, int value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_set_option(cast(GSocket*)this._cPtr, level, optname, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets the time in seconds after which I/O operations on socket will
      time out if they have not yet completed.
      
      On a blocking socket, this means that any blocking #GSocket
      operation will time out after timeout seconds of inactivity,
      returning [gio.types.IOErrorEnum.TimedOut].
      
      On a non-blocking socket, calls to [gio.socket.Socket.conditionWait] will
      also fail with [gio.types.IOErrorEnum.TimedOut] after the given time. Sources
      created with [gio.socket.Socket.createSource] will trigger after
      timeout seconds of inactivity, with the requested condition
      set, at which point calling [gio.socket.Socket.receive], [gio.socket.Socket.send],
      [gio.socket.Socket.checkConnectResult], etc, will fail with
      [gio.types.IOErrorEnum.TimedOut].
      
      If timeout is 0 (the default), operations will never time out
      on their own.
      
      Note that if an I/O operation is interrupted by a signal, this may
      cause the timeout to be reset.
  
      Params:
        timeout = the timeout for socket, in seconds, or 0 for none
  */
  void setTimeout(uint timeout)
  {
    g_socket_set_timeout(cast(GSocket*)this._cPtr, timeout);
  }

  /**
      Sets the time-to-live for outgoing unicast packets on socket.
      By default the platform-specific default value is used.
  
      Params:
        ttl = the time-to-live value for all unicast packets on socket
  */
  void setTtl(uint ttl)
  {
    g_socket_set_ttl(cast(GSocket*)this._cPtr, ttl);
  }

  /**
      Shut down part or all of a full-duplex connection.
      
      If shutdown_read is true then the receiving side of the connection
      is shut down, and further reading is disallowed.
      
      If shutdown_write is true then the sending side of the connection
      is shut down, and further writing is disallowed.
      
      It is allowed for both shutdown_read and shutdown_write to be true.
      
      One example where it is useful to shut down only one side of a connection is
      graceful disconnect for TCP connections where you close the sending side,
      then wait for the other side to close the connection, thus ensuring that the
      other side saw all sent data.
  
      Params:
        shutdownRead = whether to shut down the read side
        shutdownWrite = whether to shut down the write side
      Returns: true on success, false on error
      Throws: [ErrorWrap]
  */
  bool shutdown(bool shutdownRead, bool shutdownWrite)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_shutdown(cast(GSocket*)this._cPtr, shutdownRead, shutdownWrite, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Checks if a socket is capable of speaking IPv4.
      
      IPv4 sockets are capable of speaking IPv4.  On some operating systems
      and under some combinations of circumstances IPv6 sockets are also
      capable of speaking IPv4.  See RFC 3493 section 3.7 for more
      information.
      
      No other types of sockets are currently considered as being capable
      of speaking IPv4.
      Returns: true if this socket can be used with IPv4.
  */
  bool speaksIpv4()
  {
    bool _retval;
    _retval = cast(bool)g_socket_speaks_ipv4(cast(GSocket*)this._cPtr);
    return _retval;
  }
}
