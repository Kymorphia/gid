/// Module for [Font] class
module gid.harfbuzz0.font;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Data type for holding fonts.
*/
class Font : gid.gobject2.boxed.BoxedWrap!(hb_gobject_font_get_type)
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
