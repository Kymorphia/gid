/// Module for [HeaderBarAccessible] class
module gtk.header_bar_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class HeaderBarAccessible : gtk.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_header_bar_accessible_get_type != &gidSymbolNotFound ? gtk_header_bar_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HeaderBarAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.header_bar_accessible.HeaderBarAccessible]
  Returns: New builder object
  */
  static HeaderBarAccessibleGidBuilder builder()
  {
    return new HeaderBarAccessibleGidBuilder;
  }
}

class HeaderBarAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.header_bar_accessible.HeaderBarAccessible]
final class HeaderBarAccessibleGidBuilder : HeaderBarAccessibleGidBuilderImpl!HeaderBarAccessibleGidBuilder
{
  HeaderBarAccessible build()
  {
    return new HeaderBarAccessible(cast(void*)createGObject(HeaderBarAccessible._getGType), No.Take);
  }
}
