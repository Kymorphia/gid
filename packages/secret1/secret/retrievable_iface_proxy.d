/// Module for [RetrievableIfaceProxy] interface proxy object
module secret.retrievable_iface_proxy;

import gobject.object;
import secret.retrievable;
import secret.retrievable_mixin;

/// Proxy object for [secret.retrievable.Retrievable] interface when a GObject has no applicable D binding
class RetrievableIfaceProxy : IfaceProxy, secret.retrievable.Retrievable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(secret.retrievable.Retrievable);
  }

  mixin RetrievableT!();
}
