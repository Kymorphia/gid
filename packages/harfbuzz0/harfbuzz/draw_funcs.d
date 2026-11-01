/// Module for [DrawFuncs] class
module harfbuzz.draw_funcs;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Glyph draw callbacks.
    
    #hb_draw_move_to_func_t, #hb_draw_line_to_func_t and
    #hb_draw_cubic_to_func_t calls are necessary to be defined but we translate
    #hb_draw_quadratic_to_func_t calls to #hb_draw_cubic_to_func_t if the
    callback isn't defined.
*/
class DrawFuncs : gobject.boxed.BoxedWrap!(hb_gobject_draw_funcs_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override DrawFuncs self() nothrow
  {
    return this;
  }
}
