/// Module for [MotionEvent] class
module gdk.motion_event;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to a pointer or touch device motion.
*/
class MotionEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.motion_event.MotionEvent");

    super(cast(GdkEvent*)ptr, take);
  }
}
