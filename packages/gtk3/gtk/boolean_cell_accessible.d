/// Module for [BooleanCellAccessible] class
module gtk.boolean_cell_accessible;

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
import gtk.renderer_cell_accessible;
import gtk.types;

/** */
class BooleanCellAccessible : gtk.renderer_cell_accessible.RendererCellAccessible
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
    return cast(void function())gtk_boolean_cell_accessible_get_type != &gidSymbolNotFound ? gtk_boolean_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BooleanCellAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.boolean_cell_accessible.BooleanCellAccessible]
  Returns: New builder object
  */
  static BooleanCellAccessibleGidBuilder builder()
  {
    return new BooleanCellAccessibleGidBuilder;
  }
}

class BooleanCellAccessibleGidBuilderImpl(T) : gtk.renderer_cell_accessible.RendererCellAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.boolean_cell_accessible.BooleanCellAccessible]
final class BooleanCellAccessibleGidBuilder : BooleanCellAccessibleGidBuilderImpl!BooleanCellAccessibleGidBuilder
{
  BooleanCellAccessible build()
  {
    return new BooleanCellAccessible(cast(void*)createGObject(BooleanCellAccessible._getGType), No.Take);
  }
}
