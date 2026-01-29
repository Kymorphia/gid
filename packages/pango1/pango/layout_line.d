/// Module for [LayoutLine] class
module pango.layout_line;

import gid.gid;
import gobject.boxed;
import pango.c.functions;
import pango.c.types;
import pango.layout;
import pango.types;

/**
    A [pango.layout_line.LayoutLine] represents one of the lines resulting from laying
    out a paragraph via [pango.layout.Layout].
    
    [pango.layout_line.LayoutLine] structures are obtained by calling
    [pango.layout.Layout.getLine] and are only valid until the text,
    attributes, or settings of the parent [pango.layout.Layout] are modified.
*/
class LayoutLine : gobject.boxed.Boxed
{

  /**
      Create a `layout_line.LayoutLine` boxed type.
      Params:
        layout = the layout this line belongs to, might be null
        startIndex = start of line as byte index into layout->text
        length = length of line in bytes
        isParagraphStart = #TRUE if this is the first line of the paragraph
        resolvedDir = #Resolved PangoDirection of line
  */
  this(pango.layout.Layout layout = pango.layout.Layout.init, int startIndex = int.init, int length = int.init, uint isParagraphStart = uint.init, uint resolvedDir = uint.init)
  {
    super(gMalloc(PangoLayoutLine.sizeof), Yes.Take);
    this.layout = layout;
    this.startIndex = startIndex;
    this.length = length;
    this.isParagraphStart = isParagraphStart;
    this.resolvedDir = resolvedDir;
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
    return cast(void function())pango_layout_line_get_type != &gidSymbolNotFound ? pango_layout_line_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LayoutLine self()
  {
    return this;
  }

  /**
      Get `layout` field.
      Returns: the layout this line belongs to, might be null
  */
  @property pango.layout.Layout layout()
  {
    return cToD!(pango.layout.Layout)(cast(void*)(cast(PangoLayoutLine*)this._cPtr).layout);
  }

  /**
      Set `layout` field.
      Params:
        propval = the layout this line belongs to, might be null
  */
  @property void layout(pango.layout.Layout propval)
  {
    cValueFree!(pango.layout.Layout)(cast(void*)(cast(PangoLayoutLine*)this._cPtr).layout);
    dToC(propval, cast(void*)&(cast(PangoLayoutLine*)this._cPtr).layout);
  }

  /**
      Get `startIndex` field.
      Returns: start of line as byte index into layout->text
  */
  @property int startIndex()
  {
    return (cast(PangoLayoutLine*)this._cPtr).startIndex;
  }

  /**
      Set `startIndex` field.
      Params:
        propval = start of line as byte index into layout->text
  */
  @property void startIndex(int propval)
  {
    (cast(PangoLayoutLine*)this._cPtr).startIndex = propval;
  }

  /**
      Get `length` field.
      Returns: length of line in bytes
  */
  @property int length()
  {
    return (cast(PangoLayoutLine*)this._cPtr).length;
  }

  /**
      Set `length` field.
      Params:
        propval = length of line in bytes
  */
  @property void length(int propval)
  {
    (cast(PangoLayoutLine*)this._cPtr).length = propval;
  }

  /**
      Get `isParagraphStart` field.
      Returns: #TRUE if this is the first line of the paragraph
  */
  @property uint isParagraphStart()
  {
    return (cast(PangoLayoutLine*)this._cPtr).isParagraphStart;
  }

  /**
      Set `isParagraphStart` field.
      Params:
        propval = #TRUE if this is the first line of the paragraph
  */
  @property void isParagraphStart(uint propval)
  {
    (cast(PangoLayoutLine*)this._cPtr).isParagraphStart = propval;
  }

  /**
      Get `resolvedDir` field.
      Returns: #Resolved PangoDirection of line
  */
  @property uint resolvedDir()
  {
    return (cast(PangoLayoutLine*)this._cPtr).resolvedDir;
  }

  /**
      Set `resolvedDir` field.
      Params:
        propval = #Resolved PangoDirection of line
  */
  @property void resolvedDir(uint propval)
  {
    (cast(PangoLayoutLine*)this._cPtr).resolvedDir = propval;
  }

  /**
      Computes the logical and ink extents of a layout line.
      
      See [pango.font.Font.getGlyphExtents] for details
      about the interpretation of the rectangles.
  
      Params:
        inkRect = rectangle used to store the extents of
            the glyph string as drawn
        logicalRect = rectangle used to store the logical
            extents of the glyph string
  */
  void getExtents(out pango.types.Rectangle inkRect, out pango.types.Rectangle logicalRect)
  {
    pango_layout_line_get_extents(cast(PangoLayoutLine*)this._cPtr, &inkRect, &logicalRect);
  }

  /**
      Computes the height of the line, as the maximum of the heights
      of fonts used in this line.
      
      Note that the actual baseline-to-baseline distance between lines
      of text is influenced by other factors, such as
      [pango.layout.Layout.setSpacing] and
      [pango.layout.Layout.setLineSpacing].
  
      Params:
        height = return location for the line height
  */
  void getHeight(out int height)
  {
    pango_layout_line_get_height(cast(PangoLayoutLine*)this._cPtr, cast(int*)&height);
  }

  /**
      Returns the length of the line, in bytes.
      Returns: the length of the line
  */
  int getLength()
  {
    int _retval;
    _retval = pango_layout_line_get_length(cast(PangoLayoutLine*)this._cPtr);
    return _retval;
  }

  /**
      Computes the logical and ink extents of layout_line in device units.
      
      This function just calls [pango.layout_line.LayoutLine.getExtents] followed by
      two `funcextents_to_pixels` calls, rounding ink_rect and logical_rect
      such that the rounded rectangles fully contain the unrounded one (that is,
      passes them as first argument to `funcextents_to_pixels`).
  
      Params:
        inkRect = rectangle used to store the extents of
            the glyph string as drawn
        logicalRect = rectangle used to store the logical
            extents of the glyph string
  */
  void getPixelExtents(out pango.types.Rectangle inkRect, out pango.types.Rectangle logicalRect)
  {
    pango_layout_line_get_pixel_extents(cast(PangoLayoutLine*)this._cPtr, &inkRect, &logicalRect);
  }

  /**
      Returns the resolved direction of the line.
      Returns: the resolved direction of the line
  */
  pango.types.Direction getResolvedDirection()
  {
    PangoDirection _cretval;
    _cretval = pango_layout_line_get_resolved_direction(cast(PangoLayoutLine*)this._cPtr);
    pango.types.Direction _retval = cast(pango.types.Direction)_cretval;
    return _retval;
  }

  /**
      Returns the start index of the line, as byte index
      into the text of the layout.
      Returns: the start index of the line
  */
  int getStartIndex()
  {
    int _retval;
    _retval = pango_layout_line_get_start_index(cast(PangoLayoutLine*)this._cPtr);
    return _retval;
  }

  /**
      Gets a list of visual ranges corresponding to a given logical range.
      
      This list is not necessarily minimal - there may be consecutive
      ranges which are adjacent. The ranges will be sorted from left to
      right. The ranges are with respect to the left edge of the entire
      layout, not with respect to the line.
  
      Params:
        startIndex = Start byte index of the logical range. If this value
            is less than the start index for the line, then the first range
            will extend all the way to the leading edge of the layout. Otherwise,
            it will start at the leading edge of the first character.
        endIndex = Ending byte index of the logical range. If this value is
            greater than the end index for the line, then the last range will
            extend all the way to the trailing edge of the layout. Otherwise,
            it will end at the trailing edge of the last character.
        ranges = location to
            store a pointer to an array of ranges. The array will be of length
            `2*n_ranges`, with each range starting at `(*ranges)[2*n]` and of
            width `(*ranges)[2*n + 1] - (*ranges)[2*n]`. This array must be freed
            with [glib.global.gfree]. The coordinates are relative to the layout and are in
            Pango units.
  */
  void getXRanges(int startIndex, int endIndex, out int[] ranges)
  {
    int _nRanges;
    int* _ranges;
    pango_layout_line_get_x_ranges(cast(PangoLayoutLine*)this._cPtr, startIndex, endIndex, &_ranges, &_nRanges);
    ranges.length = _nRanges;
    ranges[0 .. $] = (cast(int*)_ranges)[0 .. _nRanges];
    gFree(cast(void*)_ranges);
  }

  /**
      Converts an index within a line to a X position.
  
      Params:
        index = byte offset of a grapheme within the layout
        trailing = an integer indicating the edge of the grapheme to retrieve
            the position of. If > 0, the trailing edge of the grapheme,
            if 0, the leading of the grapheme
        xPos = location to store the x_offset (in Pango units)
  */
  void indexToX(int index, bool trailing, out int xPos)
  {
    pango_layout_line_index_to_x(cast(PangoLayoutLine*)this._cPtr, index, trailing, cast(int*)&xPos);
  }

  /**
      Converts from x offset to the byte index of the corresponding character
      within the text of the layout.
      
      If x_pos is outside the line, index_ and trailing will point to the very
      first or very last position in the line. This determination is based on the
      resolved direction of the paragraph; for example, if the resolved direction
      is right-to-left, then an X position to the right of the line (after it)
      results in 0 being stored in index_ and trailing. An X position to the
      left of the line results in index_ pointing to the (logical) last grapheme
      in the line and trailing being set to the number of characters in that
      grapheme. The reverse is true for a left-to-right line.
  
      Params:
        xPos = the X offset (in Pango units) from the left edge of the line.
        index = location to store calculated byte index for the grapheme
            in which the user clicked
        trailing = location to store an integer indicating where in the
            grapheme the user clicked. It will either be zero, or the number of
            characters in the grapheme. 0 represents the leading edge of the grapheme.
      Returns: false if x_pos was outside the line, true if inside
  */
  bool xToIndex(int xPos, out int index, out int trailing)
  {
    bool _retval;
    _retval = cast(bool)pango_layout_line_x_to_index(cast(PangoLayoutLine*)this._cPtr, xPos, cast(int*)&index, cast(int*)&trailing);
    return _retval;
  }
}
