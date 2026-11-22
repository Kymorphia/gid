/// Module for [RetrievableIfaceProxy] interface proxy object
module gid.secret1.retrievable_iface_proxy;

import gid.gobject2.object;
import gid.secret1.retrievable;
import gid.secret1.retrievable_mixin;

/// Proxy object for [gid.secret1.retrievable.Retrievable] interface when a GObject has no applicable D binding
class RetrievableIfaceProxy : IfaceProxy, gid.secret1.retrievable.Retrievable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.secret1.retrievable.Retrievable);
  }

  mixin RetrievableT!();
}
