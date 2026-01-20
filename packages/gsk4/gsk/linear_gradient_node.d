/// Module for [LinearGradientNode] class
module gsk.linear_gradient_node;

import gid.gid;
import graphene.point;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node for a linear gradient.
*/
class LinearGradientNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.linear_gradient_node.LinearGradientNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Retrieves the final point of the linear gradient.
      Returns: the final point
  */
  graphene.point.Point getEnd()
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
  size_t getNColorStops()
  {
    size_t _retval;
    _retval = gsk_linear_gradient_node_get_n_color_stops(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the initial point of the linear gradient.
      Returns: the initial point
  */
  graphene.point.Point getStart()
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_linear_gradient_node_get_start(cast(const(GskRenderNode)*)this._cPtr);
    graphene.point.Point _retval;
    if (_cretval)
      _retval = *cast(graphene.point.Point*)_cretval;
    return _retval;
  }
}
