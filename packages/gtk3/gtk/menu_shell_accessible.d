/// Module for [MenuShellAccessible] class
module gtk.menu_shell_accessible;

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
class MenuShellAccessible : gtk.container_accessible.ContainerAccessible, atk.selection.Selection
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
    return cast(void function())gtk_menu_shell_accessible_get_type != &gidSymbolNotFound ? gtk_menu_shell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuShellAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.menu_shell_accessible.MenuShellAccessible]
  Returns: New builder object
  */
  static MenuShellAccessibleGidBuilder builder()
  {
    return new MenuShellAccessibleGidBuilder;
  }

  mixin SelectionT!();
}

class MenuShellAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.selection.SelectionGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gtk.menu_shell_accessible.MenuShellAccessible]
final class MenuShellAccessibleGidBuilder : MenuShellAccessibleGidBuilderImpl!MenuShellAccessibleGidBuilder
{
  MenuShellAccessible build()
  {
    return new MenuShellAccessible(cast(void*)createGObject(MenuShellAccessible._getGType), No.Take);
  }
}
