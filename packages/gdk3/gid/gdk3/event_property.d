/// Module for [EventProperty] class
module gid.gdk3.event_property;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.atom;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Describes a property change on a window.
*/
class EventProperty : StructWrap!(GdkEventProperty, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_property.EventProperty` wrap type.
      Params:
        type = the type of the event ([gid.gdk3.types.EventType.PropertyNotify]).
        window = the window which received the event.
        sendEvent = true if the event was sent explicitly.
        time = the time of the event in milliseconds.
        state = whether the property was changed
            ([gid.gdk3.types.PropertyState.NewValue]) or deleted ([gid.gdk3.types.PropertyState.Delete]).
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, uint time = uint.init, gid.gdk3.types.PropertyState state = gid.gdk3.types.PropertyState.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.time = time;
    this.state = state;
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
      Returns: the type of the event ([gid.gdk3.types.EventType.PropertyNotify]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventProperty*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk3.types.EventType.PropertyNotify]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventProperty*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventProperty*)this._cPtr).window);
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
    (cast(GdkEventProperty*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventProperty*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventProperty*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `atom` field.
      Returns: the property that was changed.
  */
  @property gid.gdk3.atom.Atom atom() nothrow
  {
    return new gid.gdk3.atom.Atom(cast(GdkAtom)(cast(GdkEventProperty*)this._cPtr).atom, No.Take);
  }

  /**
      Get `time` field.
      Returns: the time of the event in milliseconds.
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventProperty*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the time of the event in milliseconds.
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventProperty*)this._cPtr).time = propval;
  }

  /**
      Get `state` field.
      Returns: whether the property was changed
          ([gid.gdk3.types.PropertyState.NewValue]) or deleted ([gid.gdk3.types.PropertyState.Delete]).
  */
  @property gid.gdk3.types.PropertyState state() nothrow
  {
    return cast(gid.gdk3.types.PropertyState)(cast(GdkEventProperty*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = whether the property was changed
            ([gid.gdk3.types.PropertyState.NewValue]) or deleted ([gid.gdk3.types.PropertyState.Delete]).
  */
  @property void state(gid.gdk3.types.PropertyState propval) nothrow
  {
    (cast(GdkEventProperty*)this._cPtr).state = cast(GdkPropertyState)propval;
  }
}
