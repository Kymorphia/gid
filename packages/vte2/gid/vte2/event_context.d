/// Module for [EventContext] class
module gid.vte2.event_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.event;
import gid.gobject2.boxed;
import gid.vte2.c.functions;
import gid.vte2.c.types;
import gid.vte2.types;

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
  gid.gdk3.event.Event getEvent() nothrow
  {
    GdkEvent* _cretval;
    _cretval = vte_event_context_get_event(cast(const(VteEventContext)*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk3.event.Event(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
