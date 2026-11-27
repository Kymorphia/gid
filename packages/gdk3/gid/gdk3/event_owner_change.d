/// Module for [EventOwnerChange] class
module gid.gdk3.event_owner_change;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.atom;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.gdk3.window;

/**
    Generated when the owner of a selection changes. On X11, this
    information is only available if the X server supports the XFIXES
    extension.
*/
@gidGir("EventOwnerChange")
class EventOwnerChange : StructWrap!(GdkEventOwnerChange, gdk_event_copy, gdk_event_free)
{
  /**
      Create a `event_owner_change.EventOwnerChange` wrap type.
      Params:
        type = the type of the event ([gid.gdk3.types.EventType.OwnerChange]).
        window = the window which received the event
        sendEvent = true if the event was sent explicitly.
        owner = the new owner of the selection, or null if there is none
        reason = the reason for the ownership change as a #GdkOwnerChange value
        time = the timestamp of the event
        selectionTime = the time at which the selection ownership was taken
            over
  */
  this(gid.gdk3.types.EventType type = gid.gdk3.types.EventType.init, gid.gdk3.window.Window window = gid.gdk3.window.Window.init, byte sendEvent = byte.init, gid.gdk3.window.Window owner = gid.gdk3.window.Window.init, gid.gdk3.types.OwnerChange reason = gid.gdk3.types.OwnerChange.init, uint time = uint.init, uint selectionTime = uint.init) nothrow
  {
    this.type = type;
    this.window = window;
    this.sendEvent = sendEvent;
    this.owner = owner;
    this.reason = reason;
    this.time = time;
    this.selectionTime = selectionTime;
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
      Returns: the type of the event ([gid.gdk3.types.EventType.OwnerChange]).
  */
  @property gid.gdk3.types.EventType type() nothrow
  {
    return cast(gid.gdk3.types.EventType)(cast(GdkEventOwnerChange*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the type of the event ([gid.gdk3.types.EventType.OwnerChange]).
  */
  @property void type(gid.gdk3.types.EventType propval) nothrow
  {
    (cast(GdkEventOwnerChange*)this._cPtr).type = cast(GdkEventType)propval;
  }

  private gid.gdk3.window.Window _windowRef; // Keeps borrowed field value alive

  /**
      Get `window` field.
      Returns: the window which received the event
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventOwnerChange*)this._cPtr).window);
  }

  /**
      Set `window` field.
      Params:
        propval = the window which received the event
  */
  @property void window(gid.gdk3.window.Window propval) nothrow
  {
    if (_refuseBorrowedStore("window"))
      return;

    _windowRef = propval;
    (cast(GdkEventOwnerChange*)this._cPtr).window = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
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

  private gid.gdk3.window.Window _ownerRef; // Keeps borrowed field value alive

  /**
      Get `owner` field.
      Returns: the new owner of the selection, or null if there is none
  */
  @property gid.gdk3.window.Window owner() nothrow
  {
    return cToD!(gid.gdk3.window.Window)(cast(void*)(cast(GdkEventOwnerChange*)this._cPtr).owner);
  }

  /**
      Set `owner` field.
      Params:
        propval = the new owner of the selection, or null if there is none
  */
  @property void owner(gid.gdk3.window.Window propval) nothrow
  {
    if (_refuseBorrowedStore("owner"))
      return;

    _ownerRef = propval;
    (cast(GdkEventOwnerChange*)this._cPtr).owner = propval ? cast(GdkWindow*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `reason` field.
      Returns: the reason for the ownership change as a #GdkOwnerChange value
  */
  @property gid.gdk3.types.OwnerChange reason() nothrow
  {
    return cast(gid.gdk3.types.OwnerChange)(cast(GdkEventOwnerChange*)this._cPtr).reason;
  }

  /**
      Set `reason` field.
      Params:
        propval = the reason for the ownership change as a #GdkOwnerChange value
  */
  @property void reason(gid.gdk3.types.OwnerChange propval) nothrow
  {
    (cast(GdkEventOwnerChange*)this._cPtr).reason = cast(GdkOwnerChange)propval;
  }

  /**
      Get `selection` field.
      Returns: the atom identifying the selection
  */
  @property gid.gdk3.atom.Atom selection() nothrow
  {
    return new gid.gdk3.atom.Atom(cast(GdkAtom)(cast(GdkEventOwnerChange*)this._cPtr).selection, No.Take);
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
