/// Module for [EventSequence] class
module gdk.event_sequence;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    An opaque type representing a sequence of related events.
*/
class EventSequence : gobject.boxed.BoxedWrap!(gdk_event_sequence_get_type)
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
