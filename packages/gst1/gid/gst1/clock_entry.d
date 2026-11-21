/// Module for [ClockEntry] class
module gid.gst1.clock_entry;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/**
    All pending timeouts or periodic notifies are converted into
    an entry.
    Note that GstClockEntry should be treated as an opaque structure. It must
    not be extended or allocated using a custom allocator.
*/
class ClockEntry : StructWrap!(GstClockEntry)
{
  /**
      Create a `clock_entry.ClockEntry` wrap type.
      Params:
        refcount = reference counter (read-only)
  */
  this(int refcount = int.init) nothrow
  {
    this.refcount = refcount;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `refcount` field.
      Returns: reference counter (read-only)
  */
  @property int refcount() nothrow
  {
    return (cast(GstClockEntry*)this._cPtr).refcount;
  }

  /**
      Set `refcount` field.
      Params:
        propval = reference counter (read-only)
  */
  @property void refcount(int propval) nothrow
  {
    (cast(GstClockEntry*)this._cPtr).refcount = propval;
  }
}
