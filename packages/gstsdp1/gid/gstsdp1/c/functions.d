/// C functions for gstsdp1 library
module gid.gstsdp1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstsdp1.c.types;
public import gid.gst1.c.types;

private immutable LIBS = ["gstsdp-1.0_0"];

// MIKEYMessage
private alias c_gst_mikey_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_mikey_message_get_typeFn c_gst_mikey_message_get_type; ///
private alias c_gst_mikey_message_newFn = extern(C) GstMIKEYMessage* function() nothrow;
__gshared c_gst_mikey_message_newFn c_gst_mikey_message_new; ///
private alias c_gst_mikey_message_new_from_bytesFn = extern(C) GstMIKEYMessage* function(GBytes* bytes, GstMIKEYDecryptInfo* info, GError** _err) nothrow;
__gshared c_gst_mikey_message_new_from_bytesFn c_gst_mikey_message_new_from_bytes; ///
private alias c_gst_mikey_message_new_from_capsFn = extern(C) GstMIKEYMessage* function(GstCaps* caps) nothrow;
__gshared c_gst_mikey_message_new_from_capsFn c_gst_mikey_message_new_from_caps; ///
private alias c_gst_mikey_message_new_from_dataFn = extern(C) GstMIKEYMessage* function(const(void)* data, size_t size, GstMIKEYDecryptInfo* info, GError** _err) nothrow;
__gshared c_gst_mikey_message_new_from_dataFn c_gst_mikey_message_new_from_data; ///
private alias c_gst_mikey_message_add_cs_srtpFn = extern(C) gboolean function(GstMIKEYMessage* msg, ubyte policy, uint ssrc, uint roc) nothrow;
__gshared c_gst_mikey_message_add_cs_srtpFn c_gst_mikey_message_add_cs_srtp; ///
private alias c_gst_mikey_message_add_payloadFn = extern(C) gboolean function(GstMIKEYMessage* msg, GstMIKEYPayload* payload) nothrow;
__gshared c_gst_mikey_message_add_payloadFn c_gst_mikey_message_add_payload; ///
private alias c_gst_mikey_message_add_pkeFn = extern(C) gboolean function(GstMIKEYMessage* msg, GstMIKEYCacheType C, ushort dataLen, const(ubyte)* data) nothrow;
__gshared c_gst_mikey_message_add_pkeFn c_gst_mikey_message_add_pke; ///
private alias c_gst_mikey_message_add_randFn = extern(C) gboolean function(GstMIKEYMessage* msg, ubyte len, const(ubyte)* rand) nothrow;
__gshared c_gst_mikey_message_add_randFn c_gst_mikey_message_add_rand; ///
private alias c_gst_mikey_message_add_rand_lenFn = extern(C) gboolean function(GstMIKEYMessage* msg, ubyte len) nothrow;
__gshared c_gst_mikey_message_add_rand_lenFn c_gst_mikey_message_add_rand_len; ///
private alias c_gst_mikey_message_add_tFn = extern(C) gboolean function(GstMIKEYMessage* msg, GstMIKEYTSType type, const(ubyte)* tsValue) nothrow;
__gshared c_gst_mikey_message_add_tFn c_gst_mikey_message_add_t; ///
private alias c_gst_mikey_message_add_t_now_ntp_utcFn = extern(C) gboolean function(GstMIKEYMessage* msg) nothrow;
__gshared c_gst_mikey_message_add_t_now_ntp_utcFn c_gst_mikey_message_add_t_now_ntp_utc; ///
private alias c_gst_mikey_message_base64_encodeFn = extern(C) char* function(GstMIKEYMessage* msg) nothrow;
__gshared c_gst_mikey_message_base64_encodeFn c_gst_mikey_message_base64_encode; ///
private alias c_gst_mikey_message_find_payloadFn = extern(C) const(GstMIKEYPayload)* function(const(GstMIKEYMessage)* msg, GstMIKEYPayloadType type, uint nth) nothrow;
__gshared c_gst_mikey_message_find_payloadFn c_gst_mikey_message_find_payload; ///
private alias c_gst_mikey_message_get_cs_srtpFn = extern(C) const(GstMIKEYMapSRTP)* function(const(GstMIKEYMessage)* msg, uint idx) nothrow;
__gshared c_gst_mikey_message_get_cs_srtpFn c_gst_mikey_message_get_cs_srtp; ///
private alias c_gst_mikey_message_get_n_csFn = extern(C) uint function(const(GstMIKEYMessage)* msg) nothrow;
__gshared c_gst_mikey_message_get_n_csFn c_gst_mikey_message_get_n_cs; ///
private alias c_gst_mikey_message_get_n_payloadsFn = extern(C) uint function(const(GstMIKEYMessage)* msg) nothrow;
__gshared c_gst_mikey_message_get_n_payloadsFn c_gst_mikey_message_get_n_payloads; ///
private alias c_gst_mikey_message_get_payloadFn = extern(C) const(GstMIKEYPayload)* function(const(GstMIKEYMessage)* msg, uint idx) nothrow;
__gshared c_gst_mikey_message_get_payloadFn c_gst_mikey_message_get_payload; ///
private alias c_gst_mikey_message_insert_cs_srtpFn = extern(C) gboolean function(GstMIKEYMessage* msg, int idx, const(GstMIKEYMapSRTP)* map) nothrow;
__gshared c_gst_mikey_message_insert_cs_srtpFn c_gst_mikey_message_insert_cs_srtp; ///
private alias c_gst_mikey_message_insert_payloadFn = extern(C) gboolean function(GstMIKEYMessage* msg, uint idx, GstMIKEYPayload* payload) nothrow;
__gshared c_gst_mikey_message_insert_payloadFn c_gst_mikey_message_insert_payload; ///
private alias c_gst_mikey_message_remove_cs_srtpFn = extern(C) gboolean function(GstMIKEYMessage* msg, int idx) nothrow;
__gshared c_gst_mikey_message_remove_cs_srtpFn c_gst_mikey_message_remove_cs_srtp; ///
private alias c_gst_mikey_message_remove_payloadFn = extern(C) gboolean function(GstMIKEYMessage* msg, uint idx) nothrow;
__gshared c_gst_mikey_message_remove_payloadFn c_gst_mikey_message_remove_payload; ///
private alias c_gst_mikey_message_replace_cs_srtpFn = extern(C) gboolean function(GstMIKEYMessage* msg, int idx, const(GstMIKEYMapSRTP)* map) nothrow;
__gshared c_gst_mikey_message_replace_cs_srtpFn c_gst_mikey_message_replace_cs_srtp; ///
private alias c_gst_mikey_message_replace_payloadFn = extern(C) gboolean function(GstMIKEYMessage* msg, uint idx, GstMIKEYPayload* payload) nothrow;
__gshared c_gst_mikey_message_replace_payloadFn c_gst_mikey_message_replace_payload; ///
private alias c_gst_mikey_message_set_infoFn = extern(C) gboolean function(GstMIKEYMessage* msg, ubyte version_, GstMIKEYType type, gboolean V, GstMIKEYPRFFunc prfFunc, uint CSBId, GstMIKEYMapType mapType) nothrow;
__gshared c_gst_mikey_message_set_infoFn c_gst_mikey_message_set_info; ///
private alias c_gst_mikey_message_to_bytesFn = extern(C) GBytes* function(GstMIKEYMessage* msg, GstMIKEYEncryptInfo* info, GError** _err) nothrow;
__gshared c_gst_mikey_message_to_bytesFn c_gst_mikey_message_to_bytes; ///
private alias c_gst_mikey_message_to_capsFn = extern(C) gboolean function(const(GstMIKEYMessage)* msg, GstCaps* caps) nothrow;
__gshared c_gst_mikey_message_to_capsFn c_gst_mikey_message_to_caps; ///

// MIKEYPayload
private alias c_gst_mikey_payload_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_mikey_payload_get_typeFn c_gst_mikey_payload_get_type; ///
private alias c_gst_mikey_payload_newFn = extern(C) GstMIKEYPayload* function(GstMIKEYPayloadType type) nothrow;
__gshared c_gst_mikey_payload_newFn c_gst_mikey_payload_new; ///
private alias c_gst_mikey_payload_kemac_add_subFn = extern(C) gboolean function(GstMIKEYPayload* payload, GstMIKEYPayload* newpay) nothrow;
__gshared c_gst_mikey_payload_kemac_add_subFn c_gst_mikey_payload_kemac_add_sub; ///
private alias c_gst_mikey_payload_kemac_get_n_subFn = extern(C) uint function(const(GstMIKEYPayload)* payload) nothrow;
__gshared c_gst_mikey_payload_kemac_get_n_subFn c_gst_mikey_payload_kemac_get_n_sub; ///
private alias c_gst_mikey_payload_kemac_get_subFn = extern(C) const(GstMIKEYPayload)* function(const(GstMIKEYPayload)* payload, uint idx) nothrow;
__gshared c_gst_mikey_payload_kemac_get_subFn c_gst_mikey_payload_kemac_get_sub; ///
private alias c_gst_mikey_payload_kemac_remove_subFn = extern(C) gboolean function(GstMIKEYPayload* payload, uint idx) nothrow;
__gshared c_gst_mikey_payload_kemac_remove_subFn c_gst_mikey_payload_kemac_remove_sub; ///
private alias c_gst_mikey_payload_kemac_setFn = extern(C) gboolean function(GstMIKEYPayload* payload, GstMIKEYEncAlg encAlg, GstMIKEYMacAlg macAlg) nothrow;
__gshared c_gst_mikey_payload_kemac_setFn c_gst_mikey_payload_kemac_set; ///
private alias c_gst_mikey_payload_key_data_set_intervalFn = extern(C) gboolean function(GstMIKEYPayload* payload, ubyte vfLen, const(ubyte)* vfData, ubyte vtLen, const(ubyte)* vtData) nothrow;
__gshared c_gst_mikey_payload_key_data_set_intervalFn c_gst_mikey_payload_key_data_set_interval; ///
private alias c_gst_mikey_payload_key_data_set_keyFn = extern(C) gboolean function(GstMIKEYPayload* payload, GstMIKEYKeyDataType keyType, ushort keyLen, const(ubyte)* keyData) nothrow;
__gshared c_gst_mikey_payload_key_data_set_keyFn c_gst_mikey_payload_key_data_set_key; ///
private alias c_gst_mikey_payload_key_data_set_saltFn = extern(C) gboolean function(GstMIKEYPayload* payload, ushort saltLen, const(ubyte)* saltData) nothrow;
__gshared c_gst_mikey_payload_key_data_set_saltFn c_gst_mikey_payload_key_data_set_salt; ///
private alias c_gst_mikey_payload_key_data_set_spiFn = extern(C) gboolean function(GstMIKEYPayload* payload, ubyte spiLen, const(ubyte)* spiData) nothrow;
__gshared c_gst_mikey_payload_key_data_set_spiFn c_gst_mikey_payload_key_data_set_spi; ///
private alias c_gst_mikey_payload_pke_setFn = extern(C) gboolean function(GstMIKEYPayload* payload, GstMIKEYCacheType C, ushort dataLen, const(ubyte)* data) nothrow;
__gshared c_gst_mikey_payload_pke_setFn c_gst_mikey_payload_pke_set; ///
private alias c_gst_mikey_payload_rand_setFn = extern(C) gboolean function(GstMIKEYPayload* payload, ubyte len, const(ubyte)* rand) nothrow;
__gshared c_gst_mikey_payload_rand_setFn c_gst_mikey_payload_rand_set; ///
private alias c_gst_mikey_payload_sp_add_paramFn = extern(C) gboolean function(GstMIKEYPayload* payload, ubyte type, ubyte len, const(ubyte)* val) nothrow;
__gshared c_gst_mikey_payload_sp_add_paramFn c_gst_mikey_payload_sp_add_param; ///
private alias c_gst_mikey_payload_sp_get_n_paramsFn = extern(C) uint function(const(GstMIKEYPayload)* payload) nothrow;
__gshared c_gst_mikey_payload_sp_get_n_paramsFn c_gst_mikey_payload_sp_get_n_params; ///
private alias c_gst_mikey_payload_sp_get_paramFn = extern(C) const(GstMIKEYPayloadSPParam)* function(const(GstMIKEYPayload)* payload, uint idx) nothrow;
__gshared c_gst_mikey_payload_sp_get_paramFn c_gst_mikey_payload_sp_get_param; ///
private alias c_gst_mikey_payload_sp_remove_paramFn = extern(C) gboolean function(GstMIKEYPayload* payload, uint idx) nothrow;
__gshared c_gst_mikey_payload_sp_remove_paramFn c_gst_mikey_payload_sp_remove_param; ///
private alias c_gst_mikey_payload_sp_setFn = extern(C) gboolean function(GstMIKEYPayload* payload, uint policy, GstMIKEYSecProto proto) nothrow;
__gshared c_gst_mikey_payload_sp_setFn c_gst_mikey_payload_sp_set; ///
private alias c_gst_mikey_payload_t_setFn = extern(C) gboolean function(GstMIKEYPayload* payload, GstMIKEYTSType type, const(ubyte)* tsValue) nothrow;
__gshared c_gst_mikey_payload_t_setFn c_gst_mikey_payload_t_set; ///

// SDPAttribute
private alias c_gst_sdp_attribute_clearFn = extern(C) GstSDPResult function(GstSDPAttribute* attr) nothrow;
__gshared c_gst_sdp_attribute_clearFn c_gst_sdp_attribute_clear; ///
private alias c_gst_sdp_attribute_setFn = extern(C) GstSDPResult function(GstSDPAttribute* attr, const(char)* key, const(char)* value) nothrow;
__gshared c_gst_sdp_attribute_setFn c_gst_sdp_attribute_set; ///

// SDPBandwidth
private alias c_gst_sdp_bandwidth_clearFn = extern(C) GstSDPResult function(GstSDPBandwidth* bw) nothrow;
__gshared c_gst_sdp_bandwidth_clearFn c_gst_sdp_bandwidth_clear; ///
private alias c_gst_sdp_bandwidth_setFn = extern(C) GstSDPResult function(GstSDPBandwidth* bw, const(char)* bwtype, uint bandwidth) nothrow;
__gshared c_gst_sdp_bandwidth_setFn c_gst_sdp_bandwidth_set; ///

// SDPConnection
private alias c_gst_sdp_connection_clearFn = extern(C) GstSDPResult function(GstSDPConnection* conn) nothrow;
__gshared c_gst_sdp_connection_clearFn c_gst_sdp_connection_clear; ///
private alias c_gst_sdp_connection_setFn = extern(C) GstSDPResult function(GstSDPConnection* conn, const(char)* nettype, const(char)* addrtype, const(char)* address, uint ttl, uint addrNumber) nothrow;
__gshared c_gst_sdp_connection_setFn c_gst_sdp_connection_set; ///

// SDPMedia
private alias c_gst_sdp_media_add_attributeFn = extern(C) GstSDPResult function(GstSDPMedia* media, const(char)* key, const(char)* value) nothrow;
__gshared c_gst_sdp_media_add_attributeFn c_gst_sdp_media_add_attribute; ///
private alias c_gst_sdp_media_add_bandwidthFn = extern(C) GstSDPResult function(GstSDPMedia* media, const(char)* bwtype, uint bandwidth) nothrow;
__gshared c_gst_sdp_media_add_bandwidthFn c_gst_sdp_media_add_bandwidth; ///
private alias c_gst_sdp_media_add_connectionFn = extern(C) GstSDPResult function(GstSDPMedia* media, const(char)* nettype, const(char)* addrtype, const(char)* address, uint ttl, uint addrNumber) nothrow;
__gshared c_gst_sdp_media_add_connectionFn c_gst_sdp_media_add_connection; ///
private alias c_gst_sdp_media_add_formatFn = extern(C) GstSDPResult function(GstSDPMedia* media, const(char)* format) nothrow;
__gshared c_gst_sdp_media_add_formatFn c_gst_sdp_media_add_format; ///
private alias c_gst_sdp_media_as_textFn = extern(C) char* function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_as_textFn c_gst_sdp_media_as_text; ///
private alias c_gst_sdp_media_attributes_lenFn = extern(C) uint function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_attributes_lenFn c_gst_sdp_media_attributes_len; ///
private alias c_gst_sdp_media_attributes_to_capsFn = extern(C) GstSDPResult function(const(GstSDPMedia)* media, GstCaps* caps) nothrow;
__gshared c_gst_sdp_media_attributes_to_capsFn c_gst_sdp_media_attributes_to_caps; ///
private alias c_gst_sdp_media_bandwidths_lenFn = extern(C) uint function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_bandwidths_lenFn c_gst_sdp_media_bandwidths_len; ///
private alias c_gst_sdp_media_connections_lenFn = extern(C) uint function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_connections_lenFn c_gst_sdp_media_connections_len; ///
private alias c_gst_sdp_media_copyFn = extern(C) GstSDPResult function(const(GstSDPMedia)* media, GstSDPMedia** copy) nothrow;
__gshared c_gst_sdp_media_copyFn c_gst_sdp_media_copy; ///
private alias c_gst_sdp_media_formats_lenFn = extern(C) uint function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_formats_lenFn c_gst_sdp_media_formats_len; ///
private alias c_gst_sdp_media_freeFn = extern(C) GstSDPResult function(GstSDPMedia* media) nothrow;
__gshared c_gst_sdp_media_freeFn c_gst_sdp_media_free; ///
private alias c_gst_sdp_media_get_attributeFn = extern(C) const(GstSDPAttribute)* function(const(GstSDPMedia)* media, uint idx) nothrow;
__gshared c_gst_sdp_media_get_attributeFn c_gst_sdp_media_get_attribute; ///
private alias c_gst_sdp_media_get_attribute_valFn = extern(C) const(char)* function(const(GstSDPMedia)* media, const(char)* key) nothrow;
__gshared c_gst_sdp_media_get_attribute_valFn c_gst_sdp_media_get_attribute_val; ///
private alias c_gst_sdp_media_get_attribute_val_nFn = extern(C) const(char)* function(const(GstSDPMedia)* media, const(char)* key, uint nth) nothrow;
__gshared c_gst_sdp_media_get_attribute_val_nFn c_gst_sdp_media_get_attribute_val_n; ///
private alias c_gst_sdp_media_get_bandwidthFn = extern(C) const(GstSDPBandwidth)* function(const(GstSDPMedia)* media, uint idx) nothrow;
__gshared c_gst_sdp_media_get_bandwidthFn c_gst_sdp_media_get_bandwidth; ///
private alias c_gst_sdp_media_get_caps_from_mediaFn = extern(C) GstCaps* function(const(GstSDPMedia)* media, int pt) nothrow;
__gshared c_gst_sdp_media_get_caps_from_mediaFn c_gst_sdp_media_get_caps_from_media; ///
private alias c_gst_sdp_media_get_connectionFn = extern(C) const(GstSDPConnection)* function(const(GstSDPMedia)* media, uint idx) nothrow;
__gshared c_gst_sdp_media_get_connectionFn c_gst_sdp_media_get_connection; ///
private alias c_gst_sdp_media_get_formatFn = extern(C) const(char)* function(const(GstSDPMedia)* media, uint idx) nothrow;
__gshared c_gst_sdp_media_get_formatFn c_gst_sdp_media_get_format; ///
private alias c_gst_sdp_media_get_informationFn = extern(C) const(char)* function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_get_informationFn c_gst_sdp_media_get_information; ///
private alias c_gst_sdp_media_get_keyFn = extern(C) const(GstSDPKey)* function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_get_keyFn c_gst_sdp_media_get_key; ///
private alias c_gst_sdp_media_get_mediaFn = extern(C) const(char)* function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_get_mediaFn c_gst_sdp_media_get_media; ///
private alias c_gst_sdp_media_get_num_portsFn = extern(C) uint function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_get_num_portsFn c_gst_sdp_media_get_num_ports; ///
private alias c_gst_sdp_media_get_portFn = extern(C) uint function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_get_portFn c_gst_sdp_media_get_port; ///
private alias c_gst_sdp_media_get_protoFn = extern(C) const(char)* function(const(GstSDPMedia)* media) nothrow;
__gshared c_gst_sdp_media_get_protoFn c_gst_sdp_media_get_proto; ///
private alias c_gst_sdp_media_insert_attributeFn = extern(C) GstSDPResult function(GstSDPMedia* media, int idx, GstSDPAttribute* attr) nothrow;
__gshared c_gst_sdp_media_insert_attributeFn c_gst_sdp_media_insert_attribute; ///
private alias c_gst_sdp_media_insert_bandwidthFn = extern(C) GstSDPResult function(GstSDPMedia* media, int idx, GstSDPBandwidth* bw) nothrow;
__gshared c_gst_sdp_media_insert_bandwidthFn c_gst_sdp_media_insert_bandwidth; ///
private alias c_gst_sdp_media_insert_connectionFn = extern(C) GstSDPResult function(GstSDPMedia* media, int idx, GstSDPConnection* conn) nothrow;
__gshared c_gst_sdp_media_insert_connectionFn c_gst_sdp_media_insert_connection; ///
private alias c_gst_sdp_media_insert_formatFn = extern(C) GstSDPResult function(GstSDPMedia* media, int idx, const(char)* format) nothrow;
__gshared c_gst_sdp_media_insert_formatFn c_gst_sdp_media_insert_format; ///
private alias c_gst_sdp_media_parse_keymgmtFn = extern(C) GstSDPResult function(const(GstSDPMedia)* media, GstMIKEYMessage** mikey) nothrow;
__gshared c_gst_sdp_media_parse_keymgmtFn c_gst_sdp_media_parse_keymgmt; ///
private alias c_gst_sdp_media_remove_attributeFn = extern(C) GstSDPResult function(GstSDPMedia* media, uint idx) nothrow;
__gshared c_gst_sdp_media_remove_attributeFn c_gst_sdp_media_remove_attribute; ///
private alias c_gst_sdp_media_remove_bandwidthFn = extern(C) GstSDPResult function(GstSDPMedia* media, uint idx) nothrow;
__gshared c_gst_sdp_media_remove_bandwidthFn c_gst_sdp_media_remove_bandwidth; ///
private alias c_gst_sdp_media_remove_connectionFn = extern(C) GstSDPResult function(GstSDPMedia* media, uint idx) nothrow;
__gshared c_gst_sdp_media_remove_connectionFn c_gst_sdp_media_remove_connection; ///
private alias c_gst_sdp_media_remove_formatFn = extern(C) GstSDPResult function(GstSDPMedia* media, uint idx) nothrow;
__gshared c_gst_sdp_media_remove_formatFn c_gst_sdp_media_remove_format; ///
private alias c_gst_sdp_media_replace_attributeFn = extern(C) GstSDPResult function(GstSDPMedia* media, uint idx, GstSDPAttribute* attr) nothrow;
__gshared c_gst_sdp_media_replace_attributeFn c_gst_sdp_media_replace_attribute; ///
private alias c_gst_sdp_media_replace_bandwidthFn = extern(C) GstSDPResult function(GstSDPMedia* media, uint idx, GstSDPBandwidth* bw) nothrow;
__gshared c_gst_sdp_media_replace_bandwidthFn c_gst_sdp_media_replace_bandwidth; ///
private alias c_gst_sdp_media_replace_connectionFn = extern(C) GstSDPResult function(GstSDPMedia* media, uint idx, GstSDPConnection* conn) nothrow;
__gshared c_gst_sdp_media_replace_connectionFn c_gst_sdp_media_replace_connection; ///
private alias c_gst_sdp_media_replace_formatFn = extern(C) GstSDPResult function(GstSDPMedia* media, uint idx, const(char)* format) nothrow;
__gshared c_gst_sdp_media_replace_formatFn c_gst_sdp_media_replace_format; ///
private alias c_gst_sdp_media_set_informationFn = extern(C) GstSDPResult function(GstSDPMedia* media, const(char)* information) nothrow;
__gshared c_gst_sdp_media_set_informationFn c_gst_sdp_media_set_information; ///
private alias c_gst_sdp_media_set_keyFn = extern(C) GstSDPResult function(GstSDPMedia* media, const(char)* type, const(char)* data) nothrow;
__gshared c_gst_sdp_media_set_keyFn c_gst_sdp_media_set_key; ///
private alias c_gst_sdp_media_set_mediaFn = extern(C) GstSDPResult function(GstSDPMedia* media, const(char)* med) nothrow;
__gshared c_gst_sdp_media_set_mediaFn c_gst_sdp_media_set_media; ///
private alias c_gst_sdp_media_set_port_infoFn = extern(C) GstSDPResult function(GstSDPMedia* media, uint port, uint numPorts) nothrow;
__gshared c_gst_sdp_media_set_port_infoFn c_gst_sdp_media_set_port_info; ///
private alias c_gst_sdp_media_set_protoFn = extern(C) GstSDPResult function(GstSDPMedia* media, const(char)* proto) nothrow;
__gshared c_gst_sdp_media_set_protoFn c_gst_sdp_media_set_proto; ///
private alias c_gst_sdp_media_uninitFn = extern(C) GstSDPResult function(GstSDPMedia* media) nothrow;
__gshared c_gst_sdp_media_uninitFn c_gst_sdp_media_uninit; ///
private alias c_gst_sdp_media_add_media_from_structureFn = extern(C) GstSDPResult function(const(GstStructure)* structure, GstSDPMedia* media) nothrow;
__gshared c_gst_sdp_media_add_media_from_structureFn c_gst_sdp_media_add_media_from_structure; ///
private alias c_gst_sdp_media_initFn = extern(C) GstSDPResult function(GstSDPMedia* media) nothrow;
__gshared c_gst_sdp_media_initFn c_gst_sdp_media_init; ///
private alias c_gst_sdp_media_newFn = extern(C) GstSDPResult function(GstSDPMedia** media) nothrow;
__gshared c_gst_sdp_media_newFn c_gst_sdp_media_new; ///
private alias c_gst_sdp_media_set_media_from_capsFn = extern(C) GstSDPResult function(const(GstCaps)* caps, GstSDPMedia* media) nothrow;
__gshared c_gst_sdp_media_set_media_from_capsFn c_gst_sdp_media_set_media_from_caps; ///

// SDPMessage
private alias c_gst_sdp_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_sdp_message_get_typeFn c_gst_sdp_message_get_type; ///
private alias c_gst_sdp_message_add_attributeFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* key, const(char)* value) nothrow;
__gshared c_gst_sdp_message_add_attributeFn c_gst_sdp_message_add_attribute; ///
private alias c_gst_sdp_message_add_bandwidthFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* bwtype, uint bandwidth) nothrow;
__gshared c_gst_sdp_message_add_bandwidthFn c_gst_sdp_message_add_bandwidth; ///
private alias c_gst_sdp_message_add_emailFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* email) nothrow;
__gshared c_gst_sdp_message_add_emailFn c_gst_sdp_message_add_email; ///
private alias c_gst_sdp_message_add_mediaFn = extern(C) GstSDPResult function(GstSDPMessage* msg, GstSDPMedia* media) nothrow;
__gshared c_gst_sdp_message_add_mediaFn c_gst_sdp_message_add_media; ///
private alias c_gst_sdp_message_add_phoneFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* phone) nothrow;
__gshared c_gst_sdp_message_add_phoneFn c_gst_sdp_message_add_phone; ///
private alias c_gst_sdp_message_add_timeFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* start, const(char)* stop, const(char*)* repeat) nothrow;
__gshared c_gst_sdp_message_add_timeFn c_gst_sdp_message_add_time; ///
private alias c_gst_sdp_message_add_zoneFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* adjTime, const(char)* typedTime) nothrow;
__gshared c_gst_sdp_message_add_zoneFn c_gst_sdp_message_add_zone; ///
private alias c_gst_sdp_message_as_textFn = extern(C) char* function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_as_textFn c_gst_sdp_message_as_text; ///
private alias c_gst_sdp_message_attributes_lenFn = extern(C) uint function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_attributes_lenFn c_gst_sdp_message_attributes_len; ///
private alias c_gst_sdp_message_attributes_to_capsFn = extern(C) GstSDPResult function(const(GstSDPMessage)* msg, GstCaps* caps) nothrow;
__gshared c_gst_sdp_message_attributes_to_capsFn c_gst_sdp_message_attributes_to_caps; ///
private alias c_gst_sdp_message_bandwidths_lenFn = extern(C) uint function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_bandwidths_lenFn c_gst_sdp_message_bandwidths_len; ///
private alias c_gst_sdp_message_copyFn = extern(C) GstSDPResult function(const(GstSDPMessage)* msg, GstSDPMessage** copy) nothrow;
__gshared c_gst_sdp_message_copyFn c_gst_sdp_message_copy; ///
private alias c_gst_sdp_message_dumpFn = extern(C) GstSDPResult function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_dumpFn c_gst_sdp_message_dump; ///
private alias c_gst_sdp_message_emails_lenFn = extern(C) uint function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_emails_lenFn c_gst_sdp_message_emails_len; ///
private alias c_gst_sdp_message_freeFn = extern(C) GstSDPResult function(GstSDPMessage* msg) nothrow;
__gshared c_gst_sdp_message_freeFn c_gst_sdp_message_free; ///
private alias c_gst_sdp_message_get_attributeFn = extern(C) const(GstSDPAttribute)* function(const(GstSDPMessage)* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_get_attributeFn c_gst_sdp_message_get_attribute; ///
private alias c_gst_sdp_message_get_attribute_valFn = extern(C) const(char)* function(const(GstSDPMessage)* msg, const(char)* key) nothrow;
__gshared c_gst_sdp_message_get_attribute_valFn c_gst_sdp_message_get_attribute_val; ///
private alias c_gst_sdp_message_get_attribute_val_nFn = extern(C) const(char)* function(const(GstSDPMessage)* msg, const(char)* key, uint nth) nothrow;
__gshared c_gst_sdp_message_get_attribute_val_nFn c_gst_sdp_message_get_attribute_val_n; ///
private alias c_gst_sdp_message_get_bandwidthFn = extern(C) const(GstSDPBandwidth)* function(const(GstSDPMessage)* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_get_bandwidthFn c_gst_sdp_message_get_bandwidth; ///
private alias c_gst_sdp_message_get_connectionFn = extern(C) const(GstSDPConnection)* function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_get_connectionFn c_gst_sdp_message_get_connection; ///
private alias c_gst_sdp_message_get_emailFn = extern(C) const(char)* function(const(GstSDPMessage)* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_get_emailFn c_gst_sdp_message_get_email; ///
private alias c_gst_sdp_message_get_informationFn = extern(C) const(char)* function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_get_informationFn c_gst_sdp_message_get_information; ///
private alias c_gst_sdp_message_get_keyFn = extern(C) const(GstSDPKey)* function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_get_keyFn c_gst_sdp_message_get_key; ///
private alias c_gst_sdp_message_get_mediaFn = extern(C) const(GstSDPMedia)* function(const(GstSDPMessage)* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_get_mediaFn c_gst_sdp_message_get_media; ///
private alias c_gst_sdp_message_get_originFn = extern(C) const(GstSDPOrigin)* function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_get_originFn c_gst_sdp_message_get_origin; ///
private alias c_gst_sdp_message_get_phoneFn = extern(C) const(char)* function(const(GstSDPMessage)* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_get_phoneFn c_gst_sdp_message_get_phone; ///
private alias c_gst_sdp_message_get_session_nameFn = extern(C) const(char)* function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_get_session_nameFn c_gst_sdp_message_get_session_name; ///
private alias c_gst_sdp_message_get_timeFn = extern(C) const(GstSDPTime)* function(const(GstSDPMessage)* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_get_timeFn c_gst_sdp_message_get_time; ///
private alias c_gst_sdp_message_get_uriFn = extern(C) const(char)* function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_get_uriFn c_gst_sdp_message_get_uri; ///
private alias c_gst_sdp_message_get_versionFn = extern(C) const(char)* function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_get_versionFn c_gst_sdp_message_get_version; ///
private alias c_gst_sdp_message_get_zoneFn = extern(C) const(GstSDPZone)* function(const(GstSDPMessage)* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_get_zoneFn c_gst_sdp_message_get_zone; ///
private alias c_gst_sdp_message_insert_attributeFn = extern(C) GstSDPResult function(GstSDPMessage* msg, int idx, GstSDPAttribute* attr) nothrow;
__gshared c_gst_sdp_message_insert_attributeFn c_gst_sdp_message_insert_attribute; ///
private alias c_gst_sdp_message_insert_bandwidthFn = extern(C) GstSDPResult function(GstSDPMessage* msg, int idx, GstSDPBandwidth* bw) nothrow;
__gshared c_gst_sdp_message_insert_bandwidthFn c_gst_sdp_message_insert_bandwidth; ///
private alias c_gst_sdp_message_insert_emailFn = extern(C) GstSDPResult function(GstSDPMessage* msg, int idx, const(char)* email) nothrow;
__gshared c_gst_sdp_message_insert_emailFn c_gst_sdp_message_insert_email; ///
private alias c_gst_sdp_message_insert_phoneFn = extern(C) GstSDPResult function(GstSDPMessage* msg, int idx, const(char)* phone) nothrow;
__gshared c_gst_sdp_message_insert_phoneFn c_gst_sdp_message_insert_phone; ///
private alias c_gst_sdp_message_insert_timeFn = extern(C) GstSDPResult function(GstSDPMessage* msg, int idx, GstSDPTime* t) nothrow;
__gshared c_gst_sdp_message_insert_timeFn c_gst_sdp_message_insert_time; ///
private alias c_gst_sdp_message_insert_zoneFn = extern(C) GstSDPResult function(GstSDPMessage* msg, int idx, GstSDPZone* zone) nothrow;
__gshared c_gst_sdp_message_insert_zoneFn c_gst_sdp_message_insert_zone; ///
private alias c_gst_sdp_message_medias_lenFn = extern(C) uint function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_medias_lenFn c_gst_sdp_message_medias_len; ///
private alias c_gst_sdp_message_parse_keymgmtFn = extern(C) GstSDPResult function(const(GstSDPMessage)* msg, GstMIKEYMessage** mikey) nothrow;
__gshared c_gst_sdp_message_parse_keymgmtFn c_gst_sdp_message_parse_keymgmt; ///
private alias c_gst_sdp_message_phones_lenFn = extern(C) uint function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_phones_lenFn c_gst_sdp_message_phones_len; ///
private alias c_gst_sdp_message_remove_attributeFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_remove_attributeFn c_gst_sdp_message_remove_attribute; ///
private alias c_gst_sdp_message_remove_bandwidthFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_remove_bandwidthFn c_gst_sdp_message_remove_bandwidth; ///
private alias c_gst_sdp_message_remove_emailFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_remove_emailFn c_gst_sdp_message_remove_email; ///
private alias c_gst_sdp_message_remove_mediaFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_remove_mediaFn c_gst_sdp_message_remove_media; ///
private alias c_gst_sdp_message_remove_phoneFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_remove_phoneFn c_gst_sdp_message_remove_phone; ///
private alias c_gst_sdp_message_remove_timeFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_remove_timeFn c_gst_sdp_message_remove_time; ///
private alias c_gst_sdp_message_remove_zoneFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx) nothrow;
__gshared c_gst_sdp_message_remove_zoneFn c_gst_sdp_message_remove_zone; ///
private alias c_gst_sdp_message_replace_attributeFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx, GstSDPAttribute* attr) nothrow;
__gshared c_gst_sdp_message_replace_attributeFn c_gst_sdp_message_replace_attribute; ///
private alias c_gst_sdp_message_replace_bandwidthFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx, GstSDPBandwidth* bw) nothrow;
__gshared c_gst_sdp_message_replace_bandwidthFn c_gst_sdp_message_replace_bandwidth; ///
private alias c_gst_sdp_message_replace_emailFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx, const(char)* email) nothrow;
__gshared c_gst_sdp_message_replace_emailFn c_gst_sdp_message_replace_email; ///
private alias c_gst_sdp_message_replace_phoneFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx, const(char)* phone) nothrow;
__gshared c_gst_sdp_message_replace_phoneFn c_gst_sdp_message_replace_phone; ///
private alias c_gst_sdp_message_replace_timeFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx, GstSDPTime* t) nothrow;
__gshared c_gst_sdp_message_replace_timeFn c_gst_sdp_message_replace_time; ///
private alias c_gst_sdp_message_replace_zoneFn = extern(C) GstSDPResult function(GstSDPMessage* msg, uint idx, GstSDPZone* zone) nothrow;
__gshared c_gst_sdp_message_replace_zoneFn c_gst_sdp_message_replace_zone; ///
private alias c_gst_sdp_message_set_connectionFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* nettype, const(char)* addrtype, const(char)* address, uint ttl, uint addrNumber) nothrow;
__gshared c_gst_sdp_message_set_connectionFn c_gst_sdp_message_set_connection; ///
private alias c_gst_sdp_message_set_informationFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* information) nothrow;
__gshared c_gst_sdp_message_set_informationFn c_gst_sdp_message_set_information; ///
private alias c_gst_sdp_message_set_keyFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* type, const(char)* data) nothrow;
__gshared c_gst_sdp_message_set_keyFn c_gst_sdp_message_set_key; ///
private alias c_gst_sdp_message_set_originFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* username, const(char)* sessId, const(char)* sessVersion, const(char)* nettype, const(char)* addrtype, const(char)* addr) nothrow;
__gshared c_gst_sdp_message_set_originFn c_gst_sdp_message_set_origin; ///
private alias c_gst_sdp_message_set_session_nameFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* sessionName) nothrow;
__gshared c_gst_sdp_message_set_session_nameFn c_gst_sdp_message_set_session_name; ///
private alias c_gst_sdp_message_set_uriFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* uri) nothrow;
__gshared c_gst_sdp_message_set_uriFn c_gst_sdp_message_set_uri; ///
private alias c_gst_sdp_message_set_versionFn = extern(C) GstSDPResult function(GstSDPMessage* msg, const(char)* version_) nothrow;
__gshared c_gst_sdp_message_set_versionFn c_gst_sdp_message_set_version; ///
private alias c_gst_sdp_message_times_lenFn = extern(C) uint function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_times_lenFn c_gst_sdp_message_times_len; ///
private alias c_gst_sdp_message_uninitFn = extern(C) GstSDPResult function(GstSDPMessage* msg) nothrow;
__gshared c_gst_sdp_message_uninitFn c_gst_sdp_message_uninit; ///
private alias c_gst_sdp_message_zones_lenFn = extern(C) uint function(const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_zones_lenFn c_gst_sdp_message_zones_len; ///
private alias c_gst_sdp_message_as_uriFn = extern(C) char* function(const(char)* scheme, const(GstSDPMessage)* msg) nothrow;
__gshared c_gst_sdp_message_as_uriFn c_gst_sdp_message_as_uri; ///
private alias c_gst_sdp_message_initFn = extern(C) GstSDPResult function(GstSDPMessage* msg) nothrow;
__gshared c_gst_sdp_message_initFn c_gst_sdp_message_init; ///
private alias c_gst_sdp_message_newFn = extern(C) GstSDPResult function(GstSDPMessage** msg) nothrow;
__gshared c_gst_sdp_message_newFn c_gst_sdp_message_new; ///
private alias c_gst_sdp_message_new_from_textFn = extern(C) GstSDPResult function(const(char)* text, GstSDPMessage** msg) nothrow;
__gshared c_gst_sdp_message_new_from_textFn c_gst_sdp_message_new_from_text; ///
private alias c_gst_sdp_message_parse_bufferFn = extern(C) GstSDPResult function(const(ubyte)* data, uint size, GstSDPMessage* msg) nothrow;
__gshared c_gst_sdp_message_parse_bufferFn c_gst_sdp_message_parse_buffer; ///
private alias c_gst_sdp_message_parse_uriFn = extern(C) GstSDPResult function(const(char)* uri, GstSDPMessage* msg) nothrow;
__gshared c_gst_sdp_message_parse_uriFn c_gst_sdp_message_parse_uri; ///

// SDPTime
private alias c_gst_sdp_time_clearFn = extern(C) GstSDPResult function(GstSDPTime* t) nothrow;
__gshared c_gst_sdp_time_clearFn c_gst_sdp_time_clear; ///
private alias c_gst_sdp_time_setFn = extern(C) GstSDPResult function(GstSDPTime* t, const(char)* start, const(char)* stop, const(char*)* repeat) nothrow;
__gshared c_gst_sdp_time_setFn c_gst_sdp_time_set; ///

// SDPZone
private alias c_gst_sdp_zone_clearFn = extern(C) GstSDPResult function(GstSDPZone* zone) nothrow;
__gshared c_gst_sdp_zone_clearFn c_gst_sdp_zone_clear; ///
private alias c_gst_sdp_zone_setFn = extern(C) GstSDPResult function(GstSDPZone* zone, const(char)* adjTime, const(char)* typedTime) nothrow;
__gshared c_gst_sdp_zone_setFn c_gst_sdp_zone_set; ///

// global
private alias c_gst_sdp_address_is_multicastFn = extern(C) gboolean function(const(char)* nettype, const(char)* addrtype, const(char)* addr) nothrow;
__gshared c_gst_sdp_address_is_multicastFn c_gst_sdp_address_is_multicast; ///
private alias c_gst_sdp_make_keymgmtFn = extern(C) char* function(const(char)* uri, const(char)* base64) nothrow;
__gshared c_gst_sdp_make_keymgmtFn c_gst_sdp_make_keymgmt; ///

// MIKEYMessage

/** */
alias gst_mikey_message_get_type = c_gst_mikey_message_get_type;

/** */
alias gst_mikey_message_new = c_gst_mikey_message_new;

/** */
alias gst_mikey_message_new_from_bytes = c_gst_mikey_message_new_from_bytes;

/** */
alias gst_mikey_message_new_from_caps = c_gst_mikey_message_new_from_caps;

/** */
alias gst_mikey_message_new_from_data = c_gst_mikey_message_new_from_data;

/** */
alias gst_mikey_message_add_cs_srtp = c_gst_mikey_message_add_cs_srtp;

/** */
alias gst_mikey_message_add_payload = c_gst_mikey_message_add_payload;

/** */
alias gst_mikey_message_add_pke = c_gst_mikey_message_add_pke;

/** */
alias gst_mikey_message_add_rand = c_gst_mikey_message_add_rand;

/** */
alias gst_mikey_message_add_rand_len = c_gst_mikey_message_add_rand_len;

/** */
alias gst_mikey_message_add_t = c_gst_mikey_message_add_t;

/** */
alias gst_mikey_message_add_t_now_ntp_utc = c_gst_mikey_message_add_t_now_ntp_utc;

/** */
alias gst_mikey_message_base64_encode = c_gst_mikey_message_base64_encode;

/** */
alias gst_mikey_message_find_payload = c_gst_mikey_message_find_payload;

/** */
alias gst_mikey_message_get_cs_srtp = c_gst_mikey_message_get_cs_srtp;

/** */
alias gst_mikey_message_get_n_cs = c_gst_mikey_message_get_n_cs;

/** */
alias gst_mikey_message_get_n_payloads = c_gst_mikey_message_get_n_payloads;

/** */
alias gst_mikey_message_get_payload = c_gst_mikey_message_get_payload;

/** */
alias gst_mikey_message_insert_cs_srtp = c_gst_mikey_message_insert_cs_srtp;

/** */
alias gst_mikey_message_insert_payload = c_gst_mikey_message_insert_payload;

/** */
alias gst_mikey_message_remove_cs_srtp = c_gst_mikey_message_remove_cs_srtp;

/** */
alias gst_mikey_message_remove_payload = c_gst_mikey_message_remove_payload;

/** */
alias gst_mikey_message_replace_cs_srtp = c_gst_mikey_message_replace_cs_srtp;

/** */
alias gst_mikey_message_replace_payload = c_gst_mikey_message_replace_payload;

/** */
alias gst_mikey_message_set_info = c_gst_mikey_message_set_info;

/** */
alias gst_mikey_message_to_bytes = c_gst_mikey_message_to_bytes;

/** */
alias gst_mikey_message_to_caps = c_gst_mikey_message_to_caps;

// MIKEYPayload

/** */
alias gst_mikey_payload_get_type = c_gst_mikey_payload_get_type;

/** */
alias gst_mikey_payload_new = c_gst_mikey_payload_new;

/** */
alias gst_mikey_payload_kemac_add_sub = c_gst_mikey_payload_kemac_add_sub;

/** */
alias gst_mikey_payload_kemac_get_n_sub = c_gst_mikey_payload_kemac_get_n_sub;

/** */
alias gst_mikey_payload_kemac_get_sub = c_gst_mikey_payload_kemac_get_sub;

/** */
alias gst_mikey_payload_kemac_remove_sub = c_gst_mikey_payload_kemac_remove_sub;

/** */
alias gst_mikey_payload_kemac_set = c_gst_mikey_payload_kemac_set;

/** */
alias gst_mikey_payload_key_data_set_interval = c_gst_mikey_payload_key_data_set_interval;

/** */
alias gst_mikey_payload_key_data_set_key = c_gst_mikey_payload_key_data_set_key;

/** */
alias gst_mikey_payload_key_data_set_salt = c_gst_mikey_payload_key_data_set_salt;

/** */
alias gst_mikey_payload_key_data_set_spi = c_gst_mikey_payload_key_data_set_spi;

/** */
alias gst_mikey_payload_pke_set = c_gst_mikey_payload_pke_set;

/** */
alias gst_mikey_payload_rand_set = c_gst_mikey_payload_rand_set;

/** */
alias gst_mikey_payload_sp_add_param = c_gst_mikey_payload_sp_add_param;

/** */
alias gst_mikey_payload_sp_get_n_params = c_gst_mikey_payload_sp_get_n_params;

/** */
alias gst_mikey_payload_sp_get_param = c_gst_mikey_payload_sp_get_param;

/** */
alias gst_mikey_payload_sp_remove_param = c_gst_mikey_payload_sp_remove_param;

/** */
alias gst_mikey_payload_sp_set = c_gst_mikey_payload_sp_set;

/** */
alias gst_mikey_payload_t_set = c_gst_mikey_payload_t_set;

// SDPAttribute

/** */
alias gst_sdp_attribute_clear = c_gst_sdp_attribute_clear;

/** */
alias gst_sdp_attribute_set = c_gst_sdp_attribute_set;

// SDPBandwidth

/** */
alias gst_sdp_bandwidth_clear = c_gst_sdp_bandwidth_clear;

/** */
alias gst_sdp_bandwidth_set = c_gst_sdp_bandwidth_set;

// SDPConnection

/** */
alias gst_sdp_connection_clear = c_gst_sdp_connection_clear;

/** */
alias gst_sdp_connection_set = c_gst_sdp_connection_set;

// SDPMedia

/** */
alias gst_sdp_media_add_attribute = c_gst_sdp_media_add_attribute;

/** */
alias gst_sdp_media_add_bandwidth = c_gst_sdp_media_add_bandwidth;

/** */
alias gst_sdp_media_add_connection = c_gst_sdp_media_add_connection;

/** */
alias gst_sdp_media_add_format = c_gst_sdp_media_add_format;

/** */
alias gst_sdp_media_as_text = c_gst_sdp_media_as_text;

/** */
alias gst_sdp_media_attributes_len = c_gst_sdp_media_attributes_len;

/** */
alias gst_sdp_media_attributes_to_caps = c_gst_sdp_media_attributes_to_caps;

/** */
alias gst_sdp_media_bandwidths_len = c_gst_sdp_media_bandwidths_len;

/** */
alias gst_sdp_media_connections_len = c_gst_sdp_media_connections_len;

/** */
alias gst_sdp_media_copy = c_gst_sdp_media_copy;

/** */
alias gst_sdp_media_formats_len = c_gst_sdp_media_formats_len;

/** */
alias gst_sdp_media_free = c_gst_sdp_media_free;

/** */
alias gst_sdp_media_get_attribute = c_gst_sdp_media_get_attribute;

/** */
alias gst_sdp_media_get_attribute_val = c_gst_sdp_media_get_attribute_val;

/** */
alias gst_sdp_media_get_attribute_val_n = c_gst_sdp_media_get_attribute_val_n;

/** */
alias gst_sdp_media_get_bandwidth = c_gst_sdp_media_get_bandwidth;

/** */
alias gst_sdp_media_get_caps_from_media = c_gst_sdp_media_get_caps_from_media;

/** */
alias gst_sdp_media_get_connection = c_gst_sdp_media_get_connection;

/** */
alias gst_sdp_media_get_format = c_gst_sdp_media_get_format;

/** */
alias gst_sdp_media_get_information = c_gst_sdp_media_get_information;

/** */
alias gst_sdp_media_get_key = c_gst_sdp_media_get_key;

/** */
alias gst_sdp_media_get_media = c_gst_sdp_media_get_media;

/** */
alias gst_sdp_media_get_num_ports = c_gst_sdp_media_get_num_ports;

/** */
alias gst_sdp_media_get_port = c_gst_sdp_media_get_port;

/** */
alias gst_sdp_media_get_proto = c_gst_sdp_media_get_proto;

/** */
alias gst_sdp_media_insert_attribute = c_gst_sdp_media_insert_attribute;

/** */
alias gst_sdp_media_insert_bandwidth = c_gst_sdp_media_insert_bandwidth;

/** */
alias gst_sdp_media_insert_connection = c_gst_sdp_media_insert_connection;

/** */
alias gst_sdp_media_insert_format = c_gst_sdp_media_insert_format;

/** */
alias gst_sdp_media_parse_keymgmt = c_gst_sdp_media_parse_keymgmt;

/** */
alias gst_sdp_media_remove_attribute = c_gst_sdp_media_remove_attribute;

/** */
alias gst_sdp_media_remove_bandwidth = c_gst_sdp_media_remove_bandwidth;

/** */
alias gst_sdp_media_remove_connection = c_gst_sdp_media_remove_connection;

/** */
alias gst_sdp_media_remove_format = c_gst_sdp_media_remove_format;

/** */
alias gst_sdp_media_replace_attribute = c_gst_sdp_media_replace_attribute;

/** */
alias gst_sdp_media_replace_bandwidth = c_gst_sdp_media_replace_bandwidth;

/** */
alias gst_sdp_media_replace_connection = c_gst_sdp_media_replace_connection;

/** */
alias gst_sdp_media_replace_format = c_gst_sdp_media_replace_format;

/** */
alias gst_sdp_media_set_information = c_gst_sdp_media_set_information;

/** */
alias gst_sdp_media_set_key = c_gst_sdp_media_set_key;

/** */
alias gst_sdp_media_set_media = c_gst_sdp_media_set_media;

/** */
alias gst_sdp_media_set_port_info = c_gst_sdp_media_set_port_info;

/** */
alias gst_sdp_media_set_proto = c_gst_sdp_media_set_proto;

/** */
alias gst_sdp_media_uninit = c_gst_sdp_media_uninit;

/** */
alias gst_sdp_media_add_media_from_structure = c_gst_sdp_media_add_media_from_structure;

/** */
alias gst_sdp_media_init = c_gst_sdp_media_init;

/** */
alias gst_sdp_media_new = c_gst_sdp_media_new;

/** */
alias gst_sdp_media_set_media_from_caps = c_gst_sdp_media_set_media_from_caps;

// SDPMessage

/** */
alias gst_sdp_message_get_type = c_gst_sdp_message_get_type;

/** */
alias gst_sdp_message_add_attribute = c_gst_sdp_message_add_attribute;

/** */
alias gst_sdp_message_add_bandwidth = c_gst_sdp_message_add_bandwidth;

/** */
alias gst_sdp_message_add_email = c_gst_sdp_message_add_email;

/** */
alias gst_sdp_message_add_media = c_gst_sdp_message_add_media;

/** */
alias gst_sdp_message_add_phone = c_gst_sdp_message_add_phone;

/** */
alias gst_sdp_message_add_time = c_gst_sdp_message_add_time;

/** */
alias gst_sdp_message_add_zone = c_gst_sdp_message_add_zone;

/** */
alias gst_sdp_message_as_text = c_gst_sdp_message_as_text;

/** */
alias gst_sdp_message_attributes_len = c_gst_sdp_message_attributes_len;

/** */
alias gst_sdp_message_attributes_to_caps = c_gst_sdp_message_attributes_to_caps;

/** */
alias gst_sdp_message_bandwidths_len = c_gst_sdp_message_bandwidths_len;

/** */
alias gst_sdp_message_copy = c_gst_sdp_message_copy;

/** */
alias gst_sdp_message_dump = c_gst_sdp_message_dump;

/** */
alias gst_sdp_message_emails_len = c_gst_sdp_message_emails_len;

/** */
alias gst_sdp_message_free = c_gst_sdp_message_free;

/** */
alias gst_sdp_message_get_attribute = c_gst_sdp_message_get_attribute;

/** */
alias gst_sdp_message_get_attribute_val = c_gst_sdp_message_get_attribute_val;

/** */
alias gst_sdp_message_get_attribute_val_n = c_gst_sdp_message_get_attribute_val_n;

/** */
alias gst_sdp_message_get_bandwidth = c_gst_sdp_message_get_bandwidth;

/** */
alias gst_sdp_message_get_connection = c_gst_sdp_message_get_connection;

/** */
alias gst_sdp_message_get_email = c_gst_sdp_message_get_email;

/** */
alias gst_sdp_message_get_information = c_gst_sdp_message_get_information;

/** */
alias gst_sdp_message_get_key = c_gst_sdp_message_get_key;

/** */
alias gst_sdp_message_get_media = c_gst_sdp_message_get_media;

/** */
alias gst_sdp_message_get_origin = c_gst_sdp_message_get_origin;

/** */
alias gst_sdp_message_get_phone = c_gst_sdp_message_get_phone;

/** */
alias gst_sdp_message_get_session_name = c_gst_sdp_message_get_session_name;

/** */
alias gst_sdp_message_get_time = c_gst_sdp_message_get_time;

/** */
alias gst_sdp_message_get_uri = c_gst_sdp_message_get_uri;

/** */
alias gst_sdp_message_get_version = c_gst_sdp_message_get_version;

/** */
alias gst_sdp_message_get_zone = c_gst_sdp_message_get_zone;

/** */
alias gst_sdp_message_insert_attribute = c_gst_sdp_message_insert_attribute;

/** */
alias gst_sdp_message_insert_bandwidth = c_gst_sdp_message_insert_bandwidth;

/** */
alias gst_sdp_message_insert_email = c_gst_sdp_message_insert_email;

/** */
alias gst_sdp_message_insert_phone = c_gst_sdp_message_insert_phone;

/** */
alias gst_sdp_message_insert_time = c_gst_sdp_message_insert_time;

/** */
alias gst_sdp_message_insert_zone = c_gst_sdp_message_insert_zone;

/** */
alias gst_sdp_message_medias_len = c_gst_sdp_message_medias_len;

/** */
alias gst_sdp_message_parse_keymgmt = c_gst_sdp_message_parse_keymgmt;

/** */
alias gst_sdp_message_phones_len = c_gst_sdp_message_phones_len;

/** */
alias gst_sdp_message_remove_attribute = c_gst_sdp_message_remove_attribute;

/** */
alias gst_sdp_message_remove_bandwidth = c_gst_sdp_message_remove_bandwidth;

/** */
alias gst_sdp_message_remove_email = c_gst_sdp_message_remove_email;

/** */
alias gst_sdp_message_remove_media = c_gst_sdp_message_remove_media;

/** */
alias gst_sdp_message_remove_phone = c_gst_sdp_message_remove_phone;

/** */
alias gst_sdp_message_remove_time = c_gst_sdp_message_remove_time;

/** */
alias gst_sdp_message_remove_zone = c_gst_sdp_message_remove_zone;

/** */
alias gst_sdp_message_replace_attribute = c_gst_sdp_message_replace_attribute;

/** */
alias gst_sdp_message_replace_bandwidth = c_gst_sdp_message_replace_bandwidth;

/** */
alias gst_sdp_message_replace_email = c_gst_sdp_message_replace_email;

/** */
alias gst_sdp_message_replace_phone = c_gst_sdp_message_replace_phone;

/** */
alias gst_sdp_message_replace_time = c_gst_sdp_message_replace_time;

/** */
alias gst_sdp_message_replace_zone = c_gst_sdp_message_replace_zone;

/** */
alias gst_sdp_message_set_connection = c_gst_sdp_message_set_connection;

/** */
alias gst_sdp_message_set_information = c_gst_sdp_message_set_information;

/** */
alias gst_sdp_message_set_key = c_gst_sdp_message_set_key;

/** */
alias gst_sdp_message_set_origin = c_gst_sdp_message_set_origin;

/** */
alias gst_sdp_message_set_session_name = c_gst_sdp_message_set_session_name;

/** */
alias gst_sdp_message_set_uri = c_gst_sdp_message_set_uri;

/** */
alias gst_sdp_message_set_version = c_gst_sdp_message_set_version;

/** */
alias gst_sdp_message_times_len = c_gst_sdp_message_times_len;

/** */
alias gst_sdp_message_uninit = c_gst_sdp_message_uninit;

/** */
alias gst_sdp_message_zones_len = c_gst_sdp_message_zones_len;

/** */
alias gst_sdp_message_as_uri = c_gst_sdp_message_as_uri;

/** */
alias gst_sdp_message_init = c_gst_sdp_message_init;

/** */
alias gst_sdp_message_new = c_gst_sdp_message_new;

/** */
alias gst_sdp_message_new_from_text = c_gst_sdp_message_new_from_text;

/** */
alias gst_sdp_message_parse_buffer = c_gst_sdp_message_parse_buffer;

/** */
alias gst_sdp_message_parse_uri = c_gst_sdp_message_parse_uri;

// SDPTime

/** */
alias gst_sdp_time_clear = c_gst_sdp_time_clear;

/** */
alias gst_sdp_time_set = c_gst_sdp_time_set;

// SDPZone

/** */
alias gst_sdp_zone_clear = c_gst_sdp_zone_clear;

/** */
alias gst_sdp_zone_set = c_gst_sdp_zone_set;

// global

/** */
alias gst_sdp_address_is_multicast = c_gst_sdp_address_is_multicast;

/** */
alias gst_sdp_make_keymgmt = c_gst_sdp_make_keymgmt;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // MIKEYMessage
  gidLink(cast(void**)&gst_mikey_message_get_type, "gst_mikey_message_get_type", libs);
  gidLink(cast(void**)&gst_mikey_message_new, "gst_mikey_message_new", libs);
  gidLink(cast(void**)&gst_mikey_message_new_from_bytes, "gst_mikey_message_new_from_bytes", libs);
  gidLink(cast(void**)&gst_mikey_message_new_from_caps, "gst_mikey_message_new_from_caps", libs);
  gidLink(cast(void**)&gst_mikey_message_new_from_data, "gst_mikey_message_new_from_data", libs);
  gidLink(cast(void**)&gst_mikey_message_add_cs_srtp, "gst_mikey_message_add_cs_srtp", libs);
  gidLink(cast(void**)&gst_mikey_message_add_payload, "gst_mikey_message_add_payload", libs);
  gidLink(cast(void**)&gst_mikey_message_add_pke, "gst_mikey_message_add_pke", libs);
  gidLink(cast(void**)&gst_mikey_message_add_rand, "gst_mikey_message_add_rand", libs);
  gidLink(cast(void**)&gst_mikey_message_add_rand_len, "gst_mikey_message_add_rand_len", libs);
  gidLink(cast(void**)&gst_mikey_message_add_t, "gst_mikey_message_add_t", libs);
  gidLink(cast(void**)&gst_mikey_message_add_t_now_ntp_utc, "gst_mikey_message_add_t_now_ntp_utc", libs);
  gidLink(cast(void**)&gst_mikey_message_base64_encode, "gst_mikey_message_base64_encode", libs);
  gidLink(cast(void**)&gst_mikey_message_find_payload, "gst_mikey_message_find_payload", libs);
  gidLink(cast(void**)&gst_mikey_message_get_cs_srtp, "gst_mikey_message_get_cs_srtp", libs);
  gidLink(cast(void**)&gst_mikey_message_get_n_cs, "gst_mikey_message_get_n_cs", libs);
  gidLink(cast(void**)&gst_mikey_message_get_n_payloads, "gst_mikey_message_get_n_payloads", libs);
  gidLink(cast(void**)&gst_mikey_message_get_payload, "gst_mikey_message_get_payload", libs);
  gidLink(cast(void**)&gst_mikey_message_insert_cs_srtp, "gst_mikey_message_insert_cs_srtp", libs);
  gidLink(cast(void**)&gst_mikey_message_insert_payload, "gst_mikey_message_insert_payload", libs);
  gidLink(cast(void**)&gst_mikey_message_remove_cs_srtp, "gst_mikey_message_remove_cs_srtp", libs);
  gidLink(cast(void**)&gst_mikey_message_remove_payload, "gst_mikey_message_remove_payload", libs);
  gidLink(cast(void**)&gst_mikey_message_replace_cs_srtp, "gst_mikey_message_replace_cs_srtp", libs);
  gidLink(cast(void**)&gst_mikey_message_replace_payload, "gst_mikey_message_replace_payload", libs);
  gidLink(cast(void**)&gst_mikey_message_set_info, "gst_mikey_message_set_info", libs);
  gidLink(cast(void**)&gst_mikey_message_to_bytes, "gst_mikey_message_to_bytes", libs);
  gidLink(cast(void**)&gst_mikey_message_to_caps, "gst_mikey_message_to_caps", libs);

  // MIKEYPayload
  gidLink(cast(void**)&gst_mikey_payload_get_type, "gst_mikey_payload_get_type", libs);
  gidLink(cast(void**)&gst_mikey_payload_new, "gst_mikey_payload_new", libs);
  gidLink(cast(void**)&gst_mikey_payload_kemac_add_sub, "gst_mikey_payload_kemac_add_sub", libs);
  gidLink(cast(void**)&gst_mikey_payload_kemac_get_n_sub, "gst_mikey_payload_kemac_get_n_sub", libs);
  gidLink(cast(void**)&gst_mikey_payload_kemac_get_sub, "gst_mikey_payload_kemac_get_sub", libs);
  gidLink(cast(void**)&gst_mikey_payload_kemac_remove_sub, "gst_mikey_payload_kemac_remove_sub", libs);
  gidLink(cast(void**)&gst_mikey_payload_kemac_set, "gst_mikey_payload_kemac_set", libs);
  gidLink(cast(void**)&gst_mikey_payload_key_data_set_interval, "gst_mikey_payload_key_data_set_interval", libs);
  gidLink(cast(void**)&gst_mikey_payload_key_data_set_key, "gst_mikey_payload_key_data_set_key", libs);
  gidLink(cast(void**)&gst_mikey_payload_key_data_set_salt, "gst_mikey_payload_key_data_set_salt", libs);
  gidLink(cast(void**)&gst_mikey_payload_key_data_set_spi, "gst_mikey_payload_key_data_set_spi", libs);
  gidLink(cast(void**)&gst_mikey_payload_pke_set, "gst_mikey_payload_pke_set", libs);
  gidLink(cast(void**)&gst_mikey_payload_rand_set, "gst_mikey_payload_rand_set", libs);
  gidLink(cast(void**)&gst_mikey_payload_sp_add_param, "gst_mikey_payload_sp_add_param", libs);
  gidLink(cast(void**)&gst_mikey_payload_sp_get_n_params, "gst_mikey_payload_sp_get_n_params", libs);
  gidLink(cast(void**)&gst_mikey_payload_sp_get_param, "gst_mikey_payload_sp_get_param", libs);
  gidLink(cast(void**)&gst_mikey_payload_sp_remove_param, "gst_mikey_payload_sp_remove_param", libs);
  gidLink(cast(void**)&gst_mikey_payload_sp_set, "gst_mikey_payload_sp_set", libs);
  gidLink(cast(void**)&gst_mikey_payload_t_set, "gst_mikey_payload_t_set", libs);

  // SDPAttribute
  gidLink(cast(void**)&gst_sdp_attribute_clear, "gst_sdp_attribute_clear", libs);
  gidLink(cast(void**)&gst_sdp_attribute_set, "gst_sdp_attribute_set", libs);

  // SDPBandwidth
  gidLink(cast(void**)&gst_sdp_bandwidth_clear, "gst_sdp_bandwidth_clear", libs);
  gidLink(cast(void**)&gst_sdp_bandwidth_set, "gst_sdp_bandwidth_set", libs);

  // SDPConnection
  gidLink(cast(void**)&gst_sdp_connection_clear, "gst_sdp_connection_clear", libs);
  gidLink(cast(void**)&gst_sdp_connection_set, "gst_sdp_connection_set", libs);

  // SDPMedia
  gidLink(cast(void**)&gst_sdp_media_add_attribute, "gst_sdp_media_add_attribute", libs);
  gidLink(cast(void**)&gst_sdp_media_add_bandwidth, "gst_sdp_media_add_bandwidth", libs);
  gidLink(cast(void**)&gst_sdp_media_add_connection, "gst_sdp_media_add_connection", libs);
  gidLink(cast(void**)&gst_sdp_media_add_format, "gst_sdp_media_add_format", libs);
  gidLink(cast(void**)&gst_sdp_media_as_text, "gst_sdp_media_as_text", libs);
  gidLink(cast(void**)&gst_sdp_media_attributes_len, "gst_sdp_media_attributes_len", libs);
  gidLink(cast(void**)&gst_sdp_media_attributes_to_caps, "gst_sdp_media_attributes_to_caps", libs);
  gidLink(cast(void**)&gst_sdp_media_bandwidths_len, "gst_sdp_media_bandwidths_len", libs);
  gidLink(cast(void**)&gst_sdp_media_connections_len, "gst_sdp_media_connections_len", libs);
  gidLink(cast(void**)&gst_sdp_media_copy, "gst_sdp_media_copy", libs);
  gidLink(cast(void**)&gst_sdp_media_formats_len, "gst_sdp_media_formats_len", libs);
  gidLink(cast(void**)&gst_sdp_media_free, "gst_sdp_media_free", libs);
  gidLink(cast(void**)&gst_sdp_media_get_attribute, "gst_sdp_media_get_attribute", libs);
  gidLink(cast(void**)&gst_sdp_media_get_attribute_val, "gst_sdp_media_get_attribute_val", libs);
  gidLink(cast(void**)&gst_sdp_media_get_attribute_val_n, "gst_sdp_media_get_attribute_val_n", libs);
  gidLink(cast(void**)&gst_sdp_media_get_bandwidth, "gst_sdp_media_get_bandwidth", libs);
  gidLink(cast(void**)&gst_sdp_media_get_caps_from_media, "gst_sdp_media_get_caps_from_media", libs);
  gidLink(cast(void**)&gst_sdp_media_get_connection, "gst_sdp_media_get_connection", libs);
  gidLink(cast(void**)&gst_sdp_media_get_format, "gst_sdp_media_get_format", libs);
  gidLink(cast(void**)&gst_sdp_media_get_information, "gst_sdp_media_get_information", libs);
  gidLink(cast(void**)&gst_sdp_media_get_key, "gst_sdp_media_get_key", libs);
  gidLink(cast(void**)&gst_sdp_media_get_media, "gst_sdp_media_get_media", libs);
  gidLink(cast(void**)&gst_sdp_media_get_num_ports, "gst_sdp_media_get_num_ports", libs);
  gidLink(cast(void**)&gst_sdp_media_get_port, "gst_sdp_media_get_port", libs);
  gidLink(cast(void**)&gst_sdp_media_get_proto, "gst_sdp_media_get_proto", libs);
  gidLink(cast(void**)&gst_sdp_media_insert_attribute, "gst_sdp_media_insert_attribute", libs);
  gidLink(cast(void**)&gst_sdp_media_insert_bandwidth, "gst_sdp_media_insert_bandwidth", libs);
  gidLink(cast(void**)&gst_sdp_media_insert_connection, "gst_sdp_media_insert_connection", libs);
  gidLink(cast(void**)&gst_sdp_media_insert_format, "gst_sdp_media_insert_format", libs);
  gidLink(cast(void**)&gst_sdp_media_parse_keymgmt, "gst_sdp_media_parse_keymgmt", libs);
  gidLink(cast(void**)&gst_sdp_media_remove_attribute, "gst_sdp_media_remove_attribute", libs);
  gidLink(cast(void**)&gst_sdp_media_remove_bandwidth, "gst_sdp_media_remove_bandwidth", libs);
  gidLink(cast(void**)&gst_sdp_media_remove_connection, "gst_sdp_media_remove_connection", libs);
  gidLink(cast(void**)&gst_sdp_media_remove_format, "gst_sdp_media_remove_format", libs);
  gidLink(cast(void**)&gst_sdp_media_replace_attribute, "gst_sdp_media_replace_attribute", libs);
  gidLink(cast(void**)&gst_sdp_media_replace_bandwidth, "gst_sdp_media_replace_bandwidth", libs);
  gidLink(cast(void**)&gst_sdp_media_replace_connection, "gst_sdp_media_replace_connection", libs);
  gidLink(cast(void**)&gst_sdp_media_replace_format, "gst_sdp_media_replace_format", libs);
  gidLink(cast(void**)&gst_sdp_media_set_information, "gst_sdp_media_set_information", libs);
  gidLink(cast(void**)&gst_sdp_media_set_key, "gst_sdp_media_set_key", libs);
  gidLink(cast(void**)&gst_sdp_media_set_media, "gst_sdp_media_set_media", libs);
  gidLink(cast(void**)&gst_sdp_media_set_port_info, "gst_sdp_media_set_port_info", libs);
  gidLink(cast(void**)&gst_sdp_media_set_proto, "gst_sdp_media_set_proto", libs);
  gidLink(cast(void**)&gst_sdp_media_uninit, "gst_sdp_media_uninit", libs);
  gidLink(cast(void**)&gst_sdp_media_add_media_from_structure, "gst_sdp_media_add_media_from_structure", libs);
  gidLink(cast(void**)&gst_sdp_media_init, "gst_sdp_media_init", libs);
  gidLink(cast(void**)&gst_sdp_media_new, "gst_sdp_media_new", libs);
  gidLink(cast(void**)&gst_sdp_media_set_media_from_caps, "gst_sdp_media_set_media_from_caps", libs);

  // SDPMessage
  gidLink(cast(void**)&gst_sdp_message_get_type, "gst_sdp_message_get_type", libs);
  gidLink(cast(void**)&gst_sdp_message_add_attribute, "gst_sdp_message_add_attribute", libs);
  gidLink(cast(void**)&gst_sdp_message_add_bandwidth, "gst_sdp_message_add_bandwidth", libs);
  gidLink(cast(void**)&gst_sdp_message_add_email, "gst_sdp_message_add_email", libs);
  gidLink(cast(void**)&gst_sdp_message_add_media, "gst_sdp_message_add_media", libs);
  gidLink(cast(void**)&gst_sdp_message_add_phone, "gst_sdp_message_add_phone", libs);
  gidLink(cast(void**)&gst_sdp_message_add_time, "gst_sdp_message_add_time", libs);
  gidLink(cast(void**)&gst_sdp_message_add_zone, "gst_sdp_message_add_zone", libs);
  gidLink(cast(void**)&gst_sdp_message_as_text, "gst_sdp_message_as_text", libs);
  gidLink(cast(void**)&gst_sdp_message_attributes_len, "gst_sdp_message_attributes_len", libs);
  gidLink(cast(void**)&gst_sdp_message_attributes_to_caps, "gst_sdp_message_attributes_to_caps", libs);
  gidLink(cast(void**)&gst_sdp_message_bandwidths_len, "gst_sdp_message_bandwidths_len", libs);
  gidLink(cast(void**)&gst_sdp_message_copy, "gst_sdp_message_copy", libs);
  gidLink(cast(void**)&gst_sdp_message_dump, "gst_sdp_message_dump", libs);
  gidLink(cast(void**)&gst_sdp_message_emails_len, "gst_sdp_message_emails_len", libs);
  gidLink(cast(void**)&gst_sdp_message_free, "gst_sdp_message_free", libs);
  gidLink(cast(void**)&gst_sdp_message_get_attribute, "gst_sdp_message_get_attribute", libs);
  gidLink(cast(void**)&gst_sdp_message_get_attribute_val, "gst_sdp_message_get_attribute_val", libs);
  gidLink(cast(void**)&gst_sdp_message_get_attribute_val_n, "gst_sdp_message_get_attribute_val_n", libs);
  gidLink(cast(void**)&gst_sdp_message_get_bandwidth, "gst_sdp_message_get_bandwidth", libs);
  gidLink(cast(void**)&gst_sdp_message_get_connection, "gst_sdp_message_get_connection", libs);
  gidLink(cast(void**)&gst_sdp_message_get_email, "gst_sdp_message_get_email", libs);
  gidLink(cast(void**)&gst_sdp_message_get_information, "gst_sdp_message_get_information", libs);
  gidLink(cast(void**)&gst_sdp_message_get_key, "gst_sdp_message_get_key", libs);
  gidLink(cast(void**)&gst_sdp_message_get_media, "gst_sdp_message_get_media", libs);
  gidLink(cast(void**)&gst_sdp_message_get_origin, "gst_sdp_message_get_origin", libs);
  gidLink(cast(void**)&gst_sdp_message_get_phone, "gst_sdp_message_get_phone", libs);
  gidLink(cast(void**)&gst_sdp_message_get_session_name, "gst_sdp_message_get_session_name", libs);
  gidLink(cast(void**)&gst_sdp_message_get_time, "gst_sdp_message_get_time", libs);
  gidLink(cast(void**)&gst_sdp_message_get_uri, "gst_sdp_message_get_uri", libs);
  gidLink(cast(void**)&gst_sdp_message_get_version, "gst_sdp_message_get_version", libs);
  gidLink(cast(void**)&gst_sdp_message_get_zone, "gst_sdp_message_get_zone", libs);
  gidLink(cast(void**)&gst_sdp_message_insert_attribute, "gst_sdp_message_insert_attribute", libs);
  gidLink(cast(void**)&gst_sdp_message_insert_bandwidth, "gst_sdp_message_insert_bandwidth", libs);
  gidLink(cast(void**)&gst_sdp_message_insert_email, "gst_sdp_message_insert_email", libs);
  gidLink(cast(void**)&gst_sdp_message_insert_phone, "gst_sdp_message_insert_phone", libs);
  gidLink(cast(void**)&gst_sdp_message_insert_time, "gst_sdp_message_insert_time", libs);
  gidLink(cast(void**)&gst_sdp_message_insert_zone, "gst_sdp_message_insert_zone", libs);
  gidLink(cast(void**)&gst_sdp_message_medias_len, "gst_sdp_message_medias_len", libs);
  gidLink(cast(void**)&gst_sdp_message_parse_keymgmt, "gst_sdp_message_parse_keymgmt", libs);
  gidLink(cast(void**)&gst_sdp_message_phones_len, "gst_sdp_message_phones_len", libs);
  gidLink(cast(void**)&gst_sdp_message_remove_attribute, "gst_sdp_message_remove_attribute", libs);
  gidLink(cast(void**)&gst_sdp_message_remove_bandwidth, "gst_sdp_message_remove_bandwidth", libs);
  gidLink(cast(void**)&gst_sdp_message_remove_email, "gst_sdp_message_remove_email", libs);
  gidLink(cast(void**)&gst_sdp_message_remove_media, "gst_sdp_message_remove_media", libs);
  gidLink(cast(void**)&gst_sdp_message_remove_phone, "gst_sdp_message_remove_phone", libs);
  gidLink(cast(void**)&gst_sdp_message_remove_time, "gst_sdp_message_remove_time", libs);
  gidLink(cast(void**)&gst_sdp_message_remove_zone, "gst_sdp_message_remove_zone", libs);
  gidLink(cast(void**)&gst_sdp_message_replace_attribute, "gst_sdp_message_replace_attribute", libs);
  gidLink(cast(void**)&gst_sdp_message_replace_bandwidth, "gst_sdp_message_replace_bandwidth", libs);
  gidLink(cast(void**)&gst_sdp_message_replace_email, "gst_sdp_message_replace_email", libs);
  gidLink(cast(void**)&gst_sdp_message_replace_phone, "gst_sdp_message_replace_phone", libs);
  gidLink(cast(void**)&gst_sdp_message_replace_time, "gst_sdp_message_replace_time", libs);
  gidLink(cast(void**)&gst_sdp_message_replace_zone, "gst_sdp_message_replace_zone", libs);
  gidLink(cast(void**)&gst_sdp_message_set_connection, "gst_sdp_message_set_connection", libs);
  gidLink(cast(void**)&gst_sdp_message_set_information, "gst_sdp_message_set_information", libs);
  gidLink(cast(void**)&gst_sdp_message_set_key, "gst_sdp_message_set_key", libs);
  gidLink(cast(void**)&gst_sdp_message_set_origin, "gst_sdp_message_set_origin", libs);
  gidLink(cast(void**)&gst_sdp_message_set_session_name, "gst_sdp_message_set_session_name", libs);
  gidLink(cast(void**)&gst_sdp_message_set_uri, "gst_sdp_message_set_uri", libs);
  gidLink(cast(void**)&gst_sdp_message_set_version, "gst_sdp_message_set_version", libs);
  gidLink(cast(void**)&gst_sdp_message_times_len, "gst_sdp_message_times_len", libs);
  gidLink(cast(void**)&gst_sdp_message_uninit, "gst_sdp_message_uninit", libs);
  gidLink(cast(void**)&gst_sdp_message_zones_len, "gst_sdp_message_zones_len", libs);
  gidLink(cast(void**)&gst_sdp_message_as_uri, "gst_sdp_message_as_uri", libs);
  gidLink(cast(void**)&gst_sdp_message_init, "gst_sdp_message_init", libs);
  gidLink(cast(void**)&gst_sdp_message_new, "gst_sdp_message_new", libs);
  gidLink(cast(void**)&gst_sdp_message_new_from_text, "gst_sdp_message_new_from_text", libs);
  gidLink(cast(void**)&gst_sdp_message_parse_buffer, "gst_sdp_message_parse_buffer", libs);
  gidLink(cast(void**)&gst_sdp_message_parse_uri, "gst_sdp_message_parse_uri", libs);

  // SDPTime
  gidLink(cast(void**)&gst_sdp_time_clear, "gst_sdp_time_clear", libs);
  gidLink(cast(void**)&gst_sdp_time_set, "gst_sdp_time_set", libs);

  // SDPZone
  gidLink(cast(void**)&gst_sdp_zone_clear, "gst_sdp_zone_clear", libs);
  gidLink(cast(void**)&gst_sdp_zone_set, "gst_sdp_zone_set", libs);

  // global
  gidLink(cast(void**)&gst_sdp_address_is_multicast, "gst_sdp_address_is_multicast", libs);
  gidLink(cast(void**)&gst_sdp_make_keymgmt, "gst_sdp_make_keymgmt", libs);
}
