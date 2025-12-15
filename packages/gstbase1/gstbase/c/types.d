/// C types for gstbase1 library
module gstbase.c.types;

public import gid.basictypes;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gst.c.types;

/** */
enum GstAggregatorStartTimeSelection
{
  /**
      Start at running time 0.
  */
  Zero = 0,

  /**
      Start at the running time of
      the first buffer that is received.
  */
  First = 1,

  /**
      Start at the running time
      selected by the `start-time` property.
  */
  Set = 2,
}

/**
    Flags to be used in a #GstBaseParseFrame.
*/
enum GstBaseParseFrameFlags : uint
{
  /**
      no flag
  */
  None = 0,

  /**
      set by baseclass if current frame
        is passed for processing to the subclass for the first time
        (and not set on subsequent calls with same data).
  */
  NewFrame = 1,

  /**
      set to indicate this buffer should not be
        counted as frame, e.g. if this frame is dependent on a previous one.
        As it is not counted as a frame, bitrate increases but frame to time
        conversions are maintained.
  */
  NoFrame = 2,

  /**
      @pre_push_frame can set this to indicate
         that regular segment clipping can still be performed (as opposed to
         any custom one having been done).
  */
  Clip = 4,

  /**
      indicates to @finish_frame that the
         the frame should be dropped (and might be handled internally by subclass)
  */
  Drop = 8,

  /**
      indicates to @finish_frame that the
         the frame should be queued for now and processed fully later
         when the first non-queued frame is finished
  */
  Queue = 16,
}

/**
    The #GstElement flags that a basesrc element may have.
*/
enum GstBaseSrcFlags : uint
{
  /**
      has source is starting
  */
  Starting = 16384,

  /**
      has source been started
  */
  Started = 32768,

  /**
      offset to define more flags
  */
  Last = 1048576,
}

/** */
enum GstCollectPadsStateFlags : uint
{
  /**
      Set if collectdata's pad is EOS.
  */
  Eos = 1,

  /**
      Set if collectdata's pad is flushing.
  */
  Flushing = 2,

  /**
      Set if collectdata's pad received a
                                           new_segment event.
  */
  NewSegment = 4,

  /**
      Set if collectdata's pad must be waited
                                           for when collecting.
  */
  Waiting = 8,

  /**
      Set collectdata's pad WAITING state must
                                           not be changed.
      #GstCollectPadsStateFlags indicate private state of a collectdata('s pad).
  */
  Locked = 16,
}

/**
    This class is for elements that receive buffers in an undesired size.
    While for example raw video contains one image per buffer, the same is not
    true for a lot of other formats, especially those that come directly from
    a file. So if you have undefined buffer sizes and require a specific size,
    this object is for you.
    
    An adapter is created with [gstbase.adapter.Adapter.new_]. It can be freed again with
    [gobject.object.ObjectWrap.unref].
    
    The theory of operation is like this: All buffers received are put
    into the adapter using [gstbase.adapter.Adapter.push] and the data is then read back
    in chunks of the desired size using [gstbase.adapter.Adapter.map]/[gstbase.adapter.Adapter.unmap]
    and/or [gstbase.adapter.Adapter.copy]. After the data has been processed, it is freed
    using [gstbase.adapter.Adapter.unmap].
    
    Other methods such as [gstbase.adapter.Adapter.take] and [gstbase.adapter.Adapter.takeBuffer]
    combine [gstbase.adapter.Adapter.map] and [gstbase.adapter.Adapter.unmap] in one method and are
    potentially more convenient for some use cases.
    
    For example, a sink pad's chain function that needs to pass data to a library
    in 512-byte chunks could be implemented like this:
    ```c
    static GstFlowReturn
    sink_pad_chain (GstPad *pad, GstObject *parent, GstBuffer *buffer)
    {
      MyElement *this;
      GstAdapter *adapter;
      GstFlowReturn ret = GST_FLOW_OK;
    
      this = MY_ELEMENT (parent);
    
      adapter = this->adapter;
    
      // put buffer into adapter
      gst_adapter_push (adapter, buffer);
    
      // while we can read out 512 bytes, process them
      while (gst_adapter_available (adapter) >= 512 && ret == GST_FLOW_OK) {
        const guint8 *data = gst_adapter_map (adapter, 512);
        // use flowreturn as an error value
        ret = my_library_foo (data);
        gst_adapter_unmap (adapter);
        gst_adapter_flush (adapter, 512);
      }
      return ret;
    }
    ```
    
    For another example, a simple element inside GStreamer that uses #GstAdapter
    is the libvisual element.
    
    An element using #GstAdapter in its sink pad chain function should ensure that
    when the FLUSH_STOP event is received, that any queued data is cleared using
    [gstbase.adapter.Adapter.clear]. Data should also be cleared or processed on EOS and
    when changing state from [gst.types.State.Paused] to [gst.types.State.Ready].
    
    Also check the GST_BUFFER_FLAG_DISCONT flag on the buffer. Some elements might
    need to clear the adapter after a discontinuity.
    
    The adapter will keep track of the timestamps of the buffers
    that were pushed. The last seen timestamp before the current position
    can be queried with [gstbase.adapter.Adapter.prevPts]. This function can
    optionally return the number of bytes between the start of the buffer that
    carried the timestamp and the current adapter position. The distance is
    useful when dealing with, for example, raw audio samples because it allows
    you to calculate the timestamp of the current adapter position by using the
    last seen timestamp and the amount of bytes since.  Additionally, the
    [gstbase.adapter.Adapter.prevPtsAtOffset] can be used to determine the last
    seen timestamp at a particular offset in the adapter.
    
    The adapter will also keep track of the offset of the buffers
    (#GST_BUFFER_OFFSET) that were pushed. The last seen offset before the
    current position can be queried with [gstbase.adapter.Adapter.prevOffset]. This function
    can optionally return the number of bytes between the start of the buffer
    that carried the offset and the current adapter position.
    
    Additionally the adapter also keeps track of the PTS, DTS and buffer offset
    at the last discontinuity, which can be retrieved with
    [gstbase.adapter.Adapter.ptsAtDiscont], [gstbase.adapter.Adapter.dtsAtDiscont] and
    [gstbase.adapter.Adapter.offsetAtDiscont]. The number of bytes that were consumed
    since then can be queried with [gstbase.adapter.Adapter.distanceFromDiscont].
    
    A last thing to note is that while #GstAdapter is pretty optimized,
    merging buffers still might be an operation that requires a `malloc()` and
    `memcpy()` operation, and these operations are not the fastest. Because of
    this, some functions like [gstbase.adapter.Adapter.availableFast] are provided to help
    speed up such cases should you want to. To avoid repeated memory allocations,
    [gstbase.adapter.Adapter.copy] can be used to copy data into a (statically allocated)
    user provided buffer.
    
    #GstAdapter is not MT safe. All operations on an adapter must be serialized by
    the caller. This is not normally a problem, however, as the normal use case
    of #GstAdapter is inside one pad's chain function, in which case access is
    serialized via the pad's STREAM_LOCK.
    
    Note that [gstbase.adapter.Adapter.push] takes ownership of the buffer passed. Use
    gst_buffer_ref() before pushing it into the adapter if you still want to
    access the buffer later. The adapter will never modify the data in the
    buffer pushed in it.
*/
struct GstAdapter;

/** */
struct GstAdapterClass;

/**
    Manages a set of pads with the purpose of aggregating their buffers.
    Control is given to the subclass when all pads have data.
    
     $(LIST
        * Base class for mixers and muxers. Subclasses should at least implement
          the #GstAggregatorClass::aggregate virtual method.
       
        * Installs a #GstPadChainFunction, a #GstPadEventFullFunction and a
          #GstPadQueryFunction to queue all serialized data packets per sink pad.
          Subclasses should not overwrite those, but instead implement
          #GstAggregatorClass::sink_event and #GstAggregatorClass::sink_query as
          needed.
       
        * When data is queued on all pads, the aggregate vmethod is called.
       
        * One can peek at the data on any given GstAggregatorPad with the
          [gstbase.aggregator_pad.AggregatorPad.peekBuffer] method, and remove it from the pad
          with the gst_aggregator_pad_pop_buffer () method. When a buffer
          has been taken with pop_buffer (), a new buffer can be queued
          on that pad.
       
        * When [gstbase.aggregator_pad.AggregatorPad.peekBuffer] or [gstbase.aggregator_pad.AggregatorPad.hasBuffer]
          are called, a reference is taken to the returned buffer, which stays
          valid until either:
       
            - [gstbase.aggregator_pad.AggregatorPad.popBuffer] is called, in which case the caller
              is guaranteed that the buffer they receive is the same as the peeked
              buffer.
            - [gstbase.aggregator_pad.AggregatorPad.dropBuffer] is called, in which case the caller
              is guaranteed that the dropped buffer is the one that was peeked.
            - the subclass implementation of #GstAggregatorClass.aggregate returns.
       
          Subsequent calls to [gstbase.aggregator_pad.AggregatorPad.peekBuffer] or
          [gstbase.aggregator_pad.AggregatorPad.hasBuffer] return / check the same buffer that was
          returned / checked, until one of the conditions listed above is met.
       
          Subclasses are only allowed to call these methods from the aggregate
          thread.
       
        * If the subclass wishes to push a buffer downstream in its aggregate
          implementation, it should do so through the
          [gstbase.aggregator.Aggregator.finishBuffer] method. This method will take care
          of sending and ordering mandatory events such as stream start, caps
          and segment. Buffer lists can also be pushed out with
          [gstbase.aggregator.Aggregator.finishBufferList].
       
        * Same goes for EOS events, which should not be pushed directly by the
          subclass, it should instead return GST_FLOW_EOS in its aggregate
          implementation.
       
        * Note that the aggregator logic regarding gap event handling is to turn
          these into gap buffers with matching PTS and duration. It will also
          flag these buffers with GST_BUFFER_FLAG_GAP and GST_BUFFER_FLAG_DROPPABLE
          to ease their identification and subsequent processing.
          In addition, if the gap event was flagged with GST_GAP_FLAG_MISSING_DATA,
          a custom meta is added to the resulting gap buffer (GstAggregatorMissingDataMeta).
       
        * Subclasses must use (a subclass of) #GstAggregatorPad for both their
          sink and source pads.
          See [gst.element_class.ElementClass.addStaticPadTemplateWithGtype].
     )
       
    This class used to live in gst-plugins-bad and was moved to core.
*/
struct GstAggregator
{
  /** */
  GstElement parent;

  /**
      the aggregator's source pad
  */
  GstPad* srcpad;

  /** */
  GstAggregatorPrivate* priv;

  /** */
  void*[20] GstReserved;
}

/**
    The aggregator base class will handle in a thread-safe way all manners of
    concurrent flushes, seeks, pad additions and removals, leaving to the
    subclass the responsibility of clipping buffers, and aggregating buffers in
    the way the implementor sees fit.
    
    It will also take care of event ordering (stream-start, segment, eos).
    
    Basically, a simple implementation will override @aggregate, and call
    _finish_buffer from inside that function.
*/
struct GstAggregatorClass
{
  /** */
  GstElementClass parentClass;

  /**
      Optional.
                       Called after a successful flushing seek, once all the flush
                       stops have been received. Flush pad-specific data in
                       #GstAggregatorPad->flush.
  */
  extern(C) GstFlowReturn function(GstAggregator* aggregator) flush;

  /**
      Optional.
                       Called when a buffer is received on a sink pad, the task of
                       clipping it and translating it to the current segment falls
                       on the subclass. The function should use the segment of data
                       and the negotiated media type on the pad to perform
                       clipping of input buffer. This function takes ownership of
                       buf and should output a buffer or return NULL in
                       if the buffer should be dropped.
  */
  extern(C) GstBuffer* function(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad, GstBuffer* buf) clip;

  /**
      Optional.
                       Called when a subclass calls [gstbase.aggregator.Aggregator.finishBuffer]
                       from their aggregate function to push out a buffer.
                       Subclasses can override this to modify or decorate buffers
                       before they get pushed out. This function takes ownership
                       of the buffer passed. Subclasses that override this method
                       should always chain up to the parent class virtual method.
  */
  extern(C) GstFlowReturn function(GstAggregator* aggregator, GstBuffer* buffer) finishBuffer;

  /**
      Optional.
                       Called when an event is received on a sink pad, the subclass
                       should always chain up.
  */
  extern(C) gboolean function(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad, GstEvent* event) sinkEvent;

  /**
      Optional.
                       Called when a query is received on a sink pad, the subclass
                       should always chain up.
  */
  extern(C) gboolean function(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad, GstQuery* query) sinkQuery;

  /**
      Optional.
                       Called when an event is received on the src pad, the subclass
                       should always chain up.
  */
  extern(C) gboolean function(GstAggregator* aggregator, GstEvent* event) srcEvent;

  /**
      Optional.
                       Called when a query is received on the src pad, the subclass
                       should always chain up.
  */
  extern(C) gboolean function(GstAggregator* aggregator, GstQuery* query) srcQuery;

  /**
      Optional.
                       Called when the src pad is activated, it will start/stop its
                       pad task right after that call.
  */
  extern(C) gboolean function(GstAggregator* aggregator, GstPadMode mode, gboolean active) srcActivate;

  /**
      Mandatory.
                       Called when buffers are queued on all sinkpads. Classes
                       should iterate the GstElement->sinkpads and peek or steal
                       buffers from the #GstAggregatorPads. If the subclass returns
                       GST_FLOW_EOS, sending of the eos event will be taken care
                       of. Once / if a buffer has been constructed from the
                       aggregated buffers, the subclass should call _finish_buffer.
  */
  extern(C) GstFlowReturn function(GstAggregator* aggregator, gboolean timeout) aggregate;

  /**
      Optional.
                       Called when the element goes from PAUSED to READY.
                       The subclass should free all resources and reset its state.
  */
  extern(C) gboolean function(GstAggregator* aggregator) stop;

  /**
      Optional.
                       Called when the element goes from READY to PAUSED.
                       The subclass should get ready to process
                       aggregated buffers.
  */
  extern(C) gboolean function(GstAggregator* aggregator) start;

  /**
      Optional.
                       Called when the element needs to know the running time of the next
                       rendered buffer for live pipelines. This causes deadline
                       based aggregation to occur. Defaults to returning
                       GST_CLOCK_TIME_NONE causing the element to wait for buffers
                       on all sink pads before aggregating.
  */
  extern(C) GstClockTime function(GstAggregator* aggregator) getNextTime;

  /**
      Optional.
                       Called when a new pad needs to be created. Allows subclass that
                       don't have a single sink pad template to provide a pad based
                       on the provided information.
  */
  extern(C) GstAggregatorPad* function(GstAggregator* self, GstPadTemplate* templ, const(char)* reqName, const(GstCaps)* caps) createNewPad;

  /**
      Lets subclasses update the #GstCaps representing
                        the src pad caps before usage.  The result should end up
                        in @ret. Return `GST_AGGREGATOR_FLOW_NEED_DATA` to indicate that the
                        element needs more information (caps, a buffer, etc) to
                        choose the correct caps. Should return ANY caps if the
                        stream has not caps at all.
  */
  extern(C) GstFlowReturn function(GstAggregator* self, GstCaps* caps, GstCaps** ret) updateSrcCaps;

  /**
      Optional.
                        Fixate and return the src pad caps provided.  The function takes
                        ownership of @caps and returns a fixated version of
                        @caps. @caps is not guaranteed to be writable.
  */
  extern(C) GstCaps* function(GstAggregator* self, GstCaps* caps) fixateSrcCaps;

  /**
      Optional.
                            Notifies subclasses what caps format has been negotiated
  */
  extern(C) gboolean function(GstAggregator* self, GstCaps* caps) negotiatedSrcCaps;

  /**
      Optional.
                          Allows the subclass to influence the allocation choices.
                          Setup the allocation parameters for allocating output
                          buffers. The passed in query contains the result of the
                          downstream allocation query.
  */
  extern(C) gboolean function(GstAggregator* self, GstQuery* query) decideAllocation;

  /**
      Optional.
                          Allows the subclass to handle the allocation query from upstream.
  */
  extern(C) gboolean function(GstAggregator* self, GstAggregatorPad* pad, GstQuery* decideQuery, GstQuery* query) proposeAllocation;

  /**
      Optional.
                  Negotiate the caps with the peer (Since: 1.18).
  */
  extern(C) gboolean function(GstAggregator* self) negotiate;

  /**
      Optional.
                             Called when an event is received on a sink pad before queueing up
                             serialized events. The subclass should always chain up (Since: 1.18).
  */
  extern(C) GstFlowReturn function(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad, GstEvent* event) sinkEventPreQueue;

  /**
      Optional.
                             Called when a query is received on a sink pad before queueing up
                             serialized queries. The subclass should always chain up (Since: 1.18).
  */
  extern(C) gboolean function(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad, GstQuery* query) sinkQueryPreQueue;

  /** */
  extern(C) GstFlowReturn function(GstAggregator* aggregator, GstBufferList* bufferlist) finishBufferList;

  /** */
  extern(C) GstSample* function(GstAggregator* aggregator, GstAggregatorPad* aggregatorPad) peekNextSample;

  /** */
  void*[15] GstReserved;
}

/**
    Pads managed by a #GstAggregator subclass.
    
    This class used to live in gst-plugins-bad and was moved to core.
*/
struct GstAggregatorPad
{
  /** */
  GstPad parent;

  /**
      last segment received.
  */
  GstSegment segment;

  /** */
  GstAggregatorPadPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAggregatorPadClass
{
  /** */
  GstPadClass parentClass;

  /**
      Optional
                    Called when the pad has received a flush stop, this is the place
                    to flush any information specific to the pad, it allows for individual
                    pads to be flushed while others might not be.
  */
  extern(C) GstFlowReturn function(GstAggregatorPad* aggpad, GstAggregator* aggregator) flush;

  /**
      Optional
                    Called before input buffers are queued in the pad, return true
                    if the buffer should be skipped.
  */
  extern(C) gboolean function(GstAggregatorPad* aggpad, GstAggregator* aggregator, GstBuffer* buffer) skipBuffer;

  /** */
  void*[20] GstReserved;
}

/** */
struct GstAggregatorPadPrivate;

/** */
struct GstAggregatorPrivate;

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
struct GstBaseParse
{
  /**
      the parent element.
  */
  GstElement element;

  /** */
  GstPad* sinkpad;

  /** */
  GstPad* srcpad;

  /** */
  uint flags;

  /** */
  GstSegment segment;

  /** */
  void*[20] GstReserved;

  /** */
  GstBaseParsePrivate* priv;
}

/**
    Subclasses can override any of the available virtual methods or not, as
    needed. At minimum @handle_frame needs to be overridden.
*/
struct GstBaseParseClass
{
  /**
      the parent class
  */
  GstElementClass parentClass;

  /**
      Optional.
                       Called when the element starts processing.
                       Allows opening external resources.
  */
  extern(C) gboolean function(GstBaseParse* parse) start;

  /**
      Optional.
                       Called when the element stops processing.
                       Allows closing external resources.
  */
  extern(C) gboolean function(GstBaseParse* parse) stop;

  /**
      Optional.
                       Allows the subclass to be notified of the actual caps set.
  */
  extern(C) gboolean function(GstBaseParse* parse, GstCaps* caps) setSinkCaps;

  /**
      Parses the input data into valid frames as defined by subclass
                       which should be passed to [gstbase.base_parse.BaseParse.finishFrame].
                       The frame's input buffer is guaranteed writable,
                       whereas the input frame ownership is held by caller
                       (so subclass should make a copy if it needs to hang on).
                       Input buffer (data) is provided by baseclass with as much
                       metadata set as possible by baseclass according to upstream
                       information and/or subclass settings,
                       though subclass may still set buffer timestamp and duration
                       if desired.
  */
  extern(C) GstFlowReturn function(GstBaseParse* parse, GstBaseParseFrame* frame, int* skipsize) handleFrame;

  /**
      Optional.
                        Called just prior to pushing a frame (after any pending
                        events have been sent) to give subclass a chance to perform
                        additional actions at this time (e.g. tag sending) or to
                        decide whether this buffer should be dropped or not
                        (e.g. custom segment clipping).
  */
  extern(C) GstFlowReturn function(GstBaseParse* parse, GstBaseParseFrame* frame) prePushFrame;

  /**
      Optional.
                       Convert between formats.
  */
  extern(C) gboolean function(GstBaseParse* parse, GstFormat srcFormat, long srcValue, GstFormat destFormat, long* destValue) convert;

  /**
      Optional.
                       Event handler on the sink pad. This function should chain
                       up to the parent implementation to let the default handler
                       run.
  */
  extern(C) gboolean function(GstBaseParse* parse, GstEvent* event) sinkEvent;

  /**
      Optional.
                       Event handler on the source pad. Should chain up to the
                       parent to let the default handler run.
  */
  extern(C) gboolean function(GstBaseParse* parse, GstEvent* event) srcEvent;

  /**
      Optional.
                       Allows the subclass to do its own sink get caps if needed.
  */
  extern(C) GstCaps* function(GstBaseParse* parse, GstCaps* filter) getSinkCaps;

  /**
      Optional.
                        Called until it doesn't return GST_FLOW_OK anymore for
                        the first buffers. Can be used by the subclass to detect
                        the stream format.
  */
  extern(C) GstFlowReturn function(GstBaseParse* parse, GstBuffer* buffer) detect;

  /**
      Optional.
                        Query handler on the sink pad. This function should chain
                        up to the parent implementation to let the default handler
                        run (Since: 1.2)
  */
  extern(C) gboolean function(GstBaseParse* parse, GstQuery* query) sinkQuery;

  /**
      Optional.
                        Query handler on the source pad. Should chain up to the
                        parent to let the default handler run (Since: 1.2)
  */
  extern(C) gboolean function(GstBaseParse* parse, GstQuery* query) srcQuery;

  /** */
  void*[18] GstReserved;
}

/**
    Frame (context) data passed to each frame parsing virtual methods.  In
    addition to providing the data to be checked for a valid frame or an already
    identified frame, it conveys additional metadata or control information
    from and to the subclass w.r.t. the particular frame in question (rather
    than global parameters).  Some of these may apply to each parsing stage, others
    only to some a particular one.  These parameters are effectively zeroed at start
    of each frame's processing, i.e. parsing virtual method invocation sequence.
*/
struct GstBaseParseFrame
{
  /**
      input data to be parsed for frames.
  */
  GstBuffer* buffer;

  /**
      output data.
  */
  GstBuffer* outBuffer;

  /**
      a combination of input and output #GstBaseParseFrameFlags that
       convey additional context to subclass or allow subclass to tune
       subsequent #GstBaseParse actions.
  */
  uint flags;

  /**
      media specific offset of input frame
        Note that a converter may have a different one on the frame's buffer.
  */
  ulong offset;

  /**
      subclass can set this to indicates the metadata overhead
        for the given frame, which is then used to enable more accurate bitrate
        computations. If this is -1, it is assumed that this frame should be
        skipped in bitrate calculation.
  */
  int overhead;

  /** */
  int size;

  /** */
  uint[2] GstReservedI;

  /** */
  void*[2] GstReservedP;

  /** */
  uint PrivateFlags;
}

/** */
struct GstBaseParsePrivate;

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
    function returns `GST_CLOCK_TIME_NONE` for the start time, no synchronisation
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
struct GstBaseSink
{
  /** */
  GstElement element;

  /** */
  GstPad* sinkpad;

  /** */
  GstPadMode padMode;

  /** */
  ulong offset;

  /** */
  gboolean canActivatePull;

  /** */
  gboolean canActivatePush;

  /** */
  GMutex prerollLock;

  /** */
  GCond prerollCond;

  /** */
  gboolean eos;

  /** */
  gboolean needPreroll;

  /** */
  gboolean havePreroll;

  /** */
  gboolean playingAsync;

  /** */
  gboolean haveNewsegment;

  /** */
  GstSegment segment;

  /** */
  GstClockID clockId;

  /** */
  gboolean sync;

  /** */
  gboolean flushing;

  /** */
  gboolean running;

  /** */
  long maxLateness;

  /** */
  GstBaseSinkPrivate* priv;

  /** */
  void*[20] GstReserved;
}

/**
    Subclasses can override any of the available virtual methods or not, as
    needed. At the minimum, the @render method should be overridden to
    output/present buffers.
*/
struct GstBaseSinkClass
{
  /**
      Element parent class
  */
  GstElementClass parentClass;

  /**
      Called to get sink pad caps from the subclass
  */
  extern(C) GstCaps* function(GstBaseSink* sink, GstCaps* filter) getCaps;

  /**
      Notify subclass of changed caps
  */
  extern(C) gboolean function(GstBaseSink* sink, GstCaps* caps) setCaps;

  /**
      Only useful in pull mode. Implement if you have
          ideas about what should be the default values for the caps you support.
  */
  extern(C) GstCaps* function(GstBaseSink* sink, GstCaps* caps) fixate;

  /**
      Subclasses should override this when they can provide an
          alternate method of spawning a thread to drive the pipeline in pull mode.
          Should start or stop the pulling thread, depending on the value of the
          "active" argument. Called after actually activating the sink pad in pull
          mode. The default implementation starts a task on the sink pad.
  */
  extern(C) gboolean function(GstBaseSink* sink, gboolean active) activatePull;

  /**
      Called to get the start and end times for synchronising
          the passed buffer to the clock
  */
  extern(C) void function(GstBaseSink* sink, GstBuffer* buffer, GstClockTime* start, GstClockTime* end) getTimes;

  /**
      configure the allocation query
  */
  extern(C) gboolean function(GstBaseSink* sink, GstQuery* query) proposeAllocation;

  /**
      Start processing. Ideal for opening resources in the subclass
  */
  extern(C) gboolean function(GstBaseSink* sink) start;

  /**
      Stop processing. Subclasses should use this to close resources.
  */
  extern(C) gboolean function(GstBaseSink* sink) stop;

  /**
      Unlock any pending access to the resource. Subclasses should
          unblock any blocked function ASAP and call [gstbase.base_sink.BaseSink.waitPreroll]
  */
  extern(C) gboolean function(GstBaseSink* sink) unlock;

  /**
      Clear the previous unlock request. Subclasses should clear
          any state they set during #GstBaseSinkClass::unlock, and be ready to
          continue where they left off after [gstbase.base_sink.BaseSink.waitPreroll],
          [gstbase.base_sink.BaseSink.wait] or gst_wait_sink_wait_clock() return or
          #GstBaseSinkClass::render is called again.
  */
  extern(C) gboolean function(GstBaseSink* sink) unlockStop;

  /**
      perform a #GstQuery on the element.
  */
  extern(C) gboolean function(GstBaseSink* sink, GstQuery* query) query;

  /**
      Override this to handle events arriving on the sink pad
  */
  extern(C) gboolean function(GstBaseSink* sink, GstEvent* event) event;

  /**
      Override this to implement custom logic to wait for the event
          time (for events like EOS and GAP). Subclasses should always first
          chain up to the default implementation.
  */
  extern(C) GstFlowReturn function(GstBaseSink* sink, GstEvent* event) waitEvent;

  /**
      Called to prepare the buffer for @render and @preroll. This
          function is called before synchronisation is performed.
  */
  extern(C) GstFlowReturn function(GstBaseSink* sink, GstBuffer* buffer) prepare;

  /**
      Called to prepare the buffer list for @render_list. This
          function is called before synchronisation is performed.
  */
  extern(C) GstFlowReturn function(GstBaseSink* sink, GstBufferList* bufferList) prepareList;

  /**
      Called to present the preroll buffer if desired.
  */
  extern(C) GstFlowReturn function(GstBaseSink* sink, GstBuffer* buffer) preroll;

  /**
      Called when a buffer should be presented or output, at the
          correct moment if the #GstBaseSink has been set to sync to the clock.
  */
  extern(C) GstFlowReturn function(GstBaseSink* sink, GstBuffer* buffer) render;

  /**
      Same as @render but used with buffer lists instead of
          buffers.
  */
  extern(C) GstFlowReturn function(GstBaseSink* sink, GstBufferList* bufferList) renderList;

  /** */
  void*[20] GstReserved;
}

/** */
struct GstBaseSinkPrivate;

/**
    This is a generic base class for source elements. The following
    types of sources are supported:
    
      $(LIST
          * random access sources like files
          * seekable sources
          * live sources
      )
        
    The source can be configured to operate in any #GstFormat with the
    [gstbase.base_src.BaseSrc.setFormat] method. The currently set format determines
    the format of the internal #GstSegment and any [gst.types.EventType.Segment]
    events. The default format for #GstBaseSrc is [gst.types.Format.Bytes].
    
    #GstBaseSrc always supports push mode scheduling. If the following
    conditions are met, it also supports pull mode scheduling:
    
      $(LIST
          * The format is set to [gst.types.Format.Bytes] (default).
          * #GstBaseSrcClass::is_seekable returns true.
      )
        
    If all the conditions are met for operating in pull mode, #GstBaseSrc is
    automatically seekable in push mode as well. The following conditions must
    be met to make the element seekable in push mode when the format is not
    [gst.types.Format.Bytes]:
    
    $(LIST
      * #GstBaseSrcClass::is_seekable returns true.
      * #GstBaseSrcClass::query can convert all supported seek formats to the
        internal format as set with [gstbase.base_src.BaseSrc.setFormat].
      * #GstBaseSrcClass::do_seek is implemented, performs the seek and returns
         true.
    )
      
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
    Use [gstbase.base_src.BaseSrc.setLive] to activate the live source mode.
    
    A live source does not produce data in the PAUSED state. This means that the
    #GstBaseSrcClass::create method will not be called in PAUSED but only in
    PLAYING. To signal the pipeline that the element will not produce data, the
    return value from the READY to PAUSED state will be
    [gst.types.StateChangeReturn.NoPreroll].
    
    A typical live source will timestamp the buffers it creates with the
    current running time of the pipeline. This is one reason why a live source
    can only produce data in the PLAYING state, when the clock is actually
    distributed and running.
    
    Live sources that synchronize and block on the clock (an audio source, for
    example) can use [gstbase.base_src.BaseSrc.waitPlaying] when the
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
    [gst.types.MessageType.SegmentDone] on the bus). This can typically be done
    with the [gst.element.Element.sendEvent] function on the element or its parent bin.
    
    After the EOS has been sent to the element, the application should wait for
    an EOS message to be posted on the pipeline's bus. Once this EOS message is
    received, it may safely shut down the entire pipeline.
*/
struct GstBaseSrc
{
  /** */
  GstElement element;

  /** */
  GstPad* srcpad;

  /** */
  GMutex liveLock;

  /** */
  GCond liveCond;

  /** */
  gboolean isLive;

  /** */
  gboolean liveRunning;

  /** */
  uint blocksize;

  /** */
  gboolean canActivatePush;

  /** */
  gboolean randomAccess;

  /** */
  GstClockID clockId;

  /** */
  GstSegment segment;

  /** */
  gboolean needNewsegment;

  /** */
  int numBuffers;

  /** */
  int numBuffersLeft;

  /** */
  gboolean typefind;

  /** */
  gboolean running;

  /** */
  GstEvent* pendingSeek;

  /** */
  GstBaseSrcPrivate* priv;

  /** */
  void*[20] GstReserved;
}

/**
    Subclasses can override any of the available virtual methods or not, as
    needed. At the minimum, the @create method should be overridden to produce
    buffers.
*/
struct GstBaseSrcClass
{
  /**
      Element parent class
  */
  GstElementClass parentClass;

  /**
      Called to get the caps to report
  */
  extern(C) GstCaps* function(GstBaseSrc* src, GstCaps* filter) getCaps;

  /**
      Negotiated the caps with the peer.
  */
  extern(C) gboolean function(GstBaseSrc* src) negotiate;

  /**
      Called during negotiation if caps need fixating. Implement instead of
        setting a fixate function on the source pad.
  */
  extern(C) GstCaps* function(GstBaseSrc* src, GstCaps* caps) fixate;

  /**
      Notify subclass of changed output caps
  */
  extern(C) gboolean function(GstBaseSrc* src, GstCaps* caps) setCaps;

  /**
      configure the allocation query
  */
  extern(C) gboolean function(GstBaseSrc* src, GstQuery* query) decideAllocation;

  /**
      Start processing. Subclasses should open resources and prepare
         to produce data. Implementation should call [gstbase.base_src.BaseSrc.startComplete]
         when the operation completes, either from the current thread or any other
         thread that finishes the start operation asynchronously.
  */
  extern(C) gboolean function(GstBaseSrc* src) start;

  /**
      Stop processing. Subclasses should use this to close resources.
  */
  extern(C) gboolean function(GstBaseSrc* src) stop;

  /**
      Given a buffer, return the start and stop time when it
         should be pushed out. The base class will sync on the clock using
         these times.
  */
  extern(C) void function(GstBaseSrc* src, GstBuffer* buffer, GstClockTime* start, GstClockTime* end) getTimes;

  /**
      Return the total size of the resource, in the format set by
          [gstbase.base_src.BaseSrc.setFormat].
  */
  extern(C) gboolean function(GstBaseSrc* src, ulong* size) getSize;

  /**
      Check if the source can seek
  */
  extern(C) gboolean function(GstBaseSrc* src) isSeekable;

  /**
      Prepare the #GstSegment that will be passed to the
        #GstBaseSrcClass::do_seek vmethod for executing a seek
        request. Sub-classes should override this if they support seeking in
        formats other than the configured native format. By default, it tries to
        convert the seek arguments to the configured native format and prepare a
        segment in that format.
  */
  extern(C) gboolean function(GstBaseSrc* src, GstEvent* seek, GstSegment* segment) prepareSeekSegment;

  /**
      Perform seeking on the resource to the indicated segment.
  */
  extern(C) gboolean function(GstBaseSrc* src, GstSegment* segment) doSeek;

  /**
      Unlock any pending access to the resource. Subclasses should unblock
         any blocked function ASAP. In particular, any `create()` function in
         progress should be unblocked and should return GST_FLOW_FLUSHING. Any
         future #GstBaseSrcClass::create function call should also return
         GST_FLOW_FLUSHING until the #GstBaseSrcClass::unlock_stop function has
         been called.
  */
  extern(C) gboolean function(GstBaseSrc* src) unlock;

  /**
      Clear the previous unlock request. Subclasses should clear any
         state they set during #GstBaseSrcClass::unlock, such as clearing command
         queues.
  */
  extern(C) gboolean function(GstBaseSrc* src) unlockStop;

  /**
      Handle a requested query.
  */
  extern(C) gboolean function(GstBaseSrc* src, GstQuery* query) query;

  /**
      Override this to implement custom event handling.
  */
  extern(C) gboolean function(GstBaseSrc* src, GstEvent* event) event;

  /**
      Ask the subclass to create a buffer with offset and size.  When the
        subclass returns GST_FLOW_OK, it MUST return a buffer of the requested size
        unless fewer bytes are available because an EOS condition is near. No
        buffer should be returned when the return value is different from
        GST_FLOW_OK. A return value of GST_FLOW_EOS signifies that the end of
        stream is reached. The default implementation will call
        #GstBaseSrcClass::alloc and then call #GstBaseSrcClass::fill.
  */
  extern(C) GstFlowReturn function(GstBaseSrc* src, ulong offset, uint size, GstBuffer** buf) create;

  /**
      Ask the subclass to allocate a buffer with for offset and size. The
        default implementation will create a new buffer from the negotiated allocator.
  */
  extern(C) GstFlowReturn function(GstBaseSrc* src, ulong offset, uint size, GstBuffer** buf) alloc;

  /**
      Ask the subclass to fill the buffer with data for offset and size. The
        passed buffer is guaranteed to hold the requested amount of bytes.
  */
  extern(C) GstFlowReturn function(GstBaseSrc* src, ulong offset, uint size, GstBuffer* buf) fill;

  /** */
  void*[20] GstReserved;
}

/** */
struct GstBaseSrcPrivate;

/**
    This base class is for filter elements that process data. Elements
    that are suitable for implementation using #GstBaseTransform are ones
    where the size and caps of the output is known entirely from the input
    caps and buffer sizes. These include elements that directly transform
    one buffer into another, modify the contents of a buffer in-place, as
    well as elements that collate multiple input buffers into one output buffer,
    or that expand one input buffer into multiple output buffers. See below
    for more concrete use cases.
    
    It provides for:
    
    $(LIST
      * one sinkpad and one srcpad
      * Possible formats on sink and source pad implemented
        with custom transform_caps function. By default uses
        same format on sink and source.
      
      * Handles state changes
      * Does flushing
      * Push mode
      * Pull mode if the sub-class transform can operate on arbitrary data
    )
      
    # Use Cases
    
    ## Passthrough mode
    
      $(LIST
          * Element has no interest in modifying the buffer. It may want to inspect it,
            in which case the element should have a transform_ip function. If there
            is no transform_ip function in passthrough mode, the buffer is pushed
            intact.
        
          * The #GstBaseTransformClass.passthrough_on_same_caps variable
            will automatically set/unset passthrough based on whether the
            element negotiates the same caps on both pads.
        
          * #GstBaseTransformClass.passthrough_on_same_caps on an element that
            doesn't implement a transform_caps function is useful for elements that
            only inspect data (such as level)
        
          * Example elements
        
            * Level
            * Videoscale, audioconvert, videoconvert, audioresample in certain modes.
      )
        
    ## Modifications in-place - input buffer and output buffer are the same thing.
    
    $(LIST
      * The element must implement a transform_ip function.
      * Output buffer size must <= input buffer size
      * If the always_in_place flag is set, non-writable buffers will be copied
        and passed to the transform_ip function, otherwise a new buffer will be
        created and the transform function called.
      
      * Incoming writable buffers will be passed to the transform_ip function
        immediately.
      * only implementing transform_ip and not transform implies always_in_place = true
      
        * Example elements:
          * Volume
          * Audioconvert in certain modes (signed/unsigned conversion)
          * videoconvert in certain modes (endianness swapping)
    )
      
    ## Modifications only to the caps/metadata of a buffer
    
    $(LIST
      * The element does not require writable data, but non-writable buffers
        should be subbuffered so that the meta-information can be replaced.
      
      * Elements wishing to operate in this mode should replace the
        prepare_output_buffer method to create subbuffers of the input buffer
        and set always_in_place to true
      
      * Example elements
        * Capsfilter when setting caps on outgoing buffers that have
          none.
        * identity when it is going to re-timestamp buffers by
          datarate.
    )
      
    ## Normal mode
      $(LIST
          * always_in_place flag is not set, or there is no transform_ip function
          * Element will receive an input buffer and output buffer to operate on.
          * Output buffer is allocated by calling the prepare_output_buffer function.
          * Example elements:
            * Videoscale, videoconvert, audioconvert when doing
            scaling/conversions
      )
        
    ## Special output buffer allocations
      $(LIST
          * Elements which need to do special allocation of their output buffers
            beyond allocating output buffers via the negotiated allocator or
            buffer pool should implement the prepare_output_buffer method.
        
          * Example elements:
            * efence
      )
        
    # Sub-class settable flags on GstBaseTransform
    
    $(LIST
      * passthrough
      
        * Implies that in the current configuration, the sub-class is not interested in modifying the buffers.
        * Elements which are always in passthrough mode whenever the same caps has been negotiated on both pads can set the class variable passthrough_on_same_caps to have this behaviour automatically.
      
      * always_in_place
        * Determines whether a non-writable buffer will be copied before passing
          to the transform_ip function.
      
        * Implied true if no transform function is implemented.
        * Implied false if ONLY transform function is implemented.
    )
*/
struct GstBaseTransform
{
  /** */
  GstElement element;

  /** */
  GstPad* sinkpad;

  /** */
  GstPad* srcpad;

  /** */
  gboolean haveSegment;

  /** */
  GstSegment segment;

  /** */
  GstBuffer* queuedBuf;

  /** */
  GstBaseTransformPrivate* priv;

  /** */
  void*[19] GstReserved;
}

/**
    Subclasses can override any of the available virtual methods or not, as
    needed. At minimum either @transform or @transform_ip need to be overridden.
    If the element can overwrite the input data with the results (data is of the
    same type and quantity) it should provide @transform_ip.
*/
struct GstBaseTransformClass
{
  /**
      Element parent class
  */
  GstElementClass parentClass;

  /**
      If set to true, passthrough mode will be
                                 automatically enabled if the caps are the same.
                                 Set to false by default.
  */
  gboolean passthroughOnSameCaps;

  /**
      If set to true, @transform_ip will be called in
                                passthrough mode. The passed buffer might not be
                                writable. When false, neither @transform nor
                                @transform_ip will be called in passthrough mode.
                                Set to true by default.
  */
  gboolean transformIpOnPassthrough;

  /**
      Optional.  Given the pad in this direction and the given
                       caps, what caps are allowed on the other pad in this
                       element ?
  */
  extern(C) GstCaps* function(GstBaseTransform* trans, GstPadDirection direction, GstCaps* caps, GstCaps* filter) transformCaps;

  /**
      Optional. Given the pad in this direction and the given
                       caps, fixate the caps on the other pad. The function takes
                       ownership of @othercaps and returns a fixated version of
                       @othercaps. @othercaps is not guaranteed to be writable.
  */
  extern(C) GstCaps* function(GstBaseTransform* trans, GstPadDirection direction, GstCaps* caps, GstCaps* othercaps) fixateCaps;

  /**
      Optional.
                       Subclasses can override this method to check if @caps can be
                       handled by the element. The default implementation might not be
                       the most optimal way to check this in all cases.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstPadDirection direction, GstCaps* caps) acceptCaps;

  /**
      Allows the subclass to be notified of the actual caps set.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstCaps* incaps, GstCaps* outcaps) setCaps;

  /**
      Optional.
                       Handle a requested query. Subclasses that implement this
                       must chain up to the parent if they didn't handle the
                       query
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstPadDirection direction, GstQuery* query) query;

  /**
      Setup the allocation parameters for allocating output
                         buffers. The passed in query contains the result of the
                         downstream allocation query. This function is only called
                         when not operating in passthrough mode. The default
                         implementation will remove all memory dependent metadata.
                         If there is a @filter_meta method implementation, it will
                         be called for all metadata API in the downstream query,
                         otherwise the metadata API is removed.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstQuery* query) decideAllocation;

  /**
      Return true if the metadata API should be proposed in the
                    upstream allocation query. The default implementation is null
                    and will cause all metadata to be removed.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstQuery* query, GType api, const(GstStructure)* params) filterMeta;

  /**
      Propose buffer allocation parameters for upstream elements.
                           This function must be implemented if the element reads or
                           writes the buffer content. The query that was passed to
                           the decide_allocation is passed in this method (or null
                           when the element is in passthrough mode). The default
                           implementation will pass the query downstream when in
                           passthrough mode and will copy all the filtered metadata
                           API in non-passthrough mode.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstQuery* decideQuery, GstQuery* query) proposeAllocation;

  /**
      Optional. Given the size of a buffer in the given direction
                       with the given caps, calculate the size in bytes of a buffer
                       on the other pad with the given other caps.
                       The default implementation uses get_unit_size and keeps
                       the number of units the same.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstPadDirection direction, GstCaps* caps, size_t size, GstCaps* othercaps, size_t* othersize) transformSize;

  /**
      Required if the transform is not in-place.
                       Get the size in bytes of one unit for the given caps.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstCaps* caps, size_t* size) getUnitSize;

  /**
      Optional.
                       Called when the element starts processing.
                       Allows opening external resources.
  */
  extern(C) gboolean function(GstBaseTransform* trans) start;

  /**
      Optional.
                       Called when the element stops processing.
                       Allows closing external resources.
  */
  extern(C) gboolean function(GstBaseTransform* trans) stop;

  /**
      Optional.
                       Event handler on the sink pad. The default implementation
                       handles the event and forwards it downstream.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstEvent* event) sinkEvent;

  /**
      Optional.
                       Event handler on the source pad. The default implementation
                       handles the event and forwards it upstream.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstEvent* event) srcEvent;

  /**
      Optional.
                              Subclasses can override this to do their own
                              allocation of output buffers.  Elements that only do
                              analysis can return a subbuffer or even just
                              return a reference to the input buffer (if in
                              passthrough mode). The default implementation will
                              use the negotiated allocator or bufferpool and
                              transform_size to allocate an output buffer or it
                              will return the input buffer in passthrough mode.
  */
  extern(C) GstFlowReturn function(GstBaseTransform* trans, GstBuffer* input, GstBuffer** outbuf) prepareOutputBuffer;

  /**
      Optional.
                      Copy the metadata from the input buffer to the output buffer.
                      The default implementation will copy the flags, timestamps and
                      offsets of the buffer.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstBuffer* input, GstBuffer* outbuf) copyMetadata;

  /**
      Optional. Transform the metadata on the input buffer to the
                       output buffer. By default this method copies all meta without
                       tags. Subclasses can implement this method and return true if
                       the metadata is to be copied.
  */
  extern(C) gboolean function(GstBaseTransform* trans, GstBuffer* outbuf, GstMeta* meta, GstBuffer* inbuf) transformMeta;

  /**
      Optional.
                         This method is called right before the base class will
                         start processing. Dynamic properties or other delayed
                         configuration could be performed in this method.
  */
  extern(C) void function(GstBaseTransform* trans, GstBuffer* buffer) beforeTransform;

  /**
      Required if the element does not operate in-place.
                       Transforms one incoming buffer to one outgoing buffer.
                       The function is allowed to change size/timestamp/duration
                       of the outgoing buffer.
  */
  extern(C) GstFlowReturn function(GstBaseTransform* trans, GstBuffer* inbuf, GstBuffer* outbuf) transform;

  /**
      Required if the element operates in-place.
                       Transform the incoming buffer in-place.
  */
  extern(C) GstFlowReturn function(GstBaseTransform* trans, GstBuffer* buf) transformIp;

  /**
      Function which accepts a new input buffer and pre-processes it.
                       The default implementation performs caps (re)negotiation, then
                       QoS if needed, and places the input buffer into the @queued_buf
                       member variable. If the buffer is dropped due to QoS, it returns
                       GST_BASE_TRANSFORM_FLOW_DROPPED. If this input buffer is not
                       contiguous with any previous input buffer, then @is_discont
                       is set to true. (Since: 1.6)
  */
  extern(C) GstFlowReturn function(GstBaseTransform* trans, gboolean isDiscont, GstBuffer* input) submitInputBuffer;

  /**
      Called after each new input buffer is submitted repeatedly
                        until it either generates an error or fails to generate an output
                        buffer. The default implementation takes the contents of the
                        @queued_buf variable, generates an output buffer if needed
                        by calling the class @prepare_output_buffer, and then
                        calls either @transform or @transform_ip. Elements that don't
                        do 1-to-1 transformations of input to output buffers can either
                        return GST_BASE_TRANSFORM_FLOW_DROPPED or simply not generate
                        an output buffer until they are ready to do so. (Since: 1.6)
  */
  extern(C) GstFlowReturn function(GstBaseTransform* trans, GstBuffer** outbuf) generateOutput;

  /** */
  void*[18] GstReserved;
}

/** */
struct GstBaseTransformPrivate;

/**
    #GstBitReader provides a bit reader that can read any number of bits
    from a memory buffer. It provides functions for reading any number of bits
    into 8, 16, 32 and 64 bit variables.
*/
struct GstBitReader
{
  /**
      Data from which the bit reader will
        read
  */
  const(ubyte)* data;

  /**
      Size of @data in bytes
  */
  uint size;

  /**
      Current byte position
  */
  uint byte_;

  /**
      Bit position in the current byte
  */
  uint bit;

  /** */
  void*[4] GstReserved;
}

/**
    #GstBitWriter provides a bit writer that can write any number of
    bits into a memory buffer. It provides functions for writing any
    number of bits into 8, 16, 32 and 64 bit variables.
*/
struct GstBitWriter
{
  /**
      Allocated @data for bit writer to write
  */
  ubyte* data;

  /**
      Size of written @data in bits
  */
  uint bitSize;

  /** */
  uint bitCapacity;

  /** */
  gboolean autoGrow;

  /** */
  gboolean owned;

  /** */
  void*[4] GstReserved;
}

/**
    #GstByteReader provides a byte reader that can read different integer and
    floating point types from a memory buffer. It provides functions for reading
    signed/unsigned, little/big endian integers of 8, 16, 24, 32 and 64 bits
    and functions for reading little/big endian floating points numbers of
    32 and 64 bits. It also provides functions to read NUL-terminated strings
    in various character encodings.
*/
struct GstByteReader
{
  /**
      Data from which the bit reader will
        read
  */
  const(ubyte)* data;

  /**
      Size of @data in bytes
  */
  uint size;

  /**
      Current byte position
  */
  uint byte_;

  /** */
  void*[4] GstReserved;
}

/**
    #GstByteWriter provides a byte writer and reader that can write/read different
    integer and floating point types to/from a memory buffer. It provides functions
    for writing/reading signed/unsigned, little/big endian integers of 8, 16, 24,
    32 and 64 bits and functions for reading little/big endian floating points numbers of
    32 and 64 bits. It also provides functions to write/read NUL-terminated strings
    in various character encodings.
*/
struct GstByteWriter
{
  /**
      #GstByteReader parent
  */
  GstByteReader parent;

  /**
      Allocation size of the data
  */
  uint allocSize;

  /**
      If true no reallocations are allowed
  */
  gboolean fixed;

  /**
      If false no reallocations are allowed and copies of data are returned
  */
  gboolean owned;

  /** */
  void*[4] GstReserved;
}

/**
    Structure used by the collect_pads.
*/
struct GstCollectData
{
  /**
      owner #GstCollectPads
  */
  GstCollectPads* collect;

  /**
      #GstPad managed by this data
  */
  GstPad* pad;

  /**
      currently queued buffer.
  */
  GstBuffer* buffer;

  /**
      position in the buffer
  */
  uint pos;

  /**
      last segment received.
  */
  GstSegment segment;

  /** */
  GstCollectPadsStateFlags state;

  /** */
  GstCollectDataPrivate* priv;

  /** */
  /** */
  union ABIType
  {
    /** */
    /** */
    struct AbiType
    {
      /** */
      long dts;
    }

    AbiType abi;

    /** */
    void*[4] GstReserved;
  }

  ABIType ABI;
}

/** */
struct GstCollectDataPrivate;

/**
    Manages a set of pads that operate in collect mode. This means that control
    is given to the manager of this object when all pads have data.
    
      $(LIST
          * Collectpads are created with [gstbase.collect_pads.CollectPads.new_]. A callback should then
            be installed with gst_collect_pads_set_function ().
        
          * Pads are added to the collection with [gstbase.collect_pads.CollectPads.addPad]/
            [gstbase.collect_pads.CollectPads.removePad]. The pad has to be a sinkpad. When added,
            the chain, event and query functions of the pad are overridden. The
            element_private of the pad is used to store private information for the
            collectpads.
        
          * For each pad, data is queued in the _chain function or by
            performing a pull_range.
        
          * When data is queued on all pads in waiting mode, the callback function is called.
        
          * Data can be dequeued from the pad with the [gstbase.collect_pads.CollectPads.pop] method.
            One can peek at the data with the [gstbase.collect_pads.CollectPads.peek] function.
            These functions will return null if the pad received an EOS event. When all
            pads return null from a [gstbase.collect_pads.CollectPads.peek], the element can emit an EOS
            event itself.
        
          * Data can also be dequeued in byte units using the [gstbase.collect_pads.CollectPads.available],
            [gstbase.collect_pads.CollectPads.readBuffer] and [gstbase.collect_pads.CollectPads.flush] calls.
        
          * Elements should call [gstbase.collect_pads.CollectPads.start] and [gstbase.collect_pads.CollectPads.stop] in
            their state change functions to start and stop the processing of the collectpads.
            The [gstbase.collect_pads.CollectPads.stop] call should be called before calling the parent
            element state change function in the PAUSED_TO_READY state change to ensure
            no pad is blocked and the element can finish streaming.
        
          * [gstbase.collect_pads.CollectPads.setWaiting] sets a pad to waiting or non-waiting mode.
            CollectPads element is not waiting for data to be collected on non-waiting pads.
            Thus these pads may but need not have data when the callback is called.
            All pads are in waiting mode by default.
      )
*/
struct GstCollectPads
{
  /** */
  GstObject object;

  /**
      #GList of #GstCollectData managed
        by this #GstCollectPads.
  */
  GSList* data;

  /** */
  GRecMutex streamLock;

  /** */
  GstCollectPadsPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstCollectPadsClass
{
  /** */
  GstObjectClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstCollectPadsPrivate;

/**
    #GstDataQueue is an object that handles threadsafe queueing of objects. It
    also provides size-related functionality. This object should be used for
    any #GstElement that wishes to provide some sort of queueing functionality.
*/
struct GstDataQueue
{
  /**
      the parent structure
  */
  GObject object;

  /** */
  GstDataQueuePrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstDataQueueClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GstDataQueue* queue) empty;

  /** */
  extern(C) void function(GstDataQueue* queue) full;

  /** */
  void*[4] GstReserved;
}

/**
    Structure used by #GstDataQueue. You can supply a different structure, as
    long as the top of the structure is identical to this structure.
*/
struct GstDataQueueItem
{
  /**
      the #GstMiniObject to queue.
  */
  GstMiniObject* object;

  /**
      the size in bytes of the miniobject.
  */
  uint size;

  /**
      the duration in #GstClockTime of the miniobject. Can not be
      `GST_CLOCK_TIME_NONE`.
  */
  ulong duration;

  /**
      true if @object should be considered as a visible object.
  */
  gboolean visible;

  /**
      The #GDestroyNotify function to use to free the #GstDataQueueItem.
      This function should also drop the reference to @object the owner of the
      #GstDataQueueItem is assumed to hold.
  */
  GDestroyNotify destroy;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstDataQueuePrivate;

/**
    Structure describing the size of a queue.
*/
struct GstDataQueueSize
{
  /**
      number of buffers
  */
  uint visible;

  /**
      number of bytes
  */
  uint bytes;

  /**
      amount of time
  */
  ulong time;
}

/**
    Utility struct to help handling #GstFlowReturn combination. Useful for
    #GstElement<!-- -->s that have multiple source pads and need to combine
    the different #GstFlowReturn for those pads.
    
    #GstFlowCombiner works by using the last #GstFlowReturn for all #GstPad
    it has in its list and computes the combined return value and provides
    it to the caller.
    
    To add a new pad to the #GstFlowCombiner use [gstbase.flow_combiner.FlowCombiner.addPad].
    The new #GstPad is stored with a default value of [gst.types.FlowReturn.Ok].
    
    In case you want a #GstPad to be removed, use [gstbase.flow_combiner.FlowCombiner.removePad].
    
    Please be aware that this struct isn't thread safe as its designed to be
     used by demuxers, those usually will have a single thread operating it.
    
    These functions will take refs on the passed #GstPad<!-- -->s.
    
    Aside from reducing the user's code size, the main advantage of using this
    helper struct is to follow the standard rules for #GstFlowReturn combination.
    These rules are:
    
    $(LIST
      * [gst.types.FlowReturn.Eos]: only if all returns are EOS too
      * [gst.types.FlowReturn.NotLinked]: only if all returns are NOT_LINKED too
      * [gst.types.FlowReturn.Error] or below: if at least one returns an error return
      * [gst.types.FlowReturn.NotNegotiated]: if at least one returns a not-negotiated return
      * [gst.types.FlowReturn.Flushing]: if at least one returns flushing
      * [gst.types.FlowReturn.Ok]: otherwise
    )
      
    [gst.types.FlowReturn.Error] or below, GST_FLOW_NOT_NEGOTIATED and GST_FLOW_FLUSHING are
    returned immediately from the [gstbase.flow_combiner.FlowCombiner.updateFlow] function.
*/
struct GstFlowCombiner;

/**
    This class is mostly useful for elements that cannot do
    random access, or at least very slowly. The source usually
    prefers to push out a fixed size buffer.
    
    Subclasses usually operate in a format that is different from the
    default GST_FORMAT_BYTES format of #GstBaseSrc.
    
    Classes extending this base class will usually be scheduled
    in a push based mode. If the peer accepts to operate without
    offsets and within the limits of the allowed block size, this
    class can operate in getrange based mode automatically. To make
    this possible, the subclass should implement and override the
    SCHEDULING query.
    
    The subclass should extend the methods from the baseclass in
    addition to the ::create method.
    
    Seeking, flushing, scheduling and sync is all handled by this
    base class.
*/
struct GstPushSrc
{
  /** */
  GstBaseSrc parent;

  /** */
  void*[4] GstReserved;
}

/**
    Subclasses can override any of the available virtual methods or not, as
    needed. At the minimum, the @fill method should be overridden to produce
    buffers.
*/
struct GstPushSrcClass
{
  /**
      Element parent class
  */
  GstBaseSrcClass parentClass;

  /**
      Ask the subclass to create a buffer. The subclass decides which
               size this buffer should be. Other then that, refer to
               #GstBaseSrc<!-- -->.create() for more details. If this method is
               not implemented, @alloc followed by @fill will be called.
  */
  extern(C) GstFlowReturn function(GstPushSrc* src, GstBuffer** buf) create;

  /**
      Ask the subclass to allocate a buffer. The subclass decides which
              size this buffer should be. The default implementation will create
              a new buffer from the negotiated allocator.
  */
  extern(C) GstFlowReturn function(GstPushSrc* src, GstBuffer** buf) alloc;

  /**
      Ask the subclass to fill the buffer with data.
  */
  extern(C) GstFlowReturn function(GstPushSrc* src, GstBuffer* buf) fill;

  /** */
  void*[4] GstReserved;
}

/**
    #GstQueueArray is an object that provides standard queue functionality
    based on an array instead of linked lists. This reduces the overhead
    caused by memory management by a large factor.
*/
struct GstQueueArray;

/**
    The opaque #GstTypeFindData structure.
*/
struct GstTypeFindData;

alias extern(C) void function(GstCollectData* data) GstCollectDataDestroyNotify;

alias extern(C) GstFlowReturn function(GstCollectPads* pads, GstCollectData* data, GstBuffer* buffer, void* userData) GstCollectPadsBufferFunction;

alias extern(C) GstFlowReturn function(GstCollectPads* pads, GstCollectData* data, GstBuffer* inbuffer, GstBuffer** outbuffer, void* userData) GstCollectPadsClipFunction;

alias extern(C) int function(GstCollectPads* pads, GstCollectData* data1, GstClockTime timestamp1, GstCollectData* data2, GstClockTime timestamp2, void* userData) GstCollectPadsCompareFunction;

alias extern(C) gboolean function(GstCollectPads* pads, GstCollectData* pad, GstEvent* event, void* userData) GstCollectPadsEventFunction;

alias extern(C) void function(GstCollectPads* pads, void* userData) GstCollectPadsFlushFunction;

alias extern(C) GstFlowReturn function(GstCollectPads* pads, void* userData) GstCollectPadsFunction;

alias extern(C) gboolean function(GstCollectPads* pads, GstCollectData* pad, GstQuery* query, void* userData) GstCollectPadsQueryFunction;

alias extern(C) gboolean function(GstDataQueue* queue, uint visible, uint bytes, ulong time, void* checkdata) GstDataQueueCheckFullFunction;

alias extern(C) void function(GstDataQueue* queue, void* checkdata) GstDataQueueEmptyCallback;

alias extern(C) void function(GstDataQueue* queue, void* checkdata) GstDataQueueFullCallback;

alias extern(C) GstFlowReturn function(GstObject* obj, GstObject* parent, ulong offset, uint length, GstBuffer** buffer) GstTypeFindHelperGetRangeFunction;

