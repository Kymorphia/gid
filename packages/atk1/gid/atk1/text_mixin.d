/// Module for [Text] interface mixin
module gid.atk1.text_mixin;

public import gid.core.basictypes;
public import gid.atk1.text_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.text_range;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The ATK interface implemented by components with text content.
    
    #AtkText should be implemented by #AtkObjects on behalf of widgets
    that have text content which is either attributed or otherwise
    non-trivial.  #AtkObjects whose text content is simple,
    unattributed, and very brief may expose that content via
    #atk_object_get_name instead; however if the text is editable,
    multi-line, typically longer than three or four words, attributed,
    selectable, or if the object already uses the 'name' ATK property
    for other information, the #AtkText interface should be used to
    expose the text content.  In the case of editable text content,
    #AtkEditableText (a subtype of the #AtkText interface) should be
    implemented instead.
    
     #AtkText provides not only traversal facilities and change
    notification for text content, but also caret tracking and glyph
    bounding box calculations.  Note that the text strings are exposed
    as UTF-8, and are therefore potentially multi-byte, and
    caret-to-byte offset mapping makes no assumptions about the
    character length; also bounding box glyph-to-offset mapping may be
    complex for languages which use ligatures.
*/
template TextT()
{

  /**
      Adds a selection bounded by the specified offsets.
  
      Params:
        startOffset = the starting character offset of the selected region
        endOffset = the offset of the first character after the selected region.
      Returns: true if successful, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncTextAddSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncTextAddSelection(int startOffset, int endOffset)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.addSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.addSelection(cast(AtkText*)this._cPtr, startOffset, endOffset);
    return _retval;
  }

  /**
      Gets the offset of the position of the caret (cursor).
      Returns: the character offset of the position of the caret or -1 if
                 the caret is not located inside the element or in the case of
                 any other failure.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCaretOffset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetCaretOffset()
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getCaretOffset)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getCaretOffset(cast(AtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets the specified text.
  
      Params:
        offset = a character offset within text
      Returns: the character at offset or 0 in the case of failure.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCharacterAtOffset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected dchar vfuncGetCharacterAtOffset(int offset)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getCharacterAtOffset)
      return typeof(return).init;

    dchar _retval;
    _retval = _klass.getCharacterAtOffset(cast(AtkText*)this._cPtr, offset);
    return _retval;
  }

  /**
      Gets the character count.
      Returns: the number of characters or -1 in case of failure.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCharacterCount`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetCharacterCount()
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getCharacterCount)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getCharacterCount(cast(AtkText*)this._cPtr);
    return _retval;
  }

  /**
      If the extent can not be obtained (e.g. missing support), all of x, y, width,
      height are set to -1.
      
      Get the bounding box containing the glyph representing the character at
          a particular text offset.
  
      Params:
        offset = The offset of the text character for which bounding information is required.
        x = Pointer for the x coordinate of the bounding box
        y = Pointer for the y coordinate of the bounding box
        width = Pointer for the width of the bounding box
        height = Pointer for the height of the bounding box
        coords = specify whether coordinates are relative to the screen or widget window
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCharacterExtents`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetCharacterExtents(int offset, out int x, out int y, out int width, out int height, gid.atk1.types.CoordType coords)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getCharacterExtents)
      return;

    _klass.getCharacterExtents(cast(AtkText*)this._cPtr, offset, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height, coords);
  }

  /**
      Gets the number of selected regions.
      Returns: The number of selected regions, or -1 in the case of failure.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetNSelections`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetNSelections()
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getNSelections)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getNSelections(cast(AtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets the offset of the character located at coordinates `x` and `y`. `x` and `y`
      are interpreted as being relative to the screen or this widget's window
      depending on coords.
  
      Params:
        x = screen x-position of character
        y = screen y-position of character
        coords = specify whether coordinates are relative to the screen or
          widget window
      Returns: the offset to the character which is located at  the specified
                 `x` and `y` coordinates of -1 in case of failure.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetOffsetAtPoint`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetOffsetAtPoint(int x, int y, gid.atk1.types.CoordType coords)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getOffsetAtPoint)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getOffsetAtPoint(cast(AtkText*)this._cPtr, x, y, coords);
    return _retval;
  }

  /**
      Get the bounding box for text within the specified range.
      
      If the extents can not be obtained (e.g. or missing support), the rectangle
      fields are set to -1.
  
      Params:
        startOffset = The offset of the first text character for which boundary
                 information is required.
        endOffset = The offset of the text character after the last character
                 for which boundary information is required.
        coordType = Specify whether coordinates are relative to the screen or widget window.
        rect = A pointer to a AtkTextRectangle which is filled in by this function.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRangeExtents`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetRangeExtents(int startOffset, int endOffset, gid.atk1.types.CoordType coordType, out gid.atk1.types.TextRectangle rect)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getRangeExtents)
      return;

    _klass.getRangeExtents(cast(AtkText*)this._cPtr, startOffset, endOffset, coordType, cast(AtkTextRectangle*)&rect);
  }

  /**
      Gets the text from the specified selection.
  
      Params:
        selectionNum = The selection number.  The selected regions are
          assigned numbers that correspond to how far the region is from the
          start of the text.  The selected region closest to the beginning
          of the text region is assigned the number 0, etc.  Note that adding,
          moving or deleting a selected region can change the numbering.
        startOffset = passes back the starting character offset of the selected region
        endOffset = passes back the ending character offset (offset immediately past)
          of the selected region
      Returns: a newly allocated string containing the selected text. Use [gid.glib2.global.gfree]
                 to free the returned string.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetSelection(int selectionNum, out int startOffset, out int endOffset)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getSelection)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getSelection(cast(AtkText*)this._cPtr, selectionNum, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets a portion of the text exposed through an #AtkText according to a given offset
      and a specific granularity, along with the start and end offsets defining the
      boundaries of such a portion of text.
      
      If granularity is ATK_TEXT_GRANULARITY_CHAR the character at the
      offset is returned.
      
      If granularity is ATK_TEXT_GRANULARITY_WORD the returned string
      is from the word start at or before the offset to the word start after
      the offset.
      
      The returned string will contain the word at the offset if the offset
      is inside a word and will contain the word before the offset if the
      offset is not inside a word.
      
      If granularity is ATK_TEXT_GRANULARITY_SENTENCE the returned string
      is from the sentence start at or before the offset to the sentence
      start after the offset.
      
      The returned string will contain the sentence at the offset if the offset
      is inside a sentence and will contain the sentence before the offset
      if the offset is not inside a sentence.
      
      If granularity is ATK_TEXT_GRANULARITY_LINE the returned string
      is from the line start at or before the offset to the line
      start after the offset.
      
      If granularity is ATK_TEXT_GRANULARITY_PARAGRAPH the returned string
      is from the start of the paragraph at or before the offset to the start
      of the following paragraph after the offset.
  
      Params:
        offset = position
        granularity = An #AtkTextGranularity
        startOffset = the starting character offset of the returned string, or -1
                         in the case of error (e.g. invalid offset, not implemented)
        endOffset = the offset of the first character after the returned string,
                       or -1 in the case of error (e.g. invalid offset, not implemented)
      Returns: a newly allocated string containing the text at
                 the offset bounded by the specified granularity. Use [gid.glib2.global.gfree]
                 to free the returned string.  Returns null if the offset is invalid
                 or no implementation is available.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetStringAtOffset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetStringAtOffset(int offset, gid.atk1.types.TextGranularity granularity, out int startOffset, out int endOffset)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getStringAtOffset)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getStringAtOffset(cast(AtkText*)this._cPtr, offset, granularity, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the specified text.
  
      Params:
        startOffset = a starting character offset within text
        endOffset = an ending character offset within text, or -1 for the end of the string.
      Returns: a newly allocated string containing the text from start_offset up
                 to, but not including end_offset. Use [gid.glib2.global.gfree] to free the returned
                 string.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetText`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetText(int startOffset, int endOffset)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getText)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getText(cast(AtkText*)this._cPtr, startOffset, endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the specified text.
  
      Params:
        offset = position
        boundaryType = An #AtkTextBoundary
        startOffset = the starting character offset of the returned string
        endOffset = the offset of the first character after the
                       returned substring
      Returns: a newly allocated string containing the text after offset bounded
                 by the specified boundary_type. Use [gid.glib2.global.gfree] to free the returned
                 string.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTextAfterOffset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Please use [gid.atk1.text.Text.getStringAtOffset] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetTextAfterOffset(int offset, gid.atk1.types.TextBoundary boundaryType, out int startOffset, out int endOffset)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getTextAfterOffset)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getTextAfterOffset(cast(AtkText*)this._cPtr, offset, boundaryType, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the specified text.
      
      If the boundary_type if ATK_TEXT_BOUNDARY_CHAR the character at the
      offset is returned.
      
      If the boundary_type is ATK_TEXT_BOUNDARY_WORD_START the returned string
      is from the word start at or before the offset to the word start after
      the offset.
      
      The returned string will contain the word at the offset if the offset
      is inside a word and will contain the word before the offset if the
      offset is not inside a word.
      
      If the boundary type is ATK_TEXT_BOUNDARY_SENTENCE_START the returned
      string is from the sentence start at or before the offset to the sentence
      start after the offset.
      
      The returned string will contain the sentence at the offset if the offset
      is inside a sentence and will contain the sentence before the offset
      if the offset is not inside a sentence.
      
      If the boundary type is ATK_TEXT_BOUNDARY_LINE_START the returned
      string is from the line start at or before the offset to the line
      start after the offset.
  
      Params:
        offset = position
        boundaryType = An #AtkTextBoundary
        startOffset = the starting character offset of the returned string
        endOffset = the offset of the first character after the
                       returned substring
      Returns: a newly allocated string containing the text at offset bounded
                 by the specified boundary_type. Use [gid.glib2.global.gfree] to free the returned
                 string.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTextAtOffset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: This method is deprecated since ATK version
        2.9.4. Please use [gid.atk1.text.Text.getStringAtOffset] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetTextAtOffset(int offset, gid.atk1.types.TextBoundary boundaryType, out int startOffset, out int endOffset)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getTextAtOffset)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getTextAtOffset(cast(AtkText*)this._cPtr, offset, boundaryType, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the specified text.
  
      Params:
        offset = position
        boundaryType = An #AtkTextBoundary
        startOffset = the starting character offset of the returned string
        endOffset = the offset of the first character after the
                       returned substring
      Returns: a newly allocated string containing the text before offset bounded
                 by the specified boundary_type. Use [gid.glib2.global.gfree] to free the returned
                 string.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTextBeforeOffset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Please use [gid.atk1.text.Text.getStringAtOffset] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetTextBeforeOffset(int offset, gid.atk1.types.TextBoundary boundaryType, out int startOffset, out int endOffset)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.getTextBeforeOffset)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getTextBeforeOffset(cast(AtkText*)this._cPtr, offset, boundaryType, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Removes the specified selection.
  
      Params:
        selectionNum = The selection number.  The selected regions are
          assigned numbers that correspond to how far the region is from the
          start of the text.  The selected region closest to the beginning
          of the text region is assigned the number 0, etc.  Note that adding,
          moving or deleting a selected region can change the numbering.
      Returns: true if successful, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncTextRemoveSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncTextRemoveSelection(int selectionNum)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.removeSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.removeSelection(cast(AtkText*)this._cPtr, selectionNum);
    return _retval;
  }

  /**
      Makes a substring of text visible on the screen by scrolling all necessary parents.
  
      Params:
        startOffset = start offset in the text
        endOffset = end offset in the text, or -1 for the end of the text.
        type = specify where the object should be made visible.
      Returns: whether scrolling was successful.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncScrollSubstringTo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncScrollSubstringTo(int startOffset, int endOffset, gid.atk1.types.ScrollType type)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.scrollSubstringTo)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.scrollSubstringTo(cast(AtkText*)this._cPtr, startOffset, endOffset, type);
    return _retval;
  }

  /**
      Move the top-left of a substring of text to a given position of the screen
      by scrolling all necessary parents.
  
      Params:
        startOffset = start offset in the text
        endOffset = end offset in the text, or -1 for the end of the text.
        coords = specify whether coordinates are relative to the screen or to the
          parent object.
        x = x-position where to scroll to
        y = y-position where to scroll to
      Returns: whether scrolling was successful.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncScrollSubstringToPoint`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncScrollSubstringToPoint(int startOffset, int endOffset, gid.atk1.types.CoordType coords, int x, int y)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.scrollSubstringToPoint)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.scrollSubstringToPoint(cast(AtkText*)this._cPtr, startOffset, endOffset, coords, x, y);
    return _retval;
  }

  /**
      Sets the caret (cursor) position to the specified offset.
      
      In the case of rich-text content, this method should either grab focus
      or move the sequential focus navigation starting point (if the application
      supports this concept) as if the user had clicked on the new caret position.
      Typically, this means that the target of this operation is the node containing
      the new caret position or one of its ancestors. In other words, after this
      method is called, if the user advances focus, it should move to the first
      focusable node following the new caret position.
      
      Calling this method should also scroll the application viewport in a way
      that matches the behavior of the application's typical caret motion or tab
      navigation as closely as possible. This also means that if the application's
      caret motion or focus navigation does not trigger a scroll operation, this
      method should not trigger one either. If the application does not have a caret
      motion or focus navigation operation, this method should try to scroll the new
      caret position into view while minimizing unnecessary scroll motion.
  
      Params:
        offset = the character offset of the new caret position
      Returns: true if successful, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetCaretOffset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetCaretOffset(int offset)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.setCaretOffset)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCaretOffset(cast(AtkText*)this._cPtr, offset);
    return _retval;
  }

  /**
      Changes the start and end offset of the specified selection.
  
      Params:
        selectionNum = The selection number.  The selected regions are
          assigned numbers that correspond to how far the region is from the
          start of the text.  The selected region closest to the beginning
          of the text region is assigned the number 0, etc.  Note that adding,
          moving or deleting a selected region can change the numbering.
        startOffset = the new starting character offset of the selection
        endOffset = the new end position of (e.g. offset immediately past)
          the selection
      Returns: true if successful, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetSelection(int selectionNum, int startOffset, int endOffset)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.setSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setSelection(cast(AtkText*)this._cPtr, selectionNum, startOffset, endOffset);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncTextAttributesChanged()
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.textAttributesChanged)
      return;

    _klass.textAttributesChanged(cast(AtkText*)this._cPtr);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncTextCaretMoved(int location)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.textCaretMoved)
      return;

    _klass.textCaretMoved(cast(AtkText*)this._cPtr, location);
  }

  /**
      the signal handler which is executed when there is a
        text change. This virtual function is deprecated sice 2.9.4 and
        it should not be overriden.
  
      Params:
        position = 
        length = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncTextChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncTextChanged(int position, int length)
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.textChanged)
      return;

    _klass.textChanged(cast(AtkText*)this._cPtr, position, length);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncTextSelectionChanged()
  {
    auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.text.Text._getGType);
    if (!_klass || !_klass.textSelectionChanged)
      return;

    _klass.textSelectionChanged(cast(AtkText*)this._cPtr);
  }

  /**
      Adds a selection bounded by the specified offsets.
  
      Params:
        startOffset = the starting character offset of the selected region
        endOffset = the offset of the first character after the selected region.
      Returns: true if successful, false otherwise
  */
  override bool addSelection(int startOffset, int endOffset) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_text_add_selection(cast(AtkText*)this._cPtr, startOffset, endOffset);
    return _retval;
  }

  /**
      Get the ranges of text in the specified bounding box.
  
      Params:
        rect = An AtkTextRectangle giving the dimensions of the bounding box.
        coordType = Specify whether coordinates are relative to the screen or widget window.
        xClipType = Specify the horizontal clip type.
        yClipType = Specify the vertical clip type.
      Returns: Array of AtkTextRange. The last
                 element of the array returned by this function will be NULL.
  */
  override gid.atk1.text_range.TextRange[] getBoundedRanges(gid.atk1.types.TextRectangle rect, gid.atk1.types.CoordType coordType, gid.atk1.types.TextClipType xClipType, gid.atk1.types.TextClipType yClipType) nothrow
  {
    AtkTextRange** _cretval;
    _cretval = atk_text_get_bounded_ranges(cast(AtkText*)this._cPtr, cast(AtkTextRectangle*)&rect, coordType, xClipType, yClipType);
    gid.atk1.text_range.TextRange[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new gid.atk1.text_range.TextRange[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gid.atk1.text_range.TextRange(cast(void*)_cretval[i], Yes.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the offset of the position of the caret (cursor).
      Returns: the character offset of the position of the caret or -1 if
                 the caret is not located inside the element or in the case of
                 any other failure.
  */
  override int getCaretOffset() nothrow
  {
    int _retval;
    _retval = atk_text_get_caret_offset(cast(AtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets the specified text.
  
      Params:
        offset = a character offset within text
      Returns: the character at offset or 0 in the case of failure.
  */
  override dchar getCharacterAtOffset(int offset) nothrow
  {
    dchar _retval;
    _retval = atk_text_get_character_at_offset(cast(AtkText*)this._cPtr, offset);
    return _retval;
  }

  /**
      Gets the character count.
      Returns: the number of characters or -1 in case of failure.
  */
  override int getCharacterCount() nothrow
  {
    int _retval;
    _retval = atk_text_get_character_count(cast(AtkText*)this._cPtr);
    return _retval;
  }

  /**
      If the extent can not be obtained (e.g. missing support), all of x, y, width,
      height are set to -1.
      
      Get the bounding box containing the glyph representing the character at
          a particular text offset.
  
      Params:
        offset = The offset of the text character for which bounding information is required.
        x = Pointer for the x coordinate of the bounding box
        y = Pointer for the y coordinate of the bounding box
        width = Pointer for the width of the bounding box
        height = Pointer for the height of the bounding box
        coords = specify whether coordinates are relative to the screen or widget window
  */
  override void getCharacterExtents(int offset, out int x, out int y, out int width, out int height, gid.atk1.types.CoordType coords) nothrow
  {
    atk_text_get_character_extents(cast(AtkText*)this._cPtr, offset, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height, coords);
  }

  /**
      Gets the number of selected regions.
      Returns: The number of selected regions, or -1 in the case of failure.
  */
  override int getNSelections() nothrow
  {
    int _retval;
    _retval = atk_text_get_n_selections(cast(AtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets the offset of the character located at coordinates `x` and `y`. `x` and `y`
      are interpreted as being relative to the screen or this widget's window
      depending on coords.
  
      Params:
        x = screen x-position of character
        y = screen y-position of character
        coords = specify whether coordinates are relative to the screen or
          widget window
      Returns: the offset to the character which is located at  the specified
                 `x` and `y` coordinates of -1 in case of failure.
  */
  override int getOffsetAtPoint(int x, int y, gid.atk1.types.CoordType coords) nothrow
  {
    int _retval;
    _retval = atk_text_get_offset_at_point(cast(AtkText*)this._cPtr, x, y, coords);
    return _retval;
  }

  /**
      Get the bounding box for text within the specified range.
      
      If the extents can not be obtained (e.g. or missing support), the rectangle
      fields are set to -1.
  
      Params:
        startOffset = The offset of the first text character for which boundary
                 information is required.
        endOffset = The offset of the text character after the last character
                 for which boundary information is required.
        coordType = Specify whether coordinates are relative to the screen or widget window.
        rect = A pointer to a AtkTextRectangle which is filled in by this function.
  */
  override void getRangeExtents(int startOffset, int endOffset, gid.atk1.types.CoordType coordType, out gid.atk1.types.TextRectangle rect) nothrow
  {
    atk_text_get_range_extents(cast(AtkText*)this._cPtr, startOffset, endOffset, coordType, cast(AtkTextRectangle*)&rect);
  }

  /**
      Gets the text from the specified selection.
  
      Params:
        selectionNum = The selection number.  The selected regions are
          assigned numbers that correspond to how far the region is from the
          start of the text.  The selected region closest to the beginning
          of the text region is assigned the number 0, etc.  Note that adding,
          moving or deleting a selected region can change the numbering.
        startOffset = passes back the starting character offset of the selected region
        endOffset = passes back the ending character offset (offset immediately past)
          of the selected region
      Returns: a newly allocated string containing the selected text. Use [gid.glib2.global.gfree]
                 to free the returned string.
  */
  override string getSelection(int selectionNum, out int startOffset, out int endOffset) nothrow
  {
    char* _cretval;
    _cretval = atk_text_get_selection(cast(AtkText*)this._cPtr, selectionNum, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets a portion of the text exposed through an #AtkText according to a given offset
      and a specific granularity, along with the start and end offsets defining the
      boundaries of such a portion of text.
      
      If granularity is ATK_TEXT_GRANULARITY_CHAR the character at the
      offset is returned.
      
      If granularity is ATK_TEXT_GRANULARITY_WORD the returned string
      is from the word start at or before the offset to the word start after
      the offset.
      
      The returned string will contain the word at the offset if the offset
      is inside a word and will contain the word before the offset if the
      offset is not inside a word.
      
      If granularity is ATK_TEXT_GRANULARITY_SENTENCE the returned string
      is from the sentence start at or before the offset to the sentence
      start after the offset.
      
      The returned string will contain the sentence at the offset if the offset
      is inside a sentence and will contain the sentence before the offset
      if the offset is not inside a sentence.
      
      If granularity is ATK_TEXT_GRANULARITY_LINE the returned string
      is from the line start at or before the offset to the line
      start after the offset.
      
      If granularity is ATK_TEXT_GRANULARITY_PARAGRAPH the returned string
      is from the start of the paragraph at or before the offset to the start
      of the following paragraph after the offset.
  
      Params:
        offset = position
        granularity = An #AtkTextGranularity
        startOffset = the starting character offset of the returned string, or -1
                         in the case of error (e.g. invalid offset, not implemented)
        endOffset = the offset of the first character after the returned string,
                       or -1 in the case of error (e.g. invalid offset, not implemented)
      Returns: a newly allocated string containing the text at
                 the offset bounded by the specified granularity. Use [gid.glib2.global.gfree]
                 to free the returned string.  Returns null if the offset is invalid
                 or no implementation is available.
  */
  override string getStringAtOffset(int offset, gid.atk1.types.TextGranularity granularity, out int startOffset, out int endOffset) nothrow
  {
    char* _cretval;
    _cretval = atk_text_get_string_at_offset(cast(AtkText*)this._cPtr, offset, granularity, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the specified text.
  
      Params:
        startOffset = a starting character offset within text
        endOffset = an ending character offset within text, or -1 for the end of the string.
      Returns: a newly allocated string containing the text from start_offset up
                 to, but not including end_offset. Use [gid.glib2.global.gfree] to free the returned
                 string.
  */
  override string getText(int startOffset, int endOffset) nothrow
  {
    char* _cretval;
    _cretval = atk_text_get_text(cast(AtkText*)this._cPtr, startOffset, endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the specified text.
  
      Params:
        offset = position
        boundaryType = An #AtkTextBoundary
        startOffset = the starting character offset of the returned string
        endOffset = the offset of the first character after the
                       returned substring
      Returns: a newly allocated string containing the text after offset bounded
                 by the specified boundary_type. Use [gid.glib2.global.gfree] to free the returned
                 string.
  
      Deprecated: Please use [gid.atk1.text.Text.getStringAtOffset] instead.
  */
  override string getTextAfterOffset(int offset, gid.atk1.types.TextBoundary boundaryType, out int startOffset, out int endOffset) nothrow
  {
    char* _cretval;
    _cretval = atk_text_get_text_after_offset(cast(AtkText*)this._cPtr, offset, boundaryType, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the specified text.
      
      If the boundary_type if ATK_TEXT_BOUNDARY_CHAR the character at the
      offset is returned.
      
      If the boundary_type is ATK_TEXT_BOUNDARY_WORD_START the returned string
      is from the word start at or before the offset to the word start after
      the offset.
      
      The returned string will contain the word at the offset if the offset
      is inside a word and will contain the word before the offset if the
      offset is not inside a word.
      
      If the boundary type is ATK_TEXT_BOUNDARY_SENTENCE_START the returned
      string is from the sentence start at or before the offset to the sentence
      start after the offset.
      
      The returned string will contain the sentence at the offset if the offset
      is inside a sentence and will contain the sentence before the offset
      if the offset is not inside a sentence.
      
      If the boundary type is ATK_TEXT_BOUNDARY_LINE_START the returned
      string is from the line start at or before the offset to the line
      start after the offset.
  
      Params:
        offset = position
        boundaryType = An #AtkTextBoundary
        startOffset = the starting character offset of the returned string
        endOffset = the offset of the first character after the
                       returned substring
      Returns: a newly allocated string containing the text at offset bounded
                 by the specified boundary_type. Use [gid.glib2.global.gfree] to free the returned
                 string.
  
      Deprecated: This method is deprecated since ATK version
        2.9.4. Please use [gid.atk1.text.Text.getStringAtOffset] instead.
  */
  override string getTextAtOffset(int offset, gid.atk1.types.TextBoundary boundaryType, out int startOffset, out int endOffset) nothrow
  {
    char* _cretval;
    _cretval = atk_text_get_text_at_offset(cast(AtkText*)this._cPtr, offset, boundaryType, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the specified text.
  
      Params:
        offset = position
        boundaryType = An #AtkTextBoundary
        startOffset = the starting character offset of the returned string
        endOffset = the offset of the first character after the
                       returned substring
      Returns: a newly allocated string containing the text before offset bounded
                 by the specified boundary_type. Use [gid.glib2.global.gfree] to free the returned
                 string.
  
      Deprecated: Please use [gid.atk1.text.Text.getStringAtOffset] instead.
  */
  override string getTextBeforeOffset(int offset, gid.atk1.types.TextBoundary boundaryType, out int startOffset, out int endOffset) nothrow
  {
    char* _cretval;
    _cretval = atk_text_get_text_before_offset(cast(AtkText*)this._cPtr, offset, boundaryType, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Removes the specified selection.
  
      Params:
        selectionNum = The selection number.  The selected regions are
          assigned numbers that correspond to how far the region is from the
          start of the text.  The selected region closest to the beginning
          of the text region is assigned the number 0, etc.  Note that adding,
          moving or deleting a selected region can change the numbering.
      Returns: true if successful, false otherwise
  */
  override bool textRemoveSelection(int selectionNum) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_text_remove_selection(cast(AtkText*)this._cPtr, selectionNum);
    return _retval;
  }

  /**
      Makes a substring of text visible on the screen by scrolling all necessary parents.
  
      Params:
        startOffset = start offset in the text
        endOffset = end offset in the text, or -1 for the end of the text.
        type = specify where the object should be made visible.
      Returns: whether scrolling was successful.
  */
  override bool scrollSubstringTo(int startOffset, int endOffset, gid.atk1.types.ScrollType type) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_text_scroll_substring_to(cast(AtkText*)this._cPtr, startOffset, endOffset, type);
    return _retval;
  }

  /**
      Move the top-left of a substring of text to a given position of the screen
      by scrolling all necessary parents.
  
      Params:
        startOffset = start offset in the text
        endOffset = end offset in the text, or -1 for the end of the text.
        coords = specify whether coordinates are relative to the screen or to the
          parent object.
        x = x-position where to scroll to
        y = y-position where to scroll to
      Returns: whether scrolling was successful.
  */
  override bool scrollSubstringToPoint(int startOffset, int endOffset, gid.atk1.types.CoordType coords, int x, int y) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_text_scroll_substring_to_point(cast(AtkText*)this._cPtr, startOffset, endOffset, coords, x, y);
    return _retval;
  }

  /**
      Sets the caret (cursor) position to the specified offset.
      
      In the case of rich-text content, this method should either grab focus
      or move the sequential focus navigation starting point (if the application
      supports this concept) as if the user had clicked on the new caret position.
      Typically, this means that the target of this operation is the node containing
      the new caret position or one of its ancestors. In other words, after this
      method is called, if the user advances focus, it should move to the first
      focusable node following the new caret position.
      
      Calling this method should also scroll the application viewport in a way
      that matches the behavior of the application's typical caret motion or tab
      navigation as closely as possible. This also means that if the application's
      caret motion or focus navigation does not trigger a scroll operation, this
      method should not trigger one either. If the application does not have a caret
      motion or focus navigation operation, this method should try to scroll the new
      caret position into view while minimizing unnecessary scroll motion.
  
      Params:
        offset = the character offset of the new caret position
      Returns: true if successful, false otherwise.
  */
  override bool setCaretOffset(int offset) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_text_set_caret_offset(cast(AtkText*)this._cPtr, offset);
    return _retval;
  }

  /**
      Changes the start and end offset of the specified selection.
  
      Params:
        selectionNum = The selection number.  The selected regions are
          assigned numbers that correspond to how far the region is from the
          start of the text.  The selected region closest to the beginning
          of the text region is assigned the number 0, etc.  Note that adding,
          moving or deleting a selected region can change the numbering.
        startOffset = the new starting character offset of the selection
        endOffset = the new end position of (e.g. offset immediately past)
          the selection
      Returns: true if successful, false otherwise
  */
  override bool setSelection(int selectionNum, int startOffset, int endOffset) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_text_set_selection(cast(AtkText*)this._cPtr, selectionNum, startOffset, endOffset);
    return _retval;
  }

  /**
      Connect to `TextAttributesChanged` signal.
  
      The "text-attributes-changed" signal is emitted when the text
        attributes of the text of an object which implements AtkText
        changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.atk1.text.Text text)`
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTextAttributesChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.atk1.text.Text)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.textAttributesChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-attributes-changed", closure, after);
  }

  /**
      Connect to `TextCaretMoved` signal.
  
      The "text-caret-moved" signal is emitted when the caret
        position of the text of an object which implements AtkText
        changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int arg1, gid.atk1.text.Text text)`
  
          `arg1` The new position of the text caret. (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTextCaretMoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.atk1.text.Text)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.textCaretMoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-caret-moved", closure, after);
  }

  /**
      Connect to `TextChanged` signal.
  
      The "text-changed" signal is emitted when the text of the
        object which implements the AtkText interface changes, This
        signal will have a detail which is either "insert" or
        "delete" which identifies whether the text change was an
        insertion or a deletion.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(int arg1, int arg2, gid.atk1.text.Text text)`
  
          `arg1` The position (character offset) of the insertion or deletion. (optional)
  
          `arg2` The length (in characters) of text inserted or deleted. (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use #AtkObject::text-insert or
        #AtkObject::text-remove instead.
  */
  gulong connectTextChanged(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.atk1.text.Text)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.textChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `TextInsert` signal.
  
      The "text-insert" signal is emitted when a new text is
        inserted. If the signal was not triggered by the user
        (e.g. typing or pasting text), the "system" detail should be
        included.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(int arg1, int arg2, string arg3, gid.atk1.text.Text text)`
  
          `arg1` The position (character offset) of the insertion. (optional)
  
          `arg2` The length (in characters) of text inserted. (optional)
  
          `arg3` The new text inserted (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTextInsert(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == string)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.atk1.text.Text)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.textInsert");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-insert"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `TextRemove` signal.
  
      The "text-remove" signal is emitted when a new text is
        removed. If the signal was not triggered by the user
        (e.g. typing or pasting text), the "system" detail should be
        included.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(int arg1, int arg2, string arg3, gid.atk1.text.Text text)`
  
          `arg1` The position (character offset) of the removal. (optional)
  
          `arg2` The length (in characters) of text removed. (optional)
  
          `arg3` The old text removed (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTextRemove(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == string)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.atk1.text.Text)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.textRemove");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-remove"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `TextSelectionChanged` signal.
  
      The "text-selection-changed" signal is emitted when the
        selected text of an object which implements AtkText changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.atk1.text.Text text)`
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTextSelectionChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.atk1.text.Text)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.textSelectionChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-selection-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.text.Text (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_text_Text(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextAddSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCaretOffset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCharacterAtOffset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCharacterCount", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCharacterExtents", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNSelections", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetOffsetAtPoint", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRangeExtents", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStringAtOffset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetText", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextAfterOffset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextAtOffset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextBeforeOffset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextRemoveSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncScrollSubstringTo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncScrollSubstringToPoint", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCaretOffset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextAttributesChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextCaretMoved", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextSelectionChanged", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.text.Text vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_text_Text(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextAddSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "add_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCaretOffset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_caret_offset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCharacterAtOffset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_character_at_offset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCharacterCount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_character_count");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCharacterExtents", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_character_extents");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNSelections", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_n_selections");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetOffsetAtPoint", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_offset_at_point");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRangeExtents", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_range_extents");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStringAtOffset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_string_at_offset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetText", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_text");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextAfterOffset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_text_after_offset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextAtOffset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_text_at_offset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextBeforeOffset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "get_text_before_offset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextRemoveSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "remove_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncScrollSubstringTo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "scroll_substring_to");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncScrollSubstringToPoint", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "scroll_substring_to_point");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCaretOffset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "set_caret_offset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "set_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextAttributesChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "text_attributes_changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextCaretMoved", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "text_caret_moved");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "text_changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTextSelectionChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_text_Text(iface, "text_selection_changed");
  }

  private static void _installIfaceVfunc_gid_atk1_text_Text(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkTextIface*)iface;

    switch (vfunc)
    {
      case "add_selection":
      {
        static extern(C) gboolean _vfuncTextAddSelectionTramp(AtkText* text, int startOffset, int endOffset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.addSelection)
              return (cast(typeof(&_vfuncTextAddSelectionTramp))_klass.addSelection)(text, startOffset, endOffset);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncTextAddSelection(startOffset, endOffset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncTextAddSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.addSelection = cast(typeof(_klass.addSelection))&_vfuncTextAddSelectionTramp;
        break;
      }
      case "get_caret_offset":
      {
        static extern(C) int _vfuncGetCaretOffsetTramp(AtkText* text) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getCaretOffset)
              return (cast(typeof(&_vfuncGetCaretOffsetTramp))_klass.getCaretOffset)(text);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetCaretOffset();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetCaretOffset");
          }
          return _retval;
        }

        _klass.getCaretOffset = cast(typeof(_klass.getCaretOffset))&_vfuncGetCaretOffsetTramp;
        break;
      }
      case "get_character_at_offset":
      {
        static extern(C) dchar _vfuncGetCharacterAtOffsetTramp(AtkText* text, int offset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getCharacterAtOffset)
              return (cast(typeof(&_vfuncGetCharacterAtOffsetTramp))_klass.getCharacterAtOffset)(text, offset);
            return typeof(return).init;
          }

          dchar _retval;

          try
          {
            _retval = _obj.vfuncGetCharacterAtOffset(offset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetCharacterAtOffset");
          }
          return _retval;
        }

        _klass.getCharacterAtOffset = cast(typeof(_klass.getCharacterAtOffset))&_vfuncGetCharacterAtOffsetTramp;
        break;
      }
      case "get_character_count":
      {
        static extern(C) int _vfuncGetCharacterCountTramp(AtkText* text) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getCharacterCount)
              return (cast(typeof(&_vfuncGetCharacterCountTramp))_klass.getCharacterCount)(text);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetCharacterCount();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetCharacterCount");
          }
          return _retval;
        }

        _klass.getCharacterCount = cast(typeof(_klass.getCharacterCount))&_vfuncGetCharacterCountTramp;
        break;
      }
      case "get_character_extents":
      {
        static extern(C) void _vfuncGetCharacterExtentsTramp(AtkText* text, int offset, int* x, int* y, int* width, int* height, AtkCoordType coords) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getCharacterExtents)
              return (cast(typeof(&_vfuncGetCharacterExtentsTramp))_klass.getCharacterExtents)(text, offset, x, y, width, height, coords);
            return;
          }

          typeof(*x) _xNull;
          if (!x)
            x = &_xNull;

          typeof(*y) _yNull;
          if (!y)
            y = &_yNull;

          typeof(*width) _widthNull;
          if (!width)
            width = &_widthNull;

          typeof(*height) _heightNull;
          if (!height)
            height = &_heightNull;

          try
          {
            _obj.vfuncGetCharacterExtents(offset, *x, *y, *width, *height, coords);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetCharacterExtents");
          }
        }

        _klass.getCharacterExtents = cast(typeof(_klass.getCharacterExtents))&_vfuncGetCharacterExtentsTramp;
        break;
      }
      case "get_n_selections":
      {
        static extern(C) int _vfuncGetNSelectionsTramp(AtkText* text) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getNSelections)
              return (cast(typeof(&_vfuncGetNSelectionsTramp))_klass.getNSelections)(text);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetNSelections();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetNSelections");
          }
          return _retval;
        }

        _klass.getNSelections = cast(typeof(_klass.getNSelections))&_vfuncGetNSelectionsTramp;
        break;
      }
      case "get_offset_at_point":
      {
        static extern(C) int _vfuncGetOffsetAtPointTramp(AtkText* text, int x, int y, AtkCoordType coords) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getOffsetAtPoint)
              return (cast(typeof(&_vfuncGetOffsetAtPointTramp))_klass.getOffsetAtPoint)(text, x, y, coords);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetOffsetAtPoint(x, y, coords);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetOffsetAtPoint");
          }
          return _retval;
        }

        _klass.getOffsetAtPoint = cast(typeof(_klass.getOffsetAtPoint))&_vfuncGetOffsetAtPointTramp;
        break;
      }
      case "get_range_extents":
      {
        static extern(C) void _vfuncGetRangeExtentsTramp(AtkText* text, int startOffset, int endOffset, AtkCoordType coordType, AtkTextRectangle* rect) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getRangeExtents)
              return (cast(typeof(&_vfuncGetRangeExtentsTramp))_klass.getRangeExtents)(text, startOffset, endOffset, coordType, rect);
            return;
          }

          try
          {
            _obj.vfuncGetRangeExtents(startOffset, endOffset, coordType, *cast(gid.atk1.types.TextRectangle*)rect);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetRangeExtents");
          }
        }

        _klass.getRangeExtents = cast(typeof(_klass.getRangeExtents))&_vfuncGetRangeExtentsTramp;
        break;
      }
      case "get_selection":
      {
        static extern(C) char* _vfuncGetSelectionTramp(AtkText* text, int selectionNum, int* startOffset, int* endOffset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getSelection)
              return (cast(typeof(&_vfuncGetSelectionTramp))_klass.getSelection)(text, selectionNum, startOffset, endOffset);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetSelection(selectionNum, *startOffset, *endOffset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetSelection");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getSelection = cast(typeof(_klass.getSelection))&_vfuncGetSelectionTramp;
        break;
      }
      case "get_string_at_offset":
      {
        static extern(C) char* _vfuncGetStringAtOffsetTramp(AtkText* text, int offset, AtkTextGranularity granularity, int* startOffset, int* endOffset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getStringAtOffset)
              return (cast(typeof(&_vfuncGetStringAtOffsetTramp))_klass.getStringAtOffset)(text, offset, granularity, startOffset, endOffset);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetStringAtOffset(offset, granularity, *startOffset, *endOffset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetStringAtOffset");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getStringAtOffset = cast(typeof(_klass.getStringAtOffset))&_vfuncGetStringAtOffsetTramp;
        break;
      }
      case "get_text":
      {
        static extern(C) char* _vfuncGetTextTramp(AtkText* text, int startOffset, int endOffset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getText)
              return (cast(typeof(&_vfuncGetTextTramp))_klass.getText)(text, startOffset, endOffset);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetText(startOffset, endOffset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetText");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getText = cast(typeof(_klass.getText))&_vfuncGetTextTramp;
        break;
      }
      case "get_text_after_offset":
      {
        static extern(C) char* _vfuncGetTextAfterOffsetTramp(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getTextAfterOffset)
              return (cast(typeof(&_vfuncGetTextAfterOffsetTramp))_klass.getTextAfterOffset)(text, offset, boundaryType, startOffset, endOffset);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetTextAfterOffset(offset, boundaryType, *startOffset, *endOffset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetTextAfterOffset");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getTextAfterOffset = cast(typeof(_klass.getTextAfterOffset))&_vfuncGetTextAfterOffsetTramp;
        break;
      }
      case "get_text_at_offset":
      {
        static extern(C) char* _vfuncGetTextAtOffsetTramp(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getTextAtOffset)
              return (cast(typeof(&_vfuncGetTextAtOffsetTramp))_klass.getTextAtOffset)(text, offset, boundaryType, startOffset, endOffset);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetTextAtOffset(offset, boundaryType, *startOffset, *endOffset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetTextAtOffset");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getTextAtOffset = cast(typeof(_klass.getTextAtOffset))&_vfuncGetTextAtOffsetTramp;
        break;
      }
      case "get_text_before_offset":
      {
        static extern(C) char* _vfuncGetTextBeforeOffsetTramp(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.getTextBeforeOffset)
              return (cast(typeof(&_vfuncGetTextBeforeOffsetTramp))_klass.getTextBeforeOffset)(text, offset, boundaryType, startOffset, endOffset);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetTextBeforeOffset(offset, boundaryType, *startOffset, *endOffset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncGetTextBeforeOffset");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getTextBeforeOffset = cast(typeof(_klass.getTextBeforeOffset))&_vfuncGetTextBeforeOffsetTramp;
        break;
      }
      case "remove_selection":
      {
        static extern(C) gboolean _vfuncTextRemoveSelectionTramp(AtkText* text, int selectionNum) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.removeSelection)
              return (cast(typeof(&_vfuncTextRemoveSelectionTramp))_klass.removeSelection)(text, selectionNum);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncTextRemoveSelection(selectionNum);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncTextRemoveSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.removeSelection = cast(typeof(_klass.removeSelection))&_vfuncTextRemoveSelectionTramp;
        break;
      }
      case "scroll_substring_to":
      {
        static extern(C) gboolean _vfuncScrollSubstringToTramp(AtkText* text, int startOffset, int endOffset, AtkScrollType type) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.scrollSubstringTo)
              return (cast(typeof(&_vfuncScrollSubstringToTramp))_klass.scrollSubstringTo)(text, startOffset, endOffset, type);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncScrollSubstringTo(startOffset, endOffset, type);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncScrollSubstringTo");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.scrollSubstringTo = cast(typeof(_klass.scrollSubstringTo))&_vfuncScrollSubstringToTramp;
        break;
      }
      case "scroll_substring_to_point":
      {
        static extern(C) gboolean _vfuncScrollSubstringToPointTramp(AtkText* text, int startOffset, int endOffset, AtkCoordType coords, int x, int y) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.scrollSubstringToPoint)
              return (cast(typeof(&_vfuncScrollSubstringToPointTramp))_klass.scrollSubstringToPoint)(text, startOffset, endOffset, coords, x, y);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncScrollSubstringToPoint(startOffset, endOffset, coords, x, y);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncScrollSubstringToPoint");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.scrollSubstringToPoint = cast(typeof(_klass.scrollSubstringToPoint))&_vfuncScrollSubstringToPointTramp;
        break;
      }
      case "set_caret_offset":
      {
        static extern(C) gboolean _vfuncSetCaretOffsetTramp(AtkText* text, int offset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.setCaretOffset)
              return (cast(typeof(&_vfuncSetCaretOffsetTramp))_klass.setCaretOffset)(text, offset);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetCaretOffset(offset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncSetCaretOffset");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setCaretOffset = cast(typeof(_klass.setCaretOffset))&_vfuncSetCaretOffsetTramp;
        break;
      }
      case "set_selection":
      {
        static extern(C) gboolean _vfuncSetSelectionTramp(AtkText* text, int selectionNum, int startOffset, int endOffset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.setSelection)
              return (cast(typeof(&_vfuncSetSelectionTramp))_klass.setSelection)(text, selectionNum, startOffset, endOffset);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetSelection(selectionNum, startOffset, endOffset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncSetSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setSelection = cast(typeof(_klass.setSelection))&_vfuncSetSelectionTramp;
        break;
      }
      case "text_attributes_changed":
      {
        static extern(C) void _vfuncTextAttributesChangedTramp(AtkText* text) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.textAttributesChanged)
              return (cast(typeof(&_vfuncTextAttributesChangedTramp))_klass.textAttributesChanged)(text);
            return;
          }

          try
          {
            _obj.vfuncTextAttributesChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncTextAttributesChanged");
          }
        }

        _klass.textAttributesChanged = cast(typeof(_klass.textAttributesChanged))&_vfuncTextAttributesChangedTramp;
        break;
      }
      case "text_caret_moved":
      {
        static extern(C) void _vfuncTextCaretMovedTramp(AtkText* text, int location) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.textCaretMoved)
              return (cast(typeof(&_vfuncTextCaretMovedTramp))_klass.textCaretMoved)(text, location);
            return;
          }

          try
          {
            _obj.vfuncTextCaretMoved(location);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncTextCaretMoved");
          }
        }

        _klass.textCaretMoved = cast(typeof(_klass.textCaretMoved))&_vfuncTextCaretMovedTramp;
        break;
      }
      case "text_changed":
      {
        static extern(C) void _vfuncTextChangedTramp(AtkText* text, int position, int length) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.textChanged)
              return (cast(typeof(&_vfuncTextChangedTramp))_klass.textChanged)(text, position, length);
            return;
          }

          try
          {
            _obj.vfuncTextChanged(position, length);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncTextChanged");
          }
        }

        _klass.textChanged = cast(typeof(_klass.textChanged))&_vfuncTextChangedTramp;
        break;
      }
      case "text_selection_changed":
      {
        static extern(C) void _vfuncTextSelectionChangedTramp(AtkText* text) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.text.Text._getGType);
            if (_klass && _klass.textSelectionChanged)
              return (cast(typeof(&_vfuncTextSelectionChangedTramp))_klass.textSelectionChanged)(text);
            return;
          }

          try
          {
            _obj.vfuncTextSelectionChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.text.Text.vfuncTextSelectionChanged");
          }
        }

        _klass.textSelectionChanged = cast(typeof(_klass.textSelectionChanged))&_vfuncTextSelectionChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.text.Text]
template TextGidBuilderT()
{
}
