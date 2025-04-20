/// Module for [EventTouchpadSwipe] class
module gdk.event_touchpad_swipe;

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
  GdkEventTouchpadSwipe cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_touchpad_swipe.EventTouchpadSwipe");

    cInstance = *cast(GdkEventTouchpadSwipe*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gdk.types.EventType.TouchpadSwipe])
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventTouchpadSwipe*)cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.TouchpadSwipe])
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventTouchpadSwipe*)cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventTouchpadSwipe*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventTouchpadSwipe*)cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).sendEvent = propval;
  }

  /**
      Get `phase` field.
      Returns: the current phase of the gesture
  */
  @property byte phase()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).phase;
  }

  /**
      Set `phase` field.
      Params:
        propval = the current phase of the gesture
  */
  @property void phase(byte propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).phase = propval;
  }

  /**
      Get `nFingers` field.
      Returns: The number of fingers triggering the swipe
  */
  @property byte nFingers()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).nFingers;
  }

  /**
      Set `nFingers` field.
      Params:
        propval = The number of fingers triggering the swipe
  */
  @property void nFingers(byte propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).nFingers = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds
  */
  @property uint time()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds
  */
  @property void time(uint propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: The X coordinate of the pointer
  */
  @property double x()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = The X coordinate of the pointer
  */
  @property void x(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: The Y coordinate of the pointer
  */
  @property double y()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = The Y coordinate of the pointer
  */
  @property void y(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).y = propval;
  }

  /**
      Get `dx` field.
      Returns: Movement delta in the X axis of the swipe focal point
  */
  @property double dx()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).dx;
  }

  /**
      Set `dx` field.
      Params:
        propval = Movement delta in the X axis of the swipe focal point
  */
  @property void dx(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).dx = propval;
  }

  /**
      Get `dy` field.
      Returns: Movement delta in the Y axis of the swipe focal point
  */
  @property double dy()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).dy;
  }

  /**
      Set `dy` field.
      Params:
        propval = Movement delta in the Y axis of the swipe focal point
  */
  @property void dy(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).dy = propval;
  }

  /**
      Get `xRoot` field.
      Returns: The X coordinate of the pointer, relative to the
        root of the screen.
  */
  @property double xRoot()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = The X coordinate of the pointer, relative to the
          root of the screen.
  */
  @property void xRoot(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: The Y coordinate of the pointer, relative to the
        root of the screen.
  */
  @property double yRoot()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = The Y coordinate of the pointer, relative to the
          root of the screen.
  */
  @property void yRoot(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).yRoot = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
        the modifier keys (e.g. Control, Shift and Alt) and the pointer
        buttons. See #GdkModifierType.
  */
  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventTouchpadSwipe*)cPtr).state;
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
    (cast(GdkEventTouchpadSwipe*)cPtr).state = cast(GdkModifierType)propval;
  }
}
