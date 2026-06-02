/// Module for [StreamableContentIfaceProxy] interface proxy object
module atk.streamable_content_iface_proxy;

import gobject.object;
import atk.streamable_content;
import atk.streamable_content_mixin;

/// Proxy object for [atk.streamable_content.StreamableContent] interface when a GObject has no applicable D binding
class StreamableContentIfaceProxy : IfaceProxy, atk.streamable_content.StreamableContent
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(atk.streamable_content.StreamableContent);
  }

  mixin StreamableContentT!();
}
