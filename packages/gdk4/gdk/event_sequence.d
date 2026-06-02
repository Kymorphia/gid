/// Module for [EventSequence] class
module gdk.event_sequence;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    [gdk.event_sequence.EventSequence] is an opaque type representing a sequence
    of related touch events.
*/
class EventSequence : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_event_sequence_get_type != &gidSymbolNotFound ? gdk_event_sequence_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EventSequence self() nothrow
  {
    return this;
  }
}
