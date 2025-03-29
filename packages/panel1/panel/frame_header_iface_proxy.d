module panel.frame_header_iface_proxy;

import gobject.object;
import panel.frame_header;
import panel.frame_header_mixin;

/// Proxy object for Panel.FrameHeader interface when a GObject has no applicable D binding
class FrameHeaderIfaceProxy : IfaceProxy, panel.frame_header.FrameHeader
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(panel.frame_header.FrameHeader);
  }

  mixin FrameHeaderT!();
}
