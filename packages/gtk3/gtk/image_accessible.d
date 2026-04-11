/// Module for [ImageAccessible] class
module gtk.image_accessible;

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
class ImageAccessible : gtk.widget_accessible.WidgetAccessible, atk.image.Image
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
    return cast(void function())gtk_image_accessible_get_type != &gidSymbolNotFound ? gtk_image_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ImageAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.image_accessible.ImageAccessible]
      Returns: New builder object
  */
  static ImageAccessibleGidBuilder builder()
  {
    return new ImageAccessibleGidBuilder;
  }

  mixin ImageT!();
}

/// Fluent builder implementation template for [gtk.image_accessible.ImageAccessible]
class ImageAccessibleGidBuilderImpl(T) : gtk.widget_accessible.WidgetAccessibleGidBuilderImpl!T, atk.image.ImageGidBuilderImpl!T
{

  mixin ImageGidBuilderT!();
}

/// Fluent builder for [gtk.image_accessible.ImageAccessible]
final class ImageAccessibleGidBuilder : ImageAccessibleGidBuilderImpl!ImageAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ImageAccessible build()
  {
    return new ImageAccessible(cast(void*)createGObject(ImageAccessible._getGType), No.Take);
  }
}
