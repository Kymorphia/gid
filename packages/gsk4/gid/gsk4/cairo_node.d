/// Module for [CairoNode] class
module gid.gsk4.cairo_node;

public import gid.core.basictypes;
import gid.cairo1.context;
import gid.cairo1.surface;
import gid.core.gid;
import gid.graphene1.rect;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node for a Cairo surface.
*/
class CairoNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_cairo_node_get_type != &gidSymbolNotFound ? gsk_cairo_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will render a cairo surface
      into the area given by bounds.
      
      You can draw to the cairo surface using [gid.gsk4.cairo_node.CairoNode.getDrawContext].
  
      Params:
        bounds = the rectangle to render to
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.graphene1.rect.Rect bounds) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_cairo_node_new(bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a Cairo context for drawing using the surface associated
      to the render node.
      
      If no surface exists yet, a surface will be created optimized for
      rendering to renderer.
      Returns: a Cairo context used for drawing; use
          [gid.cairo1.global.destroy] when done drawing
  */
  gid.cairo1.context.Context getDrawContext() nothrow
  {
    cairo_t* _cretval;
    _cretval = gsk_cairo_node_get_draw_context(cast(GskRenderNode*)this._cPtr);
    auto _retval = _cretval ? new gid.cairo1.context.Context(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the Cairo surface used by the render node.
      Returns: a Cairo surface
  */
  gid.cairo1.surface.Surface getSurface() nothrow
  {
    cairo_surface_t* _cretval;
    _cretval = gsk_cairo_node_get_surface(cast(GskRenderNode*)this._cPtr);
    auto _retval = _cretval ? new gid.cairo1.surface.Surface(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
