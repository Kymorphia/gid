/// C types for gstapp1 library
module gstapp.c.types;

public import gid.basictypes;
public import gst.c.types;
public import gstbase.c.types;

/**
    Buffer dropping scheme to avoid the element's internal queue to block when
    full.
*/
enum GstAppLeakyType
{
  /**
      Not Leaky
  */
  None = 0,

  /**
      Leaky on upstream (new buffers)
  */
  Upstream = 1,

  /**
      Leaky on downstream (old buffers)
  */
  Downstream = 2,
}

/**
    The stream type.
*/
enum GstAppStreamType
{
  /**
      No seeking is supported in the stream, such as a
      live stream.
  */
  Stream = 0,

  /**
      The stream is seekable but seeking might not
      be very fast, such as data from a webserver.
  */
  Seekable = 1,

  /**
      The stream is seekable and seeking is fast,
      such as in a local file.
  */
  RandomAccess = 2,
}

/**
    Appsink is a sink plugin that supports many different methods for making
    the application get a handle on the GStreamer data in a pipeline. Unlike
    most GStreamer elements, Appsink provides external API functions.
    
    appsink can be used by linking to the gstappsink.h header file to access the
    methods or by using the appsink action signals and properties.
    
    The normal way of retrieving samples from appsink is by using the
    [gstapp.app_sink.AppSink.pullSample] and [gstapp.app_sink.AppSink.pullPreroll] methods.
    These methods block until a sample becomes available in the sink or when the
    sink is shut down or reaches EOS. There are also timed variants of these
    methods, [gstapp.app_sink.AppSink.tryPullSample] and [gstapp.app_sink.AppSink.tryPullPreroll],
    which accept a timeout parameter to limit the amount of time to wait.
    
    Appsink will internally use a queue to collect buffers from the streaming
    thread. If the application is not pulling samples fast enough, this queue
    will consume a lot of memory over time. The "max-buffers", "max-time" and "max-bytes"
    properties can be used to limit the queue size. The "drop" property controls whether the
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
    "eos" property or with the [gstapp.app_sink.AppSink.isEos] method.
    
    The eos signal can also be used to be informed when the EOS state is reached
    to avoid polling.
*/
struct GstAppSink
{
  /** */
  GstBaseSink basesink;

  /** */
  GstAppSinkPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    A set of callbacks that can be installed on the appsink with
    [gstapp.app_sink.AppSink.setCallbacks].
*/
struct GstAppSinkCallbacks
{
  /**
      Called when the end-of-stream has been reached. This callback
            is called from the streaming thread.
  */
  extern(C) void function(GstAppSink* appsink, void* userData) eos;

  /**
      Called when a new preroll sample is available.
            This callback is called from the streaming thread.
            The new preroll sample can be retrieved with
            [gstapp.app_sink.AppSink.pullPreroll] either from this callback
            or from any other thread.
  */
  extern(C) GstFlowReturn function(GstAppSink* appsink, void* userData) newPreroll;

  /**
      Called when a new sample is available.
            This callback is called from the streaming thread.
            The new sample can be retrieved with
            [gstapp.app_sink.AppSink.pullSample] either from this callback
            or from any other thread.
  */
  extern(C) GstFlowReturn function(GstAppSink* appsink, void* userData) newSample;

  /**
      Called when a new event is available.
            This callback is called from the streaming thread.
            The new event can be retrieved with
            gst_app_sink_pull_event() either from this callback
            or from any other thread.
            The callback should return true if the event has been handled,
            false otherwise.
            Since: 1.20
  */
  extern(C) gboolean function(GstAppSink* appsink, void* userData) newEvent;

  /**
      Called when the propose_allocation query is available.
            This callback is called from the streaming thread.
            The allocation query can be retrieved with
            gst_app_sink_propose_allocation() either from this callback
            or from any other thread.
            Since: 1.24
  */
  extern(C) gboolean function(GstAppSink* appsink, GstQuery* query, void* userData) proposeAllocation;

  /** */
  void*[2] GstReserved;
}

/** */
struct GstAppSinkClass
{
  /** */
  GstBaseSinkClass basesinkClass;

  /** */
  extern(C) void function(GstAppSink* appsink) eos;

  /** */
  extern(C) GstFlowReturn function(GstAppSink* appsink) newPreroll;

  /** */
  extern(C) GstFlowReturn function(GstAppSink* appsink) newSample;

  /** */
  extern(C) GstSample* function(GstAppSink* appsink) pullPreroll;

  /** */
  extern(C) GstSample* function(GstAppSink* appsink) pullSample;

  /** */
  extern(C) GstSample* function(GstAppSink* appsink, GstClockTime timeout) tryPullPreroll;

  /** */
  extern(C) GstSample* function(GstAppSink* appsink, GstClockTime timeout) tryPullSample;

  /** */
  extern(C) GstMiniObject* function(GstAppSink* appsink, GstClockTime timeout) tryPullObject;

  /** */
  void*[1] GstReserved;
}

/** */
struct GstAppSinkPrivate;

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
struct GstAppSrc
{
  /** */
  GstBaseSrc basesrc;

  /** */
  GstAppSrcPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    A set of callbacks that can be installed on the appsrc with
    [gstapp.app_src.AppSrc.setCallbacks].
*/
struct GstAppSrcCallbacks
{
  /**
      Called when the appsrc needs more data. A buffer or EOS should be
         pushed to appsrc from this thread or another thread. @length is just a hint
         and when it is set to -1, any number of bytes can be pushed into @appsrc.
  */
  extern(C) void function(GstAppSrc* src, uint length, void* userData) needData;

  /**
      Called when appsrc has enough data. It is recommended that the
         application stops calling push-buffer until the need_data callback is
         emitted again to avoid excessive buffer queueing.
  */
  extern(C) void function(GstAppSrc* src, void* userData) enoughData;

  /**
      Called when a seek should be performed to the offset.
         The next push-buffer should produce buffers from the new @offset.
         This callback is only called for seekable stream types.
  */
  extern(C) gboolean function(GstAppSrc* src, ulong offset, void* userData) seekData;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAppSrcClass
{
  /** */
  GstBaseSrcClass basesrcClass;

  /** */
  extern(C) void function(GstAppSrc* appsrc, uint length) needData;

  /** */
  extern(C) void function(GstAppSrc* appsrc) enoughData;

  /** */
  extern(C) gboolean function(GstAppSrc* appsrc, ulong offset) seekData;

  /** */
  extern(C) GstFlowReturn function(GstAppSrc* appsrc, GstBuffer* buffer) pushBuffer;

  /** */
  extern(C) GstFlowReturn function(GstAppSrc* appsrc) endOfStream;

  /** */
  extern(C) GstFlowReturn function(GstAppSrc* appsrc, GstSample* sample) pushSample;

  /** */
  extern(C) GstFlowReturn function(GstAppSrc* appsrc, GstBufferList* bufferList) pushBufferList;

  /** */
  void*[2] GstReserved;
}

/** */
struct GstAppSrcPrivate;

