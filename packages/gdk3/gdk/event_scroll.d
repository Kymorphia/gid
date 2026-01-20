/// Module for [EventScroll] class
module gdk.event_scroll;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated from button presses for the buttons 4 to 7. Wheel mice are
    usually configured to generate button press events for buttons 4 and 5
    when the wheel is turned.
    
    Some GDK backends can also generate “smooth” scroll events, which
    can be recognized by the [gdk.types.ScrollDirection.Smooth] scroll direction. For
    these, the scroll deltas can be obtained with
    [gdk.event.Event.getScrollDeltas].
*/
class EventScroll
{
  GdkEventScroll _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_scroll.EventScroll");

    _cInstance = *cast(GdkEventScroll*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.Scroll]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventScroll*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.Scroll]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventScroll*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventScroll*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventScroll*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventScroll*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventScroll*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventScroll*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time()
  {
    return (cast(GdkEventScroll*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval)
  {
    (cast(GdkEventScroll*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: the x coordinate of the pointer relative to the window.
  */
  @property double x()
  {
    return (cast(GdkEventScroll*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the x coordinate of the pointer relative to the window.
  */
  @property void x(double propval)
  {
    (cast(GdkEventScroll*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the y coordinate of the pointer relative to the window.
  */
  @property double y()
  {
    return (cast(GdkEventScroll*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the y coordinate of the pointer relative to the window.
  */
  @property void y(double propval)
  {
    (cast(GdkEventScroll*)this._cPtr).y = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventScroll*)this._cPtr).state;
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
    (cast(GdkEventScroll*)this._cPtr).state = cast(GdkModifierType)propval;
  }

  /**
      Get `direction` field.
      Returns: the direction to scroll to (one of [gdk.types.ScrollDirection.Up],
          [gdk.types.ScrollDirection.Down], [gdk.types.ScrollDirection.Left], [gdk.types.ScrollDirection.Right] or
          [gdk.types.ScrollDirection.Smooth]).
  */
  @property gdk.types.ScrollDirection direction()
  {
    return cast(gdk.types.ScrollDirection)(cast(GdkEventScroll*)this._cPtr).direction;
  }

  /**
      Set `direction` field.
      Params:
        propval = the direction to scroll to (one of [gdk.types.ScrollDirection.Up],
            [gdk.types.ScrollDirection.Down], [gdk.types.ScrollDirection.Left], [gdk.types.ScrollDirection.Right] or
            [gdk.types.ScrollDirection.Smooth]).
  */
  @property void direction(gdk.types.ScrollDirection propval)
  {
    (cast(GdkEventScroll*)this._cPtr).direction = cast(GdkScrollDirection)propval;
  }

  /**
      Get `device` field.
      Returns: the master device that the event originated from. Use
        [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  @property gdk.device.Device device()
  {
    return cToD!(gdk.device.Device)(cast(void*)(cast(GdkEventScroll*)this._cPtr).device);
  }

  /**
      Set `device` field.
      Params:
        propval = the master device that the event originated from. Use
          [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  @property void device(gdk.device.Device propval)
  {
    cValueFree!(gdk.device.Device)(cast(void*)(cast(GdkEventScroll*)this._cPtr).device);
    dToC(propval, cast(void*)&(cast(GdkEventScroll*)this._cPtr).device);
  }

  /**
      Get `xRoot` field.
      Returns: the x coordinate of the pointer relative to the root of the
          screen.
  */
  @property double xRoot()
  {
    return (cast(GdkEventScroll*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = the x coordinate of the pointer relative to the root of the
            screen.
  */
  @property void xRoot(double propval)
  {
    (cast(GdkEventScroll*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: the y coordinate of the pointer relative to the root of the
          screen.
  */
  @property double yRoot()
  {
    return (cast(GdkEventScroll*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = the y coordinate of the pointer relative to the root of the
            screen.
  */
  @property void yRoot(double propval)
  {
    (cast(GdkEventScroll*)this._cPtr).yRoot = propval;
  }

  /**
      Get `deltaX` field.
      Returns: the x coordinate of the scroll delta
  */
  @property double deltaX()
  {
    return (cast(GdkEventScroll*)this._cPtr).deltaX;
  }

  /**
      Set `deltaX` field.
      Params:
        propval = the x coordinate of the scroll delta
  */
  @property void deltaX(double propval)
  {
    (cast(GdkEventScroll*)this._cPtr).deltaX = propval;
  }

  /**
      Get `deltaY` field.
      Returns: the y coordinate of the scroll delta
  */
  @property double deltaY()
  {
    return (cast(GdkEventScroll*)this._cPtr).deltaY;
  }

  /**
      Set `deltaY` field.
      Params:
        propval = the y coordinate of the scroll delta
  */
  @property void deltaY(double propval)
  {
    (cast(GdkEventScroll*)this._cPtr).deltaY = propval;
  }

  /** */
  @property uint isStop()
  {
    return (cast(GdkEventScroll*)this._cPtr).isStop;
  }

  /** */
  @property void isStop(uint propval)
  {
    (cast(GdkEventScroll*)this._cPtr).isStop = propval;
  }
}
