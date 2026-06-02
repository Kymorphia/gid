/// Module for [EventDND] class
module gdk.event_dnd;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.drag_context;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during DND operations.
*/
class EventDND
{
  GdkEventDND _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventDND*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.DragEnter], [gdk.types.EventType.DragLeave],
          [gdk.types.EventType.DragMotion], [gdk.types.EventType.DragStatus], [gdk.types.EventType.DropStart] or
          [gdk.types.EventType.DropFinished]).
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventDND*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.DragEnter], [gdk.types.EventType.DragLeave],
            [gdk.types.EventType.DragMotion], [gdk.types.EventType.DragStatus], [gdk.types.EventType.DropStart] or
            [gdk.types.EventType.DropFinished]).
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventDND*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventDND*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventDND*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventDND*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventDND*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventDND*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `context` field.
      Returns: the #GdkDragContext for the current DND operation.
  */
  @property gdk.drag_context.DragContext context() nothrow
  {
    return cToD!(gdk.drag_context.DragContext)(cast(void*)(cast(GdkEventDND*)this._cPtr).context);
  }

  /**
      Set `context` field.
      Params:
        propval = the #GdkDragContext for the current DND operation.
  */
  @property void context(gdk.drag_context.DragContext propval) nothrow
  {
    cValueFree!(gdk.drag_context.DragContext)(cast(void*)(cast(GdkEventDND*)this._cPtr).context);
    dToC(propval, cast(void*)&(cast(GdkEventDND*)this._cPtr).context);
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventDND*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventDND*)this._cPtr).time = propval;
  }

  /**
      Get `xRoot` field.
      Returns: the x coordinate of the pointer relative to the root of the
          screen, only set for [gdk.types.EventType.DragMotion] and [gdk.types.EventType.DropStart].
  */
  @property short xRoot() nothrow
  {
    return (cast(GdkEventDND*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = the x coordinate of the pointer relative to the root of the
            screen, only set for [gdk.types.EventType.DragMotion] and [gdk.types.EventType.DropStart].
  */
  @property void xRoot(short propval) nothrow
  {
    (cast(GdkEventDND*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: the y coordinate of the pointer relative to the root of the
          screen, only set for [gdk.types.EventType.DragMotion] and [gdk.types.EventType.DropStart].
  */
  @property short yRoot() nothrow
  {
    return (cast(GdkEventDND*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = the y coordinate of the pointer relative to the root of the
            screen, only set for [gdk.types.EventType.DragMotion] and [gdk.types.EventType.DropStart].
  */
  @property void yRoot(short propval) nothrow
  {
    (cast(GdkEventDND*)this._cPtr).yRoot = propval;
  }
}
