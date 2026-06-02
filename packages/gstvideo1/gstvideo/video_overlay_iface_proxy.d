/// Module for [VideoOverlayIfaceProxy] interface proxy object
module gstvideo.video_overlay_iface_proxy;

import gobject.object;
import gstvideo.video_overlay;
import gstvideo.video_overlay_mixin;

/// Proxy object for [gstvideo.video_overlay.VideoOverlay] interface when a GObject has no applicable D binding
class VideoOverlayIfaceProxy : IfaceProxy, gstvideo.video_overlay.VideoOverlay
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gstvideo.video_overlay.VideoOverlay);
  }

  mixin VideoOverlayT!();
}
