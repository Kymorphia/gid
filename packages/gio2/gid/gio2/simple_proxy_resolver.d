/// Module for [SimpleProxyResolver] class
module gid.gio2.simple_proxy_resolver;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.proxy_resolver;
import gid.gio2.proxy_resolver_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.simple_proxy_resolver.SimpleProxyResolver] is a simple [gid.gio2.proxy_resolver.ProxyResolver] implementation
    that handles a single default proxy, multiple URI-scheme-specific
    proxies, and a list of hosts that proxies should not be used for.
    
    [gid.gio2.simple_proxy_resolver.SimpleProxyResolver] is never the default proxy resolver, but it
    can be used as the base class for another proxy resolver
    implementation, or it can be created and used manually, such as
    with [gid.gio2.socket_client.SocketClient.setProxyResolver].
*/
@gidGir("SimpleProxyResolver", "SimpleProxyResolverClass")
class SimpleProxyResolver : gid.gobject2.object.ObjectWrap, gid.gio2.proxy_resolver.ProxyResolver
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
    return cast(void function())g_simple_proxy_resolver_get_type != &gidSymbolNotFound ? g_simple_proxy_resolver_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSimpleProxyResolver";
  }

  /** Returns `this`, for use in `with` statements. */
  override SimpleProxyResolver self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.simple_proxy_resolver.SimpleProxyResolver]
      Returns: New builder object
  */
  static SimpleProxyResolverGidBuilder builder() nothrow
  {
    return new SimpleProxyResolverGidBuilder;
  }

  /**
      Get `defaultProxy` property.
      Returns: The default proxy URI that will be used for any URI that doesn't
        match #GSimpleProxyResolver:ignore-hosts, and doesn't match any
        of the schemes set with [gid.gio2.simple_proxy_resolver.SimpleProxyResolver.setUriProxy].
        
        Note that as a special case, if this URI starts with
        "socks://", #GSimpleProxyResolver will treat it as referring
        to all three of the socks5, socks4a, and socks4 proxy types.
  */
  @property string defaultProxy() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("default-proxy");
  }

  /**
      Set `defaultProxy` property.
      Params:
        propval = The default proxy URI that will be used for any URI that doesn't
          match #GSimpleProxyResolver:ignore-hosts, and doesn't match any
          of the schemes set with [gid.gio2.simple_proxy_resolver.SimpleProxyResolver.setUriProxy].
          
          Note that as a special case, if this URI starts with
          "socks://", #GSimpleProxyResolver will treat it as referring
          to all three of the socks5, socks4a, and socks4 proxy types.
  */
  @property void defaultProxy(string propval) nothrow
  {
    setDefaultProxy(propval);
  }

  /**
      Get `ignoreHosts` property.
      Returns: A list of hostnames and IP addresses that the resolver should
        allow direct connections to.
        
        Entries can be in one of 4 formats:
        
        - A hostname, such as "example.com", ".example.com", or
          "*.example.com", any of which match "example.com" or
          any subdomain of it.
        
        - An IPv4 or IPv6 address, such as "192.168.1.1",
          which matches only that address.
        
        - A hostname or IP address followed by a port, such as
          "example.com:80", which matches whatever the hostname or IP
          address would match, but only for URLs with the (explicitly)
          indicated port. In the case of an IPv6 address, the address
          part must appear in brackets: "[::1]:443"
        
        - An IP address range, given by a base address and prefix length,
          such as "fe80::/10", which matches any address in that range.
        
        Note that when dealing with Unicode hostnames, the matching is
        done against the ASCII form of the name.
        
        Also note that hostname exclusions apply only to connections made
        to hosts identified by name, and IP address exclusions apply only
        to connections made to hosts identified by address. That is, if
        example.com has an address of 192.168.1.1, and the :ignore-hosts list
        contains only "192.168.1.1", then a connection to "example.com"
        (eg, via a #GNetworkAddress) will use the proxy, and a connection to
        "192.168.1.1" (eg, via a #GInetSocketAddress) will not.
        
        These rules match the "ignore-hosts"/"noproxy" rules most
        commonly used by other applications.
  */
  @property string[] ignoreHosts() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string[])("ignore-hosts");
  }

  /**
      Set `ignoreHosts` property.
      Params:
        propval = A list of hostnames and IP addresses that the resolver should
          allow direct connections to.
          
          Entries can be in one of 4 formats:
          
          - A hostname, such as "example.com", ".example.com", or
            "*.example.com", any of which match "example.com" or
            any subdomain of it.
          
          - An IPv4 or IPv6 address, such as "192.168.1.1",
            which matches only that address.
          
          - A hostname or IP address followed by a port, such as
            "example.com:80", which matches whatever the hostname or IP
            address would match, but only for URLs with the (explicitly)
            indicated port. In the case of an IPv6 address, the address
            part must appear in brackets: "[::1]:443"
          
          - An IP address range, given by a base address and prefix length,
            such as "fe80::/10", which matches any address in that range.
          
          Note that when dealing with Unicode hostnames, the matching is
          done against the ASCII form of the name.
          
          Also note that hostname exclusions apply only to connections made
          to hosts identified by name, and IP address exclusions apply only
          to connections made to hosts identified by address. That is, if
          example.com has an address of 192.168.1.1, and the :ignore-hosts list
          contains only "192.168.1.1", then a connection to "example.com"
          (eg, via a #GNetworkAddress) will use the proxy, and a connection to
          "192.168.1.1" (eg, via a #GInetSocketAddress) will not.
          
          These rules match the "ignore-hosts"/"noproxy" rules most
          commonly used by other applications.
  */
  @property void ignoreHosts(string[] propval) nothrow
  {
    setIgnoreHosts(propval);
  }

  mixin ProxyResolverT!();

  /**
      Creates a new #GSimpleProxyResolver. See
      #GSimpleProxyResolver:default-proxy and
      #GSimpleProxyResolver:ignore-hosts for more details on how the
      arguments are interpreted.
  
      Params:
        defaultProxy = the default proxy to use, eg
              "socks://192.168.1.1"
        ignoreHosts = an optional list of hosts/IP addresses
              to not use a proxy for.
      Returns: a new #GSimpleProxyResolver
  */
  static gid.gio2.proxy_resolver.ProxyResolver new_(string defaultProxy = null, string[] ignoreHosts = null) nothrow
  {
    GProxyResolver* _cretval;
    const(char)* _defaultProxy = defaultProxy.toCString!(No.Malloc, Yes.Nullable);
    auto _ignoreHosts_arr = new char*[](ignoreHosts.length + 1);
    auto _ignoreHosts = cast(char**)_ignoreHosts_arr.ptr;
    foreach (i, s; ignoreHosts) _ignoreHosts[i] = s.toCString!(No.Malloc);
    _cretval = g_simple_proxy_resolver_new(_defaultProxy, _ignoreHosts);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.proxy_resolver.ProxyResolver)(cast(GProxyResolver*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the default proxy on resolver, to be used for any URIs that
      don't match #GSimpleProxyResolver:ignore-hosts or a proxy set
      via [gid.gio2.simple_proxy_resolver.SimpleProxyResolver.setUriProxy].
      
      If default_proxy starts with "socks://",
      #GSimpleProxyResolver will treat it as referring to all three of
      the socks5, socks4a, and socks4 proxy types.
  
      Params:
        defaultProxy = the default proxy to use
  */
  void setDefaultProxy(string defaultProxy = null) nothrow
  {
    const(char)* _defaultProxy = defaultProxy.toCString!(No.Malloc, Yes.Nullable);
    g_simple_proxy_resolver_set_default_proxy(cast(GSimpleProxyResolver*)this._cPtr, _defaultProxy);
  }

  /**
      Sets the list of ignored hosts.
      
      See #GSimpleProxyResolver:ignore-hosts for more details on how the
      ignore_hosts argument is interpreted.
  
      Params:
        ignoreHosts = null-terminated list of hosts/IP addresses
              to not use a proxy for
  */
  void setIgnoreHosts(string[] ignoreHosts) nothrow
  {
    auto _ignoreHosts_arr = new char*[](ignoreHosts.length + 1);
    auto _ignoreHosts = cast(char**)_ignoreHosts_arr.ptr;
    foreach (i, s; ignoreHosts) _ignoreHosts[i] = s.toCString!(No.Malloc);
    g_simple_proxy_resolver_set_ignore_hosts(cast(GSimpleProxyResolver*)this._cPtr, _ignoreHosts);
  }

  /**
      Adds a URI-scheme-specific proxy to resolver; URIs whose scheme
      matches uri_scheme (and which don't match
      #GSimpleProxyResolver:ignore-hosts) will be proxied via proxy.
      
      As with #GSimpleProxyResolver:default-proxy, if proxy starts with
      "socks://", #GSimpleProxyResolver will treat it
      as referring to all three of the socks5, socks4a, and socks4 proxy
      types.
  
      Params:
        uriScheme = the URI scheme to add a proxy for
        proxy = the proxy to use for uri_scheme
  */
  void setUriProxy(string uriScheme, string proxy) nothrow
  {
    const(char)* _uriScheme = uriScheme.toCString!(No.Malloc, No.Nullable);
    const(char)* _proxy = proxy.toCString!(No.Malloc, No.Nullable);
    g_simple_proxy_resolver_set_uri_proxy(cast(GSimpleProxyResolver*)this._cPtr, _uriScheme, _proxy);
  }
}

/// Fluent builder implementation template for [gid.gio2.simple_proxy_resolver.SimpleProxyResolver]
class SimpleProxyResolverGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.proxy_resolver.ProxyResolverGidBuilderImpl!T
{

  mixin ProxyResolverGidBuilderT!();

  /**
      Set `defaultProxy` property.
      Params:
        propval = The default proxy URI that will be used for any URI that doesn't
          match #GSimpleProxyResolver:ignore-hosts, and doesn't match any
          of the schemes set with [gid.gio2.simple_proxy_resolver.SimpleProxyResolver.setUriProxy].
          
          Note that as a special case, if this URI starts with
          "socks://", #GSimpleProxyResolver will treat it as referring
          to all three of the socks5, socks4a, and socks4 proxy types.
      Returns: Builder instance for fluent chaining
  */
  T defaultProxy(string propval) nothrow
  {
    return setProperty("default-proxy", propval);
  }

  /**
      Set `ignoreHosts` property.
      Params:
        propval = A list of hostnames and IP addresses that the resolver should
          allow direct connections to.
          
          Entries can be in one of 4 formats:
          
          - A hostname, such as "example.com", ".example.com", or
            "*.example.com", any of which match "example.com" or
            any subdomain of it.
          
          - An IPv4 or IPv6 address, such as "192.168.1.1",
            which matches only that address.
          
          - A hostname or IP address followed by a port, such as
            "example.com:80", which matches whatever the hostname or IP
            address would match, but only for URLs with the (explicitly)
            indicated port. In the case of an IPv6 address, the address
            part must appear in brackets: "[::1]:443"
          
          - An IP address range, given by a base address and prefix length,
            such as "fe80::/10", which matches any address in that range.
          
          Note that when dealing with Unicode hostnames, the matching is
          done against the ASCII form of the name.
          
          Also note that hostname exclusions apply only to connections made
          to hosts identified by name, and IP address exclusions apply only
          to connections made to hosts identified by address. That is, if
          example.com has an address of 192.168.1.1, and the :ignore-hosts list
          contains only "192.168.1.1", then a connection to "example.com"
          (eg, via a #GNetworkAddress) will use the proxy, and a connection to
          "192.168.1.1" (eg, via a #GInetSocketAddress) will not.
          
          These rules match the "ignore-hosts"/"noproxy" rules most
          commonly used by other applications.
      Returns: Builder instance for fluent chaining
  */
  T ignoreHosts(string[] propval) nothrow
  {
    return setProperty("ignore-hosts", propval);
  }
}

/// Fluent builder for [gid.gio2.simple_proxy_resolver.SimpleProxyResolver]
final class SimpleProxyResolverGidBuilder : SimpleProxyResolverGidBuilderImpl!SimpleProxyResolverGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SimpleProxyResolver build() nothrow
  {
    return new SimpleProxyResolver(cast(void*)createGObject(SimpleProxyResolver._getGType), Yes.Take);
  }
}
