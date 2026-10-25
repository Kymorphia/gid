/// Module for [CustomLayout] class
module gtk.custom_layout;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;

/**
    [gtk.custom_layout.CustomLayout] uses closures for size negotiation.
    
    A `GtkCustomLayout `uses closures matching to the old [gtk.widget.Widget]
    virtual functions for size negotiation, as a convenience API to
    ease the porting towards the corresponding `GtkLayoutManager
    virtual functions.
*/
class CustomLayout : gtk.layout_manager.LayoutManager
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_custom_layout_get_type != &gidSymbolNotFound ? gtk_custom_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CustomLayout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.custom_layout.CustomLayout]
      Returns: New builder object
  */
  static CustomLayoutGidBuilder builder() nothrow
  {
    return new CustomLayoutGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.custom_layout.CustomLayout]
class CustomLayoutGidBuilderImpl(T) : gtk.layout_manager.LayoutManagerGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.custom_layout.CustomLayout]
final class CustomLayoutGidBuilder : CustomLayoutGidBuilderImpl!CustomLayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CustomLayout build() nothrow
  {
    return new CustomLayout(cast(void*)createGObject(CustomLayout._getGType), Yes.Take);
  }
}
