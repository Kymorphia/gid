/// Module for [AppSrc] class
module gstapp.app_src;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gst.buffer;
import gst.buffer_list;
import gst.caps;
import gst.sample;
import gst.types;
import gst.urihandler;
import gst.urihandler_mixin;
import gstapp.c.functions;
import gstapp.c.types;
import gstapp.types;
import gstbase.base_src;

/**
    The appsrc element can be used by applications to insert data into a
    GStreamer pipeline. Unlike most GStreamer elements, appsrc provides
    external API functions.
    
    appsrc can be used by linking with the libgstapp library to access the
    methods directly or by using the appsrc action signals.
    
    Before operating appsrc, the caps property must be set to fixed caps
    describing the format of the data that will be pushed with appsrc. An
    exception to this is when pushing buffers with unknown caps, in which case no
    caps should be set. This is typically true of file-like sources that push raw
    byte buffers. If you don't want to explicitly set the caps, you can use
    gst_app_src_push_sample. This method gets the caps associated with the
    sample and sets them on the appsrc replacing any previously set caps (if
    different from sample's caps).
    
    The main way of handing data to the appsrc element is by calling the
    [gstapp.app_src.AppSrc.pushBuffer] method or by emitting the push-buffer action signal.
    This will put the buffer onto a queue from which appsrc will read from in its
    streaming thread. It is important to note that data transport will not happen
    from the thread that performed the push-buffer call.
    
    The "max-bytes", "max-buffers" and "max-time" properties control how much
    data can be queued in appsrc before appsrc considers the queue full. A
    filled internal queue will always signal the "enough-data" signal, which
    signals the application that it should stop pushing data into appsrc. The
    "block" property will cause appsrc to block the push-buffer method until
    free data becomes available again.
    
    When the internal queue is running out of data, the "need-data" signal is
    emitted, which signals the application that it should start pushing more data
    into appsrc.
    
    In addition to the "need-data" and "enough-data" signals, appsrc can emit the
    "seek-data" signal when the "stream-mode" property is set to "seekable" or
    "random-access". The signal argument will contain the new desired position in
    the stream expressed in the unit set with the "format" property. After
    receiving the seek-data signal, the application should push-buffers from the
    new position.
    
    These signals allow the application to operate the appsrc in two different
    ways:
    
    The push mode, in which the application repeatedly calls the push-buffer/push-sample
    method with a new buffer/sample. Optionally, the queue size in the appsrc
    can be controlled with the enough-data and need-data signals by respectively
    stopping/starting the push-buffer/push-sample calls. This is a typical
    mode of operation for the stream-type "stream" and "seekable". Use this
    mode when implementing various network protocols or hardware devices.
    
    The pull mode, in which the need-data signal triggers the next push-buffer call.
    This mode is typically used in the "random-access" stream-type. Use this
    mode for file access or other randomly accessible sources. In this mode, a
    buffer of exactly the amount of bytes given by the need-data signal should be
    pushed into appsrc.
    
    In all modes, the size property on appsrc should contain the total stream
    size in bytes. Setting this property is mandatory in the random-access mode.
    For the stream and seekable modes, setting this property is optional but
    recommended.
    
    When the application has finished pushing data into appsrc, it should call
    [gstapp.app_src.AppSrc.endOfStream] or emit the end-of-stream action signal. After
    this call, no more buffers can be pushed into appsrc until a flushing seek
    occurs or the state of the appsrc has gone through READY.
*/
class AppSrc : gstbase.base_src.BaseSrc, gst.urihandler.URIHandler
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
    return cast(void function())gst_app_src_get_type != &gidSymbolNotFound ? gst_app_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AppSrc self()
  {
    return this;
  }

  /**
      Get `block` property.
      Returns: When max-bytes are queued and after the enough-data signal has been emitted,
        block any further push-buffer calls until the amount of queued bytes drops
        below the max-bytes limit.
  */
  @property bool block()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("block");
  }

  /**
      Set `block` property.
      Params:
        propval = When max-bytes are queued and after the enough-data signal has been emitted,
          block any further push-buffer calls until the amount of queued bytes drops
          below the max-bytes limit.
  */
  @property void block(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("block", propval);
  }

  /**
      Get `caps` property.
      Returns: The GstCaps that will negotiated downstream and will be put
        on outgoing buffers.
  */
  @property gst.caps.Caps caps()
  {
    return getCaps();
  }

  /**
      Set `caps` property.
      Params:
        propval = The GstCaps that will negotiated downstream and will be put
          on outgoing buffers.
  */
  @property void caps(gst.caps.Caps propval)
  {
    return setCaps(propval);
  }

  /**
      Get `currentLevelBuffers` property.
      Returns: The number of currently queued buffers inside appsrc.
  */
  @property ulong currentLevelBuffers()
  {
    return getCurrentLevelBuffers();
  }

  /**
      Get `currentLevelBytes` property.
      Returns: The number of currently queued bytes inside appsrc.
  */
  @property ulong currentLevelBytes()
  {
    return getCurrentLevelBytes();
  }

  /**
      Get `currentLevelTime` property.
      Returns: The amount of currently queued time inside appsrc.
  */
  @property ulong currentLevelTime()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("current-level-time");
  }

  /**
      Get `duration` property.
      Returns: The total duration in nanoseconds of the data stream. If the total duration is known, it
        is recommended to configure it with this property.
  */
  @property ulong duration()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("duration");
  }

  /**
      Set `duration` property.
      Params:
        propval = The total duration in nanoseconds of the data stream. If the total duration is known, it
          is recommended to configure it with this property.
  */
  @property void duration(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("duration", propval);
  }

  /**
      Get `emitSignals` property.
      Returns: Make appsrc emit the "need-data", "enough-data" and "seek-data" signals.
        This option is by default enabled for backwards compatibility reasons but
        can disabled when needed because signal emission is expensive.
  */
  @property bool emitSignals()
  {
    return getEmitSignals();
  }

  /**
      Set `emitSignals` property.
      Params:
        propval = Make appsrc emit the "need-data", "enough-data" and "seek-data" signals.
          This option is by default enabled for backwards compatibility reasons but
          can disabled when needed because signal emission is expensive.
  */
  @property void emitSignals(bool propval)
  {
    return setEmitSignals(propval);
  }

  /**
      Get `format` property.
      Returns: The format to use for segment events. When the source is producing
        timestamped buffers this property should be set to GST_FORMAT_TIME.
  */
  @property gst.types.Format format()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.types.Format)("format");
  }

  /**
      Set `format` property.
      Params:
        propval = The format to use for segment events. When the source is producing
          timestamped buffers this property should be set to GST_FORMAT_TIME.
  */
  @property void format(gst.types.Format propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.types.Format)("format", propval);
  }

  /**
      Get `handleSegmentChange` property.
      Returns: When enabled, appsrc will check GstSegment in GstSample which was
        pushed via [gstapp.app_src.AppSrc.pushSample] or "push-sample" signal action.
        If a GstSegment is changed, corresponding segment event will be followed
        by next data flow.
        
        FIXME: currently only GST_FORMAT_TIME format is supported and therefore
        GstAppSrc::format should be time. However, possibly #GstAppSrc can support
        other formats.
  */
  @property bool handleSegmentChange()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("handle-segment-change");
  }

  /**
      Set `handleSegmentChange` property.
      Params:
        propval = When enabled, appsrc will check GstSegment in GstSample which was
          pushed via [gstapp.app_src.AppSrc.pushSample] or "push-sample" signal action.
          If a GstSegment is changed, corresponding segment event will be followed
          by next data flow.
          
          FIXME: currently only GST_FORMAT_TIME format is supported and therefore
          GstAppSrc::format should be time. However, possibly #GstAppSrc can support
          other formats.
  */
  @property void handleSegmentChange(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("handle-segment-change", propval);
  }

  /**
      Get `isLive` property.
      Returns: Instruct the source to behave like a live source. This includes that it
        will only push out buffers in the PLAYING state.
  */
  override @property bool isLive()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("is-live");
  }

  alias isLive = gstbase.base_src.BaseSrc.isLive;

  /**
      Set `isLive` property.
      Params:
        propval = Instruct the source to behave like a live source. This includes that it
          will only push out buffers in the PLAYING state.
  */
  @property void isLive(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("is-live", propval);
  }

  /**
      Get `leakyType` property.
      Returns: When set to any other value than GST_APP_LEAKY_TYPE_NONE then the appsrc
        will drop any buffers that are pushed into it once its internal queue is
        full. The selected type defines whether to drop the oldest or new
        buffers.
  */
  @property gstapp.types.AppLeakyType leakyType()
  {
    return getLeakyType();
  }

  /**
      Set `leakyType` property.
      Params:
        propval = When set to any other value than GST_APP_LEAKY_TYPE_NONE then the appsrc
          will drop any buffers that are pushed into it once its internal queue is
          full. The selected type defines whether to drop the oldest or new
          buffers.
  */
  @property void leakyType(gstapp.types.AppLeakyType propval)
  {
    return setLeakyType(propval);
  }

  /**
      Get `maxBuffers` property.
      Returns: The maximum amount of buffers that can be queued internally.
        After the maximum amount of buffers are queued, appsrc will emit the
        "enough-data" signal.
  */
  @property ulong maxBuffers()
  {
    return getMaxBuffers();
  }

  /**
      Set `maxBuffers` property.
      Params:
        propval = The maximum amount of buffers that can be queued internally.
          After the maximum amount of buffers are queued, appsrc will emit the
          "enough-data" signal.
  */
  @property void maxBuffers(ulong propval)
  {
    return setMaxBuffers(propval);
  }

  /**
      Get `maxBytes` property.
      Returns: The maximum amount of bytes that can be queued internally.
        After the maximum amount of bytes are queued, appsrc will emit the
        "enough-data" signal.
  */
  @property ulong maxBytes()
  {
    return getMaxBytes();
  }

  /**
      Set `maxBytes` property.
      Params:
        propval = The maximum amount of bytes that can be queued internally.
          After the maximum amount of bytes are queued, appsrc will emit the
          "enough-data" signal.
  */
  @property void maxBytes(ulong propval)
  {
    return setMaxBytes(propval);
  }

  /** */
  @property long maxLatency()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("max-latency");
  }

  /** */
  @property void maxLatency(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("max-latency", propval);
  }

  /**
      Get `maxTime` property.
      Returns: The maximum amount of time that can be queued internally.
        After the maximum amount of time are queued, appsrc will emit the
        "enough-data" signal.
  */
  @property ulong maxTime()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("max-time");
  }

  /**
      Set `maxTime` property.
      Params:
        propval = The maximum amount of time that can be queued internally.
          After the maximum amount of time are queued, appsrc will emit the
          "enough-data" signal.
  */
  @property void maxTime(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("max-time", propval);
  }

  /**
      Get `minLatency` property.
      Returns: The minimum latency of the source. A value of -1 will use the default
        latency calculations of #GstBaseSrc.
  */
  @property long minLatency()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("min-latency");
  }

  /**
      Set `minLatency` property.
      Params:
        propval = The minimum latency of the source. A value of -1 will use the default
          latency calculations of #GstBaseSrc.
  */
  @property void minLatency(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("min-latency", propval);
  }

  /**
      Get `minPercent` property.
      Returns: Make appsrc emit the "need-data" signal when the amount of bytes in the
        queue drops below this percentage of max-bytes.
  */
  @property uint minPercent()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("min-percent");
  }

  /**
      Set `minPercent` property.
      Params:
        propval = Make appsrc emit the "need-data" signal when the amount of bytes in the
          queue drops below this percentage of max-bytes.
  */
  @property void minPercent(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("min-percent", propval);
  }

  /**
      Get `size` property.
      Returns: The total size in bytes of the data stream. If the total size is known, it
        is recommended to configure it with this property.
  */
  @property long size()
  {
    return getSize();
  }

  /**
      Set `size` property.
      Params:
        propval = The total size in bytes of the data stream. If the total size is known, it
          is recommended to configure it with this property.
  */
  @property void size(long propval)
  {
    return setSize(propval);
  }

  /**
      Get `streamType` property.
      Returns: The type of stream that this source is producing.  For seekable streams the
        application should connect to the seek-data signal.
  */
  @property gstapp.types.AppStreamType streamType()
  {
    return getStreamType();
  }

  /**
      Set `streamType` property.
      Params:
        propval = The type of stream that this source is producing.  For seekable streams the
          application should connect to the seek-data signal.
  */
  @property void streamType(gstapp.types.AppStreamType propval)
  {
    return setStreamType(propval);
  }

  mixin URIHandlerT!();

  /**
      Indicates to the appsrc element that the last buffer queued in the
      element is the last buffer of the stream.
      Returns: #GST_FLOW_OK when the EOS was successfully queued.
        #GST_FLOW_FLUSHING when appsrc is not PAUSED or PLAYING.
  */
  gst.types.FlowReturn endOfStream()
  {
    GstFlowReturn _cretval;
    _cretval = gst_app_src_end_of_stream(cast(GstAppSrc*)this._cPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Get the configured caps on appsrc.
      Returns: the #GstCaps produced by the source. gst_caps_unref() after usage.
  */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_app_src_get_caps(cast(GstAppSrc*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the number of currently queued buffers inside appsrc.
      Returns: The number of currently queued buffers.
  */
  ulong getCurrentLevelBuffers()
  {
    ulong _retval;
    _retval = gst_app_src_get_current_level_buffers(cast(GstAppSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of currently queued bytes inside appsrc.
      Returns: The number of currently queued bytes.
  */
  ulong getCurrentLevelBytes()
  {
    ulong _retval;
    _retval = gst_app_src_get_current_level_bytes(cast(GstAppSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the amount of currently queued time inside appsrc.
      Returns: The amount of currently queued time.
  */
  gst.types.ClockTime getCurrentLevelTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_app_src_get_current_level_time(cast(GstAppSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the duration of the stream in nanoseconds. A value of GST_CLOCK_TIME_NONE means that the duration is
      not known.
      Returns: the duration of the stream previously set with [gstapp.app_src.AppSrc.setDuration];
  */
  gst.types.ClockTime getDuration()
  {
    gst.types.ClockTime _retval;
    _retval = gst_app_src_get_duration(cast(GstAppSrc*)this._cPtr);
    return _retval;
  }

  /**
      Check if appsrc will emit the "new-preroll" and "new-buffer" signals.
      Returns: true if appsrc is emitting the "new-preroll" and "new-buffer"
        signals.
  */
  bool getEmitSignals()
  {
    bool _retval;
    _retval = cast(bool)gst_app_src_get_emit_signals(cast(GstAppSrc*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the min and max latencies in min and max respectively.
  
      Params:
        min = the min latency
        max = the max latency
  */
  void getLatency(out ulong min, out ulong max)
  {
    gst_app_src_get_latency(cast(GstAppSrc*)this._cPtr, cast(ulong*)&min, cast(ulong*)&max);
  }

  /**
      Returns the currently set #GstAppLeakyType. See [gstapp.app_src.AppSrc.setLeakyType]
      for more details.
      Returns: The currently set #GstAppLeakyType.
  */
  gstapp.types.AppLeakyType getLeakyType()
  {
    GstAppLeakyType _cretval;
    _cretval = gst_app_src_get_leaky_type(cast(GstAppSrc*)this._cPtr);
    gstapp.types.AppLeakyType _retval = cast(gstapp.types.AppLeakyType)_cretval;
    return _retval;
  }

  /**
      Get the maximum amount of buffers that can be queued in appsrc.
      Returns: The maximum amount of buffers that can be queued.
  */
  ulong getMaxBuffers()
  {
    ulong _retval;
    _retval = gst_app_src_get_max_buffers(cast(GstAppSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the maximum amount of bytes that can be queued in appsrc.
      Returns: The maximum amount of bytes that can be queued.
  */
  ulong getMaxBytes()
  {
    ulong _retval;
    _retval = gst_app_src_get_max_bytes(cast(GstAppSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the maximum amount of time that can be queued in appsrc.
      Returns: The maximum amount of time that can be queued.
  */
  gst.types.ClockTime getMaxTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_app_src_get_max_time(cast(GstAppSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the size of the stream in bytes. A value of -1 means that the size is
      not known.
      Returns: the size of the stream previously set with [gstapp.app_src.AppSrc.setSize];
  */
  long getSize()
  {
    long _retval;
    _retval = gst_app_src_get_size(cast(GstAppSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the stream type. Control the stream type of appsrc
      with [gstapp.app_src.AppSrc.setStreamType].
      Returns: the stream type.
  */
  gstapp.types.AppStreamType getStreamType()
  {
    GstAppStreamType _cretval;
    _cretval = gst_app_src_get_stream_type(cast(GstAppSrc*)this._cPtr);
    gstapp.types.AppStreamType _retval = cast(gstapp.types.AppStreamType)_cretval;
    return _retval;
  }

  /**
      Adds a buffer to the queue of buffers that the appsrc element will
      push to its source pad.  This function takes ownership of the buffer.
      
      When the block property is TRUE, this function can block until free
      space becomes available in the queue.
  
      Params:
        buffer = a #GstBuffer to push
      Returns: #GST_FLOW_OK when the buffer was successfully queued.
        #GST_FLOW_FLUSHING when appsrc is not PAUSED or PLAYING.
        #GST_FLOW_EOS when EOS occurred.
  */
  gst.types.FlowReturn pushBuffer(gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    _cretval = gst_app_src_push_buffer(cast(GstAppSrc*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Adds a buffer list to the queue of buffers and buffer lists that the
      appsrc element will push to its source pad.  This function takes ownership
      of buffer_list.
      
      When the block property is TRUE, this function can block until free
      space becomes available in the queue.
  
      Params:
        bufferList = a #GstBufferList to push
      Returns: #GST_FLOW_OK when the buffer list was successfully queued.
        #GST_FLOW_FLUSHING when appsrc is not PAUSED or PLAYING.
        #GST_FLOW_EOS when EOS occurred.
  */
  gst.types.FlowReturn pushBufferList(gst.buffer_list.BufferList bufferList)
  {
    GstFlowReturn _cretval;
    _cretval = gst_app_src_push_buffer_list(cast(GstAppSrc*)this._cPtr, bufferList ? cast(GstBufferList*)bufferList._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Extract a buffer from the provided sample and adds it to the queue of
      buffers that the appsrc element will push to its source pad. Any
      previous caps that were set on appsrc will be replaced by the caps
      associated with the sample if not equal.
      
      This function does not take ownership of the
      sample so the sample needs to be unreffed after calling this function.
      
      When the block property is TRUE, this function can block until free
      space becomes available in the queue.
  
      Params:
        sample = a #GstSample from which buffer and caps may be
          extracted
      Returns: #GST_FLOW_OK when the buffer was successfully queued.
        #GST_FLOW_FLUSHING when appsrc is not PAUSED or PLAYING.
        #GST_FLOW_EOS when EOS occurred.
  */
  gst.types.FlowReturn pushSample(gst.sample.Sample sample)
  {
    GstFlowReturn _cretval;
    _cretval = gst_app_src_push_sample(cast(GstAppSrc*)this._cPtr, sample ? cast(GstSample*)sample._cPtr(No.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  alias setCaps = gstbase.base_src.BaseSrc.setCaps;

  /**
      Set the capabilities on the appsrc element.  This function takes
      a copy of the caps structure. After calling this method, the source will
      only produce caps that match caps. caps must be fixed and the caps on the
      buffers must match the caps or left NULL.
  
      Params:
        caps = caps to set
  */
  void setCaps(gst.caps.Caps caps = null)
  {
    gst_app_src_set_caps(cast(GstAppSrc*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
  }

  /**
      Set the duration of the stream in nanoseconds. A value of GST_CLOCK_TIME_NONE means that the duration is
      not known.
  
      Params:
        duration = the duration to set
  */
  void setDuration(gst.types.ClockTime duration)
  {
    gst_app_src_set_duration(cast(GstAppSrc*)this._cPtr, duration);
  }

  /**
      Make appsrc emit the "new-preroll" and "new-buffer" signals. This option is
      by default disabled because signal emission is expensive and unneeded when
      the application prefers to operate in pull mode.
  
      Params:
        emit = the new state
  */
  void setEmitSignals(bool emit)
  {
    gst_app_src_set_emit_signals(cast(GstAppSrc*)this._cPtr, emit);
  }

  /**
      Configure the min and max latency in src. If min is set to -1, the
      default latency calculations for pseudo-live sources will be used.
  
      Params:
        min = the min latency
        max = the max latency
  */
  void setLatency(ulong min, ulong max)
  {
    gst_app_src_set_latency(cast(GstAppSrc*)this._cPtr, min, max);
  }

  /**
      When set to any other value than GST_APP_LEAKY_TYPE_NONE then the appsrc
      will drop any buffers that are pushed into it once its internal queue is
      full. The selected type defines whether to drop the oldest or new
      buffers.
  
      Params:
        leaky = the #GstAppLeakyType
  */
  void setLeakyType(gstapp.types.AppLeakyType leaky)
  {
    gst_app_src_set_leaky_type(cast(GstAppSrc*)this._cPtr, leaky);
  }

  /**
      Set the maximum amount of buffers that can be queued in appsrc.
      After the maximum amount of buffers are queued, appsrc will emit the
      "enough-data" signal.
  
      Params:
        max = the maximum number of buffers to queue
  */
  void setMaxBuffers(ulong max)
  {
    gst_app_src_set_max_buffers(cast(GstAppSrc*)this._cPtr, max);
  }

  /**
      Set the maximum amount of bytes that can be queued in appsrc.
      After the maximum amount of bytes are queued, appsrc will emit the
      "enough-data" signal.
  
      Params:
        max = the maximum number of bytes to queue
  */
  void setMaxBytes(ulong max)
  {
    gst_app_src_set_max_bytes(cast(GstAppSrc*)this._cPtr, max);
  }

  /**
      Set the maximum amount of time that can be queued in appsrc.
      After the maximum amount of time are queued, appsrc will emit the
      "enough-data" signal.
  
      Params:
        max = the maximum amonut of time to queue
  */
  void setMaxTime(gst.types.ClockTime max)
  {
    gst_app_src_set_max_time(cast(GstAppSrc*)this._cPtr, max);
  }

  /**
      Set the size of the stream in bytes. A value of -1 means that the size is
      not known.
  
      Params:
        size = the size to set
  */
  void setSize(long size)
  {
    gst_app_src_set_size(cast(GstAppSrc*)this._cPtr, size);
  }

  /**
      Set the stream type on appsrc. For seekable streams, the "seek" signal must
      be connected to.
      
      A stream_type stream
  
      Params:
        type = the new state
  */
  void setStreamType(gstapp.types.AppStreamType type)
  {
    gst_app_src_set_stream_type(cast(GstAppSrc*)this._cPtr, type);
  }

  /**
      Connect to `EndOfStream` signal.
  
      Notify appsrc that no more buffer are available.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gst.types.FlowReturn callback(gstapp.app_src.AppSrc appSrc))
  
          `appSrc` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEndOfStream(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == gst.types.FlowReturn)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstapp.app_src.AppSrc)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gst.types.FlowReturn)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("end-of-stream", closure, after);
  }

  /**
      Connect to `EnoughData` signal.
  
      Signal that the source has enough data. It is recommended that the
        application stops calling push-buffer until the need-data signal is
        emitted again to avoid excessive buffer queueing.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstapp.app_src.AppSrc appSrc))
  
          `appSrc` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEnoughData(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstapp.app_src.AppSrc)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enough-data", closure, after);
  }

  /**
      Connect to `NeedData` signal.
  
      Signal that the source needs more data. In the callback or from another
        thread you should call push-buffer or end-of-stream.
        
        length is just a hint and when it is set to -1, any number of bytes can be
        pushed into appsrc.
        
        You can call push-buffer multiple times until the enough-data signal is
        fired.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint length, gstapp.app_src.AppSrc appSrc))
  
          `length` the amount of bytes needed. (optional)
  
          `appSrc` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNeedData(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstapp.app_src.AppSrc)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("need-data", closure, after);
  }

  /**
      Connect to `PushBuffer` signal.
  
      Adds a buffer to the queue of buffers that the appsrc element will
        push to its source pad.
        
        This function does not take ownership of the buffer, but it takes a
        reference so the buffer can be unreffed at any time after calling this
        function.
        
        When the block property is TRUE, this function can block until free space
        becomes available in the queue.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gst.types.FlowReturn callback(gst.buffer.Buffer buffer, gstapp.app_src.AppSrc appSrc))
  
          `buffer` a buffer to push (optional)
  
          `appSrc` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPushBuffer(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == gst.types.FlowReturn)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gst.buffer.Buffer)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstapp.app_src.AppSrc)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gst.types.FlowReturn)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("push-buffer", closure, after);
  }

  /**
      Connect to `PushBufferList` signal.
  
      Adds a buffer list to the queue of buffers and buffer lists that the
        appsrc element will push to its source pad.
        
        This function does not take ownership of the buffer list, but it takes a
        reference so the buffer list can be unreffed at any time after calling
        this function.
        
        When the block property is TRUE, this function can block until free space
        becomes available in the queue.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gst.types.FlowReturn callback(gst.buffer_list.BufferList bufferList, gstapp.app_src.AppSrc appSrc))
  
          `bufferList` a buffer list to push (optional)
  
          `appSrc` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPushBufferList(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == gst.types.FlowReturn)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gst.buffer_list.BufferList)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstapp.app_src.AppSrc)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gst.types.FlowReturn)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("push-buffer-list", closure, after);
  }

  /**
      Connect to `PushSample` signal.
  
      Extract a buffer from the provided sample and adds the extracted buffer
        to the queue of buffers that the appsrc element will
        push to its source pad. This function set the appsrc caps based on the caps
        in the sample and reset the caps if they change.
        Only the caps and the buffer of the provided sample are used and not
        for example the segment in the sample.
        
        This function does not take ownership of the sample, but it takes a
        reference so the sample can be unreffed at any time after calling this
        function.
        
        When the block property is TRUE, this function can block until free space
        becomes available in the queue.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gst.types.FlowReturn callback(gst.sample.Sample sample, gstapp.app_src.AppSrc appSrc))
  
          `sample` a sample from which extract buffer to push (optional)
  
          `appSrc` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPushSample(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == gst.types.FlowReturn)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gst.sample.Sample)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstapp.app_src.AppSrc)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gst.types.FlowReturn)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("push-sample", closure, after);
  }

  /**
      Connect to `SeekData` signal.
  
      Seek to the given offset. The next push-buffer should produce buffers from
        the new offset.
        This callback is only called for seekable stream types.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(ulong offset, gstapp.app_src.AppSrc appSrc))
  
          `offset` the offset to seek to (optional)
  
          `appSrc` the instance the signal is connected to (optional)
  
          `Returns` true if the seek succeeded.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSeekData(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == ulong)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstapp.app_src.AppSrc)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("seek-data", closure, after);
  }
}
