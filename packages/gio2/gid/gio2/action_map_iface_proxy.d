/// Module for [ActionMapIfaceProxy] interface proxy object
module gid.gio2.action_map_iface_proxy;

import gid.gobject2.object;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;

/// Proxy object for [gid.gio2.action_map.ActionMap] interface when a GObject has no applicable D binding
class ActionMapIfaceProxy : IfaceProxy, gid.gio2.action_map.ActionMap
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.action_map.ActionMap);
  }

  mixin ActionMapT!();
}
