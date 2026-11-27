/// Module for [Face] class
module gid.harfbuzz0.face;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Data type for holding font faces.
*/
@gidGir("face_t")
class Face : gid.gobject2.boxed.BoxedWrap!(hb_gobject_face_get_type)
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
