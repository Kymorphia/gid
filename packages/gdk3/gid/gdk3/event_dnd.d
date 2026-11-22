/// Module for [EventDND] class
module gid.gdk3.event_dnd;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.drag_context;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Generated during DND operations.
*/
class EventDND : StructWrap!(GdkEventDND, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_dnd.EventDND` wrap type.
      Params:
        type = the type of the event ([gid.gdk4.types.EventType.DragEnter], [gid.gdk4.types.EventType.DragLeave],
            [gid.gdk4.types.EventType.DragMotion], [gid.gdk3.types.EventType.DragStatus], [gid.gdk4.types.EventType.DropStart] or
            [gid.gdk3.types.EventType.DropFinished]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        context = the #GdkDragContext for the current DND operation.
        time = the time of the event in milliseconds.
        xRoot = the x coordinate of the pointer relative to the root of the
            screen, only set for [gid.gdk4.types.EventType.DragMotion] and [gid.gdk4.types.EventType.DropStart].
        yRoot = the y coordinate of the pointer relative to the root of the
            screen, only set for [gid.gdk4.types.EventType.DragMotion] and [gid.gdk4.types.EventType.DropStart].
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, gid.gdk3.drag_context.DragContext context = gid.gdk3.drag_context.DragContext.init, uint time = uint.init, short xRoot = short.init, short yRoot = short.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.context = context;
    this.time = time;
    this.xRoot = xRoot;
    this.yRoot = yRoot;
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
      Returns: the type of the event ([gid.gdk4.types.EventType.DragEnter], [gid.gdk4.types.EventType.DragLeave],
          [gid.gdk4.types.EventType.DragMotion], [gid.gdk3.types.EventType.DragStatus], [gid.gdk4.types.EventType.DropStart] or
          [gid.gdk3.types.EventType.DropFinished]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventDND*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk4.types.EventType.DragEnter], [gid.gdk4.types.EventType.DragLeave],
            [gid.gdk4.types.EventType.DragMotion], [gid.gdk3.types.EventType.DragStatus], [gid.gdk4.types.EventType.DropStart] or
            [gid.gdk3.types.EventType.DropFinished]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventDND*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventDND*)this._cPtr).window);
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
    (cast(GdkEventDND*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
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

  private gid.gdk3.drag_context.DragContext _contextRef; // Keeps borrowed field value alive

  /**
      Get `context` field.
      Returns: the #GdkDragContext for the current DND operation.
  */
  @property gid.gdk3.drag_context.DragContext context() nothrow
  {
    return cToD!(gid.gdk3.drag_context.DragContext)(cast(void*)(cast(GdkEventDND*)this._cPtr).context);
  }

  /**
      Set `context` field.
      Params:
        propval = the #GdkDragContext for the current DND operation.
  */
  @property void context(gid.gdk3.drag_context.DragContext propval) nothrow
  {
    if (_refuseBorrowedStore("context"))
      return;

    _contextRef = propval;
    (cast(GdkEventDND*)this._cPtr).context = propval ? cast(GdkDragContext*)propval._cPtr(No.Dup) : null;
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
          screen, only set for [gid.gdk4.types.EventType.DragMotion] and [gid.gdk4.types.EventType.DropStart].
  */
  @property short xRoot() nothrow
  {
    return (cast(GdkEventDND*)this._cPtr).xRoot;
  }

  /**
      Set `xRoot` field.
      Params:
        propval = the x coordinate of the pointer relative to the root of the
            screen, only set for [gid.gdk4.types.EventType.DragMotion] and [gid.gdk4.types.EventType.DropStart].
  */
  @property void xRoot(short propval) nothrow
  {
    (cast(GdkEventDND*)this._cPtr).xRoot = propval;
  }

  /**
      Get `yRoot` field.
      Returns: the y coordinate of the pointer relative to the root of the
          screen, only set for [gid.gdk4.types.EventType.DragMotion] and [gid.gdk4.types.EventType.DropStart].
  */
  @property short yRoot() nothrow
  {
    return (cast(GdkEventDND*)this._cPtr).yRoot;
  }

  /**
      Set `yRoot` field.
      Params:
        propval = the y coordinate of the pointer relative to the root of the
            screen, only set for [gid.gdk4.types.EventType.DragMotion] and [gid.gdk4.types.EventType.DropStart].
  */
  @property void yRoot(short propval) nothrow
  {
    (cast(GdkEventDND*)this._cPtr).yRoot = propval;
  }
}
