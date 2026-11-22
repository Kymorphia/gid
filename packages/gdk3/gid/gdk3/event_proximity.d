/// Module for [EventProximity] class
module gid.gdk3.event_proximity;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.device;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Proximity events are generated when using GDK’s wrapper for the
    XInput extension. The XInput extension is an add-on for standard X
    that allows you to use nonstandard devices such as graphics tablets.
    A proximity event indicates that the stylus has moved in or out of
    contact with the tablet, or perhaps that the user’s finger has moved
    in or out of contact with a touch screen.
    
    This event type will be used pretty rarely. It only is important for
    XInput aware programs that are drawing their own cursor.
*/
class EventProximity : StructWrap!(GdkEventProximity, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_proximity.EventProximity` wrap type.
      Params:
        type = the type of the event ([gid.gdk4.types.EventType.ProximityIn] or [gid.gdk4.types.EventType.ProximityOut]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        time = the time of the event in milliseconds.
        device = the master device that the event originated from. Use
          [gid.gdk3.event.Event.getSourceDevice] to get the slave device.
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, uint time = uint.init, gid.gdk3.device.Device device = gid.gdk3.device.Device.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.time = time;
    this.device = device;
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
      Returns: the type of the event ([gid.gdk4.types.EventType.ProximityIn] or [gid.gdk4.types.EventType.ProximityOut]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventProximity*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk4.types.EventType.ProximityIn] or [gid.gdk4.types.EventType.ProximityOut]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventProximity*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventProximity*)this._cPtr).window);
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
    (cast(GdkEventProximity*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventProximity*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventProximity*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventProximity*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventProximity*)this._cPtr).time = propval;
  }

  private gid.gdk3.device.Device _deviceRef; // Keeps borrowed field value alive

  /**
      Get `device` field.
      Returns: the master device that the event originated from. Use
        [gid.gdk3.event.Event.getSourceDevice] to get the slave device.
  */
  @property gid.gdk3.device.Device device() nothrow
  {
    return cToD!(gid.gdk3.device.Device)(cast(void*)(cast(GdkEventProximity*)this._cPtr).device);
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
    (cast(GdkEventProximity*)this._cPtr).device = propval ? cast(GdkDevice*)propval._cPtr(No.Dup) : null;
  }
}
