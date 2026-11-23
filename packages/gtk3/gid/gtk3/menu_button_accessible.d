/// Module for [MenuButtonAccessible] class
module gid.gtk3.menu_button_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.image;
import gid.atk1.image_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.toggle_button_accessible;
import gid.gtk3.types;

/** */
class MenuButtonAccessible : gid.gtk3.toggle_button_accessible.ToggleButtonAccessible
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
    return cast(void function())gtk_menu_button_accessible_get_type != &gidSymbolNotFound ? gtk_menu_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMenuButtonAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuButtonAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.menu_button_accessible.MenuButtonAccessible]
      Returns: New builder object
  */
  static MenuButtonAccessibleGidBuilder builder() nothrow
  {
    return new MenuButtonAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.menu_button_accessible.MenuButtonAccessible]
class MenuButtonAccessibleGidBuilderImpl(T) : gid.gtk3.toggle_button_accessible.ToggleButtonAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.menu_button_accessible.MenuButtonAccessible]
final class MenuButtonAccessibleGidBuilder : MenuButtonAccessibleGidBuilderImpl!MenuButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuButtonAccessible build() nothrow
  {
    return new MenuButtonAccessible(cast(void*)createGObject(MenuButtonAccessible._getGType), Yes.Take);
  }
}
