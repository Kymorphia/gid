/// Module for [CellEditableIfaceProxy] interface proxy object
module gid.gtk3.cell_editable_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.cell_editable;
import gid.gtk3.cell_editable_mixin;

/// Proxy object for [gid.gtk3.cell_editable.CellEditable] interface when a GObject has no applicable D binding
class CellEditableIfaceProxy : IfaceProxy, gid.gtk3.cell_editable.CellEditable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.cell_editable.CellEditable);
  }

  mixin CellEditableT!();
}
