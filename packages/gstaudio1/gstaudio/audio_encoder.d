/// Module for [AudioEncoder] class
module gstaudio.audio_encoder;

import gid.gid;
import gobject.object;
import gst.allocation_params;
import gst.allocator;
import gst.buffer;
import gst.caps;
import gst.element;
import gst.preset;
import gst.preset_mixin;
import gst.tag_list;
import gst.types;
import gstaudio.audio_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    This base class is for audio encoders turning raw audio samples into
    encoded audio data.
    
    GstAudioEncoder and subclass should cooperate as follows.
    
    ## Configuration
    
      $(LIST
          * Initially, GstAudioEncoder calls @start when the encoder element
            is activated, which allows subclass to perform any global setup.
        
          * GstAudioEncoder calls @set_format to inform subclass of the format
            of input audio data that it is about to receive.  Subclass should
            setup for encoding and configure various base class parameters
            appropriately, notably those directing desired input data handling.
            While unlikely, it might be called more than once, if changing input
            parameters require reconfiguration.
        
          * GstAudioEncoder calls @stop at end of all processing.
      )
        
    As of configuration stage, and throughout processing, GstAudioEncoder
    maintains various parameters that provide required context,
    e.g. describing the format of input audio data.
    Conversely, subclass can and should configure these context parameters
    to inform base class of its expectation w.r.t. buffer handling.
    
    ## Data processing
    
        $(LIST
              * Base class gathers input sample data (as directed by the context's
                frame_samples and frame_max) and provides this to subclass' @handle_frame.
              * If codec processing results in encoded data, subclass should call
                [gstaudio.audio_encoder.AudioEncoder.finishFrame] to have encoded data pushed
                downstream. Alternatively, it might also call
                [gstaudio.audio_encoder.AudioEncoder.finishFrame] (with a NULL buffer and some number of
                dropped samples) to indicate dropped (non-encoded) samples.
              * Just prior to actually pushing a buffer downstream,
                it is passed to @pre_push.
              * During the parsing process GstAudioEncoderClass will handle both
                srcpad and sinkpad events. Sink events will be passed to subclass
                if @event callback has been provided.
        )
          
    ## Shutdown phase
    
      $(LIST
          * GstAudioEncoder class calls @stop to inform the subclass that data
            parsing will be stopped.
      )
        
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
    
      $(LIST
          * Provide pad templates
          * Set source pad caps when appropriate
          * Inform base class of buffer processing needs using context's
             frame_samples and frame_bytes.
          * Set user-configurable properties to sane defaults for format and
             implementing codec at hand, e.g. those controlling timestamp behaviour
             and discontinuity processing.
          * Accept data in @handle_frame and provide encoded results to
             [gstaudio.audio_encoder.AudioEncoder.finishFrame].
      )
*/
class AudioEncoder : gst.element.Element, gst.preset.Preset
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
    return cast(void function())gst_audio_encoder_get_type != &gidSymbolNotFound ? gst_audio_encoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioEncoder self()
  {
    return this;
  }

  /** */
  @property bool hardResync()
  {
    return getHardResync();
  }

  /** */
  @property void hardResync(bool propval)
  {
    return setHardResync(propval);
  }

  /** */
  @property bool markGranule()
  {
    return getMarkGranule();
  }

  /** */
  @property bool perfectTimestamp()
  {
    return getPerfectTimestamp();
  }

  /** */
  @property void perfectTimestamp(bool propval)
  {
    return setPerfectTimestamp(propval);
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

  mixin PresetT!();

  /**
      Helper function that allocates a buffer to hold an encoded audio frame
      for enc's current output format.
  
      Params:
        size = size of the buffer
      Returns: allocated buffer
  */
  gst.buffer.Buffer allocateOutputBuffer(size_t size)
  {
    GstBuffer* _cretval;
    _cretval = gst_audio_encoder_allocate_output_buffer(cast(GstAudioEncoder*)this._cPtr, size);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
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
  gst.types.FlowReturn finishFrame(gst.buffer.Buffer buffer, int samples)
  {
    GstFlowReturn _cretval;
    _cretval = gst_audio_encoder_finish_frame(cast(GstAudioEncoder*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null, samples);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
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
  void getAllocator(out gst.allocator.Allocator allocator, out gst.allocation_params.AllocationParams params)
  {
    GstAllocator* _allocator;
    GstAllocationParams _params;
    gst_audio_encoder_get_allocator(cast(GstAudioEncoder*)this._cPtr, &_allocator, &_params);
    allocator = new gst.allocator.Allocator(cast(void*)_allocator, Yes.Take);
    params = new gst.allocation_params.AllocationParams(cast(void*)&_params, Yes.Take);
  }

  /** */
  gstaudio.audio_info.AudioInfo getAudioInfo()
  {
    GstAudioInfo* _cretval;
    _cretval = gst_audio_encoder_get_audio_info(cast(GstAudioEncoder*)this._cPtr);
    auto _retval = _cretval ? new gstaudio.audio_info.AudioInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Queries encoder drain handling.
      Returns: TRUE if drainable handling is enabled.
        
        MT safe.
  */
  bool getDrainable()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_encoder_get_drainable(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /** */
  int getFrameMax()
  {
    int _retval;
    _retval = gst_audio_encoder_get_frame_max(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /** */
  int getFrameSamplesMax()
  {
    int _retval;
    _retval = gst_audio_encoder_get_frame_samples_max(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /** */
  int getFrameSamplesMin()
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
  bool getHardMin()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_encoder_get_hard_min(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /** */
  bool getHardResync()
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
  void getLatency(out gst.types.ClockTime min, out gst.types.ClockTime max)
  {
    gst_audio_encoder_get_latency(cast(GstAudioEncoder*)this._cPtr, cast(GstClockTime*)&min, cast(GstClockTime*)&max);
  }

  /** */
  int getLookahead()
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
  bool getMarkGranule()
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
  bool getPerfectTimestamp()
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
  gst.types.ClockTime getTolerance()
  {
    gst.types.ClockTime _retval;
    _retval = gst_audio_encoder_get_tolerance(cast(GstAudioEncoder*)this._cPtr);
    return _retval;
  }

  /**
      Sets the audio encoder tags and how they should be merged with any
      upstream stream tags. This will override any tags previously-set
      with [gstaudio.audio_encoder.AudioEncoder.mergeTags].
      
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
    gst_audio_encoder_merge_tags(cast(GstAudioEncoder*)this._cPtr, tags ? cast(const(GstTagList)*)tags._cPtr(No.Dup) : null, mode);
  }

  /**
      Negotiate with downstream elements to currently configured #GstCaps.
      Unmark GST_PAD_FLAG_NEED_RECONFIGURE in any case. But mark it again if
      negotiate fails.
      Returns: true if the negotiation succeeded, else false.
  */
  bool negotiate()
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
  gst.caps.Caps proxyGetcaps(gst.caps.Caps caps = null, gst.caps.Caps filter = null)
  {
    GstCaps* _cretval;
    _cretval = gst_audio_encoder_proxy_getcaps(cast(GstAudioEncoder*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets a caps in allocation query which are different from the set
      pad's caps. Use this function before calling
      [gstaudio.audio_encoder.AudioEncoder.negotiate]. Setting to null the allocation
      query will use the caps from the pad.
  
      Params:
        allocationCaps = a #GstCaps or null
  */
  void setAllocationCaps(gst.caps.Caps allocationCaps = null)
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
  void setDrainable(bool enabled)
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
  void setFrameMax(int num)
  {
    gst_audio_encoder_set_frame_max(cast(GstAudioEncoder*)this._cPtr, num);
  }

  /**
      Sets number of samples (per channel) subclass needs to be handed,
      at most or will be handed all available if 0.
      
      If an exact number of samples is required, [gstaudio.audio_encoder.AudioEncoder.setFrameSamplesMin]
      must be called with the same number.
      
      Note: This value will be reset to 0 every time before
      #GstAudioEncoderClass.set_format() is called.
  
      Params:
        num = number of samples per frame
  */
  void setFrameSamplesMax(int num)
  {
    gst_audio_encoder_set_frame_samples_max(cast(GstAudioEncoder*)this._cPtr, num);
  }

  /**
      Sets number of samples (per channel) subclass needs to be handed,
      at least or will be handed all available if 0.
      
      If an exact number of samples is required, [gstaudio.audio_encoder.AudioEncoder.setFrameSamplesMax]
      must be called with the same number.
      
      Note: This value will be reset to 0 every time before
      #GstAudioEncoderClass.set_format() is called.
  
      Params:
        num = number of samples per frame
  */
  void setFrameSamplesMin(int num)
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
  void setHardMin(bool enabled)
  {
    gst_audio_encoder_set_hard_min(cast(GstAudioEncoder*)this._cPtr, enabled);
  }

  /** */
  void setHardResync(bool enabled)
  {
    gst_audio_encoder_set_hard_resync(cast(GstAudioEncoder*)this._cPtr, enabled);
  }

  /**
      Sets encoder latency. If the provided values changed from
      previously provided ones, this will also post a LATENCY message on the bus
      so the pipeline can reconfigure its global latency.
  
      Params:
        min = minimum latency
        max = maximum latency
  */
  void setLatency(gst.types.ClockTime min, gst.types.ClockTime max)
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
  void setLookahead(int num)
  {
    gst_audio_encoder_set_lookahead(cast(GstAudioEncoder*)this._cPtr, num);
  }

  /**
      Enable or disable encoder granule handling.
      
      MT safe.
  
      Params:
        enabled = new state
  */
  void setMarkGranule(bool enabled)
  {
    gst_audio_encoder_set_mark_granule(cast(GstAudioEncoder*)this._cPtr, enabled);
  }

  /**
      Configure output caps on the srcpad of enc.
  
      Params:
        caps = #GstCaps
      Returns: true on success.
  */
  bool setOutputFormat(gst.caps.Caps caps)
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
  void setPerfectTimestamp(bool enabled)
  {
    gst_audio_encoder_set_perfect_timestamp(cast(GstAudioEncoder*)this._cPtr, enabled);
  }

  /**
      Configures encoder audio jitter tolerance threshold.
      
      MT safe.
  
      Params:
        tolerance = new tolerance
  */
  void setTolerance(gst.types.ClockTime tolerance)
  {
    gst_audio_encoder_set_tolerance(cast(GstAudioEncoder*)this._cPtr, tolerance);
  }
}
