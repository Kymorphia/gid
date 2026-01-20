/// Module for [VideoDecoder] class
module gstvideo.video_decoder;

import gid.gid;
import gobject.object;
import gst.allocation_params;
import gst.allocator;
import gst.buffer;
import gst.buffer_pool;
import gst.caps;
import gst.element;
import gst.tag_list;
import gst.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_codec_frame;
import gstvideo.video_codec_state;

/**
    This base class is for video decoders turning encoded data into raw video
    frames.
    
    The GstVideoDecoder base class and derived subclasses should cooperate as
    follows:
    
    ## Configuration
    
      $(LIST
          * Initially, GstVideoDecoder calls @start when the decoder element
            is activated, which allows the subclass to perform any global setup.
        
          * GstVideoDecoder calls @set_format to inform the subclass of caps
            describing input video data that it is about to receive, including
            possibly configuration data.
            While unlikely, it might be called more than once, if changing input
            parameters require reconfiguration.
        
          * Incoming data buffers are processed as needed, described in Data
            Processing below.
        
          * GstVideoDecoder calls @stop at end of all processing.
      )
        
    ## Data processing
    
      $(LIST
          * The base class gathers input data, and optionally allows subclass
            to parse this into subsequently manageable chunks, typically
            corresponding to and referred to as 'frames'.
        
          * Each input frame is provided in turn to the subclass' @handle_frame
            callback.
          * When the subclass enables the subframe mode with [gstvideo.video_decoder.VideoDecoder.setSubframeMode],
            the base class will provide to the subclass the same input frame with
            different input buffers to the subclass @handle_frame
            callback. During this call, the subclass needs to take
            ownership of the input_buffer as @GstVideoCodecFrame.input_buffer
            will have been changed before the next subframe buffer is received.
            The subclass will call [gstvideo.video_decoder.VideoDecoder.haveLastSubframe]
            when a new input frame can be created by the base class.
            Every subframe will share the same @GstVideoCodecFrame.output_buffer
            to write the decoding result. The subclass is responsible to protect
            its access.
        
          * If codec processing results in decoded data, the subclass should call
            @gst_video_decoder_finish_frame to have decoded data pushed
            downstream. In subframe mode
            the subclass should call @gst_video_decoder_finish_subframe until the
            last subframe where it should call @gst_video_decoder_finish_frame.
            The subclass can detect the last subframe using GST_VIDEO_BUFFER_FLAG_MARKER
            on buffers or using its own logic to collect the subframes.
            In case of decoding failure, the subclass must call
            @gst_video_decoder_drop_frame or @gst_video_decoder_drop_subframe,
            to allow the base class to do timestamp and offset tracking, and possibly
            to requeue the frame for a later attempt in the case of reverse playback.
      )
        
    ## Shutdown phase
    
      $(LIST
          * The GstVideoDecoder class calls @stop to inform the subclass that data
            parsing will be stopped.
      )
        
    ## Additional Notes
    
      $(LIST
          * Seeking/Flushing
        
            * When the pipeline is seeked or otherwise flushed, the subclass is
              informed via a call to its @reset callback, with the hard parameter
              set to true. This indicates the subclass should drop any internal data
              queues and timestamps and prepare for a fresh set of buffers to arrive
              for parsing and decoding.
        
          * End Of Stream
        
            * At end-of-stream, the subclass @parse function may be called some final
              times with the at_eos parameter set to true, indicating that the element
              should not expect any more data to be arriving, and it should parse and
              remaining frames and call [gstvideo.video_decoder.VideoDecoder.haveFrame] if possible.
      )
        
    The subclass is responsible for providing pad template caps for
    source and sink pads. The pads need to be named "sink" and "src". It also
    needs to provide information about the output caps, when they are known.
    This may be when the base class calls the subclass' @set_format function,
    though it might be during decoding, before calling
    @gst_video_decoder_finish_frame. This is done via
    @gst_video_decoder_set_output_state
    
    The subclass is also responsible for providing (presentation) timestamps
    (likely based on corresponding input ones).  If that is not applicable
    or possible, the base class provides limited framerate based interpolation.
    
    Similarly, the base class provides some limited (legacy) seeking support
    if specifically requested by the subclass, as full-fledged support
    should rather be left to upstream demuxer, parser or alike.  This simple
    approach caters for seeking and duration reporting using estimated input
    bitrates. To enable it, a subclass should call
    @gst_video_decoder_set_estimate_rate to enable handling of incoming
    byte-streams.
    
    The base class provides some support for reverse playback, in particular
    in case incoming data is not packetized or upstream does not provide
    fragments on keyframe boundaries.  However, the subclass should then be
    prepared for the parsing and frame processing stage to occur separately
    (in normal forward processing, the latter immediately follows the former),
    The subclass also needs to ensure the parsing stage properly marks
    keyframes, unless it knows the upstream elements will do so properly for
    incoming data.
    
    The bare minimum that a functional subclass needs to implement is:
    
      $(LIST
          * Provide pad templates
          * Inform the base class of output caps via
             @gst_video_decoder_set_output_state
        
          * Parse input data, if it is not considered packetized from upstream
             Data will be provided to @parse which should invoke
             @gst_video_decoder_add_to_frame and @gst_video_decoder_have_frame to
             separate the data belonging to each video frame.
        
          * Accept data in @handle_frame and provide decoded results to
             @gst_video_decoder_finish_frame, or call @gst_video_decoder_drop_frame.
      )
*/
class VideoDecoder : gst.element.Element
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
    return cast(void function())gst_video_decoder_get_type != &gidSymbolNotFound ? gst_video_decoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoDecoder self()
  {
    return this;
  }

  /**
      Get `automaticRequestSyncPointFlags` property.
      Returns: GstVideoDecoderRequestSyncPointFlags to use for the automatically
        requested sync points if `automatic-request-sync-points` is enabled.
  */
  @property gstvideo.types.VideoDecoderRequestSyncPointFlags automaticRequestSyncPointFlags()
  {
    return gobject.object.ObjectWrap.getProperty!(gstvideo.types.VideoDecoderRequestSyncPointFlags)("automatic-request-sync-point-flags");
  }

  /**
      Set `automaticRequestSyncPointFlags` property.
      Params:
        propval = GstVideoDecoderRequestSyncPointFlags to use for the automatically
          requested sync points if `automatic-request-sync-points` is enabled.
  */
  @property void automaticRequestSyncPointFlags(gstvideo.types.VideoDecoderRequestSyncPointFlags propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstvideo.types.VideoDecoderRequestSyncPointFlags)("automatic-request-sync-point-flags", propval);
  }

  /**
      Get `automaticRequestSyncPoints` property.
      Returns: If set to true the decoder will automatically request sync points when
        it seems like a good idea, e.g. if the first frames are not key frames or
        if packet loss was reported by upstream.
  */
  @property bool automaticRequestSyncPoints()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("automatic-request-sync-points");
  }

  /**
      Set `automaticRequestSyncPoints` property.
      Params:
        propval = If set to true the decoder will automatically request sync points when
          it seems like a good idea, e.g. if the first frames are not key frames or
          if packet loss was reported by upstream.
  */
  @property void automaticRequestSyncPoints(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("automatic-request-sync-points", propval);
  }

  /**
      Get `discardCorruptedFrames` property.
      Returns: If set to true the decoder will discard frames that are marked as
        corrupted instead of outputting them.
  */
  @property bool discardCorruptedFrames()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("discard-corrupted-frames");
  }

  /**
      Set `discardCorruptedFrames` property.
      Params:
        propval = If set to true the decoder will discard frames that are marked as
          corrupted instead of outputting them.
  */
  @property void discardCorruptedFrames(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("discard-corrupted-frames", propval);
  }

  /**
      Get `maxErrors` property.
      Returns: Maximum number of tolerated consecutive decode errors. See
        [gstvideo.video_decoder.VideoDecoder.setMaxErrors] for more details.
  */
  @property int maxErrors()
  {
    return getMaxErrors();
  }

  /**
      Set `maxErrors` property.
      Params:
        propval = Maximum number of tolerated consecutive decode errors. See
          [gstvideo.video_decoder.VideoDecoder.setMaxErrors] for more details.
  */
  @property void maxErrors(int propval)
  {
    return setMaxErrors(propval);
  }

  /**
      Get `minForceKeyUnitInterval` property.
      Returns: Minimum interval between force-key-unit events sent upstream by the
        decoder. Setting this to 0 will cause every event to be handled, setting
        this to `GST_CLOCK_TIME_NONE` will cause every event to be ignored.
        
        See [gstvideo.global.videoEventNewUpstreamForceKeyUnit] for more details about
        force-key-unit events.
  */
  @property ulong minForceKeyUnitInterval()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("min-force-key-unit-interval");
  }

  /**
      Set `minForceKeyUnitInterval` property.
      Params:
        propval = Minimum interval between force-key-unit events sent upstream by the
          decoder. Setting this to 0 will cause every event to be handled, setting
          this to `GST_CLOCK_TIME_NONE` will cause every event to be ignored.
          
          See [gstvideo.global.videoEventNewUpstreamForceKeyUnit] for more details about
          force-key-unit events.
  */
  @property void minForceKeyUnitInterval(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("min-force-key-unit-interval", propval);
  }

  /**
      Get `qos` property.
      Returns: If set to true the decoder will handle QoS events received
        from downstream elements.
        This includes dropping output frames which are detected as late
        using the metrics reported by those events.
  */
  @property bool qos()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("qos");
  }

  /**
      Set `qos` property.
      Params:
        propval = If set to true the decoder will handle QoS events received
          from downstream elements.
          This includes dropping output frames which are detected as late
          using the metrics reported by those events.
  */
  @property void qos(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("qos", propval);
  }

  /**
      Removes next n_bytes of input data and adds it to currently parsed frame.
  
      Params:
        nBytes = the number of bytes to add
  */
  void addToFrame(int nBytes)
  {
    gst_video_decoder_add_to_frame(cast(GstVideoDecoder*)this._cPtr, nBytes);
  }

  /**
      Helper function that allocates a buffer to hold a video frame for decoder's
      current #GstVideoCodecState.
      
      You should use [gstvideo.video_decoder.VideoDecoder.allocateOutputFrame] instead of this
      function, if possible at all.
      Returns: allocated buffer, or NULL if no buffer could be
            allocated (e.g. when downstream is flushing or shutting down)
  */
  gst.buffer.Buffer allocateOutputBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_video_decoder_allocate_output_buffer(cast(GstVideoDecoder*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Helper function that allocates a buffer to hold a video frame for decoder's
      current #GstVideoCodecState.  Subclass should already have configured video
      state and set src pad caps.
      
      The buffer allocated here is owned by the frame and you should only
      keep references to the frame, not the buffer.
  
      Params:
        frame = a #GstVideoCodecFrame
      Returns: [gst.types.FlowReturn.Ok] if an output buffer could be allocated
  */
  gst.types.FlowReturn allocateOutputFrame(gstvideo.video_codec_frame.VideoCodecFrame frame)
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_allocate_output_frame(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Same as #gst_video_decoder_allocate_output_frame except it allows passing
      #GstBufferPoolAcquireParams to the sub call gst_buffer_pool_acquire_buffer.
  
      Params:
        frame = a #GstVideoCodecFrame
        params = a #GstBufferPoolAcquireParams
      Returns: [gst.types.FlowReturn.Ok] if an output buffer could be allocated
  */
  gst.types.FlowReturn allocateOutputFrameWithParams(gstvideo.video_codec_frame.VideoCodecFrame frame, gst.types.BufferPoolAcquireParams params)
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_allocate_output_frame_with_params(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null, &params);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Similar to [gstvideo.video_decoder.VideoDecoder.finishFrame], but drops frame in any
      case and posts a QoS message with the frame's details on the bus.
      In any case, the frame is considered finished and released.
  
      Params:
        frame = the #GstVideoCodecFrame to drop
      Returns: a #GstFlowReturn, usually GST_FLOW_OK.
  */
  gst.types.FlowReturn dropFrame(gstvideo.video_codec_frame.VideoCodecFrame frame)
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_drop_frame(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Drops input data.
      The frame is not considered finished until the whole frame
      is finished or dropped by the subclass.
  
      Params:
        frame = the #GstVideoCodecFrame
      Returns: a #GstFlowReturn, usually GST_FLOW_OK.
  */
  gst.types.FlowReturn dropSubframe(gstvideo.video_codec_frame.VideoCodecFrame frame)
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_drop_subframe(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      frame should have a valid decoded data buffer, whose metadata fields
      are then appropriately set according to frame data and pushed downstream.
      If no output data is provided, frame is considered skipped.
      In any case, the frame is considered finished and released.
      
      After calling this function the output buffer of the frame is to be
      considered read-only. This function will also change the metadata
      of the buffer.
  
      Params:
        frame = a decoded #GstVideoCodecFrame
      Returns: a #GstFlowReturn resulting from sending data downstream
  */
  gst.types.FlowReturn finishFrame(gstvideo.video_codec_frame.VideoCodecFrame frame)
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_finish_frame(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Indicate that a subframe has been finished to be decoded
      by the subclass. This method should be called for all subframes
      except the last subframe where gst_video_decoder_finish_frame
      should be called instead.
  
      Params:
        frame = the #GstVideoCodecFrame
      Returns: a #GstFlowReturn, usually GST_FLOW_OK.
  */
  gst.types.FlowReturn finishSubframe(gstvideo.video_codec_frame.VideoCodecFrame frame)
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_finish_subframe(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Lets #GstVideoDecoder sub-classes to know the memory allocator
      used by the base class and its params.
      
      Unref the allocator after use it.
  
      Params:
        allocator = the #GstAllocator
          used
        params = the
          #GstAllocationParams of allocator
  */
  void getAllocator(out gst.allocator.Allocator allocator, out gst.allocation_params.AllocationParams params)
  {
    GstAllocator* _allocator;
    gst_video_decoder_get_allocator(cast(GstVideoDecoder*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = new gst.allocator.Allocator(cast(void*)_allocator, Yes.Take);
  }

  /** */
  gst.buffer_pool.BufferPool getBufferPool()
  {
    GstBufferPool* _cretval;
    _cretval = gst_video_decoder_get_buffer_pool(cast(GstVideoDecoder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.buffer_pool.BufferPool)(cast(GstBufferPool*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  int getEstimateRate()
  {
    int _retval;
    _retval = gst_video_decoder_get_estimate_rate(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Get a pending unfinished #GstVideoCodecFrame
  
      Params:
        frameNumber = system_frame_number of a frame
      Returns: pending unfinished #GstVideoCodecFrame identified by frame_number.
  */
  gstvideo.video_codec_frame.VideoCodecFrame getFrame(int frameNumber)
  {
    GstVideoCodecFrame* _cretval;
    _cretval = gst_video_decoder_get_frame(cast(GstVideoDecoder*)this._cPtr, frameNumber);
    auto _retval = _cretval ? new gstvideo.video_codec_frame.VideoCodecFrame(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get all pending unfinished #GstVideoCodecFrame
      Returns: pending unfinished #GstVideoCodecFrame.
  */
  gstvideo.video_codec_frame.VideoCodecFrame[] getFrames()
  {
    GList* _cretval;
    _cretval = gst_video_decoder_get_frames(cast(GstVideoDecoder*)this._cPtr);
    auto _retval = gListToD!(gstvideo.video_codec_frame.VideoCodecFrame, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Queries the number of the last subframe received by
      the decoder baseclass in the frame.
  
      Params:
        frame = the #GstVideoCodecFrame to update
      Returns: the current subframe index received in subframe mode, 1 otherwise.
  */
  uint getInputSubframeIndex(gstvideo.video_codec_frame.VideoCodecFrame frame)
  {
    uint _retval;
    _retval = gst_video_decoder_get_input_subframe_index(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Query the configured decoder latency. Results will be returned via
      min_latency and max_latency.
  
      Params:
        minLatency = address of variable in which to store the
              configured minimum latency, or null
        maxLatency = address of variable in which to store the
              configured mximum latency, or null
  */
  void getLatency(out gst.types.ClockTime minLatency, out gst.types.ClockTime maxLatency)
  {
    gst_video_decoder_get_latency(cast(GstVideoDecoder*)this._cPtr, cast(GstClockTime*)&minLatency, cast(GstClockTime*)&maxLatency);
  }

  /**
      Determines maximum possible decoding time for frame that will
      allow it to decode and arrive in time (as determined by QoS events).
      In particular, a negative result means decoding in time is no longer possible
      and should therefore occur as soon/skippy as possible.
  
      Params:
        frame = a #GstVideoCodecFrame
      Returns: max decoding time.
  */
  gst.types.ClockTimeDiff getMaxDecodeTime(gstvideo.video_codec_frame.VideoCodecFrame frame)
  {
    gst.types.ClockTimeDiff _retval;
    _retval = gst_video_decoder_get_max_decode_time(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  int getMaxErrors()
  {
    int _retval;
    _retval = gst_video_decoder_get_max_errors(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries decoder required format handling.
      Returns: true if required format handling is enabled.
  */
  bool getNeedsFormat()
  {
    bool _retval;
    _retval = cast(bool)gst_video_decoder_get_needs_format(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries if the decoder requires a sync point before it starts outputting
      data in the beginning.
      Returns: true if a sync point is required in the beginning.
  */
  bool getNeedsSyncPoint()
  {
    bool _retval;
    _retval = cast(bool)gst_video_decoder_get_needs_sync_point(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Get the oldest pending unfinished #GstVideoCodecFrame
      Returns: oldest pending unfinished #GstVideoCodecFrame.
  */
  gstvideo.video_codec_frame.VideoCodecFrame getOldestFrame()
  {
    GstVideoCodecFrame* _cretval;
    _cretval = gst_video_decoder_get_oldest_frame(cast(GstVideoDecoder*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_codec_frame.VideoCodecFrame(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the #GstVideoCodecState currently describing the output stream.
      Returns: #GstVideoCodecState describing format of video data.
  */
  gstvideo.video_codec_state.VideoCodecState getOutputState()
  {
    GstVideoCodecState* _cretval;
    _cretval = gst_video_decoder_get_output_state(cast(GstVideoDecoder*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_codec_state.VideoCodecState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries whether input data is considered packetized or not by the
      base class.
      Returns: TRUE if input data is considered packetized.
  */
  bool getPacketized()
  {
    bool _retval;
    _retval = cast(bool)gst_video_decoder_get_packetized(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of bytes previously added to the current frame
      by calling [gstvideo.video_decoder.VideoDecoder.addToFrame].
      Returns: The number of bytes pending for the current frame
  */
  size_t getPendingFrameSize()
  {
    size_t _retval;
    _retval = gst_video_decoder_get_pending_frame_size(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries the number of subframes in the frame processed by
      the decoder baseclass.
  
      Params:
        frame = the #GstVideoCodecFrame to update
      Returns: the current subframe processed received in subframe mode.
  */
  uint getProcessedSubframeIndex(gstvideo.video_codec_frame.VideoCodecFrame frame)
  {
    uint _retval;
    _retval = gst_video_decoder_get_processed_subframe_index(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  double getQosProportion()
  {
    double _retval;
    _retval = gst_video_decoder_get_qos_proportion(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries whether input data is considered as subframes or not by the
      base class. If FALSE, each input buffer will be considered as a full
      frame.
      Returns: TRUE if input data is considered as sub frames.
  */
  bool getSubframeMode()
  {
    bool _retval;
    _retval = cast(bool)gst_video_decoder_get_subframe_mode(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Gathers all data collected for currently parsed frame, gathers corresponding
      metadata and passes it along for further processing, i.e. handle_frame.
      Returns: a #GstFlowReturn
  */
  gst.types.FlowReturn haveFrame()
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_have_frame(cast(GstVideoDecoder*)this._cPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Indicates that the last subframe has been processed by the decoder
      in frame. This will release the current frame in video decoder
      allowing to receive new frames from upstream elements. This method
      must be called in the subclass handle_frame callback.
  
      Params:
        frame = the #GstVideoCodecFrame to update
      Returns: a #GstFlowReturn, usually GST_FLOW_OK.
  */
  gst.types.FlowReturn haveLastSubframe(gstvideo.video_codec_frame.VideoCodecFrame frame)
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_have_last_subframe(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Sets the audio decoder tags and how they should be merged with any
      upstream stream tags. This will override any tags previously-set
      with [gstaudio.audio_decoder.AudioDecoder.mergeTags].
      
      Note that this is provided for convenience, and the subclass is
      not required to use this and can still do tag handling on its own.
      
      MT safe.
  
      Params:
        tags = a #GstTagList to merge, or NULL to unset
              previously-set tags
        mode = the #GstTagMergeMode to use, usually #GST_TAG_MERGE_REPLACE
  */
  void mergeTags(gst.tag_list.TagList tags, gst.types.TagMergeMode mode)
  {
    gst_video_decoder_merge_tags(cast(GstVideoDecoder*)this._cPtr, tags ? cast(const(GstTagList)*)tags._cPtr(No.Dup) : null, mode);
  }

  /**
      Negotiate with downstream elements to currently configured #GstVideoCodecState.
      Unmark GST_PAD_FLAG_NEED_RECONFIGURE in any case. But mark it again if
      negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  */
  bool negotiate()
  {
    bool _retval;
    _retval = cast(bool)gst_video_decoder_negotiate(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Returns caps that express caps (or sink template caps if caps == NULL)
      restricted to resolution/format/... combinations supported by downstream
      elements.
  
      Params:
        caps = initial caps
        filter = filter caps
      Returns: a #GstCaps owned by caller
  */
  gst.caps.Caps proxyGetcaps(gst.caps.Caps caps = null, gst.caps.Caps filter = null)
  {
    GstCaps* _cretval;
    _cretval = gst_video_decoder_proxy_getcaps(cast(GstVideoDecoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Similar to [gstvideo.video_decoder.VideoDecoder.dropFrame], but simply releases frame
      without any processing other than removing it from list of pending frames,
      after which it is considered finished and released.
  
      Params:
        frame = the #GstVideoCodecFrame to release
  */
  void releaseFrame(gstvideo.video_codec_frame.VideoCodecFrame frame)
  {
    gst_video_decoder_release_frame(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
  }

  /**
      Allows the #GstVideoDecoder subclass to request from the base class that
      a new sync should be requested from upstream, and that frame was the frame
      when the subclass noticed that a new sync point is required. A reason for
      the subclass to do this could be missing reference frames, for example.
      
      The base class will then request a new sync point from upstream as long as
      the time that passed since the last one is exceeding
      #GstVideoDecoder:min-force-key-unit-interval.
      
      The subclass can signal via flags how the frames until the next sync point
      should be handled:
      
        $(LIST
            * If [gstvideo.types.VideoDecoderRequestSyncPointFlags.DiscardInput] is selected then
              all following input frames until the next sync point are discarded.
              This can be useful if the lack of a sync point will prevent all further
              decoding and the decoder implementation is not very robust in handling
              missing references frames.
            * If [gstvideo.types.VideoDecoderRequestSyncPointFlags.CorruptOutput] is selected
              then all output frames following frame are marked as corrupted via
              [gst.types.BufferFlags.Corrupted]. Corrupted frames can be automatically
              dropped by the base class, see #GstVideoDecoder:discard-corrupted-frames.
              Subclasses can manually mark frames as corrupted via [gstvideo.types.VideoCodecFrameFlags.Corrupted]
              before calling [gstvideo.video_decoder.VideoDecoder.finishFrame].
        )
  
      Params:
        frame = a #GstVideoCodecFrame
        flags = #GstVideoDecoderRequestSyncPointFlags
  */
  void requestSyncPoint(gstvideo.video_codec_frame.VideoCodecFrame frame, gstvideo.types.VideoDecoderRequestSyncPointFlags flags)
  {
    gst_video_decoder_request_sync_point(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null, flags);
  }

  /**
      Allows baseclass to perform byte to time estimated conversion.
  
      Params:
        enabled = whether to enable byte to time conversion
  */
  void setEstimateRate(bool enabled)
  {
    gst_video_decoder_set_estimate_rate(cast(GstVideoDecoder*)this._cPtr, enabled);
  }

  /**
      Same as #[gstvideo.video_decoder.VideoDecoder.setOutputState] but also allows you to also set
      the interlacing mode.
  
      Params:
        fmt = a #GstVideoFormat
        interlaceMode = A #GstVideoInterlaceMode
        width = The width in pixels
        height = The height in pixels
        reference = An optional reference #GstVideoCodecState
      Returns: the newly configured output state.
  */
  gstvideo.video_codec_state.VideoCodecState setInterlacedOutputState(gstvideo.types.VideoFormat fmt, gstvideo.types.VideoInterlaceMode interlaceMode, uint width, uint height, gstvideo.video_codec_state.VideoCodecState reference = null)
  {
    GstVideoCodecState* _cretval;
    _cretval = gst_video_decoder_set_interlaced_output_state(cast(GstVideoDecoder*)this._cPtr, fmt, interlaceMode, width, height, reference ? cast(GstVideoCodecState*)reference._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gstvideo.video_codec_state.VideoCodecState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Lets #GstVideoDecoder sub-classes tell the baseclass what the decoder latency
      is. If the provided values changed from previously provided ones, this will
      also post a LATENCY message on the bus so the pipeline can reconfigure its
      global latency.
  
      Params:
        minLatency = minimum latency
        maxLatency = maximum latency
  */
  void setLatency(gst.types.ClockTime minLatency, gst.types.ClockTime maxLatency)
  {
    gst_video_decoder_set_latency(cast(GstVideoDecoder*)this._cPtr, minLatency, maxLatency);
  }

  /**
      Sets numbers of tolerated decoder errors, where a tolerated one is then only
      warned about, but more than tolerated will lead to fatal error.  You can set
      -1 for never returning fatal errors. Default is set to
      GST_VIDEO_DECODER_MAX_ERRORS.
      
      The '-1' option was added in 1.4
  
      Params:
        num = max tolerated errors
  */
  void setMaxErrors(int num)
  {
    gst_video_decoder_set_max_errors(cast(GstVideoDecoder*)this._cPtr, num);
  }

  /**
      Configures decoder format needs.  If enabled, subclass needs to be
      negotiated with format caps before it can process any data.  It will then
      never be handed any data before it has been configured.
      Otherwise, it might be handed data without having been configured and
      is then expected being able to do so either by default
      or based on the input data.
  
      Params:
        enabled = new state
  */
  void setNeedsFormat(bool enabled)
  {
    gst_video_decoder_set_needs_format(cast(GstVideoDecoder*)this._cPtr, enabled);
  }

  /**
      Configures whether the decoder requires a sync point before it starts
      outputting data in the beginning. If enabled, the base class will discard
      all non-sync point frames in the beginning and after a flush and does not
      pass it to the subclass.
      
      If the first frame is not a sync point, the base class will request a sync
      point via the force-key-unit event.
  
      Params:
        enabled = new state
  */
  void setNeedsSyncPoint(bool enabled)
  {
    gst_video_decoder_set_needs_sync_point(cast(GstVideoDecoder*)this._cPtr, enabled);
  }

  /**
      Creates a new #GstVideoCodecState with the specified fmt, width and height
      as the output state for the decoder.
      Any previously set output state on decoder will be replaced by the newly
      created one.
      
      If the subclass wishes to copy over existing fields (like pixel aspec ratio,
      or framerate) from an existing #GstVideoCodecState, it can be provided as a
      reference.
      
      If the subclass wishes to override some fields from the output state (like
      pixel-aspect-ratio or framerate) it can do so on the returned #GstVideoCodecState.
      
      The new output state will only take effect (set on pads and buffers) starting
      from the next call to #[gstvideo.video_decoder.VideoDecoder.finishFrame].
  
      Params:
        fmt = a #GstVideoFormat
        width = The width in pixels
        height = The height in pixels
        reference = An optional reference #GstVideoCodecState
      Returns: the newly configured output state.
  */
  gstvideo.video_codec_state.VideoCodecState setOutputState(gstvideo.types.VideoFormat fmt, uint width, uint height, gstvideo.video_codec_state.VideoCodecState reference = null)
  {
    GstVideoCodecState* _cretval;
    _cretval = gst_video_decoder_set_output_state(cast(GstVideoDecoder*)this._cPtr, fmt, width, height, reference ? cast(GstVideoCodecState*)reference._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gstvideo.video_codec_state.VideoCodecState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allows baseclass to consider input data as packetized or not. If the
      input is packetized, then the parse method will not be called.
  
      Params:
        packetized = whether the input data should be considered as packetized.
  */
  void setPacketized(bool packetized)
  {
    gst_video_decoder_set_packetized(cast(GstVideoDecoder*)this._cPtr, packetized);
  }

  /**
      If this is set to TRUE, it informs the base class that the subclass
      can receive the data at a granularity lower than one frame.
      
      Note that in this mode, the subclass has two options. It can either
      require the presence of a GST_VIDEO_BUFFER_FLAG_MARKER to mark the
      end of a frame. Or it can operate in such a way that it will decode
      a single frame at a time. In this second case, every buffer that
      arrives to the element is considered part of the same frame until
      [gstvideo.video_decoder.VideoDecoder.finishFrame] is called.
      
      In either case, the same #GstVideoCodecFrame will be passed to the
      GstVideoDecoderClass:handle_frame vmethod repeatedly with a
      different GstVideoCodecFrame:input_buffer every time until the end of the
      frame has been signaled using either method.
      This method must be called during the decoder subclass set_format call.
  
      Params:
        subframeMode = whether the input data should be considered as subframes.
  */
  void setSubframeMode(bool subframeMode)
  {
    gst_video_decoder_set_subframe_mode(cast(GstVideoDecoder*)this._cPtr, subframeMode);
  }

  /**
      Lets #GstVideoDecoder sub-classes decide if they want the sink pad
      to use the default pad query handler to reply to accept-caps queries.
      
      By setting this to true it is possible to further customize the default
      handler with `GST_PAD_SET_ACCEPT_INTERSECT` and
      `GST_PAD_SET_ACCEPT_TEMPLATE`
  
      Params:
        use = if the default pad accept-caps query handling should be used
  */
  void setUseDefaultPadAcceptcaps(bool use)
  {
    gst_video_decoder_set_use_default_pad_acceptcaps(cast(GstVideoDecoder*)this._cPtr, use);
  }
}
