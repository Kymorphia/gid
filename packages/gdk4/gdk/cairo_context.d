/// Module for [CairoContext] class
module gdk.cairo_context;

import cairo.context;
import gdk.c.functions;
import gdk.c.types;
import gdk.draw_context;
import gdk.types;
import gid.gid;

/**
    [gdk.cairo_context.CairoContext] is an object representing the platform-specific
    draw context.
    
    [gdk.cairo_context.CairoContext]s are created for a surface using
    [gdk.surface.Surface.createCairoContext], and the context
    can then be used to draw on that surface.
*/
class CairoContext : gdk.draw_context.DrawContext
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
    return cast(void function())gdk_cairo_context_get_type != &gidSymbolNotFound ? gdk_cairo_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CairoContext self()
  {
    return this;
  }

  /**
      Retrieves a Cairo context to be used to draw on the [gdk.surface.Surface]
      of context.
      
      A call to [gdk.draw_context.DrawContext.beginFrame] with this
      context must have been done or this function will return null.
      
      The returned context is guaranteed to be valid until
      [gdk.draw_context.DrawContext.endFrame] is called.
      Returns: a Cairo context
          to draw on `GdkSurface
  */
  cairo.context.Context cairoCreate()
  {
    cairo_t* _cretval;
    _cretval = gdk_cairo_context_cairo_create(cast(GdkCairoContext*)this._cPtr);
    auto _retval = _cretval ? new cairo.context.Context(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
