/// Module for [TreeDragDestIfaceProxy] interface proxy object
module gtk.tree_drag_dest_iface_proxy;

import gobject.object;
import gtk.tree_drag_dest;
import gtk.tree_drag_dest_mixin;

/// Proxy object for [gtk.tree_drag_dest.TreeDragDest] interface when a GObject has no applicable D binding
class TreeDragDestIfaceProxy : IfaceProxy, gtk.tree_drag_dest.TreeDragDest
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.tree_drag_dest.TreeDragDest);
  }

  mixin TreeDragDestT!();
}
