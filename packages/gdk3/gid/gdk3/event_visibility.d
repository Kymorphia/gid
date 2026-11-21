/// Module for [EventVisibility] class
module gid.gdk3.event_visibility;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Generated when the window visibility status has changed.

    Deprecated: Modern composited windowing systems with pervasive
          transparency make it impossible to track the visibility of a window
          reliably, so this event can not be guaranteed to provide useful
          information.
*/
class EventVisibility : StructWrap!(GdkEventVisibility, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_visibility.EventVisibility` wrap type.
      Params:
        type = the type of the event ([gid.gdk3.types.EventType.VisibilityNotify]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        state = the new visibility state ([gid.gdk3.types.VisibilityState.FullyObscured],
            [gid.gdk3.types.VisibilityState.Partial] or [gid.gdk3.types.VisibilityState.Unobscured]).
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, gid.gdk3.types.VisibilityState state = gid.gdk3.types.VisibilityState.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
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
      Returns: the type of the event ([gid.gdk3.types.EventType.VisibilityNotify]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventVisibility*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk3.types.EventType.VisibilityNotify]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventVisibility*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventVisibility*)this._cPtr).window);
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
    (cast(GdkEventVisibility*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventVisibility*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventVisibility*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `state` field.
      Returns: the new visibility state ([gid.gdk3.types.VisibilityState.FullyObscured],
          [gid.gdk3.types.VisibilityState.Partial] or [gid.gdk3.types.VisibilityState.Unobscured]).
  */
  @property gid.gdk3.types.VisibilityState state() nothrow
  {
    return cast(gid.gdk3.types.VisibilityState)(cast(GdkEventVisibility*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = the new visibility state ([gid.gdk3.types.VisibilityState.FullyObscured],
            [gid.gdk3.types.VisibilityState.Partial] or [gid.gdk3.types.VisibilityState.Unobscured]).
  */
  @property void state(gid.gdk3.types.VisibilityState propval) nothrow
  {
    (cast(GdkEventVisibility*)this._cPtr).state = cast(GdkVisibilityState)propval;
  }
}
