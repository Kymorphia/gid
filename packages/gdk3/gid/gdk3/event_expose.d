/// Module for [EventExpose] class
module gid.gdk3.event_expose;

public import gid.core.basictypes;
import gid.cairo1.region;
import gid.core.gid;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.rectangle;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Generated when all or part of a window becomes visible and needs to be
    redrawn.
*/
class EventExpose : StructWrap!(GdkEventExpose, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_expose.EventExpose` wrap type.
      Params:
        type = the type of the event ([gid.gdk3.types.EventType.Expose] or [gid.gdk3.types.EventType.Damage]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        area = bounding box of @region.
        region = the region that needs to be redrawn.
        count = the number of contiguous [gid.gdk3.types.EventType.Expose] events following this one.
            The only use for this is “exposure compression”, i.e. handling all
            contiguous [gid.gdk3.types.EventType.Expose] events in one go, though GDK performs some
            exposure compression so this is not normally needed.
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, gid.gdk3.rectangle.Rectangle area = gid.gdk3.rectangle.Rectangle.init, gid.cairo1.region.Region region = gid.cairo1.region.Region.init, int count = int.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.area = area;
    this.region = region;
    this.count = count;
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
      Returns: the type of the event ([gid.gdk3.types.EventType.Expose] or [gid.gdk3.types.EventType.Damage]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventExpose*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk3.types.EventType.Expose] or [gid.gdk3.types.EventType.Damage]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventExpose*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventExpose*)this._cPtr).window);
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
    (cast(GdkEventExpose*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
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
  @property gid.gdk3.rectangle.Rectangle area() nothrow
  {
    return cToD!(gid.gdk3.rectangle.Rectangle)(cast(void*)&(cast(GdkEventExpose*)this._cPtr).area);
  }

  /**
      Set `area` field.
      Params:
        propval = bounding box of @region.
  */
  @property void area(gid.gdk3.rectangle.Rectangle propval) nothrow
  {
    (cast(GdkEventExpose*)this._cPtr).area = cast(GdkRectangle)propval;
  }

  private gid.cairo1.region.Region _regionRef; // Keeps borrowed field value alive

  /**
      Get `region` field.
      Returns: the region that needs to be redrawn.
  */
  @property gid.cairo1.region.Region region() nothrow
  {
    return cToD!(gid.cairo1.region.Region)(cast(void*)(cast(GdkEventExpose*)this._cPtr).region);
  }

  /**
      Set `region` field.
      Params:
        propval = the region that needs to be redrawn.
  */
  @property void region(gid.cairo1.region.Region propval) nothrow
  {
    if (_refuseBorrowedStore("region"))
      return;

    _regionRef = propval;
    (cast(GdkEventExpose*)this._cPtr).region = propval ? cast(cairo_region_t*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `count` field.
      Returns: the number of contiguous [gid.gdk3.types.EventType.Expose] events following this one.
          The only use for this is “exposure compression”, i.e. handling all
          contiguous [gid.gdk3.types.EventType.Expose] events in one go, though GDK performs some
          exposure compression so this is not normally needed.
  */
  @property int count() nothrow
  {
    return (cast(GdkEventExpose*)this._cPtr).count;
  }

  /**
      Set `count` field.
      Params:
        propval = the number of contiguous [gid.gdk3.types.EventType.Expose] events following this one.
            The only use for this is “exposure compression”, i.e. handling all
            contiguous [gid.gdk3.types.EventType.Expose] events in one go, though GDK performs some
            exposure compression so this is not normally needed.
  */
  @property void count(int propval) nothrow
  {
    (cast(GdkEventExpose*)this._cPtr).count = propval;
  }
}
