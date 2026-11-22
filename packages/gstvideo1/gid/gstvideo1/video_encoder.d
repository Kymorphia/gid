/// Module for [VideoEncoder] class
module gid.gstvideo1.video_encoder;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.allocation_params;
import gid.gst1.allocator;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.preset;
import gid.gst1.preset_mixin;
import gid.gst1.tag_list;
import gid.gst1.types;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_codec_frame;
import gid.gstvideo1.video_codec_state;

/**
    This base class is for video encoders turning raw video into
    encoded video data.
    
    GstVideoEncoder and subclass should cooperate as follows.
    
    ## Configuration
    
      * Initially, GstVideoEncoder calls @start when the encoder element
        is activated, which allows subclass to perform any global setup.
      * GstVideoEncoder calls @set_format to inform subclass of the format
        of input video data that it is about to receive.  Subclass should
        setup for encoding and configure base class as appropriate
        (e.g. latency). While unlikely, it might be called more than once,
        if changing input parameters require reconfiguration.  Baseclass
        will ensure that processing of current configuration is finished.
      * GstVideoEncoder calls @stop at end of all processing.
    
    ## Data processing
    
        * Base class collects input data and metadata into a frame and hands
          this to subclass' @handle_frame.
    
        * If codec processing results in encoded data, subclass should call
          @gst_video_encoder_finish_frame to have encoded data pushed
          downstream.
    
        * If implemented, baseclass calls subclass @pre_push just prior to
          pushing to allow subclasses to modify some metadata on the buffer.
          If it returns GST_FLOW_OK, the buffer is pushed downstream.
    
        * GstVideoEncoderClass will handle both srcpad and sinkpad events.
          Sink events will be passed to subclass if @event callback has been
          provided.
    
    ## Shutdown phase
    
      * GstVideoEncoder class calls @stop to inform the subclass that data
        parsing will be stopped.
    
    Subclass is responsible for providing pad template caps for
    source and sink pads. The pads need to be named "sink" and "src". It should
    also be able to provide fixed src pad caps in @getcaps by the time it calls
    @gst_video_encoder_finish_frame.
    
    Things that subclass need to take care of:
    
      * Provide pad templates
      * Provide source pad caps before pushing the first buffer
      * Accept data in @handle_frame and provide encoded results to
         @gst_video_encoder_finish_frame.
    
    
    The #GstVideoEncoder:qos property will enable the Quality-of-Service
    features of the encoder which gather statistics about the real-time
    performance of the downstream elements. If enabled, subclasses can
    use [gid.gstvideo1.video_encoder.VideoEncoder.getMaxEncodeTime] to check if input frames
    are already late and drop them right away to give a chance to the
    pipeline to catch up.
*/
class VideoEncoder : gid.gst1.element.Element, gid.gst1.preset.Preset
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
    return cast(void function())gst_video_encoder_get_type != &gidSymbolNotFound ? gst_video_encoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoEncoder";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoEncoder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_encoder.VideoEncoder]
      Returns: New builder object
  */
  static VideoEncoderGidBuilder builder() nothrow
  {
    return new VideoEncoderGidBuilder;
  }

  /**
      Get `minForceKeyUnitInterval` property.
      Returns: Minimum interval between force-keyunit requests in nanoseconds. See
        [gid.gstvideo1.video_encoder.VideoEncoder.setMinForceKeyUnitInterval] for more details.
  */
  @property ulong minForceKeyUnitInterval() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("min-force-key-unit-interval");
  }

  /**
      Set `minForceKeyUnitInterval` property.
      Params:
        propval = Minimum interval between force-keyunit requests in nanoseconds. See
          [gid.gstvideo1.video_encoder.VideoEncoder.setMinForceKeyUnitInterval] for more details.
  */
  @property void minForceKeyUnitInterval(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("min-force-key-unit-interval", propval);
  }

  /** */
  @property bool qos() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("qos");
  }

  /** */
  @property void qos(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("qos", propval);
  }

  mixin PresetT!();

  /**
      Helper function that allocates a buffer to hold an encoded video frame
      for encoder's current #GstVideoCodecState.
  
      Params:
        size = size of the buffer
      Returns: allocated buffer
  */
  gid.gst1.buffer.Buffer allocateOutputBuffer(size_t size) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_video_encoder_allocate_output_buffer(cast(GstVideoEncoder*)this._cPtr, size);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Helper function that allocates a buffer to hold an encoded video frame for encoder's
      current #GstVideoCodecState.  Subclass should already have configured video
      state and set src pad caps.
      
      The buffer allocated here is owned by the frame and you should only
      keep references to the frame, not the buffer.
  
      Params:
        frame = a #GstVideoCodecFrame
        size = size of the buffer
      Returns: [gid.gst1.types.FlowReturn.Ok] if an output buffer could be allocated
  */
  gid.gst1.types.FlowReturn allocateOutputFrame(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame, size_t size) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_encoder_allocate_output_frame(cast(GstVideoEncoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null, size);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Removes frame from the list of pending frames, releases it
      and posts a QoS message with the frame's details on the bus.
      Similar to calling [gid.gstvideo1.video_encoder.VideoEncoder.finishFrame] without a buffer
      attached to frame, but this function additionally stores events
      from frame as pending, to be pushed out alongside the next frame
      submitted via [gid.gstvideo1.video_encoder.VideoEncoder.finishFrame].
  
      Params:
        frame = a #GstVideoCodecFrame
  */
  void dropFrame(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    gst_video_encoder_drop_frame(cast(GstVideoEncoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
  }

  /**
      frame must have a valid encoded data buffer, whose metadata fields
      are then appropriately set according to frame data or no buffer at
      all if the frame should be dropped.
      It is subsequently pushed downstream or provided to pre_push.
      In any case, the frame is considered finished and released.
      
      If frame does not have a buffer attached, it will be dropped, and
      a QoS message will be posted on the bus. Events from frame will be
      pushed out immediately.
      
      After calling this function the output buffer of the frame is to be
      considered read-only. This function will also change the metadata
      of the buffer.
  
      Params:
        frame = an encoded #GstVideoCodecFrame
      Returns: a #GstFlowReturn resulting from sending data downstream
  */
  gid.gst1.types.FlowReturn finishFrame(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_encoder_finish_frame(cast(GstVideoEncoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      If multiple subframes are produced for one input frame then use this method
      for each subframe, except for the last one. Before calling this function,
      you need to fill frame->output_buffer with the encoded buffer to push.
      
      You must call #[gid.gstvideo1.video_encoder.VideoEncoder.finishFrame] for the last sub-frame
      to tell the encoder that the frame has been fully encoded.
      
      This function will change the metadata of frame and frame->output_buffer
      will be pushed downstream.
  
      Params:
        frame = a #GstVideoCodecFrame being encoded
      Returns: a #GstFlowReturn resulting from pushing the buffer downstream.
  */
  gid.gst1.types.FlowReturn finishSubframe(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_encoder_finish_subframe(cast(GstVideoEncoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Lets #GstVideoEncoder sub-classes to know the memory allocator
      used by the base class and its params.
      
      Unref the allocator after use it.
  
      Params:
        allocator = the #GstAllocator
          used
        params = the
          #GstAllocationParams of allocator
  */
  void getAllocator(out gid.gst1.allocator.Allocator allocator, out gid.gst1.allocation_params.AllocationParams params) nothrow
  {
    GstAllocator* _allocator;
    gst_video_encoder_get_allocator(cast(GstVideoEncoder*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(_allocator, Yes.Take);
  }

  /**
      Get a pending unfinished #GstVideoCodecFrame
  
      Params:
        frameNumber = system_frame_number of a frame
      Returns: pending unfinished #GstVideoCodecFrame identified by frame_number.
  */
  gid.gstvideo1.video_codec_frame.VideoCodecFrame getFrame(int frameNumber) nothrow
  {
    GstVideoCodecFrame* _cretval;
    _cretval = gst_video_encoder_get_frame(cast(GstVideoEncoder*)this._cPtr, frameNumber);
    auto _retval = _cretval ? new gid.gstvideo1.video_codec_frame.VideoCodecFrame(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get all pending unfinished #GstVideoCodecFrame
      Returns: pending unfinished #GstVideoCodecFrame.
  */
  gid.gstvideo1.video_codec_frame.VideoCodecFrame[] getFrames() nothrow
  {
    GList* _cretval;
    _cretval = gst_video_encoder_get_frames(cast(GstVideoEncoder*)this._cPtr);
    auto _retval = gListToD!(gid.gstvideo1.video_codec_frame.VideoCodecFrame, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Query the configured encoding latency. Results will be returned via
      min_latency and max_latency.
  
      Params:
        minLatency = address of variable in which to store the
              configured minimum latency, or null
        maxLatency = address of variable in which to store the
              configured maximum latency, or null
  */
  void getLatency(out gid.gst1.types.ClockTime minLatency, out gid.gst1.types.ClockTime maxLatency) nothrow
  {
    gst_video_encoder_get_latency(cast(GstVideoEncoder*)this._cPtr, cast(GstClockTime*)&minLatency, cast(GstClockTime*)&maxLatency);
  }

  /**
      Determines maximum possible encoding time for frame that will
      allow it to encode and arrive in time (as determined by QoS events).
      In particular, a negative result means encoding in time is no longer possible
      and should therefore occur as soon/skippy as possible.
      
      If no QoS events have been received from downstream, or if
      #GstVideoEncoder:qos is disabled this function returns #G_MAXINT64.
  
      Params:
        frame = a #GstVideoCodecFrame
      Returns: max decoding time.
  */
  gid.gst1.types.ClockTimeDiff getMaxEncodeTime(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    gid.gst1.types.ClockTimeDiff _retval;
    _retval = gst_video_encoder_get_max_encode_time(cast(GstVideoEncoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the minimum force-keyunit interval, see [gid.gstvideo1.video_encoder.VideoEncoder.setMinForceKeyUnitInterval]
      for more details.
      Returns: the minimum force-keyunit interval
  */
  gid.gst1.types.ClockTime getMinForceKeyUnitInterval() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_video_encoder_get_min_force_key_unit_interval(cast(GstVideoEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Get the oldest unfinished pending #GstVideoCodecFrame
      Returns: oldest unfinished pending #GstVideoCodecFrame
  */
  gid.gstvideo1.video_codec_frame.VideoCodecFrame getOldestFrame() nothrow
  {
    GstVideoCodecFrame* _cretval;
    _cretval = gst_video_encoder_get_oldest_frame(cast(GstVideoEncoder*)this._cPtr);
    auto _retval = _cretval ? new gid.gstvideo1.video_codec_frame.VideoCodecFrame(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the current #GstVideoCodecState
      Returns: #GstVideoCodecState describing format of video data.
  */
  gid.gstvideo1.video_codec_state.VideoCodecState getOutputState() nothrow
  {
    GstVideoCodecState* _cretval;
    _cretval = gst_video_encoder_get_output_state(cast(GstVideoEncoder*)this._cPtr);
    auto _retval = _cretval ? new gid.gstvideo1.video_codec_state.VideoCodecState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if encoder is currently configured to handle Quality-of-Service
      events from downstream.
      Returns: true if the encoder is configured to perform Quality-of-Service.
  */
  bool isQosEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_encoder_is_qos_enabled(cast(GstVideoEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Sets the video encoder tags and how they should be merged with any
      upstream stream tags. This will override any tags previously-set
      with [gid.gstvideo1.video_encoder.VideoEncoder.mergeTags].
      
      Note that this is provided for convenience, and the subclass is
      not required to use this and can still do tag handling on its own.
      
      MT safe.
  
      Params:
        tags = a #GstTagList to merge, or NULL to unset
              previously-set tags
        mode = the #GstTagMergeMode to use, usually #GST_TAG_MERGE_REPLACE
  */
  void mergeTags(gid.gst1.tag_list.TagList tags, gid.gst1.types.TagMergeMode mode) nothrow
  {
    gst_video_encoder_merge_tags(cast(GstVideoEncoder*)this._cPtr, tags ? cast(const(GstTagList)*)tags._cPtr(No.Dup) : null, mode);
  }

  /**
      Negotiate with downstream elements to currently configured #GstVideoCodecState.
      Unmark GST_PAD_FLAG_NEED_RECONFIGURE in any case. But mark it again if
      negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  */
  bool negotiate() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_encoder_negotiate(cast(GstVideoEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Returns caps that express caps (or sink template caps if caps == NULL)
      restricted to resolution/format/... combinations supported by downstream
      elements (e.g. muxers).
  
      Params:
        caps = initial caps
        filter = filter caps
      Returns: a #GstCaps owned by caller
  */
  gid.gst1.caps.Caps proxyGetcaps(gid.gst1.caps.Caps caps = null, gid.gst1.caps.Caps filter = null) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_video_encoder_proxy_getcaps(cast(GstVideoEncoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Removes frame from list of pending frames and releases it, similar
      to calling [gid.gstvideo1.video_encoder.VideoEncoder.finishFrame] without a buffer attached
      to the frame, but does not post a QoS message or do any additional
      processing. Events from frame are moved to the pending events list.
  
      Params:
        frame = a #GstVideoCodecFrame
  */
  void releaseFrame(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    gst_video_encoder_release_frame(cast(GstVideoEncoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
  }

  /**
      Set the codec headers to be sent downstream whenever requested.
  
      Params:
        headers = a list of #GstBuffer containing the codec header
  */
  void setHeaders(gid.gst1.buffer.Buffer[] headers) nothrow
  {
    auto _headers = gListFromD!(gid.gst1.buffer.Buffer)(headers);
    gst_video_encoder_set_headers(cast(GstVideoEncoder*)this._cPtr, _headers);
  }

  /**
      Informs baseclass of encoding latency. If the provided values changed from
      previously provided ones, this will also post a LATENCY message on the bus
      so the pipeline can reconfigure its global latency.
  
      Params:
        minLatency = minimum latency
        maxLatency = maximum latency
  */
  void setLatency(gid.gst1.types.ClockTime minLatency, gid.gst1.types.ClockTime maxLatency) nothrow
  {
    gst_video_encoder_set_latency(cast(GstVideoEncoder*)this._cPtr, minLatency, maxLatency);
  }

  /**
      Sets the minimum interval for requesting keyframes based on force-keyunit
      events. Setting this to 0 will allow to handle every event, setting this to
      [gid.gst1.types.CLOCK_TIME_NONE] causes force-keyunit events to be ignored.
  
      Params:
        interval = minimum interval
  */
  void setMinForceKeyUnitInterval(gid.gst1.types.ClockTime interval) nothrow
  {
    gst_video_encoder_set_min_force_key_unit_interval(cast(GstVideoEncoder*)this._cPtr, interval);
  }

  /**
      Request minimal value for PTS passed to handle_frame.
      
      For streams with reordered frames this can be used to ensure that there
      is enough time to accommodate first DTS, which may be less than first PTS
  
      Params:
        minPts = minimal PTS that will be passed to handle_frame
  */
  void setMinPts(gid.gst1.types.ClockTime minPts) nothrow
  {
    gst_video_encoder_set_min_pts(cast(GstVideoEncoder*)this._cPtr, minPts);
  }

  /**
      Creates a new #GstVideoCodecState with the specified caps as the output state
      for the encoder.
      Any previously set output state on encoder will be replaced by the newly
      created one.
      
      The specified caps should not contain any resolution, pixel-aspect-ratio,
      framerate, codec-data, .... Those should be specified instead in the returned
      #GstVideoCodecState.
      
      If the subclass wishes to copy over existing fields (like pixel aspect ratio,
      or framerate) from an existing #GstVideoCodecState, it can be provided as a
      reference.
      
      If the subclass wishes to override some fields from the output state (like
      pixel-aspect-ratio or framerate) it can do so on the returned #GstVideoCodecState.
      
      The new output state will only take effect (set on pads and buffers) starting
      from the next call to #[gid.gstvideo1.video_encoder.VideoEncoder.finishFrame].
  
      Params:
        caps = the #GstCaps to use for the output
        reference = An optional reference GstVideoCodecState
      Returns: the newly configured output state.
  */
  gid.gstvideo1.video_codec_state.VideoCodecState setOutputState(gid.gst1.caps.Caps caps, gid.gstvideo1.video_codec_state.VideoCodecState reference = null) nothrow
  {
    GstVideoCodecState* _cretval;
    _cretval = gst_video_encoder_set_output_state(cast(GstVideoEncoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(Yes.Dup) : null, reference ? cast(GstVideoCodecState*)reference._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gstvideo1.video_codec_state.VideoCodecState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Configures encoder to handle Quality-of-Service events from downstream.
  
      Params:
        enabled = the new qos value.
  */
  void setQosEnabled(bool enabled) nothrow
  {
    gst_video_encoder_set_qos_enabled(cast(GstVideoEncoder*)this._cPtr, enabled);
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_encoder.VideoEncoder]
class VideoEncoderGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T, gid.gst1.preset.PresetGidBuilderImpl!T
{

  mixin PresetGidBuilderT!();

  /**
      Set `minForceKeyUnitInterval` property.
      Params:
        propval = Minimum interval between force-keyunit requests in nanoseconds. See
          [gid.gstvideo1.video_encoder.VideoEncoder.setMinForceKeyUnitInterval] for more details.
      Returns: Builder instance for fluent chaining
  */
  T minForceKeyUnitInterval(ulong propval) nothrow
  {
    return setProperty("min-force-key-unit-interval", propval);
  }

  /** */
  T qos(bool propval) nothrow
  {
    return setProperty("qos", propval);
  }
}

/// Fluent builder for [gid.gstvideo1.video_encoder.VideoEncoder]
final class VideoEncoderGidBuilder : VideoEncoderGidBuilderImpl!VideoEncoderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoEncoder build() nothrow
  {
    return new VideoEncoder(cast(void*)createGObject(VideoEncoder._getGType), Yes.Take);
  }
}
