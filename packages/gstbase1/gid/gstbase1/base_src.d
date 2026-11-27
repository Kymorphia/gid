/// Module for [BaseSrc] class
module gid.gstbase1.base_src;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.allocation_params;
import gid.gst1.allocator;
import gid.gst1.buffer;
import gid.gst1.buffer_list;
import gid.gst1.buffer_pool;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.event;
import gid.gst1.query;
import gid.gst1.segment;
import gid.gst1.types;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    This is a generic base class for source elements. The following
    types of sources are supported:
    
      * random access sources like files
      * seekable sources
      * live sources
    
    The source can be configured to operate in any #GstFormat with the
    [gid.gstbase1.base_src.BaseSrc.setFormat] method. The currently set format determines
    the format of the internal #GstSegment and any [gid.gst1.types.EventType.Segment]
    events. The default format for #GstBaseSrc is [gid.gst1.types.Format.Bytes].
    
    #GstBaseSrc always supports push mode scheduling. If the following
    conditions are met, it also supports pull mode scheduling:
    
      * The format is set to [gid.gst1.types.Format.Bytes] (default).
      * #GstBaseSrcClass::is_seekable returns true.
    
    If all the conditions are met for operating in pull mode, #GstBaseSrc is
    automatically seekable in push mode as well. The following conditions must
    be met to make the element seekable in push mode when the format is not
    [gid.gst1.types.Format.Bytes]:
    
    * #GstBaseSrcClass::is_seekable returns true.
    * #GstBaseSrcClass::query can convert all supported seek formats to the
      internal format as set with [gid.gstbase1.base_src.BaseSrc.setFormat].
    * #GstBaseSrcClass::do_seek is implemented, performs the seek and returns
       true.
    
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
    Use [gid.gstbase1.base_src.BaseSrc.setLive] to activate the live source mode.
    
    A live source does not produce data in the PAUSED state. This means that the
    #GstBaseSrcClass::create method will not be called in PAUSED but only in
    PLAYING. To signal the pipeline that the element will not produce data, the
    return value from the READY to PAUSED state will be
    [gid.gst1.types.StateChangeReturn.NoPreroll].
    
    A typical live source will timestamp the buffers it creates with the
    current running time of the pipeline. This is one reason why a live source
    can only produce data in the PLAYING state, when the clock is actually
    distributed and running.
    
    Live sources that synchronize and block on the clock (an audio source, for
    example) can use [gid.gstbase1.base_src.BaseSrc.waitPlaying] when the
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
    [gid.gst1.types.MessageType.SegmentDone] on the bus). This can typically be done
    with the [gid.gst1.element.Element.sendEvent] function on the element or its parent bin.
    
    After the EOS has been sent to the element, the application should wait for
    an EOS message to be posted on the pipeline's bus. Once this EOS message is
    received, it may safely shut down the entire pipeline.
*/
@gidGir("BaseSrc", "BaseSrcClass")
class BaseSrc : gid.gst1.element.Element
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
    return cast(void function())gst_base_src_get_type != &gidSymbolNotFound ? gst_base_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstBaseSrc";
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseSrc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.base_src.BaseSrc]
      Returns: New builder object
  */
  static BaseSrcGidBuilder builder() nothrow
  {
    return new BaseSrcGidBuilder;
  }

  /**
      Get `automaticEos` property.
      Returns: See [gid.gstbase1.base_src.BaseSrc.setAutomaticEos]
  */
  @property bool automaticEos() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("automatic-eos");
  }

  /**
      Set `automaticEos` property.
      Params:
        propval = See [gid.gstbase1.base_src.BaseSrc.setAutomaticEos]
  */
  @property void automaticEos(bool propval) nothrow
  {
    setAutomaticEos(propval);
  }

  /** */
  @property uint blocksize() nothrow
  {
    return getBlocksize();
  }

  /** */
  @property void blocksize(uint propval) nothrow
  {
    setBlocksize(propval);
  }

  /** */
  @property bool doTimestamp() nothrow
  {
    return getDoTimestamp();
  }

  /** */
  @property void doTimestamp(bool propval) nothrow
  {
    setDoTimestamp(propval);
  }

  /** */
  @property int numBuffers() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("num-buffers");
  }

  /** */
  @property void numBuffers(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("num-buffers", propval);
  }

  /** */
  @property bool typefind() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("typefind");
  }

  /** */
  @property void typefind(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("typefind", propval);
  }

  /**
      Ask the subclass to allocate an output buffer with offset and size, the default
      implementation will use the negotiated allocator.
  
      Params:
        offset = 
        size = 
        buf = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAlloc` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncAlloc(ulong offset, uint size, out gid.gst1.buffer.Buffer buf)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.alloc)
      return typeof(return).init;

    GstFlowReturn _cretval;
    GstBuffer* _buf;
    _cretval = _klass.alloc(cast(GstBaseSrc*)this._cPtr, offset, size, &_buf);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_buf)
      buf = new gid.gst1.buffer.Buffer(cast(void*)_buf, Yes.Take);
    return _retval;
  }

  /**
      Ask the subclass to create a buffer with offset and size, the default
      implementation will call alloc if no allocated buf is provided and then call fill.
  
      Params:
        offset = 
        size = 
        buf = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncCreate(ulong offset, uint size, ref gid.gst1.buffer.Buffer buf)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.create)
      return typeof(return).init;

    GstFlowReturn _cretval;
    GstBuffer* _buf = buf ? cast(GstBuffer*)buf._cPtr(Yes.Dup) : null;
    _cretval = _klass.create(cast(GstBaseSrc*)this._cPtr, offset, size, &_buf);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    buf = _buf ? new gid.gst1.buffer.Buffer(cast(void*)_buf, Yes.Take) : null;
    return _retval;
  }

  /**
      configure the allocation query
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDecideAllocation` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDecideAllocation(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.decideAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.decideAllocation(cast(GstBaseSrc*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Perform seeking on the resource to the indicated segment.
  
      Params:
        segment = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDoSeek` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDoSeek(gid.gst1.segment.Segment segment)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.doSeek)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.doSeek(cast(GstBaseSrc*)this._cPtr, cast(GstSegment*)&segment);
    return _retval;
  }

  /**
      Override this to implement custom event handling.
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.event)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.event(cast(GstBaseSrc*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Ask the subclass to fill the buffer with data for offset and size. The
        passed buffer is guaranteed to hold the requested amount of bytes.
  
      Params:
        offset = 
        size = 
        buf =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFill` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncFill(ulong offset, uint size, gid.gst1.buffer.Buffer buf)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.fill)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.fill(cast(GstBaseSrc*)this._cPtr, offset, size, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Called if, in negotiation, caps need fixating.
  
      Params:
        caps = 
      Returns: the fixated caps
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFixate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncFixate(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.fixate)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.fixate(cast(GstBaseSrc*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Called to get the caps to report.
  
      Params:
        filter =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncGetCaps(gid.gst1.caps.Caps filter = null)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.getCaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.getCaps(cast(GstBaseSrc*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the total size of the resource in the format set by
      [gid.gstbase1.base_src.BaseSrc.setFormat].
  
      Params:
        size = 
      Returns: true if the size is available and has been set.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetSize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGetSize(out ulong size)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.getSize)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getSize(cast(GstBaseSrc*)this._cPtr, cast(ulong*)&size);
    return _retval;
  }

  /**
      Given buffer, return start and end time when it should be pushed
      out. The base class will sync on the clock using these times.
  
      Params:
        buffer =  (modified in place, changes are seen by the caller)
        start = 
        end = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetTimes` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetTimes(gid.gst1.buffer.Buffer buffer, out gid.gst1.types.ClockTime start, out gid.gst1.types.ClockTime end)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.getTimes)
      return;

    _klass.getTimes(cast(GstBaseSrc*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, cast(GstClockTime*)&start, cast(GstClockTime*)&end);
  }

  /**
      Check if the source can seek
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsSeekable` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncIsSeekable()
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.isSeekable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isSeekable(cast(GstBaseSrc*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNegotiate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncNegotiate()
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.negotiate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.negotiate(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Prepare the #GstSegment that will be passed to the
        #GstBaseSrcClass::do_seek vmethod for executing a seek
        request. Sub-classes should override this if they support seeking in
        formats other than the configured native format. By default, it tries to
        convert the seek arguments to the configured native format and prepare a
        segment in that format.
  
      Params:
        seek =  (modified in place, changes are seen by the caller)
        segment = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrepareSeekSegment` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncPrepareSeekSegment(gid.gst1.event.Event seek, gid.gst1.segment.Segment segment)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.prepareSeekSegment)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.prepareSeekSegment(cast(GstBaseSrc*)this._cPtr, seek ? cast(GstEvent*)seek._cPtr(No.Dup) : null, cast(GstSegment*)&segment);
    return _retval;
  }

  /**
      Handle a requested query.
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  override protected bool vfuncQuery(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.query)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.query(cast(GstBaseSrc*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Set new caps on the basesrc source pad.
  
      Params:
        caps = a #GstCaps (modified in place, changes are seen by the caller)
      Returns: true if the caps could be set
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetCaps(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.setCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCaps(cast(GstBaseSrc*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Start processing. Subclasses should open resources and prepare
         to produce data. Implementation should call [gid.gstbase1.base_src.BaseSrc.startComplete]
         when the operation completes, either from the current thread or any other
         thread that finishes the start operation asynchronously.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStart()
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Stop processing. Subclasses should use this to close resources.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStop()
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Unlock any pending access to the resource. Subclasses should unblock
         any blocked function ASAP. In particular, any `create()` function in
         progress should be unblocked and should return GST_FLOW_FLUSHING. Any
         future #GstBaseSrcClass::create function call should also return
         GST_FLOW_FLUSHING until the #GstBaseSrcClass::unlock_stop function has
         been called.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnlock` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncUnlock()
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.unlock)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.unlock(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Clear the previous unlock request. Subclasses should clear any
         state they set during #GstBaseSrcClass::unlock, such as clearing command
         queues.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnlockStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncUnlockStop()
  {
    auto _klass = cast(GstBaseSrcClass*)_vfuncClass;
    if (!_klass.unlockStop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.unlockStop(cast(GstBaseSrc*)this._cPtr);
    return _retval;
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
  void getAllocator(out gid.gst1.allocator.Allocator allocator, out gid.gst1.allocation_params.AllocationParams params) nothrow
  {
    GstAllocator* _allocator;
    gst_base_src_get_allocator(cast(GstBaseSrc*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(_allocator, Yes.Take);
  }

  /**
      Get the number of bytes that src will push out with each buffer.
      Returns: the number of bytes pushed with each buffer.
  */
  uint getBlocksize() nothrow
  {
    uint _retval;
    _retval = gst_base_src_get_blocksize(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gst1.buffer_pool.BufferPool getBufferPool() nothrow
  {
    GstBufferPool* _cretval;
    _cretval = gst_base_src_get_buffer_pool(cast(GstBaseSrc*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.buffer_pool.BufferPool)(cast(GstBufferPool*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Query if src timestamps outgoing buffers based on the current running_time.
      Returns: true if the base class will automatically timestamp outgoing buffers.
  */
  bool getDoTimestamp() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_base_src_get_do_timestamp(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the current async behaviour of src. See also [gid.gstbase1.base_src.BaseSrc.setAsync].
      Returns: true if src is operating in async mode.
  */
  bool isAsync() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_base_src_is_async(cast(GstBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Check if an element is in live mode.
      Returns: true if element is in live mode.
  */
  bool isLive() nothrow
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
  bool negotiate() nothrow
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
      configured with [gid.gstbase1.base_src.BaseSrc.setFormat]
  
      Params:
        start = The new start value for the segment
        stop = Stop value for the new segment
        time = The new time value for the start of the new segment
      Returns: true if preparation of the seamless segment succeeded.
  
      Deprecated: Use [gid.gstbase1.base_src.BaseSrc.newSegment]
  */
  bool newSeamlessSegment(long start, long stop, long time) nothrow
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
      of the source, as configured with [gid.gstbase1.base_src.BaseSrc.setFormat].
      
      The format of src must not be [gid.gst1.types.Format.Undefined] and the format
      should be configured via [gid.gstbase1.base_src.BaseSrc.setFormat] before calling this method.
  
      Params:
        segment = a pointer to a #GstSegment
      Returns: true if preparation of new segment succeeded.
  */
  bool newSegment(gid.gst1.segment.Segment segment) nothrow
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
      [gid.gstbase1.base_src.BaseSrc.setCaps] needs to have been called before.
      
      The format for the segment must be identical with the current format
      of the source, as configured with [gid.gstbase1.base_src.BaseSrc.setFormat].
      
      The format of src must not be [gid.gst1.types.Format.Undefined] and the format
      should be configured via [gid.gstbase1.base_src.BaseSrc.setFormat] before calling this method.
      
      This is a variant of [gid.gstbase1.base_src.BaseSrc.newSegment] sending the segment right away,
      which can be useful to ensure events ordering.
  
      Params:
        segment = a pointer to a #GstSegment
      Returns: true if sending of new segment succeeded.
  */
  bool pushSegment(gid.gst1.segment.Segment segment) nothrow
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
  bool queryLatency(out bool live, out gid.gst1.types.ClockTime minLatency, out gid.gst1.types.ClockTime maxLatency) nothrow
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
  void setAsync(bool async) nothrow
  {
    gst_base_src_set_async(cast(GstBaseSrc*)this._cPtr, async);
  }

  /**
      If automatic_eos is true, src will automatically go EOS if a buffer
      after the total size is returned. By default this is true but sources
      that can't return an authoritative size and only know that they're EOS
      when trying to read more should set this to false.
      
      When src operates in [gid.gst1.types.Format.Time], #GstBaseSrc will send an EOS
      when a buffer outside of the currently configured segment is pushed if
      automatic_eos is true. Since 1.16, if automatic_eos is false an
      EOS will be pushed only when the #GstBaseSrcClass::create implementation
      returns [gid.gst1.types.FlowReturn.Eos].
  
      Params:
        automaticEos = automatic eos
  */
  void setAutomaticEos(bool automaticEos) nothrow
  {
    gst_base_src_set_automatic_eos(cast(GstBaseSrc*)this._cPtr, automaticEos);
  }

  /**
      Set the number of bytes that src will push out with each buffer. When
      blocksize is set to -1, a default length will be used.
  
      Params:
        blocksize = the new blocksize in bytes
  */
  void setBlocksize(uint blocksize) nothrow
  {
    gst_base_src_set_blocksize(cast(GstBaseSrc*)this._cPtr, blocksize);
  }

  /**
      Set new caps on the basesrc source pad.
  
      Params:
        caps = a #GstCaps
      Returns: true if the caps could be set
  */
  bool setCaps(gid.gst1.caps.Caps caps) nothrow
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
  void setDoTimestamp(bool timestamp) nothrow
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
  void setDynamicSize(bool dynamic) nothrow
  {
    gst_base_src_set_dynamic_size(cast(GstBaseSrc*)this._cPtr, dynamic);
  }

  /**
      Sets the default format of the source. This will be the format used
      for sending SEGMENT events and for performing seeks.
      
      If a format of GST_FORMAT_BYTES is set, the element will be able to
      operate in pull mode if the #GstBaseSrcClass::is_seekable returns true.
      
      This function must only be called in states < [gid.gst1.types.State.Paused].
  
      Params:
        format = the format to use
  */
  void setFormat(gid.gst1.types.Format format) nothrow
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
  void setLive(bool live) nothrow
  {
    gst_base_src_set_live(cast(GstBaseSrc*)this._cPtr, live);
  }

  /**
      Complete an asynchronous start operation. When the subclass overrides the
      start method, it should call [gid.gstbase1.base_src.BaseSrc.startComplete] when the start
      operation completes either from the same thread or from an asynchronous
      helper thread.
  
      Params:
        ret = a #GstFlowReturn
  */
  void startComplete(gid.gst1.types.FlowReturn ret) nothrow
  {
    gst_base_src_start_complete(cast(GstBaseSrc*)this._cPtr, ret);
  }

  /**
      Wait until the start operation completes.
      Returns: a #GstFlowReturn.
  */
  gid.gst1.types.FlowReturn startWait() nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_src_start_wait(cast(GstBaseSrc*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
      [gid.gst1.types.FlowReturn.Ok] and no buffer from their create virtual method implementation.
      If a buffer is returned after a buffer list has also been submitted via this
      function the behaviour is undefined.
      
      Subclasses must only call this function once per create function call and
      subclasses must only call this function when the source operates in push
      mode.
  
      Params:
        bufferList = a #GstBufferList
  */
  void submitBufferList(gid.gst1.buffer_list.BufferList bufferList) nothrow
  {
    gst_base_src_submit_buffer_list(cast(GstBaseSrc*)this._cPtr, bufferList ? cast(GstBufferList*)bufferList._cPtr(Yes.Dup) : null);
  }

  /**
      If the #GstBaseSrcClass::create method performs its own synchronisation
      against the clock it must unblock when going from PLAYING to the PAUSED state
      and call this method before continuing to produce the remaining data.
      
      This function will block until a state change to PLAYING happens (in which
      case this function returns [gid.gst1.types.FlowReturn.Ok]) or the processing must be stopped due
      to a state change to READY or a FLUSH event (in which case this function
      returns [gid.gst1.types.FlowReturn.Flushing]).
      Returns: [gid.gst1.types.FlowReturn.Ok] if src is PLAYING and processing can
        continue. Any other return value should be returned from the create vmethod.
  */
  gid.gst1.types.FlowReturn waitPlaying() nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_src_wait_playing(cast(GstBaseSrc*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from BaseSrc
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstbase1.base_src.BaseSrc), T.stringof ~ " is not derived from gid.gstbase1.base_src.BaseSrc");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAlloc", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "alloc");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreate", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "create");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDecideAllocation", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "decide_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDoSeek", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "do_seek");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEvent", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFill", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "fill");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFixate", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "fixate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetCaps", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "get_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetSize", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "get_size");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetTimes", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "get_times");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsSeekable", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "is_seekable");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNegotiate", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "negotiate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrepareSeekSegment", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "prepare_seek_segment");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQuery", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetCaps", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "set_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnlock", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "unlock");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnlockStop", true)[0]) == gid.gstbase1.base_src.BaseSrc))
      _installVfunc(klass, "unlock_stop");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstBaseSrcClass*)klass;

    switch (vfunc)
    {
      case "alloc":
      {
        static extern(C) GstFlowReturn _vfuncAllocTramp(GstBaseSrc* src, ulong offset, uint size, GstBuffer** buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.alloc)
              return (cast(typeof(&_vfuncAllocTramp))_klass.alloc)(src, offset, size, buf);
            return typeof(return).init;
          }

          typeof(*buf) _bufNull;
          if (!buf)
            buf = &_bufNull;

          gid.gst1.types.FlowReturn _dretval;
          gid.gst1.buffer.Buffer _buf;

          try
          {
            _dretval = _obj.vfuncAlloc(offset, size, _buf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncAlloc");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          *buf = _buf ? cast(GstBuffer*)_buf._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.alloc = cast(typeof(_klass.alloc))&_vfuncAllocTramp;
        break;
      }
      case "create":
      {
        static extern(C) GstFlowReturn _vfuncCreateTramp(GstBaseSrc* src, ulong offset, uint size, GstBuffer** buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.create)
              return (cast(typeof(&_vfuncCreateTramp))_klass.create)(src, offset, size, buf);
            return typeof(return).init;
          }

          typeof(*buf) _bufNull;
          if (!buf)
            buf = &_bufNull;

          gid.gst1.types.FlowReturn _dretval;
          auto _buf = *buf ? new gid.gst1.buffer.Buffer(cast(void*)*buf, Yes.Take) : null;

          try
          {
            _dretval = _obj.vfuncCreate(offset, size, _buf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncCreate");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          *buf = _buf ? cast(GstBuffer*)_buf._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.create = cast(typeof(_klass.create))&_vfuncCreateTramp;
        break;
      }
      case "decide_allocation":
      {
        static extern(C) gboolean _vfuncDecideAllocationTramp(GstBaseSrc* src, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.decideAllocation)
              return (cast(typeof(&_vfuncDecideAllocationTramp))_klass.decideAllocation)(src, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncDecideAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.decideAllocation = cast(typeof(_klass.decideAllocation))&_vfuncDecideAllocationTramp;
        break;
      }
      case "do_seek":
      {
        static extern(C) gboolean _vfuncDoSeekTramp(GstBaseSrc* src, GstSegment* segment) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.doSeek)
              return (cast(typeof(&_vfuncDoSeekTramp))_klass.doSeek)(src, segment);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncDoSeek(*cast(gid.gst1.segment.Segment*)segment);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncDoSeek");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.doSeek = cast(typeof(_klass.doSeek))&_vfuncDoSeekTramp;
        break;
      }
      case "event":
      {
        static extern(C) gboolean _vfuncEventTramp(GstBaseSrc* src, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.event)
              return (cast(typeof(&_vfuncEventTramp))_klass.event)(src, event);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncEvent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.event = cast(typeof(_klass.event))&_vfuncEventTramp;
        break;
      }
      case "fill":
      {
        static extern(C) GstFlowReturn _vfuncFillTramp(GstBaseSrc* src, ulong offset, uint size, GstBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.fill)
              return (cast(typeof(&_vfuncFillTramp))_klass.fill)(src, offset, size, buf);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _buf = buf ? new gid.gst1.buffer.Buffer(cast(void*)buf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncFill(offset, size, _buf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncFill");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_buf)
            _buf._cUnborrow;

          return _retval;
        }

        _klass.fill = cast(typeof(_klass.fill))&_vfuncFillTramp;
        break;
      }
      case "fixate":
      {
        static extern(C) GstCaps* _vfuncFixateTramp(GstBaseSrc* src, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.fixate)
              return (cast(typeof(&_vfuncFixateTramp))_klass.fixate)(src, caps);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;

          try
          {
            _dretval = _obj.vfuncFixate(caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncFixate");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.fixate = cast(typeof(_klass.fixate))&_vfuncFixateTramp;
        break;
      }
      case "get_caps":
      {
        static extern(C) GstCaps* _vfuncGetCapsTramp(GstBaseSrc* src, GstCaps* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.getCaps)
              return (cast(typeof(&_vfuncGetCapsTramp))_klass.getCaps)(src, filter);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncGetCaps");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;
          if (_filter)
            _filter._cUnborrow;

          return _retval;
        }

        _klass.getCaps = cast(typeof(_klass.getCaps))&_vfuncGetCapsTramp;
        break;
      }
      case "get_size":
      {
        static extern(C) gboolean _vfuncGetSizeTramp(GstBaseSrc* src, ulong* size) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.getSize)
              return (cast(typeof(&_vfuncGetSizeTramp))_klass.getSize)(src, size);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetSize(*size);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncGetSize");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getSize = cast(typeof(_klass.getSize))&_vfuncGetSizeTramp;
        break;
      }
      case "get_times":
      {
        static extern(C) void _vfuncGetTimesTramp(GstBaseSrc* src, GstBuffer* buffer, GstClockTime* start, GstClockTime* end) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.getTimes)
              return (cast(typeof(&_vfuncGetTimesTramp))_klass.getTimes)(src, buffer, start, end);
            return;
          }

          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncGetTimes(_buffer, *start, *end);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncGetTimes");
          }
          if (_buffer)
            _buffer._cUnborrow;

        }

        _klass.getTimes = cast(typeof(_klass.getTimes))&_vfuncGetTimesTramp;
        break;
      }
      case "is_seekable":
      {
        static extern(C) gboolean _vfuncIsSeekableTramp(GstBaseSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.isSeekable)
              return (cast(typeof(&_vfuncIsSeekableTramp))_klass.isSeekable)(src);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsSeekable();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncIsSeekable");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isSeekable = cast(typeof(_klass.isSeekable))&_vfuncIsSeekableTramp;
        break;
      }
      case "negotiate":
      {
        static extern(C) gboolean _vfuncNegotiateTramp(GstBaseSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.negotiate)
              return (cast(typeof(&_vfuncNegotiateTramp))_klass.negotiate)(src);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncNegotiate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncNegotiate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.negotiate = cast(typeof(_klass.negotiate))&_vfuncNegotiateTramp;
        break;
      }
      case "prepare_seek_segment":
      {
        static extern(C) gboolean _vfuncPrepareSeekSegmentTramp(GstBaseSrc* src, GstEvent* seek, GstSegment* segment) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.prepareSeekSegment)
              return (cast(typeof(&_vfuncPrepareSeekSegmentTramp))_klass.prepareSeekSegment)(src, seek, segment);
            return typeof(return).init;
          }

          bool _dretval;
          auto _seek = seek ? new gid.gst1.event.Event(cast(void*)seek, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncPrepareSeekSegment(_seek, *cast(gid.gst1.segment.Segment*)segment);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncPrepareSeekSegment");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_seek)
            _seek._cUnborrow;

          return _retval;
        }

        _klass.prepareSeekSegment = cast(typeof(_klass.prepareSeekSegment))&_vfuncPrepareSeekSegmentTramp;
        break;
      }
      case "query":
      {
        static extern(C) gboolean _vfuncQueryTramp(GstBaseSrc* src, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.query)
              return (cast(typeof(&_vfuncQueryTramp))_klass.query)(src, query);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncQuery");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.query = cast(typeof(_klass.query))&_vfuncQueryTramp;
        break;
      }
      case "set_caps":
      {
        static extern(C) gboolean _vfuncSetCapsTramp(GstBaseSrc* src, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.setCaps)
              return (cast(typeof(&_vfuncSetCapsTramp))_klass.setCaps)(src, caps);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncSetCaps");
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
        static extern(C) gboolean _vfuncStartTramp(GstBaseSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(src);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstBaseSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(src);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      case "unlock":
      {
        static extern(C) gboolean _vfuncUnlockTramp(GstBaseSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.unlock)
              return (cast(typeof(&_vfuncUnlockTramp))_klass.unlock)(src);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnlock();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncUnlock");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unlock = cast(typeof(_klass.unlock))&_vfuncUnlockTramp;
        break;
      }
      case "unlock_stop":
      {
        static extern(C) gboolean _vfuncUnlockStopTramp(GstBaseSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_src.BaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.unlockStop)
              return (cast(typeof(&_vfuncUnlockStopTramp))_klass.unlockStop)(src);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnlockStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_src.BaseSrc.vfuncUnlockStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unlockStop = cast(typeof(_klass.unlockStop))&_vfuncUnlockStopTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstbase1.base_src.BaseSrc]
class BaseSrcGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{

  /**
      Set `automaticEos` property.
      Params:
        propval = See [gid.gstbase1.base_src.BaseSrc.setAutomaticEos]
      Returns: Builder instance for fluent chaining
  */
  T automaticEos(bool propval) nothrow
  {
    return setProperty("automatic-eos", propval);
  }

  /** */
  T blocksize(uint propval) nothrow
  {
    return setProperty("blocksize", propval);
  }

  /** */
  T doTimestamp(bool propval) nothrow
  {
    return setProperty("do-timestamp", propval);
  }

  /** */
  T numBuffers(int propval) nothrow
  {
    return setProperty("num-buffers", propval);
  }

  /** */
  T typefind(bool propval) nothrow
  {
    return setProperty("typefind", propval);
  }
}

/// Fluent builder for [gid.gstbase1.base_src.BaseSrc]
final class BaseSrcGidBuilder : BaseSrcGidBuilderImpl!BaseSrcGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BaseSrc build() nothrow
  {
    return new BaseSrc(cast(void*)createGObject(BaseSrc._getGType), Yes.Take);
  }
}
