/// Module for [BaseSrc] class
module gstbase.base_src;

import gid.gid;
import gobject.object;
import gst.allocation_params;
import gst.allocator;
import gst.buffer_list;
import gst.buffer_pool;
import gst.caps;
import gst.element;
import gst.segment;
import gst.types;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    This is a generic base class for source elements. The following
    types of sources are supported:
    
      $(LIST
          * random access sources like files
          * seekable sources
          * live sources
      )
        
    The source can be configured to operate in any #GstFormat with the
    [gstbase.base_src.BaseSrc.setFormat] method. The currently set format determines
    the format of the internal #GstSegment and any [gst.types.EventType.Segment]
    events. The default format for #GstBaseSrc is [gst.types.Format.Bytes].
    
    #GstBaseSrc always supports push mode scheduling. If the following
    conditions are met, it also supports pull mode scheduling:
    
      $(LIST
          * The format is set to [gst.types.Format.Bytes] (default).
          * #GstBaseSrcClass::is_seekable returns true.
      )
        
    If all the conditions are met for operating in pull mode, #GstBaseSrc is
    automatically seekable in push mode as well. The following conditions must
    be met to make the element seekable in push mode when the format is not
    [gst.types.Format.Bytes]:
    
    $(LIST
      * #GstBaseSrcClass::is_seekable returns true.
      * #GstBaseSrcClass::query can convert all supported seek formats to the
        internal format as set with [gstbase.base_src.BaseSrc.setFormat].
      * #GstBaseSrcClass::do_seek is implemented, performs the seek and returns
         true.
    )
      
    When the element does not meet the requirements to operate in pull mode, the
    offset and length in the #GstBaseSrcClass::create method should be ignored.
    It is recommended to subclass #GstPushSrc instead, in this situation. If the
    element can operate in pull mode but only with specific offsets and
    lengths, it is allowed to generate an error when the wrong values are passed
    to the #GstBaseSrcClass::create function.
    
    #GstBaseSrc has support for live sources. Live sources are sources that when
    paused discard data, such as audio or video capture devices. A typical live
    source also produces data at a fixed rate and thus provides a clock to publish
    this rate.
    Use [gstbase.base_src.BaseSrc.setLive] to activate the live source mode.
    
    A live source does not produce data in the PAUSED state. This means that the
    #GstBaseSrcClass::create method will not be called in PAUSED but only in
    PLAYING. To signal the pipeline that the element will not produce data, the
    return value from the READY to PAUSED state will be
    [gst.types.StateChangeReturn.NoPreroll].
    
    A typical live source will timestamp the buffers it creates with the
    current running time of the pipeline. This is one reason why a live source
    can only produce data in the PLAYING state, when the clock is actually
    distributed and running.
    
    Live sources that synchronize and block on the clock (an audio source, for
    example) can use [gstbase.base_src.BaseSrc.waitPlaying] when the
    #GstBaseSrcClass::create function was interrupted by a state change to
    PAUSED.
    
    The #GstBaseSrcClass::get_times method can be used to implement pseudo-live
    sources. It only makes sense to implement the #GstBaseSrcClass::get_times
    function if the source is a live source. The #GstBaseSrcClass::get_times
    function should return timestamps starting from 0, as if it were a non-live
    source. The base class will make sure that the timestamps are transformed
    into the current running_time. The base source will then wait for the
    calculated running_time before pushing out the buffer.
    
    For live sources, the base class will by default report a latency of 0.
    For pseudo live sources, the base class will by default measure the difference
    between the first buffer timestamp and the start time of get_times and will
    report this value as the latency.
    Subclasses should override the query function when this behaviour is not
    acceptable.
    
    There is only support in #GstBaseSrc for exactly one source pad, which
    should be named "src". A source implementation (subclass of #GstBaseSrc)
    should install a pad template in its class_init function, like so:
    ```c
    static void
    my_element_class_init (GstMyElementClass *klass)
    {
      GstElementClass *gstelement_class = GST_ELEMENT_CLASS (klass);
      // srctemplate should be a #GstStaticPadTemplate with direction
      // %GST_PAD_SRC and name "src"
      gst_element_class_add_static_pad_template (gstelement_class, &srctemplate);
    
      gst_element_class_set_static_metadata (gstelement_class,
         "Source name",
         "Source",
         "My Source element",
         "The author <my.sink@my.email>");
    }
    ```
    
    ## Controlled shutdown of live sources in applications
    
    Applications that record from a live source may want to stop recording
    in a controlled way, so that the recording is stopped, but the data
    already in the pipeline is processed to the end (remember that many live
    sources would go on recording forever otherwise). For that to happen the
    application needs to make the source stop recording and send an EOS
    event down the pipeline. The application would then wait for an
    EOS message posted on the pipeline's bus to know when all data has
    been processed and the pipeline can safely be stopped.
    
    An application may send an EOS event to a source element to make it
    perform the EOS logic (send EOS event downstream or post a
    [gst.types.MessageType.SegmentDone] on the bus). This can typically be done
    with the [gst.element.Element.sendEvent] function on the element or its parent bin.
    
    After the EOS has been sent to the element, the application should wait for
    an EOS message to be posted on the pipeline's bus. Once this EOS message is
    received, it may safely shut down the entire pipeline.
*/
class BaseSrc : gst.element.Element
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
    return cast(void function())gst_base_src_get_type != &gidSymbolNotFound ? gst_base_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseSrc self()
  {
    return this;
  }

  /**
      Get `automaticEos` property.
      Returns: See [gstbase.base_src.BaseSrc.setAutomaticEos]
  */
  @property bool automaticEos()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("automatic-eos");
  }

  /**
      Set `automaticEos` property.
      Params:
        propval = See [gstbase.base_src.BaseSrc.setAutomaticEos]
  */
  @property void automaticEos(bool propval)
  {
    return setAutomaticEos(propval);
  }

  /** */
  @property uint blocksize()
  {
    return getBlocksize();
  }

  /** */
  @property void blocksize(uint propval)
  {
    return setBlocksize(propval);
  }

  /** */
  @property bool doTimestamp()
  {
    return getDoTimestamp();
  }

  /** */
  @property void doTimestamp(bool propval)
  {
    return setDoTimestamp(propval);
  }

  /** */
  @property int numBuffers()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("num-buffers");
  }

  /** */
  @property void numBuffers(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("num-buffers", propval);
  }

  /** */
  @property bool typefind()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("typefind");
  }

  /** */
  @property void typefind(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("typefind", propval);
  }

  /**
      Lets #GstBaseSrc sub-classes to know the memory allocator
      used by the base class and its params.
      
      Unref the allocator after usage.
  
      Params:
        allocator = the #GstAllocator
          used
        params = the #GstAllocationParams of allocator
  */
  void getAllocator(out gst.allocator.Allocator allocator, out gst.allocation_params.AllocationParams params)
  {
    GstAllocator* _allocator;
    gst_base_src_get_allocator(cast(GstBaseSrc*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = new gst.allocator.Allocator(cast(void*)_allocator, Yes.Take);
  }

  /**
      Get the number of bytes that src will push out with each buffer.
      Returns: the number of bytes pushed with each buffer.
  */
  uint getBlocksize()
  {
    uint _retval;
    _retval = gst_base_src_get_blocksize(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /** */
  gst.buffer_pool.BufferPool getBufferPool()
  {
    GstBufferPool* _cretval;
    _cretval = gst_base_src_get_buffer_pool(cast(GstBaseSrc*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.buffer_pool.BufferPool)(cast(GstBufferPool*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Query if src timestamps outgoing buffers based on the current running_time.
      Returns: true if the base class will automatically timestamp outgoing buffers.
  */
  bool getDoTimestamp()
  {
    bool _retval;
    _retval = cast(bool)gst_base_src_get_do_timestamp(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the current async behaviour of src. See also [gstbase.base_src.BaseSrc.setAsync].
      Returns: true if src is operating in async mode.
  */
  bool isAsync()
  {
    bool _retval;
    _retval = cast(bool)gst_base_src_is_async(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Check if an element is in live mode.
      Returns: true if element is in live mode.
  */
  bool isLive()
  {
    bool _retval;
    _retval = cast(bool)gst_base_src_is_live(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Negotiates src pad caps with downstream elements.
      Unmarks GST_PAD_FLAG_NEED_RECONFIGURE in any case. But marks it again
      if #GstBaseSrcClass::negotiate fails.
      
      Do not call this in the #GstBaseSrcClass::fill vmethod. Call this in
      #GstBaseSrcClass::create or in #GstBaseSrcClass::alloc, _before_ any
      buffer is allocated.
      Returns: true if the negotiation succeeded, else false.
  */
  bool negotiate()
  {
    bool _retval;
    _retval = cast(bool)gst_base_src_negotiate(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Prepare a new seamless segment for emission downstream. This function must
      only be called by derived sub-classes, and only from the #GstBaseSrcClass::create function,
      as the stream-lock needs to be held.
      
      The format for the new segment will be the current format of the source, as
      configured with [gstbase.base_src.BaseSrc.setFormat]
  
      Params:
        start = The new start value for the segment
        stop = Stop value for the new segment
        time = The new time value for the start of the new segment
      Returns: true if preparation of the seamless segment succeeded.
  
      Deprecated: Use [gstbase.base_src.BaseSrc.newSegment]
  */
  bool newSeamlessSegment(long start, long stop, long time)
  {
    bool _retval;
    _retval = cast(bool)gst_base_src_new_seamless_segment(cast(GstBaseSrc*)this._cPtr, start, stop, time);
    return _retval;
  }

  /**
      Prepare a new segment for emission downstream. This function must
      only be called by derived sub-classes, and only from the #GstBaseSrcClass::create function,
      as the stream-lock needs to be held.
      
      The format for the segment must be identical with the current format
      of the source, as configured with [gstbase.base_src.BaseSrc.setFormat].
      
      The format of src must not be [gst.types.Format.Undefined] and the format
      should be configured via [gstbase.base_src.BaseSrc.setFormat] before calling this method.
  
      Params:
        segment = a pointer to a #GstSegment
      Returns: true if preparation of new segment succeeded.
  */
  bool newSegment(gst.segment.Segment segment)
  {
    bool _retval;
    _retval = cast(bool)gst_base_src_new_segment(cast(GstBaseSrc*)this._cPtr, cast(const(GstSegment)*)&segment);
    return _retval;
  }

  /**
      Send a new segment downstream. This function must
      only be called by derived sub-classes, and only from the #GstBaseSrcClass::create function,
      as the stream-lock needs to be held.
      This method also requires that an out caps has been configured, so
      [gstbase.base_src.BaseSrc.setCaps] needs to have been called before.
      
      The format for the segment must be identical with the current format
      of the source, as configured with [gstbase.base_src.BaseSrc.setFormat].
      
      The format of src must not be [gst.types.Format.Undefined] and the format
      should be configured via [gstbase.base_src.BaseSrc.setFormat] before calling this method.
      
      This is a variant of [gstbase.base_src.BaseSrc.newSegment] sending the segment right away,
      which can be useful to ensure events ordering.
  
      Params:
        segment = a pointer to a #GstSegment
      Returns: true if sending of new segment succeeded.
  */
  bool pushSegment(gst.segment.Segment segment)
  {
    bool _retval;
    _retval = cast(bool)gst_base_src_push_segment(cast(GstBaseSrc*)this._cPtr, cast(const(GstSegment)*)&segment);
    return _retval;
  }

  /**
      Query the source for the latency parameters. live will be true when src is
      configured as a live source. min_latency and max_latency will be set
      to the difference between the running time and the timestamp of the first
      buffer.
      
      This function is mostly used by subclasses.
  
      Params:
        live = if the source is live
        minLatency = the min latency of the source
        maxLatency = the max latency of the source
      Returns: true if the query succeeded.
  */
  bool queryLatency(out bool live, out gst.types.ClockTime minLatency, out gst.types.ClockTime maxLatency)
  {
    bool _retval;
    gboolean _live;
    _retval = cast(bool)gst_base_src_query_latency(cast(GstBaseSrc*)this._cPtr, &_live, cast(GstClockTime*)&minLatency, cast(GstClockTime*)&maxLatency);
    live = cast(bool)_live;
    return _retval;
  }

  /**
      Configure async behaviour in src, no state change will block. The open,
      close, start, stop, play and pause virtual methods will be executed in a
      different thread and are thus allowed to perform blocking operations. Any
      blocking operation should be unblocked with the unlock vmethod.
  
      Params:
        async = new async mode
  */
  void setAsync(bool async)
  {
    gst_base_src_set_async(cast(GstBaseSrc*)this._cPtr, async);
  }

  /**
      If automatic_eos is true, src will automatically go EOS if a buffer
      after the total size is returned. By default this is true but sources
      that can't return an authoritative size and only know that they're EOS
      when trying to read more should set this to false.
      
      When src operates in [gst.types.Format.Time], #GstBaseSrc will send an EOS
      when a buffer outside of the currently configured segment is pushed if
      automatic_eos is true. Since 1.16, if automatic_eos is false an
      EOS will be pushed only when the #GstBaseSrcClass::create implementation
      returns [gst.types.FlowReturn.Eos].
  
      Params:
        automaticEos = automatic eos
  */
  void setAutomaticEos(bool automaticEos)
  {
    gst_base_src_set_automatic_eos(cast(GstBaseSrc*)this._cPtr, automaticEos);
  }

  /**
      Set the number of bytes that src will push out with each buffer. When
      blocksize is set to -1, a default length will be used.
  
      Params:
        blocksize = the new blocksize in bytes
  */
  void setBlocksize(uint blocksize)
  {
    gst_base_src_set_blocksize(cast(GstBaseSrc*)this._cPtr, blocksize);
  }

  /**
      Set new caps on the basesrc source pad.
  
      Params:
        caps = a #GstCaps
      Returns: true if the caps could be set
  */
  bool setCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_base_src_set_caps(cast(GstBaseSrc*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Configure src to automatically timestamp outgoing buffers based on the
      current running_time of the pipeline. This property is mostly useful for live
      sources.
  
      Params:
        timestamp = enable or disable timestamping
  */
  void setDoTimestamp(bool timestamp)
  {
    gst_base_src_set_do_timestamp(cast(GstBaseSrc*)this._cPtr, timestamp);
  }

  /**
      If not dynamic, size is only updated when needed, such as when trying to
      read past current tracked size.  Otherwise, size is checked for upon each
      read.
  
      Params:
        dynamic = new dynamic size mode
  */
  void setDynamicSize(bool dynamic)
  {
    gst_base_src_set_dynamic_size(cast(GstBaseSrc*)this._cPtr, dynamic);
  }

  /**
      Sets the default format of the source. This will be the format used
      for sending SEGMENT events and for performing seeks.
      
      If a format of GST_FORMAT_BYTES is set, the element will be able to
      operate in pull mode if the #GstBaseSrcClass::is_seekable returns true.
      
      This function must only be called in states < [gst.types.State.Paused].
  
      Params:
        format = the format to use
  */
  void setFormat(gst.types.Format format)
  {
    gst_base_src_set_format(cast(GstBaseSrc*)this._cPtr, format);
  }

  /**
      If the element listens to a live source, live should
      be set to true.
      
      A live source will not produce data in the PAUSED state and
      will therefore not be able to participate in the PREROLL phase
      of a pipeline. To signal this fact to the application and the
      pipeline, the state change return value of the live source will
      be GST_STATE_CHANGE_NO_PREROLL.
  
      Params:
        live = new live-mode
  */
  void setLive(bool live)
  {
    gst_base_src_set_live(cast(GstBaseSrc*)this._cPtr, live);
  }

  /**
      Complete an asynchronous start operation. When the subclass overrides the
      start method, it should call [gstbase.base_src.BaseSrc.startComplete] when the start
      operation completes either from the same thread or from an asynchronous
      helper thread.
  
      Params:
        ret = a #GstFlowReturn
  */
  void startComplete(gst.types.FlowReturn ret)
  {
    gst_base_src_start_complete(cast(GstBaseSrc*)this._cPtr, ret);
  }

  /**
      Wait until the start operation completes.
      Returns: a #GstFlowReturn.
  */
  gst.types.FlowReturn startWait()
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_src_start_wait(cast(GstBaseSrc*)this._cPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Subclasses can call this from their create virtual method implementation
      to submit a buffer list to be pushed out later. This is useful in
      cases where the create function wants to produce multiple buffers to be
      pushed out in one go in form of a #GstBufferList, which can reduce overhead
      drastically, especially for packetised inputs (for data streams where
      the packetisation/chunking is not important it is usually more efficient
      to return larger buffers instead).
      
      Subclasses that use this function from their create function must return
      [gst.types.FlowReturn.Ok] and no buffer from their create virtual method implementation.
      If a buffer is returned after a buffer list has also been submitted via this
      function the behaviour is undefined.
      
      Subclasses must only call this function once per create function call and
      subclasses must only call this function when the source operates in push
      mode.
  
      Params:
        bufferList = a #GstBufferList
  */
  void submitBufferList(gst.buffer_list.BufferList bufferList)
  {
    gst_base_src_submit_buffer_list(cast(GstBaseSrc*)this._cPtr, bufferList ? cast(GstBufferList*)bufferList._cPtr(Yes.Dup) : null);
  }

  /**
      If the #GstBaseSrcClass::create method performs its own synchronisation
      against the clock it must unblock when going from PLAYING to the PAUSED state
      and call this method before continuing to produce the remaining data.
      
      This function will block until a state change to PLAYING happens (in which
      case this function returns [gst.types.FlowReturn.Ok]) or the processing must be stopped due
      to a state change to READY or a FLUSH event (in which case this function
      returns [gst.types.FlowReturn.Flushing]).
      Returns: [gst.types.FlowReturn.Ok] if src is PLAYING and processing can
        continue. Any other return value should be returned from the create vmethod.
  */
  gst.types.FlowReturn waitPlaying()
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_src_wait_playing(cast(GstBaseSrc*)this._cPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }
}
