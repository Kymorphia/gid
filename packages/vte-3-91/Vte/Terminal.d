module Vte.Terminal;

import GLib.ErrorG;
import GLib.Types;
import GObject.DClosure;
import GObject.ObjectG;
import Gdk.Cursor;
import Gdk.RGBA;
import Gdk.Rectangle;
import Gid.gid;
import Gio.Cancellable;
import Gio.MenuModel;
import Gio.OutputStream;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.Scrollable;
import Gtk.ScrollableT;
import Gtk.Widget;
import Pango.FontDescription;
import Vte.Pty;
import Vte.Regex;
import Vte.Types;
import Vte.c.functions;
import Vte.c.types;
import cairo.FontOptions;

class Terminal : Widget, Scrollable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())vte_terminal_get_type != &gidSymbolNotFound ? vte_terminal_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ScrollableT!();

  /**
   * Creates a new terminal widget.
   * Returns: a new #VteTerminal object
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = vte_terminal_new();
    this(_cretval, No.Take);
  }

  /**
   * Returns a nonempty string: the target of the explicit hyperlink $(LPAREN)printed using the OSC 8
   * escape sequence$(RPAREN) at the position $(LPAREN)x, y$(RPAREN), or %NULL.
   * Proper use of the escape sequence should result in URI-encoded URIs with a proper scheme
   * like "http://", "https://", "file://", "mailto:" etc. This is, however, not enforced by VTE.
   * The caller must tolerate the returned string potentially not being a valid URI.
   * Params:
   *   x =
   *   y =
   * Returns: a newly allocated string containing the target of the hyperlink,
   *   or %NULL
   */
  string checkHyperlinkAt(double x, double y)
  {
    char* _cretval;
    _cretval = vte_terminal_check_hyperlink_at(cast(VteTerminal*)cPtr, x, y);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Checks if the text in and around the position $(LPAREN)x, y$(RPAREN) matches any of the
   * regular expressions previously set using vte_terminal_match_add$(LPAREN)$(RPAREN).  If a
   * match exists, the text string is returned and if tag is not %NULL, the number
   * associated with the matched regular expression will be stored in tag.
   * If more than one regular expression has been set with
   * vte_terminal_match_add$(LPAREN)$(RPAREN), then expressions are checked in the order in
   * which they were added.
   * Params:
   *   x =
   *   y =
   *   tag = a location to store the tag, or %NULL
   * Returns: a newly allocated string which matches one of the previously
   *   set regular expressions, or %NULL if there is no match
   */
  string checkMatchAt(double x, double y, out int tag)
  {
    char* _cretval;
    _cretval = vte_terminal_check_match_at(cast(VteTerminal*)cPtr, x, y, cast(int*)&tag);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Like [Vte.Terminal.checkRegexSimpleAt], but returns an array of strings,
   * containing the matching text $(LPAREN)or %NULL if no match$(RPAREN) corresponding to each of the
   * regexes in regexes.
   * You must free each string and the array; but note that this is *not* a %NULL-terminated
   * string array, and so you must *not* use [GLib.Global.strfreev] on it.
   * Params:
   *   x =
   *   y =
   *   regexes = an array of #VteRegex
   *   matchFlags = PCRE2 match flags, or 0
   * Returns: a newly allocated array of strings,
   *   or %NULL if none of the regexes matched
   */
  string[] checkRegexSimpleAt(double x, double y, Regex[] regexes, uint matchFlags)
  {
    char** _cretval;
    size_t _cretlength;
    size_t _nRegexes;
    if (regexes)
      _nRegexes = cast(size_t)regexes.length;

    VteRegex*[] _tmpregexes;
    foreach (obj; regexes)
      _tmpregexes ~= cast(VteRegex*)obj.cPtr;
    VteRegex** _regexes = _tmpregexes.ptr;
    _cretval = vte_terminal_check_regex_array_at(cast(VteTerminal*)cPtr, x, y, _regexes, _nRegexes, matchFlags, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * Places the selected text in the terminal in the #GDK_SELECTION_CLIPBOARD
   * selection.

   * Deprecated: Use [Vte.Terminal.copyClipboardFormat] with %VTE_FORMAT_TEXT
   *   instead.
   */
  void copyClipboard()
  {
    vte_terminal_copy_clipboard(cast(VteTerminal*)cPtr);
  }

  /**
   * Places the selected text in the terminal in the #GDK_SELECTION_CLIPBOARD
   * selection in the form specified by format.
   * For all formats, the selection data $(LPAREN)see #GtkSelectionData$(RPAREN) will include the
   * text targets $(LPAREN)see gtk_target_list_add_text_targets$(LPAREN)$(RPAREN) and
   * gtk_selection_data_targets_includes_text$(LPAREN)$(RPAREN)$(RPAREN). For %VTE_FORMAT_HTML,
   * the selection will also include the "text/html" target, which when requested,
   * returns the HTML data in UTF-16 with a U+FEFF BYTE ORDER MARK character at
   * the start.
   * Params:
   *   format = a #VteFormat
   */
  void copyClipboardFormat(Format format)
  {
    vte_terminal_copy_clipboard_format(cast(VteTerminal*)cPtr, format);
  }

  /**
   * Places the selected text in the terminal in the #GDK_SELECTION_PRIMARY
   * selection.
   */
  void copyPrimary()
  {
    vte_terminal_copy_primary(cast(VteTerminal*)cPtr);
  }

  /**
   * Interprets data as if it were data received from a child process.
   * Params:
   *   data = a string in the terminal's current encoding
   */
  void feed(ubyte[] data)
  {
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    vte_terminal_feed(cast(VteTerminal*)cPtr, _data, _length);
  }

  /**
   * Sends a block of UTF-8 text to the child as if it were entered by the user
   * at the keyboard.
   * Params:
   *   text = data to send to the child
   */
  void feedChild(ubyte[] text)
  {
    ptrdiff_t _length;
    if (text)
      _length = cast(ptrdiff_t)text.length;

    auto _text = cast(const(ubyte)*)text.ptr;
    vte_terminal_feed_child(cast(VteTerminal*)cPtr, _text, _length);
  }

  /**
   * Sends a block of binary data to the child.
   * Params:
   *   data = data to send to the child

   * Deprecated: Don't send binary data. Use [Vte.Terminal.feedChild] instead to send
   *   UTF-8 text
   */
  void feedChildBinary(ubyte[] data)
  {
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    vte_terminal_feed_child_binary(cast(VteTerminal*)cPtr, _data, _length);
  }

  /**
   * Checks whether or not the terminal will attempt to draw bold text,
   * by using a bold font variant.
   * Returns: %TRUE if bolding is enabled, %FALSE if not

   * Deprecated: There's probably no reason for this feature to exist.
   */
  bool getAllowBold()
  {
    bool _retval;
    _retval = vte_terminal_get_allow_bold(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Checks whether or not hyperlinks $(LPAREN)OSC 8 escape sequence$(RPAREN) are allowed.
   * Returns: %TRUE if hyperlinks are enabled, %FALSE if not
   */
  bool getAllowHyperlink()
  {
    bool _retval;
    _retval = vte_terminal_get_allow_hyperlink(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Checks whether or not the terminal will beep when the child outputs the
   * "bl" sequence.
   * Returns: %TRUE if audible bell is enabled, %FALSE if not
   */
  bool getAudibleBell()
  {
    bool _retval;
    _retval = vte_terminal_get_audible_bell(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Checks whether the SGR 1 attribute also switches to the bright counterpart
   * of the first 8 palette colors, in addition to making them bold $(LPAREN)legacy behavior$(RPAREN)
   * or if SGR 1 only enables bold and leaves the color intact.
   * Returns: %TRUE if bold also enables bright, %FALSE if not
   */
  bool getBoldIsBright()
  {
    bool _retval;
    _retval = vte_terminal_get_bold_is_bright(cast(VteTerminal*)cPtr);
    return _retval;
  }

  double getCellHeightScale()
  {
    double _retval;
    _retval = vte_terminal_get_cell_height_scale(cast(VteTerminal*)cPtr);
    return _retval;
  }

  double getCellWidthScale()
  {
    double _retval;
    _retval = vte_terminal_get_cell_width_scale(cast(VteTerminal*)cPtr);
    return _retval;
  }

  glong getCharHeight()
  {
    glong _retval;
    _retval = vte_terminal_get_char_height(cast(VteTerminal*)cPtr);
    return _retval;
  }

  glong getCharWidth()
  {
    glong _retval;
    _retval = vte_terminal_get_char_width(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Returns whether ambiguous-width characters are narrow or wide.
   * $(LPAREN)Note that when using a non-UTF-8 encoding set via [Vte.Terminal.setEncoding],
   * the width of ambiguous-width characters is fixed and determined by the encoding
   * itself.$(RPAREN)
   * Returns: 1 if ambiguous-width characters are narrow, or 2 if they are wide
   */
  int getCjkAmbiguousWidth()
  {
    int _retval;
    _retval = vte_terminal_get_cjk_ambiguous_width(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Returns the background colour, as used by terminal when
   * drawing the background, which may be different from
   * the color set by [Vte.Terminal.setColorBackground].
   * Note: you must only call this function while handling the
   * GtkWidget::draw signal.
   * This function is rarely useful. One use for it is if you disable
   * drawing the background $(LPAREN)see [Vte.Terminal.setClearBackground]$(RPAREN)
   * and then need to draw the background yourself.
   * Params:
   *   color = a location to store a #GdkRGBA color
   */
  void getColorBackgroundForDraw(out RGBA color)
  {
    GdkRGBA _color;
    vte_terminal_get_color_background_for_draw(cast(VteTerminal*)cPtr, &_color);
    color = new RGBA(cast(void*)&_color, No.Take);
  }

  glong getColumnCount()
  {
    glong _retval;
    _retval = vte_terminal_get_column_count(cast(VteTerminal*)cPtr);
    return _retval;
  }

  Widget getContextMenu()
  {
    GtkWidget* _cretval;
    _cretval = vte_terminal_get_context_menu(cast(VteTerminal*)cPtr);
    auto _retval = ObjectG.getDObject!Widget(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  MenuModel getContextMenuModel()
  {
    GMenuModel* _cretval;
    _cretval = vte_terminal_get_context_menu_model(cast(VteTerminal*)cPtr);
    auto _retval = ObjectG.getDObject!MenuModel(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  string getCurrentDirectoryUri()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_current_directory_uri(cast(VteTerminal*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  string getCurrentFileUri()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_current_file_uri(cast(VteTerminal*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the currently set cursor blink mode.
   * Returns: cursor blink mode.
   */
  CursorBlinkMode getCursorBlinkMode()
  {
    VteCursorBlinkMode _cretval;
    _cretval = vte_terminal_get_cursor_blink_mode(cast(VteTerminal*)cPtr);
    CursorBlinkMode _retval = cast(CursorBlinkMode)_cretval;
    return _retval;
  }

  /**
   * Reads the location of the insertion cursor and returns it.  The row
   * coordinate is absolute.
   * This method is unaware of BiDi. The returned column is logical column.
   * Params:
   *   column = a location to store the column, or %NULL
   *   row = a location to store the row, or %NULL
   */
  void getCursorPosition(out glong column, out glong row)
  {
    vte_terminal_get_cursor_position(cast(VteTerminal*)cPtr, cast(glong*)&column, cast(glong*)&row);
  }

  /**
   * Returns the currently set cursor shape.
   * Returns: cursor shape.
   */
  CursorShape getCursorShape()
  {
    VteCursorShape _cretval;
    _cretval = vte_terminal_get_cursor_shape(cast(VteTerminal*)cPtr);
    CursorShape _retval = cast(CursorShape)_cretval;
    return _retval;
  }

  /**
   * Checks whether the terminal performs bidirectional text rendering.
   * Returns: %TRUE if BiDi is enabled, %FALSE if not
   */
  bool getEnableBidi()
  {
    bool _retval;
    _retval = vte_terminal_get_enable_bidi(cast(VteTerminal*)cPtr);
    return _retval;
  }

  bool getEnableFallbackScrolling()
  {
    bool _retval;
    _retval = vte_terminal_get_enable_fallback_scrolling(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Checks whether the terminal shapes Arabic text.
   * Returns: %TRUE if Arabic shaping is enabled, %FALSE if not
   */
  bool getEnableShaping()
  {
    bool _retval;
    _retval = vte_terminal_get_enable_shaping(cast(VteTerminal*)cPtr);
    return _retval;
  }

  bool getEnableSixel()
  {
    bool _retval;
    _retval = vte_terminal_get_enable_sixel(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Determines the name of the encoding in which the terminal expects data to be
   * encoded, or %NULL if UTF-8 is in use.
   * Returns: the current encoding for the terminal

   * Deprecated: Support for non-UTF-8 is deprecated.
   */
  string getEncoding()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_encoding(cast(VteTerminal*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Queries the terminal for information about the fonts which will be
   * used to draw text in the terminal.  The actual font takes the font scale
   * into account, this is not reflected in the return value, the unscaled
   * font is returned.
   * Returns: a #PangoFontDescription describing the font the
   *   terminal uses to render text at the default font scale of 1.0.
   */
  FontDescription getFont()
  {
    const(PangoFontDescription)* _cretval;
    _cretval = vte_terminal_get_font(cast(VteTerminal*)cPtr);
    auto _retval = _cretval ? new FontDescription(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  override FontOptions getFontOptions()
  {
    const(cairo_font_options_t)* _cretval;
    _cretval = vte_terminal_get_font_options(cast(VteTerminal*)cPtr);
    auto _retval = _cretval ? new FontOptions(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  double getFontScale()
  {
    double _retval;
    _retval = vte_terminal_get_font_scale(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Checks if the terminal currently contains selected text.  Note that this
   * is different from determining if the terminal is the owner of any
   * #GtkClipboard items.
   * Returns: %TRUE if part of the text in the terminal is selected.
   */
  bool getHasSelection()
  {
    bool _retval;
    _retval = vte_terminal_get_has_selection(cast(VteTerminal*)cPtr);
    return _retval;
  }

  string getIconTitle()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_icon_title(cast(VteTerminal*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns whether the terminal allow user input.
   * Returns:
   */
  bool getInputEnabled()
  {
    bool _retval;
    _retval = vte_terminal_get_input_enabled(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Determines the value of the terminal's mouse autohide setting.  When
   * autohiding is enabled, the mouse cursor will be hidden when the user presses
   * a key and shown when the user moves the mouse.  This setting can be changed
   * using [Vte.Terminal.setMouseAutohide].
   * Returns: %TRUE if autohiding is enabled, %FALSE if not
   */
  bool getMouseAutohide()
  {
    bool _retval;
    _retval = vte_terminal_get_mouse_autohide(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Returns the #VtePty of terminal.
   * Returns: a #VtePty, or %NULL
   */
  Pty getPty()
  {
    VtePty* _cretval;
    _cretval = vte_terminal_get_pty(cast(VteTerminal*)cPtr);
    auto _retval = ObjectG.getDObject!Pty(cast(VtePty*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Checks whether or not the terminal will rewrap its contents upon resize.
   * Returns: %TRUE if rewrapping is enabled, %FALSE if not
   */
  bool getRewrapOnResize()
  {
    bool _retval;
    _retval = vte_terminal_get_rewrap_on_resize(cast(VteTerminal*)cPtr);
    return _retval;
  }

  glong getRowCount()
  {
    glong _retval;
    _retval = vte_terminal_get_row_count(cast(VteTerminal*)cPtr);
    return _retval;
  }

  bool getScrollOnInsert()
  {
    bool _retval;
    _retval = vte_terminal_get_scroll_on_insert(cast(VteTerminal*)cPtr);
    return _retval;
  }

  bool getScrollOnKeystroke()
  {
    bool _retval;
    _retval = vte_terminal_get_scroll_on_keystroke(cast(VteTerminal*)cPtr);
    return _retval;
  }

  bool getScrollOnOutput()
  {
    bool _retval;
    _retval = vte_terminal_get_scroll_on_output(cast(VteTerminal*)cPtr);
    return _retval;
  }

  bool getScrollUnitIsPixels()
  {
    bool _retval;
    _retval = vte_terminal_get_scroll_unit_is_pixels(cast(VteTerminal*)cPtr);
    return _retval;
  }

  glong getScrollbackLines()
  {
    glong _retval;
    _retval = vte_terminal_get_scrollback_lines(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Checks whether or not the terminal will allow blinking text.
   * Returns: the blinking setting
   */
  TextBlinkMode getTextBlinkMode()
  {
    VteTextBlinkMode _cretval;
    _cretval = vte_terminal_get_text_blink_mode(cast(VteTerminal*)cPtr);
    TextBlinkMode _retval = cast(TextBlinkMode)_cretval;
    return _retval;
  }

  /**
   * Returns text from the visible part of the terminal in the specified format.
   * This method is unaware of BiDi. The columns returned in attributes are
   * logical columns.
   * Params:
   *   format = the #VteFormat to use
   * Returns: a newly allocated text string, or %NULL.
   */
  string getTextFormat(Format format)
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_format(cast(VteTerminal*)cPtr, format);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Returns the specified range of text in the specified format.
   * Params:
   *   format = the #VteFormat to use
   *   startRow = the first row of the range
   *   startCol = the first column of the range
   *   endRow = the last row of the range
   *   endCol = the last column of the range
   *   length = a pointer to a #gsize to store the string length
   * Returns: a newly allocated string, or %NULL.
   */
  string getTextRangeFormat(Format format, glong startRow, glong startCol, glong endRow, glong endCol, out size_t length)
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_range_format(cast(VteTerminal*)cPtr, format, startRow, startCol, endRow, endCol, cast(size_t*)&length);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the currently selected text in the format specified by format.
   * Since 0.72, this function also supports %VTE_FORMAT_HTML format.
   * Params:
   *   format = the #VteFormat to use
   * Returns: a newly allocated string containing the selected text, or %NULL if there is no selection or the format is not supported
   */
  string getTextSelected(Format format)
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_selected(cast(VteTerminal*)cPtr, format);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the currently selected text in the format specified by format.
   * Params:
   *   format = the #VteFormat to use
   *   length = a pointer to a #gsize to store the string length
   * Returns: a newly allocated string containing the selected text, or %NULL if there is no selection or the format is not supported
   */
  string getTextSelectedFull(Format format, out size_t length)
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_selected_full(cast(VteTerminal*)cPtr, format, cast(size_t*)&length);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  string getWindowTitle()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_window_title(cast(VteTerminal*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the set of characters which will be considered parts of a word
   * when doing word-wise selection, in addition to the default which only
   * considers alphanumeric characters part of a word.
   * If %NULL, a built-in set is used.
   * Returns: a string, or %NULL
   */
  string getWordCharExceptions()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_word_char_exceptions(cast(VteTerminal*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  Align getXalign()
  {
    VteAlign _cretval;
    _cretval = vte_terminal_get_xalign(cast(VteTerminal*)cPtr);
    Align _retval = cast(Align)_cretval;
    return _retval;
  }

  bool getXfill()
  {
    bool _retval;
    _retval = vte_terminal_get_xfill(cast(VteTerminal*)cPtr);
    return _retval;
  }

  Align getYalign()
  {
    VteAlign _cretval;
    _cretval = vte_terminal_get_yalign(cast(VteTerminal*)cPtr);
    Align _retval = cast(Align)_cretval;
    return _retval;
  }

  bool getYfill()
  {
    bool _retval;
    _retval = vte_terminal_get_yfill(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Adds the regular expression regex to the list of matching expressions.  When the
   * user moves the mouse cursor over a section of displayed text which matches
   * this expression, the text will be highlighted.
   * Note that regex should have been created using the <literal>PCRE2_MULTILINE</literal>
   * flag.
   * Params:
   *   regex = a #VteRegex
   *   flags = PCRE2 match flags, or 0
   * Returns: an integer associated with this expression
   */
  int matchAddRegex(Regex regex, uint flags)
  {
    int _retval;
    _retval = vte_terminal_match_add_regex(cast(VteTerminal*)cPtr, regex ? cast(VteRegex*)regex.cPtr(No.Dup) : null, flags);
    return _retval;
  }

  /**
   * Checks if the text in and around the specified position matches any of the
   * regular expressions previously set using vte_terminal_match_add$(LPAREN)$(RPAREN).  If a
   * match exists, the text string is returned and if tag is not %NULL, the number
   * associated with the matched regular expression will be stored in tag.
   * If more than one regular expression has been set with
   * vte_terminal_match_add$(LPAREN)$(RPAREN), then expressions are checked in the order in
   * which they were added.
   * Params:
   *   column = the text column
   *   row = the text row
   *   tag = a location to store the tag, or %NULL
   * Returns: a newly allocated string which matches one of the previously
   *   set regular expressions

   * Deprecated: Use vte_terminal_match_check_event$(LPAREN)$(RPAREN) instead.
   */
  string matchCheck(glong column, glong row, out int tag)
  {
    char* _cretval;
    _cretval = vte_terminal_match_check(cast(VteTerminal*)cPtr, column, row, cast(int*)&tag);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Removes the regular expression which is associated with the given tag from
   * the list of expressions which the terminal will highlight when the user
   * moves the mouse cursor over matching text.
   * Params:
   *   tag = the tag of the regex to remove
   */
  void matchRemove(int tag)
  {
    vte_terminal_match_remove(cast(VteTerminal*)cPtr, tag);
  }

  /**
   * Clears the list of regular expressions the terminal uses to highlight text
   * when the user moves the mouse cursor.
   */
  void matchRemoveAll()
  {
    vte_terminal_match_remove_all(cast(VteTerminal*)cPtr);
  }

  /**
   * Sets which cursor the terminal will use if the pointer is over the pattern
   * specified by tag.  The terminal keeps a reference to cursor.
   * Params:
   *   tag = the tag of the regex which should use the specified cursor
   *   cursor = the #GdkCursor which the terminal should use when the pattern is
   *     highlighted, or %NULL to use the standard cursor

   * Deprecated: Use [Vte.Terminal.matchSetCursorName] instead.
   */
  void matchSetCursor(int tag, Cursor cursor)
  {
    vte_terminal_match_set_cursor(cast(VteTerminal*)cPtr, tag, cursor ? cast(GdkCursor*)cursor.cPtr(No.Dup) : null);
  }

  /**
   * Sets which cursor the terminal will use if the pointer is over the pattern
   * specified by tag.
   * Params:
   *   tag = the tag of the regex which should use the specified cursor
   *   cursorName = the name of the cursor
   */
  void matchSetCursorName(int tag, string cursorName)
  {
    const(char)* _cursorName = cursorName.toCString(No.Alloc);
    vte_terminal_match_set_cursor_name(cast(VteTerminal*)cPtr, tag, _cursorName);
  }

  /**
   * Sends the contents of the #GDK_SELECTION_CLIPBOARD selection to the
   * terminal's child. It's called on paste menu item, or when
   * user presses Shift+Insert.
   */
  void pasteClipboard()
  {
    vte_terminal_paste_clipboard(cast(VteTerminal*)cPtr);
  }

  /**
   * Sends the contents of the #GDK_SELECTION_PRIMARY selection to the terminal's
   * child. The terminal will call also paste the
   * #GDK_SELECTION_PRIMARY selection when the user clicks with the the second
   * mouse button.
   */
  void pastePrimary()
  {
    vte_terminal_paste_primary(cast(VteTerminal*)cPtr);
  }

  /**
   * Sends text to the terminal's child as if retrived from the clipboard,
   * this differs from [Vte.Terminal.feedChild] in that it may process
   * text before passing it to the child $(LPAREN)e.g. apply bracketed mode$(RPAREN)
   * Params:
   *   text = a string to paste
   */
  void pasteText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    vte_terminal_paste_text(cast(VteTerminal*)cPtr, _text);
  }

  /**
   * Creates a new #VtePty, sets the emulation property
   * from #VteTerminal:emulation, and sets the size using
   * terminal's size.
   * See vte_pty_new$(LPAREN)$(RPAREN) for more information.
   * Params:
   *   flags = flags from #VtePtyFlags
   *   cancellable = a #GCancellable, or %NULL
   * Returns: a new #VtePty
   */
  Pty ptyNewSync(PtyFlags flags, Cancellable cancellable)
  {
    VtePty* _cretval;
    GError *_err;
    _cretval = vte_terminal_pty_new_sync(cast(VteTerminal*)cPtr, flags, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Pty(cast(VtePty*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Resets as much of the terminal's internal state as possible, discarding any
   * unprocessed input data, resetting character attributes, cursor state,
   * national character set state, status line, terminal modes $(LPAREN)insert/delete$(RPAREN),
   * selection state, and encoding.
   * Params:
   *   clearTabstops = whether to reset tabstops
   *   clearHistory = whether to empty the terminal's scrollback buffer
   */
  void reset(bool clearTabstops, bool clearHistory)
  {
    vte_terminal_reset(cast(VteTerminal*)cPtr, clearTabstops, clearHistory);
  }

  /**
   * Searches the next string matching the search regex set with
   * [Vte.Terminal.searchSetRegex].
   * Returns: %TRUE if a match was found
   */
  bool searchFindNext()
  {
    bool _retval;
    _retval = vte_terminal_search_find_next(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Searches the previous string matching the search regex set with
   * [Vte.Terminal.searchSetRegex].
   * Returns: %TRUE if a match was found
   */
  bool searchFindPrevious()
  {
    bool _retval;
    _retval = vte_terminal_search_find_previous(cast(VteTerminal*)cPtr);
    return _retval;
  }

  Regex searchGetRegex()
  {
    VteRegex* _cretval;
    _cretval = vte_terminal_search_get_regex(cast(VteTerminal*)cPtr);
    auto _retval = _cretval ? new Regex(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  bool searchGetWrapAround()
  {
    bool _retval;
    _retval = vte_terminal_search_get_wrap_around(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
   * Sets the regex to search for. Unsets the search regex when passed %NULL.
   * Note that regex should have been created using the
   * <literal>PCRE2_MULTILINE</literal> flag.
   * Params:
   *   regex = a #VteRegex, or %NULL
   *   flags = PCRE2 match flags, or 0
   */
  void searchSetRegex(Regex regex, uint flags)
  {
    vte_terminal_search_set_regex(cast(VteTerminal*)cPtr, regex ? cast(VteRegex*)regex.cPtr(No.Dup) : null, flags);
  }

  /**
   * Sets whether search should wrap around to the beginning of the
   * terminal content when reaching its end.
   * Params:
   *   wrapAround = whether search should wrap
   */
  void searchSetWrapAround(bool wrapAround)
  {
    vte_terminal_search_set_wrap_around(cast(VteTerminal*)cPtr, wrapAround);
  }

  /**
   * Selects all text within the terminal $(LPAREN)not including the scrollback buffer$(RPAREN).
   */
  void selectAll()
  {
    vte_terminal_select_all(cast(VteTerminal*)cPtr);
  }

  /**
   * Controls whether or not the terminal will attempt to draw bold text,
   * by using a bold font variant.
   * Params:
   *   allowBold = %TRUE if the terminal should attempt to draw bold text

   * Deprecated: There's probably no reason for this feature to exist.
   */
  void setAllowBold(bool allowBold)
  {
    vte_terminal_set_allow_bold(cast(VteTerminal*)cPtr, allowBold);
  }

  /**
   * Controls whether or not hyperlinks $(LPAREN)OSC 8 escape sequence$(RPAREN) are allowed.
   * Params:
   *   allowHyperlink = %TRUE if the terminal should allow hyperlinks
   */
  void setAllowHyperlink(bool allowHyperlink)
  {
    vte_terminal_set_allow_hyperlink(cast(VteTerminal*)cPtr, allowHyperlink);
  }

  /**
   * Controls whether or not the terminal will beep when the child outputs the
   * "bl" sequence.
   * Params:
   *   isAudible = %TRUE if the terminal should beep
   */
  void setAudibleBell(bool isAudible)
  {
    vte_terminal_set_audible_bell(cast(VteTerminal*)cPtr, isAudible);
  }

  /**
   * Modifies the terminal's backspace key binding, which controls what
   * string or control sequence the terminal sends to its child when the user
   * presses the backspace key.
   * Params:
   *   binding = a #VteEraseBinding for the backspace key
   */
  void setBackspaceBinding(EraseBinding binding)
  {
    vte_terminal_set_backspace_binding(cast(VteTerminal*)cPtr, binding);
  }

  /**
   * Sets whether the SGR 1 attribute also switches to the bright counterpart
   * of the first 8 palette colors, in addition to making them bold $(LPAREN)legacy behavior$(RPAREN)
   * or if SGR 1 only enables bold and leaves the color intact.
   * Params:
   *   boldIsBright = %TRUE if bold should also enable bright
   */
  void setBoldIsBright(bool boldIsBright)
  {
    vte_terminal_set_bold_is_bright(cast(VteTerminal*)cPtr, boldIsBright);
  }

  /**
   * Sets the terminal's cell height scale to scale.
   * This can be used to increase the line spacing. $(LPAREN)The font's height is not affected.$(RPAREN)
   * Valid values go from 1.0 $(LPAREN)default$(RPAREN) to 2.0 $(LPAREN)"double spacing"$(RPAREN).
   * Params:
   *   scale = the cell height scale
   */
  void setCellHeightScale(double scale)
  {
    vte_terminal_set_cell_height_scale(cast(VteTerminal*)cPtr, scale);
  }

  /**
   * Sets the terminal's cell width scale to scale.
   * This can be used to increase the letter spacing. $(LPAREN)The font's width is not affected.$(RPAREN)
   * Valid values go from 1.0 $(LPAREN)default$(RPAREN) to 2.0.
   * Params:
   *   scale = the cell width scale
   */
  void setCellWidthScale(double scale)
  {
    vte_terminal_set_cell_width_scale(cast(VteTerminal*)cPtr, scale);
  }

  /**
   * This setting controls whether ambiguous-width characters are narrow or wide.
   * $(LPAREN)Note that when using a non-UTF-8 encoding set via [Vte.Terminal.setEncoding],
   * the width of ambiguous-width characters is fixed and determined by the encoding
   * itself.$(RPAREN)
   * Params:
   *   width = either 1 $(LPAREN)narrow$(RPAREN) or 2 $(LPAREN)wide$(RPAREN)
   */
  void setCjkAmbiguousWidth(int width)
  {
    vte_terminal_set_cjk_ambiguous_width(cast(VteTerminal*)cPtr, width);
  }

  /**
   * Sets whether to paint the background with the background colour.
   * The default is %TRUE.
   * This function is rarely useful. One use for it is to add a background
   * image to the terminal.
   * Params:
   *   setting = whether to clear the background
   */
  void setClearBackground(bool setting)
  {
    vte_terminal_set_clear_background(cast(VteTerminal*)cPtr, setting);
  }

  /**
   * Sets the background color for text which does not have a specific background
   * color assigned.  Only has effect when no background image is set and when
   * the terminal is not transparent.
   * Params:
   *   background = the new background color
   */
  void setColorBackground(RGBA background)
  {
    vte_terminal_set_color_background(cast(VteTerminal*)cPtr, background ? cast(GdkRGBA*)background.cPtr(No.Dup) : null);
  }

  /**
   * Sets the color used to draw bold text in the default foreground color.
   * If bold is %NULL then the default color is used.
   * Params:
   *   bold = the new bold color or %NULL
   */
  void setColorBold(RGBA bold)
  {
    vte_terminal_set_color_bold(cast(VteTerminal*)cPtr, bold ? cast(GdkRGBA*)bold.cPtr(No.Dup) : null);
  }

  /**
   * Sets the background color for text which is under the cursor.  If %NULL, text
   * under the cursor will be drawn with foreground and background colors
   * reversed.
   * Params:
   *   cursorBackground = the new color to use for the text cursor, or %NULL
   */
  void setColorCursor(RGBA cursorBackground)
  {
    vte_terminal_set_color_cursor(cast(VteTerminal*)cPtr, cursorBackground ? cast(GdkRGBA*)cursorBackground.cPtr(No.Dup) : null);
  }

  /**
   * Sets the foreground color for text which is under the cursor.  If %NULL, text
   * under the cursor will be drawn with foreground and background colors
   * reversed.
   * Params:
   *   cursorForeground = the new color to use for the text cursor, or %NULL
   */
  void setColorCursorForeground(RGBA cursorForeground)
  {
    vte_terminal_set_color_cursor_foreground(cast(VteTerminal*)cPtr, cursorForeground ? cast(GdkRGBA*)cursorForeground.cPtr(No.Dup) : null);
  }

  /**
   * Sets the foreground color used to draw normal text.
   * Params:
   *   foreground = the new foreground color
   */
  void setColorForeground(RGBA foreground)
  {
    vte_terminal_set_color_foreground(cast(VteTerminal*)cPtr, foreground ? cast(GdkRGBA*)foreground.cPtr(No.Dup) : null);
  }

  /**
   * Sets the background color for text which is highlighted.  If %NULL,
   * it is unset.  If neither highlight background nor highlight foreground are set,
   * highlighted text $(LPAREN)which is usually highlighted because it is selected$(RPAREN) will
   * be drawn with foreground and background colors reversed.
   * Params:
   *   highlightBackground = the new color to use for highlighted text, or %NULL
   */
  void setColorHighlight(RGBA highlightBackground)
  {
    vte_terminal_set_color_highlight(cast(VteTerminal*)cPtr, highlightBackground ? cast(GdkRGBA*)highlightBackground.cPtr(No.Dup) : null);
  }

  /**
   * Sets the foreground color for text which is highlighted.  If %NULL,
   * it is unset.  If neither highlight background nor highlight foreground are set,
   * highlighted text $(LPAREN)which is usually highlighted because it is selected$(RPAREN) will
   * be drawn with foreground and background colors reversed.
   * Params:
   *   highlightForeground = the new color to use for highlighted text, or %NULL
   */
  void setColorHighlightForeground(RGBA highlightForeground)
  {
    vte_terminal_set_color_highlight_foreground(cast(VteTerminal*)cPtr, highlightForeground ? cast(GdkRGBA*)highlightForeground.cPtr(No.Dup) : null);
  }

  /**
   * palette specifies the new values for the 256 palette colors: 8 standard colors,
   * their 8 bright counterparts, 6x6x6 color cube, and 24 grayscale colors.
   * Omitted entries will default to a hardcoded value.
   * palette_size must be 0, 8, 16, 232 or 256.
   * If foreground is %NULL and palette_size is greater than 0, the new foreground
   * color is taken from palette[7].  If background is %NULL and palette_size is
   * greater than 0, the new background color is taken from palette[0].
   * Params:
   *   foreground = the new foreground color, or %NULL
   *   background = the new background color, or %NULL
   *   palette = the color palette
   */
  void setColors(RGBA foreground, RGBA background, RGBA[] palette)
  {
    size_t _paletteSize;
    if (palette)
      _paletteSize = cast(size_t)palette.length;

    GdkRGBA[] _tmppalette;
    foreach (obj; palette)
      _tmppalette ~= *cast(GdkRGBA*)obj.cPtr;
    const(GdkRGBA)* _palette = _tmppalette.ptr;
    vte_terminal_set_colors(cast(VteTerminal*)cPtr, foreground ? cast(GdkRGBA*)foreground.cPtr(No.Dup) : null, background ? cast(GdkRGBA*)background.cPtr(No.Dup) : null, _palette, _paletteSize);
  }

  /**
   * Sets menu as the context menu in terminal.
   * Use %NULL to unset the current menu.
   * Note that a menu model set with [Vte.Terminal.setContextMenuModel]
   * takes precedence over a menu set using this function.
   * Params:
   *   menu = a menu
   */
  void setContextMenu(Widget menu)
  {
    vte_terminal_set_context_menu(cast(VteTerminal*)cPtr, menu ? cast(GtkWidget*)menu.cPtr(No.Dup) : null);
  }

  /**
   * Sets model as the context menu model in terminal.
   * Use %NULL to unset the current menu model.
   * Params:
   *   model = a #GMenuModel
   */
  void setContextMenuModel(MenuModel model)
  {
    vte_terminal_set_context_menu_model(cast(VteTerminal*)cPtr, model ? cast(GMenuModel*)model.cPtr(No.Dup) : null);
  }

  /**
   * Sets whether or not the cursor will blink. Using %VTE_CURSOR_BLINK_SYSTEM
   * will use the #GtkSettings::gtk-cursor-blink setting.
   * Params:
   *   mode = the #VteCursorBlinkMode to use
   */
  void setCursorBlinkMode(CursorBlinkMode mode)
  {
    vte_terminal_set_cursor_blink_mode(cast(VteTerminal*)cPtr, mode);
  }

  /**
   * Sets the shape of the cursor drawn.
   * Params:
   *   shape = the #VteCursorShape to use
   */
  void setCursorShape(CursorShape shape)
  {
    vte_terminal_set_cursor_shape(cast(VteTerminal*)cPtr, shape);
  }

  /**
   * Reset the terminal palette to reasonable compiled-in default color.
   */
  void setDefaultColors()
  {
    vte_terminal_set_default_colors(cast(VteTerminal*)cPtr);
  }

  /**
   * Modifies the terminal's delete key binding, which controls what
   * string or control sequence the terminal sends to its child when the user
   * presses the delete key.
   * Params:
   *   binding = a #VteEraseBinding for the delete key
   */
  void setDeleteBinding(EraseBinding binding)
  {
    vte_terminal_set_delete_binding(cast(VteTerminal*)cPtr, binding);
  }

  /**
   * Controls whether or not the terminal will perform bidirectional text rendering.
   * Params:
   *   enableBidi = %TRUE to enable BiDi support
   */
  void setEnableBidi(bool enableBidi)
  {
    vte_terminal_set_enable_bidi(cast(VteTerminal*)cPtr, enableBidi);
  }

  /**
   * Controls whether the terminal uses scroll events to scroll the history
   * if the event was not otherwise consumed by it.
   * This function is rarely useful, except when the terminal is added to a
   * #GtkScrolledWindow, to perform kinetic scrolling $(LPAREN)while vte itself does
   * not, yet, implement kinetic scrolling by itself$(RPAREN).
   * Params:
   *   enable = whether to enable fallback scrolling
   */
  void setEnableFallbackScrolling(bool enable)
  {
    vte_terminal_set_enable_fallback_scrolling(cast(VteTerminal*)cPtr, enable);
  }

  /**
   * Controls whether or not the terminal will shape Arabic text.
   * Params:
   *   enableShaping = %TRUE to enable Arabic shaping
   */
  void setEnableShaping(bool enableShaping)
  {
    vte_terminal_set_enable_shaping(cast(VteTerminal*)cPtr, enableShaping);
  }

  /**
   * Set whether to enable SIXEL images.
   * Params:
   *   enabled = whether to enable SIXEL images
   */
  void setEnableSixel(bool enabled)
  {
    vte_terminal_set_enable_sixel(cast(VteTerminal*)cPtr, enabled);
  }

  /**
   * Changes the encoding the terminal will expect data from the child to
   * be encoded with.  For certain terminal types, applications executing in the
   * terminal can change the encoding. If codeset is %NULL, it uses "UTF-8".
   * Note: Support for non-UTF-8 is deprecated and may get removed altogether.
   * Instead of this function, you should use a wrapper like luit$(LPAREN)1$(RPAREN) when
   * spawning the child process.
   * Params:
   *   codeset = target charset, or %NULL to use UTF-8
   * Returns: %TRUE if the encoding could be changed to the specified one,
   *   or %FALSE with error set to %G_CONVERT_ERROR_NO_CONVERSION.

   * Deprecated: Support for non-UTF-8 is deprecated.
   */
  bool setEncoding(string codeset)
  {
    bool _retval;
    const(char)* _codeset = codeset.toCString(No.Alloc);
    GError *_err;
    _retval = vte_terminal_set_encoding(cast(VteTerminal*)cPtr, _codeset, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Sets the font used for rendering all text displayed by the terminal,
   * overriding any fonts set using gtk_widget_modify_font$(LPAREN)$(RPAREN).  The terminal
   * will immediately attempt to load the desired font, retrieve its
   * metrics, and attempt to resize itself to keep the same number of rows
   * and columns.  The font scale is applied to the specified font.
   * Params:
   *   fontDesc = a #PangoFontDescription for the desired font, or %NULL
   */
  void setFont(FontDescription fontDesc)
  {
    vte_terminal_set_font(cast(VteTerminal*)cPtr, fontDesc ? cast(PangoFontDescription*)fontDesc.cPtr(No.Dup) : null);
  }

  /**
   * Sets the terminal's font options to options.
   * Note that on GTK4, the terminal by default uses font options
   * with %CAIRO_HINT_METRICS_ON set; to override that, use this
   * function to set a #cairo_font_options_t that has
   * %CAIRO_HINT_METRICS_OFF set.
   * Params:
   *   fontOptions = the font options, or %NULL
   */
  override void setFontOptions(FontOptions fontOptions)
  {
    vte_terminal_set_font_options(cast(VteTerminal*)cPtr, fontOptions ? cast(cairo_font_options_t*)fontOptions.cPtr(No.Dup) : null);
  }

  /**
   * Sets the terminal's font scale to scale.
   * Params:
   *   scale = the font scale
   */
  void setFontScale(double scale)
  {
    vte_terminal_set_font_scale(cast(VteTerminal*)cPtr, scale);
  }

  /**
   * Enables or disables user input. When user input is disabled,
   * the terminal's child will not receive any key press, or mouse button
   * press or motion events sent to it.
   * Params:
   *   enabled = whether to enable user input
   */
  void setInputEnabled(bool enabled)
  {
    vte_terminal_set_input_enabled(cast(VteTerminal*)cPtr, enabled);
  }

  /**
   * Changes the value of the terminal's mouse autohide setting.  When autohiding
   * is enabled, the mouse cursor will be hidden when the user presses a key and
   * shown when the user moves the mouse.  This setting can be read using
   * [Vte.Terminal.getMouseAutohide].
   * Params:
   *   setting = whether the mouse pointer should autohide
   */
  void setMouseAutohide(bool setting)
  {
    vte_terminal_set_mouse_autohide(cast(VteTerminal*)cPtr, setting);
  }

  /**
   * Sets pty as the PTY to use in terminal.
   * Use %NULL to unset the PTY.
   * Params:
   *   pty = a #VtePty, or %NULL
   */
  void setPty(Pty pty)
  {
    vte_terminal_set_pty(cast(VteTerminal*)cPtr, pty ? cast(VtePty*)pty.cPtr(No.Dup) : null);
  }

  /**
   * Controls whether or not the terminal will rewrap its contents, including
   * the scrollback history, whenever the terminal's width changes.
   * Params:
   *   rewrap = %TRUE if the terminal should rewrap on resize
   */
  void setRewrapOnResize(bool rewrap)
  {
    vte_terminal_set_rewrap_on_resize(cast(VteTerminal*)cPtr, rewrap);
  }

  /**
   * Controls whether or not the terminal will forcibly scroll to the bottom of
   * the viewable history when text is inserted, e.g. by a paste.
   * Params:
   *   scroll = whether the terminal should scroll on insert
   */
  void setScrollOnInsert(bool scroll)
  {
    vte_terminal_set_scroll_on_insert(cast(VteTerminal*)cPtr, scroll);
  }

  /**
   * Controls whether or not the terminal will forcibly scroll to the bottom of
   * the viewable history when the user presses a key.  Modifier keys do not
   * trigger this behavior.
   * Params:
   *   scroll = whether the terminal should scroll on keystrokes
   */
  void setScrollOnKeystroke(bool scroll)
  {
    vte_terminal_set_scroll_on_keystroke(cast(VteTerminal*)cPtr, scroll);
  }

  /**
   * Controls whether or not the terminal will forcibly scroll to the bottom of
   * the viewable history when the new data is received from the child.
   * Params:
   *   scroll = whether the terminal should scroll on output
   */
  void setScrollOnOutput(bool scroll)
  {
    vte_terminal_set_scroll_on_output(cast(VteTerminal*)cPtr, scroll);
  }

  /**
   * Controls whether the terminal's scroll unit is lines or pixels.
   * This function is rarely useful, except when the terminal is added to a
   * #GtkScrolledWindow.
   * Params:
   *   enable = whether to use pixels as scroll unit
   */
  void setScrollUnitIsPixels(bool enable)
  {
    vte_terminal_set_scroll_unit_is_pixels(cast(VteTerminal*)cPtr, enable);
  }

  /**
   * Sets the length of the scrollback buffer used by the terminal.  The size of
   * the scrollback buffer will be set to the larger of this value and the number
   * of visible rows the widget can display, so 0 can safely be used to disable
   * scrollback.
   * A negative value means "infinite scrollback".
   * Using a large scrollback buffer $(LPAREN)roughly 1M+ lines$(RPAREN) may lead to performance
   * degradation or exhaustion of system resources, and is therefore not recommended.
   * Note that this setting only affects the normal screen buffer.
   * No scrollback is allowed on the alternate screen buffer.
   * Params:
   *   lines = the length of the history buffer
   */
  void setScrollbackLines(glong lines)
  {
    vte_terminal_set_scrollback_lines(cast(VteTerminal*)cPtr, lines);
  }

  /**
   * Attempts to change the terminal's size in terms of rows and columns.  If
   * the attempt succeeds, the widget will resize itself to the proper size.
   * Params:
   *   columns = the desired number of columns
   *   rows = the desired number of rows
   */
  void setSize(glong columns, glong rows)
  {
    vte_terminal_set_size(cast(VteTerminal*)cPtr, columns, rows);
  }

  /**
   * Controls whether or not the terminal will allow blinking text.
   * Params:
   *   textBlinkMode = the #VteTextBlinkMode to use
   */
  void setTextBlinkMode(TextBlinkMode textBlinkMode)
  {
    vte_terminal_set_text_blink_mode(cast(VteTerminal*)cPtr, textBlinkMode);
  }

  /**
   * With this function you can provide a set of characters which will
   * be considered parts of a word when doing word-wise selection, in
   * addition to the default which only considers alphanumeric characters
   * part of a word.
   * The characters in exceptions must be non-alphanumeric, each character
   * must occur only once, and if exceptions contains the character
   * U+002D HYPHEN-MINUS, it must be at the start of the string.
   * Use %NULL to reset the set of exception characters to the default.
   * Params:
   *   exceptions = a string of ASCII punctuation characters, or %NULL
   */
  void setWordCharExceptions(string exceptions)
  {
    const(char)* _exceptions = exceptions.toCString(No.Alloc);
    vte_terminal_set_word_char_exceptions(cast(VteTerminal*)cPtr, _exceptions);
  }

  /**
   * Sets the horizontal alignment of terminal within its allocation.
   * Note: %VTE_ALIGN_START_FILL is not supported, and will be treated
   * like %VTE_ALIGN_START.
   * Params:
   *   align_ = alignment value from #VteAlign
   */
  void setXalign(Align align_)
  {
    vte_terminal_set_xalign(cast(VteTerminal*)cPtr, align_);
  }

  /**
   * Sets the horizontal fillment of terminal within its allocation.
   * Note: %VTE_FILL_START_FILL is not supported, and will be treated
   * like %VTE_FILL_START.
   * Params:
   *   fill = fillment value from #VteFill
   */
  void setXfill(bool fill)
  {
    vte_terminal_set_xfill(cast(VteTerminal*)cPtr, fill);
  }

  /**
   * Sets the vertical alignment of terminal within its allocation.
   * Params:
   *   align_ = alignment value from #VteAlign
   */
  void setYalign(Align align_)
  {
    vte_terminal_set_yalign(cast(VteTerminal*)cPtr, align_);
  }

  /**
   * Sets the vertical fillment of terminal within its allocation.
   * Note that yfill is only supported with yalign set to
   * %VTE_ALIGN_START, and is ignored for all other yalign values.
   * Params:
   *   fill = fillment value from #VteFill
   */
  void setYfill(bool fill)
  {
    vte_terminal_set_yfill(cast(VteTerminal*)cPtr, fill);
  }

  /**
   * Clears the current selection.
   */
  void unselectAll()
  {
    vte_terminal_unselect_all(cast(VteTerminal*)cPtr);
  }

  /**
   * Watches child_pid. When the process exists, the #VteTerminal::child-exited
   * signal will be called with the child's exit status.
   * Prior to calling this function, a #VtePty must have been set in terminal
   * using [Vte.Terminal.setPty].
   * When the child exits, the terminal's #VtePty will be set to %NULL.
   * Note: [GLib.Global.childWatchAdd] or [GLib.Global.childWatchAddFull] must not have
   * been called for child_pid, nor a #GSource for it been created with
   * [GLib.Global.childWatchSourceNew].
   * Note: when using the [GLib.Global.spawnAsync] family of functions,
   * the %G_SPAWN_DO_NOT_REAP_CHILD flag MUST have been passed.
   * Params:
   *   childPid = a #GPid
   */
  void watchChild(Pid childPid)
  {
    vte_terminal_watch_child(cast(VteTerminal*)cPtr, childPid);
  }

  /**
   * Write contents of the current contents of terminal $(LPAREN)including any
   * scrollback history$(RPAREN) to stream according to flags.
   * If cancellable is not %NULL, then the operation can be cancelled by triggering
   * the cancellable object from another thread. If the operation was cancelled,
   * the error %G_IO_ERROR_CANCELLED will be returned in error.
   * This is a synchronous operation and will make the widget $(LPAREN)and input
   * processing$(RPAREN) during the write operation, which may take a long time
   * depending on scrollback history and stream availability for writing.
   * Params:
   *   stream = a #GOutputStream to write to
   *   flags = a set of #VteWriteFlags
   *   cancellable = a #GCancellable object, or %NULL
   * Returns: %TRUE on success, %FALSE if there was an error
   */
  bool writeContentsSync(OutputStream stream, WriteFlags flags, Cancellable cancellable)
  {
    bool _retval;
    GError *_err;
    _retval = vte_terminal_write_contents_sync(cast(VteTerminal*)cPtr, stream ? cast(GOutputStream*)stream.cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * This signal is emitted when the a child sends a bell request to the
   * terminal.
   *   terminal = the instance the signal is connected to
   */
  alias BellCallbackDlg = void delegate(Terminal terminal);
  alias BellCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to Bell signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectBell(T)(T callback, Flag!"After" after = No.After)
  if (is(T : BellCallbackDlg) || is(T : BellCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("bell", closure, after);
  }

  /**
   * Emitted whenever the cell size changes, e.g. due to a change in
   * font, font-scale or cell-width/height-scale.
   * Note that this signal should rather be called "cell-size-changed".
   * Params
   *   width = the new character cell width
   *   height = the new character cell height
   *   terminal = the instance the signal is connected to
   */
  alias CharSizeChangedCallbackDlg = void delegate(uint width, uint height, Terminal terminal);
  alias CharSizeChangedCallbackFunc = void function(uint width, uint height, Terminal terminal);

  /**
   * Connect to CharSizeChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCharSizeChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CharSizeChangedCallbackDlg) || is(T : CharSizeChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      auto width = getVal!uint(&_paramVals[1]);
      auto height = getVal!uint(&_paramVals[2]);
      _dClosure.dlg(width, height, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("char-size-changed", closure, after);
  }

  /**
   * This signal is emitted when the terminal detects that a child
   * watched using [Vte.Terminal.watchChild] has exited.
   * Params
   *   status = the child's exit status
   *   terminal = the instance the signal is connected to
   */
  alias ChildExitedCallbackDlg = void delegate(int status, Terminal terminal);
  alias ChildExitedCallbackFunc = void function(int status, Terminal terminal);

  /**
   * Connect to ChildExited signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChildExited(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChildExitedCallbackDlg) || is(T : ChildExitedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      auto status = getVal!int(&_paramVals[1]);
      _dClosure.dlg(status, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-exited", closure, after);
  }

  /**
   * Emitted whenever the terminal receives input from the user and
   * prepares to send it to the child process.
   * Params
   *   text = a string of text
   *   size = the length of that string of text
   *   terminal = the instance the signal is connected to
   */
  alias CommitCallbackDlg = void delegate(string text, uint size, Terminal terminal);
  alias CommitCallbackFunc = void function(string text, uint size, Terminal terminal);

  /**
   * Connect to Commit signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCommit(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CommitCallbackDlg) || is(T : CommitCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      auto text = getVal!string(&_paramVals[1]);
      auto size = getVal!uint(&_paramVals[2]);
      _dClosure.dlg(text, size, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("commit", closure, after);
  }

  /**
   * Emitted whenever the visible appearance of the terminal has changed.
   * Used primarily by #VteTerminalAccessible.
   *   terminal = the instance the signal is connected to
   */
  alias ContentsChangedCallbackDlg = void delegate(Terminal terminal);
  alias ContentsChangedCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to ContentsChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectContentsChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ContentsChangedCallbackDlg) || is(T : ContentsChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("contents-changed", closure, after);
  }

  /**
   * Emitted whenever [Vte.Terminal.copyClipboard] is called.
   *   terminal = the instance the signal is connected to
   */
  alias CopyClipboardCallbackDlg = void delegate(Terminal terminal);
  alias CopyClipboardCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to CopyClipboard signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CopyClipboardCallbackDlg) || is(T : CopyClipboardCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
   * Emitted when the current directory URI is modified.
   *   terminal = the instance the signal is connected to
   */
  alias CurrentDirectoryUriChangedCallbackDlg = void delegate(Terminal terminal);
  alias CurrentDirectoryUriChangedCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to CurrentDirectoryUriChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCurrentDirectoryUriChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CurrentDirectoryUriChangedCallbackDlg) || is(T : CurrentDirectoryUriChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("current-directory-uri-changed", closure, after);
  }

  /**
   * Emitted when the current file URI is modified.
   *   terminal = the instance the signal is connected to
   */
  alias CurrentFileUriChangedCallbackDlg = void delegate(Terminal terminal);
  alias CurrentFileUriChangedCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to CurrentFileUriChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCurrentFileUriChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CurrentFileUriChangedCallbackDlg) || is(T : CurrentFileUriChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("current-file-uri-changed", closure, after);
  }

  /**
   * Emitted whenever the cursor moves to a new character cell.  Used
   * primarily by #VteTerminalAccessible.
   *   terminal = the instance the signal is connected to
   */
  alias CursorMovedCallbackDlg = void delegate(Terminal terminal);
  alias CursorMovedCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to CursorMoved signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCursorMoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CursorMovedCallbackDlg) || is(T : CursorMovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cursor-moved", closure, after);
  }

  /**
   * Emitted when the user hits the '-' key while holding the Control key.
   *   terminal = the instance the signal is connected to
   */
  alias DecreaseFontSizeCallbackDlg = void delegate(Terminal terminal);
  alias DecreaseFontSizeCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to DecreaseFontSize signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDecreaseFontSize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DecreaseFontSizeCallbackDlg) || is(T : DecreaseFontSizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("decrease-font-size", closure, after);
  }

  /**
   * Never emitted.
   *   terminal = the instance the signal is connected to
   */
  alias DeiconifyWindowCallbackDlg = void delegate(Terminal terminal);
  alias DeiconifyWindowCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to DeiconifyWindow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDeiconifyWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DeiconifyWindowCallbackDlg) || is(T : DeiconifyWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deiconify-window", closure, after);
  }

  /**
   * Emitted whenever the terminal's current encoding has changed.
   * Note: support for non-UTF-8 is deprecated.
   *   terminal = the instance the signal is connected to
   */
  alias EncodingChangedCallbackDlg = void delegate(Terminal terminal);
  alias EncodingChangedCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to EncodingChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEncodingChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EncodingChangedCallbackDlg) || is(T : EncodingChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("encoding-changed", closure, after);
  }

  /**
   * Emitted when the terminal receives an end-of-file from a child which
   * is running in the terminal.  This signal is frequently $(LPAREN)but not
   * always$(RPAREN) emitted with a #VteTerminal::child-exited signal.
   *   terminal = the instance the signal is connected to
   */
  alias EofCallbackDlg = void delegate(Terminal terminal);
  alias EofCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to Eof signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEof(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EofCallbackDlg) || is(T : EofCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("eof", closure, after);
  }

  /**
   * Emitted when the hovered hyperlink changes.
   * uri and bbox are owned by VTE, must not be modified, and might
   * change after the signal handlers returns.
   * The signal is not re-emitted when the bounding box changes for the
   * same hyperlink. This might change in a future VTE version without notice.
   * Params
   *   uri = the nonempty target URI under the mouse, or NULL
   *   bbox = the bounding box of the hyperlink anchor text, or NULL
   *   terminal = the instance the signal is connected to
   */
  alias HyperlinkHoverUriChangedCallbackDlg = void delegate(string uri, Rectangle bbox, Terminal terminal);
  alias HyperlinkHoverUriChangedCallbackFunc = void function(string uri, Rectangle bbox, Terminal terminal);

  /**
   * Connect to HyperlinkHoverUriChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectHyperlinkHoverUriChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : HyperlinkHoverUriChangedCallbackDlg) || is(T : HyperlinkHoverUriChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      auto uri = getVal!string(&_paramVals[1]);
      auto bbox = getVal!Rectangle(&_paramVals[2]);
      _dClosure.dlg(uri, bbox, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hyperlink-hover-uri-changed", closure, after);
  }

  alias IconTitleChangedCallbackDlg = void delegate(Terminal terminal);
  alias IconTitleChangedCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to IconTitleChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectIconTitleChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : IconTitleChangedCallbackDlg) || is(T : IconTitleChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("icon-title-changed", closure, after);
  }

  /**
   * Never emitted.
   *   terminal = the instance the signal is connected to
   */
  alias IconifyWindowCallbackDlg = void delegate(Terminal terminal);
  alias IconifyWindowCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to IconifyWindow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectIconifyWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : IconifyWindowCallbackDlg) || is(T : IconifyWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("iconify-window", closure, after);
  }

  /**
   * Emitted when the user hits the '+' key while holding the Control key.
   *   terminal = the instance the signal is connected to
   */
  alias IncreaseFontSizeCallbackDlg = void delegate(Terminal terminal);
  alias IncreaseFontSizeCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to IncreaseFontSize signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectIncreaseFontSize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : IncreaseFontSizeCallbackDlg) || is(T : IncreaseFontSizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("increase-font-size", closure, after);
  }

  /**
   * Never emitted.
   *   terminal = the instance the signal is connected to
   */
  alias LowerWindowCallbackDlg = void delegate(Terminal terminal);
  alias LowerWindowCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to LowerWindow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectLowerWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LowerWindowCallbackDlg) || is(T : LowerWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("lower-window", closure, after);
  }

  /**
   * Never emitted.
   *   terminal = the instance the signal is connected to
   */
  alias MaximizeWindowCallbackDlg = void delegate(Terminal terminal);
  alias MaximizeWindowCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to MaximizeWindow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMaximizeWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MaximizeWindowCallbackDlg) || is(T : MaximizeWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("maximize-window", closure, after);
  }

  /**
   * Never emitted.
   * Params
   *   x = the terminal's desired location, X coordinate
   *   y = the terminal's desired location, Y coordinate
   *   terminal = the instance the signal is connected to
   */
  alias MoveWindowCallbackDlg = void delegate(uint x, uint y, Terminal terminal);
  alias MoveWindowCallbackFunc = void function(uint x, uint y, Terminal terminal);

  /**
   * Connect to MoveWindow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveWindowCallbackDlg) || is(T : MoveWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      auto x = getVal!uint(&_paramVals[1]);
      auto y = getVal!uint(&_paramVals[2]);
      _dClosure.dlg(x, y, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-window", closure, after);
  }

  /**
   * Emitted whenever [Vte.Terminal.pasteClipboard] is called.
   *   terminal = the instance the signal is connected to
   */
  alias PasteClipboardCallbackDlg = void delegate(Terminal terminal);
  alias PasteClipboardCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to PasteClipboard signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PasteClipboardCallbackDlg) || is(T : PasteClipboardCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paste-clipboard", closure, after);
  }

  /**
   * Never emitted.
   *   terminal = the instance the signal is connected to
   */
  alias RaiseWindowCallbackDlg = void delegate(Terminal terminal);
  alias RaiseWindowCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to RaiseWindow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRaiseWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RaiseWindowCallbackDlg) || is(T : RaiseWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("raise-window", closure, after);
  }

  /**
   * Never emitted.
   *   terminal = the instance the signal is connected to
   */
  alias RefreshWindowCallbackDlg = void delegate(Terminal terminal);
  alias RefreshWindowCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to RefreshWindow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRefreshWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RefreshWindowCallbackDlg) || is(T : RefreshWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("refresh-window", closure, after);
  }

  /**
   * Emitted at the child application's request.
   * Params
   *   width = the desired number of columns
   *   height = the desired number of rows
   *   terminal = the instance the signal is connected to
   */
  alias ResizeWindowCallbackDlg = void delegate(uint width, uint height, Terminal terminal);
  alias ResizeWindowCallbackFunc = void function(uint width, uint height, Terminal terminal);

  /**
   * Connect to ResizeWindow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectResizeWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ResizeWindowCallbackDlg) || is(T : ResizeWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      auto width = getVal!uint(&_paramVals[1]);
      auto height = getVal!uint(&_paramVals[2]);
      _dClosure.dlg(width, height, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("resize-window", closure, after);
  }

  /**
   * Never emitted.
   *   terminal = the instance the signal is connected to
   */
  alias RestoreWindowCallbackDlg = void delegate(Terminal terminal);
  alias RestoreWindowCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to RestoreWindow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRestoreWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RestoreWindowCallbackDlg) || is(T : RestoreWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("restore-window", closure, after);
  }

  /**
   * Emitted whenever the contents of terminal's selection changes.
   *   terminal = the instance the signal is connected to
   */
  alias SelectionChangedCallbackDlg = void delegate(Terminal terminal);
  alias SelectionChangedCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to SelectionChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectionChangedCallbackDlg) || is(T : SelectionChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }

  /**
   * Emitted when the #VteTerminal:window-title property is modified.
   *   terminal = the instance the signal is connected to
   */
  alias WindowTitleChangedCallbackDlg = void delegate(Terminal terminal);
  alias WindowTitleChangedCallbackFunc = void function(Terminal terminal);

  /**
   * Connect to WindowTitleChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectWindowTitleChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WindowTitleChangedCallbackDlg) || is(T : WindowTitleChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!Terminal(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-title-changed", closure, after);
  }
}
