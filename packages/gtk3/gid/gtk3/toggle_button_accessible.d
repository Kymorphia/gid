/// Module for [ToggleButtonAccessible] class
module gid.gtk3.toggle_button_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.image;
import gid.atk1.image_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.button_accessible;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/** */
class ToggleButtonAccessible : gid.gtk3.button_accessible.ButtonAccessible
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
    return cast(void function())gtk_toggle_button_accessible_get_type != &gidSymbolNotFound ? gtk_toggle_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkToggleButtonAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ToggleButtonAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.toggle_button_accessible.ToggleButtonAccessible]
      Returns: New builder object
  */
  static ToggleButtonAccessibleGidBuilder builder() nothrow
  {
    return new ToggleButtonAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.toggle_button_accessible.ToggleButtonAccessible]
class ToggleButtonAccessibleGidBuilderImpl(T) : gid.gtk3.button_accessible.ButtonAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.toggle_button_accessible.ToggleButtonAccessible]
final class ToggleButtonAccessibleGidBuilder : ToggleButtonAccessibleGidBuilderImpl!ToggleButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToggleButtonAccessible build() nothrow
  {
    return new ToggleButtonAccessible(cast(void*)createGObject(ToggleButtonAccessible._getGType), Yes.Take);
  }
}
