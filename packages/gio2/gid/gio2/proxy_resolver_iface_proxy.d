/// Module for [ProxyResolverIfaceProxy] interface proxy object
module gid.gio2.proxy_resolver_iface_proxy;

import gid.gobject2.object;
import gid.gio2.proxy_resolver;
import gid.gio2.proxy_resolver_mixin;

/// Proxy object for [gid.gio2.proxy_resolver.ProxyResolver] interface when a GObject has no applicable D binding
class ProxyResolverIfaceProxy : IfaceProxy, gid.gio2.proxy_resolver.ProxyResolver
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.proxy_resolver.ProxyResolver);
  }

  mixin ProxyResolverT!();
}
