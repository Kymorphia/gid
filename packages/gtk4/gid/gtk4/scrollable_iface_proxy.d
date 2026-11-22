/// Module for [ScrollableIfaceProxy] interface proxy object
module gid.gtk4.scrollable_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.scrollable;
import gid.gtk4.scrollable_mixin;

/// Proxy object for [gid.gtk4.scrollable.Scrollable] interface when a GObject has no applicable D binding
class ScrollableIfaceProxy : IfaceProxy, gid.gtk4.scrollable.Scrollable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.scrollable.Scrollable);
  }

  mixin ScrollableT!();
}
