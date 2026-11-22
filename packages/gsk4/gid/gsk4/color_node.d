/// Module for [ColorNode] class
module gid.gsk4.color_node;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.rgba;
import gid.graphene1.rect;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node for a solid color.
*/
class ColorNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_color_node_get_type != &gidSymbolNotFound ? gsk_color_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will render the color specified by rgba into
      the area given by bounds.
  
      Params:
        rgba = a [gid.gdk4.rgba.RGBA] specifying a color
        bounds = the rectangle to render the color into
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gdk4.rgba.RGBA rgba, gid.graphene1.rect.Rect bounds) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_color_node_new(cast(const(GdkRGBA)*)&rgba, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the color of the given node.
      
      The value returned by this function will not be correct
      if the render node was created for a non-sRGB color.
      Returns: the color of the node
  */
  gid.gdk4.rgba.RGBA getColor() nothrow
  {
    const(GdkRGBA)* _cretval;
    _cretval = gsk_color_node_get_color(cast(const(GskRenderNode)*)this._cPtr);
    gid.gdk4.rgba.RGBA _retval;
    if (_cretval)
      _retval = *cast(gid.gdk4.rgba.RGBA*)_cretval;
    return _retval;
  }
}
