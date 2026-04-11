/// Module for [StackAccessible] class
module gtk.stack_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class StackAccessible : gtk.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_stack_accessible_get_type != &gidSymbolNotFound ? gtk_stack_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StackAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.stack_accessible.StackAccessible]
      Returns: New builder object
  */
  static StackAccessibleGidBuilder builder()
  {
    return new StackAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.stack_accessible.StackAccessible]
class StackAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.stack_accessible.StackAccessible]
final class StackAccessibleGidBuilder : StackAccessibleGidBuilderImpl!StackAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StackAccessible build()
  {
    return new StackAccessible(cast(void*)createGObject(StackAccessible._getGType), No.Take);
  }
}
