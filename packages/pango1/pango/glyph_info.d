/// Module for [GlyphInfo] class
module pango.glyph_info;

public import gid.basictypes;
import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    A [pango.glyph_info.GlyphInfo] structure represents a single glyph with
    positioning information and visual attributes.
*/
class GlyphInfo
{
  PangoGlyphInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(PangoGlyphInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `glyph` field.
      Returns: the glyph itself.
  */
  @property pango.types.Glyph glyph() nothrow
  {
    return (cast(PangoGlyphInfo*)this._cPtr).glyph;
  }

  /**
      Set `glyph` field.
      Params:
        propval = the glyph itself.
  */
  @property void glyph(pango.types.Glyph propval) nothrow
  {
    (cast(PangoGlyphInfo*)this._cPtr).glyph = propval;
  }

  /**
      Get `geometry` field.
      Returns: the positional information about the glyph.
  */
  @property pango.types.GlyphGeometry geometry() nothrow
  {
    return cToD!(pango.types.GlyphGeometry)(cast(void*)&(cast(PangoGlyphInfo*)this._cPtr).geometry);
  }

  /**
      Set `geometry` field.
      Params:
        propval = the positional information about the glyph.
  */
  @property void geometry(pango.types.GlyphGeometry propval) nothrow
  {
    (cast(PangoGlyphInfo*)this._cPtr).geometry = cast(PangoGlyphGeometry)propval;
  }

  /**
      Get `attr` field.
      Returns: the visual attributes of the glyph.
  */
  @property pango.types.GlyphVisAttr attr() nothrow
  {
    return cToD!(pango.types.GlyphVisAttr)(cast(void*)&(cast(PangoGlyphInfo*)this._cPtr).attr);
  }

  /**
      Set `attr` field.
      Params:
        propval = the visual attributes of the glyph.
  */
  @property void attr(pango.types.GlyphVisAttr propval) nothrow
  {
    (cast(PangoGlyphInfo*)this._cPtr).attr = cast(PangoGlyphVisAttr)propval;
  }
}
