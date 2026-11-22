/// Module for [TreeDragDestIfaceProxy] interface proxy object
module gid.gtk3.tree_drag_dest_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.tree_drag_dest;
import gid.gtk3.tree_drag_dest_mixin;

/// Proxy object for [gid.gtk3.tree_drag_dest.TreeDragDest] interface when a GObject has no applicable D binding
class TreeDragDestIfaceProxy : IfaceProxy, gid.gtk3.tree_drag_dest.TreeDragDest
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.tree_drag_dest.TreeDragDest);
  }

  mixin TreeDragDestT!();
}
