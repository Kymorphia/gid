/// Module for [Set] class
module harfbuzz.set;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for holding a set of integers. #hb_set_t's are
    used to gather and contain glyph IDs, Unicode code
    points, and various other collections of discrete
    values.
*/
class Set : gobject.boxed.BoxedWrap!(hb_gobject_set_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Set self() nothrow
  {
    return this;
  }
}
