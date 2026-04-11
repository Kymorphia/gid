/// Module for [ScaleButtonAccessible] class
module gtk.scale_button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import atk.value;
import atk.value_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.button_accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class ScaleButtonAccessible : gtk.button_accessible.ButtonAccessible, atk.value.Value
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
    return cast(void function())gtk_scale_button_accessible_get_type != &gidSymbolNotFound ? gtk_scale_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScaleButtonAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.scale_button_accessible.ScaleButtonAccessible]
      Returns: New builder object
  */
  static ScaleButtonAccessibleGidBuilder builder()
  {
    return new ScaleButtonAccessibleGidBuilder;
  }

  mixin ValueT!();
}

/// Fluent builder implementation template for [gtk.scale_button_accessible.ScaleButtonAccessible]
class ScaleButtonAccessibleGidBuilderImpl(T) : gtk.button_accessible.ButtonAccessibleGidBuilderImpl!T, atk.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gtk.scale_button_accessible.ScaleButtonAccessible]
final class ScaleButtonAccessibleGidBuilder : ScaleButtonAccessibleGidBuilderImpl!ScaleButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ScaleButtonAccessible build()
  {
    return new ScaleButtonAccessible(cast(void*)createGObject(ScaleButtonAccessible._getGType), No.Take);
  }
}
