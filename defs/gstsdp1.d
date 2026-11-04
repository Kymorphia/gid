//!gir GstSdp-1.0
//!info description "D binding for the GstSdp library - SDP library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstsdp1/
//!info capi https://gstreamer.freedesktop.org/documentation/sdp/index.html

// Disabled: create or fill a structure with C allocated members (freed by gst_sdp_media_free/uninit), which a D copy
// would leak or double free. set_media_from_caps and add_media_from_structure modify an existing media (not outputs).
//!set record[SDPMedia].method[copy][disable] 1
//!set record[SDPMedia].function[new][disable] 1
//!set record[SDPMedia].function[init][disable] 1
//!set record[SDPMedia].function[set_media_from_caps].parameters.parameter[media][direction] in
//!set record[SDPMedia].function[set_media_from_caps].parameters.parameter[media][caller-allocates] 0
//!set record[SDPMedia].function[add_media_from_structure].parameters.parameter[media][direction] in
//!set record[SDPMedia].function[add_media_from_structure].parameters.parameter[media][caller-allocates] 0

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set record[MIKEYMessage].method[add_t][disable] 1
//!set record[MIKEYPayload].method[t_set][disable] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[MIKEYMessage].field[map_info][writable] 0
//!set record[MIKEYMessage].field[payloads][writable] 0
//!set record[MIKEYPayloadKEMAC].field[pt][writable] 0
//!set record[MIKEYPayloadKEMAC].field[subpayloads][writable] 0
//!set record[MIKEYPayloadKeyData].field[pt][writable] 0
//!set record[MIKEYPayloadPKE].field[pt][writable] 0
//!set record[MIKEYPayloadRAND].field[pt][writable] 0
//!set record[MIKEYPayloadSP].field[pt][writable] 0
//!set record[MIKEYPayloadSP].field[params][writable] 0
//!set record[MIKEYPayloadT].field[pt][writable] 0
//!set record[SDPMedia].field[fmts][writable] 0
//!set record[SDPMedia].field[connections][writable] 0
//!set record[SDPMedia].field[bandwidths][writable] 0
//!set record[SDPMedia].field[key][writable] 0
//!set record[SDPMedia].field[attributes][writable] 0
//!set record[SDPMessage].field[origin][writable] 0
//!set record[SDPMessage].field[emails][writable] 0
//!set record[SDPMessage].field[phones][writable] 0
//!set record[SDPMessage].field[connection][writable] 0
//!set record[SDPMessage].field[bandwidths][writable] 0
//!set record[SDPMessage].field[times][writable] 0
//!set record[SDPMessage].field[zones][writable] 0
//!set record[SDPMessage].field[key][writable] 0
//!set record[SDPMessage].field[attributes][writable] 0
//!set record[SDPMessage].field[medias][writable] 0
//!set record[SDPTime].field[repeat][writable] 0

//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[SDPMessage].field[version][writable] 0
//!set record[SDPMessage].field[session_name][writable] 0
//!set record[SDPMessage].field[information][writable] 0
//!set record[SDPMessage].field[uri][writable] 0

//# Disable: Array field with unsupported pointer element type
//!set record[MIKEYPayloadKeyData].field[kv_data][disable] 1

//# Set array field lengths from their length fields (read-only, payload data is set with the payload API)
//!set record[MIKEYPayloadKeyData].field[key_data].type '<array length="2" zero-terminated="0" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[MIKEYPayloadKeyData].field[key_data][writable] 0
//!set record[MIKEYPayloadKeyData].field[salt_data].type '<array length="4" zero-terminated="0" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[MIKEYPayloadKeyData].field[salt_data][writable] 0
//!set record[MIKEYPayloadPKE].field[data].type '<array length="2" zero-terminated="0" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[MIKEYPayloadPKE].field[data][writable] 0
//!set record[MIKEYPayloadRAND].field[rand].type '<array length="1" zero-terminated="0" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[MIKEYPayloadRAND].field[rand][writable] 0
//!set record[MIKEYPayloadSPParam].field[val].type '<array length="1" zero-terminated="0" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[MIKEYPayloadSPParam].field[val][writable] 0

//# Disable: Timestamp array field with a length determined by the timestamp type
//!set record[MIKEYPayloadT].field[ts_value][disable] 1
