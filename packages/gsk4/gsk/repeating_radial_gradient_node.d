/// Module for [RepeatingRadialGradientNode] class
module gsk.repeating_radial_gradient_node;

public import gid.basictypes;
import gid.gid;
import graphene.point;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.color_stop;
import gsk.render_node;
import gsk.types;

/**
    A render node for a repeating radial gradient.
*/
class RepeatingRadialGradientNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_repeating_radial_gradient_node_get_type != &gidSymbolNotFound ? gsk_repeating_radial_gradient_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gsk.render_node.RenderNode] that draws a repeating radial gradient.
      
      The radial gradient starts around center. The size of the gradient
      is dictated by hradius in horizontal orientation and by vradius
      in vertical orientation.
  
      Params:
        bounds = the bounds of the node
        center = the center of the gradient
        hradius = the horizontal radius
        vradius = the vertical radius
        start = a percentage >= 0 that defines the start of the gradient around center
        end = a percentage >= 0 that defines the end of the gradient around center
        colorStops = a pointer to an array of
            [gsk.color_stop.ColorStop] defining the gradient. The offsets of all color stops
            must be increasing. The first stop's offset must be >= 0 and the last
            stop's offset must be <= 1.
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(graphene.rect.Rect bounds, graphene.point.Point center, float hradius, float vradius, float start, float end, gsk.color_stop.ColorStop[] colorStops) nothrow
  {
    GskRenderNode* _cretval;
    size_t _nColorStops;
    if (colorStops)
      _nColorStops = cast(size_t)colorStops.length;

    auto _colorStops_arr = new GskColorStop[](colorStops.length);
    auto _colorStops = _colorStops_arr.ptr;
    foreach (i, obj; colorStops) _colorStops[i] = *cast(GskColorStop*)obj._cPtr;
    _cretval = gsk_repeating_radial_gradient_node_new(bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, cast(const(graphene_point_t)*)&center, hradius, vradius, start, end, _colorStops, _nColorStops);
    this(_cretval, Yes.Take);
  }
}
