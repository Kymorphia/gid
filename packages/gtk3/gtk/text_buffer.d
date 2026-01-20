/// Module for [TextBuffer] class
module gtk.text_buffer;

import gdk.atom;
import gdkpixbuf.pixbuf;
import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.clipboard;
import gtk.target_list;
import gtk.text_child_anchor;
import gtk.text_iter;
import gtk.text_mark;
import gtk.text_tag;
import gtk.text_tag_table;
import gtk.types;

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and data
    types related to the text widget and how they work together.
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
      Get `copyTargetList` property.
      Returns: The list of targets this buffer supports for clipboard copying
        and as DND source.
  */
  @property gtk.target_list.TargetList copyTargetList()
  {
    return getCopyTargetList();
  }

  /**
      Get `cursorPosition` property.
      Returns: The position of the insert mark (as offset from the beginning
        of the buffer). It is useful for getting notified when the
        cursor moves.
  */
  @property int cursorPosition()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("cursor-position");
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
      Get `pasteTargetList` property.
      Returns: The list of targets this buffer supports for clipboard pasting
        and as DND destination.
  */
  @property gtk.target_list.TargetList pasteTargetList()
  {
    return getPasteTargetList();
  }

  /**
      Get `text` property.
      Returns: The text content of the buffer. Without child widgets and images,
        see [gtk.text_buffer.TextBuffer.getText] for more information.
  */
  @property string text()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = The text content of the buffer. Without child widgets and images,
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
      Adds the mark at position where. The mark must not be added to
      another buffer, and if its name is not null then there must not
      be another mark in the buffer with the same name.
      
      Emits the #GtkTextBuffer::mark-set signal as notification of the mark's
      initial placement.
  
      Params:
        mark = the mark to add
        where = location to place mark
  */
  void addMark(gtk.text_mark.TextMark mark, gtk.text_iter.TextIter where)
  {
    gtk_text_buffer_add_mark(cast(GtkTextBuffer*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null, cast(const(GtkTextIter)*)&where);
  }

  /**
      Adds clipboard to the list of clipboards in which the selection
      contents of buffer are available. In most cases, clipboard will be
      the #GtkClipboard of type `GDK_SELECTION_PRIMARY` for a view of buffer.
  
      Params:
        clipboard = a #GtkClipboard
  */
  void addSelectionClipboard(gtk.clipboard.Clipboard clipboard)
  {
    gtk_text_buffer_add_selection_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GtkClipboard*)clipboard._cPtr(No.Dup) : null);
  }

  /**
      Emits the “apply-tag” signal on buffer. The default
      handler for the signal applies tag to the given range.
      start and end do not have to be in order.
  
      Params:
        tag = a #GtkTextTag
        start = one bound of range to be tagged
        end = other bound of range to be tagged
  */
  void applyTag(gtk.text_tag.TextTag tag, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_text_buffer_apply_tag(cast(GtkTextBuffer*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end);
  }

  /**
      Calls [gtk.text_tag_table.TextTagTable.lookup] on the buffer’s tag table to
      get a #GtkTextTag, then calls [gtk.text_buffer.TextBuffer.applyTag].
  
      Params:
        name = name of a named #GtkTextTag
        start = one bound of range to be tagged
        end = other bound of range to be tagged
  */
  void applyTagByName(string name, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_text_buffer_apply_tag_by_name(cast(GtkTextBuffer*)this._cPtr, _name, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end);
  }

  /**
      Performs the appropriate action as if the user hit the delete
      key with the cursor at the position specified by iter. In the
      normal case a single character will be deleted, but when
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
    _retval = cast(bool)gtk_text_buffer_backspace(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, interactive, defaultEditable);
    return _retval;
  }

  /**
      Called to indicate that the buffer operations between here and a
      call to [gtk.text_buffer.TextBuffer.endUserAction] are part of a single
      user-visible operation. The operations between
      [gtk.text_buffer.TextBuffer.beginUserAction] and
      [gtk.text_buffer.TextBuffer.endUserAction] can then be grouped when creating
      an undo stack. #GtkTextBuffer maintains a count of calls to
      [gtk.text_buffer.TextBuffer.beginUserAction] that have not been closed with
      a call to [gtk.text_buffer.TextBuffer.endUserAction], and emits the
      “begin-user-action” and “end-user-action” signals only for the
      outermost pair of calls. This allows you to build user actions
      from other user actions.
      
      The “interactive” buffer mutation functions, such as
      [gtk.text_buffer.TextBuffer.insertInteractive], automatically call begin/end
      user action around the buffer operations they perform, so there's
      no need to add extra calls if you user action consists solely of a
      single call to one of those functions.
  */
  void beginUserAction()
  {
    gtk_text_buffer_begin_user_action(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      Copies the currently-selected text to a clipboard.
  
      Params:
        clipboard = the #GtkClipboard object to copy to
  */
  void copyClipboard(gtk.clipboard.Clipboard clipboard)
  {
    gtk_text_buffer_copy_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GtkClipboard*)clipboard._cPtr(No.Dup) : null);
  }

  /**
      This is a convenience function which simply creates a child anchor
      with [gtk.text_child_anchor.TextChildAnchor.new_] and inserts it into the buffer
      with [gtk.text_buffer.TextBuffer.insertChildAnchor]. The new anchor is
      owned by the buffer; no reference count is returned to
      the caller of [gtk.text_buffer.TextBuffer.createChildAnchor].
  
      Params:
        iter = location in the buffer
      Returns: the created child anchor
  */
  gtk.text_child_anchor.TextChildAnchor createChildAnchor(gtk.text_iter.TextIter iter)
  {
    GtkTextChildAnchor* _cretval;
    _cretval = gtk_text_buffer_create_child_anchor(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_child_anchor.TextChildAnchor)(cast(GtkTextChildAnchor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a mark at position where. If mark_name is null, the mark
      is anonymous; otherwise, the mark can be retrieved by name using
      [gtk.text_buffer.TextBuffer.getMark]. If a mark has left gravity, and text is
      inserted at the mark’s current location, the mark will be moved to
      the left of the newly-inserted text. If the mark has right gravity
      (left_gravity = false), the mark will end up on the right of
      newly-inserted text. The standard left-to-right cursor is a mark
      with right gravity (when you type, the cursor stays on the right
      side of the text you’re typing).
      
      The caller of this function does not own a
      reference to the returned #GtkTextMark, so you can ignore the
      return value if you like. Marks are owned by the buffer and go
      away when the buffer does.
      
      Emits the #GtkTextBuffer::mark-set signal as notification of the mark's
      initial placement.
  
      Params:
        markName = name for mark, or null
        where = location to place mark
        leftGravity = whether the mark has left gravity
      Returns: the new #GtkTextMark object
  */
  gtk.text_mark.TextMark createMark(string markName, gtk.text_iter.TextIter where, bool leftGravity)
  {
    GtkTextMark* _cretval;
    const(char)* _markName = markName.toCString(No.Alloc);
    _cretval = gtk_text_buffer_create_mark(cast(GtkTextBuffer*)this._cPtr, _markName, cast(const(GtkTextIter)*)&where, leftGravity);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_mark.TextMark)(cast(GtkTextMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Copies the currently-selected text to a clipboard, then deletes
      said text if it’s editable.
  
      Params:
        clipboard = the #GtkClipboard object to cut to
        defaultEditable = default editability of the buffer
  */
  void cutClipboard(gtk.clipboard.Clipboard clipboard, bool defaultEditable)
  {
    gtk_text_buffer_cut_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GtkClipboard*)clipboard._cPtr(No.Dup) : null, defaultEditable);
  }

  /**
      Deletes text between start and end. The order of start and end
      is not actually relevant; [gtk.text_buffer.TextBuffer.delete_] will reorder
      them. This function actually emits the “delete-range” signal, and
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
    gtk_text_buffer_delete(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&start, cast(GtkTextIter*)&end);
  }

  /**
      Deletes all editable text in the given range.
      Calls [gtk.text_buffer.TextBuffer.delete_] for each editable sub-range of
      [start,end). start and end are revalidated to point to
      the location of the last deleted range, or left untouched if
      no text was deleted.
  
      Params:
        startIter = start of range to delete
        endIter = end of range
        defaultEditable = whether the buffer is editable by default
      Returns: whether some text was actually deleted
  */
  bool deleteInteractive(gtk.text_iter.TextIter startIter, gtk.text_iter.TextIter endIter, bool defaultEditable)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_delete_interactive(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&startIter, cast(GtkTextIter*)&endIter, defaultEditable);
    return _retval;
  }

  /**
      Deletes mark, so that it’s no longer located anywhere in the
      buffer. Removes the reference the buffer holds to the mark, so if
      you haven’t called [gobject.object.ObjectWrap.ref_] on the mark, it will be freed. Even
      if the mark isn’t freed, most operations on mark become
      invalid, until it gets added to a buffer again with
      [gtk.text_buffer.TextBuffer.addMark]. Use [gtk.text_mark.TextMark.getDeleted] to
      find out if a mark has been removed from its buffer.
      The #GtkTextBuffer::mark-deleted signal will be emitted as notification after
      the mark is deleted.
  
      Params:
        mark = a #GtkTextMark in buffer
  */
  void deleteMark(gtk.text_mark.TextMark mark)
  {
    gtk_text_buffer_delete_mark(cast(GtkTextBuffer*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
  }

  /**
      Deletes the mark named name; the mark must exist. See
      [gtk.text_buffer.TextBuffer.deleteMark] for details.
  
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
      that is, the currently-selected text. If interactive is true,
      the editability of the selection will be considered (users can’t delete
      uneditable text).
  
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
      This function deserializes rich text in format format and inserts
      it at iter.
      
      formats to be used must be registered using
      [gtk.text_buffer.TextBuffer.registerDeserializeFormat] or
      [gtk.text_buffer.TextBuffer.registerDeserializeTagset] beforehand.
  
      Params:
        contentBuffer = the #GtkTextBuffer to deserialize into
        format = the rich text format to use for deserializing
        iter = insertion point for the deserialized text
        data = data to deserialize
      Returns: true on success, false otherwise.
      Throws: [ErrorWrap]
  */
  bool deserialize(gtk.text_buffer.TextBuffer contentBuffer, gdk.atom.Atom format, gtk.text_iter.TextIter iter, ubyte[] data)
  {
    bool _retval;
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _retval = cast(bool)gtk_text_buffer_deserialize(cast(GtkTextBuffer*)this._cPtr, contentBuffer ? cast(GtkTextBuffer*)contentBuffer._cPtr(No.Dup) : null, format ? cast(GdkAtom)format._cPtr : null, cast(GtkTextIter*)&iter, _data, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      This functions returns the value set with
      [gtk.text_buffer.TextBuffer.deserializeSetCanCreateTags]
  
      Params:
        format = a #GdkAtom representing a registered rich text format
      Returns: whether deserializing this format may create tags
  */
  bool deserializeGetCanCreateTags(gdk.atom.Atom format)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_deserialize_get_can_create_tags(cast(GtkTextBuffer*)this._cPtr, format ? cast(GdkAtom)format._cPtr : null);
    return _retval;
  }

  /**
      Use this function to allow a rich text deserialization function to
      create new tags in the receiving buffer. Note that using this
      function is almost always a bad idea, because the rich text
      functions you register should know how to map the rich text format
      they handler to your text buffers set of tags.
      
      The ability of creating new (arbitrary!) tags in the receiving buffer
      is meant for special rich text formats like the internal one that
      is registered using [gtk.text_buffer.TextBuffer.registerDeserializeTagset],
      because that format is essentially a dump of the internal structure
      of the source buffer, including its tag names.
      
      You should allow creation of tags only if you know what you are
      doing, e.g. if you defined a tagset name for your application
      suite’s text buffers and you know that it’s fine to receive new
      tags from these buffers, because you know that your application can
      handle the newly created tags.
  
      Params:
        format = a #GdkAtom representing a registered rich text format
        canCreateTags = whether deserializing this format may create tags
  */
  void deserializeSetCanCreateTags(gdk.atom.Atom format, bool canCreateTags)
  {
    gtk_text_buffer_deserialize_set_can_create_tags(cast(GtkTextBuffer*)this._cPtr, format ? cast(GdkAtom)format._cPtr : null, canCreateTags);
  }

  /**
      Should be paired with a call to [gtk.text_buffer.TextBuffer.beginUserAction].
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
    gtk_text_buffer_get_bounds(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&start, cast(GtkTextIter*)&end);
  }

  /**
      Gets the number of characters in the buffer; note that characters
      and bytes are not the same, you can’t e.g. expect the contents of
      the buffer in string form to be this many bytes long. The character
      count is cached, so this function is very fast.
      Returns: number of characters in the buffer
  */
  int getCharCount()
  {
    int _retval;
    _retval = gtk_text_buffer_get_char_count(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      This function returns the list of targets this text buffer can
      provide for copying and as DND source. The targets in the list are
      added with info values from the #GtkTextBufferTargetInfo enum,
      using [gtk.target_list.TargetList.addRichTextTargets] and
      [gtk.target_list.TargetList.addTextTargets].
      Returns: the #GtkTargetList
  */
  gtk.target_list.TargetList getCopyTargetList()
  {
    GtkTargetList* _cretval;
    _cretval = gtk_text_buffer_get_copy_target_list(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = _cretval ? new gtk.target_list.TargetList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes iter with the “end iterator,” one past the last valid
      character in the text buffer. If dereferenced with
      [gtk.text_iter.TextIter.getChar], the end iterator has a character value of 0.
      The entire buffer lies in the range from the first position in
      the buffer (call [gtk.text_buffer.TextBuffer.getStartIter] to get
      character position 0) to the end iterator.
  
      Params:
        iter = iterator to initialize
  */
  void getEndIter(out gtk.text_iter.TextIter iter)
  {
    gtk_text_buffer_get_end_iter(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter);
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
      Equivalent to calling [gtk.text_buffer.TextBuffer.getMark] to get the mark
      named “insert”, but very slightly more efficient, and involves less
      typing.
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
    gtk_text_buffer_get_iter_at_child_anchor(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
  }

  /**
      Initializes iter to the start of the given line. If line_number is greater
      than the number of lines in the buffer, the end iterator is returned.
  
      Params:
        iter = iterator to initialize
        lineNumber = line number counting from 0
  */
  void getIterAtLine(out gtk.text_iter.TextIter iter, int lineNumber)
  {
    gtk_text_buffer_get_iter_at_line(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, lineNumber);
  }

  /**
      Obtains an iterator pointing to byte_index within the given line.
      byte_index must be the start of a UTF-8 character. Note bytes, not
      characters; UTF-8 may encode one character as multiple bytes.
      
      Before the 3.20 version, it was not allowed to pass an invalid location.
      
      Since the 3.20 version, if line_number is greater than the number of lines
      in the buffer, the end iterator is returned. And if byte_index is off the
      end of the line, the iterator at the end of the line is returned.
  
      Params:
        iter = iterator to initialize
        lineNumber = line number counting from 0
        byteIndex = byte index from start of line
  */
  void getIterAtLineIndex(out gtk.text_iter.TextIter iter, int lineNumber, int byteIndex)
  {
    gtk_text_buffer_get_iter_at_line_index(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, lineNumber, byteIndex);
  }

  /**
      Obtains an iterator pointing to char_offset within the given line. Note
      characters, not bytes; UTF-8 may encode one character as multiple bytes.
      
      Before the 3.20 version, it was not allowed to pass an invalid location.
      
      Since the 3.20 version, if line_number is greater than the number of lines
      in the buffer, the end iterator is returned. And if char_offset is off the
      end of the line, the iterator at the end of the line is returned.
  
      Params:
        iter = iterator to initialize
        lineNumber = line number counting from 0
        charOffset = char offset from start of line
  */
  void getIterAtLineOffset(out gtk.text_iter.TextIter iter, int lineNumber, int charOffset)
  {
    gtk_text_buffer_get_iter_at_line_offset(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, lineNumber, charOffset);
  }

  /**
      Initializes iter with the current position of mark.
  
      Params:
        iter = iterator to initialize
        mark = a #GtkTextMark in buffer
  */
  void getIterAtMark(out gtk.text_iter.TextIter iter, gtk.text_mark.TextMark mark)
  {
    gtk_text_buffer_get_iter_at_mark(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
  }

  /**
      Initializes iter to a position char_offset chars from the start
      of the entire buffer. If char_offset is -1 or greater than the number
      of characters in the buffer, iter is initialized to the end iterator,
      the iterator one past the last valid character in the buffer.
  
      Params:
        iter = iterator to initialize
        charOffset = char offset from start of buffer, counting from 0, or -1
  */
  void getIterAtOffset(out gtk.text_iter.TextIter iter, int charOffset)
  {
    gtk_text_buffer_get_iter_at_offset(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, charOffset);
  }

  /**
      Obtains the number of lines in the buffer. This value is cached, so
      the function is very fast.
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
      Returns: a #GtkTextMark, or null
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
      Indicates whether the buffer has been modified since the last call
      to [gtk.text_buffer.TextBuffer.setModified] set the modification flag to
      false. Used for example to enable a “save” function in a text
      editor.
      Returns: true if the buffer has been modified
  */
  bool getModified()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_get_modified(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      This function returns the list of targets this text buffer supports
      for pasting and as DND destination. The targets in the list are
      added with info values from the #GtkTextBufferTargetInfo enum,
      using [gtk.target_list.TargetList.addRichTextTargets] and
      [gtk.target_list.TargetList.addTextTargets].
      Returns: the #GtkTargetList
  */
  gtk.target_list.TargetList getPasteTargetList()
  {
    GtkTargetList* _cretval;
    _cretval = gtk_text_buffer_get_paste_target_list(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = _cretval ? new gtk.target_list.TargetList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the mark that represents the selection bound.  Equivalent
      to calling [gtk.text_buffer.TextBuffer.getMark] to get the mark named
      “selection_bound”, but very slightly more efficient, and involves
      less typing.
      
      The currently-selected text in buffer is the region between the
      “selection_bound” and “insert” marks. If “selection_bound” and
      “insert” are in the same place, then there is no current selection.
      [gtk.text_buffer.TextBuffer.getSelectionBounds] is another convenient function
      for handling the selection, if you just want to know whether there’s a
      selection and what its bounds are.
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
      of the selection in start and end (if the selection has length 0,
      then start and end are filled in with the same value).
      start and end will be in ascending order. If start and end are
      NULL, then they are not filled in, but the return value still indicates
      whether text is selected.
  
      Params:
        start = iterator to initialize with selection start
        end = iterator to initialize with selection end
      Returns: whether the selection has nonzero length
  */
  bool getSelectionBounds(out gtk.text_iter.TextIter start, out gtk.text_iter.TextIter end)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_get_selection_bounds(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&start, cast(GtkTextIter*)&end);
    return _retval;
  }

  /**
      Returns the text in the range [start,end). Excludes undisplayed
      text (text marked with tags that set the invisibility attribute) if
      include_hidden_chars is false. The returned string includes a
      0xFFFC character whenever the buffer contains
      embedded images, so byte and character indexes into
      the returned string do correspond to byte
      and character indexes into the buffer. Contrast with
      [gtk.text_buffer.TextBuffer.getText]. Note that 0xFFFC can occur in normal
      text as well, so it is not a reliable indicator that a pixbuf or
      widget is in the buffer.
  
      Params:
        start = start of a range
        end = end of a range
        includeHiddenChars = whether to include invisible text
      Returns: an allocated UTF-8 string
  */
  string getSlice(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, bool includeHiddenChars)
  {
    char* _cretval;
    _cretval = gtk_text_buffer_get_slice(cast(GtkTextBuffer*)this._cPtr, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end, includeHiddenChars);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Initialized iter with the first position in the text buffer. This
      is the same as using [gtk.text_buffer.TextBuffer.getIterAtOffset] to get
      the iter at character offset 0.
  
      Params:
        iter = iterator to initialize
  */
  void getStartIter(out gtk.text_iter.TextIter iter)
  {
    gtk_text_buffer_get_start_iter(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter);
  }

  /**
      Get the #GtkTextTagTable associated with this buffer.
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
      Returns the text in the range [start,end). Excludes undisplayed
      text (text marked with tags that set the invisibility attribute) if
      include_hidden_chars is false. Does not include characters
      representing embedded images, so byte and character indexes into
      the returned string do not correspond to byte
      and character indexes into the buffer. Contrast with
      [gtk.text_buffer.TextBuffer.getSlice].
  
      Params:
        start = start of a range
        end = end of a range
        includeHiddenChars = whether to include invisible text
      Returns: an allocated UTF-8 string
  */
  string getText(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, bool includeHiddenChars)
  {
    char* _cretval;
    _cretval = gtk_text_buffer_get_text(cast(GtkTextBuffer*)this._cPtr, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end, includeHiddenChars);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Inserts len bytes of text at position iter.  If len is -1,
      text must be nul-terminated and will be inserted in its
      entirety. Emits the “insert-text” signal; insertion actually occurs
      in the default handler for the signal. iter is invalidated when
      insertion occurs (because the buffer contents change), but the
      default signal handler revalidates it to point to the end of the
      inserted text.
  
      Params:
        iter = a position in the buffer
        text = text in UTF-8 format
        len = length of text in bytes, or -1
  */
  void insert(gtk.text_iter.TextIter iter, string text, int len)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_text_buffer_insert(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, _text, len);
  }

  /**
      Simply calls [gtk.text_buffer.TextBuffer.insert], using the current
      cursor position as the insertion point.
  
      Params:
        text = text in UTF-8 format
        len = length of text, in bytes
  */
  void insertAtCursor(string text, int len)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_text_buffer_insert_at_cursor(cast(GtkTextBuffer*)this._cPtr, _text, len);
  }

  /**
      Inserts a child widget anchor into the text buffer at iter. The
      anchor will be counted as one character in character counts, and
      when obtaining the buffer contents as a string, will be represented
      by the Unicode “object replacement character” 0xFFFC. Note that the
      “slice” variants for obtaining portions of the buffer as a string
      include this character for child anchors, but the “text” variants do
      not. E.g. see [gtk.text_buffer.TextBuffer.getSlice] and
      [gtk.text_buffer.TextBuffer.getText]. Consider
      [gtk.text_buffer.TextBuffer.createChildAnchor] as a more convenient
      alternative to this function. The buffer will add a reference to
      the anchor, so you can unref it after insertion.
  
      Params:
        iter = location to insert the anchor
        anchor = a #GtkTextChildAnchor
  */
  void insertChildAnchor(gtk.text_iter.TextIter iter, gtk.text_child_anchor.TextChildAnchor anchor)
  {
    gtk_text_buffer_insert_child_anchor(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
  }

  /**
      Like [gtk.text_buffer.TextBuffer.insert], but the insertion will not occur if
      iter is at a non-editable location in the buffer. Usually you
      want to prevent insertions at ineditable locations if the insertion
      results from a user action (is interactive).
      
      default_editable indicates the editability of text that doesn't
      have a tag affecting editability applied to it. Typically the
      result of [gtk.text_view.TextView.getEditable] is appropriate here.
  
      Params:
        iter = a position in buffer
        text = some UTF-8 text
        len = length of text in bytes, or -1
        defaultEditable = default editability of buffer
      Returns: whether text was actually inserted
  */
  bool insertInteractive(gtk.text_iter.TextIter iter, string text, int len, bool defaultEditable)
  {
    bool _retval;
    const(char)* _text = text.toCString(No.Alloc);
    _retval = cast(bool)gtk_text_buffer_insert_interactive(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, _text, len, defaultEditable);
    return _retval;
  }

  /**
      Calls [gtk.text_buffer.TextBuffer.insertInteractive] at the cursor
      position.
      
      default_editable indicates the editability of text that doesn't
      have a tag affecting editability applied to it. Typically the
      result of [gtk.text_view.TextView.getEditable] is appropriate here.
  
      Params:
        text = text in UTF-8 format
        len = length of text in bytes, or -1
        defaultEditable = default editability of buffer
      Returns: whether text was actually inserted
  */
  bool insertInteractiveAtCursor(string text, int len, bool defaultEditable)
  {
    bool _retval;
    const(char)* _text = text.toCString(No.Alloc);
    _retval = cast(bool)gtk_text_buffer_insert_interactive_at_cursor(cast(GtkTextBuffer*)this._cPtr, _text, len, defaultEditable);
    return _retval;
  }

  /**
      Inserts the text in markup at position iter. markup will be inserted
      in its entirety and must be nul-terminated and valid UTF-8. Emits the
      #GtkTextBuffer::insert-text signal, possibly multiple times; insertion
      actually occurs in the default handler for the signal. iter will point
      to the end of the inserted text on return.
  
      Params:
        iter = location to insert the markup
        markup = a nul-terminated UTF-8 string containing [Pango markup][PangoMarkupFormat]
        len = length of markup in bytes, or -1
  */
  void insertMarkup(gtk.text_iter.TextIter iter, string markup, int len)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_text_buffer_insert_markup(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, _markup, len);
  }

  /**
      Inserts an image into the text buffer at iter. The image will be
      counted as one character in character counts, and when obtaining
      the buffer contents as a string, will be represented by the Unicode
      “object replacement character” 0xFFFC. Note that the “slice”
      variants for obtaining portions of the buffer as a string include
      this character for pixbufs, but the “text” variants do
      not. e.g. see [gtk.text_buffer.TextBuffer.getSlice] and
      [gtk.text_buffer.TextBuffer.getText].
  
      Params:
        iter = location to insert the pixbuf
        pixbuf = a #GdkPixbuf
  */
  void insertPixbuf(gtk.text_iter.TextIter iter, gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    gtk_text_buffer_insert_pixbuf(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Copies text, tags, and pixbufs between start and end (the order
      of start and end doesn’t matter) and inserts the copy at iter.
      Used instead of simply getting/inserting text because it preserves
      images and tags. If start and end are in a different buffer from
      buffer, the two buffers must share the same tag table.
      
      Implemented via emissions of the insert_text and apply_tag signals,
      so expect those.
  
      Params:
        iter = a position in buffer
        start = a position in a #GtkTextBuffer
        end = another position in the same buffer as start
  */
  void insertRange(gtk.text_iter.TextIter iter, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_text_buffer_insert_range(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end);
  }

  /**
      Same as [gtk.text_buffer.TextBuffer.insertRange], but does nothing if the
      insertion point isn’t editable. The default_editable parameter
      indicates whether the text is editable at iter if no tags
      enclosing iter affect editability. Typically the result of
      [gtk.text_view.TextView.getEditable] is appropriate here.
  
      Params:
        iter = a position in buffer
        start = a position in a #GtkTextBuffer
        end = another position in the same buffer as start
        defaultEditable = default editability of the buffer
      Returns: whether an insertion was possible at iter
  */
  bool insertRangeInteractive(gtk.text_iter.TextIter iter, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, bool defaultEditable)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_insert_range_interactive(cast(GtkTextBuffer*)this._cPtr, cast(GtkTextIter*)&iter, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end, defaultEditable);
    return _retval;
  }

  /**
      Moves mark to the new location where. Emits the #GtkTextBuffer::mark-set
      signal as notification of the move.
  
      Params:
        mark = a #GtkTextMark
        where = new location for mark in buffer
  */
  void moveMark(gtk.text_mark.TextMark mark, gtk.text_iter.TextIter where)
  {
    gtk_text_buffer_move_mark(cast(GtkTextBuffer*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null, cast(const(GtkTextIter)*)&where);
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
    gtk_text_buffer_move_mark_by_name(cast(GtkTextBuffer*)this._cPtr, _name, cast(const(GtkTextIter)*)&where);
  }

  /**
      Pastes the contents of a clipboard. If override_location is null, the
      pasted text will be inserted at the cursor position, or the buffer selection
      will be replaced if the selection is non-empty.
      
      Note: pasting is asynchronous, that is, we’ll ask for the paste data and
      return, and at some point later after the main loop runs, the paste data will
      be inserted.
  
      Params:
        clipboard = the #GtkClipboard to paste from
        overrideLocation = location to insert pasted text, or null
        defaultEditable = whether the buffer is editable by default
  */
  void pasteClipboard(gtk.clipboard.Clipboard clipboard, gtk.text_iter.TextIter overrideLocation, bool defaultEditable)
  {
    gtk_text_buffer_paste_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GtkClipboard*)clipboard._cPtr(No.Dup) : null, cast(GtkTextIter*)&overrideLocation, defaultEditable);
  }

  /**
      This function moves the “insert” and “selection_bound” marks
      simultaneously.  If you move them to the same place in two steps
      with [gtk.text_buffer.TextBuffer.moveMark], you will temporarily select a
      region in between their old and new locations, which can be pretty
      inefficient since the temporarily-selected region will force stuff
      to be recalculated. This function moves them as a unit, which can
      be optimized.
  
      Params:
        where = where to put the cursor
  */
  void placeCursor(gtk.text_iter.TextIter where)
  {
    gtk_text_buffer_place_cursor(cast(GtkTextBuffer*)this._cPtr, cast(const(GtkTextIter)*)&where);
  }

  /**
      This function registers a rich text deserialization function along with
      its mime_type with the passed buffer.
  
      Params:
        mimeType = the format’s mime-type
        function_ = the deserialize function to register
      Returns: the #GdkAtom that corresponds to the
                      newly registered format’s mime-type.
  */
  gdk.atom.Atom registerDeserializeFormat(string mimeType, gtk.types.TextBufferDeserializeFunc function_)
  {
    extern(C) gboolean _function_Callback(GtkTextBuffer* registerBuffer, GtkTextBuffer* contentBuffer, GtkTextIter* iter, const(ubyte)* data, size_t length, gboolean createTags, void* userData, GError **_err)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TextBufferDeserializeFunc*)userData;
      ubyte[] _data;
      _data.length = length;
      _data[0 .. length] = data[0 .. length];

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.text_buffer.TextBuffer)(cast(void*)registerBuffer, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.text_buffer.TextBuffer)(cast(void*)contentBuffer, No.Take), *cast(gtk.text_iter.TextIter*)iter, _data, cast(bool)createTags, _err);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _function_CB = function_ ? &_function_Callback : null;
    GdkAtom _cretval;
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
    GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
    _cretval = gtk_text_buffer_register_deserialize_format(cast(GtkTextBuffer*)this._cPtr, _mimeType, _function_CB, _function_, _function_DestroyCB);
    auto _retval = _cretval ? new gdk.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function registers GTK+’s internal rich text serialization
      format with the passed buffer. See
      [gtk.text_buffer.TextBuffer.registerSerializeTagset] for details.
  
      Params:
        tagsetName = an optional tagset name, on null
      Returns: the #GdkAtom that corresponds to the
                      newly registered format’s mime-type.
  */
  gdk.atom.Atom registerDeserializeTagset(string tagsetName = null)
  {
    GdkAtom _cretval;
    const(char)* _tagsetName = tagsetName.toCString(No.Alloc);
    _cretval = gtk_text_buffer_register_deserialize_tagset(cast(GtkTextBuffer*)this._cPtr, _tagsetName);
    auto _retval = _cretval ? new gdk.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function registers a rich text serialization function along with
      its mime_type with the passed buffer.
  
      Params:
        mimeType = the format’s mime-type
        function_ = the serialize function to register
      Returns: the #GdkAtom that corresponds to the
                      newly registered format’s mime-type.
  */
  gdk.atom.Atom registerSerializeFormat(string mimeType, gtk.types.TextBufferSerializeFunc function_)
  {
    extern(C) ubyte* _function_Callback(GtkTextBuffer* registerBuffer, GtkTextBuffer* contentBuffer, const(GtkTextIter)* start, const(GtkTextIter)* end, size_t* length, void* userData)
    {
      ubyte[] _dretval;
      auto _dlg = cast(gtk.types.TextBufferSerializeFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.text_buffer.TextBuffer)(cast(void*)registerBuffer, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.text_buffer.TextBuffer)(cast(void*)contentBuffer, No.Take), *cast(gtk.text_iter.TextIter*)start, *cast(gtk.text_iter.TextIter*)end);
      ubyte* _retval;

      if (_dretval.length > 0)
      {
        _retval = cast(ubyte*)gMalloc(_dretval.length * (*_retval).sizeof);
        _retval[0 .. _dretval.length] = _dretval[];
      }

      *length = cast(typeof(length))_dretval.length;

      return _retval;
    }
    auto _function_CB = function_ ? &_function_Callback : null;
    GdkAtom _cretval;
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
    GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
    _cretval = gtk_text_buffer_register_serialize_format(cast(GtkTextBuffer*)this._cPtr, _mimeType, _function_CB, _function_, _function_DestroyCB);
    auto _retval = _cretval ? new gdk.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function registers GTK+’s internal rich text serialization
      format with the passed buffer. The internal format does not comply
      to any standard rich text format and only works between #GtkTextBuffer
      instances. It is capable of serializing all of a text buffer’s tags
      and embedded pixbufs.
      
      This function is just a wrapper around
      [gtk.text_buffer.TextBuffer.registerSerializeFormat]. The mime type used
      for registering is “application/x-gtk-text-buffer-rich-text”, or
      “application/x-gtk-text-buffer-rich-text;format=tagset_name” if a
      tagset_name was passed.
      
      The tagset_name can be used to restrict the transfer of rich text
      to buffers with compatible sets of tags, in order to avoid unknown
      tags from being pasted. It is probably the common case to pass an
      identifier != null here, since the null tagset requires the
      receiving buffer to deal with with pasting of arbitrary tags.
  
      Params:
        tagsetName = an optional tagset name, on null
      Returns: the #GdkAtom that corresponds to the
                      newly registered format’s mime-type.
  */
  gdk.atom.Atom registerSerializeTagset(string tagsetName = null)
  {
    GdkAtom _cretval;
    const(char)* _tagsetName = tagsetName.toCString(No.Alloc);
    _cretval = gtk_text_buffer_register_serialize_tagset(cast(GtkTextBuffer*)this._cPtr, _tagsetName);
    auto _retval = _cretval ? new gdk.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Removes all tags in the range between start and end.  Be careful
      with this function; it could remove tags added in code unrelated to
      the code you’re currently writing. That is, using this function is
      probably a bad idea if you have two or more unrelated code sections
      that add tags.
  
      Params:
        start = one bound of range to be untagged
        end = other bound of range to be untagged
  */
  void removeAllTags(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_text_buffer_remove_all_tags(cast(GtkTextBuffer*)this._cPtr, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end);
  }

  /**
      Removes a #GtkClipboard added with
      [gtk.text_buffer.TextBuffer.addSelectionClipboard].
  
      Params:
        clipboard = a #GtkClipboard added to buffer by
                      [gtk.text_buffer.TextBuffer.addSelectionClipboard]
  */
  void removeSelectionClipboard(gtk.clipboard.Clipboard clipboard)
  {
    gtk_text_buffer_remove_selection_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GtkClipboard*)clipboard._cPtr(No.Dup) : null);
  }

  /**
      Emits the “remove-tag” signal. The default handler for the signal
      removes all occurrences of tag from the given range. start and
      end don’t have to be in order.
  
      Params:
        tag = a #GtkTextTag
        start = one bound of range to be untagged
        end = other bound of range to be untagged
  */
  void removeTag(gtk.text_tag.TextTag tag, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_text_buffer_remove_tag(cast(GtkTextBuffer*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end);
  }

  /**
      Calls [gtk.text_tag_table.TextTagTable.lookup] on the buffer’s tag table to
      get a #GtkTextTag, then calls [gtk.text_buffer.TextBuffer.removeTag].
  
      Params:
        name = name of a #GtkTextTag
        start = one bound of range to be untagged
        end = other bound of range to be untagged
  */
  void removeTagByName(string name, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_text_buffer_remove_tag_by_name(cast(GtkTextBuffer*)this._cPtr, _name, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end);
  }

  /**
      This function moves the “insert” and “selection_bound” marks
      simultaneously.  If you move them in two steps
      with [gtk.text_buffer.TextBuffer.moveMark], you will temporarily select a
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
    gtk_text_buffer_select_range(cast(GtkTextBuffer*)this._cPtr, cast(const(GtkTextIter)*)&ins, cast(const(GtkTextIter)*)&bound);
  }

  /**
      This function serializes the portion of text between start
      and end in the rich text format represented by format.
      
      formats to be used must be registered using
      [gtk.text_buffer.TextBuffer.registerSerializeFormat] or
      [gtk.text_buffer.TextBuffer.registerSerializeTagset] beforehand.
  
      Params:
        contentBuffer = the #GtkTextBuffer to serialize
        format = the rich text format to use for serializing
        start = start of block of text to serialize
        end = end of block of test to serialize
      Returns: the serialized
                      data, encoded as format
  */
  ubyte[] serialize(gtk.text_buffer.TextBuffer contentBuffer, gdk.atom.Atom format, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    ubyte* _cretval;
    size_t _cretlength;
    _cretval = gtk_text_buffer_serialize(cast(GtkTextBuffer*)this._cPtr, contentBuffer ? cast(GtkTextBuffer*)contentBuffer._cPtr(No.Dup) : null, format ? cast(GdkAtom)format._cPtr : null, cast(const(GtkTextIter)*)&start, cast(const(GtkTextIter)*)&end, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Used to keep track of whether the buffer has been modified since the
      last time it was saved. Whenever the buffer is saved to disk, call
      gtk_text_buffer_set_modified (buffer, FALSE). When the buffer is modified,
      it will automatically toggled on the modified bit again. When the modified
      bit flips, the buffer emits the #GtkTextBuffer::modified-changed signal.
  
      Params:
        setting = modification flag setting
  */
  void setModified(bool setting)
  {
    gtk_text_buffer_set_modified(cast(GtkTextBuffer*)this._cPtr, setting);
  }

  /**
      Deletes current contents of buffer, and inserts text instead. If
      len is -1, text must be nul-terminated. text must be valid UTF-8.
  
      Params:
        text = UTF-8 text to insert
        len = length of text in bytes
  */
  void setText(string text, int len)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_text_buffer_set_text(cast(GtkTextBuffer*)this._cPtr, _text, len);
  }

  /**
      This function unregisters a rich text format that was previously
      registered using [gtk.text_buffer.TextBuffer.registerDeserializeFormat] or
      [gtk.text_buffer.TextBuffer.registerDeserializeTagset].
  
      Params:
        format = a #GdkAtom representing a registered rich text format.
  */
  void unregisterDeserializeFormat(gdk.atom.Atom format)
  {
    gtk_text_buffer_unregister_deserialize_format(cast(GtkTextBuffer*)this._cPtr, format ? cast(GdkAtom)format._cPtr : null);
  }

  /**
      This function unregisters a rich text format that was previously
      registered using [gtk.text_buffer.TextBuffer.registerSerializeFormat] or
      [gtk.text_buffer.TextBuffer.registerSerializeTagset]
  
      Params:
        format = a #GdkAtom representing a registered rich text format.
  */
  void unregisterSerializeFormat(gdk.atom.Atom format)
  {
    gtk_text_buffer_unregister_serialize_format(cast(GtkTextBuffer*)this._cPtr, format ? cast(GdkAtom)format._cPtr : null);
  }

  /**
      Connect to `ApplyTag` signal.
  
      The ::apply-tag signal is emitted to apply a tag to a
        range of text in a #GtkTextBuffer.
        Applying actually occurs in the default handler.
        
        Note that if your handler runs before the default handler it must not
        invalidate the start and end iters (or has to revalidate them).
        
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
  
      The ::begin-user-action signal is emitted at the beginning of a single
        user-visible operation on a #GtkTextBuffer.
        
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
  
      The ::changed signal is emitted when the content of a #GtkTextBuffer
        has changed.
  
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
  
      The ::delete-range signal is emitted to delete a range
        from a #GtkTextBuffer.
        
        Note that if your handler runs before the default handler it must not
        invalidate the start and end iters (or has to revalidate them).
        The default signal handler revalidates the start and end iters to
        both point to the location where text was deleted. Handlers
        which run after the default handler (see g_signal_connect_after())
        do not have access to the deleted text.
        
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
  
      The ::end-user-action signal is emitted at the end of a single
        user-visible operation on the #GtkTextBuffer.
        
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
  
      The ::insert-child-anchor signal is emitted to insert a
        #GtkTextChildAnchor in a #GtkTextBuffer.
        Insertion actually occurs in the default handler.
        
        Note that if your handler runs before the default handler it must
        not invalidate the location iter (or has to revalidate it).
        The default signal handler revalidates it to be placed after the
        inserted anchor.
        
        See also: [gtk.text_buffer.TextBuffer.insertChildAnchor].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter location, gtk.text_child_anchor.TextChildAnchor anchor, gtk.text_buffer.TextBuffer textBuffer))
  
          `location` position to insert anchor in textbuffer (optional)
  
          `anchor` the #GtkTextChildAnchor to be inserted (optional)
  
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
      Connect to `InsertPixbuf` signal.
  
      The ::insert-pixbuf signal is emitted to insert a #GdkPixbuf
        in a #GtkTextBuffer. Insertion actually occurs in the default handler.
        
        Note that if your handler runs before the default handler it must not
        invalidate the location iter (or has to revalidate it).
        The default signal handler revalidates it to be placed after the
        inserted pixbuf.
        
        See also: [gtk.text_buffer.TextBuffer.insertPixbuf].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter location, gdkpixbuf.pixbuf.Pixbuf pixbuf, gtk.text_buffer.TextBuffer textBuffer))
  
          `location` position to insert pixbuf in textbuffer (optional)
  
          `pixbuf` the #GdkPixbuf to be inserted (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertPixbuf(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdkpixbuf.pixbuf.Pixbuf)))
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
    return connectSignalClosure("insert-pixbuf", closure, after);
  }

  /**
      Connect to `InsertText` signal.
  
      The ::insert-text signal is emitted to insert text in a #GtkTextBuffer.
        Insertion actually occurs in the default handler.
        
        Note that if your handler runs before the default handler it must not
        invalidate the location iter (or has to revalidate it).
        The default signal handler revalidates it to point to the end of the
        inserted text.
        
        See also:
        [gtk.text_buffer.TextBuffer.insert],
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
  
      The ::mark-deleted signal is emitted as notification
        after a #GtkTextMark is deleted.
        
        See also:
        [gtk.text_buffer.TextBuffer.deleteMark].
  
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
  
      The ::mark-set signal is emitted as notification
        after a #GtkTextMark is set.
        
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
  
      The ::modified-changed signal is emitted when the modified bit of a
        #GtkTextBuffer flips.
        
        See also:
        [gtk.text_buffer.TextBuffer.setModified].
  
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
  
      The paste-done signal is emitted after paste operation has been completed.
        This is useful to properly scroll the view to the end of the pasted text.
        See [gtk.text_buffer.TextBuffer.pasteClipboard] for more details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.clipboard.Clipboard clipboard, gtk.text_buffer.TextBuffer textBuffer))
  
          `clipboard` the #GtkClipboard pasted from (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPasteDone(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.clipboard.Clipboard)))
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
      Connect to `RemoveTag` signal.
  
      The ::remove-tag signal is emitted to remove all occurrences of tag from
        a range of text in a #GtkTextBuffer.
        Removal actually occurs in the default handler.
        
        Note that if your handler runs before the default handler it must not
        invalidate the start and end iters (or has to revalidate them).
        
        See also:
        [gtk.text_buffer.TextBuffer.removeTag].
  
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
}
