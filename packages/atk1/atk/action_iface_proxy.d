/// Module for [ActionIfaceProxy] interface proxy object
module atk.action_iface_proxy;

import gobject.object;
import atk.action;
import atk.action_mixin;

/// Proxy object for [atk.action.Action] interface when a GObject has no applicable D binding
class ActionIfaceProxy : IfaceProxy, atk.action.Action
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.action.Action);
  }

  mixin ActionT!();
}
