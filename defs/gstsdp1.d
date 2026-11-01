//!gir GstSdp-1.0
//!info description "D binding for the GstSdp library - SDP library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstsdp1/
//!info capi https://gstreamer.freedesktop.org/documentation/sdp/index.html

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
