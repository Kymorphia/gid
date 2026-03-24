/// Module for [SpinnerAccessible] class
module gtk.spinner_accessible;

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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_spinner_accessible_get_type != &gidSymbolNotFound ? gtk_spinner_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SpinnerAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.spinner_accessible.SpinnerAccessible]
  Returns: New builder object
  */
  static SpinnerAccessibleGidBuilder builder()
  {
    return new SpinnerAccessibleGidBuilder;
  }

  mixin ImageT!();
}

class SpinnerAccessibleGidBuilderImpl(T) : gtk.widget_accessible.WidgetAccessibleGidBuilderImpl!T, atk.image.ImageGidBuilderImpl!T
{

  mixin ImageGidBuilderT!();
}

/// Fluent builder for [gtk.spinner_accessible.SpinnerAccessible]
final class SpinnerAccessibleGidBuilder : SpinnerAccessibleGidBuilderImpl!SpinnerAccessibleGidBuilder
{
  SpinnerAccessible build()
  {
    return new SpinnerAccessible(cast(void*)createGObject(SpinnerAccessible._getGType), No.Take);
  }
}
