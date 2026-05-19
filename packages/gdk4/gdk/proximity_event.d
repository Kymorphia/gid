/// Module for [ProximityEvent] class
module gdk.proximity_event;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to the proximity of a tool to a device.
*/
class ProximityEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.proximity_event.ProximityEvent");

    super(cast(GdkEvent*)ptr, take);
  }
}
