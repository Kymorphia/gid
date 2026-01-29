/// Module for [Point] struct
module graphene.point;

import gid.gid;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;
import graphene.vec2;

/**
    A point with two coordinates.
*/
struct Point
{
  /**
      the X coordinate of the point
  */
  float x;

  /**
      the Y coordinate of the point
  */
  float y;

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())graphene_point_get_type != &gidSymbolNotFound ? graphene_point_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType()
  {
    return _getGType();
  }

  void* boxCopy()
  {
    import gobject.c.functions : g_boxed_copy;
    return g_boxed_copy(_gType,
        cast(void*)&this);
  }

  /**
      Computes the distance between `a` and `b`.
  
      Params:
        b = a #graphene_point_t
        dX = distance component on the X axis
        dY = distance component on the Y axis
      Returns: the distance between the two points
  */
  float distance(graphene.point.Point b, out float dX, out float dY)
  {
    float _retval;
    _retval = graphene_point_distance(cast(const(graphene_point_t)*)&this, cast(const(graphene_point_t)*)&b, cast(float*)&dX, cast(float*)&dY);
    return _retval;
  }

  /**
      Checks if the two points `a` and `b` point to the same
      coordinates.
      
      This function accounts for floating point fluctuations; if
      you want to control the fuzziness of the match, you can use
      [graphene.point.Point.near] instead.
  
      Params:
        b = a #graphene_point_t
      Returns: `true` if the points have the same coordinates
  */
  bool equal(graphene.point.Point b)
  {
    bool _retval;
    _retval = cast(bool)graphene_point_equal(cast(const(graphene_point_t)*)&this, cast(const(graphene_point_t)*)&b);
    return _retval;
  }

  /**
      Initializes `p` to the given `x` and `y` coordinates.
      
      It's safe to call this function multiple times.
  
      Params:
        x = the X coordinate
        y = the Y coordinate
      Returns: the initialized point
  */
  graphene.point.Point init_(float x, float y)
  {
    graphene_point_t* _cretval;
    _cretval = graphene_point_init(cast(graphene_point_t*)&this, x, y);
    graphene.point.Point _retval;
    if (_cretval)
      _retval = *cast(graphene.point.Point*)_cretval;
    return _retval;
  }

  /**
      Initializes `p` with the same coordinates of src.
  
      Params:
        src = the #graphene_point_t to use
      Returns: the initialized point
  */
  graphene.point.Point initFromPoint(graphene.point.Point src)
  {
    graphene_point_t* _cretval;
    _cretval = graphene_point_init_from_point(cast(graphene_point_t*)&this, cast(const(graphene_point_t)*)&src);
    graphene.point.Point _retval;
    if (_cretval)
      _retval = *cast(graphene.point.Point*)_cretval;
    return _retval;
  }

  /**
      Initializes `p` with the coordinates inside the given #graphene_vec2_t.
  
      Params:
        src = a #graphene_vec2_t
      Returns: the initialized point
  */
  graphene.point.Point initFromVec2(graphene.vec2.Vec2 src)
  {
    graphene_point_t* _cretval;
    _cretval = graphene_point_init_from_vec2(cast(graphene_point_t*)&this, src ? cast(const(graphene_vec2_t)*)src._cPtr(No.Dup) : null);
    graphene.point.Point _retval;
    if (_cretval)
      _retval = *cast(graphene.point.Point*)_cretval;
    return _retval;
  }

  /**
      Linearly interpolates the coordinates of `a` and `b` using the
      given factor.
  
      Params:
        b = a #graphene_point_t
        factor = the linear interpolation factor
        res = return location for the interpolated
            point
  */
  void interpolate(graphene.point.Point b, double factor, out graphene.point.Point res)
  {
    graphene_point_interpolate(cast(const(graphene_point_t)*)&this, cast(const(graphene_point_t)*)&b, factor, cast(graphene_point_t*)&res);
  }

  /**
      Checks whether the two points `a` and `b` are within
      the threshold of epsilon.
  
      Params:
        b = a #graphene_point_t
        epsilon = threshold between the two points
      Returns: `true` if the distance is within epsilon
  */
  bool near(graphene.point.Point b, float epsilon)
  {
    bool _retval;
    _retval = cast(bool)graphene_point_near(cast(const(graphene_point_t)*)&this, cast(const(graphene_point_t)*)&b, epsilon);
    return _retval;
  }

  /**
      Stores the coordinates of the given #graphene_point_t into a
      #graphene_vec2_t.
  
      Params:
        v = return location for the vertex
  */
  void toVec2(out graphene.vec2.Vec2 v)
  {
    graphene_vec2_t _v;
    graphene_point_to_vec2(cast(const(graphene_point_t)*)&this, &_v);
    v = new graphene.vec2.Vec2(cast(void*)&_v, No.Take);
  }

  /**
      Returns a point fixed at (0, 0).
      Returns: a fixed point
  */
  static graphene.point.Point zero()
  {
    const(graphene_point_t)* _cretval;
    _cretval = graphene_point_zero();
    graphene.point.Point _retval;
    if (_cretval)
      _retval = *cast(graphene.point.Point*)_cretval;
    return _retval;
  }
}
