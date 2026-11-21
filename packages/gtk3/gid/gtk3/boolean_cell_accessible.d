/// Module for [BooleanCellAccessible] class
module gid.gtk3.boolean_cell_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.table_cell;
import gid.atk1.table_cell_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.renderer_cell_accessible;
import gid.gtk3.types;

/** */
class BooleanCellAccessible : gid.gtk3.renderer_cell_accessible.RendererCellAccessible
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
    return cast(void function())gtk_boolean_cell_accessible_get_type != &gidSymbolNotFound ? gtk_boolean_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkBooleanCellAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override BooleanCellAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.boolean_cell_accessible.BooleanCellAccessible]
      Returns: New builder object
  */
  static BooleanCellAccessibleGidBuilder builder() nothrow
  {
    return new BooleanCellAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.boolean_cell_accessible.BooleanCellAccessible]
class BooleanCellAccessibleGidBuilderImpl(T) : gid.gtk3.renderer_cell_accessible.RendererCellAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.boolean_cell_accessible.BooleanCellAccessible]
final class BooleanCellAccessibleGidBuilder : BooleanCellAccessibleGidBuilderImpl!BooleanCellAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BooleanCellAccessible build() nothrow
  {
    return new BooleanCellAccessible(cast(void*)createGObject(BooleanCellAccessible._getGType), Yes.Take);
  }
}
