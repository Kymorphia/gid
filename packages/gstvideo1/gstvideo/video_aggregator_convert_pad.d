/// Module for [VideoAggregatorConvertPad] class
module gstvideo.video_aggregator_convert_pad;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.structure;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_aggregator_pad;

/**
    An implementation of GstPad that can be used with #GstVideoAggregator.
    
    See #GstVideoAggregator for more details.
*/
class VideoAggregatorConvertPad : gstvideo.video_aggregator_pad.VideoAggregatorPad
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_aggregator_convert_pad_get_type != &gidSymbolNotFound ? gst_video_aggregator_convert_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoAggregatorConvertPad self()
  {
    return this;
  }

  /**
  Get builder for [gstvideo.video_aggregator_convert_pad.VideoAggregatorConvertPad]
  Returns: New builder object
  */
  static VideoAggregatorConvertPadGidBuilder builder()
  {
    return new VideoAggregatorConvertPadGidBuilder;
  }

  /** */
  @property gst.structure.Structure converterConfig()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.structure.Structure)("converter-config");
  }

  /** */
  @property void converterConfig(gst.structure.Structure propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.structure.Structure)("converter-config", propval);
  }

  /**
      Requests the pad to check and update the converter before the next usage to
      update for any changes that have happened.
  */
  void updateConversionInfo()
  {
    gst_video_aggregator_convert_pad_update_conversion_info(cast(GstVideoAggregatorConvertPad*)this._cPtr);
  }
}

class VideoAggregatorConvertPadGidBuilderImpl(T) : gstvideo.video_aggregator_pad.VideoAggregatorPadGidBuilderImpl!T
{

  /** */
  T converterConfig(gst.structure.Structure propval)
  {
    return setProperty("converter-config", propval);
  }
}

/// Fluent builder for [gstvideo.video_aggregator_convert_pad.VideoAggregatorConvertPad]
final class VideoAggregatorConvertPadGidBuilder : VideoAggregatorConvertPadGidBuilderImpl!VideoAggregatorConvertPadGidBuilder
{
  VideoAggregatorConvertPad build()
  {
    return new VideoAggregatorConvertPad(cast(void*)createGObject(VideoAggregatorConvertPad._getGType), No.Take);
  }
}
