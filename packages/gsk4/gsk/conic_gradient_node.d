/// Module for [ConicGradientNode] class
module gsk.conic_gradient_node;

import gid.gid;
import graphene.point;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node for a conic gradient.
*/
class ConicGradientNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.conic_gradient_node.ConicGradientNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Retrieves the angle for the gradient in radians, normalized in [0, 2 * PI].
      
      The angle is starting at the top and going clockwise, as expressed
      in the css specification:
      
          angle = 90 - [gsk.conic_gradient_node.ConicGradientNode.getRotation]
      Returns: the angle for the gradient
  */
  float getAngle()
  {
    float _retval;
    _retval = gsk_conic_gradient_node_get_angle(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the center pointer for the gradient.
      Returns: the center point for the gradient
  */
  graphene.point.Point getCenter()
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_conic_gradient_node_get_center(cast(const(GskRenderNode)*)this._cPtr);
    graphene.point.Point _retval;
    if (_cretval)
      _retval = *cast(graphene.point.Point*)_cretval;
    return _retval;
  }

  /**
      Retrieves the number of color stops in the gradient.
      Returns: the number of color stops
  */
  size_t getNColorStops()
  {
    size_t _retval;
    _retval = gsk_conic_gradient_node_get_n_color_stops(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the rotation for the gradient in degrees.
      Returns: the rotation for the gradient
  */
  float getRotation()
  {
    float _retval;
    _retval = gsk_conic_gradient_node_get_rotation(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
