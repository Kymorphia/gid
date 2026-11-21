/// Module for [AsyncInitableIfaceProxy] interface proxy object
module gid.gio2.async_initable_iface_proxy;

import gid.gobject2.object;
import gid.gio2.async_initable;
import gid.gio2.async_initable_mixin;

/// Proxy object for [gid.gio2.async_initable.AsyncInitable] interface when a GObject has no applicable D binding
class AsyncInitableIfaceProxy : IfaceProxy, gid.gio2.async_initable.AsyncInitable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.async_initable.AsyncInitable);
  }

  mixin AsyncInitableT!();
}
