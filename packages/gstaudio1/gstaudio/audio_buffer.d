/// Module for [AudioBuffer] class
module gstaudio.audio_buffer;

import gid.gid;
import gst.buffer;
import gst.segment;
import gst.types;
import gstaudio.audio_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    A structure containing the result of an audio buffer map operation,
    which is executed with [gstaudio.audio_buffer.AudioBuffer.map]. For non-interleaved (planar)
    buffers, the beginning of each channel in the buffer has its own pointer in
    the @planes array. For interleaved buffers, the @planes array only contains
    one item, which is the pointer to the beginning of the buffer, and @n_planes
    equals 1.
    
    The different channels in @planes are always in the GStreamer channel order.
*/
class AudioBuffer
{
  GstAudioBuffer cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_buffer.AudioBuffer");

    cInstance = *cast(GstAudioBuffer*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `info` field.
      Returns: a #GstAudioInfo describing the audio properties of this buffer
  */
  @property gstaudio.audio_info.AudioInfo info()
  {
    return cToD!(gstaudio.audio_info.AudioInfo)(cast(void*)&(cast(GstAudioBuffer*)this._cPtr).info);
  }

  /**
      Get `nSamples` field.
      Returns: the size of the buffer in samples
  */
  @property size_t nSamples()
  {
    return (cast(GstAudioBuffer*)this._cPtr).nSamples;
  }

  /**
      Set `nSamples` field.
      Params:
        propval = the size of the buffer in samples
  */
  @property void nSamples(size_t propval)
  {
    (cast(GstAudioBuffer*)this._cPtr).nSamples = propval;
  }

  /**
      Get `nPlanes` field.
      Returns: the number of planes available
  */
  @property int nPlanes()
  {
    return (cast(GstAudioBuffer*)this._cPtr).nPlanes;
  }

  /**
      Set `nPlanes` field.
      Params:
        propval = the number of planes available
  */
  @property void nPlanes(int propval)
  {
    (cast(GstAudioBuffer*)this._cPtr).nPlanes = propval;
  }

  /**
      Get `buffer` field.
      Returns: the mapped buffer
  */
  @property gst.buffer.Buffer buffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstAudioBuffer*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = the mapped buffer
  */
  @property void buffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstAudioBuffer*)this._cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstAudioBuffer*)this._cPtr).buffer);
  }

  /**
      Unmaps an audio buffer that was previously mapped with
      [gstaudio.audio_buffer.AudioBuffer.map].
  */
  void unmap()
  {
    gst_audio_buffer_unmap(cast(GstAudioBuffer*)this._cPtr);
  }

  /**
      Clip the buffer to the given [gst.segment.Segment].
      
      After calling this function the caller does not own a reference to
      buffer anymore.
  
      Params:
        buffer = The buffer to clip.
        segment = Segment in [gst.types.Format.Time] or [gst.types.Format.Default] to which
                    the buffer should be clipped.
        rate = sample rate.
        bpf = size of one audio frame in bytes. This is the size of one sample *
          number of channels.
      Returns: null if the buffer is completely outside the configured segment,
        otherwise the clipped buffer is returned.
        
        If the buffer has no timestamp, it is assumed to be inside the segment and
        is not clipped
  */
  static gst.buffer.Buffer clip(gst.buffer.Buffer buffer, gst.segment.Segment segment, int rate, int bpf)
  {
    GstBuffer* _cretval;
    _cretval = gst_audio_buffer_clip(buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null, segment ? cast(const(GstSegment)*)segment._cPtr(No.Dup) : null, rate, bpf);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Maps an audio gstbuffer so that it can be read or written and stores the
      result of the map operation in buffer.
      
      This is especially useful when the gstbuffer is in non-interleaved (planar)
      layout, in which case this function will use the information in the
      gstbuffer's attached #GstAudioMeta in order to map each channel in a
      separate "plane" in #GstAudioBuffer. If a #GstAudioMeta is not attached
      on the gstbuffer, then it must be in interleaved layout.
      
      If a #GstAudioMeta is attached, then the #GstAudioInfo on the meta is checked
      against info. Normally, they should be equal, but in case they are not,
      a g_critical will be printed and the #GstAudioInfo from the meta will be
      used.
      
      In non-interleaved buffers, it is possible to have each channel on a separate
      #GstMemory. In this case, each memory will be mapped separately to avoid
      copying their contents in a larger memory area. Do note though that it is
      not supported to have a single channel spanning over two or more different
      #GstMemory objects. Although the map operation will likely succeed in this
      case, it will be highly sub-optimal and it is recommended to merge all the
      memories in the buffer before calling this function.
      
      Note: The actual #GstBuffer is not ref'ed, but it is required to stay valid
      as long as it's mapped.
  
      Params:
        buffer = pointer to a #GstAudioBuffer
        info = the audio properties of the buffer
        gstbuffer = the #GstBuffer to be mapped
        flags = the access mode for the memory
      Returns: true if the map operation succeeded or false on failure
  */
  static bool map(out gstaudio.audio_buffer.AudioBuffer buffer, gstaudio.audio_info.AudioInfo info, gst.buffer.Buffer gstbuffer, gst.types.MapFlags flags)
  {
    bool _retval;
    GstAudioBuffer _buffer;
    _retval = cast(bool)gst_audio_buffer_map(&_buffer, info ? cast(const(GstAudioInfo)*)info._cPtr(No.Dup) : null, gstbuffer ? cast(GstBuffer*)gstbuffer._cPtr(No.Dup) : null, flags);
    buffer = new gstaudio.audio_buffer.AudioBuffer(cast(void*)&_buffer, No.Take);
    return _retval;
  }

  /**
      Reorders buffer from the channel positions from to the channel
      positions to. from and to must contain the same number of
      positions and the same positions, only in a different order.
      buffer must be writable.
  
      Params:
        buffer = The buffer to reorder.
        format = The [gstaudio.types.AudioFormat] of the buffer.
        from = The channel positions in the buffer.
        to = The channel positions to convert to.
      Returns: true if the reordering was possible.
  */
  static bool reorderChannels(gst.buffer.Buffer buffer, gstaudio.types.AudioFormat format, gstaudio.types.AudioChannelPosition[] from, gstaudio.types.AudioChannelPosition[] to)
  {
    bool _retval;
    int _channels;
    if (from)
      _channels = cast(int)from.length;

    auto _from = cast(const(GstAudioChannelPosition)*)from.ptr;
    if (to)
      _channels = cast(int)to.length;

    auto _to = cast(const(GstAudioChannelPosition)*)to.ptr;
    _retval = cast(bool)gst_audio_buffer_reorder_channels(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, format, _channels, _from, _to);
    return _retval;
  }

  /**
      Truncate the buffer to finally have samples number of samples, removing
      the necessary amount of samples from the end and trim number of samples
      from the beginning.
      
      This function does not know the audio rate, therefore the caller is
      responsible for re-setting the correct timestamp and duration to the
      buffer. However, timestamp will be preserved if trim == 0, and duration
      will also be preserved if there is no trimming to be done. Offset and
      offset end will be preserved / updated.
      
      After calling this function the caller does not own a reference to
      buffer anymore.
  
      Params:
        buffer = The buffer to truncate.
        bpf = size of one audio frame in bytes. This is the size of one sample *
          number of channels.
        trim = the number of samples to remove from the beginning of the buffer
        samples = the final number of samples that should exist in this buffer or -1
          to use all the remaining samples if you are only removing samples from the
          beginning.
      Returns: the truncated buffer
  */
  static gst.buffer.Buffer truncate(gst.buffer.Buffer buffer, int bpf, size_t trim, size_t samples)
  {
    GstBuffer* _cretval;
    _cretval = gst_audio_buffer_truncate(buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null, bpf, trim, samples);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
