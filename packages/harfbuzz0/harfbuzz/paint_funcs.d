/// Module for [PaintFuncs] class
module harfbuzz.paint_funcs;

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
class PaintFuncs : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_paint_funcs_get_type != &gidSymbolNotFound ? hb_gobject_paint_funcs_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PaintFuncs self()
  {
    return this;
  }
}
