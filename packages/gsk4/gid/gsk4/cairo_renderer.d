/// Module for [CairoRenderer] class
module gid.gsk4.cairo_renderer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.renderer;
import gid.gsk4.types;

/**
    Renders a GSK rendernode tree with cairo.
    
    Since it is using cairo, this renderer cannot support
    3D transformations.
*/
class CairoRenderer : gid.gsk4.renderer.Renderer
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
    return cast(void function())gsk_cairo_renderer_get_type != &gidSymbolNotFound ? gsk_cairo_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GskCairoRenderer";
  }

  /** Returns `this`, for use in `with` statements. */
  override CairoRenderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gsk4.cairo_renderer.CairoRenderer]
      Returns: New builder object
  */
  static CairoRendererGidBuilder builder() nothrow
  {
    return new CairoRendererGidBuilder;
  }

  /**
      Creates a new Cairo renderer.
      
      The Cairo renderer is the fallback renderer drawing in ways similar
      to how GTK 3 drew its content. Its primary use is as comparison tool.
      
      The Cairo renderer is incomplete. It cannot render 3D transformed
      content and will instead render an error marker. Its usage should be
      avoided.
      Returns: a new Cairo renderer.
  */
  this() nothrow
  {
    GskRenderer* _cretval;
    _cretval = gsk_cairo_renderer_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gsk4.cairo_renderer.CairoRenderer]
class CairoRendererGidBuilderImpl(T) : gid.gsk4.renderer.RendererGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gsk4.cairo_renderer.CairoRenderer]
final class CairoRendererGidBuilder : CairoRendererGidBuilderImpl!CairoRendererGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CairoRenderer build() nothrow
  {
    return new CairoRenderer(cast(void*)createGObject(CairoRenderer._getGType), Yes.Take);
  }
}
