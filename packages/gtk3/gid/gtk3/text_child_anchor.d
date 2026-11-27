/// Module for [TextChildAnchor] class
module gid.gtk3.text_child_anchor;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    A #GtkTextChildAnchor is a spot in the buffer where child widgets can
    be “anchored” (inserted inline, as if they were characters). The anchor
    can have multiple widgets anchored, to allow for multiple views.
*/
@gidGir("TextChildAnchor", "TextChildAnchorClass")
class TextChildAnchor : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_text_child_anchor_get_type != &gidSymbolNotFound ? gtk_text_child_anchor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTextChildAnchor";
  }

  /** Returns `this`, for use in `with` statements. */
  override TextChildAnchor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.text_child_anchor.TextChildAnchor]
      Returns: New builder object
  */
  static TextChildAnchorGidBuilder builder() nothrow
  {
    return new TextChildAnchorGidBuilder;
  }

  /**
      Creates a new #GtkTextChildAnchor. Usually you would then insert
      it into a #GtkTextBuffer with [gid.gtk4.text_buffer.TextBuffer.insertChildAnchor].
      To perform the creation and insertion in one step, use the
      convenience function [gid.gtk4.text_buffer.TextBuffer.createChildAnchor].
      Returns: a new #GtkTextChildAnchor
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkTextChildAnchor* _cretval;
      _cretval = gtk_text_child_anchor_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Determines whether a child anchor has been deleted from
      the buffer. Keep in mind that the child anchor will be
      unreferenced when removed from the buffer, so you need to
      hold your own reference (with [gid.gobject2.object.ObjectWrap.ref_]) if you plan
      to use this function — otherwise all deleted child anchors
      will also be finalized.
      Returns: true if the child anchor has been deleted from its buffer
  */
  bool getDeleted() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_child_anchor_get_deleted(cast(GtkTextChildAnchor*)this._cPtr);
    return _retval;
  }

  /**
      Gets a list of all widgets anchored at this child anchor.
      The returned list should be freed with [gid.glib2.list.List.free].
      Returns: list of widgets anchored at anchor
  */
  gid.gtk3.widget.Widget[] getWidgets() nothrow
  {
    GList* _cretval;
    _cretval = gtk_text_child_anchor_get_widgets(cast(GtkTextChildAnchor*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.text_child_anchor.TextChildAnchor]
class TextChildAnchorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk3.text_child_anchor.TextChildAnchor]
final class TextChildAnchorGidBuilder : TextChildAnchorGidBuilderImpl!TextChildAnchorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TextChildAnchor build() nothrow
  {
    return new TextChildAnchor(cast(void*)createGObject(TextChildAnchor._getGType), Yes.Take);
  }
}
