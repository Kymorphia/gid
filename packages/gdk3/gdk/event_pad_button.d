/// Module for [EventPadButton] class
module gdk.event_pad_button;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during [gdk.types.InputSource.TabletPad] button presses and releases.
*/
class EventPadButton
{
  GdkEventPadButton _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventPadButton*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.PadButtonPress] or [gdk.types.EventType.PadButtonRelease]).
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventPadButton*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.PadButtonPress] or [gdk.types.EventType.PadButtonRelease]).
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventPadButton*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventPadButton*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventPadButton*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventPadButton*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventPadButton*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventPadButton*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventPadButton*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventPadButton*)this._cPtr).time = propval;
  }

  /**
      Get `group` field.
      Returns: the pad group the button belongs to. A [gdk.types.InputSource.TabletPad] device
          may have one or more groups containing a set of buttons/rings/strips each.
  */
  @property uint group() nothrow
  {
    return (cast(GdkEventPadButton*)this._cPtr).group;
  }

  /**
      Set `group` field.
      Params:
        propval = the pad group the button belongs to. A [gdk.types.InputSource.TabletPad] device
            may have one or more groups containing a set of buttons/rings/strips each.
  */
  @property void group(uint propval) nothrow
  {
    (cast(GdkEventPadButton*)this._cPtr).group = propval;
  }

  /**
      Get `button` field.
      Returns: The pad button that was pressed.
  */
  @property uint button() nothrow
  {
    return (cast(GdkEventPadButton*)this._cPtr).button;
  }

  /**
      Set `button` field.
      Params:
        propval = The pad button that was pressed.
  */
  @property void button(uint propval) nothrow
  {
    (cast(GdkEventPadButton*)this._cPtr).button = propval;
  }

  /**
      Get `mode` field.
      Returns: The current mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
          device may have different current modes.
  */
  @property uint mode() nothrow
  {
    return (cast(GdkEventPadButton*)this._cPtr).mode;
  }

  /**
      Set `mode` field.
      Params:
        propval = The current mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
            device may have different current modes.
  */
  @property void mode(uint propval) nothrow
  {
    (cast(GdkEventPadButton*)this._cPtr).mode = propval;
  }
}
