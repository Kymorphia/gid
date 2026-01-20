/// Module for [Buffer] class
module gtksource.buffer;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.text_buffer;
import gtk.text_iter;
import gtk.text_mark;
import gtk.text_tag_table;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.language;
import gtksource.mark;
import gtksource.style_scheme;
import gtksource.types;
import gtksource.undo_manager;

/** */
class Buffer : gtk.text_buffer.TextBuffer
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
    return cast(void function())gtk_source_buffer_get_type != &gidSymbolNotFound ? gtk_source_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Buffer self()
  {
    return this;
  }

  /**
      Get `highlightMatchingBrackets` property.
      Returns: Whether to highlight matching brackets in the buffer.
  */
  @property bool highlightMatchingBrackets()
  {
    return getHighlightMatchingBrackets();
  }

  /**
      Set `highlightMatchingBrackets` property.
      Params:
        propval = Whether to highlight matching brackets in the buffer.
  */
  @property void highlightMatchingBrackets(bool propval)
  {
    return setHighlightMatchingBrackets(propval);
  }

  /**
      Get `highlightSyntax` property.
      Returns: Whether to highlight syntax in the buffer.
  */
  @property bool highlightSyntax()
  {
    return getHighlightSyntax();
  }

  /**
      Set `highlightSyntax` property.
      Params:
        propval = Whether to highlight syntax in the buffer.
  */
  @property void highlightSyntax(bool propval)
  {
    return setHighlightSyntax(propval);
  }

  /**
      Get `implicitTrailingNewline` property.
      Returns: Whether the buffer has an implicit trailing newline. See
        [gtksource.buffer.Buffer.setImplicitTrailingNewline].
  */
  @property bool implicitTrailingNewline()
  {
    return getImplicitTrailingNewline();
  }

  /**
      Set `implicitTrailingNewline` property.
      Params:
        propval = Whether the buffer has an implicit trailing newline. See
          [gtksource.buffer.Buffer.setImplicitTrailingNewline].
  */
  @property void implicitTrailingNewline(bool propval)
  {
    return setImplicitTrailingNewline(propval);
  }

  /** */
  @property gtksource.language.Language language()
  {
    return getLanguage();
  }

  /** */
  @property void language(gtksource.language.Language propval)
  {
    return setLanguage(propval);
  }

  /**
      Get `maxUndoLevels` property.
      Returns: Number of undo levels for the buffer. -1 means no limit. This property
        will only affect the default undo manager.
  */
  @property int maxUndoLevels()
  {
    return getMaxUndoLevels();
  }

  /**
      Set `maxUndoLevels` property.
      Params:
        propval = Number of undo levels for the buffer. -1 means no limit. This property
          will only affect the default undo manager.
  */
  @property void maxUndoLevels(int propval)
  {
    return setMaxUndoLevels(propval);
  }

  /**
      Get `styleScheme` property.
      Returns: Style scheme. It contains styles for syntax highlighting, optionally
        foreground, background, cursor color, current line color, and matching
        brackets style.
  */
  @property gtksource.style_scheme.StyleScheme styleScheme()
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
  @property void styleScheme(gtksource.style_scheme.StyleScheme propval)
  {
    return setStyleScheme(propval);
  }

  /** */
  @property gtksource.undo_manager.UndoManager undoManager()
  {
    return getUndoManager();
  }

  /** */
  @property void undoManager(gtksource.undo_manager.UndoManager propval)
  {
    return setUndoManager(propval);
  }

  /**
      Creates a new source buffer.
  
      Params:
        table = a #GtkTextTagTable, or null to create a new one.
      Returns: a new source buffer.
  */
  this(gtk.text_tag_table.TextTagTable table = null)
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_buffer_new(table ? cast(GtkTextTagTable*)table._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new source buffer using the highlighting patterns in
      language.  This is equivalent to creating a new source buffer with
      a new tag table and then calling [gtksource.buffer.Buffer.setLanguage].
  
      Params:
        language = a #GtkSourceLanguage.
      Returns: a new source buffer which will highlight text
        according to the highlighting patterns in language.
  */
  static gtksource.buffer.Buffer newWithLanguage(gtksource.language.Language language)
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_buffer_new_with_language(language ? cast(GtkSourceLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, Yes.Take);
    return _retval;
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
  bool backwardIterToSourceMark(ref gtk.text_iter.TextIter iter, string category = null)
  {
    bool _retval;
    const(char)* _category = category.toCString(No.Alloc);
    _retval = cast(bool)gtk_source_buffer_backward_iter_to_source_mark(cast(GtkSourceBuffer*)this._cPtr, cast(GtkTextIter*)&iter, _category);
    return _retval;
  }

  /**
      Marks the beginning of a not undoable action on the buffer,
      disabling the undo manager.  Typically you would call this function
      before initially setting the contents of the buffer (e.g. when
      loading a file in a text editor).
      
      You may nest [gtksource.buffer.Buffer.beginNotUndoableAction] /
      [gtksource.buffer.Buffer.endNotUndoableAction] blocks.
  */
  void beginNotUndoableAction()
  {
    gtk_source_buffer_begin_not_undoable_action(cast(GtkSourceBuffer*)this._cPtr);
  }

  /**
      Determines whether a source buffer can redo the last action
      (i.e. if the last operation was an undo).
      Returns: true if a redo is possible.
  */
  bool canRedo()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_buffer_can_redo(cast(GtkSourceBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether a source buffer can undo the last action.
      Returns: true if it's possible to undo the last action.
  */
  bool canUndo()
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
  void changeCase(gtksource.types.ChangeCaseType caseType, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_buffer_change_case(cast(GtkSourceBuffer*)this._cPtr, caseType, cast(GtkTextIter*)&start, cast(GtkTextIter*)&end);
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
  gtksource.mark.Mark createSourceMark(string name, string category, gtk.text_iter.TextIter where)
  {
    GtkSourceMark* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_buffer_create_source_mark(cast(GtkSourceBuffer*)this._cPtr, _name, _category, cast(const(GtkTextIter)*)&where);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.mark.Mark)(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Marks the end of a not undoable action on the buffer.  When the
      last not undoable block is closed through the call to this
      function, the list of undo actions is cleared and the undo manager
      is re-enabled.
  */
  void endNotUndoableAction()
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
  void ensureHighlight(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_buffer_ensure_highlight(cast(GtkSourceBuffer*)this._cPtr, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end);
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
  bool forwardIterToSourceMark(ref gtk.text_iter.TextIter iter, string category = null)
  {
    bool _retval;
    const(char)* _category = category.toCString(No.Alloc);
    _retval = cast(bool)gtk_source_buffer_forward_iter_to_source_mark(cast(GtkSourceBuffer*)this._cPtr, cast(GtkTextIter*)&iter, _category);
    return _retval;
  }

  /**
      Get all defined context classes at iter.
      
      See the #GtkSourceBuffer description for the list of default context classes.
  
      Params:
        iter = a #GtkTextIter.
      Returns: a new null
        terminated array of context class names.
        Use [glib.global.strfreev] to free the array if it is no longer needed.
  */
  string[] getContextClassesAtIter(gtk.text_iter.TextIter iter)
  {
    char** _cretval;
    _cretval = gtk_source_buffer_get_context_classes_at_iter(cast(GtkSourceBuffer*)this._cPtr, cast(const(GtkTextIter)*)&iter);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
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
  bool getHighlightMatchingBrackets()
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
  bool getHighlightSyntax()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_buffer_get_highlight_syntax(cast(GtkSourceBuffer*)this._cPtr);
    return _retval;
  }

  /** */
  bool getImplicitTrailingNewline()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_buffer_get_implicit_trailing_newline(cast(GtkSourceBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the #GtkSourceLanguage associated with the buffer,
      see [gtksource.buffer.Buffer.setLanguage].  The returned object should not be
      unreferenced by the user.
      Returns: the #GtkSourceLanguage associated
        with the buffer, or null.
  */
  gtksource.language.Language getLanguage()
  {
    GtkSourceLanguage* _cretval;
    _cretval = gtk_source_buffer_get_language(cast(GtkSourceBuffer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.language.Language)(cast(GtkSourceLanguage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines the number of undo levels the buffer will track for buffer edits.
      Returns: the maximum number of possible undo levels or -1 if no limit is set.
  */
  int getMaxUndoLevels()
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
  gtksource.mark.Mark[] getSourceMarksAtIter(gtk.text_iter.TextIter iter, string category = null)
  {
    GSList* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_buffer_get_source_marks_at_iter(cast(GtkSourceBuffer*)this._cPtr, cast(GtkTextIter*)&iter, _category);
    auto _retval = gSListToD!(gtksource.mark.Mark, GidOwnership.Container)(cast(GSList*)_cretval);
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
  gtksource.mark.Mark[] getSourceMarksAtLine(int line, string category = null)
  {
    GSList* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_buffer_get_source_marks_at_line(cast(GtkSourceBuffer*)this._cPtr, line, _category);
    auto _retval = gSListToD!(gtksource.mark.Mark, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns the #GtkSourceStyleScheme associated with the buffer,
      see [gtksource.buffer.Buffer.setStyleScheme].
      The returned object should not be unreferenced by the user.
      Returns: the #GtkSourceStyleScheme
        associated with the buffer, or null.
  */
  gtksource.style_scheme.StyleScheme getStyleScheme()
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_buffer_get_style_scheme(cast(GtkSourceBuffer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkSourceUndoManager associated with the buffer,
      see [gtksource.buffer.Buffer.setUndoManager].  The returned object should not be
      unreferenced by the user.
      Returns: the #GtkSourceUndoManager associated
        with the buffer, or null.
  */
  gtksource.undo_manager.UndoManager getUndoManager()
  {
    GtkSourceUndoManager* _cretval;
    _cretval = gtk_source_buffer_get_undo_manager(cast(GtkSourceBuffer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.undo_manager.UndoManager)(cast(GtkSourceUndoManager*)_cretval, No.Take);
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
  bool iterBackwardToContextClassToggle(ref gtk.text_iter.TextIter iter, string contextClass)
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString(No.Alloc);
    _retval = cast(bool)gtk_source_buffer_iter_backward_to_context_class_toggle(cast(GtkSourceBuffer*)this._cPtr, cast(GtkTextIter*)&iter, _contextClass);
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
  bool iterForwardToContextClassToggle(ref gtk.text_iter.TextIter iter, string contextClass)
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString(No.Alloc);
    _retval = cast(bool)gtk_source_buffer_iter_forward_to_context_class_toggle(cast(GtkSourceBuffer*)this._cPtr, cast(GtkTextIter*)&iter, _contextClass);
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
  bool iterHasContextClass(gtk.text_iter.TextIter iter, string contextClass)
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString(No.Alloc);
    _retval = cast(bool)gtk_source_buffer_iter_has_context_class(cast(GtkSourceBuffer*)this._cPtr, cast(const(GtkTextIter)*)&iter, _contextClass);
    return _retval;
  }

  /**
      Joins the lines of text between the specified iterators.
  
      Params:
        start = a #GtkTextIter.
        end = a #GtkTextIter.
  */
  void joinLines(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_buffer_join_lines(cast(GtkSourceBuffer*)this._cPtr, cast(GtkTextIter*)&start, cast(GtkTextIter*)&end);
  }

  /**
      Redoes the last undo operation.  Use [gtksource.buffer.Buffer.canRedo]
      to check whether a call to this function will have any effect.
      
      This function emits the #GtkSourceBuffer::redo signal.
  */
  void redo()
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
  void removeSourceMarks(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, string category = null)
  {
    const(char)* _category = category.toCString(No.Alloc);
    gtk_source_buffer_remove_source_marks(cast(GtkSourceBuffer*)this._cPtr, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end, _category);
  }

  /**
      Controls the bracket match highlighting function in the buffer.  If
      activated, when you position your cursor over a bracket character
      (a parenthesis, a square bracket, etc.) the matching opening or
      closing bracket character will be highlighted.
  
      Params:
        highlight = true if you want matching brackets highlighted.
  */
  void setHighlightMatchingBrackets(bool highlight)
  {
    gtk_source_buffer_set_highlight_matching_brackets(cast(GtkSourceBuffer*)this._cPtr, highlight);
  }

  /**
      Controls whether syntax is highlighted in the buffer.
      
      If highlight is true, the text will be highlighted according to the syntax
      patterns specified in the #GtkSourceLanguage set with
      [gtksource.buffer.Buffer.setLanguage].
      
      If highlight is false, syntax highlighting is disabled and all the
      #GtkTextTag objects that have been added by the syntax highlighting engine
      are removed from the buffer.
  
      Params:
        highlight = true to enable syntax highlighting, false to disable it.
  */
  void setHighlightSyntax(bool highlight)
  {
    gtk_source_buffer_set_highlight_syntax(cast(GtkSourceBuffer*)this._cPtr, highlight);
  }

  /**
      Sets whether the buffer has an implicit trailing newline.
      
      If an explicit trailing newline is present in a #GtkTextBuffer, #GtkTextView
      shows it as an empty line. This is generally not what the user expects.
      
      If implicit_trailing_newline is true (the default value):
       $(LIST
          * when a #GtkSourceFileLoader loads the content of a file into the buffer,
            the trailing newline (if present in the file) is not inserted into the
            buffer.
          * when a #GtkSourceFileSaver saves the content of the buffer into a file, a
            trailing newline is added to the file.
       )
         
      On the other hand, if implicit_trailing_newline is false, the file's
      content is not modified when loaded into the buffer, and the buffer's
      content is not modified when saved into a file.
  
      Params:
        implicitTrailingNewline = the new value.
  */
  void setImplicitTrailingNewline(bool implicitTrailingNewline)
  {
    gtk_source_buffer_set_implicit_trailing_newline(cast(GtkSourceBuffer*)this._cPtr, implicitTrailingNewline);
  }

  /**
      Associates a #GtkSourceLanguage with the buffer.
      
      Note that a #GtkSourceLanguage affects not only the syntax highlighting, but
      also the [context classes][context-classes]. If you want to disable just the
      syntax highlighting, see [gtksource.buffer.Buffer.setHighlightSyntax].
      
      The buffer holds a reference to language.
  
      Params:
        language = a #GtkSourceLanguage to set, or null.
  */
  void setLanguage(gtksource.language.Language language = null)
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
  void setMaxUndoLevels(int maxUndoLevels)
  {
    gtk_source_buffer_set_max_undo_levels(cast(GtkSourceBuffer*)this._cPtr, maxUndoLevels);
  }

  /**
      Sets a #GtkSourceStyleScheme to be used by the buffer and the view.
      
      Note that a #GtkSourceStyleScheme affects not only the syntax highlighting,
      but also other #GtkSourceView features such as highlighting the current line,
      matching brackets, the line numbers, etc.
      
      Instead of setting a null scheme, it is better to disable syntax
      highlighting with [gtksource.buffer.Buffer.setHighlightSyntax], and setting the
      #GtkSourceStyleScheme with the "classic" or "tango" ID, because those two
      style schemes follow more closely the GTK+ theme (for example for the
      background color).
      
      The buffer holds a reference to scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme or null.
  */
  void setStyleScheme(gtksource.style_scheme.StyleScheme scheme = null)
  {
    gtk_source_buffer_set_style_scheme(cast(GtkSourceBuffer*)this._cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme._cPtr(No.Dup) : null);
  }

  /**
      Set the buffer undo manager. If manager is null the default undo manager
      will be set.
  
      Params:
        manager = A #GtkSourceUndoManager or null.
  */
  void setUndoManager(gtksource.undo_manager.UndoManager manager = null)
  {
    gtk_source_buffer_set_undo_manager(cast(GtkSourceBuffer*)this._cPtr, manager ? cast(GtkSourceUndoManager*)(cast(gobject.object.ObjectWrap)manager)._cPtr(No.Dup) : null);
  }

  /**
      Sort the lines of text between the specified iterators.
  
      Params:
        start = a #GtkTextIter.
        end = a #GtkTextIter.
        flags = #GtkSourceSortFlags specifying how the sort should behave
        column = sort considering the text starting at the given column
  */
  void sortLines(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.types.SortFlags flags, int column)
  {
    gtk_source_buffer_sort_lines(cast(GtkSourceBuffer*)this._cPtr, cast(GtkTextIter*)&start, cast(GtkTextIter*)&end, flags, column);
  }

  /**
      Undoes the last user action which modified the buffer.  Use
      [gtksource.buffer.Buffer.canUndo] to check whether a call to this
      function will have any effect.
      
      This function emits the #GtkSourceBuffer::undo signal.
  */
  void undo()
  {
    gtk_source_buffer_undo(cast(GtkSourceBuffer*)this._cPtr);
  }

  /**
      Connect to `BracketMatched` signal.
  
      iter is set to a valid iterator pointing to the matching bracket
        if state is [gtksource.types.BracketMatchType.Found]. Otherwise iter is
        meaningless.
        
        The signal is emitted only when the state changes, typically when
        the cursor moves.
        
        A use-case for this signal is to show messages in a #GtkStatusbar.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter iter, gtksource.types.BracketMatchType state, gtksource.buffer.Buffer buffer))
  
          `iter` if found, the location of the matching bracket. (optional)
  
          `state` state of bracket matching. (optional)
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBracketMatched(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtksource.types.BracketMatchType)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.buffer.Buffer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.buffer.Buffer buffer))
  
          `start` the start of the updated region (optional)
  
          `end` the end of the updated region (optional)
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectHighlightUpdated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.buffer.Buffer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("highlight-updated", closure, after);
  }

  /**
      Connect to `Redo` signal.
  
      The ::redo signal is emitted to redo the last undo operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.buffer.Buffer buffer))
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRedo(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.buffer.Buffer)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.text_mark.TextMark mark, gtksource.buffer.Buffer buffer))
  
          `mark` the #GtkSourceMark (optional)
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSourceMarkUpdated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_mark.TextMark)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.buffer.Buffer)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtksource.buffer.Buffer buffer))
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUndo(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.buffer.Buffer)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("undo", closure, after);
  }
}
