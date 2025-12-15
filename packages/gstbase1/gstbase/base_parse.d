/// Module for [BaseParse] class
module gstbase.base_parse;

import gid.gid;
import gobject.object;
import gst.element;
import gst.tag_list;
import gst.types;
import gstbase.base_parse_frame;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    This base class is for parser elements that process data and splits it
    into separate audio/video/whatever frames.
    
    It provides for:
    
      $(LIST
          * provides one sink pad and one source pad
          * handles state changes
          * can operate in pull mode or push mode
          * handles seeking in both modes
          * handles events (SEGMENT/EOS/FLUSH)
          * handles queries (POSITION/DURATION/SEEKING/FORMAT/CONVERT)
          * handles flushing
      )
        
    The purpose of this base class is to provide the basic functionality of
    a parser and share a lot of rather complex code.
    
    # Description of the parsing mechanism:
    
    ## Set-up phase
    
     $(LIST
        * #GstBaseParse calls #GstBaseParseClass::start to inform subclass
          that data processing is about to start now.
       
        * #GstBaseParse class calls #GstBaseParseClass::set_sink_caps to
          inform the subclass about incoming sinkpad caps. Subclass could
          already set the srcpad caps accordingly, but this might be delayed
          until calling [gstbase.base_parse.BaseParse.finishFrame] with a non-queued frame.
       
        * At least at this point subclass needs to tell the #GstBaseParse class
          how big data chunks it wants to receive (minimum frame size ). It can
          do this with [gstbase.base_parse.BaseParse.setMinFrameSize].
       
        * #GstBaseParse class sets up appropriate data passing mode (pull/push)
          and starts to process the data.
     )
       
    ## Parsing phase
    
     $(LIST
        * #GstBaseParse gathers at least min_frame_size bytes of data either
          by pulling it from upstream or collecting buffers in an internal
          #GstAdapter.
       
        * A buffer of (at least) min_frame_size bytes is passed to subclass
          with #GstBaseParseClass::handle_frame. Subclass checks the contents
          and can optionally return #GST_FLOW_OK along with an amount of data
          to be skipped to find a valid frame (which will result in a
          subsequent DISCONT).  If, otherwise, the buffer does not hold a
          complete frame, #GstBaseParseClass::handle_frame can merely return
          and will be called again when additional data is available.  In push
          mode this amounts to an additional input buffer (thus minimal
          additional latency), in pull mode this amounts to some arbitrary
          reasonable buffer size increase.
       
          Of course, [gstbase.base_parse.BaseParse.setMinFrameSize] could also be used if
          a very specific known amount of additional data is required.  If,
          however, the buffer holds a complete valid frame, it can pass the
          size of this frame to [gstbase.base_parse.BaseParse.finishFrame].
       
          If acting as a converter, it can also merely indicate consumed input
          data while simultaneously providing custom output data.  Note that
          baseclass performs some processing (such as tracking overall consumed
          data rate versus duration) for each finished frame, but other state
          is only updated upon each call to #GstBaseParseClass::handle_frame
          (such as tracking upstream input timestamp).
       
          Subclass is also responsible for setting the buffer metadata
          (e.g. buffer timestamp and duration, or keyframe if applicable).
          (although the latter can also be done by #GstBaseParse if it is
          appropriately configured, see below).  Frame is provided with
          timestamp derived from upstream (as much as generally possible),
          duration obtained from configuration (see below), and offset
          if meaningful (in pull mode).
       
          Note that #GstBaseParseClass::handle_frame might receive any small
          amount of input data when leftover data is being drained (e.g. at
          EOS).
       
        * As part of finish frame processing, just prior to actually pushing
          the buffer in question, it is passed to
          #GstBaseParseClass::pre_push_frame which gives subclass yet one last
          chance to examine buffer metadata, or to send some custom (tag)
          events, or to perform custom (segment) filtering.
       
        * During the parsing process #GstBaseParseClass will handle both srcpad
          and sinkpad events. They will be passed to subclass if
          #GstBaseParseClass::sink_event or #GstBaseParseClass::src_event
          implementations have been provided.
     )
       
    ## Shutdown phase
    
    $(LIST
      * #GstBaseParse class calls #GstBaseParseClass::stop to inform the
        subclass that data parsing will be stopped.
    )
      
    Subclass is responsible for providing pad template caps for source and
    sink pads. The pads need to be named "sink" and "src". It also needs to
    set the fixed caps on srcpad, when the format is ensured (e.g.  when
    base class calls subclass' #GstBaseParseClass::set_sink_caps function).
    
    This base class uses [gst.types.Format.Default] as a meaning of frames. So,
    subclass conversion routine needs to know that conversion from
    [gst.types.Format.Time] to [gst.types.Format.Default] must return the
    frame number that can be found from the given byte position.
    
    #GstBaseParse uses subclasses conversion methods also for seeking (or
    otherwise uses its own default one, see also below).
    
    Subclass @start and @stop functions will be called to inform the beginning
    and end of data processing.
    
    Things that subclass need to take care of:
    
    $(LIST
      * Provide pad templates
      * Fixate the source pad caps when appropriate
      * Inform base class how big data chunks should be retrieved. This is
        done with [gstbase.base_parse.BaseParse.setMinFrameSize] function.
      * Examine data chunks passed to subclass with
        #GstBaseParseClass::handle_frame and pass proper frame(s) to
        [gstbase.base_parse.BaseParse.finishFrame], and setting src pad caps and timestamps
        on frame.
      * Provide conversion functions
      * Update the duration information with [gstbase.base_parse.BaseParse.setDuration]
      * Optionally passthrough using [gstbase.base_parse.BaseParse.setPassthrough]
      * Configure various baseparse parameters using
        [gstbase.base_parse.BaseParse.setAverageBitrate], [gstbase.base_parse.BaseParse.setSyncable]
        and [gstbase.base_parse.BaseParse.setFrameRate].
      
      * In particular, if subclass is unable to determine a duration, but
        parsing (or specs) yields a frames per seconds rate, then this can be
        provided to #GstBaseParse to enable it to cater for buffer time
        metadata (which will be taken from upstream as much as
        possible). Internally keeping track of frame durations and respective
        sizes that have been pushed provides #GstBaseParse with an estimated
        bitrate. A default #GstBaseParseClass::convert (used if not
        overridden) will then use these rates to perform obvious conversions.
        These rates are also used to update (estimated) duration at regular
        frame intervals.
    )
*/
class BaseParse : gst.element.Element
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
    return cast(void function())gst_base_parse_get_type != &gidSymbolNotFound ? gst_base_parse_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseParse self()
  {
    return this;
  }

  /**
      Get `disablePassthrough` property.
      Returns: If set to true, baseparse will unconditionally force parsing of the
      incoming data. This can be required in the rare cases where the incoming
      side-data (caps, pts, dts, ...) is not trusted by the user and wants to
      force validation and parsing of the incoming data.
      If set to false, decision of whether to parse the data or not is up to
      the implementation (standard behaviour).
  */
  @property bool disablePassthrough()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("disable-passthrough");
  }

  /**
      Set `disablePassthrough` property.
      Params:
        propval = If set to true, baseparse will unconditionally force parsing of the
        incoming data. This can be required in the rare cases where the incoming
        side-data (caps, pts, dts, ...) is not trusted by the user and wants to
        force validation and parsing of the incoming data.
        If set to false, decision of whether to parse the data or not is up to
        the implementation (standard behaviour).
  */
  @property void disablePassthrough(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("disable-passthrough", propval);
  }

  /**
      Adds an entry to the index associating offset to ts.  It is recommended
      to only add keyframe entries.  force allows to bypass checks, such as
      whether the stream is (upstream) seekable, another entry is already "close"
      to the new entry, etc.
  
      Params:
        offset = offset of entry
        ts = timestamp associated with offset
        key = whether entry refers to keyframe
        force = add entry disregarding sanity checks
      Returns: #gboolean indicating whether entry was added
  */
  bool addIndexEntry(ulong offset, gst.types.ClockTime ts, bool key, bool force)
  {
    bool _retval;
    _retval = cast(bool)gst_base_parse_add_index_entry(cast(GstBaseParse*)this._cPtr, offset, ts, key, force);
    return _retval;
  }

  /**
      Default implementation of #GstBaseParseClass::convert.
  
      Params:
        srcFormat = #GstFormat describing the source format.
        srcValue = Source value to be converted.
        destFormat = #GstFormat defining the converted format.
        destValue = Pointer where the conversion result will be put.
      Returns: true if conversion was successful.
  */
  bool convertDefault(gst.types.Format srcFormat, long srcValue, gst.types.Format destFormat, out long destValue)
  {
    bool _retval;
    _retval = cast(bool)gst_base_parse_convert_default(cast(GstBaseParse*)this._cPtr, srcFormat, srcValue, destFormat, cast(long*)&destValue);
    return _retval;
  }

  /**
      Drains the adapter until it is empty. It decreases the min_frame_size to
      match the current adapter size and calls chain method until the adapter
      is emptied or chain returns with error.
  */
  void drain()
  {
    gst_base_parse_drain(cast(GstBaseParse*)this._cPtr);
  }

  /**
      Collects parsed data and pushes it downstream.
      Source pad caps must be set when this is called.
      
      If frame's out_buffer is set, that will be used as subsequent frame data,
      and size amount will be flushed from the input data. The output_buffer size
      can differ from the consumed size indicated by size.
      
      Otherwise, size samples will be taken from the input and used for output,
      and the output's metadata (timestamps etc) will be taken as (optionally)
      set by the subclass on frame's (input) buffer (which is otherwise
      ignored for any but the above purpose/information).
      
      Note that the latter buffer is invalidated by this call, whereas the
      caller retains ownership of frame.
  
      Params:
        frame = a #GstBaseParseFrame
        size = consumed input data represented by frame
      Returns: a #GstFlowReturn that should be escalated to caller (of caller)
  */
  gst.types.FlowReturn finishFrame(gstbase.base_parse_frame.BaseParseFrame frame, int size)
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_parse_finish_frame(cast(GstBaseParse*)this._cPtr, frame ? cast(GstBaseParseFrame*)frame._cPtr(No.Dup) : null, size);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Sets the parser subclass's tags and how they should be merged with any
      upstream stream tags. This will override any tags previously-set
      with [gstbase.base_parse.BaseParse.mergeTags].
      
      Note that this is provided for convenience, and the subclass is
      not required to use this and can still do tag handling on its own.
  
      Params:
        tags = a #GstTagList to merge, or NULL to unset
              previously-set tags
        mode = the #GstTagMergeMode to use, usually #GST_TAG_MERGE_REPLACE
  */
  void mergeTags(gst.tag_list.TagList tags, gst.types.TagMergeMode mode)
  {
    gst_base_parse_merge_tags(cast(GstBaseParse*)this._cPtr, tags ? cast(GstTagList*)tags._cPtr(No.Dup) : null, mode);
  }

  /**
      Pushes the frame's buffer downstream, sends any pending events and
      does some timestamp and segment handling. Takes ownership of
      frame's buffer, though caller retains ownership of frame.
      
      This must be called with sinkpad STREAM_LOCK held.
  
      Params:
        frame = a #GstBaseParseFrame
      Returns: #GstFlowReturn
  */
  gst.types.FlowReturn pushFrame(gstbase.base_parse_frame.BaseParseFrame frame)
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_parse_push_frame(cast(GstBaseParse*)this._cPtr, frame ? cast(GstBaseParseFrame*)frame._cPtr(No.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optionally sets the average bitrate detected in media (if non-zero),
      e.g. based on metadata, as it will be posted to the application.
      
      By default, announced average bitrate is estimated. The average bitrate
      is used to estimate the total duration of the stream and to estimate
      a seek position, if there's no index and the format is syncable
      (see [gstbase.base_parse.BaseParse.setSyncable]).
  
      Params:
        bitrate = average bitrate in bits/second
  */
  void setAverageBitrate(uint bitrate)
  {
    gst_base_parse_set_average_bitrate(cast(GstBaseParse*)this._cPtr, bitrate);
  }

  /**
      Sets the duration of the currently playing media. Subclass can use this
      when it is able to determine duration and/or notices a change in the media
      duration.  Alternatively, if interval is non-zero (default), then stream
      duration is determined based on estimated bitrate, and updated every interval
      frames.
  
      Params:
        fmt = #GstFormat.
        duration = duration value.
        interval = how often to update the duration estimate based on bitrate, or 0.
  */
  void setDuration(gst.types.Format fmt, long duration, int interval)
  {
    gst_base_parse_set_duration(cast(GstBaseParse*)this._cPtr, fmt, duration, interval);
  }

  /**
      If frames per second is configured, parser can take care of buffer duration
      and timestamping.  When performing segment clipping, or seeking to a specific
      location, a corresponding decoder might need an initial lead_in and a
      following lead_out number of frames to ensure the desired segment is
      entirely filled upon decoding.
  
      Params:
        fpsNum = frames per second (numerator).
        fpsDen = frames per second (denominator).
        leadIn = frames needed before a segment for subsequent decode
        leadOut = frames needed after a segment
  */
  void setFrameRate(uint fpsNum, uint fpsDen, uint leadIn, uint leadOut)
  {
    gst_base_parse_set_frame_rate(cast(GstBaseParse*)this._cPtr, fpsNum, fpsDen, leadIn, leadOut);
  }

  /**
      Set if frames carry timing information which the subclass can (generally)
      parse and provide.  In particular, intrinsic (rather than estimated) time
      can be obtained following a seek.
  
      Params:
        hasTiming = whether frames carry timing information
  */
  void setHasTimingInfo(bool hasTiming)
  {
    gst_base_parse_set_has_timing_info(cast(GstBaseParse*)this._cPtr, hasTiming);
  }

  /**
      By default, the base class might try to infer PTS from DTS and vice
      versa.  While this is generally correct for audio data, it may not
      be otherwise. Sub-classes implementing such formats should disable
      timestamp inferring.
  
      Params:
        inferTs = true if parser should infer DTS/PTS from each other
  */
  void setInferTs(bool inferTs)
  {
    gst_base_parse_set_infer_ts(cast(GstBaseParse*)this._cPtr, inferTs);
  }

  /**
      Sets the minimum and maximum (which may likely be equal) latency introduced
      by the parsing process. If there is such a latency, which depends on the
      particular parsing of the format, it typically corresponds to 1 frame duration.
      
      If the provided values changed from previously provided ones, this will
      also post a LATENCY message on the bus so the pipeline can reconfigure its
      global latency.
  
      Params:
        minLatency = minimum parse latency
        maxLatency = maximum parse latency
  */
  void setLatency(gst.types.ClockTime minLatency, gst.types.ClockTime maxLatency)
  {
    gst_base_parse_set_latency(cast(GstBaseParse*)this._cPtr, minLatency, maxLatency);
  }

  /**
      Subclass can use this function to tell the base class that it needs to
      be given buffers of at least min_size bytes.
  
      Params:
        minSize = Minimum size in bytes of the data that this base class should
                give to subclass.
  */
  void setMinFrameSize(uint minSize)
  {
    gst_base_parse_set_min_frame_size(cast(GstBaseParse*)this._cPtr, minSize);
  }

  /**
      Set if the nature of the format or configuration does not allow (much)
      parsing, and the parser should operate in passthrough mode (which only
      applies when operating in push mode). That is, incoming buffers are
      pushed through unmodified, i.e. no #GstBaseParseClass::handle_frame
      will be invoked, but #GstBaseParseClass::pre_push_frame will still be
      invoked, so subclass can perform as much or as little is appropriate for
      passthrough semantics in #GstBaseParseClass::pre_push_frame.
  
      Params:
        passthrough = true if parser should run in passthrough mode
  */
  void setPassthrough(bool passthrough)
  {
    gst_base_parse_set_passthrough(cast(GstBaseParse*)this._cPtr, passthrough);
  }

  /**
      By default, the base class will guess PTS timestamps using a simple
      interpolation (previous timestamp + duration), which is incorrect for
      data streams with reordering, where PTS can go backward. Sub-classes
      implementing such formats should disable PTS interpolation.
  
      Params:
        ptsInterpolate = true if parser should interpolate PTS timestamps
  */
  void setPtsInterpolation(bool ptsInterpolate)
  {
    gst_base_parse_set_pts_interpolation(cast(GstBaseParse*)this._cPtr, ptsInterpolate);
  }

  /**
      Set if frame starts can be identified. This is set by default and
      determines whether seeking based on bitrate averages
      is possible for a format/stream.
  
      Params:
        syncable = set if frame starts can be identified
  */
  void setSyncable(bool syncable)
  {
    gst_base_parse_set_syncable(cast(GstBaseParse*)this._cPtr, syncable);
  }

  /**
      This function should only be called from a handle_frame implementation.
      
      #GstBaseParse creates initial timestamps for frames by using the last
      timestamp seen in the stream before the frame starts.  In certain
      cases, the correct timestamps will occur in the stream after the
      start of the frame, but before the start of the actual picture data.
      This function can be used to set the timestamps based on the offset
      into the frame data that the picture starts.
  
      Params:
        offset = offset into current buffer
  */
  void setTsAtOffset(size_t offset)
  {
    gst_base_parse_set_ts_at_offset(cast(GstBaseParse*)this._cPtr, offset);
  }
}
