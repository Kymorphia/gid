/// Module for [GLRenderer] class
module gid.gsk4.glrenderer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.renderer;
import gid.gsk4.types;

/**
    Renders a GSK rendernode tree with OpenGL.
    
    See [gid.gsk4.renderer.Renderer].
*/
class GLRenderer : gid.gsk4.renderer.Renderer
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
    return cast(void function())gsk_gl_renderer_get_type != &gidSymbolNotFound ? gsk_gl_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GskGLRenderer";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLRenderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gsk4.glrenderer.GLRenderer]
      Returns: New builder object
  */
  static GLRendererGidBuilder builder() nothrow
  {
    return new GLRendererGidBuilder;
  }

  /**
      Creates an instance of the GL renderer.
      Returns: a GL renderer
  */
  this() nothrow
  {
    GskRenderer* _cretval;
    _cretval = gsk_gl_renderer_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gsk4.glrenderer.GLRenderer]
class GLRendererGidBuilderImpl(T) : gid.gsk4.renderer.RendererGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gsk4.glrenderer.GLRenderer]
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
