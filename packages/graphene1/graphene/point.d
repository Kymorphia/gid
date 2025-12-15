/// Module for [Point] class
module graphene.point;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;
import graphene.vec2;

/**
    A point with two coordinates.
*/
class Point : gobject.boxed.Boxed
{

  /**
      Create a `point.Point` boxed type.
      Params:
        x = the X coordinate of the point
        y = the Y coordinate of the point
  */
  this(float x = 0.0, float y = 0.0)
  {
    super(gMalloc(graphene_point_t.sizeof), Yes.Take);
    this.x = x;
    this.y = y;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())graphene_point_get_type != &gidSymbolNotFound ? graphene_point_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Point self()
  {
    return this;
  }

  /**
      Get `x` field.
      Returns: the X coordinate of the point
  */
  @property float x()
  {
    return (cast(graphene_point_t*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the X coordinate of the point
  */
  @property void x(float propval)
  {
    (cast(graphene_point_t*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the Y coordinate of the point
  */
  @property float y()
  {
    return (cast(graphene_point_t*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the Y coordinate of the point
  */
  @property void y(float propval)
  {
    (cast(graphene_point_t*)this._cPtr).y = propval;
  }

  /**
      Allocates a new #graphene_point_t structure.
      
      The coordinates of the returned point are (0, 0).
      
      It's possible to chain this function with [graphene.point.Point.init_]
      or [graphene.point.Point.initFromPoint], e.g.:
      
      ```c
        graphene_point_t *
        point_new (float x, float y)
        {
          return graphene_point_init (graphene_point_alloc (), x, y);
        }
      
        graphene_point_t *
        point_copy (const graphene_point_t *p)
        {
          return graphene_point_init_from_point (graphene_point_alloc (), p);
        }
      ```
      Returns: the newly allocated #graphene_point_t.
          Use [graphene.point.Point.free] to free the resources allocated by
          this function.
  */
  static graphene.point.Point alloc()
  {
    graphene_point_t* _cretval;
    _cretval = graphene_point_alloc();
    auto _retval = _cretval ? new graphene.point.Point(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
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
    _retval = graphene_point_distance(cast(const(graphene_point_t)*)this._cPtr, b ? cast(const(graphene_point_t)*)b._cPtr(No.Dup) : null, cast(float*)&dX, cast(float*)&dY);
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
    _retval = cast(bool)graphene_point_equal(cast(const(graphene_point_t)*)this._cPtr, b ? cast(const(graphene_point_t)*)b._cPtr(No.Dup) : null);
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
    _cretval = graphene_point_init(cast(graphene_point_t*)this._cPtr, x, y);
    auto _retval = _cretval ? new graphene.point.Point(cast(void*)_cretval, No.Take) : null;
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
    _cretval = graphene_point_init_from_point(cast(graphene_point_t*)this._cPtr, src ? cast(const(graphene_point_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.point.Point(cast(void*)_cretval, No.Take) : null;
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
    _cretval = graphene_point_init_from_vec2(cast(graphene_point_t*)this._cPtr, src ? cast(const(graphene_vec2_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.point.Point(cast(void*)_cretval, No.Take) : null;
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
    graphene_point_t _res;
    graphene_point_interpolate(cast(const(graphene_point_t)*)this._cPtr, b ? cast(const(graphene_point_t)*)b._cPtr(No.Dup) : null, factor, &_res);
    res = new graphene.point.Point(cast(void*)&_res, No.Take);
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
    _retval = cast(bool)graphene_point_near(cast(const(graphene_point_t)*)this._cPtr, b ? cast(const(graphene_point_t)*)b._cPtr(No.Dup) : null, epsilon);
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
    graphene_point_to_vec2(cast(const(graphene_point_t)*)this._cPtr, &_v);
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
    auto _retval = _cretval ? new graphene.point.Point(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
