/// Module for [AudioRingBufferSpec] class
module gstaudio.audio_ring_buffer_spec;

public import gid.basictypes;
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

  /**
      Create a `audio_ring_buffer_spec.AudioRingBufferSpec` wrap type.
      Params:
        caps = The caps that generated the Spec.
        type = the sample type
        latencyTime = the latency in microseconds
        bufferTime = the total buffer size in microseconds
        segsize = the size of one segment in bytes
        segtotal = the total number of segments
        seglatency = number of segments queued in the lower level device,
           defaults to segtotal
  */
  this(gst.caps.Caps caps = gst.caps.Caps.init, gstaudio.types.AudioRingBufferFormatType type = gstaudio.types.AudioRingBufferFormatType.init, ulong latencyTime = ulong.init, ulong bufferTime = ulong.init, int segsize = int.init, int segtotal = int.init, int seglatency = int.init) nothrow
  {
    this.caps = caps;
    this.type = type;
    this.latencyTime = latencyTime;
    this.bufferTime = bufferTime;
    this.segsize = segsize;
    this.segtotal = segtotal;
    this.seglatency = seglatency;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstAudioRingBufferSpec*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  private gst.caps.Caps _capsRef; // Keeps borrowed field value alive

  /**
      Get `caps` field.
      Returns: The caps that generated the Spec.
  */
  @property gst.caps.Caps caps() nothrow
  {
    return cToD!(gst.caps.Caps)(cast(void*)(cast(GstAudioRingBufferSpec*)this._cPtr).caps);
  }

  /**
      Set `caps` field.
      Params:
        propval = The caps that generated the Spec.
  */
  @property void caps(gst.caps.Caps propval) nothrow
  {
    _capsRef = propval;
    (cast(GstAudioRingBufferSpec*)this._cPtr).caps = propval ? cast(GstCaps*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `type` field.
      Returns: the sample type
  */
  @property gstaudio.types.AudioRingBufferFormatType type() nothrow
  {
    return cast(gstaudio.types.AudioRingBufferFormatType)(cast(GstAudioRingBufferSpec*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the sample type
  */
  @property void type(gstaudio.types.AudioRingBufferFormatType propval) nothrow
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).type = cast(GstAudioRingBufferFormatType)propval;
  }

  /**
      Get `info` field.
      Returns: the #GstAudioInfo
  */
  @property gstaudio.audio_info.AudioInfo info() nothrow
  {
    return cToD!(gstaudio.audio_info.AudioInfo)(cast(void*)&(cast(GstAudioRingBufferSpec*)this._cPtr).info);
  }

  /**
      Get `latencyTime` field.
      Returns: the latency in microseconds
  */
  @property ulong latencyTime() nothrow
  {
    return (cast(GstAudioRingBufferSpec*)this._cPtr).latencyTime;
  }

  /**
      Set `latencyTime` field.
      Params:
        propval = the latency in microseconds
  */
  @property void latencyTime(ulong propval) nothrow
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).latencyTime = propval;
  }

  /**
      Get `bufferTime` field.
      Returns: the total buffer size in microseconds
  */
  @property ulong bufferTime() nothrow
  {
    return (cast(GstAudioRingBufferSpec*)this._cPtr).bufferTime;
  }

  /**
      Set `bufferTime` field.
      Params:
        propval = the total buffer size in microseconds
  */
  @property void bufferTime(ulong propval) nothrow
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).bufferTime = propval;
  }

  /**
      Get `segsize` field.
      Returns: the size of one segment in bytes
  */
  @property int segsize() nothrow
  {
    return (cast(GstAudioRingBufferSpec*)this._cPtr).segsize;
  }

  /**
      Set `segsize` field.
      Params:
        propval = the size of one segment in bytes
  */
  @property void segsize(int propval) nothrow
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).segsize = propval;
  }

  /**
      Get `segtotal` field.
      Returns: the total number of segments
  */
  @property int segtotal() nothrow
  {
    return (cast(GstAudioRingBufferSpec*)this._cPtr).segtotal;
  }

  /**
      Set `segtotal` field.
      Params:
        propval = the total number of segments
  */
  @property void segtotal(int propval) nothrow
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).segtotal = propval;
  }

  /**
      Get `seglatency` field.
      Returns: number of segments queued in the lower level device,
         defaults to segtotal
  */
  @property int seglatency() nothrow
  {
    return (cast(GstAudioRingBufferSpec*)this._cPtr).seglatency;
  }

  /**
      Set `seglatency` field.
      Params:
        propval = number of segments queued in the lower level device,
           defaults to segtotal
  */
  @property void seglatency(int propval) nothrow
  {
    (cast(GstAudioRingBufferSpec*)this._cPtr).seglatency = propval;
  }
}
