/// Module for [AppSink] class
module gid.gstapp1.app_sink;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.caps;
import gid.gst1.mini_object;
import gid.gst1.query;
import gid.gst1.sample;
import gid.gst1.types;
import gid.gst1.urihandler;
import gid.gst1.urihandler_mixin;
import gid.gstapp1.app_sink_simple_callbacks;
import gid.gstapp1.c.functions;
import gid.gstapp1.c.types;
import gid.gstapp1.types;
import gid.gstbase1.base_sink;

/**
    Appsink is a sink plugin that supports many different methods for making
    the application get a handle on the GStreamer data in a pipeline. Unlike
    most GStreamer elements, Appsink provides external API functions.
    
    appsink can be used by linking to the gstappsink.h header file to access the
    methods or by using the appsink action signals and properties.
    
    The normal way of retrieving samples from appsink is by using the
    [gid.gstapp1.app_sink.AppSink.pullSample] and [gid.gstapp1.app_sink.AppSink.pullPreroll] methods.
    These methods block until a sample becomes available in the sink or when the
    sink is shut down or reaches EOS. There are also timed variants of these
    methods, [gid.gstapp1.app_sink.AppSink.tryPullSample] and [gid.gstapp1.app_sink.AppSink.tryPullPreroll],
    which accept a timeout parameter to limit the amount of time to wait.
    
    Appsink will internally use a queue to collect buffers from the streaming
    thread. If the application is not pulling samples fast enough, this queue
    will consume a lot of memory over time. The "max-buffers", "max-time" and "max-bytes"
    properties can be used to limit the queue size. The "leaky-type" property controls whether the
    streaming thread blocks or if older buffers are dropped when the maximum
    queue size is reached. Note that blocking the streaming thread can negatively
    affect real-time performance and should be avoided.
    
    If a blocking behaviour is not desirable, setting the "emit-signals" property
    to true will make appsink emit the "new-sample" and "new-preroll" signals
    when a sample can be pulled without blocking.
    
    The "caps" property on appsink can be used to control the formats that
    appsink can receive. This property can contain non-fixed caps, the format of
    the pulled samples can be obtained by getting the sample caps.
    
    If one of the pull-preroll or pull-sample methods return null, the appsink
    is stopped or in the EOS state. You can check for the EOS state with the
    "eos" property or with the [gid.gstapp1.app_sink.AppSink.isEos] method.
    
    The eos signal can also be used to be informed when the EOS state is reached
    to avoid polling.
*/
@gidGir("AppSink", "AppSinkClass")
class AppSink : gid.gstbase1.base_sink.BaseSink, gid.gst1.urihandler.URIHandler
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
    return cast(void function())gst_app_sink_get_type != &gidSymbolNotFound ? gst_app_sink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAppSink";
  }

  /** Returns `this`, for use in `with` statements. */
  override AppSink self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstapp1.app_sink.AppSink]
      Returns: New builder object
  */
  static AppSinkGidBuilder builder() nothrow
  {
    return new AppSinkGidBuilder;
  }

  /** */
  @property bool bufferList() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("buffer-list");
  }

  /** */
  @property void bufferList(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("buffer-list", propval);
  }

  /** */
  @property gid.gst1.caps.Caps caps() nothrow
  {
    return getCaps();
  }

  /** */
  @property void caps(gid.gst1.caps.Caps propval) nothrow
  {
    setCaps(propval);
  }

  /**
      Get `currentLevelBuffers` property.
      Returns: The number of currently queued buffers inside appsink.
  */
  @property ulong currentLevelBuffers() nothrow
  {
    return getCurrentLevelBuffers();
  }

  /**
      Get `currentLevelBytes` property.
      Returns: The number of currently queued bytes inside appsink.
  */
  @property ulong currentLevelBytes() nothrow
  {
    return getCurrentLevelBytes();
  }

  /**
      Get `currentLevelTime` property.
      Returns: The amount of currently queued time inside appsink.
  */
  @property ulong currentLevelTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("current-level-time");
  }

  /**
      Get `drop` property.
      Returns: Drop old buffers when the buffer queue is filled.
  
      Deprecated: Use "leaky-type" property instead.
  */
  @property bool drop() nothrow
  {
    return getDrop();
  }

  /**
      Set `drop` property.
      Params:
        propval = Drop old buffers when the buffer queue is filled.
  
      Deprecated: Use "leaky-type" property instead.
  */
  @property void drop(bool propval) nothrow
  {
    setDrop(propval);
  }

  /**
      Get `dropped` property.
      Returns: Number of buffers that were dropped.
  */
  @property ulong dropped() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("dropped");
  }

  /** */
  @property bool emitSignals() nothrow
  {
    return getEmitSignals();
  }

  /** */
  @property void emitSignals(bool propval) nothrow
  {
    setEmitSignals(propval);
  }

  /** */
  @property bool eos() nothrow
  {
    return isEos();
  }

  /**
      Get `in_` property.
      Returns: Number of input buffers that were queued.
  */
  @property ulong in_() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("in");
  }

  /**
      Get `leakyType` property.
      Returns: When set to any other value than GST_APP_LEAKY_TYPE_NONE then the appsink
        will drop any buffers that are pushed into it once its internal queue is
        full. The selected type defines whether to drop the oldest or new
        buffers.
  */
  @property gid.gstapp1.types.AppLeakyType leakyType() nothrow
  {
    return getLeakyType();
  }

  /**
      Set `leakyType` property.
      Params:
        propval = When set to any other value than GST_APP_LEAKY_TYPE_NONE then the appsink
          will drop any buffers that are pushed into it once its internal queue is
          full. The selected type defines whether to drop the oldest or new
          buffers.
  */
  @property void leakyType(gid.gstapp1.types.AppLeakyType propval) nothrow
  {
    setLeakyType(propval);
  }

  /**
      Get `maxBuffers` property.
      Returns: Maximum amount of buffers in the queue (0 = unlimited).
  */
  @property uint maxBuffers() nothrow
  {
    return getMaxBuffers();
  }

  /**
      Set `maxBuffers` property.
      Params:
        propval = Maximum amount of buffers in the queue (0 = unlimited).
  */
  @property void maxBuffers(uint propval) nothrow
  {
    setMaxBuffers(propval);
  }

  /**
      Get `maxBytes` property.
      Returns: Maximum amount of bytes in the queue (0 = unlimited)
  */
  @property ulong maxBytes() nothrow
  {
    return getMaxBytes();
  }

  /**
      Set `maxBytes` property.
      Params:
        propval = Maximum amount of bytes in the queue (0 = unlimited)
  */
  @property void maxBytes(ulong propval) nothrow
  {
    setMaxBytes(propval);
  }

  /**
      Get `maxTime` property.
      Returns: Maximum total duration of data in the queue (0 = unlimited)
  */
  @property ulong maxTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("max-time");
  }

  /**
      Set `maxTime` property.
      Params:
        propval = Maximum total duration of data in the queue (0 = unlimited)
  */
  @property void maxTime(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("max-time", propval);
  }

  /**
      Get `out_` property.
      Returns: Number of output buffers that were dequeued.
  */
  @property ulong out_() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("out");
  }

  /**
      Get `silent` property.
      Returns: Don't emit notify for input, output and dropped buffers.
  */
  @property bool silent() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("silent");
  }

  /**
      Set `silent` property.
      Params:
        propval = Don't emit notify for input, output and dropped buffers.
  */
  @property void silent(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("silent", propval);
  }

  /**
      Get `waitOnEos` property.
      Returns: Wait for all buffers to be processed after receiving an EOS.
        
        In cases where it is uncertain if an @appsink will have a consumer for its buffers
        when it receives an EOS, set to false to ensure that the @appsink will not hang.
  */
  @property bool waitOnEos() nothrow
  {
    return getWaitOnEos();
  }

  /**
      Set `waitOnEos` property.
      Params:
        propval = Wait for all buffers to be processed after receiving an EOS.
          
          In cases where it is uncertain if an @appsink will have a consumer for its buffers
          when it receives an EOS, set to false to ensure that the @appsink will not hang.
  */
  @property void waitOnEos(bool propval) nothrow
  {
    setWaitOnEos(propval);
  }

  mixin URIHandlerT!();

  /** */
  protected void vfuncEos()
  {
    auto _klass = cast(GstAppSinkClass*)_vfuncClass;
    if (!_klass.eos)
      return;

    _klass.eos(cast(GstAppSink*)this._cPtr);
  }

  /** */
  protected gid.gst1.types.FlowReturn vfuncNewPreroll()
  {
    auto _klass = cast(GstAppSinkClass*)_vfuncClass;
    if (!_klass.newPreroll)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.newPreroll(cast(GstAppSink*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /** */
  protected gid.gst1.types.FlowReturn vfuncNewSample()
  {
    auto _klass = cast(GstAppSinkClass*)_vfuncClass;
    if (!_klass.newSample)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.newSample(cast(GstAppSink*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Get the last preroll sample in appsink. This was the sample that caused the
      appsink to preroll in the PAUSED state.
      
      This function is typically used when dealing with a pipeline in the PAUSED
      state. Calling this function after doing a seek will give the sample right
      after the seek position.
      
      Calling this function will clear the internal reference to the preroll
      buffer.
      
      Note that the preroll sample will also be returned as the first sample
      when calling [gid.gstapp1.app_sink.AppSink.pullSample].
      
      If an EOS event was received before any buffers, this function returns
      null. Use gst_app_sink_is_eos () to check for the EOS condition.
      
      This function blocks until a preroll sample or EOS is received or the appsink
      element is set to the READY/NULL state.
      Returns: a #GstSample or NULL when the appsink is stopped or EOS.
                 Call [gid.gst1.sample.Sample.unref] after usage.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPullPreroll` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.sample.Sample vfuncPullPreroll()
  {
    auto _klass = cast(GstAppSinkClass*)_vfuncClass;
    if (!_klass.pullPreroll)
      return typeof(return).init;

    GstSample* _cretval;
    _cretval = _klass.pullPreroll(cast(GstAppSink*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function blocks until a sample or EOS becomes available or the appsink
      element is set to the READY/NULL state.
      
      This function will only return samples when the appsink is in the PLAYING
      state. All rendered buffers will be put in a queue so that the application
      can pull samples at its own rate. Note that when the application does not
      pull samples fast enough, the queued buffers could consume a lot of memory,
      especially when dealing with raw video frames.
      
      If an EOS event was received before any buffers, this function returns
      null. Use gst_app_sink_is_eos () to check for the EOS condition.
      Returns: a #GstSample or NULL when the appsink is stopped or EOS.
                 Call [gid.gst1.sample.Sample.unref] after usage.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPullSample` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.sample.Sample vfuncPullSample()
  {
    auto _klass = cast(GstAppSinkClass*)_vfuncClass;
    if (!_klass.pullSample)
      return typeof(return).init;

    GstSample* _cretval;
    _cretval = _klass.pullSample(cast(GstAppSink*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function blocks until a sample or an event or EOS becomes available or the appsink
      element is set to the READY/NULL state or the timeout expires.
      
      This function will only return samples when the appsink is in the PLAYING
      state. All rendered buffers and events will be put in a queue so that the application
      can pull them at its own rate. Note that when the application does not
      pull samples fast enough, the queued buffers could consume a lot of memory,
      especially when dealing with raw video frames.
      Events can be pulled when the appsink is in the READY, PAUSED or PLAYING state.
      
      This function will only pull serialized events, excluding
      the EOS event for which this functions returns
      null. Use [gid.gstapp1.app_sink.AppSink.isEos] to check for the EOS condition.
      
      This method is a variant of [gid.gstapp1.app_sink.AppSink.tryPullSample] that can be used
      to handle incoming events events as well as samples.
      
      Note that future releases may extend this API to return other object types
      so make sure that your code is checking for the actual type it is handling.
  
      Params:
        timeout = the maximum amount of time to wait for a sample
      Returns: a #GstSample, or #GstEvent or NULL when the appsink is stopped or EOS or the timeout expires.
        Call [gid.gst1.mini_object.MiniObject.unref] after usage.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTryPullObject` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.mini_object.MiniObject vfuncTryPullObject(gid.gst1.types.ClockTime timeout)
  {
    auto _klass = cast(GstAppSinkClass*)_vfuncClass;
    if (!_klass.tryPullObject)
      return typeof(return).init;

    GstMiniObject* _cretval;
    _cretval = _klass.tryPullObject(cast(GstAppSink*)this._cPtr, timeout);
    auto _retval = _cretval ? new gid.gst1.mini_object.MiniObject(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the last preroll sample in appsink. This was the sample that caused the
      appsink to preroll in the PAUSED state.
      
      This function is typically used when dealing with a pipeline in the PAUSED
      state. Calling this function after doing a seek will give the sample right
      after the seek position.
      
      Calling this function will clear the internal reference to the preroll
      buffer.
      
      Note that the preroll sample will also be returned as the first sample
      when calling [gid.gstapp1.app_sink.AppSink.pullSample].
      
      If an EOS event was received before any buffers or the timeout expires,
      this function returns null. Use gst_app_sink_is_eos () to check for the EOS
      condition.
      
      This function blocks until a preroll sample or EOS is received, the appsink
      element is set to the READY/NULL state, or the timeout expires.
  
      Params:
        timeout = the maximum amount of time to wait for the preroll sample
      Returns: a #GstSample or NULL when the appsink is stopped or EOS or the timeout expires.
                 Call [gid.gst1.sample.Sample.unref] after usage.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTryPullPreroll` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.sample.Sample vfuncTryPullPreroll(gid.gst1.types.ClockTime timeout)
  {
    auto _klass = cast(GstAppSinkClass*)_vfuncClass;
    if (!_klass.tryPullPreroll)
      return typeof(return).init;

    GstSample* _cretval;
    _cretval = _klass.tryPullPreroll(cast(GstAppSink*)this._cPtr, timeout);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function blocks until a sample or EOS becomes available or the appsink
      element is set to the READY/NULL state or the timeout expires.
      
      This function will only return samples when the appsink is in the PLAYING
      state. All rendered buffers will be put in a queue so that the application
      can pull samples at its own rate. Note that when the application does not
      pull samples fast enough, the queued buffers could consume a lot of memory,
      especially when dealing with raw video frames.
      
      If an EOS event was received before any buffers or the timeout expires,
      this function returns null. Use gst_app_sink_is_eos () to check for the EOS
      condition.
  
      Params:
        timeout = the maximum amount of time to wait for a sample
      Returns: a #GstSample or NULL when the appsink is stopped or EOS or the timeout expires.
                 Call [gid.gst1.sample.Sample.unref] after usage.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTryPullSample` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.sample.Sample vfuncTryPullSample(gid.gst1.types.ClockTime timeout)
  {
    auto _klass = cast(GstAppSinkClass*)_vfuncClass;
    if (!_klass.tryPullSample)
      return typeof(return).init;

    GstSample* _cretval;
    _cretval = _klass.tryPullSample(cast(GstAppSink*)this._cPtr, timeout);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Check if appsink supports buffer lists.
      Returns: true if appsink supports buffer lists.
  */
  bool getBufferListSupport() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_app_sink_get_buffer_list_support(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the configured caps on appsink.
      Returns: the #GstCaps accepted by the sink. [gid.gst1.caps.Caps.unref] after usage.
  */
  gid.gst1.caps.Caps getCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_app_sink_get_caps(cast(GstAppSink*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the number of currently queued buffers inside appsink.
      Returns: The number of currently queued buffers.
  */
  ulong getCurrentLevelBuffers() nothrow
  {
    ulong _retval;
    _retval = gst_app_sink_get_current_level_buffers(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of currently queued bytes inside appsink.
      Returns: The number of currently queued bytes.
  */
  ulong getCurrentLevelBytes() nothrow
  {
    ulong _retval;
    _retval = gst_app_sink_get_current_level_bytes(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the amount of currently queued time inside appsink.
      Returns: The amount of currently queued time.
  */
  gid.gst1.types.ClockTime getCurrentLevelTime() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_app_sink_get_current_level_time(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      Check if appsink will drop old buffers when the maximum amount of queued
      data is reached (meaning max buffers, time or bytes limit, whichever is hit first).
      Returns: true if appsink is dropping old buffers when the queue is
        filled.
  
      Deprecated: Use [gid.gstapp1.app_src.AppSrc.getLeakyType] instead.
  */
  bool getDrop() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_app_sink_get_drop(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      Check if appsink will emit the "new-preroll" and "new-sample" signals.
      Returns: true if appsink is emitting the "new-preroll" and "new-sample"
        signals.
  */
  bool getEmitSignals() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_app_sink_get_emit_signals(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      Returns the currently set #GstAppLeakyType. See [gid.gstapp1.app_sink.AppSink.setLeakyType]
      for more details.
      Returns: The currently set #GstAppLeakyType.
  */
  gid.gstapp1.types.AppLeakyType getLeakyType() nothrow
  {
    GstAppLeakyType _cretval;
    _cretval = gst_app_sink_get_leaky_type(cast(GstAppSink*)this._cPtr);
    gid.gstapp1.types.AppLeakyType _retval = cast(gid.gstapp1.types.AppLeakyType)_cretval;
    return _retval;
  }

  /**
      Get the maximum amount of buffers that can be queued in appsink.
      Returns: The maximum amount of buffers that can be queued.
  */
  uint getMaxBuffers() nothrow
  {
    uint _retval;
    _retval = gst_app_sink_get_max_buffers(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the maximum total size, in bytes, that can be queued in appsink.
      Returns: The maximum amount of bytes that can be queued
  */
  ulong getMaxBytes() nothrow
  {
    ulong _retval;
    _retval = gst_app_sink_get_max_bytes(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the maximum total duration that can be queued in appsink.
      Returns: The maximum total duration that can be queued.
  */
  gid.gst1.types.ClockTime getMaxTime() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_app_sink_get_max_time(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      Check if appsink will wait for all buffers to be consumed when an EOS is
      received.
      Returns: true if appsink will wait for all buffers to be consumed when an
        EOS is received.
  */
  bool getWaitOnEos() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_app_sink_get_wait_on_eos(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      Check if appsink is EOS, which is when no more samples can be pulled because
      an EOS event was received.
      
      This function also returns true when the appsink is not in the PAUSED or
      PLAYING state.
      Returns: true if no more samples can be pulled and the appsink is EOS.
  */
  bool isEos() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_app_sink_is_eos(cast(GstAppSink*)this._cPtr);
    return _retval;
  }

  /**
      This function blocks until a sample or an event becomes available or the appsink
      element is set to the READY/NULL state.
      
      This function will only return samples when the appsink is in the PLAYING
      state. All rendered buffers and events will be put in a queue so that the application
      can pull them at its own rate. Note that when the application does not
      pull samples fast enough, the queued buffers could consume a lot of memory,
      especially when dealing with raw video frames.
      Events can be pulled when the appsink is in the READY, PAUSED or PLAYING state.
      
      This function will only pull serialized events, excluding
      the EOS event for which this functions returns
      null. Use [gid.gstapp1.app_sink.AppSink.isEos] to check for the EOS condition.
      
      This method is a variant of [gid.gstapp1.app_sink.AppSink.pullSample] that can be used
      to handle incoming events events as well as samples.
      
      Note that future releases may extend this API to return other object types
      so make sure that your code is checking for the actual type it is handling.
      Returns: a #GstSample, or a #GstEvent or NULL when the appsink is stopped or EOS.
                 Call [gid.gst1.mini_object.MiniObject.unref] after usage.
  */
  gid.gst1.mini_object.MiniObject pullObject() nothrow
  {
    GstMiniObject* _cretval;
    _cretval = gst_app_sink_pull_object(cast(GstAppSink*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.mini_object.MiniObject(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the last preroll sample in appsink. This was the sample that caused the
      appsink to preroll in the PAUSED state.
      
      This function is typically used when dealing with a pipeline in the PAUSED
      state. Calling this function after doing a seek will give the sample right
      after the seek position.
      
      Calling this function will clear the internal reference to the preroll
      buffer.
      
      Note that the preroll sample will also be returned as the first sample
      when calling [gid.gstapp1.app_sink.AppSink.pullSample].
      
      If an EOS event was received before any buffers, this function returns
      null. Use gst_app_sink_is_eos () to check for the EOS condition.
      
      This function blocks until a preroll sample or EOS is received or the appsink
      element is set to the READY/NULL state.
      Returns: a #GstSample or NULL when the appsink is stopped or EOS.
                 Call [gid.gst1.sample.Sample.unref] after usage.
  */
  gid.gst1.sample.Sample pullPreroll() nothrow
  {
    GstSample* _cretval;
    _cretval = gst_app_sink_pull_preroll(cast(GstAppSink*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function blocks until a sample or EOS becomes available or the appsink
      element is set to the READY/NULL state.
      
      This function will only return samples when the appsink is in the PLAYING
      state. All rendered buffers will be put in a queue so that the application
      can pull samples at its own rate. Note that when the application does not
      pull samples fast enough, the queued buffers could consume a lot of memory,
      especially when dealing with raw video frames.
      
      If an EOS event was received before any buffers, this function returns
      null. Use gst_app_sink_is_eos () to check for the EOS condition.
      Returns: a #GstSample or NULL when the appsink is stopped or EOS.
                 Call [gid.gst1.sample.Sample.unref] after usage.
  */
  gid.gst1.sample.Sample pullSample() nothrow
  {
    GstSample* _cretval;
    _cretval = gst_app_sink_pull_sample(cast(GstAppSink*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Instruct appsink to enable or disable buffer list support.
      
      For backwards-compatibility reasons applications need to opt in
      to indicate that they will be able to handle buffer lists.
  
      Params:
        enableLists = enable or disable buffer list support
  */
  void setBufferListSupport(bool enableLists) nothrow
  {
    gst_app_sink_set_buffer_list_support(cast(GstAppSink*)this._cPtr, enableLists);
  }

  /**
      Set the capabilities on the appsink element.  This function takes
      a copy of the caps structure. After calling this method, the sink will only
      accept caps that match caps. If caps is non-fixed, or incomplete,
      you must check the caps on the samples to get the actual used caps.
  
      Params:
        caps = caps to set
  */
  void setCaps(gid.gst1.caps.Caps caps = null) nothrow
  {
    gst_app_sink_set_caps(cast(GstAppSink*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
  }

  /**
      Instruct appsink to drop old buffers when the maximum amount of queued
      data is reached, that is, when any configured limit is hit (max-buffers, max-time or max-bytes).
  
      Params:
        drop = the new state
  
      Deprecated: Use [gid.gstapp1.app_src.AppSrc.getLeakyType] instead.
  */
  void setDrop(bool drop) nothrow
  {
    gst_app_sink_set_drop(cast(GstAppSink*)this._cPtr, drop);
  }

  /**
      Make appsink emit the "new-preroll" and "new-sample" signals. This option is
      by default disabled because signal emission is expensive and unneeded when
      the application prefers to operate in pull mode.
  
      Params:
        emit = the new state
  */
  void setEmitSignals(bool emit) nothrow
  {
    gst_app_sink_set_emit_signals(cast(GstAppSink*)this._cPtr, emit);
  }

  /**
      When set to any other value than GST_APP_LEAKY_TYPE_NONE then the appsink
      will drop any buffers that are pushed into it once its internal queue is
      full. The selected type defines whether to drop the oldest or new
      buffers.
  
      Params:
        leaky = the #GstAppLeakyType
  */
  void setLeakyType(gid.gstapp1.types.AppLeakyType leaky) nothrow
  {
    gst_app_sink_set_leaky_type(cast(GstAppSink*)this._cPtr, leaky);
  }

  /**
      Set the maximum amount of buffers that can be queued in appsink. After this
      amount of buffers are queued in appsink, any more buffers will block upstream
      elements until a sample is pulled from appsink, unless 'drop' is set, in which
      case new buffers will be discarded.
  
      Params:
        max = the maximum number of buffers to queue
  */
  void setMaxBuffers(uint max) nothrow
  {
    gst_app_sink_set_max_buffers(cast(GstAppSink*)this._cPtr, max);
  }

  /**
      Set the maximum total size that can be queued in appsink. After this
      amount of buffers are queued in appsink, any more buffers will block upstream
      elements until a sample is pulled from appsink, unless 'drop' is set, in which
      case new buffers will be discarded.
  
      Params:
        max = the maximum total size of buffers to queue, in bytes
  */
  void setMaxBytes(ulong max) nothrow
  {
    gst_app_sink_set_max_bytes(cast(GstAppSink*)this._cPtr, max);
  }

  /**
      Set the maximum total duration that can be queued in appsink. After this
      amount of buffers are queued in appsink, any more buffers will block upstream
      elements until a sample is pulled from appsink, unless 'drop' is set, in which
      case new buffers will be discarded.
  
      Params:
        max = the maximum total duration to queue
  */
  void setMaxTime(gid.gst1.types.ClockTime max) nothrow
  {
    gst_app_sink_set_max_time(cast(GstAppSink*)this._cPtr, max);
  }

  /**
      Set callbacks which will be executed for each new preroll, new sample and eos.
      This is an alternative to using the signals, it has lower overhead and is thus
      less expensive, but also less flexible.
      
      If callbacks are installed, no signals will be emitted for performance
      reasons.
      
      Once cb is set on an #GstAppSink it is not possible anymore to change any of
      the callbacks inside it.
      
      Note that [gid.gstapp1.app_sink.AppSink.setCallbacks] and
      [gid.gstapp1.app_sink.AppSink.setSimpleCallbacks] are mutually exclusive and setting one
      will unset the other.
  
      Params:
        cb = the callbacks
  */
  void setSimpleCallbacks(gid.gstapp1.app_sink_simple_callbacks.AppSinkSimpleCallbacks cb = null) nothrow
  {
    gst_app_sink_set_simple_callbacks(cast(GstAppSink*)this._cPtr, cb ? cast(GstAppSinkSimpleCallbacks*)cb._cPtr(Yes.Dup) : null);
  }

  /**
      Instruct appsink to wait for all buffers to be consumed when an EOS is received.
  
      Params:
        wait = the new state
  */
  void setWaitOnEos(bool wait) nothrow
  {
    gst_app_sink_set_wait_on_eos(cast(GstAppSink*)this._cPtr, wait);
  }

  /**
      This function blocks until a sample or an event or EOS becomes available or the appsink
      element is set to the READY/NULL state or the timeout expires.
      
      This function will only return samples when the appsink is in the PLAYING
      state. All rendered buffers and events will be put in a queue so that the application
      can pull them at its own rate. Note that when the application does not
      pull samples fast enough, the queued buffers could consume a lot of memory,
      especially when dealing with raw video frames.
      Events can be pulled when the appsink is in the READY, PAUSED or PLAYING state.
      
      This function will only pull serialized events, excluding
      the EOS event for which this functions returns
      null. Use [gid.gstapp1.app_sink.AppSink.isEos] to check for the EOS condition.
      
      This method is a variant of [gid.gstapp1.app_sink.AppSink.tryPullSample] that can be used
      to handle incoming events events as well as samples.
      
      Note that future releases may extend this API to return other object types
      so make sure that your code is checking for the actual type it is handling.
  
      Params:
        timeout = the maximum amount of time to wait for a sample
      Returns: a #GstSample, or #GstEvent or NULL when the appsink is stopped or EOS or the timeout expires.
        Call [gid.gst1.mini_object.MiniObject.unref] after usage.
  */
  gid.gst1.mini_object.MiniObject tryPullObject(gid.gst1.types.ClockTime timeout) nothrow
  {
    GstMiniObject* _cretval;
    _cretval = gst_app_sink_try_pull_object(cast(GstAppSink*)this._cPtr, timeout);
    auto _retval = _cretval ? new gid.gst1.mini_object.MiniObject(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the last preroll sample in appsink. This was the sample that caused the
      appsink to preroll in the PAUSED state.
      
      This function is typically used when dealing with a pipeline in the PAUSED
      state. Calling this function after doing a seek will give the sample right
      after the seek position.
      
      Calling this function will clear the internal reference to the preroll
      buffer.
      
      Note that the preroll sample will also be returned as the first sample
      when calling [gid.gstapp1.app_sink.AppSink.pullSample].
      
      If an EOS event was received before any buffers or the timeout expires,
      this function returns null. Use gst_app_sink_is_eos () to check for the EOS
      condition.
      
      This function blocks until a preroll sample or EOS is received, the appsink
      element is set to the READY/NULL state, or the timeout expires.
  
      Params:
        timeout = the maximum amount of time to wait for the preroll sample
      Returns: a #GstSample or NULL when the appsink is stopped or EOS or the timeout expires.
                 Call [gid.gst1.sample.Sample.unref] after usage.
  */
  gid.gst1.sample.Sample tryPullPreroll(gid.gst1.types.ClockTime timeout) nothrow
  {
    GstSample* _cretval;
    _cretval = gst_app_sink_try_pull_preroll(cast(GstAppSink*)this._cPtr, timeout);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function blocks until a sample or EOS becomes available or the appsink
      element is set to the READY/NULL state or the timeout expires.
      
      This function will only return samples when the appsink is in the PLAYING
      state. All rendered buffers will be put in a queue so that the application
      can pull samples at its own rate. Note that when the application does not
      pull samples fast enough, the queued buffers could consume a lot of memory,
      especially when dealing with raw video frames.
      
      If an EOS event was received before any buffers or the timeout expires,
      this function returns null. Use gst_app_sink_is_eos () to check for the EOS
      condition.
  
      Params:
        timeout = the maximum amount of time to wait for a sample
      Returns: a #GstSample or NULL when the appsink is stopped or EOS or the timeout expires.
                 Call [gid.gst1.sample.Sample.unref] after usage.
  */
  gid.gst1.sample.Sample tryPullSample(gid.gst1.types.ClockTime timeout) nothrow
  {
    GstSample* _cretval;
    _cretval = gst_app_sink_try_pull_sample(cast(GstAppSink*)this._cPtr, timeout);
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Connect to `Eos` signal.
  
      Signal that the end-of-stream has been reached. This signal is emitted from
        the streaming thread.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gstapp1.app_sink.AppSink appSink)`
  
          `appSink` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEos(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstapp1.app_sink.AppSink)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.eos");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("eos", closure, after);
  }

  /**
      Connect to `NewPreroll` signal.
  
      Signal that a new preroll sample is available.
        
        This signal is emitted from the streaming thread and only when the
        "emit-signals" property is true.
        
        The new preroll sample can be retrieved with the "pull-preroll" action
        signal or [gid.gstapp1.app_sink.AppSink.pullPreroll] either from this signal callback
        or from any other thread.
        
        Note that this signal is only emitted when the "emit-signals" property is
        set to true, which it is not by default for performance reasons.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gst1.types.FlowReturn callback(gid.gstapp1.app_sink.AppSink appSink)`
  
          `appSink` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNewPreroll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gid.gst1.types.FlowReturn)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstapp1.app_sink.AppSink)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gst1.types.FlowReturn _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.newPreroll");
      }

      setVal!(gid.gst1.types.FlowReturn)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("new-preroll", closure, after);
  }

  /**
      Connect to `NewSample` signal.
  
      Signal that a new sample is available.
        
        This signal is emitted from the streaming thread and only when the
        "emit-signals" property is true.
        
        The new sample can be retrieved with the "pull-sample" action
        signal or [gid.gstapp1.app_sink.AppSink.pullSample] either from this signal callback
        or from any other thread.
        
        Note that this signal is only emitted when the "emit-signals" property is
        set to true, which it is not by default for performance reasons.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gst1.types.FlowReturn callback(gid.gstapp1.app_sink.AppSink appSink)`
  
          `appSink` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNewSample(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gid.gst1.types.FlowReturn)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstapp1.app_sink.AppSink)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gst1.types.FlowReturn _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.newSample");
      }

      setVal!(gid.gst1.types.FlowReturn)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("new-sample", closure, after);
  }

  /**
      Connect to `NewSerializedEvent` signal.
  
      Signal that a new downstream serialized event is available.
        
        This signal is emitted from the streaming thread and only when the
        "emit-signals" property is true.
        
        The new event can be retrieved with the "try-pull-object" action
        signal or [gid.gstapp1.app_sink.AppSink.pullObject] either from this signal callback
        or from any other thread.
        
        EOS will not be notified using this signal, use #GstAppSink::eos instead.
        EOS cannot be pulled either, use [gid.gstapp1.app_sink.AppSink.isEos] to check for it.
        
        Note that this signal is only emitted when the "emit-signals" property is
        set to true, which it is not by default for performance reasons.
        
        The callback should return true if the event has been handled, which will
        skip basesink handling of the event, false otherwise.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gstapp1.app_sink.AppSink appSink)`
  
          `appSink` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNewSerializedEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstapp1.app_sink.AppSink)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.newSerializedEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("new-serialized-event", closure, after);
  }

  /**
      Connect to `ProposeAllocation` signal.
  
      Signal that a new propose_allocation query is available.
        
        This signal is emitted from the streaming thread and only when the
        "emit-signals" property is true.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gst1.query.Query query, gid.gstapp1.app_sink.AppSink appSink)`
  
          `query` the allocation query (optional)
  
          `appSink` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectProposeAllocation(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gst1.query.Query)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstapp1.app_sink.AppSink)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.proposeAllocation");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("propose-allocation", closure, after);
  }

  /**
      Connect to `PullPreroll` signal.
  
      Get the last preroll sample in appsink. This was the sample that caused the
        appsink to preroll in the PAUSED state.
        
        This function is typically used when dealing with a pipeline in the PAUSED
        state. Calling this function after doing a seek will give the sample right
        after the seek position.
        
        Calling this function will clear the internal reference to the preroll
        buffer.
        
        Note that the preroll sample will also be returned as the first sample
        when calling [gid.gstapp1.app_sink.AppSink.pullSample] or the "pull-sample" action signal.
        
        If an EOS event was received before any buffers, this function returns
        null. Use gst_app_sink_is_eos () to check for the EOS condition.
        
        This function blocks until a preroll sample or EOS is received or the appsink
        element is set to the READY/NULL state.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gst1.sample.Sample callback(gid.gstapp1.app_sink.AppSink appSink)`
  
          `appSink` the instance the signal is connected to (optional)
  
          `Returns` a #GstSample or null when the appsink is stopped or EOS.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPullPreroll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gid.gst1.sample.Sample)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstapp1.app_sink.AppSink)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gst1.sample.Sample _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.pullPreroll");
      }

      setVal!(gid.gst1.sample.Sample)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pull-preroll", closure, after);
  }

  /**
      Connect to `PullSample` signal.
  
      This function blocks until a sample or EOS becomes available or the appsink
        element is set to the READY/NULL state.
        
        This function will only return samples when the appsink is in the PLAYING
        state. All rendered samples will be put in a queue so that the application
        can pull samples at its own rate.
        
        Note that when the application does not pull samples fast enough, the
        queued samples could consume a lot of memory, especially when dealing with
        raw video frames. It's possible to control the behaviour of the queue with
        the "leaky-type" and "max-buffers" / "max-bytes" / "max-time" set of properties.
        
        If an EOS event was received before any buffers, this function returns
        null. Use gst_app_sink_is_eos () to check for the EOS condition.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gst1.sample.Sample callback(gid.gstapp1.app_sink.AppSink appSink)`
  
          `appSink` the instance the signal is connected to (optional)
  
          `Returns` a #GstSample or null when the appsink is stopped or EOS.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPullSample(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gid.gst1.sample.Sample)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstapp1.app_sink.AppSink)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gst1.sample.Sample _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.pullSample");
      }

      setVal!(gid.gst1.sample.Sample)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pull-sample", closure, after);
  }

  /**
      Connect to `TryPullObject` signal.
  
      This function blocks until a sample or an event becomes available or the appsink
        element is set to the READY/NULL state or the timeout expires.
        
        This function will only return samples when the appsink is in the PLAYING
        state. All rendered samples and events will be put in a queue so that the application
        can pull them at its own rate.
        Events can be pulled when the appsink is in the READY, PAUSED or PLAYING state.
        
        Note that when the application does not pull samples fast enough, the
        queued samples could consume a lot of memory, especially when dealing with
        raw video frames. It's possible to control the behaviour of the queue with
        the "leaky-type" and "max-buffers" / "max-bytes" / "max-time" set of properties.
        
        This function will only pull serialized events, excluding
        the EOS event for which this functions returns
        null. Use [gid.gstapp1.app_sink.AppSink.isEos] to check for the EOS condition.
        
        This signal is a variant of #GstAppSink::try-pull-sample: that can be used
        to handle incoming events as well as samples.
        
        Note that future releases may extend this API to return other object types
        so make sure that your code is checking for the actual type it is handling.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gst1.mini_object.MiniObject callback(ulong timeout, gid.gstapp1.app_sink.AppSink appSink)`
  
          `timeout` the maximum amount of time to wait for a sample (optional)
  
          `appSink` the instance the signal is connected to (optional)
  
          `Returns` a #GstSample or a #GstEvent or NULL when the appsink is stopped or EOS or the timeout expires.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTryPullObject(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gid.gst1.mini_object.MiniObject)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == ulong)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstapp1.app_sink.AppSink)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gst1.mini_object.MiniObject _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.tryPullObject");
      }

      setVal!(gid.gst1.mini_object.MiniObject)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("try-pull-object", closure, after);
  }

  /**
      Connect to `TryPullPreroll` signal.
  
      Get the last preroll sample in appsink. This was the sample that caused the
        appsink to preroll in the PAUSED state.
        
        This function is typically used when dealing with a pipeline in the PAUSED
        state. Calling this function after doing a seek will give the sample right
        after the seek position.
        
        Calling this function will clear the internal reference to the preroll
        buffer.
        
        Note that the preroll sample will also be returned as the first sample
        when calling [gid.gstapp1.app_sink.AppSink.pullSample] or the "pull-sample" action signal.
        
        If an EOS event was received before any buffers or the timeout expires,
        this function returns null. Use gst_app_sink_is_eos () to check for the EOS
        condition.
        
        This function blocks until a preroll sample or EOS is received, the appsink
        element is set to the READY/NULL state, or the timeout expires.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gst1.sample.Sample callback(ulong timeout, gid.gstapp1.app_sink.AppSink appSink)`
  
          `timeout` the maximum amount of time to wait for the preroll sample (optional)
  
          `appSink` the instance the signal is connected to (optional)
  
          `Returns` a #GstSample or null when the appsink
            is stopped or EOS or the timeout expires.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTryPullPreroll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gid.gst1.sample.Sample)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == ulong)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstapp1.app_sink.AppSink)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gst1.sample.Sample _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.tryPullPreroll");
      }

      setVal!(gid.gst1.sample.Sample)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("try-pull-preroll", closure, after);
  }

  /**
      Connect to `TryPullSample` signal.
  
      This function blocks until a sample or EOS becomes available or the appsink
        element is set to the READY/NULL state or the timeout expires.
        
        This function will only return samples when the appsink is in the PLAYING
        state. All rendered samples will be put in a queue so that the application
        can pull samples at its own rate.
        
        Note that when the application does not pull samples fast enough, the
        queued samples could consume a lot of memory, especially when dealing with
        raw video frames. It's possible to control the behaviour of the queue with
        the "leaky-type" and "max-buffers" / "max-bytes" / "max-time" set of properties.
        
        If an EOS event was received before any buffers or the timeout expires,
        this function returns null. Use gst_app_sink_is_eos () to check
        for the EOS condition.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gst1.sample.Sample callback(ulong timeout, gid.gstapp1.app_sink.AppSink appSink)`
  
          `timeout` the maximum amount of time to wait for a sample (optional)
  
          `appSink` the instance the signal is connected to (optional)
  
          `Returns` a #GstSample or NULL when the appsink is stopped or EOS or the timeout expires.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTryPullSample(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gid.gst1.sample.Sample)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == ulong)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstapp1.app_sink.AppSink)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gst1.sample.Sample _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.tryPullSample");
      }

      setVal!(gid.gst1.sample.Sample)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("try-pull-sample", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AppSink
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstapp1.app_sink.AppSink), T.stringof ~ " is not derived from gid.gstapp1.app_sink.AppSink");

    gid.gstbase1.base_sink.BaseSink._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEos", true)[0]) == gid.gstapp1.app_sink.AppSink))
      _installVfunc(klass, "eos");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNewPreroll", true)[0]) == gid.gstapp1.app_sink.AppSink))
      _installVfunc(klass, "new_preroll");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNewSample", true)[0]) == gid.gstapp1.app_sink.AppSink))
      _installVfunc(klass, "new_sample");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPullPreroll", true)[0]) == gid.gstapp1.app_sink.AppSink))
      _installVfunc(klass, "pull_preroll");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPullSample", true)[0]) == gid.gstapp1.app_sink.AppSink))
      _installVfunc(klass, "pull_sample");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTryPullObject", true)[0]) == gid.gstapp1.app_sink.AppSink))
      _installVfunc(klass, "try_pull_object");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTryPullPreroll", true)[0]) == gid.gstapp1.app_sink.AppSink))
      _installVfunc(klass, "try_pull_preroll");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTryPullSample", true)[0]) == gid.gstapp1.app_sink.AppSink))
      _installVfunc(klass, "try_pull_sample");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAppSinkClass*)klass;

    switch (vfunc)
    {
      case "eos":
      {
        static extern(C) void _vfuncEosTramp(GstAppSink* appsink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstapp1.app_sink.AppSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)appsink);
          if (!_obj)
          {
            auto _klass = cast(GstAppSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appsink);
            if (_klass.eos)
              return (cast(typeof(&_vfuncEosTramp))_klass.eos)(appsink);
            return;
          }

          try
          {
            _obj.vfuncEos();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.vfuncEos");
          }
        }

        _klass.eos = cast(typeof(_klass.eos))&_vfuncEosTramp;
        break;
      }
      case "new_preroll":
      {
        static extern(C) GstFlowReturn _vfuncNewPrerollTramp(GstAppSink* appsink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstapp1.app_sink.AppSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)appsink);
          if (!_obj)
          {
            auto _klass = cast(GstAppSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appsink);
            if (_klass.newPreroll)
              return (cast(typeof(&_vfuncNewPrerollTramp))_klass.newPreroll)(appsink);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncNewPreroll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.vfuncNewPreroll");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.newPreroll = cast(typeof(_klass.newPreroll))&_vfuncNewPrerollTramp;
        break;
      }
      case "new_sample":
      {
        static extern(C) GstFlowReturn _vfuncNewSampleTramp(GstAppSink* appsink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstapp1.app_sink.AppSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)appsink);
          if (!_obj)
          {
            auto _klass = cast(GstAppSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appsink);
            if (_klass.newSample)
              return (cast(typeof(&_vfuncNewSampleTramp))_klass.newSample)(appsink);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;

          try
          {
            _dretval = _obj.vfuncNewSample();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.vfuncNewSample");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.newSample = cast(typeof(_klass.newSample))&_vfuncNewSampleTramp;
        break;
      }
      case "pull_preroll":
      {
        static extern(C) GstSample* _vfuncPullPrerollTramp(GstAppSink* appsink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstapp1.app_sink.AppSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)appsink);
          if (!_obj)
          {
            auto _klass = cast(GstAppSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appsink);
            if (_klass.pullPreroll)
              return (cast(typeof(&_vfuncPullPrerollTramp))_klass.pullPreroll)(appsink);
            return typeof(return).init;
          }

          gid.gst1.sample.Sample _dretval;

          try
          {
            _dretval = _obj.vfuncPullPreroll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.vfuncPullPreroll");
          }
          auto _retval = _dretval ? cast(GstSample*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.pullPreroll = cast(typeof(_klass.pullPreroll))&_vfuncPullPrerollTramp;
        break;
      }
      case "pull_sample":
      {
        static extern(C) GstSample* _vfuncPullSampleTramp(GstAppSink* appsink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstapp1.app_sink.AppSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)appsink);
          if (!_obj)
          {
            auto _klass = cast(GstAppSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appsink);
            if (_klass.pullSample)
              return (cast(typeof(&_vfuncPullSampleTramp))_klass.pullSample)(appsink);
            return typeof(return).init;
          }

          gid.gst1.sample.Sample _dretval;

          try
          {
            _dretval = _obj.vfuncPullSample();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.vfuncPullSample");
          }
          auto _retval = _dretval ? cast(GstSample*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.pullSample = cast(typeof(_klass.pullSample))&_vfuncPullSampleTramp;
        break;
      }
      case "try_pull_object":
      {
        static extern(C) GstMiniObject* _vfuncTryPullObjectTramp(GstAppSink* appsink, GstClockTime timeout) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstapp1.app_sink.AppSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)appsink);
          if (!_obj)
          {
            auto _klass = cast(GstAppSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appsink);
            if (_klass.tryPullObject)
              return (cast(typeof(&_vfuncTryPullObjectTramp))_klass.tryPullObject)(appsink, timeout);
            return typeof(return).init;
          }

          gid.gst1.mini_object.MiniObject _dretval;

          try
          {
            _dretval = _obj.vfuncTryPullObject(timeout);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.vfuncTryPullObject");
          }
          auto _retval = _dretval ? cast(GstMiniObject*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.tryPullObject = cast(typeof(_klass.tryPullObject))&_vfuncTryPullObjectTramp;
        break;
      }
      case "try_pull_preroll":
      {
        static extern(C) GstSample* _vfuncTryPullPrerollTramp(GstAppSink* appsink, GstClockTime timeout) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstapp1.app_sink.AppSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)appsink);
          if (!_obj)
          {
            auto _klass = cast(GstAppSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appsink);
            if (_klass.tryPullPreroll)
              return (cast(typeof(&_vfuncTryPullPrerollTramp))_klass.tryPullPreroll)(appsink, timeout);
            return typeof(return).init;
          }

          gid.gst1.sample.Sample _dretval;

          try
          {
            _dretval = _obj.vfuncTryPullPreroll(timeout);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.vfuncTryPullPreroll");
          }
          auto _retval = _dretval ? cast(GstSample*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.tryPullPreroll = cast(typeof(_klass.tryPullPreroll))&_vfuncTryPullPrerollTramp;
        break;
      }
      case "try_pull_sample":
      {
        static extern(C) GstSample* _vfuncTryPullSampleTramp(GstAppSink* appsink, GstClockTime timeout) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstapp1.app_sink.AppSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)appsink);
          if (!_obj)
          {
            auto _klass = cast(GstAppSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appsink);
            if (_klass.tryPullSample)
              return (cast(typeof(&_vfuncTryPullSampleTramp))_klass.tryPullSample)(appsink, timeout);
            return typeof(return).init;
          }

          gid.gst1.sample.Sample _dretval;

          try
          {
            _dretval = _obj.vfuncTryPullSample(timeout);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.app_sink.AppSink.vfuncTryPullSample");
          }
          auto _retval = _dretval ? cast(GstSample*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.tryPullSample = cast(typeof(_klass.tryPullSample))&_vfuncTryPullSampleTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstapp1.app_sink.AppSink]
class AppSinkGidBuilderImpl(T) : gid.gstbase1.base_sink.BaseSinkGidBuilderImpl!T, gid.gst1.urihandler.URIHandlerGidBuilderImpl!T
{

  mixin URIHandlerGidBuilderT!();

  /** */
  T bufferList(bool propval) nothrow
  {
    return setProperty("buffer-list", propval);
  }

  /** */
  T caps(gid.gst1.caps.Caps propval) nothrow
  {
    return setProperty("caps", propval);
  }

  /**
      Set `drop` property.
      Params:
        propval = Drop old buffers when the buffer queue is filled.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use "leaky-type" property instead.
  */
  T drop(bool propval) nothrow
  {
    return setProperty("drop", propval);
  }

  /** */
  T emitSignals(bool propval) nothrow
  {
    return setProperty("emit-signals", propval);
  }

  /**
      Set `leakyType` property.
      Params:
        propval = When set to any other value than GST_APP_LEAKY_TYPE_NONE then the appsink
          will drop any buffers that are pushed into it once its internal queue is
          full. The selected type defines whether to drop the oldest or new
          buffers.
      Returns: Builder instance for fluent chaining
  */
  T leakyType(gid.gstapp1.types.AppLeakyType propval) nothrow
  {
    return setProperty("leaky-type", propval);
  }

  /**
      Set `maxBuffers` property.
      Params:
        propval = Maximum amount of buffers in the queue (0 = unlimited).
      Returns: Builder instance for fluent chaining
  */
  T maxBuffers(uint propval) nothrow
  {
    return setProperty("max-buffers", propval);
  }

  /**
      Set `maxBytes` property.
      Params:
        propval = Maximum amount of bytes in the queue (0 = unlimited)
      Returns: Builder instance for fluent chaining
  */
  T maxBytes(ulong propval) nothrow
  {
    return setProperty("max-bytes", propval);
  }

  /**
      Set `maxTime` property.
      Params:
        propval = Maximum total duration of data in the queue (0 = unlimited)
      Returns: Builder instance for fluent chaining
  */
  T maxTime(ulong propval) nothrow
  {
    return setProperty("max-time", propval);
  }

  /**
      Set `silent` property.
      Params:
        propval = Don't emit notify for input, output and dropped buffers.
      Returns: Builder instance for fluent chaining
  */
  T silent(bool propval) nothrow
  {
    return setProperty("silent", propval);
  }

  /**
      Set `waitOnEos` property.
      Params:
        propval = Wait for all buffers to be processed after receiving an EOS.
          
          In cases where it is uncertain if an @appsink will have a consumer for its buffers
          when it receives an EOS, set to false to ensure that the @appsink will not hang.
      Returns: Builder instance for fluent chaining
  */
  T waitOnEos(bool propval) nothrow
  {
    return setProperty("wait-on-eos", propval);
  }
}

/// Fluent builder for [gid.gstapp1.app_sink.AppSink]
final class AppSinkGidBuilder : AppSinkGidBuilderImpl!AppSinkGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AppSink build() nothrow
  {
    return new AppSink(cast(void*)createGObject(AppSink._getGType), Yes.Take);
  }
}
