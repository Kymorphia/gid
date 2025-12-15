/// Module for [AudioDecoder] class
module gstaudio.audio_decoder;

import gid.gid;
import gobject.object;
import gst.allocation_params;
import gst.allocator;
import gst.buffer;
import gst.caps;
import gst.element;
import gst.tag_list;
import gst.types;
import gstaudio.audio_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    This base class is for audio decoders turning encoded data into
    raw audio samples.
    
    GstAudioDecoder and subclass should cooperate as follows.
    
    ## Configuration
    
      $(LIST
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
      )
        
    As of configuration stage, and throughout processing, GstAudioDecoder
    provides various (context) parameters, e.g. describing the format of
    output audio data (valid when output caps have been set) or current parsing state.
    Conversely, subclass can and should configure context to inform
    base class of its expectation w.r.t. buffer handling.
    
    ## Data processing
        $(LIST
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
        )
          
    ## Shutdown phase
    
      $(LIST
          * GstAudioDecoder class calls @stop to inform the subclass that data
            parsing will be stopped.
      )
        
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
    
      $(LIST
          * Provide pad templates
          * Set source pad caps when appropriate
          * Set user-configurable properties to sane defaults for format and
             implementing codec at hand, and convey some subclass capabilities and
             expectations in context.
        
          * Accept data in @handle_frame and provide encoded results to
             @gst_audio_decoder_finish_frame.  If it is prepared to perform
             PLC, it should also accept NULL data in @handle_frame and provide for
             data for indicated duration.
      )
*/
class AudioDecoder : gst.element.Element
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
    return cast(void function())gst_audio_decoder_get_type != &gidSymbolNotFound ? gst_audio_decoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioDecoder self()
  {
    return this;
  }

  /**
      Get `maxErrors` property.
      Returns: Maximum number of tolerated consecutive decode errors. See
      [gstaudio.audio_decoder.AudioDecoder.setMaxErrors] for more details.
  */
  @property int maxErrors()
  {
    return getMaxErrors();
  }

  /**
      Set `maxErrors` property.
      Params:
        propval = Maximum number of tolerated consecutive decode errors. See
        [gstaudio.audio_decoder.AudioDecoder.setMaxErrors] for more details.
  */
  @property void maxErrors(int propval)
  {
    return setMaxErrors(propval);
  }

  /** */
  @property long minLatency()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("min-latency");
  }

  /** */
  @property void minLatency(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("min-latency", propval);
  }

  /** */
  @property bool plc()
  {
    return getPlc();
  }

  /** */
  @property void plc(bool propval)
  {
    return setPlc(propval);
  }

  /** */
  @property long tolerance()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("tolerance");
  }

  /** */
  @property void tolerance(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("tolerance", propval);
  }

  /**
      Helper function that allocates a buffer to hold an audio frame
      for dec's current output format.
  
      Params:
        size = size of the buffer
      Returns: allocated buffer
  */
  gst.buffer.Buffer allocateOutputBuffer(size_t size)
  {
    GstBuffer* _cretval;
    _cretval = gst_audio_decoder_allocate_output_buffer(cast(GstAudioDecoder*)this._cPtr, size);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
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
  gst.types.FlowReturn finishFrame(gst.buffer.Buffer buf, int frames)
  {
    GstFlowReturn _cretval;
    _cretval = gst_audio_decoder_finish_frame(cast(GstAudioDecoder*)this._cPtr, buf ? cast(GstBuffer*)buf._cPtr(Yes.Dup) : null, frames);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Collects decoded data and pushes it downstream. This function may be called
      multiple times for a given input frame.
      
      buf may be NULL in which case it is assumed that the current input frame is
      finished. This is equivalent to calling [gstaudio.audio_decoder.AudioDecoder.finishSubframe]
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
  gst.types.FlowReturn finishSubframe(gst.buffer.Buffer buf = null)
  {
    GstFlowReturn _cretval;
    _cretval = gst_audio_decoder_finish_subframe(cast(GstAudioDecoder*)this._cPtr, buf ? cast(GstBuffer*)buf._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
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
  void getAllocator(out gst.allocator.Allocator allocator, out gst.allocation_params.AllocationParams params)
  {
    GstAllocator* _allocator;
    GstAllocationParams _params;
    gst_audio_decoder_get_allocator(cast(GstAudioDecoder*)this._cPtr, &_allocator, &_params);
    allocator = new gst.allocator.Allocator(cast(void*)_allocator, Yes.Take);
    params = new gst.allocation_params.AllocationParams(cast(void*)&_params, Yes.Take);
  }

  /** */
  gstaudio.audio_info.AudioInfo getAudioInfo()
  {
    GstAudioInfo* _cretval;
    _cretval = gst_audio_decoder_get_audio_info(cast(GstAudioDecoder*)this._cPtr);
    auto _retval = _cretval ? new gstaudio.audio_info.AudioInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  int getDelay()
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
  bool getDrainable()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_decoder_get_drainable(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /** */
  int getEstimateRate()
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
  void getLatency(out gst.types.ClockTime min, out gst.types.ClockTime max)
  {
    gst_audio_decoder_get_latency(cast(GstAudioDecoder*)this._cPtr, cast(GstClockTime*)&min, cast(GstClockTime*)&max);
  }

  /** */
  int getMaxErrors()
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
  gst.types.ClockTime getMinLatency()
  {
    gst.types.ClockTime _retval;
    _retval = gst_audio_decoder_get_min_latency(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Queries decoder required format handling.
      Returns: TRUE if required format handling is enabled.
        
        MT safe.
  */
  bool getNeedsFormat()
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
  void getParseState(out bool sync, out bool eos)
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
  bool getPlc()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_decoder_get_plc(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /** */
  int getPlcAware()
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
  gst.types.ClockTime getTolerance()
  {
    gst.types.ClockTime _retval;
    _retval = gst_audio_decoder_get_tolerance(cast(GstAudioDecoder*)this._cPtr);
    return _retval;
  }

  /**
      Sets the audio decoder tags and how they should be merged with any
      upstream stream tags. This will override any tags previously-set
      with [gstaudio.audio_decoder.AudioDecoder.mergeTags].
      
      Note that this is provided for convenience, and the subclass is
      not required to use this and can still do tag handling on its own.
  
      Params:
        tags = a #GstTagList to merge, or NULL
        mode = the #GstTagMergeMode to use, usually #GST_TAG_MERGE_REPLACE
  */
  void mergeTags(gst.tag_list.TagList tags, gst.types.TagMergeMode mode)
  {
    gst_audio_decoder_merge_tags(cast(GstAudioDecoder*)this._cPtr, tags ? cast(const(GstTagList)*)tags._cPtr(No.Dup) : null, mode);
  }

  /**
      Negotiate with downstream elements to currently configured #GstAudioInfo.
      Unmark GST_PAD_FLAG_NEED_RECONFIGURE in any case. But mark it again if
      negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  */
  bool negotiate()
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
  gst.caps.Caps proxyGetcaps(gst.caps.Caps caps = null, gst.caps.Caps filter = null)
  {
    GstCaps* _cretval;
    _cretval = gst_audio_decoder_proxy_getcaps(cast(GstAudioDecoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets a caps in allocation query which are different from the set
      pad's caps. Use this function before calling
      [gstaudio.audio_decoder.AudioDecoder.negotiate]. Setting to null the allocation
      query will use the caps from the pad.
  
      Params:
        allocationCaps = a #GstCaps or null
  */
  void setAllocationCaps(gst.caps.Caps allocationCaps = null)
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
  void setDrainable(bool enabled)
  {
    gst_audio_decoder_set_drainable(cast(GstAudioDecoder*)this._cPtr, enabled);
  }

  /**
      Allows baseclass to perform byte to time estimated conversion.
  
      Params:
        enabled = whether to enable byte to time conversion
  */
  void setEstimateRate(bool enabled)
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
  void setLatency(gst.types.ClockTime min, gst.types.ClockTime max)
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
  void setMaxErrors(int num)
  {
    gst_audio_decoder_set_max_errors(cast(GstAudioDecoder*)this._cPtr, num);
  }

  /**
      Sets decoder minimum aggregation latency.
      
      MT safe.
  
      Params:
        num = new minimum latency
  */
  void setMinLatency(gst.types.ClockTime num)
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
  void setNeedsFormat(bool enabled)
  {
    gst_audio_decoder_set_needs_format(cast(GstAudioDecoder*)this._cPtr, enabled);
  }

  /**
      Configure output caps on the srcpad of dec. Similar to
      [gstaudio.audio_decoder.AudioDecoder.setOutputFormat], but allows subclasses to specify
      output caps that can't be expressed via #GstAudioInfo e.g. caps that have
      caps features.
  
      Params:
        caps = (fixed) #GstCaps
      Returns: true on success.
  */
  bool setOutputCaps(gst.caps.Caps caps)
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
  bool setOutputFormat(gstaudio.audio_info.AudioInfo info)
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
  void setPlc(bool enabled)
  {
    gst_audio_decoder_set_plc(cast(GstAudioDecoder*)this._cPtr, enabled);
  }

  /**
      Indicates whether or not subclass handles packet loss concealment (plc).
  
      Params:
        plc = new plc state
  */
  void setPlcAware(bool plc)
  {
    gst_audio_decoder_set_plc_aware(cast(GstAudioDecoder*)this._cPtr, plc);
  }

  /**
      Configures decoder audio jitter tolerance threshold.
      
      MT safe.
  
      Params:
        tolerance = new tolerance
  */
  void setTolerance(gst.types.ClockTime tolerance)
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
  void setUseDefaultPadAcceptcaps(bool use)
  {
    gst_audio_decoder_set_use_default_pad_acceptcaps(cast(GstAudioDecoder*)this._cPtr, use);
  }
}
