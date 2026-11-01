/// Module for [EventContext] class
module vte.event_context;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import vte.c.functions;
import vte.c.types;
import vte.types;

/**
    Provides context information for a context menu event.
*/
class EventContext : gobject.boxed.BoxedWrap!(vte_event_context_get_type)
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
