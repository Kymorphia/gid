/// Module for [VideoAggregatorPad] class
module gid.gstvideo1.video_aggregator_pad;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gstbase1.aggregator_pad;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_frame;

/** */
class VideoAggregatorPad : gid.gstbase1.aggregator_pad.AggregatorPad
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
    return cast(void function())gst_video_aggregator_pad_get_type != &gidSymbolNotFound ? gst_video_aggregator_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoAggregatorPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoAggregatorPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad]
      Returns: New builder object
  */
  static VideoAggregatorPadGidBuilder builder() nothrow
  {
    return new VideoAggregatorPadGidBuilder;
  }

  /** */
  @property ulong maxLastBufferRepeat() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("max-last-buffer-repeat");
  }

  /** */
  @property void maxLastBufferRepeat(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("max-last-buffer-repeat", propval);
  }

  /** */
  @property bool repeatAfterEos() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("repeat-after-eos");
  }

  /** */
  @property void repeatAfterEos(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("repeat-after-eos", propval);
  }

  /** */
  @property uint zorder() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("zorder");
  }

  /** */
  @property void zorder(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("zorder", propval);
  }

  /**
      Returns the currently queued buffer that is going to be used
      for the current output frame.
      
      This must only be called from the #GstVideoAggregatorClass::aggregate_frames virtual method,
      or from the #GstVideoAggregatorPadClass::prepare_frame virtual method of the aggregator pads.
      
      The return value is only valid until #GstVideoAggregatorClass::aggregate_frames or #GstVideoAggregatorPadClass::prepare_frame
      returns.
      Returns: The currently queued buffer
  */
  gid.gst1.buffer.Buffer getCurrentBuffer() nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_video_aggregator_pad_get_current_buffer(cast(GstVideoAggregatorPad*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the currently prepared video frame that has to be aggregated into
      the current output frame.
      
      This must only be called from the #GstVideoAggregatorClass::aggregate_frames virtual method,
      or from the #GstVideoAggregatorPadClass::prepare_frame virtual method of the aggregator pads.
      
      The return value is only valid until #GstVideoAggregatorClass::aggregate_frames or #GstVideoAggregatorPadClass::prepare_frame
      returns.
      Returns: The currently prepared video frame
  */
  gid.gstvideo1.video_frame.VideoFrame getPreparedFrame() nothrow
  {
    GstVideoFrame* _cretval;
    _cretval = gst_video_aggregator_pad_get_prepared_frame(cast(GstVideoAggregatorPad*)this._cPtr);
    auto _retval = _cretval ? new gid.gstvideo1.video_frame.VideoFrame(cast(GstVideoFrame*)_cretval, this) : null;
    return _retval;
  }

  /**
      Checks if the pad currently has a buffer queued that is going to be used
      for the current output frame.
      
      This must only be called from the #GstVideoAggregatorClass::aggregate_frames virtual method,
      or from the #GstVideoAggregatorPadClass::prepare_frame virtual method of the aggregator pads.
      Returns: true if the pad has currently a buffer queued
  */
  bool hasCurrentBuffer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_aggregator_pad_has_current_buffer(cast(GstVideoAggregatorPad*)this._cPtr);
    return _retval;
  }

  /**
      Allows selecting that this pad requires an output format with alpha
  
      Params:
        needsAlpha = true if this pad requires alpha output
  */
  void setNeedsAlpha(bool needsAlpha) nothrow
  {
    gst_video_aggregator_pad_set_needs_alpha(cast(GstVideoAggregatorPad*)this._cPtr, needsAlpha);
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad]
class VideoAggregatorPadGidBuilderImpl(T) : gid.gstbase1.aggregator_pad.AggregatorPadGidBuilderImpl!T
{

  /** */
  T maxLastBufferRepeat(ulong propval) nothrow
  {
    return setProperty("max-last-buffer-repeat", propval);
  }

  /** */
  T repeatAfterEos(bool propval) nothrow
  {
    return setProperty("repeat-after-eos", propval);
  }

  /** */
  T zorder(uint propval) nothrow
  {
    return setProperty("zorder", propval);
  }
}

/// Fluent builder for [gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad]
final class VideoAggregatorPadGidBuilder : VideoAggregatorPadGidBuilderImpl!VideoAggregatorPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoAggregatorPad build() nothrow
  {
    return new VideoAggregatorPad(cast(void*)createGObject(VideoAggregatorPad._getGType), Yes.Take);
  }
}
