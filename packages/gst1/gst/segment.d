/// Module for [Segment] class
module gst.segment;

import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    This helper structure holds the relevant values for tracking the region of
    interest in a media file, called a segment.
    
    The structure can be used for two purposes:
    
      $(LIST
          * performing seeks (handling seek events)
          * tracking playback regions (handling newsegment events)
      )
        
    The segment is usually configured by the application with a seek event which
    is propagated upstream and eventually handled by an element that performs the seek.
    
    The configured segment is then propagated back downstream with a newsegment event.
    This information is then used to clip media to the segment boundaries.
    
    A segment structure is initialized with [gst.segment.Segment.init_], which takes a #GstFormat
    that will be used as the format of the segment values. The segment will be configured
    with a start value of 0 and a stop/duration of -1, which is undefined. The default
    rate and applied_rate is 1.0.
    
    The public duration field contains the duration of the segment. When using
    the segment for seeking, the start and time members should normally be left
    to their default 0 value. The stop position is left to -1 unless explicitly
    configured to a different value after a seek event.
    
    The current position in the segment should be set by changing the position
    member in the structure.
    
    For elements that perform seeks, the current segment should be updated with the
    [gst.segment.Segment.doSeek] and the values from the seek event. This method will update
    all the segment fields. The position field will contain the new playback position.
    If the start_type was different from GST_SEEK_TYPE_NONE, playback continues from
    the position position, possibly with updated flags or rate.
    
    For elements that want to use #GstSegment to track the playback region,
    update the segment fields with the information from the newsegment event.
    The [gst.segment.Segment.clip] method can be used to check and clip
    the media data to the segment boundaries.
    
    For elements that want to synchronize to the pipeline clock, [gst.segment.Segment.toRunningTime]
    can be used to convert a timestamp to a value that can be used to synchronize
    to the clock. This function takes into account the base as well as
    any rate or applied_rate conversions.
    
    For elements that need to perform operations on media data in stream_time,
    [gst.segment.Segment.toStreamTime] can be used to convert a timestamp and the segment
    info to stream time (which is always between 0 and the duration of the stream).
*/
class Segment : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_segment_get_type != &gidSymbolNotFound ? gst_segment_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Segment self()
  {
    return this;
  }

  /**
      Get `flags` field.
      Returns: flags for this segment
  */
  @property gst.types.SegmentFlags flags()
  {
    return cast(gst.types.SegmentFlags)(cast(GstSegment*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = flags for this segment
  */
  @property void flags(gst.types.SegmentFlags propval)
  {
    (cast(GstSegment*)this._cPtr).flags = cast(GstSegmentFlags)propval;
  }

  /**
      Get `rate` field.
      Returns: the playback rate of the segment is set in response to a seek
                     event and, without any seek, the value should be `1.0`. This
                     value is used by elements that synchronize buffer [running
                     times](additional/design/synchronisation.md#running-time) on
                     the clock (usually the sink elements), leading to consuming
                     buffers faster (for a value `> 1.0`) or slower (for `0.0 <
                     value < 1.0`) than normal playback speed. The rate also
                     defines the playback direction, meaning that when the value is
                     lower than `0.0`, the playback happens in reverse, and the
                     [stream-time](additional/design/synchronisation.md#stream-time)
                     is going backward. The `rate` value should never be `0.0`.
  */
  @property double rate()
  {
    return (cast(GstSegment*)this._cPtr).rate;
  }

  /**
      Set `rate` field.
      Params:
        propval = the playback rate of the segment is set in response to a seek
                       event and, without any seek, the value should be `1.0`. This
                       value is used by elements that synchronize buffer [running
                       times](additional/design/synchronisation.md#running-time) on
                       the clock (usually the sink elements), leading to consuming
                       buffers faster (for a value `> 1.0`) or slower (for `0.0 <
                       value < 1.0`) than normal playback speed. The rate also
                       defines the playback direction, meaning that when the value is
                       lower than `0.0`, the playback happens in reverse, and the
                       [stream-time](additional/design/synchronisation.md#stream-time)
                       is going backward. The `rate` value should never be `0.0`.
  */
  @property void rate(double propval)
  {
    (cast(GstSegment*)this._cPtr).rate = propval;
  }

  /**
      Get `appliedRate` field.
      Returns: The applied rate is the rate that has been applied to the stream.
                     The effective/resulting playback rate of a stream is
                     `rate * applied_rate`.
                     The applied rate can be set by source elements when a server is
                     sending the stream with an already modified playback speed
                     rate. Filter elements that modify the stream in a way that
                     modifies the playback speed should also modify the applied
                     rate. For example the #videorate element when its
                     #videorate:rate property is set will set the applied rate of
                     the segment it pushed downstream. Also #scaletempo applies the
                     input segment rate to the stream and outputs a segment with
                     rate=1.0 and applied_rate=<inputsegment.rate>.
  */
  @property double appliedRate()
  {
    return (cast(GstSegment*)this._cPtr).appliedRate;
  }

  /**
      Set `appliedRate` field.
      Params:
        propval = The applied rate is the rate that has been applied to the stream.
                       The effective/resulting playback rate of a stream is
                       `rate * applied_rate`.
                       The applied rate can be set by source elements when a server is
                       sending the stream with an already modified playback speed
                       rate. Filter elements that modify the stream in a way that
                       modifies the playback speed should also modify the applied
                       rate. For example the #videorate element when its
                       #videorate:rate property is set will set the applied rate of
                       the segment it pushed downstream. Also #scaletempo applies the
                       input segment rate to the stream and outputs a segment with
                       rate=1.0 and applied_rate=<inputsegment.rate>.
  */
  @property void appliedRate(double propval)
  {
    (cast(GstSegment*)this._cPtr).appliedRate = propval;
  }

  /**
      Get `format` field.
      Returns: the unit used for all of the segment's values.
  */
  @property gst.types.Format format()
  {
    return cast(gst.types.Format)(cast(GstSegment*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = the unit used for all of the segment's values.
  */
  @property void format(gst.types.Format propval)
  {
    (cast(GstSegment*)this._cPtr).format = cast(GstFormat)propval;
  }

  /**
      Get `base` field.
      Returns: the running time (plus elapsed time, see offset) of the
                     segment [start](GstSegment.start) ([stop](GstSegment.stop) if
                     rate < 0.0).
  */
  @property ulong base()
  {
    return (cast(GstSegment*)this._cPtr).base;
  }

  /**
      Set `base` field.
      Params:
        propval = the running time (plus elapsed time, see offset) of the
                       segment [start](GstSegment.start) ([stop](GstSegment.stop) if
                       rate < 0.0).
  */
  @property void base(ulong propval)
  {
    (cast(GstSegment*)this._cPtr).base = propval;
  }

  /**
      Get `offset` field.
      Returns: the offset expresses the elapsed time (in buffer timestamps)
                     before a seek with its start (stop if rate < 0.0) seek type
                     set to #GST_SEEK_TYPE_NONE, the value is set to the position
                     of the segment at the time of the seek.
  */
  @property ulong offset()
  {
    return (cast(GstSegment*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = the offset expresses the elapsed time (in buffer timestamps)
                       before a seek with its start (stop if rate < 0.0) seek type
                       set to #GST_SEEK_TYPE_NONE, the value is set to the position
                       of the segment at the time of the seek.
  */
  @property void offset(ulong propval)
  {
    (cast(GstSegment*)this._cPtr).offset = propval;
  }

  /**
      Get `start` field.
      Returns: the start time of the segment (in buffer timestamps)
                     [(PTS)](GstBuffer.pts), that is the timestamp of the first
                     buffer to output inside the segment (last one during
                     reverse playback). For example decoders will
                     [clip](gst_segment_clip) out the buffers before the start
                     time.
  */
  @property ulong start()
  {
    return (cast(GstSegment*)this._cPtr).start;
  }

  /**
      Set `start` field.
      Params:
        propval = the start time of the segment (in buffer timestamps)
                       [(PTS)](GstBuffer.pts), that is the timestamp of the first
                       buffer to output inside the segment (last one during
                       reverse playback). For example decoders will
                       [clip](gst_segment_clip) out the buffers before the start
                       time.
  */
  @property void start(ulong propval)
  {
    (cast(GstSegment*)this._cPtr).start = propval;
  }

  /**
      Get `stop` field.
      Returns: the stop time of the segment (in buffer timestamps)
                     [(PTS)](GstBuffer.pts), that is the timestamp of the last
                     buffer to output inside the segment (first one during
                     reverse playback). For example decoders will
                     [clip](gst_segment_clip) out buffers after the stop time.
  */
  @property ulong stop()
  {
    return (cast(GstSegment*)this._cPtr).stop;
  }

  /**
      Set `stop` field.
      Params:
        propval = the stop time of the segment (in buffer timestamps)
                       [(PTS)](GstBuffer.pts), that is the timestamp of the last
                       buffer to output inside the segment (first one during
                       reverse playback). For example decoders will
                       [clip](gst_segment_clip) out buffers after the stop time.
  */
  @property void stop(ulong propval)
  {
    (cast(GstSegment*)this._cPtr).stop = propval;
  }

  /**
      Get `time` field.
      Returns: the stream time of the segment [start](GstSegment.start)
                     ([stop](GstSegment.stop) if rate < 0.0).
  */
  @property ulong time()
  {
    return (cast(GstSegment*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the stream time of the segment [start](GstSegment.start)
                       ([stop](GstSegment.stop) if rate < 0.0).
  */
  @property void time(ulong propval)
  {
    (cast(GstSegment*)this._cPtr).time = propval;
  }

  /**
      Get `position` field.
      Returns: the buffer timestamp position in the segment is supposed to be
                     updated by elements such as sources, demuxers or parsers to
                     track progress by setting it to the last pushed buffer' end time
                     ([timestamp](GstBuffer.pts) + #GstBuffer.duration) for that
                     specific segment. The position is used when reconfiguring the
                     segment with #gst_segment_do_seek when the seek is only
                     updating the segment (see [offset](GstSegment.offset)).
  */
  @property ulong position()
  {
    return (cast(GstSegment*)this._cPtr).position;
  }

  /**
      Set `position` field.
      Params:
        propval = the buffer timestamp position in the segment is supposed to be
                       updated by elements such as sources, demuxers or parsers to
                       track progress by setting it to the last pushed buffer' end time
                       ([timestamp](GstBuffer.pts) + #GstBuffer.duration) for that
                       specific segment. The position is used when reconfiguring the
                       segment with #gst_segment_do_seek when the seek is only
                       updating the segment (see [offset](GstSegment.offset)).
  */
  @property void position(ulong propval)
  {
    (cast(GstSegment*)this._cPtr).position = propval;
  }

  /**
      Get `duration` field.
      Returns: the duration of the segment is the maximum absolute difference
                     between #GstSegment.start and #GstSegment.stop if stop is not
                     set, otherwise it should be the difference between those
                     two values. This should be set by elements that know the
                     overall stream duration (like demuxers) and will be used when
                     seeking with #GST_SEEK_TYPE_END.
  */
  @property ulong duration()
  {
    return (cast(GstSegment*)this._cPtr).duration;
  }

  /**
      Set `duration` field.
      Params:
        propval = the duration of the segment is the maximum absolute difference
                       between #GstSegment.start and #GstSegment.stop if stop is not
                       set, otherwise it should be the difference between those
                       two values. This should be set by elements that know the
                       overall stream duration (like demuxers) and will be used when
                       seeking with #GST_SEEK_TYPE_END.
  */
  @property void duration(ulong propval)
  {
    (cast(GstSegment*)this._cPtr).duration = propval;
  }

  /**
      Allocate a new #GstSegment structure and initialize it using
      [gst.segment.Segment.init_].
      
      Free-function: gst_segment_free
      Returns: a new #GstSegment, free with [gst.segment.Segment.free].
  */
  this()
  {
    GstSegment* _cretval;
    _cretval = gst_segment_new();
    this(_cretval, Yes.Take);
  }

  /**
      Clip the given start and stop values to the segment boundaries given
      in segment. start and stop are compared and clipped to segment
      start and stop values.
      
      If the function returns false, start and stop are known to fall
      outside of segment and clip_start and clip_stop are not updated.
      
      When the function returns true, clip_start and clip_stop will be
      updated. If clip_start or clip_stop are different from start or stop
      respectively, the region fell partially in the segment.
      
      Note that when stop is -1, clip_stop will be set to the end of the
      segment. Depending on the use case, this may or may not be what you want.
  
      Params:
        format = the format of the segment.
        start = the start position in the segment
        stop = the stop position in the segment
        clipStart = the clipped start position in the segment
        clipStop = the clipped stop position in the segment
      Returns: true if the given start and stop times fall partially or
            completely in segment, false if the values are completely outside
            of the segment.
  */
  bool clip(gst.types.Format format, ulong start, ulong stop, out ulong clipStart, out ulong clipStop)
  {
    bool _retval;
    _retval = cast(bool)gst_segment_clip(cast(const(GstSegment)*)this._cPtr, format, start, stop, cast(ulong*)&clipStart, cast(ulong*)&clipStop);
    return _retval;
  }

  /**
      Create a copy of given segment.
      
      Free-function: gst_segment_free
      Returns: a new #GstSegment, free with [gst.segment.Segment.free].
  */
  gst.segment.Segment copy()
  {
    GstSegment* _cretval;
    _cretval = gst_segment_copy(cast(const(GstSegment)*)this._cPtr);
    auto _retval = _cretval ? new gst.segment.Segment(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copy the contents of src into dest.
  
      Params:
        dest = a #GstSegment
  */
  void copyInto(gst.segment.Segment dest)
  {
    gst_segment_copy_into(cast(const(GstSegment)*)this._cPtr, dest ? cast(GstSegment*)dest._cPtr(No.Dup) : null);
  }

  /**
      Update the segment structure with the field values of a seek event (see
      [gst.event.Event.newSeek]).
      
      After calling this method, the segment field position and time will
      contain the requested new position in the segment. The new requested
      position in the segment depends on rate and start_type and stop_type.
      
      For positive rate, the new position in the segment is the new segment
      start field when it was updated with a start_type different from
      #GST_SEEK_TYPE_NONE. If no update was performed on segment start position
      (#GST_SEEK_TYPE_NONE), start is ignored and segment position is
      unmodified.
      
      For negative rate, the new position in the segment is the new segment
      stop field when it was updated with a stop_type different from
      #GST_SEEK_TYPE_NONE. If no stop was previously configured in the segment, the
      duration of the segment will be used to update the stop position.
      If no update was performed on segment stop position (#GST_SEEK_TYPE_NONE),
      stop is ignored and segment position is unmodified.
      
      The applied rate of the segment will be set to 1.0 by default.
      If the caller can apply a rate change, it should update segment
      rate and applied_rate after calling this function.
      
      update will be set to true if a seek should be performed to the segment
      position field. This field can be false if, for example, only the rate
      has been changed but not the playback position.
  
      Params:
        rate = the rate of the segment.
        format = the format of the segment.
        flags = the segment flags for the segment
        startType = the seek method
        start = the seek start value
        stopType = the seek method
        stop = the seek stop value
        update = boolean holding whether position was updated.
      Returns: true if the seek could be performed.
  */
  bool doSeek(double rate, gst.types.Format format, gst.types.SeekFlags flags, gst.types.SeekType startType, ulong start, gst.types.SeekType stopType, ulong stop, out bool update)
  {
    bool _retval;
    gboolean _update;
    _retval = cast(bool)gst_segment_do_seek(cast(GstSegment*)this._cPtr, rate, format, flags, startType, start, stopType, stop, &_update);
    update = cast(bool)_update;
    return _retval;
  }

  /**
      The start/position fields are set to 0 and the stop/duration
      fields are set to -1 (unknown). The default rate of 1.0 and no
      flags are set.
      
      Initialize segment to its default values.
  
      Params:
        format = the format of the segment.
  */
  void init_(gst.types.Format format)
  {
    gst_segment_init(cast(GstSegment*)this._cPtr, format);
  }

  /**
      Checks for two segments being equal. Equality here is defined
      as perfect equality, including floating point values.
  
      Params:
        s1 = a #GstSegment structure.
      Returns: true if the segments are equal, false otherwise.
  */
  bool isEqual(gst.segment.Segment s1)
  {
    bool _retval;
    _retval = cast(bool)gst_segment_is_equal(cast(const(GstSegment)*)this._cPtr, s1 ? cast(const(GstSegment)*)s1._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Adjust the values in segment so that offset is applied to all
      future running-time calculations.
  
      Params:
        format = the format of the segment.
        offset = the offset to apply in the segment
      Returns: true if the segment could be updated successfully. If false is
        returned, offset is not in segment.
  */
  bool offsetRunningTime(gst.types.Format format, long offset)
  {
    bool _retval;
    _retval = cast(bool)gst_segment_offset_running_time(cast(GstSegment*)this._cPtr, format, offset);
    return _retval;
  }

  /**
      Convert running_time into a position in the segment so that
      [gst.segment.Segment.toRunningTime] with that position returns running_time.
  
      Params:
        format = the format of the segment.
        runningTime = the running_time in the segment
      Returns: the position in the segment for running_time. This function returns
        -1 when running_time is -1 or when it is not inside segment.
  */
  ulong positionFromRunningTime(gst.types.Format format, ulong runningTime)
  {
    ulong _retval;
    _retval = gst_segment_position_from_running_time(cast(const(GstSegment)*)this._cPtr, format, runningTime);
    return _retval;
  }

  /**
      Translate running_time to the segment position using the currently configured
      segment. Compared to [gst.segment.Segment.positionFromRunningTime] this function can
      return negative segment position.
      
      This function is typically used by elements that need to synchronize buffers
      against the clock or each other.
      
      running_time can be any value and the result of this function for values
      outside of the segment is extrapolated.
      
      When 1 is returned, running_time resulted in a positive position returned
      in position.
      
      When this function returns -1, the returned position was < 0, and the value
      in the position variable should be negated to get the real negative segment
      position.
  
      Params:
        format = the format of the segment.
        runningTime = the running-time
        position = the resulting position in the segment
      Returns: a 1 or -1 on success, 0 on failure.
  */
  int positionFromRunningTimeFull(gst.types.Format format, ulong runningTime, out ulong position)
  {
    int _retval;
    _retval = gst_segment_position_from_running_time_full(cast(const(GstSegment)*)this._cPtr, format, runningTime, cast(ulong*)&position);
    return _retval;
  }

  /**
      Convert stream_time into a position in the segment so that
      [gst.segment.Segment.toStreamTime] with that position returns stream_time.
  
      Params:
        format = the format of the segment.
        streamTime = the stream_time in the segment
      Returns: the position in the segment for stream_time. This function returns
        -1 when stream_time is -1 or when it is not inside segment.
  */
  ulong positionFromStreamTime(gst.types.Format format, ulong streamTime)
  {
    ulong _retval;
    _retval = gst_segment_position_from_stream_time(cast(const(GstSegment)*)this._cPtr, format, streamTime);
    return _retval;
  }

  /**
      Translate stream_time to the segment position using the currently configured
      segment. Compared to [gst.segment.Segment.positionFromStreamTime] this function can
      return negative segment position.
      
      This function is typically used by elements that need to synchronize buffers
      against the clock or each other.
      
      stream_time can be any value and the result of this function for values outside
      of the segment is extrapolated.
      
      When 1 is returned, stream_time resulted in a positive position returned
      in position.
      
      When this function returns -1, the returned position should be negated
      to get the real negative segment position.
  
      Params:
        format = the format of the segment.
        streamTime = the stream-time
        position = the resulting position in the segment
      Returns: a 1 or -1 on success, 0 on failure.
  */
  int positionFromStreamTimeFull(gst.types.Format format, ulong streamTime, out ulong position)
  {
    int _retval;
    _retval = gst_segment_position_from_stream_time_full(cast(const(GstSegment)*)this._cPtr, format, streamTime, cast(ulong*)&position);
    return _retval;
  }

  /**
      Adjust the start/stop and base values of segment such that the next valid
      buffer will be one with running_time.
  
      Params:
        format = the format of the segment.
        runningTime = the running_time in the segment
      Returns: true if the segment could be updated successfully. If false is
        returned, running_time is -1 or not in segment.
  */
  bool setRunningTime(gst.types.Format format, ulong runningTime)
  {
    bool _retval;
    _retval = cast(bool)gst_segment_set_running_time(cast(GstSegment*)this._cPtr, format, runningTime);
    return _retval;
  }

  /**
      Convert running_time into a position in the segment so that
      [gst.segment.Segment.toRunningTime] with that position returns running_time.
  
      Params:
        format = the format of the segment.
        runningTime = the running_time in the segment
      Returns: the position in the segment for running_time. This function returns
        -1 when running_time is -1 or when it is not inside segment.
  
      Deprecated: Use [gst.segment.Segment.positionFromRunningTime] instead.
  */
  ulong toPosition(gst.types.Format format, ulong runningTime)
  {
    ulong _retval;
    _retval = gst_segment_to_position(cast(const(GstSegment)*)this._cPtr, format, runningTime);
    return _retval;
  }

  /**
      Translate position to the total running time using the currently configured
      segment. Position is a value between segment start and stop time.
      
      This function is typically used by elements that need to synchronize to the
      global clock in a pipeline. The running time is a constantly increasing value
      starting from 0. When [gst.segment.Segment.init_] is called, this value will reset to
      0.
      
      This function returns -1 if the position is outside of segment start and stop.
  
      Params:
        format = the format of the segment.
        position = the position in the segment
      Returns: the position as the total running time or -1 when an invalid position
        was given.
  */
  ulong toRunningTime(gst.types.Format format, ulong position)
  {
    ulong _retval;
    _retval = gst_segment_to_running_time(cast(const(GstSegment)*)this._cPtr, format, position);
    return _retval;
  }

  /**
      Translate position to the total running time using the currently configured
      segment. Compared to [gst.segment.Segment.toRunningTime] this function can return
      negative running-time.
      
      This function is typically used by elements that need to synchronize buffers
      against the clock or each other.
      
      position can be any value and the result of this function for values outside
      of the segment is extrapolated.
      
      When 1 is returned, position resulted in a positive running-time returned
      in running_time.
      
      When this function returns -1, the returned running_time should be negated
      to get the real negative running time.
  
      Params:
        format = the format of the segment.
        position = the position in the segment
        runningTime = result running-time
      Returns: a 1 or -1 on success, 0 on failure.
  */
  int toRunningTimeFull(gst.types.Format format, ulong position, out ulong runningTime)
  {
    int _retval;
    _retval = gst_segment_to_running_time_full(cast(const(GstSegment)*)this._cPtr, format, position, cast(ulong*)&runningTime);
    return _retval;
  }

  /**
      Translate position to stream time using the currently configured
      segment. The position value must be between segment start and
      stop value.
      
      This function is typically used by elements that need to operate on
      the stream time of the buffers it receives, such as effect plugins.
      In those use cases, position is typically the buffer timestamp or
      clock time that one wants to convert to the stream time.
      The stream time is always between 0 and the total duration of the
      media stream.
  
      Params:
        format = the format of the segment.
        position = the position in the segment
      Returns: the position in stream_time or -1 when an invalid position
        was given.
  */
  ulong toStreamTime(gst.types.Format format, ulong position)
  {
    ulong _retval;
    _retval = gst_segment_to_stream_time(cast(const(GstSegment)*)this._cPtr, format, position);
    return _retval;
  }

  /**
      Translate position to the total stream time using the currently configured
      segment. Compared to [gst.segment.Segment.toStreamTime] this function can return
      negative stream-time.
      
      This function is typically used by elements that need to synchronize buffers
      against the clock or each other.
      
      position can be any value and the result of this function for values outside
      of the segment is extrapolated.
      
      When 1 is returned, position resulted in a positive stream-time returned
      in stream_time.
      
      When this function returns -1, the returned stream_time should be negated
      to get the real negative stream time.
  
      Params:
        format = the format of the segment.
        position = the position in the segment
        streamTime = result stream-time
      Returns: a 1 or -1 on success, 0 on failure.
  */
  int toStreamTimeFull(gst.types.Format format, ulong position, out ulong streamTime)
  {
    int _retval;
    _retval = gst_segment_to_stream_time_full(cast(const(GstSegment)*)this._cPtr, format, position, cast(ulong*)&streamTime);
    return _retval;
  }
}
