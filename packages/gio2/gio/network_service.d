/// Module for [NetworkService] class
module gio.network_service;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_connectable;
import gio.socket_connectable_mixin;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    Like [gio.network_address.NetworkAddress] does with hostnames, [gio.network_service.NetworkService]
    provides an easy way to resolve a SRV record, and then attempt to
    connect to one of the hosts that implements that service, handling
    service priority/weighting, multiple IP addresses, and multiple
    address families.
    
    See [gio.srv_target.SrvTarget] for more information about SRV records, and see
    [gio.socket_connectable.SocketConnectable] for an example of using the connectable
    interface.
*/
class NetworkService : gobject.object.ObjectWrap, gio.socket_connectable.SocketConnectable
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
    return cast(void function())g_network_service_get_type != &gidSymbolNotFound ? g_network_service_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NetworkService self()
  {
    return this;
  }

  /**
  Get builder for [gio.network_service.NetworkService]
  Returns: New builder object
  */
  static NetworkServiceGidBuilder builder()
  {
    return new NetworkServiceGidBuilder;
  }

  /**
      Get `domain` property.
      Returns: Network domain, for example `example.com`.
  */
  @property string domain()
  {
    return getDomain();
  }

  /**
      Get `protocol` property.
      Returns: Network protocol, for example `tcp`.
  */
  @property string protocol()
  {
    return getProtocol();
  }

  /**
      Get `scheme` property.
      Returns: Network scheme (default is to use service).
  */
  @property string scheme()
  {
    return getScheme();
  }

  /**
      Set `scheme` property.
      Params:
        propval = Network scheme (default is to use service).
  */
  @property void scheme(string propval)
  {
    setScheme(propval);
  }

  /**
      Get `service` property.
      Returns: Service name, for example `ldap`.
  */
  @property string service()
  {
    return getService();
  }

  mixin SocketConnectableT!();

  /**
      Creates a new #GNetworkService representing the given service,
      protocol, and domain. This will initially be unresolved; use the
      #GSocketConnectable interface to resolve it.
  
      Params:
        service = the service type to look up (eg, "ldap")
        protocol = the networking protocol to use for service (eg, "tcp")
        domain = the DNS domain to look up the service in
      Returns: a new #GNetworkService
  */
  this(string service, string protocol, string domain)
  {
    GSocketConnectable* _cretval;
    const(char)* _service = service.toCString(No.Alloc);
    const(char)* _protocol = protocol.toCString(No.Alloc);
    const(char)* _domain = domain.toCString(No.Alloc);
    _cretval = g_network_service_new(_service, _protocol, _domain);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the domain that srv serves. This might be either UTF-8 or
      ASCII-encoded, depending on what srv was created with.
      Returns: srv's domain name
  */
  string getDomain()
  {
    const(char)* _cretval;
    _cretval = g_network_service_get_domain(cast(GNetworkService*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets srv's protocol name (eg, "tcp").
      Returns: srv's protocol name
  */
  string getProtocol()
  {
    const(char)* _cretval;
    _cretval = g_network_service_get_protocol(cast(GNetworkService*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the URI scheme used to resolve proxies. By default, the service name
      is used as scheme.
      Returns: srv's scheme name
  */
  string getScheme()
  {
    const(char)* _cretval;
    _cretval = g_network_service_get_scheme(cast(GNetworkService*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets srv's service name (eg, "ldap").
      Returns: srv's service name
  */
  string getService()
  {
    const(char)* _cretval;
    _cretval = g_network_service_get_service(cast(GNetworkService*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Set's the URI scheme used to resolve proxies. By default, the service name
      is used as scheme.
  
      Params:
        scheme = a URI scheme
  */
  void setScheme(string scheme)
  {
    const(char)* _scheme = scheme.toCString(No.Alloc);
    g_network_service_set_scheme(cast(GNetworkService*)this._cPtr, _scheme);
  }
}

class NetworkServiceGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.socket_connectable.SocketConnectableGidBuilderImpl!T
{

  mixin SocketConnectableGidBuilderT!();

  /**
      Set `domain` property.
      Params:
        propval = Network domain, for example `example.com`.
      Returns: Builder instance for fluent chaining
  */
  T domain(string propval)
  {
    return setProperty("domain", propval);
  }

  /**
      Set `protocol` property.
      Params:
        propval = Network protocol, for example `tcp`.
      Returns: Builder instance for fluent chaining
  */
  T protocol(string propval)
  {
    return setProperty("protocol", propval);
  }

  /**
      Set `scheme` property.
      Params:
        propval = Network scheme (default is to use service).
      Returns: Builder instance for fluent chaining
  */
  T scheme(string propval)
  {
    return setProperty("scheme", propval);
  }

  /**
      Set `service` property.
      Params:
        propval = Service name, for example `ldap`.
      Returns: Builder instance for fluent chaining
  */
  T service(string propval)
  {
    return setProperty("service", propval);
  }
}

/// Fluent builder for [gio.network_service.NetworkService]
final class NetworkServiceGidBuilder : NetworkServiceGidBuilderImpl!NetworkServiceGidBuilder
{
  NetworkService build()
  {
    return new NetworkService(cast(void*)createGObject(NetworkService._getGType), Yes.Take);
  }
}
