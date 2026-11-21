/// Module for [CustomLayout] class
module gid.gtk4.custom_layout;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_manager;
import gid.gtk4.types;

/**
    Uses closures for size negotiation.
    
    A [gid.gtk4.custom_layout.CustomLayout] uses closures matching to the old [gid.gtk4.widget.Widget]
    virtual functions for size negotiation, as a convenience API to
    ease the porting towards the corresponding [gid.gtk4.layout_manager.LayoutManager]
    virtual functions.
*/
class CustomLayout : gid.gtk4.layout_manager.LayoutManager
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
    return cast(void function())gtk_custom_layout_get_type != &gidSymbolNotFound ? gtk_custom_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCustomLayout";
  }

  /** Returns `this`, for use in `with` statements. */
  override CustomLayout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.custom_layout.CustomLayout]
      Returns: New builder object
  */
  static CustomLayoutGidBuilder builder() nothrow
  {
    return new CustomLayoutGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk4.custom_layout.CustomLayout]
class CustomLayoutGidBuilderImpl(T) : gid.gtk4.layout_manager.LayoutManagerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.custom_layout.CustomLayout]
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
