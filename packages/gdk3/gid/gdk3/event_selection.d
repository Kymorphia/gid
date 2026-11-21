/// Module for [EventSelection] class
module gid.gdk3.event_selection;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.atom;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Generated when a selection is requested or ownership of a selection
    is taken over by another client application.
*/
class EventSelection : StructWrap!(GdkEventSelection, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_selection.EventSelection` wrap type.
      Params:
        type = the type of the event ([gid.gdk3.types.EventType.SelectionClear],
            [gid.gdk3.types.EventType.SelectionNotify] or [gid.gdk3.types.EventType.SelectionRequest]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        time = the time of the event in milliseconds.
        requestor = the window on which to place @property or null if none.
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, uint time = uint.init, gid.gdk3.window.Window requestor = gid.gdk3.window.Window.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.time = time;
    this.requestor = requestor;
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
      Returns: the type of the event ([gid.gdk3.types.EventType.SelectionClear],
          [gid.gdk3.types.EventType.SelectionNotify] or [gid.gdk3.types.EventType.SelectionRequest]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventSelection*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk3.types.EventType.SelectionClear],
            [gid.gdk3.types.EventType.SelectionNotify] or [gid.gdk3.types.EventType.SelectionRequest]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventSelection*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventSelection*)this._cPtr).window);
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
    (cast(GdkEventSelection*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventSelection*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventSelection*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `selection` field.
      Returns: the selection.
  */
  @property gid.gdk3.atom.Atom selection() nothrow
  {
    return new gid.gdk3.atom.Atom(cast(GdkAtom)(cast(GdkEventSelection*)this._cPtr).selection, No.Take);
  }

  /**
      Get `target` field.
      Returns: the target to which the selection should be converted.
  */
  @property gid.gdk3.atom.Atom target() nothrow
  {
    return new gid.gdk3.atom.Atom(cast(GdkAtom)(cast(GdkEventSelection*)this._cPtr).target, No.Take);
  }

  /**
      Get `property` field.
      Returns: the property in which to place the result of the conversion.
  */
  @property gid.gdk3.atom.Atom property() nothrow
  {
    return new gid.gdk3.atom.Atom(cast(GdkAtom)(cast(GdkEventSelection*)this._cPtr).property, No.Take);
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventSelection*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventSelection*)this._cPtr).time = propval;
  }

  private gid.gdk3.window.Window _requestorRef; // Keeps borrowed field value alive

  /**
      Get `requestor` field.
      Returns: the window on which to place @property or null if none.
  */
  @property gid.gdk3.window.Window requestor() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventSelection*)this._cPtr).requestor);
  }

  /**
      Set `requestor` field.
      Params:
        propval = the window on which to place @property or null if none.
  */
  @property void requestor(gid.gdk3.window.Window propval) nothrow
  {
    if (_refuseBorrowedStore("requestor"))
      return;

    _requestorRef = propval;
    (cast(GdkEventSelection*)this._cPtr).requestor = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }
}
