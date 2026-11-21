/// Module for [LinearGradientNode] class
module gid.gsk4.linear_gradient_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.graphene1.point;
import gid.graphene1.rect;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.color_stop;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node for a linear gradient.
*/
class LinearGradientNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_linear_gradient_node_get_type != &gidSymbolNotFound ? gsk_linear_gradient_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will create a linear gradient from the given
      points and color stops, and render that into the area given by bounds.
  
      Params:
        bounds = the rectangle to render the linear gradient into
        start = the point at which the linear gradient will begin
        end = the point at which the linear gradient will finish
        colorStops = a pointer to an array of
            [gid.gsk4.color_stop.ColorStop] defining the gradient. The offsets of all color stops
            must be increasing. The first stop's offset must be >= 0 and the last
            stop's offset must be <= 1.
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.graphene1.rect.Rect bounds, gid.graphene1.point.Point start, gid.graphene1.point.Point end, gid.gsk4.color_stop.ColorStop[] colorStops) nothrow
  {
    GskRenderNode* _cretval;
    size_t _nColorStops;
    if (colorStops)
      _nColorStops = cast(size_t)colorStops.length;

    auto _colorStops_arr = new GskColorStop[](colorStops.length);
    auto _colorStops = _colorStops_arr.ptr;
    foreach (i, obj; colorStops) _colorStops[i] = *cast(GskColorStop*)obj._cPtr;
    _cretval = gsk_linear_gradient_node_new(bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, cast(const(graphene_point_t)*)&start, cast(const(graphene_point_t)*)&end, _colorStops, _nColorStops);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the color stops in the gradient.
      Returns: the color stops in the gradient
  */
  gid.gsk4.color_stop.ColorStop[] getColorStops() nothrow
  {
    const(GskColorStop)* _cretval;
    size_t _cretlength;
    _cretval = gsk_linear_gradient_node_get_color_stops(cast(const(GskRenderNode)*)this._cPtr, &_cretlength);
    gid.gsk4.color_stop.ColorStop[] _retval;

    if (_cretval)
    {
      _retval = new gid.gsk4.color_stop.ColorStop[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gid.gsk4.color_stop.ColorStop(cast(void*)&_cretval[i], No.Take);
    }
    return _retval;
  }

  /**
      Retrieves the final point of the linear gradient.
      Returns: the final point
  */
  gid.graphene1.point.Point getEnd() nothrow
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_linear_gradient_node_get_end(cast(const(GskRenderNode)*)this._cPtr);
    gid.graphene1.point.Point _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.point.Point*)_cretval;
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
  gid.graphene1.point.Point getStart() nothrow
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_linear_gradient_node_get_start(cast(const(GskRenderNode)*)this._cPtr);
    gid.graphene1.point.Point _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.point.Point*)_cretval;
    return _retval;
  }
}
