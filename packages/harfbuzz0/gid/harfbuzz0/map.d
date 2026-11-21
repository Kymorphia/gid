/// Module for [Map] class
module gid.harfbuzz0.map;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Data type for holding integer-to-integer hash maps.
*/
class Map : gid.gobject2.boxed.BoxedWrap!(hb_gobject_map_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Map self() nothrow
  {
    return this;
  }
}
