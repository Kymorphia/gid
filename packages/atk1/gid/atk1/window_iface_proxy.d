/// Module for [WindowIfaceProxy] interface proxy object
module gid.atk1.window_iface_proxy;

import gid.gobject2.object;
import gid.atk1.window;
import gid.atk1.window_mixin;

/// Proxy object for [gid.atk1.window.Window] interface when a GObject has no applicable D binding
class WindowIfaceProxy : IfaceProxy, gid.atk1.window.Window
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.window.Window);
  }

  mixin WindowT!();
}
