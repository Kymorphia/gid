/// Module for [SwipeableIfaceProxy] interface proxy object
module gid.adw1.swipeable_iface_proxy;

import gid.gobject2.object;
import gid.adw1.swipeable;
import gid.adw1.swipeable_mixin;

/// Proxy object for [gid.adw1.swipeable.Swipeable] interface when a GObject has no applicable D binding
class SwipeableIfaceProxy : IfaceProxy, gid.adw1.swipeable.Swipeable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.adw1.swipeable.Swipeable);
  }

  mixin SwipeableT!();
}
