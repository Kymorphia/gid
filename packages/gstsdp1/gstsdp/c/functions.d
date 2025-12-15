/// C functions for gstsdp1 library
module gstsdp.c.functions;

public import gid.basictypes;
import gid.loader;
import gstsdp.c.types;
public import gst.c.types;

version(Windows)
  private immutable LIBS = ["libgstsdp-1.0-0.dll;gstsdp-1.0-0.dll;gstsdp-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstsdp-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstsdp-1.0.so.0"];

__gshared extern(C)
{
  // MIKEYMessage
  GType function() c_gst_mikey_message_get_type; ///
  GstMIKEYMessage* function() c_gst_mikey_message_new; ///
  GstMIKEYMessage* function(GBytes* bytes, GstMIKEYDecryptInfo* info, GError** _err) c_gst_mikey_message_new_from_bytes; ///
  GstMIKEYMessage* function(GstCaps* caps) c_gst_mikey_message_new_from_caps; ///
  GstMIKEYMessage* function(const(void)* data, size_t size, GstMIKEYDecryptInfo* info, GError** _err) c_gst_mikey_message_new_from_data; ///
  gboolean function(GstMIKEYMessage* msg, ubyte policy, uint ssrc, uint roc) c_gst_mikey_message_add_cs_srtp; ///
  gboolean function(GstMIKEYMessage* msg, GstMIKEYPayload* payload) c_gst_mikey_message_add_payload; ///
  gboolean function(GstMIKEYMessage* msg, GstMIKEYCacheType C, ushort dataLen, const(ubyte)* data) c_gst_mikey_message_add_pke; ///
  gboolean function(GstMIKEYMessage* msg, ubyte len, const(ubyte)* rand) c_gst_mikey_message_add_rand; ///
  gboolean function(GstMIKEYMessage* msg, ubyte len) c_gst_mikey_message_add_rand_len; ///
  gboolean function(GstMIKEYMessage* msg, GstMIKEYTSType type, const(ubyte)* tsValue) c_gst_mikey_message_add_t; ///
  gboolean function(GstMIKEYMessage* msg) c_gst_mikey_message_add_t_now_ntp_utc; ///
  char* function(GstMIKEYMessage* msg) c_gst_mikey_message_base64_encode; ///
  const(GstMIKEYPayload)* function(const(GstMIKEYMessage)* msg, GstMIKEYPayloadType type, uint nth) c_gst_mikey_message_find_payload; ///
  const(GstMIKEYMapSRTP)* function(const(GstMIKEYMessage)* msg, uint idx) c_gst_mikey_message_get_cs_srtp; ///
  uint function(const(GstMIKEYMessage)* msg) c_gst_mikey_message_get_n_cs; ///
  uint function(const(GstMIKEYMessage)* msg) c_gst_mikey_message_get_n_payloads; ///
  const(GstMIKEYPayload)* function(const(GstMIKEYMessage)* msg, uint idx) c_gst_mikey_message_get_payload; ///
  gboolean function(GstMIKEYMessage* msg, int idx, const(GstMIKEYMapSRTP)* map) c_gst_mikey_message_insert_cs_srtp; ///
  gboolean function(GstMIKEYMessage* msg, uint idx, GstMIKEYPayload* payload) c_gst_mikey_message_insert_payload; ///
  gboolean function(GstMIKEYMessage* msg, int idx) c_gst_mikey_message_remove_cs_srtp; ///
  gboolean function(GstMIKEYMessage* msg, uint idx) c_gst_mikey_message_remove_payload; ///
  gboolean function(GstMIKEYMessage* msg, int idx, const(GstMIKEYMapSRTP)* map) c_gst_mikey_message_replace_cs_srtp; ///
  gboolean function(GstMIKEYMessage* msg, uint idx, GstMIKEYPayload* payload) c_gst_mikey_message_replace_payload; ///
  gboolean function(GstMIKEYMessage* msg, ubyte version_, GstMIKEYType type, gboolean V, GstMIKEYPRFFunc prfFunc, uint CSBId, GstMIKEYMapType mapType) c_gst_mikey_message_set_info; ///
  GBytes* function(GstMIKEYMessage* msg, GstMIKEYEncryptInfo* info, GError** _err) c_gst_mikey_message_to_bytes; ///
  gboolean function(const(GstMIKEYMessage)* msg, GstCaps* caps) c_gst_mikey_message_to_caps; ///

  // MIKEYPayload
  GType function() c_gst_mikey_payload_get_type; ///
  GstMIKEYPayload* function(GstMIKEYPayloadType type) c_gst_mikey_payload_new; ///
  gboolean function(GstMIKEYPayload* payload, GstMIKEYPayload* newpay) c_gst_mikey_payload_kemac_add_sub; ///
  uint function(const(GstMIKEYPayload)* payload) c_gst_mikey_payload_kemac_get_n_sub; ///
  const(GstMIKEYPayload)* function(const(GstMIKEYPayload)* payload, uint idx) c_gst_mikey_payload_kemac_get_sub; ///
  gboolean function(GstMIKEYPayload* payload, uint idx) c_gst_mikey_payload_kemac_remove_sub; ///
  gboolean function(GstMIKEYPayload* payload, GstMIKEYEncAlg encAlg, GstMIKEYMacAlg macAlg) c_gst_mikey_payload_kemac_set; ///
  gboolean function(GstMIKEYPayload* payload, ubyte vfLen, const(ubyte)* vfData, ubyte vtLen, const(ubyte)* vtData) c_gst_mikey_payload_key_data_set_interval; ///
  gboolean function(GstMIKEYPayload* payload, GstMIKEYKeyDataType keyType, ushort keyLen, const(ubyte)* keyData) c_gst_mikey_payload_key_data_set_key; ///
  gboolean function(GstMIKEYPayload* payload, ushort saltLen, const(ubyte)* saltData) c_gst_mikey_payload_key_data_set_salt; ///
  gboolean function(GstMIKEYPayload* payload, ubyte spiLen, const(ubyte)* spiData) c_gst_mikey_payload_key_data_set_spi; ///
  gboolean function(GstMIKEYPayload* payload, GstMIKEYCacheType C, ushort dataLen, const(ubyte)* data) c_gst_mikey_payload_pke_set; ///
  gboolean function(GstMIKEYPayload* payload, ubyte len, const(ubyte)* rand) c_gst_mikey_payload_rand_set; ///
  gboolean function(GstMIKEYPayload* payload, ubyte type, ubyte len, const(ubyte)* val) c_gst_mikey_payload_sp_add_param; ///
  uint function(const(GstMIKEYPayload)* payload) c_gst_mikey_payload_sp_get_n_params; ///
  const(GstMIKEYPayloadSPParam)* function(const(GstMIKEYPayload)* payload, uint idx) c_gst_mikey_payload_sp_get_param; ///
  gboolean function(GstMIKEYPayload* payload, uint idx) c_gst_mikey_payload_sp_remove_param; ///
  gboolean function(GstMIKEYPayload* payload, uint policy, GstMIKEYSecProto proto) c_gst_mikey_payload_sp_set; ///
  gboolean function(GstMIKEYPayload* payload, GstMIKEYTSType type, const(ubyte)* tsValue) c_gst_mikey_payload_t_set; ///

  // SDPAttribute
  GstSDPResult function(GstSDPAttribute* attr) c_gst_sdp_attribute_clear; ///
  GstSDPResult function(GstSDPAttribute* attr, const(char)* key, const(char)* value) c_gst_sdp_attribute_set; ///

  // SDPBandwidth
  GstSDPResult function(GstSDPBandwidth* bw) c_gst_sdp_bandwidth_clear; ///
  GstSDPResult function(GstSDPBandwidth* bw, const(char)* bwtype, uint bandwidth) c_gst_sdp_bandwidth_set; ///

  // SDPConnection
  GstSDPResult function(GstSDPConnection* conn) c_gst_sdp_connection_clear; ///
  GstSDPResult function(GstSDPConnection* conn, const(char)* nettype, const(char)* addrtype, const(char)* address, uint ttl, uint addrNumber) c_gst_sdp_connection_set; ///

  // SDPMedia
  GstSDPResult function(GstSDPMedia* media, const(char)* key, const(char)* value) c_gst_sdp_media_add_attribute; ///
  GstSDPResult function(GstSDPMedia* media, const(char)* bwtype, uint bandwidth) c_gst_sdp_media_add_bandwidth; ///
  GstSDPResult function(GstSDPMedia* media, const(char)* nettype, const(char)* addrtype, const(char)* address, uint ttl, uint addrNumber) c_gst_sdp_media_add_connection; ///
  GstSDPResult function(GstSDPMedia* media, const(char)* format) c_gst_sdp_media_add_format; ///
  char* function(const(GstSDPMedia)* media) c_gst_sdp_media_as_text; ///
  uint function(const(GstSDPMedia)* media) c_gst_sdp_media_attributes_len; ///
  GstSDPResult function(const(GstSDPMedia)* media, GstCaps* caps) c_gst_sdp_media_attributes_to_caps; ///
  uint function(const(GstSDPMedia)* media) c_gst_sdp_media_bandwidths_len; ///
  uint function(const(GstSDPMedia)* media) c_gst_sdp_media_connections_len; ///
  GstSDPResult function(const(GstSDPMedia)* media, GstSDPMedia** copy) c_gst_sdp_media_copy; ///
  uint function(const(GstSDPMedia)* media) c_gst_sdp_media_formats_len; ///
  GstSDPResult function(GstSDPMedia* media) c_gst_sdp_media_free; ///
  const(GstSDPAttribute)* function(const(GstSDPMedia)* media, uint idx) c_gst_sdp_media_get_attribute; ///
  const(char)* function(const(GstSDPMedia)* media, const(char)* key) c_gst_sdp_media_get_attribute_val; ///
  const(char)* function(const(GstSDPMedia)* media, const(char)* key, uint nth) c_gst_sdp_media_get_attribute_val_n; ///
  const(GstSDPBandwidth)* function(const(GstSDPMedia)* media, uint idx) c_gst_sdp_media_get_bandwidth; ///
  GstCaps* function(const(GstSDPMedia)* media, int pt) c_gst_sdp_media_get_caps_from_media; ///
  const(GstSDPConnection)* function(const(GstSDPMedia)* media, uint idx) c_gst_sdp_media_get_connection; ///
  const(char)* function(const(GstSDPMedia)* media, uint idx) c_gst_sdp_media_get_format; ///
  const(char)* function(const(GstSDPMedia)* media) c_gst_sdp_media_get_information; ///
  const(GstSDPKey)* function(const(GstSDPMedia)* media) c_gst_sdp_media_get_key; ///
  const(char)* function(const(GstSDPMedia)* media) c_gst_sdp_media_get_media; ///
  uint function(const(GstSDPMedia)* media) c_gst_sdp_media_get_num_ports; ///
  uint function(const(GstSDPMedia)* media) c_gst_sdp_media_get_port; ///
  const(char)* function(const(GstSDPMedia)* media) c_gst_sdp_media_get_proto; ///
  GstSDPResult function(GstSDPMedia* media, int idx, GstSDPAttribute* attr) c_gst_sdp_media_insert_attribute; ///
  GstSDPResult function(GstSDPMedia* media, int idx, GstSDPBandwidth* bw) c_gst_sdp_media_insert_bandwidth; ///
  GstSDPResult function(GstSDPMedia* media, int idx, GstSDPConnection* conn) c_gst_sdp_media_insert_connection; ///
  GstSDPResult function(GstSDPMedia* media, int idx, const(char)* format) c_gst_sdp_media_insert_format; ///
  GstSDPResult function(const(GstSDPMedia)* media, GstMIKEYMessage** mikey) c_gst_sdp_media_parse_keymgmt; ///
  GstSDPResult function(GstSDPMedia* media, uint idx) c_gst_sdp_media_remove_attribute; ///
  GstSDPResult function(GstSDPMedia* media, uint idx) c_gst_sdp_media_remove_bandwidth; ///
  GstSDPResult function(GstSDPMedia* media, uint idx) c_gst_sdp_media_remove_connection; ///
  GstSDPResult function(GstSDPMedia* media, uint idx) c_gst_sdp_media_remove_format; ///
  GstSDPResult function(GstSDPMedia* media, uint idx, GstSDPAttribute* attr) c_gst_sdp_media_replace_attribute; ///
  GstSDPResult function(GstSDPMedia* media, uint idx, GstSDPBandwidth* bw) c_gst_sdp_media_replace_bandwidth; ///
  GstSDPResult function(GstSDPMedia* media, uint idx, GstSDPConnection* conn) c_gst_sdp_media_replace_connection; ///
  GstSDPResult function(GstSDPMedia* media, uint idx, const(char)* format) c_gst_sdp_media_replace_format; ///
  GstSDPResult function(GstSDPMedia* media, const(char)* information) c_gst_sdp_media_set_information; ///
  GstSDPResult function(GstSDPMedia* media, const(char)* type, const(char)* data) c_gst_sdp_media_set_key; ///
  GstSDPResult function(GstSDPMedia* media, const(char)* med) c_gst_sdp_media_set_media; ///
  GstSDPResult function(GstSDPMedia* media, uint port, uint numPorts) c_gst_sdp_media_set_port_info; ///
  GstSDPResult function(GstSDPMedia* media, const(char)* proto) c_gst_sdp_media_set_proto; ///
  GstSDPResult function(GstSDPMedia* media) c_gst_sdp_media_uninit; ///
  GstSDPResult function(GstSDPMedia* media) c_gst_sdp_media_init; ///
  GstSDPResult function(GstSDPMedia** media) c_gst_sdp_media_new; ///
  GstSDPResult function(const(GstCaps)* caps, GstSDPMedia* media) c_gst_sdp_media_set_media_from_caps; ///

  // SDPMessage
  GType function() c_gst_sdp_message_get_type; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* key, const(char)* value) c_gst_sdp_message_add_attribute; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* bwtype, uint bandwidth) c_gst_sdp_message_add_bandwidth; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* email) c_gst_sdp_message_add_email; ///
  GstSDPResult function(GstSDPMessage* msg, GstSDPMedia* media) c_gst_sdp_message_add_media; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* phone) c_gst_sdp_message_add_phone; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* start, const(char)* stop, const(char*)* repeat) c_gst_sdp_message_add_time; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* adjTime, const(char)* typedTime) c_gst_sdp_message_add_zone; ///
  char* function(const(GstSDPMessage)* msg) c_gst_sdp_message_as_text; ///
  uint function(const(GstSDPMessage)* msg) c_gst_sdp_message_attributes_len; ///
  GstSDPResult function(const(GstSDPMessage)* msg, GstCaps* caps) c_gst_sdp_message_attributes_to_caps; ///
  uint function(const(GstSDPMessage)* msg) c_gst_sdp_message_bandwidths_len; ///
  GstSDPResult function(const(GstSDPMessage)* msg, GstSDPMessage** copy) c_gst_sdp_message_copy; ///
  GstSDPResult function(const(GstSDPMessage)* msg) c_gst_sdp_message_dump; ///
  uint function(const(GstSDPMessage)* msg) c_gst_sdp_message_emails_len; ///
  GstSDPResult function(GstSDPMessage* msg) c_gst_sdp_message_free; ///
  const(GstSDPAttribute)* function(const(GstSDPMessage)* msg, uint idx) c_gst_sdp_message_get_attribute; ///
  const(char)* function(const(GstSDPMessage)* msg, const(char)* key) c_gst_sdp_message_get_attribute_val; ///
  const(char)* function(const(GstSDPMessage)* msg, const(char)* key, uint nth) c_gst_sdp_message_get_attribute_val_n; ///
  const(GstSDPBandwidth)* function(const(GstSDPMessage)* msg, uint idx) c_gst_sdp_message_get_bandwidth; ///
  const(GstSDPConnection)* function(const(GstSDPMessage)* msg) c_gst_sdp_message_get_connection; ///
  const(char)* function(const(GstSDPMessage)* msg, uint idx) c_gst_sdp_message_get_email; ///
  const(char)* function(const(GstSDPMessage)* msg) c_gst_sdp_message_get_information; ///
  const(GstSDPKey)* function(const(GstSDPMessage)* msg) c_gst_sdp_message_get_key; ///
  const(GstSDPMedia)* function(const(GstSDPMessage)* msg, uint idx) c_gst_sdp_message_get_media; ///
  const(GstSDPOrigin)* function(const(GstSDPMessage)* msg) c_gst_sdp_message_get_origin; ///
  const(char)* function(const(GstSDPMessage)* msg, uint idx) c_gst_sdp_message_get_phone; ///
  const(char)* function(const(GstSDPMessage)* msg) c_gst_sdp_message_get_session_name; ///
  const(GstSDPTime)* function(const(GstSDPMessage)* msg, uint idx) c_gst_sdp_message_get_time; ///
  const(char)* function(const(GstSDPMessage)* msg) c_gst_sdp_message_get_uri; ///
  const(char)* function(const(GstSDPMessage)* msg) c_gst_sdp_message_get_version; ///
  const(GstSDPZone)* function(const(GstSDPMessage)* msg, uint idx) c_gst_sdp_message_get_zone; ///
  GstSDPResult function(GstSDPMessage* msg, int idx, GstSDPAttribute* attr) c_gst_sdp_message_insert_attribute; ///
  GstSDPResult function(GstSDPMessage* msg, int idx, GstSDPBandwidth* bw) c_gst_sdp_message_insert_bandwidth; ///
  GstSDPResult function(GstSDPMessage* msg, int idx, const(char)* email) c_gst_sdp_message_insert_email; ///
  GstSDPResult function(GstSDPMessage* msg, int idx, const(char)* phone) c_gst_sdp_message_insert_phone; ///
  GstSDPResult function(GstSDPMessage* msg, int idx, GstSDPTime* t) c_gst_sdp_message_insert_time; ///
  GstSDPResult function(GstSDPMessage* msg, int idx, GstSDPZone* zone) c_gst_sdp_message_insert_zone; ///
  uint function(const(GstSDPMessage)* msg) c_gst_sdp_message_medias_len; ///
  GstSDPResult function(const(GstSDPMessage)* msg, GstMIKEYMessage** mikey) c_gst_sdp_message_parse_keymgmt; ///
  uint function(const(GstSDPMessage)* msg) c_gst_sdp_message_phones_len; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx) c_gst_sdp_message_remove_attribute; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx) c_gst_sdp_message_remove_bandwidth; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx) c_gst_sdp_message_remove_email; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx) c_gst_sdp_message_remove_media; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx) c_gst_sdp_message_remove_phone; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx) c_gst_sdp_message_remove_time; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx) c_gst_sdp_message_remove_zone; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx, GstSDPAttribute* attr) c_gst_sdp_message_replace_attribute; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx, GstSDPBandwidth* bw) c_gst_sdp_message_replace_bandwidth; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx, const(char)* email) c_gst_sdp_message_replace_email; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx, const(char)* phone) c_gst_sdp_message_replace_phone; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx, GstSDPTime* t) c_gst_sdp_message_replace_time; ///
  GstSDPResult function(GstSDPMessage* msg, uint idx, GstSDPZone* zone) c_gst_sdp_message_replace_zone; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* nettype, const(char)* addrtype, const(char)* address, uint ttl, uint addrNumber) c_gst_sdp_message_set_connection; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* information) c_gst_sdp_message_set_information; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* type, const(char)* data) c_gst_sdp_message_set_key; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* username, const(char)* sessId, const(char)* sessVersion, const(char)* nettype, const(char)* addrtype, const(char)* addr) c_gst_sdp_message_set_origin; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* sessionName) c_gst_sdp_message_set_session_name; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* uri) c_gst_sdp_message_set_uri; ///
  GstSDPResult function(GstSDPMessage* msg, const(char)* version_) c_gst_sdp_message_set_version; ///
  uint function(const(GstSDPMessage)* msg) c_gst_sdp_message_times_len; ///
  GstSDPResult function(GstSDPMessage* msg) c_gst_sdp_message_uninit; ///
  uint function(const(GstSDPMessage)* msg) c_gst_sdp_message_zones_len; ///
  char* function(const(char)* scheme, const(GstSDPMessage)* msg) c_gst_sdp_message_as_uri; ///
  GstSDPResult function(GstSDPMessage* msg) c_gst_sdp_message_init; ///
  GstSDPResult function(GstSDPMessage** msg) c_gst_sdp_message_new; ///
  GstSDPResult function(const(char)* text, GstSDPMessage** msg) c_gst_sdp_message_new_from_text; ///
  GstSDPResult function(const(ubyte)* data, uint size, GstSDPMessage* msg) c_gst_sdp_message_parse_buffer; ///
  GstSDPResult function(const(char)* uri, GstSDPMessage* msg) c_gst_sdp_message_parse_uri; ///

  // SDPTime
  GstSDPResult function(GstSDPTime* t) c_gst_sdp_time_clear; ///
  GstSDPResult function(GstSDPTime* t, const(char)* start, const(char)* stop, const(char*)* repeat) c_gst_sdp_time_set; ///

  // SDPZone
  GstSDPResult function(GstSDPZone* zone) c_gst_sdp_zone_clear; ///
  GstSDPResult function(GstSDPZone* zone, const(char)* adjTime, const(char)* typedTime) c_gst_sdp_zone_set; ///

  // global
  gboolean function(const(char)* nettype, const(char)* addrtype, const(char)* addr) c_gst_sdp_address_is_multicast; ///
  char* function(const(char)* uri, const(char)* base64) c_gst_sdp_make_keymgmt; ///
}

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
