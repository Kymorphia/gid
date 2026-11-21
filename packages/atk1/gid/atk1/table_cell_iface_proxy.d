/// Module for [TableCellIfaceProxy] interface proxy object
module gid.atk1.table_cell_iface_proxy;

import gid.gobject2.object;
import gid.atk1.table_cell;
import gid.atk1.table_cell_mixin;

/// Proxy object for [gid.atk1.table_cell.TableCell] interface when a GObject has no applicable D binding
class TableCellIfaceProxy : IfaceProxy, gid.atk1.table_cell.TableCell
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.table_cell.TableCell);
  }

  mixin TableCellT!();
}
