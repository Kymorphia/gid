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

  /**
      Create a `event_motion.EventMotion` wrap type.
      Params:
        type = the type of the event.
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        time = the time of the event in milliseconds.
        x = the x coordinate of the pointer relative to the window.
        y = the y coordinate of the pointer relative to the window.
        state = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType.
        isHint = set to 1 if this event is just a hint, see the
            [gdk.types.EventMask.PointerMotionHintMask] value of #GdkEventMask.
        device = the master device that the event originated from. Use
          [gdk.event.Event.getSourceDevice] to get the slave device.
        xRoot = the x coordinate of the pointer relative to the root of the
            screen.
        yRoot = the y coordinate of the pointer relative to the root of the
            screen.
  */
  this(gdk.types.EventType type = gdk.types.EventType.init, gdk.window.Window window = gdk.window.Window.init, byte sendEvent = byte.init, uint time = uint.init, double x = 0.0, double y = 0.0, gdk.types.ModifierType state = gdk.types.ModifierType.init, short isHint = short.init, gdk.device.Device device = gdk.device.Device.init, double xRoot = 0.0, double yRoot = 0.0) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.time = time;
    this.x = x;
    this.y = y;
    this.state = state;
    this.isHint = isHint;
    this.device = device;
    this.xRoot = xRoot;
    this.yRoot = yRoot;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventMotion*)ptr;

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

  private gdk.window.Window _windowRef; // Keeps borrowed field value alive

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
    _windowRef = propval;
    (cast(GdkEventMotion*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
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

  private gdk.device.Device _deviceRef; // Keeps borrowed field value alive

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
    _deviceRef = propval;
    (cast(GdkEventMotion*)this._cPtr).device = propval ? cast(GdkDevice*)propval._cPtr(No.Dup) : null;
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
