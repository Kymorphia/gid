/// Module for [WritableIfaceProxy] interface proxy object
module arrow.writable_iface_proxy;

import gobject.object;
import arrow.writable;
import arrow.writable_mixin;

/// Proxy object for [arrow.writable.Writable] interface when a GObject has no applicable D binding
class WritableIfaceProxy : IfaceProxy, arrow.writable.Writable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(arrow.writable.Writable);
  }

  mixin WritableT!();
}
