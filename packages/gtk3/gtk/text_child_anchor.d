/// Module for [TextChildAnchor] class
module gtk.text_child_anchor;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    A #GtkTextChildAnchor is a spot in the buffer where child widgets can
    be “anchored” (inserted inline, as if they were characters). The anchor
    can have multiple widgets anchored, to allow for multiple views.
*/
class TextChildAnchor : gobject.object.ObjectWrap
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
    return cast(void function())gtk_text_child_anchor_get_type != &gidSymbolNotFound ? gtk_text_child_anchor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextChildAnchor self()
  {
    return this;
  }

  /**
      Creates a new #GtkTextChildAnchor. Usually you would then insert
      it into a #GtkTextBuffer with [gtk.text_buffer.TextBuffer.insertChildAnchor].
      To perform the creation and insertion in one step, use the
      convenience function [gtk.text_buffer.TextBuffer.createChildAnchor].
      Returns: a new #GtkTextChildAnchor
  */
  this()
  {
    GtkTextChildAnchor* _cretval;
    _cretval = gtk_text_child_anchor_new();
    this(_cretval, Yes.Take);
  }

  /**
      Determines whether a child anchor has been deleted from
      the buffer. Keep in mind that the child anchor will be
      unreferenced when removed from the buffer, so you need to
      hold your own reference (with [gobject.object.ObjectWrap.ref_]) if you plan
      to use this function — otherwise all deleted child anchors
      will also be finalized.
      Returns: true if the child anchor has been deleted from its buffer
  */
  bool getDeleted()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_child_anchor_get_deleted(cast(GtkTextChildAnchor*)this._cPtr);
    return _retval;
  }

  /**
      Gets a list of all widgets anchored at this child anchor.
      The returned list should be freed with [glib.list.List.free].
      Returns: list of widgets anchored at anchor
  */
  gtk.widget.Widget[] getWidgets()
  {
    GList* _cretval;
    _cretval = gtk_text_child_anchor_get_widgets(cast(GtkTextChildAnchor*)this._cPtr);
    auto _retval = gListToD!(gtk.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }
}
