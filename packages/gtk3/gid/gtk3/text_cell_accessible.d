/// Module for [TextCellAccessible] class
module gid.gtk3.text_cell_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.table_cell;
import gid.atk1.table_cell_mixin;
import gid.atk1.text;
import gid.atk1.text_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.renderer_cell_accessible;
import gid.gtk3.types;

/** */
class TextCellAccessible : gid.gtk3.renderer_cell_accessible.RendererCellAccessible, gid.atk1.text.Text
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
    return cast(void function())gtk_text_cell_accessible_get_type != &gidSymbolNotFound ? gtk_text_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTextCellAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override TextCellAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.text_cell_accessible.TextCellAccessible]
      Returns: New builder object
  */
  static TextCellAccessibleGidBuilder builder() nothrow
  {
    return new TextCellAccessibleGidBuilder;
  }

  mixin TextT!();
}

/// Fluent builder implementation template for [gid.gtk3.text_cell_accessible.TextCellAccessible]
class TextCellAccessibleGidBuilderImpl(T) : gid.gtk3.renderer_cell_accessible.RendererCellAccessibleGidBuilderImpl!T, gid.atk1.text.TextGidBuilderImpl!T
{

  mixin TextGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.text_cell_accessible.TextCellAccessible]
final class TextCellAccessibleGidBuilder : TextCellAccessibleGidBuilderImpl!TextCellAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TextCellAccessible build() nothrow
  {
    return new TextCellAccessible(cast(void*)createGObject(TextCellAccessible._getGType), Yes.Take);
  }
}
