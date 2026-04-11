/// Module for [RadioButtonAccessible] class
module gtk.radio_button_accessible;

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
class RadioButtonAccessible : gtk.toggle_button_accessible.ToggleButtonAccessible
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
    return cast(void function())gtk_radio_button_accessible_get_type != &gidSymbolNotFound ? gtk_radio_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RadioButtonAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.radio_button_accessible.RadioButtonAccessible]
      Returns: New builder object
  */
  static RadioButtonAccessibleGidBuilder builder()
  {
    return new RadioButtonAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.radio_button_accessible.RadioButtonAccessible]
class RadioButtonAccessibleGidBuilderImpl(T) : gtk.toggle_button_accessible.ToggleButtonAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.radio_button_accessible.RadioButtonAccessible]
final class RadioButtonAccessibleGidBuilder : RadioButtonAccessibleGidBuilderImpl!RadioButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RadioButtonAccessible build()
  {
    return new RadioButtonAccessible(cast(void*)createGObject(RadioButtonAccessible._getGType), No.Take);
  }
}
