/// Module for [AudioRingBuffer] class
module gstaudio.audio_ring_buffer;

import gid.gid;
import gobject.object;
import gst.caps;
import gst.object;
import gst.types;
import gstaudio.audio_ring_buffer_spec;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    This object is the base class for audio ringbuffers used by the base
    audio source and sink classes.
    
    The ringbuffer abstracts a circular buffer of data. One reader and
    one writer can operate on the data from different threads in a lockfree
    manner. The base class is sufficiently flexible to be used as an
    abstraction for DMA based ringbuffers as well as a pure software
    implementations.
*/
class AudioRingBuffer : gst.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_ring_buffer_get_type != &gidSymbolNotFound ? gst_audio_ring_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioRingBuffer self()
  {
    return this;
  }

  /**
      Print debug info about the buffer sized in spec to the debug log.
  
      Params:
        spec = the spec to debug
  */
  static void debugSpecBuff(gstaudio.audio_ring_buffer_spec.AudioRingBufferSpec spec)
  {
    gst_audio_ring_buffer_debug_spec_buff(spec ? cast(GstAudioRingBufferSpec*)spec._cPtr : null);
  }

  /**
      Print debug info about the parsed caps in spec to the debug log.
  
      Params:
        spec = the spec to debug
  */
  static void debugSpecCaps(gstaudio.audio_ring_buffer_spec.AudioRingBufferSpec spec)
  {
    gst_audio_ring_buffer_debug_spec_caps(spec ? cast(GstAudioRingBufferSpec*)spec._cPtr : null);
  }

  /**
      Parse caps into spec.
  
      Params:
        spec = a spec
        caps = a #GstCaps
      Returns: TRUE if the caps could be parsed.
  */
  static bool parseCaps(gstaudio.audio_ring_buffer_spec.AudioRingBufferSpec spec, gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_parse_caps(spec ? cast(GstAudioRingBufferSpec*)spec._cPtr : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Allocate the resources for the ringbuffer. This function fills
      in the data pointer of the ring buffer with a valid #GstBuffer
      to which samples can be written.
  
      Params:
        spec = the specs of the buffer
      Returns: TRUE if the device could be acquired, FALSE on error.
        
        MT safe.
  */
  bool acquire(gstaudio.audio_ring_buffer_spec.AudioRingBufferSpec spec)
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_acquire(cast(GstAudioRingBuffer*)this._cPtr, spec ? cast(GstAudioRingBufferSpec*)spec._cPtr : null);
    return _retval;
  }

  /**
      Activate buf to start or stop pulling data.
      
      MT safe.
  
      Params:
        active = the new mode
      Returns: TRUE if the device could be activated in the requested mode,
        FALSE on error.
  */
  bool activate(bool active)
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_activate(cast(GstAudioRingBuffer*)this._cPtr, active);
    return _retval;
  }

  /**
      Subclasses should call this function to notify the fact that
      advance segments are now processed by the device.
      
      MT safe.
  
      Params:
        advance = the number of segments written
  */
  void advance(uint advance)
  {
    gst_audio_ring_buffer_advance(cast(GstAudioRingBuffer*)this._cPtr, advance);
  }

  /**
      Clear the given segment of the buffer with silence samples.
      This function is used by subclasses.
      
      MT safe.
  
      Params:
        segment = the segment to clear
  */
  void clear(int segment)
  {
    gst_audio_ring_buffer_clear(cast(GstAudioRingBuffer*)this._cPtr, segment);
  }

  /**
      Clear all samples from the ringbuffer.
      
      MT safe.
  */
  void clearAll()
  {
    gst_audio_ring_buffer_clear_all(cast(GstAudioRingBuffer*)this._cPtr);
  }

  /**
      Close the audio device associated with the ring buffer. The ring buffer
      should already have been released via [gstaudio.audio_ring_buffer.AudioRingBuffer.release].
      Returns: TRUE if the device could be closed, FALSE on error.
        
        MT safe.
  */
  bool closeDevice()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_close_device(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Commit in_samples samples pointed to by data to the ringbuffer buf.
      
      in_samples and out_samples define the rate conversion to perform on the
      samples in data. For negative rates, out_samples must be negative and
      in_samples positive.
      
      When out_samples is positive, the first sample will be written at position sample
      in the ringbuffer. When out_samples is negative, the last sample will be written to
      sample in reverse order.
      
      out_samples does not need to be a multiple of the segment size of the ringbuffer
      although it is recommended for optimal performance.
      
      accum will hold a temporary accumulator used in rate conversion and should be
      set to 0 when this function is first called. In case the commit operation is
      interrupted, one can resume the processing by passing the previously returned
      accum value back to this function.
      
      MT safe.
  
      Params:
        sample = the sample position of the data
        data = the data to commit
        outSamples = the number of samples to write to the ringbuffer
        accum = accumulator for rate conversion.
      Returns: The number of samples written to the ringbuffer or -1 on error. The
        number of samples written can be less than out_samples when buf was interrupted
        with a flush or stop.
  */
  uint commit(ref ulong sample, ubyte[] data, int outSamples, ref int accum)
  {
    uint _retval;
    int _inSamples;
    if (data)
      _inSamples = cast(int)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = gst_audio_ring_buffer_commit(cast(GstAudioRingBuffer*)this._cPtr, cast(ulong*)&sample, _data, _inSamples, outSamples, cast(int*)&accum);
    return _retval;
  }

  /**
      Convert src_val in src_fmt to the equivalent value in dest_fmt. The result
      will be put in dest_val.
  
      Params:
        srcFmt = the source format
        srcVal = the source value
        destFmt = the destination format
        destVal = a location to store the converted value
      Returns: TRUE if the conversion succeeded.
  */
  bool convert(gst.types.Format srcFmt, long srcVal, gst.types.Format destFmt, out long destVal)
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_convert(cast(GstAudioRingBuffer*)this._cPtr, srcFmt, srcVal, destFmt, cast(long*)&destVal);
    return _retval;
  }

  /**
      Get the number of samples queued in the audio device. This is
      usually less than the segment size but can be bigger when the
      implementation uses another internal buffer between the audio
      device.
      
      For playback ringbuffers this is the amount of samples transferred from the
      ringbuffer to the device but still not played.
      
      For capture ringbuffers this is the amount of samples in the device that are
      not yet transferred to the ringbuffer.
      Returns: The number of samples queued in the audio device.
        
        MT safe.
  */
  uint delay()
  {
    uint _retval;
    _retval = gst_audio_ring_buffer_delay(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Checks the status of the device associated with the ring buffer.
      Returns: TRUE if the device was open, FALSE if it was closed.
        
        MT safe.
  */
  bool deviceIsOpen()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_device_is_open(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Check if the ringbuffer is acquired and ready to use.
      Returns: TRUE if the ringbuffer is acquired, FALSE on error.
        
        MT safe.
  */
  bool isAcquired()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_is_acquired(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Check if buf is activated.
      
      MT safe.
      Returns: TRUE if the device is active.
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_is_active(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Check if buf is flushing.
      
      MT safe.
      Returns: TRUE if the device is flushing.
  */
  bool isFlushing()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_is_flushing(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Tell the ringbuffer that it is allowed to start playback when
      the ringbuffer is filled with samples.
      
      MT safe.
  
      Params:
        allowed = the new value
  */
  void mayStart(bool allowed)
  {
    gst_audio_ring_buffer_may_start(cast(GstAudioRingBuffer*)this._cPtr, allowed);
  }

  /**
      Open the audio device associated with the ring buffer. Does not perform any
      setup on the device. You must open the device before acquiring the ring
      buffer.
      Returns: TRUE if the device could be opened, FALSE on error.
        
        MT safe.
  */
  bool openDevice()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_open_device(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Pause processing samples from the ringbuffer.
      Returns: TRUE if the device could be paused, FALSE on error.
        
        MT safe.
  */
  bool pause()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_pause(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Returns a pointer to memory where the data from segment segment
      can be found. This function is mostly used by subclasses.
  
      Params:
        segment = the segment to read
        readptr = the pointer to the memory where samples can be read
      Returns: FALSE if the buffer is not started.
        
        MT safe.
  */
  bool prepareRead(out int segment, out ubyte[] readptr)
  {
    bool _retval;
    int _len;
    ubyte* _readptr;
    _retval = cast(bool)gst_audio_ring_buffer_prepare_read(cast(GstAudioRingBuffer*)this._cPtr, cast(int*)&segment, &_readptr, &_len);
    readptr.length = _len;
    readptr[0 .. $] = (cast(ubyte*)_readptr)[0 .. _len];
    gFree(cast(void*)_readptr);
    return _retval;
  }

  /**
      Read len samples from the ringbuffer into the memory pointed
      to by data.
      The first sample should be read from position sample in
      the ringbuffer.
      
      len should not be a multiple of the segment size of the ringbuffer
      although it is recommended.
      
      timestamp will return the timestamp associated with the data returned.
  
      Params:
        sample = the sample position of the data
        data = where the data should be read
        timestamp = where the timestamp is returned
      Returns: The number of samples read from the ringbuffer or -1 on
        error.
        
        MT safe.
  */
  uint read(ulong sample, ubyte[] data, out gst.types.ClockTime timestamp)
  {
    uint _retval;
    uint _len;
    if (data)
      _len = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = gst_audio_ring_buffer_read(cast(GstAudioRingBuffer*)this._cPtr, sample, _data, _len, cast(GstClockTime*)&timestamp);
    return _retval;
  }

  /**
      Free the resources of the ringbuffer.
      Returns: TRUE if the device could be released, FALSE on error.
        
        MT safe.
  */
  bool release()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_release(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of samples that were processed by the ringbuffer
      since it was last started. This does not include the number of samples not
      yet processed (see [gstaudio.audio_ring_buffer.AudioRingBuffer.delay]).
      Returns: The number of samples processed by the ringbuffer.
        
        MT safe.
  */
  ulong samplesDone()
  {
    ulong _retval;
    _retval = gst_audio_ring_buffer_samples_done(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Sets the given callback function on the buffer. This function
      will be called every time a segment has been written to a device.
      
      MT safe.
  
      Params:
        cb = the callback to set
  */
  void setCallback(gstaudio.types.AudioRingBufferCallback cb = null)
  {
    extern(C) void _cbCallback(GstAudioRingBuffer* rbuf, ubyte* data, uint len, void* userData)
    {
      auto _dlg = cast(gstaudio.types.AudioRingBufferCallback*)userData;
      ubyte[] _data;
      _data.length = len;
      _data[0 .. len] = data[0 .. len];

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstaudio.audio_ring_buffer.AudioRingBuffer)(cast(void*)rbuf, No.Take), _data);
    }
    auto _cbCB = cb ? &_cbCallback : null;
    auto _cb = cb ? freezeDelegate(cast(void*)&cb) : null;
    GDestroyNotify _cbDestroyCB = cb ? &thawDelegate : null;
    gst_audio_ring_buffer_set_callback_full(cast(GstAudioRingBuffer*)this._cPtr, _cbCB, _cb, _cbDestroyCB);
  }

  /**
      Mark the ringbuffer as errored after it has started.
      
      MT safe.
  */
  void setErrored()
  {
    gst_audio_ring_buffer_set_errored(cast(GstAudioRingBuffer*)this._cPtr);
  }

  /**
      Set the ringbuffer to flushing mode or normal mode.
      
      MT safe.
  
      Params:
        flushing = the new mode
  */
  void setFlushing(bool flushing)
  {
    gst_audio_ring_buffer_set_flushing(cast(GstAudioRingBuffer*)this._cPtr, flushing);
  }

  /**
      Make sure that the next sample written to the device is
      accounted for as being the sample sample written to the
      device. This value will be used in reporting the current
      sample position of the ringbuffer.
      
      This function will also clear the buffer with silence.
      
      MT safe.
  
      Params:
        sample = the sample number to set
  */
  void setSample(ulong sample)
  {
    gst_audio_ring_buffer_set_sample(cast(GstAudioRingBuffer*)this._cPtr, sample);
  }

  /** */
  void setTimestamp(int readseg, gst.types.ClockTime timestamp)
  {
    gst_audio_ring_buffer_set_timestamp(cast(GstAudioRingBuffer*)this._cPtr, readseg, timestamp);
  }

  /**
      Start processing samples from the ringbuffer.
      Returns: TRUE if the device could be started, FALSE on error.
        
        MT safe.
  */
  bool start()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_start(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Stop processing samples from the ringbuffer.
      Returns: TRUE if the device could be stopped, FALSE on error.
        
        MT safe.
  */
  bool stop()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_stop(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }
}
