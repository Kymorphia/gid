/// Module for [ActionableIfaceProxy] interface proxy object
module gid.gtk4.actionable_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;

/// Proxy object for [gid.gtk4.actionable.Actionable] interface when a GObject has no applicable D binding
class ActionableIfaceProxy : IfaceProxy, gid.gtk4.actionable.Actionable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.actionable.Actionable);
  }

  mixin ActionableT!();
}
