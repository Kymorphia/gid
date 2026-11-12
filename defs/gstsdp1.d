//!gir GstSdp-1.0
//!info description "D binding for the GstSdp library - SDP library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstsdp1/
//!info capi https://gstreamer.freedesktop.org/documentation/sdp/index.html

//# SDPMedia has C allocated members (arrays and strings freed by gst_sdp_media_uninit/free), so it is held as a C
//# allocated structure (allocated with g_malloc0 and initialized with gst_sdp_media_init, freed with gst_sdp_media_free,
//# deep copied with gst_sdp_media_copy). The kind override keeps it a Wrap structure (free-function makes it opaque).
//!set record[SDPMedia][copy-function] sdpMediaCopy
//!set record[SDPMedia][free-function] gst_sdp_media_free
//!set record[SDPMedia][gid-init-function] gst_sdp_media_init
//!kind SDPMedia Wrap
//!set record[SDPMedia].field[media][owned] 1
//!set record[SDPMedia].field[proto][owned] 1
//!set record[SDPMedia].field[information][owned] 1

//# Ignore: frees the members of the C allocated structure, which is done by gst_sdp_media_free (wrapper finalizer)
//!set record[SDPMedia].method[uninit][ignore] 1

//# gst_sdp_message_add_media() moves the contents of media (leaving it zeroed), replaced below to re-initialize it
//!set record[SDPMessage].method[add_media][ignore] 1

//# set_media_from_caps and add_media_from_structure modify an existing media (not outputs)
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

//# Copy function with the StructWrap copy function signature (gst_sdp_media_copy() returns the copy in an out parameter)
//!class SDPMedia pre

private extern(C) GstSDPMedia* sdpMediaCopy(const(GstSDPMedia)* media) nothrow
{
  GstSDPMedia* copy;
  gst_sdp_media_copy(media, &copy);
  return copy;
}

//!class SDPMessage

  /**
      Adds media to the array of medias in msg. The contents of media are moved to msg and media is re-initialized
      afterwards (empty), so it can be used again.
  
      Params:
        media = a #GstSDPMedia
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult addMedia(gstsdp.sdpmedia.SDPMedia media) nothrow
  {
    auto _media = media ? cast(GstSDPMedia*)media._cPtr(No.Dup) : null;
    GstSDPResult _cretval = gst_sdp_message_add_media(cast(GstSDPMessage*)this._cPtr, _media);

    if (_media && _cretval == GstSDPResult.Ok)
      gst_sdp_media_init(_media);

    return cast(gstsdp.types.SDPResult)_cretval;
  }
