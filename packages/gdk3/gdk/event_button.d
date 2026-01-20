/// Module for [EventButton] class
module gdk.event_button;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Used for button press and button release events. The
    @type field will be one of [gdk.types.EventType.ButtonPress],
    [gdk.types.EventType._2buttonPress], [gdk.types.EventType._3buttonPress] or [gdk.types.EventType.ButtonRelease],
    
    Double and triple-clicks result in a sequence of events being received.
    For double-clicks the order of events will be:
    
    $(LIST
      * [gdk.types.EventType.ButtonPress]
      * [gdk.types.EventType.ButtonRelease]
      * [gdk.types.EventType.ButtonPress]
      * [gdk.types.EventType._2buttonPress]
      * [gdk.types.EventType.ButtonRelease]
    )
      
    Note that the first click is received just like a normal
    button press, while the second click results in a [gdk.types.EventType._2buttonPress]
    being received just after the [gdk.types.EventType.ButtonPress].
    
    Triple-clicks are very similar to double-clicks, except that
    [gdk.types.EventType._3buttonPress] is inserted after the third click. The order of the
    events is:
    
    $(LIST
      * [gdk.types.EventType.ButtonPress]
      * [gdk.types.EventType.ButtonRelease]
      * [gdk.types.EventType.ButtonPress]
      * [gdk.types.EventType._2buttonPress]
      * [gdk.types.EventType.ButtonRelease]
      * [gdk.types.EventType.ButtonPress]
      * [gdk.types.EventType._3buttonPress]
      * [gdk.types.EventType.ButtonRelease]
    )
      
    For a double click to occur, the second button press must occur within
    1/4 of a second of the first. For a triple click to occur, the third
    button press must also occur within 1/2 second of the first button press.
*/
class EventButton
{
  GdkEventButton _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_button.EventButton");

    _cInstance = *cast(GdkEventButton*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.ButtonPress], [gdk.types.EventType._2buttonPress],
          [gdk.types.EventType._3buttonPress] or [gdk.types.EventType.ButtonRelease]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventButton*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.ButtonPress], [gdk.types.EventType._2buttonPress],
            [gdk.types.EventType._3buttonPress] or [gdk.types.EventType.ButtonRelease]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventButton*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventButton*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventButton*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventButton*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventButton*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventButton*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time()
  {
    return (cast(GdkEventButton*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval)
  {
    (cast(GdkEventButton*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: the x coordinate of the pointer relative to the window.
  */
  @property double x()
  {
    return (cast(GdkEventButton*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the x coordinate of the pointer relative to the window.
  */
  @property void x(double propval)
  {
    (cast(GdkEventButton*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the y coordinate of the pointer relative to the window.
  */
  @property double y()
  {
    return (cast(GdkEventButton*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the y coordinate of the pointer relative to the window.
  */
  @property void y(double propval)
  {
    (cast(GdkEventButton*)this._cPtr).y = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventButton*)this._cPtr).state;
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
    (cast(GdkEventButton*)this._cPtr).state = cast(GdkModifierType)propval;
  }

  /**
      Get `button` field.
      Returns: the button which was pressed or released, numbered from 1 to 5.
          Normally button 1 is the left mouse button, 2 is the middle button,
          and 3 is the right button. On 2-button mice, the middle button can
          often be simulated by pressing both mouse buttons together.
  */
  @property uint button()
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
  @property void button(uint propval)
  {
    (cast(GdkEventButton*)this._cPtr).button = propval;
  }

  /**
      Get `device` field.
      Returns: the master device that the event originated from. Use
        [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  @property gdk.device.Device device()
  {
    return cToD!(gdk.device.Device)(cast(void*)(cast(GdkEventButton*)this._cPtr).device);
  }

  /**
      Set `device` field.
      Params:
        propval = the master device that the event originated from. Use
          [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  @property void device(gdk.device.Device propval)
  {
    cValueFree!(gdk.device.Device)(cast(void*)(cast(GdkEventButton*)this._cPtr).device);
    dToC(propval, cast(void*)&(cast(GdkEventButton*)this._cPtr).device);
  }

  /**
      Get `xRoot` field.
      Returns: the x coordinate of the pointer relative to the root of the
          screen.
  */
  @property double xRoot()
  {
    return (cast(GdkEventButton*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = the x coordinate of the pointer relative to the root of the
            screen.
  */
  @property void xRoot(double propval)
  {
    (cast(GdkEventButton*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: the y coordinate of the pointer relative to the root of the
          screen.
  */
  @property double yRoot()
  {
    return (cast(GdkEventButton*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = the y coordinate of the pointer relative to the root of the
            screen.
  */
  @property void yRoot(double propval)
  {
    (cast(GdkEventButton*)this._cPtr).yRoot = propval;
  }
}
