/// Module for [ConicGradientNode] class
module gsk.conic_gradient_node;

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
    A render node for a conic gradient.
*/
class ConicGradientNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that draws a conic gradient.
      
      The conic gradient
      starts around center in the direction of rotation. A rotation of 0 means
      that the gradient points up. Color stops are then added clockwise.
  
      Params:
        bounds = the bounds of the node
        center = the center of the gradient
        rotation = the rotation of the gradient in degrees
        colorStops = a pointer to an array of
            [gsk.color_stop.ColorStop] defining the gradient. The offsets of all color stops
            must be increasing. The first stop's offset must be >= 0 and the last
            stop's offset must be <= 1.
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(graphene.rect.Rect bounds, graphene.point.Point center, float rotation, gsk.color_stop.ColorStop[] colorStops) nothrow
  {
    GskRenderNode* _cretval;
    size_t _nColorStops;
    if (colorStops)
      _nColorStops = cast(size_t)colorStops.length;

    GskColorStop[] _tmpcolorStops;
    foreach (obj; colorStops)
      _tmpcolorStops ~= obj._cInstance;
    const(GskColorStop)* _colorStops = _tmpcolorStops.ptr;

    _cretval = gsk_conic_gradient_node_new(bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, cast(const(graphene_point_t)*)&center, rotation, _colorStops, _nColorStops);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the angle for the gradient in radians, normalized in [0, 2 * PI].
      
      The angle is starting at the top and going clockwise, as expressed
      in the css specification:
      
          angle = 90 - [gsk.conic_gradient_node.ConicGradientNode.getRotation]
      Returns: the angle for the gradient
  */
  float getAngle() nothrow
  {
    float _retval;
    _retval = gsk_conic_gradient_node_get_angle(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the center pointer for the gradient.
      Returns: the center point for the gradient
  */
  graphene.point.Point getCenter() nothrow
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_conic_gradient_node_get_center(cast(const(GskRenderNode)*)this._cPtr);
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
    _cretval = gsk_conic_gradient_node_get_color_stops(cast(const(GskRenderNode)*)this._cPtr, &_cretlength);
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
      Retrieves the number of color stops in the gradient.
      Returns: the number of color stops
  */
  size_t getNColorStops() nothrow
  {
    size_t _retval;
    _retval = gsk_conic_gradient_node_get_n_color_stops(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the rotation for the gradient in degrees.
      Returns: the rotation for the gradient
  */
  float getRotation() nothrow
  {
    float _retval;
    _retval = gsk_conic_gradient_node_get_rotation(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
