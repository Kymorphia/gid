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
class EventFocus : StructWrap!(GdkEventFocus, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_focus.EventFocus` wrap type.
      Params:
        type = the type of the event ([gdk.types.EventType.FocusChange]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        in_ = true if the window has gained the keyboard focus, false if
            it has lost the focus.
  */
  this(gdk.types.EventType type = gdk.types.EventType.init, gdk.window.Window window = gdk.window.Window.init, byte sendEvent = byte.init, short in_ = short.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.in_ = in_;
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

  private gdk.window.Window _windowRef; // Keeps borrowed field value alive

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
    if (_refuseBorrowedStore("window"))
      return;

    _windowRef = propval;
    (cast(GdkEventFocus*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
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
