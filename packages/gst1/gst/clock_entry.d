/// Module for [ClockEntry] class
module gst.clock_entry;

public import gid.basictypes;
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
  GstClockEntry _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstClockEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
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
