/// Module for [ProxyIfaceProxy] interface proxy object
module gid.gio2.proxy_iface_proxy;

import gid.gobject2.object;
import gid.gio2.proxy;
import gid.gio2.proxy_mixin;

/// Proxy object for [gid.gio2.proxy.Proxy] interface when a GObject has no applicable D binding
class ProxyIfaceProxy : IfaceProxy, gid.gio2.proxy.Proxy
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.proxy.Proxy);
  }

  mixin ProxyT!();
}
