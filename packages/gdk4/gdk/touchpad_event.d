/// Module for [TouchpadEvent] class
module gdk.touchpad_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to a gesture on a touchpad device.
    
    Unlike touchscreens, where the windowing system sends basic
    sequences of begin, update, end events, and leaves gesture
    recognition to the clients, touchpad gestures are typically
    processed by the system, resulting in these events.
*/
class TouchpadEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.touchpad_event.TouchpadEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
      Extracts delta information from a touchpad event.
  
      Params:
        dx = return location for x
        dy = return location for y
  */
  void getDeltas(out double dx, out double dy)
  {
    gdk_touchpad_event_get_deltas(cast(GdkEvent*)cPtr, cast(double*)&dx, cast(double*)&dy);
  }

  /**
      Extracts the touchpad gesture phase from a touchpad event.
      Returns: the gesture phase of event
  */
  gdk.types.TouchpadGesturePhase getGesturePhase()
  {
    GdkTouchpadGesturePhase _cretval;
    _cretval = gdk_touchpad_event_get_gesture_phase(cast(GdkEvent*)cPtr);
    gdk.types.TouchpadGesturePhase _retval = cast(gdk.types.TouchpadGesturePhase)_cretval;
    return _retval;
  }

  /**
      Extracts the number of fingers from a touchpad event.
      Returns: the number of fingers for event
  */
  uint getNFingers()
  {
    uint _retval;
    _retval = gdk_touchpad_event_get_n_fingers(cast(GdkEvent*)cPtr);
    return _retval;
  }

  /**
      Extracts the angle delta from a touchpad pinch event.
      Returns: the angle delta of event
  */
  double getPinchAngleDelta()
  {
    double _retval;
    _retval = gdk_touchpad_event_get_pinch_angle_delta(cast(GdkEvent*)cPtr);
    return _retval;
  }

  /**
      Extracts the scale from a touchpad pinch event.
      Returns: the scale of event
  */
  double getPinchScale()
  {
    double _retval;
    _retval = gdk_touchpad_event_get_pinch_scale(cast(GdkEvent*)cPtr);
    return _retval;
  }
}
