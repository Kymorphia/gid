/// Module for [AudioRingBuffer] class
module gid.gstaudio1.audio_ring_buffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.caps;
import gid.gst1.object;
import gid.gst1.types;
import gid.gstaudio1.audio_ring_buffer_spec;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    This object is the base class for audio ringbuffers used by the base
    audio source and sink classes.
    
    The ringbuffer abstracts a circular buffer of data. One reader and
    one writer can operate on the data from different threads in a lockfree
    manner. The base class is sufficiently flexible to be used as an
    abstraction for DMA based ringbuffers as well as a pure software
    implementations.
*/
@gidGir("AudioRingBuffer", "AudioRingBufferClass")
class AudioRingBuffer : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_ring_buffer_get_type != &gidSymbolNotFound ? gst_audio_ring_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioRingBuffer";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioRingBuffer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_ring_buffer.AudioRingBuffer]
      Returns: New builder object
  */
  static AudioRingBufferGidBuilder builder() nothrow
  {
    return new AudioRingBufferGidBuilder;
  }

  /**
  Tell the ringbuffer that it is about to receive samples with the given channel positions.
  Params:
  position = the device channel positions, its length must be the number of channels of the acquired ring
  buffer spec
  */
  void setChannelPositions(gid.gstaudio1.types.AudioChannelPosition[] position) nothrow
  {
    import gid.glib2.c.functions : g_log;
    import gid.glib2.c.types : GLogLevelFlags;

    auto channels = (cast(GstAudioRingBuffer*)this._cPtr).spec.info.channels;

    if (position.length != channels)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.setChannelPositions position length %d does not match the number of channels %d",
      cast(int)position.length, channels);
      return;
    }

    gst_audio_ring_buffer_set_channel_positions(cast(GstAudioRingBuffer*)this._cPtr, position.ptr);
  }


  /**
      Print debug info about the buffer sized in spec to the debug log.
  
      Params:
        spec = the spec to debug
  */
  static void debugSpecBuff(gid.gstaudio1.audio_ring_buffer_spec.AudioRingBufferSpec spec) nothrow
  {
    gst_audio_ring_buffer_debug_spec_buff(spec ? cast(GstAudioRingBufferSpec*)spec._cPtr : null);
  }

  /**
      Print debug info about the parsed caps in spec to the debug log.
  
      Params:
        spec = the spec to debug
  */
  static void debugSpecCaps(gid.gstaudio1.audio_ring_buffer_spec.AudioRingBufferSpec spec) nothrow
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
  static bool parseCaps(gid.gstaudio1.audio_ring_buffer_spec.AudioRingBufferSpec spec, gid.gst1.caps.Caps caps) nothrow
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
        spec = the specs of the buffer (borrowed, only valid during the callback)
      Returns: TRUE if the device could be acquired, FALSE on error.
        
        MT safe.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAcquire` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncAcquire(gid.gstaudio1.audio_ring_buffer_spec.AudioRingBufferSpec spec)
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.acquire)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.acquire(cast(GstAudioRingBuffer*)this._cPtr, spec ? cast(GstAudioRingBufferSpec*)spec._cPtr : null);
    return _retval;
  }

  /**
      Activate buf to start or stop pulling data.
      
      MT safe.
  
      Params:
        active = the new mode
      Returns: TRUE if the device could be activated in the requested mode,
        FALSE on error.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncActivate(bool active)
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.activate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.activate(cast(GstAudioRingBuffer*)this._cPtr, active);
    return _retval;
  }

  /**
      Clear all samples from the ringbuffer.
      
      MT safe.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClearAll` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncClearAll()
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.clearAll)
      return;

    _klass.clearAll(cast(GstAudioRingBuffer*)this._cPtr);
  }

  /**
      Close the audio device associated with the ring buffer. The ring buffer
      should already have been released via [gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.release].
      Returns: TRUE if the device could be closed, FALSE on error.
        
        MT safe.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCloseDevice` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncCloseDevice()
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.closeDevice)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.closeDevice(cast(GstAudioRingBuffer*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCommit` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected uint vfuncCommit(ref ulong sample, ubyte[] data, int outSamples, ref int accum)
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.commit)
      return typeof(return).init;

    uint _retval;
    int _inSamples;
    if (data)
      _inSamples = cast(int)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = _klass.commit(cast(GstAudioRingBuffer*)this._cPtr, cast(ulong*)&sample, _data, _inSamples, outSamples, cast(int*)&accum);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDelay` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected uint vfuncDelay()
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.delay)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.delay(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Open the audio device associated with the ring buffer. Does not perform any
      setup on the device. You must open the device before acquiring the ring
      buffer.
      Returns: TRUE if the device could be opened, FALSE on error.
        
        MT safe.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncOpenDevice` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncOpenDevice()
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.openDevice)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.openDevice(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Pause processing samples from the ringbuffer.
      Returns: TRUE if the device could be paused, FALSE on error.
        
        MT safe.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPause` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncPause()
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.pause)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.pause(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Free the resources of the ringbuffer.
      Returns: TRUE if the device could be released, FALSE on error.
        
        MT safe.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRelease` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncRelease()
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.release)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.release(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      resume processing of samples after pause
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncResume` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncResume()
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.resume)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.resume(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Start processing samples from the ringbuffer.
      Returns: TRUE if the device could be started, FALSE on error.
        
        MT safe.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStart()
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Stop processing samples from the ringbuffer.
      Returns: TRUE if the device could be stopped, FALSE on error.
        
        MT safe.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStop()
  {
    auto _klass = cast(GstAudioRingBufferClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstAudioRingBuffer*)this._cPtr);
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
  bool acquire(gid.gstaudio1.audio_ring_buffer_spec.AudioRingBufferSpec spec) nothrow
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
  bool activate(bool active) nothrow
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
  void advance(uint advance) nothrow
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
  void clear(int segment) nothrow
  {
    gst_audio_ring_buffer_clear(cast(GstAudioRingBuffer*)this._cPtr, segment);
  }

  /**
      Clear all samples from the ringbuffer.
      
      MT safe.
  */
  void clearAll() nothrow
  {
    gst_audio_ring_buffer_clear_all(cast(GstAudioRingBuffer*)this._cPtr);
  }

  /**
      Close the audio device associated with the ring buffer. The ring buffer
      should already have been released via [gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.release].
      Returns: TRUE if the device could be closed, FALSE on error.
        
        MT safe.
  */
  bool closeDevice() nothrow
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
  uint commit(ref ulong sample, ubyte[] data, int outSamples, ref int accum) nothrow
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
  bool convert(gid.gst1.types.Format srcFmt, long srcVal, gid.gst1.types.Format destFmt, out long destVal) nothrow
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
  uint delay() nothrow
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
  bool deviceIsOpen() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_device_is_open(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current segment base number of the ringbuffer.
      
      MT safe.
      Returns: Current segment base number of the ringbuffer.
  */
  ulong getSegbase() nothrow
  {
    ulong _retval;
    _retval = gst_audio_ring_buffer_get_segbase(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current segment number of the ringbuffer.
      
      MT safe.
      Returns: Current segment number of the ringbuffer.
  */
  ulong getSegdone() nothrow
  {
    ulong _retval;
    _retval = gst_audio_ring_buffer_get_segdone(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Check if the ringbuffer is acquired and ready to use.
      Returns: TRUE if the ringbuffer is acquired, FALSE on error.
        
        MT safe.
  */
  bool isAcquired() nothrow
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
  bool isActive() nothrow
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
  bool isFlushing() nothrow
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
  void mayStart(bool allowed) nothrow
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
  bool openDevice() nothrow
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
  bool pause() nothrow
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
  bool prepareRead(out int segment, out ubyte[] readptr) nothrow
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
  uint read(ulong sample, ubyte[] data, out gid.gst1.types.ClockTime timestamp) nothrow
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
  bool release() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_release(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of samples that were processed by the ringbuffer
      since it was last started. This does not include the number of samples not
      yet processed (see [gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.delay]).
      Returns: The number of samples processed by the ringbuffer.
        
        MT safe.
  */
  ulong samplesDone() nothrow
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
  void setCallback(gid.gstaudio1.types.AudioRingBufferCallback cb = null) nothrow
  {
    extern(C) void _cbCallback(GstAudioRingBuffer* rbuf, ubyte* data, uint len, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gstaudio1.types.AudioRingBufferCallback*)userData;
      ubyte[] _data;
      _data.length = len;
      _data[0 .. len] = data[0 .. len];

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)(cast(void*)rbuf, No.Take), _data);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.types.AudioRingBufferCallback");
      }
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
  void setErrored() nothrow
  {
    gst_audio_ring_buffer_set_errored(cast(GstAudioRingBuffer*)this._cPtr);
  }

  /**
      Set the ringbuffer to flushing mode or normal mode.
      
      MT safe.
  
      Params:
        flushing = the new mode
  */
  void setFlushing(bool flushing) nothrow
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
  void setSample(ulong sample) nothrow
  {
    gst_audio_ring_buffer_set_sample(cast(GstAudioRingBuffer*)this._cPtr, sample);
  }

  /**
      Sets the current segment number of the ringbuffer.
      
      MT safe.
  
      Params:
        segdone = the segment number to set
  */
  void setSegdone(ulong segdone) nothrow
  {
    gst_audio_ring_buffer_set_segdone(cast(GstAudioRingBuffer*)this._cPtr, segdone);
  }

  /** */
  void setTimestamp(int readseg, gid.gst1.types.ClockTime timestamp) nothrow
  {
    gst_audio_ring_buffer_set_timestamp(cast(GstAudioRingBuffer*)this._cPtr, readseg, timestamp);
  }

  /**
      Start processing samples from the ringbuffer.
      Returns: TRUE if the device could be started, FALSE on error.
        
        MT safe.
  */
  bool start() nothrow
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
  bool stop() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_ring_buffer_stop(cast(GstAudioRingBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioRingBuffer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstaudio1.audio_ring_buffer.AudioRingBuffer), T.stringof ~ " is not derived from gid.gstaudio1.audio_ring_buffer.AudioRingBuffer");

    gid.gst1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAcquire", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "acquire");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClearAll", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "clear_all");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseDevice", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "close_device");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCommit", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "commit");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDelay", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "delay");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpenDevice", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "open_device");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPause", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "pause");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRelease", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "release");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncResume", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "resume");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstaudio1.audio_ring_buffer.AudioRingBuffer))
      _installVfunc(klass, "stop");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioRingBufferClass*)klass;

    switch (vfunc)
    {
      case "acquire":
      {
        static extern(C) gboolean _vfuncAcquireTramp(GstAudioRingBuffer* buf, GstAudioRingBufferSpec* spec) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.acquire)
              return (cast(typeof(&_vfuncAcquireTramp))_klass.acquire)(buf, spec);
            return typeof(return).init;
          }

          bool _dretval;
          auto _spec = spec ? new gid.gstaudio1.audio_ring_buffer_spec.AudioRingBufferSpec(cast(void*)spec, null) : null;

          try
          {
            _dretval = _obj.vfuncAcquire(_spec);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncAcquire");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.acquire = cast(typeof(_klass.acquire))&_vfuncAcquireTramp;
        break;
      }
      case "activate":
      {
        static extern(C) gboolean _vfuncActivateTramp(GstAudioRingBuffer* buf, gboolean active) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(buf, active);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncActivate(cast(bool)active);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncActivate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "clear_all":
      {
        static extern(C) void _vfuncClearAllTramp(GstAudioRingBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.clearAll)
              return (cast(typeof(&_vfuncClearAllTramp))_klass.clearAll)(buf);
            return;
          }

          try
          {
            _obj.vfuncClearAll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncClearAll");
          }
        }

        _klass.clearAll = cast(typeof(_klass.clearAll))&_vfuncClearAllTramp;
        break;
      }
      case "close_device":
      {
        static extern(C) gboolean _vfuncCloseDeviceTramp(GstAudioRingBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.closeDevice)
              return (cast(typeof(&_vfuncCloseDeviceTramp))_klass.closeDevice)(buf);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCloseDevice();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncCloseDevice");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.closeDevice = cast(typeof(_klass.closeDevice))&_vfuncCloseDeviceTramp;
        break;
      }
      case "commit":
      {
        static extern(C) uint _vfuncCommitTramp(GstAudioRingBuffer* buf, ulong* sample, ubyte* data, int inSamples, int outSamples, int* accum) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.commit)
              return (cast(typeof(&_vfuncCommitTramp))_klass.commit)(buf, sample, data, inSamples, outSamples, accum);
            return typeof(return).init;
          }

          uint _retval;
          ubyte[] _data;
          _data.length = inSamples;
          _data[0 .. inSamples] = data[0 .. inSamples];

          try
          {
            _retval = _obj.vfuncCommit(*sample, _data, outSamples, *accum);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncCommit");
          }
          return _retval;
        }

        _klass.commit = cast(typeof(_klass.commit))&_vfuncCommitTramp;
        break;
      }
      case "delay":
      {
        static extern(C) uint _vfuncDelayTramp(GstAudioRingBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.delay)
              return (cast(typeof(&_vfuncDelayTramp))_klass.delay)(buf);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncDelay();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncDelay");
          }
          return _retval;
        }

        _klass.delay = cast(typeof(_klass.delay))&_vfuncDelayTramp;
        break;
      }
      case "open_device":
      {
        static extern(C) gboolean _vfuncOpenDeviceTramp(GstAudioRingBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.openDevice)
              return (cast(typeof(&_vfuncOpenDeviceTramp))_klass.openDevice)(buf);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncOpenDevice();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncOpenDevice");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.openDevice = cast(typeof(_klass.openDevice))&_vfuncOpenDeviceTramp;
        break;
      }
      case "pause":
      {
        static extern(C) gboolean _vfuncPauseTramp(GstAudioRingBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.pause)
              return (cast(typeof(&_vfuncPauseTramp))_klass.pause)(buf);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncPause();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncPause");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.pause = cast(typeof(_klass.pause))&_vfuncPauseTramp;
        break;
      }
      case "release":
      {
        static extern(C) gboolean _vfuncReleaseTramp(GstAudioRingBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.release)
              return (cast(typeof(&_vfuncReleaseTramp))_klass.release)(buf);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncRelease();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncRelease");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.release = cast(typeof(_klass.release))&_vfuncReleaseTramp;
        break;
      }
      case "resume":
      {
        static extern(C) gboolean _vfuncResumeTramp(GstAudioRingBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.resume)
              return (cast(typeof(&_vfuncResumeTramp))_klass.resume)(buf);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncResume();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncResume");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.resume = cast(typeof(_klass.resume))&_vfuncResumeTramp;
        break;
      }
      case "start":
      {
        static extern(C) gboolean _vfuncStartTramp(GstAudioRingBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(buf);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstAudioRingBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buf);
          if (!_obj)
          {
            auto _klass = cast(GstAudioRingBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buf);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(buf);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_ring_buffer.AudioRingBuffer.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_ring_buffer.AudioRingBuffer]
class AudioRingBufferGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstaudio1.audio_ring_buffer.AudioRingBuffer]
final class AudioRingBufferGidBuilder : AudioRingBufferGidBuilderImpl!AudioRingBufferGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioRingBuffer build() nothrow
  {
    return new AudioRingBuffer(cast(void*)createGObject(AudioRingBuffer._getGType), Yes.Take);
  }
}
