/// Module for [GlyphString] class
module pango.glyph_string;

import gid.gid;
import gobject.boxed;
import pango.analysis;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.types;

/**
    A [pango.glyph_string.GlyphString] is used to store strings of glyphs with geometry
    and visual attribute information.
    
    The storage for the glyph information is owned by the structure
    which simplifies memory management.
*/
class GlyphString : gobject.boxed.Boxed
{

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
    return cast(void function())pango_glyph_string_get_type != &gidSymbolNotFound ? pango_glyph_string_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GlyphString self()
  {
    return this;
  }

  /**
      Get `numGlyphs` field.
      Returns: number of glyphs in this glyph string
  */
  @property int numGlyphs()
  {
    return (cast(PangoGlyphString*)this._cPtr).numGlyphs;
  }

  /**
      Set `numGlyphs` field.
      Params:
        propval = number of glyphs in this glyph string
  */
  @property void numGlyphs(int propval)
  {
    (cast(PangoGlyphString*)this._cPtr).numGlyphs = propval;
  }

  /**
      Create a new [pango.glyph_string.GlyphString].
      Returns: the newly allocated [pango.glyph_string.GlyphString], which
          should be freed with [pango.glyph_string.GlyphString.free].
  */
  this()
  {
    PangoGlyphString* _cretval;
    _cretval = pango_glyph_string_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copy a glyph string and associated storage.
      Returns: the newly allocated [pango.glyph_string.GlyphString]
  */
  pango.glyph_string.GlyphString copy()
  {
    PangoGlyphString* _cretval;
    _cretval = pango_glyph_string_copy(cast(PangoGlyphString*)this._cPtr);
    auto _retval = _cretval ? new pango.glyph_string.GlyphString(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compute the logical and ink extents of a glyph string.
      
      See the documentation for [pango.font.Font.getGlyphExtents] for details
      about the interpretation of the rectangles.
      
      Examples of logical (red) and ink (green) rects:
      
      ![](rects1.png) ![](rects2.png)
  
      Params:
        font = a [pango.font.Font]
        inkRect = rectangle used to store the extents of the glyph string as drawn
        logicalRect = rectangle used to store the logical extents of the glyph string
  */
  void extents(pango.font.Font font, out pango.types.Rectangle inkRect, out pango.types.Rectangle logicalRect)
  {
    pango_glyph_string_extents(cast(PangoGlyphString*)this._cPtr, font ? cast(PangoFont*)font._cPtr(No.Dup) : null, &inkRect, &logicalRect);
  }

  /**
      Computes the extents of a sub-portion of a glyph string.
      
      The extents are relative to the start of the glyph string range
      (the origin of their coordinate system is at the start of the range,
      not at the start of the entire glyph string).
  
      Params:
        start = start index
        end = end index (the range is the set of bytes with
            indices such that start <= index < end)
        font = a [pango.font.Font]
        inkRect = rectangle used to
            store the extents of the glyph string range as drawn
        logicalRect = rectangle used to
            store the logical extents of the glyph string range
  */
  void extentsRange(int start, int end, pango.font.Font font, out pango.types.Rectangle inkRect, out pango.types.Rectangle logicalRect)
  {
    pango_glyph_string_extents_range(cast(PangoGlyphString*)this._cPtr, start, end, font ? cast(PangoFont*)font._cPtr(No.Dup) : null, &inkRect, &logicalRect);
  }

  /**
      Computes the logical width of the glyph string.
      
      This can also be computed using [pango.glyph_string.GlyphString.extents].
      However, since this only computes the width, it's much faster. This
      is in fact only a convenience function that computes the sum of
      geometry.width for each glyph in the glyphs.
      Returns: the logical width of the glyph string.
  */
  int getWidth()
  {
    int _retval;
    _retval = pango_glyph_string_get_width(cast(PangoGlyphString*)this._cPtr);
    return _retval;
  }

  /**
      Converts from character position to x position.
      
      The X position is measured from the left edge of the run.
      Character positions are obtained using font metrics for ligatures
      where available, and computed by dividing up each cluster
      into equal portions, otherwise.
      
      <picture>
        <source srcset="glyphstring-positions-dark.png" media="(prefers-color-scheme: dark)">
        <img alt="Glyph positions" src="glyphstring-positions-light.png">
      </picture>
  
      Params:
        text = the text for the run
        analysis = the analysis information return from `funcitemize`
        index = the byte index within text
        trailing = whether we should compute the result for the beginning (false)
            or end (true) of the character.
        xPos = location to store result
  */
  void indexToX(string text, pango.analysis.Analysis analysis, int index, bool trailing, out int xPos)
  {
    int _length;
    if (text)
      _length = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    pango_glyph_string_index_to_x(cast(PangoGlyphString*)this._cPtr, _text, _length, analysis ? cast(PangoAnalysis*)analysis._cPtr : null, index, trailing, cast(int*)&xPos);
  }

  /**
      Converts from character position to x position.
      
      This variant of [pango.glyph_string.GlyphString.indexToX] additionally
      accepts a [pango.types.LogAttr] array. The grapheme boundary information
      in it can be used to disambiguate positioning inside some complex
      clusters.
  
      Params:
        text = the text for the run
        analysis = the analysis information return from `funcitemize`
        attrs = [pango.types.LogAttr] array for text
        index = the byte index within text
        trailing = whether we should compute the result for the beginning (false)
            or end (true) of the character.
        xPos = location to store result
  */
  void indexToXFull(string text, pango.analysis.Analysis analysis, pango.types.LogAttr attrs, int index, bool trailing, out int xPos)
  {
    int _length;
    if (text)
      _length = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    pango_glyph_string_index_to_x_full(cast(PangoGlyphString*)this._cPtr, _text, _length, analysis ? cast(PangoAnalysis*)analysis._cPtr : null, &attrs, index, trailing, cast(int*)&xPos);
  }

  /**
      Resize a glyph string to the given length.
  
      Params:
        newLen = the new length of the string
  */
  void setSize(int newLen)
  {
    pango_glyph_string_set_size(cast(PangoGlyphString*)this._cPtr, newLen);
  }

  /**
      Convert from x offset to character position.
      
      Character positions are computed by dividing up each cluster into
      equal portions. In scripts where positioning within a cluster is
      not allowed (such as Thai), the returned value may not be a valid
      cursor position; the caller must combine the result with the logical
      attributes for the text to compute the valid cursor position.
  
      Params:
        text = the text for the run
        analysis = the analysis information return from `funcitemize`
        xPos = the x offset (in Pango units)
        index = location to store calculated byte index within text
        trailing = location to store a boolean indicating whether the
            user clicked on the leading or trailing edge of the character
  */
  void xToIndex(string text, pango.analysis.Analysis analysis, int xPos, out int index, out int trailing)
  {
    int _length;
    if (text)
      _length = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    pango_glyph_string_x_to_index(cast(PangoGlyphString*)this._cPtr, _text, _length, analysis ? cast(PangoAnalysis*)analysis._cPtr : null, xPos, cast(int*)&index, cast(int*)&trailing);
  }
}
