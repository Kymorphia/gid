/// Module for [CellAccessibleParentIfaceProxy] interface proxy object
module gid.gtk3.cell_accessible_parent_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.cell_accessible_parent;
import gid.gtk3.cell_accessible_parent_mixin;

/// Proxy object for [gid.gtk3.cell_accessible_parent.CellAccessibleParent] interface when a GObject has no applicable D binding
class CellAccessibleParentIfaceProxy : IfaceProxy, gid.gtk3.cell_accessible_parent.CellAccessibleParent
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.cell_accessible_parent.CellAccessibleParent);
  }

  mixin CellAccessibleParentT!();
}
