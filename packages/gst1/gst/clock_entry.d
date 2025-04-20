/// Module for [ClockEntry] class
module gst.clock_entry;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    All pending timeouts or periodic notifies are converted into
    an entry.
    Note that GstClockEntry should be treated as an opaque structure. It must
    not be extended or allocated using a custom allocator.
*/
class ClockEntry
{
  GstClockEntry cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.clock_entry.ClockEntry");

    cInstance = *cast(GstClockEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `refcount` field.
      Returns: reference counter (read-only)
  */
  @property int refcount()
  {
    return (cast(GstClockEntry*)cPtr).refcount;
  }

  /**
      Set `refcount` field.
      Params:
        propval = reference counter (read-only)
  */
  @property void refcount(int propval)
  {
    (cast(GstClockEntry*)cPtr).refcount = propval;
  }
}
