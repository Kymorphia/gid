/// Module for [PopoverAccessible] class
module gtk.popover_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class PopoverAccessible : gtk.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_popover_accessible_get_type != &gidSymbolNotFound ? gtk_popover_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PopoverAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.popover_accessible.PopoverAccessible]
      Returns: New builder object
  */
  static PopoverAccessibleGidBuilder builder()
  {
    return new PopoverAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.popover_accessible.PopoverAccessible]
class PopoverAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.popover_accessible.PopoverAccessible]
final class PopoverAccessibleGidBuilder : PopoverAccessibleGidBuilderImpl!PopoverAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PopoverAccessible build()
  {
    return new PopoverAccessible(cast(void*)createGObject(PopoverAccessible._getGType), No.Take);
  }
}
