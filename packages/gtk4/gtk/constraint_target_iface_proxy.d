/// Module for [ConstraintTargetIfaceProxy] interface proxy object
module gtk.constraint_target_iface_proxy;

import gobject.object;
import gtk.constraint_target;
import gtk.constraint_target_mixin;

/// Proxy object for [gtk.constraint_target.ConstraintTarget] interface when a GObject has no applicable D binding
class ConstraintTargetIfaceProxy : IfaceProxy, gtk.constraint_target.ConstraintTarget
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.constraint_target.ConstraintTarget);
  }

  mixin ConstraintTargetT!();
}
