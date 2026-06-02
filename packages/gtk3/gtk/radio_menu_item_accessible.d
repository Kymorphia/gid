/// Module for [RadioMenuItemAccessible] class
module gtk.radio_menu_item_accessible;

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
import gtk.check_menu_item_accessible;
import gtk.types;

/** */
class RadioMenuItemAccessible : gtk.check_menu_item_accessible.CheckMenuItemAccessible
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
    return cast(void function())gtk_radio_menu_item_accessible_get_type != &gidSymbolNotFound ? gtk_radio_menu_item_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RadioMenuItemAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.radio_menu_item_accessible.RadioMenuItemAccessible]
      Returns: New builder object
  */
  static RadioMenuItemAccessibleGidBuilder builder() nothrow
  {
    return new RadioMenuItemAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.radio_menu_item_accessible.RadioMenuItemAccessible]
class RadioMenuItemAccessibleGidBuilderImpl(T) : gtk.check_menu_item_accessible.CheckMenuItemAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.radio_menu_item_accessible.RadioMenuItemAccessible]
final class RadioMenuItemAccessibleGidBuilder : RadioMenuItemAccessibleGidBuilderImpl!RadioMenuItemAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RadioMenuItemAccessible build() nothrow
  {
    return new RadioMenuItemAccessible(cast(void*)createGObject(RadioMenuItemAccessible._getGType), No.Take);
  }
}
