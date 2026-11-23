/// Module for [HScrollbar] class
module gid.gtk3.hscrollbar;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.adjustment;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.scrollbar;
import gid.gtk3.types;

/**
    The #GtkHScrollbar widget is a widget arranged horizontally creating a
    scrollbar. See #GtkScrollbar for details on
    scrollbars. #GtkAdjustment pointers may be added to handle the
    adjustment of the scrollbar or it may be left null in which case one
    will be created for you. See #GtkScrollbar for a description of what the
    fields in an adjustment represent for a scrollbar.
    
    GtkHScrollbar has been deprecated, use #GtkScrollbar instead.
*/
class HScrollbar : gid.gtk3.scrollbar.Scrollbar
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
    return cast(void function())gtk_hscrollbar_get_type != &gidSymbolNotFound ? gtk_hscrollbar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkHScrollbar";
  }

  /** Returns `this`, for use in `with` statements. */
  override HScrollbar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.hscrollbar.HScrollbar]
      Returns: New builder object
  */
  static HScrollbarGidBuilder builder() nothrow
  {
    return new HScrollbarGidBuilder;
  }

  /**
      Creates a new horizontal scrollbar.
  
      Params:
        adjustment = the #GtkAdjustment to use, or null to create a new adjustment
      Returns: the new #GtkHScrollbar
  
      Deprecated: Use [gid.gtk4.scrollbar.Scrollbar.new_] with [gid.gtk4.types.Orientation.Horizontal] instead
  */
  this(gid.gtk3.adjustment.Adjustment adjustment = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, adjustment !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_hscrollbar_new(adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.hscrollbar.HScrollbar]
class HScrollbarGidBuilderImpl(T) : gid.gtk3.scrollbar.ScrollbarGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.hscrollbar.HScrollbar]
final class HScrollbarGidBuilder : HScrollbarGidBuilderImpl!HScrollbarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HScrollbar build() nothrow
  {
    return new HScrollbar(cast(void*)createGObject(HScrollbar._getGType), Yes.Take);
  }
}
