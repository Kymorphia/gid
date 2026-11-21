/// Module for [ImplementorIfaceIfaceProxy] interface proxy object
module gid.atk1.implementor_iface_iface_proxy;

import gid.gobject2.object;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;

/// Proxy object for [gid.atk1.implementor_iface.ImplementorIface] interface when a GObject has no applicable D binding
class ImplementorIfaceIfaceProxy : IfaceProxy, gid.atk1.implementor_iface.ImplementorIface
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.implementor_iface.ImplementorIface);
  }

  mixin ImplementorIfaceT!();
}
