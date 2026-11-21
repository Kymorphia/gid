/// Module for [EventScroll] class
module gid.gdk3.event_scroll;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.device;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Generated from button presses for the buttons 4 to 7. Wheel mice are
    usually configured to generate button press events for buttons 4 and 5
    when the wheel is turned.
    
    Some GDK backends can also generate “smooth” scroll events, which
    can be recognized by the [gid.gdk4.types.ScrollDirection.Smooth] scroll direction. For
    these, the scroll deltas can be obtained with
    [gid.gdk3.event.Event.getScrollDeltas].
*/
class EventScroll : StructWrap!(GdkEventScroll, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_scroll.EventScroll` wrap type.
      Params:
        type = the type of the event ([gid.gdk4.types.EventType.Scroll]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        time = the time of the event in milliseconds.
        x = the x coordinate of the pointer relative to the window.
        y = the y coordinate of the pointer relative to the window.
        state = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType.
        direction = the direction to scroll to (one of [gid.gdk4.types.ScrollDirection.Up],
            [gid.gdk4.types.ScrollDirection.Down], [gid.gdk4.types.ScrollDirection.Left], [gid.gdk4.types.ScrollDirection.Right] or
            [gid.gdk4.types.ScrollDirection.Smooth]).
        device = the master device that the event originated from. Use
          [gid.gdk3.event.Event.getSourceDevice] to get the slave device.
        xRoot = the x coordinate of the pointer relative to the root of the
            screen.
        yRoot = the y coordinate of the pointer relative to the root of the
            screen.
        deltaX = the x coordinate of the scroll delta
        deltaY = the y coordinate of the scroll delta
        isStop = 
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, uint time = uint.init, double x = 0.0, double y = 0.0, gid.gdk3.types.ModifierType state = gid.gdk3.types.ModifierType.init, gid.gdk3.types.ScrollDirection direction = gid.gdk3.types.ScrollDirection.init, gid.gdk3.device.Device device = gid.gdk3.device.Device.init, double xRoot = 0.0, double yRoot = 0.0, double deltaX = 0.0, double deltaY = 0.0, uint isStop = uint.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.time = time;
    this.x = x;
    this.y = y;
    this.state = state;
    this.direction = direction;
    this.device = device;
    this.xRoot = xRoot;
    this.yRoot = yRoot;
    this.deltaX = deltaX;
    this.deltaY = deltaY;
    this.isStop = isStop;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gid.gdk4.types.EventType.Scroll]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventScroll*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk4.types.EventType.Scroll]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventScroll*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gid.gdk3.window.Window propval) nothrow
  {
    if (_refuseBorrowedStore("window"))
      return;

    _windowRef = propval;
    (cast(GdkEventScroll*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventScroll*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventScroll*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: the x coordinate of the pointer relative to the window.
  */
  @property double x() nothrow
  {
    return (cast(GdkEventScroll*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the x coordinate of the pointer relative to the window.
  */
  @property void x(double propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the y coordinate of the pointer relative to the window.
  */
  @property double y() nothrow
  {
    return (cast(GdkEventScroll*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the y coordinate of the pointer relative to the window.
  */
  @property void y(double propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).y = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gid.gdk3.types.ModifierType state() nothrow
  {
    return cast(gid.gdk3.types.ModifierType)(cast(GdkEventScroll*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType.
  */
  @property void state(gid.gdk3.types.ModifierType propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).state = cast(GdkModifierType)propval;
  }

  /**
      Get `direction` field.
      Returns: the direction to scroll to (one of [gid.gdk4.types.ScrollDirection.Up],
          [gid.gdk4.types.ScrollDirection.Down], [gid.gdk4.types.ScrollDirection.Left], [gid.gdk4.types.ScrollDirection.Right] or
          [gid.gdk4.types.ScrollDirection.Smooth]).
  */
  @property gid.gdk3.types.ScrollDirection direction() nothrow
  {
    return cast(gid.gdk3.types.ScrollDirection)(cast(GdkEventScroll*)this._cPtr).direction;
  }

  /**
      Set `direction` field.
      Params:
        propval = the direction to scroll to (one of [gid.gdk4.types.ScrollDirection.Up],
            [gid.gdk4.types.ScrollDirection.Down], [gid.gdk4.types.ScrollDirection.Left], [gid.gdk4.types.ScrollDirection.Right] or
            [gid.gdk4.types.ScrollDirection.Smooth]).
  */
  @property void direction(gid.gdk3.types.ScrollDirection propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).direction = cast(GdkScrollDirection)propval;
  }

  private gid.gdk3.device.Device _deviceRef; // Keeps borrowed field value alive

  /**
      Get `device` field.
      Returns: the master device that the event originated from. Use
        [gid.gdk3.event.Event.getSourceDevice] to get the slave device.
  */
  @property gid.gdk3.device.Device device() nothrow
  {
    return cToD!(gid.gdk3.device.Device)(cast(void*)(cast(GdkEventScroll*)this._cPtr).device);
  }

  /**
      Set `device` field.
      Params:
        propval = the master device that the event originated from. Use
          [gid.gdk3.event.Event.getSourceDevice] to get the slave device.
  */
  @property void device(gid.gdk3.device.Device propval) nothrow
  {
    if (_refuseBorrowedStore("device"))
      return;

    _deviceRef = propval;
    (cast(GdkEventScroll*)this._cPtr).device = propval ? cast(GdkDevice*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `xRoot` field.
      Returns: the x coordinate of the pointer relative to the root of the
          screen.
  */
  @property double xRoot() nothrow
  {
    return (cast(GdkEventScroll*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = the x coordinate of the pointer relative to the root of the
            screen.
  */
  @property void xRoot(double propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: the y coordinate of the pointer relative to the root of the
          screen.
  */
  @property double yRoot() nothrow
  {
    return (cast(GdkEventScroll*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = the y coordinate of the pointer relative to the root of the
            screen.
  */
  @property void yRoot(double propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).yRoot = propval;
  }

  /**
      Get `deltaX` field.
      Returns: the x coordinate of the scroll delta
  */
  @property double deltaX() nothrow
  {
    return (cast(GdkEventScroll*)this._cPtr).deltaX;
  }

  /**
      Set `deltaX` field.
      Params:
        propval = the x coordinate of the scroll delta
  */
  @property void deltaX(double propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).deltaX = propval;
  }

  /**
      Get `deltaY` field.
      Returns: the y coordinate of the scroll delta
  */
  @property double deltaY() nothrow
  {
    return (cast(GdkEventScroll*)this._cPtr).deltaY;
  }

  /**
      Set `deltaY` field.
      Params:
        propval = the y coordinate of the scroll delta
  */
  @property void deltaY(double propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).deltaY = propval;
  }

  /** */
  @property uint isStop() nothrow
  {
    return (cast(GdkEventScroll*)this._cPtr).isStop;
  }

  /** */
  @property void isStop(uint propval) nothrow
  {
    (cast(GdkEventScroll*)this._cPtr).isStop = propval;
  }
}
