/// Module for [StreamableContentIfaceProxy] interface proxy object
module gid.atk1.streamable_content_iface_proxy;

import gid.gobject2.object;
import gid.atk1.streamable_content;
import gid.atk1.streamable_content_mixin;

/// Proxy object for [gid.atk1.streamable_content.StreamableContent] interface when a GObject has no applicable D binding
class StreamableContentIfaceProxy : IfaceProxy, gid.atk1.streamable_content.StreamableContent
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.streamable_content.StreamableContent);
  }

  mixin StreamableContentT!();
}
