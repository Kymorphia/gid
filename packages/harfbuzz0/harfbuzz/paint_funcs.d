/// Module for [PaintFuncs] class
module harfbuzz.paint_funcs;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Glyph paint callbacks.
    
    The callbacks assume that the caller maintains a stack
    of current transforms, clips and intermediate surfaces,
    as evidenced by the pairs of push/pop callbacks. The
    push/pop calls will be properly nested, so it is fine
    to store the different kinds of object on a single stack.
    
    Not all callbacks are required for all kinds of glyphs.
    For rendering COLRv0 or non-color outline glyphs, the
    gradient callbacks are not needed, and the composite
    callback only needs to handle simple alpha compositing
    (#HB_PAINT_COMPOSITE_MODE_SRC_OVER).
    
    The paint-image callback is only needed for glyphs
    with image blobs in the CBDT, sbix or SVG tables.
    
    The custom-palette-color callback is only necessary if
    you want to override colors from the font palette with
    custom colors.
*/
class PaintFuncs : gobject.boxed.BoxedWrap!(hb_gobject_paint_funcs_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override PaintFuncs self() nothrow
  {
    return this;
  }
}
