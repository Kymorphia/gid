/// Module for [ProxyResolver] interface
module gid.gio2.proxy_resolver;

public import gid.core.basictypes;
public import gid.gio2.proxy_resolver_iface_proxy;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.proxy_resolver.ProxyResolver] provides synchronous and asynchronous network proxy
    resolution. [gid.gio2.proxy_resolver.ProxyResolver] is used within [gid.gio2.socket_client.SocketClient] through
    the method [gid.gio2.socket_connectable.SocketConnectable.proxyEnumerate].
    
    Implementations of [gid.gio2.proxy_resolver.ProxyResolver] based on
    [libproxy](https://github.com/libproxy/libproxy) and GNOME settings can be
    found in [glib-networking](https://gitlab.gnome.org/GNOME/glib-networking).
    GIO comes with an implementation for use inside Flatpak portals.
*/
interface ProxyResolver : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_proxy_resolver_get_type != &gidSymbolNotFound ? g_proxy_resolver_get_type() : cast(GType)0;
  }

  /**
      Gets the default #GProxyResolver for the system.
      Returns: the default #GProxyResolver, which
            will be a dummy object if no proxy resolver is available
  */
  static gid.gio2.proxy_resolver.ProxyResolver getDefault() nothrow
  {
    GProxyResolver* _cretval;
    _cretval = g_proxy_resolver_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.proxy_resolver.ProxyResolver)(cast(GProxyResolver*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if resolver can be used on this system. (This is used
      internally; [gid.gio2.proxy_resolver.ProxyResolver.getDefault] will only return a proxy
      resolver that returns true for this method.)
      Returns: true if resolver is supported.
  */
  bool isSupported();

  /**
      Looks into the system proxy configuration to determine what proxy,
      if any, to use to connect to uri. The returned proxy URIs are of
      the form `<protocol>://[user[:password]@]host[:port]` or
      `direct://`, where `<protocol>` could be http, rtsp, socks
      or other proxying protocol.
      
      If you don't know what network protocol is being used on the
      socket, you should use `none` as the URI protocol.
      In this case, the resolver might still return a generic proxy type
      (such as SOCKS), but would not return protocol-specific proxy types
      (such as http).
      
      `direct://` is used when no proxy is needed.
      Direct connection should not be attempted unless it is part of the
      returned array of proxies.
  
      Params:
        uri = a URI representing the destination to connect to
        cancellable = a #GCancellable, or null
      Returns: A
                      NULL-terminated array of proxy URIs. Must be freed
                      with [gid.glib2.global.strfreev].
      Throws: [ErrorWrap]
  */
  string[] lookup(string uri, gid.gio2.cancellable.Cancellable cancellable = null);

  /**
      Asynchronous lookup of proxy. See [gid.gio2.proxy_resolver.ProxyResolver.lookup] for more
      details.
  
      Params:
        uri = a URI representing the destination to connect to
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupAsync(string uri, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      Call this function to obtain the array of proxy URIs when
      [gid.gio2.proxy_resolver.ProxyResolver.lookupAsync] is complete. See
      [gid.gio2.proxy_resolver.ProxyResolver.lookup] for more details.
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: A
                      NULL-terminated array of proxy URIs. Must be freed
                      with [gid.glib2.global.strfreev].
      Throws: [ErrorWrap]
  */
  string[] lookupFinish(gid.gio2.async_result.AsyncResult result);
}

/// Fluent builder implementation template for [gid.gio2.proxy_resolver.ProxyResolver]
interface ProxyResolverGidBuilderImpl(T)
{
}
