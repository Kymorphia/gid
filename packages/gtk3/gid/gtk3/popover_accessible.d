/// Module for [PopoverAccessible] class
module gid.gtk3.popover_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class PopoverAccessible : gid.gtk3.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_popover_accessible_get_type != &gidSymbolNotFound ? gtk_popover_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPopoverAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override PopoverAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.popover_accessible.PopoverAccessible]
      Returns: New builder object
  */
  static PopoverAccessibleGidBuilder builder() nothrow
  {
    return new PopoverAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.popover_accessible.PopoverAccessible]
class PopoverAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.popover_accessible.PopoverAccessible]
final class PopoverAccessibleGidBuilder : PopoverAccessibleGidBuilderImpl!PopoverAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PopoverAccessible build() nothrow
  {
    return new PopoverAccessible(cast(void*)createGObject(PopoverAccessible._getGType), Yes.Take);
  }
}
