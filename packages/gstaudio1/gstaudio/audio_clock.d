/// Module for [AudioClock] class
module gstaudio.audio_clock;

import gid.gid;
import gobject.object;
import gst.clock;
import gst.system_clock;
import gst.types;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    #GstAudioClock makes it easy for elements to implement a #GstClock, they
    simply need to provide a function that returns the current clock time.
    
    This object is internally used to implement the clock in #GstAudioBaseSink.
*/
class AudioClock : gst.system_clock.SystemClock
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
    return cast(void function())gst_audio_clock_get_type != &gidSymbolNotFound ? gst_audio_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioClock self()
  {
    return this;
  }

  /**
      Create a new #GstAudioClock instance. Whenever the clock time should be
      calculated it will call func with user_data. When func returns
      #GST_CLOCK_TIME_NONE, the clock will return the last reported time.
  
      Params:
        name = the name of the clock
        func = a function
      Returns: a new #GstAudioClock casted to a #GstClock.
  */
  this(string name, gstaudio.types.AudioClockGetTimeFunc func)
  {
    extern(C) GstClockTime _funcCallback(GstClock* clock, void* userData)
    {
      gst.types.ClockTime _dretval;
      auto _dlg = cast(gstaudio.types.AudioClockGetTimeFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.clock.Clock)(cast(void*)clock, No.Take));
      auto _retval = cast(GstClockTime)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    GstClock* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _cretval = gst_audio_clock_new(_name, _funcCB, _func, _funcDestroyCB);
    this(_cretval, Yes.Take);
  }

  /**
      Adjust time with the internal offset of the audio clock.
  
      Params:
        time = a #GstClockTime
      Returns: time adjusted with the internal offset.
  */
  gst.types.ClockTime adjust(gst.types.ClockTime time)
  {
    gst.types.ClockTime _retval;
    _retval = gst_audio_clock_adjust(cast(GstAudioClock*)this._cPtr, time);
    return _retval;
  }

  /**
      Report the time as returned by the #GstAudioClockGetTimeFunc without applying
      any offsets.
      Returns: the time as reported by the time function of the audio clock
  */
  override gst.types.ClockTime getTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_audio_clock_get_time(cast(GstAudioClock*)this._cPtr);
    return _retval;
  }

  /**
      Invalidate the clock function. Call this function when the provided
      #GstAudioClockGetTimeFunc cannot be called anymore, for example, when the
      user_data becomes invalid.
      
      After calling this function, clock will return the last returned time for
      the rest of its lifetime.
  */
  void invalidate()
  {
    gst_audio_clock_invalidate(cast(GstAudioClock*)this._cPtr);
  }

  /**
      Inform clock that future calls to #GstAudioClockGetTimeFunc will return values
      starting from time. The clock will update an internal offset to make sure that
      future calls to internal_time will return an increasing result as required by
      the #GstClock object.
  
      Params:
        time = a #GstClockTime
  */
  void reset(gst.types.ClockTime time)
  {
    gst_audio_clock_reset(cast(GstAudioClock*)this._cPtr, time);
  }
}
