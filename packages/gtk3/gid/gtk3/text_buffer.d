/// Module for [TextBuffer] class
module gid.gtk3.text_buffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.atom;
import gid.gdkpixbuf2.pixbuf;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.clipboard;
import gid.gtk3.target_list;
import gid.gtk3.text_child_anchor;
import gid.gtk3.text_iter;
import gid.gtk3.text_mark;
import gid.gtk3.text_tag;
import gid.gtk3.text_tag_table;
import gid.gtk3.types;

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and data
    types related to the text widget and how they work together.
*/
class TextBuffer : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_text_buffer_get_type != &gidSymbolNotFound ? gtk_text_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTextBuffer";
  }

  /** Returns `this`, for use in `with` statements. */
  override TextBuffer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.text_buffer.TextBuffer]
      Returns: New builder object
  */
  static TextBufferGidBuilder builder() nothrow
  {
    return new TextBufferGidBuilder;
  }

  /**
      Get `copyTargetList` property.
      Returns: The list of targets this buffer supports for clipboard copying
        and as DND source.
  */
  @property gid.gtk3.target_list.TargetList copyTargetList() nothrow
  {
    return getCopyTargetList();
  }

  /**
      Get `cursorPosition` property.
      Returns: The position of the insert mark (as offset from the beginning
        of the buffer). It is useful for getting notified when the
        cursor moves.
  */
  @property int cursorPosition() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("cursor-position");
  }

  /**
      Get `hasSelection` property.
      Returns: Whether the buffer has some text currently selected.
  */
  @property bool hasSelection() nothrow
  {
    return getHasSelection();
  }

  /**
      Get `pasteTargetList` property.
      Returns: The list of targets this buffer supports for clipboard pasting
        and as DND destination.
  */
  @property gid.gtk3.target_list.TargetList pasteTargetList() nothrow
  {
    return getPasteTargetList();
  }

  /** */
  @property gid.gtk3.text_tag_table.TextTagTable tagTable() nothrow
  {
    return getTagTable();
  }

  /**
      Get `text` property.
      Returns: The text content of the buffer. Without child widgets and images,
        see [gid.gtk4.text_buffer.TextBuffer.getText] for more information.
  */
  @property string text() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = The text content of the buffer. Without child widgets and images,
          see [gid.gtk4.text_buffer.TextBuffer.getText] for more information.
  */
  @property void text(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Creates a new text buffer.
  
      Params:
        table = a tag table, or null to create a new one
      Returns: a new text buffer
  */
  this(gid.gtk3.text_tag_table.TextTagTable table = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, table !is null), Yes.Take);
    }
    else
    {
      GtkTextBuffer* _cretval;
      _cretval = gtk_text_buffer_new(table ? cast(GtkTextTagTable*)table._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Emits the “apply-tag” signal on buffer. The default
      handler for the signal applies tag to the given range.
      start and end do not have to be in order.
  
      Params:
        tag = a #GtkTextTag
        start = one bound of range to be tagged
        end = other bound of range to be tagged
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncApplyTag` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncApplyTag(gid.gtk3.text_tag.TextTag tag, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end)
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.applyTag)
      return;

    _klass.applyTag(cast(GtkTextBuffer*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Called to indicate that the buffer operations between here and a
      call to [gid.gtk4.text_buffer.TextBuffer.endUserAction] are part of a single
      user-visible operation. The operations between
      [gid.gtk4.text_buffer.TextBuffer.beginUserAction] and
      [gid.gtk4.text_buffer.TextBuffer.endUserAction] can then be grouped when creating
      an undo stack. #GtkTextBuffer maintains a count of calls to
      [gid.gtk4.text_buffer.TextBuffer.beginUserAction] that have not been closed with
      a call to [gid.gtk4.text_buffer.TextBuffer.endUserAction], and emits the
      “begin-user-action” and “end-user-action” signals only for the
      outermost pair of calls. This allows you to build user actions
      from other user actions.
      
      The “interactive” buffer mutation functions, such as
      [gid.gtk4.text_buffer.TextBuffer.insertInteractive], automatically call begin/end
      user action around the buffer operations they perform, so there's
      no need to add extra calls if you user action consists solely of a
      single call to one of those functions.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncBeginUserAction` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncBeginUserAction()
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.beginUserAction)
      return;

    _klass.beginUserAction(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      The class handler for the #GtkTextBuffer::changed signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncChanged()
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      The class handler for the #GtkTextBuffer::delete-range signal.
  
      Params:
        start =  (modified in place, changes are seen by the caller)
        end =  (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDeleteRange` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncDeleteRange(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end)
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.deleteRange)
      return;

    _klass.deleteRange(cast(GtkTextBuffer*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      Should be paired with a call to [gid.gtk4.text_buffer.TextBuffer.beginUserAction].
      See that function for a full explanation.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEndUserAction` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncEndUserAction()
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.endUserAction)
      return;

    _klass.endUserAction(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      Inserts a child widget anchor into the text buffer at iter. The
      anchor will be counted as one character in character counts, and
      when obtaining the buffer contents as a string, will be represented
      by the Unicode “object replacement character” 0xFFFC. Note that the
      “slice” variants for obtaining portions of the buffer as a string
      include this character for child anchors, but the “text” variants do
      not. E.g. see [gid.gtk4.text_buffer.TextBuffer.getSlice] and
      [gid.gtk4.text_buffer.TextBuffer.getText]. Consider
      [gid.gtk4.text_buffer.TextBuffer.createChildAnchor] as a more convenient
      alternative to this function. The buffer will add a reference to
      the anchor, so you can unref it after insertion.
  
      Params:
        iter = location to insert the anchor (modified in place, changes are seen by the caller)
        anchor = a #GtkTextChildAnchor
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInsertChildAnchor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncInsertChildAnchor(gid.gtk3.text_iter.TextIter iter, gid.gtk3.text_child_anchor.TextChildAnchor anchor)
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.insertChildAnchor)
      return;

    _klass.insertChildAnchor(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
  }

  /**
      Inserts an image into the text buffer at iter. The image will be
      counted as one character in character counts, and when obtaining
      the buffer contents as a string, will be represented by the Unicode
      “object replacement character” 0xFFFC. Note that the “slice”
      variants for obtaining portions of the buffer as a string include
      this character for pixbufs, but the “text” variants do
      not. e.g. see [gid.gtk4.text_buffer.TextBuffer.getSlice] and
      [gid.gtk4.text_buffer.TextBuffer.getText].
  
      Params:
        iter = location to insert the pixbuf (modified in place, changes are seen by the caller)
        pixbuf = a #GdkPixbuf
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInsertPixbuf` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncInsertPixbuf(gid.gtk3.text_iter.TextIter iter, gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf)
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.insertPixbuf)
      return;

    _klass.insertPixbuf(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      The class handler for the #GtkTextBuffer::insert-text signal.
  
      Params:
        pos =  (modified in place, changes are seen by the caller)
        newText = 
        newTextLength = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInsertText` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncInsertText(gid.gtk3.text_iter.TextIter pos, string newText, int newTextLength)
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.insertText)
      return;

    const(char)* _newText = newText.toCString!(No.Malloc, No.Nullable);
    _klass.insertText(cast(GtkTextBuffer*)this._cPtr, pos ? cast(GtkTextIter*)pos._cPtr(No.Dup) : null, _newText, newTextLength);
  }

  /**
      The class handler for the #GtkTextBuffer::mark-deleted signal.
  
      Params:
        mark = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMarkDeleted` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncMarkDeleted(gid.gtk3.text_mark.TextMark mark)
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.markDeleted)
      return;

    _klass.markDeleted(cast(GtkTextBuffer*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
  }

  /**
      The class handler for the #GtkTextBuffer::mark-set signal.
  
      Params:
        location = 
        mark = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMarkSet` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncMarkSet(gid.gtk3.text_iter.TextIter location, gid.gtk3.text_mark.TextMark mark)
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.markSet)
      return;

    _klass.markSet(cast(GtkTextBuffer*)this._cPtr, location ? cast(const(GtkTextIter)*)location._cPtr(No.Dup) : null, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
  }

  /**
      The class handler for the #GtkTextBuffer::modified-changed
        signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncModifiedChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncModifiedChanged()
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.modifiedChanged)
      return;

    _klass.modifiedChanged(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      The class handler for the #GtkTextBuffer::paste-done signal.
  
      Params:
        clipboard = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPasteDone` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncPasteDone(gid.gtk3.clipboard.Clipboard clipboard)
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.pasteDone)
      return;

    _klass.pasteDone(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GtkClipboard*)clipboard._cPtr(No.Dup) : null);
  }

  /**
      Emits the “remove-tag” signal. The default handler for the signal
      removes all occurrences of tag from the given range. start and
      end don’t have to be in order.
  
      Params:
        tag = a #GtkTextTag
        start = one bound of range to be untagged
        end = other bound of range to be untagged
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRemoveTag` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncRemoveTag(gid.gtk3.text_tag.TextTag tag, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end)
  {
    auto _klass = cast(GtkTextBufferClass*)_vfuncClass;
    if (!_klass.removeTag)
      return;

    _klass.removeTag(cast(GtkTextBuffer*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
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
  void addMark(gid.gtk3.text_mark.TextMark mark, gid.gtk3.text_iter.TextIter where) nothrow
  {
    gtk_text_buffer_add_mark(cast(GtkTextBuffer*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null);
  }

  /**
      Adds clipboard to the list of clipboards in which the selection
      contents of buffer are available. In most cases, clipboard will be
      the #GtkClipboard of type `GDK_SELECTION_PRIMARY` for a view of buffer.
  
      Params:
        clipboard = a #GtkClipboard
  */
  void addSelectionClipboard(gid.gtk3.clipboard.Clipboard clipboard) nothrow
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
  void applyTag(gid.gtk3.text_tag.TextTag tag, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    gtk_text_buffer_apply_tag(cast(GtkTextBuffer*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Calls [gid.gtk4.text_tag_table.TextTagTable.lookup] on the buffer’s tag table to
      get a #GtkTextTag, then calls [gid.gtk4.text_buffer.TextBuffer.applyTag].
  
      Params:
        name = name of a named #GtkTextTag
        start = one bound of range to be tagged
        end = other bound of range to be tagged
  */
  void applyTagByName(string name, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_text_buffer_apply_tag_by_name(cast(GtkTextBuffer*)this._cPtr, _name, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
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
  bool backspace(gid.gtk3.text_iter.TextIter iter, bool interactive, bool defaultEditable) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_backspace(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, interactive, defaultEditable);
    return _retval;
  }

  /**
      Called to indicate that the buffer operations between here and a
      call to [gid.gtk4.text_buffer.TextBuffer.endUserAction] are part of a single
      user-visible operation. The operations between
      [gid.gtk4.text_buffer.TextBuffer.beginUserAction] and
      [gid.gtk4.text_buffer.TextBuffer.endUserAction] can then be grouped when creating
      an undo stack. #GtkTextBuffer maintains a count of calls to
      [gid.gtk4.text_buffer.TextBuffer.beginUserAction] that have not been closed with
      a call to [gid.gtk4.text_buffer.TextBuffer.endUserAction], and emits the
      “begin-user-action” and “end-user-action” signals only for the
      outermost pair of calls. This allows you to build user actions
      from other user actions.
      
      The “interactive” buffer mutation functions, such as
      [gid.gtk4.text_buffer.TextBuffer.insertInteractive], automatically call begin/end
      user action around the buffer operations they perform, so there's
      no need to add extra calls if you user action consists solely of a
      single call to one of those functions.
  */
  void beginUserAction() nothrow
  {
    gtk_text_buffer_begin_user_action(cast(GtkTextBuffer*)this._cPtr);
  }

  /**
      Copies the currently-selected text to a clipboard.
  
      Params:
        clipboard = the #GtkClipboard object to copy to
  */
  void copyClipboard(gid.gtk3.clipboard.Clipboard clipboard) nothrow
  {
    gtk_text_buffer_copy_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GtkClipboard*)clipboard._cPtr(No.Dup) : null);
  }

  /**
      This is a convenience function which simply creates a child anchor
      with [gid.gtk4.text_child_anchor.TextChildAnchor.new_] and inserts it into the buffer
      with [gid.gtk4.text_buffer.TextBuffer.insertChildAnchor]. The new anchor is
      owned by the buffer; no reference count is returned to
      the caller of [gid.gtk4.text_buffer.TextBuffer.createChildAnchor].
  
      Params:
        iter = location in the buffer
      Returns: the created child anchor
  */
  gid.gtk3.text_child_anchor.TextChildAnchor createChildAnchor(gid.gtk3.text_iter.TextIter iter) nothrow
  {
    GtkTextChildAnchor* _cretval;
    _cretval = gtk_text_buffer_create_child_anchor(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_child_anchor.TextChildAnchor)(cast(GtkTextChildAnchor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a mark at position where. If mark_name is null, the mark
      is anonymous; otherwise, the mark can be retrieved by name using
      [gid.gtk4.text_buffer.TextBuffer.getMark]. If a mark has left gravity, and text is
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
  gid.gtk3.text_mark.TextMark createMark(string markName, gid.gtk3.text_iter.TextIter where, bool leftGravity) nothrow
  {
    GtkTextMark* _cretval;
    const(char)* _markName = markName.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_text_buffer_create_mark(cast(GtkTextBuffer*)this._cPtr, _markName, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null, leftGravity);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_mark.TextMark)(cast(GtkTextMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Copies the currently-selected text to a clipboard, then deletes
      said text if it’s editable.
  
      Params:
        clipboard = the #GtkClipboard object to cut to
        defaultEditable = default editability of the buffer
  */
  void cutClipboard(gid.gtk3.clipboard.Clipboard clipboard, bool defaultEditable) nothrow
  {
    gtk_text_buffer_cut_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GtkClipboard*)clipboard._cPtr(No.Dup) : null, defaultEditable);
  }

  /**
      Deletes text between start and end. The order of start and end
      is not actually relevant; [gid.gtk4.text_buffer.TextBuffer.delete_] will reorder
      them. This function actually emits the “delete-range” signal, and
      the default handler of that signal deletes the text. Because the
      buffer is modified, all outstanding iterators become invalid after
      calling this function; however, the start and end will be
      re-initialized to point to the location where text was deleted.
  
      Params:
        start = a position in buffer
        end = another position in buffer
  */
  void delete_(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    gtk_text_buffer_delete(cast(GtkTextBuffer*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      Deletes all editable text in the given range.
      Calls [gid.gtk4.text_buffer.TextBuffer.delete_] for each editable sub-range of
      [start,end). start and end are revalidated to point to
      the location of the last deleted range, or left untouched if
      no text was deleted.
  
      Params:
        startIter = start of range to delete
        endIter = end of range
        defaultEditable = whether the buffer is editable by default
      Returns: whether some text was actually deleted
  */
  bool deleteInteractive(gid.gtk3.text_iter.TextIter startIter, gid.gtk3.text_iter.TextIter endIter, bool defaultEditable) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_delete_interactive(cast(GtkTextBuffer*)this._cPtr, startIter ? cast(GtkTextIter*)startIter._cPtr(No.Dup) : null, endIter ? cast(GtkTextIter*)endIter._cPtr(No.Dup) : null, defaultEditable);
    return _retval;
  }

  /**
      Deletes mark, so that it’s no longer located anywhere in the
      buffer. Removes the reference the buffer holds to the mark, so if
      you haven’t called [gid.gobject2.object.ObjectWrap.ref_] on the mark, it will be freed. Even
      if the mark isn’t freed, most operations on mark become
      invalid, until it gets added to a buffer again with
      [gid.gtk4.text_buffer.TextBuffer.addMark]. Use [gid.gtk4.text_mark.TextMark.getDeleted] to
      find out if a mark has been removed from its buffer.
      The #GtkTextBuffer::mark-deleted signal will be emitted as notification after
      the mark is deleted.
  
      Params:
        mark = a #GtkTextMark in buffer
  */
  void deleteMark(gid.gtk3.text_mark.TextMark mark) nothrow
  {
    gtk_text_buffer_delete_mark(cast(GtkTextBuffer*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
  }

  /**
      Deletes the mark named name; the mark must exist. See
      [gid.gtk4.text_buffer.TextBuffer.deleteMark] for details.
  
      Params:
        name = name of a mark in buffer
  */
  void deleteMarkByName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
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
  bool deleteSelection(bool interactive, bool defaultEditable) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_delete_selection(cast(GtkTextBuffer*)this._cPtr, interactive, defaultEditable);
    return _retval;
  }

  /**
      This function deserializes rich text in format format and inserts
      it at iter.
      
      formats to be used must be registered using
      [gid.gtk3.text_buffer.TextBuffer.registerDeserializeFormat] or
      [gid.gtk3.text_buffer.TextBuffer.registerDeserializeTagset] beforehand.
  
      Params:
        contentBuffer = the #GtkTextBuffer to deserialize into
        format = the rich text format to use for deserializing
        iter = insertion point for the deserialized text
        data = data to deserialize
      Returns: true on success, false otherwise.
      Throws: [ErrorWrap]
  */
  bool deserialize(gid.gtk3.text_buffer.TextBuffer contentBuffer, gid.gdk3.atom.Atom format, gid.gtk3.text_iter.TextIter iter, ubyte[] data)
  {
    bool _retval;
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    GError *_err;
    _retval = cast(bool)gtk_text_buffer_deserialize(cast(GtkTextBuffer*)this._cPtr, contentBuffer ? cast(GtkTextBuffer*)contentBuffer._cPtr(No.Dup) : null, format ? cast(GdkAtom)format._cPtr : null, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _data, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      This functions returns the value set with
      [gid.gtk3.text_buffer.TextBuffer.deserializeSetCanCreateTags]
  
      Params:
        format = a #GdkAtom representing a registered rich text format
      Returns: whether deserializing this format may create tags
  */
  bool deserializeGetCanCreateTags(gid.gdk3.atom.Atom format) nothrow
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
      is registered using [gid.gtk3.text_buffer.TextBuffer.registerDeserializeTagset],
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
  void deserializeSetCanCreateTags(gid.gdk3.atom.Atom format, bool canCreateTags) nothrow
  {
    gtk_text_buffer_deserialize_set_can_create_tags(cast(GtkTextBuffer*)this._cPtr, format ? cast(GdkAtom)format._cPtr : null, canCreateTags);
  }

  /**
      Should be paired with a call to [gid.gtk4.text_buffer.TextBuffer.beginUserAction].
      See that function for a full explanation.
  */
  void endUserAction() nothrow
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
  void getBounds(out gid.gtk3.text_iter.TextIter start, out gid.gtk3.text_iter.TextIter end) nothrow
  {
    auto _start = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    auto _end = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    gtk_text_buffer_get_bounds(cast(GtkTextBuffer*)this._cPtr, _start, _end);
    start = new gid.gtk3.text_iter.TextIter(cast(void*)_start, Yes.Take);
    end = new gid.gtk3.text_iter.TextIter(cast(void*)_end, Yes.Take);
  }

  /**
      Gets the number of characters in the buffer; note that characters
      and bytes are not the same, you can’t e.g. expect the contents of
      the buffer in string form to be this many bytes long. The character
      count is cached, so this function is very fast.
      Returns: number of characters in the buffer
  */
  int getCharCount() nothrow
  {
    int _retval;
    _retval = gtk_text_buffer_get_char_count(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      This function returns the list of targets this text buffer can
      provide for copying and as DND source. The targets in the list are
      added with info values from the #GtkTextBufferTargetInfo enum,
      using [gid.gtk3.target_list.TargetList.addRichTextTargets] and
      [gid.gtk3.target_list.TargetList.addTextTargets].
      Returns: the #GtkTargetList
  */
  gid.gtk3.target_list.TargetList getCopyTargetList() nothrow
  {
    GtkTargetList* _cretval;
    _cretval = gtk_text_buffer_get_copy_target_list(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.target_list.TargetList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function returns the rich text deserialize formats registered
      with buffer using [gid.gtk3.text_buffer.TextBuffer.registerDeserializeFormat] or
      [gid.gtk3.text_buffer.TextBuffer.registerDeserializeTagset]
      Returns: an array of
                      #GdkAtoms representing the registered formats.
  */
  gid.gdk3.atom.Atom[] getDeserializeFormats() nothrow
  {
    GdkAtom* _cretval;
    int _cretlength;
    _cretval = gtk_text_buffer_get_deserialize_formats(cast(GtkTextBuffer*)this._cPtr, &_cretlength);
    gid.gdk3.atom.Atom[] _retval;

    if (_cretval)
    {
      _retval = new gid.gdk3.atom.Atom[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gid.gdk3.atom.Atom(cast(void*)_cretval[i], No.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Initializes iter with the “end iterator,” one past the last valid
      character in the text buffer. If dereferenced with
      [gid.gtk4.text_iter.TextIter.getChar], the end iterator has a character value of 0.
      The entire buffer lies in the range from the first position in
      the buffer (call [gid.gtk4.text_buffer.TextBuffer.getStartIter] to get
      character position 0) to the end iterator.
  
      Params:
        iter = iterator to initialize
  */
  void getEndIter(out gid.gtk3.text_iter.TextIter iter) nothrow
  {
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    gtk_text_buffer_get_end_iter(cast(GtkTextBuffer*)this._cPtr, _iter);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Indicates whether the buffer has some text currently selected.
      Returns: true if the there is text selected
  */
  bool getHasSelection() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_get_has_selection(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the mark that represents the cursor (insertion point).
      Equivalent to calling [gid.gtk4.text_buffer.TextBuffer.getMark] to get the mark
      named “insert”, but very slightly more efficient, and involves less
      typing.
      Returns: insertion point mark
  */
  gid.gtk3.text_mark.TextMark getInsert() nothrow
  {
    GtkTextMark* _cretval;
    _cretval = gtk_text_buffer_get_insert(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_mark.TextMark)(cast(GtkTextMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the location of anchor within buffer.
  
      Params:
        iter = an iterator to be initialized
        anchor = a child anchor that appears in buffer
  */
  void getIterAtChildAnchor(out gid.gtk3.text_iter.TextIter iter, gid.gtk3.text_child_anchor.TextChildAnchor anchor) nothrow
  {
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    gtk_text_buffer_get_iter_at_child_anchor(cast(GtkTextBuffer*)this._cPtr, _iter, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Initializes iter to the start of the given line. If line_number is greater
      than the number of lines in the buffer, the end iterator is returned.
  
      Params:
        iter = iterator to initialize
        lineNumber = line number counting from 0
  */
  void getIterAtLine(out gid.gtk3.text_iter.TextIter iter, int lineNumber) nothrow
  {
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    gtk_text_buffer_get_iter_at_line(cast(GtkTextBuffer*)this._cPtr, _iter, lineNumber);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
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
  void getIterAtLineIndex(out gid.gtk3.text_iter.TextIter iter, int lineNumber, int byteIndex) nothrow
  {
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    gtk_text_buffer_get_iter_at_line_index(cast(GtkTextBuffer*)this._cPtr, _iter, lineNumber, byteIndex);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
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
  void getIterAtLineOffset(out gid.gtk3.text_iter.TextIter iter, int lineNumber, int charOffset) nothrow
  {
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    gtk_text_buffer_get_iter_at_line_offset(cast(GtkTextBuffer*)this._cPtr, _iter, lineNumber, charOffset);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Initializes iter with the current position of mark.
  
      Params:
        iter = iterator to initialize
        mark = a #GtkTextMark in buffer
  */
  void getIterAtMark(out gid.gtk3.text_iter.TextIter iter, gid.gtk3.text_mark.TextMark mark) nothrow
  {
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    gtk_text_buffer_get_iter_at_mark(cast(GtkTextBuffer*)this._cPtr, _iter, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
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
  void getIterAtOffset(out gid.gtk3.text_iter.TextIter iter, int charOffset) nothrow
  {
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    gtk_text_buffer_get_iter_at_offset(cast(GtkTextBuffer*)this._cPtr, _iter, charOffset);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Obtains the number of lines in the buffer. This value is cached, so
      the function is very fast.
      Returns: number of lines in the buffer
  */
  int getLineCount() nothrow
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
  gid.gtk3.text_mark.TextMark getMark(string name) nothrow
  {
    GtkTextMark* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_text_buffer_get_mark(cast(GtkTextBuffer*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_mark.TextMark)(cast(GtkTextMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Indicates whether the buffer has been modified since the last call
      to [gid.gtk4.text_buffer.TextBuffer.setModified] set the modification flag to
      false. Used for example to enable a “save” function in a text
      editor.
      Returns: true if the buffer has been modified
  */
  bool getModified() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_get_modified(cast(GtkTextBuffer*)this._cPtr);
    return _retval;
  }

  /**
      This function returns the list of targets this text buffer supports
      for pasting and as DND destination. The targets in the list are
      added with info values from the #GtkTextBufferTargetInfo enum,
      using [gid.gtk3.target_list.TargetList.addRichTextTargets] and
      [gid.gtk3.target_list.TargetList.addTextTargets].
      Returns: the #GtkTargetList
  */
  gid.gtk3.target_list.TargetList getPasteTargetList() nothrow
  {
    GtkTargetList* _cretval;
    _cretval = gtk_text_buffer_get_paste_target_list(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.target_list.TargetList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the mark that represents the selection bound.  Equivalent
      to calling [gid.gtk4.text_buffer.TextBuffer.getMark] to get the mark named
      “selection_bound”, but very slightly more efficient, and involves
      less typing.
      
      The currently-selected text in buffer is the region between the
      “selection_bound” and “insert” marks. If “selection_bound” and
      “insert” are in the same place, then there is no current selection.
      [gid.gtk4.text_buffer.TextBuffer.getSelectionBounds] is another convenient function
      for handling the selection, if you just want to know whether there’s a
      selection and what its bounds are.
      Returns: selection bound mark
  */
  gid.gtk3.text_mark.TextMark getSelectionBound() nothrow
  {
    GtkTextMark* _cretval;
    _cretval = gtk_text_buffer_get_selection_bound(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_mark.TextMark)(cast(GtkTextMark*)_cretval, No.Take);
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
  bool getSelectionBounds(out gid.gtk3.text_iter.TextIter start, out gid.gtk3.text_iter.TextIter end) nothrow
  {
    bool _retval;
    auto _start = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    auto _end = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_text_buffer_get_selection_bounds(cast(GtkTextBuffer*)this._cPtr, _start, _end);
    start = new gid.gtk3.text_iter.TextIter(cast(void*)_start, Yes.Take);
    end = new gid.gtk3.text_iter.TextIter(cast(void*)_end, Yes.Take);
    return _retval;
  }

  /**
      This function returns the rich text serialize formats registered
      with buffer using [gid.gtk3.text_buffer.TextBuffer.registerSerializeFormat] or
      [gid.gtk3.text_buffer.TextBuffer.registerSerializeTagset]
      Returns: an array of
                      #GdkAtoms representing the registered formats.
  */
  gid.gdk3.atom.Atom[] getSerializeFormats() nothrow
  {
    GdkAtom* _cretval;
    int _cretlength;
    _cretval = gtk_text_buffer_get_serialize_formats(cast(GtkTextBuffer*)this._cPtr, &_cretlength);
    gid.gdk3.atom.Atom[] _retval;

    if (_cretval)
    {
      _retval = new gid.gdk3.atom.Atom[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gid.gdk3.atom.Atom(cast(void*)_cretval[i], No.Take);
      gFree(cast(void*)_cretval);
    }
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
      [gid.gtk4.text_buffer.TextBuffer.getText]. Note that 0xFFFC can occur in normal
      text as well, so it is not a reliable indicator that a pixbuf or
      widget is in the buffer.
  
      Params:
        start = start of a range
        end = end of a range
        includeHiddenChars = whether to include invisible text
      Returns: an allocated UTF-8 string
  */
  string getSlice(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, bool includeHiddenChars) nothrow
  {
    char* _cretval;
    _cretval = gtk_text_buffer_get_slice(cast(GtkTextBuffer*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null, includeHiddenChars);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Initialized iter with the first position in the text buffer. This
      is the same as using [gid.gtk4.text_buffer.TextBuffer.getIterAtOffset] to get
      the iter at character offset 0.
  
      Params:
        iter = iterator to initialize
  */
  void getStartIter(out gid.gtk3.text_iter.TextIter iter) nothrow
  {
    auto _iter = boxedNew!GtkTextIter(gid.gtk3.text_iter.TextIter._getGType);
    gtk_text_buffer_get_start_iter(cast(GtkTextBuffer*)this._cPtr, _iter);
    iter = new gid.gtk3.text_iter.TextIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Get the #GtkTextTagTable associated with this buffer.
      Returns: the buffer’s tag table
  */
  gid.gtk3.text_tag_table.TextTagTable getTagTable() nothrow
  {
    GtkTextTagTable* _cretval;
    _cretval = gtk_text_buffer_get_tag_table(cast(GtkTextBuffer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_tag_table.TextTagTable)(cast(GtkTextTagTable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the text in the range [start,end). Excludes undisplayed
      text (text marked with tags that set the invisibility attribute) if
      include_hidden_chars is false. Does not include characters
      representing embedded images, so byte and character indexes into
      the returned string do not correspond to byte
      and character indexes into the buffer. Contrast with
      [gid.gtk4.text_buffer.TextBuffer.getSlice].
  
      Params:
        start = start of a range
        end = end of a range
        includeHiddenChars = whether to include invisible text
      Returns: an allocated UTF-8 string
  */
  string getText(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, bool includeHiddenChars) nothrow
  {
    char* _cretval;
    _cretval = gtk_text_buffer_get_text(cast(GtkTextBuffer*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null, includeHiddenChars);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
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
  */
  void insert(gid.gtk3.text_iter.TextIter iter, string text) nothrow
  {
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(char*)text.ptr;
    gtk_text_buffer_insert(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _text, _len);
  }

  /**
      Simply calls [gid.gtk4.text_buffer.TextBuffer.insert], using the current
      cursor position as the insertion point.
  
      Params:
        text = text in UTF-8 format
  */
  void insertAtCursor(string text) nothrow
  {
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(char*)text.ptr;
    gtk_text_buffer_insert_at_cursor(cast(GtkTextBuffer*)this._cPtr, _text, _len);
  }

  /**
      Inserts a child widget anchor into the text buffer at iter. The
      anchor will be counted as one character in character counts, and
      when obtaining the buffer contents as a string, will be represented
      by the Unicode “object replacement character” 0xFFFC. Note that the
      “slice” variants for obtaining portions of the buffer as a string
      include this character for child anchors, but the “text” variants do
      not. E.g. see [gid.gtk4.text_buffer.TextBuffer.getSlice] and
      [gid.gtk4.text_buffer.TextBuffer.getText]. Consider
      [gid.gtk4.text_buffer.TextBuffer.createChildAnchor] as a more convenient
      alternative to this function. The buffer will add a reference to
      the anchor, so you can unref it after insertion.
  
      Params:
        iter = location to insert the anchor
        anchor = a #GtkTextChildAnchor
  */
  void insertChildAnchor(gid.gtk3.text_iter.TextIter iter, gid.gtk3.text_child_anchor.TextChildAnchor anchor) nothrow
  {
    gtk_text_buffer_insert_child_anchor(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, anchor ? cast(GtkTextChildAnchor*)anchor._cPtr(No.Dup) : null);
  }

  /**
      Like [gid.gtk4.text_buffer.TextBuffer.insert], but the insertion will not occur if
      iter is at a non-editable location in the buffer. Usually you
      want to prevent insertions at ineditable locations if the insertion
      results from a user action (is interactive).
      
      default_editable indicates the editability of text that doesn't
      have a tag affecting editability applied to it. Typically the
      result of [gid.gtk4.text_view.TextView.getEditable] is appropriate here.
  
      Params:
        iter = a position in buffer
        text = some UTF-8 text
        defaultEditable = default editability of buffer
      Returns: whether text was actually inserted
  */
  bool insertInteractive(gid.gtk3.text_iter.TextIter iter, string text, bool defaultEditable) nothrow
  {
    bool _retval;
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(char*)text.ptr;
    _retval = cast(bool)gtk_text_buffer_insert_interactive(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _text, _len, defaultEditable);
    return _retval;
  }

  /**
      Calls [gid.gtk4.text_buffer.TextBuffer.insertInteractive] at the cursor
      position.
      
      default_editable indicates the editability of text that doesn't
      have a tag affecting editability applied to it. Typically the
      result of [gid.gtk4.text_view.TextView.getEditable] is appropriate here.
  
      Params:
        text = text in UTF-8 format
        defaultEditable = default editability of buffer
      Returns: whether text was actually inserted
  */
  bool insertInteractiveAtCursor(string text, bool defaultEditable) nothrow
  {
    bool _retval;
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(char*)text.ptr;
    _retval = cast(bool)gtk_text_buffer_insert_interactive_at_cursor(cast(GtkTextBuffer*)this._cPtr, _text, _len, defaultEditable);
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
  */
  void insertMarkup(gid.gtk3.text_iter.TextIter iter, string markup) nothrow
  {
    int _len;
    if (markup)
      _len = cast(int)markup.length;

    auto _markup = cast(char*)markup.ptr;
    gtk_text_buffer_insert_markup(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, _markup, _len);
  }

  /**
      Inserts an image into the text buffer at iter. The image will be
      counted as one character in character counts, and when obtaining
      the buffer contents as a string, will be represented by the Unicode
      “object replacement character” 0xFFFC. Note that the “slice”
      variants for obtaining portions of the buffer as a string include
      this character for pixbufs, but the “text” variants do
      not. e.g. see [gid.gtk4.text_buffer.TextBuffer.getSlice] and
      [gid.gtk4.text_buffer.TextBuffer.getText].
  
      Params:
        iter = location to insert the pixbuf
        pixbuf = a #GdkPixbuf
  */
  void insertPixbuf(gid.gtk3.text_iter.TextIter iter, gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf) nothrow
  {
    gtk_text_buffer_insert_pixbuf(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
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
  void insertRange(gid.gtk3.text_iter.TextIter iter, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    gtk_text_buffer_insert_range(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Same as [gid.gtk4.text_buffer.TextBuffer.insertRange], but does nothing if the
      insertion point isn’t editable. The default_editable parameter
      indicates whether the text is editable at iter if no tags
      enclosing iter affect editability. Typically the result of
      [gid.gtk4.text_view.TextView.getEditable] is appropriate here.
  
      Params:
        iter = a position in buffer
        start = a position in a #GtkTextBuffer
        end = another position in the same buffer as start
        defaultEditable = default editability of the buffer
      Returns: whether an insertion was possible at iter
  */
  bool insertRangeInteractive(gid.gtk3.text_iter.TextIter iter, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, bool defaultEditable) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_buffer_insert_range_interactive(cast(GtkTextBuffer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null, defaultEditable);
    return _retval;
  }

  /**
      Moves mark to the new location where. Emits the #GtkTextBuffer::mark-set
      signal as notification of the move.
  
      Params:
        mark = a #GtkTextMark
        where = new location for mark in buffer
  */
  void moveMark(gid.gtk3.text_mark.TextMark mark, gid.gtk3.text_iter.TextIter where) nothrow
  {
    gtk_text_buffer_move_mark(cast(GtkTextBuffer*)this._cPtr, mark ? cast(GtkTextMark*)mark._cPtr(No.Dup) : null, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null);
  }

  /**
      Moves the mark named name (which must exist) to location where.
      See [gid.gtk4.text_buffer.TextBuffer.moveMark] for details.
  
      Params:
        name = name of a mark
        where = new location for mark
  */
  void moveMarkByName(string name, gid.gtk3.text_iter.TextIter where) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_text_buffer_move_mark_by_name(cast(GtkTextBuffer*)this._cPtr, _name, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null);
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
  void pasteClipboard(gid.gtk3.clipboard.Clipboard clipboard, gid.gtk3.text_iter.TextIter overrideLocation, bool defaultEditable) nothrow
  {
    gtk_text_buffer_paste_clipboard(cast(GtkTextBuffer*)this._cPtr, clipboard ? cast(GtkClipboard*)clipboard._cPtr(No.Dup) : null, overrideLocation ? cast(GtkTextIter*)overrideLocation._cPtr(No.Dup) : null, defaultEditable);
  }

  /**
      This function moves the “insert” and “selection_bound” marks
      simultaneously.  If you move them to the same place in two steps
      with [gid.gtk4.text_buffer.TextBuffer.moveMark], you will temporarily select a
      region in between their old and new locations, which can be pretty
      inefficient since the temporarily-selected region will force stuff
      to be recalculated. This function moves them as a unit, which can
      be optimized.
  
      Params:
        where = where to put the cursor
  */
  void placeCursor(gid.gtk3.text_iter.TextIter where) nothrow
  {
    gtk_text_buffer_place_cursor(cast(GtkTextBuffer*)this._cPtr, where ? cast(const(GtkTextIter)*)where._cPtr(No.Dup) : null);
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
  gid.gdk3.atom.Atom registerDeserializeFormat(string mimeType, gid.gtk3.types.TextBufferDeserializeFunc function_) nothrow
  {
    extern(C) gboolean _function_Callback(GtkTextBuffer* registerBuffer, GtkTextBuffer* contentBuffer, GtkTextIter* iter, const(ubyte)* data, size_t length, gboolean createTags, void* userData, GError **_err) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk3.types.TextBufferDeserializeFunc*)userData;
      auto _iter = iter ? new gid.gtk3.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;
      ubyte[] _data;
      _data.length = length;
      _data[0 .. length] = data[0 .. length];

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_buffer.TextBuffer)(cast(void*)registerBuffer, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_buffer.TextBuffer)(cast(void*)contentBuffer, No.Take), _iter, _data, cast(bool)createTags, _err);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TextBufferDeserializeFunc");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_iter)
        _iter._cUnborrow;

      return _retval;
    }
    auto _function_CB = function_ ? &_function_Callback : null;
    GdkAtom _cretval;
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
    GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
    _cretval = gtk_text_buffer_register_deserialize_format(cast(GtkTextBuffer*)this._cPtr, _mimeType, _function_CB, _function_, _function_DestroyCB);
    auto _retval = _cretval ? new gid.gdk3.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function registers GTK+’s internal rich text serialization
      format with the passed buffer. See
      [gid.gtk3.text_buffer.TextBuffer.registerSerializeTagset] for details.
  
      Params:
        tagsetName = an optional tagset name, on null
      Returns: the #GdkAtom that corresponds to the
                      newly registered format’s mime-type.
  */
  gid.gdk3.atom.Atom registerDeserializeTagset(string tagsetName = null) nothrow
  {
    GdkAtom _cretval;
    const(char)* _tagsetName = tagsetName.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_text_buffer_register_deserialize_tagset(cast(GtkTextBuffer*)this._cPtr, _tagsetName);
    auto _retval = _cretval ? new gid.gdk3.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
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
  gid.gdk3.atom.Atom registerSerializeFormat(string mimeType, gid.gtk3.types.TextBufferSerializeFunc function_) nothrow
  {
    extern(C) ubyte* _function_Callback(GtkTextBuffer* registerBuffer, GtkTextBuffer* contentBuffer, const(GtkTextIter)* start, const(GtkTextIter)* end, size_t* length, void* userData) nothrow
    {
      gidAttachThread();
      ubyte[] _dretval;
      auto _dlg = cast(gid.gtk3.types.TextBufferSerializeFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_buffer.TextBuffer)(cast(void*)registerBuffer, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_buffer.TextBuffer)(cast(void*)contentBuffer, No.Take), start ? new gid.gtk3.text_iter.TextIter(cast(void*)start, No.Take) : null, end ? new gid.gtk3.text_iter.TextIter(cast(void*)end, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TextBufferSerializeFunc");
      }
      ubyte* _retval;

      if (_dretval.length > 0)
      {
        _retval = cast(typeof(_retval))gMalloc(_dretval.length * (*_retval).sizeof);
        _retval[0 .. _dretval.length] = _dretval[];
      }

      *length = cast(typeof(*length))_dretval.length;

      return _retval;
    }
    auto _function_CB = function_ ? &_function_Callback : null;
    GdkAtom _cretval;
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
    GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
    _cretval = gtk_text_buffer_register_serialize_format(cast(GtkTextBuffer*)this._cPtr, _mimeType, _function_CB, _function_, _function_DestroyCB);
    auto _retval = _cretval ? new gid.gdk3.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function registers GTK+’s internal rich text serialization
      format with the passed buffer. The internal format does not comply
      to any standard rich text format and only works between #GtkTextBuffer
      instances. It is capable of serializing all of a text buffer’s tags
      and embedded pixbufs.
      
      This function is just a wrapper around
      [gid.gtk3.text_buffer.TextBuffer.registerSerializeFormat]. The mime type used
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
  gid.gdk3.atom.Atom registerSerializeTagset(string tagsetName = null) nothrow
  {
    GdkAtom _cretval;
    const(char)* _tagsetName = tagsetName.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_text_buffer_register_serialize_tagset(cast(GtkTextBuffer*)this._cPtr, _tagsetName);
    auto _retval = _cretval ? new gid.gdk3.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
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
  void removeAllTags(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    gtk_text_buffer_remove_all_tags(cast(GtkTextBuffer*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Removes a #GtkClipboard added with
      [gid.gtk4.text_buffer.TextBuffer.addSelectionClipboard].
  
      Params:
        clipboard = a #GtkClipboard added to buffer by
                      [gid.gtk4.text_buffer.TextBuffer.addSelectionClipboard]
  */
  void removeSelectionClipboard(gid.gtk3.clipboard.Clipboard clipboard) nothrow
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
  void removeTag(gid.gtk3.text_tag.TextTag tag, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    gtk_text_buffer_remove_tag(cast(GtkTextBuffer*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      Calls [gid.gtk4.text_tag_table.TextTagTable.lookup] on the buffer’s tag table to
      get a #GtkTextTag, then calls [gid.gtk4.text_buffer.TextBuffer.removeTag].
  
      Params:
        name = name of a #GtkTextTag
        start = one bound of range to be untagged
        end = other bound of range to be untagged
  */
  void removeTagByName(string name, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_text_buffer_remove_tag_by_name(cast(GtkTextBuffer*)this._cPtr, _name, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
  }

  /**
      This function moves the “insert” and “selection_bound” marks
      simultaneously.  If you move them in two steps
      with [gid.gtk4.text_buffer.TextBuffer.moveMark], you will temporarily select a
      region in between their old and new locations, which can be pretty
      inefficient since the temporarily-selected region will force stuff
      to be recalculated. This function moves them as a unit, which can
      be optimized.
  
      Params:
        ins = where to put the “insert” mark
        bound = where to put the “selection_bound” mark
  */
  void selectRange(gid.gtk3.text_iter.TextIter ins, gid.gtk3.text_iter.TextIter bound) nothrow
  {
    gtk_text_buffer_select_range(cast(GtkTextBuffer*)this._cPtr, ins ? cast(const(GtkTextIter)*)ins._cPtr(No.Dup) : null, bound ? cast(const(GtkTextIter)*)bound._cPtr(No.Dup) : null);
  }

  /**
      This function serializes the portion of text between start
      and end in the rich text format represented by format.
      
      formats to be used must be registered using
      [gid.gtk3.text_buffer.TextBuffer.registerSerializeFormat] or
      [gid.gtk3.text_buffer.TextBuffer.registerSerializeTagset] beforehand.
  
      Params:
        contentBuffer = the #GtkTextBuffer to serialize
        format = the rich text format to use for serializing
        start = start of block of text to serialize
        end = end of block of test to serialize
      Returns: the serialized
                      data, encoded as format
  */
  ubyte[] serialize(gid.gtk3.text_buffer.TextBuffer contentBuffer, gid.gdk3.atom.Atom format, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    ubyte* _cretval;
    size_t _cretlength;
    _cretval = gtk_text_buffer_serialize(cast(GtkTextBuffer*)this._cPtr, contentBuffer ? cast(GtkTextBuffer*)contentBuffer._cPtr(No.Dup) : null, format ? cast(GdkAtom)format._cPtr : null, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null, &_cretlength);
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
  void setModified(bool setting) nothrow
  {
    gtk_text_buffer_set_modified(cast(GtkTextBuffer*)this._cPtr, setting);
  }

  /**
      Deletes current contents of buffer, and inserts text instead. If
      len is -1, text must be nul-terminated. text must be valid UTF-8.
  
      Params:
        text = UTF-8 text to insert
  */
  void setText(string text) nothrow
  {
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(char*)text.ptr;
    gtk_text_buffer_set_text(cast(GtkTextBuffer*)this._cPtr, _text, _len);
  }

  /**
      This function unregisters a rich text format that was previously
      registered using [gid.gtk3.text_buffer.TextBuffer.registerDeserializeFormat] or
      [gid.gtk3.text_buffer.TextBuffer.registerDeserializeTagset].
  
      Params:
        format = a #GdkAtom representing a registered rich text format.
  */
  void unregisterDeserializeFormat(gid.gdk3.atom.Atom format) nothrow
  {
    gtk_text_buffer_unregister_deserialize_format(cast(GtkTextBuffer*)this._cPtr, format ? cast(GdkAtom)format._cPtr : null);
  }

  /**
      This function unregisters a rich text format that was previously
      registered using [gid.gtk3.text_buffer.TextBuffer.registerSerializeFormat] or
      [gid.gtk3.text_buffer.TextBuffer.registerSerializeTagset]
  
      Params:
        format = a #GdkAtom representing a registered rich text format.
  */
  void unregisterSerializeFormat(gid.gdk3.atom.Atom format) nothrow
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
        [gid.gtk4.text_buffer.TextBuffer.applyTag],
        [gid.gtk4.text_buffer.TextBuffer.insertWithTags],
        [gid.gtk4.text_buffer.TextBuffer.insertRange].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_tag.TextTag tag, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `tag` the applied tag (optional)
  
          `start` the start of the range the tag is applied to (optional)
  
          `end` the end of the range the tag is applied to (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectApplyTag(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_tag.TextTag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.applyTag");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("apply-tag", closure, after);
  }

  /**
      Connect to `BeginUserAction` signal.
  
      The ::begin-user-action signal is emitted at the beginning of a single
        user-visible operation on a #GtkTextBuffer.
        
        See also:
        [gid.gtk4.text_buffer.TextBuffer.beginUserAction],
        [gid.gtk4.text_buffer.TextBuffer.insertInteractive],
        [gid.gtk4.text_buffer.TextBuffer.insertRangeInteractive],
        [gid.gtk4.text_buffer.TextBuffer.deleteInteractive],
        [gid.gtk4.text_buffer.TextBuffer.backspace],
        [gid.gtk4.text_buffer.TextBuffer.deleteSelection].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectBeginUserAction(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.beginUserAction");
      }
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
  
          `void callback(gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.changed");
      }
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
        
        See also: [gid.gtk4.text_buffer.TextBuffer.delete_].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `start` the start of the range to be deleted (optional)
  
          `end` the end of the range to be deleted (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeleteRange(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.deleteRange");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-range", closure, after);
  }

  /**
      Connect to `EndUserAction` signal.
  
      The ::end-user-action signal is emitted at the end of a single
        user-visible operation on the #GtkTextBuffer.
        
        See also:
        [gid.gtk4.text_buffer.TextBuffer.endUserAction],
        [gid.gtk4.text_buffer.TextBuffer.insertInteractive],
        [gid.gtk4.text_buffer.TextBuffer.insertRangeInteractive],
        [gid.gtk4.text_buffer.TextBuffer.deleteInteractive],
        [gid.gtk4.text_buffer.TextBuffer.backspace],
        [gid.gtk4.text_buffer.TextBuffer.deleteSelection],
        [gid.gtk4.text_buffer.TextBuffer.backspace].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEndUserAction(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.endUserAction");
      }
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
        
        See also: [gid.gtk4.text_buffer.TextBuffer.insertChildAnchor].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_iter.TextIter location, gid.gtk3.text_child_anchor.TextChildAnchor anchor, gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `location` position to insert anchor in textbuffer (optional)
  
          `anchor` the #GtkTextChildAnchor to be inserted (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertChildAnchor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.text_child_anchor.TextChildAnchor)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.insertChildAnchor");
      }
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
        
        See also: [gid.gtk3.text_buffer.TextBuffer.insertPixbuf].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_iter.TextIter location, gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf, gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `location` position to insert pixbuf in textbuffer (optional)
  
          `pixbuf` the #GdkPixbuf to be inserted (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertPixbuf(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdkpixbuf2.pixbuf.Pixbuf)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.insertPixbuf");
      }
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
        [gid.gtk4.text_buffer.TextBuffer.insert],
        [gid.gtk4.text_buffer.TextBuffer.insertRange].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_iter.TextIter location, string text, gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `location` position to insert text in textbuffer (optional)
  
          `text` the UTF-8 text to be inserted (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertText(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.text_buffer.TextBuffer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);
      auto len = getVal!(int)(&_paramVals[3]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getStringWithLength(&_paramVals[2], len);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.insertText");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-text", closure, after);
  }

  /**
      Connect to `MarkDeleted` signal.
  
      The ::mark-deleted signal is emitted as notification
        after a #GtkTextMark is deleted.
        
        See also:
        [gid.gtk4.text_buffer.TextBuffer.deleteMark].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_mark.TextMark mark, gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `mark` The mark that was deleted (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMarkDeleted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_mark.TextMark)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.markDeleted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mark-deleted", closure, after);
  }

  /**
      Connect to `MarkSet` signal.
  
      The ::mark-set signal is emitted as notification
        after a #GtkTextMark is set.
        
        See also:
        [gid.gtk4.text_buffer.TextBuffer.createMark],
        [gid.gtk4.text_buffer.TextBuffer.moveMark].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_iter.TextIter location, gid.gtk3.text_mark.TextMark mark, gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `location` The location of mark in textbuffer (optional)
  
          `mark` The mark that is set (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMarkSet(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.text_mark.TextMark)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.markSet");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mark-set", closure, after);
  }

  /**
      Connect to `ModifiedChanged` signal.
  
      The ::modified-changed signal is emitted when the modified bit of a
        #GtkTextBuffer flips.
        
        See also:
        [gid.gtk4.text_buffer.TextBuffer.setModified].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectModifiedChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.modifiedChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("modified-changed", closure, after);
  }

  /**
      Connect to `PasteDone` signal.
  
      The paste-done signal is emitted after paste operation has been completed.
        This is useful to properly scroll the view to the end of the pasted text.
        See [gid.gtk4.text_buffer.TextBuffer.pasteClipboard] for more details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.clipboard.Clipboard clipboard, gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `clipboard` the #GtkClipboard pasted from (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPasteDone(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.clipboard.Clipboard)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.pasteDone");
      }
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
        [gid.gtk4.text_buffer.TextBuffer.removeTag].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_tag.TextTag tag, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtk3.text_buffer.TextBuffer textBuffer)`
  
          `tag` the tag to be removed (optional)
  
          `start` the start of the range the tag is removed from (optional)
  
          `end` the end of the range the tag is removed from (optional)
  
          `textBuffer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRemoveTag(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_tag.TextTag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.text_buffer.TextBuffer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.removeTag");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("remove-tag", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TextBuffer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.text_buffer.TextBuffer), T.stringof ~ " is not derived from gid.gtk3.text_buffer.TextBuffer");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncApplyTag", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "apply_tag");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBeginUserAction", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "begin_user_action");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeleteRange", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "delete_range");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEndUserAction", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "end_user_action");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertChildAnchor", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "insert_child_anchor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertPixbuf", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "insert_pixbuf");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertText", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "insert_text");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMarkDeleted", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "mark_deleted");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMarkSet", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "mark_set");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncModifiedChanged", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "modified_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPasteDone", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "paste_done");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRemoveTag", true)[0]) == gid.gtk3.text_buffer.TextBuffer))
      _installVfunc(klass, "remove_tag");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkTextBufferClass*)klass;

    switch (vfunc)
    {
      case "apply_tag":
      {
        static extern(C) void _vfuncApplyTagTramp(GtkTextBuffer* buffer, GtkTextTag* tag, const(GtkTextIter)* start, const(GtkTextIter)* end) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.applyTag)
              return (cast(typeof(&_vfuncApplyTagTramp))_klass.applyTag)(buffer, tag, start, end);
            return;
          }

          try
          {
            _obj.vfuncApplyTag(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_tag.TextTag)(cast(void*)tag, No.Take), start ? new gid.gtk3.text_iter.TextIter(cast(void*)start, No.Take) : null, end ? new gid.gtk3.text_iter.TextIter(cast(void*)end, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncApplyTag");
          }
        }

        _klass.applyTag = cast(typeof(_klass.applyTag))&_vfuncApplyTagTramp;
        break;
      }
      case "begin_user_action":
      {
        static extern(C) void _vfuncBeginUserActionTramp(GtkTextBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.beginUserAction)
              return (cast(typeof(&_vfuncBeginUserActionTramp))_klass.beginUserAction)(buffer);
            return;
          }

          try
          {
            _obj.vfuncBeginUserAction();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncBeginUserAction");
          }
        }

        _klass.beginUserAction = cast(typeof(_klass.beginUserAction))&_vfuncBeginUserActionTramp;
        break;
      }
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GtkTextBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(buffer);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      case "delete_range":
      {
        static extern(C) void _vfuncDeleteRangeTramp(GtkTextBuffer* buffer, GtkTextIter* start, GtkTextIter* end) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.deleteRange)
              return (cast(typeof(&_vfuncDeleteRangeTramp))_klass.deleteRange)(buffer, start, end);
            return;
          }

          auto _start = start ? new gid.gtk3.text_iter.TextIter(cast(void*)start, Yes.Take)._cBorrow : null;
          auto _end = end ? new gid.gtk3.text_iter.TextIter(cast(void*)end, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncDeleteRange(_start, _end);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncDeleteRange");
          }
          if (_start)
            _start._cUnborrow;
          if (_end)
            _end._cUnborrow;

        }

        _klass.deleteRange = cast(typeof(_klass.deleteRange))&_vfuncDeleteRangeTramp;
        break;
      }
      case "end_user_action":
      {
        static extern(C) void _vfuncEndUserActionTramp(GtkTextBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.endUserAction)
              return (cast(typeof(&_vfuncEndUserActionTramp))_klass.endUserAction)(buffer);
            return;
          }

          try
          {
            _obj.vfuncEndUserAction();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncEndUserAction");
          }
        }

        _klass.endUserAction = cast(typeof(_klass.endUserAction))&_vfuncEndUserActionTramp;
        break;
      }
      case "insert_child_anchor":
      {
        static extern(C) void _vfuncInsertChildAnchorTramp(GtkTextBuffer* buffer, GtkTextIter* iter, GtkTextChildAnchor* anchor) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.insertChildAnchor)
              return (cast(typeof(&_vfuncInsertChildAnchorTramp))_klass.insertChildAnchor)(buffer, iter, anchor);
            return;
          }

          auto _iter = iter ? new gid.gtk3.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncInsertChildAnchor(_iter, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_child_anchor.TextChildAnchor)(cast(void*)anchor, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncInsertChildAnchor");
          }
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.insertChildAnchor = cast(typeof(_klass.insertChildAnchor))&_vfuncInsertChildAnchorTramp;
        break;
      }
      case "insert_pixbuf":
      {
        static extern(C) void _vfuncInsertPixbufTramp(GtkTextBuffer* buffer, GtkTextIter* iter, GdkPixbuf* pixbuf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.insertPixbuf)
              return (cast(typeof(&_vfuncInsertPixbufTramp))_klass.insertPixbuf)(buffer, iter, pixbuf);
            return;
          }

          auto _iter = iter ? new gid.gtk3.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncInsertPixbuf(_iter, gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(void*)pixbuf, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncInsertPixbuf");
          }
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.insertPixbuf = cast(typeof(_klass.insertPixbuf))&_vfuncInsertPixbufTramp;
        break;
      }
      case "insert_text":
      {
        static extern(C) void _vfuncInsertTextTramp(GtkTextBuffer* buffer, GtkTextIter* pos, const(char)* newText, int newTextLength) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.insertText)
              return (cast(typeof(&_vfuncInsertTextTramp))_klass.insertText)(buffer, pos, newText, newTextLength);
            return;
          }

          auto _pos = pos ? new gid.gtk3.text_iter.TextIter(cast(void*)pos, Yes.Take)._cBorrow : null;
          string _newText = newText.fromCString!(No.Free);

          try
          {
            _obj.vfuncInsertText(_pos, _newText, newTextLength);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncInsertText");
          }
          if (_pos)
            _pos._cUnborrow;

        }

        _klass.insertText = cast(typeof(_klass.insertText))&_vfuncInsertTextTramp;
        break;
      }
      case "mark_deleted":
      {
        static extern(C) void _vfuncMarkDeletedTramp(GtkTextBuffer* buffer, GtkTextMark* mark) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.markDeleted)
              return (cast(typeof(&_vfuncMarkDeletedTramp))_klass.markDeleted)(buffer, mark);
            return;
          }

          try
          {
            _obj.vfuncMarkDeleted(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_mark.TextMark)(cast(void*)mark, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncMarkDeleted");
          }
        }

        _klass.markDeleted = cast(typeof(_klass.markDeleted))&_vfuncMarkDeletedTramp;
        break;
      }
      case "mark_set":
      {
        static extern(C) void _vfuncMarkSetTramp(GtkTextBuffer* buffer, const(GtkTextIter)* location, GtkTextMark* mark) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.markSet)
              return (cast(typeof(&_vfuncMarkSetTramp))_klass.markSet)(buffer, location, mark);
            return;
          }

          try
          {
            _obj.vfuncMarkSet(location ? new gid.gtk3.text_iter.TextIter(cast(void*)location, No.Take) : null, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_mark.TextMark)(cast(void*)mark, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncMarkSet");
          }
        }

        _klass.markSet = cast(typeof(_klass.markSet))&_vfuncMarkSetTramp;
        break;
      }
      case "modified_changed":
      {
        static extern(C) void _vfuncModifiedChangedTramp(GtkTextBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.modifiedChanged)
              return (cast(typeof(&_vfuncModifiedChangedTramp))_klass.modifiedChanged)(buffer);
            return;
          }

          try
          {
            _obj.vfuncModifiedChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncModifiedChanged");
          }
        }

        _klass.modifiedChanged = cast(typeof(_klass.modifiedChanged))&_vfuncModifiedChangedTramp;
        break;
      }
      case "paste_done":
      {
        static extern(C) void _vfuncPasteDoneTramp(GtkTextBuffer* buffer, GtkClipboard* clipboard) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.pasteDone)
              return (cast(typeof(&_vfuncPasteDoneTramp))_klass.pasteDone)(buffer, clipboard);
            return;
          }

          try
          {
            _obj.vfuncPasteDone(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.clipboard.Clipboard)(cast(void*)clipboard, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncPasteDone");
          }
        }

        _klass.pasteDone = cast(typeof(_klass.pasteDone))&_vfuncPasteDoneTramp;
        break;
      }
      case "remove_tag":
      {
        static extern(C) void _vfuncRemoveTagTramp(GtkTextBuffer* buffer, GtkTextTag* tag, const(GtkTextIter)* start, const(GtkTextIter)* end) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.text_buffer.TextBuffer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)buffer);
          if (!_obj)
          {
            auto _klass = cast(GtkTextBufferClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)buffer);
            if (_klass.removeTag)
              return (cast(typeof(&_vfuncRemoveTagTramp))_klass.removeTag)(buffer, tag, start, end);
            return;
          }

          try
          {
            _obj.vfuncRemoveTag(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_tag.TextTag)(cast(void*)tag, No.Take), start ? new gid.gtk3.text_iter.TextIter(cast(void*)start, No.Take) : null, end ? new gid.gtk3.text_iter.TextIter(cast(void*)end, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_buffer.TextBuffer.vfuncRemoveTag");
          }
        }

        _klass.removeTag = cast(typeof(_klass.removeTag))&_vfuncRemoveTagTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.text_buffer.TextBuffer]
class TextBufferGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T tagTable(gid.gtk3.text_tag_table.TextTagTable propval) nothrow
  {
    return setProperty("tag-table", propval);
  }

  /**
      Set `text` property.
      Params:
        propval = The text content of the buffer. Without child widgets and images,
          see [gid.gtk4.text_buffer.TextBuffer.getText] for more information.
      Returns: Builder instance for fluent chaining
  */
  T text(string propval) nothrow
  {
    return setProperty("text", propval);
  }
}

/// Fluent builder for [gid.gtk3.text_buffer.TextBuffer]
final class TextBufferGidBuilder : TextBufferGidBuilderImpl!TextBufferGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TextBuffer build() nothrow
  {
    return new TextBuffer(cast(void*)createGObject(TextBuffer._getGType), Yes.Take);
  }
}
