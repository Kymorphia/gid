/// Module for [ActionGroupIfaceProxy] interface proxy object
module gid.gio2.action_group_iface_proxy;

import gid.gobject2.object;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;

/// Proxy object for [gid.gio2.action_group.ActionGroup] interface when a GObject has no applicable D binding
class ActionGroupIfaceProxy : IfaceProxy, gid.gio2.action_group.ActionGroup
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.action_group.ActionGroup);
  }

  mixin ActionGroupT!();
}
