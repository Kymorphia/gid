/// Module for [EventAny] class
module gdk.event_any;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Contains the fields which are common to all event structs.
    Any event pointer can safely be cast to a pointer to a #GdkEventAny to
    access these fields.
*/
class EventAny
{
  GdkEventAny _cInstance;

  /**
      Create a `event_any.EventAny` wrap type.
      Params:
        type = the type of the event.
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
  */
  this(gdk.types.EventType type = gdk.types.EventType.init, gdk.window.Window window = gdk.window.Window.init, byte sendEvent = byte.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventAny*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `type` field.
      Returns: the type of the event.
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventAny*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event.
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventAny*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gdk.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventAny*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    _windowRef = propval;
    (cast(GdkEventAny*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventAny*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventAny*)this._cPtr).sendEvent = propval;
  }
}
