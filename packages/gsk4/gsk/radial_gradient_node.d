/// Module for [RadialGradientNode] class
module gsk.radial_gradient_node;

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
    A render node for a radial gradient.
*/
class RadialGradientNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that draws a radial gradient.
      
      The radial gradient
      starts around center. The size of the gradient is dictated by hradius
      in horizontal orientation and by vradius in vertical orientation.
  
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

    GskColorStop[] _tmpcolorStops;
    foreach (obj; colorStops)
      _tmpcolorStops ~= obj._cInstance;
    const(GskColorStop)* _colorStops = _tmpcolorStops.ptr;

    _cretval = gsk_radial_gradient_node_new(bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, cast(const(graphene_point_t)*)&center, hradius, vradius, start, end, _colorStops, _nColorStops);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the center pointer for the gradient.
      Returns: the center point for the gradient
  */
  graphene.point.Point getCenter() nothrow
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_radial_gradient_node_get_center(cast(const(GskRenderNode)*)this._cPtr);
    graphene.point.Point _retval;
    if (_cretval)
      _retval = *cast(graphene.point.Point*)_cretval;
    return _retval;
  }

  /**
      Retrieves the color stops in the gradient.
      Returns: the color stops in the gradient
  */
  gsk.color_stop.ColorStop[] getColorStops() nothrow
  {
    const(GskColorStop)* _cretval;
    size_t _cretlength;
    _cretval = gsk_radial_gradient_node_get_color_stops(cast(const(GskRenderNode)*)this._cPtr, &_cretlength);
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
      Retrieves the end value for the gradient.
      Returns: the end value for the gradient
  */
  float getEnd() nothrow
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_end(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the horizontal radius for the gradient.
      Returns: the horizontal radius for the gradient
  */
  float getHradius() nothrow
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_hradius(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the number of color stops in the gradient.
      Returns: the number of color stops
  */
  size_t getNColorStops() nothrow
  {
    size_t _retval;
    _retval = gsk_radial_gradient_node_get_n_color_stops(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the start value for the gradient.
      Returns: the start value for the gradient
  */
  float getStart() nothrow
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_start(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the vertical radius for the gradient.
      Returns: the vertical radius for the gradient
  */
  float getVradius() nothrow
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_vradius(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
