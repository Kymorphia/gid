/// Module for [EventWindowState] class
module gdk.event_window_state;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when the state of a toplevel window changes.
*/
class EventWindowState
{
  GdkEventWindowState _cInstance;

  /**
      Create a `event_window_state.EventWindowState` wrap type.
      Params:
        type = the type of the event ([gdk.types.EventType.WindowState]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        changedMask = mask specifying what flags have changed.
        newWindowState = the new window state, a combination of
            #GdkWindowState bits.
  */
  this(gdk.types.EventType type = gdk.types.EventType.init, gdk.window.Window window = gdk.window.Window.init, byte sendEvent = byte.init, gdk.types.WindowState changedMask = gdk.types.WindowState.init, gdk.types.WindowState newWindowState = gdk.types.WindowState.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.changedMask = changedMask;
    this.newWindowState = newWindowState;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventWindowState*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.WindowState]).
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventWindowState*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.WindowState]).
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventWindowState*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventWindowState*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventWindowState*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventWindowState*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventWindowState*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventWindowState*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `changedMask` field.
      Returns: mask specifying what flags have changed.
  */
  @property gdk.types.WindowState changedMask() nothrow
  {
    return cast(gdk.types.WindowState)(cast(GdkEventWindowState*)this._cPtr).changedMask;
  }

  /**
      Set `changedMask` field.
      Params:
        propval = mask specifying what flags have changed.
  */
  @property void changedMask(gdk.types.WindowState propval) nothrow
  {
    (cast(GdkEventWindowState*)this._cPtr).changedMask = cast(GdkWindowState)propval;
  }

  /**
      Get `newWindowState` field.
      Returns: the new window state, a combination of
          #GdkWindowState bits.
  */
  @property gdk.types.WindowState newWindowState() nothrow
  {
    return cast(gdk.types.WindowState)(cast(GdkEventWindowState*)this._cPtr).newWindowState;
  }

  /**
      Set `newWindowState` field.
      Params:
        propval = the new window state, a combination of
            #GdkWindowState bits.
  */
  @property void newWindowState(gdk.types.WindowState propval) nothrow
  {
    (cast(GdkEventWindowState*)this._cPtr).newWindowState = cast(GdkWindowState)propval;
  }
}
