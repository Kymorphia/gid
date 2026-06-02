/// Module for [ProxyIfaceProxy] interface proxy object
module gio.proxy_iface_proxy;

import gobject.object;
import gio.proxy;
import gio.proxy_mixin;

/// Proxy object for [gio.proxy.Proxy] interface when a GObject has no applicable D binding
class ProxyIfaceProxy : IfaceProxy, gio.proxy.Proxy
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.proxy.Proxy);
  }

  mixin ProxyT!();
}
