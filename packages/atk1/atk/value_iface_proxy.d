/// Module for [ValueIfaceProxy] interface proxy object
module atk.value_iface_proxy;

import gobject.object;
import atk.value;
import atk.value_mixin;

/// Proxy object for [atk.value.Value] interface when a GObject has no applicable D binding
class ValueIfaceProxy : IfaceProxy, atk.value.Value
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.value.Value);
  }

  mixin ValueT!();
}
