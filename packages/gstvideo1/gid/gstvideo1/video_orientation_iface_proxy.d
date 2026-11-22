/// Module for [VideoOrientationIfaceProxy] interface proxy object
module gid.gstvideo1.video_orientation_iface_proxy;

import gid.gobject2.object;
import gid.gstvideo1.video_orientation;
import gid.gstvideo1.video_orientation_mixin;

/// Proxy object for [gid.gstvideo1.video_orientation.VideoOrientation] interface when a GObject has no applicable D binding
class VideoOrientationIfaceProxy : IfaceProxy, gid.gstvideo1.video_orientation.VideoOrientation
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gstvideo1.video_orientation.VideoOrientation);
  }

  mixin VideoOrientationT!();
}
