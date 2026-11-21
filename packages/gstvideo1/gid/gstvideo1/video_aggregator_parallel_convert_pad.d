/// Module for [VideoAggregatorParallelConvertPad] class
module gid.gstvideo1.video_aggregator_parallel_convert_pad;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_aggregator_convert_pad;

/**
    An implementation of GstPad that can be used with #GstVideoAggregator.
    
    See #GstVideoAggregator for more details.
*/
class VideoAggregatorParallelConvertPad : gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad
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
    return cast(void function())gst_video_aggregator_parallel_convert_pad_get_type != &gidSymbolNotFound ? gst_video_aggregator_parallel_convert_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoAggregatorParallelConvertPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoAggregatorParallelConvertPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_aggregator_parallel_convert_pad.VideoAggregatorParallelConvertPad]
      Returns: New builder object
  */
  static VideoAggregatorParallelConvertPadGidBuilder builder() nothrow
  {
    return new VideoAggregatorParallelConvertPadGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_aggregator_parallel_convert_pad.VideoAggregatorParallelConvertPad]
class VideoAggregatorParallelConvertPadGidBuilderImpl(T) : gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPadGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstvideo1.video_aggregator_parallel_convert_pad.VideoAggregatorParallelConvertPad]
final class VideoAggregatorParallelConvertPadGidBuilder : VideoAggregatorParallelConvertPadGidBuilderImpl!VideoAggregatorParallelConvertPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoAggregatorParallelConvertPad build() nothrow
  {
    return new VideoAggregatorParallelConvertPad(cast(void*)createGObject(VideoAggregatorParallelConvertPad._getGType), Yes.Take);
  }
}
