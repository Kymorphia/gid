/// Module for [VScrollbar] class
module gid.gtk3.vscrollbar;

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
    The #GtkVScrollbar widget is a widget arranged vertically creating a
    scrollbar. See #GtkScrollbar for details on
    scrollbars. #GtkAdjustment pointers may be added to handle the
    adjustment of the scrollbar or it may be left null in which case one
    will be created for you. See #GtkScrollbar for a description of what the
    fields in an adjustment represent for a scrollbar.
    
    GtkVScrollbar has been deprecated, use #GtkScrollbar instead.
*/
class VScrollbar : gid.gtk3.scrollbar.Scrollbar
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
    return cast(void function())gtk_vscrollbar_get_type != &gidSymbolNotFound ? gtk_vscrollbar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkVScrollbar";
  }

  /** Returns `this`, for use in `with` statements. */
  override VScrollbar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.vscrollbar.VScrollbar]
      Returns: New builder object
  */
  static VScrollbarGidBuilder builder() nothrow
  {
    return new VScrollbarGidBuilder;
  }

  /**
      Creates a new vertical scrollbar.
  
      Params:
        adjustment = the #GtkAdjustment to use, or null to create a new adjustment
      Returns: the new #GtkVScrollbar
  
      Deprecated: Use [gid.gtk4.scrollbar.Scrollbar.new_] with [gid.gtk4.types.Orientation.Vertical] instead
  */
  this(gid.gtk3.adjustment.Adjustment adjustment = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_vscrollbar_new(adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gid.gtk3.vscrollbar.VScrollbar]
class VScrollbarGidBuilderImpl(T) : gid.gtk3.scrollbar.ScrollbarGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.vscrollbar.VScrollbar]
final class VScrollbarGidBuilder : VScrollbarGidBuilderImpl!VScrollbarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VScrollbar build() nothrow
  {
    return new VScrollbar(cast(void*)createGObject(VScrollbar._getGType), Yes.Take);
  }
}
