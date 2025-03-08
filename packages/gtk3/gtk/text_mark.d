module gtk.text_mark;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.text_buffer;
import gtk.types;

/**
    You may wish to begin by reading the
  [text widget conceptual overview](TextWidget.html)
  which gives an overview of all the objects and data
  types related to the text widget and how they work together.
  
  A #GtkTextMark is like a bookmark in a text buffer; it preserves a position in
  the text. You can convert the mark to an iterator using
  [gtk.text_buffer.TextBuffer.getIterAtMark]. Unlike iterators, marks remain valid across
  buffer mutations, because their behavior is defined when text is inserted or
  deleted. When text containing a mark is deleted, the mark remains in the
  position originally occupied by the deleted text. When text is inserted at a
  mark, a mark with “left gravity” will be moved to the
  beginning of the newly-inserted text, and a mark with “right
  gravity” will be moved to the end.
  
  Note that “left” and “right” here refer to logical direction (left
  is the toward the start of the buffer); in some languages such as
  Hebrew the logically-leftmost text is not actually on the left when
  displayed.
  
  Marks are reference counted, but the reference count only controls the validity
  of the memory; marks can be deleted from the buffer at any time with
  [gtk.text_buffer.TextBuffer.deleteMark]. Once deleted from the buffer, a mark is
  essentially useless.
  
  Marks optionally have names; these can be convenient to avoid passing the
  #GtkTextMark object around.
  
  Marks are typically created using the [gtk.text_buffer.TextBuffer.createMark] function.
*/
class TextMark : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_mark_get_type != &gidSymbolNotFound ? gtk_text_mark_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a text mark. Add it to a buffer using [gtk.text_buffer.TextBuffer.addMark].
    If name is null, the mark is anonymous; otherwise, the mark can be
    retrieved by name using [gtk.text_buffer.TextBuffer.getMark]. If a mark has left
    gravity, and text is inserted at the mark’s current location, the mark
    will be moved to the left of the newly-inserted text. If the mark has
    right gravity (left_gravity = false), the mark will end up on the
    right of newly-inserted text. The standard left-to-right cursor is a
    mark with right gravity (when you type, the cursor stays on the right
    side of the text you’re typing).
    Params:
      name =       mark name or null
      leftGravity =       whether the mark should have left gravity
    Returns:     new #GtkTextMark
  */
  this(string name, bool leftGravity)
  {
    GtkTextMark* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gtk_text_mark_new(_name, leftGravity);
    this(_cretval, Yes.take);
  }

  /**
      Gets the buffer this mark is located inside,
    or null if the mark is deleted.
    Returns:     the mark’s #GtkTextBuffer
  */
  gtk.text_buffer.TextBuffer getBuffer()
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_text_mark_get_buffer(cast(GtkTextMark*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.text_buffer.TextBuffer)(cast(GtkTextBuffer*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns true if the mark has been removed from its buffer
    with [gtk.text_buffer.TextBuffer.deleteMark]. See [gtk.text_buffer.TextBuffer.addMark]
    for a way to add it to a buffer again.
    Returns:     whether the mark is deleted
  */
  bool getDeleted()
  {
    bool _retval;
    _retval = gtk_text_mark_get_deleted(cast(GtkTextMark*)cPtr);
    return _retval;
  }

  /**
      Determines whether the mark has left gravity.
    Returns:     true if the mark has left gravity, false otherwise
  */
  bool getLeftGravity()
  {
    bool _retval;
    _retval = gtk_text_mark_get_left_gravity(cast(GtkTextMark*)cPtr);
    return _retval;
  }

  /**
      Returns the mark name; returns NULL for anonymous marks.
    Returns:     mark name
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_text_mark_get_name(cast(GtkTextMark*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Returns true if the mark is visible (i.e. a cursor is displayed
    for it).
    Returns:     true if visible
  */
  bool getVisible()
  {
    bool _retval;
    _retval = gtk_text_mark_get_visible(cast(GtkTextMark*)cPtr);
    return _retval;
  }

  /**
      Sets the visibility of mark; the insertion point is normally
    visible, i.e. you can see it as a vertical bar. Also, the text
    widget uses a visible mark to indicate where a drop will occur when
    dragging-and-dropping text. Most other marks are not visible.
    Marks are not visible by default.
    Params:
      setting =       visibility of mark
  */
  void setVisible(bool setting)
  {
    gtk_text_mark_set_visible(cast(GtkTextMark*)cPtr, setting);
  }
}
