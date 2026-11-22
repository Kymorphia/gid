/// Module for [NavigationIfaceProxy] interface proxy object
module gid.gstvideo1.navigation_iface_proxy;

import gid.gobject2.object;
import gid.gstvideo1.navigation;
import gid.gstvideo1.navigation_mixin;

/// Proxy object for [gid.gstvideo1.navigation.Navigation] interface when a GObject has no applicable D binding
class NavigationIfaceProxy : IfaceProxy, gid.gstvideo1.navigation.Navigation
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gstvideo1.navigation.Navigation);
  }

  mixin NavigationT!();
}
