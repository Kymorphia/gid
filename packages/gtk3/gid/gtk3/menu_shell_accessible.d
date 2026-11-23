/// Module for [MenuShellAccessible] class
module gid.gtk3.menu_shell_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.selection;
import gid.atk1.selection_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class MenuShellAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.selection.Selection
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
    return cast(void function())gtk_menu_shell_accessible_get_type != &gidSymbolNotFound ? gtk_menu_shell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMenuShellAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuShellAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.menu_shell_accessible.MenuShellAccessible]
      Returns: New builder object
  */
  static MenuShellAccessibleGidBuilder builder() nothrow
  {
    return new MenuShellAccessibleGidBuilder;
  }

  mixin SelectionT!();
}

/// Fluent builder implementation template for [gid.gtk3.menu_shell_accessible.MenuShellAccessible]
class MenuShellAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.selection.SelectionGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.menu_shell_accessible.MenuShellAccessible]
final class MenuShellAccessibleGidBuilder : MenuShellAccessibleGidBuilderImpl!MenuShellAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuShellAccessible build() nothrow
  {
    return new MenuShellAccessible(cast(void*)createGObject(MenuShellAccessible._getGType), Yes.Take);
  }
}
