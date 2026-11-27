/// Module for [AudioClock] class
module gid.gstaudio1.audio_clock;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.clock;
import gid.gst1.system_clock;
import gid.gst1.types;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    #GstAudioClock makes it easy for elements to implement a #GstClock, they
    simply need to provide a function that returns the current clock time.
    
    This object is internally used to implement the clock in #GstAudioBaseSink.
*/
@gidGir("AudioClock", "AudioClockClass")
class AudioClock : gid.gst1.system_clock.SystemClock
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
    return cast(void function())gst_audio_clock_get_type != &gidSymbolNotFound ? gst_audio_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioClock";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioClock self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_clock.AudioClock]
      Returns: New builder object
  */
  static AudioClockGidBuilder builder() nothrow
  {
    return new AudioClockGidBuilder;
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
  this(string name, gid.gstaudio1.types.AudioClockGetTimeFunc func) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      extern(C) GstClockTime _funcCallback(GstClock* clock, void* userData) nothrow
      {
        gidAttachThread();
        gid.gst1.types.ClockTime _dretval;
        auto _dlg = cast(gid.gstaudio1.types.AudioClockGetTimeFunc*)userData;

        try
        {
          _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.clock.Clock)(cast(void*)clock, No.Take));
        }
        catch (Exception e)
        {
          gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.types.AudioClockGetTimeFunc");
        }
        auto _retval = cast(GstClockTime)_dretval;

        return _retval;
      }
      auto _funcCB = func ? &_funcCallback : null;
      GstClock* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
      auto _func = func ? freezeDelegate(cast(void*)&func) : null;
      GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
      _cretval = gst_audio_clock_new(_name, _funcCB, _func, _funcDestroyCB);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adjust time with the internal offset of the audio clock.
  
      Params:
        time = a #GstClockTime
      Returns: time adjusted with the internal offset.
  */
  gid.gst1.types.ClockTime adjust(gid.gst1.types.ClockTime time) nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_audio_clock_adjust(cast(GstAudioClock*)this._cPtr, time);
    return _retval;
  }

  /**
      Report the time as returned by the #GstAudioClockGetTimeFunc without applying
      any offsets.
      Returns: the time as reported by the time function of the audio clock
  */
  override gid.gst1.types.ClockTime getTime() nothrow
  {
    gid.gst1.types.ClockTime _retval;
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
  void invalidate() nothrow
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
  void reset(gid.gst1.types.ClockTime time) nothrow
  {
    gst_audio_clock_reset(cast(GstAudioClock*)this._cPtr, time);
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_clock.AudioClock]
class AudioClockGidBuilderImpl(T) : gid.gst1.system_clock.SystemClockGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstaudio1.audio_clock.AudioClock]
final class AudioClockGidBuilder : AudioClockGidBuilderImpl!AudioClockGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioClock build() nothrow
  {
    return new AudioClock(cast(void*)createGObject(AudioClock._getGType), Yes.Take);
  }
}
