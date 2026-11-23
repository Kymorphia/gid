/// Module for [ContainerCellAccessible] class
module gid.gtk3.container_cell_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.table_cell;
import gid.atk1.table_cell_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_accessible;
import gid.gtk3.types;

/** */
class ContainerCellAccessible : gid.gtk3.cell_accessible.CellAccessible
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
    return cast(void function())gtk_container_cell_accessible_get_type != &gidSymbolNotFound ? gtk_container_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkContainerCellAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ContainerCellAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.container_cell_accessible.ContainerCellAccessible]
      Returns: New builder object
  */
  static ContainerCellAccessibleGidBuilder builder() nothrow
  {
    return new ContainerCellAccessibleGidBuilder;
  }

  /** */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkContainerCellAccessible* _cretval;
      _cretval = gtk_container_cell_accessible_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  void addChild(gid.gtk3.cell_accessible.CellAccessible child) nothrow
  {
    gtk_container_cell_accessible_add_child(cast(GtkContainerCellAccessible*)this._cPtr, child ? cast(GtkCellAccessible*)child._cPtr(No.Dup) : null);
  }

  /**
      Get a list of children.
      Returns: 
  */
  gid.gtk3.cell_accessible.CellAccessible[] getChildren() nothrow
  {
    GList* _cretval;
    _cretval = gtk_container_cell_accessible_get_children(cast(GtkContainerCellAccessible*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.cell_accessible.CellAccessible, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  void removeChild(gid.gtk3.cell_accessible.CellAccessible child) nothrow
  {
    gtk_container_cell_accessible_remove_child(cast(GtkContainerCellAccessible*)this._cPtr, child ? cast(GtkCellAccessible*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.container_cell_accessible.ContainerCellAccessible]
class ContainerCellAccessibleGidBuilderImpl(T) : gid.gtk3.cell_accessible.CellAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.container_cell_accessible.ContainerCellAccessible]
final class ContainerCellAccessibleGidBuilder : ContainerCellAccessibleGidBuilderImpl!ContainerCellAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContainerCellAccessible build() nothrow
  {
    return new ContainerCellAccessible(cast(void*)createGObject(ContainerCellAccessible._getGType), Yes.Take);
  }
}
