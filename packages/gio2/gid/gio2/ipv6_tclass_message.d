/// Module for [IPv6TclassMessage] class
module gid.gio2.ipv6_tclass_message;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.socket_control_message;
import gid.gio2.types;
import gid.gobject2.gid_builder;

/**
    Contains the Traffic Class byte of an IPv6 header.
    
    This consists of the DSCP field as per
    [RFC 2474](https://www.rfc-editor.org/rfc/rfc2474#section-3),
    and the ECN field as per
    [RFC 3168](https://www.rfc-editor.org/rfc/rfc3168#section-5).
    
    It may be received using [gid.gio2.socket.Socket.receiveMessage] over UDP sockets
    (i.e. sockets in the [gid.gio2.types.SocketFamily.Ipv6] family with
    [gid.gio2.types.SocketType.Datagram] type). The message is not meant for sending. To set
    Traffic Class field to be used in datagrams sent on a [gid.gio2.socket.Socket] use:
    ```c
    g_socket_set_option (socket, IPPROTO_IPV6, IPV6_TCLASS, <TC value>, &error);
    ```
*/
@gidGir("IPv6TclassMessage", "IPv6TclassMessageClass")
class IPv6TclassMessage : gid.gio2.socket_control_message.SocketControlMessage
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
    return cast(void function())g_ipv6_tclass_message_get_type != &gidSymbolNotFound ? g_ipv6_tclass_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GIPv6TclassMessage";
  }

  /** Returns `this`, for use in `with` statements. */
  override IPv6TclassMessage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.ipv6_tclass_message.IPv6TclassMessage]
      Returns: New builder object
  */
  static IPv6TclassMessageGidBuilder builder() nothrow
  {
    return new IPv6TclassMessageGidBuilder;
  }

  /**
      Creates a new traffic class message with given DSCP and ECN values.
  
      Params:
        dscp = the DSCP value of the message
        ecn = the ECN value of the message
      Returns: a new traffic class message
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
      _cretval = g_ipv6_tclass_message_new(dscp, ecn);
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
    _retval = g_ipv6_tclass_message_get_dscp(cast(GIPv6TclassMessage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the Explicit Congestion Notification code point stored in message.
      Returns: An ECN value as described in [RFC 3168](https://www.rfc-editor.org/rfc/rfc3168#section-5).
  */
  gid.gio2.types.EcnCodePoint getEcn() nothrow
  {
    GEcnCodePoint _cretval;
    _cretval = g_ipv6_tclass_message_get_ecn(cast(GIPv6TclassMessage*)this._cPtr);
    gid.gio2.types.EcnCodePoint _retval = cast(gid.gio2.types.EcnCodePoint)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.ipv6_tclass_message.IPv6TclassMessage]
class IPv6TclassMessageGidBuilderImpl(T) : gid.gio2.socket_control_message.SocketControlMessageGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.ipv6_tclass_message.IPv6TclassMessage]
final class IPv6TclassMessageGidBuilder : IPv6TclassMessageGidBuilderImpl!IPv6TclassMessageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IPv6TclassMessage build() nothrow
  {
    return new IPv6TclassMessage(cast(void*)createGObject(IPv6TclassMessage._getGType), Yes.Take);
  }
}
