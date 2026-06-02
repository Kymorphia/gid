/// Module for [ShortcutManagerIfaceProxy] interface proxy object
module gtk.shortcut_manager_iface_proxy;

import gobject.object;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;

/// Proxy object for [gtk.shortcut_manager.ShortcutManager] interface when a GObject has no applicable D binding
class ShortcutManagerIfaceProxy : IfaceProxy, gtk.shortcut_manager.ShortcutManager
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.shortcut_manager.ShortcutManager);
  }

  mixin ShortcutManagerT!();
}
