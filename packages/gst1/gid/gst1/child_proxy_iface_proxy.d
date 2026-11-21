/// Module for [ChildProxyIfaceProxy] interface proxy object
module gid.gst1.child_proxy_iface_proxy;

import gid.gobject2.object;
import gid.gst1.child_proxy;
import gid.gst1.child_proxy_mixin;

/// Proxy object for [gid.gst1.child_proxy.ChildProxy] interface when a GObject has no applicable D binding
class ChildProxyIfaceProxy : IfaceProxy, gid.gst1.child_proxy.ChildProxy
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gst1.child_proxy.ChildProxy);
  }

  mixin ChildProxyT!();
}
