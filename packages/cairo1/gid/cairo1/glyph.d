/// Module for [Glyph] struct
module gid.cairo1.glyph;

public import gid.core.basictypes;
import gid.cairo1.c.functions;
import gid.cairo1.c.types;
import gid.cairo1.types;
import gid.core.gid;

/**
    The #cairo_glyph_t structure holds information about a single glyph
    when drawing or measuring text. A font is (in simple terms) a
    collection of shapes used to draw text. A glyph is one of these
    shapes. There can be multiple glyphs for a single character
    (alternates to be used in different contexts, for example), or a
    glyph can be a <firstterm>ligature</firstterm> of multiple
    characters. Cairo doesn't expose any way of converting input text
    into glyphs, so in order to use the Cairo interfaces that take
    arrays of glyphs, you must directly access the appropriate
    underlying font system.
    
    Note that the offsets given by @x and @y are not cumulative. When
    drawing or measuring text, each glyph is individually positioned
    with respect to the overall origin
*/
struct Glyph
{
  /**
      glyph index in the font. The exact interpretation of the
           glyph index depends on the font technology being used.
  */
  gulong index;

  /**
      the offset in the X direction between the origin used for
          drawing or measuring the string and the origin of this glyph.
  */
  double x;

  /**
      the offset in the Y direction between the origin used for
          drawing or measuring the string and the origin of this glyph.
  */
  double y;

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_glyph_get_type != &gidSymbolNotFound ? cairo_gobject_glyph_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  static void* _cDup(void* ptr) nothrow
  {
    return boxedCopy(_getGType, ptr);
  }

  /** */
  static void _cFree(void* ptr) nothrow
  {
    boxedFree(_getGType, ptr);
  }
}
