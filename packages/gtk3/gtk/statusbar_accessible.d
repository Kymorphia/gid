/// Module for [StatusbarAccessible] class
module gtk.statusbar_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class StatusbarAccessible : gtk.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_statusbar_accessible_get_type != &gidSymbolNotFound ? gtk_statusbar_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StatusbarAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.statusbar_accessible.StatusbarAccessible]
  Returns: New builder object
  */
  static StatusbarAccessibleGidBuilder builder()
  {
    return new StatusbarAccessibleGidBuilder;
  }
}

class StatusbarAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.statusbar_accessible.StatusbarAccessible]
final class StatusbarAccessibleGidBuilder : StatusbarAccessibleGidBuilderImpl!StatusbarAccessibleGidBuilder
{
  StatusbarAccessible build()
  {
    return new StatusbarAccessible(cast(void*)createGObject(StatusbarAccessible._getGType), No.Take);
  }
}
