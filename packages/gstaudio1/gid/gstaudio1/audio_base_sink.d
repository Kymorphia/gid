/// Module for [AudioBaseSink] class
module gid.gstaudio1.audio_base_sink;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.element;
import gid.gst1.types;
import gid.gstaudio1.audio_ring_buffer;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;
import gid.gstbase1.base_sink;

/**
    This is the base class for audio sinks. Subclasses need to implement the
    ::create_ringbuffer vmethod. This base class will then take care of
    writing samples to the ringbuffer, synchronisation, clipping and flushing.
*/
class AudioBaseSink : gid.gstbase1.base_sink.BaseSink
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_base_sink_get_type != &gidSymbolNotFound ? gst_audio_base_sink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioBaseSink";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioBaseSink self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_base_sink.AudioBaseSink]
      Returns: New builder object
  */
  static AudioBaseSinkGidBuilder builder() nothrow
  {
    return new AudioBaseSinkGidBuilder;
  }

  /** */
  @property ulong alignmentThreshold() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("alignment-threshold");
  }

  /** */
  @property void alignmentThreshold(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("alignment-threshold", propval);
  }

  /** */
  @property long bufferTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("buffer-time");
  }

  /** */
  @property void bufferTime(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("buffer-time", propval);
  }

  /** */
  @property bool canActivatePull() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("can-activate-pull");
  }

  /** */
  @property void canActivatePull(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("can-activate-pull", propval);
  }

  /**
      Get `discontWait` property.
      Returns: A window of time in nanoseconds to wait before creating a discontinuity as
        a result of breaching the drift-tolerance.
  */
  @property ulong discontWait() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("discont-wait");
  }

  /**
      Set `discontWait` property.
      Params:
        propval = A window of time in nanoseconds to wait before creating a discontinuity as
          a result of breaching the drift-tolerance.
  */
  @property void discontWait(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("discont-wait", propval);
  }

  /**
      Get `driftTolerance` property.
      Returns: Controls the amount of time in microseconds that clocks are allowed
        to drift before resynchronisation happens.
  */
  @property long driftTolerance() nothrow
  {
    return getDriftTolerance();
  }

  /**
      Set `driftTolerance` property.
      Params:
        propval = Controls the amount of time in microseconds that clocks are allowed
          to drift before resynchronisation happens.
  */
  @property void driftTolerance(long propval) nothrow
  {
    setDriftTolerance(propval);
  }

  /** */
  @property long latencyTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("latency-time");
  }

  /** */
  @property void latencyTime(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("latency-time", propval);
  }

  alias provideClock = gid.gst1.element.Element.provideClock;

  /** */
  @property bool provideClock() nothrow
  {
    return getProvideClock();
  }

  alias provideClock = gid.gst1.element.Element.provideClock;

  /** */
  @property void provideClock(bool propval) nothrow
  {
    setProvideClock(propval);
  }

  /** */
  @property gid.gstaudio1.types.AudioBaseSinkSlaveMethod slaveMethod() nothrow
  {
    return getSlaveMethod();
  }

  /** */
  @property void slaveMethod(gid.gstaudio1.types.AudioBaseSinkSlaveMethod propval) nothrow
  {
    setSlaveMethod(propval);
  }

  /**
      Create and return the #GstAudioRingBuffer for sink. This function will
      call the ::create_ringbuffer vmethod and will set sink as the parent of
      the returned buffer (see [gid.gst1.object.ObjectWrap.setParent]).
      Returns: The new ringbuffer of sink.
  */
  gid.gstaudio1.audio_ring_buffer.AudioRingBuffer createRingbuffer() nothrow
  {
    GstAudioRingBuffer* _cretval;
    _cretval = gst_audio_base_sink_create_ringbuffer(cast(GstAudioBaseSink*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)(cast(GstAudioRingBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the current alignment threshold, in nanoseconds, used by sink.
      Returns: The current alignment threshold used by sink.
  */
  gid.gst1.types.ClockTime getAlignmentThreshold() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_audio_base_sink_get_alignment_threshold(cast(GstAudioBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the current discont wait, in nanoseconds, used by sink.
      Returns: The current discont wait used by sink.
  */
  gid.gst1.types.ClockTime getDiscontWait() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_audio_base_sink_get_discont_wait(cast(GstAudioBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the current drift tolerance, in microseconds, used by sink.
      Returns: The current drift tolerance used by sink.
  */
  long getDriftTolerance() nothrow
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
  bool getProvideClock() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_base_sink_get_provide_clock(cast(GstAudioBaseSink*)this._cPtr);
    return _retval;
  }

  /**
      Get the current slave method used by sink.
      Returns: The current slave method used by sink.
  */
  gid.gstaudio1.types.AudioBaseSinkSlaveMethod getSlaveMethod() nothrow
  {
    GstAudioBaseSinkSlaveMethod _cretval;
    _cretval = gst_audio_base_sink_get_slave_method(cast(GstAudioBaseSink*)this._cPtr);
    gid.gstaudio1.types.AudioBaseSinkSlaveMethod _retval = cast(gid.gstaudio1.types.AudioBaseSinkSlaveMethod)_cretval;
    return _retval;
  }

  /**
      Informs this base class that the audio output device has failed for
      some reason, causing a discontinuity (for example, because the device
      recovered from the error, but lost all contents of its ring buffer).
      This function is typically called by derived classes, and is useful
      for the custom slave method.
  */
  void reportDeviceFailure() nothrow
  {
    gst_audio_base_sink_report_device_failure(cast(GstAudioBaseSink*)this._cPtr);
  }

  /**
      Controls the sink's alignment threshold.
  
      Params:
        alignmentThreshold = the new alignment threshold in nanoseconds
  */
  void setAlignmentThreshold(gid.gst1.types.ClockTime alignmentThreshold) nothrow
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
  void setCustomSlavingCallback(gid.gstaudio1.types.AudioBaseSinkCustomSlavingCallback callback) nothrow
  {
    extern(C) void _callbackCallback(GstAudioBaseSink* sink, GstClockTime etime, GstClockTime itime, GstClockTimeDiff* requestedSkew, GstAudioBaseSinkDiscontReason discontReason, void* userData) nothrow
    {
      auto _dlg = cast(gid.gstaudio1.types.AudioBaseSinkCustomSlavingCallback*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstaudio1.audio_base_sink.AudioBaseSink)(cast(void*)sink, No.Take), etime, itime, *requestedSkew, discontReason);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.types.AudioBaseSinkCustomSlavingCallback");
      }
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
  void setDiscontWait(gid.gst1.types.ClockTime discontWait) nothrow
  {
    gst_audio_base_sink_set_discont_wait(cast(GstAudioBaseSink*)this._cPtr, discontWait);
  }

  /**
      Controls the sink's drift tolerance.
  
      Params:
        driftTolerance = the new drift tolerance in microseconds
  */
  void setDriftTolerance(long driftTolerance) nothrow
  {
    gst_audio_base_sink_set_drift_tolerance(cast(GstAudioBaseSink*)this._cPtr, driftTolerance);
  }

  /**
      Controls whether sink will provide a clock or not. If provide is true,
      [gid.gst1.element.Element.provideClock] will return a clock that reflects the datarate
      of sink. If provide is false, [gid.gst1.element.Element.provideClock] will return
      NULL.
  
      Params:
        provide = new state
  */
  void setProvideClock(bool provide) nothrow
  {
    gst_audio_base_sink_set_provide_clock(cast(GstAudioBaseSink*)this._cPtr, provide);
  }

  /**
      Controls how clock slaving will be performed in sink.
  
      Params:
        method = the new slave method
  */
  void setSlaveMethod(gid.gstaudio1.types.AudioBaseSinkSlaveMethod method) nothrow
  {
    gst_audio_base_sink_set_slave_method(cast(GstAudioBaseSink*)this._cPtr, method);
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_base_sink.AudioBaseSink]
class AudioBaseSinkGidBuilderImpl(T) : gid.gstbase1.base_sink.BaseSinkGidBuilderImpl!T
{

  /** */
  T alignmentThreshold(ulong propval) nothrow
  {
    return setProperty("alignment-threshold", propval);
  }

  /** */
  T bufferTime(long propval) nothrow
  {
    return setProperty("buffer-time", propval);
  }

  /** */
  T canActivatePull(bool propval) nothrow
  {
    return setProperty("can-activate-pull", propval);
  }

  /**
      Set `discontWait` property.
      Params:
        propval = A window of time in nanoseconds to wait before creating a discontinuity as
          a result of breaching the drift-tolerance.
      Returns: Builder instance for fluent chaining
  */
  T discontWait(ulong propval) nothrow
  {
    return setProperty("discont-wait", propval);
  }

  /**
      Set `driftTolerance` property.
      Params:
        propval = Controls the amount of time in microseconds that clocks are allowed
          to drift before resynchronisation happens.
      Returns: Builder instance for fluent chaining
  */
  T driftTolerance(long propval) nothrow
  {
    return setProperty("drift-tolerance", propval);
  }

  /** */
  T latencyTime(long propval) nothrow
  {
    return setProperty("latency-time", propval);
  }

  /** */
  T provideClock(bool propval) nothrow
  {
    return setProperty("provide-clock", propval);
  }

  /** */
  T slaveMethod(gid.gstaudio1.types.AudioBaseSinkSlaveMethod propval) nothrow
  {
    return setProperty("slave-method", propval);
  }
}

/// Fluent builder for [gid.gstaudio1.audio_base_sink.AudioBaseSink]
final class AudioBaseSinkGidBuilder : AudioBaseSinkGidBuilderImpl!AudioBaseSinkGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioBaseSink build() nothrow
  {
    return new AudioBaseSink(cast(void*)createGObject(AudioBaseSink._getGType), Yes.Take);
  }
}
