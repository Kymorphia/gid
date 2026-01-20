/// Module for [FrameTimings] class
module gdk.frame_timings;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    A [gdk.frame_timings.FrameTimings] object holds timing information for a single frame
    of the application’s displays.
    
    To retrieve [gdk.frame_timings.FrameTimings] objects, use [gdk.frame_clock.FrameClock.getTimings]
    or [gdk.frame_clock.FrameClock.getCurrentTimings]. The information in
    [gdk.frame_timings.FrameTimings] is useful for precise synchronization of video with
    the event or audio streams, and for measuring quality metrics for the
    application’s display, such as latency and jitter.
*/
class FrameTimings : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_frame_timings_get_type != &gidSymbolNotFound ? gdk_frame_timings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FrameTimings self()
  {
    return this;
  }

  /**
      Returns whether timings are complete.
      
      The timing information in a [gdk.frame_timings.FrameTimings] is filled in
      incrementally as the frame as drawn and passed off to the
      window system for processing and display to the user. The
      accessor functions for [gdk.frame_timings.FrameTimings] can return 0 to
      indicate an unavailable value for two reasons: either because
      the information is not yet available, or because it isn't
      available at all.
      
      Once this function returns true for a frame, you can be
      certain that no further values will become available and be
      stored in the [gdk.frame_timings.FrameTimings].
      Returns: true if all information that will be available
          for the frame has been filled in.
  */
  bool getComplete()
  {
    bool _retval;
    _retval = cast(bool)gdk_frame_timings_get_complete(cast(GdkFrameTimings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the frame counter value of the [gdk.frame_clock.FrameClock] when
      this frame was drawn.
      Returns: the frame counter value for this frame
  */
  long getFrameCounter()
  {
    long _retval;
    _retval = gdk_frame_timings_get_frame_counter(cast(GdkFrameTimings*)this._cPtr);
    return _retval;
  }

  /**
      Returns the frame time for the frame.
      
      This is the time value that is typically used to time
      animations for the frame. See [gdk.frame_clock.FrameClock.getFrameTime].
      Returns: the frame time for the frame, in the timescale
         of [glib.global.getMonotonicTime]
  */
  long getFrameTime()
  {
    long _retval;
    _retval = gdk_frame_timings_get_frame_time(cast(GdkFrameTimings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the predicted time at which this frame will be displayed.
      
      Although no predicted time may be available, if one is available,
      it will be available while the frame is being generated, in contrast
      to [gdk.frame_timings.FrameTimings.getPresentationTime], which is only
      available after the frame has been presented.
      
      In general, if you are simply animating, you should use
      [gdk.frame_clock.FrameClock.getFrameTime] rather than this function,
      but this function is useful for applications that want exact control
      over latency. For example, a movie player may want this information
      for Audio/Video synchronization.
      Returns: The predicted time at which the frame will be presented,
          in the timescale of [glib.global.getMonotonicTime], or 0 if no predicted
          presentation time is available.
  */
  long getPredictedPresentationTime()
  {
    long _retval;
    _retval = gdk_frame_timings_get_predicted_presentation_time(cast(GdkFrameTimings*)this._cPtr);
    return _retval;
  }

  /**
      Reurns the presentation time.
      
      This is the time at which the frame became visible to the user.
      Returns: the time the frame was displayed to the user, in the
          timescale of [glib.global.getMonotonicTime], or 0 if no presentation
          time is available. See [gdk.frame_timings.FrameTimings.getComplete]
  */
  long getPresentationTime()
  {
    long _retval;
    _retval = gdk_frame_timings_get_presentation_time(cast(GdkFrameTimings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the natural interval between presentation times for
      the display that this frame was displayed on.
      
      Frame presentation usually happens during the “vertical
      blanking interval”.
      Returns: the refresh interval of the display, in microseconds,
          or 0 if the refresh interval is not available.
          See [gdk.frame_timings.FrameTimings.getComplete].
  */
  long getRefreshInterval()
  {
    long _retval;
    _retval = gdk_frame_timings_get_refresh_interval(cast(GdkFrameTimings*)this._cPtr);
    return _retval;
  }
}
