/// Module for [SocketConnection] class
module gid.gio2.socket_connection;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.iostream;
import gid.gio2.socket;
import gid.gio2.socket_address;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;

/**
    [gid.gio2.socket_connection.SocketConnection] is a [gid.gio2.iostream.IOStream] for a connected socket. They
    can be created either by [gid.gio2.socket_client.SocketClient] when connecting to a host,
    or by [gid.gio2.socket_listener.SocketListener] when accepting a new client.
    
    The type of the [gid.gio2.socket_connection.SocketConnection] object returned from these calls
    depends on the type of the underlying socket that is in use. For
    instance, for a TCP/IP connection it will be a [gid.gio2.tcp_connection.TcpConnection].
    
    Choosing what type of object to construct is done with the socket
    connection factory, and it is possible for third parties to register
    custom socket connection types for specific combination of socket
    family/type/protocol using [gid.gio2.socket_connection.SocketConnection.factoryRegisterType].
    
    To close a [gid.gio2.socket_connection.SocketConnection], use [gid.gio2.iostream.IOStream.close]. Closing both
    substreams of the [gid.gio2.iostream.IOStream] separately will not close the
    underlying [gid.gio2.socket.Socket].
*/
class SocketConnection : gid.gio2.iostream.IOStream
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_socket_connection_get_type != &gidSymbolNotFound ? g_socket_connection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSocketConnection";
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketConnection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.socket_connection.SocketConnection]
      Returns: New builder object
  */
  static SocketConnectionGidBuilder builder() nothrow
  {
    return new SocketConnectionGidBuilder;
  }

  /**
      Get `socket` property.
      Returns: The underlying [gid.gio2.socket.Socket].
  */
  @property gid.gio2.socket.Socket socket() nothrow
  {
    return getSocket();
  }

  /**
      Looks up the #GType to be used when creating socket connections on
      sockets with the specified family, type and protocol_id.
      
      If no type is registered, the #GSocketConnection base type is returned.
  
      Params:
        family = a #GSocketFamily
        type = a #GSocketType
        protocolId = a protocol id
      Returns: a #GType
  */
  static gid.gobject2.types.GType factoryLookupType(gid.gio2.types.SocketFamily family, gid.gio2.types.SocketType type, int protocolId) nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = g_socket_connection_factory_lookup_type(family, type, protocolId);
    return _retval;
  }

  /**
      Looks up the #GType to be used when creating socket connections on
      sockets with the specified family, type and protocol.
      
      If no type is registered, the #GSocketConnection base type is returned.
  
      Params:
        gType = a #GType, inheriting from `G_TYPE_SOCKET_CONNECTION`
        family = a #GSocketFamily
        type = a #GSocketType
        protocol = a protocol id
  */
  static void factoryRegisterType(gid.gobject2.types.GType gType, gid.gio2.types.SocketFamily family, gid.gio2.types.SocketType type, int protocol) nothrow
  {
    g_socket_connection_factory_register_type(gType, family, type, protocol);
  }

  /**
      Connect connection to the specified remote address.
  
      Params:
        address = a #GSocketAddress specifying the remote address.
        cancellable = a [gid.gio2.cancellable.Cancellable] or null
      Returns: true if the connection succeeded, false on error
      Throws: [ErrorWrap]
  */
  bool connect(gid.gio2.socket_address.SocketAddress address, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_connection_connect(cast(GSocketConnection*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously connect connection to the specified remote address.
      
      This clears the #GSocket:blocking flag on connection's underlying
      socket if it is currently set.
      
      If #GSocket:timeout is set, the operation will time out and return
      [gid.gio2.types.IOErrorEnum.TimedOut] after that period. Otherwise, it will continue
      indefinitely until operating system timeouts (if any) are hit.
      
      Use [gid.gio2.socket_connection.SocketConnection.connectFinish] to retrieve the result.
  
      Params:
        address = a #GSocketAddress specifying the remote address.
        cancellable = a [gid.gio2.cancellable.Cancellable] or null
        callback = a #GAsyncReadyCallback
  */
  void connectAsync(gid.gio2.socket_address.SocketAddress address, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_socket_connection_connect_async(cast(GSocketConnection*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Gets the result of a [gid.gio2.socket_connection.SocketConnection.connectAsync] call.
  
      Params:
        result = the #GAsyncResult
      Returns: true if the connection succeeded, false on error
      Throws: [ErrorWrap]
  */
  bool connectFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_connection_connect_finish(cast(GSocketConnection*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Try to get the local address of a socket connection.
      Returns: a #GSocketAddress or null on error.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  gid.gio2.socket_address.SocketAddress getLocalAddress()
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_connection_get_local_address(cast(GSocketConnection*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Try to get the remote address of a socket connection.
      
      Since GLib 2.40, when used with [gid.gio2.socket_client.SocketClient.connect] or
      [gid.gio2.socket_client.SocketClient.connectAsync], during emission of
      [gid.gio2.types.SocketClientEvent.Connecting], this function will return the remote
      address that will be used for the connection.  This allows
      applications to print e.g. "Connecting to example.com
      (10.42.77.3)...".
      Returns: a #GSocketAddress or null on error.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  gid.gio2.socket_address.SocketAddress getRemoteAddress()
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_connection_get_remote_address(cast(GSocketConnection*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the underlying #GSocket object of the connection.
      This can be useful if you want to do something unusual on it
      not supported by the #GSocketConnection APIs.
      Returns: a #GSocket or null on error.
  */
  gid.gio2.socket.Socket getSocket() nothrow
  {
    GSocket* _cretval;
    _cretval = g_socket_connection_get_socket(cast(GSocketConnection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket.Socket)(cast(GSocket*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if connection is connected. This is equivalent to calling
      [gid.gio2.socket.Socket.isConnected] on connection's underlying #GSocket.
      Returns: whether connection is connected
  */
  bool isConnected() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_socket_connection_is_connected(cast(GSocketConnection*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.socket_connection.SocketConnection]
class SocketConnectionGidBuilderImpl(T) : gid.gio2.iostream.IOStreamGidBuilderImpl!T
{

  /**
      Set `socket` property.
      Params:
        propval = The underlying [gid.gio2.socket.Socket].
      Returns: Builder instance for fluent chaining
  */
  T socket(gid.gio2.socket.Socket propval) nothrow
  {
    return setProperty("socket", propval);
  }
}

/// Fluent builder for [gid.gio2.socket_connection.SocketConnection]
final class SocketConnectionGidBuilder : SocketConnectionGidBuilderImpl!SocketConnectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SocketConnection build() nothrow
  {
    return new SocketConnection(cast(void*)createGObject(SocketConnection._getGType), Yes.Take);
  }
}
