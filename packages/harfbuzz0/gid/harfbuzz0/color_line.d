/// Module for [ColorLine] class
module gid.harfbuzz0.color_line;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    A struct containing color information for a gradient.
*/
@gidGir("color_line_t")
class ColorLine : gid.gobject2.boxed.BoxedWrap!(hb_gobject_color_line_get_type)
{
  /**
      Create a `color_line.ColorLine` boxed type.
      Params:
        getExtend = 
  */
  this(hb_color_line_get_extend_func_t getExtend = hb_color_line_get_extend_func_t.init) nothrow
  {
    super(boxedNew!hb_color_line_t(_getGType), Yes.Take);
    this.getExtend = getExtend;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorLine self() nothrow
  {
    return this;
  }

  /** */
  @property hb_color_line_get_extend_func_t getExtend() nothrow
  {
    return (cast(hb_color_line_t*)this._cPtr).getExtend;
  }

  /** */

  @property void getExtend(hb_color_line_get_extend_func_t propval) nothrow
  {
    (cast(hb_color_line_t*)this._cPtr).getExtend = propval;
  }
}
