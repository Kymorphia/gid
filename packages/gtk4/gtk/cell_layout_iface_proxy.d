/// Module for [CellLayoutIfaceProxy] interface proxy object
module gtk.cell_layout_iface_proxy;

import gobject.object;
import gtk.cell_layout;
import gtk.cell_layout_mixin;

/// Proxy object for [gtk.cell_layout.CellLayout] interface when a GObject has no applicable D binding
class CellLayoutIfaceProxy : IfaceProxy, gtk.cell_layout.CellLayout
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.cell_layout.CellLayout);
  }

  mixin CellLayoutT!();
}
