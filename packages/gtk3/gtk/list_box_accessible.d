/// Module for [ListBoxAccessible] class
module gtk.list_box_accessible;

import atk.component;
import atk.component_mixin;
import atk.selection;
import atk.selection_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class ListBoxAccessible : gtk.container_accessible.ContainerAccessible, atk.selection.Selection
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
    return cast(void function())gtk_list_box_accessible_get_type != &gidSymbolNotFound ? gtk_list_box_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListBoxAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.list_box_accessible.ListBoxAccessible]
      Returns: New builder object
  */
  static ListBoxAccessibleGidBuilder builder()
  {
    return new ListBoxAccessibleGidBuilder;
  }

  mixin SelectionT!();
}

/// Fluent builder implementation template for [gtk.list_box_accessible.ListBoxAccessible]
class ListBoxAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.selection.SelectionGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gtk.list_box_accessible.ListBoxAccessible]
final class ListBoxAccessibleGidBuilder : ListBoxAccessibleGidBuilderImpl!ListBoxAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListBoxAccessible build()
  {
    return new ListBoxAccessible(cast(void*)createGObject(ListBoxAccessible._getGType), No.Take);
  }
}
