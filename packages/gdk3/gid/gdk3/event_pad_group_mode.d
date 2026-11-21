/// Module for [EventPadGroupMode] class
module gid.gdk3.event_pad_group_mode;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Generated during [gid.gdk4.types.InputSource.TabletPad] mode switches in a group.
*/
class EventPadGroupMode : StructWrap!(GdkEventPadGroupMode, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_pad_group_mode.EventPadGroupMode` wrap type.
      Params:
        type = the type of the event ([gid.gdk4.types.EventType.PadGroupMode]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        time = the time of the event in milliseconds.
        group = the pad group that is switching mode. A [gid.gdk4.types.InputSource.TabletPad]
            device may have one or more groups containing a set of buttons/rings/strips
            each.
        mode = The new mode of @group. Different groups in a [gid.gdk4.types.InputSource.TabletPad]
            device may have different current modes.
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, uint time = uint.init, uint group = uint.init, uint mode = uint.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.time = time;
    this.group = group;
    this.mode = mode;
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
      Returns: the type of the event ([gid.gdk4.types.EventType.PadGroupMode]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventPadGroupMode*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk4.types.EventType.PadGroupMode]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventPadGroupMode*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventPadGroupMode*)this._cPtr).window);
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
    (cast(GdkEventPadGroupMode*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventPadGroupMode*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventPadGroupMode*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventPadGroupMode*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventPadGroupMode*)this._cPtr).time = propval;
  }

  /**
      Get `group` field.
      Returns: the pad group that is switching mode. A [gid.gdk4.types.InputSource.TabletPad]
          device may have one or more groups containing a set of buttons/rings/strips
          each.
  */
  @property uint group() nothrow
  {
    return (cast(GdkEventPadGroupMode*)this._cPtr).group;
  }

  /**
      Set `group` field.
      Params:
        propval = the pad group that is switching mode. A [gid.gdk4.types.InputSource.TabletPad]
            device may have one or more groups containing a set of buttons/rings/strips
            each.
  */
  @property void group(uint propval) nothrow
  {
    (cast(GdkEventPadGroupMode*)this._cPtr).group = propval;
  }

  /**
      Get `mode` field.
      Returns: The new mode of @group. Different groups in a [gid.gdk4.types.InputSource.TabletPad]
          device may have different current modes.
  */
  @property uint mode() nothrow
  {
    return (cast(GdkEventPadGroupMode*)this._cPtr).mode;
  }

  /**
      Set `mode` field.
      Params:
        propval = The new mode of @group. Different groups in a [gid.gdk4.types.InputSource.TabletPad]
            device may have different current modes.
  */
  @property void mode(uint propval) nothrow
  {
    (cast(GdkEventPadGroupMode*)this._cPtr).mode = propval;
  }
}
