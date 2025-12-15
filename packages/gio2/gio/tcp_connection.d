/// Module for [TcpConnection] class
module gio.tcp_connection;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_connection;
import gio.types;

/**
    This is the subclass of [gio.socket_connection.SocketConnection] that is created
    for TCP/IP sockets.
*/
class TcpConnection : gio.socket_connection.SocketConnection
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
    return cast(void function())g_tcp_connection_get_type != &gidSymbolNotFound ? g_tcp_connection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TcpConnection self()
  {
    return this;
  }

  /**
      Get `gracefulDisconnect` property.
      Returns: Whether [gio.iostream.IOStream.close] does a graceful disconnect.
  */
  @property bool gracefulDisconnect()
  {
    return getGracefulDisconnect();
  }

  /**
      Set `gracefulDisconnect` property.
      Params:
        propval = Whether [gio.iostream.IOStream.close] does a graceful disconnect.
  */
  @property void gracefulDisconnect(bool propval)
  {
    return setGracefulDisconnect(propval);
  }

  /**
      Checks if graceful disconnects are used. See
      [gio.tcp_connection.TcpConnection.setGracefulDisconnect].
      Returns: true if graceful disconnect is used on close, false otherwise
  */
  bool getGracefulDisconnect()
  {
    bool _retval;
    _retval = cast(bool)g_tcp_connection_get_graceful_disconnect(cast(GTcpConnection*)this._cPtr);
    return _retval;
  }

  /**
      This enables graceful disconnects on close. A graceful disconnect
      means that we signal the receiving end that the connection is terminated
      and wait for it to close the connection before closing the connection.
      
      A graceful disconnect means that we can be sure that we successfully sent
      all the outstanding data to the other end, or get an error reported.
      However, it also means we have to wait for all the data to reach the
      other side and for it to acknowledge this by closing the socket, which may
      take a while. For this reason it is disabled by default.
  
      Params:
        gracefulDisconnect = Whether to do graceful disconnects or not
  */
  void setGracefulDisconnect(bool gracefulDisconnect)
  {
    g_tcp_connection_set_graceful_disconnect(cast(GTcpConnection*)this._cPtr, gracefulDisconnect);
  }
}
