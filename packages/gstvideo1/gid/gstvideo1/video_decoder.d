/// Module for [VideoDecoder] class
module gid.gstvideo1.video_decoder;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.allocation_params;
import gid.gst1.allocator;
import gid.gst1.buffer;
import gid.gst1.buffer_pool;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.event;
import gid.gst1.meta;
import gid.gst1.query;
import gid.gst1.tag_list;
import gid.gst1.types;
import gid.gstbase1.adapter;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_codec_frame;
import gid.gstvideo1.video_codec_state;

/**
    This base class is for video decoders turning encoded data into raw video
    frames.
    
    The GstVideoDecoder base class and derived subclasses should cooperate as
    follows:
    
    ## Configuration
    
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
    
    ## Data processing
    
      * The base class gathers input data, and optionally allows subclass
        to parse this into subsequently manageable chunks, typically
        corresponding to and referred to as 'frames'.
    
      * Each input frame is provided in turn to the subclass' @handle_frame
        callback.
      * When the subclass enables the subframe mode with [gid.gstvideo1.video_decoder.VideoDecoder.setSubframeMode],
        the base class will provide to the subclass the same input frame with
        different input buffers to the subclass @handle_frame
        callback. During this call, the subclass needs to take
        ownership of the input_buffer as @GstVideoCodecFrame.input_buffer
        will have been changed before the next subframe buffer is received.
        The subclass will call [gid.gstvideo1.video_decoder.VideoDecoder.haveLastSubframe]
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
    
    ## Shutdown phase
    
      * The GstVideoDecoder class calls @stop to inform the subclass that data
        parsing will be stopped.
    
    ## Additional Notes
    
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
          remaining frames and call [gid.gstvideo1.video_decoder.VideoDecoder.haveFrame] if possible.
    
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
    
      * Provide pad templates
      * Inform the base class of output caps via
         @gst_video_decoder_set_output_state
    
      * Parse input data, if it is not considered packetized from upstream
         Data will be provided to @parse which should invoke
         @gst_video_decoder_add_to_frame and @gst_video_decoder_have_frame to
         separate the data belonging to each video frame.
    
      * Accept data in @handle_frame and provide decoded results to
         @gst_video_decoder_finish_frame, or call @gst_video_decoder_drop_frame.
*/
@gidGir("VideoDecoder", "VideoDecoderClass")
class VideoDecoder : gid.gst1.element.Element
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_video_decoder_get_type != &gidSymbolNotFound ? gst_video_decoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoDecoder";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoDecoder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_decoder.VideoDecoder]
      Returns: New builder object
  */
  static VideoDecoderGidBuilder builder() nothrow
  {
    return new VideoDecoderGidBuilder;
  }

  /**
      Get `automaticRequestSyncPointFlags` property.
      Returns: GstVideoDecoderRequestSyncPointFlags to use for the automatically
        requested sync points if `automatic-request-sync-points` is enabled.
  */
  @property gid.gstvideo1.types.VideoDecoderRequestSyncPointFlags automaticRequestSyncPointFlags() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstvideo1.types.VideoDecoderRequestSyncPointFlags)("automatic-request-sync-point-flags");
  }

  /**
      Set `automaticRequestSyncPointFlags` property.
      Params:
        propval = GstVideoDecoderRequestSyncPointFlags to use for the automatically
          requested sync points if `automatic-request-sync-points` is enabled.
  */
  @property void automaticRequestSyncPointFlags(gid.gstvideo1.types.VideoDecoderRequestSyncPointFlags propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstvideo1.types.VideoDecoderRequestSyncPointFlags)("automatic-request-sync-point-flags", propval);
  }

  /**
      Get `automaticRequestSyncPoints` property.
      Returns: If set to true the decoder will automatically request sync points when
        it seems like a good idea, e.g. if the first frames are not key frames or
        if packet loss was reported by upstream.
  */
  @property bool automaticRequestSyncPoints() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("automatic-request-sync-points");
  }

  /**
      Set `automaticRequestSyncPoints` property.
      Params:
        propval = If set to true the decoder will automatically request sync points when
          it seems like a good idea, e.g. if the first frames are not key frames or
          if packet loss was reported by upstream.
  */
  @property void automaticRequestSyncPoints(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("automatic-request-sync-points", propval);
  }

  /**
      Get `discardCorruptedFrames` property.
      Returns: If set to true the decoder will discard frames that are marked as
        corrupted instead of outputting them.
  */
  @property bool discardCorruptedFrames() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("discard-corrupted-frames");
  }

  /**
      Set `discardCorruptedFrames` property.
      Params:
        propval = If set to true the decoder will discard frames that are marked as
          corrupted instead of outputting them.
  */
  @property void discardCorruptedFrames(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("discard-corrupted-frames", propval);
  }

  /**
      Get `maxErrors` property.
      Returns: Maximum number of tolerated consecutive decode errors. See
        [gid.gstvideo1.video_decoder.VideoDecoder.setMaxErrors] for more details.
  */
  @property int maxErrors() nothrow
  {
    return getMaxErrors();
  }

  /**
      Set `maxErrors` property.
      Params:
        propval = Maximum number of tolerated consecutive decode errors. See
          [gid.gstvideo1.video_decoder.VideoDecoder.setMaxErrors] for more details.
  */
  @property void maxErrors(int propval) nothrow
  {
    setMaxErrors(propval);
  }

  /**
      Get `minForceKeyUnitInterval` property.
      Returns: Minimum interval between force-key-unit events sent upstream by the
        decoder. Setting this to 0 will cause every event to be handled, setting
        this to [gid.gst1.types.CLOCK_TIME_NONE] will cause every event to be ignored.
        
        See [gid.gstvideo1.global.videoEventNewUpstreamForceKeyUnit] for more details about
        force-key-unit events.
  */
  @property ulong minForceKeyUnitInterval() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("min-force-key-unit-interval");
  }

  /**
      Set `minForceKeyUnitInterval` property.
      Params:
        propval = Minimum interval between force-key-unit events sent upstream by the
          decoder. Setting this to 0 will cause every event to be handled, setting
          this to [gid.gst1.types.CLOCK_TIME_NONE] will cause every event to be ignored.
          
          See [gid.gstvideo1.global.videoEventNewUpstreamForceKeyUnit] for more details about
          force-key-unit events.
  */
  @property void minForceKeyUnitInterval(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("min-force-key-unit-interval", propval);
  }

  /**
      Get `qos` property.
      Returns: If set to true the decoder will handle QoS events received
        from downstream elements.
        This includes dropping output frames which are detected as late
        using the metrics reported by those events.
  */
  @property bool qos() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("qos");
  }

  /**
      Set `qos` property.
      Params:
        propval = If set to true the decoder will handle QoS events received
          from downstream elements.
          This includes dropping output frames which are detected as late
          using the metrics reported by those events.
  */
  @property void qos(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("qos", propval);
  }

  /**
      Optional.
                       Called when the element changes to GST_STATE_NULL.
                       Allows closing external resources.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClose` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncClose()
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.close)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.close(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Optional.
                          Setup the allocation parameters for allocating output
                          buffers. The passed in query contains the result of the
                          downstream allocation query.
                          Subclasses should chain up to the parent implementation to
                          invoke the default handler.
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDecideAllocation` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDecideAllocation(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.decideAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.decideAllocation(cast(GstVideoDecoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Called to request subclass to decode any data it can at this
                       point, but that more data may arrive after. (e.g. at segment end).
                       Sub-classes should be prepared to handle new data afterward,
                       or seamless segment processing will break. Since: 1.6
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDrain` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncDrain()
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.drain)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.drain(cast(GstVideoDecoder*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional.
                       Called to request subclass to dispatch any pending remaining
                       data at EOS. Sub-classes can refuse to decode new data after.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncFinish()
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.finish)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.finish(cast(GstVideoDecoder*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional.
                           Flush all remaining data from the decoder without
                           pushing it downstream. Since: 1.2
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlush` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFlush()
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.flush)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.flush(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Optional.
                       Allows for a custom sink getcaps implementation.
                       If not implemented, default returns
                       gst_video_decoder_proxy_getcaps
                       applied to sink template caps.
  
      Params:
        filter =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetcaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncGetcaps(gid.gst1.caps.Caps filter)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.getcaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.getcaps(cast(GstVideoDecoder*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  protected gid.gst1.types.FlowReturn vfuncHandleFrame(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.handleFrame)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.handleFrame(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /** */
  protected bool vfuncHandleMissingData(gid.gst1.types.ClockTime timestamp, gid.gst1.types.ClockTime duration)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.handleMissingData)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.handleMissingData(cast(GstVideoDecoder*)this._cPtr, timestamp, duration);
    return _retval;
  }

  /**
      Negotiate with downstream elements to currently configured #GstVideoCodecState.
      Unmark GST_PAD_FLAG_NEED_RECONFIGURE in any case. But mark it again if
      negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNegotiate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncNegotiate()
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.negotiate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.negotiate(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Optional.
                       Called when the element changes to GST_STATE_READY.
                       Allows opening external resources.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncOpen` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncOpen()
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.open)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.open(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Required for non-packetized input.
                       Allows chopping incoming data into manageable units (frames)
                       for subsequent decoding.
  
      Params:
        frame =  (modified in place, changes are seen by the caller)
        adapter = 
        atEos = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncParse` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncParse(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame, gid.gstbase1.adapter.Adapter adapter, bool atEos)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.parse)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.parse(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null, adapter ? cast(GstAdapter*)adapter._cPtr(No.Dup) : null, atEos);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional.
                           Propose buffer allocation parameters for upstream elements.
                           Subclasses should chain up to the parent implementation to
                           invoke the default handler.
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncProposeAllocation` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncProposeAllocation(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.proposeAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.proposeAllocation(cast(GstVideoDecoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Allows subclass (decoder) to perform post-seek semantics reset.
                       Deprecated.
  
      Params:
        hard = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReset` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncReset(bool hard)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.reset)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.reset(cast(GstVideoDecoder*)this._cPtr, hard);
    return _retval;
  }

  /**
      Notifies subclass of incoming data format (caps).
  
      Params:
        state =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetFormat` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetFormat(gid.gstvideo1.video_codec_state.VideoCodecState state)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.setFormat)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setFormat(cast(GstVideoDecoder*)this._cPtr, state ? cast(GstVideoCodecState*)state._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Event handler on the sink pad. This function should return
                       TRUE if the event was handled and should be discarded
                       (i.e. not unref'ed).
                       Subclasses should chain up to the parent implementation to
                       invoke the default handler.
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSinkEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.sinkEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkEvent(cast(GstVideoDecoder*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Query handler on the sink pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.4
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSinkQuery(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.sinkQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkQuery(cast(GstVideoDecoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Event handler on the source pad. This function should return
                       TRUE if the event was handled and should be discarded
                       (i.e. not unref'ed).
                       Subclasses should chain up to the parent implementation to
                       invoke the default handler.
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSrcEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSrcEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.srcEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcEvent(cast(GstVideoDecoder*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Query handler on the source pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.4
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSrcQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSrcQuery(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.srcQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcQuery(cast(GstVideoDecoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Called when the element starts processing.
                       Allows opening external resources.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStart()
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Optional.
                       Called when the element stops processing.
                       Allows closing external resources.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStop()
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Optional. Transform the metadata on the input buffer to the
                       output buffer. By default this method is copies all meta without
                       tags and meta with only the "video" tag. subclasses can
                       implement this method and return true if the metadata is to be
                       copied. Since: 1.6
  
      Params:
        frame =  (modified in place, changes are seen by the caller)
        meta =  (borrowed, only valid during the callback)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTransformMeta` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncTransformMeta(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame, gid.gst1.meta.Meta meta)
  {
    auto _klass = cast(GstVideoDecoderClass*)_vfuncClass;
    if (!_klass.transformMeta)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.transformMeta(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null, meta ? cast(GstMeta*)meta._cPtr : null);
    return _retval;
  }

  /**
      Removes next n_bytes of input data and adds it to currently parsed frame.
  
      Params:
        nBytes = the number of bytes to add
  */
  void addToFrame(int nBytes) nothrow
  {
    gst_video_decoder_add_to_frame(cast(GstVideoDecoder*)this._cPtr, nBytes);
  }

  /**
      Helper function that allocates a buffer to hold a video frame for decoder's
      current #GstVideoCodecState.
      
      You should use [gid.gstvideo1.video_decoder.VideoDecoder.allocateOutputFrame] instead of this
      function, if possible at all.
      Returns: allocated buffer, or NULL if no buffer could be
            allocated (e.g. when downstream is flushing or shutting down)
  */
  gid.gst1.buffer.Buffer allocateOutputBuffer() nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_video_decoder_allocate_output_buffer(cast(GstVideoDecoder*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
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
      Returns: [gid.gst1.types.FlowReturn.Ok] if an output buffer could be allocated
  */
  gid.gst1.types.FlowReturn allocateOutputFrame(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_allocate_output_frame(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Same as #gst_video_decoder_allocate_output_frame except it allows passing
      #GstBufferPoolAcquireParams to the sub call gst_buffer_pool_acquire_buffer.
  
      Params:
        frame = a #GstVideoCodecFrame
        params = a #GstBufferPoolAcquireParams
      Returns: [gid.gst1.types.FlowReturn.Ok] if an output buffer could be allocated
  */
  gid.gst1.types.FlowReturn allocateOutputFrameWithParams(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame, gid.gst1.types.BufferPoolAcquireParams params) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_allocate_output_frame_with_params(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null, cast(GstBufferPoolAcquireParams*)&params);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Similar to [gid.gstvideo1.video_decoder.VideoDecoder.finishFrame], but drops frame in any
      case and posts a QoS message with the frame's details on the bus.
      In any case, the frame is considered finished and released.
  
      Params:
        frame = the #GstVideoCodecFrame to drop
      Returns: a #GstFlowReturn, usually GST_FLOW_OK.
  */
  gid.gst1.types.FlowReturn dropFrame(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_drop_frame(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  gid.gst1.types.FlowReturn dropSubframe(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_drop_subframe(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  gid.gst1.types.FlowReturn finishFrame(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_finish_frame(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  gid.gst1.types.FlowReturn finishSubframe(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_finish_subframe(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  void getAllocator(out gid.gst1.allocator.Allocator allocator, out gid.gst1.allocation_params.AllocationParams params) nothrow
  {
    GstAllocator* _allocator;
    gst_video_decoder_get_allocator(cast(GstVideoDecoder*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(_allocator, Yes.Take);
  }

  /** */
  gid.gst1.buffer_pool.BufferPool getBufferPool() nothrow
  {
    GstBufferPool* _cretval;
    _cretval = gst_video_decoder_get_buffer_pool(cast(GstVideoDecoder*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.buffer_pool.BufferPool)(cast(GstBufferPool*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  int getEstimateRate() nothrow
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
  gid.gstvideo1.video_codec_frame.VideoCodecFrame getFrame(int frameNumber) nothrow
  {
    GstVideoCodecFrame* _cretval;
    _cretval = gst_video_decoder_get_frame(cast(GstVideoDecoder*)this._cPtr, frameNumber);
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
    _cretval = gst_video_decoder_get_frames(cast(GstVideoDecoder*)this._cPtr);
    auto _retval = gListToD!(gid.gstvideo1.video_codec_frame.VideoCodecFrame, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Queries the number of the last subframe received by
      the decoder baseclass in the frame.
  
      Params:
        frame = the #GstVideoCodecFrame to update
      Returns: the current subframe index received in subframe mode, 1 otherwise.
  */
  uint getInputSubframeIndex(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
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
  void getLatency(out gid.gst1.types.ClockTime minLatency, out gid.gst1.types.ClockTime maxLatency) nothrow
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
  gid.gst1.types.ClockTimeDiff getMaxDecodeTime(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    gid.gst1.types.ClockTimeDiff _retval;
    _retval = gst_video_decoder_get_max_decode_time(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  int getMaxErrors() nothrow
  {
    int _retval;
    _retval = gst_video_decoder_get_max_errors(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries decoder required format handling.
      Returns: true if required format handling is enabled.
  */
  bool getNeedsFormat() nothrow
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
  bool getNeedsSyncPoint() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_decoder_get_needs_sync_point(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Get the oldest pending unfinished #GstVideoCodecFrame
      Returns: oldest pending unfinished #GstVideoCodecFrame.
  */
  gid.gstvideo1.video_codec_frame.VideoCodecFrame getOldestFrame() nothrow
  {
    GstVideoCodecFrame* _cretval;
    _cretval = gst_video_decoder_get_oldest_frame(cast(GstVideoDecoder*)this._cPtr);
    auto _retval = _cretval ? new gid.gstvideo1.video_codec_frame.VideoCodecFrame(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the #GstVideoCodecState currently describing the output stream.
      Returns: #GstVideoCodecState describing format of video data.
  */
  gid.gstvideo1.video_codec_state.VideoCodecState getOutputState() nothrow
  {
    GstVideoCodecState* _cretval;
    _cretval = gst_video_decoder_get_output_state(cast(GstVideoDecoder*)this._cPtr);
    auto _retval = _cretval ? new gid.gstvideo1.video_codec_state.VideoCodecState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries whether input data is considered packetized or not by the
      base class.
      Returns: TRUE if input data is considered packetized.
  */
  bool getPacketized() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_decoder_get_packetized(cast(GstVideoDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of bytes previously added to the current frame
      by calling [gid.gstvideo1.video_decoder.VideoDecoder.addToFrame].
      Returns: The number of bytes pending for the current frame
  */
  size_t getPendingFrameSize() nothrow
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
  uint getProcessedSubframeIndex(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    uint _retval;
    _retval = gst_video_decoder_get_processed_subframe_index(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  double getQosProportion() nothrow
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
  bool getSubframeMode() nothrow
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
  gid.gst1.types.FlowReturn haveFrame() nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_have_frame(cast(GstVideoDecoder*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  gid.gst1.types.FlowReturn haveLastSubframe(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_video_decoder_have_last_subframe(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Sets the audio decoder tags and how they should be merged with any
      upstream stream tags. This will override any tags previously-set
      with [gid.gstaudio1.audio_decoder.AudioDecoder.mergeTags].
      
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
    gst_video_decoder_merge_tags(cast(GstVideoDecoder*)this._cPtr, tags ? cast(const(GstTagList)*)tags._cPtr(No.Dup) : null, mode);
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
  gid.gst1.caps.Caps proxyGetcaps(gid.gst1.caps.Caps caps = null, gid.gst1.caps.Caps filter = null) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_video_decoder_proxy_getcaps(cast(GstVideoDecoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Similar to [gid.gstvideo1.video_decoder.VideoDecoder.dropFrame], but simply releases frame
      without any processing other than removing it from list of pending frames,
      after which it is considered finished and released.
  
      Params:
        frame = the #GstVideoCodecFrame to release
  */
  void releaseFrame(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame) nothrow
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
      
        * If [gid.gstvideo1.types.VideoDecoderRequestSyncPointFlags.DiscardInput] is selected then
          all following input frames until the next sync point are discarded.
          This can be useful if the lack of a sync point will prevent all further
          decoding and the decoder implementation is not very robust in handling
          missing references frames.
        * If [gid.gstvideo1.types.VideoDecoderRequestSyncPointFlags.CorruptOutput] is selected
          then all output frames following frame are marked as corrupted via
          [gid.gst1.types.BufferFlags.Corrupted]. Corrupted frames can be automatically
          dropped by the base class, see #GstVideoDecoder:discard-corrupted-frames.
          Subclasses can manually mark frames as corrupted via [gid.gstvideo1.types.VideoCodecFrameFlags.Corrupted]
          before calling [gid.gstvideo1.video_decoder.VideoDecoder.finishFrame].
  
      Params:
        frame = a #GstVideoCodecFrame
        flags = #GstVideoDecoderRequestSyncPointFlags
  */
  void requestSyncPoint(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame, gid.gstvideo1.types.VideoDecoderRequestSyncPointFlags flags) nothrow
  {
    gst_video_decoder_request_sync_point(cast(GstVideoDecoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null, flags);
  }

  /**
      Allows baseclass to perform byte to time estimated conversion.
  
      Params:
        enabled = whether to enable byte to time conversion
  */
  void setEstimateRate(bool enabled) nothrow
  {
    gst_video_decoder_set_estimate_rate(cast(GstVideoDecoder*)this._cPtr, enabled);
  }

  /**
      Same as #[gid.gstvideo1.video_decoder.VideoDecoder.setOutputState] but also allows you to also set
      the interlacing mode.
  
      Params:
        fmt = a #GstVideoFormat
        interlaceMode = A #GstVideoInterlaceMode
        width = The width in pixels
        height = The height in pixels
        reference = An optional reference #GstVideoCodecState
      Returns: the newly configured output state.
  */
  gid.gstvideo1.video_codec_state.VideoCodecState setInterlacedOutputState(gid.gstvideo1.types.VideoFormat fmt, gid.gstvideo1.types.VideoInterlaceMode interlaceMode, uint width, uint height, gid.gstvideo1.video_codec_state.VideoCodecState reference = null) nothrow
  {
    GstVideoCodecState* _cretval;
    _cretval = gst_video_decoder_set_interlaced_output_state(cast(GstVideoDecoder*)this._cPtr, fmt, interlaceMode, width, height, reference ? cast(GstVideoCodecState*)reference._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gstvideo1.video_codec_state.VideoCodecState(cast(void*)_cretval, Yes.Take) : null;
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
  void setLatency(gid.gst1.types.ClockTime minLatency, gid.gst1.types.ClockTime maxLatency) nothrow
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
  void setMaxErrors(int num) nothrow
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
  void setNeedsFormat(bool enabled) nothrow
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
  void setNeedsSyncPoint(bool enabled) nothrow
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
      from the next call to #[gid.gstvideo1.video_decoder.VideoDecoder.finishFrame].
  
      Params:
        fmt = a #GstVideoFormat
        width = The width in pixels
        height = The height in pixels
        reference = An optional reference #GstVideoCodecState
      Returns: the newly configured output state.
  */
  gid.gstvideo1.video_codec_state.VideoCodecState setOutputState(gid.gstvideo1.types.VideoFormat fmt, uint width, uint height, gid.gstvideo1.video_codec_state.VideoCodecState reference = null) nothrow
  {
    GstVideoCodecState* _cretval;
    _cretval = gst_video_decoder_set_output_state(cast(GstVideoDecoder*)this._cPtr, fmt, width, height, reference ? cast(GstVideoCodecState*)reference._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gstvideo1.video_codec_state.VideoCodecState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allows baseclass to consider input data as packetized or not. If the
      input is packetized, then the parse method will not be called.
  
      Params:
        packetized = whether the input data should be considered as packetized.
  */
  void setPacketized(bool packetized) nothrow
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
      [gid.gstvideo1.video_decoder.VideoDecoder.finishFrame] is called.
      
      In either case, the same #GstVideoCodecFrame will be passed to the
      GstVideoDecoderClass:handle_frame vmethod repeatedly with a
      different GstVideoCodecFrame:input_buffer every time until the end of the
      frame has been signaled using either method.
      This method must be called during the decoder subclass set_format call.
  
      Params:
        subframeMode = whether the input data should be considered as subframes.
  */
  void setSubframeMode(bool subframeMode) nothrow
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
  void setUseDefaultPadAcceptcaps(bool use) nothrow
  {
    gst_video_decoder_set_use_default_pad_acceptcaps(cast(GstVideoDecoder*)this._cPtr, use);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from VideoDecoder
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstvideo1.video_decoder.VideoDecoder), T.stringof ~ " is not derived from gid.gstvideo1.video_decoder.VideoDecoder");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDecideAllocation", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "decide_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrain", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "drain");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFinish", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlush", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "flush");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetcaps", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "getcaps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandleFrame", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "handle_frame");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandleMissingData", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "handle_missing_data");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNegotiate", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "negotiate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpen", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "open");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncParse", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "parse");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProposeAllocation", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "propose_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReset", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "reset");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetFormat", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "set_format");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkEvent", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "sink_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkQuery", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "sink_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcEvent", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "src_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcQuery", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "src_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformMeta", true)[0]) == gid.gstvideo1.video_decoder.VideoDecoder))
      _installVfunc(klass, "transform_meta");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstVideoDecoderClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) gboolean _vfuncCloseTramp(GstVideoDecoder* decoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(decoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncClose");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "decide_allocation":
      {
        static extern(C) gboolean _vfuncDecideAllocationTramp(GstVideoDecoder* decoder, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.decideAllocation)
              return (cast(typeof(&_vfuncDecideAllocationTramp))_klass.decideAllocation)(decoder, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDecideAllocation(_query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncDecideAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.decideAllocation = cast(typeof(_klass.decideAllocation))&_vfuncDecideAllocationTramp;
        break;
      }
      case "drain":
      {
        static extern(C) GstFlowReturn _vfuncDrainTramp(GstVideoDecoder* decoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.drain)
              return (cast(typeof(&_vfuncDrainTramp))_klass.drain)(decoder);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncDrain();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncDrain");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.drain = cast(typeof(_klass.drain))&_vfuncDrainTramp;
        break;
      }
      case "finish":
      {
        static extern(C) GstFlowReturn _vfuncFinishTramp(GstVideoDecoder* decoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.finish)
              return (cast(typeof(&_vfuncFinishTramp))_klass.finish)(decoder);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncFinish();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncFinish");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.finish = cast(typeof(_klass.finish))&_vfuncFinishTramp;
        break;
      }
      case "flush":
      {
        static extern(C) gboolean _vfuncFlushTramp(GstVideoDecoder* decoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.flush)
              return (cast(typeof(&_vfuncFlushTramp))_klass.flush)(decoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncFlush();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncFlush");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.flush = cast(typeof(_klass.flush))&_vfuncFlushTramp;
        break;
      }
      case "getcaps":
      {
        static extern(C) GstCaps* _vfuncGetcapsTramp(GstVideoDecoder* decoder, GstCaps* filter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.getcaps)
              return (cast(typeof(&_vfuncGetcapsTramp))_klass.getcaps)(decoder, filter);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;
          auto _filter = filter ? new gid.gst1.caps.Caps(cast(void*)filter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetcaps(_filter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncGetcaps");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;
          if (_filter)
            _filter._cUnborrow;

          return _retval;
        }

        _klass.getcaps = cast(typeof(_klass.getcaps))&_vfuncGetcapsTramp;
        break;
      }
      case "handle_frame":
      {
        static extern(C) GstFlowReturn _vfuncHandleFrameTramp(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.handleFrame)
              return (cast(typeof(&_vfuncHandleFrameTramp))_klass.handleFrame)(decoder, frame);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncHandleFrame(frame ? new gid.gstvideo1.video_codec_frame.VideoCodecFrame(cast(void*)frame, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncHandleFrame");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.handleFrame = cast(typeof(_klass.handleFrame))&_vfuncHandleFrameTramp;
        break;
      }
      case "handle_missing_data":
      {
        static extern(C) gboolean _vfuncHandleMissingDataTramp(GstVideoDecoder* decoder, GstClockTime timestamp, GstClockTime duration) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.handleMissingData)
              return (cast(typeof(&_vfuncHandleMissingDataTramp))_klass.handleMissingData)(decoder, timestamp, duration);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncHandleMissingData(timestamp, duration);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncHandleMissingData");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.handleMissingData = cast(typeof(_klass.handleMissingData))&_vfuncHandleMissingDataTramp;
        break;
      }
      case "negotiate":
      {
        static extern(C) gboolean _vfuncNegotiateTramp(GstVideoDecoder* decoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.negotiate)
              return (cast(typeof(&_vfuncNegotiateTramp))_klass.negotiate)(decoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncNegotiate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncNegotiate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.negotiate = cast(typeof(_klass.negotiate))&_vfuncNegotiateTramp;
        break;
      }
      case "open":
      {
        static extern(C) gboolean _vfuncOpenTramp(GstVideoDecoder* decoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.open)
              return (cast(typeof(&_vfuncOpenTramp))_klass.open)(decoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncOpen();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncOpen");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.open = cast(typeof(_klass.open))&_vfuncOpenTramp;
        break;
      }
      case "parse":
      {
        static extern(C) GstFlowReturn _vfuncParseTramp(GstVideoDecoder* decoder, GstVideoCodecFrame* frame, GstAdapter* adapter, gboolean atEos) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.parse)
              return (cast(typeof(&_vfuncParseTramp))_klass.parse)(decoder, frame, adapter, atEos);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _frame = frame ? new gid.gstvideo1.video_codec_frame.VideoCodecFrame(cast(void*)frame, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncParse(_frame, gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.adapter.Adapter)(cast(void*)adapter, No.Take), cast(bool)atEos);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncParse");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_frame)
            _frame._cUnborrow;

          return _retval;
        }

        _klass.parse = cast(typeof(_klass.parse))&_vfuncParseTramp;
        break;
      }
      case "propose_allocation":
      {
        static extern(C) gboolean _vfuncProposeAllocationTramp(GstVideoDecoder* decoder, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.proposeAllocation)
              return (cast(typeof(&_vfuncProposeAllocationTramp))_klass.proposeAllocation)(decoder, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncProposeAllocation(_query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncProposeAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.proposeAllocation = cast(typeof(_klass.proposeAllocation))&_vfuncProposeAllocationTramp;
        break;
      }
      case "reset":
      {
        static extern(C) gboolean _vfuncResetTramp(GstVideoDecoder* decoder, gboolean hard) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(decoder, hard);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncReset(cast(bool)hard);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncReset");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.reset = cast(typeof(_klass.reset))&_vfuncResetTramp;
        break;
      }
      case "set_format":
      {
        static extern(C) gboolean _vfuncSetFormatTramp(GstVideoDecoder* decoder, GstVideoCodecState* state) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.setFormat)
              return (cast(typeof(&_vfuncSetFormatTramp))_klass.setFormat)(decoder, state);
            return typeof(return).init;
          }

          bool _dretval;
          auto _state = state ? new gid.gstvideo1.video_codec_state.VideoCodecState(cast(void*)state, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetFormat(_state);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncSetFormat");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_state)
            _state._cUnborrow;

          return _retval;
        }

        _klass.setFormat = cast(typeof(_klass.setFormat))&_vfuncSetFormatTramp;
        break;
      }
      case "sink_event":
      {
        static extern(C) gboolean _vfuncSinkEventTramp(GstVideoDecoder* decoder, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.sinkEvent)
              return (cast(typeof(&_vfuncSinkEventTramp))_klass.sinkEvent)(decoder, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSinkEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncSinkEvent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.sinkEvent = cast(typeof(_klass.sinkEvent))&_vfuncSinkEventTramp;
        break;
      }
      case "sink_query":
      {
        static extern(C) gboolean _vfuncSinkQueryTramp(GstVideoDecoder* decoder, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.sinkQuery)
              return (cast(typeof(&_vfuncSinkQueryTramp))_klass.sinkQuery)(decoder, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSinkQuery(_query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncSinkQuery");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.sinkQuery = cast(typeof(_klass.sinkQuery))&_vfuncSinkQueryTramp;
        break;
      }
      case "src_event":
      {
        static extern(C) gboolean _vfuncSrcEventTramp(GstVideoDecoder* decoder, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.srcEvent)
              return (cast(typeof(&_vfuncSrcEventTramp))_klass.srcEvent)(decoder, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSrcEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncSrcEvent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.srcEvent = cast(typeof(_klass.srcEvent))&_vfuncSrcEventTramp;
        break;
      }
      case "src_query":
      {
        static extern(C) gboolean _vfuncSrcQueryTramp(GstVideoDecoder* decoder, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.srcQuery)
              return (cast(typeof(&_vfuncSrcQueryTramp))_klass.srcQuery)(decoder, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSrcQuery(_query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncSrcQuery");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.srcQuery = cast(typeof(_klass.srcQuery))&_vfuncSrcQueryTramp;
        break;
      }
      case "start":
      {
        static extern(C) gboolean _vfuncStartTramp(GstVideoDecoder* decoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(decoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstVideoDecoder* decoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(decoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      case "transform_meta":
      {
        static extern(C) gboolean _vfuncTransformMetaTramp(GstVideoDecoder* decoder, GstVideoCodecFrame* frame, GstMeta* meta) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_decoder.VideoDecoder)(cast(void*)decoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)decoder);
            if (_klass.transformMeta)
              return (cast(typeof(&_vfuncTransformMetaTramp))_klass.transformMeta)(decoder, frame, meta);
            return typeof(return).init;
          }

          bool _dretval;
          auto _frame = frame ? new gid.gstvideo1.video_codec_frame.VideoCodecFrame(cast(void*)frame, Yes.Take)._cBorrow : null;
          auto _meta = meta ? new gid.gst1.meta.Meta(cast(void*)meta, null) : null;

          try
          {
            _dretval = _obj.vfuncTransformMeta(_frame, _meta);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_decoder.VideoDecoder.vfuncTransformMeta");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_frame)
            _frame._cUnborrow;

          return _retval;
        }

        _klass.transformMeta = cast(typeof(_klass.transformMeta))&_vfuncTransformMetaTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_decoder.VideoDecoder]
class VideoDecoderGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{

  /**
      Set `automaticRequestSyncPointFlags` property.
      Params:
        propval = GstVideoDecoderRequestSyncPointFlags to use for the automatically
          requested sync points if `automatic-request-sync-points` is enabled.
      Returns: Builder instance for fluent chaining
  */
  T automaticRequestSyncPointFlags(gid.gstvideo1.types.VideoDecoderRequestSyncPointFlags propval) nothrow
  {
    return setProperty("automatic-request-sync-point-flags", propval);
  }

  /**
      Set `automaticRequestSyncPoints` property.
      Params:
        propval = If set to true the decoder will automatically request sync points when
          it seems like a good idea, e.g. if the first frames are not key frames or
          if packet loss was reported by upstream.
      Returns: Builder instance for fluent chaining
  */
  T automaticRequestSyncPoints(bool propval) nothrow
  {
    return setProperty("automatic-request-sync-points", propval);
  }

  /**
      Set `discardCorruptedFrames` property.
      Params:
        propval = If set to true the decoder will discard frames that are marked as
          corrupted instead of outputting them.
      Returns: Builder instance for fluent chaining
  */
  T discardCorruptedFrames(bool propval) nothrow
  {
    return setProperty("discard-corrupted-frames", propval);
  }

  /**
      Set `maxErrors` property.
      Params:
        propval = Maximum number of tolerated consecutive decode errors. See
          [gid.gstvideo1.video_decoder.VideoDecoder.setMaxErrors] for more details.
      Returns: Builder instance for fluent chaining
  */
  T maxErrors(int propval) nothrow
  {
    return setProperty("max-errors", propval);
  }

  /**
      Set `minForceKeyUnitInterval` property.
      Params:
        propval = Minimum interval between force-key-unit events sent upstream by the
          decoder. Setting this to 0 will cause every event to be handled, setting
          this to [gid.gst1.types.CLOCK_TIME_NONE] will cause every event to be ignored.
          
          See [gid.gstvideo1.global.videoEventNewUpstreamForceKeyUnit] for more details about
          force-key-unit events.
      Returns: Builder instance for fluent chaining
  */
  T minForceKeyUnitInterval(ulong propval) nothrow
  {
    return setProperty("min-force-key-unit-interval", propval);
  }

  /**
      Set `qos` property.
      Params:
        propval = If set to true the decoder will handle QoS events received
          from downstream elements.
          This includes dropping output frames which are detected as late
          using the metrics reported by those events.
      Returns: Builder instance for fluent chaining
  */
  T qos(bool propval) nothrow
  {
    return setProperty("qos", propval);
  }
}

/// Fluent builder for [gid.gstvideo1.video_decoder.VideoDecoder]
final class VideoDecoderGidBuilder : VideoDecoderGidBuilderImpl!VideoDecoderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoDecoder build() nothrow
  {
    return new VideoDecoder(cast(void*)createGObject(VideoDecoder._getGType), Yes.Take);
  }
}
