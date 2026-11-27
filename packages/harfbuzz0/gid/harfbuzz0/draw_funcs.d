/// Module for [DrawFuncs] class
module gid.harfbuzz0.draw_funcs;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Glyph draw callbacks.
    
    #hb_draw_move_to_func_t, #hb_draw_line_to_func_t and
    #hb_draw_cubic_to_func_t calls are necessary to be defined but we translate
    #hb_draw_quadratic_to_func_t calls to #hb_draw_cubic_to_func_t if the
    callback isn't defined.
*/
@gidGir("draw_funcs_t")
class DrawFuncs : gid.gobject2.boxed.BoxedWrap!(hb_gobject_draw_funcs_get_type)
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
