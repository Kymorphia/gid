/// Module for [InetSocketAddress] class
module gio.inet_socket_address;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.inet_address;
import gio.socket_address;
import gio.socket_connectable;
import gio.socket_connectable_mixin;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    An IPv4 or IPv6 socket address. That is, the combination of a
    [gio.inet_address.InetAddress] and a port number.
    
    In UNIX terms, [gio.inet_socket_address.InetSocketAddress] corresponds to a
    [`struct sockaddr_in` or `struct sockaddr_in6`](man:sockaddr(3type)).
*/
class InetSocketAddress : gio.socket_address.SocketAddress
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
    return cast(void function())g_inet_socket_address_get_type != &gidSymbolNotFound ? g_inet_socket_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InetSocketAddress self()
  {
    return this;
  }

  /**
      Get builder for [gio.inet_socket_address.InetSocketAddress]
      Returns: New builder object
  */
  static InetSocketAddressGidBuilder builder()
  {
    return new InetSocketAddressGidBuilder;
  }

  /**
      Get `address` property.
      Returns: The address.
  */
  @property gio.inet_address.InetAddress address()
  {
    return getAddress();
  }

  /**
      Get `flowinfo` property.
      Returns: The `sin6_flowinfo` field, for IPv6 addresses.
  */
  @property uint flowinfo()
  {
    return getFlowinfo();
  }

  /**
      Get `port` property.
      Returns: The port.
  */
  @property uint port()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("port");
  }

  /**
      Get `scopeId` property.
      Returns: The `sin6_scope_id` field, for IPv6 addresses.
  */
  @property uint scopeId()
  {
    return getScopeId();
  }

  /**
      Creates a new #GInetSocketAddress for address and port.
  
      Params:
        address = a #GInetAddress
        port = a port number
      Returns: a new #GInetSocketAddress
  */
  this(gio.inet_address.InetAddress address, ushort port)
  {
    GSocketAddress* _cretval;
    _cretval = g_inet_socket_address_new(address ? cast(GInetAddress*)address._cPtr(No.Dup) : null, port);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GInetSocketAddress for address and port.
      
      If address is an IPv6 address, it can also contain a scope ID
      (separated from the address by a `%`).
  
      Params:
        address = the string form of an IP address
        port = a port number
      Returns: a new #GInetSocketAddress,
        or null if address cannot be parsed.
  */
  static gio.inet_socket_address.InetSocketAddress newFromString(string address, uint port)
  {
    GSocketAddress* _cretval;
    const(char)* _address = address.toCString(No.Alloc);
    _cretval = g_inet_socket_address_new_from_string(_address, port);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.inet_socket_address.InetSocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets address's #GInetAddress.
      Returns: the #GInetAddress for address, which must be
        [gobject.object.ObjectWrap.ref_]'d if it will be stored
  */
  gio.inet_address.InetAddress getAddress()
  {
    GInetAddress* _cretval;
    _cretval = g_inet_socket_address_get_address(cast(GInetSocketAddress*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.inet_address.InetAddress)(cast(GInetAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the `sin6_flowinfo` field from address,
      which must be an IPv6 address.
      Returns: the flowinfo field
  */
  uint getFlowinfo()
  {
    uint _retval;
    _retval = g_inet_socket_address_get_flowinfo(cast(GInetSocketAddress*)this._cPtr);
    return _retval;
  }

  /**
      Gets address's port.
      Returns: the port for address
  */
  ushort getPort()
  {
    ushort _retval;
    _retval = g_inet_socket_address_get_port(cast(GInetSocketAddress*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `sin6_scope_id` field from address,
      which must be an IPv6 address.
      Returns: the scope id field
  */
  uint getScopeId()
  {
    uint _retval;
    _retval = g_inet_socket_address_get_scope_id(cast(GInetSocketAddress*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gio.inet_socket_address.InetSocketAddress]
class InetSocketAddressGidBuilderImpl(T) : gio.socket_address.SocketAddressGidBuilderImpl!T
{


  /**
      Set `address` property.
      Params:
        propval = The address.
      Returns: Builder instance for fluent chaining
  */
  T address(gio.inet_address.InetAddress propval)
  {
    return setProperty("address", propval);
  }

  /**
      Set `flowinfo` property.
      Params:
        propval = The `sin6_flowinfo` field, for IPv6 addresses.
      Returns: Builder instance for fluent chaining
  */
  T flowinfo(uint propval)
  {
    return setProperty("flowinfo", propval);
  }

  /**
      Set `port` property.
      Params:
        propval = The port.
      Returns: Builder instance for fluent chaining
  */
  T port(uint propval)
  {
    return setProperty("port", propval);
  }

  /**
      Set `scopeId` property.
      Params:
        propval = The `sin6_scope_id` field, for IPv6 addresses.
      Returns: Builder instance for fluent chaining
  */
  T scopeId(uint propval)
  {
    return setProperty("scope-id", propval);
  }
}

/// Fluent builder for [gio.inet_socket_address.InetSocketAddress]
final class InetSocketAddressGidBuilder : InetSocketAddressGidBuilderImpl!InetSocketAddressGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InetSocketAddress build()
  {
    return new InetSocketAddress(cast(void*)createGObject(InetSocketAddress._getGType), Yes.Take);
  }
}
