/// Module for [EventVisibility] class
module gdk.event_visibility;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when the window visibility status has changed.

    Deprecated: Modern composited windowing systems with pervasive
          transparency make it impossible to track the visibility of a window
          reliably, so this event can not be guaranteed to provide useful
          information.
*/
class EventVisibility
{
  GdkEventVisibility _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_visibility.EventVisibility");

    _cInstance = *cast(GdkEventVisibility*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.VisibilityNotify]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventVisibility*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.VisibilityNotify]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventVisibility*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventVisibility*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventVisibility*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventVisibility*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventVisibility*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventVisibility*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `state` field.
      Returns: the new visibility state ([gdk.types.VisibilityState.FullyObscured],
          [gdk.types.VisibilityState.Partial] or [gdk.types.VisibilityState.Unobscured]).
  */
  @property gdk.types.VisibilityState state()
  {
    return cast(gdk.types.VisibilityState)(cast(GdkEventVisibility*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = the new visibility state ([gdk.types.VisibilityState.FullyObscured],
            [gdk.types.VisibilityState.Partial] or [gdk.types.VisibilityState.Unobscured]).
  */
  @property void state(gdk.types.VisibilityState propval)
  {
    (cast(GdkEventVisibility*)this._cPtr).state = cast(GdkVisibilityState)propval;
  }
}
