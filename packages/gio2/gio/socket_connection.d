module gio.socket_connection;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.iostream;
import gio.socket;
import gio.socket_address;
import gio.types;
import glib.error;
import gobject.object;
import gobject.types;

/**
 * `GSocketConnection` is a [gio.iostream.IOStream] for a connected socket. They
 * can be created either by [gio.socket_client.SocketClient] when connecting to a host,
 * or by [gio.socket_listener.SocketListener] when accepting a new client.
 * The type of the `GSocketConnection` object returned from these calls
 * depends on the type of the underlying socket that is in use. For
 * instance, for a TCP/IP connection it will be a [gio.tcp_connection.TcpConnection].
 * Choosing what type of object to construct is done with the socket
 * connection factory, and it is possible for third parties to register
 * custom socket connection types for specific combination of socket
 * family/type/protocol using [gio.socket_connection.SocketConnection.factoryRegisterType].
 * To close a `GSocketConnection`, use [gio.iostream.IOStream.close]. Closing both
 * substreams of the [gio.iostream.IOStream] separately will not close the
 * underlying [gio.socket.Socket].
 */
class SocketConnection : gio.iostream.IOStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_socket_connection_get_type != &gidSymbolNotFound ? g_socket_connection_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Looks up the #GType to be used when creating socket connections on
   * sockets with the specified family, type and protocol_id.
   * If no type is registered, the #GSocketConnection base type is returned.
   * Params:
   *   family = a #GSocketFamily
   *   type = a #GSocketType
   *   protocolId = a protocol id
   * Returns: a #GType
   */
  static gobject.types.GType factoryLookupType(gio.types.SocketFamily family, gio.types.SocketType type, int protocolId)
  {
    gobject.types.GType _retval;
    _retval = g_socket_connection_factory_lookup_type(family, type, protocolId);
    return _retval;
  }

  /**
   * Looks up the #GType to be used when creating socket connections on
   * sockets with the specified family, type and protocol.
   * If no type is registered, the #GSocketConnection base type is returned.
   * Params:
   *   gType = a #GType, inheriting from %G_TYPE_SOCKET_CONNECTION
   *   family = a #GSocketFamily
   *   type = a #GSocketType
   *   protocol = a protocol id
   */
  static void factoryRegisterType(gobject.types.GType gType, gio.types.SocketFamily family, gio.types.SocketType type, int protocol)
  {
    g_socket_connection_factory_register_type(gType, family, type, protocol);
  }

  /**
   * Connect connection to the specified remote address.
   * Params:
   *   address = a #GSocketAddress specifying the remote address.
   *   cancellable = a %GCancellable or %NULL
   * Returns: %TRUE if the connection succeeded, %FALSE on error
   */
  bool connect(gio.socket_address.SocketAddress address, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = g_socket_connection_connect(cast(GSocketConnection*)cPtr, address ? cast(GSocketAddress*)address.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Asynchronously connect connection to the specified remote address.
   * This clears the #GSocket:blocking flag on connection's underlying
   * socket if it is currently set.
   * If #GSocket:timeout is set, the operation will time out and return
   * %G_IO_ERROR_TIMED_OUT after that period. Otherwise, it will continue
   * indefinitely until operating system timeouts $(LPAREN)if any$(RPAREN) are hit.
   * Use [gio.socket_connection.SocketConnection.connectFinish] to retrieve the result.
   * Params:
   *   address = a #GSocketAddress specifying the remote address.
   *   cancellable = a %GCancellable or %NULL
   *   callback = a #GAsyncReadyCallback
   */
  void connectAsync(gio.socket_address.SocketAddress address, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_socket_connection_connect_async(cast(GSocketConnection*)cPtr, address ? cast(GSocketAddress*)address.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Gets the result of a [gio.socket_connection.SocketConnection.connectAsync] call.
   * Params:
   *   result = the #GAsyncResult
   * Returns: %TRUE if the connection succeeded, %FALSE on error
   */
  bool connectFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_socket_connection_connect_finish(cast(GSocketConnection*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Try to get the local address of a socket connection.
   * Returns: a #GSocketAddress or %NULL on error.
   *   Free the returned object with [gobject.object.ObjectG.unref].
   */
  gio.socket_address.SocketAddress getLocalAddress()
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_connection_get_local_address(cast(GSocketConnection*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Try to get the remote address of a socket connection.
   * Since GLib 2.40, when used with [gio.socket_client.SocketClient.connect] or
   * [gio.socket_client.SocketClient.connectAsync], during emission of
   * %G_SOCKET_CLIENT_CONNECTING, this function will return the remote
   * address that will be used for the connection.  This allows
   * applications to print e.g. "Connecting to example.com
   * $(LPAREN)10.42.77.3$(RPAREN)...".
   * Returns: a #GSocketAddress or %NULL on error.
   *   Free the returned object with [gobject.object.ObjectG.unref].
   */
  gio.socket_address.SocketAddress getRemoteAddress()
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_connection_get_remote_address(cast(GSocketConnection*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets the underlying #GSocket object of the connection.
   * This can be useful if you want to do something unusual on it
   * not supported by the #GSocketConnection APIs.
   * Returns: a #GSocket or %NULL on error.
   */
  gio.socket.Socket getSocket()
  {
    GSocket* _cretval;
    _cretval = g_socket_connection_get_socket(cast(GSocketConnection*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.socket.Socket)(cast(GSocket*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Checks if connection is connected. This is equivalent to calling
   * [gio.socket.Socket.isConnected] on connection's underlying #GSocket.
   * Returns: whether connection is connected
   */
  bool isConnected()
  {
    bool _retval;
    _retval = g_socket_connection_is_connected(cast(GSocketConnection*)cPtr);
    return _retval;
  }
}
