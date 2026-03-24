/// Module for [PanedAccessible] class
module gtk.paned_accessible;

import atk.component;
import atk.component_mixin;
import atk.value;
import atk.value_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class PanedAccessible : gtk.container_accessible.ContainerAccessible, atk.value.Value
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
    return cast(void function())gtk_paned_accessible_get_type != &gidSymbolNotFound ? gtk_paned_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PanedAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.paned_accessible.PanedAccessible]
  Returns: New builder object
  */
  static PanedAccessibleGidBuilder builder()
  {
    return new PanedAccessibleGidBuilder;
  }

  mixin ValueT!();
}

class PanedAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gtk.paned_accessible.PanedAccessible]
final class PanedAccessibleGidBuilder : PanedAccessibleGidBuilderImpl!PanedAccessibleGidBuilder
{
  PanedAccessible build()
  {
    return new PanedAccessible(cast(void*)createGObject(PanedAccessible._getGType), No.Take);
  }
}
