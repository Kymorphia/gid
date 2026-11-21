/// D types for gstbase1 library
module gid.gstbase1.types;

import gid.core.gid;
import gid.gst1.buffer;
import gid.gst1.event;
import gid.gst1.object;
import gid.gst1.query;
import gid.gst1.types;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.collect_data;
import gid.gstbase1.collect_pads;
import gid.gstbase1.data_queue;


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
alias CollectDataDestroyNotify = void delegate(gid.gstbase1.collect_data.CollectData data);

/**
    A function that will be called when a (considered oldest) buffer can be muxed.
    If all pads have reached EOS, this function is called with null buffer
    and null data.

    Params:
      pads = the #GstCollectPads that triggered the callback
      data = the #GstCollectData of pad that has received the buffer (borrowed, only valid during the callback)
      buffer = the #GstBuffer
    Returns: [gid.gst1.types.FlowReturn.Ok] for success
*/
alias CollectPadsBufferFunction = gid.gst1.types.FlowReturn delegate(gid.gstbase1.collect_pads.CollectPads pads, gid.gstbase1.collect_data.CollectData data, gid.gst1.buffer.Buffer buffer);

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
alias CollectPadsClipFunction = gid.gst1.types.FlowReturn delegate(gid.gstbase1.collect_pads.CollectPads pads, gid.gstbase1.collect_data.CollectData data, gid.gst1.buffer.Buffer inbuffer, out gid.gst1.buffer.Buffer outbuffer);

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
alias CollectPadsCompareFunction = int delegate(gid.gstbase1.collect_pads.CollectPads pads, gid.gstbase1.collect_data.CollectData data1, gid.gst1.types.ClockTime timestamp1, gid.gstbase1.collect_data.CollectData data2, gid.gst1.types.ClockTime timestamp2);

/**
    A function that will be called while processing an event. It takes
    ownership of the event and is responsible for chaining up (to
    [gid.gstbase1.collect_pads.CollectPads.eventDefault]) or dropping events (such typical cases
    being handled by the default handler).

    Params:
      pads = the #GstCollectPads that triggered the callback
      pad = the #GstPad that received an event (borrowed, only valid during the callback)
      event = the #GstEvent received (modified in place, changes are seen by the caller)
    Returns: true if the pad could handle the event
*/
alias CollectPadsEventFunction = bool delegate(gid.gstbase1.collect_pads.CollectPads pads, gid.gstbase1.collect_data.CollectData pad, gid.gst1.event.Event event);

/**
    A function that will be called while processing a flushing seek event.
    
    The function should flush any internal state of the element and the state of
    all the pads. It should clear only the state not directly managed by the
    pads object. It is therefore not necessary to call
    gst_collect_pads_set_flushing nor gst_collect_pads_clear from this function.

    Params:
      pads = a #GstCollectPads
*/
alias CollectPadsFlushFunction = void delegate(gid.gstbase1.collect_pads.CollectPads pads);

/**
    A function that will be called when all pads have received data.

    Params:
      pads = the #GstCollectPads that triggered the callback
    Returns: [gid.gst1.types.FlowReturn.Ok] for success
*/
alias CollectPadsFunction = gid.gst1.types.FlowReturn delegate(gid.gstbase1.collect_pads.CollectPads pads);

/**
    A function that will be called while processing a query. It takes
    ownership of the query and is responsible for chaining up (to
    events downstream (with [gid.gst1.pad.Pad.eventDefault]).

    Params:
      pads = the #GstCollectPads that triggered the callback
      pad = the #GstPad that received an event (borrowed, only valid during the callback)
      query = the #GstEvent received (modified in place, changes are seen by the caller)
    Returns: true if the pad could handle the event
*/
alias CollectPadsQueryFunction = bool delegate(gid.gstbase1.collect_pads.CollectPads pads, gid.gstbase1.collect_data.CollectData pad, gid.gst1.query.Query query);

/** */
alias DataQueueEmptyCallback = void delegate(gid.gstbase1.data_queue.DataQueue queue);

/** */
alias DataQueueFullCallback = void delegate(gid.gstbase1.data_queue.DataQueue queue);

/**
    This function will be called by [gid.gstbase1.global.typeFindHelperGetRange] when
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
alias TypeFindHelperGetRangeFunction = gid.gst1.types.FlowReturn delegate(gid.gst1.object.ObjectWrap obj, gid.gst1.object.ObjectWrap parent, ulong offset, uint length, out gid.gst1.buffer.Buffer buffer);

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
