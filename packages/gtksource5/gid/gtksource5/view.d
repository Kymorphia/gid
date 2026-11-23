/// Module for [View] class
module gid.gtksource5.view;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.accessible_text;
import gid.gtk4.accessible_text_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.scrollable;
import gid.gtk4.scrollable_mixin;
import gid.gtk4.text_iter;
import gid.gtk4.text_view;
import gid.gtk4.types;
import gid.gtksource5.annotations;
import gid.gtksource5.buffer;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.completion;
import gid.gtksource5.gutter;
import gid.gtksource5.hover;
import gid.gtksource5.indenter;
import gid.gtksource5.mark_attributes;
import gid.gtksource5.snippet;
import gid.gtksource5.space_drawer;
import gid.gtksource5.types;

/**
    Subclass of [gid.gtk4.text_view.TextView].
    
    [gid.gtksource5.view.View] is the main class of the GtkSourceView library.
    Use a [gid.gtksource5.buffer.Buffer] to display text with a [gid.gtksource5.view.View].
    
    This class provides:
    
     - Show the line numbers;
     - Show a right margin;
     - Highlight the current line;
     - Indentation settings;
     - Configuration for the Home and End keyboard keys;
     - Configure and show line marks;
     - And a few other things.
    
    An easy way to test all these features is to use the test-widget mini-program
    provided in the GtkSourceView repository, in the tests/ directory.
    
    # GtkSourceView as GtkBuildable
    
    The GtkSourceView implementation of the [gid.gtk4.buildable.Buildable] interface exposes the
    [gid.gtksource5.view.View.completion] object with the internal-child "completion".
    
    An example of a UI definition fragment with GtkSourceView:
    ```xml
    <object class="GtkSourceView" id="source_view">
      <property name="tab-width">4</property>
      <property name="auto-indent">True</property>
      <child internal-child="completion">
        <object class="GtkSourceCompletion">
          <property name="select-on-show">False</property>
        </object>
      </child>
    </object>
    ```
    
    # Changing the Font
    
    Gtk CSS provides the best way to change the font for a [gid.gtksource5.view.View] in a
    manner that allows for components like [gid.gtksource5.map.Map] to scale the desired
    font.
    
    ```c
    GtkCssProvider *provider = gtk_css_provider_new ();
    gtk_css_provider_load_from_string (provider,
                                      "textview { font-family: Monospace; font-size: 8pt; }");
    gtk_style_context_add_provider (gtk_widget_get_style_context (view),
                                    GTK_STYLE_PROVIDER (provider),
                                    GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);
    g_object_unref (provider);
    ```
    ```python
    provider = Gtk.CssProvider()
    provider.load_from_string("textview { font-family: Monospace; font-size: 8pt; }")
    style_context = view.get_style_context()
    style_context.add_provider(provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)
    ```
    
    If you need to adjust the font or size of font within a portion of the
    document only, you should use a [gid.gtk4.text_tag.TextTag] with the [gid.gtk4.text_tag.TextTag.family] or
    [gid.gtk4.text_tag.TextTag.scale] set so that the font size may be scaled relative to
    the default font set in CSS.
*/
class View : gid.gtk4.text_view.TextView
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
    return cast(void function())gtk_source_view_get_type != &gidSymbolNotFound ? gtk_source_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceView";
  }

  /** Returns `this`, for use in `with` statements. */
  override View self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.view.View]
      Returns: New builder object
  */
  static ViewGidBuilder builder() nothrow
  {
    return new ViewGidBuilder;
  }

  /**
      Get `annotations` property.
      Returns: The [gid.gtksource5.annotations.Annotations] object associated with the view.
  */
  @property gid.gtksource5.annotations.Annotations annotations() nothrow
  {
    return getAnnotations();
  }

  /** */
  @property bool autoIndent() nothrow
  {
    return getAutoIndent();
  }

  /** */
  @property void autoIndent(bool propval) nothrow
  {
    setAutoIndent(propval);
  }

  /**
      Get `backgroundPattern` property.
      Returns: Draw a specific background pattern on the view.
  */
  @property gid.gtksource5.types.BackgroundPatternType backgroundPattern() nothrow
  {
    return getBackgroundPattern();
  }

  /**
      Set `backgroundPattern` property.
      Params:
        propval = Draw a specific background pattern on the view.
  */
  @property void backgroundPattern(gid.gtksource5.types.BackgroundPatternType propval) nothrow
  {
    setBackgroundPattern(propval);
  }

  /**
      Get `completion` property.
      Returns: The completion object associated with the view
  */
  @property gid.gtksource5.completion.Completion completion() nothrow
  {
    return getCompletion();
  }

  /**
      Get `enableSnippets` property.
      Returns: The property denotes if snippets should be
        expanded when the user presses Tab after having typed a word
        matching the snippets found in [gid.gtksource5.snippet_manager.SnippetManager].
        
        The user may tab through focus-positions of the snippet if any
        are available by pressing Tab repeatedly until the desired focus
        position is selected.
  */
  @property bool enableSnippets() nothrow
  {
    return getEnableSnippets();
  }

  /**
      Set `enableSnippets` property.
      Params:
        propval = The property denotes if snippets should be
          expanded when the user presses Tab after having typed a word
          matching the snippets found in [gid.gtksource5.snippet_manager.SnippetManager].
          
          The user may tab through focus-positions of the snippet if any
          are available by pressing Tab repeatedly until the desired focus
          position is selected.
  */
  @property void enableSnippets(bool propval) nothrow
  {
    setEnableSnippets(propval);
  }

  /** */
  @property bool highlightCurrentLine() nothrow
  {
    return getHighlightCurrentLine();
  }

  /** */
  @property void highlightCurrentLine(bool propval) nothrow
  {
    setHighlightCurrentLine(propval);
  }

  /** */
  @property bool indentOnTab() nothrow
  {
    return getIndentOnTab();
  }

  /** */
  @property void indentOnTab(bool propval) nothrow
  {
    setIndentOnTab(propval);
  }

  /**
      Get `indentWidth` property.
      Returns: Width of an indentation step expressed in number of spaces.
  */
  @property int indentWidth() nothrow
  {
    return getIndentWidth();
  }

  /**
      Set `indentWidth` property.
      Params:
        propval = Width of an indentation step expressed in number of spaces.
  */
  @property void indentWidth(int propval) nothrow
  {
    setIndentWidth(propval);
  }

  /**
      Get `indenter` property.
      Returns: The property is a [gid.gtksource5.indenter.Indenter] to use to indent
        as the user types into the [gid.gtksource5.view.View].
  */
  @property gid.gtksource5.indenter.Indenter indenter() nothrow
  {
    return getIndenter();
  }

  /**
      Set `indenter` property.
      Params:
        propval = The property is a [gid.gtksource5.indenter.Indenter] to use to indent
          as the user types into the [gid.gtksource5.view.View].
  */
  @property void indenter(gid.gtksource5.indenter.Indenter propval) nothrow
  {
    setIndenter(propval);
  }

  /** */
  @property bool insertSpacesInsteadOfTabs() nothrow
  {
    return getInsertSpacesInsteadOfTabs();
  }

  /** */
  @property void insertSpacesInsteadOfTabs(bool propval) nothrow
  {
    setInsertSpacesInsteadOfTabs(propval);
  }

  /**
      Get `rightMarginPosition` property.
      Returns: Position of the right margin.
  */
  @property uint rightMarginPosition() nothrow
  {
    return getRightMarginPosition();
  }

  /**
      Set `rightMarginPosition` property.
      Params:
        propval = Position of the right margin.
  */
  @property void rightMarginPosition(uint propval) nothrow
  {
    setRightMarginPosition(propval);
  }

  /**
      Get `showLineMarks` property.
      Returns: Whether to display line mark pixbufs
  */
  @property bool showLineMarks() nothrow
  {
    return getShowLineMarks();
  }

  /**
      Set `showLineMarks` property.
      Params:
        propval = Whether to display line mark pixbufs
  */
  @property void showLineMarks(bool propval) nothrow
  {
    setShowLineMarks(propval);
  }

  /**
      Get `showLineNumbers` property.
      Returns: Whether to display line numbers
  */
  @property bool showLineNumbers() nothrow
  {
    return getShowLineNumbers();
  }

  /**
      Set `showLineNumbers` property.
      Params:
        propval = Whether to display line numbers
  */
  @property void showLineNumbers(bool propval) nothrow
  {
    setShowLineNumbers(propval);
  }

  /**
      Get `showRightMargin` property.
      Returns: Whether to display the right margin.
  */
  @property bool showRightMargin() nothrow
  {
    return getShowRightMargin();
  }

  /**
      Set `showRightMargin` property.
      Params:
        propval = Whether to display the right margin.
  */
  @property void showRightMargin(bool propval) nothrow
  {
    setShowRightMargin(propval);
  }

  /**
      Get `smartBackspace` property.
      Returns: Whether smart Backspace should be used.
  */
  @property bool smartBackspace() nothrow
  {
    return getSmartBackspace();
  }

  /**
      Set `smartBackspace` property.
      Params:
        propval = Whether smart Backspace should be used.
  */
  @property void smartBackspace(bool propval) nothrow
  {
    setSmartBackspace(propval);
  }

  /**
      Get `smartHomeEnd` property.
      Returns: Set the behavior of the HOME and END keys.
  */
  @property gid.gtksource5.types.SmartHomeEndType smartHomeEnd() nothrow
  {
    return getSmartHomeEnd();
  }

  /**
      Set `smartHomeEnd` property.
      Params:
        propval = Set the behavior of the HOME and END keys.
  */
  @property void smartHomeEnd(gid.gtksource5.types.SmartHomeEndType propval) nothrow
  {
    setSmartHomeEnd(propval);
  }

  /**
      Get `spaceDrawer` property.
      Returns: The [gid.gtksource5.space_drawer.SpaceDrawer] object associated with the view.
  */
  @property gid.gtksource5.space_drawer.SpaceDrawer spaceDrawer() nothrow
  {
    return getSpaceDrawer();
  }

  /**
      Get `tabWidth` property.
      Returns: Width of a tab character expressed in number of spaces.
  */
  @property uint tabWidth() nothrow
  {
    return getTabWidth();
  }

  /**
      Set `tabWidth` property.
      Params:
        propval = Width of a tab character expressed in number of spaces.
  */
  @property void tabWidth(uint propval) nothrow
  {
    setTabWidth(propval);
  }

  /**
      Creates a new [gid.gtksource5.view.View].
      
      By default, an empty [gid.gtksource5.buffer.Buffer] will be lazily created and can be
      retrieved with [gid.gtk4.text_view.TextView.getBuffer].
      
      If you want to specify your own buffer, either override the
      `vfuncGtk.TextView.create_buffer` factory method, or use
      [gid.gtksource5.view.View.newWithBuffer].
      Returns: a new #GtkSourceView.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_source_view_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkSourceView widget displaying the buffer buffer.
      
      One buffer can be shared among many widgets.
  
      Params:
        buffer = a #GtkSourceBuffer.
      Returns: a new #GtkSourceView.
  */
  static gid.gtksource5.view.View newWithBuffer(gid.gtksource5.buffer.Buffer buffer) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_view_new_with_buffer(buffer ? cast(GtkSourceBuffer*)buffer._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.view.View)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected void vfuncLineMarkActivated(gid.gtk4.text_iter.TextIter iter, uint button, gid.gdk4.types.ModifierType state, int nPresses)
  {
    auto _klass = cast(GtkSourceViewClass*)_vfuncClass;
    if (!_klass.lineMarkActivated)
      return;

    _klass.lineMarkActivated(cast(GtkSourceView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, button, state, nPresses);
  }

  /** */
  protected void vfuncMoveLines(bool down)
  {
    auto _klass = cast(GtkSourceViewClass*)_vfuncClass;
    if (!_klass.moveLines)
      return;

    _klass.moveLines(cast(GtkSourceView*)this._cPtr, down);
  }

  /** */
  protected void vfuncMoveWords(int step)
  {
    auto _klass = cast(GtkSourceViewClass*)_vfuncClass;
    if (!_klass.moveWords)
      return;

    _klass.moveWords(cast(GtkSourceView*)this._cPtr, step);
  }

  /**
      Inserts a new snippet at location
      
      If another snippet was already active, it will be paused and the new
      snippet will become active. Once the focus positions of snippet have
      been exhausted, editing will return to the previous snippet.
  
      Params:
        snippet = a #GtkSourceSnippet
        location = a #GtkTextIter or null for the cursor position (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPushSnippet` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncPushSnippet(gid.gtksource5.snippet.Snippet snippet, gid.gtk4.text_iter.TextIter location = null)
  {
    auto _klass = cast(GtkSourceViewClass*)_vfuncClass;
    if (!_klass.pushSnippet)
      return;

    _klass.pushSnippet(cast(GtkSourceView*)this._cPtr, snippet ? cast(GtkSourceSnippet*)snippet._cPtr(No.Dup) : null, location ? cast(GtkTextIter*)location._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncShowCompletion()
  {
    auto _klass = cast(GtkSourceViewClass*)_vfuncClass;
    if (!_klass.showCompletion)
      return;

    _klass.showCompletion(cast(GtkSourceView*)this._cPtr);
  }

  /**
      Gets the [gid.gtksource5.annotations.Annotations] associated with view.
      
      The returned object is guaranteed to be the same for the lifetime of view.
      Each [gid.gtksource5.view.View] object has a different [gid.gtksource5.annotations.Annotations].
      Returns: the #GtkSourceAnnotations associated with view.
  */
  gid.gtksource5.annotations.Annotations getAnnotations() nothrow
  {
    GtkSourceAnnotations* _cretval;
    _cretval = gtk_source_view_get_annotations(cast(GtkSourceView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.annotations.Annotations)(cast(GtkSourceAnnotations*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether auto-indentation of text is enabled.
      Returns: true if auto indentation is enabled.
  */
  bool getAutoIndent() nothrow
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
  gid.gtksource5.types.BackgroundPatternType getBackgroundPattern() nothrow
  {
    GtkSourceBackgroundPatternType _cretval;
    _cretval = gtk_source_view_get_background_pattern(cast(GtkSourceView*)this._cPtr);
    gid.gtksource5.types.BackgroundPatternType _retval = cast(gid.gtksource5.types.BackgroundPatternType)_cretval;
    return _retval;
  }

  /**
      Gets the [gid.gtksource5.completion.Completion] associated with view.
      
      The returned object is guaranteed to be the same for the lifetime of view.
      Each [gid.gtksource5.view.View] object has a different [gid.gtksource5.completion.Completion].
      Returns: the #GtkSourceCompletion associated with view.
  */
  gid.gtksource5.completion.Completion getCompletion() nothrow
  {
    GtkSourceCompletion* _cretval;
    _cretval = gtk_source_view_get_completion(cast(GtkSourceView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.completion.Completion)(cast(GtkSourceCompletion*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gid.gtksource5.view.View.enableSnippets] property.
      
      If true, matching snippets found in the [gid.gtksource5.snippet_manager.SnippetManager]
      may be expanded when the user presses Tab after a word in the [gid.gtksource5.view.View].
      Returns: true if enabled
  */
  bool getEnableSnippets() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_enable_snippets(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the [gid.gtksource5.gutter.Gutter] object associated with window_type for view.
      
      Only [gid.gtk4.types.TextWindowType.Left] and [gid.gtk4.types.TextWindowType.Right] are supported,
      respectively corresponding to the left and right gutter. The line numbers
      and mark category icons are rendered in the left gutter.
  
      Params:
        windowType = the gutter window type.
      Returns: the #GtkSourceGutter.
  */
  override gid.gtksource5.gutter.Gutter getGutter(gid.gtk4.types.TextWindowType windowType) nothrow
  {
    GtkSourceGutter* _cretval;
    _cretval = gtk_source_view_get_gutter(cast(GtkSourceView*)this._cPtr, windowType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.gutter.Gutter)(cast(GtkSourceGutter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the current line is highlighted.
      Returns: true if the current line is highlighted.
  */
  bool getHighlightCurrentLine() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_highlight_current_line(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.gtksource5.hover.Hover] associated with view.
      
      The returned object is guaranteed to be the same for the lifetime of view.
      Each [gid.gtksource5.view.View] object has a different [gid.gtksource5.hover.Hover].
      Returns: a #GtkSourceHover associated with view.
  */
  gid.gtksource5.hover.Hover getHover() nothrow
  {
    GtkSourceHover* _cretval;
    _cretval = gtk_source_view_get_hover(cast(GtkSourceView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.hover.Hover)(cast(GtkSourceHover*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether when the tab key is pressed the current selection
      should get indented instead of replaced with the `\t` character.
      Returns: true if the selection is indented when tab is pressed.
  */
  bool getIndentOnTab() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_indent_on_tab(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of spaces to use for each step of indent.
      
      See [gid.gtksource5.view.View.setIndentWidth] for details.
      Returns: indent width.
  */
  int getIndentWidth() nothrow
  {
    int _retval;
    _retval = gtk_source_view_get_indent_width(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.gtksource5.view.View.indenter] property.
      Returns: a #GtkSourceIndenter or null
  */
  gid.gtksource5.indenter.Indenter getIndenter() nothrow
  {
    GtkSourceIndenter* _cretval;
    _cretval = gtk_source_view_get_indenter(cast(GtkSourceView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.indenter.Indenter)(cast(GtkSourceIndenter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether when inserting a tabulator character it should
      be replaced by a group of space characters.
      Returns: true if spaces are inserted instead of tabs.
  */
  bool getInsertSpacesInsteadOfTabs() nothrow
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
  gid.gtksource5.mark_attributes.MarkAttributes getMarkAttributes(string category, out int priority) nothrow
  {
    GtkSourceMarkAttributes* _cretval;
    const(char)* _category = category.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_source_view_get_mark_attributes(cast(GtkSourceView*)this._cPtr, _category, cast(int*)&priority);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.mark_attributes.MarkAttributes)(cast(GtkSourceMarkAttributes*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position of the right margin in the given view.
      Returns: the position of the right margin.
  */
  uint getRightMarginPosition() nothrow
  {
    uint _retval;
    _retval = gtk_source_view_get_right_margin_position(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether line marks are displayed beside the text.
      Returns: true if the line marks are displayed.
  */
  bool getShowLineMarks() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_show_line_marks(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether line numbers are displayed beside the text.
      Returns: true if the line numbers are displayed.
  */
  bool getShowLineNumbers() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_show_line_numbers(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether a right margin is displayed.
      Returns: true if the right margin is shown.
  */
  bool getShowRightMargin() nothrow
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
  bool getSmartBackspace() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_view_get_smart_backspace(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Returns a [gid.gtksource5.types.SmartHomeEndType] end value specifying
      how the cursor will move when HOME and END keys are pressed.
      Returns: a #GtkSourceSmartHomeEndType value.
  */
  gid.gtksource5.types.SmartHomeEndType getSmartHomeEnd() nothrow
  {
    GtkSourceSmartHomeEndType _cretval;
    _cretval = gtk_source_view_get_smart_home_end(cast(GtkSourceView*)this._cPtr);
    gid.gtksource5.types.SmartHomeEndType _retval = cast(gid.gtksource5.types.SmartHomeEndType)_cretval;
    return _retval;
  }

  /**
      Gets the [gid.gtksource5.space_drawer.SpaceDrawer] associated with view.
      
      The returned object is guaranteed to be the same for the lifetime of view.
      Each [gid.gtksource5.view.View] object has a different [gid.gtksource5.space_drawer.SpaceDrawer].
      Returns: the #GtkSourceSpaceDrawer associated with view.
  */
  gid.gtksource5.space_drawer.SpaceDrawer getSpaceDrawer() nothrow
  {
    GtkSourceSpaceDrawer* _cretval;
    _cretval = gtk_source_view_get_space_drawer(cast(GtkSourceView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.space_drawer.SpaceDrawer)(cast(GtkSourceSpaceDrawer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the width of tabulation in characters.
      Returns: width of tab.
  */
  uint getTabWidth() nothrow
  {
    uint _retval;
    _retval = gtk_source_view_get_tab_width(cast(GtkSourceView*)this._cPtr);
    return _retval;
  }

  /**
      Determines the visual column at iter taking into consideration the
      [gid.gtksource5.view.View.tabWidth] of view.
  
      Params:
        iter = a position in view.
      Returns: the visual column at iter.
  */
  uint getVisualColumn(gid.gtk4.text_iter.TextIter iter) nothrow
  {
    uint _retval;
    _retval = gtk_source_view_get_visual_column(cast(GtkSourceView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Inserts one indentation level at the beginning of the specified lines. The
      empty lines are not indented.
  
      Params:
        start = #GtkTextIter of the first line to indent
        end = #GtkTextIter of the last line to indent
  */
  void indentLines(gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end) nothrow
  {
    gtk_source_view_indent_lines(cast(GtkSourceView*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      Inserts a new snippet at location
      
      If another snippet was already active, it will be paused and the new
      snippet will become active. Once the focus positions of snippet have
      been exhausted, editing will return to the previous snippet.
  
      Params:
        snippet = a #GtkSourceSnippet
        location = a #GtkTextIter or null for the cursor position
  */
  void pushSnippet(gid.gtksource5.snippet.Snippet snippet, gid.gtk4.text_iter.TextIter location = null) nothrow
  {
    gtk_source_view_push_snippet(cast(GtkSourceView*)this._cPtr, snippet ? cast(GtkSourceSnippet*)snippet._cPtr(No.Dup) : null, location ? cast(GtkTextIter*)location._cPtr(No.Dup) : null);
  }

  /**
      If true auto-indentation of text is enabled.
      
      When Enter is pressed to create a new line, the auto-indentation inserts the
      same indentation as the previous line. This is **not** a
      "smart indentation" where an indentation level is added or removed depending
      on the context.
  
      Params:
        enable = whether to enable auto indentation.
  */
  void setAutoIndent(bool enable) nothrow
  {
    gtk_source_view_set_auto_indent(cast(GtkSourceView*)this._cPtr, enable);
  }

  /**
      Set if and how the background pattern should be displayed.
  
      Params:
        backgroundPattern = the #GtkSourceBackgroundPatternType.
  */
  void setBackgroundPattern(gid.gtksource5.types.BackgroundPatternType backgroundPattern) nothrow
  {
    gtk_source_view_set_background_pattern(cast(GtkSourceView*)this._cPtr, backgroundPattern);
  }

  /**
      Sets the [gid.gtksource5.view.View.enableSnippets] property.
      
      If enable_snippets is true, matching snippets found in the
      [gid.gtksource5.snippet_manager.SnippetManager] may be expanded when the user presses
      Tab after a word in the [gid.gtksource5.view.View].
  
      Params:
        enableSnippets = if snippets should be enabled
  */
  void setEnableSnippets(bool enableSnippets) nothrow
  {
    gtk_source_view_set_enable_snippets(cast(GtkSourceView*)this._cPtr, enableSnippets);
  }

  /**
      If highlight is true the current line will be highlighted.
  
      Params:
        highlight = whether to highlight the current line.
  */
  void setHighlightCurrentLine(bool highlight) nothrow
  {
    gtk_source_view_set_highlight_current_line(cast(GtkSourceView*)this._cPtr, highlight);
  }

  /**
      If true, when the tab key is pressed when several lines are selected, the
      selected lines are indented of one level instead of being replaced with a `\t`
      character. Shift+Tab unindents the selection.
      
      If the first or last line is not selected completely, it is also indented or
      unindented.
      
      When the selection doesn't span several lines, the tab key always replaces
      the selection with a normal `\t` character.
  
      Params:
        enable = whether to indent a block when tab is pressed.
  */
  void setIndentOnTab(bool enable) nothrow
  {
    gtk_source_view_set_indent_on_tab(cast(GtkSourceView*)this._cPtr, enable);
  }

  /**
      Sets the number of spaces to use for each step of indent when the tab key is
      pressed.
      
      If width is -1, the value of the [gid.gtksource5.view.View.tabWidth] property
      will be used.
      
      The [gid.gtksource5.view.View.indentWidth] interacts with the
      [gid.gtksource5.view.View.insertSpacesInsteadOfTabs] property and
      [gid.gtksource5.view.View.tabWidth]. An example will be clearer:
      
      If the [gid.gtksource5.view.View.indentWidth] is 4 and [gid.gtksource5.view.View.tabWidth] is 8 and
      [gid.gtksource5.view.View.insertSpacesInsteadOfTabs] is false, then pressing the tab
      key at the beginning of a line will insert 4 spaces. So far so good. Pressing
      the tab key a second time will remove the 4 spaces and insert a `\t` character
      instead (since [gid.gtksource5.view.View.tabWidth] is 8). On the other hand, if
      [gid.gtksource5.view.View.insertSpacesInsteadOfTabs] is true, the second tab key
      pressed will insert 4 more spaces for a total of 8 spaces in the
      [gid.gtk4.text_buffer.TextBuffer].
      
      The test-widget program (available in the GtkSourceView repository) may be
      useful to better understand the indentation settings (enable the space
      drawing!).
  
      Params:
        width = indent width in characters.
  */
  void setIndentWidth(int width) nothrow
  {
    gtk_source_view_set_indent_width(cast(GtkSourceView*)this._cPtr, width);
  }

  /**
      Sets the indenter for view to indenter.
      
      Note that the indenter will not be used unless #GtkSourceView:auto-indent
      has been set to true.
  
      Params:
        indenter = a #GtkSourceIndenter or null
  */
  void setIndenter(gid.gtksource5.indenter.Indenter indenter = null) nothrow
  {
    gtk_source_view_set_indenter(cast(GtkSourceView*)this._cPtr, indenter ? cast(GtkSourceIndenter*)(cast(gid.gobject2.object.ObjectWrap)indenter)._cPtr(No.Dup) : null);
  }

  /**
      If true a tab key pressed is replaced by a group of space characters.
      
      Of course it is still possible to insert a real `\t` programmatically with the
      [gid.gtk4.text_buffer.TextBuffer] API.
  
      Params:
        enable = whether to insert spaces instead of tabs.
  */
  void setInsertSpacesInsteadOfTabs(bool enable) nothrow
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
  void setMarkAttributes(string category, gid.gtksource5.mark_attributes.MarkAttributes attributes, int priority) nothrow
  {
    const(char)* _category = category.toCString!(No.Malloc, No.Nullable);
    gtk_source_view_set_mark_attributes(cast(GtkSourceView*)this._cPtr, _category, attributes ? cast(GtkSourceMarkAttributes*)attributes._cPtr(No.Dup) : null, priority);
  }

  /**
      Sets the position of the right margin in the given view.
  
      Params:
        pos = the width in characters where to position the right margin.
  */
  void setRightMarginPosition(uint pos) nothrow
  {
    gtk_source_view_set_right_margin_position(cast(GtkSourceView*)this._cPtr, pos);
  }

  /**
      If true line marks will be displayed beside the text.
  
      Params:
        show = whether line marks should be displayed.
  */
  void setShowLineMarks(bool show) nothrow
  {
    gtk_source_view_set_show_line_marks(cast(GtkSourceView*)this._cPtr, show);
  }

  /**
      If true line numbers will be displayed beside the text.
  
      Params:
        show = whether line numbers should be displayed.
  */
  void setShowLineNumbers(bool show) nothrow
  {
    gtk_source_view_set_show_line_numbers(cast(GtkSourceView*)this._cPtr, show);
  }

  /**
      If true a right margin is displayed.
  
      Params:
        show = whether to show a right margin.
  */
  void setShowRightMargin(bool show) nothrow
  {
    gtk_source_view_set_show_right_margin(cast(GtkSourceView*)this._cPtr, show);
  }

  /**
      When set to true, pressing the Backspace key will try to delete spaces
      up to the previous tab stop.
  
      Params:
        smartBackspace = whether to enable smart Backspace handling.
  */
  void setSmartBackspace(bool smartBackspace) nothrow
  {
    gtk_source_view_set_smart_backspace(cast(GtkSourceView*)this._cPtr, smartBackspace);
  }

  /**
      Set the desired movement of the cursor when HOME and END keys
      are pressed.
  
      Params:
        smartHomeEnd = the desired behavior among #GtkSourceSmartHomeEndType.
  */
  void setSmartHomeEnd(gid.gtksource5.types.SmartHomeEndType smartHomeEnd) nothrow
  {
    gtk_source_view_set_smart_home_end(cast(GtkSourceView*)this._cPtr, smartHomeEnd);
  }

  /**
      Sets the width of tabulation in characters.
      
      The #GtkTextBuffer still contains `\t` characters,
      but they can take a different visual width in a [gid.gtksource5.view.View] widget.
  
      Params:
        width = width of tab in characters.
  */
  void setTabWidth(uint width) nothrow
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
  void unindentLines(gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end) nothrow
  {
    gtk_source_view_unindent_lines(cast(GtkSourceView*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ChangeCase` signal.
  
      Keybinding signal to change case of the text at the current cursor position.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource5.types.ChangeCaseType caseType, gid.gtksource5.view.View view)`
  
          `caseType` the case to use (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChangeCase(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtksource5.types.ChangeCaseType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtksource5.view.View)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.changeCase");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-case", closure, after);
  }

  /**
      Connect to `ChangeNumber` signal.
  
      Keybinding signal to edit a number at the current cursor position.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int count, gid.gtksource5.view.View view)`
  
          `count` the number to add to the number at the current position (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChangeNumber(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtksource5.view.View)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.changeNumber");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-number", closure, after);
  }

  /**
      Connect to `JoinLines` signal.
  
      Keybinding signal to join the lines currently selected.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource5.view.View view)`
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectJoinLines(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.view.View)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.joinLines");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("join-lines", closure, after);
  }

  /**
      Connect to `LineMarkActivated` signal.
  
      Emitted when a line mark has been activated (for instance when there
        was a button press in the line marks gutter).
        
        You can use iter to determine on which line the activation took place.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_iter.TextIter iter, uint button, gid.gdk4.types.ModifierType state, int nPresses, gid.gtksource5.view.View view)`
  
          `iter` a #GtkTextIter (optional)
  
          `button` the button that was pressed (optional)
  
          `state` the modifier state, if any (optional)
  
          `nPresses` the number of presses (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLineMarkActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gdk4.types.ModifierType)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == int)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtksource5.view.View)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.lineMarkActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("line-mark-activated", closure, after);
  }

  /**
      Connect to `MoveLines` signal.
  
      The signal is a keybinding which gets emitted when the user initiates moving a line.
        
        The default binding key is Alt+Up/Down arrow. And moves the currently selected lines,
        or the current line up or down by one line.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(bool down, gid.gtksource5.view.View view)`
  
          `down` true to move down, false to move up. (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveLines(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtksource5.view.View)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.moveLines");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-lines", closure, after);
  }

  /**
      Connect to `MoveToMatchingBracket` signal.
  
      Keybinding signal to move the cursor to the matching bracket.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(bool extendSelection, gid.gtksource5.view.View view)`
  
          `extendSelection` true if the move should extend the selection (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveToMatchingBracket(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtksource5.view.View)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.moveToMatchingBracket");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-to-matching-bracket", closure, after);
  }

  /**
      Connect to `MoveWords` signal.
  
      The signal is a keybinding which gets emitted when the user initiates moving a word.
        
        The default binding key is Alt+Left/Right Arrow and moves the current selection, or the current
        word by one word.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int count, gid.gtksource5.view.View view)`
  
          `count` the number of words to move over (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveWords(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtksource5.view.View)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.moveWords");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-words", closure, after);
  }

  /**
      Connect to `PushSnippet` signal.
  
      The signal is emitted to insert a new snippet into the view.
        
        If another snippet was active, it will be paused until all focus positions of snippet have been exhausted.
        
        location will be updated to point at the end of the snippet.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource5.snippet.Snippet snippet, ref gid.gtk4.text_iter.TextIter location, gid.gtksource5.view.View view)`
  
          `snippet` a #GtkSourceSnippet (optional)
  
          `location` a #GtkTextIter (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPushSnippet(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.snippet.Snippet)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.ref_ && is(Parameters!T[1] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource5.view.View)))
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
      {
        if (auto _p = getVal!(Parameters!T[1]*)(&_paramVals[2]))
          _paramTuple[1] = *_p;
      }

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.pushSnippet");
      }

      static if (Parameters!T.length > 1)
      {
        if (auto _p = getVal!(Parameters!T[1]*)(&_paramVals[2]))
          *_p = _paramTuple[1];
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("push-snippet", closure, after);
  }

  /**
      Connect to `ShowCompletion` signal.
  
      The signal is a key binding signal which gets
        emitted when the user requests a completion, by pressing
        <keycombo><keycap>Control</keycap><keycap>space</keycap></keycombo>.
        
        This will create a [gid.gtksource5.completion_context.CompletionContext] with the activation
        type as [gid.gtksource5.types.CompletionActivation.UserRequested].
        
        Applications should not connect to it, but may emit it with
        `funcGObject.signal_emit_by_name` if they need to activate the completion by
        another means, for example with another key binding or a menu entry.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource5.view.View view)`
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectShowCompletion(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.view.View)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.showCompletion");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-completion", closure, after);
  }

  /**
      Connect to `SmartHomeEnd` signal.
  
      Emitted when a the cursor was moved according to the smart home end setting.
        
        The signal is emitted after the cursor is moved, but
        during the [gid.gtk4.text_view.TextView.moveCursor] action. This can be used to find
        out whether the cursor was moved by a normal home/end or by a smart
        home/end.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_iter.TextIter iter, int count, gid.gtksource5.view.View view)`
  
          `iter` a #GtkTextIter (optional)
  
          `count` the count (optional)
  
          `view` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSmartHomeEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource5.view.View)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.smartHomeEnd");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("smart-home-end", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from View
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtksource5.view.View), T.stringof ~ " is not derived from gid.gtksource5.view.View");

    gid.gtk4.text_view.TextView._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLineMarkActivated", true)[0]) == gid.gtksource5.view.View))
      _installVfunc(klass, "line_mark_activated");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveLines", true)[0]) == gid.gtksource5.view.View))
      _installVfunc(klass, "move_lines");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveWords", true)[0]) == gid.gtksource5.view.View))
      _installVfunc(klass, "move_words");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPushSnippet", true)[0]) == gid.gtksource5.view.View))
      _installVfunc(klass, "push_snippet");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShowCompletion", true)[0]) == gid.gtksource5.view.View))
      _installVfunc(klass, "show_completion");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceViewClass*)klass;

    switch (vfunc)
    {
      case "line_mark_activated":
      {
        static extern(C) void _vfuncLineMarkActivatedTramp(GtkSourceView* view, const(GtkTextIter)* iter, uint button, GdkModifierType state, int nPresses) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.view.View)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)view);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)view);
            if (_klass.lineMarkActivated)
              return (cast(typeof(&_vfuncLineMarkActivatedTramp))_klass.lineMarkActivated)(view, iter, button, state, nPresses);
            return;
          }

          try
          {
            _obj.vfuncLineMarkActivated(iter ? new gid.gtk4.text_iter.TextIter(cast(void*)iter, No.Take) : null, button, state, nPresses);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.vfuncLineMarkActivated");
          }
        }

        _klass.lineMarkActivated = cast(typeof(_klass.lineMarkActivated))&_vfuncLineMarkActivatedTramp;
        break;
      }
      case "move_lines":
      {
        static extern(C) void _vfuncMoveLinesTramp(GtkSourceView* view, gboolean down) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.view.View)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)view);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)view);
            if (_klass.moveLines)
              return (cast(typeof(&_vfuncMoveLinesTramp))_klass.moveLines)(view, down);
            return;
          }

          try
          {
            _obj.vfuncMoveLines(cast(bool)down);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.vfuncMoveLines");
          }
        }

        _klass.moveLines = cast(typeof(_klass.moveLines))&_vfuncMoveLinesTramp;
        break;
      }
      case "move_words":
      {
        static extern(C) void _vfuncMoveWordsTramp(GtkSourceView* view, int step) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.view.View)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)view);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)view);
            if (_klass.moveWords)
              return (cast(typeof(&_vfuncMoveWordsTramp))_klass.moveWords)(view, step);
            return;
          }

          try
          {
            _obj.vfuncMoveWords(step);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.vfuncMoveWords");
          }
        }

        _klass.moveWords = cast(typeof(_klass.moveWords))&_vfuncMoveWordsTramp;
        break;
      }
      case "push_snippet":
      {
        static extern(C) void _vfuncPushSnippetTramp(GtkSourceView* view, GtkSourceSnippet* snippet, GtkTextIter* location) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.view.View)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)view);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)view);
            if (_klass.pushSnippet)
              return (cast(typeof(&_vfuncPushSnippetTramp))_klass.pushSnippet)(view, snippet, location);
            return;
          }

          auto _location = location ? new gid.gtk4.text_iter.TextIter(cast(void*)location, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncPushSnippet(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.snippet.Snippet)(cast(void*)snippet, No.Take), _location);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.vfuncPushSnippet");
          }
          if (_location)
            _location._cUnborrow;

        }

        _klass.pushSnippet = cast(typeof(_klass.pushSnippet))&_vfuncPushSnippetTramp;
        break;
      }
      case "show_completion":
      {
        static extern(C) void _vfuncShowCompletionTramp(GtkSourceView* view) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.view.View)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)view);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)view);
            if (_klass.showCompletion)
              return (cast(typeof(&_vfuncShowCompletionTramp))_klass.showCompletion)(view);
            return;
          }

          try
          {
            _obj.vfuncShowCompletion();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.view.View.vfuncShowCompletion");
          }
        }

        _klass.showCompletion = cast(typeof(_klass.showCompletion))&_vfuncShowCompletionTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource5.view.View]
class ViewGidBuilderImpl(T) : gid.gtk4.text_view.TextViewGidBuilderImpl!T
{


  /** */
  T autoIndent(bool propval) nothrow
  {
    return setProperty("auto-indent", propval);
  }

  /**
      Set `backgroundPattern` property.
      Params:
        propval = Draw a specific background pattern on the view.
      Returns: Builder instance for fluent chaining
  */
  T backgroundPattern(gid.gtksource5.types.BackgroundPatternType propval) nothrow
  {
    return setProperty("background-pattern", propval);
  }

  /**
      Set `enableSnippets` property.
      Params:
        propval = The property denotes if snippets should be
          expanded when the user presses Tab after having typed a word
          matching the snippets found in [gid.gtksource5.snippet_manager.SnippetManager].
          
          The user may tab through focus-positions of the snippet if any
          are available by pressing Tab repeatedly until the desired focus
          position is selected.
      Returns: Builder instance for fluent chaining
  */
  T enableSnippets(bool propval) nothrow
  {
    return setProperty("enable-snippets", propval);
  }

  /** */
  T highlightCurrentLine(bool propval) nothrow
  {
    return setProperty("highlight-current-line", propval);
  }

  /** */
  T indentOnTab(bool propval) nothrow
  {
    return setProperty("indent-on-tab", propval);
  }

  /**
      Set `indentWidth` property.
      Params:
        propval = Width of an indentation step expressed in number of spaces.
      Returns: Builder instance for fluent chaining
  */
  T indentWidth(int propval) nothrow
  {
    return setProperty("indent-width", propval);
  }

  /**
      Set `indenter` property.
      Params:
        propval = The property is a [gid.gtksource5.indenter.Indenter] to use to indent
          as the user types into the [gid.gtksource5.view.View].
      Returns: Builder instance for fluent chaining
  */
  T indenter(gid.gtksource5.indenter.Indenter propval) nothrow
  {
    return setProperty("indenter", propval);
  }

  /** */
  T insertSpacesInsteadOfTabs(bool propval) nothrow
  {
    return setProperty("insert-spaces-instead-of-tabs", propval);
  }

  /**
      Set `rightMarginPosition` property.
      Params:
        propval = Position of the right margin.
      Returns: Builder instance for fluent chaining
  */
  T rightMarginPosition(uint propval) nothrow
  {
    return setProperty("right-margin-position", propval);
  }

  /**
      Set `showLineMarks` property.
      Params:
        propval = Whether to display line mark pixbufs
      Returns: Builder instance for fluent chaining
  */
  T showLineMarks(bool propval) nothrow
  {
    return setProperty("show-line-marks", propval);
  }

  /**
      Set `showLineNumbers` property.
      Params:
        propval = Whether to display line numbers
      Returns: Builder instance for fluent chaining
  */
  T showLineNumbers(bool propval) nothrow
  {
    return setProperty("show-line-numbers", propval);
  }

  /**
      Set `showRightMargin` property.
      Params:
        propval = Whether to display the right margin.
      Returns: Builder instance for fluent chaining
  */
  T showRightMargin(bool propval) nothrow
  {
    return setProperty("show-right-margin", propval);
  }

  /**
      Set `smartBackspace` property.
      Params:
        propval = Whether smart Backspace should be used.
      Returns: Builder instance for fluent chaining
  */
  T smartBackspace(bool propval) nothrow
  {
    return setProperty("smart-backspace", propval);
  }

  /**
      Set `smartHomeEnd` property.
      Params:
        propval = Set the behavior of the HOME and END keys.
      Returns: Builder instance for fluent chaining
  */
  T smartHomeEnd(gid.gtksource5.types.SmartHomeEndType propval) nothrow
  {
    return setProperty("smart-home-end", propval);
  }

  /**
      Set `tabWidth` property.
      Params:
        propval = Width of a tab character expressed in number of spaces.
      Returns: Builder instance for fluent chaining
  */
  T tabWidth(uint propval) nothrow
  {
    return setProperty("tab-width", propval);
  }
}

/// Fluent builder for [gid.gtksource5.view.View]
final class ViewGidBuilder : ViewGidBuilderImpl!ViewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  View build() nothrow
  {
    return new View(cast(void*)createGObject(View._getGType), Yes.Take);
  }
}
