/// Module for [AudioRingBufferSpec] class
module gstaudio.audio_ring_buffer_spec;

import gid.gid;
import gst.caps;
import gstaudio.audio_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    The structure containing the format specification of the ringbuffer.
    
    When @type is GST_AUDIO_RING_BUFFER_FORMAT_TYPE_DSD, the @dsd_format
    is valid (otherwise it is unused). Also, when DSD is the sample type,
    only the rate, channels, position, and bpf fields in @info are populated.
*/
class AudioRingBufferSpec
{
  GstAudioRingBufferSpec _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_ring_buffer_spec.AudioRingBufferSpec");

    _cInstance = *cast(GstAudioRingBufferSpec*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `caps` field.
      Returns: The caps that generated the Spec.
  */
  @property gst.caps.Caps caps()
  {
    return cToD!(gst.caps.Caps)(cast(void*)(cast(GstAudioRingBufferSpec*)this._cPtr).caps);
  }

  /**
      Set `caps` field.
      Params:
        propval = The caps that generated the Spec.
  */
  @property void caps(gst.caps.Caps propval)
  {
    cValueFree!(gst.caps.Caps)(cast(void*)(cast(GstAudioRingBufferSpec*)this._cPtr).caps);
    dToC(propval, cast(void*)&(cast(GstAudioRingBufferSpec*)this._cPtr).caps);
  }

  /**
      Get `type` field.
      Returns: the sample type
  */
  @property gstaudio.types.AudioRingBufferFormatType type()
  {
    return cast(gstaudio.types.AudioRingBufferFormatType)(cast(GstAudioRingBufferSpec*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the sample type
  */
  @property void type(gstaudio.types.AudioRingBufferFormatType propval)
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).type = cast(GstAudioRingBufferFormatType)propval;
  }

  /**
      Get `info` field.
      Returns: the #GstAudioInfo
  */
  @property gstaudio.audio_info.AudioInfo info()
  {
    return cToD!(gstaudio.audio_info.AudioInfo)(cast(void*)&(cast(GstAudioRingBufferSpec*)this._cPtr).info);
  }

  /**
      Get `latencyTime` field.
      Returns: the latency in microseconds
  */
  @property ulong latencyTime()
  {
    return (cast(GstAudioRingBufferSpec*)this._cPtr).latencyTime;
  }

  /**
      Set `latencyTime` field.
      Params:
        propval = the latency in microseconds
  */
  @property void latencyTime(ulong propval)
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).latencyTime = propval;
  }

  /**
      Get `bufferTime` field.
      Returns: the total buffer size in microseconds
  */
  @property ulong bufferTime()
  {
    return (cast(GstAudioRingBufferSpec*)this._cPtr).bufferTime;
  }

  /**
      Set `bufferTime` field.
      Params:
        propval = the total buffer size in microseconds
  */
  @property void bufferTime(ulong propval)
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).bufferTime = propval;
  }

  /**
      Get `segsize` field.
      Returns: the size of one segment in bytes
  */
  @property int segsize()
  {
    return (cast(GstAudioRingBufferSpec*)this._cPtr).segsize;
  }

  /**
      Set `segsize` field.
      Params:
        propval = the size of one segment in bytes
  */
  @property void segsize(int propval)
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).segsize = propval;
  }

  /**
      Get `segtotal` field.
      Returns: the total number of segments
  */
  @property int segtotal()
  {
    return (cast(GstAudioRingBufferSpec*)this._cPtr).segtotal;
  }

  /**
      Set `segtotal` field.
      Params:
        propval = the total number of segments
  */
  @property void segtotal(int propval)
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).segtotal = propval;
  }

  /**
      Get `seglatency` field.
      Returns: number of segments queued in the lower level device,
         defaults to segtotal
  */
  @property int seglatency()
  {
    return (cast(GstAudioRingBufferSpec*)this._cPtr).seglatency;
  }

  /**
      Set `seglatency` field.
      Params:
        propval = number of segments queued in the lower level device,
           defaults to segtotal
  */
  @property void seglatency(int propval)
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).seglatency = propval;
  }
}
