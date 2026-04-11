/// Module for [MenuItemAccessible] class
module gtk.menu_item_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.object;
import atk.selection;
import atk.selection_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class MenuItemAccessible : gtk.container_accessible.ContainerAccessible, atk.action.Action, atk.selection.Selection
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
    return cast(void function())gtk_menu_item_accessible_get_type != &gidSymbolNotFound ? gtk_menu_item_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuItemAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.menu_item_accessible.MenuItemAccessible]
      Returns: New builder object
  */
  static MenuItemAccessibleGidBuilder builder()
  {
    return new MenuItemAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin SelectionT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gtk.menu_item_accessible.MenuItemAccessible]
class MenuItemAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.action.ActionGidBuilderImpl!T, atk.selection.SelectionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gtk.menu_item_accessible.MenuItemAccessible]
final class MenuItemAccessibleGidBuilder : MenuItemAccessibleGidBuilderImpl!MenuItemAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuItemAccessible build()
  {
    return new MenuItemAccessible(cast(void*)createGObject(MenuItemAccessible._getGType), No.Take);
  }
}
