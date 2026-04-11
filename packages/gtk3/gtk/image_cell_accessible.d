/// Module for [ImageCellAccessible] class
module gtk.image_cell_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import atk.table_cell;
import atk.table_cell_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.renderer_cell_accessible;
import gtk.types;

/** */
class ImageCellAccessible : gtk.renderer_cell_accessible.RendererCellAccessible, atk.image.Image
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
    return cast(void function())gtk_image_cell_accessible_get_type != &gidSymbolNotFound ? gtk_image_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ImageCellAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.image_cell_accessible.ImageCellAccessible]
      Returns: New builder object
  */
  static ImageCellAccessibleGidBuilder builder()
  {
    return new ImageCellAccessibleGidBuilder;
  }

  mixin ImageT!();
}

/// Fluent builder implementation template for [gtk.image_cell_accessible.ImageCellAccessible]
class ImageCellAccessibleGidBuilderImpl(T) : gtk.renderer_cell_accessible.RendererCellAccessibleGidBuilderImpl!T, atk.image.ImageGidBuilderImpl!T
{

  mixin ImageGidBuilderT!();
}

/// Fluent builder for [gtk.image_cell_accessible.ImageCellAccessible]
final class ImageCellAccessibleGidBuilder : ImageCellAccessibleGidBuilderImpl!ImageCellAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ImageCellAccessible build()
  {
    return new ImageCellAccessible(cast(void*)createGObject(ImageCellAccessible._getGType), No.Take);
  }
}
