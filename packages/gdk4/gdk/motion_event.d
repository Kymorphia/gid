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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_motion_event_get_type != &gidSymbolNotFound ? gdk_motion_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }
}
