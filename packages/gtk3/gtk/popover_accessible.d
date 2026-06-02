/// Module for [PopoverAccessible] class
module gtk.popover_accessible;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_popover_accessible_get_type != &gidSymbolNotFound ? gtk_popover_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PopoverAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.popover_accessible.PopoverAccessible]
      Returns: New builder object
  */
  static PopoverAccessibleGidBuilder builder() nothrow
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
  PopoverAccessible build() nothrow
  {
    return new PopoverAccessible(cast(void*)createGObject(PopoverAccessible._getGType), No.Take);
  }
}
