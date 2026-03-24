/// Module for [ContainerCellAccessible] class
module gtk.container_cell_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.table_cell;
import atk.table_cell_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_accessible;
import gtk.types;

/** */
class ContainerCellAccessible : gtk.cell_accessible.CellAccessible
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
    return cast(void function())gtk_container_cell_accessible_get_type != &gidSymbolNotFound ? gtk_container_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContainerCellAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.container_cell_accessible.ContainerCellAccessible]
  Returns: New builder object
  */
  static ContainerCellAccessibleGidBuilder builder()
  {
    return new ContainerCellAccessibleGidBuilder;
  }

  /** */
  this()
  {
    GtkContainerCellAccessible* _cretval;
    _cretval = gtk_container_cell_accessible_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void addChild(gtk.cell_accessible.CellAccessible child)
  {
    gtk_container_cell_accessible_add_child(cast(GtkContainerCellAccessible*)this._cPtr, child ? cast(GtkCellAccessible*)child._cPtr(No.Dup) : null);
  }

  /**
      Get a list of children.
      Returns: 
  */
  gtk.cell_accessible.CellAccessible[] getChildren()
  {
    GList* _cretval;
    _cretval = gtk_container_cell_accessible_get_children(cast(GtkContainerCellAccessible*)this._cPtr);
    auto _retval = gListToD!(gtk.cell_accessible.CellAccessible, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  void removeChild(gtk.cell_accessible.CellAccessible child)
  {
    gtk_container_cell_accessible_remove_child(cast(GtkContainerCellAccessible*)this._cPtr, child ? cast(GtkCellAccessible*)child._cPtr(No.Dup) : null);
  }
}

class ContainerCellAccessibleGidBuilderImpl(T) : gtk.cell_accessible.CellAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.container_cell_accessible.ContainerCellAccessible]
final class ContainerCellAccessibleGidBuilder : ContainerCellAccessibleGidBuilderImpl!ContainerCellAccessibleGidBuilder
{
  ContainerCellAccessible build()
  {
    return new ContainerCellAccessible(cast(void*)createGObject(ContainerCellAccessible._getGType), Yes.Take);
  }
}
