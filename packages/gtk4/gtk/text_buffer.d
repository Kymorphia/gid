/// Module for [TextBuffer] class
module gtk.text_buffer;

import gdk.clipboard;
import gdk.content_provider;
import gdk.paintable;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.text_child_anchor;
import gtk.text_iter;
import gtk.text_mark;
import gtk.text_tag;
import gtk.text_tag_table;
import gtk.types;

/**
    Stores text and attributes for display in a [gtk.text_view.TextView].
    
    You may wish to begin by reading the
    [text widget conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types
    related to the text widget and how they work together.
    
    GtkTextBuffer can support undoing changes to the buffer
    content, see [gtk.text_buffer.TextBuffer.setEnableUndo].
*/
class TextBuffer : gobject.object.ObjectWrap
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
    return cast(void function())gtk_text_buffer_get_type != &gidSymbolNotFound ? gtk_text_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextBuffer self()
  {
    return this;
  }

  /**
      Get `canRedo` property.
      Returns: Denotes that the buffer can reapply the last undone action.
  */
  @property bool canRedo()
  {
    return getCanRedo();
  }

  /**
      Get `canUndo` property.
      Returns: Denotes that the buffer can undo the last applied action.
  */
  @property bool canUndo()
  {
    return getCanUndo();
  }

  /**
      Get `cursorPosition` property.
      Returns: The position of the insert mark.
      
      This is an offset from the beginning of the buffer.
      It is useful for getting notified when the cursor moves.
  */
  @property int cursorPosition()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("cursor-position");
  }

  /**
      Get `enableUndo` property.
      Returns: Denotes if support for undoing and redoing changes to the buffer is allowed.
  */
  @property bool enableUndo()
  {
    return getEnableUndo();
  }

  /**
      Set `enableUndo` property.
      Params:
        propval = Denotes if support for undoing and redoing changes to the buffer is allowed.
  */
  @property void enableUndo(bool propval)
  {
    return setEnableUndo(propval);
  }

  /**
      Get `hasSelection` property.
      Returns: Whether the buffer has some text currently selected.
  */
  @property bool hasSelection()
  {
    return getHasSelection();
  }

  /**
      Get `text` property.
      Returns: The text content of the buffer.
      
      Without child widgets and images,
      see [gtk.text_buffer.TextBuffer.getText] for more information.
  */
  @property string text()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = The text content of the buffer.
        
        Without child widgets and images,
        see [gtk.text_buffer.TextBuffer.getText] for more information.
  */
  @property void text(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Creates a new text buffer.
  
      Params:
        table = a tag table, or null to create a new one
      Returns: a new text buffer
  */
  this(gtk.text_tag_table.TextTagTable table = null)
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_text_buffer_new(table ? cast(GtkTextTagTable*)table._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds the mark at position where.
      
      The mark must not be added to another buffer, and if its name
      is not null then there must not be another mark in the buffer
      with the same name.
      
      Emits the `signalGtk.TextBuffer::mark-set` signal as notification
      of the mark's initial placement.
  
      Params:
        mark = the mark to add
        where = location to place mark
  */
  void addMark(gtk.text_mark.TextMark mark, gtk.text_iter.TextIter where)
  {
    gtk_text_buffer_add_mark(cast(GtkTextBuffer*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null);
  }

  /**
      Adds clipboard to the list of clipboards in which the selection
      contents of buffer are available.
      
      In most cases, clipboard will be the [gdk.clipboard.Clipboard] returned by
      [gtk.widget.Widget.getPrimaryClipboard] for a view of buffer.
  
      Params:
        clipboard = a [gdk.clipboard.Clipboard]
  */
  void addSelectionClipboard(gdk.clipboard.Clipboard clipboard)
  {
    gtk_text_buffer_add_selection_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GdkClipboard*)clipboard._cPtr(No.Dup) : null);
  }

  /**
      Emits the “apply-tag” signal on buffer.
      
      The default handler for the signal applies
      tag to the given range. start and end do
      not have to be in order.
  
      Params:
        tag = a [gtk.text_tag.TextTag]
        start = one bound of range to be tagged
        end = other bound of range to be tagged
  */
  void applyTag(gtk.text_tag.TextTag tag, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_text_buffer_apply_tag(cast(GtkTextBuffer*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Emits the “apply-tag” signal on buffer.
      
      Calls [gtk.text_tag_table.TextTagTable.lookup] on the buffer’s
      tag table to get a [gtk.text_tag.TextTag], then calls
      [gtk.text_buffer.TextBuffer.applyTag].
  
      Params:
        name = name of a named [gtk.text_tag.TextTag]
        start = one bound of range to be tagged
        end = other bound of range to be tagged
  */
  void applyTagByName(string name, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_text_buffer_apply_tag_by_name(cast(GtkTextBuffer*)this._cPtr, _name, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Performs the appropriate action as if the user hit the delete
      key with the cursor at the position specified by iter.
      
      In the normal case a single character will be deleted, but when
      combining accents are involved, more than one character can
      be deleted, and when precomposed character and accent combinations
      are involved, less than one character will be deleted.
      
      Because the buffer is modified, all outstanding iterators become
      invalid after calling this function; however, the iter will be
      re-initialized to point to the location where text was deleted.
  
      Params:
        iter = a position in buffer
        interactive = whether the deletion is caused by user interaction
        defaultEditable = whether the buffer is editable by default
      Returns: true if the buffer was modified
  */
  bool backspace(gtk.text_iter.TextIter iter, bool interactive, bool defaultEditable)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_backspace(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, interactive, defaultEditable);
    return _retval;
  }

  /**
      Denotes the beginning of an action that may not be undone.
      
      This will cause any previous operations in the undo/redo queue
      to be cleared.
      
      This should be paired with a call to
      [gtk.text_buffer.TextBuffer.endIrreversibleAction] after the irreversible
      action has completed.
      
      You may nest calls to [gtk.text_buffer.TextBuffer.beginIrreversibleAction]
      and [gtk.text_buffer.TextBuffer.endIrreversibleAction] pairs.
  */
  void beginIrreversibleAction()
  {
    gtk_text_buffer_begin_irreversible_action(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      Called to indicate that the buffer operations between here and a
      call to [gtk.text_buffer.TextBuffer.endUserAction] are part of a single
      user-visible operation.
      
      The operations between [gtk.text_buffer.TextBuffer.beginUserAction] and
      [gtk.text_buffer.TextBuffer.endUserAction] can then be grouped when creating
      an undo stack. [gtk.text_buffer.TextBuffer] maintains a count of calls to
      [gtk.text_buffer.TextBuffer.beginUserAction] that have not been closed with
      a call to [gtk.text_buffer.TextBuffer.endUserAction], and emits the
      “begin-user-action” and “end-user-action” signals only for the
      outermost pair of calls. This allows you to build user actions
      from other user actions.
      
      The “interactive” buffer mutation functions, such as
      [gtk.text_buffer.TextBuffer.insertInteractive], automatically call
      begin/end user action around the buffer operations they perform,
      so there's no need to add extra calls if you user action consists
      solely of a single call to one of those functions.
  */
  void beginUserAction()
  {
    gtk_text_buffer_begin_user_action(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      Copies the currently-selected text to a clipboard.
  
      Params:
        clipboard = the [gdk.clipboard.Clipboard] object to copy to
  */
  void copyClipboard(gdk.clipboard.Clipboard clipboard)
  {
    gtk_text_buffer_copy_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GdkClipboard*)clipboard._cPtr(No.Dup) : null);
  }

  /**
      Creates and inserts a child anchor.
      
      This is a convenience function which simply creates a child anchor
      with [gtk.text_child_anchor.TextChildAnchor.new_] and inserts it into the buffer
      with [gtk.text_buffer.TextBuffer.insertChildAnchor].
      
      The new anchor is owned by the buffer; no reference count is
      returned to the caller of this function.
  
      Params:
        iter = location in the buffer
      Returns: the created child anchor
  */
  gtk.text_child_anchor.TextChildAnchor createChildAnchor(gtk.text_iter.TextIter iter)
  {
    GtkTextChildAnchor* _cretval;
    _cretval = gtk_text_buffer_create_child_anchor(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_child_anchor.TextChildAnchor)(cast(GtkTextChildAnchor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a mark at position where.
      
      If mark_name is null, the mark is anonymous; otherwise, the mark
      can be retrieved by name using [gtk.text_buffer.TextBuffer.getMark].
      If a mark has left gravity, and text is inserted at the mark’s
      current location, the mark will be moved to the left of the
      newly-inserted text. If the mark has right gravity
      (left_gravity = false), the mark will end up on the right of
      newly-inserted text. The standard left-to-right cursor is a mark
      with right gravity (when you type, the cursor stays on the right
      side of the text you’re typing).
      
      The caller of this function does not own a
      reference to the returned [gtk.text_mark.TextMark], so you can ignore the
      return value if you like. Marks are owned by the buffer and go
      away when the buffer does.
      
      Emits the `signalGtk.TextBuffer::mark-set` signal as notification
      of the mark's initial placement.
  
      Params:
        markName = name for mark
        where = location to place mark
        leftGravity = whether the mark has left gravity
      Returns: the new [gtk.text_mark.TextMark] object
  */
  gtk.text_mark.TextMark createMark(string markName, gtk.text_iter.TextIter where, bool leftGravity)
  {
    GtkTextMark* _cretval;
    const(char)* _markName = markName.toCString(No.Alloc);
    _cretval = gtk_text_buffer_create_mark(cast(GtkTextBuffer*)this._cPtr, _markName, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null, leftGravity);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_mark.TextMark)(cast(GtkTextMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Copies the currently-selected text to a clipboard,
      then deletes said text if it’s editable.
  
      Params:
        clipboard = the [gdk.clipboard.Clipboard] object to cut to
        defaultEditable = default editability of the buffer
  */
  void cutClipboard(gdk.clipboard.Clipboard clipboard, bool defaultEditable)
  {
    gtk_text_buffer_cut_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GdkClipboard*)clipboard._cPtr(No.Dup) : null, defaultEditable);
  }

  /**
      Deletes text between start and end.
      
      The order of start and end is not actually relevant;
      [gtk.text_buffer.TextBuffer.delete_] will reorder them.
      
      This function actually emits the “delete-range” signal, and
      the default handler of that signal deletes the text. Because the
      buffer is modified, all outstanding iterators become invalid after
      calling this function; however, the start and end will be
      re-initialized to point to the location where text was deleted.
  
      Params:
        start = a position in buffer
        end = another position in buffer
  */
  void delete_(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_text_buffer_delete(cast(GtkTextBuffer*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      Deletes all editable text in the given range.
      
      Calls [gtk.text_buffer.TextBuffer.delete_] for each editable
      sub-range of [start,end). start and end are revalidated
      to point to the location of the last deleted range, or left
      untouched if no text was deleted.
  
      Params:
        startIter = start of range to delete
        endIter = end of range
        defaultEditable = whether the buffer is editable by default
      Returns: whether some text was actually deleted
  */
  bool deleteInteractive(gtk.text_iter.TextIter startIter, gtk.text_iter.TextIter endIter, bool defaultEditable)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_delete_interactive(cast(GtkTextBuffer*)this._cPtr, startIter ? cast(GtkTextIter*)startIter._cPtr(No.Dup) : null, endIter ? cast(GtkTextIter*)endIter._cPtr(No.Dup) : null, defaultEditable);
    return _retval;
  }

  /**
      Deletes mark, so that it’s no longer located anywhere in the
      buffer.
      
      Removes the reference the buffer holds to the mark, so if
      you haven’t called [gobject.object.ObjectWrap.ref_] on the mark, it will be freed.
      Even if the mark isn’t freed, most operations on mark become
      invalid, until it gets added to a buffer again with
      [gtk.text_buffer.TextBuffer.addMark]. Use [gtk.text_mark.TextMark.getDeleted]
      to find out if a mark has been removed from its buffer.
      
      The `signalGtk.TextBuffer::mark-deleted` signal will be emitted as
      notification after the mark is deleted.
  
      Params:
        mark = a [gtk.text_mark.TextMark] in buffer
  */
  void deleteMark(gtk.text_mark.TextMark mark)
  {
    gtk_text_buffer_delete_mark(cast(GtkTextBuffer*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
  }

  /**
      Deletes the mark named name; the mark must exist.
      
      See [gtk.text_buffer.TextBuffer.deleteMark] for details.
  
      Params:
        name = name of a mark in buffer
  */
  void deleteMarkByName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_text_buffer_delete_mark_by_name(cast(GtkTextBuffer*)this._cPtr, _name);
  }

  /**
      Deletes the range between the “insert” and “selection_bound” marks,
      that is, the currently-selected text.
      
      If interactive is true, the editability of the selection will be
      considered (users can’t delete uneditable text).
  
      Params:
        interactive = whether the deletion is caused by user interaction
        defaultEditable = whether the buffer is editable by default
      Returns: whether there was a non-empty selection to delete
  */
  bool deleteSelection(bool interactive, bool defaultEditable)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_delete_selection(cast(GtkTextBuffer*)this._cPtr, interactive, defaultEditable);
    return _retval;
  }

  /**
      Denotes the end of an action that may not be undone.
      
      This will cause any previous operations in the undo/redo
      queue to be cleared.
      
      This should be called after completing modifications to the
      text buffer after [gtk.text_buffer.TextBuffer.beginIrreversibleAction]
      was called.
      
      You may nest calls to [gtk.text_buffer.TextBuffer.beginIrreversibleAction]
      and [gtk.text_buffer.TextBuffer.endIrreversibleAction] pairs.
  */
  void endIrreversibleAction()
  {
    gtk_text_buffer_end_irreversible_action(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      Ends a user-visible operation.
      
      Should be paired with a call to
      [gtk.text_buffer.TextBuffer.beginUserAction].
      See that function for a full explanation.
  */
  void endUserAction()
  {
    gtk_text_buffer_end_user_action(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      Retrieves the first and last iterators in the buffer, i.e. the
      entire buffer lies within the range [start,end).
  
      Params:
        start = iterator to initialize with first position in the buffer
        end = iterator to initialize with the end iterator
  */
  void getBounds(out gtk.text_iter.TextIter start, out gtk.text_iter.TextIter end)
  {
    GtkTextIter _start;
    GtkTextIter _end;
    gtk_text_buffer_get_bounds(cast(GtkTextBuffer*)this._cPtr, &_start, &_end);
    start = new gtk.text_iter.TextIter(cast(void*)&_start, No.Take);
    end = new gtk.text_iter.TextIter(cast(void*)&_end, No.Take);
  }

  /**
      Gets whether there is a redoable action in the history.
      Returns: true if there is a redoable action
  */
  bool getCanRedo()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_get_can_redo(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether there is an undoable action in the history.
      Returns: true if there is an undoable action
  */
  bool getCanUndo()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_get_can_undo(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of characters in the buffer.
      
      Note that characters and bytes are not the same, you can’t e.g.
      expect the contents of the buffer in string form to be this
      many bytes long.
      
      The character count is cached, so this function is very fast.
      Returns: number of characters in the buffer
  */
  int getCharCount()
  {
    int _retval;
    _retval = gtk_text_buffer_get_char_count(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the buffer is saving modifications to the buffer
      to allow for undo and redo actions.
      
      See [gtk.text_buffer.TextBuffer.beginIrreversibleAction] and
      [gtk.text_buffer.TextBuffer.endIrreversibleAction] to create
      changes to the buffer that cannot be undone.
      Returns: true if undoing and redoing changes to the buffer is allowed.
  */
  bool getEnableUndo()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_get_enable_undo(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Initializes iter with the “end iterator,” one past the last valid
      character in the text buffer.
      
      If dereferenced with [gtk.text_iter.TextIter.getChar], the end
      iterator has a character value of 0.
      The entire buffer lies in the range from the first position in
      the buffer (call [gtk.text_buffer.TextBuffer.getStartIter] to get
      character position 0) to the end iterator.
  
      Params:
        iter = iterator to initialize
  */
  void getEndIter(out gtk.text_iter.TextIter iter)
  {
    GtkTextIter _iter;
    gtk_text_buffer_get_end_iter(cast(GtkTextBuffer*)this._cPtr, &_iter);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
  }

  /**
      Indicates whether the buffer has some text currently selected.
      Returns: true if the there is text selected
  */
  bool getHasSelection()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_get_has_selection(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the mark that represents the cursor (insertion point).
      
      Equivalent to calling [gtk.text_buffer.TextBuffer.getMark]
      to get the mark named “insert”, but very slightly more
      efficient, and involves less typing.
      Returns: insertion point mark
  */
  gtk.text_mark.TextMark getInsert()
  {
    GtkTextMark* _cretval;
    _cretval = gtk_text_buffer_get_insert(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_mark.TextMark)(cast(GtkTextMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the location of anchor within buffer.
  
      Params:
        iter = an iterator to be initialized
        anchor = a child anchor that appears in buffer
  */
  void getIterAtChildAnchor(out gtk.text_iter.TextIter iter, gtk.text_child_anchor.TextChildAnchor anchor)
  {
    GtkTextIter _iter;
    gtk_text_buffer_get_iter_at_child_anchor(cast(GtkTextBuffer*)this._cPtr, &_iter, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
  }

  /**
      Initializes iter to the start of the given line.
      
      If line_number is greater than or equal to the number of lines
      in the buffer, the end iterator is returned.
  
      Params:
        iter = iterator to initialize
        lineNumber = line number counting from 0
      Returns: whether the exact position has been found
  */
  bool getIterAtLine(out gtk.text_iter.TextIter iter, int lineNumber)
  {
    bool _retval;
    GtkTextIter _iter;
    _retval = cast(bool)gtk_text_buffer_get_iter_at_line(cast(GtkTextBuffer*)this._cPtr, &_iter, lineNumber);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Obtains an iterator pointing to byte_index within the given line.
      
      byte_index must be the start of a UTF-8 character. Note bytes, not
      characters; UTF-8 may encode one character as multiple bytes.
      
      If line_number is greater than or equal to the number of lines in the buffer,
      the end iterator is returned. And if byte_index is off the
      end of the line, the iterator at the end of the line is returned.
  
      Params:
        iter = iterator to initialize
        lineNumber = line number counting from 0
        byteIndex = byte index from start of line
      Returns: whether the exact position has been found
  */
  bool getIterAtLineIndex(out gtk.text_iter.TextIter iter, int lineNumber, int byteIndex)
  {
    bool _retval;
    GtkTextIter _iter;
    _retval = cast(bool)gtk_text_buffer_get_iter_at_line_index(cast(GtkTextBuffer*)this._cPtr, &_iter, lineNumber, byteIndex);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Obtains an iterator pointing to char_offset within the given line.
      
      Note characters, not bytes; UTF-8 may encode one character as multiple
      bytes.
      
      If line_number is greater than or equal to the number of lines in the buffer,
      the end iterator is returned. And if char_offset is off the
      end of the line, the iterator at the end of the line is returned.
  
      Params:
        iter = iterator to initialize
        lineNumber = line number counting from 0
        charOffset = char offset from start of line
      Returns: whether the exact position has been found
  */
  bool getIterAtLineOffset(out gtk.text_iter.TextIter iter, int lineNumber, int charOffset)
  {
    bool _retval;
    GtkTextIter _iter;
    _retval = cast(bool)gtk_text_buffer_get_iter_at_line_offset(cast(GtkTextBuffer*)this._cPtr, &_iter, lineNumber, charOffset);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Initializes iter with the current position of mark.
  
      Params:
        iter = iterator to initialize
        mark = a [gtk.text_mark.TextMark] in buffer
  */
  void getIterAtMark(out gtk.text_iter.TextIter iter, gtk.text_mark.TextMark mark)
  {
    GtkTextIter _iter;
    gtk_text_buffer_get_iter_at_mark(cast(GtkTextBuffer*)this._cPtr, &_iter, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
  }

  /**
      Initializes iter to a position char_offset chars from the start
      of the entire buffer.
      
      If char_offset is -1 or greater than the number
      of characters in the buffer, iter is initialized to the end iterator,
      the iterator one past the last valid character in the buffer.
  
      Params:
        iter = iterator to initialize
        charOffset = char offset from start of buffer, counting from 0, or -1
  */
  void getIterAtOffset(out gtk.text_iter.TextIter iter, int charOffset)
  {
    GtkTextIter _iter;
    gtk_text_buffer_get_iter_at_offset(cast(GtkTextBuffer*)this._cPtr, &_iter, charOffset);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
  }

  /**
      Obtains the number of lines in the buffer.
      
      This value is cached, so the function is very fast.
      Returns: number of lines in the buffer
  */
  int getLineCount()
  {
    int _retval;
    _retval = gtk_text_buffer_get_line_count(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the mark named name in buffer buffer, or null if no such
      mark exists in the buffer.
  
      Params:
        name = a mark name
      Returns: a [gtk.text_mark.TextMark]
  */
  gtk.text_mark.TextMark getMark(string name)
  {
    GtkTextMark* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_text_buffer_get_mark(cast(GtkTextBuffer*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_mark.TextMark)(cast(GtkTextMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the maximum number of undo levels to perform.
      
      If 0, unlimited undo actions may be performed. Note that this may
      have a memory usage impact as it requires storing an additional
      copy of the inserted or removed text within the text buffer.
      Returns: The max number of undo levels allowed (0 indicates unlimited).
  */
  uint getMaxUndoLevels()
  {
    uint _retval;
    _retval = gtk_text_buffer_get_max_undo_levels(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Indicates whether the buffer has been modified since the last call
      to [gtk.text_buffer.TextBuffer.setModified] set the modification flag to
      false.
      
      Used for example to enable a “save” function in a text editor.
      Returns: true if the buffer has been modified
  */
  bool getModified()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_get_modified(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the mark that represents the selection bound.
      
      Equivalent to calling [gtk.text_buffer.TextBuffer.getMark]
      to get the mark named “selection_bound”, but very slightly
      more efficient, and involves less typing.
      
      The currently-selected text in buffer is the region between the
      “selection_bound” and “insert” marks. If “selection_bound” and
      “insert” are in the same place, then there is no current selection.
      [gtk.text_buffer.TextBuffer.getSelectionBounds] is another convenient
      function for handling the selection, if you just want to know whether
      there’s a selection and what its bounds are.
      Returns: selection bound mark
  */
  gtk.text_mark.TextMark getSelectionBound()
  {
    GtkTextMark* _cretval;
    _cretval = gtk_text_buffer_get_selection_bound(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_mark.TextMark)(cast(GtkTextMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if some text is selected; places the bounds
      of the selection in start and end.
      
      If the selection has length 0, then start and end are filled
      in with the same value. start and end will be in ascending order.
      If start and end are null, then they are not filled in, but the
      return value still indicates whether text is selected.
  
      Params:
        start = iterator to initialize with selection start
        end = iterator to initialize with selection end
      Returns: whether the selection has nonzero length
  */
  bool getSelectionBounds(out gtk.text_iter.TextIter start, out gtk.text_iter.TextIter end)
  {
    bool _retval;
    GtkTextIter _start;
    GtkTextIter _end;
    _retval = cast(bool)gtk_text_buffer_get_selection_bounds(cast(GtkTextBuffer*)this._cPtr, &_start, &_end);
    start = new gtk.text_iter.TextIter(cast(void*)&_start, No.Take);
    end = new gtk.text_iter.TextIter(cast(void*)&_end, No.Take);
    return _retval;
  }

  /**
      Get a content provider for this buffer.
      
      It can be used to make the content of buffer available
      in a [gdk.clipboard.Clipboard], see [gdk.clipboard.Clipboard.setContent].
      Returns: a new [gdk.content_provider.ContentProvider].
  */
  gdk.content_provider.ContentProvider getSelectionContent()
  {
    GdkContentProvider* _cretval;
    _cretval = gtk_text_buffer_get_selection_content(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the text in the range [start,end).
      
      Excludes undisplayed text (text marked with tags that set the
      invisibility attribute) if include_hidden_chars is false.
      The returned string includes a 0xFFFC character whenever the
      buffer contains embedded images, so byte and character indexes
      into the returned string do correspond to byte and character
      indexes into the buffer. Contrast with [gtk.text_buffer.TextBuffer.getText].
      Note that 0xFFFC can occur in normal text as well, so it is not a
      reliable indicator that a paintable or widget is in the buffer.
  
      Params:
        start = start of a range
        end = end of a range
        includeHiddenChars = whether to include invisible text
      Returns: an allocated UTF-8 string
  */
  string getSlice(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, bool includeHiddenChars)
  {
    char* _cretval;
    _cretval = gtk_text_buffer_get_slice(cast(GtkTextBuffer*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null, includeHiddenChars);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Initialized iter with the first position in the text buffer.
      
      This is the same as using [gtk.text_buffer.TextBuffer.getIterAtOffset]
      to get the iter at character offset 0.
  
      Params:
        iter = iterator to initialize
  */
  void getStartIter(out gtk.text_iter.TextIter iter)
  {
    GtkTextIter _iter;
    gtk_text_buffer_get_start_iter(cast(GtkTextBuffer*)this._cPtr, &_iter);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
  }

  /**
      Get the [gtk.text_tag_table.TextTagTable] associated with this buffer.
      Returns: the buffer’s tag table
  */
  gtk.text_tag_table.TextTagTable getTagTable()
  {
    GtkTextTagTable* _cretval;
    _cretval = gtk_text_buffer_get_tag_table(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_tag_table.TextTagTable)(cast(GtkTextTagTable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the text in the range [start,end).
      
      Excludes undisplayed text (text marked with tags that set the
      invisibility attribute) if include_hidden_chars is false.
      Does not include characters representing embedded images, so
      byte and character indexes into the returned string do not
      correspond to byte and character indexes into the buffer.
      Contrast with [gtk.text_buffer.TextBuffer.getSlice].
  
      Params:
        start = start of a range
        end = end of a range
        includeHiddenChars = whether to include invisible text
      Returns: an allocated UTF-8 string
  */
  string getText(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, bool includeHiddenChars)
  {
    char* _cretval;
    _cretval = gtk_text_buffer_get_text(cast(GtkTextBuffer*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null, includeHiddenChars);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Inserts len bytes of text at position iter.
      
      If len is -1, text must be nul-terminated and will be inserted in its
      entirety. Emits the “insert-text” signal; insertion actually occurs
      in the default handler for the signal. iter is invalidated when
      insertion occurs (because the buffer contents change), but the
      default signal handler revalidates it to point to the end of the
      inserted text.
  
      Params:
        iter = a position in the buffer
        text = text in UTF-8 format
  */
  void insert(gtk.text_iter.TextIter iter, string text)
  {
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    gtk_text_buffer_insert(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _text, _len);
  }

  /**
      Inserts text in buffer.
      
      Simply calls [gtk.text_buffer.TextBuffer.insert],
      using the current cursor position as the insertion point.
  
      Params:
        text = text in UTF-8 format
  */
  void insertAtCursor(string text)
  {
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    gtk_text_buffer_insert_at_cursor(cast(GtkTextBuffer*)this._cPtr, _text, _len);
  }

  /**
      Inserts a child widget anchor into the text buffer at iter.
      
      The anchor will be counted as one character in character counts, and
      when obtaining the buffer contents as a string, will be represented
      by the Unicode “object replacement character” 0xFFFC. Note that the
      “slice” variants for obtaining portions of the buffer as a string
      include this character for child anchors, but the “text” variants do
      not. E.g. see [gtk.text_buffer.TextBuffer.getSlice] and
      [gtk.text_buffer.TextBuffer.getText].
      
      Consider [gtk.text_buffer.TextBuffer.createChildAnchor] as a more
      convenient alternative to this function. The buffer will add a
      reference to the anchor, so you can unref it after insertion.
  
      Params:
        iter = location to insert the anchor
        anchor = a [gtk.text_child_anchor.TextChildAnchor]
  */
  void insertChildAnchor(gtk.text_iter.TextIter iter, gtk.text_child_anchor.TextChildAnchor anchor)
  {
    gtk_text_buffer_insert_child_anchor(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
  }

  /**
      Inserts text in buffer.
      
      Like [gtk.text_buffer.TextBuffer.insert], but the insertion will not occur
      if iter is at a non-editable location in the buffer. Usually you
      want to prevent insertions at ineditable locations if the insertion
      results from a user action (is interactive).
      
      default_editable indicates the editability of text that doesn't
      have a tag affecting editability applied to it. Typically the
      result of [gtk.text_view.TextView.getEditable] is appropriate here.
  
      Params:
        iter = a position in buffer
        text = some UTF-8 text
        defaultEditable = default editability of buffer
      Returns: whether text was actually inserted
  */
  bool insertInteractive(gtk.text_iter.TextIter iter, string text, bool defaultEditable)
  {
    bool _retval;
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    _retval = cast(bool)gtk_text_buffer_insert_interactive(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _text, _len, defaultEditable);
    return _retval;
  }

  /**
      Inserts text in buffer.
      
      Calls [gtk.text_buffer.TextBuffer.insertInteractive]
      at the cursor position.
      
      default_editable indicates the editability of text that doesn't
      have a tag affecting editability applied to it. Typically the
      result of [gtk.text_view.TextView.getEditable] is appropriate here.
  
      Params:
        text = text in UTF-8 format
        defaultEditable = default editability of buffer
      Returns: whether text was actually inserted
  */
  bool insertInteractiveAtCursor(string text, bool defaultEditable)
  {
    bool _retval;
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    _retval = cast(bool)gtk_text_buffer_insert_interactive_at_cursor(cast(GtkTextBuffer*)this._cPtr, _text, _len, defaultEditable);
    return _retval;
  }

  /**
      Inserts the text in markup at position iter.
      
      markup will be inserted in its entirety and must be nul-terminated
      and valid UTF-8. Emits the `signalGtk.TextBuffer::insert-text` signal,
      possibly multiple times; insertion actually occurs in the default handler
      for the signal. iter will point to the end of the inserted text on return.
  
      Params:
        iter = location to insert the markup
        markup = a nul-terminated UTF-8 string containing Pango markup
  */
  void insertMarkup(gtk.text_iter.TextIter iter, string markup)
  {
    int _len;
    if (markup)
      _len = cast(int)markup.length;

    auto _markup = cast(const(char)*)markup.ptr;
    gtk_text_buffer_insert_markup(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _markup, _len);
  }

  /**
      Inserts an image into the text buffer at iter.
      
      The image will be counted as one character in character counts,
      and when obtaining the buffer contents as a string, will be
      represented by the Unicode “object replacement character” 0xFFFC.
      Note that the “slice” variants for obtaining portions of the buffer
      as a string include this character for paintable, but the “text”
      variants do not. e.g. see [gtk.text_buffer.TextBuffer.getSlice] and
      [gtk.text_buffer.TextBuffer.getText].
  
      Params:
        iter = location to insert the paintable
        paintable = a [gdk.paintable.Paintable]
  */
  void insertPaintable(gtk.text_iter.TextIter iter, gdk.paintable.Paintable paintable)
  {
    gtk_text_buffer_insert_paintable(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Copies text, tags, and paintables between start and end
      and inserts the copy at iter.
      
      The order of start and end doesn’t matter.
      
      Used instead of simply getting/inserting text because it preserves
      images and tags. If start and end are in a different buffer from
      buffer, the two buffers must share the same tag table.
      
      Implemented via emissions of the ::insert-text and ::apply-tag signals,
      so expect those.
  
      Params:
        iter = a position in buffer
        start = a position in a [gtk.text_buffer.TextBuffer]
        end = another position in the same buffer as start
  */
  void insertRange(gtk.text_iter.TextIter iter, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_text_buffer_insert_range(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Copies text, tags, and paintables between start and end
      and inserts the copy at iter.
      
      Same as [gtk.text_buffer.TextBuffer.insertRange], but does nothing
      if the insertion point isn’t editable. The default_editable
      parameter indicates whether the text is editable at iter if
      no tags enclosing iter affect editability. Typically the result
      of [gtk.text_view.TextView.getEditable] is appropriate here.
  
      Params:
        iter = a position in buffer
        start = a position in a [gtk.text_buffer.TextBuffer]
        end = another position in the same buffer as start
        defaultEditable = default editability of the buffer
      Returns: whether an insertion was possible at iter
  */
  bool insertRangeInteractive(gtk.text_iter.TextIter iter, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, bool defaultEditable)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_insert_range_interactive(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null, defaultEditable);
    return _retval;
  }

  /**
      Moves mark to the new location where.
      
      Emits the `signalGtk.TextBuffer::mark-set` signal
      as notification of the move.
  
      Params:
        mark = a [gtk.text_mark.TextMark]
        where = new location for mark in buffer
  */
  void moveMark(gtk.text_mark.TextMark mark, gtk.text_iter.TextIter where)
  {
    gtk_text_buffer_move_mark(cast(GtkTextBuffer*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null);
  }

  /**
      Moves the mark named name (which must exist) to location where.
      
      See [gtk.text_buffer.TextBuffer.moveMark] for details.
  
      Params:
        name = name of a mark
        where = new location for mark
  */
  void moveMarkByName(string name, gtk.text_iter.TextIter where)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_text_buffer_move_mark_by_name(cast(GtkTextBuffer*)this._cPtr, _name, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null);
  }

  /**
      Pastes the contents of a clipboard.
      
      If override_location is null, the pasted text will be inserted
      at the cursor position, or the buffer selection will be replaced
      if the selection is non-empty.
      
      Note: pasting is asynchronous, that is, we’ll ask for the paste data
      and return, and at some point later after the main loop runs, the paste
      data will be inserted.
  
      Params:
        clipboard = the [gdk.clipboard.Clipboard] to paste from
        overrideLocation = location to insert pasted text
        defaultEditable = whether the buffer is editable by default
  */
  void pasteClipboard(gdk.clipboard.Clipboard clipboard, gtk.text_iter.TextIter overrideLocation, bool defaultEditable)
  {
    gtk_text_buffer_paste_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GdkClipboard*)clipboard._cPtr(No.Dup) : null, overrideLocation ? cast(GtkTextIter*)overrideLocation._cPtr(No.Dup) : null, defaultEditable);
  }

  /**
      This function moves the “insert” and “selection_bound” marks
      simultaneously.
      
      If you move them to the same place in two steps with
      [gtk.text_buffer.TextBuffer.moveMark], you will temporarily select a
      region in between their old and new locations, which can be pretty
      inefficient since the temporarily-selected region will force stuff
      to be recalculated. This function moves them as a unit, which can
      be optimized.
  
      Params:
        where = where to put the cursor
  */
  void placeCursor(gtk.text_iter.TextIter where)
  {
    gtk_text_buffer_place_cursor(cast(GtkTextBuffer*)this._cPtr, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null);
  }

  /**
      Redoes the next redoable action on the buffer, if there is one.
  */
  void redo()
  {
    gtk_text_buffer_redo(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      Removes all tags in the range between start and end.
      
      Be careful with this function; it could remove tags added in code
      unrelated to the code you’re currently writing. That is, using this
      function is probably a bad idea if you have two or more unrelated
      code sections that add tags.
  
      Params:
        start = one bound of range to be untagged
        end = other bound of range to be untagged
  */
  void removeAllTags(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_text_buffer_remove_all_tags(cast(GtkTextBuffer*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Removes a [gdk.clipboard.Clipboard] added with
      [gtk.text_buffer.TextBuffer.addSelectionClipboard]
  
      Params:
        clipboard = a [gdk.clipboard.Clipboard] added to buffer by
            [gtk.text_buffer.TextBuffer.addSelectionClipboard]
  */
  void removeSelectionClipboard(gdk.clipboard.Clipboard clipboard)
  {
    gtk_text_buffer_remove_selection_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GdkClipboard*)clipboard._cPtr(No.Dup) : null);
  }

  /**
      Emits the “remove-tag” signal.
      
      The default handler for the signal removes all occurrences
      of tag from the given range. start and end don’t have
      to be in order.
  
      Params:
        tag = a [gtk.text_tag.TextTag]
        start = one bound of range to be untagged
        end = other bound of range to be untagged
  */
  void removeTag(gtk.text_tag.TextTag tag, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_text_buffer_remove_tag(cast(GtkTextBuffer*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Emits the “remove-tag” signal.
      
      Calls [gtk.text_tag_table.TextTagTable.lookup] on the buffer’s
      tag table to get a [gtk.text_tag.TextTag], then calls
      [gtk.text_buffer.TextBuffer.removeTag].
  
      Params:
        name = name of a [gtk.text_tag.TextTag]
        start = one bound of range to be untagged
        end = other bound of range to be untagged
  */
  void removeTagByName(string name, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_text_buffer_remove_tag_by_name(cast(GtkTextBuffer*)this._cPtr, _name, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      This function moves the “insert” and “selection_bound” marks
      simultaneously.
      
      If you move them in two steps with
      [gtk.text_buffer.TextBuffer.moveMark], you will temporarily select a
      region in between their old and new locations, which can be pretty
      inefficient since the temporarily-selected region will force stuff
      to be recalculated. This function moves them as a unit, which can
      be optimized.
  
      Params:
        ins = where to put the “insert” mark
        bound = where to put the “selection_bound” mark
  */
  void selectRange(gtk.text_iter.TextIter ins, gtk.text_iter.TextIter bound)
  {
    gtk_text_buffer_select_range(cast(GtkTextBuffer*)this._cPtr, ins ? cast(const(GtkTextIter)*)ins._cPtr(No.Dup) : null, bound ? cast(const(GtkTextIter)*)bound._cPtr(No.Dup) : null);
  }

  /**
      Sets whether or not to enable undoable actions in the text buffer.
      
      Undoable actions in this context are changes to the text content of
      the buffer. Changes to tags and marks are not tracked.
      
      If enabled, the user will be able to undo the last number of actions
      up to [gtk.text_buffer.TextBuffer.getMaxUndoLevels].
      
      See [gtk.text_buffer.TextBuffer.beginIrreversibleAction] and
      [gtk.text_buffer.TextBuffer.endIrreversibleAction] to create
      changes to the buffer that cannot be undone.
  
      Params:
        enableUndo = true to enable undo
  */
  void setEnableUndo(bool enableUndo)
  {
    gtk_text_buffer_set_enable_undo(cast(GtkTextBuffer*)this._cPtr, enableUndo);
  }

  /**
      Sets the maximum number of undo levels to perform.
      
      If 0, unlimited undo actions may be performed. Note that this may
      have a memory usage impact as it requires storing an additional
      copy of the inserted or removed text within the text buffer.
  
      Params:
        maxUndoLevels = the maximum number of undo actions to perform
  */
  void setMaxUndoLevels(uint maxUndoLevels)
  {
    gtk_text_buffer_set_max_undo_levels(cast(GtkTextBuffer*)this._cPtr, maxUndoLevels);
  }

  /**
      Used to keep track of whether the buffer has been
      modified since the last time it was saved.
      
      Whenever the buffer is saved to disk, call
      `gtk_text_buffer_set_modified (buffer, FALSE)`.
      When the buffer is modified, it will automatically
      toggle on the modified bit again. When the modified
      bit flips, the buffer emits the
      `signalGtk.TextBuffer::modified-changed` signal.
  
      Params:
        setting = modification flag setting
  */
  void setModified(bool setting)
  {
    gtk_text_buffer_set_modified(cast(GtkTextBuffer*)this._cPtr, setting);
  }

  /**
      Deletes current contents of buffer, and inserts text instead. This is
      automatically marked as an irreversible action in the undo stack. If you
      wish to mark this action as part of a larger undo operation, call
      [gtk.text_buffer.TextBuffer.delete_] and [gtk.text_buffer.TextBuffer.insert] directly instead.
      
      If len is -1, text must be nul-terminated.
      text must be valid UTF-8.
  
      Params:
        text = UTF-8 text to insert
  */
  void setText(string text)
  {
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    gtk_text_buffer_set_text(cast(GtkTextBuffer*)this._cPtr, _text, _len);
  }

  /**
      Undoes the last undoable action on the buffer, if there is one.
  */
  void undo()
  {
    gtk_text_buffer_undo(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      Connect to `ApplyTag` signal.
  
      Emitted to apply a tag to a range of text in a [gtk.text_buffer.TextBuffer].
      
      Applying actually occurs in the default handler.
      
      Note that if your handler runs before the default handler
      it must not invalidate the start and end iters (or has to
      revalidate them).
      
      See also:
      [gtk.text_buffer.TextBuffer.applyTag],
      [gtk.text_buffer.TextBuffer.insertWithTags],
      [gtk.text_buffer.TextBuffer.insertRange].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_tag.TextTag tag, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtk.text_buffer.TextBuffer textBuffer))
  
          `tag` the applied tag (optional)
  
          `start` the start of the range the tag is applied to (optional)
  
          `end` the end of the range the tag is applied to (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectApplyTag(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_tag.TextTag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("apply-tag", closure, after);
  }

  /**
      Connect to `BeginUserAction` signal.
  
      Emitted at the beginning of a single user-visible
      operation on a [gtk.text_buffer.TextBuffer].
      
      See also:
      [gtk.text_buffer.TextBuffer.beginUserAction],
      [gtk.text_buffer.TextBuffer.insertInteractive],
      [gtk.text_buffer.TextBuffer.insertRangeInteractive],
      [gtk.text_buffer.TextBuffer.deleteInteractive],
      [gtk.text_buffer.TextBuffer.backspace],
      [gtk.text_buffer.TextBuffer.deleteSelection].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_buffer.TextBuffer textBuffer))
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBeginUserAction(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("begin-user-action", closure, after);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the content of a [gtk.text_buffer.TextBuffer] has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_buffer.TextBuffer textBuffer))
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `DeleteRange` signal.
  
      Emitted to delete a range from a [gtk.text_buffer.TextBuffer].
      
      Note that if your handler runs before the default handler
      it must not invalidate the start and end iters (or has
      to revalidate them). The default signal handler revalidates
      the start and end iters to both point to the location
      where text was deleted. Handlers which run after the default
      handler (see g_signal_connect_after()) do not have access to
      the deleted text.
      
      See also: [gtk.text_buffer.TextBuffer.delete_].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtk.text_buffer.TextBuffer textBuffer))
  
          `start` the start of the range to be deleted (optional)
  
          `end` the end of the range to be deleted (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeleteRange(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("delete-range", closure, after);
  }

  /**
      Connect to `EndUserAction` signal.
  
      Emitted at the end of a single user-visible
      operation on the [gtk.text_buffer.TextBuffer].
      
      See also:
      [gtk.text_buffer.TextBuffer.endUserAction],
      [gtk.text_buffer.TextBuffer.insertInteractive],
      [gtk.text_buffer.TextBuffer.insertRangeInteractive],
      [gtk.text_buffer.TextBuffer.deleteInteractive],
      [gtk.text_buffer.TextBuffer.backspace],
      [gtk.text_buffer.TextBuffer.deleteSelection],
      [gtk.text_buffer.TextBuffer.backspace].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_buffer.TextBuffer textBuffer))
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEndUserAction(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("end-user-action", closure, after);
  }

  /**
      Connect to `InsertChildAnchor` signal.
  
      Emitted to insert a [gtk.text_child_anchor.TextChildAnchor] in a [gtk.text_buffer.TextBuffer].
      
      Insertion actually occurs in the default handler.
      
      Note that if your handler runs before the default handler
      it must not invalidate the location iter (or has to
      revalidate it). The default signal handler revalidates
      it to be placed after the inserted anchor.
      
      See also: [gtk.text_buffer.TextBuffer.insertChildAnchor].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter location, gtk.text_child_anchor.TextChildAnchor anchor, gtk.text_buffer.TextBuffer textBuffer))
  
          `location` position to insert anchor in textbuffer (optional)
  
          `anchor` the [gtk.text_child_anchor.TextChildAnchor] to be inserted (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertChildAnchor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text_child_anchor.TextChildAnchor)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("insert-child-anchor", closure, after);
  }

  /**
      Connect to `InsertPaintable` signal.
  
      Emitted to insert a [gdk.paintable.Paintable] in a [gtk.text_buffer.TextBuffer].
      
      Insertion actually occurs in the default handler.
      
      Note that if your handler runs before the default handler
      it must not invalidate the location iter (or has to
      revalidate it). The default signal handler revalidates
      it to be placed after the inserted paintable.
      
      See also: [gtk.text_buffer.TextBuffer.insertPaintable].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter location, gdk.paintable.Paintable paintable, gtk.text_buffer.TextBuffer textBuffer))
  
          `location` position to insert paintable in textbuffer (optional)
  
          `paintable` the [gdk.paintable.Paintable] to be inserted (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertPaintable(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.paintable.Paintable)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("insert-paintable", closure, after);
  }

  /**
      Connect to `InsertText` signal.
  
      Emitted to insert text in a [gtk.text_buffer.TextBuffer].
      
      Insertion actually occurs in the default handler.
      
      Note that if your handler runs before the default handler
      it must not invalidate the location iter (or has to
      revalidate it). The default signal handler revalidates
      it to point to the end of the inserted text.
      
      See also: [gtk.text_buffer.TextBuffer.insert],
      [gtk.text_buffer.TextBuffer.insertRange].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter location, string text, int len, gtk.text_buffer.TextBuffer textBuffer))
  
          `location` position to insert text in textbuffer (optional)
  
          `text` the UTF-8 text to be inserted (optional)
  
          `len` length of the inserted text in bytes (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertText(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("insert-text", closure, after);
  }

  /**
      Connect to `MarkDeleted` signal.
  
      Emitted as notification after a [gtk.text_mark.TextMark] is deleted.
      
      See also: [gtk.text_buffer.TextBuffer.deleteMark].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_mark.TextMark mark, gtk.text_buffer.TextBuffer textBuffer))
  
          `mark` The mark that was deleted (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMarkDeleted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_mark.TextMark)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("mark-deleted", closure, after);
  }

  /**
      Connect to `MarkSet` signal.
  
      Emitted as notification after a [gtk.text_mark.TextMark] is set.
      
      See also:
      [gtk.text_buffer.TextBuffer.createMark],
      [gtk.text_buffer.TextBuffer.moveMark].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter location, gtk.text_mark.TextMark mark, gtk.text_buffer.TextBuffer textBuffer))
  
          `location` The location of mark in textbuffer (optional)
  
          `mark` The mark that is set (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMarkSet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text_mark.TextMark)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("mark-set", closure, after);
  }

  /**
      Connect to `ModifiedChanged` signal.
  
      Emitted when the modified bit of a [gtk.text_buffer.TextBuffer] flips.
      
      See also: [gtk.text_buffer.TextBuffer.setModified].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_buffer.TextBuffer textBuffer))
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectModifiedChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("modified-changed", closure, after);
  }

  /**
      Connect to `PasteDone` signal.
  
      Emitted after paste operation has been completed.
      
      This is useful to properly scroll the view to the end
      of the pasted text. See [gtk.text_buffer.TextBuffer.pasteClipboard]
      for more details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.clipboard.Clipboard clipboard, gtk.text_buffer.TextBuffer textBuffer))
  
          `clipboard` the [gdk.clipboard.Clipboard] pasted from (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPasteDone(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.clipboard.Clipboard)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("paste-done", closure, after);
  }

  /**
      Connect to `Redo` signal.
  
      Emitted when a request has been made to redo the
      previously undone operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_buffer.TextBuffer textBuffer))
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRedo(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_buffer.TextBuffer)))
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
      Connect to `RemoveTag` signal.
  
      Emitted to remove all occurrences of tag from a range
      of text in a [gtk.text_buffer.TextBuffer].
      
      Removal actually occurs in the default handler.
      
      Note that if your handler runs before the default handler
      it must not invalidate the start and end iters (or has
      to revalidate them).
      
      See also: [gtk.text_buffer.TextBuffer.removeTag].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_tag.TextTag tag, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtk.text_buffer.TextBuffer textBuffer))
  
          `tag` the tag to be removed (optional)
  
          `start` the start of the range the tag is removed from (optional)
  
          `end` the end of the range the tag is removed from (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRemoveTag(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_tag.TextTag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.text_buffer.TextBuffer)))
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
    return connectSignalClosure("remove-tag", closure, after);
  }

  /**
      Connect to `Undo` signal.
  
      Emitted when a request has been made to undo the
      previous operation or set of operations that have
      been grouped together.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_buffer.TextBuffer textBuffer))
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUndo(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_buffer.TextBuffer)))
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
