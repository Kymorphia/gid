/// Module for [Set] class
module gid.harfbuzz0.set;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Data type for holding a set of integers. #hb_set_t's are
    used to gather and contain glyph IDs, Unicode code
    points, and various other collections of discrete
    values.
*/
@gidGir("set_t")
class Set : gid.gobject2.boxed.BoxedWrap!(hb_gobject_set_get_type)
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
