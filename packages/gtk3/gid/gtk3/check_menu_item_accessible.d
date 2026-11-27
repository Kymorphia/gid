/// Module for [CheckMenuItemAccessible] class
module gid.gtk3.check_menu_item_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.selection;
import gid.atk1.selection_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.menu_item_accessible;
import gid.gtk3.types;

/** */
@gidGir("CheckMenuItemAccessible", "CheckMenuItemAccessibleClass")
class CheckMenuItemAccessible : gid.gtk3.menu_item_accessible.MenuItemAccessible
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
    return cast(void function())gtk_check_menu_item_accessible_get_type != &gidSymbolNotFound ? gtk_check_menu_item_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCheckMenuItemAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override CheckMenuItemAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.check_menu_item_accessible.CheckMenuItemAccessible]
      Returns: New builder object
  */
  static CheckMenuItemAccessibleGidBuilder builder() nothrow
  {
    return new CheckMenuItemAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.check_menu_item_accessible.CheckMenuItemAccessible]
class CheckMenuItemAccessibleGidBuilderImpl(T) : gid.gtk3.menu_item_accessible.MenuItemAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.check_menu_item_accessible.CheckMenuItemAccessible]
final class CheckMenuItemAccessibleGidBuilder : CheckMenuItemAccessibleGidBuilderImpl!CheckMenuItemAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CheckMenuItemAccessible build() nothrow
  {
    return new CheckMenuItemAccessible(cast(void*)createGObject(CheckMenuItemAccessible._getGType), Yes.Take);
  }
}
