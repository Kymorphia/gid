/// Module for [SelectionIfaceProxy] interface proxy object
module gid.atk1.selection_iface_proxy;

import gid.gobject2.object;
import gid.atk1.selection;
import gid.atk1.selection_mixin;

/// Proxy object for [gid.atk1.selection.Selection] interface when a GObject has no applicable D binding
class SelectionIfaceProxy : IfaceProxy, gid.atk1.selection.Selection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.selection.Selection);
  }

  mixin SelectionT!();
}
