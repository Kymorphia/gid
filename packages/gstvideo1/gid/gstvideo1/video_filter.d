/// Module for [VideoFilter] class
module gid.gstvideo1.video_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstbase1.base_transform;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/**
    Provides useful functions and a base class for video filters.
    
    The videofilter will by default enable QoS on the parent GstBaseTransform
    to implement frame dropping.
*/
class VideoFilter : gid.gstbase1.base_transform.BaseTransform
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_video_filter_get_type != &gidSymbolNotFound ? gst_video_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_filter.VideoFilter]
      Returns: New builder object
  */
  static VideoFilterGidBuilder builder() nothrow
  {
    return new VideoFilterGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_filter.VideoFilter]
class VideoFilterGidBuilderImpl(T) : gid.gstbase1.base_transform.BaseTransformGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstvideo1.video_filter.VideoFilter]
final class VideoFilterGidBuilder : VideoFilterGidBuilderImpl!VideoFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoFilter build() nothrow
  {
    return new VideoFilter(cast(void*)createGObject(VideoFilter._getGType), Yes.Take);
  }
}
