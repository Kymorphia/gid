/// Module for [AudioEncoder] class
module gid.gstaudio1.audio_encoder;

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
import gid.gstaudio1.audio_info;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    This base class is for audio encoders turning raw audio samples into
    encoded audio data.
    
    GstAudioEncoder and subclass should cooperate as follows.
    
    ## Configuration
    
      * Initially, GstAudioEncoder calls @start when the encoder element
        is activated, which allows subclass to perform any global setup.
    
      * GstAudioEncoder calls @set_format to inform subclass of the format
        of input audio data that it is about to receive.  Subclass should
        setup for encoding and configure various base class parameters
        appropriately, notably those directing desired input data handling.
        While unlikely, it might be called more than once, if changing input
        parameters require reconfiguration.
    
      * GstAudioEncoder calls @stop at end of all processing.
    
    As of configuration stage, and throughout processing, GstAudioEncoder
    maintains various parameters that provide required context,
    e.g. describing the format of input audio data.
    Conversely, subclass can and should configure these context parameters
    to inform base class of its expectation w.r.t. buffer handling.
    
    ## Data processing
    
        * Base class gathers input sample data (as directed by the context's
          frame_samples and frame_max) and provides this to subclass' @handle_frame.
        * If codec processing results in encoded data, subclass should call
          [gid.gstaudio1.audio_encoder.AudioEncoder.finishFrame] to have encoded data pushed
          downstream. Alternatively, it might also call
          [gid.gstaudio1.audio_encoder.AudioEncoder.finishFrame] (with a NULL buffer and some number of
          dropped samples) to indicate dropped (non-encoded) samples.
        * Just prior to actually pushing a buffer downstream,
          it is passed to @pre_push.
        * During the parsing process GstAudioEncoderClass will handle both
          srcpad and sinkpad events. Sink events will be passed to subclass
          if @event callback has been provided.
    
    ## Shutdown phase
    
      * GstAudioEncoder class calls @stop to inform the subclass that data
        parsing will be stopped.
    
    Subclass is responsible for providing pad template caps for
    source and sink pads. The pads need to be named "sink" and "src". It also
    needs to set the fixed caps on srcpad, when the format is ensured.  This
    is typically when base class calls subclass' @set_format function, though
    it might be delayed until calling @gst_audio_encoder_finish_frame.
    
    In summary, above process should have subclass concentrating on
    codec data processing while leaving other matters to base class,
    such as most notably timestamp handling.  While it may exert more control
    in this area (see e.g. @pre_push), it is very much not recommended.
    
    In particular, base class will either favor tracking upstream timestamps
    (at the possible expense of jitter) or aim to arrange for a perfect stream of
    output timestamps, depending on #GstAudioEncoder:perfect-timestamp.
    However, in the latter case, the input may not be so perfect or ideal, which
    is handled as follows.  An input timestamp is compared with the expected
    timestamp as dictated by input sample stream and if the deviation is less
    than #GstAudioEncoder:tolerance, the deviation is discarded.
    Otherwise, it is considered a discontuinity and subsequent output timestamp
    is resynced to the new position after performing configured discontinuity
    processing.  In the non-perfect-timestamp case, an upstream variation
    exceeding tolerance only leads to marking DISCONT on subsequent outgoing
    (while timestamps are adjusted to upstream regardless of variation).
    While DISCONT is also marked in the perfect-timestamp case, this one
    optionally (see #GstAudioEncoder:hard-resync)
    performs some additional steps, such as clipping of (early) input samples
    or draining all currently remaining input data, depending on the direction
    of the discontuinity.
    
    If perfect timestamps are arranged, it is also possible to request baseclass
    (usually set by subclass) to provide additional buffer metadata (in OFFSET
    and OFFSET_END) fields according to granule defined semantics currently
    needed by oggmux.  Specifically, OFFSET is set to granulepos (= sample count
    including buffer) and OFFSET_END to corresponding timestamp (as determined
    by same sample count and sample rate).
    
    Things that subclass need to take care of:
    
      * Provide pad templates
      * Set source pad caps when appropriate
      * Inform base class of buffer processing needs using context's
         frame_samples and frame_bytes.
      * Set user-configurable properties to sane defaults for format and
         implementing codec at hand, e.g. those controlling timestamp behaviour
         and discontinuity processing.
      * Accept data in @handle_frame and provide encoded results to
         [gid.gstaudio1.audio_encoder.AudioEncoder.finishFrame].
*/
@gidGir("AudioEncoder", "AudioEncoderClass")
class AudioEncoder : gid.gst1.element.Element, gid.gst1.preset.Preset
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
    return cast(void function())gst_audio_encoder_get_type != &gidSymbolNotFound ? gst_audio_encoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioEncoder";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioEncoder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_encoder.AudioEncoder]
      Returns: New builder object
  */
  static AudioEncoderGidBuilder builder() nothrow
  {
    return new AudioEncoderGidBuilder;
  }

  /** */
  @property bool hardResync() nothrow
  {
    return getHardResync();
  }

  /** */
  @property void hardResync(bool propval) nothrow
  {
    setHardResync(propval);
  }

  /** */
  @property bool markGranule() nothrow
  {
    return getMarkGranule();
  }

  /** */
  @property bool perfectTimestamp() nothrow
  {
    return getPerfectTimestamp();
  }

  /** */
  @property void perfectTimestamp(bool propval) nothrow
  {
    setPerfectTimestamp(propval);
  }

  /** */
  @property long tolerance() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("tolerance");
  }

  /** */
  @property void tolerance(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("tolerance", propval);
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
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.close)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.close(cast(GstAudioEncoder*)this._cPtr);
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
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.decideAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.decideAllocation(cast(GstAudioEncoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Instructs subclass to clear any codec caches and discard
                       any pending samples and not yet returned encoded data.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlush` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncFlush()
  {
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.flush)
      return;

    _klass.flush(cast(GstAudioEncoder*)this._cPtr);
  }

  /**
      Optional.
                       Allows for a custom sink getcaps implementation (e.g.
                       for multichannel input specification).  If not implemented,
                       default returns gst_audio_encoder_proxy_getcaps
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
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.getcaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.getcaps(cast(GstAudioEncoder*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Provides input samples (or NULL to clear any remaining data)
                       according to directions as configured by the subclass
                       using the API.  Input data ref management is performed
                       by base class, subclass should not care or intervene,
                       and input data is only valid until next call to base class,
                       most notably a call to [gid.gstaudio1.audio_encoder.AudioEncoder.finishFrame].
  
      Params:
        buffer =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandleFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncHandleFrame(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.handleFrame)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.handleFrame(cast(GstAudioEncoder*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Negotiate with downstream elements to currently configured #GstCaps.
      Unmark GST_PAD_FLAG_NEED_RECONFIGURE in any case. But mark it again if
      negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNegotiate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncNegotiate()
  {
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.negotiate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.negotiate(cast(GstAudioEncoder*)this._cPtr);
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
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.open)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.open(cast(GstAudioEncoder*)this._cPtr);
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
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.proposeAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.proposeAllocation(cast(GstAudioEncoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Notifies subclass of incoming data format.
                       GstAudioInfo contains the format according to provided caps.
  
      Params:
        info =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetFormat` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetFormat(gid.gstaudio1.audio_info.AudioInfo info)
  {
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.setFormat)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setFormat(cast(GstAudioEncoder*)this._cPtr, info ? cast(GstAudioInfo*)info._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Event handler on the sink pad. Subclasses should chain up to
                       the parent implementation to invoke the default handler.
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSinkEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.sinkEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkEvent(cast(GstAudioEncoder*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Query handler on the sink pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.6
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSinkQuery(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.sinkQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkQuery(cast(GstAudioEncoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Event handler on the src pad. Subclasses should chain up to
                       the parent implementation to invoke the default handler.
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSrcEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSrcEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.srcEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcEvent(cast(GstAudioEncoder*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Query handler on the source pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.6
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSrcQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSrcQuery(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.srcQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcQuery(cast(GstAudioEncoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstAudioEncoder*)this._cPtr);
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
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Optional. Transform the metadata on the input buffer to the
                       output buffer. By default this method copies all meta without
                       tags and meta with only the "audio" tag. subclasses can
                       implement this method and return true if the metadata is to be
                       copied. Since: 1.6
  
      Params:
        outbuf =  (modified in place, changes are seen by the caller)
        meta =  (borrowed, only valid during the callback)
        inbuf =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTransformMeta` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncTransformMeta(gid.gst1.buffer.Buffer outbuf, gid.gst1.meta.Meta meta, gid.gst1.buffer.Buffer inbuf)
  {
    auto _klass = cast(GstAudioEncoderClass*)_vfuncClass;
    if (!_klass.transformMeta)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.transformMeta(cast(GstAudioEncoder*)this._cPtr, outbuf ? cast(GstBuffer*)outbuf._cPtr(No.Dup) : null, meta ? cast(GstMeta*)meta._cPtr : null, inbuf ? cast(GstBuffer*)inbuf._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Helper function that allocates a buffer to hold an encoded audio frame
      for enc's current output format.
  
      Params:
        size = size of the buffer
      Returns: allocated buffer
  */
  gid.gst1.buffer.Buffer allocateOutputBuffer(size_t size) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_audio_encoder_allocate_output_buffer(cast(GstAudioEncoder*)this._cPtr, size);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Collects encoded data and pushes encoded data downstream.
      Source pad caps must be set when this is called.
      
      If samples < 0, then best estimate is all samples provided to encoder
      (subclass) so far.  buf may be NULL, in which case next number of samples
      are considered discarded, e.g. as a result of discontinuous transmission,
      and a discontinuity is marked.
      
      Note that samples received in #GstAudioEncoderClass.handle_frame()
      may be invalidated by a call to this function.
  
      Params:
        buffer = encoded data
        samples = number of samples (per channel) represented by encoded data
      Returns: a #GstFlowReturn that should be escalated to caller (of caller)
  */
  gid.gst1.types.FlowReturn finishFrame(gid.gst1.buffer.Buffer buffer, int samples) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_audio_encoder_finish_frame(cast(GstAudioEncoder*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null, samples);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Lets #GstAudioEncoder sub-classes to know the memory allocator
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
    gst_audio_encoder_get_allocator(cast(GstAudioEncoder*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(_allocator, Yes.Take);
  }

  /** */
  gid.gstaudio1.audio_info.AudioInfo getAudioInfo() nothrow
  {
    GstAudioInfo* _cretval;
    _cretval = gst_audio_encoder_get_audio_info(cast(GstAudioEncoder*)this._cPtr);
    auto _retval = _cretval ? new gid.gstaudio1.audio_info.AudioInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Queries encoder drain handling.
      Returns: TRUE if drainable handling is enabled.
        
        MT safe.
  */
  bool getDrainable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_encoder_get_drainable(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /** */
  int getFrameMax() nothrow
  {
    int _retval;
    _retval = gst_audio_encoder_get_frame_max(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /** */
  int getFrameSamplesMax() nothrow
  {
    int _retval;
    _retval = gst_audio_encoder_get_frame_samples_max(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /** */
  int getFrameSamplesMin() nothrow
  {
    int _retval;
    _retval = gst_audio_encoder_get_frame_samples_min(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries encoder hard minimum handling.
      Returns: TRUE if hard minimum handling is enabled.
        
        MT safe.
  */
  bool getHardMin() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_encoder_get_hard_min(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /** */
  bool getHardResync() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_encoder_get_hard_resync(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Sets the variables pointed to by min and max to the currently configured
      latency.
  
      Params:
        min = a pointer to storage to hold minimum latency
        max = a pointer to storage to hold maximum latency
  */
  void getLatency(out gid.gst1.types.ClockTime min, out gid.gst1.types.ClockTime max) nothrow
  {
    gst_audio_encoder_get_latency(cast(GstAudioEncoder*)this._cPtr, cast(GstClockTime*)&min, cast(GstClockTime*)&max);
  }

  /** */
  int getLookahead() nothrow
  {
    int _retval;
    _retval = gst_audio_encoder_get_lookahead(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries if the encoder will handle granule marking.
      Returns: TRUE if granule marking is enabled.
        
        MT safe.
  */
  bool getMarkGranule() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_encoder_get_mark_granule(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries encoder perfect timestamp behaviour.
      Returns: TRUE if perfect timestamp setting enabled.
        
        MT safe.
  */
  bool getPerfectTimestamp() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_encoder_get_perfect_timestamp(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries current audio jitter tolerance threshold.
      Returns: encoder audio jitter tolerance threshold.
        
        MT safe.
  */
  gid.gst1.types.ClockTime getTolerance() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_audio_encoder_get_tolerance(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Sets the audio encoder tags and how they should be merged with any
      upstream stream tags. This will override any tags previously-set
      with [gid.gstaudio1.audio_encoder.AudioEncoder.mergeTags].
      
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
    gst_audio_encoder_merge_tags(cast(GstAudioEncoder*)this._cPtr, tags ? cast(const(GstTagList)*)tags._cPtr(No.Dup) : null, mode);
  }

  /**
      Negotiate with downstream elements to currently configured #GstCaps.
      Unmark GST_PAD_FLAG_NEED_RECONFIGURE in any case. But mark it again if
      negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  */
  bool negotiate() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_encoder_negotiate(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Returns caps that express caps (or sink template caps if caps == NULL)
      restricted to channel/rate combinations supported by downstream elements
      (e.g. muxers).
  
      Params:
        caps = initial caps
        filter = filter caps
      Returns: a #GstCaps owned by caller
  */
  gid.gst1.caps.Caps proxyGetcaps(gid.gst1.caps.Caps caps = null, gid.gst1.caps.Caps filter = null) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_audio_encoder_proxy_getcaps(cast(GstAudioEncoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets a caps in allocation query which are different from the set
      pad's caps. Use this function before calling
      [gid.gstaudio1.audio_encoder.AudioEncoder.negotiate]. Setting to null the allocation
      query will use the caps from the pad.
  
      Params:
        allocationCaps = a #GstCaps or null
  */
  void setAllocationCaps(gid.gst1.caps.Caps allocationCaps = null) nothrow
  {
    gst_audio_encoder_set_allocation_caps(cast(GstAudioEncoder*)this._cPtr, allocationCaps ? cast(GstCaps*)allocationCaps._cPtr(No.Dup) : null);
  }

  /**
      Configures encoder drain handling.  If drainable, subclass might
      be handed a NULL buffer to have it return any leftover encoded data.
      Otherwise, it is not considered so capable and will only ever be passed
      real data.
      
      MT safe.
  
      Params:
        enabled = new state
  */
  void setDrainable(bool enabled) nothrow
  {
    gst_audio_encoder_set_drainable(cast(GstAudioEncoder*)this._cPtr, enabled);
  }

  /**
      Sets max number of frames accepted at once (assumed minimally 1).
      Requires frame_samples_min and frame_samples_max to be the equal.
      
      Note: This value will be reset to 0 every time before
      #GstAudioEncoderClass.set_format() is called.
  
      Params:
        num = number of frames
  */
  void setFrameMax(int num) nothrow
  {
    gst_audio_encoder_set_frame_max(cast(GstAudioEncoder*)this._cPtr, num);
  }

  /**
      Sets number of samples (per channel) subclass needs to be handed,
      at most or will be handed all available if 0.
      
      If an exact number of samples is required, [gid.gstaudio1.audio_encoder.AudioEncoder.setFrameSamplesMin]
      must be called with the same number.
      
      Note: This value will be reset to 0 every time before
      #GstAudioEncoderClass.set_format() is called.
  
      Params:
        num = number of samples per frame
  */
  void setFrameSamplesMax(int num) nothrow
  {
    gst_audio_encoder_set_frame_samples_max(cast(GstAudioEncoder*)this._cPtr, num);
  }

  /**
      Sets number of samples (per channel) subclass needs to be handed,
      at least or will be handed all available if 0.
      
      If an exact number of samples is required, [gid.gstaudio1.audio_encoder.AudioEncoder.setFrameSamplesMax]
      must be called with the same number.
      
      Note: This value will be reset to 0 every time before
      #GstAudioEncoderClass.set_format() is called.
  
      Params:
        num = number of samples per frame
  */
  void setFrameSamplesMin(int num) nothrow
  {
    gst_audio_encoder_set_frame_samples_min(cast(GstAudioEncoder*)this._cPtr, num);
  }

  /**
      Configures encoder hard minimum handling.  If enabled, subclass
      will never be handed less samples than it configured, which otherwise
      might occur near end-of-data handling.  Instead, the leftover samples
      will simply be discarded.
      
      MT safe.
  
      Params:
        enabled = new state
  */
  void setHardMin(bool enabled) nothrow
  {
    gst_audio_encoder_set_hard_min(cast(GstAudioEncoder*)this._cPtr, enabled);
  }

  /** */
  void setHardResync(bool enabled) nothrow
  {
    gst_audio_encoder_set_hard_resync(cast(GstAudioEncoder*)this._cPtr, enabled);
  }

  /**
      Set the codec headers to be sent downstream whenever requested.
  
      Params:
        headers = a list of
            #GstBuffer containing the codec header
  */
  void setHeaders(gid.gst1.buffer.Buffer[] headers) nothrow
  {
    auto _headers = gListFromD!(gid.gst1.buffer.Buffer)(headers);
    gst_audio_encoder_set_headers(cast(GstAudioEncoder*)this._cPtr, _headers);
  }

  /**
      Sets encoder latency. If the provided values changed from
      previously provided ones, this will also post a LATENCY message on the bus
      so the pipeline can reconfigure its global latency.
  
      Params:
        min = minimum latency
        max = maximum latency
  */
  void setLatency(gid.gst1.types.ClockTime min, gid.gst1.types.ClockTime max) nothrow
  {
    gst_audio_encoder_set_latency(cast(GstAudioEncoder*)this._cPtr, min, max);
  }

  /**
      Sets encoder lookahead (in units of input rate samples)
      
      Note: This value will be reset to 0 every time before
      #GstAudioEncoderClass.set_format() is called.
  
      Params:
        num = lookahead
  */
  void setLookahead(int num) nothrow
  {
    gst_audio_encoder_set_lookahead(cast(GstAudioEncoder*)this._cPtr, num);
  }

  /**
      Enable or disable encoder granule handling.
      
      MT safe.
  
      Params:
        enabled = new state
  */
  void setMarkGranule(bool enabled) nothrow
  {
    gst_audio_encoder_set_mark_granule(cast(GstAudioEncoder*)this._cPtr, enabled);
  }

  /**
      Configure output caps on the srcpad of enc.
  
      Params:
        caps = #GstCaps
      Returns: true on success.
  */
  bool setOutputFormat(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_encoder_set_output_format(cast(GstAudioEncoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Enable or disable encoder perfect output timestamp preference.
      
      MT safe.
  
      Params:
        enabled = new state
  */
  void setPerfectTimestamp(bool enabled) nothrow
  {
    gst_audio_encoder_set_perfect_timestamp(cast(GstAudioEncoder*)this._cPtr, enabled);
  }

  /**
      Configures encoder audio jitter tolerance threshold.
      
      MT safe.
  
      Params:
        tolerance = new tolerance
  */
  void setTolerance(gid.gst1.types.ClockTime tolerance) nothrow
  {
    gst_audio_encoder_set_tolerance(cast(GstAudioEncoder*)this._cPtr, tolerance);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioEncoder
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstaudio1.audio_encoder.AudioEncoder), T.stringof ~ " is not derived from gid.gstaudio1.audio_encoder.AudioEncoder");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDecideAllocation", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "decide_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlush", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "flush");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetcaps", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "getcaps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandleFrame", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "handle_frame");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNegotiate", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "negotiate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpen", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "open");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProposeAllocation", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "propose_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetFormat", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "set_format");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkEvent", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "sink_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkQuery", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "sink_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcEvent", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "src_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcQuery", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "src_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformMeta", true)[0]) == gid.gstaudio1.audio_encoder.AudioEncoder))
      _installVfunc(klass, "transform_meta");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioEncoderClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) gboolean _vfuncCloseTramp(GstAudioEncoder* enc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(enc);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncClose");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "decide_allocation":
      {
        static extern(C) gboolean _vfuncDecideAllocationTramp(GstAudioEncoder* enc, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.decideAllocation)
              return (cast(typeof(&_vfuncDecideAllocationTramp))_klass.decideAllocation)(enc, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncDecideAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.decideAllocation = cast(typeof(_klass.decideAllocation))&_vfuncDecideAllocationTramp;
        break;
      }
      case "flush":
      {
        static extern(C) void _vfuncFlushTramp(GstAudioEncoder* enc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.flush)
              return (cast(typeof(&_vfuncFlushTramp))_klass.flush)(enc);
            return;
          }

          try
          {
            _obj.vfuncFlush();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncFlush");
          }
        }

        _klass.flush = cast(typeof(_klass.flush))&_vfuncFlushTramp;
        break;
      }
      case "getcaps":
      {
        static extern(C) GstCaps* _vfuncGetcapsTramp(GstAudioEncoder* enc, GstCaps* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncGetcaps");
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
        static extern(C) GstFlowReturn _vfuncHandleFrameTramp(GstAudioEncoder* enc, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.handleFrame)
              return (cast(typeof(&_vfuncHandleFrameTramp))_klass.handleFrame)(enc, buffer);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncHandleFrame(_buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncHandleFrame");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_buffer)
            _buffer._cUnborrow;

          return _retval;
        }

        _klass.handleFrame = cast(typeof(_klass.handleFrame))&_vfuncHandleFrameTramp;
        break;
      }
      case "negotiate":
      {
        static extern(C) gboolean _vfuncNegotiateTramp(GstAudioEncoder* enc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.negotiate)
              return (cast(typeof(&_vfuncNegotiateTramp))_klass.negotiate)(enc);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncNegotiate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncNegotiate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.negotiate = cast(typeof(_klass.negotiate))&_vfuncNegotiateTramp;
        break;
      }
      case "open":
      {
        static extern(C) gboolean _vfuncOpenTramp(GstAudioEncoder* enc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.open)
              return (cast(typeof(&_vfuncOpenTramp))_klass.open)(enc);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncOpen();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncOpen");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.open = cast(typeof(_klass.open))&_vfuncOpenTramp;
        break;
      }
      case "propose_allocation":
      {
        static extern(C) gboolean _vfuncProposeAllocationTramp(GstAudioEncoder* enc, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.proposeAllocation)
              return (cast(typeof(&_vfuncProposeAllocationTramp))_klass.proposeAllocation)(enc, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncProposeAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.proposeAllocation = cast(typeof(_klass.proposeAllocation))&_vfuncProposeAllocationTramp;
        break;
      }
      case "set_format":
      {
        static extern(C) gboolean _vfuncSetFormatTramp(GstAudioEncoder* enc, GstAudioInfo* info) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.setFormat)
              return (cast(typeof(&_vfuncSetFormatTramp))_klass.setFormat)(enc, info);
            return typeof(return).init;
          }

          bool _dretval;
          auto _info = info ? new gid.gstaudio1.audio_info.AudioInfo(cast(void*)info, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetFormat(_info);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncSetFormat");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_info)
            _info._cUnborrow;

          return _retval;
        }

        _klass.setFormat = cast(typeof(_klass.setFormat))&_vfuncSetFormatTramp;
        break;
      }
      case "sink_event":
      {
        static extern(C) gboolean _vfuncSinkEventTramp(GstAudioEncoder* enc, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.sinkEvent)
              return (cast(typeof(&_vfuncSinkEventTramp))_klass.sinkEvent)(enc, event);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncSinkEvent");
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
        static extern(C) gboolean _vfuncSinkQueryTramp(GstAudioEncoder* encoder, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncSinkQuery");
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
        static extern(C) gboolean _vfuncSrcEventTramp(GstAudioEncoder* enc, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.srcEvent)
              return (cast(typeof(&_vfuncSrcEventTramp))_klass.srcEvent)(enc, event);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncSrcEvent");
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
        static extern(C) gboolean _vfuncSrcQueryTramp(GstAudioEncoder* encoder, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)encoder);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)encoder);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncSrcQuery");
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
        static extern(C) gboolean _vfuncStartTramp(GstAudioEncoder* enc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(enc);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstAudioEncoder* enc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(enc);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      case "transform_meta":
      {
        static extern(C) gboolean _vfuncTransformMetaTramp(GstAudioEncoder* enc, GstBuffer* outbuf, GstMeta* meta, GstBuffer* inbuf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_encoder.AudioEncoder)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioEncoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
            if (_klass.transformMeta)
              return (cast(typeof(&_vfuncTransformMetaTramp))_klass.transformMeta)(enc, outbuf, meta, inbuf);
            return typeof(return).init;
          }

          bool _dretval;
          auto _outbuf = outbuf ? new gid.gst1.buffer.Buffer(cast(void*)outbuf, Yes.Take)._cBorrow : null;
          auto _meta = meta ? new gid.gst1.meta.Meta(cast(void*)meta, null) : null;
          auto _inbuf = inbuf ? new gid.gst1.buffer.Buffer(cast(void*)inbuf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncTransformMeta(_outbuf, _meta, _inbuf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_encoder.AudioEncoder.vfuncTransformMeta");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_outbuf)
            _outbuf._cUnborrow;
          if (_inbuf)
            _inbuf._cUnborrow;

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

/// Fluent builder implementation template for [gid.gstaudio1.audio_encoder.AudioEncoder]
class AudioEncoderGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T, gid.gst1.preset.PresetGidBuilderImpl!T
{

  mixin PresetGidBuilderT!();

  /** */
  T hardResync(bool propval) nothrow
  {
    return setProperty("hard-resync", propval);
  }

  /** */
  T perfectTimestamp(bool propval) nothrow
  {
    return setProperty("perfect-timestamp", propval);
  }

  /** */
  T tolerance(long propval) nothrow
  {
    return setProperty("tolerance", propval);
  }
}

/// Fluent builder for [gid.gstaudio1.audio_encoder.AudioEncoder]
final class AudioEncoderGidBuilder : AudioEncoderGidBuilderImpl!AudioEncoderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioEncoder build() nothrow
  {
    return new AudioEncoder(cast(void*)createGObject(AudioEncoder._getGType), Yes.Take);
  }
}
