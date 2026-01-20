/// Module for [EventContext] class
module vte.event_context;

import gdk.event;
import gid.gid;
import vte.c.functions;
import vte.c.types;
import vte.types;

/**
    Provides context information for a context menu event.
*/
class EventContext
{
  VteEventContext* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for vte.event_context.EventContext");

    _cInstancePtr = cast(VteEventContext*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /** */
  gdk.event.Event getEvent()
  {
    GdkEvent* _cretval;
    _cretval = vte_event_context_get_event(cast(const(VteEventContext)*)this._cPtr);
    auto _retval = _cretval ? new gdk.event.Event(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
