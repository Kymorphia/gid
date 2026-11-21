/// Module for [CellAccessible] class
module gid.gtk3.cell_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.object;
import gid.atk1.table_cell;
import gid.atk1.table_cell_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.accessible;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/** */
class CellAccessible : gid.gtk3.accessible.Accessible, gid.atk1.action.Action, gid.atk1.component.Component, gid.atk1.table_cell.TableCell
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
    return cast(void function())gtk_cell_accessible_get_type != &gidSymbolNotFound ? gtk_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.cell_accessible.CellAccessible]
      Returns: New builder object
  */
  static CellAccessibleGidBuilder builder() nothrow
  {
    return new CellAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin ComponentT!();
  mixin TableCellT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gid.gtk3.cell_accessible.CellAccessible]
class CellAccessibleGidBuilderImpl(T) : gid.gtk3.accessible.AccessibleGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T, gid.atk1.component.ComponentGidBuilderImpl!T, gid.atk1.table_cell.TableCellGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin ComponentGidBuilderT!();
  mixin TableCellGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.cell_accessible.CellAccessible]
final class CellAccessibleGidBuilder : CellAccessibleGidBuilderImpl!CellAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellAccessible build() nothrow
  {
    return new CellAccessible(cast(void*)createGObject(CellAccessible._getGType), Yes.Take);
  }
}
