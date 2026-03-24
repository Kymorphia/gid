/// Module for [ProxyResolver] interface
module gio.proxy_resolver;

public import gio.proxy_resolver_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.proxy_resolver.ProxyResolver] provides synchronous and asynchronous network proxy
    resolution. [gio.proxy_resolver.ProxyResolver] is used within [gio.socket_client.SocketClient] through
    the method [gio.socket_connectable.SocketConnectable.proxyEnumerate].
    
    Implementations of [gio.proxy_resolver.ProxyResolver] based on
    [libproxy](https://github.com/libproxy/libproxy) and GNOME settings can be
    found in [glib-networking](https://gitlab.gnome.org/GNOME/glib-networking).
    GIO comes with an implementation for use inside Flatpak portals.
*/
interface ProxyResolver
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_proxy_resolver_get_type != &gidSymbolNotFound ? g_proxy_resolver_get_type() : cast(GType)0;
  }

  /**
      Gets the default #GProxyResolver for the system.
      Returns: the default #GProxyResolver, which
            will be a dummy object if no proxy resolver is available
  */
  static gio.proxy_resolver.ProxyResolver getDefault()
  {
    GProxyResolver* _cretval;
    _cretval = g_proxy_resolver_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.proxy_resolver.ProxyResolver)(cast(GProxyResolver*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if resolver can be used on this system. (This is used
      internally; [gio.proxy_resolver.ProxyResolver.getDefault] will only return a proxy
      resolver that returns true for this method.)
      Returns: true if resolver is supported.
  */
  bool isSupported();

  /**
      Looks into the system proxy configuration to determine what proxy,
      if any, to use to connect to uri. The returned proxy URIs are of
      the form `<protocol>://[user[:password]@]host[:port]` or
      `direct://`, where <protocol> could be http, rtsp, socks
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
                      with [glib.global.strfreev].
      Throws: [ErrorWrap]
  */
  string[] lookup(string uri, gio.cancellable.Cancellable cancellable = null);

  /**
      Asynchronous lookup of proxy. See [gio.proxy_resolver.ProxyResolver.lookup] for more
      details.
  
      Params:
        uri = a URI representing the destination to connect to
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupAsync(string uri, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Call this function to obtain the array of proxy URIs when
      [gio.proxy_resolver.ProxyResolver.lookupAsync] is complete. See
      [gio.proxy_resolver.ProxyResolver.lookup] for more details.
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: A
                      NULL-terminated array of proxy URIs. Must be freed
                      with [glib.global.strfreev].
      Throws: [ErrorWrap]
  */
  string[] lookupFinish(gio.async_result.AsyncResult result);
}

interface ProxyResolverGidBuilderImpl(T)
{
}
