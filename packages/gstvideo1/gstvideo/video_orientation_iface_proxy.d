/// Module for [VideoOrientationIfaceProxy] interface proxy object
module gstvideo.video_orientation_iface_proxy;

import gobject.object;
import gstvideo.video_orientation;
import gstvideo.video_orientation_mixin;

/// Proxy object for [gstvideo.video_orientation.VideoOrientation] interface when a GObject has no applicable D binding
class VideoOrientationIfaceProxy : IfaceProxy, gstvideo.video_orientation.VideoOrientation
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gstvideo.video_orientation.VideoOrientation);
  }

  mixin VideoOrientationT!();
}
