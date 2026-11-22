/// Module for [TreeSortableIfaceProxy] interface proxy object
module gid.gtk3.tree_sortable_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.tree_sortable;
import gid.gtk3.tree_sortable_mixin;
import gid.gtk3.tree_model;
import gid.gtk3.tree_model_mixin;

/// Proxy object for [gid.gtk3.tree_sortable.TreeSortable] interface when a GObject has no applicable D binding
class TreeSortableIfaceProxy : IfaceProxy, gid.gtk3.tree_sortable.TreeSortable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.tree_sortable.TreeSortable);
  }

  mixin TreeSortableT!();
  mixin gid.gtk3.tree_model_mixin.TreeModelT!();
}
