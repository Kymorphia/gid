/// Module for [VideoDirection] interface
module gid.gstvideo1.video_direction;

public import gid.core.basictypes;
public import gid.gstvideo1.video_direction_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/**
    The interface allows unified access to control flipping and rotation
    operations of video-sources or operators.
*/
@gidGir("VideoDirection", "VideoDirectionInterface")
interface VideoDirection : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_video_direction_get_type != &gidSymbolNotFound ? gst_video_direction_get_type() : cast(GType)0;
  }

  /** */
  @property gid.gstvideo1.types.VideoOrientationMethod videoDirection() nothrow;

  /** */
  @property void videoDirection(gid.gstvideo1.types.VideoOrientationMethod propval) nothrow;
}

/// Fluent builder implementation template for [gid.gstvideo1.video_direction.VideoDirection]
interface VideoDirectionGidBuilderImpl(T)
{

  /** */
  T videoDirection(gid.gstvideo1.types.VideoOrientationMethod propval) nothrow;
}
