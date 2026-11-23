/// Module for [ContainerAccessible] class
module gid.gtk3.container_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget_accessible;

/** */
class ContainerAccessible : gid.gtk3.widget_accessible.WidgetAccessible
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
    return cast(void function())gtk_container_accessible_get_type != &gidSymbolNotFound ? gtk_container_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkContainerAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ContainerAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.container_accessible.ContainerAccessible]
      Returns: New builder object
  */
  static ContainerAccessibleGidBuilder builder() nothrow
  {
    return new ContainerAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.container_accessible.ContainerAccessible]
class ContainerAccessibleGidBuilderImpl(T) : gid.gtk3.widget_accessible.WidgetAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.container_accessible.ContainerAccessible]
final class ContainerAccessibleGidBuilder : ContainerAccessibleGidBuilderImpl!ContainerAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContainerAccessible build() nothrow
  {
    return new ContainerAccessible(cast(void*)createGObject(ContainerAccessible._getGType), Yes.Take);
  }
}
