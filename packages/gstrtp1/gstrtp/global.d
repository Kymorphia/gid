/// Global functions for gstrtp1 library
module gstrtp.global;

import gid.gid;
import gobject.types;
import gst.buffer;
import gst.element_factory;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.rtpsource_meta;
import gstrtp.types;


/**
    Find the #GstRTPSourceMeta on buffer.

    Params:
      buffer = a #GstBuffer
    Returns: the #GstRTPSourceMeta or null when there
      is no such metadata on buffer.
*/
gstrtp.rtpsource_meta.RTPSourceMeta bufferGetRtpSourceMeta(gst.buffer.Buffer buffer)
{
  GstRTPSourceMeta* _cretval;
  _cretval = gst_buffer_get_rtp_source_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstrtp.rtpsource_meta.RTPSourceMeta(cast(GstRTPSourceMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Converts an NTP time to UNIX nanoseconds. ntptime can typically be
    the NTP time of an SR RTCP message and contains, in the upper 32 bits, the
    number of seconds since 1900 and, in the lower 32 bits, the fractional
    seconds. The resulting value will be the number of nanoseconds since 1970.

    Params:
      ntptime = an NTP timestamp
    Returns: the UNIX time for ntptime in nanoseconds.
*/
ulong rtcpNtpToUnix(ulong ntptime)
{
  ulong _retval;
  _retval = gst_rtcp_ntp_to_unix(ntptime);
  return _retval;
}

/**
    Convert name into a GstRTCPSDESType. name is typically a key in a
    #GstStructure containing SDES items.

    Params:
      name = a SDES name
    Returns: the #GstRTCPSDESType for name or #GST_RTCP_SDES_PRIV when name
      is a private sdes item.
*/
gstrtp.types.RTCPSDESType rtcpSdesNameToType(string name)
{
  GstRTCPSDESType _cretval;
  const(char)* _name = name.toCString(No.Alloc);
  _cretval = gst_rtcp_sdes_name_to_type(_name);
  gstrtp.types.RTCPSDESType _retval = cast(gstrtp.types.RTCPSDESType)_cretval;
  return _retval;
}

/**
    Converts type to the string equivalent. The string is typically used as a
    key in a #GstStructure containing SDES items.

    Params:
      type = a #GstRTCPSDESType
    Returns: the string equivalent of type
*/
string rtcpSdesTypeToName(gstrtp.types.RTCPSDESType type)
{
  const(char)* _cretval;
  _cretval = gst_rtcp_sdes_type_to_name(type);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Converts a UNIX timestamp in nanoseconds to an NTP time. The caller should
    pass a value with nanoseconds since 1970. The NTP time will, in the upper
    32 bits, contain the number of seconds since 1900 and, in the lower 32
    bits, the fractional seconds. The resulting value can be used as an ntptime
    for constructing SR RTCP packets.

    Params:
      unixtime = an UNIX timestamp in nanoseconds
    Returns: the NTP time for unixtime.
*/
ulong rtcpUnixToNtp(ulong unixtime)
{
  ulong _retval;
  _retval = gst_rtcp_unix_to_ntp(unixtime);
  return _retval;
}

/**
    Retrieve all the factories of the currently registered RTP header
    extensions.  Call [gst.element_factory.ElementFactory.create] with each factory to create
    the associated #GstRTPHeaderExtension.
    Returns: a #GList of
          #GstElementFactory's. Use [gst.plugin_feature.PluginFeature.listFree] after use
*/
gst.element_factory.ElementFactory[] rtpGetHeaderExtensionList()
{
  GList* _cretval;
  _cretval = gst_rtp_get_header_extension_list();
  auto _retval = gListToD!(gst.element_factory.ElementFactory, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Reads the NTP time from the size NTP-56 extension bytes in data and store the
    result in ntptime.

    Params:
      data = the data to read from
      ntptime = the result NTP time
    Returns: true on success.
*/
bool rtpHdrextGetNtp56(ubyte[] data, out ulong ntptime)
{
  bool _retval;
  uint _size;
  if (data)
    _size = cast(uint)data.length;

  auto _data = cast(void*)data.ptr;
  _retval = cast(bool)gst_rtp_hdrext_get_ntp_56(_data, _size, cast(ulong*)&ntptime);
  return _retval;
}

/**
    Reads the NTP time from the size NTP-64 extension bytes in data and store the
    result in ntptime.

    Params:
      data = the data to read from
      ntptime = the result NTP time
    Returns: true on success.
*/
bool rtpHdrextGetNtp64(ubyte[] data, out ulong ntptime)
{
  bool _retval;
  uint _size;
  if (data)
    _size = cast(uint)data.length;

  auto _data = cast(void*)data.ptr;
  _retval = cast(bool)gst_rtp_hdrext_get_ntp_64(_data, _size, cast(ulong*)&ntptime);
  return _retval;
}

/**
    Writes the NTP time in ntptime to the format required for the NTP-56 header
    extension. data must hold at least #GST_RTP_HDREXT_NTP_56_SIZE bytes.

    Params:
      data = the data to write to
      size = the size of data
      ntptime = the NTP time
    Returns: true on success.
*/
bool rtpHdrextSetNtp56(void* data, uint size, ulong ntptime)
{
  bool _retval;
  _retval = cast(bool)gst_rtp_hdrext_set_ntp_56(data, size, ntptime);
  return _retval;
}

/**
    Writes the NTP time in ntptime to the format required for the NTP-64 header
    extension. data must hold at least #GST_RTP_HDREXT_NTP_64_SIZE bytes.

    Params:
      data = the data to write to
      size = the size of data
      ntptime = the NTP time
    Returns: true on success.
*/
bool rtpHdrextSetNtp64(void* data, uint size, ulong ntptime)
{
  bool _retval;
  _retval = cast(bool)gst_rtp_hdrext_set_ntp_64(data, size, ntptime);
  return _retval;
}

/** */
gobject.types.GType rtpSourceMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_rtp_source_meta_api_get_type();
  return _retval;
}
