/// Module for [ActionGroupIfaceProxy] interface proxy object
module gio.action_group_iface_proxy;

import gobject.object;
import gio.action_group;
import gio.action_group_mixin;

/// Proxy object for [gio.action_group.ActionGroup] interface when a GObject has no applicable D binding
class ActionGroupIfaceProxy : IfaceProxy, gio.action_group.ActionGroup
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.action_group.ActionGroup);
  }

  mixin ActionGroupT!();
}
