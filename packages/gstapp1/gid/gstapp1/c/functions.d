/// C functions for gstapp1 library
module gid.gstapp1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstapp1.c.types;
static import gid.gstapp1.c._gidlib_GstApp;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;

private immutable LIBS = ["gstapp-1.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.gstapp1.c._gidlib_GstApp.gidLibLinked;

// AppSink
private alias c_gst_app_sink_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_app_sink_get_typeFn c_gst_app_sink_get_type; ///
private alias c_gst_app_sink_get_buffer_list_supportFn = extern(C) gboolean function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_buffer_list_supportFn c_gst_app_sink_get_buffer_list_support; ///
private alias c_gst_app_sink_get_capsFn = extern(C) GstCaps* function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_capsFn c_gst_app_sink_get_caps; ///
private alias c_gst_app_sink_get_current_level_buffersFn = extern(C) ulong function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_current_level_buffersFn c_gst_app_sink_get_current_level_buffers; ///
private alias c_gst_app_sink_get_current_level_bytesFn = extern(C) ulong function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_current_level_bytesFn c_gst_app_sink_get_current_level_bytes; ///
private alias c_gst_app_sink_get_current_level_timeFn = extern(C) GstClockTime function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_current_level_timeFn c_gst_app_sink_get_current_level_time; ///
private alias c_gst_app_sink_get_dropFn = extern(C) gboolean function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_dropFn c_gst_app_sink_get_drop; ///
private alias c_gst_app_sink_get_emit_signalsFn = extern(C) gboolean function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_emit_signalsFn c_gst_app_sink_get_emit_signals; ///
private alias c_gst_app_sink_get_leaky_typeFn = extern(C) GstAppLeakyType function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_leaky_typeFn c_gst_app_sink_get_leaky_type; ///
private alias c_gst_app_sink_get_max_buffersFn = extern(C) uint function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_max_buffersFn c_gst_app_sink_get_max_buffers; ///
private alias c_gst_app_sink_get_max_bytesFn = extern(C) ulong function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_max_bytesFn c_gst_app_sink_get_max_bytes; ///
private alias c_gst_app_sink_get_max_timeFn = extern(C) GstClockTime function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_max_timeFn c_gst_app_sink_get_max_time; ///
private alias c_gst_app_sink_get_wait_on_eosFn = extern(C) gboolean function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_get_wait_on_eosFn c_gst_app_sink_get_wait_on_eos; ///
private alias c_gst_app_sink_is_eosFn = extern(C) gboolean function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_is_eosFn c_gst_app_sink_is_eos; ///
private alias c_gst_app_sink_pull_objectFn = extern(C) GstMiniObject* function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_pull_objectFn c_gst_app_sink_pull_object; ///
private alias c_gst_app_sink_pull_prerollFn = extern(C) GstSample* function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_pull_prerollFn c_gst_app_sink_pull_preroll; ///
private alias c_gst_app_sink_pull_sampleFn = extern(C) GstSample* function(GstAppSink* appsink) nothrow;
__gshared c_gst_app_sink_pull_sampleFn c_gst_app_sink_pull_sample; ///
private alias c_gst_app_sink_set_buffer_list_supportFn = extern(C) void function(GstAppSink* appsink, gboolean enableLists) nothrow;
__gshared c_gst_app_sink_set_buffer_list_supportFn c_gst_app_sink_set_buffer_list_support; ///
private alias c_gst_app_sink_set_callbacksFn = extern(C) void function(GstAppSink* appsink, GstAppSinkCallbacks* callbacks, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_app_sink_set_callbacksFn c_gst_app_sink_set_callbacks; ///
private alias c_gst_app_sink_set_capsFn = extern(C) void function(GstAppSink* appsink, const(GstCaps)* caps) nothrow;
__gshared c_gst_app_sink_set_capsFn c_gst_app_sink_set_caps; ///
private alias c_gst_app_sink_set_dropFn = extern(C) void function(GstAppSink* appsink, gboolean drop) nothrow;
__gshared c_gst_app_sink_set_dropFn c_gst_app_sink_set_drop; ///
private alias c_gst_app_sink_set_emit_signalsFn = extern(C) void function(GstAppSink* appsink, gboolean emit) nothrow;
__gshared c_gst_app_sink_set_emit_signalsFn c_gst_app_sink_set_emit_signals; ///
private alias c_gst_app_sink_set_leaky_typeFn = extern(C) void function(GstAppSink* appsink, GstAppLeakyType leaky) nothrow;
__gshared c_gst_app_sink_set_leaky_typeFn c_gst_app_sink_set_leaky_type; ///
private alias c_gst_app_sink_set_max_buffersFn = extern(C) void function(GstAppSink* appsink, uint max) nothrow;
__gshared c_gst_app_sink_set_max_buffersFn c_gst_app_sink_set_max_buffers; ///
private alias c_gst_app_sink_set_max_bytesFn = extern(C) void function(GstAppSink* appsink, ulong max) nothrow;
__gshared c_gst_app_sink_set_max_bytesFn c_gst_app_sink_set_max_bytes; ///
private alias c_gst_app_sink_set_max_timeFn = extern(C) void function(GstAppSink* appsink, GstClockTime max) nothrow;
__gshared c_gst_app_sink_set_max_timeFn c_gst_app_sink_set_max_time; ///
private alias c_gst_app_sink_set_simple_callbacksFn = extern(C) void function(GstAppSink* appsink, GstAppSinkSimpleCallbacks* cb) nothrow;
__gshared c_gst_app_sink_set_simple_callbacksFn c_gst_app_sink_set_simple_callbacks; ///
private alias c_gst_app_sink_set_wait_on_eosFn = extern(C) void function(GstAppSink* appsink, gboolean wait) nothrow;
__gshared c_gst_app_sink_set_wait_on_eosFn c_gst_app_sink_set_wait_on_eos; ///
private alias c_gst_app_sink_try_pull_objectFn = extern(C) GstMiniObject* function(GstAppSink* appsink, GstClockTime timeout) nothrow;
__gshared c_gst_app_sink_try_pull_objectFn c_gst_app_sink_try_pull_object; ///
private alias c_gst_app_sink_try_pull_prerollFn = extern(C) GstSample* function(GstAppSink* appsink, GstClockTime timeout) nothrow;
__gshared c_gst_app_sink_try_pull_prerollFn c_gst_app_sink_try_pull_preroll; ///
private alias c_gst_app_sink_try_pull_sampleFn = extern(C) GstSample* function(GstAppSink* appsink, GstClockTime timeout) nothrow;
__gshared c_gst_app_sink_try_pull_sampleFn c_gst_app_sink_try_pull_sample; ///

// AppSinkSimpleCallbacks
private alias c_gst_app_sink_simple_callbacks_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_app_sink_simple_callbacks_get_typeFn c_gst_app_sink_simple_callbacks_get_type; ///
private alias c_gst_app_sink_simple_callbacks_newFn = extern(C) GstAppSinkSimpleCallbacks* function() nothrow;
__gshared c_gst_app_sink_simple_callbacks_newFn c_gst_app_sink_simple_callbacks_new; ///
private alias c_gst_app_sink_simple_callbacks_refFn = extern(C) GstAppSinkSimpleCallbacks* function(GstAppSinkSimpleCallbacks* cb) nothrow;
__gshared c_gst_app_sink_simple_callbacks_refFn c_gst_app_sink_simple_callbacks_ref; ///
private alias c_gst_app_sink_simple_callbacks_set_eosFn = extern(C) void function(GstAppSinkSimpleCallbacks* cb, GstAppSinkEosCallback eosCb, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_app_sink_simple_callbacks_set_eosFn c_gst_app_sink_simple_callbacks_set_eos; ///
private alias c_gst_app_sink_simple_callbacks_set_new_eventFn = extern(C) void function(GstAppSinkSimpleCallbacks* cb, GstAppSinkNewEventCallback newEventCb, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_app_sink_simple_callbacks_set_new_eventFn c_gst_app_sink_simple_callbacks_set_new_event; ///
private alias c_gst_app_sink_simple_callbacks_set_new_prerollFn = extern(C) void function(GstAppSinkSimpleCallbacks* cb, GstAppSinkNewPrerollCallback newPrerollCb, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_app_sink_simple_callbacks_set_new_prerollFn c_gst_app_sink_simple_callbacks_set_new_preroll; ///
private alias c_gst_app_sink_simple_callbacks_set_new_sampleFn = extern(C) void function(GstAppSinkSimpleCallbacks* cb, GstAppSinkNewSampleCallback newSampleCb, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_app_sink_simple_callbacks_set_new_sampleFn c_gst_app_sink_simple_callbacks_set_new_sample; ///
private alias c_gst_app_sink_simple_callbacks_set_propose_allocationFn = extern(C) void function(GstAppSinkSimpleCallbacks* cb, GstAppSinkProposeAllocationCallback proposeAllocationCb, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_app_sink_simple_callbacks_set_propose_allocationFn c_gst_app_sink_simple_callbacks_set_propose_allocation; ///
private alias c_gst_app_sink_simple_callbacks_unrefFn = extern(C) void function(GstAppSinkSimpleCallbacks* cb) nothrow;
__gshared c_gst_app_sink_simple_callbacks_unrefFn c_gst_app_sink_simple_callbacks_unref; ///

// AppSrc
private alias c_gst_app_src_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_app_src_get_typeFn c_gst_app_src_get_type; ///
private alias c_gst_app_src_end_of_streamFn = extern(C) GstFlowReturn function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_end_of_streamFn c_gst_app_src_end_of_stream; ///
private alias c_gst_app_src_get_capsFn = extern(C) GstCaps* function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_capsFn c_gst_app_src_get_caps; ///
private alias c_gst_app_src_get_current_level_buffersFn = extern(C) ulong function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_current_level_buffersFn c_gst_app_src_get_current_level_buffers; ///
private alias c_gst_app_src_get_current_level_bytesFn = extern(C) ulong function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_current_level_bytesFn c_gst_app_src_get_current_level_bytes; ///
private alias c_gst_app_src_get_current_level_timeFn = extern(C) GstClockTime function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_current_level_timeFn c_gst_app_src_get_current_level_time; ///
private alias c_gst_app_src_get_durationFn = extern(C) GstClockTime function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_durationFn c_gst_app_src_get_duration; ///
private alias c_gst_app_src_get_emit_signalsFn = extern(C) gboolean function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_emit_signalsFn c_gst_app_src_get_emit_signals; ///
private alias c_gst_app_src_get_latencyFn = extern(C) void function(GstAppSrc* appsrc, ulong* min, ulong* max) nothrow;
__gshared c_gst_app_src_get_latencyFn c_gst_app_src_get_latency; ///
private alias c_gst_app_src_get_leaky_typeFn = extern(C) GstAppLeakyType function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_leaky_typeFn c_gst_app_src_get_leaky_type; ///
private alias c_gst_app_src_get_max_buffersFn = extern(C) ulong function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_max_buffersFn c_gst_app_src_get_max_buffers; ///
private alias c_gst_app_src_get_max_bytesFn = extern(C) ulong function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_max_bytesFn c_gst_app_src_get_max_bytes; ///
private alias c_gst_app_src_get_max_timeFn = extern(C) GstClockTime function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_max_timeFn c_gst_app_src_get_max_time; ///
private alias c_gst_app_src_get_sizeFn = extern(C) long function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_sizeFn c_gst_app_src_get_size; ///
private alias c_gst_app_src_get_stream_typeFn = extern(C) GstAppStreamType function(GstAppSrc* appsrc) nothrow;
__gshared c_gst_app_src_get_stream_typeFn c_gst_app_src_get_stream_type; ///
private alias c_gst_app_src_push_bufferFn = extern(C) GstFlowReturn function(GstAppSrc* appsrc, GstBuffer* buffer) nothrow;
__gshared c_gst_app_src_push_bufferFn c_gst_app_src_push_buffer; ///
private alias c_gst_app_src_push_buffer_listFn = extern(C) GstFlowReturn function(GstAppSrc* appsrc, GstBufferList* bufferList) nothrow;
__gshared c_gst_app_src_push_buffer_listFn c_gst_app_src_push_buffer_list; ///
private alias c_gst_app_src_push_sampleFn = extern(C) GstFlowReturn function(GstAppSrc* appsrc, GstSample* sample) nothrow;
__gshared c_gst_app_src_push_sampleFn c_gst_app_src_push_sample; ///
private alias c_gst_app_src_set_callbacksFn = extern(C) void function(GstAppSrc* appsrc, GstAppSrcCallbacks* callbacks, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_app_src_set_callbacksFn c_gst_app_src_set_callbacks; ///
private alias c_gst_app_src_set_capsFn = extern(C) void function(GstAppSrc* appsrc, const(GstCaps)* caps) nothrow;
__gshared c_gst_app_src_set_capsFn c_gst_app_src_set_caps; ///
private alias c_gst_app_src_set_durationFn = extern(C) void function(GstAppSrc* appsrc, GstClockTime duration) nothrow;
__gshared c_gst_app_src_set_durationFn c_gst_app_src_set_duration; ///
private alias c_gst_app_src_set_emit_signalsFn = extern(C) void function(GstAppSrc* appsrc, gboolean emit) nothrow;
__gshared c_gst_app_src_set_emit_signalsFn c_gst_app_src_set_emit_signals; ///
private alias c_gst_app_src_set_latencyFn = extern(C) void function(GstAppSrc* appsrc, ulong min, ulong max) nothrow;
__gshared c_gst_app_src_set_latencyFn c_gst_app_src_set_latency; ///
private alias c_gst_app_src_set_leaky_typeFn = extern(C) void function(GstAppSrc* appsrc, GstAppLeakyType leaky) nothrow;
__gshared c_gst_app_src_set_leaky_typeFn c_gst_app_src_set_leaky_type; ///
private alias c_gst_app_src_set_max_buffersFn = extern(C) void function(GstAppSrc* appsrc, ulong max) nothrow;
__gshared c_gst_app_src_set_max_buffersFn c_gst_app_src_set_max_buffers; ///
private alias c_gst_app_src_set_max_bytesFn = extern(C) void function(GstAppSrc* appsrc, ulong max) nothrow;
__gshared c_gst_app_src_set_max_bytesFn c_gst_app_src_set_max_bytes; ///
private alias c_gst_app_src_set_max_timeFn = extern(C) void function(GstAppSrc* appsrc, GstClockTime max) nothrow;
__gshared c_gst_app_src_set_max_timeFn c_gst_app_src_set_max_time; ///
private alias c_gst_app_src_set_simple_callbacksFn = extern(C) void function(GstAppSrc* appsrc, GstAppSrcSimpleCallbacks* cb) nothrow;
__gshared c_gst_app_src_set_simple_callbacksFn c_gst_app_src_set_simple_callbacks; ///
private alias c_gst_app_src_set_sizeFn = extern(C) void function(GstAppSrc* appsrc, long size) nothrow;
__gshared c_gst_app_src_set_sizeFn c_gst_app_src_set_size; ///
private alias c_gst_app_src_set_stream_typeFn = extern(C) void function(GstAppSrc* appsrc, GstAppStreamType type) nothrow;
__gshared c_gst_app_src_set_stream_typeFn c_gst_app_src_set_stream_type; ///

// AppSrcSimpleCallbacks
private alias c_gst_app_src_simple_callbacks_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_app_src_simple_callbacks_get_typeFn c_gst_app_src_simple_callbacks_get_type; ///
private alias c_gst_app_src_simple_callbacks_newFn = extern(C) GstAppSrcSimpleCallbacks* function() nothrow;
__gshared c_gst_app_src_simple_callbacks_newFn c_gst_app_src_simple_callbacks_new; ///
private alias c_gst_app_src_simple_callbacks_refFn = extern(C) GstAppSrcSimpleCallbacks* function(GstAppSrcSimpleCallbacks* cb) nothrow;
__gshared c_gst_app_src_simple_callbacks_refFn c_gst_app_src_simple_callbacks_ref; ///
private alias c_gst_app_src_simple_callbacks_set_enough_dataFn = extern(C) void function(GstAppSrcSimpleCallbacks* cb, GstAppSrcEnoughDataCallback enoughDataCb, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_app_src_simple_callbacks_set_enough_dataFn c_gst_app_src_simple_callbacks_set_enough_data; ///
private alias c_gst_app_src_simple_callbacks_set_need_dataFn = extern(C) void function(GstAppSrcSimpleCallbacks* cb, GstAppSrcNeedDataCallback needDataCb, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_app_src_simple_callbacks_set_need_dataFn c_gst_app_src_simple_callbacks_set_need_data; ///
private alias c_gst_app_src_simple_callbacks_set_seek_dataFn = extern(C) void function(GstAppSrcSimpleCallbacks* cb, GstAppSrcSeekDataCallback seekDataCb, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_app_src_simple_callbacks_set_seek_dataFn c_gst_app_src_simple_callbacks_set_seek_data; ///
private alias c_gst_app_src_simple_callbacks_unrefFn = extern(C) void function(GstAppSrcSimpleCallbacks* cb) nothrow;
__gshared c_gst_app_src_simple_callbacks_unrefFn c_gst_app_src_simple_callbacks_unref; ///

// AppSink

/** */
alias gst_app_sink_get_type = c_gst_app_sink_get_type;

/** */
alias gst_app_sink_get_buffer_list_support = c_gst_app_sink_get_buffer_list_support;

/** */
alias gst_app_sink_get_caps = c_gst_app_sink_get_caps;

/** */
alias gst_app_sink_get_current_level_buffers = c_gst_app_sink_get_current_level_buffers;

/** */
alias gst_app_sink_get_current_level_bytes = c_gst_app_sink_get_current_level_bytes;

/** */
alias gst_app_sink_get_current_level_time = c_gst_app_sink_get_current_level_time;

/** */
alias gst_app_sink_get_drop = c_gst_app_sink_get_drop;

/** */
alias gst_app_sink_get_emit_signals = c_gst_app_sink_get_emit_signals;

/** */
alias gst_app_sink_get_leaky_type = c_gst_app_sink_get_leaky_type;

/** */
alias gst_app_sink_get_max_buffers = c_gst_app_sink_get_max_buffers;

/** */
alias gst_app_sink_get_max_bytes = c_gst_app_sink_get_max_bytes;

/** */
alias gst_app_sink_get_max_time = c_gst_app_sink_get_max_time;

/** */
alias gst_app_sink_get_wait_on_eos = c_gst_app_sink_get_wait_on_eos;

/** */
alias gst_app_sink_is_eos = c_gst_app_sink_is_eos;

/** */
alias gst_app_sink_pull_object = c_gst_app_sink_pull_object;

/** */
alias gst_app_sink_pull_preroll = c_gst_app_sink_pull_preroll;

/** */
alias gst_app_sink_pull_sample = c_gst_app_sink_pull_sample;

/** */
alias gst_app_sink_set_buffer_list_support = c_gst_app_sink_set_buffer_list_support;

/** */
alias gst_app_sink_set_callbacks = c_gst_app_sink_set_callbacks;

/** */
alias gst_app_sink_set_caps = c_gst_app_sink_set_caps;

/** */
alias gst_app_sink_set_drop = c_gst_app_sink_set_drop;

/** */
alias gst_app_sink_set_emit_signals = c_gst_app_sink_set_emit_signals;

/** */
alias gst_app_sink_set_leaky_type = c_gst_app_sink_set_leaky_type;

/** */
alias gst_app_sink_set_max_buffers = c_gst_app_sink_set_max_buffers;

/** */
alias gst_app_sink_set_max_bytes = c_gst_app_sink_set_max_bytes;

/** */
alias gst_app_sink_set_max_time = c_gst_app_sink_set_max_time;

/** */
alias gst_app_sink_set_simple_callbacks = c_gst_app_sink_set_simple_callbacks;

/** */
alias gst_app_sink_set_wait_on_eos = c_gst_app_sink_set_wait_on_eos;

/** */
alias gst_app_sink_try_pull_object = c_gst_app_sink_try_pull_object;

/** */
alias gst_app_sink_try_pull_preroll = c_gst_app_sink_try_pull_preroll;

/** */
alias gst_app_sink_try_pull_sample = c_gst_app_sink_try_pull_sample;

// AppSinkSimpleCallbacks

/** */
alias gst_app_sink_simple_callbacks_get_type = c_gst_app_sink_simple_callbacks_get_type;

/** */
alias gst_app_sink_simple_callbacks_new = c_gst_app_sink_simple_callbacks_new;

/** */
alias gst_app_sink_simple_callbacks_ref = c_gst_app_sink_simple_callbacks_ref;

/** */
alias gst_app_sink_simple_callbacks_set_eos = c_gst_app_sink_simple_callbacks_set_eos;

/** */
alias gst_app_sink_simple_callbacks_set_new_event = c_gst_app_sink_simple_callbacks_set_new_event;

/** */
alias gst_app_sink_simple_callbacks_set_new_preroll = c_gst_app_sink_simple_callbacks_set_new_preroll;

/** */
alias gst_app_sink_simple_callbacks_set_new_sample = c_gst_app_sink_simple_callbacks_set_new_sample;

/** */
alias gst_app_sink_simple_callbacks_set_propose_allocation = c_gst_app_sink_simple_callbacks_set_propose_allocation;

/** */
alias gst_app_sink_simple_callbacks_unref = c_gst_app_sink_simple_callbacks_unref;

// AppSrc

/** */
alias gst_app_src_get_type = c_gst_app_src_get_type;

/** */
alias gst_app_src_end_of_stream = c_gst_app_src_end_of_stream;

/** */
alias gst_app_src_get_caps = c_gst_app_src_get_caps;

/** */
alias gst_app_src_get_current_level_buffers = c_gst_app_src_get_current_level_buffers;

/** */
alias gst_app_src_get_current_level_bytes = c_gst_app_src_get_current_level_bytes;

/** */
alias gst_app_src_get_current_level_time = c_gst_app_src_get_current_level_time;

/** */
alias gst_app_src_get_duration = c_gst_app_src_get_duration;

/** */
alias gst_app_src_get_emit_signals = c_gst_app_src_get_emit_signals;

/** */
alias gst_app_src_get_latency = c_gst_app_src_get_latency;

/** */
alias gst_app_src_get_leaky_type = c_gst_app_src_get_leaky_type;

/** */
alias gst_app_src_get_max_buffers = c_gst_app_src_get_max_buffers;

/** */
alias gst_app_src_get_max_bytes = c_gst_app_src_get_max_bytes;

/** */
alias gst_app_src_get_max_time = c_gst_app_src_get_max_time;

/** */
alias gst_app_src_get_size = c_gst_app_src_get_size;

/** */
alias gst_app_src_get_stream_type = c_gst_app_src_get_stream_type;

/** */
alias gst_app_src_push_buffer = c_gst_app_src_push_buffer;

/** */
alias gst_app_src_push_buffer_list = c_gst_app_src_push_buffer_list;

/** */
alias gst_app_src_push_sample = c_gst_app_src_push_sample;

/** */
alias gst_app_src_set_callbacks = c_gst_app_src_set_callbacks;

/** */
alias gst_app_src_set_caps = c_gst_app_src_set_caps;

/** */
alias gst_app_src_set_duration = c_gst_app_src_set_duration;

/** */
alias gst_app_src_set_emit_signals = c_gst_app_src_set_emit_signals;

/** */
alias gst_app_src_set_latency = c_gst_app_src_set_latency;

/** */
alias gst_app_src_set_leaky_type = c_gst_app_src_set_leaky_type;

/** */
alias gst_app_src_set_max_buffers = c_gst_app_src_set_max_buffers;

/** */
alias gst_app_src_set_max_bytes = c_gst_app_src_set_max_bytes;

/** */
alias gst_app_src_set_max_time = c_gst_app_src_set_max_time;

/** */
alias gst_app_src_set_simple_callbacks = c_gst_app_src_set_simple_callbacks;

/** */
alias gst_app_src_set_size = c_gst_app_src_set_size;

/** */
alias gst_app_src_set_stream_type = c_gst_app_src_set_stream_type;

// AppSrcSimpleCallbacks

/** */
alias gst_app_src_simple_callbacks_get_type = c_gst_app_src_simple_callbacks_get_type;

/** */
alias gst_app_src_simple_callbacks_new = c_gst_app_src_simple_callbacks_new;

/** */
alias gst_app_src_simple_callbacks_ref = c_gst_app_src_simple_callbacks_ref;

/** */
alias gst_app_src_simple_callbacks_set_enough_data = c_gst_app_src_simple_callbacks_set_enough_data;

/** */
alias gst_app_src_simple_callbacks_set_need_data = c_gst_app_src_simple_callbacks_set_need_data;

/** */
alias gst_app_src_simple_callbacks_set_seek_data = c_gst_app_src_simple_callbacks_set_seek_data;

/** */
alias gst_app_src_simple_callbacks_unref = c_gst_app_src_simple_callbacks_unref;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gstapp1", "GstApp");

  // AppSink
  gidLink(cast(void**)&gst_app_sink_get_type, "gst_app_sink_get_type", libs);
  gidLink(cast(void**)&gst_app_sink_get_buffer_list_support, "gst_app_sink_get_buffer_list_support", libs);
  gidLink(cast(void**)&gst_app_sink_get_caps, "gst_app_sink_get_caps", libs);
  gidLink(cast(void**)&gst_app_sink_get_current_level_buffers, "gst_app_sink_get_current_level_buffers", libs);
  gidLink(cast(void**)&gst_app_sink_get_current_level_bytes, "gst_app_sink_get_current_level_bytes", libs);
  gidLink(cast(void**)&gst_app_sink_get_current_level_time, "gst_app_sink_get_current_level_time", libs);
  gidLink(cast(void**)&gst_app_sink_get_drop, "gst_app_sink_get_drop", libs);
  gidLink(cast(void**)&gst_app_sink_get_emit_signals, "gst_app_sink_get_emit_signals", libs);
  gidLink(cast(void**)&gst_app_sink_get_leaky_type, "gst_app_sink_get_leaky_type", libs);
  gidLink(cast(void**)&gst_app_sink_get_max_buffers, "gst_app_sink_get_max_buffers", libs);
  gidLink(cast(void**)&gst_app_sink_get_max_bytes, "gst_app_sink_get_max_bytes", libs);
  gidLink(cast(void**)&gst_app_sink_get_max_time, "gst_app_sink_get_max_time", libs);
  gidLink(cast(void**)&gst_app_sink_get_wait_on_eos, "gst_app_sink_get_wait_on_eos", libs);
  gidLink(cast(void**)&gst_app_sink_is_eos, "gst_app_sink_is_eos", libs);
  gidLink(cast(void**)&gst_app_sink_pull_object, "gst_app_sink_pull_object", libs);
  gidLink(cast(void**)&gst_app_sink_pull_preroll, "gst_app_sink_pull_preroll", libs);
  gidLink(cast(void**)&gst_app_sink_pull_sample, "gst_app_sink_pull_sample", libs);
  gidLink(cast(void**)&gst_app_sink_set_buffer_list_support, "gst_app_sink_set_buffer_list_support", libs);
  gidLink(cast(void**)&gst_app_sink_set_callbacks, "gst_app_sink_set_callbacks", libs);
  gidLink(cast(void**)&gst_app_sink_set_caps, "gst_app_sink_set_caps", libs);
  gidLink(cast(void**)&gst_app_sink_set_drop, "gst_app_sink_set_drop", libs);
  gidLink(cast(void**)&gst_app_sink_set_emit_signals, "gst_app_sink_set_emit_signals", libs);
  gidLink(cast(void**)&gst_app_sink_set_leaky_type, "gst_app_sink_set_leaky_type", libs);
  gidLink(cast(void**)&gst_app_sink_set_max_buffers, "gst_app_sink_set_max_buffers", libs);
  gidLink(cast(void**)&gst_app_sink_set_max_bytes, "gst_app_sink_set_max_bytes", libs);
  gidLink(cast(void**)&gst_app_sink_set_max_time, "gst_app_sink_set_max_time", libs);
  gidLink(cast(void**)&gst_app_sink_set_simple_callbacks, "gst_app_sink_set_simple_callbacks", libs);
  gidLink(cast(void**)&gst_app_sink_set_wait_on_eos, "gst_app_sink_set_wait_on_eos", libs);
  gidLink(cast(void**)&gst_app_sink_try_pull_object, "gst_app_sink_try_pull_object", libs);
  gidLink(cast(void**)&gst_app_sink_try_pull_preroll, "gst_app_sink_try_pull_preroll", libs);
  gidLink(cast(void**)&gst_app_sink_try_pull_sample, "gst_app_sink_try_pull_sample", libs);

  // AppSinkSimpleCallbacks
  gidLink(cast(void**)&gst_app_sink_simple_callbacks_get_type, "gst_app_sink_simple_callbacks_get_type", libs);
  gidLink(cast(void**)&gst_app_sink_simple_callbacks_new, "gst_app_sink_simple_callbacks_new", libs);
  gidLink(cast(void**)&gst_app_sink_simple_callbacks_ref, "gst_app_sink_simple_callbacks_ref", libs);
  gidLink(cast(void**)&gst_app_sink_simple_callbacks_set_eos, "gst_app_sink_simple_callbacks_set_eos", libs);
  gidLink(cast(void**)&gst_app_sink_simple_callbacks_set_new_event, "gst_app_sink_simple_callbacks_set_new_event", libs);
  gidLink(cast(void**)&gst_app_sink_simple_callbacks_set_new_preroll, "gst_app_sink_simple_callbacks_set_new_preroll", libs);
  gidLink(cast(void**)&gst_app_sink_simple_callbacks_set_new_sample, "gst_app_sink_simple_callbacks_set_new_sample", libs);
  gidLink(cast(void**)&gst_app_sink_simple_callbacks_set_propose_allocation, "gst_app_sink_simple_callbacks_set_propose_allocation", libs);
  gidLink(cast(void**)&gst_app_sink_simple_callbacks_unref, "gst_app_sink_simple_callbacks_unref", libs);

  // AppSrc
  gidLink(cast(void**)&gst_app_src_get_type, "gst_app_src_get_type", libs);
  gidLink(cast(void**)&gst_app_src_end_of_stream, "gst_app_src_end_of_stream", libs);
  gidLink(cast(void**)&gst_app_src_get_caps, "gst_app_src_get_caps", libs);
  gidLink(cast(void**)&gst_app_src_get_current_level_buffers, "gst_app_src_get_current_level_buffers", libs);
  gidLink(cast(void**)&gst_app_src_get_current_level_bytes, "gst_app_src_get_current_level_bytes", libs);
  gidLink(cast(void**)&gst_app_src_get_current_level_time, "gst_app_src_get_current_level_time", libs);
  gidLink(cast(void**)&gst_app_src_get_duration, "gst_app_src_get_duration", libs);
  gidLink(cast(void**)&gst_app_src_get_emit_signals, "gst_app_src_get_emit_signals", libs);
  gidLink(cast(void**)&gst_app_src_get_latency, "gst_app_src_get_latency", libs);
  gidLink(cast(void**)&gst_app_src_get_leaky_type, "gst_app_src_get_leaky_type", libs);
  gidLink(cast(void**)&gst_app_src_get_max_buffers, "gst_app_src_get_max_buffers", libs);
  gidLink(cast(void**)&gst_app_src_get_max_bytes, "gst_app_src_get_max_bytes", libs);
  gidLink(cast(void**)&gst_app_src_get_max_time, "gst_app_src_get_max_time", libs);
  gidLink(cast(void**)&gst_app_src_get_size, "gst_app_src_get_size", libs);
  gidLink(cast(void**)&gst_app_src_get_stream_type, "gst_app_src_get_stream_type", libs);
  gidLink(cast(void**)&gst_app_src_push_buffer, "gst_app_src_push_buffer", libs);
  gidLink(cast(void**)&gst_app_src_push_buffer_list, "gst_app_src_push_buffer_list", libs);
  gidLink(cast(void**)&gst_app_src_push_sample, "gst_app_src_push_sample", libs);
  gidLink(cast(void**)&gst_app_src_set_callbacks, "gst_app_src_set_callbacks", libs);
  gidLink(cast(void**)&gst_app_src_set_caps, "gst_app_src_set_caps", libs);
  gidLink(cast(void**)&gst_app_src_set_duration, "gst_app_src_set_duration", libs);
  gidLink(cast(void**)&gst_app_src_set_emit_signals, "gst_app_src_set_emit_signals", libs);
  gidLink(cast(void**)&gst_app_src_set_latency, "gst_app_src_set_latency", libs);
  gidLink(cast(void**)&gst_app_src_set_leaky_type, "gst_app_src_set_leaky_type", libs);
  gidLink(cast(void**)&gst_app_src_set_max_buffers, "gst_app_src_set_max_buffers", libs);
  gidLink(cast(void**)&gst_app_src_set_max_bytes, "gst_app_src_set_max_bytes", libs);
  gidLink(cast(void**)&gst_app_src_set_max_time, "gst_app_src_set_max_time", libs);
  gidLink(cast(void**)&gst_app_src_set_simple_callbacks, "gst_app_src_set_simple_callbacks", libs);
  gidLink(cast(void**)&gst_app_src_set_size, "gst_app_src_set_size", libs);
  gidLink(cast(void**)&gst_app_src_set_stream_type, "gst_app_src_set_stream_type", libs);

  // AppSrcSimpleCallbacks
  gidLink(cast(void**)&gst_app_src_simple_callbacks_get_type, "gst_app_src_simple_callbacks_get_type", libs);
  gidLink(cast(void**)&gst_app_src_simple_callbacks_new, "gst_app_src_simple_callbacks_new", libs);
  gidLink(cast(void**)&gst_app_src_simple_callbacks_ref, "gst_app_src_simple_callbacks_ref", libs);
  gidLink(cast(void**)&gst_app_src_simple_callbacks_set_enough_data, "gst_app_src_simple_callbacks_set_enough_data", libs);
  gidLink(cast(void**)&gst_app_src_simple_callbacks_set_need_data, "gst_app_src_simple_callbacks_set_need_data", libs);
  gidLink(cast(void**)&gst_app_src_simple_callbacks_set_seek_data, "gst_app_src_simple_callbacks_set_seek_data", libs);
  gidLink(cast(void**)&gst_app_src_simple_callbacks_unref, "gst_app_src_simple_callbacks_unref", libs);
}
