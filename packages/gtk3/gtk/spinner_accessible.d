/// Module for [SpinnerAccessible] class
module gtk.spinner_accessible;

public import gid.basictypes;
import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_accessible;

/** */
class SpinnerAccessible : gtk.widget_accessible.WidgetAccessible, atk.image.Image
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
    return cast(void function())gtk_spinner_accessible_get_type != &gidSymbolNotFound ? gtk_spinner_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SpinnerAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.spinner_accessible.SpinnerAccessible]
      Returns: New builder object
  */
  static SpinnerAccessibleGidBuilder builder() nothrow
  {
    return new SpinnerAccessibleGidBuilder;
  }

  mixin ImageT!();
}

/// Fluent builder implementation template for [gtk.spinner_accessible.SpinnerAccessible]
class SpinnerAccessibleGidBuilderImpl(T) : gtk.widget_accessible.WidgetAccessibleGidBuilderImpl!T, atk.image.ImageGidBuilderImpl!T
{

  mixin ImageGidBuilderT!();
}

/// Fluent builder for [gtk.spinner_accessible.SpinnerAccessible]
final class SpinnerAccessibleGidBuilder : SpinnerAccessibleGidBuilderImpl!SpinnerAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SpinnerAccessible build() nothrow
  {
    return new SpinnerAccessible(cast(void*)createGObject(SpinnerAccessible._getGType), No.Take);
  }
}
