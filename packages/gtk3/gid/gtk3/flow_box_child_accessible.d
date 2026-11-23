/// Module for [FlowBoxChildAccessible] class
module gid.gtk3.flow_box_child_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class FlowBoxChildAccessible : gid.gtk3.container_accessible.ContainerAccessible
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_flow_box_child_accessible_get_type != &gidSymbolNotFound ? gtk_flow_box_child_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFlowBoxChildAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override FlowBoxChildAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.flow_box_child_accessible.FlowBoxChildAccessible]
      Returns: New builder object
  */
  static FlowBoxChildAccessibleGidBuilder builder() nothrow
  {
    return new FlowBoxChildAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.flow_box_child_accessible.FlowBoxChildAccessible]
class FlowBoxChildAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.flow_box_child_accessible.FlowBoxChildAccessible]
final class FlowBoxChildAccessibleGidBuilder : FlowBoxChildAccessibleGidBuilderImpl!FlowBoxChildAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FlowBoxChildAccessible build() nothrow
  {
    return new FlowBoxChildAccessible(cast(void*)createGObject(FlowBoxChildAccessible._getGType), Yes.Take);
  }
}
