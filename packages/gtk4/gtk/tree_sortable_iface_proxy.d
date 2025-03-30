/// Module for [TreeSortableIfaceProxy] interface proxy object
module gtk.tree_sortable_iface_proxy;

import gobject.object;
import gtk.tree_sortable;
import gtk.tree_sortable_mixin;

/// Proxy object for [Gtk.TreeSortable] interface when a GObject has no applicable D binding
class TreeSortableIfaceProxy : IfaceProxy, gtk.tree_sortable.TreeSortable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.tree_sortable.TreeSortable);
  }

  mixin TreeSortableT!();
}
