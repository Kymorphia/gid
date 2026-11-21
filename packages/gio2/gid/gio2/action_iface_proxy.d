/// Module for [ActionIfaceProxy] interface proxy object
module gid.gio2.action_iface_proxy;

import gid.gobject2.object;
import gid.gio2.action;
import gid.gio2.action_mixin;

/// Proxy object for [gid.gio2.action.Action] interface when a GObject has no applicable D binding
class ActionIfaceProxy : IfaceProxy, gid.gio2.action.Action
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.action.Action);
  }

  mixin ActionT!();
}
