/// Module for [MenuItemAccessible] class
module gid.gtk3.menu_item_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.object;
import gid.atk1.selection;
import gid.atk1.selection_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
@gidGir("MenuItemAccessible", "MenuItemAccessibleClass")
class MenuItemAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.action.Action, gid.atk1.selection.Selection
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
    return cast(void function())gtk_menu_item_accessible_get_type != &gidSymbolNotFound ? gtk_menu_item_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMenuItemAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuItemAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.menu_item_accessible.MenuItemAccessible]
      Returns: New builder object
  */
  static MenuItemAccessibleGidBuilder builder() nothrow
  {
    return new MenuItemAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin SelectionT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gid.gtk3.menu_item_accessible.MenuItemAccessible]
class MenuItemAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T, gid.atk1.selection.SelectionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.menu_item_accessible.MenuItemAccessible]
final class MenuItemAccessibleGidBuilder : MenuItemAccessibleGidBuilderImpl!MenuItemAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuItemAccessible build() nothrow
  {
    return new MenuItemAccessible(cast(void*)createGObject(MenuItemAccessible._getGType), Yes.Take);
  }
}
