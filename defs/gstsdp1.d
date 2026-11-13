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

//# Hand-written below: Timestamp arrays with a length determined by the timestamp type
//!set record[MIKEYMessage].method[add_t][ignore] 1
//!set record[MIKEYPayload].method[t_set][ignore] 1
//!set record[MIKEYPayloadT].field[ts_value][ignore] 1
//!set record[MIKEYPayloadT].field[type][writable] 0

//# Hand-written below: Key validity data arrays (none, SPI or valid from/to interval) with lengths in kv_len
//!set record[MIKEYPayloadKeyData].field[kv_data][ignore] 1
//!set record[MIKEYPayloadKeyData].field[kv_len][writable] 0


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
//!class MIKEYPayload

  /**
      Get the length of a timestamp value.
      Params:
        type = the timestamp type
      Returns: the length in bytes of the timestamp value of type (8 for NTP-UTC and NTP, 4 for COUNTER) or -1 if
        type is not a valid timestamp type
  */
  static int tsValueLength(gstsdp.types.MIKEYTSType type) nothrow
  {
    if (type == gstsdp.types.MIKEYTSType.NtpUtc || type == gstsdp.types.MIKEYTSType.Ntp)
      return 8;

    if (type == gstsdp.types.MIKEYTSType.Counter)
      return 4;

    return -1;
  }

  /**
      Set the timestamp in a [gstsdp.types.MIKEYPayloadType.T] payload.
      Params:
        type = the timestamp type
        tsValue = the timestamp value, its length must be [gstsdp.mikeypayload.MIKEYPayload.tsValueLength] of type
      Returns: true on success, false if type is not a valid timestamp type or tsValue has the wrong length
  */
  bool tSet(gstsdp.types.MIKEYTSType type, ubyte[] tsValue) nothrow
  {
    auto _len = tsValueLength(type);

    if (_len < 0)
      return false;

    if (tsValue.length != _len)
    {
      import glib.c.functions : g_log;
      import glib.c.types : GLogLevelFlags;
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstsdp.mikeypayload.MIKEYPayload.tSet tsValue length %d does not match the timestamp type length %d",
        cast(int)tsValue.length, _len);
      return false;
    }

    return cast(bool)gst_mikey_payload_t_set(cast(GstMIKEYPayload*)this._cPtr, cast(GstMIKEYTSType)type, tsValue.ptr);
  }

//!class MIKEYMessage

  /**
      Add a new T payload to msg with the given parameters.
      Params:
        type = specifies the timestamp type used
        tsValue = the timestamp value, its length must be [gstsdp.mikeypayload.MIKEYPayload.tsValueLength] of type
      Returns: true on success, false if type is not a valid timestamp type or tsValue has the wrong length
  */
  bool addT(gstsdp.types.MIKEYTSType type, ubyte[] tsValue) nothrow
  {
    import gstsdp.mikeypayload : MIKEYPayload;

    auto _len = MIKEYPayload.tsValueLength(type);

    if (_len < 0)
      return false;

    if (tsValue.length != _len)
    {
      import glib.c.functions : g_log;
      import glib.c.types : GLogLevelFlags;
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstsdp.mikeymessage.MIKEYMessage.addT tsValue length %d does not match the timestamp type length %d",
        cast(int)tsValue.length, _len);
      return false;
    }

    return cast(bool)gst_mikey_message_add_t(cast(GstMIKEYMessage*)this._cPtr, cast(GstMIKEYTSType)type, tsValue.ptr);
  }

//!class MIKEYPayloadT

  /**
      Get `tsValue` field.
      Returns: the timestamp value (copied), its length is determined by the timestamp type
  */
  @property ubyte[] tsValue() nothrow
  {
    import gstsdp.mikeypayload : MIKEYPayload;

    auto payload = cast(GstMIKEYPayloadT*)this._cPtr;
    auto _len = MIKEYPayload.tsValueLength(cast(gstsdp.types.MIKEYTSType)payload.type);

    if (!payload.tsValue || _len <= 0)
      return null;

    return payload.tsValue[0 .. _len].dup;
  }

//!class MIKEYPayloadKeyData

  /**
      Get `kvData` field.
      Returns: the key validity data (copied) for the key validity type: empty for
        [gstsdp.types.MIKEYKVType.Null], the SPI/MKI for [gstsdp.types.MIKEYKVType.Spi] or the valid from and valid
        to values for [gstsdp.types.MIKEYKVType.Interval]
  */
  @property ubyte[][] kvData() nothrow
  {
    auto payload = cast(GstMIKEYPayloadKeyData*)this._cPtr;
    size_t _count; // Number of key validity data arrays for the key validity type

    if (payload.kvType == GstMIKEYKVType.Spi)
      _count = 1;
    else if (payload.kvType == GstMIKEYKVType.Interval)
      _count = 2;
    else
      return null;

    auto _retval = new ubyte[][](_count);

    foreach (i, ref data; _retval)
      data = payload.kvData[i] ? payload.kvData[i][0 .. payload.kvLen[i]].dup : null;

    return _retval;
  }
