/// Module for [VideoOverlayIfaceProxy] interface proxy object
module gid.gstvideo1.video_overlay_iface_proxy;

import gid.gobject2.object;
import gid.gstvideo1.video_overlay;
import gid.gstvideo1.video_overlay_mixin;

/// Proxy object for [gid.gstvideo1.video_overlay.VideoOverlay] interface when a GObject has no applicable D binding
class VideoOverlayIfaceProxy : IfaceProxy, gid.gstvideo1.video_overlay.VideoOverlay
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gstvideo1.video_overlay.VideoOverlay);
  }

  mixin VideoOverlayT!();
}
