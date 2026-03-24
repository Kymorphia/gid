/// Module for [ListBoxRowAccessible] class
module gtk.list_box_row_accessible;

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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_list_box_row_accessible_get_type != &gidSymbolNotFound ? gtk_list_box_row_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListBoxRowAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.list_box_row_accessible.ListBoxRowAccessible]
  Returns: New builder object
  */
  static ListBoxRowAccessibleGidBuilder builder()
  {
    return new ListBoxRowAccessibleGidBuilder;
  }
}

class ListBoxRowAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.list_box_row_accessible.ListBoxRowAccessible]
final class ListBoxRowAccessibleGidBuilder : ListBoxRowAccessibleGidBuilderImpl!ListBoxRowAccessibleGidBuilder
{
  ListBoxRowAccessible build()
  {
    return new ListBoxRowAccessible(cast(void*)createGObject(ListBoxRowAccessible._getGType), No.Take);
  }
}
