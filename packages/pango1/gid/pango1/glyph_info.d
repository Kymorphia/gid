/// Module for [GlyphInfo] class
module gid.pango1.glyph_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.types;

/**
    A [gid.pango1.glyph_info.GlyphInfo] structure represents a single glyph with
    positioning information and visual attributes.
*/
@gidGir("GlyphInfo")
class GlyphInfo : StructWrap!(PangoGlyphInfo)
{
  /**
      Create a `glyph_info.GlyphInfo` wrap type.
      Params:
        glyph = the glyph itself.
        geometry = the positional information about the glyph.
        attr = the visual attributes of the glyph.
  */
  this(gid.pango1.types.Glyph glyph = gid.pango1.types.Glyph.init, gid.pango1.types.GlyphGeometry geometry = gid.pango1.types.GlyphGeometry.init, gid.pango1.types.GlyphVisAttr attr = gid.pango1.types.GlyphVisAttr.init) nothrow
  {
    this.glyph = glyph;
    this.geometry = geometry;
    this.attr = attr;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `glyph` field.
      Returns: the glyph itself.
  */
  @property gid.pango1.types.Glyph glyph() nothrow
  {
    return (cast(PangoGlyphInfo*)this._cPtr).glyph;
  }

  /**
      Set `glyph` field.
      Params:
        propval = the glyph itself.
  */
  @property void glyph(gid.pango1.types.Glyph propval) nothrow
  {
    (cast(PangoGlyphInfo*)this._cPtr).glyph = propval;
  }

  /**
      Get `geometry` field.
      Returns: the positional information about the glyph.
  */
  @property gid.pango1.types.GlyphGeometry geometry() nothrow
  {
    return cToD!(gid.pango1.types.GlyphGeometry)(cast(void*)&(cast(PangoGlyphInfo*)this._cPtr).geometry);
  }

  /**
      Set `geometry` field.
      Params:
        propval = the positional information about the glyph.
  */
  @property void geometry(gid.pango1.types.GlyphGeometry propval) nothrow
  {
    (cast(PangoGlyphInfo*)this._cPtr).geometry = cast(PangoGlyphGeometry)propval;
  }

  /**
      Get `attr` field.
      Returns: the visual attributes of the glyph.
  */
  @property gid.pango1.types.GlyphVisAttr attr() nothrow
  {
    return cToD!(gid.pango1.types.GlyphVisAttr)(cast(void*)&(cast(PangoGlyphInfo*)this._cPtr).attr);
  }

  /**
      Set `attr` field.
      Params:
        propval = the visual attributes of the glyph.
  */
  @property void attr(gid.pango1.types.GlyphVisAttr propval) nothrow
  {
    (cast(PangoGlyphInfo*)this._cPtr).attr = cast(PangoGlyphVisAttr)propval;
  }
}
