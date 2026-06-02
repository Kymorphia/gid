/// Module for [EventFocus] class
module gdk.event_focus;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Describes a change of keyboard focus.
*/
class EventFocus
{
  GdkEventFocus _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventFocus*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.FocusChange]).
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventFocus*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.FocusChange]).
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventFocus*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventFocus*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventFocus*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventFocus*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventFocus*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventFocus*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `in_` field.
      Returns: true if the window has gained the keyboard focus, false if
          it has lost the focus.
  */
  @property short in_() nothrow
  {
    return (cast(GdkEventFocus*)this._cPtr).in_;
  }

  /**
      Set `in_` field.
      Params:
        propval = true if the window has gained the keyboard focus, false if
            it has lost the focus.
  */
  @property void in_(short propval) nothrow
  {
    (cast(GdkEventFocus*)this._cPtr).in_ = propval;
  }
}
