/// Module for [MenuAccessible] class
module gtk.menu_accessible;

public import gid.basictypes;
import atk.component;
import atk.component_mixin;
import atk.selection;
import atk.selection_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_shell_accessible;
import gtk.types;

/** */
class MenuAccessible : gtk.menu_shell_accessible.MenuShellAccessible
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
    return cast(void function())gtk_menu_accessible_get_type != &gidSymbolNotFound ? gtk_menu_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.menu_accessible.MenuAccessible]
      Returns: New builder object
  */
  static MenuAccessibleGidBuilder builder() nothrow
  {
    return new MenuAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.menu_accessible.MenuAccessible]
class MenuAccessibleGidBuilderImpl(T) : gtk.menu_shell_accessible.MenuShellAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.menu_accessible.MenuAccessible]
final class MenuAccessibleGidBuilder : MenuAccessibleGidBuilderImpl!MenuAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuAccessible build() nothrow
  {
    return new MenuAccessible(cast(void*)createGObject(MenuAccessible._getGType), No.Take);
  }
}
