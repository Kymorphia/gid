/// Module for [VideoDirection] interface mixin
module gid.gstvideo1.video_direction_mixin;

public import gid.core.basictypes;
public import gid.gstvideo1.video_direction_iface_proxy;
public import gid.core.gid;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gstvideo1.c.functions;
public import gid.gstvideo1.c.types;
public import gid.gstvideo1.types;

/**
    The interface allows unified access to control flipping and rotation
    operations of video-sources or operators.
*/
template VideoDirectionT()
{

  /** */
  @property gid.gstvideo1.types.VideoOrientationMethod videoDirection() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstvideo1.types.VideoOrientationMethod)("video-direction");
  }

  /** */
  @property void videoDirection(gid.gstvideo1.types.VideoOrientationMethod propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstvideo1.types.VideoOrientationMethod)("video-direction", propval);
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_direction.VideoDirection]
template VideoDirectionGidBuilderT()
{

  /** */
  T videoDirection(gid.gstvideo1.types.VideoOrientationMethod propval) nothrow
  {
    return setProperty("video-direction", propval);
  }
}
