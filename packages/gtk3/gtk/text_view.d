/// Module for [TextView] class
module gtk.text_view;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.event_key;
import gdk.rectangle;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.text_attributes;
import gtk.text_buffer;
import gtk.text_child_anchor;
import gtk.text_iter;
import gtk.text_mark;
import gtk.types;
import gtk.widget;
import pango.tab_array;

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
class TextView : gtk.container.Container, gtk.scrollable.Scrollable
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

  /** */
  @property bool acceptsTab()
  {
    return getAcceptsTab();
  }

  /** */
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
        
        Don't confuse this property with #GtkWidget:margin-bottom.
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
          
          Don't confuse this property with #GtkWidget:margin-bottom.
  */
  @property void bottomMargin(int propval)
  {
    return setBottomMargin(propval);
  }

  /** */
  @property gtk.text_buffer.TextBuffer buffer()
  {
    return getBuffer();
  }

  /** */
  @property void buffer(gtk.text_buffer.TextBuffer propval)
  {
    return setBuffer(propval);
  }

  /** */
  @property bool cursorVisible()
  {
    return getCursorVisible();
  }

  /** */
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
      Get `imModule` property.
      Returns: Which IM (input method) module should be used for this text_view.
        See #GtkIMContext.
        
        Setting this to a non-null value overrides the
        system-wide IM module setting. See the GtkSettings
        #GtkSettings:gtk-im-module property.
  */
  @property string imModule()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("im-module");
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
  @property void imModule(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("im-module", propval);
  }

  /** */
  @property int indent()
  {
    return getIndent();
  }

  /** */
  @property void indent(int propval)
  {
    return setIndent(propval);
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints (beyond #GtkTextView:input-purpose) that
        allow input methods to fine-tune their behaviour.
  */
  @property gtk.types.InputHints inputHints()
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints (beyond #GtkTextView:input-purpose) that
          allow input methods to fine-tune their behaviour.
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
        
        Don't confuse this property with #GtkWidget:margin-left.
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
          
          Don't confuse this property with #GtkWidget:margin-left.
  */
  @property void leftMargin(int propval)
  {
    return setLeftMargin(propval);
  }

  /** */
  @property bool monospace()
  {
    return getMonospace();
  }

  /** */
  @property void monospace(bool propval)
  {
    return setMonospace(propval);
  }

  /** */
  @property bool overwrite()
  {
    return getOverwrite();
  }

  /** */
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
      Get `populateAll` property.
      Returns: If :populate-all is true, the #GtkTextView::populate-popup
        signal is also emitted for touch popups.
  */
  @property bool populateAll()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("populate-all");
  }

  /**
      Set `populateAll` property.
      Params:
        propval = If :populate-all is true, the #GtkTextView::populate-popup
          signal is also emitted for touch popups.
  */
  @property void populateAll(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("populate-all", propval);
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
          
          Don't confuse this property with #GtkWidget:margin-right.
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
        
        Don't confuse this property with #GtkWidget:margin-top.
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
          
          Don't confuse this property with #GtkWidget:margin-top.
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

  mixin ScrollableT!();

  /**
      Creates a new #GtkTextView. If you don’t call [gtk.text_view.TextView.setBuffer]
      before using the text view, an empty default buffer will be created
      for you. Get the buffer with [gtk.text_view.TextView.getBuffer]. If you want
      to specify your own buffer, consider [gtk.text_view.TextView.newWithBuffer].
      Returns: a new #GtkTextView
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_view_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkTextView widget displaying the buffer
      buffer. One buffer can be shared among many widgets.
      buffer may be null to create a default buffer, in which case
      this function is equivalent to [gtk.text_view.TextView.new_]. The
      text view adds its own reference count to the buffer; it does not
      take over an existing reference.
  
      Params:
        buffer = a #GtkTextBuffer
      Returns: a new #GtkTextView.
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
        child = a #GtkWidget
        anchor = a #GtkTextChildAnchor in the #GtkTextBuffer for text_view
  */
  void addChildAtAnchor(gtk.widget.Widget child, gtk.text_child_anchor.TextChildAnchor anchor)
  {
    gtk_text_view_add_child_at_anchor(cast(GtkTextView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
  }

  /**
      Adds a child at fixed coordinates in one of the text widget's
      windows.
      
      The window must have nonzero size (see
      [gtk.text_view.TextView.setBorderWindowSize]). Note that the child
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
  void addChildInWindow(gtk.widget.Widget child, gtk.types.TextWindowType whichWindow, int xpos, int ypos)
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
      views, since they depend on the contents of the #GtkTextBuffer.
  
      Params:
        iter = a #GtkTextIter
      Returns: true if iter was moved and is not on the end iterator
  */
  bool backwardDisplayLineStart(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_backward_display_line_start(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts coordinate (buffer_x, buffer_y) to coordinates for the window
      win, and stores the result in (window_x, window_y).
      
      Note that you can’t convert coordinates for a nonexisting window (see
      [gtk.text_view.TextView.setBorderWindowSize]).
  
      Params:
        win = a #GtkTextWindowType, except [gtk.types.TextWindowType.Private]
        bufferX = buffer x coordinate
        bufferY = buffer y coordinate
        windowX = window x coordinate return location or null
        windowY = window y coordinate return location or null
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
      views, since they depend on the contents of the #GtkTextBuffer.
  
      Params:
        iter = a #GtkTextIter
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
      views, since they depend on the contents of the #GtkTextBuffer.
  
      Params:
        iter = a #GtkTextIter
      Returns: true if iter was moved and is not on the end iterator
  */
  bool forwardDisplayLineEnd(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_forward_display_line_end(cast(GtkTextView*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns whether pressing the Tab key inserts a tab characters.
      [gtk.text_view.TextView.setAcceptsTab].
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
      Gets the width of the specified border window. See
      [gtk.text_view.TextView.setBorderWindowSize].
  
      Params:
        type = window to return size from
      Returns: width of window
  */
  int getBorderWindowSize(gtk.types.TextWindowType type)
  {
    int _retval;
    _retval = gtk_text_view_get_border_window_size(cast(GtkTextView*)this._cPtr, type);
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
      Returns the #GtkTextBuffer being displayed by this text view.
      The reference count on the buffer is not incremented; the caller
      of this function won’t own a new reference.
      Returns: a #GtkTextBuffer
  */
  gtk.text_buffer.TextBuffer getBuffer()
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_text_view_get_buffer(cast(GtkTextView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_buffer.TextBuffer)(cast(GtkTextBuffer*)_cretval, No.Take);
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
      [gtk.text_view.TextView.bufferToWindowCoords] to convert these
      coordinates to coordinates for one of the windows in the text view.
  
      Params:
        iter = a #GtkTextIter
        strong = location to store the strong
              cursor position (may be null)
        weak = location to store the weak
              cursor position (may be null)
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
      Obtains a copy of the default text attributes. These are the
      attributes used for text unless a tag overrides them.
      You’d typically pass the default attributes in to
      [gtk.text_iter.TextIter.getAttributes] in order to get the
      attributes in effect at a given text position.
      
      The return value is a copy owned by the caller of this function,
      and should be freed with [gtk.text_attributes.TextAttributes.unref].
      Returns: a new #GtkTextAttributes
  */
  gtk.text_attributes.TextAttributes getDefaultAttributes()
  {
    GtkTextAttributes* _cretval;
    _cretval = gtk_text_view_get_default_attributes(cast(GtkTextView*)this._cPtr);
    auto _retval = _cretval ? new gtk.text_attributes.TextAttributes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the default editability of the #GtkTextView. Tags in the
      buffer may override this setting for some ranges of text.
      Returns: whether text is editable by default
  */
  bool getEditable()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_editable(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the horizontal-scrolling #GtkAdjustment.
      Returns: pointer to the horizontal #GtkAdjustment
  
      Deprecated: Use [gtk.scrollable.Scrollable.getHadjustment]
  */
  gtk.adjustment.Adjustment getHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_text_view_get_hadjustment(cast(GtkTextView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
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
      Gets the value of the #GtkTextView:input-hints property.
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
      Gets the value of the #GtkTextView:input-purpose property.
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
      Retrieves the iterator at buffer coordinates `x` and `y`. Buffer
      coordinates are coordinates for the entire buffer, not just the
      currently-displayed portion.  If you have coordinates from an
      event, you have to convert those to buffer coordinates with
      [gtk.text_view.TextView.windowToBufferCoords].
  
      Params:
        iter = a #GtkTextIter
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
      coordinates `x` and `y`. Buffer coordinates are coordinates for
      the entire buffer, not just the currently-displayed portion.
      If you have coordinates from an event, you have to convert
      those to buffer coordinates with
      [gtk.text_view.TextView.windowToBufferCoords].
      
      Note that this is different from [gtk.text_view.TextView.getIterAtLocation],
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
        iter = a #GtkTextIter
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
      Gets the #GtkTextIter at the start of the line containing
      the coordinate `y`. `y` is in buffer coordinates, convert from
      window coordinates with [gtk.text_view.TextView.windowToBufferCoords].
      If non-null, line_top will be filled with the coordinate of the top
      edge of the line.
  
      Params:
        targetIter = a #GtkTextIter
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
      and the height of the line. The coordinate is a buffer coordinate;
      convert to window coordinates with [gtk.text_view.TextView.bufferToWindowCoords].
  
      Params:
        iter = a #GtkTextIter
        y = return location for a y coordinate
        height = return location for a height
  */
  void getLineYrange(gtk.text_iter.TextIter iter, out int y, out int height)
  {
    gtk_text_view_get_line_yrange(cast(GtkTextView*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(int*)&y, cast(int*)&height);
  }

  /**
      Gets the value of the #GtkTextView:monospace property.
      Returns: true if monospace fonts are desired
  */
  bool getMonospace()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_get_monospace(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the #GtkTextView is in overwrite mode or not.
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
      Gets the value set by [gtk.text_view.TextView.setPixelsBelowLines].
      
      The line space is the sum of the value returned by this function and the
      value returned by [gtk.text_view.TextView.getPixelsAboveLines].
      Returns: default number of blank pixels below paragraphs
  */
  int getPixelsBelowLines()
  {
    int _retval;
    _retval = gtk_text_view_get_pixels_below_lines(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.text_view.TextView.setPixelsInsideWrap].
      Returns: default number of pixels of blank space between wrapped lines
  */
  int getPixelsInsideWrap()
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
  int getRightMargin()
  {
    int _retval;
    _retval = gtk_text_view_get_right_margin(cast(GtkTextView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default tabs for text_view. Tags in the buffer may
      override the defaults. The returned array will be null if
      “standard” (8-space) tabs are used. Free the return value
      with [pango.tab_array.TabArray.free].
      Returns: copy of default tab array, or null if
           “standard" tabs are used; must be freed with [pango.tab_array.TabArray.free].
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
      Gets the vertical-scrolling #GtkAdjustment.
      Returns: pointer to the vertical #GtkAdjustment
  
      Deprecated: Use [gtk.scrollable.Scrollable.getVadjustment]
  */
  gtk.adjustment.Adjustment getVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_text_view_get_vadjustment(cast(GtkTextView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fills visible_rect with the currently-visible
      region of the buffer, in buffer coordinates. Convert to window coordinates
      with [gtk.text_view.TextView.bufferToWindowCoords].
  
      Params:
        visibleRect = rectangle to fill
  */
  void getVisibleRect(out gdk.rectangle.Rectangle visibleRect)
  {
    gtk_text_view_get_visible_rect(cast(GtkTextView*)this._cPtr, cast(GdkRectangle*)&visibleRect);
  }

  alias getWindow = gtk.widget.Widget.getWindow;

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
  gdk.window.Window getWindow(gtk.types.TextWindowType win)
  {
    GdkWindow* _cretval;
    _cretval = gtk_text_view_get_window(cast(GtkTextView*)this._cPtr, win);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
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
  gtk.types.TextWindowType getWindowType(gdk.window.Window window)
  {
    GtkTextWindowType _cretval;
    _cretval = gtk_text_view_get_window_type(cast(GtkTextView*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
    gtk.types.TextWindowType _retval = cast(gtk.types.TextWindowType)_cretval;
    return _retval;
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
      Allow the #GtkTextView input method to internally handle key press
      and release events. If this function returns true, then no further
      processing should be done for this key event. See
      [gtk.imcontext.IMContext.filterKeypress].
      
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
  bool imContextFilterKeypress(gdk.event_key.EventKey event)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_view_im_context_filter_keypress(cast(GtkTextView*)this._cPtr, event ? cast(GdkEventKey*)event._cPtr : null);
    return _retval;
  }

  /**
      Updates the position of a child, as for [gtk.text_view.TextView.addChildInWindow].
  
      Params:
        child = child widget already added to the text view
        xpos = new X position in window coordinates
        ypos = new Y position in window coordinates
  */
  void moveChild(gtk.widget.Widget child, int xpos, int ypos)
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
  bool moveMarkOnscreen(gtk.text_mark.TextMark mark)
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
  bool moveVisually(gtk.text_iter.TextIter iter, int count)
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
  bool placeCursorOnscreen()
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
      using [gtk.text_view.TextView.scrollToMark] which saves a point to be
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
  bool scrollToIter(gtk.text_iter.TextIter iter, double withinMargin, bool useAlign, double xalign, double yalign)
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
  void scrollToMark(gtk.text_mark.TextMark mark, double withinMargin, bool useAlign, double xalign, double yalign)
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
  void setAcceptsTab(bool acceptsTab)
  {
    gtk_text_view_set_accepts_tab(cast(GtkTextView*)this._cPtr, acceptsTab);
  }

  /**
      Sets the width of [gtk.types.TextWindowType.Left] or [gtk.types.TextWindowType.Right],
      or the height of [gtk.types.TextWindowType.Top] or [gtk.types.TextWindowType.Bottom].
      Automatically destroys the corresponding window if the size is set
      to 0, and creates the window if the size is set to non-zero.  This
      function can only be used for the “border windows”, and it won’t
      work with [gtk.types.TextWindowType.Widget], [gtk.types.TextWindowType.Text], or
      [gtk.types.TextWindowType.Private].
  
      Params:
        type = window to affect
        size = width or height of the window
  */
  void setBorderWindowSize(gtk.types.TextWindowType type, int size)
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
  void setBottomMargin(int bottomMargin)
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
  void setBuffer(gtk.text_buffer.TextBuffer buffer = null)
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
  void setCursorVisible(bool setting)
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
  void setEditable(bool setting)
  {
    gtk_text_view_set_editable(cast(GtkTextView*)this._cPtr, setting);
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
      Sets the #GtkTextView:input-hints property, which
      allows input methods to fine-tune their behaviour.
  
      Params:
        hints = the hints
  */
  void setInputHints(gtk.types.InputHints hints)
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
      Sets the #GtkTextView:monospace property, which
      indicates that the text view should use monospace
      fonts.
  
      Params:
        monospace = true to request monospace styling
  */
  void setMonospace(bool monospace)
  {
    gtk_text_view_set_monospace(cast(GtkTextView*)this._cPtr, monospace);
  }

  /**
      Changes the #GtkTextView overwrite mode.
  
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
      to put below paragraphs in text_view. May be overridden
      by tags applied to text_view’s buffer.
  
      Params:
        pixelsBelowLines = pixels below paragraphs
  */
  void setPixelsBelowLines(int pixelsBelowLines)
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
        tabs = tabs as a #PangoTabArray
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
        wrapMode = a #GtkWrapMode
  */
  void setWrapMode(gtk.types.WrapMode wrapMode)
  {
    gtk_text_view_set_wrap_mode(cast(GtkTextView*)this._cPtr, wrapMode);
  }

  /**
      Determines whether iter is at the start of a display line.
      See [gtk.text_view.TextView.forwardDisplayLine] for an explanation of
      display lines vs. paragraphs.
  
      Params:
        iter = a #GtkTextIter
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
      coordinates, storing the result in (buffer_x,buffer_y).
      
      Note that you can’t convert coordinates for a nonexisting window (see
      [gtk.text_view.TextView.setBorderWindowSize]).
  
      Params:
        win = a #GtkTextWindowType except [gtk.types.TextWindowType.Private]
        windowX = window x coordinate
        windowY = window y coordinate
        bufferX = buffer x coordinate return location or null
        bufferY = buffer y coordinate return location or null
  */
  void windowToBufferCoords(gtk.types.TextWindowType win, int windowX, int windowY, out int bufferX, out int bufferY)
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
  
      The ::copy-clipboard signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to copy the selection to the clipboard.
        
        The default bindings for this signal are
        Ctrl-c and Ctrl-Insert.
  
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
  
      The ::cut-clipboard signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to cut the selection to the clipboard.
        
        The default bindings for this signal are
        Ctrl-x and Shift-Delete.
  
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
  
      The ::delete-from-cursor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates a text deletion.
        
        If the type is [gtk.types.DeleteType.Chars], GTK+ deletes the selection
        if there is one, otherwise it deletes the requested number
        of characters.
        
        The default bindings for this signal are
        Delete for deleting a character, Ctrl-Delete for
        deleting a word and Ctrl-Backspace for deleting a word
        backwords.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.DeleteType type, int count, gtk.text_view.TextView textView))
  
          `type` the granularity of the deletion, as a #GtkDeleteType (optional)
  
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
  
      The ::extend-selection signal is emitted when the selection needs to be
        extended at location.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.TextExtendSelection granularity, gtk.text_iter.TextIter location, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtk.text_view.TextView textView))
  
          `granularity` the granularity type (optional)
  
          `location` the location where to extend the selection (optional)
  
          `start` where the selection should start (optional)
  
          `end` where the selection should end (optional)
  
          `textView` the instance the signal is connected to (optional)
  
          `Returns` `GDK_EVENT_STOP` to stop other handlers from being invoked for the
              event. `GDK_EVENT_PROPAGATE` to propagate the event further.
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
  
      The ::insert-at-cursor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates the insertion of a
        fixed string at the cursor.
        
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
  
      The ::insert-emoji signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to present the Emoji chooser for the text_view.
        
        The default bindings for this signal are Ctrl-. and Ctrl-;
  
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
  
      The ::move-cursor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates a cursor movement.
        If the cursor is not visible in text_view, this signal causes
        the viewport to be moved instead.
        
        Applications should not connect to it, but may emit it with
        [gobject.global.signalEmitByName] if they need to control the cursor
        programmatically.
        
        The default bindings for this signal come in two variants,
        the variant with the Shift modifier extends the selection,
        the variant without the Shift modifer does not.
        There are too many key combinations to list them all here.
        $(LIST
          * Arrow keys move by individual characters/lines
          * Ctrl-arrow key combinations move by words/paragraphs
          * Home/End keys move to the ends of the buffer
          * PageUp/PageDown keys move vertically by pages
          * Ctrl-PageUp/PageDown keys move horizontally by pages
        )
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.MovementStep step, int count, bool extendSelection, gtk.text_view.TextView textView))
  
          `step` the granularity of the move, as a #GtkMovementStep (optional)
  
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
  
      The ::move-viewport signal is a
        [keybinding signal][GtkBindingSignal]
        which can be bound to key combinations to allow the user
        to move the viewport, i.e. change what part of the text view
        is visible in a containing scrolled window.
        
        There are no default bindings for this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.ScrollStep step, int count, gtk.text_view.TextView textView))
  
          `step` the granularity of the movement, as a #GtkScrollStep (optional)
  
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
  
      The ::paste-clipboard signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to paste the contents of the clipboard
        into the text view.
        
        The default bindings for this signal are
        Ctrl-v and Shift-Insert.
  
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
  
          $(D void callback(gtk.widget.Widget popup, gtk.text_view.TextView textView))
  
          `popup` the container that is being populated (optional)
  
          `textView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopulatePopup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
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
  
      The ::select-all signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to select or unselect the complete
        contents of the text view.
        
        The default bindings for this signal are Ctrl-a and Ctrl-/
        for selecting and Shift-Ctrl-a and Ctrl-\ for unselecting.
  
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
  
      The ::set-anchor signal is a
        [keybinding signal][GtkBindingSignal]
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
  
      The ::toggle-cursor-visible signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to toggle the #GtkTextView:cursor-visible
        property.
        
        The default binding for this signal is F7.
  
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
  
      The ::toggle-overwrite signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to toggle the overwrite mode of the text view.
        
        The default bindings for this signal is Insert.
  
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
