/// Module for [VideoDirectionIfaceProxy] interface proxy object
module gstvideo.video_direction_iface_proxy;

import gobject.object;
import gstvideo.video_direction;
import gstvideo.video_direction_mixin;

/// Proxy object for [gstvideo.video_direction.VideoDirection] interface when a GObject has no applicable D binding
class VideoDirectionIfaceProxy : IfaceProxy, gstvideo.video_direction.VideoDirection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gstvideo.video_direction.VideoDirection);
  }

  mixin VideoDirectionT!();
}
