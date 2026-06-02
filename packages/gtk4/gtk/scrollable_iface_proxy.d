/// Module for [ScrollableIfaceProxy] interface proxy object
module gtk.scrollable_iface_proxy;

import gobject.object;
import gtk.scrollable;
import gtk.scrollable_mixin;

/// Proxy object for [gtk.scrollable.Scrollable] interface when a GObject has no applicable D binding
class ScrollableIfaceProxy : IfaceProxy, gtk.scrollable.Scrollable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.scrollable.Scrollable);
  }

  mixin ScrollableT!();
}
