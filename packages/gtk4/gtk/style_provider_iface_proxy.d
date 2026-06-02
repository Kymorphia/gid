/// Module for [StyleProviderIfaceProxy] interface proxy object
module gtk.style_provider_iface_proxy;

import gobject.object;
import gtk.style_provider;
import gtk.style_provider_mixin;

/// Proxy object for [gtk.style_provider.StyleProvider] interface when a GObject has no applicable D binding
class StyleProviderIfaceProxy : IfaceProxy, gtk.style_provider.StyleProvider
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.style_provider.StyleProvider);
  }

  mixin StyleProviderT!();
}
