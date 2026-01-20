/// Module for [EventPadAxis] class
module gdk.event_pad_axis;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during [gdk.types.InputSource.TabletPad] interaction with tactile sensors.
*/
class EventPadAxis
{
  GdkEventPadAxis _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_pad_axis.EventPadAxis");

    _cInstance = *cast(GdkEventPadAxis*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.PadRing] or [gdk.types.EventType.PadStrip]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventPadAxis*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.PadRing] or [gdk.types.EventType.PadStrip]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventPadAxis*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventPadAxis*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventPadAxis*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventPadAxis*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventPadAxis*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventPadAxis*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time()
  {
    return (cast(GdkEventPadAxis*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval)
  {
    (cast(GdkEventPadAxis*)this._cPtr).time = propval;
  }

  /**
      Get `group` field.
      Returns: the pad group the ring/strip belongs to. A [gdk.types.InputSource.TabletPad]
          device may have one or more groups containing a set of buttons/rings/strips
          each.
  */
  @property uint group()
  {
    return (cast(GdkEventPadAxis*)this._cPtr).group;
  }

  /**
      Set `group` field.
      Params:
        propval = the pad group the ring/strip belongs to. A [gdk.types.InputSource.TabletPad]
            device may have one or more groups containing a set of buttons/rings/strips
            each.
  */
  @property void group(uint propval)
  {
    (cast(GdkEventPadAxis*)this._cPtr).group = propval;
  }

  /**
      Get `index` field.
      Returns: number of strip/ring that was interacted. This number is 0-indexed.
  */
  @property uint index()
  {
    return (cast(GdkEventPadAxis*)this._cPtr).index;
  }

  /**
      Set `index` field.
      Params:
        propval = number of strip/ring that was interacted. This number is 0-indexed.
  */
  @property void index(uint propval)
  {
    (cast(GdkEventPadAxis*)this._cPtr).index = propval;
  }

  /**
      Get `mode` field.
      Returns: The current mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
          device may have different current modes.
  */
  @property uint mode()
  {
    return (cast(GdkEventPadAxis*)this._cPtr).mode;
  }

  /**
      Set `mode` field.
      Params:
        propval = The current mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
            device may have different current modes.
  */
  @property void mode(uint propval)
  {
    (cast(GdkEventPadAxis*)this._cPtr).mode = propval;
  }

  /**
      Get `value` field.
      Returns: The current value for the given axis.
  */
  @property double value()
  {
    return (cast(GdkEventPadAxis*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = The current value for the given axis.
  */
  @property void value(double propval)
  {
    (cast(GdkEventPadAxis*)this._cPtr).value = propval;
  }
}
