/// Module for [ColorLine] class
module harfbuzz.color_line;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    A struct containing color information for a gradient.
*/
class ColorLine : gobject.boxed.BoxedWrap!(hb_gobject_color_line_get_type)
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
