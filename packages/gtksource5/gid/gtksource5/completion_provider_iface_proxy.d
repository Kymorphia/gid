/// Module for [CompletionProviderIfaceProxy] interface proxy object
module gid.gtksource5.completion_provider_iface_proxy;

import gid.gobject2.object;
import gid.gtksource5.completion_provider;
import gid.gtksource5.completion_provider_mixin;

/// Proxy object for [gid.gtksource5.completion_provider.CompletionProvider] interface when a GObject has no applicable D binding
class CompletionProviderIfaceProxy : IfaceProxy, gid.gtksource5.completion_provider.CompletionProvider
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtksource5.completion_provider.CompletionProvider);
  }

  mixin CompletionProviderT!();
}
