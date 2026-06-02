/// Module for [EventProximity] class
module gdk.event_proximity;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.types;
import gdk.window;
import gid.gid;

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
class EventProximity
{
  GdkEventProximity _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventProximity*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.ProximityIn] or [gdk.types.EventType.ProximityOut]).
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventProximity*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.ProximityIn] or [gdk.types.EventType.ProximityOut]).
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventProximity*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventProximity*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventProximity*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventProximity*)this._cPtr).window);
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

  /**
      Get `device` field.
      Returns: the master device that the event originated from. Use
        [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  @property gdk.device.Device device() nothrow
  {
    return cToD!(gdk.device.Device)(cast(void*)(cast(GdkEventProximity*)this._cPtr).device);
  }

  /**
      Set `device` field.
      Params:
        propval = the master device that the event originated from. Use
          [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  @property void device(gdk.device.Device propval) nothrow
  {
    cValueFree!(gdk.device.Device)(cast(void*)(cast(GdkEventProximity*)this._cPtr).device);
    dToC(propval, cast(void*)&(cast(GdkEventProximity*)this._cPtr).device);
  }
}
