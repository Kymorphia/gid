/// Module for [ActionableIfaceProxy] interface proxy object
module gid.gtk3.actionable_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;

/// Proxy object for [gid.gtk3.actionable.Actionable] interface when a GObject has no applicable D binding
class ActionableIfaceProxy : IfaceProxy, gid.gtk3.actionable.Actionable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.actionable.Actionable);
  }

  mixin ActionableT!();
}
