/// Module for [EventPadGroupMode] class
module gdk.event_pad_group_mode;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during [gdk.types.InputSource.TabletPad] mode switches in a group.
*/
class EventPadGroupMode
{
  GdkEventPadGroupMode _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_pad_group_mode.EventPadGroupMode");

    _cInstance = *cast(GdkEventPadGroupMode*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.PadGroupMode]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventPadGroupMode*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.PadGroupMode]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventPadGroupMode*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventPadGroupMode*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventPadGroupMode*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventPadGroupMode*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventPadGroupMode*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventPadGroupMode*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time()
  {
    return (cast(GdkEventPadGroupMode*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval)
  {
    (cast(GdkEventPadGroupMode*)this._cPtr).time = propval;
  }

  /**
      Get `group` field.
      Returns: the pad group that is switching mode. A [gdk.types.InputSource.TabletPad]
          device may have one or more groups containing a set of buttons/rings/strips
          each.
  */
  @property uint group()
  {
    return (cast(GdkEventPadGroupMode*)this._cPtr).group;
  }

  /**
      Set `group` field.
      Params:
        propval = the pad group that is switching mode. A [gdk.types.InputSource.TabletPad]
            device may have one or more groups containing a set of buttons/rings/strips
            each.
  */
  @property void group(uint propval)
  {
    (cast(GdkEventPadGroupMode*)this._cPtr).group = propval;
  }

  /**
      Get `mode` field.
      Returns: The new mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
          device may have different current modes.
  */
  @property uint mode()
  {
    return (cast(GdkEventPadGroupMode*)this._cPtr).mode;
  }

  /**
      Set `mode` field.
      Params:
        propval = The new mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
            device may have different current modes.
  */
  @property void mode(uint propval)
  {
    (cast(GdkEventPadGroupMode*)this._cPtr).mode = propval;
  }
}
