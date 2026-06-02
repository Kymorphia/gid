/// Module for [ImplementorIfaceIfaceProxy] interface proxy object
module atk.implementor_iface_iface_proxy;

import gobject.object;
import atk.implementor_iface;
import atk.implementor_iface_mixin;

/// Proxy object for [atk.implementor_iface.ImplementorIface] interface when a GObject has no applicable D binding
class ImplementorIfaceIfaceProxy : IfaceProxy, atk.implementor_iface.ImplementorIface
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.implementor_iface.ImplementorIface);
  }

  mixin ImplementorIfaceT!();
}
