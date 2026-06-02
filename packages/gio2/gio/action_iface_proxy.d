/// Module for [ActionIfaceProxy] interface proxy object
module gio.action_iface_proxy;

import gobject.object;
import gio.action;
import gio.action_mixin;

/// Proxy object for [gio.action.Action] interface when a GObject has no applicable D binding
class ActionIfaceProxy : IfaceProxy, gio.action.Action
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.action.Action);
  }

  mixin ActionT!();
}
