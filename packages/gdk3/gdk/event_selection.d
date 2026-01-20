/// Module for [EventSelection] class
module gdk.event_selection;

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
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_selection.EventSelection");

    _cInstance = *cast(GdkEventSelection*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.SelectionClear],
          [gdk.types.EventType.SelectionNotify] or [gdk.types.EventType.SelectionRequest]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventSelection*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.SelectionClear],
            [gdk.types.EventType.SelectionNotify] or [gdk.types.EventType.SelectionRequest]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventSelection*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventSelection*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventSelection*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventSelection*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventSelection*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventSelection*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `selection` field.
      Returns: the selection.
  */
  @property gdk.atom.Atom selection()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventSelection*)this._cPtr).selection, No.Take);
  }

  /**
      Get `target` field.
      Returns: the target to which the selection should be converted.
  */
  @property gdk.atom.Atom target()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventSelection*)this._cPtr).target, No.Take);
  }

  /**
      Get `property` field.
      Returns: the property in which to place the result of the conversion.
  */
  @property gdk.atom.Atom property()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventSelection*)this._cPtr).property, No.Take);
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time()
  {
    return (cast(GdkEventSelection*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval)
  {
    (cast(GdkEventSelection*)this._cPtr).time = propval;
  }

  /**
      Get `requestor` field.
      Returns: the window on which to place @property or null if none.
  */
  @property gdk.window.Window requestor()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventSelection*)this._cPtr).requestor);
  }

  /**
      Set `requestor` field.
      Params:
        propval = the window on which to place @property or null if none.
  */
  @property void requestor(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventSelection*)this._cPtr).requestor);
    dToC(propval, cast(void*)&(cast(GdkEventSelection*)this._cPtr).requestor);
  }
}
