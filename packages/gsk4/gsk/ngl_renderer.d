/// Module for [NglRenderer] class
module gsk.ngl_renderer;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gsk.c.functions;
import gsk.c.types;
import gsk.renderer;
import gsk.types;

/** */
class NglRenderer : gsk.renderer.Renderer
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
    return cast(void function())gsk_ngl_renderer_get_type != &gidSymbolNotFound ? gsk_ngl_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NglRenderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gsk.ngl_renderer.NglRenderer]
      Returns: New builder object
  */
  static NglRendererGidBuilder builder() nothrow
  {
    return new NglRendererGidBuilder;
  }

  /** */
  this() nothrow
  {
    GskRenderer* _cretval;
    _cretval = gsk_ngl_renderer_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gsk.ngl_renderer.NglRenderer]
class NglRendererGidBuilderImpl(T) : gsk.renderer.RendererGidBuilderImpl!T
{
}

/// Fluent builder for [gsk.ngl_renderer.NglRenderer]
final class NglRendererGidBuilder : NglRendererGidBuilderImpl!NglRendererGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NglRenderer build() nothrow
  {
    return new NglRenderer(cast(void*)createGObject(NglRenderer._getGType), Yes.Take);
  }
}
