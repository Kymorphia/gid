/// Module for [ComponentIfaceProxy] interface proxy object
module atk.component_iface_proxy;

import gobject.object;
import atk.component;
import atk.component_mixin;

/// Proxy object for [atk.component.Component] interface when a GObject has no applicable D binding
class ComponentIfaceProxy : IfaceProxy, atk.component.Component
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.component.Component);
  }

  mixin ComponentT!();
}
