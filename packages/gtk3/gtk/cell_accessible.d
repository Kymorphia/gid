/// Module for [CellAccessible] class
module gtk.cell_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.object;
import atk.table_cell;
import atk.table_cell_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class CellAccessible : gtk.accessible.Accessible, atk.action.Action, atk.component.Component, atk.table_cell.TableCell
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
    return cast(void function())gtk_cell_accessible_get_type != &gidSymbolNotFound ? gtk_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.cell_accessible.CellAccessible]
      Returns: New builder object
  */
  static CellAccessibleGidBuilder builder()
  {
    return new CellAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin ComponentT!();
  mixin TableCellT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gtk.cell_accessible.CellAccessible]
class CellAccessibleGidBuilderImpl(T) : gtk.accessible.AccessibleGidBuilderImpl!T, atk.action.ActionGidBuilderImpl!T, atk.component.ComponentGidBuilderImpl!T, atk.table_cell.TableCellGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin ComponentGidBuilderT!();
  mixin TableCellGidBuilderT!();
}

/// Fluent builder for [gtk.cell_accessible.CellAccessible]
final class CellAccessibleGidBuilder : CellAccessibleGidBuilderImpl!CellAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellAccessible build()
  {
    return new CellAccessible(cast(void*)createGObject(CellAccessible._getGType), No.Take);
  }
}
