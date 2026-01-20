/// Module for [EventExpose] class
module gdk.event_expose;

import cairo.region;
import gdk.c.functions;
import gdk.c.types;
import gdk.rectangle;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when all or part of a window becomes visible and needs to be
    redrawn.
*/
class EventExpose
{
  GdkEventExpose _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_expose.EventExpose");

    _cInstance = *cast(GdkEventExpose*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.Expose] or [gdk.types.EventType.Damage]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventExpose*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.Expose] or [gdk.types.EventType.Damage]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventExpose*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventExpose*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventExpose*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventExpose*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventExpose*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventExpose*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `area` field.
      Returns: bounding box of @region.
  */
  @property gdk.rectangle.Rectangle area()
  {
    return cToD!(gdk.rectangle.Rectangle)(cast(void*)&(cast(GdkEventExpose*)this._cPtr).area);
  }

  /**
      Set `area` field.
      Params:
        propval = bounding box of @region.
  */
  @property void area(gdk.rectangle.Rectangle propval)
  {
    (cast(GdkEventExpose*)this._cPtr).area = cast(GdkRectangle)propval;
  }

  /**
      Get `region` field.
      Returns: the region that needs to be redrawn.
  */
  @property cairo.region.Region region()
  {
    return cToD!(cairo.region.Region)(cast(void*)(cast(GdkEventExpose*)this._cPtr).region);
  }

  /**
      Set `region` field.
      Params:
        propval = the region that needs to be redrawn.
  */
  @property void region(cairo.region.Region propval)
  {
    cValueFree!(cairo.region.Region)(cast(void*)(cast(GdkEventExpose*)this._cPtr).region);
    dToC(propval, cast(void*)&(cast(GdkEventExpose*)this._cPtr).region);
  }

  /**
      Get `count` field.
      Returns: the number of contiguous [gdk.types.EventType.Expose] events following this one.
          The only use for this is “exposure compression”, i.e. handling all
          contiguous [gdk.types.EventType.Expose] events in one go, though GDK performs some
          exposure compression so this is not normally needed.
  */
  @property int count()
  {
    return (cast(GdkEventExpose*)this._cPtr).count;
  }

  /**
      Set `count` field.
      Params:
        propval = the number of contiguous [gdk.types.EventType.Expose] events following this one.
            The only use for this is “exposure compression”, i.e. handling all
            contiguous [gdk.types.EventType.Expose] events in one go, though GDK performs some
            exposure compression so this is not normally needed.
  */
  @property void count(int propval)
  {
    (cast(GdkEventExpose*)this._cPtr).count = propval;
  }
}
