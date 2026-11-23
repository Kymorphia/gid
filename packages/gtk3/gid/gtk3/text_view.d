/// Module for [TextView] class
module gid.gtk3.text_view;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.cairo1.context;
import gid.core.utils;
import gid.gdk3.event_key;
import gid.gdk3.rectangle;
import gid.gdk3.window;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.scrollable;
import gid.gtk3.scrollable_mixin;
import gid.gtk3.text_attributes;
import gid.gtk3.text_buffer;
import gid.gtk3.text_child_anchor;
import gid.gtk3.text_iter;
import gid.gtk3.text_mark;
import gid.gtk3.types;
import gid.gtk3.widget;
import gid.pango1.tab_array;

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and data
    types related to the text widget and how they work together.
    
    # CSS nodes
    
    ```plain
    textview.view
    ├── border.top
    ├── border.left
    ├── text
    │   ╰── [selection]
    ├── border.right
    ├── border.bottom
    ╰── [window.popup]
    ```
    
    GtkTextView has a main css node with name textview and style class .view,
    and subnodes for each of the border windows, and the main text area,
    with names border and text, respectively. The border nodes each get
    one of the style classes .left, .right, .top or .bottom.
    
    A node representing the selection will appear below the text node.
    
    If a context menu is opened, the window node will appear as a subnode
    of the main node.
*/
class TextView : gid.gtk3.container.Container, gid.gtk3.scrollable.Scrollable
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
      Get builder for [gid.gtk3.text_view.TextView]
      Returns: New builder object
  */
  static TextViewGidBuilder builder() nothrow
  {
    return new TextViewGidBuilder;
  }

  /** */
  @property bool acceptsTab() nothrow
  {
    return getAcceptsTab();
  }

  /** */
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
        
        Don't confuse this property with #GtkWidget:margin-bottom.
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
          
          Don't confuse this property with #GtkWidget:margin-bottom.
  */
  @property void bottomMargin(int propval) nothrow
  {
    setBottomMargin(propval);
  }

  /** */
  @property gid.gtk3.text_buffer.TextBuffer buffer() nothrow
  {
    return getBuffer();
  }

  /** */
  @property void buffer(gid.gtk3.text_buffer.TextBuffer propval) nothrow
  {
    setBuffer(propval);
  }

  /** */
  @property bool cursorVisible() nothrow
  {
    return getCursorVisible();
  }

  /** */
  @property void cursorVisible(bool propval) nothrow
  {
    setCursorVisible(propval);
  }

  /** */
  @property bool editable() nothrow
  {
    return getEditable();
  }

  /** */
  @property void editable(bool propval) nothrow
  {
    setEditable(propval);
  }

  /**
      Get `imModule` property.
      Returns: Which IM (input method) module should be used for this text_view.
        See #GtkIMContext.
        
        Setting this to a non-null value overrides the
        system-wide IM module setting. See the GtkSettings
        #GtkSettings:gtk-im-module property.
  */
  @property string imModule() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("im-module");
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which IM (input method) module should be used for this text_view.
          See #GtkIMContext.
          
          Setting this to a non-null value overrides the
          system-wide IM module setting. See the GtkSettings
          #GtkSettings:gtk-im-module property.
  */
  @property void imModule(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("im-module", propval);
  }

  /** */
  @property int indent() nothrow
  {
    return getIndent();
  }

  /** */
  @property void indent(int propval) nothrow
  {
    setIndent(propval);
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints (beyond #GtkTextView:input-purpose) that
        allow input methods to fine-tune their behaviour.
  */
  @property gid.gtk3.types.InputHints inputHints() nothrow
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints (beyond #GtkTextView:input-purpose) that
          allow input methods to fine-tune their behaviour.
  */
  @property void inputHints(gid.gtk3.types.InputHints propval) nothrow
  {
    setInputHints(propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The purpose of this text field.
        
        This property can be used by on-screen keyboards and other input
        methods to adjust their behaviour.
  */
  @property gid.gtk3.types.InputPurpose inputPurpose() nothrow
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
  @property void inputPurpose(gid.gtk3.types.InputPurpose propval) nothrow
  {
    setInputPurpose(propval);
  }

  /** */
  @property gid.gtk3.types.Justification justification() nothrow
  {
    return getJustification();
  }

  /** */
  @property void justification(gid.gtk3.types.Justification propval) nothrow
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
        
        Don't confuse this property with #GtkWidget:margin-left.
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
          
          Don't confuse this property with #GtkWidget:margin-left.
  */
  @property void leftMargin(int propval) nothrow
  {
    setLeftMargin(propval);
  }

  /** */
  @property bool monospace() nothrow
  {
    return getMonospace();
  }

  /** */
  @property void monospace(bool propval) nothrow
  {
    setMonospace(propval);
  }

  /** */
  @property bool overwrite() nothrow
  {
    return getOverwrite();
  }

  /** */
  @property void overwrite(bool propval) nothrow
  {
    setOverwrite(propval);
  }

  /** */
  @property int pixelsAboveLines() nothrow
  {
    return getPixelsAboveLines();
  }

  /** */
  @property void pixelsAboveLines(int propval) nothrow
  {
    setPixelsAboveLines(propval);
  }

  /** */
  @property int pixelsBelowLines() nothrow
  {
    return getPixelsBelowLines();
  }

  /** */
  @property void pixelsBelowLines(int propval) nothrow
  {
    setPixelsBelowLines(propval);
  }

  /** */
  @property int pixelsInsideWrap() nothrow
  {
    return getPixelsInsideWrap();
  }

  /** */
  @property void pixelsInsideWrap(int propval) nothrow
  {
    setPixelsInsideWrap(propval);
  }

  /**
      Get `populateAll` property.
      Returns: If :populate-all is true, the #GtkTextView::populate-popup
        signal is also emitted for touch popups.
  */
  @property bool populateAll() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("populate-all");
  }

  /**
      Set `populateAll` property.
      Params:
        propval = If :populate-all is true, the #GtkTextView::populate-popup
          signal is also emitted for touch popups.
  */
  @property void populateAll(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("populate-all", propval);
  }

  /**
      Get `rightMargin` property.
      Returns: The default right margin for text in the text view.
        Tags in the buffer may override the default.
        
        Note that this property is confusingly named. In CSS terms,
        the value set here is padding, and it is applied in addition
        to the padding from the theme.
        
        Don't confuse this property with #GtkWidget:margin-right.
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
          
          Don't confuse this property with #GtkWidget:margin-right.
  */
  @property void rightMargin(int propval) nothrow
  {
    setRightMargin(propval);
  }

  /** */
  @property gid.pango1.tab_array.TabArray tabs() nothrow
  {
    return getTabs();
  }

  /** */
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
        
        Don't confuse this property with #GtkWidget:margin-top.
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
          
          Don't confuse this property with #GtkWidget:margin-top.
  */
  @property void topMargin(int propval) nothrow
  {
    setTopMargin(propval);
  }

  /** */
  @property gid.gtk3.types.WrapMode wrapMode() nothrow
  {
    return getWrapMode();
  }

  /** */
  @property void wrapMode(gid.gtk3.types.WrapMode propval) nothrow
  {
    setWrapMode(propval);
  }

  mixin ScrollableT!();

  /**
      Creates a new #GtkTextView. If you don’t call [gid.gtk4.text_view.TextView.setBuffer]
      before using the text view, an empty default buffer will be created
      for you. Get the buffer with [gid.gtk4.text_view.TextView.getBuffer]. If you want
      to specify your own buffer, consider [gid.gtk4.text_view.TextView.newWithBuffer].
      Returns: a new #GtkTextView
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
      Creates a new #GtkTextView widget displaying the buffer
      buffer. One buffer can be shared among many widgets.
      buffer may be null to create a default buffer, in which case
      this function is equivalent to [gid.gtk4.text_view.TextView.new_]. The
      text view adds its own reference count to the buffer; it does not
      take over an existing reference.
  
      Params:
        buffer = a #GtkTextBuffer
      Returns: a new #GtkTextView.
  */
  static gid.gtk3.text_view.TextView newWithBuffer(gid.gtk3.text_buffer.TextBuffer buffer) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_view_new_with_buffer(buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_view.TextView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      The class handler for the #GtkTextView::backspace
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
      The class handler for the #GtkTextview::copy-clipboard
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
      The class handler for the #GtkTextView::cut-clipboard
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
      The class handler for the #GtkTextView::delete-from-cursor
        keybinding signal.
  
      Params:
        type = 
        count = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDeleteFromCursor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncDeleteFromCursor(gid.gtk3.types.DeleteType type, int count)
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.deleteFromCursor)
      return;

    _klass.deleteFromCursor(cast(GtkTextView*)this._cPtr, type, count);
  }

  /**
      The draw_layer vfunc is called before and after the text
        view is drawing its own text. Applications can override this vfunc
        in a subclass to draw customized content underneath or above the
        text. In the [gid.gtk4.types.TextViewLayer.BelowText] and [gid.gtk4.types.TextViewLayer.AboveText]
        the drawing is done in the buffer coordinate space, but the older (deprecated)
        layers [gid.gtk3.types.TextViewLayer.Below] and [gid.gtk3.types.TextViewLayer.Above] work in viewport
        coordinates, which makes them unnecessarily hard to use. Since: 3.14
  
      Params:
        layer = 
        cr =  (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDrawLayer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncDrawLayer(gid.gtk3.types.TextViewLayer layer, gid.cairo1.context.Context cr)
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.drawLayer)
      return;

    _klass.drawLayer(cast(GtkTextView*)this._cPtr, layer, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  }

  /**
      The class handler for the #GtkTextView::extend-selection
        signal. Since 3.16
  
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
  protected bool vfuncExtendSelection(gid.gtk3.types.TextExtendSelection granularity, gid.gtk3.text_iter.TextIter location, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end)
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.extendSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.extendSelection(cast(GtkTextView*)this._cPtr, granularity, location ? cast(const(GtkTextIter)*)location._cPtr(No.Dup) : null, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      The class handler for the #GtkTextView::insert-at-cursor
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

  /** */
  protected void vfuncInsertEmoji()
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.insertEmoji)
      return;

    _klass.insertEmoji(cast(GtkTextView*)this._cPtr);
  }

  /**
      The class handler for the #GtkTextView::move-cursor
        keybinding signal.
  
      Params:
        step = 
        count = 
        extendSelection = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMoveCursor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncMoveCursor(gid.gtk3.types.MovementStep step, int count, bool extendSelection)
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.moveCursor)
      return;

    _klass.moveCursor(cast(GtkTextView*)this._cPtr, step, count, extendSelection);
  }

  /**
      The class handler for the #GtkTextView::paste-clipboard
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
      The class handler for the #GtkTextView::populate-popup
        signal.
  
      Params:
        popup = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPopulatePopup` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncPopulatePopup(gid.gtk3.widget.Widget popup)
  {
    auto _klass = cast(GtkTextViewClass*)_vfuncClass;
    if (!_klass.populatePopup)
      return;

    _klass.populatePopup(cast(GtkTextView*)this._cPtr, popup ? cast(GtkWidget*)popup._cPtr(No.Dup) : null);
  }

  /**
      The class handler for the #GtkTextView::set-anchor
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
      The class handler for the #GtkTextView::toggle-overwrite
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
        child = a #GtkWidget
        anchor = a #GtkTextChildAnchor in the #GtkTextBuffer for text_view
  */
  void addChildAtAnchor(gid.gtk3.widget.Widget child, gid.gtk3.text_child_anchor.TextChildAnchor anchor) nothrow
  {
    gtk_text_view_add_child_at_anchor(cast(GtkTextView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
  }

  /**
      Adds a child at fixed coordinates in one of the text widget's
      windows.
      
      The window must have nonzero size (see
      [gid.gtk3.text_view.TextView.setBorderWindowSize]). Note that the child
      coordinates are given relative to scrolling. When
      placing a child in #GTK_TEXT_WINDOW_WIDGET, scrolling is
      irrelevant, the child floats above all scrollable areas. But when
      placing a child in one of the scrollable windows (border windows or
      text window) it will move with the scrolling as needed.
  
      Params:
        child = a #GtkWidget
        whichWindow = which window the child should appear in
        xpos = X position of child in window coordinates
        ypos = Y position of child in window coordinates
  */
  void addChildInWindow(gid.gtk3.widget.Widget child, gid.gtk3.types.TextWindowType whichWindow, int xpos, int ypos) nothrow
  {
    gtk_text_view_add_child_in_window(cast(GtkTextView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, whichWindow, xpos, ypos);
  }

  /**
      Moves the given iter backward by one display (wrapped) line.
      A display line is different from a paragraph. Paragraphs are
      separated by newlines or other paragraph separator characters.
      Display lines are created by line-wrapping a paragraph. If
      wrapping is turned off, display lines and paragraphs will be the
      same. Display lines are divided differently for each view, since
      they depend on the view’s width; paragraphs are the same in all
      views, since they depend on the contents of the #GtkTextBuffer.
  
      Params:
        iter = a #GtkTextIter
      Returns: true if iter was moved and is not on the end iterator
  */
  bool backwardDisplayLine(gid.gtk3.text_iter.TextIter iter) nothrow
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
      views, since they depend on the contents of the #GtkTextBuffer.
  
      Params:
        iter = a #GtkTextIter
      Returns: true if iter was moved and is not on the end iterator
  */
  bool backwardDisplayLineStart(gid.gtk3.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_backward_display_line_start(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts coordinate (buffer_x, buffer_y) to coordinates for the window
      win, and stores the result in (window_x, window_y).
      
      Note that you can’t convert coordinates for a nonexisting window (see
      [gid.gtk3.text_view.TextView.setBorderWindowSize]).
  
      Params:
        win = a #GtkTextWindowType, except [gid.gtk3.types.TextWindowType.Private]
        bufferX = buffer x coordinate
        bufferY = buffer y coordinate
        windowX = window x coordinate return location or null
        windowY = window y coordinate return location or null
  */
  void bufferToWindowCoords(gid.gtk3.types.TextWindowType win, int bufferX, int bufferY, out int windowX, out int windowY) nothrow
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
      views, since they depend on the contents of the #GtkTextBuffer.
  
      Params:
        iter = a #GtkTextIter
      Returns: true if iter was moved and is not on the end iterator
  */
  bool forwardDisplayLine(gid.gtk3.text_iter.TextIter iter) nothrow
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
      views, since they depend on the contents of the #GtkTextBuffer.
  
      Params:
        iter = a #GtkTextIter
      Returns: true if iter was moved and is not on the end iterator
  */
  bool forwardDisplayLineEnd(gid.gtk3.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_forward_display_line_end(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns whether pressing the Tab key inserts a tab characters.
      [gid.gtk4.text_view.TextView.setAcceptsTab].
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
      Gets the width of the specified border window. See
      [gid.gtk3.text_view.TextView.setBorderWindowSize].
  
      Params:
        type = window to return size from
      Returns: width of window
  */
  int getBorderWindowSize(gid.gtk3.types.TextWindowType type) nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_border_window_size(cast(GtkTextView*)this._cPtr, type);
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
      Returns the #GtkTextBuffer being displayed by this text view.
      The reference count on the buffer is not incremented; the caller
      of this function won’t own a new reference.
      Returns: a #GtkTextBuffer
  */
  gid.gtk3.text_buffer.TextBuffer getBuffer() nothrow
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_text_view_get_buffer(cast(GtkTextView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_buffer.TextBuffer)(cast(GtkTextBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Given an iter within a text layout, determine the positions of the
      strong and weak cursors if the insertion point is at that
      iterator. The position of each cursor is stored as a zero-width
      rectangle. The strong cursor location is the location where
      characters of the directionality equal to the base direction of the
      paragraph are inserted.  The weak cursor location is the location
      where characters of the directionality opposite to the base
      direction of the paragraph are inserted.
      
      If iter is null, the actual cursor position is used.
      
      Note that if iter happens to be the actual cursor position, and
      there is currently an IM preedit sequence being entered, the
      returned locations will be adjusted to account for the preedit
      cursor’s offset within the preedit sequence.
      
      The rectangle position is in buffer coordinates; use
      [gid.gtk4.text_view.TextView.bufferToWindowCoords] to convert these
      coordinates to coordinates for one of the windows in the text view.
  
      Params:
        iter = a #GtkTextIter
        strong = location to store the strong
              cursor position (may be null)
        weak = location to store the weak
              cursor position (may be null)
  */
  void getCursorLocations(gid.gtk3.text_iter.TextIter iter, out gid.gdk3.rectangle.Rectangle strong, out gid.gdk3.rectangle.Rectangle weak) nothrow
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
      Obtains a copy of the default text attributes. These are the
      attributes used for text unless a tag overrides them.
      You’d typically pass the default attributes in to
      [gid.gtk3.text_iter.TextIter.getAttributes] in order to get the
      attributes in effect at a given text position.
      
      The return value is a copy owned by the caller of this function,
      and should be freed with [gid.gtk3.text_attributes.TextAttributes.unref].
      Returns: a new #GtkTextAttributes
  */
  gid.gtk3.text_attributes.TextAttributes getDefaultAttributes() nothrow
  {
    GtkTextAttributes* _cretval;
    _cretval = gtk_text_view_get_default_attributes(cast(GtkTextView*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.text_attributes.TextAttributes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the default editability of the #GtkTextView. Tags in the
      buffer may override this setting for some ranges of text.
      Returns: whether text is editable by default
  */
  bool getEditable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_editable(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the horizontal-scrolling #GtkAdjustment.
      Returns: pointer to the horizontal #GtkAdjustment
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.getHadjustment]
  */
  gid.gtk3.adjustment.Adjustment getHadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_text_view_get_hadjustment(cast(GtkTextView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
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
      Gets the value of the #GtkTextView:input-hints property.
      Returns: 
  */
  gid.gtk3.types.InputHints getInputHints() nothrow
  {
    GtkInputHints _cretval;
    _cretval = gtk_text_view_get_input_hints(cast(GtkTextView*)this._cPtr);
    gid.gtk3.types.InputHints _retval = cast(gid.gtk3.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the value of the #GtkTextView:input-purpose property.
      Returns: 
  */
  gid.gtk3.types.InputPurpose getInputPurpose() nothrow
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_text_view_get_input_purpose(cast(GtkTextView*)this._cPtr);
    gid.gtk3.types.InputPurpose _retval = cast(gid.gtk3.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Retrieves the iterator at buffer coordinates `x` and `y`. Buffer
      coordinates are coordinates for the entire buffer, not just the
      currently-displayed portion.  If you have coordinates from an
      event, you have to convert those to buffer coordinates with
      [gid.gtk4.text_view.TextView.windowToBufferCoords].
  
      Params:
        iter = a #GtkTextIter
        x = x position, in buffer coordinates
        y = y position, in buffer coordinates
      Returns: true if the position is over text
  */
  bool getIterAtLocation(out gid.gtk3.text_iter.TextIter iter, int x, int y) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_text_view_get_iter_at_location(cast(GtkTextView*)this._cPtr, _iter, x, y);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the iterator pointing to the character at buffer
      coordinates `x` and `y`. Buffer coordinates are coordinates for
      the entire buffer, not just the currently-displayed portion.
      If you have coordinates from an event, you have to convert
      those to buffer coordinates with
      [gid.gtk4.text_view.TextView.windowToBufferCoords].
      
      Note that this is different from [gid.gtk4.text_view.TextView.getIterAtLocation],
      which returns cursor locations, i.e. positions between
      characters.
  
      Params:
        iter = a #GtkTextIter
        trailing = if non-null, location to store an integer indicating where
             in the grapheme the user clicked. It will either be
             zero, or the number of characters in the grapheme.
             0 represents the trailing edge of the grapheme.
        x = x position, in buffer coordinates
        y = y position, in buffer coordinates
      Returns: true if the position is over text
  */
  bool getIterAtPosition(out gid.gtk3.text_iter.TextIter iter, out int trailing, int x, int y) nothrow
  {
    bool _retval;
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_text_view_get_iter_at_position(cast(GtkTextView*)this._cPtr, _iter, cast(int*)&trailing, x, y);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Gets a rectangle which roughly contains the character at iter.
      The rectangle position is in buffer coordinates; use
      [gid.gtk4.text_view.TextView.bufferToWindowCoords] to convert these
      coordinates to coordinates for one of the windows in the text view.
  
      Params:
        iter = a #GtkTextIter
        location = bounds of the character at iter
  */
  void getIterLocation(gid.gtk3.text_iter.TextIter iter, out gid.gdk3.rectangle.Rectangle location) nothrow
  {
    gtk_text_view_get_iter_location(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&location);
  }

  /**
      Gets the default justification of paragraphs in text_view.
      Tags in the buffer may override the default.
      Returns: default justification
  */
  gid.gtk3.types.Justification getJustification() nothrow
  {
    GtkJustification _cretval;
    _cretval = gtk_text_view_get_justification(cast(GtkTextView*)this._cPtr);
    gid.gtk3.types.Justification _retval = cast(gid.gtk3.types.Justification)_cretval;
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
      Gets the #GtkTextIter at the start of the line containing
      the coordinate `y`. `y` is in buffer coordinates, convert from
      window coordinates with [gid.gtk4.text_view.TextView.windowToBufferCoords].
      If non-null, line_top will be filled with the coordinate of the top
      edge of the line.
  
      Params:
        targetIter = a #GtkTextIter
        y = a y coordinate
        lineTop = return location for top coordinate of the line
  */
  void getLineAtY(out gid.gtk3.text_iter.TextIter targetIter, int y, out int lineTop) nothrow
  {
    auto _targetIter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    gtk_text_view_get_line_at_y(cast(GtkTextView*)this._cPtr, _targetIter, y, cast(int*)&lineTop);
    targetIter = new gid.gtk3.text_iter.TextIter(cast(void*)_targetIter, Yes.Take);
  }

  /**
      Gets the y coordinate of the top of the line containing iter,
      and the height of the line. The coordinate is a buffer coordinate;
      convert to window coordinates with [gid.gtk4.text_view.TextView.bufferToWindowCoords].
  
      Params:
        iter = a #GtkTextIter
        y = return location for a y coordinate
        height = return location for a height
  */
  void getLineYrange(gid.gtk3.text_iter.TextIter iter, out int y, out int height) nothrow
  {
    gtk_text_view_get_line_yrange(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(int*)&y, cast(int*)&height);
  }

  /**
      Gets the value of the #GtkTextView:monospace property.
      Returns: true if monospace fonts are desired
  */
  bool getMonospace() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_monospace(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the #GtkTextView is in overwrite mode or not.
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
      Gets the value set by [gid.gtk4.text_view.TextView.setPixelsBelowLines].
      
      The line space is the sum of the value returned by this function and the
      value returned by [gid.gtk4.text_view.TextView.getPixelsAboveLines].
      Returns: default number of blank pixels below paragraphs
  */
  int getPixelsBelowLines() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_pixels_below_lines(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk4.text_view.TextView.setPixelsInsideWrap].
      Returns: default number of pixels of blank space between wrapped lines
  */
  int getPixelsInsideWrap() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_pixels_inside_wrap(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default right margin for text in text_view. Tags
      in the buffer may override the default.
      Returns: right margin in pixels
  */
  int getRightMargin() nothrow
  {
    int _retval;
    _retval = gtk_text_view_get_right_margin(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default tabs for text_view. Tags in the buffer may
      override the defaults. The returned array will be null if
      “standard” (8-space) tabs are used. Free the return value
      with [gid.pango1.tab_array.TabArray.free].
      Returns: copy of default tab array, or null if
           “standard" tabs are used; must be freed with [gid.pango1.tab_array.TabArray.free].
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
      Gets the vertical-scrolling #GtkAdjustment.
      Returns: pointer to the vertical #GtkAdjustment
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.getVadjustment]
  */
  gid.gtk3.adjustment.Adjustment getVadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_text_view_get_vadjustment(cast(GtkTextView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fills visible_rect with the currently-visible
      region of the buffer, in buffer coordinates. Convert to window coordinates
      with [gid.gtk4.text_view.TextView.bufferToWindowCoords].
  
      Params:
        visibleRect = rectangle to fill
  */
  void getVisibleRect(out gid.gdk3.rectangle.Rectangle visibleRect) nothrow
  {
    gtk_text_view_get_visible_rect(cast(GtkTextView*)this._cPtr, cast(GdkRectangle*)&visibleRect);
  }

  alias getWindow = gid.gtk3.widget.Widget.getWindow;

  /**
      Retrieves the #GdkWindow corresponding to an area of the text view;
      possible windows include the overall widget window, child windows
      on the left, right, top, bottom, and the window that displays the
      text buffer. Windows are null and nonexistent if their width or
      height is 0, and are nonexistent before the widget has been
      realized.
  
      Params:
        win = window to get
      Returns: a #GdkWindow, or null
  */
  gid.gdk3.window.Window getWindow(gid.gtk3.types.TextWindowType win) nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_text_view_get_window(cast(GtkTextView*)this._cPtr, win);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Usually used to find out which window an event corresponds to.
      
      If you connect to an event signal on text_view, this function
      should be called on `event->window` to see which window it was.
  
      Params:
        window = a window type
      Returns: the window type.
  */
  gid.gtk3.types.TextWindowType getWindowType(gid.gdk3.window.Window window) nothrow
  {
    GtkTextWindowType _cretval;
    _cretval = gtk_text_view_get_window_type(cast(GtkTextView*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
    gid.gtk3.types.TextWindowType _retval = cast(gid.gtk3.types.TextWindowType)_cretval;
    return _retval;
  }

  /**
      Gets the line wrapping for the view.
      Returns: the line wrap setting
  */
  gid.gtk3.types.WrapMode getWrapMode() nothrow
  {
    GtkWrapMode _cretval;
    _cretval = gtk_text_view_get_wrap_mode(cast(GtkTextView*)this._cPtr);
    gid.gtk3.types.WrapMode _retval = cast(gid.gtk3.types.WrapMode)_cretval;
    return _retval;
  }

  /**
      Allow the #GtkTextView input method to internally handle key press
      and release events. If this function returns true, then no further
      processing should be done for this key event. See
      [gid.gtk4.imcontext.IMContext.filterKeypress].
      
      Note that you are expected to call this function from your handler
      when overriding key event handling. This is needed in the case when
      you need to insert your own key handling between the input method
      and the default key event handling of the #GtkTextView.
      
      ```c
      static gboolean
      gtk_foo_bar_key_press_event (GtkWidget   *widget,
                                   GdkEventKey *event)
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
  bool imContextFilterKeypress(gid.gdk3.event_key.EventKey event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_im_context_filter_keypress(cast(GtkTextView*)this._cPtr, event ? cast(GdkEventKey*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Updates the position of a child, as for [gid.gtk3.text_view.TextView.addChildInWindow].
  
      Params:
        child = child widget already added to the text view
        xpos = new X position in window coordinates
        ypos = new Y position in window coordinates
  */
  void moveChild(gid.gtk3.widget.Widget child, int xpos, int ypos) nothrow
  {
    gtk_text_view_move_child(cast(GtkTextView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, xpos, ypos);
  }

  /**
      Moves a mark within the buffer so that it's
      located within the currently-visible text area.
  
      Params:
        mark = a #GtkTextMark
      Returns: true if the mark moved (wasn’t already onscreen)
  */
  bool moveMarkOnscreen(gid.gtk3.text_mark.TextMark mark) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_move_mark_onscreen(cast(GtkTextView*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Move the iterator a given number of characters visually, treating
      it as the strong cursor position. If count is positive, then the
      new strong cursor position will be count positions to the right of
      the old cursor position. If count is negative then the new strong
      cursor position will be count positions to the left of the old
      cursor position.
      
      In the presence of bi-directional text, the correspondence
      between logical and visual order will depend on the direction
      of the current run, and there may be jumps when the cursor
      is moved off of the end of a run.
  
      Params:
        iter = a #GtkTextIter
        count = number of characters to move (negative moves left,
             positive moves right)
      Returns: true if iter moved and is not on the end iterator
  */
  bool moveVisually(gid.gtk3.text_iter.TextIter iter, int count) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_move_visually(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, count);
    return _retval;
  }

  /**
      Moves the cursor to the currently visible region of the
      buffer, it it isn’t there already.
      Returns: true if the cursor had to be moved.
  */
  bool placeCursorOnscreen() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_place_cursor_onscreen(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Ensures that the cursor is shown (i.e. not in an 'off' blink
      interval) and resets the time that it will stay blinking (or
      visible, in case blinking is disabled).
      
      This function should be called in response to user input
      (e.g. from derived classes that override the textview's
      #GtkWidget::key-press-event handler).
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
  void scrollMarkOnscreen(gid.gtk3.text_mark.TextMark mark) nothrow
  {
    gtk_text_view_scroll_mark_onscreen(cast(GtkTextView*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
  }

  /**
      Scrolls text_view so that iter is on the screen in the position
      indicated by xalign and yalign. An alignment of 0.0 indicates
      left or top, 1.0 indicates right or bottom, 0.5 means center.
      If use_align is false, the text scrolls the minimal distance to
      get the mark onscreen, possibly not scrolling at all. The effective
      screen for purposes of this function is reduced by a margin of size
      within_margin.
      
      Note that this function uses the currently-computed height of the
      lines in the text buffer. Line heights are computed in an idle
      handler; so this function may not have the desired effect if it’s
      called before the height computations. To avoid oddness, consider
      using [gid.gtk4.text_view.TextView.scrollToMark] which saves a point to be
      scrolled to after line validation.
  
      Params:
        iter = a #GtkTextIter
        withinMargin = margin as a [0.0,0.5) fraction of screen size
        useAlign = whether to use alignment arguments (if false,
             just get the mark onscreen)
        xalign = horizontal alignment of mark within visible area
        yalign = vertical alignment of mark within visible area
      Returns: true if scrolling occurred
  */
  bool scrollToIter(gid.gtk3.text_iter.TextIter iter, double withinMargin, bool useAlign, double xalign, double yalign) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_scroll_to_iter(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, withinMargin, useAlign, xalign, yalign);
    return _retval;
  }

  /**
      Scrolls text_view so that mark is on the screen in the position
      indicated by xalign and yalign. An alignment of 0.0 indicates
      left or top, 1.0 indicates right or bottom, 0.5 means center.
      If use_align is false, the text scrolls the minimal distance to
      get the mark onscreen, possibly not scrolling at all. The effective
      screen for purposes of this function is reduced by a margin of size
      within_margin.
  
      Params:
        mark = a #GtkTextMark
        withinMargin = margin as a [0.0,0.5) fraction of screen size
        useAlign = whether to use alignment arguments (if false, just
             get the mark onscreen)
        xalign = horizontal alignment of mark within visible area
        yalign = vertical alignment of mark within visible area
  */
  void scrollToMark(gid.gtk3.text_mark.TextMark mark, double withinMargin, bool useAlign, double xalign, double yalign) nothrow
  {
    gtk_text_view_scroll_to_mark(cast(GtkTextView*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null, withinMargin, useAlign, xalign, yalign);
  }

  /**
      Sets the behavior of the text widget when the Tab key is pressed.
      If accepts_tab is true, a tab character is inserted. If accepts_tab
      is false the keyboard focus is moved to the next widget in the focus
      chain.
  
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
      Sets the width of [gid.gtk4.types.TextWindowType.Left] or [gid.gtk4.types.TextWindowType.Right],
      or the height of [gid.gtk4.types.TextWindowType.Top] or [gid.gtk4.types.TextWindowType.Bottom].
      Automatically destroys the corresponding window if the size is set
      to 0, and creates the window if the size is set to non-zero.  This
      function can only be used for the “border windows”, and it won’t
      work with [gid.gtk4.types.TextWindowType.Widget], [gid.gtk4.types.TextWindowType.Text], or
      [gid.gtk3.types.TextWindowType.Private].
  
      Params:
        type = window to affect
        size = width or height of the window
  */
  void setBorderWindowSize(gid.gtk3.types.TextWindowType type, int size) nothrow
  {
    gtk_text_view_set_border_window_size(cast(GtkTextView*)this._cPtr, type, size);
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
      Sets buffer as the buffer being displayed by text_view. The previous
      buffer displayed by the text view is unreferenced, and a reference is
      added to buffer. If you owned a reference to buffer before passing it
      to this function, you must remove that reference yourself; #GtkTextView
      will not “adopt” it.
  
      Params:
        buffer = a #GtkTextBuffer
  */
  void setBuffer(gid.gtk3.text_buffer.TextBuffer buffer = null) nothrow
  {
    gtk_text_view_set_buffer(cast(GtkTextView*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Toggles whether the insertion point should be displayed. A buffer with
      no editable text probably shouldn’t have a visible cursor, so you may
      want to turn the cursor off.
      
      Note that this property may be overridden by the
      #GtkSettings:gtk-keynave-use-caret settings.
  
      Params:
        setting = whether to show the insertion cursor
  */
  void setCursorVisible(bool setting) nothrow
  {
    gtk_text_view_set_cursor_visible(cast(GtkTextView*)this._cPtr, setting);
  }

  /**
      Sets the default editability of the #GtkTextView. You can override
      this default setting with tags in the buffer, using the “editable”
      attribute of tags.
  
      Params:
        setting = whether it’s editable
  */
  void setEditable(bool setting) nothrow
  {
    gtk_text_view_set_editable(cast(GtkTextView*)this._cPtr, setting);
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
      Sets the #GtkTextView:input-hints property, which
      allows input methods to fine-tune their behaviour.
  
      Params:
        hints = the hints
  */
  void setInputHints(gid.gtk3.types.InputHints hints) nothrow
  {
    gtk_text_view_set_input_hints(cast(GtkTextView*)this._cPtr, hints);
  }

  /**
      Sets the #GtkTextView:input-purpose property which
      can be used by on-screen keyboards and other input
      methods to adjust their behaviour.
  
      Params:
        purpose = the purpose
  */
  void setInputPurpose(gid.gtk3.types.InputPurpose purpose) nothrow
  {
    gtk_text_view_set_input_purpose(cast(GtkTextView*)this._cPtr, purpose);
  }

  /**
      Sets the default justification of text in text_view.
      Tags in the view’s buffer may override the default.
  
      Params:
        justification = justification
  */
  void setJustification(gid.gtk3.types.Justification justification) nothrow
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
      Sets the #GtkTextView:monospace property, which
      indicates that the text view should use monospace
      fonts.
  
      Params:
        monospace = true to request monospace styling
  */
  void setMonospace(bool monospace) nothrow
  {
    gtk_text_view_set_monospace(cast(GtkTextView*)this._cPtr, monospace);
  }

  /**
      Changes the #GtkTextView overwrite mode.
  
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
      to put below paragraphs in text_view. May be overridden
      by tags applied to text_view’s buffer.
  
      Params:
        pixelsBelowLines = pixels below paragraphs
  */
  void setPixelsBelowLines(int pixelsBelowLines) nothrow
  {
    gtk_text_view_set_pixels_below_lines(cast(GtkTextView*)this._cPtr, pixelsBelowLines);
  }

  /**
      Sets the default number of pixels of blank space to leave between
      display/wrapped lines within a paragraph. May be overridden by
      tags in text_view’s buffer.
  
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
        tabs = tabs as a #PangoTabArray
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
        wrapMode = a #GtkWrapMode
  */
  void setWrapMode(gid.gtk3.types.WrapMode wrapMode) nothrow
  {
    gtk_text_view_set_wrap_mode(cast(GtkTextView*)this._cPtr, wrapMode);
  }

  /**
      Determines whether iter is at the start of a display line.
      See [gid.gtk4.text_view.TextView.forwardDisplayLine] for an explanation of
      display lines vs. paragraphs.
  
      Params:
        iter = a #GtkTextIter
      Returns: true if iter begins a wrapped line
  */
  bool startsDisplayLine(gid.gtk3.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_starts_display_line(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts coordinates on the window identified by win to buffer
      coordinates, storing the result in (buffer_x,buffer_y).
      
      Note that you can’t convert coordinates for a nonexisting window (see
      [gid.gtk3.text_view.TextView.setBorderWindowSize]).
  
      Params:
        win = a #GtkTextWindowType except [gid.gtk3.types.TextWindowType.Private]
        windowX = window x coordinate
        windowY = window y coordinate
        bufferX = buffer x coordinate return location or null
        bufferY = buffer y coordinate return location or null
  */
  void windowToBufferCoords(gid.gtk3.types.TextWindowType win, int windowX, int windowY, out int bufferX, out int bufferY) nothrow
  {
    gtk_text_view_window_to_buffer_coords(cast(GtkTextView*)this._cPtr, win, windowX, windowY, cast(int*)&bufferX, cast(int*)&bufferY);
  }

  /**
      Connect to `Backspace` signal.
  
      The ::backspace signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user asks for it.
        
        The default bindings for this signal are
        Backspace and Shift-Backspace.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectBackspace(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.backspace");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("backspace", closure, after);
  }

  /**
      Connect to `CopyClipboard` signal.
  
      The ::copy-clipboard signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to copy the selection to the clipboard.
        
        The default bindings for this signal are
        Ctrl-c and Ctrl-Insert.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.copyClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
      Connect to `CutClipboard` signal.
  
      The ::cut-clipboard signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to cut the selection to the clipboard.
        
        The default bindings for this signal are
        Ctrl-x and Shift-Delete.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCutClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.cutClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cut-clipboard", closure, after);
  }

  /**
      Connect to `DeleteFromCursor` signal.
  
      The ::delete-from-cursor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates a text deletion.
        
        If the type is [gid.gtk4.types.DeleteType.Chars], GTK+ deletes the selection
        if there is one, otherwise it deletes the requested number
        of characters.
        
        The default bindings for this signal are
        Delete for deleting a character, Ctrl-Delete for
        deleting a word and Ctrl-Backspace for deleting a word
        backwords.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.DeleteType type, int count, gid.gtk3.text_view.TextView textView)`
  
          `type` the granularity of the deletion, as a #GtkDeleteType (optional)
  
          `count` the number of type units to delete (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeleteFromCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.DeleteType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.deleteFromCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-from-cursor", closure, after);
  }

  /**
      Connect to `ExtendSelection` signal.
  
      The ::extend-selection signal is emitted when the selection needs to be
        extended at location.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.types.TextExtendSelection granularity, gid.gtk3.text_iter.TextIter location, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtk3.text_view.TextView textView)`
  
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
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.TextExtendSelection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.extendSelection");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extend-selection", closure, after);
  }

  /**
      Connect to `InsertAtCursor` signal.
  
      The ::insert-at-cursor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates the insertion of a
        fixed string at the cursor.
        
        This signal has no default bindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string string_, gid.gtk3.text_view.TextView textView)`
  
          `string_` the string to insert (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertAtCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.insertAtCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-at-cursor", closure, after);
  }

  /**
      Connect to `InsertEmoji` signal.
  
      The ::insert-emoji signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to present the Emoji chooser for the text_view.
        
        The default bindings for this signal are Ctrl-. and Ctrl-;
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertEmoji(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.insertEmoji");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-emoji", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      The ::move-cursor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates a cursor movement.
        If the cursor is not visible in text_view, this signal causes
        the viewport to be moved instead.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control the cursor
        programmatically.
        
        The default bindings for this signal come in two variants,
        the variant with the Shift modifier extends the selection,
        the variant without the Shift modifer does not.
        There are too many key combinations to list them all here.
        - Arrow keys move by individual characters/lines
        - Ctrl-arrow key combinations move by words/paragraphs
        - Home/End keys move to the ends of the buffer
        - PageUp/PageDown keys move vertically by pages
        - Ctrl-PageUp/PageDown keys move horizontally by pages
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.MovementStep step, int count, bool extendSelection, gid.gtk3.text_view.TextView textView)`
  
          `step` the granularity of the move, as a #GtkMovementStep (optional)
  
          `count` the number of step units to move (optional)
  
          `extendSelection` true if the move should extend the selection (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.moveCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `MoveViewport` signal.
  
      The ::move-viewport signal is a
        [keybinding signal][GtkBindingSignal]
        which can be bound to key combinations to allow the user
        to move the viewport, i.e. change what part of the text view
        is visible in a containing scrolled window.
        
        There are no default bindings for this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.ScrollStep step, int count, gid.gtk3.text_view.TextView textView)`
  
          `step` the granularity of the movement, as a #GtkScrollStep (optional)
  
          `count` the number of step units to move (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveViewport(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.ScrollStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.moveViewport");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-viewport", closure, after);
  }

  /**
      Connect to `PasteClipboard` signal.
  
      The ::paste-clipboard signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to paste the contents of the clipboard
        into the text view.
        
        The default bindings for this signal are
        Ctrl-v and Shift-Insert.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.pasteClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paste-clipboard", closure, after);
  }

  /**
      Connect to `PopulatePopup` signal.
  
      The ::populate-popup signal gets emitted before showing the
        context menu of the text view.
        
        If you need to add items to the context menu, connect
        to this signal and append your items to the popup, which
        will be a #GtkMenu in this case.
        
        If #GtkTextView:populate-all is true, this signal will
        also be emitted to populate touch popups. In this case,
        popup will be a different container, e.g. a #GtkToolbar.
        
        The signal handler should not make assumptions about the
        type of widget, but check whether popup is a #GtkMenu
        or #GtkToolbar or another kind of container.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget popup, gid.gtk3.text_view.TextView textView)`
  
          `popup` the container that is being populated (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopulatePopup(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.populatePopup");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("populate-popup", closure, after);
  }

  /**
      Connect to `PreeditChanged` signal.
  
      If an input method is used, the typed text will not immediately
        be committed to the buffer. So if you are interested in the text,
        connect to this signal.
        
        This signal is only emitted if the text at the given position
        is actually editable.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string preedit, gid.gtk3.text_view.TextView textView)`
  
          `preedit` the current preedit string (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.preeditChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-changed", closure, after);
  }

  /**
      Connect to `SelectAll` signal.
  
      The ::select-all signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to select or unselect the complete
        contents of the text view.
        
        The default bindings for this signal are Ctrl-a and Ctrl-/
        for selecting and Shift-Ctrl-a and Ctrl-\ for unselecting.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(bool select, gid.gtk3.text_view.TextView textView)`
  
          `select` true to select, false to unselect (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectAll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.selectAll");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      Connect to `SetAnchor` signal.
  
      The ::set-anchor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates setting the "anchor"
        mark. The "anchor" mark gets placed at the same position as the
        "insert" mark.
        
        This signal has no default bindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSetAnchor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.setAnchor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("set-anchor", closure, after);
  }

  /**
      Connect to `ToggleCursorVisible` signal.
  
      The ::toggle-cursor-visible signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to toggle the #GtkTextView:cursor-visible
        property.
        
        The default binding for this signal is F7.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleCursorVisible(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.toggleCursorVisible");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-visible", closure, after);
  }

  /**
      Connect to `ToggleOverwrite` signal.
  
      The ::toggle-overwrite signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to toggle the overwrite mode of the text view.
        
        The default bindings for this signal is Insert.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_view.TextView textView)`
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleOverwrite(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_view.TextView)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.toggleOverwrite");
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
    static assert(is(T : gid.gtk3.text_view.TextView), T.stringof ~ " is not derived from gid.gtk3.text_view.TextView");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBackspace", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "backspace");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCopyClipboard", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "copy_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCutClipboard", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "cut_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeleteFromCursor", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "delete_from_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawLayer", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "draw_layer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncExtendSelection", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "extend_selection");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertAtCursor", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "insert_at_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertEmoji", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "insert_emoji");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveCursor", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "move_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPasteClipboard", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "paste_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPopulatePopup", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "populate_popup");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetAnchor", true)[0]) == gid.gtk3.text_view.TextView))
      _installVfunc(klass, "set_anchor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggleOverwrite", true)[0]) == gid.gtk3.text_view.TextView))
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
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncBackspace");
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
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncCopyClipboard");
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
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncCutClipboard");
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
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncDeleteFromCursor");
          }
        }

        _klass.deleteFromCursor = cast(typeof(_klass.deleteFromCursor))&_vfuncDeleteFromCursorTramp;
        break;
      }
      case "draw_layer":
      {
        static extern(C) void _vfuncDrawLayerTramp(GtkTextView* textView, GtkTextViewLayer layer, cairo_t* cr) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.drawLayer)
              return (cast(typeof(&_vfuncDrawLayerTramp))_klass.drawLayer)(textView, layer, cr);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncDrawLayer(layer, _cr);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncDrawLayer");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.drawLayer = cast(typeof(_klass.drawLayer))&_vfuncDrawLayerTramp;
        break;
      }
      case "extend_selection":
      {
        static extern(C) gboolean _vfuncExtendSelectionTramp(GtkTextView* textView, GtkTextExtendSelection granularity, const(GtkTextIter)* location, GtkTextIter* start, GtkTextIter* end) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.extendSelection)
              return (cast(typeof(&_vfuncExtendSelectionTramp))_klass.extendSelection)(textView, granularity, location, start, end);
            return typeof(return).init;
          }

          bool _dretval;
          auto _start = start ? new gid.gtk3.text_iter.TextIter(cast(void*)start, Yes.Take)._cBorrow : null;
          auto _end = end ? new gid.gtk3.text_iter.TextIter(cast(void*)end, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncExtendSelection(granularity, location ? new gid.gtk3.text_iter.TextIter(cast(void*)location, No.Take) : null, _start, _end);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncExtendSelection");
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
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncInsertAtCursor");
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
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncInsertEmoji");
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
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncMoveCursor");
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
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncPasteClipboard");
          }
        }

        _klass.pasteClipboard = cast(typeof(_klass.pasteClipboard))&_vfuncPasteClipboardTramp;
        break;
      }
      case "populate_popup":
      {
        static extern(C) void _vfuncPopulatePopupTramp(GtkTextView* textView, GtkWidget* popup) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
          if (!_obj)
          {
            auto _klass = cast(GtkTextViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)textView);
            if (_klass.populatePopup)
              return (cast(typeof(&_vfuncPopulatePopupTramp))_klass.populatePopup)(textView, popup);
            return;
          }

          try
          {
            _obj.vfuncPopulatePopup(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)popup, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncPopulatePopup");
          }
        }

        _klass.populatePopup = cast(typeof(_klass.populatePopup))&_vfuncPopulatePopupTramp;
        break;
      }
      case "set_anchor":
      {
        static extern(C) void _vfuncSetAnchorTramp(GtkTextView* textView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncSetAnchor");
          }
        }

        _klass.setAnchor = cast(typeof(_klass.setAnchor))&_vfuncSetAnchorTramp;
        break;
      }
      case "toggle_overwrite":
      {
        static extern(C) void _vfuncToggleOverwriteTramp(GtkTextView* textView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_view.TextView)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)textView);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_view.TextView.vfuncToggleOverwrite");
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

/// Fluent builder implementation template for [gid.gtk3.text_view.TextView]
class TextViewGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T, gid.gtk3.scrollable.ScrollableGidBuilderImpl!T
{

  mixin ScrollableGidBuilderT!();

  /** */
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
          
          Don't confuse this property with #GtkWidget:margin-bottom.
      Returns: Builder instance for fluent chaining
  */
  T bottomMargin(int propval) nothrow
  {
    return setProperty("bottom-margin", propval);
  }

  /** */
  T buffer(gid.gtk3.text_buffer.TextBuffer propval) nothrow
  {
    return setProperty("buffer", propval);
  }

  /** */
  T cursorVisible(bool propval) nothrow
  {
    return setProperty("cursor-visible", propval);
  }

  /** */
  T editable(bool propval) nothrow
  {
    return setProperty("editable", propval);
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which IM (input method) module should be used for this text_view.
          See #GtkIMContext.
          
          Setting this to a non-null value overrides the
          system-wide IM module setting. See the GtkSettings
          #GtkSettings:gtk-im-module property.
      Returns: Builder instance for fluent chaining
  */
  T imModule(string propval) nothrow
  {
    return setProperty("im-module", propval);
  }

  /** */
  T indent(int propval) nothrow
  {
    return setProperty("indent", propval);
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints (beyond #GtkTextView:input-purpose) that
          allow input methods to fine-tune their behaviour.
      Returns: Builder instance for fluent chaining
  */
  T inputHints(gid.gtk3.types.InputHints propval) nothrow
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
  T inputPurpose(gid.gtk3.types.InputPurpose propval) nothrow
  {
    return setProperty("input-purpose", propval);
  }

  /** */
  T justification(gid.gtk3.types.Justification propval) nothrow
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
          
          Don't confuse this property with #GtkWidget:margin-left.
      Returns: Builder instance for fluent chaining
  */
  T leftMargin(int propval) nothrow
  {
    return setProperty("left-margin", propval);
  }

  /** */
  T monospace(bool propval) nothrow
  {
    return setProperty("monospace", propval);
  }

  /** */
  T overwrite(bool propval) nothrow
  {
    return setProperty("overwrite", propval);
  }

  /** */
  T pixelsAboveLines(int propval) nothrow
  {
    return setProperty("pixels-above-lines", propval);
  }

  /** */
  T pixelsBelowLines(int propval) nothrow
  {
    return setProperty("pixels-below-lines", propval);
  }

  /** */
  T pixelsInsideWrap(int propval) nothrow
  {
    return setProperty("pixels-inside-wrap", propval);
  }

  /**
      Set `populateAll` property.
      Params:
        propval = If :populate-all is true, the #GtkTextView::populate-popup
          signal is also emitted for touch popups.
      Returns: Builder instance for fluent chaining
  */
  T populateAll(bool propval) nothrow
  {
    return setProperty("populate-all", propval);
  }

  /**
      Set `rightMargin` property.
      Params:
        propval = The default right margin for text in the text view.
          Tags in the buffer may override the default.
          
          Note that this property is confusingly named. In CSS terms,
          the value set here is padding, and it is applied in addition
          to the padding from the theme.
          
          Don't confuse this property with #GtkWidget:margin-right.
      Returns: Builder instance for fluent chaining
  */
  T rightMargin(int propval) nothrow
  {
    return setProperty("right-margin", propval);
  }

  /** */
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
          
          Don't confuse this property with #GtkWidget:margin-top.
      Returns: Builder instance for fluent chaining
  */
  T topMargin(int propval) nothrow
  {
    return setProperty("top-margin", propval);
  }

  /** */
  T wrapMode(gid.gtk3.types.WrapMode propval) nothrow
  {
    return setProperty("wrap-mode", propval);
  }
}

/// Fluent builder for [gid.gtk3.text_view.TextView]
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
