/// Module for [BackendIfaceProxy] interface proxy object
module secret.backend_iface_proxy;

import gobject.object;
import secret.backend;
import secret.backend_mixin;

/// Proxy object for [secret.backend.Backend] interface when a GObject has no applicable D binding
class BackendIfaceProxy : IfaceProxy, secret.backend.Backend
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(secret.backend.Backend);
  }

  mixin BackendT!();
}
