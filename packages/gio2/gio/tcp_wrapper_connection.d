/// Module for [TcpWrapperConnection] class
module gio.tcp_wrapper_connection;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.iostream;
import gio.socket;
import gio.tcp_connection;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    A [gio.tcp_wrapper_connection.TcpWrapperConnection] can be used to wrap a [gio.iostream.IOStream] that is
    based on a [gio.socket.Socket], but which is not actually a
    [gio.socket_connection.SocketConnection]. This is used by [gio.socket_client.SocketClient] so
    that it can always return a [gio.socket_connection.SocketConnection], even when the
    connection it has actually created is not directly a
    [gio.socket_connection.SocketConnection].
*/
class TcpWrapperConnection : gio.tcp_connection.TcpConnection
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
    return cast(void function())g_tcp_wrapper_connection_get_type != &gidSymbolNotFound ? g_tcp_wrapper_connection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TcpWrapperConnection self()
  {
    return this;
  }

  /**
  Get builder for [gio.tcp_wrapper_connection.TcpWrapperConnection]
  Returns: New builder object
  */
  static TcpWrapperConnectionGidBuilder builder()
  {
    return new TcpWrapperConnectionGidBuilder;
  }

  /**
      Get `baseIoStream` property.
      Returns: The wrapped [gio.iostream.IOStream].
  */
  @property gio.iostream.IOStream baseIoStream()
  {
    return getBaseIoStream();
  }

  /**
      Wraps base_io_stream and socket together as a #GSocketConnection.
  
      Params:
        baseIoStream = the #GIOStream to wrap
        socket = the #GSocket associated with base_io_stream
      Returns: the new #GSocketConnection.
  */
  this(gio.iostream.IOStream baseIoStream, gio.socket.Socket socket)
  {
    GSocketConnection* _cretval;
    _cretval = g_tcp_wrapper_connection_new(baseIoStream ? cast(GIOStream*)baseIoStream._cPtr(No.Dup) : null, socket ? cast(GSocket*)socket._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets conn's base #GIOStream
      Returns: conn's base #GIOStream
  */
  gio.iostream.IOStream getBaseIoStream()
  {
    GIOStream* _cretval;
    _cretval = g_tcp_wrapper_connection_get_base_io_stream(cast(GTcpWrapperConnection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.iostream.IOStream)(cast(GIOStream*)_cretval, No.Take);
    return _retval;
  }
}

class TcpWrapperConnectionGidBuilderImpl(T) : gio.tcp_connection.TcpConnectionGidBuilderImpl!T
{

  /**
      Set `baseIoStream` property.
      Params:
        propval = The wrapped [gio.iostream.IOStream].
      Returns: Builder instance for fluent chaining
  */
  T baseIoStream(gio.iostream.IOStream propval)
  {
    return setProperty("base-io-stream", propval);
  }
}

/// Fluent builder for [gio.tcp_wrapper_connection.TcpWrapperConnection]
final class TcpWrapperConnectionGidBuilder : TcpWrapperConnectionGidBuilderImpl!TcpWrapperConnectionGidBuilder
{
  TcpWrapperConnection build()
  {
    return new TcpWrapperConnection(cast(void*)createGObject(TcpWrapperConnection._getGType), Yes.Take);
  }
}
