/// Module for [RadialGradientNode] class
module gsk.radial_gradient_node;

import gid.gid;
import graphene.point;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node for a radial gradient.
*/
class RadialGradientNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.radial_gradient_node.RadialGradientNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Retrieves the center pointer for the gradient.
      Returns: the center point for the gradient
  */
  graphene.point.Point getCenter()
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_radial_gradient_node_get_center(cast(const(GskRenderNode)*)this._cPtr);
    graphene.point.Point _retval;
    if (_cretval)
      _retval = *cast(graphene.point.Point*)_cretval;
    return _retval;
  }

  /**
      Retrieves the end value for the gradient.
      Returns: the end value for the gradient
  */
  float getEnd()
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_end(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the horizontal radius for the gradient.
      Returns: the horizontal radius for the gradient
  */
  float getHradius()
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_hradius(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the number of color stops in the gradient.
      Returns: the number of color stops
  */
  size_t getNColorStops()
  {
    size_t _retval;
    _retval = gsk_radial_gradient_node_get_n_color_stops(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the start value for the gradient.
      Returns: the start value for the gradient
  */
  float getStart()
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_start(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the vertical radius for the gradient.
      Returns: the vertical radius for the gradient
  */
  float getVradius()
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_vradius(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
