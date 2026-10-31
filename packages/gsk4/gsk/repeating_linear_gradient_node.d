/// Module for [RepeatingLinearGradientNode] class
module gsk.repeating_linear_gradient_node;

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
    A render node for a repeating linear gradient.
*/
class RepeatingLinearGradientNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will create a repeating linear gradient
      from the given points and color stops, and render that into the area
      given by bounds.
  
      Params:
        bounds = the rectangle to render the linear gradient into
        start = the point at which the linear gradient will begin
        end = the point at which the linear gradient will finish
        colorStops = a pointer to an array of
          [gsk.color_stop.ColorStop] defining the gradient. The offsets of all color stops
            must be increasing. The first stop's offset must be >= 0 and the last
            stop's offset must be <= 1.
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(graphene.rect.Rect bounds, graphene.point.Point start, graphene.point.Point end, gsk.color_stop.ColorStop[] colorStops) nothrow
  {
    GskRenderNode* _cretval;
    size_t _nColorStops;
    if (colorStops)
      _nColorStops = cast(size_t)colorStops.length;

    GskColorStop[] _tmpcolorStops;
    foreach (obj; colorStops)
      _tmpcolorStops ~= obj._cInstance;
    const(GskColorStop)* _colorStops = _tmpcolorStops.ptr;

    _cretval = gsk_repeating_linear_gradient_node_new(bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, cast(const(graphene_point_t)*)&start, cast(const(graphene_point_t)*)&end, _colorStops, _nColorStops);
    this(_cretval, Yes.Take);
  }
}
