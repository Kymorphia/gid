/// Module for [Map] class
module harfbuzz.map;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for holding integer-to-integer hash maps.
*/
class Map : gobject.boxed.BoxedWrap!(hb_gobject_map_get_type)
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
