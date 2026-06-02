/// Module for [EventExpose] class
module gdk.event_expose;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventExpose*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.Expose] or [gdk.types.EventType.Damage]).
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventExpose*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.Expose] or [gdk.types.EventType.Damage]).
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventExpose*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventExpose*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventExpose*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventExpose*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventExpose*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventExpose*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `area` field.
      Returns: bounding box of @region.
  */
  @property gdk.rectangle.Rectangle area() nothrow
  {
    return cToD!(gdk.rectangle.Rectangle)(cast(void*)&(cast(GdkEventExpose*)this._cPtr).area);
  }

  /**
      Set `area` field.
      Params:
        propval = bounding box of @region.
  */
  @property void area(gdk.rectangle.Rectangle propval) nothrow
  {
    (cast(GdkEventExpose*)this._cPtr).area = cast(GdkRectangle)propval;
  }

  /**
      Get `region` field.
      Returns: the region that needs to be redrawn.
  */
  @property cairo.region.Region region() nothrow
  {
    return cToD!(cairo.region.Region)(cast(void*)(cast(GdkEventExpose*)this._cPtr).region);
  }

  /**
      Set `region` field.
      Params:
        propval = the region that needs to be redrawn.
  */
  @property void region(cairo.region.Region propval) nothrow
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
  @property int count() nothrow
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
  @property void count(int propval) nothrow
  {
    (cast(GdkEventExpose*)this._cPtr).count = propval;
  }
}
