/// Module for [EventWindowState] class
module gid.gdk3.event_window_state;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Generated when the state of a toplevel window changes.
*/
class EventWindowState : StructWrap!(GdkEventWindowState, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_window_state.EventWindowState` wrap type.
      Params:
        type = the type of the event ([gid.gdk3.types.EventType.WindowState]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        changedMask = mask specifying what flags have changed.
        newWindowState = the new window state, a combination of
            #GdkWindowState bits.
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, gid.gdk3.types.WindowState changedMask = gid.gdk3.types.WindowState.init, gid.gdk3.types.WindowState newWindowState = gid.gdk3.types.WindowState.init) nothrow
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
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `type` field.
      Returns: the type of the event ([gid.gdk3.types.EventType.WindowState]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventWindowState*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk3.types.EventType.WindowState]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventWindowState*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventWindowState*)this._cPtr).window);
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
    (cast(GdkEventWindowState*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
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
  @property gid.gdk3.types.WindowState changedMask() nothrow
  {
    return cast(gid.gdk3.types.WindowState)(cast(GdkEventWindowState*)this._cPtr).changedMask;
  }

  /**
      Set `changedMask` field.
      Params:
        propval = mask specifying what flags have changed.
  */
  @property void changedMask(gid.gdk3.types.WindowState propval) nothrow
  {
    (cast(GdkEventWindowState*)this._cPtr).changedMask = cast(GdkWindowState)propval;
  }

  /**
      Get `newWindowState` field.
      Returns: the new window state, a combination of
          #GdkWindowState bits.
  */
  @property gid.gdk3.types.WindowState newWindowState() nothrow
  {
    return cast(gid.gdk3.types.WindowState)(cast(GdkEventWindowState*)this._cPtr).newWindowState;
  }

  /**
      Set `newWindowState` field.
      Params:
        propval = the new window state, a combination of
            #GdkWindowState bits.
  */
  @property void newWindowState(gid.gdk3.types.WindowState propval) nothrow
  {
    (cast(GdkEventWindowState*)this._cPtr).newWindowState = cast(GdkWindowState)propval;
  }
}
