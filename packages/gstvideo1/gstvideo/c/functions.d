/// C functions for gstvideo1 library
module gstvideo.c.functions;

public import gid.basictypes;
import gid.loader;
import gstvideo.c.types;
public import gst.c.types;
public import gstbase.c.types;

version(Windows)
  private immutable LIBS = ["libgstvideo-1.0-0.dll;gstvideo-1.0-0.dll;gstvideo-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstvideo-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstvideo-1.0.so.0"];

__gshared extern(C)
{
  // AncillaryMeta
  const(GstMetaInfo)* function() c_gst_ancillary_meta_get_info; ///

  // ColorBalance
  GType function() c_gst_color_balance_get_type; ///
  GstColorBalanceType function(GstColorBalance* balance) c_gst_color_balance_get_balance_type; ///
  int function(GstColorBalance* balance, GstColorBalanceChannel* channel) c_gst_color_balance_get_value; ///
  const(GList)* function(GstColorBalance* balance) c_gst_color_balance_list_channels; ///
  void function(GstColorBalance* balance, GstColorBalanceChannel* channel, int value) c_gst_color_balance_set_value; ///
  void function(GstColorBalance* balance, GstColorBalanceChannel* channel, int value) c_gst_color_balance_value_changed; ///

  // ColorBalanceChannel
  GType function() c_gst_color_balance_channel_get_type; ///

  // Navigation
  GType function() c_gst_navigation_get_type; ///
  bool function(GstEvent* event, double* x, double* y) c_gst_navigation_event_get_coordinates; ///
  GstNavigationEventType function(GstEvent* event) c_gst_navigation_event_get_type; ///
  GstEvent* function(GstNavigationCommand command) c_gst_navigation_event_new_command; ///
  GstEvent* function(const(char)* key, GstNavigationModifierType state) c_gst_navigation_event_new_key_press; ///
  GstEvent* function(const(char)* key, GstNavigationModifierType state) c_gst_navigation_event_new_key_release; ///
  GstEvent* function(int button, double x, double y, GstNavigationModifierType state) c_gst_navigation_event_new_mouse_button_press; ///
  GstEvent* function(int button, double x, double y, GstNavigationModifierType state) c_gst_navigation_event_new_mouse_button_release; ///
  GstEvent* function(double x, double y, GstNavigationModifierType state) c_gst_navigation_event_new_mouse_move; ///
  GstEvent* function(double x, double y, double deltaX, double deltaY, GstNavigationModifierType state) c_gst_navigation_event_new_mouse_scroll; ///
  GstEvent* function(GstNavigationModifierType state) c_gst_navigation_event_new_touch_cancel; ///
  GstEvent* function(uint identifier, double x, double y, double pressure, GstNavigationModifierType state) c_gst_navigation_event_new_touch_down; ///
  GstEvent* function(GstNavigationModifierType state) c_gst_navigation_event_new_touch_frame; ///
  GstEvent* function(uint identifier, double x, double y, double pressure, GstNavigationModifierType state) c_gst_navigation_event_new_touch_motion; ///
  GstEvent* function(uint identifier, double x, double y, GstNavigationModifierType state) c_gst_navigation_event_new_touch_up; ///
  bool function(GstEvent* event, GstNavigationCommand* command) c_gst_navigation_event_parse_command; ///
  bool function(GstEvent* event, const(char*)* key) c_gst_navigation_event_parse_key_event; ///
  bool function(GstEvent* event, GstNavigationModifierType* state) c_gst_navigation_event_parse_modifier_state; ///
  bool function(GstEvent* event, int* button, double* x, double* y) c_gst_navigation_event_parse_mouse_button_event; ///
  bool function(GstEvent* event, double* x, double* y) c_gst_navigation_event_parse_mouse_move_event; ///
  bool function(GstEvent* event, double* x, double* y, double* deltaX, double* deltaY) c_gst_navigation_event_parse_mouse_scroll_event; ///
  bool function(GstEvent* event, uint* identifier, double* x, double* y, double* pressure) c_gst_navigation_event_parse_touch_event; ///
  bool function(GstEvent* event, uint* identifier, double* x, double* y) c_gst_navigation_event_parse_touch_up_event; ///
  bool function(GstEvent* event, double x, double y) c_gst_navigation_event_set_coordinates; ///
  GstNavigationMessageType function(GstMessage* message) c_gst_navigation_message_get_type; ///
  GstMessage* function(GstObject* src, uint curAngle, uint nAngles) c_gst_navigation_message_new_angles_changed; ///
  GstMessage* function(GstObject* src) c_gst_navigation_message_new_commands_changed; ///
  GstMessage* function(GstObject* src, GstEvent* event) c_gst_navigation_message_new_event; ///
  GstMessage* function(GstObject* src, bool active) c_gst_navigation_message_new_mouse_over; ///
  bool function(GstMessage* message, uint* curAngle, uint* nAngles) c_gst_navigation_message_parse_angles_changed; ///
  bool function(GstMessage* message, GstEvent** event) c_gst_navigation_message_parse_event; ///
  bool function(GstMessage* message, bool* active) c_gst_navigation_message_parse_mouse_over; ///
  GstNavigationQueryType function(GstQuery* query) c_gst_navigation_query_get_type; ///
  GstQuery* function() c_gst_navigation_query_new_angles; ///
  GstQuery* function() c_gst_navigation_query_new_commands; ///
  bool function(GstQuery* query, uint* curAngle, uint* nAngles) c_gst_navigation_query_parse_angles; ///
  bool function(GstQuery* query, uint* nCmds) c_gst_navigation_query_parse_commands_length; ///
  bool function(GstQuery* query, uint nth, GstNavigationCommand* cmd) c_gst_navigation_query_parse_commands_nth; ///
  void function(GstQuery* query, uint curAngle, uint nAngles) c_gst_navigation_query_set_angles; ///
  void function(GstQuery* query, int nCmds,  ...) c_gst_navigation_query_set_commands; ///
  void function(GstQuery* query, int nCmds, GstNavigationCommand* cmds) c_gst_navigation_query_set_commandsv; ///
  void function(GstNavigation* navigation, GstNavigationCommand command) c_gst_navigation_send_command; ///
  void function(GstNavigation* navigation, GstStructure* structure) c_gst_navigation_send_event; ///
  void function(GstNavigation* navigation, GstEvent* event) c_gst_navigation_send_event_simple; ///
  void function(GstNavigation* navigation, const(char)* event, const(char)* key) c_gst_navigation_send_key_event; ///
  void function(GstNavigation* navigation, const(char)* event, int button, double x, double y) c_gst_navigation_send_mouse_event; ///
  void function(GstNavigation* navigation, double x, double y, double deltaX, double deltaY) c_gst_navigation_send_mouse_scroll_event; ///

  // VideoAFDMeta
  const(GstMetaInfo)* function() c_gst_video_afd_meta_get_info; ///

  // VideoAffineTransformationMeta
  void function(GstVideoAffineTransformationMeta* meta, const(float)* matrix) c_gst_video_affine_transformation_meta_apply_matrix; ///
  const(GstMetaInfo)* function() c_gst_video_affine_transformation_meta_get_info; ///

  // VideoAggregator
  GType function() c_gst_video_aggregator_get_type; ///
  GstTaskPool* function(GstVideoAggregator* vagg) c_gst_video_aggregator_get_execution_task_pool; ///

  // VideoAggregatorConvertPad
  GType function() c_gst_video_aggregator_convert_pad_get_type; ///
  void function(GstVideoAggregatorConvertPad* pad) c_gst_video_aggregator_convert_pad_update_conversion_info; ///

  // VideoAggregatorPad
  GType function() c_gst_video_aggregator_pad_get_type; ///
  GstBuffer* function(GstVideoAggregatorPad* pad) c_gst_video_aggregator_pad_get_current_buffer; ///
  GstVideoFrame* function(GstVideoAggregatorPad* pad) c_gst_video_aggregator_pad_get_prepared_frame; ///
  bool function(GstVideoAggregatorPad* pad) c_gst_video_aggregator_pad_has_current_buffer; ///
  void function(GstVideoAggregatorPad* pad, bool needsAlpha) c_gst_video_aggregator_pad_set_needs_alpha; ///

  // VideoAggregatorParallelConvertPad
  GType function() c_gst_video_aggregator_parallel_convert_pad_get_type; ///

  // VideoAlignment
  void function(GstVideoAlignment* align_) c_gst_video_alignment_reset; ///

  // VideoBarMeta
  const(GstMetaInfo)* function() c_gst_video_bar_meta_get_info; ///

  // VideoBufferPool
  GType function() c_gst_video_buffer_pool_get_type; ///
  GstBufferPool* function() c_gst_video_buffer_pool_new; ///

  // VideoCaptionMeta
  const(GstMetaInfo)* function() c_gst_video_caption_meta_get_info; ///

  // VideoChromaResample
  void function(GstVideoChromaResample* resample) c_gst_video_chroma_resample_free; ///
  void function(GstVideoChromaResample* resample, uint* nLines, int* offset) c_gst_video_chroma_resample_get_info; ///
  GstVideoChromaResample* function(GstVideoChromaMethod method, GstVideoChromaSite site, GstVideoChromaFlags flags, GstVideoFormat format, int hFactor, int vFactor) c_gst_video_chroma_resample_new; ///

  // VideoCodecAlphaMeta
  const(GstMetaInfo)* function() c_gst_video_codec_alpha_meta_get_info; ///

  // VideoCodecFrame
  GType function() c_gst_video_codec_frame_get_type; ///
  void* function(GstVideoCodecFrame* frame) c_gst_video_codec_frame_get_user_data; ///
  GstVideoCodecFrame* function(GstVideoCodecFrame* frame) c_gst_video_codec_frame_ref; ///
  void function(GstVideoCodecFrame* frame, void* userData, GDestroyNotify notify) c_gst_video_codec_frame_set_user_data; ///
  void function(GstVideoCodecFrame* frame) c_gst_video_codec_frame_unref; ///

  // VideoCodecState
  GType function() c_gst_video_codec_state_get_type; ///
  GstVideoCodecState* function(GstVideoCodecState* state) c_gst_video_codec_state_ref; ///
  void function(GstVideoCodecState* state) c_gst_video_codec_state_unref; ///

  // VideoColorimetry
  bool function(GstVideoColorimetry* cinfo, const(char)* color) c_gst_video_colorimetry_from_string; ///
  bool function(const(GstVideoColorimetry)* cinfo, const(GstVideoColorimetry)* other) c_gst_video_colorimetry_is_equal; ///
  bool function(const(GstVideoColorimetry)* cinfo, uint bitdepth, const(GstVideoColorimetry)* other, uint otherBitdepth) c_gst_video_colorimetry_is_equivalent; ///
  bool function(const(GstVideoColorimetry)* cinfo, const(char)* color) c_gst_video_colorimetry_matches; ///
  char* function(const(GstVideoColorimetry)* cinfo) c_gst_video_colorimetry_to_string; ///

  // VideoContentLightLevel
  bool function(const(GstVideoContentLightLevel)* linfo, GstCaps* caps) c_gst_video_content_light_level_add_to_caps; ///
  bool function(GstVideoContentLightLevel* linfo, const(GstCaps)* caps) c_gst_video_content_light_level_from_caps; ///
  bool function(GstVideoContentLightLevel* linfo, const(char)* level) c_gst_video_content_light_level_from_string; ///
  void function(GstVideoContentLightLevel* linfo) c_gst_video_content_light_level_init; ///
  bool function(const(GstVideoContentLightLevel)* linfo, const(GstVideoContentLightLevel)* other) c_gst_video_content_light_level_is_equal; ///
  char* function(const(GstVideoContentLightLevel)* linfo) c_gst_video_content_light_level_to_string; ///

  // VideoConverter
  void function(GstVideoConverter* convert, const(GstVideoFrame)* src, GstVideoFrame* dest) c_gst_video_converter_frame; ///
  void function(GstVideoConverter* convert) c_gst_video_converter_frame_finish; ///
  void function(GstVideoConverter* convert) c_gst_video_converter_free; ///
  const(GstStructure)* function(GstVideoConverter* convert) c_gst_video_converter_get_config; ///
  const(GstVideoInfo)* function(GstVideoConverter* convert) c_gst_video_converter_get_in_info; ///
  const(GstVideoInfo)* function(GstVideoConverter* convert) c_gst_video_converter_get_out_info; ///
  bool function(GstVideoConverter* convert, GstStructure* config) c_gst_video_converter_set_config; ///
  GstVideoConverter* function(const(GstVideoInfo)* inInfo, const(GstVideoInfo)* outInfo, GstStructure* config) c_gst_video_converter_new; ///
  GstVideoConverter* function(const(GstVideoInfo)* inInfo, const(GstVideoInfo)* outInfo, GstStructure* config, GstTaskPool* pool) c_gst_video_converter_new_with_pool; ///

  // VideoCropMeta
  const(GstMetaInfo)* function() c_gst_video_crop_meta_get_info; ///

  // VideoDecoder
  GType function() c_gst_video_decoder_get_type; ///
  void function(GstVideoDecoder* decoder, int nBytes) c_gst_video_decoder_add_to_frame; ///
  GstBuffer* function(GstVideoDecoder* decoder) c_gst_video_decoder_allocate_output_buffer; ///
  GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) c_gst_video_decoder_allocate_output_frame; ///
  GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame, GstBufferPoolAcquireParams* params) c_gst_video_decoder_allocate_output_frame_with_params; ///
  GstFlowReturn function(GstVideoDecoder* dec, GstVideoCodecFrame* frame) c_gst_video_decoder_drop_frame; ///
  GstFlowReturn function(GstVideoDecoder* dec, GstVideoCodecFrame* frame) c_gst_video_decoder_drop_subframe; ///
  GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) c_gst_video_decoder_finish_frame; ///
  GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) c_gst_video_decoder_finish_subframe; ///
  void function(GstVideoDecoder* decoder, GstAllocator** allocator, GstAllocationParams* params) c_gst_video_decoder_get_allocator; ///
  GstBufferPool* function(GstVideoDecoder* decoder) c_gst_video_decoder_get_buffer_pool; ///
  int function(GstVideoDecoder* dec) c_gst_video_decoder_get_estimate_rate; ///
  GstVideoCodecFrame* function(GstVideoDecoder* decoder, int frameNumber) c_gst_video_decoder_get_frame; ///
  GList* function(GstVideoDecoder* decoder) c_gst_video_decoder_get_frames; ///
  uint function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) c_gst_video_decoder_get_input_subframe_index; ///
  void function(GstVideoDecoder* decoder, GstClockTime* minLatency, GstClockTime* maxLatency) c_gst_video_decoder_get_latency; ///
  GstClockTimeDiff function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) c_gst_video_decoder_get_max_decode_time; ///
  int function(GstVideoDecoder* dec) c_gst_video_decoder_get_max_errors; ///
  bool function(GstVideoDecoder* dec) c_gst_video_decoder_get_needs_format; ///
  bool function(GstVideoDecoder* dec) c_gst_video_decoder_get_needs_sync_point; ///
  GstVideoCodecFrame* function(GstVideoDecoder* decoder) c_gst_video_decoder_get_oldest_frame; ///
  GstVideoCodecState* function(GstVideoDecoder* decoder) c_gst_video_decoder_get_output_state; ///
  bool function(GstVideoDecoder* decoder) c_gst_video_decoder_get_packetized; ///
  size_t function(GstVideoDecoder* decoder) c_gst_video_decoder_get_pending_frame_size; ///
  uint function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) c_gst_video_decoder_get_processed_subframe_index; ///
  double function(GstVideoDecoder* decoder) c_gst_video_decoder_get_qos_proportion; ///
  bool function(GstVideoDecoder* decoder) c_gst_video_decoder_get_subframe_mode; ///
  GstFlowReturn function(GstVideoDecoder* decoder) c_gst_video_decoder_have_frame; ///
  GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) c_gst_video_decoder_have_last_subframe; ///
  void function(GstVideoDecoder* decoder, const(GstTagList)* tags, GstTagMergeMode mode) c_gst_video_decoder_merge_tags; ///
  bool function(GstVideoDecoder* decoder) c_gst_video_decoder_negotiate; ///
  GstCaps* function(GstVideoDecoder* decoder, GstCaps* caps, GstCaps* filter) c_gst_video_decoder_proxy_getcaps; ///
  void function(GstVideoDecoder* dec, GstVideoCodecFrame* frame) c_gst_video_decoder_release_frame; ///
  void function(GstVideoDecoder* dec, GstVideoCodecFrame* frame, GstVideoDecoderRequestSyncPointFlags flags) c_gst_video_decoder_request_sync_point; ///
  void function(GstVideoDecoder* dec, bool enabled) c_gst_video_decoder_set_estimate_rate; ///
  GstVideoCodecState* function(GstVideoDecoder* decoder, GstVideoFormat fmt, GstVideoInterlaceMode interlaceMode, uint width, uint height, GstVideoCodecState* reference) c_gst_video_decoder_set_interlaced_output_state; ///
  void function(GstVideoDecoder* decoder, GstClockTime minLatency, GstClockTime maxLatency) c_gst_video_decoder_set_latency; ///
  void function(GstVideoDecoder* dec, int num) c_gst_video_decoder_set_max_errors; ///
  void function(GstVideoDecoder* dec, bool enabled) c_gst_video_decoder_set_needs_format; ///
  void function(GstVideoDecoder* dec, bool enabled) c_gst_video_decoder_set_needs_sync_point; ///
  GstVideoCodecState* function(GstVideoDecoder* decoder, GstVideoFormat fmt, uint width, uint height, GstVideoCodecState* reference) c_gst_video_decoder_set_output_state; ///
  void function(GstVideoDecoder* decoder, bool packetized) c_gst_video_decoder_set_packetized; ///
  void function(GstVideoDecoder* decoder, bool subframeMode) c_gst_video_decoder_set_subframe_mode; ///
  void function(GstVideoDecoder* decoder, bool use) c_gst_video_decoder_set_use_default_pad_acceptcaps; ///

  // VideoDirection
  GType function() c_gst_video_direction_get_type; ///

  // VideoDither
  void function(GstVideoDither* dither) c_gst_video_dither_free; ///
  void function(GstVideoDither* dither, void* line, uint x, uint y, uint width) c_gst_video_dither_line; ///
  GstVideoDither* function(GstVideoDitherMethod method, GstVideoDitherFlags flags, GstVideoFormat format, uint* quantizer, uint width) c_gst_video_dither_new; ///

  // VideoEncoder
  GType function() c_gst_video_encoder_get_type; ///
  GstBuffer* function(GstVideoEncoder* encoder, size_t size) c_gst_video_encoder_allocate_output_buffer; ///
  GstFlowReturn function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame, size_t size) c_gst_video_encoder_allocate_output_frame; ///
  GstFlowReturn function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) c_gst_video_encoder_finish_frame; ///
  GstFlowReturn function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) c_gst_video_encoder_finish_subframe; ///
  void function(GstVideoEncoder* encoder, GstAllocator** allocator, GstAllocationParams* params) c_gst_video_encoder_get_allocator; ///
  GstVideoCodecFrame* function(GstVideoEncoder* encoder, int frameNumber) c_gst_video_encoder_get_frame; ///
  GList* function(GstVideoEncoder* encoder) c_gst_video_encoder_get_frames; ///
  void function(GstVideoEncoder* encoder, GstClockTime* minLatency, GstClockTime* maxLatency) c_gst_video_encoder_get_latency; ///
  GstClockTimeDiff function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) c_gst_video_encoder_get_max_encode_time; ///
  GstClockTime function(GstVideoEncoder* encoder) c_gst_video_encoder_get_min_force_key_unit_interval; ///
  GstVideoCodecFrame* function(GstVideoEncoder* encoder) c_gst_video_encoder_get_oldest_frame; ///
  GstVideoCodecState* function(GstVideoEncoder* encoder) c_gst_video_encoder_get_output_state; ///
  bool function(GstVideoEncoder* encoder) c_gst_video_encoder_is_qos_enabled; ///
  void function(GstVideoEncoder* encoder, const(GstTagList)* tags, GstTagMergeMode mode) c_gst_video_encoder_merge_tags; ///
  bool function(GstVideoEncoder* encoder) c_gst_video_encoder_negotiate; ///
  GstCaps* function(GstVideoEncoder* enc, GstCaps* caps, GstCaps* filter) c_gst_video_encoder_proxy_getcaps; ///
  void function(GstVideoEncoder* encoder, GList* headers) c_gst_video_encoder_set_headers; ///
  void function(GstVideoEncoder* encoder, GstClockTime minLatency, GstClockTime maxLatency) c_gst_video_encoder_set_latency; ///
  void function(GstVideoEncoder* encoder, GstClockTime interval) c_gst_video_encoder_set_min_force_key_unit_interval; ///
  void function(GstVideoEncoder* encoder, GstClockTime minPts) c_gst_video_encoder_set_min_pts; ///
  GstVideoCodecState* function(GstVideoEncoder* encoder, GstCaps* caps, GstVideoCodecState* reference) c_gst_video_encoder_set_output_state; ///
  void function(GstVideoEncoder* encoder, bool enabled) c_gst_video_encoder_set_qos_enabled; ///

  // VideoFilter
  GType function() c_gst_video_filter_get_type; ///

  // VideoFormatInfo
  void function(const(GstVideoFormatInfo)* info, uint plane, int* components) c_gst_video_format_info_component; ///
  int function(const(GstVideoFormatInfo)* finfo, int plane, int stride) c_gst_video_format_info_extrapolate_stride; ///

  // VideoFrame
  bool function(GstVideoFrame* dest, const(GstVideoFrame)* src) c_gst_video_frame_copy; ///
  bool function(GstVideoFrame* dest, const(GstVideoFrame)* src, uint plane) c_gst_video_frame_copy_plane; ///
  void function(GstVideoFrame* frame) c_gst_video_frame_unmap; ///
  bool function(GstVideoFrame* frame, const(GstVideoInfo)* info, GstBuffer* buffer, GstMapFlags flags) c_gst_video_frame_map; ///
  bool function(GstVideoFrame* frame, const(GstVideoInfo)* info, GstBuffer* buffer, int id, GstMapFlags flags) c_gst_video_frame_map_id; ///

  // VideoGLTextureUploadMeta
  bool function(GstVideoGLTextureUploadMeta* meta, uint* textureId) c_gst_video_gl_texture_upload_meta_upload; ///
  const(GstMetaInfo)* function() c_gst_video_gl_texture_upload_meta_get_info; ///

  // VideoInfo
  GType function() c_gst_video_info_get_type; ///
  GstVideoInfo* function() c_gst_video_info_new; ///
  GstVideoInfo* function(const(GstCaps)* caps) c_gst_video_info_new_from_caps; ///
  bool function(GstVideoInfo* info, GstVideoAlignment* align_) c_gst_video_info_align; ///
  bool function(GstVideoInfo* info, GstVideoAlignment* align_, size_t* planeSize) c_gst_video_info_align_full; ///
  bool function(const(GstVideoInfo)* info, GstFormat srcFormat, long srcValue, GstFormat destFormat, long* destValue) c_gst_video_info_convert; ///
  GstVideoInfo* function(const(GstVideoInfo)* info) c_gst_video_info_copy; ///
  void function(GstVideoInfo* info) c_gst_video_info_free; ///
  bool function(const(GstVideoInfo)* info, const(GstVideoInfo)* other) c_gst_video_info_is_equal; ///
  bool function(GstVideoInfo* info, GstVideoFormat format, uint width, uint height) c_gst_video_info_set_format; ///
  bool function(GstVideoInfo* info, GstVideoFormat format, GstVideoInterlaceMode mode, uint width, uint height) c_gst_video_info_set_interlaced_format; ///
  GstCaps* function(const(GstVideoInfo)* info) c_gst_video_info_to_caps; ///
  bool function(GstVideoInfo* info, const(GstCaps)* caps) c_gst_video_info_from_caps; ///
  void function(GstVideoInfo* info) c_gst_video_info_init; ///

  // VideoInfoDmaDrm
  GType function() c_gst_video_info_dma_drm_get_type; ///
  GstVideoInfoDmaDrm* function() c_gst_video_info_dma_drm_new; ///
  GstVideoInfoDmaDrm* function(const(GstCaps)* caps) c_gst_video_info_dma_drm_new_from_caps; ///
  void function(GstVideoInfoDmaDrm* drmInfo) c_gst_video_info_dma_drm_free; ///
  GstCaps* function(const(GstVideoInfoDmaDrm)* drmInfo) c_gst_video_info_dma_drm_to_caps; ///
  bool function(const(GstVideoInfoDmaDrm)* drmInfo, GstVideoInfo* info) c_gst_video_info_dma_drm_to_video_info; ///
  bool function(GstVideoInfoDmaDrm* drmInfo, const(GstCaps)* caps) c_gst_video_info_dma_drm_from_caps; ///
  bool function(GstVideoInfoDmaDrm* drmInfo, const(GstVideoInfo)* info, ulong modifier) c_gst_video_info_dma_drm_from_video_info; ///
  void function(GstVideoInfoDmaDrm* drmInfo) c_gst_video_info_dma_drm_init; ///

  // VideoMasteringDisplayInfo
  bool function(const(GstVideoMasteringDisplayInfo)* minfo, GstCaps* caps) c_gst_video_mastering_display_info_add_to_caps; ///
  bool function(GstVideoMasteringDisplayInfo* minfo, const(GstCaps)* caps) c_gst_video_mastering_display_info_from_caps; ///
  void function(GstVideoMasteringDisplayInfo* minfo) c_gst_video_mastering_display_info_init; ///
  bool function(const(GstVideoMasteringDisplayInfo)* minfo, const(GstVideoMasteringDisplayInfo)* other) c_gst_video_mastering_display_info_is_equal; ///
  char* function(const(GstVideoMasteringDisplayInfo)* minfo) c_gst_video_mastering_display_info_to_string; ///
  bool function(GstVideoMasteringDisplayInfo* minfo, const(char)* mastering) c_gst_video_mastering_display_info_from_string; ///

  // VideoMeta
  bool function(GstVideoMeta* meta, uint* planeHeight) c_gst_video_meta_get_plane_height; ///
  bool function(GstVideoMeta* meta, size_t* planeSize) c_gst_video_meta_get_plane_size; ///
  bool function(GstVideoMeta* meta, uint plane, GstMapInfo* info, void** data, int* stride, GstMapFlags flags) c_gst_video_meta_map; ///
  bool function(GstVideoMeta* meta, GstVideoAlignment alignment) c_gst_video_meta_set_alignment; ///
  bool function(GstVideoMeta* meta, uint plane, GstMapInfo* info) c_gst_video_meta_unmap; ///
  const(GstMetaInfo)* function() c_gst_video_meta_get_info; ///

  // VideoMetaTransform
  GQuark function() c_gst_video_meta_transform_scale_get_quark; ///

  // VideoMultiviewFlagsSet
  GType function() c_gst_video_multiview_flagset_get_type; ///

  // VideoOrientation
  GType function() c_gst_video_orientation_get_type; ///
  bool function(GstTagList* taglist, GstVideoOrientationMethod* method) c_gst_video_orientation_from_tag; ///
  bool function(GstVideoOrientation* videoOrientation, int* center) c_gst_video_orientation_get_hcenter; ///
  bool function(GstVideoOrientation* videoOrientation, bool* flip) c_gst_video_orientation_get_hflip; ///
  bool function(GstVideoOrientation* videoOrientation, int* center) c_gst_video_orientation_get_vcenter; ///
  bool function(GstVideoOrientation* videoOrientation, bool* flip) c_gst_video_orientation_get_vflip; ///
  bool function(GstVideoOrientation* videoOrientation, int center) c_gst_video_orientation_set_hcenter; ///
  bool function(GstVideoOrientation* videoOrientation, bool flip) c_gst_video_orientation_set_hflip; ///
  bool function(GstVideoOrientation* videoOrientation, int center) c_gst_video_orientation_set_vcenter; ///
  bool function(GstVideoOrientation* videoOrientation, bool flip) c_gst_video_orientation_set_vflip; ///

  // VideoOverlay
  GType function() c_gst_video_overlay_get_type; ///
  void function(GObjectClass* oclass, int lastPropId) c_gst_video_overlay_install_properties; ///
  bool function(ObjectC* object, int lastPropId, uint propertyId, const(GValue)* value) c_gst_video_overlay_set_property; ///
  void function(GstVideoOverlay* overlay) c_gst_video_overlay_expose; ///
  void function(GstVideoOverlay* overlay, size_t handle) c_gst_video_overlay_got_window_handle; ///
  void function(GstVideoOverlay* overlay, bool handleEvents) c_gst_video_overlay_handle_events; ///
  void function(GstVideoOverlay* overlay) c_gst_video_overlay_prepare_window_handle; ///
  bool function(GstVideoOverlay* overlay, int x, int y, int width, int height) c_gst_video_overlay_set_render_rectangle; ///
  void function(GstVideoOverlay* overlay, size_t handle) c_gst_video_overlay_set_window_handle; ///

  // VideoOverlayComposition
  GType function() c_gst_video_overlay_composition_get_type; ///
  GstVideoOverlayComposition* function(GstVideoOverlayRectangle* rectangle) c_gst_video_overlay_composition_new; ///
  void function(GstVideoOverlayComposition* comp, GstVideoOverlayRectangle* rectangle) c_gst_video_overlay_composition_add_rectangle; ///
  bool function(GstVideoOverlayComposition* comp, GstVideoFrame* videoBuf) c_gst_video_overlay_composition_blend; ///
  GstVideoOverlayComposition* function(GstVideoOverlayComposition* comp) c_gst_video_overlay_composition_copy; ///
  GstVideoOverlayRectangle* function(GstVideoOverlayComposition* comp, uint n) c_gst_video_overlay_composition_get_rectangle; ///
  uint function(GstVideoOverlayComposition* comp) c_gst_video_overlay_composition_get_seqnum; ///
  GstVideoOverlayComposition* function(GstVideoOverlayComposition* comp) c_gst_video_overlay_composition_make_writable; ///
  uint function(GstVideoOverlayComposition* comp) c_gst_video_overlay_composition_n_rectangles; ///

  // VideoOverlayCompositionMeta
  const(GstMetaInfo)* function() c_gst_video_overlay_composition_meta_get_info; ///

  // VideoOverlayRectangle
  GType function() c_gst_video_overlay_rectangle_get_type; ///
  GstVideoOverlayRectangle* function(GstBuffer* pixels, int renderX, int renderY, uint renderWidth, uint renderHeight, GstVideoOverlayFormatFlags flags) c_gst_video_overlay_rectangle_new_raw; ///
  GstVideoOverlayRectangle* function(GstVideoOverlayRectangle* rectangle) c_gst_video_overlay_rectangle_copy; ///
  GstVideoOverlayFormatFlags function(GstVideoOverlayRectangle* rectangle) c_gst_video_overlay_rectangle_get_flags; ///
  float function(GstVideoOverlayRectangle* rectangle) c_gst_video_overlay_rectangle_get_global_alpha; ///
  GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) c_gst_video_overlay_rectangle_get_pixels_argb; ///
  GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) c_gst_video_overlay_rectangle_get_pixels_ayuv; ///
  GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) c_gst_video_overlay_rectangle_get_pixels_raw; ///
  GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) c_gst_video_overlay_rectangle_get_pixels_unscaled_argb; ///
  GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) c_gst_video_overlay_rectangle_get_pixels_unscaled_ayuv; ///
  GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) c_gst_video_overlay_rectangle_get_pixels_unscaled_raw; ///
  bool function(GstVideoOverlayRectangle* rectangle, int* renderX, int* renderY, uint* renderWidth, uint* renderHeight) c_gst_video_overlay_rectangle_get_render_rectangle; ///
  uint function(GstVideoOverlayRectangle* rectangle) c_gst_video_overlay_rectangle_get_seqnum; ///
  void function(GstVideoOverlayRectangle* rectangle, float globalAlpha) c_gst_video_overlay_rectangle_set_global_alpha; ///
  void function(GstVideoOverlayRectangle* rectangle, int renderX, int renderY, uint renderWidth, uint renderHeight) c_gst_video_overlay_rectangle_set_render_rectangle; ///

  // VideoRegionOfInterestMeta
  void function(GstVideoRegionOfInterestMeta* meta, GstStructure* s) c_gst_video_region_of_interest_meta_add_param; ///
  GstStructure* function(GstVideoRegionOfInterestMeta* meta, const(char)* name) c_gst_video_region_of_interest_meta_get_param; ///
  const(GstMetaInfo)* function() c_gst_video_region_of_interest_meta_get_info; ///

  // VideoResampler
  void function(GstVideoResampler* resampler) c_gst_video_resampler_clear; ///
  bool function(GstVideoResampler* resampler, GstVideoResamplerMethod method, GstVideoResamplerFlags flags, uint nPhases, uint nTaps, double shift, uint inSize, uint outSize, GstStructure* options) c_gst_video_resampler_init; ///

  // VideoSEIUserDataUnregisteredMeta
  const(GstMetaInfo)* function() c_gst_video_sei_user_data_unregistered_meta_get_info; ///

  // VideoScaler
  void function(GstVideoScaler* hscale, GstVideoScaler* vscale, GstVideoFormat format, void* src, int srcStride, void* dest, int destStride, uint x, uint y, uint width, uint height) c_gst_video_scaler_2d; ///
  GstVideoScaler* function(GstVideoScaler* yScale, GstVideoScaler* uvScale, GstVideoFormat inFormat, GstVideoFormat outFormat) c_gst_video_scaler_combine_packed_YUV; ///
  void function(GstVideoScaler* scale) c_gst_video_scaler_free; ///
  const(double)* function(GstVideoScaler* scale, uint outOffset, uint* inOffset, uint* nTaps) c_gst_video_scaler_get_coeff; ///
  uint function(GstVideoScaler* scale) c_gst_video_scaler_get_max_taps; ///
  void function(GstVideoScaler* scale, GstVideoFormat format, void* src, void* dest, uint destOffset, uint width) c_gst_video_scaler_horizontal; ///
  void function(GstVideoScaler* scale, GstVideoFormat format, void** srcLines, void* dest, uint destOffset, uint width) c_gst_video_scaler_vertical; ///
  GstVideoScaler* function(GstVideoResamplerMethod method, GstVideoScalerFlags flags, uint nTaps, uint inSize, uint outSize, GstStructure* options) c_gst_video_scaler_new; ///

  // VideoSink
  GType function() c_gst_video_sink_get_type; ///
  void function(GstVideoRectangle src, GstVideoRectangle dst, GstVideoRectangle* result, bool scaling) c_gst_video_sink_center_rect; ///

  // VideoTimeCode
  GType function() c_gst_video_time_code_get_type; ///
  GstVideoTimeCode* function(uint fpsN, uint fpsD, GDateTime* latestDailyJam, GstVideoTimeCodeFlags flags, uint hours, uint minutes, uint seconds, uint frames, uint fieldCount) c_gst_video_time_code_new; ///
  GstVideoTimeCode* function() c_gst_video_time_code_new_empty; ///
  GstVideoTimeCode* function(uint fpsN, uint fpsD, GDateTime* dt, GstVideoTimeCodeFlags flags, uint fieldCount) c_gst_video_time_code_new_from_date_time; ///
  GstVideoTimeCode* function(uint fpsN, uint fpsD, GDateTime* dt, GstVideoTimeCodeFlags flags, uint fieldCount) c_gst_video_time_code_new_from_date_time_full; ///
  GstVideoTimeCode* function(const(char)* tcStr) c_gst_video_time_code_new_from_string; ///
  void function(GstVideoTimeCode* tc, long frames) c_gst_video_time_code_add_frames; ///
  GstVideoTimeCode* function(const(GstVideoTimeCode)* tc, const(GstVideoTimeCodeInterval)* tcInter) c_gst_video_time_code_add_interval; ///
  void function(GstVideoTimeCode* tc) c_gst_video_time_code_clear; ///
  int function(const(GstVideoTimeCode)* tc1, const(GstVideoTimeCode)* tc2) c_gst_video_time_code_compare; ///
  GstVideoTimeCode* function(const(GstVideoTimeCode)* tc) c_gst_video_time_code_copy; ///
  ulong function(const(GstVideoTimeCode)* tc) c_gst_video_time_code_frames_since_daily_jam; ///
  void function(GstVideoTimeCode* tc) c_gst_video_time_code_free; ///
  void function(GstVideoTimeCode* tc) c_gst_video_time_code_increment_frame; ///
  void function(GstVideoTimeCode* tc, uint fpsN, uint fpsD, GDateTime* latestDailyJam, GstVideoTimeCodeFlags flags, uint hours, uint minutes, uint seconds, uint frames, uint fieldCount) c_gst_video_time_code_init; ///
  void function(GstVideoTimeCode* tc, uint fpsN, uint fpsD, GDateTime* dt, GstVideoTimeCodeFlags flags, uint fieldCount) c_gst_video_time_code_init_from_date_time; ///
  bool function(GstVideoTimeCode* tc, uint fpsN, uint fpsD, GDateTime* dt, GstVideoTimeCodeFlags flags, uint fieldCount) c_gst_video_time_code_init_from_date_time_full; ///
  bool function(const(GstVideoTimeCode)* tc) c_gst_video_time_code_is_valid; ///
  ulong function(const(GstVideoTimeCode)* tc) c_gst_video_time_code_nsec_since_daily_jam; ///
  GDateTime* function(const(GstVideoTimeCode)* tc) c_gst_video_time_code_to_date_time; ///
  char* function(const(GstVideoTimeCode)* tc) c_gst_video_time_code_to_string; ///

  // VideoTimeCodeInterval
  GType function() c_gst_video_time_code_interval_get_type; ///
  GstVideoTimeCodeInterval* function(uint hours, uint minutes, uint seconds, uint frames) c_gst_video_time_code_interval_new; ///
  GstVideoTimeCodeInterval* function(const(char)* tcInterStr) c_gst_video_time_code_interval_new_from_string; ///
  void function(GstVideoTimeCodeInterval* tc) c_gst_video_time_code_interval_clear; ///
  GstVideoTimeCodeInterval* function(const(GstVideoTimeCodeInterval)* tc) c_gst_video_time_code_interval_copy; ///
  void function(GstVideoTimeCodeInterval* tc) c_gst_video_time_code_interval_free; ///
  void function(GstVideoTimeCodeInterval* tc, uint hours, uint minutes, uint seconds, uint frames) c_gst_video_time_code_interval_init; ///

  // VideoTimeCodeMeta
  const(GstMetaInfo)* function() c_gst_video_time_code_meta_get_info; ///

  // VideoVBIEncoder
  GType function() c_gst_video_vbi_encoder_get_type; ///
  GstVideoVBIEncoder* function(GstVideoFormat format, uint pixelWidth) c_gst_video_vbi_encoder_new; ///
  bool function(GstVideoVBIEncoder* encoder, bool composite, ubyte DID, ubyte SDIDBlockNumber, const(ubyte)* data, uint dataCount) c_gst_video_vbi_encoder_add_ancillary; ///
  GstVideoVBIEncoder* function(const(GstVideoVBIEncoder)* encoder) c_gst_video_vbi_encoder_copy; ///
  void function(GstVideoVBIEncoder* encoder) c_gst_video_vbi_encoder_free; ///
  void function(GstVideoVBIEncoder* encoder, ubyte* data) c_gst_video_vbi_encoder_write_line; ///

  // VideoVBIParser
  GType function() c_gst_video_vbi_parser_get_type; ///
  GstVideoVBIParser* function(GstVideoFormat format, uint pixelWidth) c_gst_video_vbi_parser_new; ///
  void function(GstVideoVBIParser* parser, const(ubyte)* data) c_gst_video_vbi_parser_add_line; ///
  GstVideoVBIParser* function(const(GstVideoVBIParser)* parser) c_gst_video_vbi_parser_copy; ///
  void function(GstVideoVBIParser* parser) c_gst_video_vbi_parser_free; ///
  GstVideoVBIParserResult function(GstVideoVBIParser* parser, GstVideoAncillary* anc) c_gst_video_vbi_parser_get_ancillary; ///

  // global
  GType function() c_gst_ancillary_meta_api_get_type; ///
  GstAncillaryMeta* function(GstBuffer* buffer) c_gst_buffer_add_ancillary_meta; ///
  GstVideoAFDMeta* function(GstBuffer* buffer, ubyte field, GstVideoAFDSpec spec, GstVideoAFDValue afd) c_gst_buffer_add_video_afd_meta; ///
  GstVideoAffineTransformationMeta* function(GstBuffer* buffer) c_gst_buffer_add_video_affine_transformation_meta; ///
  GstVideoBarMeta* function(GstBuffer* buffer, ubyte field, bool isLetterbox, uint barData1, uint barData2) c_gst_buffer_add_video_bar_meta; ///
  GstVideoCaptionMeta* function(GstBuffer* buffer, GstVideoCaptionType captionType, const(ubyte)* data, size_t size) c_gst_buffer_add_video_caption_meta; ///
  GstVideoCodecAlphaMeta* function(GstBuffer* buffer, GstBuffer* alphaBuffer) c_gst_buffer_add_video_codec_alpha_meta; ///
  GstVideoGLTextureUploadMeta* function(GstBuffer* buffer, GstVideoGLTextureOrientation textureOrientation, uint nTextures, GstVideoGLTextureType* textureType, GstVideoGLTextureUpload upload, void* userData, GBoxedCopyFunc userDataCopy, GBoxedFreeFunc userDataFree) c_gst_buffer_add_video_gl_texture_upload_meta; ///
  GstVideoMeta* function(GstBuffer* buffer, GstVideoFrameFlags flags, GstVideoFormat format, uint width, uint height) c_gst_buffer_add_video_meta; ///
  GstVideoMeta* function(GstBuffer* buffer, GstVideoFrameFlags flags, GstVideoFormat format, uint width, uint height, uint nPlanes, const(size_t)* offset, const(int)* stride) c_gst_buffer_add_video_meta_full; ///
  GstVideoOverlayCompositionMeta* function(GstBuffer* buf, GstVideoOverlayComposition* comp) c_gst_buffer_add_video_overlay_composition_meta; ///
  GstVideoRegionOfInterestMeta* function(GstBuffer* buffer, const(char)* roiType, uint x, uint y, uint w, uint h) c_gst_buffer_add_video_region_of_interest_meta; ///
  GstVideoRegionOfInterestMeta* function(GstBuffer* buffer, GQuark roiType, uint x, uint y, uint w, uint h) c_gst_buffer_add_video_region_of_interest_meta_id; ///
  GstVideoSEIUserDataUnregisteredMeta* function(GstBuffer* buffer, ubyte* uuid, ubyte* data, size_t size) c_gst_buffer_add_video_sei_user_data_unregistered_meta; ///
  GstVideoTimeCodeMeta* function(GstBuffer* buffer, const(GstVideoTimeCode)* tc) c_gst_buffer_add_video_time_code_meta; ///
  GstVideoTimeCodeMeta* function(GstBuffer* buffer, uint fpsN, uint fpsD, GDateTime* latestDailyJam, GstVideoTimeCodeFlags flags, uint hours, uint minutes, uint seconds, uint frames, uint fieldCount) c_gst_buffer_add_video_time_code_meta_full; ///
  GstVideoMeta* function(GstBuffer* buffer) c_gst_buffer_get_video_meta; ///
  GstVideoMeta* function(GstBuffer* buffer, int id) c_gst_buffer_get_video_meta_id; ///
  GstVideoRegionOfInterestMeta* function(GstBuffer* buffer, int id) c_gst_buffer_get_video_region_of_interest_meta_id; ///
  bool function(GstStructure* config, GstVideoAlignment* align_) c_gst_buffer_pool_config_get_video_alignment; ///
  void function(GstStructure* config, const(GstVideoAlignment)* align_) c_gst_buffer_pool_config_set_video_alignment; ///
  bool function(GstMessage* msg) c_gst_is_video_overlay_prepare_window_handle_message; ///
  GType function() c_gst_video_afd_meta_api_get_type; ///
  GType function() c_gst_video_affine_transformation_meta_api_get_type; ///
  GType function() c_gst_video_bar_meta_api_get_type; ///
  bool function(GstVideoFrame* dest, GstVideoFrame* src, int x, int y, float globalAlpha) c_gst_video_blend; ///
  void function(GstVideoInfo* src, GstBuffer* srcBuffer, int destHeight, int destWidth, GstVideoInfo* dest, GstBuffer** destBuffer) c_gst_video_blend_scale_linear_RGBA; ///
  bool function(uint* darN, uint* darD, uint videoWidth, uint videoHeight, uint videoParN, uint videoParD, uint displayParN, uint displayParD) c_gst_video_calculate_display_ratio; ///
  GType function() c_gst_video_caption_meta_api_get_type; ///
  void function(const(GstVideoRectangle)* src, const(GstVideoRectangle)* dst, GstVideoRectangle* result, bool scaling) c_gst_video_center_rect; ///
  GstVideoChromaSite function(const(char)* s) c_gst_video_chroma_from_string; ///
  void function(GstVideoChromaResample* resample, void** lines, int width) c_gst_video_chroma_resample; ///
  const(char)* function(GstVideoChromaSite site) c_gst_video_chroma_to_string; ///
  GType function() c_gst_video_codec_alpha_meta_api_get_type; ///
  double function(GstVideoTransferFunction func, double val) c_gst_video_color_transfer_decode; ///
  double function(GstVideoTransferFunction func, double val) c_gst_video_color_transfer_encode; ///
  GstSample* function(GstSample* sample, const(GstCaps)* toCaps, GstClockTime timeout, GError** _err) c_gst_video_convert_sample; ///
  void function(GstSample* sample, const(GstCaps)* toCaps, GstClockTime timeout, GstVideoConvertSampleCallback callback, void* userData, GDestroyNotify destroyNotify) c_gst_video_convert_sample_async; ///
  GType function() c_gst_video_crop_meta_api_get_type; ///
  uint function(GstVideoFormat format) c_gst_video_dma_drm_fourcc_from_format; ///
  uint function(const(char)* formatStr, ulong* modifier) c_gst_video_dma_drm_fourcc_from_string; ///
  GstVideoFormat function(uint fourcc) c_gst_video_dma_drm_fourcc_to_format; ///
  char* function(uint fourcc, ulong modifier) c_gst_video_dma_drm_fourcc_to_string; ///
  bool function(GstEvent* event) c_gst_video_event_is_force_key_unit; ///
  GstEvent* function(GstClockTime timestamp, GstClockTime streamTime, GstClockTime runningTime, bool allHeaders, uint count) c_gst_video_event_new_downstream_force_key_unit; ///
  GstEvent* function(bool inStill) c_gst_video_event_new_still_frame; ///
  GstEvent* function(GstClockTime runningTime, bool allHeaders, uint count) c_gst_video_event_new_upstream_force_key_unit; ///
  bool function(GstEvent* event, GstClockTime* timestamp, GstClockTime* streamTime, GstClockTime* runningTime, bool* allHeaders, uint* count) c_gst_video_event_parse_downstream_force_key_unit; ///
  bool function(GstEvent* event, bool* inStill) c_gst_video_event_parse_still_frame; ///
  bool function(GstEvent* event, GstClockTime* runningTime, bool* allHeaders, uint* count) c_gst_video_event_parse_upstream_force_key_unit; ///
  const(GstVideoFormat)* function(uint* len) c_gst_video_formats_any; ///
  const(GstVideoFormat)* function(uint* len) c_gst_video_formats_raw; ///
  GType function() c_gst_video_gl_texture_upload_meta_api_get_type; ///
  bool function(GstClockTime duration, int* destN, int* destD) c_gst_video_guess_framerate; ///
  bool function(int width, int height, int parN, int parD) c_gst_video_is_common_aspect_ratio; ///
  bool function(const(GstCaps)* caps) c_gst_video_is_dma_drm_caps; ///
  GstCaps* function(const(GstVideoFormat)* formats, uint len) c_gst_video_make_raw_caps; ///
  GstCaps* function(const(GstVideoFormat)* formats, uint len, GstCapsFeatures* features) c_gst_video_make_raw_caps_with_features; ///
  GType function() c_gst_video_meta_api_get_type; ///
  const(GValue)* function() c_gst_video_multiview_get_doubled_height_modes; ///
  const(GValue)* function() c_gst_video_multiview_get_doubled_size_modes; ///
  const(GValue)* function() c_gst_video_multiview_get_doubled_width_modes; ///
  const(GValue)* function() c_gst_video_multiview_get_mono_modes; ///
  const(GValue)* function() c_gst_video_multiview_get_unpacked_modes; ///
  bool function(GstVideoMultiviewMode mvMode, uint width, uint height, uint parN, uint parD) c_gst_video_multiview_guess_half_aspect; ///
  void function(GstVideoInfo* info, GstVideoMultiviewMode outMviewMode, GstVideoMultiviewFlags outMviewFlags) c_gst_video_multiview_video_info_change_mode; ///
  GType function() c_gst_video_overlay_composition_meta_api_get_type; ///
  GType function() c_gst_video_region_of_interest_meta_api_get_type; ///
  GType function() c_gst_video_sei_user_data_unregistered_meta_api_get_type; ///
  bool function(GstVideoSEIUserDataUnregisteredMeta* userData, ubyte* status, ulong* precisionTimeStamp) c_gst_video_sei_user_data_unregistered_parse_precision_time_stamp; ///
  uint function(GstVideoTileMode mode, int x, int y, int xTiles, int yTiles) c_gst_video_tile_get_index; ///
  GType function() c_gst_video_time_code_meta_api_get_type; ///
}

// AncillaryMeta

/** */
alias gst_ancillary_meta_get_info = c_gst_ancillary_meta_get_info;

// ColorBalance

/** */
alias gst_color_balance_get_type = c_gst_color_balance_get_type;

/** */
alias gst_color_balance_get_balance_type = c_gst_color_balance_get_balance_type;

/** */
alias gst_color_balance_get_value = c_gst_color_balance_get_value;

/** */
alias gst_color_balance_list_channels = c_gst_color_balance_list_channels;

/** */
alias gst_color_balance_set_value = c_gst_color_balance_set_value;

/** */
alias gst_color_balance_value_changed = c_gst_color_balance_value_changed;

// ColorBalanceChannel

/** */
alias gst_color_balance_channel_get_type = c_gst_color_balance_channel_get_type;

// Navigation

/** */
alias gst_navigation_get_type = c_gst_navigation_get_type;

/** */
alias gst_navigation_event_get_coordinates = c_gst_navigation_event_get_coordinates;

/** */
alias gst_navigation_event_get_type = c_gst_navigation_event_get_type;

/** */
alias gst_navigation_event_new_command = c_gst_navigation_event_new_command;

/** */
alias gst_navigation_event_new_key_press = c_gst_navigation_event_new_key_press;

/** */
alias gst_navigation_event_new_key_release = c_gst_navigation_event_new_key_release;

/** */
alias gst_navigation_event_new_mouse_button_press = c_gst_navigation_event_new_mouse_button_press;

/** */
alias gst_navigation_event_new_mouse_button_release = c_gst_navigation_event_new_mouse_button_release;

/** */
alias gst_navigation_event_new_mouse_move = c_gst_navigation_event_new_mouse_move;

/** */
alias gst_navigation_event_new_mouse_scroll = c_gst_navigation_event_new_mouse_scroll;

/** */
alias gst_navigation_event_new_touch_cancel = c_gst_navigation_event_new_touch_cancel;

/** */
alias gst_navigation_event_new_touch_down = c_gst_navigation_event_new_touch_down;

/** */
alias gst_navigation_event_new_touch_frame = c_gst_navigation_event_new_touch_frame;

/** */
alias gst_navigation_event_new_touch_motion = c_gst_navigation_event_new_touch_motion;

/** */
alias gst_navigation_event_new_touch_up = c_gst_navigation_event_new_touch_up;

/** */
alias gst_navigation_event_parse_command = c_gst_navigation_event_parse_command;

/** */
alias gst_navigation_event_parse_key_event = c_gst_navigation_event_parse_key_event;

/** */
alias gst_navigation_event_parse_modifier_state = c_gst_navigation_event_parse_modifier_state;

/** */
alias gst_navigation_event_parse_mouse_button_event = c_gst_navigation_event_parse_mouse_button_event;

/** */
alias gst_navigation_event_parse_mouse_move_event = c_gst_navigation_event_parse_mouse_move_event;

/** */
alias gst_navigation_event_parse_mouse_scroll_event = c_gst_navigation_event_parse_mouse_scroll_event;

/** */
alias gst_navigation_event_parse_touch_event = c_gst_navigation_event_parse_touch_event;

/** */
alias gst_navigation_event_parse_touch_up_event = c_gst_navigation_event_parse_touch_up_event;

/** */
alias gst_navigation_event_set_coordinates = c_gst_navigation_event_set_coordinates;

/** */
alias gst_navigation_message_get_type = c_gst_navigation_message_get_type;

/** */
alias gst_navigation_message_new_angles_changed = c_gst_navigation_message_new_angles_changed;

/** */
alias gst_navigation_message_new_commands_changed = c_gst_navigation_message_new_commands_changed;

/** */
alias gst_navigation_message_new_event = c_gst_navigation_message_new_event;

/** */
alias gst_navigation_message_new_mouse_over = c_gst_navigation_message_new_mouse_over;

/** */
alias gst_navigation_message_parse_angles_changed = c_gst_navigation_message_parse_angles_changed;

/** */
alias gst_navigation_message_parse_event = c_gst_navigation_message_parse_event;

/** */
alias gst_navigation_message_parse_mouse_over = c_gst_navigation_message_parse_mouse_over;

/** */
alias gst_navigation_query_get_type = c_gst_navigation_query_get_type;

/** */
alias gst_navigation_query_new_angles = c_gst_navigation_query_new_angles;

/** */
alias gst_navigation_query_new_commands = c_gst_navigation_query_new_commands;

/** */
alias gst_navigation_query_parse_angles = c_gst_navigation_query_parse_angles;

/** */
alias gst_navigation_query_parse_commands_length = c_gst_navigation_query_parse_commands_length;

/** */
alias gst_navigation_query_parse_commands_nth = c_gst_navigation_query_parse_commands_nth;

/** */
alias gst_navigation_query_set_angles = c_gst_navigation_query_set_angles;

/** */
alias gst_navigation_query_set_commands = c_gst_navigation_query_set_commands;

/** */
alias gst_navigation_query_set_commandsv = c_gst_navigation_query_set_commandsv;

/** */
alias gst_navigation_send_command = c_gst_navigation_send_command;

/** */
alias gst_navigation_send_event = c_gst_navigation_send_event;

/** */
alias gst_navigation_send_event_simple = c_gst_navigation_send_event_simple;

/** */
alias gst_navigation_send_key_event = c_gst_navigation_send_key_event;

/** */
alias gst_navigation_send_mouse_event = c_gst_navigation_send_mouse_event;

/** */
alias gst_navigation_send_mouse_scroll_event = c_gst_navigation_send_mouse_scroll_event;

// VideoAFDMeta

/** */
alias gst_video_afd_meta_get_info = c_gst_video_afd_meta_get_info;

// VideoAffineTransformationMeta

/** */
alias gst_video_affine_transformation_meta_apply_matrix = c_gst_video_affine_transformation_meta_apply_matrix;

/** */
alias gst_video_affine_transformation_meta_get_info = c_gst_video_affine_transformation_meta_get_info;

// VideoAggregator

/** */
alias gst_video_aggregator_get_type = c_gst_video_aggregator_get_type;

/** */
alias gst_video_aggregator_get_execution_task_pool = c_gst_video_aggregator_get_execution_task_pool;

// VideoAggregatorConvertPad

/** */
alias gst_video_aggregator_convert_pad_get_type = c_gst_video_aggregator_convert_pad_get_type;

/** */
alias gst_video_aggregator_convert_pad_update_conversion_info = c_gst_video_aggregator_convert_pad_update_conversion_info;

// VideoAggregatorPad

/** */
alias gst_video_aggregator_pad_get_type = c_gst_video_aggregator_pad_get_type;

/** */
alias gst_video_aggregator_pad_get_current_buffer = c_gst_video_aggregator_pad_get_current_buffer;

/** */
alias gst_video_aggregator_pad_get_prepared_frame = c_gst_video_aggregator_pad_get_prepared_frame;

/** */
alias gst_video_aggregator_pad_has_current_buffer = c_gst_video_aggregator_pad_has_current_buffer;

/** */
alias gst_video_aggregator_pad_set_needs_alpha = c_gst_video_aggregator_pad_set_needs_alpha;

// VideoAggregatorParallelConvertPad

/** */
alias gst_video_aggregator_parallel_convert_pad_get_type = c_gst_video_aggregator_parallel_convert_pad_get_type;

// VideoAlignment

/** */
alias gst_video_alignment_reset = c_gst_video_alignment_reset;

// VideoBarMeta

/** */
alias gst_video_bar_meta_get_info = c_gst_video_bar_meta_get_info;

// VideoBufferPool

/** */
alias gst_video_buffer_pool_get_type = c_gst_video_buffer_pool_get_type;

/** */
alias gst_video_buffer_pool_new = c_gst_video_buffer_pool_new;

// VideoCaptionMeta

/** */
alias gst_video_caption_meta_get_info = c_gst_video_caption_meta_get_info;

// VideoChromaResample

/** */
alias gst_video_chroma_resample_free = c_gst_video_chroma_resample_free;

/** */
alias gst_video_chroma_resample_get_info = c_gst_video_chroma_resample_get_info;

/** */
alias gst_video_chroma_resample_new = c_gst_video_chroma_resample_new;

// VideoCodecAlphaMeta

/** */
alias gst_video_codec_alpha_meta_get_info = c_gst_video_codec_alpha_meta_get_info;

// VideoCodecFrame

/** */
alias gst_video_codec_frame_get_type = c_gst_video_codec_frame_get_type;

/** */
alias gst_video_codec_frame_get_user_data = c_gst_video_codec_frame_get_user_data;

/** */
alias gst_video_codec_frame_ref = c_gst_video_codec_frame_ref;

/** */
alias gst_video_codec_frame_set_user_data = c_gst_video_codec_frame_set_user_data;

/** */
alias gst_video_codec_frame_unref = c_gst_video_codec_frame_unref;

// VideoCodecState

/** */
alias gst_video_codec_state_get_type = c_gst_video_codec_state_get_type;

/** */
alias gst_video_codec_state_ref = c_gst_video_codec_state_ref;

/** */
alias gst_video_codec_state_unref = c_gst_video_codec_state_unref;

// VideoColorimetry

/** */
alias gst_video_colorimetry_from_string = c_gst_video_colorimetry_from_string;

/** */
alias gst_video_colorimetry_is_equal = c_gst_video_colorimetry_is_equal;

/** */
alias gst_video_colorimetry_is_equivalent = c_gst_video_colorimetry_is_equivalent;

/** */
alias gst_video_colorimetry_matches = c_gst_video_colorimetry_matches;

/** */
alias gst_video_colorimetry_to_string = c_gst_video_colorimetry_to_string;

// VideoContentLightLevel

/** */
alias gst_video_content_light_level_add_to_caps = c_gst_video_content_light_level_add_to_caps;

/** */
alias gst_video_content_light_level_from_caps = c_gst_video_content_light_level_from_caps;

/** */
alias gst_video_content_light_level_from_string = c_gst_video_content_light_level_from_string;

/** */
alias gst_video_content_light_level_init = c_gst_video_content_light_level_init;

/** */
alias gst_video_content_light_level_is_equal = c_gst_video_content_light_level_is_equal;

/** */
alias gst_video_content_light_level_to_string = c_gst_video_content_light_level_to_string;

// VideoConverter

/** */
alias gst_video_converter_frame = c_gst_video_converter_frame;

/** */
alias gst_video_converter_frame_finish = c_gst_video_converter_frame_finish;

/** */
alias gst_video_converter_free = c_gst_video_converter_free;

/** */
alias gst_video_converter_get_config = c_gst_video_converter_get_config;

/** */
alias gst_video_converter_get_in_info = c_gst_video_converter_get_in_info;

/** */
alias gst_video_converter_get_out_info = c_gst_video_converter_get_out_info;

/** */
alias gst_video_converter_set_config = c_gst_video_converter_set_config;

/** */
alias gst_video_converter_new = c_gst_video_converter_new;

/** */
alias gst_video_converter_new_with_pool = c_gst_video_converter_new_with_pool;

// VideoCropMeta

/** */
alias gst_video_crop_meta_get_info = c_gst_video_crop_meta_get_info;

// VideoDecoder

/** */
alias gst_video_decoder_get_type = c_gst_video_decoder_get_type;

/** */
alias gst_video_decoder_add_to_frame = c_gst_video_decoder_add_to_frame;

/** */
alias gst_video_decoder_allocate_output_buffer = c_gst_video_decoder_allocate_output_buffer;

/** */
alias gst_video_decoder_allocate_output_frame = c_gst_video_decoder_allocate_output_frame;

/** */
alias gst_video_decoder_allocate_output_frame_with_params = c_gst_video_decoder_allocate_output_frame_with_params;

/** */
alias gst_video_decoder_drop_frame = c_gst_video_decoder_drop_frame;

/** */
alias gst_video_decoder_drop_subframe = c_gst_video_decoder_drop_subframe;

/** */
alias gst_video_decoder_finish_frame = c_gst_video_decoder_finish_frame;

/** */
alias gst_video_decoder_finish_subframe = c_gst_video_decoder_finish_subframe;

/** */
alias gst_video_decoder_get_allocator = c_gst_video_decoder_get_allocator;

/** */
alias gst_video_decoder_get_buffer_pool = c_gst_video_decoder_get_buffer_pool;

/** */
alias gst_video_decoder_get_estimate_rate = c_gst_video_decoder_get_estimate_rate;

/** */
alias gst_video_decoder_get_frame = c_gst_video_decoder_get_frame;

/** */
alias gst_video_decoder_get_frames = c_gst_video_decoder_get_frames;

/** */
alias gst_video_decoder_get_input_subframe_index = c_gst_video_decoder_get_input_subframe_index;

/** */
alias gst_video_decoder_get_latency = c_gst_video_decoder_get_latency;

/** */
alias gst_video_decoder_get_max_decode_time = c_gst_video_decoder_get_max_decode_time;

/** */
alias gst_video_decoder_get_max_errors = c_gst_video_decoder_get_max_errors;

/** */
alias gst_video_decoder_get_needs_format = c_gst_video_decoder_get_needs_format;

/** */
alias gst_video_decoder_get_needs_sync_point = c_gst_video_decoder_get_needs_sync_point;

/** */
alias gst_video_decoder_get_oldest_frame = c_gst_video_decoder_get_oldest_frame;

/** */
alias gst_video_decoder_get_output_state = c_gst_video_decoder_get_output_state;

/** */
alias gst_video_decoder_get_packetized = c_gst_video_decoder_get_packetized;

/** */
alias gst_video_decoder_get_pending_frame_size = c_gst_video_decoder_get_pending_frame_size;

/** */
alias gst_video_decoder_get_processed_subframe_index = c_gst_video_decoder_get_processed_subframe_index;

/** */
alias gst_video_decoder_get_qos_proportion = c_gst_video_decoder_get_qos_proportion;

/** */
alias gst_video_decoder_get_subframe_mode = c_gst_video_decoder_get_subframe_mode;

/** */
alias gst_video_decoder_have_frame = c_gst_video_decoder_have_frame;

/** */
alias gst_video_decoder_have_last_subframe = c_gst_video_decoder_have_last_subframe;

/** */
alias gst_video_decoder_merge_tags = c_gst_video_decoder_merge_tags;

/** */
alias gst_video_decoder_negotiate = c_gst_video_decoder_negotiate;

/** */
alias gst_video_decoder_proxy_getcaps = c_gst_video_decoder_proxy_getcaps;

/** */
alias gst_video_decoder_release_frame = c_gst_video_decoder_release_frame;

/** */
alias gst_video_decoder_request_sync_point = c_gst_video_decoder_request_sync_point;

/** */
alias gst_video_decoder_set_estimate_rate = c_gst_video_decoder_set_estimate_rate;

/** */
alias gst_video_decoder_set_interlaced_output_state = c_gst_video_decoder_set_interlaced_output_state;

/** */
alias gst_video_decoder_set_latency = c_gst_video_decoder_set_latency;

/** */
alias gst_video_decoder_set_max_errors = c_gst_video_decoder_set_max_errors;

/** */
alias gst_video_decoder_set_needs_format = c_gst_video_decoder_set_needs_format;

/** */
alias gst_video_decoder_set_needs_sync_point = c_gst_video_decoder_set_needs_sync_point;

/** */
alias gst_video_decoder_set_output_state = c_gst_video_decoder_set_output_state;

/** */
alias gst_video_decoder_set_packetized = c_gst_video_decoder_set_packetized;

/** */
alias gst_video_decoder_set_subframe_mode = c_gst_video_decoder_set_subframe_mode;

/** */
alias gst_video_decoder_set_use_default_pad_acceptcaps = c_gst_video_decoder_set_use_default_pad_acceptcaps;

// VideoDirection

/** */
alias gst_video_direction_get_type = c_gst_video_direction_get_type;

// VideoDither

/** */
alias gst_video_dither_free = c_gst_video_dither_free;

/** */
alias gst_video_dither_line = c_gst_video_dither_line;

/** */
alias gst_video_dither_new = c_gst_video_dither_new;

// VideoEncoder

/** */
alias gst_video_encoder_get_type = c_gst_video_encoder_get_type;

/** */
alias gst_video_encoder_allocate_output_buffer = c_gst_video_encoder_allocate_output_buffer;

/** */
alias gst_video_encoder_allocate_output_frame = c_gst_video_encoder_allocate_output_frame;

/** */
alias gst_video_encoder_finish_frame = c_gst_video_encoder_finish_frame;

/** */
alias gst_video_encoder_finish_subframe = c_gst_video_encoder_finish_subframe;

/** */
alias gst_video_encoder_get_allocator = c_gst_video_encoder_get_allocator;

/** */
alias gst_video_encoder_get_frame = c_gst_video_encoder_get_frame;

/** */
alias gst_video_encoder_get_frames = c_gst_video_encoder_get_frames;

/** */
alias gst_video_encoder_get_latency = c_gst_video_encoder_get_latency;

/** */
alias gst_video_encoder_get_max_encode_time = c_gst_video_encoder_get_max_encode_time;

/** */
alias gst_video_encoder_get_min_force_key_unit_interval = c_gst_video_encoder_get_min_force_key_unit_interval;

/** */
alias gst_video_encoder_get_oldest_frame = c_gst_video_encoder_get_oldest_frame;

/** */
alias gst_video_encoder_get_output_state = c_gst_video_encoder_get_output_state;

/** */
alias gst_video_encoder_is_qos_enabled = c_gst_video_encoder_is_qos_enabled;

/** */
alias gst_video_encoder_merge_tags = c_gst_video_encoder_merge_tags;

/** */
alias gst_video_encoder_negotiate = c_gst_video_encoder_negotiate;

/** */
alias gst_video_encoder_proxy_getcaps = c_gst_video_encoder_proxy_getcaps;

/** */
alias gst_video_encoder_set_headers = c_gst_video_encoder_set_headers;

/** */
alias gst_video_encoder_set_latency = c_gst_video_encoder_set_latency;

/** */
alias gst_video_encoder_set_min_force_key_unit_interval = c_gst_video_encoder_set_min_force_key_unit_interval;

/** */
alias gst_video_encoder_set_min_pts = c_gst_video_encoder_set_min_pts;

/** */
alias gst_video_encoder_set_output_state = c_gst_video_encoder_set_output_state;

/** */
alias gst_video_encoder_set_qos_enabled = c_gst_video_encoder_set_qos_enabled;

// VideoFilter

/** */
alias gst_video_filter_get_type = c_gst_video_filter_get_type;

// VideoFormatInfo

/** */
alias gst_video_format_info_component = c_gst_video_format_info_component;

/** */
alias gst_video_format_info_extrapolate_stride = c_gst_video_format_info_extrapolate_stride;

// VideoFrame

/** */
alias gst_video_frame_copy = c_gst_video_frame_copy;

/** */
alias gst_video_frame_copy_plane = c_gst_video_frame_copy_plane;

/** */
alias gst_video_frame_unmap = c_gst_video_frame_unmap;

/** */
alias gst_video_frame_map = c_gst_video_frame_map;

/** */
alias gst_video_frame_map_id = c_gst_video_frame_map_id;

// VideoGLTextureUploadMeta

/** */
alias gst_video_gl_texture_upload_meta_upload = c_gst_video_gl_texture_upload_meta_upload;

/** */
alias gst_video_gl_texture_upload_meta_get_info = c_gst_video_gl_texture_upload_meta_get_info;

// VideoInfo

/** */
alias gst_video_info_get_type = c_gst_video_info_get_type;

/** */
alias gst_video_info_new = c_gst_video_info_new;

/** */
alias gst_video_info_new_from_caps = c_gst_video_info_new_from_caps;

/** */
alias gst_video_info_align = c_gst_video_info_align;

/** */
alias gst_video_info_align_full = c_gst_video_info_align_full;

/** */
alias gst_video_info_convert = c_gst_video_info_convert;

/** */
alias gst_video_info_copy = c_gst_video_info_copy;

/** */
alias gst_video_info_free = c_gst_video_info_free;

/** */
alias gst_video_info_is_equal = c_gst_video_info_is_equal;

/** */
alias gst_video_info_set_format = c_gst_video_info_set_format;

/** */
alias gst_video_info_set_interlaced_format = c_gst_video_info_set_interlaced_format;

/** */
alias gst_video_info_to_caps = c_gst_video_info_to_caps;

/** */
alias gst_video_info_from_caps = c_gst_video_info_from_caps;

/** */
alias gst_video_info_init = c_gst_video_info_init;

// VideoInfoDmaDrm

/** */
alias gst_video_info_dma_drm_get_type = c_gst_video_info_dma_drm_get_type;

/** */
alias gst_video_info_dma_drm_new = c_gst_video_info_dma_drm_new;

/** */
alias gst_video_info_dma_drm_new_from_caps = c_gst_video_info_dma_drm_new_from_caps;

/** */
alias gst_video_info_dma_drm_free = c_gst_video_info_dma_drm_free;

/** */
alias gst_video_info_dma_drm_to_caps = c_gst_video_info_dma_drm_to_caps;

/** */
alias gst_video_info_dma_drm_to_video_info = c_gst_video_info_dma_drm_to_video_info;

/** */
alias gst_video_info_dma_drm_from_caps = c_gst_video_info_dma_drm_from_caps;

/** */
alias gst_video_info_dma_drm_from_video_info = c_gst_video_info_dma_drm_from_video_info;

/** */
alias gst_video_info_dma_drm_init = c_gst_video_info_dma_drm_init;

// VideoMasteringDisplayInfo

/** */
alias gst_video_mastering_display_info_add_to_caps = c_gst_video_mastering_display_info_add_to_caps;

/** */
alias gst_video_mastering_display_info_from_caps = c_gst_video_mastering_display_info_from_caps;

/** */
alias gst_video_mastering_display_info_init = c_gst_video_mastering_display_info_init;

/** */
alias gst_video_mastering_display_info_is_equal = c_gst_video_mastering_display_info_is_equal;

/** */
alias gst_video_mastering_display_info_to_string = c_gst_video_mastering_display_info_to_string;

/** */
alias gst_video_mastering_display_info_from_string = c_gst_video_mastering_display_info_from_string;

// VideoMeta

/** */
alias gst_video_meta_get_plane_height = c_gst_video_meta_get_plane_height;

/** */
alias gst_video_meta_get_plane_size = c_gst_video_meta_get_plane_size;

/** */
alias gst_video_meta_map = c_gst_video_meta_map;

/** */
alias gst_video_meta_set_alignment = c_gst_video_meta_set_alignment;

/** */
alias gst_video_meta_unmap = c_gst_video_meta_unmap;

/** */
alias gst_video_meta_get_info = c_gst_video_meta_get_info;

// VideoMetaTransform

/** */
alias gst_video_meta_transform_scale_get_quark = c_gst_video_meta_transform_scale_get_quark;

// VideoMultiviewFlagsSet

/** */
alias gst_video_multiview_flagset_get_type = c_gst_video_multiview_flagset_get_type;

// VideoOrientation

/** */
alias gst_video_orientation_get_type = c_gst_video_orientation_get_type;

/** */
alias gst_video_orientation_from_tag = c_gst_video_orientation_from_tag;

/** */
alias gst_video_orientation_get_hcenter = c_gst_video_orientation_get_hcenter;

/** */
alias gst_video_orientation_get_hflip = c_gst_video_orientation_get_hflip;

/** */
alias gst_video_orientation_get_vcenter = c_gst_video_orientation_get_vcenter;

/** */
alias gst_video_orientation_get_vflip = c_gst_video_orientation_get_vflip;

/** */
alias gst_video_orientation_set_hcenter = c_gst_video_orientation_set_hcenter;

/** */
alias gst_video_orientation_set_hflip = c_gst_video_orientation_set_hflip;

/** */
alias gst_video_orientation_set_vcenter = c_gst_video_orientation_set_vcenter;

/** */
alias gst_video_orientation_set_vflip = c_gst_video_orientation_set_vflip;

// VideoOverlay

/** */
alias gst_video_overlay_get_type = c_gst_video_overlay_get_type;

/** */
alias gst_video_overlay_install_properties = c_gst_video_overlay_install_properties;

/** */
alias gst_video_overlay_set_property = c_gst_video_overlay_set_property;

/** */
alias gst_video_overlay_expose = c_gst_video_overlay_expose;

/** */
alias gst_video_overlay_got_window_handle = c_gst_video_overlay_got_window_handle;

/** */
alias gst_video_overlay_handle_events = c_gst_video_overlay_handle_events;

/** */
alias gst_video_overlay_prepare_window_handle = c_gst_video_overlay_prepare_window_handle;

/** */
alias gst_video_overlay_set_render_rectangle = c_gst_video_overlay_set_render_rectangle;

/** */
alias gst_video_overlay_set_window_handle = c_gst_video_overlay_set_window_handle;

// VideoOverlayComposition

/** */
alias gst_video_overlay_composition_get_type = c_gst_video_overlay_composition_get_type;

/** */
alias gst_video_overlay_composition_new = c_gst_video_overlay_composition_new;

/** */
alias gst_video_overlay_composition_add_rectangle = c_gst_video_overlay_composition_add_rectangle;

/** */
alias gst_video_overlay_composition_blend = c_gst_video_overlay_composition_blend;

/** */
alias gst_video_overlay_composition_copy = c_gst_video_overlay_composition_copy;

/** */
alias gst_video_overlay_composition_get_rectangle = c_gst_video_overlay_composition_get_rectangle;

/** */
alias gst_video_overlay_composition_get_seqnum = c_gst_video_overlay_composition_get_seqnum;

/** */
alias gst_video_overlay_composition_make_writable = c_gst_video_overlay_composition_make_writable;

/** */
alias gst_video_overlay_composition_n_rectangles = c_gst_video_overlay_composition_n_rectangles;

// VideoOverlayCompositionMeta

/** */
alias gst_video_overlay_composition_meta_get_info = c_gst_video_overlay_composition_meta_get_info;

// VideoOverlayRectangle

/** */
alias gst_video_overlay_rectangle_get_type = c_gst_video_overlay_rectangle_get_type;

/** */
alias gst_video_overlay_rectangle_new_raw = c_gst_video_overlay_rectangle_new_raw;

/** */
alias gst_video_overlay_rectangle_copy = c_gst_video_overlay_rectangle_copy;

/** */
alias gst_video_overlay_rectangle_get_flags = c_gst_video_overlay_rectangle_get_flags;

/** */
alias gst_video_overlay_rectangle_get_global_alpha = c_gst_video_overlay_rectangle_get_global_alpha;

/** */
alias gst_video_overlay_rectangle_get_pixels_argb = c_gst_video_overlay_rectangle_get_pixels_argb;

/** */
alias gst_video_overlay_rectangle_get_pixels_ayuv = c_gst_video_overlay_rectangle_get_pixels_ayuv;

/** */
alias gst_video_overlay_rectangle_get_pixels_raw = c_gst_video_overlay_rectangle_get_pixels_raw;

/** */
alias gst_video_overlay_rectangle_get_pixels_unscaled_argb = c_gst_video_overlay_rectangle_get_pixels_unscaled_argb;

/** */
alias gst_video_overlay_rectangle_get_pixels_unscaled_ayuv = c_gst_video_overlay_rectangle_get_pixels_unscaled_ayuv;

/** */
alias gst_video_overlay_rectangle_get_pixels_unscaled_raw = c_gst_video_overlay_rectangle_get_pixels_unscaled_raw;

/** */
alias gst_video_overlay_rectangle_get_render_rectangle = c_gst_video_overlay_rectangle_get_render_rectangle;

/** */
alias gst_video_overlay_rectangle_get_seqnum = c_gst_video_overlay_rectangle_get_seqnum;

/** */
alias gst_video_overlay_rectangle_set_global_alpha = c_gst_video_overlay_rectangle_set_global_alpha;

/** */
alias gst_video_overlay_rectangle_set_render_rectangle = c_gst_video_overlay_rectangle_set_render_rectangle;

// VideoRegionOfInterestMeta

/** */
alias gst_video_region_of_interest_meta_add_param = c_gst_video_region_of_interest_meta_add_param;

/** */
alias gst_video_region_of_interest_meta_get_param = c_gst_video_region_of_interest_meta_get_param;

/** */
alias gst_video_region_of_interest_meta_get_info = c_gst_video_region_of_interest_meta_get_info;

// VideoResampler

/** */
alias gst_video_resampler_clear = c_gst_video_resampler_clear;

/** */
alias gst_video_resampler_init = c_gst_video_resampler_init;

// VideoSEIUserDataUnregisteredMeta

/** */
alias gst_video_sei_user_data_unregistered_meta_get_info = c_gst_video_sei_user_data_unregistered_meta_get_info;

// VideoScaler

/** */
alias gst_video_scaler_2d = c_gst_video_scaler_2d;

/** */
alias gst_video_scaler_combine_packed_YUV = c_gst_video_scaler_combine_packed_YUV;

/** */
alias gst_video_scaler_free = c_gst_video_scaler_free;

/** */
alias gst_video_scaler_get_coeff = c_gst_video_scaler_get_coeff;

/** */
alias gst_video_scaler_get_max_taps = c_gst_video_scaler_get_max_taps;

/** */
alias gst_video_scaler_horizontal = c_gst_video_scaler_horizontal;

/** */
alias gst_video_scaler_vertical = c_gst_video_scaler_vertical;

/** */
alias gst_video_scaler_new = c_gst_video_scaler_new;

// VideoSink

/** */
alias gst_video_sink_get_type = c_gst_video_sink_get_type;

/** */
alias gst_video_sink_center_rect = c_gst_video_sink_center_rect;

// VideoTimeCode

/** */
alias gst_video_time_code_get_type = c_gst_video_time_code_get_type;

/** */
alias gst_video_time_code_new = c_gst_video_time_code_new;

/** */
alias gst_video_time_code_new_empty = c_gst_video_time_code_new_empty;

/** */
alias gst_video_time_code_new_from_date_time = c_gst_video_time_code_new_from_date_time;

/** */
alias gst_video_time_code_new_from_date_time_full = c_gst_video_time_code_new_from_date_time_full;

/** */
alias gst_video_time_code_new_from_string = c_gst_video_time_code_new_from_string;

/** */
alias gst_video_time_code_add_frames = c_gst_video_time_code_add_frames;

/** */
alias gst_video_time_code_add_interval = c_gst_video_time_code_add_interval;

/** */
alias gst_video_time_code_clear = c_gst_video_time_code_clear;

/** */
alias gst_video_time_code_compare = c_gst_video_time_code_compare;

/** */
alias gst_video_time_code_copy = c_gst_video_time_code_copy;

/** */
alias gst_video_time_code_frames_since_daily_jam = c_gst_video_time_code_frames_since_daily_jam;

/** */
alias gst_video_time_code_free = c_gst_video_time_code_free;

/** */
alias gst_video_time_code_increment_frame = c_gst_video_time_code_increment_frame;

/** */
alias gst_video_time_code_init = c_gst_video_time_code_init;

/** */
alias gst_video_time_code_init_from_date_time = c_gst_video_time_code_init_from_date_time;

/** */
alias gst_video_time_code_init_from_date_time_full = c_gst_video_time_code_init_from_date_time_full;

/** */
alias gst_video_time_code_is_valid = c_gst_video_time_code_is_valid;

/** */
alias gst_video_time_code_nsec_since_daily_jam = c_gst_video_time_code_nsec_since_daily_jam;

/** */
alias gst_video_time_code_to_date_time = c_gst_video_time_code_to_date_time;

/** */
alias gst_video_time_code_to_string = c_gst_video_time_code_to_string;

// VideoTimeCodeInterval

/** */
alias gst_video_time_code_interval_get_type = c_gst_video_time_code_interval_get_type;

/** */
alias gst_video_time_code_interval_new = c_gst_video_time_code_interval_new;

/** */
alias gst_video_time_code_interval_new_from_string = c_gst_video_time_code_interval_new_from_string;

/** */
alias gst_video_time_code_interval_clear = c_gst_video_time_code_interval_clear;

/** */
alias gst_video_time_code_interval_copy = c_gst_video_time_code_interval_copy;

/** */
alias gst_video_time_code_interval_free = c_gst_video_time_code_interval_free;

/** */
alias gst_video_time_code_interval_init = c_gst_video_time_code_interval_init;

// VideoTimeCodeMeta

/** */
alias gst_video_time_code_meta_get_info = c_gst_video_time_code_meta_get_info;

// VideoVBIEncoder

/** */
alias gst_video_vbi_encoder_get_type = c_gst_video_vbi_encoder_get_type;

/** */
alias gst_video_vbi_encoder_new = c_gst_video_vbi_encoder_new;

/** */
alias gst_video_vbi_encoder_add_ancillary = c_gst_video_vbi_encoder_add_ancillary;

/** */
alias gst_video_vbi_encoder_copy = c_gst_video_vbi_encoder_copy;

/** */
alias gst_video_vbi_encoder_free = c_gst_video_vbi_encoder_free;

/** */
alias gst_video_vbi_encoder_write_line = c_gst_video_vbi_encoder_write_line;

// VideoVBIParser

/** */
alias gst_video_vbi_parser_get_type = c_gst_video_vbi_parser_get_type;

/** */
alias gst_video_vbi_parser_new = c_gst_video_vbi_parser_new;

/** */
alias gst_video_vbi_parser_add_line = c_gst_video_vbi_parser_add_line;

/** */
alias gst_video_vbi_parser_copy = c_gst_video_vbi_parser_copy;

/** */
alias gst_video_vbi_parser_free = c_gst_video_vbi_parser_free;

/** */
alias gst_video_vbi_parser_get_ancillary = c_gst_video_vbi_parser_get_ancillary;

// global

/** */
alias gst_ancillary_meta_api_get_type = c_gst_ancillary_meta_api_get_type;

/** */
alias gst_buffer_add_ancillary_meta = c_gst_buffer_add_ancillary_meta;

/** */
alias gst_buffer_add_video_afd_meta = c_gst_buffer_add_video_afd_meta;

/** */
alias gst_buffer_add_video_affine_transformation_meta = c_gst_buffer_add_video_affine_transformation_meta;

/** */
alias gst_buffer_add_video_bar_meta = c_gst_buffer_add_video_bar_meta;

/** */
alias gst_buffer_add_video_caption_meta = c_gst_buffer_add_video_caption_meta;

/** */
alias gst_buffer_add_video_codec_alpha_meta = c_gst_buffer_add_video_codec_alpha_meta;

/** */
alias gst_buffer_add_video_gl_texture_upload_meta = c_gst_buffer_add_video_gl_texture_upload_meta;

/** */
alias gst_buffer_add_video_meta = c_gst_buffer_add_video_meta;

/** */
alias gst_buffer_add_video_meta_full = c_gst_buffer_add_video_meta_full;

/** */
alias gst_buffer_add_video_overlay_composition_meta = c_gst_buffer_add_video_overlay_composition_meta;

/** */
alias gst_buffer_add_video_region_of_interest_meta = c_gst_buffer_add_video_region_of_interest_meta;

/** */
alias gst_buffer_add_video_region_of_interest_meta_id = c_gst_buffer_add_video_region_of_interest_meta_id;

/** */
alias gst_buffer_add_video_sei_user_data_unregistered_meta = c_gst_buffer_add_video_sei_user_data_unregistered_meta;

/** */
alias gst_buffer_add_video_time_code_meta = c_gst_buffer_add_video_time_code_meta;

/** */
alias gst_buffer_add_video_time_code_meta_full = c_gst_buffer_add_video_time_code_meta_full;

/** */
alias gst_buffer_get_video_meta = c_gst_buffer_get_video_meta;

/** */
alias gst_buffer_get_video_meta_id = c_gst_buffer_get_video_meta_id;

/** */
alias gst_buffer_get_video_region_of_interest_meta_id = c_gst_buffer_get_video_region_of_interest_meta_id;

/** */
alias gst_buffer_pool_config_get_video_alignment = c_gst_buffer_pool_config_get_video_alignment;

/** */
alias gst_buffer_pool_config_set_video_alignment = c_gst_buffer_pool_config_set_video_alignment;

/** */
alias gst_is_video_overlay_prepare_window_handle_message = c_gst_is_video_overlay_prepare_window_handle_message;

/** */
alias gst_video_afd_meta_api_get_type = c_gst_video_afd_meta_api_get_type;

/** */
alias gst_video_affine_transformation_meta_api_get_type = c_gst_video_affine_transformation_meta_api_get_type;

/** */
alias gst_video_bar_meta_api_get_type = c_gst_video_bar_meta_api_get_type;

/** */
alias gst_video_blend = c_gst_video_blend;

/** */
alias gst_video_blend_scale_linear_RGBA = c_gst_video_blend_scale_linear_RGBA;

/** */
alias gst_video_calculate_display_ratio = c_gst_video_calculate_display_ratio;

/** */
alias gst_video_caption_meta_api_get_type = c_gst_video_caption_meta_api_get_type;

/** */
alias gst_video_center_rect = c_gst_video_center_rect;

/** */
alias gst_video_chroma_from_string = c_gst_video_chroma_from_string;

/** */
alias gst_video_chroma_resample = c_gst_video_chroma_resample;

/** */
alias gst_video_chroma_to_string = c_gst_video_chroma_to_string;

/** */
alias gst_video_codec_alpha_meta_api_get_type = c_gst_video_codec_alpha_meta_api_get_type;

/** */
alias gst_video_color_transfer_decode = c_gst_video_color_transfer_decode;

/** */
alias gst_video_color_transfer_encode = c_gst_video_color_transfer_encode;

/** */
alias gst_video_convert_sample = c_gst_video_convert_sample;

/** */
alias gst_video_convert_sample_async = c_gst_video_convert_sample_async;

/** */
alias gst_video_crop_meta_api_get_type = c_gst_video_crop_meta_api_get_type;

/** */
alias gst_video_dma_drm_fourcc_from_format = c_gst_video_dma_drm_fourcc_from_format;

/** */
alias gst_video_dma_drm_fourcc_from_string = c_gst_video_dma_drm_fourcc_from_string;

/** */
alias gst_video_dma_drm_fourcc_to_format = c_gst_video_dma_drm_fourcc_to_format;

/** */
alias gst_video_dma_drm_fourcc_to_string = c_gst_video_dma_drm_fourcc_to_string;

/** */
alias gst_video_event_is_force_key_unit = c_gst_video_event_is_force_key_unit;

/** */
alias gst_video_event_new_downstream_force_key_unit = c_gst_video_event_new_downstream_force_key_unit;

/** */
alias gst_video_event_new_still_frame = c_gst_video_event_new_still_frame;

/** */
alias gst_video_event_new_upstream_force_key_unit = c_gst_video_event_new_upstream_force_key_unit;

/** */
alias gst_video_event_parse_downstream_force_key_unit = c_gst_video_event_parse_downstream_force_key_unit;

/** */
alias gst_video_event_parse_still_frame = c_gst_video_event_parse_still_frame;

/** */
alias gst_video_event_parse_upstream_force_key_unit = c_gst_video_event_parse_upstream_force_key_unit;

/** */
alias gst_video_formats_any = c_gst_video_formats_any;

/** */
alias gst_video_formats_raw = c_gst_video_formats_raw;

/** */
alias gst_video_gl_texture_upload_meta_api_get_type = c_gst_video_gl_texture_upload_meta_api_get_type;

/** */
alias gst_video_guess_framerate = c_gst_video_guess_framerate;

/** */
alias gst_video_is_common_aspect_ratio = c_gst_video_is_common_aspect_ratio;

/** */
alias gst_video_is_dma_drm_caps = c_gst_video_is_dma_drm_caps;

/** */
alias gst_video_make_raw_caps = c_gst_video_make_raw_caps;

/** */
alias gst_video_make_raw_caps_with_features = c_gst_video_make_raw_caps_with_features;

/** */
alias gst_video_meta_api_get_type = c_gst_video_meta_api_get_type;

/** */
alias gst_video_multiview_get_doubled_height_modes = c_gst_video_multiview_get_doubled_height_modes;

/** */
alias gst_video_multiview_get_doubled_size_modes = c_gst_video_multiview_get_doubled_size_modes;

/** */
alias gst_video_multiview_get_doubled_width_modes = c_gst_video_multiview_get_doubled_width_modes;

/** */
alias gst_video_multiview_get_mono_modes = c_gst_video_multiview_get_mono_modes;

/** */
alias gst_video_multiview_get_unpacked_modes = c_gst_video_multiview_get_unpacked_modes;

/** */
alias gst_video_multiview_guess_half_aspect = c_gst_video_multiview_guess_half_aspect;

/** */
alias gst_video_multiview_video_info_change_mode = c_gst_video_multiview_video_info_change_mode;

/** */
alias gst_video_overlay_composition_meta_api_get_type = c_gst_video_overlay_composition_meta_api_get_type;

/** */
alias gst_video_region_of_interest_meta_api_get_type = c_gst_video_region_of_interest_meta_api_get_type;

/** */
alias gst_video_sei_user_data_unregistered_meta_api_get_type = c_gst_video_sei_user_data_unregistered_meta_api_get_type;

/** */
alias gst_video_sei_user_data_unregistered_parse_precision_time_stamp = c_gst_video_sei_user_data_unregistered_parse_precision_time_stamp;

/** */
alias gst_video_tile_get_index = c_gst_video_tile_get_index;

/** */
alias gst_video_time_code_meta_api_get_type = c_gst_video_time_code_meta_api_get_type;

shared static this()
{
  // AncillaryMeta
  gidLink(cast(void**)&gst_ancillary_meta_get_info, "gst_ancillary_meta_get_info", LIBS);

  // ColorBalance
  gidLink(cast(void**)&gst_color_balance_get_type, "gst_color_balance_get_type", LIBS);
  gidLink(cast(void**)&gst_color_balance_get_balance_type, "gst_color_balance_get_balance_type", LIBS);
  gidLink(cast(void**)&gst_color_balance_get_value, "gst_color_balance_get_value", LIBS);
  gidLink(cast(void**)&gst_color_balance_list_channels, "gst_color_balance_list_channels", LIBS);
  gidLink(cast(void**)&gst_color_balance_set_value, "gst_color_balance_set_value", LIBS);
  gidLink(cast(void**)&gst_color_balance_value_changed, "gst_color_balance_value_changed", LIBS);

  // ColorBalanceChannel
  gidLink(cast(void**)&gst_color_balance_channel_get_type, "gst_color_balance_channel_get_type", LIBS);

  // Navigation
  gidLink(cast(void**)&gst_navigation_get_type, "gst_navigation_get_type", LIBS);
  gidLink(cast(void**)&gst_navigation_event_get_coordinates, "gst_navigation_event_get_coordinates", LIBS);
  gidLink(cast(void**)&gst_navigation_event_get_type, "gst_navigation_event_get_type", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_command, "gst_navigation_event_new_command", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_key_press, "gst_navigation_event_new_key_press", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_key_release, "gst_navigation_event_new_key_release", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_mouse_button_press, "gst_navigation_event_new_mouse_button_press", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_mouse_button_release, "gst_navigation_event_new_mouse_button_release", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_mouse_move, "gst_navigation_event_new_mouse_move", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_mouse_scroll, "gst_navigation_event_new_mouse_scroll", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_touch_cancel, "gst_navigation_event_new_touch_cancel", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_touch_down, "gst_navigation_event_new_touch_down", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_touch_frame, "gst_navigation_event_new_touch_frame", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_touch_motion, "gst_navigation_event_new_touch_motion", LIBS);
  gidLink(cast(void**)&gst_navigation_event_new_touch_up, "gst_navigation_event_new_touch_up", LIBS);
  gidLink(cast(void**)&gst_navigation_event_parse_command, "gst_navigation_event_parse_command", LIBS);
  gidLink(cast(void**)&gst_navigation_event_parse_key_event, "gst_navigation_event_parse_key_event", LIBS);
  gidLink(cast(void**)&gst_navigation_event_parse_modifier_state, "gst_navigation_event_parse_modifier_state", LIBS);
  gidLink(cast(void**)&gst_navigation_event_parse_mouse_button_event, "gst_navigation_event_parse_mouse_button_event", LIBS);
  gidLink(cast(void**)&gst_navigation_event_parse_mouse_move_event, "gst_navigation_event_parse_mouse_move_event", LIBS);
  gidLink(cast(void**)&gst_navigation_event_parse_mouse_scroll_event, "gst_navigation_event_parse_mouse_scroll_event", LIBS);
  gidLink(cast(void**)&gst_navigation_event_parse_touch_event, "gst_navigation_event_parse_touch_event", LIBS);
  gidLink(cast(void**)&gst_navigation_event_parse_touch_up_event, "gst_navigation_event_parse_touch_up_event", LIBS);
  gidLink(cast(void**)&gst_navigation_event_set_coordinates, "gst_navigation_event_set_coordinates", LIBS);
  gidLink(cast(void**)&gst_navigation_message_get_type, "gst_navigation_message_get_type", LIBS);
  gidLink(cast(void**)&gst_navigation_message_new_angles_changed, "gst_navigation_message_new_angles_changed", LIBS);
  gidLink(cast(void**)&gst_navigation_message_new_commands_changed, "gst_navigation_message_new_commands_changed", LIBS);
  gidLink(cast(void**)&gst_navigation_message_new_event, "gst_navigation_message_new_event", LIBS);
  gidLink(cast(void**)&gst_navigation_message_new_mouse_over, "gst_navigation_message_new_mouse_over", LIBS);
  gidLink(cast(void**)&gst_navigation_message_parse_angles_changed, "gst_navigation_message_parse_angles_changed", LIBS);
  gidLink(cast(void**)&gst_navigation_message_parse_event, "gst_navigation_message_parse_event", LIBS);
  gidLink(cast(void**)&gst_navigation_message_parse_mouse_over, "gst_navigation_message_parse_mouse_over", LIBS);
  gidLink(cast(void**)&gst_navigation_query_get_type, "gst_navigation_query_get_type", LIBS);
  gidLink(cast(void**)&gst_navigation_query_new_angles, "gst_navigation_query_new_angles", LIBS);
  gidLink(cast(void**)&gst_navigation_query_new_commands, "gst_navigation_query_new_commands", LIBS);
  gidLink(cast(void**)&gst_navigation_query_parse_angles, "gst_navigation_query_parse_angles", LIBS);
  gidLink(cast(void**)&gst_navigation_query_parse_commands_length, "gst_navigation_query_parse_commands_length", LIBS);
  gidLink(cast(void**)&gst_navigation_query_parse_commands_nth, "gst_navigation_query_parse_commands_nth", LIBS);
  gidLink(cast(void**)&gst_navigation_query_set_angles, "gst_navigation_query_set_angles", LIBS);
  gidLink(cast(void**)&gst_navigation_query_set_commands, "gst_navigation_query_set_commands", LIBS);
  gidLink(cast(void**)&gst_navigation_query_set_commandsv, "gst_navigation_query_set_commandsv", LIBS);
  gidLink(cast(void**)&gst_navigation_send_command, "gst_navigation_send_command", LIBS);
  gidLink(cast(void**)&gst_navigation_send_event, "gst_navigation_send_event", LIBS);
  gidLink(cast(void**)&gst_navigation_send_event_simple, "gst_navigation_send_event_simple", LIBS);
  gidLink(cast(void**)&gst_navigation_send_key_event, "gst_navigation_send_key_event", LIBS);
  gidLink(cast(void**)&gst_navigation_send_mouse_event, "gst_navigation_send_mouse_event", LIBS);
  gidLink(cast(void**)&gst_navigation_send_mouse_scroll_event, "gst_navigation_send_mouse_scroll_event", LIBS);

  // VideoAFDMeta
  gidLink(cast(void**)&gst_video_afd_meta_get_info, "gst_video_afd_meta_get_info", LIBS);

  // VideoAffineTransformationMeta
  gidLink(cast(void**)&gst_video_affine_transformation_meta_apply_matrix, "gst_video_affine_transformation_meta_apply_matrix", LIBS);
  gidLink(cast(void**)&gst_video_affine_transformation_meta_get_info, "gst_video_affine_transformation_meta_get_info", LIBS);

  // VideoAggregator
  gidLink(cast(void**)&gst_video_aggregator_get_type, "gst_video_aggregator_get_type", LIBS);
  gidLink(cast(void**)&gst_video_aggregator_get_execution_task_pool, "gst_video_aggregator_get_execution_task_pool", LIBS);

  // VideoAggregatorConvertPad
  gidLink(cast(void**)&gst_video_aggregator_convert_pad_get_type, "gst_video_aggregator_convert_pad_get_type", LIBS);
  gidLink(cast(void**)&gst_video_aggregator_convert_pad_update_conversion_info, "gst_video_aggregator_convert_pad_update_conversion_info", LIBS);

  // VideoAggregatorPad
  gidLink(cast(void**)&gst_video_aggregator_pad_get_type, "gst_video_aggregator_pad_get_type", LIBS);
  gidLink(cast(void**)&gst_video_aggregator_pad_get_current_buffer, "gst_video_aggregator_pad_get_current_buffer", LIBS);
  gidLink(cast(void**)&gst_video_aggregator_pad_get_prepared_frame, "gst_video_aggregator_pad_get_prepared_frame", LIBS);
  gidLink(cast(void**)&gst_video_aggregator_pad_has_current_buffer, "gst_video_aggregator_pad_has_current_buffer", LIBS);
  gidLink(cast(void**)&gst_video_aggregator_pad_set_needs_alpha, "gst_video_aggregator_pad_set_needs_alpha", LIBS);

  // VideoAggregatorParallelConvertPad
  gidLink(cast(void**)&gst_video_aggregator_parallel_convert_pad_get_type, "gst_video_aggregator_parallel_convert_pad_get_type", LIBS);

  // VideoAlignment
  gidLink(cast(void**)&gst_video_alignment_reset, "gst_video_alignment_reset", LIBS);

  // VideoBarMeta
  gidLink(cast(void**)&gst_video_bar_meta_get_info, "gst_video_bar_meta_get_info", LIBS);

  // VideoBufferPool
  gidLink(cast(void**)&gst_video_buffer_pool_get_type, "gst_video_buffer_pool_get_type", LIBS);
  gidLink(cast(void**)&gst_video_buffer_pool_new, "gst_video_buffer_pool_new", LIBS);

  // VideoCaptionMeta
  gidLink(cast(void**)&gst_video_caption_meta_get_info, "gst_video_caption_meta_get_info", LIBS);

  // VideoChromaResample
  gidLink(cast(void**)&gst_video_chroma_resample_free, "gst_video_chroma_resample_free", LIBS);
  gidLink(cast(void**)&gst_video_chroma_resample_get_info, "gst_video_chroma_resample_get_info", LIBS);
  gidLink(cast(void**)&gst_video_chroma_resample_new, "gst_video_chroma_resample_new", LIBS);

  // VideoCodecAlphaMeta
  gidLink(cast(void**)&gst_video_codec_alpha_meta_get_info, "gst_video_codec_alpha_meta_get_info", LIBS);

  // VideoCodecFrame
  gidLink(cast(void**)&gst_video_codec_frame_get_type, "gst_video_codec_frame_get_type", LIBS);
  gidLink(cast(void**)&gst_video_codec_frame_get_user_data, "gst_video_codec_frame_get_user_data", LIBS);
  gidLink(cast(void**)&gst_video_codec_frame_ref, "gst_video_codec_frame_ref", LIBS);
  gidLink(cast(void**)&gst_video_codec_frame_set_user_data, "gst_video_codec_frame_set_user_data", LIBS);
  gidLink(cast(void**)&gst_video_codec_frame_unref, "gst_video_codec_frame_unref", LIBS);

  // VideoCodecState
  gidLink(cast(void**)&gst_video_codec_state_get_type, "gst_video_codec_state_get_type", LIBS);
  gidLink(cast(void**)&gst_video_codec_state_ref, "gst_video_codec_state_ref", LIBS);
  gidLink(cast(void**)&gst_video_codec_state_unref, "gst_video_codec_state_unref", LIBS);

  // VideoColorimetry
  gidLink(cast(void**)&gst_video_colorimetry_from_string, "gst_video_colorimetry_from_string", LIBS);
  gidLink(cast(void**)&gst_video_colorimetry_is_equal, "gst_video_colorimetry_is_equal", LIBS);
  gidLink(cast(void**)&gst_video_colorimetry_is_equivalent, "gst_video_colorimetry_is_equivalent", LIBS);
  gidLink(cast(void**)&gst_video_colorimetry_matches, "gst_video_colorimetry_matches", LIBS);
  gidLink(cast(void**)&gst_video_colorimetry_to_string, "gst_video_colorimetry_to_string", LIBS);

  // VideoContentLightLevel
  gidLink(cast(void**)&gst_video_content_light_level_add_to_caps, "gst_video_content_light_level_add_to_caps", LIBS);
  gidLink(cast(void**)&gst_video_content_light_level_from_caps, "gst_video_content_light_level_from_caps", LIBS);
  gidLink(cast(void**)&gst_video_content_light_level_from_string, "gst_video_content_light_level_from_string", LIBS);
  gidLink(cast(void**)&gst_video_content_light_level_init, "gst_video_content_light_level_init", LIBS);
  gidLink(cast(void**)&gst_video_content_light_level_is_equal, "gst_video_content_light_level_is_equal", LIBS);
  gidLink(cast(void**)&gst_video_content_light_level_to_string, "gst_video_content_light_level_to_string", LIBS);

  // VideoConverter
  gidLink(cast(void**)&gst_video_converter_frame, "gst_video_converter_frame", LIBS);
  gidLink(cast(void**)&gst_video_converter_frame_finish, "gst_video_converter_frame_finish", LIBS);
  gidLink(cast(void**)&gst_video_converter_free, "gst_video_converter_free", LIBS);
  gidLink(cast(void**)&gst_video_converter_get_config, "gst_video_converter_get_config", LIBS);
  gidLink(cast(void**)&gst_video_converter_get_in_info, "gst_video_converter_get_in_info", LIBS);
  gidLink(cast(void**)&gst_video_converter_get_out_info, "gst_video_converter_get_out_info", LIBS);
  gidLink(cast(void**)&gst_video_converter_set_config, "gst_video_converter_set_config", LIBS);
  gidLink(cast(void**)&gst_video_converter_new, "gst_video_converter_new", LIBS);
  gidLink(cast(void**)&gst_video_converter_new_with_pool, "gst_video_converter_new_with_pool", LIBS);

  // VideoCropMeta
  gidLink(cast(void**)&gst_video_crop_meta_get_info, "gst_video_crop_meta_get_info", LIBS);

  // VideoDecoder
  gidLink(cast(void**)&gst_video_decoder_get_type, "gst_video_decoder_get_type", LIBS);
  gidLink(cast(void**)&gst_video_decoder_add_to_frame, "gst_video_decoder_add_to_frame", LIBS);
  gidLink(cast(void**)&gst_video_decoder_allocate_output_buffer, "gst_video_decoder_allocate_output_buffer", LIBS);
  gidLink(cast(void**)&gst_video_decoder_allocate_output_frame, "gst_video_decoder_allocate_output_frame", LIBS);
  gidLink(cast(void**)&gst_video_decoder_allocate_output_frame_with_params, "gst_video_decoder_allocate_output_frame_with_params", LIBS);
  gidLink(cast(void**)&gst_video_decoder_drop_frame, "gst_video_decoder_drop_frame", LIBS);
  gidLink(cast(void**)&gst_video_decoder_drop_subframe, "gst_video_decoder_drop_subframe", LIBS);
  gidLink(cast(void**)&gst_video_decoder_finish_frame, "gst_video_decoder_finish_frame", LIBS);
  gidLink(cast(void**)&gst_video_decoder_finish_subframe, "gst_video_decoder_finish_subframe", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_allocator, "gst_video_decoder_get_allocator", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_buffer_pool, "gst_video_decoder_get_buffer_pool", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_estimate_rate, "gst_video_decoder_get_estimate_rate", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_frame, "gst_video_decoder_get_frame", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_frames, "gst_video_decoder_get_frames", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_input_subframe_index, "gst_video_decoder_get_input_subframe_index", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_latency, "gst_video_decoder_get_latency", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_max_decode_time, "gst_video_decoder_get_max_decode_time", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_max_errors, "gst_video_decoder_get_max_errors", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_needs_format, "gst_video_decoder_get_needs_format", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_needs_sync_point, "gst_video_decoder_get_needs_sync_point", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_oldest_frame, "gst_video_decoder_get_oldest_frame", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_output_state, "gst_video_decoder_get_output_state", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_packetized, "gst_video_decoder_get_packetized", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_pending_frame_size, "gst_video_decoder_get_pending_frame_size", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_processed_subframe_index, "gst_video_decoder_get_processed_subframe_index", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_qos_proportion, "gst_video_decoder_get_qos_proportion", LIBS);
  gidLink(cast(void**)&gst_video_decoder_get_subframe_mode, "gst_video_decoder_get_subframe_mode", LIBS);
  gidLink(cast(void**)&gst_video_decoder_have_frame, "gst_video_decoder_have_frame", LIBS);
  gidLink(cast(void**)&gst_video_decoder_have_last_subframe, "gst_video_decoder_have_last_subframe", LIBS);
  gidLink(cast(void**)&gst_video_decoder_merge_tags, "gst_video_decoder_merge_tags", LIBS);
  gidLink(cast(void**)&gst_video_decoder_negotiate, "gst_video_decoder_negotiate", LIBS);
  gidLink(cast(void**)&gst_video_decoder_proxy_getcaps, "gst_video_decoder_proxy_getcaps", LIBS);
  gidLink(cast(void**)&gst_video_decoder_release_frame, "gst_video_decoder_release_frame", LIBS);
  gidLink(cast(void**)&gst_video_decoder_request_sync_point, "gst_video_decoder_request_sync_point", LIBS);
  gidLink(cast(void**)&gst_video_decoder_set_estimate_rate, "gst_video_decoder_set_estimate_rate", LIBS);
  gidLink(cast(void**)&gst_video_decoder_set_interlaced_output_state, "gst_video_decoder_set_interlaced_output_state", LIBS);
  gidLink(cast(void**)&gst_video_decoder_set_latency, "gst_video_decoder_set_latency", LIBS);
  gidLink(cast(void**)&gst_video_decoder_set_max_errors, "gst_video_decoder_set_max_errors", LIBS);
  gidLink(cast(void**)&gst_video_decoder_set_needs_format, "gst_video_decoder_set_needs_format", LIBS);
  gidLink(cast(void**)&gst_video_decoder_set_needs_sync_point, "gst_video_decoder_set_needs_sync_point", LIBS);
  gidLink(cast(void**)&gst_video_decoder_set_output_state, "gst_video_decoder_set_output_state", LIBS);
  gidLink(cast(void**)&gst_video_decoder_set_packetized, "gst_video_decoder_set_packetized", LIBS);
  gidLink(cast(void**)&gst_video_decoder_set_subframe_mode, "gst_video_decoder_set_subframe_mode", LIBS);
  gidLink(cast(void**)&gst_video_decoder_set_use_default_pad_acceptcaps, "gst_video_decoder_set_use_default_pad_acceptcaps", LIBS);

  // VideoDirection
  gidLink(cast(void**)&gst_video_direction_get_type, "gst_video_direction_get_type", LIBS);

  // VideoDither
  gidLink(cast(void**)&gst_video_dither_free, "gst_video_dither_free", LIBS);
  gidLink(cast(void**)&gst_video_dither_line, "gst_video_dither_line", LIBS);
  gidLink(cast(void**)&gst_video_dither_new, "gst_video_dither_new", LIBS);

  // VideoEncoder
  gidLink(cast(void**)&gst_video_encoder_get_type, "gst_video_encoder_get_type", LIBS);
  gidLink(cast(void**)&gst_video_encoder_allocate_output_buffer, "gst_video_encoder_allocate_output_buffer", LIBS);
  gidLink(cast(void**)&gst_video_encoder_allocate_output_frame, "gst_video_encoder_allocate_output_frame", LIBS);
  gidLink(cast(void**)&gst_video_encoder_finish_frame, "gst_video_encoder_finish_frame", LIBS);
  gidLink(cast(void**)&gst_video_encoder_finish_subframe, "gst_video_encoder_finish_subframe", LIBS);
  gidLink(cast(void**)&gst_video_encoder_get_allocator, "gst_video_encoder_get_allocator", LIBS);
  gidLink(cast(void**)&gst_video_encoder_get_frame, "gst_video_encoder_get_frame", LIBS);
  gidLink(cast(void**)&gst_video_encoder_get_frames, "gst_video_encoder_get_frames", LIBS);
  gidLink(cast(void**)&gst_video_encoder_get_latency, "gst_video_encoder_get_latency", LIBS);
  gidLink(cast(void**)&gst_video_encoder_get_max_encode_time, "gst_video_encoder_get_max_encode_time", LIBS);
  gidLink(cast(void**)&gst_video_encoder_get_min_force_key_unit_interval, "gst_video_encoder_get_min_force_key_unit_interval", LIBS);
  gidLink(cast(void**)&gst_video_encoder_get_oldest_frame, "gst_video_encoder_get_oldest_frame", LIBS);
  gidLink(cast(void**)&gst_video_encoder_get_output_state, "gst_video_encoder_get_output_state", LIBS);
  gidLink(cast(void**)&gst_video_encoder_is_qos_enabled, "gst_video_encoder_is_qos_enabled", LIBS);
  gidLink(cast(void**)&gst_video_encoder_merge_tags, "gst_video_encoder_merge_tags", LIBS);
  gidLink(cast(void**)&gst_video_encoder_negotiate, "gst_video_encoder_negotiate", LIBS);
  gidLink(cast(void**)&gst_video_encoder_proxy_getcaps, "gst_video_encoder_proxy_getcaps", LIBS);
  gidLink(cast(void**)&gst_video_encoder_set_headers, "gst_video_encoder_set_headers", LIBS);
  gidLink(cast(void**)&gst_video_encoder_set_latency, "gst_video_encoder_set_latency", LIBS);
  gidLink(cast(void**)&gst_video_encoder_set_min_force_key_unit_interval, "gst_video_encoder_set_min_force_key_unit_interval", LIBS);
  gidLink(cast(void**)&gst_video_encoder_set_min_pts, "gst_video_encoder_set_min_pts", LIBS);
  gidLink(cast(void**)&gst_video_encoder_set_output_state, "gst_video_encoder_set_output_state", LIBS);
  gidLink(cast(void**)&gst_video_encoder_set_qos_enabled, "gst_video_encoder_set_qos_enabled", LIBS);

  // VideoFilter
  gidLink(cast(void**)&gst_video_filter_get_type, "gst_video_filter_get_type", LIBS);

  // VideoFormatInfo
  gidLink(cast(void**)&gst_video_format_info_component, "gst_video_format_info_component", LIBS);
  gidLink(cast(void**)&gst_video_format_info_extrapolate_stride, "gst_video_format_info_extrapolate_stride", LIBS);

  // VideoFrame
  gidLink(cast(void**)&gst_video_frame_copy, "gst_video_frame_copy", LIBS);
  gidLink(cast(void**)&gst_video_frame_copy_plane, "gst_video_frame_copy_plane", LIBS);
  gidLink(cast(void**)&gst_video_frame_unmap, "gst_video_frame_unmap", LIBS);
  gidLink(cast(void**)&gst_video_frame_map, "gst_video_frame_map", LIBS);
  gidLink(cast(void**)&gst_video_frame_map_id, "gst_video_frame_map_id", LIBS);

  // VideoGLTextureUploadMeta
  gidLink(cast(void**)&gst_video_gl_texture_upload_meta_upload, "gst_video_gl_texture_upload_meta_upload", LIBS);
  gidLink(cast(void**)&gst_video_gl_texture_upload_meta_get_info, "gst_video_gl_texture_upload_meta_get_info", LIBS);

  // VideoInfo
  gidLink(cast(void**)&gst_video_info_get_type, "gst_video_info_get_type", LIBS);
  gidLink(cast(void**)&gst_video_info_new, "gst_video_info_new", LIBS);
  gidLink(cast(void**)&gst_video_info_new_from_caps, "gst_video_info_new_from_caps", LIBS);
  gidLink(cast(void**)&gst_video_info_align, "gst_video_info_align", LIBS);
  gidLink(cast(void**)&gst_video_info_align_full, "gst_video_info_align_full", LIBS);
  gidLink(cast(void**)&gst_video_info_convert, "gst_video_info_convert", LIBS);
  gidLink(cast(void**)&gst_video_info_copy, "gst_video_info_copy", LIBS);
  gidLink(cast(void**)&gst_video_info_free, "gst_video_info_free", LIBS);
  gidLink(cast(void**)&gst_video_info_is_equal, "gst_video_info_is_equal", LIBS);
  gidLink(cast(void**)&gst_video_info_set_format, "gst_video_info_set_format", LIBS);
  gidLink(cast(void**)&gst_video_info_set_interlaced_format, "gst_video_info_set_interlaced_format", LIBS);
  gidLink(cast(void**)&gst_video_info_to_caps, "gst_video_info_to_caps", LIBS);
  gidLink(cast(void**)&gst_video_info_from_caps, "gst_video_info_from_caps", LIBS);
  gidLink(cast(void**)&gst_video_info_init, "gst_video_info_init", LIBS);

  // VideoInfoDmaDrm
  gidLink(cast(void**)&gst_video_info_dma_drm_get_type, "gst_video_info_dma_drm_get_type", LIBS);
  gidLink(cast(void**)&gst_video_info_dma_drm_new, "gst_video_info_dma_drm_new", LIBS);
  gidLink(cast(void**)&gst_video_info_dma_drm_new_from_caps, "gst_video_info_dma_drm_new_from_caps", LIBS);
  gidLink(cast(void**)&gst_video_info_dma_drm_free, "gst_video_info_dma_drm_free", LIBS);
  gidLink(cast(void**)&gst_video_info_dma_drm_to_caps, "gst_video_info_dma_drm_to_caps", LIBS);
  gidLink(cast(void**)&gst_video_info_dma_drm_to_video_info, "gst_video_info_dma_drm_to_video_info", LIBS);
  gidLink(cast(void**)&gst_video_info_dma_drm_from_caps, "gst_video_info_dma_drm_from_caps", LIBS);
  gidLink(cast(void**)&gst_video_info_dma_drm_from_video_info, "gst_video_info_dma_drm_from_video_info", LIBS);
  gidLink(cast(void**)&gst_video_info_dma_drm_init, "gst_video_info_dma_drm_init", LIBS);

  // VideoMasteringDisplayInfo
  gidLink(cast(void**)&gst_video_mastering_display_info_add_to_caps, "gst_video_mastering_display_info_add_to_caps", LIBS);
  gidLink(cast(void**)&gst_video_mastering_display_info_from_caps, "gst_video_mastering_display_info_from_caps", LIBS);
  gidLink(cast(void**)&gst_video_mastering_display_info_init, "gst_video_mastering_display_info_init", LIBS);
  gidLink(cast(void**)&gst_video_mastering_display_info_is_equal, "gst_video_mastering_display_info_is_equal", LIBS);
  gidLink(cast(void**)&gst_video_mastering_display_info_to_string, "gst_video_mastering_display_info_to_string", LIBS);
  gidLink(cast(void**)&gst_video_mastering_display_info_from_string, "gst_video_mastering_display_info_from_string", LIBS);

  // VideoMeta
  gidLink(cast(void**)&gst_video_meta_get_plane_height, "gst_video_meta_get_plane_height", LIBS);
  gidLink(cast(void**)&gst_video_meta_get_plane_size, "gst_video_meta_get_plane_size", LIBS);
  gidLink(cast(void**)&gst_video_meta_map, "gst_video_meta_map", LIBS);
  gidLink(cast(void**)&gst_video_meta_set_alignment, "gst_video_meta_set_alignment", LIBS);
  gidLink(cast(void**)&gst_video_meta_unmap, "gst_video_meta_unmap", LIBS);
  gidLink(cast(void**)&gst_video_meta_get_info, "gst_video_meta_get_info", LIBS);

  // VideoMetaTransform
  gidLink(cast(void**)&gst_video_meta_transform_scale_get_quark, "gst_video_meta_transform_scale_get_quark", LIBS);

  // VideoMultiviewFlagsSet
  gidLink(cast(void**)&gst_video_multiview_flagset_get_type, "gst_video_multiview_flagset_get_type", LIBS);

  // VideoOrientation
  gidLink(cast(void**)&gst_video_orientation_get_type, "gst_video_orientation_get_type", LIBS);
  gidLink(cast(void**)&gst_video_orientation_from_tag, "gst_video_orientation_from_tag", LIBS);
  gidLink(cast(void**)&gst_video_orientation_get_hcenter, "gst_video_orientation_get_hcenter", LIBS);
  gidLink(cast(void**)&gst_video_orientation_get_hflip, "gst_video_orientation_get_hflip", LIBS);
  gidLink(cast(void**)&gst_video_orientation_get_vcenter, "gst_video_orientation_get_vcenter", LIBS);
  gidLink(cast(void**)&gst_video_orientation_get_vflip, "gst_video_orientation_get_vflip", LIBS);
  gidLink(cast(void**)&gst_video_orientation_set_hcenter, "gst_video_orientation_set_hcenter", LIBS);
  gidLink(cast(void**)&gst_video_orientation_set_hflip, "gst_video_orientation_set_hflip", LIBS);
  gidLink(cast(void**)&gst_video_orientation_set_vcenter, "gst_video_orientation_set_vcenter", LIBS);
  gidLink(cast(void**)&gst_video_orientation_set_vflip, "gst_video_orientation_set_vflip", LIBS);

  // VideoOverlay
  gidLink(cast(void**)&gst_video_overlay_get_type, "gst_video_overlay_get_type", LIBS);
  gidLink(cast(void**)&gst_video_overlay_install_properties, "gst_video_overlay_install_properties", LIBS);
  gidLink(cast(void**)&gst_video_overlay_set_property, "gst_video_overlay_set_property", LIBS);
  gidLink(cast(void**)&gst_video_overlay_expose, "gst_video_overlay_expose", LIBS);
  gidLink(cast(void**)&gst_video_overlay_got_window_handle, "gst_video_overlay_got_window_handle", LIBS);
  gidLink(cast(void**)&gst_video_overlay_handle_events, "gst_video_overlay_handle_events", LIBS);
  gidLink(cast(void**)&gst_video_overlay_prepare_window_handle, "gst_video_overlay_prepare_window_handle", LIBS);
  gidLink(cast(void**)&gst_video_overlay_set_render_rectangle, "gst_video_overlay_set_render_rectangle", LIBS);
  gidLink(cast(void**)&gst_video_overlay_set_window_handle, "gst_video_overlay_set_window_handle", LIBS);

  // VideoOverlayComposition
  gidLink(cast(void**)&gst_video_overlay_composition_get_type, "gst_video_overlay_composition_get_type", LIBS);
  gidLink(cast(void**)&gst_video_overlay_composition_new, "gst_video_overlay_composition_new", LIBS);
  gidLink(cast(void**)&gst_video_overlay_composition_add_rectangle, "gst_video_overlay_composition_add_rectangle", LIBS);
  gidLink(cast(void**)&gst_video_overlay_composition_blend, "gst_video_overlay_composition_blend", LIBS);
  gidLink(cast(void**)&gst_video_overlay_composition_copy, "gst_video_overlay_composition_copy", LIBS);
  gidLink(cast(void**)&gst_video_overlay_composition_get_rectangle, "gst_video_overlay_composition_get_rectangle", LIBS);
  gidLink(cast(void**)&gst_video_overlay_composition_get_seqnum, "gst_video_overlay_composition_get_seqnum", LIBS);
  gidLink(cast(void**)&gst_video_overlay_composition_make_writable, "gst_video_overlay_composition_make_writable", LIBS);
  gidLink(cast(void**)&gst_video_overlay_composition_n_rectangles, "gst_video_overlay_composition_n_rectangles", LIBS);

  // VideoOverlayCompositionMeta
  gidLink(cast(void**)&gst_video_overlay_composition_meta_get_info, "gst_video_overlay_composition_meta_get_info", LIBS);

  // VideoOverlayRectangle
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_type, "gst_video_overlay_rectangle_get_type", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_new_raw, "gst_video_overlay_rectangle_new_raw", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_copy, "gst_video_overlay_rectangle_copy", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_flags, "gst_video_overlay_rectangle_get_flags", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_global_alpha, "gst_video_overlay_rectangle_get_global_alpha", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_argb, "gst_video_overlay_rectangle_get_pixels_argb", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_ayuv, "gst_video_overlay_rectangle_get_pixels_ayuv", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_raw, "gst_video_overlay_rectangle_get_pixels_raw", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_unscaled_argb, "gst_video_overlay_rectangle_get_pixels_unscaled_argb", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_unscaled_ayuv, "gst_video_overlay_rectangle_get_pixels_unscaled_ayuv", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_unscaled_raw, "gst_video_overlay_rectangle_get_pixels_unscaled_raw", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_render_rectangle, "gst_video_overlay_rectangle_get_render_rectangle", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_seqnum, "gst_video_overlay_rectangle_get_seqnum", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_set_global_alpha, "gst_video_overlay_rectangle_set_global_alpha", LIBS);
  gidLink(cast(void**)&gst_video_overlay_rectangle_set_render_rectangle, "gst_video_overlay_rectangle_set_render_rectangle", LIBS);

  // VideoRegionOfInterestMeta
  gidLink(cast(void**)&gst_video_region_of_interest_meta_add_param, "gst_video_region_of_interest_meta_add_param", LIBS);
  gidLink(cast(void**)&gst_video_region_of_interest_meta_get_param, "gst_video_region_of_interest_meta_get_param", LIBS);
  gidLink(cast(void**)&gst_video_region_of_interest_meta_get_info, "gst_video_region_of_interest_meta_get_info", LIBS);

  // VideoResampler
  gidLink(cast(void**)&gst_video_resampler_clear, "gst_video_resampler_clear", LIBS);
  gidLink(cast(void**)&gst_video_resampler_init, "gst_video_resampler_init", LIBS);

  // VideoSEIUserDataUnregisteredMeta
  gidLink(cast(void**)&gst_video_sei_user_data_unregistered_meta_get_info, "gst_video_sei_user_data_unregistered_meta_get_info", LIBS);

  // VideoScaler
  gidLink(cast(void**)&gst_video_scaler_2d, "gst_video_scaler_2d", LIBS);
  gidLink(cast(void**)&gst_video_scaler_combine_packed_YUV, "gst_video_scaler_combine_packed_YUV", LIBS);
  gidLink(cast(void**)&gst_video_scaler_free, "gst_video_scaler_free", LIBS);
  gidLink(cast(void**)&gst_video_scaler_get_coeff, "gst_video_scaler_get_coeff", LIBS);
  gidLink(cast(void**)&gst_video_scaler_get_max_taps, "gst_video_scaler_get_max_taps", LIBS);
  gidLink(cast(void**)&gst_video_scaler_horizontal, "gst_video_scaler_horizontal", LIBS);
  gidLink(cast(void**)&gst_video_scaler_vertical, "gst_video_scaler_vertical", LIBS);
  gidLink(cast(void**)&gst_video_scaler_new, "gst_video_scaler_new", LIBS);

  // VideoSink
  gidLink(cast(void**)&gst_video_sink_get_type, "gst_video_sink_get_type", LIBS);
  gidLink(cast(void**)&gst_video_sink_center_rect, "gst_video_sink_center_rect", LIBS);

  // VideoTimeCode
  gidLink(cast(void**)&gst_video_time_code_get_type, "gst_video_time_code_get_type", LIBS);
  gidLink(cast(void**)&gst_video_time_code_new, "gst_video_time_code_new", LIBS);
  gidLink(cast(void**)&gst_video_time_code_new_empty, "gst_video_time_code_new_empty", LIBS);
  gidLink(cast(void**)&gst_video_time_code_new_from_date_time, "gst_video_time_code_new_from_date_time", LIBS);
  gidLink(cast(void**)&gst_video_time_code_new_from_date_time_full, "gst_video_time_code_new_from_date_time_full", LIBS);
  gidLink(cast(void**)&gst_video_time_code_new_from_string, "gst_video_time_code_new_from_string", LIBS);
  gidLink(cast(void**)&gst_video_time_code_add_frames, "gst_video_time_code_add_frames", LIBS);
  gidLink(cast(void**)&gst_video_time_code_add_interval, "gst_video_time_code_add_interval", LIBS);
  gidLink(cast(void**)&gst_video_time_code_clear, "gst_video_time_code_clear", LIBS);
  gidLink(cast(void**)&gst_video_time_code_compare, "gst_video_time_code_compare", LIBS);
  gidLink(cast(void**)&gst_video_time_code_copy, "gst_video_time_code_copy", LIBS);
  gidLink(cast(void**)&gst_video_time_code_frames_since_daily_jam, "gst_video_time_code_frames_since_daily_jam", LIBS);
  gidLink(cast(void**)&gst_video_time_code_free, "gst_video_time_code_free", LIBS);
  gidLink(cast(void**)&gst_video_time_code_increment_frame, "gst_video_time_code_increment_frame", LIBS);
  gidLink(cast(void**)&gst_video_time_code_init, "gst_video_time_code_init", LIBS);
  gidLink(cast(void**)&gst_video_time_code_init_from_date_time, "gst_video_time_code_init_from_date_time", LIBS);
  gidLink(cast(void**)&gst_video_time_code_init_from_date_time_full, "gst_video_time_code_init_from_date_time_full", LIBS);
  gidLink(cast(void**)&gst_video_time_code_is_valid, "gst_video_time_code_is_valid", LIBS);
  gidLink(cast(void**)&gst_video_time_code_nsec_since_daily_jam, "gst_video_time_code_nsec_since_daily_jam", LIBS);
  gidLink(cast(void**)&gst_video_time_code_to_date_time, "gst_video_time_code_to_date_time", LIBS);
  gidLink(cast(void**)&gst_video_time_code_to_string, "gst_video_time_code_to_string", LIBS);

  // VideoTimeCodeInterval
  gidLink(cast(void**)&gst_video_time_code_interval_get_type, "gst_video_time_code_interval_get_type", LIBS);
  gidLink(cast(void**)&gst_video_time_code_interval_new, "gst_video_time_code_interval_new", LIBS);
  gidLink(cast(void**)&gst_video_time_code_interval_new_from_string, "gst_video_time_code_interval_new_from_string", LIBS);
  gidLink(cast(void**)&gst_video_time_code_interval_clear, "gst_video_time_code_interval_clear", LIBS);
  gidLink(cast(void**)&gst_video_time_code_interval_copy, "gst_video_time_code_interval_copy", LIBS);
  gidLink(cast(void**)&gst_video_time_code_interval_free, "gst_video_time_code_interval_free", LIBS);
  gidLink(cast(void**)&gst_video_time_code_interval_init, "gst_video_time_code_interval_init", LIBS);

  // VideoTimeCodeMeta
  gidLink(cast(void**)&gst_video_time_code_meta_get_info, "gst_video_time_code_meta_get_info", LIBS);

  // VideoVBIEncoder
  gidLink(cast(void**)&gst_video_vbi_encoder_get_type, "gst_video_vbi_encoder_get_type", LIBS);
  gidLink(cast(void**)&gst_video_vbi_encoder_new, "gst_video_vbi_encoder_new", LIBS);
  gidLink(cast(void**)&gst_video_vbi_encoder_add_ancillary, "gst_video_vbi_encoder_add_ancillary", LIBS);
  gidLink(cast(void**)&gst_video_vbi_encoder_copy, "gst_video_vbi_encoder_copy", LIBS);
  gidLink(cast(void**)&gst_video_vbi_encoder_free, "gst_video_vbi_encoder_free", LIBS);
  gidLink(cast(void**)&gst_video_vbi_encoder_write_line, "gst_video_vbi_encoder_write_line", LIBS);

  // VideoVBIParser
  gidLink(cast(void**)&gst_video_vbi_parser_get_type, "gst_video_vbi_parser_get_type", LIBS);
  gidLink(cast(void**)&gst_video_vbi_parser_new, "gst_video_vbi_parser_new", LIBS);
  gidLink(cast(void**)&gst_video_vbi_parser_add_line, "gst_video_vbi_parser_add_line", LIBS);
  gidLink(cast(void**)&gst_video_vbi_parser_copy, "gst_video_vbi_parser_copy", LIBS);
  gidLink(cast(void**)&gst_video_vbi_parser_free, "gst_video_vbi_parser_free", LIBS);
  gidLink(cast(void**)&gst_video_vbi_parser_get_ancillary, "gst_video_vbi_parser_get_ancillary", LIBS);

  // global
  gidLink(cast(void**)&gst_ancillary_meta_api_get_type, "gst_ancillary_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_buffer_add_ancillary_meta, "gst_buffer_add_ancillary_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_afd_meta, "gst_buffer_add_video_afd_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_affine_transformation_meta, "gst_buffer_add_video_affine_transformation_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_bar_meta, "gst_buffer_add_video_bar_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_caption_meta, "gst_buffer_add_video_caption_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_codec_alpha_meta, "gst_buffer_add_video_codec_alpha_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_gl_texture_upload_meta, "gst_buffer_add_video_gl_texture_upload_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_meta, "gst_buffer_add_video_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_meta_full, "gst_buffer_add_video_meta_full", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_overlay_composition_meta, "gst_buffer_add_video_overlay_composition_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_region_of_interest_meta, "gst_buffer_add_video_region_of_interest_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_region_of_interest_meta_id, "gst_buffer_add_video_region_of_interest_meta_id", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_sei_user_data_unregistered_meta, "gst_buffer_add_video_sei_user_data_unregistered_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_time_code_meta, "gst_buffer_add_video_time_code_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_add_video_time_code_meta_full, "gst_buffer_add_video_time_code_meta_full", LIBS);
  gidLink(cast(void**)&gst_buffer_get_video_meta, "gst_buffer_get_video_meta", LIBS);
  gidLink(cast(void**)&gst_buffer_get_video_meta_id, "gst_buffer_get_video_meta_id", LIBS);
  gidLink(cast(void**)&gst_buffer_get_video_region_of_interest_meta_id, "gst_buffer_get_video_region_of_interest_meta_id", LIBS);
  gidLink(cast(void**)&gst_buffer_pool_config_get_video_alignment, "gst_buffer_pool_config_get_video_alignment", LIBS);
  gidLink(cast(void**)&gst_buffer_pool_config_set_video_alignment, "gst_buffer_pool_config_set_video_alignment", LIBS);
  gidLink(cast(void**)&gst_is_video_overlay_prepare_window_handle_message, "gst_is_video_overlay_prepare_window_handle_message", LIBS);
  gidLink(cast(void**)&gst_video_afd_meta_api_get_type, "gst_video_afd_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_affine_transformation_meta_api_get_type, "gst_video_affine_transformation_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_bar_meta_api_get_type, "gst_video_bar_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_blend, "gst_video_blend", LIBS);
  gidLink(cast(void**)&gst_video_blend_scale_linear_RGBA, "gst_video_blend_scale_linear_RGBA", LIBS);
  gidLink(cast(void**)&gst_video_calculate_display_ratio, "gst_video_calculate_display_ratio", LIBS);
  gidLink(cast(void**)&gst_video_caption_meta_api_get_type, "gst_video_caption_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_center_rect, "gst_video_center_rect", LIBS);
  gidLink(cast(void**)&gst_video_chroma_from_string, "gst_video_chroma_from_string", LIBS);
  gidLink(cast(void**)&gst_video_chroma_resample, "gst_video_chroma_resample", LIBS);
  gidLink(cast(void**)&gst_video_chroma_to_string, "gst_video_chroma_to_string", LIBS);
  gidLink(cast(void**)&gst_video_codec_alpha_meta_api_get_type, "gst_video_codec_alpha_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_color_transfer_decode, "gst_video_color_transfer_decode", LIBS);
  gidLink(cast(void**)&gst_video_color_transfer_encode, "gst_video_color_transfer_encode", LIBS);
  gidLink(cast(void**)&gst_video_convert_sample, "gst_video_convert_sample", LIBS);
  gidLink(cast(void**)&gst_video_convert_sample_async, "gst_video_convert_sample_async", LIBS);
  gidLink(cast(void**)&gst_video_crop_meta_api_get_type, "gst_video_crop_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_dma_drm_fourcc_from_format, "gst_video_dma_drm_fourcc_from_format", LIBS);
  gidLink(cast(void**)&gst_video_dma_drm_fourcc_from_string, "gst_video_dma_drm_fourcc_from_string", LIBS);
  gidLink(cast(void**)&gst_video_dma_drm_fourcc_to_format, "gst_video_dma_drm_fourcc_to_format", LIBS);
  gidLink(cast(void**)&gst_video_dma_drm_fourcc_to_string, "gst_video_dma_drm_fourcc_to_string", LIBS);
  gidLink(cast(void**)&gst_video_event_is_force_key_unit, "gst_video_event_is_force_key_unit", LIBS);
  gidLink(cast(void**)&gst_video_event_new_downstream_force_key_unit, "gst_video_event_new_downstream_force_key_unit", LIBS);
  gidLink(cast(void**)&gst_video_event_new_still_frame, "gst_video_event_new_still_frame", LIBS);
  gidLink(cast(void**)&gst_video_event_new_upstream_force_key_unit, "gst_video_event_new_upstream_force_key_unit", LIBS);
  gidLink(cast(void**)&gst_video_event_parse_downstream_force_key_unit, "gst_video_event_parse_downstream_force_key_unit", LIBS);
  gidLink(cast(void**)&gst_video_event_parse_still_frame, "gst_video_event_parse_still_frame", LIBS);
  gidLink(cast(void**)&gst_video_event_parse_upstream_force_key_unit, "gst_video_event_parse_upstream_force_key_unit", LIBS);
  gidLink(cast(void**)&gst_video_formats_any, "gst_video_formats_any", LIBS);
  gidLink(cast(void**)&gst_video_formats_raw, "gst_video_formats_raw", LIBS);
  gidLink(cast(void**)&gst_video_gl_texture_upload_meta_api_get_type, "gst_video_gl_texture_upload_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_guess_framerate, "gst_video_guess_framerate", LIBS);
  gidLink(cast(void**)&gst_video_is_common_aspect_ratio, "gst_video_is_common_aspect_ratio", LIBS);
  gidLink(cast(void**)&gst_video_is_dma_drm_caps, "gst_video_is_dma_drm_caps", LIBS);
  gidLink(cast(void**)&gst_video_make_raw_caps, "gst_video_make_raw_caps", LIBS);
  gidLink(cast(void**)&gst_video_make_raw_caps_with_features, "gst_video_make_raw_caps_with_features", LIBS);
  gidLink(cast(void**)&gst_video_meta_api_get_type, "gst_video_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_multiview_get_doubled_height_modes, "gst_video_multiview_get_doubled_height_modes", LIBS);
  gidLink(cast(void**)&gst_video_multiview_get_doubled_size_modes, "gst_video_multiview_get_doubled_size_modes", LIBS);
  gidLink(cast(void**)&gst_video_multiview_get_doubled_width_modes, "gst_video_multiview_get_doubled_width_modes", LIBS);
  gidLink(cast(void**)&gst_video_multiview_get_mono_modes, "gst_video_multiview_get_mono_modes", LIBS);
  gidLink(cast(void**)&gst_video_multiview_get_unpacked_modes, "gst_video_multiview_get_unpacked_modes", LIBS);
  gidLink(cast(void**)&gst_video_multiview_guess_half_aspect, "gst_video_multiview_guess_half_aspect", LIBS);
  gidLink(cast(void**)&gst_video_multiview_video_info_change_mode, "gst_video_multiview_video_info_change_mode", LIBS);
  gidLink(cast(void**)&gst_video_overlay_composition_meta_api_get_type, "gst_video_overlay_composition_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_region_of_interest_meta_api_get_type, "gst_video_region_of_interest_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_sei_user_data_unregistered_meta_api_get_type, "gst_video_sei_user_data_unregistered_meta_api_get_type", LIBS);
  gidLink(cast(void**)&gst_video_sei_user_data_unregistered_parse_precision_time_stamp, "gst_video_sei_user_data_unregistered_parse_precision_time_stamp", LIBS);
  gidLink(cast(void**)&gst_video_tile_get_index, "gst_video_tile_get_index", LIBS);
  gidLink(cast(void**)&gst_video_time_code_meta_api_get_type, "gst_video_time_code_meta_api_get_type", LIBS);
}
