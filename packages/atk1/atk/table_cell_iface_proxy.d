/// Module for [TableCellIfaceProxy] interface proxy object
module atk.table_cell_iface_proxy;

import gobject.object;
import atk.table_cell;
import atk.table_cell_mixin;

/// Proxy object for [atk.table_cell.TableCell] interface when a GObject has no applicable D binding
class TableCellIfaceProxy : IfaceProxy, atk.table_cell.TableCell
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.table_cell.TableCell);
  }

  mixin TableCellT!();
}
