module gstpbutils.c.functions;

public import gid.basictypes;
import gid.loader;
import gstpbutils.c.types;
public import gst.c.types;
public import gstaudio.c.types;
public import gstbase.c.types;
public import gstvideo.c.types;

version(Windows)
  private immutable LIBS = ["libgstpbutils-1.0-0.dll;gstpbutils-1.0-0.dll;gstpbutils-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstpbutils-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstpbutils-1.0.so.0"];

__gshared extern(C)
{
  // AudioVisualizer
  extern(C) GType function() c_gst_audio_visualizer_get_type;

  // Discoverer
  extern(C) GType function() c_gst_discoverer_get_type;
  GstDiscoverer* function(GstClockTime timeout, GError** _err) c_gst_discoverer_new;
  GstDiscovererInfo* function(GstDiscoverer* discoverer, const(char)* uri, GError** _err) c_gst_discoverer_discover_uri;
  bool function(GstDiscoverer* discoverer, const(char)* uri) c_gst_discoverer_discover_uri_async;
  void function(GstDiscoverer* discoverer) c_gst_discoverer_start;
  void function(GstDiscoverer* discoverer) c_gst_discoverer_stop;

  // DiscovererAudioInfo
  extern(C) GType function() c_gst_discoverer_audio_info_get_type;
  uint function(const(GstDiscovererAudioInfo)* info) c_gst_discoverer_audio_info_get_bitrate;
  ulong function(const(GstDiscovererAudioInfo)* info) c_gst_discoverer_audio_info_get_channel_mask;
  uint function(const(GstDiscovererAudioInfo)* info) c_gst_discoverer_audio_info_get_channels;
  uint function(const(GstDiscovererAudioInfo)* info) c_gst_discoverer_audio_info_get_depth;
  const(char)* function(const(GstDiscovererAudioInfo)* info) c_gst_discoverer_audio_info_get_language;
  uint function(const(GstDiscovererAudioInfo)* info) c_gst_discoverer_audio_info_get_max_bitrate;
  uint function(const(GstDiscovererAudioInfo)* info) c_gst_discoverer_audio_info_get_sample_rate;

  // DiscovererContainerInfo
  extern(C) GType function() c_gst_discoverer_container_info_get_type;
  GList* function(GstDiscovererContainerInfo* info) c_gst_discoverer_container_info_get_streams;
  const(GstTagList)* function(const(GstDiscovererContainerInfo)* info) c_gst_discoverer_container_info_get_tags;

  // DiscovererInfo
  extern(C) GType function() c_gst_discoverer_info_get_type;
  GstDiscovererInfo* function(VariantC* variant) c_gst_discoverer_info_from_variant;
  GstDiscovererInfo* function(GstDiscovererInfo* ptr) c_gst_discoverer_info_copy;
  GList* function(GstDiscovererInfo* info) c_gst_discoverer_info_get_audio_streams;
  GList* function(GstDiscovererInfo* info) c_gst_discoverer_info_get_container_streams;
  GstClockTime function(const(GstDiscovererInfo)* info) c_gst_discoverer_info_get_duration;
  bool function(const(GstDiscovererInfo)* info) c_gst_discoverer_info_get_live;
  const(GstStructure)* function(const(GstDiscovererInfo)* info) c_gst_discoverer_info_get_misc;
  const(char*)* function(const(GstDiscovererInfo)* info) c_gst_discoverer_info_get_missing_elements_installer_details;
  GstDiscovererResult function(const(GstDiscovererInfo)* info) c_gst_discoverer_info_get_result;
  bool function(const(GstDiscovererInfo)* info) c_gst_discoverer_info_get_seekable;
  GstDiscovererStreamInfo* function(GstDiscovererInfo* info) c_gst_discoverer_info_get_stream_info;
  GList* function(GstDiscovererInfo* info) c_gst_discoverer_info_get_stream_list;
  GList* function(GstDiscovererInfo* info, GType streamtype) c_gst_discoverer_info_get_streams;
  GList* function(GstDiscovererInfo* info) c_gst_discoverer_info_get_subtitle_streams;
  const(GstTagList)* function(const(GstDiscovererInfo)* info) c_gst_discoverer_info_get_tags;
  const(GstToc)* function(const(GstDiscovererInfo)* info) c_gst_discoverer_info_get_toc;
  const(char)* function(const(GstDiscovererInfo)* info) c_gst_discoverer_info_get_uri;
  GList* function(GstDiscovererInfo* info) c_gst_discoverer_info_get_video_streams;
  VariantC* function(GstDiscovererInfo* info, GstDiscovererSerializeFlags flags) c_gst_discoverer_info_to_variant;

  // DiscovererStreamInfo
  extern(C) GType function() c_gst_discoverer_stream_info_get_type;
  void function(GList* infos) c_gst_discoverer_stream_info_list_free;
  GstCaps* function(GstDiscovererStreamInfo* info) c_gst_discoverer_stream_info_get_caps;
  const(GstStructure)* function(GstDiscovererStreamInfo* info) c_gst_discoverer_stream_info_get_misc;
  GstDiscovererStreamInfo* function(GstDiscovererStreamInfo* info) c_gst_discoverer_stream_info_get_next;
  GstDiscovererStreamInfo* function(GstDiscovererStreamInfo* info) c_gst_discoverer_stream_info_get_previous;
  const(char)* function(GstDiscovererStreamInfo* info) c_gst_discoverer_stream_info_get_stream_id;
  int function(GstDiscovererStreamInfo* info) c_gst_discoverer_stream_info_get_stream_number;
  const(char)* function(GstDiscovererStreamInfo* info) c_gst_discoverer_stream_info_get_stream_type_nick;
  const(GstTagList)* function(GstDiscovererStreamInfo* info) c_gst_discoverer_stream_info_get_tags;
  const(GstToc)* function(GstDiscovererStreamInfo* info) c_gst_discoverer_stream_info_get_toc;

  // DiscovererSubtitleInfo
  extern(C) GType function() c_gst_discoverer_subtitle_info_get_type;
  const(char)* function(const(GstDiscovererSubtitleInfo)* info) c_gst_discoverer_subtitle_info_get_language;

  // DiscovererVideoInfo
  extern(C) GType function() c_gst_discoverer_video_info_get_type;
  uint function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_get_bitrate;
  uint function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_get_depth;
  uint function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_get_framerate_denom;
  uint function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_get_framerate_num;
  uint function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_get_height;
  uint function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_get_max_bitrate;
  uint function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_get_par_denom;
  uint function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_get_par_num;
  uint function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_get_width;
  bool function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_is_image;
  bool function(const(GstDiscovererVideoInfo)* info) c_gst_discoverer_video_info_is_interlaced;

  // EncodingAudioProfile
  extern(C) GType function() c_gst_encoding_audio_profile_get_type;
  GstEncodingAudioProfile* function(GstCaps* format, const(char)* preset, GstCaps* restriction, uint presence) c_gst_encoding_audio_profile_new;

  // EncodingContainerProfile
  extern(C) GType function() c_gst_encoding_container_profile_get_type;
  GstEncodingContainerProfile* function(const(char)* name, const(char)* description, GstCaps* format, const(char)* preset) c_gst_encoding_container_profile_new;
  bool function(GstEncodingContainerProfile* container, GstEncodingProfile* profile) c_gst_encoding_container_profile_add_profile;
  bool function(GstEncodingContainerProfile* container, GstEncodingProfile* profile) c_gst_encoding_container_profile_contains_profile;
  const(GList)* function(GstEncodingContainerProfile* profile) c_gst_encoding_container_profile_get_profiles;

  // EncodingProfile
  extern(C) GType function() c_gst_encoding_profile_get_type;
  GstEncodingProfile* function(const(char)* targetname, const(char)* profilename, const(char)* category) c_gst_encoding_profile_find;
  GstEncodingProfile* function(GstDiscovererInfo* info) c_gst_encoding_profile_from_discoverer;
  GstEncodingProfile* function(GstEncodingProfile* self) c_gst_encoding_profile_copy;
  bool function(GstEncodingProfile* profile) c_gst_encoding_profile_get_allow_dynamic_output;
  const(char)* function(GstEncodingProfile* profile) c_gst_encoding_profile_get_description;
  GstStructure* function(GstEncodingProfile* self) c_gst_encoding_profile_get_element_properties;
  const(char)* function(GstEncodingProfile* profile) c_gst_encoding_profile_get_file_extension;
  GstCaps* function(GstEncodingProfile* profile) c_gst_encoding_profile_get_format;
  GstCaps* function(GstEncodingProfile* profile) c_gst_encoding_profile_get_input_caps;
  const(char)* function(GstEncodingProfile* profile) c_gst_encoding_profile_get_name;
  uint function(GstEncodingProfile* profile) c_gst_encoding_profile_get_presence;
  const(char)* function(GstEncodingProfile* profile) c_gst_encoding_profile_get_preset;
  const(char)* function(GstEncodingProfile* profile) c_gst_encoding_profile_get_preset_name;
  GstCaps* function(GstEncodingProfile* profile) c_gst_encoding_profile_get_restriction;
  bool function(GstEncodingProfile* profile) c_gst_encoding_profile_get_single_segment;
  const(char)* function(GstEncodingProfile* profile) c_gst_encoding_profile_get_type_nick;
  bool function(GstEncodingProfile* profile) c_gst_encoding_profile_is_enabled;
  bool function(GstEncodingProfile* a, GstEncodingProfile* b) c_gst_encoding_profile_is_equal;
  void function(GstEncodingProfile* profile, bool allowDynamicOutput) c_gst_encoding_profile_set_allow_dynamic_output;
  void function(GstEncodingProfile* profile, const(char)* description) c_gst_encoding_profile_set_description;
  void function(GstEncodingProfile* self, GstStructure* elementProperties) c_gst_encoding_profile_set_element_properties;
  void function(GstEncodingProfile* profile, bool enabled) c_gst_encoding_profile_set_enabled;
  void function(GstEncodingProfile* profile, GstCaps* format) c_gst_encoding_profile_set_format;
  void function(GstEncodingProfile* profile, const(char)* name) c_gst_encoding_profile_set_name;
  void function(GstEncodingProfile* profile, uint presence) c_gst_encoding_profile_set_presence;
  void function(GstEncodingProfile* profile, const(char)* preset) c_gst_encoding_profile_set_preset;
  void function(GstEncodingProfile* profile, const(char)* presetName) c_gst_encoding_profile_set_preset_name;
  void function(GstEncodingProfile* profile, GstCaps* restriction) c_gst_encoding_profile_set_restriction;
  void function(GstEncodingProfile* profile, bool singleSegment) c_gst_encoding_profile_set_single_segment;

  // EncodingTarget
  extern(C) GType function() c_gst_encoding_target_get_type;
  GstEncodingTarget* function(const(char)* name, const(char)* category, const(char)* description, const(GList)* profiles) c_gst_encoding_target_new;
  GstEncodingTarget* function(const(char)* name, const(char)* category, GError** _err) c_gst_encoding_target_load;
  GstEncodingTarget* function(const(char)* filepath, GError** _err) c_gst_encoding_target_load_from_file;
  bool function(GstEncodingTarget* target, GstEncodingProfile* profile) c_gst_encoding_target_add_profile;
  const(char)* function(GstEncodingTarget* target) c_gst_encoding_target_get_category;
  const(char)* function(GstEncodingTarget* target) c_gst_encoding_target_get_description;
  const(char)* function(GstEncodingTarget* target) c_gst_encoding_target_get_name;
  const(char)* function(GstEncodingTarget* target) c_gst_encoding_target_get_path;
  GstEncodingProfile* function(GstEncodingTarget* target, const(char)* name) c_gst_encoding_target_get_profile;
  const(GList)* function(GstEncodingTarget* target) c_gst_encoding_target_get_profiles;
  bool function(GstEncodingTarget* target, GError** _err) c_gst_encoding_target_save;
  bool function(GstEncodingTarget* target, const(char)* filepath, GError** _err) c_gst_encoding_target_save_to_file;

  // EncodingVideoProfile
  extern(C) GType function() c_gst_encoding_video_profile_get_type;
  GstEncodingVideoProfile* function(GstCaps* format, const(char)* preset, GstCaps* restriction, uint presence) c_gst_encoding_video_profile_new;
  uint function(GstEncodingVideoProfile* prof) c_gst_encoding_video_profile_get_pass;
  bool function(GstEncodingVideoProfile* prof) c_gst_encoding_video_profile_get_variableframerate;
  void function(GstEncodingVideoProfile* prof, uint pass) c_gst_encoding_video_profile_set_pass;
  void function(GstEncodingVideoProfile* prof, bool variableframerate) c_gst_encoding_video_profile_set_variableframerate;

  // InstallPluginsContext
  extern(C) GType function() c_gst_install_plugins_context_get_type;
  GstInstallPluginsContext* function() c_gst_install_plugins_context_new;
  GstInstallPluginsContext* function(GstInstallPluginsContext* ctx) c_gst_install_plugins_context_copy;
  void function(GstInstallPluginsContext* ctx) c_gst_install_plugins_context_free;
  void function(GstInstallPluginsContext* ctx, bool confirmSearch) c_gst_install_plugins_context_set_confirm_search;
  void function(GstInstallPluginsContext* ctx, const(char)* desktopId) c_gst_install_plugins_context_set_desktop_id;
  void function(GstInstallPluginsContext* ctx, const(char)* startupId) c_gst_install_plugins_context_set_startup_notification_id;
  void function(GstInstallPluginsContext* ctx, uint xid) c_gst_install_plugins_context_set_xid;

  // global
  bool function(GstCaps* caps, const(ubyte)* audioConfig, uint len) c_gst_codec_utils_aac_caps_set_level_and_profile;
  uint function(const(ubyte)* audioConfig, uint len) c_gst_codec_utils_aac_get_channels;
  int function(uint rate) c_gst_codec_utils_aac_get_index_from_sample_rate;
  const(char)* function(const(ubyte)* audioConfig, uint len) c_gst_codec_utils_aac_get_level;
  const(char)* function(const(ubyte)* audioConfig, uint len) c_gst_codec_utils_aac_get_profile;
  uint function(const(ubyte)* audioConfig, uint len) c_gst_codec_utils_aac_get_sample_rate;
  uint function(uint srIdx) c_gst_codec_utils_aac_get_sample_rate_from_index;
  GstCaps* function(const(char)* codecsField) c_gst_codec_utils_caps_from_mime_codec;
  char* function(GstCaps* caps) c_gst_codec_utils_caps_get_mime_codec;
  bool function(GstCaps* caps, const(ubyte)* sps, uint len) c_gst_codec_utils_h264_caps_set_level_and_profile;
  const(char)* function(const(ubyte)* sps, uint len) c_gst_codec_utils_h264_get_level;
  ubyte function(const(char)* level) c_gst_codec_utils_h264_get_level_idc;
  const(char)* function(const(ubyte)* sps, uint len) c_gst_codec_utils_h264_get_profile;
  bool function(const(ubyte)* codecData, uint len, ubyte* profile, ubyte* flags, ubyte* level) c_gst_codec_utils_h264_get_profile_flags_level;
  bool function(GstCaps* caps, const(ubyte)* profileTierLevel, uint len) c_gst_codec_utils_h265_caps_set_level_tier_and_profile;
  const(char)* function(const(ubyte)* profileTierLevel, uint len) c_gst_codec_utils_h265_get_level;
  ubyte function(const(char)* level) c_gst_codec_utils_h265_get_level_idc;
  const(char)* function(const(ubyte)* profileTierLevel, uint len) c_gst_codec_utils_h265_get_profile;
  const(char)* function(const(ubyte)* profileTierLevel, uint len) c_gst_codec_utils_h265_get_tier;
  bool function(GstCaps* caps, const(ubyte)* visObjSeq, uint len) c_gst_codec_utils_mpeg4video_caps_set_level_and_profile;
  const(char)* function(const(ubyte)* visObjSeq, uint len) c_gst_codec_utils_mpeg4video_get_level;
  const(char)* function(const(ubyte)* visObjSeq, uint len) c_gst_codec_utils_mpeg4video_get_profile;
  GstCaps* function(uint rate, ubyte channels, ubyte channelMappingFamily, ubyte streamCount, ubyte coupledCount, const(ubyte)* channelMapping) c_gst_codec_utils_opus_create_caps;
  GstCaps* function(GstBuffer* header, GstBuffer* comments) c_gst_codec_utils_opus_create_caps_from_header;
  GstBuffer* function(uint rate, ubyte channels, ubyte channelMappingFamily, ubyte streamCount, ubyte coupledCount, const(ubyte)* channelMapping, ushort preSkip, short outputGain) c_gst_codec_utils_opus_create_header;
  bool function(GstCaps* caps, uint* rate, ubyte* channels, ubyte* channelMappingFamily, ubyte* streamCount, ubyte* coupledCount, ubyte* channelMapping) c_gst_codec_utils_opus_parse_caps;
  bool function(GstBuffer* header, uint* rate, ubyte* channels, ubyte* channelMappingFamily, ubyte* streamCount, ubyte* coupledCount, ubyte* channelMapping, ushort* preSkip, short* outputGain) c_gst_codec_utils_opus_parse_header;
  GList* function(const(char)* categoryname) c_gst_encoding_list_all_targets;
  GList* function() c_gst_encoding_list_available_categories;
  GstInstallPluginsReturn function(const(char*)* details, GstInstallPluginsContext* ctx, GstInstallPluginsResultFunc func, void* userData) c_gst_install_plugins_async;
  bool function() c_gst_install_plugins_installation_in_progress;
  bool function() c_gst_install_plugins_supported;
  GstInstallPluginsReturn function(const(char*)* details, GstInstallPluginsContext* ctx) c_gst_install_plugins_sync;
  bool function(GstMessage* msg) c_gst_is_missing_plugin_message;
  char* function(const(GstCaps)* decodeCaps) c_gst_missing_decoder_installer_detail_new;
  GstMessage* function(GstElement* element, const(GstCaps)* decodeCaps) c_gst_missing_decoder_message_new;
  char* function(const(char)* factoryName) c_gst_missing_element_installer_detail_new;
  GstMessage* function(GstElement* element, const(char)* factoryName) c_gst_missing_element_message_new;
  char* function(const(GstCaps)* encodeCaps) c_gst_missing_encoder_installer_detail_new;
  GstMessage* function(GstElement* element, const(GstCaps)* encodeCaps) c_gst_missing_encoder_message_new;
  char* function(GstMessage* msg) c_gst_missing_plugin_message_get_description;
  char* function(GstMessage* msg) c_gst_missing_plugin_message_get_installer_detail;
  char* function(const(char)* protocol) c_gst_missing_uri_sink_installer_detail_new;
  GstMessage* function(GstElement* element, const(char)* protocol) c_gst_missing_uri_sink_message_new;
  char* function(const(char)* protocol) c_gst_missing_uri_source_installer_detail_new;
  GstMessage* function(GstElement* element, const(char)* protocol) c_gst_missing_uri_source_message_new;
  bool function(GstTagList* taglist, const(char)* codecTag, const(GstCaps)* caps) c_gst_pb_utils_add_codec_description_to_tag_list;
  GstPbUtilsCapsDescriptionFlags function(const(GstCaps)* caps) c_gst_pb_utils_get_caps_description_flags;
  char* function(const(GstCaps)* caps) c_gst_pb_utils_get_codec_description;
  char* function(const(GstCaps)* caps) c_gst_pb_utils_get_decoder_description;
  char* function(const(char)* factoryName) c_gst_pb_utils_get_element_description;
  char* function(const(GstCaps)* caps) c_gst_pb_utils_get_encoder_description;
  char* function(const(GstCaps)* caps) c_gst_pb_utils_get_file_extension_from_caps;
  char* function(const(char)* protocol) c_gst_pb_utils_get_sink_description;
  char* function(const(char)* protocol) c_gst_pb_utils_get_source_description;
  void function() c_gst_pb_utils_init;
  void function(uint* major, uint* minor, uint* micro, uint* nano) c_gst_plugins_base_version;
  char* function() c_gst_plugins_base_version_string;
}

// AudioVisualizer
alias gst_audio_visualizer_get_type = c_gst_audio_visualizer_get_type;

// Discoverer
alias gst_discoverer_get_type = c_gst_discoverer_get_type;
alias gst_discoverer_new = c_gst_discoverer_new;
alias gst_discoverer_discover_uri = c_gst_discoverer_discover_uri;
alias gst_discoverer_discover_uri_async = c_gst_discoverer_discover_uri_async;
alias gst_discoverer_start = c_gst_discoverer_start;
alias gst_discoverer_stop = c_gst_discoverer_stop;

// DiscovererAudioInfo
alias gst_discoverer_audio_info_get_type = c_gst_discoverer_audio_info_get_type;
alias gst_discoverer_audio_info_get_bitrate = c_gst_discoverer_audio_info_get_bitrate;
alias gst_discoverer_audio_info_get_channel_mask = c_gst_discoverer_audio_info_get_channel_mask;
alias gst_discoverer_audio_info_get_channels = c_gst_discoverer_audio_info_get_channels;
alias gst_discoverer_audio_info_get_depth = c_gst_discoverer_audio_info_get_depth;
alias gst_discoverer_audio_info_get_language = c_gst_discoverer_audio_info_get_language;
alias gst_discoverer_audio_info_get_max_bitrate = c_gst_discoverer_audio_info_get_max_bitrate;
alias gst_discoverer_audio_info_get_sample_rate = c_gst_discoverer_audio_info_get_sample_rate;

// DiscovererContainerInfo
alias gst_discoverer_container_info_get_type = c_gst_discoverer_container_info_get_type;
alias gst_discoverer_container_info_get_streams = c_gst_discoverer_container_info_get_streams;
alias gst_discoverer_container_info_get_tags = c_gst_discoverer_container_info_get_tags;

// DiscovererInfo
alias gst_discoverer_info_get_type = c_gst_discoverer_info_get_type;
alias gst_discoverer_info_from_variant = c_gst_discoverer_info_from_variant;
alias gst_discoverer_info_copy = c_gst_discoverer_info_copy;
alias gst_discoverer_info_get_audio_streams = c_gst_discoverer_info_get_audio_streams;
alias gst_discoverer_info_get_container_streams = c_gst_discoverer_info_get_container_streams;
alias gst_discoverer_info_get_duration = c_gst_discoverer_info_get_duration;
alias gst_discoverer_info_get_live = c_gst_discoverer_info_get_live;
alias gst_discoverer_info_get_misc = c_gst_discoverer_info_get_misc;
alias gst_discoverer_info_get_missing_elements_installer_details = c_gst_discoverer_info_get_missing_elements_installer_details;
alias gst_discoverer_info_get_result = c_gst_discoverer_info_get_result;
alias gst_discoverer_info_get_seekable = c_gst_discoverer_info_get_seekable;
alias gst_discoverer_info_get_stream_info = c_gst_discoverer_info_get_stream_info;
alias gst_discoverer_info_get_stream_list = c_gst_discoverer_info_get_stream_list;
alias gst_discoverer_info_get_streams = c_gst_discoverer_info_get_streams;
alias gst_discoverer_info_get_subtitle_streams = c_gst_discoverer_info_get_subtitle_streams;
alias gst_discoverer_info_get_tags = c_gst_discoverer_info_get_tags;
alias gst_discoverer_info_get_toc = c_gst_discoverer_info_get_toc;
alias gst_discoverer_info_get_uri = c_gst_discoverer_info_get_uri;
alias gst_discoverer_info_get_video_streams = c_gst_discoverer_info_get_video_streams;
alias gst_discoverer_info_to_variant = c_gst_discoverer_info_to_variant;

// DiscovererStreamInfo
alias gst_discoverer_stream_info_get_type = c_gst_discoverer_stream_info_get_type;
alias gst_discoverer_stream_info_list_free = c_gst_discoverer_stream_info_list_free;
alias gst_discoverer_stream_info_get_caps = c_gst_discoverer_stream_info_get_caps;
alias gst_discoverer_stream_info_get_misc = c_gst_discoverer_stream_info_get_misc;
alias gst_discoverer_stream_info_get_next = c_gst_discoverer_stream_info_get_next;
alias gst_discoverer_stream_info_get_previous = c_gst_discoverer_stream_info_get_previous;
alias gst_discoverer_stream_info_get_stream_id = c_gst_discoverer_stream_info_get_stream_id;
alias gst_discoverer_stream_info_get_stream_number = c_gst_discoverer_stream_info_get_stream_number;
alias gst_discoverer_stream_info_get_stream_type_nick = c_gst_discoverer_stream_info_get_stream_type_nick;
alias gst_discoverer_stream_info_get_tags = c_gst_discoverer_stream_info_get_tags;
alias gst_discoverer_stream_info_get_toc = c_gst_discoverer_stream_info_get_toc;

// DiscovererSubtitleInfo
alias gst_discoverer_subtitle_info_get_type = c_gst_discoverer_subtitle_info_get_type;
alias gst_discoverer_subtitle_info_get_language = c_gst_discoverer_subtitle_info_get_language;

// DiscovererVideoInfo
alias gst_discoverer_video_info_get_type = c_gst_discoverer_video_info_get_type;
alias gst_discoverer_video_info_get_bitrate = c_gst_discoverer_video_info_get_bitrate;
alias gst_discoverer_video_info_get_depth = c_gst_discoverer_video_info_get_depth;
alias gst_discoverer_video_info_get_framerate_denom = c_gst_discoverer_video_info_get_framerate_denom;
alias gst_discoverer_video_info_get_framerate_num = c_gst_discoverer_video_info_get_framerate_num;
alias gst_discoverer_video_info_get_height = c_gst_discoverer_video_info_get_height;
alias gst_discoverer_video_info_get_max_bitrate = c_gst_discoverer_video_info_get_max_bitrate;
alias gst_discoverer_video_info_get_par_denom = c_gst_discoverer_video_info_get_par_denom;
alias gst_discoverer_video_info_get_par_num = c_gst_discoverer_video_info_get_par_num;
alias gst_discoverer_video_info_get_width = c_gst_discoverer_video_info_get_width;
alias gst_discoverer_video_info_is_image = c_gst_discoverer_video_info_is_image;
alias gst_discoverer_video_info_is_interlaced = c_gst_discoverer_video_info_is_interlaced;

// EncodingAudioProfile
alias gst_encoding_audio_profile_get_type = c_gst_encoding_audio_profile_get_type;
alias gst_encoding_audio_profile_new = c_gst_encoding_audio_profile_new;

// EncodingContainerProfile
alias gst_encoding_container_profile_get_type = c_gst_encoding_container_profile_get_type;
alias gst_encoding_container_profile_new = c_gst_encoding_container_profile_new;
alias gst_encoding_container_profile_add_profile = c_gst_encoding_container_profile_add_profile;
alias gst_encoding_container_profile_contains_profile = c_gst_encoding_container_profile_contains_profile;
alias gst_encoding_container_profile_get_profiles = c_gst_encoding_container_profile_get_profiles;

// EncodingProfile
alias gst_encoding_profile_get_type = c_gst_encoding_profile_get_type;
alias gst_encoding_profile_find = c_gst_encoding_profile_find;
alias gst_encoding_profile_from_discoverer = c_gst_encoding_profile_from_discoverer;
alias gst_encoding_profile_copy = c_gst_encoding_profile_copy;
alias gst_encoding_profile_get_allow_dynamic_output = c_gst_encoding_profile_get_allow_dynamic_output;
alias gst_encoding_profile_get_description = c_gst_encoding_profile_get_description;
alias gst_encoding_profile_get_element_properties = c_gst_encoding_profile_get_element_properties;
alias gst_encoding_profile_get_file_extension = c_gst_encoding_profile_get_file_extension;
alias gst_encoding_profile_get_format = c_gst_encoding_profile_get_format;
alias gst_encoding_profile_get_input_caps = c_gst_encoding_profile_get_input_caps;
alias gst_encoding_profile_get_name = c_gst_encoding_profile_get_name;
alias gst_encoding_profile_get_presence = c_gst_encoding_profile_get_presence;
alias gst_encoding_profile_get_preset = c_gst_encoding_profile_get_preset;
alias gst_encoding_profile_get_preset_name = c_gst_encoding_profile_get_preset_name;
alias gst_encoding_profile_get_restriction = c_gst_encoding_profile_get_restriction;
alias gst_encoding_profile_get_single_segment = c_gst_encoding_profile_get_single_segment;
alias gst_encoding_profile_get_type_nick = c_gst_encoding_profile_get_type_nick;
alias gst_encoding_profile_is_enabled = c_gst_encoding_profile_is_enabled;
alias gst_encoding_profile_is_equal = c_gst_encoding_profile_is_equal;
alias gst_encoding_profile_set_allow_dynamic_output = c_gst_encoding_profile_set_allow_dynamic_output;
alias gst_encoding_profile_set_description = c_gst_encoding_profile_set_description;
alias gst_encoding_profile_set_element_properties = c_gst_encoding_profile_set_element_properties;
alias gst_encoding_profile_set_enabled = c_gst_encoding_profile_set_enabled;
alias gst_encoding_profile_set_format = c_gst_encoding_profile_set_format;
alias gst_encoding_profile_set_name = c_gst_encoding_profile_set_name;
alias gst_encoding_profile_set_presence = c_gst_encoding_profile_set_presence;
alias gst_encoding_profile_set_preset = c_gst_encoding_profile_set_preset;
alias gst_encoding_profile_set_preset_name = c_gst_encoding_profile_set_preset_name;
alias gst_encoding_profile_set_restriction = c_gst_encoding_profile_set_restriction;
alias gst_encoding_profile_set_single_segment = c_gst_encoding_profile_set_single_segment;

// EncodingTarget
alias gst_encoding_target_get_type = c_gst_encoding_target_get_type;
alias gst_encoding_target_new = c_gst_encoding_target_new;
alias gst_encoding_target_load = c_gst_encoding_target_load;
alias gst_encoding_target_load_from_file = c_gst_encoding_target_load_from_file;
alias gst_encoding_target_add_profile = c_gst_encoding_target_add_profile;
alias gst_encoding_target_get_category = c_gst_encoding_target_get_category;
alias gst_encoding_target_get_description = c_gst_encoding_target_get_description;
alias gst_encoding_target_get_name = c_gst_encoding_target_get_name;
alias gst_encoding_target_get_path = c_gst_encoding_target_get_path;
alias gst_encoding_target_get_profile = c_gst_encoding_target_get_profile;
alias gst_encoding_target_get_profiles = c_gst_encoding_target_get_profiles;
alias gst_encoding_target_save = c_gst_encoding_target_save;
alias gst_encoding_target_save_to_file = c_gst_encoding_target_save_to_file;

// EncodingVideoProfile
alias gst_encoding_video_profile_get_type = c_gst_encoding_video_profile_get_type;
alias gst_encoding_video_profile_new = c_gst_encoding_video_profile_new;
alias gst_encoding_video_profile_get_pass = c_gst_encoding_video_profile_get_pass;
alias gst_encoding_video_profile_get_variableframerate = c_gst_encoding_video_profile_get_variableframerate;
alias gst_encoding_video_profile_set_pass = c_gst_encoding_video_profile_set_pass;
alias gst_encoding_video_profile_set_variableframerate = c_gst_encoding_video_profile_set_variableframerate;

// InstallPluginsContext
alias gst_install_plugins_context_get_type = c_gst_install_plugins_context_get_type;
alias gst_install_plugins_context_new = c_gst_install_plugins_context_new;
alias gst_install_plugins_context_copy = c_gst_install_plugins_context_copy;
alias gst_install_plugins_context_free = c_gst_install_plugins_context_free;
alias gst_install_plugins_context_set_confirm_search = c_gst_install_plugins_context_set_confirm_search;
alias gst_install_plugins_context_set_desktop_id = c_gst_install_plugins_context_set_desktop_id;
alias gst_install_plugins_context_set_startup_notification_id = c_gst_install_plugins_context_set_startup_notification_id;
alias gst_install_plugins_context_set_xid = c_gst_install_plugins_context_set_xid;

// global
alias gst_codec_utils_aac_caps_set_level_and_profile = c_gst_codec_utils_aac_caps_set_level_and_profile;
alias gst_codec_utils_aac_get_channels = c_gst_codec_utils_aac_get_channels;
alias gst_codec_utils_aac_get_index_from_sample_rate = c_gst_codec_utils_aac_get_index_from_sample_rate;
alias gst_codec_utils_aac_get_level = c_gst_codec_utils_aac_get_level;
alias gst_codec_utils_aac_get_profile = c_gst_codec_utils_aac_get_profile;
alias gst_codec_utils_aac_get_sample_rate = c_gst_codec_utils_aac_get_sample_rate;
alias gst_codec_utils_aac_get_sample_rate_from_index = c_gst_codec_utils_aac_get_sample_rate_from_index;
alias gst_codec_utils_caps_from_mime_codec = c_gst_codec_utils_caps_from_mime_codec;
alias gst_codec_utils_caps_get_mime_codec = c_gst_codec_utils_caps_get_mime_codec;
alias gst_codec_utils_h264_caps_set_level_and_profile = c_gst_codec_utils_h264_caps_set_level_and_profile;
alias gst_codec_utils_h264_get_level = c_gst_codec_utils_h264_get_level;
alias gst_codec_utils_h264_get_level_idc = c_gst_codec_utils_h264_get_level_idc;
alias gst_codec_utils_h264_get_profile = c_gst_codec_utils_h264_get_profile;
alias gst_codec_utils_h264_get_profile_flags_level = c_gst_codec_utils_h264_get_profile_flags_level;
alias gst_codec_utils_h265_caps_set_level_tier_and_profile = c_gst_codec_utils_h265_caps_set_level_tier_and_profile;
alias gst_codec_utils_h265_get_level = c_gst_codec_utils_h265_get_level;
alias gst_codec_utils_h265_get_level_idc = c_gst_codec_utils_h265_get_level_idc;
alias gst_codec_utils_h265_get_profile = c_gst_codec_utils_h265_get_profile;
alias gst_codec_utils_h265_get_tier = c_gst_codec_utils_h265_get_tier;
alias gst_codec_utils_mpeg4video_caps_set_level_and_profile = c_gst_codec_utils_mpeg4video_caps_set_level_and_profile;
alias gst_codec_utils_mpeg4video_get_level = c_gst_codec_utils_mpeg4video_get_level;
alias gst_codec_utils_mpeg4video_get_profile = c_gst_codec_utils_mpeg4video_get_profile;
alias gst_codec_utils_opus_create_caps = c_gst_codec_utils_opus_create_caps;
alias gst_codec_utils_opus_create_caps_from_header = c_gst_codec_utils_opus_create_caps_from_header;
alias gst_codec_utils_opus_create_header = c_gst_codec_utils_opus_create_header;
alias gst_codec_utils_opus_parse_caps = c_gst_codec_utils_opus_parse_caps;
alias gst_codec_utils_opus_parse_header = c_gst_codec_utils_opus_parse_header;
alias gst_encoding_list_all_targets = c_gst_encoding_list_all_targets;
alias gst_encoding_list_available_categories = c_gst_encoding_list_available_categories;
alias gst_install_plugins_async = c_gst_install_plugins_async;
alias gst_install_plugins_installation_in_progress = c_gst_install_plugins_installation_in_progress;
alias gst_install_plugins_supported = c_gst_install_plugins_supported;
alias gst_install_plugins_sync = c_gst_install_plugins_sync;
alias gst_is_missing_plugin_message = c_gst_is_missing_plugin_message;
alias gst_missing_decoder_installer_detail_new = c_gst_missing_decoder_installer_detail_new;
alias gst_missing_decoder_message_new = c_gst_missing_decoder_message_new;
alias gst_missing_element_installer_detail_new = c_gst_missing_element_installer_detail_new;
alias gst_missing_element_message_new = c_gst_missing_element_message_new;
alias gst_missing_encoder_installer_detail_new = c_gst_missing_encoder_installer_detail_new;
alias gst_missing_encoder_message_new = c_gst_missing_encoder_message_new;
alias gst_missing_plugin_message_get_description = c_gst_missing_plugin_message_get_description;
alias gst_missing_plugin_message_get_installer_detail = c_gst_missing_plugin_message_get_installer_detail;
alias gst_missing_uri_sink_installer_detail_new = c_gst_missing_uri_sink_installer_detail_new;
alias gst_missing_uri_sink_message_new = c_gst_missing_uri_sink_message_new;
alias gst_missing_uri_source_installer_detail_new = c_gst_missing_uri_source_installer_detail_new;
alias gst_missing_uri_source_message_new = c_gst_missing_uri_source_message_new;
alias gst_pb_utils_add_codec_description_to_tag_list = c_gst_pb_utils_add_codec_description_to_tag_list;
alias gst_pb_utils_get_caps_description_flags = c_gst_pb_utils_get_caps_description_flags;
alias gst_pb_utils_get_codec_description = c_gst_pb_utils_get_codec_description;
alias gst_pb_utils_get_decoder_description = c_gst_pb_utils_get_decoder_description;
alias gst_pb_utils_get_element_description = c_gst_pb_utils_get_element_description;
alias gst_pb_utils_get_encoder_description = c_gst_pb_utils_get_encoder_description;
alias gst_pb_utils_get_file_extension_from_caps = c_gst_pb_utils_get_file_extension_from_caps;
alias gst_pb_utils_get_sink_description = c_gst_pb_utils_get_sink_description;
alias gst_pb_utils_get_source_description = c_gst_pb_utils_get_source_description;
alias gst_pb_utils_init = c_gst_pb_utils_init;
alias gst_plugins_base_version = c_gst_plugins_base_version;
alias gst_plugins_base_version_string = c_gst_plugins_base_version_string;

shared static this()
{
  // AudioVisualizer
  gidLink(cast(void**)&gst_audio_visualizer_get_type, "gst_audio_visualizer_get_type", LIBS);

  // Discoverer
  gidLink(cast(void**)&gst_discoverer_get_type, "gst_discoverer_get_type", LIBS);
  gidLink(cast(void**)&gst_discoverer_new, "gst_discoverer_new", LIBS);
  gidLink(cast(void**)&gst_discoverer_discover_uri, "gst_discoverer_discover_uri", LIBS);
  gidLink(cast(void**)&gst_discoverer_discover_uri_async, "gst_discoverer_discover_uri_async", LIBS);
  gidLink(cast(void**)&gst_discoverer_start, "gst_discoverer_start", LIBS);
  gidLink(cast(void**)&gst_discoverer_stop, "gst_discoverer_stop", LIBS);

  // DiscovererAudioInfo
  gidLink(cast(void**)&gst_discoverer_audio_info_get_type, "gst_discoverer_audio_info_get_type", LIBS);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_bitrate, "gst_discoverer_audio_info_get_bitrate", LIBS);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_channel_mask, "gst_discoverer_audio_info_get_channel_mask", LIBS);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_channels, "gst_discoverer_audio_info_get_channels", LIBS);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_depth, "gst_discoverer_audio_info_get_depth", LIBS);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_language, "gst_discoverer_audio_info_get_language", LIBS);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_max_bitrate, "gst_discoverer_audio_info_get_max_bitrate", LIBS);
  gidLink(cast(void**)&gst_discoverer_audio_info_get_sample_rate, "gst_discoverer_audio_info_get_sample_rate", LIBS);

  // DiscovererContainerInfo
  gidLink(cast(void**)&gst_discoverer_container_info_get_type, "gst_discoverer_container_info_get_type", LIBS);
  gidLink(cast(void**)&gst_discoverer_container_info_get_streams, "gst_discoverer_container_info_get_streams", LIBS);
  gidLink(cast(void**)&gst_discoverer_container_info_get_tags, "gst_discoverer_container_info_get_tags", LIBS);

  // DiscovererInfo
  gidLink(cast(void**)&gst_discoverer_info_get_type, "gst_discoverer_info_get_type", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_from_variant, "gst_discoverer_info_from_variant", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_copy, "gst_discoverer_info_copy", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_audio_streams, "gst_discoverer_info_get_audio_streams", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_container_streams, "gst_discoverer_info_get_container_streams", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_duration, "gst_discoverer_info_get_duration", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_live, "gst_discoverer_info_get_live", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_misc, "gst_discoverer_info_get_misc", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_missing_elements_installer_details, "gst_discoverer_info_get_missing_elements_installer_details", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_result, "gst_discoverer_info_get_result", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_seekable, "gst_discoverer_info_get_seekable", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_stream_info, "gst_discoverer_info_get_stream_info", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_stream_list, "gst_discoverer_info_get_stream_list", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_streams, "gst_discoverer_info_get_streams", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_subtitle_streams, "gst_discoverer_info_get_subtitle_streams", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_tags, "gst_discoverer_info_get_tags", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_toc, "gst_discoverer_info_get_toc", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_uri, "gst_discoverer_info_get_uri", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_get_video_streams, "gst_discoverer_info_get_video_streams", LIBS);
  gidLink(cast(void**)&gst_discoverer_info_to_variant, "gst_discoverer_info_to_variant", LIBS);

  // DiscovererStreamInfo
  gidLink(cast(void**)&gst_discoverer_stream_info_get_type, "gst_discoverer_stream_info_get_type", LIBS);
  gidLink(cast(void**)&gst_discoverer_stream_info_list_free, "gst_discoverer_stream_info_list_free", LIBS);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_caps, "gst_discoverer_stream_info_get_caps", LIBS);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_misc, "gst_discoverer_stream_info_get_misc", LIBS);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_next, "gst_discoverer_stream_info_get_next", LIBS);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_previous, "gst_discoverer_stream_info_get_previous", LIBS);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_stream_id, "gst_discoverer_stream_info_get_stream_id", LIBS);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_stream_number, "gst_discoverer_stream_info_get_stream_number", LIBS);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_stream_type_nick, "gst_discoverer_stream_info_get_stream_type_nick", LIBS);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_tags, "gst_discoverer_stream_info_get_tags", LIBS);
  gidLink(cast(void**)&gst_discoverer_stream_info_get_toc, "gst_discoverer_stream_info_get_toc", LIBS);

  // DiscovererSubtitleInfo
  gidLink(cast(void**)&gst_discoverer_subtitle_info_get_type, "gst_discoverer_subtitle_info_get_type", LIBS);
  gidLink(cast(void**)&gst_discoverer_subtitle_info_get_language, "gst_discoverer_subtitle_info_get_language", LIBS);

  // DiscovererVideoInfo
  gidLink(cast(void**)&gst_discoverer_video_info_get_type, "gst_discoverer_video_info_get_type", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_get_bitrate, "gst_discoverer_video_info_get_bitrate", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_get_depth, "gst_discoverer_video_info_get_depth", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_get_framerate_denom, "gst_discoverer_video_info_get_framerate_denom", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_get_framerate_num, "gst_discoverer_video_info_get_framerate_num", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_get_height, "gst_discoverer_video_info_get_height", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_get_max_bitrate, "gst_discoverer_video_info_get_max_bitrate", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_get_par_denom, "gst_discoverer_video_info_get_par_denom", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_get_par_num, "gst_discoverer_video_info_get_par_num", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_get_width, "gst_discoverer_video_info_get_width", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_is_image, "gst_discoverer_video_info_is_image", LIBS);
  gidLink(cast(void**)&gst_discoverer_video_info_is_interlaced, "gst_discoverer_video_info_is_interlaced", LIBS);

  // EncodingAudioProfile
  gidLink(cast(void**)&gst_encoding_audio_profile_get_type, "gst_encoding_audio_profile_get_type", LIBS);
  gidLink(cast(void**)&gst_encoding_audio_profile_new, "gst_encoding_audio_profile_new", LIBS);

  // EncodingContainerProfile
  gidLink(cast(void**)&gst_encoding_container_profile_get_type, "gst_encoding_container_profile_get_type", LIBS);
  gidLink(cast(void**)&gst_encoding_container_profile_new, "gst_encoding_container_profile_new", LIBS);
  gidLink(cast(void**)&gst_encoding_container_profile_add_profile, "gst_encoding_container_profile_add_profile", LIBS);
  gidLink(cast(void**)&gst_encoding_container_profile_contains_profile, "gst_encoding_container_profile_contains_profile", LIBS);
  gidLink(cast(void**)&gst_encoding_container_profile_get_profiles, "gst_encoding_container_profile_get_profiles", LIBS);

  // EncodingProfile
  gidLink(cast(void**)&gst_encoding_profile_get_type, "gst_encoding_profile_get_type", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_find, "gst_encoding_profile_find", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_from_discoverer, "gst_encoding_profile_from_discoverer", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_copy, "gst_encoding_profile_copy", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_allow_dynamic_output, "gst_encoding_profile_get_allow_dynamic_output", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_description, "gst_encoding_profile_get_description", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_element_properties, "gst_encoding_profile_get_element_properties", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_file_extension, "gst_encoding_profile_get_file_extension", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_format, "gst_encoding_profile_get_format", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_input_caps, "gst_encoding_profile_get_input_caps", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_name, "gst_encoding_profile_get_name", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_presence, "gst_encoding_profile_get_presence", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_preset, "gst_encoding_profile_get_preset", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_preset_name, "gst_encoding_profile_get_preset_name", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_restriction, "gst_encoding_profile_get_restriction", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_single_segment, "gst_encoding_profile_get_single_segment", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_get_type_nick, "gst_encoding_profile_get_type_nick", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_is_enabled, "gst_encoding_profile_is_enabled", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_is_equal, "gst_encoding_profile_is_equal", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_allow_dynamic_output, "gst_encoding_profile_set_allow_dynamic_output", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_description, "gst_encoding_profile_set_description", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_element_properties, "gst_encoding_profile_set_element_properties", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_enabled, "gst_encoding_profile_set_enabled", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_format, "gst_encoding_profile_set_format", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_name, "gst_encoding_profile_set_name", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_presence, "gst_encoding_profile_set_presence", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_preset, "gst_encoding_profile_set_preset", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_preset_name, "gst_encoding_profile_set_preset_name", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_restriction, "gst_encoding_profile_set_restriction", LIBS);
  gidLink(cast(void**)&gst_encoding_profile_set_single_segment, "gst_encoding_profile_set_single_segment", LIBS);

  // EncodingTarget
  gidLink(cast(void**)&gst_encoding_target_get_type, "gst_encoding_target_get_type", LIBS);
  gidLink(cast(void**)&gst_encoding_target_new, "gst_encoding_target_new", LIBS);
  gidLink(cast(void**)&gst_encoding_target_load, "gst_encoding_target_load", LIBS);
  gidLink(cast(void**)&gst_encoding_target_load_from_file, "gst_encoding_target_load_from_file", LIBS);
  gidLink(cast(void**)&gst_encoding_target_add_profile, "gst_encoding_target_add_profile", LIBS);
  gidLink(cast(void**)&gst_encoding_target_get_category, "gst_encoding_target_get_category", LIBS);
  gidLink(cast(void**)&gst_encoding_target_get_description, "gst_encoding_target_get_description", LIBS);
  gidLink(cast(void**)&gst_encoding_target_get_name, "gst_encoding_target_get_name", LIBS);
  gidLink(cast(void**)&gst_encoding_target_get_path, "gst_encoding_target_get_path", LIBS);
  gidLink(cast(void**)&gst_encoding_target_get_profile, "gst_encoding_target_get_profile", LIBS);
  gidLink(cast(void**)&gst_encoding_target_get_profiles, "gst_encoding_target_get_profiles", LIBS);
  gidLink(cast(void**)&gst_encoding_target_save, "gst_encoding_target_save", LIBS);
  gidLink(cast(void**)&gst_encoding_target_save_to_file, "gst_encoding_target_save_to_file", LIBS);

  // EncodingVideoProfile
  gidLink(cast(void**)&gst_encoding_video_profile_get_type, "gst_encoding_video_profile_get_type", LIBS);
  gidLink(cast(void**)&gst_encoding_video_profile_new, "gst_encoding_video_profile_new", LIBS);
  gidLink(cast(void**)&gst_encoding_video_profile_get_pass, "gst_encoding_video_profile_get_pass", LIBS);
  gidLink(cast(void**)&gst_encoding_video_profile_get_variableframerate, "gst_encoding_video_profile_get_variableframerate", LIBS);
  gidLink(cast(void**)&gst_encoding_video_profile_set_pass, "gst_encoding_video_profile_set_pass", LIBS);
  gidLink(cast(void**)&gst_encoding_video_profile_set_variableframerate, "gst_encoding_video_profile_set_variableframerate", LIBS);

  // InstallPluginsContext
  gidLink(cast(void**)&gst_install_plugins_context_get_type, "gst_install_plugins_context_get_type", LIBS);
  gidLink(cast(void**)&gst_install_plugins_context_new, "gst_install_plugins_context_new", LIBS);
  gidLink(cast(void**)&gst_install_plugins_context_copy, "gst_install_plugins_context_copy", LIBS);
  gidLink(cast(void**)&gst_install_plugins_context_free, "gst_install_plugins_context_free", LIBS);
  gidLink(cast(void**)&gst_install_plugins_context_set_confirm_search, "gst_install_plugins_context_set_confirm_search", LIBS);
  gidLink(cast(void**)&gst_install_plugins_context_set_desktop_id, "gst_install_plugins_context_set_desktop_id", LIBS);
  gidLink(cast(void**)&gst_install_plugins_context_set_startup_notification_id, "gst_install_plugins_context_set_startup_notification_id", LIBS);
  gidLink(cast(void**)&gst_install_plugins_context_set_xid, "gst_install_plugins_context_set_xid", LIBS);

  // global
  gidLink(cast(void**)&gst_codec_utils_aac_caps_set_level_and_profile, "gst_codec_utils_aac_caps_set_level_and_profile", LIBS);
  gidLink(cast(void**)&gst_codec_utils_aac_get_channels, "gst_codec_utils_aac_get_channels", LIBS);
  gidLink(cast(void**)&gst_codec_utils_aac_get_index_from_sample_rate, "gst_codec_utils_aac_get_index_from_sample_rate", LIBS);
  gidLink(cast(void**)&gst_codec_utils_aac_get_level, "gst_codec_utils_aac_get_level", LIBS);
  gidLink(cast(void**)&gst_codec_utils_aac_get_profile, "gst_codec_utils_aac_get_profile", LIBS);
  gidLink(cast(void**)&gst_codec_utils_aac_get_sample_rate, "gst_codec_utils_aac_get_sample_rate", LIBS);
  gidLink(cast(void**)&gst_codec_utils_aac_get_sample_rate_from_index, "gst_codec_utils_aac_get_sample_rate_from_index", LIBS);
  gidLink(cast(void**)&gst_codec_utils_caps_from_mime_codec, "gst_codec_utils_caps_from_mime_codec", LIBS);
  gidLink(cast(void**)&gst_codec_utils_caps_get_mime_codec, "gst_codec_utils_caps_get_mime_codec", LIBS);
  gidLink(cast(void**)&gst_codec_utils_h264_caps_set_level_and_profile, "gst_codec_utils_h264_caps_set_level_and_profile", LIBS);
  gidLink(cast(void**)&gst_codec_utils_h264_get_level, "gst_codec_utils_h264_get_level", LIBS);
  gidLink(cast(void**)&gst_codec_utils_h264_get_level_idc, "gst_codec_utils_h264_get_level_idc", LIBS);
  gidLink(cast(void**)&gst_codec_utils_h264_get_profile, "gst_codec_utils_h264_get_profile", LIBS);
  gidLink(cast(void**)&gst_codec_utils_h264_get_profile_flags_level, "gst_codec_utils_h264_get_profile_flags_level", LIBS);
  gidLink(cast(void**)&gst_codec_utils_h265_caps_set_level_tier_and_profile, "gst_codec_utils_h265_caps_set_level_tier_and_profile", LIBS);
  gidLink(cast(void**)&gst_codec_utils_h265_get_level, "gst_codec_utils_h265_get_level", LIBS);
  gidLink(cast(void**)&gst_codec_utils_h265_get_level_idc, "gst_codec_utils_h265_get_level_idc", LIBS);
  gidLink(cast(void**)&gst_codec_utils_h265_get_profile, "gst_codec_utils_h265_get_profile", LIBS);
  gidLink(cast(void**)&gst_codec_utils_h265_get_tier, "gst_codec_utils_h265_get_tier", LIBS);
  gidLink(cast(void**)&gst_codec_utils_mpeg4video_caps_set_level_and_profile, "gst_codec_utils_mpeg4video_caps_set_level_and_profile", LIBS);
  gidLink(cast(void**)&gst_codec_utils_mpeg4video_get_level, "gst_codec_utils_mpeg4video_get_level", LIBS);
  gidLink(cast(void**)&gst_codec_utils_mpeg4video_get_profile, "gst_codec_utils_mpeg4video_get_profile", LIBS);
  gidLink(cast(void**)&gst_codec_utils_opus_create_caps, "gst_codec_utils_opus_create_caps", LIBS);
  gidLink(cast(void**)&gst_codec_utils_opus_create_caps_from_header, "gst_codec_utils_opus_create_caps_from_header", LIBS);
  gidLink(cast(void**)&gst_codec_utils_opus_create_header, "gst_codec_utils_opus_create_header", LIBS);
  gidLink(cast(void**)&gst_codec_utils_opus_parse_caps, "gst_codec_utils_opus_parse_caps", LIBS);
  gidLink(cast(void**)&gst_codec_utils_opus_parse_header, "gst_codec_utils_opus_parse_header", LIBS);
  gidLink(cast(void**)&gst_encoding_list_all_targets, "gst_encoding_list_all_targets", LIBS);
  gidLink(cast(void**)&gst_encoding_list_available_categories, "gst_encoding_list_available_categories", LIBS);
  gidLink(cast(void**)&gst_install_plugins_async, "gst_install_plugins_async", LIBS);
  gidLink(cast(void**)&gst_install_plugins_installation_in_progress, "gst_install_plugins_installation_in_progress", LIBS);
  gidLink(cast(void**)&gst_install_plugins_supported, "gst_install_plugins_supported", LIBS);
  gidLink(cast(void**)&gst_install_plugins_sync, "gst_install_plugins_sync", LIBS);
  gidLink(cast(void**)&gst_is_missing_plugin_message, "gst_is_missing_plugin_message", LIBS);
  gidLink(cast(void**)&gst_missing_decoder_installer_detail_new, "gst_missing_decoder_installer_detail_new", LIBS);
  gidLink(cast(void**)&gst_missing_decoder_message_new, "gst_missing_decoder_message_new", LIBS);
  gidLink(cast(void**)&gst_missing_element_installer_detail_new, "gst_missing_element_installer_detail_new", LIBS);
  gidLink(cast(void**)&gst_missing_element_message_new, "gst_missing_element_message_new", LIBS);
  gidLink(cast(void**)&gst_missing_encoder_installer_detail_new, "gst_missing_encoder_installer_detail_new", LIBS);
  gidLink(cast(void**)&gst_missing_encoder_message_new, "gst_missing_encoder_message_new", LIBS);
  gidLink(cast(void**)&gst_missing_plugin_message_get_description, "gst_missing_plugin_message_get_description", LIBS);
  gidLink(cast(void**)&gst_missing_plugin_message_get_installer_detail, "gst_missing_plugin_message_get_installer_detail", LIBS);
  gidLink(cast(void**)&gst_missing_uri_sink_installer_detail_new, "gst_missing_uri_sink_installer_detail_new", LIBS);
  gidLink(cast(void**)&gst_missing_uri_sink_message_new, "gst_missing_uri_sink_message_new", LIBS);
  gidLink(cast(void**)&gst_missing_uri_source_installer_detail_new, "gst_missing_uri_source_installer_detail_new", LIBS);
  gidLink(cast(void**)&gst_missing_uri_source_message_new, "gst_missing_uri_source_message_new", LIBS);
  gidLink(cast(void**)&gst_pb_utils_add_codec_description_to_tag_list, "gst_pb_utils_add_codec_description_to_tag_list", LIBS);
  gidLink(cast(void**)&gst_pb_utils_get_caps_description_flags, "gst_pb_utils_get_caps_description_flags", LIBS);
  gidLink(cast(void**)&gst_pb_utils_get_codec_description, "gst_pb_utils_get_codec_description", LIBS);
  gidLink(cast(void**)&gst_pb_utils_get_decoder_description, "gst_pb_utils_get_decoder_description", LIBS);
  gidLink(cast(void**)&gst_pb_utils_get_element_description, "gst_pb_utils_get_element_description", LIBS);
  gidLink(cast(void**)&gst_pb_utils_get_encoder_description, "gst_pb_utils_get_encoder_description", LIBS);
  gidLink(cast(void**)&gst_pb_utils_get_file_extension_from_caps, "gst_pb_utils_get_file_extension_from_caps", LIBS);
  gidLink(cast(void**)&gst_pb_utils_get_sink_description, "gst_pb_utils_get_sink_description", LIBS);
  gidLink(cast(void**)&gst_pb_utils_get_source_description, "gst_pb_utils_get_source_description", LIBS);
  gidLink(cast(void**)&gst_pb_utils_init, "gst_pb_utils_init", LIBS);
  gidLink(cast(void**)&gst_plugins_base_version, "gst_plugins_base_version", LIBS);
  gidLink(cast(void**)&gst_plugins_base_version_string, "gst_plugins_base_version_string", LIBS);
}
