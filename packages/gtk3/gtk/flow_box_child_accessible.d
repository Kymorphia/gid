/// Module for [FlowBoxChildAccessible] class
module gtk.flow_box_child_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class FlowBoxChildAccessible : gtk.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_flow_box_child_accessible_get_type != &gidSymbolNotFound ? gtk_flow_box_child_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FlowBoxChildAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.flow_box_child_accessible.FlowBoxChildAccessible]
      Returns: New builder object
  */
  static FlowBoxChildAccessibleGidBuilder builder()
  {
    return new FlowBoxChildAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.flow_box_child_accessible.FlowBoxChildAccessible]
class FlowBoxChildAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.flow_box_child_accessible.FlowBoxChildAccessible]
final class FlowBoxChildAccessibleGidBuilder : FlowBoxChildAccessibleGidBuilderImpl!FlowBoxChildAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FlowBoxChildAccessible build()
  {
    return new FlowBoxChildAccessible(cast(void*)createGObject(FlowBoxChildAccessible._getGType), No.Take);
  }
}
