/// Module for [HScrollbar] class
module gtk.hscrollbar;

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
    The #GtkHScrollbar widget is a widget arranged horizontally creating a
    scrollbar. See #GtkScrollbar for details on
    scrollbars. #GtkAdjustment pointers may be added to handle the
    adjustment of the scrollbar or it may be left null in which case one
    will be created for you. See #GtkScrollbar for a description of what the
    fields in an adjustment represent for a scrollbar.
    
    GtkHScrollbar has been deprecated, use #GtkScrollbar instead.
*/
class HScrollbar : gtk.scrollbar.Scrollbar
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
    return cast(void function())gtk_hscrollbar_get_type != &gidSymbolNotFound ? gtk_hscrollbar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HScrollbar self()
  {
    return this;
  }

  /**
  Get builder for [gtk.hscrollbar.HScrollbar]
  Returns: New builder object
  */
  static HScrollbarGidBuilder builder()
  {
    return new HScrollbarGidBuilder;
  }

  /**
      Creates a new horizontal scrollbar.
  
      Params:
        adjustment = the #GtkAdjustment to use, or null to create a new adjustment
      Returns: the new #GtkHScrollbar
  
      Deprecated: Use [gtk.scrollbar.Scrollbar.new_] with [gtk.types.Orientation.Horizontal] instead
  */
  this(gtk.adjustment.Adjustment adjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_hscrollbar_new(adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

class HScrollbarGidBuilderImpl(T) : gtk.scrollbar.ScrollbarGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.hscrollbar.HScrollbar]
final class HScrollbarGidBuilder : HScrollbarGidBuilderImpl!HScrollbarGidBuilder
{
  HScrollbar build()
  {
    return new HScrollbar(cast(void*)createGObject(HScrollbar._getGType), No.Take);
  }
}
