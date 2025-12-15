/// Module for [FocusEvent] class
module gdk.focus_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to a keyboard focus change.
*/
class FocusEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.focus_event.FocusEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
      Extracts whether this event is about focus entering or
      leaving the surface.
      Returns: true of the focus is entering
  */
  bool getIn()
  {
    bool _retval;
    _retval = cast(bool)gdk_focus_event_get_in(cast(GdkEvent*)this._cPtr);
    return _retval;
  }
}
