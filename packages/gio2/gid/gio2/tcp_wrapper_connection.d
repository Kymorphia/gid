/// Module for [TcpWrapperConnection] class
module gid.gio2.tcp_wrapper_connection;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.iostream;
import gid.gio2.socket;
import gid.gio2.tcp_connection;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.tcp_wrapper_connection.TcpWrapperConnection] can be used to wrap a [gid.gio2.iostream.IOStream] that is
    based on a [gid.gio2.socket.Socket], but which is not actually a
    [gid.gio2.socket_connection.SocketConnection]. This is used by [gid.gio2.socket_client.SocketClient] so
    that it can always return a [gid.gio2.socket_connection.SocketConnection], even when the
    connection it has actually created is not directly a
    [gid.gio2.socket_connection.SocketConnection].
*/
class TcpWrapperConnection : gid.gio2.tcp_connection.TcpConnection
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
    return cast(void function())g_tcp_wrapper_connection_get_type != &gidSymbolNotFound ? g_tcp_wrapper_connection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GTcpWrapperConnection";
  }

  /** Returns `this`, for use in `with` statements. */
  override TcpWrapperConnection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.tcp_wrapper_connection.TcpWrapperConnection]
      Returns: New builder object
  */
  static TcpWrapperConnectionGidBuilder builder() nothrow
  {
    return new TcpWrapperConnectionGidBuilder;
  }

  /**
      Get `baseIoStream` property.
      Returns: The wrapped [gid.gio2.iostream.IOStream].
  */
  @property gid.gio2.iostream.IOStream baseIoStream() nothrow
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
  this(gid.gio2.iostream.IOStream baseIoStream, gid.gio2.socket.Socket socket) nothrow
  {
    GSocketConnection* _cretval;
    _cretval = g_tcp_wrapper_connection_new(baseIoStream ? cast(GIOStream*)baseIoStream._cPtr(No.Dup) : null, socket ? cast(GSocket*)socket._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets conn's base #GIOStream
      Returns: conn's base #GIOStream
  */
  gid.gio2.iostream.IOStream getBaseIoStream() nothrow
  {
    GIOStream* _cretval;
    _cretval = g_tcp_wrapper_connection_get_base_io_stream(cast(GTcpWrapperConnection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.iostream.IOStream)(cast(GIOStream*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.tcp_wrapper_connection.TcpWrapperConnection]
class TcpWrapperConnectionGidBuilderImpl(T) : gid.gio2.tcp_connection.TcpConnectionGidBuilderImpl!T
{

  /**
      Set `baseIoStream` property.
      Params:
        propval = The wrapped [gid.gio2.iostream.IOStream].
      Returns: Builder instance for fluent chaining
  */
  T baseIoStream(gid.gio2.iostream.IOStream propval) nothrow
  {
    return setProperty("base-io-stream", propval);
  }
}

/// Fluent builder for [gid.gio2.tcp_wrapper_connection.TcpWrapperConnection]
final class TcpWrapperConnectionGidBuilder : TcpWrapperConnectionGidBuilderImpl!TcpWrapperConnectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TcpWrapperConnection build() nothrow
  {
    return new TcpWrapperConnection(cast(void*)createGObject(TcpWrapperConnection._getGType), Yes.Take);
  }
}
