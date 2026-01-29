/// Module for [EventSequence] class
module gdk.event_sequence;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/** */
class EventSequence : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_event_sequence_get_type != &gidSymbolNotFound ? gdk_event_sequence_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EventSequence self()
  {
    return this;
  }
}
