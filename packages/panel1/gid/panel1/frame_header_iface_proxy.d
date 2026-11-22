/// Module for [FrameHeaderIfaceProxy] interface proxy object
module gid.panel1.frame_header_iface_proxy;

import gid.gobject2.object;
import gid.panel1.frame_header;
import gid.panel1.frame_header_mixin;

/// Proxy object for [gid.panel1.frame_header.FrameHeader] interface when a GObject has no applicable D binding
class FrameHeaderIfaceProxy : IfaceProxy, gid.panel1.frame_header.FrameHeader
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.panel1.frame_header.FrameHeader);
  }

  mixin FrameHeaderT!();
}
