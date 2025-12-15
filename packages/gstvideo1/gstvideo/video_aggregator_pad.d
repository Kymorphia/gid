/// Module for [VideoAggregatorPad] class
module gstvideo.video_aggregator_pad;

import gid.gid;
import gobject.object;
import gst.buffer;
import gstbase.aggregator_pad;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_frame;

/** */
class VideoAggregatorPad : gstbase.aggregator_pad.AggregatorPad
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
    return cast(void function())gst_video_aggregator_pad_get_type != &gidSymbolNotFound ? gst_video_aggregator_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoAggregatorPad self()
  {
    return this;
  }

  /** */
  @property ulong maxLastBufferRepeat()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("max-last-buffer-repeat");
  }

  /** */
  @property void maxLastBufferRepeat(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("max-last-buffer-repeat", propval);
  }

  /** */
  @property bool repeatAfterEos()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("repeat-after-eos");
  }

  /** */
  @property void repeatAfterEos(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("repeat-after-eos", propval);
  }

  /** */
  @property uint zorder()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("zorder");
  }

  /** */
  @property void zorder(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("zorder", propval);
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
  gst.buffer.Buffer getCurrentBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_video_aggregator_pad_get_current_buffer(cast(GstVideoAggregatorPad*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
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
  gstvideo.video_frame.VideoFrame getPreparedFrame()
  {
    GstVideoFrame* _cretval;
    _cretval = gst_video_aggregator_pad_get_prepared_frame(cast(GstVideoAggregatorPad*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_frame.VideoFrame(cast(GstVideoFrame*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks if the pad currently has a buffer queued that is going to be used
      for the current output frame.
      
      This must only be called from the #GstVideoAggregatorClass::aggregate_frames virtual method,
      or from the #GstVideoAggregatorPadClass::prepare_frame virtual method of the aggregator pads.
      Returns: true if the pad has currently a buffer queued
  */
  bool hasCurrentBuffer()
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
  void setNeedsAlpha(bool needsAlpha)
  {
    gst_video_aggregator_pad_set_needs_alpha(cast(GstVideoAggregatorPad*)this._cPtr, needsAlpha);
  }
}
