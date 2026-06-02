/// Module for [CompletionProviderIfaceProxy] interface proxy object
module gtksource.completion_provider_iface_proxy;

import gobject.object;
import gtksource.completion_provider;
import gtksource.completion_provider_mixin;

/// Proxy object for [gtksource.completion_provider.CompletionProvider] interface when a GObject has no applicable D binding
class CompletionProviderIfaceProxy : IfaceProxy, gtksource.completion_provider.CompletionProvider
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtksource.completion_provider.CompletionProvider);
  }

  mixin CompletionProviderT!();
}
