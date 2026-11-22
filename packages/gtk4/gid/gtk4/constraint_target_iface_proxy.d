/// Module for [ConstraintTargetIfaceProxy] interface proxy object
module gid.gtk4.constraint_target_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;

/// Proxy object for [gid.gtk4.constraint_target.ConstraintTarget] interface when a GObject has no applicable D binding
class ConstraintTargetIfaceProxy : IfaceProxy, gid.gtk4.constraint_target.ConstraintTarget
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.constraint_target.ConstraintTarget);
  }

  mixin ConstraintTargetT!();
}
