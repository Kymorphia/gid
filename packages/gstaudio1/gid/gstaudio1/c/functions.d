/// C functions for gstaudio1 library
module gid.gstaudio1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstaudio1.c.types;
static import gid.gstaudio1.c._gidlib_GstAudio;
public import gid.glib2.c.types;
public import gid.gmodule2.c.types;
public import gid.gobject2.c.types;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;

private immutable LIBS = ["gstaudio-1.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.gstaudio1.c._gidlib_GstAudio.gidLibLinked;

// AudioAggregator
private alias c_gst_audio_aggregator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_aggregator_get_typeFn c_gst_audio_aggregator_get_type; ///
private alias c_gst_audio_aggregator_set_sink_capsFn = extern(C) void function(GstAudioAggregator* aagg, GstAudioAggregatorPad* pad, GstCaps* caps) nothrow;
__gshared c_gst_audio_aggregator_set_sink_capsFn c_gst_audio_aggregator_set_sink_caps; ///

// AudioAggregatorConvertPad
private alias c_gst_audio_aggregator_convert_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_aggregator_convert_pad_get_typeFn c_gst_audio_aggregator_convert_pad_get_type; ///

// AudioAggregatorPad
private alias c_gst_audio_aggregator_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_aggregator_pad_get_typeFn c_gst_audio_aggregator_pad_get_type; ///

// AudioBaseSink
private alias c_gst_audio_base_sink_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_base_sink_get_typeFn c_gst_audio_base_sink_get_type; ///
private alias c_gst_audio_base_sink_create_ringbufferFn = extern(C) GstAudioRingBuffer* function(GstAudioBaseSink* sink) nothrow;
__gshared c_gst_audio_base_sink_create_ringbufferFn c_gst_audio_base_sink_create_ringbuffer; ///
private alias c_gst_audio_base_sink_get_alignment_thresholdFn = extern(C) GstClockTime function(GstAudioBaseSink* sink) nothrow;
__gshared c_gst_audio_base_sink_get_alignment_thresholdFn c_gst_audio_base_sink_get_alignment_threshold; ///
private alias c_gst_audio_base_sink_get_discont_waitFn = extern(C) GstClockTime function(GstAudioBaseSink* sink) nothrow;
__gshared c_gst_audio_base_sink_get_discont_waitFn c_gst_audio_base_sink_get_discont_wait; ///
private alias c_gst_audio_base_sink_get_drift_toleranceFn = extern(C) long function(GstAudioBaseSink* sink) nothrow;
__gshared c_gst_audio_base_sink_get_drift_toleranceFn c_gst_audio_base_sink_get_drift_tolerance; ///
private alias c_gst_audio_base_sink_get_provide_clockFn = extern(C) gboolean function(GstAudioBaseSink* sink) nothrow;
__gshared c_gst_audio_base_sink_get_provide_clockFn c_gst_audio_base_sink_get_provide_clock; ///
private alias c_gst_audio_base_sink_get_slave_methodFn = extern(C) GstAudioBaseSinkSlaveMethod function(GstAudioBaseSink* sink) nothrow;
__gshared c_gst_audio_base_sink_get_slave_methodFn c_gst_audio_base_sink_get_slave_method; ///
private alias c_gst_audio_base_sink_report_device_failureFn = extern(C) void function(GstAudioBaseSink* sink) nothrow;
__gshared c_gst_audio_base_sink_report_device_failureFn c_gst_audio_base_sink_report_device_failure; ///
private alias c_gst_audio_base_sink_set_alignment_thresholdFn = extern(C) void function(GstAudioBaseSink* sink, GstClockTime alignmentThreshold) nothrow;
__gshared c_gst_audio_base_sink_set_alignment_thresholdFn c_gst_audio_base_sink_set_alignment_threshold; ///
private alias c_gst_audio_base_sink_set_custom_slaving_callbackFn = extern(C) void function(GstAudioBaseSink* sink, GstAudioBaseSinkCustomSlavingCallback callback, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_audio_base_sink_set_custom_slaving_callbackFn c_gst_audio_base_sink_set_custom_slaving_callback; ///
private alias c_gst_audio_base_sink_set_discont_waitFn = extern(C) void function(GstAudioBaseSink* sink, GstClockTime discontWait) nothrow;
__gshared c_gst_audio_base_sink_set_discont_waitFn c_gst_audio_base_sink_set_discont_wait; ///
private alias c_gst_audio_base_sink_set_drift_toleranceFn = extern(C) void function(GstAudioBaseSink* sink, long driftTolerance) nothrow;
__gshared c_gst_audio_base_sink_set_drift_toleranceFn c_gst_audio_base_sink_set_drift_tolerance; ///
private alias c_gst_audio_base_sink_set_provide_clockFn = extern(C) void function(GstAudioBaseSink* sink, gboolean provide) nothrow;
__gshared c_gst_audio_base_sink_set_provide_clockFn c_gst_audio_base_sink_set_provide_clock; ///
private alias c_gst_audio_base_sink_set_slave_methodFn = extern(C) void function(GstAudioBaseSink* sink, GstAudioBaseSinkSlaveMethod method) nothrow;
__gshared c_gst_audio_base_sink_set_slave_methodFn c_gst_audio_base_sink_set_slave_method; ///

// AudioBaseSrc
private alias c_gst_audio_base_src_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_base_src_get_typeFn c_gst_audio_base_src_get_type; ///
private alias c_gst_audio_base_src_create_ringbufferFn = extern(C) GstAudioRingBuffer* function(GstAudioBaseSrc* src) nothrow;
__gshared c_gst_audio_base_src_create_ringbufferFn c_gst_audio_base_src_create_ringbuffer; ///
private alias c_gst_audio_base_src_get_provide_clockFn = extern(C) gboolean function(GstAudioBaseSrc* src) nothrow;
__gshared c_gst_audio_base_src_get_provide_clockFn c_gst_audio_base_src_get_provide_clock; ///
private alias c_gst_audio_base_src_get_slave_methodFn = extern(C) GstAudioBaseSrcSlaveMethod function(GstAudioBaseSrc* src) nothrow;
__gshared c_gst_audio_base_src_get_slave_methodFn c_gst_audio_base_src_get_slave_method; ///
private alias c_gst_audio_base_src_set_provide_clockFn = extern(C) void function(GstAudioBaseSrc* src, gboolean provide) nothrow;
__gshared c_gst_audio_base_src_set_provide_clockFn c_gst_audio_base_src_set_provide_clock; ///
private alias c_gst_audio_base_src_set_slave_methodFn = extern(C) void function(GstAudioBaseSrc* src, GstAudioBaseSrcSlaveMethod method) nothrow;
__gshared c_gst_audio_base_src_set_slave_methodFn c_gst_audio_base_src_set_slave_method; ///

// AudioBuffer
private alias c_gst_audio_buffer_unmapFn = extern(C) void function(GstAudioBuffer* buffer) nothrow;
__gshared c_gst_audio_buffer_unmapFn c_gst_audio_buffer_unmap; ///
private alias c_gst_audio_buffer_clipFn = extern(C) GstBuffer* function(GstBuffer* buffer, const(GstSegment)* segment, int rate, int bpf) nothrow;
__gshared c_gst_audio_buffer_clipFn c_gst_audio_buffer_clip; ///
private alias c_gst_audio_buffer_mapFn = extern(C) gboolean function(GstAudioBuffer* buffer, const(GstAudioInfo)* info, GstBuffer* gstbuffer, GstMapFlags flags) nothrow;
__gshared c_gst_audio_buffer_mapFn c_gst_audio_buffer_map; ///
private alias c_gst_audio_buffer_reorder_channelsFn = extern(C) gboolean function(GstBuffer* buffer, GstAudioFormat format, int channels, const(GstAudioChannelPosition)* from, const(GstAudioChannelPosition)* to) nothrow;
__gshared c_gst_audio_buffer_reorder_channelsFn c_gst_audio_buffer_reorder_channels; ///
private alias c_gst_audio_buffer_truncateFn = extern(C) GstBuffer* function(GstBuffer* buffer, int bpf, size_t trim, size_t samples) nothrow;
__gshared c_gst_audio_buffer_truncateFn c_gst_audio_buffer_truncate; ///

// AudioCdSrc
private alias c_gst_audio_cd_src_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_cd_src_get_typeFn c_gst_audio_cd_src_get_type; ///
private alias c_gst_audio_cd_src_add_trackFn = extern(C) gboolean function(GstAudioCdSrc* src, GstAudioCdSrcTrack* track) nothrow;
__gshared c_gst_audio_cd_src_add_trackFn c_gst_audio_cd_src_add_track; ///

// AudioChannelMixer
private alias c_gst_audio_channel_mixer_freeFn = extern(C) void function(GstAudioChannelMixer* mix) nothrow;
__gshared c_gst_audio_channel_mixer_freeFn c_gst_audio_channel_mixer_free; ///
private alias c_gst_audio_channel_mixer_is_passthroughFn = extern(C) gboolean function(GstAudioChannelMixer* mix) nothrow;
__gshared c_gst_audio_channel_mixer_is_passthroughFn c_gst_audio_channel_mixer_is_passthrough; ///
private alias c_gst_audio_channel_mixer_samplesFn = extern(C) void function(GstAudioChannelMixer* mix, const(void*)* in_, void** out_, int samples) nothrow;
__gshared c_gst_audio_channel_mixer_samplesFn c_gst_audio_channel_mixer_samples; ///
private alias c_gst_audio_channel_mixer_newFn = extern(C) GstAudioChannelMixer* function(GstAudioChannelMixerFlags flags, GstAudioFormat format, int inChannels, GstAudioChannelPosition* inPosition, int outChannels, GstAudioChannelPosition* outPosition) nothrow;
__gshared c_gst_audio_channel_mixer_newFn c_gst_audio_channel_mixer_new; ///
private alias c_gst_audio_channel_mixer_new_with_matrixFn = extern(C) GstAudioChannelMixer* function(GstAudioChannelMixerFlags flags, GstAudioFormat format, int inChannels, int outChannels, float** matrix) nothrow;
__gshared c_gst_audio_channel_mixer_new_with_matrixFn c_gst_audio_channel_mixer_new_with_matrix; ///

// AudioClippingMeta
private alias c_gst_audio_clipping_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_audio_clipping_meta_get_infoFn c_gst_audio_clipping_meta_get_info; ///

// AudioClock
private alias c_gst_audio_clock_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_clock_get_typeFn c_gst_audio_clock_get_type; ///
private alias c_gst_audio_clock_newFn = extern(C) GstClock* function(const(char)* name, GstAudioClockGetTimeFunc func, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_audio_clock_newFn c_gst_audio_clock_new; ///
private alias c_gst_audio_clock_adjustFn = extern(C) GstClockTime function(GstAudioClock* clock, GstClockTime time) nothrow;
__gshared c_gst_audio_clock_adjustFn c_gst_audio_clock_adjust; ///
private alias c_gst_audio_clock_get_timeFn = extern(C) GstClockTime function(GstAudioClock* clock) nothrow;
__gshared c_gst_audio_clock_get_timeFn c_gst_audio_clock_get_time; ///
private alias c_gst_audio_clock_invalidateFn = extern(C) void function(GstAudioClock* clock) nothrow;
__gshared c_gst_audio_clock_invalidateFn c_gst_audio_clock_invalidate; ///
private alias c_gst_audio_clock_resetFn = extern(C) void function(GstAudioClock* clock, GstClockTime time) nothrow;
__gshared c_gst_audio_clock_resetFn c_gst_audio_clock_reset; ///

// AudioConverter
private alias c_gst_audio_converter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_converter_get_typeFn c_gst_audio_converter_get_type; ///
private alias c_gst_audio_converter_newFn = extern(C) GstAudioConverter* function(GstAudioConverterFlags flags, GstAudioInfo* inInfo, GstAudioInfo* outInfo, GstStructure* config) nothrow;
__gshared c_gst_audio_converter_newFn c_gst_audio_converter_new; ///
private alias c_gst_audio_converter_convertFn = extern(C) gboolean function(GstAudioConverter* convert, GstAudioConverterFlags flags, void* in_, size_t inSize, void** out_, size_t* outSize) nothrow;
__gshared c_gst_audio_converter_convertFn c_gst_audio_converter_convert; ///
private alias c_gst_audio_converter_freeFn = extern(C) void function(GstAudioConverter* convert) nothrow;
__gshared c_gst_audio_converter_freeFn c_gst_audio_converter_free; ///
private alias c_gst_audio_converter_get_configFn = extern(C) const(GstStructure)* function(GstAudioConverter* convert, int* inRate, int* outRate) nothrow;
__gshared c_gst_audio_converter_get_configFn c_gst_audio_converter_get_config; ///
private alias c_gst_audio_converter_get_in_framesFn = extern(C) size_t function(GstAudioConverter* convert, size_t outFrames) nothrow;
__gshared c_gst_audio_converter_get_in_framesFn c_gst_audio_converter_get_in_frames; ///
private alias c_gst_audio_converter_get_max_latencyFn = extern(C) size_t function(GstAudioConverter* convert) nothrow;
__gshared c_gst_audio_converter_get_max_latencyFn c_gst_audio_converter_get_max_latency; ///
private alias c_gst_audio_converter_get_out_framesFn = extern(C) size_t function(GstAudioConverter* convert, size_t inFrames) nothrow;
__gshared c_gst_audio_converter_get_out_framesFn c_gst_audio_converter_get_out_frames; ///
private alias c_gst_audio_converter_is_passthroughFn = extern(C) gboolean function(GstAudioConverter* convert) nothrow;
__gshared c_gst_audio_converter_is_passthroughFn c_gst_audio_converter_is_passthrough; ///
private alias c_gst_audio_converter_resetFn = extern(C) void function(GstAudioConverter* convert) nothrow;
__gshared c_gst_audio_converter_resetFn c_gst_audio_converter_reset; ///
private alias c_gst_audio_converter_samplesFn = extern(C) gboolean function(GstAudioConverter* convert, GstAudioConverterFlags flags, void** in_, size_t inFrames, void** out_, size_t outFrames) nothrow;
__gshared c_gst_audio_converter_samplesFn c_gst_audio_converter_samples; ///
private alias c_gst_audio_converter_supports_inplaceFn = extern(C) gboolean function(GstAudioConverter* convert) nothrow;
__gshared c_gst_audio_converter_supports_inplaceFn c_gst_audio_converter_supports_inplace; ///
private alias c_gst_audio_converter_update_configFn = extern(C) gboolean function(GstAudioConverter* convert, int inRate, int outRate, GstStructure* config) nothrow;
__gshared c_gst_audio_converter_update_configFn c_gst_audio_converter_update_config; ///

// AudioDecoder
private alias c_gst_audio_decoder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_decoder_get_typeFn c_gst_audio_decoder_get_type; ///
private alias c_gst_audio_decoder_allocate_output_bufferFn = extern(C) GstBuffer* function(GstAudioDecoder* dec, size_t size) nothrow;
__gshared c_gst_audio_decoder_allocate_output_bufferFn c_gst_audio_decoder_allocate_output_buffer; ///
private alias c_gst_audio_decoder_finish_frameFn = extern(C) GstFlowReturn function(GstAudioDecoder* dec, GstBuffer* buf, int frames) nothrow;
__gshared c_gst_audio_decoder_finish_frameFn c_gst_audio_decoder_finish_frame; ///
private alias c_gst_audio_decoder_finish_subframeFn = extern(C) GstFlowReturn function(GstAudioDecoder* dec, GstBuffer* buf) nothrow;
__gshared c_gst_audio_decoder_finish_subframeFn c_gst_audio_decoder_finish_subframe; ///
private alias c_gst_audio_decoder_get_allocatorFn = extern(C) void function(GstAudioDecoder* dec, GstAllocator** allocator, GstAllocationParams* params) nothrow;
__gshared c_gst_audio_decoder_get_allocatorFn c_gst_audio_decoder_get_allocator; ///
private alias c_gst_audio_decoder_get_audio_infoFn = extern(C) GstAudioInfo* function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_get_audio_infoFn c_gst_audio_decoder_get_audio_info; ///
private alias c_gst_audio_decoder_get_delayFn = extern(C) int function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_get_delayFn c_gst_audio_decoder_get_delay; ///
private alias c_gst_audio_decoder_get_drainableFn = extern(C) gboolean function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_get_drainableFn c_gst_audio_decoder_get_drainable; ///
private alias c_gst_audio_decoder_get_estimate_rateFn = extern(C) int function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_get_estimate_rateFn c_gst_audio_decoder_get_estimate_rate; ///
private alias c_gst_audio_decoder_get_latencyFn = extern(C) void function(GstAudioDecoder* dec, GstClockTime* min, GstClockTime* max) nothrow;
__gshared c_gst_audio_decoder_get_latencyFn c_gst_audio_decoder_get_latency; ///
private alias c_gst_audio_decoder_get_max_errorsFn = extern(C) int function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_get_max_errorsFn c_gst_audio_decoder_get_max_errors; ///
private alias c_gst_audio_decoder_get_min_latencyFn = extern(C) GstClockTime function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_get_min_latencyFn c_gst_audio_decoder_get_min_latency; ///
private alias c_gst_audio_decoder_get_needs_formatFn = extern(C) gboolean function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_get_needs_formatFn c_gst_audio_decoder_get_needs_format; ///
private alias c_gst_audio_decoder_get_parse_stateFn = extern(C) void function(GstAudioDecoder* dec, gboolean* sync, gboolean* eos) nothrow;
__gshared c_gst_audio_decoder_get_parse_stateFn c_gst_audio_decoder_get_parse_state; ///
private alias c_gst_audio_decoder_get_plcFn = extern(C) gboolean function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_get_plcFn c_gst_audio_decoder_get_plc; ///
private alias c_gst_audio_decoder_get_plc_awareFn = extern(C) int function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_get_plc_awareFn c_gst_audio_decoder_get_plc_aware; ///
private alias c_gst_audio_decoder_get_toleranceFn = extern(C) GstClockTime function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_get_toleranceFn c_gst_audio_decoder_get_tolerance; ///
private alias c_gst_audio_decoder_merge_tagsFn = extern(C) void function(GstAudioDecoder* dec, const(GstTagList)* tags, GstTagMergeMode mode) nothrow;
__gshared c_gst_audio_decoder_merge_tagsFn c_gst_audio_decoder_merge_tags; ///
private alias c_gst_audio_decoder_negotiateFn = extern(C) gboolean function(GstAudioDecoder* dec) nothrow;
__gshared c_gst_audio_decoder_negotiateFn c_gst_audio_decoder_negotiate; ///
private alias c_gst_audio_decoder_proxy_getcapsFn = extern(C) GstCaps* function(GstAudioDecoder* decoder, GstCaps* caps, GstCaps* filter) nothrow;
__gshared c_gst_audio_decoder_proxy_getcapsFn c_gst_audio_decoder_proxy_getcaps; ///
private alias c_gst_audio_decoder_set_allocation_capsFn = extern(C) void function(GstAudioDecoder* dec, GstCaps* allocationCaps) nothrow;
__gshared c_gst_audio_decoder_set_allocation_capsFn c_gst_audio_decoder_set_allocation_caps; ///
private alias c_gst_audio_decoder_set_drainableFn = extern(C) void function(GstAudioDecoder* dec, gboolean enabled) nothrow;
__gshared c_gst_audio_decoder_set_drainableFn c_gst_audio_decoder_set_drainable; ///
private alias c_gst_audio_decoder_set_estimate_rateFn = extern(C) void function(GstAudioDecoder* dec, gboolean enabled) nothrow;
__gshared c_gst_audio_decoder_set_estimate_rateFn c_gst_audio_decoder_set_estimate_rate; ///
private alias c_gst_audio_decoder_set_latencyFn = extern(C) void function(GstAudioDecoder* dec, GstClockTime min, GstClockTime max) nothrow;
__gshared c_gst_audio_decoder_set_latencyFn c_gst_audio_decoder_set_latency; ///
private alias c_gst_audio_decoder_set_max_errorsFn = extern(C) void function(GstAudioDecoder* dec, int num) nothrow;
__gshared c_gst_audio_decoder_set_max_errorsFn c_gst_audio_decoder_set_max_errors; ///
private alias c_gst_audio_decoder_set_min_latencyFn = extern(C) void function(GstAudioDecoder* dec, GstClockTime num) nothrow;
__gshared c_gst_audio_decoder_set_min_latencyFn c_gst_audio_decoder_set_min_latency; ///
private alias c_gst_audio_decoder_set_needs_formatFn = extern(C) void function(GstAudioDecoder* dec, gboolean enabled) nothrow;
__gshared c_gst_audio_decoder_set_needs_formatFn c_gst_audio_decoder_set_needs_format; ///
private alias c_gst_audio_decoder_set_output_capsFn = extern(C) gboolean function(GstAudioDecoder* dec, GstCaps* caps) nothrow;
__gshared c_gst_audio_decoder_set_output_capsFn c_gst_audio_decoder_set_output_caps; ///
private alias c_gst_audio_decoder_set_output_formatFn = extern(C) gboolean function(GstAudioDecoder* dec, const(GstAudioInfo)* info) nothrow;
__gshared c_gst_audio_decoder_set_output_formatFn c_gst_audio_decoder_set_output_format; ///
private alias c_gst_audio_decoder_set_plcFn = extern(C) void function(GstAudioDecoder* dec, gboolean enabled) nothrow;
__gshared c_gst_audio_decoder_set_plcFn c_gst_audio_decoder_set_plc; ///
private alias c_gst_audio_decoder_set_plc_awareFn = extern(C) void function(GstAudioDecoder* dec, gboolean plc) nothrow;
__gshared c_gst_audio_decoder_set_plc_awareFn c_gst_audio_decoder_set_plc_aware; ///
private alias c_gst_audio_decoder_set_toleranceFn = extern(C) void function(GstAudioDecoder* dec, GstClockTime tolerance) nothrow;
__gshared c_gst_audio_decoder_set_toleranceFn c_gst_audio_decoder_set_tolerance; ///
private alias c_gst_audio_decoder_set_use_default_pad_acceptcapsFn = extern(C) void function(GstAudioDecoder* decoder, gboolean use) nothrow;
__gshared c_gst_audio_decoder_set_use_default_pad_acceptcapsFn c_gst_audio_decoder_set_use_default_pad_acceptcaps; ///

// AudioDownmixMeta
private alias c_gst_audio_downmix_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_audio_downmix_meta_get_infoFn c_gst_audio_downmix_meta_get_info; ///

// AudioEncoder
private alias c_gst_audio_encoder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_encoder_get_typeFn c_gst_audio_encoder_get_type; ///
private alias c_gst_audio_encoder_allocate_output_bufferFn = extern(C) GstBuffer* function(GstAudioEncoder* enc, size_t size) nothrow;
__gshared c_gst_audio_encoder_allocate_output_bufferFn c_gst_audio_encoder_allocate_output_buffer; ///
private alias c_gst_audio_encoder_finish_frameFn = extern(C) GstFlowReturn function(GstAudioEncoder* enc, GstBuffer* buffer, int samples) nothrow;
__gshared c_gst_audio_encoder_finish_frameFn c_gst_audio_encoder_finish_frame; ///
private alias c_gst_audio_encoder_get_allocatorFn = extern(C) void function(GstAudioEncoder* enc, GstAllocator** allocator, GstAllocationParams* params) nothrow;
__gshared c_gst_audio_encoder_get_allocatorFn c_gst_audio_encoder_get_allocator; ///
private alias c_gst_audio_encoder_get_audio_infoFn = extern(C) GstAudioInfo* function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_audio_infoFn c_gst_audio_encoder_get_audio_info; ///
private alias c_gst_audio_encoder_get_drainableFn = extern(C) gboolean function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_drainableFn c_gst_audio_encoder_get_drainable; ///
private alias c_gst_audio_encoder_get_frame_maxFn = extern(C) int function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_frame_maxFn c_gst_audio_encoder_get_frame_max; ///
private alias c_gst_audio_encoder_get_frame_samples_maxFn = extern(C) int function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_frame_samples_maxFn c_gst_audio_encoder_get_frame_samples_max; ///
private alias c_gst_audio_encoder_get_frame_samples_minFn = extern(C) int function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_frame_samples_minFn c_gst_audio_encoder_get_frame_samples_min; ///
private alias c_gst_audio_encoder_get_hard_minFn = extern(C) gboolean function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_hard_minFn c_gst_audio_encoder_get_hard_min; ///
private alias c_gst_audio_encoder_get_hard_resyncFn = extern(C) gboolean function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_hard_resyncFn c_gst_audio_encoder_get_hard_resync; ///
private alias c_gst_audio_encoder_get_latencyFn = extern(C) void function(GstAudioEncoder* enc, GstClockTime* min, GstClockTime* max) nothrow;
__gshared c_gst_audio_encoder_get_latencyFn c_gst_audio_encoder_get_latency; ///
private alias c_gst_audio_encoder_get_lookaheadFn = extern(C) int function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_lookaheadFn c_gst_audio_encoder_get_lookahead; ///
private alias c_gst_audio_encoder_get_mark_granuleFn = extern(C) gboolean function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_mark_granuleFn c_gst_audio_encoder_get_mark_granule; ///
private alias c_gst_audio_encoder_get_perfect_timestampFn = extern(C) gboolean function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_perfect_timestampFn c_gst_audio_encoder_get_perfect_timestamp; ///
private alias c_gst_audio_encoder_get_toleranceFn = extern(C) GstClockTime function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_get_toleranceFn c_gst_audio_encoder_get_tolerance; ///
private alias c_gst_audio_encoder_merge_tagsFn = extern(C) void function(GstAudioEncoder* enc, const(GstTagList)* tags, GstTagMergeMode mode) nothrow;
__gshared c_gst_audio_encoder_merge_tagsFn c_gst_audio_encoder_merge_tags; ///
private alias c_gst_audio_encoder_negotiateFn = extern(C) gboolean function(GstAudioEncoder* enc) nothrow;
__gshared c_gst_audio_encoder_negotiateFn c_gst_audio_encoder_negotiate; ///
private alias c_gst_audio_encoder_proxy_getcapsFn = extern(C) GstCaps* function(GstAudioEncoder* enc, GstCaps* caps, GstCaps* filter) nothrow;
__gshared c_gst_audio_encoder_proxy_getcapsFn c_gst_audio_encoder_proxy_getcaps; ///
private alias c_gst_audio_encoder_set_allocation_capsFn = extern(C) void function(GstAudioEncoder* enc, GstCaps* allocationCaps) nothrow;
__gshared c_gst_audio_encoder_set_allocation_capsFn c_gst_audio_encoder_set_allocation_caps; ///
private alias c_gst_audio_encoder_set_drainableFn = extern(C) void function(GstAudioEncoder* enc, gboolean enabled) nothrow;
__gshared c_gst_audio_encoder_set_drainableFn c_gst_audio_encoder_set_drainable; ///
private alias c_gst_audio_encoder_set_frame_maxFn = extern(C) void function(GstAudioEncoder* enc, int num) nothrow;
__gshared c_gst_audio_encoder_set_frame_maxFn c_gst_audio_encoder_set_frame_max; ///
private alias c_gst_audio_encoder_set_frame_samples_maxFn = extern(C) void function(GstAudioEncoder* enc, int num) nothrow;
__gshared c_gst_audio_encoder_set_frame_samples_maxFn c_gst_audio_encoder_set_frame_samples_max; ///
private alias c_gst_audio_encoder_set_frame_samples_minFn = extern(C) void function(GstAudioEncoder* enc, int num) nothrow;
__gshared c_gst_audio_encoder_set_frame_samples_minFn c_gst_audio_encoder_set_frame_samples_min; ///
private alias c_gst_audio_encoder_set_hard_minFn = extern(C) void function(GstAudioEncoder* enc, gboolean enabled) nothrow;
__gshared c_gst_audio_encoder_set_hard_minFn c_gst_audio_encoder_set_hard_min; ///
private alias c_gst_audio_encoder_set_hard_resyncFn = extern(C) void function(GstAudioEncoder* enc, gboolean enabled) nothrow;
__gshared c_gst_audio_encoder_set_hard_resyncFn c_gst_audio_encoder_set_hard_resync; ///
private alias c_gst_audio_encoder_set_headersFn = extern(C) void function(GstAudioEncoder* enc, GList* headers) nothrow;
__gshared c_gst_audio_encoder_set_headersFn c_gst_audio_encoder_set_headers; ///
private alias c_gst_audio_encoder_set_latencyFn = extern(C) void function(GstAudioEncoder* enc, GstClockTime min, GstClockTime max) nothrow;
__gshared c_gst_audio_encoder_set_latencyFn c_gst_audio_encoder_set_latency; ///
private alias c_gst_audio_encoder_set_lookaheadFn = extern(C) void function(GstAudioEncoder* enc, int num) nothrow;
__gshared c_gst_audio_encoder_set_lookaheadFn c_gst_audio_encoder_set_lookahead; ///
private alias c_gst_audio_encoder_set_mark_granuleFn = extern(C) void function(GstAudioEncoder* enc, gboolean enabled) nothrow;
__gshared c_gst_audio_encoder_set_mark_granuleFn c_gst_audio_encoder_set_mark_granule; ///
private alias c_gst_audio_encoder_set_output_formatFn = extern(C) gboolean function(GstAudioEncoder* enc, GstCaps* caps) nothrow;
__gshared c_gst_audio_encoder_set_output_formatFn c_gst_audio_encoder_set_output_format; ///
private alias c_gst_audio_encoder_set_perfect_timestampFn = extern(C) void function(GstAudioEncoder* enc, gboolean enabled) nothrow;
__gshared c_gst_audio_encoder_set_perfect_timestampFn c_gst_audio_encoder_set_perfect_timestamp; ///
private alias c_gst_audio_encoder_set_toleranceFn = extern(C) void function(GstAudioEncoder* enc, GstClockTime tolerance) nothrow;
__gshared c_gst_audio_encoder_set_toleranceFn c_gst_audio_encoder_set_tolerance; ///

// AudioFilter
private alias c_gst_audio_filter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_filter_get_typeFn c_gst_audio_filter_get_type; ///

// AudioFilterClass
private alias c_gst_audio_filter_class_add_pad_templatesFn = extern(C) void function(GstAudioFilterClass* klass, GstCaps* allowedCaps) nothrow;
__gshared c_gst_audio_filter_class_add_pad_templatesFn c_gst_audio_filter_class_add_pad_templates; ///

// AudioFormatInfo
private alias c_gst_audio_format_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_format_info_get_typeFn c_gst_audio_format_info_get_type; ///
private alias c_gst_audio_format_info_fill_silenceFn = extern(C) void function(const(GstAudioFormatInfo)* info, void* dest, size_t length) nothrow;
__gshared c_gst_audio_format_info_fill_silenceFn c_gst_audio_format_info_fill_silence; ///

// AudioInfo
private alias c_gst_audio_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_info_get_typeFn c_gst_audio_info_get_type; ///
private alias c_gst_audio_info_newFn = extern(C) GstAudioInfo* function() nothrow;
__gshared c_gst_audio_info_newFn c_gst_audio_info_new; ///
private alias c_gst_audio_info_new_from_capsFn = extern(C) GstAudioInfo* function(const(GstCaps)* caps) nothrow;
__gshared c_gst_audio_info_new_from_capsFn c_gst_audio_info_new_from_caps; ///
private alias c_gst_audio_info_convertFn = extern(C) gboolean function(const(GstAudioInfo)* info, GstFormat srcFmt, long srcVal, GstFormat destFmt, long* destVal) nothrow;
__gshared c_gst_audio_info_convertFn c_gst_audio_info_convert; ///
private alias c_gst_audio_info_copyFn = extern(C) GstAudioInfo* function(const(GstAudioInfo)* info) nothrow;
__gshared c_gst_audio_info_copyFn c_gst_audio_info_copy; ///
private alias c_gst_audio_info_freeFn = extern(C) void function(GstAudioInfo* info) nothrow;
__gshared c_gst_audio_info_freeFn c_gst_audio_info_free; ///
private alias c_gst_audio_info_is_equalFn = extern(C) gboolean function(const(GstAudioInfo)* info, const(GstAudioInfo)* other) nothrow;
__gshared c_gst_audio_info_is_equalFn c_gst_audio_info_is_equal; ///
private alias c_gst_audio_info_set_formatFn = extern(C) void function(GstAudioInfo* info, GstAudioFormat format, int rate, int channels, const(GstAudioChannelPosition)* position) nothrow;
__gshared c_gst_audio_info_set_formatFn c_gst_audio_info_set_format; ///
private alias c_gst_audio_info_to_capsFn = extern(C) GstCaps* function(const(GstAudioInfo)* info) nothrow;
__gshared c_gst_audio_info_to_capsFn c_gst_audio_info_to_caps; ///
private alias c_gst_audio_info_from_capsFn = extern(C) gboolean function(GstAudioInfo* info, const(GstCaps)* caps) nothrow;
__gshared c_gst_audio_info_from_capsFn c_gst_audio_info_from_caps; ///
private alias c_gst_audio_info_initFn = extern(C) void function(GstAudioInfo* info) nothrow;
__gshared c_gst_audio_info_initFn c_gst_audio_info_init; ///

// AudioLevelMeta
private alias c_gst_audio_level_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_audio_level_meta_get_infoFn c_gst_audio_level_meta_get_info; ///

// AudioMeta
private alias c_gst_audio_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_audio_meta_get_infoFn c_gst_audio_meta_get_info; ///

// AudioQuantize
private alias c_gst_audio_quantize_freeFn = extern(C) void function(GstAudioQuantize* quant) nothrow;
__gshared c_gst_audio_quantize_freeFn c_gst_audio_quantize_free; ///
private alias c_gst_audio_quantize_resetFn = extern(C) void function(GstAudioQuantize* quant) nothrow;
__gshared c_gst_audio_quantize_resetFn c_gst_audio_quantize_reset; ///
private alias c_gst_audio_quantize_samplesFn = extern(C) void function(GstAudioQuantize* quant, const(void*)* in_, void** out_, uint samples) nothrow;
__gshared c_gst_audio_quantize_samplesFn c_gst_audio_quantize_samples; ///
private alias c_gst_audio_quantize_newFn = extern(C) GstAudioQuantize* function(GstAudioDitherMethod dither, GstAudioNoiseShapingMethod ns, GstAudioQuantizeFlags flags, GstAudioFormat format, uint channels, uint quantizer) nothrow;
__gshared c_gst_audio_quantize_newFn c_gst_audio_quantize_new; ///

// AudioResampler
private alias c_gst_audio_resampler_freeFn = extern(C) void function(GstAudioResampler* resampler) nothrow;
__gshared c_gst_audio_resampler_freeFn c_gst_audio_resampler_free; ///
private alias c_gst_audio_resampler_get_in_framesFn = extern(C) size_t function(GstAudioResampler* resampler, size_t outFrames) nothrow;
__gshared c_gst_audio_resampler_get_in_framesFn c_gst_audio_resampler_get_in_frames; ///
private alias c_gst_audio_resampler_get_max_latencyFn = extern(C) size_t function(GstAudioResampler* resampler) nothrow;
__gshared c_gst_audio_resampler_get_max_latencyFn c_gst_audio_resampler_get_max_latency; ///
private alias c_gst_audio_resampler_get_out_framesFn = extern(C) size_t function(GstAudioResampler* resampler, size_t inFrames) nothrow;
__gshared c_gst_audio_resampler_get_out_framesFn c_gst_audio_resampler_get_out_frames; ///
private alias c_gst_audio_resampler_resampleFn = extern(C) void function(GstAudioResampler* resampler, void** in_, size_t inFrames, void** out_, size_t outFrames) nothrow;
__gshared c_gst_audio_resampler_resampleFn c_gst_audio_resampler_resample; ///
private alias c_gst_audio_resampler_resetFn = extern(C) void function(GstAudioResampler* resampler) nothrow;
__gshared c_gst_audio_resampler_resetFn c_gst_audio_resampler_reset; ///
private alias c_gst_audio_resampler_updateFn = extern(C) gboolean function(GstAudioResampler* resampler, int inRate, int outRate, GstStructure* options) nothrow;
__gshared c_gst_audio_resampler_updateFn c_gst_audio_resampler_update; ///
private alias c_gst_audio_resampler_newFn = extern(C) GstAudioResampler* function(GstAudioResamplerMethod method, GstAudioResamplerFlags flags, GstAudioFormat format, int channels, int inRate, int outRate, GstStructure* options) nothrow;
__gshared c_gst_audio_resampler_newFn c_gst_audio_resampler_new; ///
private alias c_gst_audio_resampler_options_set_qualityFn = extern(C) void function(GstAudioResamplerMethod method, uint quality, int inRate, int outRate, GstStructure* options) nothrow;
__gshared c_gst_audio_resampler_options_set_qualityFn c_gst_audio_resampler_options_set_quality; ///

// AudioRingBuffer
private alias c_gst_audio_ring_buffer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_ring_buffer_get_typeFn c_gst_audio_ring_buffer_get_type; ///
private alias c_gst_audio_ring_buffer_debug_spec_buffFn = extern(C) void function(GstAudioRingBufferSpec* spec) nothrow;
__gshared c_gst_audio_ring_buffer_debug_spec_buffFn c_gst_audio_ring_buffer_debug_spec_buff; ///
private alias c_gst_audio_ring_buffer_debug_spec_capsFn = extern(C) void function(GstAudioRingBufferSpec* spec) nothrow;
__gshared c_gst_audio_ring_buffer_debug_spec_capsFn c_gst_audio_ring_buffer_debug_spec_caps; ///
private alias c_gst_audio_ring_buffer_parse_capsFn = extern(C) gboolean function(GstAudioRingBufferSpec* spec, GstCaps* caps) nothrow;
__gshared c_gst_audio_ring_buffer_parse_capsFn c_gst_audio_ring_buffer_parse_caps; ///
private alias c_gst_audio_ring_buffer_acquireFn = extern(C) gboolean function(GstAudioRingBuffer* buf, GstAudioRingBufferSpec* spec) nothrow;
__gshared c_gst_audio_ring_buffer_acquireFn c_gst_audio_ring_buffer_acquire; ///
private alias c_gst_audio_ring_buffer_activateFn = extern(C) gboolean function(GstAudioRingBuffer* buf, gboolean active) nothrow;
__gshared c_gst_audio_ring_buffer_activateFn c_gst_audio_ring_buffer_activate; ///
private alias c_gst_audio_ring_buffer_advanceFn = extern(C) void function(GstAudioRingBuffer* buf, uint advance) nothrow;
__gshared c_gst_audio_ring_buffer_advanceFn c_gst_audio_ring_buffer_advance; ///
private alias c_gst_audio_ring_buffer_clearFn = extern(C) void function(GstAudioRingBuffer* buf, int segment) nothrow;
__gshared c_gst_audio_ring_buffer_clearFn c_gst_audio_ring_buffer_clear; ///
private alias c_gst_audio_ring_buffer_clear_allFn = extern(C) void function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_clear_allFn c_gst_audio_ring_buffer_clear_all; ///
private alias c_gst_audio_ring_buffer_close_deviceFn = extern(C) gboolean function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_close_deviceFn c_gst_audio_ring_buffer_close_device; ///
private alias c_gst_audio_ring_buffer_commitFn = extern(C) uint function(GstAudioRingBuffer* buf, ulong* sample, ubyte* data, int inSamples, int outSamples, int* accum) nothrow;
__gshared c_gst_audio_ring_buffer_commitFn c_gst_audio_ring_buffer_commit; ///
private alias c_gst_audio_ring_buffer_convertFn = extern(C) gboolean function(GstAudioRingBuffer* buf, GstFormat srcFmt, long srcVal, GstFormat destFmt, long* destVal) nothrow;
__gshared c_gst_audio_ring_buffer_convertFn c_gst_audio_ring_buffer_convert; ///
private alias c_gst_audio_ring_buffer_delayFn = extern(C) uint function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_delayFn c_gst_audio_ring_buffer_delay; ///
private alias c_gst_audio_ring_buffer_device_is_openFn = extern(C) gboolean function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_device_is_openFn c_gst_audio_ring_buffer_device_is_open; ///
private alias c_gst_audio_ring_buffer_get_segbaseFn = extern(C) ulong function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_get_segbaseFn c_gst_audio_ring_buffer_get_segbase; ///
private alias c_gst_audio_ring_buffer_get_segdoneFn = extern(C) ulong function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_get_segdoneFn c_gst_audio_ring_buffer_get_segdone; ///
private alias c_gst_audio_ring_buffer_is_acquiredFn = extern(C) gboolean function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_is_acquiredFn c_gst_audio_ring_buffer_is_acquired; ///
private alias c_gst_audio_ring_buffer_is_activeFn = extern(C) gboolean function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_is_activeFn c_gst_audio_ring_buffer_is_active; ///
private alias c_gst_audio_ring_buffer_is_flushingFn = extern(C) gboolean function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_is_flushingFn c_gst_audio_ring_buffer_is_flushing; ///
private alias c_gst_audio_ring_buffer_may_startFn = extern(C) void function(GstAudioRingBuffer* buf, gboolean allowed) nothrow;
__gshared c_gst_audio_ring_buffer_may_startFn c_gst_audio_ring_buffer_may_start; ///
private alias c_gst_audio_ring_buffer_open_deviceFn = extern(C) gboolean function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_open_deviceFn c_gst_audio_ring_buffer_open_device; ///
private alias c_gst_audio_ring_buffer_pauseFn = extern(C) gboolean function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_pauseFn c_gst_audio_ring_buffer_pause; ///
private alias c_gst_audio_ring_buffer_prepare_readFn = extern(C) gboolean function(GstAudioRingBuffer* buf, int* segment, ubyte** readptr, int* len) nothrow;
__gshared c_gst_audio_ring_buffer_prepare_readFn c_gst_audio_ring_buffer_prepare_read; ///
private alias c_gst_audio_ring_buffer_readFn = extern(C) uint function(GstAudioRingBuffer* buf, ulong sample, ubyte* data, uint len, GstClockTime* timestamp) nothrow;
__gshared c_gst_audio_ring_buffer_readFn c_gst_audio_ring_buffer_read; ///
private alias c_gst_audio_ring_buffer_releaseFn = extern(C) gboolean function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_releaseFn c_gst_audio_ring_buffer_release; ///
private alias c_gst_audio_ring_buffer_samples_doneFn = extern(C) ulong function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_samples_doneFn c_gst_audio_ring_buffer_samples_done; ///
private alias c_gst_audio_ring_buffer_set_callbackFn = extern(C) void function(GstAudioRingBuffer* buf, GstAudioRingBufferCallback cb, void* userData) nothrow;
__gshared c_gst_audio_ring_buffer_set_callbackFn c_gst_audio_ring_buffer_set_callback; ///
private alias c_gst_audio_ring_buffer_set_callback_fullFn = extern(C) void function(GstAudioRingBuffer* buf, GstAudioRingBufferCallback cb, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_audio_ring_buffer_set_callback_fullFn c_gst_audio_ring_buffer_set_callback_full; ///
private alias c_gst_audio_ring_buffer_set_channel_positionsFn = extern(C) void function(GstAudioRingBuffer* buf, const(GstAudioChannelPosition)* position) nothrow;
__gshared c_gst_audio_ring_buffer_set_channel_positionsFn c_gst_audio_ring_buffer_set_channel_positions; ///
private alias c_gst_audio_ring_buffer_set_erroredFn = extern(C) void function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_set_erroredFn c_gst_audio_ring_buffer_set_errored; ///
private alias c_gst_audio_ring_buffer_set_flushingFn = extern(C) void function(GstAudioRingBuffer* buf, gboolean flushing) nothrow;
__gshared c_gst_audio_ring_buffer_set_flushingFn c_gst_audio_ring_buffer_set_flushing; ///
private alias c_gst_audio_ring_buffer_set_sampleFn = extern(C) void function(GstAudioRingBuffer* buf, ulong sample) nothrow;
__gshared c_gst_audio_ring_buffer_set_sampleFn c_gst_audio_ring_buffer_set_sample; ///
private alias c_gst_audio_ring_buffer_set_segdoneFn = extern(C) void function(GstAudioRingBuffer* buf, ulong segdone) nothrow;
__gshared c_gst_audio_ring_buffer_set_segdoneFn c_gst_audio_ring_buffer_set_segdone; ///
private alias c_gst_audio_ring_buffer_set_timestampFn = extern(C) void function(GstAudioRingBuffer* buf, int readseg, GstClockTime timestamp) nothrow;
__gshared c_gst_audio_ring_buffer_set_timestampFn c_gst_audio_ring_buffer_set_timestamp; ///
private alias c_gst_audio_ring_buffer_startFn = extern(C) gboolean function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_startFn c_gst_audio_ring_buffer_start; ///
private alias c_gst_audio_ring_buffer_stopFn = extern(C) gboolean function(GstAudioRingBuffer* buf) nothrow;
__gshared c_gst_audio_ring_buffer_stopFn c_gst_audio_ring_buffer_stop; ///

// AudioSink
private alias c_gst_audio_sink_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_sink_get_typeFn c_gst_audio_sink_get_type; ///

// AudioSrc
private alias c_gst_audio_src_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_src_get_typeFn c_gst_audio_src_get_type; ///

// AudioStreamAlign
private alias c_gst_audio_stream_align_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_stream_align_get_typeFn c_gst_audio_stream_align_get_type; ///
private alias c_gst_audio_stream_align_newFn = extern(C) GstAudioStreamAlign* function(int rate, GstClockTime alignmentThreshold, GstClockTime discontWait) nothrow;
__gshared c_gst_audio_stream_align_newFn c_gst_audio_stream_align_new; ///
private alias c_gst_audio_stream_align_copyFn = extern(C) GstAudioStreamAlign* function(const(GstAudioStreamAlign)* align_) nothrow;
__gshared c_gst_audio_stream_align_copyFn c_gst_audio_stream_align_copy; ///
private alias c_gst_audio_stream_align_freeFn = extern(C) void function(GstAudioStreamAlign* align_) nothrow;
__gshared c_gst_audio_stream_align_freeFn c_gst_audio_stream_align_free; ///
private alias c_gst_audio_stream_align_get_alignment_thresholdFn = extern(C) GstClockTime function(const(GstAudioStreamAlign)* align_) nothrow;
__gshared c_gst_audio_stream_align_get_alignment_thresholdFn c_gst_audio_stream_align_get_alignment_threshold; ///
private alias c_gst_audio_stream_align_get_discont_waitFn = extern(C) GstClockTime function(const(GstAudioStreamAlign)* align_) nothrow;
__gshared c_gst_audio_stream_align_get_discont_waitFn c_gst_audio_stream_align_get_discont_wait; ///
private alias c_gst_audio_stream_align_get_rateFn = extern(C) int function(const(GstAudioStreamAlign)* align_) nothrow;
__gshared c_gst_audio_stream_align_get_rateFn c_gst_audio_stream_align_get_rate; ///
private alias c_gst_audio_stream_align_get_samples_since_discontFn = extern(C) ulong function(const(GstAudioStreamAlign)* align_) nothrow;
__gshared c_gst_audio_stream_align_get_samples_since_discontFn c_gst_audio_stream_align_get_samples_since_discont; ///
private alias c_gst_audio_stream_align_get_timestamp_at_discontFn = extern(C) GstClockTime function(const(GstAudioStreamAlign)* align_) nothrow;
__gshared c_gst_audio_stream_align_get_timestamp_at_discontFn c_gst_audio_stream_align_get_timestamp_at_discont; ///
private alias c_gst_audio_stream_align_mark_discontFn = extern(C) void function(GstAudioStreamAlign* align_) nothrow;
__gshared c_gst_audio_stream_align_mark_discontFn c_gst_audio_stream_align_mark_discont; ///
private alias c_gst_audio_stream_align_processFn = extern(C) gboolean function(GstAudioStreamAlign* align_, gboolean discont, GstClockTime timestamp, uint nSamples, GstClockTime* outTimestamp, GstClockTime* outDuration, ulong* outSamplePosition) nothrow;
__gshared c_gst_audio_stream_align_processFn c_gst_audio_stream_align_process; ///
private alias c_gst_audio_stream_align_set_alignment_thresholdFn = extern(C) void function(GstAudioStreamAlign* align_, GstClockTime alignmentThreshold) nothrow;
__gshared c_gst_audio_stream_align_set_alignment_thresholdFn c_gst_audio_stream_align_set_alignment_threshold; ///
private alias c_gst_audio_stream_align_set_discont_waitFn = extern(C) void function(GstAudioStreamAlign* align_, GstClockTime discontWait) nothrow;
__gshared c_gst_audio_stream_align_set_discont_waitFn c_gst_audio_stream_align_set_discont_wait; ///
private alias c_gst_audio_stream_align_set_rateFn = extern(C) void function(GstAudioStreamAlign* align_, int rate) nothrow;
__gshared c_gst_audio_stream_align_set_rateFn c_gst_audio_stream_align_set_rate; ///

// DsdInfo
private alias c_gst_dsd_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_dsd_info_get_typeFn c_gst_dsd_info_get_type; ///
private alias c_gst_dsd_info_newFn = extern(C) GstDsdInfo* function() nothrow;
__gshared c_gst_dsd_info_newFn c_gst_dsd_info_new; ///
private alias c_gst_dsd_info_new_from_capsFn = extern(C) GstDsdInfo* function(const(GstCaps)* caps) nothrow;
__gshared c_gst_dsd_info_new_from_capsFn c_gst_dsd_info_new_from_caps; ///
private alias c_gst_dsd_info_copyFn = extern(C) GstDsdInfo* function(const(GstDsdInfo)* info) nothrow;
__gshared c_gst_dsd_info_copyFn c_gst_dsd_info_copy; ///
private alias c_gst_dsd_info_freeFn = extern(C) void function(GstDsdInfo* info) nothrow;
__gshared c_gst_dsd_info_freeFn c_gst_dsd_info_free; ///
private alias c_gst_dsd_info_is_equalFn = extern(C) gboolean function(const(GstDsdInfo)* info, const(GstDsdInfo)* other) nothrow;
__gshared c_gst_dsd_info_is_equalFn c_gst_dsd_info_is_equal; ///
private alias c_gst_dsd_info_set_formatFn = extern(C) void function(GstDsdInfo* info, GstDsdFormat format, int rate, int channels, const(GstAudioChannelPosition)* positions) nothrow;
__gshared c_gst_dsd_info_set_formatFn c_gst_dsd_info_set_format; ///
private alias c_gst_dsd_info_to_capsFn = extern(C) GstCaps* function(const(GstDsdInfo)* info) nothrow;
__gshared c_gst_dsd_info_to_capsFn c_gst_dsd_info_to_caps; ///
private alias c_gst_dsd_info_from_capsFn = extern(C) gboolean function(GstDsdInfo* info, const(GstCaps)* caps) nothrow;
__gshared c_gst_dsd_info_from_capsFn c_gst_dsd_info_from_caps; ///
private alias c_gst_dsd_info_initFn = extern(C) void function(GstDsdInfo* info) nothrow;
__gshared c_gst_dsd_info_initFn c_gst_dsd_info_init; ///

// DsdPlaneOffsetMeta
private alias c_gst_dsd_plane_offset_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_dsd_plane_offset_meta_get_infoFn c_gst_dsd_plane_offset_meta_get_info; ///

// StreamVolume
private alias c_gst_stream_volume_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_stream_volume_get_typeFn c_gst_stream_volume_get_type; ///
private alias c_gst_stream_volume_convert_volumeFn = extern(C) double function(GstStreamVolumeFormat from, GstStreamVolumeFormat to, double val) nothrow;
__gshared c_gst_stream_volume_convert_volumeFn c_gst_stream_volume_convert_volume; ///
private alias c_gst_stream_volume_get_muteFn = extern(C) gboolean function(GstStreamVolume* volume) nothrow;
__gshared c_gst_stream_volume_get_muteFn c_gst_stream_volume_get_mute; ///
private alias c_gst_stream_volume_get_volumeFn = extern(C) double function(GstStreamVolume* volume, GstStreamVolumeFormat format) nothrow;
__gshared c_gst_stream_volume_get_volumeFn c_gst_stream_volume_get_volume; ///
private alias c_gst_stream_volume_set_muteFn = extern(C) void function(GstStreamVolume* volume, gboolean mute) nothrow;
__gshared c_gst_stream_volume_set_muteFn c_gst_stream_volume_set_mute; ///
private alias c_gst_stream_volume_set_volumeFn = extern(C) void function(GstStreamVolume* volume, GstStreamVolumeFormat format, double val) nothrow;
__gshared c_gst_stream_volume_set_volumeFn c_gst_stream_volume_set_volume; ///

// global
private alias c_gst_audio_channel_get_fallback_maskFn = extern(C) ulong function(int channels) nothrow;
__gshared c_gst_audio_channel_get_fallback_maskFn c_gst_audio_channel_get_fallback_mask; ///
private alias c_gst_audio_channel_positions_from_maskFn = extern(C) gboolean function(int channels, ulong channelMask, GstAudioChannelPosition* position) nothrow;
__gshared c_gst_audio_channel_positions_from_maskFn c_gst_audio_channel_positions_from_mask; ///
private alias c_gst_audio_channel_positions_to_maskFn = extern(C) gboolean function(const(GstAudioChannelPosition)* position, int channels, gboolean forceOrder, ulong* channelMask) nothrow;
__gshared c_gst_audio_channel_positions_to_maskFn c_gst_audio_channel_positions_to_mask; ///
private alias c_gst_audio_channel_positions_to_stringFn = extern(C) char* function(const(GstAudioChannelPosition)* position, int channels) nothrow;
__gshared c_gst_audio_channel_positions_to_stringFn c_gst_audio_channel_positions_to_string; ///
private alias c_gst_audio_channel_positions_to_valid_orderFn = extern(C) gboolean function(GstAudioChannelPosition* position, int channels) nothrow;
__gshared c_gst_audio_channel_positions_to_valid_orderFn c_gst_audio_channel_positions_to_valid_order; ///
private alias c_gst_audio_check_valid_channel_positionsFn = extern(C) gboolean function(const(GstAudioChannelPosition)* position, int channels, gboolean forceOrder) nothrow;
__gshared c_gst_audio_check_valid_channel_positionsFn c_gst_audio_check_valid_channel_positions; ///
private alias c_gst_audio_clipping_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_clipping_meta_api_get_typeFn c_gst_audio_clipping_meta_api_get_type; ///
private alias c_gst_audio_downmix_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_downmix_meta_api_get_typeFn c_gst_audio_downmix_meta_api_get_type; ///
private alias c_gst_audio_formats_rawFn = extern(C) const(GstAudioFormat)* function(uint* len) nothrow;
__gshared c_gst_audio_formats_rawFn c_gst_audio_formats_raw; ///
private alias c_gst_audio_get_channel_reorder_mapFn = extern(C) gboolean function(int channels, const(GstAudioChannelPosition)* from, const(GstAudioChannelPosition)* to, int* reorderMap) nothrow;
__gshared c_gst_audio_get_channel_reorder_mapFn c_gst_audio_get_channel_reorder_map; ///
private alias c_gst_audio_iec61937_frame_sizeFn = extern(C) uint function(const(GstAudioRingBufferSpec)* spec) nothrow;
__gshared c_gst_audio_iec61937_frame_sizeFn c_gst_audio_iec61937_frame_size; ///
private alias c_gst_audio_iec61937_payloadFn = extern(C) gboolean function(const(ubyte)* src, uint srcN, ubyte* dst, uint dstN, const(GstAudioRingBufferSpec)* spec, int endianness) nothrow;
__gshared c_gst_audio_iec61937_payloadFn c_gst_audio_iec61937_payload; ///
private alias c_gst_audio_level_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_level_meta_api_get_typeFn c_gst_audio_level_meta_api_get_type; ///
private alias c_gst_audio_make_raw_capsFn = extern(C) GstCaps* function(const(GstAudioFormat)* formats, uint len, GstAudioLayout layout) nothrow;
__gshared c_gst_audio_make_raw_capsFn c_gst_audio_make_raw_caps; ///
private alias c_gst_audio_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_meta_api_get_typeFn c_gst_audio_meta_api_get_type; ///
private alias c_gst_audio_reorder_channelsFn = extern(C) gboolean function(void* data, size_t size, GstAudioFormat format, int channels, const(GstAudioChannelPosition)* from, const(GstAudioChannelPosition)* to) nothrow;
__gshared c_gst_audio_reorder_channelsFn c_gst_audio_reorder_channels; ///
private alias c_gst_audio_reorder_channels_with_reorder_mapFn = extern(C) void function(void* data, size_t size, int bps, int channels, const(int)* reorderMap) nothrow;
__gshared c_gst_audio_reorder_channels_with_reorder_mapFn c_gst_audio_reorder_channels_with_reorder_map; ///
private alias c_gst_buffer_add_audio_clipping_metaFn = extern(C) GstAudioClippingMeta* function(GstBuffer* buffer, GstFormat format, ulong start, ulong end) nothrow;
__gshared c_gst_buffer_add_audio_clipping_metaFn c_gst_buffer_add_audio_clipping_meta; ///
private alias c_gst_buffer_add_audio_downmix_metaFn = extern(C) GstAudioDownmixMeta* function(GstBuffer* buffer, const(GstAudioChannelPosition)* fromPosition, int fromChannels, const(GstAudioChannelPosition)* toPosition, int toChannels, const(float*)* matrix) nothrow;
__gshared c_gst_buffer_add_audio_downmix_metaFn c_gst_buffer_add_audio_downmix_meta; ///
private alias c_gst_buffer_add_audio_level_metaFn = extern(C) GstAudioLevelMeta* function(GstBuffer* buffer, ubyte level, gboolean voiceActivity) nothrow;
__gshared c_gst_buffer_add_audio_level_metaFn c_gst_buffer_add_audio_level_meta; ///
private alias c_gst_buffer_add_audio_metaFn = extern(C) GstAudioMeta* function(GstBuffer* buffer, const(GstAudioInfo)* info, size_t samples, size_t* offsets) nothrow;
__gshared c_gst_buffer_add_audio_metaFn c_gst_buffer_add_audio_meta; ///
private alias c_gst_buffer_add_dsd_plane_offset_metaFn = extern(C) GstDsdPlaneOffsetMeta* function(GstBuffer* buffer, int numChannels, size_t numBytesPerChannel, size_t* offsets) nothrow;
__gshared c_gst_buffer_add_dsd_plane_offset_metaFn c_gst_buffer_add_dsd_plane_offset_meta; ///
private alias c_gst_buffer_get_audio_downmix_meta_for_channelsFn = extern(C) GstAudioDownmixMeta* function(GstBuffer* buffer, const(GstAudioChannelPosition)* toPosition, int toChannels) nothrow;
__gshared c_gst_buffer_get_audio_downmix_meta_for_channelsFn c_gst_buffer_get_audio_downmix_meta_for_channels; ///
private alias c_gst_buffer_get_audio_level_metaFn = extern(C) GstAudioLevelMeta* function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_get_audio_level_metaFn c_gst_buffer_get_audio_level_meta; ///
private alias c_gst_dsd_convertFn = extern(C) void function(const(ubyte)* inputData, ubyte* outputData, GstDsdFormat inputFormat, GstDsdFormat outputFormat, GstAudioLayout inputLayout, GstAudioLayout outputLayout, const(size_t)* inputPlaneOffsets, const(size_t)* outputPlaneOffsets, size_t numDsdBytes, int numChannels, gboolean reverseByteBits) nothrow;
__gshared c_gst_dsd_convertFn c_gst_dsd_convert; ///
private alias c_gst_dsd_plane_offset_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_dsd_plane_offset_meta_api_get_typeFn c_gst_dsd_plane_offset_meta_api_get_type; ///

// AudioFormat
private alias c_gst_audio_format_build_integerFn = extern(C) GstAudioFormat function(gboolean sign, int endianness, int width, int depth) nothrow;
__gshared c_gst_audio_format_build_integerFn c_gst_audio_format_build_integer; ///
private alias c_gst_audio_format_fill_silenceFn = extern(C) void function(const(GstAudioFormatInfo)* info, void* dest, size_t length) nothrow;
__gshared c_gst_audio_format_fill_silenceFn c_gst_audio_format_fill_silence; ///
private alias c_gst_audio_format_from_stringFn = extern(C) GstAudioFormat function(const(char)* format) nothrow;
__gshared c_gst_audio_format_from_stringFn c_gst_audio_format_from_string; ///
private alias c_gst_audio_format_get_infoFn = extern(C) const(GstAudioFormatInfo)* function(GstAudioFormat format) nothrow;
__gshared c_gst_audio_format_get_infoFn c_gst_audio_format_get_info; ///
private alias c_gst_audio_format_to_stringFn = extern(C) const(char)* function(GstAudioFormat format) nothrow;
__gshared c_gst_audio_format_to_stringFn c_gst_audio_format_to_string; ///

// DsdFormat
private alias c_gst_dsd_format_from_stringFn = extern(C) GstDsdFormat function(const(char)* str) nothrow;
__gshared c_gst_dsd_format_from_stringFn c_gst_dsd_format_from_string; ///
private alias c_gst_dsd_format_get_widthFn = extern(C) uint function(GstDsdFormat format) nothrow;
__gshared c_gst_dsd_format_get_widthFn c_gst_dsd_format_get_width; ///
private alias c_gst_dsd_format_to_stringFn = extern(C) const(char)* function(GstDsdFormat format) nothrow;
__gshared c_gst_dsd_format_to_stringFn c_gst_dsd_format_to_string; ///

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
alias gst_audio_format_info_get_type = c_gst_audio_format_info_get_type;

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
alias gst_audio_ring_buffer_get_segbase = c_gst_audio_ring_buffer_get_segbase;

/** */
alias gst_audio_ring_buffer_get_segdone = c_gst_audio_ring_buffer_get_segdone;

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
alias gst_audio_ring_buffer_set_segdone = c_gst_audio_ring_buffer_set_segdone;

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
alias gst_audio_reorder_channels_with_reorder_map = c_gst_audio_reorder_channels_with_reorder_map;

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
  auto libs = gidResolveLibs(LIBS, "gid.gstaudio1", "GstAudio");

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
  gidLink(cast(void**)&gst_audio_format_info_get_type, "gst_audio_format_info_get_type", libs);
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
  gidLink(cast(void**)&gst_audio_ring_buffer_get_segbase, "gst_audio_ring_buffer_get_segbase", libs);
  gidLink(cast(void**)&gst_audio_ring_buffer_get_segdone, "gst_audio_ring_buffer_get_segdone", libs);
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
  gidLink(cast(void**)&gst_audio_ring_buffer_set_segdone, "gst_audio_ring_buffer_set_segdone", libs);
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
  gidLink(cast(void**)&gst_audio_formats_raw, "gst_audio_formats_raw", libs);
  gidLink(cast(void**)&gst_audio_get_channel_reorder_map, "gst_audio_get_channel_reorder_map", libs);
  gidLink(cast(void**)&gst_audio_iec61937_frame_size, "gst_audio_iec61937_frame_size", libs);
  gidLink(cast(void**)&gst_audio_iec61937_payload, "gst_audio_iec61937_payload", libs);
  gidLink(cast(void**)&gst_audio_level_meta_api_get_type, "gst_audio_level_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_audio_make_raw_caps, "gst_audio_make_raw_caps", libs);
  gidLink(cast(void**)&gst_audio_meta_api_get_type, "gst_audio_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_audio_reorder_channels, "gst_audio_reorder_channels", libs);
  gidLink(cast(void**)&gst_audio_reorder_channels_with_reorder_map, "gst_audio_reorder_channels_with_reorder_map", libs);
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
