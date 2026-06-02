/// Module for [RendererCellAccessible] class
module gtk.renderer_cell_accessible;

public import gid.basictypes;
import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.table_cell;
import atk.table_cell_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_accessible;
import gtk.cell_renderer;
import gtk.types;

/** */
class RendererCellAccessible : gtk.cell_accessible.CellAccessible
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
    return cast(void function())gtk_renderer_cell_accessible_get_type != &gidSymbolNotFound ? gtk_renderer_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RendererCellAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.renderer_cell_accessible.RendererCellAccessible]
      Returns: New builder object
  */
  static RendererCellAccessibleGidBuilder builder() nothrow
  {
    return new RendererCellAccessibleGidBuilder;
  }

  /** */
  @property gtk.cell_renderer.CellRenderer renderer() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.cell_renderer.CellRenderer)("renderer");
  }

  /** */
  this(gtk.cell_renderer.CellRenderer renderer) nothrow
  {
    AtkObject* _cretval;
    _cretval = gtk_renderer_cell_accessible_new(renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gtk.renderer_cell_accessible.RendererCellAccessible]
class RendererCellAccessibleGidBuilderImpl(T) : gtk.cell_accessible.CellAccessibleGidBuilderImpl!T
{


  /** */
  T renderer(gtk.cell_renderer.CellRenderer propval) nothrow
  {
    return setProperty("renderer", propval);
  }
}

/// Fluent builder for [gtk.renderer_cell_accessible.RendererCellAccessible]
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
