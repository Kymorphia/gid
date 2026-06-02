/// Module for [AsyncResultIfaceProxy] interface proxy object
module gio.async_result_iface_proxy;

import gobject.object;
import gio.async_result;
import gio.async_result_mixin;

/// Proxy object for [gio.async_result.AsyncResult] interface when a GObject has no applicable D binding
class AsyncResultIfaceProxy : IfaceProxy, gio.async_result.AsyncResult
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.async_result.AsyncResult);
  }

  mixin AsyncResultT!();
}
