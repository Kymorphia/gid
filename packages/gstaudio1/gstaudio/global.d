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


/**
    Get the fallback channel-mask for the given number of channels.
    
    This function returns a reasonable fallback channel-mask and should be
    called as a last resort when the specific channel map is unknown.

    Params:
      channels = the number of channels
    Returns: a fallback channel-mask for channels or 0 when there is no
      mask and mono.
*/
ulong audioChannelGetFallbackMask(int channels)
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
bool audioChannelPositionsFromMask(ulong channelMask, gstaudio.types.AudioChannelPosition[] position)
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
bool audioChannelPositionsToMask(gstaudio.types.AudioChannelPosition[] position, bool forceOrder, out ulong channelMask)
{
  bool _retval;
  int _channels;
  if (position)
    _channels = cast(int)position.length;

  auto _position = cast(const(GstAudioChannelPosition)*)position.ptr;
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
string audioChannelPositionsToString(gstaudio.types.AudioChannelPosition[] position)
{
  char* _cretval;
  int _channels;
  if (position)
    _channels = cast(int)position.length;

  auto _position = cast(const(GstAudioChannelPosition)*)position.ptr;
  _cretval = gst_audio_channel_positions_to_string(_position, _channels);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
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
bool audioChannelPositionsToValidOrder(gstaudio.types.AudioChannelPosition[] position)
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
bool audioCheckValidChannelPositions(gstaudio.types.AudioChannelPosition[] position, bool forceOrder)
{
  bool _retval;
  int _channels;
  if (position)
    _channels = cast(int)position.length;

  auto _position = cast(const(GstAudioChannelPosition)*)position.ptr;
  _retval = cast(bool)gst_audio_check_valid_channel_positions(_position, _channels, forceOrder);
  return _retval;
}

/** */
gobject.types.GType audioClippingMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_audio_clipping_meta_api_get_type();
  return _retval;
}

/** */
gobject.types.GType audioDownmixMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_audio_downmix_meta_api_get_type();
  return _retval;
}

/** */
gobject.types.GType audioFormatInfoGetType()
{
  gobject.types.GType _retval;
  _retval = gst_audio_format_info_get_type();
  return _retval;
}

/**
    Return all the raw audio formats supported by GStreamer.
    Returns: an array of #GstAudioFormat
*/
gstaudio.types.AudioFormat[] audioFormatsRaw()
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
bool audioGetChannelReorderMap(gstaudio.types.AudioChannelPosition[] from, gstaudio.types.AudioChannelPosition[] to, int[] reorderMap)
{
  bool _retval;
  int _channels;
  if (from)
    _channels = cast(int)from.length;

  auto _from = cast(const(GstAudioChannelPosition)*)from.ptr;
  if (to)
    _channels = cast(int)to.length;

  auto _to = cast(const(GstAudioChannelPosition)*)to.ptr;
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
uint audioIec61937FrameSize(gstaudio.audio_ring_buffer_spec.AudioRingBufferSpec spec)
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
bool audioIec61937Payload(ubyte[] src, ubyte[] dst, gstaudio.audio_ring_buffer_spec.AudioRingBufferSpec spec, int endianness)
{
  bool _retval;
  uint _srcN;
  if (src)
    _srcN = cast(uint)src.length;

  auto _src = cast(const(ubyte)*)src.ptr;
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
gobject.types.GType audioLevelMetaApiGetType()
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
gst.caps.Caps audioMakeRawCaps(gstaudio.types.AudioFormat[] formats, gstaudio.types.AudioLayout layout)
{
  GstCaps* _cretval;
  uint _len;
  if (formats)
    _len = cast(uint)formats.length;

  auto _formats = cast(const(GstAudioFormat)*)formats.ptr;
  _cretval = gst_audio_make_raw_caps(_formats, _len, layout);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/** */
gobject.types.GType audioMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_audio_meta_api_get_type();
  return _retval;
}

/**
    Reorders data from the channel positions from to the channel
    positions to. from and to must contain the same number of
    positions and the same positions, only in a different order.
    
    Note: this function assumes the audio data is in interleaved layout

    Params:
      data = The pointer to
          the memory.
      format = The [gstaudio.types.AudioFormat] of the buffer.
      from = The channel positions in the buffer.
      to = The channel positions to convert to.
    Returns: true if the reordering was possible.
*/
bool audioReorderChannels(ubyte[] data, gstaudio.types.AudioFormat format, gstaudio.types.AudioChannelPosition[] from, gstaudio.types.AudioChannelPosition[] to)
{
  bool _retval;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(void*)data.ptr;
  int _channels;
  if (from)
    _channels = cast(int)from.length;

  auto _from = cast(const(GstAudioChannelPosition)*)from.ptr;
  if (to)
    _channels = cast(int)to.length;

  auto _to = cast(const(GstAudioChannelPosition)*)to.ptr;
  _retval = cast(bool)gst_audio_reorder_channels(_data, _size, format, _channels, _from, _to);
  return _retval;
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
gstaudio.audio_clipping_meta.AudioClippingMeta bufferAddAudioClippingMeta(gst.buffer.Buffer buffer, gst.types.Format format, ulong start, ulong end)
{
  GstAudioClippingMeta* _cretval;
  _cretval = gst_buffer_add_audio_clipping_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, format, start, end);
  auto _retval = _cretval ? new gstaudio.audio_clipping_meta.AudioClippingMeta(cast(GstAudioClippingMeta*)_cretval, No.Take) : null;
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
gstaudio.audio_level_meta.AudioLevelMeta bufferAddAudioLevelMeta(gst.buffer.Buffer buffer, ubyte level, bool voiceActivity)
{
  GstAudioLevelMeta* _cretval;
  _cretval = gst_buffer_add_audio_level_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, level, voiceActivity);
  auto _retval = _cretval ? new gstaudio.audio_level_meta.AudioLevelMeta(cast(GstAudioLevelMeta*)_cretval, No.Take) : null;
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
gstaudio.audio_downmix_meta.AudioDownmixMeta bufferGetAudioDownmixMetaForChannels(gst.buffer.Buffer buffer, gstaudio.types.AudioChannelPosition[] toPosition)
{
  GstAudioDownmixMeta* _cretval;
  int _toChannels;
  if (toPosition)
    _toChannels = cast(int)toPosition.length;

  auto _toPosition = cast(const(GstAudioChannelPosition)*)toPosition.ptr;
  _cretval = gst_buffer_get_audio_downmix_meta_for_channels(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, _toPosition, _toChannels);
  auto _retval = _cretval ? new gstaudio.audio_downmix_meta.AudioDownmixMeta(cast(GstAudioDownmixMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Find the #GstAudioLevelMeta on buffer.

    Params:
      buffer = a #GstBuffer
    Returns: the #GstAudioLevelMeta or null when
      there is no such metadata on buffer.
*/
gstaudio.audio_level_meta.AudioLevelMeta bufferGetAudioLevelMeta(gst.buffer.Buffer buffer)
{
  GstAudioLevelMeta* _cretval;
  _cretval = gst_buffer_get_audio_level_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstaudio.audio_level_meta.AudioLevelMeta(cast(GstAudioLevelMeta*)_cretval, No.Take) : null;
  return _retval;
}

/** */
gobject.types.GType dsdPlaneOffsetMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_dsd_plane_offset_meta_api_get_type();
  return _retval;
}
