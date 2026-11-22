/// Module for [GlyphPosition] class
module gid.harfbuzz0.glyph_position;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    The #hb_glyph_position_t is the structure that holds the positions of the
    glyph in both horizontal and vertical directions. All positions in
    #hb_glyph_position_t are relative to the current point.
*/
class GlyphPosition : gid.gobject2.boxed.BoxedWrap!(hb_gobject_glyph_position_get_type)
{
  /**
      Create a `glyph_position.GlyphPosition` boxed type.
      Params:
        xAdvance = how much the line advances after drawing this glyph when setting
                      text in horizontal direction.
        yAdvance = how much the line advances after drawing this glyph when setting
                      text in vertical direction.
        xOffset = how much the glyph moves on the X-axis before drawing it, this
                     should not affect how much the line advances.
        yOffset = how much the glyph moves on the Y-axis before drawing it, this
                     should not affect how much the line advances.
  */
  this(gid.harfbuzz0.types.Position xAdvance = gid.harfbuzz0.types.Position.init, gid.harfbuzz0.types.Position yAdvance = gid.harfbuzz0.types.Position.init, gid.harfbuzz0.types.Position xOffset = gid.harfbuzz0.types.Position.init, gid.harfbuzz0.types.Position yOffset = gid.harfbuzz0.types.Position.init) nothrow
  {
    super(boxedNew!hb_glyph_position_t(_getGType), Yes.Take);
    this.xAdvance = xAdvance;
    this.yAdvance = yAdvance;
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override GlyphPosition self() nothrow
  {
    return this;
  }

  /**
      Get `xAdvance` field.
      Returns: how much the line advances after drawing this glyph when setting
                    text in horizontal direction.
  */
  @property gid.harfbuzz0.types.Position xAdvance() nothrow
  {
    return (cast(hb_glyph_position_t*)this._cPtr).xAdvance;
  }

  /**
      Set `xAdvance` field.
      Params:
        propval = how much the line advances after drawing this glyph when setting
                      text in horizontal direction.
  */
  @property void xAdvance(gid.harfbuzz0.types.Position propval) nothrow
  {
    (cast(hb_glyph_position_t*)this._cPtr).xAdvance = propval;
  }

  /**
      Get `yAdvance` field.
      Returns: how much the line advances after drawing this glyph when setting
                    text in vertical direction.
  */
  @property gid.harfbuzz0.types.Position yAdvance() nothrow
  {
    return (cast(hb_glyph_position_t*)this._cPtr).yAdvance;
  }

  /**
      Set `yAdvance` field.
      Params:
        propval = how much the line advances after drawing this glyph when setting
                      text in vertical direction.
  */
  @property void yAdvance(gid.harfbuzz0.types.Position propval) nothrow
  {
    (cast(hb_glyph_position_t*)this._cPtr).yAdvance = propval;
  }

  /**
      Get `xOffset` field.
      Returns: how much the glyph moves on the X-axis before drawing it, this
                   should not affect how much the line advances.
  */
  @property gid.harfbuzz0.types.Position xOffset() nothrow
  {
    return (cast(hb_glyph_position_t*)this._cPtr).xOffset;
  }

  /**
      Set `xOffset` field.
      Params:
        propval = how much the glyph moves on the X-axis before drawing it, this
                     should not affect how much the line advances.
  */
  @property void xOffset(gid.harfbuzz0.types.Position propval) nothrow
  {
    (cast(hb_glyph_position_t*)this._cPtr).xOffset = propval;
  }

  /**
      Get `yOffset` field.
      Returns: how much the glyph moves on the Y-axis before drawing it, this
                   should not affect how much the line advances.
  */
  @property gid.harfbuzz0.types.Position yOffset() nothrow
  {
    return (cast(hb_glyph_position_t*)this._cPtr).yOffset;
  }

  /**
      Set `yOffset` field.
      Params:
        propval = how much the glyph moves on the Y-axis before drawing it, this
                     should not affect how much the line advances.
  */
  @property void yOffset(gid.harfbuzz0.types.Position propval) nothrow
  {
    (cast(hb_glyph_position_t*)this._cPtr).yOffset = propval;
  }
}
