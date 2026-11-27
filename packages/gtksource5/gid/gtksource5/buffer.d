/// Module for [Buffer] class
module gid.gtksource5.buffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.text_buffer;
import gid.gtk4.text_iter;
import gid.gtk4.text_mark;
import gid.gtk4.text_tag_table;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.language;
import gid.gtksource5.mark;
import gid.gtksource5.style_scheme;
import gid.gtksource5.types;

/**
    Subclass of [gid.gtk4.text_buffer.TextBuffer].
    
    A [gid.gtksource5.buffer.Buffer] object is the model for [gid.gtksource5.view.View] widgets.
    It extends the [gid.gtk4.text_buffer.TextBuffer] class by adding features useful to display
    and edit source code such as syntax highlighting and bracket matching.
    
    To create a [gid.gtksource5.buffer.Buffer] use [gid.gtksource5.buffer.Buffer.new_] or
    [gid.gtksource5.buffer.Buffer.newWithLanguage]. The second form is just a convenience
    function which allows you to initially set a [gid.gtksource5.language.Language]. You can also
    directly create a [gid.gtksource5.view.View] and get its [gid.gtksource5.buffer.Buffer] with
    [gid.gtk4.text_view.TextView.getBuffer].
    
    The highlighting is enabled by default, but you can disable it with
    [gid.gtksource5.buffer.Buffer.setHighlightSyntax].
    
    # Context Classes:
    
    It is possible to retrieve some information from the syntax highlighting
    engine. The default context classes that are applied to regions of a
    [gid.gtksource5.buffer.Buffer]:
    
     - **comment**: the region delimits a comment;
     - **no-spell-check**: the region should not be spell checked;
     - **path**: the region delimits a path to a file;
     - **string**: the region delimits a string.
    
    Custom language definition files can create their own context classes,
    since the functions like [gid.gtksource5.buffer.Buffer.iterHasContextClass] take
    a string parameter as the context class.
    
    [gid.gtksource5.buffer.Buffer] provides an API to access the context classes:
    [gid.gtksource5.buffer.Buffer.iterHasContextClass],
    [gid.gtksource5.buffer.Buffer.getContextClassesAtIter],
    [gid.gtksource5.buffer.Buffer.iterForwardToContextClassToggle] and
    [gid.gtksource5.buffer.Buffer.iterBackwardToContextClassToggle].
    
    And the [gid.gtksource5.buffer.Buffer.highlightUpdated] signal permits to be notified
    when a context class region changes.
    
    Each context class has also an associated [gid.gtk4.text_tag.TextTag] with the name
    `gtksourceview:context-classes:<name>`. For example to
    retrieve the [gid.gtk4.text_tag.TextTag] for the string context class, one can write:
    ```c
    GtkTextTagTable *tag_table;
    GtkTextTag *tag;
    
    tag_table = gtk_text_buffer_get_tag_table (buffer);
    tag = gtk_text_tag_table_lookup (tag_table, "gtksourceview:context-classes:string");
    ```
    ```python
    buffer = GtkSource.Buffer()
    
    tag_table = buffer.get_tag_table()
    tag = tag_table.lookup(name="gtksourceview:context-classes:string")
    ```
    
    The tag must be used for read-only purposes.
    
    Accessing a context class via the associated [gid.gtk4.text_tag.TextTag] is less
    convenient than the [gid.gtksource5.buffer.Buffer] API, because:
    
     - The tag doesn't always exist, you need to listen to the
       [gid.gtk4.text_tag_table.TextTagTable.tagAdded] and [gid.gtk4.text_tag_table.TextTagTable.tagRemoved] signals.
     - Instead of the [gid.gtksource5.buffer.Buffer.highlightUpdated] signal, you can listen
       to the [gid.gtk4.text_buffer.TextBuffer.applyTag] and [gid.gtk4.text_buffer.TextBuffer.removeTag] signals.
    
    A possible use-case for accessing a context class via the associated
    [gid.gtk4.text_tag.TextTag] is to read the region but without adding a hard dependency on the
    GtkSourceView library (for example for a spell-checking library that wants to
    read the no-spell-check region).
*/
@gidGir("Buffer", "BufferClass")
class Buffer : gid.gtk4.text_buffer.TextBuffer
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
      Get builder for [gid.gtksource5.buffer.Buffer]
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
  @property gid.gtksource5.language.Language language() nothrow
  {
    return getLanguage();
  }

  /** */
  @property void language(gid.gtksource5.language.Language propval) nothrow
  {
    setLanguage(propval);
  }

  /**
      Get `loading` property.
      Returns: The "loading" property denotes that a [gid.gtksource5.file_loader.FileLoader] is
        currently loading the buffer.
        
        Applications may want to use this setting to avoid doing work
        while the buffer is loading such as spellchecking.
  */
  @property bool loading() nothrow
  {
    return getLoading();
  }

  /**
      Get `styleScheme` property.
      Returns: Style scheme. It contains styles for syntax highlighting, optionally
        foreground, background, cursor color, current line color, and matching
        brackets style.
  */
  @property gid.gtksource5.style_scheme.StyleScheme styleScheme() nothrow
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
  @property void styleScheme(gid.gtksource5.style_scheme.StyleScheme propval) nothrow
  {
    setStyleScheme(propval);
  }

  /**
      Creates a new source buffer.
  
      Params:
        table = a #GtkTextTagTable, or null to create a new one.
      Returns: a new source buffer.
  */
  this(gid.gtk4.text_tag_table.TextTagTable table = null) nothrow
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
      Creates a new source buffer using the highlighting patterns in `language`.
      
      This is equivalent to creating a new source buffer with
      a new tag table and then calling [gid.gtksource5.buffer.Buffer.setLanguage].
  
      Params:
        language = a #GtkSourceLanguage.
      Returns: a new source buffer which will highlight text
        according to the highlighting patterns in `language`.
  */
  static gid.gtksource5.buffer.Buffer newWithLanguage(gid.gtksource5.language.Language language) nothrow
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_buffer_new_with_language(language ? cast(GtkSourceLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  protected void vfuncBracketMatched(gid.gtk4.text_iter.TextIter iter, gid.gtksource5.types.BracketMatchType state)
  {
    auto _klass = cast(GtkSourceBufferClass*)_vfuncClass;
    if (!_klass.bracketMatched)
      return;

    _klass.bracketMatched(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, state);
  }

  /**
      Moves `iter` to the position of the previous [gid.gtksource5.mark.Mark] of the given
      category.
      
      Returns true if `iter` was moved. If `category` is NULL, the
      previous source mark can be of any category.
  
      Params:
        iter = an iterator.
        category = category to search for, or null
      Returns: whether `iter` was moved.
  */
  bool backwardIterToSourceMark(gid.gtk4.text_iter.TextIter iter, string category = null) nothrow
  {
    bool _retval;
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    _retval = cast(bool)gtk_source_buffer_backward_iter_to_source_mark(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _category);
    return _retval;
  }

  /**
      Changes the case of the text between the specified iterators.
      
      Since 5.4, this function will update the position of `start` and
      `end` to surround the modified text.
  
      Params:
        caseType = how to change the case.
        start = a #GtkTextIter.
        end = a #GtkTextIter.
  */
  void changeCase(gid.gtksource5.types.ChangeCaseType caseType, gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end) nothrow
  {
    gtk_source_buffer_change_case(cast(GtkSourceBuffer*)this._cPtr, caseType, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      Creates a source mark in the `buffer` of category `category`.
      
      A source mark is a [gid.gtk4.text_mark.TextMark] but organized into categories.
      Depending on the category a pixbuf can be specified that will be displayed
      along the line of the mark.
      
      Like a [gid.gtk4.text_mark.TextMark], a [gid.gtksource5.mark.Mark] can be anonymous if the
      passed `name` is null.  Also, the buffer owns the marks so you
      shouldn't unreference it.
      
      Marks always have left gravity and are moved to the beginning of
      the line when the user deletes the line they were in.
      
      Typical uses for a source mark are bookmarks, breakpoints, current
      executing instruction indication in a source file, etc..
  
      Params:
        name = the name of the mark, or null.
        category = a string defining the mark category.
        where = location to place the mark.
      Returns: a new [gid.gtksource5.mark.Mark], owned by the buffer.
  */
  gid.gtksource5.mark.Mark createSourceMark(string name, string category, gid.gtk4.text_iter.TextIter where) nothrow
  {
    GtkSourceMark* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _category = category.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_source_buffer_create_source_mark(cast(GtkSourceBuffer*)this._cPtr, _name, _category, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.mark.Mark)(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Forces buffer to analyze and highlight the given area synchronously.
      
      **Note**:
      
      This is a potentially slow operation and should be used only
      when you need to make sure that some text not currently
      visible is highlighted, for instance before printing.
  
      Params:
        start = start of the area to highlight.
        end = end of the area to highlight.
  */
  void ensureHighlight(gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end) nothrow
  {
    gtk_source_buffer_ensure_highlight(cast(GtkSourceBuffer*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Moves `iter` to the position of the next [gid.gtksource5.mark.Mark] of the given
      `category`.
      
      Returns true if `iter` was moved. If `category` is NULL, the
      next source mark can be of any category.
  
      Params:
        iter = an iterator.
        category = category to search for, or null
      Returns: whether `iter` was moved.
  */
  bool forwardIterToSourceMark(gid.gtk4.text_iter.TextIter iter, string category = null) nothrow
  {
    bool _retval;
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    _retval = cast(bool)gtk_source_buffer_forward_iter_to_source_mark(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _category);
    return _retval;
  }

  /**
      Get all defined context classes at iter.
      
      See the [gid.gtksource5.buffer.Buffer] description for the list of default context classes.
  
      Params:
        iter = a #GtkTextIter.
      Returns: a new null
        terminated array of context class names.
        Use [gid.glib2.global.strfreev] to free the array if it is no longer needed.
  */
  string[] getContextClassesAtIter(gid.gtk4.text_iter.TextIter iter) nothrow
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
      Returns the [gid.gtksource5.language.Language] associated with the buffer,
      see [gid.gtksource5.buffer.Buffer.setLanguage].
      
      The returned object should not be unreferenced by the user.
      Returns: the [gid.gtksource5.language.Language] associated
        with the buffer, or null.
  */
  gid.gtksource5.language.Language getLanguage() nothrow
  {
    GtkSourceLanguage* _cretval;
    _cretval = gtk_source_buffer_get_language(cast(GtkSourceBuffer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.language.Language)(cast(GtkSourceLanguage*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool getLoading() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_buffer_get_loading(cast(GtkSourceBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the text in the specified range converting any text formatting
      to equivalent Pango markup tags.
      This allows the styled text to be displayed in other widgets that support
      Pango markup, such as #GtkLabel.
      
      For very long ranges this function can take long enough that you could
      potentially miss frame renderings.
  
      Params:
        start = start of range as a #GtkTextIter
        end = end of range as a #GtkTextIter
      Returns: a newly-allocated string containing the text
          with Pango markup, or null if start and end are invalid.
  */
  string getMarkup(gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end) nothrow
  {
    char* _cretval;
    _cretval = gtk_source_buffer_get_markup(cast(GtkSourceBuffer*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns the list of marks of the given category at iter.
      
      If category is null it returns all marks at iter.
  
      Params:
        iter = an iterator.
        category = category to search for, or null
      Returns: a newly allocated #GSList.
  */
  gid.gtksource5.mark.Mark[] getSourceMarksAtIter(gid.gtk4.text_iter.TextIter iter, string category = null) nothrow
  {
    GSList* _cretval;
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_source_buffer_get_source_marks_at_iter(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _category);
    auto _retval = gSListToD!(gid.gtksource5.mark.Mark, GidOwnership.Container)(cast(GSList*)_cretval);
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
  gid.gtksource5.mark.Mark[] getSourceMarksAtLine(int line, string category = null) nothrow
  {
    GSList* _cretval;
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_source_buffer_get_source_marks_at_line(cast(GtkSourceBuffer*)this._cPtr, line, _category);
    auto _retval = gSListToD!(gid.gtksource5.mark.Mark, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns the [gid.gtksource5.style_scheme.StyleScheme] associated with the buffer,
      see [gid.gtksource5.buffer.Buffer.setStyleScheme].
      
      The returned object should not be unreferenced by the user.
      Returns: the [gid.gtksource5.style_scheme.StyleScheme]
        associated with the buffer, or null.
  */
  gid.gtksource5.style_scheme.StyleScheme getStyleScheme() nothrow
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_buffer_get_style_scheme(cast(GtkSourceBuffer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Moves backward to the next toggle (on or off) of the context class.
      
      If no matching context class toggles are found, returns false, otherwise true.
      Does not return toggles located at iter, only toggles after iter. Sets
      iter to the location of the toggle, or to the end of the buffer if no
      toggle is found.
      
      See the [gid.gtksource5.buffer.Buffer] description for the list of default context classes.
  
      Params:
        iter = a #GtkTextIter.
        contextClass = the context class.
      Returns: whether we found a context class toggle before iter
  */
  bool iterBackwardToContextClassToggle(gid.gtk4.text_iter.TextIter iter, string contextClass) nothrow
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_source_buffer_iter_backward_to_context_class_toggle(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
      Moves forward to the next toggle (on or off) of the context class.
      
      If no matching context class toggles are found, returns false, otherwise true.
      Does not return toggles located at iter, only toggles after iter. Sets
      iter to the location of the toggle, or to the end of the buffer if no
      toggle is found.
      
      See the [gid.gtksource5.buffer.Buffer] description for the list of default context classes.
  
      Params:
        iter = a #GtkTextIter.
        contextClass = the context class.
      Returns: whether we found a context class toggle after iter
  */
  bool iterForwardToContextClassToggle(gid.gtk4.text_iter.TextIter iter, string contextClass) nothrow
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_source_buffer_iter_forward_to_context_class_toggle(cast(GtkSourceBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
      Check if the class context_class is set on iter.
      
      See the [gid.gtksource5.buffer.Buffer] description for the list of default context classes.
  
      Params:
        iter = a #GtkTextIter.
        contextClass = class to search for.
      Returns: whether iter has the context class.
  */
  bool iterHasContextClass(gid.gtk4.text_iter.TextIter iter, string contextClass) nothrow
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
  void joinLines(gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end) nothrow
  {
    gtk_source_buffer_join_lines(cast(GtkSourceBuffer*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      Remove all marks of category between start and end from the buffer.
      
      If category is NULL, all marks in the range will be removed.
  
      Params:
        start = a #GtkTextIter.
        end = a #GtkTextIter.
        category = category to search for, or null.
  */
  void removeSourceMarks(gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end, string category = null) nothrow
  {
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    gtk_source_buffer_remove_source_marks(cast(GtkSourceBuffer*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null, _category);
  }

  /**
      Controls the bracket match highlighting function in the buffer.
      
      If activated, when you position your cursor over a bracket character
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
      patterns specified in the [gid.gtksource5.language.Language] set with [gid.gtksource5.buffer.Buffer.setLanguage].
      
      If highlight is false, syntax highlighting is disabled and all the
      [gid.gtk4.text_tag.TextTag] objects that have been added by the syntax highlighting engine
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
      
      If an explicit trailing newline is present in a [gid.gtk4.text_buffer.TextBuffer], [gid.gtk4.text_view.TextView]
      shows it as an empty line. This is generally not what the user expects.
      
      If implicit_trailing_newline is true (the default value):
       - when a [gid.gtksource5.file_loader.FileLoader] loads the content of a file into the buffer,
         the trailing newline (if present in the file) is not inserted into the
         buffer.
       - when a [gid.gtksource5.file_saver.FileSaver] saves the content of the buffer into a file, a
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
      Associates a [gid.gtksource5.language.Language] with the buffer.
      
      Note that a [gid.gtksource5.language.Language] affects not only the syntax highlighting, but
      also the [context classes](./class.Buffer.html#context-classes). If you want to disable just the
      syntax highlighting, see [gid.gtksource5.buffer.Buffer.setHighlightSyntax].
      
      The buffer holds a reference to language.
  
      Params:
        language = a #GtkSourceLanguage to set, or null.
  */
  void setLanguage(gid.gtksource5.language.Language language = null) nothrow
  {
    gtk_source_buffer_set_language(cast(GtkSourceBuffer*)this._cPtr, language ? cast(GtkSourceLanguage*)language._cPtr(No.Dup) : null);
  }

  /**
      Sets a [gid.gtksource5.style_scheme.StyleScheme] to be used by the buffer and the view.
      
      Note that a [gid.gtksource5.style_scheme.StyleScheme] affects not only the syntax highlighting,
      but also other [gid.gtksource5.view.View] features such as highlighting the current line,
      matching brackets, the line numbers, etc.
      
      Instead of setting a null scheme, it is better to disable syntax
      highlighting with [gid.gtksource5.buffer.Buffer.setHighlightSyntax], and setting the
      [gid.gtksource5.style_scheme.StyleScheme] with the "classic" or "tango" ID, because those two
      style schemes follow more closely the GTK theme (for example for the
      background color).
      
      The buffer holds a reference to scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme or null.
  */
  void setStyleScheme(gid.gtksource5.style_scheme.StyleScheme scheme = null) nothrow
  {
    gtk_source_buffer_set_style_scheme(cast(GtkSourceBuffer*)this._cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme._cPtr(No.Dup) : null);
  }

  /**
      Sort the lines of text between the specified iterators.
  
      Params:
        start = a #GtkTextIter.
        end = a #GtkTextIter.
        flags = #GtkSourceSortFlags specifying how the sort should behave
        column = sort considering the text starting at the given column
  */
  void sortLines(gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end, gid.gtksource5.types.SortFlags flags, int column) nothrow
  {
    gtk_source_buffer_sort_lines(cast(GtkSourceBuffer*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null, flags, column);
  }

  /**
      Connect to `BracketMatched` signal.
  
      iter is set to a valid iterator pointing to the matching bracket
        if state is [gid.gtksource5.types.BracketMatchType.Found]. Otherwise iter is
        meaningless.
        
        The signal is emitted only when the state changes, typically when
        the cursor moves.
        
        A use-case for this signal is to show messages in a [gid.gtk4.statusbar.Statusbar].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_iter.TextIter iter, gid.gtksource5.types.BracketMatchType state, gid.gtksource5.buffer.Buffer buffer)`
  
          `iter` if found, the location of the matching bracket. (optional)
  
          `state` state of bracket matching. (optional)
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectBracketMatched(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtksource5.types.BracketMatchType)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource5.buffer.Buffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.buffer.Buffer.bracketMatched");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("bracket-matched", closure, after);
  }

  /**
      Connect to `CursorMoved` signal.
  
      The "cursor-moved" signal is emitted when then insertion mark has moved.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource5.buffer.Buffer buffer)`
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCursorMoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.buffer.Buffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.buffer.Buffer.cursorMoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cursor-moved", closure, after);
  }

  /**
      Connect to `HighlightUpdated` signal.
  
      The ::highlight-updated signal is emitted when the syntax
        highlighting and [context classes](./class.Buffer.html#context-classes) are updated in a
        certain region of the buffer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end, gid.gtksource5.buffer.Buffer buffer)`
  
          `start` the start of the updated region (optional)
  
          `end` the end of the updated region (optional)
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHighlightUpdated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource5.buffer.Buffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.buffer.Buffer.highlightUpdated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("highlight-updated", closure, after);
  }

  /**
      Connect to `SourceMarkUpdated` signal.
  
      The ::source-mark-updated signal is emitted each time
        a mark is added to, moved or removed from the buffer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_mark.TextMark mark, gid.gtksource5.buffer.Buffer buffer)`
  
          `mark` the [gid.gtksource5.mark.Mark] (optional)
  
          `buffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSourceMarkUpdated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.text_mark.TextMark)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtksource5.buffer.Buffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.buffer.Buffer.sourceMarkUpdated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("source-mark-updated", closure, after);
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
    static assert(is(T : gid.gtksource5.buffer.Buffer), T.stringof ~ " is not derived from gid.gtksource5.buffer.Buffer");

    gid.gtk4.text_buffer.TextBuffer._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBracketMatched", true)[0]) == gid.gtksource5.buffer.Buffer))
      _installVfunc(klass, "bracket_matched");
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
          auto _obj = cast(gid.gtksource5.buffer.Buffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.bracketMatched)
              return (cast(typeof(&_vfuncBracketMatchedTramp))_klass.bracketMatched)(buffer, iter, state);
            return;
          }

          auto _iter = iter ? new gid.gtk4.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncBracketMatched(_iter, state);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.buffer.Buffer.vfuncBracketMatched");
          }
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.bracketMatched = cast(typeof(_klass.bracketMatched))&_vfuncBracketMatchedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource5.buffer.Buffer]
class BufferGidBuilderImpl(T) : gid.gtk4.text_buffer.TextBufferGidBuilderImpl!T
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
  T language(gid.gtksource5.language.Language propval) nothrow
  {
    return setProperty("language", propval);
  }

  /**
      Set `styleScheme` property.
      Params:
        propval = Style scheme. It contains styles for syntax highlighting, optionally
          foreground, background, cursor color, current line color, and matching
          brackets style.
      Returns: Builder instance for fluent chaining
  */
  T styleScheme(gid.gtksource5.style_scheme.StyleScheme propval) nothrow
  {
    return setProperty("style-scheme", propval);
  }
}

/// Fluent builder for [gid.gtksource5.buffer.Buffer]
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
