/// Module for [IndenterIfaceProxy] interface proxy object
module gid.gtksource5.indenter_iface_proxy;

import gid.gobject2.object;
import gid.gtksource5.indenter;
import gid.gtksource5.indenter_mixin;

/// Proxy object for [gid.gtksource5.indenter.Indenter] interface when a GObject has no applicable D binding
class IndenterIfaceProxy : IfaceProxy, gid.gtksource5.indenter.Indenter
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtksource5.indenter.Indenter);
  }

  mixin IndenterT!();
}
