/// Module for [EventCrossing] class
module gid.gdk3.event_crossing;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Generated when the pointer enters or leaves a window.
*/
class EventCrossing : StructWrap!(GdkEventCrossing, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_crossing.EventCrossing` wrap type.
      Params:
        type = the type of the event ([gid.gdk4.types.EventType.EnterNotify] or [gid.gdk4.types.EventType.LeaveNotify]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        subwindow = the window that was entered or left.
        time = the time of the event in milliseconds.
        x = the x coordinate of the pointer relative to the window.
        y = the y coordinate of the pointer relative to the window.
        xRoot = the x coordinate of the pointer relative to the root of the screen.
        yRoot = the y coordinate of the pointer relative to the root of the screen.
        mode = the crossing mode ([gid.gdk4.types.CrossingMode.Normal], [gid.gdk4.types.CrossingMode.Grab],
           [gid.gdk4.types.CrossingMode.Ungrab], [gid.gdk4.types.CrossingMode.GtkGrab], [gid.gdk4.types.CrossingMode.GtkUngrab] or
           [gid.gdk4.types.CrossingMode.StateChanged]).  [gid.gdk4.types.CrossingMode.GtkGrab], [gid.gdk4.types.CrossingMode.GtkUngrab],
           and [gid.gdk4.types.CrossingMode.StateChanged] were added in 2.14 and are always synthesized,
           never native.
        detail = the kind of crossing that happened ([gid.gdk4.types.NotifyType.Inferior],
           [gid.gdk4.types.NotifyType.Ancestor], [gid.gdk4.types.NotifyType.Virtual], [gid.gdk4.types.NotifyType.Nonlinear] or
           [gid.gdk4.types.NotifyType.NonlinearVirtual]).
        focus = true if @window is the focus window or an inferior.
        state = a bit-mask representing the state of
            the modifier keys (e.g. Control, Shift and Alt) and the pointer
            buttons. See #GdkModifierType.
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, gid.gdk3.window.Window subwindow = gid.gdk3.window.Window.init, uint time = uint.init, double x = 0.0, double y = 0.0, double xRoot = 0.0, double yRoot = 0.0, gid.gdk3.types.CrossingMode mode = gid.gdk3.types.CrossingMode.init, gid.gdk3.types.NotifyType detail = gid.gdk3.types.NotifyType.init, bool focus = bool.init, gid.gdk3.types.ModifierType state = gid.gdk3.types.ModifierType.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.subwindow = subwindow;
    this.time = time;
    this.x = x;
    this.y = y;
    this.xRoot = xRoot;
    this.yRoot = yRoot;
    this.mode = mode;
    this.detail = detail;
    this.focus = focus;
    this.state = state;
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
      Returns: the type of the event ([gid.gdk4.types.EventType.EnterNotify] or [gid.gdk4.types.EventType.LeaveNotify]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventCrossing*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk4.types.EventType.EnterNotify] or [gid.gdk4.types.EventType.LeaveNotify]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventCrossing*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventCrossing*)this._cPtr).window);
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
    (cast(GdkEventCrossing*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventCrossing*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventCrossing*)this._cPtr).sendEvent = propval;
  }

  private gid.gdk3.window.Window _subwindowRef; // Keeps borrowed field value alive

  /**
      Get `subwindow` field.
      Returns: the window that was entered or left.
  */
  @property gid.gdk3.window.Window subwindow() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventCrossing*)this._cPtr).subwindow);
  }

  /**
      Set `subwindow` field.
      Params:
        propval = the window that was entered or left.
  */
  @property void subwindow(gid.gdk3.window.Window propval) nothrow
  {
    if (_refuseBorrowedStore("subwindow"))
      return;

    _subwindowRef = propval;
    (cast(GdkEventCrossing*)this._cPtr).subwindow = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventCrossing*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventCrossing*)this._cPtr).time = propval;
  }

  /**
      Get `x` field.
      Returns: the x coordinate of the pointer relative to the window.
  */
  @property double x() nothrow
  {
    return (cast(GdkEventCrossing*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the x coordinate of the pointer relative to the window.
  */
  @property void x(double propval) nothrow
  {
    (cast(GdkEventCrossing*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the y coordinate of the pointer relative to the window.
  */
  @property double y() nothrow
  {
    return (cast(GdkEventCrossing*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the y coordinate of the pointer relative to the window.
  */
  @property void y(double propval) nothrow
  {
    (cast(GdkEventCrossing*)this._cPtr).y = propval;
  }

  /**
      Get `xRoot` field.
      Returns: the x coordinate of the pointer relative to the root of the screen.
  */
  @property double xRoot() nothrow
  {
    return (cast(GdkEventCrossing*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = the x coordinate of the pointer relative to the root of the screen.
  */
  @property void xRoot(double propval) nothrow
  {
    (cast(GdkEventCrossing*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: the y coordinate of the pointer relative to the root of the screen.
  */
  @property double yRoot() nothrow
  {
    return (cast(GdkEventCrossing*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = the y coordinate of the pointer relative to the root of the screen.
  */
  @property void yRoot(double propval) nothrow
  {
    (cast(GdkEventCrossing*)this._cPtr).yRoot = propval;
  }

  /**
      Get `mode` field.
      Returns: the crossing mode ([gid.gdk4.types.CrossingMode.Normal], [gid.gdk4.types.CrossingMode.Grab],
         [gid.gdk4.types.CrossingMode.Ungrab], [gid.gdk4.types.CrossingMode.GtkGrab], [gid.gdk4.types.CrossingMode.GtkUngrab] or
         [gid.gdk4.types.CrossingMode.StateChanged]).  [gid.gdk4.types.CrossingMode.GtkGrab], [gid.gdk4.types.CrossingMode.GtkUngrab],
         and [gid.gdk4.types.CrossingMode.StateChanged] were added in 2.14 and are always synthesized,
         never native.
  */
  @property gid.gdk3.types.CrossingMode mode() nothrow
  {
    return cast(gid.gdk3.types.CrossingMode)(cast(GdkEventCrossing*)this._cPtr).mode;
  }

  /**
      Set `mode` field.
      Params:
        propval = the crossing mode ([gid.gdk4.types.CrossingMode.Normal], [gid.gdk4.types.CrossingMode.Grab],
           [gid.gdk4.types.CrossingMode.Ungrab], [gid.gdk4.types.CrossingMode.GtkGrab], [gid.gdk4.types.CrossingMode.GtkUngrab] or
           [gid.gdk4.types.CrossingMode.StateChanged]).  [gid.gdk4.types.CrossingMode.GtkGrab], [gid.gdk4.types.CrossingMode.GtkUngrab],
           and [gid.gdk4.types.CrossingMode.StateChanged] were added in 2.14 and are always synthesized,
           never native.
  */
  @property void mode(gid.gdk3.types.CrossingMode propval) nothrow
  {
    (cast(GdkEventCrossing*)this._cPtr).mode = cast(GdkCrossingMode)propval;
  }

  /**
      Get `detail` field.
      Returns: the kind of crossing that happened ([gid.gdk4.types.NotifyType.Inferior],
         [gid.gdk4.types.NotifyType.Ancestor], [gid.gdk4.types.NotifyType.Virtual], [gid.gdk4.types.NotifyType.Nonlinear] or
         [gid.gdk4.types.NotifyType.NonlinearVirtual]).
  */
  @property gid.gdk3.types.NotifyType detail() nothrow
  {
    return cast(gid.gdk3.types.NotifyType)(cast(GdkEventCrossing*)this._cPtr).detail;
  }

  /**
      Set `detail` field.
      Params:
        propval = the kind of crossing that happened ([gid.gdk4.types.NotifyType.Inferior],
           [gid.gdk4.types.NotifyType.Ancestor], [gid.gdk4.types.NotifyType.Virtual], [gid.gdk4.types.NotifyType.Nonlinear] or
           [gid.gdk4.types.NotifyType.NonlinearVirtual]).
  */
  @property void detail(gid.gdk3.types.NotifyType propval) nothrow
  {
    (cast(GdkEventCrossing*)this._cPtr).detail = cast(GdkNotifyType)propval;
  }

  /**
      Get `focus` field.
      Returns: true if @window is the focus window or an inferior.
  */
  @property bool focus() nothrow
  {
    return cast(bool)(cast(GdkEventCrossing*)this._cPtr).focus;
  }

  /**
      Set `focus` field.
      Params:
        propval = true if @window is the focus window or an inferior.
  */
  @property void focus(bool propval) nothrow
  {
    (cast(GdkEventCrossing*)this._cPtr).focus = propval;
  }

  /**
      Get `state` field.
      Returns: a bit-mask representing the state of
          the modifier keys (e.g. Control, Shift and Alt) and the pointer
          buttons. See #GdkModifierType.
  */
  @property gid.gdk3.types.ModifierType state() nothrow
  {
    return cast(gid.gdk3.types.ModifierType)(cast(GdkEventCrossing*)this._cPtr).state;
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
    (cast(GdkEventCrossing*)this._cPtr).state = cast(GdkModifierType)propval;
  }
}
