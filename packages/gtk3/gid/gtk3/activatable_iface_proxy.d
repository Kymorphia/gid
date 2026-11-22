/// Module for [ActivatableIfaceProxy] interface proxy object
module gid.gtk3.activatable_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;

/// Proxy object for [gid.gtk3.activatable.Activatable] interface when a GObject has no applicable D binding
class ActivatableIfaceProxy : IfaceProxy, gid.gtk3.activatable.Activatable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.activatable.Activatable);
  }

  mixin ActivatableT!();
}
