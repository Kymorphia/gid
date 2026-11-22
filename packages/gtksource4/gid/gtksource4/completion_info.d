/// Module for [CompletionInfo] class
module gid.gtksource4.completion_info;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.text_iter;
import gid.gtk3.text_view;
import gid.gtk3.window;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.types;

/** */
class CompletionInfo : gid.gtk3.window.Window
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
    return cast(void function())gtk_source_completion_info_get_type != &gidSymbolNotFound ? gtk_source_completion_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceCompletionInfo";
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionInfo self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.completion_info.CompletionInfo]
      Returns: New builder object
  */
  static CompletionInfoGidBuilder builder() nothrow
  {
    return new CompletionInfoGidBuilder;
  }

  /** */
  this() nothrow
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
  void moveToIter(gid.gtk3.text_view.TextView view, gid.gtk3.text_iter.TextIter iter = null) nothrow
  {
    gtk_source_completion_info_move_to_iter(cast(GtkSourceCompletionInfo*)this._cPtr, view ? cast(GtkTextView*)view._cPtr(No.Dup) : null, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.completion_info.CompletionInfo]
class CompletionInfoGidBuilderImpl(T) : gid.gtk3.window.WindowGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtksource4.completion_info.CompletionInfo]
final class CompletionInfoGidBuilder : CompletionInfoGidBuilderImpl!CompletionInfoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CompletionInfo build() nothrow
  {
    return new CompletionInfo(cast(void*)createGObject(CompletionInfo._getGType), Yes.Take);
  }
}
