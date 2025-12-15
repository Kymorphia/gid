/// C functions for gstrtp1 library
module gstrtp.c.functions;

public import gid.basictypes;
import gid.loader;
import gstrtp.c.types;
public import gst.c.types;
public import gstbase.c.types;

version(Windows)
  private immutable LIBS = ["libgstrtp-1.0-0.dll;gstrtp-1.0-0.dll;gstrtp-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstrtp-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstrtp-1.0.so.0"];

__gshared extern(C)
{
  // RTCPBuffer
  gboolean function(GstRTCPBuffer* rtcp, GstRTCPType type, GstRTCPPacket* packet) c_gst_rtcp_buffer_add_packet; ///
  gboolean function(GstRTCPBuffer* rtcp, GstRTCPPacket* packet) c_gst_rtcp_buffer_get_first_packet; ///
  uint function(GstRTCPBuffer* rtcp) c_gst_rtcp_buffer_get_packet_count; ///
  gboolean function(GstRTCPBuffer* rtcp) c_gst_rtcp_buffer_unmap; ///
  gboolean function(GstBuffer* buffer, GstMapFlags flags, GstRTCPBuffer* rtcp) c_gst_rtcp_buffer_map; ///
  GstBuffer* function(uint mtu) c_gst_rtcp_buffer_new; ///
  GstBuffer* function(const(void)* data, uint len) c_gst_rtcp_buffer_new_copy_data; ///
  GstBuffer* function(void* data, uint len) c_gst_rtcp_buffer_new_take_data; ///
  gboolean function(GstBuffer* buffer) c_gst_rtcp_buffer_validate; ///
  gboolean function(ubyte* data, uint len) c_gst_rtcp_buffer_validate_data; ///
  gboolean function(ubyte* data, uint len) c_gst_rtcp_buffer_validate_data_reduced; ///
  gboolean function(GstBuffer* buffer) c_gst_rtcp_buffer_validate_reduced; ///

  // RTCPPacket
  gboolean function(GstRTCPPacket* packet, const(ubyte)* data, uint len) c_gst_rtcp_packet_add_profile_specific_ext; ///
  gboolean function(GstRTCPPacket* packet, uint ssrc, ubyte fractionlost, int packetslost, uint exthighestseq, uint jitter, uint lsr, uint dlsr) c_gst_rtcp_packet_add_rb; ///
  ubyte* function(GstRTCPPacket* packet) c_gst_rtcp_packet_app_get_data; ///
  ushort function(GstRTCPPacket* packet) c_gst_rtcp_packet_app_get_data_length; ///
  const(char)* function(GstRTCPPacket* packet) c_gst_rtcp_packet_app_get_name; ///
  uint function(GstRTCPPacket* packet) c_gst_rtcp_packet_app_get_ssrc; ///
  ubyte function(GstRTCPPacket* packet) c_gst_rtcp_packet_app_get_subtype; ///
  gboolean function(GstRTCPPacket* packet, ushort wordlen) c_gst_rtcp_packet_app_set_data_length; ///
  void function(GstRTCPPacket* packet, const(char)* name) c_gst_rtcp_packet_app_set_name; ///
  void function(GstRTCPPacket* packet, uint ssrc) c_gst_rtcp_packet_app_set_ssrc; ///
  void function(GstRTCPPacket* packet, ubyte subtype) c_gst_rtcp_packet_app_set_subtype; ///
  gboolean function(GstRTCPPacket* packet, uint ssrc) c_gst_rtcp_packet_bye_add_ssrc; ///
  gboolean function(GstRTCPPacket* packet, uint* ssrc, uint len) c_gst_rtcp_packet_bye_add_ssrcs; ///
  uint function(GstRTCPPacket* packet, uint nth) c_gst_rtcp_packet_bye_get_nth_ssrc; ///
  char* function(GstRTCPPacket* packet) c_gst_rtcp_packet_bye_get_reason; ///
  ubyte function(GstRTCPPacket* packet) c_gst_rtcp_packet_bye_get_reason_len; ///
  uint function(GstRTCPPacket* packet) c_gst_rtcp_packet_bye_get_ssrc_count; ///
  gboolean function(GstRTCPPacket* packet, const(char)* reason) c_gst_rtcp_packet_bye_set_reason; ///
  gboolean function(GstRTCPPacket* packet, ubyte** data, uint* len) c_gst_rtcp_packet_copy_profile_specific_ext; ///
  ubyte* function(GstRTCPPacket* packet) c_gst_rtcp_packet_fb_get_fci; ///
  ushort function(GstRTCPPacket* packet) c_gst_rtcp_packet_fb_get_fci_length; ///
  uint function(GstRTCPPacket* packet) c_gst_rtcp_packet_fb_get_media_ssrc; ///
  uint function(GstRTCPPacket* packet) c_gst_rtcp_packet_fb_get_sender_ssrc; ///
  GstRTCPFBType function(GstRTCPPacket* packet) c_gst_rtcp_packet_fb_get_type; ///
  gboolean function(GstRTCPPacket* packet, ushort wordlen) c_gst_rtcp_packet_fb_set_fci_length; ///
  void function(GstRTCPPacket* packet, uint ssrc) c_gst_rtcp_packet_fb_set_media_ssrc; ///
  void function(GstRTCPPacket* packet, uint ssrc) c_gst_rtcp_packet_fb_set_sender_ssrc; ///
  void function(GstRTCPPacket* packet, GstRTCPFBType type) c_gst_rtcp_packet_fb_set_type; ///
  ubyte function(GstRTCPPacket* packet) c_gst_rtcp_packet_get_count; ///
  ushort function(GstRTCPPacket* packet) c_gst_rtcp_packet_get_length; ///
  gboolean function(GstRTCPPacket* packet) c_gst_rtcp_packet_get_padding; ///
  gboolean function(GstRTCPPacket* packet, ubyte** data, uint* len) c_gst_rtcp_packet_get_profile_specific_ext; ///
  ushort function(GstRTCPPacket* packet) c_gst_rtcp_packet_get_profile_specific_ext_length; ///
  void function(GstRTCPPacket* packet, uint nth, uint* ssrc, ubyte* fractionlost, int* packetslost, uint* exthighestseq, uint* jitter, uint* lsr, uint* dlsr) c_gst_rtcp_packet_get_rb; ///
  uint function(GstRTCPPacket* packet) c_gst_rtcp_packet_get_rb_count; ///
  GstRTCPType function(GstRTCPPacket* packet) c_gst_rtcp_packet_get_type; ///
  gboolean function(GstRTCPPacket* packet) c_gst_rtcp_packet_move_to_next; ///
  gboolean function(GstRTCPPacket* packet) c_gst_rtcp_packet_remove; ///
  uint function(GstRTCPPacket* packet) c_gst_rtcp_packet_rr_get_ssrc; ///
  void function(GstRTCPPacket* packet, uint ssrc) c_gst_rtcp_packet_rr_set_ssrc; ///
  gboolean function(GstRTCPPacket* packet, GstRTCPSDESType type, ubyte len, const(ubyte)* data) c_gst_rtcp_packet_sdes_add_entry; ///
  gboolean function(GstRTCPPacket* packet, uint ssrc) c_gst_rtcp_packet_sdes_add_item; ///
  gboolean function(GstRTCPPacket* packet, GstRTCPSDESType* type, ubyte* len, ubyte** data) c_gst_rtcp_packet_sdes_copy_entry; ///
  gboolean function(GstRTCPPacket* packet) c_gst_rtcp_packet_sdes_first_entry; ///
  gboolean function(GstRTCPPacket* packet) c_gst_rtcp_packet_sdes_first_item; ///
  gboolean function(GstRTCPPacket* packet, GstRTCPSDESType* type, ubyte* len, ubyte** data) c_gst_rtcp_packet_sdes_get_entry; ///
  uint function(GstRTCPPacket* packet) c_gst_rtcp_packet_sdes_get_item_count; ///
  uint function(GstRTCPPacket* packet) c_gst_rtcp_packet_sdes_get_ssrc; ///
  gboolean function(GstRTCPPacket* packet) c_gst_rtcp_packet_sdes_next_entry; ///
  gboolean function(GstRTCPPacket* packet) c_gst_rtcp_packet_sdes_next_item; ///
  void function(GstRTCPPacket* packet, uint nth, uint ssrc, ubyte fractionlost, int packetslost, uint exthighestseq, uint jitter, uint lsr, uint dlsr) c_gst_rtcp_packet_set_rb; ///
  void function(GstRTCPPacket* packet, uint* ssrc, ulong* ntptime, uint* rtptime, uint* packetCount, uint* octetCount) c_gst_rtcp_packet_sr_get_sender_info; ///
  void function(GstRTCPPacket* packet, uint ssrc, ulong ntptime, uint rtptime, uint packetCount, uint octetCount) c_gst_rtcp_packet_sr_set_sender_info; ///
  gboolean function(GstRTCPPacket* packet) c_gst_rtcp_packet_xr_first_rb; ///
  ushort function(GstRTCPPacket* packet) c_gst_rtcp_packet_xr_get_block_length; ///
  GstRTCPXRType function(GstRTCPPacket* packet) c_gst_rtcp_packet_xr_get_block_type; ///
  gboolean function(GstRTCPPacket* packet, uint nth, uint* ssrc, uint* lastRr, uint* delay) c_gst_rtcp_packet_xr_get_dlrr_block; ///
  gboolean function(GstRTCPPacket* packet, ushort seq, uint* receiptTime) c_gst_rtcp_packet_xr_get_prt_by_seq; ///
  gboolean function(GstRTCPPacket* packet, uint* ssrc, ubyte* thinning, ushort* beginSeq, ushort* endSeq) c_gst_rtcp_packet_xr_get_prt_info; ///
  gboolean function(GstRTCPPacket* packet, uint* ssrc, ubyte* thinning, ushort* beginSeq, ushort* endSeq, uint* chunkCount) c_gst_rtcp_packet_xr_get_rle_info; ///
  gboolean function(GstRTCPPacket* packet, uint nth, ushort* chunk) c_gst_rtcp_packet_xr_get_rle_nth_chunk; ///
  gboolean function(GstRTCPPacket* packet, ulong* timestamp) c_gst_rtcp_packet_xr_get_rrt; ///
  uint function(GstRTCPPacket* packet) c_gst_rtcp_packet_xr_get_ssrc; ///
  gboolean function(GstRTCPPacket* packet, uint* ssrc, ushort* beginSeq, ushort* endSeq) c_gst_rtcp_packet_xr_get_summary_info; ///
  gboolean function(GstRTCPPacket* packet, uint* minJitter, uint* maxJitter, uint* meanJitter, uint* devJitter) c_gst_rtcp_packet_xr_get_summary_jitter; ///
  gboolean function(GstRTCPPacket* packet, uint* lostPackets, uint* dupPackets) c_gst_rtcp_packet_xr_get_summary_pkt; ///
  gboolean function(GstRTCPPacket* packet, gboolean* isIpv4, ubyte* minTtl, ubyte* maxTtl, ubyte* meanTtl, ubyte* devTtl) c_gst_rtcp_packet_xr_get_summary_ttl; ///
  gboolean function(GstRTCPPacket* packet, ubyte* burstDensity, ubyte* gapDensity, ushort* burstDuration, ushort* gapDuration) c_gst_rtcp_packet_xr_get_voip_burst_metrics; ///
  gboolean function(GstRTCPPacket* packet, ubyte* gmin, ubyte* rxConfig) c_gst_rtcp_packet_xr_get_voip_configuration_params; ///
  gboolean function(GstRTCPPacket* packet, ushort* roundtripDelay, ushort* endSystemDelay) c_gst_rtcp_packet_xr_get_voip_delay_metrics; ///
  gboolean function(GstRTCPPacket* packet, ushort* jbNominal, ushort* jbMaximum, ushort* jbAbsMax) c_gst_rtcp_packet_xr_get_voip_jitter_buffer_params; ///
  gboolean function(GstRTCPPacket* packet, uint* ssrc) c_gst_rtcp_packet_xr_get_voip_metrics_ssrc; ///
  gboolean function(GstRTCPPacket* packet, ubyte* lossRate, ubyte* discardRate) c_gst_rtcp_packet_xr_get_voip_packet_metrics; ///
  gboolean function(GstRTCPPacket* packet, ubyte* rFactor, ubyte* extRFactor, ubyte* mosLq, ubyte* mosCq) c_gst_rtcp_packet_xr_get_voip_quality_metrics; ///
  gboolean function(GstRTCPPacket* packet, ubyte* signalLevel, ubyte* noiseLevel, ubyte* rerl, ubyte* gmin) c_gst_rtcp_packet_xr_get_voip_signal_metrics; ///
  gboolean function(GstRTCPPacket* packet) c_gst_rtcp_packet_xr_next_rb; ///

  // RTPBaseAudioPayload
  GType function() c_gst_rtp_base_audio_payload_get_type; ///
  GstFlowReturn function(GstRTPBaseAudioPayload* baseaudiopayload, uint payloadLen, GstClockTime timestamp) c_gst_rtp_base_audio_payload_flush; ///
  GstAdapter* function(GstRTPBaseAudioPayload* rtpbaseaudiopayload) c_gst_rtp_base_audio_payload_get_adapter; ///
  GstFlowReturn function(GstRTPBaseAudioPayload* baseaudiopayload, const(ubyte)* data, uint payloadLen, GstClockTime timestamp) c_gst_rtp_base_audio_payload_push; ///
  void function(GstRTPBaseAudioPayload* rtpbaseaudiopayload) c_gst_rtp_base_audio_payload_set_frame_based; ///
  void function(GstRTPBaseAudioPayload* rtpbaseaudiopayload, int frameDuration, int frameSize) c_gst_rtp_base_audio_payload_set_frame_options; ///
  void function(GstRTPBaseAudioPayload* rtpbaseaudiopayload) c_gst_rtp_base_audio_payload_set_sample_based; ///
  void function(GstRTPBaseAudioPayload* rtpbaseaudiopayload, int sampleSize) c_gst_rtp_base_audio_payload_set_sample_options; ///
  void function(GstRTPBaseAudioPayload* rtpbaseaudiopayload, int sampleSize) c_gst_rtp_base_audio_payload_set_samplebits_options; ///

  // RTPBaseDepayload
  GType function() c_gst_rtp_base_depayload_get_type; ///
  void function(GstRTPBaseDepayload* depayload) c_gst_rtp_base_depayload_delayed; ///
  void function(GstRTPBaseDepayload* depayload) c_gst_rtp_base_depayload_dropped; ///
  void function(GstRTPBaseDepayload* depayload, gboolean keepCurrent) c_gst_rtp_base_depayload_flush; ///
  gboolean function(GstRTPBaseDepayload* depayload) c_gst_rtp_base_depayload_is_aggregate_hdrext_enabled; ///
  gboolean function(GstRTPBaseDepayload* depayload) c_gst_rtp_base_depayload_is_source_info_enabled; ///
  GstFlowReturn function(GstRTPBaseDepayload* filter, GstBuffer* outBuf) c_gst_rtp_base_depayload_push; ///
  GstFlowReturn function(GstRTPBaseDepayload* filter, GstBufferList* outList) c_gst_rtp_base_depayload_push_list; ///
  void function(GstRTPBaseDepayload* depayload, gboolean enable) c_gst_rtp_base_depayload_set_aggregate_hdrext_enabled; ///
  void function(GstRTPBaseDepayload* depayload, gboolean enable) c_gst_rtp_base_depayload_set_source_info_enabled; ///

  // RTPBasePayload
  GType function() c_gst_rtp_base_payload_get_type; ///
  GstBuffer* function(GstRTPBasePayload* payload, uint payloadLen, ubyte padLen, ubyte csrcCount) c_gst_rtp_base_payload_allocate_output_buffer; ///
  uint function(GstRTPBasePayload* payload, GstBuffer* buffer) c_gst_rtp_base_payload_get_source_count; ///
  gboolean function(GstRTPBasePayload* payload, uint size, GstClockTime duration) c_gst_rtp_base_payload_is_filled; ///
  gboolean function(GstRTPBasePayload* payload) c_gst_rtp_base_payload_is_source_info_enabled; ///
  GstFlowReturn function(GstRTPBasePayload* payload, GstBuffer* buffer) c_gst_rtp_base_payload_push; ///
  GstFlowReturn function(GstRTPBasePayload* payload, GstBufferList* list) c_gst_rtp_base_payload_push_list; ///
  void function(GstRTPBasePayload* payload, const(char)* media, gboolean dynamic, const(char)* encodingName, uint clockRate) c_gst_rtp_base_payload_set_options; ///
  gboolean function(GstRTPBasePayload* payload, const(char)* fieldname,  ...) c_gst_rtp_base_payload_set_outcaps; ///
  gboolean function(GstRTPBasePayload* payload, GstStructure* s) c_gst_rtp_base_payload_set_outcaps_structure; ///
  void function(GstRTPBasePayload* payload, gboolean enable) c_gst_rtp_base_payload_set_source_info_enabled; ///

  // RTPBuffer
  gboolean function(GstRTPBuffer* rtp, ubyte id, const(void)* data, uint size) c_gst_rtp_buffer_add_extension_onebyte_header; ///
  gboolean function(GstRTPBuffer* rtp, ubyte appbits, ubyte id, const(void)* data, uint size) c_gst_rtp_buffer_add_extension_twobytes_header; ///
  uint function(GstRTPBuffer* rtp, ubyte idx) c_gst_rtp_buffer_get_csrc; ///
  ubyte function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_csrc_count; ///
  gboolean function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_extension; ///
  GBytes* function(GstRTPBuffer* rtp, ushort* bits) c_gst_rtp_buffer_get_extension_bytes; ///
  gboolean function(GstRTPBuffer* rtp, ushort* bits, void** data, uint* wordlen) c_gst_rtp_buffer_get_extension_data; ///
  gboolean function(GstRTPBuffer* rtp, ubyte id, uint nth, void** data, uint* size) c_gst_rtp_buffer_get_extension_onebyte_header; ///
  gboolean function(GstRTPBuffer* rtp, ubyte* appbits, ubyte id, uint nth, void** data, uint* size) c_gst_rtp_buffer_get_extension_twobytes_header; ///
  uint function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_header_len; ///
  gboolean function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_marker; ///
  uint function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_packet_len; ///
  gboolean function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_padding; ///
  void* function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_payload; ///
  GstBuffer* function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_payload_buffer; ///
  GBytes* function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_payload_bytes; ///
  uint function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_payload_len; ///
  GstBuffer* function(GstRTPBuffer* rtp, uint offset, uint len) c_gst_rtp_buffer_get_payload_subbuffer; ///
  ubyte function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_payload_type; ///
  ushort function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_seq; ///
  uint function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_ssrc; ///
  uint function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_timestamp; ///
  ubyte function(GstRTPBuffer* rtp) c_gst_rtp_buffer_get_version; ///
  void function(GstRTPBuffer* rtp, uint len) c_gst_rtp_buffer_pad_to; ///
  void function(GstRTPBuffer* rtp) c_gst_rtp_buffer_remove_extension_data; ///
  void function(GstRTPBuffer* rtp, ubyte idx, uint csrc) c_gst_rtp_buffer_set_csrc; ///
  void function(GstRTPBuffer* rtp, gboolean extension) c_gst_rtp_buffer_set_extension; ///
  gboolean function(GstRTPBuffer* rtp, ushort bits, ushort length) c_gst_rtp_buffer_set_extension_data; ///
  void function(GstRTPBuffer* rtp, gboolean marker) c_gst_rtp_buffer_set_marker; ///
  void function(GstRTPBuffer* rtp, uint len) c_gst_rtp_buffer_set_packet_len; ///
  void function(GstRTPBuffer* rtp, gboolean padding) c_gst_rtp_buffer_set_padding; ///
  void function(GstRTPBuffer* rtp, ubyte payloadType) c_gst_rtp_buffer_set_payload_type; ///
  void function(GstRTPBuffer* rtp, ushort seq) c_gst_rtp_buffer_set_seq; ///
  void function(GstRTPBuffer* rtp, uint ssrc) c_gst_rtp_buffer_set_ssrc; ///
  void function(GstRTPBuffer* rtp, uint timestamp) c_gst_rtp_buffer_set_timestamp; ///
  void function(GstRTPBuffer* rtp, ubyte version_) c_gst_rtp_buffer_set_version; ///
  void function(GstRTPBuffer* rtp) c_gst_rtp_buffer_unmap; ///
  void function(GstBuffer* buffer, uint payloadLen, ubyte padLen, ubyte csrcCount) c_gst_rtp_buffer_allocate_data; ///
  uint function(ubyte csrcCount) c_gst_rtp_buffer_calc_header_len; ///
  uint function(uint payloadLen, ubyte padLen, ubyte csrcCount) c_gst_rtp_buffer_calc_packet_len; ///
  uint function(uint packetLen, ubyte padLen, ubyte csrcCount) c_gst_rtp_buffer_calc_payload_len; ///
  int function(ushort seqnum1, ushort seqnum2) c_gst_rtp_buffer_compare_seqnum; ///
  uint function(ubyte payloadType) c_gst_rtp_buffer_default_clock_rate; ///
  ulong function(ulong* exttimestamp, uint timestamp) c_gst_rtp_buffer_ext_timestamp; ///
  gboolean function(GBytes* bytes, ushort bitPattern, ubyte id, uint nth, void** data, uint* size) c_gst_rtp_buffer_get_extension_onebyte_header_from_bytes; ///
  gboolean function(GstBuffer* buffer, GstMapFlags flags, GstRTPBuffer* rtp) c_gst_rtp_buffer_map; ///
  GstBuffer* function(uint payloadLen, ubyte padLen, ubyte csrcCount) c_gst_rtp_buffer_new_allocate; ///
  GstBuffer* function(uint packetLen, ubyte padLen, ubyte csrcCount) c_gst_rtp_buffer_new_allocate_len; ///
  GstBuffer* function(const(void)* data, size_t len) c_gst_rtp_buffer_new_copy_data; ///
  GstBuffer* function(void* data, size_t len) c_gst_rtp_buffer_new_take_data; ///

  // RTPHeaderExtension
  GType function() c_gst_rtp_header_extension_get_type; ///
  GstRTPHeaderExtension* function(const(char)* uri) c_gst_rtp_header_extension_create_from_uri; ///
  GstRTPHeaderExtensionDirection function(GstRTPHeaderExtension* ext) c_gst_rtp_header_extension_get_direction; ///
  uint function(GstRTPHeaderExtension* ext) c_gst_rtp_header_extension_get_id; ///
  size_t function(GstRTPHeaderExtension* ext, const(GstBuffer)* inputMeta) c_gst_rtp_header_extension_get_max_size; ///
  char* function(GstRTPHeaderExtension* ext) c_gst_rtp_header_extension_get_sdp_caps_field_name; ///
  GstRTPHeaderExtensionFlags function(GstRTPHeaderExtension* ext) c_gst_rtp_header_extension_get_supported_flags; ///
  const(char)* function(GstRTPHeaderExtension* ext) c_gst_rtp_header_extension_get_uri; ///
  gboolean function(GstRTPHeaderExtension* ext, GstRTPHeaderExtensionFlags readFlags, const(ubyte)* data, size_t size, GstBuffer* buffer) c_gst_rtp_header_extension_read; ///
  gboolean function(GstRTPHeaderExtension* ext, const(GstCaps)* caps) c_gst_rtp_header_extension_set_attributes_from_caps; ///
  gboolean function(GstRTPHeaderExtension* ext, GstCaps* caps) c_gst_rtp_header_extension_set_caps_from_attributes; ///
  gboolean function(GstRTPHeaderExtension* ext, GstCaps* caps, const(char)* attributes) c_gst_rtp_header_extension_set_caps_from_attributes_helper; ///
  void function(GstRTPHeaderExtension* ext, GstRTPHeaderExtensionDirection direction) c_gst_rtp_header_extension_set_direction; ///
  void function(GstRTPHeaderExtension* ext, uint extId) c_gst_rtp_header_extension_set_id; ///
  gboolean function(GstRTPHeaderExtension* ext, const(GstCaps)* caps) c_gst_rtp_header_extension_set_non_rtp_sink_caps; ///
  void function(GstRTPHeaderExtension* ext, gboolean state) c_gst_rtp_header_extension_set_wants_update_non_rtp_src_caps; ///
  gboolean function(GstRTPHeaderExtension* ext, GstCaps* caps) c_gst_rtp_header_extension_update_non_rtp_src_caps; ///
  gboolean function(GstRTPHeaderExtension* ext) c_gst_rtp_header_extension_wants_update_non_rtp_src_caps; ///
  ptrdiff_t function(GstRTPHeaderExtension* ext, const(GstBuffer)* inputMeta, GstRTPHeaderExtensionFlags writeFlags, GstBuffer* output, ubyte* data, size_t size) c_gst_rtp_header_extension_write; ///

  // RTPHeaderExtensionClass
  void function(GstRTPHeaderExtensionClass* klass, const(char)* uri) c_gst_rtp_header_extension_class_set_uri; ///

  // RTPPayloadInfo
  const(GstRTPPayloadInfo)* function(const(char)* media, const(char)* encodingName) c_gst_rtp_payload_info_for_name; ///
  const(GstRTPPayloadInfo)* function(ubyte payloadType) c_gst_rtp_payload_info_for_pt; ///

  // RTPSourceMeta
  gboolean function(GstRTPSourceMeta* meta, const(uint)* csrc, uint csrcCount) c_gst_rtp_source_meta_append_csrc; ///
  uint function(const(GstRTPSourceMeta)* meta) c_gst_rtp_source_meta_get_source_count; ///
  gboolean function(GstRTPSourceMeta* meta, uint* ssrc) c_gst_rtp_source_meta_set_ssrc; ///
  const(GstMetaInfo)* function() c_gst_rtp_source_meta_get_info; ///

  // global
  GstRTPSourceMeta* function(GstBuffer* buffer, const(uint)* ssrc, const(uint)* csrc, uint csrcCount) c_gst_buffer_add_rtp_source_meta; ///
  GstRTPSourceMeta* function(GstBuffer* buffer) c_gst_buffer_get_rtp_source_meta; ///
  ulong function(ulong ntptime) c_gst_rtcp_ntp_to_unix; ///
  GstRTCPSDESType function(const(char)* name) c_gst_rtcp_sdes_name_to_type; ///
  const(char)* function(GstRTCPSDESType type) c_gst_rtcp_sdes_type_to_name; ///
  ulong function(ulong unixtime) c_gst_rtcp_unix_to_ntp; ///
  GList* function() c_gst_rtp_get_header_extension_list; ///
  gboolean function(void* data, uint size, ulong* ntptime) c_gst_rtp_hdrext_get_ntp_56; ///
  gboolean function(void* data, uint size, ulong* ntptime) c_gst_rtp_hdrext_get_ntp_64; ///
  gboolean function(void* data, uint size, ulong ntptime) c_gst_rtp_hdrext_set_ntp_56; ///
  gboolean function(void* data, uint size, ulong ntptime) c_gst_rtp_hdrext_set_ntp_64; ///
  GType function() c_gst_rtp_source_meta_api_get_type; ///
}

// RTCPBuffer

/** */
alias gst_rtcp_buffer_add_packet = c_gst_rtcp_buffer_add_packet;

/** */
alias gst_rtcp_buffer_get_first_packet = c_gst_rtcp_buffer_get_first_packet;

/** */
alias gst_rtcp_buffer_get_packet_count = c_gst_rtcp_buffer_get_packet_count;

/** */
alias gst_rtcp_buffer_unmap = c_gst_rtcp_buffer_unmap;

/** */
alias gst_rtcp_buffer_map = c_gst_rtcp_buffer_map;

/** */
alias gst_rtcp_buffer_new = c_gst_rtcp_buffer_new;

/** */
alias gst_rtcp_buffer_new_copy_data = c_gst_rtcp_buffer_new_copy_data;

/** */
alias gst_rtcp_buffer_new_take_data = c_gst_rtcp_buffer_new_take_data;

/** */
alias gst_rtcp_buffer_validate = c_gst_rtcp_buffer_validate;

/** */
alias gst_rtcp_buffer_validate_data = c_gst_rtcp_buffer_validate_data;

/** */
alias gst_rtcp_buffer_validate_data_reduced = c_gst_rtcp_buffer_validate_data_reduced;

/** */
alias gst_rtcp_buffer_validate_reduced = c_gst_rtcp_buffer_validate_reduced;

// RTCPPacket

/** */
alias gst_rtcp_packet_add_profile_specific_ext = c_gst_rtcp_packet_add_profile_specific_ext;

/** */
alias gst_rtcp_packet_add_rb = c_gst_rtcp_packet_add_rb;

/** */
alias gst_rtcp_packet_app_get_data = c_gst_rtcp_packet_app_get_data;

/** */
alias gst_rtcp_packet_app_get_data_length = c_gst_rtcp_packet_app_get_data_length;

/** */
alias gst_rtcp_packet_app_get_name = c_gst_rtcp_packet_app_get_name;

/** */
alias gst_rtcp_packet_app_get_ssrc = c_gst_rtcp_packet_app_get_ssrc;

/** */
alias gst_rtcp_packet_app_get_subtype = c_gst_rtcp_packet_app_get_subtype;

/** */
alias gst_rtcp_packet_app_set_data_length = c_gst_rtcp_packet_app_set_data_length;

/** */
alias gst_rtcp_packet_app_set_name = c_gst_rtcp_packet_app_set_name;

/** */
alias gst_rtcp_packet_app_set_ssrc = c_gst_rtcp_packet_app_set_ssrc;

/** */
alias gst_rtcp_packet_app_set_subtype = c_gst_rtcp_packet_app_set_subtype;

/** */
alias gst_rtcp_packet_bye_add_ssrc = c_gst_rtcp_packet_bye_add_ssrc;

/** */
alias gst_rtcp_packet_bye_add_ssrcs = c_gst_rtcp_packet_bye_add_ssrcs;

/** */
alias gst_rtcp_packet_bye_get_nth_ssrc = c_gst_rtcp_packet_bye_get_nth_ssrc;

/** */
alias gst_rtcp_packet_bye_get_reason = c_gst_rtcp_packet_bye_get_reason;

/** */
alias gst_rtcp_packet_bye_get_reason_len = c_gst_rtcp_packet_bye_get_reason_len;

/** */
alias gst_rtcp_packet_bye_get_ssrc_count = c_gst_rtcp_packet_bye_get_ssrc_count;

/** */
alias gst_rtcp_packet_bye_set_reason = c_gst_rtcp_packet_bye_set_reason;

/** */
alias gst_rtcp_packet_copy_profile_specific_ext = c_gst_rtcp_packet_copy_profile_specific_ext;

/** */
alias gst_rtcp_packet_fb_get_fci = c_gst_rtcp_packet_fb_get_fci;

/** */
alias gst_rtcp_packet_fb_get_fci_length = c_gst_rtcp_packet_fb_get_fci_length;

/** */
alias gst_rtcp_packet_fb_get_media_ssrc = c_gst_rtcp_packet_fb_get_media_ssrc;

/** */
alias gst_rtcp_packet_fb_get_sender_ssrc = c_gst_rtcp_packet_fb_get_sender_ssrc;

/** */
alias gst_rtcp_packet_fb_get_type = c_gst_rtcp_packet_fb_get_type;

/** */
alias gst_rtcp_packet_fb_set_fci_length = c_gst_rtcp_packet_fb_set_fci_length;

/** */
alias gst_rtcp_packet_fb_set_media_ssrc = c_gst_rtcp_packet_fb_set_media_ssrc;

/** */
alias gst_rtcp_packet_fb_set_sender_ssrc = c_gst_rtcp_packet_fb_set_sender_ssrc;

/** */
alias gst_rtcp_packet_fb_set_type = c_gst_rtcp_packet_fb_set_type;

/** */
alias gst_rtcp_packet_get_count = c_gst_rtcp_packet_get_count;

/** */
alias gst_rtcp_packet_get_length = c_gst_rtcp_packet_get_length;

/** */
alias gst_rtcp_packet_get_padding = c_gst_rtcp_packet_get_padding;

/** */
alias gst_rtcp_packet_get_profile_specific_ext = c_gst_rtcp_packet_get_profile_specific_ext;

/** */
alias gst_rtcp_packet_get_profile_specific_ext_length = c_gst_rtcp_packet_get_profile_specific_ext_length;

/** */
alias gst_rtcp_packet_get_rb = c_gst_rtcp_packet_get_rb;

/** */
alias gst_rtcp_packet_get_rb_count = c_gst_rtcp_packet_get_rb_count;

/** */
alias gst_rtcp_packet_get_type = c_gst_rtcp_packet_get_type;

/** */
alias gst_rtcp_packet_move_to_next = c_gst_rtcp_packet_move_to_next;

/** */
alias gst_rtcp_packet_remove = c_gst_rtcp_packet_remove;

/** */
alias gst_rtcp_packet_rr_get_ssrc = c_gst_rtcp_packet_rr_get_ssrc;

/** */
alias gst_rtcp_packet_rr_set_ssrc = c_gst_rtcp_packet_rr_set_ssrc;

/** */
alias gst_rtcp_packet_sdes_add_entry = c_gst_rtcp_packet_sdes_add_entry;

/** */
alias gst_rtcp_packet_sdes_add_item = c_gst_rtcp_packet_sdes_add_item;

/** */
alias gst_rtcp_packet_sdes_copy_entry = c_gst_rtcp_packet_sdes_copy_entry;

/** */
alias gst_rtcp_packet_sdes_first_entry = c_gst_rtcp_packet_sdes_first_entry;

/** */
alias gst_rtcp_packet_sdes_first_item = c_gst_rtcp_packet_sdes_first_item;

/** */
alias gst_rtcp_packet_sdes_get_entry = c_gst_rtcp_packet_sdes_get_entry;

/** */
alias gst_rtcp_packet_sdes_get_item_count = c_gst_rtcp_packet_sdes_get_item_count;

/** */
alias gst_rtcp_packet_sdes_get_ssrc = c_gst_rtcp_packet_sdes_get_ssrc;

/** */
alias gst_rtcp_packet_sdes_next_entry = c_gst_rtcp_packet_sdes_next_entry;

/** */
alias gst_rtcp_packet_sdes_next_item = c_gst_rtcp_packet_sdes_next_item;

/** */
alias gst_rtcp_packet_set_rb = c_gst_rtcp_packet_set_rb;

/** */
alias gst_rtcp_packet_sr_get_sender_info = c_gst_rtcp_packet_sr_get_sender_info;

/** */
alias gst_rtcp_packet_sr_set_sender_info = c_gst_rtcp_packet_sr_set_sender_info;

/** */
alias gst_rtcp_packet_xr_first_rb = c_gst_rtcp_packet_xr_first_rb;

/** */
alias gst_rtcp_packet_xr_get_block_length = c_gst_rtcp_packet_xr_get_block_length;

/** */
alias gst_rtcp_packet_xr_get_block_type = c_gst_rtcp_packet_xr_get_block_type;

/** */
alias gst_rtcp_packet_xr_get_dlrr_block = c_gst_rtcp_packet_xr_get_dlrr_block;

/** */
alias gst_rtcp_packet_xr_get_prt_by_seq = c_gst_rtcp_packet_xr_get_prt_by_seq;

/** */
alias gst_rtcp_packet_xr_get_prt_info = c_gst_rtcp_packet_xr_get_prt_info;

/** */
alias gst_rtcp_packet_xr_get_rle_info = c_gst_rtcp_packet_xr_get_rle_info;

/** */
alias gst_rtcp_packet_xr_get_rle_nth_chunk = c_gst_rtcp_packet_xr_get_rle_nth_chunk;

/** */
alias gst_rtcp_packet_xr_get_rrt = c_gst_rtcp_packet_xr_get_rrt;

/** */
alias gst_rtcp_packet_xr_get_ssrc = c_gst_rtcp_packet_xr_get_ssrc;

/** */
alias gst_rtcp_packet_xr_get_summary_info = c_gst_rtcp_packet_xr_get_summary_info;

/** */
alias gst_rtcp_packet_xr_get_summary_jitter = c_gst_rtcp_packet_xr_get_summary_jitter;

/** */
alias gst_rtcp_packet_xr_get_summary_pkt = c_gst_rtcp_packet_xr_get_summary_pkt;

/** */
alias gst_rtcp_packet_xr_get_summary_ttl = c_gst_rtcp_packet_xr_get_summary_ttl;

/** */
alias gst_rtcp_packet_xr_get_voip_burst_metrics = c_gst_rtcp_packet_xr_get_voip_burst_metrics;

/** */
alias gst_rtcp_packet_xr_get_voip_configuration_params = c_gst_rtcp_packet_xr_get_voip_configuration_params;

/** */
alias gst_rtcp_packet_xr_get_voip_delay_metrics = c_gst_rtcp_packet_xr_get_voip_delay_metrics;

/** */
alias gst_rtcp_packet_xr_get_voip_jitter_buffer_params = c_gst_rtcp_packet_xr_get_voip_jitter_buffer_params;

/** */
alias gst_rtcp_packet_xr_get_voip_metrics_ssrc = c_gst_rtcp_packet_xr_get_voip_metrics_ssrc;

/** */
alias gst_rtcp_packet_xr_get_voip_packet_metrics = c_gst_rtcp_packet_xr_get_voip_packet_metrics;

/** */
alias gst_rtcp_packet_xr_get_voip_quality_metrics = c_gst_rtcp_packet_xr_get_voip_quality_metrics;

/** */
alias gst_rtcp_packet_xr_get_voip_signal_metrics = c_gst_rtcp_packet_xr_get_voip_signal_metrics;

/** */
alias gst_rtcp_packet_xr_next_rb = c_gst_rtcp_packet_xr_next_rb;

// RTPBaseAudioPayload

/** */
alias gst_rtp_base_audio_payload_get_type = c_gst_rtp_base_audio_payload_get_type;

/** */
alias gst_rtp_base_audio_payload_flush = c_gst_rtp_base_audio_payload_flush;

/** */
alias gst_rtp_base_audio_payload_get_adapter = c_gst_rtp_base_audio_payload_get_adapter;

/** */
alias gst_rtp_base_audio_payload_push = c_gst_rtp_base_audio_payload_push;

/** */
alias gst_rtp_base_audio_payload_set_frame_based = c_gst_rtp_base_audio_payload_set_frame_based;

/** */
alias gst_rtp_base_audio_payload_set_frame_options = c_gst_rtp_base_audio_payload_set_frame_options;

/** */
alias gst_rtp_base_audio_payload_set_sample_based = c_gst_rtp_base_audio_payload_set_sample_based;

/** */
alias gst_rtp_base_audio_payload_set_sample_options = c_gst_rtp_base_audio_payload_set_sample_options;

/** */
alias gst_rtp_base_audio_payload_set_samplebits_options = c_gst_rtp_base_audio_payload_set_samplebits_options;

// RTPBaseDepayload

/** */
alias gst_rtp_base_depayload_get_type = c_gst_rtp_base_depayload_get_type;

/** */
alias gst_rtp_base_depayload_delayed = c_gst_rtp_base_depayload_delayed;

/** */
alias gst_rtp_base_depayload_dropped = c_gst_rtp_base_depayload_dropped;

/** */
alias gst_rtp_base_depayload_flush = c_gst_rtp_base_depayload_flush;

/** */
alias gst_rtp_base_depayload_is_aggregate_hdrext_enabled = c_gst_rtp_base_depayload_is_aggregate_hdrext_enabled;

/** */
alias gst_rtp_base_depayload_is_source_info_enabled = c_gst_rtp_base_depayload_is_source_info_enabled;

/** */
alias gst_rtp_base_depayload_push = c_gst_rtp_base_depayload_push;

/** */
alias gst_rtp_base_depayload_push_list = c_gst_rtp_base_depayload_push_list;

/** */
alias gst_rtp_base_depayload_set_aggregate_hdrext_enabled = c_gst_rtp_base_depayload_set_aggregate_hdrext_enabled;

/** */
alias gst_rtp_base_depayload_set_source_info_enabled = c_gst_rtp_base_depayload_set_source_info_enabled;

// RTPBasePayload

/** */
alias gst_rtp_base_payload_get_type = c_gst_rtp_base_payload_get_type;

/** */
alias gst_rtp_base_payload_allocate_output_buffer = c_gst_rtp_base_payload_allocate_output_buffer;

/** */
alias gst_rtp_base_payload_get_source_count = c_gst_rtp_base_payload_get_source_count;

/** */
alias gst_rtp_base_payload_is_filled = c_gst_rtp_base_payload_is_filled;

/** */
alias gst_rtp_base_payload_is_source_info_enabled = c_gst_rtp_base_payload_is_source_info_enabled;

/** */
alias gst_rtp_base_payload_push = c_gst_rtp_base_payload_push;

/** */
alias gst_rtp_base_payload_push_list = c_gst_rtp_base_payload_push_list;

/** */
alias gst_rtp_base_payload_set_options = c_gst_rtp_base_payload_set_options;

/** */
alias gst_rtp_base_payload_set_outcaps = c_gst_rtp_base_payload_set_outcaps;

/** */
alias gst_rtp_base_payload_set_outcaps_structure = c_gst_rtp_base_payload_set_outcaps_structure;

/** */
alias gst_rtp_base_payload_set_source_info_enabled = c_gst_rtp_base_payload_set_source_info_enabled;

// RTPBuffer

/** */
alias gst_rtp_buffer_add_extension_onebyte_header = c_gst_rtp_buffer_add_extension_onebyte_header;

/** */
alias gst_rtp_buffer_add_extension_twobytes_header = c_gst_rtp_buffer_add_extension_twobytes_header;

/** */
alias gst_rtp_buffer_get_csrc = c_gst_rtp_buffer_get_csrc;

/** */
alias gst_rtp_buffer_get_csrc_count = c_gst_rtp_buffer_get_csrc_count;

/** */
alias gst_rtp_buffer_get_extension = c_gst_rtp_buffer_get_extension;

/** */
alias gst_rtp_buffer_get_extension_bytes = c_gst_rtp_buffer_get_extension_bytes;

/** */
alias gst_rtp_buffer_get_extension_data = c_gst_rtp_buffer_get_extension_data;

/** */
alias gst_rtp_buffer_get_extension_onebyte_header = c_gst_rtp_buffer_get_extension_onebyte_header;

/** */
alias gst_rtp_buffer_get_extension_twobytes_header = c_gst_rtp_buffer_get_extension_twobytes_header;

/** */
alias gst_rtp_buffer_get_header_len = c_gst_rtp_buffer_get_header_len;

/** */
alias gst_rtp_buffer_get_marker = c_gst_rtp_buffer_get_marker;

/** */
alias gst_rtp_buffer_get_packet_len = c_gst_rtp_buffer_get_packet_len;

/** */
alias gst_rtp_buffer_get_padding = c_gst_rtp_buffer_get_padding;

/** */
alias gst_rtp_buffer_get_payload = c_gst_rtp_buffer_get_payload;

/** */
alias gst_rtp_buffer_get_payload_buffer = c_gst_rtp_buffer_get_payload_buffer;

/** */
alias gst_rtp_buffer_get_payload_bytes = c_gst_rtp_buffer_get_payload_bytes;

/** */
alias gst_rtp_buffer_get_payload_len = c_gst_rtp_buffer_get_payload_len;

/** */
alias gst_rtp_buffer_get_payload_subbuffer = c_gst_rtp_buffer_get_payload_subbuffer;

/** */
alias gst_rtp_buffer_get_payload_type = c_gst_rtp_buffer_get_payload_type;

/** */
alias gst_rtp_buffer_get_seq = c_gst_rtp_buffer_get_seq;

/** */
alias gst_rtp_buffer_get_ssrc = c_gst_rtp_buffer_get_ssrc;

/** */
alias gst_rtp_buffer_get_timestamp = c_gst_rtp_buffer_get_timestamp;

/** */
alias gst_rtp_buffer_get_version = c_gst_rtp_buffer_get_version;

/** */
alias gst_rtp_buffer_pad_to = c_gst_rtp_buffer_pad_to;

/** */
alias gst_rtp_buffer_remove_extension_data = c_gst_rtp_buffer_remove_extension_data;

/** */
alias gst_rtp_buffer_set_csrc = c_gst_rtp_buffer_set_csrc;

/** */
alias gst_rtp_buffer_set_extension = c_gst_rtp_buffer_set_extension;

/** */
alias gst_rtp_buffer_set_extension_data = c_gst_rtp_buffer_set_extension_data;

/** */
alias gst_rtp_buffer_set_marker = c_gst_rtp_buffer_set_marker;

/** */
alias gst_rtp_buffer_set_packet_len = c_gst_rtp_buffer_set_packet_len;

/** */
alias gst_rtp_buffer_set_padding = c_gst_rtp_buffer_set_padding;

/** */
alias gst_rtp_buffer_set_payload_type = c_gst_rtp_buffer_set_payload_type;

/** */
alias gst_rtp_buffer_set_seq = c_gst_rtp_buffer_set_seq;

/** */
alias gst_rtp_buffer_set_ssrc = c_gst_rtp_buffer_set_ssrc;

/** */
alias gst_rtp_buffer_set_timestamp = c_gst_rtp_buffer_set_timestamp;

/** */
alias gst_rtp_buffer_set_version = c_gst_rtp_buffer_set_version;

/** */
alias gst_rtp_buffer_unmap = c_gst_rtp_buffer_unmap;

/** */
alias gst_rtp_buffer_allocate_data = c_gst_rtp_buffer_allocate_data;

/** */
alias gst_rtp_buffer_calc_header_len = c_gst_rtp_buffer_calc_header_len;

/** */
alias gst_rtp_buffer_calc_packet_len = c_gst_rtp_buffer_calc_packet_len;

/** */
alias gst_rtp_buffer_calc_payload_len = c_gst_rtp_buffer_calc_payload_len;

/** */
alias gst_rtp_buffer_compare_seqnum = c_gst_rtp_buffer_compare_seqnum;

/** */
alias gst_rtp_buffer_default_clock_rate = c_gst_rtp_buffer_default_clock_rate;

/** */
alias gst_rtp_buffer_ext_timestamp = c_gst_rtp_buffer_ext_timestamp;

/** */
alias gst_rtp_buffer_get_extension_onebyte_header_from_bytes = c_gst_rtp_buffer_get_extension_onebyte_header_from_bytes;

/** */
alias gst_rtp_buffer_map = c_gst_rtp_buffer_map;

/** */
alias gst_rtp_buffer_new_allocate = c_gst_rtp_buffer_new_allocate;

/** */
alias gst_rtp_buffer_new_allocate_len = c_gst_rtp_buffer_new_allocate_len;

/** */
alias gst_rtp_buffer_new_copy_data = c_gst_rtp_buffer_new_copy_data;

/** */
alias gst_rtp_buffer_new_take_data = c_gst_rtp_buffer_new_take_data;

// RTPHeaderExtension

/** */
alias gst_rtp_header_extension_get_type = c_gst_rtp_header_extension_get_type;

/** */
alias gst_rtp_header_extension_create_from_uri = c_gst_rtp_header_extension_create_from_uri;

/** */
alias gst_rtp_header_extension_get_direction = c_gst_rtp_header_extension_get_direction;

/** */
alias gst_rtp_header_extension_get_id = c_gst_rtp_header_extension_get_id;

/** */
alias gst_rtp_header_extension_get_max_size = c_gst_rtp_header_extension_get_max_size;

/** */
alias gst_rtp_header_extension_get_sdp_caps_field_name = c_gst_rtp_header_extension_get_sdp_caps_field_name;

/** */
alias gst_rtp_header_extension_get_supported_flags = c_gst_rtp_header_extension_get_supported_flags;

/** */
alias gst_rtp_header_extension_get_uri = c_gst_rtp_header_extension_get_uri;

/** */
alias gst_rtp_header_extension_read = c_gst_rtp_header_extension_read;

/** */
alias gst_rtp_header_extension_set_attributes_from_caps = c_gst_rtp_header_extension_set_attributes_from_caps;

/** */
alias gst_rtp_header_extension_set_caps_from_attributes = c_gst_rtp_header_extension_set_caps_from_attributes;

/** */
alias gst_rtp_header_extension_set_caps_from_attributes_helper = c_gst_rtp_header_extension_set_caps_from_attributes_helper;

/** */
alias gst_rtp_header_extension_set_direction = c_gst_rtp_header_extension_set_direction;

/** */
alias gst_rtp_header_extension_set_id = c_gst_rtp_header_extension_set_id;

/** */
alias gst_rtp_header_extension_set_non_rtp_sink_caps = c_gst_rtp_header_extension_set_non_rtp_sink_caps;

/** */
alias gst_rtp_header_extension_set_wants_update_non_rtp_src_caps = c_gst_rtp_header_extension_set_wants_update_non_rtp_src_caps;

/** */
alias gst_rtp_header_extension_update_non_rtp_src_caps = c_gst_rtp_header_extension_update_non_rtp_src_caps;

/** */
alias gst_rtp_header_extension_wants_update_non_rtp_src_caps = c_gst_rtp_header_extension_wants_update_non_rtp_src_caps;

/** */
alias gst_rtp_header_extension_write = c_gst_rtp_header_extension_write;

// RTPHeaderExtensionClass

/** */
alias gst_rtp_header_extension_class_set_uri = c_gst_rtp_header_extension_class_set_uri;

// RTPPayloadInfo

/** */
alias gst_rtp_payload_info_for_name = c_gst_rtp_payload_info_for_name;

/** */
alias gst_rtp_payload_info_for_pt = c_gst_rtp_payload_info_for_pt;

// RTPSourceMeta

/** */
alias gst_rtp_source_meta_append_csrc = c_gst_rtp_source_meta_append_csrc;

/** */
alias gst_rtp_source_meta_get_source_count = c_gst_rtp_source_meta_get_source_count;

/** */
alias gst_rtp_source_meta_set_ssrc = c_gst_rtp_source_meta_set_ssrc;

/** */
alias gst_rtp_source_meta_get_info = c_gst_rtp_source_meta_get_info;

// global

/** */
alias gst_buffer_add_rtp_source_meta = c_gst_buffer_add_rtp_source_meta;

/** */
alias gst_buffer_get_rtp_source_meta = c_gst_buffer_get_rtp_source_meta;

/** */
alias gst_rtcp_ntp_to_unix = c_gst_rtcp_ntp_to_unix;

/** */
alias gst_rtcp_sdes_name_to_type = c_gst_rtcp_sdes_name_to_type;

/** */
alias gst_rtcp_sdes_type_to_name = c_gst_rtcp_sdes_type_to_name;

/** */
alias gst_rtcp_unix_to_ntp = c_gst_rtcp_unix_to_ntp;

/** */
alias gst_rtp_get_header_extension_list = c_gst_rtp_get_header_extension_list;

/** */
alias gst_rtp_hdrext_get_ntp_56 = c_gst_rtp_hdrext_get_ntp_56;

/** */
alias gst_rtp_hdrext_get_ntp_64 = c_gst_rtp_hdrext_get_ntp_64;

/** */
alias gst_rtp_hdrext_set_ntp_56 = c_gst_rtp_hdrext_set_ntp_56;

/** */
alias gst_rtp_hdrext_set_ntp_64 = c_gst_rtp_hdrext_set_ntp_64;

/** */
alias gst_rtp_source_meta_api_get_type = c_gst_rtp_source_meta_api_get_type;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // RTCPBuffer
  gidLink(cast(void**)&gst_rtcp_buffer_add_packet, "gst_rtcp_buffer_add_packet", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_get_first_packet, "gst_rtcp_buffer_get_first_packet", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_get_packet_count, "gst_rtcp_buffer_get_packet_count", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_unmap, "gst_rtcp_buffer_unmap", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_map, "gst_rtcp_buffer_map", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_new, "gst_rtcp_buffer_new", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_new_copy_data, "gst_rtcp_buffer_new_copy_data", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_new_take_data, "gst_rtcp_buffer_new_take_data", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_validate, "gst_rtcp_buffer_validate", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_validate_data, "gst_rtcp_buffer_validate_data", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_validate_data_reduced, "gst_rtcp_buffer_validate_data_reduced", libs);
  gidLink(cast(void**)&gst_rtcp_buffer_validate_reduced, "gst_rtcp_buffer_validate_reduced", libs);

  // RTCPPacket
  gidLink(cast(void**)&gst_rtcp_packet_add_profile_specific_ext, "gst_rtcp_packet_add_profile_specific_ext", libs);
  gidLink(cast(void**)&gst_rtcp_packet_add_rb, "gst_rtcp_packet_add_rb", libs);
  gidLink(cast(void**)&gst_rtcp_packet_app_get_data, "gst_rtcp_packet_app_get_data", libs);
  gidLink(cast(void**)&gst_rtcp_packet_app_get_data_length, "gst_rtcp_packet_app_get_data_length", libs);
  gidLink(cast(void**)&gst_rtcp_packet_app_get_name, "gst_rtcp_packet_app_get_name", libs);
  gidLink(cast(void**)&gst_rtcp_packet_app_get_ssrc, "gst_rtcp_packet_app_get_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_app_get_subtype, "gst_rtcp_packet_app_get_subtype", libs);
  gidLink(cast(void**)&gst_rtcp_packet_app_set_data_length, "gst_rtcp_packet_app_set_data_length", libs);
  gidLink(cast(void**)&gst_rtcp_packet_app_set_name, "gst_rtcp_packet_app_set_name", libs);
  gidLink(cast(void**)&gst_rtcp_packet_app_set_ssrc, "gst_rtcp_packet_app_set_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_app_set_subtype, "gst_rtcp_packet_app_set_subtype", libs);
  gidLink(cast(void**)&gst_rtcp_packet_bye_add_ssrc, "gst_rtcp_packet_bye_add_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_bye_add_ssrcs, "gst_rtcp_packet_bye_add_ssrcs", libs);
  gidLink(cast(void**)&gst_rtcp_packet_bye_get_nth_ssrc, "gst_rtcp_packet_bye_get_nth_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_bye_get_reason, "gst_rtcp_packet_bye_get_reason", libs);
  gidLink(cast(void**)&gst_rtcp_packet_bye_get_reason_len, "gst_rtcp_packet_bye_get_reason_len", libs);
  gidLink(cast(void**)&gst_rtcp_packet_bye_get_ssrc_count, "gst_rtcp_packet_bye_get_ssrc_count", libs);
  gidLink(cast(void**)&gst_rtcp_packet_bye_set_reason, "gst_rtcp_packet_bye_set_reason", libs);
  gidLink(cast(void**)&gst_rtcp_packet_copy_profile_specific_ext, "gst_rtcp_packet_copy_profile_specific_ext", libs);
  gidLink(cast(void**)&gst_rtcp_packet_fb_get_fci, "gst_rtcp_packet_fb_get_fci", libs);
  gidLink(cast(void**)&gst_rtcp_packet_fb_get_fci_length, "gst_rtcp_packet_fb_get_fci_length", libs);
  gidLink(cast(void**)&gst_rtcp_packet_fb_get_media_ssrc, "gst_rtcp_packet_fb_get_media_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_fb_get_sender_ssrc, "gst_rtcp_packet_fb_get_sender_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_fb_get_type, "gst_rtcp_packet_fb_get_type", libs);
  gidLink(cast(void**)&gst_rtcp_packet_fb_set_fci_length, "gst_rtcp_packet_fb_set_fci_length", libs);
  gidLink(cast(void**)&gst_rtcp_packet_fb_set_media_ssrc, "gst_rtcp_packet_fb_set_media_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_fb_set_sender_ssrc, "gst_rtcp_packet_fb_set_sender_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_fb_set_type, "gst_rtcp_packet_fb_set_type", libs);
  gidLink(cast(void**)&gst_rtcp_packet_get_count, "gst_rtcp_packet_get_count", libs);
  gidLink(cast(void**)&gst_rtcp_packet_get_length, "gst_rtcp_packet_get_length", libs);
  gidLink(cast(void**)&gst_rtcp_packet_get_padding, "gst_rtcp_packet_get_padding", libs);
  gidLink(cast(void**)&gst_rtcp_packet_get_profile_specific_ext, "gst_rtcp_packet_get_profile_specific_ext", libs);
  gidLink(cast(void**)&gst_rtcp_packet_get_profile_specific_ext_length, "gst_rtcp_packet_get_profile_specific_ext_length", libs);
  gidLink(cast(void**)&gst_rtcp_packet_get_rb, "gst_rtcp_packet_get_rb", libs);
  gidLink(cast(void**)&gst_rtcp_packet_get_rb_count, "gst_rtcp_packet_get_rb_count", libs);
  gidLink(cast(void**)&gst_rtcp_packet_get_type, "gst_rtcp_packet_get_type", libs);
  gidLink(cast(void**)&gst_rtcp_packet_move_to_next, "gst_rtcp_packet_move_to_next", libs);
  gidLink(cast(void**)&gst_rtcp_packet_remove, "gst_rtcp_packet_remove", libs);
  gidLink(cast(void**)&gst_rtcp_packet_rr_get_ssrc, "gst_rtcp_packet_rr_get_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_rr_set_ssrc, "gst_rtcp_packet_rr_set_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sdes_add_entry, "gst_rtcp_packet_sdes_add_entry", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sdes_add_item, "gst_rtcp_packet_sdes_add_item", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sdes_copy_entry, "gst_rtcp_packet_sdes_copy_entry", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sdes_first_entry, "gst_rtcp_packet_sdes_first_entry", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sdes_first_item, "gst_rtcp_packet_sdes_first_item", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sdes_get_entry, "gst_rtcp_packet_sdes_get_entry", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sdes_get_item_count, "gst_rtcp_packet_sdes_get_item_count", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sdes_get_ssrc, "gst_rtcp_packet_sdes_get_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sdes_next_entry, "gst_rtcp_packet_sdes_next_entry", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sdes_next_item, "gst_rtcp_packet_sdes_next_item", libs);
  gidLink(cast(void**)&gst_rtcp_packet_set_rb, "gst_rtcp_packet_set_rb", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sr_get_sender_info, "gst_rtcp_packet_sr_get_sender_info", libs);
  gidLink(cast(void**)&gst_rtcp_packet_sr_set_sender_info, "gst_rtcp_packet_sr_set_sender_info", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_first_rb, "gst_rtcp_packet_xr_first_rb", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_block_length, "gst_rtcp_packet_xr_get_block_length", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_block_type, "gst_rtcp_packet_xr_get_block_type", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_dlrr_block, "gst_rtcp_packet_xr_get_dlrr_block", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_prt_by_seq, "gst_rtcp_packet_xr_get_prt_by_seq", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_prt_info, "gst_rtcp_packet_xr_get_prt_info", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_rle_info, "gst_rtcp_packet_xr_get_rle_info", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_rle_nth_chunk, "gst_rtcp_packet_xr_get_rle_nth_chunk", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_rrt, "gst_rtcp_packet_xr_get_rrt", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_ssrc, "gst_rtcp_packet_xr_get_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_summary_info, "gst_rtcp_packet_xr_get_summary_info", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_summary_jitter, "gst_rtcp_packet_xr_get_summary_jitter", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_summary_pkt, "gst_rtcp_packet_xr_get_summary_pkt", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_summary_ttl, "gst_rtcp_packet_xr_get_summary_ttl", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_voip_burst_metrics, "gst_rtcp_packet_xr_get_voip_burst_metrics", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_voip_configuration_params, "gst_rtcp_packet_xr_get_voip_configuration_params", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_voip_delay_metrics, "gst_rtcp_packet_xr_get_voip_delay_metrics", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_voip_jitter_buffer_params, "gst_rtcp_packet_xr_get_voip_jitter_buffer_params", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_voip_metrics_ssrc, "gst_rtcp_packet_xr_get_voip_metrics_ssrc", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_voip_packet_metrics, "gst_rtcp_packet_xr_get_voip_packet_metrics", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_voip_quality_metrics, "gst_rtcp_packet_xr_get_voip_quality_metrics", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_get_voip_signal_metrics, "gst_rtcp_packet_xr_get_voip_signal_metrics", libs);
  gidLink(cast(void**)&gst_rtcp_packet_xr_next_rb, "gst_rtcp_packet_xr_next_rb", libs);

  // RTPBaseAudioPayload
  gidLink(cast(void**)&gst_rtp_base_audio_payload_get_type, "gst_rtp_base_audio_payload_get_type", libs);
  gidLink(cast(void**)&gst_rtp_base_audio_payload_flush, "gst_rtp_base_audio_payload_flush", libs);
  gidLink(cast(void**)&gst_rtp_base_audio_payload_get_adapter, "gst_rtp_base_audio_payload_get_adapter", libs);
  gidLink(cast(void**)&gst_rtp_base_audio_payload_push, "gst_rtp_base_audio_payload_push", libs);
  gidLink(cast(void**)&gst_rtp_base_audio_payload_set_frame_based, "gst_rtp_base_audio_payload_set_frame_based", libs);
  gidLink(cast(void**)&gst_rtp_base_audio_payload_set_frame_options, "gst_rtp_base_audio_payload_set_frame_options", libs);
  gidLink(cast(void**)&gst_rtp_base_audio_payload_set_sample_based, "gst_rtp_base_audio_payload_set_sample_based", libs);
  gidLink(cast(void**)&gst_rtp_base_audio_payload_set_sample_options, "gst_rtp_base_audio_payload_set_sample_options", libs);
  gidLink(cast(void**)&gst_rtp_base_audio_payload_set_samplebits_options, "gst_rtp_base_audio_payload_set_samplebits_options", libs);

  // RTPBaseDepayload
  gidLink(cast(void**)&gst_rtp_base_depayload_get_type, "gst_rtp_base_depayload_get_type", libs);
  gidLink(cast(void**)&gst_rtp_base_depayload_delayed, "gst_rtp_base_depayload_delayed", libs);
  gidLink(cast(void**)&gst_rtp_base_depayload_dropped, "gst_rtp_base_depayload_dropped", libs);
  gidLink(cast(void**)&gst_rtp_base_depayload_flush, "gst_rtp_base_depayload_flush", libs);
  gidLink(cast(void**)&gst_rtp_base_depayload_is_aggregate_hdrext_enabled, "gst_rtp_base_depayload_is_aggregate_hdrext_enabled", libs);
  gidLink(cast(void**)&gst_rtp_base_depayload_is_source_info_enabled, "gst_rtp_base_depayload_is_source_info_enabled", libs);
  gidLink(cast(void**)&gst_rtp_base_depayload_push, "gst_rtp_base_depayload_push", libs);
  gidLink(cast(void**)&gst_rtp_base_depayload_push_list, "gst_rtp_base_depayload_push_list", libs);
  gidLink(cast(void**)&gst_rtp_base_depayload_set_aggregate_hdrext_enabled, "gst_rtp_base_depayload_set_aggregate_hdrext_enabled", libs);
  gidLink(cast(void**)&gst_rtp_base_depayload_set_source_info_enabled, "gst_rtp_base_depayload_set_source_info_enabled", libs);

  // RTPBasePayload
  gidLink(cast(void**)&gst_rtp_base_payload_get_type, "gst_rtp_base_payload_get_type", libs);
  gidLink(cast(void**)&gst_rtp_base_payload_allocate_output_buffer, "gst_rtp_base_payload_allocate_output_buffer", libs);
  gidLink(cast(void**)&gst_rtp_base_payload_get_source_count, "gst_rtp_base_payload_get_source_count", libs);
  gidLink(cast(void**)&gst_rtp_base_payload_is_filled, "gst_rtp_base_payload_is_filled", libs);
  gidLink(cast(void**)&gst_rtp_base_payload_is_source_info_enabled, "gst_rtp_base_payload_is_source_info_enabled", libs);
  gidLink(cast(void**)&gst_rtp_base_payload_push, "gst_rtp_base_payload_push", libs);
  gidLink(cast(void**)&gst_rtp_base_payload_push_list, "gst_rtp_base_payload_push_list", libs);
  gidLink(cast(void**)&gst_rtp_base_payload_set_options, "gst_rtp_base_payload_set_options", libs);
  gidLink(cast(void**)&gst_rtp_base_payload_set_outcaps, "gst_rtp_base_payload_set_outcaps", libs);
  gidLink(cast(void**)&gst_rtp_base_payload_set_outcaps_structure, "gst_rtp_base_payload_set_outcaps_structure", libs);
  gidLink(cast(void**)&gst_rtp_base_payload_set_source_info_enabled, "gst_rtp_base_payload_set_source_info_enabled", libs);

  // RTPBuffer
  gidLink(cast(void**)&gst_rtp_buffer_add_extension_onebyte_header, "gst_rtp_buffer_add_extension_onebyte_header", libs);
  gidLink(cast(void**)&gst_rtp_buffer_add_extension_twobytes_header, "gst_rtp_buffer_add_extension_twobytes_header", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_csrc, "gst_rtp_buffer_get_csrc", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_csrc_count, "gst_rtp_buffer_get_csrc_count", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_extension, "gst_rtp_buffer_get_extension", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_extension_bytes, "gst_rtp_buffer_get_extension_bytes", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_extension_data, "gst_rtp_buffer_get_extension_data", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_extension_onebyte_header, "gst_rtp_buffer_get_extension_onebyte_header", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_extension_twobytes_header, "gst_rtp_buffer_get_extension_twobytes_header", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_header_len, "gst_rtp_buffer_get_header_len", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_marker, "gst_rtp_buffer_get_marker", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_packet_len, "gst_rtp_buffer_get_packet_len", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_padding, "gst_rtp_buffer_get_padding", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_payload, "gst_rtp_buffer_get_payload", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_payload_buffer, "gst_rtp_buffer_get_payload_buffer", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_payload_bytes, "gst_rtp_buffer_get_payload_bytes", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_payload_len, "gst_rtp_buffer_get_payload_len", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_payload_subbuffer, "gst_rtp_buffer_get_payload_subbuffer", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_payload_type, "gst_rtp_buffer_get_payload_type", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_seq, "gst_rtp_buffer_get_seq", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_ssrc, "gst_rtp_buffer_get_ssrc", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_timestamp, "gst_rtp_buffer_get_timestamp", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_version, "gst_rtp_buffer_get_version", libs);
  gidLink(cast(void**)&gst_rtp_buffer_pad_to, "gst_rtp_buffer_pad_to", libs);
  gidLink(cast(void**)&gst_rtp_buffer_remove_extension_data, "gst_rtp_buffer_remove_extension_data", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_csrc, "gst_rtp_buffer_set_csrc", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_extension, "gst_rtp_buffer_set_extension", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_extension_data, "gst_rtp_buffer_set_extension_data", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_marker, "gst_rtp_buffer_set_marker", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_packet_len, "gst_rtp_buffer_set_packet_len", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_padding, "gst_rtp_buffer_set_padding", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_payload_type, "gst_rtp_buffer_set_payload_type", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_seq, "gst_rtp_buffer_set_seq", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_ssrc, "gst_rtp_buffer_set_ssrc", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_timestamp, "gst_rtp_buffer_set_timestamp", libs);
  gidLink(cast(void**)&gst_rtp_buffer_set_version, "gst_rtp_buffer_set_version", libs);
  gidLink(cast(void**)&gst_rtp_buffer_unmap, "gst_rtp_buffer_unmap", libs);
  gidLink(cast(void**)&gst_rtp_buffer_allocate_data, "gst_rtp_buffer_allocate_data", libs);
  gidLink(cast(void**)&gst_rtp_buffer_calc_header_len, "gst_rtp_buffer_calc_header_len", libs);
  gidLink(cast(void**)&gst_rtp_buffer_calc_packet_len, "gst_rtp_buffer_calc_packet_len", libs);
  gidLink(cast(void**)&gst_rtp_buffer_calc_payload_len, "gst_rtp_buffer_calc_payload_len", libs);
  gidLink(cast(void**)&gst_rtp_buffer_compare_seqnum, "gst_rtp_buffer_compare_seqnum", libs);
  gidLink(cast(void**)&gst_rtp_buffer_default_clock_rate, "gst_rtp_buffer_default_clock_rate", libs);
  gidLink(cast(void**)&gst_rtp_buffer_ext_timestamp, "gst_rtp_buffer_ext_timestamp", libs);
  gidLink(cast(void**)&gst_rtp_buffer_get_extension_onebyte_header_from_bytes, "gst_rtp_buffer_get_extension_onebyte_header_from_bytes", libs);
  gidLink(cast(void**)&gst_rtp_buffer_map, "gst_rtp_buffer_map", libs);
  gidLink(cast(void**)&gst_rtp_buffer_new_allocate, "gst_rtp_buffer_new_allocate", libs);
  gidLink(cast(void**)&gst_rtp_buffer_new_allocate_len, "gst_rtp_buffer_new_allocate_len", libs);
  gidLink(cast(void**)&gst_rtp_buffer_new_copy_data, "gst_rtp_buffer_new_copy_data", libs);
  gidLink(cast(void**)&gst_rtp_buffer_new_take_data, "gst_rtp_buffer_new_take_data", libs);

  // RTPHeaderExtension
  gidLink(cast(void**)&gst_rtp_header_extension_get_type, "gst_rtp_header_extension_get_type", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_create_from_uri, "gst_rtp_header_extension_create_from_uri", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_get_direction, "gst_rtp_header_extension_get_direction", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_get_id, "gst_rtp_header_extension_get_id", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_get_max_size, "gst_rtp_header_extension_get_max_size", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_get_sdp_caps_field_name, "gst_rtp_header_extension_get_sdp_caps_field_name", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_get_supported_flags, "gst_rtp_header_extension_get_supported_flags", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_get_uri, "gst_rtp_header_extension_get_uri", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_read, "gst_rtp_header_extension_read", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_set_attributes_from_caps, "gst_rtp_header_extension_set_attributes_from_caps", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_set_caps_from_attributes, "gst_rtp_header_extension_set_caps_from_attributes", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_set_caps_from_attributes_helper, "gst_rtp_header_extension_set_caps_from_attributes_helper", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_set_direction, "gst_rtp_header_extension_set_direction", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_set_id, "gst_rtp_header_extension_set_id", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_set_non_rtp_sink_caps, "gst_rtp_header_extension_set_non_rtp_sink_caps", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_set_wants_update_non_rtp_src_caps, "gst_rtp_header_extension_set_wants_update_non_rtp_src_caps", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_update_non_rtp_src_caps, "gst_rtp_header_extension_update_non_rtp_src_caps", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_wants_update_non_rtp_src_caps, "gst_rtp_header_extension_wants_update_non_rtp_src_caps", libs);
  gidLink(cast(void**)&gst_rtp_header_extension_write, "gst_rtp_header_extension_write", libs);

  // RTPHeaderExtensionClass
  gidLink(cast(void**)&gst_rtp_header_extension_class_set_uri, "gst_rtp_header_extension_class_set_uri", libs);

  // RTPPayloadInfo
  gidLink(cast(void**)&gst_rtp_payload_info_for_name, "gst_rtp_payload_info_for_name", libs);
  gidLink(cast(void**)&gst_rtp_payload_info_for_pt, "gst_rtp_payload_info_for_pt", libs);

  // RTPSourceMeta
  gidLink(cast(void**)&gst_rtp_source_meta_append_csrc, "gst_rtp_source_meta_append_csrc", libs);
  gidLink(cast(void**)&gst_rtp_source_meta_get_source_count, "gst_rtp_source_meta_get_source_count", libs);
  gidLink(cast(void**)&gst_rtp_source_meta_set_ssrc, "gst_rtp_source_meta_set_ssrc", libs);
  gidLink(cast(void**)&gst_rtp_source_meta_get_info, "gst_rtp_source_meta_get_info", libs);

  // global
  gidLink(cast(void**)&gst_buffer_add_rtp_source_meta, "gst_buffer_add_rtp_source_meta", libs);
  gidLink(cast(void**)&gst_buffer_get_rtp_source_meta, "gst_buffer_get_rtp_source_meta", libs);
  gidLink(cast(void**)&gst_rtcp_ntp_to_unix, "gst_rtcp_ntp_to_unix", libs);
  gidLink(cast(void**)&gst_rtcp_sdes_name_to_type, "gst_rtcp_sdes_name_to_type", libs);
  gidLink(cast(void**)&gst_rtcp_sdes_type_to_name, "gst_rtcp_sdes_type_to_name", libs);
  gidLink(cast(void**)&gst_rtcp_unix_to_ntp, "gst_rtcp_unix_to_ntp", libs);
  gidLink(cast(void**)&gst_rtp_get_header_extension_list, "gst_rtp_get_header_extension_list", libs);
  gidLink(cast(void**)&gst_rtp_hdrext_get_ntp_56, "gst_rtp_hdrext_get_ntp_56", libs);
  gidLink(cast(void**)&gst_rtp_hdrext_get_ntp_64, "gst_rtp_hdrext_get_ntp_64", libs);
  gidLink(cast(void**)&gst_rtp_hdrext_set_ntp_56, "gst_rtp_hdrext_set_ntp_56", libs);
  gidLink(cast(void**)&gst_rtp_hdrext_set_ntp_64, "gst_rtp_hdrext_set_ntp_64", libs);
  gidLink(cast(void**)&gst_rtp_source_meta_api_get_type, "gst_rtp_source_meta_api_get_type", libs);
}
