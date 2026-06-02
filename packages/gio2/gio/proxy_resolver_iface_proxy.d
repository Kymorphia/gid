/// Module for [ProxyResolverIfaceProxy] interface proxy object
module gio.proxy_resolver_iface_proxy;

import gobject.object;
import gio.proxy_resolver;
import gio.proxy_resolver_mixin;

/// Proxy object for [gio.proxy_resolver.ProxyResolver] interface when a GObject has no applicable D binding
class ProxyResolverIfaceProxy : IfaceProxy, gio.proxy_resolver.ProxyResolver
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.proxy_resolver.ProxyResolver);
  }

  mixin ProxyResolverT!();
}
