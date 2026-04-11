/// Module for [VScrollbar] class
module gtk.vscrollbar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scrollbar;
import gtk.types;

/**
    The #GtkVScrollbar widget is a widget arranged vertically creating a
    scrollbar. See #GtkScrollbar for details on
    scrollbars. #GtkAdjustment pointers may be added to handle the
    adjustment of the scrollbar or it may be left null in which case one
    will be created for you. See #GtkScrollbar for a description of what the
    fields in an adjustment represent for a scrollbar.
    
    GtkVScrollbar has been deprecated, use #GtkScrollbar instead.
*/
class VScrollbar : gtk.scrollbar.Scrollbar
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
    return cast(void function())gtk_vscrollbar_get_type != &gidSymbolNotFound ? gtk_vscrollbar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VScrollbar self()
  {
    return this;
  }

  /**
      Get builder for [gtk.vscrollbar.VScrollbar]
      Returns: New builder object
  */
  static VScrollbarGidBuilder builder()
  {
    return new VScrollbarGidBuilder;
  }

  /**
      Creates a new vertical scrollbar.
  
      Params:
        adjustment = the #GtkAdjustment to use, or null to create a new adjustment
      Returns: the new #GtkVScrollbar
  
      Deprecated: Use [gtk.scrollbar.Scrollbar.new_] with [gtk.types.Orientation.Vertical] instead
  */
  this(gtk.adjustment.Adjustment adjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_vscrollbar_new(adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtk.vscrollbar.VScrollbar]
class VScrollbarGidBuilderImpl(T) : gtk.scrollbar.ScrollbarGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.vscrollbar.VScrollbar]
final class VScrollbarGidBuilder : VScrollbarGidBuilderImpl!VScrollbarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VScrollbar build()
  {
    return new VScrollbar(cast(void*)createGObject(VScrollbar._getGType), No.Take);
  }
}
