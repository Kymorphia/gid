/// Module for [EventTouchpadSwipe] class
module gdk.event_touchpad_swipe;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during touchpad swipe gestures.
*/
class EventTouchpadSwipe
{
  GdkEventTouchpadSwipe _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventTouchpadSwipe*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gdk.types.EventType.TouchpadSwipe])
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventTouchpadSwipe*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.TouchpadSwipe])
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventTouchpadSwipe*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventTouchpadSwipe*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventTouchpadSwipe*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventTouchpadSwipe*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `phase` field.
      Returns: the current phase of the gesture
  */
  @property byte phase() nothrow
  {
    return (cast(GdkEventTouchpadSwipe*)this._cPtr).phase;
  }

  /**
      Set `phase` field.
      Params:
        propval = the current phase of the gesture
  */
  @property void phase(byte propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).phase = propval;
  }

  /**
      Get `nFingers` field.
      Returns: The number of fingers triggering the swipe
  */
  @property byte nFingers() nothrow
  {
    return (cast(GdkEventTouchpadSwipe*)this._cPtr).nFingers;
  }

  /**
      Set `nFingers` field.
      Params:
        propval = The number of fingers triggering the swipe
  */
  @property void nFingers(byte propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).nFingers = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventTouchpadSwipe*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: The X coordinate of the pointer
  */
  @property double x() nothrow
  {
    return (cast(GdkEventTouchpadSwipe*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = The X coordinate of the pointer
  */
  @property void x(double propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: The Y coordinate of the pointer
  */
  @property double y() nothrow
  {
    return (cast(GdkEventTouchpadSwipe*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = The Y coordinate of the pointer
  */
  @property void y(double propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).y = propval;
  }

  /**
      Get `dx` field.
      Returns: Movement delta in the X axis of the swipe focal point
  */
  @property double dx() nothrow
  {
    return (cast(GdkEventTouchpadSwipe*)this._cPtr).dx;
  }

  /**
      Set `dx` field.
      Params:
        propval = Movement delta in the X axis of the swipe focal point
  */
  @property void dx(double propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).dx = propval;
  }

  /**
      Get `dy` field.
      Returns: Movement delta in the Y axis of the swipe focal point
  */
  @property double dy() nothrow
  {
    return (cast(GdkEventTouchpadSwipe*)this._cPtr).dy;
  }

  /**
      Set `dy` field.
      Params:
        propval = Movement delta in the Y axis of the swipe focal point
  */
  @property void dy(double propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).dy = propval;
  }

  /**
      Get `xRoot` field.
      Returns: The X coordinate of the pointer, relative to the
          root of the screen.
  */
  @property double xRoot() nothrow
  {
    return (cast(GdkEventTouchpadSwipe*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = The X coordinate of the pointer, relative to the
            root of the screen.
  */
  @property void xRoot(double propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: The Y coordinate of the pointer, relative to the
          root of the screen.
  */
  @property double yRoot() nothrow
  {
    return (cast(GdkEventTouchpadSwipe*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = The Y coordinate of the pointer, relative to the
            root of the screen.
  */
  @property void yRoot(double propval) nothrow
  {
    (cast(GdkEventTouchpadSwipe*)this._cPtr).yRoot = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gdk.types.ModifierType state() nothrow
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventTouchpadSwipe*)this._cPtr).state;
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
    (cast(GdkEventTouchpadSwipe*)this._cPtr).state = cast(GdkModifierType)propval;
  }
}
