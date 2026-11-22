/// Module for [AsyncResultIfaceProxy] interface proxy object
module gid.gio2.async_result_iface_proxy;

import gid.gobject2.object;
import gid.gio2.async_result;
import gid.gio2.async_result_mixin;

/// Proxy object for [gid.gio2.async_result.AsyncResult] interface when a GObject has no applicable D binding
class AsyncResultIfaceProxy : IfaceProxy, gid.gio2.async_result.AsyncResult
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.async_result.AsyncResult);
  }

  mixin AsyncResultT!();
}
