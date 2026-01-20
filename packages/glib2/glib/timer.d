/// Module for [Timer] class
module glib.timer;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    [glib.timer.Timer] records a start time, and counts microseconds elapsed since
    that time.
    
    This is done somewhat differently on different platforms, and can be
    tricky to get exactly right, so [glib.timer.Timer] provides a portable/convenient interface.
*/
class Timer
{
  GTimer* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.timer.Timer");

    _cInstancePtr = cast(GTimer*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
  * If timer has been started but not stopped, obtains the time since
  * the timer was started. If timer has been stopped, obtains the
  * elapsed time between the time it was started and the time it was
  * stopped. The return value is the number of seconds elapsed,
  * including any fractional part.
  * Returns: seconds elapsed as a floating point value, including any
  *   fractional part.
  */
  double elapsed()
  {
    double _retval;
    _retval = g_timer_elapsed(cast(GTimer*)_cPtr, null);
    return _retval;
  }


  /**
      Resumes a timer that has previously been stopped with
      [glib.timer.Timer.stop]. [glib.timer.Timer.stop] must be called before using this
      function.
  */
  void continue_()
  {
    g_timer_continue(cast(GTimer*)this._cPtr);
  }

  /**
      Destroys a timer, freeing associated resources.
  */
  void destroy()
  {
    g_timer_destroy(cast(GTimer*)this._cPtr);
  }

  /**
      If timer has been started but not stopped, obtains the time since
      the timer was started. If timer has been stopped, obtains the
      elapsed time between the time it was started and the time it was
      stopped. The return value is the number of seconds elapsed,
      including any fractional part. The microseconds out parameter is
      essentially useless.
  
      Params:
        microseconds = return location for the fractional part of seconds
                         elapsed, in microseconds (that is, the total number
                         of microseconds elapsed, modulo 1000000), or null
      Returns: seconds elapsed as a floating point value, including any
                 fractional part.
  */
  double elapsed(out gulong microseconds)
  {
    double _retval;
    _retval = g_timer_elapsed(cast(GTimer*)this._cPtr, cast(gulong*)&microseconds);
    return _retval;
  }

  /**
      Exposes whether the timer is currently active.
      Returns: true if the timer is running, false otherwise
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)g_timer_is_active(cast(GTimer*)this._cPtr);
    return _retval;
  }

  /**
      This function is useless; it's fine to call [glib.timer.Timer.start] on an
      already-started timer to reset the start time, so [glib.timer.Timer.reset]
      serves no purpose.
  */
  void reset()
  {
    g_timer_reset(cast(GTimer*)this._cPtr);
  }

  /**
      Marks a start time, so that future calls to [glib.timer.Timer.elapsed] will
      report the time since [glib.timer.Timer.start] was called. [glib.timer.Timer.new_]
      automatically marks the start time, so no need to call
      [glib.timer.Timer.start] immediately after creating the timer.
  */
  void start()
  {
    g_timer_start(cast(GTimer*)this._cPtr);
  }

  /**
      Marks an end time, so calls to [glib.timer.Timer.elapsed] will return the
      difference between this end time and the start time.
  */
  void stop()
  {
    g_timer_stop(cast(GTimer*)this._cPtr);
  }

  /**
      Creates a new timer, and starts timing (i.e. [glib.timer.Timer.start] is
      implicitly called for you).
      Returns: a new #GTimer.
  */
  this()
  {
    GTimer* _cretval;
    _cretval = g_timer_new();
    this(_cretval, Yes.Take);
  }
}
