module Gsk.GLRenderer;

import Gid.gid;
import Gsk.Renderer;
import Gsk.Types;
import Gsk.c.functions;
import Gsk.c.types;

class GLRenderer : Renderer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gsk_gl_renderer_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GskRenderer` using the new OpenGL renderer.
   * Returns: a new GL renderer
   */
  this()
  {
    GskRenderer* _cretval;
    _cretval = gsk_gl_renderer_new();
    this(_cretval, Yes.Take);
  }
}
