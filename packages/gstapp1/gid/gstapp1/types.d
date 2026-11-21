/// D types for gstapp1 library
module gid.gstapp1.types;

import gid.core.gid;
import gid.gst1.query;
import gid.gst1.types;
import gid.gstapp1.app_sink;
import gid.gstapp1.app_src;
import gid.gstapp1.c.functions;
import gid.gstapp1.c.types;


// Enums

/** */
alias AppLeakyType = GstAppLeakyType;

/** */
alias AppStreamType = GstAppStreamType;

// Structs

/** */
alias AppSinkCallbacks = GstAppSinkCallbacks;

/** */
alias AppSrcCallbacks = GstAppSrcCallbacks;

// Callbacks

/**
    Called when the end-of-stream has been reached. This callback
    is called from the streaming thread.

    Params:
      appsink = a #GstAppSink
*/
alias AppSinkEosCallback = void delegate(gid.gstapp1.app_sink.AppSink appsink);

/**
    Called when a new event is available. This callback is called from the
    streaming thread. The new event can be retrieved with
    [gid.gstapp1.app_sink.AppSink.pullObject] either from this callback or from any other thread.
    
    The callback should return true if the event has been handled, false
    otherwise.

    Params:
      appsink = a #GstAppSink
    Returns: true when the event has been handled.
*/
alias AppSinkNewEventCallback = bool delegate(gid.gstapp1.app_sink.AppSink appsink);

/**
    Called when a new preroll sample is available. This callback is called from
    the streaming thread. The new preroll sample can be retrieved with
    [gid.gstapp1.app_sink.AppSink.pullPreroll] either from this callback or from any other
    thread.

    Params:
      appsink = a #GstAppSink
    Returns: [gid.gst1.types.FlowReturn.Ok] on success.
*/
alias AppSinkNewPrerollCallback = gid.gst1.types.FlowReturn delegate(gid.gstapp1.app_sink.AppSink appsink);

/**
    Called when a new sample is available. This callback is called from the
    streaming thread. The new sample can be retrieved with
    [gid.gstapp1.app_sink.AppSink.pullSample] either from this callback or from any other
    thread.

    Params:
      appsink = a #GstAppSink
    Returns: [gid.gst1.types.FlowReturn.Ok] on success.
*/
alias AppSinkNewSampleCallback = gid.gst1.types.FlowReturn delegate(gid.gstapp1.app_sink.AppSink appsink);

/**
    Called when the propose_allocation query is available. This callback is
    called from the streaming thread.

    Params:
      appsink = a #GstAppSink
      query = An ALLOCATION query (modified in place, changes are seen by the caller)
    Returns: true when the query has been handled.
*/
alias AppSinkProposeAllocationCallback = bool delegate(gid.gstapp1.app_sink.AppSink appsink, gid.gst1.query.Query query);

/**
    Called when appsrc has enough data. It is recommended that the application
    stops calling push-buffer until the need_data callback is emitted again to
    avoid excessive buffer queueing.

    Params:
      appsrc = a #GstAppSrc
*/
alias AppSrcEnoughDataCallback = void delegate(gid.gstapp1.app_src.AppSrc appsrc);

/**
    Called when the appsrc needs more data. A buffer or EOS should be pushed to
    appsrc from this thread or another thread. length is just a hint and when it
    is set to -1, any number of bytes can be pushed into appsrc.

    Params:
      appsrc = a #GstAppSrc
      length = Length hint
*/
alias AppSrcNeedDataCallback = void delegate(gid.gstapp1.app_src.AppSrc appsrc, uint length);

/**
    Called when a seek should be performed to the offset. The next push-buffer
    should produce buffers from the new offset. This callback is only called for
    seekable stream types.

    Params:
      appsrc = a #GstAppSrc
      offset = Offset to seek to.
    Returns: true if the seek was successful.
*/
alias AppSrcSeekDataCallback = bool delegate(gid.gstapp1.app_src.AppSrc appsrc, ulong offset);
