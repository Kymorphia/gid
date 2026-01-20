/// Module for [EventProperty] class
module gdk.event_property;

import gdk.atom;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Describes a property change on a window.
*/
class EventProperty
{
  GdkEventProperty _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event_property.EventProperty");

    _cInstance = *cast(GdkEventProperty*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.PropertyNotify]).
  */
  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventProperty*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.PropertyNotify]).
  */
  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventProperty*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventProperty*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event.
  */
  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventProperty*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventProperty*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent()
  {
    return (cast(GdkEventProperty*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval)
  {
    (cast(GdkEventProperty*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `atom` field.
      Returns: the property that was changed.
  */
  @property gdk.atom.Atom atom()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventProperty*)this._cPtr).atom, No.Take);
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time()
  {
    return (cast(GdkEventProperty*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval)
  {
    (cast(GdkEventProperty*)this._cPtr).time = propval;
  }

  /**
      Get `state` field.
      Returns: whether the property was changed
          ([gdk.types.PropertyState.NewValue]) or deleted ([gdk.types.PropertyState.Delete]).
  */
  @property gdk.types.PropertyState state()
  {
    return cast(gdk.types.PropertyState)(cast(GdkEventProperty*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = whether the property was changed
            ([gdk.types.PropertyState.NewValue]) or deleted ([gdk.types.PropertyState.Delete]).
  */
  @property void state(gdk.types.PropertyState propval)
  {
    (cast(GdkEventProperty*)this._cPtr).state = cast(GdkPropertyState)propval;
  }
}
