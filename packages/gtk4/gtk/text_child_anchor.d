/// Module for [TextChildAnchor] class
module gtk.text_child_anchor;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    A [gtk.text_child_anchor.TextChildAnchor] is a spot in a [gtk.text_buffer.TextBuffer] where child widgets can
    be “anchored”.
    
    The anchor can have multiple widgets anchored, to allow for multiple views.
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
      Creates a new [gtk.text_child_anchor.TextChildAnchor].
      
      Usually you would then insert it into a [gtk.text_buffer.TextBuffer] with
      [gtk.text_buffer.TextBuffer.insertChildAnchor]. To perform the
      creation and insertion in one step, use the convenience
      function [gtk.text_buffer.TextBuffer.createChildAnchor].
      Returns: a new [gtk.text_child_anchor.TextChildAnchor]
  */
  this()
  {
    GtkTextChildAnchor* _cretval;
    _cretval = gtk_text_child_anchor_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [gtk.text_child_anchor.TextChildAnchor] with the given replacement character.
      
      Usually you would then insert it into a [gtk.text_buffer.TextBuffer] with
      [gtk.text_buffer.TextBuffer.insertChildAnchor].
  
      Params:
        character = 
      Returns: a new [gtk.text_child_anchor.TextChildAnchor]
  */
  static gtk.text_child_anchor.TextChildAnchor newWithReplacement(string character)
  {
    GtkTextChildAnchor* _cretval;
    const(char)* _character = character.toCString(No.Alloc);
    _cretval = gtk_text_child_anchor_new_with_replacement(_character);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_child_anchor.TextChildAnchor)(cast(GtkTextChildAnchor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Determines whether a child anchor has been deleted from
      the buffer.
      
      Keep in mind that the child anchor will be unreferenced
      when removed from the buffer, so you need to hold your own
      reference (with [gobject.object.ObjectWrap.ref_]) if you plan to use this
      function — otherwise all deleted child anchors will also
      be finalized.
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
      
      The order in which the widgets are returned is not defined.
      Returns: an
          array of widgets anchored at anchor
  */
  gtk.widget.Widget[] getWidgets()
  {
    GtkWidget** _cretval;
    uint _cretlength;
    _cretval = gtk_text_child_anchor_get_widgets(cast(GtkTextChildAnchor*)this._cPtr, &_cretlength);
    gtk.widget.Widget[] _retval;

    if (_cretval)
    {
      _retval = new gtk.widget.Widget[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(_cretval[i], No.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}
