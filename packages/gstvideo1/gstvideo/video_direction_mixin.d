/// Module for [VideoDirection] interface mixin
module gstvideo.video_direction_mixin;

public import gstvideo.video_direction_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gobject.object;
public import gstvideo.c.functions;
public import gstvideo.c.types;
public import gstvideo.types;

/**
    The interface allows unified access to control flipping and rotation
    operations of video-sources or operators.
*/
template VideoDirectionT()
{

  /** */
  @property gstvideo.types.VideoOrientationMethod videoDirection()
  {
    return gobject.object.ObjectWrap.getProperty!(gstvideo.types.VideoOrientationMethod)("video-direction");
  }

  /** */
  @property void videoDirection(gstvideo.types.VideoOrientationMethod propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstvideo.types.VideoOrientationMethod)("video-direction", propval);
  }
}

/// Fluent builder implementation template for [gstvideo.video_direction.VideoDirection]
template VideoDirectionGidBuilderT()
{

  /** */
  T videoDirection(gstvideo.types.VideoOrientationMethod propval)
  {
    return setProperty("video-direction", propval);
  }
}
