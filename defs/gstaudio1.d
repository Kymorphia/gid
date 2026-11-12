//!gir GstAudio-1.0
//!info description "D binding for the GstAudio library - Audio library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstaudio1/
//!info capi https://gstreamer.freedesktop.org/documentation/audio/index.html

// Map functions return a MapScope which unmaps the structure (explicit unmap or scope exit), the unmap function is
// only used by the MapScope (unmapping a MapScope structure directly would unmap it twice)
//!set record[AudioBuffer].function[map][gid-unmap] gst_audio_buffer_unmap
//!set record[AudioBuffer].function[map][gid-map-source] gstbuffer
//!set record[AudioBuffer].method[unmap][ignore] 1

// Borrowed structure returns: owned by a parameter (buffer metas) or static/long-lived data (no owner)
//!set function[buffer_add_audio_clipping_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_audio_level_meta].return-value[][gid-borrow] buffer
//!set function[buffer_get_audio_downmix_meta_for_channels].return-value[][gid-borrow] buffer
//!set function[buffer_get_audio_level_meta].return-value[][gid-borrow] buffer

//# Disable callbacks with arrays with sizes not described by parameters (FIXME)
//!set callback[AudioFormatPack][disable] 1
//!set callback[AudioFormatUnpack][disable] 1

//# Unsupported callables with arrays whose sizes cannot be described by function arguments (FIXME)
//!set record[AudioChannelMixer].method[samples][disable] 1
//!set record[AudioConverter].method[samples][disable] 1
//!set record[AudioQuantize].method[samples][disable] 1
//!set record[AudioResampler].method[resample][disable] 1
//!set function[buffer_add_dsd_plane_offset_meta][disable] 1
//!set function[dsd_convert][disable] 1

//# Hand-written below: Offsets arrays with a length from the audio info channels
//!set function[buffer_add_audio_meta][ignore] 1
//!set record[AudioMeta].field[offsets][ignore] 1

//# Hand-written below: Arrays with a length from the ring buffer channels, downmix matrix of channel arrays
//!set class[AudioRingBuffer].method[set_channel_positions][ignore] 1
//!set function[buffer_add_audio_downmix_meta][ignore] 1
//!set record[AudioDownmixMeta].field[matrix][ignore] 1

//# Set basic parameters to out
//!set callback[AudioBaseSinkCustomSlavingCallback].parameters.parameter[requested_skew][direction] out


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[AudioBuffer].field[info][writable] 0
//!set record[AudioClippingMeta].field[meta][writable] 0
//!set record[AudioDownmixMeta].field[meta][writable] 0
//!set record[AudioDownmixMeta].field[from_position][writable] 0
//!set record[AudioDownmixMeta].field[to_position][writable] 0
//!set record[AudioLevelMeta].field[meta][writable] 0
//!set record[AudioMeta].field[meta][writable] 0
//!set record[AudioMeta].field[info][writable] 0
//!set record[AudioRingBufferSpec].field[info][writable] 0
//!set record[DsdPlaneOffsetMeta].field[meta][writable] 0

//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[AudioFormatInfo].field[name][writable] 0
//!set record[AudioFormatInfo].field[description][writable] 0
//!set record[AudioInfo].field[finfo][writable] 0

//# Ignore: Internal/implementation-only API, not useful from D
//!set record[AudioFormatInfo].field[unpack_func][ignore] 1
//!set record[AudioFormatInfo].field[pack_func][ignore] 1

//# Ignore: Property type Gst.Fraction is a fundamental GValue type, replaced by gst.types.Fraction properties below
//!set class[AudioAggregator].property[output-buffer-duration-fraction][ignore] 1

//# Set array field lengths from their length fields (read-only, set when mapping the buffer or adding the meta)
//!set record[AudioBuffer].field[planes].type '<array length="2" zero-terminated="0" c:type="gpointer*"><type name="gpointer" c:type="gpointer"/></array>'
//!set record[AudioBuffer].field[planes][writable] 0
//!set record[DsdPlaneOffsetMeta].field[offsets].type '<array length="1" zero-terminated="0" c:type="gsize*"><type name="gsize" c:type="gsize"/></array>'
//!set record[DsdPlaneOffsetMeta].field[offsets][writable] 0

//# Add output-buffer-duration-fraction property, using the gst.types.Fraction D value type
//!class AudioAggregator pre
import gst.types;

//!class AudioAggregator

  /**
      Get `outputBufferDurationFraction` property.
      Returns: Output block size in nanoseconds, expressed as a fraction.
  */
  @property gst.types.Fraction outputBufferDurationFraction() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gst.types.Fraction)("output-buffer-duration-fraction");
  }

  /**
      Set `outputBufferDurationFraction` property.
      Params:
        propval = Output block size in nanoseconds, expressed as a fraction.
  */
  @property void outputBufferDurationFraction(gst.types.Fraction propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gst.types.Fraction)("output-buffer-duration-fraction", propval);
  }

//!class AudioAggregatorGidBuilder

  /**
      Set `outputBufferDurationFraction` property.
      Params:
        propval = Output block size in nanoseconds, expressed as a fraction.
      Returns: Builder instance for fluent chaining
  */
  T outputBufferDurationFraction(gst.types.Fraction propval) nothrow
  {
    return setProperty("output-buffer-duration-fraction", propval);
  }
//!class global pre

import gstaudio.audio_downmix_meta;
import gstaudio.audio_info;
import gstaudio.audio_meta;

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

//!class AudioDownmixMeta

  /**
      Get `matrix` field.
      Returns: the matrix coefficients (copied), one row for each destination channel with one coefficient for each
        source channel
  */
  @property float[][] matrix() nothrow
  {
    auto meta = cast(GstAudioDownmixMeta*)this._cPtr;

    if (!meta.matrix || meta.toChannels <= 0 || meta.fromChannels <= 0)
      return null;

    auto _retval = new float[][](meta.toChannels);

    foreach (i, ref row; _retval)
      row = meta.matrix[i] ? meta.matrix[i][0 .. meta.fromChannels].dup : new float[](meta.fromChannels);

    return _retval;
  }

//!class AudioRingBuffer

  /**
      Tell the ringbuffer that it is about to receive samples with the given channel positions.
      Params:
        position = the device channel positions, its length must be the number of channels of the acquired ring
          buffer spec
  */
  void setChannelPositions(gstaudio.types.AudioChannelPosition[] position) nothrow
  {
    import glib.c.functions : g_log;
    import glib.c.types : GLogLevelFlags;

    auto channels = (cast(GstAudioRingBuffer*)this._cPtr).spec.info.channels;

    if (position.length != channels)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstaudio.audio_ring_buffer.AudioRingBuffer.setChannelPositions position length %d does not match the number of channels %d",
        cast(int)position.length, channels);
      return;
    }

    gst_audio_ring_buffer_set_channel_positions(cast(GstAudioRingBuffer*)this._cPtr, position.ptr);
  }

//!class AudioMeta

  /**
      Get `offsets` field.
      Returns: the offsets (in bytes) where each channel plane starts in the buffer, one for each channel of the
        audio info, or null if the buffer has interleaved layout
  */
  @property size_t[] offsets() nothrow
  {
    auto meta = cast(GstAudioMeta*)this._cPtr;

    if (!meta.offsets || meta.info.channels <= 0)
      return null;

    return meta.offsets[0 .. meta.info.channels].dup;
  }
