module vte.event_context;

import gid.gid;
import vte.c.functions;
import vte.c.types;
import vte.types;

/**
    Provides context information for a context menu event.
*/
class EventContext
{
  VteEventContext* cInstancePtr;
  bool owned;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Vte.EventContext");

    cInstancePtr = cast(VteEventContext*)ptr;

    owned = take;
  }

  void* cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /** */
  bool getCoordinates(out double x, out double y)
  {
    bool _retval;
    _retval = vte_event_context_get_coordinates(cast(const(VteEventContext)*)cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }
}
