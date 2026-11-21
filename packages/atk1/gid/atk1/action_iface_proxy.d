/// Module for [ActionIfaceProxy] interface proxy object
module gid.atk1.action_iface_proxy;

import gid.gobject2.object;
import gid.atk1.action;
import gid.atk1.action_mixin;

/// Proxy object for [gid.atk1.action.Action] interface when a GObject has no applicable D binding
class ActionIfaceProxy : IfaceProxy, gid.atk1.action.Action
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.action.Action);
  }

  mixin ActionT!();
}
