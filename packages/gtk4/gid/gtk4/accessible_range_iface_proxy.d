/// Module for [AccessibleRangeIfaceProxy] interface proxy object
module gid.gtk4.accessible_range_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.accessible_range;
import gid.gtk4.accessible_range_mixin;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;

/// Proxy object for [gid.gtk4.accessible_range.AccessibleRange] interface when a GObject has no applicable D binding
class AccessibleRangeIfaceProxy : IfaceProxy, gid.gtk4.accessible_range.AccessibleRange
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.accessible_range.AccessibleRange);
  }

  mixin AccessibleRangeT!();
  mixin gid.gtk4.accessible_mixin.AccessibleT!();
}
