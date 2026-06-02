/// Module for [EventOwnerChange] class
module gdk.event_owner_change;

public import gid.basictypes;
import gdk.atom;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when the owner of a selection changes. On X11, this
    information is only available if the X server supports the XFIXES
    extension.
*/
class EventOwnerChange
{
  GdkEventOwnerChange _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkEventOwnerChange*)ptr;

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
      Returns: the type of the event ([gdk.types.EventType.OwnerChange]).
  */
  @property gdk.types.EventType type() nothrow
  {
    return cast(gdk.types.EventType)(cast(GdkEventOwnerChange*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gdk.types.EventType.OwnerChange]).
  */
  @property void type(gdk.types.EventType propval) nothrow
  {
    (cast(GdkEventOwnerChange*)this._cPtr).type = cast(GdkEventType)propval;
  }

  /**
      Get `window` field.
      Returns: the window which received the event
  */
  @property gdk.window.Window window() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventOwnerChange*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event
  */
  @property void window(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventOwnerChange*)this._cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventOwnerChange*)this._cPtr).window);
  }

  /**
      Get `sendEvent` field.
      Returns: true if the event was sent explicitly.
  */
  @property byte sendEvent() nothrow
  {
    return (cast(GdkEventOwnerChange*)this._cPtr).sendEvent;
  }

  /**
      Set `sendEvent` field.
      Params:
        propval = true if the event was sent explicitly.
  */
  @property void sendEvent(byte propval) nothrow
  {
    (cast(GdkEventOwnerChange*)this._cPtr).sendEvent = propval;
  }

  /**
      Get `owner` field.
      Returns: the new owner of the selection, or null if there is none
  */
  @property gdk.window.Window owner() nothrow
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventOwnerChange*)this._cPtr).owner);
  }

  /**
      Set `owner` field.
      Params:
        propval = the new owner of the selection, or null if there is none
  */
  @property void owner(gdk.window.Window propval) nothrow
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventOwnerChange*)this._cPtr).owner);
    dToC(propval, cast(void*)&(cast(GdkEventOwnerChange*)this._cPtr).owner);
  }

  /**
      Get `reason` field.
      Returns: the reason for the ownership change as a #GdkOwnerChange value
  */
  @property gdk.types.OwnerChange reason() nothrow
  {
    return cast(gdk.types.OwnerChange)(cast(GdkEventOwnerChange*)this._cPtr).reason;
  }

  /**
      Set `reason` field.
      Params:
        propval = the reason for the ownership change as a #GdkOwnerChange value
  */
  @property void reason(gdk.types.OwnerChange propval) nothrow
  {
    (cast(GdkEventOwnerChange*)this._cPtr).reason = cast(GdkOwnerChange)propval;
  }

  /**
      Get `selection` field.
      Returns: the atom identifying the selection
  */
  @property gdk.atom.Atom selection() nothrow
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventOwnerChange*)this._cPtr).selection, No.Take);
  }

  /**
      Get `time` field.
      Returns: the timestamp of the event
  */
  @property uint time() nothrow
  {
    return (cast(GdkEventOwnerChange*)this._cPtr).time;
  }

  /**
      Set `time` field.
      Params:
        propval = the timestamp of the event
  */
  @property void time(uint propval) nothrow
  {
    (cast(GdkEventOwnerChange*)this._cPtr).time = propval;
  }

  /**
      Get `selectionTime` field.
      Returns: the time at which the selection ownership was taken
          over
  */
  @property uint selectionTime() nothrow
  {
    return (cast(GdkEventOwnerChange*)this._cPtr).selectionTime;
  }

  /**
      Set `selectionTime` field.
      Params:
        propval = the time at which the selection ownership was taken
            over
  */
  @property void selectionTime(uint propval) nothrow
  {
    (cast(GdkEventOwnerChange*)this._cPtr).selectionTime = propval;
  }
}
