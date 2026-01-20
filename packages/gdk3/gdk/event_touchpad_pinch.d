/// Module for [EventTouchpadPinch] class
module gdk.event_touchpad_pinch;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during touchpad swipe gestures.
*/
class EventTouchpadPinch
{
  GdkEventTouchpadPinch _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_touchpad_pinch.EventTouchpadPinch");

    _cInstance = *cast(GdkEventTouchpadPinch*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gdk.types.EventType.TouchpadPinch])
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventTouchpadPinch*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.TouchpadPinch])
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventTouchpadPinch*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventTouchpadPinch*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventTouchpadPinch*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `phase` field.
      Returns: the current phase of the gesture
  */
  @property byte phase()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).phase;
  }

  /**
      Set `phase` field.
      Params:
        propval = the current phase of the gesture
  */
  @property void phase(byte propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).phase = propval;
  }

  /**
      Get `nFingers` field.
      Returns: The number of fingers triggering the pinch
  */
  @property byte nFingers()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).nFingers;
  }

  /**
      Set `nFingers` field.
      Params:
        propval = The number of fingers triggering the pinch
  */
  @property void nFingers(byte propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).nFingers = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds
  */
  @property uint time()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds
  */
  @property void time(uint propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: The X coordinate of the pointer
  */
  @property double x()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = The X coordinate of the pointer
  */
  @property void x(double propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: The Y coordinate of the pointer
  */
  @property double y()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = The Y coordinate of the pointer
  */
  @property void y(double propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).y = propval;
  }

  /**
      Get `dx` field.
      Returns: Movement delta in the X axis of the swipe focal point
  */
  @property double dx()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).dx;
  }

  /**
      Set `dx` field.
      Params:
        propval = Movement delta in the X axis of the swipe focal point
  */
  @property void dx(double propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).dx = propval;
  }

  /**
      Get `dy` field.
      Returns: Movement delta in the Y axis of the swipe focal point
  */
  @property double dy()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).dy;
  }

  /**
      Set `dy` field.
      Params:
        propval = Movement delta in the Y axis of the swipe focal point
  */
  @property void dy(double propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).dy = propval;
  }

  /**
      Get `angleDelta` field.
      Returns: The angle change in radians, negative angles
          denote counter-clockwise movements
  */
  @property double angleDelta()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).angleDelta;
  }

  /**
      Set `angleDelta` field.
      Params:
        propval = The angle change in radians, negative angles
            denote counter-clockwise movements
  */
  @property void angleDelta(double propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).angleDelta = propval;
  }

  /**
      Get `scale` field.
      Returns: The current scale, relative to that at the time of
          the corresponding [gdk.types.TouchpadGesturePhase.Begin] event
  */
  @property double scale()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).scale;
  }

  /**
      Set `scale` field.
      Params:
        propval = The current scale, relative to that at the time of
            the corresponding [gdk.types.TouchpadGesturePhase.Begin] event
  */
  @property void scale(double propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).scale = propval;
  }

  /**
      Get `xRoot` field.
      Returns: The X coordinate of the pointer, relative to the
          root of the screen.
  */
  @property double xRoot()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = The X coordinate of the pointer, relative to the
            root of the screen.
  */
  @property void xRoot(double propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: The Y coordinate of the pointer, relative to the
          root of the screen.
  */
  @property double yRoot()
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = The Y coordinate of the pointer, relative to the
            root of the screen.
  */
  @property void yRoot(double propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).yRoot = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventTouchpadPinch*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType.
  */
  @property void state(gdk.types.ModifierType propval)
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).state = cast(GdkModifierType)propval;
  }
}
