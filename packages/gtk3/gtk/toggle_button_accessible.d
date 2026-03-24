/// Module for [ToggleButtonAccessible] class
module gtk.toggle_button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.button_accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class ToggleButtonAccessible : gtk.button_accessible.ButtonAccessible
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
    return cast(void function())gtk_toggle_button_accessible_get_type != &gidSymbolNotFound ? gtk_toggle_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToggleButtonAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.toggle_button_accessible.ToggleButtonAccessible]
  Returns: New builder object
  */
  static ToggleButtonAccessibleGidBuilder builder()
  {
    return new ToggleButtonAccessibleGidBuilder;
  }
}

class ToggleButtonAccessibleGidBuilderImpl(T) : gtk.button_accessible.ButtonAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.toggle_button_accessible.ToggleButtonAccessible]
final class ToggleButtonAccessibleGidBuilder : ToggleButtonAccessibleGidBuilderImpl!ToggleButtonAccessibleGidBuilder
{
  ToggleButtonAccessible build()
  {
    return new ToggleButtonAccessible(cast(void*)createGObject(ToggleButtonAccessible._getGType), No.Take);
  }
}
