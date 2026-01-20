/// Module for [EventConfigure] class
module gdk.event_configure;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when a window size or position has changed.
*/
class EventConfigure
{
  GdkEventConfigure _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_configure.EventConfigure");

    _cInstance = *cast(GdkEventConfigure*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.Configure]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventConfigure*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.Configure]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventConfigure*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventConfigure*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventConfigure*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventConfigure*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventConfigure*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventConfigure*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `x` field.
      Returns: the new x coordinate of the window, relative to its parent.
  */
  @property int x()
  {
    return (cast(GdkEventConfigure*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the new x coordinate of the window, relative to its parent.
  */
  @property void x(int propval)
  {
    (cast(GdkEventConfigure*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the new y coordinate of the window, relative to its parent.
  */
  @property int y()
  {
    return (cast(GdkEventConfigure*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the new y coordinate of the window, relative to its parent.
  */
  @property void y(int propval)
  {
    (cast(GdkEventConfigure*)this._cPtr).y = propval;
  }

  /**
      Get `width` field.
      Returns: the new width of the window.
  */
  @property int width()
  {
    return (cast(GdkEventConfigure*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = the new width of the window.
  */
  @property void width(int propval)
  {
    (cast(GdkEventConfigure*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: the new height of the window.
  */
  @property int height()
  {
    return (cast(GdkEventConfigure*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = the new height of the window.
  */
  @property void height(int propval)
  {
    (cast(GdkEventConfigure*)this._cPtr).height = propval;
  }
}
