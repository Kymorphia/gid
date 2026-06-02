/// Module for [EventSelection] class
module gdk.event_selection;

public import gid.basictypes;
import gdk.atom;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when a selection is requested or ownership of a selection
    is taken over by another client application.
*/
class EventSelection
{
  GdkEventSelection _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventSelection*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.SelectionClear],
          [gdk.types.EventType.SelectionNotify] or [gdk.types.EventType.SelectionRequest]).
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventSelection*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.SelectionClear],
            [gdk.types.EventType.SelectionNotify] or [gdk.types.EventType.SelectionRequest]).
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventSelection*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventSelection*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventSelection*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventSelection*)this._cPtr).window);
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
  @property gdk.atom.Atom selection() nothrow
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventSelection*)this._cPtr).selection, No.Take);
  }

  /**
      Get `target` field.
      Returns: the target to which the selection should be converted.
  */
  @property gdk.atom.Atom target() nothrow
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventSelection*)this._cPtr).target, No.Take);
  }

  /**
      Get `property` field.
      Returns: the property in which to place the result of the conversion.
  */
  @property gdk.atom.Atom property() nothrow
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventSelection*)this._cPtr).property, No.Take);
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

  /**
      Get `requestor` field.
      Returns: the window on which to place @property or null if none.
  */
  @property gdk.window.Window requestor() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventSelection*)this._cPtr).requestor);
  }

  /**
      Set `requestor` field.
      Params:
        propval = the window on which to place @property or null if none.
  */
  @property void requestor(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventSelection*)this._cPtr).requestor);
    dToC(propval, cast(void*)&(cast(GdkEventSelection*)this._cPtr).requestor);
  }
}
