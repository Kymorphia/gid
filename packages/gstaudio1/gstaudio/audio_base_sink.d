/// Module for [AudioBaseSink] class
module gstaudio.audio_base_sink;

import gid.gid;
import gobject.object;
import gst.element;
import gst.types;
import gstaudio.audio_ring_buffer;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;
import gstbase.base_sink;

/**
    This is the base class for audio sinks. Subclasses need to implement the
    ::create_ringbuffer vmethod. This base class will then take care of
    writing samples to the ringbuffer, synchronisation, clipping and flushing.
*/
class AudioBaseSink : gstbase.base_sink.BaseSink
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
    return cast(void function())gst_audio_base_sink_get_type != &gidSymbolNotFound ? gst_audio_base_sink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioBaseSink self()
  {
    return this;
  }

  /** */
  @property ulong alignmentThreshold()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("alignment-threshold");
  }

  /** */
  @property void alignmentThreshold(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("alignment-threshold", propval);
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
  @property bool canActivatePull()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("can-activate-pull");
  }

  /** */
  @property void canActivatePull(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("can-activate-pull", propval);
  }

  /**
      Get `discontWait` property.
      Returns: A window of time in nanoseconds to wait before creating a discontinuity as
        a result of breaching the drift-tolerance.
  */
  @property ulong discontWait()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("discont-wait");
  }

  /**
      Set `discontWait` property.
      Params:
        propval = A window of time in nanoseconds to wait before creating a discontinuity as
          a result of breaching the drift-tolerance.
  */
  @property void discontWait(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("discont-wait", propval);
  }

  /**
      Get `driftTolerance` property.
      Returns: Controls the amount of time in microseconds that clocks are allowed
        to drift before resynchronisation happens.
  */
  @property long driftTolerance()
  {
    return getDriftTolerance();
  }

  /**
      Set `driftTolerance` property.
      Params:
        propval = Controls the amount of time in microseconds that clocks are allowed
          to drift before resynchronisation happens.
  */
  @property void driftTolerance(long propval)
  {
    return setDriftTolerance(propval);
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
  @property gstaudio.types.AudioBaseSinkSlaveMethod slaveMethod()
  {
    return getSlaveMethod();
  }

  /** */
  @property void slaveMethod(gstaudio.types.AudioBaseSinkSlaveMethod propval)
  {
    return setSlaveMethod(propval);
  }

  /**
      Create and return the #GstAudioRingBuffer for sink. This function will
      call the ::create_ringbuffer vmethod and will set sink as the parent of
      the returned buffer (see [gst.object.ObjectWrap.setParent]).
      Returns: The new ringbuffer of sink.
  */
  gstaudio.audio_ring_buffer.AudioRingBuffer createRingbuffer()
  {
    GstAudioRingBuffer* _cretval;
    _cretval = gst_audio_base_sink_create_ringbuffer(cast(GstAudioBaseSink*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstaudio.audio_ring_buffer.AudioRingBuffer)(cast(GstAudioRingBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the current alignment threshold, in nanoseconds, used by sink.
      Returns: The current alignment threshold used by sink.
  */
  gst.types.ClockTime getAlignmentThreshold()
  {
    gst.types.ClockTime _retval;
    _retval = gst_audio_base_sink_get_alignment_threshold(cast(GstAudioBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the current discont wait, in nanoseconds, used by sink.
      Returns: The current discont wait used by sink.
  */
  gst.types.ClockTime getDiscontWait()
  {
    gst.types.ClockTime _retval;
    _retval = gst_audio_base_sink_get_discont_wait(cast(GstAudioBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the current drift tolerance, in microseconds, used by sink.
      Returns: The current drift tolerance used by sink.
  */
  long getDriftTolerance()
  {
    long _retval;
    _retval = gst_audio_base_sink_get_drift_tolerance(cast(GstAudioBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Queries whether sink will provide a clock or not. See also
      gst_audio_base_sink_set_provide_clock.
      Returns: true if sink will provide a clock.
  */
  bool getProvideClock()
  {
    bool _retval;
    _retval = cast(bool)gst_audio_base_sink_get_provide_clock(cast(GstAudioBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the current slave method used by sink.
      Returns: The current slave method used by sink.
  */
  gstaudio.types.AudioBaseSinkSlaveMethod getSlaveMethod()
  {
    GstAudioBaseSinkSlaveMethod _cretval;
    _cretval = gst_audio_base_sink_get_slave_method(cast(GstAudioBaseSink*)this._cPtr);
    gstaudio.types.AudioBaseSinkSlaveMethod _retval = cast(gstaudio.types.AudioBaseSinkSlaveMethod)_cretval;
    return _retval;
  }

  /**
      Informs this base class that the audio output device has failed for
      some reason, causing a discontinuity (for example, because the device
      recovered from the error, but lost all contents of its ring buffer).
      This function is typically called by derived classes, and is useful
      for the custom slave method.
  */
  void reportDeviceFailure()
  {
    gst_audio_base_sink_report_device_failure(cast(GstAudioBaseSink*)this._cPtr);
  }

  /**
      Controls the sink's alignment threshold.
  
      Params:
        alignmentThreshold = the new alignment threshold in nanoseconds
  */
  void setAlignmentThreshold(gst.types.ClockTime alignmentThreshold)
  {
    gst_audio_base_sink_set_alignment_threshold(cast(GstAudioBaseSink*)this._cPtr, alignmentThreshold);
  }

  /**
      Sets the custom slaving callback. This callback will
      be invoked if the slave-method property is set to
      GST_AUDIO_BASE_SINK_SLAVE_CUSTOM and the audio sink
      receives and plays samples.
      
      Setting the callback to NULL causes the sink to
      behave as if the GST_AUDIO_BASE_SINK_SLAVE_NONE
      method were used.
  
      Params:
        callback = a #GstAudioBaseSinkCustomSlavingCallback
  */
  void setCustomSlavingCallback(gstaudio.types.AudioBaseSinkCustomSlavingCallback callback)
  {
    extern(C) void _callbackCallback(GstAudioBaseSink* sink, GstClockTime etime, GstClockTime itime, GstClockTimeDiff* requestedSkew, GstAudioBaseSinkDiscontReason discontReason, void* userData)
    {
      auto _dlg = cast(gstaudio.types.AudioBaseSinkCustomSlavingCallback*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstaudio.audio_base_sink.AudioBaseSink)(cast(void*)sink, No.Take), etime, itime, *requestedSkew, discontReason);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_audio_base_sink_set_custom_slaving_callback(cast(GstAudioBaseSink*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Controls how long the sink will wait before creating a discontinuity.
  
      Params:
        discontWait = the new discont wait in nanoseconds
  */
  void setDiscontWait(gst.types.ClockTime discontWait)
  {
    gst_audio_base_sink_set_discont_wait(cast(GstAudioBaseSink*)this._cPtr, discontWait);
  }

  /**
      Controls the sink's drift tolerance.
  
      Params:
        driftTolerance = the new drift tolerance in microseconds
  */
  void setDriftTolerance(long driftTolerance)
  {
    gst_audio_base_sink_set_drift_tolerance(cast(GstAudioBaseSink*)this._cPtr, driftTolerance);
  }

  /**
      Controls whether sink will provide a clock or not. If provide is true,
      [gst.element.Element.provideClock] will return a clock that reflects the datarate
      of sink. If provide is false, [gst.element.Element.provideClock] will return
      NULL.
  
      Params:
        provide = new state
  */
  void setProvideClock(bool provide)
  {
    gst_audio_base_sink_set_provide_clock(cast(GstAudioBaseSink*)this._cPtr, provide);
  }

  /**
      Controls how clock slaving will be performed in sink.
  
      Params:
        method = the new slave method
  */
  void setSlaveMethod(gstaudio.types.AudioBaseSinkSlaveMethod method)
  {
    gst_audio_base_sink_set_slave_method(cast(GstAudioBaseSink*)this._cPtr, method);
  }
}
