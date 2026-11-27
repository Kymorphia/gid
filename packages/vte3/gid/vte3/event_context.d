/// Module for [EventContext] class
module gid.vte3.event_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.vte3.c.functions;
import gid.vte3.c.types;
import gid.vte3.types;

/**
    Provides context information for a context menu event.
*/
@gidGir("EventContext")
class EventContext : gid.gobject2.boxed.BoxedWrap!(vte_event_context_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override EventContext self() nothrow
  {
    return this;
  }

  /** */
  bool getCoordinates(out double x, out double y) nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_event_context_get_coordinates(cast(const(VteEventContext)*)this._cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }
}
