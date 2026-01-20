/// Module for [View] class
module gtksource.view;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.event;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.text_iter;
import gtk.text_view;
import gtk.types;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion;
import gtksource.gutter;
import gtksource.mark_attributes;
import gtksource.space_drawer;
import gtksource.types;

/** */
class View : gtk.text_view.TextView
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
    return cast(void function())gtk_source_view_get_type != &gidSymbolNotFound ? gtk_source_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override View self()
  {
    return this;
  }

  /** */
  @property bool autoIndent()
  {
    return getAutoIndent();
  }

  /** */
  @property void autoIndent(bool propval)
  {
    return setAutoIndent(propval);
  }

  /**
      Get `backgroundPattern` property.
      Returns: Draw a specific background pattern on the view.
  */
  @property gtksource.types.BackgroundPatternType backgroundPattern()
  {
    return getBackgroundPattern();
  }

  /**
      Set `backgroundPattern` property.
      Params:
        propval = Draw a specific background pattern on the view.
  */
  @property void backgroundPattern(gtksource.types.BackgroundPatternType propval)
  {
    return setBackgroundPattern(propval);
  }

  /**
      Get `completion` property.
      Returns: The completion object associated with the view
  */
  @property gtksource.completion.Completion completion()
  {
    return getCompletion();
  }

  /** */
  @property bool highlightCurrentLine()
  {
    return getHighlightCurrentLine();
  }

  /** */
  @property void highlightCurrentLine(bool propval)
  {
    return setHighlightCurrentLine(propval);
  }

  /** */
  @property bool indentOnTab()
  {
    return getIndentOnTab();
  }

  /** */
  @property void indentOnTab(bool propval)
  {
    return setIndentOnTab(propval);
  }

  /**
      Get `indentWidth` property.
      Returns: Width of an indentation step expressed in number of spaces.
  */
  @property int indentWidth()
  {
    return getIndentWidth();
  }

  /**
      Set `indentWidth` property.
      Params:
        propval = Width of an indentation step expressed in number of spaces.
  */
  @property void indentWidth(int propval)
  {
    return setIndentWidth(propval);
  }

  /** */
  @property bool insertSpacesInsteadOfTabs()
  {
    return getInsertSpacesInsteadOfTabs();
  }

  /** */
  @property void insertSpacesInsteadOfTabs(bool propval)
  {
    return setInsertSpacesInsteadOfTabs(propval);
  }

  /**
      Get `rightMarginPosition` property.
      Returns: Position of the right margin.
  */
  @property uint rightMarginPosition()
  {
    return getRightMarginPosition();
  }

  /**
      Set `rightMarginPosition` property.
      Params:
        propval = Position of the right margin.
  */
  @property void rightMarginPosition(uint propval)
  {
    return setRightMarginPosition(propval);
  }

  /**
      Get `showLineMarks` property.
      Returns: Whether to display line mark pixbufs
  */
  @property bool showLineMarks()
  {
    return getShowLineMarks();
  }

  /**
      Set `showLineMarks` property.
      Params:
        propval = Whether to display line mark pixbufs
  */
  @property void showLineMarks(bool propval)
  {
    return setShowLineMarks(propval);
  }

  /**
      Get `showLineNumbers` property.
      Returns: Whether to display line numbers
  */
  @property bool showLineNumbers()
  {
    return getShowLineNumbers();
  }

  /**
      Set `showLineNumbers` property.
      Params:
        propval = Whether to display line numbers
  */
  @property void showLineNumbers(bool propval)
  {
    return setShowLineNumbers(propval);
  }

  /**
      Get `showRightMargin` property.
      Returns: Whether to display the right margin.
  */
  @property bool showRightMargin()
  {
    return getShowRightMargin();
  }

  /**
      Set `showRightMargin` property.
      Params:
        propval = Whether to display the right margin.
  */
  @property void showRightMargin(bool propval)
  {
    return setShowRightMargin(propval);
  }

  /**
      Get `smartBackspace` property.
      Returns: Whether smart Backspace should be used.
  */
  @property bool smartBackspace()
  {
    return getSmartBackspace();
  }

  /**
      Set `smartBackspace` property.
      Params:
        propval = Whether smart Backspace should be used.
  */
  @property void smartBackspace(bool propval)
  {
    return setSmartBackspace(propval);
  }

  /**
      Get `smartHomeEnd` property.
      Returns: Set the behavior of the HOME and END keys.
  */
  @property gtksource.types.SmartHomeEndType smartHomeEnd()
  {
    return getSmartHomeEnd();
  }

  /**
      Set `smartHomeEnd` property.
      Params:
        propval = Set the behavior of the HOME and END keys.
  */
  @property void smartHomeEnd(gtksource.types.SmartHomeEndType propval)
  {
    return setSmartHomeEnd(propval);
  }

  /**
      Get `spaceDrawer` property.
      Returns: The #GtkSourceSpaceDrawer object associated with the view.
  */
  @property gtksource.space_drawer.SpaceDrawer spaceDrawer()
  {
    return getSpaceDrawer();
  }

  /**
      Get `tabWidth` property.
      Returns: Width of a tab character expressed in number of spaces.
  */
  @property uint tabWidth()
  {
    return getTabWidth();
  }

  /**
      Set `tabWidth` property.
      Params:
        propval = Width of a tab character expressed in number of spaces.
  */
  @property void tabWidth(uint propval)
  {
    return setTabWidth(propval);
  }

  /**
      Creates a new #GtkSourceView.
      
      By default, an empty #GtkSourceBuffer will be lazily created and can be
      retrieved with [gtk.text_view.TextView.getBuffer].
      
      If you want to specify your own buffer, either override the
      #GtkTextViewClass create_buffer factory method, or use
      [gtksource.view.View.newWithBuffer].
      Returns: a new #GtkSourceView.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_view_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkSourceView widget displaying the buffer
      buffer. One buffer can be shared among many widgets.
  
      Params:
        buffer = a #GtkSourceBuffer.
      Returns: a new #GtkSourceView.
  */
  static gtksource.view.View newWithBuffer(gtksource.buffer.Buffer buffer)
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_view_new_with_buffer(buffer ? cast(GtkSourceBuffer*)buffer._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.view.View)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether auto-indentation of text is enabled.
      Returns: true if auto indentation is enabled.
  */
  bool getAutoIndent()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_auto_indent(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the #GtkSourceBackgroundPatternType specifying if and how
      the background pattern should be displayed for this view.
      Returns: the #GtkSourceBackgroundPatternType.
  */
  gtksource.types.BackgroundPatternType getBackgroundPattern()
  {
    GtkSourceBackgroundPatternType _cretval;
    _cretval = gtk_source_view_get_background_pattern(cast(GtkSourceView*)this._cPtr);
    gtksource.types.BackgroundPatternType _retval = cast(gtksource.types.BackgroundPatternType)_cretval;
    return _retval;
  }

  /**
      Gets the #GtkSourceCompletion associated with view. The returned object is
      guaranteed to be the same for the lifetime of view. Each #GtkSourceView
      object has a different #GtkSourceCompletion.
      Returns: the #GtkSourceCompletion associated with view.
  */
  gtksource.completion.Completion getCompletion()
  {
    GtkSourceCompletion* _cretval;
    _cretval = gtk_source_view_get_completion(cast(GtkSourceView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.completion.Completion)(cast(GtkSourceCompletion*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkSourceGutter object associated with window_type for view.
      Only GTK_TEXT_WINDOW_LEFT and GTK_TEXT_WINDOW_RIGHT are supported,
      respectively corresponding to the left and right gutter. The line numbers
      and mark category icons are rendered in the left gutter.
  
      Params:
        windowType = the gutter window type.
      Returns: the #GtkSourceGutter.
  */
  gtksource.gutter.Gutter getGutter(gtk.types.TextWindowType windowType)
  {
    GtkSourceGutter* _cretval;
    _cretval = gtk_source_view_get_gutter(cast(GtkSourceView*)this._cPtr, windowType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.gutter.Gutter)(cast(GtkSourceGutter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the current line is highlighted.
      Returns: true if the current line is highlighted.
  */
  bool getHighlightCurrentLine()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_highlight_current_line(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether when the tab key is pressed the current selection
      should get indented instead of replaced with the \t character.
      Returns: true if the selection is indented when tab is pressed.
  */
  bool getIndentOnTab()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_indent_on_tab(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of spaces to use for each step of indent.
      See [gtksource.view.View.setIndentWidth] for details.
      Returns: indent width.
  */
  int getIndentWidth()
  {
    int _retval;
    _retval = gtk_source_view_get_indent_width(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether when inserting a tabulator character it should
      be replaced by a group of space characters.
      Returns: true if spaces are inserted instead of tabs.
  */
  bool getInsertSpacesInsteadOfTabs()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_insert_spaces_instead_of_tabs(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Gets attributes and priority for the category.
  
      Params:
        category = the category.
        priority = place where priority of the category will be stored.
      Returns: #GtkSourceMarkAttributes for the category.
        The object belongs to view, so it must not be unreffed.
  */
  gtksource.mark_attributes.MarkAttributes getMarkAttributes(string category, out int priority)
  {
    GtkSourceMarkAttributes* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_view_get_mark_attributes(cast(GtkSourceView*)this._cPtr, _category, cast(int*)&priority);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.mark_attributes.MarkAttributes)(cast(GtkSourceMarkAttributes*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position of the right margin in the given view.
      Returns: the position of the right margin.
  */
  uint getRightMarginPosition()
  {
    uint _retval;
    _retval = gtk_source_view_get_right_margin_position(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether line marks are displayed beside the text.
      Returns: true if the line marks are displayed.
  */
  bool getShowLineMarks()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_show_line_marks(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether line numbers are displayed beside the text.
      Returns: true if the line numbers are displayed.
  */
  bool getShowLineNumbers()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_show_line_numbers(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether a right margin is displayed.
      Returns: true if the right margin is shown.
  */
  bool getShowRightMargin()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_show_right_margin(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if pressing the Backspace key will try to delete spaces
      up to the previous tab stop.
      Returns: true if smart Backspace handling is enabled.
  */
  bool getSmartBackspace()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_smart_backspace(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns a #GtkSourceSmartHomeEndType end value specifying
      how the cursor will move when HOME and END keys are pressed.
      Returns: a #GtkSourceSmartHomeEndType value.
  */
  gtksource.types.SmartHomeEndType getSmartHomeEnd()
  {
    GtkSourceSmartHomeEndType _cretval;
    _cretval = gtk_source_view_get_smart_home_end(cast(GtkSourceView*)this._cPtr);
    gtksource.types.SmartHomeEndType _retval = cast(gtksource.types.SmartHomeEndType)_cretval;
    return _retval;
  }

  /**
      Gets the #GtkSourceSpaceDrawer associated with view. The returned object is
      guaranteed to be the same for the lifetime of view. Each #GtkSourceView
      object has a different #GtkSourceSpaceDrawer.
      Returns: the #GtkSourceSpaceDrawer associated with view.
  */
  gtksource.space_drawer.SpaceDrawer getSpaceDrawer()
  {
    GtkSourceSpaceDrawer* _cretval;
    _cretval = gtk_source_view_get_space_drawer(cast(GtkSourceView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.space_drawer.SpaceDrawer)(cast(GtkSourceSpaceDrawer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the width of tabulation in characters.
      Returns: width of tab.
  */
  uint getTabWidth()
  {
    uint _retval;
    _retval = gtk_source_view_get_tab_width(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Determines the visual column at iter taking into consideration the
      #GtkSourceView:tab-width of view.
  
      Params:
        iter = a position in view.
      Returns: the visual column at iter.
  */
  uint getVisualColumn(gtk.text_iter.TextIter iter)
  {
    uint _retval;
    _retval = gtk_source_view_get_visual_column(cast(GtkSourceView*)this._cPtr, cast(const(GtkTextIter)*)&iter);
    return _retval;
  }

  /**
      Inserts one indentation level at the beginning of the specified lines. The
      empty lines are not indented.
  
      Params:
        start = #GtkTextIter of the first line to indent
        end = #GtkTextIter of the last line to indent
  */
  void indentLines(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_view_indent_lines(cast(GtkSourceView*)this._cPtr, cast(GtkTextIter*)&start, cast(GtkTextIter*)&end);
  }

  /**
      If true auto-indentation of text is enabled.
      
      When Enter is pressed to create a new line, the auto-indentation inserts the
      same indentation as the previous line. This is <emphasis>not</emphasis> a
      "smart indentation" where an indentation level is added or removed depending
      on the context.
  
      Params:
        enable = whether to enable auto indentation.
  */
  void setAutoIndent(bool enable)
  {
    gtk_source_view_set_auto_indent(cast(GtkSourceView*)this._cPtr, enable);
  }

  /**
      Set if and how the background pattern should be displayed.
  
      Params:
        backgroundPattern = the #GtkSourceBackgroundPatternType.
  */
  void setBackgroundPattern(gtksource.types.BackgroundPatternType backgroundPattern)
  {
    gtk_source_view_set_background_pattern(cast(GtkSourceView*)this._cPtr, backgroundPattern);
  }

  /**
      If highlight is true the current line will be highlighted.
  
      Params:
        highlight = whether to highlight the current line.
  */
  void setHighlightCurrentLine(bool highlight)
  {
    gtk_source_view_set_highlight_current_line(cast(GtkSourceView*)this._cPtr, highlight);
  }

  /**
      If true, when the tab key is pressed when several lines are selected, the
      selected lines are indented of one level instead of being replaced with a \t
      character. Shift+Tab unindents the selection.
      
      If the first or last line is not selected completely, it is also indented or
      unindented.
      
      When the selection doesn't span several lines, the tab key always replaces
      the selection with a normal \t character.
  
      Params:
        enable = whether to indent a block when tab is pressed.
  */
  void setIndentOnTab(bool enable)
  {
    gtk_source_view_set_indent_on_tab(cast(GtkSourceView*)this._cPtr, enable);
  }

  /**
      Sets the number of spaces to use for each step of indent when the tab key is
      pressed. If width is -1, the value of the #GtkSourceView:tab-width property
      will be used.
      
      The #GtkSourceView:indent-width interacts with the
      #GtkSourceView:insert-spaces-instead-of-tabs property and
      #GtkSourceView:tab-width. An example will be clearer: if the
      #GtkSourceView:indent-width is 4 and
      #GtkSourceView:tab-width is 8 and
      #GtkSourceView:insert-spaces-instead-of-tabs is false, then pressing the tab
      key at the beginning of a line will insert 4 spaces. So far so good. Pressing
      the tab key a second time will remove the 4 spaces and insert a \t character
      instead (since #GtkSourceView:tab-width is 8). On the other hand, if
      #GtkSourceView:insert-spaces-instead-of-tabs is true, the second tab key
      pressed will insert 4 more spaces for a total of 8 spaces in the
      #GtkTextBuffer.
      
      The test-widget program (available in the GtkSourceView repository) may be
      useful to better understand the indentation settings (enable the space
      drawing!).
  
      Params:
        width = indent width in characters.
  */
  void setIndentWidth(int width)
  {
    gtk_source_view_set_indent_width(cast(GtkSourceView*)this._cPtr, width);
  }

  /**
      If true a tab key pressed is replaced by a group of space characters. Of
      course it is still possible to insert a real \t programmatically with the
      #GtkTextBuffer API.
  
      Params:
        enable = whether to insert spaces instead of tabs.
  */
  void setInsertSpacesInsteadOfTabs(bool enable)
  {
    gtk_source_view_set_insert_spaces_instead_of_tabs(cast(GtkSourceView*)this._cPtr, enable);
  }

  /**
      Sets attributes and priority for the category.
  
      Params:
        category = the category.
        attributes = mark attributes.
        priority = priority of the category.
  */
  void setMarkAttributes(string category, gtksource.mark_attributes.MarkAttributes attributes, int priority)
  {
    const(char)* _category = category.toCString(No.Alloc);
    gtk_source_view_set_mark_attributes(cast(GtkSourceView*)this._cPtr, _category, attributes ? cast(GtkSourceMarkAttributes*)attributes._cPtr(No.Dup) : null, priority);
  }

  /**
      Sets the position of the right margin in the given view.
  
      Params:
        pos = the width in characters where to position the right margin.
  */
  void setRightMarginPosition(uint pos)
  {
    gtk_source_view_set_right_margin_position(cast(GtkSourceView*)this._cPtr, pos);
  }

  /**
      If true line marks will be displayed beside the text.
  
      Params:
        show = whether line marks should be displayed.
  */
  void setShowLineMarks(bool show)
  {
    gtk_source_view_set_show_line_marks(cast(GtkSourceView*)this._cPtr, show);
  }

  /**
      If true line numbers will be displayed beside the text.
  
      Params:
        show = whether line numbers should be displayed.
  */
  void setShowLineNumbers(bool show)
  {
    gtk_source_view_set_show_line_numbers(cast(GtkSourceView*)this._cPtr, show);
  }

  /**
      If true a right margin is displayed.
  
      Params:
        show = whether to show a right margin.
  */
  void setShowRightMargin(bool show)
  {
    gtk_source_view_set_show_right_margin(cast(GtkSourceView*)this._cPtr, show);
  }

  /**
      When set to true, pressing the Backspace key will try to delete spaces
      up to the previous tab stop.
  
      Params:
        smartBackspace = whether to enable smart Backspace handling.
  */
  void setSmartBackspace(bool smartBackspace)
  {
    gtk_source_view_set_smart_backspace(cast(GtkSourceView*)this._cPtr, smartBackspace);
  }

  /**
      Set the desired movement of the cursor when HOME and END keys
      are pressed.
  
      Params:
        smartHomeEnd = the desired behavior among #GtkSourceSmartHomeEndType.
  */
  void setSmartHomeEnd(gtksource.types.SmartHomeEndType smartHomeEnd)
  {
    gtk_source_view_set_smart_home_end(cast(GtkSourceView*)this._cPtr, smartHomeEnd);
  }

  /**
      Sets the width of tabulation in characters. The #GtkTextBuffer still contains
      \t characters, but they can take a different visual width in a #GtkSourceView
      widget.
  
      Params:
        width = width of tab in characters.
  */
  void setTabWidth(uint width)
  {
    gtk_source_view_set_tab_width(cast(GtkSourceView*)this._cPtr, width);
  }

  /**
      Removes one indentation level at the beginning of the
      specified lines.
  
      Params:
        start = #GtkTextIter of the first line to indent
        end = #GtkTextIter of the last line to indent
  */
  void unindentLines(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_view_unindent_lines(cast(GtkSourceView*)this._cPtr, cast(GtkTextIter*)&start, cast(GtkTextIter*)&end);
  }

  /**
      Connect to `ChangeCase` signal.
  
      Keybinding signal to change case of the text at the current cursor position.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.types.ChangeCaseType caseType, gtksource.view.View view))
  
          `caseType` the case to use (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChangeCase(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtksource.types.ChangeCaseType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.view.View)))
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
    return connectSignalClosure("change-case", closure, after);
  }

  /**
      Connect to `ChangeNumber` signal.
  
      Keybinding signal to edit a number at the current cursor position.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int count, gtksource.view.View view))
  
          `count` the number to add to the number at the current position (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChangeNumber(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.view.View)))
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
    return connectSignalClosure("change-number", closure, after);
  }

  /**
      Connect to `JoinLines` signal.
  
      Keybinding signal to join the lines currently selected.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.view.View view))
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectJoinLines(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.view.View)))
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
    return connectSignalClosure("join-lines", closure, after);
  }

  /**
      Connect to `LineMarkActivated` signal.
  
      Emitted when a line mark has been activated (for instance when there
        was a button press in the line marks gutter). You can use iter to
        determine on which line the activation took place.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter iter, gdk.event.Event event, gtksource.view.View view))
  
          `iter` a #GtkTextIter (optional)
  
          `event` the #GdkEvent that activated the event (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLineMarkActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.event.Event)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.view.View)))
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
    return connectSignalClosure("line-mark-activated", closure, after);
  }

  /**
      Connect to `MoveLines` signal.
  
      The ::move-lines signal is a keybinding which gets emitted
        when the user initiates moving a line. The default binding key
        is Alt+Up/Down arrow. And moves the currently selected lines,
        or the current line up or down by one line.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(bool down, gtksource.view.View view))
  
          `down` true to move down, false to move up. (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveLines(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.view.View)))
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
    return connectSignalClosure("move-lines", closure, after);
  }

  /**
      Connect to `MoveToMatchingBracket` signal.
  
      Keybinding signal to move the cursor to the matching bracket.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(bool extendSelection, gtksource.view.View view))
  
          `extendSelection` true if the move should extend the selection (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveToMatchingBracket(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.view.View)))
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
    return connectSignalClosure("move-to-matching-bracket", closure, after);
  }

  /**
      Connect to `MoveWords` signal.
  
      The ::move-words signal is a keybinding which gets emitted
        when the user initiates moving a word. The default binding key
        is Alt+Left/Right Arrow and moves the current selection, or the current
        word by one word.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int count, gtksource.view.View view))
  
          `count` the number of words to move over (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveWords(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.view.View)))
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
    return connectSignalClosure("move-words", closure, after);
  }

  /**
      Connect to `Redo` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.view.View view))
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRedo(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.view.View)))
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
      Connect to `ShowCompletion` signal.
  
      The ::show-completion signal is a key binding signal which gets
        emitted when the user requests a completion, by pressing
        <keycombo><keycap>Control</keycap><keycap>space</keycap></keycombo>.
        
        This will create a #GtkSourceCompletionContext with the activation
        type as [gtksource.types.CompletionActivation.UserRequested].
        
        Applications should not connect to it, but may emit it with
        [gobject.global.signalEmitByName] if they need to activate the completion by
        another means, for example with another key binding or a menu entry.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.view.View view))
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShowCompletion(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.view.View)))
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
    return connectSignalClosure("show-completion", closure, after);
  }

  /**
      Connect to `SmartHomeEnd` signal.
  
      Emitted when a the cursor was moved according to the smart home
        end setting. The signal is emitted after the cursor is moved, but
        during the GtkTextView::move-cursor action. This can be used to find
        out whether the cursor was moved by a normal home/end or by a smart
        home/end.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter iter, int count, gtksource.view.View view))
  
          `iter` a #GtkTextIter (optional)
  
          `count` the count (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSmartHomeEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.view.View)))
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
    return connectSignalClosure("smart-home-end", closure, after);
  }

  /**
      Connect to `Undo` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.view.View view))
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUndo(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.view.View)))
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
