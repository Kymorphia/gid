/// Module for [Event] class
module gst.event;

import gid.gid;
import glib.types;
import gobject.boxed;
import gst.buffer;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.message;
import gst.mini_object;
import gst.segment;
import gst.stream;
import gst.stream_collection;
import gst.structure;
import gst.tag_list;
import gst.toc;
import gst.types;

/**
    The event class provides factory methods to construct events for sending
    and functions to query (parse) received events.
    
    Events are usually created with gst_event_new_*() which takes event-type
    specific parameters as arguments.
    To send an event application will usually use [gst.element.Element.sendEvent] and
    elements will use [gst.pad.Pad.sendEvent] or [gst.pad.Pad.pushEvent].
    The event should be unreffed with gst_event_unref() if it has not been sent.
    
    Events that have been received can be parsed with their respective
    gst_event_parse_*() functions. It is valid to pass null for unwanted details.
    
    Events are passed between elements in parallel to the data stream. Some events
    are serialized with buffers, others are not. Some events only travel downstream,
    others only upstream. Some events can travel both upstream and downstream.
    
    The events are used to signal special conditions in the datastream such as
    EOS (end of stream) or the start of a new stream-segment.
    Events are also used to flush the pipeline of any pending data.
    
    Most of the event API is used inside plugins. Applications usually only
    construct and use seek events.
    To do that [gst.event.Event.newSeek] is used to create a seek event. It takes
    the needed parameters to specify seeking time and mode.
    ```c
      GstEvent *event;
      gboolean result;
      ...
      // construct a seek event to play the media from second 2 to 5, flush
      // the pipeline to decrease latency.
      event = gst_event_new_seek (1.0,
         GST_FORMAT_TIME,
         GST_SEEK_FLAG_FLUSH,
         GST_SEEK_TYPE_SET, 2 * GST_SECOND,
         GST_SEEK_TYPE_SET, 5 * GST_SECOND);
      ...
      result = gst_element_send_event (pipeline, event);
      if (!result)
        g_warning ("seek failed");
      ...
    ```
*/
class Event : gobject.boxed.Boxed
{

  /**
      Create a `event.Event` boxed type.
      Params:
        type = the #GstEventType of the event
        timestamp = the timestamp of the event
        seqnum = the sequence number of the event
  */
  this(gst.types.EventType type = gst.types.EventType.init, ulong timestamp = ulong.init, uint seqnum = uint.init)
  {
    super(gMalloc(GstEvent.sizeof), Yes.Take);
    this.type = type;
    this.timestamp = timestamp;
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
    return cast(void function())gst_event_get_type != &gidSymbolNotFound ? gst_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Event self()
  {
    return this;
  }

  /**
      Get `miniObject` field.
      Returns: the parent structure
  */
  @property gst.mini_object.MiniObject miniObject()
  {
    return cToD!(gst.mini_object.MiniObject)(cast(void*)&(cast(GstEvent*)this._cPtr).miniObject);
  }

  /**
      Get `type` field.
      Returns: the #GstEventType of the event
  */
  @property gst.types.EventType type()
  {
    return cast(gst.types.EventType)(cast(GstEvent*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the #GstEventType of the event
  */
  @property void type(gst.types.EventType propval)
  {
    (cast(GstEvent*)this._cPtr).type = cast(GstEventType)propval;
  }

  /**
      Get `timestamp` field.
      Returns: the timestamp of the event
  */
  @property ulong timestamp()
  {
    return (cast(GstEvent*)this._cPtr).timestamp;
  }

  /**
      Set `timestamp` field.
      Params:
        propval = the timestamp of the event
  */
  @property void timestamp(ulong propval)
  {
    (cast(GstEvent*)this._cPtr).timestamp = propval;
  }

  /**
      Get `seqnum` field.
      Returns: the sequence number of the event
  */
  @property uint seqnum()
  {
    return (cast(GstEvent*)this._cPtr).seqnum;
  }

  /**
      Set `seqnum` field.
      Params:
        propval = the sequence number of the event
  */
  @property void seqnum(uint propval)
  {
    (cast(GstEvent*)this._cPtr).seqnum = propval;
  }

  /**
      Create a new buffersize event. The event is sent downstream and notifies
      elements that they should provide a buffer of the specified dimensions.
      
      When the async flag is set, a thread boundary is preferred.
  
      Params:
        format = buffer format
        minsize = minimum buffer size
        maxsize = maximum buffer size
        async = thread behavior
      Returns: a new #GstEvent
  */
  static gst.event.Event newBufferSize(gst.types.Format format, long minsize, long maxsize, bool async)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_buffer_size(format, minsize, maxsize, async);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new CAPS event for caps. The caps event can only travel downstream
      synchronized with the buffer flow and contains the format of the buffers
      that will follow after the event.
  
      Params:
        caps = a #GstCaps
      Returns: the new CAPS event.
  */
  static gst.event.Event newCaps(gst.caps.Caps caps)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_caps(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new custom-typed event. This can be used for anything not
      handled by other event-specific functions to pass an event to another
      element.
      
      Make sure to allocate an event type with the #GST_EVENT_MAKE_TYPE macro,
      assigning a free number and filling in the correct direction and
      serialization flags.
      
      New custom events can also be created by subclassing the event type if
      needed.
  
      Params:
        type = The type of the new event
        structure = the structure for the event. The event will
              take ownership of the structure.
      Returns: the new custom event.
  */
  static gst.event.Event newCustom(gst.types.EventType type, gst.structure.Structure structure)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_custom(type, structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new EOS event. The eos event can only travel downstream
      synchronized with the buffer flow. Elements that receive the EOS
      event on a pad can return #GST_FLOW_EOS as a #GstFlowReturn
      when data after the EOS event arrives.
      
      The EOS event will travel down to the sink elements in the pipeline
      which will then post the #GST_MESSAGE_EOS on the bus after they have
      finished playing any buffered data.
      
      When all sinks have posted an EOS message, an EOS message is
      forwarded to the application.
      
      The EOS event itself will not cause any state transitions of the pipeline.
      Returns: the new EOS event.
  */
  static gst.event.Event newEos()
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_eos();
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allocate a new flush start event. The flush start event can be sent
      upstream and downstream and travels out-of-bounds with the dataflow.
      
      It marks pads as being flushing and will make them return
      #GST_FLOW_FLUSHING when used for data flow with [gst.pad.Pad.push],
      [gst.pad.Pad.chain], [gst.pad.Pad.getRange] and [gst.pad.Pad.pullRange].
      Any event (except a #GST_EVENT_FLUSH_STOP) received
      on a flushing pad will return false immediately.
      
      Elements should unlock any blocking functions and exit their streaming
      functions as fast as possible when this event is received.
      
      This event is typically generated after a seek to flush out all queued data
      in the pipeline so that the new media is played as soon as possible.
      Returns: a new flush start event.
  */
  static gst.event.Event newFlushStart()
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_flush_start();
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allocate a new flush stop event. The flush stop event can be sent
      upstream and downstream and travels serialized with the dataflow.
      It is typically sent after sending a FLUSH_START event to make the
      pads accept data again.
      
      Elements can process this event synchronized with the dataflow since
      the preceding FLUSH_START event stopped the dataflow.
      
      This event is typically generated to complete a seek and to resume
      dataflow.
  
      Params:
        resetTime = if time should be reset
      Returns: a new flush stop event.
  */
  static gst.event.Event newFlushStop(bool resetTime)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_flush_stop(resetTime);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new GAP event. A gap event can be thought of as conceptually
      equivalent to a buffer to signal that there is no data for a certain
      amount of time. This is useful to signal a gap to downstream elements
      which may wait for data, such as muxers or mixers or overlays, especially
      for sparse streams such as subtitle streams.
  
      Params:
        timestamp = the start time (pts) of the gap
        duration = the duration of the gap
      Returns: the new GAP event.
  */
  static gst.event.Event newGap(gst.types.ClockTime timestamp, gst.types.ClockTime duration)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_gap(timestamp, duration);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new instant-rate-change event. This event is sent by seek
      handlers (e.g. demuxers) when receiving a seek with the
      [gst.types.SeekFlags.InstantRateChange] and signals to downstream elements that
      the playback rate in the existing segment should be immediately multiplied
      by the rate_multiplier factor.
      
      The flags provided replace any flags in the existing segment, for the
      flags within the [gst.types.SEGMENT_INSTANT_FLAGS] set. Other GstSegmentFlags
      are ignored and not transferred in the event.
  
      Params:
        rateMultiplier = the multiplier to be applied to the playback rate
        newFlags = A new subset of segment flags to replace in segments
      Returns: the new instant-rate-change event.
  */
  static gst.event.Event newInstantRateChange(double rateMultiplier, gst.types.SegmentFlags newFlags)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_instant_rate_change(rateMultiplier, newFlags);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new instant-rate-sync-time event. This event is sent by the
      pipeline to notify elements handling the instant-rate-change event about
      the running-time when the new rate should be applied. The running time
      may be in the past when elements handle this event, which can lead to
      switching artifacts. The magnitude of those depends on the exact timing
      of event delivery to each element and the magnitude of the change in
      playback rate being applied.
      
      The running_time and upstream_running_time are the same if this
      is the first instant-rate adjustment, but will differ for later ones
      to compensate for the accumulated offset due to playing at a rate
      different to the one indicated in the playback segments.
  
      Params:
        rateMultiplier = the new playback rate multiplier to be applied
        runningTime = Running time when the rate change should be applied
        upstreamRunningTime = The upstream-centric running-time when the
             rate change should be applied.
      Returns: the new instant-rate-sync-time event.
  */
  static gst.event.Event newInstantRateSyncTime(double rateMultiplier, gst.types.ClockTime runningTime, gst.types.ClockTime upstreamRunningTime)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_instant_rate_sync_time(rateMultiplier, runningTime, upstreamRunningTime);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new latency event. The event is sent upstream from the sinks and
      notifies elements that they should add an additional latency to the
      running time before synchronising against the clock.
      
      The latency is mostly used in live sinks and is always expressed in
      the time format.
  
      Params:
        latency = the new latency value
      Returns: a new #GstEvent
  */
  static gst.event.Event newLatency(gst.types.ClockTime latency)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_latency(latency);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new navigation event from the given description.
  
      Params:
        structure = description of the event. The event will take
              ownership of the structure. See #GstNavigation for more specific
              constructors.
      Returns: a new #GstEvent
  */
  static gst.event.Event newNavigation(gst.structure.Structure structure)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_navigation(structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new event containing information specific to a particular
      protection system (uniquely identified by system_id), by which that
      protection system can acquire key(s) to decrypt a protected stream.
      
      In order for a decryption element to decrypt media
      protected using a specific system, it first needs all the
      protection system specific information necessary to acquire the decryption
      key(s) for that stream. The functions defined here enable this information
      to be passed in events from elements that extract it
      (e.g., ISOBMFF demuxers, MPEG DASH demuxers) to protection decrypter
      elements that use it.
      
      Events containing protection system specific information are created using
      #gst_event_new_protection, and they can be parsed by downstream elements
      using #gst_event_parse_protection.
      
      In Common Encryption, protection system specific information may be located
      within ISOBMFF files, both in movie (moov) boxes and movie fragment (moof)
      boxes; it may also be contained in ContentProtection elements within MPEG
      DASH MPDs. The events created by #gst_event_new_protection contain data
      identifying from which of these locations the encapsulated protection system
      specific information originated. This origin information is required as
      some protection systems use different encodings depending upon where the
      information originates.
      
      The events returned by [gst.event.Event.newProtection] are implemented
      in such a way as to ensure that the most recently-pushed protection info
      event of a particular origin and system_id will
      be stuck to the output pad of the sending element.
  
      Params:
        systemId = a string holding a UUID that uniquely
          identifies a protection system.
        data = a #GstBuffer holding protection system specific
          information. The reference count of the buffer will be incremented by one.
        origin = a string indicating where the protection
          information carried in the event was extracted from. The allowed values
          of this string will depend upon the protection scheme.
      Returns: a #GST_EVENT_PROTECTION event.
  */
  static gst.event.Event newProtection(string systemId, gst.buffer.Buffer data, string origin)
  {
    GstEvent* _cretval;
    const(char)* _systemId = systemId.toCString(No.Alloc);
    const(char)* _origin = origin.toCString(No.Alloc);
    _cretval = gst_event_new_protection(_systemId, data ? cast(GstBuffer*)data._cPtr(No.Dup) : null, _origin);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allocate a new qos event with the given values.
      The QOS event is generated in an element that wants an upstream
      element to either reduce or increase its rate because of
      high/low CPU load or other resource usage such as network performance or
      throttling. Typically sinks generate these events for each buffer
      they receive.
      
      type indicates the reason for the QoS event. #GST_QOS_TYPE_OVERFLOW is
      used when a buffer arrived in time or when the sink cannot keep up with
      the upstream datarate. #GST_QOS_TYPE_UNDERFLOW is when the sink is not
      receiving buffers fast enough and thus has to drop late buffers.
      #GST_QOS_TYPE_THROTTLE is used when the datarate is artificially limited
      by the application, for example to reduce power consumption.
      
      proportion indicates the real-time performance of the streaming in the
      element that generated the QoS event (usually the sink). The value is
      generally computed based on more long term statistics about the streams
      timestamps compared to the clock.
      A value < 1.0 indicates that the upstream element is producing data faster
      than real-time. A value > 1.0 indicates that the upstream element is not
      producing data fast enough. 1.0 is the ideal proportion value. The
      proportion value can safely be used to lower or increase the quality of
      the element.
      
      diff is the difference against the clock in running time of the last
      buffer that caused the element to generate the QOS event. A negative value
      means that the buffer with timestamp arrived in time. A positive value
      indicates how late the buffer with timestamp was. When throttling is
      enabled, diff will be set to the requested throttling interval.
      
      timestamp is the timestamp of the last buffer that cause the element
      to generate the QOS event. It is expressed in running time and thus an ever
      increasing value.
      
      The upstream element can use the diff and timestamp values to decide
      whether to process more buffers. For positive diff, all buffers with
      timestamp <= timestamp + diff will certainly arrive late in the sink
      as well. A (negative) diff value so that timestamp + diff would yield a
      result smaller than 0 is not allowed.
      
      The application can use general event probes to intercept the QoS
      event and implement custom application specific QoS handling.
  
      Params:
        type = the QoS type
        proportion = the proportion of the qos message
        diff = The time difference of the last Clock sync
        timestamp = The timestamp of the buffer
      Returns: a new QOS event.
  */
  static gst.event.Event newQos(gst.types.QOSType type, double proportion, gst.types.ClockTimeDiff diff, gst.types.ClockTime timestamp)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_qos(type, proportion, diff, timestamp);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new reconfigure event. The purpose of the reconfigure event is
      to travel upstream and make elements renegotiate their caps or reconfigure
      their buffer pools. This is useful when changing properties on elements
      or changing the topology of the pipeline.
      Returns: a new #GstEvent
  */
  static gst.event.Event newReconfigure()
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_reconfigure();
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allocate a new seek event with the given parameters.
      
      The seek event configures playback of the pipeline between start to stop
      at the speed given in rate, also called a playback segment.
      The start and stop values are expressed in format.
      
      A rate of 1.0 means normal playback rate, 2.0 means double speed.
      Negatives values means backwards playback. A value of 0.0 for the
      rate is not allowed and should be accomplished instead by PAUSING the
      pipeline.
      
      A pipeline has a default playback segment configured with a start
      position of 0, a stop position of -1 and a rate of 1.0. The currently
      configured playback segment can be queried with #GST_QUERY_SEGMENT.
      
      start_type and stop_type specify how to adjust the currently configured
      start and stop fields in playback segment. Adjustments can be made relative
      or absolute to the last configured values. A type of #GST_SEEK_TYPE_NONE
      means that the position should not be updated.
      
      When the rate is positive and start has been updated, playback will start
      from the newly configured start position.
      
      For negative rates, playback will start from the newly configured stop
      position (if any). If the stop position is updated, it must be different from
      -1 (#GST_CLOCK_TIME_NONE) for negative rates.
      
      It is not possible to seek relative to the current playback position, to do
      this, PAUSE the pipeline, query the current playback position with
      #GST_QUERY_POSITION and update the playback segment current position with a
      #GST_SEEK_TYPE_SET to the desired position.
  
      Params:
        rate = The new playback rate
        format = The format of the seek values
        flags = The optional seek flags
        startType = The type and flags for the new start position
        start = The value of the new start position
        stopType = The type and flags for the new stop position
        stop = The value of the new stop position
      Returns: a new seek event.
  */
  static gst.event.Event newSeek(double rate, gst.types.Format format, gst.types.SeekFlags flags, gst.types.SeekType startType, long start, gst.types.SeekType stopType, long stop)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_seek(rate, format, flags, startType, start, stopType, stop);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new SEGMENT event for segment. The segment event can only travel
      downstream synchronized with the buffer flow and contains timing information
      and playback properties for the buffers that will follow.
      
      The segment event marks the range of buffers to be processed. All
      data not within the segment range is not to be processed. This can be
      used intelligently by plugins to apply more efficient methods of skipping
      unneeded data. The valid range is expressed with the start and stop
      values.
      
      The time value of the segment is used in conjunction with the start
      value to convert the buffer timestamps into the stream time. This is
      usually done in sinks to report the current stream_time.
      time represents the stream_time of a buffer carrying a timestamp of
      start. time cannot be -1.
      
      start cannot be -1, stop can be -1. If there
      is a valid stop given, it must be greater or equal the start, including
      when the indicated playback rate is < 0.
      
      The applied_rate value provides information about any rate adjustment that
      has already been made to the timestamps and content on the buffers of the
      stream. (rate * applied_rate) should always equal the rate that has been
      requested for playback. For example, if an element has an input segment
      with intended playback rate of 2.0 and applied_rate of 1.0, it can adjust
      incoming timestamps and buffer content by half and output a segment event
      with rate of 1.0 and applied_rate of 2.0
      
      After a segment event, the buffer stream time is calculated with:
      
        time + (TIMESTAMP(buf) - start) * ABS (rate * applied_rate)
  
      Params:
        segment = a #GstSegment
      Returns: the new SEGMENT event.
  */
  static gst.event.Event newSegment(gst.segment.Segment segment)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_segment(cast(const(GstSegment)*)&segment);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new segment-done event. This event is sent by elements that
      finish playback of a segment as a result of a segment seek.
  
      Params:
        format = The format of the position being done
        position = The position of the segment being done
      Returns: a new #GstEvent
  */
  static gst.event.Event newSegmentDone(gst.types.Format format, long position)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_segment_done(format, position);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allocate a new select-streams event.
      
      The select-streams event requests the specified streams to be activated.
      
      The list of streams corresponds to the "Stream ID" of each stream to be
      activated. Those ID can be obtained via the #GstStream objects present
      in #GST_EVENT_STREAM_START, #GST_EVENT_STREAM_COLLECTION or
      #GST_MESSAGE_STREAM_COLLECTION.
      
      Note: The list of streams can not be empty.
  
      Params:
        streams = the list of streams to
          activate
      Returns: a new select-streams event.
  */
  static gst.event.Event newSelectStreams(string[] streams)
  {
    GstEvent* _cretval;
    auto _streams = gListFromD!(string)(streams);
    scope(exit) containerFree!(GList*, string, GidOwnership.None)(_streams);
    _cretval = gst_event_new_select_streams(_streams);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new sink-message event. The purpose of the sink-message event is
      to instruct a sink to post the message contained in the event synchronized
      with the stream.
      
      name is used to store multiple sticky events on one pad.
  
      Params:
        name = a name for the event
        msg = the #GstMessage to be posted
      Returns: a new #GstEvent
  */
  static gst.event.Event newSinkMessage(string name, gst.message.Message msg)
  {
    GstEvent* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_event_new_sink_message(_name, msg ? cast(GstMessage*)msg._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new step event. The purpose of the step event is to instruct a sink
      to skip amount (expressed in format) of media. It can be used to implement
      stepping through the video frame by frame or for doing fast trick modes.
      
      A rate of <= 0.0 is not allowed. Pause the pipeline, for the effect of rate
      = 0.0 or first reverse the direction of playback using a seek event to get
      the same effect as rate < 0.0.
      
      The flush flag will clear any pending data in the pipeline before starting
      the step operation.
      
      The intermediate flag instructs the pipeline that this step operation is
      part of a larger step operation.
  
      Params:
        format = the format of amount
        amount = the amount of data to step
        rate = the step rate
        flush = flushing steps
        intermediate = intermediate steps
      Returns: a new #GstEvent
  */
  static gst.event.Event newStep(gst.types.Format format, ulong amount, double rate, bool flush, bool intermediate)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_step(format, amount, rate, flush, intermediate);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new STREAM_COLLECTION event. The stream collection event can only
      travel downstream synchronized with the buffer flow.
      
      Source elements, demuxers and other elements that manage collections
      of streams and post #GstStreamCollection messages on the bus also send
      this event downstream on each pad involved in the collection, so that
      activation of a new collection can be tracked through the downstream
      data flow.
  
      Params:
        collection = Active collection for this data flow
      Returns: the new STREAM_COLLECTION event.
  */
  static gst.event.Event newStreamCollection(gst.stream_collection.StreamCollection collection)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_stream_collection(collection ? cast(GstStreamCollection*)collection._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new Stream Group Done event. The stream-group-done event can
      only travel downstream synchronized with the buffer flow. Elements
      that receive the event on a pad should handle it mostly like EOS,
      and emit any data or pending buffers that would depend on more data
      arriving and unblock, since there won't be any more data.
      
      This event is followed by EOS at some point in the future, and is
      generally used when switching pads - to unblock downstream so that
      new pads can be exposed before sending EOS on the existing pads.
  
      Params:
        groupId = the group id of the stream group which is ending
      Returns: the new stream-group-done event.
  */
  static gst.event.Event newStreamGroupDone(uint groupId)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_stream_group_done(groupId);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new STREAM_START event. The stream start event can only
      travel downstream synchronized with the buffer flow. It is expected
      to be the first event that is sent for a new stream.
      
      Source elements, demuxers and other elements that create new streams
      are supposed to send this event as the first event of a new stream. It
      should not be sent after a flushing seek or in similar situations
      and is used to mark the beginning of a new logical stream. Elements
      combining multiple streams must ensure that this event is only forwarded
      downstream once and not for every single input stream.
      
      The stream_id should be a unique string that consists of the upstream
      stream-id, / as separator and a unique stream-id for this specific
      stream. A new stream-id should only be created for a stream if the upstream
      stream is split into (potentially) multiple new streams, e.g. in a demuxer,
      but not for every single element in the pipeline.
      [gst.pad.Pad.createStreamId] or [gst.pad.Pad.createStreamIdPrintf] can be
      used to create a stream-id.  There are no particular semantics for the
      stream-id, though it should be deterministic (to support stream matching)
      and it might be used to order streams (besides any information conveyed by
      stream flags).
  
      Params:
        streamId = Identifier for this stream
      Returns: the new STREAM_START event.
  */
  static gst.event.Event newStreamStart(string streamId)
  {
    GstEvent* _cretval;
    const(char)* _streamId = streamId.toCString(No.Alloc);
    _cretval = gst_event_new_stream_start(_streamId);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Generates a metadata tag event from the given taglist.
      
      The scope of the taglist specifies if the taglist applies to the
      complete medium or only to this specific stream. As the tag event
      is a sticky event, elements should merge tags received from
      upstream with a given scope with their own tags with the same
      scope and create a new tag event from it.
  
      Params:
        taglist = metadata list. The event will take ownership
              of the taglist.
      Returns: a new #GstEvent
  */
  static gst.event.Event newTag(gst.tag_list.TagList taglist)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_tag(taglist ? cast(GstTagList*)taglist._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Generate a TOC event from the given toc. The purpose of the TOC event is to
      inform elements that some kind of the TOC was found.
  
      Params:
        toc = #GstToc structure.
        updated = whether toc was updated or not.
      Returns: a new #GstEvent.
  */
  static gst.event.Event newToc(gst.toc.Toc toc, bool updated)
  {
    GstEvent* _cretval;
    _cretval = gst_event_new_toc(toc ? cast(GstToc*)toc._cPtr(No.Dup) : null, updated);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Generate a TOC select event with the given uid. The purpose of the
      TOC select event is to start playback based on the TOC's entry with the
      given uid.
  
      Params:
        uid = UID in the TOC to start playback from.
      Returns: a new #GstEvent.
  */
  static gst.event.Event newTocSelect(string uid)
  {
    GstEvent* _cretval;
    const(char)* _uid = uid.toCString(No.Alloc);
    _cretval = gst_event_new_toc_select(_uid);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parses a segment event and copies the #GstSegment into the location
      given by segment.
  
      Params:
        segment = a pointer to a #GstSegment
  */
  void copySegment(gst.segment.Segment segment)
  {
    gst_event_copy_segment(cast(GstEvent*)this._cPtr, cast(GstSegment*)&segment);
  }

  /**
      Retrieve the accumulated running time offset of the event.
      
      Events passing through #GstPads that have a running time
      offset set via [gst.pad.Pad.setOffset] will get their offset
      adjusted according to the pad's offset.
      
      If the event contains any information that related to the
      running time, this information will need to be updated
      before usage with this offset.
      Returns: The event's running time offset
        
        MT safe.
  */
  long getRunningTimeOffset()
  {
    long _retval;
    _retval = gst_event_get_running_time_offset(cast(GstEvent*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the sequence number of a event.
      
      Events have ever-incrementing sequence numbers, which may also be set
      explicitly via [gst.event.Event.setSeqnum]. Sequence numbers are typically used to
      indicate that a event corresponds to some other set of events or messages,
      for example an EOS event corresponding to a SEEK event. It is considered good
      practice to make this correspondence when possible, though it is not
      required.
      
      Note that events and messages share the same sequence number incrementor;
      two events or messages will never have the same sequence number unless
      that correspondence was made explicitly.
      Returns: The event's sequence number.
        
        MT safe.
  */
  uint getSeqnum()
  {
    uint _retval;
    _retval = gst_event_get_seqnum(cast(GstEvent*)this._cPtr);
    return _retval;
  }

  /**
      Access the structure of the event.
      Returns: The structure of the event. The
        structure is still owned by the event, which means that you should not free
        it and that the pointer becomes invalid when you free the event.
        
        MT safe.
  */
  gst.structure.Structure getStructure()
  {
    const(GstStructure)* _cretval;
    _cretval = gst_event_get_structure(cast(GstEvent*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks if event has the given name. This function is usually used to
      check the name of a custom event.
  
      Params:
        name = name to check
      Returns: true if name matches the name of the event structure.
  */
  bool hasName(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gst_event_has_name(cast(GstEvent*)this._cPtr, _name);
    return _retval;
  }

  /**
      Checks if event has the given name. This function is usually used to
      check the name of a custom event.
  
      Params:
        name = name to check as a GQuark
      Returns: true if name matches the name of the event structure.
  */
  bool hasNameId(glib.types.Quark name)
  {
    bool _retval;
    _retval = cast(bool)gst_event_has_name_id(cast(GstEvent*)this._cPtr, name);
    return _retval;
  }

  /**
      Get the format, minsize, maxsize and async-flag in the buffersize event.
  
      Params:
        format = A pointer to store the format in
        minsize = A pointer to store the minsize in
        maxsize = A pointer to store the maxsize in
        async = A pointer to store the async-flag in
  */
  void parseBufferSize(out gst.types.Format format, out long minsize, out long maxsize, out bool async)
  {
    gboolean _async;
    gst_event_parse_buffer_size(cast(GstEvent*)this._cPtr, &format, cast(long*)&minsize, cast(long*)&maxsize, &_async);
    async = cast(bool)_async;
  }

  /**
      Get the caps from event. The caps remains valid as long as event remains
      valid.
  
      Params:
        caps = A pointer to the caps
  */
  void parseCaps(out gst.caps.Caps caps)
  {
    GstCaps* _caps;
    gst_event_parse_caps(cast(GstEvent*)this._cPtr, &_caps);
    caps = new gst.caps.Caps(cast(void*)_caps, No.Take);
  }

  /**
      Parse the FLUSH_STOP event and retrieve the reset_time member.
  
      Params:
        resetTime = if time should be reset
  */
  void parseFlushStop(out bool resetTime)
  {
    gboolean _resetTime;
    gst_event_parse_flush_stop(cast(GstEvent*)this._cPtr, &_resetTime);
    resetTime = cast(bool)_resetTime;
  }

  /**
      Extract timestamp and duration from a new GAP event.
  
      Params:
        timestamp = location where to store the
              start time (pts) of the gap, or null
        duration = location where to store the duration of
              the gap, or null
  */
  void parseGap(out gst.types.ClockTime timestamp, out gst.types.ClockTime duration)
  {
    gst_event_parse_gap(cast(GstEvent*)this._cPtr, cast(GstClockTime*)&timestamp, cast(GstClockTime*)&duration);
  }

  /**
      Retrieve the gap flags that may have been set on a gap event with
      [gst.event.Event.setGapFlags].
  
      Params:
        flags = a #GstGapFlags or null
  */
  void parseGapFlags(out gst.types.GapFlags flags)
  {
    gst_event_parse_gap_flags(cast(GstEvent*)this._cPtr, &flags);
  }

  /** */
  bool parseGroupId(out uint groupId)
  {
    bool _retval;
    _retval = cast(bool)gst_event_parse_group_id(cast(GstEvent*)this._cPtr, cast(uint*)&groupId);
    return _retval;
  }

  /**
      Extract rate and flags from an instant-rate-change event.
  
      Params:
        rateMultiplier = location in which to store the rate
              multiplier of the instant-rate-change event, or null
        newFlags = location in which to store the new
              segment flags of the instant-rate-change event, or null
  */
  void parseInstantRateChange(out double rateMultiplier, out gst.types.SegmentFlags newFlags)
  {
    gst_event_parse_instant_rate_change(cast(GstEvent*)this._cPtr, cast(double*)&rateMultiplier, &newFlags);
  }

  /**
      Extract the rate multiplier and running times from an instant-rate-sync-time event.
  
      Params:
        rateMultiplier = location where to store the rate of
              the instant-rate-sync-time event, or null
        runningTime = location in which to store the running time
              of the instant-rate-sync-time event, or null
        upstreamRunningTime = location in which to store the
              upstream running time of the instant-rate-sync-time event, or null
  */
  void parseInstantRateSyncTime(out double rateMultiplier, out gst.types.ClockTime runningTime, out gst.types.ClockTime upstreamRunningTime)
  {
    gst_event_parse_instant_rate_sync_time(cast(GstEvent*)this._cPtr, cast(double*)&rateMultiplier, cast(GstClockTime*)&runningTime, cast(GstClockTime*)&upstreamRunningTime);
  }

  /**
      Get the latency in the latency event.
  
      Params:
        latency = A pointer to store the latency in.
  */
  void parseLatency(out gst.types.ClockTime latency)
  {
    gst_event_parse_latency(cast(GstEvent*)this._cPtr, cast(GstClockTime*)&latency);
  }

  /**
      Parses an event containing protection system specific information and stores
      the results in system_id, data and origin. The data stored in system_id,
      origin and data are valid until event is released.
  
      Params:
        systemId = pointer to store the UUID
          string uniquely identifying a content protection system.
        data = pointer to store a #GstBuffer
          holding protection system specific information.
        origin = pointer to store a value that
          indicates where the protection information carried by event was extracted
          from.
  */
  void parseProtection(out string systemId, out gst.buffer.Buffer data, out string origin)
  {
    char* _systemId;
    GstBuffer* _data;
    char* _origin;
    gst_event_parse_protection(cast(GstEvent*)this._cPtr, &_systemId, &_data, &_origin);
    systemId = _systemId.fromCString(No.Free);
    data = new gst.buffer.Buffer(cast(void*)_data, No.Take);
    origin = _origin.fromCString(No.Free);
  }

  /**
      Get the type, proportion, diff and timestamp in the qos event. See
      [gst.event.Event.newQos] for more information about the different QoS values.
      
      timestamp will be adjusted for any pad offsets of pads it was passing through.
  
      Params:
        type = A pointer to store the QoS type in
        proportion = A pointer to store the proportion in
        diff = A pointer to store the diff in
        timestamp = A pointer to store the timestamp in
  */
  void parseQos(out gst.types.QOSType type, out double proportion, out gst.types.ClockTimeDiff diff, out gst.types.ClockTime timestamp)
  {
    gst_event_parse_qos(cast(GstEvent*)this._cPtr, &type, cast(double*)&proportion, cast(GstClockTimeDiff*)&diff, cast(GstClockTime*)&timestamp);
  }

  /**
      Parses a seek event and stores the results in the given result locations.
  
      Params:
        rate = result location for the rate
        format = result location for the stream format
        flags = result location for the #GstSeekFlags
        startType = result location for the #GstSeekType of the start position
        start = result location for the start position expressed in format
        stopType = result location for the #GstSeekType of the stop position
        stop = result location for the stop position expressed in format
  */
  void parseSeek(out double rate, out gst.types.Format format, out gst.types.SeekFlags flags, out gst.types.SeekType startType, out long start, out gst.types.SeekType stopType, out long stop)
  {
    gst_event_parse_seek(cast(GstEvent*)this._cPtr, cast(double*)&rate, &format, &flags, &startType, cast(long*)&start, &stopType, cast(long*)&stop);
  }

  /**
      Retrieve the trickmode interval that may have been set on a
      seek event with [gst.event.Event.setSeekTrickmodeInterval].
  
      Params:
        interval = interval
  */
  void parseSeekTrickmodeInterval(out gst.types.ClockTime interval)
  {
    gst_event_parse_seek_trickmode_interval(cast(GstEvent*)this._cPtr, cast(GstClockTime*)&interval);
  }

  /**
      Parses a segment event and stores the result in the given segment location.
      segment remains valid only until the event is freed. Don't modify the segment
      and make a copy if you want to modify it or store it for later use.
  
      Params:
        segment = a pointer to a #GstSegment
  */
  void parseSegment(out gst.segment.Segment segment)
  {
    const(GstSegment)* _segment;
    gst_event_parse_segment(cast(GstEvent*)this._cPtr, &_segment);
    segment = *cast(Segment*)_segment;
  }

  /**
      Extracts the position and format from the segment done message.
  
      Params:
        format = Result location for the format, or null
        position = Result location for the position, or null
  */
  void parseSegmentDone(out gst.types.Format format, out long position)
  {
    gst_event_parse_segment_done(cast(GstEvent*)this._cPtr, &format, cast(long*)&position);
  }

  /**
      Parse the SELECT_STREAMS event and retrieve the contained streams.
  
      Params:
        streams = the streams
  */
  void parseSelectStreams(out string[] streams)
  {
    GList* _streams;
    gst_event_parse_select_streams(cast(GstEvent*)this._cPtr, &_streams);
    streams = gListToD!(string, GidOwnership.Full)(_streams);
  }

  /**
      Parse the sink-message event. Unref msg after usage.
  
      Params:
        msg = a pointer to store the #GstMessage in.
  */
  void parseSinkMessage(out gst.message.Message msg)
  {
    GstMessage* _msg;
    gst_event_parse_sink_message(cast(GstEvent*)this._cPtr, &_msg);
    msg = new gst.message.Message(cast(void*)_msg, Yes.Take);
  }

  /**
      Parse the step event.
  
      Params:
        format = a pointer to store the format in
        amount = a pointer to store the amount in
        rate = a pointer to store the rate in
        flush = a pointer to store the flush boolean in
        intermediate = a pointer to store the intermediate
              boolean in
  */
  void parseStep(out gst.types.Format format, out ulong amount, out double rate, out bool flush, out bool intermediate)
  {
    gboolean _flush;
    gboolean _intermediate;
    gst_event_parse_step(cast(GstEvent*)this._cPtr, &format, cast(ulong*)&amount, cast(double*)&rate, &_flush, &_intermediate);
    flush = cast(bool)_flush;
    intermediate = cast(bool)_intermediate;
  }

  /**
      Parse a stream-start event and extract the #GstStream from it.
  
      Params:
        stream = address of variable to store the stream
  */
  void parseStream(out gst.stream.Stream stream)
  {
    GstStream* _stream;
    gst_event_parse_stream(cast(GstEvent*)this._cPtr, &_stream);
    stream = new gst.stream.Stream(cast(void*)_stream, Yes.Take);
  }

  /**
      Retrieve new #GstStreamCollection from STREAM_COLLECTION event event.
  
      Params:
        collection = pointer to store the collection.
  */
  void parseStreamCollection(out gst.stream_collection.StreamCollection collection)
  {
    GstStreamCollection* _collection;
    gst_event_parse_stream_collection(cast(GstEvent*)this._cPtr, &_collection);
    collection = new gst.stream_collection.StreamCollection(cast(void*)_collection, Yes.Take);
  }

  /** */
  void parseStreamFlags(out gst.types.StreamFlags flags)
  {
    gst_event_parse_stream_flags(cast(GstEvent*)this._cPtr, &flags);
  }

  /**
      Parse a stream-group-done event and store the result in the given
      group_id location.
  
      Params:
        groupId = address of variable to store the group id into
  */
  void parseStreamGroupDone(out uint groupId)
  {
    gst_event_parse_stream_group_done(cast(GstEvent*)this._cPtr, cast(uint*)&groupId);
  }

  /**
      Parse a stream-id event and store the result in the given stream_id
      location. The string stored in stream_id must not be modified and will
      remain valid only until event gets freed. Make a copy if you want to
      modify it or store it for later use.
  
      Params:
        streamId = pointer to store the stream-id
  */
  void parseStreamStart(out string streamId)
  {
    char* _streamId;
    gst_event_parse_stream_start(cast(GstEvent*)this._cPtr, &_streamId);
    streamId = _streamId.fromCString(No.Free);
  }

  /**
      Parses a tag event and stores the results in the given taglist location.
      No reference to the taglist will be returned, it remains valid only until
      the event is freed. Don't modify or free the taglist, make a copy if you
      want to modify it or store it for later use.
  
      Params:
        taglist = pointer to metadata list
  */
  void parseTag(out gst.tag_list.TagList taglist)
  {
    GstTagList* _taglist;
    gst_event_parse_tag(cast(GstEvent*)this._cPtr, &_taglist);
    taglist = new gst.tag_list.TagList(cast(void*)_taglist, No.Take);
  }

  /**
      Parse a TOC event and store the results in the given toc and updated locations.
  
      Params:
        toc = pointer to #GstToc structure.
        updated = pointer to store TOC updated flag.
  */
  void parseToc(out gst.toc.Toc toc, out bool updated)
  {
    GstToc* _toc;
    gboolean _updated;
    gst_event_parse_toc(cast(GstEvent*)this._cPtr, &_toc, &_updated);
    toc = new gst.toc.Toc(cast(void*)_toc, Yes.Take);
    updated = cast(bool)_updated;
  }

  /**
      Parse a TOC select event and store the results in the given uid location.
  
      Params:
        uid = storage for the selection UID.
  */
  void parseTocSelect(out string uid)
  {
    char* _uid;
    gst_event_parse_toc_select(cast(GstEvent*)this._cPtr, &_uid);
    uid = _uid.fromCString(Yes.Free);
  }

  /**
      Sets flags on event to give additional information about the reason for
      the #GST_EVENT_GAP.
  
      Params:
        flags = a #GstGapFlags
  */
  void setGapFlags(gst.types.GapFlags flags)
  {
    gst_event_set_gap_flags(cast(GstEvent*)this._cPtr, flags);
  }

  /**
      All streams that have the same group id are supposed to be played
      together, i.e. all streams inside a container file should have the
      same group id but different stream ids. The group id should change
      each time the stream is started, resulting in different group ids
      each time a file is played for example.
      
      Use [gst.global.utilGroupIdNext] to get a new group id.
  
      Params:
        groupId = the group id to set
  */
  void setGroupId(uint groupId)
  {
    gst_event_set_group_id(cast(GstEvent*)this._cPtr, groupId);
  }

  /**
      Set the running time offset of a event. See
      [gst.event.Event.getRunningTimeOffset] for more information.
      
      MT safe.
  
      Params:
        offset = A the new running time offset
  */
  void setRunningTimeOffset(long offset)
  {
    gst_event_set_running_time_offset(cast(GstEvent*)this._cPtr, offset);
  }

  /**
      Sets a trickmode interval on a (writable) seek event. Elements
      that support TRICKMODE_KEY_UNITS seeks SHOULD use this as the minimal
      interval between each frame they may output.
  
      Params:
        interval = 
  */
  void setSeekTrickmodeInterval(gst.types.ClockTime interval)
  {
    gst_event_set_seek_trickmode_interval(cast(GstEvent*)this._cPtr, interval);
  }

  /**
      Set the sequence number of a event.
      
      This function might be called by the creator of a event to indicate that the
      event relates to other events or messages. See [gst.event.Event.getSeqnum] for
      more information.
      
      MT safe.
  
      Params:
        seqnum = A sequence number.
  */
  void setSeqnum(uint seqnum)
  {
    gst_event_set_seqnum(cast(GstEvent*)this._cPtr, seqnum);
  }

  /**
      Set the stream on the stream-start event
  
      Params:
        stream = the stream object to set
  */
  void setStream(gst.stream.Stream stream)
  {
    gst_event_set_stream(cast(GstEvent*)this._cPtr, stream ? cast(GstStream*)stream._cPtr(No.Dup) : null);
  }

  /** */
  void setStreamFlags(gst.types.StreamFlags flags)
  {
    gst_event_set_stream_flags(cast(GstEvent*)this._cPtr, flags);
  }

  /**
      Get a writable version of the structure.
      Returns: The structure of the event. The structure
        is still owned by the event, which means that you should not free
        it and that the pointer becomes invalid when you free the event.
        This function ensures that event is writable, and if so, will
        never return null.
        
        MT safe.
  */
  gst.structure.Structure writableStructure()
  {
    GstStructure* _cretval;
    _cretval = gst_event_writable_structure(cast(GstEvent*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
