/// Module for [StyleProviderIfaceProxy] interface proxy object
module gid.gtk4.style_provider_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.style_provider;
import gid.gtk4.style_provider_mixin;

/// Proxy object for [gid.gtk4.style_provider.StyleProvider] interface when a GObject has no applicable D binding
class StyleProviderIfaceProxy : IfaceProxy, gid.gtk4.style_provider.StyleProvider
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.style_provider.StyleProvider);
  }

  mixin StyleProviderT!();
}
