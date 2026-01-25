/// Module for [Layout] class
module pango.layout;

import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;
import pango.attr_list;
import pango.c.functions;
import pango.c.types;
import pango.context;
import pango.font_description;
import pango.layout_iter;
import pango.layout_line;
import pango.tab_array;
import pango.types;

/**
    A [pango.layout.Layout] structure represents an entire paragraph of text.
    
    While complete access to the layout capabilities of Pango is provided
    using the detailed interfaces for itemization and shaping, using
    that functionality directly involves writing a fairly large amount
    of code. [pango.layout.Layout] provides a high-level driver for formatting
    entire paragraphs of text at once. This includes paragraph-level
    functionality such as line breaking, justification, alignment and
    ellipsization.
    
    A [pango.layout.Layout] is initialized with a [pango.context.Context], UTF-8 string
    and set of attributes for that string. Once that is done, the set of
    formatted lines can be extracted from the object, the layout can be
    rendered, and conversion between logical character positions within
    the layout's text, and the physical position of the resulting glyphs
    can be made.
    
    There are a number of parameters to adjust the formatting of a
    [pango.layout.Layout]. The following image shows adjustable parameters
    (on the left) and font metrics (on the right):
    
    <picture>
      <source srcset="layout-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="Pango Layout Parameters" src="layout-light.png">
    </picture>
    
    The following images demonstrate the effect of alignment and
    justification on the layout of text:
    
    | | |
    | --- | --- |
    | ![align=left](align-left.png) | ![align=left, justify](align-left-justify.png) |
    | ![align=center](align-center.png) | ![align=center, justify](align-center-justify.png) |
    | ![align=right](align-right.png) | ![align=right, justify](align-right-justify.png) |
    
    
    It is possible, as well, to ignore the 2-D setup,
    and simply treat the results of a [pango.layout.Layout] as a list of lines.
*/
class Layout : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_layout_get_type != &gidSymbolNotFound ? pango_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Layout self()
  {
    return this;
  }

  /**
      Create a new [pango.layout.Layout] object with attributes initialized to
      default values for a particular [pango.context.Context].
  
      Params:
        context = a [pango.context.Context]
      Returns: the newly allocated [pango.layout.Layout]
  */
  this(pango.context.Context context)
  {
    PangoLayout* _cretval;
    _cretval = pango_layout_new(context ? cast(PangoContext*)context._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Loads data previously created via [pango.layout.Layout.serialize].
      
      For a discussion of the supported format, see that function.
      
      Note: to verify that the returned layout is identical to
      the one that was serialized, you can compare bytes to the
      result of serializing the layout again.
  
      Params:
        context = a [pango.context.Context]
        bytes = the bytes containing the data
        flags = [pango.types.LayoutDeserializeFlags]
      Returns: a new [pango.layout.Layout]
      Throws: [ErrorWrap]
  */
  static pango.layout.Layout deserialize(pango.context.Context context, glib.bytes.Bytes bytes, pango.types.LayoutDeserializeFlags flags)
  {
    PangoLayout* _cretval;
    GError *_err;
    _cretval = pango_layout_deserialize(context ? cast(PangoContext*)context._cPtr(No.Dup) : null, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.layout.Layout)(cast(PangoLayout*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Forces recomputation of any state in the [pango.layout.Layout] that
      might depend on the layout's context.
      
      This function should be called if you make changes to the context
      subsequent to creating the layout.
  */
  void contextChanged()
  {
    pango_layout_context_changed(cast(PangoLayout*)this._cPtr);
  }

  /**
      Creates a deep copy-by-value of the layout.
      
      The attribute list, tab array, and text from the original layout
      are all copied by value.
      Returns: the newly allocated [pango.layout.Layout]
  */
  pango.layout.Layout copy()
  {
    PangoLayout* _cretval;
    _cretval = pango_layout_copy(cast(PangoLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.layout.Layout)(cast(PangoLayout*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the alignment for the layout: how partial lines are
      positioned within the horizontal space available.
      Returns: the alignment
  */
  pango.types.Alignment getAlignment()
  {
    PangoAlignment _cretval;
    _cretval = pango_layout_get_alignment(cast(PangoLayout*)this._cPtr);
    pango.types.Alignment _retval = cast(pango.types.Alignment)_cretval;
    return _retval;
  }

  /**
      Gets the attribute list for the layout, if any.
      Returns: a [pango.attr_list.AttrList]
  */
  pango.attr_list.AttrList getAttributes()
  {
    PangoAttrList* _cretval;
    _cretval = pango_layout_get_attributes(cast(PangoLayout*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets whether to calculate the base direction for the layout
      according to its contents.
      
      See [pango.layout.Layout.setAutoDir].
      Returns: true if the bidirectional base direction
          is computed from the layout's contents, false otherwise
  */
  bool getAutoDir()
  {
    bool _retval;
    _retval = cast(bool)pango_layout_get_auto_dir(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Gets the Y position of baseline of the first line in layout.
      Returns: baseline of first line, from top of layout
  */
  int getBaseline()
  {
    int _retval;
    _retval = pango_layout_get_baseline(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Given an index within a layout, determines the positions that of the
      strong and weak cursors if the insertion point is at that index.
      
      This is a variant of [pango.layout.Layout.getCursorPos] that applies
      font metric information about caret slope and offset to the positions
      it returns.
      
      <picture>
        <source srcset="caret-metrics-dark.png" media="(prefers-color-scheme: dark)">
        <img alt="Caret metrics" src="caret-metrics-light.png">
      </picture>
  
      Params:
        index = the byte index of the cursor
        strongPos = location to store the strong cursor position
        weakPos = location to store the weak cursor position
  */
  void getCaretPos(int index, out pango.types.Rectangle strongPos, out pango.types.Rectangle weakPos)
  {
    pango_layout_get_caret_pos(cast(PangoLayout*)this._cPtr, index, &strongPos, &weakPos);
  }

  /**
      Returns the number of Unicode characters in the
      the text of layout.
      Returns: the number of Unicode characters
          in the text of layout
  */
  int getCharacterCount()
  {
    int _retval;
    _retval = pango_layout_get_character_count(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the [pango.context.Context] used for this layout.
      Returns: the [pango.context.Context] for the layout
  */
  pango.context.Context getContext()
  {
    PangoContext* _cretval;
    _cretval = pango_layout_get_context(cast(PangoLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Given an index within a layout, determines the positions that of the
      strong and weak cursors if the insertion point is at that index.
      
      The position of each cursor is stored as a zero-width rectangle
      with the height of the run extents.
      
      <picture>
        <source srcset="cursor-positions-dark.png" media="(prefers-color-scheme: dark)">
        <img alt="Cursor positions" src="cursor-positions-light.png">
      </picture>
      
      The strong cursor location is the location where characters of the
      directionality equal to the base direction of the layout are inserted.
      The weak cursor location is the location where characters of the
      directionality opposite to the base direction of the layout are inserted.
      
      The following example shows text with both a strong and a weak cursor.
      
      <picture>
        <source srcset="split-cursor-dark.png" media="(prefers-color-scheme: dark)">
        <img alt="Strong and weak cursors" src="split-cursor-light.png">
      </picture>
      
      The strong cursor has a little arrow pointing to the right, the weak
      cursor to the left. Typing a 'c' in this situation will insert the
      character after the 'b', and typing another Hebrew character, like 'ג',
      will insert it at the end.
  
      Params:
        index = the byte index of the cursor
        strongPos = location to store the strong cursor position
        weakPos = location to store the weak cursor position
  */
  void getCursorPos(int index, out pango.types.Rectangle strongPos, out pango.types.Rectangle weakPos)
  {
    pango_layout_get_cursor_pos(cast(PangoLayout*)this._cPtr, index, &strongPos, &weakPos);
  }

  /**
      Gets the text direction at the given character position in layout.
  
      Params:
        index = the byte index of the char
      Returns: the text direction at index
  */
  pango.types.Direction getDirection(int index)
  {
    PangoDirection _cretval;
    _cretval = pango_layout_get_direction(cast(PangoLayout*)this._cPtr, index);
    pango.types.Direction _retval = cast(pango.types.Direction)_cretval;
    return _retval;
  }

  /**
      Gets the type of ellipsization being performed for layout.
      
      See [pango.layout.Layout.setEllipsize].
      
      Use [pango.layout.Layout.isEllipsized] to query whether any
      paragraphs were actually ellipsized.
      Returns: the current ellipsization mode for layout
  */
  pango.types.EllipsizeMode getEllipsize()
  {
    PangoEllipsizeMode _cretval;
    _cretval = pango_layout_get_ellipsize(cast(PangoLayout*)this._cPtr);
    pango.types.EllipsizeMode _retval = cast(pango.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      Computes the logical and ink extents of layout.
      
      Logical extents are usually what you want for positioning things. Note
      that both extents may have non-zero x and y. You may want to use those
      to offset where you render the layout. Not doing that is a very typical
      bug that shows up as right-to-left layouts not being correctly positioned
      in a layout with a set width.
      
      The extents are given in layout coordinates and in Pango units; layout
      coordinates begin at the top left corner of the layout.
  
      Params:
        inkRect = rectangle used to store the extents of the
            layout as drawn
        logicalRect = rectangle used to store the logical
            extents of the layout
  */
  void getExtents(out pango.types.Rectangle inkRect, out pango.types.Rectangle logicalRect)
  {
    pango_layout_get_extents(cast(PangoLayout*)this._cPtr, &inkRect, &logicalRect);
  }

  /**
      Gets the font description for the layout, if any.
      Returns: a pointer to the
          layout's font description, or null if the font description
          from the layout's context is inherited.
  */
  pango.font_description.FontDescription getFontDescription()
  {
    const(PangoFontDescription)* _cretval;
    _cretval = pango_layout_get_font_description(cast(PangoLayout*)this._cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the height of layout used for ellipsization.
      
      See [pango.layout.Layout.setHeight] for details.
      Returns: the height, in Pango units if positive,
          or number of lines if negative.
  */
  int getHeight()
  {
    int _retval;
    _retval = pango_layout_get_height(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Gets the paragraph indent width in Pango units.
      
      A negative value indicates a hanging indentation.
      Returns: the indent in Pango units
  */
  int getIndent()
  {
    int _retval;
    _retval = pango_layout_get_indent(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Returns an iterator to iterate over the visual extents of the layout.
      Returns: the new [pango.layout_iter.LayoutIter]
  */
  pango.layout_iter.LayoutIter getIter()
  {
    PangoLayoutIter* _cretval;
    _cretval = pango_layout_get_iter(cast(PangoLayout*)this._cPtr);
    auto _retval = _cretval ? new pango.layout_iter.LayoutIter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets whether each complete line should be stretched to fill the entire
      width of the layout.
      Returns: the justify value
  */
  bool getJustify()
  {
    bool _retval;
    _retval = cast(bool)pango_layout_get_justify(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the last line should be stretched
      to fill the entire width of the layout.
      Returns: the justify value
  */
  bool getJustifyLastLine()
  {
    bool _retval;
    _retval = cast(bool)pango_layout_get_justify_last_line(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves a particular line from a [pango.layout.Layout].
      
      Use the faster [pango.layout.Layout.getLineReadonly] if you do not
      plan to modify the contents of the line (glyphs, glyph widths, etc.).
  
      Params:
        line = the index of a line, which must be between 0 and
            `pango_layout_get_line_count(layout) - 1`, inclusive.
      Returns: the requested [pango.layout_line.LayoutLine],
          or null if the index is out of range. This layout line can be ref'ed
          and retained, but will become invalid if changes are made to the
          [pango.layout.Layout].
  */
  pango.layout_line.LayoutLine getLine(int line)
  {
    PangoLayoutLine* _cretval;
    _cretval = pango_layout_get_line(cast(PangoLayout*)this._cPtr, line);
    auto _retval = _cretval ? new pango.layout_line.LayoutLine(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the count of lines for the layout.
      Returns: the line count
  */
  int getLineCount()
  {
    int _retval;
    _retval = pango_layout_get_line_count(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves a particular line from a [pango.layout.Layout].
      
      This is a faster alternative to [pango.layout.Layout.getLine],
      but the user is not expected to modify the contents of the line
      (glyphs, glyph widths, etc.).
  
      Params:
        line = the index of a line, which must be between 0 and
            `pango_layout_get_line_count(layout) - 1`, inclusive.
      Returns: the requested [pango.layout_line.LayoutLine],
          or null if the index is out of range. This layout line can be ref'ed
          and retained, but will become invalid if changes are made to the
          [pango.layout.Layout]. No changes should be made to the line.
  */
  pango.layout_line.LayoutLine getLineReadonly(int line)
  {
    PangoLayoutLine* _cretval;
    _cretval = pango_layout_get_line_readonly(cast(PangoLayout*)this._cPtr, line);
    auto _retval = _cretval ? new pango.layout_line.LayoutLine(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the line spacing factor of layout.
      
      See [pango.layout.Layout.setLineSpacing].
      Returns: 
  */
  float getLineSpacing()
  {
    float _retval;
    _retval = pango_layout_get_line_spacing(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Returns the lines of the layout as a list.
      
      Use the faster [pango.layout.Layout.getLinesReadonly] if you do not
      plan to modify the contents of the lines (glyphs, glyph widths, etc.).
      Returns: a [glib.slist.SList]
          containing the lines in the layout. This points to internal data of the
          [pango.layout.Layout] and must be used with care. It will become invalid on any
          change to the layout's text or properties.
  */
  pango.layout_line.LayoutLine[] getLines()
  {
    GSList* _cretval;
    _cretval = pango_layout_get_lines(cast(PangoLayout*)this._cPtr);
    auto _retval = gSListToD!(pango.layout_line.LayoutLine, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns the lines of the layout as a list.
      
      This is a faster alternative to [pango.layout.Layout.getLines],
      but the user is not expected to modify the contents of the lines
      (glyphs, glyph widths, etc.).
      Returns: a [glib.slist.SList]
          containing the lines in the layout. This points to internal data of the
          [pango.layout.Layout] and must be used with care. It will become invalid on any
          change to the layout's text or properties. No changes should be made to
          the lines.
  */
  pango.layout_line.LayoutLine[] getLinesReadonly()
  {
    GSList* _cretval;
    _cretval = pango_layout_get_lines_readonly(cast(PangoLayout*)this._cPtr);
    auto _retval = gSListToD!(pango.layout_line.LayoutLine, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Retrieves an array of logical attributes for each character in
      the layout.
  
      Params:
        attrs = location to store a pointer to an array of logical attributes.
            This value must be freed with [glib.global.gfree].
  */
  void getLogAttrs(out pango.types.LogAttr[] attrs)
  {
    int _nAttrs;
    PangoLogAttr* _attrs;
    pango_layout_get_log_attrs(cast(PangoLayout*)this._cPtr, &_attrs, &_nAttrs);
    attrs.length = _nAttrs;
    attrs[0 .. $] = (cast(pango.types.LogAttr*)_attrs)[0 .. _nAttrs];
    gFree(cast(void*)_attrs);
  }

  /**
      Retrieves an array of logical attributes for each character in
      the layout.
      
      This is a faster alternative to [pango.layout.Layout.getLogAttrs].
      The returned array is part of layout and must not be modified.
      Modifying the layout will invalidate the returned array.
      
      The number of attributes returned in n_attrs will be one more
      than the total number of characters in the layout, since there
      need to be attributes corresponding to both the position before
      the first character and the position after the last character.
      Returns: an array of logical attributes
  */
  pango.types.LogAttr[] getLogAttrsReadonly()
  {
    const(PangoLogAttr)* _cretval;
    int _cretlength;
    _cretval = pango_layout_get_log_attrs_readonly(cast(PangoLayout*)this._cPtr, &_cretlength);
    pango.types.LogAttr[] _retval;

    if (_cretval)
    {
      _retval = new pango.types.LogAttr[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i];
    }
    return _retval;
  }

  /**
      Computes the logical and ink extents of layout in device units.
      
      This function just calls [pango.layout.Layout.getExtents] followed by
      two `funcextents_to_pixels` calls, rounding ink_rect and logical_rect
      such that the rounded rectangles fully contain the unrounded one (that is,
      passes them as first argument to `funcPango.extents_to_pixels`).
  
      Params:
        inkRect = rectangle used to store the extents of the
            layout as drawn
        logicalRect = rectangle used to store the logical
            extents of the layout
  */
  void getPixelExtents(out pango.types.Rectangle inkRect, out pango.types.Rectangle logicalRect)
  {
    pango_layout_get_pixel_extents(cast(PangoLayout*)this._cPtr, &inkRect, &logicalRect);
  }

  /**
      Determines the logical width and height of a [pango.layout.Layout] in device
      units.
      
      [pango.layout.Layout.getSize] returns the width and height
      scaled by [pango.types.SCALE]. This is simply a convenience function
      around [pango.layout.Layout.getPixelExtents].
  
      Params:
        width = location to store the logical width
        height = location to store the logical height
  */
  void getPixelSize(out int width, out int height)
  {
    pango_layout_get_pixel_size(cast(PangoLayout*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns the current serial number of layout.
      
      The serial number is initialized to an small number larger than zero
      when a new layout is created and is increased whenever the layout is
      changed using any of the setter functions, or the [pango.context.Context] it
      uses has changed. The serial may wrap, but will never have the value 0.
      Since it can wrap, never compare it with "less than", always use "not equals".
      
      This can be used to automatically detect changes to a [pango.layout.Layout],
      and is useful for example to decide whether a layout needs redrawing.
      To force the serial to be increased, use
      [pango.layout.Layout.contextChanged].
      Returns: The current serial number of layout.
  */
  uint getSerial()
  {
    uint _retval;
    _retval = pango_layout_get_serial(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Obtains whether layout is in single paragraph mode.
      
      See [pango.layout.Layout.setSingleParagraphMode].
      Returns: true if the layout does not break paragraphs
          at paragraph separator characters, false otherwise
  */
  bool getSingleParagraphMode()
  {
    bool _retval;
    _retval = cast(bool)pango_layout_get_single_paragraph_mode(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Determines the logical width and height of a [pango.layout.Layout] in Pango
      units.
      
      This is simply a convenience function around [pango.layout.Layout.getExtents].
  
      Params:
        width = location to store the logical width
        height = location to store the logical height
  */
  void getSize(out int width, out int height)
  {
    pango_layout_get_size(cast(PangoLayout*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Gets the amount of spacing between the lines of the layout.
      Returns: the spacing in Pango units
  */
  int getSpacing()
  {
    int _retval;
    _retval = pango_layout_get_spacing(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current [pango.tab_array.TabArray] used by this layout.
      
      If no [pango.tab_array.TabArray] has been set, then the default tabs are
      in use and null is returned. Default tabs are every 8 spaces.
      
      The return value should be freed with [pango.tab_array.TabArray.free].
      Returns: a copy of the tabs for this layout
  */
  pango.tab_array.TabArray getTabs()
  {
    PangoTabArray* _cretval;
    _cretval = pango_layout_get_tabs(cast(PangoLayout*)this._cPtr);
    auto _retval = _cretval ? new pango.tab_array.TabArray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the text in the layout.
      
      The returned text should not be freed or modified.
      Returns: the text in the layout
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = pango_layout_get_text(cast(PangoLayout*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Counts the number of unknown glyphs in layout.
      
      This function can be used to determine if there are any fonts
      available to render all characters in a certain string, or when
      used in combination with [pango.types.AttrType.Fallback], to check if a
      certain font supports all the characters in the string.
      Returns: The number of unknown glyphs in layout
  */
  int getUnknownGlyphsCount()
  {
    int _retval;
    _retval = pango_layout_get_unknown_glyphs_count(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Gets the width to which the lines of the [pango.layout.Layout] should wrap.
      Returns: the width in Pango units, or -1 if no width set.
  */
  int getWidth()
  {
    int _retval;
    _retval = pango_layout_get_width(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Gets the wrap mode for the layout.
      
      Use [pango.layout.Layout.isWrapped] to query whether
      any paragraphs were actually wrapped.
      Returns: active wrap mode.
  */
  pango.types.WrapMode getWrap()
  {
    PangoWrapMode _cretval;
    _cretval = pango_layout_get_wrap(cast(PangoLayout*)this._cPtr);
    pango.types.WrapMode _retval = cast(pango.types.WrapMode)_cretval;
    return _retval;
  }

  /**
      Converts from byte index_ within the layout to line and X position.
      
      The X position is measured from the left edge of the line.
  
      Params:
        index = the byte index of a grapheme within the layout
        trailing = an integer indicating the edge of the grapheme to retrieve the
            position of. If > 0, the trailing edge of the grapheme, if 0,
            the leading of the grapheme
        line = location to store resulting line index. (which will
            between 0 and pango_layout_get_line_count(layout) - 1)
        xPos = location to store resulting position within line
            ([pango.types.SCALE] units per device unit)
  */
  void indexToLineX(int index, bool trailing, out int line, out int xPos)
  {
    pango_layout_index_to_line_x(cast(PangoLayout*)this._cPtr, index, trailing, cast(int*)&line, cast(int*)&xPos);
  }

  /**
      Converts from an index within a [pango.layout.Layout] to the onscreen position
      corresponding to the grapheme at that index.
      
      The returns is represented as rectangle. Note that `pos->x` is
      always the leading edge of the grapheme and `pos->x + pos->width` the
      trailing edge of the grapheme. If the directionality of the grapheme
      is right-to-left, then `pos->width` will be negative.
  
      Params:
        index = byte index within layout
        pos = rectangle in which to store the position of the grapheme
  */
  void indexToPos(int index, out pango.types.Rectangle pos)
  {
    pango_layout_index_to_pos(cast(PangoLayout*)this._cPtr, index, &pos);
  }

  /**
      Queries whether the layout had to ellipsize any paragraphs.
      
      This returns true if the ellipsization mode for layout
      is not [pango.types.EllipsizeMode.None], a positive width is set on layout,
      and there are paragraphs exceeding that width that have to be
      ellipsized.
      Returns: true if any paragraphs had to be ellipsized,
          false otherwise
  */
  bool isEllipsized()
  {
    bool _retval;
    _retval = cast(bool)pango_layout_is_ellipsized(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Queries whether the layout had to wrap any paragraphs.
      
      This returns true if a positive width is set on layout,
      ellipsization mode of layout is set to [pango.types.EllipsizeMode.None],
      and there are paragraphs exceeding the layout width that have
      to be wrapped.
      Returns: true if any paragraphs had to be wrapped, false
          otherwise
  */
  bool isWrapped()
  {
    bool _retval;
    _retval = cast(bool)pango_layout_is_wrapped(cast(PangoLayout*)this._cPtr);
    return _retval;
  }

  /**
      Computes a new cursor position from an old position and a direction.
      
      If direction is positive, then the new position will cause the strong
      or weak cursor to be displayed one position to right of where it was
      with the old cursor position. If direction is negative, it will be
      moved to the left.
      
      In the presence of bidirectional text, the correspondence between
      logical and visual order will depend on the direction of the current
      run, and there may be jumps when the cursor is moved off of the end
      of a run.
      
      Motion here is in cursor positions, not in characters, so a single
      call to this function may move the cursor over multiple characters
      when multiple characters combine to form a single grapheme.
  
      Params:
        strong = whether the moving cursor is the strong cursor or the
            weak cursor. The strong cursor is the cursor corresponding
            to text insertion in the base direction for the layout.
        oldIndex = the byte index of the current cursor position
        oldTrailing = if 0, the cursor was at the leading edge of the
            grapheme indicated by old_index, if > 0, the cursor
            was at the trailing edge.
        direction = direction to move cursor. A negative
            value indicates motion to the left
        newIndex = location to store the new cursor byte index.
            A value of -1 indicates that the cursor has been moved off the
            beginning of the layout. A value of `G_MAXINT` indicates that
            the cursor has been moved off the end of the layout.
        newTrailing = number of characters to move forward from
            the location returned for new_index to get the position where
            the cursor should be displayed. This allows distinguishing the
            position at the beginning of one line from the position at the
            end of the preceding line. new_index is always on the line where
            the cursor should be displayed.
  */
  void moveCursorVisually(bool strong, int oldIndex, int oldTrailing, int direction, out int newIndex, out int newTrailing)
  {
    pango_layout_move_cursor_visually(cast(PangoLayout*)this._cPtr, strong, oldIndex, oldTrailing, direction, cast(int*)&newIndex, cast(int*)&newTrailing);
  }

  /**
      Serializes the layout for later deserialization via [pango.layout.Layout.deserialize].
      
      There are no guarantees about the format of the output across different
      versions of Pango and [pango.layout.Layout.deserialize] will reject data
      that it cannot parse.
      
      The intended use of this function is testing, benchmarking and debugging.
      The format is not meant as a permanent storage format.
  
      Params:
        flags = [pango.types.LayoutSerializeFlags]
      Returns: a [glib.bytes.Bytes] containing the serialized form of layout
  */
  glib.bytes.Bytes serialize(pango.types.LayoutSerializeFlags flags)
  {
    GBytes* _cretval;
    _cretval = pango_layout_serialize(cast(PangoLayout*)this._cPtr, flags);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets the alignment for the layout: how partial lines are
      positioned within the horizontal space available.
      
      The default alignment is [pango.types.Alignment.Left].
  
      Params:
        alignment = the alignment
  */
  void setAlignment(pango.types.Alignment alignment)
  {
    pango_layout_set_alignment(cast(PangoLayout*)this._cPtr, alignment);
  }

  /**
      Sets the text attributes for a layout object.
      
      References attrs, so the caller can unref its reference.
  
      Params:
        attrs = a [pango.attr_list.AttrList]
  */
  void setAttributes(pango.attr_list.AttrList attrs = null)
  {
    pango_layout_set_attributes(cast(PangoLayout*)this._cPtr, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to calculate the base direction
      for the layout according to its contents.
      
      When this flag is on (the default), then paragraphs in layout that
      begin with strong right-to-left characters (Arabic and Hebrew principally),
      will have right-to-left layout, paragraphs with letters from other scripts
      will have left-to-right layout. Paragraphs with only neutral characters
      get their direction from the surrounding paragraphs.
      
      When false, the choice between left-to-right and right-to-left
      layout is done according to the base direction of the layout's
      [pango.context.Context]. (See [pango.context.Context.setBaseDir]).
      
      When the auto-computed direction of a paragraph differs from the
      base direction of the context, the interpretation of
      [pango.types.Alignment.Left] and [pango.types.Alignment.Right] are swapped.
  
      Params:
        autoDir = if true, compute the bidirectional base direction
            from the layout's contents
  */
  void setAutoDir(bool autoDir)
  {
    pango_layout_set_auto_dir(cast(PangoLayout*)this._cPtr, autoDir);
  }

  /**
      Sets the type of ellipsization being performed for layout.
      
      Depending on the ellipsization mode ellipsize text is
      removed from the start, middle, or end of text so they
      fit within the width and height of layout set with
      [pango.layout.Layout.setWidth] and [pango.layout.Layout.setHeight].
      
      If the layout contains characters such as newlines that
      force it to be layed out in multiple paragraphs, then whether
      each paragraph is ellipsized separately or the entire layout
      is ellipsized as a whole depends on the set height of the layout.
      
      The default value is [pango.types.EllipsizeMode.None].
      
      See [pango.layout.Layout.setHeight] for details.
  
      Params:
        ellipsize = the new ellipsization mode for layout
  */
  void setEllipsize(pango.types.EllipsizeMode ellipsize)
  {
    pango_layout_set_ellipsize(cast(PangoLayout*)this._cPtr, ellipsize);
  }

  /**
      Sets the default font description for the layout.
      
      If no font description is set on the layout, the
      font description from the layout's context is used.
  
      Params:
        desc = the new [pango.font_description.FontDescription]
            to unset the current font description
  */
  void setFontDescription(pango.font_description.FontDescription desc = null)
  {
    pango_layout_set_font_description(cast(PangoLayout*)this._cPtr, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null);
  }

  /**
      Sets the height to which the [pango.layout.Layout] should be ellipsized at.
      
      There are two different behaviors, based on whether height is positive
      or negative.
      
      If height is positive, it will be the maximum height of the layout. Only
      lines would be shown that would fit, and if there is any text omitted,
      an ellipsis added. At least one line is included in each paragraph regardless
      of how small the height value is. A value of zero will render exactly one
      line for the entire layout.
      
      If height is negative, it will be the (negative of) maximum number of lines
      per paragraph. That is, the total number of lines shown may well be more than
      this value if the layout contains multiple paragraphs of text.
      The default value of -1 means that the first line of each paragraph is ellipsized.
      This behavior may be changed in the future to act per layout instead of per
      paragraph. File a bug against pango at
      [https://gitlab.gnome.org/gnome/pango](https://gitlab.gnome.org/gnome/pango)
      if your code relies on this behavior.
      
      Height setting only has effect if a positive width is set on
      layout and ellipsization mode of layout is not [pango.types.EllipsizeMode.None].
      The behavior is undefined if a height other than -1 is set and
      ellipsization mode is set to [pango.types.EllipsizeMode.None], and may change in the
      future.
  
      Params:
        height = the desired height of the layout in Pango units if positive,
            or desired number of lines if negative.
  */
  void setHeight(int height)
  {
    pango_layout_set_height(cast(PangoLayout*)this._cPtr, height);
  }

  /**
      Sets the width in Pango units to indent each paragraph.
      
      A negative value of indent will produce a hanging indentation.
      That is, the first line will have the full width, and subsequent
      lines will be indented by the absolute value of indent.
      
      The indent setting is ignored if layout alignment is set to
      [pango.types.Alignment.Center].
      
      The default value is 0.
  
      Params:
        indent = the amount by which to indent
  */
  void setIndent(int indent)
  {
    pango_layout_set_indent(cast(PangoLayout*)this._cPtr, indent);
  }

  /**
      Sets whether each complete line should be stretched to fill the
      entire width of the layout.
      
      Stretching is typically done by adding whitespace, but for some scripts
      (such as Arabic), the justification may be done in more complex ways,
      like extending the characters.
      
      Note that this setting is not implemented and so is ignored in
      Pango older than 1.18.
      
      Note that tabs and justification conflict with each other:
      Justification will move content away from its tab-aligned
      positions.
      
      The default value is false.
      
      Also see [pango.layout.Layout.setJustifyLastLine].
  
      Params:
        justify = whether the lines in the layout should be justified
  */
  void setJustify(bool justify)
  {
    pango_layout_set_justify(cast(PangoLayout*)this._cPtr, justify);
  }

  /**
      Sets whether the last line should be stretched to fill the
      entire width of the layout.
      
      This only has an effect if [pango.layout.Layout.setJustify] has
      been called as well.
      
      The default value is false.
  
      Params:
        justify = whether the last line in the layout should be justified
  */
  void setJustifyLastLine(bool justify)
  {
    pango_layout_set_justify_last_line(cast(PangoLayout*)this._cPtr, justify);
  }

  /**
      Sets a factor for line spacing.
      
      Typical values are: 0, 1, 1.5, 2. The default values is 0.
      
      If factor is non-zero, lines are placed so that
      
          baseline2 = baseline1 + factor * height2
      
      where height2 is the line height of the second line
      (as determined by the font(s)). In this case, the spacing
      set with [pango.layout.Layout.setSpacing] is ignored.
      
      If factor is zero (the default), spacing is applied as before.
      
      Note: for semantics that are closer to the CSS line-height
      property, see `funcPango.attr_line_height_new`.
  
      Params:
        factor = the new line spacing factor
  */
  void setLineSpacing(float factor)
  {
    pango_layout_set_line_spacing(cast(PangoLayout*)this._cPtr, factor);
  }

  /**
      Sets the layout text and attribute list from marked-up text.
      
      See [Pango Markup](pango_markup.html)).
      
      Replaces the current text and attribute list.
      
      This is the same as [pango.layout.Layout.setMarkupWithAccel],
      but the markup text isn't scanned for accelerators.
  
      Params:
        markup = marked-up text
  */
  void setMarkup(string markup)
  {
    int _length;
    if (markup)
      _length = cast(int)markup.length;

    auto _markup = cast(const(char)*)markup.ptr;
    pango_layout_set_markup(cast(PangoLayout*)this._cPtr, _markup, _length);
  }

  /**
      Sets the layout text and attribute list from marked-up text.
      
      See [Pango Markup](pango_markup.html)).
      
      Replaces the current text and attribute list.
      
      If accel_marker is nonzero, the given character will mark the
      character following it as an accelerator. For example, accel_marker
      might be an ampersand or underscore. All characters marked
      as an accelerator will receive a [pango.types.Underline.Low] attribute,
      and the first character so marked will be returned in accel_char.
      Two accel_marker characters following each other produce a single
      literal accel_marker character.
  
      Params:
        markup = marked-up text (see [Pango Markup](pango_markup.html))
        accelMarker = marker for accelerators in the text
        accelChar = return location
            for first located accelerator
  */
  void setMarkupWithAccel(string markup, dchar accelMarker, out dchar accelChar)
  {
    int _length;
    if (markup)
      _length = cast(int)markup.length;

    auto _markup = cast(const(char)*)markup.ptr;
    pango_layout_set_markup_with_accel(cast(PangoLayout*)this._cPtr, _markup, _length, accelMarker, cast(dchar*)&accelChar);
  }

  /**
      Sets the single paragraph mode of layout.
      
      If setting is true, do not treat newlines and similar characters
      as paragraph separators; instead, keep all text in a single paragraph,
      and display a glyph for paragraph separator characters. Used when
      you want to allow editing of newlines on a single text line.
      
      The default value is false.
  
      Params:
        setting = new setting
  */
  void setSingleParagraphMode(bool setting)
  {
    pango_layout_set_single_paragraph_mode(cast(PangoLayout*)this._cPtr, setting);
  }

  /**
      Sets the amount of spacing in Pango units between
      the lines of the layout.
      
      When placing lines with spacing, Pango arranges things so that
      
          line2.top = line1.bottom + spacing
      
      The default value is 0.
      
      Note: Since 1.44, Pango is using the line height (as determined
      by the font) for placing lines when the line spacing factor is set
      to a non-zero value with [pango.layout.Layout.setLineSpacing].
      In that case, the spacing set with this function is ignored.
      
      Note: for semantics that are closer to the CSS line-height
      property, see `funcPango.attr_line_height_new`.
  
      Params:
        spacing = the amount of spacing
  */
  void setSpacing(int spacing)
  {
    pango_layout_set_spacing(cast(PangoLayout*)this._cPtr, spacing);
  }

  /**
      Sets the tabs to use for layout, overriding the default tabs.
      
      [pango.layout.Layout] will place content at the next tab position
      whenever it meets a Tab character (U+0009).
      
      By default, tabs are every 8 spaces. If tabs is null, the
      default tabs are reinstated. tabs is copied into the layout;
      you must free your copy of tabs yourself.
      
      Note that tabs and justification conflict with each other:
      Justification will move content away from its tab-aligned
      positions. The same is true for alignments other than
      [pango.types.Alignment.Left].
  
      Params:
        tabs = a [pango.tab_array.TabArray]
  */
  void setTabs(pango.tab_array.TabArray tabs = null)
  {
    pango_layout_set_tabs(cast(PangoLayout*)this._cPtr, tabs ? cast(PangoTabArray*)tabs._cPtr(No.Dup) : null);
  }

  /**
      Sets the text of the layout.
      
      This function validates text and renders invalid UTF-8
      with a placeholder glyph.
      
      Note that if you have used [pango.layout.Layout.setMarkup] or
      [pango.layout.Layout.setMarkupWithAccel] on layout before, you
      may want to call [pango.layout.Layout.setAttributes] to clear the
      attributes set on the layout from the markup as this function does
      not clear attributes.
  
      Params:
        text = the text
  */
  void setText(string text)
  {
    int _length;
    if (text)
      _length = cast(int)text.length;

    auto _text = cast(char*)text.ptr;
    pango_layout_set_text(cast(PangoLayout*)this._cPtr, _text, _length);
  }

  /**
      Sets the width to which the lines of the [pango.layout.Layout] should wrap or
      ellipsized.
      
      The default value is -1: no width set.
  
      Params:
        width = the desired width in Pango units, or -1 to indicate that no
            wrapping or ellipsization should be performed.
  */
  void setWidth(int width)
  {
    pango_layout_set_width(cast(PangoLayout*)this._cPtr, width);
  }

  /**
      Sets the wrap mode.
      
      The wrap mode only has effect if a width is set on the layout
      with [pango.layout.Layout.setWidth]. To turn off wrapping,
      set the width to -1.
      
      The default value is [pango.types.WrapMode.Word].
  
      Params:
        wrap = the wrap mode
  */
  void setWrap(pango.types.WrapMode wrap)
  {
    pango_layout_set_wrap(cast(PangoLayout*)this._cPtr, wrap);
  }

  /**
      A convenience method to serialize a layout to a file.
      
      It is equivalent to calling [pango.layout.Layout.serialize]
      followed by `funcGLib.file_set_contents`.
      
      See those two functions for details on the arguments.
      
      It is mostly intended for use inside a debugger to quickly dump
      a layout to a file for later inspection.
  
      Params:
        flags = [pango.types.LayoutSerializeFlags]
        filename = the file to save it to
      Returns: true if saving was successful
      Throws: [ErrorWrap]
  */
  bool writeToFile(pango.types.LayoutSerializeFlags flags, string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)pango_layout_write_to_file(cast(PangoLayout*)this._cPtr, flags, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Converts from X and Y position within a layout to the byte index to the
      character at that logical position.
      
      If the Y position is not inside the layout, the closest position is
      chosen (the position will be clamped inside the layout). If the X position
      is not within the layout, then the start or the end of the line is
      chosen as described for [pango.layout_line.LayoutLine.xToIndex]. If either
      the X or Y positions were not inside the layout, then the function returns
      false; on an exact hit, it returns true.
  
      Params:
        x = the X offset (in Pango units) from the left edge of the layout
        y = the Y offset (in Pango units) from the top edge of the layout
        index = location to store calculated byte index
        trailing = location to store a integer indicating where
            in the grapheme the user clicked. It will either be zero, or the
            number of characters in the grapheme. 0 represents the leading edge
            of the grapheme.
      Returns: true if the coordinates were inside text, false otherwise
  */
  bool xyToIndex(int x, int y, out int index, out int trailing)
  {
    bool _retval;
    _retval = cast(bool)pango_layout_xy_to_index(cast(PangoLayout*)this._cPtr, x, y, cast(int*)&index, cast(int*)&trailing);
    return _retval;
  }
}
