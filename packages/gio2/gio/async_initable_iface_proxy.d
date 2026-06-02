/// Module for [AsyncInitableIfaceProxy] interface proxy object
module gio.async_initable_iface_proxy;

import gobject.object;
import gio.async_initable;
import gio.async_initable_mixin;

/// Proxy object for [gio.async_initable.AsyncInitable] interface when a GObject has no applicable D binding
class AsyncInitableIfaceProxy : IfaceProxy, gio.async_initable.AsyncInitable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.async_initable.AsyncInitable);
  }

  mixin AsyncInitableT!();
}
