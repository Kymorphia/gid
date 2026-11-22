/// Module for [EventSequence] class
module gid.gdk4.event_sequence;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.gobject2.boxed;

/**
    An opaque type representing a sequence of related events.
*/
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
