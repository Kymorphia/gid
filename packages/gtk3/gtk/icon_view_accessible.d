/// Module for [IconViewAccessible] class
module gtk.icon_view_accessible;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_icon_view_accessible_get_type != &gidSymbolNotFound ? gtk_icon_view_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IconViewAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.icon_view_accessible.IconViewAccessible]
      Returns: New builder object
  */
  static IconViewAccessibleGidBuilder builder() nothrow
  {
    return new IconViewAccessibleGidBuilder;
  }

  mixin SelectionT!();
}

/// Fluent builder implementation template for [gtk.icon_view_accessible.IconViewAccessible]
class IconViewAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.selection.SelectionGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gtk.icon_view_accessible.IconViewAccessible]
final class IconViewAccessibleGidBuilder : IconViewAccessibleGidBuilderImpl!IconViewAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IconViewAccessible build() nothrow
  {
    return new IconViewAccessible(cast(void*)createGObject(IconViewAccessible._getGType), No.Take);
  }
}
