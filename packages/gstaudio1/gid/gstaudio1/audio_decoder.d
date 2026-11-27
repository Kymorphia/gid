/// Module for [AudioDecoder] class
module gid.gstaudio1.audio_decoder;

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
import gid.gst1.query;
import gid.gst1.tag_list;
import gid.gst1.types;
import gid.gstaudio1.audio_info;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;
import gid.gstbase1.adapter;

/**
    This base class is for audio decoders turning encoded data into
    raw audio samples.
    
    GstAudioDecoder and subclass should cooperate as follows.
    
    ## Configuration
    
      * Initially, GstAudioDecoder calls @start when the decoder element
        is activated, which allows subclass to perform any global setup.
        Base class (context) parameters can already be set according to subclass
        capabilities (or possibly upon receive more information in subsequent
        @set_format).
      * GstAudioDecoder calls @set_format to inform subclass of the format
        of input audio data that it is about to receive.
        While unlikely, it might be called more than once, if changing input
        parameters require reconfiguration.
      * GstAudioDecoder calls @stop at end of all processing.
    
    As of configuration stage, and throughout processing, GstAudioDecoder
    provides various (context) parameters, e.g. describing the format of
    output audio data (valid when output caps have been set) or current parsing state.
    Conversely, subclass can and should configure context to inform
    base class of its expectation w.r.t. buffer handling.
    
    ## Data processing
        * Base class gathers input data, and optionally allows subclass
          to parse this into subsequently manageable (as defined by subclass)
          chunks.  Such chunks are subsequently referred to as 'frames',
          though they may or may not correspond to 1 (or more) audio format frame.
        * Input frame is provided to subclass' @handle_frame.
        * If codec processing results in decoded data, subclass should call
          @gst_audio_decoder_finish_frame to have decoded data pushed
          downstream.
        * Just prior to actually pushing a buffer downstream,
          it is passed to @pre_push.  Subclass should either use this callback
          to arrange for additional downstream pushing or otherwise ensure such
          custom pushing occurs after at least a method call has finished since
          setting src pad caps.
        * During the parsing process GstAudioDecoderClass will handle both
          srcpad and sinkpad events. Sink events will be passed to subclass
          if @event callback has been provided.
    
    ## Shutdown phase
    
      * GstAudioDecoder class calls @stop to inform the subclass that data
        parsing will be stopped.
    
    Subclass is responsible for providing pad template caps for
    source and sink pads. The pads need to be named "sink" and "src". It also
    needs to set the fixed caps on srcpad, when the format is ensured.  This
    is typically when base class calls subclass' @set_format function, though
    it might be delayed until calling @gst_audio_decoder_finish_frame.
    
    In summary, above process should have subclass concentrating on
    codec data processing while leaving other matters to base class,
    such as most notably timestamp handling.  While it may exert more control
    in this area (see e.g. @pre_push), it is very much not recommended.
    
    In particular, base class will try to arrange for perfect output timestamps
    as much as possible while tracking upstream timestamps.
    To this end, if deviation between the next ideal expected perfect timestamp
    and upstream exceeds #GstAudioDecoder:tolerance, then resync to upstream
    occurs (which would happen always if the tolerance mechanism is disabled).
    
    In non-live pipelines, baseclass can also (configurably) arrange for
    output buffer aggregation which may help to redue large(r) numbers of
    small(er) buffers being pushed and processed downstream. Note that this
    feature is only available if the buffer layout is interleaved. For planar
    buffers, the decoder implementation is fully responsible for the output
    buffer size.
    
    On the other hand, it should be noted that baseclass only provides limited
    seeking support (upon explicit subclass request), as full-fledged support
    should rather be left to upstream demuxer, parser or alike.  This simple
    approach caters for seeking and duration reporting using estimated input
    bitrates.
    
    Things that subclass need to take care of:
    
      * Provide pad templates
      * Set source pad caps when appropriate
      * Set user-configurable properties to sane defaults for format and
         implementing codec at hand, and convey some subclass capabilities and
         expectations in context.
    
      * Accept data in @handle_frame and provide encoded results to
         @gst_audio_decoder_finish_frame.  If it is prepared to perform
         PLC, it should also accept NULL data in @handle_frame and provide for
         data for indicated duration.
*/
@gidGir("AudioDecoder", "AudioDecoderClass")
class AudioDecoder : gid.gst1.element.Element
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
    return cast(void function())gst_audio_decoder_get_type != &gidSymbolNotFound ? gst_audio_decoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioDecoder";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioDecoder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_decoder.AudioDecoder]
      Returns: New builder object
  */
  static AudioDecoderGidBuilder builder() nothrow
  {
    return new AudioDecoderGidBuilder;
  }

  /**
      Get `maxErrors` property.
      Returns: Maximum number of tolerated consecutive decode errors. See
        [gid.gstaudio1.audio_decoder.AudioDecoder.setMaxErrors] for more details.
  */
  @property int maxErrors() nothrow
  {
    return getMaxErrors();
  }

  /**
      Set `maxErrors` property.
      Params:
        propval = Maximum number of tolerated consecutive decode errors. See
          [gid.gstaudio1.audio_decoder.AudioDecoder.setMaxErrors] for more details.
  */
  @property void maxErrors(int propval) nothrow
  {
    setMaxErrors(propval);
  }

  /** */
  @property long minLatency() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("min-latency");
  }

  /** */
  @property void minLatency(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("min-latency", propval);
  }

  /** */
  @property bool plc() nothrow
  {
    return getPlc();
  }

  /** */
  @property void plc(bool propval) nothrow
  {
    setPlc(propval);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.close)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.close(cast(GstAudioDecoder*)this._cPtr);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.decideAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.decideAllocation(cast(GstAudioDecoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Instructs subclass to clear any codec caches and discard
                       any pending samples and not yet returned decoded data.
                       hard indicates whether a FLUSH is being processed,
                       or otherwise a DISCONT (or conceptually similar).
  
      Params:
        hard = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlush` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncFlush(bool hard)
  {
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.flush)
      return;

    _klass.flush(cast(GstAudioDecoder*)this._cPtr, hard);
  }

  /**
      Optional.
                       Allows for a custom sink getcaps implementation.
                       If not implemented,
                       default returns gst_audio_decoder_proxy_getcaps
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.getcaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.getcaps(cast(GstAudioDecoder*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Provides input data (or NULL to clear any remaining data)
                       to subclass.  Input data ref management is performed by
                       base class, subclass should not care or intervene,
                       and input data is only valid until next call to base class,
                       most notably a call to [gid.gstaudio1.audio_decoder.AudioDecoder.finishFrame].
  
      Params:
        buffer =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandleFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncHandleFrame(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.handleFrame)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.handleFrame(cast(GstAudioDecoder*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Negotiate with downstream elements to currently configured #GstAudioInfo.
      Unmark GST_PAD_FLAG_NEED_RECONFIGURE in any case. But mark it again if
      negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNegotiate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncNegotiate()
  {
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.negotiate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.negotiate(cast(GstAudioDecoder*)this._cPtr);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.open)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.open(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /** */
  protected gid.gst1.types.FlowReturn vfuncParse(gid.gstbase1.adapter.Adapter adapter, out int offset, out int length)
  {
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.parse)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.parse(cast(GstAudioDecoder*)this._cPtr, adapter ? cast(GstAdapter*)adapter._cPtr(No.Dup) : null, cast(int*)&offset, cast(int*)&length);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.proposeAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.proposeAllocation(cast(GstAudioDecoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Notifies subclass of incoming data format (caps).
  
      Params:
        caps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetFormat` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetFormat(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.setFormat)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setFormat(cast(GstAudioDecoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.sinkEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkEvent(cast(GstAudioDecoder*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.sinkQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkQuery(cast(GstAudioDecoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.srcEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcEvent(cast(GstAudioDecoder*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.srcQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcQuery(cast(GstAudioDecoder*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstAudioDecoder*)this._cPtr);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstAudioDecoder*)this._cPtr);
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
    auto _klass = cast(GstAudioDecoderClass*)_vfuncClass;
    if (!_klass.transformMeta)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.transformMeta(cast(GstAudioDecoder*)this._cPtr, outbuf ? cast(GstBuffer*)outbuf._cPtr(No.Dup) : null, meta ? cast(GstMeta*)meta._cPtr : null, inbuf ? cast(GstBuffer*)inbuf._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Helper function that allocates a buffer to hold an audio frame
      for dec's current output format.
  
      Params:
        size = size of the buffer
      Returns: allocated buffer
  */
  gid.gst1.buffer.Buffer allocateOutputBuffer(size_t size) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_audio_decoder_allocate_output_buffer(cast(GstAudioDecoder*)this._cPtr, size);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Collects decoded data and pushes it downstream.
      
      buf may be NULL in which case the indicated number of frames
      are discarded and considered to have produced no output
      (e.g. lead-in or setup frames).
      Otherwise, source pad caps must be set when it is called with valid
      data in buf.
      
      Note that a frame received in #GstAudioDecoderClass.handle_frame() may be
      invalidated by a call to this function.
  
      Params:
        buf = decoded data
        frames = number of decoded frames represented by decoded data
      Returns: a #GstFlowReturn that should be escalated to caller (of caller)
  */
  gid.gst1.types.FlowReturn finishFrame(gid.gst1.buffer.Buffer buf, int frames) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_audio_decoder_finish_frame(cast(GstAudioDecoder*)this._cPtr, buf ? cast(GstBuffer*)buf._cPtr(Yes.Dup) : null, frames);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Collects decoded data and pushes it downstream. This function may be called
      multiple times for a given input frame.
      
      buf may be NULL in which case it is assumed that the current input frame is
      finished. This is equivalent to calling [gid.gstaudio1.audio_decoder.AudioDecoder.finishSubframe]
      with a NULL buffer and frames=1 after having pushed out all decoded audio
      subframes using this function.
      
      When called with valid data in buf the source pad caps must have been set
      already.
      
      Note that a frame received in #GstAudioDecoderClass.handle_frame() may be
      invalidated by a call to this function.
  
      Params:
        buf = decoded data
      Returns: a #GstFlowReturn that should be escalated to caller (of caller)
  */
  gid.gst1.types.FlowReturn finishSubframe(gid.gst1.buffer.Buffer buf = null) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_audio_decoder_finish_subframe(cast(GstAudioDecoder*)this._cPtr, buf ? cast(GstBuffer*)buf._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Lets #GstAudioDecoder sub-classes to know the memory allocator
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
    gst_audio_decoder_get_allocator(cast(GstAudioDecoder*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(_allocator, Yes.Take);
  }

  /** */
  gid.gstaudio1.audio_info.AudioInfo getAudioInfo() nothrow
  {
    GstAudioInfo* _cretval;
    _cretval = gst_audio_decoder_get_audio_info(cast(GstAudioDecoder*)this._cPtr);
    auto _retval = _cretval ? new gid.gstaudio1.audio_info.AudioInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  int getDelay() nothrow
  {
    int _retval;
    _retval = gst_audio_decoder_get_delay(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries decoder drain handling.
      Returns: TRUE if drainable handling is enabled.
        
        MT safe.
  */
  bool getDrainable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_decoder_get_drainable(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /** */
  int getEstimateRate() nothrow
  {
    int _retval;
    _retval = gst_audio_decoder_get_estimate_rate(cast(GstAudioDecoder*)this._cPtr);
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
    gst_audio_decoder_get_latency(cast(GstAudioDecoder*)this._cPtr, cast(GstClockTime*)&min, cast(GstClockTime*)&max);
  }

  /** */
  int getMaxErrors() nothrow
  {
    int _retval;
    _retval = gst_audio_decoder_get_max_errors(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries decoder's latency aggregation.
      Returns: aggregation latency.
        
        MT safe.
  */
  gid.gst1.types.ClockTime getMinLatency() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_audio_decoder_get_min_latency(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries decoder required format handling.
      Returns: TRUE if required format handling is enabled.
        
        MT safe.
  */
  bool getNeedsFormat() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_decoder_get_needs_format(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Return current parsing (sync and eos) state.
  
      Params:
        sync = a pointer to a variable to hold the current sync state
        eos = a pointer to a variable to hold the current eos state
  */
  void getParseState(out bool sync, out bool eos) nothrow
  {
    gboolean _sync;
    gboolean _eos;
    gst_audio_decoder_get_parse_state(cast(GstAudioDecoder*)this._cPtr, &_sync, &_eos);
    sync = cast(bool)_sync;
    eos = cast(bool)_eos;
  }

  /**
      Queries decoder packet loss concealment handling.
      Returns: TRUE if packet loss concealment is enabled.
        
        MT safe.
  */
  bool getPlc() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_decoder_get_plc(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /** */
  int getPlcAware() nothrow
  {
    int _retval;
    _retval = gst_audio_decoder_get_plc_aware(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries current audio jitter tolerance threshold.
      Returns: decoder audio jitter tolerance threshold.
        
        MT safe.
  */
  gid.gst1.types.ClockTime getTolerance() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_audio_decoder_get_tolerance(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Sets the audio decoder tags and how they should be merged with any
      upstream stream tags. This will override any tags previously-set
      with [gid.gstaudio1.audio_decoder.AudioDecoder.mergeTags].
      
      Note that this is provided for convenience, and the subclass is
      not required to use this and can still do tag handling on its own.
  
      Params:
        tags = a #GstTagList to merge, or NULL
        mode = the #GstTagMergeMode to use, usually #GST_TAG_MERGE_REPLACE
  */
  void mergeTags(gid.gst1.tag_list.TagList tags, gid.gst1.types.TagMergeMode mode) nothrow
  {
    gst_audio_decoder_merge_tags(cast(GstAudioDecoder*)this._cPtr, tags ? cast(const(GstTagList)*)tags._cPtr(No.Dup) : null, mode);
  }

  /**
      Negotiate with downstream elements to currently configured #GstAudioInfo.
      Unmark GST_PAD_FLAG_NEED_RECONFIGURE in any case. But mark it again if
      negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  */
  bool negotiate() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_decoder_negotiate(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Returns caps that express caps (or sink template caps if caps == NULL)
      restricted to rate/channels/... combinations supported by downstream
      elements.
  
      Params:
        caps = initial caps
        filter = filter caps
      Returns: a #GstCaps owned by caller
  */
  gid.gst1.caps.Caps proxyGetcaps(gid.gst1.caps.Caps caps = null, gid.gst1.caps.Caps filter = null) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_audio_decoder_proxy_getcaps(cast(GstAudioDecoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets a caps in allocation query which are different from the set
      pad's caps. Use this function before calling
      [gid.gstaudio1.audio_decoder.AudioDecoder.negotiate]. Setting to null the allocation
      query will use the caps from the pad.
  
      Params:
        allocationCaps = a #GstCaps or null
  */
  void setAllocationCaps(gid.gst1.caps.Caps allocationCaps = null) nothrow
  {
    gst_audio_decoder_set_allocation_caps(cast(GstAudioDecoder*)this._cPtr, allocationCaps ? cast(GstCaps*)allocationCaps._cPtr(No.Dup) : null);
  }

  /**
      Configures decoder drain handling.  If drainable, subclass might
      be handed a NULL buffer to have it return any leftover decoded data.
      Otherwise, it is not considered so capable and will only ever be passed
      real data.
      
      MT safe.
  
      Params:
        enabled = new state
  */
  void setDrainable(bool enabled) nothrow
  {
    gst_audio_decoder_set_drainable(cast(GstAudioDecoder*)this._cPtr, enabled);
  }

  /**
      Allows baseclass to perform byte to time estimated conversion.
  
      Params:
        enabled = whether to enable byte to time conversion
  */
  void setEstimateRate(bool enabled) nothrow
  {
    gst_audio_decoder_set_estimate_rate(cast(GstAudioDecoder*)this._cPtr, enabled);
  }

  /**
      Sets decoder latency. If the provided values changed from
      previously provided ones, this will also post a LATENCY message on the bus
      so the pipeline can reconfigure its global latency.
  
      Params:
        min = minimum latency
        max = maximum latency
  */
  void setLatency(gid.gst1.types.ClockTime min, gid.gst1.types.ClockTime max) nothrow
  {
    gst_audio_decoder_set_latency(cast(GstAudioDecoder*)this._cPtr, min, max);
  }

  /**
      Sets numbers of tolerated decoder errors, where a tolerated one is then only
      warned about, but more than tolerated will lead to fatal error. You can set
      -1 for never returning fatal errors. Default is set to
      GST_AUDIO_DECODER_MAX_ERRORS.
  
      Params:
        num = max tolerated errors
  */
  void setMaxErrors(int num) nothrow
  {
    gst_audio_decoder_set_max_errors(cast(GstAudioDecoder*)this._cPtr, num);
  }

  /**
      Sets decoder minimum aggregation latency.
      
      MT safe.
  
      Params:
        num = new minimum latency
  */
  void setMinLatency(gid.gst1.types.ClockTime num) nothrow
  {
    gst_audio_decoder_set_min_latency(cast(GstAudioDecoder*)this._cPtr, num);
  }

  /**
      Configures decoder format needs.  If enabled, subclass needs to be
      negotiated with format caps before it can process any data.  It will then
      never be handed any data before it has been configured.
      Otherwise, it might be handed data without having been configured and
      is then expected being able to do so either by default
      or based on the input data.
      
      MT safe.
  
      Params:
        enabled = new state
  */
  void setNeedsFormat(bool enabled) nothrow
  {
    gst_audio_decoder_set_needs_format(cast(GstAudioDecoder*)this._cPtr, enabled);
  }

  /**
      Configure output caps on the srcpad of dec. Similar to
      [gid.gstaudio1.audio_decoder.AudioDecoder.setOutputFormat], but allows subclasses to specify
      output caps that can't be expressed via #GstAudioInfo e.g. caps that have
      caps features.
  
      Params:
        caps = (fixed) #GstCaps
      Returns: true on success.
  */
  bool setOutputCaps(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_decoder_set_output_caps(cast(GstAudioDecoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Configure output info on the srcpad of dec.
  
      Params:
        info = #GstAudioInfo
      Returns: true on success.
  */
  bool setOutputFormat(gid.gstaudio1.audio_info.AudioInfo info) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_decoder_set_output_format(cast(GstAudioDecoder*)this._cPtr, info ? cast(const(GstAudioInfo)*)info._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Enable or disable decoder packet loss concealment, provided subclass
      and codec are capable and allow handling plc.
      
      MT safe.
  
      Params:
        enabled = new state
  */
  void setPlc(bool enabled) nothrow
  {
    gst_audio_decoder_set_plc(cast(GstAudioDecoder*)this._cPtr, enabled);
  }

  /**
      Indicates whether or not subclass handles packet loss concealment (plc).
  
      Params:
        plc = new plc state
  */
  void setPlcAware(bool plc) nothrow
  {
    gst_audio_decoder_set_plc_aware(cast(GstAudioDecoder*)this._cPtr, plc);
  }

  /**
      Configures decoder audio jitter tolerance threshold.
      
      MT safe.
  
      Params:
        tolerance = new tolerance
  */
  void setTolerance(gid.gst1.types.ClockTime tolerance) nothrow
  {
    gst_audio_decoder_set_tolerance(cast(GstAudioDecoder*)this._cPtr, tolerance);
  }

  /**
      Lets #GstAudioDecoder sub-classes decide if they want the sink pad
      to use the default pad query handler to reply to accept-caps queries.
      
      By setting this to true it is possible to further customize the default
      handler with `GST_PAD_SET_ACCEPT_INTERSECT` and
      `GST_PAD_SET_ACCEPT_TEMPLATE`
  
      Params:
        use = if the default pad accept-caps query handling should be used
  */
  void setUseDefaultPadAcceptcaps(bool use) nothrow
  {
    gst_audio_decoder_set_use_default_pad_acceptcaps(cast(GstAudioDecoder*)this._cPtr, use);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioDecoder
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstaudio1.audio_decoder.AudioDecoder), T.stringof ~ " is not derived from gid.gstaudio1.audio_decoder.AudioDecoder");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDecideAllocation", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "decide_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlush", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "flush");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetcaps", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "getcaps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandleFrame", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "handle_frame");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNegotiate", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "negotiate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpen", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "open");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncParse", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "parse");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProposeAllocation", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "propose_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetFormat", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "set_format");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkEvent", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "sink_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkQuery", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "sink_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcEvent", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "src_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcQuery", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "src_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformMeta", true)[0]) == gid.gstaudio1.audio_decoder.AudioDecoder))
      _installVfunc(klass, "transform_meta");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioDecoderClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) gboolean _vfuncCloseTramp(GstAudioDecoder* dec) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(dec);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncClose");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "decide_allocation":
      {
        static extern(C) gboolean _vfuncDecideAllocationTramp(GstAudioDecoder* dec, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.decideAllocation)
              return (cast(typeof(&_vfuncDecideAllocationTramp))_klass.decideAllocation)(dec, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncDecideAllocation");
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
        static extern(C) void _vfuncFlushTramp(GstAudioDecoder* dec, gboolean hard) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.flush)
              return (cast(typeof(&_vfuncFlushTramp))_klass.flush)(dec, hard);
            return;
          }

          try
          {
            _obj.vfuncFlush(cast(bool)hard);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncFlush");
          }
        }

        _klass.flush = cast(typeof(_klass.flush))&_vfuncFlushTramp;
        break;
      }
      case "getcaps":
      {
        static extern(C) GstCaps* _vfuncGetcapsTramp(GstAudioDecoder* dec, GstCaps* filter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.getcaps)
              return (cast(typeof(&_vfuncGetcapsTramp))_klass.getcaps)(dec, filter);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncGetcaps");
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
        static extern(C) GstFlowReturn _vfuncHandleFrameTramp(GstAudioDecoder* dec, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.handleFrame)
              return (cast(typeof(&_vfuncHandleFrameTramp))_klass.handleFrame)(dec, buffer);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncHandleFrame");
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
        static extern(C) gboolean _vfuncNegotiateTramp(GstAudioDecoder* dec) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.negotiate)
              return (cast(typeof(&_vfuncNegotiateTramp))_klass.negotiate)(dec);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncNegotiate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncNegotiate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.negotiate = cast(typeof(_klass.negotiate))&_vfuncNegotiateTramp;
        break;
      }
      case "open":
      {
        static extern(C) gboolean _vfuncOpenTramp(GstAudioDecoder* dec) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.open)
              return (cast(typeof(&_vfuncOpenTramp))_klass.open)(dec);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncOpen();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncOpen");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.open = cast(typeof(_klass.open))&_vfuncOpenTramp;
        break;
      }
      case "parse":
      {
        static extern(C) GstFlowReturn _vfuncParseTramp(GstAudioDecoder* dec, GstAdapter* adapter, int* offset, int* length) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.parse)
              return (cast(typeof(&_vfuncParseTramp))_klass.parse)(dec, adapter, offset, length);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncParse(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.adapter.Adapter)(cast(void*)adapter, No.Take), *offset, *length);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncParse");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.parse = cast(typeof(_klass.parse))&_vfuncParseTramp;
        break;
      }
      case "propose_allocation":
      {
        static extern(C) gboolean _vfuncProposeAllocationTramp(GstAudioDecoder* dec, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.proposeAllocation)
              return (cast(typeof(&_vfuncProposeAllocationTramp))_klass.proposeAllocation)(dec, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncProposeAllocation");
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
        static extern(C) gboolean _vfuncSetFormatTramp(GstAudioDecoder* dec, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.setFormat)
              return (cast(typeof(&_vfuncSetFormatTramp))_klass.setFormat)(dec, caps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetFormat(_caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncSetFormat");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.setFormat = cast(typeof(_klass.setFormat))&_vfuncSetFormatTramp;
        break;
      }
      case "sink_event":
      {
        static extern(C) gboolean _vfuncSinkEventTramp(GstAudioDecoder* dec, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.sinkEvent)
              return (cast(typeof(&_vfuncSinkEventTramp))_klass.sinkEvent)(dec, event);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncSinkEvent");
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
        static extern(C) gboolean _vfuncSinkQueryTramp(GstAudioDecoder* dec, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.sinkQuery)
              return (cast(typeof(&_vfuncSinkQueryTramp))_klass.sinkQuery)(dec, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncSinkQuery");
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
        static extern(C) gboolean _vfuncSrcEventTramp(GstAudioDecoder* dec, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.srcEvent)
              return (cast(typeof(&_vfuncSrcEventTramp))_klass.srcEvent)(dec, event);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncSrcEvent");
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
        static extern(C) gboolean _vfuncSrcQueryTramp(GstAudioDecoder* dec, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.srcQuery)
              return (cast(typeof(&_vfuncSrcQueryTramp))_klass.srcQuery)(dec, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncSrcQuery");
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
        static extern(C) gboolean _vfuncStartTramp(GstAudioDecoder* dec) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(dec);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstAudioDecoder* dec) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)dec);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dec);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(dec);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      case "transform_meta":
      {
        static extern(C) gboolean _vfuncTransformMetaTramp(GstAudioDecoder* enc, GstBuffer* outbuf, GstMeta* meta, GstBuffer* inbuf) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_decoder.AudioDecoder)(cast(void*)enc);
          if (!_obj)
          {
            auto _klass = cast(GstAudioDecoderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enc);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_decoder.AudioDecoder.vfuncTransformMeta");
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

/// Fluent builder implementation template for [gid.gstaudio1.audio_decoder.AudioDecoder]
class AudioDecoderGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{

  /**
      Set `maxErrors` property.
      Params:
        propval = Maximum number of tolerated consecutive decode errors. See
          [gid.gstaudio1.audio_decoder.AudioDecoder.setMaxErrors] for more details.
      Returns: Builder instance for fluent chaining
  */
  T maxErrors(int propval) nothrow
  {
    return setProperty("max-errors", propval);
  }

  /** */
  T minLatency(long propval) nothrow
  {
    return setProperty("min-latency", propval);
  }

  /** */
  T plc(bool propval) nothrow
  {
    return setProperty("plc", propval);
  }

  /** */
  T tolerance(long propval) nothrow
  {
    return setProperty("tolerance", propval);
  }
}

/// Fluent builder for [gid.gstaudio1.audio_decoder.AudioDecoder]
final class AudioDecoderGidBuilder : AudioDecoderGidBuilderImpl!AudioDecoderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioDecoder build() nothrow
  {
    return new AudioDecoder(cast(void*)createGObject(AudioDecoder._getGType), Yes.Take);
  }
}
