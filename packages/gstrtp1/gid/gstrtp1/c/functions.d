/// C functions for gstrtp1 library
module gid.gstrtp1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstrtp1.c.types;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;

private immutable LIBS = ["gstrtp-1.0_0"];

// RTCPBuffer
private alias c_gst_rtcp_buffer_add_packetFn = extern(C) gboolean function(GstRTCPBuffer* rtcp, GstRTCPType type, GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_buffer_add_packetFn c_gst_rtcp_buffer_add_packet; ///
private alias c_gst_rtcp_buffer_get_first_packetFn = extern(C) gboolean function(GstRTCPBuffer* rtcp, GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_buffer_get_first_packetFn c_gst_rtcp_buffer_get_first_packet; ///
private alias c_gst_rtcp_buffer_get_packet_countFn = extern(C) uint function(GstRTCPBuffer* rtcp) nothrow;
__gshared c_gst_rtcp_buffer_get_packet_countFn c_gst_rtcp_buffer_get_packet_count; ///
private alias c_gst_rtcp_buffer_unmapFn = extern(C) gboolean function(GstRTCPBuffer* rtcp) nothrow;
__gshared c_gst_rtcp_buffer_unmapFn c_gst_rtcp_buffer_unmap; ///
private alias c_gst_rtcp_buffer_mapFn = extern(C) gboolean function(GstBuffer* buffer, GstMapFlags flags, GstRTCPBuffer* rtcp) nothrow;
__gshared c_gst_rtcp_buffer_mapFn c_gst_rtcp_buffer_map; ///
private alias c_gst_rtcp_buffer_newFn = extern(C) GstBuffer* function(uint mtu) nothrow;
__gshared c_gst_rtcp_buffer_newFn c_gst_rtcp_buffer_new; ///
private alias c_gst_rtcp_buffer_new_copy_dataFn = extern(C) GstBuffer* function(const(void)* data, uint len) nothrow;
__gshared c_gst_rtcp_buffer_new_copy_dataFn c_gst_rtcp_buffer_new_copy_data; ///
private alias c_gst_rtcp_buffer_new_take_dataFn = extern(C) GstBuffer* function(void* data, uint len) nothrow;
__gshared c_gst_rtcp_buffer_new_take_dataFn c_gst_rtcp_buffer_new_take_data; ///
private alias c_gst_rtcp_buffer_validateFn = extern(C) gboolean function(GstBuffer* buffer) nothrow;
__gshared c_gst_rtcp_buffer_validateFn c_gst_rtcp_buffer_validate; ///
private alias c_gst_rtcp_buffer_validate_dataFn = extern(C) gboolean function(ubyte* data, uint len) nothrow;
__gshared c_gst_rtcp_buffer_validate_dataFn c_gst_rtcp_buffer_validate_data; ///
private alias c_gst_rtcp_buffer_validate_data_reducedFn = extern(C) gboolean function(ubyte* data, uint len) nothrow;
__gshared c_gst_rtcp_buffer_validate_data_reducedFn c_gst_rtcp_buffer_validate_data_reduced; ///
private alias c_gst_rtcp_buffer_validate_reducedFn = extern(C) gboolean function(GstBuffer* buffer) nothrow;
__gshared c_gst_rtcp_buffer_validate_reducedFn c_gst_rtcp_buffer_validate_reduced; ///

// RTCPPacket
private alias c_gst_rtcp_packet_add_profile_specific_extFn = extern(C) gboolean function(GstRTCPPacket* packet, const(ubyte)* data, uint len) nothrow;
__gshared c_gst_rtcp_packet_add_profile_specific_extFn c_gst_rtcp_packet_add_profile_specific_ext; ///
private alias c_gst_rtcp_packet_add_rbFn = extern(C) gboolean function(GstRTCPPacket* packet, uint ssrc, ubyte fractionlost, int packetslost, uint exthighestseq, uint jitter, uint lsr, uint dlsr) nothrow;
__gshared c_gst_rtcp_packet_add_rbFn c_gst_rtcp_packet_add_rb; ///
private alias c_gst_rtcp_packet_app_get_dataFn = extern(C) ubyte* function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_app_get_dataFn c_gst_rtcp_packet_app_get_data; ///
private alias c_gst_rtcp_packet_app_get_data_lengthFn = extern(C) ushort function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_app_get_data_lengthFn c_gst_rtcp_packet_app_get_data_length; ///
private alias c_gst_rtcp_packet_app_get_nameFn = extern(C) const(char)* function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_app_get_nameFn c_gst_rtcp_packet_app_get_name; ///
private alias c_gst_rtcp_packet_app_get_ssrcFn = extern(C) uint function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_app_get_ssrcFn c_gst_rtcp_packet_app_get_ssrc; ///
private alias c_gst_rtcp_packet_app_get_subtypeFn = extern(C) ubyte function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_app_get_subtypeFn c_gst_rtcp_packet_app_get_subtype; ///
private alias c_gst_rtcp_packet_app_set_data_lengthFn = extern(C) gboolean function(GstRTCPPacket* packet, ushort wordlen) nothrow;
__gshared c_gst_rtcp_packet_app_set_data_lengthFn c_gst_rtcp_packet_app_set_data_length; ///
private alias c_gst_rtcp_packet_app_set_nameFn = extern(C) void function(GstRTCPPacket* packet, const(char)* name) nothrow;
__gshared c_gst_rtcp_packet_app_set_nameFn c_gst_rtcp_packet_app_set_name; ///
private alias c_gst_rtcp_packet_app_set_ssrcFn = extern(C) void function(GstRTCPPacket* packet, uint ssrc) nothrow;
__gshared c_gst_rtcp_packet_app_set_ssrcFn c_gst_rtcp_packet_app_set_ssrc; ///
private alias c_gst_rtcp_packet_app_set_subtypeFn = extern(C) void function(GstRTCPPacket* packet, ubyte subtype) nothrow;
__gshared c_gst_rtcp_packet_app_set_subtypeFn c_gst_rtcp_packet_app_set_subtype; ///
private alias c_gst_rtcp_packet_bye_add_ssrcFn = extern(C) gboolean function(GstRTCPPacket* packet, uint ssrc) nothrow;
__gshared c_gst_rtcp_packet_bye_add_ssrcFn c_gst_rtcp_packet_bye_add_ssrc; ///
private alias c_gst_rtcp_packet_bye_add_ssrcsFn = extern(C) gboolean function(GstRTCPPacket* packet, uint* ssrc, uint len) nothrow;
__gshared c_gst_rtcp_packet_bye_add_ssrcsFn c_gst_rtcp_packet_bye_add_ssrcs; ///
private alias c_gst_rtcp_packet_bye_get_nth_ssrcFn = extern(C) uint function(GstRTCPPacket* packet, uint nth) nothrow;
__gshared c_gst_rtcp_packet_bye_get_nth_ssrcFn c_gst_rtcp_packet_bye_get_nth_ssrc; ///
private alias c_gst_rtcp_packet_bye_get_reasonFn = extern(C) char* function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_bye_get_reasonFn c_gst_rtcp_packet_bye_get_reason; ///
private alias c_gst_rtcp_packet_bye_get_reason_lenFn = extern(C) ubyte function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_bye_get_reason_lenFn c_gst_rtcp_packet_bye_get_reason_len; ///
private alias c_gst_rtcp_packet_bye_get_ssrc_countFn = extern(C) uint function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_bye_get_ssrc_countFn c_gst_rtcp_packet_bye_get_ssrc_count; ///
private alias c_gst_rtcp_packet_bye_set_reasonFn = extern(C) gboolean function(GstRTCPPacket* packet, const(char)* reason) nothrow;
__gshared c_gst_rtcp_packet_bye_set_reasonFn c_gst_rtcp_packet_bye_set_reason; ///
private alias c_gst_rtcp_packet_copy_profile_specific_extFn = extern(C) gboolean function(GstRTCPPacket* packet, ubyte** data, uint* len) nothrow;
__gshared c_gst_rtcp_packet_copy_profile_specific_extFn c_gst_rtcp_packet_copy_profile_specific_ext; ///
private alias c_gst_rtcp_packet_fb_get_fciFn = extern(C) ubyte* function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_fb_get_fciFn c_gst_rtcp_packet_fb_get_fci; ///
private alias c_gst_rtcp_packet_fb_get_fci_lengthFn = extern(C) ushort function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_fb_get_fci_lengthFn c_gst_rtcp_packet_fb_get_fci_length; ///
private alias c_gst_rtcp_packet_fb_get_media_ssrcFn = extern(C) uint function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_fb_get_media_ssrcFn c_gst_rtcp_packet_fb_get_media_ssrc; ///
private alias c_gst_rtcp_packet_fb_get_sender_ssrcFn = extern(C) uint function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_fb_get_sender_ssrcFn c_gst_rtcp_packet_fb_get_sender_ssrc; ///
private alias c_gst_rtcp_packet_fb_get_typeFn = extern(C) GstRTCPFBType function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_fb_get_typeFn c_gst_rtcp_packet_fb_get_type; ///
private alias c_gst_rtcp_packet_fb_set_fci_lengthFn = extern(C) gboolean function(GstRTCPPacket* packet, ushort wordlen) nothrow;
__gshared c_gst_rtcp_packet_fb_set_fci_lengthFn c_gst_rtcp_packet_fb_set_fci_length; ///
private alias c_gst_rtcp_packet_fb_set_media_ssrcFn = extern(C) void function(GstRTCPPacket* packet, uint ssrc) nothrow;
__gshared c_gst_rtcp_packet_fb_set_media_ssrcFn c_gst_rtcp_packet_fb_set_media_ssrc; ///
private alias c_gst_rtcp_packet_fb_set_sender_ssrcFn = extern(C) void function(GstRTCPPacket* packet, uint ssrc) nothrow;
__gshared c_gst_rtcp_packet_fb_set_sender_ssrcFn c_gst_rtcp_packet_fb_set_sender_ssrc; ///
private alias c_gst_rtcp_packet_fb_set_typeFn = extern(C) void function(GstRTCPPacket* packet, GstRTCPFBType type) nothrow;
__gshared c_gst_rtcp_packet_fb_set_typeFn c_gst_rtcp_packet_fb_set_type; ///
private alias c_gst_rtcp_packet_get_countFn = extern(C) ubyte function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_get_countFn c_gst_rtcp_packet_get_count; ///
private alias c_gst_rtcp_packet_get_lengthFn = extern(C) ushort function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_get_lengthFn c_gst_rtcp_packet_get_length; ///
private alias c_gst_rtcp_packet_get_paddingFn = extern(C) gboolean function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_get_paddingFn c_gst_rtcp_packet_get_padding; ///
private alias c_gst_rtcp_packet_get_profile_specific_extFn = extern(C) gboolean function(GstRTCPPacket* packet, ubyte** data, uint* len) nothrow;
__gshared c_gst_rtcp_packet_get_profile_specific_extFn c_gst_rtcp_packet_get_profile_specific_ext; ///
private alias c_gst_rtcp_packet_get_profile_specific_ext_lengthFn = extern(C) ushort function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_get_profile_specific_ext_lengthFn c_gst_rtcp_packet_get_profile_specific_ext_length; ///
private alias c_gst_rtcp_packet_get_rbFn = extern(C) void function(GstRTCPPacket* packet, uint nth, uint* ssrc, ubyte* fractionlost, int* packetslost, uint* exthighestseq, uint* jitter, uint* lsr, uint* dlsr) nothrow;
__gshared c_gst_rtcp_packet_get_rbFn c_gst_rtcp_packet_get_rb; ///
private alias c_gst_rtcp_packet_get_rb_countFn = extern(C) uint function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_get_rb_countFn c_gst_rtcp_packet_get_rb_count; ///
private alias c_gst_rtcp_packet_get_typeFn = extern(C) GstRTCPType function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_get_typeFn c_gst_rtcp_packet_get_type; ///
private alias c_gst_rtcp_packet_move_to_nextFn = extern(C) gboolean function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_move_to_nextFn c_gst_rtcp_packet_move_to_next; ///
private alias c_gst_rtcp_packet_removeFn = extern(C) gboolean function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_removeFn c_gst_rtcp_packet_remove; ///
private alias c_gst_rtcp_packet_rr_get_ssrcFn = extern(C) uint function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_rr_get_ssrcFn c_gst_rtcp_packet_rr_get_ssrc; ///
private alias c_gst_rtcp_packet_rr_set_ssrcFn = extern(C) void function(GstRTCPPacket* packet, uint ssrc) nothrow;
__gshared c_gst_rtcp_packet_rr_set_ssrcFn c_gst_rtcp_packet_rr_set_ssrc; ///
private alias c_gst_rtcp_packet_sdes_add_entryFn = extern(C) gboolean function(GstRTCPPacket* packet, GstRTCPSDESType type, ubyte len, const(ubyte)* data) nothrow;
__gshared c_gst_rtcp_packet_sdes_add_entryFn c_gst_rtcp_packet_sdes_add_entry; ///
private alias c_gst_rtcp_packet_sdes_add_itemFn = extern(C) gboolean function(GstRTCPPacket* packet, uint ssrc) nothrow;
__gshared c_gst_rtcp_packet_sdes_add_itemFn c_gst_rtcp_packet_sdes_add_item; ///
private alias c_gst_rtcp_packet_sdes_copy_entryFn = extern(C) gboolean function(GstRTCPPacket* packet, GstRTCPSDESType* type, ubyte* len, ubyte** data) nothrow;
__gshared c_gst_rtcp_packet_sdes_copy_entryFn c_gst_rtcp_packet_sdes_copy_entry; ///
private alias c_gst_rtcp_packet_sdes_first_entryFn = extern(C) gboolean function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_sdes_first_entryFn c_gst_rtcp_packet_sdes_first_entry; ///
private alias c_gst_rtcp_packet_sdes_first_itemFn = extern(C) gboolean function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_sdes_first_itemFn c_gst_rtcp_packet_sdes_first_item; ///
private alias c_gst_rtcp_packet_sdes_get_entryFn = extern(C) gboolean function(GstRTCPPacket* packet, GstRTCPSDESType* type, ubyte* len, ubyte** data) nothrow;
__gshared c_gst_rtcp_packet_sdes_get_entryFn c_gst_rtcp_packet_sdes_get_entry; ///
private alias c_gst_rtcp_packet_sdes_get_item_countFn = extern(C) uint function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_sdes_get_item_countFn c_gst_rtcp_packet_sdes_get_item_count; ///
private alias c_gst_rtcp_packet_sdes_get_ssrcFn = extern(C) uint function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_sdes_get_ssrcFn c_gst_rtcp_packet_sdes_get_ssrc; ///
private alias c_gst_rtcp_packet_sdes_next_entryFn = extern(C) gboolean function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_sdes_next_entryFn c_gst_rtcp_packet_sdes_next_entry; ///
private alias c_gst_rtcp_packet_sdes_next_itemFn = extern(C) gboolean function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_sdes_next_itemFn c_gst_rtcp_packet_sdes_next_item; ///
private alias c_gst_rtcp_packet_set_rbFn = extern(C) void function(GstRTCPPacket* packet, uint nth, uint ssrc, ubyte fractionlost, int packetslost, uint exthighestseq, uint jitter, uint lsr, uint dlsr) nothrow;
__gshared c_gst_rtcp_packet_set_rbFn c_gst_rtcp_packet_set_rb; ///
private alias c_gst_rtcp_packet_sr_get_sender_infoFn = extern(C) void function(GstRTCPPacket* packet, uint* ssrc, ulong* ntptime, uint* rtptime, uint* packetCount, uint* octetCount) nothrow;
__gshared c_gst_rtcp_packet_sr_get_sender_infoFn c_gst_rtcp_packet_sr_get_sender_info; ///
private alias c_gst_rtcp_packet_sr_set_sender_infoFn = extern(C) void function(GstRTCPPacket* packet, uint ssrc, ulong ntptime, uint rtptime, uint packetCount, uint octetCount) nothrow;
__gshared c_gst_rtcp_packet_sr_set_sender_infoFn c_gst_rtcp_packet_sr_set_sender_info; ///
private alias c_gst_rtcp_packet_xr_first_rbFn = extern(C) gboolean function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_xr_first_rbFn c_gst_rtcp_packet_xr_first_rb; ///
private alias c_gst_rtcp_packet_xr_get_block_lengthFn = extern(C) ushort function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_xr_get_block_lengthFn c_gst_rtcp_packet_xr_get_block_length; ///
private alias c_gst_rtcp_packet_xr_get_block_typeFn = extern(C) GstRTCPXRType function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_xr_get_block_typeFn c_gst_rtcp_packet_xr_get_block_type; ///
private alias c_gst_rtcp_packet_xr_get_dlrr_blockFn = extern(C) gboolean function(GstRTCPPacket* packet, uint nth, uint* ssrc, uint* lastRr, uint* delay) nothrow;
__gshared c_gst_rtcp_packet_xr_get_dlrr_blockFn c_gst_rtcp_packet_xr_get_dlrr_block; ///
private alias c_gst_rtcp_packet_xr_get_prt_by_seqFn = extern(C) gboolean function(GstRTCPPacket* packet, ushort seq, uint* receiptTime) nothrow;
__gshared c_gst_rtcp_packet_xr_get_prt_by_seqFn c_gst_rtcp_packet_xr_get_prt_by_seq; ///
private alias c_gst_rtcp_packet_xr_get_prt_infoFn = extern(C) gboolean function(GstRTCPPacket* packet, uint* ssrc, ubyte* thinning, ushort* beginSeq, ushort* endSeq) nothrow;
__gshared c_gst_rtcp_packet_xr_get_prt_infoFn c_gst_rtcp_packet_xr_get_prt_info; ///
private alias c_gst_rtcp_packet_xr_get_rle_infoFn = extern(C) gboolean function(GstRTCPPacket* packet, uint* ssrc, ubyte* thinning, ushort* beginSeq, ushort* endSeq, uint* chunkCount) nothrow;
__gshared c_gst_rtcp_packet_xr_get_rle_infoFn c_gst_rtcp_packet_xr_get_rle_info; ///
private alias c_gst_rtcp_packet_xr_get_rle_nth_chunkFn = extern(C) gboolean function(GstRTCPPacket* packet, uint nth, ushort* chunk) nothrow;
__gshared c_gst_rtcp_packet_xr_get_rle_nth_chunkFn c_gst_rtcp_packet_xr_get_rle_nth_chunk; ///
private alias c_gst_rtcp_packet_xr_get_rrtFn = extern(C) gboolean function(GstRTCPPacket* packet, ulong* timestamp) nothrow;
__gshared c_gst_rtcp_packet_xr_get_rrtFn c_gst_rtcp_packet_xr_get_rrt; ///
private alias c_gst_rtcp_packet_xr_get_ssrcFn = extern(C) uint function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_xr_get_ssrcFn c_gst_rtcp_packet_xr_get_ssrc; ///
private alias c_gst_rtcp_packet_xr_get_summary_infoFn = extern(C) gboolean function(GstRTCPPacket* packet, uint* ssrc, ushort* beginSeq, ushort* endSeq) nothrow;
__gshared c_gst_rtcp_packet_xr_get_summary_infoFn c_gst_rtcp_packet_xr_get_summary_info; ///
private alias c_gst_rtcp_packet_xr_get_summary_jitterFn = extern(C) gboolean function(GstRTCPPacket* packet, uint* minJitter, uint* maxJitter, uint* meanJitter, uint* devJitter) nothrow;
__gshared c_gst_rtcp_packet_xr_get_summary_jitterFn c_gst_rtcp_packet_xr_get_summary_jitter; ///
private alias c_gst_rtcp_packet_xr_get_summary_pktFn = extern(C) gboolean function(GstRTCPPacket* packet, uint* lostPackets, uint* dupPackets) nothrow;
__gshared c_gst_rtcp_packet_xr_get_summary_pktFn c_gst_rtcp_packet_xr_get_summary_pkt; ///
private alias c_gst_rtcp_packet_xr_get_summary_ttlFn = extern(C) gboolean function(GstRTCPPacket* packet, gboolean* isIpv4, ubyte* minTtl, ubyte* maxTtl, ubyte* meanTtl, ubyte* devTtl) nothrow;
__gshared c_gst_rtcp_packet_xr_get_summary_ttlFn c_gst_rtcp_packet_xr_get_summary_ttl; ///
private alias c_gst_rtcp_packet_xr_get_voip_burst_metricsFn = extern(C) gboolean function(GstRTCPPacket* packet, ubyte* burstDensity, ubyte* gapDensity, ushort* burstDuration, ushort* gapDuration) nothrow;
__gshared c_gst_rtcp_packet_xr_get_voip_burst_metricsFn c_gst_rtcp_packet_xr_get_voip_burst_metrics; ///
private alias c_gst_rtcp_packet_xr_get_voip_configuration_paramsFn = extern(C) gboolean function(GstRTCPPacket* packet, ubyte* gmin, ubyte* rxConfig) nothrow;
__gshared c_gst_rtcp_packet_xr_get_voip_configuration_paramsFn c_gst_rtcp_packet_xr_get_voip_configuration_params; ///
private alias c_gst_rtcp_packet_xr_get_voip_delay_metricsFn = extern(C) gboolean function(GstRTCPPacket* packet, ushort* roundtripDelay, ushort* endSystemDelay) nothrow;
__gshared c_gst_rtcp_packet_xr_get_voip_delay_metricsFn c_gst_rtcp_packet_xr_get_voip_delay_metrics; ///
private alias c_gst_rtcp_packet_xr_get_voip_jitter_buffer_paramsFn = extern(C) gboolean function(GstRTCPPacket* packet, ushort* jbNominal, ushort* jbMaximum, ushort* jbAbsMax) nothrow;
__gshared c_gst_rtcp_packet_xr_get_voip_jitter_buffer_paramsFn c_gst_rtcp_packet_xr_get_voip_jitter_buffer_params; ///
private alias c_gst_rtcp_packet_xr_get_voip_metrics_ssrcFn = extern(C) gboolean function(GstRTCPPacket* packet, uint* ssrc) nothrow;
__gshared c_gst_rtcp_packet_xr_get_voip_metrics_ssrcFn c_gst_rtcp_packet_xr_get_voip_metrics_ssrc; ///
private alias c_gst_rtcp_packet_xr_get_voip_packet_metricsFn = extern(C) gboolean function(GstRTCPPacket* packet, ubyte* lossRate, ubyte* discardRate) nothrow;
__gshared c_gst_rtcp_packet_xr_get_voip_packet_metricsFn c_gst_rtcp_packet_xr_get_voip_packet_metrics; ///
private alias c_gst_rtcp_packet_xr_get_voip_quality_metricsFn = extern(C) gboolean function(GstRTCPPacket* packet, ubyte* rFactor, ubyte* extRFactor, ubyte* mosLq, ubyte* mosCq) nothrow;
__gshared c_gst_rtcp_packet_xr_get_voip_quality_metricsFn c_gst_rtcp_packet_xr_get_voip_quality_metrics; ///
private alias c_gst_rtcp_packet_xr_get_voip_signal_metricsFn = extern(C) gboolean function(GstRTCPPacket* packet, ubyte* signalLevel, ubyte* noiseLevel, ubyte* rerl, ubyte* gmin) nothrow;
__gshared c_gst_rtcp_packet_xr_get_voip_signal_metricsFn c_gst_rtcp_packet_xr_get_voip_signal_metrics; ///
private alias c_gst_rtcp_packet_xr_next_rbFn = extern(C) gboolean function(GstRTCPPacket* packet) nothrow;
__gshared c_gst_rtcp_packet_xr_next_rbFn c_gst_rtcp_packet_xr_next_rb; ///

// RTPBaseAudioPayload
private alias c_gst_rtp_base_audio_payload_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_rtp_base_audio_payload_get_typeFn c_gst_rtp_base_audio_payload_get_type; ///
private alias c_gst_rtp_base_audio_payload_flushFn = extern(C) GstFlowReturn function(GstRTPBaseAudioPayload* baseaudiopayload, uint payloadLen, GstClockTime timestamp) nothrow;
__gshared c_gst_rtp_base_audio_payload_flushFn c_gst_rtp_base_audio_payload_flush; ///
private alias c_gst_rtp_base_audio_payload_get_adapterFn = extern(C) GstAdapter* function(GstRTPBaseAudioPayload* rtpbaseaudiopayload) nothrow;
__gshared c_gst_rtp_base_audio_payload_get_adapterFn c_gst_rtp_base_audio_payload_get_adapter; ///
private alias c_gst_rtp_base_audio_payload_pushFn = extern(C) GstFlowReturn function(GstRTPBaseAudioPayload* baseaudiopayload, const(ubyte)* data, uint payloadLen, GstClockTime timestamp) nothrow;
__gshared c_gst_rtp_base_audio_payload_pushFn c_gst_rtp_base_audio_payload_push; ///
private alias c_gst_rtp_base_audio_payload_set_frame_basedFn = extern(C) void function(GstRTPBaseAudioPayload* rtpbaseaudiopayload) nothrow;
__gshared c_gst_rtp_base_audio_payload_set_frame_basedFn c_gst_rtp_base_audio_payload_set_frame_based; ///
private alias c_gst_rtp_base_audio_payload_set_frame_optionsFn = extern(C) void function(GstRTPBaseAudioPayload* rtpbaseaudiopayload, int frameDuration, int frameSize) nothrow;
__gshared c_gst_rtp_base_audio_payload_set_frame_optionsFn c_gst_rtp_base_audio_payload_set_frame_options; ///
private alias c_gst_rtp_base_audio_payload_set_sample_basedFn = extern(C) void function(GstRTPBaseAudioPayload* rtpbaseaudiopayload) nothrow;
__gshared c_gst_rtp_base_audio_payload_set_sample_basedFn c_gst_rtp_base_audio_payload_set_sample_based; ///
private alias c_gst_rtp_base_audio_payload_set_sample_optionsFn = extern(C) void function(GstRTPBaseAudioPayload* rtpbaseaudiopayload, int sampleSize) nothrow;
__gshared c_gst_rtp_base_audio_payload_set_sample_optionsFn c_gst_rtp_base_audio_payload_set_sample_options; ///
private alias c_gst_rtp_base_audio_payload_set_samplebits_optionsFn = extern(C) void function(GstRTPBaseAudioPayload* rtpbaseaudiopayload, int sampleSize) nothrow;
__gshared c_gst_rtp_base_audio_payload_set_samplebits_optionsFn c_gst_rtp_base_audio_payload_set_samplebits_options; ///

// RTPBaseDepayload
private alias c_gst_rtp_base_depayload_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_rtp_base_depayload_get_typeFn c_gst_rtp_base_depayload_get_type; ///
private alias c_gst_rtp_base_depayload_delayedFn = extern(C) void function(GstRTPBaseDepayload* depayload) nothrow;
__gshared c_gst_rtp_base_depayload_delayedFn c_gst_rtp_base_depayload_delayed; ///
private alias c_gst_rtp_base_depayload_droppedFn = extern(C) void function(GstRTPBaseDepayload* depayload) nothrow;
__gshared c_gst_rtp_base_depayload_droppedFn c_gst_rtp_base_depayload_dropped; ///
private alias c_gst_rtp_base_depayload_flushFn = extern(C) void function(GstRTPBaseDepayload* depayload, gboolean keepCurrent) nothrow;
__gshared c_gst_rtp_base_depayload_flushFn c_gst_rtp_base_depayload_flush; ///
private alias c_gst_rtp_base_depayload_is_aggregate_hdrext_enabledFn = extern(C) gboolean function(GstRTPBaseDepayload* depayload) nothrow;
__gshared c_gst_rtp_base_depayload_is_aggregate_hdrext_enabledFn c_gst_rtp_base_depayload_is_aggregate_hdrext_enabled; ///
private alias c_gst_rtp_base_depayload_is_source_info_enabledFn = extern(C) gboolean function(GstRTPBaseDepayload* depayload) nothrow;
__gshared c_gst_rtp_base_depayload_is_source_info_enabledFn c_gst_rtp_base_depayload_is_source_info_enabled; ///
private alias c_gst_rtp_base_depayload_pushFn = extern(C) GstFlowReturn function(GstRTPBaseDepayload* filter, GstBuffer* outBuf) nothrow;
__gshared c_gst_rtp_base_depayload_pushFn c_gst_rtp_base_depayload_push; ///
private alias c_gst_rtp_base_depayload_push_listFn = extern(C) GstFlowReturn function(GstRTPBaseDepayload* filter, GstBufferList* outList) nothrow;
__gshared c_gst_rtp_base_depayload_push_listFn c_gst_rtp_base_depayload_push_list; ///
private alias c_gst_rtp_base_depayload_set_aggregate_hdrext_enabledFn = extern(C) void function(GstRTPBaseDepayload* depayload, gboolean enable) nothrow;
__gshared c_gst_rtp_base_depayload_set_aggregate_hdrext_enabledFn c_gst_rtp_base_depayload_set_aggregate_hdrext_enabled; ///
private alias c_gst_rtp_base_depayload_set_source_info_enabledFn = extern(C) void function(GstRTPBaseDepayload* depayload, gboolean enable) nothrow;
__gshared c_gst_rtp_base_depayload_set_source_info_enabledFn c_gst_rtp_base_depayload_set_source_info_enabled; ///

// RTPBasePayload
private alias c_gst_rtp_base_payload_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_rtp_base_payload_get_typeFn c_gst_rtp_base_payload_get_type; ///
private alias c_gst_rtp_base_payload_allocate_output_bufferFn = extern(C) GstBuffer* function(GstRTPBasePayload* payload, uint payloadLen, ubyte padLen, ubyte csrcCount) nothrow;
__gshared c_gst_rtp_base_payload_allocate_output_bufferFn c_gst_rtp_base_payload_allocate_output_buffer; ///
private alias c_gst_rtp_base_payload_get_source_countFn = extern(C) uint function(GstRTPBasePayload* payload, GstBuffer* buffer) nothrow;
__gshared c_gst_rtp_base_payload_get_source_countFn c_gst_rtp_base_payload_get_source_count; ///
private alias c_gst_rtp_base_payload_is_filledFn = extern(C) gboolean function(GstRTPBasePayload* payload, uint size, GstClockTime duration) nothrow;
__gshared c_gst_rtp_base_payload_is_filledFn c_gst_rtp_base_payload_is_filled; ///
private alias c_gst_rtp_base_payload_is_source_info_enabledFn = extern(C) gboolean function(GstRTPBasePayload* payload) nothrow;
__gshared c_gst_rtp_base_payload_is_source_info_enabledFn c_gst_rtp_base_payload_is_source_info_enabled; ///
private alias c_gst_rtp_base_payload_pushFn = extern(C) GstFlowReturn function(GstRTPBasePayload* payload, GstBuffer* buffer) nothrow;
__gshared c_gst_rtp_base_payload_pushFn c_gst_rtp_base_payload_push; ///
private alias c_gst_rtp_base_payload_push_listFn = extern(C) GstFlowReturn function(GstRTPBasePayload* payload, GstBufferList* list) nothrow;
__gshared c_gst_rtp_base_payload_push_listFn c_gst_rtp_base_payload_push_list; ///
private alias c_gst_rtp_base_payload_set_optionsFn = extern(C) void function(GstRTPBasePayload* payload, const(char)* media, gboolean dynamic, const(char)* encodingName, uint clockRate) nothrow;
__gshared c_gst_rtp_base_payload_set_optionsFn c_gst_rtp_base_payload_set_options; ///
private alias c_gst_rtp_base_payload_set_outcapsFn = extern(C) gboolean function(GstRTPBasePayload* payload, const(char)* fieldname,  ...) nothrow;
__gshared c_gst_rtp_base_payload_set_outcapsFn c_gst_rtp_base_payload_set_outcaps; ///
private alias c_gst_rtp_base_payload_set_outcaps_structureFn = extern(C) gboolean function(GstRTPBasePayload* payload, GstStructure* s) nothrow;
__gshared c_gst_rtp_base_payload_set_outcaps_structureFn c_gst_rtp_base_payload_set_outcaps_structure; ///
private alias c_gst_rtp_base_payload_set_source_info_enabledFn = extern(C) void function(GstRTPBasePayload* payload, gboolean enable) nothrow;
__gshared c_gst_rtp_base_payload_set_source_info_enabledFn c_gst_rtp_base_payload_set_source_info_enabled; ///

// RTPBuffer
private alias c_gst_rtp_buffer_add_extension_onebyte_headerFn = extern(C) gboolean function(GstRTPBuffer* rtp, ubyte id, const(void)* data, uint size) nothrow;
__gshared c_gst_rtp_buffer_add_extension_onebyte_headerFn c_gst_rtp_buffer_add_extension_onebyte_header; ///
private alias c_gst_rtp_buffer_add_extension_twobytes_headerFn = extern(C) gboolean function(GstRTPBuffer* rtp, ubyte appbits, ubyte id, const(void)* data, uint size) nothrow;
__gshared c_gst_rtp_buffer_add_extension_twobytes_headerFn c_gst_rtp_buffer_add_extension_twobytes_header; ///
private alias c_gst_rtp_buffer_get_csrcFn = extern(C) uint function(GstRTPBuffer* rtp, ubyte idx) nothrow;
__gshared c_gst_rtp_buffer_get_csrcFn c_gst_rtp_buffer_get_csrc; ///
private alias c_gst_rtp_buffer_get_csrc_countFn = extern(C) ubyte function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_csrc_countFn c_gst_rtp_buffer_get_csrc_count; ///
private alias c_gst_rtp_buffer_get_extensionFn = extern(C) gboolean function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_extensionFn c_gst_rtp_buffer_get_extension; ///
private alias c_gst_rtp_buffer_get_extension_bytesFn = extern(C) GBytes* function(GstRTPBuffer* rtp, ushort* bits) nothrow;
__gshared c_gst_rtp_buffer_get_extension_bytesFn c_gst_rtp_buffer_get_extension_bytes; ///
private alias c_gst_rtp_buffer_get_extension_dataFn = extern(C) gboolean function(GstRTPBuffer* rtp, ushort* bits, void** data, uint* wordlen) nothrow;
__gshared c_gst_rtp_buffer_get_extension_dataFn c_gst_rtp_buffer_get_extension_data; ///
private alias c_gst_rtp_buffer_get_extension_onebyte_headerFn = extern(C) gboolean function(GstRTPBuffer* rtp, ubyte id, uint nth, void** data, uint* size) nothrow;
__gshared c_gst_rtp_buffer_get_extension_onebyte_headerFn c_gst_rtp_buffer_get_extension_onebyte_header; ///
private alias c_gst_rtp_buffer_get_extension_twobytes_headerFn = extern(C) gboolean function(GstRTPBuffer* rtp, ubyte* appbits, ubyte id, uint nth, void** data, uint* size) nothrow;
__gshared c_gst_rtp_buffer_get_extension_twobytes_headerFn c_gst_rtp_buffer_get_extension_twobytes_header; ///
private alias c_gst_rtp_buffer_get_header_lenFn = extern(C) uint function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_header_lenFn c_gst_rtp_buffer_get_header_len; ///
private alias c_gst_rtp_buffer_get_markerFn = extern(C) gboolean function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_markerFn c_gst_rtp_buffer_get_marker; ///
private alias c_gst_rtp_buffer_get_packet_lenFn = extern(C) uint function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_packet_lenFn c_gst_rtp_buffer_get_packet_len; ///
private alias c_gst_rtp_buffer_get_paddingFn = extern(C) gboolean function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_paddingFn c_gst_rtp_buffer_get_padding; ///
private alias c_gst_rtp_buffer_get_payloadFn = extern(C) void* function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_payloadFn c_gst_rtp_buffer_get_payload; ///
private alias c_gst_rtp_buffer_get_payload_bufferFn = extern(C) GstBuffer* function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_payload_bufferFn c_gst_rtp_buffer_get_payload_buffer; ///
private alias c_gst_rtp_buffer_get_payload_bytesFn = extern(C) GBytes* function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_payload_bytesFn c_gst_rtp_buffer_get_payload_bytes; ///
private alias c_gst_rtp_buffer_get_payload_lenFn = extern(C) uint function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_payload_lenFn c_gst_rtp_buffer_get_payload_len; ///
private alias c_gst_rtp_buffer_get_payload_subbufferFn = extern(C) GstBuffer* function(GstRTPBuffer* rtp, uint offset, uint len) nothrow;
__gshared c_gst_rtp_buffer_get_payload_subbufferFn c_gst_rtp_buffer_get_payload_subbuffer; ///
private alias c_gst_rtp_buffer_get_payload_typeFn = extern(C) ubyte function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_payload_typeFn c_gst_rtp_buffer_get_payload_type; ///
private alias c_gst_rtp_buffer_get_seqFn = extern(C) ushort function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_seqFn c_gst_rtp_buffer_get_seq; ///
private alias c_gst_rtp_buffer_get_ssrcFn = extern(C) uint function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_ssrcFn c_gst_rtp_buffer_get_ssrc; ///
private alias c_gst_rtp_buffer_get_timestampFn = extern(C) uint function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_timestampFn c_gst_rtp_buffer_get_timestamp; ///
private alias c_gst_rtp_buffer_get_versionFn = extern(C) ubyte function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_get_versionFn c_gst_rtp_buffer_get_version; ///
private alias c_gst_rtp_buffer_pad_toFn = extern(C) void function(GstRTPBuffer* rtp, uint len) nothrow;
__gshared c_gst_rtp_buffer_pad_toFn c_gst_rtp_buffer_pad_to; ///
private alias c_gst_rtp_buffer_remove_extension_dataFn = extern(C) void function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_remove_extension_dataFn c_gst_rtp_buffer_remove_extension_data; ///
private alias c_gst_rtp_buffer_set_csrcFn = extern(C) void function(GstRTPBuffer* rtp, ubyte idx, uint csrc) nothrow;
__gshared c_gst_rtp_buffer_set_csrcFn c_gst_rtp_buffer_set_csrc; ///
private alias c_gst_rtp_buffer_set_extensionFn = extern(C) void function(GstRTPBuffer* rtp, gboolean extension) nothrow;
__gshared c_gst_rtp_buffer_set_extensionFn c_gst_rtp_buffer_set_extension; ///
private alias c_gst_rtp_buffer_set_extension_dataFn = extern(C) gboolean function(GstRTPBuffer* rtp, ushort bits, ushort length) nothrow;
__gshared c_gst_rtp_buffer_set_extension_dataFn c_gst_rtp_buffer_set_extension_data; ///
private alias c_gst_rtp_buffer_set_markerFn = extern(C) void function(GstRTPBuffer* rtp, gboolean marker) nothrow;
__gshared c_gst_rtp_buffer_set_markerFn c_gst_rtp_buffer_set_marker; ///
private alias c_gst_rtp_buffer_set_packet_lenFn = extern(C) void function(GstRTPBuffer* rtp, uint len) nothrow;
__gshared c_gst_rtp_buffer_set_packet_lenFn c_gst_rtp_buffer_set_packet_len; ///
private alias c_gst_rtp_buffer_set_paddingFn = extern(C) void function(GstRTPBuffer* rtp, gboolean padding) nothrow;
__gshared c_gst_rtp_buffer_set_paddingFn c_gst_rtp_buffer_set_padding; ///
private alias c_gst_rtp_buffer_set_payload_typeFn = extern(C) void function(GstRTPBuffer* rtp, ubyte payloadType) nothrow;
__gshared c_gst_rtp_buffer_set_payload_typeFn c_gst_rtp_buffer_set_payload_type; ///
private alias c_gst_rtp_buffer_set_seqFn = extern(C) void function(GstRTPBuffer* rtp, ushort seq) nothrow;
__gshared c_gst_rtp_buffer_set_seqFn c_gst_rtp_buffer_set_seq; ///
private alias c_gst_rtp_buffer_set_ssrcFn = extern(C) void function(GstRTPBuffer* rtp, uint ssrc) nothrow;
__gshared c_gst_rtp_buffer_set_ssrcFn c_gst_rtp_buffer_set_ssrc; ///
private alias c_gst_rtp_buffer_set_timestampFn = extern(C) void function(GstRTPBuffer* rtp, uint timestamp) nothrow;
__gshared c_gst_rtp_buffer_set_timestampFn c_gst_rtp_buffer_set_timestamp; ///
private alias c_gst_rtp_buffer_set_versionFn = extern(C) void function(GstRTPBuffer* rtp, ubyte version_) nothrow;
__gshared c_gst_rtp_buffer_set_versionFn c_gst_rtp_buffer_set_version; ///
private alias c_gst_rtp_buffer_unmapFn = extern(C) void function(GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_unmapFn c_gst_rtp_buffer_unmap; ///
private alias c_gst_rtp_buffer_allocate_dataFn = extern(C) void function(GstBuffer* buffer, uint payloadLen, ubyte padLen, ubyte csrcCount) nothrow;
__gshared c_gst_rtp_buffer_allocate_dataFn c_gst_rtp_buffer_allocate_data; ///
private alias c_gst_rtp_buffer_calc_header_lenFn = extern(C) uint function(ubyte csrcCount) nothrow;
__gshared c_gst_rtp_buffer_calc_header_lenFn c_gst_rtp_buffer_calc_header_len; ///
private alias c_gst_rtp_buffer_calc_packet_lenFn = extern(C) uint function(uint payloadLen, ubyte padLen, ubyte csrcCount) nothrow;
__gshared c_gst_rtp_buffer_calc_packet_lenFn c_gst_rtp_buffer_calc_packet_len; ///
private alias c_gst_rtp_buffer_calc_payload_lenFn = extern(C) uint function(uint packetLen, ubyte padLen, ubyte csrcCount) nothrow;
__gshared c_gst_rtp_buffer_calc_payload_lenFn c_gst_rtp_buffer_calc_payload_len; ///
private alias c_gst_rtp_buffer_compare_seqnumFn = extern(C) int function(ushort seqnum1, ushort seqnum2) nothrow;
__gshared c_gst_rtp_buffer_compare_seqnumFn c_gst_rtp_buffer_compare_seqnum; ///
private alias c_gst_rtp_buffer_default_clock_rateFn = extern(C) uint function(ubyte payloadType) nothrow;
__gshared c_gst_rtp_buffer_default_clock_rateFn c_gst_rtp_buffer_default_clock_rate; ///
private alias c_gst_rtp_buffer_ext_timestampFn = extern(C) ulong function(ulong* exttimestamp, uint timestamp) nothrow;
__gshared c_gst_rtp_buffer_ext_timestampFn c_gst_rtp_buffer_ext_timestamp; ///
private alias c_gst_rtp_buffer_get_extension_onebyte_header_from_bytesFn = extern(C) gboolean function(GBytes* bytes, ushort bitPattern, ubyte id, uint nth, void** data, uint* size) nothrow;
__gshared c_gst_rtp_buffer_get_extension_onebyte_header_from_bytesFn c_gst_rtp_buffer_get_extension_onebyte_header_from_bytes; ///
private alias c_gst_rtp_buffer_mapFn = extern(C) gboolean function(GstBuffer* buffer, GstMapFlags flags, GstRTPBuffer* rtp) nothrow;
__gshared c_gst_rtp_buffer_mapFn c_gst_rtp_buffer_map; ///
private alias c_gst_rtp_buffer_new_allocateFn = extern(C) GstBuffer* function(uint payloadLen, ubyte padLen, ubyte csrcCount) nothrow;
__gshared c_gst_rtp_buffer_new_allocateFn c_gst_rtp_buffer_new_allocate; ///
private alias c_gst_rtp_buffer_new_allocate_lenFn = extern(C) GstBuffer* function(uint packetLen, ubyte padLen, ubyte csrcCount) nothrow;
__gshared c_gst_rtp_buffer_new_allocate_lenFn c_gst_rtp_buffer_new_allocate_len; ///
private alias c_gst_rtp_buffer_new_copy_dataFn = extern(C) GstBuffer* function(const(void)* data, size_t len) nothrow;
__gshared c_gst_rtp_buffer_new_copy_dataFn c_gst_rtp_buffer_new_copy_data; ///
private alias c_gst_rtp_buffer_new_take_dataFn = extern(C) GstBuffer* function(void* data, size_t len) nothrow;
__gshared c_gst_rtp_buffer_new_take_dataFn c_gst_rtp_buffer_new_take_data; ///

// RTPHeaderExtension
private alias c_gst_rtp_header_extension_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_rtp_header_extension_get_typeFn c_gst_rtp_header_extension_get_type; ///
private alias c_gst_rtp_header_extension_create_from_uriFn = extern(C) GstRTPHeaderExtension* function(const(char)* uri) nothrow;
__gshared c_gst_rtp_header_extension_create_from_uriFn c_gst_rtp_header_extension_create_from_uri; ///
private alias c_gst_rtp_header_extension_get_directionFn = extern(C) GstRTPHeaderExtensionDirection function(GstRTPHeaderExtension* ext) nothrow;
__gshared c_gst_rtp_header_extension_get_directionFn c_gst_rtp_header_extension_get_direction; ///
private alias c_gst_rtp_header_extension_get_idFn = extern(C) uint function(GstRTPHeaderExtension* ext) nothrow;
__gshared c_gst_rtp_header_extension_get_idFn c_gst_rtp_header_extension_get_id; ///
private alias c_gst_rtp_header_extension_get_max_sizeFn = extern(C) size_t function(GstRTPHeaderExtension* ext, const(GstBuffer)* inputMeta) nothrow;
__gshared c_gst_rtp_header_extension_get_max_sizeFn c_gst_rtp_header_extension_get_max_size; ///
private alias c_gst_rtp_header_extension_get_sdp_caps_field_nameFn = extern(C) char* function(GstRTPHeaderExtension* ext) nothrow;
__gshared c_gst_rtp_header_extension_get_sdp_caps_field_nameFn c_gst_rtp_header_extension_get_sdp_caps_field_name; ///
private alias c_gst_rtp_header_extension_get_supported_flagsFn = extern(C) GstRTPHeaderExtensionFlags function(GstRTPHeaderExtension* ext) nothrow;
__gshared c_gst_rtp_header_extension_get_supported_flagsFn c_gst_rtp_header_extension_get_supported_flags; ///
private alias c_gst_rtp_header_extension_get_uriFn = extern(C) const(char)* function(GstRTPHeaderExtension* ext) nothrow;
__gshared c_gst_rtp_header_extension_get_uriFn c_gst_rtp_header_extension_get_uri; ///
private alias c_gst_rtp_header_extension_readFn = extern(C) gboolean function(GstRTPHeaderExtension* ext, GstRTPHeaderExtensionFlags readFlags, const(ubyte)* data, size_t size, GstBuffer* buffer) nothrow;
__gshared c_gst_rtp_header_extension_readFn c_gst_rtp_header_extension_read; ///
private alias c_gst_rtp_header_extension_set_attributes_from_capsFn = extern(C) gboolean function(GstRTPHeaderExtension* ext, const(GstCaps)* caps) nothrow;
__gshared c_gst_rtp_header_extension_set_attributes_from_capsFn c_gst_rtp_header_extension_set_attributes_from_caps; ///
private alias c_gst_rtp_header_extension_set_caps_from_attributesFn = extern(C) gboolean function(GstRTPHeaderExtension* ext, GstCaps* caps) nothrow;
__gshared c_gst_rtp_header_extension_set_caps_from_attributesFn c_gst_rtp_header_extension_set_caps_from_attributes; ///
private alias c_gst_rtp_header_extension_set_caps_from_attributes_helperFn = extern(C) gboolean function(GstRTPHeaderExtension* ext, GstCaps* caps, const(char)* attributes) nothrow;
__gshared c_gst_rtp_header_extension_set_caps_from_attributes_helperFn c_gst_rtp_header_extension_set_caps_from_attributes_helper; ///
private alias c_gst_rtp_header_extension_set_directionFn = extern(C) void function(GstRTPHeaderExtension* ext, GstRTPHeaderExtensionDirection direction) nothrow;
__gshared c_gst_rtp_header_extension_set_directionFn c_gst_rtp_header_extension_set_direction; ///
private alias c_gst_rtp_header_extension_set_idFn = extern(C) void function(GstRTPHeaderExtension* ext, uint extId) nothrow;
__gshared c_gst_rtp_header_extension_set_idFn c_gst_rtp_header_extension_set_id; ///
private alias c_gst_rtp_header_extension_set_non_rtp_sink_capsFn = extern(C) gboolean function(GstRTPHeaderExtension* ext, const(GstCaps)* caps) nothrow;
__gshared c_gst_rtp_header_extension_set_non_rtp_sink_capsFn c_gst_rtp_header_extension_set_non_rtp_sink_caps; ///
private alias c_gst_rtp_header_extension_set_wants_update_non_rtp_src_capsFn = extern(C) void function(GstRTPHeaderExtension* ext, gboolean state) nothrow;
__gshared c_gst_rtp_header_extension_set_wants_update_non_rtp_src_capsFn c_gst_rtp_header_extension_set_wants_update_non_rtp_src_caps; ///
private alias c_gst_rtp_header_extension_update_non_rtp_src_capsFn = extern(C) gboolean function(GstRTPHeaderExtension* ext, GstCaps* caps) nothrow;
__gshared c_gst_rtp_header_extension_update_non_rtp_src_capsFn c_gst_rtp_header_extension_update_non_rtp_src_caps; ///
private alias c_gst_rtp_header_extension_wants_update_non_rtp_src_capsFn = extern(C) gboolean function(GstRTPHeaderExtension* ext) nothrow;
__gshared c_gst_rtp_header_extension_wants_update_non_rtp_src_capsFn c_gst_rtp_header_extension_wants_update_non_rtp_src_caps; ///
private alias c_gst_rtp_header_extension_writeFn = extern(C) ptrdiff_t function(GstRTPHeaderExtension* ext, const(GstBuffer)* inputMeta, GstRTPHeaderExtensionFlags writeFlags, GstBuffer* output, ubyte* data, size_t size) nothrow;
__gshared c_gst_rtp_header_extension_writeFn c_gst_rtp_header_extension_write; ///

// RTPHeaderExtensionClass
private alias c_gst_rtp_header_extension_class_set_uriFn = extern(C) void function(GstRTPHeaderExtensionClass* klass, const(char)* uri) nothrow;
__gshared c_gst_rtp_header_extension_class_set_uriFn c_gst_rtp_header_extension_class_set_uri; ///

// RTPPayloadInfo
private alias c_gst_rtp_payload_info_for_nameFn = extern(C) const(GstRTPPayloadInfo)* function(const(char)* media, const(char)* encodingName) nothrow;
__gshared c_gst_rtp_payload_info_for_nameFn c_gst_rtp_payload_info_for_name; ///
private alias c_gst_rtp_payload_info_for_ptFn = extern(C) const(GstRTPPayloadInfo)* function(ubyte payloadType) nothrow;
__gshared c_gst_rtp_payload_info_for_ptFn c_gst_rtp_payload_info_for_pt; ///

// RTPSourceMeta
private alias c_gst_rtp_source_meta_append_csrcFn = extern(C) gboolean function(GstRTPSourceMeta* meta, const(uint)* csrc, uint csrcCount) nothrow;
__gshared c_gst_rtp_source_meta_append_csrcFn c_gst_rtp_source_meta_append_csrc; ///
private alias c_gst_rtp_source_meta_get_source_countFn = extern(C) uint function(const(GstRTPSourceMeta)* meta) nothrow;
__gshared c_gst_rtp_source_meta_get_source_countFn c_gst_rtp_source_meta_get_source_count; ///
private alias c_gst_rtp_source_meta_set_ssrcFn = extern(C) gboolean function(GstRTPSourceMeta* meta, uint* ssrc) nothrow;
__gshared c_gst_rtp_source_meta_set_ssrcFn c_gst_rtp_source_meta_set_ssrc; ///
private alias c_gst_rtp_source_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_rtp_source_meta_get_infoFn c_gst_rtp_source_meta_get_info; ///

// global
private alias c_gst_buffer_add_rtp_source_metaFn = extern(C) GstRTPSourceMeta* function(GstBuffer* buffer, const(uint)* ssrc, const(uint)* csrc, uint csrcCount) nothrow;
__gshared c_gst_buffer_add_rtp_source_metaFn c_gst_buffer_add_rtp_source_meta; ///
private alias c_gst_buffer_get_rtp_source_metaFn = extern(C) GstRTPSourceMeta* function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_get_rtp_source_metaFn c_gst_buffer_get_rtp_source_meta; ///
private alias c_gst_rtcp_ntp_to_unixFn = extern(C) ulong function(ulong ntptime) nothrow;
__gshared c_gst_rtcp_ntp_to_unixFn c_gst_rtcp_ntp_to_unix; ///
private alias c_gst_rtcp_sdes_name_to_typeFn = extern(C) GstRTCPSDESType function(const(char)* name) nothrow;
__gshared c_gst_rtcp_sdes_name_to_typeFn c_gst_rtcp_sdes_name_to_type; ///
private alias c_gst_rtcp_sdes_type_to_nameFn = extern(C) const(char)* function(GstRTCPSDESType type) nothrow;
__gshared c_gst_rtcp_sdes_type_to_nameFn c_gst_rtcp_sdes_type_to_name; ///
private alias c_gst_rtcp_unix_to_ntpFn = extern(C) ulong function(ulong unixtime) nothrow;
__gshared c_gst_rtcp_unix_to_ntpFn c_gst_rtcp_unix_to_ntp; ///
private alias c_gst_rtp_get_header_extension_listFn = extern(C) GList* function() nothrow;
__gshared c_gst_rtp_get_header_extension_listFn c_gst_rtp_get_header_extension_list; ///
private alias c_gst_rtp_hdrext_get_ntp_56Fn = extern(C) gboolean function(void* data, uint size, ulong* ntptime) nothrow;
__gshared c_gst_rtp_hdrext_get_ntp_56Fn c_gst_rtp_hdrext_get_ntp_56; ///
private alias c_gst_rtp_hdrext_get_ntp_64Fn = extern(C) gboolean function(void* data, uint size, ulong* ntptime) nothrow;
__gshared c_gst_rtp_hdrext_get_ntp_64Fn c_gst_rtp_hdrext_get_ntp_64; ///
private alias c_gst_rtp_hdrext_set_ntp_56Fn = extern(C) gboolean function(void* data, uint size, ulong ntptime) nothrow;
__gshared c_gst_rtp_hdrext_set_ntp_56Fn c_gst_rtp_hdrext_set_ntp_56; ///
private alias c_gst_rtp_hdrext_set_ntp_64Fn = extern(C) gboolean function(void* data, uint size, ulong ntptime) nothrow;
__gshared c_gst_rtp_hdrext_set_ntp_64Fn c_gst_rtp_hdrext_set_ntp_64; ///
private alias c_gst_rtp_source_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_rtp_source_meta_api_get_typeFn c_gst_rtp_source_meta_api_get_type; ///

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
