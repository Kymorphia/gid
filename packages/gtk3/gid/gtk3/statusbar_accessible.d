/// Module for [StatusbarAccessible] class
module gid.gtk3.statusbar_accessible;

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
class StatusbarAccessible : gid.gtk3.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_statusbar_accessible_get_type != &gidSymbolNotFound ? gtk_statusbar_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStatusbarAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override StatusbarAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.statusbar_accessible.StatusbarAccessible]
      Returns: New builder object
  */
  static StatusbarAccessibleGidBuilder builder() nothrow
  {
    return new StatusbarAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.statusbar_accessible.StatusbarAccessible]
class StatusbarAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.statusbar_accessible.StatusbarAccessible]
final class StatusbarAccessibleGidBuilder : StatusbarAccessibleGidBuilderImpl!StatusbarAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StatusbarAccessible build() nothrow
  {
    return new StatusbarAccessible(cast(void*)createGObject(StatusbarAccessible._getGType), Yes.Take);
  }
}
