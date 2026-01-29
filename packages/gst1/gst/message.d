/// Module for [Message] class
module gst.message;

import gid.gid;
import glib.error;
import gobject.boxed;
import gobject.object;
import gobject.value;
import gst.c.functions;
import gst.c.types;
import gst.clock;
import gst.context;
import gst.device;
import gst.element;
import gst.mini_object;
import gst.object;
import gst.stream;
import gst.stream_collection;
import gst.structure;
import gst.tag_list;
import gst.toc;
import gst.types;

/**
    Messages are implemented as a subclass of #GstMiniObject with a generic
    #GstStructure as the content. This allows for writing custom messages without
    requiring an API change while allowing a wide range of different types
    of messages.
    
    Messages are posted by objects in the pipeline and are passed to the
    application using the #GstBus.
    
    The basic use pattern of posting a message on a #GstBus is as follows:
    ```c
      gst_bus_post (bus, gst_message_new_eos());
    ```
    
    A #GstElement usually posts messages on the bus provided by the parent
    container using [gst.element.Element.postMessage].
*/
class Message : gobject.boxed.Boxed
{

  /**
      Create a `message.Message` boxed type.
      Params:
        type = the #GstMessageType of the message
        timestamp = the timestamp of the message
        src = the src of the message
        seqnum = the sequence number of the message
  */
  this(gst.types.MessageType type = gst.types.MessageType.init, ulong timestamp = ulong.init, gst.object.ObjectWrap src = gst.object.ObjectWrap.init, uint seqnum = uint.init)
  {
    super(gMalloc(GstMessage.sizeof), Yes.Take);
    this.type = type;
    this.timestamp = timestamp;
    this.src = src;
    this.seqnum = seqnum;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_message_get_type != &gidSymbolNotFound ? gst_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Message self()
  {
    return this;
  }

  /**
      Get `miniObject` field.
      Returns: the parent structure
  */
  @property gst.mini_object.MiniObject miniObject()
  {
    return cToD!(gst.mini_object.MiniObject)(cast(void*)&(cast(GstMessage*)this._cPtr).miniObject);
  }

  /**
      Get `type` field.
      Returns: the #GstMessageType of the message
  */
  @property gst.types.MessageType type()
  {
    return cast(gst.types.MessageType)(cast(GstMessage*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the #GstMessageType of the message
  */
  @property void type(gst.types.MessageType propval)
  {
    (cast(GstMessage*)this._cPtr).type = cast(GstMessageType)propval;
  }

  /**
      Get `timestamp` field.
      Returns: the timestamp of the message
  */
  @property ulong timestamp()
  {
    return (cast(GstMessage*)this._cPtr).timestamp;
  }

  /**
      Set `timestamp` field.
      Params:
        propval = the timestamp of the message
  */
  @property void timestamp(ulong propval)
  {
    (cast(GstMessage*)this._cPtr).timestamp = propval;
  }

  /**
      Get `src` field.
      Returns: the src of the message
  */
  @property gst.object.ObjectWrap src()
  {
    return cToD!(gst.object.ObjectWrap)(cast(void*)(cast(GstMessage*)this._cPtr).src);
  }

  /**
      Set `src` field.
      Params:
        propval = the src of the message
  */
  @property void src(gst.object.ObjectWrap propval)
  {
    cValueFree!(gst.object.ObjectWrap)(cast(void*)(cast(GstMessage*)this._cPtr).src);
    dToC(propval, cast(void*)&(cast(GstMessage*)this._cPtr).src);
  }

  /**
      Get `seqnum` field.
      Returns: the sequence number of the message
  */
  @property uint seqnum()
  {
    return (cast(GstMessage*)this._cPtr).seqnum;
  }

  /**
      Set `seqnum` field.
      Params:
        propval = the sequence number of the message
  */
  @property void seqnum(uint propval)
  {
    (cast(GstMessage*)this._cPtr).seqnum = propval;
  }

  /**
      Create a new application-typed message. GStreamer will never create these
      messages; they are a gift from us to you. Enjoy.
  
      Params:
        src = The object originating the message.
        structure = the structure for the message. The message
              will take ownership of the structure.
      Returns: The new application message.
        
        MT safe.
  */
  static gst.message.Message newApplication(gst.object.ObjectWrap src, gst.structure.Structure structure)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_application(src ? cast(GstObject*)src._cPtr(No.Dup) : null, structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      The message is posted when elements completed an ASYNC state change.
      running_time contains the time of the desired running_time when this
      elements goes to PLAYING. A value of #GST_CLOCK_TIME_NONE for running_time
      means that the element has no clock interaction and thus doesn't care about
      the running_time of the pipeline.
  
      Params:
        src = The object originating the message.
        runningTime = the desired running_time
      Returns: The new async_done message.
        
        MT safe.
  */
  static gst.message.Message newAsyncDone(gst.object.ObjectWrap src, gst.types.ClockTime runningTime)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_async_done(src ? cast(GstObject*)src._cPtr(No.Dup) : null, runningTime);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This message is posted by elements when they start an ASYNC state change.
  
      Params:
        src = The object originating the message.
      Returns: The new async_start message.
        
        MT safe.
  */
  static gst.message.Message newAsyncStart(gst.object.ObjectWrap src = null)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_async_start(src ? cast(GstObject*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new buffering message. This message can be posted by an element that
      needs to buffer data before it can continue processing. percent should be a
      value between 0 and 100. A value of 100 means that the buffering completed.
      
      When percent is < 100 the application should PAUSE a PLAYING pipeline. When
      percent is 100, the application can set the pipeline (back) to PLAYING.
      The application must be prepared to receive BUFFERING messages in the
      PREROLLING state and may only set the pipeline to PLAYING after receiving a
      message with percent set to 100, which can happen after the pipeline
      completed prerolling.
      
      MT safe.
  
      Params:
        src = The object originating the message.
        percent = The buffering percent
      Returns: The new buffering message.
  */
  static gst.message.Message newBuffering(gst.object.ObjectWrap src, int percent)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_buffering(src ? cast(GstObject*)src._cPtr(No.Dup) : null, percent);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a clock lost message. This message is posted whenever the
      clock is not valid anymore.
      
      If this message is posted by the pipeline, the pipeline will
      select a new clock again when it goes to PLAYING. It might therefore
      be needed to set the pipeline to PAUSED and PLAYING again.
  
      Params:
        src = The object originating the message.
        clock = the clock that was lost
      Returns: The new clock lost message.
        
        MT safe.
  */
  static gst.message.Message newClockLost(gst.object.ObjectWrap src, gst.clock.Clock clock)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_clock_lost(src ? cast(GstObject*)src._cPtr(No.Dup) : null, clock ? cast(GstClock*)clock._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a clock provide message. This message is posted whenever an
      element is ready to provide a clock or lost its ability to provide
      a clock (maybe because it paused or became EOS).
      
      This message is mainly used internally to manage the clock
      selection.
  
      Params:
        src = The object originating the message.
        clock = the clock it provides
        ready = true if the sender can provide a clock
      Returns: the new provide clock message.
        
        MT safe.
  */
  static gst.message.Message newClockProvide(gst.object.ObjectWrap src, gst.clock.Clock clock, bool ready)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_clock_provide(src ? cast(GstObject*)src._cPtr(No.Dup) : null, clock ? cast(GstClock*)clock._cPtr(No.Dup) : null, ready);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new custom-typed message. This can be used for anything not
      handled by other message-specific functions to pass a message to the
      app. The structure field can be null.
  
      Params:
        type = The #GstMessageType to distinguish messages
        src = The object originating the message.
        structure = the structure for the
              message. The message will take ownership of the structure.
      Returns: The new message.
        
        MT safe.
  */
  static gst.message.Message newCustom(gst.types.MessageType type, gst.object.ObjectWrap src = null, gst.structure.Structure structure = null)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_custom(type, src ? cast(GstObject*)src._cPtr(No.Dup) : null, structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new device-added message. The device-added message is produced by
      #GstDeviceProvider or a #GstDeviceMonitor. They announce the appearance
      of monitored devices.
  
      Params:
        src = The #GstObject that created the message
        device = The new #GstDevice
      Returns: a newly allocated #GstMessage
  */
  static gst.message.Message newDeviceAdded(gst.object.ObjectWrap src, gst.device.Device device)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_device_added(src ? cast(GstObject*)src._cPtr(No.Dup) : null, device ? cast(GstDevice*)device._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new device-changed message. The device-changed message is produced
      by #GstDeviceProvider or a #GstDeviceMonitor. They announce that a device
      properties has changed and device represent the new modified version of changed_device.
  
      Params:
        src = The #GstObject that created the message
        device = The newly created device representing changed_device
                  with its new configuration.
        changedDevice = The old version of the device.
      Returns: a newly allocated #GstMessage
  */
  static gst.message.Message newDeviceChanged(gst.object.ObjectWrap src, gst.device.Device device, gst.device.Device changedDevice)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_device_changed(src ? cast(GstObject*)src._cPtr(No.Dup) : null, device ? cast(GstDevice*)device._cPtr(No.Dup) : null, changedDevice ? cast(GstDevice*)changedDevice._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new device-removed message. The device-removed message is produced
      by #GstDeviceProvider or a #GstDeviceMonitor. They announce the
      disappearance of monitored devices.
  
      Params:
        src = The #GstObject that created the message
        device = The removed #GstDevice
      Returns: a newly allocated #GstMessage
  */
  static gst.message.Message newDeviceRemoved(gst.object.ObjectWrap src, gst.device.Device device)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_device_removed(src ? cast(GstObject*)src._cPtr(No.Dup) : null, device ? cast(GstDevice*)device._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new duration changed message. This message is posted by elements
      that know the duration of a stream when the duration changes. This message
      is received by bins and is used to calculate the total duration of a
      pipeline.
  
      Params:
        src = The object originating the message.
      Returns: The new duration-changed message.
        
        MT safe.
  */
  static gst.message.Message newDurationChanged(gst.object.ObjectWrap src = null)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_duration_changed(src ? cast(GstObject*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new element-specific message. This is meant as a generic way of
      allowing one-way communication from an element to an application, for example
      "the firewire cable was unplugged". The format of the message should be
      documented in the element's documentation. The structure field can be null.
  
      Params:
        src = The object originating the message.
        structure = The structure for the
              message. The message will take ownership of the structure.
      Returns: The new element message.
        
        MT safe.
  */
  static gst.message.Message newElement(gst.object.ObjectWrap src, gst.structure.Structure structure)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_element(src ? cast(GstObject*)src._cPtr(No.Dup) : null, structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new eos message. This message is generated and posted in
      the sink elements of a GstBin. The bin will only forward the EOS
      message to the application if all sinks have posted an EOS message.
  
      Params:
        src = The object originating the message.
      Returns: The new eos message.
        
        MT safe.
  */
  static gst.message.Message newEos(gst.object.ObjectWrap src = null)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_eos(src ? cast(GstObject*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new error message. The message will copy error and
      debug. This message is posted by element when a fatal event
      occurred. The pipeline will probably (partially) stop. The application
      receiving this message should stop the pipeline.
  
      Params:
        src = The object originating the message.
        error = The GError for this message.
        debug_ = A debugging string.
      Returns: the new error message.
        
        MT safe.
  */
  static gst.message.Message newError(gst.object.ObjectWrap src, glib.error.ErrorWrap error, string debug_)
  {
    GstMessage* _cretval;
    const(char)* _debug_ = debug_.toCString(No.Alloc);
    _cretval = gst_message_new_error(src ? cast(GstObject*)src._cPtr(No.Dup) : null, error ? cast(GError*)error._cPtr : null, _debug_);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new error message. The message will copy error and
      debug. This message is posted by element when a fatal event
      occurred. The pipeline will probably (partially) stop. The application
      receiving this message should stop the pipeline.
  
      Params:
        src = The object originating the message.
        error = The GError for this message.
        debug_ = A debugging string.
        details = A GstStructure with details
      Returns: the new error message.
  */
  static gst.message.Message newErrorWithDetails(gst.object.ObjectWrap src, glib.error.ErrorWrap error, string debug_, gst.structure.Structure details = null)
  {
    GstMessage* _cretval;
    const(char)* _debug_ = debug_.toCString(No.Alloc);
    _cretval = gst_message_new_error_with_details(src ? cast(GstObject*)src._cPtr(No.Dup) : null, error ? cast(GError*)error._cPtr : null, _debug_, details ? cast(GstStructure*)details._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This message is posted when an element has a new local #GstContext.
  
      Params:
        src = The object originating the message.
        context = the context
      Returns: The new have-context message.
        
        MT safe.
  */
  static gst.message.Message newHaveContext(gst.object.ObjectWrap src, gst.context.Context context)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_have_context(src ? cast(GstObject*)src._cPtr(No.Dup) : null, context ? cast(GstContext*)context._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new info message. The message will make copies of error and
      debug.
  
      Params:
        src = The object originating the message.
        error = The GError for this message.
        debug_ = A debugging string.
      Returns: the new info message.
        
        MT safe.
  */
  static gst.message.Message newInfo(gst.object.ObjectWrap src, glib.error.ErrorWrap error, string debug_)
  {
    GstMessage* _cretval;
    const(char)* _debug_ = debug_.toCString(No.Alloc);
    _cretval = gst_message_new_info(src ? cast(GstObject*)src._cPtr(No.Dup) : null, error ? cast(GError*)error._cPtr : null, _debug_);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new info message. The message will make copies of error and
      debug.
  
      Params:
        src = The object originating the message.
        error = The GError for this message.
        debug_ = A debugging string.
        details = A GstStructure with details
      Returns: the new warning message.
  */
  static gst.message.Message newInfoWithDetails(gst.object.ObjectWrap src, glib.error.ErrorWrap error, string debug_, gst.structure.Structure details = null)
  {
    GstMessage* _cretval;
    const(char)* _debug_ = debug_.toCString(No.Alloc);
    _cretval = gst_message_new_info_with_details(src ? cast(GstObject*)src._cPtr(No.Dup) : null, error ? cast(GError*)error._cPtr : null, _debug_, details ? cast(GstStructure*)details._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new instant-rate-request message. Elements handling the
      instant-rate-change event must post this message. The message is
      handled at the pipeline, and allows the pipeline to select the
      running time when the rate change should happen and to send an
      GST_EVENT_INSTANT_RATE_SYNC_TIME event to notify the elements
      in the pipeline.
  
      Params:
        src = The #GstObject that posted the message
        rateMultiplier = the rate multiplier factor that should be applied
      Returns: a newly allocated #GstMessage
  */
  static gst.message.Message newInstantRateRequest(gst.object.ObjectWrap src, double rateMultiplier)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_instant_rate_request(src ? cast(GstObject*)src._cPtr(No.Dup) : null, rateMultiplier);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This message can be posted by elements when their latency requirements have
      changed.
  
      Params:
        src = The object originating the message.
      Returns: The new latency message.
        
        MT safe.
  */
  static gst.message.Message newLatency(gst.object.ObjectWrap src = null)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_latency(src ? cast(GstObject*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This message is posted when an element needs a specific #GstContext.
  
      Params:
        src = The object originating the message.
        contextType = The context type that is needed
      Returns: The new need-context message.
        
        MT safe.
  */
  static gst.message.Message newNeedContext(gst.object.ObjectWrap src, string contextType)
  {
    GstMessage* _cretval;
    const(char)* _contextType = contextType.toCString(No.Alloc);
    _cretval = gst_message_new_need_context(src ? cast(GstObject*)src._cPtr(No.Dup) : null, _contextType);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new clock message. This message is posted whenever the
      pipeline selects a new clock for the pipeline.
  
      Params:
        src = The object originating the message.
        clock = the new selected clock
      Returns: The new new clock message.
        
        MT safe.
  */
  static gst.message.Message newNewClock(gst.object.ObjectWrap src, gst.clock.Clock clock)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_new_clock(src ? cast(GstObject*)src._cPtr(No.Dup) : null, clock ? cast(GstClock*)clock._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Progress messages are posted by elements when they use an asynchronous task
      to perform actions triggered by a state change.
      
      code contains a well defined string describing the action.
      text should contain a user visible string detailing the current action.
  
      Params:
        src = The object originating the message.
        type = a #GstProgressType
        code = a progress code
        text = free, user visible text describing the progress
      Returns: The new qos message.
  */
  static gst.message.Message newProgress(gst.object.ObjectWrap src, gst.types.ProgressType type, string code, string text)
  {
    GstMessage* _cretval;
    const(char)* _code = code.toCString(No.Alloc);
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = gst_message_new_progress(src ? cast(GstObject*)src._cPtr(No.Dup) : null, type, _code, _text);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  static gst.message.Message newPropertyNotify(gst.object.ObjectWrap src, string propertyName, gobject.value.Value val = null)
  {
    GstMessage* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = gst_message_new_property_notify(src ? cast(GstObject*)src._cPtr(No.Dup) : null, _propertyName, val ? cast(GValue*)val._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      A QOS message is posted on the bus whenever an element decides to drop a
      buffer because of QoS reasons or whenever it changes its processing strategy
      because of QoS reasons (quality adjustments such as processing at lower
      accuracy).
      
      This message can be posted by an element that performs synchronisation against the
      clock (live) or it could be dropped by an element that performs QoS because of QOS
      events received from a downstream element (!live).
      
      running_time, stream_time, timestamp, duration should be set to the
      respective running-time, stream-time, timestamp and duration of the (dropped)
      buffer that generated the QoS event. Values can be left to
      GST_CLOCK_TIME_NONE when unknown.
  
      Params:
        src = The object originating the message.
        live = if the message was generated by a live element
        runningTime = the running time of the buffer that generated the message
        streamTime = the stream time of the buffer that generated the message
        timestamp = the timestamps of the buffer that generated the message
        duration = the duration of the buffer that generated the message
      Returns: The new qos message.
        
        MT safe.
  */
  static gst.message.Message newQos(gst.object.ObjectWrap src, bool live, ulong runningTime, ulong streamTime, ulong timestamp, ulong duration)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_qos(src ? cast(GstObject*)src._cPtr(No.Dup) : null, live, runningTime, streamTime, timestamp, duration);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new redirect message and adds a new entry to it. Redirect messages
      are posted when an element detects that the actual data has to be retrieved
      from a different location. This is useful if such a redirection cannot be
      handled inside a source element, for example when HTTP 302/303 redirects
      return a non-HTTP URL.
      
      The redirect message can hold multiple entries. The first one is added
      when the redirect message is created, with the given location, tag_list,
      entry_struct arguments. Use [gst.message.Message.addRedirectEntry] to add more
      entries.
      
      Each entry has a location, a tag list, and a structure. All of these are
      optional. The tag list and structure are useful for additional metadata,
      such as bitrate statistics for the given location.
      
      By default, message recipients should treat entries in the order they are
      stored. The recipient should therefore try entry \#0 first, and if this
      entry is not acceptable or working, try entry \#1 etc. Senders must make
      sure that they add entries in this order. However, recipients are free to
      ignore the order and pick an entry that is "best" for them. One example
      would be a recipient that scans the entries for the one with the highest
      bitrate tag.
      
      The specified location string is copied. However, ownership over the tag
      list and structure are transferred to the message.
  
      Params:
        src = The #GstObject whose property changed (may or may not be a #GstElement)
        location = location string for the new entry
        tagList = tag list for the new entry
        entryStruct = structure for the new entry
      Returns: a newly allocated #GstMessage
  */
  static gst.message.Message newRedirect(gst.object.ObjectWrap src, string location, gst.tag_list.TagList tagList = null, gst.structure.Structure entryStruct = null)
  {
    GstMessage* _cretval;
    const(char)* _location = location.toCString(No.Alloc);
    _cretval = gst_message_new_redirect(src ? cast(GstObject*)src._cPtr(No.Dup) : null, _location, tagList ? cast(GstTagList*)tagList._cPtr(Yes.Dup) : null, entryStruct ? cast(const(GstStructure)*)entryStruct._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This message can be posted by elements when they want to have their state
      changed. A typical use case would be an audio server that wants to pause the
      pipeline because a higher priority stream is being played.
  
      Params:
        src = The object originating the message.
        state = The new requested state
      Returns: the new request state message.
        
        MT safe.
  */
  static gst.message.Message newRequestState(gst.object.ObjectWrap src, gst.types.State state)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_request_state(src ? cast(GstObject*)src._cPtr(No.Dup) : null, state);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This message is posted when the pipeline running-time should be reset to
      running_time, like after a flushing seek.
  
      Params:
        src = The object originating the message.
        runningTime = the requested running-time
      Returns: The new reset_time message.
        
        MT safe.
  */
  static gst.message.Message newResetTime(gst.object.ObjectWrap src, gst.types.ClockTime runningTime)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_reset_time(src ? cast(GstObject*)src._cPtr(No.Dup) : null, runningTime);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new segment done message. This message is posted by elements that
      finish playback of a segment as a result of a segment seek. This message
      is received by the application after all elements that posted a segment_start
      have posted the segment_done.
  
      Params:
        src = The object originating the message.
        format = The format of the position being done
        position = The position of the segment being done
      Returns: the new segment done message.
        
        MT safe.
  */
  static gst.message.Message newSegmentDone(gst.object.ObjectWrap src, gst.types.Format format, long position)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_segment_done(src ? cast(GstObject*)src._cPtr(No.Dup) : null, format, position);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new segment message. This message is posted by elements that
      start playback of a segment as a result of a segment seek. This message
      is not received by the application but is used for maintenance reasons in
      container elements.
  
      Params:
        src = The object originating the message.
        format = The format of the position being played
        position = The position of the segment being played
      Returns: the new segment start message.
        
        MT safe.
  */
  static gst.message.Message newSegmentStart(gst.object.ObjectWrap src, gst.types.Format format, long position)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_segment_start(src ? cast(GstObject*)src._cPtr(No.Dup) : null, format, position);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a state change message. This message is posted whenever an element
      changed its state.
  
      Params:
        src = The object originating the message.
        oldstate = the previous state
        newstate = the new (current) state
        pending = the pending (target) state
      Returns: the new state change message.
        
        MT safe.
  */
  static gst.message.Message newStateChanged(gst.object.ObjectWrap src, gst.types.State oldstate, gst.types.State newstate, gst.types.State pending)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_state_changed(src ? cast(GstObject*)src._cPtr(No.Dup) : null, oldstate, newstate, pending);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a state dirty message. This message is posted whenever an element
      changed its state asynchronously and is used internally to update the
      states of container objects.
  
      Params:
        src = The object originating the message
      Returns: the new state dirty message.
        
        MT safe.
  */
  static gst.message.Message newStateDirty(gst.object.ObjectWrap src = null)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_state_dirty(src ? cast(GstObject*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This message is posted by elements when they complete a part, when intermediate set
      to true, or a complete step operation.
      
      duration will contain the amount of time (in GST_FORMAT_TIME) of the stepped
      amount of media in format format.
  
      Params:
        src = The object originating the message.
        format = the format of amount
        amount = the amount of stepped data
        rate = the rate of the stepped amount
        flush = is this an flushing step
        intermediate = is this an intermediate step
        duration = the duration of the data
        eos = the step caused EOS
      Returns: the new step_done message.
        
        MT safe.
  */
  static gst.message.Message newStepDone(gst.object.ObjectWrap src, gst.types.Format format, ulong amount, double rate, bool flush, bool intermediate, ulong duration, bool eos)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_step_done(src ? cast(GstObject*)src._cPtr(No.Dup) : null, format, amount, rate, flush, intermediate, duration, eos);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This message is posted by elements when they accept or activate a new step
      event for amount in format.
      
      active is set to false when the element accepted the new step event and has
      queued it for execution in the streaming threads.
      
      active is set to true when the element has activated the step operation and
      is now ready to start executing the step in the streaming thread. After this
      message is emitted, the application can queue a new step operation in the
      element.
  
      Params:
        src = The object originating the message.
        active = if the step is active or queued
        format = the format of amount
        amount = the amount of stepped data
        rate = the rate of the stepped amount
        flush = is this an flushing step
        intermediate = is this an intermediate step
      Returns: The new step_start message.
        
        MT safe.
  */
  static gst.message.Message newStepStart(gst.object.ObjectWrap src, bool active, gst.types.Format format, ulong amount, double rate, bool flush, bool intermediate)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_step_start(src ? cast(GstObject*)src._cPtr(No.Dup) : null, active, format, amount, rate, flush, intermediate);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new stream-collection message. The message is used to announce new
      #GstStreamCollection
  
      Params:
        src = The #GstObject that created the message
        collection = The #GstStreamCollection
      Returns: a newly allocated #GstMessage
  */
  static gst.message.Message newStreamCollection(gst.object.ObjectWrap src, gst.stream_collection.StreamCollection collection)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_stream_collection(src ? cast(GstObject*)src._cPtr(No.Dup) : null, collection ? cast(GstStreamCollection*)collection._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new stream_start message. This message is generated and posted in
      the sink elements of a GstBin. The bin will only forward the STREAM_START
      message to the application if all sinks have posted an STREAM_START message.
  
      Params:
        src = The object originating the message.
      Returns: The new stream_start message.
        
        MT safe.
  */
  static gst.message.Message newStreamStart(gst.object.ObjectWrap src = null)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_stream_start(src ? cast(GstObject*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new stream status message. This message is posted when a streaming
      thread is created/destroyed or when the state changed.
  
      Params:
        src = The object originating the message.
        type = The stream status type.
        owner = the owner element of src.
      Returns: the new stream status message.
        
        MT safe.
  */
  static gst.message.Message newStreamStatus(gst.object.ObjectWrap src, gst.types.StreamStatusType type, gst.element.Element owner)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_stream_status(src ? cast(GstObject*)src._cPtr(No.Dup) : null, type, owner ? cast(GstElement*)owner._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new steams-selected message. The message is used to announce
      that an array of streams has been selected. This is generally in response
      to a #GST_EVENT_SELECT_STREAMS event, or when an element (such as decodebin3)
      makes an initial selection of streams.
      
      The message also contains the #GstStreamCollection to which the various streams
      belong to.
      
      Users of [gst.message.Message.newStreamsSelected] can add the selected streams with
      [gst.message.Message.streamsSelectedAdd].
  
      Params:
        src = The #GstObject that created the message
        collection = The #GstStreamCollection
      Returns: a newly allocated #GstMessage
  */
  static gst.message.Message newStreamsSelected(gst.object.ObjectWrap src, gst.stream_collection.StreamCollection collection)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_streams_selected(src ? cast(GstObject*)src._cPtr(No.Dup) : null, collection ? cast(GstStreamCollection*)collection._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new structure change message. This message is posted when the
      structure of a pipeline is in the process of being changed, for example
      when pads are linked or unlinked.
      
      src should be the sinkpad that unlinked or linked.
  
      Params:
        src = The object originating the message.
        type = The change type.
        owner = The owner element of src.
        busy = Whether the structure change is busy.
      Returns: the new structure change message.
        
        MT safe.
  */
  static gst.message.Message newStructureChange(gst.object.ObjectWrap src, gst.types.StructureChangeType type, gst.element.Element owner, bool busy)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_structure_change(src ? cast(GstObject*)src._cPtr(No.Dup) : null, type, owner ? cast(GstElement*)owner._cPtr(No.Dup) : null, busy);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new tag message. The message will take ownership of the tag list.
      The message is posted by elements that discovered a new taglist.
  
      Params:
        src = The object originating the message.
        tagList = the tag list for the message.
      Returns: the new tag message.
        
        MT safe.
  */
  static gst.message.Message newTag(gst.object.ObjectWrap src, gst.tag_list.TagList tagList)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_tag(src ? cast(GstObject*)src._cPtr(No.Dup) : null, tagList ? cast(GstTagList*)tagList._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new TOC message. The message is posted by elements
      that discovered or updated a TOC.
  
      Params:
        src = the object originating the message.
        toc = #GstToc structure for the message.
        updated = whether TOC was updated or not.
      Returns: a new TOC message.
        
        MT safe.
  */
  static gst.message.Message newToc(gst.object.ObjectWrap src, gst.toc.Toc toc, bool updated)
  {
    GstMessage* _cretval;
    _cretval = gst_message_new_toc(src ? cast(GstObject*)src._cPtr(No.Dup) : null, toc ? cast(GstToc*)toc._cPtr(No.Dup) : null, updated);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new warning message. The message will make copies of error and
      debug.
  
      Params:
        src = The object originating the message.
        error = The GError for this message.
        debug_ = A debugging string.
      Returns: the new warning message.
        
        MT safe.
  */
  static gst.message.Message newWarning(gst.object.ObjectWrap src, glib.error.ErrorWrap error, string debug_)
  {
    GstMessage* _cretval;
    const(char)* _debug_ = debug_.toCString(No.Alloc);
    _cretval = gst_message_new_warning(src ? cast(GstObject*)src._cPtr(No.Dup) : null, error ? cast(GError*)error._cPtr : null, _debug_);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new warning message. The message will make copies of error and
      debug.
  
      Params:
        src = The object originating the message.
        error = The GError for this message.
        debug_ = A debugging string.
        details = A GstStructure with details
      Returns: the new warning message.
  */
  static gst.message.Message newWarningWithDetails(gst.object.ObjectWrap src, glib.error.ErrorWrap error, string debug_, gst.structure.Structure details = null)
  {
    GstMessage* _cretval;
    const(char)* _debug_ = debug_.toCString(No.Alloc);
    _cretval = gst_message_new_warning_with_details(src ? cast(GstObject*)src._cPtr(No.Dup) : null, error ? cast(GError*)error._cPtr : null, _debug_, details ? cast(GstStructure*)details._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates and appends a new entry.
      
      The specified location string is copied. However, ownership over the tag
      list and structure are transferred to the message.
  
      Params:
        location = location string for the new entry
        tagList = tag list for the new entry
        entryStruct = structure for the new entry
  */
  void addRedirectEntry(string location, gst.tag_list.TagList tagList = null, gst.structure.Structure entryStruct = null)
  {
    const(char)* _location = location.toCString(No.Alloc);
    gst_message_add_redirect_entry(cast(GstMessage*)this._cPtr, _location, tagList ? cast(GstTagList*)tagList._cPtr(Yes.Dup) : null, entryStruct ? cast(const(GstStructure)*)entryStruct._cPtr(Yes.Dup) : null);
  }

  /** */
  size_t getNumRedirectEntries()
  {
    size_t _retval;
    _retval = gst_message_get_num_redirect_entries(cast(GstMessage*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the sequence number of a message.
      
      Messages have ever-incrementing sequence numbers, which may also be set
      explicitly via [gst.message.Message.setSeqnum]. Sequence numbers are typically used
      to indicate that a message corresponds to some other set of messages or
      events, for example a SEGMENT_DONE message corresponding to a SEEK event. It
      is considered good practice to make this correspondence when possible, though
      it is not required.
      
      Note that events and messages share the same sequence number incrementor;
      two events or messages will never have the same sequence number unless
      that correspondence was made explicitly.
      Returns: The message's sequence number.
        
        MT safe.
  */
  uint getSeqnum()
  {
    uint _retval;
    _retval = gst_message_get_seqnum(cast(GstMessage*)this._cPtr);
    return _retval;
  }

  /**
      Extracts the object managing the streaming thread from message.
      Returns: a GValue containing the object that manages the
        streaming thread. This object is usually of type GstTask but other types can
        be added in the future. The object remains valid as long as message is
        valid.
  */
  gobject.value.Value getStreamStatusObject()
  {
    const(GValue)* _cretval;
    _cretval = gst_message_get_stream_status_object(cast(GstMessage*)this._cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Access the structure of the message.
      Returns: The structure of the message. The
        structure is still owned by the message, which means that you should not
        free it and that the pointer becomes invalid when you free the message.
        
        MT safe.
  */
  gst.structure.Structure getStructure()
  {
    const(GstStructure)* _cretval;
    _cretval = gst_message_get_structure(cast(GstMessage*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks if message has the given name. This function is usually used to
      check the name of a custom message.
  
      Params:
        name = name to check
      Returns: true if name matches the name of the message structure.
  */
  bool hasName(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gst_message_has_name(cast(GstMessage*)this._cPtr, _name);
    return _retval;
  }

  /**
      Extract the running_time from the async_done message.
      
      MT safe.
  
      Params:
        runningTime = Result location for the running_time or null
  */
  void parseAsyncDone(out gst.types.ClockTime runningTime)
  {
    gst_message_parse_async_done(cast(GstMessage*)this._cPtr, cast(GstClockTime*)&runningTime);
  }

  /**
      Extracts the buffering percent from the GstMessage. see also
      [gst.message.Message.newBuffering].
      
      MT safe.
  
      Params:
        percent = Return location for the percent.
  */
  void parseBuffering(out int percent)
  {
    gst_message_parse_buffering(cast(GstMessage*)this._cPtr, cast(int*)&percent);
  }

  /**
      Extracts the buffering stats values from message.
  
      Params:
        mode = a buffering mode, or null
        avgIn = the average input rate, or null
        avgOut = the average output rate, or null
        bufferingLeft = amount of buffering time left in
              milliseconds, or null
  */
  void parseBufferingStats(out gst.types.BufferingMode mode, out int avgIn, out int avgOut, out long bufferingLeft)
  {
    gst_message_parse_buffering_stats(cast(GstMessage*)this._cPtr, &mode, cast(int*)&avgIn, cast(int*)&avgOut, cast(long*)&bufferingLeft);
  }

  /**
      Extracts the lost clock from the GstMessage.
      The clock object returned remains valid until the message is freed.
      
      MT safe.
  
      Params:
        clock = a pointer to hold the lost clock
  */
  void parseClockLost(out gst.clock.Clock clock)
  {
    GstClock* _clock;
    gst_message_parse_clock_lost(cast(GstMessage*)this._cPtr, &_clock);
    clock = new gst.clock.Clock(cast(void*)_clock, No.Take);
  }

  /**
      Extracts the clock and ready flag from the GstMessage.
      The clock object returned remains valid until the message is freed.
      
      MT safe.
  
      Params:
        clock = a pointer to  hold a clock
              object, or null
        ready = a pointer to hold the ready flag, or null
  */
  void parseClockProvide(out gst.clock.Clock clock, out bool ready)
  {
    GstClock* _clock;
    gboolean _ready;
    gst_message_parse_clock_provide(cast(GstMessage*)this._cPtr, &_clock, &_ready);
    clock = new gst.clock.Clock(cast(void*)_clock, No.Take);
    ready = cast(bool)_ready;
  }

  /**
      Parse a context type from an existing GST_MESSAGE_NEED_CONTEXT message.
  
      Params:
        contextType = the context type, or null
      Returns: a #gboolean indicating if the parsing succeeded.
  */
  bool parseContextType(out string contextType)
  {
    bool _retval;
    char* _contextType;
    _retval = cast(bool)gst_message_parse_context_type(cast(GstMessage*)this._cPtr, &_contextType);
    contextType = _contextType.fromCString(No.Free);
    return _retval;
  }

  /**
      Parses a device-added message. The device-added message is produced by
      #GstDeviceProvider or a #GstDeviceMonitor. It announces the appearance
      of monitored devices.
  
      Params:
        device = A location where to store a
           pointer to the new #GstDevice, or null
  */
  void parseDeviceAdded(out gst.device.Device device)
  {
    GstDevice* _device;
    gst_message_parse_device_added(cast(GstMessage*)this._cPtr, &_device);
    device = new gst.device.Device(cast(void*)_device, Yes.Take);
  }

  /**
      Parses a device-changed message. The device-changed message is produced by
      #GstDeviceProvider or a #GstDeviceMonitor. It announces the
      disappearance of monitored devices. * It announce that a device properties has
      changed and device represents the new modified version of changed_device.
  
      Params:
        device = A location where to store a
           pointer to the updated version of the #GstDevice, or null
        changedDevice = A location where to store a
           pointer to the old version of the #GstDevice, or null
  */
  void parseDeviceChanged(out gst.device.Device device, out gst.device.Device changedDevice)
  {
    GstDevice* _device;
    GstDevice* _changedDevice;
    gst_message_parse_device_changed(cast(GstMessage*)this._cPtr, &_device, &_changedDevice);
    device = new gst.device.Device(cast(void*)_device, Yes.Take);
    changedDevice = new gst.device.Device(cast(void*)_changedDevice, Yes.Take);
  }

  /**
      Parses a device-removed message. The device-removed message is produced by
      #GstDeviceProvider or a #GstDeviceMonitor. It announces the
      disappearance of monitored devices.
  
      Params:
        device = A location where to store a
           pointer to the removed #GstDevice, or null
  */
  void parseDeviceRemoved(out gst.device.Device device)
  {
    GstDevice* _device;
    gst_message_parse_device_removed(cast(GstMessage*)this._cPtr, &_device);
    device = new gst.device.Device(cast(void*)_device, Yes.Take);
  }

  /**
      Extracts the GError and debug string from the GstMessage. The values returned
      in the output arguments are copies; the caller must free them when done.
      
      Typical usage of this function might be:
      ```c
        ...
        switch (GST_MESSAGE_TYPE (msg)) {
          case GST_MESSAGE_ERROR: {
            GError *err = NULL;
            gchar *dbg_info = NULL;
      
            gst_message_parse_error (msg, &err, &dbg_info);
            g_printerr ("ERROR from element %s: %s\n",
                GST_OBJECT_NAME (msg->src), err->message);
            g_printerr ("Debugging info: %s\n", (dbg_info) ? dbg_info : "none");
            g_error_free (err);
            g_free (dbg_info);
            break;
          }
          ...
        }
        ...
      ```
      
      MT safe.
  
      Params:
        gerror = location for the GError
        debug_ = location for the debug message,
              or null
  */
  void parseError(out glib.error.ErrorWrap gerror, out string debug_)
  {
    GError* _gerror;
    char* _debug_;
    gst_message_parse_error(cast(GstMessage*)this._cPtr, &_gerror, &_debug_);
    gerror = new glib.error.ErrorWrap(cast(void*)_gerror, Yes.Take);
    debug_ = _debug_.fromCString(Yes.Free);
  }

  /**
      Returns the optional details structure, may be NULL if none.
      The returned structure must not be freed.
  
      Params:
        structure = A pointer to the returned details
  */
  void parseErrorDetails(out gst.structure.Structure structure)
  {
    const(GstStructure)* _structure;
    gst_message_parse_error_details(cast(GstMessage*)this._cPtr, &_structure);
    structure = new gst.structure.Structure(cast(void*)_structure, No.Take);
  }

  /**
      Extract the group from the STREAM_START message.
  
      Params:
        groupId = Result location for the group id or
               null
      Returns: true if the message had a group id set, false otherwise
        
        MT safe.
  */
  bool parseGroupId(out uint groupId)
  {
    bool _retval;
    _retval = cast(bool)gst_message_parse_group_id(cast(GstMessage*)this._cPtr, cast(uint*)&groupId);
    return _retval;
  }

  /**
      Extract the context from the HAVE_CONTEXT message.
      
      MT safe.
  
      Params:
        context = Result location for the
               context or null
  */
  void parseHaveContext(out gst.context.Context context)
  {
    GstContext* _context;
    gst_message_parse_have_context(cast(GstMessage*)this._cPtr, &_context);
    context = new gst.context.Context(cast(void*)_context, Yes.Take);
  }

  /**
      Extracts the GError and debug string from the GstMessage. The values returned
      in the output arguments are copies; the caller must free them when done.
      
      MT safe.
  
      Params:
        gerror = location for the GError
        debug_ = location for the debug message,
              or null
  */
  void parseInfo(out glib.error.ErrorWrap gerror, out string debug_)
  {
    GError* _gerror;
    char* _debug_;
    gst_message_parse_info(cast(GstMessage*)this._cPtr, &_gerror, &_debug_);
    gerror = new glib.error.ErrorWrap(cast(void*)_gerror, Yes.Take);
    debug_ = _debug_.fromCString(Yes.Free);
  }

  /**
      Returns the optional details structure, may be NULL if none
      The returned structure must not be freed.
  
      Params:
        structure = A pointer to the returned details
  */
  void parseInfoDetails(out gst.structure.Structure structure)
  {
    const(GstStructure)* _structure;
    gst_message_parse_info_details(cast(GstMessage*)this._cPtr, &_structure);
    structure = new gst.structure.Structure(cast(void*)_structure, No.Take);
  }

  /**
      Parses the rate_multiplier from the instant-rate-request message.
  
      Params:
        rateMultiplier = return location for the rate, or null
  */
  void parseInstantRateRequest(out double rateMultiplier)
  {
    gst_message_parse_instant_rate_request(cast(GstMessage*)this._cPtr, cast(double*)&rateMultiplier);
  }

  /**
      Extracts the new clock from the GstMessage.
      The clock object returned remains valid until the message is freed.
      
      MT safe.
  
      Params:
        clock = a pointer to hold the selected
              new clock
  */
  void parseNewClock(out gst.clock.Clock clock)
  {
    GstClock* _clock;
    gst_message_parse_new_clock(cast(GstMessage*)this._cPtr, &_clock);
    clock = new gst.clock.Clock(cast(void*)_clock, No.Take);
  }

  /**
      Parses the progress type, code and text.
  
      Params:
        type = location for the type
        code = location for the code
        text = location for the text
  */
  void parseProgress(out gst.types.ProgressType type, out string code, out string text)
  {
    char* _code;
    char* _text;
    gst_message_parse_progress(cast(GstMessage*)this._cPtr, &type, &_code, &_text);
    code = _code.fromCString(Yes.Free);
    text = _text.fromCString(Yes.Free);
  }

  /**
      Parses a property-notify message. These will be posted on the bus only
      when set up with [gst.element.Element.addPropertyNotifyWatch] or
      [gst.element.Element.addPropertyDeepNotifyWatch].
  
      Params:
        object = location where to store a
              pointer to the object whose property got changed, or null
        propertyName = return location for
              the name of the property that got changed, or null
        propertyValue = return location for
              the new value of the property that got changed, or null. This will
              only be set if the property notify watch was told to include the value
              when it was set up
  */
  void parsePropertyNotify(out gst.object.ObjectWrap object, out string propertyName, out gobject.value.Value propertyValue)
  {
    GstObject* _object;
    char* _propertyName;
    const(GValue)* _propertyValue;
    gst_message_parse_property_notify(cast(GstMessage*)this._cPtr, &_object, &_propertyName, &_propertyValue);
    object = new gst.object.ObjectWrap(cast(void*)_object, No.Take);
    propertyName = _propertyName.fromCString(No.Free);
    propertyValue = new gobject.value.Value(cast(void*)_propertyValue, No.Take);
  }

  /**
      Extract the timestamps and live status from the QoS message.
      
      The returned values give the running_time, stream_time, timestamp and
      duration of the dropped buffer. Values of GST_CLOCK_TIME_NONE mean unknown
      values.
      
      MT safe.
  
      Params:
        live = if the message was generated by a live element
        runningTime = the running time of the buffer that
              generated the message
        streamTime = the stream time of the buffer that
              generated the message
        timestamp = the timestamps of the buffer that
              generated the message
        duration = the duration of the buffer that
              generated the message
  */
  void parseQos(out bool live, out ulong runningTime, out ulong streamTime, out ulong timestamp, out ulong duration)
  {
    gboolean _live;
    gst_message_parse_qos(cast(GstMessage*)this._cPtr, &_live, cast(ulong*)&runningTime, cast(ulong*)&streamTime, cast(ulong*)&timestamp, cast(ulong*)&duration);
    live = cast(bool)_live;
  }

  /**
      Extract the QoS stats representing the history of the current continuous
      pipeline playback period.
      
      When format is GST_FORMAT_UNDEFINED both dropped and processed are
      invalid. Values of -1 for either processed or dropped mean unknown values.
      
      MT safe.
  
      Params:
        format = Units of the 'processed' and 'dropped' fields.
              Video sinks and video filters will use GST_FORMAT_BUFFERS (frames).
              Audio sinks and audio filters will likely use GST_FORMAT_DEFAULT
              (samples).
        processed = Total number of units correctly processed
              since the last state change to READY or a flushing operation.
        dropped = Total number of units dropped since the last
              state change to READY or a flushing operation.
  */
  void parseQosStats(out gst.types.Format format, out ulong processed, out ulong dropped)
  {
    gst_message_parse_qos_stats(cast(GstMessage*)this._cPtr, &format, cast(ulong*)&processed, cast(ulong*)&dropped);
  }

  /**
      Extract the QoS values that have been calculated/analysed from the QoS data
      
      MT safe.
  
      Params:
        jitter = The difference of the running-time against
              the deadline.
        proportion = Long term prediction of the ideal rate
              relative to normal rate to get optimal quality.
        quality = An element dependent integer value that
              specifies the current quality level of the element. The default
              maximum quality is 1000000.
  */
  void parseQosValues(out long jitter, out double proportion, out int quality)
  {
    gst_message_parse_qos_values(cast(GstMessage*)this._cPtr, cast(long*)&jitter, cast(double*)&proportion, cast(int*)&quality);
  }

  /**
      Parses the location and/or structure from the entry with the given index.
      The index must be between 0 and [gst.message.Message.getNumRedirectEntries] - 1.
      Returned pointers are valid for as long as this message exists.
  
      Params:
        entryIndex = index of the entry to parse
        location = return location for
              the pointer to the entry's location string, or null
        tagList = return location for
              the pointer to the entry's tag list, or null
        entryStruct = return location
              for the pointer to the entry's structure, or null
  */
  void parseRedirectEntry(size_t entryIndex, out string location, out gst.tag_list.TagList tagList, out gst.structure.Structure entryStruct)
  {
    char* _location;
    GstTagList* _tagList;
    const(GstStructure)* _entryStruct;
    gst_message_parse_redirect_entry(cast(GstMessage*)this._cPtr, entryIndex, &_location, &_tagList, &_entryStruct);
    location = _location.fromCString(No.Free);
    tagList = new gst.tag_list.TagList(cast(void*)_tagList, No.Take);
    entryStruct = new gst.structure.Structure(cast(void*)_entryStruct, No.Take);
  }

  /**
      Extract the requested state from the request_state message.
      
      MT safe.
  
      Params:
        state = Result location for the requested state or null
  */
  void parseRequestState(out gst.types.State state)
  {
    gst_message_parse_request_state(cast(GstMessage*)this._cPtr, &state);
  }

  /**
      Extract the running-time from the RESET_TIME message.
      
      MT safe.
  
      Params:
        runningTime = Result location for the running_time or
               null
  */
  void parseResetTime(out gst.types.ClockTime runningTime)
  {
    gst_message_parse_reset_time(cast(GstMessage*)this._cPtr, cast(GstClockTime*)&runningTime);
  }

  /**
      Extracts the position and format from the segment done message.
      
      MT safe.
  
      Params:
        format = Result location for the format, or null
        position = Result location for the position, or null
  */
  void parseSegmentDone(out gst.types.Format format, out long position)
  {
    gst_message_parse_segment_done(cast(GstMessage*)this._cPtr, &format, cast(long*)&position);
  }

  /**
      Extracts the position and format from the segment start message.
      
      MT safe.
  
      Params:
        format = Result location for the format, or null
        position = Result location for the position, or null
  */
  void parseSegmentStart(out gst.types.Format format, out long position)
  {
    gst_message_parse_segment_start(cast(GstMessage*)this._cPtr, &format, cast(long*)&position);
  }

  /**
      Extracts the old and new states from the GstMessage.
      
      Typical usage of this function might be:
      ```c
        ...
        switch (GST_MESSAGE_TYPE (msg)) {
          case GST_MESSAGE_STATE_CHANGED: {
            GstState old_state, new_state;
      
            gst_message_parse_state_changed (msg, &old_state, &new_state, NULL);
            g_print ("Element %s changed state from %s to %s.\n",
                GST_OBJECT_NAME (msg->src),
                gst_element_state_get_name (old_state),
                gst_element_state_get_name (new_state));
            break;
          }
          ...
        }
        ...
      ```
      
      MT safe.
  
      Params:
        oldstate = the previous state, or null
        newstate = the new (current) state, or null
        pending = the pending (target) state, or null
  */
  void parseStateChanged(out gst.types.State oldstate, out gst.types.State newstate, out gst.types.State pending)
  {
    gst_message_parse_state_changed(cast(GstMessage*)this._cPtr, &oldstate, &newstate, &pending);
  }

  /**
      Extract the values the step_done message.
      
      MT safe.
  
      Params:
        format = result location for the format
        amount = result location for the amount
        rate = result location for the rate
        flush = result location for the flush flag
        intermediate = result location for the intermediate flag
        duration = result location for the duration
        eos = result location for the EOS flag
  */
  void parseStepDone(out gst.types.Format format, out ulong amount, out double rate, out bool flush, out bool intermediate, out ulong duration, out bool eos)
  {
    gboolean _flush;
    gboolean _intermediate;
    gboolean _eos;
    gst_message_parse_step_done(cast(GstMessage*)this._cPtr, &format, cast(ulong*)&amount, cast(double*)&rate, &_flush, &_intermediate, cast(ulong*)&duration, &_eos);
    flush = cast(bool)_flush;
    intermediate = cast(bool)_intermediate;
    eos = cast(bool)_eos;
  }

  /**
      Extract the values from step_start message.
      
      MT safe.
  
      Params:
        active = result location for the active flag
        format = result location for the format
        amount = result location for the amount
        rate = result location for the rate
        flush = result location for the flush flag
        intermediate = result location for the intermediate flag
  */
  void parseStepStart(out bool active, out gst.types.Format format, out ulong amount, out double rate, out bool flush, out bool intermediate)
  {
    gboolean _active;
    gboolean _flush;
    gboolean _intermediate;
    gst_message_parse_step_start(cast(GstMessage*)this._cPtr, &_active, &format, cast(ulong*)&amount, cast(double*)&rate, &_flush, &_intermediate);
    active = cast(bool)_active;
    flush = cast(bool)_flush;
    intermediate = cast(bool)_intermediate;
  }

  /**
      Parses a stream-collection message.
  
      Params:
        collection = A location where to store a
           pointer to the #GstStreamCollection, or null
  */
  void parseStreamCollection(out gst.stream_collection.StreamCollection collection)
  {
    GstStreamCollection* _collection;
    gst_message_parse_stream_collection(cast(GstMessage*)this._cPtr, &_collection);
    collection = new gst.stream_collection.StreamCollection(cast(void*)_collection, Yes.Take);
  }

  /**
      Extracts the stream status type and owner the GstMessage. The returned
      owner remains valid for as long as the reference to message is valid and
      should thus not be unreffed.
      
      MT safe.
  
      Params:
        type = A pointer to hold the status type
        owner = The owner element of the message source
  */
  void parseStreamStatus(out gst.types.StreamStatusType type, out gst.element.Element owner)
  {
    GstElement* _owner;
    gst_message_parse_stream_status(cast(GstMessage*)this._cPtr, &type, &_owner);
    owner = new gst.element.Element(cast(void*)_owner, No.Take);
  }

  /**
      Parses a streams-selected message.
  
      Params:
        collection = A location where to store a
           pointer to the #GstStreamCollection, or null
  */
  void parseStreamsSelected(out gst.stream_collection.StreamCollection collection)
  {
    GstStreamCollection* _collection;
    gst_message_parse_streams_selected(cast(GstMessage*)this._cPtr, &_collection);
    collection = new gst.stream_collection.StreamCollection(cast(void*)_collection, Yes.Take);
  }

  /**
      Extracts the change type and completion status from the GstMessage.
      
      MT safe.
  
      Params:
        type = A pointer to hold the change type
        owner = The owner element of the
              message source
        busy = a pointer to hold whether the change is in
              progress or has been completed
  */
  void parseStructureChange(out gst.types.StructureChangeType type, out gst.element.Element owner, out bool busy)
  {
    GstElement* _owner;
    gboolean _busy;
    gst_message_parse_structure_change(cast(GstMessage*)this._cPtr, &type, &_owner, &_busy);
    owner = new gst.element.Element(cast(void*)_owner, No.Take);
    busy = cast(bool)_busy;
  }

  /**
      Extracts the tag list from the GstMessage. The tag list returned in the
      output argument is a copy; the caller must free it when done.
      
      Typical usage of this function might be:
      ```c
        ...
        switch (GST_MESSAGE_TYPE (msg)) {
          case GST_MESSAGE_TAG: {
            GstTagList *tags = NULL;
      
            gst_message_parse_tag (msg, &tags);
            g_print ("Got tags from element %s\n", GST_OBJECT_NAME (msg->src));
            handle_tags (tags);
            gst_tag_list_unref (tags);
            break;
          }
          ...
        }
        ...
      ```
      
      MT safe.
  
      Params:
        tagList = return location for the tag-list.
  */
  void parseTag(out gst.tag_list.TagList tagList)
  {
    GstTagList* _tagList;
    gst_message_parse_tag(cast(GstMessage*)this._cPtr, &_tagList);
    tagList = new gst.tag_list.TagList(cast(void*)_tagList, Yes.Take);
  }

  /**
      Extract the TOC from the #GstMessage. The TOC returned in the
      output argument is a copy; the caller must free it with
      gst_toc_unref() when done.
      
      MT safe.
  
      Params:
        toc = return location for the TOC.
        updated = return location for the updated flag.
  */
  void parseToc(out gst.toc.Toc toc, out bool updated)
  {
    GstToc* _toc;
    gboolean _updated;
    gst_message_parse_toc(cast(GstMessage*)this._cPtr, &_toc, &_updated);
    toc = new gst.toc.Toc(cast(void*)_toc, Yes.Take);
    updated = cast(bool)_updated;
  }

  /**
      Extracts the GError and debug string from the GstMessage. The values returned
      in the output arguments are copies; the caller must free them when done.
      
      MT safe.
  
      Params:
        gerror = location for the GError
        debug_ = location for the debug message,
              or null
  */
  void parseWarning(out glib.error.ErrorWrap gerror, out string debug_)
  {
    GError* _gerror;
    char* _debug_;
    gst_message_parse_warning(cast(GstMessage*)this._cPtr, &_gerror, &_debug_);
    gerror = new glib.error.ErrorWrap(cast(void*)_gerror, Yes.Take);
    debug_ = _debug_.fromCString(Yes.Free);
  }

  /**
      Returns the optional details structure, may be NULL if none
      The returned structure must not be freed.
  
      Params:
        structure = A pointer to the returned details
  */
  void parseWarningDetails(out gst.structure.Structure structure)
  {
    const(GstStructure)* _structure;
    gst_message_parse_warning_details(cast(GstMessage*)this._cPtr, &_structure);
    structure = new gst.structure.Structure(cast(void*)_structure, No.Take);
  }

  /**
      Configures the buffering stats values in message.
  
      Params:
        mode = a buffering mode
        avgIn = the average input rate
        avgOut = the average output rate
        bufferingLeft = amount of buffering time left in milliseconds
  */
  void setBufferingStats(gst.types.BufferingMode mode, int avgIn, int avgOut, long bufferingLeft)
  {
    gst_message_set_buffering_stats(cast(GstMessage*)this._cPtr, mode, avgIn, avgOut, bufferingLeft);
  }

  /**
      Sets the group id on the stream-start message.
      
      All streams that have the same group id are supposed to be played
      together, i.e. all streams inside a container file should have the
      same group id but different stream ids. The group id should change
      each time the stream is started, resulting in different group ids
      each time a file is played for example.
      
      MT safe.
  
      Params:
        groupId = the group id
  */
  void setGroupId(uint groupId)
  {
    gst_message_set_group_id(cast(GstMessage*)this._cPtr, groupId);
  }

  /**
      Set the QoS stats representing the history of the current continuous pipeline
      playback period.
      
      When format is GST_FORMAT_UNDEFINED both dropped and processed are
      invalid. Values of -1 for either processed or dropped mean unknown values.
      
      MT safe.
  
      Params:
        format = Units of the 'processed' and 'dropped' fields. Video sinks and video
          filters will use GST_FORMAT_BUFFERS (frames). Audio sinks and audio filters
          will likely use GST_FORMAT_DEFAULT (samples).
        processed = Total number of units correctly processed since the last state
          change to READY or a flushing operation.
        dropped = Total number of units dropped since the last state change to READY
          or a flushing operation.
  */
  void setQosStats(gst.types.Format format, ulong processed, ulong dropped)
  {
    gst_message_set_qos_stats(cast(GstMessage*)this._cPtr, format, processed, dropped);
  }

  /**
      Set the QoS values that have been calculated/analysed from the QoS data
      
      MT safe.
  
      Params:
        jitter = The difference of the running-time against the deadline.
        proportion = Long term prediction of the ideal rate relative to normal rate
          to get optimal quality.
        quality = An element dependent integer value that specifies the current
          quality level of the element. The default maximum quality is 1000000.
  */
  void setQosValues(long jitter, double proportion, int quality)
  {
    gst_message_set_qos_values(cast(GstMessage*)this._cPtr, jitter, proportion, quality);
  }

  /**
      Set the sequence number of a message.
      
      This function might be called by the creator of a message to indicate that
      the message relates to other messages or events. See [gst.message.Message.getSeqnum]
      for more information.
      
      MT safe.
  
      Params:
        seqnum = A sequence number.
  */
  void setSeqnum(uint seqnum)
  {
    gst_message_set_seqnum(cast(GstMessage*)this._cPtr, seqnum);
  }

  /**
      Configures the object handling the streaming thread. This is usually a
      GstTask object but other objects might be added in the future.
  
      Params:
        object = the object controlling the streaming
  */
  void setStreamStatusObject(gobject.value.Value object)
  {
    gst_message_set_stream_status_object(cast(GstMessage*)this._cPtr, object ? cast(const(GValue)*)object._cPtr(No.Dup) : null);
  }

  /**
      Adds the stream to the message.
  
      Params:
        stream = a #GstStream to add to message
  */
  void streamsSelectedAdd(gst.stream.Stream stream)
  {
    gst_message_streams_selected_add(cast(GstMessage*)this._cPtr, stream ? cast(GstStream*)stream._cPtr(No.Dup) : null);
  }

  /**
      Returns the number of streams contained in the message.
      Returns: The number of streams contained within.
  */
  uint streamsSelectedGetSize()
  {
    uint _retval;
    _retval = gst_message_streams_selected_get_size(cast(GstMessage*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the #GstStream with index index from the message.
  
      Params:
        idx = Index of the stream to retrieve
      Returns: A #GstStream
  */
  gst.stream.Stream streamsSelectedGetStream(uint idx)
  {
    GstStream* _cretval;
    _cretval = gst_message_streams_selected_get_stream(cast(GstMessage*)this._cPtr, idx);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.stream.Stream)(cast(GstStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a writable version of the structure.
      Returns: The structure of the message. The structure
        is still owned by the message, which means that you should not free
        it and that the pointer becomes invalid when you free the message.
        This function ensures that message is writable, and if so, will
        never return null.
        
        MT safe.
  */
  gst.structure.Structure writableStructure()
  {
    GstStructure* _cretval;
    _cretval = gst_message_writable_structure(cast(GstMessage*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
