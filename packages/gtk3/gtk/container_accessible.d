/// Module for [ContainerAccessible] class
module gtk.container_accessible;

public import gid.basictypes;
import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_accessible;

/** */
class ContainerAccessible : gtk.widget_accessible.WidgetAccessible
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
    return cast(void function())gtk_container_accessible_get_type != &gidSymbolNotFound ? gtk_container_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContainerAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.container_accessible.ContainerAccessible]
      Returns: New builder object
  */
  static ContainerAccessibleGidBuilder builder() nothrow
  {
    return new ContainerAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.container_accessible.ContainerAccessible]
class ContainerAccessibleGidBuilderImpl(T) : gtk.widget_accessible.WidgetAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.container_accessible.ContainerAccessible]
final class ContainerAccessibleGidBuilder : ContainerAccessibleGidBuilderImpl!ContainerAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContainerAccessible build() nothrow
  {
    return new ContainerAccessible(cast(void*)createGObject(ContainerAccessible._getGType), No.Take);
  }
}
