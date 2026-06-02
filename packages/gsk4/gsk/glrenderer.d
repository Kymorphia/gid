/// Module for [GLRenderer] class
module gsk.glrenderer;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gsk.c.functions;
import gsk.c.types;
import gsk.renderer;
import gsk.types;

/** */
class GLRenderer : gsk.renderer.Renderer
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
    return cast(void function())gsk_gl_renderer_get_type != &gidSymbolNotFound ? gsk_gl_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLRenderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gsk.glrenderer.GLRenderer]
      Returns: New builder object
  */
  static GLRendererGidBuilder builder() nothrow
  {
    return new GLRendererGidBuilder;
  }

  /**
      Creates a new [gsk.renderer.Renderer] using the new OpenGL renderer.
      Returns: a new GL renderer
  */
  this() nothrow
  {
    GskRenderer* _cretval;
    _cretval = gsk_gl_renderer_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gsk.glrenderer.GLRenderer]
class GLRendererGidBuilderImpl(T) : gsk.renderer.RendererGidBuilderImpl!T
{
}

/// Fluent builder for [gsk.glrenderer.GLRenderer]
final class GLRendererGidBuilder : GLRendererGidBuilderImpl!GLRendererGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLRenderer build() nothrow
  {
    return new GLRenderer(cast(void*)createGObject(GLRenderer._getGType), Yes.Take);
  }
}
