/// Module for [FrameClock] class
module gdk.frame_clock;

import gdk.c.functions;
import gdk.c.types;
import gdk.frame_timings;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    A #GdkFrameClock tells the application when to update and repaint a
    window. This may be synced to the vertical refresh rate of the
    monitor, for example. Even when the frame clock uses a simple timer
    rather than a hardware-based vertical sync, the frame clock helps
    because it ensures everything paints at the same time (reducing the
    total number of frames). The frame clock can also automatically
    stop painting when it knows the frames will not be visible, or
    scale back animation framerates.
    
    #GdkFrameClock is designed to be compatible with an OpenGL-based
    implementation or with mozRequestAnimationFrame in Firefox,
    for example.
    
    A frame clock is idle until someone requests a frame with
    [gdk.frame_clock.FrameClock.requestPhase]. At some later point that makes
    sense for the synchronization being implemented, the clock will
    process a frame and emit signals for each phase that has been
    requested. (See the signals of the #GdkFrameClock class for
    documentation of the phases. [gdk.types.FrameClockPhase.Update] and the
    #GdkFrameClock::update signal are most interesting for application
    writers, and are used to update the animations, using the frame time
    given by [gdk.frame_clock.FrameClock.getFrameTime].
    
    The frame time is reported in microseconds and generally in the same
    timescale as [glib.global.getMonotonicTime], however, it is not the same
    as [glib.global.getMonotonicTime]. The frame time does not advance during
    the time a frame is being painted, and outside of a frame, an attempt
    is made so that all calls to [gdk.frame_clock.FrameClock.getFrameTime] that
    are called at a “similar” time get the same value. This means that
    if different animations are timed by looking at the difference in
    time between an initial value from [gdk.frame_clock.FrameClock.getFrameTime]
    and the value inside the #GdkFrameClock::update signal of the clock,
    they will stay exactly synchronized.
*/
class FrameClock : gobject.object.ObjectWrap
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
    return cast(void function())gdk_frame_clock_get_type != &gidSymbolNotFound ? gdk_frame_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FrameClock self()
  {
    return this;
  }

  /**
      Starts updates for an animation. Until a matching call to
      [gdk.frame_clock.FrameClock.endUpdating] is made, the frame clock will continually
      request a new frame with the [gdk.types.FrameClockPhase.Update] phase.
      This function may be called multiple times and frames will be
      requested until [gdk.frame_clock.FrameClock.endUpdating] is called the same
      number of times.
  */
  void beginUpdating()
  {
    gdk_frame_clock_begin_updating(cast(GdkFrameClock*)this._cPtr);
  }

  /**
      Stops updates for an animation. See the documentation for
      [gdk.frame_clock.FrameClock.beginUpdating].
  */
  void endUpdating()
  {
    gdk_frame_clock_end_updating(cast(GdkFrameClock*)this._cPtr);
  }

  /**
      Gets the frame timings for the current frame.
      Returns: the #GdkFrameTimings for the
         frame currently being processed, or even no frame is being
         processed, for the previous frame. Before any frames have been
         processed, returns null.
  */
  gdk.frame_timings.FrameTimings getCurrentTimings()
  {
    GdkFrameTimings* _cretval;
    _cretval = gdk_frame_clock_get_current_timings(cast(GdkFrameClock*)this._cPtr);
    auto _retval = _cretval ? new gdk.frame_timings.FrameTimings(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      A #GdkFrameClock maintains a 64-bit counter that increments for
      each frame drawn.
      Returns: inside frame processing, the value of the frame counter
         for the current frame. Outside of frame processing, the frame
          counter for the last frame.
  */
  long getFrameCounter()
  {
    long _retval;
    _retval = gdk_frame_clock_get_frame_counter(cast(GdkFrameClock*)this._cPtr);
    return _retval;
  }

  /**
      Gets the time that should currently be used for animations.  Inside
      the processing of a frame, it’s the time used to compute the
      animation position of everything in a frame. Outside of a frame, it's
      the time of the conceptual “previous frame,” which may be either
      the actual previous frame time, or if that’s too old, an updated
      time.
      Returns: a timestamp in microseconds, in the timescale of
         of [glib.global.getMonotonicTime].
  */
  long getFrameTime()
  {
    long _retval;
    _retval = gdk_frame_clock_get_frame_time(cast(GdkFrameClock*)this._cPtr);
    return _retval;
  }

  /**
      #GdkFrameClock internally keeps a history of #GdkFrameTimings
      objects for recent frames that can be retrieved with
      [gdk.frame_clock.FrameClock.getTimings]. The set of stored frames
      is the set from the counter values given by
      [gdk.frame_clock.FrameClock.getHistoryStart] and
      [gdk.frame_clock.FrameClock.getFrameCounter], inclusive.
      Returns: the frame counter value for the oldest frame
         that is available in the internal frame history of the
         #GdkFrameClock.
  */
  long getHistoryStart()
  {
    long _retval;
    _retval = gdk_frame_clock_get_history_start(cast(GdkFrameClock*)this._cPtr);
    return _retval;
  }

  /**
      Using the frame history stored in the frame clock, finds the last
      known presentation time and refresh interval, and assuming that
      presentation times are separated by the refresh interval,
      predicts a presentation time that is a multiple of the refresh
      interval after the last presentation time, and later than base_time.
  
      Params:
        baseTime = base time for determining a presentaton time
        refreshIntervalReturn = a location to store the
          determined refresh interval, or null. A default refresh interval of
          1/60th of a second will be stored if no history is present.
        presentationTimeReturn = a location to store the next
           candidate presentation time after the given base time.
           0 will be will be stored if no history is present.
  */
  void getRefreshInfo(long baseTime, out long refreshIntervalReturn, out long presentationTimeReturn)
  {
    gdk_frame_clock_get_refresh_info(cast(GdkFrameClock*)this._cPtr, baseTime, cast(long*)&refreshIntervalReturn, cast(long*)&presentationTimeReturn);
  }

  /**
      Retrieves a #GdkFrameTimings object holding timing information
      for the current frame or a recent frame. The #GdkFrameTimings
      object may not yet be complete: see [gdk.frame_timings.FrameTimings.getComplete].
  
      Params:
        frameCounter = the frame counter value identifying the frame to
           be received.
      Returns: the #GdkFrameTimings object for
         the specified frame, or null if it is not available. See
         [gdk.frame_clock.FrameClock.getHistoryStart].
  */
  gdk.frame_timings.FrameTimings getTimings(long frameCounter)
  {
    GdkFrameTimings* _cretval;
    _cretval = gdk_frame_clock_get_timings(cast(GdkFrameClock*)this._cPtr, frameCounter);
    auto _retval = _cretval ? new gdk.frame_timings.FrameTimings(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Asks the frame clock to run a particular phase. The signal
      corresponding the requested phase will be emitted the next
      time the frame clock processes. Multiple calls to
      [gdk.frame_clock.FrameClock.requestPhase] will be combined together
      and only one frame processed. If you are displaying animated
      content and want to continually request the
      [gdk.types.FrameClockPhase.Update] phase for a period of time,
      you should use [gdk.frame_clock.FrameClock.beginUpdating] instead, since
      this allows GTK+ to adjust system parameters to get maximally
      smooth animations.
  
      Params:
        phase = the phase that is requested
  */
  void requestPhase(gdk.types.FrameClockPhase phase)
  {
    gdk_frame_clock_request_phase(cast(GdkFrameClock*)this._cPtr, phase);
  }

  /**
      Connect to `AfterPaint` signal.
  
      This signal ends processing of the frame. Applications
        should generally not handle this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.frame_clock.FrameClock frameClock))
  
          `frameClock` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAfterPaint(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.frame_clock.FrameClock)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("after-paint", closure, after);
  }

  /**
      Connect to `BeforePaint` signal.
  
      This signal begins processing of the frame. Applications
        should generally not handle this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.frame_clock.FrameClock frameClock))
  
          `frameClock` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBeforePaint(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.frame_clock.FrameClock)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("before-paint", closure, after);
  }

  /**
      Connect to `FlushEvents` signal.
  
      This signal is used to flush pending motion events that
        are being batched up and compressed together. Applications
        should not handle this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.frame_clock.FrameClock frameClock))
  
          `frameClock` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFlushEvents(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.frame_clock.FrameClock)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("flush-events", closure, after);
  }

  /**
      Connect to `Layout` signal.
  
      This signal is emitted as the second step of toolkit and
        application processing of the frame. Any work to update
        sizes and positions of application elements should be
        performed. GTK+ normally handles this internally.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.frame_clock.FrameClock frameClock))
  
          `frameClock` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLayout(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.frame_clock.FrameClock)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("layout", closure, after);
  }

  /**
      Connect to `Paint` signal.
  
      This signal is emitted as the third step of toolkit and
        application processing of the frame. The frame is
        repainted. GDK normally handles this internally and
        produces expose events, which are turned into GTK+
        #GtkWidget::draw signals.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.frame_clock.FrameClock frameClock))
  
          `frameClock` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPaint(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.frame_clock.FrameClock)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paint", closure, after);
  }

  /**
      Connect to `ResumeEvents` signal.
  
      This signal is emitted after processing of the frame is
        finished, and is handled internally by GTK+ to resume normal
        event processing. Applications should not handle this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.frame_clock.FrameClock frameClock))
  
          `frameClock` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectResumeEvents(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.frame_clock.FrameClock)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("resume-events", closure, after);
  }

  /**
      Connect to `Update` signal.
  
      This signal is emitted as the first step of toolkit and
        application processing of the frame. Animations should
        be updated using [gdk.frame_clock.FrameClock.getFrameTime].
        Applications can connect directly to this signal, or
        use [gtk.widget.Widget.addTickCallback] as a more convenient
        interface.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.frame_clock.FrameClock frameClock))
  
          `frameClock` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUpdate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.frame_clock.FrameClock)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("update", closure, after);
  }
}
