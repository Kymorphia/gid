/// Module for [NavigationIfaceProxy] interface proxy object
module gstvideo.navigation_iface_proxy;

import gobject.object;
import gstvideo.navigation;
import gstvideo.navigation_mixin;

/// Proxy object for [gstvideo.navigation.Navigation] interface when a GObject has no applicable D binding
class NavigationIfaceProxy : IfaceProxy, gstvideo.navigation.Navigation
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gstvideo.navigation.Navigation);
  }

  mixin NavigationT!();
}
