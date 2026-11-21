/// Module for [ValueIfaceProxy] interface proxy object
module gid.atk1.value_iface_proxy;

import gid.gobject2.object;
import gid.atk1.value;
import gid.atk1.value_mixin;

/// Proxy object for [gid.atk1.value.Value] interface when a GObject has no applicable D binding
class ValueIfaceProxy : IfaceProxy, gid.atk1.value.Value
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.value.Value);
  }

  mixin ValueT!();
}
