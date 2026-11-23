/// Module for [ProxyAddress] class
module gid.gio2.proxy_address;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.inet_address;
import gid.gio2.inet_socket_address;
import gid.gio2.socket_connectable;
import gid.gio2.socket_connectable_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.inet_socket_address.InetSocketAddress] representing a connection via a proxy server.
*/
class ProxyAddress : gid.gio2.inet_socket_address.InetSocketAddress
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
    return cast(void function())g_proxy_address_get_type != &gidSymbolNotFound ? g_proxy_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GProxyAddress";
  }

  /** Returns `this`, for use in `with` statements. */
  override ProxyAddress self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.proxy_address.ProxyAddress]
      Returns: New builder object
  */
  static ProxyAddressGidBuilder builder() nothrow
  {
    return new ProxyAddressGidBuilder;
  }

  /**
      Get `destinationHostname` property.
      Returns: The proxy destination hostname.
  */
  @property string destinationHostname() nothrow
  {
    return getDestinationHostname();
  }

  /**
      Get `destinationPort` property.
      Returns: The proxy destination port.
  */
  @property uint destinationPort() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("destination-port");
  }

  /**
      Get `destinationProtocol` property.
      Returns: The protocol being spoke to the destination host, or null if
        the #GProxyAddress doesn't know.
  */
  @property string destinationProtocol() nothrow
  {
    return getDestinationProtocol();
  }

  /**
      Get `password` property.
      Returns: The proxy password.
  */
  @property string password() nothrow
  {
    return getPassword();
  }

  /**
      Get `protocol` property.
      Returns: The proxy protocol.
  */
  @property string protocol() nothrow
  {
    return getProtocol();
  }

  /**
      Get `uri` property.
      Returns: The URI string that the proxy was constructed from (or null
        if the creator didn't specify this).
  */
  @property string uri() nothrow
  {
    return getUri();
  }

  /**
      Get `username` property.
      Returns: The proxy username.
  */
  @property string username() nothrow
  {
    return getUsername();
  }

  /**
      Creates a new #GProxyAddress for inetaddr with protocol that should
      tunnel through dest_hostname and dest_port.
      
      (Note that this method doesn't set the #GProxyAddress:uri or
      #GProxyAddress:destination-protocol fields; use [gid.gobject2.object.ObjectWrap.new_]
      directly if you want to set those.)
  
      Params:
        inetaddr = The proxy server #GInetAddress.
        port = The proxy server port.
        protocol = The proxy protocol to support, in lower case (e.g. socks, http).
        destHostname = The destination hostname the proxy should tunnel to.
        destPort = The destination port to tunnel to.
        username = The username to authenticate to the proxy server
              (or null).
        password = The password to authenticate to the proxy server
              (or null).
      Returns: a new #GProxyAddress
  */
  this(gid.gio2.inet_address.InetAddress inetaddr, ushort port, string protocol, string destHostname, ushort destPort, string username = null, string password = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GSocketAddress* _cretval;
      const(char)* _protocol = protocol.toCString!(No.Malloc, No.Nullable);
      const(char)* _destHostname = destHostname.toCString!(No.Malloc, No.Nullable);
      const(char)* _username = username.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _password = password.toCString!(No.Malloc, Yes.Nullable);
      _cretval = g_proxy_address_new(inetaddr ? cast(GInetAddress*)inetaddr._cPtr(No.Dup) : null, port, _protocol, _destHostname, destPort, _username, _password);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets proxy's destination hostname; that is, the name of the host
      that will be connected to via the proxy, not the name of the proxy
      itself.
      Returns: the proxy's destination hostname
  */
  string getDestinationHostname() nothrow
  {
    const(char)* _cretval;
    _cretval = g_proxy_address_get_destination_hostname(cast(GProxyAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets proxy's destination port; that is, the port on the
      destination host that will be connected to via the proxy, not the
      port number of the proxy itself.
      Returns: the proxy's destination port
  */
  ushort getDestinationPort() nothrow
  {
    ushort _retval;
    _retval = g_proxy_address_get_destination_port(cast(GProxyAddress*)this._cPtr);
    return _retval;
  }

  /**
      Gets the protocol that is being spoken to the destination
      server; eg, "http" or "ftp".
      Returns: the proxy's destination protocol
  */
  string getDestinationProtocol() nothrow
  {
    const(char)* _cretval;
    _cretval = g_proxy_address_get_destination_protocol(cast(GProxyAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets proxy's password.
      Returns: the proxy's password
  */
  string getPassword() nothrow
  {
    const(char)* _cretval;
    _cretval = g_proxy_address_get_password(cast(GProxyAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets proxy's protocol. eg, "socks" or "http"
      Returns: the proxy's protocol
  */
  string getProtocol() nothrow
  {
    const(char)* _cretval;
    _cretval = g_proxy_address_get_protocol(cast(GProxyAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the proxy URI that proxy was constructed from.
      Returns: the proxy's URI, or null if unknown
  */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = g_proxy_address_get_uri(cast(GProxyAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets proxy's username.
      Returns: the proxy's username
  */
  string getUsername() nothrow
  {
    const(char)* _cretval;
    _cretval = g_proxy_address_get_username(cast(GProxyAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.proxy_address.ProxyAddress]
class ProxyAddressGidBuilderImpl(T) : gid.gio2.inet_socket_address.InetSocketAddressGidBuilderImpl!T
{


  /**
      Set `destinationHostname` property.
      Params:
        propval = The proxy destination hostname.
      Returns: Builder instance for fluent chaining
  */
  T destinationHostname(string propval) nothrow
  {
    return setProperty("destination-hostname", propval);
  }

  /**
      Set `destinationPort` property.
      Params:
        propval = The proxy destination port.
      Returns: Builder instance for fluent chaining
  */
  T destinationPort(uint propval) nothrow
  {
    return setProperty("destination-port", propval);
  }

  /**
      Set `destinationProtocol` property.
      Params:
        propval = The protocol being spoke to the destination host, or null if
          the #GProxyAddress doesn't know.
      Returns: Builder instance for fluent chaining
  */
  T destinationProtocol(string propval) nothrow
  {
    return setProperty("destination-protocol", propval);
  }

  /**
      Set `password` property.
      Params:
        propval = The proxy password.
      Returns: Builder instance for fluent chaining
  */
  T password(string propval) nothrow
  {
    return setProperty("password", propval);
  }

  /**
      Set `protocol` property.
      Params:
        propval = The proxy protocol.
      Returns: Builder instance for fluent chaining
  */
  T protocol(string propval) nothrow
  {
    return setProperty("protocol", propval);
  }

  /**
      Set `uri` property.
      Params:
        propval = The URI string that the proxy was constructed from (or null
          if the creator didn't specify this).
      Returns: Builder instance for fluent chaining
  */
  T uri(string propval) nothrow
  {
    return setProperty("uri", propval);
  }

  /**
      Set `username` property.
      Params:
        propval = The proxy username.
      Returns: Builder instance for fluent chaining
  */
  T username(string propval) nothrow
  {
    return setProperty("username", propval);
  }
}

/// Fluent builder for [gid.gio2.proxy_address.ProxyAddress]
final class ProxyAddressGidBuilder : ProxyAddressGidBuilderImpl!ProxyAddressGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ProxyAddress build() nothrow
  {
    return new ProxyAddress(cast(void*)createGObject(ProxyAddress._getGType), Yes.Take);
  }
}
