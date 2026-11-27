/// Module for [Buffer] class
module gid.harfbuzz0.buffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    The main structure holding the input text and its properties before shaping,
    and output glyphs and their information after shaping.
*/
@gidGir("buffer_t")
class Buffer : gid.gobject2.boxed.BoxedWrap!(hb_gobject_buffer_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Buffer self() nothrow
  {
    return this;
  }
}
