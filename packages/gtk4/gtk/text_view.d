/// Module for [TextView] class
module gtk.text_view;

import gdk.event;
import gdk.rectangle;
import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_text;
import gtk.accessible_text_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.text_buffer;
import gtk.text_child_anchor;
import gtk.text_iter;
import gtk.text_mark;
import gtk.types;
import gtk.widget;
import pango.context;
import pango.tab_array;

/**
    A widget that displays the contents of a [gtk.text_buffer.TextBuffer].
    
    ![An example GtkTextview](multiline-text.png)
    
    You may wish to begin by reading the [conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types related to the
    text widget and how they work together.
    
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
    
    [gtk.text_view.TextView] has a main css node with name textview and style class .view,
    and subnodes for each of the border windows, and the main text area,
    with names border and text, respectively. The border nodes each get
    one of the style classes .left, .right, .top or .bottom.
    
    A node representing the selection will appear below the text node.
    
    If a context menu is opened, the window node will appear as a subnode
    of the main node.
    
    ## Accessibility
    
    [gtk.text_view.TextView] uses the [gtk.types.AccessibleRole.TextBox] role.
*/
class TextView : gtk.widget.Widget, gtk.accessible_text.AccessibleText, gtk.scrollable.Scrollable
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
    return cast(void function())gtk_text_view_get_type != &gidSymbolNotFound ? gtk_text_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextView self()
  {
    return this;
  }

  /**
      Get `acceptsTab` property.
      Returns: Whether Tab will result in a tab character being entered.
  */
  @property bool acceptsTab()
  {
    return getAcceptsTab();
  }

  /**
      Set `acceptsTab` property.
      Params:
        propval = Whether Tab will result in a tab character being entered.
  */
  @property void acceptsTab(bool propval)
  {
    return setAcceptsTab(propval);
  }

  /**
      Get `bottomMargin` property.
      Returns: The bottom margin for text in the text view.
        
        Note that this property is confusingly named. In CSS terms,
        the value set here is padding, and it is applied in addition
        to the padding from the theme.
        
        Don't confuse this property with `property@Gtk.Widget:margin-bottom`.
  */
  @property int bottomMargin()
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
          
          Don't confuse this property with `property@Gtk.Widget:margin-bottom`.
  */
  @property void bottomMargin(int propval)
  {
    return setBottomMargin(propval);
  }

  /**
      Get `buffer` property.
      Returns: The buffer which is displayed.
  */
  @property gtk.text_buffer.TextBuffer buffer()
  {
    return getBuffer();
  }

  /**
      Set `buffer` property.
      Params:
        propval = The buffer which is displayed.
  */
  @property void buffer(gtk.text_buffer.TextBuffer propval)
  {
    return setBuffer(propval);
  }

  /**
      Get `cursorVisible` property.
      Returns: If the insertion cursor is shown.
  */
  @property bool cursorVisible()
  {
    return getCursorVisible();
  }

  /**
      Set `cursorVisible` property.
      Params:
        propval = If the insertion cursor is shown.
  */
  @property void cursorVisible(bool propval)
  {
    return setCursorVisible(propval);
  }

  /** */
  @property bool editable()
  {
    return getEditable();
  }

  /** */
  @property void editable(bool propval)
  {
    return setEditable(propval);
  }

  /**
      Get `extraMenu` property.
      Returns: A menu model whose contents will be appended to the context menu.
  */
  @property gio.menu_model.MenuModel extraMenu()
  {
    return getExtraMenu();
  }

  /**
      Set `extraMenu` property.
      Params:
        propval = A menu model whose contents will be appended to the context menu.
  */
  @property void extraMenu(gio.menu_model.MenuModel propval)
  {
    return setExtraMenu(propval);
  }

  /**
      Get `imModule` property.
      Returns: Which IM (input method) module should be used for this text_view.
        
        See [gtk.immulticontext.IMMulticontext].
        
        Setting this to a non-null value overrides the system-wide IM module
        setting. See the GtkSettings `property@Gtk.Settings:gtk-im-module` property.
  */
  @property string imModule()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("im-module");
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which IM (input method) module should be used for this text_view.
          
          See [gtk.immulticontext.IMMulticontext].
          
          Setting this to a non-null value overrides the system-wide IM module
          setting. See the GtkSettings `property@Gtk.Settings:gtk-im-module` property.
  */
  @property void imModule(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("im-module", propval);
  }

  /**
      Get `indent` property.
      Returns: Amount to indent the paragraph, in pixels.
        
        A negative value of indent will produce a hanging indentation.
        That is, the first line will have the full width, and subsequent
        lines will be indented by the absolute value of indent.
  */
  @property int indent()
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
  @property void indent(int propval)
  {
    return setIndent(propval);
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints (beyond `property@Gtk.TextView:input-purpose`)
        that allow input methods to fine-tune their behaviour.
  */
  @property gtk.types.InputHints inputHints()
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints (beyond `property@Gtk.TextView:input-purpose`)
          that allow input methods to fine-tune their behaviour.
  */
  @property void inputHints(gtk.types.InputHints propval)
  {
    return setInputHints(propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The purpose of this text field.
        
        This property can be used by on-screen keyboards and other input
        methods to adjust their behaviour.
  */
  @property gtk.types.InputPurpose inputPurpose()
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
  @property void inputPurpose(gtk.types.InputPurpose propval)
  {
    return setInputPurpose(propval);
  }

  /** */
  @property gtk.types.Justification justification()
  {
    return getJustification();
  }

  /** */
  @property void justification(gtk.types.Justification propval)
  {
    return setJustification(propval);
  }

  /**
      Get `leftMargin` property.
      Returns: The default left margin for text in the text view.
        
        Tags in the buffer may override the default.
        
        Note that this property is confusingly named. In CSS terms,
        the value set here is padding, and it is applied in addition
        to the padding from the theme.
  */
  @property int leftMargin()
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
  @property void leftMargin(int propval)
  {
    return setLeftMargin(propval);
  }

  /**
      Get `monospace` property.
      Returns: Whether text should be displayed in a monospace font.
        
        If true, set the .monospace style class on the
        text view to indicate that a monospace font is desired.
  */
  @property bool monospace()
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
  @property void monospace(bool propval)
  {
    return setMonospace(propval);
  }

  /**
      Get `overwrite` property.
      Returns: Whether entered text overwrites existing contents.
  */
  @property bool overwrite()
  {
    return getOverwrite();
  }

  /**
      Set `overwrite` property.
      Params:
        propval = Whether entered text overwrites existing contents.
  */
  @property void overwrite(bool propval)
  {
    return setOverwrite(propval);
  }

  /** */
  @property int pixelsAboveLines()
  {
    return getPixelsAboveLines();
  }

  /** */
  @property void pixelsAboveLines(int propval)
  {
    return setPixelsAboveLines(propval);
  }

  /** */
  @property int pixelsBelowLines()
  {
    return getPixelsBelowLines();
  }

  /** */
  @property void pixelsBelowLines(int propval)
  {
    return setPixelsBelowLines(propval);
  }

  /** */
  @property int pixelsInsideWrap()
  {
    return getPixelsInsideWrap();
  }

  /** */
  @property void pixelsInsideWrap(int propval)
  {
    return setPixelsInsideWrap(propval);
  }

  /**
      Get `rightMargin` property.
      Returns: The default right margin for text in the text view.
        
        Tags in the buffer may override the default.
        
        Note that this property is confusingly named. In CSS terms,
        the value set here is padding, and it is applied in addition
        to the padding from the theme.
  */
  @property int rightMargin()
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
  @property void rightMargin(int propval)
  {
    return setRightMargin(propval);
  }

  /** */
  @property pango.tab_array.TabArray tabs()
  {
    return getTabs();
  }

  /** */
  @property void tabs(pango.tab_array.TabArray propval)
  {
    return setTabs(propval);
  }

  /**
      Get `topMargin` property.
      Returns: The top margin for text in the text view.
        
        Note that this property is confusingly named. In CSS terms,
        the value set here is padding, and it is applied in addition
        to the padding from the theme.
        
        Don't confuse this property with `property@Gtk.Widget:margin-top`.
  */
  @property int topMargin()
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
          
          Don't confuse this property with `property@Gtk.Widget:margin-top`.
  */
  @property void topMargin(int propval)
  {
    return setTopMargin(propval);
  }

  /** */
  @property gtk.types.WrapMode wrapMode()
  {
    return getWrapMode();
  }

  /** */
  @property void wrapMode(gtk.types.WrapMode propval)
  {
    return setWrapMode(propval);
  }

  mixin AccessibleTextT!();
  mixin ScrollableT!();

  /**
      Creates a new [gtk.text_view.TextView].
      
      If you don’t call [gtk.text_view.TextView.setBuffer] before using the
      text view, an empty default buffer will be created for you. Get the
      buffer with [gtk.text_view.TextView.getBuffer]. If you want to specify
      your own buffer, consider [gtk.text_view.TextView.newWithBuffer].
      Returns: a new [gtk.text_view.TextView]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_view_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.text_view.TextView] widget displaying the buffer buffer.
      
      One buffer can be shared among many widgets. buffer may be null
      to create a default buffer, in which case this function is equivalent
      to [gtk.text_view.TextView.new_]. The text view adds its own reference count
      to the buffer; it does not take over an existing reference.
  
      Params:
        buffer = a [gtk.text_buffer.TextBuffer]
      Returns: a new [gtk.text_view.TextView].
  */
  static gtk.text_view.TextView newWithBuffer(gtk.text_buffer.TextBuffer buffer)
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_view_new_with_buffer(buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_view.TextView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a child widget in the text buffer, at the given anchor.
  
      Params:
        child = a [gtk.widget.Widget]
        anchor = a [gtk.text_child_anchor.TextChildAnchor] in the [gtk.text_buffer.TextBuffer] for text_view
  */
  void addChildAtAnchor(gtk.widget.Widget child, gtk.text_child_anchor.TextChildAnchor anchor)
  {
    gtk_text_view_add_child_at_anchor(cast(GtkTextView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
  }

  /**
      Adds child at a fixed coordinate in the [gtk.text_view.TextView]'s text window.
      
      The xpos and ypos must be in buffer coordinates (see
      [gtk.text_view.TextView.getIterLocation] to convert to
      buffer coordinates).
      
      child will scroll with the text view.
      
      If instead you want a widget that will not move with the
      [gtk.text_view.TextView] contents see [gtk.overlay.Overlay].
  
      Params:
        child = a [gtk.widget.Widget]
        xpos = X position of child in window coordinates
        ypos = Y position of child in window coordinates
  */
  void addOverlay(gtk.widget.Widget child, int xpos, int ypos)
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
      views, since they depend on the contents of the [gtk.text_buffer.TextBuffer].
  
      Params:
        iter = a [gtk.text_iter.TextIter]
      Returns: true if iter was moved and is not on the end iterator
  */
  bool backwardDisplayLine(gtk.text_iter.TextIter iter)
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
      views, since they depend on the contents of the [gtk.text_buffer.TextBuffer].
  
      Params:
        iter = a [gtk.text_iter.TextIter]
      Returns: true if iter was moved and is not on the end iterator
  */
  bool backwardDisplayLineStart(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_backward_display_line_start(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts buffer coordinates to window coordinates.
  
      Params:
        win = a [gtk.types.TextWindowType]
        bufferX = buffer x coordinate
        bufferY = buffer y coordinate
        windowX = window x coordinate return location
        windowY = window y coordinate return location
  */
  void bufferToWindowCoords(gtk.types.TextWindowType win, int bufferX, int bufferY, out int windowX, out int windowY)
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
      views, since they depend on the contents of the [gtk.text_buffer.TextBuffer].
  
      Params:
        iter = a [gtk.text_iter.TextIter]
      Returns: true if iter was moved and is not on the end iterator
  */
  bool forwardDisplayLine(gtk.text_iter.TextIter iter)
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
      views, since they depend on the contents of the [gtk.text_buffer.TextBuffer].
  
      Params:
        iter = a [gtk.text_iter.TextIter]
      Returns: true if iter was moved and is not on the end iterator
  */
  bool forwardDisplayLineEnd(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_forward_display_line_end(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns whether pressing the <kbd>Tab</kbd> key inserts a tab characters.
      
      See [gtk.text_view.TextView.setAcceptsTab].
      Returns: true if pressing the Tab key inserts a tab character,
          false if pressing the Tab key moves the keyboard focus.
  */
  bool getAcceptsTab()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_accepts_tab(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the bottom margin for text in the text_view.
      Returns: bottom margin in pixels
  */
  int getBottomMargin()
  {
    int _retval;
    _retval = gtk_text_view_get_bottom_margin(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the [gtk.text_buffer.TextBuffer] being displayed by this text view.
      
      The reference count on the buffer is not incremented; the caller
      of this function won’t own a new reference.
      Returns: a [gtk.text_buffer.TextBuffer]
  */
  gtk.text_buffer.TextBuffer getBuffer()
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_text_view_get_buffer(cast(GtkTextView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_buffer.TextBuffer)(cast(GtkTextBuffer*)_cretval, No.Take);
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
      [gtk.text_view.TextView.bufferToWindowCoords] to convert these
      coordinates to coordinates for one of the windows in the text view.
  
      Params:
        iter = a [gtk.text_iter.TextIter]
        strong = location to store the strong cursor position
        weak = location to store the weak cursor position
  */
  void getCursorLocations(gtk.text_iter.TextIter iter, out gdk.rectangle.Rectangle strong, out gdk.rectangle.Rectangle weak)
  {
    gtk_text_view_get_cursor_locations(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&strong, cast(GdkRectangle*)&weak);
  }

  /**
      Find out whether the cursor should be displayed.
      Returns: whether the insertion mark is visible
  */
  bool getCursorVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_cursor_visible(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the default editability of the [gtk.text_view.TextView].
      
      Tags in the buffer may override this setting for some ranges of text.
      Returns: whether text is editable by default
  */
  bool getEditable()
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
  gio.menu_model.MenuModel getExtraMenu()
  {
    GMenuModel* _cretval;
    _cretval = gtk_text_view_get_extra_menu(cast(GtkTextView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a [gtk.widget.Widget] that has previously been set as gutter.
      
      See [gtk.text_view.TextView.setGutter].
      
      win must be one of [gtk.types.TextWindowType.Left], [gtk.types.TextWindowType.Right],
      [gtk.types.TextWindowType.Top], or [gtk.types.TextWindowType.Bottom].
  
      Params:
        win = a [gtk.types.TextWindowType]
      Returns: a [gtk.widget.Widget]
  */
  gtk.widget.Widget getGutter(gtk.types.TextWindowType win)
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_view_get_gutter(cast(GtkTextView*)this._cPtr, win);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the default indentation of paragraphs in text_view.
      
      Tags in the view’s buffer may override the default.
      The indentation may be negative.
      Returns: number of pixels of indentation
  */
  int getIndent()
  {
    int _retval;
    _retval = gtk_text_view_get_indent(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `input-hints` of the [gtk.text_view.TextView].
      Returns: 
  */
  gtk.types.InputHints getInputHints()
  {
    GtkInputHints _cretval;
    _cretval = gtk_text_view_get_input_hints(cast(GtkTextView*)this._cPtr);
    gtk.types.InputHints _retval = cast(gtk.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the `input-purpose` of the [gtk.text_view.TextView].
      Returns: 
  */
  gtk.types.InputPurpose getInputPurpose()
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_text_view_get_input_purpose(cast(GtkTextView*)this._cPtr);
    gtk.types.InputPurpose _retval = cast(gtk.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Retrieves the iterator at buffer coordinates `x` and `y`.
      
      Buffer coordinates are coordinates for the entire buffer, not just
      the currently-displayed portion. If you have coordinates from an
      event, you have to convert those to buffer coordinates with
      [gtk.text_view.TextView.windowToBufferCoords].
  
      Params:
        iter = a [gtk.text_iter.TextIter]
        x = x position, in buffer coordinates
        y = y position, in buffer coordinates
      Returns: true if the position is over text
  */
  bool getIterAtLocation(out gtk.text_iter.TextIter iter, int x, int y)
  {
    bool _retval;
    GtkTextIter _iter;
    _retval = cast(bool)gtk_text_view_get_iter_at_location(cast(GtkTextView*)this._cPtr, &_iter, x, y);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Retrieves the iterator pointing to the character at buffer
      coordinates `x` and `y`.
      
      Buffer coordinates are coordinates for the entire buffer, not just
      the currently-displayed portion. If you have coordinates from an event,
      you have to convert those to buffer coordinates with
      [gtk.text_view.TextView.windowToBufferCoords].
      
      Note that this is different from [gtk.text_view.TextView.getIterAtLocation],
      which returns cursor locations, i.e. positions between characters.
  
      Params:
        iter = a [gtk.text_iter.TextIter]
        trailing = if non-null, location to store
             an integer indicating where in the grapheme the user clicked.
             It will either be zero, or the number of characters in the grapheme.
             0 represents the trailing edge of the grapheme.
        x = x position, in buffer coordinates
        y = y position, in buffer coordinates
      Returns: true if the position is over text
  */
  bool getIterAtPosition(out gtk.text_iter.TextIter iter, out int trailing, int x, int y)
  {
    bool _retval;
    GtkTextIter _iter;
    _retval = cast(bool)gtk_text_view_get_iter_at_position(cast(GtkTextView*)this._cPtr, &_iter, cast(int*)&trailing, x, y);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Gets a rectangle which roughly contains the character at iter.
      
      The rectangle position is in buffer coordinates; use
      [gtk.text_view.TextView.bufferToWindowCoords] to convert these
      coordinates to coordinates for one of the windows in the text view.
  
      Params:
        iter = a [gtk.text_iter.TextIter]
        location = bounds of the character at iter
  */
  void getIterLocation(gtk.text_iter.TextIter iter, out gdk.rectangle.Rectangle location)
  {
    gtk_text_view_get_iter_location(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&location);
  }

  /**
      Gets the default justification of paragraphs in text_view.
      
      Tags in the buffer may override the default.
      Returns: default justification
  */
  gtk.types.Justification getJustification()
  {
    GtkJustification _cretval;
    _cretval = gtk_text_view_get_justification(cast(GtkTextView*)this._cPtr);
    gtk.types.Justification _retval = cast(gtk.types.Justification)_cretval;
    return _retval;
  }

  /**
      Gets the default left margin size of paragraphs in the text_view.
      
      Tags in the buffer may override the default.
      Returns: left margin in pixels
  */
  int getLeftMargin()
  {
    int _retval;
    _retval = gtk_text_view_get_left_margin(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gtk.text_iter.TextIter] at the start of the line containing
      the coordinate `y`.
      
      `y` is in buffer coordinates, convert from window coordinates with
      [gtk.text_view.TextView.windowToBufferCoords]. If non-null,
      line_top will be filled with the coordinate of the top edge
      of the line.
  
      Params:
        targetIter = a [gtk.text_iter.TextIter]
        y = a y coordinate
        lineTop = return location for top coordinate of the line
  */
  void getLineAtY(out gtk.text_iter.TextIter targetIter, int y, out int lineTop)
  {
    GtkTextIter _targetIter;
    gtk_text_view_get_line_at_y(cast(GtkTextView*)this._cPtr, &_targetIter, y, cast(int*)&lineTop);
    targetIter = new gtk.text_iter.TextIter(cast(void*)&_targetIter, No.Take);
  }

  /**
      Gets the y coordinate of the top of the line containing iter,
      and the height of the line.
      
      The coordinate is a buffer coordinate; convert to window
      coordinates with [gtk.text_view.TextView.bufferToWindowCoords].
  
      Params:
        iter = a [gtk.text_iter.TextIter]
        y = return location for a y coordinate
        height = return location for a height
  */
  void getLineYrange(gtk.text_iter.TextIter iter, out int y, out int height)
  {
    gtk_text_view_get_line_yrange(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(int*)&y, cast(int*)&height);
  }

  /**
      Gets the [pango.context.Context] that is used for rendering LTR directed
      text layouts.
      
      The context may be replaced when CSS changes occur.
      Returns: a [pango.context.Context]
  */
  pango.context.Context getLtrContext()
  {
    PangoContext* _cretval;
    _cretval = gtk_text_view_get_ltr_context(cast(GtkTextView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the [gtk.text_view.TextView] uses monospace styling.
      Returns: true if monospace fonts are desired
  */
  bool getMonospace()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_monospace(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the [gtk.text_view.TextView] is in overwrite mode or not.
      Returns: whether text_view is in overwrite mode or not.
  */
  bool getOverwrite()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_overwrite(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default number of pixels to put above paragraphs.
      
      Adding this function with [gtk.text_view.TextView.getPixelsBelowLines]
      is equal to the line space between each paragraph.
      Returns: default number of pixels above paragraphs
  */
  int getPixelsAboveLines()
  {
    int _retval;
    _retval = gtk_text_view_get_pixels_above_lines(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default number of pixels to put below paragraphs.
      
      The line space is the sum of the value returned by this function and
      the value returned by [gtk.text_view.TextView.getPixelsAboveLines].
      Returns: default number of blank pixels below paragraphs
  */
  int getPixelsBelowLines()
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
  int getPixelsInsideWrap()
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
  int getRightMargin()
  {
    int _retval;
    _retval = gtk_text_view_get_right_margin(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [pango.context.Context] that is used for rendering RTL directed
      text layouts.
      
      The context may be replaced when CSS changes occur.
      Returns: a [pango.context.Context]
  */
  pango.context.Context getRtlContext()
  {
    PangoContext* _cretval;
    _cretval = gtk_text_view_get_rtl_context(cast(GtkTextView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the default tabs for text_view.
      
      Tags in the buffer may override the defaults. The returned array
      will be null if “standard” (8-space) tabs are used. Free the
      return value with [pango.tab_array.TabArray.free].
      Returns: copy of default tab array,
          or null if standard tabs are used; must be freed with
          [pango.tab_array.TabArray.free].
  */
  pango.tab_array.TabArray getTabs()
  {
    PangoTabArray* _cretval;
    _cretval = gtk_text_view_get_tabs(cast(GtkTextView*)this._cPtr);
    auto _retval = _cretval ? new pango.tab_array.TabArray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the top margin for text in the text_view.
      Returns: top margin in pixels
  */
  int getTopMargin()
  {
    int _retval;
    _retval = gtk_text_view_get_top_margin(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Fills visible_rect with the currently-visible
      region of the buffer, in buffer coordinates.
      
      Convert to window coordinates with
      [gtk.text_view.TextView.bufferToWindowCoords].
  
      Params:
        visibleRect = rectangle to fill
  */
  void getVisibleRect(out gdk.rectangle.Rectangle visibleRect)
  {
    gtk_text_view_get_visible_rect(cast(GtkTextView*)this._cPtr, cast(GdkRectangle*)&visibleRect);
  }

  /**
      Gets the line wrapping for the view.
      Returns: the line wrap setting
  */
  gtk.types.WrapMode getWrapMode()
  {
    GtkWrapMode _cretval;
    _cretval = gtk_text_view_get_wrap_mode(cast(GtkTextView*)this._cPtr);
    gtk.types.WrapMode _retval = cast(gtk.types.WrapMode)_cretval;
    return _retval;
  }

  /**
      Allow the [gtk.text_view.TextView] input method to internally handle key press
      and release events.
      
      If this function returns true, then no further processing should be
      done for this key event. See [gtk.imcontext.IMContext.filterKeypress].
      
      Note that you are expected to call this function from your handler
      when overriding key event handling. This is needed in the case when
      you need to insert your own key handling between the input method
      and the default key event handling of the [gtk.text_view.TextView].
      
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
  bool imContextFilterKeypress(gdk.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_im_context_filter_keypress(cast(GtkTextView*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves a mark within the buffer so that it's
      located within the currently-visible text area.
  
      Params:
        mark = a [gtk.text_mark.TextMark]
      Returns: true if the mark moved (wasn’t already onscreen)
  */
  bool moveMarkOnscreen(gtk.text_mark.TextMark mark)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_move_mark_onscreen(cast(GtkTextView*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Updates the position of a child.
      
      See [gtk.text_view.TextView.addOverlay].
  
      Params:
        child = a widget already added with [gtk.text_view.TextView.addOverlay]
        xpos = new X position in buffer coordinates
        ypos = new Y position in buffer coordinates
  */
  void moveOverlay(gtk.widget.Widget child, int xpos, int ypos)
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
        iter = a [gtk.text_iter.TextIter]
        count = number of characters to move (negative moves left,
             positive moves right)
      Returns: true if iter moved and is not on the end iterator
  */
  bool moveVisually(gtk.text_iter.TextIter iter, int count)
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
  bool placeCursorOnscreen()
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
  void remove(gtk.widget.Widget child)
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
  void resetCursorBlink()
  {
    gtk_text_view_reset_cursor_blink(cast(GtkTextView*)this._cPtr);
  }

  /**
      Reset the input method context of the text view if needed.
      
      This can be necessary in the case where modifying the buffer
      would confuse on-going input method behavior.
  */
  void resetImContext()
  {
    gtk_text_view_reset_im_context(cast(GtkTextView*)this._cPtr);
  }

  /**
      Scrolls text_view the minimum distance such that mark is contained
      within the visible area of the widget.
  
      Params:
        mark = a mark in the buffer for text_view
  */
  void scrollMarkOnscreen(gtk.text_mark.TextMark mark)
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
      using [gtk.text_view.TextView.scrollToMark] which saves a point to be
      scrolled to after line validation.
  
      Params:
        iter = a [gtk.text_iter.TextIter]
        withinMargin = margin as a [0.0,0.5) fraction of screen size
        useAlign = whether to use alignment arguments (if false,
             just get the mark onscreen)
        xalign = horizontal alignment of mark within visible area
        yalign = vertical alignment of mark within visible area
      Returns: true if scrolling occurred
  */
  bool scrollToIter(gtk.text_iter.TextIter iter, double withinMargin, bool useAlign, double xalign, double yalign)
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
        mark = a [gtk.text_mark.TextMark]
        withinMargin = margin as a [0.0,0.5) fraction of screen size
        useAlign = whether to use alignment arguments (if false, just
             get the mark onscreen)
        xalign = horizontal alignment of mark within visible area
        yalign = vertical alignment of mark within visible area
  */
  void scrollToMark(gtk.text_mark.TextMark mark, double withinMargin, bool useAlign, double xalign, double yalign)
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
  void setAcceptsTab(bool acceptsTab)
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
  void setBottomMargin(int bottomMargin)
  {
    gtk_text_view_set_bottom_margin(cast(GtkTextView*)this._cPtr, bottomMargin);
  }

  /**
      Sets buffer as the buffer being displayed by text_view.
      
      The previous buffer displayed by the text view is unreferenced, and
      a reference is added to buffer. If you owned a reference to buffer
      before passing it to this function, you must remove that reference
      yourself; [gtk.text_view.TextView] will not “adopt” it.
  
      Params:
        buffer = a [gtk.text_buffer.TextBuffer]
  */
  void setBuffer(gtk.text_buffer.TextBuffer buffer = null)
  {
    gtk_text_view_set_buffer(cast(GtkTextView*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Toggles whether the insertion point should be displayed.
      
      A buffer with no editable text probably shouldn’t have a visible
      cursor, so you may want to turn the cursor off.
      
      Note that this property may be overridden by the
      `propertyGtk.Settings:gtk-keynav-use-caret` setting.
  
      Params:
        setting = whether to show the insertion cursor
  */
  void setCursorVisible(bool setting)
  {
    gtk_text_view_set_cursor_visible(cast(GtkTextView*)this._cPtr, setting);
  }

  /**
      Sets the default editability of the [gtk.text_view.TextView].
      
      You can override this default setting with tags in the buffer,
      using the “editable” attribute of tags.
  
      Params:
        setting = whether it’s editable
  */
  void setEditable(bool setting)
  {
    gtk_text_view_set_editable(cast(GtkTextView*)this._cPtr, setting);
  }

  /**
      Sets a menu model to add when constructing the context
      menu for text_view.
      
      You can pass null to remove a previously set extra menu.
  
      Params:
        model = a [gio.menu_model.MenuModel]
  */
  void setExtraMenu(gio.menu_model.MenuModel model = null)
  {
    gtk_text_view_set_extra_menu(cast(GtkTextView*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }

  /**
      Places widget into the gutter specified by win.
      
      win must be one of [gtk.types.TextWindowType.Left], [gtk.types.TextWindowType.Right],
      [gtk.types.TextWindowType.Top], or [gtk.types.TextWindowType.Bottom].
  
      Params:
        win = a [gtk.types.TextWindowType]
        widget = a [gtk.widget.Widget]
  */
  void setGutter(gtk.types.TextWindowType win, gtk.widget.Widget widget = null)
  {
    gtk_text_view_set_gutter(cast(GtkTextView*)this._cPtr, win, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the default indentation for paragraphs in text_view.
      
      Tags in the buffer may override the default.
  
      Params:
        indent = indentation in pixels
  */
  void setIndent(int indent)
  {
    gtk_text_view_set_indent(cast(GtkTextView*)this._cPtr, indent);
  }

  /**
      Sets the `input-hints` of the [gtk.text_view.TextView].
      
      The `input-hints` allow input methods to fine-tune
      their behaviour.
  
      Params:
        hints = the hints
  */
  void setInputHints(gtk.types.InputHints hints)
  {
    gtk_text_view_set_input_hints(cast(GtkTextView*)this._cPtr, hints);
  }

  /**
      Sets the `input-purpose` of the [gtk.text_view.TextView].
      
      The `input-purpose` can be used by on-screen keyboards
      and other input methods to adjust their behaviour.
  
      Params:
        purpose = the purpose
  */
  void setInputPurpose(gtk.types.InputPurpose purpose)
  {
    gtk_text_view_set_input_purpose(cast(GtkTextView*)this._cPtr, purpose);
  }

  /**
      Sets the default justification of text in text_view.
      
      Tags in the view’s buffer may override the default.
  
      Params:
        justification = justification
  */
  void setJustification(gtk.types.Justification justification)
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
  void setLeftMargin(int leftMargin)
  {
    gtk_text_view_set_left_margin(cast(GtkTextView*)this._cPtr, leftMargin);
  }

  /**
      Sets whether the [gtk.text_view.TextView] should display text in
      monospace styling.
  
      Params:
        monospace = true to request monospace styling
  */
  void setMonospace(bool monospace)
  {
    gtk_text_view_set_monospace(cast(GtkTextView*)this._cPtr, monospace);
  }

  /**
      Changes the [gtk.text_view.TextView] overwrite mode.
  
      Params:
        overwrite = true to turn on overwrite mode, false to turn it off
  */
  void setOverwrite(bool overwrite)
  {
    gtk_text_view_set_overwrite(cast(GtkTextView*)this._cPtr, overwrite);
  }

  /**
      Sets the default number of blank pixels above paragraphs in text_view.
      
      Tags in the buffer for text_view may override the defaults.
  
      Params:
        pixelsAboveLines = pixels above paragraphs
  */
  void setPixelsAboveLines(int pixelsAboveLines)
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
  void setPixelsBelowLines(int pixelsBelowLines)
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
  void setPixelsInsideWrap(int pixelsInsideWrap)
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
  void setRightMargin(int rightMargin)
  {
    gtk_text_view_set_right_margin(cast(GtkTextView*)this._cPtr, rightMargin);
  }

  /**
      Sets the default tab stops for paragraphs in text_view.
      
      Tags in the buffer may override the default.
  
      Params:
        tabs = tabs as a [pango.tab_array.TabArray]
  */
  void setTabs(pango.tab_array.TabArray tabs)
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
  void setTopMargin(int topMargin)
  {
    gtk_text_view_set_top_margin(cast(GtkTextView*)this._cPtr, topMargin);
  }

  /**
      Sets the line wrapping for the view.
  
      Params:
        wrapMode = a [gtk.types.WrapMode]
  */
  void setWrapMode(gtk.types.WrapMode wrapMode)
  {
    gtk_text_view_set_wrap_mode(cast(GtkTextView*)this._cPtr, wrapMode);
  }

  /**
      Determines whether iter is at the start of a display line.
      
      See [gtk.text_view.TextView.forwardDisplayLine] for an
      explanation of display lines vs. paragraphs.
  
      Params:
        iter = a [gtk.text_iter.TextIter]
      Returns: true if iter begins a wrapped line
  */
  bool startsDisplayLine(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_starts_display_line(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts coordinates on the window identified by win to buffer
      coordinates.
  
      Params:
        win = a [gtk.types.TextWindowType]
        windowX = window x coordinate
        windowY = window y coordinate
        bufferX = buffer x coordinate return location
        bufferY = buffer y coordinate return location
  */
  void windowToBufferCoords(gtk.types.TextWindowType win, int windowX, int windowY, out int bufferX, out int bufferY)
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
  
          $(D void callback(gtk.text_view.TextView textView))
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBackspace(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_view.TextView)))
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
  
          $(D void callback(gtk.text_view.TextView textView))
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_view.TextView)))
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
  
          $(D void callback(gtk.text_view.TextView textView))
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCutClipboard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_view.TextView)))
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
    return connectSignalClosure("cut-clipboard", closure, after);
  }

  /**
      Connect to `DeleteFromCursor` signal.
  
      Gets emitted when the user initiates a text deletion.
        
        The ::delete-from-cursor signal is a [keybinding signal](class.SignalAction.html).
        
        If the type is [gtk.types.DeleteType.Chars], GTK deletes the selection
        if there is one, otherwise it deletes the requested number
        of characters.
        
        The default bindings for this signal are <kbd>Delete</kbd> for
        deleting a character, <kbd>Ctrl</kbd>+<kbd>Delete</kbd> for
        deleting a word and <kbd>Ctrl</kbd>+<kbd>Backspace</kbd> for
        deleting a word backwards.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.DeleteType type, int count, gtk.text_view.TextView textView))
  
          `type` the granularity of the deletion, as a [gtk.types.DeleteType] (optional)
  
          `count` the number of type units to delete (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeleteFromCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DeleteType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.text_view.TextView)))
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
    return connectSignalClosure("delete-from-cursor", closure, after);
  }

  /**
      Connect to `ExtendSelection` signal.
  
      Emitted when the selection needs to be extended at location.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.TextExtendSelection granularity, gtk.text_iter.TextIter location, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtk.text_view.TextView textView))
  
          `granularity` the granularity type (optional)
  
          `location` the location where to extend the selection (optional)
  
          `start` where the selection should start (optional)
  
          `end` where the selection should end (optional)
  
          `textView` the instance the signal is connected to (optional)
  
          `Returns` [gdk.types.EVENT_STOP] to stop other handlers from being invoked for the
              event. [gdk.types.EVENT_PROPAGATE] to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectExtendSelection(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.TextExtendSelection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.text_view.TextView)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(string string_, gtk.text_view.TextView textView))
  
          `string_` the string to insert (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertAtCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text_view.TextView)))
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
  
          $(D void callback(gtk.text_view.TextView textView))
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertEmoji(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_view.TextView)))
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
    return connectSignalClosure("insert-emoji", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      Gets emitted when the user initiates a cursor movement.
        
        The ::move-cursor signal is a [keybinding signal](class.SignalAction.html).
        If the cursor is not visible in text_view, this signal causes
        the viewport to be moved instead.
        
        Applications should not connect to it, but may emit it with
        [gobject.global.signalEmitByName] if they need to control the cursor
        programmatically.
        
        
        The default bindings for this signal come in two variants,
        the variant with the <kbd>Shift</kbd> modifier extends the
        selection, the variant without it does not.
        There are too many key combinations to list them all here.
        
        $(LIST
          * <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd>
            move by individual characters/lines
          * <kbd>Ctrl</kbd>+<kbd>←</kbd>, etc. move by words/paragraphs
          * <kbd>Home</kbd> and <kbd>End</kbd> move to the ends of the buffer
          * <kbd>PgUp</kbd> and <kbd>PgDn</kbd> move vertically by pages
          * <kbd>Ctrl</kbd>+<kbd>PgUp</kbd> and <kbd>Ctrl</kbd>+<kbd>PgDn</kbd>
            move horizontally by pages
        )
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.MovementStep step, int count, bool extendSelection, gtk.text_view.TextView textView))
  
          `step` the granularity of the move, as a [gtk.types.MovementStep] (optional)
  
          `count` the number of step units to move (optional)
  
          `extendSelection` true if the move should extend the selection (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.text_view.TextView)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.types.ScrollStep step, int count, gtk.text_view.TextView textView))
  
          `step` the granularity of the movement, as a [gtk.types.ScrollStep] (optional)
  
          `count` the number of step units to move (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveViewport(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.ScrollStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.text_view.TextView)))
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
  
          $(D void callback(gtk.text_view.TextView textView))
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_view.TextView)))
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
  
          $(D void callback(string preedit, gtk.text_view.TextView textView))
  
          `preedit` the current preedit string (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text_view.TextView)))
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
  
          $(D void callback(bool select, gtk.text_view.TextView textView))
  
          `select` true to select, false to unselect (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectAll(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text_view.TextView)))
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
  
          $(D void callback(gtk.text_view.TextView textView))
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSetAnchor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_view.TextView)))
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
  
          $(D void callback(gtk.text_view.TextView textView))
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggleCursorVisible(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_view.TextView)))
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
    return connectSignalClosure("toggle-cursor-visible", closure, after);
  }

  /**
      Connect to `ToggleOverwrite` signal.
  
      Gets emitted to toggle the overwrite mode of the text view.
        
        The ::toggle-overwrite signal is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>Insert</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_view.TextView textView))
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggleOverwrite(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_view.TextView)))
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
    return connectSignalClosure("toggle-overwrite", closure, after);
  }
}
