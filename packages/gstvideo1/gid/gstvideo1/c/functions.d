/// C functions for gstvideo1 library
module gid.gstvideo1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstvideo1.c.types;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;

private immutable LIBS = ["gstvideo-1.0_0"];

// AncillaryMeta
private alias c_gst_ancillary_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_ancillary_meta_get_infoFn c_gst_ancillary_meta_get_info; ///

// ColorBalance
private alias c_gst_color_balance_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_color_balance_get_typeFn c_gst_color_balance_get_type; ///
private alias c_gst_color_balance_get_balance_typeFn = extern(C) GstColorBalanceType function(GstColorBalance* balance) nothrow;
__gshared c_gst_color_balance_get_balance_typeFn c_gst_color_balance_get_balance_type; ///
private alias c_gst_color_balance_get_valueFn = extern(C) int function(GstColorBalance* balance, GstColorBalanceChannel* channel) nothrow;
__gshared c_gst_color_balance_get_valueFn c_gst_color_balance_get_value; ///
private alias c_gst_color_balance_list_channelsFn = extern(C) const(GList)* function(GstColorBalance* balance) nothrow;
__gshared c_gst_color_balance_list_channelsFn c_gst_color_balance_list_channels; ///
private alias c_gst_color_balance_set_valueFn = extern(C) void function(GstColorBalance* balance, GstColorBalanceChannel* channel, int value) nothrow;
__gshared c_gst_color_balance_set_valueFn c_gst_color_balance_set_value; ///
private alias c_gst_color_balance_value_changedFn = extern(C) void function(GstColorBalance* balance, GstColorBalanceChannel* channel, int value) nothrow;
__gshared c_gst_color_balance_value_changedFn c_gst_color_balance_value_changed; ///

// ColorBalanceChannel
private alias c_gst_color_balance_channel_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_color_balance_channel_get_typeFn c_gst_color_balance_channel_get_type; ///

// Navigation
private alias c_gst_navigation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_navigation_get_typeFn c_gst_navigation_get_type; ///
private alias c_gst_navigation_event_get_coordinatesFn = extern(C) gboolean function(GstEvent* event, double* x, double* y) nothrow;
__gshared c_gst_navigation_event_get_coordinatesFn c_gst_navigation_event_get_coordinates; ///
private alias c_gst_navigation_event_get_typeFn = extern(C) GstNavigationEventType function(GstEvent* event) nothrow;
__gshared c_gst_navigation_event_get_typeFn c_gst_navigation_event_get_type; ///
private alias c_gst_navigation_event_new_commandFn = extern(C) GstEvent* function(GstNavigationCommand command) nothrow;
__gshared c_gst_navigation_event_new_commandFn c_gst_navigation_event_new_command; ///
private alias c_gst_navigation_event_new_key_pressFn = extern(C) GstEvent* function(const(char)* key, GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_key_pressFn c_gst_navigation_event_new_key_press; ///
private alias c_gst_navigation_event_new_key_releaseFn = extern(C) GstEvent* function(const(char)* key, GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_key_releaseFn c_gst_navigation_event_new_key_release; ///
private alias c_gst_navigation_event_new_mouse_button_pressFn = extern(C) GstEvent* function(int button, double x, double y, GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_mouse_button_pressFn c_gst_navigation_event_new_mouse_button_press; ///
private alias c_gst_navigation_event_new_mouse_button_releaseFn = extern(C) GstEvent* function(int button, double x, double y, GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_mouse_button_releaseFn c_gst_navigation_event_new_mouse_button_release; ///
private alias c_gst_navigation_event_new_mouse_double_clickFn = extern(C) GstEvent* function(int button, double x, double y, GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_mouse_double_clickFn c_gst_navigation_event_new_mouse_double_click; ///
private alias c_gst_navigation_event_new_mouse_moveFn = extern(C) GstEvent* function(double x, double y, GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_mouse_moveFn c_gst_navigation_event_new_mouse_move; ///
private alias c_gst_navigation_event_new_mouse_scrollFn = extern(C) GstEvent* function(double x, double y, double deltaX, double deltaY, GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_mouse_scrollFn c_gst_navigation_event_new_mouse_scroll; ///
private alias c_gst_navigation_event_new_touch_cancelFn = extern(C) GstEvent* function(GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_touch_cancelFn c_gst_navigation_event_new_touch_cancel; ///
private alias c_gst_navigation_event_new_touch_downFn = extern(C) GstEvent* function(uint identifier, double x, double y, double pressure, GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_touch_downFn c_gst_navigation_event_new_touch_down; ///
private alias c_gst_navigation_event_new_touch_frameFn = extern(C) GstEvent* function(GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_touch_frameFn c_gst_navigation_event_new_touch_frame; ///
private alias c_gst_navigation_event_new_touch_motionFn = extern(C) GstEvent* function(uint identifier, double x, double y, double pressure, GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_touch_motionFn c_gst_navigation_event_new_touch_motion; ///
private alias c_gst_navigation_event_new_touch_upFn = extern(C) GstEvent* function(uint identifier, double x, double y, GstNavigationModifierType state) nothrow;
__gshared c_gst_navigation_event_new_touch_upFn c_gst_navigation_event_new_touch_up; ///
private alias c_gst_navigation_event_parse_commandFn = extern(C) gboolean function(GstEvent* event, GstNavigationCommand* command) nothrow;
__gshared c_gst_navigation_event_parse_commandFn c_gst_navigation_event_parse_command; ///
private alias c_gst_navigation_event_parse_key_eventFn = extern(C) gboolean function(GstEvent* event, const(char*)* key) nothrow;
__gshared c_gst_navigation_event_parse_key_eventFn c_gst_navigation_event_parse_key_event; ///
private alias c_gst_navigation_event_parse_modifier_stateFn = extern(C) gboolean function(GstEvent* event, GstNavigationModifierType* state) nothrow;
__gshared c_gst_navigation_event_parse_modifier_stateFn c_gst_navigation_event_parse_modifier_state; ///
private alias c_gst_navigation_event_parse_mouse_button_eventFn = extern(C) gboolean function(GstEvent* event, int* button, double* x, double* y) nothrow;
__gshared c_gst_navigation_event_parse_mouse_button_eventFn c_gst_navigation_event_parse_mouse_button_event; ///
private alias c_gst_navigation_event_parse_mouse_move_eventFn = extern(C) gboolean function(GstEvent* event, double* x, double* y) nothrow;
__gshared c_gst_navigation_event_parse_mouse_move_eventFn c_gst_navigation_event_parse_mouse_move_event; ///
private alias c_gst_navigation_event_parse_mouse_scroll_eventFn = extern(C) gboolean function(GstEvent* event, double* x, double* y, double* deltaX, double* deltaY) nothrow;
__gshared c_gst_navigation_event_parse_mouse_scroll_eventFn c_gst_navigation_event_parse_mouse_scroll_event; ///
private alias c_gst_navigation_event_parse_touch_eventFn = extern(C) gboolean function(GstEvent* event, uint* identifier, double* x, double* y, double* pressure) nothrow;
__gshared c_gst_navigation_event_parse_touch_eventFn c_gst_navigation_event_parse_touch_event; ///
private alias c_gst_navigation_event_parse_touch_up_eventFn = extern(C) gboolean function(GstEvent* event, uint* identifier, double* x, double* y) nothrow;
__gshared c_gst_navigation_event_parse_touch_up_eventFn c_gst_navigation_event_parse_touch_up_event; ///
private alias c_gst_navigation_event_set_coordinatesFn = extern(C) gboolean function(GstEvent* event, double x, double y) nothrow;
__gshared c_gst_navigation_event_set_coordinatesFn c_gst_navigation_event_set_coordinates; ///
private alias c_gst_navigation_message_get_typeFn = extern(C) GstNavigationMessageType function(GstMessage* message) nothrow;
__gshared c_gst_navigation_message_get_typeFn c_gst_navigation_message_get_type; ///
private alias c_gst_navigation_message_new_angles_changedFn = extern(C) GstMessage* function(GstObject* src, uint curAngle, uint nAngles) nothrow;
__gshared c_gst_navigation_message_new_angles_changedFn c_gst_navigation_message_new_angles_changed; ///
private alias c_gst_navigation_message_new_commands_changedFn = extern(C) GstMessage* function(GstObject* src) nothrow;
__gshared c_gst_navigation_message_new_commands_changedFn c_gst_navigation_message_new_commands_changed; ///
private alias c_gst_navigation_message_new_eventFn = extern(C) GstMessage* function(GstObject* src, GstEvent* event) nothrow;
__gshared c_gst_navigation_message_new_eventFn c_gst_navigation_message_new_event; ///
private alias c_gst_navigation_message_new_mouse_overFn = extern(C) GstMessage* function(GstObject* src, gboolean active) nothrow;
__gshared c_gst_navigation_message_new_mouse_overFn c_gst_navigation_message_new_mouse_over; ///
private alias c_gst_navigation_message_parse_angles_changedFn = extern(C) gboolean function(GstMessage* message, uint* curAngle, uint* nAngles) nothrow;
__gshared c_gst_navigation_message_parse_angles_changedFn c_gst_navigation_message_parse_angles_changed; ///
private alias c_gst_navigation_message_parse_eventFn = extern(C) gboolean function(GstMessage* message, GstEvent** event) nothrow;
__gshared c_gst_navigation_message_parse_eventFn c_gst_navigation_message_parse_event; ///
private alias c_gst_navigation_message_parse_mouse_overFn = extern(C) gboolean function(GstMessage* message, gboolean* active) nothrow;
__gshared c_gst_navigation_message_parse_mouse_overFn c_gst_navigation_message_parse_mouse_over; ///
private alias c_gst_navigation_query_get_typeFn = extern(C) GstNavigationQueryType function(GstQuery* query) nothrow;
__gshared c_gst_navigation_query_get_typeFn c_gst_navigation_query_get_type; ///
private alias c_gst_navigation_query_new_anglesFn = extern(C) GstQuery* function() nothrow;
__gshared c_gst_navigation_query_new_anglesFn c_gst_navigation_query_new_angles; ///
private alias c_gst_navigation_query_new_commandsFn = extern(C) GstQuery* function() nothrow;
__gshared c_gst_navigation_query_new_commandsFn c_gst_navigation_query_new_commands; ///
private alias c_gst_navigation_query_parse_anglesFn = extern(C) gboolean function(GstQuery* query, uint* curAngle, uint* nAngles) nothrow;
__gshared c_gst_navigation_query_parse_anglesFn c_gst_navigation_query_parse_angles; ///
private alias c_gst_navigation_query_parse_commands_lengthFn = extern(C) gboolean function(GstQuery* query, uint* nCmds) nothrow;
__gshared c_gst_navigation_query_parse_commands_lengthFn c_gst_navigation_query_parse_commands_length; ///
private alias c_gst_navigation_query_parse_commands_nthFn = extern(C) gboolean function(GstQuery* query, uint nth, GstNavigationCommand* cmd) nothrow;
__gshared c_gst_navigation_query_parse_commands_nthFn c_gst_navigation_query_parse_commands_nth; ///
private alias c_gst_navigation_query_set_anglesFn = extern(C) void function(GstQuery* query, uint curAngle, uint nAngles) nothrow;
__gshared c_gst_navigation_query_set_anglesFn c_gst_navigation_query_set_angles; ///
private alias c_gst_navigation_query_set_commandsFn = extern(C) void function(GstQuery* query, int nCmds,  ...) nothrow;
__gshared c_gst_navigation_query_set_commandsFn c_gst_navigation_query_set_commands; ///
private alias c_gst_navigation_query_set_commandsvFn = extern(C) void function(GstQuery* query, int nCmds, GstNavigationCommand* cmds) nothrow;
__gshared c_gst_navigation_query_set_commandsvFn c_gst_navigation_query_set_commandsv; ///
private alias c_gst_navigation_send_commandFn = extern(C) void function(GstNavigation* navigation, GstNavigationCommand command) nothrow;
__gshared c_gst_navigation_send_commandFn c_gst_navigation_send_command; ///
private alias c_gst_navigation_send_eventFn = extern(C) void function(GstNavigation* navigation, GstStructure* structure) nothrow;
__gshared c_gst_navigation_send_eventFn c_gst_navigation_send_event; ///
private alias c_gst_navigation_send_event_simpleFn = extern(C) void function(GstNavigation* navigation, GstEvent* event) nothrow;
__gshared c_gst_navigation_send_event_simpleFn c_gst_navigation_send_event_simple; ///
private alias c_gst_navigation_send_key_eventFn = extern(C) void function(GstNavigation* navigation, const(char)* event, const(char)* key) nothrow;
__gshared c_gst_navigation_send_key_eventFn c_gst_navigation_send_key_event; ///
private alias c_gst_navigation_send_mouse_eventFn = extern(C) void function(GstNavigation* navigation, const(char)* event, int button, double x, double y) nothrow;
__gshared c_gst_navigation_send_mouse_eventFn c_gst_navigation_send_mouse_event; ///
private alias c_gst_navigation_send_mouse_scroll_eventFn = extern(C) void function(GstNavigation* navigation, double x, double y, double deltaX, double deltaY) nothrow;
__gshared c_gst_navigation_send_mouse_scroll_eventFn c_gst_navigation_send_mouse_scroll_event; ///

// VideoAFDMeta
private alias c_gst_video_afd_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_afd_meta_get_infoFn c_gst_video_afd_meta_get_info; ///

// VideoAffineTransformationMeta
private alias c_gst_video_affine_transformation_meta_apply_matrixFn = extern(C) void function(GstVideoAffineTransformationMeta* meta, const(float)* matrix) nothrow;
__gshared c_gst_video_affine_transformation_meta_apply_matrixFn c_gst_video_affine_transformation_meta_apply_matrix; ///
private alias c_gst_video_affine_transformation_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_affine_transformation_meta_get_infoFn c_gst_video_affine_transformation_meta_get_info; ///

// VideoAggregator
private alias c_gst_video_aggregator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_aggregator_get_typeFn c_gst_video_aggregator_get_type; ///
private alias c_gst_video_aggregator_get_execution_task_poolFn = extern(C) GstTaskPool* function(GstVideoAggregator* vagg) nothrow;
__gshared c_gst_video_aggregator_get_execution_task_poolFn c_gst_video_aggregator_get_execution_task_pool; ///

// VideoAggregatorConvertPad
private alias c_gst_video_aggregator_convert_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_aggregator_convert_pad_get_typeFn c_gst_video_aggregator_convert_pad_get_type; ///
private alias c_gst_video_aggregator_convert_pad_update_conversion_infoFn = extern(C) void function(GstVideoAggregatorConvertPad* pad) nothrow;
__gshared c_gst_video_aggregator_convert_pad_update_conversion_infoFn c_gst_video_aggregator_convert_pad_update_conversion_info; ///

// VideoAggregatorPad
private alias c_gst_video_aggregator_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_aggregator_pad_get_typeFn c_gst_video_aggregator_pad_get_type; ///
private alias c_gst_video_aggregator_pad_get_current_bufferFn = extern(C) GstBuffer* function(GstVideoAggregatorPad* pad) nothrow;
__gshared c_gst_video_aggregator_pad_get_current_bufferFn c_gst_video_aggregator_pad_get_current_buffer; ///
private alias c_gst_video_aggregator_pad_get_prepared_frameFn = extern(C) GstVideoFrame* function(GstVideoAggregatorPad* pad) nothrow;
__gshared c_gst_video_aggregator_pad_get_prepared_frameFn c_gst_video_aggregator_pad_get_prepared_frame; ///
private alias c_gst_video_aggregator_pad_has_current_bufferFn = extern(C) gboolean function(GstVideoAggregatorPad* pad) nothrow;
__gshared c_gst_video_aggregator_pad_has_current_bufferFn c_gst_video_aggregator_pad_has_current_buffer; ///
private alias c_gst_video_aggregator_pad_set_needs_alphaFn = extern(C) void function(GstVideoAggregatorPad* pad, gboolean needsAlpha) nothrow;
__gshared c_gst_video_aggregator_pad_set_needs_alphaFn c_gst_video_aggregator_pad_set_needs_alpha; ///

// VideoAggregatorParallelConvertPad
private alias c_gst_video_aggregator_parallel_convert_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_aggregator_parallel_convert_pad_get_typeFn c_gst_video_aggregator_parallel_convert_pad_get_type; ///

// VideoAlignment
private alias c_gst_video_alignment_resetFn = extern(C) void function(GstVideoAlignment* align_) nothrow;
__gshared c_gst_video_alignment_resetFn c_gst_video_alignment_reset; ///

// VideoBarMeta
private alias c_gst_video_bar_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_bar_meta_get_infoFn c_gst_video_bar_meta_get_info; ///

// VideoBufferPool
private alias c_gst_video_buffer_pool_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_buffer_pool_get_typeFn c_gst_video_buffer_pool_get_type; ///
private alias c_gst_video_buffer_pool_newFn = extern(C) GstBufferPool* function() nothrow;
__gshared c_gst_video_buffer_pool_newFn c_gst_video_buffer_pool_new; ///

// VideoCaptionMeta
private alias c_gst_video_caption_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_caption_meta_get_infoFn c_gst_video_caption_meta_get_info; ///

// VideoChromaResample
private alias c_gst_video_chroma_resample_freeFn = extern(C) void function(GstVideoChromaResample* resample) nothrow;
__gshared c_gst_video_chroma_resample_freeFn c_gst_video_chroma_resample_free; ///
private alias c_gst_video_chroma_resample_get_infoFn = extern(C) void function(GstVideoChromaResample* resample, uint* nLines, int* offset) nothrow;
__gshared c_gst_video_chroma_resample_get_infoFn c_gst_video_chroma_resample_get_info; ///
private alias c_gst_video_chroma_resample_newFn = extern(C) GstVideoChromaResample* function(GstVideoChromaMethod method, GstVideoChromaSite site, GstVideoChromaFlags flags, GstVideoFormat format, int hFactor, int vFactor) nothrow;
__gshared c_gst_video_chroma_resample_newFn c_gst_video_chroma_resample_new; ///

// VideoCodecAlphaMeta
private alias c_gst_video_codec_alpha_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_codec_alpha_meta_get_infoFn c_gst_video_codec_alpha_meta_get_info; ///

// VideoCodecFrame
private alias c_gst_video_codec_frame_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_codec_frame_get_typeFn c_gst_video_codec_frame_get_type; ///
private alias c_gst_video_codec_frame_get_user_dataFn = extern(C) void* function(GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_codec_frame_get_user_dataFn c_gst_video_codec_frame_get_user_data; ///
private alias c_gst_video_codec_frame_refFn = extern(C) GstVideoCodecFrame* function(GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_codec_frame_refFn c_gst_video_codec_frame_ref; ///
private alias c_gst_video_codec_frame_set_user_dataFn = extern(C) void function(GstVideoCodecFrame* frame, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_video_codec_frame_set_user_dataFn c_gst_video_codec_frame_set_user_data; ///
private alias c_gst_video_codec_frame_unrefFn = extern(C) void function(GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_codec_frame_unrefFn c_gst_video_codec_frame_unref; ///

// VideoCodecState
private alias c_gst_video_codec_state_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_codec_state_get_typeFn c_gst_video_codec_state_get_type; ///
private alias c_gst_video_codec_state_refFn = extern(C) GstVideoCodecState* function(GstVideoCodecState* state) nothrow;
__gshared c_gst_video_codec_state_refFn c_gst_video_codec_state_ref; ///
private alias c_gst_video_codec_state_unrefFn = extern(C) void function(GstVideoCodecState* state) nothrow;
__gshared c_gst_video_codec_state_unrefFn c_gst_video_codec_state_unref; ///

// VideoColorimetry
private alias c_gst_video_colorimetry_from_stringFn = extern(C) gboolean function(GstVideoColorimetry* cinfo, const(char)* color) nothrow;
__gshared c_gst_video_colorimetry_from_stringFn c_gst_video_colorimetry_from_string; ///
private alias c_gst_video_colorimetry_is_equalFn = extern(C) gboolean function(const(GstVideoColorimetry)* cinfo, const(GstVideoColorimetry)* other) nothrow;
__gshared c_gst_video_colorimetry_is_equalFn c_gst_video_colorimetry_is_equal; ///
private alias c_gst_video_colorimetry_is_equivalentFn = extern(C) gboolean function(const(GstVideoColorimetry)* cinfo, uint bitdepth, const(GstVideoColorimetry)* other, uint otherBitdepth) nothrow;
__gshared c_gst_video_colorimetry_is_equivalentFn c_gst_video_colorimetry_is_equivalent; ///
private alias c_gst_video_colorimetry_matchesFn = extern(C) gboolean function(const(GstVideoColorimetry)* cinfo, const(char)* color) nothrow;
__gshared c_gst_video_colorimetry_matchesFn c_gst_video_colorimetry_matches; ///
private alias c_gst_video_colorimetry_to_stringFn = extern(C) char* function(const(GstVideoColorimetry)* cinfo) nothrow;
__gshared c_gst_video_colorimetry_to_stringFn c_gst_video_colorimetry_to_string; ///

// VideoContentLightLevel
private alias c_gst_video_content_light_level_add_to_capsFn = extern(C) gboolean function(const(GstVideoContentLightLevel)* linfo, GstCaps* caps) nothrow;
__gshared c_gst_video_content_light_level_add_to_capsFn c_gst_video_content_light_level_add_to_caps; ///
private alias c_gst_video_content_light_level_from_capsFn = extern(C) gboolean function(GstVideoContentLightLevel* linfo, const(GstCaps)* caps) nothrow;
__gshared c_gst_video_content_light_level_from_capsFn c_gst_video_content_light_level_from_caps; ///
private alias c_gst_video_content_light_level_from_stringFn = extern(C) gboolean function(GstVideoContentLightLevel* linfo, const(char)* level) nothrow;
__gshared c_gst_video_content_light_level_from_stringFn c_gst_video_content_light_level_from_string; ///
private alias c_gst_video_content_light_level_initFn = extern(C) void function(GstVideoContentLightLevel* linfo) nothrow;
__gshared c_gst_video_content_light_level_initFn c_gst_video_content_light_level_init; ///
private alias c_gst_video_content_light_level_is_equalFn = extern(C) gboolean function(const(GstVideoContentLightLevel)* linfo, const(GstVideoContentLightLevel)* other) nothrow;
__gshared c_gst_video_content_light_level_is_equalFn c_gst_video_content_light_level_is_equal; ///
private alias c_gst_video_content_light_level_to_stringFn = extern(C) char* function(const(GstVideoContentLightLevel)* linfo) nothrow;
__gshared c_gst_video_content_light_level_to_stringFn c_gst_video_content_light_level_to_string; ///

// VideoConverter
private alias c_gst_video_converter_frameFn = extern(C) void function(GstVideoConverter* convert, const(GstVideoFrame)* src, GstVideoFrame* dest) nothrow;
__gshared c_gst_video_converter_frameFn c_gst_video_converter_frame; ///
private alias c_gst_video_converter_frame_finishFn = extern(C) void function(GstVideoConverter* convert) nothrow;
__gshared c_gst_video_converter_frame_finishFn c_gst_video_converter_frame_finish; ///
private alias c_gst_video_converter_freeFn = extern(C) void function(GstVideoConverter* convert) nothrow;
__gshared c_gst_video_converter_freeFn c_gst_video_converter_free; ///
private alias c_gst_video_converter_get_configFn = extern(C) const(GstStructure)* function(GstVideoConverter* convert) nothrow;
__gshared c_gst_video_converter_get_configFn c_gst_video_converter_get_config; ///
private alias c_gst_video_converter_get_in_infoFn = extern(C) const(GstVideoInfo)* function(GstVideoConverter* convert) nothrow;
__gshared c_gst_video_converter_get_in_infoFn c_gst_video_converter_get_in_info; ///
private alias c_gst_video_converter_get_out_infoFn = extern(C) const(GstVideoInfo)* function(GstVideoConverter* convert) nothrow;
__gshared c_gst_video_converter_get_out_infoFn c_gst_video_converter_get_out_info; ///
private alias c_gst_video_converter_set_configFn = extern(C) gboolean function(GstVideoConverter* convert, GstStructure* config) nothrow;
__gshared c_gst_video_converter_set_configFn c_gst_video_converter_set_config; ///
private alias c_gst_video_converter_transform_metasFn = extern(C) gboolean function(GstVideoConverter* convert, GstBuffer* src, GstBuffer* dest) nothrow;
__gshared c_gst_video_converter_transform_metasFn c_gst_video_converter_transform_metas; ///
private alias c_gst_video_converter_newFn = extern(C) GstVideoConverter* function(const(GstVideoInfo)* inInfo, const(GstVideoInfo)* outInfo, GstStructure* config) nothrow;
__gshared c_gst_video_converter_newFn c_gst_video_converter_new; ///
private alias c_gst_video_converter_new_with_poolFn = extern(C) GstVideoConverter* function(const(GstVideoInfo)* inInfo, const(GstVideoInfo)* outInfo, GstStructure* config, GstTaskPool* pool) nothrow;
__gshared c_gst_video_converter_new_with_poolFn c_gst_video_converter_new_with_pool; ///

// VideoCropMeta
private alias c_gst_video_crop_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_crop_meta_get_infoFn c_gst_video_crop_meta_get_info; ///

// VideoDecoder
private alias c_gst_video_decoder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_decoder_get_typeFn c_gst_video_decoder_get_type; ///
private alias c_gst_video_decoder_add_to_frameFn = extern(C) void function(GstVideoDecoder* decoder, int nBytes) nothrow;
__gshared c_gst_video_decoder_add_to_frameFn c_gst_video_decoder_add_to_frame; ///
private alias c_gst_video_decoder_allocate_output_bufferFn = extern(C) GstBuffer* function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_allocate_output_bufferFn c_gst_video_decoder_allocate_output_buffer; ///
private alias c_gst_video_decoder_allocate_output_frameFn = extern(C) GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_decoder_allocate_output_frameFn c_gst_video_decoder_allocate_output_frame; ///
private alias c_gst_video_decoder_allocate_output_frame_with_paramsFn = extern(C) GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame, GstBufferPoolAcquireParams* params) nothrow;
__gshared c_gst_video_decoder_allocate_output_frame_with_paramsFn c_gst_video_decoder_allocate_output_frame_with_params; ///
private alias c_gst_video_decoder_drop_frameFn = extern(C) GstFlowReturn function(GstVideoDecoder* dec, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_decoder_drop_frameFn c_gst_video_decoder_drop_frame; ///
private alias c_gst_video_decoder_drop_subframeFn = extern(C) GstFlowReturn function(GstVideoDecoder* dec, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_decoder_drop_subframeFn c_gst_video_decoder_drop_subframe; ///
private alias c_gst_video_decoder_finish_frameFn = extern(C) GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_decoder_finish_frameFn c_gst_video_decoder_finish_frame; ///
private alias c_gst_video_decoder_finish_subframeFn = extern(C) GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_decoder_finish_subframeFn c_gst_video_decoder_finish_subframe; ///
private alias c_gst_video_decoder_get_allocatorFn = extern(C) void function(GstVideoDecoder* decoder, GstAllocator** allocator, GstAllocationParams* params) nothrow;
__gshared c_gst_video_decoder_get_allocatorFn c_gst_video_decoder_get_allocator; ///
private alias c_gst_video_decoder_get_buffer_poolFn = extern(C) GstBufferPool* function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_get_buffer_poolFn c_gst_video_decoder_get_buffer_pool; ///
private alias c_gst_video_decoder_get_estimate_rateFn = extern(C) int function(GstVideoDecoder* dec) nothrow;
__gshared c_gst_video_decoder_get_estimate_rateFn c_gst_video_decoder_get_estimate_rate; ///
private alias c_gst_video_decoder_get_frameFn = extern(C) GstVideoCodecFrame* function(GstVideoDecoder* decoder, int frameNumber) nothrow;
__gshared c_gst_video_decoder_get_frameFn c_gst_video_decoder_get_frame; ///
private alias c_gst_video_decoder_get_framesFn = extern(C) GList* function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_get_framesFn c_gst_video_decoder_get_frames; ///
private alias c_gst_video_decoder_get_input_subframe_indexFn = extern(C) uint function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_decoder_get_input_subframe_indexFn c_gst_video_decoder_get_input_subframe_index; ///
private alias c_gst_video_decoder_get_latencyFn = extern(C) void function(GstVideoDecoder* decoder, GstClockTime* minLatency, GstClockTime* maxLatency) nothrow;
__gshared c_gst_video_decoder_get_latencyFn c_gst_video_decoder_get_latency; ///
private alias c_gst_video_decoder_get_max_decode_timeFn = extern(C) GstClockTimeDiff function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_decoder_get_max_decode_timeFn c_gst_video_decoder_get_max_decode_time; ///
private alias c_gst_video_decoder_get_max_errorsFn = extern(C) int function(GstVideoDecoder* dec) nothrow;
__gshared c_gst_video_decoder_get_max_errorsFn c_gst_video_decoder_get_max_errors; ///
private alias c_gst_video_decoder_get_needs_formatFn = extern(C) gboolean function(GstVideoDecoder* dec) nothrow;
__gshared c_gst_video_decoder_get_needs_formatFn c_gst_video_decoder_get_needs_format; ///
private alias c_gst_video_decoder_get_needs_sync_pointFn = extern(C) gboolean function(GstVideoDecoder* dec) nothrow;
__gshared c_gst_video_decoder_get_needs_sync_pointFn c_gst_video_decoder_get_needs_sync_point; ///
private alias c_gst_video_decoder_get_oldest_frameFn = extern(C) GstVideoCodecFrame* function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_get_oldest_frameFn c_gst_video_decoder_get_oldest_frame; ///
private alias c_gst_video_decoder_get_output_stateFn = extern(C) GstVideoCodecState* function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_get_output_stateFn c_gst_video_decoder_get_output_state; ///
private alias c_gst_video_decoder_get_packetizedFn = extern(C) gboolean function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_get_packetizedFn c_gst_video_decoder_get_packetized; ///
private alias c_gst_video_decoder_get_pending_frame_sizeFn = extern(C) size_t function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_get_pending_frame_sizeFn c_gst_video_decoder_get_pending_frame_size; ///
private alias c_gst_video_decoder_get_processed_subframe_indexFn = extern(C) uint function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_decoder_get_processed_subframe_indexFn c_gst_video_decoder_get_processed_subframe_index; ///
private alias c_gst_video_decoder_get_qos_proportionFn = extern(C) double function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_get_qos_proportionFn c_gst_video_decoder_get_qos_proportion; ///
private alias c_gst_video_decoder_get_subframe_modeFn = extern(C) gboolean function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_get_subframe_modeFn c_gst_video_decoder_get_subframe_mode; ///
private alias c_gst_video_decoder_have_frameFn = extern(C) GstFlowReturn function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_have_frameFn c_gst_video_decoder_have_frame; ///
private alias c_gst_video_decoder_have_last_subframeFn = extern(C) GstFlowReturn function(GstVideoDecoder* decoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_decoder_have_last_subframeFn c_gst_video_decoder_have_last_subframe; ///
private alias c_gst_video_decoder_merge_tagsFn = extern(C) void function(GstVideoDecoder* decoder, const(GstTagList)* tags, GstTagMergeMode mode) nothrow;
__gshared c_gst_video_decoder_merge_tagsFn c_gst_video_decoder_merge_tags; ///
private alias c_gst_video_decoder_negotiateFn = extern(C) gboolean function(GstVideoDecoder* decoder) nothrow;
__gshared c_gst_video_decoder_negotiateFn c_gst_video_decoder_negotiate; ///
private alias c_gst_video_decoder_proxy_getcapsFn = extern(C) GstCaps* function(GstVideoDecoder* decoder, GstCaps* caps, GstCaps* filter) nothrow;
__gshared c_gst_video_decoder_proxy_getcapsFn c_gst_video_decoder_proxy_getcaps; ///
private alias c_gst_video_decoder_release_frameFn = extern(C) void function(GstVideoDecoder* dec, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_decoder_release_frameFn c_gst_video_decoder_release_frame; ///
private alias c_gst_video_decoder_request_sync_pointFn = extern(C) void function(GstVideoDecoder* dec, GstVideoCodecFrame* frame, GstVideoDecoderRequestSyncPointFlags flags) nothrow;
__gshared c_gst_video_decoder_request_sync_pointFn c_gst_video_decoder_request_sync_point; ///
private alias c_gst_video_decoder_set_estimate_rateFn = extern(C) void function(GstVideoDecoder* dec, gboolean enabled) nothrow;
__gshared c_gst_video_decoder_set_estimate_rateFn c_gst_video_decoder_set_estimate_rate; ///
private alias c_gst_video_decoder_set_interlaced_output_stateFn = extern(C) GstVideoCodecState* function(GstVideoDecoder* decoder, GstVideoFormat fmt, GstVideoInterlaceMode interlaceMode, uint width, uint height, GstVideoCodecState* reference) nothrow;
__gshared c_gst_video_decoder_set_interlaced_output_stateFn c_gst_video_decoder_set_interlaced_output_state; ///
private alias c_gst_video_decoder_set_latencyFn = extern(C) void function(GstVideoDecoder* decoder, GstClockTime minLatency, GstClockTime maxLatency) nothrow;
__gshared c_gst_video_decoder_set_latencyFn c_gst_video_decoder_set_latency; ///
private alias c_gst_video_decoder_set_max_errorsFn = extern(C) void function(GstVideoDecoder* dec, int num) nothrow;
__gshared c_gst_video_decoder_set_max_errorsFn c_gst_video_decoder_set_max_errors; ///
private alias c_gst_video_decoder_set_needs_formatFn = extern(C) void function(GstVideoDecoder* dec, gboolean enabled) nothrow;
__gshared c_gst_video_decoder_set_needs_formatFn c_gst_video_decoder_set_needs_format; ///
private alias c_gst_video_decoder_set_needs_sync_pointFn = extern(C) void function(GstVideoDecoder* dec, gboolean enabled) nothrow;
__gshared c_gst_video_decoder_set_needs_sync_pointFn c_gst_video_decoder_set_needs_sync_point; ///
private alias c_gst_video_decoder_set_output_stateFn = extern(C) GstVideoCodecState* function(GstVideoDecoder* decoder, GstVideoFormat fmt, uint width, uint height, GstVideoCodecState* reference) nothrow;
__gshared c_gst_video_decoder_set_output_stateFn c_gst_video_decoder_set_output_state; ///
private alias c_gst_video_decoder_set_packetizedFn = extern(C) void function(GstVideoDecoder* decoder, gboolean packetized) nothrow;
__gshared c_gst_video_decoder_set_packetizedFn c_gst_video_decoder_set_packetized; ///
private alias c_gst_video_decoder_set_subframe_modeFn = extern(C) void function(GstVideoDecoder* decoder, gboolean subframeMode) nothrow;
__gshared c_gst_video_decoder_set_subframe_modeFn c_gst_video_decoder_set_subframe_mode; ///
private alias c_gst_video_decoder_set_use_default_pad_acceptcapsFn = extern(C) void function(GstVideoDecoder* decoder, gboolean use) nothrow;
__gshared c_gst_video_decoder_set_use_default_pad_acceptcapsFn c_gst_video_decoder_set_use_default_pad_acceptcaps; ///

// VideoDirection
private alias c_gst_video_direction_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_direction_get_typeFn c_gst_video_direction_get_type; ///

// VideoDither
private alias c_gst_video_dither_freeFn = extern(C) void function(GstVideoDither* dither) nothrow;
__gshared c_gst_video_dither_freeFn c_gst_video_dither_free; ///
private alias c_gst_video_dither_lineFn = extern(C) void function(GstVideoDither* dither, void* line, uint x, uint y, uint width) nothrow;
__gshared c_gst_video_dither_lineFn c_gst_video_dither_line; ///
private alias c_gst_video_dither_newFn = extern(C) GstVideoDither* function(GstVideoDitherMethod method, GstVideoDitherFlags flags, GstVideoFormat format, uint* quantizer, uint width) nothrow;
__gshared c_gst_video_dither_newFn c_gst_video_dither_new; ///

// VideoDmabufPool
private alias c_gst_video_dmabuf_pool_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_dmabuf_pool_get_typeFn c_gst_video_dmabuf_pool_get_type; ///
private alias c_gst_video_dmabuf_pool_newFn = extern(C) GstBufferPool* function() nothrow;
__gshared c_gst_video_dmabuf_pool_newFn c_gst_video_dmabuf_pool_new; ///

// VideoEncoder
private alias c_gst_video_encoder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_encoder_get_typeFn c_gst_video_encoder_get_type; ///
private alias c_gst_video_encoder_allocate_output_bufferFn = extern(C) GstBuffer* function(GstVideoEncoder* encoder, size_t size) nothrow;
__gshared c_gst_video_encoder_allocate_output_bufferFn c_gst_video_encoder_allocate_output_buffer; ///
private alias c_gst_video_encoder_allocate_output_frameFn = extern(C) GstFlowReturn function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame, size_t size) nothrow;
__gshared c_gst_video_encoder_allocate_output_frameFn c_gst_video_encoder_allocate_output_frame; ///
private alias c_gst_video_encoder_drop_frameFn = extern(C) void function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_encoder_drop_frameFn c_gst_video_encoder_drop_frame; ///
private alias c_gst_video_encoder_finish_frameFn = extern(C) GstFlowReturn function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_encoder_finish_frameFn c_gst_video_encoder_finish_frame; ///
private alias c_gst_video_encoder_finish_subframeFn = extern(C) GstFlowReturn function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_encoder_finish_subframeFn c_gst_video_encoder_finish_subframe; ///
private alias c_gst_video_encoder_get_allocatorFn = extern(C) void function(GstVideoEncoder* encoder, GstAllocator** allocator, GstAllocationParams* params) nothrow;
__gshared c_gst_video_encoder_get_allocatorFn c_gst_video_encoder_get_allocator; ///
private alias c_gst_video_encoder_get_frameFn = extern(C) GstVideoCodecFrame* function(GstVideoEncoder* encoder, int frameNumber) nothrow;
__gshared c_gst_video_encoder_get_frameFn c_gst_video_encoder_get_frame; ///
private alias c_gst_video_encoder_get_framesFn = extern(C) GList* function(GstVideoEncoder* encoder) nothrow;
__gshared c_gst_video_encoder_get_framesFn c_gst_video_encoder_get_frames; ///
private alias c_gst_video_encoder_get_latencyFn = extern(C) void function(GstVideoEncoder* encoder, GstClockTime* minLatency, GstClockTime* maxLatency) nothrow;
__gshared c_gst_video_encoder_get_latencyFn c_gst_video_encoder_get_latency; ///
private alias c_gst_video_encoder_get_max_encode_timeFn = extern(C) GstClockTimeDiff function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_encoder_get_max_encode_timeFn c_gst_video_encoder_get_max_encode_time; ///
private alias c_gst_video_encoder_get_min_force_key_unit_intervalFn = extern(C) GstClockTime function(GstVideoEncoder* encoder) nothrow;
__gshared c_gst_video_encoder_get_min_force_key_unit_intervalFn c_gst_video_encoder_get_min_force_key_unit_interval; ///
private alias c_gst_video_encoder_get_oldest_frameFn = extern(C) GstVideoCodecFrame* function(GstVideoEncoder* encoder) nothrow;
__gshared c_gst_video_encoder_get_oldest_frameFn c_gst_video_encoder_get_oldest_frame; ///
private alias c_gst_video_encoder_get_output_stateFn = extern(C) GstVideoCodecState* function(GstVideoEncoder* encoder) nothrow;
__gshared c_gst_video_encoder_get_output_stateFn c_gst_video_encoder_get_output_state; ///
private alias c_gst_video_encoder_is_qos_enabledFn = extern(C) gboolean function(GstVideoEncoder* encoder) nothrow;
__gshared c_gst_video_encoder_is_qos_enabledFn c_gst_video_encoder_is_qos_enabled; ///
private alias c_gst_video_encoder_merge_tagsFn = extern(C) void function(GstVideoEncoder* encoder, const(GstTagList)* tags, GstTagMergeMode mode) nothrow;
__gshared c_gst_video_encoder_merge_tagsFn c_gst_video_encoder_merge_tags; ///
private alias c_gst_video_encoder_negotiateFn = extern(C) gboolean function(GstVideoEncoder* encoder) nothrow;
__gshared c_gst_video_encoder_negotiateFn c_gst_video_encoder_negotiate; ///
private alias c_gst_video_encoder_proxy_getcapsFn = extern(C) GstCaps* function(GstVideoEncoder* enc, GstCaps* caps, GstCaps* filter) nothrow;
__gshared c_gst_video_encoder_proxy_getcapsFn c_gst_video_encoder_proxy_getcaps; ///
private alias c_gst_video_encoder_release_frameFn = extern(C) void function(GstVideoEncoder* encoder, GstVideoCodecFrame* frame) nothrow;
__gshared c_gst_video_encoder_release_frameFn c_gst_video_encoder_release_frame; ///
private alias c_gst_video_encoder_set_headersFn = extern(C) void function(GstVideoEncoder* encoder, GList* headers) nothrow;
__gshared c_gst_video_encoder_set_headersFn c_gst_video_encoder_set_headers; ///
private alias c_gst_video_encoder_set_latencyFn = extern(C) void function(GstVideoEncoder* encoder, GstClockTime minLatency, GstClockTime maxLatency) nothrow;
__gshared c_gst_video_encoder_set_latencyFn c_gst_video_encoder_set_latency; ///
private alias c_gst_video_encoder_set_min_force_key_unit_intervalFn = extern(C) void function(GstVideoEncoder* encoder, GstClockTime interval) nothrow;
__gshared c_gst_video_encoder_set_min_force_key_unit_intervalFn c_gst_video_encoder_set_min_force_key_unit_interval; ///
private alias c_gst_video_encoder_set_min_ptsFn = extern(C) void function(GstVideoEncoder* encoder, GstClockTime minPts) nothrow;
__gshared c_gst_video_encoder_set_min_ptsFn c_gst_video_encoder_set_min_pts; ///
private alias c_gst_video_encoder_set_output_stateFn = extern(C) GstVideoCodecState* function(GstVideoEncoder* encoder, GstCaps* caps, GstVideoCodecState* reference) nothrow;
__gshared c_gst_video_encoder_set_output_stateFn c_gst_video_encoder_set_output_state; ///
private alias c_gst_video_encoder_set_qos_enabledFn = extern(C) void function(GstVideoEncoder* encoder, gboolean enabled) nothrow;
__gshared c_gst_video_encoder_set_qos_enabledFn c_gst_video_encoder_set_qos_enabled; ///

// VideoFilter
private alias c_gst_video_filter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_filter_get_typeFn c_gst_video_filter_get_type; ///

// VideoFormatInfo
private alias c_gst_video_format_info_componentFn = extern(C) void function(const(GstVideoFormatInfo)* info, uint plane, int* components) nothrow;
__gshared c_gst_video_format_info_componentFn c_gst_video_format_info_component; ///
private alias c_gst_video_format_info_extrapolate_strideFn = extern(C) int function(const(GstVideoFormatInfo)* finfo, int plane, int stride) nothrow;
__gshared c_gst_video_format_info_extrapolate_strideFn c_gst_video_format_info_extrapolate_stride; ///

// VideoFrame
private alias c_gst_video_frame_copyFn = extern(C) gboolean function(GstVideoFrame* dest, const(GstVideoFrame)* src) nothrow;
__gshared c_gst_video_frame_copyFn c_gst_video_frame_copy; ///
private alias c_gst_video_frame_copy_planeFn = extern(C) gboolean function(GstVideoFrame* dest, const(GstVideoFrame)* src, uint plane) nothrow;
__gshared c_gst_video_frame_copy_planeFn c_gst_video_frame_copy_plane; ///
private alias c_gst_video_frame_unmapFn = extern(C) void function(GstVideoFrame* frame) nothrow;
__gshared c_gst_video_frame_unmapFn c_gst_video_frame_unmap; ///
private alias c_gst_video_frame_mapFn = extern(C) gboolean function(GstVideoFrame* frame, const(GstVideoInfo)* info, GstBuffer* buffer, GstMapFlags flags) nothrow;
__gshared c_gst_video_frame_mapFn c_gst_video_frame_map; ///
private alias c_gst_video_frame_map_idFn = extern(C) gboolean function(GstVideoFrame* frame, const(GstVideoInfo)* info, GstBuffer* buffer, int id, GstMapFlags flags) nothrow;
__gshared c_gst_video_frame_map_idFn c_gst_video_frame_map_id; ///

// VideoGLTextureUploadMeta
private alias c_gst_video_gl_texture_upload_meta_uploadFn = extern(C) gboolean function(GstVideoGLTextureUploadMeta* meta, uint* textureId) nothrow;
__gshared c_gst_video_gl_texture_upload_meta_uploadFn c_gst_video_gl_texture_upload_meta_upload; ///
private alias c_gst_video_gl_texture_upload_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_gl_texture_upload_meta_get_infoFn c_gst_video_gl_texture_upload_meta_get_info; ///

// VideoInfo
private alias c_gst_video_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_info_get_typeFn c_gst_video_info_get_type; ///
private alias c_gst_video_info_newFn = extern(C) GstVideoInfo* function() nothrow;
__gshared c_gst_video_info_newFn c_gst_video_info_new; ///
private alias c_gst_video_info_new_from_capsFn = extern(C) GstVideoInfo* function(const(GstCaps)* caps) nothrow;
__gshared c_gst_video_info_new_from_capsFn c_gst_video_info_new_from_caps; ///
private alias c_gst_video_info_alignFn = extern(C) gboolean function(GstVideoInfo* info, GstVideoAlignment* align_) nothrow;
__gshared c_gst_video_info_alignFn c_gst_video_info_align; ///
private alias c_gst_video_info_align_fullFn = extern(C) gboolean function(GstVideoInfo* info, GstVideoAlignment* align_, size_t* planeSize) nothrow;
__gshared c_gst_video_info_align_fullFn c_gst_video_info_align_full; ///
private alias c_gst_video_info_convertFn = extern(C) gboolean function(const(GstVideoInfo)* info, GstFormat srcFormat, long srcValue, GstFormat destFormat, long* destValue) nothrow;
__gshared c_gst_video_info_convertFn c_gst_video_info_convert; ///
private alias c_gst_video_info_copyFn = extern(C) GstVideoInfo* function(const(GstVideoInfo)* info) nothrow;
__gshared c_gst_video_info_copyFn c_gst_video_info_copy; ///
private alias c_gst_video_info_freeFn = extern(C) void function(GstVideoInfo* info) nothrow;
__gshared c_gst_video_info_freeFn c_gst_video_info_free; ///
private alias c_gst_video_info_is_equalFn = extern(C) gboolean function(const(GstVideoInfo)* info, const(GstVideoInfo)* other) nothrow;
__gshared c_gst_video_info_is_equalFn c_gst_video_info_is_equal; ///
private alias c_gst_video_info_set_formatFn = extern(C) gboolean function(GstVideoInfo* info, GstVideoFormat format, uint width, uint height) nothrow;
__gshared c_gst_video_info_set_formatFn c_gst_video_info_set_format; ///
private alias c_gst_video_info_set_interlaced_formatFn = extern(C) gboolean function(GstVideoInfo* info, GstVideoFormat format, GstVideoInterlaceMode mode, uint width, uint height) nothrow;
__gshared c_gst_video_info_set_interlaced_formatFn c_gst_video_info_set_interlaced_format; ///
private alias c_gst_video_info_to_capsFn = extern(C) GstCaps* function(const(GstVideoInfo)* info) nothrow;
__gshared c_gst_video_info_to_capsFn c_gst_video_info_to_caps; ///
private alias c_gst_video_info_from_capsFn = extern(C) gboolean function(GstVideoInfo* info, const(GstCaps)* caps) nothrow;
__gshared c_gst_video_info_from_capsFn c_gst_video_info_from_caps; ///
private alias c_gst_video_info_initFn = extern(C) void function(GstVideoInfo* info) nothrow;
__gshared c_gst_video_info_initFn c_gst_video_info_init; ///

// VideoInfoDmaDrm
private alias c_gst_video_info_dma_drm_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_info_dma_drm_get_typeFn c_gst_video_info_dma_drm_get_type; ///
private alias c_gst_video_info_dma_drm_newFn = extern(C) GstVideoInfoDmaDrm* function() nothrow;
__gshared c_gst_video_info_dma_drm_newFn c_gst_video_info_dma_drm_new; ///
private alias c_gst_video_info_dma_drm_new_from_capsFn = extern(C) GstVideoInfoDmaDrm* function(const(GstCaps)* caps) nothrow;
__gshared c_gst_video_info_dma_drm_new_from_capsFn c_gst_video_info_dma_drm_new_from_caps; ///
private alias c_gst_video_info_dma_drm_freeFn = extern(C) void function(GstVideoInfoDmaDrm* drmInfo) nothrow;
__gshared c_gst_video_info_dma_drm_freeFn c_gst_video_info_dma_drm_free; ///
private alias c_gst_video_info_dma_drm_to_capsFn = extern(C) GstCaps* function(const(GstVideoInfoDmaDrm)* drmInfo) nothrow;
__gshared c_gst_video_info_dma_drm_to_capsFn c_gst_video_info_dma_drm_to_caps; ///
private alias c_gst_video_info_dma_drm_to_video_infoFn = extern(C) gboolean function(const(GstVideoInfoDmaDrm)* drmInfo, GstVideoInfo* info) nothrow;
__gshared c_gst_video_info_dma_drm_to_video_infoFn c_gst_video_info_dma_drm_to_video_info; ///
private alias c_gst_video_info_dma_drm_from_capsFn = extern(C) gboolean function(GstVideoInfoDmaDrm* drmInfo, const(GstCaps)* caps) nothrow;
__gshared c_gst_video_info_dma_drm_from_capsFn c_gst_video_info_dma_drm_from_caps; ///
private alias c_gst_video_info_dma_drm_from_video_infoFn = extern(C) gboolean function(GstVideoInfoDmaDrm* drmInfo, const(GstVideoInfo)* info, ulong modifier) nothrow;
__gshared c_gst_video_info_dma_drm_from_video_infoFn c_gst_video_info_dma_drm_from_video_info; ///
private alias c_gst_video_info_dma_drm_initFn = extern(C) void function(GstVideoInfoDmaDrm* drmInfo) nothrow;
__gshared c_gst_video_info_dma_drm_initFn c_gst_video_info_dma_drm_init; ///

// VideoMasteringDisplayInfo
private alias c_gst_video_mastering_display_info_add_to_capsFn = extern(C) gboolean function(const(GstVideoMasteringDisplayInfo)* minfo, GstCaps* caps) nothrow;
__gshared c_gst_video_mastering_display_info_add_to_capsFn c_gst_video_mastering_display_info_add_to_caps; ///
private alias c_gst_video_mastering_display_info_from_capsFn = extern(C) gboolean function(GstVideoMasteringDisplayInfo* minfo, const(GstCaps)* caps) nothrow;
__gshared c_gst_video_mastering_display_info_from_capsFn c_gst_video_mastering_display_info_from_caps; ///
private alias c_gst_video_mastering_display_info_initFn = extern(C) void function(GstVideoMasteringDisplayInfo* minfo) nothrow;
__gshared c_gst_video_mastering_display_info_initFn c_gst_video_mastering_display_info_init; ///
private alias c_gst_video_mastering_display_info_is_equalFn = extern(C) gboolean function(const(GstVideoMasteringDisplayInfo)* minfo, const(GstVideoMasteringDisplayInfo)* other) nothrow;
__gshared c_gst_video_mastering_display_info_is_equalFn c_gst_video_mastering_display_info_is_equal; ///
private alias c_gst_video_mastering_display_info_to_stringFn = extern(C) char* function(const(GstVideoMasteringDisplayInfo)* minfo) nothrow;
__gshared c_gst_video_mastering_display_info_to_stringFn c_gst_video_mastering_display_info_to_string; ///
private alias c_gst_video_mastering_display_info_from_stringFn = extern(C) gboolean function(GstVideoMasteringDisplayInfo* minfo, const(char)* mastering) nothrow;
__gshared c_gst_video_mastering_display_info_from_stringFn c_gst_video_mastering_display_info_from_string; ///

// VideoMeta
private alias c_gst_video_meta_get_plane_heightFn = extern(C) gboolean function(GstVideoMeta* meta, uint* planeHeight) nothrow;
__gshared c_gst_video_meta_get_plane_heightFn c_gst_video_meta_get_plane_height; ///
private alias c_gst_video_meta_get_plane_sizeFn = extern(C) gboolean function(GstVideoMeta* meta, size_t* planeSize) nothrow;
__gshared c_gst_video_meta_get_plane_sizeFn c_gst_video_meta_get_plane_size; ///
private alias c_gst_video_meta_mapFn = extern(C) gboolean function(GstVideoMeta* meta, uint plane, GstMapInfo* info, void** data, int* stride, GstMapFlags flags) nothrow;
__gshared c_gst_video_meta_mapFn c_gst_video_meta_map; ///
private alias c_gst_video_meta_set_alignmentFn = extern(C) gboolean function(GstVideoMeta* meta, GstVideoAlignment alignment) nothrow;
__gshared c_gst_video_meta_set_alignmentFn c_gst_video_meta_set_alignment; ///
private alias c_gst_video_meta_set_alignment_fullFn = extern(C) gboolean function(GstVideoMeta* meta, const(GstVideoAlignment)* alignment) nothrow;
__gshared c_gst_video_meta_set_alignment_fullFn c_gst_video_meta_set_alignment_full; ///
private alias c_gst_video_meta_unmapFn = extern(C) gboolean function(GstVideoMeta* meta, uint plane, GstMapInfo* info) nothrow;
__gshared c_gst_video_meta_unmapFn c_gst_video_meta_unmap; ///
private alias c_gst_video_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_meta_get_infoFn c_gst_video_meta_get_info; ///

// VideoMetaTransform
private alias c_gst_video_meta_transform_scale_get_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_video_meta_transform_scale_get_quarkFn c_gst_video_meta_transform_scale_get_quark; ///

// VideoMetaTransformMatrix
private alias c_gst_video_meta_transform_matrix_initFn = extern(C) void function(GstVideoMetaTransformMatrix* trans, const(GstVideoInfo)* inInfo, const(GstVideoRectangle)* inRectangle, const(GstVideoInfo)* outInfo, const(GstVideoRectangle)* outRectangle) nothrow;
__gshared c_gst_video_meta_transform_matrix_initFn c_gst_video_meta_transform_matrix_init; ///
private alias c_gst_video_meta_transform_matrix_pointFn = extern(C) gboolean function(const(GstVideoMetaTransformMatrix)* transform, int* x, int* y) nothrow;
__gshared c_gst_video_meta_transform_matrix_pointFn c_gst_video_meta_transform_matrix_point; ///
private alias c_gst_video_meta_transform_matrix_point_clippedFn = extern(C) gboolean function(const(GstVideoMetaTransformMatrix)* transform, int* x, int* y) nothrow;
__gshared c_gst_video_meta_transform_matrix_point_clippedFn c_gst_video_meta_transform_matrix_point_clipped; ///
private alias c_gst_video_meta_transform_matrix_rectangleFn = extern(C) gboolean function(const(GstVideoMetaTransformMatrix)* transform, GstVideoRectangle* rect) nothrow;
__gshared c_gst_video_meta_transform_matrix_rectangleFn c_gst_video_meta_transform_matrix_rectangle; ///
private alias c_gst_video_meta_transform_matrix_rectangle_clippedFn = extern(C) gboolean function(const(GstVideoMetaTransformMatrix)* transform, GstVideoRectangle* rect) nothrow;
__gshared c_gst_video_meta_transform_matrix_rectangle_clippedFn c_gst_video_meta_transform_matrix_rectangle_clipped; ///
private alias c_gst_video_meta_transform_matrix_get_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_video_meta_transform_matrix_get_quarkFn c_gst_video_meta_transform_matrix_get_quark; ///

// VideoMultiviewFlagsSet
private alias c_gst_video_multiview_flagset_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_multiview_flagset_get_typeFn c_gst_video_multiview_flagset_get_type; ///

// VideoOrientation
private alias c_gst_video_orientation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_orientation_get_typeFn c_gst_video_orientation_get_type; ///
private alias c_gst_video_orientation_from_tagFn = extern(C) gboolean function(GstTagList* taglist, GstVideoOrientationMethod* method) nothrow;
__gshared c_gst_video_orientation_from_tagFn c_gst_video_orientation_from_tag; ///
private alias c_gst_video_orientation_get_hcenterFn = extern(C) gboolean function(GstVideoOrientation* videoOrientation, int* center) nothrow;
__gshared c_gst_video_orientation_get_hcenterFn c_gst_video_orientation_get_hcenter; ///
private alias c_gst_video_orientation_get_hflipFn = extern(C) gboolean function(GstVideoOrientation* videoOrientation, gboolean* flip) nothrow;
__gshared c_gst_video_orientation_get_hflipFn c_gst_video_orientation_get_hflip; ///
private alias c_gst_video_orientation_get_vcenterFn = extern(C) gboolean function(GstVideoOrientation* videoOrientation, int* center) nothrow;
__gshared c_gst_video_orientation_get_vcenterFn c_gst_video_orientation_get_vcenter; ///
private alias c_gst_video_orientation_get_vflipFn = extern(C) gboolean function(GstVideoOrientation* videoOrientation, gboolean* flip) nothrow;
__gshared c_gst_video_orientation_get_vflipFn c_gst_video_orientation_get_vflip; ///
private alias c_gst_video_orientation_set_hcenterFn = extern(C) gboolean function(GstVideoOrientation* videoOrientation, int center) nothrow;
__gshared c_gst_video_orientation_set_hcenterFn c_gst_video_orientation_set_hcenter; ///
private alias c_gst_video_orientation_set_hflipFn = extern(C) gboolean function(GstVideoOrientation* videoOrientation, gboolean flip) nothrow;
__gshared c_gst_video_orientation_set_hflipFn c_gst_video_orientation_set_hflip; ///
private alias c_gst_video_orientation_set_vcenterFn = extern(C) gboolean function(GstVideoOrientation* videoOrientation, int center) nothrow;
__gshared c_gst_video_orientation_set_vcenterFn c_gst_video_orientation_set_vcenter; ///
private alias c_gst_video_orientation_set_vflipFn = extern(C) gboolean function(GstVideoOrientation* videoOrientation, gboolean flip) nothrow;
__gshared c_gst_video_orientation_set_vflipFn c_gst_video_orientation_set_vflip; ///

// VideoOverlay
private alias c_gst_video_overlay_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_overlay_get_typeFn c_gst_video_overlay_get_type; ///
private alias c_gst_video_overlay_install_propertiesFn = extern(C) void function(GObjectClass* oclass, int lastPropId) nothrow;
__gshared c_gst_video_overlay_install_propertiesFn c_gst_video_overlay_install_properties; ///
private alias c_gst_video_overlay_set_propertyFn = extern(C) gboolean function(GObject* object, int lastPropId, uint propertyId, const(GValue)* value) nothrow;
__gshared c_gst_video_overlay_set_propertyFn c_gst_video_overlay_set_property; ///
private alias c_gst_video_overlay_exposeFn = extern(C) void function(GstVideoOverlay* overlay) nothrow;
__gshared c_gst_video_overlay_exposeFn c_gst_video_overlay_expose; ///
private alias c_gst_video_overlay_got_window_handleFn = extern(C) void function(GstVideoOverlay* overlay, size_t handle) nothrow;
__gshared c_gst_video_overlay_got_window_handleFn c_gst_video_overlay_got_window_handle; ///
private alias c_gst_video_overlay_handle_eventsFn = extern(C) void function(GstVideoOverlay* overlay, gboolean handleEvents) nothrow;
__gshared c_gst_video_overlay_handle_eventsFn c_gst_video_overlay_handle_events; ///
private alias c_gst_video_overlay_prepare_window_handleFn = extern(C) void function(GstVideoOverlay* overlay) nothrow;
__gshared c_gst_video_overlay_prepare_window_handleFn c_gst_video_overlay_prepare_window_handle; ///
private alias c_gst_video_overlay_set_render_rectangleFn = extern(C) gboolean function(GstVideoOverlay* overlay, int x, int y, int width, int height) nothrow;
__gshared c_gst_video_overlay_set_render_rectangleFn c_gst_video_overlay_set_render_rectangle; ///
private alias c_gst_video_overlay_set_window_handleFn = extern(C) void function(GstVideoOverlay* overlay, size_t handle) nothrow;
__gshared c_gst_video_overlay_set_window_handleFn c_gst_video_overlay_set_window_handle; ///

// VideoOverlayComposition
private alias c_gst_video_overlay_composition_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_overlay_composition_get_typeFn c_gst_video_overlay_composition_get_type; ///
private alias c_gst_video_overlay_composition_newFn = extern(C) GstVideoOverlayComposition* function(GstVideoOverlayRectangle* rectangle) nothrow;
__gshared c_gst_video_overlay_composition_newFn c_gst_video_overlay_composition_new; ///
private alias c_gst_video_overlay_composition_add_rectangleFn = extern(C) void function(GstVideoOverlayComposition* comp, GstVideoOverlayRectangle* rectangle) nothrow;
__gshared c_gst_video_overlay_composition_add_rectangleFn c_gst_video_overlay_composition_add_rectangle; ///
private alias c_gst_video_overlay_composition_blendFn = extern(C) gboolean function(GstVideoOverlayComposition* comp, GstVideoFrame* videoBuf) nothrow;
__gshared c_gst_video_overlay_composition_blendFn c_gst_video_overlay_composition_blend; ///
private alias c_gst_video_overlay_composition_copyFn = extern(C) GstVideoOverlayComposition* function(GstVideoOverlayComposition* comp) nothrow;
__gshared c_gst_video_overlay_composition_copyFn c_gst_video_overlay_composition_copy; ///
private alias c_gst_video_overlay_composition_get_rectangleFn = extern(C) GstVideoOverlayRectangle* function(GstVideoOverlayComposition* comp, uint n) nothrow;
__gshared c_gst_video_overlay_composition_get_rectangleFn c_gst_video_overlay_composition_get_rectangle; ///
private alias c_gst_video_overlay_composition_get_seqnumFn = extern(C) uint function(GstVideoOverlayComposition* comp) nothrow;
__gshared c_gst_video_overlay_composition_get_seqnumFn c_gst_video_overlay_composition_get_seqnum; ///
private alias c_gst_video_overlay_composition_make_writableFn = extern(C) GstVideoOverlayComposition* function(GstVideoOverlayComposition* comp) nothrow;
__gshared c_gst_video_overlay_composition_make_writableFn c_gst_video_overlay_composition_make_writable; ///
private alias c_gst_video_overlay_composition_n_rectanglesFn = extern(C) uint function(GstVideoOverlayComposition* comp) nothrow;
__gshared c_gst_video_overlay_composition_n_rectanglesFn c_gst_video_overlay_composition_n_rectangles; ///

// VideoOverlayCompositionMeta
private alias c_gst_video_overlay_composition_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_overlay_composition_meta_get_infoFn c_gst_video_overlay_composition_meta_get_info; ///

// VideoOverlayRectangle
private alias c_gst_video_overlay_rectangle_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_overlay_rectangle_get_typeFn c_gst_video_overlay_rectangle_get_type; ///
private alias c_gst_video_overlay_rectangle_new_rawFn = extern(C) GstVideoOverlayRectangle* function(GstBuffer* pixels, int renderX, int renderY, uint renderWidth, uint renderHeight, GstVideoOverlayFormatFlags flags) nothrow;
__gshared c_gst_video_overlay_rectangle_new_rawFn c_gst_video_overlay_rectangle_new_raw; ///
private alias c_gst_video_overlay_rectangle_copyFn = extern(C) GstVideoOverlayRectangle* function(GstVideoOverlayRectangle* rectangle) nothrow;
__gshared c_gst_video_overlay_rectangle_copyFn c_gst_video_overlay_rectangle_copy; ///
private alias c_gst_video_overlay_rectangle_get_flagsFn = extern(C) GstVideoOverlayFormatFlags function(GstVideoOverlayRectangle* rectangle) nothrow;
__gshared c_gst_video_overlay_rectangle_get_flagsFn c_gst_video_overlay_rectangle_get_flags; ///
private alias c_gst_video_overlay_rectangle_get_global_alphaFn = extern(C) float function(GstVideoOverlayRectangle* rectangle) nothrow;
__gshared c_gst_video_overlay_rectangle_get_global_alphaFn c_gst_video_overlay_rectangle_get_global_alpha; ///
private alias c_gst_video_overlay_rectangle_get_pixels_argbFn = extern(C) GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) nothrow;
__gshared c_gst_video_overlay_rectangle_get_pixels_argbFn c_gst_video_overlay_rectangle_get_pixels_argb; ///
private alias c_gst_video_overlay_rectangle_get_pixels_ayuvFn = extern(C) GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) nothrow;
__gshared c_gst_video_overlay_rectangle_get_pixels_ayuvFn c_gst_video_overlay_rectangle_get_pixels_ayuv; ///
private alias c_gst_video_overlay_rectangle_get_pixels_rawFn = extern(C) GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) nothrow;
__gshared c_gst_video_overlay_rectangle_get_pixels_rawFn c_gst_video_overlay_rectangle_get_pixels_raw; ///
private alias c_gst_video_overlay_rectangle_get_pixels_unscaled_argbFn = extern(C) GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) nothrow;
__gshared c_gst_video_overlay_rectangle_get_pixels_unscaled_argbFn c_gst_video_overlay_rectangle_get_pixels_unscaled_argb; ///
private alias c_gst_video_overlay_rectangle_get_pixels_unscaled_ayuvFn = extern(C) GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) nothrow;
__gshared c_gst_video_overlay_rectangle_get_pixels_unscaled_ayuvFn c_gst_video_overlay_rectangle_get_pixels_unscaled_ayuv; ///
private alias c_gst_video_overlay_rectangle_get_pixels_unscaled_rawFn = extern(C) GstBuffer* function(GstVideoOverlayRectangle* rectangle, GstVideoOverlayFormatFlags flags) nothrow;
__gshared c_gst_video_overlay_rectangle_get_pixels_unscaled_rawFn c_gst_video_overlay_rectangle_get_pixels_unscaled_raw; ///
private alias c_gst_video_overlay_rectangle_get_render_rectangleFn = extern(C) gboolean function(GstVideoOverlayRectangle* rectangle, int* renderX, int* renderY, uint* renderWidth, uint* renderHeight) nothrow;
__gshared c_gst_video_overlay_rectangle_get_render_rectangleFn c_gst_video_overlay_rectangle_get_render_rectangle; ///
private alias c_gst_video_overlay_rectangle_get_seqnumFn = extern(C) uint function(GstVideoOverlayRectangle* rectangle) nothrow;
__gshared c_gst_video_overlay_rectangle_get_seqnumFn c_gst_video_overlay_rectangle_get_seqnum; ///
private alias c_gst_video_overlay_rectangle_set_global_alphaFn = extern(C) void function(GstVideoOverlayRectangle* rectangle, float globalAlpha) nothrow;
__gshared c_gst_video_overlay_rectangle_set_global_alphaFn c_gst_video_overlay_rectangle_set_global_alpha; ///
private alias c_gst_video_overlay_rectangle_set_render_rectangleFn = extern(C) void function(GstVideoOverlayRectangle* rectangle, int renderX, int renderY, uint renderWidth, uint renderHeight) nothrow;
__gshared c_gst_video_overlay_rectangle_set_render_rectangleFn c_gst_video_overlay_rectangle_set_render_rectangle; ///

// VideoRegionOfInterestMeta
private alias c_gst_video_region_of_interest_meta_add_paramFn = extern(C) void function(GstVideoRegionOfInterestMeta* meta, GstStructure* s) nothrow;
__gshared c_gst_video_region_of_interest_meta_add_paramFn c_gst_video_region_of_interest_meta_add_param; ///
private alias c_gst_video_region_of_interest_meta_get_paramFn = extern(C) GstStructure* function(GstVideoRegionOfInterestMeta* meta, const(char)* name) nothrow;
__gshared c_gst_video_region_of_interest_meta_get_paramFn c_gst_video_region_of_interest_meta_get_param; ///
private alias c_gst_video_region_of_interest_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_region_of_interest_meta_get_infoFn c_gst_video_region_of_interest_meta_get_info; ///

// VideoResampler
private alias c_gst_video_resampler_clearFn = extern(C) void function(GstVideoResampler* resampler) nothrow;
__gshared c_gst_video_resampler_clearFn c_gst_video_resampler_clear; ///
private alias c_gst_video_resampler_initFn = extern(C) gboolean function(GstVideoResampler* resampler, GstVideoResamplerMethod method, GstVideoResamplerFlags flags, uint nPhases, uint nTaps, double shift, uint inSize, uint outSize, GstStructure* options) nothrow;
__gshared c_gst_video_resampler_initFn c_gst_video_resampler_init; ///

// VideoSEIUserDataUnregisteredMeta
private alias c_gst_video_sei_user_data_unregistered_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_sei_user_data_unregistered_meta_get_infoFn c_gst_video_sei_user_data_unregistered_meta_get_info; ///

// VideoScaler
private alias c_gst_video_scaler_2dFn = extern(C) void function(GstVideoScaler* hscale, GstVideoScaler* vscale, GstVideoFormat format, void* src, int srcStride, void* dest, int destStride, uint x, uint y, uint width, uint height) nothrow;
__gshared c_gst_video_scaler_2dFn c_gst_video_scaler_2d; ///
private alias c_gst_video_scaler_combine_packed_YUVFn = extern(C) GstVideoScaler* function(GstVideoScaler* yScale, GstVideoScaler* uvScale, GstVideoFormat inFormat, GstVideoFormat outFormat) nothrow;
__gshared c_gst_video_scaler_combine_packed_YUVFn c_gst_video_scaler_combine_packed_YUV; ///
private alias c_gst_video_scaler_freeFn = extern(C) void function(GstVideoScaler* scale) nothrow;
__gshared c_gst_video_scaler_freeFn c_gst_video_scaler_free; ///
private alias c_gst_video_scaler_get_coeffFn = extern(C) const(double)* function(GstVideoScaler* scale, uint outOffset, uint* inOffset, uint* nTaps) nothrow;
__gshared c_gst_video_scaler_get_coeffFn c_gst_video_scaler_get_coeff; ///
private alias c_gst_video_scaler_get_max_tapsFn = extern(C) uint function(GstVideoScaler* scale) nothrow;
__gshared c_gst_video_scaler_get_max_tapsFn c_gst_video_scaler_get_max_taps; ///
private alias c_gst_video_scaler_horizontalFn = extern(C) void function(GstVideoScaler* scale, GstVideoFormat format, void* src, void* dest, uint destOffset, uint width) nothrow;
__gshared c_gst_video_scaler_horizontalFn c_gst_video_scaler_horizontal; ///
private alias c_gst_video_scaler_verticalFn = extern(C) void function(GstVideoScaler* scale, GstVideoFormat format, void** srcLines, void* dest, uint destOffset, uint width) nothrow;
__gshared c_gst_video_scaler_verticalFn c_gst_video_scaler_vertical; ///
private alias c_gst_video_scaler_newFn = extern(C) GstVideoScaler* function(GstVideoResamplerMethod method, GstVideoScalerFlags flags, uint nTaps, uint inSize, uint outSize, GstStructure* options) nothrow;
__gshared c_gst_video_scaler_newFn c_gst_video_scaler_new; ///

// VideoSink
private alias c_gst_video_sink_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_sink_get_typeFn c_gst_video_sink_get_type; ///
private alias c_gst_video_sink_center_rectFn = extern(C) void function(GstVideoRectangle src, GstVideoRectangle dst, GstVideoRectangle* result, gboolean scaling) nothrow;
__gshared c_gst_video_sink_center_rectFn c_gst_video_sink_center_rect; ///

// VideoTimeCode
private alias c_gst_video_time_code_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_time_code_get_typeFn c_gst_video_time_code_get_type; ///
private alias c_gst_video_time_code_newFn = extern(C) GstVideoTimeCode* function(uint fpsN, uint fpsD, GDateTime* latestDailyJam, GstVideoTimeCodeFlags flags, uint hours, uint minutes, uint seconds, uint frames, uint fieldCount) nothrow;
__gshared c_gst_video_time_code_newFn c_gst_video_time_code_new; ///
private alias c_gst_video_time_code_new_emptyFn = extern(C) GstVideoTimeCode* function() nothrow;
__gshared c_gst_video_time_code_new_emptyFn c_gst_video_time_code_new_empty; ///
private alias c_gst_video_time_code_new_from_date_timeFn = extern(C) GstVideoTimeCode* function(uint fpsN, uint fpsD, GDateTime* dt, GstVideoTimeCodeFlags flags, uint fieldCount) nothrow;
__gshared c_gst_video_time_code_new_from_date_timeFn c_gst_video_time_code_new_from_date_time; ///
private alias c_gst_video_time_code_new_from_date_time_fullFn = extern(C) GstVideoTimeCode* function(uint fpsN, uint fpsD, GDateTime* dt, GstVideoTimeCodeFlags flags, uint fieldCount) nothrow;
__gshared c_gst_video_time_code_new_from_date_time_fullFn c_gst_video_time_code_new_from_date_time_full; ///
private alias c_gst_video_time_code_new_from_stringFn = extern(C) GstVideoTimeCode* function(const(char)* tcStr) nothrow;
__gshared c_gst_video_time_code_new_from_stringFn c_gst_video_time_code_new_from_string; ///
private alias c_gst_video_time_code_add_framesFn = extern(C) void function(GstVideoTimeCode* tc, long frames) nothrow;
__gshared c_gst_video_time_code_add_framesFn c_gst_video_time_code_add_frames; ///
private alias c_gst_video_time_code_add_intervalFn = extern(C) GstVideoTimeCode* function(const(GstVideoTimeCode)* tc, const(GstVideoTimeCodeInterval)* tcInter) nothrow;
__gshared c_gst_video_time_code_add_intervalFn c_gst_video_time_code_add_interval; ///
private alias c_gst_video_time_code_clearFn = extern(C) void function(GstVideoTimeCode* tc) nothrow;
__gshared c_gst_video_time_code_clearFn c_gst_video_time_code_clear; ///
private alias c_gst_video_time_code_compareFn = extern(C) int function(const(GstVideoTimeCode)* tc1, const(GstVideoTimeCode)* tc2) nothrow;
__gshared c_gst_video_time_code_compareFn c_gst_video_time_code_compare; ///
private alias c_gst_video_time_code_copyFn = extern(C) GstVideoTimeCode* function(const(GstVideoTimeCode)* tc) nothrow;
__gshared c_gst_video_time_code_copyFn c_gst_video_time_code_copy; ///
private alias c_gst_video_time_code_frames_since_daily_jamFn = extern(C) ulong function(const(GstVideoTimeCode)* tc) nothrow;
__gshared c_gst_video_time_code_frames_since_daily_jamFn c_gst_video_time_code_frames_since_daily_jam; ///
private alias c_gst_video_time_code_freeFn = extern(C) void function(GstVideoTimeCode* tc) nothrow;
__gshared c_gst_video_time_code_freeFn c_gst_video_time_code_free; ///
private alias c_gst_video_time_code_increment_frameFn = extern(C) void function(GstVideoTimeCode* tc) nothrow;
__gshared c_gst_video_time_code_increment_frameFn c_gst_video_time_code_increment_frame; ///
private alias c_gst_video_time_code_initFn = extern(C) void function(GstVideoTimeCode* tc, uint fpsN, uint fpsD, GDateTime* latestDailyJam, GstVideoTimeCodeFlags flags, uint hours, uint minutes, uint seconds, uint frames, uint fieldCount) nothrow;
__gshared c_gst_video_time_code_initFn c_gst_video_time_code_init; ///
private alias c_gst_video_time_code_init_from_date_timeFn = extern(C) void function(GstVideoTimeCode* tc, uint fpsN, uint fpsD, GDateTime* dt, GstVideoTimeCodeFlags flags, uint fieldCount) nothrow;
__gshared c_gst_video_time_code_init_from_date_timeFn c_gst_video_time_code_init_from_date_time; ///
private alias c_gst_video_time_code_init_from_date_time_fullFn = extern(C) gboolean function(GstVideoTimeCode* tc, uint fpsN, uint fpsD, GDateTime* dt, GstVideoTimeCodeFlags flags, uint fieldCount) nothrow;
__gshared c_gst_video_time_code_init_from_date_time_fullFn c_gst_video_time_code_init_from_date_time_full; ///
private alias c_gst_video_time_code_is_validFn = extern(C) gboolean function(const(GstVideoTimeCode)* tc) nothrow;
__gshared c_gst_video_time_code_is_validFn c_gst_video_time_code_is_valid; ///
private alias c_gst_video_time_code_nsec_since_daily_jamFn = extern(C) ulong function(const(GstVideoTimeCode)* tc) nothrow;
__gshared c_gst_video_time_code_nsec_since_daily_jamFn c_gst_video_time_code_nsec_since_daily_jam; ///
private alias c_gst_video_time_code_to_date_timeFn = extern(C) GDateTime* function(const(GstVideoTimeCode)* tc) nothrow;
__gshared c_gst_video_time_code_to_date_timeFn c_gst_video_time_code_to_date_time; ///
private alias c_gst_video_time_code_to_stringFn = extern(C) char* function(const(GstVideoTimeCode)* tc) nothrow;
__gshared c_gst_video_time_code_to_stringFn c_gst_video_time_code_to_string; ///

// VideoTimeCodeInterval
private alias c_gst_video_time_code_interval_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_time_code_interval_get_typeFn c_gst_video_time_code_interval_get_type; ///
private alias c_gst_video_time_code_interval_newFn = extern(C) GstVideoTimeCodeInterval* function(uint hours, uint minutes, uint seconds, uint frames) nothrow;
__gshared c_gst_video_time_code_interval_newFn c_gst_video_time_code_interval_new; ///
private alias c_gst_video_time_code_interval_new_from_stringFn = extern(C) GstVideoTimeCodeInterval* function(const(char)* tcInterStr) nothrow;
__gshared c_gst_video_time_code_interval_new_from_stringFn c_gst_video_time_code_interval_new_from_string; ///
private alias c_gst_video_time_code_interval_clearFn = extern(C) void function(GstVideoTimeCodeInterval* tc) nothrow;
__gshared c_gst_video_time_code_interval_clearFn c_gst_video_time_code_interval_clear; ///
private alias c_gst_video_time_code_interval_copyFn = extern(C) GstVideoTimeCodeInterval* function(const(GstVideoTimeCodeInterval)* tc) nothrow;
__gshared c_gst_video_time_code_interval_copyFn c_gst_video_time_code_interval_copy; ///
private alias c_gst_video_time_code_interval_freeFn = extern(C) void function(GstVideoTimeCodeInterval* tc) nothrow;
__gshared c_gst_video_time_code_interval_freeFn c_gst_video_time_code_interval_free; ///
private alias c_gst_video_time_code_interval_initFn = extern(C) void function(GstVideoTimeCodeInterval* tc, uint hours, uint minutes, uint seconds, uint frames) nothrow;
__gshared c_gst_video_time_code_interval_initFn c_gst_video_time_code_interval_init; ///

// VideoTimeCodeMeta
private alias c_gst_video_time_code_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_video_time_code_meta_get_infoFn c_gst_video_time_code_meta_get_info; ///

// VideoVBIEncoder
private alias c_gst_video_vbi_encoder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_vbi_encoder_get_typeFn c_gst_video_vbi_encoder_get_type; ///
private alias c_gst_video_vbi_encoder_newFn = extern(C) GstVideoVBIEncoder* function(GstVideoFormat format, uint pixelWidth) nothrow;
__gshared c_gst_video_vbi_encoder_newFn c_gst_video_vbi_encoder_new; ///
private alias c_gst_video_vbi_encoder_add_ancillaryFn = extern(C) gboolean function(GstVideoVBIEncoder* encoder, gboolean composite, ubyte DID, ubyte SDIDBlockNumber, const(ubyte)* data, uint dataCount) nothrow;
__gshared c_gst_video_vbi_encoder_add_ancillaryFn c_gst_video_vbi_encoder_add_ancillary; ///
private alias c_gst_video_vbi_encoder_copyFn = extern(C) GstVideoVBIEncoder* function(const(GstVideoVBIEncoder)* encoder) nothrow;
__gshared c_gst_video_vbi_encoder_copyFn c_gst_video_vbi_encoder_copy; ///
private alias c_gst_video_vbi_encoder_freeFn = extern(C) void function(GstVideoVBIEncoder* encoder) nothrow;
__gshared c_gst_video_vbi_encoder_freeFn c_gst_video_vbi_encoder_free; ///
private alias c_gst_video_vbi_encoder_write_lineFn = extern(C) void function(GstVideoVBIEncoder* encoder, ubyte* data) nothrow;
__gshared c_gst_video_vbi_encoder_write_lineFn c_gst_video_vbi_encoder_write_line; ///

// VideoVBIParser
private alias c_gst_video_vbi_parser_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_vbi_parser_get_typeFn c_gst_video_vbi_parser_get_type; ///
private alias c_gst_video_vbi_parser_newFn = extern(C) GstVideoVBIParser* function(GstVideoFormat format, uint pixelWidth) nothrow;
__gshared c_gst_video_vbi_parser_newFn c_gst_video_vbi_parser_new; ///
private alias c_gst_video_vbi_parser_add_lineFn = extern(C) void function(GstVideoVBIParser* parser, const(ubyte)* data) nothrow;
__gshared c_gst_video_vbi_parser_add_lineFn c_gst_video_vbi_parser_add_line; ///
private alias c_gst_video_vbi_parser_copyFn = extern(C) GstVideoVBIParser* function(const(GstVideoVBIParser)* parser) nothrow;
__gshared c_gst_video_vbi_parser_copyFn c_gst_video_vbi_parser_copy; ///
private alias c_gst_video_vbi_parser_freeFn = extern(C) void function(GstVideoVBIParser* parser) nothrow;
__gshared c_gst_video_vbi_parser_freeFn c_gst_video_vbi_parser_free; ///
private alias c_gst_video_vbi_parser_get_ancillaryFn = extern(C) GstVideoVBIParserResult function(GstVideoVBIParser* parser, GstVideoAncillary* anc) nothrow;
__gshared c_gst_video_vbi_parser_get_ancillaryFn c_gst_video_vbi_parser_get_ancillary; ///

// global
private alias c_gst_ancillary_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_ancillary_meta_api_get_typeFn c_gst_ancillary_meta_api_get_type; ///
private alias c_gst_buffer_add_ancillary_metaFn = extern(C) GstAncillaryMeta* function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_add_ancillary_metaFn c_gst_buffer_add_ancillary_meta; ///
private alias c_gst_buffer_add_video_afd_metaFn = extern(C) GstVideoAFDMeta* function(GstBuffer* buffer, ubyte field, GstVideoAFDSpec spec, GstVideoAFDValue afd) nothrow;
__gshared c_gst_buffer_add_video_afd_metaFn c_gst_buffer_add_video_afd_meta; ///
private alias c_gst_buffer_add_video_affine_transformation_metaFn = extern(C) GstVideoAffineTransformationMeta* function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_add_video_affine_transformation_metaFn c_gst_buffer_add_video_affine_transformation_meta; ///
private alias c_gst_buffer_add_video_bar_metaFn = extern(C) GstVideoBarMeta* function(GstBuffer* buffer, ubyte field, gboolean isLetterbox, uint barData1, uint barData2) nothrow;
__gshared c_gst_buffer_add_video_bar_metaFn c_gst_buffer_add_video_bar_meta; ///
private alias c_gst_buffer_add_video_caption_metaFn = extern(C) GstVideoCaptionMeta* function(GstBuffer* buffer, GstVideoCaptionType captionType, const(ubyte)* data, size_t size) nothrow;
__gshared c_gst_buffer_add_video_caption_metaFn c_gst_buffer_add_video_caption_meta; ///
private alias c_gst_buffer_add_video_codec_alpha_metaFn = extern(C) GstVideoCodecAlphaMeta* function(GstBuffer* buffer, GstBuffer* alphaBuffer) nothrow;
__gshared c_gst_buffer_add_video_codec_alpha_metaFn c_gst_buffer_add_video_codec_alpha_meta; ///
private alias c_gst_buffer_add_video_gl_texture_upload_metaFn = extern(C) GstVideoGLTextureUploadMeta* function(GstBuffer* buffer, GstVideoGLTextureOrientation textureOrientation, uint nTextures, GstVideoGLTextureType* textureType, GstVideoGLTextureUpload upload, void* userData, GBoxedCopyFunc userDataCopy, GBoxedFreeFunc userDataFree) nothrow;
__gshared c_gst_buffer_add_video_gl_texture_upload_metaFn c_gst_buffer_add_video_gl_texture_upload_meta; ///
private alias c_gst_buffer_add_video_metaFn = extern(C) GstVideoMeta* function(GstBuffer* buffer, GstVideoFrameFlags flags, GstVideoFormat format, uint width, uint height) nothrow;
__gshared c_gst_buffer_add_video_metaFn c_gst_buffer_add_video_meta; ///
private alias c_gst_buffer_add_video_meta_fullFn = extern(C) GstVideoMeta* function(GstBuffer* buffer, GstVideoFrameFlags flags, GstVideoFormat format, uint width, uint height, uint nPlanes, const(size_t)* offset, const(int)* stride) nothrow;
__gshared c_gst_buffer_add_video_meta_fullFn c_gst_buffer_add_video_meta_full; ///
private alias c_gst_buffer_add_video_overlay_composition_metaFn = extern(C) GstVideoOverlayCompositionMeta* function(GstBuffer* buf, GstVideoOverlayComposition* comp) nothrow;
__gshared c_gst_buffer_add_video_overlay_composition_metaFn c_gst_buffer_add_video_overlay_composition_meta; ///
private alias c_gst_buffer_add_video_region_of_interest_metaFn = extern(C) GstVideoRegionOfInterestMeta* function(GstBuffer* buffer, const(char)* roiType, uint x, uint y, uint w, uint h) nothrow;
__gshared c_gst_buffer_add_video_region_of_interest_metaFn c_gst_buffer_add_video_region_of_interest_meta; ///
private alias c_gst_buffer_add_video_region_of_interest_meta_idFn = extern(C) GstVideoRegionOfInterestMeta* function(GstBuffer* buffer, GQuark roiType, uint x, uint y, uint w, uint h) nothrow;
__gshared c_gst_buffer_add_video_region_of_interest_meta_idFn c_gst_buffer_add_video_region_of_interest_meta_id; ///
private alias c_gst_buffer_add_video_sei_user_data_unregistered_metaFn = extern(C) GstVideoSEIUserDataUnregisteredMeta* function(GstBuffer* buffer, ubyte* uuid, ubyte* data, size_t size) nothrow;
__gshared c_gst_buffer_add_video_sei_user_data_unregistered_metaFn c_gst_buffer_add_video_sei_user_data_unregistered_meta; ///
private alias c_gst_buffer_add_video_time_code_metaFn = extern(C) GstVideoTimeCodeMeta* function(GstBuffer* buffer, const(GstVideoTimeCode)* tc) nothrow;
__gshared c_gst_buffer_add_video_time_code_metaFn c_gst_buffer_add_video_time_code_meta; ///
private alias c_gst_buffer_add_video_time_code_meta_fullFn = extern(C) GstVideoTimeCodeMeta* function(GstBuffer* buffer, uint fpsN, uint fpsD, GDateTime* latestDailyJam, GstVideoTimeCodeFlags flags, uint hours, uint minutes, uint seconds, uint frames, uint fieldCount) nothrow;
__gshared c_gst_buffer_add_video_time_code_meta_fullFn c_gst_buffer_add_video_time_code_meta_full; ///
private alias c_gst_buffer_get_video_metaFn = extern(C) GstVideoMeta* function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_get_video_metaFn c_gst_buffer_get_video_meta; ///
private alias c_gst_buffer_get_video_meta_idFn = extern(C) GstVideoMeta* function(GstBuffer* buffer, int id) nothrow;
__gshared c_gst_buffer_get_video_meta_idFn c_gst_buffer_get_video_meta_id; ///
private alias c_gst_buffer_get_video_region_of_interest_meta_idFn = extern(C) GstVideoRegionOfInterestMeta* function(GstBuffer* buffer, int id) nothrow;
__gshared c_gst_buffer_get_video_region_of_interest_meta_idFn c_gst_buffer_get_video_region_of_interest_meta_id; ///
private alias c_gst_buffer_pool_config_get_video_alignmentFn = extern(C) gboolean function(const(GstStructure)* config, GstVideoAlignment* align_) nothrow;
__gshared c_gst_buffer_pool_config_get_video_alignmentFn c_gst_buffer_pool_config_get_video_alignment; ///
private alias c_gst_buffer_pool_config_set_video_alignmentFn = extern(C) void function(GstStructure* config, const(GstVideoAlignment)* align_) nothrow;
__gshared c_gst_buffer_pool_config_set_video_alignmentFn c_gst_buffer_pool_config_set_video_alignment; ///
private alias c_gst_is_video_overlay_prepare_window_handle_messageFn = extern(C) gboolean function(GstMessage* msg) nothrow;
__gshared c_gst_is_video_overlay_prepare_window_handle_messageFn c_gst_is_video_overlay_prepare_window_handle_message; ///
private alias c_gst_video_afd_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_afd_meta_api_get_typeFn c_gst_video_afd_meta_api_get_type; ///
private alias c_gst_video_affine_transformation_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_affine_transformation_meta_api_get_typeFn c_gst_video_affine_transformation_meta_api_get_type; ///
private alias c_gst_video_bar_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_bar_meta_api_get_typeFn c_gst_video_bar_meta_api_get_type; ///
private alias c_gst_video_blendFn = extern(C) gboolean function(GstVideoFrame* dest, GstVideoFrame* src, int x, int y, float globalAlpha) nothrow;
__gshared c_gst_video_blendFn c_gst_video_blend; ///
private alias c_gst_video_blend_scale_linear_RGBAFn = extern(C) void function(GstVideoInfo* src, GstBuffer* srcBuffer, int destHeight, int destWidth, GstVideoInfo* dest, GstBuffer** destBuffer) nothrow;
__gshared c_gst_video_blend_scale_linear_RGBAFn c_gst_video_blend_scale_linear_RGBA; ///
private alias c_gst_video_calculate_display_ratioFn = extern(C) gboolean function(uint* darN, uint* darD, uint videoWidth, uint videoHeight, uint videoParN, uint videoParD, uint displayParN, uint displayParD) nothrow;
__gshared c_gst_video_calculate_display_ratioFn c_gst_video_calculate_display_ratio; ///
private alias c_gst_video_caption_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_caption_meta_api_get_typeFn c_gst_video_caption_meta_api_get_type; ///
private alias c_gst_video_center_rectFn = extern(C) void function(const(GstVideoRectangle)* src, const(GstVideoRectangle)* dst, GstVideoRectangle* result, gboolean scaling) nothrow;
__gshared c_gst_video_center_rectFn c_gst_video_center_rect; ///
private alias c_gst_video_chroma_from_stringFn = extern(C) GstVideoChromaSite function(const(char)* s) nothrow;
__gshared c_gst_video_chroma_from_stringFn c_gst_video_chroma_from_string; ///
private alias c_gst_video_chroma_resampleFn = extern(C) void function(GstVideoChromaResample* resample, void** lines, int width) nothrow;
__gshared c_gst_video_chroma_resampleFn c_gst_video_chroma_resample; ///
private alias c_gst_video_chroma_to_stringFn = extern(C) const(char)* function(GstVideoChromaSite site) nothrow;
__gshared c_gst_video_chroma_to_stringFn c_gst_video_chroma_to_string; ///
private alias c_gst_video_codec_alpha_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_codec_alpha_meta_api_get_typeFn c_gst_video_codec_alpha_meta_api_get_type; ///
private alias c_gst_video_color_transfer_decodeFn = extern(C) double function(GstVideoTransferFunction func, double val) nothrow;
__gshared c_gst_video_color_transfer_decodeFn c_gst_video_color_transfer_decode; ///
private alias c_gst_video_color_transfer_encodeFn = extern(C) double function(GstVideoTransferFunction func, double val) nothrow;
__gshared c_gst_video_color_transfer_encodeFn c_gst_video_color_transfer_encode; ///
private alias c_gst_video_convert_sampleFn = extern(C) GstSample* function(GstSample* sample, const(GstCaps)* toCaps, GstClockTime timeout, GError** _err) nothrow;
__gshared c_gst_video_convert_sampleFn c_gst_video_convert_sample; ///
private alias c_gst_video_convert_sample_asyncFn = extern(C) void function(GstSample* sample, const(GstCaps)* toCaps, GstClockTime timeout, GstVideoConvertSampleCallback callback, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_video_convert_sample_asyncFn c_gst_video_convert_sample_async; ///
private alias c_gst_video_crop_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_crop_meta_api_get_typeFn c_gst_video_crop_meta_api_get_type; ///
private alias c_gst_video_dma_drm_format_from_gst_formatFn = extern(C) uint function(GstVideoFormat format, ulong* modifier) nothrow;
__gshared c_gst_video_dma_drm_format_from_gst_formatFn c_gst_video_dma_drm_format_from_gst_format; ///
private alias c_gst_video_dma_drm_format_to_gst_formatFn = extern(C) GstVideoFormat function(uint fourcc, ulong modifier) nothrow;
__gshared c_gst_video_dma_drm_format_to_gst_formatFn c_gst_video_dma_drm_format_to_gst_format; ///
private alias c_gst_video_dma_drm_fourcc_from_formatFn = extern(C) uint function(GstVideoFormat format) nothrow;
__gshared c_gst_video_dma_drm_fourcc_from_formatFn c_gst_video_dma_drm_fourcc_from_format; ///
private alias c_gst_video_dma_drm_fourcc_from_stringFn = extern(C) uint function(const(char)* formatStr, ulong* modifier) nothrow;
__gshared c_gst_video_dma_drm_fourcc_from_stringFn c_gst_video_dma_drm_fourcc_from_string; ///
private alias c_gst_video_dma_drm_fourcc_to_formatFn = extern(C) GstVideoFormat function(uint fourcc) nothrow;
__gshared c_gst_video_dma_drm_fourcc_to_formatFn c_gst_video_dma_drm_fourcc_to_format; ///
private alias c_gst_video_dma_drm_fourcc_to_stringFn = extern(C) char* function(uint fourcc, ulong modifier) nothrow;
__gshared c_gst_video_dma_drm_fourcc_to_stringFn c_gst_video_dma_drm_fourcc_to_string; ///
private alias c_gst_video_event_is_force_key_unitFn = extern(C) gboolean function(GstEvent* event) nothrow;
__gshared c_gst_video_event_is_force_key_unitFn c_gst_video_event_is_force_key_unit; ///
private alias c_gst_video_event_new_downstream_force_key_unitFn = extern(C) GstEvent* function(GstClockTime timestamp, GstClockTime streamTime, GstClockTime runningTime, gboolean allHeaders, uint count) nothrow;
__gshared c_gst_video_event_new_downstream_force_key_unitFn c_gst_video_event_new_downstream_force_key_unit; ///
private alias c_gst_video_event_new_still_frameFn = extern(C) GstEvent* function(gboolean inStill) nothrow;
__gshared c_gst_video_event_new_still_frameFn c_gst_video_event_new_still_frame; ///
private alias c_gst_video_event_new_upstream_force_key_unitFn = extern(C) GstEvent* function(GstClockTime runningTime, gboolean allHeaders, uint count) nothrow;
__gshared c_gst_video_event_new_upstream_force_key_unitFn c_gst_video_event_new_upstream_force_key_unit; ///
private alias c_gst_video_event_parse_downstream_force_key_unitFn = extern(C) gboolean function(GstEvent* event, GstClockTime* timestamp, GstClockTime* streamTime, GstClockTime* runningTime, gboolean* allHeaders, uint* count) nothrow;
__gshared c_gst_video_event_parse_downstream_force_key_unitFn c_gst_video_event_parse_downstream_force_key_unit; ///
private alias c_gst_video_event_parse_still_frameFn = extern(C) gboolean function(GstEvent* event, gboolean* inStill) nothrow;
__gshared c_gst_video_event_parse_still_frameFn c_gst_video_event_parse_still_frame; ///
private alias c_gst_video_event_parse_upstream_force_key_unitFn = extern(C) gboolean function(GstEvent* event, GstClockTime* runningTime, gboolean* allHeaders, uint* count) nothrow;
__gshared c_gst_video_event_parse_upstream_force_key_unitFn c_gst_video_event_parse_upstream_force_key_unit; ///
private alias c_gst_video_formats_anyFn = extern(C) const(GstVideoFormat)* function(uint* len) nothrow;
__gshared c_gst_video_formats_anyFn c_gst_video_formats_any; ///
private alias c_gst_video_formats_rawFn = extern(C) const(GstVideoFormat)* function(uint* len) nothrow;
__gshared c_gst_video_formats_rawFn c_gst_video_formats_raw; ///
private alias c_gst_video_gl_texture_upload_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_gl_texture_upload_meta_api_get_typeFn c_gst_video_gl_texture_upload_meta_api_get_type; ///
private alias c_gst_video_guess_framerateFn = extern(C) gboolean function(GstClockTime duration, int* destN, int* destD) nothrow;
__gshared c_gst_video_guess_framerateFn c_gst_video_guess_framerate; ///
private alias c_gst_video_is_common_aspect_ratioFn = extern(C) gboolean function(int width, int height, int parN, int parD) nothrow;
__gshared c_gst_video_is_common_aspect_ratioFn c_gst_video_is_common_aspect_ratio; ///
private alias c_gst_video_is_dma_drm_capsFn = extern(C) gboolean function(const(GstCaps)* caps) nothrow;
__gshared c_gst_video_is_dma_drm_capsFn c_gst_video_is_dma_drm_caps; ///
private alias c_gst_video_make_raw_capsFn = extern(C) GstCaps* function(const(GstVideoFormat)* formats, uint len) nothrow;
__gshared c_gst_video_make_raw_capsFn c_gst_video_make_raw_caps; ///
private alias c_gst_video_make_raw_caps_with_featuresFn = extern(C) GstCaps* function(const(GstVideoFormat)* formats, uint len, GstCapsFeatures* features) nothrow;
__gshared c_gst_video_make_raw_caps_with_featuresFn c_gst_video_make_raw_caps_with_features; ///
private alias c_gst_video_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_meta_api_get_typeFn c_gst_video_meta_api_get_type; ///
private alias c_gst_video_multiview_get_doubled_height_modesFn = extern(C) const(GValue)* function() nothrow;
__gshared c_gst_video_multiview_get_doubled_height_modesFn c_gst_video_multiview_get_doubled_height_modes; ///
private alias c_gst_video_multiview_get_doubled_size_modesFn = extern(C) const(GValue)* function() nothrow;
__gshared c_gst_video_multiview_get_doubled_size_modesFn c_gst_video_multiview_get_doubled_size_modes; ///
private alias c_gst_video_multiview_get_doubled_width_modesFn = extern(C) const(GValue)* function() nothrow;
__gshared c_gst_video_multiview_get_doubled_width_modesFn c_gst_video_multiview_get_doubled_width_modes; ///
private alias c_gst_video_multiview_get_mono_modesFn = extern(C) const(GValue)* function() nothrow;
__gshared c_gst_video_multiview_get_mono_modesFn c_gst_video_multiview_get_mono_modes; ///
private alias c_gst_video_multiview_get_unpacked_modesFn = extern(C) const(GValue)* function() nothrow;
__gshared c_gst_video_multiview_get_unpacked_modesFn c_gst_video_multiview_get_unpacked_modes; ///
private alias c_gst_video_multiview_guess_half_aspectFn = extern(C) gboolean function(GstVideoMultiviewMode mvMode, uint width, uint height, uint parN, uint parD) nothrow;
__gshared c_gst_video_multiview_guess_half_aspectFn c_gst_video_multiview_guess_half_aspect; ///
private alias c_gst_video_multiview_video_info_change_modeFn = extern(C) void function(GstVideoInfo* info, GstVideoMultiviewMode outMviewMode, GstVideoMultiviewFlags outMviewFlags) nothrow;
__gshared c_gst_video_multiview_video_info_change_modeFn c_gst_video_multiview_video_info_change_mode; ///
private alias c_gst_video_overlay_composition_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_overlay_composition_meta_api_get_typeFn c_gst_video_overlay_composition_meta_api_get_type; ///
private alias c_gst_video_region_of_interest_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_region_of_interest_meta_api_get_typeFn c_gst_video_region_of_interest_meta_api_get_type; ///
private alias c_gst_video_sei_user_data_unregistered_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_sei_user_data_unregistered_meta_api_get_typeFn c_gst_video_sei_user_data_unregistered_meta_api_get_type; ///
private alias c_gst_video_sei_user_data_unregistered_parse_precision_time_stampFn = extern(C) gboolean function(GstVideoSEIUserDataUnregisteredMeta* userData, ubyte* status, ulong* precisionTimeStamp) nothrow;
__gshared c_gst_video_sei_user_data_unregistered_parse_precision_time_stampFn c_gst_video_sei_user_data_unregistered_parse_precision_time_stamp; ///
private alias c_gst_video_tile_get_indexFn = extern(C) uint function(GstVideoTileMode mode, int x, int y, int xTiles, int yTiles) nothrow;
__gshared c_gst_video_tile_get_indexFn c_gst_video_tile_get_index; ///
private alias c_gst_video_time_code_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_video_time_code_meta_api_get_typeFn c_gst_video_time_code_meta_api_get_type; ///

// VideoCaptionType
private alias c_gst_video_caption_type_from_capsFn = extern(C) GstVideoCaptionType function(const(GstCaps)* caps) nothrow;
__gshared c_gst_video_caption_type_from_capsFn c_gst_video_caption_type_from_caps; ///
private alias c_gst_video_caption_type_to_capsFn = extern(C) GstCaps* function(GstVideoCaptionType type) nothrow;
__gshared c_gst_video_caption_type_to_capsFn c_gst_video_caption_type_to_caps; ///

// VideoChromaSite
private alias c_gst_video_chroma_site_from_stringFn = extern(C) GstVideoChromaSite function(const(char)* s) nothrow;
__gshared c_gst_video_chroma_site_from_stringFn c_gst_video_chroma_site_from_string; ///
private alias c_gst_video_chroma_site_to_stringFn = extern(C) char* function(GstVideoChromaSite site) nothrow;
__gshared c_gst_video_chroma_site_to_stringFn c_gst_video_chroma_site_to_string; ///

// VideoColorMatrix
private alias c_gst_video_color_matrix_from_isoFn = extern(C) GstVideoColorMatrix function(uint value) nothrow;
__gshared c_gst_video_color_matrix_from_isoFn c_gst_video_color_matrix_from_iso; ///
private alias c_gst_video_color_matrix_get_Kr_KbFn = extern(C) gboolean function(GstVideoColorMatrix matrix, double* Kr, double* Kb) nothrow;
__gshared c_gst_video_color_matrix_get_Kr_KbFn c_gst_video_color_matrix_get_Kr_Kb; ///
private alias c_gst_video_color_matrix_to_isoFn = extern(C) uint function(GstVideoColorMatrix matrix) nothrow;
__gshared c_gst_video_color_matrix_to_isoFn c_gst_video_color_matrix_to_iso; ///

// VideoColorPrimaries
private alias c_gst_video_color_primaries_from_isoFn = extern(C) GstVideoColorPrimaries function(uint value) nothrow;
__gshared c_gst_video_color_primaries_from_isoFn c_gst_video_color_primaries_from_iso; ///
private alias c_gst_video_color_primaries_get_infoFn = extern(C) const(GstVideoColorPrimariesInfo)* function(GstVideoColorPrimaries primaries) nothrow;
__gshared c_gst_video_color_primaries_get_infoFn c_gst_video_color_primaries_get_info; ///
private alias c_gst_video_color_primaries_is_equivalentFn = extern(C) gboolean function(GstVideoColorPrimaries primaries, GstVideoColorPrimaries other) nothrow;
__gshared c_gst_video_color_primaries_is_equivalentFn c_gst_video_color_primaries_is_equivalent; ///
private alias c_gst_video_color_primaries_to_isoFn = extern(C) uint function(GstVideoColorPrimaries primaries) nothrow;
__gshared c_gst_video_color_primaries_to_isoFn c_gst_video_color_primaries_to_iso; ///

// VideoColorRange
private alias c_gst_video_color_range_offsetsFn = extern(C) void function(GstVideoColorRange range, const(GstVideoFormatInfo)* info, int* offset, int* scale) nothrow;
__gshared c_gst_video_color_range_offsetsFn c_gst_video_color_range_offsets; ///

// VideoFieldOrder
private alias c_gst_video_field_order_from_stringFn = extern(C) GstVideoFieldOrder function(const(char)* order) nothrow;
__gshared c_gst_video_field_order_from_stringFn c_gst_video_field_order_from_string; ///
private alias c_gst_video_field_order_to_stringFn = extern(C) const(char)* function(GstVideoFieldOrder order) nothrow;
__gshared c_gst_video_field_order_to_stringFn c_gst_video_field_order_to_string; ///

// VideoFormat
private alias c_gst_video_format_from_fourccFn = extern(C) GstVideoFormat function(uint fourcc) nothrow;
__gshared c_gst_video_format_from_fourccFn c_gst_video_format_from_fourcc; ///
private alias c_gst_video_format_from_masksFn = extern(C) GstVideoFormat function(int depth, int bpp, int endianness, uint redMask, uint greenMask, uint blueMask, uint alphaMask) nothrow;
__gshared c_gst_video_format_from_masksFn c_gst_video_format_from_masks; ///
private alias c_gst_video_format_from_stringFn = extern(C) GstVideoFormat function(const(char)* format) nothrow;
__gshared c_gst_video_format_from_stringFn c_gst_video_format_from_string; ///
private alias c_gst_video_format_get_infoFn = extern(C) const(GstVideoFormatInfo)* function(GstVideoFormat format) nothrow;
__gshared c_gst_video_format_get_infoFn c_gst_video_format_get_info; ///
private alias c_gst_video_format_get_paletteFn = extern(C) const(void)* function(GstVideoFormat format, size_t* size) nothrow;
__gshared c_gst_video_format_get_paletteFn c_gst_video_format_get_palette; ///
private alias c_gst_video_format_to_fourccFn = extern(C) uint function(GstVideoFormat format) nothrow;
__gshared c_gst_video_format_to_fourccFn c_gst_video_format_to_fourcc; ///
private alias c_gst_video_format_to_stringFn = extern(C) const(char)* function(GstVideoFormat format) nothrow;
__gshared c_gst_video_format_to_stringFn c_gst_video_format_to_string; ///

// VideoInterlaceMode
private alias c_gst_video_interlace_mode_from_stringFn = extern(C) GstVideoInterlaceMode function(const(char)* mode) nothrow;
__gshared c_gst_video_interlace_mode_from_stringFn c_gst_video_interlace_mode_from_string; ///
private alias c_gst_video_interlace_mode_to_stringFn = extern(C) const(char)* function(GstVideoInterlaceMode mode) nothrow;
__gshared c_gst_video_interlace_mode_to_stringFn c_gst_video_interlace_mode_to_string; ///

// VideoMultiviewMode
private alias c_gst_video_multiview_mode_from_caps_stringFn = extern(C) GstVideoMultiviewMode function(const(char)* capsMviewMode) nothrow;
__gshared c_gst_video_multiview_mode_from_caps_stringFn c_gst_video_multiview_mode_from_caps_string; ///
private alias c_gst_video_multiview_mode_to_caps_stringFn = extern(C) const(char)* function(GstVideoMultiviewMode mviewMode) nothrow;
__gshared c_gst_video_multiview_mode_to_caps_stringFn c_gst_video_multiview_mode_to_caps_string; ///

// VideoTransferFunction
private alias c_gst_video_transfer_function_decodeFn = extern(C) double function(GstVideoTransferFunction func, double val) nothrow;
__gshared c_gst_video_transfer_function_decodeFn c_gst_video_transfer_function_decode; ///
private alias c_gst_video_transfer_function_encodeFn = extern(C) double function(GstVideoTransferFunction func, double val) nothrow;
__gshared c_gst_video_transfer_function_encodeFn c_gst_video_transfer_function_encode; ///
private alias c_gst_video_transfer_function_from_isoFn = extern(C) GstVideoTransferFunction function(uint value) nothrow;
__gshared c_gst_video_transfer_function_from_isoFn c_gst_video_transfer_function_from_iso; ///
private alias c_gst_video_transfer_function_is_equivalentFn = extern(C) gboolean function(GstVideoTransferFunction fromFunc, uint fromBpp, GstVideoTransferFunction toFunc, uint toBpp) nothrow;
__gshared c_gst_video_transfer_function_is_equivalentFn c_gst_video_transfer_function_is_equivalent; ///
private alias c_gst_video_transfer_function_to_isoFn = extern(C) uint function(GstVideoTransferFunction func) nothrow;
__gshared c_gst_video_transfer_function_to_isoFn c_gst_video_transfer_function_to_iso; ///

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
alias gst_navigation_event_new_mouse_double_click = c_gst_navigation_event_new_mouse_double_click;

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
alias gst_video_converter_transform_metas = c_gst_video_converter_transform_metas;

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

// VideoDmabufPool

/** */
alias gst_video_dmabuf_pool_get_type = c_gst_video_dmabuf_pool_get_type;

/** */
alias gst_video_dmabuf_pool_new = c_gst_video_dmabuf_pool_new;

// VideoEncoder

/** */
alias gst_video_encoder_get_type = c_gst_video_encoder_get_type;

/** */
alias gst_video_encoder_allocate_output_buffer = c_gst_video_encoder_allocate_output_buffer;

/** */
alias gst_video_encoder_allocate_output_frame = c_gst_video_encoder_allocate_output_frame;

/** */
alias gst_video_encoder_drop_frame = c_gst_video_encoder_drop_frame;

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
alias gst_video_encoder_release_frame = c_gst_video_encoder_release_frame;

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
alias gst_video_meta_set_alignment_full = c_gst_video_meta_set_alignment_full;

/** */
alias gst_video_meta_unmap = c_gst_video_meta_unmap;

/** */
alias gst_video_meta_get_info = c_gst_video_meta_get_info;

// VideoMetaTransform

/** */
alias gst_video_meta_transform_scale_get_quark = c_gst_video_meta_transform_scale_get_quark;

// VideoMetaTransformMatrix

/** */
alias gst_video_meta_transform_matrix_init = c_gst_video_meta_transform_matrix_init;

/** */
alias gst_video_meta_transform_matrix_point = c_gst_video_meta_transform_matrix_point;

/** */
alias gst_video_meta_transform_matrix_point_clipped = c_gst_video_meta_transform_matrix_point_clipped;

/** */
alias gst_video_meta_transform_matrix_rectangle = c_gst_video_meta_transform_matrix_rectangle;

/** */
alias gst_video_meta_transform_matrix_rectangle_clipped = c_gst_video_meta_transform_matrix_rectangle_clipped;

/** */
alias gst_video_meta_transform_matrix_get_quark = c_gst_video_meta_transform_matrix_get_quark;

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
alias gst_video_dma_drm_format_from_gst_format = c_gst_video_dma_drm_format_from_gst_format;

/** */
alias gst_video_dma_drm_format_to_gst_format = c_gst_video_dma_drm_format_to_gst_format;

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

// VideoCaptionType

/** */
alias gst_video_caption_type_from_caps = c_gst_video_caption_type_from_caps;

/** */
alias gst_video_caption_type_to_caps = c_gst_video_caption_type_to_caps;

// VideoChromaSite

/** */
alias gst_video_chroma_site_from_string = c_gst_video_chroma_site_from_string;

/** */
alias gst_video_chroma_site_to_string = c_gst_video_chroma_site_to_string;

// VideoColorMatrix

/** */
alias gst_video_color_matrix_from_iso = c_gst_video_color_matrix_from_iso;

/** */
alias gst_video_color_matrix_get_Kr_Kb = c_gst_video_color_matrix_get_Kr_Kb;

/** */
alias gst_video_color_matrix_to_iso = c_gst_video_color_matrix_to_iso;

// VideoColorPrimaries

/** */
alias gst_video_color_primaries_from_iso = c_gst_video_color_primaries_from_iso;

/** */
alias gst_video_color_primaries_get_info = c_gst_video_color_primaries_get_info;

/** */
alias gst_video_color_primaries_is_equivalent = c_gst_video_color_primaries_is_equivalent;

/** */
alias gst_video_color_primaries_to_iso = c_gst_video_color_primaries_to_iso;

// VideoColorRange

/** */
alias gst_video_color_range_offsets = c_gst_video_color_range_offsets;

// VideoFieldOrder

/** */
alias gst_video_field_order_from_string = c_gst_video_field_order_from_string;

/** */
alias gst_video_field_order_to_string = c_gst_video_field_order_to_string;

// VideoFormat

/** */
alias gst_video_format_from_fourcc = c_gst_video_format_from_fourcc;

/** */
alias gst_video_format_from_masks = c_gst_video_format_from_masks;

/** */
alias gst_video_format_from_string = c_gst_video_format_from_string;

/** */
alias gst_video_format_get_info = c_gst_video_format_get_info;

/** */
alias gst_video_format_get_palette = c_gst_video_format_get_palette;

/** */
alias gst_video_format_to_fourcc = c_gst_video_format_to_fourcc;

/** */
alias gst_video_format_to_string = c_gst_video_format_to_string;

// VideoInterlaceMode

/** */
alias gst_video_interlace_mode_from_string = c_gst_video_interlace_mode_from_string;

/** */
alias gst_video_interlace_mode_to_string = c_gst_video_interlace_mode_to_string;

// VideoMultiviewMode

/** */
alias gst_video_multiview_mode_from_caps_string = c_gst_video_multiview_mode_from_caps_string;

/** */
alias gst_video_multiview_mode_to_caps_string = c_gst_video_multiview_mode_to_caps_string;

// VideoTransferFunction

/** */
alias gst_video_transfer_function_decode = c_gst_video_transfer_function_decode;

/** */
alias gst_video_transfer_function_encode = c_gst_video_transfer_function_encode;

/** */
alias gst_video_transfer_function_from_iso = c_gst_video_transfer_function_from_iso;

/** */
alias gst_video_transfer_function_is_equivalent = c_gst_video_transfer_function_is_equivalent;

/** */
alias gst_video_transfer_function_to_iso = c_gst_video_transfer_function_to_iso;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gstvideo1");

  // AncillaryMeta
  gidLink(cast(void**)&gst_ancillary_meta_get_info, "gst_ancillary_meta_get_info", libs);

  // ColorBalance
  gidLink(cast(void**)&gst_color_balance_get_type, "gst_color_balance_get_type", libs);
  gidLink(cast(void**)&gst_color_balance_get_balance_type, "gst_color_balance_get_balance_type", libs);
  gidLink(cast(void**)&gst_color_balance_get_value, "gst_color_balance_get_value", libs);
  gidLink(cast(void**)&gst_color_balance_list_channels, "gst_color_balance_list_channels", libs);
  gidLink(cast(void**)&gst_color_balance_set_value, "gst_color_balance_set_value", libs);
  gidLink(cast(void**)&gst_color_balance_value_changed, "gst_color_balance_value_changed", libs);

  // ColorBalanceChannel
  gidLink(cast(void**)&gst_color_balance_channel_get_type, "gst_color_balance_channel_get_type", libs);

  // Navigation
  gidLink(cast(void**)&gst_navigation_get_type, "gst_navigation_get_type", libs);
  gidLink(cast(void**)&gst_navigation_event_get_coordinates, "gst_navigation_event_get_coordinates", libs);
  gidLink(cast(void**)&gst_navigation_event_get_type, "gst_navigation_event_get_type", libs);
  gidLink(cast(void**)&gst_navigation_event_new_command, "gst_navigation_event_new_command", libs);
  gidLink(cast(void**)&gst_navigation_event_new_key_press, "gst_navigation_event_new_key_press", libs);
  gidLink(cast(void**)&gst_navigation_event_new_key_release, "gst_navigation_event_new_key_release", libs);
  gidLink(cast(void**)&gst_navigation_event_new_mouse_button_press, "gst_navigation_event_new_mouse_button_press", libs);
  gidLink(cast(void**)&gst_navigation_event_new_mouse_button_release, "gst_navigation_event_new_mouse_button_release", libs);
  gidLink(cast(void**)&gst_navigation_event_new_mouse_double_click, "gst_navigation_event_new_mouse_double_click", libs);
  gidLink(cast(void**)&gst_navigation_event_new_mouse_move, "gst_navigation_event_new_mouse_move", libs);
  gidLink(cast(void**)&gst_navigation_event_new_mouse_scroll, "gst_navigation_event_new_mouse_scroll", libs);
  gidLink(cast(void**)&gst_navigation_event_new_touch_cancel, "gst_navigation_event_new_touch_cancel", libs);
  gidLink(cast(void**)&gst_navigation_event_new_touch_down, "gst_navigation_event_new_touch_down", libs);
  gidLink(cast(void**)&gst_navigation_event_new_touch_frame, "gst_navigation_event_new_touch_frame", libs);
  gidLink(cast(void**)&gst_navigation_event_new_touch_motion, "gst_navigation_event_new_touch_motion", libs);
  gidLink(cast(void**)&gst_navigation_event_new_touch_up, "gst_navigation_event_new_touch_up", libs);
  gidLink(cast(void**)&gst_navigation_event_parse_command, "gst_navigation_event_parse_command", libs);
  gidLink(cast(void**)&gst_navigation_event_parse_key_event, "gst_navigation_event_parse_key_event", libs);
  gidLink(cast(void**)&gst_navigation_event_parse_modifier_state, "gst_navigation_event_parse_modifier_state", libs);
  gidLink(cast(void**)&gst_navigation_event_parse_mouse_button_event, "gst_navigation_event_parse_mouse_button_event", libs);
  gidLink(cast(void**)&gst_navigation_event_parse_mouse_move_event, "gst_navigation_event_parse_mouse_move_event", libs);
  gidLink(cast(void**)&gst_navigation_event_parse_mouse_scroll_event, "gst_navigation_event_parse_mouse_scroll_event", libs);
  gidLink(cast(void**)&gst_navigation_event_parse_touch_event, "gst_navigation_event_parse_touch_event", libs);
  gidLink(cast(void**)&gst_navigation_event_parse_touch_up_event, "gst_navigation_event_parse_touch_up_event", libs);
  gidLink(cast(void**)&gst_navigation_event_set_coordinates, "gst_navigation_event_set_coordinates", libs);
  gidLink(cast(void**)&gst_navigation_message_get_type, "gst_navigation_message_get_type", libs);
  gidLink(cast(void**)&gst_navigation_message_new_angles_changed, "gst_navigation_message_new_angles_changed", libs);
  gidLink(cast(void**)&gst_navigation_message_new_commands_changed, "gst_navigation_message_new_commands_changed", libs);
  gidLink(cast(void**)&gst_navigation_message_new_event, "gst_navigation_message_new_event", libs);
  gidLink(cast(void**)&gst_navigation_message_new_mouse_over, "gst_navigation_message_new_mouse_over", libs);
  gidLink(cast(void**)&gst_navigation_message_parse_angles_changed, "gst_navigation_message_parse_angles_changed", libs);
  gidLink(cast(void**)&gst_navigation_message_parse_event, "gst_navigation_message_parse_event", libs);
  gidLink(cast(void**)&gst_navigation_message_parse_mouse_over, "gst_navigation_message_parse_mouse_over", libs);
  gidLink(cast(void**)&gst_navigation_query_get_type, "gst_navigation_query_get_type", libs);
  gidLink(cast(void**)&gst_navigation_query_new_angles, "gst_navigation_query_new_angles", libs);
  gidLink(cast(void**)&gst_navigation_query_new_commands, "gst_navigation_query_new_commands", libs);
  gidLink(cast(void**)&gst_navigation_query_parse_angles, "gst_navigation_query_parse_angles", libs);
  gidLink(cast(void**)&gst_navigation_query_parse_commands_length, "gst_navigation_query_parse_commands_length", libs);
  gidLink(cast(void**)&gst_navigation_query_parse_commands_nth, "gst_navigation_query_parse_commands_nth", libs);
  gidLink(cast(void**)&gst_navigation_query_set_angles, "gst_navigation_query_set_angles", libs);
  gidLink(cast(void**)&gst_navigation_query_set_commands, "gst_navigation_query_set_commands", libs);
  gidLink(cast(void**)&gst_navigation_query_set_commandsv, "gst_navigation_query_set_commandsv", libs);
  gidLink(cast(void**)&gst_navigation_send_command, "gst_navigation_send_command", libs);
  gidLink(cast(void**)&gst_navigation_send_event, "gst_navigation_send_event", libs);
  gidLink(cast(void**)&gst_navigation_send_event_simple, "gst_navigation_send_event_simple", libs);
  gidLink(cast(void**)&gst_navigation_send_key_event, "gst_navigation_send_key_event", libs);
  gidLink(cast(void**)&gst_navigation_send_mouse_event, "gst_navigation_send_mouse_event", libs);
  gidLink(cast(void**)&gst_navigation_send_mouse_scroll_event, "gst_navigation_send_mouse_scroll_event", libs);

  // VideoAFDMeta
  gidLink(cast(void**)&gst_video_afd_meta_get_info, "gst_video_afd_meta_get_info", libs);

  // VideoAffineTransformationMeta
  gidLink(cast(void**)&gst_video_affine_transformation_meta_apply_matrix, "gst_video_affine_transformation_meta_apply_matrix", libs);
  gidLink(cast(void**)&gst_video_affine_transformation_meta_get_info, "gst_video_affine_transformation_meta_get_info", libs);

  // VideoAggregator
  gidLink(cast(void**)&gst_video_aggregator_get_type, "gst_video_aggregator_get_type", libs);
  gidLink(cast(void**)&gst_video_aggregator_get_execution_task_pool, "gst_video_aggregator_get_execution_task_pool", libs);

  // VideoAggregatorConvertPad
  gidLink(cast(void**)&gst_video_aggregator_convert_pad_get_type, "gst_video_aggregator_convert_pad_get_type", libs);
  gidLink(cast(void**)&gst_video_aggregator_convert_pad_update_conversion_info, "gst_video_aggregator_convert_pad_update_conversion_info", libs);

  // VideoAggregatorPad
  gidLink(cast(void**)&gst_video_aggregator_pad_get_type, "gst_video_aggregator_pad_get_type", libs);
  gidLink(cast(void**)&gst_video_aggregator_pad_get_current_buffer, "gst_video_aggregator_pad_get_current_buffer", libs);
  gidLink(cast(void**)&gst_video_aggregator_pad_get_prepared_frame, "gst_video_aggregator_pad_get_prepared_frame", libs);
  gidLink(cast(void**)&gst_video_aggregator_pad_has_current_buffer, "gst_video_aggregator_pad_has_current_buffer", libs);
  gidLink(cast(void**)&gst_video_aggregator_pad_set_needs_alpha, "gst_video_aggregator_pad_set_needs_alpha", libs);

  // VideoAggregatorParallelConvertPad
  gidLink(cast(void**)&gst_video_aggregator_parallel_convert_pad_get_type, "gst_video_aggregator_parallel_convert_pad_get_type", libs);

  // VideoAlignment
  gidLink(cast(void**)&gst_video_alignment_reset, "gst_video_alignment_reset", libs);

  // VideoBarMeta
  gidLink(cast(void**)&gst_video_bar_meta_get_info, "gst_video_bar_meta_get_info", libs);

  // VideoBufferPool
  gidLink(cast(void**)&gst_video_buffer_pool_get_type, "gst_video_buffer_pool_get_type", libs);
  gidLink(cast(void**)&gst_video_buffer_pool_new, "gst_video_buffer_pool_new", libs);

  // VideoCaptionMeta
  gidLink(cast(void**)&gst_video_caption_meta_get_info, "gst_video_caption_meta_get_info", libs);

  // VideoChromaResample
  gidLink(cast(void**)&gst_video_chroma_resample_free, "gst_video_chroma_resample_free", libs);
  gidLink(cast(void**)&gst_video_chroma_resample_get_info, "gst_video_chroma_resample_get_info", libs);
  gidLink(cast(void**)&gst_video_chroma_resample_new, "gst_video_chroma_resample_new", libs);

  // VideoCodecAlphaMeta
  gidLink(cast(void**)&gst_video_codec_alpha_meta_get_info, "gst_video_codec_alpha_meta_get_info", libs);

  // VideoCodecFrame
  gidLink(cast(void**)&gst_video_codec_frame_get_type, "gst_video_codec_frame_get_type", libs);
  gidLink(cast(void**)&gst_video_codec_frame_get_user_data, "gst_video_codec_frame_get_user_data", libs);
  gidLink(cast(void**)&gst_video_codec_frame_ref, "gst_video_codec_frame_ref", libs);
  gidLink(cast(void**)&gst_video_codec_frame_set_user_data, "gst_video_codec_frame_set_user_data", libs);
  gidLink(cast(void**)&gst_video_codec_frame_unref, "gst_video_codec_frame_unref", libs);

  // VideoCodecState
  gidLink(cast(void**)&gst_video_codec_state_get_type, "gst_video_codec_state_get_type", libs);
  gidLink(cast(void**)&gst_video_codec_state_ref, "gst_video_codec_state_ref", libs);
  gidLink(cast(void**)&gst_video_codec_state_unref, "gst_video_codec_state_unref", libs);

  // VideoColorimetry
  gidLink(cast(void**)&gst_video_colorimetry_from_string, "gst_video_colorimetry_from_string", libs);
  gidLink(cast(void**)&gst_video_colorimetry_is_equal, "gst_video_colorimetry_is_equal", libs);
  gidLink(cast(void**)&gst_video_colorimetry_is_equivalent, "gst_video_colorimetry_is_equivalent", libs);
  gidLink(cast(void**)&gst_video_colorimetry_matches, "gst_video_colorimetry_matches", libs);
  gidLink(cast(void**)&gst_video_colorimetry_to_string, "gst_video_colorimetry_to_string", libs);

  // VideoContentLightLevel
  gidLink(cast(void**)&gst_video_content_light_level_add_to_caps, "gst_video_content_light_level_add_to_caps", libs);
  gidLink(cast(void**)&gst_video_content_light_level_from_caps, "gst_video_content_light_level_from_caps", libs);
  gidLink(cast(void**)&gst_video_content_light_level_from_string, "gst_video_content_light_level_from_string", libs);
  gidLink(cast(void**)&gst_video_content_light_level_init, "gst_video_content_light_level_init", libs);
  gidLink(cast(void**)&gst_video_content_light_level_is_equal, "gst_video_content_light_level_is_equal", libs);
  gidLink(cast(void**)&gst_video_content_light_level_to_string, "gst_video_content_light_level_to_string", libs);

  // VideoConverter
  gidLink(cast(void**)&gst_video_converter_frame, "gst_video_converter_frame", libs);
  gidLink(cast(void**)&gst_video_converter_frame_finish, "gst_video_converter_frame_finish", libs);
  gidLink(cast(void**)&gst_video_converter_free, "gst_video_converter_free", libs);
  gidLink(cast(void**)&gst_video_converter_get_config, "gst_video_converter_get_config", libs);
  gidLink(cast(void**)&gst_video_converter_get_in_info, "gst_video_converter_get_in_info", libs);
  gidLink(cast(void**)&gst_video_converter_get_out_info, "gst_video_converter_get_out_info", libs);
  gidLink(cast(void**)&gst_video_converter_set_config, "gst_video_converter_set_config", libs);
  gidLink(cast(void**)&gst_video_converter_transform_metas, "gst_video_converter_transform_metas", libs);
  gidLink(cast(void**)&gst_video_converter_new, "gst_video_converter_new", libs);
  gidLink(cast(void**)&gst_video_converter_new_with_pool, "gst_video_converter_new_with_pool", libs);

  // VideoCropMeta
  gidLink(cast(void**)&gst_video_crop_meta_get_info, "gst_video_crop_meta_get_info", libs);

  // VideoDecoder
  gidLink(cast(void**)&gst_video_decoder_get_type, "gst_video_decoder_get_type", libs);
  gidLink(cast(void**)&gst_video_decoder_add_to_frame, "gst_video_decoder_add_to_frame", libs);
  gidLink(cast(void**)&gst_video_decoder_allocate_output_buffer, "gst_video_decoder_allocate_output_buffer", libs);
  gidLink(cast(void**)&gst_video_decoder_allocate_output_frame, "gst_video_decoder_allocate_output_frame", libs);
  gidLink(cast(void**)&gst_video_decoder_allocate_output_frame_with_params, "gst_video_decoder_allocate_output_frame_with_params", libs);
  gidLink(cast(void**)&gst_video_decoder_drop_frame, "gst_video_decoder_drop_frame", libs);
  gidLink(cast(void**)&gst_video_decoder_drop_subframe, "gst_video_decoder_drop_subframe", libs);
  gidLink(cast(void**)&gst_video_decoder_finish_frame, "gst_video_decoder_finish_frame", libs);
  gidLink(cast(void**)&gst_video_decoder_finish_subframe, "gst_video_decoder_finish_subframe", libs);
  gidLink(cast(void**)&gst_video_decoder_get_allocator, "gst_video_decoder_get_allocator", libs);
  gidLink(cast(void**)&gst_video_decoder_get_buffer_pool, "gst_video_decoder_get_buffer_pool", libs);
  gidLink(cast(void**)&gst_video_decoder_get_estimate_rate, "gst_video_decoder_get_estimate_rate", libs);
  gidLink(cast(void**)&gst_video_decoder_get_frame, "gst_video_decoder_get_frame", libs);
  gidLink(cast(void**)&gst_video_decoder_get_frames, "gst_video_decoder_get_frames", libs);
  gidLink(cast(void**)&gst_video_decoder_get_input_subframe_index, "gst_video_decoder_get_input_subframe_index", libs);
  gidLink(cast(void**)&gst_video_decoder_get_latency, "gst_video_decoder_get_latency", libs);
  gidLink(cast(void**)&gst_video_decoder_get_max_decode_time, "gst_video_decoder_get_max_decode_time", libs);
  gidLink(cast(void**)&gst_video_decoder_get_max_errors, "gst_video_decoder_get_max_errors", libs);
  gidLink(cast(void**)&gst_video_decoder_get_needs_format, "gst_video_decoder_get_needs_format", libs);
  gidLink(cast(void**)&gst_video_decoder_get_needs_sync_point, "gst_video_decoder_get_needs_sync_point", libs);
  gidLink(cast(void**)&gst_video_decoder_get_oldest_frame, "gst_video_decoder_get_oldest_frame", libs);
  gidLink(cast(void**)&gst_video_decoder_get_output_state, "gst_video_decoder_get_output_state", libs);
  gidLink(cast(void**)&gst_video_decoder_get_packetized, "gst_video_decoder_get_packetized", libs);
  gidLink(cast(void**)&gst_video_decoder_get_pending_frame_size, "gst_video_decoder_get_pending_frame_size", libs);
  gidLink(cast(void**)&gst_video_decoder_get_processed_subframe_index, "gst_video_decoder_get_processed_subframe_index", libs);
  gidLink(cast(void**)&gst_video_decoder_get_qos_proportion, "gst_video_decoder_get_qos_proportion", libs);
  gidLink(cast(void**)&gst_video_decoder_get_subframe_mode, "gst_video_decoder_get_subframe_mode", libs);
  gidLink(cast(void**)&gst_video_decoder_have_frame, "gst_video_decoder_have_frame", libs);
  gidLink(cast(void**)&gst_video_decoder_have_last_subframe, "gst_video_decoder_have_last_subframe", libs);
  gidLink(cast(void**)&gst_video_decoder_merge_tags, "gst_video_decoder_merge_tags", libs);
  gidLink(cast(void**)&gst_video_decoder_negotiate, "gst_video_decoder_negotiate", libs);
  gidLink(cast(void**)&gst_video_decoder_proxy_getcaps, "gst_video_decoder_proxy_getcaps", libs);
  gidLink(cast(void**)&gst_video_decoder_release_frame, "gst_video_decoder_release_frame", libs);
  gidLink(cast(void**)&gst_video_decoder_request_sync_point, "gst_video_decoder_request_sync_point", libs);
  gidLink(cast(void**)&gst_video_decoder_set_estimate_rate, "gst_video_decoder_set_estimate_rate", libs);
  gidLink(cast(void**)&gst_video_decoder_set_interlaced_output_state, "gst_video_decoder_set_interlaced_output_state", libs);
  gidLink(cast(void**)&gst_video_decoder_set_latency, "gst_video_decoder_set_latency", libs);
  gidLink(cast(void**)&gst_video_decoder_set_max_errors, "gst_video_decoder_set_max_errors", libs);
  gidLink(cast(void**)&gst_video_decoder_set_needs_format, "gst_video_decoder_set_needs_format", libs);
  gidLink(cast(void**)&gst_video_decoder_set_needs_sync_point, "gst_video_decoder_set_needs_sync_point", libs);
  gidLink(cast(void**)&gst_video_decoder_set_output_state, "gst_video_decoder_set_output_state", libs);
  gidLink(cast(void**)&gst_video_decoder_set_packetized, "gst_video_decoder_set_packetized", libs);
  gidLink(cast(void**)&gst_video_decoder_set_subframe_mode, "gst_video_decoder_set_subframe_mode", libs);
  gidLink(cast(void**)&gst_video_decoder_set_use_default_pad_acceptcaps, "gst_video_decoder_set_use_default_pad_acceptcaps", libs);

  // VideoDirection
  gidLink(cast(void**)&gst_video_direction_get_type, "gst_video_direction_get_type", libs);

  // VideoDither
  gidLink(cast(void**)&gst_video_dither_free, "gst_video_dither_free", libs);
  gidLink(cast(void**)&gst_video_dither_line, "gst_video_dither_line", libs);
  gidLink(cast(void**)&gst_video_dither_new, "gst_video_dither_new", libs);

  // VideoDmabufPool
  gidLink(cast(void**)&gst_video_dmabuf_pool_get_type, "gst_video_dmabuf_pool_get_type", libs);
  gidLink(cast(void**)&gst_video_dmabuf_pool_new, "gst_video_dmabuf_pool_new", libs);

  // VideoEncoder
  gidLink(cast(void**)&gst_video_encoder_get_type, "gst_video_encoder_get_type", libs);
  gidLink(cast(void**)&gst_video_encoder_allocate_output_buffer, "gst_video_encoder_allocate_output_buffer", libs);
  gidLink(cast(void**)&gst_video_encoder_allocate_output_frame, "gst_video_encoder_allocate_output_frame", libs);
  gidLink(cast(void**)&gst_video_encoder_drop_frame, "gst_video_encoder_drop_frame", libs);
  gidLink(cast(void**)&gst_video_encoder_finish_frame, "gst_video_encoder_finish_frame", libs);
  gidLink(cast(void**)&gst_video_encoder_finish_subframe, "gst_video_encoder_finish_subframe", libs);
  gidLink(cast(void**)&gst_video_encoder_get_allocator, "gst_video_encoder_get_allocator", libs);
  gidLink(cast(void**)&gst_video_encoder_get_frame, "gst_video_encoder_get_frame", libs);
  gidLink(cast(void**)&gst_video_encoder_get_frames, "gst_video_encoder_get_frames", libs);
  gidLink(cast(void**)&gst_video_encoder_get_latency, "gst_video_encoder_get_latency", libs);
  gidLink(cast(void**)&gst_video_encoder_get_max_encode_time, "gst_video_encoder_get_max_encode_time", libs);
  gidLink(cast(void**)&gst_video_encoder_get_min_force_key_unit_interval, "gst_video_encoder_get_min_force_key_unit_interval", libs);
  gidLink(cast(void**)&gst_video_encoder_get_oldest_frame, "gst_video_encoder_get_oldest_frame", libs);
  gidLink(cast(void**)&gst_video_encoder_get_output_state, "gst_video_encoder_get_output_state", libs);
  gidLink(cast(void**)&gst_video_encoder_is_qos_enabled, "gst_video_encoder_is_qos_enabled", libs);
  gidLink(cast(void**)&gst_video_encoder_merge_tags, "gst_video_encoder_merge_tags", libs);
  gidLink(cast(void**)&gst_video_encoder_negotiate, "gst_video_encoder_negotiate", libs);
  gidLink(cast(void**)&gst_video_encoder_proxy_getcaps, "gst_video_encoder_proxy_getcaps", libs);
  gidLink(cast(void**)&gst_video_encoder_release_frame, "gst_video_encoder_release_frame", libs);
  gidLink(cast(void**)&gst_video_encoder_set_headers, "gst_video_encoder_set_headers", libs);
  gidLink(cast(void**)&gst_video_encoder_set_latency, "gst_video_encoder_set_latency", libs);
  gidLink(cast(void**)&gst_video_encoder_set_min_force_key_unit_interval, "gst_video_encoder_set_min_force_key_unit_interval", libs);
  gidLink(cast(void**)&gst_video_encoder_set_min_pts, "gst_video_encoder_set_min_pts", libs);
  gidLink(cast(void**)&gst_video_encoder_set_output_state, "gst_video_encoder_set_output_state", libs);
  gidLink(cast(void**)&gst_video_encoder_set_qos_enabled, "gst_video_encoder_set_qos_enabled", libs);

  // VideoFilter
  gidLink(cast(void**)&gst_video_filter_get_type, "gst_video_filter_get_type", libs);

  // VideoFormatInfo
  gidLink(cast(void**)&gst_video_format_info_component, "gst_video_format_info_component", libs);
  gidLink(cast(void**)&gst_video_format_info_extrapolate_stride, "gst_video_format_info_extrapolate_stride", libs);

  // VideoFrame
  gidLink(cast(void**)&gst_video_frame_copy, "gst_video_frame_copy", libs);
  gidLink(cast(void**)&gst_video_frame_copy_plane, "gst_video_frame_copy_plane", libs);
  gidLink(cast(void**)&gst_video_frame_unmap, "gst_video_frame_unmap", libs);
  gidLink(cast(void**)&gst_video_frame_map, "gst_video_frame_map", libs);
  gidLink(cast(void**)&gst_video_frame_map_id, "gst_video_frame_map_id", libs);

  // VideoGLTextureUploadMeta
  gidLink(cast(void**)&gst_video_gl_texture_upload_meta_upload, "gst_video_gl_texture_upload_meta_upload", libs);
  gidLink(cast(void**)&gst_video_gl_texture_upload_meta_get_info, "gst_video_gl_texture_upload_meta_get_info", libs);

  // VideoInfo
  gidLink(cast(void**)&gst_video_info_get_type, "gst_video_info_get_type", libs);
  gidLink(cast(void**)&gst_video_info_new, "gst_video_info_new", libs);
  gidLink(cast(void**)&gst_video_info_new_from_caps, "gst_video_info_new_from_caps", libs);
  gidLink(cast(void**)&gst_video_info_align, "gst_video_info_align", libs);
  gidLink(cast(void**)&gst_video_info_align_full, "gst_video_info_align_full", libs);
  gidLink(cast(void**)&gst_video_info_convert, "gst_video_info_convert", libs);
  gidLink(cast(void**)&gst_video_info_copy, "gst_video_info_copy", libs);
  gidLink(cast(void**)&gst_video_info_free, "gst_video_info_free", libs);
  gidLink(cast(void**)&gst_video_info_is_equal, "gst_video_info_is_equal", libs);
  gidLink(cast(void**)&gst_video_info_set_format, "gst_video_info_set_format", libs);
  gidLink(cast(void**)&gst_video_info_set_interlaced_format, "gst_video_info_set_interlaced_format", libs);
  gidLink(cast(void**)&gst_video_info_to_caps, "gst_video_info_to_caps", libs);
  gidLink(cast(void**)&gst_video_info_from_caps, "gst_video_info_from_caps", libs);
  gidLink(cast(void**)&gst_video_info_init, "gst_video_info_init", libs);

  // VideoInfoDmaDrm
  gidLink(cast(void**)&gst_video_info_dma_drm_get_type, "gst_video_info_dma_drm_get_type", libs);
  gidLink(cast(void**)&gst_video_info_dma_drm_new, "gst_video_info_dma_drm_new", libs);
  gidLink(cast(void**)&gst_video_info_dma_drm_new_from_caps, "gst_video_info_dma_drm_new_from_caps", libs);
  gidLink(cast(void**)&gst_video_info_dma_drm_free, "gst_video_info_dma_drm_free", libs);
  gidLink(cast(void**)&gst_video_info_dma_drm_to_caps, "gst_video_info_dma_drm_to_caps", libs);
  gidLink(cast(void**)&gst_video_info_dma_drm_to_video_info, "gst_video_info_dma_drm_to_video_info", libs);
  gidLink(cast(void**)&gst_video_info_dma_drm_from_caps, "gst_video_info_dma_drm_from_caps", libs);
  gidLink(cast(void**)&gst_video_info_dma_drm_from_video_info, "gst_video_info_dma_drm_from_video_info", libs);
  gidLink(cast(void**)&gst_video_info_dma_drm_init, "gst_video_info_dma_drm_init", libs);

  // VideoMasteringDisplayInfo
  gidLink(cast(void**)&gst_video_mastering_display_info_add_to_caps, "gst_video_mastering_display_info_add_to_caps", libs);
  gidLink(cast(void**)&gst_video_mastering_display_info_from_caps, "gst_video_mastering_display_info_from_caps", libs);
  gidLink(cast(void**)&gst_video_mastering_display_info_init, "gst_video_mastering_display_info_init", libs);
  gidLink(cast(void**)&gst_video_mastering_display_info_is_equal, "gst_video_mastering_display_info_is_equal", libs);
  gidLink(cast(void**)&gst_video_mastering_display_info_to_string, "gst_video_mastering_display_info_to_string", libs);
  gidLink(cast(void**)&gst_video_mastering_display_info_from_string, "gst_video_mastering_display_info_from_string", libs);

  // VideoMeta
  gidLink(cast(void**)&gst_video_meta_get_plane_height, "gst_video_meta_get_plane_height", libs);
  gidLink(cast(void**)&gst_video_meta_get_plane_size, "gst_video_meta_get_plane_size", libs);
  gidLink(cast(void**)&gst_video_meta_map, "gst_video_meta_map", libs);
  gidLink(cast(void**)&gst_video_meta_set_alignment, "gst_video_meta_set_alignment", libs);
  gidLink(cast(void**)&gst_video_meta_set_alignment_full, "gst_video_meta_set_alignment_full", libs);
  gidLink(cast(void**)&gst_video_meta_unmap, "gst_video_meta_unmap", libs);
  gidLink(cast(void**)&gst_video_meta_get_info, "gst_video_meta_get_info", libs);

  // VideoMetaTransform
  gidLink(cast(void**)&gst_video_meta_transform_scale_get_quark, "gst_video_meta_transform_scale_get_quark", libs);

  // VideoMetaTransformMatrix
  gidLink(cast(void**)&gst_video_meta_transform_matrix_init, "gst_video_meta_transform_matrix_init", libs);
  gidLink(cast(void**)&gst_video_meta_transform_matrix_point, "gst_video_meta_transform_matrix_point", libs);
  gidLink(cast(void**)&gst_video_meta_transform_matrix_point_clipped, "gst_video_meta_transform_matrix_point_clipped", libs);
  gidLink(cast(void**)&gst_video_meta_transform_matrix_rectangle, "gst_video_meta_transform_matrix_rectangle", libs);
  gidLink(cast(void**)&gst_video_meta_transform_matrix_rectangle_clipped, "gst_video_meta_transform_matrix_rectangle_clipped", libs);
  gidLink(cast(void**)&gst_video_meta_transform_matrix_get_quark, "gst_video_meta_transform_matrix_get_quark", libs);

  // VideoMultiviewFlagsSet
  gidLink(cast(void**)&gst_video_multiview_flagset_get_type, "gst_video_multiview_flagset_get_type", libs);

  // VideoOrientation
  gidLink(cast(void**)&gst_video_orientation_get_type, "gst_video_orientation_get_type", libs);
  gidLink(cast(void**)&gst_video_orientation_from_tag, "gst_video_orientation_from_tag", libs);
  gidLink(cast(void**)&gst_video_orientation_get_hcenter, "gst_video_orientation_get_hcenter", libs);
  gidLink(cast(void**)&gst_video_orientation_get_hflip, "gst_video_orientation_get_hflip", libs);
  gidLink(cast(void**)&gst_video_orientation_get_vcenter, "gst_video_orientation_get_vcenter", libs);
  gidLink(cast(void**)&gst_video_orientation_get_vflip, "gst_video_orientation_get_vflip", libs);
  gidLink(cast(void**)&gst_video_orientation_set_hcenter, "gst_video_orientation_set_hcenter", libs);
  gidLink(cast(void**)&gst_video_orientation_set_hflip, "gst_video_orientation_set_hflip", libs);
  gidLink(cast(void**)&gst_video_orientation_set_vcenter, "gst_video_orientation_set_vcenter", libs);
  gidLink(cast(void**)&gst_video_orientation_set_vflip, "gst_video_orientation_set_vflip", libs);

  // VideoOverlay
  gidLink(cast(void**)&gst_video_overlay_get_type, "gst_video_overlay_get_type", libs);
  gidLink(cast(void**)&gst_video_overlay_install_properties, "gst_video_overlay_install_properties", libs);
  gidLink(cast(void**)&gst_video_overlay_set_property, "gst_video_overlay_set_property", libs);
  gidLink(cast(void**)&gst_video_overlay_expose, "gst_video_overlay_expose", libs);
  gidLink(cast(void**)&gst_video_overlay_got_window_handle, "gst_video_overlay_got_window_handle", libs);
  gidLink(cast(void**)&gst_video_overlay_handle_events, "gst_video_overlay_handle_events", libs);
  gidLink(cast(void**)&gst_video_overlay_prepare_window_handle, "gst_video_overlay_prepare_window_handle", libs);
  gidLink(cast(void**)&gst_video_overlay_set_render_rectangle, "gst_video_overlay_set_render_rectangle", libs);
  gidLink(cast(void**)&gst_video_overlay_set_window_handle, "gst_video_overlay_set_window_handle", libs);

  // VideoOverlayComposition
  gidLink(cast(void**)&gst_video_overlay_composition_get_type, "gst_video_overlay_composition_get_type", libs);
  gidLink(cast(void**)&gst_video_overlay_composition_new, "gst_video_overlay_composition_new", libs);
  gidLink(cast(void**)&gst_video_overlay_composition_add_rectangle, "gst_video_overlay_composition_add_rectangle", libs);
  gidLink(cast(void**)&gst_video_overlay_composition_blend, "gst_video_overlay_composition_blend", libs);
  gidLink(cast(void**)&gst_video_overlay_composition_copy, "gst_video_overlay_composition_copy", libs);
  gidLink(cast(void**)&gst_video_overlay_composition_get_rectangle, "gst_video_overlay_composition_get_rectangle", libs);
  gidLink(cast(void**)&gst_video_overlay_composition_get_seqnum, "gst_video_overlay_composition_get_seqnum", libs);
  gidLink(cast(void**)&gst_video_overlay_composition_make_writable, "gst_video_overlay_composition_make_writable", libs);
  gidLink(cast(void**)&gst_video_overlay_composition_n_rectangles, "gst_video_overlay_composition_n_rectangles", libs);

  // VideoOverlayCompositionMeta
  gidLink(cast(void**)&gst_video_overlay_composition_meta_get_info, "gst_video_overlay_composition_meta_get_info", libs);

  // VideoOverlayRectangle
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_type, "gst_video_overlay_rectangle_get_type", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_new_raw, "gst_video_overlay_rectangle_new_raw", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_copy, "gst_video_overlay_rectangle_copy", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_flags, "gst_video_overlay_rectangle_get_flags", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_global_alpha, "gst_video_overlay_rectangle_get_global_alpha", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_argb, "gst_video_overlay_rectangle_get_pixels_argb", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_ayuv, "gst_video_overlay_rectangle_get_pixels_ayuv", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_raw, "gst_video_overlay_rectangle_get_pixels_raw", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_unscaled_argb, "gst_video_overlay_rectangle_get_pixels_unscaled_argb", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_unscaled_ayuv, "gst_video_overlay_rectangle_get_pixels_unscaled_ayuv", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_pixels_unscaled_raw, "gst_video_overlay_rectangle_get_pixels_unscaled_raw", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_render_rectangle, "gst_video_overlay_rectangle_get_render_rectangle", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_get_seqnum, "gst_video_overlay_rectangle_get_seqnum", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_set_global_alpha, "gst_video_overlay_rectangle_set_global_alpha", libs);
  gidLink(cast(void**)&gst_video_overlay_rectangle_set_render_rectangle, "gst_video_overlay_rectangle_set_render_rectangle", libs);

  // VideoRegionOfInterestMeta
  gidLink(cast(void**)&gst_video_region_of_interest_meta_add_param, "gst_video_region_of_interest_meta_add_param", libs);
  gidLink(cast(void**)&gst_video_region_of_interest_meta_get_param, "gst_video_region_of_interest_meta_get_param", libs);
  gidLink(cast(void**)&gst_video_region_of_interest_meta_get_info, "gst_video_region_of_interest_meta_get_info", libs);

  // VideoResampler
  gidLink(cast(void**)&gst_video_resampler_clear, "gst_video_resampler_clear", libs);
  gidLink(cast(void**)&gst_video_resampler_init, "gst_video_resampler_init", libs);

  // VideoSEIUserDataUnregisteredMeta
  gidLink(cast(void**)&gst_video_sei_user_data_unregistered_meta_get_info, "gst_video_sei_user_data_unregistered_meta_get_info", libs);

  // VideoScaler
  gidLink(cast(void**)&gst_video_scaler_2d, "gst_video_scaler_2d", libs);
  gidLink(cast(void**)&gst_video_scaler_combine_packed_YUV, "gst_video_scaler_combine_packed_YUV", libs);
  gidLink(cast(void**)&gst_video_scaler_free, "gst_video_scaler_free", libs);
  gidLink(cast(void**)&gst_video_scaler_get_coeff, "gst_video_scaler_get_coeff", libs);
  gidLink(cast(void**)&gst_video_scaler_get_max_taps, "gst_video_scaler_get_max_taps", libs);
  gidLink(cast(void**)&gst_video_scaler_horizontal, "gst_video_scaler_horizontal", libs);
  gidLink(cast(void**)&gst_video_scaler_vertical, "gst_video_scaler_vertical", libs);
  gidLink(cast(void**)&gst_video_scaler_new, "gst_video_scaler_new", libs);

  // VideoSink
  gidLink(cast(void**)&gst_video_sink_get_type, "gst_video_sink_get_type", libs);
  gidLink(cast(void**)&gst_video_sink_center_rect, "gst_video_sink_center_rect", libs);

  // VideoTimeCode
  gidLink(cast(void**)&gst_video_time_code_get_type, "gst_video_time_code_get_type", libs);
  gidLink(cast(void**)&gst_video_time_code_new, "gst_video_time_code_new", libs);
  gidLink(cast(void**)&gst_video_time_code_new_empty, "gst_video_time_code_new_empty", libs);
  gidLink(cast(void**)&gst_video_time_code_new_from_date_time, "gst_video_time_code_new_from_date_time", libs);
  gidLink(cast(void**)&gst_video_time_code_new_from_date_time_full, "gst_video_time_code_new_from_date_time_full", libs);
  gidLink(cast(void**)&gst_video_time_code_new_from_string, "gst_video_time_code_new_from_string", libs);
  gidLink(cast(void**)&gst_video_time_code_add_frames, "gst_video_time_code_add_frames", libs);
  gidLink(cast(void**)&gst_video_time_code_add_interval, "gst_video_time_code_add_interval", libs);
  gidLink(cast(void**)&gst_video_time_code_clear, "gst_video_time_code_clear", libs);
  gidLink(cast(void**)&gst_video_time_code_compare, "gst_video_time_code_compare", libs);
  gidLink(cast(void**)&gst_video_time_code_copy, "gst_video_time_code_copy", libs);
  gidLink(cast(void**)&gst_video_time_code_frames_since_daily_jam, "gst_video_time_code_frames_since_daily_jam", libs);
  gidLink(cast(void**)&gst_video_time_code_free, "gst_video_time_code_free", libs);
  gidLink(cast(void**)&gst_video_time_code_increment_frame, "gst_video_time_code_increment_frame", libs);
  gidLink(cast(void**)&gst_video_time_code_init, "gst_video_time_code_init", libs);
  gidLink(cast(void**)&gst_video_time_code_init_from_date_time, "gst_video_time_code_init_from_date_time", libs);
  gidLink(cast(void**)&gst_video_time_code_init_from_date_time_full, "gst_video_time_code_init_from_date_time_full", libs);
  gidLink(cast(void**)&gst_video_time_code_is_valid, "gst_video_time_code_is_valid", libs);
  gidLink(cast(void**)&gst_video_time_code_nsec_since_daily_jam, "gst_video_time_code_nsec_since_daily_jam", libs);
  gidLink(cast(void**)&gst_video_time_code_to_date_time, "gst_video_time_code_to_date_time", libs);
  gidLink(cast(void**)&gst_video_time_code_to_string, "gst_video_time_code_to_string", libs);

  // VideoTimeCodeInterval
  gidLink(cast(void**)&gst_video_time_code_interval_get_type, "gst_video_time_code_interval_get_type", libs);
  gidLink(cast(void**)&gst_video_time_code_interval_new, "gst_video_time_code_interval_new", libs);
  gidLink(cast(void**)&gst_video_time_code_interval_new_from_string, "gst_video_time_code_interval_new_from_string", libs);
  gidLink(cast(void**)&gst_video_time_code_interval_clear, "gst_video_time_code_interval_clear", libs);
  gidLink(cast(void**)&gst_video_time_code_interval_copy, "gst_video_time_code_interval_copy", libs);
  gidLink(cast(void**)&gst_video_time_code_interval_free, "gst_video_time_code_interval_free", libs);
  gidLink(cast(void**)&gst_video_time_code_interval_init, "gst_video_time_code_interval_init", libs);

  // VideoTimeCodeMeta
  gidLink(cast(void**)&gst_video_time_code_meta_get_info, "gst_video_time_code_meta_get_info", libs);

  // VideoVBIEncoder
  gidLink(cast(void**)&gst_video_vbi_encoder_get_type, "gst_video_vbi_encoder_get_type", libs);
  gidLink(cast(void**)&gst_video_vbi_encoder_new, "gst_video_vbi_encoder_new", libs);
  gidLink(cast(void**)&gst_video_vbi_encoder_add_ancillary, "gst_video_vbi_encoder_add_ancillary", libs);
  gidLink(cast(void**)&gst_video_vbi_encoder_copy, "gst_video_vbi_encoder_copy", libs);
  gidLink(cast(void**)&gst_video_vbi_encoder_free, "gst_video_vbi_encoder_free", libs);
  gidLink(cast(void**)&gst_video_vbi_encoder_write_line, "gst_video_vbi_encoder_write_line", libs);

  // VideoVBIParser
  gidLink(cast(void**)&gst_video_vbi_parser_get_type, "gst_video_vbi_parser_get_type", libs);
  gidLink(cast(void**)&gst_video_vbi_parser_new, "gst_video_vbi_parser_new", libs);
  gidLink(cast(void**)&gst_video_vbi_parser_add_line, "gst_video_vbi_parser_add_line", libs);
  gidLink(cast(void**)&gst_video_vbi_parser_copy, "gst_video_vbi_parser_copy", libs);
  gidLink(cast(void**)&gst_video_vbi_parser_free, "gst_video_vbi_parser_free", libs);
  gidLink(cast(void**)&gst_video_vbi_parser_get_ancillary, "gst_video_vbi_parser_get_ancillary", libs);

  // global
  gidLink(cast(void**)&gst_ancillary_meta_api_get_type, "gst_ancillary_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_buffer_add_ancillary_meta, "gst_buffer_add_ancillary_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_afd_meta, "gst_buffer_add_video_afd_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_affine_transformation_meta, "gst_buffer_add_video_affine_transformation_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_bar_meta, "gst_buffer_add_video_bar_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_caption_meta, "gst_buffer_add_video_caption_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_codec_alpha_meta, "gst_buffer_add_video_codec_alpha_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_gl_texture_upload_meta, "gst_buffer_add_video_gl_texture_upload_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_meta, "gst_buffer_add_video_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_meta_full, "gst_buffer_add_video_meta_full", libs);
  gidLink(cast(void**)&gst_buffer_add_video_overlay_composition_meta, "gst_buffer_add_video_overlay_composition_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_region_of_interest_meta, "gst_buffer_add_video_region_of_interest_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_region_of_interest_meta_id, "gst_buffer_add_video_region_of_interest_meta_id", libs);
  gidLink(cast(void**)&gst_buffer_add_video_sei_user_data_unregistered_meta, "gst_buffer_add_video_sei_user_data_unregistered_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_time_code_meta, "gst_buffer_add_video_time_code_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_video_time_code_meta_full, "gst_buffer_add_video_time_code_meta_full", libs);
  gidLink(cast(void**)&gst_buffer_get_video_meta, "gst_buffer_get_video_meta", libs);
  gidLink(cast(void**)&gst_buffer_get_video_meta_id, "gst_buffer_get_video_meta_id", libs);
  gidLink(cast(void**)&gst_buffer_get_video_region_of_interest_meta_id, "gst_buffer_get_video_region_of_interest_meta_id", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_get_video_alignment, "gst_buffer_pool_config_get_video_alignment", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_set_video_alignment, "gst_buffer_pool_config_set_video_alignment", libs);
  gidLink(cast(void**)&gst_is_video_overlay_prepare_window_handle_message, "gst_is_video_overlay_prepare_window_handle_message", libs);
  gidLink(cast(void**)&gst_video_afd_meta_api_get_type, "gst_video_afd_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_affine_transformation_meta_api_get_type, "gst_video_affine_transformation_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_bar_meta_api_get_type, "gst_video_bar_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_blend, "gst_video_blend", libs);
  gidLink(cast(void**)&gst_video_blend_scale_linear_RGBA, "gst_video_blend_scale_linear_RGBA", libs);
  gidLink(cast(void**)&gst_video_calculate_display_ratio, "gst_video_calculate_display_ratio", libs);
  gidLink(cast(void**)&gst_video_caption_meta_api_get_type, "gst_video_caption_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_center_rect, "gst_video_center_rect", libs);
  gidLink(cast(void**)&gst_video_chroma_from_string, "gst_video_chroma_from_string", libs);
  gidLink(cast(void**)&gst_video_chroma_resample, "gst_video_chroma_resample", libs);
  gidLink(cast(void**)&gst_video_chroma_to_string, "gst_video_chroma_to_string", libs);
  gidLink(cast(void**)&gst_video_codec_alpha_meta_api_get_type, "gst_video_codec_alpha_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_color_transfer_decode, "gst_video_color_transfer_decode", libs);
  gidLink(cast(void**)&gst_video_color_transfer_encode, "gst_video_color_transfer_encode", libs);
  gidLink(cast(void**)&gst_video_convert_sample, "gst_video_convert_sample", libs);
  gidLink(cast(void**)&gst_video_convert_sample_async, "gst_video_convert_sample_async", libs);
  gidLink(cast(void**)&gst_video_crop_meta_api_get_type, "gst_video_crop_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_dma_drm_format_from_gst_format, "gst_video_dma_drm_format_from_gst_format", libs);
  gidLink(cast(void**)&gst_video_dma_drm_format_to_gst_format, "gst_video_dma_drm_format_to_gst_format", libs);
  gidLink(cast(void**)&gst_video_dma_drm_fourcc_from_format, "gst_video_dma_drm_fourcc_from_format", libs);
  gidLink(cast(void**)&gst_video_dma_drm_fourcc_from_string, "gst_video_dma_drm_fourcc_from_string", libs);
  gidLink(cast(void**)&gst_video_dma_drm_fourcc_to_format, "gst_video_dma_drm_fourcc_to_format", libs);
  gidLink(cast(void**)&gst_video_dma_drm_fourcc_to_string, "gst_video_dma_drm_fourcc_to_string", libs);
  gidLink(cast(void**)&gst_video_event_is_force_key_unit, "gst_video_event_is_force_key_unit", libs);
  gidLink(cast(void**)&gst_video_event_new_downstream_force_key_unit, "gst_video_event_new_downstream_force_key_unit", libs);
  gidLink(cast(void**)&gst_video_event_new_still_frame, "gst_video_event_new_still_frame", libs);
  gidLink(cast(void**)&gst_video_event_new_upstream_force_key_unit, "gst_video_event_new_upstream_force_key_unit", libs);
  gidLink(cast(void**)&gst_video_event_parse_downstream_force_key_unit, "gst_video_event_parse_downstream_force_key_unit", libs);
  gidLink(cast(void**)&gst_video_event_parse_still_frame, "gst_video_event_parse_still_frame", libs);
  gidLink(cast(void**)&gst_video_event_parse_upstream_force_key_unit, "gst_video_event_parse_upstream_force_key_unit", libs);
  gidLink(cast(void**)&gst_video_formats_any, "gst_video_formats_any", libs);
  gidLink(cast(void**)&gst_video_formats_raw, "gst_video_formats_raw", libs);
  gidLink(cast(void**)&gst_video_gl_texture_upload_meta_api_get_type, "gst_video_gl_texture_upload_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_guess_framerate, "gst_video_guess_framerate", libs);
  gidLink(cast(void**)&gst_video_is_common_aspect_ratio, "gst_video_is_common_aspect_ratio", libs);
  gidLink(cast(void**)&gst_video_is_dma_drm_caps, "gst_video_is_dma_drm_caps", libs);
  gidLink(cast(void**)&gst_video_make_raw_caps, "gst_video_make_raw_caps", libs);
  gidLink(cast(void**)&gst_video_make_raw_caps_with_features, "gst_video_make_raw_caps_with_features", libs);
  gidLink(cast(void**)&gst_video_meta_api_get_type, "gst_video_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_multiview_get_doubled_height_modes, "gst_video_multiview_get_doubled_height_modes", libs);
  gidLink(cast(void**)&gst_video_multiview_get_doubled_size_modes, "gst_video_multiview_get_doubled_size_modes", libs);
  gidLink(cast(void**)&gst_video_multiview_get_doubled_width_modes, "gst_video_multiview_get_doubled_width_modes", libs);
  gidLink(cast(void**)&gst_video_multiview_get_mono_modes, "gst_video_multiview_get_mono_modes", libs);
  gidLink(cast(void**)&gst_video_multiview_get_unpacked_modes, "gst_video_multiview_get_unpacked_modes", libs);
  gidLink(cast(void**)&gst_video_multiview_guess_half_aspect, "gst_video_multiview_guess_half_aspect", libs);
  gidLink(cast(void**)&gst_video_multiview_video_info_change_mode, "gst_video_multiview_video_info_change_mode", libs);
  gidLink(cast(void**)&gst_video_overlay_composition_meta_api_get_type, "gst_video_overlay_composition_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_region_of_interest_meta_api_get_type, "gst_video_region_of_interest_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_sei_user_data_unregistered_meta_api_get_type, "gst_video_sei_user_data_unregistered_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_video_sei_user_data_unregistered_parse_precision_time_stamp, "gst_video_sei_user_data_unregistered_parse_precision_time_stamp", libs);
  gidLink(cast(void**)&gst_video_tile_get_index, "gst_video_tile_get_index", libs);
  gidLink(cast(void**)&gst_video_time_code_meta_api_get_type, "gst_video_time_code_meta_api_get_type", libs);

  // VideoCaptionType
  gidLink(cast(void**)&gst_video_caption_type_from_caps, "gst_video_caption_type_from_caps", libs);
  gidLink(cast(void**)&gst_video_caption_type_to_caps, "gst_video_caption_type_to_caps", libs);

  // VideoChromaSite
  gidLink(cast(void**)&gst_video_chroma_site_from_string, "gst_video_chroma_site_from_string", libs);
  gidLink(cast(void**)&gst_video_chroma_site_to_string, "gst_video_chroma_site_to_string", libs);

  // VideoColorMatrix
  gidLink(cast(void**)&gst_video_color_matrix_from_iso, "gst_video_color_matrix_from_iso", libs);
  gidLink(cast(void**)&gst_video_color_matrix_get_Kr_Kb, "gst_video_color_matrix_get_Kr_Kb", libs);
  gidLink(cast(void**)&gst_video_color_matrix_to_iso, "gst_video_color_matrix_to_iso", libs);

  // VideoColorPrimaries
  gidLink(cast(void**)&gst_video_color_primaries_from_iso, "gst_video_color_primaries_from_iso", libs);
  gidLink(cast(void**)&gst_video_color_primaries_get_info, "gst_video_color_primaries_get_info", libs);
  gidLink(cast(void**)&gst_video_color_primaries_is_equivalent, "gst_video_color_primaries_is_equivalent", libs);
  gidLink(cast(void**)&gst_video_color_primaries_to_iso, "gst_video_color_primaries_to_iso", libs);

  // VideoColorRange
  gidLink(cast(void**)&gst_video_color_range_offsets, "gst_video_color_range_offsets", libs);

  // VideoFieldOrder
  gidLink(cast(void**)&gst_video_field_order_from_string, "gst_video_field_order_from_string", libs);
  gidLink(cast(void**)&gst_video_field_order_to_string, "gst_video_field_order_to_string", libs);

  // VideoFormat
  gidLink(cast(void**)&gst_video_format_from_fourcc, "gst_video_format_from_fourcc", libs);
  gidLink(cast(void**)&gst_video_format_from_masks, "gst_video_format_from_masks", libs);
  gidLink(cast(void**)&gst_video_format_from_string, "gst_video_format_from_string", libs);
  gidLink(cast(void**)&gst_video_format_get_info, "gst_video_format_get_info", libs);
  gidLink(cast(void**)&gst_video_format_get_palette, "gst_video_format_get_palette", libs);
  gidLink(cast(void**)&gst_video_format_to_fourcc, "gst_video_format_to_fourcc", libs);
  gidLink(cast(void**)&gst_video_format_to_string, "gst_video_format_to_string", libs);

  // VideoInterlaceMode
  gidLink(cast(void**)&gst_video_interlace_mode_from_string, "gst_video_interlace_mode_from_string", libs);
  gidLink(cast(void**)&gst_video_interlace_mode_to_string, "gst_video_interlace_mode_to_string", libs);

  // VideoMultiviewMode
  gidLink(cast(void**)&gst_video_multiview_mode_from_caps_string, "gst_video_multiview_mode_from_caps_string", libs);
  gidLink(cast(void**)&gst_video_multiview_mode_to_caps_string, "gst_video_multiview_mode_to_caps_string", libs);

  // VideoTransferFunction
  gidLink(cast(void**)&gst_video_transfer_function_decode, "gst_video_transfer_function_decode", libs);
  gidLink(cast(void**)&gst_video_transfer_function_encode, "gst_video_transfer_function_encode", libs);
  gidLink(cast(void**)&gst_video_transfer_function_from_iso, "gst_video_transfer_function_from_iso", libs);
  gidLink(cast(void**)&gst_video_transfer_function_is_equivalent, "gst_video_transfer_function_is_equivalent", libs);
  gidLink(cast(void**)&gst_video_transfer_function_to_iso, "gst_video_transfer_function_to_iso", libs);
}
