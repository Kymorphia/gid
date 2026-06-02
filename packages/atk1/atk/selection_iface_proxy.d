/// Module for [SelectionIfaceProxy] interface proxy object
module atk.selection_iface_proxy;

import gobject.object;
import atk.selection;
import atk.selection_mixin;

/// Proxy object for [atk.selection.Selection] interface when a GObject has no applicable D binding
class SelectionIfaceProxy : IfaceProxy, atk.selection.Selection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.selection.Selection);
  }

  mixin SelectionT!();
}
