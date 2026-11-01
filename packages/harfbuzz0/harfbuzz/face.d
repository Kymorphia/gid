/// Module for [Face] class
module harfbuzz.face;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for holding font faces.
*/
class Face : gobject.boxed.BoxedWrap!(hb_gobject_face_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Face self() nothrow
  {
    return this;
  }
}
