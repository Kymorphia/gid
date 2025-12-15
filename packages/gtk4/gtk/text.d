/// Module for [Text] class
module gtk.text;

import gid.gid;
import gio.menu_model;
import gobject.dclosure;
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
    The [gtk.text.Text] widget is a single-line text entry widget.
    
    [gtk.text.Text] is the common implementation of single-line text editing
    that is shared between [gtk.entry.Entry], [gtk.password_entry.PasswordEntry],
    [gtk.spin_button.SpinButton], and other widgets. In all of these, [gtk.text.Text] is
    used as the delegate for the [gtk.editable.Editable] implementation.
    
    A fairly large set of key bindings are supported by default. If the
    entered text is longer than the allocation of the widget, the widget
    will scroll so that the cursor position is visible.
    
    When using an entry for passwords and other sensitive information,
    it can be put into “password mode” using [gtk.text.Text.setVisibility].
    In this mode, entered text is displayed using a “invisible” character.
    By default, GTK picks the best invisible character that is available
    in the current font, but it can be changed with
    [gtk.text.Text.setInvisibleChar].
    
    If you are looking to add icons or progress display in an entry, look
    at [gtk.entry.Entry]. There other alternatives for more specialized use
    cases, such as [gtk.search_entry.SearchEntry].
    
    If you need multi-line editable text, look at [gtk.text_view.TextView].
    
    # CSS nodes
    
    ```
    text[.read-only]
    ├── placeholder
    ├── undershoot.left
    ├── undershoot.right
    ├── [selection]
    ├── [block-cursor]
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_get_type != &gidSymbolNotFound ? gtk_text_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Text self()
  {
    return this;
  }

  /**
      Get `activatesDefault` property.
      Returns: Whether to activate the default widget when Enter is pressed.
  */
  @property bool activatesDefault()
  {
    return getActivatesDefault();
  }

  /**
      Set `activatesDefault` property.
      Params:
        propval = Whether to activate the default widget when Enter is pressed.
  */
  @property void activatesDefault(bool propval)
  {
    return setActivatesDefault(propval);
  }

  /**
      Get `attributes` property.
      Returns: A list of Pango attributes to apply to the text of the [gtk.text.Text].
      
      This is mainly useful to change the size or weight of the text.
      
      The [pango.attribute.Attribute]'s @start_index and @end_index must refer to the
      [gtk.entry_buffer.EntryBuffer] text, i.e. without the preedit string.
  */
  @property pango.attr_list.AttrList attributes()
  {
    return getAttributes();
  }

  /**
      Set `attributes` property.
      Params:
        propval = A list of Pango attributes to apply to the text of the [gtk.text.Text].
        
        This is mainly useful to change the size or weight of the text.
        
        The [pango.attribute.Attribute]'s @start_index and @end_index must refer to the
        [gtk.entry_buffer.EntryBuffer] text, i.e. without the preedit string.
  */
  @property void attributes(pango.attr_list.AttrList propval)
  {
    return setAttributes(propval);
  }

  /**
      Get `buffer` property.
      Returns: The [gtk.entry_buffer.EntryBuffer] object which stores the text.
  */
  @property gtk.entry_buffer.EntryBuffer buffer()
  {
    return getBuffer();
  }

  /**
      Set `buffer` property.
      Params:
        propval = The [gtk.entry_buffer.EntryBuffer] object which stores the text.
  */
  @property void buffer(gtk.entry_buffer.EntryBuffer propval)
  {
    return setBuffer(propval);
  }

  /**
      Get `enableEmojiCompletion` property.
      Returns: Whether to suggest Emoji replacements.
  */
  @property bool enableEmojiCompletion()
  {
    return getEnableEmojiCompletion();
  }

  /**
      Set `enableEmojiCompletion` property.
      Params:
        propval = Whether to suggest Emoji replacements.
  */
  @property void enableEmojiCompletion(bool propval)
  {
    return setEnableEmojiCompletion(propval);
  }

  /**
      Get `extraMenu` property.
      Returns: A menu model whose contents will be appended to
      the context menu.
  */
  @property gio.menu_model.MenuModel extraMenu()
  {
    return getExtraMenu();
  }

  /**
      Set `extraMenu` property.
      Params:
        propval = A menu model whose contents will be appended to
        the context menu.
  */
  @property void extraMenu(gio.menu_model.MenuModel propval)
  {
    return setExtraMenu(propval);
  }

  /**
      Get `imModule` property.
      Returns: Which IM (input method) module should be used for this self.
      
      See [gtk.immulticontext.IMMulticontext].
      
      Setting this to a non-null value overrides the system-wide
      IM module setting. See the `property@Gtk.Settings:gtk-im-module`
      property.
  */
  @property string imModule()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("im-module");
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which IM (input method) module should be used for this self.
        
        See [gtk.immulticontext.IMMulticontext].
        
        Setting this to a non-null value overrides the system-wide
        IM module setting. See the `property@Gtk.Settings:gtk-im-module`
        property.
  */
  @property void imModule(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("im-module", propval);
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints that allow input methods to fine-tune
      their behaviour.
  */
  @property gtk.types.InputHints inputHints()
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints that allow input methods to fine-tune
        their behaviour.
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
      
      Note that setting the purpose to [gtk.types.InputPurpose.Password] or
      [gtk.types.InputPurpose.Pin] is independent from setting
      [gtk.text.Text.visibility].
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
        
        Note that setting the purpose to [gtk.types.InputPurpose.Password] or
        [gtk.types.InputPurpose.Pin] is independent from setting
        [gtk.text.Text.visibility].
  */
  @property void inputPurpose(gtk.types.InputPurpose propval)
  {
    return setInputPurpose(propval);
  }

  /**
      Get `invisibleChar` property.
      Returns: The character to used when masking contents (in “password mode”).
  */
  @property uint invisibleChar()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("invisible-char");
  }

  /**
      Set `invisibleChar` property.
      Params:
        propval = The character to used when masking contents (in “password mode”).
  */
  @property void invisibleChar(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("invisible-char", propval);
  }

  /**
      Get `invisibleCharSet` property.
      Returns: Whether the invisible char has been set for the [gtk.text.Text].
  */
  @property bool invisibleCharSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("invisible-char-set");
  }

  /**
      Set `invisibleCharSet` property.
      Params:
        propval = Whether the invisible char has been set for the [gtk.text.Text].
  */
  @property void invisibleCharSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("invisible-char-set", propval);
  }

  /**
      Get `maxLength` property.
      Returns: Maximum number of characters that are allowed.
      
      Zero indicates no limit.
  */
  @property int maxLength()
  {
    return getMaxLength();
  }

  /**
      Set `maxLength` property.
      Params:
        propval = Maximum number of characters that are allowed.
        
        Zero indicates no limit.
  */
  @property void maxLength(int propval)
  {
    return setMaxLength(propval);
  }

  /**
      Get `overwriteMode` property.
      Returns: If text is overwritten when typing in the [gtk.text.Text].
  */
  @property bool overwriteMode()
  {
    return getOverwriteMode();
  }

  /**
      Set `overwriteMode` property.
      Params:
        propval = If text is overwritten when typing in the [gtk.text.Text].
  */
  @property void overwriteMode(bool propval)
  {
    return setOverwriteMode(propval);
  }

  /**
      Get `placeholderText` property.
      Returns: The text that will be displayed in the [gtk.text.Text] when it is empty
      and unfocused.
  */
  @property string placeholderText()
  {
    return getPlaceholderText();
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gtk.text.Text] when it is empty
        and unfocused.
  */
  @property void placeholderText(string propval)
  {
    return setPlaceholderText(propval);
  }

  /**
      Get `propagateTextWidth` property.
      Returns: Whether the widget should grow and shrink with the content.
  */
  @property bool propagateTextWidth()
  {
    return getPropagateTextWidth();
  }

  /**
      Set `propagateTextWidth` property.
      Params:
        propval = Whether the widget should grow and shrink with the content.
  */
  @property void propagateTextWidth(bool propval)
  {
    return setPropagateTextWidth(propval);
  }

  /**
      Get `scrollOffset` property.
      Returns: Number of pixels scrolled of the screen to the left.
  */
  @property int scrollOffset()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("scroll-offset");
  }

  /**
      Get `tabs` property.
      Returns: A list of tabstops to apply to the text of the [gtk.text.Text].
  */
  @property pango.tab_array.TabArray tabs()
  {
    return getTabs();
  }

  /**
      Set `tabs` property.
      Params:
        propval = A list of tabstops to apply to the text of the [gtk.text.Text].
  */
  @property void tabs(pango.tab_array.TabArray propval)
  {
    return setTabs(propval);
  }

  /**
      Get `truncateMultiline` property.
      Returns: When true, pasted multi-line text is truncated to the first line.
  */
  @property bool truncateMultiline()
  {
    return getTruncateMultiline();
  }

  /**
      Set `truncateMultiline` property.
      Params:
        propval = When true, pasted multi-line text is truncated to the first line.
  */
  @property void truncateMultiline(bool propval)
  {
    return setTruncateMultiline(propval);
  }

  /**
      Get `visibility` property.
      Returns: If false, the text is masked with the “invisible char”.
  */
  @property bool visibility()
  {
    return getVisibility();
  }

  /**
      Set `visibility` property.
      Params:
        propval = If false, the text is masked with the “invisible char”.
  */
  @property void visibility(bool propval)
  {
    return setVisibility(propval);
  }

  mixin AccessibleTextT!();
  mixin EditableT!();

  /**
      Creates a new [gtk.text.Text].
      Returns: a new [gtk.text.Text].
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.text.Text] with the specified text buffer.
  
      Params:
        buffer = The buffer to use for the new [gtk.text.Text].
      Returns: a new [gtk.text.Text]
  */
  static gtk.text.Text newWithBuffer(gtk.entry_buffer.EntryBuffer buffer)
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_new_with_buffer(buffer ? cast(GtkEntryBuffer*)buffer._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text.Text)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determine the positions of the strong and weak cursors if the
      insertion point in the layout is at position.
      
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
  void computeCursorExtents(size_t position, out graphene.rect.Rect strong, out graphene.rect.Rect weak)
  {
    graphene_rect_t _strong;
    graphene_rect_t _weak;
    gtk_text_compute_cursor_extents(cast(GtkText*)this._cPtr, position, &_strong, &_weak);
    strong = new graphene.rect.Rect(cast(void*)&_strong, No.Take);
    weak = new graphene.rect.Rect(cast(void*)&_weak, No.Take);
  }

  /**
      Returns whether pressing Enter will activate
      the default widget for the window containing self.
      
      See [gtk.text.Text.setActivatesDefault].
      Returns: true if the [gtk.text.Text] will activate the default widget
  */
  bool getActivatesDefault()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_activates_default(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets the attribute list that was set on the [gtk.text.Text].
      
      See [gtk.text.Text.setAttributes].
      Returns: the attribute list
  */
  pango.attr_list.AttrList getAttributes()
  {
    PangoAttrList* _cretval;
    _cretval = gtk_text_get_attributes(cast(GtkText*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the [gtk.entry_buffer.EntryBuffer] object which holds the text for
      this widget.
      Returns: A [gtk.entry_buffer.EntryBuffer] object.
  */
  gtk.entry_buffer.EntryBuffer getBuffer()
  {
    GtkEntryBuffer* _cretval;
    _cretval = gtk_text_get_buffer(cast(GtkText*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.entry_buffer.EntryBuffer)(cast(GtkEntryBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether Emoji completion is enabled for this
      [gtk.text.Text] widget.
      Returns: true if Emoji completion is enabled
  */
  bool getEnableEmojiCompletion()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_enable_emoji_completion(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets the menu model for extra items in the context menu.
      
      See [gtk.text.Text.setExtraMenu].
      Returns: the menu model
  */
  gio.menu_model.MenuModel getExtraMenu()
  {
    GMenuModel* _cretval;
    _cretval = gtk_text_get_extra_menu(cast(GtkText*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the input hints of the [gtk.text.Text].
      Returns: 
  */
  gtk.types.InputHints getInputHints()
  {
    GtkInputHints _cretval;
    _cretval = gtk_text_get_input_hints(cast(GtkText*)this._cPtr);
    gtk.types.InputHints _retval = cast(gtk.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the input purpose of the [gtk.text.Text].
      Returns: 
  */
  gtk.types.InputPurpose getInputPurpose()
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
          show invisible text at all.
  */
  dchar getInvisibleChar()
  {
    dchar _retval;
    _retval = gtk_text_get_invisible_char(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the maximum allowed length of the text in self.
      
      See [gtk.text.Text.setMaxLength].
      
      This is equivalent to getting self's [gtk.entry_buffer.EntryBuffer] and
      calling [gtk.entry_buffer.EntryBuffer.getMaxLength] on it.
      Returns: the maximum allowed number of characters
          in [gtk.text.Text], or 0 if there is no maximum.
  */
  int getMaxLength()
  {
    int _retval;
    _retval = gtk_text_get_max_length(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether text is overwritten when typing in the [gtk.text.Text].
      
      See [gtk.text.Text.setOverwriteMode].
      Returns: whether the text is overwritten when typing
  */
  bool getOverwriteMode()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_overwrite_mode(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the text that will be displayed when
      self is empty and unfocused
      
      If no placeholder text has been set, null will be returned.
      Returns: the placeholder text
  */
  string getPlaceholderText()
  {
    const(char)* _cretval;
    _cretval = gtk_text_get_placeholder_text(cast(GtkText*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the [gtk.text.Text] will grow and shrink
      with the content.
      Returns: true if self will propagate the text width
  */
  bool getPropagateTextWidth()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_propagate_text_width(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tabstops that were set on the [gtk.text.Text].
      
      See [gtk.text.Text.setTabs].
      Returns: the tabstops
  */
  pango.tab_array.TabArray getTabs()
  {
    PangoTabArray* _cretval;
    _cretval = gtk_text_get_tabs(cast(GtkText*)this._cPtr);
    auto _retval = _cretval ? new pango.tab_array.TabArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the current length of the text in self.
      
      This is equivalent to getting self's [gtk.entry_buffer.EntryBuffer]
      and calling [gtk.entry_buffer.EntryBuffer.getLength] on it.
      Returns: the current number of characters
          in [gtk.text.Text], or 0 if there are none.
  */
  ushort getTextLength()
  {
    ushort _retval;
    _retval = gtk_text_get_text_length(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the [gtk.text.Text] will truncate multi-line text
      that is pasted into the widget
      Returns: true if self will truncate multi-line text
  */
  bool getTruncateMultiline()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_truncate_multiline(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether the text in self is visible.
      Returns: true if the text is currently visible
  */
  bool getVisibility()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_get_visibility(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      Causes self to have keyboard focus.
      
      It behaves like [gtk.widget.Widget.grabFocus],
      except that it doesn't select the contents of self.
      You only want to call this on some special entries
      which the user usually doesn't want to replace all text in,
      such as search-as-you-type entries.
      Returns: true if focus is now inside self
  */
  bool grabFocusWithoutSelecting()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_grab_focus_without_selecting(cast(GtkText*)this._cPtr);
    return _retval;
  }

  /**
      If activates is true, pressing Enter will activate
      the default widget for the window containing self.
      
      This usually means that the dialog containing the [gtk.text.Text]
      will be closed, since the default widget is usually one of
      the dialog buttons.
  
      Params:
        activates = true to activate window’s default widget on Enter keypress
  */
  void setActivatesDefault(bool activates)
  {
    gtk_text_set_activates_default(cast(GtkText*)this._cPtr, activates);
  }

  /**
      Sets attributes that are applied to the text.
  
      Params:
        attrs = a [pango.attr_list.AttrList]
  */
  void setAttributes(pango.attr_list.AttrList attrs = null)
  {
    gtk_text_set_attributes(cast(GtkText*)this._cPtr, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /**
      Set the [gtk.entry_buffer.EntryBuffer] object which holds the text for
      this widget.
  
      Params:
        buffer = a [gtk.entry_buffer.EntryBuffer]
  */
  void setBuffer(gtk.entry_buffer.EntryBuffer buffer)
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
  void setEnableEmojiCompletion(bool enableEmojiCompletion)
  {
    gtk_text_set_enable_emoji_completion(cast(GtkText*)this._cPtr, enableEmojiCompletion);
  }

  /**
      Sets a menu model to add when constructing
      the context menu for self.
  
      Params:
        model = a [gio.menu_model.MenuModel]
  */
  void setExtraMenu(gio.menu_model.MenuModel model = null)
  {
    gtk_text_set_extra_menu(cast(GtkText*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }

  /**
      Sets input hints that allow input methods
      to fine-tune their behaviour.
  
      Params:
        hints = the hints
  */
  void setInputHints(gtk.types.InputHints hints)
  {
    gtk_text_set_input_hints(cast(GtkText*)this._cPtr, hints);
  }

  /**
      Sets the input purpose of the [gtk.text.Text].
      
      This can be used by on-screen keyboards and other
      input methods to adjust their behaviour.
  
      Params:
        purpose = the purpose
  */
  void setInputPurpose(gtk.types.InputPurpose purpose)
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
  void setInvisibleChar(dchar ch)
  {
    gtk_text_set_invisible_char(cast(GtkText*)this._cPtr, ch);
  }

  /**
      Sets the maximum allowed length of the contents of the widget.
      
      If the current contents are longer than the given length, then
      they will be truncated to fit.
      
      This is equivalent to getting self's [gtk.entry_buffer.EntryBuffer] and
      calling [gtk.entry_buffer.EntryBuffer.setMaxLength] on it.
  
      Params:
        length = the maximum length of the [gtk.text.Text], or 0 for no maximum.
            (other than the maximum length of entries.) The value passed
            in will be clamped to the range 0-65536.
  */
  void setMaxLength(int length)
  {
    gtk_text_set_max_length(cast(GtkText*)this._cPtr, length);
  }

  /**
      Sets whether the text is overwritten when typing
      in the [gtk.text.Text].
  
      Params:
        overwrite = new value
  */
  void setOverwriteMode(bool overwrite)
  {
    gtk_text_set_overwrite_mode(cast(GtkText*)this._cPtr, overwrite);
  }

  /**
      Sets text to be displayed in self when it is empty.
      
      This can be used to give a visual hint of the expected
      contents of the [gtk.text.Text].
  
      Params:
        text = a string to be displayed when self
            is empty and unfocused
  */
  void setPlaceholderText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_text_set_placeholder_text(cast(GtkText*)this._cPtr, _text);
  }

  /**
      Sets whether the [gtk.text.Text] should grow and shrink with the content.
  
      Params:
        propagateTextWidth = true to propagate the text width
  */
  void setPropagateTextWidth(bool propagateTextWidth)
  {
    gtk_text_set_propagate_text_width(cast(GtkText*)this._cPtr, propagateTextWidth);
  }

  /**
      Sets tabstops that are applied to the text.
  
      Params:
        tabs = a [pango.tab_array.TabArray]
  */
  void setTabs(pango.tab_array.TabArray tabs = null)
  {
    gtk_text_set_tabs(cast(GtkText*)this._cPtr, tabs ? cast(PangoTabArray*)tabs._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the [gtk.text.Text] should truncate multi-line text
      that is pasted into the widget.
  
      Params:
        truncateMultiline = true to truncate multi-line text
  */
  void setTruncateMultiline(bool truncateMultiline)
  {
    gtk_text_set_truncate_multiline(cast(GtkText*)this._cPtr, truncateMultiline);
  }

  /**
      Sets whether the contents of the [gtk.text.Text] are visible or not.
      
      When visibility is set to false, characters are displayed
      as the invisible char, and will also appear that way when
      the text in the widget is copied to the clipboard.
      
      By default, GTK picks the best invisible character available
      in the current font, but it can be changed with
      [gtk.text.Text.setInvisibleChar].
      
      Note that you probably want to set `propertyGtk.Text:input-purpose`
      to [gtk.types.InputPurpose.Password] or [gtk.types.InputPurpose.Pin] to
      inform input methods about the purpose of this self,
      in addition to setting visibility to false.
  
      Params:
        visible = true if the contents of the [gtk.text.Text] are displayed
            as plaintext
  */
  void setVisibility(bool visible)
  {
    gtk_text_set_visibility(cast(GtkText*)this._cPtr, visible);
  }

  /**
      Unsets the invisible char.
      
      After calling this, the default invisible
      char is used again.
  */
  void unsetInvisibleChar()
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
  
          $(D void callback(gtk.text.Text text))
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
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
  
          $(D void callback(gtk.text.Text text))
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBackspace(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
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
  
      Emitted to copy the selection to the clipboard.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default bindings for this signal are
      <kbd>Ctrl</kbd>+<kbd>c</kbd> and
      <kbd>Ctrl</kbd>+<kbd>Insert</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text.Text text))
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
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
  
      Emitted to cut the selection to the clipboard.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default bindings for this signal are
      <kbd>Ctrl</kbd>+<kbd>x</kbd> and
      <kbd>Shift</kbd>+<kbd>Delete</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text.Text text))
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCutClipboard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
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
  
      Emitted when the user initiates a text deletion.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      If the type is [gtk.types.DeleteType.Chars], GTK deletes the selection
      if there is one, otherwise it deletes the requested number
      of characters.
      
      The default bindings for this signal are <kbd>Delete</kbd>
      for deleting a character and <kbd>Ctrl</kbd>+<kbd>Delete</kbd>
      for deleting a word.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.DeleteType type, int count, gtk.text.Text text))
  
          `type` the granularity of the deletion, as a [gtk.types.DeleteType] (optional)
  
          `count` the number of type units to delete (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeleteFromCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DeleteType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.text.Text)))
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
      Connect to `InsertAtCursor` signal.
  
      Emitted when the user initiates the insertion of a
      fixed string at the cursor.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      This signal has no default bindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string string_, gtk.text.Text text))
  
          `string_` the string to insert (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertAtCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text.Text)))
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
  
      Emitted to present the Emoji chooser for the widget.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default bindings for this signal are
      <kbd>Ctrl</kbd>+<kbd>.</kbd> and
      <kbd>Ctrl</kbd>+<kbd>;</kbd>
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text.Text text))
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertEmoji(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
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
  
      Emitted when the user initiates a cursor movement.
      
      If the cursor is not visible in self, this signal causes
      the viewport to be moved instead.
      
      This is a [keybinding signal](class.SignalAction.html).
      
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
      )
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.MovementStep step, int count, bool extend, gtk.text.Text text))
  
          `step` the granularity of the move, as a [gtk.types.MovementStep] (optional)
  
          `count` the number of step units to move (optional)
  
          `extend` true if the move should extend the selection (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.text.Text)))
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
      Connect to `PasteClipboard` signal.
  
      Emitted to paste the contents of the clipboard.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default bindings for this signal are
      <kbd>Ctrl</kbd>+<kbd>v</kbd> and <kbd>Shift</kbd>+<kbd>Insert</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text.Text text))
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
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
  
      Emitted when the preedit text changes.
      
      If an input method is used, the typed text will not immediately
      be committed to the buffer. So if you are interested in the text,
      connect to this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string preedit, gtk.text.Text text))
  
          `preedit` the current preedit string (optional)
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text.Text)))
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
      Connect to `ToggleOverwrite` signal.
  
      Emitted to toggle the overwrite mode of the [gtk.text.Text].
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default bindings for this signal is <kbd>Insert</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text.Text text))
  
          `text` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggleOverwrite(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text.Text)))
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
