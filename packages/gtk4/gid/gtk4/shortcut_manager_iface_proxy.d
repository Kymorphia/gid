/// Module for [ShortcutManagerIfaceProxy] interface proxy object
module gid.gtk4.shortcut_manager_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;

/// Proxy object for [gid.gtk4.shortcut_manager.ShortcutManager] interface when a GObject has no applicable D binding
class ShortcutManagerIfaceProxy : IfaceProxy, gid.gtk4.shortcut_manager.ShortcutManager
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.shortcut_manager.ShortcutManager);
  }

  mixin ShortcutManagerT!();
}
