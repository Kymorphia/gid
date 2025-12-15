/// C types for gst1 library
module gst.c.types;

public import gid.basictypes;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;

/**
    Alias for #GstMapInfo to be used with g_auto():
    ```c
    void my_func(GstBuffer *buf)
    {
      g_auto(GstBufferMapInfo) map = GST_MAP_INFO_INIT;
      if (!gst_buffer_map(buf, &map, GST_MAP_READWRITE))
        return;
      ...
      // No need to call gst_buffer_unmap()
    }
    ```
    
    #GstMapInfo cannot be used with g_auto() because it is ambiguous whether it
    needs to be unmapped using [gst.buffer.Buffer.unmap] or [gst.memory.Memory.unmap].
    
    See also #GstMemoryMapInfo.
*/
alias GstBufferMapInfo = GstMapInfo;

/**
    A datatype to hold the handle to an outstanding sync or async clock callback.
*/
alias GstClockID = void*;

/**
    A datatype to hold a time, measured in nanoseconds.
*/
alias GstClockTime = ulong;

/**
    A datatype to hold a time difference, measured in nanoseconds.
*/
alias GstClockTimeDiff = long;

/**
    A type defining the type of an element factory.
*/
alias GstElementFactoryListType = ulong;

/**
    Alias for #GstMapInfo to be used with g_auto():
    ```c
    void my_func(GstMemory *mem)
    {
      g_auto(GstMemoryMapInfo) map = GST_MAP_INFO_INIT;
      if (!gst_memory_map(mem, &map, GST_MAP_READWRITE))
        return;
      ...
      // No need to call gst_memory_unmap()
    }
    ```
    
    #GstMapInfo cannot be used with g_auto() because it is ambiguous whether it
    needs to be unmapped using [gst.buffer.Buffer.unmap] or [gst.memory.Memory.unmap].
    
    See also #GstBufferMapInfo.
*/
alias GstMemoryMapInfo = GstMapInfo;

/**
    Flags for allocators.
*/
enum GstAllocatorFlags : uint
{
  /**
      The allocator has a custom alloc function.
         Only elements designed to work with this allocator should be using it,
         other elements should ignore it from allocation propositions.
         This implies [gst.types.AllocatorFlags.NoCopy].
  */
  CustomAlloc = 16,

  /**
      When copying a #GstMemory allocated with this allocator, the copy will
      instead be allocated using the default allocator. Use this when allocating a
      new memory is an heavy opperation that should only be done with a
      #GstBufferPool for example.
  */
  NoCopy = 32,

  /**
      first flag that can be used for custom purposes
  */
  Last = 1048576,
}

/**
    GstBinFlags are a set of flags specific to bins. Most are set/used
    internally. They can be checked using the GST_OBJECT_FLAG_IS_SET() macro,
    and (un)set using GST_OBJECT_FLAG_SET() and GST_OBJECT_FLAG_UNSET().
*/
enum GstBinFlags : uint
{
  /**
      Don't resync a state change when elements are added or linked in the bin
  */
  NoResync = 16384,

  /**
      Indicates whether the bin can handle elements that add/remove source pads
      at any point in time without first posting a no-more-pads signal.
  */
  StreamsAware = 32768,

  /**
      The last enum in the series of flags for bins. Derived classes can use this
      as first value in a list of flags.
  */
  Last = 524288,
}

/**
    A set of flags that can be provided to the [gst.buffer.Buffer.copyInto]
    function to specify which items should be copied.
*/
enum GstBufferCopyFlags : uint
{
  /**
      copy nothing
  */
  None = 0,

  /**
      flag indicating that buffer flags should be copied
  */
  Flags = 1,

  /**
      flag indicating that buffer pts, dts,
        duration, offset and offset_end should be copied
  */
  Timestamps = 2,

  /**
      flag indicating that buffer meta should be
        copied
  */
  Meta = 4,

  /**
      flag indicating that buffer memory should be reffed
        and appended to already existing memory. Unless the memory is marked as
        NO_SHARE, no actual copy of the memory is made but it is simply reffed.
        Add @GST_BUFFER_COPY_DEEP to force a real copy.
  */
  Memory = 8,

  /**
      flag indicating that buffer memory should be
        merged
  */
  Merge = 16,

  /**
      flag indicating that memory should always be copied instead of reffed
  */
  Deep = 32,
}

/**
    A set of buffer flags used to describe properties of a #GstBuffer.
*/
enum GstBufferFlags : uint
{
  /**
      the buffer is live data and should be discarded in
                                      the PAUSED state.
  */
  Live = 16,

  /**
      the buffer contains data that should be dropped
                                      because it will be clipped against the segment
                                      boundaries or because it does not contain data
                                      that should be shown to the user.
  */
  DecodeOnly = 32,

  /**
      the buffer marks a data discontinuity in the stream.
                                      This typically occurs after a seek or a dropped buffer
                                      from a live or network source.
  */
  Discont = 64,

  /**
      the buffer timestamps might have a discontinuity
                                      and this buffer is a good point to resynchronize.
  */
  Resync = 128,

  /**
      the buffer data is corrupted.
  */
  Corrupted = 256,

  /**
      the buffer contains a media specific marker. for
                                      video this is the end of a frame boundary, for audio
                                      this is the start of a talkspurt. for RTP
                                      packets this matches the marker flag in the
                                      RTP packet header.
  */
  Marker = 512,

  /**
      the buffer contains header information that is
                                      needed to decode the following data.
  */
  Header = 1024,

  /**
      the buffer has been created to fill a gap in the
                                      stream and contains media neutral data (elements can
                                      switch to optimized code path that ignores the buffer
                                      content).
  */
  Gap = 2048,

  /**
      the buffer can be dropped without breaking the
                                      stream, for example to reduce bandwidth.
  */
  Droppable = 4096,

  /**
      this unit cannot be decoded independently.
  */
  DeltaUnit = 8192,

  /**
      this flag is set when memory of the buffer
                                      is added/removed
  */
  TagMemory = 16384,

  /**
      Elements which write to disk or permanent storage should ensure the data
      is synced after writing the contents of this buffer.
  */
  SyncAfter = 32768,

  /**
      This buffer is important and should not be dropped.
      
      This can be used to mark important buffers, e.g. to flag RTP packets
      carrying keyframes or codec setup data for RTP Forward Error Correction
      purposes, or to prevent still video frames from being dropped by elements
      due to QoS.
  */
  NonDroppable = 65536,

  /**
      additional media specific flags can be added starting from
                                      this flag.
  */
  Last = 1048576,
}

/**
    Additional flags to control the allocation of a buffer
*/
enum GstBufferPoolAcquireFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      buffer is keyframe
  */
  KeyUnit = 1,

  /**
      when the bufferpool is empty, acquire_buffer
      will by default block until a buffer is released into the pool again. Setting
      this flag makes acquire_buffer return #GST_FLOW_EOS instead of blocking.
  */
  Dontwait = 2,

  /**
      buffer is discont
  */
  Discont = 4,

  /**
      last flag, subclasses can use private flags
         starting from this value.
  */
  Last = 65536,
}

/**
    The different types of buffering methods.
*/
enum GstBufferingMode
{
  /**
      a small amount of data is buffered
  */
  Stream = 0,

  /**
      the stream is being downloaded
  */
  Download = 1,

  /**
      the stream is being downloaded in a ringbuffer
  */
  Timeshift = 2,

  /**
      the stream is a live stream
  */
  Live = 3,
}

/**
    The standard flags that a bus may have.
*/
enum GstBusFlags : uint
{
  /**
      The bus is currently dropping all messages
  */
  Flushing = 16,

  /**
      offset to define more flags
  */
  FlagLast = 32,
}

/**
    The result values for a GstBusSyncHandler.
*/
enum GstBusSyncReply
{
  /**
      drop the message
  */
  Drop = 0,

  /**
      pass the message to the async queue
  */
  Pass = 1,

  /**
      pass message to async queue, continue if message is handled
  */
  Async = 2,
}

/**
    Extra flags for a caps.
*/
enum GstCapsFlags : uint
{
  /**
      Caps has no specific content, but can contain
         anything.
  */
  Any = 16,
}

/**
    Modes of caps intersection
    
    [gst.types.CapsIntersectMode.ZigZag] tries to preserve overall order of both caps
    by iterating on the caps' structures as the following matrix shows:
    
    ```
             caps1
          +-------------
          | 1  2  4  7
    caps2 | 3  5  8 10
          | 6  9 11 12
    ```
    
    Used when there is no explicit precedence of one caps over the other. e.g.
    tee's sink pad getcaps function, it will probe its src pad peers' for their
    caps and intersect them with this mode.
    
    [gst.types.CapsIntersectMode.First] is useful when an element wants to preserve
    another element's caps priority order when intersecting with its own caps.
    Example: If caps1 is `[A, B, C]` and caps2 is `[E, B, D, A]`, the result
    would be `[A, B]`, maintaining the first caps priority on the intersection.
*/
enum GstCapsIntersectMode
{
  /**
      Zig-zags over both caps.
  */
  ZigZag = 0,

  /**
      Keeps the first caps order.
  */
  First = 1,
}

/**
    The type of the clock entry
*/
enum GstClockEntryType
{
  /**
      a single shot timeout
  */
  Single = 0,

  /**
      a periodic timeout request
  */
  Periodic = 1,
}

/**
    The capabilities of this clock
*/
enum GstClockFlags : uint
{
  /**
      clock can do a single sync timeout request
  */
  CanDoSingleSync = 16,

  /**
      clock can do a single async timeout request
  */
  CanDoSingleAsync = 32,

  /**
      clock can do sync periodic timeout requests
  */
  CanDoPeriodicSync = 64,

  /**
      clock can do async periodic timeout callbacks
  */
  CanDoPeriodicAsync = 128,

  /**
      clock's resolution can be changed
  */
  CanSetResolution = 256,

  /**
      clock can be slaved to a master clock
  */
  CanSetMaster = 512,

  /**
      clock needs to be synced before it can be used
  */
  NeedsStartupSync = 1024,

  /**
      subclasses can add additional flags starting from this flag
  */
  Last = 4096,
}

/**
    The return value of a clock operation.
*/
enum GstClockReturn
{
  /**
      The operation succeeded.
  */
  Ok = 0,

  /**
      The operation was scheduled too late.
  */
  Early = 1,

  /**
      The clockID was unscheduled
  */
  Unscheduled = 2,

  /**
      The ClockID is busy
  */
  Busy = 3,

  /**
      A bad time was provided to a function.
  */
  Badtime = 4,

  /**
      An error occurred
  */
  Error = 5,

  /**
      Operation is not supported
  */
  Unsupported = 6,

  /**
      The ClockID is done waiting
  */
  Done = 7,
}

/**
    The different kind of clocks.
*/
enum GstClockType
{
  /**
      time since Epoch
  */
  Realtime = 0,

  /**
      monotonic time since some unspecified starting
                                 point
  */
  Monotonic = 1,

  /**
      some other time source is used (Since: 1.0.5)
  */
  Other = 2,

  /**
      time since Epoch, but using International Atomic Time
                           as reference (Since: 1.18)
  */
  Tai = 3,
}

/**
    Core errors are errors inside the core GStreamer library.
*/
enum GstCoreError
{
  /**
      a general error which doesn't fit in any other
      category.  Make sure you add a custom message to the error call.
  */
  Failed = 1,

  /**
      do not use this except as a placeholder for
      deciding where to go while developing code.
  */
  TooLazy = 2,

  /**
      use this when you do not want to implement
      this functionality yet.
  */
  NotImplemented = 3,

  /**
      used for state change errors.
  */
  StateChange = 4,

  /**
      used for pad-related errors.
  */
  Pad = 5,

  /**
      used for thread-related errors.
  */
  Thread = 6,

  /**
      used for negotiation-related errors.
  */
  Negotiation = 7,

  /**
      used for event-related errors.
  */
  Event = 8,

  /**
      used for seek-related errors.
  */
  Seek = 9,

  /**
      used for caps-related errors.
  */
  Caps = 10,

  /**
      used for negotiation-related errors.
  */
  Tag = 11,

  /**
      used if a plugin is missing.
  */
  MissingPlugin = 12,

  /**
      used for clock related errors.
  */
  Clock = 13,

  /**
      used if functionality has been disabled at
                                compile time.
  */
  Disabled = 14,

  /**
      the number of core error types.
  */
  NumErrors = 15,
}

/**
    These are some terminal style flags you can use when creating your
    debugging categories to make them stand out in debugging output.
*/
enum GstDebugColorFlags : uint
{
  /**
      Use black as foreground color.
  */
  FgBlack = 0,

  /**
      Use red as foreground color.
  */
  FgRed = 1,

  /**
      Use green as foreground color.
  */
  FgGreen = 2,

  /**
      Use yellow as foreground color.
  */
  FgYellow = 3,

  /**
      Use blue as foreground color.
  */
  FgBlue = 4,

  /**
      Use magenta as foreground color.
  */
  FgMagenta = 5,

  /**
      Use cyan as foreground color.
  */
  FgCyan = 6,

  /**
      Use white as foreground color.
  */
  FgWhite = 7,

  /**
      Use black as background color.
  */
  BgBlack = 0,

  /**
      Use red as background color.
  */
  BgRed = 16,

  /**
      Use green as background color.
  */
  BgGreen = 32,

  /**
      Use yellow as background color.
  */
  BgYellow = 48,

  /**
      Use blue as background color.
  */
  BgBlue = 64,

  /**
      Use magenta as background color.
  */
  BgMagenta = 80,

  /**
      Use cyan as background color.
  */
  BgCyan = 96,

  /**
      Use white as background color.
  */
  BgWhite = 112,

  /**
      Make the output bold.
  */
  Bold = 256,

  /**
      Underline the output.
  */
  Underline = 512,
}

/** */
enum GstDebugColorMode
{
  /**
      Do not use colors in logs.
  */
  Off = 0,

  /**
      Paint logs in a platform-specific way.
  */
  On = 1,

  /**
      Paint logs with UNIX terminal color codes
                                  no matter what platform GStreamer is running on.
  */
  Unix = 2,
}

/**
    Available details for pipeline graphs produced by GST_DEBUG_BIN_TO_DOT_FILE()
    and GST_DEBUG_BIN_TO_DOT_FILE_WITH_TS().
*/
enum GstDebugGraphDetails : uint
{
  /**
      show caps-name on edges
  */
  MediaType = 1,

  /**
      show caps-details on edges
  */
  CapsDetails = 2,

  /**
      show modified parameters on
                                                elements
  */
  NonDefaultParams = 4,

  /**
      show element states
  */
  States = 8,

  /**
      show full element parameter values even
                                         if they are very long
  */
  FullParams = 16,

  /**
      show all the typical details that one might want
  */
  All = 15,

  /**
      show all details regardless of how large or
                                     verbose they make the resulting output
  */
  Verbose = 4294967295,
}

/**
    The level defines the importance of a debugging message. The more important a
    message is, the greater the probability that the debugging system outputs it.
*/
enum GstDebugLevel
{
  /**
      No debugging level specified or desired. Used to deactivate
       debugging output.
  */
  None = 0,

  /**
      Error messages are to be used only when an error occurred
       that stops the application from keeping working correctly.
       An examples is gst_element_error, which outputs a message with this priority.
       It does not mean that the application is terminating as with g_error.
  */
  Error = 1,

  /**
      Warning messages are to inform about abnormal behaviour
       that could lead to problems or weird behaviour later on. An example of this
       would be clocking issues ("your computer is pretty slow") or broken input
       data ("Can't synchronize to stream.")
  */
  Warning = 2,

  /**
      Fixme messages are messages that indicate that something
       in the executed code path is not fully implemented or handled yet. Note
       that this does not replace proper error handling in any way, the purpose
       of this message is to make it easier to spot incomplete/unfinished pieces
       of code when reading the debug log.
  */
  Fixme = 3,

  /**
      Informational messages should be used to keep the developer
       updated about what is happening.
       Examples where this should be used are when a typefind function has
       successfully determined the type of the stream or when an mp3 plugin detects
       the format to be used. ("This file has mono sound.")
  */
  Info = 4,

  /**
      Debugging messages should be used when something common
       happens that is not the expected default behavior, or something that's
       useful to know but doesn't happen all the time (ie. per loop iteration or
       buffer processed or event handled).
       An example would be notifications about state changes or receiving/sending
       of events.
  */
  Debug = 5,

  /**
      Log messages are messages that are very common but might be
       useful to know. As a rule of thumb a pipeline that is running as expected
       should never output anything else but LOG messages whilst processing data.
       Use this log level to log recurring information in chain functions and
       loop functions, for example.
  */
  Log = 6,

  /**
      Tracing-related messages.
       Examples for this are referencing/dereferencing of objects.
  */
  Trace = 7,

  /**
      memory dump messages are used to log (small) chunks of
       data as memory dumps in the log. They will be displayed as hexdump with
       ASCII characters.
  */
  Memdump = 9,

  /**
      The number of defined debugging levels.
  */
  Count = 10,
}

/**
    The standard flags that an element may have.
*/
enum GstElementFlags : uint
{
  /**
      ignore state changes from parent
  */
  LockedState = 16,

  /**
      the element is a sink
  */
  Sink = 32,

  /**
      the element is a source.
  */
  Source = 64,

  /**
      the element can provide a clock
  */
  ProvideClock = 128,

  /**
      the element requires a clock
  */
  RequireClock = 256,

  /**
      the element can use an index
  */
  Indexable = 512,

  /**
      offset to define more flags
  */
  Last = 16384,
}

/**
    #GstEventType lists the standard event types that can be sent in a pipeline.
    
    The custom event types can be used for private messages between elements
    that can't be expressed using normal
    GStreamer buffer passing semantics. Custom events carry an arbitrary
    #GstStructure.
    Specific custom events are distinguished by the name of the structure.
*/
enum GstEventType
{
  /**
      unknown event.
  */
  Unknown = 0,

  /**
      Start a flush operation. This event clears all data
                      from the pipeline and unblock all streaming threads.
  */
  FlushStart = 2563,

  /**
      Stop a flush operation. This event resets the
                      running-time of the pipeline.
  */
  FlushStop = 5127,

  /**
      Event to mark the start of a new stream. Sent before any
                      other serialized event and only sent at the start of a new stream,
                      not after flushing seeks.
  */
  StreamStart = 10254,

  /**
      #GstCaps event. Notify the pad of a new media type.
  */
  Caps = 12814,

  /**
      A new media segment follows in the dataflow. The
                      segment events contains information for clipping buffers and
                      converting buffer timestamps to running-time and
                      stream-time.
  */
  Segment = 17934,

  /**
      A new #GstStreamCollection is available (Since: 1.10)
  */
  StreamCollection = 19230,

  /**
      A new set of metadata tags has been found in the stream.
  */
  Tag = 20510,

  /**
      Notification of buffering requirements. Currently not
                      used yet.
  */
  Buffersize = 23054,

  /**
      An event that sinks turn into a message. Used to
                               send messages that should be emitted in sync with
                               rendering.
  */
  SinkMessage = 25630,

  /**
      Indicates that there is no more data for
                      the stream group ID in the message. Sent before EOS
                      in some instances and should be handled mostly the same. (Since: 1.10)
  */
  StreamGroupDone = 26894,

  /**
      End-Of-Stream. No more data is to be expected to follow
                      without either a STREAM_START event, or a FLUSH_STOP and a SEGMENT
                      event.
  */
  Eos = 28174,

  /**
      An event which indicates that a new table of contents (TOC)
                      was found or updated.
  */
  Toc = 30750,

  /**
      An event which indicates that new or updated
                      encryption information has been found in the stream.
  */
  Protection = 33310,

  /**
      Marks the end of a segment playback.
  */
  SegmentDone = 38406,

  /**
      Marks a gap in the datastream.
  */
  Gap = 40966,

  /**
      Notify downstream that a playback rate override
                                      should be applied as soon as possible. (Since: 1.18)
  */
  InstantRateChange = 46090,

  /**
      A quality message. Used to indicate to upstream elements
                      that the downstream elements should adjust their processing
                      rate.
  */
  Qos = 48641,

  /**
      A request for a new playback position and rate.
  */
  Seek = 51201,

  /**
      Navigation events are usually used for communicating
                             user requests, such as mouse or keyboard movements,
                             to upstream elements.
  */
  Navigation = 53761,

  /**
      Notification of new latency adjustment. Sinks will use
                          the latency information to adjust their synchronisation.
  */
  Latency = 56321,

  /**
      A request for stepping through the media. Sinks will usually
                       execute the step operation.
  */
  Step = 58881,

  /**
      A request for upstream renegotiating caps and reconfiguring.
  */
  Reconfigure = 61441,

  /**
      A request for a new playback position based on TOC
                             entry's UID.
  */
  TocSelect = 64001,

  /**
      A request to select one or more streams (Since: 1.10)
  */
  SelectStreams = 66561,

  /**
      Sent by the pipeline to notify elements that handle the
                                         instant-rate-change event about the running-time when
                                         the rate multiplier should be applied (or was applied). (Since: 1.18)
  */
  InstantRateSyncTime = 66817,

  /**
      Upstream custom event
  */
  CustomUpstream = 69121,

  /**
      Downstream custom event that travels in the
                             data flow.
  */
  CustomDownstream = 71686,

  /**
      Custom out-of-band downstream event.
  */
  CustomDownstreamOob = 74242,

  /**
      Custom sticky downstream event.
  */
  CustomDownstreamSticky = 76830,

  /**
      Custom upstream or downstream event.
                              In-band when travelling downstream.
  */
  CustomBoth = 79367,

  /**
      Custom upstream or downstream out-of-band event.
  */
  CustomBothOob = 81923,
}

/**
    #GstEventTypeFlags indicate the aspects of the different #GstEventType
    values. You can get the type flags of a #GstEventType with the
    [gst.global.eventTypeGetFlags] function.
*/
enum GstEventTypeFlags : uint
{
  /**
      Set if the event can travel upstream.
  */
  Upstream = 1,

  /**
      Set if the event can travel downstream.
  */
  Downstream = 2,

  /**
      Set if the event should be serialized with data
                                    flow.
  */
  Serialized = 4,

  /**
      Set if the event is sticky on the pads.
  */
  Sticky = 8,

  /**
      Multiple sticky events can be on a pad, each
                                    identified by the event name.
  */
  StickyMulti = 16,
}

/**
    The result of passing data to a pad.
    
    Note that the custom return values should not be exposed outside of the
    element scope.
*/
enum GstFlowReturn
{
  /**
      Pre-defined custom success code.
  */
  CustomSuccess2 = 102,

  /**
      Pre-defined custom success code (define your
                                    custom success code to this to avoid compiler
                                    warnings).
  */
  CustomSuccess1 = 101,

  /**
      Elements can use values starting from
                                    this (and higher) to define custom success
                                    codes.
  */
  CustomSuccess = 100,

  /**
      Data passing was ok.
  */
  Ok = 0,

  /**
      Pad is not linked.
  */
  NotLinked = -1,

  /**
      Pad is flushing.
  */
  Flushing = -2,

  /**
      Pad is EOS.
  */
  Eos = -3,

  /**
      Pad is not negotiated.
  */
  NotNegotiated = -4,

  /**
      Some (fatal) error occurred. Element generating
                                    this error should post an error message using
                                    GST_ELEMENT_ERROR() with more details.
  */
  Error = -5,

  /**
      This operation is not supported.
  */
  NotSupported = -6,

  /**
      Elements can use values starting from
                                    this (and lower) to define custom error codes.
  */
  CustomError = -100,

  /**
      Pre-defined custom error code (define your
                                    custom error code to this to avoid compiler
                                    warnings).
  */
  CustomError1 = -101,

  /**
      Pre-defined custom error code.
  */
  CustomError2 = -102,
}

/**
    Standard predefined formats
*/
enum GstFormat
{
  /**
      undefined format
  */
  Undefined = 0,

  /**
      the default format of the pad/element. This can be
         samples for raw audio, frames/fields for raw video (some, but not all,
         elements support this; use @GST_FORMAT_TIME if you don't have a good
         reason to query for samples/frames)
  */
  Default = 1,

  /**
      bytes
  */
  Bytes = 2,

  /**
      time in nanoseconds
  */
  Time = 3,

  /**
      buffers (few, if any, elements implement this as of
          May 2009)
  */
  Buffers = 4,

  /**
      percentage of stream (few, if any, elements implement
          this as of May 2009)
  */
  Percent = 5,
}

/**
    The different flags that can be set on #GST_EVENT_GAP events. See
    [gst.event.Event.setGapFlags] for details.
*/
enum GstGapFlags : uint
{
  /**
      The #GST_EVENT_GAP signals missing data,
         for example because of packet loss.
  */
  Data = 1,
}

/**
    The result of a #GstIteratorItemFunction.
*/
enum GstIteratorItem
{
  /**
      Skip this item
  */
  Skip = 0,

  /**
      Return item
  */
  Pass = 1,

  /**
      Stop after this item.
  */
  End = 2,
}

/**
    The result of [gst.iterator.Iterator.next].
*/
enum GstIteratorResult
{
  /**
      No more items in the iterator
  */
  Done = 0,

  /**
      An item was retrieved
  */
  Ok = 1,

  /**
      Datastructure changed while iterating
  */
  Resync = 2,

  /**
      An error happened
  */
  Error = 3,
}

/**
    Library errors are for errors from the library being used by elements
    (initializing, finalizing, settings, ...)
*/
enum GstLibraryError
{
  /**
      a general error which doesn't fit in any other
      category.  Make sure you add a custom message to the error call.
  */
  Failed = 1,

  /**
      do not use this except as a placeholder for
      deciding where to go while developing code.
  */
  TooLazy = 2,

  /**
      used when the library could not be opened.
  */
  Init = 3,

  /**
      used when the library could not be closed.
  */
  Shutdown = 4,

  /**
      used when the library doesn't accept settings.
  */
  Settings = 5,

  /**
      used when the library generated an encoding error.
  */
  Encode = 6,

  /**
      the number of library error types.
  */
  NumErrors = 7,
}

/**
    Flags used when locking miniobjects
*/
enum GstLockFlags : uint
{
  /**
      lock for read access
  */
  Read = 1,

  /**
      lock for write access
  */
  Write = 2,

  /**
      lock for exclusive access
  */
  Exclusive = 4,

  /**
      first flag that can be used for custom purposes
  */
  Last = 256,
}

/**
    Flags used when mapping memory
*/
enum GstMapFlags : uint
{
  /**
      map for read access
  */
  Read = 1,

  /**
      map for write access
  */
  Write = 2,

  /**
      first flag that can be used for custom purposes
  */
  FlagLast = 65536,
}

/**
    Flags for wrapped memory.
*/
enum GstMemoryFlags : uint
{
  /**
      memory is readonly. It is not allowed to map the
      memory with #GST_MAP_WRITE.
  */
  Readonly = 2,

  /**
      memory must not be shared. Copies will have to be
      made when this memory needs to be shared between buffers. (DEPRECATED:
      do not use in new code, instead you should create a custom GstAllocator for
      memory pooling instead of relying on the GstBuffer they were originally
      attached to.)
  */
  NoShare = 16,

  /**
      the memory prefix is filled with 0 bytes
  */
  ZeroPrefixed = 32,

  /**
      the memory padding is filled with 0 bytes
  */
  ZeroPadded = 64,

  /**
      the memory is physically
      contiguous. (Since: 1.2)
  */
  PhysicallyContiguous = 128,

  /**
      the memory can't be mapped via
      [gst.memory.Memory.map] without any preconditions. (Since: 1.2)
  */
  NotMappable = 256,

  /**
      first flag that can be used for custom purposes
  */
  Last = 1048576,
}

/**
    The different message types that are available.
*/
enum GstMessageType : uint
{
  /**
      an undefined message
  */
  Unknown = 0,

  /**
      end-of-stream reached in a pipeline. The application will
      only receive this message in the PLAYING state and every time it sets a
      pipeline to PLAYING that is in the EOS state. The application can perform a
      flushing seek in the pipeline, which will undo the EOS state again.
  */
  Eos = 1,

  /**
      an error occurred. When the application receives an error
      message it should stop playback of the pipeline and not assume that more
      data will be played. It is possible to specify a redirection url to the error
      messages by setting a `redirect-location` field into the error message, application
      or high level bins might use the information as required.
  */
  Error = 2,

  /**
      a warning occurred.
  */
  Warning = 4,

  /**
      an info message occurred
  */
  Info = 8,

  /**
      a tag was found.
  */
  Tag = 16,

  /**
      the pipeline is buffering. When the application
      receives a buffering message in the PLAYING state for a non-live pipeline it
      must PAUSE the pipeline until the buffering completes, when the percentage
      field in the message is 100%. For live pipelines, no action must be
      performed and the buffering percentage can be used to inform the user about
      the progress.
  */
  Buffering = 32,

  /**
      a state change happened
  */
  StateChanged = 64,

  /**
      an element changed state in a streaming thread.
      This message is deprecated.
  */
  StateDirty = 128,

  /**
      a stepping operation finished.
  */
  StepDone = 256,

  /**
      an element notifies its capability of providing
                                  a clock. This message is used internally and
                                  never forwarded to the application.
  */
  ClockProvide = 512,

  /**
      The current clock as selected by the pipeline became
                               unusable. The pipeline will select a new clock on
                               the next PLAYING state change. The application
                               should set the pipeline to PAUSED and back to
                               PLAYING when this message is received.
  */
  ClockLost = 1024,

  /**
      a new clock was selected in the pipeline.
  */
  NewClock = 2048,

  /**
      the structure of the pipeline changed. This
      message is used internally and never forwarded to the application.
  */
  StructureChange = 4096,

  /**
      status about a stream, emitted when it starts,
                                  stops, errors, etc..
  */
  StreamStatus = 8192,

  /**
      message posted by the application, possibly
                                via an application-specific element.
  */
  Application = 16384,

  /**
      element-specific message, see the specific element's
                            documentation
  */
  Element = 32768,

  /**
      pipeline started playback of a segment. This
      message is used internally and never forwarded to the application.
  */
  SegmentStart = 65536,

  /**
      pipeline completed playback of a segment. This
      message is forwarded to the application after all elements that posted
      @GST_MESSAGE_SEGMENT_START posted a GST_MESSAGE_SEGMENT_DONE message.
  */
  SegmentDone = 131072,

  /**
      The duration of a pipeline changed. The
      application can get the new duration with a duration query.
  */
  DurationChanged = 262144,

  /**
      Posted by elements when their latency changes. The
      application should recalculate and distribute a new latency.
  */
  Latency = 524288,

  /**
      Posted by elements when they start an ASYNC
      #GstStateChange. This message is not forwarded to the application but is used
      internally.
  */
  AsyncStart = 1048576,

  /**
      Posted by elements when they complete an ASYNC
      #GstStateChange. The application will only receive this message from the toplevel
      pipeline.
  */
  AsyncDone = 2097152,

  /**
      Posted by elements when they want the pipeline to
      change state. This message is a suggestion to the application which can
      decide to perform the state change on (part of) the pipeline.
  */
  RequestState = 4194304,

  /**
      A stepping operation was started.
  */
  StepStart = 8388608,

  /**
      A buffer was dropped or an element changed its processing
      strategy for Quality of Service reasons.
  */
  Qos = 16777216,

  /**
      A progress message.
  */
  Progress = 33554432,

  /**
      A new table of contents (TOC) was found or previously found TOC
      was updated.
  */
  Toc = 67108864,

  /**
      Message to request resetting the pipeline's
          running time from the pipeline. This is an internal message which
          applications will likely never receive.
  */
  ResetTime = 134217728,

  /**
      Message indicating start of a new stream. Useful
          e.g. when using playbin in gapless playback mode, to get notified when
          the next title actually starts playing (which will be some time after
          the URI for the next title has been set).
  */
  StreamStart = 268435456,

  /**
      Message indicating that an element wants a specific context (Since: 1.2)
  */
  NeedContext = 536870912,

  /**
      Message indicating that an element created a context (Since: 1.2)
  */
  HaveContext = 1073741824,

  /**
      Message is an extended message type (see below).
          These extended message IDs can't be used directly with mask-based API
          like [gst.bus.Bus.poll] or [gst.bus.Bus.timedPopFiltered], but you can still
          filter for GST_MESSAGE_EXTENDED and then check the result for the
          specific type. (Since: 1.4)
  */
  Extended = 2147483648,

  /**
      Message indicating a #GstDevice was added to
          a #GstDeviceProvider (Since: 1.4)
  */
  DeviceAdded = 2147483649,

  /**
      Message indicating a #GstDevice was removed
          from a #GstDeviceProvider (Since: 1.4)
  */
  DeviceRemoved = 2147483650,

  /**
      Message indicating a #GObject property has
          changed (Since: 1.10)
  */
  PropertyNotify = 2147483651,

  /**
      Message indicating a new #GstStreamCollection
          is available (Since: 1.10)
  */
  StreamCollection = 2147483652,

  /**
      Message indicating the active selection of
          #GstStreams has changed (Since: 1.10)
  */
  StreamsSelected = 2147483653,

  /**
      Message indicating to request the application to
          try to play the given URL(s). Useful if for example a HTTP 302/303
          response is received with a non-HTTP URL inside. (Since: 1.10)
  */
  Redirect = 2147483654,

  /**
      Message indicating a #GstDevice was changed
          a #GstDeviceProvider (Since: 1.16)
  */
  DeviceChanged = 2147483655,

  /**
      Message sent by elements to request the
          running time from the pipeline when an instant rate change should
          be applied (which may be in the past when the answer arrives). (Since: 1.18)
  */
  InstantRateRequest = 2147483656,

  /**
      mask for all of the above messages.
  */
  Any = 4294967295,
}

/**
    Extra metadata flags.
*/
enum GstMetaFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      metadata should not be modified
  */
  Readonly = 1,

  /**
      metadata is managed by a bufferpool
  */
  Pooled = 2,

  /**
      metadata should not be removed
  */
  Locked = 4,

  /**
      additional flags can be added starting from this flag.
  */
  Last = 65536,
}

/**
    Flags for the mini object
*/
enum GstMiniObjectFlags : uint
{
  /**
      the object can be locked and unlocked with
      [gst.mini_object.MiniObject.lock] and [gst.mini_object.MiniObject.unlock].
  */
  Lockable = 1,

  /**
      the object is permanently locked in
      READONLY mode. Only read locks can be performed on the object.
  */
  LockReadonly = 2,

  /**
      the object is expected to stay alive
      even after [gst.global.deinit] has been called and so should be ignored by leak
      detection tools. (Since: 1.10)
  */
  MayBeLeaked = 4,

  /**
      first flag that can be used by subclasses.
  */
  Last = 16,
}

/**
    The standard flags that an gstobject may have.
*/
enum GstObjectFlags : uint
{
  /**
      the object is expected to stay alive even
      after [gst.global.deinit] has been called and so should be ignored by leak
      detection tools. (Since: 1.10)
  */
  MayBeLeaked = 1,

  /**
      Flag that's set when the object has been constructed. This can be used by
      API such as base class setters to differentiate between the case where
      they're called from a subclass's instance init function (and where the
      object isn't fully constructed yet, and so one shouldn't do anything but
      set values in the instance structure), and the case where the object is
      constructed.
  */
  Constructed = 2,

  /**
      subclasses can add additional flags starting from this flag
  */
  Last = 16,
}

/**
    The direction of a pad.
*/
enum GstPadDirection
{
  /**
      direction is unknown.
  */
  Unknown = 0,

  /**
      the pad is a source pad.
  */
  Src = 1,

  /**
      the pad is a sink pad.
  */
  Sink = 2,
}

/**
    Pad state flags
*/
enum GstPadFlags : uint
{
  /**
      is dataflow on a pad blocked
  */
  Blocked = 16,

  /**
      is pad flushing
  */
  Flushing = 32,

  /**
      is pad in EOS state
  */
  Eos = 64,

  /**
      is pad currently blocking on a buffer or event
  */
  Blocking = 128,

  /**
      ensure that there is a parent object before calling
                            into the pad callbacks.
  */
  NeedParent = 256,

  /**
      the pad should be reconfigured/renegotiated.
                                 The flag has to be unset manually after
                                 reconfiguration happened.
  */
  NeedReconfigure = 512,

  /**
      the pad has pending events
  */
  PendingEvents = 1024,

  /**
      the pad is using fixed caps. This means that
          once the caps are set on the pad, the default caps query function
          will only return those caps.
  */
  FixedCaps = 2048,

  /**
      the default event and query handler will forward
                           all events and queries to the internally linked pads
                           instead of discarding them.
  */
  ProxyCaps = 4096,

  /**
      the default query handler will forward
                           allocation queries to the internally linked pads
                           instead of discarding them.
  */
  ProxyAllocation = 8192,

  /**
      the default query handler will forward
                           scheduling queries to the internally linked pads
                           instead of discarding them.
  */
  ProxyScheduling = 16384,

  /**
      the default accept-caps handler will check
                           it the caps intersect the query-caps result instead
                           of checking for a subset. This is interesting for
                           parsers that can accept incompletely specified caps.
  */
  AcceptIntersect = 32768,

  /**
      the default accept-caps handler will use
                           the template pad caps instead of query caps to
                           compare with the accept caps. Use this in combination
                           with [gst.types.PadFlags.AcceptIntersect]. (Since: 1.6)
  */
  AcceptTemplate = 65536,

  /**
      offset to define more flags
  */
  Last = 1048576,
}

/**
    The amount of checking to be done when linking pads. @GST_PAD_LINK_CHECK_CAPS
    and @GST_PAD_LINK_CHECK_TEMPLATE_CAPS are mutually exclusive. If both are
    specified, expensive but safe @GST_PAD_LINK_CHECK_CAPS are performed.
    
    > Only disable some of the checks if you are 100% certain you know the link
    > will not fail because of hierarchy/caps compatibility failures. If uncertain,
    > use the default checks ([gst.types.PadLinkCheck.Default]) or the regular methods
    > for linking the pads.
*/
enum GstPadLinkCheck : uint
{
  /**
      Don't check hierarchy or caps compatibility.
  */
  Nothing = 0,

  /**
      Check the pads have same parents/grandparents.
        Could be omitted if it is already known that the two elements that own the
        pads are in the same bin.
  */
  Hierarchy = 1,

  /**
      Check if the pads are compatible by using
        their template caps. This is much faster than @GST_PAD_LINK_CHECK_CAPS, but
        would be unsafe e.g. if one pad has `GST_CAPS_ANY`.
  */
  TemplateCaps = 2,

  /**
      Check if the pads are compatible by comparing the
        caps returned by [gst.pad.Pad.queryCaps].
  */
  Caps = 4,

  /**
      Disables pushing a reconfigure event when pads are
        linked.
  */
  NoReconfigure = 8,

  /**
      The default checks done when linking
        pads (i.e. the ones used by [gst.pad.Pad.link]).
  */
  Default = 5,
}

/**
    Result values from gst_pad_link and friends.
*/
enum GstPadLinkReturn
{
  /**
      link succeeded
  */
  Ok = 0,

  /**
      pads have no common grandparent
  */
  WrongHierarchy = -1,

  /**
      pad was already linked
  */
  WasLinked = -2,

  /**
      pads have wrong direction
  */
  WrongDirection = -3,

  /**
      pads do not have common format
  */
  Noformat = -4,

  /**
      pads cannot cooperate in scheduling
  */
  Nosched = -5,

  /**
      refused for some reason
  */
  Refused = -6,
}

/**
    The status of a GstPad. After activating a pad, which usually happens when the
    parent element goes from READY to PAUSED, the GstPadMode defines if the
    pad operates in push or pull mode.
*/
enum GstPadMode
{
  /**
      Pad will not handle dataflow
  */
  None = 0,

  /**
      Pad handles dataflow in downstream push mode
  */
  Push = 1,

  /**
      Pad handles dataflow in upstream pull mode
  */
  Pull = 2,
}

/**
    Indicates when this pad will become available.
*/
enum GstPadPresence
{
  /**
      the pad is always available
  */
  Always = 0,

  /**
      the pad will become available depending on the media stream
  */
  Sometimes = 1,

  /**
      the pad is only available on request with
       [gst.element.Element.requestPad].
  */
  Request = 2,
}

/**
    Different return values for the #GstPadProbeCallback.
*/
enum GstPadProbeReturn
{
  /**
      drop data in data probes. For push mode this means that
             the data item is not sent downstream. For pull mode, it means that
             the data item is not passed upstream. In both cases, no other probes
             are called for this item and [gst.types.FlowReturn.Ok] or true is returned to the
             caller.
  */
  Drop = 0,

  /**
      normal probe return value. This leaves the probe in
             place, and defers decisions about dropping or passing data to other
             probes, if any. If there are no other probes, the default behaviour
             for the probe type applies ('block' for blocking probes,
             and 'pass' for non-blocking probes).
  */
  Ok = 1,

  /**
      remove this probe, passing the data. For blocking probes
             this will cause data flow to unblock, unless there are also other
             blocking probes installed.
  */
  Remove = 2,

  /**
      pass the data item in the block probe and block on the
             next item. Note, that if there are multiple pad probes installed and
             any probe returns PASS, the data will be passed.
  */
  Pass = 3,

  /**
      Data has been handled in the probe and will not be
             forwarded further. For events and buffers this is the same behaviour as
             [gst.types.PadProbeReturn.Drop] (except that in this case you need to unref the buffer
             or event yourself). For queries it will also return true to the caller.
             The probe can also modify the #GstFlowReturn value by using the
             #GST_PAD_PROBE_INFO_FLOW_RETURN() accessor.
             Note that the resulting query must contain valid entries.
             Since: 1.6
  */
  Handled = 4,
}

/**
    The different probing types that can occur. When either one of
    @GST_PAD_PROBE_TYPE_IDLE or @GST_PAD_PROBE_TYPE_BLOCK is used, the probe will be a
    blocking probe.
*/
enum GstPadProbeType : uint
{
  /**
      invalid probe type
  */
  Invalid = 0,

  /**
      probe idle pads and block while the callback is called
  */
  Idle = 1,

  /**
      probe and block pads
  */
  Block = 2,

  /**
      probe buffers
  */
  Buffer = 16,

  /**
      probe buffer lists
  */
  BufferList = 32,

  /**
      probe downstream events
  */
  EventDownstream = 64,

  /**
      probe upstream events
  */
  EventUpstream = 128,

  /**
      probe flush events. This probe has to be
          explicitly enabled and is not included in the
          @@GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM or
          @@GST_PAD_PROBE_TYPE_EVENT_UPSTREAM probe types.
  */
  EventFlush = 256,

  /**
      probe downstream queries
  */
  QueryDownstream = 512,

  /**
      probe upstream queries
  */
  QueryUpstream = 1024,

  /**
      probe push
  */
  Push = 4096,

  /**
      probe pull
  */
  Pull = 8192,

  /**
      probe and block at the next opportunity, at data flow or when idle
  */
  Blocking = 3,

  /**
      probe downstream data (buffers, buffer lists, and events)
  */
  DataDownstream = 112,

  /**
      probe upstream data (events)
  */
  DataUpstream = 128,

  /**
      probe upstream and downstream data (buffers, buffer lists, and events)
  */
  DataBoth = 240,

  /**
      probe and block downstream data (buffers, buffer lists, and events)
  */
  BlockDownstream = 114,

  /**
      probe and block upstream data (events)
  */
  BlockUpstream = 130,

  /**
      probe upstream and downstream events
  */
  EventBoth = 192,

  /**
      probe upstream and downstream queries
  */
  QueryBoth = 1536,

  /**
      probe upstream events and queries and downstream buffers, buffer lists, events and queries
  */
  AllBoth = 1776,

  /**
      probe push and pull
  */
  Scheduling = 12288,
}

/**
    Flags for the padtemplate
*/
enum GstPadTemplateFlags : uint
{
  /**
      first flag that can be used by subclasses.
  */
  Last = 256,
}

/**
    The different parsing errors that can occur.
*/
enum GstParseError
{
  /**
      A syntax error occurred.
  */
  Syntax = 0,

  /**
      The description contained an unknown element
  */
  NoSuchElement = 1,

  /**
      An element did not have a specified property
  */
  NoSuchProperty = 2,

  /**
      There was an error linking two pads.
  */
  Link = 3,

  /**
      There was an error setting a property
  */
  CouldNotSetProperty = 4,

  /**
      An empty bin was specified.
  */
  EmptyBin = 5,

  /**
      An empty description was specified
  */
  Empty = 6,

  /**
      A delayed link did not get resolved.
  */
  DelayedLink = 7,
}

/**
    Parsing options.
*/
enum GstParseFlags : uint
{
  /**
      Do not use any special parsing options.
  */
  None = 0,

  /**
      Always return null when an error occurs
          (default behaviour is to return partially constructed bins or elements
           in some cases)
  */
  FatalErrors = 1,

  /**
      If a bin only has a single element,
          just return the element.
  */
  NoSingleElementBins = 2,

  /**
      If more than one toplevel element is described
          by the pipeline description string, put them in a #GstBin instead of a
          #GstPipeline. (Since: 1.10)
  */
  PlaceInBin = 4,
}

/**
    Pipeline flags
*/
enum GstPipelineFlags : uint
{
  /**
      this pipeline works with a fixed clock
  */
  FixedClock = 524288,

  /**
      offset to define more flags
  */
  Last = 8388608,
}

/** */
enum GstPluginAPIFlags : uint
{
  /**
      Ignore enum members when generating
        the plugins cache. This is useful if the members of the enum are generated
        dynamically, in order not to expose incorrect documentation to the end user.
  */
  Members = 1,
}

/**
    Flags used in connection with [gst.plugin.Plugin.addDependency].
*/
enum GstPluginDependencyFlags : uint
{
  /**
      no special flags
  */
  None = 0,

  /**
      recurse into subdirectories
  */
  Recurse = 1,

  /**
      use paths
              argument only if none of the environment variables is set
  */
  PathsAreDefaultOnly = 2,

  /**
      interpret
              filename argument as filter suffix and check all matching files in
              the directory
  */
  FileNameIsSuffix = 4,

  /**
      interpret
              filename argument as filter prefix and check all matching files in
              the directory. Since: 1.8.
  */
  FileNameIsPrefix = 8,

  /**
      interpret
        non-absolute paths as relative to the main executable directory. Since
        1.14.
  */
  PathsAreRelativeToExe = 16,
}

/**
    The plugin loading errors
*/
enum GstPluginError
{
  /**
      The plugin could not be loaded
  */
  Module = 0,

  /**
      The plugin has unresolved dependencies
  */
  Dependencies = 1,

  /**
      The plugin has already be loaded from a different file
  */
  NameMismatch = 2,
}

/**
    The plugin loading state
*/
enum GstPluginFlags : uint
{
  /**
      Temporarily loaded plugins
  */
  Cached = 16,

  /**
      The plugin won't be scanned (again)
  */
  Blacklisted = 32,
}

/**
    The type of a [gst.types.MessageType.Progress]. The progress messages inform the
    application of the status of asynchronous tasks.
*/
enum GstProgressType
{
  /**
      A new task started.
  */
  Start = 0,

  /**
      A task completed and a new one continues.
  */
  Continue = 1,

  /**
      A task completed.
  */
  Complete = 2,

  /**
      A task was canceled.
  */
  Canceled = 3,

  /**
      A task caused an error. An error message is also
               posted on the bus.
  */
  Error = 4,
}

/**
    The result of a #GstPromise
*/
enum GstPromiseResult
{
  /**
      Initial state. Waiting for transition to any
      	other state.
  */
  Pending = 0,

  /**
      Interrupted by the consumer as it doesn't
      	want the value anymore.
  */
  Interrupted = 1,

  /**
      A producer marked a reply
  */
  Replied = 2,

  /**
      The promise expired (the carrying object
      	lost all refs) and the promise will never be fulfilled.
  */
  Expired = 3,
}

/**
    The different types of QoS events that can be given to the
    [gst.event.Event.newQos] method.
*/
enum GstQOSType
{
  /**
      The QoS event type that is produced when upstream
         elements are producing data too quickly and the element can't keep up
         processing the data. Upstream should reduce their production rate. This
         type is also used when buffers arrive early or in time.
  */
  Overflow = 0,

  /**
      The QoS event type that is produced when upstream
         elements are producing data too slowly and need to speed up their
         production rate.
  */
  Underflow = 1,

  /**
      The QoS event type that is produced when the
         application enabled throttling to limit the data rate.
  */
  Throttle = 2,
}

/**
    Standard predefined Query types
*/
enum GstQueryType
{
  /**
      unknown query type
  */
  Unknown = 0,

  /**
      current position in stream
  */
  Position = 2563,

  /**
      total duration of the stream
  */
  Duration = 5123,

  /**
      latency of stream
  */
  Latency = 7683,

  /**
      current jitter of stream
  */
  Jitter = 10243,

  /**
      current rate of the stream
  */
  Rate = 12803,

  /**
      seeking capabilities
  */
  Seeking = 15363,

  /**
      segment start/stop positions
  */
  Segment = 17923,

  /**
      convert values between formats
  */
  Convert = 20483,

  /**
      query supported formats for convert
  */
  Formats = 23043,

  /**
      query available media for efficient seeking.
  */
  Buffering = 28163,

  /**
      a custom application or element defined query.
  */
  Custom = 30723,

  /**
      query the URI of the source or sink.
  */
  Uri = 33283,

  /**
      the buffer allocation properties
  */
  Allocation = 35846,

  /**
      the scheduling properties
  */
  Scheduling = 38401,

  /**
      the accept caps query
  */
  AcceptCaps = 40963,

  /**
      the caps query
  */
  Caps = 43523,

  /**
      wait till all serialized data is consumed downstream
  */
  Drain = 46086,

  /**
      query the pipeline-local context from
          downstream or upstream (since 1.2)
  */
  Context = 48643,

  /**
      the bitrate query (since 1.16)
  */
  Bitrate = 51202,

  /**
      Query stream selection capability.
  */
  Selectable = 53763,
}

/**
    #GstQueryTypeFlags indicate the aspects of the different #GstQueryType
    values. You can get the type flags of a #GstQueryType with the
    [gst.global.queryTypeGetFlags] function.
*/
enum GstQueryTypeFlags : uint
{
  /**
      Set if the query can travel upstream.
  */
  Upstream = 1,

  /**
      Set if the query can travel downstream.
  */
  Downstream = 2,

  /**
      Set if the query should be serialized with data
                                    flow.
  */
  Serialized = 4,
}

/**
    Element priority ranks. Defines the order in which the autoplugger (or
    similar rank-picking mechanisms, such as e.g. [gst.element.Element.makeFromUri])
    will choose this element over an alternative one with the same function.
    
    These constants serve as a rough guidance for defining the rank of a
    #GstPluginFeature. Any value is valid, including values bigger than
    @GST_RANK_PRIMARY.
*/
enum GstRank
{
  /**
      will be chosen last or not at all
  */
  None = 0,

  /**
      unlikely to be chosen
  */
  Marginal = 64,

  /**
      likely to be chosen
  */
  Secondary = 128,

  /**
      will be chosen first
  */
  Primary = 256,
}

/**
    Resource errors are for any resource used by an element:
    memory, files, network connections, process space, ...
    They're typically used by source and sink elements.
*/
enum GstResourceError
{
  /**
      a general error which doesn't fit in any other
      category.  Make sure you add a custom message to the error call.
  */
  Failed = 1,

  /**
      do not use this except as a placeholder for
      deciding where to go while developing code.
  */
  TooLazy = 2,

  /**
      used when the resource could not be found.
  */
  NotFound = 3,

  /**
      used when resource is busy.
  */
  Busy = 4,

  /**
      used when resource fails to open for reading.
  */
  OpenRead = 5,

  /**
      used when resource fails to open for writing.
  */
  OpenWrite = 6,

  /**
      used when resource cannot be opened for
      both reading and writing, or either (but unspecified which).
  */
  OpenReadWrite = 7,

  /**
      used when the resource can't be closed.
  */
  Close = 8,

  /**
      used when the resource can't be read from.
  */
  Read = 9,

  /**
      used when the resource can't be written to.
  */
  Write = 10,

  /**
      used when a seek on the resource fails.
  */
  Seek = 11,

  /**
      used when a synchronize on the resource fails.
  */
  Sync = 12,

  /**
      used when settings can't be manipulated on.
  */
  Settings = 13,

  /**
      used when the resource has no space left.
  */
  NoSpaceLeft = 14,

  /**
      used when the resource can't be opened
                                          due to missing authorization.
                                          (Since: 1.2.4)
  */
  NotAuthorized = 15,

  /**
      the number of resource error types.
  */
  NumErrors = 16,
}

/**
    The different scheduling flags.
*/
enum GstSchedulingFlags : uint
{
  /**
      if seeking is possible
  */
  Seekable = 1,

  /**
      if sequential access is recommended
  */
  Sequential = 2,

  /**
      if bandwidth is limited and buffering possible (since 1.2)
  */
  BandwidthLimited = 4,
}

/**
    The different search modes.
*/
enum GstSearchMode
{
  /**
      Only search for exact matches.
  */
  Exact = 0,

  /**
      Search for an exact match or the element just before.
  */
  Before = 1,

  /**
      Search for an exact match or the element just after.
  */
  After = 2,
}

/**
    Flags to be used with [gst.element.Element.seek] or [gst.event.Event.newSeek]. All flags
    can be used together.
    
    A non flushing seek might take some time to perform as the currently
    playing data in the pipeline will not be cleared.
    
    An accurate seek might be slower for formats that don't have any indexes
    or timestamp markers in the stream. Specifying this flag might require a
    complete scan of the file in those cases.
    
    When performing a segment seek: after the playback of the segment completes,
    no EOS will be emitted by the element that performed the seek, but a
    [gst.types.MessageType.SegmentDone] message will be posted on the bus by the element.
    When this message is posted, it is possible to send a new seek event to
    continue playback. With this seek method it is possible to perform seamless
    looping or simple linear editing.
    
    When only changing the playback rate and not the direction, the
    [gst.types.SeekFlags.InstantRateChange] flag can be used for a non-flushing seek
    to signal that the rate change should be applied immediately. This requires
    special support in the seek handlers (e.g. demuxers) and any elements
    synchronizing to the clock, and in general can't work in all cases (for example
    UDP streaming where the delivery rate is controlled by a remote server). The
    instant-rate-change mode supports changing the trickmode-related GST_SEEK_ flags,
    but can't be used in conjunction with other seek flags that affect the new
    playback position - as the playback position will not be changing.
    
    When doing fast forward (rate > 1.0) or fast reverse (rate < -1.0) trickmode
    playback, the [gst.types.SeekFlags.Trickmode] flag can be used to instruct decoders
    and demuxers to adjust the playback rate by skipping frames. This can improve
    performance and decrease CPU usage because not all frames need to be decoded.
    
    Beyond that, the [gst.types.SeekFlags.TrickmodeKeyUnits] flag can be used to
    request that decoders skip all frames except key units, and
    [gst.types.SeekFlags.TrickmodeNoAudio] flags can be used to request that audio
    decoders do no decoding at all, and simple output silence.
    
    The [gst.types.SeekFlags.SnapBefore] flag can be used to snap to the previous
    relevant location, and the [gst.types.SeekFlags.SnapAfter] flag can be used to
    select the next relevant location. If [gst.types.SeekFlags.KeyUnit] is specified,
    the relevant location is a keyframe. If both flags are specified, the nearest
    of these locations will be selected. If none are specified, the implementation is
    free to select whichever it wants.
    
    The before and after here are in running time, so when playing backwards,
    the next location refers to the one that will played in next, and not the
    one that is located after in the actual source stream.
    
    Also see part-seeking.txt in the GStreamer design documentation for more
    details on the meaning of these flags and the behaviour expected of
    elements that handle them.
*/
enum GstSeekFlags : uint
{
  /**
      no flag
  */
  None = 0,

  /**
      flush pipeline
  */
  Flush = 1,

  /**
      accurate position is requested, this might
                          be considerably slower for some formats.
  */
  Accurate = 2,

  /**
      seek to the nearest keyframe. This might be
                          faster but less accurate.
  */
  KeyUnit = 4,

  /**
      perform a segment seek.
  */
  Segment = 8,

  /**
      when doing fast forward or fast reverse playback, allow
                          elements to skip frames instead of generating all
                          frames. (Since: 1.6)
  */
  Trickmode = 16,

  /**
      Deprecated backward compatibility flag, replaced
                          by [gst.types.SeekFlags.Trickmode]
  */
  Skip = 16,

  /**
      go to a location before the requested position,
                          if [gst.types.SeekFlags.KeyUnit] this means the keyframe at or before
                          the requested position the one at or before the seek target.
  */
  SnapBefore = 32,

  /**
      go to a location after the requested position,
                          if [gst.types.SeekFlags.KeyUnit] this means the keyframe at of after the
                          requested position.
  */
  SnapAfter = 64,

  /**
      go to a position near the requested position,
                          if [gst.types.SeekFlags.KeyUnit] this means the keyframe closest
                          to the requested position, if both keyframes are at an equal
                          distance, behaves like [gst.types.SeekFlags.SnapBefore].
  */
  SnapNearest = 96,

  /**
      when doing fast forward or fast reverse
                          playback, request that elements only decode keyframes
                          and skip all other content, for formats that have
                          keyframes. (Since: 1.6)
  */
  TrickmodeKeyUnits = 128,

  /**
      when doing fast forward or fast reverse
                          playback, request that audio decoder elements skip
                          decoding and output only gap events or silence. (Since: 1.6)
  */
  TrickmodeNoAudio = 256,

  /**
      When doing fast forward or fast reverse
                          playback, request that elements only decode keyframes and
                          forward predicted frames and skip all other content (for example
                          B-Frames), for formats that have keyframes and forward predicted
                          frames. (Since: 1.18)
  */
  TrickmodeForwardPredicted = 512,

  /**
      Signals that a rate change should be
                          applied immediately. Only valid if start/stop position
                          are GST_CLOCK_TIME_NONE, the playback direction does not change
                          and the seek is not flushing. (Since: 1.18)
  */
  InstantRateChange = 1024,
}

/**
    The different types of seek events. When constructing a seek event with
    [gst.event.Event.newSeek] or when doing gst_segment_do_seek ().
*/
enum GstSeekType
{
  /**
      no change in position is required
  */
  None = 0,

  /**
      absolute position is requested
  */
  Set = 1,

  /**
      relative position to duration is requested
  */
  End = 2,
}

/**
    Flags for the GstSegment structure. Currently mapped to the corresponding
    values of the seek flags.
*/
enum GstSegmentFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      reset the pipeline running_time to the segment
                               running_time
  */
  Reset = 1,

  /**
      perform skip playback (Since: 1.6)
  */
  Trickmode = 16,

  /**
      Deprecated backward compatibility flag, replaced
                              by @GST_SEGMENT_FLAG_TRICKMODE
  */
  Skip = 16,

  /**
      send SEGMENT_DONE instead of EOS
  */
  Segment = 8,

  /**
      Decode only keyframes, where
                                             possible (Since: 1.6)
  */
  TrickmodeKeyUnits = 128,

  /**
      Decode only keyframes or forward
                                             predicted frames, where possible (Since: 1.18)
  */
  TrickmodeForwardPredicted = 512,

  /**
      Do not decode any audio, where
                                             possible (Since: 1.6)
  */
  TrickmodeNoAudio = 256,
}

/** */
enum GstSerializeFlags : uint
{
  /**
      No special flags specified.
  */
  None = 0,

  /**
      Serialize using the old format for
                                           nested structures.
  */
  BackwardCompat = 1,

  /**
      Serialization fails if a value cannot be serialized instead of using
      placeholder "NULL" value (e.g. pointers, objects).
  */
  Strict = 2,
}

/** */
enum GstStackTraceFlags : uint
{
  /**
      Try to retrieve the minimum information
                                  available, which may be none on some platforms
                                  (Since: 1.18)
  */
  None = 0,

  /**
      Try to retrieve as much information as possible,
                                  including source information when getting the
                                  stack trace
  */
  Full = 1,
}

/**
    The possible states an element can be in. States can be changed using
    [gst.element.Element.setState] and checked using [gst.element.Element.getState].
*/
enum GstState
{
  /**
      no pending state.
  */
  VoidPending = 0,

  /**
      the NULL state or initial state of an element.
  */
  Null = 1,

  /**
      the element is ready to go to PAUSED.
  */
  Ready = 2,

  /**
      the element is PAUSED, it is ready to accept and
                               process data. Sink elements however only accept one
                               buffer and then block.
  */
  Paused = 3,

  /**
      the element is PLAYING, the #GstClock is running and
                               the data is flowing.
  */
  Playing = 4,
}

/**
    These are the different state changes an element goes through.
    [gst.types.State.Null] &rArr; [gst.types.State.Playing] is called an upwards state change
    and [gst.types.State.Playing] &rArr; [gst.types.State.Null] a downwards state change.
*/
enum GstStateChange
{
  /**
      state change from NULL to READY.
        $(LIST
            * The element must check if the resources it needs are available. Device
              sinks and -sources typically try to probe the device to constrain their
              caps.
            * The element opens the device (in case feature need to be probed).
        )
  */
  NullToReady = 10,

  /**
      state change from READY to PAUSED.
        $(LIST
            * The element pads are activated in order to receive data in PAUSED.
              Streaming threads are started.
            * Some elements might need to return [gst.types.StateChangeReturn.Async] and complete
              the state change when they have enough information. It is a requirement
              for sinks to return [gst.types.StateChangeReturn.Async] and complete the state change
              when they receive the first buffer or [gst.types.EventType.Eos] (preroll).
              Sinks also block the dataflow when in PAUSED.
            * A pipeline resets the running_time to 0.
            * Live sources return [gst.types.StateChangeReturn.NoPreroll] and don't generate data.
        )
  */
  ReadyToPaused = 19,

  /**
      state change from PAUSED to PLAYING.
        $(LIST
            * Most elements ignore this state change.
            * The pipeline selects a #GstClock and distributes this to all the children
              before setting them to PLAYING. This means that it is only allowed to
              synchronize on the #GstClock in the PLAYING state.
            * The pipeline uses the #GstClock and the running_time to calculate the
              base_time. The base_time is distributed to all children when performing
              the state change.
            * Sink elements stop blocking on the preroll buffer or event and start
              rendering the data.
            * Sinks can post [gst.types.MessageType.Eos] in the PLAYING state. It is not allowed
              to post [gst.types.MessageType.Eos] when not in the PLAYING state.
            * While streaming in PAUSED or PLAYING elements can create and remove
              sometimes pads.
            * Live sources start generating data and return [gst.types.StateChangeReturn.Success].
        )
  */
  PausedToPlaying = 28,

  /**
      state change from PLAYING to PAUSED.
        $(LIST
            * Most elements ignore this state change.
            * The pipeline calculates the running_time based on the last selected
              #GstClock and the base_time. It stores this information to continue
              playback when going back to the PLAYING state.
            * Sinks unblock any #GstClock wait calls.
            * When a sink does not have a pending buffer to play, it returns
              #GST_STATE_CHANGE_ASYNC from this state change and completes the state
              change when it receives a new buffer or an [gst.types.EventType.Eos].
            * Any queued [gst.types.MessageType.Eos] items are removed since they will be reposted
              when going back to the PLAYING state. The EOS messages are queued in
              #GstBin containers.
            * Live sources stop generating data and return [gst.types.StateChangeReturn.NoPreroll].
        )
  */
  PlayingToPaused = 35,

  /**
      state change from PAUSED to READY.
        $(LIST
            * Sinks unblock any waits in the preroll.
            * Elements unblock any waits on devices
            * Chain or get_range functions return [gst.types.FlowReturn.Flushing].
            * The element pads are deactivated so that streaming becomes impossible and
              all streaming threads are stopped.
            * The sink forgets all negotiated formats
            * Elements remove all sometimes pads
        )
  */
  PausedToReady = 26,

  /**
      state change from READY to NULL.
        $(LIST
            * Elements close devices
            * Elements reset any internal state.
        )
  */
  ReadyToNull = 17,

  /**
      state change from NULL to NULL. (Since: 1.14)
  */
  NullToNull = 9,

  /**
      state change from READY to READY,
      This might happen when going to PAUSED asynchronously failed, in that case
      elements should make sure they are in a proper, coherent READY state. (Since: 1.14)
  */
  ReadyToReady = 18,

  /**
      state change from PAUSED to PAUSED.
      This might happen when elements were in PLAYING state and 'lost state',
      they should make sure to go back to real 'PAUSED' state (prerolling for example). (Since: 1.14)
  */
  PausedToPaused = 27,

  /**
      state change from PLAYING to PLAYING. (Since: 1.14)
  */
  PlayingToPlaying = 36,
}

/**
    The possible return values from a state change function such as
    [gst.element.Element.setState]. Only @GST_STATE_CHANGE_FAILURE is a real failure.
*/
enum GstStateChangeReturn
{
  /**
      the state change failed
  */
  Failure = 0,

  /**
      the state change succeeded
  */
  Success = 1,

  /**
      the state change will happen asynchronously
  */
  Async = 2,

  /**
      the state change succeeded but the element
                                    cannot produce data in [gst.types.State.Paused].
                                    This typically happens with live sources.
  */
  NoPreroll = 3,
}

/**
    Stream errors are for anything related to the stream being processed:
    format errors, media type errors, ...
    They're typically used by decoders, demuxers, converters, ...
*/
enum GstStreamError
{
  /**
      a general error which doesn't fit in any other
      category.  Make sure you add a custom message to the error call.
  */
  Failed = 1,

  /**
      do not use this except as a placeholder for
      deciding where to go while developing code.
  */
  TooLazy = 2,

  /**
      use this when you do not want to implement
      this functionality yet.
  */
  NotImplemented = 3,

  /**
      used when the element doesn't know the
      stream's type.
  */
  TypeNotFound = 4,

  /**
      used when the element doesn't handle this type
      of stream.
  */
  WrongType = 5,

  /**
      used when there's no codec to handle the
      stream's type.
  */
  CodecNotFound = 6,

  /**
      used when decoding fails.
  */
  Decode = 7,

  /**
      used when encoding fails.
  */
  Encode = 8,

  /**
      used when demuxing fails.
  */
  Demux = 9,

  /**
      used when muxing fails.
  */
  Mux = 10,

  /**
      used when the stream is of the wrong format
      (for example, wrong caps).
  */
  Format = 11,

  /**
      used when the stream is encrypted and can't be
      decrypted because this is not supported by the element.
  */
  Decrypt = 12,

  /**
      used when the stream is encrypted and
      can't be decrypted because no suitable key is available.
  */
  DecryptNokey = 13,

  /**
      the number of stream error types.
  */
  NumErrors = 14,
}

/** */
enum GstStreamFlags : uint
{
  /**
      This stream has no special attributes
  */
  None = 0,

  /**
      This stream is a sparse stream (e.g. a subtitle
         stream), data may flow only in irregular intervals with large gaps in
         between.
  */
  Sparse = 1,

  /**
      This stream should be selected by default. This
         flag may be used by demuxers to signal that a stream should be selected
         by default in a playback scenario.
  */
  Select = 2,

  /**
      This stream should not be selected by default.
         This flag may be used by demuxers to signal that a stream should not
         be selected by default in a playback scenario, but only if explicitly
         selected by the user (e.g. an audio track for the hard of hearing or
         a director's commentary track).
  */
  Unselect = 4,
}

/**
    The type of a [gst.types.MessageType.StreamStatus]. The stream status messages inform the
    application of new streaming threads and their status.
*/
enum GstStreamStatusType
{
  /**
      A new thread need to be created.
  */
  Create = 0,

  /**
      a thread entered its loop function
  */
  Enter = 1,

  /**
      a thread left its loop function
  */
  Leave = 2,

  /**
      a thread is destroyed
  */
  Destroy = 3,

  /**
      a thread is started
  */
  Start = 8,

  /**
      a thread is paused
  */
  Pause = 9,

  /**
      a thread is stopped
  */
  Stop = 10,
}

/**
    #GstStreamType describes a high level classification set for
    flows of data in #GstStream objects.
    
    Note that this is a flag, and therefore users should not assume it
    will be a single value. Do not use the equality operator for checking
    whether a stream is of a certain type.
*/
enum GstStreamType : uint
{
  /**
      The stream is of unknown (unclassified) type.
  */
  Unknown = 1,

  /**
      The stream is of audio data
  */
  Audio = 2,

  /**
      The stream carries video data
  */
  Video = 4,

  /**
      The stream is a muxed container type
  */
  Container = 8,

  /**
      The stream contains subtitle / subpicture data.
  */
  Text = 16,
}

/**
    The type of a [gst.types.MessageType.StructureChange].
*/
enum GstStructureChangeType
{
  /**
      Pad linking is starting or done.
  */
  Link = 0,

  /**
      Pad unlinking is starting or done.
  */
  Unlink = 1,
}

/**
    Extra tag flags used when registering tags.
*/
enum GstTagFlag
{
  /**
      undefined flag
  */
  Undefined = 0,

  /**
      tag is meta data
  */
  Meta = 1,

  /**
      tag is encoded
  */
  Encoded = 2,

  /**
      tag is decoded
  */
  Decoded = 3,

  /**
      number of tag flags
  */
  Count = 4,
}

/**
    The different tag merging modes are basically replace, overwrite and append,
    but they can be seen from two directions. Given two taglists: (A) the tags
    already in the element and (B) the ones that are supplied to the element (
    e.g. via [gst.tag_setter.TagSetter.mergeTags] / [gst.tag_setter.TagSetter.addTags] or a
    [gst.types.EventType.Tag]), how are these tags merged?
    In the table below this is shown for the cases that a tag exists in the list
    (A) or does not exists (!A) and combinations thereof.
    
    | merge mode  | A + B | A + !B | !A + B | !A + !B |
    | ----------- | ----- | ------ | ------ | ------- |
    | REPLACE_ALL | B     | ø      | B      | ø       |
    | REPLACE     | B     | A      | B      | ø       |
    | APPEND      | A, B  | A      | B      | ø       |
    | PREPEND     | B, A  | A      | B      | ø       |
    | KEEP        | A     | A      | B      | ø       |
    | KEEP_ALL    | A     | A      | ø      | ø       |
*/
enum GstTagMergeMode
{
  /**
      undefined merge mode
  */
  Undefined = 0,

  /**
      replace all tags (clear list and append)
  */
  ReplaceAll = 1,

  /**
      replace tags
  */
  Replace = 2,

  /**
      append tags
  */
  Append = 3,

  /**
      prepend tags
  */
  Prepend = 4,

  /**
      keep existing tags
  */
  Keep = 5,

  /**
      keep all existing tags
  */
  KeepAll = 6,

  /**
      the number of merge modes
  */
  Count = 7,
}

/**
    GstTagScope specifies if a taglist applies to the complete
    medium or only to one single stream.
*/
enum GstTagScope
{
  /**
      tags specific to this single stream
  */
  Stream = 0,

  /**
      global tags for the complete medium
  */
  Global = 1,
}

/**
    The different states a task can be in
*/
enum GstTaskState
{
  /**
      the task is started and running
  */
  Started = 0,

  /**
      the task is stopped
  */
  Stopped = 1,

  /**
      the task is paused
  */
  Paused = 2,
}

/**
    The different types of TOC entries (see #GstTocEntry).
    
    There are two types of TOC entries: alternatives or parts in a sequence.
*/
enum GstTocEntryType
{
  /**
      entry is an angle (i.e. an alternative)
  */
  Angle = -3,

  /**
      entry is a version (i.e. alternative)
  */
  Version = -2,

  /**
      entry is an edition (i.e. alternative)
  */
  Edition = -1,

  /**
      invalid entry type value
  */
  Invalid = 0,

  /**
      entry is a title (i.e. a part of a sequence)
  */
  Title = 1,

  /**
      entry is a track (i.e. a part of a sequence)
  */
  Track = 2,

  /**
      entry is a chapter (i.e. a part of a sequence)
  */
  Chapter = 3,
}

/**
    How a #GstTocEntry should be repeated. By default, entries are played a
    single time.
*/
enum GstTocLoopType
{
  /**
      single forward playback
  */
  None = 0,

  /**
      repeat forward
  */
  Forward = 1,

  /**
      repeat backward
  */
  Reverse = 2,

  /**
      repeat forward and backward
  */
  PingPong = 3,
}

/**
    The scope of a TOC.
*/
enum GstTocScope
{
  /**
      global TOC representing all selectable options
          (this is what applications are usually interested in)
  */
  Global = 1,

  /**
      TOC for the currently active/selected stream
          (this is a TOC representing the current stream from start to EOS,
          and is what a TOC writer / muxer is usually interested in; it will
          usually be a subset of the global TOC, e.g. just the chapters of
          the current title, or the chapters selected for playback from the
          current title)
  */
  Current = 2,
}

/**
    Flag that describe the value. These flags help applications processing the
    logs to understand the values.
*/
enum GstTracerValueFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      the value is optional. When using this flag
        one need to have an additional boolean arg before this value in the
        var-args list passed to  [gst.tracer_record.TracerRecord.log].
  */
  Optional = 1,

  /**
      the value is a combined figure, since the
        start of tracing. Examples are averages or timestamps.
  */
  Aggregated = 2,
}

/**
    Tracing record will contain fields that contain a measured value or extra
    meta-data. One such meta data are values that tell where a measurement was
    taken. This enumerating declares to which scope such a meta data field
    relates to. If it is e.g. [gst.types.TracerValueScope.Pad], then each of the log
    events may contain values for different #GstPads.
*/
enum GstTracerValueScope
{
  /**
      the value is related to the process
  */
  Process = 0,

  /**
      the value is related to a thread
  */
  Thread = 1,

  /**
      the value is related to an #GstElement
  */
  Element = 2,

  /**
      the value is related to a #GstPad
  */
  Pad = 3,
}

/**
    The probability of the typefind function. Higher values have more certainty
    in doing a reliable typefind.
*/
enum GstTypeFindProbability
{
  /**
      type undetected.
  */
  None = 0,

  /**
      unlikely typefind.
  */
  Minimum = 1,

  /**
      possible type detected.
  */
  Possible = 50,

  /**
      likely a type was detected.
  */
  Likely = 80,

  /**
      nearly certain that a type was detected.
  */
  NearlyCertain = 99,

  /**
      very certain a type was detected.
  */
  Maximum = 100,
}

/**
    Different URI-related errors that can occur.
*/
enum GstURIError
{
  /**
      The protocol is not supported
  */
  UnsupportedProtocol = 0,

  /**
      There was a problem with the URI
  */
  BadUri = 1,

  /**
      Could not set or change the URI because the
          URI handler was in a state where that is not possible or not permitted
  */
  BadState = 2,

  /**
      There was a problem with the entity that
          the URI references
  */
  BadReference = 3,
}

/**
    The different types of URI direction.
*/
enum GstURIType
{
  /**
      The URI direction is unknown
  */
  Unknown = 0,

  /**
      The URI is a consumer.
  */
  Sink = 1,

  /**
      The URI is a producer.
  */
  Src = 2,
}

/**
    Parameters to control the allocation of memory
*/
struct GstAllocationParams
{
  /**
      flags to control allocation
  */
  GstMemoryFlags flags;

  /**
      the desired alignment of the memory
  */
  size_t align_;

  /**
      the desired prefix
  */
  size_t prefix;

  /**
      the desired padding
  */
  size_t padding;

  /** */
  void*[4] GstReserved;
}

/**
    Memory is usually created by allocators with a [gst.allocator.Allocator.alloc]
    method call. When null is used as the allocator, the default allocator will
    be used.
    
    New allocators can be registered with [gst.allocator.Allocator.register].
    Allocators are identified by name and can be retrieved with
    [gst.allocator.Allocator.find]. [gst.allocator.Allocator.setDefault] can be used to change the
    default allocator.
    
    New memory can be created with [gst.memory.Memory.newWrapped] that wraps the memory
    allocated elsewhere.
*/
struct GstAllocator
{
  /** */
  GstObject object;

  /** */
  const(char)* memType;

  /**
      the implementation of the GstMemoryMapFunction
  */
  GstMemoryMapFunction memMap;

  /**
      the implementation of the GstMemoryUnmapFunction
  */
  GstMemoryUnmapFunction memUnmap;

  /**
      the implementation of the GstMemoryCopyFunction
  */
  GstMemoryCopyFunction memCopy;

  /**
      the implementation of the GstMemoryShareFunction
  */
  GstMemoryShareFunction memShare;

  /**
      the implementation of the GstMemoryIsSpanFunction
  */
  GstMemoryIsSpanFunction memIsSpan;

  /**
      the implementation of the GstMemoryMapFullFunction.
           Will be used instead of @mem_map if present. (Since: 1.6)
  */
  GstMemoryMapFullFunction memMapFull;

  /**
      the implementation of the GstMemoryUnmapFullFunction.
           Will be used instead of @mem_unmap if present. (Since: 1.6)
  */
  GstMemoryUnmapFullFunction memUnmapFull;

  /** */
  void*[2] GstReserved;

  /** */
  GstAllocatorPrivate* priv;
}

/**
    The #GstAllocator is used to create new memory.
*/
struct GstAllocatorClass
{
  /**
      Object parent class
  */
  GstObjectClass objectClass;

  /**
      implementation that acquires memory
  */
  extern(C) GstMemory* function(GstAllocator* allocator, size_t size, GstAllocationParams* params) alloc;

  /**
      implementation that releases memory
  */
  extern(C) void function(GstAllocator* allocator, GstMemory* memory) free;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAllocatorPrivate;

/**
    The #GstAtomicQueue object implements a queue that can be used from multiple
    threads without performing any blocking operations.
*/
struct GstAtomicQueue;

/**
    #GstBin is an element that can contain other #GstElement, allowing them to be
    managed as a group.
    Pads from the child elements can be ghosted to the bin, see #GstGhostPad.
    This makes the bin look like any other elements and enables creation of
    higher-level abstraction elements.
    
    A new #GstBin is created with [gst.bin.Bin.new_]. Use a #GstPipeline instead if you
    want to create a toplevel bin because a normal bin doesn't have a bus or
    handle clock distribution of its own.
    
    After the bin has been created you will typically add elements to it with
    [gst.bin.Bin.add]. You can remove elements with [gst.bin.Bin.remove].
    
    An element can be retrieved from a bin with [gst.bin.Bin.getByName], using the
    elements name. [gst.bin.Bin.getByNameRecurseUp] is mainly used for internal
    purposes and will query the parent bins when the element is not found in the
    current bin.
    
    An iterator of elements in a bin can be retrieved with
    [gst.bin.Bin.iterateElements]. Various other iterators exist to retrieve the
    elements in a bin.
    
    [gst.object.ObjectWrap.unref] is used to drop your reference to the bin.
    
    The #GstBin::element-added signal is fired whenever a new element is added to
    the bin. Likewise the #GstBin::element-removed signal is fired whenever an
    element is removed from the bin.
    
    A #GstBin internally intercepts every #GstMessage posted by its children and
    implements the following default behaviour for each of them:
    
    $(LIST
      * [gst.types.MessageType.Eos]: This message is only posted by sinks in the PLAYING
    )
    state. If all sinks posted the EOS message, this bin will post and EOS
    message upwards.
    
    $(LIST
      * [gst.types.MessageType.SegmentStart]: Just collected and never forwarded upwards.
        The messages are used to decide when all elements have completed playback
        of their segment.
      
      * [gst.types.MessageType.SegmentDone]: Is posted by #GstBin when all elements that posted
        a SEGMENT_START have posted a SEGMENT_DONE.
      
      * [gst.types.MessageType.DurationChanged]: Is posted by an element that detected a change
        in the stream duration. The duration change is posted to the
        application so that it can refetch the new duration with a duration
        query.
      
        Note that these messages can be posted before the bin is prerolled, in which
        case the duration query might fail.
      
        Note also that there might be a discrepancy (due to internal buffering/queueing)
        between the stream being currently displayed and the returned duration query.
      
        Applications might want to also query for duration (and changes) by
        listening to the [gst.types.MessageType.StreamStart] message, signaling the active start
        of a (new) stream.
      
      * [gst.types.MessageType.ClockLost]: This message is posted by an element when it
        can no longer provide a clock.
      
        The default bin behaviour is to check if the lost clock was the one provided
        by the bin. If so and the bin is currently in the PLAYING state, the message
        is forwarded to the bin parent.
      
        This message is also generated when a clock provider is removed from
        the bin. If this message is received by the application, it should
        PAUSE the pipeline and set it back to PLAYING to force a new clock
        distribution.
      
      * [gst.types.MessageType.ClockProvide]: This message is generated when an element
        can provide a clock. This mostly happens when a new clock
        provider is added to the bin.
      
        The default behaviour of the bin is to mark the currently selected clock as
        dirty, which will perform a clock recalculation the next time the bin is
        asked to provide a clock.
      
        This message is never sent to the application but is forwarded to
        the parent of the bin.
      
      * OTHERS: posted upwards.
    )
      
    A #GstBin implements the following default behaviour for answering to a
    #GstQuery:
    
    $(LIST
      * [gst.types.QueryType.Duration]: The bin will forward the query to all sink
        elements contained within and will return the maximum value.
        If no sinks are available in the bin, the query fails.
      
      * [gst.types.QueryType.Position]: The query is sent to all sink elements in the bin and the
        MAXIMUM of all values is returned. If no sinks are available in the bin,
        the query fails.
      
      * OTHERS: the query is forwarded to all sink elements, the result
        of the first sink that answers the query successfully is returned. If no
        sink is in the bin, the query fails.
    )
      
    A #GstBin will by default forward any event sent to it to all sink
    ( [gst.types.EventTypeFlags.Upstream] ) or source ( [gst.types.EventTypeFlags.Downstream] ) elements
    depending on the event type.
    
    If all the elements return true, the bin will also return true, else false
    is returned. If no elements of the required type are in the bin, the event
    handler will return true.
*/
struct GstBin
{
  /** */
  GstElement element;

  /**
      the number of children in this bin
  */
  int numchildren;

  /**
      the list of children in this bin
  */
  GList* children;

  /**
      updated whenever @children changes
  */
  uint childrenCookie;

  /**
      internal bus for handling child messages
  */
  GstBus* childBus;

  /**
      queued and cached messages
  */
  GList* messages;

  /**
      the bin is currently calculating its state
  */
  gboolean polling;

  /**
      the bin needs to recalculate its state (deprecated)
  */
  gboolean stateDirty;

  /**
      the bin needs to select a new clock
  */
  gboolean clockDirty;

  /**
      the last clock selected
  */
  GstClock* providedClock;

  /**
      the element that provided @provided_clock
  */
  GstElement* clockProvider;

  /** */
  GstBinPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    Subclasses can override #GstBinClass::add_element and #GstBinClass::remove_element
    to update the list of children in the bin.
    
    The #GstBinClass::handle_message method can be overridden to implement custom
    message handling.
    
    #GstBinClass::deep_element_added will be called when a new element has been
    added to any bin inside this bin, so it will also be called if a new child
    was added to a sub-bin of this bin. #GstBin implementations that override
    this message should chain up to the parent class implementation so the
    #GstBin::deep-element-added signal is emitted on all parents.
*/
struct GstBinClass
{
  /**
      bin parent class
  */
  GstElementClass parentClass;

  /** */
  GThreadPool* pool;

  /** */
  extern(C) void function(GstBin* bin, GstElement* child) elementAdded;

  /** */
  extern(C) void function(GstBin* bin, GstElement* child) elementRemoved;

  /** */
  extern(C) gboolean function(GstBin* bin, GstElement* element) addElement;

  /** */
  extern(C) gboolean function(GstBin* bin, GstElement* element) removeElement;

  /** */
  extern(C) void function(GstBin* bin, GstMessage* message) handleMessage;

  /** */
  extern(C) gboolean function(GstBin* bin) doLatency;

  /** */
  extern(C) void function(GstBin* bin, GstBin* subBin, GstElement* child) deepElementAdded;

  /** */
  extern(C) void function(GstBin* bin, GstBin* subBin, GstElement* child) deepElementRemoved;

  /** */
  void*[2] GstReserved;
}

/** */
struct GstBinPrivate;

/**
    A fundamental type that describes a 64-bit bitmask
*/
struct GstBitmask;

/**
    Buffers are the basic unit of data transfer in GStreamer. They contain the
    timing and offset along with other arbitrary metadata that is associated
    with the #GstMemory blocks that the buffer contains.
    
    Buffers are usually created with [gst.buffer.Buffer.new_]. After a buffer has been
    created one will typically allocate memory for it and add it to the buffer.
    The following example creates a buffer that can hold a given video frame
    with a given width, height and bits per plane.
    
    ``` C
      GstBuffer *buffer;
      GstMemory *memory;
      gint size, width, height, bpp;
      ...
      size = width * height * bpp;
      buffer = gst_buffer_new ();
      memory = gst_allocator_alloc (NULL, size, NULL);
      gst_buffer_insert_memory (buffer, -1, memory);
      ...
    ```
    
    Alternatively, use [gst.buffer.Buffer.newAllocate] to create a buffer with
    preallocated data of a given size.
    
    Buffers can contain a list of #GstMemory objects. You can retrieve how many
    memory objects with [gst.buffer.Buffer.nMemory] and you can get a pointer
    to memory with [gst.buffer.Buffer.peekMemory]
    
    A buffer will usually have timestamps, and a duration, but neither of these
    are guaranteed (they may be set to #GST_CLOCK_TIME_NONE). Whenever a
    meaningful value can be given for these, they should be set. The timestamps
    and duration are measured in nanoseconds (they are #GstClockTime values).
    
    The buffer DTS refers to the timestamp when the buffer should be decoded and
    is usually monotonically increasing. The buffer PTS refers to the timestamp when
    the buffer content should be presented to the user and is not always
    monotonically increasing.
    
    A buffer can also have one or both of a start and an end offset. These are
    media-type specific. For video buffers, the start offset will generally be
    the frame number. For audio buffers, it will be the number of samples
    produced so far. For compressed data, it could be the byte offset in a
    source or destination file. Likewise, the end offset will be the offset of
    the end of the buffer. These can only be meaningfully interpreted if you
    know the media type of the buffer (the preceding CAPS event). Either or both
    can be set to #GST_BUFFER_OFFSET_NONE.
    
    gst_buffer_ref() is used to increase the refcount of a buffer. This must be
    done when you want to keep a handle to the buffer after pushing it to the
    next element. The buffer refcount determines the writability of the buffer, a
    buffer is only writable when the refcount is exactly 1, i.e. when the caller
    has the only reference to the buffer.
    
    To efficiently create a smaller buffer out of an existing one, you can
    use [gst.buffer.Buffer.copyRegion]. This method tries to share the memory objects
    between the two buffers.
    
    If a plug-in wants to modify the buffer data or metadata in-place, it should
    first obtain a buffer that is safe to modify by using
    gst_buffer_make_writable(). This function is optimized so that a copy will
    only be made when it is necessary.
    
    Several flags of the buffer can be set and unset with the
    GST_BUFFER_FLAG_SET() and GST_BUFFER_FLAG_UNSET() macros. Use
    GST_BUFFER_FLAG_IS_SET() to test if a certain #GstBufferFlags flag is set.
    
    Buffers can be efficiently merged into a larger buffer with
    [gst.buffer.Buffer.append]. Copying of memory will only be done when absolutely
    needed.
    
    Arbitrary extra metadata can be set on a buffer with [gst.buffer.Buffer.addMeta].
    Metadata can be retrieved with [gst.buffer.Buffer.getMeta]. See also #GstMeta.
    
    An element should either unref the buffer or push it out on a src pad
    using [gst.pad.Pad.push] (see #GstPad).
    
    Buffers are usually freed by unreffing them with gst_buffer_unref(). When
    the refcount drops to 0, any memory and metadata pointed to by the buffer is
    unreffed as well. Buffers allocated from a #GstBufferPool will be returned to
    the pool when the refcount drops to 0.
    
    The #GstParentBufferMeta is a meta which can be attached to a #GstBuffer
    to hold a reference to another buffer that is only released when the child
    #GstBuffer is released.
    
    Typically, #GstParentBufferMeta is used when the child buffer is directly
    using the #GstMemory of the parent buffer, and wants to prevent the parent
    buffer from being returned to a buffer pool until the #GstMemory is available
    for re-use. (Since: 1.6)
*/
struct GstBuffer
{
  /**
      the parent structure
  */
  GstMiniObject miniObject;

  /**
      pointer to the pool owner of the buffer
  */
  GstBufferPool* pool;

  /**
      presentation timestamp of the buffer, can be #GST_CLOCK_TIME_NONE when the
          pts is not known or relevant. The pts contains the timestamp when the
          media should be presented to the user.
  */
  GstClockTime pts;

  /**
      decoding timestamp of the buffer, can be #GST_CLOCK_TIME_NONE when the
          dts is not known or relevant. The dts contains the timestamp when the
          media should be processed.
  */
  GstClockTime dts;

  /**
      duration in time of the buffer data, can be #GST_CLOCK_TIME_NONE
          when the duration is not known or relevant.
  */
  GstClockTime duration;

  /**
      a media specific offset for the buffer data.
          For video frames, this is the frame number of this buffer.
          For audio samples, this is the offset of the first sample in this buffer.
          For file data or compressed data this is the byte offset of the first
            byte in this buffer.
  */
  ulong offset;

  /**
      the last offset contained in this buffer. It has the same
          format as @offset.
  */
  ulong offsetEnd;
}

/**
    Buffer lists are an object containing a list of buffers.
    
    Buffer lists are created with [gst.buffer_list.BufferList.new_] and filled with data
    using [gst.buffer_list.BufferList.insert].
    
    Buffer lists can be pushed on a srcpad with [gst.pad.Pad.pushList]. This is
    interesting when multiple buffers need to be pushed in one go because it
    can reduce the amount of overhead for pushing each buffer individually.
*/
struct GstBufferList;

/**
    A #GstBufferPool is an object that can be used to pre-allocate and recycle
    buffers of the same size and with the same properties.
    
    A #GstBufferPool is created with [gst.buffer_pool.BufferPool.new_].
    
    Once a pool is created, it needs to be configured. A call to
    [gst.buffer_pool.BufferPool.getConfig] returns the current configuration structure from
    the pool. With [gst.buffer_pool.BufferPool.configSetParams] and
    [gst.buffer_pool.BufferPool.configSetAllocator] the bufferpool parameters and
    allocator can be configured. Other properties can be configured in the pool
    depending on the pool implementation.
    
    A bufferpool can have extra options that can be enabled with
    [gst.buffer_pool.BufferPool.configAddOption]. The available options can be retrieved
    with [gst.buffer_pool.BufferPool.getOptions]. Some options allow for additional
    configuration properties to be set.
    
    After the configuration structure has been configured,
    [gst.buffer_pool.BufferPool.setConfig] updates the configuration in the pool. This can
    fail when the configuration structure is not accepted.
    
    After the pool has been configured, it can be activated with
    [gst.buffer_pool.BufferPool.setActive]. This will preallocate the configured resources
    in the pool.
    
    When the pool is active, [gst.buffer_pool.BufferPool.acquireBuffer] can be used to
    retrieve a buffer from the pool.
    
    Buffers allocated from a bufferpool will automatically be returned to the
    pool with [gst.buffer_pool.BufferPool.releaseBuffer] when their refcount drops to 0.
    
    The bufferpool can be deactivated again with [gst.buffer_pool.BufferPool.setActive].
    All further [gst.buffer_pool.BufferPool.acquireBuffer] calls will return an error. When
    all buffers are returned to the pool they will be freed.
*/
struct GstBufferPool
{
  /**
      the parent structure
  */
  GstObject object;

  /**
      whether the pool is currently gathering back outstanding buffers
  */
  int flushing;

  /** */
  GstBufferPoolPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    Parameters passed to the [gst.buffer_pool.BufferPool.acquireBuffer] function to control the
    allocation of the buffer.
    
    The default implementation ignores the @start and @stop members but other
    implementations can use this extra information to decide what buffer to
    return.
*/
struct GstBufferPoolAcquireParams
{
  /**
      the format of @start and @stop
  */
  GstFormat format;

  /**
      the start position
  */
  long start;

  /**
      the stop position
  */
  long stop;

  /**
      additional flags
  */
  GstBufferPoolAcquireFlags flags;

  /** */
  void*[4] GstReserved;
}

/**
    The #GstBufferPool class.
*/
struct GstBufferPoolClass
{
  /**
      Object parent class
  */
  GstObjectClass objectClass;

  /** */
  extern(C) const(char*)* function(GstBufferPool* pool) getOptions;

  /** */
  extern(C) gboolean function(GstBufferPool* pool, GstStructure* config) setConfig;

  /** */
  extern(C) gboolean function(GstBufferPool* pool) start;

  /** */
  extern(C) gboolean function(GstBufferPool* pool) stop;

  /** */
  extern(C) GstFlowReturn function(GstBufferPool* pool, GstBuffer** buffer, GstBufferPoolAcquireParams* params) acquireBuffer;

  /** */
  extern(C) GstFlowReturn function(GstBufferPool* pool, GstBuffer** buffer, GstBufferPoolAcquireParams* params) allocBuffer;

  /** */
  extern(C) void function(GstBufferPool* pool, GstBuffer* buffer) resetBuffer;

  /** */
  extern(C) void function(GstBufferPool* pool, GstBuffer* buffer) releaseBuffer;

  /** */
  extern(C) void function(GstBufferPool* pool, GstBuffer* buffer) freeBuffer;

  /** */
  extern(C) void function(GstBufferPool* pool) flushStart;

  /** */
  extern(C) void function(GstBufferPool* pool) flushStop;

  /** */
  void*[2] GstReserved;
}

/** */
struct GstBufferPoolPrivate;

/**
    The #GstBus is an object responsible for delivering #GstMessage packets in
    a first-in first-out way from the streaming threads (see #GstTask) to the
    application.
    
    Since the application typically only wants to deal with delivery of these
    messages from one thread, the GstBus will marshall the messages between
    different threads. This is important since the actual streaming of media
    is done in another thread than the application.
    
    The GstBus provides support for #GSource based notifications. This makes it
    possible to handle the delivery in the glib #GMainLoop.
    
    The #GSource callback function [gst.bus.Bus.asyncSignalFunc] can be used to
    convert all bus messages into signal emissions.
    
    A message is posted on the bus with the [gst.bus.Bus.post] method. With the
    [gst.bus.Bus.peek] and [gst.bus.Bus.pop] methods one can look at or retrieve a
    previously posted message.
    
    The bus can be polled with the [gst.bus.Bus.poll] method. This methods blocks
    up to the specified timeout value until one of the specified messages types
    is posted on the bus. The application can then [gst.bus.Bus.pop] the messages
    from the bus to handle them.
    Alternatively the application can register an asynchronous bus function
    using [gst.bus.Bus.addWatchFull] or [gst.bus.Bus.addWatch]. This function will
    install a #GSource in the default glib main loop and will deliver messages
    a short while after they have been posted. Note that the main loop should
    be running for the asynchronous callbacks.
    
    It is also possible to get messages from the bus without any thread
    marshalling with the [gst.bus.Bus.setSyncHandler] method. This makes it
    possible to react to a message in the same thread that posted the
    message on the bus. This should only be used if the application is able
    to deal with messages from different threads.
    
    Every #GstPipeline has one bus.
    
    Note that a #GstPipeline will set its bus into flushing state when changing
    from READY to NULL state.
*/
struct GstBus
{
  /**
      the parent structure
  */
  GstObject object;

  /** */
  GstBusPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    GStreamer bus class.
*/
struct GstBusClass
{
  /**
      the parent class structure
  */
  GstObjectClass parentClass;

  /** */
  extern(C) void function(GstBus* bus, GstMessage* message) message;

  /** */
  extern(C) void function(GstBus* bus, GstMessage* message) syncMessage;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstBusPrivate;

/**
    Interface for an array of bytes. It is expected to be subclassed to implement
    @resize virtual method using language native array implementation, such as
    GLib's #GByteArray, C++'s `std::vector<uint8_t>` or Rust's `Vec<u8>`.
    
    @resize implementation could allocate more than requested to avoid repeated
    reallocations. It can return false, or be set to null, in the case the
    array cannot grow.
*/
struct GstByteArrayInterface
{
  /**
      A pointer to an array of bytes.
  */
  ubyte* data;

  /**
      Number of bytes in @data.
  */
  size_t len;

  /**
      Reallocate @data.
  */
  extern(C) gboolean function(GstByteArrayInterface* self, size_t length) resize;

  /** */
  void*[4] GstReserved;
}

/**
    Caps (capabilities) are lightweight refcounted objects describing media types.
    They are composed of an array of #GstStructure.
    
    Caps are exposed on #GstPadTemplate to describe all possible types a
    given pad can handle. They are also stored in the #GstRegistry along with
    a description of the #GstElement.
    
    Caps are exposed on the element pads using the [gst.pad.Pad.queryCaps] pad
    function. This function describes the possible types that the pad can
    handle or produce at runtime.
    
    A #GstCaps can be constructed with the following code fragment:
    
    ``` C
      GstCaps *caps = gst_caps_new_simple ("video/x-raw",
         "format", G_TYPE_STRING, "I420",
         "framerate", GST_TYPE_FRACTION, 25, 1,
         "pixel-aspect-ratio", GST_TYPE_FRACTION, 1, 1,
         "width", G_TYPE_INT, 320,
         "height", G_TYPE_INT, 240,
         NULL);
    ```
    
    A #GstCaps is fixed when it has no fields with ranges or lists. Use
    [gst.caps.Caps.isFixed] to test for fixed caps. Fixed caps can be used in a
    caps event to notify downstream elements of the current media type.
    
    Various methods exist to work with the media types such as subtracting
    or intersecting.
    
    Be aware that until 1.20 the #GstCaps / #GstStructure serialization into string
    had limited support for nested #GstCaps / #GstStructure fields. It could only
    support one level of nesting. Using more levels would lead to unexpected
    behavior when using serialization features, such as [gst.caps.Caps.toString_] or
    [gst.global.valueSerialize] and their counterparts.
*/
struct GstCaps
{
  /**
      the parent type
  */
  GstMiniObject miniObject;
}

/**
    #GstCapsFeatures can optionally be set on a #GstCaps to add requirements
    for additional features for a specific #GstStructure. Caps structures with
    the same name but with a non-equal set of caps features are not compatible.
    If a pad supports multiple sets of features it has to add multiple equal
    structures with different feature sets to the caps.
    
    Empty #GstCapsFeatures are equivalent with the #GstCapsFeatures that only
    contain #GST_CAPS_FEATURE_MEMORY_SYSTEM_MEMORY. ANY #GstCapsFeatures as
    created by [gst.caps_features.CapsFeatures.newAny] are equal to any other #GstCapsFeatures
    and can be used to specify that any #GstCapsFeatures would be supported, e.g.
    for elements that don't touch buffer memory. #GstCaps with ANY #GstCapsFeatures
    are considered non-fixed and during negotiation some #GstCapsFeatures have
    to be selected.
    
    Examples for caps features would be the requirement of a specific #GstMemory
    types or the requirement of having a specific #GstMeta on the buffer. Features
    are given as a string of the format `memory:GstMemoryTypeName` or
    `meta:GstMetaAPIName`.
*/
struct GstCapsFeatures;

/**
    This interface abstracts handling of property sets for elements with
    children. Imagine elements such as mixers or polyphonic generators. They all
    have multiple #GstPad or some kind of voice objects. Another use case are
    container elements like #GstBin.
    The element implementing the interface acts as a parent for those child
    objects.
    
    By implementing this interface the child properties can be accessed from the
    parent element by using [gst.child_proxy.ChildProxy.get] and [gst.child_proxy.ChildProxy.set].
    
    Property names are written as `child-name::property-name`. The whole naming
    scheme is recursive. Thus `child1::child2::property` is valid too, if
    `child1` and `child2` implement the #GstChildProxy interface.
*/
struct GstChildProxy;

/**
    #GstChildProxy interface.
*/
struct GstChildProxyInterface
{
  /**
      parent interface type.
  */
  GTypeInterface parent;

  /**
      Fetch a child object by name
  */
  extern(C) GObject* function(GstChildProxy* parent, const(char)* name) getChildByName;

  /**
      Fetch a child object by index
  */
  extern(C) GObject* function(GstChildProxy* parent, uint index) getChildByIndex;

  /**
      Get the number of children in @parent
  */
  extern(C) uint function(GstChildProxy* parent) getChildrenCount;

  /**
      Called when @child is added to @parent
  */
  extern(C) void function(GstChildProxy* parent, GObject* child, const(char)* name) childAdded;

  /**
      Called when @child is removed from @parent
  */
  extern(C) void function(GstChildProxy* parent, GObject* child, const(char)* name) childRemoved;

  /** */
  void*[4] GstReserved;
}

/**
    GStreamer uses a global clock to synchronize the plugins in a pipeline.
    Different clock implementations are possible by implementing this abstract
    base class or, more conveniently, by subclassing #GstSystemClock.
    
    The #GstClock returns a monotonically increasing time with the method
    [gst.clock.Clock.getTime]. Its accuracy and base time depend on the specific
    clock implementation but time is always expressed in nanoseconds. Since the
    baseline of the clock is undefined, the clock time returned is not
    meaningful in itself, what matters are the deltas between two clock times.
    The time returned by a clock is called the absolute time.
    
    The pipeline uses the clock to calculate the running time. Usually all
    renderers synchronize to the global clock using the buffer timestamps, the
    #GST_EVENT_SEGMENT events and the element's base time, see #GstPipeline.
    
    A clock implementation can support periodic and single shot clock
    notifications both synchronous and asynchronous.
    
    One first needs to create a #GstClockID for the periodic or single shot
    notification using [gst.clock.Clock.newSingleShotId] or
    [gst.clock.Clock.newPeriodicId].
    
    To perform a blocking wait for the specific time of the #GstClockID use
    [gst.clock.Clock.idWait]. To receive a callback when the specific time is reached
    in the clock use [gst.clock.Clock.idWaitAsync]. Both these calls can be
    interrupted with the [gst.clock.Clock.idUnschedule] call. If the blocking wait is
    unscheduled a return value of #GST_CLOCK_UNSCHEDULED is returned.
    
    Periodic callbacks scheduled async will be repeatedly called automatically
    until they are unscheduled. To schedule a sync periodic callback,
    [gst.clock.Clock.idWait] should be called repeatedly.
    
    The async callbacks can happen from any thread, either provided by the core
    or from a streaming thread. The application should be prepared for this.
    
    A #GstClockID that has been unscheduled cannot be used again for any wait
    operation, a new #GstClockID should be created and the old unscheduled one
    should be destroyed with [gst.clock.Clock.idUnref].
    
    It is possible to perform a blocking wait on the same #GstClockID from
    multiple threads. However, registering the same #GstClockID for multiple
    async notifications is not possible, the callback will only be called for
    the thread registering the entry last.
    
    None of the wait operations unref the #GstClockID, the owner is responsible
    for unreffing the ids itself. This holds for both periodic and single shot
    notifications. The reason being that the owner of the #GstClockID has to
    keep a handle to the #GstClockID to unblock the wait on FLUSHING events or
    state changes and if the entry would be unreffed automatically, the handle
    might become invalid without any notification.
    
    These clock operations do not operate on the running time, so the callbacks
    will also occur when not in PLAYING state as if the clock just keeps on
    running. Some clocks however do not progress when the element that provided
    the clock is not PLAYING.
    
    When a clock has the #GST_CLOCK_FLAG_CAN_SET_MASTER flag set, it can be
    slaved to another #GstClock with [gst.clock.Clock.setMaster]. The clock will
    then automatically be synchronized to this master clock by repeatedly
    sampling the master clock and the slave clock and recalibrating the slave
    clock with [gst.clock.Clock.setCalibration]. This feature is mostly useful for
    plugins that have an internal clock but must operate with another clock
    selected by the #GstPipeline.  They can track the offset and rate difference
    of their internal clock relative to the master clock by using the
    [gst.clock.Clock.getCalibration] function.
    
    The master/slave synchronisation can be tuned with the #GstClock:timeout,
    #GstClock:window-size and #GstClock:window-threshold properties.
    The #GstClock:timeout property defines the interval to sample the master
    clock and run the calibration functions. #GstClock:window-size defines the
    number of samples to use when calibrating and #GstClock:window-threshold
    defines the minimum number of samples before the calibration is performed.
*/
struct GstClock
{
  /**
      the parent structure
  */
  GstObject object;

  /** */
  GstClockPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    GStreamer clock class. Override the vmethods to implement the clock
    functionality.
*/
struct GstClockClass
{
  /**
      the parent class structure
  */
  GstObjectClass parentClass;

  /** */
  extern(C) GstClockTime function(GstClock* clock, GstClockTime oldResolution, GstClockTime newResolution) changeResolution;

  /** */
  extern(C) GstClockTime function(GstClock* clock) getResolution;

  /** */
  extern(C) GstClockTime function(GstClock* clock) getInternalTime;

  /** */
  extern(C) GstClockReturn function(GstClock* clock, GstClockEntry* entry, GstClockTimeDiff* jitter) wait;

  /** */
  extern(C) GstClockReturn function(GstClock* clock, GstClockEntry* entry) waitAsync;

  /** */
  extern(C) void function(GstClock* clock, GstClockEntry* entry) unschedule;

  /** */
  void*[4] GstReserved;
}

/**
    All pending timeouts or periodic notifies are converted into
    an entry.
    Note that GstClockEntry should be treated as an opaque structure. It must
    not be extended or allocated using a custom allocator.
*/
struct GstClockEntry
{
  /**
      reference counter (read-only)
  */
  int refcount;

  /** */
  GstClock* clock;

  /** */
  GstClockEntryType type;

  /** */
  GstClockTime time;

  /** */
  GstClockTime interval;

  /** */
  GstClockReturn status;

  /** */
  GstClockCallback func;

  /** */
  void* userData;

  /** */
  GDestroyNotify destroyData;

  /** */
  gboolean unscheduled;

  /** */
  gboolean wokenUp;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstClockPrivate;

/**
    #GstContext is a container object used to store contexts like a device
    context, a display server connection and similar concepts that should
    be shared between multiple elements.
    
    Applications can set a context on a complete pipeline by using
    [gst.element.Element.setContext], which will then be propagated to all
    child elements. Elements can handle these in #GstElementClass::set_context
    and merge them with the context information they already have.
    
    When an element needs a context it will do the following actions in this
    order until one step succeeds:
    
    1. Check if the element already has a context
    2. Query downstream with [gst.types.QueryType.Context] for the context
    3. Query upstream with [gst.types.QueryType.Context] for the context
    4. Post a [gst.types.MessageType.NeedContext] message on the bus with the required
       context types and afterwards check if a usable context was set now
    5. Create a context by itself and post a [gst.types.MessageType.HaveContext] message
       on the bus.
    
    Bins will catch [gst.types.MessageType.NeedContext] messages and will set any previously
    known context on the element that asks for it if possible. Otherwise the
    application should provide one if it can.
    
    #GstContext can be persistent.
    A persistent #GstContext is kept in elements when they reach
    [gst.types.State.Null], non-persistent ones will be removed.
    Also, a non-persistent context won't override a previous persistent
    context set to an element.
*/
struct GstContext;

/**
    A base class for value mapping objects that attaches control sources to #GObject
    properties. Such an object is taking one or more #GstControlSource instances,
    combines them and maps the resulting value to the type and value range of the
    bound property.
*/
struct GstControlBinding
{
  /**
      the parent structure
  */
  GstObject parent;

  /**
      name of the property of this binding
  */
  char* name;

  /**
      #GParamSpec for this property
  */
  GParamSpec* pspec;

  /** */
  GstObject* object;

  /** */
  gboolean disabled;

  /** */
  /** */
  union ABIType
  {
    /** */
    /** */
    struct AbiType
    {
      /** */
      GstControlBindingPrivate* priv;
    }

    AbiType abi;

    /** */
    void*[4] GstReserved;
  }

  ABIType ABI;
}

/**
    The class structure of #GstControlBinding.
*/
struct GstControlBindingClass
{
  /**
      Parent class
  */
  GstObjectClass parentClass;

  /** */
  extern(C) gboolean function(GstControlBinding* binding, GstObject* object, GstClockTime timestamp, GstClockTime lastSync) syncValues;

  /** */
  extern(C) GValue* function(GstControlBinding* binding, GstClockTime timestamp) getValue;

  /** */
  extern(C) gboolean function(GstControlBinding* binding, GstClockTime timestamp, GstClockTime interval, uint nValues, void* values) getValueArray;

  /** */
  extern(C) gboolean function(GstControlBinding* binding, GstClockTime timestamp, GstClockTime interval, uint nValues, GValue* values) getGValueArray;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstControlBindingPrivate;

/**
    The #GstControlSource is a base class for control value sources that could
    be used to get timestamp-value pairs. A control source essentially is a
    function over time.
    
    A #GstControlSource is used by first getting an instance of a specific
    control-source, creating a binding for the control-source to the target property
    of the element and then adding the binding to the element. The binding will
    convert the data types and value range to fit to the bound property.
    
    For implementing a new #GstControlSource one has to implement
    #GstControlSourceGetValue and #GstControlSourceGetValueArray functions.
    These are then used by [gst.control_source.ControlSource.controlSourceGetValue] and
    [gst.control_source.ControlSource.controlSourceGetValueArray] to get values for specific timestamps.
*/
struct GstControlSource
{
  /**
      the parent structure
  */
  GstObject parent;

  /**
      Function for returning a value for a given timestamp
  */
  GstControlSourceGetValue getValue;

  /**
      Function for returning a values array for a given timestamp
  */
  GstControlSourceGetValueArray getValueArray;

  /** */
  void*[4] GstReserved;
}

/**
    The class structure of #GstControlSource.
*/
struct GstControlSourceClass
{
  /**
      Parent class
  */
  GstObjectClass parentClass;

  /** */
  void*[4] GstReserved;
}

/**
    Extra custom metadata. The @structure field is the same as returned by
    [gst.custom_meta.CustomMeta.getStructure].
    
    Since 1.24 it can be serialized using [gst.meta.Meta.serialize] and
    [gst.meta.Meta.deserialize], but only if the #GstStructure does not contain any
    fields that cannot be serialized, see [gst.types.SerializeFlags.Strict].
*/
struct GstCustomMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      #GstStructure containing custom metadata.
  */
  GstStructure* structure;
}

/**
    Struct to store date, time and timezone information altogether.
    #GstDateTime is refcounted and immutable.
    
    Date information is handled using the [proleptic Gregorian calendar].
    
    Provides basic creation functions and accessor functions to its fields.
    
    [proleptic Gregorian calendar]: https://en.wikipedia.org/wiki/Proleptic_Gregorian_calendar
*/
struct GstDateTime;

/**
    This is the struct that describes the categories. Once initialized with
    #GST_DEBUG_CATEGORY_INIT, its values can't be changed anymore.
*/
struct GstDebugCategory
{
  /** */
  int threshold;

  /** */
  uint color;

  /** */
  const(char)* name;

  /** */
  const(char)* description;
}

/** */
struct GstDebugMessage;

/**
    #GstDevice are objects representing a device, they contain
    relevant metadata about the device, such as its class and the #GstCaps
    representing the media types it can produce or handle.
    
    #GstDevice are created by #GstDeviceProvider objects which can be
    aggregated by #GstDeviceMonitor objects.
*/
struct GstDevice
{
  /**
      The parent #GstObject structure.
  */
  GstObject parent;

  /** */
  GstDevicePrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    The class structure for a #GstDevice object.
*/
struct GstDeviceClass
{
  /**
      The parent #GstObjectClass structure.
  */
  GstObjectClass parentClass;

  /**
      Creates the fully configured element to access this device.
       Subclasses need to override this and return a new element.
  */
  extern(C) GstElement* function(GstDevice* device, const(char)* name) createElement;

  /**
      This only needs to be implemented by subclasses if the
       element can be reconfigured to use a different device. See the documentation
       for [gst.device.Device.reconfigureElement].
  */
  extern(C) gboolean function(GstDevice* device, GstElement* element) reconfigureElement;

  /** */
  void*[4] GstReserved;
}

/**
    Applications should create a #GstDeviceMonitor when they want
    to probe, list and monitor devices of a specific type. The
    #GstDeviceMonitor will create the appropriate
    #GstDeviceProvider objects and manage them. It will then post
    messages on its #GstBus for devices that have been added and
    removed.
    
    The device monitor will monitor all devices matching the filters that
    the application has set.
    
    The basic use pattern of a device monitor is as follows:
    ```
      static gboolean
      my_bus_func (GstBus * bus, GstMessage * message, gpointer user_data)
      {
         GstDevice *device;
         gchar *name;
    
         switch (GST_MESSAGE_TYPE (message)) {
           case GST_MESSAGE_DEVICE_ADDED:
             gst_message_parse_device_added (message, &device);
             name = gst_device_get_display_name (device);
             g_print("Device added: %s\n", name);
             g_free (name);
             gst_object_unref (device);
             break;
           case GST_MESSAGE_DEVICE_REMOVED:
             gst_message_parse_device_removed (message, &device);
             name = gst_device_get_display_name (device);
             g_print("Device removed: %s\n", name);
             g_free (name);
             gst_object_unref (device);
             break;
           default:
             break;
         }
    
         return G_SOURCE_CONTINUE;
      }
    
      GstDeviceMonitor *
      setup_raw_video_source_device_monitor (void) {
         GstDeviceMonitor *monitor;
         GstBus *bus;
         GstCaps *caps;
    
         monitor = gst_device_monitor_new ();
    
         bus = gst_device_monitor_get_bus (monitor);
         gst_bus_add_watch (bus, my_bus_func, NULL);
         gst_object_unref (bus);
    
         caps = gst_caps_new_empty_simple ("video/x-raw");
         gst_device_monitor_add_filter (monitor, "Video/Source", caps);
         gst_caps_unref (caps);
    
         gst_device_monitor_start (monitor);
    
         return monitor;
      }
    ```
*/
struct GstDeviceMonitor
{
  /**
      the parent #GstObject structure
  */
  GstObject parent;

  /** */
  GstDeviceMonitorPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    Opaque device monitor class structure.
*/
struct GstDeviceMonitorClass
{
  /**
      the parent #GstObjectClass structure
  */
  GstObjectClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstDeviceMonitorPrivate;

/** */
struct GstDevicePrivate;

/**
    A #GstDeviceProvider subclass is provided by a plugin that handles devices
    if there is a way to programmatically list connected devices. It can also
    optionally provide updates to the list of connected devices.
    
    Each #GstDeviceProvider subclass is a singleton, a plugin should
    normally provide a single subclass for all devices.
    
    Applications would normally use a #GstDeviceMonitor to monitor devices
    from all relevant providers.
*/
struct GstDeviceProvider
{
  /**
      The parent #GstObject
  */
  GstObject parent;

  /**
      a #GList of the #GstDevice objects
  */
  GList* devices;

  /** */
  GstDeviceProviderPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    The structure of the base #GstDeviceProviderClass
*/
struct GstDeviceProviderClass
{
  /**
      the parent #GstObjectClass structure
  */
  GstObjectClass parentClass;

  /**
      a pointer to the #GstDeviceProviderFactory that creates this
       provider
  */
  GstDeviceProviderFactory* factory;

  /**
      Returns a list of devices that are currently available.
       This should never block. The devices should not have a parent and should
       be floating.
  */
  extern(C) GList* function(GstDeviceProvider* provider) probe;

  /**
      Starts monitoring for new devices. Only subclasses that can know
       that devices have been added or remove need to implement this method.
  */
  extern(C) gboolean function(GstDeviceProvider* provider) start;

  /**
      Stops monitoring for new devices. Only subclasses that implement
       the start() method need to implement this method.
  */
  extern(C) void function(GstDeviceProvider* provider) stop;

  /** */
  void* metadata;

  /** */
  void*[4] GstReserved;
}

/**
    #GstDeviceProviderFactory is used to create instances of device providers. A
    GstDeviceProviderfactory can be added to a #GstPlugin as it is also a
    #GstPluginFeature.
    
    Use the [gst.device_provider_factory.DeviceProviderFactory.find] and
    [gst.device_provider_factory.DeviceProviderFactory.get] functions to create device
    provider instances or use [gst.device_provider_factory.DeviceProviderFactory.getByName] as a
    convenient shortcut.
*/
struct GstDeviceProviderFactory;

/**
    The opaque #GstDeviceProviderFactoryClass data structure.
*/
struct GstDeviceProviderFactoryClass;

/** */
struct GstDeviceProviderPrivate;

/**
    A fundamental type that describes a #gdouble range
*/
struct GstDoubleRange;

/**
    #GstDynamicTypeFactory is used to represent a type that can be
    automatically loaded the first time it is used. For example,
    a non-standard type for use in caps fields.
    
    In general, applications and plugins don't need to use the factory
    beyond registering the type in a plugin init function. Once that is
    done, the type is stored in the registry, and ready as soon as the
    registry is loaded.
    
    ## Registering a type for dynamic loading
    
    ```c
    
    static gboolean
    plugin_init (GstPlugin * plugin)
    {
      return gst_dynamic_type_register (plugin, GST_TYPE_CUSTOM_CAPS_FIELD);
    }
    ```
*/
struct GstDynamicTypeFactory;

/** */
struct GstDynamicTypeFactoryClass;

/**
    GstElement is the abstract base class needed to construct an element that
    can be used in a GStreamer pipeline. Please refer to the plugin writers
    guide for more information on creating #GstElement subclasses.
    
    The name of a #GstElement can be get with gst_element_get_name() and set with
    gst_element_set_name().  For speed, GST_ELEMENT_NAME() can be used in the
    core when using the appropriate locking. Do not use this in plug-ins or
    applications in order to retain ABI compatibility.
    
    Elements can have pads (of the type #GstPad).  These pads link to pads on
    other elements.  #GstBuffer flow between these linked pads.
    A #GstElement has a #GList of #GstPad structures for all their input (or sink)
    and output (or source) pads.
    Core and plug-in writers can add and remove pads with [gst.element.Element.addPad]
    and [gst.element.Element.removePad].
    
    An existing pad of an element can be retrieved by name with
    [gst.element.Element.getStaticPad]. A new dynamic pad can be created using
    [gst.element.Element.requestPad] with a #GstPadTemplate.
    An iterator of all pads can be retrieved with [gst.element.Element.iteratePads].
    
    Elements can be linked through their pads.
    If the link is straightforward, use the [gst.element.Element.link]
    convenience function to link two elements, or [gst.element.Element.linkMany]
    for more elements in a row.
    Use [gst.element.Element.linkFiltered] to link two elements constrained by
    a specified set of #GstCaps.
    For finer control, use [gst.element.Element.linkPads] and
    [gst.element.Element.linkPadsFiltered] to specify the pads to link on
    each element by name.
    
    Each element has a state (see #GstState).  You can get and set the state
    of an element with [gst.element.Element.getState] and [gst.element.Element.setState].
    Setting a state triggers a #GstStateChange. To get a string representation
    of a #GstState, use [gst.element.Element.stateGetName].
    
    You can get and set a #GstClock on an element using [gst.element.Element.getClock]
    and [gst.element.Element.setClock].
    Some elements can provide a clock for the pipeline if
    the #GST_ELEMENT_FLAG_PROVIDE_CLOCK flag is set. With the
    [gst.element.Element.provideClock] method one can retrieve the clock provided by
    such an element.
    Not all elements require a clock to operate correctly. If the
    #GST_ELEMENT_FLAG_REQUIRE_CLOCK() flag is set, a clock should be set on the
    element with [gst.element.Element.setClock].
    
    Note that clock selection and distribution is normally handled by the
    toplevel #GstPipeline so the clock functions are only to be used in very
    specific situations.
*/
struct GstElement
{
  /** */
  GstObject object;

  /**
      Used to serialize execution of [gst.element.Element.setState]
  */
  GRecMutex stateLock;

  /**
      Used to signal completion of a state change
  */
  GCond stateCond;

  /**
      Used to detect concurrent execution of
      [gst.element.Element.setState] and [gst.element.Element.getState]
  */
  uint stateCookie;

  /**
      the target state of an element as set by the application
  */
  GstState targetState;

  /**
      the current state of an element
  */
  GstState currentState;

  /**
      the next state of an element, can be #GST_STATE_VOID_PENDING if
      the element is in the correct state.
  */
  GstState nextState;

  /**
      the final state the element should go to, can be
      #GST_STATE_VOID_PENDING if the element is in the correct state
  */
  GstState pendingState;

  /**
      the last return value of an element state change
  */
  GstStateChangeReturn lastReturn;

  /**
      the bus of the element. This bus is provided to the element by the
      parent element or the application. A #GstPipeline has a bus of its own.
  */
  GstBus* bus;

  /**
      the clock of the element. This clock is usually provided to the
      element by the toplevel #GstPipeline.
  */
  GstClock* clock;

  /**
      the time of the clock right before the element is set to
      PLAYING. Subtracting @base_time from the current clock time in the PLAYING
      state will yield the running_time against the clock.
  */
  GstClockTimeDiff baseTime;

  /**
      the running_time of the last PAUSED state
  */
  GstClockTime startTime;

  /**
      number of pads of the element, includes both source and sink pads.
  */
  ushort numpads;

  /**
      list of pads
  */
  GList* pads;

  /**
      number of source pads of the element.
  */
  ushort numsrcpads;

  /**
      list of source pads
  */
  GList* srcpads;

  /**
      number of sink pads of the element.
  */
  ushort numsinkpads;

  /**
      list of sink pads
  */
  GList* sinkpads;

  /**
      updated whenever the a pad is added or removed
  */
  uint padsCookie;

  /**
      list of contexts
  */
  GList* contexts;

  /** */
  void*[3] GstReserved;
}

/**
    GStreamer element class. Override the vmethods to implement the element
    functionality.
*/
struct GstElementClass
{
  /**
      the parent class structure
  */
  GstObjectClass parentClass;

  /**
      metadata for elements of this class
  */
  void* metadata;

  /**
      the #GstElementFactory that creates these elements
  */
  GstElementFactory* elementfactory;

  /**
      a #GList of #GstPadTemplate
  */
  GList* padtemplates;

  /**
      the number of padtemplates
  */
  int numpadtemplates;

  /**
      changed whenever the padtemplates change
  */
  uint padTemplCookie;

  /** */
  extern(C) void function(GstElement* element, GstPad* pad) padAdded;

  /** */
  extern(C) void function(GstElement* element, GstPad* pad) padRemoved;

  /** */
  extern(C) void function(GstElement* element) noMorePads;

  /**
      called when a new pad is requested
  */
  extern(C) GstPad* function(GstElement* element, GstPadTemplate* templ, const(char)* name, const(GstCaps)* caps) requestNewPad;

  /**
      called when a request pad is to be released
  */
  extern(C) void function(GstElement* element, GstPad* pad) releasePad;

  /**
      get the state of the element
  */
  extern(C) GstStateChangeReturn function(GstElement* element, GstState* state, GstState* pending, GstClockTime timeout) getState;

  /**
      set a new state on the element
  */
  extern(C) GstStateChangeReturn function(GstElement* element, GstState state) setState;

  /**
      called by @set_state to perform an incremental state change
  */
  extern(C) GstStateChangeReturn function(GstElement* element, GstStateChange transition) changeState;

  /**
      called immediately after a new state was set.
  */
  extern(C) void function(GstElement* element, GstState oldstate, GstState newstate, GstState pending) stateChanged;

  /**
      set a #GstBus on the element
  */
  extern(C) void function(GstElement* element, GstBus* bus) setBus;

  /**
      gets the #GstClock provided by the element
  */
  extern(C) GstClock* function(GstElement* element) provideClock;

  /**
      set the #GstClock on the element
  */
  extern(C) gboolean function(GstElement* element, GstClock* clock) setClock;

  /**
      send a #GstEvent to the element
  */
  extern(C) gboolean function(GstElement* element, GstEvent* event) sendEvent;

  /**
      perform a #GstQuery on the element
  */
  extern(C) gboolean function(GstElement* element, GstQuery* query) query;

  /**
      called when a message is posted on the element. Chain up to
                     the parent class' handler to have it posted on the bus.
  */
  extern(C) gboolean function(GstElement* element, GstMessage* message) postMessage;

  /**
      set a #GstContext on the element
  */
  extern(C) void function(GstElement* element, GstContext* context) setContext;

  /** */
  void*[18] GstReserved;
}

/**
    #GstElementFactory is used to create instances of elements. A
    GstElementFactory can be added to a #GstPlugin as it is also a
    #GstPluginFeature.
    
    Use the [gst.element_factory.ElementFactory.find] and [gst.element_factory.ElementFactory.create]
    functions to create element instances or use [gst.element_factory.ElementFactory.make] as a
    convenient shortcut.
    
    The following code example shows you how to create a GstFileSrc element.
    
    ## Using an element factory
    ```c
      #include <gst/gst.h>
    
      GstElement *src;
      GstElementFactory *srcfactory;
    
      gst_init (&argc, &argv);
    
      srcfactory = gst_element_factory_find ("filesrc");
      g_return_if_fail (srcfactory != NULL);
      src = gst_element_factory_create (srcfactory, "src");
      g_return_if_fail (src != NULL);
      ...
    ```
*/
struct GstElementFactory;

/** */
struct GstElementFactoryClass;

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
struct GstEvent
{
  /**
      the parent structure
  */
  GstMiniObject miniObject;

  /**
      the #GstEventType of the event
  */
  GstEventType type;

  /**
      the timestamp of the event
  */
  ulong timestamp;

  /**
      the sequence number of the event
  */
  uint seqnum;
}

/**
    A fundamental type that describes a 32-bit flag bitfield, with 32-bit
    mask indicating which of the bits in the field are explicitly set.
*/
struct GstFlagSet;

/**
    A format definition
*/
struct GstFormatDefinition
{
  /**
      The unique id of this format
  */
  GstFormat value;

  /**
      A short nick of the format
  */
  const(char)* nick;

  /**
      A longer description of the format
  */
  const(char)* description;

  /**
      A quark for the nick
  */
  GQuark quark;
}

/**
    A fundamental type that describes a fraction of an integer numerator
    over an integer denominator
*/
struct GstFraction;

/**
    A fundamental type that describes a #GstFractionRange range
*/
struct GstFractionRange;

/**
    GhostPads are useful when organizing pipelines with #GstBin like elements.
    The idea here is to create hierarchical element graphs. The bin element
    contains a sub-graph. Now one would like to treat the bin-element like any
    other #GstElement. This is where GhostPads come into play. A GhostPad acts as
    a proxy for another pad. Thus the bin can have sink and source ghost-pads
    that are associated with sink and source pads of the child elements.
    
    If the target pad is known at creation time, [gst.ghost_pad.GhostPad.new_] is the
    function to use to get a ghost-pad. Otherwise one can use [gst.ghost_pad.GhostPad.newNoTarget]
    to create the ghost-pad and use [gst.ghost_pad.GhostPad.setTarget] to establish the
    association later on.
    
    Note that GhostPads add overhead to the data processing of a pipeline.
*/
struct GstGhostPad
{
  /** */
  GstProxyPad pad;

  /** */
  GstGhostPadPrivate* priv;
}

/** */
struct GstGhostPadClass
{
  /** */
  GstProxyPadClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstGhostPadPrivate;

/**
    A fundamental type that describes a #gint64 range
*/
struct GstInt64Range;

/**
    A fundamental type that describes a #gint range
*/
struct GstIntRange;

/**
    A GstIterator is used to retrieve multiple objects from another object in
    a threadsafe way.
    
    Various GStreamer objects provide access to their internal structures using
    an iterator.
    
    Note that if calling a GstIterator function results in your code receiving
    a refcounted object (with, say, [gobject.value.Value.getObject]), the refcount for that
    object will not be increased. Your code is responsible for taking a reference
    if it wants to continue using it later.
    
    The basic use pattern of an iterator is as follows:
    ```c
      GstIterator *it = _get_iterator(object);
      GValue item = G_VALUE_INIT;
      done = FALSE;
      while (!done) {
        switch (gst_iterator_next (it, &item)) {
          case GST_ITERATOR_OK:
            ...get/use/change item here...
            g_value_reset (&item);
            break;
          case GST_ITERATOR_RESYNC:
            ...rollback changes to items...
            gst_iterator_resync (it);
            break;
          case GST_ITERATOR_ERROR:
            ...wrong parameters were given...
            done = TRUE;
            break;
          case GST_ITERATOR_DONE:
            done = TRUE;
            break;
        }
      }
      g_value_unset (&item);
      gst_iterator_free (it);
    ```
*/
struct GstIterator
{
  /**
      The function to copy the iterator
  */
  GstIteratorCopyFunction copy;

  /**
      The function to get the next item in the iterator
  */
  GstIteratorNextFunction next;

  /**
      The function to be called for each item retrieved
  */
  GstIteratorItemFunction item;

  /**
      The function to call when a resync is needed.
  */
  GstIteratorResyncFunction resync;

  /**
      The function to call when the iterator is freed
  */
  GstIteratorFreeFunction free;

  /**
      The iterator that is currently pushed with [gst.iterator.Iterator.push]
  */
  GstIterator* pushed;

  /**
      The type of the object that this iterator will return
  */
  GType type;

  /**
      The lock protecting the data structure and the cookie.
  */
  GMutex* lock;

  /**
      The cookie; the value of the master_cookie when this iterator was
               created.
  */
  uint cookie;

  /**
      A pointer to the master cookie.
  */
  uint* masterCookie;

  /**
      the size of the iterator
  */
  uint size;

  /** */
  void*[4] GstReserved;
}

/**
    A structure containing the result of a map operation such as
    [gst.memory.Memory.map]. It contains the data and size.
    
    #GstMapInfo cannot be used with g_auto() because it is ambiguous whether it
    needs to be unmapped using [gst.buffer.Buffer.unmap] or [gst.memory.Memory.unmap]. Instead,
    #GstBufferMapInfo and #GstMemoryMapInfo can be used in that case.
*/
struct GstMapInfo
{
  /**
      a pointer to the mapped memory
  */
  GstMemory* memory;

  /**
      flags used when mapping the memory
  */
  GstMapFlags flags;

  /**
      a pointer to the mapped data
  */
  ubyte* data;

  /**
      the valid size in @data
  */
  size_t size;

  /**
      the maximum bytes in @data
  */
  size_t maxsize;

  /**
      extra private user_data that the implementation of the memory
                  can use to store extra info.
  */
  void*[4] userData;

  /** */
  void*[4] GstReserved;
}

/**
    GstMemory is a lightweight refcounted object that wraps a region of memory.
    They are typically used to manage the data of a #GstBuffer.
    
    A GstMemory object has an allocated region of memory of maxsize. The maximum
    size does not change during the lifetime of the memory object. The memory
    also has an offset and size property that specifies the valid range of memory
    in the allocated region.
    
    Memory is usually created by allocators with a [gst.allocator.Allocator.alloc]
    method call. When null is used as the allocator, the default allocator will
    be used.
    
    New allocators can be registered with [gst.allocator.Allocator.register].
    Allocators are identified by name and can be retrieved with
    [gst.allocator.Allocator.find]. [gst.allocator.Allocator.setDefault] can be used to change the
    default allocator.
    
    New memory can be created with [gst.memory.Memory.newWrapped] that wraps the memory
    allocated elsewhere.
    
    Refcounting of the memory block is performed with gst_memory_ref() and
    gst_memory_unref().
    
    The size of the memory can be retrieved and changed with
    [gst.memory.Memory.getSizes] and [gst.memory.Memory.resize] respectively.
    
    Getting access to the data of the memory is performed with [gst.memory.Memory.map].
    The call will return a pointer to offset bytes into the region of memory.
    After the memory access is completed, [gst.memory.Memory.unmap] should be called.
    
    Memory can be copied with [gst.memory.Memory.copy], which will return a writable
    copy. [gst.memory.Memory.share] will create a new memory block that shares the
    memory with an existing memory block at a custom offset and with a custom
    size.
    
    Memory can be efficiently merged when [gst.memory.Memory.isSpan] returns true.
*/
struct GstMemory
{
  /**
      parent structure
  */
  GstMiniObject miniObject;

  /**
      pointer to the #GstAllocator
  */
  GstAllocator* allocator;

  /**
      parent memory block
  */
  GstMemory* parent;

  /**
      the maximum size allocated
  */
  size_t maxsize;

  /**
      the alignment of the memory
  */
  size_t align_;

  /**
      the offset where valid data starts
  */
  size_t offset;

  /**
      the size of valid data
  */
  size_t size;
}

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
struct GstMessage
{
  /**
      the parent structure
  */
  GstMiniObject miniObject;

  /**
      the #GstMessageType of the message
  */
  GstMessageType type;

  /**
      the timestamp of the message
  */
  ulong timestamp;

  /**
      the src of the message
  */
  GstObject* src;

  /**
      the sequence number of the message
  */
  uint seqnum;

  /** */
  GMutex lock;

  /** */
  GCond cond;
}

/**
    The #GstMeta structure should be included as the first member of a #GstBuffer
    metadata structure. The structure defines the API of the metadata and should
    be accessible to all elements using the metadata.
    
    A metadata API is registered with [gst.meta.Meta.apiTypeRegister] which takes a
    name for the metadata API and some tags associated with the metadata.
    With [gst.meta.Meta.apiTypeHasTag] one can check if a certain metadata API
    contains a given tag.
    
    Multiple implementations of a metadata API can be registered.
    To implement a metadata API, [gst.meta.Meta.register] should be used. This
    function takes all parameters needed to create, free and transform metadata
    along with the size of the metadata. The function returns a #GstMetaInfo
    structure that contains the information for the implementation of the API.
    
    A specific implementation can be retrieved by name with [gst.meta.Meta.getInfo].
    
    See #GstBuffer for how the metadata can be added, retrieved and removed from
    buffers.
*/
struct GstMeta
{
  /**
      extra flags for the metadata
  */
  GstMetaFlags flags;

  /**
      pointer to the #GstMetaInfo
  */
  const(GstMetaInfo)* info;
}

/**
    The #GstMetaInfo provides information about a specific metadata
    structure.
*/
struct GstMetaInfo
{
  /**
      tag identifying the metadata structure and api
  */
  GType api;

  /**
      type identifying the implementor of the api
  */
  GType type;

  /**
      size of the metadata
  */
  size_t size;

  /**
      function for initializing the metadata
  */
  GstMetaInitFunction initFunc;

  /**
      function for freeing the metadata
  */
  GstMetaFreeFunction freeFunc;

  /**
      function for transforming the metadata
  */
  GstMetaTransformFunction transformFunc;

  /**
      Function for serializing the metadata, or null if not supported by this
      meta.
  */
  GstMetaSerializeFunction serializeFunc;

  /**
      Function for deserializing the metadata, or null if not supported by this
      meta.
  */
  GstMetaDeserializeFunction deserializeFunc;

  /**
      Function for clearing the metadata, or null if not supported by this
      meta. This is called by the buffer pool when a buffer is returned for
      pooled metas.
  */
  GstMetaClearFunction clearFunc;
}

/**
    Extra data passed to a "gst-copy" transform #GstMetaTransformFunction.
*/
struct GstMetaTransformCopy
{
  /**
      true if only region is copied
  */
  gboolean region;

  /**
      the offset to copy, 0 if @region is false, otherwise > 0
  */
  size_t offset;

  /**
      the size to copy, -1 or the buffer size when @region is false
  */
  size_t size;
}

/**
    #GstMiniObject is a simple structure that can be used to implement refcounted
    types.
    
    Subclasses will include #GstMiniObject as the first member in their structure
    and then call [gst.mini_object.MiniObject.init_] to initialize the #GstMiniObject fields.
    
    [gst.mini_object.MiniObject.ref_] and [gst.mini_object.MiniObject.unref] increment and decrement the
    refcount respectively. When the refcount of a mini-object reaches 0, the
    dispose function is called first and when this returns true, the free
    function of the miniobject is called.
    
    A copy can be made with [gst.mini_object.MiniObject.copy].
    
    [gst.mini_object.MiniObject.isWritable] will return true when the refcount of the
    object is exactly 1 and there is no parent or a single parent exists and is
    writable itself, meaning the current caller has the only reference to the
    object. [gst.mini_object.MiniObject.makeWritable] will return a writable version of
    the object, which might be a new copy when the refcount was not 1.
    
    Opaque data can be associated with a #GstMiniObject with
    [gst.mini_object.MiniObject.setQdata] and [gst.mini_object.MiniObject.getQdata]. The data is
    meant to be specific to the particular object and is not automatically copied
    with [gst.mini_object.MiniObject.copy] or similar methods.
    
    A weak reference can be added and remove with [gst.mini_object.MiniObject.weakRef]
    and [gst.mini_object.MiniObject.weakUnref] respectively.
*/
struct GstMiniObject
{
  /**
      the GType of the object
  */
  GType type;

  /**
      atomic refcount
  */
  int refcount;

  /**
      atomic state of the locks
  */
  int lockstate;

  /**
      extra flags.
  */
  uint flags;

  /**
      a copy function
  */
  GstMiniObjectCopyFunction copy;

  /**
      a dispose function
  */
  GstMiniObjectDisposeFunction dispose;

  /**
      the free function
  */
  GstMiniObjectFreeFunction free;

  /** */
  uint privUint;

  /** */
  void* privPointer;
}

/**
    GStreamer base object class.
*/
struct GstObjectClass
{
  /**
      parent
  */
  GInitiallyUnownedClass parentClass;

  /**
      separator used by [gst.object.ObjectWrap.getPathString]
  */
  const(char)* pathStringSeparator;

  /**
      default signal handler
  */
  extern(C) void function(GstObject* object, GstObject* orig, GParamSpec* pspec) deepNotify;

  /** */
  void*[4] GstReserved;
}

/**
    #GstObject provides a root for the object hierarchy tree filed in by the
    GStreamer library.  It is currently a thin wrapper on top of
    #GInitiallyUnowned. It is an abstract class that is not very usable on its own.
    
    #GstObject gives us basic refcounting, parenting functionality and locking.
    Most of the functions are just extended for special GStreamer needs and can be
    found under the same name in the base class of #GstObject which is #GObject
    (e.g. [gobject.object.ObjectWrap.ref_] becomes [gst.object.ObjectWrap.ref_]).
    
    Since #GstObject derives from #GInitiallyUnowned, it also inherits the
    floating reference. Be aware that functions such as [gst.bin.Bin.add] and
    [gst.element.Element.addPad] take ownership of the floating reference.
    
    In contrast to #GObject instances, #GstObject adds a name property. The functions
    [gst.object.ObjectWrap.setName] and [gst.object.ObjectWrap.getName] are used to set/get the name
    of the object.
    
    ## controlled properties
    
    Controlled properties offers a lightweight way to adjust gobject properties
    over stream-time. It works by using time-stamped value pairs that are queued
    for element-properties. At run-time the elements continuously pull value
    changes for the current stream-time.
    
    What needs to be changed in a #GstElement?
    Very little - it is just two steps to make a plugin controllable!
    
      $(LIST
          * mark gobject-properties paramspecs that make sense to be controlled,
            by GST_PARAM_CONTROLLABLE.
        
          * when processing data (get, chain, loop function) at the beginning call
            gst_object_sync_values(element,timestamp).
            This will make the controller update all GObject properties that are
            under its control with the current values based on the timestamp.
      )
        
    What needs to be done in applications? Again it's not a lot to change.
    
      $(LIST
          * create a #GstControlSource.
            csource = gst_interpolation_control_source_new ();
            g_object_set (csource, "mode", GST_INTERPOLATION_MODE_LINEAR, NULL);
        
          * Attach the #GstControlSource on the controller to a property.
            gst_object_add_control_binding (object, gst_direct_control_binding_new (object, "prop1", csource));
        
          * Set the control values
            gst_timed_value_control_source_set ((GstTimedValueControlSource *)csource,0 * GST_SECOND, value1);
            gst_timed_value_control_source_set ((GstTimedValueControlSource *)csource,1 * GST_SECOND, value2);
        
          * start your pipeline
      )
*/
struct GstObject
{
  /** */
  GInitiallyUnowned object;

  /**
      object LOCK
  */
  GMutex lock;

  /**
      The name of the object
  */
  char* name;

  /**
      this object's parent, weak ref
  */
  GstObject* parent;

  /**
      flags for this object
  */
  uint flags;

  /** */
  GList* controlBindings;

  /** */
  ulong controlRate;

  /** */
  ulong lastSync;

  /** */
  void* GstReserved;
}

/**
    A #GstElement is linked to other elements via "pads", which are extremely
    light-weight generic link points.
    
    Pads have a #GstPadDirection, source pads produce data, sink pads consume
    data.
    
    Pads are typically created from a #GstPadTemplate with
    [gst.pad.Pad.newFromTemplate] and are then added to a #GstElement. This usually
    happens when the element is created but it can also happen dynamically based
    on the data that the element is processing or based on the pads that the
    application requests.
    
    Pads without pad templates can be created with [gst.pad.Pad.new_],
    which takes a direction and a name as an argument.  If the name is null,
    then a guaranteed unique name will be assigned to it.
    
    A #GstElement creating a pad will typically use the various
    gst_pad_set_*_function\() calls to register callbacks for events, queries or
    dataflow on the pads.
    
    gst_pad_get_parent() will retrieve the #GstElement that owns the pad.
    
    After two pads are retrieved from an element by [gst.element.Element.getStaticPad],
    the pads can be linked with [gst.pad.Pad.link]. (For quick links,
    you can also use [gst.element.Element.link], which will make the obvious
    link for you if it's straightforward.). Pads can be unlinked again with
    [gst.pad.Pad.unlink]. [gst.pad.Pad.getPeer] can be used to check what the pad is
    linked to.
    
    Before dataflow is possible on the pads, they need to be activated with
    [gst.pad.Pad.setActive].
    
    [gst.pad.Pad.query] and [gst.pad.Pad.peerQuery] can be used to query various
    properties of the pad and the stream.
    
    To send a #GstEvent on a pad, use [gst.pad.Pad.sendEvent] and
    [gst.pad.Pad.pushEvent]. Some events will be sticky on the pad, meaning that
    after they pass on the pad they can be queried later with
    [gst.pad.Pad.getStickyEvent] and [gst.pad.Pad.stickyEventsForeach].
    [gst.pad.Pad.getCurrentCaps] and [gst.pad.Pad.hasCurrentCaps] are convenience
    functions to query the current sticky CAPS event on a pad.
    
    GstElements will use [gst.pad.Pad.push] and [gst.pad.Pad.pullRange] to push out
    or pull in a buffer.
    
    The dataflow, events and queries that happen on a pad can be monitored with
    probes that can be installed with [gst.pad.Pad.addProbe]. [gst.pad.Pad.isBlocked]
    can be used to check if a block probe is installed on the pad.
    [gst.pad.Pad.isBlocking] checks if the blocking probe is currently blocking the
    pad. [gst.pad.Pad.removeProbe] is used to remove a previously installed probe
    and unblock blocking probes if any.
    
    Pad have an offset that can be retrieved with [gst.pad.Pad.getOffset]. This
    offset will be applied to the running_time of all data passing over the pad.
    [gst.pad.Pad.setOffset] can be used to change the offset.
    
    Convenience functions exist to start, pause and stop the task on a pad with
    [gst.pad.Pad.startTask], [gst.pad.Pad.pauseTask] and [gst.pad.Pad.stopTask]
    respectively.
*/
struct GstPad
{
  /** */
  GstObject object;

  /**
      private data owned by the parent element
  */
  void* elementPrivate;

  /**
      padtemplate for this pad
  */
  GstPadTemplate* padtemplate;

  /**
      the direction of the pad, cannot change after creating
                  the pad.
  */
  GstPadDirection direction;

  /** */
  GRecMutex streamRecLock;

  /** */
  GstTask* task;

  /** */
  GCond blockCond;

  /** */
  GHookList probes;

  /** */
  GstPadMode mode;

  /** */
  GstPadActivateFunction activatefunc;

  /** */
  void* activatedata;

  /** */
  GDestroyNotify activatenotify;

  /** */
  GstPadActivateModeFunction activatemodefunc;

  /** */
  void* activatemodedata;

  /** */
  GDestroyNotify activatemodenotify;

  /** */
  GstPad* peer;

  /** */
  GstPadLinkFunction linkfunc;

  /** */
  void* linkdata;

  /** */
  GDestroyNotify linknotify;

  /** */
  GstPadUnlinkFunction unlinkfunc;

  /** */
  void* unlinkdata;

  /** */
  GDestroyNotify unlinknotify;

  /** */
  GstPadChainFunction chainfunc;

  /** */
  void* chaindata;

  /** */
  GDestroyNotify chainnotify;

  /** */
  GstPadChainListFunction chainlistfunc;

  /** */
  void* chainlistdata;

  /** */
  GDestroyNotify chainlistnotify;

  /** */
  GstPadGetRangeFunction getrangefunc;

  /** */
  void* getrangedata;

  /** */
  GDestroyNotify getrangenotify;

  /** */
  GstPadEventFunction eventfunc;

  /** */
  void* eventdata;

  /** */
  GDestroyNotify eventnotify;

  /** */
  long offset;

  /** */
  GstPadQueryFunction queryfunc;

  /** */
  void* querydata;

  /** */
  GDestroyNotify querynotify;

  /** */
  GstPadIterIntLinkFunction iterintlinkfunc;

  /** */
  void* iterintlinkdata;

  /** */
  GDestroyNotify iterintlinknotify;

  /** */
  int numProbes;

  /** */
  int numBlocked;

  /** */
  GstPadPrivate* priv;

  /** */
  /** */
  union ABIType
  {
    /** */
    void*[4] GstReserved;

    /** */
    /** */
    struct AbiType
    {
      /** */
      GstFlowReturn lastFlowret;

      /** */
      GstPadEventFullFunction eventfullfunc;
    }

    AbiType abi;
  }

  ABIType ABI;
}

/** */
struct GstPadClass
{
  /** */
  GstObjectClass parentClass;

  /** */
  extern(C) void function(GstPad* pad, GstPad* peer) linked;

  /** */
  extern(C) void function(GstPad* pad, GstPad* peer) unlinked;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstPadPrivate;

/**
    Info passed in the #GstPadProbeCallback.
*/
struct GstPadProbeInfo
{
  /**
      the current probe type
  */
  GstPadProbeType type;

  /**
      the id of the probe
  */
  gulong id;

  /**
      type specific data, check the @type field to know the
         datatype.  This field can be null.
  */
  void* data;

  /**
      offset of pull probe, this field is valid when @type contains
         #GST_PAD_PROBE_TYPE_PULL
  */
  ulong offset;

  /**
      size of pull probe, this field is valid when @type contains
         #GST_PAD_PROBE_TYPE_PULL
  */
  uint size;

  /** */
  /** */
  union ABIType
  {
    /** */
    void*[4] GstReserved;

    /** */
    /** */
    struct AbiType
    {
      /** */
      GstFlowReturn flowRet;
    }

    AbiType abi;
  }

  ABIType ABI;
}

/**
    Padtemplates describe the possible media types a pad or an elementfactory can
    handle. This allows for both inspection of handled types before loading the
    element plugin as well as identifying pads on elements that are not yet
    created (request or sometimes pads).
    
    Pad and PadTemplates have #GstCaps attached to it to describe the media type
    they are capable of dealing with. [gst.pad_template.PadTemplate.getCaps] or
    GST_PAD_TEMPLATE_CAPS() are used to get the caps of a padtemplate. It's not
    possible to modify the caps of a padtemplate after creation.
    
    PadTemplates have a #GstPadPresence property which identifies the lifetime
    of the pad and that can be retrieved with GST_PAD_TEMPLATE_PRESENCE(). Also
    the direction of the pad can be retrieved from the #GstPadTemplate with
    GST_PAD_TEMPLATE_DIRECTION().
    
    The GST_PAD_TEMPLATE_NAME_TEMPLATE () is important for GST_PAD_REQUEST pads
    because it has to be used as the name in the [gst.element.Element.requestPadSimple]
    call to instantiate a pad from this template.
    
    Padtemplates can be created with [gst.pad_template.PadTemplate.new_] or with
    gst_static_pad_template_get (), which creates a #GstPadTemplate from a
    #GstStaticPadTemplate that can be filled with the
    convenient GST_STATIC_PAD_TEMPLATE() macro.
    
    A padtemplate can be used to create a pad (see [gst.pad.Pad.newFromTemplate]
    or gst_pad_new_from_static_template ()) or to add to an element class
    (see gst_element_class_add_static_pad_template ()).
    
    The following code example shows the code to create a pad from a padtemplate.
    ```c
      GstStaticPadTemplate my_template =
      GST_STATIC_PAD_TEMPLATE (
        "sink",          // the name of the pad
        GST_PAD_SINK,    // the direction of the pad
        GST_PAD_ALWAYS,  // when this pad will be present
        GST_STATIC_CAPS (        // the capabilities of the padtemplate
          "audio/x-raw, "
            "channels = (int) [ 1, 6 ]"
        )
      );
      void
      my_method (void)
      {
        GstPad *pad;
        pad = gst_pad_new_from_static_template (&my_template, "sink");
        ...
      }
    ```
    
    The following example shows you how to add the padtemplate to an
    element class, this is usually done in the class_init of the class:
    ```c
      static void
      my_element_class_init (GstMyElementClass *klass)
      {
        GstElementClass *gstelement_class = GST_ELEMENT_CLASS (klass);
    
        gst_element_class_add_static_pad_template (gstelement_class, &my_template);
      }
    ```
*/
struct GstPadTemplate
{
  /** */
  GstObject object;

  /** */
  char* nameTemplate;

  /** */
  GstPadDirection direction;

  /** */
  GstPadPresence presence;

  /** */
  GstCaps* caps;

  /** */
  /** */
  union ABIType
  {
    /** */
    void*[4] GstReserved;

    /** */
    /** */
    struct AbiType
    {
      /** */
      GType gtype;

      /** */
      GstCaps* documentationCaps;
    }

    AbiType abi;
  }

  ABIType ABI;
}

/** */
struct GstPadTemplateClass
{
  /** */
  GstObjectClass parentClass;

  /** */
  extern(C) void function(GstPadTemplate* templ, GstPad* pad) padCreated;

  /** */
  void*[4] GstReserved;
}

/**
    A fundamental type that describes a #GParamSpec for arrays of
    values
*/
struct GstParamArray;

/**
    A fundamental type that describes a #GParamSpec for fractional
    properties
*/
struct GstParamFraction;

/**
    A GParamSpec derived structure for arrays of values.
*/
struct GstParamSpecArray
{
  /**
      super class
  */
  GParamSpec parentInstance;

  /**
      the #GParamSpec of the type of values in the array
  */
  GParamSpec* elementSpec;
}

/**
    A GParamSpec derived structure that contains the meta data for fractional
    properties.
*/
struct GstParamSpecFraction
{
  /**
      super class
  */
  GParamSpec parentInstance;

  /**
      minimal numerator
  */
  int minNum;

  /**
      minimal denominator
  */
  int minDen;

  /**
      maximal numerator
  */
  int maxNum;

  /**
      maximal denominator
  */
  int maxDen;

  /**
      default numerator
  */
  int defNum;

  /**
      default denominator
  */
  int defDen;
}

/**
    The #GstParentBufferMeta is a #GstMeta which can be attached to a #GstBuffer
    to hold a reference to another buffer that is only released when the child
    #GstBuffer is released.
    
    Typically, #GstParentBufferMeta is used when the child buffer is directly
    using the #GstMemory of the parent buffer, and wants to prevent the parent
    buffer from being returned to a buffer pool until the #GstMemory is available
    for re-use.
*/
struct GstParentBufferMeta
{
  /**
      the parent #GstMeta structure
  */
  GstMeta parent;

  /**
      the #GstBuffer on which a reference is being held.
  */
  GstBuffer* buffer;
}

/**
    Opaque structure.
*/
struct GstParseContext;

/**
    A #GstPipeline is a special #GstBin used as the toplevel container for
    the filter graph. The #GstPipeline will manage the selection and
    distribution of a global #GstClock as well as provide a #GstBus to the
    application.
    
    [gst.pipeline.Pipeline.new_] is used to create a pipeline. when you are done with
    the pipeline, use [gst.object.ObjectWrap.unref] to free its resources including all
    added #GstElement objects (if not otherwise referenced).
    
    Elements are added and removed from the pipeline using the #GstBin
    methods like [gst.bin.Bin.add] and [gst.bin.Bin.remove] (see #GstBin).
    
    Before changing the state of the #GstPipeline (see #GstElement) a #GstBus
    should be retrieved with [gst.pipeline.Pipeline.getBus]. This #GstBus should then
    be used to receive #GstMessage from the elements in the pipeline. Listening
    to the #GstBus is necessary for retrieving error messages from the
    #GstPipeline and otherwise the #GstPipeline might stop without any
    indication, why. Furthermore, the #GstPipeline posts messages even if
    nobody listens on the #GstBus, which will pile up and use up memory.
    
    By default, a #GstPipeline will automatically flush the pending #GstBus
    messages when going to the NULL state to ensure that no circular
    references exist when no messages are read from the #GstBus. This
    behaviour can be changed with [gst.pipeline.Pipeline.setAutoFlushBus].
    
    When the #GstPipeline performs the PAUSED to PLAYING state change it will
    select a clock for the elements. The clock selection algorithm will by
    default select a clock provided by an element that is most upstream
    (closest to the source). For live pipelines (ones that return
    #GST_STATE_CHANGE_NO_PREROLL from the [gst.element.Element.setState] call) this
    will select the clock provided by the live source. For normal pipelines
    this will select a clock provided by the sinks (most likely the audio
    sink). If no element provides a clock, a default #GstSystemClock is used.
    
    The clock selection can be controlled with the [gst.pipeline.Pipeline.useClock]
    method, which will enforce a given clock on the pipeline. With
    [gst.pipeline.Pipeline.autoClock] the default clock selection algorithm can be
    restored.
    
    A #GstPipeline maintains a running time for the elements. The running
    time is defined as the difference between the current clock time and
    the base time. When the pipeline goes to READY or a flushing seek is
    performed on it, the running time is reset to 0. When the pipeline is
    set from PLAYING to PAUSED, the current clock time is sampled and used to
    configure the base time for the elements when the pipeline is set
    to PLAYING again. The effect is that the running time (as the difference
    between the clock time and the base time) will count how much time was spent
    in the PLAYING state. This default behaviour can be changed with the
    [gst.element.Element.setStartTime] method.
*/
struct GstPipeline
{
  /** */
  GstBin bin;

  /**
      The fixed clock of the pipeline, used when
                    GST_PIPELINE_FLAG_FIXED_CLOCK is set.
  */
  GstClock* fixedClock;

  /**
      The stream time of the pipeline. A better name for this
              property would be the running_time, the total time spent in the
              PLAYING state without being flushed. (deprecated, use the start_time
              on GstElement).
  */
  GstClockTime streamTime;

  /**
      Extra delay added to base_time to compensate for computing delays
              when setting elements to PLAYING.
  */
  GstClockTime delay;

  /** */
  GstPipelinePrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstPipelineClass
{
  /** */
  GstBinClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstPipelinePrivate;

/**
    GStreamer is extensible, so #GstElement instances can be loaded at runtime.
    A plugin system can provide one or more of the basic GStreamer
    #GstPluginFeature subclasses.
    
    A plugin should export a symbol `gst_plugin_desc` that is a
    struct of type #GstPluginDesc.
    the plugin loader will check the version of the core library the plugin was
    linked against and will create a new #GstPlugin. It will then call the
    #GstPluginInitFunc function that was provided in the
    `gst_plugin_desc`.
    
    Once you have a handle to a #GstPlugin (e.g. from the #GstRegistry), you
    can add any object that subclasses #GstPluginFeature.
    
    Usually plugins are always automatically loaded so you don't need to call
    [gst.plugin.Plugin.load] explicitly to bring it into memory. There are options to
    statically link plugins to an app or even use GStreamer without a plugin
    repository in which case [gst.plugin.Plugin.load] can be needed to bring the plugin
    into memory.
*/
struct GstPlugin;

/** */
struct GstPluginClass;

/**
    A plugin should export a variable of this type called plugin_desc. The plugin
    loader will use the data provided there to initialize the plugin.
    
    The @licence parameter must be one of: LGPL, GPL, QPL, GPL/QPL, MPL,
    BSD, MIT/X11, Proprietary, unknown.
*/
struct GstPluginDesc
{
  /**
      the major version number of core that plugin was compiled for
  */
  int majorVersion;

  /**
      the minor version number of core that plugin was compiled for
  */
  int minorVersion;

  /**
      a unique name of the plugin
  */
  const(char)* name;

  /**
      description of plugin
  */
  const(char)* description;

  /**
      pointer to the init function of this plugin.
  */
  GstPluginInitFunc pluginInit;

  /**
      version of the plugin
  */
  const(char)* version_;

  /**
      effective license of plugin
  */
  const(char)* license;

  /**
      source module plugin belongs to
  */
  const(char)* source;

  /**
      shipped package plugin belongs to
  */
  const(char)* package_;

  /**
      URL to provider of plugin
  */
  const(char)* origin;

  /**
      date time string in ISO 8601
          format (or rather, a subset thereof), or null. Allowed are the
          following formats: "YYYY-MM-DD" and "YYY-MM-DDTHH:MMZ" (with
          'T' a separator and 'Z' indicating UTC/Zulu time). This field
          should be set via the GST_PACKAGE_RELEASE_DATETIME
          preprocessor macro.
  */
  const(char)* releaseDatetime;

  /** */
  void*[4] GstReserved;
}

/**
    This is a base class for anything that can be added to a #GstPlugin.
*/
struct GstPluginFeature;

/** */
struct GstPluginFeatureClass;

/**
    A #GstPoll keeps track of file descriptors much like fd_set (used with
    select ()) or a struct pollfd array (used with poll ()). Once created with
    [gst.poll.Poll.new_], the set can be used to wait for file descriptors to be
    readable and/or writable. It is possible to make this wait be controlled
    by specifying true for the @controllable flag when creating the set (or
    later calling [gst.poll.Poll.setControllable]).
    
    New file descriptors are added to the set using [gst.poll.Poll.addFd], and
    removed using [gst.poll.Poll.removeFd]. Controlling which file descriptors
    should be waited for to become readable and/or writable are done using
    [gst.poll.Poll.fdCtlRead], [gst.poll.Poll.fdCtlWrite] and [gst.poll.Poll.fdCtlPri].
    
    Use [gst.poll.Poll.wait] to wait for the file descriptors to actually become
    readable and/or writable, or to timeout if no file descriptor is available
    in time. The wait can be controlled by calling [gst.poll.Poll.restart] and
    [gst.poll.Poll.setFlushing].
    
    Once the file descriptor set has been waited for, one can use
    [gst.poll.Poll.fdHasClosed] to see if the file descriptor has been closed,
    [gst.poll.Poll.fdHasError] to see if it has generated an error,
    [gst.poll.Poll.fdCanRead] to see if it is possible to read from the file
    descriptor, and [gst.poll.Poll.fdCanWrite] to see if it is possible to
    write to it.
*/
struct GstPoll;

/**
    A file descriptor object.
*/
struct GstPollFD
{
  /**
      a file descriptor
  */
  int fd;

  /** */
  int idx;
}

/**
    This interface offers methods to query and manipulate parameter preset sets.
    A preset is a bunch of property settings, together with meta data and a name.
    The name of a preset serves as key for subsequent method calls to manipulate
    single presets.
    All instances of one type will share the list of presets. The list is created
    on demand, if presets are not used, the list is not created.
    
    The interface comes with a default implementation that serves most plugins.
    Wrapper plugins will override most methods to implement support for the
    native preset format of those wrapped plugins.
    One method that is useful to be overridden is [gst.preset.Preset.getPropertyNames].
    With that one can control which properties are saved and in which order.
    When implementing support for read-only presets, one should set the vmethods
    for [gst.preset.Preset.savePreset] and [gst.preset.Preset.deletePreset] to null.
    Applications can use [gst.preset.Preset.isEditable] to check for that.
    
    The default implementation supports presets located in a system directory,
    application specific directory and in the users home directory. When getting
    a list of presets individual presets are read and overlaid in 1) system,
    2) application and 3) user order. Whenever an earlier entry is newer, the
    later entries will be updated. Since 1.8 you can also provide extra paths
    where to find presets through the GST_PRESET_PATH environment variable.
    Presets found in those paths will be considered as "app presets".
*/
struct GstPreset;

/**
    #GstPreset interface.
*/
struct GstPresetInterface
{
  /**
      parent interface type.
  */
  GTypeInterface parent;

  /**
      virtual method to get list of presets
  */
  extern(C) char** function(GstPreset* preset) getPresetNames;

  /**
      virtual methods to get properties that are persistent
  */
  extern(C) char** function(GstPreset* preset) getPropertyNames;

  /**
      virtual methods to load a preset into properties
  */
  extern(C) gboolean function(GstPreset* preset, const(char)* name) loadPreset;

  /**
      virtual methods to save properties into a preset
  */
  extern(C) gboolean function(GstPreset* preset, const(char)* name) savePreset;

  /**
      virtual methods to rename a preset
  */
  extern(C) gboolean function(GstPreset* preset, const(char)* oldName, const(char)* newName) renamePreset;

  /**
      virtual methods to remove a preset
  */
  extern(C) gboolean function(GstPreset* preset, const(char)* name) deletePreset;

  /**
      virtual methods to set textual meta data to a preset
  */
  extern(C) gboolean function(GstPreset* preset, const(char)* name, const(char)* tag, const(char)* value) setMeta;

  /**
      virtual methods to get textual meta data from a preset
  */
  extern(C) gboolean function(GstPreset* preset, const(char)* name, const(char)* tag, char** value) getMeta;

  /** */
  void*[4] GstReserved;
}

/**
    The #GstPromise object implements the container for values that may
    be available later. i.e. a Future or a Promise in
    <https://en.wikipedia.org/wiki/Futures_and_promises>.
    As with all Future/Promise-like functionality, there is the concept of the
    producer of the value and the consumer of the value.
    
    A #GstPromise is created with [gst.promise.Promise.new_] by the consumer and passed
    to the producer to avoid thread safety issues with the change callback.
    A #GstPromise can be replied to with a value (or an error) by the producer
    with [gst.promise.Promise.reply]. The exact value returned is defined by the API
    contract of the producer and null may be a valid reply.
    [gst.promise.Promise.interrupt] is for the consumer to
    indicate to the producer that the value is not needed anymore and producing
    that value can stop.  The @GST_PROMISE_RESULT_EXPIRED state set by a call
    to [gst.promise.Promise.expire] indicates to the consumer that a value will never
    be produced and is intended to be called by a third party that implements
    some notion of message handling such as #GstBus.
    A callback can also be installed at #GstPromise creation for
    result changes with [gst.promise.Promise.newWithChangeFunc].
    The change callback can be used to chain #GstPromises's together as in the
    following example.
    ```c
    const GstStructure *reply;
    GstPromise *p;
    if (gst_promise_wait (promise) != GST_PROMISE_RESULT_REPLIED)
      return; // interrupted or expired value
    reply = gst_promise_get_reply (promise);
    if (error in reply)
      return; // propagate error
    p = gst_promise_new_with_change_func (another_promise_change_func, user_data, notify);
    pass p to promise-using API
    ```
    
    Each #GstPromise starts out with a #GstPromiseResult of
    [gst.types.PromiseResult.Pending] and only ever transitions once
    into one of the other #GstPromiseResult's.
    
    In order to support multi-threaded code, [gst.promise.Promise.reply],
    [gst.promise.Promise.interrupt] and [gst.promise.Promise.expire] may all be from
    different threads with some restrictions and the final result of the promise
    is whichever call is made first.  There are two restrictions on ordering:
    
    1. That [gst.promise.Promise.reply] and [gst.promise.Promise.interrupt] cannot be called
    after [gst.promise.Promise.expire]
    2. That [gst.promise.Promise.reply] and [gst.promise.Promise.interrupt]
    cannot be called twice.
    
    The change function set with [gst.promise.Promise.newWithChangeFunc] is
    called directly from either the [gst.promise.Promise.reply],
    [gst.promise.Promise.interrupt] or [gst.promise.Promise.expire] and can be called
    from an arbitrary thread.  #GstPromise using APIs can restrict this to
    a single thread or a subset of threads but that is entirely up to the API
    that uses #GstPromise.
*/
struct GstPromise
{
  /**
      parent #GstMiniObject
  */
  GstMiniObject parent;
}

/**
    Metadata type that holds information about a sample from a protection-protected
    track, including the information needed to decrypt it (if it is encrypted).
*/
struct GstProtectionMeta
{
  /**
      the parent #GstMeta.
  */
  GstMeta meta;

  /**
      the cryptographic information needed to decrypt the sample.
  */
  GstStructure* info;
}

/** */
struct GstProxyPad
{
  /** */
  GstPad pad;

  /** */
  GstProxyPadPrivate* priv;
}

/** */
struct GstProxyPadClass
{
  /** */
  GstPadClass parentClass;

  /** */
  void*[1] GstReserved;
}

/** */
struct GstProxyPadPrivate;

/**
    Queries can be performed on pads ([gst.pad.Pad.query]) and elements
    ([gst.element.Element.query]). Please note that some queries might need a running
    pipeline to work.
    
    Queries can be created using the gst_query_new_*() functions.
    Query values can be set using gst_query_set_*(), and parsed using
    gst_query_parse_*() helpers.
    
    The following example shows how to query the duration of a pipeline:
    ```c
      GstQuery *query;
      gboolean res;
      query = gst_query_new_duration (GST_FORMAT_TIME);
      res = gst_element_query (pipeline, query);
      if (res) {
        gint64 duration;
        gst_query_parse_duration (query, NULL, &duration);
        g_print ("duration = %"GST_TIME_FORMAT, GST_TIME_ARGS (duration));
      } else {
        g_print ("duration query failed...");
      }
      gst_query_unref (query);
    ```
*/
struct GstQuery
{
  /**
      The parent #GstMiniObject type
  */
  GstMiniObject miniObject;

  /**
      the #GstQueryType
  */
  GstQueryType type;
}

/**
    #GstReferenceTimestampMeta can be used to attach alternative timestamps and
    possibly durations to a #GstBuffer. These are generally not according to
    the pipeline clock and could be e.g. the NTP timestamp when the media was
    captured.
    
    The reference is stored as a #GstCaps in @reference. Examples of valid
    references would be
    
     $(LIST
        * `timestamp/x-drivername-stream`: for timestamps that are locally
          generated by some driver named `drivername` when generating the stream,
          e.g. based on a frame counter
        * `timestamp/x-ntp, host=pool.ntp.org, port=123`: for timestamps based on a
          specific NTP server. Note that the host/port parameters might not always
          be given.
        * `timestamp/x-ptp, version=IEEE1588-2008, domain=1`: for timestamps based
          on a given PTP clock.
        * `timestamp/x-unix`: for timestamps based on the UNIX epoch according to
          the local clock.
     )
       
    Since 1.24 it can be serialized using [gst.meta.Meta.serialize] and
    [gst.meta.Meta.deserialize].
*/
struct GstReferenceTimestampMeta
{
  /**
      the parent #GstMeta structure
  */
  GstMeta parent;

  /**
      identifier for the timestamp reference.
  */
  GstCaps* reference;

  /**
      timestamp
  */
  GstClockTime timestamp;

  /**
      duration, or `GST_CLOCK_TIME_NONE`
  */
  GstClockTime duration;
}

/**
    One registry holds the metadata of a set of plugins.
    
    <emphasis role="bold">Design:</emphasis>
    
    The #GstRegistry object is a list of plugins and some functions for dealing
    with them. Each #GstPlugin is matched 1-1 with a file on disk, and may or may
    not be loaded at a given time.
    
    The primary source, at all times, of plugin information is each plugin file
    itself. Thus, if an application wants information about a particular plugin,
    or wants to search for a feature that satisfies given criteria, the primary
    means of doing so is to load every plugin and look at the resulting
    information that is gathered in the default registry. Clearly, this is a time
    consuming process, so we cache information in the registry file. The format
    and location of the cache file is internal to gstreamer.
    
    On startup, plugins are searched for in the plugin search path. The following
    locations are checked in this order:
    
    $(LIST
      * location from --gst-plugin-path commandline option.
      * the GST_PLUGIN_PATH environment variable.
      * the GST_PLUGIN_SYSTEM_PATH environment variable.
      * default locations (if GST_PLUGIN_SYSTEM_PATH is not set).
        Those default locations are:
        `$XDG_DATA_HOME/gstreamer-$GST_API_VERSION/plugins/`
        and `$prefix/libs/gstreamer-$GST_API_VERSION/`.
        [$XDG_DATA_HOME](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html) defaults to
        `$HOME/.local/share`.
    )
      
    The registry cache file is loaded from
    `$XDG_CACHE_HOME/gstreamer-$GST_API_VERSION/registry-$ARCH.bin`
    (where $XDG_CACHE_HOME defaults to `$HOME/.cache`) or the file listed in the `GST_REGISTRY`
    env var. One reason to change the registry location is for testing.
    
    For each plugin that is found in the plugin search path, there could be 3
    possibilities for cached information:
    
      $(LIST
          * the cache may not contain information about a given file.
          * the cache may have stale information.
          * the cache may have current information.
      )
        
    In the first two cases, the plugin is loaded and the cache updated. In
    addition to these cases, the cache may have entries for plugins that are not
    relevant to the current process. These are marked as not available to the
    current process. If the cache is updated for whatever reason, it is marked
    dirty.
    
    A dirty cache is written out at the end of initialization. Each entry is
    checked to make sure the information is minimally valid. If not, the entry is
    simply dropped.
    
    ## Implementation notes:
    
    The "cache" and "registry" are different concepts and can represent
    different sets of plugins. For various reasons, at init time, the cache is
    stored in the default registry, and plugins not relevant to the current
    process are marked with the [gst.types.PluginFlags.Cached] bit. These plugins are
    removed at the end of initialization.
*/
struct GstRegistry
{
  /** */
  GstObject object;

  /** */
  GstRegistryPrivate* priv;
}

/** */
struct GstRegistryClass
{
  /** */
  GstObjectClass parentClass;
}

/** */
struct GstRegistryPrivate;

/**
    A #GstSample is a small object containing data, a type, timing and
    extra arbitrary information.
*/
struct GstSample;

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
struct GstSegment
{
  /**
      flags for this segment
  */
  GstSegmentFlags flags;

  /**
      the playback rate of the segment is set in response to a seek
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
  double rate;

  /**
      The applied rate is the rate that has been applied to the stream.
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
  double appliedRate;

  /**
      the unit used for all of the segment's values.
  */
  GstFormat format;

  /**
      the running time (plus elapsed time, see offset) of the
                     segment [start](GstSegment.start) ([stop](GstSegment.stop) if
                     rate < 0.0).
  */
  ulong base;

  /**
      the offset expresses the elapsed time (in buffer timestamps)
                     before a seek with its start (stop if rate < 0.0) seek type
                     set to #GST_SEEK_TYPE_NONE, the value is set to the position
                     of the segment at the time of the seek.
  */
  ulong offset;

  /**
      the start time of the segment (in buffer timestamps)
                     [(PTS)](GstBuffer.pts), that is the timestamp of the first
                     buffer to output inside the segment (last one during
                     reverse playback). For example decoders will
                     [clip](gst_segment_clip) out the buffers before the start
                     time.
  */
  ulong start;

  /**
      the stop time of the segment (in buffer timestamps)
                     [(PTS)](GstBuffer.pts), that is the timestamp of the last
                     buffer to output inside the segment (first one during
                     reverse playback). For example decoders will
                     [clip](gst_segment_clip) out buffers after the stop time.
  */
  ulong stop;

  /**
      the stream time of the segment [start](GstSegment.start)
                     ([stop](GstSegment.stop) if rate < 0.0).
  */
  ulong time;

  /**
      the buffer timestamp position in the segment is supposed to be
                     updated by elements such as sources, demuxers or parsers to
                     track progress by setting it to the last pushed buffer' end time
                     ([timestamp](GstBuffer.pts) + #GstBuffer.duration) for that
                     specific segment. The position is used when reconfiguring the
                     segment with #gst_segment_do_seek when the seek is only
                     updating the segment (see [offset](GstSegment.offset)).
  */
  ulong position;

  /**
      the duration of the segment is the maximum absolute difference
                     between #GstSegment.start and #GstSegment.stop if stop is not
                     set, otherwise it should be the difference between those
                     two values. This should be set by elements that know the
                     overall stream duration (like demuxers) and will be used when
                     seeking with #GST_SEEK_TYPE_END.
  */
  ulong duration;

  /** */
  void*[4] GstReserved;
}

/**
    The #GstSharedTaskPool object.
*/
struct GstSharedTaskPool
{
  /** */
  GstTaskPool parent;

  /** */
  GstSharedTaskPoolPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    The #GstSharedTaskPoolClass object.
*/
struct GstSharedTaskPoolClass
{
  /** */
  GstTaskPoolClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstSharedTaskPoolPrivate;

/**
    Data structure to initialize #GstCaps from a string description usually
    used in conjunction with GST_STATIC_CAPS() and [gst.static_caps.StaticCaps.get] to
    instantiate a #GstCaps.
*/
struct GstStaticCaps
{
  /**
      the cached #GstCaps
  */
  GstCaps* caps;

  /**
      a string describing a caps
  */
  const(char)* string_;

  /** */
  void*[4] GstReserved;
}

/**
    Structure describing the #GstStaticPadTemplate.
*/
struct GstStaticPadTemplate
{
  /**
      the name of the template
  */
  const(char)* nameTemplate;

  /**
      the direction of the template
  */
  GstPadDirection direction;

  /**
      the presence of the template
  */
  GstPadPresence presence;

  /**
      the caps of the template.
  */
  GstStaticCaps staticCaps;
}

/**
    A high-level object representing a single stream. It might be backed, or
    not, by an actual flow of data in a pipeline (#GstPad).
    
    A #GstStream does not care about data changes (such as decoding, encoding,
    parsing,...) as long as the underlying data flow corresponds to the same
    high-level flow (ex: a certain audio track).
    
    A #GstStream contains all the information pertinent to a stream, such as
    stream-id, tags, caps, type, ...
    
    Elements can subclass a #GstStream for internal usage (to contain information
    pertinent to streams of data).
*/
struct GstStream
{
  /** */
  GstObject object;

  /**
      The Stream Identifier for this #GstStream
  */
  const(char)* streamId;

  /** */
  GstStreamPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    GstStream class structure
*/
struct GstStreamClass
{
  /**
      the parent class structure
  */
  GstObjectClass parentClass;

  /** */
  void*[4] GstReserved;
}

/**
    A collection of #GstStream that are available.
    
    A #GstStreamCollection will be provided by elements that can make those
    streams available. Applications can use the collection to show the user
    what streams are available by using %[gst.stream_collection.StreamCollection.getStream]
    
    Once posted, a #GstStreamCollection is immutable. Updates are made by sending
    a new #GstStreamCollection message, which may or may not share some of
    the #GstStream objects from the collection it replaces. The receiver can check
    the sender of a stream collection message to know which collection is
    obsoleted.
    
    Several elements in a pipeline can provide #GstStreamCollection.
    
    Applications can activate streams from a collection by using the
    #GST_EVENT_SELECT_STREAMS event on a pipeline, bin or element.
*/
struct GstStreamCollection
{
  /** */
  GstObject object;

  /** */
  char* upstreamId;

  /** */
  GstStreamCollectionPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    GstStreamCollection class structure
*/
struct GstStreamCollectionClass
{
  /**
      the parent class structure
  */
  GstObjectClass parentClass;

  /**
      default signal handler for the stream-notify signal
  */
  extern(C) void function(GstStreamCollection* collection, GstStream* stream, GParamSpec* pspec) streamNotify;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstStreamCollectionPrivate;

/** */
struct GstStreamPrivate;

/**
    A #GstStructure is a collection of key/value pairs. The keys are expressed as
    GQuarks and the values can be of any GType.
    
    In addition to the key/value pairs, a #GstStructure also has a name. The name
    starts with a letter and can be filled by letters, numbers and any of
    "/-_.:".
    
    #GstStructure is used by various GStreamer subsystems to store information in
    a flexible and extensible way. A #GstStructure does not have a refcount
    because it usually is part of a higher level object such as #GstCaps,
    #GstMessage, #GstEvent, #GstQuery. It provides a means to enforce mutability
    using the refcount of the parent with the [gst.structure.Structure.setParentRefcount]
    method.
    
    A #GstStructure can be created with [gst.structure.Structure.newEmpty] or
    [gst.structure.Structure.new_], which both take a name and an optional set of key/value
    pairs along with the types of the values.
    
    Field values can be changed with [gst.structure.Structure.setValue] or
    [gst.structure.Structure.set].
    
    Field values can be retrieved with [gst.structure.Structure.getValue] or the more
    convenient gst_structure_get_*() functions.
    
    Fields can be removed with [gst.structure.Structure.removeField] or
    [gst.structure.Structure.removeFields].
    
    Strings in structures must be ASCII or UTF-8 encoded. Other encodings are not
    allowed. Strings may be null however.
    
    ## The serialization format
    
    GstStructure serialization format serialize the GstStructure name,
    keys/GType/values in a comma separated list with the structure name as first
    field without value followed by separated key/value pairs in the form
    `key=value`, for example:
    
    ```
    a-structure, key=value
    ````
    
    The values type will be inferred if not explicitly specified with the
    `(GTypeName)value` syntax, for example the following struct will have one
    field called 'is-string' which has the string 'true' as a value:
    
    ```
    a-struct, field-is-string=(string)true, field-is-boolean=true
    ```
    
    *Note*: without specifying `(string), `field-is-string` type would have been
    inferred as boolean.
    
    *Note*: we specified `(string)` as a type even if `gchararray` is the actual
    GType name as for convenience some well known types have been aliased or
    abbreviated.
    
    To avoid specifying the type, you can give some hints to the "type system".
    For example to specify a value as a double, you should add a decimal (ie. `1`
    is an [harfbuzz.types.int] while `1.0` is a `double`).
    
    *Note*: when a structure is serialized with #gst_structure_to_string, all
    values are explicitly typed.
    
    Some types have special delimiters:
    
    $(LIST
      * [GstValueArray](GST_TYPE_ARRAY) are inside curly brackets (`{` and `}`).
        For example `a-structure, array={1, 2, 3}`
      * Ranges are inside brackets (`[` and `]`). For example `a-structure,
        range=[1, 6, 2]` 1 being the min value, 6 the maximum and 2 the step. To
        specify a #GST_TYPE_INT64_RANGE you need to explicitly specify it like:
        `a-structure, a-int64-range=(gint64) [1, 5]`
      * [GstValueList](GST_TYPE_LIST) are inside "less and greater than" (`<` and
        `>`). For example `a-structure, list=<1, 2, 3>
    )
      
    Structures are delimited either by a null character `\0` or a semicolon `;`
    the latter allowing to store multiple structures in the same string (see
    #GstCaps).
    
    Quotes are used as "default" delimiters and can be used around any types that
    don't use other delimiters (for example `a-struct, i=(int)"1"`). They are use
    to allow adding spaces or special characters (such as delimiters,
    semicolumns, etc..) inside strings and you can use backslashes `\` to escape
    characters inside them, for example:
    
    ```
    a-struct, special="\"{[(;)]}\" can be used inside quotes"
    ```
    
    They also allow for nested structure, such as:
    
    ```
    a-struct, nested=(GstStructure)"nested-struct, nested=true"
    ```
    
    Since 1.20, nested structures and caps can be specified using brackets (`[`
    and `]`), for example:
    
    ```
    a-struct, nested=[nested-struct, nested=true]
    ```
    
    > *note*: [gst.structure.Structure.toString_] won't use that syntax for backward
    > compatibility reason, [gst.structure.Structure.serializeFull] has been added for
    > that purpose.
*/
struct GstStructure
{
  /**
      the GType of a structure
  */
  GType type;

  /** */
  GQuark name;
}

/**
    The GStreamer core provides a GstSystemClock based on the system time.
    Asynchronous callbacks are scheduled from an internal thread.
    
    Clock implementors are encouraged to subclass this systemclock as it
    implements the async notification.
    
    Subclasses can however override all of the important methods for sync and
    async notifications to implement their own callback methods or blocking
    wait operations.
*/
struct GstSystemClock
{
  /** */
  GstClock clock;

  /** */
  GstSystemClockPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstSystemClockClass
{
  /** */
  GstClockClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstSystemClockPrivate;

/**
    List of tags and values used to describe media metadata.
    
    Strings in structures must be ASCII or UTF-8 encoded. Other encodings are
    not allowed. Strings must not be empty or null.
*/
struct GstTagList
{
  /**
      the parent type
  */
  GstMiniObject miniObject;
}

/**
    Element interface that allows setting of media metadata.
    
    Elements that support changing a stream's metadata will implement this
    interface. Examples of such elements are 'vorbisenc', 'theoraenc' and
    'id3v2mux'.
    
    If you just want to retrieve metadata in your application then all you
    need to do is watch for tag messages on your pipeline's bus. This
    interface is only for setting metadata, not for extracting it. To set tags
    from the application, find tagsetter elements and set tags using e.g.
    [gst.tag_setter.TagSetter.mergeTags] or [gst.tag_setter.TagSetter.addTags]. Also consider
    setting the #GstTagMergeMode that is used for tag events that arrive at the
    tagsetter element (default mode is to keep existing tags).
    The application should do that before the element goes to [gst.types.State.Paused].
    
    Elements implementing the #GstTagSetter interface often have to merge
    any tags received from upstream and the tags set by the application via
    the interface. This can be done like this:
    
    ```c
    GstTagMergeMode merge_mode;
    const GstTagList *application_tags;
    const GstTagList *event_tags;
    GstTagSetter *tagsetter;
    GstTagList *result;
    
    tagsetter = GST_TAG_SETTER (element);
    
    merge_mode = gst_tag_setter_get_tag_merge_mode (tagsetter);
    application_tags = gst_tag_setter_get_tag_list (tagsetter);
    event_tags = (const GstTagList *) element->event_tags;
    
    GST_LOG_OBJECT (tagsetter, "merging tags, merge mode = %d", merge_mode);
    GST_LOG_OBJECT (tagsetter, "event tags: %" GST_PTR_FORMAT, event_tags);
    GST_LOG_OBJECT (tagsetter, "set   tags: %" GST_PTR_FORMAT, application_tags);
    
    result = gst_tag_list_merge (application_tags, event_tags, merge_mode);
    
    GST_LOG_OBJECT (tagsetter, "final tags: %" GST_PTR_FORMAT, result);
    ```
*/
struct GstTagSetter;

/**
    #GstTagSetterInterface interface.
*/
struct GstTagSetterInterface
{
  /**
      parent interface type.
  */
  GTypeInterface gIface;
}

/**
    #GstTask is used by #GstElement and #GstPad to provide the data passing
    threads in a #GstPipeline.
    
    A #GstPad will typically start a #GstTask to push or pull data to/from the
    peer pads. Most source elements start a #GstTask to push data. In some cases
    a demuxer element can start a #GstTask to pull data from a peer element. This
    is typically done when the demuxer can perform random access on the upstream
    peer element for improved performance.
    
    Although convenience functions exist on #GstPad to start/pause/stop tasks, it
    might sometimes be needed to create a #GstTask manually if it is not related to
    a #GstPad.
    
    Before the #GstTask can be run, it needs a #GRecMutex that can be set with
    [gst.task.Task.setLock].
    
    The task can be started, paused and stopped with [gst.task.Task.start], [gst.task.Task.pause]
    and [gst.task.Task.stop] respectively or with the [gst.task.Task.setState] function.
    
    A #GstTask will repeatedly call the #GstTaskFunction with the user data
    that was provided when creating the task with [gst.task.Task.new_]. While calling
    the function it will acquire the provided lock. The provided lock is released
    when the task pauses or stops.
    
    Stopping a task with [gst.task.Task.stop] will not immediately make sure the task is
    not running anymore. Use [gst.task.Task.join] to make sure the task is completely
    stopped and the thread is stopped.
    
    After creating a #GstTask, use [gst.object.ObjectWrap.unref] to free its resources. This can
    only be done when the task is not running anymore.
    
    Task functions can send a #GstMessage to send out-of-band data to the
    application. The application can receive messages from the #GstBus in its
    mainloop.
    
    For debugging purposes, the task will configure its object name as the thread
    name on Linux. Please note that the object name should be configured before the
    task is started; changing the object name after the task has been started, has
    no effect on the thread name.
*/
struct GstTask
{
  /** */
  GstObject object;

  /**
      the state of the task
  */
  GstTaskState state;

  /**
      used to pause/resume the task
  */
  GCond cond;

  /**
      The lock taken when iterating the task function
  */
  GRecMutex* lock;

  /**
      the function executed by this task
  */
  GstTaskFunction func;

  /**
      user_data passed to the task function
  */
  void* userData;

  /**
      GDestroyNotify for @user_data
  */
  GDestroyNotify notify;

  /**
      a flag indicating that the task is running
  */
  gboolean running;

  /** */
  GThread* thread;

  /** */
  GstTaskPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstTaskClass
{
  /** */
  GstObjectClass parentClass;

  /** */
  GstTaskPool* pool;

  /** */
  void*[4] GstReserved;
}

/**
    This object provides an abstraction for creating threads. The default
    implementation uses a regular GThreadPool to start tasks.
    
    Subclasses can be made to create custom threads.
*/
struct GstTaskPool
{
  /** */
  GstObject object;

  /** */
  GThreadPool* pool;

  /** */
  void*[4] GstReserved;
}

/**
    The #GstTaskPoolClass object.
*/
struct GstTaskPoolClass
{
  /**
      the parent class structure
  */
  GstObjectClass parentClass;

  /**
      prepare the threadpool
  */
  extern(C) void function(GstTaskPool* pool, GError** _err) prepare;

  /**
      make sure all threads are stopped
  */
  extern(C) void function(GstTaskPool* pool) cleanup;

  /**
      start a new thread
  */
  extern(C) void* function(GstTaskPool* pool, GstTaskPoolFunction func, void* userData, GError** _err) push;

  /**
      join a thread
  */
  extern(C) void function(GstTaskPool* pool, void* id) join;

  /** */
  extern(C) void function(GstTaskPool* pool, void* id) disposeHandle;

  /** */
  void*[3] GstReserved;
}

/** */
struct GstTaskPrivate;

/**
    Structure for storing a timestamp and a value.
*/
struct GstTimedValue
{
  /**
      timestamp of the value change
  */
  GstClockTime timestamp;

  /**
      the corresponding value
  */
  double value;
}

/**
    #GstToc functions are used to create/free #GstToc and #GstTocEntry structures.
    Also they are used to convert #GstToc into #GstStructure and vice versa.
    
    #GstToc lets you to inform other elements in pipeline or application that playing
    source has some kind of table of contents (TOC). These may be chapters, editions,
    angles or other types. For example: DVD chapters, Matroska chapters or cue sheet
    TOC. Such TOC will be useful for applications to display instead of just a
    playlist.
    
    Using TOC is very easy. Firstly, create #GstToc structure which represents root
    contents of the source. You can also attach TOC-specific tags to it. Then fill
    it with #GstTocEntry entries by appending them to the #GstToc using
    [gst.toc.Toc.appendEntry], and appending subentries to a #GstTocEntry using
    [gst.toc_entry.TocEntry.appendSubEntry].
    
    Note that root level of the TOC can contain only either editions or chapters. You
    should not mix them together at the same level. Otherwise you will get serialization
    /deserialization errors. Make sure that no one of the entries has negative start and
     stop values.
    
    Use [gst.event.Event.newToc] to create a new TOC #GstEvent, and [gst.event.Event.parseToc] to
    parse received TOC event. Use [gst.event.Event.newTocSelect] to create a new TOC select #GstEvent,
    and [gst.event.Event.parseTocSelect] to parse received TOC select event. The same rule for
    the #GstMessage: [gst.message.Message.newToc] to create new TOC #GstMessage, and
    [gst.message.Message.parseToc] to parse received TOC message.
    
    TOCs can have global scope or current scope. Global scope TOCs contain
    all entries that can possibly be selected using a toc select event, and
    are what an application is usually interested in. TOCs with current scope
    only contain the parts of the TOC relevant to the currently selected/playing
    stream; the current scope TOC is used by downstream elements such as muxers
    to write correct TOC entries when transcoding files, for example. When
    playing a DVD, the global TOC would contain a hierarchy of all titles,
    chapters and angles, for example, while the current TOC would only contain
    the chapters for the currently playing title if playback of a specific
    title was requested.
    
    Applications and plugins should not rely on TOCs having a certain kind of
    structure, but should allow for different alternatives. For example, a
    simple CUE sheet embedded in a file may be presented as a flat list of
    track entries, or could have a top-level edition node (or some other
    alternative type entry) with track entries underneath that node; or even
    multiple top-level edition nodes (or some other alternative type entries)
    each with track entries underneath, in case the source file has extracted
    a track listing from different sources).
*/
struct GstToc;

/** */
struct GstTocEntry;

/**
    Element interface that allows setting of the TOC.
    
    Elements that support some kind of chapters or editions (or tracks like in
    the FLAC cue sheet) will implement this interface.
    
    If you just want to retrieve the TOC in your application then all you
    need to do is watch for TOC messages on your pipeline's bus (or you can
    perform TOC query). This interface is only for setting TOC data, not for
    extracting it. To set TOC from the application, find proper tocsetter element
    and set TOC using [gst.toc_setter.TocSetter.setToc].
    
    Elements implementing the #GstTocSetter interface can extend existing TOC
    by getting extend UID for that (you can use [gst.toc.Toc.findEntry] to retrieve it)
    with any TOC entries received from downstream.
*/
struct GstTocSetter;

/**
    #GstTocSetterInterface interface.
*/
struct GstTocSetterInterface
{
  /**
      parent interface type.
  */
  GTypeInterface gIface;
}

/**
    Tracing modules will subclass #GstTracer and register through
    [gst.tracer.Tracer.register]. Modules can attach to various hook-types - see
    [gst.global.tracingRegisterHook]. When invoked they receive hook specific
    contextual data, which they must not modify.
*/
struct GstTracer
{
  /** */
  GstObject parent;

  /** */
  GstTracerPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstTracerClass
{
  /** */
  GstObjectClass parentClass;

  /** */
  void*[4] GstReserved;
}

/**
    Use [gst.tracer_factory.TracerFactory.getList] to get a list of tracer factories known to
    GStreamer.
*/
struct GstTracerFactory;

/** */
struct GstTracerFactoryClass;

/** */
struct GstTracerPrivate;

/**
    Tracing modules will create instances of this class to announce the data they
    will log and create a log formatter.
*/
struct GstTracerRecord;

/** */
struct GstTracerRecordClass;

/**
    The following functions allow you to detect the media type of an unknown
    stream.
*/
struct GstTypeFind
{
  /**
      Method to peek data.
  */
  extern(C) const(ubyte)* function(void* data, long offset, uint size) peek;

  /**
      Method to suggest #GstCaps with a given probability.
  */
  extern(C) void function(void* data, uint probability, GstCaps* caps) suggest;

  /**
      The data used by the caller of the typefinding function.
  */
  void* data;

  /**
      Returns the length of current data.
  */
  extern(C) ulong function(void* data) getLength;

  /** */
  void*[4] GstReserved;
}

/**
    These functions allow querying information about registered typefind
    functions. How to create and register these functions is described in
    the section <link linkend="gstreamer-Writing-typefind-functions">
    "Writing typefind functions"</link>.
    
    The following example shows how to write a very simple typefinder that
    identifies the given data. You can get quite a bit more complicated than
    that though.
    ```c
      typedef struct {
        guint8 *data;
        guint size;
        guint probability;
        GstCaps *data;
      } MyTypeFind;
      static void
      my_peek (gpointer data, gint64 offset, guint size)
      {
        MyTypeFind *find = (MyTypeFind *) data;
        if (offset >= 0 && offset + size <= find->size) {
          return find->data + offset;
        }
        return NULL;
      }
      static void
      my_suggest (gpointer data, guint probability, GstCaps *caps)
      {
        MyTypeFind *find = (MyTypeFind *) data;
        if (probability > find->probability) {
          find->probability = probability;
          gst_caps_replace (&find->caps, caps);
        }
      }
      static GstCaps *
      find_type (guint8 *data, guint size)
      {
        GList *walk, *type_list;
        MyTypeFind find = {data, size, 0, NULL};
        GstTypeFind gst_find = {my_peek, my_suggest, &find, };
        walk = type_list = gst_type_find_factory_get_list ();
        while (walk) {
          GstTypeFindFactory *factory = GST_TYPE_FIND_FACTORY (walk->data);
          walk = g_list_next (walk)
          gst_type_find_factory_call_function (factory, &gst_find);
        }
        g_list_free (type_list);
        return find.caps;
      };
    ```
*/
struct GstTypeFindFactory;

/** */
struct GstTypeFindFactoryClass;

/**
    The #GstURIHandler is an interface that is implemented by Source and Sink
    #GstElement to unify handling of URI.
    
    An application can use the following functions to quickly get an element
    that handles the given URI for reading or writing
    ([gst.element.Element.makeFromUri]).
    
    Source and Sink plugins should implement this interface when possible.
*/
struct GstURIHandler;

/**
    Any #GstElement using this interface should implement these methods.
*/
struct GstURIHandlerInterface
{
  /**
      The parent interface type
  */
  GTypeInterface parent;

  /**
      Method to tell whether the element handles source or sink URI.
  */
  extern(C) GstURIType function(GType type) getType;

  /**
      Method to return the list of protocols handled by the element.
  */
  extern(C) const(char*)* function(GType type) getProtocols;

  /**
      Method to return the URI currently handled by the element.
  */
  extern(C) char* function(GstURIHandler* handler) getUri;

  /**
      Method to set a new URI.
  */
  extern(C) gboolean function(GstURIHandler* handler, const(char)* uri, GError** _err) setUri;
}

/**
    A #GstUri object can be used to parse and split a URI string into its
    constituent parts. Two #GstUri objects can be joined to make a new #GstUri
    using the algorithm described in RFC3986.
*/
struct GstUri;

/**
    A fundamental type that describes an ordered list of #GValue
*/
struct GstValueArray;

/**
    A fundamental type that describes an unordered list of #GValue
*/
struct GstValueList;

/**
    VTable for the #GValue @type.
*/
struct GstValueTable
{
  /**
      a #GType
  */
  GType type;

  /**
      a #GstValueCompareFunc
  */
  GstValueCompareFunc compare;

  /**
      a #GstValueSerializeFunc
  */
  GstValueSerializeFunc serialize;

  /**
      a #GstValueDeserializeFunc
  */
  GstValueDeserializeFunc deserialize;

  /**
      a #GstValueDeserializeWithPSpecFunc
  */
  GstValueDeserializeWithPSpecFunc deserializeWithPspec;

  /** */
  void*[3] GstReserved;
}

alias extern(C) gboolean function(GstBuffer* buffer, GstMeta** meta, void* userData) GstBufferForeachMetaFunc;

alias extern(C) gboolean function(GstBuffer** buffer, uint idx, void* userData) GstBufferListFunc;

alias extern(C) gboolean function(GstBus* bus, GstMessage* message, void* userData) GstBusFunc;

alias extern(C) GstBusSyncReply function(GstBus* bus, GstMessage* message, void* userData) GstBusSyncHandler;

alias extern(C) gboolean function(GstCapsFeatures* features, GstStructure* structure, void* userData) GstCapsFilterMapFunc;

alias extern(C) gboolean function(GstCapsFeatures* features, GstStructure* structure, void* userData) GstCapsForeachFunc;

alias extern(C) gboolean function(GstCapsFeatures* features, GstStructure* structure, void* userData) GstCapsMapFunc;

alias extern(C) gboolean function(GstClock* clock, GstClockTime time, GstClockID id, void* userData) GstClockCallback;

alias extern(C) void function(GstControlBinding* binding, double srcValue, GValue* destValue) GstControlBindingConvert;

alias extern(C) gboolean function(GstControlSource* self, GstClockTime timestamp, double* value) GstControlSourceGetValue;

alias extern(C) gboolean function(GstControlSource* self, GstClockTime timestamp, GstClockTime interval, uint nValues, double* values) GstControlSourceGetValueArray;

alias extern(C) gboolean function(GstBuffer* transbuf, GstCustomMeta* meta, GstBuffer* buffer, GQuark type, void* data, void* userData) GstCustomMetaTransformFunction;

alias extern(C) void function() GstDebugFuncPtr;

alias extern(C) void function(GstElement* element, void* userData) GstElementCallAsyncFunc;

alias extern(C) gboolean function(GstElement* element, GstPad* pad, void* userData) GstElementForeachPadFunc;

alias extern(C) void function(const(GstIterator)* it, GstIterator* copy) GstIteratorCopyFunction;

alias extern(C) gboolean function(const(GValue)* item, GValue* ret, void* userData) GstIteratorFoldFunction;

alias extern(C) void function(const(GValue)* item, void* userData) GstIteratorForeachFunction;

alias extern(C) void function(GstIterator* it) GstIteratorFreeFunction;

alias extern(C) GstIteratorItem function(GstIterator* it, const(GValue)* item) GstIteratorItemFunction;

alias extern(C) GstIteratorResult function(GstIterator* it, GValue* result) GstIteratorNextFunction;

alias extern(C) void function(GstIterator* it) GstIteratorResyncFunction;

alias extern(C) void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, GstDebugMessage* message, void* userData) GstLogFunction;

alias extern(C) GstMemory* function(GstMemory* mem, ptrdiff_t offset, ptrdiff_t size) GstMemoryCopyFunction;

alias extern(C) gboolean function(GstMemory* mem1, GstMemory* mem2, size_t* offset) GstMemoryIsSpanFunction;

alias extern(C) void* function(GstMemory* mem, GstMapInfo* info, size_t maxsize) GstMemoryMapFullFunction;

alias extern(C) void* function(GstMemory* mem, size_t maxsize, GstMapFlags flags) GstMemoryMapFunction;

alias extern(C) GstMemory* function(GstMemory* mem, ptrdiff_t offset, ptrdiff_t size) GstMemoryShareFunction;

alias extern(C) void function(GstMemory* mem, GstMapInfo* info) GstMemoryUnmapFullFunction;

alias extern(C) void function(GstMemory* mem) GstMemoryUnmapFunction;

alias extern(C) void function(GstBuffer* buffer, GstMeta* meta) GstMetaClearFunction;

alias extern(C) GstMeta* function(const(GstMetaInfo)* info, GstBuffer* buffer, const(ubyte)* data, size_t size, ubyte version_) GstMetaDeserializeFunction;

alias extern(C) void function(GstMeta* meta, GstBuffer* buffer) GstMetaFreeFunction;

alias extern(C) gboolean function(GstMeta* meta, void* params, GstBuffer* buffer) GstMetaInitFunction;

alias extern(C) gboolean function(const(GstMeta)* meta, GstByteArrayInterface* data, ubyte* version_) GstMetaSerializeFunction;

alias extern(C) gboolean function(GstBuffer* transbuf, GstMeta* meta, GstBuffer* buffer, GQuark type, void* data) GstMetaTransformFunction;

alias extern(C) GstMiniObject* function(const(GstMiniObject)* obj) GstMiniObjectCopyFunction;

alias extern(C) gboolean function(GstMiniObject* obj) GstMiniObjectDisposeFunction;

alias extern(C) void function(GstMiniObject* obj) GstMiniObjectFreeFunction;

alias extern(C) void function(void* userData, GstMiniObject* obj) GstMiniObjectNotify;

alias extern(C) gboolean function(GstPad* pad, GstObject* parent) GstPadActivateFunction;

alias extern(C) gboolean function(GstPad* pad, GstObject* parent, GstPadMode mode, gboolean active) GstPadActivateModeFunction;

alias extern(C) GstFlowReturn function(GstPad* pad, GstObject* parent, GstBuffer* buffer) GstPadChainFunction;

alias extern(C) GstFlowReturn function(GstPad* pad, GstObject* parent, GstBufferList* list) GstPadChainListFunction;

alias extern(C) GstFlowReturn function(GstPad* pad, GstObject* parent, GstEvent* event) GstPadEventFullFunction;

alias extern(C) gboolean function(GstPad* pad, GstObject* parent, GstEvent* event) GstPadEventFunction;

alias extern(C) gboolean function(GstPad* pad, void* userData) GstPadForwardFunction;

alias extern(C) GstFlowReturn function(GstPad* pad, GstObject* parent, ulong offset, uint length, GstBuffer** buffer) GstPadGetRangeFunction;

alias extern(C) GstIterator* function(GstPad* pad, GstObject* parent) GstPadIterIntLinkFunction;

alias extern(C) GstPadLinkReturn function(GstPad* pad, GstObject* parent, GstPad* peer) GstPadLinkFunction;

alias extern(C) GstPadProbeReturn function(GstPad* pad, GstPadProbeInfo* info, void* userData) GstPadProbeCallback;

alias extern(C) gboolean function(GstPad* pad, GstObject* parent, GstQuery* query) GstPadQueryFunction;

alias extern(C) gboolean function(GstPad* pad, GstEvent** event, void* userData) GstPadStickyEventsForeachFunction;

alias extern(C) void function(GstPad* pad, GstObject* parent) GstPadUnlinkFunction;

alias extern(C) gboolean function(GstPluginFeature* feature, void* userData) GstPluginFeatureFilter;

alias extern(C) gboolean function(GstPlugin* plugin, void* userData) GstPluginFilter;

alias extern(C) gboolean function(GstPlugin* plugin, void* userData) GstPluginInitFullFunc;

alias extern(C) gboolean function(GstPlugin* plugin) GstPluginInitFunc;

alias extern(C) void function(GstPromise* promise, void* userData) GstPromiseChangeFunc;

alias extern(C) gboolean function(GQuark fieldId, GValue* value, void* userData) GstStructureFilterMapFunc;

alias extern(C) gboolean function(GQuark fieldId, const(GValue)* value, void* userData) GstStructureForeachFunc;

alias extern(C) gboolean function(GQuark fieldId, GValue* value, void* userData) GstStructureMapFunc;

alias extern(C) void function(const(GstTagList)* list, const(char)* tag, void* userData) GstTagForeachFunc;

alias extern(C) void function(GValue* dest, const(GValue)* src) GstTagMergeFunc;

alias extern(C) void function(void* userData) GstTaskFunction;

alias extern(C) void function(void* userData) GstTaskPoolFunction;

alias extern(C) void function(GstTask* task, GThread* thread, void* userData) GstTaskThreadFunc;

alias extern(C) void function(GstTypeFind* find, void* userData) GstTypeFindFunction;

alias extern(C) int function(const(GValue)* value1, const(GValue)* value2) GstValueCompareFunc;

alias extern(C) gboolean function(GValue* dest, const(char)* s) GstValueDeserializeFunc;

alias extern(C) gboolean function(GValue* dest, const(char)* s, GParamSpec* pspec) GstValueDeserializeWithPSpecFunc;

alias extern(C) char* function(const(GValue)* value1) GstValueSerializeFunc;

