module gtk.editable;

public import gtk.editable_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * The #GtkEditable interface is an interface which should be implemented by
 * text editing widgets, such as #GtkEntry and #GtkSpinButton. It contains functions
 * for generically manipulating an editable widget, a large number of action
 * signals used for key bindings, and several signals that an application can
 * connect to to modify the behavior of a widget.
 * As an example of the latter usage, by connecting
 * the following handler to #GtkEditable::insert-text, an application
 * can convert all entry into a widget into uppercase.
 * ## Forcing entry to uppercase.
 * |[<!-- language\="C" -->
 * #include <ctype.h>;
 * void
 * insert_text_handler $(LPAREN)GtkEditable *editable,
 * const gchar *text,
 * gint         length,
 * gint        *position,
 * gpointer     data$(RPAREN)
 * {
 * gchar *result \= g_utf8_strup $(LPAREN)text, length$(RPAREN);
 * g_signal_handlers_block_by_func $(LPAREN)editable,
 * $(LPAREN)gpointer$(RPAREN) insert_text_handler, data$(RPAREN);
 * gtk_editable_insert_text $(LPAREN)editable, result, length, position$(RPAREN);
 * g_signal_handlers_unblock_by_func $(LPAREN)editable,
 * $(LPAREN)gpointer$(RPAREN) insert_text_handler, data$(RPAREN);
 * g_signal_stop_emission_by_name $(LPAREN)editable, "insert_text"$(RPAREN);
 * g_free $(LPAREN)result$(RPAREN);
 * }
 * ]|
 */
interface Editable
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_editable_get_type != &gidSymbolNotFound ? gtk_editable_get_type() : cast(GType)0;
  }

  /**
   * Copies the contents of the currently selected content in the editable and
   * puts it on the clipboard.
   */
  void copyClipboard();

  /**
   * Removes the contents of the currently selected content in the editable and
   * puts it on the clipboard.
   */
  void cutClipboard();

  /**
   * Deletes the currently selected text of the editable.
   * This call doesn’t do anything if there is no selected text.
   */
  void deleteSelection();

  /**
   * Deletes a sequence of characters. The characters that are deleted are
   * those characters at positions from start_pos up to, but not including
   * end_pos. If end_pos is negative, then the characters deleted
   * are those from start_pos to the end of the text.
   * Note that the positions are specified in characters, not bytes.
   * Params:
   *   startPos = start position
   *   endPos = end position
   */
  void deleteText(int startPos, int endPos);

  /**
   * Retrieves a sequence of characters. The characters that are retrieved
   * are those characters at positions from start_pos up to, but not
   * including end_pos. If end_pos is negative, then the characters
   * retrieved are those characters from start_pos to the end of the text.
   * Note that positions are specified in characters, not bytes.
   * Params:
   *   startPos = start of text
   *   endPos = end of text
   * Returns: a pointer to the contents of the widget as a
   *   string. This string is allocated by the #GtkEditable
   *   implementation and should be freed by the caller.
   */
  string getChars(int startPos, int endPos);

  /**
   * Retrieves whether editable is editable. See
   * [gtk.editable.Editable.setEditable].
   * Returns: %TRUE if editable is editable.
   */
  bool getEditable();

  /**
   * Retrieves the current position of the cursor relative to the start
   * of the content of the editable.
   * Note that this position is in characters, not in bytes.
   * Returns: the cursor position
   */
  int getPosition();

  /**
   * Retrieves the selection bound of the editable. start_pos will be filled
   * with the start of the selection and end_pos with end. If no text was
   * selected both will be identical and %FALSE will be returned.
   * Note that positions are specified in characters, not bytes.
   * Params:
   *   startPos = location to store the starting position, or %NULL
   *   endPos = location to store the end position, or %NULL
   * Returns: %TRUE if an area is selected, %FALSE otherwise
   */
  bool getSelectionBounds(out int startPos, out int endPos);

  /**
   * Inserts new_text_length bytes of new_text into the contents of the
   * widget, at position position.
   * Note that the position is in characters, not in bytes.
   * The function updates position to point after the newly inserted text.
   * Params:
   *   newText = the text to append
   *   newTextLength = the length of the text in bytes, or -1
   *   position = location of the position text will be inserted at
   */
  void insertText(string newText, int newTextLength, ref int position);

  /**
   * Pastes the content of the clipboard to the current position of the
   * cursor in the editable.
   */
  void pasteClipboard();

  /**
   * Selects a region of text. The characters that are selected are
   * those characters at positions from start_pos up to, but not
   * including end_pos. If end_pos is negative, then the
   * characters selected are those characters from start_pos to
   * the end of the text.
   * Note that positions are specified in characters, not bytes.
   * Params:
   *   startPos = start of region
   *   endPos = end of region
   */
  void selectRegion(int startPos, int endPos);

  /**
   * Determines if the user can edit the text in the editable
   * widget or not.
   * Params:
   *   isEditable = %TRUE if the user is allowed to edit the text
   *     in the widget
   */
  void setEditable(bool isEditable);

  /**
   * Sets the cursor position in the editable to the given value.
   * The cursor is displayed before the character with the given $(LPAREN)base 0$(RPAREN)
   * index in the contents of the editable. The value must be less than or
   * equal to the number of characters in the editable. A value of -1
   * indicates that the position should be set after the last character
   * of the editable. Note that position is in characters, not in bytes.
   * Params:
   *   position = the position of the cursor
   */
  void setPosition(int position);

  /**
   * The ::changed signal is emitted at the end of a single
   * user-visible operation on the contents of the #GtkEditable.
   * E.g., a paste operation that replaces the contents of the
   * selection will cause only one signal emission $(LPAREN)even though it
   * is implemented by first deleting the selection, then inserting
   * the new content, and may cause multiple ::notify::text signals
   * to be emitted$(RPAREN).
   *   editable = the instance the signal is connected to
   */
  alias ChangedCallbackDlg = void delegate(gtk.editable.Editable editable);
  alias ChangedCallbackFunc = void function(gtk.editable.Editable editable);

  /**
   * Connect to Changed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc));

  /**
   * This signal is emitted when text is deleted from
   * the widget by the user. The default handler for
   * this signal will normally be responsible for deleting
   * the text, so by connecting to this signal and then
   * stopping the signal with [gobject.global.signalStopEmission], it
   * is possible to modify the range of deleted text, or
   * prevent it from being deleted entirely. The start_pos
   * and end_pos parameters are interpreted as for
   * [gtk.editable.Editable.deleteText].
   * Params
   *   startPos = the starting position
   *   endPos = the end position
   *   editable = the instance the signal is connected to
   */
  alias DeleteTextCallbackDlg = void delegate(int startPos, int endPos, gtk.editable.Editable editable);
  alias DeleteTextCallbackFunc = void function(int startPos, int endPos, gtk.editable.Editable editable);

  /**
   * Connect to DeleteText signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDeleteText(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DeleteTextCallbackDlg) || is(T : DeleteTextCallbackFunc));
  }
