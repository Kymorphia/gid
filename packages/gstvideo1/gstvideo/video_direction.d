/// Module for [VideoDirection] interface
module gstvideo.video_direction;

public import gstvideo.video_direction_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    The interface allows unified access to control flipping and rotation
    operations of video-sources or operators.
*/
interface VideoDirection
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_direction_get_type != &gidSymbolNotFound ? gst_video_direction_get_type() : cast(GType)0;
  }

  /** */
  @property gstvideo.types.VideoOrientationMethod videoDirection();

  /** */
  @property void videoDirection(gstvideo.types.VideoOrientationMethod propval);
}

/// Fluent builder implementation template for [gstvideo.video_direction.VideoDirection]
interface VideoDirectionGidBuilderImpl(T)
{

  /** */
  T videoDirection(gstvideo.types.VideoOrientationMethod propval);
}
