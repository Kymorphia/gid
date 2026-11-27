/// Module for [BaseParse] class
module gid.gstbase1.base_parse;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.event;
import gid.gst1.query;
import gid.gst1.tag_list;
import gid.gst1.types;
import gid.gstbase1.base_parse_frame;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    This base class is for parser elements that process data and splits it
    into separate audio/video/whatever frames.
    
    It provides for:
    
      * provides one sink pad and one source pad
      * handles state changes
      * can operate in pull mode or push mode
      * handles seeking in both modes
      * handles events (SEGMENT/EOS/FLUSH)
      * handles queries (POSITION/DURATION/SEEKING/FORMAT/CONVERT)
      * handles flushing
    
    The purpose of this base class is to provide the basic functionality of
    a parser and share a lot of rather complex code.
    
    # Description of the parsing mechanism:
    
    ## Set-up phase
    
     * #GstBaseParse calls #GstBaseParseClass::start to inform subclass
       that data processing is about to start now.
    
     * #GstBaseParse class calls #GstBaseParseClass::set_sink_caps to
       inform the subclass about incoming sinkpad caps. Subclass could
       already set the srcpad caps accordingly, but this might be delayed
       until calling [gid.gstbase1.base_parse.BaseParse.finishFrame] with a non-queued frame.
    
     * At least at this point subclass needs to tell the #GstBaseParse class
       how big data chunks it wants to receive (minimum frame size ). It can
       do this with [gid.gstbase1.base_parse.BaseParse.setMinFrameSize].
    
     * #GstBaseParse class sets up appropriate data passing mode (pull/push)
       and starts to process the data.
    
    ## Parsing phase
    
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
    
       Of course, [gid.gstbase1.base_parse.BaseParse.setMinFrameSize] could also be used if
       a very specific known amount of additional data is required.  If,
       however, the buffer holds a complete valid frame, it can pass the
       size of this frame to [gid.gstbase1.base_parse.BaseParse.finishFrame].
    
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
    
    ## Shutdown phase
    
    * #GstBaseParse class calls #GstBaseParseClass::stop to inform the
      subclass that data parsing will be stopped.
    
    Subclass is responsible for providing pad template caps for source and
    sink pads. The pads need to be named "sink" and "src". It also needs to
    set the fixed caps on srcpad, when the format is ensured (e.g.  when
    base class calls subclass' #GstBaseParseClass::set_sink_caps function).
    
    This base class uses [gid.gst1.types.Format.Default] as a meaning of frames. So,
    subclass conversion routine needs to know that conversion from
    [gid.gst1.types.Format.Time] to [gid.gst1.types.Format.Default] must return the
    frame number that can be found from the given byte position.
    
    #GstBaseParse uses subclasses conversion methods also for seeking (or
    otherwise uses its own default one, see also below).
    
    Subclass @start and @stop functions will be called to inform the beginning
    and end of data processing.
    
    Things that subclass need to take care of:
    
    * Provide pad templates
    * Fixate the source pad caps when appropriate
    * Inform base class how big data chunks should be retrieved. This is
      done with [gid.gstbase1.base_parse.BaseParse.setMinFrameSize] function.
    * Examine data chunks passed to subclass with
      #GstBaseParseClass::handle_frame and pass proper frame(s) to
      [gid.gstbase1.base_parse.BaseParse.finishFrame], and setting src pad caps and timestamps
      on frame.
    * Provide conversion functions
    * Update the duration information with [gid.gstbase1.base_parse.BaseParse.setDuration]
    * Optionally passthrough using [gid.gstbase1.base_parse.BaseParse.setPassthrough]
    * Configure various baseparse parameters using
      [gid.gstbase1.base_parse.BaseParse.setAverageBitrate], [gid.gstbase1.base_parse.BaseParse.setSyncable]
      and [gid.gstbase1.base_parse.BaseParse.setFrameRate].
    
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
*/
@gidGir("BaseParse", "BaseParseClass")
class BaseParse : gid.gst1.element.Element
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
    return cast(void function())gst_base_parse_get_type != &gidSymbolNotFound ? gst_base_parse_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstBaseParse";
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseParse self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.base_parse.BaseParse]
      Returns: New builder object
  */
  static BaseParseGidBuilder builder() nothrow
  {
    return new BaseParseGidBuilder;
  }

  /**
      Get `disableClip` property.
      Returns: Disable dropping buffers that are out of segment
  */
  @property bool disableClip() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("disable-clip");
  }

  /**
      Set `disableClip` property.
      Params:
        propval = Disable dropping buffers that are out of segment
  */
  @property void disableClip(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("disable-clip", propval);
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
  @property bool disablePassthrough() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("disable-passthrough");
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
  @property void disablePassthrough(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("disable-passthrough", propval);
  }

  /**
      Optional.
                        Called until it doesn't return GST_FLOW_OK anymore for
                        the first buffers. Can be used by the subclass to detect
                        the stream format.
  
      Params:
        buffer =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDetect` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncDetect(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.detect)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.detect(cast(GstBaseParse*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional.
                       Allows the subclass to do its own sink get caps if needed.
  
      Params:
        filter =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetSinkCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncGetSinkCaps(gid.gst1.caps.Caps filter)
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.getSinkCaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.getSinkCaps(cast(GstBaseParse*)this._cPtr, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parses the input data into valid frames as defined by subclass
      which should be passed to [gid.gstbase1.base_parse.BaseParse.finishFrame].
      The frame's input buffer is guaranteed writable,
      whereas the input frame ownership is held by caller
      (so subclass should make a copy if it needs to hang on).
      Input buffer (data) is provided by baseclass with as much
      metadata set as possible by baseclass according to upstream
      information and/or subclass settings,
      though subclass may still set buffer timestamp and duration
      if desired.
  
      Params:
        frame =  (modified in place, changes are seen by the caller)
        skipsize = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandleFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncHandleFrame(gid.gstbase1.base_parse_frame.BaseParseFrame frame, out int skipsize)
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.handleFrame)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.handleFrame(cast(GstBaseParse*)this._cPtr, frame ? cast(GstBaseParseFrame*)frame._cPtr(No.Dup) : null, cast(int*)&skipsize);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional.
                        Called just prior to pushing a frame (after any pending
                        events have been sent) to give subclass a chance to perform
                        additional actions at this time (e.g. tag sending) or to
                        decide whether this buffer should be dropped or not
                        (e.g. custom segment clipping).
  
      Params:
        frame =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrePushFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncPrePushFrame(gid.gstbase1.base_parse_frame.BaseParseFrame frame)
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.prePushFrame)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.prePushFrame(cast(GstBaseParse*)this._cPtr, frame ? cast(GstBaseParseFrame*)frame._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optional.
                       Allows the subclass to be notified of the actual caps set.
  
      Params:
        caps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetSinkCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetSinkCaps(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.setSinkCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setSinkCaps(cast(GstBaseParse*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Event handler on the sink pad. This function should chain
                       up to the parent implementation to let the default handler
                       run.
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSinkEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.sinkEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkEvent(cast(GstBaseParse*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                        Query handler on the sink pad. This function should chain
                        up to the parent implementation to let the default handler
                        run (Since: 1.2)
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSinkQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSinkQuery(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.sinkQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sinkQuery(cast(GstBaseParse*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Event handler on the source pad. Should chain up to the
                       parent to let the default handler run.
  
      Params:
        event =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSrcEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSrcEvent(gid.gst1.event.Event event)
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.srcEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcEvent(cast(GstBaseParse*)this._cPtr, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                        Query handler on the source pad. Should chain up to the
                        parent to let the default handler run (Since: 1.2)
  
      Params:
        query =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSrcQuery` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSrcQuery(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.srcQuery)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.srcQuery(cast(GstBaseParse*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Optional.
                       Called when the element starts processing.
                       Allows opening external resources.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStart()
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstBaseParse*)this._cPtr);
    return _retval;
  }

  /**
      Optional.
                       Called when the element stops processing.
                       Allows closing external resources.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStop()
  {
    auto _klass = cast(GstBaseParseClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstBaseParse*)this._cPtr);
    return _retval;
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
  bool addIndexEntry(ulong offset, gid.gst1.types.ClockTime ts, bool key, bool force) nothrow
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
  bool convertDefault(gid.gst1.types.Format srcFormat, long srcValue, gid.gst1.types.Format destFormat, out long destValue) nothrow
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
  void drain() nothrow
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
  gid.gst1.types.FlowReturn finishFrame(gid.gstbase1.base_parse_frame.BaseParseFrame frame, int size) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_parse_finish_frame(cast(GstBaseParse*)this._cPtr, frame ? cast(GstBaseParseFrame*)frame._cPtr(No.Dup) : null, size);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Sets the parser subclass's tags and how they should be merged with any
      upstream stream tags. This will override any tags previously-set
      with [gid.gstbase1.base_parse.BaseParse.mergeTags].
      
      Note that this is provided for convenience, and the subclass is
      not required to use this and can still do tag handling on its own.
  
      Params:
        tags = a #GstTagList to merge, or NULL to unset
              previously-set tags
        mode = the #GstTagMergeMode to use, usually #GST_TAG_MERGE_REPLACE
  */
  void mergeTags(gid.gst1.tag_list.TagList tags, gid.gst1.types.TagMergeMode mode) nothrow
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
  gid.gst1.types.FlowReturn pushFrame(gid.gstbase1.base_parse_frame.BaseParseFrame frame) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_base_parse_push_frame(cast(GstBaseParse*)this._cPtr, frame ? cast(GstBaseParseFrame*)frame._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Optionally sets the average bitrate detected in media (if non-zero),
      e.g. based on metadata, as it will be posted to the application.
      
      By default, announced average bitrate is estimated. The average bitrate
      is used to estimate the total duration of the stream and to estimate
      a seek position, if there's no index and the format is syncable
      (see [gid.gstbase1.base_parse.BaseParse.setSyncable]).
  
      Params:
        bitrate = average bitrate in bits/second
  */
  void setAverageBitrate(uint bitrate) nothrow
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
  void setDuration(gid.gst1.types.Format fmt, long duration, int interval) nothrow
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
  void setFrameRate(uint fpsNum, uint fpsDen, uint leadIn, uint leadOut) nothrow
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
  void setHasTimingInfo(bool hasTiming) nothrow
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
  void setInferTs(bool inferTs) nothrow
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
  void setLatency(gid.gst1.types.ClockTime minLatency, gid.gst1.types.ClockTime maxLatency) nothrow
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
  void setMinFrameSize(uint minSize) nothrow
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
  void setPassthrough(bool passthrough) nothrow
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
  void setPtsInterpolation(bool ptsInterpolate) nothrow
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
  void setSyncable(bool syncable) nothrow
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
  void setTsAtOffset(size_t offset) nothrow
  {
    gst_base_parse_set_ts_at_offset(cast(GstBaseParse*)this._cPtr, offset);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from BaseParse
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstbase1.base_parse.BaseParse), T.stringof ~ " is not derived from gid.gstbase1.base_parse.BaseParse");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDetect", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "detect");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetSinkCaps", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "get_sink_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandleFrame", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "handle_frame");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrePushFrame", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "pre_push_frame");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetSinkCaps", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "set_sink_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkEvent", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "sink_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSinkQuery", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "sink_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcEvent", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "src_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSrcQuery", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "src_query");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstbase1.base_parse.BaseParse))
      _installVfunc(klass, "stop");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstBaseParseClass*)klass;

    switch (vfunc)
    {
      case "detect":
      {
        static extern(C) GstFlowReturn _vfuncDetectTramp(GstBaseParse* parse, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.detect)
              return (cast(typeof(&_vfuncDetectTramp))_klass.detect)(parse, buffer);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDetect(_buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncDetect");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_buffer)
            _buffer._cUnborrow;

          return _retval;
        }

        _klass.detect = cast(typeof(_klass.detect))&_vfuncDetectTramp;
        break;
      }
      case "get_sink_caps":
      {
        static extern(C) GstCaps* _vfuncGetSinkCapsTramp(GstBaseParse* parse, GstCaps* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.getSinkCaps)
              return (cast(typeof(&_vfuncGetSinkCapsTramp))_klass.getSinkCaps)(parse, filter);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;
          auto _filter = filter ? new gid.gst1.caps.Caps(cast(void*)filter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetSinkCaps(_filter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncGetSinkCaps");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;
          if (_filter)
            _filter._cUnborrow;

          return _retval;
        }

        _klass.getSinkCaps = cast(typeof(_klass.getSinkCaps))&_vfuncGetSinkCapsTramp;
        break;
      }
      case "handle_frame":
      {
        static extern(C) GstFlowReturn _vfuncHandleFrameTramp(GstBaseParse* parse, GstBaseParseFrame* frame, int* skipsize) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.handleFrame)
              return (cast(typeof(&_vfuncHandleFrameTramp))_klass.handleFrame)(parse, frame, skipsize);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _frame = frame ? new gid.gstbase1.base_parse_frame.BaseParseFrame(cast(void*)frame, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncHandleFrame(_frame, *skipsize);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncHandleFrame");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_frame)
            _frame._cUnborrow;

          return _retval;
        }

        _klass.handleFrame = cast(typeof(_klass.handleFrame))&_vfuncHandleFrameTramp;
        break;
      }
      case "pre_push_frame":
      {
        static extern(C) GstFlowReturn _vfuncPrePushFrameTramp(GstBaseParse* parse, GstBaseParseFrame* frame) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.prePushFrame)
              return (cast(typeof(&_vfuncPrePushFrameTramp))_klass.prePushFrame)(parse, frame);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _frame = frame ? new gid.gstbase1.base_parse_frame.BaseParseFrame(cast(void*)frame, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncPrePushFrame(_frame);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncPrePushFrame");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_frame)
            _frame._cUnborrow;

          return _retval;
        }

        _klass.prePushFrame = cast(typeof(_klass.prePushFrame))&_vfuncPrePushFrameTramp;
        break;
      }
      case "set_sink_caps":
      {
        static extern(C) gboolean _vfuncSetSinkCapsTramp(GstBaseParse* parse, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.setSinkCaps)
              return (cast(typeof(&_vfuncSetSinkCapsTramp))_klass.setSinkCaps)(parse, caps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetSinkCaps(_caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncSetSinkCaps");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.setSinkCaps = cast(typeof(_klass.setSinkCaps))&_vfuncSetSinkCapsTramp;
        break;
      }
      case "sink_event":
      {
        static extern(C) gboolean _vfuncSinkEventTramp(GstBaseParse* parse, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.sinkEvent)
              return (cast(typeof(&_vfuncSinkEventTramp))_klass.sinkEvent)(parse, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSinkEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncSinkEvent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.sinkEvent = cast(typeof(_klass.sinkEvent))&_vfuncSinkEventTramp;
        break;
      }
      case "sink_query":
      {
        static extern(C) gboolean _vfuncSinkQueryTramp(GstBaseParse* parse, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.sinkQuery)
              return (cast(typeof(&_vfuncSinkQueryTramp))_klass.sinkQuery)(parse, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSinkQuery(_query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncSinkQuery");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.sinkQuery = cast(typeof(_klass.sinkQuery))&_vfuncSinkQueryTramp;
        break;
      }
      case "src_event":
      {
        static extern(C) gboolean _vfuncSrcEventTramp(GstBaseParse* parse, GstEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.srcEvent)
              return (cast(typeof(&_vfuncSrcEventTramp))_klass.srcEvent)(parse, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSrcEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncSrcEvent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.srcEvent = cast(typeof(_klass.srcEvent))&_vfuncSrcEventTramp;
        break;
      }
      case "src_query":
      {
        static extern(C) gboolean _vfuncSrcQueryTramp(GstBaseParse* parse, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.srcQuery)
              return (cast(typeof(&_vfuncSrcQueryTramp))_klass.srcQuery)(parse, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSrcQuery(_query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncSrcQuery");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.srcQuery = cast(typeof(_klass.srcQuery))&_vfuncSrcQueryTramp;
        break;
      }
      case "start":
      {
        static extern(C) gboolean _vfuncStartTramp(GstBaseParse* parse) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(parse);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstBaseParse* parse) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.base_parse.BaseParse)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parse);
          if (!_obj)
          {
            auto _klass = cast(GstBaseParseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parse);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(parse);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.base_parse.BaseParse.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstbase1.base_parse.BaseParse]
class BaseParseGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{

  /**
      Set `disableClip` property.
      Params:
        propval = Disable dropping buffers that are out of segment
      Returns: Builder instance for fluent chaining
  */
  T disableClip(bool propval) nothrow
  {
    return setProperty("disable-clip", propval);
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
      Returns: Builder instance for fluent chaining
  */
  T disablePassthrough(bool propval) nothrow
  {
    return setProperty("disable-passthrough", propval);
  }
}

/// Fluent builder for [gid.gstbase1.base_parse.BaseParse]
final class BaseParseGidBuilder : BaseParseGidBuilderImpl!BaseParseGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BaseParse build() nothrow
  {
    return new BaseParse(cast(void*)createGObject(BaseParse._getGType), Yes.Take);
  }
}
