/// Module for [ScrollableIfaceProxy] interface proxy object
module gid.gtk3.scrollable_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.scrollable;
import gid.gtk3.scrollable_mixin;

/// Proxy object for [gid.gtk3.scrollable.Scrollable] interface when a GObject has no applicable D binding
class ScrollableIfaceProxy : IfaceProxy, gid.gtk3.scrollable.Scrollable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.scrollable.Scrollable);
  }

  mixin ScrollableT!();
}
