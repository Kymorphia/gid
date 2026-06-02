/// Module for [ActionMapIfaceProxy] interface proxy object
module gio.action_map_iface_proxy;

import gobject.object;
import gio.action_map;
import gio.action_map_mixin;

/// Proxy object for [gio.action_map.ActionMap] interface when a GObject has no applicable D binding
class ActionMapIfaceProxy : IfaceProxy, gio.action_map.ActionMap
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.action_map.ActionMap);
  }

  mixin ActionMapT!();
}
