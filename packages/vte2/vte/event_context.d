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
class EventContext : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())vte_event_context_get_type != &gidSymbolNotFound ? vte_event_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
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
