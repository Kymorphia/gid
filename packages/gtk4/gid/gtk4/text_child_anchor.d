/// Module for [TextChildAnchor] class
module gid.gtk4.text_child_anchor;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Marks a spot in a [gid.gtk4.text_buffer.TextBuffer] where child widgets can be “anchored”.
    
    The anchor can have multiple widgets anchored, to allow for multiple views.
*/
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
      Get builder for [gid.gtk4.text_child_anchor.TextChildAnchor]
      Returns: New builder object
  */
  static TextChildAnchorGidBuilder builder() nothrow
  {
    return new TextChildAnchorGidBuilder;
  }

  /**
      Creates a new [gid.gtk4.text_child_anchor.TextChildAnchor].
      
      Usually you would then insert it into a [gid.gtk4.text_buffer.TextBuffer] with
      [gid.gtk4.text_buffer.TextBuffer.insertChildAnchor]. To perform the
      creation and insertion in one step, use the convenience
      function [gid.gtk4.text_buffer.TextBuffer.createChildAnchor].
      Returns: a new [gid.gtk4.text_child_anchor.TextChildAnchor]
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
      Creates a new [gid.gtk4.text_child_anchor.TextChildAnchor] with the given replacement character.
      
      Usually you would then insert it into a [gid.gtk4.text_buffer.TextBuffer] with
      [gid.gtk4.text_buffer.TextBuffer.insertChildAnchor].
  
      Params:
        character = a replacement character
      Returns: a new [gid.gtk4.text_child_anchor.TextChildAnchor]
  */
  static gid.gtk4.text_child_anchor.TextChildAnchor newWithReplacement(string character) nothrow
  {
    GtkTextChildAnchor* _cretval;
    const(char)* _character = character.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_text_child_anchor_new_with_replacement(_character);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.text_child_anchor.TextChildAnchor)(cast(GtkTextChildAnchor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Determines whether a child anchor has been deleted from
      the buffer.
      
      Keep in mind that the child anchor will be unreferenced
      when removed from the buffer, so you need to hold your own
      reference (with [gid.gobject2.object.ObjectWrap.ref_]) if you plan to use this
      function — otherwise all deleted child anchors will also
      be finalized.
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
      
      The order in which the widgets are returned is not defined.
      Returns: an
          array of widgets anchored at anchor
  */
  gid.gtk4.widget.Widget[] getWidgets() nothrow
  {
    GtkWidget** _cretval;
    uint _cretlength;
    _cretval = gtk_text_child_anchor_get_widgets(cast(GtkTextChildAnchor*)this._cPtr, &_cretlength);
    gid.gtk4.widget.Widget[] _retval;

    if (_cretval)
    {
      _retval = new gid.gtk4.widget.Widget[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(_cretval[i], No.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.text_child_anchor.TextChildAnchor]
class TextChildAnchorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.text_child_anchor.TextChildAnchor]
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
