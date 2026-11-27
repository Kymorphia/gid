/// Module for [EventButton] class
module gid.gdk3.event_button;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.device;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Used for button press and button release events. The
    @type field will be one of [gid.gdk4.types.EventType.ButtonPress],
    [gid.gdk3.types.EventType._2buttonPress], [gid.gdk3.types.EventType._3buttonPress] or [gid.gdk4.types.EventType.ButtonRelease],
    
    Double and triple-clicks result in a sequence of events being received.
    For double-clicks the order of events will be:
    
    - [gid.gdk4.types.EventType.ButtonPress]
    - [gid.gdk4.types.EventType.ButtonRelease]
    - [gid.gdk4.types.EventType.ButtonPress]
    - [gid.gdk3.types.EventType._2buttonPress]
    - [gid.gdk4.types.EventType.ButtonRelease]
    
    Note that the first click is received just like a normal
    button press, while the second click results in a [gid.gdk3.types.EventType._2buttonPress]
    being received just after the [gid.gdk4.types.EventType.ButtonPress].
    
    Triple-clicks are very similar to double-clicks, except that
    [gid.gdk3.types.EventType._3buttonPress] is inserted after the third click. The order of the
    events is:
    
    - [gid.gdk4.types.EventType.ButtonPress]
    - [gid.gdk4.types.EventType.ButtonRelease]
    - [gid.gdk4.types.EventType.ButtonPress]
    - [gid.gdk3.types.EventType._2buttonPress]
    - [gid.gdk4.types.EventType.ButtonRelease]
    - [gid.gdk4.types.EventType.ButtonPress]
    - [gid.gdk3.types.EventType._3buttonPress]
    - [gid.gdk4.types.EventType.ButtonRelease]
    
    For a double click to occur, the second button press must occur within
    1/4 of a second of the first. For a triple click to occur, the third
    button press must also occur within 1/2 second of the first button press.
*/
@gidGir("EventButton")
class EventButton : StructWrap!(GdkEventButton, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_button.EventButton` wrap type.
      Params:
        type = the type of the event ([gid.gdk4.types.EventType.ButtonPress], [gid.gdk3.types.EventType._2buttonPress],
            [gid.gdk3.types.EventType._3buttonPress] or [gid.gdk4.types.EventType.ButtonRelease]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        time = the time of the event in milliseconds.
        x = the x coordinate of the pointer relative to the window.
        y = the y coordinate of the pointer relative to the window.
        state = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType.
        button = the button which was pressed or released, numbered from 1 to 5.
            Normally button 1 is the left mouse button, 2 is the middle button,
            and 3 is the right button. On 2-button mice, the middle button can
            often be simulated by pressing both mouse buttons together.
        device = the master device that the event originated from. Use
          [gid.gdk3.event.Event.getSourceDevice] to get the slave device.
        xRoot = the x coordinate of the pointer relative to the root of the
            screen.
        yRoot = the y coordinate of the pointer relative to the root of the
            screen.
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, uint time = uint.init, double x = 0.0, double y = 0.0, gid.gdk3.types.ModifierType state = gid.gdk3.types.ModifierType.init, uint button = uint.init, gid.gdk3.device.Device device = gid.gdk3.device.Device.init, double xRoot = 0.0, double yRoot = 0.0) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.time = time;
    this.x = x;
    this.y = y;
    this.state = state;
    this.button = button;
    this.device = device;
    this.xRoot = xRoot;
    this.yRoot = yRoot;
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
      Returns: the type of the event ([gid.gdk4.types.EventType.ButtonPress], [gid.gdk3.types.EventType._2buttonPress],
          [gid.gdk3.types.EventType._3buttonPress] or [gid.gdk4.types.EventType.ButtonRelease]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventButton*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk4.types.EventType.ButtonPress], [gid.gdk3.types.EventType._2buttonPress],
            [gid.gdk3.types.EventType._3buttonPress] or [gid.gdk4.types.EventType.ButtonRelease]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventButton*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventButton*)this._cPtr).window);
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
    (cast(GdkEventButton*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventButton*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventButton*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventButton*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventButton*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: the x coordinate of the pointer relative to the window.
  */
  @property double x() nothrow
  {
    return (cast(GdkEventButton*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the x coordinate of the pointer relative to the window.
  */
  @property void x(double propval) nothrow
  {
    (cast(GdkEventButton*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the y coordinate of the pointer relative to the window.
  */
  @property double y() nothrow
  {
    return (cast(GdkEventButton*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the y coordinate of the pointer relative to the window.
  */
  @property void y(double propval) nothrow
  {
    (cast(GdkEventButton*)this._cPtr).y = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gid.gdk3.types.ModifierType state() nothrow
  {
    return cast(gid.gdk3.types.ModifierType)(cast(GdkEventButton*)this._cPtr).state;
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
    (cast(GdkEventButton*)this._cPtr).state = cast(GdkModifierType)propval;
  }

  /**
      Get `button` field.
      Returns: the button which was pressed or released, numbered from 1 to 5.
          Normally button 1 is the left mouse button, 2 is the middle button,
          and 3 is the right button. On 2-button mice, the middle button can
          often be simulated by pressing both mouse buttons together.
  */
  @property uint button() nothrow
  {
    return (cast(GdkEventButton*)this._cPtr).button;
  }

  /**
      Set `button` field.
      Params:
        propval = the button which was pressed or released, numbered from 1 to 5.
            Normally button 1 is the left mouse button, 2 is the middle button,
            and 3 is the right button. On 2-button mice, the middle button can
            often be simulated by pressing both mouse buttons together.
  */
  @property void button(uint propval) nothrow
  {
    (cast(GdkEventButton*)this._cPtr).button = propval;
  }

  private gid.gdk3.device.Device _deviceRef; // Keeps borrowed field value alive

  /**
      Get `device` field.
      Returns: the master device that the event originated from. Use
        [gid.gdk3.event.Event.getSourceDevice] to get the slave device.
  */
  @property gid.gdk3.device.Device device() nothrow
  {
    return cToD!(gid.gdk3.device.Device)(cast(void*)(cast(GdkEventButton*)this._cPtr).device);
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
    (cast(GdkEventButton*)this._cPtr).device = propval ? cast(GdkDevice*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `xRoot` field.
      Returns: the x coordinate of the pointer relative to the root of the
          screen.
  */
  @property double xRoot() nothrow
  {
    return (cast(GdkEventButton*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = the x coordinate of the pointer relative to the root of the
            screen.
  */
  @property void xRoot(double propval) nothrow
  {
    (cast(GdkEventButton*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: the y coordinate of the pointer relative to the root of the
          screen.
  */
  @property double yRoot() nothrow
  {
    return (cast(GdkEventButton*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = the y coordinate of the pointer relative to the root of the
            screen.
  */
  @property void yRoot(double propval) nothrow
  {
    (cast(GdkEventButton*)this._cPtr).yRoot = propval;
  }
}
