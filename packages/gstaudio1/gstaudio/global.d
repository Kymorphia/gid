/// Global functions for gstaudio1 library
module gstaudio.global;

import gid.gid;
import gobject.types;
import gst.buffer;
import gst.caps;
import gst.types;
import gstaudio.audio_clipping_meta;
import gstaudio.audio_downmix_meta;
import gstaudio.audio_level_meta;
import gstaudio.audio_ring_buffer_spec;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;


import gstaudio.audio_downmix_meta;
import gstaudio.audio_info;
import gstaudio.audio_meta;
import gstaudio.dsd_plane_offset_meta;

/**
Allocates and attaches a #GstAudioMeta on buffer, which must be writable for that purpose. The fields of the
meta are directly populated from the arguments of this function.
When info.layout is [gstaudio.types.AudioLayout.NonInterleaved] and offsets is empty, the offsets are
calculated with a formula that assumes the planes are tightly packed and in sequence:
offsets[channel] = channel * samples * sample_stride
It is not allowed for channels to overlap in memory, i.e. for each i in [0, channels), the range
[offsets[i], offsets[i] + samples * sample_stride) must not overlap with any other such range.
Params:
buffer = a #GstBuffer
info = the audio properties of the buffer
samples = the number of valid samples in the buffer
offsets = the offsets (in bytes) where each channel plane starts in the buffer, empty to calculate them (only
for non-interleaved layout), otherwise its length must be the number of channels in info
Returns: the #GstAudioMeta that was attached on the buffer (borrowed from it) or null on error
*/
gstaudio.audio_meta.AudioMeta bufferAddAudioMeta(gst.buffer.Buffer buffer, gstaudio.audio_info.AudioInfo info, size_t samples, size_t[] offsets = null) nothrow
{
  if (offsets.length > 0 && info && offsets.length != (cast(GstAudioInfo*)info._cPtr(No.Dup)).channels)
  {
    import glib.c.functions : g_log;
    import glib.c.types : GLogLevelFlags;
    g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.bufferAddAudioMeta offsets length %d does not match the number of channels %d",
    cast(int)offsets.length, (cast(GstAudioInfo*)info._cPtr(No.Dup)).channels);
    return null;
  }

  auto _cretval = gst_buffer_add_audio_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null,
  info ? cast(const(GstAudioInfo)*)info._cPtr(No.Dup) : null, samples, offsets.length > 0 ? offsets.ptr : null);
  return _cretval ? new gstaudio.audio_meta.AudioMeta(cast(GstAudioMeta*)_cretval, buffer) : null;
}

/**
Append a new #GstAudioDownmixMeta to buffer.
matrix is a two-dimensional array of toPosition.length times fromPosition.length coefficients, i.e. the i-th
output channel is constructed by multiplying the input channels with the coefficients in matrix[i] and taking the
sum of the results.
Params:
buffer = a #GstBuffer
fromPosition = the channel positions of the source
toPosition = the channel positions of the destination
matrix = the matrix coefficients, one row for each destination channel with one coefficient for each source
channel (copied)
Returns: the #GstAudioDownmixMeta on buffer (borrowed from it) or null on error
*/
gstaudio.audio_downmix_meta.AudioDownmixMeta bufferAddAudioDownmixMeta(gst.buffer.Buffer buffer,
gstaudio.types.AudioChannelPosition[] fromPosition, gstaudio.types.AudioChannelPosition[] toPosition,
float[][] matrix) nothrow
{
  import glib.c.functions : g_log;
  import glib.c.types : GLogLevelFlags;

  if (matrix.length != toPosition.length)
  {
    g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.bufferAddAudioDownmixMeta matrix length %d does not match the number of destination channels %d",
    cast(int)matrix.length, cast(int)toPosition.length);
    return null;
  }

  auto _matrix = new const(float)*[](matrix.length); // Row pointers, the matrix is copied by the meta

  foreach (i, row; matrix)
  {
    if (row.length != fromPosition.length)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.bufferAddAudioDownmixMeta matrix[%d] length %d does not match the number of source channels %d",
      cast(int)i, cast(int)row.length, cast(int)fromPosition.length);
      return null;
    }

    _matrix[i] = row.ptr;
  }

  auto _cretval = gst_buffer_add_audio_downmix_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null,
  fromPosition.ptr, cast(int)fromPosition.length, toPosition.ptr, cast(int)toPosition.length, _matrix.ptr);
  return _cretval ? new gstaudio.audio_downmix_meta.AudioDownmixMeta(cast(GstAudioDownmixMeta*)_cretval, buffer) : null;
}

/**
Allocates and attaches a #GstDsdPlaneOffsetMeta on buffer, which must be writable for that purpose. The fields of
the meta are directly populated from the arguments of this function.
If offsets is empty, then the meta's offsets field is left uninitialized. This is useful if for example offset
values are to be calculated in the meta's offsets field in-place. Similarly, numBytesPerChannel can be set to 0,
but only if offsets is empty. This is useful if the number of bytes per channel is known only later.
It is not allowed for channels to overlap in memory, i.e. for each i in [0, channels), the range
[offsets[i], offsets[i] + numBytesPerChannel) must not overlap with any other such range. It is also not
allowed to specify parameters that would cause out-of-bounds memory access on buffer (both are checked).
This meta is only needed for non-interleaved (= planar) DSD data.
Params:
buffer = a #GstBuffer
numChannels = Number of channels in the DSD data
numBytesPerChannel = Number of bytes per channel
offsets = the offsets (in bytes) where each channel plane starts in the buffer, empty to leave them
uninitialized, otherwise its length must be numChannels
Returns: the #GstDsdPlaneOffsetMeta that was attached on the buffer (borrowed from it) or null on error
*/
gstaudio.dsd_plane_offset_meta.DsdPlaneOffsetMeta bufferAddDsdPlaneOffsetMeta(gst.buffer.Buffer buffer,
int numChannels, size_t numBytesPerChannel, size_t[] offsets = null) nothrow
{
  if (offsets.length > 0 && offsets.length != numChannels)
  {
    import glib.c.functions : g_log;
    import glib.c.types : GLogLevelFlags;
    g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.bufferAddDsdPlaneOffsetMeta offsets length %d does not match the number of channels %d",
    cast(int)offsets.length, numChannels);
    return null;
  }

  auto _cretval = gst_buffer_add_dsd_plane_offset_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null,
  numChannels, numBytesPerChannel, offsets.length > 0 ? offsets.ptr : null);
  return _cretval ? new gstaudio.dsd_plane_offset_meta.DsdPlaneOffsetMeta(cast(GstDsdPlaneOffsetMeta*)_cretval, buffer) : null;
}

/**
Converts DSD data from one layout and grouping format to another.
numDsdBytes must be an integer multiple of the width of both input and output format times numChannels (whole
frames). For example, if the input format is [gstaudio.types.DsdFormat.DsdFormatU32le], the output format is
[gstaudio.types.DsdFormat.DsdFormatU16be] and there are 2 channels, then numDsdBytes must be an integer
multiple of 8.
reverseByteBits is necessary if the bit order within the DSD bytes needs to be reversed. This is rarely
necessary, and is not to be confused with the endianness of formats (which determines the ordering of bytes).
The plane offsets define the starting offset of the planes (there is exactly one plane per channel of
numDsdBytes / numChannels bytes) within inputData and outputData respectively, they are required for
[gstaudio.types.AudioLayout.NonInterleaved] and ignored for [gstaudio.types.AudioLayout.Interleaved].
Params:
inputData = the DSD format conversion's input source, at least numDsdBytes long and containing the planes
outputData = the DSD format conversion's output destination, at least numDsdBytes long and containing the
planes
inputFormat = DSD format of the input data to convert from
outputFormat = DSD format of the output data to convert to
inputLayout = Input data layout
outputLayout = Output data layout
inputPlaneOffsets = Plane offsets for non-interleaved input data, one for each channel
outputPlaneOffsets = Plane offsets for non-interleaved output data, one for each channel
numDsdBytes = How many bytes with DSD data to convert
numChannels = Number of channels (must be at least 1)
reverseByteBits = If true, reverse the bits in each DSD byte
*/
void dsdConvert(const(ubyte)[] inputData, ubyte[] outputData, gstaudio.types.DsdFormat inputFormat,
gstaudio.types.DsdFormat outputFormat, gstaudio.types.AudioLayout inputLayout,
gstaudio.types.AudioLayout outputLayout, const(size_t)[] inputPlaneOffsets, const(size_t)[] outputPlaneOffsets,
size_t numDsdBytes, int numChannels, bool reverseByteBits) nothrow
{
  import glib.c.functions : g_log;
  import glib.c.types : GLogLevelFlags;

  if (numChannels < 1 || numDsdBytes == 0)
  {
    g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.dsdConvert numChannels %d and numDsdBytes %zu must be at least 1",
    numChannels, numDsdBytes);
    return;
  }

  // Check the format, layout, data length and plane offsets of the input or output
  bool checkData(string name, size_t dataLength, gstaudio.types.DsdFormat format, gstaudio.types.AudioLayout layout,
  const(size_t)[] planeOffsets)
  {
    auto width = gst_dsd_format_get_width(format);

    if (width == 0)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.dsdConvert invalid %.*s format %d",
      cast(int)name.length, name.ptr, cast(int)format);
      return false;
    }

    if (numDsdBytes % (width * numChannels) != 0)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.dsdConvert numDsdBytes %zu is not a multiple of the %.*s format width %u times the number of channels %d",
      numDsdBytes, cast(int)name.length, name.ptr, width, numChannels);
      return false;
    }

    if (dataLength < numDsdBytes)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.dsdConvert %.*s data length %zu is less than numDsdBytes %zu",
      cast(int)name.length, name.ptr, dataLength, numDsdBytes);
      return false;
    }

    if (layout == gstaudio.types.AudioLayout.Interleaved)
      return true;

    if (layout != gstaudio.types.AudioLayout.NonInterleaved)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.dsdConvert invalid %.*s layout %d",
      cast(int)name.length, name.ptr, cast(int)layout);
      return false;
    }

    if (planeOffsets.length != numChannels)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.dsdConvert %.*s plane offsets length %d does not match the number of channels %d",
      cast(int)name.length, name.ptr, cast(int)planeOffsets.length, numChannels);
      return false;
    }

    auto bytesPerPlane = numDsdBytes / numChannels;

    foreach (i, offset; planeOffsets)
    {
      if (offset > dataLength || dataLength - offset < bytesPerPlane)
      {
        g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.global.dsdConvert %.*s plane %d at offset %zu with %zu bytes exceeds the data length %zu",
        cast(int)name.length, name.ptr, cast(int)i, offset, bytesPerPlane, dataLength);
        return false;
      }
    }

    return true;
  }

  if (!checkData("input", inputData.length, inputFormat, inputLayout, inputPlaneOffsets)
    || !checkData("output", outputData.length, outputFormat, outputLayout, outputPlaneOffsets))
  return;

  gst_dsd_convert(inputData.ptr, outputData.ptr, inputFormat, outputFormat, inputLayout, outputLayout,
  inputLayout == gstaudio.types.AudioLayout.NonInterleaved ? inputPlaneOffsets.ptr : null,
  outputLayout == gstaudio.types.AudioLayout.NonInterleaved ? outputPlaneOffsets.ptr : null,
  numDsdBytes, numChannels, reverseByteBits);
}


/**
    Get the fallback channel-mask for the given number of channels.
    
    This function returns a reasonable fallback channel-mask and should be
    called as a last resort when the specific channel map is unknown.

    Params:
      channels = the number of channels
    Returns: a fallback channel-mask for channels or 0 when there is no
      mask and mono.
*/
ulong audioChannelGetFallbackMask(int channels) nothrow
{
  ulong _retval;
  _retval = gst_audio_channel_get_fallback_mask(channels);
  return _retval;
}

/**
    Convert the channels present in channel_mask to a position array
    (which should have at least channels entries ensured by caller).
    If channel_mask is set to 0, it is considered as 'not present' for purpose
    of conversion.
    A partially valid channel_mask with less bits set than the number
    of channels is considered valid.

    Params:
      channelMask = The input channel_mask
      position = The
          [gstaudio.types.AudioChannelPosition]<!-- -->s
    Returns: true if channel and channel mask are valid and could be converted
*/
bool audioChannelPositionsFromMask(ulong channelMask, gstaudio.types.AudioChannelPosition[] position) nothrow
{
  bool _retval;
  int _channels;
  if (position)
    _channels = cast(int)position.length;

  auto _position = cast(GstAudioChannelPosition*)position.ptr;
  _retval = cast(bool)gst_audio_channel_positions_from_mask(_channels, channelMask, _position);
  return _retval;
}

/**
    Convert the position array of channels channels to a bitmask.
    
    If force_order is true it additionally checks if the channels are
    in the order required by GStreamer.

    Params:
      position = The `GstAudioChannelPositions`
      forceOrder = Only consider the GStreamer channel order.
      channelMask = the output channel mask
    Returns: true if the channel positions are valid and could be converted.
*/
bool audioChannelPositionsToMask(gstaudio.types.AudioChannelPosition[] position, bool forceOrder, out ulong channelMask) nothrow
{
  bool _retval;
  int _channels;
  if (position)
    _channels = cast(int)position.length;

  auto _position = cast(GstAudioChannelPosition*)position.ptr;
  _retval = cast(bool)gst_audio_channel_positions_to_mask(_position, _channels, forceOrder, cast(ulong*)&channelMask);
  return _retval;
}

/**
    Converts position to a human-readable string representation for
    debugging purposes.

    Params:
      position = The `GstAudioChannelPositions`
          to convert.
    Returns: a newly allocated string representing
      position
*/
string audioChannelPositionsToString(gstaudio.types.AudioChannelPosition[] position) nothrow
{
  char* _cretval;
  int _channels;
  if (position)
    _channels = cast(int)position.length;

  auto _position = cast(GstAudioChannelPosition*)position.ptr;
  _cretval = gst_audio_channel_positions_to_string(_position, _channels);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Reorders the channel positions in position from any order to
    the GStreamer channel order.

    Params:
      position = The channel positions to
          reorder to.
    Returns: true if the channel positions are valid and reordering
      was successful.
*/
bool audioChannelPositionsToValidOrder(gstaudio.types.AudioChannelPosition[] position) nothrow
{
  bool _retval;
  int _channels;
  if (position)
    _channels = cast(int)position.length;

  auto _position = cast(GstAudioChannelPosition*)position.ptr;
  _retval = cast(bool)gst_audio_channel_positions_to_valid_order(_position, _channels);
  return _retval;
}

/**
    Checks if position contains valid channel positions for
    channels channels. If force_order is true it additionally
    checks if the channels are in the order required by GStreamer.

    Params:
      position = The `GstAudioChannelPositions`
          to check.
      forceOrder = Only consider the GStreamer channel order.
    Returns: true if the channel positions are valid.
*/
bool audioCheckValidChannelPositions(gstaudio.types.AudioChannelPosition[] position, bool forceOrder) nothrow
{
  bool _retval;
  int _channels;
  if (position)
    _channels = cast(int)position.length;

  auto _position = cast(GstAudioChannelPosition*)position.ptr;
  _retval = cast(bool)gst_audio_check_valid_channel_positions(_position, _channels, forceOrder);
  return _retval;
}

/** */
gobject.types.GType audioClippingMetaApiGetType() nothrow
{
  gobject.types.GType _retval;
  _retval = gst_audio_clipping_meta_api_get_type();
  return _retval;
}

/** */
gobject.types.GType audioDownmixMetaApiGetType() nothrow
{
  gobject.types.GType _retval;
  _retval = gst_audio_downmix_meta_api_get_type();
  return _retval;
}

/**
    Return all the raw audio formats supported by GStreamer.
    Returns: an array of #GstAudioFormat
*/
gstaudio.types.AudioFormat[] audioFormatsRaw() nothrow
{
  const(GstAudioFormat)* _cretval;
  uint _cretlength;
  _cretval = gst_audio_formats_raw(&_cretlength);
  gstaudio.types.AudioFormat[] _retval;

  if (_cretval)
  {
    _retval = new gstaudio.types.AudioFormat[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = cast(gstaudio.types.AudioFormat)(_cretval[i]);
  }
  return _retval;
}

/**
    Returns a reorder map for from to to that can be used in
    custom channel reordering code, e.g. to convert from or to the
    GStreamer channel order. from and to must contain the same
    number of positions and the same positions, only in a
    different order.
    
    The resulting reorder_map can be used for reordering by assigning
    channel i of the input to channel reorder_map[i] of the output.

    Params:
      from = The channel positions to reorder from.
      to = The channel positions to reorder to.
      reorderMap = Pointer to the reorder map.
    Returns: true if the channel positions are valid and reordering
      is possible.
*/
bool audioGetChannelReorderMap(gstaudio.types.AudioChannelPosition[] from, gstaudio.types.AudioChannelPosition[] to, int[] reorderMap) nothrow
{
  bool _retval;
  int _channels;
  if (from)
    _channels = cast(int)from.length;

  auto _from = cast(GstAudioChannelPosition*)from.ptr;
  if (to)
    _channels = cast(int)to.length;

  auto _to = cast(GstAudioChannelPosition*)to.ptr;
  if (reorderMap)
    _channels = cast(int)reorderMap.length;

  auto _reorderMap = cast(int*)reorderMap.ptr;
  _retval = cast(bool)gst_audio_get_channel_reorder_map(_channels, _from, _to, _reorderMap);
  return _retval;
}

/**
    Calculated the size of the buffer expected by [gstaudio.global.audioIec61937Payload] for
    payloading type from spec.

    Params:
      spec = the ringbufer spec
    Returns: the size or 0 if the given type is not supported or cannot be
      payloaded.
*/
uint audioIec61937FrameSize(gstaudio.audio_ring_buffer_spec.AudioRingBufferSpec spec) nothrow
{
  uint _retval;
  _retval = gst_audio_iec61937_frame_size(spec ? cast(const(GstAudioRingBufferSpec)*)spec._cPtr : null);
  return _retval;
}

/**
    Payloads src in the form specified by IEC 61937 for the type from spec and
    stores the result in dst. src must contain exactly one frame of data and
    the frame is not checked for errors.

    Params:
      src = a buffer containing the data to payload
      dst = the destination buffer to store the
              payloaded contents in. Should not overlap with src
      spec = the ringbufer spec for src
      endianness = the expected byte order of the payloaded data
    Returns: transfer-full: true if the payloading was successful, false
      otherwise.
*/
bool audioIec61937Payload(ubyte[] src, ubyte[] dst, gstaudio.audio_ring_buffer_spec.AudioRingBufferSpec spec, int endianness) nothrow
{
  bool _retval;
  uint _srcN;
  if (src)
    _srcN = cast(uint)src.length;

  auto _src = cast(ubyte*)src.ptr;
  uint _dstN;
  if (dst)
    _dstN = cast(uint)dst.length;

  auto _dst = cast(ubyte*)dst.ptr;
  _retval = cast(bool)gst_audio_iec61937_payload(_src, _srcN, _dst, _dstN, spec ? cast(const(GstAudioRingBufferSpec)*)spec._cPtr : null, endianness);
  return _retval;
}

/**
    Return the #GType associated with #GstAudioLevelMeta.
    Returns: a #GType
*/
gobject.types.GType audioLevelMetaApiGetType() nothrow
{
  gobject.types.GType _retval;
  _retval = gst_audio_level_meta_api_get_type();
  return _retval;
}

/**
    Return a generic raw audio caps for formats defined in formats.
    If formats is null returns a caps for all the supported raw audio formats,
    see [gstaudio.global.audioFormatsRaw].

    Params:
      formats = an array of raw #GstAudioFormat, or null
      layout = the layout of audio samples
    Returns: an audio GstCaps
*/
gst.caps.Caps audioMakeRawCaps(gstaudio.types.AudioFormat[] formats, gstaudio.types.AudioLayout layout) nothrow
{
  GstCaps* _cretval;
  uint _len;
  if (formats)
    _len = cast(uint)formats.length;

  auto _formats = cast(GstAudioFormat*)formats.ptr;
  _cretval = gst_audio_make_raw_caps(_formats, _len, layout);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/** */
gobject.types.GType audioMetaApiGetType() nothrow
{
  gobject.types.GType _retval;
  _retval = gst_audio_meta_api_get_type();
  return _retval;
}

/**
    Reorders data from the channel positions from to the channel
    positions to. from and to must contain the same number of
    positions and the same positions, only in a different order.
    
    This function internally calls [gstaudio.global.audioGetChannelReorderMap] and
    [gstaudio.global.audioReorderChannelsWithReorderMap]. It is more efficient to call
    [gstaudio.global.audioGetChannelReorderMap] once to retrieve the reorder map and
    then call [gstaudio.global.audioReorderChannelsWithReorderMap] with the same
    reorder map until the channel positions change.
    
    Note: this function assumes the audio data is in interleaved layout

    Params:
      data = The pointer to
          the memory.
      format = The [gstaudio.types.AudioFormat] of the buffer.
      from = The channel positions in the buffer.
      to = The channel positions to convert to.
    Returns: true if the reordering was possible.
*/
bool audioReorderChannels(ubyte[] data, gstaudio.types.AudioFormat format, gstaudio.types.AudioChannelPosition[] from, gstaudio.types.AudioChannelPosition[] to) nothrow
{
  bool _retval;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(ubyte*)data.ptr;
  int _channels;
  if (from)
    _channels = cast(int)from.length;

  auto _from = cast(GstAudioChannelPosition*)from.ptr;
  if (to)
    _channels = cast(int)to.length;

  auto _to = cast(GstAudioChannelPosition*)to.ptr;
  _retval = cast(bool)gst_audio_reorder_channels(_data, _size, format, _channels, _from, _to);
  return _retval;
}

/**
    Reorders data with the given reorder_map.
    
    The reorder map can be retrieved for example with
    [gstaudio.global.audioGetChannelReorderMap].
    
    Note: this function assumes the audio data is in interleaved layout

    Params:
      data = The pointer to
          the memory.
      bps = The number of bytes per sample.
      reorderMap = The channel reorder map.
*/
void audioReorderChannelsWithReorderMap(ubyte[] data, int bps, int[] reorderMap) nothrow
{
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(ubyte*)data.ptr;
  int _channels;
  if (reorderMap)
    _channels = cast(int)reorderMap.length;

  auto _reorderMap = cast(int*)reorderMap.ptr;
  gst_audio_reorder_channels_with_reorder_map(_data, _size, bps, _channels, _reorderMap);
}

/**
    Attaches #GstAudioClippingMeta metadata to buffer with the given parameters.

    Params:
      buffer = a #GstBuffer
      format = GstFormat of start and stop, GST_FORMAT_DEFAULT is samples
      start = Amount of audio to clip from start of buffer
      end = Amount of  to clip from end of buffer
    Returns: the #GstAudioClippingMeta on buffer.
*/
gstaudio.audio_clipping_meta.AudioClippingMeta bufferAddAudioClippingMeta(gst.buffer.Buffer buffer, gst.types.Format format, ulong start, ulong end) nothrow
{
  GstAudioClippingMeta* _cretval;
  _cretval = gst_buffer_add_audio_clipping_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, format, start, end);
  auto _retval = _cretval ? new gstaudio.audio_clipping_meta.AudioClippingMeta(cast(GstAudioClippingMeta*)_cretval, buffer) : null;
  return _retval;
}

/**
    Attaches audio level information to buffer. (RFC 6464)

    Params:
      buffer = a #GstBuffer
      level = the -dBov from 0-127 (127 is silence).
      voiceActivity = whether the buffer contains voice activity.
    Returns: the #GstAudioLevelMeta on buffer.
*/
gstaudio.audio_level_meta.AudioLevelMeta bufferAddAudioLevelMeta(gst.buffer.Buffer buffer, ubyte level, bool voiceActivity) nothrow
{
  GstAudioLevelMeta* _cretval;
  _cretval = gst_buffer_add_audio_level_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, level, voiceActivity);
  auto _retval = _cretval ? new gstaudio.audio_level_meta.AudioLevelMeta(cast(GstAudioLevelMeta*)_cretval, buffer) : null;
  return _retval;
}

/**
    Find the #GstAudioDownmixMeta on buffer for the given destination
    channel positions.

    Params:
      buffer = a #GstBuffer
      toPosition = the channel positions of
          the destination
    Returns: the #GstAudioDownmixMeta on buffer.
*/
gstaudio.audio_downmix_meta.AudioDownmixMeta bufferGetAudioDownmixMetaForChannels(gst.buffer.Buffer buffer, gstaudio.types.AudioChannelPosition[] toPosition) nothrow
{
  GstAudioDownmixMeta* _cretval;
  int _toChannels;
  if (toPosition)
    _toChannels = cast(int)toPosition.length;

  auto _toPosition = cast(GstAudioChannelPosition*)toPosition.ptr;
  _cretval = gst_buffer_get_audio_downmix_meta_for_channels(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, _toPosition, _toChannels);
  auto _retval = _cretval ? new gstaudio.audio_downmix_meta.AudioDownmixMeta(cast(GstAudioDownmixMeta*)_cretval, buffer) : null;
  return _retval;
}

/**
    Find the #GstAudioLevelMeta on buffer.

    Params:
      buffer = a #GstBuffer
    Returns: the #GstAudioLevelMeta or null when
      there is no such metadata on buffer.
*/
gstaudio.audio_level_meta.AudioLevelMeta bufferGetAudioLevelMeta(gst.buffer.Buffer buffer) nothrow
{
  GstAudioLevelMeta* _cretval;
  _cretval = gst_buffer_get_audio_level_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstaudio.audio_level_meta.AudioLevelMeta(cast(GstAudioLevelMeta*)_cretval, buffer) : null;
  return _retval;
}

/** */
gobject.types.GType dsdPlaneOffsetMetaApiGetType() nothrow
{
  gobject.types.GType _retval;
  _retval = gst_dsd_plane_offset_meta_api_get_type();
  return _retval;
}
