/// Module for [IPTosMessage] class
module gio.iptos_message;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_control_message;
import gio.types;
import gobject.gid_builder;

/**
    Contains the type of service (ToS) byte of an IPv4 header.
    
    This consists of the DSCP field as per
    [RFC 2474](https://www.rfc-editor.org/rfc/rfc2474#section-3),
    and the ECN field as per
    [RFC 3168](https://www.rfc-editor.org/rfc/rfc3168#section-5).
    
    It may be received using [gio.socket.Socket.receiveMessage] over UDP sockets
    (i.e. sockets in the [gio.types.SocketFamily.Ipv4] family with
    [gio.types.SocketType.Datagram] type). The message is not meant for sending. To set
    ToS field to be used in datagrams sent on a [gio.socket.Socket] use:
    ```c
    g_socket_set_option (socket, IPPROTO_IP, IP_TOS, <ToS value>, &error);
    ```
*/
class IPTosMessage : gio.socket_control_message.SocketControlMessage
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_ip_tos_message_get_type != &gidSymbolNotFound ? g_ip_tos_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IPTosMessage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gio.iptos_message.IPTosMessage]
      Returns: New builder object
  */
  static IPTosMessageGidBuilder builder() nothrow
  {
    return new IPTosMessageGidBuilder;
  }

  /**
      Creates a new type-of-service message with given DSCP and ECN values.
  
      Params:
        dscp = the DSCP value of the message
        ecn = the ECN value of the message
      Returns: a new type-of-service message
  */
  this(ubyte dscp, gio.types.EcnCodePoint ecn) nothrow
  {
    GSocketControlMessage* _cretval;
    _cretval = g_ip_tos_message_new(dscp, ecn);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the differentiated services code point stored in message.
      Returns: A DSCP value as described in [RFC 2474](https://www.rfc-editor.org/rfc/rfc2474.html#section-3).
  */
  ubyte getDscp() nothrow
  {
    ubyte _retval;
    _retval = g_ip_tos_message_get_dscp(cast(GIPTosMessage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the Explicit Congestion Notification code point stored in message.
      Returns: An ECN value as described in [RFC 3168](https://www.rfc-editor.org/rfc/rfc3168#section-5).
  */
  gio.types.EcnCodePoint getEcn() nothrow
  {
    GEcnCodePoint _cretval;
    _cretval = g_ip_tos_message_get_ecn(cast(GIPTosMessage*)this._cPtr);
    gio.types.EcnCodePoint _retval = cast(gio.types.EcnCodePoint)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gio.iptos_message.IPTosMessage]
class IPTosMessageGidBuilderImpl(T) : gio.socket_control_message.SocketControlMessageGidBuilderImpl!T
{
}

/// Fluent builder for [gio.iptos_message.IPTosMessage]
final class IPTosMessageGidBuilder : IPTosMessageGidBuilderImpl!IPTosMessageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IPTosMessage build() nothrow
  {
    return new IPTosMessage(cast(void*)createGObject(IPTosMessage._getGType), Yes.Take);
  }
}
