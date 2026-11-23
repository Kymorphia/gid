/// Module for [TextView] class
module gid.gtk4.text_view;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.event;
import gid.gdk4.rectangle;
import gid.gio2.menu_model;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.accessible_text;
import gid.gtk4.accessible_text_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.scrollable;
import gid.gtk4.scrollable_mixin;
import gid.gtk4.snapshot;
import gid.gtk4.text_buffer;
import gid.gtk4.text_child_anchor;
import gid.gtk4.text_iter;
import gid.gtk4.text_mark;
import gid.gtk4.types;
import gid.gtk4.widget;
import gid.pango1.context;
import gid.pango1.tab_array;

/**
    Displays the contents of a [gid.gtk4.text_buffer.TextBuffer].
    
    <picture>
      <source srcset="multiline-text-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkTextView" src="multiline-text.png">
    </picture>
    
    You may wish to begin by reading the [conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types related to the
    text widget and how they work together.
    
    ## Shortcuts and Gestures
    
    [gid.gtk4.text_view.TextView] supports the following keyboard shortcuts:
    
    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.
    - <kbd>Ctrl</kbd>+<kbd>Z</kbd> undoes the last modification.
    - <kbd>Ctrl</kbd>+<kbd>Y</kbd> or <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Z</kbd>
       redoes the last undone modification.
    - <kbd>Clear</kbd> clears the content.
    
    Additionally, the following signals have default keybindings:
    
    - [gid.gtk4.text_view.TextView.backspace]
    - [gid.gtk4.text_view.TextView.copyClipboard]
    - [gid.gtk4.text_view.TextView.cutClipboard]
    - [gid.gtk4.text_view.TextView.deleteFromCursor]
    - [gid.gtk4.text_view.TextView.insertEmoji]
    - [gid.gtk4.text_view.TextView.moveCursor]
    - [gid.gtk4.text_view.TextView.pasteClipboard]
    - [gid.gtk4.text_view.TextView.selectAll]
    - [gid.gtk4.text_view.TextView.toggleCursorVisible]
    - [gid.gtk4.text_view.TextView.toggleOverwrite]
    
    ## Actions
    
    [gid.gtk4.text_view.TextView] defines a set of built-in actions:
    
    - `clipboard.copy` copies the contents to the clipboard.
    - `clipboard.cut` copies the contents to the clipboard and deletes it from
      the widget.
    - `clipboard.paste` inserts the contents of the clipboard into the widget.
    - `menu.popup` opens the context menu.
    - `misc.insert-emoji` opens the Emoji chooser.
    - `selection.delete` deletes the current selection.
    - `selection.select-all` selects all of the widgets content.
    - `text.redo` redoes the last change to the contents.
    - `text.undo` undoes the last change to the contents.
    - `text.clear` clears the content.
    
    ## CSS nodes
    
    ```
    textview.view
    ├── border.top
    ├── border.left
    ├── text
    │   ╰── [selection]
    ├── border.right
    ├── border.bottom
    ╰── [window.popup]
    ```
    
    [gid.gtk4.text_view.TextView] has a main css node with name textview and style class .view,
    and subnodes for each of the border windows, and the main text area,
    with names border and text, respectively. The border nodes each get
    one of the style classes .left, .right, .top or .bottom.
    
    A node representing the selection will appear below the text node.
    
    If a context menu is opened, the window node will appear as a subnode
    of the main node.
    
    ## Accessibility
    
    [gid.gtk4.text_view.TextView] uses the [gid.gtk4.types.AccessibleRole.TextBox] role.
*/
class TextView : gid.gtk4.widget.Widget, gid.gtk4.accessible_text.AccessibleText, gid.gtk4.scrollable.Scrollable
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
    return cast(void function())gtk_text_view_get_type != &gidSymbolNotFound ? gtk_text_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTextView";
  }

  /** Returns `this`, for use in `with` statements. */
  override TextView self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.text_view.TextView]
      Returns: New builder object
  */
  static TextViewGidBuilder builder() nothrow
  {
    return new TextViewGidBuilder;
  }

  /**
      Get `acceptsTab` property.
      Returns: Whether Tab will result in a tab character being entered.
  */
  @property bool acceptsTab() nothrow
  {
    return getAcceptsTab();
  }

  /**
      Set `acceptsTab` property.
      Params:
        propval = Whether Tab will result in a tab character being entered.
  */
  @property void acceptsTab(bool propval) nothrow
  {
    setAcceptsTab(propval);
  }

  /**
      Get `bottomMargin` property.
      Returns: The bottom margin for text in the text view.
        
        Note that this property is confusingly named. In CSS terms,
        the value set here is padding, and it is applied in addition
        to the padding from the theme.
        
        Don't confuse this property with [gid.gtk4.widget.Widget.marginBottom].
  */
  @property int bottomMargin() nothrow
  {
    return getBottomMargin();
  }

  /**
      Set `bottomMargin` property.
      Params:
        propval = The bottom margin for text in the text view.
          
          Note that this property is confusingly named. In CSS terms,
          the value set here is padding, and it is applied in addition
          to the padding from the theme.
          
          Don't confuse this property with [gid.gtk4.widget.Widget.marginBottom].
  */
  @property void bottomMargin(int propval) nothrow
  {
    setBottomMargin(propval);
  }

  /**
      Get `buffer` property.
      Returns: The buffer which is displayed.
  */
  @property gid.gtk4.text_buffer.TextBuffer buffer() nothrow
  {
    return getBuffer();
  }

  /**
      Set `buffer` property.
      Params:
        propval = The buffer which is displayed.
  */
  @property void buffer(gid.gtk4.text_buffer.TextBuffer propval) nothrow
  {
    setBuffer(propval);
  }

  /**
      Get `cursorVisible` property.
      Returns: If the insertion cursor is shown.
  */
  @property bool cursorVisible() nothrow
  {
    return getCursorVisible();
  }

  /**
      Set `cursorVisible` property.
      Params:
        propval = If the insertion cursor is shown.
  */
  @property void cursorVisible(bool propval) nothrow
  {
    setCursorVisible(propval);
  }

  /**
      Get `editable` property.
      Returns: Whether the text can be modified by the user.
  */
  @property bool editable() nothrow
  {
    return getEditable();
  }

  /**
      Set `editable` property.
      Params:
        propval = Whether the text can be modified by the user.
  */
  @property void editable(bool propval) nothrow
  {
    setEditable(propval);
  }

  /**
      Get `extraMenu` property.
      Returns: A menu model whose contents will be appended to the context menu.
  */
  @property gid.gio2.menu_model.MenuModel extraMenu() nothrow
  {
    return getExtraMenu();
  }

  /**
      Set `extraMenu` property.
      Params:
        propval = A menu model whose contents will be appended to the context menu.
  */
  @property void extraMenu(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setExtraMenu(propval);
  }

  /**
      Get `imModule` property.
      Returns: Which IM (input method) module should be used for this text_view.
        
        See [gid.gtk4.immulticontext.IMMulticontext].
        
        Setting this to a non-null value overrides the system-wide IM module
        setting. See the GtkSettings [gid.gtk4.settings.Settings.gtkImModule] property.
  */
  @property string imModule() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("im-module");
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which IM (input method) module should be used for this text_view.
          
          See [gid.gtk4.immulticontext.IMMulticontext].
          
          Setting this to a non-null value overrides the system-wide IM module
          setting. See the GtkSettings [gid.gtk4.settings.Settings.gtkImModule] property.
  */
  @property void imModule(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("im-module", propval);
  }

  /**
      Get `indent` property.
      Returns: Amount to indent the paragraph, in pixels.
        
        A negative value of indent will produce a hanging indentation.
        That is, the first line will have the full width, and subsequent
        lines will be indented by the absolute value of indent.
  */
  @property int indent() nothrow
  {
    return getIndent();
  }

  /**
      Set `indent` property.
      Params:
        propval = Amount to indent the paragraph, in pixels.
          
          A negative value of indent will produce a hanging indentation.
          That is, the first line will have the full width, and subsequent
          lines will be indented by the absolute value of indent.
  */
  @property void indent(int propval) nothrow
  {
    setIndent(propval);
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints (beyond [gid.gtk4.text_view.TextView.inputPurpose])
        that allow input methods to fine-tune their behaviour.
  */
  @property gid.gtk4.types.InputHints inputHints() nothrow
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints (beyond [gid.gtk4.text_view.TextView.inputPurpose])
          that allow input methods to fine-tune their behaviour.
  */
  @property void inputHints(gid.gtk4.types.InputHints propval) nothrow
  {
    setInputHints(propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The purpose of this text field.
        
        This property can be used by on-screen keyboards and other input
        methods to adjust their behaviour.
  */
  @property gid.gtk4.types.InputPurpose inputPurpose() nothrow
  {
    return getInputPurpose();
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose of this text field.
          
          This property can be used by on-screen keyboards and other input
          methods to adjust their behaviour.
  */
  @property void inputPurpose(gid.gtk4.types.InputPurpose propval) nothrow
  {
    setInputPurpose(propval);
  }

  /**
      Get `justification` property.
      Returns: Left, right, or center justification.
  */
  @property gid.gtk4.types.Justification justification() nothrow
  {
    return getJustification();
  }

  /**
      Set `justification` property.
      Params:
        propval = Left, right, or center justification.
  */
  @property void justification(gid.gtk4.types.Justification propval) nothrow
  {
    setJustification(propval);
  }

  /**
      Get `leftMargin` property.
      Returns: The default left margin for text in the text view.
        
        Tags in the buffer may override the default.
        
        Note that this property is confusingly named. In CSS terms,
        the value set here is padding, and it is applied in addition
        to the padding from the theme.
  */
  @property int leftMargin() nothrow
  {
    return getLeftMargin();
  }

  /**
      Set `leftMargin` property.
      Params:
        propval = The default left margin for text in the text view.
          
          Tags in the buffer may override the default.
          
          Note that this property is confusingly named. In CSS terms,
          the value set here is padding, and it is applied in addition
          to the padding from the theme.
  */
  @property void leftMargin(int propval) nothrow
  {
    setLeftMargin(propval);
  }

  /**
      Get `monospace` property.
      Returns: Whether text should be displayed in a monospace font.
        
        If true, set the .monospace style class on the
        text view to indicate that a monospace font is desired.
  */
  @property bool monospace() nothrow
  {
    return getMonospace();
  }

  /**
      Set `monospace` property.
      Params:
        propval = Whether text should be displayed in a monospace font.
          
          If true, set the .monospace style class on the
          text view to indicate that a monospace font is desired.
  */
  @property void monospace(bool propval) nothrow
  {
    setMonospace(propval);
  }

  /**
      Get `overwrite` property.
      Returns: Whether entered text overwrites existing contents.
  */
  @property bool overwrite() nothrow
  {
    return getOverwrite();
  }

  /**
      Set `overwrite` property.
      Params:
        propval = Whether entered text overwrites existing contents.
  */
  @property void overwrite(bool propval) nothrow
  {
    setOverwrite(propval);
  }

  /**
      Get `pixelsAboveLines` property.
      Returns: Pixels of blank space above paragraphs.
  */
  @property int pixelsAboveLines() nothrow
  {
    return getPixelsAboveLines();
  }

  /**
      Set `pixelsAboveLines` property.
      Params:
        propval = Pixels of blank space above paragraphs.
  */
  @property void pixelsAboveLines(int propval) nothrow
  {
    setPixelsAboveLines(propval);
  }

  /**
      Get `pixelsBelowLines` property.
      Returns: Pixels of blank space below paragraphs.
  */
  @property int pixelsBelowLines() nothrow
  {
    return getPixelsBelowLines();
  }

  /**
      Set `pixelsBelowLines` property.
      Params:
        propval = Pixels of blank space below paragraphs.
  */
  @property void pixelsBelowLines(int propval) nothrow
  {
    setPixelsBelowLines(propval);
  }

  /**
      Get `pixelsInsideWrap` property.
      Returns: Pixels of blank space between wrapped lines in a paragraph.
  */
  @property int pixelsInsideWrap() nothrow
  {
    return getPixelsInsideWrap();
  }

  /**
      Set `pixelsInsideWrap` property.
      Params:
        propval = Pixels of blank space between wrapped lines in a paragraph.
  */
  @property void pixelsInsideWrap(int propval) nothrow
  {
    setPixelsInsideWrap(propval);
  }

  /**
      Get `rightMargin` property.
      Returns: The default right margin for text in the text view.
        
        Tags in the buffer may override the default.
        
        Note that this property is confusingly named. In CSS terms,
        the value set here is padding, and it is applied in addition
        to the padding from the theme.
  */
  @property int rightMargin() nothrow
  {
    return getRightMargin();
  }

  /**
      Set `rightMargin` property.
      Params:
        propval = The default right margin for text in the text view.
          
          Tags in the buffer may override the default.
          
          Note that this property is confusingly named. In CSS terms,
          the value set here is padding, and it is applied in addition
          to the padding from the theme.
  */
  @property void rightMargin(int propval) nothrow
  {
    setRightMargin(propval);
  }

  /**
      Get `tabs` property.
      Returns: Custom tabs for this text.
  */
  @property gid.pango1.tab_array.TabArray tabs() nothrow
  {
    return getTabs();
  }

  /**
      Set `tabs` property.
      Params:
        propval = Custom tabs for this text.
  */
  @property void tabs(gid.pango1.tab_array.TabArray propval) nothrow
  {
    setTabs(propval);
  }

  /**
      Get `topMargin` property.
      Returns: The top margin for text in the text view.
        
        Note that this property is confusingly named. In CSS terms,
        the value set here is padding, and it is applied in addition
        to the padding from the theme.
        
        Don't confuse this property with [gid.gtk4.widget.Widget.marginTop].
  */
  @property int topMargin() nothrow
  {
    return getTopMargin();
  }

  /**
      Set `topMargin` property.
      Params:
        propval = The top margin for text in the text view.
          
          Note that this property is confusingly named. In CSS terms,
          the value set here is padding, and it is applied in addition
          to the padding from the theme.
          
          Don't confuse this property with [gid.gtk4.widget.Widget.marginTop].
  */
  @property void topMargin(int propval) nothrow
  {
    setTopMargin(propval);
  }

  /**
      Get `wrapMode` property.
      Returns: Whether to wrap lines never, at word boundaries, or at character boundaries.
  */
  @property gid.gtk4.types.WrapMode wrapMode() nothrow
  {
    return getWrapMode();
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Whether to wrap lines never, at word boundaries, or at character boundaries.
  */
  @property void wrapMode(gid.gtk4.types.WrapMode propval) nothrow
  {
    setWrapMode(propval);
  }

  mixin AccessibleTextT!();
  mixin ScrollableT!();

  /**
      Creates a new [gid.gtk4.text_view.TextView].
      
      If you don’t call [gid.gtk4.text_view.TextView.setBuffer] before using the
      text view, an empty default buffer will be created for you. Get the
      buffer with [gid.gtk4.text_view.TextView.getBuffer]. If you want to specify
      your own buffer, consider [gid.gtk4.text_view.TextView.newWithBuffer].
      Returns: a new [gid.gtk4.text_view.TextView]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_text_view_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new [gid.gtk4.text_view.TextView] widget displaying the buffer buffer.
      
      One buffer can be shared among many widgets. buffer may be null
      to create a default buffer, in which case this function is equivalent
      to [gid.gtk4.text_view.TextView.new_]. The text view adds its own reference count
      to the buffer; it does not take over an existing reference.
  
      Params:
        buffer = a [gid.gtk4.text_buffer.TextBuffer]
      Returns: a new [gid.gtk4.text_view.TextView].
  */
  static gid.gtk4.text_view.TextView newWithBuffer(gid.gtk4.text_buffer.TextBuffer buffer) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_view_new_with_buffer(buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.text_view.TextView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      The class handler for the `GtkTextView::backspace`
        keybinding signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncBackspace` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncBackspace()
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.backspace)
      return;

    _klass.backspace(cast(GtkTextView*)this._cPtr);
  }

  /**
      The class handler for the `GtkTextView::copy-clipboard`
        keybinding signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCopyClipboard` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncCopyClipboard()
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.copyClipboard)
      return;

    _klass.copyClipboard(cast(GtkTextView*)this._cPtr);
  }

  /**
      The class handler for the `GtkTextView::cut-clipboard`
        keybinding signal
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCutClipboard` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncCutClipboard()
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.cutClipboard)
      return;

    _klass.cutClipboard(cast(GtkTextView*)this._cPtr);
  }

  /**
      The class handler for the `GtkTextView::delete-from-cursor`
        keybinding signal.
  
      Params:
        type = 
        count = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDeleteFromCursor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncDeleteFromCursor(gid.gtk4.types.DeleteType type, int count)
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.deleteFromCursor)
      return;

    _klass.deleteFromCursor(cast(GtkTextView*)this._cPtr, type, count);
  }

  /**
      The class handler for the `GtkTextView::extend-selection` signal.
  
      Params:
        granularity = 
        location = 
        start =  (modified in place, changes are seen by the caller)
        end =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncExtendSelection` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncExtendSelection(gid.gtk4.types.TextExtendSelection granularity, gid.gtk4.text_iter.TextIter location, gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end)
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.extendSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.extendSelection(cast(GtkTextView*)this._cPtr, granularity, location ? cast(const(GtkTextIter)*)location._cPtr(No.Dup) : null, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      The class handler for the `GtkTextView::insert-at-cursor`
        keybinding signal.
  
      Params:
        str = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInsertAtCursor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncInsertAtCursor(string str)
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.insertAtCursor)
      return;

    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _klass.insertAtCursor(cast(GtkTextView*)this._cPtr, _str);
  }

  /**
      The class handler for the `GtkTextView::insert-emoji` signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInsertEmoji` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncInsertEmoji()
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.insertEmoji)
      return;

    _klass.insertEmoji(cast(GtkTextView*)this._cPtr);
  }

  /**
      The class handler for the `GtkTextView::move-cursor`
        keybinding signal.
  
      Params:
        step = 
        count = 
        extendSelection = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMoveCursor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncMoveCursor(gid.gtk4.types.MovementStep step, int count, bool extendSelection)
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.moveCursor)
      return;

    _klass.moveCursor(cast(GtkTextView*)this._cPtr, step, count, extendSelection);
  }

  /**
      The class handler for the `GtkTextView::paste-clipboard`
        keybinding signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPasteClipboard` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncPasteClipboard()
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.pasteClipboard)
      return;

    _klass.pasteClipboard(cast(GtkTextView*)this._cPtr);
  }

  /**
      The class handler for the `GtkTextView::set-anchor`
        keybinding signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetAnchor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncSetAnchor()
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.setAnchor)
      return;

    _klass.setAnchor(cast(GtkTextView*)this._cPtr);
  }

  /**
      The snapshot_layer vfunc is called before and after the text
        view is drawing its own text. Applications can override this vfunc
        in a subclass to draw customized content underneath or above the
        text. In the [gid.gtk4.types.TextViewLayer.BelowText] and [gid.gtk4.types.TextViewLayer.AboveText]
        layers the drawing is done in the buffer coordinate space.
  
      Params:
        layer = 
        snapshot = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSnapshotLayer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncSnapshotLayer(gid.gtk4.types.TextViewLayer layer, gid.gtk4.snapshot.Snapshot snapshot)
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.snapshotLayer)
      return;

    _klass.snapshotLayer(cast(GtkTextView*)this._cPtr, layer, snapshot ? cast(GtkSnapshot*)snapshot._cPtr(No.Dup) : null);
  }

  /**
      The class handler for the `GtkTextView::toggle-overwrite`
        keybinding signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncToggleOverwrite` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncToggleOverwrite()
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.toggleOverwrite)
      return;

    _klass.toggleOverwrite(cast(GtkTextView*)this._cPtr);
  }

  /**
      Adds a child widget in the text buffer, at the given anchor.
  
      Params:
        child = a [gid.gtk4.widget.Widget]
        anchor = a [gid.gtk4.text_child_anchor.TextChildAnchor] in the [gid.gtk4.text_buffer.TextBuffer] for text_view
  */
  void addChildAtAnchor(gid.gtk4.widget.Widget child, gid.gtk4.text_child_anchor.TextChildAnchor anchor) nothrow
  {
    gtk_text_view_add_child_at_anchor(cast(GtkTextView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
  }

  /**
      Adds child at a fixed coordinate in the [gid.gtk4.text_view.TextView]'s text window.
      
      The xpos and ypos must be in buffer coordinates (see
      [gid.gtk4.text_view.TextView.getIterLocation] to convert to
      buffer coordinates).
      
      child will scroll with the text view.
      
      If instead you want a widget that will not move with the
      [gid.gtk4.text_view.TextView] contents see [gid.gtk4.overlay.Overlay].
  
      Params:
        child = a [gid.gtk4.widget.Widget]
        xpos = X position of child in window coordinates
        ypos = Y position of child in window coordinates
  */
  void addOverlay(gid.gtk4.widget.Widget child, int xpos, int ypos) nothrow
  {
    gtk_text_view_add_overlay(cast(GtkTextView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, xpos, ypos);
  }

  /**
      Moves the given iter backward by one display (wrapped) line.
      
      A display line is different from a paragraph. Paragraphs are
      separated by newlines or other paragraph separator characters.
      Display lines are created by line-wrapping a paragraph. If
      wrapping is turned off, display lines and paragraphs will be the
      same. Display lines are divided differently for each view, since
      they depend on the view’s width; paragraphs are the same in all
      views, since they depend on the contents of the [gid.gtk4.text_buffer.TextBuffer].
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
      Returns: true if iter was moved and is not on the end iterator
  */
  bool backwardDisplayLine(gid.gtk4.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_backward_display_line(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves the given iter backward to the next display line start.
      
      A display line is different from a paragraph. Paragraphs are
      separated by newlines or other paragraph separator characters.
      Display lines are created by line-wrapping a paragraph. If
      wrapping is turned off, display lines and paragraphs will be the
      same. Display lines are divided differently for each view, since
      they depend on the view’s width; paragraphs are the same in all
      views, since they depend on the contents of the [gid.gtk4.text_buffer.TextBuffer].
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
      Returns: true if iter was moved and is not on the end iterator
  */
  bool backwardDisplayLineStart(gid.gtk4.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_backward_display_line_start(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts buffer coordinates to window coordinates.
  
      Params:
        win = a [gid.gtk4.types.TextWindowType]
        bufferX = buffer x coordinate
        bufferY = buffer y coordinate
        windowX = window x coordinate return location
        windowY = window y coordinate return location
  */
  void bufferToWindowCoords(gid.gtk4.types.TextWindowType win, int bufferX, int bufferY, out int windowX, out int windowY) nothrow
  {
    gtk_text_view_buffer_to_window_coords(cast(GtkTextView*)this._cPtr, win, bufferX, bufferY, cast(int*)&windowX, cast(int*)&windowY);
  }

  /**
      Moves the given iter forward by one display (wrapped) line.
      
      A display line is different from a paragraph. Paragraphs are
      separated by newlines or other paragraph separator characters.
      Display lines are created by line-wrapping a paragraph. If
      wrapping is turned off, display lines and paragraphs will be the
      same. Display lines are divided differently for each view, since
      they depend on the view’s width; paragraphs are the same in all
      views, since they depend on the contents of the [gid.gtk4.text_buffer.TextBuffer].
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
      Returns: true if iter was moved and is not on the end iterator
  */
  bool forwardDisplayLine(gid.gtk4.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_forward_display_line(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves the given iter forward to the next display line end.
      
      A display line is different from a paragraph. Paragraphs are
      separated by newlines or other paragraph separator characters.
      Display lines are created by line-wrapping a paragraph. If
      wrapping is turned off, display lines and paragraphs will be the
      same. Display lines are divided differently for each view, since
      they depend on the view’s width; paragraphs are the same in all
      views, since they depend on the contents of the [gid.gtk4.text_buffer.TextBuffer].
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
      Returns: true if iter was moved and is not on the end iterator
  */
  bool forwardDisplayLineEnd(gid.gtk4.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_forward_display_line_end(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns whether pressing the <kbd>Tab</kbd> key inserts a tab characters.
      
      See [gid.gtk4.text_view.TextView.setAcceptsTab].
      Returns: true if pressing the Tab key inserts a tab character,
          false if pressing the Tab key moves the keyboard focus.
  */
  bool getAcceptsTab() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_accepts_tab(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the bottom margin for text in the text_view.
      Returns: bottom margin in pixels
  */
  int getBottomMargin() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_bottom_margin(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the [gid.gtk4.text_buffer.TextBuffer] being displayed by this text view.
      
      The reference count on the buffer is not incremented; the caller
      of this function won’t own a new reference.
      Returns: a [gid.gtk4.text_buffer.TextBuffer]
  */
  gid.gtk4.text_buffer.TextBuffer getBuffer() nothrow
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_text_view_get_buffer(cast(GtkTextView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.text_buffer.TextBuffer)(cast(GtkTextBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determine the positions of the strong and weak cursors if the
      insertion point is at iter.
      
      The position of each cursor is stored as a zero-width rectangle.
      The strong cursor location is the location where characters of
      the directionality equal to the base direction of the paragraph
      are inserted. The weak cursor location is the location where
      characters of the directionality opposite to the base direction
      of the paragraph are inserted.
      
      If iter is null, the actual cursor position is used.
      
      Note that if iter happens to be the actual cursor position, and
      there is currently an IM preedit sequence being entered, the
      returned locations will be adjusted to account for the preedit
      cursor’s offset within the preedit sequence.
      
      The rectangle position is in buffer coordinates; use
      [gid.gtk4.text_view.TextView.bufferToWindowCoords] to convert these
      coordinates to coordinates for one of the windows in the text view.
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
        strong = location to store the strong cursor position
        weak = location to store the weak cursor position
  */
  void getCursorLocations(gid.gtk4.text_iter.TextIter iter, out gid.gdk4.rectangle.Rectangle strong, out gid.gdk4.rectangle.Rectangle weak) nothrow
  {
    gtk_text_view_get_cursor_locations(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&strong, cast(GdkRectangle*)&weak);
  }

  /**
      Find out whether the cursor should be displayed.
      Returns: whether the insertion mark is visible
  */
  bool getCursorVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_cursor_visible(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the default editability of the [gid.gtk4.text_view.TextView].
      
      Tags in the buffer may override this setting for some ranges of text.
      Returns: whether text is editable by default
  */
  bool getEditable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_editable(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the menu model that gets added to the context menu
      or null if none has been set.
      Returns: the menu model
  */
  gid.gio2.menu_model.MenuModel getExtraMenu() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_text_view_get_extra_menu(cast(GtkTextView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a [gid.gtk4.widget.Widget] that has previously been set as gutter.
      
      See [gid.gtk4.text_view.TextView.setGutter].
      
      win must be one of [gid.gtk4.types.TextWindowType.Left], [gid.gtk4.types.TextWindowType.Right],
      [gid.gtk4.types.TextWindowType.Top], or [gid.gtk4.types.TextWindowType.Bottom].
  
      Params:
        win = a [gid.gtk4.types.TextWindowType]
      Returns: a [gid.gtk4.widget.Widget]
  */
  gid.gtk4.widget.Widget getGutter(gid.gtk4.types.TextWindowType win) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_view_get_gutter(cast(GtkTextView*)this._cPtr, win);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the default indentation of paragraphs in text_view.
      
      Tags in the view’s buffer may override the default.
      The indentation may be negative.
      Returns: number of pixels of indentation
  */
  int getIndent() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_indent(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `input-hints` of the [gid.gtk4.text_view.TextView].
      Returns: the input hints
  */
  gid.gtk4.types.InputHints getInputHints() nothrow
  {
    GtkInputHints _cretval;
    _cretval = gtk_text_view_get_input_hints(cast(GtkTextView*)this._cPtr);
    gid.gtk4.types.InputHints _retval = cast(gid.gtk4.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the `input-purpose` of the [gid.gtk4.text_view.TextView].
      Returns: the input purpose
  */
  gid.gtk4.types.InputPurpose getInputPurpose() nothrow
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_text_view_get_input_purpose(cast(GtkTextView*)this._cPtr);
    gid.gtk4.types.InputPurpose _retval = cast(gid.gtk4.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Retrieves the iterator at buffer coordinates `x` and `y`.
      
      Buffer coordinates are coordinates for the entire buffer, not just
      the currently-displayed portion. If you have coordinates from an
      event, you have to convert those to buffer coordinates with
      [gid.gtk4.text_view.TextView.windowToBufferCoords].
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
        x = x position, in buffer coordinates
        y = y position, in buffer coordinates
      Returns: true if the position is over text
  */
  bool getIterAtLocation(out gid.gtk4.text_iter.TextIter iter, int x, int y) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_text_view_get_iter_at_location(cast(GtkTextView*)this._cPtr, _iter, x, y);
    iter = new gid.gtk4.text_iter.TextIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the iterator pointing to the character at buffer
      coordinates `x` and `y`.
      
      Buffer coordinates are coordinates for the entire buffer, not just
      the currently-displayed portion. If you have coordinates from an event,
      you have to convert those to buffer coordinates with
      [gid.gtk4.text_view.TextView.windowToBufferCoords].
      
      Note that this is different from [gid.gtk4.text_view.TextView.getIterAtLocation],
      which returns cursor locations, i.e. positions between characters.
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
        trailing = if non-null, location to store
             an integer indicating where in the grapheme the user clicked.
             It will either be zero, or the number of characters in the grapheme.
             0 represents the trailing edge of the grapheme.
        x = x position, in buffer coordinates
        y = y position, in buffer coordinates
      Returns: true if the position is over text
  */
  bool getIterAtPosition(out gid.gtk4.text_iter.TextIter iter, out int trailing, int x, int y) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_text_view_get_iter_at_position(cast(GtkTextView*)this._cPtr, _iter, cast(int*)&trailing, x, y);
    iter = new gid.gtk4.text_iter.TextIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Gets a rectangle which roughly contains the character at iter.
      
      The rectangle position is in buffer coordinates; use
      [gid.gtk4.text_view.TextView.bufferToWindowCoords] to convert these
      coordinates to coordinates for one of the windows in the text view.
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
        location = bounds of the character at iter
  */
  void getIterLocation(gid.gtk4.text_iter.TextIter iter, out gid.gdk4.rectangle.Rectangle location) nothrow
  {
    gtk_text_view_get_iter_location(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&location);
  }

  /**
      Gets the default justification of paragraphs in text_view.
      
      Tags in the buffer may override the default.
      Returns: default justification
  */
  gid.gtk4.types.Justification getJustification() nothrow
  {
    GtkJustification _cretval;
    _cretval = gtk_text_view_get_justification(cast(GtkTextView*)this._cPtr);
    gid.gtk4.types.Justification _retval = cast(gid.gtk4.types.Justification)_cretval;
    return _retval;
  }

  /**
      Gets the default left margin size of paragraphs in the text_view.
      
      Tags in the buffer may override the default.
      Returns: left margin in pixels
  */
  int getLeftMargin() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_left_margin(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.gtk4.text_iter.TextIter] at the start of the line containing
      the coordinate `y`.
      
      `y` is in buffer coordinates, convert from window coordinates with
      [gid.gtk4.text_view.TextView.windowToBufferCoords]. If non-null,
      line_top will be filled with the coordinate of the top edge
      of the line.
  
      Params:
        targetIter = a [gid.gtk4.text_iter.TextIter]
        y = a y coordinate
        lineTop = return location for top coordinate of the line
  */
  void getLineAtY(out gid.gtk4.text_iter.TextIter targetIter, int y, out int lineTop) nothrow
  {
    auto _targetIter = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    gtk_text_view_get_line_at_y(cast(GtkTextView*)this._cPtr, _targetIter, y, cast(int*)&lineTop);
    targetIter = new gid.gtk4.text_iter.TextIter(cast(void*)_targetIter, Yes.Take);
  }

  /**
      Gets the y coordinate of the top of the line containing iter,
      and the height of the line.
      
      The coordinate is a buffer coordinate; convert to window
      coordinates with [gid.gtk4.text_view.TextView.bufferToWindowCoords].
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
        y = return location for a y coordinate
        height = return location for a height
  */
  void getLineYrange(gid.gtk4.text_iter.TextIter iter, out int y, out int height) nothrow
  {
    gtk_text_view_get_line_yrange(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(int*)&y, cast(int*)&height);
  }

  /**
      Gets the [gid.pango1.context.Context] that is used for rendering LTR directed
      text layouts.
      
      The context may be replaced when CSS changes occur.
      Returns: a [gid.pango1.context.Context]
  */
  gid.pango1.context.Context getLtrContext() nothrow
  {
    PangoContext* _cretval;
    _cretval = gtk_text_view_get_ltr_context(cast(GtkTextView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.context.Context)(cast(PangoContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the [gid.gtk4.text_view.TextView] uses monospace styling.
      Returns: true if monospace fonts are desired
  */
  bool getMonospace() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_monospace(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the [gid.gtk4.text_view.TextView] is in overwrite mode or not.
      Returns: whether text_view is in overwrite mode or not.
  */
  bool getOverwrite() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_overwrite(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default number of pixels to put above paragraphs.
      
      Adding this function with [gid.gtk4.text_view.TextView.getPixelsBelowLines]
      is equal to the line space between each paragraph.
      Returns: default number of pixels above paragraphs
  */
  int getPixelsAboveLines() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_pixels_above_lines(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default number of pixels to put below paragraphs.
      
      The line space is the sum of the value returned by this function and
      the value returned by [gid.gtk4.text_view.TextView.getPixelsAboveLines].
      Returns: default number of blank pixels below paragraphs
  */
  int getPixelsBelowLines() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_pixels_below_lines(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default number of pixels to put between wrapped lines
      inside a paragraph.
      Returns: default number of pixels of blank space between wrapped lines
  */
  int getPixelsInsideWrap() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_pixels_inside_wrap(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default right margin for text in text_view.
      
      Tags in the buffer may override the default.
      Returns: right margin in pixels
  */
  int getRightMargin() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_right_margin(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.pango1.context.Context] that is used for rendering RTL directed
      text layouts.
      
      The context may be replaced when CSS changes occur.
      Returns: a [gid.pango1.context.Context]
  */
  gid.pango1.context.Context getRtlContext() nothrow
  {
    PangoContext* _cretval;
    _cretval = gtk_text_view_get_rtl_context(cast(GtkTextView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.context.Context)(cast(PangoContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the default tabs for text_view.
      
      Tags in the buffer may override the defaults. The returned array
      will be null if “standard” (8-space) tabs are used. Free the
      return value with [gid.pango1.tab_array.TabArray.free].
      Returns: copy of default tab array,
          or null if standard tabs are used; must be freed with
          [gid.pango1.tab_array.TabArray.free].
  */
  gid.pango1.tab_array.TabArray getTabs() nothrow
  {
    PangoTabArray* _cretval;
    _cretval = gtk_text_view_get_tabs(cast(GtkTextView*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.tab_array.TabArray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the top margin for text in the text_view.
      Returns: top margin in pixels
  */
  int getTopMargin() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_top_margin(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the X,Y offset in buffer coordinates of the top-left corner of
      the textview's text contents.
      
      This allows for more-precise positioning than what is provided by
      [gid.gtk4.text_view.TextView.getVisibleRect] as you can discover what
      device pixel is being quantized for text positioning.
      
      You might want this when making ulterior widgets align with quantized
      device pixels of the textview contents such as line numbers.
  
      Params:
        xOffset = a location for the X offset
        yOffset = a location for the Y offset
  */
  void getVisibleOffset(out double xOffset, out double yOffset) nothrow
  {
    gtk_text_view_get_visible_offset(cast(GtkTextView*)this._cPtr, cast(double*)&xOffset, cast(double*)&yOffset);
  }

  /**
      Fills visible_rect with the currently-visible
      region of the buffer, in buffer coordinates.
      
      Convert to window coordinates with
      [gid.gtk4.text_view.TextView.bufferToWindowCoords].
  
      Params:
        visibleRect = rectangle to fill
  */
  void getVisibleRect(out gid.gdk4.rectangle.Rectangle visibleRect) nothrow
  {
    gtk_text_view_get_visible_rect(cast(GtkTextView*)this._cPtr, cast(GdkRectangle*)&visibleRect);
  }

  /**
      Gets the line wrapping for the view.
      Returns: the line wrap setting
  */
  gid.gtk4.types.WrapMode getWrapMode() nothrow
  {
    GtkWrapMode _cretval;
    _cretval = gtk_text_view_get_wrap_mode(cast(GtkTextView*)this._cPtr);
    gid.gtk4.types.WrapMode _retval = cast(gid.gtk4.types.WrapMode)_cretval;
    return _retval;
  }

  /**
      Allow the [gid.gtk4.text_view.TextView] input method to internally handle key press
      and release events.
      
      If this function returns true, then no further processing should be
      done for this key event. See [gid.gtk4.imcontext.IMContext.filterKeypress].
      
      Note that you are expected to call this function from your handler
      when overriding key event handling. This is needed in the case when
      you need to insert your own key handling between the input method
      and the default key event handling of the [gid.gtk4.text_view.TextView].
      
      ```c
      static gboolean
      gtk_foo_bar_key_press_event (GtkWidget *widget,
                                   GdkEvent  *event)
      {
        guint keyval;
      
        gdk_event_get_keyval ((GdkEvent*)event, &keyval);
      
        if (keyval == GDK_KEY_Return || keyval == GDK_KEY_KP_Enter)
          {
            if (gtk_text_view_im_context_filter_keypress (GTK_TEXT_VIEW (widget), event))
              return TRUE;
          }
      
        // Do some stuff
      
        return GTK_WIDGET_CLASS (gtk_foo_bar_parent_class)->key_press_event (widget, event);
      }
      ```
  
      Params:
        event = the key event
      Returns: true if the input method handled the key event.
  */
  bool imContextFilterKeypress(gid.gdk4.event.Event event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_im_context_filter_keypress(cast(GtkTextView*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves a mark within the buffer so that it's
      located within the currently-visible text area.
  
      Params:
        mark = a [gid.gtk4.text_mark.TextMark]
      Returns: true if the mark moved (wasn’t already onscreen)
  */
  bool moveMarkOnscreen(gid.gtk4.text_mark.TextMark mark) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_move_mark_onscreen(cast(GtkTextView*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Updates the position of a child.
      
      See [gid.gtk4.text_view.TextView.addOverlay].
  
      Params:
        child = a widget already added with [gid.gtk4.text_view.TextView.addOverlay]
        xpos = new X position in buffer coordinates
        ypos = new Y position in buffer coordinates
  */
  void moveOverlay(gid.gtk4.widget.Widget child, int xpos, int ypos) nothrow
  {
    gtk_text_view_move_overlay(cast(GtkTextView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, xpos, ypos);
  }

  /**
      Move the iterator a given number of characters visually, treating
      it as the strong cursor position.
      
      If count is positive, then the new strong cursor position will
      be count positions to the right of the old cursor position.
      If count is negative then the new strong cursor position will
      be count positions to the left of the old cursor position.
      
      In the presence of bi-directional text, the correspondence
      between logical and visual order will depend on the direction
      of the current run, and there may be jumps when the cursor
      is moved off of the end of a run.
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
        count = number of characters to move (negative moves left,
             positive moves right)
      Returns: true if iter moved and is not on the end iterator
  */
  bool moveVisually(gid.gtk4.text_iter.TextIter iter, int count) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_move_visually(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, count);
    return _retval;
  }

  /**
      Moves the cursor to the currently visible region of the
      buffer.
      Returns: true if the cursor had to be moved.
  */
  bool placeCursorOnscreen() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_place_cursor_onscreen(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Removes a child widget from text_view.
  
      Params:
        child = the child to remove
  */
  void remove(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_text_view_remove(cast(GtkTextView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Ensures that the cursor is shown.
      
      This also resets the time that it will stay blinking (or
      visible, in case blinking is disabled).
      
      This function should be called in response to user input
      (e.g. from derived classes that override the textview's
      event handlers).
  */
  void resetCursorBlink() nothrow
  {
    gtk_text_view_reset_cursor_blink(cast(GtkTextView*)this._cPtr);
  }

  /**
      Reset the input method context of the text view if needed.
      
      This can be necessary in the case where modifying the buffer
      would confuse on-going input method behavior.
  */
  void resetImContext() nothrow
  {
    gtk_text_view_reset_im_context(cast(GtkTextView*)this._cPtr);
  }

  /**
      Scrolls text_view the minimum distance such that mark is contained
      within the visible area of the widget.
  
      Params:
        mark = a mark in the buffer for text_view
  */
  void scrollMarkOnscreen(gid.gtk4.text_mark.TextMark mark) nothrow
  {
    gtk_text_view_scroll_mark_onscreen(cast(GtkTextView*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
  }

  /**
      Scrolls text_view so that iter is on the screen in the position
      indicated by xalign and yalign.
      
      An alignment of 0.0 indicates left or top, 1.0 indicates right or
      bottom, 0.5 means center. If use_align is false, the text scrolls
      the minimal distance to get the mark onscreen, possibly not scrolling
      at all. The effective screen for purposes of this function is reduced
      by a margin of size within_margin.
      
      Note that this function uses the currently-computed height of the
      lines in the text buffer. Line heights are computed in an idle
      handler; so this function may not have the desired effect if it’s
      called before the height computations. To avoid oddness, consider
      using [gid.gtk4.text_view.TextView.scrollToMark] which saves a point to be
      scrolled to after line validation.
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
        withinMargin = margin as a [0.0,0.5) fraction of screen size
        useAlign = whether to use alignment arguments (if false,
             just get the mark onscreen)
        xalign = horizontal alignment of mark within visible area
        yalign = vertical alignment of mark within visible area
      Returns: true if scrolling occurred
  */
  bool scrollToIter(gid.gtk4.text_iter.TextIter iter, double withinMargin, bool useAlign, double xalign, double yalign) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_scroll_to_iter(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, withinMargin, useAlign, xalign, yalign);
    return _retval;
  }

  /**
      Scrolls text_view so that mark is on the screen in the position
      indicated by xalign and yalign.
      
      An alignment of 0.0 indicates left or top, 1.0 indicates right or
      bottom, 0.5 means center. If use_align is false, the text scrolls
      the minimal distance to get the mark onscreen, possibly not scrolling
      at all. The effective screen for purposes of this function is reduced
      by a margin of size within_margin.
  
      Params:
        mark = a [gid.gtk4.text_mark.TextMark]
        withinMargin = margin as a [0.0,0.5) fraction of screen size
        useAlign = whether to use alignment arguments (if false, just
             get the mark onscreen)
        xalign = horizontal alignment of mark within visible area
        yalign = vertical alignment of mark within visible area
  */
  void scrollToMark(gid.gtk4.text_mark.TextMark mark, double withinMargin, bool useAlign, double xalign, double yalign) nothrow
  {
    gtk_text_view_scroll_to_mark(cast(GtkTextView*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null, withinMargin, useAlign, xalign, yalign);
  }

  /**
      Sets the behavior of the text widget when the <kbd>Tab</kbd> key is pressed.
      
      If accepts_tab is true, a tab character is inserted. If accepts_tab
      is false the keyboard focus is moved to the next widget in the focus
      chain.
      
      Focus can always be moved using <kbd>Ctrl</kbd>+<kbd>Tab</kbd>.
  
      Params:
        acceptsTab = true if pressing the Tab key should insert a tab
             character, false, if pressing the Tab key should move the
             keyboard focus.
  */
  void setAcceptsTab(bool acceptsTab) nothrow
  {
    gtk_text_view_set_accepts_tab(cast(GtkTextView*)this._cPtr, acceptsTab);
  }

  /**
      Sets the bottom margin for text in text_view.
      
      Note that this function is confusingly named.
      In CSS terms, the value set here is padding.
  
      Params:
        bottomMargin = bottom margin in pixels
  */
  void setBottomMargin(int bottomMargin) nothrow
  {
    gtk_text_view_set_bottom_margin(cast(GtkTextView*)this._cPtr, bottomMargin);
  }

  /**
      Sets buffer as the buffer being displayed by text_view.
      
      The previous buffer displayed by the text view is unreferenced, and
      a reference is added to buffer. If you owned a reference to buffer
      before passing it to this function, you must remove that reference
      yourself; [gid.gtk4.text_view.TextView] will not “adopt” it.
  
      Params:
        buffer = a [gid.gtk4.text_buffer.TextBuffer]
  */
  void setBuffer(gid.gtk4.text_buffer.TextBuffer buffer = null) nothrow
  {
    gtk_text_view_set_buffer(cast(GtkTextView*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Toggles whether the insertion point should be displayed.
      
      A buffer with no editable text probably shouldn’t have a visible
      cursor, so you may want to turn the cursor off.
      
      Note that this property may be overridden by the
      [gid.gtk4.settings.Settings.gtkKeynavUseCaret] setting.
  
      Params:
        setting = whether to show the insertion cursor
  */
  void setCursorVisible(bool setting) nothrow
  {
    gtk_text_view_set_cursor_visible(cast(GtkTextView*)this._cPtr, setting);
  }

  /**
      Sets the default editability of the [gid.gtk4.text_view.TextView].
      
      You can override this default setting with tags in the buffer,
      using the “editable” attribute of tags.
  
      Params:
        setting = whether it’s editable
  */
  void setEditable(bool setting) nothrow
  {
    gtk_text_view_set_editable(cast(GtkTextView*)this._cPtr, setting);
  }

  /**
      Sets a menu model to add when constructing the context
      menu for text_view.
      
      You can pass null to remove a previously set extra menu.
  
      Params:
        model = a [gid.gio2.menu_model.MenuModel]
  */
  void setExtraMenu(gid.gio2.menu_model.MenuModel model = null) nothrow
  {
    gtk_text_view_set_extra_menu(cast(GtkTextView*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }

  /**
      Places widget into the gutter specified by win.
      
      win must be one of [gid.gtk4.types.TextWindowType.Left], [gid.gtk4.types.TextWindowType.Right],
      [gid.gtk4.types.TextWindowType.Top], or [gid.gtk4.types.TextWindowType.Bottom].
  
      Params:
        win = a [gid.gtk4.types.TextWindowType]
        widget = a [gid.gtk4.widget.Widget]
  */
  void setGutter(gid.gtk4.types.TextWindowType win, gid.gtk4.widget.Widget widget = null) nothrow
  {
    gtk_text_view_set_gutter(cast(GtkTextView*)this._cPtr, win, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the default indentation for paragraphs in text_view.
      
      Tags in the buffer may override the default.
  
      Params:
        indent = indentation in pixels
  */
  void setIndent(int indent) nothrow
  {
    gtk_text_view_set_indent(cast(GtkTextView*)this._cPtr, indent);
  }

  /**
      Sets the `input-hints` of the [gid.gtk4.text_view.TextView].
      
      The `input-hints` allow input methods to fine-tune
      their behaviour.
  
      Params:
        hints = the hints
  */
  void setInputHints(gid.gtk4.types.InputHints hints) nothrow
  {
    gtk_text_view_set_input_hints(cast(GtkTextView*)this._cPtr, hints);
  }

  /**
      Sets the `input-purpose` of the [gid.gtk4.text_view.TextView].
      
      The `input-purpose` can be used by on-screen keyboards
      and other input methods to adjust their behaviour.
  
      Params:
        purpose = the purpose
  */
  void setInputPurpose(gid.gtk4.types.InputPurpose purpose) nothrow
  {
    gtk_text_view_set_input_purpose(cast(GtkTextView*)this._cPtr, purpose);
  }

  /**
      Sets the default justification of text in text_view.
      
      Tags in the view’s buffer may override the default.
  
      Params:
        justification = justification
  */
  void setJustification(gid.gtk4.types.Justification justification) nothrow
  {
    gtk_text_view_set_justification(cast(GtkTextView*)this._cPtr, justification);
  }

  /**
      Sets the default left margin for text in text_view.
      
      Tags in the buffer may override the default.
      
      Note that this function is confusingly named.
      In CSS terms, the value set here is padding.
  
      Params:
        leftMargin = left margin in pixels
  */
  void setLeftMargin(int leftMargin) nothrow
  {
    gtk_text_view_set_left_margin(cast(GtkTextView*)this._cPtr, leftMargin);
  }

  /**
      Sets whether the [gid.gtk4.text_view.TextView] should display text in
      monospace styling.
  
      Params:
        monospace = true to request monospace styling
  */
  void setMonospace(bool monospace) nothrow
  {
    gtk_text_view_set_monospace(cast(GtkTextView*)this._cPtr, monospace);
  }

  /**
      Changes the [gid.gtk4.text_view.TextView] overwrite mode.
  
      Params:
        overwrite = true to turn on overwrite mode, false to turn it off
  */
  void setOverwrite(bool overwrite) nothrow
  {
    gtk_text_view_set_overwrite(cast(GtkTextView*)this._cPtr, overwrite);
  }

  /**
      Sets the default number of blank pixels above paragraphs in text_view.
      
      Tags in the buffer for text_view may override the defaults.
  
      Params:
        pixelsAboveLines = pixels above paragraphs
  */
  void setPixelsAboveLines(int pixelsAboveLines) nothrow
  {
    gtk_text_view_set_pixels_above_lines(cast(GtkTextView*)this._cPtr, pixelsAboveLines);
  }

  /**
      Sets the default number of pixels of blank space
      to put below paragraphs in text_view.
      
      May be overridden by tags applied to text_view’s buffer.
  
      Params:
        pixelsBelowLines = pixels below paragraphs
  */
  void setPixelsBelowLines(int pixelsBelowLines) nothrow
  {
    gtk_text_view_set_pixels_below_lines(cast(GtkTextView*)this._cPtr, pixelsBelowLines);
  }

  /**
      Sets the default number of pixels of blank space to leave between
      display/wrapped lines within a paragraph.
      
      May be overridden by tags in text_view’s buffer.
  
      Params:
        pixelsInsideWrap = default number of pixels between wrapped lines
  */
  void setPixelsInsideWrap(int pixelsInsideWrap) nothrow
  {
    gtk_text_view_set_pixels_inside_wrap(cast(GtkTextView*)this._cPtr, pixelsInsideWrap);
  }

  /**
      Sets the default right margin for text in the text view.
      
      Tags in the buffer may override the default.
      
      Note that this function is confusingly named.
      In CSS terms, the value set here is padding.
  
      Params:
        rightMargin = right margin in pixels
  */
  void setRightMargin(int rightMargin) nothrow
  {
    gtk_text_view_set_right_margin(cast(GtkTextView*)this._cPtr, rightMargin);
  }

  /**
      Sets the default tab stops for paragraphs in text_view.
      
      Tags in the buffer may override the default.
  
      Params:
        tabs = tabs as a [gid.pango1.tab_array.TabArray]
  */
  void setTabs(gid.pango1.tab_array.TabArray tabs) nothrow
  {
    gtk_text_view_set_tabs(cast(GtkTextView*)this._cPtr, tabs ? cast(PangoTabArray*)tabs._cPtr(No.Dup) : null);
  }

  /**
      Sets the top margin for text in text_view.
      
      Note that this function is confusingly named.
      In CSS terms, the value set here is padding.
  
      Params:
        topMargin = top margin in pixels
  */
  void setTopMargin(int topMargin) nothrow
  {
    gtk_text_view_set_top_margin(cast(GtkTextView*)this._cPtr, topMargin);
  }

  /**
      Sets the line wrapping for the view.
  
      Params:
        wrapMode = a [gid.gtk4.types.WrapMode]
  */
  void setWrapMode(gid.gtk4.types.WrapMode wrapMode) nothrow
  {
    gtk_text_view_set_wrap_mode(cast(GtkTextView*)this._cPtr, wrapMode);
  }

  /**
      Determines whether iter is at the start of a display line.
      
      See [gid.gtk4.text_view.TextView.forwardDisplayLine] for an
      explanation of display lines vs. paragraphs.
  
      Params:
        iter = a [gid.gtk4.text_iter.TextIter]
      Returns: true if iter begins a wrapped line
  */
  bool startsDisplayLine(gid.gtk4.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_starts_display_line(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts coordinates on the window identified by win to buffer
      coordinates.
  
      Params:
        win = a [gid.gtk4.types.TextWindowType]
        windowX = window x coordinate
        windowY = window y coordinate
        bufferX = buffer x coordinate return location
        bufferY = buffer y coordinate return location
  */
  void windowToBufferCoords(gid.gtk4.types.TextWindowType win, int windowX, int windowY, out int bufferX, out int bufferY) nothrow
  {
    gtk_text_view_window_to_buffer_coords(cast(GtkTextView*)this._cPtr, win, windowX, windowY, cast(int*)&bufferX, cast(int*)&bufferY);
  }

  /**
      Connect to `Backspace` signal.
  
      Gets emitted when the user asks for it.
        
        The ::backspace signal is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Backspace</kbd> and <kbd>Shift</kbd>+<kbd>Backspace</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectBackspace(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.backspace");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("backspace", closure, after);
  }

  /**
      Connect to `CopyClipboard` signal.
  
      Gets emitted to copy the selection to the clipboard.
        
        The ::copy-clipboard signal is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>c</kbd> and
        <kbd>Ctrl</kbd>+<kbd>Insert</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.copyClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
      Connect to `CutClipboard` signal.
  
      Gets emitted to cut the selection to the clipboard.
        
        The ::cut-clipboard signal is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>x</kbd> and
        <kbd>Shift</kbd>+<kbd>Delete</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCutClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.cutClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cut-clipboard", closure, after);
  }

  /**
      Connect to `DeleteFromCursor` signal.
  
      Gets emitted when the user initiates a text deletion.
        
        The ::delete-from-cursor signal is a [keybinding signal](class.SignalAction.html).
        
        If the type is [gid.gtk4.types.DeleteType.Chars], GTK deletes the selection
        if there is one, otherwise it deletes the requested number
        of characters.
        
        The default bindings for this signal are <kbd>Delete</kbd> for
        deleting a character, <kbd>Ctrl</kbd>+<kbd>Delete</kbd> for
        deleting a word and <kbd>Ctrl</kbd>+<kbd>Backspace</kbd> for
        deleting a word backwards.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.types.DeleteType type, int count, gid.gtk4.text_view.TextView textView)`
  
          `type` the granularity of the deletion, as a [gid.gtk4.types.DeleteType] (optional)
  
          `count` the number of type units to delete (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeleteFromCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.DeleteType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.deleteFromCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-from-cursor", closure, after);
  }

  /**
      Connect to `ExtendSelection` signal.
  
      Emitted when the selection needs to be extended at location.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.types.TextExtendSelection granularity, gid.gtk4.text_iter.TextIter location, gid.gtk4.text_iter.TextIter start, gid.gtk4.text_iter.TextIter end, gid.gtk4.text_view.TextView textView)`
  
          `granularity` the granularity type (optional)
  
          `location` the location where to extend the selection (optional)
  
          `start` where the selection should start (optional)
  
          `end` where the selection should end (optional)
  
          `textView` the instance the signal is connected to (optional)
  
          `Returns` [gid.gdk4.types.EVENT_STOP] to stop other handlers from being invoked for the
              event. [gid.gdk4.types.EVENT_PROPAGATE] to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectExtendSelection(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.TextExtendSelection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk4.text_view.TextView)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

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
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.extendSelection");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extend-selection", closure, after);
  }

  /**
      Connect to `InsertAtCursor` signal.
  
      Gets emitted when the user initiates the insertion of a
        fixed string at the cursor.
        
        The ::insert-at-cursor signal is a [keybinding signal](class.SignalAction.html).
        
        This signal has no default bindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string string_, gid.gtk4.text_view.TextView textView)`
  
          `string_` the string to insert (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertAtCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.insertAtCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-at-cursor", closure, after);
  }

  /**
      Connect to `InsertEmoji` signal.
  
      Gets emitted to present the Emoji chooser for the text_view.
        
        The ::insert-emoji signal is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>.</kbd> and
        <kbd>Ctrl</kbd>+<kbd>;</kbd>
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertEmoji(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.insertEmoji");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-emoji", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      Gets emitted when the user initiates a cursor movement.
        
        The ::move-cursor signal is a [keybinding signal](class.SignalAction.html).
        If the cursor is not visible in text_view, this signal causes
        the viewport to be moved instead.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control the cursor
        programmatically.
        
        
        The default bindings for this signal come in two variants,
        the variant with the <kbd>Shift</kbd> modifier extends the
        selection, the variant without it does not.
        There are too many key combinations to list them all here.
        
        - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd>
          move by individual characters/lines
        - <kbd>Ctrl</kbd>+<kbd>←</kbd>, etc. move by words/paragraphs
        - <kbd>Home</kbd> and <kbd>End</kbd> move to the ends of the buffer
        - <kbd>PgUp</kbd> and <kbd>PgDn</kbd> move vertically by pages
        - <kbd>Ctrl</kbd>+<kbd>PgUp</kbd> and <kbd>Ctrl</kbd>+<kbd>PgDn</kbd>
          move horizontally by pages
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.types.MovementStep step, int count, bool extendSelection, gid.gtk4.text_view.TextView textView)`
  
          `step` the granularity of the move, as a [gid.gtk4.types.MovementStep] (optional)
  
          `count` the number of step units to move (optional)
  
          `extendSelection` true if the move should extend the selection (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.moveCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `MoveViewport` signal.
  
      Gets emitted to move the viewport.
        
        The ::move-viewport signal is a [keybinding signal](class.SignalAction.html),
        which can be bound to key combinations to allow the user to move the viewport,
        i.e. change what part of the text view is visible in a containing scrolled
        window.
        
        There are no default bindings for this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.types.ScrollStep step, int count, gid.gtk4.text_view.TextView textView)`
  
          `step` the granularity of the movement, as a [gid.gtk4.types.ScrollStep] (optional)
  
          `count` the number of step units to move (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveViewport(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.ScrollStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.moveViewport");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-viewport", closure, after);
  }

  /**
      Connect to `PasteClipboard` signal.
  
      Gets emitted to paste the contents of the clipboard
        into the text view.
        
        The ::paste-clipboard signal is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>v</kbd> and
        <kbd>Shift</kbd>+<kbd>Insert</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.pasteClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paste-clipboard", closure, after);
  }

  /**
      Connect to `PreeditChanged` signal.
  
      Emitted when preedit text of the active IM changes.
        
        If an input method is used, the typed text will not immediately
        be committed to the buffer. So if you are interested in the text,
        connect to this signal.
        
        This signal is only emitted if the text at the given position
        is actually editable.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string preedit, gid.gtk4.text_view.TextView textView)`
  
          `preedit` the current preedit string (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.preeditChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-changed", closure, after);
  }

  /**
      Connect to `SelectAll` signal.
  
      Gets emitted to select or unselect the complete contents of the text view.
        
        The ::select-all signal is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>a</kbd> and
        <kbd>Ctrl</kbd>+<kbd>/</kbd> for selecting and
        <kbd>Shift</kbd>+<kbd>Ctrl</kbd>+<kbd>a</kbd> and
        <kbd>Ctrl</kbd>+<kbd>\</kbd> for unselecting.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(bool select, gid.gtk4.text_view.TextView textView)`
  
          `select` true to select, false to unselect (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectAll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.selectAll");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      Connect to `SetAnchor` signal.
  
      Gets emitted when the user initiates settings the "anchor" mark.
        
        The ::set-anchor signal is a [keybinding signal](class.SignalAction.html)
        which gets emitted when the user initiates setting the "anchor"
        mark. The "anchor" mark gets placed at the same position as the
        "insert" mark.
        
        This signal has no default bindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSetAnchor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.setAnchor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("set-anchor", closure, after);
  }

  /**
      Connect to `ToggleCursorVisible` signal.
  
      Gets emitted to toggle the `cursor-visible` property.
        
        The ::toggle-cursor-visible signal is a
        [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>F7</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleCursorVisible(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.toggleCursorVisible");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-visible", closure, after);
  }

  /**
      Connect to `ToggleOverwrite` signal.
  
      Gets emitted to toggle the overwrite mode of the text view.
        
        The ::toggle-overwrite signal is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>Insert</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleOverwrite(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.toggleOverwrite");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-overwrite", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TextView
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.text_view.TextView), T.stringof ~ " is not derived from gid.gtk4.text_view.TextView");

    gid.gtk4.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBackspace", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "backspace");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCopyClipboard", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "copy_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCutClipboard", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "cut_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeleteFromCursor", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "delete_from_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncExtendSelection", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "extend_selection");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertAtCursor", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "insert_at_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertEmoji", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "insert_emoji");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveCursor", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "move_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPasteClipboard", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "paste_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetAnchor", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "set_anchor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSnapshotLayer", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "snapshot_layer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggleOverwrite", true)[0]) == gid.gtk4.text_view.TextView))
      _installVfunc(klass, "toggle_overwrite");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkTextViewClass*)klass;

    switch (vfunc)
    {
      case "backspace":
      {
        static extern(C) void _vfuncBackspaceTramp(GtkTextView* textView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.backspace)
              return (cast(typeof(&_vfuncBackspaceTramp))_klass.backspace)(textView);
            return;
          }

          try
          {
            _obj.vfuncBackspace();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncBackspace");
          }
        }

        _klass.backspace = cast(typeof(_klass.backspace))&_vfuncBackspaceTramp;
        break;
      }
      case "copy_clipboard":
      {
        static extern(C) void _vfuncCopyClipboardTramp(GtkTextView* textView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.copyClipboard)
              return (cast(typeof(&_vfuncCopyClipboardTramp))_klass.copyClipboard)(textView);
            return;
          }

          try
          {
            _obj.vfuncCopyClipboard();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncCopyClipboard");
          }
        }

        _klass.copyClipboard = cast(typeof(_klass.copyClipboard))&_vfuncCopyClipboardTramp;
        break;
      }
      case "cut_clipboard":
      {
        static extern(C) void _vfuncCutClipboardTramp(GtkTextView* textView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.cutClipboard)
              return (cast(typeof(&_vfuncCutClipboardTramp))_klass.cutClipboard)(textView);
            return;
          }

          try
          {
            _obj.vfuncCutClipboard();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncCutClipboard");
          }
        }

        _klass.cutClipboard = cast(typeof(_klass.cutClipboard))&_vfuncCutClipboardTramp;
        break;
      }
      case "delete_from_cursor":
      {
        static extern(C) void _vfuncDeleteFromCursorTramp(GtkTextView* textView, GtkDeleteType type, int count) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.deleteFromCursor)
              return (cast(typeof(&_vfuncDeleteFromCursorTramp))_klass.deleteFromCursor)(textView, type, count);
            return;
          }

          try
          {
            _obj.vfuncDeleteFromCursor(type, count);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncDeleteFromCursor");
          }
        }

        _klass.deleteFromCursor = cast(typeof(_klass.deleteFromCursor))&_vfuncDeleteFromCursorTramp;
        break;
      }
      case "extend_selection":
      {
        static extern(C) gboolean _vfuncExtendSelectionTramp(GtkTextView* textView, GtkTextExtendSelection granularity, const(GtkTextIter)* location, GtkTextIter* start, GtkTextIter* end) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.extendSelection)
              return (cast(typeof(&_vfuncExtendSelectionTramp))_klass.extendSelection)(textView, granularity, location, start, end);
            return typeof(return).init;
          }

          bool _dretval;
          auto _start = start ? new gid.gtk4.text_iter.TextIter(cast(void*)start, Yes.Take)._cBorrow : null;
          auto _end = end ? new gid.gtk4.text_iter.TextIter(cast(void*)end, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncExtendSelection(granularity, location ? new gid.gtk4.text_iter.TextIter(cast(void*)location, No.Take) : null, _start, _end);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncExtendSelection");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_start)
            _start._cUnborrow;
          if (_end)
            _end._cUnborrow;

          return _retval;
        }

        _klass.extendSelection = cast(typeof(_klass.extendSelection))&_vfuncExtendSelectionTramp;
        break;
      }
      case "insert_at_cursor":
      {
        static extern(C) void _vfuncInsertAtCursorTramp(GtkTextView* textView, const(char)* str) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.insertAtCursor)
              return (cast(typeof(&_vfuncInsertAtCursorTramp))_klass.insertAtCursor)(textView, str);
            return;
          }

          string _str = str.fromCString!(No.Free);

          try
          {
            _obj.vfuncInsertAtCursor(_str);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncInsertAtCursor");
          }
        }

        _klass.insertAtCursor = cast(typeof(_klass.insertAtCursor))&_vfuncInsertAtCursorTramp;
        break;
      }
      case "insert_emoji":
      {
        static extern(C) void _vfuncInsertEmojiTramp(GtkTextView* textView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.insertEmoji)
              return (cast(typeof(&_vfuncInsertEmojiTramp))_klass.insertEmoji)(textView);
            return;
          }

          try
          {
            _obj.vfuncInsertEmoji();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncInsertEmoji");
          }
        }

        _klass.insertEmoji = cast(typeof(_klass.insertEmoji))&_vfuncInsertEmojiTramp;
        break;
      }
      case "move_cursor":
      {
        static extern(C) void _vfuncMoveCursorTramp(GtkTextView* textView, GtkMovementStep step, int count, gboolean extendSelection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.moveCursor)
              return (cast(typeof(&_vfuncMoveCursorTramp))_klass.moveCursor)(textView, step, count, extendSelection);
            return;
          }

          try
          {
            _obj.vfuncMoveCursor(step, count, cast(bool)extendSelection);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncMoveCursor");
          }
        }

        _klass.moveCursor = cast(typeof(_klass.moveCursor))&_vfuncMoveCursorTramp;
        break;
      }
      case "paste_clipboard":
      {
        static extern(C) void _vfuncPasteClipboardTramp(GtkTextView* textView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.pasteClipboard)
              return (cast(typeof(&_vfuncPasteClipboardTramp))_klass.pasteClipboard)(textView);
            return;
          }

          try
          {
            _obj.vfuncPasteClipboard();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncPasteClipboard");
          }
        }

        _klass.pasteClipboard = cast(typeof(_klass.pasteClipboard))&_vfuncPasteClipboardTramp;
        break;
      }
      case "set_anchor":
      {
        static extern(C) void _vfuncSetAnchorTramp(GtkTextView* textView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.setAnchor)
              return (cast(typeof(&_vfuncSetAnchorTramp))_klass.setAnchor)(textView);
            return;
          }

          try
          {
            _obj.vfuncSetAnchor();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncSetAnchor");
          }
        }

        _klass.setAnchor = cast(typeof(_klass.setAnchor))&_vfuncSetAnchorTramp;
        break;
      }
      case "snapshot_layer":
      {
        static extern(C) void _vfuncSnapshotLayerTramp(GtkTextView* textView, GtkTextViewLayer layer, GtkSnapshot* snapshot) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.snapshotLayer)
              return (cast(typeof(&_vfuncSnapshotLayerTramp))_klass.snapshotLayer)(textView, layer, snapshot);
            return;
          }

          try
          {
            _obj.vfuncSnapshotLayer(layer, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.snapshot.Snapshot)(cast(void*)snapshot, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncSnapshotLayer");
          }
        }

        _klass.snapshotLayer = cast(typeof(_klass.snapshotLayer))&_vfuncSnapshotLayerTramp;
        break;
      }
      case "toggle_overwrite":
      {
        static extern(C) void _vfuncToggleOverwriteTramp(GtkTextView* textView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.toggleOverwrite)
              return (cast(typeof(&_vfuncToggleOverwriteTramp))_klass.toggleOverwrite)(textView);
            return;
          }

          try
          {
            _obj.vfuncToggleOverwrite();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.text_view.TextView.vfuncToggleOverwrite");
          }
        }

        _klass.toggleOverwrite = cast(typeof(_klass.toggleOverwrite))&_vfuncToggleOverwriteTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.text_view.TextView]
class TextViewGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.accessible_text.AccessibleTextGidBuilderImpl!T, gid.gtk4.scrollable.ScrollableGidBuilderImpl!T
{

  mixin AccessibleTextGidBuilderT!();
  mixin ScrollableGidBuilderT!();

  /**
      Set `acceptsTab` property.
      Params:
        propval = Whether Tab will result in a tab character being entered.
      Returns: Builder instance for fluent chaining
  */
  T acceptsTab(bool propval) nothrow
  {
    return setProperty("accepts-tab", propval);
  }

  /**
      Set `bottomMargin` property.
      Params:
        propval = The bottom margin for text in the text view.
          
          Note that this property is confusingly named. In CSS terms,
          the value set here is padding, and it is applied in addition
          to the padding from the theme.
          
          Don't confuse this property with [gid.gtk4.widget.Widget.marginBottom].
      Returns: Builder instance for fluent chaining
  */
  T bottomMargin(int propval) nothrow
  {
    return setProperty("bottom-margin", propval);
  }

  /**
      Set `buffer` property.
      Params:
        propval = The buffer which is displayed.
      Returns: Builder instance for fluent chaining
  */
  T buffer(gid.gtk4.text_buffer.TextBuffer propval) nothrow
  {
    return setProperty("buffer", propval);
  }

  /**
      Set `cursorVisible` property.
      Params:
        propval = If the insertion cursor is shown.
      Returns: Builder instance for fluent chaining
  */
  T cursorVisible(bool propval) nothrow
  {
    return setProperty("cursor-visible", propval);
  }

  /**
      Set `editable` property.
      Params:
        propval = Whether the text can be modified by the user.
      Returns: Builder instance for fluent chaining
  */
  T editable(bool propval) nothrow
  {
    return setProperty("editable", propval);
  }

  /**
      Set `extraMenu` property.
      Params:
        propval = A menu model whose contents will be appended to the context menu.
      Returns: Builder instance for fluent chaining
  */
  T extraMenu(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("extra-menu", propval);
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which IM (input method) module should be used for this text_view.
          
          See [gid.gtk4.immulticontext.IMMulticontext].
          
          Setting this to a non-null value overrides the system-wide IM module
          setting. See the GtkSettings [gid.gtk4.settings.Settings.gtkImModule] property.
      Returns: Builder instance for fluent chaining
  */
  T imModule(string propval) nothrow
  {
    return setProperty("im-module", propval);
  }

  /**
      Set `indent` property.
      Params:
        propval = Amount to indent the paragraph, in pixels.
          
          A negative value of indent will produce a hanging indentation.
          That is, the first line will have the full width, and subsequent
          lines will be indented by the absolute value of indent.
      Returns: Builder instance for fluent chaining
  */
  T indent(int propval) nothrow
  {
    return setProperty("indent", propval);
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints (beyond [gid.gtk4.text_view.TextView.inputPurpose])
          that allow input methods to fine-tune their behaviour.
      Returns: Builder instance for fluent chaining
  */
  T inputHints(gid.gtk4.types.InputHints propval) nothrow
  {
    return setProperty("input-hints", propval);
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose of this text field.
          
          This property can be used by on-screen keyboards and other input
          methods to adjust their behaviour.
      Returns: Builder instance for fluent chaining
  */
  T inputPurpose(gid.gtk4.types.InputPurpose propval) nothrow
  {
    return setProperty("input-purpose", propval);
  }

  /**
      Set `justification` property.
      Params:
        propval = Left, right, or center justification.
      Returns: Builder instance for fluent chaining
  */
  T justification(gid.gtk4.types.Justification propval) nothrow
  {
    return setProperty("justification", propval);
  }

  /**
      Set `leftMargin` property.
      Params:
        propval = The default left margin for text in the text view.
          
          Tags in the buffer may override the default.
          
          Note that this property is confusingly named. In CSS terms,
          the value set here is padding, and it is applied in addition
          to the padding from the theme.
      Returns: Builder instance for fluent chaining
  */
  T leftMargin(int propval) nothrow
  {
    return setProperty("left-margin", propval);
  }

  /**
      Set `monospace` property.
      Params:
        propval = Whether text should be displayed in a monospace font.
          
          If true, set the .monospace style class on the
          text view to indicate that a monospace font is desired.
      Returns: Builder instance for fluent chaining
  */
  T monospace(bool propval) nothrow
  {
    return setProperty("monospace", propval);
  }

  /**
      Set `overwrite` property.
      Params:
        propval = Whether entered text overwrites existing contents.
      Returns: Builder instance for fluent chaining
  */
  T overwrite(bool propval) nothrow
  {
    return setProperty("overwrite", propval);
  }

  /**
      Set `pixelsAboveLines` property.
      Params:
        propval = Pixels of blank space above paragraphs.
      Returns: Builder instance for fluent chaining
  */
  T pixelsAboveLines(int propval) nothrow
  {
    return setProperty("pixels-above-lines", propval);
  }

  /**
      Set `pixelsBelowLines` property.
      Params:
        propval = Pixels of blank space below paragraphs.
      Returns: Builder instance for fluent chaining
  */
  T pixelsBelowLines(int propval) nothrow
  {
    return setProperty("pixels-below-lines", propval);
  }

  /**
      Set `pixelsInsideWrap` property.
      Params:
        propval = Pixels of blank space between wrapped lines in a paragraph.
      Returns: Builder instance for fluent chaining
  */
  T pixelsInsideWrap(int propval) nothrow
  {
    return setProperty("pixels-inside-wrap", propval);
  }

  /**
      Set `rightMargin` property.
      Params:
        propval = The default right margin for text in the text view.
          
          Tags in the buffer may override the default.
          
          Note that this property is confusingly named. In CSS terms,
          the value set here is padding, and it is applied in addition
          to the padding from the theme.
      Returns: Builder instance for fluent chaining
  */
  T rightMargin(int propval) nothrow
  {
    return setProperty("right-margin", propval);
  }

  /**
      Set `tabs` property.
      Params:
        propval = Custom tabs for this text.
      Returns: Builder instance for fluent chaining
  */
  T tabs(gid.pango1.tab_array.TabArray propval) nothrow
  {
    return setProperty("tabs", propval);
  }

  /**
      Set `topMargin` property.
      Params:
        propval = The top margin for text in the text view.
          
          Note that this property is confusingly named. In CSS terms,
          the value set here is padding, and it is applied in addition
          to the padding from the theme.
          
          Don't confuse this property with [gid.gtk4.widget.Widget.marginTop].
      Returns: Builder instance for fluent chaining
  */
  T topMargin(int propval) nothrow
  {
    return setProperty("top-margin", propval);
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Whether to wrap lines never, at word boundaries, or at character boundaries.
      Returns: Builder instance for fluent chaining
  */
  T wrapMode(gid.gtk4.types.WrapMode propval) nothrow
  {
    return setProperty("wrap-mode", propval);
  }
}

/// Fluent builder for [gid.gtk4.text_view.TextView]
final class TextViewGidBuilder : TextViewGidBuilderImpl!TextViewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TextView build() nothrow
  {
    return new TextView(cast(void*)createGObject(TextView._getGType), Yes.Take);
  }
}
