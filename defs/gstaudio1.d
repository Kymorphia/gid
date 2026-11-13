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

//# Hand-written below: DSD plane offsets arrays with a length from the number of channels, DSD conversion data with
//# sizes from the formats, layouts, plane offsets, number of bytes and channels
//!set function[buffer_add_dsd_plane_offset_meta][ignore] 1
//!set function[dsd_convert][ignore] 1

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
