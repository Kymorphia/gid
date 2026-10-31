/// D types for gstapp1 library
module gstapp.types;

import gid.gid;
import gst.query;
import gst.types;
import gstapp.app_sink;
import gstapp.app_src;
import gstapp.c.functions;
import gstapp.c.types;


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
alias AppSinkEosCallback = void delegate(gstapp.app_sink.AppSink appsink);

/**
    Called when a new event is available. This callback is called from the
    streaming thread. The new event can be retrieved with
    [gstapp.app_sink.AppSink.pullObject] either from this callback or from any other thread.
    
    The callback should return true if the event has been handled, false
    otherwise.

    Params:
      appsink = a #GstAppSink
    Returns: true when the event has been handled.
*/
alias AppSinkNewEventCallback = bool delegate(gstapp.app_sink.AppSink appsink);

/**
    Called when a new preroll sample is available. This callback is called from
    the streaming thread. The new preroll sample can be retrieved with
    [gstapp.app_sink.AppSink.pullPreroll] either from this callback or from any other
    thread.

    Params:
      appsink = a #GstAppSink
    Returns: [gst.types.FlowReturn.Ok] on success.
*/
alias AppSinkNewPrerollCallback = gst.types.FlowReturn delegate(gstapp.app_sink.AppSink appsink);

/**
    Called when a new sample is available. This callback is called from the
    streaming thread. The new sample can be retrieved with
    [gstapp.app_sink.AppSink.pullSample] either from this callback or from any other
    thread.

    Params:
      appsink = a #GstAppSink
    Returns: [gst.types.FlowReturn.Ok] on success.
*/
alias AppSinkNewSampleCallback = gst.types.FlowReturn delegate(gstapp.app_sink.AppSink appsink);

/**
    Called when the propose_allocation query is available. This callback is
    called from the streaming thread.

    Params:
      appsink = a #GstAppSink
      query = An ALLOCATION query
    Returns: true when the query has been handled.
*/
alias AppSinkProposeAllocationCallback = bool delegate(gstapp.app_sink.AppSink appsink, gst.query.Query query);

/**
    Called when appsrc has enough data. It is recommended that the application
    stops calling push-buffer until the need_data callback is emitted again to
    avoid excessive buffer queueing.

    Params:
      appsrc = a #GstAppSrc
*/
alias AppSrcEnoughDataCallback = void delegate(gstapp.app_src.AppSrc appsrc);

/**
    Called when the appsrc needs more data. A buffer or EOS should be pushed to
    appsrc from this thread or another thread. length is just a hint and when it
    is set to -1, any number of bytes can be pushed into appsrc.

    Params:
      appsrc = a #GstAppSrc
      length = Length hint
*/
alias AppSrcNeedDataCallback = void delegate(gstapp.app_src.AppSrc appsrc, uint length);

/**
    Called when a seek should be performed to the offset. The next push-buffer
    should produce buffers from the new offset. This callback is only called for
    seekable stream types.

    Params:
      appsrc = a #GstAppSrc
      offset = Offset to seek to.
    Returns: true if the seek was successful.
*/
alias AppSrcSeekDataCallback = bool delegate(gstapp.app_src.AppSrc appsrc, ulong offset);
