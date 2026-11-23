/// Module for [BaseSink] class
module gid.gstbase1.base_sink;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.buffer_list;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.event;
import gid.gst1.mini_object;
import gid.gst1.query;
import gid.gst1.sample;
import gid.gst1.structure;
import gid.gst1.types;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

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
    return [gid.gst1.types.StateChangeReturn.Async] from a state change to PAUSED until the first
    buffer arrives in this element. The base class will call the
    #GstBaseSinkClass::preroll vmethod with this preroll buffer and will then
    commit the state change to the next asynchronously pending state.
    
    When the element is set to PLAYING, #GstBaseSink will synchronise on the
    clock using the times returned from #GstBaseSinkClass::get_times. If this
    function returns [gid.gst1.types.CLOCK_TIME_NONE] for the start time, no synchronisation
    will be done. Synchronisation can be disabled entirely by setting the object
    #GstBaseSink:sync property to false.
    
    After synchronisation the virtual method #GstBaseSinkClass::render will be
    called. Subclasses should minimally implement this method.
    
    Subclasses that synchronise on the clock in the #GstBaseSinkClass::render
    method are supported as well. These classes typically receive a buffer in
    the render method and can then potentially block on the clock while
    rendering. A typical example is an audiosink.
    These subclasses can use [gid.gstbase1.base_sink.BaseSink.waitPreroll] to perform the
    blocking wait.
    
    Upon receiving the EOS event in the PLAYING state, #GstBaseSink will wait
    for the clock to reach the time indicated by the stop time of the last
    #GstBaseSinkClass::get_times call before posting an EOS message. When the
    element receives EOS in PAUSED, preroll completes, the event is queued and an
    EOS message is posted when going to PLAYING.
    
    #GstBaseSink will internally use the [gid.gst1.types.EventType.Segment] events to schedule
    synchronisation and clipping of buffers. Buffers that fall completely outside
    of the current segment are dropped. Buffers that fall partially in the
    segment are rendered (and prerolled). Subclasses should do any subbuffer
    clipping themselves when needed.
    
    #GstBaseSink will by default report the current playback position in
    [gid.gst1.types.Format.Time] based on the current clock time and segment information.
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
    Subclasses can use [gid.gstbase1.base_sink.BaseSink.setMaxLateness] to configure the
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
class BaseSink : gid.gst1.element.Element
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_base_sink_get_type != &gidSymbolNotFound ? gst_base_sink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstBaseSink";
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseSink self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.base_sink.BaseSink]
      Returns: New builder object
  */
  static BaseSinkGidBuilder builder() nothrow
  {
    return new BaseSinkGidBuilder;
  }

  /**
      Get `async` property.
      Returns: If set to true, the basesink will perform asynchronous state changes.
        When set to false, the sink will not signal the parent when it prerolls.
        Use this option when dealing with sparse streams or when synchronisation is
        not required.
  */
  @property bool async() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("async");
  }

  /**
      Set `async` property.
      Params:
        propval = If set to true, the basesink will perform asynchronous state changes.
          When set to false, the sink will not signal the parent when it prerolls.
          Use this option when dealing with sparse streams or when synchronisation is
          not required.
  */
  @property void async(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("async", propval);
  }

  /**
      Get `blocksize` property.
      Returns: The amount of bytes to pull when operating in pull mode.
  */
  @property uint blocksize() nothrow
  {
    return getBlocksize();
  }

  /**
      Set `blocksize` property.
      Params:
        propval = The amount of bytes to pull when operating in pull mode.
  */
  @property void blocksize(uint propval) nothrow
  {
    setBlocksize(propval);
  }

  /**
      Get `enableLastSample` property.
      Returns: Enable the last-sample property. If false, basesink doesn't keep a
        reference to the last buffer arrived and the last-sample property is always
        set to null. This can be useful if you need buffers to be released as soon
        as possible, eg. if you're using a buffer pool.
  */
  @property bool enableLastSample() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("enable-last-sample");
  }

  /**
      Set `enableLastSample` property.
      Params:
        propval = Enable the last-sample property. If false, basesink doesn't keep a
          reference to the last buffer arrived and the last-sample property is always
          set to null. This can be useful if you need buffers to be released as soon
          as possible, eg. if you're using a buffer pool.
  */
  @property void enableLastSample(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("enable-last-sample", propval);
  }

  /**
      Get `lastSample` property.
      Returns: The last buffer that arrived in the sink and was used for preroll or for
        rendering. This property can be used to generate thumbnails. This property
        can be null when the sink has not yet received a buffer.
  */
  @property gid.gst1.sample.Sample lastSample() nothrow
  {
    return getLastSample();
  }

  /**
      Get `maxBitrate` property.
      Returns: Control the maximum amount of bits that will be rendered per second.
        Setting this property to a value bigger than 0 will make the sink delay
        rendering of the buffers when it would exceed to max-bitrate.
  */
  @property ulong maxBitrate() nothrow
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
  @property void maxBitrate(ulong propval) nothrow
  {
    setMaxBitrate(propval);
  }

  /** */
  @property long maxLateness() nothrow
  {
    return getMaxLateness();
  }

  /** */
  @property void maxLateness(long propval) nothrow
  {
    setMaxLateness(propval);
  }

  /**
      Get `processingDeadline` property.
      Returns: Maximum amount of time (in nanoseconds) that the pipeline can take
        for processing the buffer. This is added to the latency of live
        pipelines.
  */
  @property ulong processingDeadline() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("processing-deadline");
  }

  /**
      Set `processingDeadline` property.
      Params:
        propval = Maximum amount of time (in nanoseconds) that the pipeline can take
          for processing the buffer. This is added to the latency of live
          pipelines.
  */
  @property void processingDeadline(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("processing-deadline", propval);
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

  /**
      Get `renderDelay` property.
      Returns: The additional delay between synchronisation and actual rendering of the
        media. This property will add additional latency to the device in order to
        make other sinks compensate for the delay.
  */
  @property ulong renderDelay() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("render-delay");
  }

  /**
      Set `renderDelay` property.
      Params:
        propval = The additional delay between synchronisation and actual rendering of the
          media. This property will add additional latency to the device in order to
          make other sinks compensate for the delay.
  */
  @property void renderDelay(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("render-delay", propval);
  }

  /**
      Get `stats` property.
      Returns: Various #GstBaseSink statistics. This property returns a #GstStructure
        with name `application/x-gst-base-sink-stats` with the following fields:
        
        - "average-rate"  G_TYPE_DOUBLE   average frame rate
        - "dropped" G_TYPE_UINT64   Number of dropped frames
        - "rendered" G_TYPE_UINT64   Number of rendered frames
  */
  @property gid.gst1.structure.Structure stats() nothrow
  {
    return getStats();
  }

  /** */
  @property bool sync() nothrow
  {
    return getSync();
  }

  /** */
  @property void sync(bool propval) nothrow
  {
    setSync(propval);
  }

  /**
      Get `throttleTime` property.
      Returns: The time to insert between buffers. This property can be used to control
        the maximum amount of buffers per second to render. Setting this property
        to a value bigger than 0 will make the sink create THROTTLE QoS events.
  */
  @property ulong throttleTime() nothrow
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
  @property void throttleTime(ulong propval) nothrow
  {
    setThrottleTime(propval);
  }

  /**
      Get `tsOffset` property.
      Returns: Controls the final synchronisation, a negative value will render the buffer
        earlier while a positive value delays playback. This property can be
        used to fix synchronisation in bad files.
  */
  @property long tsOffset() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("ts-offset");
  }

  /**
      Set `tsOffset` property.
      Params:
        propval = Controls the final synchronisation, a negative value will render the buffer
          earlier while a positive value delays playback. This property can be
          used to fix synchronisation in bad files.
  */
  @property void tsOffset(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("ts-offset", propval);
  }

  /**
      Subclasses should override this when they can provide an
          alternate method of spawning a thread to drive the pipeline in pull mode.
          Should start or stop the pulling thread, depending on the value of the
          "active" argument. Called after actually activating the sink pad in pull
          mode. The default implementation starts a task on the sink pad.
  
      Params:
        active = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivatePull` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncActivatePull(bool active)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.activatePull)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.activatePull(cast(GstBaseSink*)this._cPtr, active);
    return _retval;
  }

  /**
      Override this to handle events arriving on the sink pad
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.event)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.event(cast(GstBaseSink*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Only useful in pull mode. Implement if you have
          ideas about what should be the default values for the caps you support.
  
      Params:
        caps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFixate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncFixate(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.fixate)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.fixate(cast(GstBaseSink*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Called to get sink pad caps from the subclass.
  
      Params:
        filter =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncGetCaps(gid.gst1.caps.Caps filter = null)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.getCaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.getCaps(cast(GstBaseSink*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the start and end times for syncing on this buffer.
  
      Params:
        buffer =  (modified in place, changes are seen by the caller)
        start = the start #GstClockTime
        end = the end #GstClockTime
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetTimes` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncGetTimes(gid.gst1.buffer.Buffer buffer, out gid.gst1.types.ClockTime start, out gid.gst1.types.ClockTime end)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.getTimes)
      return;

    _klass.getTimes(cast(GstBaseSink*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, cast(GstClockTime*)&start, cast(GstClockTime*)&end);
  }

  /**
      Called to prepare the buffer for render and preroll. This
          function is called before synchronisation is performed.
  
      Params:
        buffer =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrepare` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncPrepare(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.prepare)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.prepare(cast(GstBaseSink*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Called to prepare the buffer list for render_list. This
          function is called before synchronisation is performed.
  
      Params:
        bufferList =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrepareList` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncPrepareList(gid.gst1.buffer_list.BufferList bufferList)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.prepareList)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.prepareList(cast(GstBaseSink*)this._cPtr, bufferList ? cast(GstBufferList*)bufferList._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Called to present the preroll buffer if desired.
  
      Params:
        buffer =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPreroll` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncPreroll(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.preroll)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.preroll(cast(GstBaseSink*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      configure the allocation query
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncProposeAllocation` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncProposeAllocation(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.proposeAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.proposeAllocation(cast(GstBaseSink*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      perform a #GstQuery on the element.
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  override protected bool vfuncQuery(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.query)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.query(cast(GstBaseSink*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Called when a buffer should be presented or output, at the
          correct moment if the #GstBaseSink has been set to sync to the clock.
  
      Params:
        buffer =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRender` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncRender(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.render)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.render(cast(GstBaseSink*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Same as render but used with buffer lists instead of
          buffers.
  
      Params:
        bufferList =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderList` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncRenderList(gid.gst1.buffer_list.BufferList bufferList)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.renderList)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.renderList(cast(GstBaseSink*)this._cPtr, bufferList ? cast(GstBufferList*)bufferList._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Notify subclass of changed caps
  
      Params:
        caps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSetCaps(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.setCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCaps(cast(GstBaseSink*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Start processing. Ideal for opening resources in the subclass
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncStart()
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Stop processing. Subclasses should use this to close resources.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncStop()
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Unlock any pending access to the resource. Subclasses should
          unblock any blocked function ASAP and call [gid.gstbase1.base_sink.BaseSink.waitPreroll]
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnlock` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncUnlock()
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.unlock)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.unlock(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Clear the previous unlock request. Subclasses should clear
          any state they set during #GstBaseSinkClass::unlock, and be ready to
          continue where they left off after [gid.gstbase1.base_sink.BaseSink.waitPreroll],
          [gid.gstbase1.base_sink.BaseSink.wait] or gst_wait_sink_wait_clock() return or
          #GstBaseSinkClass::render is called again.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnlockStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncUnlockStop()
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.unlockStop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.unlockStop(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Override this to implement custom logic to wait for the event
          time (for events like EOS and GAP). Subclasses should always first
          chain up to the default implementation.
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWaitEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncWaitEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstBaseSinkClass*)_vfuncClass;
    if (!_klass.waitEvent)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.waitEvent(cast(GstBaseSink*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      If the sink spawns its own thread for pulling buffers from upstream it
      should call this method after it has pulled a buffer. If the element needed
      to preroll, this function will perform the preroll and will then block
      until the element state is changed.
      
      This function should be called with the PREROLL_LOCK held.
  
      Params:
        obj = the mini object that caused the preroll
      Returns: [gid.gst1.types.FlowReturn.Ok] if the preroll completed and processing can
        continue. Any other return value should be returned from the render vmethod.
  */
  gid.gst1.types.FlowReturn doPreroll(gid.gst1.mini_object.MiniObject obj) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_sink_do_preroll(cast(GstBaseSink*)this._cPtr, obj ? cast(GstMiniObject*)obj._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Get the number of bytes that the sink will pull when it is operating in pull
      mode.
      Returns: the number of bytes sink will pull in pull mode.
  */
  uint getBlocksize() nothrow
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
  bool getDropOutOfSegment() nothrow
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
      Returns: a #GstSample. [gid.gst1.sample.Sample.unref] after
            usage.  This function returns null when no buffer has arrived in the
            sink yet or when the sink is not in PAUSED or PLAYING.
  */
  gid.gst1.sample.Sample getLastSample() nothrow
  {
    GstSample* _cretval;
    _cretval = gst_base_sink_get_last_sample(cast(GstBaseSink*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the currently configured latency.
      Returns: The configured latency.
  */
  gid.gst1.types.ClockTime getLatency() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_base_sink_get_latency(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the maximum amount of bits per second that the sink will render.
      Returns: the maximum number of bits per second sink will render.
  */
  ulong getMaxBitrate() nothrow
  {
    ulong _retval;
    _retval = gst_base_sink_get_max_bitrate(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Gets the max lateness value. See [gid.gstbase1.base_sink.BaseSink.setMaxLateness] for
      more details.
      Returns: The maximum time in nanoseconds that a buffer can be late
        before it is dropped and not rendered. A value of -1 means an
        unlimited time.
  */
  long getMaxLateness() nothrow
  {
    long _retval;
    _retval = gst_base_sink_get_max_lateness(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the processing deadline of sink. see
      [gid.gstbase1.base_sink.BaseSink.setProcessingDeadline] for more information about
      the processing deadline.
      Returns: the processing deadline
  */
  gid.gst1.types.ClockTime getProcessingDeadline() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_base_sink_get_processing_deadline(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the render delay of sink. see [gid.gstbase1.base_sink.BaseSink.setRenderDelay] for more
      information about the render delay.
      Returns: the render delay of sink.
  */
  gid.gst1.types.ClockTime getRenderDelay() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_base_sink_get_render_delay(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Return various #GstBaseSink statistics. This function returns a #GstStructure
      with name `application/x-gst-base-sink-stats` with the following fields:
      
      - "average-rate" G_TYPE_DOUBLE   average frame rate
      - "dropped" G_TYPE_UINT64   Number of dropped frames
      - "rendered" G_TYPE_UINT64   Number of rendered frames
      Returns: pointer to #GstStructure
  */
  gid.gst1.structure.Structure getStats() nothrow
  {
    GstStructure* _cretval;
    _cretval = gst_base_sink_get_stats(cast(GstBaseSink*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if sink is currently configured to synchronize against the
      clock.
      Returns: true if the sink is configured to synchronize against the clock.
  */
  bool getSync() nothrow
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
  ulong getThrottleTime() nothrow
  {
    ulong _retval;
    _retval = gst_base_sink_get_throttle_time(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the synchronisation offset of sink.
      Returns: The synchronisation offset.
  */
  gid.gst1.types.ClockTimeDiff getTsOffset() nothrow
  {
    gid.gst1.types.ClockTimeDiff _retval;
    _retval = gst_base_sink_get_ts_offset(cast(GstBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Checks if sink is currently configured to perform asynchronous state
      changes to PAUSED.
      Returns: true if the sink is configured to perform asynchronous state
        changes.
  */
  bool isAsyncEnabled() nothrow
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
  bool isLastSampleEnabled() nothrow
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
  bool isQosEnabled() nothrow
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
  bool queryLatency(out bool live, out bool upstreamLive, out gid.gst1.types.ClockTime minLatency, out gid.gst1.types.ClockTime maxLatency) nothrow
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
  void setAsyncEnabled(bool enabled) nothrow
  {
    gst_base_sink_set_async_enabled(cast(GstBaseSink*)this._cPtr, enabled);
  }

  /**
      Set the number of bytes that the sink will pull when it is operating in pull
      mode.
  
      Params:
        blocksize = the blocksize in bytes
  */
  void setBlocksize(uint blocksize) nothrow
  {
    gst_base_sink_set_blocksize(cast(GstBaseSink*)this._cPtr, blocksize);
  }

  /**
      Configure sink to drop buffers which are outside the current segment
  
      Params:
        dropOutOfSegment = drop buffers outside the segment
  */
  void setDropOutOfSegment(bool dropOutOfSegment) nothrow
  {
    gst_base_sink_set_drop_out_of_segment(cast(GstBaseSink*)this._cPtr, dropOutOfSegment);
  }

  /**
      Configures sink to store the last received sample in the last-sample
      property.
  
      Params:
        enabled = the new enable-last-sample value.
  */
  void setLastSampleEnabled(bool enabled) nothrow
  {
    gst_base_sink_set_last_sample_enabled(cast(GstBaseSink*)this._cPtr, enabled);
  }

  /**
      Set the maximum amount of bits per second that the sink will render.
  
      Params:
        maxBitrate = the max_bitrate in bits per second
  */
  void setMaxBitrate(ulong maxBitrate) nothrow
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
  void setMaxLateness(long maxLateness) nothrow
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
  void setProcessingDeadline(gid.gst1.types.ClockTime processingDeadline) nothrow
  {
    gst_base_sink_set_processing_deadline(cast(GstBaseSink*)this._cPtr, processingDeadline);
  }

  /**
      Configures sink to send Quality-of-Service events upstream.
  
      Params:
        enabled = the new qos value.
  */
  void setQosEnabled(bool enabled) nothrow
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
  void setRenderDelay(gid.gst1.types.ClockTime delay) nothrow
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
  void setSync(bool sync) nothrow
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
  void setThrottleTime(ulong throttle) nothrow
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
  void setTsOffset(gid.gst1.types.ClockTimeDiff offset) nothrow
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
  gid.gst1.types.FlowReturn wait(gid.gst1.types.ClockTime time, out gid.gst1.types.ClockTimeDiff jitter) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_sink_wait(cast(GstBaseSink*)this._cPtr, time, cast(GstClockTimeDiff*)&jitter);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      This function will block until time is reached. It is usually called by
      subclasses that use their own internal synchronisation.
      
      If time is not valid, no synchronisation is done and [gid.gst1.types.ClockReturn.Badtime] is
      returned. Likewise, if synchronisation is disabled in the element or there
      is no clock, no synchronisation is done and [gid.gst1.types.ClockReturn.Badtime] is returned.
      
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
  gid.gst1.types.ClockReturn waitClock(gid.gst1.types.ClockTime time, out gid.gst1.types.ClockTimeDiff jitter) nothrow
  {
    GstClockReturn _cretval;
    _cretval = gst_base_sink_wait_clock(cast(GstBaseSink*)this._cPtr, time, cast(GstClockTimeDiff*)&jitter);
    gid.gst1.types.ClockReturn _retval = cast(gid.gst1.types.ClockReturn)_cretval;
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
      left off if this function returns [gid.gst1.types.FlowReturn.Ok].
      
      This function will block until a state change to PLAYING happens (in which
      case this function returns [gid.gst1.types.FlowReturn.Ok]) or the processing must be stopped due
      to a state change to READY or a FLUSH event (in which case this function
      returns [gid.gst1.types.FlowReturn.Flushing]).
      
      This function should only be called with the PREROLL_LOCK held, like in the
      render function.
      Returns: [gid.gst1.types.FlowReturn.Ok] if the preroll completed and processing can
        continue. Any other return value should be returned from the render vmethod.
  */
  gid.gst1.types.FlowReturn waitPreroll() nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_sink_wait_preroll(cast(GstBaseSink*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from BaseSink
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstbase1.base_sink.BaseSink), T.stringof ~ " is not derived from gid.gstbase1.base_sink.BaseSink");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivatePull", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "activate_pull");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEvent", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFixate", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "fixate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetCaps", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "get_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetTimes", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "get_times");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrepare", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "prepare");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrepareList", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "prepare_list");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPreroll", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "preroll");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProposeAllocation", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "propose_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQuery", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRender", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "render");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderList", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "render_list");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetCaps", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "set_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnlock", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "unlock");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnlockStop", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "unlock_stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWaitEvent", true)[0]) == gid.gstbase1.base_sink.BaseSink))
      _installVfunc(klass, "wait_event");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstBaseSinkClass*)klass;

    switch (vfunc)
    {
      case "activate_pull":
      {
        static extern(C) gboolean _vfuncActivatePullTramp(GstBaseSink* sink, gboolean active) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.activatePull)
              return (cast(typeof(&_vfuncActivatePullTramp))_klass.activatePull)(sink, active);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncActivatePull(cast(bool)active);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncActivatePull");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.activatePull = cast(typeof(_klass.activatePull))&_vfuncActivatePullTramp;
        break;
      }
      case "event":
      {
        static extern(C) gboolean _vfuncEventTramp(GstBaseSink* sink, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.event)
              return (cast(typeof(&_vfuncEventTramp))_klass.event)(sink, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncEvent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.event = cast(typeof(_klass.event))&_vfuncEventTramp;
        break;
      }
      case "fixate":
      {
        static extern(C) GstCaps* _vfuncFixateTramp(GstBaseSink* sink, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.fixate)
              return (cast(typeof(&_vfuncFixateTramp))_klass.fixate)(sink, caps);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncFixate(_caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncFixate");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.fixate = cast(typeof(_klass.fixate))&_vfuncFixateTramp;
        break;
      }
      case "get_caps":
      {
        static extern(C) GstCaps* _vfuncGetCapsTramp(GstBaseSink* sink, GstCaps* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.getCaps)
              return (cast(typeof(&_vfuncGetCapsTramp))_klass.getCaps)(sink, filter);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;
          auto _filter = filter ? new gid.gst1.caps.Caps(cast(void*)filter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetCaps(_filter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncGetCaps");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;
          if (_filter)
            _filter._cUnborrow;

          return _retval;
        }

        _klass.getCaps = cast(typeof(_klass.getCaps))&_vfuncGetCapsTramp;
        break;
      }
      case "get_times":
      {
        static extern(C) void _vfuncGetTimesTramp(GstBaseSink* sink, GstBuffer* buffer, GstClockTime* start, GstClockTime* end) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.getTimes)
              return (cast(typeof(&_vfuncGetTimesTramp))_klass.getTimes)(sink, buffer, start, end);
            return;
          }

          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncGetTimes(_buffer, *start, *end);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncGetTimes");
          }
          if (_buffer)
            _buffer._cUnborrow;

        }

        _klass.getTimes = cast(typeof(_klass.getTimes))&_vfuncGetTimesTramp;
        break;
      }
      case "prepare":
      {
        static extern(C) GstFlowReturn _vfuncPrepareTramp(GstBaseSink* sink, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.prepare)
              return (cast(typeof(&_vfuncPrepareTramp))_klass.prepare)(sink, buffer);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncPrepare(_buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncPrepare");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_buffer)
            _buffer._cUnborrow;

          return _retval;
        }

        _klass.prepare = cast(typeof(_klass.prepare))&_vfuncPrepareTramp;
        break;
      }
      case "prepare_list":
      {
        static extern(C) GstFlowReturn _vfuncPrepareListTramp(GstBaseSink* sink, GstBufferList* bufferList) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.prepareList)
              return (cast(typeof(&_vfuncPrepareListTramp))_klass.prepareList)(sink, bufferList);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _bufferList = bufferList ? new gid.gst1.buffer_list.BufferList(cast(void*)bufferList, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncPrepareList(_bufferList);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncPrepareList");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_bufferList)
            _bufferList._cUnborrow;

          return _retval;
        }

        _klass.prepareList = cast(typeof(_klass.prepareList))&_vfuncPrepareListTramp;
        break;
      }
      case "preroll":
      {
        static extern(C) GstFlowReturn _vfuncPrerollTramp(GstBaseSink* sink, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.preroll)
              return (cast(typeof(&_vfuncPrerollTramp))_klass.preroll)(sink, buffer);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncPreroll(_buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncPreroll");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_buffer)
            _buffer._cUnborrow;

          return _retval;
        }

        _klass.preroll = cast(typeof(_klass.preroll))&_vfuncPrerollTramp;
        break;
      }
      case "propose_allocation":
      {
        static extern(C) gboolean _vfuncProposeAllocationTramp(GstBaseSink* sink, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.proposeAllocation)
              return (cast(typeof(&_vfuncProposeAllocationTramp))_klass.proposeAllocation)(sink, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncProposeAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.proposeAllocation = cast(typeof(_klass.proposeAllocation))&_vfuncProposeAllocationTramp;
        break;
      }
      case "query":
      {
        static extern(C) gboolean _vfuncQueryTramp(GstBaseSink* sink, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.query)
              return (cast(typeof(&_vfuncQueryTramp))_klass.query)(sink, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncQuery(_query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncQuery");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.query = cast(typeof(_klass.query))&_vfuncQueryTramp;
        break;
      }
      case "render":
      {
        static extern(C) GstFlowReturn _vfuncRenderTramp(GstBaseSink* sink, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.render)
              return (cast(typeof(&_vfuncRenderTramp))_klass.render)(sink, buffer);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncRender(_buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncRender");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_buffer)
            _buffer._cUnborrow;

          return _retval;
        }

        _klass.render = cast(typeof(_klass.render))&_vfuncRenderTramp;
        break;
      }
      case "render_list":
      {
        static extern(C) GstFlowReturn _vfuncRenderListTramp(GstBaseSink* sink, GstBufferList* bufferList) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.renderList)
              return (cast(typeof(&_vfuncRenderListTramp))_klass.renderList)(sink, bufferList);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _bufferList = bufferList ? new gid.gst1.buffer_list.BufferList(cast(void*)bufferList, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncRenderList(_bufferList);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncRenderList");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_bufferList)
            _bufferList._cUnborrow;

          return _retval;
        }

        _klass.renderList = cast(typeof(_klass.renderList))&_vfuncRenderListTramp;
        break;
      }
      case "set_caps":
      {
        static extern(C) gboolean _vfuncSetCapsTramp(GstBaseSink* sink, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.setCaps)
              return (cast(typeof(&_vfuncSetCapsTramp))_klass.setCaps)(sink, caps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetCaps(_caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncSetCaps");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.setCaps = cast(typeof(_klass.setCaps))&_vfuncSetCapsTramp;
        break;
      }
      case "start":
      {
        static extern(C) gboolean _vfuncStartTramp(GstBaseSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(sink);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstBaseSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(sink);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      case "unlock":
      {
        static extern(C) gboolean _vfuncUnlockTramp(GstBaseSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.unlock)
              return (cast(typeof(&_vfuncUnlockTramp))_klass.unlock)(sink);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnlock();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncUnlock");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unlock = cast(typeof(_klass.unlock))&_vfuncUnlockTramp;
        break;
      }
      case "unlock_stop":
      {
        static extern(C) gboolean _vfuncUnlockStopTramp(GstBaseSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.unlockStop)
              return (cast(typeof(&_vfuncUnlockStopTramp))_klass.unlockStop)(sink);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnlockStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncUnlockStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unlockStop = cast(typeof(_klass.unlockStop))&_vfuncUnlockStopTramp;
        break;
      }
      case "wait_event":
      {
        static extern(C) GstFlowReturn _vfuncWaitEventTramp(GstBaseSink* sink, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_sink.BaseSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.waitEvent)
              return (cast(typeof(&_vfuncWaitEventTramp))_klass.waitEvent)(sink, event);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncWaitEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_sink.BaseSink.vfuncWaitEvent");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.waitEvent = cast(typeof(_klass.waitEvent))&_vfuncWaitEventTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstbase1.base_sink.BaseSink]
class BaseSinkGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{

  /**
      Set `async` property.
      Params:
        propval = If set to true, the basesink will perform asynchronous state changes.
          When set to false, the sink will not signal the parent when it prerolls.
          Use this option when dealing with sparse streams or when synchronisation is
          not required.
      Returns: Builder instance for fluent chaining
  */
  T async(bool propval) nothrow
  {
    return setProperty("async", propval);
  }

  /**
      Set `blocksize` property.
      Params:
        propval = The amount of bytes to pull when operating in pull mode.
      Returns: Builder instance for fluent chaining
  */
  T blocksize(uint propval) nothrow
  {
    return setProperty("blocksize", propval);
  }

  /**
      Set `enableLastSample` property.
      Params:
        propval = Enable the last-sample property. If false, basesink doesn't keep a
          reference to the last buffer arrived and the last-sample property is always
          set to null. This can be useful if you need buffers to be released as soon
          as possible, eg. if you're using a buffer pool.
      Returns: Builder instance for fluent chaining
  */
  T enableLastSample(bool propval) nothrow
  {
    return setProperty("enable-last-sample", propval);
  }

  /**
      Set `maxBitrate` property.
      Params:
        propval = Control the maximum amount of bits that will be rendered per second.
          Setting this property to a value bigger than 0 will make the sink delay
          rendering of the buffers when it would exceed to max-bitrate.
      Returns: Builder instance for fluent chaining
  */
  T maxBitrate(ulong propval) nothrow
  {
    return setProperty("max-bitrate", propval);
  }

  /** */
  T maxLateness(long propval) nothrow
  {
    return setProperty("max-lateness", propval);
  }

  /**
      Set `processingDeadline` property.
      Params:
        propval = Maximum amount of time (in nanoseconds) that the pipeline can take
          for processing the buffer. This is added to the latency of live
          pipelines.
      Returns: Builder instance for fluent chaining
  */
  T processingDeadline(ulong propval) nothrow
  {
    return setProperty("processing-deadline", propval);
  }

  /** */
  T qos(bool propval) nothrow
  {
    return setProperty("qos", propval);
  }

  /**
      Set `renderDelay` property.
      Params:
        propval = The additional delay between synchronisation and actual rendering of the
          media. This property will add additional latency to the device in order to
          make other sinks compensate for the delay.
      Returns: Builder instance for fluent chaining
  */
  T renderDelay(ulong propval) nothrow
  {
    return setProperty("render-delay", propval);
  }

  /** */
  T sync(bool propval) nothrow
  {
    return setProperty("sync", propval);
  }

  /**
      Set `throttleTime` property.
      Params:
        propval = The time to insert between buffers. This property can be used to control
          the maximum amount of buffers per second to render. Setting this property
          to a value bigger than 0 will make the sink create THROTTLE QoS events.
      Returns: Builder instance for fluent chaining
  */
  T throttleTime(ulong propval) nothrow
  {
    return setProperty("throttle-time", propval);
  }

  /**
      Set `tsOffset` property.
      Params:
        propval = Controls the final synchronisation, a negative value will render the buffer
          earlier while a positive value delays playback. This property can be
          used to fix synchronisation in bad files.
      Returns: Builder instance for fluent chaining
  */
  T tsOffset(long propval) nothrow
  {
    return setProperty("ts-offset", propval);
  }
}

/// Fluent builder for [gid.gstbase1.base_sink.BaseSink]
final class BaseSinkGidBuilder : BaseSinkGidBuilderImpl!BaseSinkGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BaseSink build() nothrow
  {
    return new BaseSink(cast(void*)createGObject(BaseSink._getGType), Yes.Take);
  }
}
