/// Module for [UndoManagerIfaceProxy] interface proxy object
module gid.gtksource4.undo_manager_iface_proxy;

import gid.gobject2.object;
import gid.gtksource4.undo_manager;
import gid.gtksource4.undo_manager_mixin;

/// Proxy object for [gid.gtksource4.undo_manager.UndoManager] interface when a GObject has no applicable D binding
class UndoManagerIfaceProxy : IfaceProxy, gid.gtksource4.undo_manager.UndoManager
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtksource4.undo_manager.UndoManager);
  }

  mixin UndoManagerT!();
}
