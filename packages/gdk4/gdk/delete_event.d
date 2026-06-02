/// Module for [DeleteEvent] class
module gdk.delete_event;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to closing a top-level surface.
*/
class DeleteEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GdkEvent*)ptr, take);
  }
}
