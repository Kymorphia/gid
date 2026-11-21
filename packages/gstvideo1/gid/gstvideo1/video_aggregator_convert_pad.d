/// Module for [VideoAggregatorConvertPad] class
module gid.gstvideo1.video_aggregator_convert_pad;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.structure;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_aggregator_pad;

/**
    An implementation of GstPad that can be used with #GstVideoAggregator.
    
    See #GstVideoAggregator for more details.
*/
class VideoAggregatorConvertPad : gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad
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
    return cast(void function())gst_video_aggregator_convert_pad_get_type != &gidSymbolNotFound ? gst_video_aggregator_convert_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoAggregatorConvertPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoAggregatorConvertPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad]
      Returns: New builder object
  */
  static VideoAggregatorConvertPadGidBuilder builder() nothrow
  {
    return new VideoAggregatorConvertPadGidBuilder;
  }

  /** */
  @property gid.gst1.structure.Structure converterConfig() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.structure.Structure)("converter-config");
  }

  /** */
  @property void converterConfig(gid.gst1.structure.Structure propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.structure.Structure)("converter-config", propval);
  }

  /**
      Requests the pad to check and update the converter before the next usage to
      update for any changes that have happened.
  */
  void updateConversionInfo() nothrow
  {
    gst_video_aggregator_convert_pad_update_conversion_info(cast(GstVideoAggregatorConvertPad*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad]
class VideoAggregatorConvertPadGidBuilderImpl(T) : gid.gstvideo1.video_aggregator_pad.VideoAggregatorPadGidBuilderImpl!T
{

  /** */
  T converterConfig(gid.gst1.structure.Structure propval) nothrow
  {
    return setProperty("converter-config", propval);
  }
}

/// Fluent builder for [gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad]
final class VideoAggregatorConvertPadGidBuilder : VideoAggregatorConvertPadGidBuilderImpl!VideoAggregatorConvertPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoAggregatorConvertPad build() nothrow
  {
    return new VideoAggregatorConvertPad(cast(void*)createGObject(VideoAggregatorConvertPad._getGType), Yes.Take);
  }
}
