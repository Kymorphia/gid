/// Module for [MenuButtonAccessible] class
module gtk.menu_button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.toggle_button_accessible;
import gtk.types;

/** */
class MenuButtonAccessible : gtk.toggle_button_accessible.ToggleButtonAccessible
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
    return cast(void function())gtk_menu_button_accessible_get_type != &gidSymbolNotFound ? gtk_menu_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuButtonAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.menu_button_accessible.MenuButtonAccessible]
  Returns: New builder object
  */
  static MenuButtonAccessibleGidBuilder builder()
  {
    return new MenuButtonAccessibleGidBuilder;
  }
}

class MenuButtonAccessibleGidBuilderImpl(T) : gtk.toggle_button_accessible.ToggleButtonAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.menu_button_accessible.MenuButtonAccessible]
final class MenuButtonAccessibleGidBuilder : MenuButtonAccessibleGidBuilderImpl!MenuButtonAccessibleGidBuilder
{
  MenuButtonAccessible build()
  {
    return new MenuButtonAccessible(cast(void*)createGObject(MenuButtonAccessible._getGType), No.Take);
  }
}
