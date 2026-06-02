/// Module for [CheckMenuItemAccessible] class
module gtk.check_menu_item_accessible;

public import gid.basictypes;
import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.selection;
import atk.selection_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_item_accessible;
import gtk.types;

/** */
class CheckMenuItemAccessible : gtk.menu_item_accessible.MenuItemAccessible
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
    return cast(void function())gtk_check_menu_item_accessible_get_type != &gidSymbolNotFound ? gtk_check_menu_item_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CheckMenuItemAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.check_menu_item_accessible.CheckMenuItemAccessible]
      Returns: New builder object
  */
  static CheckMenuItemAccessibleGidBuilder builder() nothrow
  {
    return new CheckMenuItemAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.check_menu_item_accessible.CheckMenuItemAccessible]
class CheckMenuItemAccessibleGidBuilderImpl(T) : gtk.menu_item_accessible.MenuItemAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.check_menu_item_accessible.CheckMenuItemAccessible]
final class CheckMenuItemAccessibleGidBuilder : CheckMenuItemAccessibleGidBuilderImpl!CheckMenuItemAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CheckMenuItemAccessible build() nothrow
  {
    return new CheckMenuItemAccessible(cast(void*)createGObject(CheckMenuItemAccessible._getGType), No.Take);
  }
}
