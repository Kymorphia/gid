/// Module for [AccessibleRangeIfaceProxy] interface proxy object
module gtk.accessible_range_iface_proxy;

import gobject.object;
import gtk.accessible_range;
import gtk.accessible_range_mixin;

/// Proxy object for [gtk.accessible_range.AccessibleRange] interface when a GObject has no applicable D binding
class AccessibleRangeIfaceProxy : IfaceProxy, gtk.accessible_range.AccessibleRange
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.accessible_range.AccessibleRange);
  }

  mixin AccessibleRangeT!();
}
