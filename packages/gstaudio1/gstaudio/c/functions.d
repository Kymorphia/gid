/// C functions for gstaudio1 library
module gstaudio.c.functions;

public import gid.basictypes;
import gid.loader;
import gstaudio.c.types;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gst.c.types;
public import gstbase.c.types;

version(Windows)
  private immutable LIBS = ["libgstaudio-1.0-0.dll;gstaudio-1.0-0.dll;gstaudio-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstaudio-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstaudio-1.0.so.0"];

__gshared extern(C)
{
  // AudioAggregator
  GType function() c_gst_audio_aggregator_get_type; ///
  void function(GstAudioAggregator* aagg, GstAudioAggregatorPad* pad, GstCaps* caps) c_gst_audio_aggregator_set_sink_caps; ///

  // AudioAggregatorConvertPad
  GType function() c_gst_audio_aggregator_convert_pad_get_type; ///

  // AudioAggregatorPad
  GType function() c_gst_audio_aggregator_pad_get_type; ///

  // AudioBaseSink
  GType function() c_gst_audio_base_sink_get_type; ///
  GstAudioRingBuffer* function(GstAudioBaseSink* sink) c_gst_audio_base_sink_create_ringbuffer; ///
  GstClockTime function(GstAudioBaseSink* sink) c_gst_audio_base_sink_get_alignment_threshold; ///
  GstClockTime function(GstAudioBaseSink* sink) c_gst_audio_base_sink_get_discont_wait; ///
  long function(GstAudioBaseSink* sink) c_gst_audio_base_sink_get_drift_tolerance; ///
  gboolean function(GstAudioBaseSink* sink) c_gst_audio_base_sink_get_provide_clock; ///
  GstAudioBaseSinkSlaveMethod function(GstAudioBaseSink* sink) c_gst_audio_base_sink_get_slave_method; ///
  void function(GstAudioBaseSink* sink) c_gst_audio_base_sink_report_device_failure; ///
  void function(GstAudioBaseSink* sink, GstClockTime alignmentThreshold) c_gst_audio_base_sink_set_alignment_threshold; ///
  void function(GstAudioBaseSink* sink, GstAudioBaseSinkCustomSlavingCallback callback, void* userData, GDestroyNotify notify) c_gst_audio_base_sink_set_custom_slaving_callback; ///
  void function(GstAudioBaseSink* sink, GstClockTime discontWait) c_gst_audio_base_sink_set_discont_wait; ///
  void function(GstAudioBaseSink* sink, long driftTolerance) c_gst_audio_base_sink_set_drift_tolerance; ///
  void function(GstAudioBaseSink* sink, gboolean provide) c_gst_audio_base_sink_set_provide_clock; ///
  void function(GstAudioBaseSink* sink, GstAudioBaseSinkSlaveMethod method) c_gst_audio_base_sink_set_slave_method; ///

  // AudioBaseSrc
  GType function() c_gst_audio_base_src_get_type; ///
  GstAudioRingBuffer* function(GstAudioBaseSrc* src) c_gst_audio_base_src_create_ringbuffer; ///
  gboolean function(GstAudioBaseSrc* src) c_gst_audio_base_src_get_provide_clock; ///
  GstAudioBaseSrcSlaveMethod function(GstAudioBaseSrc* src) c_gst_audio_base_src_get_slave_method; ///
  void function(GstAudioBaseSrc* src, gboolean provide) c_gst_audio_base_src_set_provide_clock; ///
  void function(GstAudioBaseSrc* src, GstAudioBaseSrcSlaveMethod method) c_gst_audio_base_src_set_slave_method; ///

  // AudioBuffer
  void function(GstAudioBuffer* buffer) c_gst_audio_buffer_unmap; ///
  GstBuffer* function(GstBuffer* buffer, const(GstSegment)* segment, int rate, int bpf) c_gst_audio_buffer_clip; ///
  gboolean function(GstAudioBuffer* buffer, const(GstAudioInfo)* info, GstBuffer* gstbuffer, GstMapFlags flags) c_gst_audio_buffer_map; ///
  gboolean function(GstBuffer* buffer, GstAudioFormat format, int channels, const(GstAudioChannelPosition)* from, const(GstAudioChannelPosition)* to) c_gst_audio_buffer_reorder_channels; ///
  GstBuffer* function(GstBuffer* buffer, int bpf, size_t trim, size_t samples) c_gst_audio_buffer_truncate; ///

  // AudioCdSrc
  GType function() c_gst_audio_cd_src_get_type; ///
  gboolean function(GstAudioCdSrc* src, GstAudioCdSrcTrack* track) c_gst_audio_cd_src_add_track; ///

  // AudioChannelMixer
  void function(GstAudioChannelMixer* mix) c_gst_audio_channel_mixer_free; ///
  gboolean function(GstAudioChannelMixer* mix) c_gst_audio_channel_mixer_is_passthrough; ///
  void function(GstAudioChannelMixer* mix, const(void*)* in_, void** out_, int samples) c_gst_audio_channel_mixer_samples; ///
  GstAudioChannelMixer* function(GstAudioChannelMixerFlags flags, GstAudioFormat format, int inChannels, GstAudioChannelPosition* inPosition, int outChannels, GstAudioChannelPosition* outPosition) c_gst_audio_channel_mixer_new; ///
  GstAudioChannelMixer* function(GstAudioChannelMixerFlags flags, GstAudioFormat format, int inChannels, int outChannels, float** matrix) c_gst_audio_channel_mixer_new_with_matrix; ///

  // AudioClippingMeta
  const(GstMetaInfo)* function() c_gst_audio_clipping_meta_get_info; ///

  // AudioClock
  GType function() c_gst_audio_clock_get_type; ///
  GstClock* function(const(char)* name, GstAudioClockGetTimeFunc func, void* userData, GDestroyNotify destroyNotify) c_gst_audio_clock_new; ///
  GstClockTime function(GstAudioClock* clock, GstClockTime time) c_gst_audio_clock_adjust; ///
  GstClockTime function(GstAudioClock* clock) c_gst_audio_clock_get_time; ///
  void function(GstAudioClock* clock) c_gst_audio_clock_invalidate; ///
  void function(GstAudioClock* clock, GstClockTime time) c_gst_audio_clock_reset; ///

  // AudioConverter
  GType function() c_gst_audio_converter_get_type; ///
  GstAudioConverter* function(GstAudioConverterFlags flags, GstAudioInfo* inInfo, GstAudioInfo* outInfo, GstStructure* config) c_gst_audio_converter_new; ///
  gboolean function(GstAudioConverter* convert, GstAudioConverterFlags flags, void* in_, size_t inSize, void** out_, size_t* outSize) c_gst_audio_converter_convert; ///
  void function(GstAudioConverter* convert) c_gst_audio_converter_free; ///
  const(GstStructure)* function(GstAudioConverter* convert, int* inRate, int* outRate) c_gst_audio_converter_get_config; ///
  size_t function(GstAudioConverter* convert, size_t outFrames) c_gst_audio_converter_get_in_frames; ///
  size_t function(GstAudioConverter* convert) c_gst_audio_converter_get_max_latency; ///
  size_t function(GstAudioConverter* convert, size_t inFrames) c_gst_audio_converter_get_out_frames; ///
  gboolean function(GstAudioConverter* convert) c_gst_audio_converter_is_passthrough; ///
  void function(GstAudioConverter* convert) c_gst_audio_converter_reset; ///
  gboolean function(GstAudioConverter* convert, GstAudioConverterFlags flags, void** in_, size_t inFrames, void** out_, size_t outFrames) c_gst_audio_converter_samples; ///
  gboolean function(GstAudioConverter* convert) c_gst_audio_converter_supports_inplace; ///
  gboolean function(GstAudioConverter* convert, int inRate, int outRate, GstStructure* config) c_gst_audio_converter_update_config; ///

  // AudioDecoder
  GType function() c_gst_audio_decoder_get_type; ///
  GstBuffer* function(GstAudioDecoder* dec, size_t size) c_gst_audio_decoder_allocate_output_buffer; ///
  GstFlowReturn function(GstAudioDecoder* dec, GstBuffer* buf, int frames) c_gst_audio_decoder_finish_frame; ///
  GstFlowReturn function(GstAudioDecoder* dec, GstBuffer* buf) c_gst_audio_decoder_finish_subframe; ///
  void function(GstAudioDecoder* dec, GstAllocator** allocator, GstAllocationParams* params) c_gst_audio_decoder_get_allocator; ///
  GstAudioInfo* function(GstAudioDecoder* dec) c_gst_audio_decoder_get_audio_info; ///
  int function(GstAudioDecoder* dec) c_gst_audio_decoder_get_delay; ///
  gboolean function(GstAudioDecoder* dec) c_gst_audio_decoder_get_drainable; ///
  int function(GstAudioDecoder* dec) c_gst_audio_decoder_get_estimate_rate; ///
  void function(GstAudioDecoder* dec, GstClockTime* min, GstClockTime* max) c_gst_audio_decoder_get_latency; ///
  int function(GstAudioDecoder* dec) c_gst_audio_decoder_get_max_errors; ///
  GstClockTime function(GstAudioDecoder* dec) c_gst_audio_decoder_get_min_latency; ///
  gboolean function(GstAudioDecoder* dec) c_gst_audio_decoder_get_needs_format; ///
  void function(GstAudioDecoder* dec, gboolean* sync, gboolean* eos) c_gst_audio_decoder_get_parse_state; ///
  gboolean function(GstAudioDecoder* dec) c_gst_audio_decoder_get_plc; ///
  int function(GstAudioDecoder* dec) c_gst_audio_decoder_get_plc_aware; ///
  GstClockTime function(GstAudioDecoder* dec) c_gst_audio_decoder_get_tolerance; ///
  void function(GstAudioDecoder* dec, const(GstTagList)* tags, GstTagMergeMode mode) c_gst_audio_decoder_merge_tags; ///
  gboolean function(GstAudioDecoder* dec) c_gst_audio_decoder_negotiate; ///
  GstCaps* function(GstAudioDecoder* decoder, GstCaps* caps, GstCaps* filter) c_gst_audio_decoder_proxy_getcaps; ///
  void function(GstAudioDecoder* dec, GstCaps* allocationCaps) c_gst_audio_decoder_set_allocation_caps; ///
  void function(GstAudioDecoder* dec, gboolean enabled) c_gst_audio_decoder_set_drainable; ///
  void function(GstAudioDecoder* dec, gboolean enabled) c_gst_audio_decoder_set_estimate_rate; ///
  void function(GstAudioDecoder* dec, GstClockTime min, GstClockTime max) c_gst_audio_decoder_set_latency; ///
  void function(GstAudioDecoder* dec, int num) c_gst_audio_decoder_set_max_errors; ///
  void function(GstAudioDecoder* dec, GstClockTime num) c_gst_audio_decoder_set_min_latency; ///
  void function(GstAudioDecoder* dec, gboolean enabled) c_gst_audio_decoder_set_needs_format; ///
  gboolean function(GstAudioDecoder* dec, GstCaps* caps) c_gst_audio_decoder_set_output_caps; ///
  gboolean function(GstAudioDecoder* dec, const(GstAudioInfo)* info) c_gst_audio_decoder_set_output_format; ///
  void function(GstAudioDecoder* dec, gboolean enabled) c_gst_audio_decoder_set_plc; ///
  void function(GstAudioDecoder* dec, gboolean plc) c_gst_audio_decoder_set_plc_aware; ///
  void function(GstAudioDecoder* dec, GstClockTime tolerance) c_gst_audio_decoder_set_tolerance; ///
  void function(GstAudioDecoder* decoder, gboolean use) c_gst_audio_decoder_set_use_default_pad_acceptcaps; ///

  // AudioDownmixMeta
  const(GstMetaInfo)* function() c_gst_audio_downmix_meta_get_info; ///

  // AudioEncoder
  GType function() c_gst_audio_encoder_get_type; ///
  GstBuffer* function(GstAudioEncoder* enc, size_t size) c_gst_audio_encoder_allocate_output_buffer; ///
  GstFlowReturn function(GstAudioEncoder* enc, GstBuffer* buffer, int samples) c_gst_audio_encoder_finish_frame; ///
  void function(GstAudioEncoder* enc, GstAllocator** allocator, GstAllocationParams* params) c_gst_audio_encoder_get_allocator; ///
  GstAudioInfo* function(GstAudioEncoder* enc) c_gst_audio_encoder_get_audio_info; ///
  gboolean function(GstAudioEncoder* enc) c_gst_audio_encoder_get_drainable; ///
  int function(GstAudioEncoder* enc) c_gst_audio_encoder_get_frame_max; ///
  int function(GstAudioEncoder* enc) c_gst_audio_encoder_get_frame_samples_max; ///
  int function(GstAudioEncoder* enc) c_gst_audio_encoder_get_frame_samples_min; ///
  gboolean function(GstAudioEncoder* enc) c_gst_audio_encoder_get_hard_min; ///
  gboolean function(GstAudioEncoder* enc) c_gst_audio_encoder_get_hard_resync; ///
  void function(GstAudioEncoder* enc, GstClockTime* min, GstClockTime* max) c_gst_audio_encoder_get_latency; ///
  int function(GstAudioEncoder* enc) c_gst_audio_encoder_get_lookahead; ///
  gboolean function(GstAudioEncoder* enc) c_gst_audio_encoder_get_mark_granule; ///
  gboolean function(GstAudioEncoder* enc) c_gst_audio_encoder_get_perfect_timestamp; ///
  GstClockTime function(GstAudioEncoder* enc) c_gst_audio_encoder_get_tolerance; ///
  void function(GstAudioEncoder* enc, const(GstTagList)* tags, GstTagMergeMode mode) c_gst_audio_encoder_merge_tags; ///
  gboolean function(GstAudioEncoder* enc) c_gst_audio_encoder_negotiate; ///
  GstCaps* function(GstAudioEncoder* enc, GstCaps* caps, GstCaps* filter) c_gst_audio_encoder_proxy_getcaps; ///
  void function(GstAudioEncoder* enc, GstCaps* allocationCaps) c_gst_audio_encoder_set_allocation_caps; ///
  void function(GstAudioEncoder* enc, gboolean enabled) c_gst_audio_encoder_set_drainable; ///
  void function(GstAudioEncoder* enc, int num) c_gst_audio_encoder_set_frame_max; ///
  void function(GstAudioEncoder* enc, int num) c_gst_audio_encoder_set_frame_samples_max; ///
  void function(GstAudioEncoder* enc, int num) c_gst_audio_encoder_set_frame_samples_min; ///
  void function(GstAudioEncoder* enc, gboolean enabled) c_gst_audio_encoder_set_hard_min; ///
  void function(GstAudioEncoder* enc, gboolean enabled) c_gst_audio_encoder_set_hard_resync; ///
  void function(GstAudioEncoder* enc, GList* headers) c_gst_audio_encoder_set_headers; ///
  void function(GstAudioEncoder* enc, GstClockTime min, GstClockTime max) c_gst_audio_encoder_set_latency; ///
  void function(GstAudioEncoder* enc, int num) c_gst_audio_encoder_set_lookahead; ///
  void function(GstAudioEncoder* enc, gboolean enabled) c_gst_audio_encoder_set_mark_granule; ///
  gboolean function(GstAudioEncoder* enc, GstCaps* caps) c_gst_audio_encoder_set_output_format; ///
  void function(GstAudioEncoder* enc, gboolean enabled) c_gst_audio_encoder_set_perfect_timestamp; ///
  void function(GstAudioEncoder* enc, GstClockTime tolerance) c_gst_audio_encoder_set_tolerance; ///

  // AudioFilter
  GType function() c_gst_audio_filter_get_type; ///

  // AudioFilterClass
  void function(GstAudioFilterClass* klass, GstCaps* allowedCaps) c_gst_audio_filter_class_add_pad_templates; ///

  // AudioFormatInfo
  void function(const(GstAudioFormatInfo)* info, void* dest, size_t length) c_gst_audio_format_info_fill_silence; ///

  // AudioInfo
  GType function() c_gst_audio_info_get_type; ///
  GstAudioInfo* function() c_gst_audio_info_new; ///
  GstAudioInfo* function(const(GstCaps)* caps) c_gst_audio_info_new_from_caps; ///
  gboolean function(const(GstAudioInfo)* info, GstFormat srcFmt, long srcVal, GstFormat destFmt, long* destVal) c_gst_audio_info_convert; ///
  GstAudioInfo* function(const(GstAudioInfo)* info) c_gst_audio_info_copy; ///
  void function(GstAudioInfo* info) c_gst_audio_info_free; ///
  gboolean function(const(GstAudioInfo)* info, const(GstAudioInfo)* other) c_gst_audio_info_is_equal; ///
  void function(GstAudioInfo* info, GstAudioFormat format, int rate, int channels, const(GstAudioChannelPosition)* position) c_gst_audio_info_set_format; ///
  GstCaps* function(const(GstAudioInfo)* info) c_gst_audio_info_to_caps; ///
  gboolean function(GstAudioInfo* info, const(GstCaps)* caps) c_gst_audio_info_from_caps; ///
  void function(GstAudioInfo* info) c_gst_audio_info_init; ///

  // AudioLevelMeta
  const(GstMetaInfo)* function() c_gst_audio_level_meta_get_info; ///

  // AudioMeta
  const(GstMetaInfo)* function() c_gst_audio_meta_get_info; ///

  // AudioQuantize
  void function(GstAudioQuantize* quant) c_gst_audio_quantize_free; ///
  void function(GstAudioQuantize* quant) c_gst_audio_quantize_reset; ///
  void function(GstAudioQuantize* quant, const(void*)* in_, void** out_, uint samples) c_gst_audio_quantize_samples; ///
  GstAudioQuantize* function(GstAudioDitherMethod dither, GstAudioNoiseShapingMethod ns, GstAudioQuantizeFlags flags, GstAudioFormat format, uint channels, uint quantizer) c_gst_audio_quantize_new; ///

  // AudioResampler
  void function(GstAudioResampler* resampler) c_gst_audio_resampler_free; ///
  size_t function(GstAudioResampler* resampler, size_t outFrames) c_gst_audio_resampler_get_in_frames; ///
  size_t function(GstAudioResampler* resampler) c_gst_audio_resampler_get_max_latency; ///
  size_t function(GstAudioResampler* resampler, size_t inFrames) c_gst_audio_resampler_get_out_frames; ///
  void function(GstAudioResampler* resampler, void** in_, size_t inFrames, void** out_, size_t outFrames) c_gst_audio_resampler_resample; ///
  void function(GstAudioResampler* resampler) c_gst_audio_resampler_reset; ///
  gboolean function(GstAudioResampler* resampler, int inRate, int outRate, GstStructure* options) c_gst_audio_resampler_update; ///
  GstAudioResampler* function(GstAudioResamplerMethod method, GstAudioResamplerFlags flags, GstAudioFormat format, int channels, int inRate, int outRate, GstStructure* options) c_gst_audio_resampler_new; ///
  void function(GstAudioResamplerMethod method, uint quality, int inRate, int outRate, GstStructure* options) c_gst_audio_resampler_options_set_quality; ///

  // AudioRingBuffer
  GType function() c_gst_audio_ring_buffer_get_type; ///
  void function(GstAudioRingBufferSpec* spec) c_gst_audio_ring_buffer_debug_spec_buff; ///
  void function(GstAudioRingBufferSpec* spec) c_gst_audio_ring_buffer_debug_spec_caps; ///
  gboolean function(GstAudioRingBufferSpec* spec, GstCaps* caps) c_gst_audio_ring_buffer_parse_caps; ///
  gboolean function(GstAudioRingBuffer* buf, GstAudioRingBufferSpec* spec) c_gst_audio_ring_buffer_acquire; ///
  gboolean function(GstAudioRingBuffer* buf, gboolean active) c_gst_audio_ring_buffer_activate; ///
  void function(GstAudioRingBuffer* buf, uint advance) c_gst_audio_ring_buffer_advance; ///
  void function(GstAudioRingBuffer* buf, int segment) c_gst_audio_ring_buffer_clear; ///
  void function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_clear_all; ///
  gboolean function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_close_device; ///
  uint function(GstAudioRingBuffer* buf, ulong* sample, ubyte* data, int inSamples, int outSamples, int* accum) c_gst_audio_ring_buffer_commit; ///
  gboolean function(GstAudioRingBuffer* buf, GstFormat srcFmt, long srcVal, GstFormat destFmt, long* destVal) c_gst_audio_ring_buffer_convert; ///
  uint function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_delay; ///
  gboolean function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_device_is_open; ///
  gboolean function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_is_acquired; ///
  gboolean function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_is_active; ///
  gboolean function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_is_flushing; ///
  void function(GstAudioRingBuffer* buf, gboolean allowed) c_gst_audio_ring_buffer_may_start; ///
  gboolean function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_open_device; ///
  gboolean function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_pause; ///
  gboolean function(GstAudioRingBuffer* buf, int* segment, ubyte** readptr, int* len) c_gst_audio_ring_buffer_prepare_read; ///
  uint function(GstAudioRingBuffer* buf, ulong sample, ubyte* data, uint len, GstClockTime* timestamp) c_gst_audio_ring_buffer_read; ///
  gboolean function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_release; ///
  ulong function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_samples_done; ///
  void function(GstAudioRingBuffer* buf, GstAudioRingBufferCallback cb, void* userData) c_gst_audio_ring_buffer_set_callback; ///
  void function(GstAudioRingBuffer* buf, GstAudioRingBufferCallback cb, void* userData, GDestroyNotify notify) c_gst_audio_ring_buffer_set_callback_full; ///
  void function(GstAudioRingBuffer* buf, const(GstAudioChannelPosition)* position) c_gst_audio_ring_buffer_set_channel_positions; ///
  void function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_set_errored; ///
  void function(GstAudioRingBuffer* buf, gboolean flushing) c_gst_audio_ring_buffer_set_flushing; ///
  void function(GstAudioRingBuffer* buf, ulong sample) c_gst_audio_ring_buffer_set_sample; ///
  void function(GstAudioRingBuffer* buf, int readseg, GstClockTime timestamp) c_gst_audio_ring_buffer_set_timestamp; ///
  gboolean function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_start; ///
  gboolean function(GstAudioRingBuffer* buf) c_gst_audio_ring_buffer_stop; ///

  // AudioSink
  GType function() c_gst_audio_sink_get_type; ///

  // AudioSrc
  GType function() c_gst_audio_src_get_type; ///

  // AudioStreamAlign
  GType function() c_gst_audio_stream_align_get_type; ///
  GstAudioStreamAlign* function(int rate, GstClockTime alignmentThreshold, GstClockTime discontWait) c_gst_audio_stream_align_new; ///
  GstAudioStreamAlign* function(const(GstAudioStreamAlign)* align_) c_gst_audio_stream_align_copy; ///
  void function(GstAudioStreamAlign* align_) c_gst_audio_stream_align_free; ///
  GstClockTime function(const(GstAudioStreamAlign)* align_) c_gst_audio_stream_align_get_alignment_threshold; ///
  GstClockTime function(const(GstAudioStreamAlign)* align_) c_gst_audio_stream_align_get_discont_wait; ///
  int function(const(GstAudioStreamAlign)* align_) c_gst_audio_stream_align_get_rate; ///
  ulong function(const(GstAudioStreamAlign)* align_) c_gst_audio_stream_align_get_samples_since_discont; ///
  GstClockTime function(const(GstAudioStreamAlign)* align_) c_gst_audio_stream_align_get_timestamp_at_discont; ///
  void function(GstAudioStreamAlign* align_) c_gst_audio_stream_align_mark_discont; ///
  gboolean function(GstAudioStreamAlign* align_, gboolean discont, GstClockTime timestamp, uint nSamples, GstClockTime* outTimestamp, GstClockTime* outDuration, ulong* outSamplePosition) c_gst_audio_stream_align_process; ///
  void function(GstAudioStreamAlign* align_, GstClockTime alignmentThreshold) c_gst_audio_stream_align_set_alignment_threshold; ///
  void function(GstAudioStreamAlign* align_, GstClockTime discontWait) c_gst_audio_stream_align_set_discont_wait; ///
  void function(GstAudioStreamAlign* align_, int rate) c_gst_audio_stream_align_set_rate; ///

  // DsdInfo
  GType function() c_gst_dsd_info_get_type; ///
  GstDsdInfo* function() c_gst_dsd_info_new; ///
  GstDsdInfo* function(const(GstCaps)* caps) c_gst_dsd_info_new_from_caps; ///
  GstDsdInfo* function(const(GstDsdInfo)* info) c_gst_dsd_info_copy; ///
  void function(GstDsdInfo* info) c_gst_dsd_info_free; ///
  gboolean function(const(GstDsdInfo)* info, const(GstDsdInfo)* other) c_gst_dsd_info_is_equal; ///
  void function(GstDsdInfo* info, GstDsdFormat format, int rate, int channels, const(GstAudioChannelPosition)* positions) c_gst_dsd_info_set_format; ///
  GstCaps* function(const(GstDsdInfo)* info) c_gst_dsd_info_to_caps; ///
  gboolean function(GstDsdInfo* info, const(GstCaps)* caps) c_gst_dsd_info_from_caps; ///
  void function(GstDsdInfo* info) c_gst_dsd_info_init; ///

  // DsdPlaneOffsetMeta
  const(GstMetaInfo)* function() c_gst_dsd_plane_offset_meta_get_info; ///

  // StreamVolume
  GType function() c_gst_stream_volume_get_type; ///
  double function(GstStreamVolumeFormat from, GstStreamVolumeFormat to, double val) c_gst_stream_volume_convert_volume; ///
  gboolean function(GstStreamVolume* volume) c_gst_stream_volume_get_mute; ///
  double function(GstStreamVolume* volume, GstStreamVolumeFormat format) c_gst_stream_volume_get_volume; ///
  void function(GstStreamVolume* volume, gboolean mute) c_gst_stream_volume_set_mute; ///
  void function(GstStreamVolume* volume, GstStreamVolumeFormat format, double val) c_gst_stream_volume_set_volume; ///

  // global
  ulong function(int channels) c_gst_audio_channel_get_fallback_mask; ///
  gboolean function(int channels, ulong channelMask, GstAudioChannelPosition* position) c_gst_audio_channel_positions_from_mask; ///
  gboolean function(const(GstAudioChannelPosition)* position, int channels, gboolean forceOrder, ulong* channelMask) c_gst_audio_channel_positions_to_mask; ///
  char* function(const(GstAudioChannelPosition)* position, int channels) c_gst_audio_channel_positions_to_string; ///
  gboolean function(GstAudioChannelPosition* position, int channels) c_gst_audio_channel_positions_to_valid_order; ///
  gboolean function(const(GstAudioChannelPosition)* position, int channels, gboolean forceOrder) c_gst_audio_check_valid_channel_positions; ///
  GType function() c_gst_audio_clipping_meta_api_get_type; ///
  GType function() c_gst_audio_downmix_meta_api_get_type; ///
  GType function() c_gst_audio_format_info_get_type; ///
  const(GstAudioFormat)* function(uint* len) c_gst_audio_formats_raw; ///
  gboolean function(int channels, const(GstAudioChannelPosition)* from, const(GstAudioChannelPosition)* to, int* reorderMap) c_gst_audio_get_channel_reorder_map; ///
  uint function(const(GstAudioRingBufferSpec)* spec) c_gst_audio_iec61937_frame_size; ///
  gboolean function(const(ubyte)* src, uint srcN, ubyte* dst, uint dstN, const(GstAudioRingBufferSpec)* spec, int endianness) c_gst_audio_iec61937_payload; ///
  GType function() c_gst_audio_level_meta_api_get_type; ///
  GstCaps* function(const(GstAudioFormat)* formats, uint len, GstAudioLayout layout) c_gst_audio_make_raw_caps; ///
  GType function() c_gst_audio_meta_api_get_type; ///
  gboolean function(void* data, size_t size, GstAudioFormat format, int channels, const(GstAudioChannelPosition)* from, const(GstAudioChannelPosition)* to) c_gst_audio_reorder_channels; ///
  GstAudioClippingMeta* function(GstBuffer* buffer, GstFormat format, ulong start, ulong end) c_gst_buffer_add_audio_clipping_meta; ///
  GstAudioDownmixMeta* function(GstBuffer* buffer, const(GstAudioChannelPosition)* fromPosition, int fromChannels, const(GstAudioChannelPosition)* toPosition, int toChannels, const(float*)* matrix) c_gst_buffer_add_audio_downmix_meta; ///
  GstAudioLevelMeta* function(GstBuffer* buffer, ubyte level, gboolean voiceActivity) c_gst_buffer_add_audio_level_meta; ///
  GstAudioMeta* function(GstBuffer* buffer, const(GstAudioInfo)* info, size_t samples, size_t* offsets) c_gst_buffer_add_audio_meta; ///
  GstDsdPlaneOffsetMeta* function(GstBuffer* buffer, int numChannels, size_t numBytesPerChannel, size_t* offsets) c_gst_buffer_add_dsd_plane_offset_meta; ///
  GstAudioDownmixMeta* function(GstBuffer* buffer, const(GstAudioChannelPosition)* toPosition, int toChannels) c_gst_buffer_get_audio_downmix_meta_for_channels; ///
  GstAudioLevelMeta* function(GstBuffer* buffer) c_gst_buffer_get_audio_level_meta; ///
  void function(const(ubyte)* inputData, ubyte* outputData, GstDsdFormat inputFormat, GstDsdFormat outputFormat, GstAudioLayout inputLayout, GstAudioLayout outputLayout, const(size_t)* inputPlaneOffsets, const(size_t)* outputPlaneOffsets, size_t numDsdBytes, int numChannels, gboolean reverseByteBits) c_gst_dsd_convert; ///
  GType function() c_gst_dsd_plane_offset_meta_api_get_type; ///

  // AudioFormat
  GstAudioFormat function(gboolean sign, int endianness, int width, int depth) c_gst_audio_format_build_integer; ///
  void function(const(GstAudioFormatInfo)* info, void* dest, size_t length) c_gst_audio_format_fill_silence; ///
  GstAudioFormat function(const(char)* format) c_gst_audio_format_from_string; ///
  const(GstAudioFormatInfo)* function(GstAudioFormat format) c_gst_audio_format_get_info; ///
  const(char)* function(GstAudioFormat format) c_gst_audio_format_to_string; ///

  // DsdFormat
  GstDsdFormat function(const(char)* str) c_gst_dsd_format_from_string; ///
  uint function(GstDsdFormat format) c_gst_dsd_format_get_width; ///
  const(char)* function(GstDsdFormat format) c_gst_dsd_format_to_string; ///
}

// AudioAggregator

/** */
alias gst_audio_aggregator_get_type = c_gst_audio_aggregator_get_type;

/** */
alias gst_audio_aggregator_set_sink_caps = c_gst_audio_aggregator_set_sink_caps;

// AudioAggregatorConvertPad

/** */
alias gst_audio_aggregator_convert_pad_get_type = c_gst_audio_aggregator_convert_pad_get_type;

// AudioAggregatorPad

/** */
alias gst_audio_aggregator_pad_get_type = c_gst_audio_aggregator_pad_get_type;

// AudioBaseSink

/** */
alias gst_audio_base_sink_get_type = c_gst_audio_base_sink_get_type;

/** */
alias gst_audio_base_sink_create_ringbuffer = c_gst_audio_base_sink_create_ringbuffer;

/** */
alias gst_audio_base_sink_get_alignment_threshold = c_gst_audio_base_sink_get_alignment_threshold;

/** */
alias gst_audio_base_sink_get_discont_wait = c_gst_audio_base_sink_get_discont_wait;

/** */
alias gst_audio_base_sink_get_drift_tolerance = c_gst_audio_base_sink_get_drift_tolerance;

/** */
alias gst_audio_base_sink_get_provide_clock = c_gst_audio_base_sink_get_provide_clock;

/** */
alias gst_audio_base_sink_get_slave_method = c_gst_audio_base_sink_get_slave_method;

/** */
alias gst_audio_base_sink_report_device_failure = c_gst_audio_base_sink_report_device_failure;

/** */
alias gst_audio_base_sink_set_alignment_threshold = c_gst_audio_base_sink_set_alignment_threshold;

/** */
alias gst_audio_base_sink_set_custom_slaving_callback = c_gst_audio_base_sink_set_custom_slaving_callback;

/** */
alias gst_audio_base_sink_set_discont_wait = c_gst_audio_base_sink_set_discont_wait;

/** */
alias gst_audio_base_sink_set_drift_tolerance = c_gst_audio_base_sink_set_drift_tolerance;

/** */
alias gst_audio_base_sink_set_provide_clock = c_gst_audio_base_sink_set_provide_clock;

/** */
alias gst_audio_base_sink_set_slave_method = c_gst_audio_base_sink_set_slave_method;

// AudioBaseSrc

/** */
alias gst_audio_base_src_get_type = c_gst_audio_base_src_get_type;

/** */
alias gst_audio_base_src_create_ringbuffer = c_gst_audio_base_src_create_ringbuffer;

/** */
alias gst_audio_base_src_get_provide_clock = c_gst_audio_base_src_get_provide_clock;

/** */
alias gst_audio_base_src_get_slave_method = c_gst_audio_base_src_get_slave_method;

/** */
alias gst_audio_base_src_set_provide_clock = c_gst_audio_base_src_set_provide_clock;

/** */
alias gst_audio_base_src_set_slave_method = c_gst_audio_base_src_set_slave_method;

// AudioBuffer

/** */
alias gst_audio_buffer_unmap = c_gst_audio_buffer_unmap;

/** */
alias gst_audio_buffer_clip = c_gst_audio_buffer_clip;

/** */
alias gst_audio_buffer_map = c_gst_audio_buffer_map;

/** */
alias gst_audio_buffer_reorder_channels = c_gst_audio_buffer_reorder_channels;

/** */
alias gst_audio_buffer_truncate = c_gst_audio_buffer_truncate;

// AudioCdSrc

/** */
alias gst_audio_cd_src_get_type = c_gst_audio_cd_src_get_type;

/** */
alias gst_audio_cd_src_add_track = c_gst_audio_cd_src_add_track;

// AudioChannelMixer

/** */
alias gst_audio_channel_mixer_free = c_gst_audio_channel_mixer_free;

/** */
alias gst_audio_channel_mixer_is_passthrough = c_gst_audio_channel_mixer_is_passthrough;

/** */
alias gst_audio_channel_mixer_samples = c_gst_audio_channel_mixer_samples;

/** */
alias gst_audio_channel_mixer_new = c_gst_audio_channel_mixer_new;

/** */
alias gst_audio_channel_mixer_new_with_matrix = c_gst_audio_channel_mixer_new_with_matrix;

// AudioClippingMeta

/** */
alias gst_audio_clipping_meta_get_info = c_gst_audio_clipping_meta_get_info;

// AudioClock

/** */
alias gst_audio_clock_get_type = c_gst_audio_clock_get_type;

/** */
alias gst_audio_clock_new = c_gst_audio_clock_new;

/** */
alias gst_audio_clock_adjust = c_gst_audio_clock_adjust;

/** */
alias gst_audio_clock_get_time = c_gst_audio_clock_get_time;

/** */
alias gst_audio_clock_invalidate = c_gst_audio_clock_invalidate;

/** */
alias gst_audio_clock_reset = c_gst_audio_clock_reset;

// AudioConverter

/** */
alias gst_audio_converter_get_type = c_gst_audio_converter_get_type;

/** */
alias gst_audio_converter_new = c_gst_audio_converter_new;

/** */
alias gst_audio_converter_convert = c_gst_audio_converter_convert;

/** */
alias gst_audio_converter_free = c_gst_audio_converter_free;

/** */
alias gst_audio_converter_get_config = c_gst_audio_converter_get_config;

/** */
alias gst_audio_converter_get_in_frames = c_gst_audio_converter_get_in_frames;

/** */
alias gst_audio_converter_get_max_latency = c_gst_audio_converter_get_max_latency;

/** */
alias gst_audio_converter_get_out_frames = c_gst_audio_converter_get_out_frames;

/** */
alias gst_audio_converter_is_passthrough = c_gst_audio_converter_is_passthrough;

/** */
alias gst_audio_converter_reset = c_gst_audio_converter_reset;

/** */
alias gst_audio_converter_samples = c_gst_audio_converter_samples;

/** */
alias gst_audio_converter_supports_inplace = c_gst_audio_converter_supports_inplace;

/** */
alias gst_audio_converter_update_config = c_gst_audio_converter_update_config;

// AudioDecoder

/** */
alias gst_audio_decoder_get_type = c_gst_audio_decoder_get_type;

/** */
alias gst_audio_decoder_allocate_output_buffer = c_gst_audio_decoder_allocate_output_buffer;

/** */
alias gst_audio_decoder_finish_frame = c_gst_audio_decoder_finish_frame;

/** */
alias gst_audio_decoder_finish_subframe = c_gst_audio_decoder_finish_subframe;

/** */
alias gst_audio_decoder_get_allocator = c_gst_audio_decoder_get_allocator;

/** */
alias gst_audio_decoder_get_audio_info = c_gst_audio_decoder_get_audio_info;

/** */
alias gst_audio_decoder_get_delay = c_gst_audio_decoder_get_delay;

/** */
alias gst_audio_decoder_get_drainable = c_gst_audio_decoder_get_drainable;

/** */
alias gst_audio_decoder_get_estimate_rate = c_gst_audio_decoder_get_estimate_rate;

/** */
alias gst_audio_decoder_get_latency = c_gst_audio_decoder_get_latency;

/** */
alias gst_audio_decoder_get_max_errors = c_gst_audio_decoder_get_max_errors;

/** */
alias gst_audio_decoder_get_min_latency = c_gst_audio_decoder_get_min_latency;

/** */
alias gst_audio_decoder_get_needs_format = c_gst_audio_decoder_get_needs_format;

/** */
alias gst_audio_decoder_get_parse_state = c_gst_audio_decoder_get_parse_state;

/** */
alias gst_audio_decoder_get_plc = c_gst_audio_decoder_get_plc;

/** */
alias gst_audio_decoder_get_plc_aware = c_gst_audio_decoder_get_plc_aware;

/** */
alias gst_audio_decoder_get_tolerance = c_gst_audio_decoder_get_tolerance;

/** */
alias gst_audio_decoder_merge_tags = c_gst_audio_decoder_merge_tags;

/** */
alias gst_audio_decoder_negotiate = c_gst_audio_decoder_negotiate;

/** */
alias gst_audio_decoder_proxy_getcaps = c_gst_audio_decoder_proxy_getcaps;

/** */
alias gst_audio_decoder_set_allocation_caps = c_gst_audio_decoder_set_allocation_caps;

/** */
alias gst_audio_decoder_set_drainable = c_gst_audio_decoder_set_drainable;

/** */
alias gst_audio_decoder_set_estimate_rate = c_gst_audio_decoder_set_estimate_rate;

/** */
alias gst_audio_decoder_set_latency = c_gst_audio_decoder_set_latency;

/** */
alias gst_audio_decoder_set_max_errors = c_gst_audio_decoder_set_max_errors;

/** */
alias gst_audio_decoder_set_min_latency = c_gst_audio_decoder_set_min_latency;

/** */
alias gst_audio_decoder_set_needs_format = c_gst_audio_decoder_set_needs_format;

/** */
alias gst_audio_decoder_set_output_caps = c_gst_audio_decoder_set_output_caps;

/** */
alias gst_audio_decoder_set_output_format = c_gst_audio_decoder_set_output_format;

/** */
alias gst_audio_decoder_set_plc = c_gst_audio_decoder_set_plc;

/** */
alias gst_audio_decoder_set_plc_aware = c_gst_audio_decoder_set_plc_aware;

/** */
alias gst_audio_decoder_set_tolerance = c_gst_audio_decoder_set_tolerance;

/** */
alias gst_audio_decoder_set_use_default_pad_acceptcaps = c_gst_audio_decoder_set_use_default_pad_acceptcaps;

// AudioDownmixMeta

/** */
alias gst_audio_downmix_meta_get_info = c_gst_audio_downmix_meta_get_info;

// AudioEncoder

/** */
alias gst_audio_encoder_get_type = c_gst_audio_encoder_get_type;

/** */
alias gst_audio_encoder_allocate_output_buffer = c_gst_audio_encoder_allocate_output_buffer;

/** */
alias gst_audio_encoder_finish_frame = c_gst_audio_encoder_finish_frame;

/** */
alias gst_audio_encoder_get_allocator = c_gst_audio_encoder_get_allocator;

/** */
alias gst_audio_encoder_get_audio_info = c_gst_audio_encoder_get_audio_info;

/** */
alias gst_audio_encoder_get_drainable = c_gst_audio_encoder_get_drainable;

/** */
alias gst_audio_encoder_get_frame_max = c_gst_audio_encoder_get_frame_max;

/** */
alias gst_audio_encoder_get_frame_samples_max = c_gst_audio_encoder_get_frame_samples_max;

/** */
alias gst_audio_encoder_get_frame_samples_min = c_gst_audio_encoder_get_frame_samples_min;

/** */
alias gst_audio_encoder_get_hard_min = c_gst_audio_encoder_get_hard_min;

/** */
alias gst_audio_encoder_get_hard_resync = c_gst_audio_encoder_get_hard_resync;

/** */
alias gst_audio_encoder_get_latency = c_gst_audio_encoder_get_latency;

/** */
alias gst_audio_encoder_get_lookahead = c_gst_audio_encoder_get_lookahead;

/** */
alias gst_audio_encoder_get_mark_granule = c_gst_audio_encoder_get_mark_granule;

/** */
alias gst_audio_encoder_get_perfect_timestamp = c_gst_audio_encoder_get_perfect_timestamp;

/** */
alias gst_audio_encoder_get_tolerance = c_gst_audio_encoder_get_tolerance;

/** */
alias gst_audio_encoder_merge_tags = c_gst_audio_encoder_merge_tags;

/** */
alias gst_audio_encoder_negotiate = c_gst_audio_encoder_negotiate;

/** */
alias gst_audio_encoder_proxy_getcaps = c_gst_audio_encoder_proxy_getcaps;

/** */
alias gst_audio_encoder_set_allocation_caps = c_gst_audio_encoder_set_allocation_caps;

/** */
alias gst_audio_encoder_set_drainable = c_gst_audio_encoder_set_drainable;

/** */
alias gst_audio_encoder_set_frame_max = c_gst_audio_encoder_set_frame_max;

/** */
alias gst_audio_encoder_set_frame_samples_max = c_gst_audio_encoder_set_frame_samples_max;

/** */
alias gst_audio_encoder_set_frame_samples_min = c_gst_audio_encoder_set_frame_samples_min;

/** */
alias gst_audio_encoder_set_hard_min = c_gst_audio_encoder_set_hard_min;

/** */
alias gst_audio_encoder_set_hard_resync = c_gst_audio_encoder_set_hard_resync;

/** */
alias gst_audio_encoder_set_headers = c_gst_audio_encoder_set_headers;

/** */
alias gst_audio_encoder_set_latency = c_gst_audio_encoder_set_latency;

/** */
alias gst_audio_encoder_set_lookahead = c_gst_audio_encoder_set_lookahead;

/** */
alias gst_audio_encoder_set_mark_granule = c_gst_audio_encoder_set_mark_granule;

/** */
alias gst_audio_encoder_set_output_format = c_gst_audio_encoder_set_output_format;

/** */
alias gst_audio_encoder_set_perfect_timestamp = c_gst_audio_encoder_set_perfect_timestamp;

/** */
alias gst_audio_encoder_set_tolerance = c_gst_audio_encoder_set_tolerance;

// AudioFilter

/** */
alias gst_audio_filter_get_type = c_gst_audio_filter_get_type;

// AudioFilterClass

/** */
alias gst_audio_filter_class_add_pad_templates = c_gst_audio_filter_class_add_pad_templates;

// AudioFormatInfo

/** */
alias gst_audio_format_info_fill_silence = c_gst_audio_format_info_fill_silence;

// AudioInfo

/** */
alias gst_audio_info_get_type = c_gst_audio_info_get_type;

/** */
alias gst_audio_info_new = c_gst_audio_info_new;

/** */
alias gst_audio_info_new_from_caps = c_gst_audio_info_new_from_caps;

/** */
alias gst_audio_info_convert = c_gst_audio_info_convert;

/** */
alias gst_audio_info_copy = c_gst_audio_info_copy;

/** */
alias gst_audio_info_free = c_gst_audio_info_free;

/** */
alias gst_audio_info_is_equal = c_gst_audio_info_is_equal;

/** */
alias gst_audio_info_set_format = c_gst_audio_info_set_format;

/** */
alias gst_audio_info_to_caps = c_gst_audio_info_to_caps;

/** */
alias gst_audio_info_from_caps = c_gst_audio_info_from_caps;

/** */
alias gst_audio_info_init = c_gst_audio_info_init;

// AudioLevelMeta

/** */
alias gst_audio_level_meta_get_info = c_gst_audio_level_meta_get_info;

// AudioMeta

/** */
alias gst_audio_meta_get_info = c_gst_audio_meta_get_info;

// AudioQuantize

/** */
alias gst_audio_quantize_free = c_gst_audio_quantize_free;

/** */
alias gst_audio_quantize_reset = c_gst_audio_quantize_reset;

/** */
alias gst_audio_quantize_samples = c_gst_audio_quantize_samples;

/** */
alias gst_audio_quantize_new = c_gst_audio_quantize_new;

// AudioResampler

/** */
alias gst_audio_resampler_free = c_gst_audio_resampler_free;

/** */
alias gst_audio_resampler_get_in_frames = c_gst_audio_resampler_get_in_frames;

/** */
alias gst_audio_resampler_get_max_latency = c_gst_audio_resampler_get_max_latency;

/** */
alias gst_audio_resampler_get_out_frames = c_gst_audio_resampler_get_out_frames;

/** */
alias gst_audio_resampler_resample = c_gst_audio_resampler_resample;

/** */
alias gst_audio_resampler_reset = c_gst_audio_resampler_reset;

/** */
alias gst_audio_resampler_update = c_gst_audio_resampler_update;

/** */
alias gst_audio_resampler_new = c_gst_audio_resampler_new;

/** */
alias gst_audio_resampler_options_set_quality = c_gst_audio_resampler_options_set_quality;

// AudioRingBuffer

/** */
alias gst_audio_ring_buffer_get_type = c_gst_audio_ring_buffer_get_type;

/** */
alias gst_audio_ring_buffer_debug_spec_buff = c_gst_audio_ring_buffer_debug_spec_buff;

/** */
alias gst_audio_ring_buffer_debug_spec_caps = c_gst_audio_ring_buffer_debug_spec_caps;

/** */
alias gst_audio_ring_buffer_parse_caps = c_gst_audio_ring_buffer_parse_caps;

/** */
alias gst_audio_ring_buffer_acquire = c_gst_audio_ring_buffer_acquire;

/** */
alias gst_audio_ring_buffer_activate = c_gst_audio_ring_buffer_activate;

/** */
alias gst_audio_ring_buffer_advance = c_gst_audio_ring_buffer_advance;

/** */
alias gst_audio_ring_buffer_clear = c_gst_audio_ring_buffer_clear;

/** */
alias gst_audio_ring_buffer_clear_all = c_gst_audio_ring_buffer_clear_all;

/** */
alias gst_audio_ring_buffer_close_device = c_gst_audio_ring_buffer_close_device;

/** */
alias gst_audio_ring_buffer_commit = c_gst_audio_ring_buffer_commit;

/** */
alias gst_audio_ring_buffer_convert = c_gst_audio_ring_buffer_convert;

/** */
alias gst_audio_ring_buffer_delay = c_gst_audio_ring_buffer_delay;

/** */
alias gst_audio_ring_buffer_device_is_open = c_gst_audio_ring_buffer_device_is_open;

/** */
alias gst_audio_ring_buffer_is_acquired = c_gst_audio_ring_buffer_is_acquired;

/** */
alias gst_audio_ring_buffer_is_active = c_gst_audio_ring_buffer_is_active;

/** */
alias gst_audio_ring_buffer_is_flushing = c_gst_audio_ring_buffer_is_flushing;

/** */
alias gst_audio_ring_buffer_may_start = c_gst_audio_ring_buffer_may_start;

/** */
alias gst_audio_ring_buffer_open_device = c_gst_audio_ring_buffer_open_device;

/** */
alias gst_audio_ring_buffer_pause = c_gst_audio_ring_buffer_pause;

/** */
alias gst_audio_ring_buffer_prepare_read = c_gst_audio_ring_buffer_prepare_read;

/** */
alias gst_audio_ring_buffer_read = c_gst_audio_ring_buffer_read;

/** */
alias gst_audio_ring_buffer_release = c_gst_audio_ring_buffer_release;

/** */
alias gst_audio_ring_buffer_samples_done = c_gst_audio_ring_buffer_samples_done;

/** */
alias gst_audio_ring_buffer_set_callback = c_gst_audio_ring_buffer_set_callback;

/** */
alias gst_audio_ring_buffer_set_callback_full = c_gst_audio_ring_buffer_set_callback_full;

/** */
alias gst_audio_ring_buffer_set_channel_positions = c_gst_audio_ring_buffer_set_channel_positions;

/** */
alias gst_audio_ring_buffer_set_errored = c_gst_audio_ring_buffer_set_errored;

/** */
alias gst_audio_ring_buffer_set_flushing = c_gst_audio_ring_buffer_set_flushing;

/** */
alias gst_audio_ring_buffer_set_sample = c_gst_audio_ring_buffer_set_sample;

/** */
alias gst_audio_ring_buffer_set_timestamp = c_gst_audio_ring_buffer_set_timestamp;

/** */
alias gst_audio_ring_buffer_start = c_gst_audio_ring_buffer_start;

/** */
alias gst_audio_ring_buffer_stop = c_gst_audio_ring_buffer_stop;

// AudioSink

/** */
alias gst_audio_sink_get_type = c_gst_audio_sink_get_type;

// AudioSrc

/** */
alias gst_audio_src_get_type = c_gst_audio_src_get_type;

// AudioStreamAlign

/** */
alias gst_audio_stream_align_get_type = c_gst_audio_stream_align_get_type;

/** */
alias gst_audio_stream_align_new = c_gst_audio_stream_align_new;

/** */
alias gst_audio_stream_align_copy = c_gst_audio_stream_align_copy;

/** */
alias gst_audio_stream_align_free = c_gst_audio_stream_align_free;

/** */
alias gst_audio_stream_align_get_alignment_threshold = c_gst_audio_stream_align_get_alignment_threshold;

/** */
alias gst_audio_stream_align_get_discont_wait = c_gst_audio_stream_align_get_discont_wait;

/** */
alias gst_audio_stream_align_get_rate = c_gst_audio_stream_align_get_rate;

/** */
alias gst_audio_stream_align_get_samples_since_discont = c_gst_audio_stream_align_get_samples_since_discont;

/** */
alias gst_audio_stream_align_get_timestamp_at_discont = c_gst_audio_stream_align_get_timestamp_at_discont;

/** */
alias gst_audio_stream_align_mark_discont = c_gst_audio_stream_align_mark_discont;

/** */
alias gst_audio_stream_align_process = c_gst_audio_stream_align_process;

/** */
alias gst_audio_stream_align_set_alignment_threshold = c_gst_audio_stream_align_set_alignment_threshold;

/** */
alias gst_audio_stream_align_set_discont_wait = c_gst_audio_stream_align_set_discont_wait;

/** */
alias gst_audio_stream_align_set_rate = c_gst_audio_stream_align_set_rate;

// DsdInfo

/** */
alias gst_dsd_info_get_type = c_gst_dsd_info_get_type;

/** */
alias gst_dsd_info_new = c_gst_dsd_info_new;

/** */
alias gst_dsd_info_new_from_caps = c_gst_dsd_info_new_from_caps;

/** */
alias gst_dsd_info_copy = c_gst_dsd_info_copy;

/** */
alias gst_dsd_info_free = c_gst_dsd_info_free;

/** */
alias gst_dsd_info_is_equal = c_gst_dsd_info_is_equal;

/** */
alias gst_dsd_info_set_format = c_gst_dsd_info_set_format;

/** */
alias gst_dsd_info_to_caps = c_gst_dsd_info_to_caps;

/** */
alias gst_dsd_info_from_caps = c_gst_dsd_info_from_caps;

/** */
alias gst_dsd_info_init = c_gst_dsd_info_init;

// DsdPlaneOffsetMeta

/** */
alias gst_dsd_plane_offset_meta_get_info = c_gst_dsd_plane_offset_meta_get_info;

// StreamVolume

/** */
alias gst_stream_volume_get_type = c_gst_stream_volume_get_type;

/** */
alias gst_stream_volume_convert_volume = c_gst_stream_volume_convert_volume;

/** */
alias gst_stream_volume_get_mute = c_gst_stream_volume_get_mute;

/** */
alias gst_stream_volume_get_volume = c_gst_stream_volume_get_volume;

/** */
alias gst_stream_volume_set_mute = c_gst_stream_volume_set_mute;

/** */
alias gst_stream_volume_set_volume = c_gst_stream_volume_set_volume;

// global

/** */
alias gst_audio_channel_get_fallback_mask = c_gst_audio_channel_get_fallback_mask;

/** */
alias gst_audio_channel_positions_from_mask = c_gst_audio_channel_positions_from_mask;

/** */
alias gst_audio_channel_positions_to_mask = c_gst_audio_channel_positions_to_mask;

/** */
alias gst_audio_channel_positions_to_string = c_gst_audio_channel_positions_to_string;

/** */
alias gst_audio_channel_positions_to_valid_order = c_gst_audio_channel_positions_to_valid_order;

/** */
alias gst_audio_check_valid_channel_positions = c_gst_audio_check_valid_channel_positions;

/** */
alias gst_audio_clipping_meta_api_get_type = c_gst_audio_clipping_meta_api_get_type;

/** */
alias gst_audio_downmix_meta_api_get_type = c_gst_audio_downmix_meta_api_get_type;

/** */
alias gst_audio_format_info_get_type = c_gst_audio_format_info_get_type;

/** */
alias gst_audio_formats_raw = c_gst_audio_formats_raw;

/** */
alias gst_audio_get_channel_reorder_map = c_gst_audio_get_channel_reorder_map;

/** */
alias gst_audio_iec61937_frame_size = c_gst_audio_iec61937_frame_size;

/** */
alias gst_audio_iec61937_payload = c_gst_audio_iec61937_payload;

/** */
alias gst_audio_level_meta_api_get_type = c_gst_audio_level_meta_api_get_type;

/** */
alias gst_audio_make_raw_caps = c_gst_audio_make_raw_caps;

/** */
alias gst_audio_meta_api_get_type = c_gst_audio_meta_api_get_type;

/** */
alias gst_audio_reorder_channels = c_gst_audio_reorder_channels;

/** */
alias gst_buffer_add_audio_clipping_meta = c_gst_buffer_add_audio_clipping_meta;

/** */
alias gst_buffer_add_audio_downmix_meta = c_gst_buffer_add_audio_downmix_meta;

/** */
alias gst_buffer_add_audio_level_meta = c_gst_buffer_add_audio_level_meta;

/** */
alias gst_buffer_add_audio_meta = c_gst_buffer_add_audio_meta;

/** */
alias gst_buffer_add_dsd_plane_offset_meta = c_gst_buffer_add_dsd_plane_offset_meta;

/** */
alias gst_buffer_get_audio_downmix_meta_for_channels = c_gst_buffer_get_audio_downmix_meta_for_channels;

/** */
alias gst_buffer_get_audio_level_meta = c_gst_buffer_get_audio_level_meta;

/** */
alias gst_dsd_convert = c_gst_dsd_convert;

/** */
alias gst_dsd_plane_offset_meta_api_get_type = c_gst_dsd_plane_offset_meta_api_get_type;

// AudioFormat

/** */
alias gst_audio_format_build_integer = c_gst_audio_format_build_integer;

/** */
alias gst_audio_format_fill_silence = c_gst_audio_format_fill_silence;

/** */
alias gst_audio_format_from_string = c_gst_audio_format_from_string;

/** */
alias gst_audio_format_get_info = c_gst_audio_format_get_info;

/** */
alias gst_audio_format_to_string = c_gst_audio_format_to_string;

// DsdFormat

/** */
alias gst_dsd_format_from_string = c_gst_dsd_format_from_string;

/** */
alias gst_dsd_format_get_width = c_gst_dsd_format_get_width;

/** */
alias gst_dsd_format_to_string = c_gst_dsd_format_to_string;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // AudioAggregator
  gidLink(cast(void**)&gst_audio_aggregator_get_type, "gst_audio_aggregator_get_type", libs);
  gidLink(cast(void**)&gst_audio_aggregator_set_sink_caps, "gst_audio_aggregator_set_sink_caps", libs);

  // AudioAggregatorConvertPad
  gidLink(cast(void**)&gst_audio_aggregator_convert_pad_get_type, "gst_audio_aggregator_convert_pad_get_type", libs);

  // AudioAggregatorPad
  gidLink(cast(void**)&gst_audio_aggregator_pad_get_type, "gst_audio_aggregator_pad_get_type", libs);

  // AudioBaseSink
  gidLink(cast(void**)&gst_audio_base_sink_get_type, "gst_audio_base_sink_get_type", libs);
  gidLink(cast(void**)&gst_audio_base_sink_create_ringbuffer, "gst_audio_base_sink_create_ringbuffer", libs);
  gidLink(cast(void**)&gst_audio_base_sink_get_alignment_threshold, "gst_audio_base_sink_get_alignment_threshold", libs);
  gidLink(cast(void**)&gst_audio_base_sink_get_discont_wait, "gst_audio_base_sink_get_discont_wait", libs);
  gidLink(cast(void**)&gst_audio_base_sink_get_drift_tolerance, "gst_audio_base_sink_get_drift_tolerance", libs);
  gidLink(cast(void**)&gst_audio_base_sink_get_provide_clock, "gst_audio_base_sink_get_provide_clock", libs);
  gidLink(cast(void**)&gst_audio_base_sink_get_slave_method, "gst_audio_base_sink_get_slave_method", libs);
  gidLink(cast(void**)&gst_audio_base_sink_report_device_failure, "gst_audio_base_sink_report_device_failure", libs);
  gidLink(cast(void**)&gst_audio_base_sink_set_alignment_threshold, "gst_audio_base_sink_set_alignment_threshold", libs);
  gidLink(cast(void**)&gst_audio_base_sink_set_custom_slaving_callback, "gst_audio_base_sink_set_custom_slaving_callback", libs);
  gidLink(cast(void**)&gst_audio_base_sink_set_discont_wait, "gst_audio_base_sink_set_discont_wait", libs);
  gidLink(cast(void**)&gst_audio_base_sink_set_drift_tolerance, "gst_audio_base_sink_set_drift_tolerance", libs);
  gidLink(cast(void**)&gst_audio_base_sink_set_provide_clock, "gst_audio_base_sink_set_provide_clock", libs);
  gidLink(cast(void**)&gst_audio_base_sink_set_slave_method, "gst_audio_base_sink_set_slave_method", libs);

  // AudioBaseSrc
  gidLink(cast(void**)&gst_audio_base_src_get_type, "gst_audio_base_src_get_type", libs);
  gidLink(cast(void**)&gst_audio_base_src_create_ringbuffer, "gst_audio_base_src_create_ringbuffer", libs);
  gidLink(cast(void**)&gst_audio_base_src_get_provide_clock, "gst_audio_base_src_get_provide_clock", libs);
  gidLink(cast(void**)&gst_audio_base_src_get_slave_method, "gst_audio_base_src_get_slave_method", libs);
  gidLink(cast(void**)&gst_audio_base_src_set_provide_clock, "gst_audio_base_src_set_provide_clock", libs);
  gidLink(cast(void**)&gst_audio_base_src_set_slave_method, "gst_audio_base_src_set_slave_method", libs);

  // AudioBuffer
  gidLink(cast(void**)&gst_audio_buffer_unmap, "gst_audio_buffer_unmap", libs);
  gidLink(cast(void**)&gst_audio_buffer_clip, "gst_audio_buffer_clip", libs);
  gidLink(cast(void**)&gst_audio_buffer_map, "gst_audio_buffer_map", libs);
  gidLink(cast(void**)&gst_audio_buffer_reorder_channels, "gst_audio_buffer_reorder_channels", libs);
  gidLink(cast(void**)&gst_audio_buffer_truncate, "gst_audio_buffer_truncate", libs);

  // AudioCdSrc
  gidLink(cast(void**)&gst_audio_cd_src_get_type, "gst_audio_cd_src_get_type", libs);
  gidLink(cast(void**)&gst_audio_cd_src_add_track, "gst_audio_cd_src_add_track", libs);

  // AudioChannelMixer
  gidLink(cast(void**)&gst_audio_channel_mixer_free, "gst_audio_channel_mixer_free", libs);
  gidLink(cast(void**)&gst_audio_channel_mixer_is_passthrough, "gst_audio_channel_mixer_is_passthrough", libs);
  gidLink(cast(void**)&gst_audio_channel_mixer_samples, "gst_audio_channel_mixer_samples", libs);
  gidLink(cast(void**)&gst_audio_channel_mixer_new, "gst_audio_channel_mixer_new", libs);
  gidLink(cast(void**)&gst_audio_channel_mixer_new_with_matrix, "gst_audio_channel_mixer_new_with_matrix", libs);

  // AudioClippingMeta
  gidLink(cast(void**)&gst_audio_clipping_meta_get_info, "gst_audio_clipping_meta_get_info", libs);

  // AudioClock
  gidLink(cast(void**)&gst_audio_clock_get_type, "gst_audio_clock_get_type", libs);
  gidLink(cast(void**)&gst_audio_clock_new, "gst_audio_clock_new", libs);
  gidLink(cast(void**)&gst_audio_clock_adjust, "gst_audio_clock_adjust", libs);
  gidLink(cast(void**)&gst_audio_clock_get_time, "gst_audio_clock_get_time", libs);
  gidLink(cast(void**)&gst_audio_clock_invalidate, "gst_audio_clock_invalidate", libs);
  gidLink(cast(void**)&gst_audio_clock_reset, "gst_audio_clock_reset", libs);

  // AudioConverter
  gidLink(cast(void**)&gst_audio_converter_get_type, "gst_audio_converter_get_type", libs);
  gidLink(cast(void**)&gst_audio_converter_new, "gst_audio_converter_new", libs);
  gidLink(cast(void**)&gst_audio_converter_convert, "gst_audio_converter_convert", libs);
  gidLink(cast(void**)&gst_audio_converter_free, "gst_audio_converter_free", libs);
  gidLink(cast(void**)&gst_audio_converter_get_config, "gst_audio_converter_get_config", libs);
  gidLink(cast(void**)&gst_audio_converter_get_in_frames, "gst_audio_converter_get_in_frames", libs);
  gidLink(cast(void**)&gst_audio_converter_get_max_latency, "gst_audio_converter_get_max_latency", libs);
  gidLink(cast(void**)&gst_audio_converter_get_out_frames, "gst_audio_converter_get_out_frames", libs);
  gidLink(cast(void**)&gst_audio_converter_is_passthrough, "gst_audio_converter_is_passthrough", libs);
  gidLink(cast(void**)&gst_audio_converter_reset, "gst_audio_converter_reset", libs);
  gidLink(cast(void**)&gst_audio_converter_samples, "gst_audio_converter_samples", libs);
  gidLink(cast(void**)&gst_audio_converter_supports_inplace, "gst_audio_converter_supports_inplace", libs);
  gidLink(cast(void**)&gst_audio_converter_update_config, "gst_audio_converter_update_config", libs);

  // AudioDecoder
  gidLink(cast(void**)&gst_audio_decoder_get_type, "gst_audio_decoder_get_type", libs);
  gidLink(cast(void**)&gst_audio_decoder_allocate_output_buffer, "gst_audio_decoder_allocate_output_buffer", libs);
  gidLink(cast(void**)&gst_audio_decoder_finish_frame, "gst_audio_decoder_finish_frame", libs);
  gidLink(cast(void**)&gst_audio_decoder_finish_subframe, "gst_audio_decoder_finish_subframe", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_allocator, "gst_audio_decoder_get_allocator", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_audio_info, "gst_audio_decoder_get_audio_info", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_delay, "gst_audio_decoder_get_delay", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_drainable, "gst_audio_decoder_get_drainable", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_estimate_rate, "gst_audio_decoder_get_estimate_rate", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_latency, "gst_audio_decoder_get_latency", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_max_errors, "gst_audio_decoder_get_max_errors", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_min_latency, "gst_audio_decoder_get_min_latency", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_needs_format, "gst_audio_decoder_get_needs_format", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_parse_state, "gst_audio_decoder_get_parse_state", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_plc, "gst_audio_decoder_get_plc", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_plc_aware, "gst_audio_decoder_get_plc_aware", libs);
  gidLink(cast(void**)&gst_audio_decoder_get_tolerance, "gst_audio_decoder_get_tolerance", libs);
  gidLink(cast(void**)&gst_audio_decoder_merge_tags, "gst_audio_decoder_merge_tags", libs);
  gidLink(cast(void**)&gst_audio_decoder_negotiate, "gst_audio_decoder_negotiate", libs);
  gidLink(cast(void**)&gst_audio_decoder_proxy_getcaps, "gst_audio_decoder_proxy_getcaps", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_allocation_caps, "gst_audio_decoder_set_allocation_caps", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_drainable, "gst_audio_decoder_set_drainable", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_estimate_rate, "gst_audio_decoder_set_estimate_rate", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_latency, "gst_audio_decoder_set_latency", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_max_errors, "gst_audio_decoder_set_max_errors", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_min_latency, "gst_audio_decoder_set_min_latency", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_needs_format, "gst_audio_decoder_set_needs_format", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_output_caps, "gst_audio_decoder_set_output_caps", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_output_format, "gst_audio_decoder_set_output_format", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_plc, "gst_audio_decoder_set_plc", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_plc_aware, "gst_audio_decoder_set_plc_aware", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_tolerance, "gst_audio_decoder_set_tolerance", libs);
  gidLink(cast(void**)&gst_audio_decoder_set_use_default_pad_acceptcaps, "gst_audio_decoder_set_use_default_pad_acceptcaps", libs);

  // AudioDownmixMeta
  gidLink(cast(void**)&gst_audio_downmix_meta_get_info, "gst_audio_downmix_meta_get_info", libs);

  // AudioEncoder
  gidLink(cast(void**)&gst_audio_encoder_get_type, "gst_audio_encoder_get_type", libs);
  gidLink(cast(void**)&gst_audio_encoder_allocate_output_buffer, "gst_audio_encoder_allocate_output_buffer", libs);
  gidLink(cast(void**)&gst_audio_encoder_finish_frame, "gst_audio_encoder_finish_frame", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_allocator, "gst_audio_encoder_get_allocator", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_audio_info, "gst_audio_encoder_get_audio_info", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_drainable, "gst_audio_encoder_get_drainable", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_frame_max, "gst_audio_encoder_get_frame_max", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_frame_samples_max, "gst_audio_encoder_get_frame_samples_max", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_frame_samples_min, "gst_audio_encoder_get_frame_samples_min", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_hard_min, "gst_audio_encoder_get_hard_min", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_hard_resync, "gst_audio_encoder_get_hard_resync", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_latency, "gst_audio_encoder_get_latency", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_lookahead, "gst_audio_encoder_get_lookahead", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_mark_granule, "gst_audio_encoder_get_mark_granule", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_perfect_timestamp, "gst_audio_encoder_get_perfect_timestamp", libs);
  gidLink(cast(void**)&gst_audio_encoder_get_tolerance, "gst_audio_encoder_get_tolerance", libs);
  gidLink(cast(void**)&gst_audio_encoder_merge_tags, "gst_audio_encoder_merge_tags", libs);
  gidLink(cast(void**)&gst_audio_encoder_negotiate, "gst_audio_encoder_negotiate", libs);
  gidLink(cast(void**)&gst_audio_encoder_proxy_getcaps, "gst_audio_encoder_proxy_getcaps", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_allocation_caps, "gst_audio_encoder_set_allocation_caps", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_drainable, "gst_audio_encoder_set_drainable", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_frame_max, "gst_audio_encoder_set_frame_max", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_frame_samples_max, "gst_audio_encoder_set_frame_samples_max", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_frame_samples_min, "gst_audio_encoder_set_frame_samples_min", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_hard_min, "gst_audio_encoder_set_hard_min", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_hard_resync, "gst_audio_encoder_set_hard_resync", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_headers, "gst_audio_encoder_set_headers", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_latency, "gst_audio_encoder_set_latency", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_lookahead, "gst_audio_encoder_set_lookahead", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_mark_granule, "gst_audio_encoder_set_mark_granule", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_output_format, "gst_audio_encoder_set_output_format", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_perfect_timestamp, "gst_audio_encoder_set_perfect_timestamp", libs);
  gidLink(cast(void**)&gst_audio_encoder_set_tolerance, "gst_audio_encoder_set_tolerance", libs);

  // AudioFilter
  gidLink(cast(void**)&gst_audio_filter_get_type, "gst_audio_filter_get_type", libs);

  // AudioFilterClass
  gidLink(cast(void**)&gst_audio_filter_class_add_pad_templates, "gst_audio_filter_class_add_pad_templates", libs);

  // AudioFormatInfo
  gidLink(cast(void**)&gst_audio_format_info_fill_silence, "gst_audio_format_info_fill_silence", libs);

  // AudioInfo
  gidLink(cast(void**)&gst_audio_info_get_type, "gst_audio_info_get_type", libs);
  gidLink(cast(void**)&gst_audio_info_new, "gst_audio_info_new", libs);
  gidLink(cast(void**)&gst_audio_info_new_from_caps, "gst_audio_info_new_from_caps", libs);
  gidLink(cast(void**)&gst_audio_info_convert, "gst_audio_info_convert", libs);
  gidLink(cast(void**)&gst_audio_info_copy, "gst_audio_info_copy", libs);
  gidLink(cast(void**)&gst_audio_info_free, "gst_audio_info_free", libs);
  gidLink(cast(void**)&gst_audio_info_is_equal, "gst_audio_info_is_equal", libs);
  gidLink(cast(void**)&gst_audio_info_set_format, "gst_audio_info_set_format", libs);
  gidLink(cast(void**)&gst_audio_info_to_caps, "gst_audio_info_to_caps", libs);
  gidLink(cast(void**)&gst_audio_info_from_caps, "gst_audio_info_from_caps", libs);
  gidLink(cast(void**)&gst_audio_info_init, "gst_audio_info_init", libs);

  // AudioLevelMeta
  gidLink(cast(void**)&gst_audio_level_meta_get_info, "gst_audio_level_meta_get_info", libs);

  // AudioMeta
  gidLink(cast(void**)&gst_audio_meta_get_info, "gst_audio_meta_get_info", libs);

  // AudioQuantize
  gidLink(cast(void**)&gst_audio_quantize_free, "gst_audio_quantize_free", libs);
  gidLink(cast(void**)&gst_audio_quantize_reset, "gst_audio_quantize_reset", libs);
  gidLink(cast(void**)&gst_audio_quantize_samples, "gst_audio_quantize_samples", libs);
  gidLink(cast(void**)&gst_audio_quantize_new, "gst_audio_quantize_new", libs);

  // AudioResampler
  gidLink(cast(void**)&gst_audio_resampler_free, "gst_audio_resampler_free", libs);
  gidLink(cast(void**)&gst_audio_resampler_get_in_frames, "gst_audio_resampler_get_in_frames", libs);
  gidLink(cast(void**)&gst_audio_resampler_get_max_latency, "gst_audio_resampler_get_max_latency", libs);
  gidLink(cast(void**)&gst_audio_resampler_get_out_frames, "gst_audio_resampler_get_out_frames", libs);
  gidLink(cast(void**)&gst_audio_resampler_resample, "gst_audio_resampler_resample", libs);
  gidLink(cast(void**)&gst_audio_resampler_reset, "gst_audio_resampler_reset", libs);
  gidLink(cast(void**)&gst_audio_resampler_update, "gst_audio_resampler_update", libs);
  gidLink(cast(void**)&gst_audio_resampler_new, "gst_audio_resampler_new", libs);
  gidLink(cast(void**)&gst_audio_resampler_options_set_quality, "gst_audio_resampler_options_set_quality", libs);

  // AudioRingBuffer
  gidLink(cast(void**)&gst_audio_ring_buffer_get_type, "gst_audio_ring_buffer_get_type", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_debug_spec_buff, "gst_audio_ring_buffer_debug_spec_buff", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_debug_spec_caps, "gst_audio_ring_buffer_debug_spec_caps", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_parse_caps, "gst_audio_ring_buffer_parse_caps", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_acquire, "gst_audio_ring_buffer_acquire", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_activate, "gst_audio_ring_buffer_activate", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_advance, "gst_audio_ring_buffer_advance", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_clear, "gst_audio_ring_buffer_clear", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_clear_all, "gst_audio_ring_buffer_clear_all", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_close_device, "gst_audio_ring_buffer_close_device", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_commit, "gst_audio_ring_buffer_commit", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_convert, "gst_audio_ring_buffer_convert", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_delay, "gst_audio_ring_buffer_delay", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_device_is_open, "gst_audio_ring_buffer_device_is_open", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_is_acquired, "gst_audio_ring_buffer_is_acquired", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_is_active, "gst_audio_ring_buffer_is_active", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_is_flushing, "gst_audio_ring_buffer_is_flushing", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_may_start, "gst_audio_ring_buffer_may_start", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_open_device, "gst_audio_ring_buffer_open_device", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_pause, "gst_audio_ring_buffer_pause", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_prepare_read, "gst_audio_ring_buffer_prepare_read", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_read, "gst_audio_ring_buffer_read", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_release, "gst_audio_ring_buffer_release", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_samples_done, "gst_audio_ring_buffer_samples_done", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_set_callback, "gst_audio_ring_buffer_set_callback", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_set_callback_full, "gst_audio_ring_buffer_set_callback_full", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_set_channel_positions, "gst_audio_ring_buffer_set_channel_positions", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_set_errored, "gst_audio_ring_buffer_set_errored", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_set_flushing, "gst_audio_ring_buffer_set_flushing", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_set_sample, "gst_audio_ring_buffer_set_sample", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_set_timestamp, "gst_audio_ring_buffer_set_timestamp", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_start, "gst_audio_ring_buffer_start", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_stop, "gst_audio_ring_buffer_stop", libs);

  // AudioSink
  gidLink(cast(void**)&gst_audio_sink_get_type, "gst_audio_sink_get_type", libs);

  // AudioSrc
  gidLink(cast(void**)&gst_audio_src_get_type, "gst_audio_src_get_type", libs);

  // AudioStreamAlign
  gidLink(cast(void**)&gst_audio_stream_align_get_type, "gst_audio_stream_align_get_type", libs);
  gidLink(cast(void**)&gst_audio_stream_align_new, "gst_audio_stream_align_new", libs);
  gidLink(cast(void**)&gst_audio_stream_align_copy, "gst_audio_stream_align_copy", libs);
  gidLink(cast(void**)&gst_audio_stream_align_free, "gst_audio_stream_align_free", libs);
  gidLink(cast(void**)&gst_audio_stream_align_get_alignment_threshold, "gst_audio_stream_align_get_alignment_threshold", libs);
  gidLink(cast(void**)&gst_audio_stream_align_get_discont_wait, "gst_audio_stream_align_get_discont_wait", libs);
  gidLink(cast(void**)&gst_audio_stream_align_get_rate, "gst_audio_stream_align_get_rate", libs);
  gidLink(cast(void**)&gst_audio_stream_align_get_samples_since_discont, "gst_audio_stream_align_get_samples_since_discont", libs);
  gidLink(cast(void**)&gst_audio_stream_align_get_timestamp_at_discont, "gst_audio_stream_align_get_timestamp_at_discont", libs);
  gidLink(cast(void**)&gst_audio_stream_align_mark_discont, "gst_audio_stream_align_mark_discont", libs);
  gidLink(cast(void**)&gst_audio_stream_align_process, "gst_audio_stream_align_process", libs);
  gidLink(cast(void**)&gst_audio_stream_align_set_alignment_threshold, "gst_audio_stream_align_set_alignment_threshold", libs);
  gidLink(cast(void**)&gst_audio_stream_align_set_discont_wait, "gst_audio_stream_align_set_discont_wait", libs);
  gidLink(cast(void**)&gst_audio_stream_align_set_rate, "gst_audio_stream_align_set_rate", libs);

  // DsdInfo
  gidLink(cast(void**)&gst_dsd_info_get_type, "gst_dsd_info_get_type", libs);
  gidLink(cast(void**)&gst_dsd_info_new, "gst_dsd_info_new", libs);
  gidLink(cast(void**)&gst_dsd_info_new_from_caps, "gst_dsd_info_new_from_caps", libs);
  gidLink(cast(void**)&gst_dsd_info_copy, "gst_dsd_info_copy", libs);
  gidLink(cast(void**)&gst_dsd_info_free, "gst_dsd_info_free", libs);
  gidLink(cast(void**)&gst_dsd_info_is_equal, "gst_dsd_info_is_equal", libs);
  gidLink(cast(void**)&gst_dsd_info_set_format, "gst_dsd_info_set_format", libs);
  gidLink(cast(void**)&gst_dsd_info_to_caps, "gst_dsd_info_to_caps", libs);
  gidLink(cast(void**)&gst_dsd_info_from_caps, "gst_dsd_info_from_caps", libs);
  gidLink(cast(void**)&gst_dsd_info_init, "gst_dsd_info_init", libs);

  // DsdPlaneOffsetMeta
  gidLink(cast(void**)&gst_dsd_plane_offset_meta_get_info, "gst_dsd_plane_offset_meta_get_info", libs);

  // StreamVolume
  gidLink(cast(void**)&gst_stream_volume_get_type, "gst_stream_volume_get_type", libs);
  gidLink(cast(void**)&gst_stream_volume_convert_volume, "gst_stream_volume_convert_volume", libs);
  gidLink(cast(void**)&gst_stream_volume_get_mute, "gst_stream_volume_get_mute", libs);
  gidLink(cast(void**)&gst_stream_volume_get_volume, "gst_stream_volume_get_volume", libs);
  gidLink(cast(void**)&gst_stream_volume_set_mute, "gst_stream_volume_set_mute", libs);
  gidLink(cast(void**)&gst_stream_volume_set_volume, "gst_stream_volume_set_volume", libs);

  // global
  gidLink(cast(void**)&gst_audio_channel_get_fallback_mask, "gst_audio_channel_get_fallback_mask", libs);
  gidLink(cast(void**)&gst_audio_channel_positions_from_mask, "gst_audio_channel_positions_from_mask", libs);
  gidLink(cast(void**)&gst_audio_channel_positions_to_mask, "gst_audio_channel_positions_to_mask", libs);
  gidLink(cast(void**)&gst_audio_channel_positions_to_string, "gst_audio_channel_positions_to_string", libs);
  gidLink(cast(void**)&gst_audio_channel_positions_to_valid_order, "gst_audio_channel_positions_to_valid_order", libs);
  gidLink(cast(void**)&gst_audio_check_valid_channel_positions, "gst_audio_check_valid_channel_positions", libs);
  gidLink(cast(void**)&gst_audio_clipping_meta_api_get_type, "gst_audio_clipping_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_audio_downmix_meta_api_get_type, "gst_audio_downmix_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_audio_format_info_get_type, "gst_audio_format_info_get_type", libs);
  gidLink(cast(void**)&gst_audio_formats_raw, "gst_audio_formats_raw", libs);
  gidLink(cast(void**)&gst_audio_get_channel_reorder_map, "gst_audio_get_channel_reorder_map", libs);
  gidLink(cast(void**)&gst_audio_iec61937_frame_size, "gst_audio_iec61937_frame_size", libs);
  gidLink(cast(void**)&gst_audio_iec61937_payload, "gst_audio_iec61937_payload", libs);
  gidLink(cast(void**)&gst_audio_level_meta_api_get_type, "gst_audio_level_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_audio_make_raw_caps, "gst_audio_make_raw_caps", libs);
  gidLink(cast(void**)&gst_audio_meta_api_get_type, "gst_audio_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_audio_reorder_channels, "gst_audio_reorder_channels", libs);
  gidLink(cast(void**)&gst_buffer_add_audio_clipping_meta, "gst_buffer_add_audio_clipping_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_audio_downmix_meta, "gst_buffer_add_audio_downmix_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_audio_level_meta, "gst_buffer_add_audio_level_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_audio_meta, "gst_buffer_add_audio_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_dsd_plane_offset_meta, "gst_buffer_add_dsd_plane_offset_meta", libs);
  gidLink(cast(void**)&gst_buffer_get_audio_downmix_meta_for_channels, "gst_buffer_get_audio_downmix_meta_for_channels", libs);
  gidLink(cast(void**)&gst_buffer_get_audio_level_meta, "gst_buffer_get_audio_level_meta", libs);
  gidLink(cast(void**)&gst_dsd_convert, "gst_dsd_convert", libs);
  gidLink(cast(void**)&gst_dsd_plane_offset_meta_api_get_type, "gst_dsd_plane_offset_meta_api_get_type", libs);

  // AudioFormat
  gidLink(cast(void**)&gst_audio_format_build_integer, "gst_audio_format_build_integer", libs);
  gidLink(cast(void**)&gst_audio_format_fill_silence, "gst_audio_format_fill_silence", libs);
  gidLink(cast(void**)&gst_audio_format_from_string, "gst_audio_format_from_string", libs);
  gidLink(cast(void**)&gst_audio_format_get_info, "gst_audio_format_get_info", libs);
  gidLink(cast(void**)&gst_audio_format_to_string, "gst_audio_format_to_string", libs);

  // DsdFormat
  gidLink(cast(void**)&gst_dsd_format_from_string, "gst_dsd_format_from_string", libs);
  gidLink(cast(void**)&gst_dsd_format_get_width, "gst_dsd_format_get_width", libs);
  gidLink(cast(void**)&gst_dsd_format_to_string, "gst_dsd_format_to_string", libs);
}
