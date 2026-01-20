/// Module for [SimpleProxyResolver] class
module gio.simple_proxy_resolver;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.proxy_resolver;
import gio.proxy_resolver_mixin;
import gio.types;
import gobject.object;

/**
    [gio.simple_proxy_resolver.SimpleProxyResolver] is a simple [gio.proxy_resolver.ProxyResolver] implementation
    that handles a single default proxy, multiple URI-scheme-specific
    proxies, and a list of hosts that proxies should not be used for.
    
    [gio.simple_proxy_resolver.SimpleProxyResolver] is never the default proxy resolver, but it
    can be used as the base class for another proxy resolver
    implementation, or it can be created and used manually, such as
    with [gio.socket_client.SocketClient.setProxyResolver].
*/
class SimpleProxyResolver : gobject.object.ObjectWrap, gio.proxy_resolver.ProxyResolver
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
    return cast(void function())g_simple_proxy_resolver_get_type != &gidSymbolNotFound ? g_simple_proxy_resolver_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SimpleProxyResolver self()
  {
    return this;
  }

  /**
      Get `defaultProxy` property.
      Returns: The default proxy URI that will be used for any URI that doesn't
        match #GSimpleProxyResolver:ignore-hosts, and doesn't match any
        of the schemes set with [gio.simple_proxy_resolver.SimpleProxyResolver.setUriProxy].
        
        Note that as a special case, if this URI starts with
        "socks://", #GSimpleProxyResolver will treat it as referring
        to all three of the socks5, socks4a, and socks4 proxy types.
  */
  @property string defaultProxy()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("default-proxy");
  }

  /**
      Set `defaultProxy` property.
      Params:
        propval = The default proxy URI that will be used for any URI that doesn't
          match #GSimpleProxyResolver:ignore-hosts, and doesn't match any
          of the schemes set with [gio.simple_proxy_resolver.SimpleProxyResolver.setUriProxy].
          
          Note that as a special case, if this URI starts with
          "socks://", #GSimpleProxyResolver will treat it as referring
          to all three of the socks5, socks4a, and socks4 proxy types.
  */
  @property void defaultProxy(string propval)
  {
    return setDefaultProxy(propval);
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
  static gio.proxy_resolver.ProxyResolver new_(string defaultProxy = null, string[] ignoreHosts = null)
  {
    GProxyResolver* _cretval;
    const(char)* _defaultProxy = defaultProxy.toCString(No.Alloc);
    char*[] _tmpignoreHosts;
    foreach (s; ignoreHosts)
      _tmpignoreHosts ~= s.toCString(No.Alloc);
    _tmpignoreHosts ~= null;
    char** _ignoreHosts = _tmpignoreHosts.ptr;

    _cretval = g_simple_proxy_resolver_new(_defaultProxy, _ignoreHosts);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.proxy_resolver.ProxyResolver)(cast(GProxyResolver*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the default proxy on resolver, to be used for any URIs that
      don't match #GSimpleProxyResolver:ignore-hosts or a proxy set
      via [gio.simple_proxy_resolver.SimpleProxyResolver.setUriProxy].
      
      If default_proxy starts with "socks://",
      #GSimpleProxyResolver will treat it as referring to all three of
      the socks5, socks4a, and socks4 proxy types.
  
      Params:
        defaultProxy = the default proxy to use
  */
  void setDefaultProxy(string defaultProxy = null)
  {
    const(char)* _defaultProxy = defaultProxy.toCString(No.Alloc);
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
  void setIgnoreHosts(string[] ignoreHosts)
  {
    char*[] _tmpignoreHosts;
    foreach (s; ignoreHosts)
      _tmpignoreHosts ~= s.toCString(No.Alloc);
    _tmpignoreHosts ~= null;
    char** _ignoreHosts = _tmpignoreHosts.ptr;

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
  void setUriProxy(string uriScheme, string proxy)
  {
    const(char)* _uriScheme = uriScheme.toCString(No.Alloc);
    const(char)* _proxy = proxy.toCString(No.Alloc);
    g_simple_proxy_resolver_set_uri_proxy(cast(GSimpleProxyResolver*)this._cPtr, _uriScheme, _proxy);
  }
}
