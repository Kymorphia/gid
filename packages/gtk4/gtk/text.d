/// Module for [Text] class
module gtk.text;

public import gid.basictypes;
import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import graphene.rect;
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
import gtk.editable;
import gtk.editable_mixin;
import gtk.entry_buffer;
import gtk.types;
import gtk.widget;
import pango.attr_list;
import pango.tab_array;

/**
    A single-line text entry.
    
    [gtk.text.Text] is the common implementation of single-line text editing
    that is shared between [gtk.entry.Entry], [gtk.password_entry.PasswordEntry],
    [gtk.spin_button.SpinButton], and other widgets. In all of these, a [gtk.text.Text]
    instance is used as the delegate for the [gtk.editable.Editable] implementation.
    
    A large number of key bindings s supported by default. If the entered
    text is longer than the allocation of the widget, the widget will scroll
    so that the cursor position is visible.
    
    When using an entry for passwords and other sensitive information,
    it can be put into “password mode” using [gtk.text.Text.setVisibility].
    In this mode, entered text is displayed using an “invisible” character.
    By default, GTK picks the best invisible character that is available
    in the current font, but it can be changed with
    [gtk.text.Text.setInvisibleChar].
    
    If you want to add icons or progress display in an entry, look at
    [gtk.entry.Entry]. There are other alternatives for more specialized
    use cases, such as [gtk.search_entry.SearchEntry].
    
    If you need multi-line editable text, use [gtk.text_view.TextView].
    
    # Shortcuts and Gestures
    
    [gtk.text.Text] supports the following keyboard shortcuts:
    
    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.
    - <kbd>Ctrl</kbd>+<kbd>A</kbd> or <kbd>Ctrl</kbd>+<kbd>&sol;</kbd>
      selects all the text.
    - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>A</kbd> or
      <kbd>Ctrl</kbd>+<kbd>&bsol;</kbd> unselects all.
    - <kbd>Ctrl</kbd>+<kbd>Z</kbd> undoes the last modification.
    - <kbd>Ctrl</kbd>+<kbd>Y</kbd> or <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Z</kbd>
      redoes the last undone modification.
    - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>T</kbd> toggles the text direction.
    - <kbd>Clear</kbd> clears the content.
    
    Additionally, the following signals have default keybindings:
    
    - [gtk.text.Text.activate]
    - [gtk.text.Text.backspace]
    - [gtk.text.Text.copyClipboard]
    - [gtk.text.Text.cutClipboard]
    - [gtk.text.Text.deleteFromCursor]
    - [gtk.text.Text.insertEmoji]
    - [gtk.text.Text.moveCursor]
    - [gtk.text.Text.pasteClipboard]
    - [gtk.text.Text.toggleOverwrite]
    
    # Actions
    
    [gtk.text.Text] defines a set of built-in actions:
    
    - `clipboard.copy` copies the contents to the clipboard.
    - `clipboard.cut` copies the contents to the clipboard and deletes it from
      the widget.
    - `clipboard.paste` inserts the contents of the clipboard into the widget.
    - `menu.popup` opens the context menu.
    - `misc.insert-emoji` opens the Emoji chooser.
    - `misc.toggle-visibility` toggles the [gtk.text.Text]:visibility property.
    - `misc.toggle-direction` toggles the text direction.
    - `selection.delete` deletes the current selection.
    - `selection.select-all` selects all of the widgets content.
    - `text.redo` redoes the last change to the contents.
    - `text.undo` undoes the last change to the contents.
    - `text.clear` removes all content.
    
    # CSS nodes
    
    ```
    text[.read-only]
    ├── placeholder
    ├── undershoot.left
    ├── undershoot.right
    ├── [selection]
    ├── [cursor-handle[.top]
    ├── [cursor-handle.bottom]
    ├── [block-cursor]
    ├── [cursor-handle[.top/.bottom][.insertion-cursor]]
    ╰── [window.popup]
    ```
    
    [gtk.text.Text] has a main node with the name `text`. Depending on the properties
    of the widget, the `.read-only` style class may appear.
    
    When the entry has a selection, it adds a subnode with the name `selection`.
    
    When the entry is in overwrite mode, it adds a subnode with the name
    `block-cursor` that determines how the block cursor is drawn.
    
    The CSS node for a context menu is added as a subnode with the name `popup`.
    
    The `undershoot` nodes are used to draw the underflow indication when content
    is scrolled out of view. These nodes get the `.left` or `.right` style class
    added depending on where the indication is drawn.
    
    When touch is used and touch selection handles are shown, they are using
    CSS nodes with name `cursor-handle`. They get the `.top` or `.bottom` style
    class depending on where they are shown in relation to the selection. If
    there is just a single handle for the text cursor, it gets the style class
    `.insertion-cursor`.
    
    # Accessibility
    
    [gtk.text.Text] uses the [gtk.types.AccessibleRole.None] role, which causes it to be
    skipped for accessibility. This is because [gtk.text.Text] is expected to be used
    as a delegate for a [gtk.editable.Editable] implementation that will be represented
    to accessibility.
*/
class Text : gtk.widget.Widget, gtk.accessible_text.AccessibleText, gtk.editable.Editable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_get_type != &gidSymbolNotFound ? gtk_text_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Text self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.text.Text]
      Returns: New builder object
  */
  static TextGidBuilder builder() nothrow
  {
    return new TextGidBuilder;
  }

  /**
      Get `activatesDefault` property.
      Returns: Whether to activate the default widget when <kbd>Enter</kbd> is pressed.
  */
  @property bool activatesDefault() nothrow
  {
    return getActivatesDefault();
  }

  /**
      Set `activatesDefault` property.
      Params:
        propval = Whether to activate the default widget when <kbd>Enter</kbd> is pressed.
  */
  @property void activatesDefault(bool propval) nothrow
  {
    setActivatesDefault(propval);
  }

  /**
      Get `attributes` property.
      Returns: A list of Pango attributes to apply to the text.
        
        This is mainly useful to change the size or weight of the text.
        
        The [pango.attribute.Attribute]'s @start_index and @end_index must refer to the
        [gtk.entry_buffer.EntryBuffer] text, i.e. without the preedit string.
  */
  @property pango.attr_list.AttrList attributes() nothrow
  {
    return getAttributes();
  }

  /**
      Set `attributes` property.
      Params:
        propval = A list of Pango attributes to apply to the text.
          
          This is mainly useful to change the size or weight of the text.
          
          The [pango.attribute.Attribute]'s @start_index and @end_index must refer to the
          [gtk.entry_buffer.EntryBuffer] text, i.e. without the preedit string.
  */
  @property void attributes(pango.attr_list.AttrList propval) nothrow
  {
    setAttributes(propval);
  }

  /**
      Get `buffer` property.
      Returns: The [gtk.entry_buffer.EntryBuffer] object which stores the text.
  */
  @property gtk.entry_buffer.EntryBuffer buffer() nothrow
  {
    return getBuffer();
  }

  /**
      Set `buffer` property.
      Params:
        propval = The [gtk.entry_buffer.EntryBuffer] object which stores the text.
  */
  @property void buffer(gtk.entry_buffer.EntryBuffer propval) nothrow
  {
    setBuffer(propval);
  }

  /**
      Get `enableEmojiCompletion` property.
      Returns: Whether to suggest Emoji replacements.
  */
  @property bool enableEmojiCompletion() nothrow
  {
    return getEnableEmojiCompletion();
  }

  /**
      Set `enableEmojiCompletion` property.
      Params:
        propval = Whether to suggest Emoji replacements.
  */
  @property void enableEmojiCompletion(bool propval) nothrow
  {
    setEnableEmojiCompletion(propval);
  }

  /**
      Get `extraMenu` property.
      Returns: A menu model whose contents will be appended to the context menu.
  */
  @property gio.menu_model.MenuModel extraMenu() nothrow
  {
    return getExtraMenu();
  }

  /**
      Set `extraMenu` property.
      Params:
        propval = A menu model whose contents will be appended to the context menu.
  */
  @property void extraMenu(gio.menu_model.MenuModel propval) nothrow
  {
    setExtraMenu(propval);
  }

  /**
      Get `imModule` property.
      Returns: Which input method module should be used.
        
        See [gtk.immulticontext.IMMulticontext].
        
        Setting this to a non-`NULL` value overrides the system-wide
        input method. See the [gtk.settings.Settings.gtkImModule]
        setting.
  */
  @property string imModule() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("im-module");
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which input method module should be used.
          
          See [gtk.immulticontext.IMMulticontext].
          
          Setting this to a non-`NULL` value overrides the system-wide
          input method. See the [gtk.settings.Settings.gtkImModule]
          setting.
  */
  @property void imModule(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("im-module", propval);
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints that allow input methods to fine-tune
        their behaviour.
  */
  @property gtk.types.InputHints inputHints() nothrow
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints that allow input methods to fine-tune
          their behaviour.
  */
  @property void inputHints(gtk.types.InputHints propval) nothrow
  {
    setInputHints(propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The purpose of this text field.
        
        This information can be used by on-screen keyboards and other input
        methods to adjust their behaviour.
        
        Note that setting the purpose to [gtk.types.InputPurpose.Password]
        or [gtk.types.InputPurpose.Pin] is independent from setting
        [gtk.text.Text.visibility].
  */
  @property gtk.types.InputPurpose inputPurpose() nothrow
  {
    return getInputPurpose();
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose of this text field.
          
          This information can be used by on-screen keyboards and other input
          methods to adjust their behaviour.
          
          Note that setting the purpose to [gtk.types.InputPurpose.Password]
          or [gtk.types.InputPurpose.Pin] is independent from setting
          [gtk.text.Text.visibility].
  */
  @property void inputPurpose(gtk.types.InputPurpose propval) nothrow
  {
    setInputPurpose(propval);
  }

  /**
      Get `invisibleChar` property.
      Returns: The character to used when masking contents (in “password mode”).
  */
  @property uint invisibleChar() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("invisible-char");
  }

  /**
      Set `invisibleChar` property.
      Params:
        propval = The character to used when masking contents (in “password mode”).
  */
  @property void invisibleChar(uint propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(uint)("invisible-char", propval);
  }

  /**
      Get `invisibleCharSet` property.
      Returns: Whether the invisible char has been set.
  */
  @property bool invisibleCharSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("invisible-char-set");
  }

  /**
      Set `invisibleCharSet` property.
      Params:
        propval = Whether the invisible char has been set.
  */
  @property void invisibleCharSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("invisible-char-set", propval);
  }

  /**
      Get `maxLength` property.
      Returns: Maximum number of characters that are allowed.
        
        Zero indicates no limit.
  */
  @property int maxLength() nothrow
  {
    return getMaxLength();
  }

  /**
      Set `maxLength` property.
      Params:
        propval = Maximum number of characters that are allowed.
          
          Zero indicates no limit.
  */
  @property void maxLength(int propval) nothrow
  {
    setMaxLength(propval);
  }

  /**
      Get `overwriteMode` property.
      Returns: If text is overwritten when typing.
  */
  @property bool overwriteMode() nothrow
  {
    return getOverwriteMode();
  }

  /**
      Set `overwriteMode` property.
      Params:
        propval = If text is overwritten when typing.
  */
  @property void overwriteMode(bool propval) nothrow
  {
    setOverwriteMode(propval);
  }

  /**
      Get `placeholderText` property.
      Returns: The text that will be displayed in the [gtk.text.Text] when it is empty
        and unfocused.
  */
  @property string placeholderText() nothrow
  {
    return getPlaceholderText();
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gtk.text.Text] when it is empty
          and unfocused.
  */
  @property void placeholderText(string propval) nothrow
  {
    setPlaceholderText(propval);
  }

  /**
      Get `propagateTextWidth` property.
      Returns: Whether the widget should grow and shrink with the content.
  */
  @property bool propagateTextWidth() nothrow
  {
    return getPropagateTextWidth();
  }

  /**
      Set `propagateTextWidth` property.
      Params:
        propval = Whether the widget should grow and shrink with the content.
  */
  @property void propagateTextWidth(bool propval) nothrow
  {
    setPropagateTextWidth(propval);
  }

  /**
      Get `scrollOffset` property.
      Returns: Number of pixels scrolled of the screen to the left.
  */
  @property int scrollOffset() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("scroll-offset");
  }

  /**
      Get `tabs` property.
      Returns: Custom tabs for this text widget.
  */
  @property pango.tab_array.TabArray tabs() nothrow
  {
    return getTabs();
  }

  /**
      Set `tabs` property.
      Params:
        propval = Custom tabs for this text widget.
  */
  @property void tabs(pango.tab_array.TabArray propval) nothrow
  {
    setTabs(propval);
  }

  /**
      Get `truncateMultiline` property.
      Returns: When true, pasted multi-line text is truncated to the first line.
  */
  @property bool truncateMultiline() nothrow
  {
    return getTruncateMultiline();
  }

  /**
      Set `truncateMultiline` property.
      Params:
        propval = When true, pasted multi-line text is truncated to the first line.
  */
  @property void truncateMultiline(bool propval) nothrow
  {
    setTruncateMultiline(propval);
  }

  /**
      Get `visibility` property.
      Returns: If false, the text is masked with the “invisible char”.
  */
  @property bool visibility() nothrow
  {
    return getVisibility();
  }

  /**
      Set `visibility` property.
      Params:
        propval = If false, the text is masked with the “invisible char”.
  */
  @property void visibility(bool propval) nothrow
  {
    setVisibility(propval);
  }

  mixin AccessibleTextT!();
  mixin EditableT!();

  /**
      Creates a new [gtk.text.Text].
      Returns: the new [gtk.text.Text]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.text.Text] with the specified buffer.
  
      Params:
        buffer = the buffer to use
      Returns: a new [gtk.text.Text]
  */
  static gtk.text.Text newWithBuffer(gtk.entry_buffer.EntryBuffer buffer) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_new_with_buffer(buffer ? cast(GtkEntryBuffer*)buffer._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text.Text)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines the positions of the strong and weak cursors for a
      given character position.
      
      The position of each cursor is stored as a zero-width rectangle.
      The strong cursor location is the location where characters of
      the directionality equal to the base direction are inserted.
      The weak cursor location is the location where characters of
      the directionality opposite to the base direction are inserted.
      
      The rectangle positions are in widget coordinates.
  
      Params:
        position = the character position
        strong = location to store the strong cursor position
        weak = location to store the weak cursor position
  */
  void computeCursorExtents(size_t position, out graphene.rect.Rect strong, out graphene.rect.Rect weak) nothrow
  {
    auto _strong = boxedNew!graphene_rect_t(graphene.rect.Rect._getGType);
    auto _weak = boxedNew!graphene_rect_t(graphene.rect.Rect._getGType);
    gtk_text_compute_cursor_extents(cast(GtkText*)this._cPtr, position, _strong, _weak);
    strong = new graphene.rect.Rect(cast(void*)_strong, Yes.Take);
    weak = new graphene.rect.Rect(cast(void*)_weak, Yes.Take);
  }

  /**
      Returns whether pressing <kbd>Enter</kbd> will activate
      the default widget for the window containing the widget.
      
      See [gtk.text.Text.setActivatesDefault].
      Returns: true if self will activate the default widget
  */
  bool getActivatesDefault() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_activates_default(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets the attribute list that was set on the text widget.
      
      See [gtk.text.Text.setAttributes].
      Returns: the attribute list
  */
  pango.attr_list.AttrList getAttributes() nothrow
  {
    PangoAttrList* _cretval;
    _cretval = gtk_text_get_attributes(cast(GtkText*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the entry buffer object which holds the text for
      this widget.
      Returns: the entry buffer object
  */
  gtk.entry_buffer.EntryBuffer getBuffer() nothrow
  {
    GtkEntryBuffer* _cretval;
    _cretval = gtk_text_get_buffer(cast(GtkText*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.entry_buffer.EntryBuffer)(cast(GtkEntryBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether Emoji completion is enabled.
      Returns: true if Emoji completion is enabled
  */
  bool getEnableEmojiCompletion() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_enable_emoji_completion(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets the extra menu model of the text widget.
      
      See [gtk.text.Text.setExtraMenu].
      Returns: the menu model
  */
  gio.menu_model.MenuModel getExtraMenu() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_text_get_extra_menu(cast(GtkText*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the input hints of the text widget.
      Returns: the input hints
  */
  gtk.types.InputHints getInputHints() nothrow
  {
    GtkInputHints _cretval;
    _cretval = gtk_text_get_input_hints(cast(GtkText*)this._cPtr);
    gtk.types.InputHints _retval = cast(gtk.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the input purpose of the text widget.
      Returns: the input purpose
  */
  gtk.types.InputPurpose getInputPurpose() nothrow
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_text_get_input_purpose(cast(GtkText*)this._cPtr);
    gtk.types.InputPurpose _retval = cast(gtk.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Retrieves the character displayed when visibility is set to false.
      
      Note that GTK does not compute this value unless it needs it,
      so the value returned by this function is not very useful unless
      it has been explicitly set with [gtk.text.Text.setInvisibleChar].
      Returns: the current invisible char, or 0, if text does not
          show invisible text at all
  */
  dchar getInvisibleChar() nothrow
  {
    dchar _retval;
    _retval = gtk_text_get_invisible_char(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the maximum allowed length of the contents.
      
      See [gtk.text.Text.setMaxLength].
      
      This is equivalent to getting self's [gtk.entry_buffer.EntryBuffer] and
      calling [gtk.entry_buffer.EntryBuffer.getMaxLength] on it.
      Returns: the maximum allowed number of characters, or 0 if
          there is no limit
  */
  int getMaxLength() nothrow
  {
    int _retval;
    _retval = gtk_text_get_max_length(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether text is overwritten when typing.
      
      See [gtk.text.Text.setOverwriteMode].
      Returns: whether text is overwritten when typing
  */
  bool getOverwriteMode() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_overwrite_mode(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the text that will be displayed when the text widget
      is empty and unfocused
      
      See [gtk.text.Text.setPlaceholderText].
      Returns: the placeholder text
  */
  string getPlaceholderText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_text_get_placeholder_text(cast(GtkText*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether the text widget will grow and shrink
      with the content.
      Returns: true if self will propagate the text width
  */
  bool getPropagateTextWidth() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_propagate_text_width(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tab stops for the text widget.
      
      See [gtk.text.Text.setTabs].
      Returns: the tab stops
  */
  pango.tab_array.TabArray getTabs() nothrow
  {
    PangoTabArray* _cretval;
    _cretval = gtk_text_get_tabs(cast(GtkText*)this._cPtr);
    auto _retval = _cretval ? new pango.tab_array.TabArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the length of the contents.
      
      This is equivalent to getting self's [gtk.entry_buffer.EntryBuffer]
      and calling [gtk.entry_buffer.EntryBuffer.getLength] on it.
      Returns: the length of the contents, in characters
  */
  ushort getTextLength() nothrow
  {
    ushort _retval;
    _retval = gtk_text_get_text_length(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether pasted text will be truncated to the first line.
      Returns: true if self will truncate pasted multi-line text
  */
  bool getTruncateMultiline() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_truncate_multiline(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether the text is visible.
      Returns: true if the text is visible
  */
  bool getVisibility() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_visibility(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Causes the text widget to have the keyboard focus.
      
      It behaves like [gtk.widget.Widget.grabFocus],
      except that it does not select the contents of self.
      
      You only want to call this on some special entries
      which the user usually doesn't want to replace all
      text in, such as search-as-you-type entries.
      Returns: true if focus is now inside self
  */
  bool grabFocusWithoutSelecting() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_grab_focus_without_selecting(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether pressing <kbd>Enter</kbd> will activate
      the default widget.
      
      This usually means that the dialog containing self will
      be closed, since the default widget is usually one of
      the dialog buttons.
  
      Params:
        activates = true to activate window’s default widget on
            <kbd>Enter</kbd> keypress
  */
  void setActivatesDefault(bool activates) nothrow
  {
    gtk_text_set_activates_default(cast(GtkText*)this._cPtr, activates);
  }

  /**
      Apply attributes to the contents of the text widget.
  
      Params:
        attrs = a list of style attributes
  */
  void setAttributes(pango.attr_list.AttrList attrs = null) nothrow
  {
    gtk_text_set_attributes(cast(GtkText*)this._cPtr, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /**
      Set the entry buffer object which holds the text for
      this widget.
  
      Params:
        buffer = an entry buffer object
  */
  void setBuffer(gtk.entry_buffer.EntryBuffer buffer) nothrow
  {
    gtk_text_set_buffer(cast(GtkText*)this._cPtr, buffer ? cast(GtkEntryBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Sets whether Emoji completion is enabled.
      
      If it is, typing ':', followed by a recognized keyword,
      will pop up a window with suggested Emojis matching the
      keyword.
  
      Params:
        enableEmojiCompletion = true to enable Emoji completion
  */
  void setEnableEmojiCompletion(bool enableEmojiCompletion) nothrow
  {
    gtk_text_set_enable_emoji_completion(cast(GtkText*)this._cPtr, enableEmojiCompletion);
  }

  /**
      Sets a menu model to add to the context menu of the text widget.
  
      Params:
        model = a menu model
  */
  void setExtraMenu(gio.menu_model.MenuModel model = null) nothrow
  {
    gtk_text_set_extra_menu(cast(GtkText*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }

  /**
      Sets hints that allow input methods to fine-tune their behaviour.
  
      Params:
        hints = input hints
  */
  void setInputHints(gtk.types.InputHints hints) nothrow
  {
    gtk_text_set_input_hints(cast(GtkText*)this._cPtr, hints);
  }

  /**
      Sets the input purpose of the text widget.
      
      The input purpose can be used by on-screen keyboards
      and other input methods to adjust their behaviour.
  
      Params:
        purpose = the input purpose
  */
  void setInputPurpose(gtk.types.InputPurpose purpose) nothrow
  {
    gtk_text_set_input_purpose(cast(GtkText*)this._cPtr, purpose);
  }

  /**
      Sets the character to use when in “password mode”.
      
      By default, GTK picks the best invisible char available in the
      current font. If you set the invisible char to 0, then the user
      will get no feedback at all; there will be no text on the screen
      as they type.
  
      Params:
        ch = a Unicode character
  */
  void setInvisibleChar(dchar ch) nothrow
  {
    gtk_text_set_invisible_char(cast(GtkText*)this._cPtr, ch);
  }

  /**
      Sets the maximum allowed length of the contents.
      
      If the current contents are longer than the given length,
      they will be truncated to fit.
      
      This is equivalent to getting self's [gtk.entry_buffer.EntryBuffer] and
      calling [gtk.entry_buffer.EntryBuffer.setMaxLength] on it.
  
      Params:
        length = the maximum length of the text, or 0 for no maximum.
            (other than the maximum length of entries.) The value passed
            in will be clamped to the range 0-65536
  */
  void setMaxLength(int length) nothrow
  {
    gtk_text_set_max_length(cast(GtkText*)this._cPtr, length);
  }

  /**
      Sets whether the text is overwritten when typing.
  
      Params:
        overwrite = new value
  */
  void setOverwriteMode(bool overwrite) nothrow
  {
    gtk_text_set_overwrite_mode(cast(GtkText*)this._cPtr, overwrite);
  }

  /**
      Sets the text to be displayed when the text widget is
      empty and unfocused.
      
      This can be used to give a visual hint of the expected
      contents of the text widget.
  
      Params:
        text = a string to be displayed when self
            is empty and unfocused
  */
  void setPlaceholderText(string text = null) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    gtk_text_set_placeholder_text(cast(GtkText*)this._cPtr, _text);
  }

  /**
      Sets whether the text widget should grow and shrink with the content.
  
      Params:
        propagateTextWidth = true to propagate the text width
  */
  void setPropagateTextWidth(bool propagateTextWidth) nothrow
  {
    gtk_text_set_propagate_text_width(cast(GtkText*)this._cPtr, propagateTextWidth);
  }

  /**
      Sets tab stops for the text widget.
  
      Params:
        tabs = tab stops
  */
  void setTabs(pango.tab_array.TabArray tabs = null) nothrow
  {
    gtk_text_set_tabs(cast(GtkText*)this._cPtr, tabs ? cast(PangoTabArray*)tabs._cPtr(No.Dup) : null);
  }

  /**
      Sets whether pasted text should be truncated to the first line.
  
      Params:
        truncateMultiline = true to truncate multi-line text
  */
  void setTruncateMultiline(bool truncateMultiline) nothrow
  {
    gtk_text_set_truncate_multiline(cast(GtkText*)this._cPtr, truncateMultiline);
  }

  /**
      Sets whether the contents of the text widget are visible or not.
      
      When visibility is set to false, characters are displayed
      as the invisible char, and it will also appear that way when
      the text in the widget is copied to the clipboard.
      
      By default, GTK picks the best invisible character available
      in the current font, but it can be changed with
      [gtk.text.Text.setInvisibleChar].
      
      Note that you probably want to set [gtk.text.Text.inputPurpose]
      to [gtk.types.InputPurpose.Password] or [gtk.types.InputPurpose.Pin]
      to inform input methods about the purpose of this widget, in addition
      to setting visibility to false.
  
      Params:
        visible = true if the contents of the text widget are displayed
            as plain text
  */
  void setVisibility(bool visible) nothrow
  {
    gtk_text_set_visibility(cast(GtkText*)this._cPtr, visible);
  }

  /**
      Unsets the invisible char.
      
      After calling this, the default invisible char is used again.
  */
  void unsetInvisibleChar() nothrow
  {
    gtk_text_unset_invisible_char(cast(GtkText*)this._cPtr);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the user hits the <kbd>Enter</kbd> key.
        
        The default bindings for this signal are all forms
        of the <kbd>Enter</kbd> key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.text.Text text)`
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `Backspace` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Backspace</kbd> and <kbd>Shift</kbd>+<kbd>Backspace</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.text.Text text)`
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectBackspace(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.backspace");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("backspace", closure, after);
  }

  /**
      Connect to `CopyClipboard` signal.
  
      Emitted to copy the selection to the clipboard.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>c</kbd> and
        <kbd>Ctrl</kbd>+<kbd>Insert</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.text.Text text)`
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.copyClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
      Connect to `CutClipboard` signal.
  
      Emitted to cut the selection to the clipboard.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>x</kbd> and
        <kbd>Shift</kbd>+<kbd>Delete</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.text.Text text)`
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCutClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.cutClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cut-clipboard", closure, after);
  }

  /**
      Connect to `DeleteFromCursor` signal.
  
      Emitted when the user initiates a text deletion.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        If the type is [gtk.types.DeleteType.Chars], GTK deletes the
        selection if there is one, otherwise it deletes the requested
        number of characters.
        
        The default bindings for this signal are <kbd>Delete</kbd>
        for deleting a character and <kbd>Ctrl</kbd>+<kbd>Delete</kbd>
        for deleting a word.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.types.DeleteType type, int count, gtk.text.Text text)`
  
          `type` the granularity of the deletion (optional)
  
          `count` the number of type units to delete (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeleteFromCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DeleteType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.text.Text)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.deleteFromCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-from-cursor", closure, after);
  }

  /**
      Connect to `InsertAtCursor` signal.
  
      Emitted when the user initiates the insertion of a
        fixed string at the cursor.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This signal has no default bindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string string_, gtk.text.Text text)`
  
          `string_` the string to insert (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertAtCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text.Text)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.insertAtCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-at-cursor", closure, after);
  }

  /**
      Connect to `InsertEmoji` signal.
  
      Emitted to present the Emoji chooser.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>.</kbd> and
        <kbd>Ctrl</kbd>+<kbd>;</kbd>
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.text.Text text)`
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertEmoji(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.insertEmoji");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-emoji", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      Emitted when the user initiates a cursor movement.
        
        If the cursor is not visible in self, this signal causes
        the viewport to be moved instead.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        Applications should not connect to it, but may emit it with
        `funcGObject.signal_emit_by_name` if they need to control
        the cursor programmatically.
        
        The default bindings for this signal come in two variants,
        the variant with the <kbd>Shift</kbd> modifier extends the
        selection, the variant without it does not.
        There are too many key combinations to list them all here.
        
        - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd>
          move by individual characters/lines
        - <kbd>Ctrl</kbd>+<kbd>←</kbd>, etc. move by words/paragraphs
        - <kbd>Home</kbd> and <kbd>End</kbd> move to the ends of the buffer
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.types.MovementStep step, int count, bool extend, gtk.text.Text text)`
  
          `step` the granularity of the move (optional)
  
          `count` the number of step units to move (optional)
  
          `extend` true if the move should extend the selection (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.text.Text)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.moveCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `PasteClipboard` signal.
  
      Emitted to paste the contents of the clipboard.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>v</kbd> and <kbd>Shift</kbd>+<kbd>Insert</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.text.Text text)`
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.pasteClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paste-clipboard", closure, after);
  }

  /**
      Connect to `PreeditChanged` signal.
  
      Emitted when the preedit text changes.
        
        If an input method is used, the typed text will not immediately
        be committed to the buffer. So if you are interested in the text,
        connect to this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string preedit, gtk.text.Text text)`
  
          `preedit` the current preedit string (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text.Text)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.preeditChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-changed", closure, after);
  }

  /**
      Connect to `ToggleOverwrite` signal.
  
      Emitted to toggle the overwrite mode.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal is <kbd>Insert</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.text.Text text)`
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleOverwrite(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.text.Text.toggleOverwrite");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-overwrite", closure, after);
  }
}

/// Fluent builder implementation template for [gtk.text.Text]
class TextGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.accessible_text.AccessibleTextGidBuilderImpl!T, gtk.editable.EditableGidBuilderImpl!T
{

  mixin AccessibleTextGidBuilderT!();
  mixin EditableGidBuilderT!();

  /**
      Set `activatesDefault` property.
      Params:
        propval = Whether to activate the default widget when <kbd>Enter</kbd> is pressed.
      Returns: Builder instance for fluent chaining
  */
  T activatesDefault(bool propval) nothrow
  {
    return setProperty("activates-default", propval);
  }

  /**
      Set `attributes` property.
      Params:
        propval = A list of Pango attributes to apply to the text.
          
          This is mainly useful to change the size or weight of the text.
          
          The [pango.attribute.Attribute]'s @start_index and @end_index must refer to the
          [gtk.entry_buffer.EntryBuffer] text, i.e. without the preedit string.
      Returns: Builder instance for fluent chaining
  */
  T attributes(pango.attr_list.AttrList propval) nothrow
  {
    return setProperty("attributes", propval);
  }

  /**
      Set `buffer` property.
      Params:
        propval = The [gtk.entry_buffer.EntryBuffer] object which stores the text.
      Returns: Builder instance for fluent chaining
  */
  T buffer(gtk.entry_buffer.EntryBuffer propval) nothrow
  {
    return setProperty("buffer", propval);
  }

  /**
      Set `enableEmojiCompletion` property.
      Params:
        propval = Whether to suggest Emoji replacements.
      Returns: Builder instance for fluent chaining
  */
  T enableEmojiCompletion(bool propval) nothrow
  {
    return setProperty("enable-emoji-completion", propval);
  }

  /**
      Set `extraMenu` property.
      Params:
        propval = A menu model whose contents will be appended to the context menu.
      Returns: Builder instance for fluent chaining
  */
  T extraMenu(gio.menu_model.MenuModel propval) nothrow
  {
    return setProperty("extra-menu", propval);
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which input method module should be used.
          
          See [gtk.immulticontext.IMMulticontext].
          
          Setting this to a non-`NULL` value overrides the system-wide
          input method. See the [gtk.settings.Settings.gtkImModule]
          setting.
      Returns: Builder instance for fluent chaining
  */
  T imModule(string propval) nothrow
  {
    return setProperty("im-module", propval);
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints that allow input methods to fine-tune
          their behaviour.
      Returns: Builder instance for fluent chaining
  */
  T inputHints(gtk.types.InputHints propval) nothrow
  {
    return setProperty("input-hints", propval);
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose of this text field.
          
          This information can be used by on-screen keyboards and other input
          methods to adjust their behaviour.
          
          Note that setting the purpose to [gtk.types.InputPurpose.Password]
          or [gtk.types.InputPurpose.Pin] is independent from setting
          [gtk.text.Text.visibility].
      Returns: Builder instance for fluent chaining
  */
  T inputPurpose(gtk.types.InputPurpose propval) nothrow
  {
    return setProperty("input-purpose", propval);
  }

  /**
      Set `invisibleChar` property.
      Params:
        propval = The character to used when masking contents (in “password mode”).
      Returns: Builder instance for fluent chaining
  */
  T invisibleChar(uint propval) nothrow
  {
    return setProperty("invisible-char", propval);
  }

  /**
      Set `invisibleCharSet` property.
      Params:
        propval = Whether the invisible char has been set.
      Returns: Builder instance for fluent chaining
  */
  T invisibleCharSet(bool propval) nothrow
  {
    return setProperty("invisible-char-set", propval);
  }

  /**
      Set `maxLength` property.
      Params:
        propval = Maximum number of characters that are allowed.
          
          Zero indicates no limit.
      Returns: Builder instance for fluent chaining
  */
  T maxLength(int propval) nothrow
  {
    return setProperty("max-length", propval);
  }

  /**
      Set `overwriteMode` property.
      Params:
        propval = If text is overwritten when typing.
      Returns: Builder instance for fluent chaining
  */
  T overwriteMode(bool propval) nothrow
  {
    return setProperty("overwrite-mode", propval);
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gtk.text.Text] when it is empty
          and unfocused.
      Returns: Builder instance for fluent chaining
  */
  T placeholderText(string propval) nothrow
  {
    return setProperty("placeholder-text", propval);
  }

  /**
      Set `propagateTextWidth` property.
      Params:
        propval = Whether the widget should grow and shrink with the content.
      Returns: Builder instance for fluent chaining
  */
  T propagateTextWidth(bool propval) nothrow
  {
    return setProperty("propagate-text-width", propval);
  }

  /**
      Set `tabs` property.
      Params:
        propval = Custom tabs for this text widget.
      Returns: Builder instance for fluent chaining
  */
  T tabs(pango.tab_array.TabArray propval) nothrow
  {
    return setProperty("tabs", propval);
  }

  /**
      Set `truncateMultiline` property.
      Params:
        propval = When true, pasted multi-line text is truncated to the first line.
      Returns: Builder instance for fluent chaining
  */
  T truncateMultiline(bool propval) nothrow
  {
    return setProperty("truncate-multiline", propval);
  }

  /**
      Set `visibility` property.
      Params:
        propval = If false, the text is masked with the “invisible char”.
      Returns: Builder instance for fluent chaining
  */
  T visibility(bool propval) nothrow
  {
    return setProperty("visibility", propval);
  }
}

/// Fluent builder for [gtk.text.Text]
final class TextGidBuilder : TextGidBuilderImpl!TextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Text build() nothrow
  {
    return new Text(cast(void*)createGObject(Text._getGType), Yes.Take);
  }
}
