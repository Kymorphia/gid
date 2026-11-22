/// Module for [HeaderBarAccessible] class
module gid.gtk3.header_bar_accessible;

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
class HeaderBarAccessible : gid.gtk3.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_header_bar_accessible_get_type != &gidSymbolNotFound ? gtk_header_bar_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkHeaderBarAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override HeaderBarAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.header_bar_accessible.HeaderBarAccessible]
      Returns: New builder object
  */
  static HeaderBarAccessibleGidBuilder builder() nothrow
  {
    return new HeaderBarAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.header_bar_accessible.HeaderBarAccessible]
class HeaderBarAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.header_bar_accessible.HeaderBarAccessible]
final class HeaderBarAccessibleGidBuilder : HeaderBarAccessibleGidBuilderImpl!HeaderBarAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HeaderBarAccessible build() nothrow
  {
    return new HeaderBarAccessible(cast(void*)createGObject(HeaderBarAccessible._getGType), Yes.Take);
  }
}
