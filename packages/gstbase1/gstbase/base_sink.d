/// Module for [BaseSink] class
module gstbase.base_sink;

import gid.gid;
import gobject.object;
import gst.element;
import gst.mini_object;
import gst.sample;
import gst.structure;
import gst.types;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    #GstBaseSink is the base class for sink elements in GStreamer, such as
    xvimagesink or filesink. It is a layer on top of #GstElement that provides a
    simplified interface to plugin writers. #GstBaseSink handles many details
    for you, for example: preroll, clock synchronization, state changes,
    activation in push or pull mode, and queries.
    
    In most cases, when writing sink elements, there is no need to implement
    class methods from #GstElement or to set functions on pads, because the
    #GstBaseSink infrastructure should be sufficient.
    
    #GstBaseSink provides support for exactly one sink pad, which should be
    named "sink". A sink implementation (subclass of #GstBaseSink) should
    install a pad template in its class_init function, like so:
    ```c
    static void
    my_element_class_init (GstMyElementClass *klass)
    {
      GstElementClass *gstelement_class = GST_ELEMENT_CLASS (klass);
    
      // sinktemplate should be a #GstStaticPadTemplate with direction
      // %GST_PAD_SINK and name "sink"
      gst_element_class_add_static_pad_template (gstelement_class, &sinktemplate);
    
      gst_element_class_set_static_metadata (gstelement_class,
          "Sink name",
          "Sink",
          "My Sink element",
          "The author <my.sink@my.email>");
    }
    ```
    
    #GstBaseSink will handle the prerolling correctly. This means that it will
    return [gst.types.StateChangeReturn.Async] from a state change to PAUSED until the first
    buffer arrives in this element. The base class will call the
    #GstBaseSinkClass::preroll vmethod with this preroll buffer and will then
    commit the state change to the next asynchronously pending state.
    
    When the element is set to PLAYING, #GstBaseSink will synchronise on the
    clock using the times returned from #GstBaseSinkClass::get_times. If this
    function returns [gst.types.CLOCK_TIME_NONE] for the start time, no synchronisation
    will be done. Synchronisation can be disabled entirely by setting the object
    #GstBaseSink:sync property to false.
    
    After synchronisation the virtual method #GstBaseSinkClass::render will be
    called. Subclasses should minimally implement this method.
    
    Subclasses that synchronise on the clock in the #GstBaseSinkClass::render
    method are supported as well. These classes typically receive a buffer in
    the render method and can then potentially block on the clock while
    rendering. A typical example is an audiosink.
    These subclasses can use [gstbase.base_sink.BaseSink.waitPreroll] to perform the
    blocking wait.
    
    Upon receiving the EOS event in the PLAYING state, #GstBaseSink will wait
    for the clock to reach the time indicated by the stop time of the last
    #GstBaseSinkClass::get_times call before posting an EOS message. When the
    element receives EOS in PAUSED, preroll completes, the event is queued and an
    EOS message is posted when going to PLAYING.
    
    #GstBaseSink will internally use the [gst.types.EventType.Segment] events to schedule
    synchronisation and clipping of buffers. Buffers that fall completely outside
    of the current segment are dropped. Buffers that fall partially in the
    segment are rendered (and prerolled). Subclasses should do any subbuffer
    clipping themselves when needed.
    
    #GstBaseSink will by default report the current playback position in
    [gst.types.Format.Time] based on the current clock time and segment information.
    If no clock has been set on the element, the query will be forwarded
    upstream.
    
    The #GstBaseSinkClass::set_caps function will be called when the subclass
    should configure itself to process a specific media type.
    
    The #GstBaseSinkClass::start and #GstBaseSinkClass::stop virtual methods
    will be called when resources should be allocated. Any
    #GstBaseSinkClass::preroll, #GstBaseSinkClass::render and
    #GstBaseSinkClass::set_caps function will be called between the
    #GstBaseSinkClass::start and #GstBaseSinkClass::stop calls.
    
    The #GstBaseSinkClass::event virtual method will be called when an event is
    received by #GstBaseSink. Normally this method should only be overridden by
    very specific elements (such as file sinks) which need to handle the
    newsegment event specially.
    
    The #GstBaseSinkClass::unlock method is called when the elements should
    unblock any blocking operations they perform in the
    #GstBaseSinkClass::render method. This is mostly useful when the
    #GstBaseSinkClass::render method performs a blocking write on a file
    descriptor, for example.
    
    The #GstBaseSink:max-lateness property affects how the sink deals with
    buffers that arrive too late in the sink. A buffer arrives too late in the
    sink when the presentation time (as a combination of the last segment, buffer
    timestamp and element base_time) plus the duration is before the current
    time of the clock.
    If the frame is later than max-lateness, the sink will drop the buffer
    without calling the render method.
    This feature is disabled if sync is disabled, the
    #GstBaseSinkClass::get_times method does not return a valid start time or
    max-lateness is set to -1 (the default).
    Subclasses can use [gstbase.base_sink.BaseSink.setMaxLateness] to configure the
    max-lateness value.
    
    The #GstBaseSink:qos property will enable the quality-of-service features of
    the basesink which gather statistics about the real-time performance of the
    clock synchronisation. For each buffer received in the sink, statistics are
    gathered and a QOS event is sent upstream with these numbers. This
    information can then be used by upstream elements to reduce their processing
    rate, for example.
    
    The #GstBaseSink:async property can be used to instruct the sink to never
    perform an ASYNC state change. This feature is mostly usable when dealing
    with non-synchronized streams or sparse streams.
*/
class BaseSink : gst.element.Element
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
    return cast(void function())gst_base_sink_get_type != &gidSymbolNotFound ? gst_base_sink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseSink self()
  {
    return this;
  }

  /**
      Get `async` property.
      Returns: If set to true, the basesink will perform asynchronous state changes.
        When set to false, the sink will not signal the parent when it prerolls.
        Use this option when dealing with sparse streams or when synchronisation is
        not required.
  */
  @property bool async()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("async");
  }

  /**
      Set `async` property.
      Params:
        propval = If set to true, the basesink will perform asynchronous state changes.
          When set to false, the sink will not signal the parent when it prerolls.
          Use this option when dealing with sparse streams or when synchronisation is
          not required.
  */
  @property void async(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("async", propval);
  }

  /**
      Get `blocksize` property.
      Returns: The amount of bytes to pull when operating in pull mode.
  */
  @property uint blocksize()
  {
    return getBlocksize();
  }

  /**
      Set `blocksize` property.
      Params:
        propval = The amount of bytes to pull when operating in pull mode.
  */
  @property void blocksize(uint propval)
  {
    return setBlocksize(propval);
  }

  /**
      Get `enableLastSample` property.
      Returns: Enable the last-sample property. If false, basesink doesn't keep a
        reference to the last buffer arrived and the last-sample property is always
        set to null. This can be useful if you need buffers to be released as soon
        as possible, eg. if you're using a buffer pool.
  */
  @property bool enableLastSample()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("enable-last-sample");
  }

  /**
      Set `enableLastSample` property.
      Params:
        propval = Enable the last-sample property. If false, basesink doesn't keep a
          reference to the last buffer arrived and the last-sample property is always
          set to null. This can be useful if you need buffers to be released as soon
          as possible, eg. if you're using a buffer pool.
  */
  @property void enableLastSample(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("enable-last-sample", propval);
  }

  /**
      Get `lastSample` property.
      Returns: The last buffer that arrived in the sink and was used for preroll or for
        rendering. This property can be used to generate thumbnails. This property
        can be null when the sink has not yet received a buffer.
  */
  @property gst.sample.Sample lastSample()
  {
    return getLastSample();
  }

  /**
      Get `maxBitrate` property.
      Returns: Control the maximum amount of bits that will be rendered per second.
        Setting this property to a value bigger than 0 will make the sink delay
        rendering of the buffers when it would exceed to max-bitrate.
  */
  @property ulong maxBitrate()
  {
    return getMaxBitrate();
  }

  /**
      Set `maxBitrate` property.
      Params:
        propval = Control the maximum amount of bits that will be rendered per second.
          Setting this property to a value bigger than 0 will make the sink delay
          rendering of the buffers when it would exceed to max-bitrate.
  */
  @property void maxBitrate(ulong propval)
  {
    return setMaxBitrate(propval);
  }

  /** */
  @property long maxLateness()
  {
    return getMaxLateness();
  }

  /** */
  @property void maxLateness(long propval)
  {
    return setMaxLateness(propval);
  }

  /**
      Get `processingDeadline` property.
      Returns: Maximum amount of time (in nanoseconds) that the pipeline can take
        for processing the buffer. This is added to the latency of live
        pipelines.
  */
  @property ulong processingDeadline()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("processing-deadline");
  }

  /**
      Set `processingDeadline` property.
      Params:
        propval = Maximum amount of time (in nanoseconds) that the pipeline can take
          for processing the buffer. This is added to the latency of live
          pipelines.
  */
  @property void processingDeadline(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("processing-deadline", propval);
  }

  /** */
  @property bool qos()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("qos");
  }

  /** */
  @property void qos(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("qos", propval);
  }

  /**
      Get `renderDelay` property.
      Returns: The additional delay between synchronisation and actual rendering of the
        media. This property will add additional latency to the device in order to
        make other sinks compensate for the delay.
  */
  @property ulong renderDelay()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("render-delay");
  }

  /**
      Set `renderDelay` property.
      Params:
        propval = The additional delay between synchronisation and actual rendering of the
          media. This property will add additional latency to the device in order to
          make other sinks compensate for the delay.
  */
  @property void renderDelay(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("render-delay", propval);
  }

  /**
      Get `stats` property.
      Returns: Various #GstBaseSink statistics. This property returns a #GstStructure
        with name `application/x-gst-base-sink-stats` with the following fields:
        
        $(LIST
          * "average-rate"  G_TYPE_DOUBLE   average frame rate
          * "dropped" G_TYPE_UINT64   Number of dropped frames
          * "rendered" G_TYPE_UINT64   Number of rendered frames
        )
  */
  @property gst.structure.Structure stats()
  {
    return getStats();
  }

  /** */
  @property bool sync()
  {
    return getSync();
  }

  /** */
  @property void sync(bool propval)
  {
    return setSync(propval);
  }

  /**
      Get `throttleTime` property.
      Returns: The time to insert between buffers. This property can be used to control
        the maximum amount of buffers per second to render. Setting this property
        to a value bigger than 0 will make the sink create THROTTLE QoS events.
  */
  @property ulong throttleTime()
  {
    return getThrottleTime();
  }

  /**
      Set `throttleTime` property.
      Params:
        propval = The time to insert between buffers. This property can be used to control
          the maximum amount of buffers per second to render. Setting this property
          to a value bigger than 0 will make the sink create THROTTLE QoS events.
  */
  @property void throttleTime(ulong propval)
  {
    return setThrottleTime(propval);
  }

  /**
      Get `tsOffset` property.
      Returns: Controls the final synchronisation, a negative value will render the buffer
        earlier while a positive value delays playback. This property can be
        used to fix synchronisation in bad files.
  */
  @property long tsOffset()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("ts-offset");
  }

  /**
      Set `tsOffset` property.
      Params:
        propval = Controls the final synchronisation, a negative value will render the buffer
          earlier while a positive value delays playback. This property can be
          used to fix synchronisation in bad files.
  */
  @property void tsOffset(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("ts-offset", propval);
  }

  /**
      If the sink spawns its own thread for pulling buffers from upstream it
      should call this method after it has pulled a buffer. If the element needed
      to preroll, this function will perform the preroll and will then block
      until the element state is changed.
      
      This function should be called with the PREROLL_LOCK held.
  
      Params:
        obj = the mini object that caused the preroll
      Returns: [gst.types.FlowReturn.Ok] if the preroll completed and processing can
        continue. Any other return value should be returned from the render vmethod.
  */
  gst.types.FlowReturn doPreroll(gst.mini_object.MiniObject obj)
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_sink_do_preroll(cast(GstBaseSink*)this._cPtr, obj ? cast(GstMiniObject*)obj._cPtr(No.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Get the number of bytes that the sink will pull when it is operating in pull
      mode.
      Returns: the number of bytes sink will pull in pull mode.
  */
  uint getBlocksize()
  {
    uint _retval;
    _retval = gst_base_sink_get_blocksize(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Checks if sink is currently configured to drop buffers which are outside
      the current segment
      Returns: true if the sink is configured to drop buffers outside the
        current segment.
  */
  bool getDropOutOfSegment()
  {
    bool _retval;
    _retval = cast(bool)gst_base_sink_get_drop_out_of_segment(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the last sample that arrived in the sink and was used for preroll or for
      rendering. This property can be used to generate thumbnails.
      
      The #GstCaps on the sample can be used to determine the type of the buffer.
      
      Free-function: gst_sample_unref
      Returns: a #GstSample. gst_sample_unref() after
            usage.  This function returns null when no buffer has arrived in the
            sink yet or when the sink is not in PAUSED or PLAYING.
  */
  gst.sample.Sample getLastSample()
  {
    GstSample* _cretval;
    _cretval = gst_base_sink_get_last_sample(cast(GstBaseSink*)this._cPtr);
    auto _retval = _cretval ? new gst.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the currently configured latency.
      Returns: The configured latency.
  */
  gst.types.ClockTime getLatency()
  {
    gst.types.ClockTime _retval;
    _retval = gst_base_sink_get_latency(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the maximum amount of bits per second that the sink will render.
      Returns: the maximum number of bits per second sink will render.
  */
  ulong getMaxBitrate()
  {
    ulong _retval;
    _retval = gst_base_sink_get_max_bitrate(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Gets the max lateness value. See [gstbase.base_sink.BaseSink.setMaxLateness] for
      more details.
      Returns: The maximum time in nanoseconds that a buffer can be late
        before it is dropped and not rendered. A value of -1 means an
        unlimited time.
  */
  long getMaxLateness()
  {
    long _retval;
    _retval = gst_base_sink_get_max_lateness(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the processing deadline of sink. see
      [gstbase.base_sink.BaseSink.setProcessingDeadline] for more information about
      the processing deadline.
      Returns: the processing deadline
  */
  gst.types.ClockTime getProcessingDeadline()
  {
    gst.types.ClockTime _retval;
    _retval = gst_base_sink_get_processing_deadline(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the render delay of sink. see [gstbase.base_sink.BaseSink.setRenderDelay] for more
      information about the render delay.
      Returns: the render delay of sink.
  */
  gst.types.ClockTime getRenderDelay()
  {
    gst.types.ClockTime _retval;
    _retval = gst_base_sink_get_render_delay(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Return various #GstBaseSink statistics. This function returns a #GstStructure
      with name `application/x-gst-base-sink-stats` with the following fields:
      
      $(LIST
        * "average-rate" G_TYPE_DOUBLE   average frame rate
        * "dropped" G_TYPE_UINT64   Number of dropped frames
        * "rendered" G_TYPE_UINT64   Number of rendered frames
      )
      Returns: pointer to #GstStructure
  */
  gst.structure.Structure getStats()
  {
    GstStructure* _cretval;
    _cretval = gst_base_sink_get_stats(cast(GstBaseSink*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if sink is currently configured to synchronize against the
      clock.
      Returns: true if the sink is configured to synchronize against the clock.
  */
  bool getSync()
  {
    bool _retval;
    _retval = cast(bool)gst_base_sink_get_sync(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the time that will be inserted between frames to control the
      maximum buffers per second.
      Returns: the number of nanoseconds sink will put between frames.
  */
  ulong getThrottleTime()
  {
    ulong _retval;
    _retval = gst_base_sink_get_throttle_time(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the synchronisation offset of sink.
      Returns: The synchronisation offset.
  */
  gst.types.ClockTimeDiff getTsOffset()
  {
    gst.types.ClockTimeDiff _retval;
    _retval = gst_base_sink_get_ts_offset(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Checks if sink is currently configured to perform asynchronous state
      changes to PAUSED.
      Returns: true if the sink is configured to perform asynchronous state
        changes.
  */
  bool isAsyncEnabled()
  {
    bool _retval;
    _retval = cast(bool)gst_base_sink_is_async_enabled(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Checks if sink is currently configured to store the last received sample in
      the last-sample property.
      Returns: true if the sink is configured to store the last received sample.
  */
  bool isLastSampleEnabled()
  {
    bool _retval;
    _retval = cast(bool)gst_base_sink_is_last_sample_enabled(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Checks if sink is currently configured to send Quality-of-Service events
      upstream.
      Returns: true if the sink is configured to perform Quality-of-Service.
  */
  bool isQosEnabled()
  {
    bool _retval;
    _retval = cast(bool)gst_base_sink_is_qos_enabled(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Query the sink for the latency parameters. The latency will be queried from
      the upstream elements. live will be true if sink is configured to
      synchronize against the clock. upstream_live will be true if an upstream
      element is live.
      
      If both live and upstream_live are true, the sink will want to compensate
      for the latency introduced by the upstream elements by setting the
      min_latency to a strictly positive value.
      
      This function is mostly used by subclasses.
  
      Params:
        live = if the sink is live
        upstreamLive = if an upstream element is live
        minLatency = the min latency of the upstream elements
        maxLatency = the max latency of the upstream elements
      Returns: true if the query succeeded.
  */
  bool queryLatency(out bool live, out bool upstreamLive, out gst.types.ClockTime minLatency, out gst.types.ClockTime maxLatency)
  {
    bool _retval;
    gboolean _live;
    gboolean _upstreamLive;
    _retval = cast(bool)gst_base_sink_query_latency(cast(GstBaseSink*)this._cPtr, &_live, &_upstreamLive, cast(GstClockTime*)&minLatency, cast(GstClockTime*)&maxLatency);
    live = cast(bool)_live;
    upstreamLive = cast(bool)_upstreamLive;
    return _retval;
  }

  /**
      Configures sink to perform all state changes asynchronously. When async is
      disabled, the sink will immediately go to PAUSED instead of waiting for a
      preroll buffer. This feature is useful if the sink does not synchronize
      against the clock or when it is dealing with sparse streams.
  
      Params:
        enabled = the new async value.
  */
  void setAsyncEnabled(bool enabled)
  {
    gst_base_sink_set_async_enabled(cast(GstBaseSink*)this._cPtr, enabled);
  }

  /**
      Set the number of bytes that the sink will pull when it is operating in pull
      mode.
  
      Params:
        blocksize = the blocksize in bytes
  */
  void setBlocksize(uint blocksize)
  {
    gst_base_sink_set_blocksize(cast(GstBaseSink*)this._cPtr, blocksize);
  }

  /**
      Configure sink to drop buffers which are outside the current segment
  
      Params:
        dropOutOfSegment = drop buffers outside the segment
  */
  void setDropOutOfSegment(bool dropOutOfSegment)
  {
    gst_base_sink_set_drop_out_of_segment(cast(GstBaseSink*)this._cPtr, dropOutOfSegment);
  }

  /**
      Configures sink to store the last received sample in the last-sample
      property.
  
      Params:
        enabled = the new enable-last-sample value.
  */
  void setLastSampleEnabled(bool enabled)
  {
    gst_base_sink_set_last_sample_enabled(cast(GstBaseSink*)this._cPtr, enabled);
  }

  /**
      Set the maximum amount of bits per second that the sink will render.
  
      Params:
        maxBitrate = the max_bitrate in bits per second
  */
  void setMaxBitrate(ulong maxBitrate)
  {
    gst_base_sink_set_max_bitrate(cast(GstBaseSink*)this._cPtr, maxBitrate);
  }

  /**
      Sets the new max lateness value to max_lateness. This value is
      used to decide if a buffer should be dropped or not based on the
      buffer timestamp and the current clock time. A value of -1 means
      an unlimited time.
  
      Params:
        maxLateness = the new max lateness value.
  */
  void setMaxLateness(long maxLateness)
  {
    gst_base_sink_set_max_lateness(cast(GstBaseSink*)this._cPtr, maxLateness);
  }

  /**
      Maximum amount of time (in nanoseconds) that the pipeline can take
      for processing the buffer. This is added to the latency of live
      pipelines.
      
      This function is usually called by subclasses.
  
      Params:
        processingDeadline = the new processing deadline in nanoseconds.
  */
  void setProcessingDeadline(gst.types.ClockTime processingDeadline)
  {
    gst_base_sink_set_processing_deadline(cast(GstBaseSink*)this._cPtr, processingDeadline);
  }

  /**
      Configures sink to send Quality-of-Service events upstream.
  
      Params:
        enabled = the new qos value.
  */
  void setQosEnabled(bool enabled)
  {
    gst_base_sink_set_qos_enabled(cast(GstBaseSink*)this._cPtr, enabled);
  }

  /**
      Set the render delay in sink to delay. The render delay is the time
      between actual rendering of a buffer and its synchronisation time. Some
      devices might delay media rendering which can be compensated for with this
      function.
      
      After calling this function, this sink will report additional latency and
      other sinks will adjust their latency to delay the rendering of their media.
      
      This function is usually called by subclasses.
  
      Params:
        delay = the new delay
  */
  void setRenderDelay(gst.types.ClockTime delay)
  {
    gst_base_sink_set_render_delay(cast(GstBaseSink*)this._cPtr, delay);
  }

  /**
      Configures sink to synchronize on the clock or not. When
      sync is false, incoming samples will be played as fast as
      possible. If sync is true, the timestamps of the incoming
      buffers will be used to schedule the exact render time of its
      contents.
  
      Params:
        sync = the new sync value.
  */
  void setSync(bool sync)
  {
    gst_base_sink_set_sync(cast(GstBaseSink*)this._cPtr, sync);
  }

  /**
      Set the time that will be inserted between rendered buffers. This
      can be used to control the maximum buffers per second that the sink
      will render.
  
      Params:
        throttle = the throttle time in nanoseconds
  */
  void setThrottleTime(ulong throttle)
  {
    gst_base_sink_set_throttle_time(cast(GstBaseSink*)this._cPtr, throttle);
  }

  /**
      Adjust the synchronisation of sink with offset. A negative value will
      render buffers earlier than their timestamp. A positive value will delay
      rendering. This function can be used to fix playback of badly timestamped
      buffers.
  
      Params:
        offset = the new offset
  */
  void setTsOffset(gst.types.ClockTimeDiff offset)
  {
    gst_base_sink_set_ts_offset(cast(GstBaseSink*)this._cPtr, offset);
  }

  /**
      This function will wait for preroll to complete and will then block until time
      is reached. It is usually called by subclasses that use their own internal
      synchronisation but want to let some synchronization (like EOS) be handled
      by the base class.
      
      This function should only be called with the PREROLL_LOCK held (like when
      receiving an EOS event in the ::event vmethod or when handling buffers in
      ::render).
      
      The time argument should be the running_time of when the timeout should happen
      and will be adjusted with any latency and offset configured in the sink.
  
      Params:
        time = the running_time to be reached
        jitter = the jitter to be filled with time diff, or null
      Returns: #GstFlowReturn
  */
  gst.types.FlowReturn wait(gst.types.ClockTime time, out gst.types.ClockTimeDiff jitter)
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_sink_wait(cast(GstBaseSink*)this._cPtr, time, cast(GstClockTimeDiff*)&jitter);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      This function will block until time is reached. It is usually called by
      subclasses that use their own internal synchronisation.
      
      If time is not valid, no synchronisation is done and [gst.types.ClockReturn.Badtime] is
      returned. Likewise, if synchronisation is disabled in the element or there
      is no clock, no synchronisation is done and [gst.types.ClockReturn.Badtime] is returned.
      
      This function should only be called with the PREROLL_LOCK held, like when
      receiving an EOS event in the #GstBaseSinkClass::event vmethod or when
      receiving a buffer in
      the #GstBaseSinkClass::render vmethod.
      
      The time argument should be the running_time of when this method should
      return and is not adjusted with any latency or offset configured in the
      sink.
  
      Params:
        time = the running_time to be reached
        jitter = the jitter to be filled with time diff, or null
      Returns: #GstClockReturn
  */
  gst.types.ClockReturn waitClock(gst.types.ClockTime time, out gst.types.ClockTimeDiff jitter)
  {
    GstClockReturn _cretval;
    _cretval = gst_base_sink_wait_clock(cast(GstBaseSink*)this._cPtr, time, cast(GstClockTimeDiff*)&jitter);
    gst.types.ClockReturn _retval = cast(gst.types.ClockReturn)_cretval;
    return _retval;
  }

  /**
      If the #GstBaseSinkClass::render method performs its own synchronisation
      against the clock it must unblock when going from PLAYING to the PAUSED state
      and call this method before continuing to render the remaining data.
      
      If the #GstBaseSinkClass::render method can block on something else than
      the clock, it must also be ready to unblock immediately on
      the #GstBaseSinkClass::unlock method and cause the
      #GstBaseSinkClass::render method to immediately call this function.
      In this case, the subclass must be prepared to continue rendering where it
      left off if this function returns [gst.types.FlowReturn.Ok].
      
      This function will block until a state change to PLAYING happens (in which
      case this function returns [gst.types.FlowReturn.Ok]) or the processing must be stopped due
      to a state change to READY or a FLUSH event (in which case this function
      returns [gst.types.FlowReturn.Flushing]).
      
      This function should only be called with the PREROLL_LOCK held, like in the
      render function.
      Returns: [gst.types.FlowReturn.Ok] if the preroll completed and processing can
        continue. Any other return value should be returned from the render vmethod.
  */
  gst.types.FlowReturn waitPreroll()
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_sink_wait_preroll(cast(GstBaseSink*)this._cPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }
}
