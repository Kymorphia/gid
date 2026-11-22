/// Module for [CellLayoutIfaceProxy] interface proxy object
module gid.gtk4.cell_layout_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.cell_layout;
import gid.gtk4.cell_layout_mixin;

/// Proxy object for [gid.gtk4.cell_layout.CellLayout] interface when a GObject has no applicable D binding
class CellLayoutIfaceProxy : IfaceProxy, gid.gtk4.cell_layout.CellLayout
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.cell_layout.CellLayout);
  }

  mixin CellLayoutT!();
}
