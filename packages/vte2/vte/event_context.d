/// Module for [EventContext] class
module vte.event_context;

public import gid.basictypes;
import gdk.event;
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
  gdk.event.Event getEvent() nothrow
  {
    GdkEvent* _cretval;
    _cretval = vte_event_context_get_event(cast(const(VteEventContext)*)this._cPtr);
    auto _retval = _cretval ? new gdk.event.Event(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
