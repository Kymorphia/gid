/// Module for [TcpConnection] class
module gid.gio2.tcp_connection;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.socket_connection;
import gid.gio2.types;
import gid.gobject2.gid_builder;

/**
    This is the subclass of [gid.gio2.socket_connection.SocketConnection] that is created
    for TCP/IP sockets.
*/
@gidGir("TcpConnection", "TcpConnectionClass")
class TcpConnection : gid.gio2.socket_connection.SocketConnection
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_tcp_connection_get_type != &gidSymbolNotFound ? g_tcp_connection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GTcpConnection";
  }

  /** Returns `this`, for use in `with` statements. */
  override TcpConnection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.tcp_connection.TcpConnection]
      Returns: New builder object
  */
  static TcpConnectionGidBuilder builder() nothrow
  {
    return new TcpConnectionGidBuilder;
  }

  /**
      Get `gracefulDisconnect` property.
      Returns: Whether [gid.gio2.iostream.IOStream.close] does a graceful disconnect.
  */
  @property bool gracefulDisconnect() nothrow
  {
    return getGracefulDisconnect();
  }

  /**
      Set `gracefulDisconnect` property.
      Params:
        propval = Whether [gid.gio2.iostream.IOStream.close] does a graceful disconnect.
  */
  @property void gracefulDisconnect(bool propval) nothrow
  {
    setGracefulDisconnect(propval);
  }

  /**
      Checks if graceful disconnects are used. See
      [gid.gio2.tcp_connection.TcpConnection.setGracefulDisconnect].
      Returns: true if graceful disconnect is used on close, false otherwise
  */
  bool getGracefulDisconnect() nothrow
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
  void setGracefulDisconnect(bool gracefulDisconnect) nothrow
  {
    g_tcp_connection_set_graceful_disconnect(cast(GTcpConnection*)this._cPtr, gracefulDisconnect);
  }
}

/// Fluent builder implementation template for [gid.gio2.tcp_connection.TcpConnection]
class TcpConnectionGidBuilderImpl(T) : gid.gio2.socket_connection.SocketConnectionGidBuilderImpl!T
{

  /**
      Set `gracefulDisconnect` property.
      Params:
        propval = Whether [gid.gio2.iostream.IOStream.close] does a graceful disconnect.
      Returns: Builder instance for fluent chaining
  */
  T gracefulDisconnect(bool propval) nothrow
  {
    return setProperty("graceful-disconnect", propval);
  }
}

/// Fluent builder for [gid.gio2.tcp_connection.TcpConnection]
final class TcpConnectionGidBuilder : TcpConnectionGidBuilderImpl!TcpConnectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TcpConnection build() nothrow
  {
    return new TcpConnection(cast(void*)createGObject(TcpConnection._getGType), Yes.Take);
  }
}
