/// Module for [HoverProviderIfaceProxy] interface proxy object
module gid.gtksource5.hover_provider_iface_proxy;

import gid.gobject2.object;
import gid.gtksource5.hover_provider;
import gid.gtksource5.hover_provider_mixin;

/// Proxy object for [gid.gtksource5.hover_provider.HoverProvider] interface when a GObject has no applicable D binding
class HoverProviderIfaceProxy : IfaceProxy, gid.gtksource5.hover_provider.HoverProvider
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtksource5.hover_provider.HoverProvider);
  }

  mixin HoverProviderT!();
}
