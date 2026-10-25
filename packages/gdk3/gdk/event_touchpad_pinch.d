/// Module for [EventTouchpadPinch] class
module gdk.event_touchpad_pinch;

public import gid.basictypes;
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

  /**
      Create a `event_touchpad_pinch.EventTouchpadPinch` wrap type.
      Params:
        type = the type of the event ([gdk.types.EventType.TouchpadPinch])
        window = the window which received the event
        sendEvent = true if the event was sent explicitly
        phase = the current phase of the gesture
        nFingers = The number of fingers triggering the pinch
        time = the time of the event in milliseconds
        x = The X coordinate of the pointer
        y = The Y coordinate of the pointer
        dx = Movement delta in the X axis of the swipe focal point
        dy = Movement delta in the Y axis of the swipe focal point
        angleDelta = The angle change in radians, negative angles
            denote counter-clockwise movements
        scale = The current scale, relative to that at the time of
            the corresponding [gdk.types.TouchpadGesturePhase.Begin] event
        xRoot = The X coordinate of the pointer, relative to the
            root of the screen.
        yRoot = The Y coordinate of the pointer, relative to the
            root of the screen.
        state = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType.
  */
  this(gdk.types.EventType type = gdk.types.EventType.init, gdk.window.Window window = gdk.window.Window.init, byte sendEvent = byte.init, byte phase = byte.init, byte nFingers = byte.init, uint time = uint.init, double x = 0.0, double y = 0.0, double dx = 0.0, double dy = 0.0, double angleDelta = 0.0, double scale = 0.0, double xRoot = 0.0, double yRoot = 0.0, gdk.types.ModifierType state = gdk.types.ModifierType.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.phase = phase;
    this.nFingers = nFingers;
    this.time = time;
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.angleDelta = angleDelta;
    this.scale = scale;
    this.xRoot = xRoot;
    this.yRoot = yRoot;
    this.state = state;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventTouchpadPinch*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gdk.types.EventType.TouchpadPinch])
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventTouchpadPinch*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.TouchpadPinch])
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventTouchpadPinch*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventTouchpadPinch*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventTouchpadPinch*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `phase` field.
      Returns: the current phase of the gesture
  */
  @property byte phase() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).phase;
  }

  /**
      Set `phase` field.
      Params:
        propval = the current phase of the gesture
  */
  @property void phase(byte propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).phase = propval;
  }

  /**
      Get `nFingers` field.
      Returns: The number of fingers triggering the pinch
  */
  @property byte nFingers() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).nFingers;
  }

  /**
      Set `nFingers` field.
      Params:
        propval = The number of fingers triggering the pinch
  */
  @property void nFingers(byte propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).nFingers = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: The X coordinate of the pointer
  */
  @property double x() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = The X coordinate of the pointer
  */
  @property void x(double propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: The Y coordinate of the pointer
  */
  @property double y() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = The Y coordinate of the pointer
  */
  @property void y(double propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).y = propval;
  }

  /**
      Get `dx` field.
      Returns: Movement delta in the X axis of the swipe focal point
  */
  @property double dx() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).dx;
  }

  /**
      Set `dx` field.
      Params:
        propval = Movement delta in the X axis of the swipe focal point
  */
  @property void dx(double propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).dx = propval;
  }

  /**
      Get `dy` field.
      Returns: Movement delta in the Y axis of the swipe focal point
  */
  @property double dy() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).dy;
  }

  /**
      Set `dy` field.
      Params:
        propval = Movement delta in the Y axis of the swipe focal point
  */
  @property void dy(double propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).dy = propval;
  }

  /**
      Get `angleDelta` field.
      Returns: The angle change in radians, negative angles
          denote counter-clockwise movements
  */
  @property double angleDelta() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).angleDelta;
  }

  /**
      Set `angleDelta` field.
      Params:
        propval = The angle change in radians, negative angles
            denote counter-clockwise movements
  */
  @property void angleDelta(double propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).angleDelta = propval;
  }

  /**
      Get `scale` field.
      Returns: The current scale, relative to that at the time of
          the corresponding [gdk.types.TouchpadGesturePhase.Begin] event
  */
  @property double scale() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).scale;
  }

  /**
      Set `scale` field.
      Params:
        propval = The current scale, relative to that at the time of
            the corresponding [gdk.types.TouchpadGesturePhase.Begin] event
  */
  @property void scale(double propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).scale = propval;
  }

  /**
      Get `xRoot` field.
      Returns: The X coordinate of the pointer, relative to the
          root of the screen.
  */
  @property double xRoot() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = The X coordinate of the pointer, relative to the
            root of the screen.
  */
  @property void xRoot(double propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: The Y coordinate of the pointer, relative to the
          root of the screen.
  */
  @property double yRoot() nothrow
  {
    return (cast(GdkEventTouchpadPinch*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = The Y coordinate of the pointer, relative to the
            root of the screen.
  */
  @property void yRoot(double propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).yRoot = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gdk.types.ModifierType state() nothrow
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
  @property void state(gdk.types.ModifierType propval) nothrow
  {
    (cast(GdkEventTouchpadPinch*)this._cPtr).state = cast(GdkModifierType)propval;
  }
}
