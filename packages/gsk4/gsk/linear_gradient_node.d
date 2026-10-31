/// Module for [LinearGradientNode] class
module gsk.linear_gradient_node;

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
    A render node for a linear gradient.
*/
class LinearGradientNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will create a linear gradient from the given
      points and color stops, and render that into the area given by bounds.
  
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

    _cretval = gsk_linear_gradient_node_new(bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, cast(const(graphene_point_t)*)&start, cast(const(graphene_point_t)*)&end, _colorStops, _nColorStops);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the color stops in the gradient.
      Returns: the color stops in the gradient
  */
  gsk.color_stop.ColorStop[] getColorStops() nothrow
  {
    const(GskColorStop)* _cretval;
    size_t _cretlength;
    _cretval = gsk_linear_gradient_node_get_color_stops(cast(const(GskRenderNode)*)this._cPtr, &_cretlength);
    gsk.color_stop.ColorStop[] _retval;

    if (_cretval)
    {
      _retval = new gsk.color_stop.ColorStop[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gsk.color_stop.ColorStop(cast(void*)&_cretval[i], No.Take);
    }
    return _retval;
  }

  /**
      Retrieves the final point of the linear gradient.
      Returns: the final point
  */
  graphene.point.Point getEnd() nothrow
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_linear_gradient_node_get_end(cast(const(GskRenderNode)*)this._cPtr);
    graphene.point.Point _retval;
    if (_cretval)
      _retval = *cast(graphene.point.Point*)_cretval;
    return _retval;
  }

  /**
      Retrieves the number of color stops in the gradient.
      Returns: the number of color stops
  */
  size_t getNColorStops() nothrow
  {
    size_t _retval;
    _retval = gsk_linear_gradient_node_get_n_color_stops(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the initial point of the linear gradient.
      Returns: the initial point
  */
  graphene.point.Point getStart() nothrow
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_linear_gradient_node_get_start(cast(const(GskRenderNode)*)this._cPtr);
    graphene.point.Point _retval;
    if (_cretval)
      _retval = *cast(graphene.point.Point*)_cretval;
    return _retval;
  }
}
