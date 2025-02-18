module Vte.EventContext;

import Gid.gid;
import Vte.Types;
import Vte.c.functions;
import Vte.c.types;

/**
 * Provides context information for a context menu event.
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

  bool getCoordinates(out double x, out double y)
  {
    bool _retval;
    _retval = vte_event_context_get_coordinates(cast(VteEventContext*)cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }
}
