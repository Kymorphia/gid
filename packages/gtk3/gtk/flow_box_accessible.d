/// Module for [FlowBoxAccessible] class
module gtk.flow_box_accessible;

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
class FlowBoxAccessible : gtk.container_accessible.ContainerAccessible, atk.selection.Selection
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
    return cast(void function())gtk_flow_box_accessible_get_type != &gidSymbolNotFound ? gtk_flow_box_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FlowBoxAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.flow_box_accessible.FlowBoxAccessible]
      Returns: New builder object
  */
  static FlowBoxAccessibleGidBuilder builder()
  {
    return new FlowBoxAccessibleGidBuilder;
  }

  mixin SelectionT!();
}

/// Fluent builder implementation template for [gtk.flow_box_accessible.FlowBoxAccessible]
class FlowBoxAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.selection.SelectionGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gtk.flow_box_accessible.FlowBoxAccessible]
final class FlowBoxAccessibleGidBuilder : FlowBoxAccessibleGidBuilderImpl!FlowBoxAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FlowBoxAccessible build()
  {
    return new FlowBoxAccessible(cast(void*)createGObject(FlowBoxAccessible._getGType), No.Take);
  }
}
