/// Module for [GlyphPosition] class
module harfbuzz.glyph_position;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    The #hb_glyph_position_t is the structure that holds the positions of the
    glyph in both horizontal and vertical directions. All positions in
    #hb_glyph_position_t are relative to the current point.
*/
class GlyphPosition : gobject.boxed.Boxed
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
  this(harfbuzz.types.Position xAdvance = harfbuzz.types.Position.init, harfbuzz.types.Position yAdvance = harfbuzz.types.Position.init, harfbuzz.types.Position xOffset = harfbuzz.types.Position.init, harfbuzz.types.Position yOffset = harfbuzz.types.Position.init)
  {
    super(gMalloc(hb_glyph_position_t.sizeof), Yes.Take);
    this.xAdvance = xAdvance;
    this.yAdvance = yAdvance;
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_glyph_position_get_type != &gidSymbolNotFound ? hb_gobject_glyph_position_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GlyphPosition self()
  {
    return this;
  }

  /**
      Get `xAdvance` field.
      Returns: how much the line advances after drawing this glyph when setting
                    text in horizontal direction.
  */
  @property harfbuzz.types.Position xAdvance()
  {
    return (cast(hb_glyph_position_t*)this._cPtr).xAdvance;
  }

  /**
      Set `xAdvance` field.
      Params:
        propval = how much the line advances after drawing this glyph when setting
                      text in horizontal direction.
  */
  @property void xAdvance(harfbuzz.types.Position propval)
  {
    (cast(hb_glyph_position_t*)this._cPtr).xAdvance = propval;
  }

  /**
      Get `yAdvance` field.
      Returns: how much the line advances after drawing this glyph when setting
                    text in vertical direction.
  */
  @property harfbuzz.types.Position yAdvance()
  {
    return (cast(hb_glyph_position_t*)this._cPtr).yAdvance;
  }

  /**
      Set `yAdvance` field.
      Params:
        propval = how much the line advances after drawing this glyph when setting
                      text in vertical direction.
  */
  @property void yAdvance(harfbuzz.types.Position propval)
  {
    (cast(hb_glyph_position_t*)this._cPtr).yAdvance = propval;
  }

  /**
      Get `xOffset` field.
      Returns: how much the glyph moves on the X-axis before drawing it, this
                   should not affect how much the line advances.
  */
  @property harfbuzz.types.Position xOffset()
  {
    return (cast(hb_glyph_position_t*)this._cPtr).xOffset;
  }

  /**
      Set `xOffset` field.
      Params:
        propval = how much the glyph moves on the X-axis before drawing it, this
                     should not affect how much the line advances.
  */
  @property void xOffset(harfbuzz.types.Position propval)
  {
    (cast(hb_glyph_position_t*)this._cPtr).xOffset = propval;
  }

  /**
      Get `yOffset` field.
      Returns: how much the glyph moves on the Y-axis before drawing it, this
                   should not affect how much the line advances.
  */
  @property harfbuzz.types.Position yOffset()
  {
    return (cast(hb_glyph_position_t*)this._cPtr).yOffset;
  }

  /**
      Set `yOffset` field.
      Params:
        propval = how much the glyph moves on the Y-axis before drawing it, this
                     should not affect how much the line advances.
  */
  @property void yOffset(harfbuzz.types.Position propval)
  {
    (cast(hb_glyph_position_t*)this._cPtr).yOffset = propval;
  }
}
