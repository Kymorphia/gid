/// Module for [EventContext] class
module vte.event_context;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstancePtr = cast(VteEventContext*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)_cInstancePtr;
  }

  /** */
  bool getCoordinates(out double x, out double y) nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_event_context_get_coordinates(cast(const(VteEventContext)*)this._cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }
}
