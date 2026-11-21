/// Module for [TableIfaceProxy] interface proxy object
module gid.atk1.table_iface_proxy;

import gid.gobject2.object;
import gid.atk1.table;
import gid.atk1.table_mixin;

/// Proxy object for [gid.atk1.table.Table] interface when a GObject has no applicable D binding
class TableIfaceProxy : IfaceProxy, gid.atk1.table.Table
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.table.Table);
  }

  mixin TableT!();
}
