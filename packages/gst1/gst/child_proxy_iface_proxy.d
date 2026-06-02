/// Module for [ChildProxyIfaceProxy] interface proxy object
module gst.child_proxy_iface_proxy;

import gobject.object;
import gst.child_proxy;
import gst.child_proxy_mixin;

/// Proxy object for [gst.child_proxy.ChildProxy] interface when a GObject has no applicable D binding
class ChildProxyIfaceProxy : IfaceProxy, gst.child_proxy.ChildProxy
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gst.child_proxy.ChildProxy);
  }

  mixin ChildProxyT!();
}
