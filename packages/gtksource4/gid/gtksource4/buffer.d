/// Module for [Buffer] class
module gid.gtksource4.buffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.text_buffer;
import gid.gtk3.text_iter;
import gid.gtk3.text_mark;
import gid.gtk3.text_tag_table;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.language;
import gid.gtksource4.mark;
import gid.gtksource4.style_scheme;
import gid.gtksource4.types;
import gid.gtksource4.undo_manager;

/** */
class Buffer : gid.gtk3.text_buffer.TextBuffer
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_buffer_get_type != &gidSymbolNotFound ? gtk_source_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceBuffer";
  }

  /** Returns `this`, for use in `with` statements. */
  override Buffer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.buffer.Buffer]
      Returns: New builder object
  */
  static BufferGidBuilder builder() nothrow
  {
    return new BufferGidBuilder;
  }

  /**
      Get `highlightMatchingBrackets` property.
      Returns: Whether to highlight matching brackets in the buffer.
  */
  @property bool highlightMatchingBrackets() nothrow
  {
    return getHighlightMatchingBrackets();
  }

  /**
      Set `highlightMatchingBrackets` property.
      Params:
        propval = Whether to highlight matching brackets in the buffer.
  */
  @property void highlightMatchingBrackets(bool propval) nothrow
  {
    setHighlightMatchingBrackets(propval);
  }

  /**
      Get `highlightSyntax` property.
      Returns: Whether to highlight syntax in the buffer.
  */
  @property bool highlightSyntax() nothrow
  {
    return getHighlightSyntax();
  }

  /**
      Set `highlightSyntax` property.
      Params:
        propval = Whether to highlight syntax in the buffer.
  */
  @property void highlightSyntax(bool propval) nothrow
  {
    setHighlightSyntax(propval);
  }

  /**
      Get `implicitTrailingNewline` property.
      Returns: Whether the buffer has an implicit trailing newline. See
        [gid.gtksource5.buffer.Buffer.setImplicitTrailingNewline].
  */
  @property bool implicitTrailingNewline() nothrow
  {
    return getImplicitTrailingNewline();
  }

  /**
      Set `implicitTrailingNewline` property.
      Params:
        propval = Whether the buffer has an implicit trailing newline. See
          [gid.gtksource5.buffer.Buffer.setImplicitTrailingNewline].
  */
  @property void implicitTrailingNewline(bool propval) nothrow
  {
    setImplicitTrailingNewline(propval);
  }

  /** */
  @property gid.gtksource4.language.Language language() nothrow
  {
    return getLanguage();
  }

  /** */
  @property void language(gid.gtksource4.language.Language propval) nothrow
  {
    setLanguage(propval);
  }

  /**
      Get `maxUndoLevels` property.
      Returns: Number of undo levels for the buffer. -1 means no limit. This property
        will only affect the default undo manager.
  */
  @property int maxUndoLevels() nothrow
  {
    return getMaxUndoLevels();
  }

  /**
      Set `maxUndoLevels` property.
      Params:
        propval = Number of undo levels for the buffer. -1 means no limit. This property
          will only affect the default undo manager.
  */
  @property void maxUndoLevels(int propval) nothrow
  {
    setMaxUndoLevels(propval);
  }

  /**
      Get `styleScheme` property.
      Returns: Style scheme. It contains styles for syntax highlighting, optionally
        foreground, background, cursor color, current line color, and matching
        brackets style.
  */
  @property gid.gtksource4.style_scheme.StyleScheme styleScheme() nothrow
  {
    return getStyleScheme();
  }

  /**
      Set `styleScheme` property.
      Params:
        propval = Style scheme. It contains styles for syntax highlighting, optionally
          foreground, background, cursor color, current line color, and matching
          brackets style.
  */
  @property void styleScheme(gid.gtksource4.style_scheme.StyleScheme propval) nothrow
  {
    setStyleScheme(propval);
  }

  /** */
  @property gid.gtksource4.undo_manager.UndoManager undoManager() nothrow
  {
    return getUndoManager();
  }

  /** */
  @property void undoManager(gid.gtksource4.undo_manager.UndoManager propval) nothrow
  {
    setUndoManager(propval);
  }

  /**
      Creates a new source buffer.
  
      Params:
        table = a #GtkTextTagTable, or null to create a new one.
      Returns: a new source buffer.
  */
  this(gid.gtk3.text_tag_table.TextTagTable table = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, table !is null), Yes.Take);
    }
    else
    {
      GtkSourceBuffer* _cretval;
      _cretval = gtk_source_buffer_new(table ? cast(GtkTextTagTable*)table._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new source buffer using the highlighting patterns in
      language.  This is equivalent to creating a new source buffer with
      a new tag table and then calling [gid.gtksource5.buffer.Buffer.setLanguage].
  
      Params:
        language = a #GtkSourceLanguage.
      Returns: a new source buffer which will highlight text
        according to the highlighting patterns in language.
  */
  static gid.gtksource4.buffer.Buffer newWithLanguage(gid.gtksource4.language.Language language) nothrow
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_buffer_new_with_language(language ? cast(GtkSourceLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  protected void vfuncBracketMatched(gid.gtk3.text_iter.TextIter iter, gid.gtksource4.types.BracketMatchType state)
  {
    auto _klass = cast(GtkSourceBufferClass*)_vfuncClass;
    if (!_klass.bracketMatched)
      return;

    _klass.bracketMatched(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, state);
  }

  /**
      Redoes the last undo operation.  Use [gid.gtksource4.buffer.Buffer.canRedo]
      to check whether a call to this function will have any effect.
      
      This function emits the #GtkSourceBuffer::redo signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRedo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRedo()
  {
    auto _klass = cast(GtkSourceBufferClass*)_vfuncClass;
    if (!_klass.redo)
      return;

    _klass.redo(cast(GtkSourceBuffer*)this._cPtr);
  }

  /**
      Undoes the last user action which modified the buffer.  Use
      [gid.gtksource4.buffer.Buffer.canUndo] to check whether a call to this
      function will have any effect.
      
      This function emits the #GtkSourceBuffer::undo signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUndo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncUndo()
  {
    auto _klass = cast(GtkSourceBufferClass*)_vfuncClass;
    if (!_klass.undo)
      return;

    _klass.undo(cast(GtkSourceBuffer*)this._cPtr);
  }

  /**
      Moves iter to the position of the previous #GtkSourceMark of the given
      category. Returns true if iter was moved. If category is NULL, the
      previous source mark can be of any category.
  
      Params:
        iter = an iterator.
        category = category to search for, or null
      Returns: whether iter was moved.
  */
  bool backwardIterToSourceMark(gid.gtk3.text_iter.TextIter iter, string category = null) nothrow
  {
    bool _retval;
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    _retval = cast(bool)gtk_source_buffer_backward_iter_to_source_mark(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _category);
    return _retval;
  }

  /**
      Marks the beginning of a not undoable action on the buffer,
      disabling the undo manager.  Typically you would call this function
      before initially setting the contents of the buffer (e.g. when
      loading a file in a text editor).
      
      You may nest [gid.gtksource4.buffer.Buffer.beginNotUndoableAction] /
      [gid.gtksource4.buffer.Buffer.endNotUndoableAction] blocks.
  */
  void beginNotUndoableAction() nothrow
  {
    gtk_source_buffer_begin_not_undoable_action(cast(GtkSourceBuffer*)this._cPtr);
  }

  /**
      Determines whether a source buffer can redo the last action
      (i.e. if the last operation was an undo).
      Returns: true if a redo is possible.
  */
  bool canRedo() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_buffer_can_redo(cast(GtkSourceBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether a source buffer can undo the last action.
      Returns: true if it's possible to undo the last action.
  */
  bool canUndo() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_buffer_can_undo(cast(GtkSourceBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Changes the case of the text between the specified iterators.
  
      Params:
        caseType = how to change the case.
        start = a #GtkTextIter.
        end = a #GtkTextIter.
  */
  void changeCase(gid.gtksource4.types.ChangeCaseType caseType, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    gtk_source_buffer_change_case(cast(GtkSourceBuffer*)this._cPtr, caseType, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      Creates a source mark in the buffer of category category.  A source mark is
      a #GtkTextMark but organised into categories. Depending on the category
      a pixbuf can be specified that will be displayed along the line of the mark.
      
      Like a #GtkTextMark, a #GtkSourceMark can be anonymous if the
      passed name is null.  Also, the buffer owns the marks so you
      shouldn't unreference it.
      
      Marks always have left gravity and are moved to the beginning of
      the line when the user deletes the line they were in.
      
      Typical uses for a source mark are bookmarks, breakpoints, current
      executing instruction indication in a source file, etc..
  
      Params:
        name = the name of the mark, or null.
        category = a string defining the mark category.
        where = location to place the mark.
      Returns: a new #GtkSourceMark, owned by the buffer.
  */
  gid.gtksource4.mark.Mark createSourceMark(string name, string category, gid.gtk3.text_iter.TextIter where) nothrow
  {
    GtkSourceMark* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _category = category.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_source_buffer_create_source_mark(cast(GtkSourceBuffer*)this._cPtr, _name, _category, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.mark.Mark)(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Marks the end of a not undoable action on the buffer.  When the
      last not undoable block is closed through the call to this
      function, the list of undo actions is cleared and the undo manager
      is re-enabled.
  */
  void endNotUndoableAction() nothrow
  {
    gtk_source_buffer_end_not_undoable_action(cast(GtkSourceBuffer*)this._cPtr);
  }

  /**
      Forces buffer to analyze and highlight the given area synchronously.
      
      <note>
        <para>
          This is a potentially slow operation and should be used only
          when you need to make sure that some text not currently
          visible is highlighted, for instance before printing.
        </para>
      </note>
  
      Params:
        start = start of the area to highlight.
        end = end of the area to highlight.
  */
  void ensureHighlight(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    gtk_source_buffer_ensure_highlight(cast(GtkSourceBuffer*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Moves iter to the position of the next #GtkSourceMark of the given
      category. Returns true if iter was moved. If category is NULL, the
      next source mark can be of any category.
  
      Params:
        iter = an iterator.
        category = category to search for, or null
      Returns: whether iter was moved.
  */
  bool forwardIterToSourceMark(gid.gtk3.text_iter.TextIter iter, string category = null) nothrow
  {
    bool _retval;
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    _retval = cast(bool)gtk_source_buffer_forward_iter_to_source_mark(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _category);
    return _retval;
  }

  /**
      Get all defined context classes at iter.
      
      See the #GtkSourceBuffer description for the list of default context classes.
  
      Params:
        iter = a #GtkTextIter.
      Returns: a new null
        terminated array of context class names.
        Use [gid.glib2.global.strfreev] to free the array if it is no longer needed.
  */
  string[] getContextClassesAtIter(gid.gtk3.text_iter.TextIter iter) nothrow
  {
    char** _cretval;
    _cretval = gtk_source_buffer_get_context_classes_at_iter(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Determines whether bracket match highlighting is activated for the
      source buffer.
      Returns: true if the source buffer will highlight matching
        brackets.
  */
  bool getHighlightMatchingBrackets() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_buffer_get_highlight_matching_brackets(cast(GtkSourceBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether syntax highlighting is activated in the source
      buffer.
      Returns: true if syntax highlighting is enabled, false otherwise.
  */
  bool getHighlightSyntax() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_buffer_get_highlight_syntax(cast(GtkSourceBuffer*)this._cPtr);
    return _retval;
  }

  /** */
  bool getImplicitTrailingNewline() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_buffer_get_implicit_trailing_newline(cast(GtkSourceBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the #GtkSourceLanguage associated with the buffer,
      see [gid.gtksource5.buffer.Buffer.setLanguage].  The returned object should not be
      unreferenced by the user.
      Returns: the #GtkSourceLanguage associated
        with the buffer, or null.
  */
  gid.gtksource4.language.Language getLanguage() nothrow
  {
    GtkSourceLanguage* _cretval;
    _cretval = gtk_source_buffer_get_language(cast(GtkSourceBuffer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.language.Language)(cast(GtkSourceLanguage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines the number of undo levels the buffer will track for buffer edits.
      Returns: the maximum number of possible undo levels or -1 if no limit is set.
  */
  int getMaxUndoLevels() nothrow
  {
    int _retval;
    _retval = gtk_source_buffer_get_max_undo_levels(cast(GtkSourceBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the list of marks of the given category at iter. If category
      is null it returns all marks at iter.
  
      Params:
        iter = an iterator.
        category = category to search for, or null
      Returns: a newly allocated #GSList.
  */
  gid.gtksource4.mark.Mark[] getSourceMarksAtIter(gid.gtk3.text_iter.TextIter iter, string category = null) nothrow
  {
    GSList* _cretval;
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_source_buffer_get_source_marks_at_iter(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _category);
    auto _retval = gSListToD!(gid.gtksource4.mark.Mark, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns the list of marks of the given category at line.
      If category is null, all marks at line are returned.
  
      Params:
        line = a line number.
        category = category to search for, or null
      Returns: a newly allocated #GSList.
  */
  gid.gtksource4.mark.Mark[] getSourceMarksAtLine(int line, string category = null) nothrow
  {
    GSList* _cretval;
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_source_buffer_get_source_marks_at_line(cast(GtkSourceBuffer*)this._cPtr, line, _category);
    auto _retval = gSListToD!(gid.gtksource4.mark.Mark, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns the #GtkSourceStyleScheme associated with the buffer,
      see [gid.gtksource5.buffer.Buffer.setStyleScheme].
      The returned object should not be unreferenced by the user.
      Returns: the #GtkSourceStyleScheme
        associated with the buffer, or null.
  */
  gid.gtksource4.style_scheme.StyleScheme getStyleScheme() nothrow
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_buffer_get_style_scheme(cast(GtkSourceBuffer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkSourceUndoManager associated with the buffer,
      see [gid.gtksource4.buffer.Buffer.setUndoManager].  The returned object should not be
      unreferenced by the user.
      Returns: the #GtkSourceUndoManager associated
        with the buffer, or null.
  */
  gid.gtksource4.undo_manager.UndoManager getUndoManager() nothrow
  {
    GtkSourceUndoManager* _cretval;
    _cretval = gtk_source_buffer_get_undo_manager(cast(GtkSourceBuffer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.undo_manager.UndoManager)(cast(GtkSourceUndoManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Moves backward to the next toggle (on or off) of the context class. If no
      matching context class toggles are found, returns false, otherwise true.
      Does not return toggles located at iter, only toggles after iter. Sets
      iter to the location of the toggle, or to the end of the buffer if no
      toggle is found.
      
      See the #GtkSourceBuffer description for the list of default context classes.
  
      Params:
        iter = a #GtkTextIter.
        contextClass = the context class.
      Returns: whether we found a context class toggle before iter
  */
  bool iterBackwardToContextClassToggle(gid.gtk3.text_iter.TextIter iter, string contextClass) nothrow
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_source_buffer_iter_backward_to_context_class_toggle(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
      Moves forward to the next toggle (on or off) of the context class. If no
      matching context class toggles are found, returns false, otherwise true.
      Does not return toggles located at iter, only toggles after iter. Sets
      iter to the location of the toggle, or to the end of the buffer if no
      toggle is found.
      
      See the #GtkSourceBuffer description for the list of default context classes.
  
      Params:
        iter = a #GtkTextIter.
        contextClass = the context class.
      Returns: whether we found a context class toggle after iter
  */
  bool iterForwardToContextClassToggle(gid.gtk3.text_iter.TextIter iter, string contextClass) nothrow
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_source_buffer_iter_forward_to_context_class_toggle(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
      Check if the class context_class is set on iter.
      
      See the #GtkSourceBuffer description for the list of default context classes.
  
      Params:
        iter = a #GtkTextIter.
        contextClass = class to search for.
      Returns: whether iter has the context class.
  */
  bool iterHasContextClass(gid.gtk3.text_iter.TextIter iter, string contextClass) nothrow
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_source_buffer_iter_has_context_class(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
      Joins the lines of text between the specified iterators.
  
      Params:
        start = a #GtkTextIter.
        end = a #GtkTextIter.
  */
  void joinLines(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    gtk_source_buffer_join_lines(cast(GtkSourceBuffer*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      Redoes the last undo operation.  Use [gid.gtksource4.buffer.Buffer.canRedo]
      to check whether a call to this function will have any effect.
      
      This function emits the #GtkSourceBuffer::redo signal.
  */
  void redo() nothrow
  {
    gtk_source_buffer_redo(cast(GtkSourceBuffer*)this._cPtr);
  }

  /**
      Remove all marks of category between start and end from the buffer.
      If category is NULL, all marks in the range will be removed.
  
      Params:
        start = a #GtkTextIter.
        end = a #GtkTextIter.
        category = category to search for, or null.
  */
  void removeSourceMarks(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, string category = null) nothrow
  {
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    gtk_source_buffer_remove_source_marks(cast(GtkSourceBuffer*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null, _category);
  }

  /**
      Controls the bracket match highlighting function in the buffer.  If
      activated, when you position your cursor over a bracket character
      (a parenthesis, a square bracket, etc.) the matching opening or
      closing bracket character will be highlighted.
  
      Params:
        highlight = true if you want matching brackets highlighted.
  */
  void setHighlightMatchingBrackets(bool highlight) nothrow
  {
    gtk_source_buffer_set_highlight_matching_brackets(cast(GtkSourceBuffer*)this._cPtr, highlight);
  }

  /**
      Controls whether syntax is highlighted in the buffer.
      
      If highlight is true, the text will be highlighted according to the syntax
      patterns specified in the #GtkSourceLanguage set with
      [gid.gtksource5.buffer.Buffer.setLanguage].
      
      If highlight is false, syntax highlighting is disabled and all the
      #GtkTextTag objects that have been added by the syntax highlighting engine
      are removed from the buffer.
  
      Params:
        highlight = true to enable syntax highlighting, false to disable it.
  */
  void setHighlightSyntax(bool highlight) nothrow
  {
    gtk_source_buffer_set_highlight_syntax(cast(GtkSourceBuffer*)this._cPtr, highlight);
  }

  /**
      Sets whether the buffer has an implicit trailing newline.
      
      If an explicit trailing newline is present in a #GtkTextBuffer, #GtkTextView
      shows it as an empty line. This is generally not what the user expects.
      
      If implicit_trailing_newline is true (the default value):
       - when a #GtkSourceFileLoader loads the content of a file into the buffer,
         the trailing newline (if present in the file) is not inserted into the
         buffer.
       - when a #GtkSourceFileSaver saves the content of the buffer into a file, a
         trailing newline is added to the file.
      
      On the other hand, if implicit_trailing_newline is false, the file's
      content is not modified when loaded into the buffer, and the buffer's
      content is not modified when saved into a file.
  
      Params:
        implicitTrailingNewline = the new value.
  */
  void setImplicitTrailingNewline(bool implicitTrailingNewline) nothrow
  {
    gtk_source_buffer_set_implicit_trailing_newline(cast(GtkSourceBuffer*)this._cPtr, implicitTrailingNewline);
  }

  /**
      Associates a #GtkSourceLanguage with the buffer.
      
      Note that a #GtkSourceLanguage affects not only the syntax highlighting, but
      also the [context classes][context-classes]. If you want to disable just the
      syntax highlighting, see [gid.gtksource5.buffer.Buffer.setHighlightSyntax].
      
      The buffer holds a reference to language.
  
      Params:
        language = a #GtkSourceLanguage to set, or null.
  */
  void setLanguage(gid.gtksource4.language.Language language = null) nothrow
  {
    gtk_source_buffer_set_language(cast(GtkSourceBuffer*)this._cPtr, language ? cast(GtkSourceLanguage*)language._cPtr(No.Dup) : null);
  }

  /**
      Sets the number of undo levels for user actions the buffer will
      track.  If the number of user actions exceeds the limit set by this
      function, older actions will be discarded.
      
      If max_undo_levels is -1, the undo/redo is unlimited.
      
      If max_undo_levels is 0, the undo/redo is disabled.
  
      Params:
        maxUndoLevels = the desired maximum number of undo levels.
  */
  void setMaxUndoLevels(int maxUndoLevels) nothrow
  {
    gtk_source_buffer_set_max_undo_levels(cast(GtkSourceBuffer*)this._cPtr, maxUndoLevels);
  }

  /**
      Sets a #GtkSourceStyleScheme to be used by the buffer and the view.
      
      Note that a #GtkSourceStyleScheme affects not only the syntax highlighting,
      but also other #GtkSourceView features such as highlighting the current line,
      matching brackets, the line numbers, etc.
      
      Instead of setting a null scheme, it is better to disable syntax
      highlighting with [gid.gtksource5.buffer.Buffer.setHighlightSyntax], and setting the
      #GtkSourceStyleScheme with the "classic" or "tango" ID, because those two
      style schemes follow more closely the GTK+ theme (for example for the
      background color).
      
      The buffer holds a reference to scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme or null.
  */
  void setStyleScheme(gid.gtksource4.style_scheme.StyleScheme scheme = null) nothrow
  {
    gtk_source_buffer_set_style_scheme(cast(GtkSourceBuffer*)this._cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme._cPtr(No.Dup) : null);
  }

  /**
      Set the buffer undo manager. If manager is null the default undo manager
      will be set.
  
      Params:
        manager = A #GtkSourceUndoManager or null.
  */
  void setUndoManager(gid.gtksource4.undo_manager.UndoManager manager = null) nothrow
  {
    gtk_source_buffer_set_undo_manager(cast(GtkSourceBuffer*)this._cPtr, manager ? cast(GtkSourceUndoManager*)(cast(gid.gobject2.object.ObjectWrap)manager)._cPtr(No.Dup) : null);
  }

  /**
      Sort the lines of text between the specified iterators.
  
      Params:
        start = a #GtkTextIter.
        end = a #GtkTextIter.
        flags = #GtkSourceSortFlags specifying how the sort should behave
        column = sort considering the text starting at the given column
  */
  void sortLines(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtksource4.types.SortFlags flags, int column) nothrow
  {
    gtk_source_buffer_sort_lines(cast(GtkSourceBuffer*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null, flags, column);
  }

  /**
      Undoes the last user action which modified the buffer.  Use
      [gid.gtksource4.buffer.Buffer.canUndo] to check whether a call to this
      function will have any effect.
      
      This function emits the #GtkSourceBuffer::undo signal.
  */
  void undo() nothrow
  {
    gtk_source_buffer_undo(cast(GtkSourceBuffer*)this._cPtr);
  }

  /**
      Connect to `BracketMatched` signal.
  
      iter is set to a valid iterator pointing to the matching bracket
        if state is [gid.gtksource5.types.BracketMatchType.Found]. Otherwise iter is
        meaningless.
        
        The signal is emitted only when the state changes, typically when
        the cursor moves.
        
        A use-case for this signal is to show messages in a #GtkStatusbar.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_iter.TextIter iter, gid.gtksource4.types.BracketMatchType state, gid.gtksource4.buffer.Buffer buffer)`
  
          `iter` if found, the location of the matching bracket. (optional)
  
          `state` state of bracket matching. (optional)
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectBracketMatched(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtksource4.types.BracketMatchType)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource4.buffer.Buffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.buffer.Buffer.bracketMatched");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("bracket-matched", closure, after);
  }

  /**
      Connect to `HighlightUpdated` signal.
  
      The ::highlight-updated signal is emitted when the syntax
        highlighting and [context classes][context-classes] are updated in a
        certain region of the buffer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtksource4.buffer.Buffer buffer)`
  
          `start` the start of the updated region (optional)
  
          `end` the end of the updated region (optional)
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHighlightUpdated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource4.buffer.Buffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.buffer.Buffer.highlightUpdated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("highlight-updated", closure, after);
  }

  /**
      Connect to `Redo` signal.
  
      The ::redo signal is emitted to redo the last undo operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource4.buffer.Buffer buffer)`
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRedo(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.buffer.Buffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.buffer.Buffer.redo");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("redo", closure, after);
  }

  /**
      Connect to `SourceMarkUpdated` signal.
  
      The ::source-mark-updated signal is emitted each time
        a mark is added to, moved or removed from the buffer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_mark.TextMark mark, gid.gtksource4.buffer.Buffer buffer)`
  
          `mark` the #GtkSourceMark (optional)
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSourceMarkUpdated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_mark.TextMark)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtksource4.buffer.Buffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.buffer.Buffer.sourceMarkUpdated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("source-mark-updated", closure, after);
  }

  /**
      Connect to `Undo` signal.
  
      The ::undo signal is emitted to undo the last user action which
        modified the buffer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource4.buffer.Buffer buffer)`
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUndo(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.buffer.Buffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.buffer.Buffer.undo");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("undo", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Buffer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtksource4.buffer.Buffer), T.stringof ~ " is not derived from gid.gtksource4.buffer.Buffer");

    gid.gtk3.text_buffer.TextBuffer._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBracketMatched", true)[0]) == gid.gtksource4.buffer.Buffer))
      _installVfunc(klass, "bracket_matched");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRedo", true)[0]) == gid.gtksource4.buffer.Buffer))
      _installVfunc(klass, "redo");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUndo", true)[0]) == gid.gtksource4.buffer.Buffer))
      _installVfunc(klass, "undo");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceBufferClass*)klass;

    switch (vfunc)
    {
      case "bracket_matched":
      {
        static extern(C) void _vfuncBracketMatchedTramp(GtkSourceBuffer* buffer, GtkTextIter* iter, GtkSourceBracketMatchType state) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.buffer.Buffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.bracketMatched)
              return (cast(typeof(&_vfuncBracketMatchedTramp))_klass.bracketMatched)(buffer, iter, state);
            return;
          }

          auto _iter = iter ? new gid.gtk3.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncBracketMatched(_iter, state);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.buffer.Buffer.vfuncBracketMatched");
          }
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.bracketMatched = cast(typeof(_klass.bracketMatched))&_vfuncBracketMatchedTramp;
        break;
      }
      case "redo":
      {
        static extern(C) void _vfuncRedoTramp(GtkSourceBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.buffer.Buffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.redo)
              return (cast(typeof(&_vfuncRedoTramp))_klass.redo)(buffer);
            return;
          }

          try
          {
            _obj.vfuncRedo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.buffer.Buffer.vfuncRedo");
          }
        }

        _klass.redo = cast(typeof(_klass.redo))&_vfuncRedoTramp;
        break;
      }
      case "undo":
      {
        static extern(C) void _vfuncUndoTramp(GtkSourceBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.buffer.Buffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.undo)
              return (cast(typeof(&_vfuncUndoTramp))_klass.undo)(buffer);
            return;
          }

          try
          {
            _obj.vfuncUndo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.buffer.Buffer.vfuncUndo");
          }
        }

        _klass.undo = cast(typeof(_klass.undo))&_vfuncUndoTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource4.buffer.Buffer]
class BufferGidBuilderImpl(T) : gid.gtk3.text_buffer.TextBufferGidBuilderImpl!T
{

  /**
      Set `highlightMatchingBrackets` property.
      Params:
        propval = Whether to highlight matching brackets in the buffer.
      Returns: Builder instance for fluent chaining
  */
  T highlightMatchingBrackets(bool propval) nothrow
  {
    return setProperty("highlight-matching-brackets", propval);
  }

  /**
      Set `highlightSyntax` property.
      Params:
        propval = Whether to highlight syntax in the buffer.
      Returns: Builder instance for fluent chaining
  */
  T highlightSyntax(bool propval) nothrow
  {
    return setProperty("highlight-syntax", propval);
  }

  /**
      Set `implicitTrailingNewline` property.
      Params:
        propval = Whether the buffer has an implicit trailing newline. See
          [gid.gtksource5.buffer.Buffer.setImplicitTrailingNewline].
      Returns: Builder instance for fluent chaining
  */
  T implicitTrailingNewline(bool propval) nothrow
  {
    return setProperty("implicit-trailing-newline", propval);
  }

  /** */
  T language(gid.gtksource4.language.Language propval) nothrow
  {
    return setProperty("language", propval);
  }

  /**
      Set `maxUndoLevels` property.
      Params:
        propval = Number of undo levels for the buffer. -1 means no limit. This property
          will only affect the default undo manager.
      Returns: Builder instance for fluent chaining
  */
  T maxUndoLevels(int propval) nothrow
  {
    return setProperty("max-undo-levels", propval);
  }

  /**
      Set `styleScheme` property.
      Params:
        propval = Style scheme. It contains styles for syntax highlighting, optionally
          foreground, background, cursor color, current line color, and matching
          brackets style.
      Returns: Builder instance for fluent chaining
  */
  T styleScheme(gid.gtksource4.style_scheme.StyleScheme propval) nothrow
  {
    return setProperty("style-scheme", propval);
  }

  /** */
  T undoManager(gid.gtksource4.undo_manager.UndoManager propval) nothrow
  {
    return setProperty("undo-manager", propval);
  }
}

/// Fluent builder for [gid.gtksource4.buffer.Buffer]
final class BufferGidBuilder : BufferGidBuilderImpl!BufferGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Buffer build() nothrow
  {
    return new Buffer(cast(void*)createGObject(Buffer._getGType), Yes.Take);
  }
}
