/// Module for [RadioButtonAccessible] class
module gid.gtk3.radio_button_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.image;
import gid.atk1.image_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.toggle_button_accessible;
import gid.gtk3.types;

/** */
class RadioButtonAccessible : gid.gtk3.toggle_button_accessible.ToggleButtonAccessible
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
    return cast(void function())gtk_radio_button_accessible_get_type != &gidSymbolNotFound ? gtk_radio_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRadioButtonAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override RadioButtonAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.radio_button_accessible.RadioButtonAccessible]
      Returns: New builder object
  */
  static RadioButtonAccessibleGidBuilder builder() nothrow
  {
    return new RadioButtonAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.radio_button_accessible.RadioButtonAccessible]
class RadioButtonAccessibleGidBuilderImpl(T) : gid.gtk3.toggle_button_accessible.ToggleButtonAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.radio_button_accessible.RadioButtonAccessible]
final class RadioButtonAccessibleGidBuilder : RadioButtonAccessibleGidBuilderImpl!RadioButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RadioButtonAccessible build() nothrow
  {
    return new RadioButtonAccessible(cast(void*)createGObject(RadioButtonAccessible._getGType), Yes.Take);
  }
}
