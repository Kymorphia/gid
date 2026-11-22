/// Module for [RendererCellAccessible] class
module gid.gtk3.renderer_cell_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.table_cell;
import gid.atk1.table_cell_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_accessible;
import gid.gtk3.cell_renderer;
import gid.gtk3.types;

/** */
class RendererCellAccessible : gid.gtk3.cell_accessible.CellAccessible
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
    return cast(void function())gtk_renderer_cell_accessible_get_type != &gidSymbolNotFound ? gtk_renderer_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRendererCellAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override RendererCellAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.renderer_cell_accessible.RendererCellAccessible]
      Returns: New builder object
  */
  static RendererCellAccessibleGidBuilder builder() nothrow
  {
    return new RendererCellAccessibleGidBuilder;
  }

  /** */
  @property gid.gtk3.cell_renderer.CellRenderer renderer() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.cell_renderer.CellRenderer)("renderer");
  }

  /** */
  this(gid.gtk3.cell_renderer.CellRenderer renderer) nothrow
  {
    AtkObject* _cretval;
    _cretval = gtk_renderer_cell_accessible_new(renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gtk3.renderer_cell_accessible.RendererCellAccessible]
class RendererCellAccessibleGidBuilderImpl(T) : gid.gtk3.cell_accessible.CellAccessibleGidBuilderImpl!T
{


  /** */
  T renderer(gid.gtk3.cell_renderer.CellRenderer propval) nothrow
  {
    return setProperty("renderer", propval);
  }
}

/// Fluent builder for [gid.gtk3.renderer_cell_accessible.RendererCellAccessible]
final class RendererCellAccessibleGidBuilder : RendererCellAccessibleGidBuilderImpl!RendererCellAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RendererCellAccessible build() nothrow
  {
    return new RendererCellAccessible(cast(void*)createGObject(RendererCellAccessible._getGType), Yes.Take);
  }
}
