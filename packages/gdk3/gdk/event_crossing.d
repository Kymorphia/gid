/// Module for [EventCrossing] class
module gdk.event_crossing;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when the pointer enters or leaves a window.
*/
class EventCrossing
{
  GdkEventCrossing cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_crossing.EventCrossing");

    cInstance = *cast(GdkEventCrossing*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gdk.types.EventType.EnterNotify] or [gdk.types.EventType.LeaveNotify]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventCrossing*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.EnterNotify] or [gdk.types.EventType.LeaveNotify]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventCrossing*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventCrossing*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventCrossing*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventCrossing*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventCrossing*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventCrossing*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `subwindow` field.
      Returns: the window that was entered or left.
  */
  @property gdk.window.Window subwindow()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventCrossing*)this._cPtr).subwindow);
  }

  /**
      Set `subwindow` field.
      Params:
        propval = the window that was entered or left.
  */
  @property void subwindow(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventCrossing*)this._cPtr).subwindow);
    dToC(propval, cast(void*)&(cast(GdkEventCrossing*)this._cPtr).subwindow);
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time()
  {
    return (cast(GdkEventCrossing*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval)
  {
    (cast(GdkEventCrossing*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: the x coordinate of the pointer relative to the window.
  */
  @property double x()
  {
    return (cast(GdkEventCrossing*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the x coordinate of the pointer relative to the window.
  */
  @property void x(double propval)
  {
    (cast(GdkEventCrossing*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the y coordinate of the pointer relative to the window.
  */
  @property double y()
  {
    return (cast(GdkEventCrossing*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the y coordinate of the pointer relative to the window.
  */
  @property void y(double propval)
  {
    (cast(GdkEventCrossing*)this._cPtr).y = propval;
  }

  /**
      Get `xRoot` field.
      Returns: the x coordinate of the pointer relative to the root of the screen.
  */
  @property double xRoot()
  {
    return (cast(GdkEventCrossing*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = the x coordinate of the pointer relative to the root of the screen.
  */
  @property void xRoot(double propval)
  {
    (cast(GdkEventCrossing*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: the y coordinate of the pointer relative to the root of the screen.
  */
  @property double yRoot()
  {
    return (cast(GdkEventCrossing*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = the y coordinate of the pointer relative to the root of the screen.
  */
  @property void yRoot(double propval)
  {
    (cast(GdkEventCrossing*)this._cPtr).yRoot = propval;
  }

  /**
      Get `mode` field.
      Returns: the crossing mode ([gdk.types.CrossingMode.Normal], [gdk.types.CrossingMode.Grab],
       [gdk.types.CrossingMode.Ungrab], [gdk.types.CrossingMode.GtkGrab], [gdk.types.CrossingMode.GtkUngrab] or
       [gdk.types.CrossingMode.StateChanged]).  [gdk.types.CrossingMode.GtkGrab], [gdk.types.CrossingMode.GtkUngrab],
       and [gdk.types.CrossingMode.StateChanged] were added in 2.14 and are always synthesized,
       never native.
  */
  @property gdk.types.CrossingMode mode()
  {
    return cast(gdk.types.CrossingMode)(cast(GdkEventCrossing*)this._cPtr).mode;
  }

  /**
      Set `mode` field.
      Params:
        propval = the crossing mode ([gdk.types.CrossingMode.Normal], [gdk.types.CrossingMode.Grab],
         [gdk.types.CrossingMode.Ungrab], [gdk.types.CrossingMode.GtkGrab], [gdk.types.CrossingMode.GtkUngrab] or
         [gdk.types.CrossingMode.StateChanged]).  [gdk.types.CrossingMode.GtkGrab], [gdk.types.CrossingMode.GtkUngrab],
         and [gdk.types.CrossingMode.StateChanged] were added in 2.14 and are always synthesized,
         never native.
  */
  @property void mode(gdk.types.CrossingMode propval)
  {
    (cast(GdkEventCrossing*)this._cPtr).mode = cast(GdkCrossingMode)propval;
  }

  /**
      Get `detail` field.
      Returns: the kind of crossing that happened ([gdk.types.NotifyType.Inferior],
       [gdk.types.NotifyType.Ancestor], [gdk.types.NotifyType.Virtual], [gdk.types.NotifyType.Nonlinear] or
       [gdk.types.NotifyType.NonlinearVirtual]).
  */
  @property gdk.types.NotifyType detail()
  {
    return cast(gdk.types.NotifyType)(cast(GdkEventCrossing*)this._cPtr).detail;
  }

  /**
      Set `detail` field.
      Params:
        propval = the kind of crossing that happened ([gdk.types.NotifyType.Inferior],
         [gdk.types.NotifyType.Ancestor], [gdk.types.NotifyType.Virtual], [gdk.types.NotifyType.Nonlinear] or
         [gdk.types.NotifyType.NonlinearVirtual]).
  */
  @property void detail(gdk.types.NotifyType propval)
  {
    (cast(GdkEventCrossing*)this._cPtr).detail = cast(GdkNotifyType)propval;
  }

  /**
      Get `focus` field.
      Returns: true if @window is the focus window or an inferior.
  */
  @property bool focus()
  {
    return cast(bool)(cast(GdkEventCrossing*)this._cPtr).focus;
  }

  /**
      Set `focus` field.
      Params:
        propval = true if @window is the focus window or an inferior.
  */
  @property void focus(bool propval)
  {
    (cast(GdkEventCrossing*)this._cPtr).focus = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
        the modifier keys (e.g. Control, Shift and Alt) and the pointer
        buttons. See #GdkModifierType.
  */
  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventCrossing*)this._cPtr).state;
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
    (cast(GdkEventCrossing*)this._cPtr).state = cast(GdkModifierType)propval;
  }
}
