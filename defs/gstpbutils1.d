//!gir GstPbutils-1.0
//!info description "D binding for the GstPbutils library - Base utils library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstpbutils1/
//!info capi https://gstreamer.freedesktop.org/documentation/pbutils/index.html

//# Hand-written below: Channel mapping arrays with a length from the channels parameter
//!set function[codec_utils_opus_create_caps][ignore] 1
//!set function[codec_utils_opus_create_header][ignore] 1

//# caller-allocated-out-array (Caller allocated output array)
//!set function[codec_utils_opus_parse_caps].parameters.parameter[channel_mapping][caller-allocates] 1
//!set function[codec_utils_opus_parse_header].parameters.parameter[channel_mapping][caller-allocates] 1

//!class global pre

/**
    Check an Opus channel mapping length, which must be the number of channels (or empty for channel mapping family 0).
    Logs a critical message on mismatch.
*/
private bool _opusChannelMappingValid(string context, ubyte channels, ubyte channelMappingFamily,
  const(ubyte)[] channelMapping) nothrow
{
  import glib.c.functions : g_log;
  import glib.c.types : GLogLevelFlags;

  if ((channelMapping.length > 0 || channelMappingFamily != 0) && channelMapping.length != channels)
  {
    g_log("Gid", GLogLevelFlags.LevelCritical, "gstpbutils.global.%.*s channelMapping length %d does not match the number of channels %d",
      cast(int)context.length, context.ptr, cast(int)channelMapping.length, channels);
    return false;
  }

  return true;
}

/**
    Creates Opus caps from the given parameters.
    Params:
      rate = the sample rate
      channels = the number of channels
      channelMappingFamily = the channel mapping family
      streamCount = the number of independent streams
      coupledCount = the number of stereo streams
      channelMapping = the mapping between the streams, one for each channel (may be empty for channel mapping
        family 0 to use the default mapping)
    Returns: The #GstCaps, or null if the parameters would lead to invalid Opus caps.
*/
gst.caps.Caps codecUtilsOpusCreateCaps(uint rate, ubyte channels, ubyte channelMappingFamily, ubyte streamCount,
  ubyte coupledCount, ubyte[] channelMapping = null) nothrow
{
  if (!_opusChannelMappingValid("codecUtilsOpusCreateCaps", channels, channelMappingFamily, channelMapping))
    return null;

  auto _cretval = gst_codec_utils_opus_create_caps(rate, channels, channelMappingFamily, streamCount, coupledCount,
    channelMapping.length > 0 ? channelMapping.ptr : null);
  return _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
}

/**
    Creates OpusHead header from the given parameters.
    Params:
      rate = the sample rate
      channels = the number of channels
      channelMappingFamily = the channel mapping family
      streamCount = the number of independent streams
      coupledCount = the number of stereo streams
      channelMapping = the mapping between the streams, one for each channel (may be empty for channel mapping
        family 0 to use the default mapping)
      preSkip = Pre-skip in 48kHz samples or 0
      outputGain = Output gain or 0
    Returns: The #GstBuffer containing the OpusHead, or null on error
*/
gst.buffer.Buffer codecUtilsOpusCreateHeader(uint rate, ubyte channels, ubyte channelMappingFamily, ubyte streamCount,
  ubyte coupledCount, ubyte[] channelMapping, ushort preSkip, short outputGain) nothrow
{
  if (!_opusChannelMappingValid("codecUtilsOpusCreateHeader", channels, channelMappingFamily, channelMapping))
    return null;

  auto _cretval = gst_codec_utils_opus_create_header(rate, channels, channelMappingFamily, streamCount, coupledCount,
    channelMapping.length > 0 ? channelMapping.ptr : null, preSkip, outputGain);
  return _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
}
