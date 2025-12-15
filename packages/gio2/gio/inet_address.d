/// Module for [InetAddress] class
module gio.inet_address;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.object;

/**
    [gio.inet_address.InetAddress] represents an IPv4 or IPv6 internet address. Use
    [gio.resolver.Resolver.lookupByName] or
    [gio.resolver.Resolver.lookupByNameAsync] to look up the [gio.inet_address.InetAddress] for
    a hostname. Use [gio.resolver.Resolver.lookupByAddress] or
    [gio.resolver.Resolver.lookupByAddressAsync] to look up the hostname for a
    [gio.inet_address.InetAddress].
    
    To actually connect to a remote host, you will need a
    [gio.inet_socket_address.InetSocketAddress] (which includes a [gio.inet_address.InetAddress] as well as a
    port number).
*/
class InetAddress : gobject.object.ObjectWrap
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
    return cast(void function())g_inet_address_get_type != &gidSymbolNotFound ? g_inet_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InetAddress self()
  {
    return this;
  }

  /**
      Get `isAny` property.
      Returns: Whether this is the "any" address for its family.
      See [gio.inet_address.InetAddress.getIsAny].
  */
  @property bool isAny()
  {
    return getIsAny();
  }

  /**
      Get `isLinkLocal` property.
      Returns: Whether this is a link-local address.
      See [gio.inet_address.InetAddress.getIsLinkLocal].
  */
  @property bool isLinkLocal()
  {
    return getIsLinkLocal();
  }

  /**
      Get `isLoopback` property.
      Returns: Whether this is the loopback address for its family.
      See [gio.inet_address.InetAddress.getIsLoopback].
  */
  @property bool isLoopback()
  {
    return getIsLoopback();
  }

  /**
      Get `isMcGlobal` property.
      Returns: Whether this is a global multicast address.
      See [gio.inet_address.InetAddress.getIsMcGlobal].
  */
  @property bool isMcGlobal()
  {
    return getIsMcGlobal();
  }

  /**
      Get `isMcLinkLocal` property.
      Returns: Whether this is a link-local multicast address.
      See [gio.inet_address.InetAddress.getIsMcLinkLocal].
  */
  @property bool isMcLinkLocal()
  {
    return getIsMcLinkLocal();
  }

  /**
      Get `isMcNodeLocal` property.
      Returns: Whether this is a node-local multicast address.
      See [gio.inet_address.InetAddress.getIsMcNodeLocal].
  */
  @property bool isMcNodeLocal()
  {
    return getIsMcNodeLocal();
  }

  /**
      Get `isMcOrgLocal` property.
      Returns: Whether this is an organization-local multicast address.
      See [gio.inet_address.InetAddress.getIsMcOrgLocal].
  */
  @property bool isMcOrgLocal()
  {
    return getIsMcOrgLocal();
  }

  /**
      Get `isMcSiteLocal` property.
      Returns: Whether this is a site-local multicast address.
      See [gio.inet_address.InetAddress.getIsMcSiteLocal].
  */
  @property bool isMcSiteLocal()
  {
    return getIsMcSiteLocal();
  }

  /**
      Get `isMulticast` property.
      Returns: Whether this is a multicast address.
      See [gio.inet_address.InetAddress.getIsMulticast].
  */
  @property bool isMulticast()
  {
    return getIsMulticast();
  }

  /**
      Get `isSiteLocal` property.
      Returns: Whether this is a site-local address.
      See [gio.inet_address.InetAddress.getIsLoopback].
  */
  @property bool isSiteLocal()
  {
    return getIsSiteLocal();
  }

  /**
      Creates a #GInetAddress for the "any" address (unassigned/"don't
      care") for family.
  
      Params:
        family = the address family
      Returns: a new #GInetAddress corresponding to the "any" address
        for family.
            Free the returned object with [gobject.object.ObjectWrap.unref].
  */
  static gio.inet_address.InetAddress newAny(gio.types.SocketFamily family)
  {
    GInetAddress* _cretval;
    _cretval = g_inet_address_new_any(family);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.inet_address.InetAddress)(cast(GInetAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GInetAddress from the given family and bytes.
      bytes should be 4 bytes for [gio.types.SocketFamily.Ipv4] and 16 bytes for
      [gio.types.SocketFamily.Ipv6].
  
      Params:
        bytes = raw address data
        family = the address family of bytes
      Returns: a new #GInetAddress corresponding to family and bytes.
            Free the returned object with [gobject.object.ObjectWrap.unref].
  */
  static gio.inet_address.InetAddress newFromBytes(ubyte[] bytes, gio.types.SocketFamily family)
  {
    GInetAddress* _cretval;
    auto _bytes = cast(const(ubyte)*)(bytes ~ ubyte.init).ptr;
    _cretval = g_inet_address_new_from_bytes(_bytes, family);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.inet_address.InetAddress)(cast(GInetAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Parses string as an IP address and creates a new #GInetAddress.
  
      Params:
        string_ = a string representation of an IP address
      Returns: a new #GInetAddress corresponding
        to string, or null if string could not be parsed.
            Free the returned object with [gobject.object.ObjectWrap.unref].
  */
  static gio.inet_address.InetAddress newFromString(string string_)
  {
    GInetAddress* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = g_inet_address_new_from_string(_string_);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.inet_address.InetAddress)(cast(GInetAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GInetAddress for the loopback address for family.
  
      Params:
        family = the address family
      Returns: a new #GInetAddress corresponding to the loopback address
        for family.
            Free the returned object with [gobject.object.ObjectWrap.unref].
  */
  static gio.inet_address.InetAddress newLoopback(gio.types.SocketFamily family)
  {
    GInetAddress* _cretval;
    _cretval = g_inet_address_new_loopback(family);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.inet_address.InetAddress)(cast(GInetAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if two #GInetAddress instances are equal, e.g. the same address.
  
      Params:
        otherAddress = Another #GInetAddress.
      Returns: true if address and other_address are equal, false otherwise.
  */
  bool equal(gio.inet_address.InetAddress otherAddress)
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_equal(cast(GInetAddress*)this._cPtr, otherAddress ? cast(GInetAddress*)otherAddress._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets address's family
      Returns: address's family
  */
  gio.types.SocketFamily getFamily()
  {
    GSocketFamily _cretval;
    _cretval = g_inet_address_get_family(cast(GInetAddress*)this._cPtr);
    gio.types.SocketFamily _retval = cast(gio.types.SocketFamily)_cretval;
    return _retval;
  }

  /**
      Tests whether address is the "any" address for its family.
      Returns: true if address is the "any" address for its family.
  */
  bool getIsAny()
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
  bool getIsLinkLocal()
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_link_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is the loopback address for its family.
      Returns: true if address is the loopback address for its family.
  */
  bool getIsLoopback()
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_loopback(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a global multicast address.
      Returns: true if address is a global multicast address.
  */
  bool getIsMcGlobal()
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_mc_global(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a link-local multicast address.
      Returns: true if address is a link-local multicast address.
  */
  bool getIsMcLinkLocal()
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_mc_link_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a node-local multicast address.
      Returns: true if address is a node-local multicast address.
  */
  bool getIsMcNodeLocal()
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_mc_node_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is an organization-local multicast address.
      Returns: true if address is an organization-local multicast address.
  */
  bool getIsMcOrgLocal()
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_mc_org_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a site-local multicast address.
      Returns: true if address is a site-local multicast address.
  */
  bool getIsMcSiteLocal()
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_mc_site_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether address is a multicast address.
      Returns: true if address is a multicast address.
  */
  bool getIsMulticast()
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
  bool getIsSiteLocal()
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_get_is_site_local(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size of the native raw binary address for address. This
      is the size of the data that you get from [gio.inet_address.InetAddress.toBytes].
      Returns: the number of bytes used for the native version of address.
  */
  size_t getNativeSize()
  {
    size_t _retval;
    _retval = g_inet_address_get_native_size(cast(GInetAddress*)this._cPtr);
    return _retval;
  }

  /**
      Converts address to string form.
      Returns: a representation of address as a string, which should be
        freed after use.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = g_inet_address_to_string(cast(GInetAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
