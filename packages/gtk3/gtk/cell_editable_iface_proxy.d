/// Module for [CellEditableIfaceProxy] interface proxy object
module gtk.cell_editable_iface_proxy;

import gobject.object;
import gtk.cell_editable;
import gtk.cell_editable_mixin;

/// Proxy object for [gtk.cell_editable.CellEditable] interface when a GObject has no applicable D binding
class CellEditableIfaceProxy : IfaceProxy, gtk.cell_editable.CellEditable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.cell_editable.CellEditable);
  }

  mixin CellEditableT!();
}
