/// Module for [EventSequence] class
module gid.gdk3.event_sequence;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.gobject2.boxed;

/** */
@gidGir("EventSequence")
class EventSequence : gid.gobject2.boxed.BoxedWrap!(gdk_event_sequence_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override EventSequence self() nothrow
  {
    return this;
  }
}
