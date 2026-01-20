/// Module for [NetworkProxySettings] class
module webkit.network_proxy_settings;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Configures network proxies.
    
    WebKitNetworkProxySettings can be used to provide a custom proxy configuration
    to a #WebKitWebContext. You need to call webkit_web_context_set_network_proxy_settings()
    with [webkit.types.NetworkProxyMode.Custom] and a WebKitNetworkProxySettings.
*/
class NetworkProxySettings : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_network_proxy_settings_get_type != &gidSymbolNotFound ? webkit_network_proxy_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NetworkProxySettings self()
  {
    return this;
  }

  /**
      Create a new #WebKitNetworkProxySettings with the given default_proxy_uri and ignore_hosts.
      
      The default proxy URI will be used for any URI that doesn't match ignore_hosts, and doesn't match any
      of the schemes added with [webkit.network_proxy_settings.NetworkProxySettings.addProxyForScheme].
      If default_proxy_uri starts with "socks://", it will be treated as referring to all three of the
      socks5, socks4a, and socks4 proxy types.
      
      ignore_hosts is a list of hostnames and IP addresses that the resolver should allow direct connections to.
      Entries can be in one of 4 formats:
      <itemizedlist>
      <listitem><para>
      A hostname, such as "example.com", ".example.com", or "*.example.com", any of which match "example.com" or
      any subdomain of it.
      </para></listitem>
      <listitem><para>
      An IPv4 or IPv6 address, such as "192.168.1.1", which matches only that address.
      </para></listitem>
      <listitem><para>
      A hostname or IP address followed by a port, such as "example.com:80", which matches whatever the hostname or IP
      address would match, but only for URLs with the (explicitly) indicated port. In the case of an IPv6 address, the address
      part must appear in brackets: "[::1]:443"
      </para></listitem>
      <listitem><para>
      An IP address range, given by a base address and prefix length, such as "fe80::/10", which matches any address in that range.
      </para></listitem>
      </itemizedlist>
      
      Note that when dealing with Unicode hostnames, the matching is done against the ASCII form of the name.
      Also note that hostname exclusions apply only to connections made to hosts identified by name, and IP address exclusions apply only
      to connections made to hosts identified by address. That is, if example.com has an address of 192.168.1.1, and ignore_hosts
      contains only "192.168.1.1", then a connection to "example.com" will use the proxy, and a connection to 192.168.1.1" will not.
  
      Params:
        defaultProxyUri = the default proxy URI to use, or null.
        ignoreHosts = an optional list of hosts/IP addresses to not use a proxy for.
      Returns: A new #WebKitNetworkProxySettings.
  */
  this(string defaultProxyUri = null, string[] ignoreHosts = null)
  {
    WebKitNetworkProxySettings* _cretval;
    const(char)* _defaultProxyUri = defaultProxyUri.toCString(No.Alloc);
    char*[] _tmpignoreHosts;
    foreach (s; ignoreHosts)
      _tmpignoreHosts ~= s.toCString(No.Alloc);
    _tmpignoreHosts ~= null;
    const(char*)* _ignoreHosts = _tmpignoreHosts.ptr;

    _cretval = webkit_network_proxy_settings_new(_defaultProxyUri, _ignoreHosts);
    this(_cretval, Yes.Take);
  }

  /**
      Adds a URI-scheme-specific proxy.
      
      URIs whose scheme matches uri_scheme will be proxied via proxy_uri.
      As with the default proxy URI, if proxy_uri starts with "socks://", it will be treated as referring to
      all three of the socks5, socks4a, and socks4 proxy types.
  
      Params:
        scheme = the URI scheme to add a proxy for
        proxyUri = the proxy URI to use for uri_scheme
  */
  void addProxyForScheme(string scheme, string proxyUri)
  {
    const(char)* _scheme = scheme.toCString(No.Alloc);
    const(char)* _proxyUri = proxyUri.toCString(No.Alloc);
    webkit_network_proxy_settings_add_proxy_for_scheme(cast(WebKitNetworkProxySettings*)this._cPtr, _scheme, _proxyUri);
  }

  /**
      Make a copy of the #WebKitNetworkProxySettings.
      Returns: A copy of passed in #WebKitNetworkProxySettings
  */
  webkit.network_proxy_settings.NetworkProxySettings copy()
  {
    WebKitNetworkProxySettings* _cretval;
    _cretval = webkit_network_proxy_settings_copy(cast(WebKitNetworkProxySettings*)this._cPtr);
    auto _retval = _cretval ? new webkit.network_proxy_settings.NetworkProxySettings(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
