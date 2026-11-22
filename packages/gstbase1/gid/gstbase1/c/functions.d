/// C functions for gstbase1 library
module gid.gstbase1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstbase1.c.types;
public import gid.glib2.c.types;
public import gid.gmodule2.c.types;
public import gid.gobject2.c.types;
public import gid.gst1.c.types;

private immutable LIBS = ["gstbase-1.0_0"];

// Adapter
private alias c_gst_adapter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_adapter_get_typeFn c_gst_adapter_get_type; ///
private alias c_gst_adapter_newFn = extern(C) GstAdapter* function() nothrow;
__gshared c_gst_adapter_newFn c_gst_adapter_new; ///
private alias c_gst_adapter_availableFn = extern(C) size_t function(GstAdapter* adapter) nothrow;
__gshared c_gst_adapter_availableFn c_gst_adapter_available; ///
private alias c_gst_adapter_available_fastFn = extern(C) size_t function(GstAdapter* adapter) nothrow;
__gshared c_gst_adapter_available_fastFn c_gst_adapter_available_fast; ///
private alias c_gst_adapter_clearFn = extern(C) void function(GstAdapter* adapter) nothrow;
__gshared c_gst_adapter_clearFn c_gst_adapter_clear; ///
private alias c_gst_adapter_copyFn = extern(C) void function(GstAdapter* adapter, void* dest, size_t offset, size_t size) nothrow;
__gshared c_gst_adapter_copyFn c_gst_adapter_copy; ///
private alias c_gst_adapter_copy_bytesFn = extern(C) GBytes* function(GstAdapter* adapter, size_t offset, size_t size) nothrow;
__gshared c_gst_adapter_copy_bytesFn c_gst_adapter_copy_bytes; ///
private alias c_gst_adapter_distance_from_discontFn = extern(C) ulong function(GstAdapter* adapter) nothrow;
__gshared c_gst_adapter_distance_from_discontFn c_gst_adapter_distance_from_discont; ///
private alias c_gst_adapter_dts_at_discontFn = extern(C) GstClockTime function(GstAdapter* adapter) nothrow;
__gshared c_gst_adapter_dts_at_discontFn c_gst_adapter_dts_at_discont; ///
private alias c_gst_adapter_flushFn = extern(C) void function(GstAdapter* adapter, size_t flush) nothrow;
__gshared c_gst_adapter_flushFn c_gst_adapter_flush; ///
private alias c_gst_adapter_get_bufferFn = extern(C) GstBuffer* function(GstAdapter* adapter, size_t nbytes) nothrow;
__gshared c_gst_adapter_get_bufferFn c_gst_adapter_get_buffer; ///
private alias c_gst_adapter_get_buffer_fastFn = extern(C) GstBuffer* function(GstAdapter* adapter, size_t nbytes) nothrow;
__gshared c_gst_adapter_get_buffer_fastFn c_gst_adapter_get_buffer_fast; ///
private alias c_gst_adapter_get_buffer_listFn = extern(C) GstBufferList* function(GstAdapter* adapter, size_t nbytes) nothrow;
__gshared c_gst_adapter_get_buffer_listFn c_gst_adapter_get_buffer_list; ///
private alias c_gst_adapter_get_listFn = extern(C) GList* function(GstAdapter* adapter, size_t nbytes) nothrow;
__gshared c_gst_adapter_get_listFn c_gst_adapter_get_list; ///
private alias c_gst_adapter_mapFn = extern(C) const(void)* function(GstAdapter* adapter, size_t size) nothrow;
__gshared c_gst_adapter_mapFn c_gst_adapter_map; ///
private alias c_gst_adapter_masked_scan_uint32Fn = extern(C) ptrdiff_t function(GstAdapter* adapter, uint mask, uint pattern, size_t offset, size_t size) nothrow;
__gshared c_gst_adapter_masked_scan_uint32Fn c_gst_adapter_masked_scan_uint32; ///
private alias c_gst_adapter_masked_scan_uint32_peekFn = extern(C) ptrdiff_t function(GstAdapter* adapter, uint mask, uint pattern, size_t offset, size_t size, uint* value) nothrow;
__gshared c_gst_adapter_masked_scan_uint32_peekFn c_gst_adapter_masked_scan_uint32_peek; ///
private alias c_gst_adapter_offset_at_discontFn = extern(C) ulong function(GstAdapter* adapter) nothrow;
__gshared c_gst_adapter_offset_at_discontFn c_gst_adapter_offset_at_discont; ///
private alias c_gst_adapter_prev_dtsFn = extern(C) GstClockTime function(GstAdapter* adapter, ulong* distance) nothrow;
__gshared c_gst_adapter_prev_dtsFn c_gst_adapter_prev_dts; ///
private alias c_gst_adapter_prev_dts_at_offsetFn = extern(C) GstClockTime function(GstAdapter* adapter, size_t offset, ulong* distance) nothrow;
__gshared c_gst_adapter_prev_dts_at_offsetFn c_gst_adapter_prev_dts_at_offset; ///
private alias c_gst_adapter_prev_offsetFn = extern(C) ulong function(GstAdapter* adapter, ulong* distance) nothrow;
__gshared c_gst_adapter_prev_offsetFn c_gst_adapter_prev_offset; ///
private alias c_gst_adapter_prev_ptsFn = extern(C) GstClockTime function(GstAdapter* adapter, ulong* distance) nothrow;
__gshared c_gst_adapter_prev_ptsFn c_gst_adapter_prev_pts; ///
private alias c_gst_adapter_prev_pts_at_offsetFn = extern(C) GstClockTime function(GstAdapter* adapter, size_t offset, ulong* distance) nothrow;
__gshared c_gst_adapter_prev_pts_at_offsetFn c_gst_adapter_prev_pts_at_offset; ///
private alias c_gst_adapter_pts_at_discontFn = extern(C) GstClockTime function(GstAdapter* adapter) nothrow;
__gshared c_gst_adapter_pts_at_discontFn c_gst_adapter_pts_at_discont; ///
private alias c_gst_adapter_pushFn = extern(C) void function(GstAdapter* adapter, GstBuffer* buf) nothrow;
__gshared c_gst_adapter_pushFn c_gst_adapter_push; ///
private alias c_gst_adapter_takeFn = extern(C) void* function(GstAdapter* adapter, size_t nbytes) nothrow;
__gshared c_gst_adapter_takeFn c_gst_adapter_take; ///
private alias c_gst_adapter_take_bufferFn = extern(C) GstBuffer* function(GstAdapter* adapter, size_t nbytes) nothrow;
__gshared c_gst_adapter_take_bufferFn c_gst_adapter_take_buffer; ///
private alias c_gst_adapter_take_buffer_fastFn = extern(C) GstBuffer* function(GstAdapter* adapter, size_t nbytes) nothrow;
__gshared c_gst_adapter_take_buffer_fastFn c_gst_adapter_take_buffer_fast; ///
private alias c_gst_adapter_take_buffer_listFn = extern(C) GstBufferList* function(GstAdapter* adapter, size_t nbytes) nothrow;
__gshared c_gst_adapter_take_buffer_listFn c_gst_adapter_take_buffer_list; ///
private alias c_gst_adapter_take_listFn = extern(C) GList* function(GstAdapter* adapter, size_t nbytes) nothrow;
__gshared c_gst_adapter_take_listFn c_gst_adapter_take_list; ///
private alias c_gst_adapter_unmapFn = extern(C) void function(GstAdapter* adapter) nothrow;
__gshared c_gst_adapter_unmapFn c_gst_adapter_unmap; ///

// Aggregator
private alias c_gst_aggregator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_aggregator_get_typeFn c_gst_aggregator_get_type; ///
private alias c_gst_aggregator_finish_bufferFn = extern(C) GstFlowReturn function(GstAggregator* aggregator, GstBuffer* buffer) nothrow;
__gshared c_gst_aggregator_finish_bufferFn c_gst_aggregator_finish_buffer; ///
private alias c_gst_aggregator_finish_buffer_listFn = extern(C) GstFlowReturn function(GstAggregator* aggregator, GstBufferList* bufferlist) nothrow;
__gshared c_gst_aggregator_finish_buffer_listFn c_gst_aggregator_finish_buffer_list; ///
private alias c_gst_aggregator_get_allocatorFn = extern(C) void function(GstAggregator* self, GstAllocator** allocator, GstAllocationParams* params) nothrow;
__gshared c_gst_aggregator_get_allocatorFn c_gst_aggregator_get_allocator; ///
private alias c_gst_aggregator_get_buffer_poolFn = extern(C) GstBufferPool* function(GstAggregator* self) nothrow;
__gshared c_gst_aggregator_get_buffer_poolFn c_gst_aggregator_get_buffer_pool; ///
private alias c_gst_aggregator_get_force_liveFn = extern(C) gboolean function(GstAggregator* self) nothrow;
__gshared c_gst_aggregator_get_force_liveFn c_gst_aggregator_get_force_live; ///
private alias c_gst_aggregator_get_ignore_inactive_padsFn = extern(C) gboolean function(GstAggregator* self) nothrow;
__gshared c_gst_aggregator_get_ignore_inactive_padsFn c_gst_aggregator_get_ignore_inactive_pads; ///
private alias c_gst_aggregator_get_latencyFn = extern(C) GstClockTime function(GstAggregator* self) nothrow;
__gshared c_gst_aggregator_get_latencyFn c_gst_aggregator_get_latency; ///
private alias c_gst_aggregator_negotiateFn = extern(C) gboolean function(GstAggregator* self) nothrow;
__gshared c_gst_aggregator_negotiateFn c_gst_aggregator_negotiate; ///
private alias c_gst_aggregator_peek_next_sampleFn = extern(C) GstSample* function(GstAggregator* self, GstAggregatorPad* pad) nothrow;
__gshared c_gst_aggregator_peek_next_sampleFn c_gst_aggregator_peek_next_sample; ///
private alias c_gst_aggregator_push_src_eventFn = extern(C) gboolean function(GstAggregator* aggregator, GstEvent* event) nothrow;
__gshared c_gst_aggregator_push_src_eventFn c_gst_aggregator_push_src_event; ///
private alias c_gst_aggregator_selected_samplesFn = extern(C) void function(GstAggregator* self, GstClockTime pts, GstClockTime dts, GstClockTime duration, GstStructure* info) nothrow;
__gshared c_gst_aggregator_selected_samplesFn c_gst_aggregator_selected_samples; ///
private alias c_gst_aggregator_set_force_liveFn = extern(C) void function(GstAggregator* self, gboolean forceLive) nothrow;
__gshared c_gst_aggregator_set_force_liveFn c_gst_aggregator_set_force_live; ///
private alias c_gst_aggregator_set_ignore_inactive_padsFn = extern(C) void function(GstAggregator* self, gboolean ignore) nothrow;
__gshared c_gst_aggregator_set_ignore_inactive_padsFn c_gst_aggregator_set_ignore_inactive_pads; ///
private alias c_gst_aggregator_set_latencyFn = extern(C) void function(GstAggregator* self, GstClockTime minLatency, GstClockTime maxLatency) nothrow;
__gshared c_gst_aggregator_set_latencyFn c_gst_aggregator_set_latency; ///
private alias c_gst_aggregator_set_src_capsFn = extern(C) void function(GstAggregator* self, GstCaps* caps) nothrow;
__gshared c_gst_aggregator_set_src_capsFn c_gst_aggregator_set_src_caps; ///
private alias c_gst_aggregator_simple_get_next_timeFn = extern(C) GstClockTime function(GstAggregator* self) nothrow;
__gshared c_gst_aggregator_simple_get_next_timeFn c_gst_aggregator_simple_get_next_time; ///
private alias c_gst_aggregator_update_segmentFn = extern(C) void function(GstAggregator* self, const(GstSegment)* segment) nothrow;
__gshared c_gst_aggregator_update_segmentFn c_gst_aggregator_update_segment; ///

// AggregatorPad
private alias c_gst_aggregator_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_aggregator_pad_get_typeFn c_gst_aggregator_pad_get_type; ///
private alias c_gst_aggregator_pad_drop_bufferFn = extern(C) gboolean function(GstAggregatorPad* pad) nothrow;
__gshared c_gst_aggregator_pad_drop_bufferFn c_gst_aggregator_pad_drop_buffer; ///
private alias c_gst_aggregator_pad_has_bufferFn = extern(C) gboolean function(GstAggregatorPad* pad) nothrow;
__gshared c_gst_aggregator_pad_has_bufferFn c_gst_aggregator_pad_has_buffer; ///
private alias c_gst_aggregator_pad_is_eosFn = extern(C) gboolean function(GstAggregatorPad* pad) nothrow;
__gshared c_gst_aggregator_pad_is_eosFn c_gst_aggregator_pad_is_eos; ///
private alias c_gst_aggregator_pad_is_inactiveFn = extern(C) gboolean function(GstAggregatorPad* pad) nothrow;
__gshared c_gst_aggregator_pad_is_inactiveFn c_gst_aggregator_pad_is_inactive; ///
private alias c_gst_aggregator_pad_peek_bufferFn = extern(C) GstBuffer* function(GstAggregatorPad* pad) nothrow;
__gshared c_gst_aggregator_pad_peek_bufferFn c_gst_aggregator_pad_peek_buffer; ///
private alias c_gst_aggregator_pad_pop_bufferFn = extern(C) GstBuffer* function(GstAggregatorPad* pad) nothrow;
__gshared c_gst_aggregator_pad_pop_bufferFn c_gst_aggregator_pad_pop_buffer; ///

// BaseParse
private alias c_gst_base_parse_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_base_parse_get_typeFn c_gst_base_parse_get_type; ///
private alias c_gst_base_parse_add_index_entryFn = extern(C) gboolean function(GstBaseParse* parse, ulong offset, GstClockTime ts, gboolean key, gboolean force) nothrow;
__gshared c_gst_base_parse_add_index_entryFn c_gst_base_parse_add_index_entry; ///
private alias c_gst_base_parse_convert_defaultFn = extern(C) gboolean function(GstBaseParse* parse, GstFormat srcFormat, long srcValue, GstFormat destFormat, long* destValue) nothrow;
__gshared c_gst_base_parse_convert_defaultFn c_gst_base_parse_convert_default; ///
private alias c_gst_base_parse_drainFn = extern(C) void function(GstBaseParse* parse) nothrow;
__gshared c_gst_base_parse_drainFn c_gst_base_parse_drain; ///
private alias c_gst_base_parse_finish_frameFn = extern(C) GstFlowReturn function(GstBaseParse* parse, GstBaseParseFrame* frame, int size) nothrow;
__gshared c_gst_base_parse_finish_frameFn c_gst_base_parse_finish_frame; ///
private alias c_gst_base_parse_merge_tagsFn = extern(C) void function(GstBaseParse* parse, GstTagList* tags, GstTagMergeMode mode) nothrow;
__gshared c_gst_base_parse_merge_tagsFn c_gst_base_parse_merge_tags; ///
private alias c_gst_base_parse_push_frameFn = extern(C) GstFlowReturn function(GstBaseParse* parse, GstBaseParseFrame* frame) nothrow;
__gshared c_gst_base_parse_push_frameFn c_gst_base_parse_push_frame; ///
private alias c_gst_base_parse_set_average_bitrateFn = extern(C) void function(GstBaseParse* parse, uint bitrate) nothrow;
__gshared c_gst_base_parse_set_average_bitrateFn c_gst_base_parse_set_average_bitrate; ///
private alias c_gst_base_parse_set_durationFn = extern(C) void function(GstBaseParse* parse, GstFormat fmt, long duration, int interval) nothrow;
__gshared c_gst_base_parse_set_durationFn c_gst_base_parse_set_duration; ///
private alias c_gst_base_parse_set_frame_rateFn = extern(C) void function(GstBaseParse* parse, uint fpsNum, uint fpsDen, uint leadIn, uint leadOut) nothrow;
__gshared c_gst_base_parse_set_frame_rateFn c_gst_base_parse_set_frame_rate; ///
private alias c_gst_base_parse_set_has_timing_infoFn = extern(C) void function(GstBaseParse* parse, gboolean hasTiming) nothrow;
__gshared c_gst_base_parse_set_has_timing_infoFn c_gst_base_parse_set_has_timing_info; ///
private alias c_gst_base_parse_set_infer_tsFn = extern(C) void function(GstBaseParse* parse, gboolean inferTs) nothrow;
__gshared c_gst_base_parse_set_infer_tsFn c_gst_base_parse_set_infer_ts; ///
private alias c_gst_base_parse_set_latencyFn = extern(C) void function(GstBaseParse* parse, GstClockTime minLatency, GstClockTime maxLatency) nothrow;
__gshared c_gst_base_parse_set_latencyFn c_gst_base_parse_set_latency; ///
private alias c_gst_base_parse_set_min_frame_sizeFn = extern(C) void function(GstBaseParse* parse, uint minSize) nothrow;
__gshared c_gst_base_parse_set_min_frame_sizeFn c_gst_base_parse_set_min_frame_size; ///
private alias c_gst_base_parse_set_passthroughFn = extern(C) void function(GstBaseParse* parse, gboolean passthrough) nothrow;
__gshared c_gst_base_parse_set_passthroughFn c_gst_base_parse_set_passthrough; ///
private alias c_gst_base_parse_set_pts_interpolationFn = extern(C) void function(GstBaseParse* parse, gboolean ptsInterpolate) nothrow;
__gshared c_gst_base_parse_set_pts_interpolationFn c_gst_base_parse_set_pts_interpolation; ///
private alias c_gst_base_parse_set_syncableFn = extern(C) void function(GstBaseParse* parse, gboolean syncable) nothrow;
__gshared c_gst_base_parse_set_syncableFn c_gst_base_parse_set_syncable; ///
private alias c_gst_base_parse_set_ts_at_offsetFn = extern(C) void function(GstBaseParse* parse, size_t offset) nothrow;
__gshared c_gst_base_parse_set_ts_at_offsetFn c_gst_base_parse_set_ts_at_offset; ///

// BaseParseFrame
private alias c_gst_base_parse_frame_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_base_parse_frame_get_typeFn c_gst_base_parse_frame_get_type; ///
private alias c_gst_base_parse_frame_newFn = extern(C) GstBaseParseFrame* function(GstBuffer* buffer, GstBaseParseFrameFlags flags, int overhead) nothrow;
__gshared c_gst_base_parse_frame_newFn c_gst_base_parse_frame_new; ///
private alias c_gst_base_parse_frame_copyFn = extern(C) GstBaseParseFrame* function(GstBaseParseFrame* frame) nothrow;
__gshared c_gst_base_parse_frame_copyFn c_gst_base_parse_frame_copy; ///
private alias c_gst_base_parse_frame_freeFn = extern(C) void function(GstBaseParseFrame* frame) nothrow;
__gshared c_gst_base_parse_frame_freeFn c_gst_base_parse_frame_free; ///
private alias c_gst_base_parse_frame_initFn = extern(C) void function(GstBaseParseFrame* frame) nothrow;
__gshared c_gst_base_parse_frame_initFn c_gst_base_parse_frame_init; ///

// BaseSink
private alias c_gst_base_sink_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_base_sink_get_typeFn c_gst_base_sink_get_type; ///
private alias c_gst_base_sink_do_prerollFn = extern(C) GstFlowReturn function(GstBaseSink* sink, GstMiniObject* obj) nothrow;
__gshared c_gst_base_sink_do_prerollFn c_gst_base_sink_do_preroll; ///
private alias c_gst_base_sink_get_blocksizeFn = extern(C) uint function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_blocksizeFn c_gst_base_sink_get_blocksize; ///
private alias c_gst_base_sink_get_drop_out_of_segmentFn = extern(C) gboolean function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_drop_out_of_segmentFn c_gst_base_sink_get_drop_out_of_segment; ///
private alias c_gst_base_sink_get_last_sampleFn = extern(C) GstSample* function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_last_sampleFn c_gst_base_sink_get_last_sample; ///
private alias c_gst_base_sink_get_latencyFn = extern(C) GstClockTime function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_latencyFn c_gst_base_sink_get_latency; ///
private alias c_gst_base_sink_get_max_bitrateFn = extern(C) ulong function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_max_bitrateFn c_gst_base_sink_get_max_bitrate; ///
private alias c_gst_base_sink_get_max_latenessFn = extern(C) long function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_max_latenessFn c_gst_base_sink_get_max_lateness; ///
private alias c_gst_base_sink_get_processing_deadlineFn = extern(C) GstClockTime function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_processing_deadlineFn c_gst_base_sink_get_processing_deadline; ///
private alias c_gst_base_sink_get_render_delayFn = extern(C) GstClockTime function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_render_delayFn c_gst_base_sink_get_render_delay; ///
private alias c_gst_base_sink_get_statsFn = extern(C) GstStructure* function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_statsFn c_gst_base_sink_get_stats; ///
private alias c_gst_base_sink_get_syncFn = extern(C) gboolean function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_syncFn c_gst_base_sink_get_sync; ///
private alias c_gst_base_sink_get_throttle_timeFn = extern(C) ulong function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_throttle_timeFn c_gst_base_sink_get_throttle_time; ///
private alias c_gst_base_sink_get_ts_offsetFn = extern(C) GstClockTimeDiff function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_get_ts_offsetFn c_gst_base_sink_get_ts_offset; ///
private alias c_gst_base_sink_is_async_enabledFn = extern(C) gboolean function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_is_async_enabledFn c_gst_base_sink_is_async_enabled; ///
private alias c_gst_base_sink_is_last_sample_enabledFn = extern(C) gboolean function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_is_last_sample_enabledFn c_gst_base_sink_is_last_sample_enabled; ///
private alias c_gst_base_sink_is_qos_enabledFn = extern(C) gboolean function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_is_qos_enabledFn c_gst_base_sink_is_qos_enabled; ///
private alias c_gst_base_sink_query_latencyFn = extern(C) gboolean function(GstBaseSink* sink, gboolean* live, gboolean* upstreamLive, GstClockTime* minLatency, GstClockTime* maxLatency) nothrow;
__gshared c_gst_base_sink_query_latencyFn c_gst_base_sink_query_latency; ///
private alias c_gst_base_sink_set_async_enabledFn = extern(C) void function(GstBaseSink* sink, gboolean enabled) nothrow;
__gshared c_gst_base_sink_set_async_enabledFn c_gst_base_sink_set_async_enabled; ///
private alias c_gst_base_sink_set_blocksizeFn = extern(C) void function(GstBaseSink* sink, uint blocksize) nothrow;
__gshared c_gst_base_sink_set_blocksizeFn c_gst_base_sink_set_blocksize; ///
private alias c_gst_base_sink_set_drop_out_of_segmentFn = extern(C) void function(GstBaseSink* sink, gboolean dropOutOfSegment) nothrow;
__gshared c_gst_base_sink_set_drop_out_of_segmentFn c_gst_base_sink_set_drop_out_of_segment; ///
private alias c_gst_base_sink_set_last_sample_enabledFn = extern(C) void function(GstBaseSink* sink, gboolean enabled) nothrow;
__gshared c_gst_base_sink_set_last_sample_enabledFn c_gst_base_sink_set_last_sample_enabled; ///
private alias c_gst_base_sink_set_max_bitrateFn = extern(C) void function(GstBaseSink* sink, ulong maxBitrate) nothrow;
__gshared c_gst_base_sink_set_max_bitrateFn c_gst_base_sink_set_max_bitrate; ///
private alias c_gst_base_sink_set_max_latenessFn = extern(C) void function(GstBaseSink* sink, long maxLateness) nothrow;
__gshared c_gst_base_sink_set_max_latenessFn c_gst_base_sink_set_max_lateness; ///
private alias c_gst_base_sink_set_processing_deadlineFn = extern(C) void function(GstBaseSink* sink, GstClockTime processingDeadline) nothrow;
__gshared c_gst_base_sink_set_processing_deadlineFn c_gst_base_sink_set_processing_deadline; ///
private alias c_gst_base_sink_set_qos_enabledFn = extern(C) void function(GstBaseSink* sink, gboolean enabled) nothrow;
__gshared c_gst_base_sink_set_qos_enabledFn c_gst_base_sink_set_qos_enabled; ///
private alias c_gst_base_sink_set_render_delayFn = extern(C) void function(GstBaseSink* sink, GstClockTime delay) nothrow;
__gshared c_gst_base_sink_set_render_delayFn c_gst_base_sink_set_render_delay; ///
private alias c_gst_base_sink_set_syncFn = extern(C) void function(GstBaseSink* sink, gboolean sync) nothrow;
__gshared c_gst_base_sink_set_syncFn c_gst_base_sink_set_sync; ///
private alias c_gst_base_sink_set_throttle_timeFn = extern(C) void function(GstBaseSink* sink, ulong throttle) nothrow;
__gshared c_gst_base_sink_set_throttle_timeFn c_gst_base_sink_set_throttle_time; ///
private alias c_gst_base_sink_set_ts_offsetFn = extern(C) void function(GstBaseSink* sink, GstClockTimeDiff offset) nothrow;
__gshared c_gst_base_sink_set_ts_offsetFn c_gst_base_sink_set_ts_offset; ///
private alias c_gst_base_sink_waitFn = extern(C) GstFlowReturn function(GstBaseSink* sink, GstClockTime time, GstClockTimeDiff* jitter) nothrow;
__gshared c_gst_base_sink_waitFn c_gst_base_sink_wait; ///
private alias c_gst_base_sink_wait_clockFn = extern(C) GstClockReturn function(GstBaseSink* sink, GstClockTime time, GstClockTimeDiff* jitter) nothrow;
__gshared c_gst_base_sink_wait_clockFn c_gst_base_sink_wait_clock; ///
private alias c_gst_base_sink_wait_prerollFn = extern(C) GstFlowReturn function(GstBaseSink* sink) nothrow;
__gshared c_gst_base_sink_wait_prerollFn c_gst_base_sink_wait_preroll; ///

// BaseSrc
private alias c_gst_base_src_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_base_src_get_typeFn c_gst_base_src_get_type; ///
private alias c_gst_base_src_get_allocatorFn = extern(C) void function(GstBaseSrc* src, GstAllocator** allocator, GstAllocationParams* params) nothrow;
__gshared c_gst_base_src_get_allocatorFn c_gst_base_src_get_allocator; ///
private alias c_gst_base_src_get_blocksizeFn = extern(C) uint function(GstBaseSrc* src) nothrow;
__gshared c_gst_base_src_get_blocksizeFn c_gst_base_src_get_blocksize; ///
private alias c_gst_base_src_get_buffer_poolFn = extern(C) GstBufferPool* function(GstBaseSrc* src) nothrow;
__gshared c_gst_base_src_get_buffer_poolFn c_gst_base_src_get_buffer_pool; ///
private alias c_gst_base_src_get_do_timestampFn = extern(C) gboolean function(GstBaseSrc* src) nothrow;
__gshared c_gst_base_src_get_do_timestampFn c_gst_base_src_get_do_timestamp; ///
private alias c_gst_base_src_is_asyncFn = extern(C) gboolean function(GstBaseSrc* src) nothrow;
__gshared c_gst_base_src_is_asyncFn c_gst_base_src_is_async; ///
private alias c_gst_base_src_is_liveFn = extern(C) gboolean function(GstBaseSrc* src) nothrow;
__gshared c_gst_base_src_is_liveFn c_gst_base_src_is_live; ///
private alias c_gst_base_src_negotiateFn = extern(C) gboolean function(GstBaseSrc* src) nothrow;
__gshared c_gst_base_src_negotiateFn c_gst_base_src_negotiate; ///
private alias c_gst_base_src_new_seamless_segmentFn = extern(C) gboolean function(GstBaseSrc* src, long start, long stop, long time) nothrow;
__gshared c_gst_base_src_new_seamless_segmentFn c_gst_base_src_new_seamless_segment; ///
private alias c_gst_base_src_new_segmentFn = extern(C) gboolean function(GstBaseSrc* src, const(GstSegment)* segment) nothrow;
__gshared c_gst_base_src_new_segmentFn c_gst_base_src_new_segment; ///
private alias c_gst_base_src_push_segmentFn = extern(C) gboolean function(GstBaseSrc* src, const(GstSegment)* segment) nothrow;
__gshared c_gst_base_src_push_segmentFn c_gst_base_src_push_segment; ///
private alias c_gst_base_src_query_latencyFn = extern(C) gboolean function(GstBaseSrc* src, gboolean* live, GstClockTime* minLatency, GstClockTime* maxLatency) nothrow;
__gshared c_gst_base_src_query_latencyFn c_gst_base_src_query_latency; ///
private alias c_gst_base_src_set_asyncFn = extern(C) void function(GstBaseSrc* src, gboolean async) nothrow;
__gshared c_gst_base_src_set_asyncFn c_gst_base_src_set_async; ///
private alias c_gst_base_src_set_automatic_eosFn = extern(C) void function(GstBaseSrc* src, gboolean automaticEos) nothrow;
__gshared c_gst_base_src_set_automatic_eosFn c_gst_base_src_set_automatic_eos; ///
private alias c_gst_base_src_set_blocksizeFn = extern(C) void function(GstBaseSrc* src, uint blocksize) nothrow;
__gshared c_gst_base_src_set_blocksizeFn c_gst_base_src_set_blocksize; ///
private alias c_gst_base_src_set_capsFn = extern(C) gboolean function(GstBaseSrc* src, GstCaps* caps) nothrow;
__gshared c_gst_base_src_set_capsFn c_gst_base_src_set_caps; ///
private alias c_gst_base_src_set_do_timestampFn = extern(C) void function(GstBaseSrc* src, gboolean timestamp) nothrow;
__gshared c_gst_base_src_set_do_timestampFn c_gst_base_src_set_do_timestamp; ///
private alias c_gst_base_src_set_dynamic_sizeFn = extern(C) void function(GstBaseSrc* src, gboolean dynamic) nothrow;
__gshared c_gst_base_src_set_dynamic_sizeFn c_gst_base_src_set_dynamic_size; ///
private alias c_gst_base_src_set_formatFn = extern(C) void function(GstBaseSrc* src, GstFormat format) nothrow;
__gshared c_gst_base_src_set_formatFn c_gst_base_src_set_format; ///
private alias c_gst_base_src_set_liveFn = extern(C) void function(GstBaseSrc* src, gboolean live) nothrow;
__gshared c_gst_base_src_set_liveFn c_gst_base_src_set_live; ///
private alias c_gst_base_src_start_completeFn = extern(C) void function(GstBaseSrc* basesrc, GstFlowReturn ret) nothrow;
__gshared c_gst_base_src_start_completeFn c_gst_base_src_start_complete; ///
private alias c_gst_base_src_start_waitFn = extern(C) GstFlowReturn function(GstBaseSrc* basesrc) nothrow;
__gshared c_gst_base_src_start_waitFn c_gst_base_src_start_wait; ///
private alias c_gst_base_src_submit_buffer_listFn = extern(C) void function(GstBaseSrc* src, GstBufferList* bufferList) nothrow;
__gshared c_gst_base_src_submit_buffer_listFn c_gst_base_src_submit_buffer_list; ///
private alias c_gst_base_src_wait_playingFn = extern(C) GstFlowReturn function(GstBaseSrc* src) nothrow;
__gshared c_gst_base_src_wait_playingFn c_gst_base_src_wait_playing; ///

// BaseTransform
private alias c_gst_base_transform_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_base_transform_get_typeFn c_gst_base_transform_get_type; ///
private alias c_gst_base_transform_get_allocatorFn = extern(C) void function(GstBaseTransform* trans, GstAllocator** allocator, GstAllocationParams* params) nothrow;
__gshared c_gst_base_transform_get_allocatorFn c_gst_base_transform_get_allocator; ///
private alias c_gst_base_transform_get_buffer_poolFn = extern(C) GstBufferPool* function(GstBaseTransform* trans) nothrow;
__gshared c_gst_base_transform_get_buffer_poolFn c_gst_base_transform_get_buffer_pool; ///
private alias c_gst_base_transform_is_in_placeFn = extern(C) gboolean function(GstBaseTransform* trans) nothrow;
__gshared c_gst_base_transform_is_in_placeFn c_gst_base_transform_is_in_place; ///
private alias c_gst_base_transform_is_passthroughFn = extern(C) gboolean function(GstBaseTransform* trans) nothrow;
__gshared c_gst_base_transform_is_passthroughFn c_gst_base_transform_is_passthrough; ///
private alias c_gst_base_transform_is_qos_enabledFn = extern(C) gboolean function(GstBaseTransform* trans) nothrow;
__gshared c_gst_base_transform_is_qos_enabledFn c_gst_base_transform_is_qos_enabled; ///
private alias c_gst_base_transform_reconfigureFn = extern(C) gboolean function(GstBaseTransform* trans) nothrow;
__gshared c_gst_base_transform_reconfigureFn c_gst_base_transform_reconfigure; ///
private alias c_gst_base_transform_reconfigure_sinkFn = extern(C) void function(GstBaseTransform* trans) nothrow;
__gshared c_gst_base_transform_reconfigure_sinkFn c_gst_base_transform_reconfigure_sink; ///
private alias c_gst_base_transform_reconfigure_srcFn = extern(C) void function(GstBaseTransform* trans) nothrow;
__gshared c_gst_base_transform_reconfigure_srcFn c_gst_base_transform_reconfigure_src; ///
private alias c_gst_base_transform_set_gap_awareFn = extern(C) void function(GstBaseTransform* trans, gboolean gapAware) nothrow;
__gshared c_gst_base_transform_set_gap_awareFn c_gst_base_transform_set_gap_aware; ///
private alias c_gst_base_transform_set_in_placeFn = extern(C) void function(GstBaseTransform* trans, gboolean inPlace) nothrow;
__gshared c_gst_base_transform_set_in_placeFn c_gst_base_transform_set_in_place; ///
private alias c_gst_base_transform_set_passthroughFn = extern(C) void function(GstBaseTransform* trans, gboolean passthrough) nothrow;
__gshared c_gst_base_transform_set_passthroughFn c_gst_base_transform_set_passthrough; ///
private alias c_gst_base_transform_set_prefer_passthroughFn = extern(C) void function(GstBaseTransform* trans, gboolean preferPassthrough) nothrow;
__gshared c_gst_base_transform_set_prefer_passthroughFn c_gst_base_transform_set_prefer_passthrough; ///
private alias c_gst_base_transform_set_qos_enabledFn = extern(C) void function(GstBaseTransform* trans, gboolean enabled) nothrow;
__gshared c_gst_base_transform_set_qos_enabledFn c_gst_base_transform_set_qos_enabled; ///
private alias c_gst_base_transform_update_qosFn = extern(C) void function(GstBaseTransform* trans, double proportion, GstClockTimeDiff diff, GstClockTime timestamp) nothrow;
__gshared c_gst_base_transform_update_qosFn c_gst_base_transform_update_qos; ///
private alias c_gst_base_transform_update_src_capsFn = extern(C) gboolean function(GstBaseTransform* trans, GstCaps* updatedCaps) nothrow;
__gshared c_gst_base_transform_update_src_capsFn c_gst_base_transform_update_src_caps; ///

// BitReader
private alias c_gst_bit_reader_freeFn = extern(C) void function(GstBitReader* reader) nothrow;
__gshared c_gst_bit_reader_freeFn c_gst_bit_reader_free; ///
private alias c_gst_bit_reader_get_bits_uint16Fn = extern(C) gboolean function(GstBitReader* reader, ushort* val, uint nbits) nothrow;
__gshared c_gst_bit_reader_get_bits_uint16Fn c_gst_bit_reader_get_bits_uint16; ///
private alias c_gst_bit_reader_get_bits_uint32Fn = extern(C) gboolean function(GstBitReader* reader, uint* val, uint nbits) nothrow;
__gshared c_gst_bit_reader_get_bits_uint32Fn c_gst_bit_reader_get_bits_uint32; ///
private alias c_gst_bit_reader_get_bits_uint64Fn = extern(C) gboolean function(GstBitReader* reader, ulong* val, uint nbits) nothrow;
__gshared c_gst_bit_reader_get_bits_uint64Fn c_gst_bit_reader_get_bits_uint64; ///
private alias c_gst_bit_reader_get_bits_uint8Fn = extern(C) gboolean function(GstBitReader* reader, ubyte* val, uint nbits) nothrow;
__gshared c_gst_bit_reader_get_bits_uint8Fn c_gst_bit_reader_get_bits_uint8; ///
private alias c_gst_bit_reader_get_posFn = extern(C) uint function(const(GstBitReader)* reader) nothrow;
__gshared c_gst_bit_reader_get_posFn c_gst_bit_reader_get_pos; ///
private alias c_gst_bit_reader_get_remainingFn = extern(C) uint function(const(GstBitReader)* reader) nothrow;
__gshared c_gst_bit_reader_get_remainingFn c_gst_bit_reader_get_remaining; ///
private alias c_gst_bit_reader_get_sizeFn = extern(C) uint function(const(GstBitReader)* reader) nothrow;
__gshared c_gst_bit_reader_get_sizeFn c_gst_bit_reader_get_size; ///
private alias c_gst_bit_reader_initFn = extern(C) void function(GstBitReader* reader, const(ubyte)* data, uint size) nothrow;
__gshared c_gst_bit_reader_initFn c_gst_bit_reader_init; ///
private alias c_gst_bit_reader_peek_bits_uint16Fn = extern(C) gboolean function(const(GstBitReader)* reader, ushort* val, uint nbits) nothrow;
__gshared c_gst_bit_reader_peek_bits_uint16Fn c_gst_bit_reader_peek_bits_uint16; ///
private alias c_gst_bit_reader_peek_bits_uint32Fn = extern(C) gboolean function(const(GstBitReader)* reader, uint* val, uint nbits) nothrow;
__gshared c_gst_bit_reader_peek_bits_uint32Fn c_gst_bit_reader_peek_bits_uint32; ///
private alias c_gst_bit_reader_peek_bits_uint64Fn = extern(C) gboolean function(const(GstBitReader)* reader, ulong* val, uint nbits) nothrow;
__gshared c_gst_bit_reader_peek_bits_uint64Fn c_gst_bit_reader_peek_bits_uint64; ///
private alias c_gst_bit_reader_peek_bits_uint8Fn = extern(C) gboolean function(const(GstBitReader)* reader, ubyte* val, uint nbits) nothrow;
__gshared c_gst_bit_reader_peek_bits_uint8Fn c_gst_bit_reader_peek_bits_uint8; ///
private alias c_gst_bit_reader_set_posFn = extern(C) gboolean function(GstBitReader* reader, uint pos) nothrow;
__gshared c_gst_bit_reader_set_posFn c_gst_bit_reader_set_pos; ///
private alias c_gst_bit_reader_skipFn = extern(C) gboolean function(GstBitReader* reader, uint nbits) nothrow;
__gshared c_gst_bit_reader_skipFn c_gst_bit_reader_skip; ///
private alias c_gst_bit_reader_skip_to_byteFn = extern(C) gboolean function(GstBitReader* reader) nothrow;
__gshared c_gst_bit_reader_skip_to_byteFn c_gst_bit_reader_skip_to_byte; ///
private alias c_gst_bit_reader_newFn = extern(C) GstBitReader* function(const(ubyte)* data, uint size) nothrow;
__gshared c_gst_bit_reader_newFn c_gst_bit_reader_new; ///

// BitWriter
private alias c_gst_bit_writer_align_bytesFn = extern(C) gboolean function(GstBitWriter* bitwriter, ubyte trailingBit) nothrow;
__gshared c_gst_bit_writer_align_bytesFn c_gst_bit_writer_align_bytes; ///
private alias c_gst_bit_writer_freeFn = extern(C) void function(GstBitWriter* bitwriter) nothrow;
__gshared c_gst_bit_writer_freeFn c_gst_bit_writer_free; ///
private alias c_gst_bit_writer_free_and_get_bufferFn = extern(C) GstBuffer* function(GstBitWriter* bitwriter) nothrow;
__gshared c_gst_bit_writer_free_and_get_bufferFn c_gst_bit_writer_free_and_get_buffer; ///
private alias c_gst_bit_writer_free_and_get_dataFn = extern(C) ubyte* function(GstBitWriter* bitwriter) nothrow;
__gshared c_gst_bit_writer_free_and_get_dataFn c_gst_bit_writer_free_and_get_data; ///
private alias c_gst_bit_writer_get_dataFn = extern(C) ubyte* function(const(GstBitWriter)* bitwriter) nothrow;
__gshared c_gst_bit_writer_get_dataFn c_gst_bit_writer_get_data; ///
private alias c_gst_bit_writer_get_remainingFn = extern(C) uint function(const(GstBitWriter)* bitwriter) nothrow;
__gshared c_gst_bit_writer_get_remainingFn c_gst_bit_writer_get_remaining; ///
private alias c_gst_bit_writer_get_sizeFn = extern(C) uint function(const(GstBitWriter)* bitwriter) nothrow;
__gshared c_gst_bit_writer_get_sizeFn c_gst_bit_writer_get_size; ///
private alias c_gst_bit_writer_initFn = extern(C) void function(GstBitWriter* bitwriter) nothrow;
__gshared c_gst_bit_writer_initFn c_gst_bit_writer_init; ///
private alias c_gst_bit_writer_init_with_dataFn = extern(C) void function(GstBitWriter* bitwriter, ubyte* data, uint size, gboolean initialized) nothrow;
__gshared c_gst_bit_writer_init_with_dataFn c_gst_bit_writer_init_with_data; ///
private alias c_gst_bit_writer_init_with_sizeFn = extern(C) void function(GstBitWriter* bitwriter, uint size, gboolean fixed) nothrow;
__gshared c_gst_bit_writer_init_with_sizeFn c_gst_bit_writer_init_with_size; ///
private alias c_gst_bit_writer_put_bits_uint16Fn = extern(C) gboolean function(GstBitWriter* bitwriter, ushort value, uint nbits) nothrow;
__gshared c_gst_bit_writer_put_bits_uint16Fn c_gst_bit_writer_put_bits_uint16; ///
private alias c_gst_bit_writer_put_bits_uint32Fn = extern(C) gboolean function(GstBitWriter* bitwriter, uint value, uint nbits) nothrow;
__gshared c_gst_bit_writer_put_bits_uint32Fn c_gst_bit_writer_put_bits_uint32; ///
private alias c_gst_bit_writer_put_bits_uint64Fn = extern(C) gboolean function(GstBitWriter* bitwriter, ulong value, uint nbits) nothrow;
__gshared c_gst_bit_writer_put_bits_uint64Fn c_gst_bit_writer_put_bits_uint64; ///
private alias c_gst_bit_writer_put_bits_uint8Fn = extern(C) gboolean function(GstBitWriter* bitwriter, ubyte value, uint nbits) nothrow;
__gshared c_gst_bit_writer_put_bits_uint8Fn c_gst_bit_writer_put_bits_uint8; ///
private alias c_gst_bit_writer_put_bytesFn = extern(C) gboolean function(GstBitWriter* bitwriter, const(ubyte)* data, uint nbytes) nothrow;
__gshared c_gst_bit_writer_put_bytesFn c_gst_bit_writer_put_bytes; ///
private alias c_gst_bit_writer_resetFn = extern(C) void function(GstBitWriter* bitwriter) nothrow;
__gshared c_gst_bit_writer_resetFn c_gst_bit_writer_reset; ///
private alias c_gst_bit_writer_reset_and_get_bufferFn = extern(C) GstBuffer* function(GstBitWriter* bitwriter) nothrow;
__gshared c_gst_bit_writer_reset_and_get_bufferFn c_gst_bit_writer_reset_and_get_buffer; ///
private alias c_gst_bit_writer_reset_and_get_dataFn = extern(C) ubyte* function(GstBitWriter* bitwriter) nothrow;
__gshared c_gst_bit_writer_reset_and_get_dataFn c_gst_bit_writer_reset_and_get_data; ///
private alias c_gst_bit_writer_set_posFn = extern(C) gboolean function(GstBitWriter* bitwriter, uint pos) nothrow;
__gshared c_gst_bit_writer_set_posFn c_gst_bit_writer_set_pos; ///
private alias c_gst_bit_writer_newFn = extern(C) GstBitWriter* function() nothrow;
__gshared c_gst_bit_writer_newFn c_gst_bit_writer_new; ///
private alias c_gst_bit_writer_new_with_dataFn = extern(C) GstBitWriter* function(ubyte* data, uint size, gboolean initialized) nothrow;
__gshared c_gst_bit_writer_new_with_dataFn c_gst_bit_writer_new_with_data; ///
private alias c_gst_bit_writer_new_with_sizeFn = extern(C) GstBitWriter* function(uint size, gboolean fixed) nothrow;
__gshared c_gst_bit_writer_new_with_sizeFn c_gst_bit_writer_new_with_size; ///

// ByteReader
private alias c_gst_byte_reader_dup_dataFn = extern(C) gboolean function(GstByteReader* reader, uint size, ubyte** val) nothrow;
__gshared c_gst_byte_reader_dup_dataFn c_gst_byte_reader_dup_data; ///
private alias c_gst_byte_reader_dup_string_utf16Fn = extern(C) gboolean function(GstByteReader* reader, ushort** str) nothrow;
__gshared c_gst_byte_reader_dup_string_utf16Fn c_gst_byte_reader_dup_string_utf16; ///
private alias c_gst_byte_reader_dup_string_utf32Fn = extern(C) gboolean function(GstByteReader* reader, uint** str) nothrow;
__gshared c_gst_byte_reader_dup_string_utf32Fn c_gst_byte_reader_dup_string_utf32; ///
private alias c_gst_byte_reader_dup_string_utf8Fn = extern(C) gboolean function(GstByteReader* reader, char** str) nothrow;
__gshared c_gst_byte_reader_dup_string_utf8Fn c_gst_byte_reader_dup_string_utf8; ///
private alias c_gst_byte_reader_freeFn = extern(C) void function(GstByteReader* reader) nothrow;
__gshared c_gst_byte_reader_freeFn c_gst_byte_reader_free; ///
private alias c_gst_byte_reader_get_dataFn = extern(C) gboolean function(GstByteReader* reader, uint size, const(ubyte*)* val) nothrow;
__gshared c_gst_byte_reader_get_dataFn c_gst_byte_reader_get_data; ///
private alias c_gst_byte_reader_get_float32_beFn = extern(C) gboolean function(GstByteReader* reader, float* val) nothrow;
__gshared c_gst_byte_reader_get_float32_beFn c_gst_byte_reader_get_float32_be; ///
private alias c_gst_byte_reader_get_float32_leFn = extern(C) gboolean function(GstByteReader* reader, float* val) nothrow;
__gshared c_gst_byte_reader_get_float32_leFn c_gst_byte_reader_get_float32_le; ///
private alias c_gst_byte_reader_get_float64_beFn = extern(C) gboolean function(GstByteReader* reader, double* val) nothrow;
__gshared c_gst_byte_reader_get_float64_beFn c_gst_byte_reader_get_float64_be; ///
private alias c_gst_byte_reader_get_float64_leFn = extern(C) gboolean function(GstByteReader* reader, double* val) nothrow;
__gshared c_gst_byte_reader_get_float64_leFn c_gst_byte_reader_get_float64_le; ///
private alias c_gst_byte_reader_get_int16_beFn = extern(C) gboolean function(GstByteReader* reader, short* val) nothrow;
__gshared c_gst_byte_reader_get_int16_beFn c_gst_byte_reader_get_int16_be; ///
private alias c_gst_byte_reader_get_int16_leFn = extern(C) gboolean function(GstByteReader* reader, short* val) nothrow;
__gshared c_gst_byte_reader_get_int16_leFn c_gst_byte_reader_get_int16_le; ///
private alias c_gst_byte_reader_get_int24_beFn = extern(C) gboolean function(GstByteReader* reader, int* val) nothrow;
__gshared c_gst_byte_reader_get_int24_beFn c_gst_byte_reader_get_int24_be; ///
private alias c_gst_byte_reader_get_int24_leFn = extern(C) gboolean function(GstByteReader* reader, int* val) nothrow;
__gshared c_gst_byte_reader_get_int24_leFn c_gst_byte_reader_get_int24_le; ///
private alias c_gst_byte_reader_get_int32_beFn = extern(C) gboolean function(GstByteReader* reader, int* val) nothrow;
__gshared c_gst_byte_reader_get_int32_beFn c_gst_byte_reader_get_int32_be; ///
private alias c_gst_byte_reader_get_int32_leFn = extern(C) gboolean function(GstByteReader* reader, int* val) nothrow;
__gshared c_gst_byte_reader_get_int32_leFn c_gst_byte_reader_get_int32_le; ///
private alias c_gst_byte_reader_get_int64_beFn = extern(C) gboolean function(GstByteReader* reader, long* val) nothrow;
__gshared c_gst_byte_reader_get_int64_beFn c_gst_byte_reader_get_int64_be; ///
private alias c_gst_byte_reader_get_int64_leFn = extern(C) gboolean function(GstByteReader* reader, long* val) nothrow;
__gshared c_gst_byte_reader_get_int64_leFn c_gst_byte_reader_get_int64_le; ///
private alias c_gst_byte_reader_get_int8Fn = extern(C) gboolean function(GstByteReader* reader, byte* val) nothrow;
__gshared c_gst_byte_reader_get_int8Fn c_gst_byte_reader_get_int8; ///
private alias c_gst_byte_reader_get_posFn = extern(C) uint function(const(GstByteReader)* reader) nothrow;
__gshared c_gst_byte_reader_get_posFn c_gst_byte_reader_get_pos; ///
private alias c_gst_byte_reader_get_remainingFn = extern(C) uint function(const(GstByteReader)* reader) nothrow;
__gshared c_gst_byte_reader_get_remainingFn c_gst_byte_reader_get_remaining; ///
private alias c_gst_byte_reader_get_sizeFn = extern(C) uint function(const(GstByteReader)* reader) nothrow;
__gshared c_gst_byte_reader_get_sizeFn c_gst_byte_reader_get_size; ///
private alias c_gst_byte_reader_get_string_utf8Fn = extern(C) gboolean function(GstByteReader* reader, const(char*)* str) nothrow;
__gshared c_gst_byte_reader_get_string_utf8Fn c_gst_byte_reader_get_string_utf8; ///
private alias c_gst_byte_reader_get_sub_readerFn = extern(C) gboolean function(GstByteReader* reader, GstByteReader* subReader, uint size) nothrow;
__gshared c_gst_byte_reader_get_sub_readerFn c_gst_byte_reader_get_sub_reader; ///
private alias c_gst_byte_reader_get_uint16_beFn = extern(C) gboolean function(GstByteReader* reader, ushort* val) nothrow;
__gshared c_gst_byte_reader_get_uint16_beFn c_gst_byte_reader_get_uint16_be; ///
private alias c_gst_byte_reader_get_uint16_leFn = extern(C) gboolean function(GstByteReader* reader, ushort* val) nothrow;
__gshared c_gst_byte_reader_get_uint16_leFn c_gst_byte_reader_get_uint16_le; ///
private alias c_gst_byte_reader_get_uint24_beFn = extern(C) gboolean function(GstByteReader* reader, uint* val) nothrow;
__gshared c_gst_byte_reader_get_uint24_beFn c_gst_byte_reader_get_uint24_be; ///
private alias c_gst_byte_reader_get_uint24_leFn = extern(C) gboolean function(GstByteReader* reader, uint* val) nothrow;
__gshared c_gst_byte_reader_get_uint24_leFn c_gst_byte_reader_get_uint24_le; ///
private alias c_gst_byte_reader_get_uint32_beFn = extern(C) gboolean function(GstByteReader* reader, uint* val) nothrow;
__gshared c_gst_byte_reader_get_uint32_beFn c_gst_byte_reader_get_uint32_be; ///
private alias c_gst_byte_reader_get_uint32_leFn = extern(C) gboolean function(GstByteReader* reader, uint* val) nothrow;
__gshared c_gst_byte_reader_get_uint32_leFn c_gst_byte_reader_get_uint32_le; ///
private alias c_gst_byte_reader_get_uint64_beFn = extern(C) gboolean function(GstByteReader* reader, ulong* val) nothrow;
__gshared c_gst_byte_reader_get_uint64_beFn c_gst_byte_reader_get_uint64_be; ///
private alias c_gst_byte_reader_get_uint64_leFn = extern(C) gboolean function(GstByteReader* reader, ulong* val) nothrow;
__gshared c_gst_byte_reader_get_uint64_leFn c_gst_byte_reader_get_uint64_le; ///
private alias c_gst_byte_reader_get_uint8Fn = extern(C) gboolean function(GstByteReader* reader, ubyte* val) nothrow;
__gshared c_gst_byte_reader_get_uint8Fn c_gst_byte_reader_get_uint8; ///
private alias c_gst_byte_reader_initFn = extern(C) void function(GstByteReader* reader, const(ubyte)* data, uint size) nothrow;
__gshared c_gst_byte_reader_initFn c_gst_byte_reader_init; ///
private alias c_gst_byte_reader_masked_scan_uint32Fn = extern(C) uint function(const(GstByteReader)* reader, uint mask, uint pattern, uint offset, uint size) nothrow;
__gshared c_gst_byte_reader_masked_scan_uint32Fn c_gst_byte_reader_masked_scan_uint32; ///
private alias c_gst_byte_reader_masked_scan_uint32_peekFn = extern(C) uint function(const(GstByteReader)* reader, uint mask, uint pattern, uint offset, uint size, uint* value) nothrow;
__gshared c_gst_byte_reader_masked_scan_uint32_peekFn c_gst_byte_reader_masked_scan_uint32_peek; ///
private alias c_gst_byte_reader_peek_dataFn = extern(C) gboolean function(const(GstByteReader)* reader, uint size, const(ubyte*)* val) nothrow;
__gshared c_gst_byte_reader_peek_dataFn c_gst_byte_reader_peek_data; ///
private alias c_gst_byte_reader_peek_float32_beFn = extern(C) gboolean function(const(GstByteReader)* reader, float* val) nothrow;
__gshared c_gst_byte_reader_peek_float32_beFn c_gst_byte_reader_peek_float32_be; ///
private alias c_gst_byte_reader_peek_float32_leFn = extern(C) gboolean function(const(GstByteReader)* reader, float* val) nothrow;
__gshared c_gst_byte_reader_peek_float32_leFn c_gst_byte_reader_peek_float32_le; ///
private alias c_gst_byte_reader_peek_float64_beFn = extern(C) gboolean function(const(GstByteReader)* reader, double* val) nothrow;
__gshared c_gst_byte_reader_peek_float64_beFn c_gst_byte_reader_peek_float64_be; ///
private alias c_gst_byte_reader_peek_float64_leFn = extern(C) gboolean function(const(GstByteReader)* reader, double* val) nothrow;
__gshared c_gst_byte_reader_peek_float64_leFn c_gst_byte_reader_peek_float64_le; ///
private alias c_gst_byte_reader_peek_int16_beFn = extern(C) gboolean function(const(GstByteReader)* reader, short* val) nothrow;
__gshared c_gst_byte_reader_peek_int16_beFn c_gst_byte_reader_peek_int16_be; ///
private alias c_gst_byte_reader_peek_int16_leFn = extern(C) gboolean function(const(GstByteReader)* reader, short* val) nothrow;
__gshared c_gst_byte_reader_peek_int16_leFn c_gst_byte_reader_peek_int16_le; ///
private alias c_gst_byte_reader_peek_int24_beFn = extern(C) gboolean function(const(GstByteReader)* reader, int* val) nothrow;
__gshared c_gst_byte_reader_peek_int24_beFn c_gst_byte_reader_peek_int24_be; ///
private alias c_gst_byte_reader_peek_int24_leFn = extern(C) gboolean function(const(GstByteReader)* reader, int* val) nothrow;
__gshared c_gst_byte_reader_peek_int24_leFn c_gst_byte_reader_peek_int24_le; ///
private alias c_gst_byte_reader_peek_int32_beFn = extern(C) gboolean function(const(GstByteReader)* reader, int* val) nothrow;
__gshared c_gst_byte_reader_peek_int32_beFn c_gst_byte_reader_peek_int32_be; ///
private alias c_gst_byte_reader_peek_int32_leFn = extern(C) gboolean function(const(GstByteReader)* reader, int* val) nothrow;
__gshared c_gst_byte_reader_peek_int32_leFn c_gst_byte_reader_peek_int32_le; ///
private alias c_gst_byte_reader_peek_int64_beFn = extern(C) gboolean function(const(GstByteReader)* reader, long* val) nothrow;
__gshared c_gst_byte_reader_peek_int64_beFn c_gst_byte_reader_peek_int64_be; ///
private alias c_gst_byte_reader_peek_int64_leFn = extern(C) gboolean function(const(GstByteReader)* reader, long* val) nothrow;
__gshared c_gst_byte_reader_peek_int64_leFn c_gst_byte_reader_peek_int64_le; ///
private alias c_gst_byte_reader_peek_int8Fn = extern(C) gboolean function(const(GstByteReader)* reader, byte* val) nothrow;
__gshared c_gst_byte_reader_peek_int8Fn c_gst_byte_reader_peek_int8; ///
private alias c_gst_byte_reader_peek_string_utf8Fn = extern(C) gboolean function(const(GstByteReader)* reader, const(char*)* str) nothrow;
__gshared c_gst_byte_reader_peek_string_utf8Fn c_gst_byte_reader_peek_string_utf8; ///
private alias c_gst_byte_reader_peek_sub_readerFn = extern(C) gboolean function(GstByteReader* reader, GstByteReader* subReader, uint size) nothrow;
__gshared c_gst_byte_reader_peek_sub_readerFn c_gst_byte_reader_peek_sub_reader; ///
private alias c_gst_byte_reader_peek_uint16_beFn = extern(C) gboolean function(const(GstByteReader)* reader, ushort* val) nothrow;
__gshared c_gst_byte_reader_peek_uint16_beFn c_gst_byte_reader_peek_uint16_be; ///
private alias c_gst_byte_reader_peek_uint16_leFn = extern(C) gboolean function(const(GstByteReader)* reader, ushort* val) nothrow;
__gshared c_gst_byte_reader_peek_uint16_leFn c_gst_byte_reader_peek_uint16_le; ///
private alias c_gst_byte_reader_peek_uint24_beFn = extern(C) gboolean function(const(GstByteReader)* reader, uint* val) nothrow;
__gshared c_gst_byte_reader_peek_uint24_beFn c_gst_byte_reader_peek_uint24_be; ///
private alias c_gst_byte_reader_peek_uint24_leFn = extern(C) gboolean function(const(GstByteReader)* reader, uint* val) nothrow;
__gshared c_gst_byte_reader_peek_uint24_leFn c_gst_byte_reader_peek_uint24_le; ///
private alias c_gst_byte_reader_peek_uint32_beFn = extern(C) gboolean function(const(GstByteReader)* reader, uint* val) nothrow;
__gshared c_gst_byte_reader_peek_uint32_beFn c_gst_byte_reader_peek_uint32_be; ///
private alias c_gst_byte_reader_peek_uint32_leFn = extern(C) gboolean function(const(GstByteReader)* reader, uint* val) nothrow;
__gshared c_gst_byte_reader_peek_uint32_leFn c_gst_byte_reader_peek_uint32_le; ///
private alias c_gst_byte_reader_peek_uint64_beFn = extern(C) gboolean function(const(GstByteReader)* reader, ulong* val) nothrow;
__gshared c_gst_byte_reader_peek_uint64_beFn c_gst_byte_reader_peek_uint64_be; ///
private alias c_gst_byte_reader_peek_uint64_leFn = extern(C) gboolean function(const(GstByteReader)* reader, ulong* val) nothrow;
__gshared c_gst_byte_reader_peek_uint64_leFn c_gst_byte_reader_peek_uint64_le; ///
private alias c_gst_byte_reader_peek_uint8Fn = extern(C) gboolean function(const(GstByteReader)* reader, ubyte* val) nothrow;
__gshared c_gst_byte_reader_peek_uint8Fn c_gst_byte_reader_peek_uint8; ///
private alias c_gst_byte_reader_set_posFn = extern(C) gboolean function(GstByteReader* reader, uint pos) nothrow;
__gshared c_gst_byte_reader_set_posFn c_gst_byte_reader_set_pos; ///
private alias c_gst_byte_reader_skipFn = extern(C) gboolean function(GstByteReader* reader, uint nbytes) nothrow;
__gshared c_gst_byte_reader_skipFn c_gst_byte_reader_skip; ///
private alias c_gst_byte_reader_skip_string_utf16Fn = extern(C) gboolean function(GstByteReader* reader) nothrow;
__gshared c_gst_byte_reader_skip_string_utf16Fn c_gst_byte_reader_skip_string_utf16; ///
private alias c_gst_byte_reader_skip_string_utf32Fn = extern(C) gboolean function(GstByteReader* reader) nothrow;
__gshared c_gst_byte_reader_skip_string_utf32Fn c_gst_byte_reader_skip_string_utf32; ///
private alias c_gst_byte_reader_skip_string_utf8Fn = extern(C) gboolean function(GstByteReader* reader) nothrow;
__gshared c_gst_byte_reader_skip_string_utf8Fn c_gst_byte_reader_skip_string_utf8; ///
private alias c_gst_byte_reader_newFn = extern(C) GstByteReader* function(const(ubyte)* data, uint size) nothrow;
__gshared c_gst_byte_reader_newFn c_gst_byte_reader_new; ///

// ByteWriter
private alias c_gst_byte_writer_ensure_free_spaceFn = extern(C) gboolean function(GstByteWriter* writer, uint size) nothrow;
__gshared c_gst_byte_writer_ensure_free_spaceFn c_gst_byte_writer_ensure_free_space; ///
private alias c_gst_byte_writer_fillFn = extern(C) gboolean function(GstByteWriter* writer, ubyte value, uint size) nothrow;
__gshared c_gst_byte_writer_fillFn c_gst_byte_writer_fill; ///
private alias c_gst_byte_writer_freeFn = extern(C) void function(GstByteWriter* writer) nothrow;
__gshared c_gst_byte_writer_freeFn c_gst_byte_writer_free; ///
private alias c_gst_byte_writer_free_and_get_bufferFn = extern(C) GstBuffer* function(GstByteWriter* writer) nothrow;
__gshared c_gst_byte_writer_free_and_get_bufferFn c_gst_byte_writer_free_and_get_buffer; ///
private alias c_gst_byte_writer_free_and_get_dataFn = extern(C) ubyte* function(GstByteWriter* writer) nothrow;
__gshared c_gst_byte_writer_free_and_get_dataFn c_gst_byte_writer_free_and_get_data; ///
private alias c_gst_byte_writer_get_remainingFn = extern(C) uint function(const(GstByteWriter)* writer) nothrow;
__gshared c_gst_byte_writer_get_remainingFn c_gst_byte_writer_get_remaining; ///
private alias c_gst_byte_writer_initFn = extern(C) void function(GstByteWriter* writer) nothrow;
__gshared c_gst_byte_writer_initFn c_gst_byte_writer_init; ///
private alias c_gst_byte_writer_init_with_dataFn = extern(C) void function(GstByteWriter* writer, ubyte* data, uint size, gboolean initialized) nothrow;
__gshared c_gst_byte_writer_init_with_dataFn c_gst_byte_writer_init_with_data; ///
private alias c_gst_byte_writer_init_with_sizeFn = extern(C) void function(GstByteWriter* writer, uint size, gboolean fixed) nothrow;
__gshared c_gst_byte_writer_init_with_sizeFn c_gst_byte_writer_init_with_size; ///
private alias c_gst_byte_writer_put_bufferFn = extern(C) gboolean function(GstByteWriter* writer, GstBuffer* buffer, size_t offset, ptrdiff_t size) nothrow;
__gshared c_gst_byte_writer_put_bufferFn c_gst_byte_writer_put_buffer; ///
private alias c_gst_byte_writer_put_dataFn = extern(C) gboolean function(GstByteWriter* writer, const(ubyte)* data, uint size) nothrow;
__gshared c_gst_byte_writer_put_dataFn c_gst_byte_writer_put_data; ///
private alias c_gst_byte_writer_put_float32_beFn = extern(C) gboolean function(GstByteWriter* writer, float val) nothrow;
__gshared c_gst_byte_writer_put_float32_beFn c_gst_byte_writer_put_float32_be; ///
private alias c_gst_byte_writer_put_float32_leFn = extern(C) gboolean function(GstByteWriter* writer, float val) nothrow;
__gshared c_gst_byte_writer_put_float32_leFn c_gst_byte_writer_put_float32_le; ///
private alias c_gst_byte_writer_put_float64_beFn = extern(C) gboolean function(GstByteWriter* writer, double val) nothrow;
__gshared c_gst_byte_writer_put_float64_beFn c_gst_byte_writer_put_float64_be; ///
private alias c_gst_byte_writer_put_float64_leFn = extern(C) gboolean function(GstByteWriter* writer, double val) nothrow;
__gshared c_gst_byte_writer_put_float64_leFn c_gst_byte_writer_put_float64_le; ///
private alias c_gst_byte_writer_put_int16_beFn = extern(C) gboolean function(GstByteWriter* writer, short val) nothrow;
__gshared c_gst_byte_writer_put_int16_beFn c_gst_byte_writer_put_int16_be; ///
private alias c_gst_byte_writer_put_int16_leFn = extern(C) gboolean function(GstByteWriter* writer, short val) nothrow;
__gshared c_gst_byte_writer_put_int16_leFn c_gst_byte_writer_put_int16_le; ///
private alias c_gst_byte_writer_put_int24_beFn = extern(C) gboolean function(GstByteWriter* writer, int val) nothrow;
__gshared c_gst_byte_writer_put_int24_beFn c_gst_byte_writer_put_int24_be; ///
private alias c_gst_byte_writer_put_int24_leFn = extern(C) gboolean function(GstByteWriter* writer, int val) nothrow;
__gshared c_gst_byte_writer_put_int24_leFn c_gst_byte_writer_put_int24_le; ///
private alias c_gst_byte_writer_put_int32_beFn = extern(C) gboolean function(GstByteWriter* writer, int val) nothrow;
__gshared c_gst_byte_writer_put_int32_beFn c_gst_byte_writer_put_int32_be; ///
private alias c_gst_byte_writer_put_int32_leFn = extern(C) gboolean function(GstByteWriter* writer, int val) nothrow;
__gshared c_gst_byte_writer_put_int32_leFn c_gst_byte_writer_put_int32_le; ///
private alias c_gst_byte_writer_put_int64_beFn = extern(C) gboolean function(GstByteWriter* writer, long val) nothrow;
__gshared c_gst_byte_writer_put_int64_beFn c_gst_byte_writer_put_int64_be; ///
private alias c_gst_byte_writer_put_int64_leFn = extern(C) gboolean function(GstByteWriter* writer, long val) nothrow;
__gshared c_gst_byte_writer_put_int64_leFn c_gst_byte_writer_put_int64_le; ///
private alias c_gst_byte_writer_put_int8Fn = extern(C) gboolean function(GstByteWriter* writer, byte val) nothrow;
__gshared c_gst_byte_writer_put_int8Fn c_gst_byte_writer_put_int8; ///
private alias c_gst_byte_writer_put_string_utf16Fn = extern(C) gboolean function(GstByteWriter* writer, const(ushort)* data) nothrow;
__gshared c_gst_byte_writer_put_string_utf16Fn c_gst_byte_writer_put_string_utf16; ///
private alias c_gst_byte_writer_put_string_utf32Fn = extern(C) gboolean function(GstByteWriter* writer, const(uint)* data) nothrow;
__gshared c_gst_byte_writer_put_string_utf32Fn c_gst_byte_writer_put_string_utf32; ///
private alias c_gst_byte_writer_put_string_utf8Fn = extern(C) gboolean function(GstByteWriter* writer, const(char)* data) nothrow;
__gshared c_gst_byte_writer_put_string_utf8Fn c_gst_byte_writer_put_string_utf8; ///
private alias c_gst_byte_writer_put_uint16_beFn = extern(C) gboolean function(GstByteWriter* writer, ushort val) nothrow;
__gshared c_gst_byte_writer_put_uint16_beFn c_gst_byte_writer_put_uint16_be; ///
private alias c_gst_byte_writer_put_uint16_leFn = extern(C) gboolean function(GstByteWriter* writer, ushort val) nothrow;
__gshared c_gst_byte_writer_put_uint16_leFn c_gst_byte_writer_put_uint16_le; ///
private alias c_gst_byte_writer_put_uint24_beFn = extern(C) gboolean function(GstByteWriter* writer, uint val) nothrow;
__gshared c_gst_byte_writer_put_uint24_beFn c_gst_byte_writer_put_uint24_be; ///
private alias c_gst_byte_writer_put_uint24_leFn = extern(C) gboolean function(GstByteWriter* writer, uint val) nothrow;
__gshared c_gst_byte_writer_put_uint24_leFn c_gst_byte_writer_put_uint24_le; ///
private alias c_gst_byte_writer_put_uint32_beFn = extern(C) gboolean function(GstByteWriter* writer, uint val) nothrow;
__gshared c_gst_byte_writer_put_uint32_beFn c_gst_byte_writer_put_uint32_be; ///
private alias c_gst_byte_writer_put_uint32_leFn = extern(C) gboolean function(GstByteWriter* writer, uint val) nothrow;
__gshared c_gst_byte_writer_put_uint32_leFn c_gst_byte_writer_put_uint32_le; ///
private alias c_gst_byte_writer_put_uint64_beFn = extern(C) gboolean function(GstByteWriter* writer, ulong val) nothrow;
__gshared c_gst_byte_writer_put_uint64_beFn c_gst_byte_writer_put_uint64_be; ///
private alias c_gst_byte_writer_put_uint64_leFn = extern(C) gboolean function(GstByteWriter* writer, ulong val) nothrow;
__gshared c_gst_byte_writer_put_uint64_leFn c_gst_byte_writer_put_uint64_le; ///
private alias c_gst_byte_writer_put_uint8Fn = extern(C) gboolean function(GstByteWriter* writer, ubyte val) nothrow;
__gshared c_gst_byte_writer_put_uint8Fn c_gst_byte_writer_put_uint8; ///
private alias c_gst_byte_writer_resetFn = extern(C) void function(GstByteWriter* writer) nothrow;
__gshared c_gst_byte_writer_resetFn c_gst_byte_writer_reset; ///
private alias c_gst_byte_writer_reset_and_get_bufferFn = extern(C) GstBuffer* function(GstByteWriter* writer) nothrow;
__gshared c_gst_byte_writer_reset_and_get_bufferFn c_gst_byte_writer_reset_and_get_buffer; ///
private alias c_gst_byte_writer_reset_and_get_dataFn = extern(C) ubyte* function(GstByteWriter* writer) nothrow;
__gshared c_gst_byte_writer_reset_and_get_dataFn c_gst_byte_writer_reset_and_get_data; ///
private alias c_gst_byte_writer_newFn = extern(C) GstByteWriter* function() nothrow;
__gshared c_gst_byte_writer_newFn c_gst_byte_writer_new; ///
private alias c_gst_byte_writer_new_with_dataFn = extern(C) GstByteWriter* function(ubyte* data, uint size, gboolean initialized) nothrow;
__gshared c_gst_byte_writer_new_with_dataFn c_gst_byte_writer_new_with_data; ///
private alias c_gst_byte_writer_new_with_sizeFn = extern(C) GstByteWriter* function(uint size, gboolean fixed) nothrow;
__gshared c_gst_byte_writer_new_with_sizeFn c_gst_byte_writer_new_with_size; ///

// CollectPads
private alias c_gst_collect_pads_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_collect_pads_get_typeFn c_gst_collect_pads_get_type; ///
private alias c_gst_collect_pads_newFn = extern(C) GstCollectPads* function() nothrow;
__gshared c_gst_collect_pads_newFn c_gst_collect_pads_new; ///
private alias c_gst_collect_pads_add_padFn = extern(C) GstCollectData* function(GstCollectPads* pads, GstPad* pad, uint size, GstCollectDataDestroyNotify destroyNotify, gboolean lock) nothrow;
__gshared c_gst_collect_pads_add_padFn c_gst_collect_pads_add_pad; ///
private alias c_gst_collect_pads_availableFn = extern(C) uint function(GstCollectPads* pads) nothrow;
__gshared c_gst_collect_pads_availableFn c_gst_collect_pads_available; ///
private alias c_gst_collect_pads_clip_running_timeFn = extern(C) GstFlowReturn function(GstCollectPads* pads, GstCollectData* cdata, GstBuffer* buf, GstBuffer** outbuf, void* userData) nothrow;
__gshared c_gst_collect_pads_clip_running_timeFn c_gst_collect_pads_clip_running_time; ///
private alias c_gst_collect_pads_event_defaultFn = extern(C) gboolean function(GstCollectPads* pads, GstCollectData* data, GstEvent* event, gboolean discard) nothrow;
__gshared c_gst_collect_pads_event_defaultFn c_gst_collect_pads_event_default; ///
private alias c_gst_collect_pads_flushFn = extern(C) uint function(GstCollectPads* pads, GstCollectData* data, uint size) nothrow;
__gshared c_gst_collect_pads_flushFn c_gst_collect_pads_flush; ///
private alias c_gst_collect_pads_peekFn = extern(C) GstBuffer* function(GstCollectPads* pads, GstCollectData* data) nothrow;
__gshared c_gst_collect_pads_peekFn c_gst_collect_pads_peek; ///
private alias c_gst_collect_pads_popFn = extern(C) GstBuffer* function(GstCollectPads* pads, GstCollectData* data) nothrow;
__gshared c_gst_collect_pads_popFn c_gst_collect_pads_pop; ///
private alias c_gst_collect_pads_query_defaultFn = extern(C) gboolean function(GstCollectPads* pads, GstCollectData* data, GstQuery* query, gboolean discard) nothrow;
__gshared c_gst_collect_pads_query_defaultFn c_gst_collect_pads_query_default; ///
private alias c_gst_collect_pads_read_bufferFn = extern(C) GstBuffer* function(GstCollectPads* pads, GstCollectData* data, uint size) nothrow;
__gshared c_gst_collect_pads_read_bufferFn c_gst_collect_pads_read_buffer; ///
private alias c_gst_collect_pads_remove_padFn = extern(C) gboolean function(GstCollectPads* pads, GstPad* pad) nothrow;
__gshared c_gst_collect_pads_remove_padFn c_gst_collect_pads_remove_pad; ///
private alias c_gst_collect_pads_set_buffer_functionFn = extern(C) void function(GstCollectPads* pads, GstCollectPadsBufferFunction func, void* userData) nothrow;
__gshared c_gst_collect_pads_set_buffer_functionFn c_gst_collect_pads_set_buffer_function; ///
private alias c_gst_collect_pads_set_clip_functionFn = extern(C) void function(GstCollectPads* pads, GstCollectPadsClipFunction clipfunc, void* userData) nothrow;
__gshared c_gst_collect_pads_set_clip_functionFn c_gst_collect_pads_set_clip_function; ///
private alias c_gst_collect_pads_set_compare_functionFn = extern(C) void function(GstCollectPads* pads, GstCollectPadsCompareFunction func, void* userData) nothrow;
__gshared c_gst_collect_pads_set_compare_functionFn c_gst_collect_pads_set_compare_function; ///
private alias c_gst_collect_pads_set_event_functionFn = extern(C) void function(GstCollectPads* pads, GstCollectPadsEventFunction func, void* userData) nothrow;
__gshared c_gst_collect_pads_set_event_functionFn c_gst_collect_pads_set_event_function; ///
private alias c_gst_collect_pads_set_flush_functionFn = extern(C) void function(GstCollectPads* pads, GstCollectPadsFlushFunction func, void* userData) nothrow;
__gshared c_gst_collect_pads_set_flush_functionFn c_gst_collect_pads_set_flush_function; ///
private alias c_gst_collect_pads_set_flushingFn = extern(C) void function(GstCollectPads* pads, gboolean flushing) nothrow;
__gshared c_gst_collect_pads_set_flushingFn c_gst_collect_pads_set_flushing; ///
private alias c_gst_collect_pads_set_functionFn = extern(C) void function(GstCollectPads* pads, GstCollectPadsFunction func, void* userData) nothrow;
__gshared c_gst_collect_pads_set_functionFn c_gst_collect_pads_set_function; ///
private alias c_gst_collect_pads_set_query_functionFn = extern(C) void function(GstCollectPads* pads, GstCollectPadsQueryFunction func, void* userData) nothrow;
__gshared c_gst_collect_pads_set_query_functionFn c_gst_collect_pads_set_query_function; ///
private alias c_gst_collect_pads_set_waitingFn = extern(C) void function(GstCollectPads* pads, GstCollectData* data, gboolean waiting) nothrow;
__gshared c_gst_collect_pads_set_waitingFn c_gst_collect_pads_set_waiting; ///
private alias c_gst_collect_pads_src_event_defaultFn = extern(C) gboolean function(GstCollectPads* pads, GstPad* pad, GstEvent* event) nothrow;
__gshared c_gst_collect_pads_src_event_defaultFn c_gst_collect_pads_src_event_default; ///
private alias c_gst_collect_pads_startFn = extern(C) void function(GstCollectPads* pads) nothrow;
__gshared c_gst_collect_pads_startFn c_gst_collect_pads_start; ///
private alias c_gst_collect_pads_stopFn = extern(C) void function(GstCollectPads* pads) nothrow;
__gshared c_gst_collect_pads_stopFn c_gst_collect_pads_stop; ///
private alias c_gst_collect_pads_take_bufferFn = extern(C) GstBuffer* function(GstCollectPads* pads, GstCollectData* data, uint size) nothrow;
__gshared c_gst_collect_pads_take_bufferFn c_gst_collect_pads_take_buffer; ///

// DataQueue
private alias c_gst_data_queue_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_data_queue_get_typeFn c_gst_data_queue_get_type; ///
private alias c_gst_data_queue_newFn = extern(C) GstDataQueue* function(GstDataQueueCheckFullFunction checkfull, GstDataQueueFullCallback fullcallback, GstDataQueueEmptyCallback emptycallback, void* checkdata) nothrow;
__gshared c_gst_data_queue_newFn c_gst_data_queue_new; ///
private alias c_gst_data_queue_drop_headFn = extern(C) gboolean function(GstDataQueue* queue, GType type) nothrow;
__gshared c_gst_data_queue_drop_headFn c_gst_data_queue_drop_head; ///
private alias c_gst_data_queue_flushFn = extern(C) void function(GstDataQueue* queue) nothrow;
__gshared c_gst_data_queue_flushFn c_gst_data_queue_flush; ///
private alias c_gst_data_queue_get_levelFn = extern(C) void function(GstDataQueue* queue, GstDataQueueSize* level) nothrow;
__gshared c_gst_data_queue_get_levelFn c_gst_data_queue_get_level; ///
private alias c_gst_data_queue_is_emptyFn = extern(C) gboolean function(GstDataQueue* queue) nothrow;
__gshared c_gst_data_queue_is_emptyFn c_gst_data_queue_is_empty; ///
private alias c_gst_data_queue_is_fullFn = extern(C) gboolean function(GstDataQueue* queue) nothrow;
__gshared c_gst_data_queue_is_fullFn c_gst_data_queue_is_full; ///
private alias c_gst_data_queue_limits_changedFn = extern(C) void function(GstDataQueue* queue) nothrow;
__gshared c_gst_data_queue_limits_changedFn c_gst_data_queue_limits_changed; ///
private alias c_gst_data_queue_peekFn = extern(C) gboolean function(GstDataQueue* queue, GstDataQueueItem** item) nothrow;
__gshared c_gst_data_queue_peekFn c_gst_data_queue_peek; ///
private alias c_gst_data_queue_popFn = extern(C) gboolean function(GstDataQueue* queue, GstDataQueueItem** item) nothrow;
__gshared c_gst_data_queue_popFn c_gst_data_queue_pop; ///
private alias c_gst_data_queue_pushFn = extern(C) gboolean function(GstDataQueue* queue, GstDataQueueItem* item) nothrow;
__gshared c_gst_data_queue_pushFn c_gst_data_queue_push; ///
private alias c_gst_data_queue_push_forceFn = extern(C) gboolean function(GstDataQueue* queue, GstDataQueueItem* item) nothrow;
__gshared c_gst_data_queue_push_forceFn c_gst_data_queue_push_force; ///
private alias c_gst_data_queue_set_flushingFn = extern(C) void function(GstDataQueue* queue, gboolean flushing) nothrow;
__gshared c_gst_data_queue_set_flushingFn c_gst_data_queue_set_flushing; ///

// FlowCombiner
private alias c_gst_flow_combiner_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_flow_combiner_get_typeFn c_gst_flow_combiner_get_type; ///
private alias c_gst_flow_combiner_newFn = extern(C) GstFlowCombiner* function() nothrow;
__gshared c_gst_flow_combiner_newFn c_gst_flow_combiner_new; ///
private alias c_gst_flow_combiner_add_padFn = extern(C) void function(GstFlowCombiner* combiner, GstPad* pad) nothrow;
__gshared c_gst_flow_combiner_add_padFn c_gst_flow_combiner_add_pad; ///
private alias c_gst_flow_combiner_clearFn = extern(C) void function(GstFlowCombiner* combiner) nothrow;
__gshared c_gst_flow_combiner_clearFn c_gst_flow_combiner_clear; ///
private alias c_gst_flow_combiner_freeFn = extern(C) void function(GstFlowCombiner* combiner) nothrow;
__gshared c_gst_flow_combiner_freeFn c_gst_flow_combiner_free; ///
private alias c_gst_flow_combiner_refFn = extern(C) GstFlowCombiner* function(GstFlowCombiner* combiner) nothrow;
__gshared c_gst_flow_combiner_refFn c_gst_flow_combiner_ref; ///
private alias c_gst_flow_combiner_remove_padFn = extern(C) void function(GstFlowCombiner* combiner, GstPad* pad) nothrow;
__gshared c_gst_flow_combiner_remove_padFn c_gst_flow_combiner_remove_pad; ///
private alias c_gst_flow_combiner_resetFn = extern(C) void function(GstFlowCombiner* combiner) nothrow;
__gshared c_gst_flow_combiner_resetFn c_gst_flow_combiner_reset; ///
private alias c_gst_flow_combiner_unrefFn = extern(C) void function(GstFlowCombiner* combiner) nothrow;
__gshared c_gst_flow_combiner_unrefFn c_gst_flow_combiner_unref; ///
private alias c_gst_flow_combiner_update_flowFn = extern(C) GstFlowReturn function(GstFlowCombiner* combiner, GstFlowReturn fret) nothrow;
__gshared c_gst_flow_combiner_update_flowFn c_gst_flow_combiner_update_flow; ///
private alias c_gst_flow_combiner_update_pad_flowFn = extern(C) GstFlowReturn function(GstFlowCombiner* combiner, GstPad* pad, GstFlowReturn fret) nothrow;
__gshared c_gst_flow_combiner_update_pad_flowFn c_gst_flow_combiner_update_pad_flow; ///

// PushSrc
private alias c_gst_push_src_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_push_src_get_typeFn c_gst_push_src_get_type; ///

// QueueArray
private alias c_gst_queue_array_clearFn = extern(C) void function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_clearFn c_gst_queue_array_clear; ///
private alias c_gst_queue_array_drop_elementFn = extern(C) void* function(GstQueueArray* array, uint idx) nothrow;
__gshared c_gst_queue_array_drop_elementFn c_gst_queue_array_drop_element; ///
private alias c_gst_queue_array_drop_structFn = extern(C) gboolean function(GstQueueArray* array, uint idx, void* pStruct) nothrow;
__gshared c_gst_queue_array_drop_structFn c_gst_queue_array_drop_struct; ///
private alias c_gst_queue_array_findFn = extern(C) uint function(GstQueueArray* array, GCompareFunc func, void* data) nothrow;
__gshared c_gst_queue_array_findFn c_gst_queue_array_find; ///
private alias c_gst_queue_array_freeFn = extern(C) void function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_freeFn c_gst_queue_array_free; ///
private alias c_gst_queue_array_get_lengthFn = extern(C) uint function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_get_lengthFn c_gst_queue_array_get_length; ///
private alias c_gst_queue_array_is_emptyFn = extern(C) gboolean function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_is_emptyFn c_gst_queue_array_is_empty; ///
private alias c_gst_queue_array_peek_headFn = extern(C) void* function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_peek_headFn c_gst_queue_array_peek_head; ///
private alias c_gst_queue_array_peek_head_structFn = extern(C) void* function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_peek_head_structFn c_gst_queue_array_peek_head_struct; ///
private alias c_gst_queue_array_peek_nthFn = extern(C) void* function(GstQueueArray* array, uint idx) nothrow;
__gshared c_gst_queue_array_peek_nthFn c_gst_queue_array_peek_nth; ///
private alias c_gst_queue_array_peek_nth_structFn = extern(C) void* function(GstQueueArray* array, uint idx) nothrow;
__gshared c_gst_queue_array_peek_nth_structFn c_gst_queue_array_peek_nth_struct; ///
private alias c_gst_queue_array_peek_tailFn = extern(C) void* function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_peek_tailFn c_gst_queue_array_peek_tail; ///
private alias c_gst_queue_array_peek_tail_structFn = extern(C) void* function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_peek_tail_structFn c_gst_queue_array_peek_tail_struct; ///
private alias c_gst_queue_array_pop_headFn = extern(C) void* function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_pop_headFn c_gst_queue_array_pop_head; ///
private alias c_gst_queue_array_pop_head_structFn = extern(C) void* function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_pop_head_structFn c_gst_queue_array_pop_head_struct; ///
private alias c_gst_queue_array_pop_tailFn = extern(C) void* function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_pop_tailFn c_gst_queue_array_pop_tail; ///
private alias c_gst_queue_array_pop_tail_structFn = extern(C) void* function(GstQueueArray* array) nothrow;
__gshared c_gst_queue_array_pop_tail_structFn c_gst_queue_array_pop_tail_struct; ///
private alias c_gst_queue_array_push_sortedFn = extern(C) void function(GstQueueArray* array, void* data, GCompareDataFunc func, void* userData) nothrow;
__gshared c_gst_queue_array_push_sortedFn c_gst_queue_array_push_sorted; ///
private alias c_gst_queue_array_push_sorted_structFn = extern(C) void function(GstQueueArray* array, void* pStruct, GCompareDataFunc func, void* userData) nothrow;
__gshared c_gst_queue_array_push_sorted_structFn c_gst_queue_array_push_sorted_struct; ///
private alias c_gst_queue_array_push_tailFn = extern(C) void function(GstQueueArray* array, void* data) nothrow;
__gshared c_gst_queue_array_push_tailFn c_gst_queue_array_push_tail; ///
private alias c_gst_queue_array_push_tail_structFn = extern(C) void function(GstQueueArray* array, void* pStruct) nothrow;
__gshared c_gst_queue_array_push_tail_structFn c_gst_queue_array_push_tail_struct; ///
private alias c_gst_queue_array_set_clear_funcFn = extern(C) void function(GstQueueArray* array, GDestroyNotify clearFunc) nothrow;
__gshared c_gst_queue_array_set_clear_funcFn c_gst_queue_array_set_clear_func; ///
private alias c_gst_queue_array_sortFn = extern(C) void function(GstQueueArray* array, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_gst_queue_array_sortFn c_gst_queue_array_sort; ///
private alias c_gst_queue_array_newFn = extern(C) GstQueueArray* function(uint initialSize) nothrow;
__gshared c_gst_queue_array_newFn c_gst_queue_array_new; ///
private alias c_gst_queue_array_new_for_structFn = extern(C) GstQueueArray* function(size_t structSize, uint initialSize) nothrow;
__gshared c_gst_queue_array_new_for_structFn c_gst_queue_array_new_for_struct; ///

// TypeFindData
private alias c_gst_type_find_data_freeFn = extern(C) void function(GstTypeFindData* data) nothrow;
__gshared c_gst_type_find_data_freeFn c_gst_type_find_data_free; ///
private alias c_gst_type_find_data_get_capsFn = extern(C) GstCaps* function(GstTypeFindData* data) nothrow;
__gshared c_gst_type_find_data_get_capsFn c_gst_type_find_data_get_caps; ///
private alias c_gst_type_find_data_get_probabilityFn = extern(C) GstTypeFindProbability function(GstTypeFindData* data) nothrow;
__gshared c_gst_type_find_data_get_probabilityFn c_gst_type_find_data_get_probability; ///
private alias c_gst_type_find_data_get_typefindFn = extern(C) GstTypeFind* function(GstTypeFindData* data) nothrow;
__gshared c_gst_type_find_data_get_typefindFn c_gst_type_find_data_get_typefind; ///
private alias c_gst_type_find_data_newFn = extern(C) GstTypeFindData* function(GstObject* obj, const(ubyte)* data, size_t size) nothrow;
__gshared c_gst_type_find_data_newFn c_gst_type_find_data_new; ///

// global
private alias c_gst_type_find_helperFn = extern(C) GstCaps* function(GstPad* src, ulong size) nothrow;
__gshared c_gst_type_find_helperFn c_gst_type_find_helper; ///
private alias c_gst_type_find_helper_for_bufferFn = extern(C) GstCaps* function(GstObject* obj, GstBuffer* buf, GstTypeFindProbability* prob) nothrow;
__gshared c_gst_type_find_helper_for_bufferFn c_gst_type_find_helper_for_buffer; ///
private alias c_gst_type_find_helper_for_buffer_with_capsFn = extern(C) GstCaps* function(GstObject* obj, GstBuffer* buf, GstCaps* caps, GstTypeFindProbability* prob) nothrow;
__gshared c_gst_type_find_helper_for_buffer_with_capsFn c_gst_type_find_helper_for_buffer_with_caps; ///
private alias c_gst_type_find_helper_for_buffer_with_extensionFn = extern(C) GstCaps* function(GstObject* obj, GstBuffer* buf, const(char)* extension, GstTypeFindProbability* prob) nothrow;
__gshared c_gst_type_find_helper_for_buffer_with_extensionFn c_gst_type_find_helper_for_buffer_with_extension; ///
private alias c_gst_type_find_helper_for_dataFn = extern(C) GstCaps* function(GstObject* obj, const(ubyte)* data, size_t size, GstTypeFindProbability* prob) nothrow;
__gshared c_gst_type_find_helper_for_dataFn c_gst_type_find_helper_for_data; ///
private alias c_gst_type_find_helper_for_data_with_capsFn = extern(C) GstCaps* function(GstObject* obj, const(ubyte)* data, size_t size, GstCaps* caps, GstTypeFindProbability* prob) nothrow;
__gshared c_gst_type_find_helper_for_data_with_capsFn c_gst_type_find_helper_for_data_with_caps; ///
private alias c_gst_type_find_helper_for_data_with_extensionFn = extern(C) GstCaps* function(GstObject* obj, const(ubyte)* data, size_t size, const(char)* extension, GstTypeFindProbability* prob) nothrow;
__gshared c_gst_type_find_helper_for_data_with_extensionFn c_gst_type_find_helper_for_data_with_extension; ///
private alias c_gst_type_find_helper_for_extensionFn = extern(C) GstCaps* function(GstObject* obj, const(char)* extension) nothrow;
__gshared c_gst_type_find_helper_for_extensionFn c_gst_type_find_helper_for_extension; ///
private alias c_gst_type_find_helper_get_rangeFn = extern(C) GstCaps* function(GstObject* obj, GstObject* parent, GstTypeFindHelperGetRangeFunction func, ulong size, const(char)* extension, GstTypeFindProbability* prob) nothrow;
__gshared c_gst_type_find_helper_get_rangeFn c_gst_type_find_helper_get_range; ///
private alias c_gst_type_find_helper_get_range_fullFn = extern(C) GstFlowReturn function(GstObject* obj, GstObject* parent, GstTypeFindHelperGetRangeFunction func, ulong size, const(char)* extension, GstCaps** caps, GstTypeFindProbability* prob) nothrow;
__gshared c_gst_type_find_helper_get_range_fullFn c_gst_type_find_helper_get_range_full; ///
private alias c_gst_type_find_list_factories_for_capsFn = extern(C) GList* function(GstObject* obj, GstCaps* caps) nothrow;
__gshared c_gst_type_find_list_factories_for_capsFn c_gst_type_find_list_factories_for_caps; ///

// Adapter

/** */
alias gst_adapter_get_type = c_gst_adapter_get_type;

/** */
alias gst_adapter_new = c_gst_adapter_new;

/** */
alias gst_adapter_available = c_gst_adapter_available;

/** */
alias gst_adapter_available_fast = c_gst_adapter_available_fast;

/** */
alias gst_adapter_clear = c_gst_adapter_clear;

/** */
alias gst_adapter_copy = c_gst_adapter_copy;

/** */
alias gst_adapter_copy_bytes = c_gst_adapter_copy_bytes;

/** */
alias gst_adapter_distance_from_discont = c_gst_adapter_distance_from_discont;

/** */
alias gst_adapter_dts_at_discont = c_gst_adapter_dts_at_discont;

/** */
alias gst_adapter_flush = c_gst_adapter_flush;

/** */
alias gst_adapter_get_buffer = c_gst_adapter_get_buffer;

/** */
alias gst_adapter_get_buffer_fast = c_gst_adapter_get_buffer_fast;

/** */
alias gst_adapter_get_buffer_list = c_gst_adapter_get_buffer_list;

/** */
alias gst_adapter_get_list = c_gst_adapter_get_list;

/** */
alias gst_adapter_map = c_gst_adapter_map;

/** */
alias gst_adapter_masked_scan_uint32 = c_gst_adapter_masked_scan_uint32;

/** */
alias gst_adapter_masked_scan_uint32_peek = c_gst_adapter_masked_scan_uint32_peek;

/** */
alias gst_adapter_offset_at_discont = c_gst_adapter_offset_at_discont;

/** */
alias gst_adapter_prev_dts = c_gst_adapter_prev_dts;

/** */
alias gst_adapter_prev_dts_at_offset = c_gst_adapter_prev_dts_at_offset;

/** */
alias gst_adapter_prev_offset = c_gst_adapter_prev_offset;

/** */
alias gst_adapter_prev_pts = c_gst_adapter_prev_pts;

/** */
alias gst_adapter_prev_pts_at_offset = c_gst_adapter_prev_pts_at_offset;

/** */
alias gst_adapter_pts_at_discont = c_gst_adapter_pts_at_discont;

/** */
alias gst_adapter_push = c_gst_adapter_push;

/** */
alias gst_adapter_take = c_gst_adapter_take;

/** */
alias gst_adapter_take_buffer = c_gst_adapter_take_buffer;

/** */
alias gst_adapter_take_buffer_fast = c_gst_adapter_take_buffer_fast;

/** */
alias gst_adapter_take_buffer_list = c_gst_adapter_take_buffer_list;

/** */
alias gst_adapter_take_list = c_gst_adapter_take_list;

/** */
alias gst_adapter_unmap = c_gst_adapter_unmap;

// Aggregator

/** */
alias gst_aggregator_get_type = c_gst_aggregator_get_type;

/** */
alias gst_aggregator_finish_buffer = c_gst_aggregator_finish_buffer;

/** */
alias gst_aggregator_finish_buffer_list = c_gst_aggregator_finish_buffer_list;

/** */
alias gst_aggregator_get_allocator = c_gst_aggregator_get_allocator;

/** */
alias gst_aggregator_get_buffer_pool = c_gst_aggregator_get_buffer_pool;

/** */
alias gst_aggregator_get_force_live = c_gst_aggregator_get_force_live;

/** */
alias gst_aggregator_get_ignore_inactive_pads = c_gst_aggregator_get_ignore_inactive_pads;

/** */
alias gst_aggregator_get_latency = c_gst_aggregator_get_latency;

/** */
alias gst_aggregator_negotiate = c_gst_aggregator_negotiate;

/** */
alias gst_aggregator_peek_next_sample = c_gst_aggregator_peek_next_sample;

/** */
alias gst_aggregator_push_src_event = c_gst_aggregator_push_src_event;

/** */
alias gst_aggregator_selected_samples = c_gst_aggregator_selected_samples;

/** */
alias gst_aggregator_set_force_live = c_gst_aggregator_set_force_live;

/** */
alias gst_aggregator_set_ignore_inactive_pads = c_gst_aggregator_set_ignore_inactive_pads;

/** */
alias gst_aggregator_set_latency = c_gst_aggregator_set_latency;

/** */
alias gst_aggregator_set_src_caps = c_gst_aggregator_set_src_caps;

/** */
alias gst_aggregator_simple_get_next_time = c_gst_aggregator_simple_get_next_time;

/** */
alias gst_aggregator_update_segment = c_gst_aggregator_update_segment;

// AggregatorPad

/** */
alias gst_aggregator_pad_get_type = c_gst_aggregator_pad_get_type;

/** */
alias gst_aggregator_pad_drop_buffer = c_gst_aggregator_pad_drop_buffer;

/** */
alias gst_aggregator_pad_has_buffer = c_gst_aggregator_pad_has_buffer;

/** */
alias gst_aggregator_pad_is_eos = c_gst_aggregator_pad_is_eos;

/** */
alias gst_aggregator_pad_is_inactive = c_gst_aggregator_pad_is_inactive;

/** */
alias gst_aggregator_pad_peek_buffer = c_gst_aggregator_pad_peek_buffer;

/** */
alias gst_aggregator_pad_pop_buffer = c_gst_aggregator_pad_pop_buffer;

// BaseParse

/** */
alias gst_base_parse_get_type = c_gst_base_parse_get_type;

/** */
alias gst_base_parse_add_index_entry = c_gst_base_parse_add_index_entry;

/** */
alias gst_base_parse_convert_default = c_gst_base_parse_convert_default;

/** */
alias gst_base_parse_drain = c_gst_base_parse_drain;

/** */
alias gst_base_parse_finish_frame = c_gst_base_parse_finish_frame;

/** */
alias gst_base_parse_merge_tags = c_gst_base_parse_merge_tags;

/** */
alias gst_base_parse_push_frame = c_gst_base_parse_push_frame;

/** */
alias gst_base_parse_set_average_bitrate = c_gst_base_parse_set_average_bitrate;

/** */
alias gst_base_parse_set_duration = c_gst_base_parse_set_duration;

/** */
alias gst_base_parse_set_frame_rate = c_gst_base_parse_set_frame_rate;

/** */
alias gst_base_parse_set_has_timing_info = c_gst_base_parse_set_has_timing_info;

/** */
alias gst_base_parse_set_infer_ts = c_gst_base_parse_set_infer_ts;

/** */
alias gst_base_parse_set_latency = c_gst_base_parse_set_latency;

/** */
alias gst_base_parse_set_min_frame_size = c_gst_base_parse_set_min_frame_size;

/** */
alias gst_base_parse_set_passthrough = c_gst_base_parse_set_passthrough;

/** */
alias gst_base_parse_set_pts_interpolation = c_gst_base_parse_set_pts_interpolation;

/** */
alias gst_base_parse_set_syncable = c_gst_base_parse_set_syncable;

/** */
alias gst_base_parse_set_ts_at_offset = c_gst_base_parse_set_ts_at_offset;

// BaseParseFrame

/** */
alias gst_base_parse_frame_get_type = c_gst_base_parse_frame_get_type;

/** */
alias gst_base_parse_frame_new = c_gst_base_parse_frame_new;

/** */
alias gst_base_parse_frame_copy = c_gst_base_parse_frame_copy;

/** */
alias gst_base_parse_frame_free = c_gst_base_parse_frame_free;

/** */
alias gst_base_parse_frame_init = c_gst_base_parse_frame_init;

// BaseSink

/** */
alias gst_base_sink_get_type = c_gst_base_sink_get_type;

/** */
alias gst_base_sink_do_preroll = c_gst_base_sink_do_preroll;

/** */
alias gst_base_sink_get_blocksize = c_gst_base_sink_get_blocksize;

/** */
alias gst_base_sink_get_drop_out_of_segment = c_gst_base_sink_get_drop_out_of_segment;

/** */
alias gst_base_sink_get_last_sample = c_gst_base_sink_get_last_sample;

/** */
alias gst_base_sink_get_latency = c_gst_base_sink_get_latency;

/** */
alias gst_base_sink_get_max_bitrate = c_gst_base_sink_get_max_bitrate;

/** */
alias gst_base_sink_get_max_lateness = c_gst_base_sink_get_max_lateness;

/** */
alias gst_base_sink_get_processing_deadline = c_gst_base_sink_get_processing_deadline;

/** */
alias gst_base_sink_get_render_delay = c_gst_base_sink_get_render_delay;

/** */
alias gst_base_sink_get_stats = c_gst_base_sink_get_stats;

/** */
alias gst_base_sink_get_sync = c_gst_base_sink_get_sync;

/** */
alias gst_base_sink_get_throttle_time = c_gst_base_sink_get_throttle_time;

/** */
alias gst_base_sink_get_ts_offset = c_gst_base_sink_get_ts_offset;

/** */
alias gst_base_sink_is_async_enabled = c_gst_base_sink_is_async_enabled;

/** */
alias gst_base_sink_is_last_sample_enabled = c_gst_base_sink_is_last_sample_enabled;

/** */
alias gst_base_sink_is_qos_enabled = c_gst_base_sink_is_qos_enabled;

/** */
alias gst_base_sink_query_latency = c_gst_base_sink_query_latency;

/** */
alias gst_base_sink_set_async_enabled = c_gst_base_sink_set_async_enabled;

/** */
alias gst_base_sink_set_blocksize = c_gst_base_sink_set_blocksize;

/** */
alias gst_base_sink_set_drop_out_of_segment = c_gst_base_sink_set_drop_out_of_segment;

/** */
alias gst_base_sink_set_last_sample_enabled = c_gst_base_sink_set_last_sample_enabled;

/** */
alias gst_base_sink_set_max_bitrate = c_gst_base_sink_set_max_bitrate;

/** */
alias gst_base_sink_set_max_lateness = c_gst_base_sink_set_max_lateness;

/** */
alias gst_base_sink_set_processing_deadline = c_gst_base_sink_set_processing_deadline;

/** */
alias gst_base_sink_set_qos_enabled = c_gst_base_sink_set_qos_enabled;

/** */
alias gst_base_sink_set_render_delay = c_gst_base_sink_set_render_delay;

/** */
alias gst_base_sink_set_sync = c_gst_base_sink_set_sync;

/** */
alias gst_base_sink_set_throttle_time = c_gst_base_sink_set_throttle_time;

/** */
alias gst_base_sink_set_ts_offset = c_gst_base_sink_set_ts_offset;

/** */
alias gst_base_sink_wait = c_gst_base_sink_wait;

/** */
alias gst_base_sink_wait_clock = c_gst_base_sink_wait_clock;

/** */
alias gst_base_sink_wait_preroll = c_gst_base_sink_wait_preroll;

// BaseSrc

/** */
alias gst_base_src_get_type = c_gst_base_src_get_type;

/** */
alias gst_base_src_get_allocator = c_gst_base_src_get_allocator;

/** */
alias gst_base_src_get_blocksize = c_gst_base_src_get_blocksize;

/** */
alias gst_base_src_get_buffer_pool = c_gst_base_src_get_buffer_pool;

/** */
alias gst_base_src_get_do_timestamp = c_gst_base_src_get_do_timestamp;

/** */
alias gst_base_src_is_async = c_gst_base_src_is_async;

/** */
alias gst_base_src_is_live = c_gst_base_src_is_live;

/** */
alias gst_base_src_negotiate = c_gst_base_src_negotiate;

/** */
alias gst_base_src_new_seamless_segment = c_gst_base_src_new_seamless_segment;

/** */
alias gst_base_src_new_segment = c_gst_base_src_new_segment;

/** */
alias gst_base_src_push_segment = c_gst_base_src_push_segment;

/** */
alias gst_base_src_query_latency = c_gst_base_src_query_latency;

/** */
alias gst_base_src_set_async = c_gst_base_src_set_async;

/** */
alias gst_base_src_set_automatic_eos = c_gst_base_src_set_automatic_eos;

/** */
alias gst_base_src_set_blocksize = c_gst_base_src_set_blocksize;

/** */
alias gst_base_src_set_caps = c_gst_base_src_set_caps;

/** */
alias gst_base_src_set_do_timestamp = c_gst_base_src_set_do_timestamp;

/** */
alias gst_base_src_set_dynamic_size = c_gst_base_src_set_dynamic_size;

/** */
alias gst_base_src_set_format = c_gst_base_src_set_format;

/** */
alias gst_base_src_set_live = c_gst_base_src_set_live;

/** */
alias gst_base_src_start_complete = c_gst_base_src_start_complete;

/** */
alias gst_base_src_start_wait = c_gst_base_src_start_wait;

/** */
alias gst_base_src_submit_buffer_list = c_gst_base_src_submit_buffer_list;

/** */
alias gst_base_src_wait_playing = c_gst_base_src_wait_playing;

// BaseTransform

/** */
alias gst_base_transform_get_type = c_gst_base_transform_get_type;

/** */
alias gst_base_transform_get_allocator = c_gst_base_transform_get_allocator;

/** */
alias gst_base_transform_get_buffer_pool = c_gst_base_transform_get_buffer_pool;

/** */
alias gst_base_transform_is_in_place = c_gst_base_transform_is_in_place;

/** */
alias gst_base_transform_is_passthrough = c_gst_base_transform_is_passthrough;

/** */
alias gst_base_transform_is_qos_enabled = c_gst_base_transform_is_qos_enabled;

/** */
alias gst_base_transform_reconfigure = c_gst_base_transform_reconfigure;

/** */
alias gst_base_transform_reconfigure_sink = c_gst_base_transform_reconfigure_sink;

/** */
alias gst_base_transform_reconfigure_src = c_gst_base_transform_reconfigure_src;

/** */
alias gst_base_transform_set_gap_aware = c_gst_base_transform_set_gap_aware;

/** */
alias gst_base_transform_set_in_place = c_gst_base_transform_set_in_place;

/** */
alias gst_base_transform_set_passthrough = c_gst_base_transform_set_passthrough;

/** */
alias gst_base_transform_set_prefer_passthrough = c_gst_base_transform_set_prefer_passthrough;

/** */
alias gst_base_transform_set_qos_enabled = c_gst_base_transform_set_qos_enabled;

/** */
alias gst_base_transform_update_qos = c_gst_base_transform_update_qos;

/** */
alias gst_base_transform_update_src_caps = c_gst_base_transform_update_src_caps;

// BitReader

/** */
alias gst_bit_reader_free = c_gst_bit_reader_free;

/** */
alias gst_bit_reader_get_bits_uint16 = c_gst_bit_reader_get_bits_uint16;

/** */
alias gst_bit_reader_get_bits_uint32 = c_gst_bit_reader_get_bits_uint32;

/** */
alias gst_bit_reader_get_bits_uint64 = c_gst_bit_reader_get_bits_uint64;

/** */
alias gst_bit_reader_get_bits_uint8 = c_gst_bit_reader_get_bits_uint8;

/** */
alias gst_bit_reader_get_pos = c_gst_bit_reader_get_pos;

/** */
alias gst_bit_reader_get_remaining = c_gst_bit_reader_get_remaining;

/** */
alias gst_bit_reader_get_size = c_gst_bit_reader_get_size;

/** */
alias gst_bit_reader_init = c_gst_bit_reader_init;

/** */
alias gst_bit_reader_peek_bits_uint16 = c_gst_bit_reader_peek_bits_uint16;

/** */
alias gst_bit_reader_peek_bits_uint32 = c_gst_bit_reader_peek_bits_uint32;

/** */
alias gst_bit_reader_peek_bits_uint64 = c_gst_bit_reader_peek_bits_uint64;

/** */
alias gst_bit_reader_peek_bits_uint8 = c_gst_bit_reader_peek_bits_uint8;

/** */
alias gst_bit_reader_set_pos = c_gst_bit_reader_set_pos;

/** */
alias gst_bit_reader_skip = c_gst_bit_reader_skip;

/** */
alias gst_bit_reader_skip_to_byte = c_gst_bit_reader_skip_to_byte;

/** */
alias gst_bit_reader_new = c_gst_bit_reader_new;

// BitWriter

/** */
alias gst_bit_writer_align_bytes = c_gst_bit_writer_align_bytes;

/** */
alias gst_bit_writer_free = c_gst_bit_writer_free;

/** */
alias gst_bit_writer_free_and_get_buffer = c_gst_bit_writer_free_and_get_buffer;

/** */
alias gst_bit_writer_free_and_get_data = c_gst_bit_writer_free_and_get_data;

/** */
alias gst_bit_writer_get_data = c_gst_bit_writer_get_data;

/** */
alias gst_bit_writer_get_remaining = c_gst_bit_writer_get_remaining;

/** */
alias gst_bit_writer_get_size = c_gst_bit_writer_get_size;

/** */
alias gst_bit_writer_init = c_gst_bit_writer_init;

/** */
alias gst_bit_writer_init_with_data = c_gst_bit_writer_init_with_data;

/** */
alias gst_bit_writer_init_with_size = c_gst_bit_writer_init_with_size;

/** */
alias gst_bit_writer_put_bits_uint16 = c_gst_bit_writer_put_bits_uint16;

/** */
alias gst_bit_writer_put_bits_uint32 = c_gst_bit_writer_put_bits_uint32;

/** */
alias gst_bit_writer_put_bits_uint64 = c_gst_bit_writer_put_bits_uint64;

/** */
alias gst_bit_writer_put_bits_uint8 = c_gst_bit_writer_put_bits_uint8;

/** */
alias gst_bit_writer_put_bytes = c_gst_bit_writer_put_bytes;

/** */
alias gst_bit_writer_reset = c_gst_bit_writer_reset;

/** */
alias gst_bit_writer_reset_and_get_buffer = c_gst_bit_writer_reset_and_get_buffer;

/** */
alias gst_bit_writer_reset_and_get_data = c_gst_bit_writer_reset_and_get_data;

/** */
alias gst_bit_writer_set_pos = c_gst_bit_writer_set_pos;

/** */
alias gst_bit_writer_new = c_gst_bit_writer_new;

/** */
alias gst_bit_writer_new_with_data = c_gst_bit_writer_new_with_data;

/** */
alias gst_bit_writer_new_with_size = c_gst_bit_writer_new_with_size;

// ByteReader

/** */
alias gst_byte_reader_dup_data = c_gst_byte_reader_dup_data;

/** */
alias gst_byte_reader_dup_string_utf16 = c_gst_byte_reader_dup_string_utf16;

/** */
alias gst_byte_reader_dup_string_utf32 = c_gst_byte_reader_dup_string_utf32;

/** */
alias gst_byte_reader_dup_string_utf8 = c_gst_byte_reader_dup_string_utf8;

/** */
alias gst_byte_reader_free = c_gst_byte_reader_free;

/** */
alias gst_byte_reader_get_data = c_gst_byte_reader_get_data;

/** */
alias gst_byte_reader_get_float32_be = c_gst_byte_reader_get_float32_be;

/** */
alias gst_byte_reader_get_float32_le = c_gst_byte_reader_get_float32_le;

/** */
alias gst_byte_reader_get_float64_be = c_gst_byte_reader_get_float64_be;

/** */
alias gst_byte_reader_get_float64_le = c_gst_byte_reader_get_float64_le;

/** */
alias gst_byte_reader_get_int16_be = c_gst_byte_reader_get_int16_be;

/** */
alias gst_byte_reader_get_int16_le = c_gst_byte_reader_get_int16_le;

/** */
alias gst_byte_reader_get_int24_be = c_gst_byte_reader_get_int24_be;

/** */
alias gst_byte_reader_get_int24_le = c_gst_byte_reader_get_int24_le;

/** */
alias gst_byte_reader_get_int32_be = c_gst_byte_reader_get_int32_be;

/** */
alias gst_byte_reader_get_int32_le = c_gst_byte_reader_get_int32_le;

/** */
alias gst_byte_reader_get_int64_be = c_gst_byte_reader_get_int64_be;

/** */
alias gst_byte_reader_get_int64_le = c_gst_byte_reader_get_int64_le;

/** */
alias gst_byte_reader_get_int8 = c_gst_byte_reader_get_int8;

/** */
alias gst_byte_reader_get_pos = c_gst_byte_reader_get_pos;

/** */
alias gst_byte_reader_get_remaining = c_gst_byte_reader_get_remaining;

/** */
alias gst_byte_reader_get_size = c_gst_byte_reader_get_size;

/** */
alias gst_byte_reader_get_string_utf8 = c_gst_byte_reader_get_string_utf8;

/** */
alias gst_byte_reader_get_sub_reader = c_gst_byte_reader_get_sub_reader;

/** */
alias gst_byte_reader_get_uint16_be = c_gst_byte_reader_get_uint16_be;

/** */
alias gst_byte_reader_get_uint16_le = c_gst_byte_reader_get_uint16_le;

/** */
alias gst_byte_reader_get_uint24_be = c_gst_byte_reader_get_uint24_be;

/** */
alias gst_byte_reader_get_uint24_le = c_gst_byte_reader_get_uint24_le;

/** */
alias gst_byte_reader_get_uint32_be = c_gst_byte_reader_get_uint32_be;

/** */
alias gst_byte_reader_get_uint32_le = c_gst_byte_reader_get_uint32_le;

/** */
alias gst_byte_reader_get_uint64_be = c_gst_byte_reader_get_uint64_be;

/** */
alias gst_byte_reader_get_uint64_le = c_gst_byte_reader_get_uint64_le;

/** */
alias gst_byte_reader_get_uint8 = c_gst_byte_reader_get_uint8;

/** */
alias gst_byte_reader_init = c_gst_byte_reader_init;

/** */
alias gst_byte_reader_masked_scan_uint32 = c_gst_byte_reader_masked_scan_uint32;

/** */
alias gst_byte_reader_masked_scan_uint32_peek = c_gst_byte_reader_masked_scan_uint32_peek;

/** */
alias gst_byte_reader_peek_data = c_gst_byte_reader_peek_data;

/** */
alias gst_byte_reader_peek_float32_be = c_gst_byte_reader_peek_float32_be;

/** */
alias gst_byte_reader_peek_float32_le = c_gst_byte_reader_peek_float32_le;

/** */
alias gst_byte_reader_peek_float64_be = c_gst_byte_reader_peek_float64_be;

/** */
alias gst_byte_reader_peek_float64_le = c_gst_byte_reader_peek_float64_le;

/** */
alias gst_byte_reader_peek_int16_be = c_gst_byte_reader_peek_int16_be;

/** */
alias gst_byte_reader_peek_int16_le = c_gst_byte_reader_peek_int16_le;

/** */
alias gst_byte_reader_peek_int24_be = c_gst_byte_reader_peek_int24_be;

/** */
alias gst_byte_reader_peek_int24_le = c_gst_byte_reader_peek_int24_le;

/** */
alias gst_byte_reader_peek_int32_be = c_gst_byte_reader_peek_int32_be;

/** */
alias gst_byte_reader_peek_int32_le = c_gst_byte_reader_peek_int32_le;

/** */
alias gst_byte_reader_peek_int64_be = c_gst_byte_reader_peek_int64_be;

/** */
alias gst_byte_reader_peek_int64_le = c_gst_byte_reader_peek_int64_le;

/** */
alias gst_byte_reader_peek_int8 = c_gst_byte_reader_peek_int8;

/** */
alias gst_byte_reader_peek_string_utf8 = c_gst_byte_reader_peek_string_utf8;

/** */
alias gst_byte_reader_peek_sub_reader = c_gst_byte_reader_peek_sub_reader;

/** */
alias gst_byte_reader_peek_uint16_be = c_gst_byte_reader_peek_uint16_be;

/** */
alias gst_byte_reader_peek_uint16_le = c_gst_byte_reader_peek_uint16_le;

/** */
alias gst_byte_reader_peek_uint24_be = c_gst_byte_reader_peek_uint24_be;

/** */
alias gst_byte_reader_peek_uint24_le = c_gst_byte_reader_peek_uint24_le;

/** */
alias gst_byte_reader_peek_uint32_be = c_gst_byte_reader_peek_uint32_be;

/** */
alias gst_byte_reader_peek_uint32_le = c_gst_byte_reader_peek_uint32_le;

/** */
alias gst_byte_reader_peek_uint64_be = c_gst_byte_reader_peek_uint64_be;

/** */
alias gst_byte_reader_peek_uint64_le = c_gst_byte_reader_peek_uint64_le;

/** */
alias gst_byte_reader_peek_uint8 = c_gst_byte_reader_peek_uint8;

/** */
alias gst_byte_reader_set_pos = c_gst_byte_reader_set_pos;

/** */
alias gst_byte_reader_skip = c_gst_byte_reader_skip;

/** */
alias gst_byte_reader_skip_string_utf16 = c_gst_byte_reader_skip_string_utf16;

/** */
alias gst_byte_reader_skip_string_utf32 = c_gst_byte_reader_skip_string_utf32;

/** */
alias gst_byte_reader_skip_string_utf8 = c_gst_byte_reader_skip_string_utf8;

/** */
alias gst_byte_reader_new = c_gst_byte_reader_new;

// ByteWriter

/** */
alias gst_byte_writer_ensure_free_space = c_gst_byte_writer_ensure_free_space;

/** */
alias gst_byte_writer_fill = c_gst_byte_writer_fill;

/** */
alias gst_byte_writer_free = c_gst_byte_writer_free;

/** */
alias gst_byte_writer_free_and_get_buffer = c_gst_byte_writer_free_and_get_buffer;

/** */
alias gst_byte_writer_free_and_get_data = c_gst_byte_writer_free_and_get_data;

/** */
alias gst_byte_writer_get_remaining = c_gst_byte_writer_get_remaining;

/** */
alias gst_byte_writer_init = c_gst_byte_writer_init;

/** */
alias gst_byte_writer_init_with_data = c_gst_byte_writer_init_with_data;

/** */
alias gst_byte_writer_init_with_size = c_gst_byte_writer_init_with_size;

/** */
alias gst_byte_writer_put_buffer = c_gst_byte_writer_put_buffer;

/** */
alias gst_byte_writer_put_data = c_gst_byte_writer_put_data;

/** */
alias gst_byte_writer_put_float32_be = c_gst_byte_writer_put_float32_be;

/** */
alias gst_byte_writer_put_float32_le = c_gst_byte_writer_put_float32_le;

/** */
alias gst_byte_writer_put_float64_be = c_gst_byte_writer_put_float64_be;

/** */
alias gst_byte_writer_put_float64_le = c_gst_byte_writer_put_float64_le;

/** */
alias gst_byte_writer_put_int16_be = c_gst_byte_writer_put_int16_be;

/** */
alias gst_byte_writer_put_int16_le = c_gst_byte_writer_put_int16_le;

/** */
alias gst_byte_writer_put_int24_be = c_gst_byte_writer_put_int24_be;

/** */
alias gst_byte_writer_put_int24_le = c_gst_byte_writer_put_int24_le;

/** */
alias gst_byte_writer_put_int32_be = c_gst_byte_writer_put_int32_be;

/** */
alias gst_byte_writer_put_int32_le = c_gst_byte_writer_put_int32_le;

/** */
alias gst_byte_writer_put_int64_be = c_gst_byte_writer_put_int64_be;

/** */
alias gst_byte_writer_put_int64_le = c_gst_byte_writer_put_int64_le;

/** */
alias gst_byte_writer_put_int8 = c_gst_byte_writer_put_int8;

/** */
alias gst_byte_writer_put_string_utf16 = c_gst_byte_writer_put_string_utf16;

/** */
alias gst_byte_writer_put_string_utf32 = c_gst_byte_writer_put_string_utf32;

/** */
alias gst_byte_writer_put_string_utf8 = c_gst_byte_writer_put_string_utf8;

/** */
alias gst_byte_writer_put_uint16_be = c_gst_byte_writer_put_uint16_be;

/** */
alias gst_byte_writer_put_uint16_le = c_gst_byte_writer_put_uint16_le;

/** */
alias gst_byte_writer_put_uint24_be = c_gst_byte_writer_put_uint24_be;

/** */
alias gst_byte_writer_put_uint24_le = c_gst_byte_writer_put_uint24_le;

/** */
alias gst_byte_writer_put_uint32_be = c_gst_byte_writer_put_uint32_be;

/** */
alias gst_byte_writer_put_uint32_le = c_gst_byte_writer_put_uint32_le;

/** */
alias gst_byte_writer_put_uint64_be = c_gst_byte_writer_put_uint64_be;

/** */
alias gst_byte_writer_put_uint64_le = c_gst_byte_writer_put_uint64_le;

/** */
alias gst_byte_writer_put_uint8 = c_gst_byte_writer_put_uint8;

/** */
alias gst_byte_writer_reset = c_gst_byte_writer_reset;

/** */
alias gst_byte_writer_reset_and_get_buffer = c_gst_byte_writer_reset_and_get_buffer;

/** */
alias gst_byte_writer_reset_and_get_data = c_gst_byte_writer_reset_and_get_data;

/** */
alias gst_byte_writer_new = c_gst_byte_writer_new;

/** */
alias gst_byte_writer_new_with_data = c_gst_byte_writer_new_with_data;

/** */
alias gst_byte_writer_new_with_size = c_gst_byte_writer_new_with_size;

// CollectPads

/** */
alias gst_collect_pads_get_type = c_gst_collect_pads_get_type;

/** */
alias gst_collect_pads_new = c_gst_collect_pads_new;

/** */
alias gst_collect_pads_add_pad = c_gst_collect_pads_add_pad;

/** */
alias gst_collect_pads_available = c_gst_collect_pads_available;

/** */
alias gst_collect_pads_clip_running_time = c_gst_collect_pads_clip_running_time;

/** */
alias gst_collect_pads_event_default = c_gst_collect_pads_event_default;

/** */
alias gst_collect_pads_flush = c_gst_collect_pads_flush;

/** */
alias gst_collect_pads_peek = c_gst_collect_pads_peek;

/** */
alias gst_collect_pads_pop = c_gst_collect_pads_pop;

/** */
alias gst_collect_pads_query_default = c_gst_collect_pads_query_default;

/** */
alias gst_collect_pads_read_buffer = c_gst_collect_pads_read_buffer;

/** */
alias gst_collect_pads_remove_pad = c_gst_collect_pads_remove_pad;

/** */
alias gst_collect_pads_set_buffer_function = c_gst_collect_pads_set_buffer_function;

/** */
alias gst_collect_pads_set_clip_function = c_gst_collect_pads_set_clip_function;

/** */
alias gst_collect_pads_set_compare_function = c_gst_collect_pads_set_compare_function;

/** */
alias gst_collect_pads_set_event_function = c_gst_collect_pads_set_event_function;

/** */
alias gst_collect_pads_set_flush_function = c_gst_collect_pads_set_flush_function;

/** */
alias gst_collect_pads_set_flushing = c_gst_collect_pads_set_flushing;

/** */
alias gst_collect_pads_set_function = c_gst_collect_pads_set_function;

/** */
alias gst_collect_pads_set_query_function = c_gst_collect_pads_set_query_function;

/** */
alias gst_collect_pads_set_waiting = c_gst_collect_pads_set_waiting;

/** */
alias gst_collect_pads_src_event_default = c_gst_collect_pads_src_event_default;

/** */
alias gst_collect_pads_start = c_gst_collect_pads_start;

/** */
alias gst_collect_pads_stop = c_gst_collect_pads_stop;

/** */
alias gst_collect_pads_take_buffer = c_gst_collect_pads_take_buffer;

// DataQueue

/** */
alias gst_data_queue_get_type = c_gst_data_queue_get_type;

/** */
alias gst_data_queue_new = c_gst_data_queue_new;

/** */
alias gst_data_queue_drop_head = c_gst_data_queue_drop_head;

/** */
alias gst_data_queue_flush = c_gst_data_queue_flush;

/** */
alias gst_data_queue_get_level = c_gst_data_queue_get_level;

/** */
alias gst_data_queue_is_empty = c_gst_data_queue_is_empty;

/** */
alias gst_data_queue_is_full = c_gst_data_queue_is_full;

/** */
alias gst_data_queue_limits_changed = c_gst_data_queue_limits_changed;

/** */
alias gst_data_queue_peek = c_gst_data_queue_peek;

/** */
alias gst_data_queue_pop = c_gst_data_queue_pop;

/** */
alias gst_data_queue_push = c_gst_data_queue_push;

/** */
alias gst_data_queue_push_force = c_gst_data_queue_push_force;

/** */
alias gst_data_queue_set_flushing = c_gst_data_queue_set_flushing;

// FlowCombiner

/** */
alias gst_flow_combiner_get_type = c_gst_flow_combiner_get_type;

/** */
alias gst_flow_combiner_new = c_gst_flow_combiner_new;

/** */
alias gst_flow_combiner_add_pad = c_gst_flow_combiner_add_pad;

/** */
alias gst_flow_combiner_clear = c_gst_flow_combiner_clear;

/** */
alias gst_flow_combiner_free = c_gst_flow_combiner_free;

/** */
alias gst_flow_combiner_ref = c_gst_flow_combiner_ref;

/** */
alias gst_flow_combiner_remove_pad = c_gst_flow_combiner_remove_pad;

/** */
alias gst_flow_combiner_reset = c_gst_flow_combiner_reset;

/** */
alias gst_flow_combiner_unref = c_gst_flow_combiner_unref;

/** */
alias gst_flow_combiner_update_flow = c_gst_flow_combiner_update_flow;

/** */
alias gst_flow_combiner_update_pad_flow = c_gst_flow_combiner_update_pad_flow;

// PushSrc

/** */
alias gst_push_src_get_type = c_gst_push_src_get_type;

// QueueArray

/** */
alias gst_queue_array_clear = c_gst_queue_array_clear;

/** */
alias gst_queue_array_drop_element = c_gst_queue_array_drop_element;

/** */
alias gst_queue_array_drop_struct = c_gst_queue_array_drop_struct;

/** */
alias gst_queue_array_find = c_gst_queue_array_find;

/** */
alias gst_queue_array_free = c_gst_queue_array_free;

/** */
alias gst_queue_array_get_length = c_gst_queue_array_get_length;

/** */
alias gst_queue_array_is_empty = c_gst_queue_array_is_empty;

/** */
alias gst_queue_array_peek_head = c_gst_queue_array_peek_head;

/** */
alias gst_queue_array_peek_head_struct = c_gst_queue_array_peek_head_struct;

/** */
alias gst_queue_array_peek_nth = c_gst_queue_array_peek_nth;

/** */
alias gst_queue_array_peek_nth_struct = c_gst_queue_array_peek_nth_struct;

/** */
alias gst_queue_array_peek_tail = c_gst_queue_array_peek_tail;

/** */
alias gst_queue_array_peek_tail_struct = c_gst_queue_array_peek_tail_struct;

/** */
alias gst_queue_array_pop_head = c_gst_queue_array_pop_head;

/** */
alias gst_queue_array_pop_head_struct = c_gst_queue_array_pop_head_struct;

/** */
alias gst_queue_array_pop_tail = c_gst_queue_array_pop_tail;

/** */
alias gst_queue_array_pop_tail_struct = c_gst_queue_array_pop_tail_struct;

/** */
alias gst_queue_array_push_sorted = c_gst_queue_array_push_sorted;

/** */
alias gst_queue_array_push_sorted_struct = c_gst_queue_array_push_sorted_struct;

/** */
alias gst_queue_array_push_tail = c_gst_queue_array_push_tail;

/** */
alias gst_queue_array_push_tail_struct = c_gst_queue_array_push_tail_struct;

/** */
alias gst_queue_array_set_clear_func = c_gst_queue_array_set_clear_func;

/** */
alias gst_queue_array_sort = c_gst_queue_array_sort;

/** */
alias gst_queue_array_new = c_gst_queue_array_new;

/** */
alias gst_queue_array_new_for_struct = c_gst_queue_array_new_for_struct;

// TypeFindData

/** */
alias gst_type_find_data_free = c_gst_type_find_data_free;

/** */
alias gst_type_find_data_get_caps = c_gst_type_find_data_get_caps;

/** */
alias gst_type_find_data_get_probability = c_gst_type_find_data_get_probability;

/** */
alias gst_type_find_data_get_typefind = c_gst_type_find_data_get_typefind;

/** */
alias gst_type_find_data_new = c_gst_type_find_data_new;

// global

/** */
alias gst_type_find_helper = c_gst_type_find_helper;

/** */
alias gst_type_find_helper_for_buffer = c_gst_type_find_helper_for_buffer;

/** */
alias gst_type_find_helper_for_buffer_with_caps = c_gst_type_find_helper_for_buffer_with_caps;

/** */
alias gst_type_find_helper_for_buffer_with_extension = c_gst_type_find_helper_for_buffer_with_extension;

/** */
alias gst_type_find_helper_for_data = c_gst_type_find_helper_for_data;

/** */
alias gst_type_find_helper_for_data_with_caps = c_gst_type_find_helper_for_data_with_caps;

/** */
alias gst_type_find_helper_for_data_with_extension = c_gst_type_find_helper_for_data_with_extension;

/** */
alias gst_type_find_helper_for_extension = c_gst_type_find_helper_for_extension;

/** */
alias gst_type_find_helper_get_range = c_gst_type_find_helper_get_range;

/** */
alias gst_type_find_helper_get_range_full = c_gst_type_find_helper_get_range_full;

/** */
alias gst_type_find_list_factories_for_caps = c_gst_type_find_list_factories_for_caps;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gstbase1");

  // Adapter
  gidLink(cast(void**)&gst_adapter_get_type, "gst_adapter_get_type", libs);
  gidLink(cast(void**)&gst_adapter_new, "gst_adapter_new", libs);
  gidLink(cast(void**)&gst_adapter_available, "gst_adapter_available", libs);
  gidLink(cast(void**)&gst_adapter_available_fast, "gst_adapter_available_fast", libs);
  gidLink(cast(void**)&gst_adapter_clear, "gst_adapter_clear", libs);
  gidLink(cast(void**)&gst_adapter_copy, "gst_adapter_copy", libs);
  gidLink(cast(void**)&gst_adapter_copy_bytes, "gst_adapter_copy_bytes", libs);
  gidLink(cast(void**)&gst_adapter_distance_from_discont, "gst_adapter_distance_from_discont", libs);
  gidLink(cast(void**)&gst_adapter_dts_at_discont, "gst_adapter_dts_at_discont", libs);
  gidLink(cast(void**)&gst_adapter_flush, "gst_adapter_flush", libs);
  gidLink(cast(void**)&gst_adapter_get_buffer, "gst_adapter_get_buffer", libs);
  gidLink(cast(void**)&gst_adapter_get_buffer_fast, "gst_adapter_get_buffer_fast", libs);
  gidLink(cast(void**)&gst_adapter_get_buffer_list, "gst_adapter_get_buffer_list", libs);
  gidLink(cast(void**)&gst_adapter_get_list, "gst_adapter_get_list", libs);
  gidLink(cast(void**)&gst_adapter_map, "gst_adapter_map", libs);
  gidLink(cast(void**)&gst_adapter_masked_scan_uint32, "gst_adapter_masked_scan_uint32", libs);
  gidLink(cast(void**)&gst_adapter_masked_scan_uint32_peek, "gst_adapter_masked_scan_uint32_peek", libs);
  gidLink(cast(void**)&gst_adapter_offset_at_discont, "gst_adapter_offset_at_discont", libs);
  gidLink(cast(void**)&gst_adapter_prev_dts, "gst_adapter_prev_dts", libs);
  gidLink(cast(void**)&gst_adapter_prev_dts_at_offset, "gst_adapter_prev_dts_at_offset", libs);
  gidLink(cast(void**)&gst_adapter_prev_offset, "gst_adapter_prev_offset", libs);
  gidLink(cast(void**)&gst_adapter_prev_pts, "gst_adapter_prev_pts", libs);
  gidLink(cast(void**)&gst_adapter_prev_pts_at_offset, "gst_adapter_prev_pts_at_offset", libs);
  gidLink(cast(void**)&gst_adapter_pts_at_discont, "gst_adapter_pts_at_discont", libs);
  gidLink(cast(void**)&gst_adapter_push, "gst_adapter_push", libs);
  gidLink(cast(void**)&gst_adapter_take, "gst_adapter_take", libs);
  gidLink(cast(void**)&gst_adapter_take_buffer, "gst_adapter_take_buffer", libs);
  gidLink(cast(void**)&gst_adapter_take_buffer_fast, "gst_adapter_take_buffer_fast", libs);
  gidLink(cast(void**)&gst_adapter_take_buffer_list, "gst_adapter_take_buffer_list", libs);
  gidLink(cast(void**)&gst_adapter_take_list, "gst_adapter_take_list", libs);
  gidLink(cast(void**)&gst_adapter_unmap, "gst_adapter_unmap", libs);

  // Aggregator
  gidLink(cast(void**)&gst_aggregator_get_type, "gst_aggregator_get_type", libs);
  gidLink(cast(void**)&gst_aggregator_finish_buffer, "gst_aggregator_finish_buffer", libs);
  gidLink(cast(void**)&gst_aggregator_finish_buffer_list, "gst_aggregator_finish_buffer_list", libs);
  gidLink(cast(void**)&gst_aggregator_get_allocator, "gst_aggregator_get_allocator", libs);
  gidLink(cast(void**)&gst_aggregator_get_buffer_pool, "gst_aggregator_get_buffer_pool", libs);
  gidLink(cast(void**)&gst_aggregator_get_force_live, "gst_aggregator_get_force_live", libs);
  gidLink(cast(void**)&gst_aggregator_get_ignore_inactive_pads, "gst_aggregator_get_ignore_inactive_pads", libs);
  gidLink(cast(void**)&gst_aggregator_get_latency, "gst_aggregator_get_latency", libs);
  gidLink(cast(void**)&gst_aggregator_negotiate, "gst_aggregator_negotiate", libs);
  gidLink(cast(void**)&gst_aggregator_peek_next_sample, "gst_aggregator_peek_next_sample", libs);
  gidLink(cast(void**)&gst_aggregator_push_src_event, "gst_aggregator_push_src_event", libs);
  gidLink(cast(void**)&gst_aggregator_selected_samples, "gst_aggregator_selected_samples", libs);
  gidLink(cast(void**)&gst_aggregator_set_force_live, "gst_aggregator_set_force_live", libs);
  gidLink(cast(void**)&gst_aggregator_set_ignore_inactive_pads, "gst_aggregator_set_ignore_inactive_pads", libs);
  gidLink(cast(void**)&gst_aggregator_set_latency, "gst_aggregator_set_latency", libs);
  gidLink(cast(void**)&gst_aggregator_set_src_caps, "gst_aggregator_set_src_caps", libs);
  gidLink(cast(void**)&gst_aggregator_simple_get_next_time, "gst_aggregator_simple_get_next_time", libs);
  gidLink(cast(void**)&gst_aggregator_update_segment, "gst_aggregator_update_segment", libs);

  // AggregatorPad
  gidLink(cast(void**)&gst_aggregator_pad_get_type, "gst_aggregator_pad_get_type", libs);
  gidLink(cast(void**)&gst_aggregator_pad_drop_buffer, "gst_aggregator_pad_drop_buffer", libs);
  gidLink(cast(void**)&gst_aggregator_pad_has_buffer, "gst_aggregator_pad_has_buffer", libs);
  gidLink(cast(void**)&gst_aggregator_pad_is_eos, "gst_aggregator_pad_is_eos", libs);
  gidLink(cast(void**)&gst_aggregator_pad_is_inactive, "gst_aggregator_pad_is_inactive", libs);
  gidLink(cast(void**)&gst_aggregator_pad_peek_buffer, "gst_aggregator_pad_peek_buffer", libs);
  gidLink(cast(void**)&gst_aggregator_pad_pop_buffer, "gst_aggregator_pad_pop_buffer", libs);

  // BaseParse
  gidLink(cast(void**)&gst_base_parse_get_type, "gst_base_parse_get_type", libs);
  gidLink(cast(void**)&gst_base_parse_add_index_entry, "gst_base_parse_add_index_entry", libs);
  gidLink(cast(void**)&gst_base_parse_convert_default, "gst_base_parse_convert_default", libs);
  gidLink(cast(void**)&gst_base_parse_drain, "gst_base_parse_drain", libs);
  gidLink(cast(void**)&gst_base_parse_finish_frame, "gst_base_parse_finish_frame", libs);
  gidLink(cast(void**)&gst_base_parse_merge_tags, "gst_base_parse_merge_tags", libs);
  gidLink(cast(void**)&gst_base_parse_push_frame, "gst_base_parse_push_frame", libs);
  gidLink(cast(void**)&gst_base_parse_set_average_bitrate, "gst_base_parse_set_average_bitrate", libs);
  gidLink(cast(void**)&gst_base_parse_set_duration, "gst_base_parse_set_duration", libs);
  gidLink(cast(void**)&gst_base_parse_set_frame_rate, "gst_base_parse_set_frame_rate", libs);
  gidLink(cast(void**)&gst_base_parse_set_has_timing_info, "gst_base_parse_set_has_timing_info", libs);
  gidLink(cast(void**)&gst_base_parse_set_infer_ts, "gst_base_parse_set_infer_ts", libs);
  gidLink(cast(void**)&gst_base_parse_set_latency, "gst_base_parse_set_latency", libs);
  gidLink(cast(void**)&gst_base_parse_set_min_frame_size, "gst_base_parse_set_min_frame_size", libs);
  gidLink(cast(void**)&gst_base_parse_set_passthrough, "gst_base_parse_set_passthrough", libs);
  gidLink(cast(void**)&gst_base_parse_set_pts_interpolation, "gst_base_parse_set_pts_interpolation", libs);
  gidLink(cast(void**)&gst_base_parse_set_syncable, "gst_base_parse_set_syncable", libs);
  gidLink(cast(void**)&gst_base_parse_set_ts_at_offset, "gst_base_parse_set_ts_at_offset", libs);

  // BaseParseFrame
  gidLink(cast(void**)&gst_base_parse_frame_get_type, "gst_base_parse_frame_get_type", libs);
  gidLink(cast(void**)&gst_base_parse_frame_new, "gst_base_parse_frame_new", libs);
  gidLink(cast(void**)&gst_base_parse_frame_copy, "gst_base_parse_frame_copy", libs);
  gidLink(cast(void**)&gst_base_parse_frame_free, "gst_base_parse_frame_free", libs);
  gidLink(cast(void**)&gst_base_parse_frame_init, "gst_base_parse_frame_init", libs);

  // BaseSink
  gidLink(cast(void**)&gst_base_sink_get_type, "gst_base_sink_get_type", libs);
  gidLink(cast(void**)&gst_base_sink_do_preroll, "gst_base_sink_do_preroll", libs);
  gidLink(cast(void**)&gst_base_sink_get_blocksize, "gst_base_sink_get_blocksize", libs);
  gidLink(cast(void**)&gst_base_sink_get_drop_out_of_segment, "gst_base_sink_get_drop_out_of_segment", libs);
  gidLink(cast(void**)&gst_base_sink_get_last_sample, "gst_base_sink_get_last_sample", libs);
  gidLink(cast(void**)&gst_base_sink_get_latency, "gst_base_sink_get_latency", libs);
  gidLink(cast(void**)&gst_base_sink_get_max_bitrate, "gst_base_sink_get_max_bitrate", libs);
  gidLink(cast(void**)&gst_base_sink_get_max_lateness, "gst_base_sink_get_max_lateness", libs);
  gidLink(cast(void**)&gst_base_sink_get_processing_deadline, "gst_base_sink_get_processing_deadline", libs);
  gidLink(cast(void**)&gst_base_sink_get_render_delay, "gst_base_sink_get_render_delay", libs);
  gidLink(cast(void**)&gst_base_sink_get_stats, "gst_base_sink_get_stats", libs);
  gidLink(cast(void**)&gst_base_sink_get_sync, "gst_base_sink_get_sync", libs);
  gidLink(cast(void**)&gst_base_sink_get_throttle_time, "gst_base_sink_get_throttle_time", libs);
  gidLink(cast(void**)&gst_base_sink_get_ts_offset, "gst_base_sink_get_ts_offset", libs);
  gidLink(cast(void**)&gst_base_sink_is_async_enabled, "gst_base_sink_is_async_enabled", libs);
  gidLink(cast(void**)&gst_base_sink_is_last_sample_enabled, "gst_base_sink_is_last_sample_enabled", libs);
  gidLink(cast(void**)&gst_base_sink_is_qos_enabled, "gst_base_sink_is_qos_enabled", libs);
  gidLink(cast(void**)&gst_base_sink_query_latency, "gst_base_sink_query_latency", libs);
  gidLink(cast(void**)&gst_base_sink_set_async_enabled, "gst_base_sink_set_async_enabled", libs);
  gidLink(cast(void**)&gst_base_sink_set_blocksize, "gst_base_sink_set_blocksize", libs);
  gidLink(cast(void**)&gst_base_sink_set_drop_out_of_segment, "gst_base_sink_set_drop_out_of_segment", libs);
  gidLink(cast(void**)&gst_base_sink_set_last_sample_enabled, "gst_base_sink_set_last_sample_enabled", libs);
  gidLink(cast(void**)&gst_base_sink_set_max_bitrate, "gst_base_sink_set_max_bitrate", libs);
  gidLink(cast(void**)&gst_base_sink_set_max_lateness, "gst_base_sink_set_max_lateness", libs);
  gidLink(cast(void**)&gst_base_sink_set_processing_deadline, "gst_base_sink_set_processing_deadline", libs);
  gidLink(cast(void**)&gst_base_sink_set_qos_enabled, "gst_base_sink_set_qos_enabled", libs);
  gidLink(cast(void**)&gst_base_sink_set_render_delay, "gst_base_sink_set_render_delay", libs);
  gidLink(cast(void**)&gst_base_sink_set_sync, "gst_base_sink_set_sync", libs);
  gidLink(cast(void**)&gst_base_sink_set_throttle_time, "gst_base_sink_set_throttle_time", libs);
  gidLink(cast(void**)&gst_base_sink_set_ts_offset, "gst_base_sink_set_ts_offset", libs);
  gidLink(cast(void**)&gst_base_sink_wait, "gst_base_sink_wait", libs);
  gidLink(cast(void**)&gst_base_sink_wait_clock, "gst_base_sink_wait_clock", libs);
  gidLink(cast(void**)&gst_base_sink_wait_preroll, "gst_base_sink_wait_preroll", libs);

  // BaseSrc
  gidLink(cast(void**)&gst_base_src_get_type, "gst_base_src_get_type", libs);
  gidLink(cast(void**)&gst_base_src_get_allocator, "gst_base_src_get_allocator", libs);
  gidLink(cast(void**)&gst_base_src_get_blocksize, "gst_base_src_get_blocksize", libs);
  gidLink(cast(void**)&gst_base_src_get_buffer_pool, "gst_base_src_get_buffer_pool", libs);
  gidLink(cast(void**)&gst_base_src_get_do_timestamp, "gst_base_src_get_do_timestamp", libs);
  gidLink(cast(void**)&gst_base_src_is_async, "gst_base_src_is_async", libs);
  gidLink(cast(void**)&gst_base_src_is_live, "gst_base_src_is_live", libs);
  gidLink(cast(void**)&gst_base_src_negotiate, "gst_base_src_negotiate", libs);
  gidLink(cast(void**)&gst_base_src_new_seamless_segment, "gst_base_src_new_seamless_segment", libs);
  gidLink(cast(void**)&gst_base_src_new_segment, "gst_base_src_new_segment", libs);
  gidLink(cast(void**)&gst_base_src_push_segment, "gst_base_src_push_segment", libs);
  gidLink(cast(void**)&gst_base_src_query_latency, "gst_base_src_query_latency", libs);
  gidLink(cast(void**)&gst_base_src_set_async, "gst_base_src_set_async", libs);
  gidLink(cast(void**)&gst_base_src_set_automatic_eos, "gst_base_src_set_automatic_eos", libs);
  gidLink(cast(void**)&gst_base_src_set_blocksize, "gst_base_src_set_blocksize", libs);
  gidLink(cast(void**)&gst_base_src_set_caps, "gst_base_src_set_caps", libs);
  gidLink(cast(void**)&gst_base_src_set_do_timestamp, "gst_base_src_set_do_timestamp", libs);
  gidLink(cast(void**)&gst_base_src_set_dynamic_size, "gst_base_src_set_dynamic_size", libs);
  gidLink(cast(void**)&gst_base_src_set_format, "gst_base_src_set_format", libs);
  gidLink(cast(void**)&gst_base_src_set_live, "gst_base_src_set_live", libs);
  gidLink(cast(void**)&gst_base_src_start_complete, "gst_base_src_start_complete", libs);
  gidLink(cast(void**)&gst_base_src_start_wait, "gst_base_src_start_wait", libs);
  gidLink(cast(void**)&gst_base_src_submit_buffer_list, "gst_base_src_submit_buffer_list", libs);
  gidLink(cast(void**)&gst_base_src_wait_playing, "gst_base_src_wait_playing", libs);

  // BaseTransform
  gidLink(cast(void**)&gst_base_transform_get_type, "gst_base_transform_get_type", libs);
  gidLink(cast(void**)&gst_base_transform_get_allocator, "gst_base_transform_get_allocator", libs);
  gidLink(cast(void**)&gst_base_transform_get_buffer_pool, "gst_base_transform_get_buffer_pool", libs);
  gidLink(cast(void**)&gst_base_transform_is_in_place, "gst_base_transform_is_in_place", libs);
  gidLink(cast(void**)&gst_base_transform_is_passthrough, "gst_base_transform_is_passthrough", libs);
  gidLink(cast(void**)&gst_base_transform_is_qos_enabled, "gst_base_transform_is_qos_enabled", libs);
  gidLink(cast(void**)&gst_base_transform_reconfigure, "gst_base_transform_reconfigure", libs);
  gidLink(cast(void**)&gst_base_transform_reconfigure_sink, "gst_base_transform_reconfigure_sink", libs);
  gidLink(cast(void**)&gst_base_transform_reconfigure_src, "gst_base_transform_reconfigure_src", libs);
  gidLink(cast(void**)&gst_base_transform_set_gap_aware, "gst_base_transform_set_gap_aware", libs);
  gidLink(cast(void**)&gst_base_transform_set_in_place, "gst_base_transform_set_in_place", libs);
  gidLink(cast(void**)&gst_base_transform_set_passthrough, "gst_base_transform_set_passthrough", libs);
  gidLink(cast(void**)&gst_base_transform_set_prefer_passthrough, "gst_base_transform_set_prefer_passthrough", libs);
  gidLink(cast(void**)&gst_base_transform_set_qos_enabled, "gst_base_transform_set_qos_enabled", libs);
  gidLink(cast(void**)&gst_base_transform_update_qos, "gst_base_transform_update_qos", libs);
  gidLink(cast(void**)&gst_base_transform_update_src_caps, "gst_base_transform_update_src_caps", libs);

  // BitReader
  gidLink(cast(void**)&gst_bit_reader_free, "gst_bit_reader_free", libs);
  gidLink(cast(void**)&gst_bit_reader_get_bits_uint16, "gst_bit_reader_get_bits_uint16", libs);
  gidLink(cast(void**)&gst_bit_reader_get_bits_uint32, "gst_bit_reader_get_bits_uint32", libs);
  gidLink(cast(void**)&gst_bit_reader_get_bits_uint64, "gst_bit_reader_get_bits_uint64", libs);
  gidLink(cast(void**)&gst_bit_reader_get_bits_uint8, "gst_bit_reader_get_bits_uint8", libs);
  gidLink(cast(void**)&gst_bit_reader_get_pos, "gst_bit_reader_get_pos", libs);
  gidLink(cast(void**)&gst_bit_reader_get_remaining, "gst_bit_reader_get_remaining", libs);
  gidLink(cast(void**)&gst_bit_reader_get_size, "gst_bit_reader_get_size", libs);
  gidLink(cast(void**)&gst_bit_reader_init, "gst_bit_reader_init", libs);
  gidLink(cast(void**)&gst_bit_reader_peek_bits_uint16, "gst_bit_reader_peek_bits_uint16", libs);
  gidLink(cast(void**)&gst_bit_reader_peek_bits_uint32, "gst_bit_reader_peek_bits_uint32", libs);
  gidLink(cast(void**)&gst_bit_reader_peek_bits_uint64, "gst_bit_reader_peek_bits_uint64", libs);
  gidLink(cast(void**)&gst_bit_reader_peek_bits_uint8, "gst_bit_reader_peek_bits_uint8", libs);
  gidLink(cast(void**)&gst_bit_reader_set_pos, "gst_bit_reader_set_pos", libs);
  gidLink(cast(void**)&gst_bit_reader_skip, "gst_bit_reader_skip", libs);
  gidLink(cast(void**)&gst_bit_reader_skip_to_byte, "gst_bit_reader_skip_to_byte", libs);
  gidLink(cast(void**)&gst_bit_reader_new, "gst_bit_reader_new", libs);

  // BitWriter
  gidLink(cast(void**)&gst_bit_writer_align_bytes, "gst_bit_writer_align_bytes", libs);
  gidLink(cast(void**)&gst_bit_writer_free, "gst_bit_writer_free", libs);
  gidLink(cast(void**)&gst_bit_writer_free_and_get_buffer, "gst_bit_writer_free_and_get_buffer", libs);
  gidLink(cast(void**)&gst_bit_writer_free_and_get_data, "gst_bit_writer_free_and_get_data", libs);
  gidLink(cast(void**)&gst_bit_writer_get_data, "gst_bit_writer_get_data", libs);
  gidLink(cast(void**)&gst_bit_writer_get_remaining, "gst_bit_writer_get_remaining", libs);
  gidLink(cast(void**)&gst_bit_writer_get_size, "gst_bit_writer_get_size", libs);
  gidLink(cast(void**)&gst_bit_writer_init, "gst_bit_writer_init", libs);
  gidLink(cast(void**)&gst_bit_writer_init_with_data, "gst_bit_writer_init_with_data", libs);
  gidLink(cast(void**)&gst_bit_writer_init_with_size, "gst_bit_writer_init_with_size", libs);
  gidLink(cast(void**)&gst_bit_writer_put_bits_uint16, "gst_bit_writer_put_bits_uint16", libs);
  gidLink(cast(void**)&gst_bit_writer_put_bits_uint32, "gst_bit_writer_put_bits_uint32", libs);
  gidLink(cast(void**)&gst_bit_writer_put_bits_uint64, "gst_bit_writer_put_bits_uint64", libs);
  gidLink(cast(void**)&gst_bit_writer_put_bits_uint8, "gst_bit_writer_put_bits_uint8", libs);
  gidLink(cast(void**)&gst_bit_writer_put_bytes, "gst_bit_writer_put_bytes", libs);
  gidLink(cast(void**)&gst_bit_writer_reset, "gst_bit_writer_reset", libs);
  gidLink(cast(void**)&gst_bit_writer_reset_and_get_buffer, "gst_bit_writer_reset_and_get_buffer", libs);
  gidLink(cast(void**)&gst_bit_writer_reset_and_get_data, "gst_bit_writer_reset_and_get_data", libs);
  gidLink(cast(void**)&gst_bit_writer_set_pos, "gst_bit_writer_set_pos", libs);
  gidLink(cast(void**)&gst_bit_writer_new, "gst_bit_writer_new", libs);
  gidLink(cast(void**)&gst_bit_writer_new_with_data, "gst_bit_writer_new_with_data", libs);
  gidLink(cast(void**)&gst_bit_writer_new_with_size, "gst_bit_writer_new_with_size", libs);

  // ByteReader
  gidLink(cast(void**)&gst_byte_reader_dup_data, "gst_byte_reader_dup_data", libs);
  gidLink(cast(void**)&gst_byte_reader_dup_string_utf16, "gst_byte_reader_dup_string_utf16", libs);
  gidLink(cast(void**)&gst_byte_reader_dup_string_utf32, "gst_byte_reader_dup_string_utf32", libs);
  gidLink(cast(void**)&gst_byte_reader_dup_string_utf8, "gst_byte_reader_dup_string_utf8", libs);
  gidLink(cast(void**)&gst_byte_reader_free, "gst_byte_reader_free", libs);
  gidLink(cast(void**)&gst_byte_reader_get_data, "gst_byte_reader_get_data", libs);
  gidLink(cast(void**)&gst_byte_reader_get_float32_be, "gst_byte_reader_get_float32_be", libs);
  gidLink(cast(void**)&gst_byte_reader_get_float32_le, "gst_byte_reader_get_float32_le", libs);
  gidLink(cast(void**)&gst_byte_reader_get_float64_be, "gst_byte_reader_get_float64_be", libs);
  gidLink(cast(void**)&gst_byte_reader_get_float64_le, "gst_byte_reader_get_float64_le", libs);
  gidLink(cast(void**)&gst_byte_reader_get_int16_be, "gst_byte_reader_get_int16_be", libs);
  gidLink(cast(void**)&gst_byte_reader_get_int16_le, "gst_byte_reader_get_int16_le", libs);
  gidLink(cast(void**)&gst_byte_reader_get_int24_be, "gst_byte_reader_get_int24_be", libs);
  gidLink(cast(void**)&gst_byte_reader_get_int24_le, "gst_byte_reader_get_int24_le", libs);
  gidLink(cast(void**)&gst_byte_reader_get_int32_be, "gst_byte_reader_get_int32_be", libs);
  gidLink(cast(void**)&gst_byte_reader_get_int32_le, "gst_byte_reader_get_int32_le", libs);
  gidLink(cast(void**)&gst_byte_reader_get_int64_be, "gst_byte_reader_get_int64_be", libs);
  gidLink(cast(void**)&gst_byte_reader_get_int64_le, "gst_byte_reader_get_int64_le", libs);
  gidLink(cast(void**)&gst_byte_reader_get_int8, "gst_byte_reader_get_int8", libs);
  gidLink(cast(void**)&gst_byte_reader_get_pos, "gst_byte_reader_get_pos", libs);
  gidLink(cast(void**)&gst_byte_reader_get_remaining, "gst_byte_reader_get_remaining", libs);
  gidLink(cast(void**)&gst_byte_reader_get_size, "gst_byte_reader_get_size", libs);
  gidLink(cast(void**)&gst_byte_reader_get_string_utf8, "gst_byte_reader_get_string_utf8", libs);
  gidLink(cast(void**)&gst_byte_reader_get_sub_reader, "gst_byte_reader_get_sub_reader", libs);
  gidLink(cast(void**)&gst_byte_reader_get_uint16_be, "gst_byte_reader_get_uint16_be", libs);
  gidLink(cast(void**)&gst_byte_reader_get_uint16_le, "gst_byte_reader_get_uint16_le", libs);
  gidLink(cast(void**)&gst_byte_reader_get_uint24_be, "gst_byte_reader_get_uint24_be", libs);
  gidLink(cast(void**)&gst_byte_reader_get_uint24_le, "gst_byte_reader_get_uint24_le", libs);
  gidLink(cast(void**)&gst_byte_reader_get_uint32_be, "gst_byte_reader_get_uint32_be", libs);
  gidLink(cast(void**)&gst_byte_reader_get_uint32_le, "gst_byte_reader_get_uint32_le", libs);
  gidLink(cast(void**)&gst_byte_reader_get_uint64_be, "gst_byte_reader_get_uint64_be", libs);
  gidLink(cast(void**)&gst_byte_reader_get_uint64_le, "gst_byte_reader_get_uint64_le", libs);
  gidLink(cast(void**)&gst_byte_reader_get_uint8, "gst_byte_reader_get_uint8", libs);
  gidLink(cast(void**)&gst_byte_reader_init, "gst_byte_reader_init", libs);
  gidLink(cast(void**)&gst_byte_reader_masked_scan_uint32, "gst_byte_reader_masked_scan_uint32", libs);
  gidLink(cast(void**)&gst_byte_reader_masked_scan_uint32_peek, "gst_byte_reader_masked_scan_uint32_peek", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_data, "gst_byte_reader_peek_data", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_float32_be, "gst_byte_reader_peek_float32_be", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_float32_le, "gst_byte_reader_peek_float32_le", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_float64_be, "gst_byte_reader_peek_float64_be", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_float64_le, "gst_byte_reader_peek_float64_le", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_int16_be, "gst_byte_reader_peek_int16_be", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_int16_le, "gst_byte_reader_peek_int16_le", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_int24_be, "gst_byte_reader_peek_int24_be", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_int24_le, "gst_byte_reader_peek_int24_le", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_int32_be, "gst_byte_reader_peek_int32_be", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_int32_le, "gst_byte_reader_peek_int32_le", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_int64_be, "gst_byte_reader_peek_int64_be", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_int64_le, "gst_byte_reader_peek_int64_le", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_int8, "gst_byte_reader_peek_int8", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_string_utf8, "gst_byte_reader_peek_string_utf8", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_sub_reader, "gst_byte_reader_peek_sub_reader", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_uint16_be, "gst_byte_reader_peek_uint16_be", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_uint16_le, "gst_byte_reader_peek_uint16_le", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_uint24_be, "gst_byte_reader_peek_uint24_be", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_uint24_le, "gst_byte_reader_peek_uint24_le", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_uint32_be, "gst_byte_reader_peek_uint32_be", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_uint32_le, "gst_byte_reader_peek_uint32_le", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_uint64_be, "gst_byte_reader_peek_uint64_be", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_uint64_le, "gst_byte_reader_peek_uint64_le", libs);
  gidLink(cast(void**)&gst_byte_reader_peek_uint8, "gst_byte_reader_peek_uint8", libs);
  gidLink(cast(void**)&gst_byte_reader_set_pos, "gst_byte_reader_set_pos", libs);
  gidLink(cast(void**)&gst_byte_reader_skip, "gst_byte_reader_skip", libs);
  gidLink(cast(void**)&gst_byte_reader_skip_string_utf16, "gst_byte_reader_skip_string_utf16", libs);
  gidLink(cast(void**)&gst_byte_reader_skip_string_utf32, "gst_byte_reader_skip_string_utf32", libs);
  gidLink(cast(void**)&gst_byte_reader_skip_string_utf8, "gst_byte_reader_skip_string_utf8", libs);
  gidLink(cast(void**)&gst_byte_reader_new, "gst_byte_reader_new", libs);

  // ByteWriter
  gidLink(cast(void**)&gst_byte_writer_ensure_free_space, "gst_byte_writer_ensure_free_space", libs);
  gidLink(cast(void**)&gst_byte_writer_fill, "gst_byte_writer_fill", libs);
  gidLink(cast(void**)&gst_byte_writer_free, "gst_byte_writer_free", libs);
  gidLink(cast(void**)&gst_byte_writer_free_and_get_buffer, "gst_byte_writer_free_and_get_buffer", libs);
  gidLink(cast(void**)&gst_byte_writer_free_and_get_data, "gst_byte_writer_free_and_get_data", libs);
  gidLink(cast(void**)&gst_byte_writer_get_remaining, "gst_byte_writer_get_remaining", libs);
  gidLink(cast(void**)&gst_byte_writer_init, "gst_byte_writer_init", libs);
  gidLink(cast(void**)&gst_byte_writer_init_with_data, "gst_byte_writer_init_with_data", libs);
  gidLink(cast(void**)&gst_byte_writer_init_with_size, "gst_byte_writer_init_with_size", libs);
  gidLink(cast(void**)&gst_byte_writer_put_buffer, "gst_byte_writer_put_buffer", libs);
  gidLink(cast(void**)&gst_byte_writer_put_data, "gst_byte_writer_put_data", libs);
  gidLink(cast(void**)&gst_byte_writer_put_float32_be, "gst_byte_writer_put_float32_be", libs);
  gidLink(cast(void**)&gst_byte_writer_put_float32_le, "gst_byte_writer_put_float32_le", libs);
  gidLink(cast(void**)&gst_byte_writer_put_float64_be, "gst_byte_writer_put_float64_be", libs);
  gidLink(cast(void**)&gst_byte_writer_put_float64_le, "gst_byte_writer_put_float64_le", libs);
  gidLink(cast(void**)&gst_byte_writer_put_int16_be, "gst_byte_writer_put_int16_be", libs);
  gidLink(cast(void**)&gst_byte_writer_put_int16_le, "gst_byte_writer_put_int16_le", libs);
  gidLink(cast(void**)&gst_byte_writer_put_int24_be, "gst_byte_writer_put_int24_be", libs);
  gidLink(cast(void**)&gst_byte_writer_put_int24_le, "gst_byte_writer_put_int24_le", libs);
  gidLink(cast(void**)&gst_byte_writer_put_int32_be, "gst_byte_writer_put_int32_be", libs);
  gidLink(cast(void**)&gst_byte_writer_put_int32_le, "gst_byte_writer_put_int32_le", libs);
  gidLink(cast(void**)&gst_byte_writer_put_int64_be, "gst_byte_writer_put_int64_be", libs);
  gidLink(cast(void**)&gst_byte_writer_put_int64_le, "gst_byte_writer_put_int64_le", libs);
  gidLink(cast(void**)&gst_byte_writer_put_int8, "gst_byte_writer_put_int8", libs);
  gidLink(cast(void**)&gst_byte_writer_put_string_utf16, "gst_byte_writer_put_string_utf16", libs);
  gidLink(cast(void**)&gst_byte_writer_put_string_utf32, "gst_byte_writer_put_string_utf32", libs);
  gidLink(cast(void**)&gst_byte_writer_put_string_utf8, "gst_byte_writer_put_string_utf8", libs);
  gidLink(cast(void**)&gst_byte_writer_put_uint16_be, "gst_byte_writer_put_uint16_be", libs);
  gidLink(cast(void**)&gst_byte_writer_put_uint16_le, "gst_byte_writer_put_uint16_le", libs);
  gidLink(cast(void**)&gst_byte_writer_put_uint24_be, "gst_byte_writer_put_uint24_be", libs);
  gidLink(cast(void**)&gst_byte_writer_put_uint24_le, "gst_byte_writer_put_uint24_le", libs);
  gidLink(cast(void**)&gst_byte_writer_put_uint32_be, "gst_byte_writer_put_uint32_be", libs);
  gidLink(cast(void**)&gst_byte_writer_put_uint32_le, "gst_byte_writer_put_uint32_le", libs);
  gidLink(cast(void**)&gst_byte_writer_put_uint64_be, "gst_byte_writer_put_uint64_be", libs);
  gidLink(cast(void**)&gst_byte_writer_put_uint64_le, "gst_byte_writer_put_uint64_le", libs);
  gidLink(cast(void**)&gst_byte_writer_put_uint8, "gst_byte_writer_put_uint8", libs);
  gidLink(cast(void**)&gst_byte_writer_reset, "gst_byte_writer_reset", libs);
  gidLink(cast(void**)&gst_byte_writer_reset_and_get_buffer, "gst_byte_writer_reset_and_get_buffer", libs);
  gidLink(cast(void**)&gst_byte_writer_reset_and_get_data, "gst_byte_writer_reset_and_get_data", libs);
  gidLink(cast(void**)&gst_byte_writer_new, "gst_byte_writer_new", libs);
  gidLink(cast(void**)&gst_byte_writer_new_with_data, "gst_byte_writer_new_with_data", libs);
  gidLink(cast(void**)&gst_byte_writer_new_with_size, "gst_byte_writer_new_with_size", libs);

  // CollectPads
  gidLink(cast(void**)&gst_collect_pads_get_type, "gst_collect_pads_get_type", libs);
  gidLink(cast(void**)&gst_collect_pads_new, "gst_collect_pads_new", libs);
  gidLink(cast(void**)&gst_collect_pads_add_pad, "gst_collect_pads_add_pad", libs);
  gidLink(cast(void**)&gst_collect_pads_available, "gst_collect_pads_available", libs);
  gidLink(cast(void**)&gst_collect_pads_clip_running_time, "gst_collect_pads_clip_running_time", libs);
  gidLink(cast(void**)&gst_collect_pads_event_default, "gst_collect_pads_event_default", libs);
  gidLink(cast(void**)&gst_collect_pads_flush, "gst_collect_pads_flush", libs);
  gidLink(cast(void**)&gst_collect_pads_peek, "gst_collect_pads_peek", libs);
  gidLink(cast(void**)&gst_collect_pads_pop, "gst_collect_pads_pop", libs);
  gidLink(cast(void**)&gst_collect_pads_query_default, "gst_collect_pads_query_default", libs);
  gidLink(cast(void**)&gst_collect_pads_read_buffer, "gst_collect_pads_read_buffer", libs);
  gidLink(cast(void**)&gst_collect_pads_remove_pad, "gst_collect_pads_remove_pad", libs);
  gidLink(cast(void**)&gst_collect_pads_set_buffer_function, "gst_collect_pads_set_buffer_function", libs);
  gidLink(cast(void**)&gst_collect_pads_set_clip_function, "gst_collect_pads_set_clip_function", libs);
  gidLink(cast(void**)&gst_collect_pads_set_compare_function, "gst_collect_pads_set_compare_function", libs);
  gidLink(cast(void**)&gst_collect_pads_set_event_function, "gst_collect_pads_set_event_function", libs);
  gidLink(cast(void**)&gst_collect_pads_set_flush_function, "gst_collect_pads_set_flush_function", libs);
  gidLink(cast(void**)&gst_collect_pads_set_flushing, "gst_collect_pads_set_flushing", libs);
  gidLink(cast(void**)&gst_collect_pads_set_function, "gst_collect_pads_set_function", libs);
  gidLink(cast(void**)&gst_collect_pads_set_query_function, "gst_collect_pads_set_query_function", libs);
  gidLink(cast(void**)&gst_collect_pads_set_waiting, "gst_collect_pads_set_waiting", libs);
  gidLink(cast(void**)&gst_collect_pads_src_event_default, "gst_collect_pads_src_event_default", libs);
  gidLink(cast(void**)&gst_collect_pads_start, "gst_collect_pads_start", libs);
  gidLink(cast(void**)&gst_collect_pads_stop, "gst_collect_pads_stop", libs);
  gidLink(cast(void**)&gst_collect_pads_take_buffer, "gst_collect_pads_take_buffer", libs);

  // DataQueue
  gidLink(cast(void**)&gst_data_queue_get_type, "gst_data_queue_get_type", libs);
  gidLink(cast(void**)&gst_data_queue_new, "gst_data_queue_new", libs);
  gidLink(cast(void**)&gst_data_queue_drop_head, "gst_data_queue_drop_head", libs);
  gidLink(cast(void**)&gst_data_queue_flush, "gst_data_queue_flush", libs);
  gidLink(cast(void**)&gst_data_queue_get_level, "gst_data_queue_get_level", libs);
  gidLink(cast(void**)&gst_data_queue_is_empty, "gst_data_queue_is_empty", libs);
  gidLink(cast(void**)&gst_data_queue_is_full, "gst_data_queue_is_full", libs);
  gidLink(cast(void**)&gst_data_queue_limits_changed, "gst_data_queue_limits_changed", libs);
  gidLink(cast(void**)&gst_data_queue_peek, "gst_data_queue_peek", libs);
  gidLink(cast(void**)&gst_data_queue_pop, "gst_data_queue_pop", libs);
  gidLink(cast(void**)&gst_data_queue_push, "gst_data_queue_push", libs);
  gidLink(cast(void**)&gst_data_queue_push_force, "gst_data_queue_push_force", libs);
  gidLink(cast(void**)&gst_data_queue_set_flushing, "gst_data_queue_set_flushing", libs);

  // FlowCombiner
  gidLink(cast(void**)&gst_flow_combiner_get_type, "gst_flow_combiner_get_type", libs);
  gidLink(cast(void**)&gst_flow_combiner_new, "gst_flow_combiner_new", libs);
  gidLink(cast(void**)&gst_flow_combiner_add_pad, "gst_flow_combiner_add_pad", libs);
  gidLink(cast(void**)&gst_flow_combiner_clear, "gst_flow_combiner_clear", libs);
  gidLink(cast(void**)&gst_flow_combiner_free, "gst_flow_combiner_free", libs);
  gidLink(cast(void**)&gst_flow_combiner_ref, "gst_flow_combiner_ref", libs);
  gidLink(cast(void**)&gst_flow_combiner_remove_pad, "gst_flow_combiner_remove_pad", libs);
  gidLink(cast(void**)&gst_flow_combiner_reset, "gst_flow_combiner_reset", libs);
  gidLink(cast(void**)&gst_flow_combiner_unref, "gst_flow_combiner_unref", libs);
  gidLink(cast(void**)&gst_flow_combiner_update_flow, "gst_flow_combiner_update_flow", libs);
  gidLink(cast(void**)&gst_flow_combiner_update_pad_flow, "gst_flow_combiner_update_pad_flow", libs);

  // PushSrc
  gidLink(cast(void**)&gst_push_src_get_type, "gst_push_src_get_type", libs);

  // QueueArray
  gidLink(cast(void**)&gst_queue_array_clear, "gst_queue_array_clear", libs);
  gidLink(cast(void**)&gst_queue_array_drop_element, "gst_queue_array_drop_element", libs);
  gidLink(cast(void**)&gst_queue_array_drop_struct, "gst_queue_array_drop_struct", libs);
  gidLink(cast(void**)&gst_queue_array_find, "gst_queue_array_find", libs);
  gidLink(cast(void**)&gst_queue_array_free, "gst_queue_array_free", libs);
  gidLink(cast(void**)&gst_queue_array_get_length, "gst_queue_array_get_length", libs);
  gidLink(cast(void**)&gst_queue_array_is_empty, "gst_queue_array_is_empty", libs);
  gidLink(cast(void**)&gst_queue_array_peek_head, "gst_queue_array_peek_head", libs);
  gidLink(cast(void**)&gst_queue_array_peek_head_struct, "gst_queue_array_peek_head_struct", libs);
  gidLink(cast(void**)&gst_queue_array_peek_nth, "gst_queue_array_peek_nth", libs);
  gidLink(cast(void**)&gst_queue_array_peek_nth_struct, "gst_queue_array_peek_nth_struct", libs);
  gidLink(cast(void**)&gst_queue_array_peek_tail, "gst_queue_array_peek_tail", libs);
  gidLink(cast(void**)&gst_queue_array_peek_tail_struct, "gst_queue_array_peek_tail_struct", libs);
  gidLink(cast(void**)&gst_queue_array_pop_head, "gst_queue_array_pop_head", libs);
  gidLink(cast(void**)&gst_queue_array_pop_head_struct, "gst_queue_array_pop_head_struct", libs);
  gidLink(cast(void**)&gst_queue_array_pop_tail, "gst_queue_array_pop_tail", libs);
  gidLink(cast(void**)&gst_queue_array_pop_tail_struct, "gst_queue_array_pop_tail_struct", libs);
  gidLink(cast(void**)&gst_queue_array_push_sorted, "gst_queue_array_push_sorted", libs);
  gidLink(cast(void**)&gst_queue_array_push_sorted_struct, "gst_queue_array_push_sorted_struct", libs);
  gidLink(cast(void**)&gst_queue_array_push_tail, "gst_queue_array_push_tail", libs);
  gidLink(cast(void**)&gst_queue_array_push_tail_struct, "gst_queue_array_push_tail_struct", libs);
  gidLink(cast(void**)&gst_queue_array_set_clear_func, "gst_queue_array_set_clear_func", libs);
  gidLink(cast(void**)&gst_queue_array_sort, "gst_queue_array_sort", libs);
  gidLink(cast(void**)&gst_queue_array_new, "gst_queue_array_new", libs);
  gidLink(cast(void**)&gst_queue_array_new_for_struct, "gst_queue_array_new_for_struct", libs);

  // TypeFindData
  gidLink(cast(void**)&gst_type_find_data_free, "gst_type_find_data_free", libs);
  gidLink(cast(void**)&gst_type_find_data_get_caps, "gst_type_find_data_get_caps", libs);
  gidLink(cast(void**)&gst_type_find_data_get_probability, "gst_type_find_data_get_probability", libs);
  gidLink(cast(void**)&gst_type_find_data_get_typefind, "gst_type_find_data_get_typefind", libs);
  gidLink(cast(void**)&gst_type_find_data_new, "gst_type_find_data_new", libs);

  // global
  gidLink(cast(void**)&gst_type_find_helper, "gst_type_find_helper", libs);
  gidLink(cast(void**)&gst_type_find_helper_for_buffer, "gst_type_find_helper_for_buffer", libs);
  gidLink(cast(void**)&gst_type_find_helper_for_buffer_with_caps, "gst_type_find_helper_for_buffer_with_caps", libs);
  gidLink(cast(void**)&gst_type_find_helper_for_buffer_with_extension, "gst_type_find_helper_for_buffer_with_extension", libs);
  gidLink(cast(void**)&gst_type_find_helper_for_data, "gst_type_find_helper_for_data", libs);
  gidLink(cast(void**)&gst_type_find_helper_for_data_with_caps, "gst_type_find_helper_for_data_with_caps", libs);
  gidLink(cast(void**)&gst_type_find_helper_for_data_with_extension, "gst_type_find_helper_for_data_with_extension", libs);
  gidLink(cast(void**)&gst_type_find_helper_for_extension, "gst_type_find_helper_for_extension", libs);
  gidLink(cast(void**)&gst_type_find_helper_get_range, "gst_type_find_helper_get_range", libs);
  gidLink(cast(void**)&gst_type_find_helper_get_range_full, "gst_type_find_helper_get_range_full", libs);
  gidLink(cast(void**)&gst_type_find_list_factories_for_caps, "gst_type_find_list_factories_for_caps", libs);
}
