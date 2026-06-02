/// Module for [CellAccessibleParentIfaceProxy] interface proxy object
module gtk.cell_accessible_parent_iface_proxy;

import gobject.object;
import gtk.cell_accessible_parent;
import gtk.cell_accessible_parent_mixin;

/// Proxy object for [gtk.cell_accessible_parent.CellAccessibleParent] interface when a GObject has no applicable D binding
class CellAccessibleParentIfaceProxy : IfaceProxy, gtk.cell_accessible_parent.CellAccessibleParent
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.cell_accessible_parent.CellAccessibleParent);
  }

  mixin CellAccessibleParentT!();
}
