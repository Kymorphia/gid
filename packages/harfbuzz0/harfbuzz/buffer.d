/// Module for [Buffer] class
module harfbuzz.buffer;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    The main structure holding the input text and its properties before shaping,
    and output glyphs and their information after shaping.
*/
class Buffer : gobject.boxed.BoxedWrap!(hb_gobject_buffer_get_type)
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
