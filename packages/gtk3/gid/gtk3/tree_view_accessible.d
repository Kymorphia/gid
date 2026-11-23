/// Module for [TreeViewAccessible] class
module gid.gtk3.tree_view_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.selection;
import gid.atk1.selection_mixin;
import gid.atk1.table;
import gid.atk1.table_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_accessible_parent;
import gid.gtk3.cell_accessible_parent_mixin;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class TreeViewAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.selection.Selection, gid.atk1.table.Table, gid.gtk3.cell_accessible_parent.CellAccessibleParent
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_view_accessible_get_type != &gidSymbolNotFound ? gtk_tree_view_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTreeViewAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeViewAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.tree_view_accessible.TreeViewAccessible]
      Returns: New builder object
  */
  static TreeViewAccessibleGidBuilder builder() nothrow
  {
    return new TreeViewAccessibleGidBuilder;
  }

  mixin SelectionT!();
  mixin TableT!();
  mixin CellAccessibleParentT!();
}

/// Fluent builder implementation template for [gid.gtk3.tree_view_accessible.TreeViewAccessible]
class TreeViewAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.selection.SelectionGidBuilderImpl!T, gid.atk1.table.TableGidBuilderImpl!T, gid.gtk3.cell_accessible_parent.CellAccessibleParentGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
  mixin TableGidBuilderT!();
  mixin CellAccessibleParentGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.tree_view_accessible.TreeViewAccessible]
final class TreeViewAccessibleGidBuilder : TreeViewAccessibleGidBuilderImpl!TreeViewAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeViewAccessible build() nothrow
  {
    return new TreeViewAccessible(cast(void*)createGObject(TreeViewAccessible._getGType), Yes.Take);
  }
}
