/// Module for [EventAny] class
module gdk.event_any;

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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_any.EventAny");

    _cInstance = *cast(GdkEventAny*)ptr;

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
      Returns: the type of the event.
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventAny*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event.
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventAny*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventAny*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventAny*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventAny*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventAny*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventAny*)this._cPtr).sendEvent = propval;
  }
}
