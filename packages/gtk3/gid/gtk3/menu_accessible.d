/// Module for [MenuAccessible] class
module gid.gtk3.menu_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.selection;
import gid.atk1.selection_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.menu_shell_accessible;
import gid.gtk3.types;

/** */
@gidGir("MenuAccessible", "MenuAccessibleClass")
class MenuAccessible : gid.gtk3.menu_shell_accessible.MenuShellAccessible
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_menu_accessible_get_type != &gidSymbolNotFound ? gtk_menu_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMenuAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.menu_accessible.MenuAccessible]
      Returns: New builder object
  */
  static MenuAccessibleGidBuilder builder() nothrow
  {
    return new MenuAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.menu_accessible.MenuAccessible]
class MenuAccessibleGidBuilderImpl(T) : gid.gtk3.menu_shell_accessible.MenuShellAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.menu_accessible.MenuAccessible]
final class MenuAccessibleGidBuilder : MenuAccessibleGidBuilderImpl!MenuAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuAccessible build() nothrow
  {
    return new MenuAccessible(cast(void*)createGObject(MenuAccessible._getGType), Yes.Take);
  }
}
