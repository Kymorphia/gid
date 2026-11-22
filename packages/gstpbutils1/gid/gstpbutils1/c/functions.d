/// C functions for gstpbutils1 library
module gid.gstpbutils1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstpbutils1.c.types;
public import gid.gst1.c.types;
public import gid.gstaudio1.c.types;
public import gid.gstbase1.c.types;
public import gid.gstvideo1.c.types;

private immutable LIBS = ["gstpbutils-1.0_0"];

// AudioVisualizer
private alias c_gst_audio_visualizer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_audio_visualizer_get_typeFn c_gst_audio_visualizer_get_type; ///

// Discoverer
private alias c_gst_discoverer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_discoverer_get_typeFn c_gst_discoverer_get_type; ///
private alias c_gst_discoverer_newFn = extern(C) GstDiscoverer* function(GstClockTime timeout, GError** _err) nothrow;
__gshared c_gst_discoverer_newFn c_gst_discoverer_new; ///
private alias c_gst_discoverer_discover_uriFn = extern(C) GstDiscovererInfo* function(GstDiscoverer* discoverer, const(char)* uri, GError** _err) nothrow;
__gshared c_gst_discoverer_discover_uriFn c_gst_discoverer_discover_uri; ///
private alias c_gst_discoverer_discover_uri_asyncFn = extern(C) gboolean function(GstDiscoverer* discoverer, const(char)* uri) nothrow;
__gshared c_gst_discoverer_discover_uri_asyncFn c_gst_discoverer_discover_uri_async; ///
private alias c_gst_discoverer_startFn = extern(C) void function(GstDiscoverer* discoverer) nothrow;
__gshared c_gst_discoverer_startFn c_gst_discoverer_start; ///
private alias c_gst_discoverer_stopFn = extern(C) void function(GstDiscoverer* discoverer) nothrow;
__gshared c_gst_discoverer_stopFn c_gst_discoverer_stop; ///

// DiscovererAudioInfo
private alias c_gst_discoverer_audio_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_discoverer_audio_info_get_typeFn c_gst_discoverer_audio_info_get_type; ///
private alias c_gst_discoverer_audio_info_get_bitrateFn = extern(C) uint function(const(GstDiscovererAudioInfo)* info) nothrow;
__gshared c_gst_discoverer_audio_info_get_bitrateFn c_gst_discoverer_audio_info_get_bitrate; ///
private alias c_gst_discoverer_audio_info_get_channel_maskFn = extern(C) ulong function(const(GstDiscovererAudioInfo)* info) nothrow;
__gshared c_gst_discoverer_audio_info_get_channel_maskFn c_gst_discoverer_audio_info_get_channel_mask; ///
private alias c_gst_discoverer_audio_info_get_channelsFn = extern(C) uint function(const(GstDiscovererAudioInfo)* info) nothrow;
__gshared c_gst_discoverer_audio_info_get_channelsFn c_gst_discoverer_audio_info_get_channels; ///
private alias c_gst_discoverer_audio_info_get_depthFn = extern(C) uint function(const(GstDiscovererAudioInfo)* info) nothrow;
__gshared c_gst_discoverer_audio_info_get_depthFn c_gst_discoverer_audio_info_get_depth; ///
private alias c_gst_discoverer_audio_info_get_languageFn = extern(C) const(char)* function(const(GstDiscovererAudioInfo)* info) nothrow;
__gshared c_gst_discoverer_audio_info_get_languageFn c_gst_discoverer_audio_info_get_language; ///
private alias c_gst_discoverer_audio_info_get_max_bitrateFn = extern(C) uint function(const(GstDiscovererAudioInfo)* info) nothrow;
__gshared c_gst_discoverer_audio_info_get_max_bitrateFn c_gst_discoverer_audio_info_get_max_bitrate; ///
private alias c_gst_discoverer_audio_info_get_sample_rateFn = extern(C) uint function(const(GstDiscovererAudioInfo)* info) nothrow;
__gshared c_gst_discoverer_audio_info_get_sample_rateFn c_gst_discoverer_audio_info_get_sample_rate; ///

// DiscovererContainerInfo
private alias c_gst_discoverer_container_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_discoverer_container_info_get_typeFn c_gst_discoverer_container_info_get_type; ///
private alias c_gst_discoverer_container_info_get_streamsFn = extern(C) GList* function(GstDiscovererContainerInfo* info) nothrow;
__gshared c_gst_discoverer_container_info_get_streamsFn c_gst_discoverer_container_info_get_streams; ///
private alias c_gst_discoverer_container_info_get_tagsFn = extern(C) const(GstTagList)* function(const(GstDiscovererContainerInfo)* info) nothrow;
__gshared c_gst_discoverer_container_info_get_tagsFn c_gst_discoverer_container_info_get_tags; ///

// DiscovererInfo
private alias c_gst_discoverer_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_discoverer_info_get_typeFn c_gst_discoverer_info_get_type; ///
private alias c_gst_discoverer_info_from_variantFn = extern(C) GstDiscovererInfo* function(GVariant* variant) nothrow;
__gshared c_gst_discoverer_info_from_variantFn c_gst_discoverer_info_from_variant; ///
private alias c_gst_discoverer_info_copyFn = extern(C) GstDiscovererInfo* function(GstDiscovererInfo* ptr) nothrow;
__gshared c_gst_discoverer_info_copyFn c_gst_discoverer_info_copy; ///
private alias c_gst_discoverer_info_get_audio_streamsFn = extern(C) GList* function(GstDiscovererInfo* info) nothrow;
__gshared c_gst_discoverer_info_get_audio_streamsFn c_gst_discoverer_info_get_audio_streams; ///
private alias c_gst_discoverer_info_get_container_streamsFn = extern(C) GList* function(GstDiscovererInfo* info) nothrow;
__gshared c_gst_discoverer_info_get_container_streamsFn c_gst_discoverer_info_get_container_streams; ///
private alias c_gst_discoverer_info_get_durationFn = extern(C) GstClockTime function(const(GstDiscovererInfo)* info) nothrow;
__gshared c_gst_discoverer_info_get_durationFn c_gst_discoverer_info_get_duration; ///
private alias c_gst_discoverer_info_get_liveFn = extern(C) gboolean function(const(GstDiscovererInfo)* info) nothrow;
__gshared c_gst_discoverer_info_get_liveFn c_gst_discoverer_info_get_live; ///
private alias c_gst_discoverer_info_get_miscFn = extern(C) const(GstStructure)* function(const(GstDiscovererInfo)* info) nothrow;
__gshared c_gst_discoverer_info_get_miscFn c_gst_discoverer_info_get_misc; ///
private alias c_gst_discoverer_info_get_missing_elements_installer_detailsFn = extern(C) const(char*)* function(const(GstDiscovererInfo)* info) nothrow;
__gshared c_gst_discoverer_info_get_missing_elements_installer_detailsFn c_gst_discoverer_info_get_missing_elements_installer_details; ///
private alias c_gst_discoverer_info_get_resultFn = extern(C) GstDiscovererResult function(const(GstDiscovererInfo)* info) nothrow;
__gshared c_gst_discoverer_info_get_resultFn c_gst_discoverer_info_get_result; ///
private alias c_gst_discoverer_info_get_seekableFn = extern(C) gboolean function(const(GstDiscovererInfo)* info) nothrow;
__gshared c_gst_discoverer_info_get_seekableFn c_gst_discoverer_info_get_seekable; ///
private alias c_gst_discoverer_info_get_stream_infoFn = extern(C) GstDiscovererStreamInfo* function(GstDiscovererInfo* info) nothrow;
__gshared c_gst_discoverer_info_get_stream_infoFn c_gst_discoverer_info_get_stream_info; ///
private alias c_gst_discoverer_info_get_stream_listFn = extern(C) GList* function(GstDiscovererInfo* info) nothrow;
__gshared c_gst_discoverer_info_get_stream_listFn c_gst_discoverer_info_get_stream_list; ///
private alias c_gst_discoverer_info_get_streamsFn = extern(C) GList* function(GstDiscovererInfo* info, GType streamtype) nothrow;
__gshared c_gst_discoverer_info_get_streamsFn c_gst_discoverer_info_get_streams; ///
private alias c_gst_discoverer_info_get_subtitle_streamsFn = extern(C) GList* function(GstDiscovererInfo* info) nothrow;
__gshared c_gst_discoverer_info_get_subtitle_streamsFn c_gst_discoverer_info_get_subtitle_streams; ///
private alias c_gst_discoverer_info_get_tagsFn = extern(C) const(GstTagList)* function(const(GstDiscovererInfo)* info) nothrow;
__gshared c_gst_discoverer_info_get_tagsFn c_gst_discoverer_info_get_tags; ///
private alias c_gst_discoverer_info_get_tocFn = extern(C) const(GstToc)* function(const(GstDiscovererInfo)* info) nothrow;
__gshared c_gst_discoverer_info_get_tocFn c_gst_discoverer_info_get_toc; ///
private alias c_gst_discoverer_info_get_uriFn = extern(C) const(char)* function(const(GstDiscovererInfo)* info) nothrow;
__gshared c_gst_discoverer_info_get_uriFn c_gst_discoverer_info_get_uri; ///
private alias c_gst_discoverer_info_get_video_streamsFn = extern(C) GList* function(GstDiscovererInfo* info) nothrow;
__gshared c_gst_discoverer_info_get_video_streamsFn c_gst_discoverer_info_get_video_streams; ///
private alias c_gst_discoverer_info_to_variantFn = extern(C) GVariant* function(GstDiscovererInfo* info, GstDiscovererSerializeFlags flags) nothrow;
__gshared c_gst_discoverer_info_to_variantFn c_gst_discoverer_info_to_variant; ///

// DiscovererStreamInfo
private alias c_gst_discoverer_stream_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_discoverer_stream_info_get_typeFn c_gst_discoverer_stream_info_get_type; ///
private alias c_gst_discoverer_stream_info_list_freeFn = extern(C) void function(GList* infos) nothrow;
__gshared c_gst_discoverer_stream_info_list_freeFn c_gst_discoverer_stream_info_list_free; ///
private alias c_gst_discoverer_stream_info_get_capsFn = extern(C) GstCaps* function(GstDiscovererStreamInfo* info) nothrow;
__gshared c_gst_discoverer_stream_info_get_capsFn c_gst_discoverer_stream_info_get_caps; ///
private alias c_gst_discoverer_stream_info_get_miscFn = extern(C) const(GstStructure)* function(GstDiscovererStreamInfo* info) nothrow;
__gshared c_gst_discoverer_stream_info_get_miscFn c_gst_discoverer_stream_info_get_misc; ///
private alias c_gst_discoverer_stream_info_get_nextFn = extern(C) GstDiscovererStreamInfo* function(GstDiscovererStreamInfo* info) nothrow;
__gshared c_gst_discoverer_stream_info_get_nextFn c_gst_discoverer_stream_info_get_next; ///
private alias c_gst_discoverer_stream_info_get_previousFn = extern(C) GstDiscovererStreamInfo* function(GstDiscovererStreamInfo* info) nothrow;
__gshared c_gst_discoverer_stream_info_get_previousFn c_gst_discoverer_stream_info_get_previous; ///
private alias c_gst_discoverer_stream_info_get_stream_idFn = extern(C) const(char)* function(GstDiscovererStreamInfo* info) nothrow;
__gshared c_gst_discoverer_stream_info_get_stream_idFn c_gst_discoverer_stream_info_get_stream_id; ///
private alias c_gst_discoverer_stream_info_get_stream_numberFn = extern(C) int function(GstDiscovererStreamInfo* info) nothrow;
__gshared c_gst_discoverer_stream_info_get_stream_numberFn c_gst_discoverer_stream_info_get_stream_number; ///
private alias c_gst_discoverer_stream_info_get_stream_type_nickFn = extern(C) const(char)* function(GstDiscovererStreamInfo* info) nothrow;
__gshared c_gst_discoverer_stream_info_get_stream_type_nickFn c_gst_discoverer_stream_info_get_stream_type_nick; ///
private alias c_gst_discoverer_stream_info_get_tagsFn = extern(C) const(GstTagList)* function(GstDiscovererStreamInfo* info) nothrow;
__gshared c_gst_discoverer_stream_info_get_tagsFn c_gst_discoverer_stream_info_get_tags; ///
private alias c_gst_discoverer_stream_info_get_tocFn = extern(C) const(GstToc)* function(GstDiscovererStreamInfo* info) nothrow;
__gshared c_gst_discoverer_stream_info_get_tocFn c_gst_discoverer_stream_info_get_toc; ///

// DiscovererSubtitleInfo
private alias c_gst_discoverer_subtitle_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_discoverer_subtitle_info_get_typeFn c_gst_discoverer_subtitle_info_get_type; ///
private alias c_gst_discoverer_subtitle_info_get_languageFn = extern(C) const(char)* function(const(GstDiscovererSubtitleInfo)* info) nothrow;
__gshared c_gst_discoverer_subtitle_info_get_languageFn c_gst_discoverer_subtitle_info_get_language; ///

// DiscovererVideoInfo
private alias c_gst_discoverer_video_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_discoverer_video_info_get_typeFn c_gst_discoverer_video_info_get_type; ///
private alias c_gst_discoverer_video_info_get_bitrateFn = extern(C) uint function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_get_bitrateFn c_gst_discoverer_video_info_get_bitrate; ///
private alias c_gst_discoverer_video_info_get_depthFn = extern(C) uint function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_get_depthFn c_gst_discoverer_video_info_get_depth; ///
private alias c_gst_discoverer_video_info_get_framerate_denomFn = extern(C) uint function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_get_framerate_denomFn c_gst_discoverer_video_info_get_framerate_denom; ///
private alias c_gst_discoverer_video_info_get_framerate_numFn = extern(C) uint function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_get_framerate_numFn c_gst_discoverer_video_info_get_framerate_num; ///
private alias c_gst_discoverer_video_info_get_heightFn = extern(C) uint function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_get_heightFn c_gst_discoverer_video_info_get_height; ///
private alias c_gst_discoverer_video_info_get_max_bitrateFn = extern(C) uint function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_get_max_bitrateFn c_gst_discoverer_video_info_get_max_bitrate; ///
private alias c_gst_discoverer_video_info_get_par_denomFn = extern(C) uint function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_get_par_denomFn c_gst_discoverer_video_info_get_par_denom; ///
private alias c_gst_discoverer_video_info_get_par_numFn = extern(C) uint function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_get_par_numFn c_gst_discoverer_video_info_get_par_num; ///
private alias c_gst_discoverer_video_info_get_widthFn = extern(C) uint function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_get_widthFn c_gst_discoverer_video_info_get_width; ///
private alias c_gst_discoverer_video_info_is_imageFn = extern(C) gboolean function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_is_imageFn c_gst_discoverer_video_info_is_image; ///
private alias c_gst_discoverer_video_info_is_interlacedFn = extern(C) gboolean function(const(GstDiscovererVideoInfo)* info) nothrow;
__gshared c_gst_discoverer_video_info_is_interlacedFn c_gst_discoverer_video_info_is_interlaced; ///

// EncodingAudioProfile
private alias c_gst_encoding_audio_profile_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_encoding_audio_profile_get_typeFn c_gst_encoding_audio_profile_get_type; ///
private alias c_gst_encoding_audio_profile_newFn = extern(C) GstEncodingAudioProfile* function(GstCaps* format, const(char)* preset, GstCaps* restriction, uint presence) nothrow;
__gshared c_gst_encoding_audio_profile_newFn c_gst_encoding_audio_profile_new; ///

// EncodingContainerProfile
private alias c_gst_encoding_container_profile_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_encoding_container_profile_get_typeFn c_gst_encoding_container_profile_get_type; ///
private alias c_gst_encoding_container_profile_newFn = extern(C) GstEncodingContainerProfile* function(const(char)* name, const(char)* description, GstCaps* format, const(char)* preset) nothrow;
__gshared c_gst_encoding_container_profile_newFn c_gst_encoding_container_profile_new; ///
private alias c_gst_encoding_container_profile_add_profileFn = extern(C) gboolean function(GstEncodingContainerProfile* container, GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_container_profile_add_profileFn c_gst_encoding_container_profile_add_profile; ///
private alias c_gst_encoding_container_profile_contains_profileFn = extern(C) gboolean function(GstEncodingContainerProfile* container, GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_container_profile_contains_profileFn c_gst_encoding_container_profile_contains_profile; ///
private alias c_gst_encoding_container_profile_get_profilesFn = extern(C) const(GList)* function(GstEncodingContainerProfile* profile) nothrow;
__gshared c_gst_encoding_container_profile_get_profilesFn c_gst_encoding_container_profile_get_profiles; ///

// EncodingProfile
private alias c_gst_encoding_profile_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_encoding_profile_get_typeFn c_gst_encoding_profile_get_type; ///
private alias c_gst_encoding_profile_findFn = extern(C) GstEncodingProfile* function(const(char)* targetname, const(char)* profilename, const(char)* category) nothrow;
__gshared c_gst_encoding_profile_findFn c_gst_encoding_profile_find; ///
private alias c_gst_encoding_profile_from_discovererFn = extern(C) GstEncodingProfile* function(GstDiscovererInfo* info) nothrow;
__gshared c_gst_encoding_profile_from_discovererFn c_gst_encoding_profile_from_discoverer; ///
private alias c_gst_encoding_profile_from_stringFn = extern(C) GstEncodingProfile* function(const(char)* string_) nothrow;
__gshared c_gst_encoding_profile_from_stringFn c_gst_encoding_profile_from_string; ///
private alias c_gst_encoding_profile_copyFn = extern(C) GstEncodingProfile* function(GstEncodingProfile* self) nothrow;
__gshared c_gst_encoding_profile_copyFn c_gst_encoding_profile_copy; ///
private alias c_gst_encoding_profile_get_allow_dynamic_outputFn = extern(C) gboolean function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_allow_dynamic_outputFn c_gst_encoding_profile_get_allow_dynamic_output; ///
private alias c_gst_encoding_profile_get_descriptionFn = extern(C) const(char)* function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_descriptionFn c_gst_encoding_profile_get_description; ///
private alias c_gst_encoding_profile_get_element_propertiesFn = extern(C) GstStructure* function(GstEncodingProfile* self) nothrow;
__gshared c_gst_encoding_profile_get_element_propertiesFn c_gst_encoding_profile_get_element_properties; ///
private alias c_gst_encoding_profile_get_file_extensionFn = extern(C) const(char)* function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_file_extensionFn c_gst_encoding_profile_get_file_extension; ///
private alias c_gst_encoding_profile_get_formatFn = extern(C) GstCaps* function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_formatFn c_gst_encoding_profile_get_format; ///
private alias c_gst_encoding_profile_get_input_capsFn = extern(C) GstCaps* function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_input_capsFn c_gst_encoding_profile_get_input_caps; ///
private alias c_gst_encoding_profile_get_nameFn = extern(C) const(char)* function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_nameFn c_gst_encoding_profile_get_name; ///
private alias c_gst_encoding_profile_get_presenceFn = extern(C) uint function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_presenceFn c_gst_encoding_profile_get_presence; ///
private alias c_gst_encoding_profile_get_presetFn = extern(C) const(char)* function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_presetFn c_gst_encoding_profile_get_preset; ///
private alias c_gst_encoding_profile_get_preset_nameFn = extern(C) const(char)* function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_preset_nameFn c_gst_encoding_profile_get_preset_name; ///
private alias c_gst_encoding_profile_get_restrictionFn = extern(C) GstCaps* function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_restrictionFn c_gst_encoding_profile_get_restriction; ///
private alias c_gst_encoding_profile_get_single_segmentFn = extern(C) gboolean function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_single_segmentFn c_gst_encoding_profile_get_single_segment; ///
private alias c_gst_encoding_profile_get_type_nickFn = extern(C) const(char)* function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_get_type_nickFn c_gst_encoding_profile_get_type_nick; ///
private alias c_gst_encoding_profile_is_enabledFn = extern(C) gboolean function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_is_enabledFn c_gst_encoding_profile_is_enabled; ///
private alias c_gst_encoding_profile_is_equalFn = extern(C) gboolean function(GstEncodingProfile* a, GstEncodingProfile* b) nothrow;
__gshared c_gst_encoding_profile_is_equalFn c_gst_encoding_profile_is_equal; ///
private alias c_gst_encoding_profile_set_allow_dynamic_outputFn = extern(C) void function(GstEncodingProfile* profile, gboolean allowDynamicOutput) nothrow;
__gshared c_gst_encoding_profile_set_allow_dynamic_outputFn c_gst_encoding_profile_set_allow_dynamic_output; ///
private alias c_gst_encoding_profile_set_descriptionFn = extern(C) void function(GstEncodingProfile* profile, const(char)* description) nothrow;
__gshared c_gst_encoding_profile_set_descriptionFn c_gst_encoding_profile_set_description; ///
private alias c_gst_encoding_profile_set_element_propertiesFn = extern(C) void function(GstEncodingProfile* self, GstStructure* elementProperties) nothrow;
__gshared c_gst_encoding_profile_set_element_propertiesFn c_gst_encoding_profile_set_element_properties; ///
private alias c_gst_encoding_profile_set_enabledFn = extern(C) void function(GstEncodingProfile* profile, gboolean enabled) nothrow;
__gshared c_gst_encoding_profile_set_enabledFn c_gst_encoding_profile_set_enabled; ///
private alias c_gst_encoding_profile_set_formatFn = extern(C) void function(GstEncodingProfile* profile, GstCaps* format) nothrow;
__gshared c_gst_encoding_profile_set_formatFn c_gst_encoding_profile_set_format; ///
private alias c_gst_encoding_profile_set_nameFn = extern(C) void function(GstEncodingProfile* profile, const(char)* name) nothrow;
__gshared c_gst_encoding_profile_set_nameFn c_gst_encoding_profile_set_name; ///
private alias c_gst_encoding_profile_set_presenceFn = extern(C) void function(GstEncodingProfile* profile, uint presence) nothrow;
__gshared c_gst_encoding_profile_set_presenceFn c_gst_encoding_profile_set_presence; ///
private alias c_gst_encoding_profile_set_presetFn = extern(C) void function(GstEncodingProfile* profile, const(char)* preset) nothrow;
__gshared c_gst_encoding_profile_set_presetFn c_gst_encoding_profile_set_preset; ///
private alias c_gst_encoding_profile_set_preset_nameFn = extern(C) void function(GstEncodingProfile* profile, const(char)* presetName) nothrow;
__gshared c_gst_encoding_profile_set_preset_nameFn c_gst_encoding_profile_set_preset_name; ///
private alias c_gst_encoding_profile_set_restrictionFn = extern(C) void function(GstEncodingProfile* profile, GstCaps* restriction) nothrow;
__gshared c_gst_encoding_profile_set_restrictionFn c_gst_encoding_profile_set_restriction; ///
private alias c_gst_encoding_profile_set_single_segmentFn = extern(C) void function(GstEncodingProfile* profile, gboolean singleSegment) nothrow;
__gshared c_gst_encoding_profile_set_single_segmentFn c_gst_encoding_profile_set_single_segment; ///
private alias c_gst_encoding_profile_to_stringFn = extern(C) char* function(GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_profile_to_stringFn c_gst_encoding_profile_to_string; ///

// EncodingTarget
private alias c_gst_encoding_target_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_encoding_target_get_typeFn c_gst_encoding_target_get_type; ///
private alias c_gst_encoding_target_newFn = extern(C) GstEncodingTarget* function(const(char)* name, const(char)* category, const(char)* description, const(GList)* profiles) nothrow;
__gshared c_gst_encoding_target_newFn c_gst_encoding_target_new; ///
private alias c_gst_encoding_target_loadFn = extern(C) GstEncodingTarget* function(const(char)* name, const(char)* category, GError** _err) nothrow;
__gshared c_gst_encoding_target_loadFn c_gst_encoding_target_load; ///
private alias c_gst_encoding_target_load_from_fileFn = extern(C) GstEncodingTarget* function(const(char)* filepath, GError** _err) nothrow;
__gshared c_gst_encoding_target_load_from_fileFn c_gst_encoding_target_load_from_file; ///
private alias c_gst_encoding_target_add_profileFn = extern(C) gboolean function(GstEncodingTarget* target, GstEncodingProfile* profile) nothrow;
__gshared c_gst_encoding_target_add_profileFn c_gst_encoding_target_add_profile; ///
private alias c_gst_encoding_target_get_categoryFn = extern(C) const(char)* function(GstEncodingTarget* target) nothrow;
__gshared c_gst_encoding_target_get_categoryFn c_gst_encoding_target_get_category; ///
private alias c_gst_encoding_target_get_descriptionFn = extern(C) const(char)* function(GstEncodingTarget* target) nothrow;
__gshared c_gst_encoding_target_get_descriptionFn c_gst_encoding_target_get_description; ///
private alias c_gst_encoding_target_get_nameFn = extern(C) const(char)* function(GstEncodingTarget* target) nothrow;
__gshared c_gst_encoding_target_get_nameFn c_gst_encoding_target_get_name; ///
private alias c_gst_encoding_target_get_pathFn = extern(C) const(char)* function(GstEncodingTarget* target) nothrow;
__gshared c_gst_encoding_target_get_pathFn c_gst_encoding_target_get_path; ///
private alias c_gst_encoding_target_get_profileFn = extern(C) GstEncodingProfile* function(GstEncodingTarget* target, const(char)* name) nothrow;
__gshared c_gst_encoding_target_get_profileFn c_gst_encoding_target_get_profile; ///
private alias c_gst_encoding_target_get_profilesFn = extern(C) const(GList)* function(GstEncodingTarget* target) nothrow;
__gshared c_gst_encoding_target_get_profilesFn c_gst_encoding_target_get_profiles; ///
private alias c_gst_encoding_target_saveFn = extern(C) gboolean function(GstEncodingTarget* target, GError** _err) nothrow;
__gshared c_gst_encoding_target_saveFn c_gst_encoding_target_save; ///
private alias c_gst_encoding_target_save_to_fileFn = extern(C) gboolean function(GstEncodingTarget* target, const(char)* filepath, GError** _err) nothrow;
__gshared c_gst_encoding_target_save_to_fileFn c_gst_encoding_target_save_to_file; ///

// EncodingVideoProfile
private alias c_gst_encoding_video_profile_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_encoding_video_profile_get_typeFn c_gst_encoding_video_profile_get_type; ///
private alias c_gst_encoding_video_profile_newFn = extern(C) GstEncodingVideoProfile* function(GstCaps* format, const(char)* preset, GstCaps* restriction, uint presence) nothrow;
__gshared c_gst_encoding_video_profile_newFn c_gst_encoding_video_profile_new; ///
private alias c_gst_encoding_video_profile_get_passFn = extern(C) uint function(GstEncodingVideoProfile* prof) nothrow;
__gshared c_gst_encoding_video_profile_get_passFn c_gst_encoding_video_profile_get_pass; ///
private alias c_gst_encoding_video_profile_get_variableframerateFn = extern(C) gboolean function(GstEncodingVideoProfile* prof) nothrow;
__gshared c_gst_encoding_video_profile_get_variableframerateFn c_gst_encoding_video_profile_get_variableframerate; ///
private alias c_gst_encoding_video_profile_set_passFn = extern(C) void function(GstEncodingVideoProfile* prof, uint pass) nothrow;
__gshared c_gst_encoding_video_profile_set_passFn c_gst_encoding_video_profile_set_pass; ///
private alias c_gst_encoding_video_profile_set_variableframerateFn = extern(C) void function(GstEncodingVideoProfile* prof, gboolean variableframerate) nothrow;
__gshared c_gst_encoding_video_profile_set_variableframerateFn c_gst_encoding_video_profile_set_variableframerate; ///

// InstallPluginsContext
private alias c_gst_install_plugins_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_install_plugins_context_get_typeFn c_gst_install_plugins_context_get_type; ///
private alias c_gst_install_plugins_context_newFn = extern(C) GstInstallPluginsContext* function() nothrow;
__gshared c_gst_install_plugins_context_newFn c_gst_install_plugins_context_new; ///
private alias c_gst_install_plugins_context_copyFn = extern(C) GstInstallPluginsContext* function(GstInstallPluginsContext* ctx) nothrow;
__gshared c_gst_install_plugins_context_copyFn c_gst_install_plugins_context_copy; ///
private alias c_gst_install_plugins_context_freeFn = extern(C) void function(GstInstallPluginsContext* ctx) nothrow;
__gshared c_gst_install_plugins_context_freeFn c_gst_install_plugins_context_free; ///
private alias c_gst_install_plugins_context_set_confirm_searchFn = extern(C) void function(GstInstallPluginsContext* ctx, gboolean confirmSearch) nothrow;
__gshared c_gst_install_plugins_context_set_confirm_searchFn c_gst_install_plugins_context_set_confirm_search; ///
private alias c_gst_install_plugins_context_set_desktop_idFn = extern(C) void function(GstInstallPluginsContext* ctx, const(char)* desktopId) nothrow;
__gshared c_gst_install_plugins_context_set_desktop_idFn c_gst_install_plugins_context_set_desktop_id; ///
private alias c_gst_install_plugins_context_set_startup_notification_idFn = extern(C) void function(GstInstallPluginsContext* ctx, const(char)* startupId) nothrow;
__gshared c_gst_install_plugins_context_set_startup_notification_idFn c_gst_install_plugins_context_set_startup_notification_id; ///
private alias c_gst_install_plugins_context_set_xidFn = extern(C) void function(GstInstallPluginsContext* ctx, uint xid) nothrow;
__gshared c_gst_install_plugins_context_set_xidFn c_gst_install_plugins_context_set_xid; ///

// global
private alias c_gst_codec_utils_aac_caps_set_level_and_profileFn = extern(C) gboolean function(GstCaps* caps, const(ubyte)* audioConfig, uint len) nothrow;
__gshared c_gst_codec_utils_aac_caps_set_level_and_profileFn c_gst_codec_utils_aac_caps_set_level_and_profile; ///
private alias c_gst_codec_utils_aac_get_channelsFn = extern(C) uint function(const(ubyte)* audioConfig, uint len) nothrow;
__gshared c_gst_codec_utils_aac_get_channelsFn c_gst_codec_utils_aac_get_channels; ///
private alias c_gst_codec_utils_aac_get_index_from_sample_rateFn = extern(C) int function(uint rate) nothrow;
__gshared c_gst_codec_utils_aac_get_index_from_sample_rateFn c_gst_codec_utils_aac_get_index_from_sample_rate; ///
private alias c_gst_codec_utils_aac_get_levelFn = extern(C) const(char)* function(const(ubyte)* audioConfig, uint len) nothrow;
__gshared c_gst_codec_utils_aac_get_levelFn c_gst_codec_utils_aac_get_level; ///
private alias c_gst_codec_utils_aac_get_profileFn = extern(C) const(char)* function(const(ubyte)* audioConfig, uint len) nothrow;
__gshared c_gst_codec_utils_aac_get_profileFn c_gst_codec_utils_aac_get_profile; ///
private alias c_gst_codec_utils_aac_get_sample_rateFn = extern(C) uint function(const(ubyte)* audioConfig, uint len) nothrow;
__gshared c_gst_codec_utils_aac_get_sample_rateFn c_gst_codec_utils_aac_get_sample_rate; ///
private alias c_gst_codec_utils_aac_get_sample_rate_from_indexFn = extern(C) uint function(uint srIdx) nothrow;
__gshared c_gst_codec_utils_aac_get_sample_rate_from_indexFn c_gst_codec_utils_aac_get_sample_rate_from_index; ///
private alias c_gst_codec_utils_av1_create_av1c_from_capsFn = extern(C) GstBuffer* function(GstCaps* caps) nothrow;
__gshared c_gst_codec_utils_av1_create_av1c_from_capsFn c_gst_codec_utils_av1_create_av1c_from_caps; ///
private alias c_gst_codec_utils_av1_create_caps_from_av1cFn = extern(C) GstCaps* function(GstBuffer* av1c) nothrow;
__gshared c_gst_codec_utils_av1_create_caps_from_av1cFn c_gst_codec_utils_av1_create_caps_from_av1c; ///
private alias c_gst_codec_utils_av1_get_levelFn = extern(C) const(char)* function(ubyte seqLevelIdx) nothrow;
__gshared c_gst_codec_utils_av1_get_levelFn c_gst_codec_utils_av1_get_level; ///
private alias c_gst_codec_utils_av1_get_seq_level_idxFn = extern(C) ubyte function(const(char)* level) nothrow;
__gshared c_gst_codec_utils_av1_get_seq_level_idxFn c_gst_codec_utils_av1_get_seq_level_idx; ///
private alias c_gst_codec_utils_caps_from_mime_codecFn = extern(C) GstCaps* function(const(char)* codecsField) nothrow;
__gshared c_gst_codec_utils_caps_from_mime_codecFn c_gst_codec_utils_caps_from_mime_codec; ///
private alias c_gst_codec_utils_caps_get_mime_codecFn = extern(C) char* function(GstCaps* caps) nothrow;
__gshared c_gst_codec_utils_caps_get_mime_codecFn c_gst_codec_utils_caps_get_mime_codec; ///
private alias c_gst_codec_utils_h264_caps_set_level_and_profileFn = extern(C) gboolean function(GstCaps* caps, const(ubyte)* sps, uint len) nothrow;
__gshared c_gst_codec_utils_h264_caps_set_level_and_profileFn c_gst_codec_utils_h264_caps_set_level_and_profile; ///
private alias c_gst_codec_utils_h264_get_levelFn = extern(C) const(char)* function(const(ubyte)* sps, uint len) nothrow;
__gshared c_gst_codec_utils_h264_get_levelFn c_gst_codec_utils_h264_get_level; ///
private alias c_gst_codec_utils_h264_get_level_idcFn = extern(C) ubyte function(const(char)* level) nothrow;
__gshared c_gst_codec_utils_h264_get_level_idcFn c_gst_codec_utils_h264_get_level_idc; ///
private alias c_gst_codec_utils_h264_get_profileFn = extern(C) const(char)* function(const(ubyte)* sps, uint len) nothrow;
__gshared c_gst_codec_utils_h264_get_profileFn c_gst_codec_utils_h264_get_profile; ///
private alias c_gst_codec_utils_h264_get_profile_flags_levelFn = extern(C) gboolean function(const(ubyte)* codecData, uint len, ubyte* profile, ubyte* flags, ubyte* level) nothrow;
__gshared c_gst_codec_utils_h264_get_profile_flags_levelFn c_gst_codec_utils_h264_get_profile_flags_level; ///
private alias c_gst_codec_utils_h265_caps_set_level_tier_and_profileFn = extern(C) gboolean function(GstCaps* caps, const(ubyte)* profileTierLevel, uint len) nothrow;
__gshared c_gst_codec_utils_h265_caps_set_level_tier_and_profileFn c_gst_codec_utils_h265_caps_set_level_tier_and_profile; ///
private alias c_gst_codec_utils_h265_get_levelFn = extern(C) const(char)* function(const(ubyte)* profileTierLevel, uint len) nothrow;
__gshared c_gst_codec_utils_h265_get_levelFn c_gst_codec_utils_h265_get_level; ///
private alias c_gst_codec_utils_h265_get_level_idcFn = extern(C) ubyte function(const(char)* level) nothrow;
__gshared c_gst_codec_utils_h265_get_level_idcFn c_gst_codec_utils_h265_get_level_idc; ///
private alias c_gst_codec_utils_h265_get_profileFn = extern(C) const(char)* function(const(ubyte)* profileTierLevel, uint len) nothrow;
__gshared c_gst_codec_utils_h265_get_profileFn c_gst_codec_utils_h265_get_profile; ///
private alias c_gst_codec_utils_h265_get_tierFn = extern(C) const(char)* function(const(ubyte)* profileTierLevel, uint len) nothrow;
__gshared c_gst_codec_utils_h265_get_tierFn c_gst_codec_utils_h265_get_tier; ///
private alias c_gst_codec_utils_h266_caps_set_level_tier_and_profileFn = extern(C) gboolean function(GstCaps* caps, const(ubyte)* decoderConfiguration, uint len) nothrow;
__gshared c_gst_codec_utils_h266_caps_set_level_tier_and_profileFn c_gst_codec_utils_h266_caps_set_level_tier_and_profile; ///
private alias c_gst_codec_utils_h266_get_levelFn = extern(C) const(char)* function(const(ubyte)* ptlRecord, uint len) nothrow;
__gshared c_gst_codec_utils_h266_get_levelFn c_gst_codec_utils_h266_get_level; ///
private alias c_gst_codec_utils_h266_get_level_idcFn = extern(C) ubyte function(const(char)* level) nothrow;
__gshared c_gst_codec_utils_h266_get_level_idcFn c_gst_codec_utils_h266_get_level_idc; ///
private alias c_gst_codec_utils_h266_get_profileFn = extern(C) const(char)* function(const(ubyte)* ptlRecord, uint len) nothrow;
__gshared c_gst_codec_utils_h266_get_profileFn c_gst_codec_utils_h266_get_profile; ///
private alias c_gst_codec_utils_h266_get_tierFn = extern(C) const(char)* function(const(ubyte)* ptlRecord, uint len) nothrow;
__gshared c_gst_codec_utils_h266_get_tierFn c_gst_codec_utils_h266_get_tier; ///
private alias c_gst_codec_utils_mpeg4video_caps_set_level_and_profileFn = extern(C) gboolean function(GstCaps* caps, const(ubyte)* visObjSeq, uint len) nothrow;
__gshared c_gst_codec_utils_mpeg4video_caps_set_level_and_profileFn c_gst_codec_utils_mpeg4video_caps_set_level_and_profile; ///
private alias c_gst_codec_utils_mpeg4video_get_levelFn = extern(C) const(char)* function(const(ubyte)* visObjSeq, uint len) nothrow;
__gshared c_gst_codec_utils_mpeg4video_get_levelFn c_gst_codec_utils_mpeg4video_get_level; ///
private alias c_gst_codec_utils_mpeg4video_get_profileFn = extern(C) const(char)* function(const(ubyte)* visObjSeq, uint len) nothrow;
__gshared c_gst_codec_utils_mpeg4video_get_profileFn c_gst_codec_utils_mpeg4video_get_profile; ///
private alias c_gst_codec_utils_opus_create_capsFn = extern(C) GstCaps* function(uint rate, ubyte channels, ubyte channelMappingFamily, ubyte streamCount, ubyte coupledCount, const(ubyte)* channelMapping) nothrow;
__gshared c_gst_codec_utils_opus_create_capsFn c_gst_codec_utils_opus_create_caps; ///
private alias c_gst_codec_utils_opus_create_caps_from_headerFn = extern(C) GstCaps* function(GstBuffer* header, GstBuffer* comments) nothrow;
__gshared c_gst_codec_utils_opus_create_caps_from_headerFn c_gst_codec_utils_opus_create_caps_from_header; ///
private alias c_gst_codec_utils_opus_create_headerFn = extern(C) GstBuffer* function(uint rate, ubyte channels, ubyte channelMappingFamily, ubyte streamCount, ubyte coupledCount, const(ubyte)* channelMapping, ushort preSkip, short outputGain) nothrow;
__gshared c_gst_codec_utils_opus_create_headerFn c_gst_codec_utils_opus_create_header; ///
private alias c_gst_codec_utils_opus_parse_capsFn = extern(C) gboolean function(GstCaps* caps, uint* rate, ubyte* channels, ubyte* channelMappingFamily, ubyte* streamCount, ubyte* coupledCount, ubyte* channelMapping) nothrow;
__gshared c_gst_codec_utils_opus_parse_capsFn c_gst_codec_utils_opus_parse_caps; ///
private alias c_gst_codec_utils_opus_parse_headerFn = extern(C) gboolean function(GstBuffer* header, uint* rate, ubyte* channels, ubyte* channelMappingFamily, ubyte* streamCount, ubyte* coupledCount, ubyte* channelMapping, ushort* preSkip, short* outputGain) nothrow;
__gshared c_gst_codec_utils_opus_parse_headerFn c_gst_codec_utils_opus_parse_header; ///
private alias c_gst_encoding_list_all_targetsFn = extern(C) GList* function(const(char)* categoryname) nothrow;
__gshared c_gst_encoding_list_all_targetsFn c_gst_encoding_list_all_targets; ///
private alias c_gst_encoding_list_available_categoriesFn = extern(C) GList* function() nothrow;
__gshared c_gst_encoding_list_available_categoriesFn c_gst_encoding_list_available_categories; ///
private alias c_gst_install_plugins_asyncFn = extern(C) GstInstallPluginsReturn function(const(char*)* details, GstInstallPluginsContext* ctx, GstInstallPluginsResultFunc func, void* userData) nothrow;
__gshared c_gst_install_plugins_asyncFn c_gst_install_plugins_async; ///
private alias c_gst_install_plugins_installation_in_progressFn = extern(C) gboolean function() nothrow;
__gshared c_gst_install_plugins_installation_in_progressFn c_gst_install_plugins_installation_in_progress; ///
private alias c_gst_install_plugins_supportedFn = extern(C) gboolean function() nothrow;
__gshared c_gst_install_plugins_supportedFn c_gst_install_plugins_supported; ///
private alias c_gst_install_plugins_syncFn = extern(C) GstInstallPluginsReturn function(const(char*)* details, GstInstallPluginsContext* ctx) nothrow;
__gshared c_gst_install_plugins_syncFn c_gst_install_plugins_sync; ///
private alias c_gst_is_missing_plugin_messageFn = extern(C) gboolean function(GstMessage* msg) nothrow;
__gshared c_gst_is_missing_plugin_messageFn c_gst_is_missing_plugin_message; ///
private alias c_gst_missing_decoder_installer_detail_newFn = extern(C) char* function(const(GstCaps)* decodeCaps) nothrow;
__gshared c_gst_missing_decoder_installer_detail_newFn c_gst_missing_decoder_installer_detail_new; ///
private alias c_gst_missing_decoder_message_newFn = extern(C) GstMessage* function(GstElement* element, const(GstCaps)* decodeCaps) nothrow;
__gshared c_gst_missing_decoder_message_newFn c_gst_missing_decoder_message_new; ///
private alias c_gst_missing_element_installer_detail_newFn = extern(C) char* function(const(char)* factoryName) nothrow;
__gshared c_gst_missing_element_installer_detail_newFn c_gst_missing_element_installer_detail_new; ///
private alias c_gst_missing_element_message_newFn = extern(C) GstMessage* function(GstElement* element, const(char)* factoryName) nothrow;
__gshared c_gst_missing_element_message_newFn c_gst_missing_element_message_new; ///
private alias c_gst_missing_encoder_installer_detail_newFn = extern(C) char* function(const(GstCaps)* encodeCaps) nothrow;
__gshared c_gst_missing_encoder_installer_detail_newFn c_gst_missing_encoder_installer_detail_new; ///
private alias c_gst_missing_encoder_message_newFn = extern(C) GstMessage* function(GstElement* element, const(GstCaps)* encodeCaps) nothrow;
__gshared c_gst_missing_encoder_message_newFn c_gst_missing_encoder_message_new; ///
private alias c_gst_missing_plugin_message_get_descriptionFn = extern(C) char* function(GstMessage* msg) nothrow;
__gshared c_gst_missing_plugin_message_get_descriptionFn c_gst_missing_plugin_message_get_description; ///
private alias c_gst_missing_plugin_message_get_installer_detailFn = extern(C) char* function(GstMessage* msg) nothrow;
__gshared c_gst_missing_plugin_message_get_installer_detailFn c_gst_missing_plugin_message_get_installer_detail; ///
private alias c_gst_missing_plugin_message_get_stream_idFn = extern(C) const(char)* function(GstMessage* msg) nothrow;
__gshared c_gst_missing_plugin_message_get_stream_idFn c_gst_missing_plugin_message_get_stream_id; ///
private alias c_gst_missing_plugin_message_set_stream_idFn = extern(C) void function(GstMessage* msg, const(char)* streamId) nothrow;
__gshared c_gst_missing_plugin_message_set_stream_idFn c_gst_missing_plugin_message_set_stream_id; ///
private alias c_gst_missing_uri_sink_installer_detail_newFn = extern(C) char* function(const(char)* protocol) nothrow;
__gshared c_gst_missing_uri_sink_installer_detail_newFn c_gst_missing_uri_sink_installer_detail_new; ///
private alias c_gst_missing_uri_sink_message_newFn = extern(C) GstMessage* function(GstElement* element, const(char)* protocol) nothrow;
__gshared c_gst_missing_uri_sink_message_newFn c_gst_missing_uri_sink_message_new; ///
private alias c_gst_missing_uri_source_installer_detail_newFn = extern(C) char* function(const(char)* protocol) nothrow;
__gshared c_gst_missing_uri_source_installer_detail_newFn c_gst_missing_uri_source_installer_detail_new; ///
private alias c_gst_missing_uri_source_message_newFn = extern(C) GstMessage* function(GstElement* element, const(char)* protocol) nothrow;
__gshared c_gst_missing_uri_source_message_newFn c_gst_missing_uri_source_message_new; ///
private alias c_gst_pb_utils_add_codec_description_to_tag_listFn = extern(C) gboolean function(GstTagList* taglist, const(char)* codecTag, const(GstCaps)* caps) nothrow;
__gshared c_gst_pb_utils_add_codec_description_to_tag_listFn c_gst_pb_utils_add_codec_description_to_tag_list; ///
private alias c_gst_pb_utils_get_caps_description_flagsFn = extern(C) GstPbUtilsCapsDescriptionFlags function(const(GstCaps)* caps) nothrow;
__gshared c_gst_pb_utils_get_caps_description_flagsFn c_gst_pb_utils_get_caps_description_flags; ///
private alias c_gst_pb_utils_get_codec_descriptionFn = extern(C) char* function(const(GstCaps)* caps) nothrow;
__gshared c_gst_pb_utils_get_codec_descriptionFn c_gst_pb_utils_get_codec_description; ///
private alias c_gst_pb_utils_get_decoder_descriptionFn = extern(C) char* function(const(GstCaps)* caps) nothrow;
__gshared c_gst_pb_utils_get_decoder_descriptionFn c_gst_pb_utils_get_decoder_description; ///
private alias c_gst_pb_utils_get_element_descriptionFn = extern(C) char* function(const(char)* factoryName) nothrow;
__gshared c_gst_pb_utils_get_element_descriptionFn c_gst_pb_utils_get_element_description; ///
private alias c_gst_pb_utils_get_encoder_descriptionFn = extern(C) char* function(const(GstCaps)* caps) nothrow;
__gshared c_gst_pb_utils_get_encoder_descriptionFn c_gst_pb_utils_get_encoder_description; ///
private alias c_gst_pb_utils_get_file_extension_from_capsFn = extern(C) char* function(const(GstCaps)* caps) nothrow;
__gshared c_gst_pb_utils_get_file_extension_from_capsFn c_gst_pb_utils_get_file_extension_from_caps; ///
private alias c_gst_pb_utils_get_sink_descriptionFn = extern(C) char* function(const(char)* protocol) nothrow;
__gshared c_gst_pb_utils_get_sink_descriptionFn c_gst_pb_utils_get_sink_description; ///
private alias c_gst_pb_utils_get_source_descriptionFn = extern(C) char* function(const(char)* protocol) nothrow;
__gshared c_gst_pb_utils_get_source_descriptionFn c_gst_pb_utils_get_source_description; ///
private alias c_gst_pb_utils_initFn = extern(C) void function() nothrow;
__gshared c_gst_pb_utils_initFn c_gst_pb_utils_init; ///
private alias c_gst_plugins_base_versionFn = extern(C) void function(uint* major, uint* minor, uint* micro, uint* nano) nothrow;
__gshared c_gst_plugins_base_versionFn c_gst_plugins_base_version; ///
private alias c_gst_plugins_base_version_stringFn = extern(C) char* function() nothrow;
__gshared c_gst_plugins_base_version_stringFn c_gst_plugins_base_version_string; ///

// InstallPluginsReturn
private alias c_gst_install_plugins_return_get_nameFn = extern(C) const(char)* function(GstInstallPluginsReturn ret) nothrow;
__gshared c_gst_install_plugins_return_get_nameFn c_gst_install_plugins_return_get_name; ///

// AudioVisualizer

/** */
alias gst_audio_visualizer_get_type = c_gst_audio_visualizer_get_type;

// Discoverer

/** */
alias gst_discoverer_get_type = c_gst_discoverer_get_type;

/** */
alias gst_discoverer_new = c_gst_discoverer_new;

/** */
alias gst_discoverer_discover_uri = c_gst_discoverer_discover_uri;

/** */
alias gst_discoverer_discover_uri_async = c_gst_discoverer_discover_uri_async;

/** */
alias gst_discoverer_start = c_gst_discoverer_start;

/** */
alias gst_discoverer_stop = c_gst_discoverer_stop;

// DiscovererAudioInfo

/** */
alias gst_discoverer_audio_info_get_type = c_gst_discoverer_audio_info_get_type;

/** */
alias gst_discoverer_audio_info_get_bitrate = c_gst_discoverer_audio_info_get_bitrate;

/** */
alias gst_discoverer_audio_info_get_channel_mask = c_gst_discoverer_audio_info_get_channel_mask;

/** */
alias gst_discoverer_audio_info_get_channels = c_gst_discoverer_audio_info_get_channels;

/** */
alias gst_discoverer_audio_info_get_depth = c_gst_discoverer_audio_info_get_depth;

/** */
alias gst_discoverer_audio_info_get_language = c_gst_discoverer_audio_info_get_language;

/** */
alias gst_discoverer_audio_info_get_max_bitrate = c_gst_discoverer_audio_info_get_max_bitrate;

/** */
alias gst_discoverer_audio_info_get_sample_rate = c_gst_discoverer_audio_info_get_sample_rate;

// DiscovererContainerInfo

/** */
alias gst_discoverer_container_info_get_type = c_gst_discoverer_container_info_get_type;

/** */
alias gst_discoverer_container_info_get_streams = c_gst_discoverer_container_info_get_streams;

/** */
alias gst_discoverer_container_info_get_tags = c_gst_discoverer_container_info_get_tags;

// DiscovererInfo

/** */
alias gst_discoverer_info_get_type = c_gst_discoverer_info_get_type;

/** */
alias gst_discoverer_info_from_variant = c_gst_discoverer_info_from_variant;

/** */
alias gst_discoverer_info_copy = c_gst_discoverer_info_copy;

/** */
alias gst_discoverer_info_get_audio_streams = c_gst_discoverer_info_get_audio_streams;

/** */
alias gst_discoverer_info_get_container_streams = c_gst_discoverer_info_get_container_streams;

/** */
alias gst_discoverer_info_get_duration = c_gst_discoverer_info_get_duration;

/** */
alias gst_discoverer_info_get_live = c_gst_discoverer_info_get_live;

/** */
alias gst_discoverer_info_get_misc = c_gst_discoverer_info_get_misc;

/** */
alias gst_discoverer_info_get_missing_elements_installer_details = c_gst_discoverer_info_get_missing_elements_installer_details;

/** */
alias gst_discoverer_info_get_result = c_gst_discoverer_info_get_result;

/** */
alias gst_discoverer_info_get_seekable = c_gst_discoverer_info_get_seekable;

/** */
alias gst_discoverer_info_get_stream_info = c_gst_discoverer_info_get_stream_info;

/** */
alias gst_discoverer_info_get_stream_list = c_gst_discoverer_info_get_stream_list;

/** */
alias gst_discoverer_info_get_streams = c_gst_discoverer_info_get_streams;

/** */
alias gst_discoverer_info_get_subtitle_streams = c_gst_discoverer_info_get_subtitle_streams;

/** */
alias gst_discoverer_info_get_tags = c_gst_discoverer_info_get_tags;

/** */
alias gst_discoverer_info_get_toc = c_gst_discoverer_info_get_toc;

/** */
alias gst_discoverer_info_get_uri = c_gst_discoverer_info_get_uri;

/** */
alias gst_discoverer_info_get_video_streams = c_gst_discoverer_info_get_video_streams;

/** */
alias gst_discoverer_info_to_variant = c_gst_discoverer_info_to_variant;

// DiscovererStreamInfo

/** */
alias gst_discoverer_stream_info_get_type = c_gst_discoverer_stream_info_get_type;

/** */
alias gst_discoverer_stream_info_list_free = c_gst_discoverer_stream_info_list_free;

/** */
alias gst_discoverer_stream_info_get_caps = c_gst_discoverer_stream_info_get_caps;

/** */
alias gst_discoverer_stream_info_get_misc = c_gst_discoverer_stream_info_get_misc;

/** */
alias gst_discoverer_stream_info_get_next = c_gst_discoverer_stream_info_get_next;

/** */
alias gst_discoverer_stream_info_get_previous = c_gst_discoverer_stream_info_get_previous;

/** */
alias gst_discoverer_stream_info_get_stream_id = c_gst_discoverer_stream_info_get_stream_id;

/** */
alias gst_discoverer_stream_info_get_stream_number = c_gst_discoverer_stream_info_get_stream_number;

/** */
alias gst_discoverer_stream_info_get_stream_type_nick = c_gst_discoverer_stream_info_get_stream_type_nick;

/** */
alias gst_discoverer_stream_info_get_tags = c_gst_discoverer_stream_info_get_tags;

/** */
alias gst_discoverer_stream_info_get_toc = c_gst_discoverer_stream_info_get_toc;

// DiscovererSubtitleInfo

/** */
alias gst_discoverer_subtitle_info_get_type = c_gst_discoverer_subtitle_info_get_type;

/** */
alias gst_discoverer_subtitle_info_get_language = c_gst_discoverer_subtitle_info_get_language;

// DiscovererVideoInfo

/** */
alias gst_discoverer_video_info_get_type = c_gst_discoverer_video_info_get_type;

/** */
alias gst_discoverer_video_info_get_bitrate = c_gst_discoverer_video_info_get_bitrate;

/** */
alias gst_discoverer_video_info_get_depth = c_gst_discoverer_video_info_get_depth;

/** */
alias gst_discoverer_video_info_get_framerate_denom = c_gst_discoverer_video_info_get_framerate_denom;

/** */
alias gst_discoverer_video_info_get_framerate_num = c_gst_discoverer_video_info_get_framerate_num;

/** */
alias gst_discoverer_video_info_get_height = c_gst_discoverer_video_info_get_height;

/** */
alias gst_discoverer_video_info_get_max_bitrate = c_gst_discoverer_video_info_get_max_bitrate;

/** */
alias gst_discoverer_video_info_get_par_denom = c_gst_discoverer_video_info_get_par_denom;

/** */
alias gst_discoverer_video_info_get_par_num = c_gst_discoverer_video_info_get_par_num;

/** */
alias gst_discoverer_video_info_get_width = c_gst_discoverer_video_info_get_width;

/** */
alias gst_discoverer_video_info_is_image = c_gst_discoverer_video_info_is_image;

/** */
alias gst_discoverer_video_info_is_interlaced = c_gst_discoverer_video_info_is_interlaced;

// EncodingAudioProfile

/** */
alias gst_encoding_audio_profile_get_type = c_gst_encoding_audio_profile_get_type;

/** */
alias gst_encoding_audio_profile_new = c_gst_encoding_audio_profile_new;

// EncodingContainerProfile

/** */
alias gst_encoding_container_profile_get_type = c_gst_encoding_container_profile_get_type;

/** */
alias gst_encoding_container_profile_new = c_gst_encoding_container_profile_new;

/** */
alias gst_encoding_container_profile_add_profile = c_gst_encoding_container_profile_add_profile;

/** */
alias gst_encoding_container_profile_contains_profile = c_gst_encoding_container_profile_contains_profile;

/** */
alias gst_encoding_container_profile_get_profiles = c_gst_encoding_container_profile_get_profiles;

// EncodingProfile

/** */
alias gst_encoding_profile_get_type = c_gst_encoding_profile_get_type;

/** */
alias gst_encoding_profile_find = c_gst_encoding_profile_find;

/** */
alias gst_encoding_profile_from_discoverer = c_gst_encoding_profile_from_discoverer;

/** */
alias gst_encoding_profile_from_string = c_gst_encoding_profile_from_string;

/** */
alias gst_encoding_profile_copy = c_gst_encoding_profile_copy;

/** */
alias gst_encoding_profile_get_allow_dynamic_output = c_gst_encoding_profile_get_allow_dynamic_output;

/** */
alias gst_encoding_profile_get_description = c_gst_encoding_profile_get_description;

/** */
alias gst_encoding_profile_get_element_properties = c_gst_encoding_profile_get_element_properties;

/** */
alias gst_encoding_profile_get_file_extension = c_gst_encoding_profile_get_file_extension;

/** */
alias gst_encoding_profile_get_format = c_gst_encoding_profile_get_format;

/** */
alias gst_encoding_profile_get_input_caps = c_gst_encoding_profile_get_input_caps;

/** */
alias gst_encoding_profile_get_name = c_gst_encoding_profile_get_name;

/** */
alias gst_encoding_profile_get_presence = c_gst_encoding_profile_get_presence;

/** */
alias gst_encoding_profile_get_preset = c_gst_encoding_profile_get_preset;

/** */
alias gst_encoding_profile_get_preset_name = c_gst_encoding_profile_get_preset_name;

/** */
alias gst_encoding_profile_get_restriction = c_gst_encoding_profile_get_restriction;

/** */
alias gst_encoding_profile_get_single_segment = c_gst_encoding_profile_get_single_segment;

/** */
alias gst_encoding_profile_get_type_nick = c_gst_encoding_profile_get_type_nick;

/** */
alias gst_encoding_profile_is_enabled = c_gst_encoding_profile_is_enabled;

/** */
alias gst_encoding_profile_is_equal = c_gst_encoding_profile_is_equal;

/** */
alias gst_encoding_profile_set_allow_dynamic_output = c_gst_encoding_profile_set_allow_dynamic_output;

/** */
alias gst_encoding_profile_set_description = c_gst_encoding_profile_set_description;

/** */
alias gst_encoding_profile_set_element_properties = c_gst_encoding_profile_set_element_properties;

/** */
alias gst_encoding_profile_set_enabled = c_gst_encoding_profile_set_enabled;

/** */
alias gst_encoding_profile_set_format = c_gst_encoding_profile_set_format;

/** */
alias gst_encoding_profile_set_name = c_gst_encoding_profile_set_name;

/** */
alias gst_encoding_profile_set_presence = c_gst_encoding_profile_set_presence;

/** */
alias gst_encoding_profile_set_preset = c_gst_encoding_profile_set_preset;

/** */
alias gst_encoding_profile_set_preset_name = c_gst_encoding_profile_set_preset_name;

/** */
alias gst_encoding_profile_set_restriction = c_gst_encoding_profile_set_restriction;

/** */
alias gst_encoding_profile_set_single_segment = c_gst_encoding_profile_set_single_segment;

/** */
alias gst_encoding_profile_to_string = c_gst_encoding_profile_to_string;

// EncodingTarget

/** */
alias gst_encoding_target_get_type = c_gst_encoding_target_get_type;

/** */
alias gst_encoding_target_new = c_gst_encoding_target_new;

/** */
alias gst_encoding_target_load = c_gst_encoding_target_load;

/** */
alias gst_encoding_target_load_from_file = c_gst_encoding_target_load_from_file;

/** */
alias gst_encoding_target_add_profile = c_gst_encoding_target_add_profile;

/** */
alias gst_encoding_target_get_category = c_gst_encoding_target_get_category;

/** */
alias gst_encoding_target_get_description = c_gst_encoding_target_get_description;

/** */
alias gst_encoding_target_get_name = c_gst_encoding_target_get_name;

/** */
alias gst_encoding_target_get_path = c_gst_encoding_target_get_path;

/** */
alias gst_encoding_target_get_profile = c_gst_encoding_target_get_profile;

/** */
alias gst_encoding_target_get_profiles = c_gst_encoding_target_get_profiles;

/** */
alias gst_encoding_target_save = c_gst_encoding_target_save;

/** */
alias gst_encoding_target_save_to_file = c_gst_encoding_target_save_to_file;

// EncodingVideoProfile

/** */
alias gst_encoding_video_profile_get_type = c_gst_encoding_video_profile_get_type;

/** */
alias gst_encoding_video_profile_new = c_gst_encoding_video_profile_new;

/** */
alias gst_encoding_video_profile_get_pass = c_gst_encoding_video_profile_get_pass;

/** */
alias gst_encoding_video_profile_get_variableframerate = c_gst_encoding_video_profile_get_variableframerate;

/** */
alias gst_encoding_video_profile_set_pass = c_gst_encoding_video_profile_set_pass;

/** */
alias gst_encoding_video_profile_set_variableframerate = c_gst_encoding_video_profile_set_variableframerate;

// InstallPluginsContext

/** */
alias gst_install_plugins_context_get_type = c_gst_install_plugins_context_get_type;

/** */
alias gst_install_plugins_context_new = c_gst_install_plugins_context_new;

/** */
alias gst_install_plugins_context_copy = c_gst_install_plugins_context_copy;

/** */
alias gst_install_plugins_context_free = c_gst_install_plugins_context_free;

/** */
alias gst_install_plugins_context_set_confirm_search = c_gst_install_plugins_context_set_confirm_search;

/** */
alias gst_install_plugins_context_set_desktop_id = c_gst_install_plugins_context_set_desktop_id;

/** */
alias gst_install_plugins_context_set_startup_notification_id = c_gst_install_plugins_context_set_startup_notification_id;

/** */
alias gst_install_plugins_context_set_xid = c_gst_install_plugins_context_set_xid;

// global

/** */
alias gst_codec_utils_aac_caps_set_level_and_profile = c_gst_codec_utils_aac_caps_set_level_and_profile;

/** */
alias gst_codec_utils_aac_get_channels = c_gst_codec_utils_aac_get_channels;

/** */
alias gst_codec_utils_aac_get_index_from_sample_rate = c_gst_codec_utils_aac_get_index_from_sample_rate;

/** */
alias gst_codec_utils_aac_get_level = c_gst_codec_utils_aac_get_level;

/** */
alias gst_codec_utils_aac_get_profile = c_gst_codec_utils_aac_get_profile;

/** */
alias gst_codec_utils_aac_get_sample_rate = c_gst_codec_utils_aac_get_sample_rate;

/** */
alias gst_codec_utils_aac_get_sample_rate_from_index = c_gst_codec_utils_aac_get_sample_rate_from_index;

/** */
alias gst_codec_utils_av1_create_av1c_from_caps = c_gst_codec_utils_av1_create_av1c_from_caps;

/** */
alias gst_codec_utils_av1_create_caps_from_av1c = c_gst_codec_utils_av1_create_caps_from_av1c;

/** */
alias gst_codec_utils_av1_get_level = c_gst_codec_utils_av1_get_level;

/** */
alias gst_codec_utils_av1_get_seq_level_idx = c_gst_codec_utils_av1_get_seq_level_idx;

/** */
alias gst_codec_utils_caps_from_mime_codec = c_gst_codec_utils_caps_from_mime_codec;

/** */
alias gst_codec_utils_caps_get_mime_codec = c_gst_codec_utils_caps_get_mime_codec;

/** */
alias gst_codec_utils_h264_caps_set_level_and_profile = c_gst_codec_utils_h264_caps_set_level_and_profile;

/** */
alias gst_codec_utils_h264_get_level = c_gst_codec_utils_h264_get_level;

/** */
alias gst_codec_utils_h264_get_level_idc = c_gst_codec_utils_h264_get_level_idc;

/** */
alias gst_codec_utils_h264_get_profile = c_gst_codec_utils_h264_get_profile;

/** */
alias gst_codec_utils_h264_get_profile_flags_level = c_gst_codec_utils_h264_get_profile_flags_level;

/** */
alias gst_codec_utils_h265_caps_set_level_tier_and_profile = c_gst_codec_utils_h265_caps_set_level_tier_and_profile;

/** */
alias gst_codec_utils_h265_get_level = c_gst_codec_utils_h265_get_level;

/** */
alias gst_codec_utils_h265_get_level_idc = c_gst_codec_utils_h265_get_level_idc;

/** */
alias gst_codec_utils_h265_get_profile = c_gst_codec_utils_h265_get_profile;

/** */
alias gst_codec_utils_h265_get_tier = c_gst_codec_utils_h265_get_tier;

/** */
alias gst_codec_utils_h266_caps_set_level_tier_and_profile = c_gst_codec_utils_h266_caps_set_level_tier_and_profile;

/** */
alias gst_codec_utils_h266_get_level = c_gst_codec_utils_h266_get_level;

/** */
alias gst_codec_utils_h266_get_level_idc = c_gst_codec_utils_h266_get_level_idc;

/** */
alias gst_codec_utils_h266_get_profile = c_gst_codec_utils_h266_get_profile;

/** */
alias gst_codec_utils_h266_get_tier = c_gst_codec_utils_h266_get_tier;

/** */
alias gst_codec_utils_mpeg4video_caps_set_level_and_profile = c_gst_codec_utils_mpeg4video_caps_set_level_and_profile;

/** */
alias gst_codec_utils_mpeg4video_get_level = c_gst_codec_utils_mpeg4video_get_level;

/** */
alias gst_codec_utils_mpeg4video_get_profile = c_gst_codec_utils_mpeg4video_get_profile;

/** */
alias gst_codec_utils_opus_create_caps = c_gst_codec_utils_opus_create_caps;

/** */
alias gst_codec_utils_opus_create_caps_from_header = c_gst_codec_utils_opus_create_caps_from_header;

/** */
alias gst_codec_utils_opus_create_header = c_gst_codec_utils_opus_create_header;

/** */
alias gst_codec_utils_opus_parse_caps = c_gst_codec_utils_opus_parse_caps;

/** */
alias gst_codec_utils_opus_parse_header = c_gst_codec_utils_opus_parse_header;

/** */
alias gst_encoding_list_all_targets = c_gst_encoding_list_all_targets;

/** */
alias gst_encoding_list_available_categories = c_gst_encoding_list_available_categories;

/** */
alias gst_install_plugins_async = c_gst_install_plugins_async;

/** */
alias gst_install_plugins_installation_in_progress = c_gst_install_plugins_installation_in_progress;

/** */
alias gst_install_plugins_supported = c_gst_install_plugins_supported;

/** */
alias gst_install_plugins_sync = c_gst_install_plugins_sync;

/** */
alias gst_is_missing_plugin_message = c_gst_is_missing_plugin_message;

/** */
alias gst_missing_decoder_installer_detail_new = c_gst_missing_decoder_installer_detail_new;

/** */
alias gst_missing_decoder_message_new = c_gst_missing_decoder_message_new;

/** */
alias gst_missing_element_installer_detail_new = c_gst_missing_element_installer_detail_new;

/** */
alias gst_missing_element_message_new = c_gst_missing_element_message_new;

/** */
alias gst_missing_encoder_installer_detail_new = c_gst_missing_encoder_installer_detail_new;

/** */
alias gst_missing_encoder_message_new = c_gst_missing_encoder_message_new;

/** */
alias gst_missing_plugin_message_get_description = c_gst_missing_plugin_message_get_description;

/** */
alias gst_missing_plugin_message_get_installer_detail = c_gst_missing_plugin_message_get_installer_detail;

/** */
alias gst_missing_plugin_message_get_stream_id = c_gst_missing_plugin_message_get_stream_id;

/** */
alias gst_missing_plugin_message_set_stream_id = c_gst_missing_plugin_message_set_stream_id;

/** */
alias gst_missing_uri_sink_installer_detail_new = c_gst_missing_uri_sink_installer_detail_new;

/** */
alias gst_missing_uri_sink_message_new = c_gst_missing_uri_sink_message_new;

/** */
alias gst_missing_uri_source_installer_detail_new = c_gst_missing_uri_source_installer_detail_new;

/** */
alias gst_missing_uri_source_message_new = c_gst_missing_uri_source_message_new;

/** */
alias gst_pb_utils_add_codec_description_to_tag_list = c_gst_pb_utils_add_codec_description_to_tag_list;

/** */
alias gst_pb_utils_get_caps_description_flags = c_gst_pb_utils_get_caps_description_flags;

/** */
alias gst_pb_utils_get_codec_description = c_gst_pb_utils_get_codec_description;

/** */
alias gst_pb_utils_get_decoder_description = c_gst_pb_utils_get_decoder_description;

/** */
alias gst_pb_utils_get_element_description = c_gst_pb_utils_get_element_description;

/** */
alias gst_pb_utils_get_encoder_description = c_gst_pb_utils_get_encoder_description;

/** */
alias gst_pb_utils_get_file_extension_from_caps = c_gst_pb_utils_get_file_extension_from_caps;

/** */
alias gst_pb_utils_get_sink_description = c_gst_pb_utils_get_sink_description;

/** */
alias gst_pb_utils_get_source_description = c_gst_pb_utils_get_source_description;

/** */
alias gst_pb_utils_init = c_gst_pb_utils_init;

/** */
alias gst_plugins_base_version = c_gst_plugins_base_version;

/** */
alias gst_plugins_base_version_string = c_gst_plugins_base_version_string;

// InstallPluginsReturn

/** */
alias gst_install_plugins_return_get_name = c_gst_install_plugins_return_get_name;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gstpbutils1");

  // AudioVisualizer
  gidLink(cast(void**)&gst_audio_visualizer_get_type, "gst_audio_visualizer_get_type", libs);

  // Discoverer
  gidLink(cast(void**)&gst_discoverer_get_type, "gst_discoverer_get_type", libs);
  gidLink(cast(void**)&gst_discoverer_new, "gst_discoverer_new", libs);
  gidLink(cast(void**)&gst_discoverer_discover_uri, "gst_discoverer_discover_uri", libs);
  gidLink(cast(void**)&gst_discoverer_discover_uri_async, "gst_discoverer_discover_uri_async", libs);
  gidLink(cast(void**)&gst_discoverer_start, "gst_discoverer_start", libs);
  gidLink(cast(void**)&gst_discoverer_stop, "gst_discoverer_stop", libs);

  // DiscovererAudioInfo
  gidLink(cast(void**)&gst_discoverer_audio_info_get_type, "gst_discoverer_audio_info_get_type", libs);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_bitrate, "gst_discoverer_audio_info_get_bitrate", libs);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_channel_mask, "gst_discoverer_audio_info_get_channel_mask", libs);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_channels, "gst_discoverer_audio_info_get_channels", libs);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_depth, "gst_discoverer_audio_info_get_depth", libs);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_language, "gst_discoverer_audio_info_get_language", libs);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_max_bitrate, "gst_discoverer_audio_info_get_max_bitrate", libs);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_sample_rate, "gst_discoverer_audio_info_get_sample_rate", libs);

  // DiscovererContainerInfo
  gidLink(cast(void**)&gst_discoverer_container_info_get_type, "gst_discoverer_container_info_get_type", libs);
  gidLink(cast(void**)&gst_discoverer_container_info_get_streams, "gst_discoverer_container_info_get_streams", libs);
  gidLink(cast(void**)&gst_discoverer_container_info_get_tags, "gst_discoverer_container_info_get_tags", libs);

  // DiscovererInfo
  gidLink(cast(void**)&gst_discoverer_info_get_type, "gst_discoverer_info_get_type", libs);
  gidLink(cast(void**)&gst_discoverer_info_from_variant, "gst_discoverer_info_from_variant", libs);
  gidLink(cast(void**)&gst_discoverer_info_copy, "gst_discoverer_info_copy", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_audio_streams, "gst_discoverer_info_get_audio_streams", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_container_streams, "gst_discoverer_info_get_container_streams", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_duration, "gst_discoverer_info_get_duration", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_live, "gst_discoverer_info_get_live", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_misc, "gst_discoverer_info_get_misc", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_missing_elements_installer_details, "gst_discoverer_info_get_missing_elements_installer_details", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_result, "gst_discoverer_info_get_result", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_seekable, "gst_discoverer_info_get_seekable", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_stream_info, "gst_discoverer_info_get_stream_info", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_stream_list, "gst_discoverer_info_get_stream_list", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_streams, "gst_discoverer_info_get_streams", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_subtitle_streams, "gst_discoverer_info_get_subtitle_streams", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_tags, "gst_discoverer_info_get_tags", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_toc, "gst_discoverer_info_get_toc", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_uri, "gst_discoverer_info_get_uri", libs);
  gidLink(cast(void**)&gst_discoverer_info_get_video_streams, "gst_discoverer_info_get_video_streams", libs);
  gidLink(cast(void**)&gst_discoverer_info_to_variant, "gst_discoverer_info_to_variant", libs);

  // DiscovererStreamInfo
  gidLink(cast(void**)&gst_discoverer_stream_info_get_type, "gst_discoverer_stream_info_get_type", libs);
  gidLink(cast(void**)&gst_discoverer_stream_info_list_free, "gst_discoverer_stream_info_list_free", libs);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_caps, "gst_discoverer_stream_info_get_caps", libs);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_misc, "gst_discoverer_stream_info_get_misc", libs);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_next, "gst_discoverer_stream_info_get_next", libs);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_previous, "gst_discoverer_stream_info_get_previous", libs);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_stream_id, "gst_discoverer_stream_info_get_stream_id", libs);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_stream_number, "gst_discoverer_stream_info_get_stream_number", libs);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_stream_type_nick, "gst_discoverer_stream_info_get_stream_type_nick", libs);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_tags, "gst_discoverer_stream_info_get_tags", libs);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_toc, "gst_discoverer_stream_info_get_toc", libs);

  // DiscovererSubtitleInfo
  gidLink(cast(void**)&gst_discoverer_subtitle_info_get_type, "gst_discoverer_subtitle_info_get_type", libs);
  gidLink(cast(void**)&gst_discoverer_subtitle_info_get_language, "gst_discoverer_subtitle_info_get_language", libs);

  // DiscovererVideoInfo
  gidLink(cast(void**)&gst_discoverer_video_info_get_type, "gst_discoverer_video_info_get_type", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_get_bitrate, "gst_discoverer_video_info_get_bitrate", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_get_depth, "gst_discoverer_video_info_get_depth", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_get_framerate_denom, "gst_discoverer_video_info_get_framerate_denom", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_get_framerate_num, "gst_discoverer_video_info_get_framerate_num", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_get_height, "gst_discoverer_video_info_get_height", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_get_max_bitrate, "gst_discoverer_video_info_get_max_bitrate", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_get_par_denom, "gst_discoverer_video_info_get_par_denom", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_get_par_num, "gst_discoverer_video_info_get_par_num", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_get_width, "gst_discoverer_video_info_get_width", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_is_image, "gst_discoverer_video_info_is_image", libs);
  gidLink(cast(void**)&gst_discoverer_video_info_is_interlaced, "gst_discoverer_video_info_is_interlaced", libs);

  // EncodingAudioProfile
  gidLink(cast(void**)&gst_encoding_audio_profile_get_type, "gst_encoding_audio_profile_get_type", libs);
  gidLink(cast(void**)&gst_encoding_audio_profile_new, "gst_encoding_audio_profile_new", libs);

  // EncodingContainerProfile
  gidLink(cast(void**)&gst_encoding_container_profile_get_type, "gst_encoding_container_profile_get_type", libs);
  gidLink(cast(void**)&gst_encoding_container_profile_new, "gst_encoding_container_profile_new", libs);
  gidLink(cast(void**)&gst_encoding_container_profile_add_profile, "gst_encoding_container_profile_add_profile", libs);
  gidLink(cast(void**)&gst_encoding_container_profile_contains_profile, "gst_encoding_container_profile_contains_profile", libs);
  gidLink(cast(void**)&gst_encoding_container_profile_get_profiles, "gst_encoding_container_profile_get_profiles", libs);

  // EncodingProfile
  gidLink(cast(void**)&gst_encoding_profile_get_type, "gst_encoding_profile_get_type", libs);
  gidLink(cast(void**)&gst_encoding_profile_find, "gst_encoding_profile_find", libs);
  gidLink(cast(void**)&gst_encoding_profile_from_discoverer, "gst_encoding_profile_from_discoverer", libs);
  gidLink(cast(void**)&gst_encoding_profile_from_string, "gst_encoding_profile_from_string", libs);
  gidLink(cast(void**)&gst_encoding_profile_copy, "gst_encoding_profile_copy", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_allow_dynamic_output, "gst_encoding_profile_get_allow_dynamic_output", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_description, "gst_encoding_profile_get_description", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_element_properties, "gst_encoding_profile_get_element_properties", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_file_extension, "gst_encoding_profile_get_file_extension", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_format, "gst_encoding_profile_get_format", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_input_caps, "gst_encoding_profile_get_input_caps", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_name, "gst_encoding_profile_get_name", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_presence, "gst_encoding_profile_get_presence", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_preset, "gst_encoding_profile_get_preset", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_preset_name, "gst_encoding_profile_get_preset_name", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_restriction, "gst_encoding_profile_get_restriction", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_single_segment, "gst_encoding_profile_get_single_segment", libs);
  gidLink(cast(void**)&gst_encoding_profile_get_type_nick, "gst_encoding_profile_get_type_nick", libs);
  gidLink(cast(void**)&gst_encoding_profile_is_enabled, "gst_encoding_profile_is_enabled", libs);
  gidLink(cast(void**)&gst_encoding_profile_is_equal, "gst_encoding_profile_is_equal", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_allow_dynamic_output, "gst_encoding_profile_set_allow_dynamic_output", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_description, "gst_encoding_profile_set_description", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_element_properties, "gst_encoding_profile_set_element_properties", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_enabled, "gst_encoding_profile_set_enabled", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_format, "gst_encoding_profile_set_format", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_name, "gst_encoding_profile_set_name", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_presence, "gst_encoding_profile_set_presence", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_preset, "gst_encoding_profile_set_preset", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_preset_name, "gst_encoding_profile_set_preset_name", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_restriction, "gst_encoding_profile_set_restriction", libs);
  gidLink(cast(void**)&gst_encoding_profile_set_single_segment, "gst_encoding_profile_set_single_segment", libs);
  gidLink(cast(void**)&gst_encoding_profile_to_string, "gst_encoding_profile_to_string", libs);

  // EncodingTarget
  gidLink(cast(void**)&gst_encoding_target_get_type, "gst_encoding_target_get_type", libs);
  gidLink(cast(void**)&gst_encoding_target_new, "gst_encoding_target_new", libs);
  gidLink(cast(void**)&gst_encoding_target_load, "gst_encoding_target_load", libs);
  gidLink(cast(void**)&gst_encoding_target_load_from_file, "gst_encoding_target_load_from_file", libs);
  gidLink(cast(void**)&gst_encoding_target_add_profile, "gst_encoding_target_add_profile", libs);
  gidLink(cast(void**)&gst_encoding_target_get_category, "gst_encoding_target_get_category", libs);
  gidLink(cast(void**)&gst_encoding_target_get_description, "gst_encoding_target_get_description", libs);
  gidLink(cast(void**)&gst_encoding_target_get_name, "gst_encoding_target_get_name", libs);
  gidLink(cast(void**)&gst_encoding_target_get_path, "gst_encoding_target_get_path", libs);
  gidLink(cast(void**)&gst_encoding_target_get_profile, "gst_encoding_target_get_profile", libs);
  gidLink(cast(void**)&gst_encoding_target_get_profiles, "gst_encoding_target_get_profiles", libs);
  gidLink(cast(void**)&gst_encoding_target_save, "gst_encoding_target_save", libs);
  gidLink(cast(void**)&gst_encoding_target_save_to_file, "gst_encoding_target_save_to_file", libs);

  // EncodingVideoProfile
  gidLink(cast(void**)&gst_encoding_video_profile_get_type, "gst_encoding_video_profile_get_type", libs);
  gidLink(cast(void**)&gst_encoding_video_profile_new, "gst_encoding_video_profile_new", libs);
  gidLink(cast(void**)&gst_encoding_video_profile_get_pass, "gst_encoding_video_profile_get_pass", libs);
  gidLink(cast(void**)&gst_encoding_video_profile_get_variableframerate, "gst_encoding_video_profile_get_variableframerate", libs);
  gidLink(cast(void**)&gst_encoding_video_profile_set_pass, "gst_encoding_video_profile_set_pass", libs);
  gidLink(cast(void**)&gst_encoding_video_profile_set_variableframerate, "gst_encoding_video_profile_set_variableframerate", libs);

  // InstallPluginsContext
  gidLink(cast(void**)&gst_install_plugins_context_get_type, "gst_install_plugins_context_get_type", libs);
  gidLink(cast(void**)&gst_install_plugins_context_new, "gst_install_plugins_context_new", libs);
  gidLink(cast(void**)&gst_install_plugins_context_copy, "gst_install_plugins_context_copy", libs);
  gidLink(cast(void**)&gst_install_plugins_context_free, "gst_install_plugins_context_free", libs);
  gidLink(cast(void**)&gst_install_plugins_context_set_confirm_search, "gst_install_plugins_context_set_confirm_search", libs);
  gidLink(cast(void**)&gst_install_plugins_context_set_desktop_id, "gst_install_plugins_context_set_desktop_id", libs);
  gidLink(cast(void**)&gst_install_plugins_context_set_startup_notification_id, "gst_install_plugins_context_set_startup_notification_id", libs);
  gidLink(cast(void**)&gst_install_plugins_context_set_xid, "gst_install_plugins_context_set_xid", libs);

  // global
  gidLink(cast(void**)&gst_codec_utils_aac_caps_set_level_and_profile, "gst_codec_utils_aac_caps_set_level_and_profile", libs);
  gidLink(cast(void**)&gst_codec_utils_aac_get_channels, "gst_codec_utils_aac_get_channels", libs);
  gidLink(cast(void**)&gst_codec_utils_aac_get_index_from_sample_rate, "gst_codec_utils_aac_get_index_from_sample_rate", libs);
  gidLink(cast(void**)&gst_codec_utils_aac_get_level, "gst_codec_utils_aac_get_level", libs);
  gidLink(cast(void**)&gst_codec_utils_aac_get_profile, "gst_codec_utils_aac_get_profile", libs);
  gidLink(cast(void**)&gst_codec_utils_aac_get_sample_rate, "gst_codec_utils_aac_get_sample_rate", libs);
  gidLink(cast(void**)&gst_codec_utils_aac_get_sample_rate_from_index, "gst_codec_utils_aac_get_sample_rate_from_index", libs);
  gidLink(cast(void**)&gst_codec_utils_av1_create_av1c_from_caps, "gst_codec_utils_av1_create_av1c_from_caps", libs);
  gidLink(cast(void**)&gst_codec_utils_av1_create_caps_from_av1c, "gst_codec_utils_av1_create_caps_from_av1c", libs);
  gidLink(cast(void**)&gst_codec_utils_av1_get_level, "gst_codec_utils_av1_get_level", libs);
  gidLink(cast(void**)&gst_codec_utils_av1_get_seq_level_idx, "gst_codec_utils_av1_get_seq_level_idx", libs);
  gidLink(cast(void**)&gst_codec_utils_caps_from_mime_codec, "gst_codec_utils_caps_from_mime_codec", libs);
  gidLink(cast(void**)&gst_codec_utils_caps_get_mime_codec, "gst_codec_utils_caps_get_mime_codec", libs);
  gidLink(cast(void**)&gst_codec_utils_h264_caps_set_level_and_profile, "gst_codec_utils_h264_caps_set_level_and_profile", libs);
  gidLink(cast(void**)&gst_codec_utils_h264_get_level, "gst_codec_utils_h264_get_level", libs);
  gidLink(cast(void**)&gst_codec_utils_h264_get_level_idc, "gst_codec_utils_h264_get_level_idc", libs);
  gidLink(cast(void**)&gst_codec_utils_h264_get_profile, "gst_codec_utils_h264_get_profile", libs);
  gidLink(cast(void**)&gst_codec_utils_h264_get_profile_flags_level, "gst_codec_utils_h264_get_profile_flags_level", libs);
  gidLink(cast(void**)&gst_codec_utils_h265_caps_set_level_tier_and_profile, "gst_codec_utils_h265_caps_set_level_tier_and_profile", libs);
  gidLink(cast(void**)&gst_codec_utils_h265_get_level, "gst_codec_utils_h265_get_level", libs);
  gidLink(cast(void**)&gst_codec_utils_h265_get_level_idc, "gst_codec_utils_h265_get_level_idc", libs);
  gidLink(cast(void**)&gst_codec_utils_h265_get_profile, "gst_codec_utils_h265_get_profile", libs);
  gidLink(cast(void**)&gst_codec_utils_h265_get_tier, "gst_codec_utils_h265_get_tier", libs);
  gidLink(cast(void**)&gst_codec_utils_h266_caps_set_level_tier_and_profile, "gst_codec_utils_h266_caps_set_level_tier_and_profile", libs);
  gidLink(cast(void**)&gst_codec_utils_h266_get_level, "gst_codec_utils_h266_get_level", libs);
  gidLink(cast(void**)&gst_codec_utils_h266_get_level_idc, "gst_codec_utils_h266_get_level_idc", libs);
  gidLink(cast(void**)&gst_codec_utils_h266_get_profile, "gst_codec_utils_h266_get_profile", libs);
  gidLink(cast(void**)&gst_codec_utils_h266_get_tier, "gst_codec_utils_h266_get_tier", libs);
  gidLink(cast(void**)&gst_codec_utils_mpeg4video_caps_set_level_and_profile, "gst_codec_utils_mpeg4video_caps_set_level_and_profile", libs);
  gidLink(cast(void**)&gst_codec_utils_mpeg4video_get_level, "gst_codec_utils_mpeg4video_get_level", libs);
  gidLink(cast(void**)&gst_codec_utils_mpeg4video_get_profile, "gst_codec_utils_mpeg4video_get_profile", libs);
  gidLink(cast(void**)&gst_codec_utils_opus_create_caps, "gst_codec_utils_opus_create_caps", libs);
  gidLink(cast(void**)&gst_codec_utils_opus_create_caps_from_header, "gst_codec_utils_opus_create_caps_from_header", libs);
  gidLink(cast(void**)&gst_codec_utils_opus_create_header, "gst_codec_utils_opus_create_header", libs);
  gidLink(cast(void**)&gst_codec_utils_opus_parse_caps, "gst_codec_utils_opus_parse_caps", libs);
  gidLink(cast(void**)&gst_codec_utils_opus_parse_header, "gst_codec_utils_opus_parse_header", libs);
  gidLink(cast(void**)&gst_encoding_list_all_targets, "gst_encoding_list_all_targets", libs);
  gidLink(cast(void**)&gst_encoding_list_available_categories, "gst_encoding_list_available_categories", libs);
  gidLink(cast(void**)&gst_install_plugins_async, "gst_install_plugins_async", libs);
  gidLink(cast(void**)&gst_install_plugins_installation_in_progress, "gst_install_plugins_installation_in_progress", libs);
  gidLink(cast(void**)&gst_install_plugins_supported, "gst_install_plugins_supported", libs);
  gidLink(cast(void**)&gst_install_plugins_sync, "gst_install_plugins_sync", libs);
  gidLink(cast(void**)&gst_is_missing_plugin_message, "gst_is_missing_plugin_message", libs);
  gidLink(cast(void**)&gst_missing_decoder_installer_detail_new, "gst_missing_decoder_installer_detail_new", libs);
  gidLink(cast(void**)&gst_missing_decoder_message_new, "gst_missing_decoder_message_new", libs);
  gidLink(cast(void**)&gst_missing_element_installer_detail_new, "gst_missing_element_installer_detail_new", libs);
  gidLink(cast(void**)&gst_missing_element_message_new, "gst_missing_element_message_new", libs);
  gidLink(cast(void**)&gst_missing_encoder_installer_detail_new, "gst_missing_encoder_installer_detail_new", libs);
  gidLink(cast(void**)&gst_missing_encoder_message_new, "gst_missing_encoder_message_new", libs);
  gidLink(cast(void**)&gst_missing_plugin_message_get_description, "gst_missing_plugin_message_get_description", libs);
  gidLink(cast(void**)&gst_missing_plugin_message_get_installer_detail, "gst_missing_plugin_message_get_installer_detail", libs);
  gidLink(cast(void**)&gst_missing_plugin_message_get_stream_id, "gst_missing_plugin_message_get_stream_id", libs);
  gidLink(cast(void**)&gst_missing_plugin_message_set_stream_id, "gst_missing_plugin_message_set_stream_id", libs);
  gidLink(cast(void**)&gst_missing_uri_sink_installer_detail_new, "gst_missing_uri_sink_installer_detail_new", libs);
  gidLink(cast(void**)&gst_missing_uri_sink_message_new, "gst_missing_uri_sink_message_new", libs);
  gidLink(cast(void**)&gst_missing_uri_source_installer_detail_new, "gst_missing_uri_source_installer_detail_new", libs);
  gidLink(cast(void**)&gst_missing_uri_source_message_new, "gst_missing_uri_source_message_new", libs);
  gidLink(cast(void**)&gst_pb_utils_add_codec_description_to_tag_list, "gst_pb_utils_add_codec_description_to_tag_list", libs);
  gidLink(cast(void**)&gst_pb_utils_get_caps_description_flags, "gst_pb_utils_get_caps_description_flags", libs);
  gidLink(cast(void**)&gst_pb_utils_get_codec_description, "gst_pb_utils_get_codec_description", libs);
  gidLink(cast(void**)&gst_pb_utils_get_decoder_description, "gst_pb_utils_get_decoder_description", libs);
  gidLink(cast(void**)&gst_pb_utils_get_element_description, "gst_pb_utils_get_element_description", libs);
  gidLink(cast(void**)&gst_pb_utils_get_encoder_description, "gst_pb_utils_get_encoder_description", libs);
  gidLink(cast(void**)&gst_pb_utils_get_file_extension_from_caps, "gst_pb_utils_get_file_extension_from_caps", libs);
  gidLink(cast(void**)&gst_pb_utils_get_sink_description, "gst_pb_utils_get_sink_description", libs);
  gidLink(cast(void**)&gst_pb_utils_get_source_description, "gst_pb_utils_get_source_description", libs);
  gidLink(cast(void**)&gst_pb_utils_init, "gst_pb_utils_init", libs);
  gidLink(cast(void**)&gst_plugins_base_version, "gst_plugins_base_version", libs);
  gidLink(cast(void**)&gst_plugins_base_version_string, "gst_plugins_base_version_string", libs);

  // InstallPluginsReturn
  gidLink(cast(void**)&gst_install_plugins_return_get_name, "gst_install_plugins_return_get_name", libs);
}
