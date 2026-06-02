/// Module for [EventMotion] class
module gdk.event_motion;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when the pointer moves.
*/
class EventMotion
{
  GdkEventMotion _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventMotion*)ptr;

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
      Returns: the type of the event.
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventMotion*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event.
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventMotion*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventMotion*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventMotion*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventMotion*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventMotion*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventMotion*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventMotion*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventMotion*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: the x coordinate of the pointer relative to the window.
  */
  @property double x() nothrow
  {
    return (cast(GdkEventMotion*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the x coordinate of the pointer relative to the window.
  */
  @property void x(double propval) nothrow
  {
    (cast(GdkEventMotion*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the y coordinate of the pointer relative to the window.
  */
  @property double y() nothrow
  {
    return (cast(GdkEventMotion*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the y coordinate of the pointer relative to the window.
  */
  @property void y(double propval) nothrow
  {
    (cast(GdkEventMotion*)this._cPtr).y = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gdk.types.ModifierType state() nothrow
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventMotion*)this._cPtr).state;
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
    (cast(GdkEventMotion*)this._cPtr).state = cast(GdkModifierType)propval;
  }

  /**
      Get `isHint` field.
      Returns: set to 1 if this event is just a hint, see the
          [gdk.types.EventMask.PointerMotionHintMask] value of #GdkEventMask.
  */
  @property short isHint() nothrow
  {
    return (cast(GdkEventMotion*)this._cPtr).isHint;
  }

  /**
      Set `isHint` field.
      Params:
        propval = set to 1 if this event is just a hint, see the
            [gdk.types.EventMask.PointerMotionHintMask] value of #GdkEventMask.
  */
  @property void isHint(short propval) nothrow
  {
    (cast(GdkEventMotion*)this._cPtr).isHint = propval;
  }

  /**
      Get `device` field.
      Returns: the master device that the event originated from. Use
        [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  @property gdk.device.Device device() nothrow
  {
    return cToD!(gdk.device.Device)(cast(void*)(cast(GdkEventMotion*)this._cPtr).device);
  }

  /**
      Set `device` field.
      Params:
        propval = the master device that the event originated from. Use
          [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  @property void device(gdk.device.Device propval) nothrow
  {
    cValueFree!(gdk.device.Device)(cast(void*)(cast(GdkEventMotion*)this._cPtr).device);
    dToC(propval, cast(void*)&(cast(GdkEventMotion*)this._cPtr).device);
  }

  /**
      Get `xRoot` field.
      Returns: the x coordinate of the pointer relative to the root of the
          screen.
  */
  @property double xRoot() nothrow
  {
    return (cast(GdkEventMotion*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = the x coordinate of the pointer relative to the root of the
            screen.
  */
  @property void xRoot(double propval) nothrow
  {
    (cast(GdkEventMotion*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: the y coordinate of the pointer relative to the root of the
          screen.
  */
  @property double yRoot() nothrow
  {
    return (cast(GdkEventMotion*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = the y coordinate of the pointer relative to the root of the
            screen.
  */
  @property void yRoot(double propval) nothrow
  {
    (cast(GdkEventMotion*)this._cPtr).yRoot = propval;
  }
}
