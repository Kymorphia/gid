/// Module for [TreeViewAccessible] class
module gtk.tree_view_accessible;

import atk.component;
import atk.component_mixin;
import atk.selection;
import atk.selection_mixin;
import atk.table;
import atk.table_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_accessible_parent;
import gtk.cell_accessible_parent_mixin;
import gtk.container_accessible;
import gtk.types;

/** */
class TreeViewAccessible : gtk.container_accessible.ContainerAccessible, atk.selection.Selection, atk.table.Table, gtk.cell_accessible_parent.CellAccessibleParent
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
    return cast(void function())gtk_tree_view_accessible_get_type != &gidSymbolNotFound ? gtk_tree_view_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeViewAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.tree_view_accessible.TreeViewAccessible]
      Returns: New builder object
  */
  static TreeViewAccessibleGidBuilder builder()
  {
    return new TreeViewAccessibleGidBuilder;
  }

  mixin SelectionT!();
  mixin TableT!();
  mixin CellAccessibleParentT!();
}

/// Fluent builder implementation template for [gtk.tree_view_accessible.TreeViewAccessible]
class TreeViewAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.selection.SelectionGidBuilderImpl!T, atk.table.TableGidBuilderImpl!T, gtk.cell_accessible_parent.CellAccessibleParentGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
  mixin TableGidBuilderT!();
  mixin CellAccessibleParentGidBuilderT!();
}

/// Fluent builder for [gtk.tree_view_accessible.TreeViewAccessible]
final class TreeViewAccessibleGidBuilder : TreeViewAccessibleGidBuilderImpl!TreeViewAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeViewAccessible build()
  {
    return new TreeViewAccessible(cast(void*)createGObject(TreeViewAccessible._getGType), No.Take);
  }
}
