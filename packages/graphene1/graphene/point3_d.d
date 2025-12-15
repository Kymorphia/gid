/// Module for [Point3D] class
module graphene.point3_d;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.rect;
import graphene.types;
import graphene.vec3;

/**
    A point with three components: X, Y, and Z.
*/
class Point3D : gobject.boxed.Boxed
{

  /**
      Create a `point3_d.Point3D` boxed type.
      Params:
        x = the X coordinate
        y = the Y coordinate
        z = the Z coordinate
  */
  this(float x = 0.0, float y = 0.0, float z = 0.0)
  {
    super(gMalloc(graphene_point3d_t.sizeof), Yes.Take);
    this.x = x;
    this.y = y;
    this.z = z;
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
    return cast(void function())graphene_point3d_get_type != &gidSymbolNotFound ? graphene_point3d_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Point3D self()
  {
    return this;
  }

  /**
      Get `x` field.
      Returns: the X coordinate
  */
  @property float x()
  {
    return (cast(graphene_point3d_t*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the X coordinate
  */
  @property void x(float propval)
  {
    (cast(graphene_point3d_t*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the Y coordinate
  */
  @property float y()
  {
    return (cast(graphene_point3d_t*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the Y coordinate
  */
  @property void y(float propval)
  {
    (cast(graphene_point3d_t*)this._cPtr).y = propval;
  }

  /**
      Get `z` field.
      Returns: the Z coordinate
  */
  @property float z()
  {
    return (cast(graphene_point3d_t*)this._cPtr).z;
  }

  /**
      Set `z` field.
      Params:
        propval = the Z coordinate
  */
  @property void z(float propval)
  {
    (cast(graphene_point3d_t*)this._cPtr).z = propval;
  }

  /**
      Allocates a #graphene_point3d_t structure.
      Returns: the newly allocated structure.
          Use [graphene.point3_d.Point3D.free] to free the resources
          allocated by this function.
  */
  static graphene.point3_d.Point3D alloc()
  {
    graphene_point3d_t* _cretval;
    _cretval = graphene_point3d_alloc();
    auto _retval = _cretval ? new graphene.point3_d.Point3D(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Computes the cross product of the two given #graphene_point3d_t.
  
      Params:
        b = a #graphene_point3d_t
        res = return location for the cross
            product
  */
  void cross(graphene.point3_d.Point3D b, out graphene.point3_d.Point3D res)
  {
    graphene_point3d_t _res;
    graphene_point3d_cross(cast(const(graphene_point3d_t)*)this._cPtr, b ? cast(const(graphene_point3d_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.point3_d.Point3D(cast(void*)&_res, No.Take);
  }

  /**
      Computes the distance between the two given #graphene_point3d_t.
  
      Params:
        b = a #graphene_point3d_t
        delta = return location for the distance
            components on the X, Y, and Z axis
      Returns: the distance between two points
  */
  float distance(graphene.point3_d.Point3D b, out graphene.vec3.Vec3 delta)
  {
    float _retval;
    graphene_vec3_t _delta;
    _retval = graphene_point3d_distance(cast(const(graphene_point3d_t)*)this._cPtr, b ? cast(const(graphene_point3d_t)*)b._cPtr(No.Dup) : null, &_delta);
    delta = new graphene.vec3.Vec3(cast(void*)&_delta, No.Take);
    return _retval;
  }

  /**
      Computes the dot product of the two given #graphene_point3d_t.
  
      Params:
        b = a #graphene_point3d_t
      Returns: the value of the dot product
  */
  float dot(graphene.point3_d.Point3D b)
  {
    float _retval;
    _retval = graphene_point3d_dot(cast(const(graphene_point3d_t)*)this._cPtr, b ? cast(const(graphene_point3d_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether two given points are equal.
  
      Params:
        b = a #graphene_point3d_t
      Returns: `true` if the points are equal
  */
  bool equal(graphene.point3_d.Point3D b)
  {
    bool _retval;
    _retval = cast(bool)graphene_point3d_equal(cast(const(graphene_point3d_t)*)this._cPtr, b ? cast(const(graphene_point3d_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Initializes a #graphene_point3d_t with the given coordinates.
  
      Params:
        x = the X coordinate of the point
        y = the Y coordinate of the point
        z = the Z coordinate of the point
      Returns: the initialized #graphene_point3d_t
  */
  graphene.point3_d.Point3D init_(float x, float y, float z)
  {
    graphene_point3d_t* _cretval;
    _cretval = graphene_point3d_init(cast(graphene_point3d_t*)this._cPtr, x, y, z);
    auto _retval = _cretval ? new graphene.point3_d.Point3D(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_point3d_t using the coordinates of
      another #graphene_point3d_t.
  
      Params:
        src = a #graphene_point3d_t
      Returns: the initialized point
  */
  graphene.point3_d.Point3D initFromPoint(graphene.point3_d.Point3D src)
  {
    graphene_point3d_t* _cretval;
    _cretval = graphene_point3d_init_from_point(cast(graphene_point3d_t*)this._cPtr, src ? cast(const(graphene_point3d_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.point3_d.Point3D(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_point3d_t using the components
      of a #graphene_vec3_t.
  
      Params:
        v = a #graphene_vec3_t
      Returns: the initialized #graphene_point3d_t
  */
  graphene.point3_d.Point3D initFromVec3(graphene.vec3.Vec3 v)
  {
    graphene_point3d_t* _cretval;
    _cretval = graphene_point3d_init_from_vec3(cast(graphene_point3d_t*)this._cPtr, v ? cast(const(graphene_vec3_t)*)v._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.point3_d.Point3D(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Linearly interpolates each component of `a` and `b` using the
      provided factor, and places the result in res.
  
      Params:
        b = a #graphene_point3d_t
        factor = the interpolation factor
        res = the return location for the
            interpolated #graphene_point3d_t
  */
  void interpolate(graphene.point3_d.Point3D b, double factor, out graphene.point3_d.Point3D res)
  {
    graphene_point3d_t _res;
    graphene_point3d_interpolate(cast(const(graphene_point3d_t)*)this._cPtr, b ? cast(const(graphene_point3d_t)*)b._cPtr(No.Dup) : null, factor, &_res);
    res = new graphene.point3_d.Point3D(cast(void*)&_res, No.Take);
  }

  /**
      Computes the length of the vector represented by the
      coordinates of the given #graphene_point3d_t.
      Returns: the length of the vector represented by the point
  */
  float length()
  {
    float _retval;
    _retval = graphene_point3d_length(cast(const(graphene_point3d_t)*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the two points are near each other, within
      an epsilon factor.
  
      Params:
        b = a #graphene_point3d_t
        epsilon = fuzzyness factor
      Returns: `true` if the points are near each other
  */
  bool near(graphene.point3_d.Point3D b, float epsilon)
  {
    bool _retval;
    _retval = cast(bool)graphene_point3d_near(cast(const(graphene_point3d_t)*)this._cPtr, b ? cast(const(graphene_point3d_t)*)b._cPtr(No.Dup) : null, epsilon);
    return _retval;
  }

  /**
      Computes the normalization of the vector represented by the
      coordinates of the given #graphene_point3d_t.
  
      Params:
        res = return location for the normalized
            #graphene_point3d_t
  */
  void normalize(out graphene.point3_d.Point3D res)
  {
    graphene_point3d_t _res;
    graphene_point3d_normalize(cast(const(graphene_point3d_t)*)this._cPtr, &_res);
    res = new graphene.point3_d.Point3D(cast(void*)&_res, No.Take);
  }

  /**
      Normalizes the coordinates of a #graphene_point3d_t using the
      given viewport and clipping planes.
      
      The coordinates of the resulting #graphene_point3d_t will be
      in the [ -1, 1 ] range.
  
      Params:
        viewport = a #graphene_rect_t representing a viewport
        zNear = the coordinate of the near clipping plane, or 0 for
            the default near clipping plane
        zFar = the coordinate of the far clipping plane, or 1 for the
            default far clipping plane
        res = the return location for the
            normalized #graphene_point3d_t
  */
  void normalizeViewport(graphene.rect.Rect viewport, float zNear, float zFar, out graphene.point3_d.Point3D res)
  {
    graphene_point3d_t _res;
    graphene_point3d_normalize_viewport(cast(const(graphene_point3d_t)*)this._cPtr, viewport ? cast(const(graphene_rect_t)*)viewport._cPtr(No.Dup) : null, zNear, zFar, &_res);
    res = new graphene.point3_d.Point3D(cast(void*)&_res, No.Take);
  }

  /**
      Scales the coordinates of the given #graphene_point3d_t by
      the given factor.
  
      Params:
        factor = the scaling factor
        res = return location for the scaled point
  */
  void scale(float factor, out graphene.point3_d.Point3D res)
  {
    graphene_point3d_t _res;
    graphene_point3d_scale(cast(const(graphene_point3d_t)*)this._cPtr, factor, &_res);
    res = new graphene.point3_d.Point3D(cast(void*)&_res, No.Take);
  }

  /**
      Stores the coordinates of a #graphene_point3d_t into a
      #graphene_vec3_t.
  
      Params:
        v = return location for a #graphene_vec3_t
  */
  void toVec3(out graphene.vec3.Vec3 v)
  {
    graphene_vec3_t _v;
    graphene_point3d_to_vec3(cast(const(graphene_point3d_t)*)this._cPtr, &_v);
    v = new graphene.vec3.Vec3(cast(void*)&_v, No.Take);
  }

  /**
      Retrieves a constant point with all three coordinates set to 0.
      Returns: a zero point
  */
  static graphene.point3_d.Point3D zero()
  {
    const(graphene_point3d_t)* _cretval;
    _cretval = graphene_point3d_zero();
    auto _retval = _cretval ? new graphene.point3_d.Point3D(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
