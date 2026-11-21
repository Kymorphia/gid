/// Module for [AccessibleIfaceProxy] interface proxy object
module gid.gtk4.accessible_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;

/// Proxy object for [gid.gtk4.accessible.Accessible] interface when a GObject has no applicable D binding
class AccessibleIfaceProxy : IfaceProxy, gid.gtk4.accessible.Accessible
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.accessible.Accessible);
  }

  mixin AccessibleT!();
}
