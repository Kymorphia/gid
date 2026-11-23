/// Module for [ImageCellAccessible] class
module gid.gtk3.image_cell_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.image;
import gid.atk1.image_mixin;
import gid.atk1.table_cell;
import gid.atk1.table_cell_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.renderer_cell_accessible;
import gid.gtk3.types;

/** */
class ImageCellAccessible : gid.gtk3.renderer_cell_accessible.RendererCellAccessible, gid.atk1.image.Image
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_image_cell_accessible_get_type != &gidSymbolNotFound ? gtk_image_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkImageCellAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ImageCellAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.image_cell_accessible.ImageCellAccessible]
      Returns: New builder object
  */
  static ImageCellAccessibleGidBuilder builder() nothrow
  {
    return new ImageCellAccessibleGidBuilder;
  }

  mixin ImageT!();
}

/// Fluent builder implementation template for [gid.gtk3.image_cell_accessible.ImageCellAccessible]
class ImageCellAccessibleGidBuilderImpl(T) : gid.gtk3.renderer_cell_accessible.RendererCellAccessibleGidBuilderImpl!T, gid.atk1.image.ImageGidBuilderImpl!T
{

  mixin ImageGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.image_cell_accessible.ImageCellAccessible]
final class ImageCellAccessibleGidBuilder : ImageCellAccessibleGidBuilderImpl!ImageCellAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ImageCellAccessible build() nothrow
  {
    return new ImageCellAccessible(cast(void*)createGObject(ImageCellAccessible._getGType), Yes.Take);
  }
}
