/// Module for [BackendIfaceProxy] interface proxy object
module gid.secret1.backend_iface_proxy;

import gid.gobject2.object;
import gid.secret1.backend;
import gid.secret1.backend_mixin;
import gid.gio2.async_initable;
import gid.gio2.async_initable_mixin;

/// Proxy object for [gid.secret1.backend.Backend] interface when a GObject has no applicable D binding
class BackendIfaceProxy : IfaceProxy, gid.secret1.backend.Backend
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.secret1.backend.Backend);
  }

  mixin BackendT!();
  mixin gid.gio2.async_initable_mixin.AsyncInitableT!();
}
