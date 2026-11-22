/// Module for [VideoDirectionIfaceProxy] interface proxy object
module gid.gstvideo1.video_direction_iface_proxy;

import gid.gobject2.object;
import gid.gstvideo1.video_direction;
import gid.gstvideo1.video_direction_mixin;

/// Proxy object for [gid.gstvideo1.video_direction.VideoDirection] interface when a GObject has no applicable D binding
class VideoDirectionIfaceProxy : IfaceProxy, gid.gstvideo1.video_direction.VideoDirection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gstvideo1.video_direction.VideoDirection);
  }

  mixin VideoDirectionT!();
}
