/// Module for [ListBoxRowAccessible] class
module gtk.list_box_row_accessible;

public import gid.basictypes;
import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class ListBoxRowAccessible : gtk.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_list_box_row_accessible_get_type != &gidSymbolNotFound ? gtk_list_box_row_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListBoxRowAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.list_box_row_accessible.ListBoxRowAccessible]
      Returns: New builder object
  */
  static ListBoxRowAccessibleGidBuilder builder() nothrow
  {
    return new ListBoxRowAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.list_box_row_accessible.ListBoxRowAccessible]
class ListBoxRowAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.list_box_row_accessible.ListBoxRowAccessible]
final class ListBoxRowAccessibleGidBuilder : ListBoxRowAccessibleGidBuilderImpl!ListBoxRowAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListBoxRowAccessible build() nothrow
  {
    return new ListBoxRowAccessible(cast(void*)createGObject(ListBoxRowAccessible._getGType), No.Take);
  }
}
