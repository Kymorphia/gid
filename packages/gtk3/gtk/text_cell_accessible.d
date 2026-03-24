/// Module for [TextCellAccessible] class
module gtk.text_cell_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.table_cell;
import atk.table_cell_mixin;
import atk.text;
import atk.text_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.renderer_cell_accessible;
import gtk.types;

/** */
class TextCellAccessible : gtk.renderer_cell_accessible.RendererCellAccessible, atk.text.Text
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
    return cast(void function())gtk_text_cell_accessible_get_type != &gidSymbolNotFound ? gtk_text_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextCellAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.text_cell_accessible.TextCellAccessible]
  Returns: New builder object
  */
  static TextCellAccessibleGidBuilder builder()
  {
    return new TextCellAccessibleGidBuilder;
  }

  mixin TextT!();
}

class TextCellAccessibleGidBuilderImpl(T) : gtk.renderer_cell_accessible.RendererCellAccessibleGidBuilderImpl!T, atk.text.TextGidBuilderImpl!T
{

  mixin TextGidBuilderT!();
}

/// Fluent builder for [gtk.text_cell_accessible.TextCellAccessible]
final class TextCellAccessibleGidBuilder : TextCellAccessibleGidBuilderImpl!TextCellAccessibleGidBuilder
{
  TextCellAccessible build()
  {
    return new TextCellAccessible(cast(void*)createGObject(TextCellAccessible._getGType), No.Take);
  }
}
