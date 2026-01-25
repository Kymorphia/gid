/// Module for [CompletionInfo] class
module gtksource.completion_info;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.text_iter;
import gtk.text_view;
import gtk.window;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
class CompletionInfo : gtk.window.Window
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
    return cast(void function())gtk_source_completion_info_get_type != &gidSymbolNotFound ? gtk_source_completion_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionInfo self()
  {
    return this;
  }

  /** */
  this()
  {
    GtkSourceCompletionInfo* _cretval;
    _cretval = gtk_source_completion_info_new();
    this(_cretval, No.Take);
  }

  /**
      Moves the #GtkSourceCompletionInfo to iter. If iter is null info is
      moved to the cursor position. Moving will respect the #GdkGravity setting
      of the info window and will ensure the line at iter is not occluded by
      the window.
  
      Params:
        view = a #GtkTextView on which the info window should be positioned.
        iter = a #GtkTextIter.
  */
  void moveToIter(gtk.text_view.TextView view, gtk.text_iter.TextIter iter = null)
  {
    gtk_source_completion_info_move_to_iter(cast(GtkSourceCompletionInfo*)this._cPtr, view ? cast(GtkTextView*)view._cPtr(No.Dup) : null, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
  }
}
