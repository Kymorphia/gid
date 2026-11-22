/// Module for [StackAccessible] class
module gid.gtk3.stack_accessible;

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
class StackAccessible : gid.gtk3.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_stack_accessible_get_type != &gidSymbolNotFound ? gtk_stack_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStackAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override StackAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.stack_accessible.StackAccessible]
      Returns: New builder object
  */
  static StackAccessibleGidBuilder builder() nothrow
  {
    return new StackAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.stack_accessible.StackAccessible]
class StackAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.stack_accessible.StackAccessible]
final class StackAccessibleGidBuilder : StackAccessibleGidBuilderImpl!StackAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StackAccessible build() nothrow
  {
    return new StackAccessible(cast(void*)createGObject(StackAccessible._getGType), Yes.Take);
  }
}
