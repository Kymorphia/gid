/// Module for [IPTosMessage] class
module gid.gio2.iptos_message;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.socket_control_message;
import gid.gio2.types;
import gid.gobject2.gid_builder;

/**
    Contains the type of service (ToS) byte of an IPv4 header.
    
    This consists of the DSCP field as per
    [RFC 2474](https://www.rfc-editor.org/rfc/rfc2474#section-3),
    and the ECN field as per
    [RFC 3168](https://www.rfc-editor.org/rfc/rfc3168#section-5).
    
    It may be received using [gid.gio2.socket.Socket.receiveMessage] over UDP sockets
    (i.e. sockets in the [gid.gio2.types.SocketFamily.Ipv4] family with
    [gid.gio2.types.SocketType.Datagram] type). The message is not meant for sending. To set
    ToS field to be used in datagrams sent on a [gid.gio2.socket.Socket] use:
    ```c
    g_socket_set_option (socket, IPPROTO_IP, IP_TOS, <ToS value>, &error);
    ```
*/
@gidGir("IPTosMessage", "IPTosMessageClass")
class IPTosMessage : gid.gio2.socket_control_message.SocketControlMessage
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
    return cast(void function())g_ip_tos_message_get_type != &gidSymbolNotFound ? g_ip_tos_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GIPTosMessage";
  }

  /** Returns `this`, for use in `with` statements. */
  override IPTosMessage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.iptos_message.IPTosMessage]
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
  this(ubyte dscp, gid.gio2.types.EcnCodePoint ecn) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GSocketControlMessage* _cretval;
      _cretval = g_ip_tos_message_new(dscp, ecn);
      this(_cretval, Yes.Take);
    }
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
  gid.gio2.types.EcnCodePoint getEcn() nothrow
  {
    GEcnCodePoint _cretval;
    _cretval = g_ip_tos_message_get_ecn(cast(GIPTosMessage*)this._cPtr);
    gid.gio2.types.EcnCodePoint _retval = cast(gid.gio2.types.EcnCodePoint)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.iptos_message.IPTosMessage]
class IPTosMessageGidBuilderImpl(T) : gid.gio2.socket_control_message.SocketControlMessageGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.iptos_message.IPTosMessage]
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
