/// Module for [InetAddress] class
module gid.gio2.inet_address;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.inet_address.InetAddress] represents an IPv4 or IPv6 internet address. Use
    [gid.gio2.resolver.Resolver.lookupByName] or
    [gid.gio2.resolver.Resolver.lookupByNameAsync] to look up the [gid.gio2.inet_address.InetAddress] for
    a hostname. Use [gid.gio2.resolver.Resolver.lookupByAddress] or
    [gid.gio2.resolver.Resolver.lookupByAddressAsync] to look up the hostname for a
    [gid.gio2.inet_address.InetAddress].
    
    To actually connect to a remote host, you will need a
    [gid.gio2.inet_socket_address.InetSocketAddress] (which includes a [gid.gio2.inet_address.InetAddress] as well as a
    port number).
*/
class InetAddress : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_inet_address_get_type != &gidSymbolNotFound ? g_inet_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GInetAddress";
  }

  /** Returns `this`, for use in `with` statements. */
  override InetAddress self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.inet_address.InetAddress]
      Returns: New builder object
  */
  static InetAddressGidBuilder builder() nothrow
  {
    return new InetAddressGidBuilder;
  }

  /**
      Get `bytes` property.
      Returns: The raw address data.
  */
  @property void* bytes() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(void*)("bytes");
  }

  /**
      Get `family` property.
      Returns: The address family (IPv4 or IPv6).
  */
  @property gid.gio2.types.SocketFamily family() nothrow
  {
    return getFamily();
  }

  /**
      Get `flowinfo` property.
      Returns: The flowinfo for an IPv6 address.
        See [gid.gio2.inet_address.InetAddress.getFlowinfo].
  */
  @property uint flowinfo() nothrow
  {
    return getFlowinfo();
  }

  /**
      Get `isAny` property.
      Returns: Whether this is the "any" address for its family.
        See [gid.gio2.inet_address.InetAddress.getIsAny].
  */
  @property bool isAny() nothrow
  {
    return getIsAny();
  }

  /**
      Get `isLinkLocal` property.
      Returns: Whether this is a link-local address.
        See [gid.gio2.inet_address.InetAddress.getIsLinkLocal].
  */
  @property bool isLinkLocal() nothrow
  {
    return getIsLinkLocal();
  }

  /**
      Get `isLoopback` property.
      Returns: Whether this is the loopback address for its family.
        See [gid.gio2.inet_address.InetAddress.getIsLoopback].
  */
  @property bool isLoopback() nothrow
  {
    return getIsLoopback();
  }

  /**
      Get `isMcGlobal` property.
      Returns: Whether this is a global multicast address.
        See [gid.gio2.inet_address.InetAddress.getIsMcGlobal].
  */
  @property bool isMcGlobal() nothrow
  {
    return getIsMcGlobal();
  }

  /**
      Get `isMcLinkLocal` property.
      Returns: Whether this is a link-local multicast address.
        See [gid.gio2.inet_address.InetAddress.getIsMcLinkLocal].
  */
  @property bool isMcLinkLocal() nothrow
  {
    return getIsMcLinkLocal();
  }

  /**
      Get `isMcNodeLocal` property.
      Returns: Whether this is a node-local multicast address.
        See [gid.gio2.inet_address.InetAddress.getIsMcNodeLocal].
  */
  @property bool isMcNodeLocal() nothrow
  {
    return getIsMcNodeLocal();
  }

  /**
      Get `isMcOrgLocal` property.
      Returns: Whether this is an organization-local multicast address.
        See [gid.gio2.inet_address.InetAddress.getIsMcOrgLocal].
  */
  @property bool isMcOrgLocal() nothrow
  {
    return getIsMcOrgLocal();
  }

  /**
      Get `isMcSiteLocal` property.
      Returns: Whether this is a site-local multicast address.
        See [gid.gio2.inet_address.InetAddress.getIsMcSiteLocal].
  */
  @property bool isMcSiteLocal() nothrow
  {
    return getIsMcSiteLocal();
  }

  /**
      Get `isMulticast` property.
      Returns: Whether this is a multicast address.
        See [gid.gio2.inet_address.InetAddress.getIsMulticast].
  */
  @property bool isMulticast() nothrow
  {
    return getIsMulticast();
  }

  /**
      Get `isSiteLocal` property.
      Returns: Whether this is a site-local address.
        See [gid.gio2.inet_address.InetAddress.getIsLoopback].
  */
  @property bool isSiteLocal() nothrow
  {
    return getIsSiteLocal();
  }

  /**
      Get `scopeId` property.
      Returns: The scope-id for an IPv6 address.
        See [gid.gio2.inet_address.InetAddress.getScopeId].
  */
  @property uint scopeId() nothrow
  {
    return getScopeId();
  }

  /**
      Creates a #GInetAddress for the "any" address (unassigned/"don't
      care") for family.
  
      Params:
        family = the address family
      Returns: a new #GInetAddress corresponding to the "any" address
        for family.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  static gid.gio2.inet_address.InetAddress newAny(gid.gio2.types.SocketFamily family) nothrow
  {
    GInetAddress* _cretval;
    _cretval = g_inet_address_new_any(family);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.inet_address.InetAddress)(cast(GInetAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GInetAddress from the given family and bytes.
      bytes should be 4 bytes for [gid.gio2.types.SocketFamily.Ipv4] and 16 bytes for
      [gid.gio2.types.SocketFamily.Ipv6].
  
      Params:
        bytes = raw address data
        family = the address family of bytes
      Returns: a new #GInetAddress corresponding to family and bytes.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  static gid.gio2.inet_address.InetAddress newFromBytes(ubyte[] bytes, gid.gio2.types.SocketFamily family) nothrow
  {
    GInetAddress* _cretval;
    auto _bytes_arr = bytes ~ ubyte.init;
    auto _bytes = _bytes_arr.ptr;
    _cretval = g_inet_address_new_from_bytes(_bytes, family);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.inet_address.InetAddress)(cast(GInetAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gio2.inet_address.InetAddress] from the given family, bytes
      and scope_id.
      
      bytes must be 4 bytes for `enumGio.SocketFamily.IPV4` and 16 bytes for
      `enumGio.SocketFamily.IPV6`.
  
      Params:
        bytes = raw address data
        family = the address family of bytes
        flowinfo = 
        scopeId = the scope-id of the address
      Returns: a new internet address corresponding to
          family, bytes and scope_id
  */
  static gid.gio2.inet_address.InetAddress newFromBytesWithIpv6Info(ubyte[] bytes, gid.gio2.types.SocketFamily family, uint flowinfo, uint scopeId) nothrow
  {
    GInetAddress* _cretval;
    auto _bytes_arr = bytes ~ ubyte.init;
    auto _bytes = _bytes_arr.ptr;
    _cretval = g_inet_address_new_from_bytes_with_ipv6_info(_bytes, family, flowinfo, scopeId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.inet_address.InetAddress)(cast(GInetAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Parses string as an IP address and creates a new #GInetAddress.
      
      If address is an IPv6 address, it can also contain a scope ID
      (separated from the address by a `%`). Note that currently this
      behavior is platform specific. This may change in a future release.
  
      Params:
        string_ = a string representation of an IP address
      Returns: a new #GInetAddress corresponding
        to string, or null if string could not be parsed.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  static gid.gio2.inet_address.InetAddress newFromString(string string_) nothrow
  {
    GInetAddress* _cretval;
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    _cretval = g_inet_address_new_from_string(_string_);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.inet_address.InetAddress)(cast(GInetAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GInetAddress for the loopback address for family.
  
      Params:
        family = the address family
      Returns: a new #GInetAddress corresponding to the loopback address
        for family.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  static gid.gio2.inet_address.InetAddress newLoopback(gid.gio2.types.SocketFamily family) nothrow
  {
    GInetAddress* _cretval;
    _cretval = g_inet_address_new_loopback(family);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.inet_address.InetAddress)(cast(GInetAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if two #GInetAddress instances are equal, e.g. the same address.
  
      Params:
        otherAddress = Another #GInetAddress.
      Returns: true if address and other_address are equal, false otherwise.
  */
  bool equal(gid.gio2.inet_address.InetAddress otherAddress) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_equal(cast(GInetAddress*)this._cPtr, otherAddress ? cast(GInetAddress*)otherAddress._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets address's family
      Returns: address's family
  */
  gid.gio2.types.SocketFamily getFamily() nothrow
  {
    GSocketFamily _cretval;
    _cretval = g_inet_address_get_family(cast(GInetAddress*)this._cPtr);
    gid.gio2.types.SocketFamily _retval = cast(gid.gio2.types.SocketFamily)_cretval;
    return _retval;
  }

  /**
      Gets the value of [gid.gio2.inet_address.InetAddress.flowinfo].
      Returns: The flowinfo for the address, `0` if unset or not IPv6 address.
  */
  uint getFlowinfo() nothrow
  {
    uint _retval;
    _retval = g_inet_address_get_flowinfo(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is the "any" address for its family.
      Returns: true if address is the "any" address for its family.
  */
  bool getIsAny() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_any(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a link-local address (that is, if it
      identifies a host on a local network that is not connected to the
      Internet).
      Returns: true if address is a link-local address.
  */
  bool getIsLinkLocal() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_link_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is the loopback address for its family.
      Returns: true if address is the loopback address for its family.
  */
  bool getIsLoopback() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_loopback(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a global multicast address.
      Returns: true if address is a global multicast address.
  */
  bool getIsMcGlobal() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_mc_global(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a link-local multicast address.
      Returns: true if address is a link-local multicast address.
  */
  bool getIsMcLinkLocal() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_mc_link_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a node-local multicast address.
      Returns: true if address is a node-local multicast address.
  */
  bool getIsMcNodeLocal() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_mc_node_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is an organization-local multicast address.
      Returns: true if address is an organization-local multicast address.
  */
  bool getIsMcOrgLocal() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_mc_org_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a site-local multicast address.
      Returns: true if address is a site-local multicast address.
  */
  bool getIsMcSiteLocal() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_mc_site_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a multicast address.
      Returns: true if address is a multicast address.
  */
  bool getIsMulticast() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_multicast(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a site-local address such as 10.0.0.1
      (that is, the address identifies a host on a local network that can
      not be reached directly from the Internet, but which may have
      outgoing Internet connectivity via a NAT or firewall).
      Returns: true if address is a site-local address.
  */
  bool getIsSiteLocal() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_site_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size of the native raw binary address for address. This
      is the size of the data that you get from [gid.gio2.inet_address.InetAddress.toBytes].
      Returns: the number of bytes used for the native version of address.
  */
  size_t getNativeSize() nothrow
  {
    size_t _retval;
    _retval = g_inet_address_get_native_size(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of [gid.gio2.inet_address.InetAddress.scopeId].
      Returns: The scope-id for the address, `0` if unset or not IPv6 address.
  */
  uint getScopeId() nothrow
  {
    uint _retval;
    _retval = g_inet_address_get_scope_id(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Converts address to string form.
      Returns: a representation of address as a string, which should be
        freed after use.
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = g_inet_address_to_string(cast(GInetAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.inet_address.InetAddress]
class InetAddressGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `bytes` property.
      Params:
        propval = The raw address data.
      Returns: Builder instance for fluent chaining
  */
  T bytes(void* propval) nothrow
  {
    return setProperty("bytes", propval);
  }

  /**
      Set `family` property.
      Params:
        propval = The address family (IPv4 or IPv6).
      Returns: Builder instance for fluent chaining
  */
  T family(gid.gio2.types.SocketFamily propval) nothrow
  {
    return setProperty("family", propval);
  }

  /**
      Set `flowinfo` property.
      Params:
        propval = The flowinfo for an IPv6 address.
          See [gid.gio2.inet_address.InetAddress.getFlowinfo].
      Returns: Builder instance for fluent chaining
  */
  T flowinfo(uint propval) nothrow
  {
    return setProperty("flowinfo", propval);
  }

  /**
      Set `scopeId` property.
      Params:
        propval = The scope-id for an IPv6 address.
          See [gid.gio2.inet_address.InetAddress.getScopeId].
      Returns: Builder instance for fluent chaining
  */
  T scopeId(uint propval) nothrow
  {
    return setProperty("scope-id", propval);
  }
}

/// Fluent builder for [gid.gio2.inet_address.InetAddress]
final class InetAddressGidBuilder : InetAddressGidBuilderImpl!InetAddressGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InetAddress build() nothrow
  {
    return new InetAddress(cast(void*)createGObject(InetAddress._getGType), Yes.Take);
  }
}
