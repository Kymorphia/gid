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
import gid.gst1.event;
import gid.gst1.meta;
import gid.gst1.preset;
import gid.gst1.preset_mixin;
import gid.gst1.query;
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
@gidGir("VideoEncoder", "VideoEncoderClass")
class VideoEncoder : gid.gst1.element.Element, gid.gst1.preset.Preset
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.close)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.close(cast(GstVideoEncoder*)this._cPtr);
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.decideAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.decideAllocation(cast(GstVideoEncoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Called to request subclass to dispatch any pending remaining
                       data (e.g. at EOS).
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncFinish()
  {
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.finish)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.finish(cast(GstVideoEncoder*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional.
                           Flush all remaining data from the encoder without
                           pushing it downstream. Since: 1.2
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlush` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFlush()
  {
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.flush)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.flush(cast(GstVideoEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Optional.
                       Allows for a custom sink getcaps implementation (e.g.
                       for multichannel input specification).  If not implemented,
                       default returns gst_video_encoder_proxy_getcaps
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.getcaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.getcaps(cast(GstVideoEncoder*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Provides input frame to subclass.
  
      Params:
        frame =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandleFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncHandleFrame(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame)
  {
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.handleFrame)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.handleFrame(cast(GstVideoEncoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.negotiate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.negotiate(cast(GstVideoEncoder*)this._cPtr);
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.open)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.open(cast(GstVideoEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Optional.
                       Allows subclass to push frame downstream in whatever
                       shape or form it deems appropriate.  If not provided,
                       provided encoded frame data is simply pushed downstream.
  
      Params:
        frame =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrePush` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncPrePush(gid.gstvideo1.video_codec_frame.VideoCodecFrame frame)
  {
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.prePush)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.prePush(cast(GstVideoEncoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.proposeAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.proposeAllocation(cast(GstVideoEncoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Allows subclass (encoder) to perform post-seek semantics reset.
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.reset)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.reset(cast(GstVideoEncoder*)this._cPtr, hard);
    return _retval;
  }

  /**
      Optional.
                       Notifies subclass of incoming data format.
                       GstVideoCodecState fields have already been
                       set according to provided caps.
  
      Params:
        state =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetFormat` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetFormat(gid.gstvideo1.video_codec_state.VideoCodecState state)
  {
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.setFormat)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setFormat(cast(GstVideoEncoder*)this._cPtr, state ? cast(GstVideoCodecState*)state._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.sinkEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkEvent(cast(GstVideoEncoder*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.sinkQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkQuery(cast(GstVideoEncoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.srcEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcEvent(cast(GstVideoEncoder*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.srcQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcQuery(cast(GstVideoEncoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstVideoEncoder*)this._cPtr);
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstVideoEncoder*)this._cPtr);
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
    auto _klass = cast(GstVideoEncoderClass*)_vfuncClass;
    if (!_klass.transformMeta)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.transformMeta(cast(GstVideoEncoder*)this._cPtr, frame ? cast(GstVideoCodecFrame*)frame._cPtr(No.Dup) : null, meta ? cast(GstMeta*)meta._cPtr : null);
    return _retval;
  }

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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from VideoEncoder
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstvideo1.video_encoder.VideoEncoder), T.stringof ~ " is not derived from gid.gstvideo1.video_encoder.VideoEncoder");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDecideAllocation", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "decide_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFinish", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlush", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "flush");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetcaps", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "getcaps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandleFrame", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "handle_frame");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNegotiate", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "negotiate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpen", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "open");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrePush", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "pre_push");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProposeAllocation", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "propose_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReset", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "reset");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetFormat", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "set_format");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkEvent", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "sink_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkQuery", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "sink_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcEvent", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "src_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcQuery", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "src_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformMeta", true)[0]) == gid.gstvideo1.video_encoder.VideoEncoder))
      _installVfunc(klass, "transform_meta");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstVideoEncoderClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) gboolean _vfuncCloseTramp(GstVideoEncoder* encoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(encoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncClose");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "decide_allocation":
      {
        static extern(C) gboolean _vfuncDecideAllocationTramp(GstVideoEncoder* encoder, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.decideAllocation)
              return (cast(typeof(&_vfuncDecideAllocationTramp))_klass.decideAllocation)(encoder, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncDecideAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.decideAllocation = cast(typeof(_klass.decideAllocation))&_vfuncDecideAllocationTramp;
        break;
      }
      case "finish":
      {
        static extern(C) GstFlowReturn _vfuncFinishTramp(GstVideoEncoder* encoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.finish)
              return (cast(typeof(&_vfuncFinishTramp))_klass.finish)(encoder);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncFinish();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncFinish");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.finish = cast(typeof(_klass.finish))&_vfuncFinishTramp;
        break;
      }
      case "flush":
      {
        static extern(C) gboolean _vfuncFlushTramp(GstVideoEncoder* encoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.flush)
              return (cast(typeof(&_vfuncFlushTramp))_klass.flush)(encoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncFlush();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncFlush");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.flush = cast(typeof(_klass.flush))&_vfuncFlushTramp;
        break;
      }
      case "getcaps":
      {
        static extern(C) GstCaps* _vfuncGetcapsTramp(GstVideoEncoder* enc, GstCaps* filter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.getcaps)
              return (cast(typeof(&_vfuncGetcapsTramp))_klass.getcaps)(enc, filter);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncGetcaps");
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
        static extern(C) GstFlowReturn _vfuncHandleFrameTramp(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.handleFrame)
              return (cast(typeof(&_vfuncHandleFrameTramp))_klass.handleFrame)(encoder, frame);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _frame = frame ? new gid.gstvideo1.video_codec_frame.VideoCodecFrame(cast(void*)frame, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncHandleFrame(_frame);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncHandleFrame");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_frame)
            _frame._cUnborrow;

          return _retval;
        }

        _klass.handleFrame = cast(typeof(_klass.handleFrame))&_vfuncHandleFrameTramp;
        break;
      }
      case "negotiate":
      {
        static extern(C) gboolean _vfuncNegotiateTramp(GstVideoEncoder* encoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.negotiate)
              return (cast(typeof(&_vfuncNegotiateTramp))_klass.negotiate)(encoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncNegotiate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncNegotiate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.negotiate = cast(typeof(_klass.negotiate))&_vfuncNegotiateTramp;
        break;
      }
      case "open":
      {
        static extern(C) gboolean _vfuncOpenTramp(GstVideoEncoder* encoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.open)
              return (cast(typeof(&_vfuncOpenTramp))_klass.open)(encoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncOpen();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncOpen");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.open = cast(typeof(_klass.open))&_vfuncOpenTramp;
        break;
      }
      case "pre_push":
      {
        static extern(C) GstFlowReturn _vfuncPrePushTramp(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.prePush)
              return (cast(typeof(&_vfuncPrePushTramp))_klass.prePush)(encoder, frame);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _frame = frame ? new gid.gstvideo1.video_codec_frame.VideoCodecFrame(cast(void*)frame, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncPrePush(_frame);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncPrePush");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_frame)
            _frame._cUnborrow;

          return _retval;
        }

        _klass.prePush = cast(typeof(_klass.prePush))&_vfuncPrePushTramp;
        break;
      }
      case "propose_allocation":
      {
        static extern(C) gboolean _vfuncProposeAllocationTramp(GstVideoEncoder* encoder, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.proposeAllocation)
              return (cast(typeof(&_vfuncProposeAllocationTramp))_klass.proposeAllocation)(encoder, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncProposeAllocation");
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
        static extern(C) gboolean _vfuncResetTramp(GstVideoEncoder* encoder, gboolean hard) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(encoder, hard);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncReset(cast(bool)hard);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncReset");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.reset = cast(typeof(_klass.reset))&_vfuncResetTramp;
        break;
      }
      case "set_format":
      {
        static extern(C) gboolean _vfuncSetFormatTramp(GstVideoEncoder* encoder, GstVideoCodecState* state) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.setFormat)
              return (cast(typeof(&_vfuncSetFormatTramp))_klass.setFormat)(encoder, state);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncSetFormat");
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
        static extern(C) gboolean _vfuncSinkEventTramp(GstVideoEncoder* encoder, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.sinkEvent)
              return (cast(typeof(&_vfuncSinkEventTramp))_klass.sinkEvent)(encoder, event);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncSinkEvent");
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
        static extern(C) gboolean _vfuncSinkQueryTramp(GstVideoEncoder* encoder, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.sinkQuery)
              return (cast(typeof(&_vfuncSinkQueryTramp))_klass.sinkQuery)(encoder, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncSinkQuery");
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
        static extern(C) gboolean _vfuncSrcEventTramp(GstVideoEncoder* encoder, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.srcEvent)
              return (cast(typeof(&_vfuncSrcEventTramp))_klass.srcEvent)(encoder, event);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncSrcEvent");
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
        static extern(C) gboolean _vfuncSrcQueryTramp(GstVideoEncoder* encoder, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.srcQuery)
              return (cast(typeof(&_vfuncSrcQueryTramp))_klass.srcQuery)(encoder, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncSrcQuery");
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
        static extern(C) gboolean _vfuncStartTramp(GstVideoEncoder* encoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(encoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstVideoEncoder* encoder) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(encoder);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      case "transform_meta":
      {
        static extern(C) gboolean _vfuncTransformMetaTramp(GstVideoEncoder* encoder, GstVideoCodecFrame* frame, GstMeta* meta) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstvideo1.video_encoder.VideoEncoder)(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstVideoEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
            if (_klass.transformMeta)
              return (cast(typeof(&_vfuncTransformMetaTramp))_klass.transformMeta)(encoder, frame, meta);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_encoder.VideoEncoder.vfuncTransformMeta");
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
