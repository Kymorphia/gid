/// Module for [WindowIfaceProxy] interface proxy object
module atk.window_iface_proxy;

import gobject.object;
import atk.window;
import atk.window_mixin;

/// Proxy object for [atk.window.Window] interface when a GObject has no applicable D binding
class WindowIfaceProxy : IfaceProxy, atk.window.Window
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.window.Window);
  }

  mixin WindowT!();
}
