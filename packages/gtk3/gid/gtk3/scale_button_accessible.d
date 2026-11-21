/// Module for [ScaleButtonAccessible] class
module gid.gtk3.scale_button_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.image;
import gid.atk1.image_mixin;
import gid.atk1.value;
import gid.atk1.value_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.button_accessible;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/** */
class ScaleButtonAccessible : gid.gtk3.button_accessible.ButtonAccessible, gid.atk1.value.Value
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
    return cast(void function())gtk_scale_button_accessible_get_type != &gidSymbolNotFound ? gtk_scale_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkScaleButtonAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ScaleButtonAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.scale_button_accessible.ScaleButtonAccessible]
      Returns: New builder object
  */
  static ScaleButtonAccessibleGidBuilder builder() nothrow
  {
    return new ScaleButtonAccessibleGidBuilder;
  }

  mixin ValueT!();
}

/// Fluent builder implementation template for [gid.gtk3.scale_button_accessible.ScaleButtonAccessible]
class ScaleButtonAccessibleGidBuilderImpl(T) : gid.gtk3.button_accessible.ButtonAccessibleGidBuilderImpl!T, gid.atk1.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.scale_button_accessible.ScaleButtonAccessible]
final class ScaleButtonAccessibleGidBuilder : ScaleButtonAccessibleGidBuilderImpl!ScaleButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ScaleButtonAccessible build() nothrow
  {
    return new ScaleButtonAccessible(cast(void*)createGObject(ScaleButtonAccessible._getGType), Yes.Take);
  }
}
