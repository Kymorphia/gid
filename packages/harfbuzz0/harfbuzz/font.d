/// Module for [Font] class
module harfbuzz.font;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for holding fonts.
*/
class Font : gobject.boxed.BoxedWrap!(hb_gobject_font_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Font self() nothrow
  {
    return this;
  }
}
