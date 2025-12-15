/// C functions for gstbase1 library
module gstbase.c.functions;

public import gid.basictypes;
import gid.loader;
import gstbase.c.types;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gst.c.types;

version(Windows)
  private immutable LIBS = ["libgstbase-1.0-0.dll;gstbase-1.0-0.dll;gstbase-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstbase-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstbase-1.0.so.0"];

__gshared extern(C)
{
  // Adapter
  GType function() c_gst_adapter_get_type; ///
  GstAdapter* function() c_gst_adapter_new; ///
  size_t function(GstAdapter* adapter) c_gst_adapter_available; ///
  size_t function(GstAdapter* adapter) c_gst_adapter_available_fast; ///
  void function(GstAdapter* adapter) c_gst_adapter_clear; ///
  void function(GstAdapter* adapter, void* dest, size_t offset, size_t size) c_gst_adapter_copy; ///
  GBytes* function(GstAdapter* adapter, size_t offset, size_t size) c_gst_adapter_copy_bytes; ///
  ulong function(GstAdapter* adapter) c_gst_adapter_distance_from_discont; ///
  GstClockTime function(GstAdapter* adapter) c_gst_adapter_dts_at_discont; ///
  void function(GstAdapter* adapter, size_t flush) c_gst_adapter_flush; ///
  GstBuffer* function(GstAdapter* adapter, size_t nbytes) c_gst_adapter_get_buffer; ///
  GstBuffer* function(GstAdapter* adapter, size_t nbytes) c_gst_adapter_get_buffer_fast; ///
  GstBufferList* function(GstAdapter* adapter, size_t nbytes) c_gst_adapter_get_buffer_list; ///
  GList* function(GstAdapter* adapter, size_t nbytes) c_gst_adapter_get_list; ///
  const(void)* function(GstAdapter* adapter, size_t size) c_gst_adapter_map; ///
  ptrdiff_t function(GstAdapter* adapter, uint mask, uint pattern, size_t offset, size_t size) c_gst_adapter_masked_scan_uint32; ///
  ptrdiff_t function(GstAdapter* adapter, uint mask, uint pattern, size_t offset, size_t size, uint* value) c_gst_adapter_masked_scan_uint32_peek; ///
  ulong function(GstAdapter* adapter) c_gst_adapter_offset_at_discont; ///
  GstClockTime function(GstAdapter* adapter, ulong* distance) c_gst_adapter_prev_dts; ///
  GstClockTime function(GstAdapter* adapter, size_t offset, ulong* distance) c_gst_adapter_prev_dts_at_offset; ///
  ulong function(GstAdapter* adapter, ulong* distance) c_gst_adapter_prev_offset; ///
  GstClockTime function(GstAdapter* adapter, ulong* distance) c_gst_adapter_prev_pts; ///
  GstClockTime function(GstAdapter* adapter, size_t offset, ulong* distance) c_gst_adapter_prev_pts_at_offset; ///
  GstClockTime function(GstAdapter* adapter) c_gst_adapter_pts_at_discont; ///
  void function(GstAdapter* adapter, GstBuffer* buf) c_gst_adapter_push; ///
  void* function(GstAdapter* adapter, size_t nbytes) c_gst_adapter_take; ///
  GstBuffer* function(GstAdapter* adapter, size_t nbytes) c_gst_adapter_take_buffer; ///
  GstBuffer* function(GstAdapter* adapter, size_t nbytes) c_gst_adapter_take_buffer_fast; ///
  GstBufferList* function(GstAdapter* adapter, size_t nbytes) c_gst_adapter_take_buffer_list; ///
  GList* function(GstAdapter* adapter, size_t nbytes) c_gst_adapter_take_list; ///
  void function(GstAdapter* adapter) c_gst_adapter_unmap; ///

  // Aggregator
  GType function() c_gst_aggregator_get_type; ///
  GstFlowReturn function(GstAggregator* aggregator, GstBuffer* buffer) c_gst_aggregator_finish_buffer; ///
  GstFlowReturn function(GstAggregator* aggregator, GstBufferList* bufferlist) c_gst_aggregator_finish_buffer_list; ///
  void function(GstAggregator* self, GstAllocator** allocator, GstAllocationParams* params) c_gst_aggregator_get_allocator; ///
  GstBufferPool* function(GstAggregator* self) c_gst_aggregator_get_buffer_pool; ///
  gboolean function(GstAggregator* self) c_gst_aggregator_get_force_live; ///
  gboolean function(GstAggregator* self) c_gst_aggregator_get_ignore_inactive_pads; ///
  GstClockTime function(GstAggregator* self) c_gst_aggregator_get_latency; ///
  gboolean function(GstAggregator* self) c_gst_aggregator_negotiate; ///
  GstSample* function(GstAggregator* self, GstAggregatorPad* pad) c_gst_aggregator_peek_next_sample; ///
  void function(GstAggregator* self, GstClockTime pts, GstClockTime dts, GstClockTime duration, GstStructure* info) c_gst_aggregator_selected_samples; ///
  void function(GstAggregator* self, gboolean forceLive) c_gst_aggregator_set_force_live; ///
  void function(GstAggregator* self, gboolean ignore) c_gst_aggregator_set_ignore_inactive_pads; ///
  void function(GstAggregator* self, GstClockTime minLatency, GstClockTime maxLatency) c_gst_aggregator_set_latency; ///
  void function(GstAggregator* self, GstCaps* caps) c_gst_aggregator_set_src_caps; ///
  GstClockTime function(GstAggregator* self) c_gst_aggregator_simple_get_next_time; ///
  void function(GstAggregator* self, const(GstSegment)* segment) c_gst_aggregator_update_segment; ///

  // AggregatorPad
  GType function() c_gst_aggregator_pad_get_type; ///
  gboolean function(GstAggregatorPad* pad) c_gst_aggregator_pad_drop_buffer; ///
  gboolean function(GstAggregatorPad* pad) c_gst_aggregator_pad_has_buffer; ///
  gboolean function(GstAggregatorPad* pad) c_gst_aggregator_pad_is_eos; ///
  gboolean function(GstAggregatorPad* pad) c_gst_aggregator_pad_is_inactive; ///
  GstBuffer* function(GstAggregatorPad* pad) c_gst_aggregator_pad_peek_buffer; ///
  GstBuffer* function(GstAggregatorPad* pad) c_gst_aggregator_pad_pop_buffer; ///

  // BaseParse
  GType function() c_gst_base_parse_get_type; ///
  gboolean function(GstBaseParse* parse, ulong offset, GstClockTime ts, gboolean key, gboolean force) c_gst_base_parse_add_index_entry; ///
  gboolean function(GstBaseParse* parse, GstFormat srcFormat, long srcValue, GstFormat destFormat, long* destValue) c_gst_base_parse_convert_default; ///
  void function(GstBaseParse* parse) c_gst_base_parse_drain; ///
  GstFlowReturn function(GstBaseParse* parse, GstBaseParseFrame* frame, int size) c_gst_base_parse_finish_frame; ///
  void function(GstBaseParse* parse, GstTagList* tags, GstTagMergeMode mode) c_gst_base_parse_merge_tags; ///
  GstFlowReturn function(GstBaseParse* parse, GstBaseParseFrame* frame) c_gst_base_parse_push_frame; ///
  void function(GstBaseParse* parse, uint bitrate) c_gst_base_parse_set_average_bitrate; ///
  void function(GstBaseParse* parse, GstFormat fmt, long duration, int interval) c_gst_base_parse_set_duration; ///
  void function(GstBaseParse* parse, uint fpsNum, uint fpsDen, uint leadIn, uint leadOut) c_gst_base_parse_set_frame_rate; ///
  void function(GstBaseParse* parse, gboolean hasTiming) c_gst_base_parse_set_has_timing_info; ///
  void function(GstBaseParse* parse, gboolean inferTs) c_gst_base_parse_set_infer_ts; ///
  void function(GstBaseParse* parse, GstClockTime minLatency, GstClockTime maxLatency) c_gst_base_parse_set_latency; ///
  void function(GstBaseParse* parse, uint minSize) c_gst_base_parse_set_min_frame_size; ///
  void function(GstBaseParse* parse, gboolean passthrough) c_gst_base_parse_set_passthrough; ///
  void function(GstBaseParse* parse, gboolean ptsInterpolate) c_gst_base_parse_set_pts_interpolation; ///
  void function(GstBaseParse* parse, gboolean syncable) c_gst_base_parse_set_syncable; ///
  void function(GstBaseParse* parse, size_t offset) c_gst_base_parse_set_ts_at_offset; ///

  // BaseParseFrame
  GType function() c_gst_base_parse_frame_get_type; ///
  GstBaseParseFrame* function(GstBuffer* buffer, GstBaseParseFrameFlags flags, int overhead) c_gst_base_parse_frame_new; ///
  GstBaseParseFrame* function(GstBaseParseFrame* frame) c_gst_base_parse_frame_copy; ///
  void function(GstBaseParseFrame* frame) c_gst_base_parse_frame_free; ///
  void function(GstBaseParseFrame* frame) c_gst_base_parse_frame_init; ///

  // BaseSink
  GType function() c_gst_base_sink_get_type; ///
  GstFlowReturn function(GstBaseSink* sink, GstMiniObject* obj) c_gst_base_sink_do_preroll; ///
  uint function(GstBaseSink* sink) c_gst_base_sink_get_blocksize; ///
  gboolean function(GstBaseSink* sink) c_gst_base_sink_get_drop_out_of_segment; ///
  GstSample* function(GstBaseSink* sink) c_gst_base_sink_get_last_sample; ///
  GstClockTime function(GstBaseSink* sink) c_gst_base_sink_get_latency; ///
  ulong function(GstBaseSink* sink) c_gst_base_sink_get_max_bitrate; ///
  long function(GstBaseSink* sink) c_gst_base_sink_get_max_lateness; ///
  GstClockTime function(GstBaseSink* sink) c_gst_base_sink_get_processing_deadline; ///
  GstClockTime function(GstBaseSink* sink) c_gst_base_sink_get_render_delay; ///
  GstStructure* function(GstBaseSink* sink) c_gst_base_sink_get_stats; ///
  gboolean function(GstBaseSink* sink) c_gst_base_sink_get_sync; ///
  ulong function(GstBaseSink* sink) c_gst_base_sink_get_throttle_time; ///
  GstClockTimeDiff function(GstBaseSink* sink) c_gst_base_sink_get_ts_offset; ///
  gboolean function(GstBaseSink* sink) c_gst_base_sink_is_async_enabled; ///
  gboolean function(GstBaseSink* sink) c_gst_base_sink_is_last_sample_enabled; ///
  gboolean function(GstBaseSink* sink) c_gst_base_sink_is_qos_enabled; ///
  gboolean function(GstBaseSink* sink, gboolean* live, gboolean* upstreamLive, GstClockTime* minLatency, GstClockTime* maxLatency) c_gst_base_sink_query_latency; ///
  void function(GstBaseSink* sink, gboolean enabled) c_gst_base_sink_set_async_enabled; ///
  void function(GstBaseSink* sink, uint blocksize) c_gst_base_sink_set_blocksize; ///
  void function(GstBaseSink* sink, gboolean dropOutOfSegment) c_gst_base_sink_set_drop_out_of_segment; ///
  void function(GstBaseSink* sink, gboolean enabled) c_gst_base_sink_set_last_sample_enabled; ///
  void function(GstBaseSink* sink, ulong maxBitrate) c_gst_base_sink_set_max_bitrate; ///
  void function(GstBaseSink* sink, long maxLateness) c_gst_base_sink_set_max_lateness; ///
  void function(GstBaseSink* sink, GstClockTime processingDeadline) c_gst_base_sink_set_processing_deadline; ///
  void function(GstBaseSink* sink, gboolean enabled) c_gst_base_sink_set_qos_enabled; ///
  void function(GstBaseSink* sink, GstClockTime delay) c_gst_base_sink_set_render_delay; ///
  void function(GstBaseSink* sink, gboolean sync) c_gst_base_sink_set_sync; ///
  void function(GstBaseSink* sink, ulong throttle) c_gst_base_sink_set_throttle_time; ///
  void function(GstBaseSink* sink, GstClockTimeDiff offset) c_gst_base_sink_set_ts_offset; ///
  GstFlowReturn function(GstBaseSink* sink, GstClockTime time, GstClockTimeDiff* jitter) c_gst_base_sink_wait; ///
  GstClockReturn function(GstBaseSink* sink, GstClockTime time, GstClockTimeDiff* jitter) c_gst_base_sink_wait_clock; ///
  GstFlowReturn function(GstBaseSink* sink) c_gst_base_sink_wait_preroll; ///

  // BaseSrc
  GType function() c_gst_base_src_get_type; ///
  void function(GstBaseSrc* src, GstAllocator** allocator, GstAllocationParams* params) c_gst_base_src_get_allocator; ///
  uint function(GstBaseSrc* src) c_gst_base_src_get_blocksize; ///
  GstBufferPool* function(GstBaseSrc* src) c_gst_base_src_get_buffer_pool; ///
  gboolean function(GstBaseSrc* src) c_gst_base_src_get_do_timestamp; ///
  gboolean function(GstBaseSrc* src) c_gst_base_src_is_async; ///
  gboolean function(GstBaseSrc* src) c_gst_base_src_is_live; ///
  gboolean function(GstBaseSrc* src) c_gst_base_src_negotiate; ///
  gboolean function(GstBaseSrc* src, long start, long stop, long time) c_gst_base_src_new_seamless_segment; ///
  gboolean function(GstBaseSrc* src, const(GstSegment)* segment) c_gst_base_src_new_segment; ///
  gboolean function(GstBaseSrc* src, const(GstSegment)* segment) c_gst_base_src_push_segment; ///
  gboolean function(GstBaseSrc* src, gboolean* live, GstClockTime* minLatency, GstClockTime* maxLatency) c_gst_base_src_query_latency; ///
  void function(GstBaseSrc* src, gboolean async) c_gst_base_src_set_async; ///
  void function(GstBaseSrc* src, gboolean automaticEos) c_gst_base_src_set_automatic_eos; ///
  void function(GstBaseSrc* src, uint blocksize) c_gst_base_src_set_blocksize; ///
  gboolean function(GstBaseSrc* src, GstCaps* caps) c_gst_base_src_set_caps; ///
  void function(GstBaseSrc* src, gboolean timestamp) c_gst_base_src_set_do_timestamp; ///
  void function(GstBaseSrc* src, gboolean dynamic) c_gst_base_src_set_dynamic_size; ///
  void function(GstBaseSrc* src, GstFormat format) c_gst_base_src_set_format; ///
  void function(GstBaseSrc* src, gboolean live) c_gst_base_src_set_live; ///
  void function(GstBaseSrc* basesrc, GstFlowReturn ret) c_gst_base_src_start_complete; ///
  GstFlowReturn function(GstBaseSrc* basesrc) c_gst_base_src_start_wait; ///
  void function(GstBaseSrc* src, GstBufferList* bufferList) c_gst_base_src_submit_buffer_list; ///
  GstFlowReturn function(GstBaseSrc* src) c_gst_base_src_wait_playing; ///

  // BaseTransform
  GType function() c_gst_base_transform_get_type; ///
  void function(GstBaseTransform* trans, GstAllocator** allocator, GstAllocationParams* params) c_gst_base_transform_get_allocator; ///
  GstBufferPool* function(GstBaseTransform* trans) c_gst_base_transform_get_buffer_pool; ///
  gboolean function(GstBaseTransform* trans) c_gst_base_transform_is_in_place; ///
  gboolean function(GstBaseTransform* trans) c_gst_base_transform_is_passthrough; ///
  gboolean function(GstBaseTransform* trans) c_gst_base_transform_is_qos_enabled; ///
  gboolean function(GstBaseTransform* trans) c_gst_base_transform_reconfigure; ///
  void function(GstBaseTransform* trans) c_gst_base_transform_reconfigure_sink; ///
  void function(GstBaseTransform* trans) c_gst_base_transform_reconfigure_src; ///
  void function(GstBaseTransform* trans, gboolean gapAware) c_gst_base_transform_set_gap_aware; ///
  void function(GstBaseTransform* trans, gboolean inPlace) c_gst_base_transform_set_in_place; ///
  void function(GstBaseTransform* trans, gboolean passthrough) c_gst_base_transform_set_passthrough; ///
  void function(GstBaseTransform* trans, gboolean preferPassthrough) c_gst_base_transform_set_prefer_passthrough; ///
  void function(GstBaseTransform* trans, gboolean enabled) c_gst_base_transform_set_qos_enabled; ///
  void function(GstBaseTransform* trans, double proportion, GstClockTimeDiff diff, GstClockTime timestamp) c_gst_base_transform_update_qos; ///
  gboolean function(GstBaseTransform* trans, GstCaps* updatedCaps) c_gst_base_transform_update_src_caps; ///

  // BitReader
  void function(GstBitReader* reader) c_gst_bit_reader_free; ///
  gboolean function(GstBitReader* reader, ushort* val, uint nbits) c_gst_bit_reader_get_bits_uint16; ///
  gboolean function(GstBitReader* reader, uint* val, uint nbits) c_gst_bit_reader_get_bits_uint32; ///
  gboolean function(GstBitReader* reader, ulong* val, uint nbits) c_gst_bit_reader_get_bits_uint64; ///
  gboolean function(GstBitReader* reader, ubyte* val, uint nbits) c_gst_bit_reader_get_bits_uint8; ///
  uint function(const(GstBitReader)* reader) c_gst_bit_reader_get_pos; ///
  uint function(const(GstBitReader)* reader) c_gst_bit_reader_get_remaining; ///
  uint function(const(GstBitReader)* reader) c_gst_bit_reader_get_size; ///
  void function(GstBitReader* reader, const(ubyte)* data, uint size) c_gst_bit_reader_init; ///
  gboolean function(const(GstBitReader)* reader, ushort* val, uint nbits) c_gst_bit_reader_peek_bits_uint16; ///
  gboolean function(const(GstBitReader)* reader, uint* val, uint nbits) c_gst_bit_reader_peek_bits_uint32; ///
  gboolean function(const(GstBitReader)* reader, ulong* val, uint nbits) c_gst_bit_reader_peek_bits_uint64; ///
  gboolean function(const(GstBitReader)* reader, ubyte* val, uint nbits) c_gst_bit_reader_peek_bits_uint8; ///
  gboolean function(GstBitReader* reader, uint pos) c_gst_bit_reader_set_pos; ///
  gboolean function(GstBitReader* reader, uint nbits) c_gst_bit_reader_skip; ///
  gboolean function(GstBitReader* reader) c_gst_bit_reader_skip_to_byte; ///
  GstBitReader* function(const(ubyte)* data, uint size) c_gst_bit_reader_new; ///

  // BitWriter
  gboolean function(GstBitWriter* bitwriter, ubyte trailingBit) c_gst_bit_writer_align_bytes; ///
  void function(GstBitWriter* bitwriter) c_gst_bit_writer_free; ///
  GstBuffer* function(GstBitWriter* bitwriter) c_gst_bit_writer_free_and_get_buffer; ///
  ubyte* function(GstBitWriter* bitwriter) c_gst_bit_writer_free_and_get_data; ///
  ubyte* function(const(GstBitWriter)* bitwriter) c_gst_bit_writer_get_data; ///
  uint function(const(GstBitWriter)* bitwriter) c_gst_bit_writer_get_remaining; ///
  uint function(const(GstBitWriter)* bitwriter) c_gst_bit_writer_get_size; ///
  void function(GstBitWriter* bitwriter) c_gst_bit_writer_init; ///
  void function(GstBitWriter* bitwriter, ubyte* data, uint size, gboolean initialized) c_gst_bit_writer_init_with_data; ///
  void function(GstBitWriter* bitwriter, uint size, gboolean fixed) c_gst_bit_writer_init_with_size; ///
  gboolean function(GstBitWriter* bitwriter, ushort value, uint nbits) c_gst_bit_writer_put_bits_uint16; ///
  gboolean function(GstBitWriter* bitwriter, uint value, uint nbits) c_gst_bit_writer_put_bits_uint32; ///
  gboolean function(GstBitWriter* bitwriter, ulong value, uint nbits) c_gst_bit_writer_put_bits_uint64; ///
  gboolean function(GstBitWriter* bitwriter, ubyte value, uint nbits) c_gst_bit_writer_put_bits_uint8; ///
  gboolean function(GstBitWriter* bitwriter, const(ubyte)* data, uint nbytes) c_gst_bit_writer_put_bytes; ///
  void function(GstBitWriter* bitwriter) c_gst_bit_writer_reset; ///
  GstBuffer* function(GstBitWriter* bitwriter) c_gst_bit_writer_reset_and_get_buffer; ///
  ubyte* function(GstBitWriter* bitwriter) c_gst_bit_writer_reset_and_get_data; ///
  gboolean function(GstBitWriter* bitwriter, uint pos) c_gst_bit_writer_set_pos; ///
  GstBitWriter* function() c_gst_bit_writer_new; ///
  GstBitWriter* function(ubyte* data, uint size, gboolean initialized) c_gst_bit_writer_new_with_data; ///
  GstBitWriter* function(uint size, gboolean fixed) c_gst_bit_writer_new_with_size; ///

  // ByteReader
  gboolean function(GstByteReader* reader, uint size, ubyte** val) c_gst_byte_reader_dup_data; ///
  gboolean function(GstByteReader* reader, ushort** str) c_gst_byte_reader_dup_string_utf16; ///
  gboolean function(GstByteReader* reader, uint** str) c_gst_byte_reader_dup_string_utf32; ///
  gboolean function(GstByteReader* reader, char** str) c_gst_byte_reader_dup_string_utf8; ///
  void function(GstByteReader* reader) c_gst_byte_reader_free; ///
  gboolean function(GstByteReader* reader, uint size, const(ubyte*)* val) c_gst_byte_reader_get_data; ///
  gboolean function(GstByteReader* reader, float* val) c_gst_byte_reader_get_float32_be; ///
  gboolean function(GstByteReader* reader, float* val) c_gst_byte_reader_get_float32_le; ///
  gboolean function(GstByteReader* reader, double* val) c_gst_byte_reader_get_float64_be; ///
  gboolean function(GstByteReader* reader, double* val) c_gst_byte_reader_get_float64_le; ///
  gboolean function(GstByteReader* reader, short* val) c_gst_byte_reader_get_int16_be; ///
  gboolean function(GstByteReader* reader, short* val) c_gst_byte_reader_get_int16_le; ///
  gboolean function(GstByteReader* reader, int* val) c_gst_byte_reader_get_int24_be; ///
  gboolean function(GstByteReader* reader, int* val) c_gst_byte_reader_get_int24_le; ///
  gboolean function(GstByteReader* reader, int* val) c_gst_byte_reader_get_int32_be; ///
  gboolean function(GstByteReader* reader, int* val) c_gst_byte_reader_get_int32_le; ///
  gboolean function(GstByteReader* reader, long* val) c_gst_byte_reader_get_int64_be; ///
  gboolean function(GstByteReader* reader, long* val) c_gst_byte_reader_get_int64_le; ///
  gboolean function(GstByteReader* reader, byte* val) c_gst_byte_reader_get_int8; ///
  uint function(const(GstByteReader)* reader) c_gst_byte_reader_get_pos; ///
  uint function(const(GstByteReader)* reader) c_gst_byte_reader_get_remaining; ///
  uint function(const(GstByteReader)* reader) c_gst_byte_reader_get_size; ///
  gboolean function(GstByteReader* reader, const(char*)* str) c_gst_byte_reader_get_string_utf8; ///
  gboolean function(GstByteReader* reader, GstByteReader* subReader, uint size) c_gst_byte_reader_get_sub_reader; ///
  gboolean function(GstByteReader* reader, ushort* val) c_gst_byte_reader_get_uint16_be; ///
  gboolean function(GstByteReader* reader, ushort* val) c_gst_byte_reader_get_uint16_le; ///
  gboolean function(GstByteReader* reader, uint* val) c_gst_byte_reader_get_uint24_be; ///
  gboolean function(GstByteReader* reader, uint* val) c_gst_byte_reader_get_uint24_le; ///
  gboolean function(GstByteReader* reader, uint* val) c_gst_byte_reader_get_uint32_be; ///
  gboolean function(GstByteReader* reader, uint* val) c_gst_byte_reader_get_uint32_le; ///
  gboolean function(GstByteReader* reader, ulong* val) c_gst_byte_reader_get_uint64_be; ///
  gboolean function(GstByteReader* reader, ulong* val) c_gst_byte_reader_get_uint64_le; ///
  gboolean function(GstByteReader* reader, ubyte* val) c_gst_byte_reader_get_uint8; ///
  void function(GstByteReader* reader, const(ubyte)* data, uint size) c_gst_byte_reader_init; ///
  uint function(const(GstByteReader)* reader, uint mask, uint pattern, uint offset, uint size) c_gst_byte_reader_masked_scan_uint32; ///
  uint function(const(GstByteReader)* reader, uint mask, uint pattern, uint offset, uint size, uint* value) c_gst_byte_reader_masked_scan_uint32_peek; ///
  gboolean function(const(GstByteReader)* reader, uint size, const(ubyte*)* val) c_gst_byte_reader_peek_data; ///
  gboolean function(const(GstByteReader)* reader, float* val) c_gst_byte_reader_peek_float32_be; ///
  gboolean function(const(GstByteReader)* reader, float* val) c_gst_byte_reader_peek_float32_le; ///
  gboolean function(const(GstByteReader)* reader, double* val) c_gst_byte_reader_peek_float64_be; ///
  gboolean function(const(GstByteReader)* reader, double* val) c_gst_byte_reader_peek_float64_le; ///
  gboolean function(const(GstByteReader)* reader, short* val) c_gst_byte_reader_peek_int16_be; ///
  gboolean function(const(GstByteReader)* reader, short* val) c_gst_byte_reader_peek_int16_le; ///
  gboolean function(const(GstByteReader)* reader, int* val) c_gst_byte_reader_peek_int24_be; ///
  gboolean function(const(GstByteReader)* reader, int* val) c_gst_byte_reader_peek_int24_le; ///
  gboolean function(const(GstByteReader)* reader, int* val) c_gst_byte_reader_peek_int32_be; ///
  gboolean function(const(GstByteReader)* reader, int* val) c_gst_byte_reader_peek_int32_le; ///
  gboolean function(const(GstByteReader)* reader, long* val) c_gst_byte_reader_peek_int64_be; ///
  gboolean function(const(GstByteReader)* reader, long* val) c_gst_byte_reader_peek_int64_le; ///
  gboolean function(const(GstByteReader)* reader, byte* val) c_gst_byte_reader_peek_int8; ///
  gboolean function(const(GstByteReader)* reader, const(char*)* str) c_gst_byte_reader_peek_string_utf8; ///
  gboolean function(GstByteReader* reader, GstByteReader* subReader, uint size) c_gst_byte_reader_peek_sub_reader; ///
  gboolean function(const(GstByteReader)* reader, ushort* val) c_gst_byte_reader_peek_uint16_be; ///
  gboolean function(const(GstByteReader)* reader, ushort* val) c_gst_byte_reader_peek_uint16_le; ///
  gboolean function(const(GstByteReader)* reader, uint* val) c_gst_byte_reader_peek_uint24_be; ///
  gboolean function(const(GstByteReader)* reader, uint* val) c_gst_byte_reader_peek_uint24_le; ///
  gboolean function(const(GstByteReader)* reader, uint* val) c_gst_byte_reader_peek_uint32_be; ///
  gboolean function(const(GstByteReader)* reader, uint* val) c_gst_byte_reader_peek_uint32_le; ///
  gboolean function(const(GstByteReader)* reader, ulong* val) c_gst_byte_reader_peek_uint64_be; ///
  gboolean function(const(GstByteReader)* reader, ulong* val) c_gst_byte_reader_peek_uint64_le; ///
  gboolean function(const(GstByteReader)* reader, ubyte* val) c_gst_byte_reader_peek_uint8; ///
  gboolean function(GstByteReader* reader, uint pos) c_gst_byte_reader_set_pos; ///
  gboolean function(GstByteReader* reader, uint nbytes) c_gst_byte_reader_skip; ///
  gboolean function(GstByteReader* reader) c_gst_byte_reader_skip_string_utf16; ///
  gboolean function(GstByteReader* reader) c_gst_byte_reader_skip_string_utf32; ///
  gboolean function(GstByteReader* reader) c_gst_byte_reader_skip_string_utf8; ///
  GstByteReader* function(const(ubyte)* data, uint size) c_gst_byte_reader_new; ///

  // ByteWriter
  gboolean function(GstByteWriter* writer, uint size) c_gst_byte_writer_ensure_free_space; ///
  gboolean function(GstByteWriter* writer, ubyte value, uint size) c_gst_byte_writer_fill; ///
  void function(GstByteWriter* writer) c_gst_byte_writer_free; ///
  GstBuffer* function(GstByteWriter* writer) c_gst_byte_writer_free_and_get_buffer; ///
  ubyte* function(GstByteWriter* writer) c_gst_byte_writer_free_and_get_data; ///
  uint function(const(GstByteWriter)* writer) c_gst_byte_writer_get_remaining; ///
  void function(GstByteWriter* writer) c_gst_byte_writer_init; ///
  void function(GstByteWriter* writer, ubyte* data, uint size, gboolean initialized) c_gst_byte_writer_init_with_data; ///
  void function(GstByteWriter* writer, uint size, gboolean fixed) c_gst_byte_writer_init_with_size; ///
  gboolean function(GstByteWriter* writer, GstBuffer* buffer, size_t offset, ptrdiff_t size) c_gst_byte_writer_put_buffer; ///
  gboolean function(GstByteWriter* writer, const(ubyte)* data, uint size) c_gst_byte_writer_put_data; ///
  gboolean function(GstByteWriter* writer, float val) c_gst_byte_writer_put_float32_be; ///
  gboolean function(GstByteWriter* writer, float val) c_gst_byte_writer_put_float32_le; ///
  gboolean function(GstByteWriter* writer, double val) c_gst_byte_writer_put_float64_be; ///
  gboolean function(GstByteWriter* writer, double val) c_gst_byte_writer_put_float64_le; ///
  gboolean function(GstByteWriter* writer, short val) c_gst_byte_writer_put_int16_be; ///
  gboolean function(GstByteWriter* writer, short val) c_gst_byte_writer_put_int16_le; ///
  gboolean function(GstByteWriter* writer, int val) c_gst_byte_writer_put_int24_be; ///
  gboolean function(GstByteWriter* writer, int val) c_gst_byte_writer_put_int24_le; ///
  gboolean function(GstByteWriter* writer, int val) c_gst_byte_writer_put_int32_be; ///
  gboolean function(GstByteWriter* writer, int val) c_gst_byte_writer_put_int32_le; ///
  gboolean function(GstByteWriter* writer, long val) c_gst_byte_writer_put_int64_be; ///
  gboolean function(GstByteWriter* writer, long val) c_gst_byte_writer_put_int64_le; ///
  gboolean function(GstByteWriter* writer, byte val) c_gst_byte_writer_put_int8; ///
  gboolean function(GstByteWriter* writer, const(ushort)* data) c_gst_byte_writer_put_string_utf16; ///
  gboolean function(GstByteWriter* writer, const(uint)* data) c_gst_byte_writer_put_string_utf32; ///
  gboolean function(GstByteWriter* writer, const(char)* data) c_gst_byte_writer_put_string_utf8; ///
  gboolean function(GstByteWriter* writer, ushort val) c_gst_byte_writer_put_uint16_be; ///
  gboolean function(GstByteWriter* writer, ushort val) c_gst_byte_writer_put_uint16_le; ///
  gboolean function(GstByteWriter* writer, uint val) c_gst_byte_writer_put_uint24_be; ///
  gboolean function(GstByteWriter* writer, uint val) c_gst_byte_writer_put_uint24_le; ///
  gboolean function(GstByteWriter* writer, uint val) c_gst_byte_writer_put_uint32_be; ///
  gboolean function(GstByteWriter* writer, uint val) c_gst_byte_writer_put_uint32_le; ///
  gboolean function(GstByteWriter* writer, ulong val) c_gst_byte_writer_put_uint64_be; ///
  gboolean function(GstByteWriter* writer, ulong val) c_gst_byte_writer_put_uint64_le; ///
  gboolean function(GstByteWriter* writer, ubyte val) c_gst_byte_writer_put_uint8; ///
  void function(GstByteWriter* writer) c_gst_byte_writer_reset; ///
  GstBuffer* function(GstByteWriter* writer) c_gst_byte_writer_reset_and_get_buffer; ///
  ubyte* function(GstByteWriter* writer) c_gst_byte_writer_reset_and_get_data; ///
  GstByteWriter* function() c_gst_byte_writer_new; ///
  GstByteWriter* function(ubyte* data, uint size, gboolean initialized) c_gst_byte_writer_new_with_data; ///
  GstByteWriter* function(uint size, gboolean fixed) c_gst_byte_writer_new_with_size; ///

  // CollectPads
  GType function() c_gst_collect_pads_get_type; ///
  GstCollectPads* function() c_gst_collect_pads_new; ///
  GstCollectData* function(GstCollectPads* pads, GstPad* pad, uint size, GstCollectDataDestroyNotify destroyNotify, gboolean lock) c_gst_collect_pads_add_pad; ///
  uint function(GstCollectPads* pads) c_gst_collect_pads_available; ///
  GstFlowReturn function(GstCollectPads* pads, GstCollectData* cdata, GstBuffer* buf, GstBuffer** outbuf, void* userData) c_gst_collect_pads_clip_running_time; ///
  gboolean function(GstCollectPads* pads, GstCollectData* data, GstEvent* event, gboolean discard) c_gst_collect_pads_event_default; ///
  uint function(GstCollectPads* pads, GstCollectData* data, uint size) c_gst_collect_pads_flush; ///
  GstBuffer* function(GstCollectPads* pads, GstCollectData* data) c_gst_collect_pads_peek; ///
  GstBuffer* function(GstCollectPads* pads, GstCollectData* data) c_gst_collect_pads_pop; ///
  gboolean function(GstCollectPads* pads, GstCollectData* data, GstQuery* query, gboolean discard) c_gst_collect_pads_query_default; ///
  GstBuffer* function(GstCollectPads* pads, GstCollectData* data, uint size) c_gst_collect_pads_read_buffer; ///
  gboolean function(GstCollectPads* pads, GstPad* pad) c_gst_collect_pads_remove_pad; ///
  void function(GstCollectPads* pads, GstCollectPadsBufferFunction func, void* userData) c_gst_collect_pads_set_buffer_function; ///
  void function(GstCollectPads* pads, GstCollectPadsClipFunction clipfunc, void* userData) c_gst_collect_pads_set_clip_function; ///
  void function(GstCollectPads* pads, GstCollectPadsCompareFunction func, void* userData) c_gst_collect_pads_set_compare_function; ///
  void function(GstCollectPads* pads, GstCollectPadsEventFunction func, void* userData) c_gst_collect_pads_set_event_function; ///
  void function(GstCollectPads* pads, GstCollectPadsFlushFunction func, void* userData) c_gst_collect_pads_set_flush_function; ///
  void function(GstCollectPads* pads, gboolean flushing) c_gst_collect_pads_set_flushing; ///
  void function(GstCollectPads* pads, GstCollectPadsFunction func, void* userData) c_gst_collect_pads_set_function; ///
  void function(GstCollectPads* pads, GstCollectPadsQueryFunction func, void* userData) c_gst_collect_pads_set_query_function; ///
  void function(GstCollectPads* pads, GstCollectData* data, gboolean waiting) c_gst_collect_pads_set_waiting; ///
  gboolean function(GstCollectPads* pads, GstPad* pad, GstEvent* event) c_gst_collect_pads_src_event_default; ///
  void function(GstCollectPads* pads) c_gst_collect_pads_start; ///
  void function(GstCollectPads* pads) c_gst_collect_pads_stop; ///
  GstBuffer* function(GstCollectPads* pads, GstCollectData* data, uint size) c_gst_collect_pads_take_buffer; ///

  // DataQueue
  GType function() c_gst_data_queue_get_type; ///
  GstDataQueue* function(GstDataQueueCheckFullFunction checkfull, GstDataQueueFullCallback fullcallback, GstDataQueueEmptyCallback emptycallback, void* checkdata) c_gst_data_queue_new; ///
  gboolean function(GstDataQueue* queue, GType type) c_gst_data_queue_drop_head; ///
  void function(GstDataQueue* queue) c_gst_data_queue_flush; ///
  void function(GstDataQueue* queue, GstDataQueueSize* level) c_gst_data_queue_get_level; ///
  gboolean function(GstDataQueue* queue) c_gst_data_queue_is_empty; ///
  gboolean function(GstDataQueue* queue) c_gst_data_queue_is_full; ///
  void function(GstDataQueue* queue) c_gst_data_queue_limits_changed; ///
  gboolean function(GstDataQueue* queue, GstDataQueueItem** item) c_gst_data_queue_peek; ///
  gboolean function(GstDataQueue* queue, GstDataQueueItem** item) c_gst_data_queue_pop; ///
  gboolean function(GstDataQueue* queue, GstDataQueueItem* item) c_gst_data_queue_push; ///
  gboolean function(GstDataQueue* queue, GstDataQueueItem* item) c_gst_data_queue_push_force; ///
  void function(GstDataQueue* queue, gboolean flushing) c_gst_data_queue_set_flushing; ///

  // FlowCombiner
  GType function() c_gst_flow_combiner_get_type; ///
  GstFlowCombiner* function() c_gst_flow_combiner_new; ///
  void function(GstFlowCombiner* combiner, GstPad* pad) c_gst_flow_combiner_add_pad; ///
  void function(GstFlowCombiner* combiner) c_gst_flow_combiner_clear; ///
  void function(GstFlowCombiner* combiner) c_gst_flow_combiner_free; ///
  GstFlowCombiner* function(GstFlowCombiner* combiner) c_gst_flow_combiner_ref; ///
  void function(GstFlowCombiner* combiner, GstPad* pad) c_gst_flow_combiner_remove_pad; ///
  void function(GstFlowCombiner* combiner) c_gst_flow_combiner_reset; ///
  void function(GstFlowCombiner* combiner) c_gst_flow_combiner_unref; ///
  GstFlowReturn function(GstFlowCombiner* combiner, GstFlowReturn fret) c_gst_flow_combiner_update_flow; ///
  GstFlowReturn function(GstFlowCombiner* combiner, GstPad* pad, GstFlowReturn fret) c_gst_flow_combiner_update_pad_flow; ///

  // PushSrc
  GType function() c_gst_push_src_get_type; ///

  // QueueArray
  void function(GstQueueArray* array) c_gst_queue_array_clear; ///
  void* function(GstQueueArray* array, uint idx) c_gst_queue_array_drop_element; ///
  gboolean function(GstQueueArray* array, uint idx, void* pStruct) c_gst_queue_array_drop_struct; ///
  uint function(GstQueueArray* array, GCompareFunc func, void* data) c_gst_queue_array_find; ///
  void function(GstQueueArray* array) c_gst_queue_array_free; ///
  uint function(GstQueueArray* array) c_gst_queue_array_get_length; ///
  gboolean function(GstQueueArray* array) c_gst_queue_array_is_empty; ///
  void* function(GstQueueArray* array) c_gst_queue_array_peek_head; ///
  void* function(GstQueueArray* array) c_gst_queue_array_peek_head_struct; ///
  void* function(GstQueueArray* array, uint idx) c_gst_queue_array_peek_nth; ///
  void* function(GstQueueArray* array, uint idx) c_gst_queue_array_peek_nth_struct; ///
  void* function(GstQueueArray* array) c_gst_queue_array_peek_tail; ///
  void* function(GstQueueArray* array) c_gst_queue_array_peek_tail_struct; ///
  void* function(GstQueueArray* array) c_gst_queue_array_pop_head; ///
  void* function(GstQueueArray* array) c_gst_queue_array_pop_head_struct; ///
  void* function(GstQueueArray* array) c_gst_queue_array_pop_tail; ///
  void* function(GstQueueArray* array) c_gst_queue_array_pop_tail_struct; ///
  void function(GstQueueArray* array, void* data, GCompareDataFunc func, void* userData) c_gst_queue_array_push_sorted; ///
  void function(GstQueueArray* array, void* pStruct, GCompareDataFunc func, void* userData) c_gst_queue_array_push_sorted_struct; ///
  void function(GstQueueArray* array, void* data) c_gst_queue_array_push_tail; ///
  void function(GstQueueArray* array, void* pStruct) c_gst_queue_array_push_tail_struct; ///
  void function(GstQueueArray* array, GDestroyNotify clearFunc) c_gst_queue_array_set_clear_func; ///
  void function(GstQueueArray* array, GCompareDataFunc compareFunc, void* userData) c_gst_queue_array_sort; ///
  GstQueueArray* function(uint initialSize) c_gst_queue_array_new; ///
  GstQueueArray* function(size_t structSize, uint initialSize) c_gst_queue_array_new_for_struct; ///

  // TypeFindData
  void function(GstTypeFindData* data) c_gst_type_find_data_free; ///
  GstCaps* function(GstTypeFindData* data) c_gst_type_find_data_get_caps; ///
  GstTypeFindProbability function(GstTypeFindData* data) c_gst_type_find_data_get_probability; ///
  GstTypeFind* function(GstTypeFindData* data) c_gst_type_find_data_get_typefind; ///
  GstTypeFindData* function(GstObject* obj, const(ubyte)* data, size_t size) c_gst_type_find_data_new; ///

  // global
  GstCaps* function(GstPad* src, ulong size) c_gst_type_find_helper; ///
  GstCaps* function(GstObject* obj, GstBuffer* buf, GstTypeFindProbability* prob) c_gst_type_find_helper_for_buffer; ///
  GstCaps* function(GstObject* obj, GstBuffer* buf, GstCaps* caps, GstTypeFindProbability* prob) c_gst_type_find_helper_for_buffer_with_caps; ///
  GstCaps* function(GstObject* obj, GstBuffer* buf, const(char)* extension, GstTypeFindProbability* prob) c_gst_type_find_helper_for_buffer_with_extension; ///
  GstCaps* function(GstObject* obj, const(ubyte)* data, size_t size, GstTypeFindProbability* prob) c_gst_type_find_helper_for_data; ///
  GstCaps* function(GstObject* obj, const(ubyte)* data, size_t size, GstCaps* caps, GstTypeFindProbability* prob) c_gst_type_find_helper_for_data_with_caps; ///
  GstCaps* function(GstObject* obj, const(ubyte)* data, size_t size, const(char)* extension, GstTypeFindProbability* prob) c_gst_type_find_helper_for_data_with_extension; ///
  GstCaps* function(GstObject* obj, const(char)* extension) c_gst_type_find_helper_for_extension; ///
  GstCaps* function(GstObject* obj, GstObject* parent, GstTypeFindHelperGetRangeFunction func, ulong size, const(char)* extension, GstTypeFindProbability* prob) c_gst_type_find_helper_get_range; ///
  GstFlowReturn function(GstObject* obj, GstObject* parent, GstTypeFindHelperGetRangeFunction func, ulong size, const(char)* extension, GstCaps** caps, GstTypeFindProbability* prob) c_gst_type_find_helper_get_range_full; ///
  GList* function(GstObject* obj, GstCaps* caps) c_gst_type_find_list_factories_for_caps; ///
}

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
  auto libs = gidResolveLibs(LIBS);

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
