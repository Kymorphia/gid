/// Module for [RadioMenuItemAccessible] class
module gid.gtk3.radio_menu_item_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.selection;
import gid.atk1.selection_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.check_menu_item_accessible;
import gid.gtk3.types;

/** */
class RadioMenuItemAccessible : gid.gtk3.check_menu_item_accessible.CheckMenuItemAccessible
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_radio_menu_item_accessible_get_type != &gidSymbolNotFound ? gtk_radio_menu_item_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRadioMenuItemAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override RadioMenuItemAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.radio_menu_item_accessible.RadioMenuItemAccessible]
      Returns: New builder object
  */
  static RadioMenuItemAccessibleGidBuilder builder() nothrow
  {
    return new RadioMenuItemAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.radio_menu_item_accessible.RadioMenuItemAccessible]
class RadioMenuItemAccessibleGidBuilderImpl(T) : gid.gtk3.check_menu_item_accessible.CheckMenuItemAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.radio_menu_item_accessible.RadioMenuItemAccessible]
final class RadioMenuItemAccessibleGidBuilder : RadioMenuItemAccessibleGidBuilderImpl!RadioMenuItemAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RadioMenuItemAccessible build() nothrow
  {
    return new RadioMenuItemAccessible(cast(void*)createGObject(RadioMenuItemAccessible._getGType), Yes.Take);
  }
}
