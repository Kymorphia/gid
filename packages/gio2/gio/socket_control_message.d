/// Module for [SocketControlMessage] class
module gio.socket_control_message;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    A [gio.socket_control_message.SocketControlMessage] is a special-purpose utility message that
    can be sent to or received from a [gio.socket.Socket]. These types of
    messages are often called ‘ancillary data’.
    
    The message can represent some sort of special instruction to or
    information from the socket or can represent a special kind of
    transfer to the peer (for example, sending a file descriptor over
    a UNIX socket).
    
    These messages are sent with [gio.socket.Socket.sendMessage] and received
    with [gio.socket.Socket.receiveMessage].
    
    To extend the set of control message that can be sent, subclass this
    class and override the `get_size`, `get_level`, `get_type` and `serialize`
    methods.
    
    To extend the set of control messages that can be received, subclass
    this class and implement the `deserialize` method. Also, make sure your
    class is registered with the [gobject.types.size_t] type system before calling
    [gio.socket.Socket.receiveMessage] to read such a message.
*/
class SocketControlMessage : gobject.object.ObjectWrap
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
    return cast(void function())g_socket_control_message_get_type != &gidSymbolNotFound ? g_socket_control_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketControlMessage self()
  {
    return this;
  }

  /**
      Get builder for [gio.socket_control_message.SocketControlMessage]
      Returns: New builder object
  */
  static SocketControlMessageGidBuilder builder()
  {
    return new SocketControlMessageGidBuilder;
  }

  /**
      Tries to deserialize a socket control message of a given
      level and type. This will ask all known (to GType) subclasses
      of #GSocketControlMessage if they can understand this kind
      of message and if so deserialize it into a #GSocketControlMessage.
      
      If there is no implementation for this kind of control message, null
      will be returned.
  
      Params:
        level = a socket level
        type = a socket control message type for the given level
        data = pointer to the message data
      Returns: the deserialized message or null
  */
  static gio.socket_control_message.SocketControlMessage deserialize(int level, int type, ubyte[] data)
  {
    GSocketControlMessage* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = data.ptr ? cast(void*)data.ptr : [ubyte.init].ptr;
    _cretval = g_socket_control_message_deserialize(level, type, _size, _data);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_control_message.SocketControlMessage)(cast(GSocketControlMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the "level" (i.e. the originating protocol) of the control message.
      This is often SOL_SOCKET.
      Returns: an integer describing the level
  */
  int getLevel()
  {
    int _retval;
    _retval = g_socket_control_message_get_level(cast(GSocketControlMessage*)this._cPtr);
    return _retval;
  }

  /**
      Returns the protocol specific type of the control message.
      For instance, for UNIX fd passing this would be SCM_RIGHTS.
      Returns: an integer describing the type of control message
  */
  int getMsgType()
  {
    int _retval;
    _retval = g_socket_control_message_get_msg_type(cast(GSocketControlMessage*)this._cPtr);
    return _retval;
  }

  /**
      Returns the space required for the control message, not including
      headers or alignment.
      Returns: The number of bytes required.
  */
  size_t getSize()
  {
    size_t _retval;
    _retval = g_socket_control_message_get_size(cast(GSocketControlMessage*)this._cPtr);
    return _retval;
  }

  /**
      Converts the data in the message to bytes placed in the
      message.
      
      data is guaranteed to have enough space to fit the size
      returned by [gio.socket_control_message.SocketControlMessage.getSize] on this
      object.
  
      Params:
        data = A buffer to write data to
  */
  void serialize(void* data)
  {
    g_socket_control_message_serialize(cast(GSocketControlMessage*)this._cPtr, data);
  }
}

/// Fluent builder implementation template for [gio.socket_control_message.SocketControlMessage]
class SocketControlMessageGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gio.socket_control_message.SocketControlMessage]
final class SocketControlMessageGidBuilder : SocketControlMessageGidBuilderImpl!SocketControlMessageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SocketControlMessage build()
  {
    return new SocketControlMessage(cast(void*)createGObject(SocketControlMessage._getGType), No.Take);
  }
}
