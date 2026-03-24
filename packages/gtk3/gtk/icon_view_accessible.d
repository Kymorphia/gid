/// Module for [IconViewAccessible] class
module gtk.icon_view_accessible;

import atk.component;
import atk.component_mixin;
import atk.selection;
import atk.selection_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class IconViewAccessible : gtk.container_accessible.ContainerAccessible, atk.selection.Selection
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
    return cast(void function())gtk_icon_view_accessible_get_type != &gidSymbolNotFound ? gtk_icon_view_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IconViewAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.icon_view_accessible.IconViewAccessible]
  Returns: New builder object
  */
  static IconViewAccessibleGidBuilder builder()
  {
    return new IconViewAccessibleGidBuilder;
  }

  mixin SelectionT!();
}

class IconViewAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.selection.SelectionGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gtk.icon_view_accessible.IconViewAccessible]
final class IconViewAccessibleGidBuilder : IconViewAccessibleGidBuilderImpl!IconViewAccessibleGidBuilder
{
  IconViewAccessible build()
  {
    return new IconViewAccessible(cast(void*)createGObject(IconViewAccessible._getGType), No.Take);
  }
}
