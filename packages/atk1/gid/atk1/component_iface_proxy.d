/// Module for [ComponentIfaceProxy] interface proxy object
module gid.atk1.component_iface_proxy;

import gid.gobject2.object;
import gid.atk1.component;
import gid.atk1.component_mixin;

/// Proxy object for [gid.atk1.component.Component] interface when a GObject has no applicable D binding
class ComponentIfaceProxy : IfaceProxy, gid.atk1.component.Component
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.component.Component);
  }

  mixin ComponentT!();
}
