/// Module for [NetworkAddress] class
module gio.network_address;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_connectable;
import gio.socket_connectable_mixin;
import gio.types;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.network_address.NetworkAddress] provides an easy way to resolve a hostname and
    then attempt to connect to that host, handling the possibility of
    multiple IP addresses and multiple address families.
    
    The enumeration results of resolved addresses *may* be cached as long
    as this object is kept alive which may have unexpected results if
    alive for too long.
    
    See [gio.socket_connectable.SocketConnectable] for an example of using the connectable
    interface.
*/
class NetworkAddress : gobject.object.ObjectWrap, gio.socket_connectable.SocketConnectable
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
    return cast(void function())g_network_address_get_type != &gidSymbolNotFound ? g_network_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NetworkAddress self()
  {
    return this;
  }

  /**
      Get builder for [gio.network_address.NetworkAddress]
      Returns: New builder object
  */
  static NetworkAddressGidBuilder builder()
  {
    return new NetworkAddressGidBuilder;
  }

  /**
      Get `hostname` property.
      Returns: Hostname to resolve.
  */
  @property string hostname()
  {
    return getHostname();
  }

  /**
      Get `port` property.
      Returns: Network port.
  */
  @property uint port()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("port");
  }

  /**
      Get `scheme` property.
      Returns: URI scheme.
  */
  @property string scheme()
  {
    return getScheme();
  }

  mixin SocketConnectableT!();

  /**
      Creates a new #GSocketConnectable for connecting to the given
      hostname and port.
      
      Note that depending on the configuration of the machine, a
      hostname of `localhost` may refer to the IPv4 loopback address
      only, or to both IPv4 and IPv6; use
      [gio.network_address.NetworkAddress.newLoopback] to create a #GNetworkAddress that
      is guaranteed to resolve to both addresses.
  
      Params:
        hostname = the hostname
        port = the port
      Returns: the new #GNetworkAddress
  */
  this(string hostname, ushort port)
  {
    GSocketConnectable* _cretval;
    const(char)* _hostname = hostname.toCString(No.Alloc);
    _cretval = g_network_address_new(_hostname, port);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GSocketConnectable for connecting to the local host
      over a loopback connection to the given port. This is intended for
      use in connecting to local services which may be running on IPv4 or
      IPv6.
      
      The connectable will return IPv4 and IPv6 loopback addresses,
      regardless of how the host resolves `localhost`. By contrast,
      [gio.network_address.NetworkAddress.new_] will often only return an IPv4 address when
      resolving `localhost`, and an IPv6 address for `localhost6`.
      
      [gio.network_address.NetworkAddress.getHostname] will always return `localhost` for
      a #GNetworkAddress created with this constructor.
  
      Params:
        port = the port
      Returns: the new #GNetworkAddress
  */
  static gio.network_address.NetworkAddress newLoopback(ushort port)
  {
    GSocketConnectable* _cretval;
    _cretval = g_network_address_new_loopback(port);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.network_address.NetworkAddress)(cast(GSocketConnectable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GSocketConnectable for connecting to the given
      hostname and port. May fail and return null in case
      parsing host_and_port fails.
      
      host_and_port may be in any of a number of recognised formats; an IPv6
      address, an IPv4 address, or a domain name (in which case a DNS
      lookup is performed). Quoting with [] is supported for all address
      types. A port override may be specified in the usual way with a
      colon.
      
      If no port is specified in host_and_port then default_port will be
      used as the port number to connect to.
      
      In general, host_and_port is expected to be provided by the user
      (allowing them to give the hostname, and a port override if necessary)
      and default_port is expected to be provided by the application.
      
      (The port component of host_and_port can also be specified as a
      service name rather than as a numeric port, but this functionality
      is deprecated, because it depends on the contents of /etc/services,
      which is generally quite sparse on platforms other than Linux.)
  
      Params:
        hostAndPort = the hostname and optionally a port
        defaultPort = the default port if not in host_and_port
      Returns: the new
          #GNetworkAddress, or null on error
      Throws: [ErrorWrap]
  */
  static gio.network_address.NetworkAddress parse(string hostAndPort, ushort defaultPort)
  {
    GSocketConnectable* _cretval;
    const(char)* _hostAndPort = hostAndPort.toCString(No.Alloc);
    GError *_err;
    _cretval = g_network_address_parse(_hostAndPort, defaultPort, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.network_address.NetworkAddress)(cast(GSocketConnectable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GSocketConnectable for connecting to the given
      uri. May fail and return null in case parsing uri fails.
      
      Using this rather than [gio.network_address.NetworkAddress.new_] or
      [gio.network_address.NetworkAddress.parse] allows #GSocketClient to determine
      when to use application-specific proxy protocols.
  
      Params:
        uri = the hostname and optionally a port
        defaultPort = The default port if none is found in the URI
      Returns: the new
          #GNetworkAddress, or null on error
      Throws: [ErrorWrap]
  */
  static gio.network_address.NetworkAddress parseUri(string uri, ushort defaultPort)
  {
    GSocketConnectable* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_network_address_parse_uri(_uri, defaultPort, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.network_address.NetworkAddress)(cast(GSocketConnectable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets addr's hostname. This might be either UTF-8 or ASCII-encoded,
      depending on what addr was created with.
      Returns: addr's hostname
  */
  string getHostname()
  {
    const(char)* _cretval;
    _cretval = g_network_address_get_hostname(cast(GNetworkAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets addr's port number
      Returns: addr's port (which may be 0)
  */
  ushort getPort()
  {
    ushort _retval;
    _retval = g_network_address_get_port(cast(GNetworkAddress*)this._cPtr);
    return _retval;
  }

  /**
      Gets addr's scheme
      Returns: addr's scheme (null if not built from URI)
  */
  string getScheme()
  {
    const(char)* _cretval;
    _cretval = g_network_address_get_scheme(cast(GNetworkAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gio.network_address.NetworkAddress]
class NetworkAddressGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.socket_connectable.SocketConnectableGidBuilderImpl!T
{

  mixin SocketConnectableGidBuilderT!();

  /**
      Set `hostname` property.
      Params:
        propval = Hostname to resolve.
      Returns: Builder instance for fluent chaining
  */
  T hostname(string propval)
  {
    return setProperty("hostname", propval);
  }

  /**
      Set `port` property.
      Params:
        propval = Network port.
      Returns: Builder instance for fluent chaining
  */
  T port(uint propval)
  {
    return setProperty("port", propval);
  }

  /**
      Set `scheme` property.
      Params:
        propval = URI scheme.
      Returns: Builder instance for fluent chaining
  */
  T scheme(string propval)
  {
    return setProperty("scheme", propval);
  }
}

/// Fluent builder for [gio.network_address.NetworkAddress]
final class NetworkAddressGidBuilder : NetworkAddressGidBuilderImpl!NetworkAddressGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NetworkAddress build()
  {
    return new NetworkAddress(cast(void*)createGObject(NetworkAddress._getGType), Yes.Take);
  }
}
