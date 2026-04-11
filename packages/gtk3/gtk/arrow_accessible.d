/// Module for [ArrowAccessible] class
module gtk.arrow_accessible;

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
class ArrowAccessible : gtk.widget_accessible.WidgetAccessible, atk.image.Image
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
    return cast(void function())gtk_arrow_accessible_get_type != &gidSymbolNotFound ? gtk_arrow_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ArrowAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.arrow_accessible.ArrowAccessible]
      Returns: New builder object
  */
  static ArrowAccessibleGidBuilder builder()
  {
    return new ArrowAccessibleGidBuilder;
  }

  mixin ImageT!();
}

/// Fluent builder implementation template for [gtk.arrow_accessible.ArrowAccessible]
class ArrowAccessibleGidBuilderImpl(T) : gtk.widget_accessible.WidgetAccessibleGidBuilderImpl!T, atk.image.ImageGidBuilderImpl!T
{

  mixin ImageGidBuilderT!();
}

/// Fluent builder for [gtk.arrow_accessible.ArrowAccessible]
final class ArrowAccessibleGidBuilder : ArrowAccessibleGidBuilderImpl!ArrowAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ArrowAccessible build()
  {
    return new ArrowAccessible(cast(void*)createGObject(ArrowAccessible._getGType), No.Take);
  }
}
