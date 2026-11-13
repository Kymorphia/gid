/// D types for gstbase1 library
module gstbase.types;

import gid.gid;
import gst.buffer;
import gst.event;
import gst.object;
import gst.query;
import gst.types;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.collect_data;
import gstbase.collect_pads;
import gstbase.data_queue;


// Enums

/** */
alias AggregatorStartTimeSelection = GstAggregatorStartTimeSelection;

/** */
alias BaseParseFrameFlags = GstBaseParseFrameFlags;

/** */
alias BaseSrcFlags = GstBaseSrcFlags;

/** */
alias CollectPadsStateFlags = GstCollectPadsStateFlags;

// Structs

/** */
alias DataQueueSize = GstDataQueueSize;

/** */
alias TypeFindData = GstTypeFindData*;

// Callbacks

/**
    A function that will be called when the #GstCollectData will be freed.
    It is passed the pointer to the structure and should free any custom
    memory and resources allocated for it.

    Params:
      data = the #GstCollectData that will be freed (borrowed, only valid during the callback)
*/
alias CollectDataDestroyNotify = void delegate(gstbase.collect_data.CollectData data);

/**
    A function that will be called when a (considered oldest) buffer can be muxed.
    If all pads have reached EOS, this function is called with null buffer
    and null data.

    Params:
      pads = the #GstCollectPads that triggered the callback
      data = the #GstCollectData of pad that has received the buffer (borrowed, only valid during the callback)
      buffer = the #GstBuffer
    Returns: [gst.types.FlowReturn.Ok] for success
*/
alias CollectPadsBufferFunction = gst.types.FlowReturn delegate(gstbase.collect_pads.CollectPads pads, gstbase.collect_data.CollectData data, gst.buffer.Buffer buffer);

/**
    A function that will be called when inbuffer is received on the pad managed
    by data in the collectpad object pads.
    
    The function should use the segment of data and the negotiated media type on
    the pad to perform clipping of inbuffer.
    
    This function takes ownership of inbuffer and should output a buffer in
    outbuffer or return null in outbuffer if the buffer should be dropped.

    Params:
      pads = a #GstCollectPads
      data = a #GstCollectData (borrowed, only valid during the callback)
      inbuffer = the input #GstBuffer
      outbuffer = the output #GstBuffer
    Returns: a #GstFlowReturn that corresponds to the result of clipping.
*/
alias CollectPadsClipFunction = gst.types.FlowReturn delegate(gstbase.collect_pads.CollectPads pads, gstbase.collect_data.CollectData data, gst.buffer.Buffer inbuffer, out gst.buffer.Buffer outbuffer);

/**
    A function for comparing two timestamps of buffers or newsegments collected on one pad.

    Params:
      pads = the #GstCollectPads that is comparing the timestamps
      data1 = the first #GstCollectData (borrowed, only valid during the callback)
      timestamp1 = the first timestamp
      data2 = the second #GstCollectData (borrowed, only valid during the callback)
      timestamp2 = the second timestamp
    Returns: Integer less than zero when first timestamp is deemed older than the second one.
               Zero if the timestamps are deemed equally old.
               Integer greater than zero when second timestamp is deemed older than the first one.
*/
alias CollectPadsCompareFunction = int delegate(gstbase.collect_pads.CollectPads pads, gstbase.collect_data.CollectData data1, gst.types.ClockTime timestamp1, gstbase.collect_data.CollectData data2, gst.types.ClockTime timestamp2);

/**
    A function that will be called while processing an event. It takes
    ownership of the event and is responsible for chaining up (to
    [gstbase.collect_pads.CollectPads.eventDefault]) or dropping events (such typical cases
    being handled by the default handler).

    Params:
      pads = the #GstCollectPads that triggered the callback
      pad = the #GstPad that received an event (borrowed, only valid during the callback)
      event = the #GstEvent received (modified in place, changes are seen by the caller)
    Returns: true if the pad could handle the event
*/
alias CollectPadsEventFunction = bool delegate(gstbase.collect_pads.CollectPads pads, gstbase.collect_data.CollectData pad, gst.event.Event event);

/**
    A function that will be called while processing a flushing seek event.
    
    The function should flush any internal state of the element and the state of
    all the pads. It should clear only the state not directly managed by the
    pads object. It is therefore not necessary to call
    gst_collect_pads_set_flushing nor gst_collect_pads_clear from this function.

    Params:
      pads = a #GstCollectPads
*/
alias CollectPadsFlushFunction = void delegate(gstbase.collect_pads.CollectPads pads);

/**
    A function that will be called when all pads have received data.

    Params:
      pads = the #GstCollectPads that triggered the callback
    Returns: [gst.types.FlowReturn.Ok] for success
*/
alias CollectPadsFunction = gst.types.FlowReturn delegate(gstbase.collect_pads.CollectPads pads);

/**
    A function that will be called while processing a query. It takes
    ownership of the query and is responsible for chaining up (to
    events downstream (with [gst.pad.Pad.eventDefault]).

    Params:
      pads = the #GstCollectPads that triggered the callback
      pad = the #GstPad that received an event (borrowed, only valid during the callback)
      query = the #GstEvent received (modified in place, changes are seen by the caller)
    Returns: true if the pad could handle the event
*/
alias CollectPadsQueryFunction = bool delegate(gstbase.collect_pads.CollectPads pads, gstbase.collect_data.CollectData pad, gst.query.Query query);

/** */
alias DataQueueEmptyCallback = void delegate(gstbase.data_queue.DataQueue queue);

/** */
alias DataQueueFullCallback = void delegate(gstbase.data_queue.DataQueue queue);

/**
    This function will be called by [gstbase.global.typeFindHelperGetRange] when
    typefinding functions request to peek at the data of a stream at certain
    offsets. If this function returns GST_FLOW_OK, the result buffer will be
    stored in buffer. The  contents of buffer is invalid for any other
    return value.
    
    This function is supposed to behave exactly like a #GstPadGetRangeFunction.

    Params:
      obj = a #GstObject that will handle the getrange request
      parent = the parent of obj or null
      offset = the offset of the range
      length = the length of the range
      buffer = a memory location to hold the result buffer
    Returns: GST_FLOW_OK for success
*/
alias TypeFindHelperGetRangeFunction = gst.types.FlowReturn delegate(gst.object.ObjectWrap obj, gst.object.ObjectWrap parent, ulong offset, uint length, out gst.buffer.Buffer buffer);

/** */
enum BASE_PARSE_FLAG_DRAINING = 2;

/** */
enum BASE_PARSE_FLAG_LOST_SYNC = 1;

/**
    The name of the templates for the sink pad.
*/
enum BASE_TRANSFORM_SINK_NAME = "sink";

/**
    The name of the templates for the source pad.
*/
enum BASE_TRANSFORM_SRC_NAME = "src";
