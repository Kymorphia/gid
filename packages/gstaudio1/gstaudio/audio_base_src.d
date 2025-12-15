/// Module for [AudioBaseSrc] class
module gstaudio.audio_base_src;

import gid.gid;
import gobject.object;
import gst.element;
import gstaudio.audio_ring_buffer;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;
import gstbase.push_src;

/**
    This is the base class for audio sources. Subclasses need to implement the
    ::create_ringbuffer vmethod. This base class will then take care of
    reading samples from the ringbuffer, synchronisation and flushing.
*/
class AudioBaseSrc : gstbase.push_src.PushSrc
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
    return cast(void function())gst_audio_base_src_get_type != &gidSymbolNotFound ? gst_audio_base_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioBaseSrc self()
  {
    return this;
  }

  /**
      Get `actualBufferTime` property.
      Returns: Actual configured size of audio buffer in microseconds.
  */
  @property long actualBufferTime()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("actual-buffer-time");
  }

  /**
      Get `actualLatencyTime` property.
      Returns: Actual configured audio latency in microseconds.
  */
  @property long actualLatencyTime()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("actual-latency-time");
  }

  /** */
  @property long bufferTime()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("buffer-time");
  }

  /** */
  @property void bufferTime(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("buffer-time", propval);
  }

  /** */
  @property long latencyTime()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("latency-time");
  }

  /** */
  @property void latencyTime(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("latency-time", propval);
  }

  alias provideClock = gst.element.Element.provideClock;

  /** */
  @property bool provideClock()
  {
    return getProvideClock();
  }

  alias provideClock = gst.element.Element.provideClock;

  /** */
  @property void provideClock(bool propval)
  {
    return setProvideClock(propval);
  }

  /** */
  @property gstaudio.types.AudioBaseSrcSlaveMethod slaveMethod()
  {
    return getSlaveMethod();
  }

  /** */
  @property void slaveMethod(gstaudio.types.AudioBaseSrcSlaveMethod propval)
  {
    return setSlaveMethod(propval);
  }

  /**
      Create and return the #GstAudioRingBuffer for src. This function will call
      the ::create_ringbuffer vmethod and will set src as the parent of the
      returned buffer (see [gst.object.ObjectWrap.setParent]).
      Returns: The new ringbuffer of src.
  */
  gstaudio.audio_ring_buffer.AudioRingBuffer createRingbuffer()
  {
    GstAudioRingBuffer* _cretval;
    _cretval = gst_audio_base_src_create_ringbuffer(cast(GstAudioBaseSrc*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstaudio.audio_ring_buffer.AudioRingBuffer)(cast(GstAudioRingBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries whether src will provide a clock or not. See also
      gst_audio_base_src_set_provide_clock.
      Returns: true if src will provide a clock.
  */
  bool getProvideClock()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_base_src_get_provide_clock(cast(GstAudioBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the current slave method used by src.
      Returns: The current slave method used by src.
  */
  gstaudio.types.AudioBaseSrcSlaveMethod getSlaveMethod()
  {
    GstAudioBaseSrcSlaveMethod _cretval;
    _cretval = gst_audio_base_src_get_slave_method(cast(GstAudioBaseSrc*)this._cPtr);
    gstaudio.types.AudioBaseSrcSlaveMethod _retval = cast(gstaudio.types.AudioBaseSrcSlaveMethod)_cretval;
    return _retval;
  }

  /**
      Controls whether src will provide a clock or not. If provide is true,
      [gst.element.Element.provideClock] will return a clock that reflects the datarate
      of src. If provide is false, [gst.element.Element.provideClock] will return NULL.
  
      Params:
        provide = new state
  */
  void setProvideClock(bool provide)
  {
    gst_audio_base_src_set_provide_clock(cast(GstAudioBaseSrc*)this._cPtr, provide);
  }

  /**
      Controls how clock slaving will be performed in src.
  
      Params:
        method = the new slave method
  */
  void setSlaveMethod(gstaudio.types.AudioBaseSrcSlaveMethod method)
  {
    gst_audio_base_src_set_slave_method(cast(GstAudioBaseSrc*)this._cPtr, method);
  }
}
