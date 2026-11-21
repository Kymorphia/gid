/// Module for [NglRenderer] class
module gid.gsk4.ngl_renderer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.renderer;
import gid.gsk4.types;

/**
    A GL based renderer.
    
    See [gid.gsk4.renderer.Renderer].
*/
class NglRenderer : gid.gsk4.renderer.Renderer
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
    return cast(void function())gsk_ngl_renderer_get_type != &gidSymbolNotFound ? gsk_ngl_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GskNglRenderer";
  }

  /** Returns `this`, for use in `with` statements. */
  override NglRenderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gsk4.ngl_renderer.NglRenderer]
      Returns: New builder object
  */
  static NglRendererGidBuilder builder() nothrow
  {
    return new NglRendererGidBuilder;
  }

  /**
      Same as [gid.gsk4.glrenderer.GLRenderer.new_].
      Returns: a GL renderer
  
      Deprecated: Use [gid.gsk4.glrenderer.GLRenderer.new_]
  */
  this() nothrow
  {
    GskRenderer* _cretval;
    _cretval = gsk_ngl_renderer_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gsk4.ngl_renderer.NglRenderer]
class NglRendererGidBuilderImpl(T) : gid.gsk4.renderer.RendererGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gsk4.ngl_renderer.NglRenderer]
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
