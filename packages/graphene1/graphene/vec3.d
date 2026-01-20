/// Module for [Vec3] class
module graphene.vec3;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;
import graphene.vec2;
import graphene.vec4;

/**
    A structure capable of holding a vector with three dimensions: x, y, and z.
    
    The contents of the #graphene_vec3_t structure are private and should
    never be accessed directly.
*/
class Vec3 : gobject.boxed.Boxed
{

  /**
      Create a `vec3.Vec3` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_vec3_t.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())graphene_vec3_get_type != &gidSymbolNotFound ? graphene_vec3_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Vec3 self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_vec3_t structure.
      
      The contents of the returned structure are undefined.
      
      Use [graphene.vec3.Vec3.init_] to initialize the vector.
      Returns: the newly allocated #graphene_vec3_t
          structure. Use [graphene.vec3.Vec3.free] to free the resources allocated
          by this function.
  */
  static graphene.vec3.Vec3 alloc()
  {
    graphene_vec3_t* _cretval;
    _cretval = graphene_vec3_alloc();
    auto _retval = _cretval ? new graphene.vec3.Vec3(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adds each component of the two given vectors.
  
      Params:
        b = a #graphene_vec3_t
        res = return location for the resulting vector
  */
  void add(graphene.vec3.Vec3 b, out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_add(cast(const(graphene_vec3_t)*)this._cPtr, b ? cast(const(graphene_vec3_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Computes the cross product of the two given vectors.
  
      Params:
        b = a #graphene_vec3_t
        res = return location for the resulting vector
  */
  void cross(graphene.vec3.Vec3 b, out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_cross(cast(const(graphene_vec3_t)*)this._cPtr, b ? cast(const(graphene_vec3_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Divides each component of the first operand `a` by the corresponding
      component of the second operand `b`, and places the results into the
      vector res.
  
      Params:
        b = a #graphene_vec3_t
        res = return location for the resulting vector
  */
  void divide(graphene.vec3.Vec3 b, out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_divide(cast(const(graphene_vec3_t)*)this._cPtr, b ? cast(const(graphene_vec3_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Computes the dot product of the two given vectors.
  
      Params:
        b = a #graphene_vec3_t
      Returns: the value of the dot product
  */
  float dot(graphene.vec3.Vec3 b)
  {
    float _retval;
    _retval = graphene_vec3_dot(cast(const(graphene_vec3_t)*)this._cPtr, b ? cast(const(graphene_vec3_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether the two given #graphene_vec3_t are equal.
  
      Params:
        v2 = a #graphene_vec3_t
      Returns: `true` if the two vectors are equal, and false otherwise
  */
  bool equal(graphene.vec3.Vec3 v2)
  {
    bool _retval;
    _retval = cast(bool)graphene_vec3_equal(cast(const(graphene_vec3_t)*)this._cPtr, v2 ? cast(const(graphene_vec3_t)*)v2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the first component of the given vector `v`.
      Returns: the value of the first component of the vector
  */
  float getX()
  {
    float _retval;
    _retval = graphene_vec3_get_x(cast(const(graphene_vec3_t)*)this._cPtr);
    return _retval;
  }

  /**
      Creates a #graphene_vec2_t that contains the first and second
      components of the given #graphene_vec3_t.
  
      Params:
        res = return location for a #graphene_vec2_t
  */
  void getXy(out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec3_get_xy(cast(const(graphene_vec3_t)*)this._cPtr, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Creates a #graphene_vec3_t that contains the first two components of
      the given #graphene_vec3_t, and the third component set to 0.
  
      Params:
        res = return location for a #graphene_vec3_t
  */
  void getXy0(out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_get_xy0(cast(const(graphene_vec3_t)*)this._cPtr, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Converts a #graphene_vec3_t in a #graphene_vec4_t using 0.0
      as the value for the fourth component of the resulting vector.
  
      Params:
        res = return location for the vector
  */
  void getXyz0(out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec3_get_xyz0(cast(const(graphene_vec3_t)*)this._cPtr, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Converts a #graphene_vec3_t in a #graphene_vec4_t using 1.0
      as the value for the fourth component of the resulting vector.
  
      Params:
        res = return location for the vector
  */
  void getXyz1(out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec3_get_xyz1(cast(const(graphene_vec3_t)*)this._cPtr, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Converts a #graphene_vec3_t in a #graphene_vec4_t using `w` as
      the value of the fourth component of the resulting vector.
  
      Params:
        w = the value of the W component
        res = return location for the vector
  */
  void getXyzw(float w, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec3_get_xyzw(cast(const(graphene_vec3_t)*)this._cPtr, w, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Retrieves the second component of the given vector `v`.
      Returns: the value of the second component of the vector
  */
  float getY()
  {
    float _retval;
    _retval = graphene_vec3_get_y(cast(const(graphene_vec3_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the third component of the given vector `v`.
      Returns: the value of the third component of the vector
  */
  float getZ()
  {
    float _retval;
    _retval = graphene_vec3_get_z(cast(const(graphene_vec3_t)*)this._cPtr);
    return _retval;
  }

  /**
      Initializes a #graphene_vec3_t using the given values.
      
      This function can be called multiple times.
  
      Params:
        x = the X field of the vector
        y = the Y field of the vector
        z = the Z field of the vector
      Returns: a pointer to the initialized
          vector
  */
  graphene.vec3.Vec3 init_(float x, float y, float z)
  {
    graphene_vec3_t* _cretval;
    _cretval = graphene_vec3_init(cast(graphene_vec3_t*)this._cPtr, x, y, z);
    auto _retval = _cretval ? new graphene.vec3.Vec3(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_vec3_t with the values from an array.
  
      Params:
        src = an array of 3 floating point values
      Returns: the initialized vector
  */
  graphene.vec3.Vec3 initFromFloat(float[] src)
  {
    graphene_vec3_t* _cretval;
    assert(!src || src.length == 3);
    auto _src = cast(const(float)*)src.ptr;
    _cretval = graphene_vec3_init_from_float(cast(graphene_vec3_t*)this._cPtr, _src);
    auto _retval = _cretval ? new graphene.vec3.Vec3(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_vec3_t with the values of another
      #graphene_vec3_t.
  
      Params:
        src = a #graphene_vec3_t
      Returns: the initialized vector
  */
  graphene.vec3.Vec3 initFromVec3(graphene.vec3.Vec3 src)
  {
    graphene_vec3_t* _cretval;
    _cretval = graphene_vec3_init_from_vec3(cast(graphene_vec3_t*)this._cPtr, src ? cast(const(graphene_vec3_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.vec3.Vec3(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Linearly interpolates v1 and v2 using the given factor.
  
      Params:
        v2 = a #graphene_vec3_t
        factor = the interpolation factor
        res = the interpolated vector
  */
  void interpolate(graphene.vec3.Vec3 v2, double factor, out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_interpolate(cast(const(graphene_vec3_t)*)this._cPtr, v2 ? cast(const(graphene_vec3_t)*)v2._cPtr(No.Dup) : null, factor, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Retrieves the length of the given vector `v`.
      Returns: the value of the length of the vector
  */
  float length()
  {
    float _retval;
    _retval = graphene_vec3_length(cast(const(graphene_vec3_t)*)this._cPtr);
    return _retval;
  }

  /**
      Compares each component of the two given vectors and creates a
      vector that contains the maximum values.
  
      Params:
        b = a #graphene_vec3_t
        res = return location for the result vector
  */
  void max(graphene.vec3.Vec3 b, out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_max(cast(const(graphene_vec3_t)*)this._cPtr, b ? cast(const(graphene_vec3_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Compares each component of the two given vectors and creates a
      vector that contains the minimum values.
  
      Params:
        b = a #graphene_vec3_t
        res = return location for the result vector
  */
  void min(graphene.vec3.Vec3 b, out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_min(cast(const(graphene_vec3_t)*)this._cPtr, b ? cast(const(graphene_vec3_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Multiplies each component of the two given vectors.
  
      Params:
        b = a #graphene_vec3_t
        res = return location for the resulting vector
  */
  void multiply(graphene.vec3.Vec3 b, out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_multiply(cast(const(graphene_vec3_t)*)this._cPtr, b ? cast(const(graphene_vec3_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Compares the two given #graphene_vec3_t vectors and checks
      whether their values are within the given epsilon.
  
      Params:
        v2 = a #graphene_vec3_t
        epsilon = the threshold between the two vectors
      Returns: `true` if the two vectors are near each other
  */
  bool near(graphene.vec3.Vec3 v2, float epsilon)
  {
    bool _retval;
    _retval = cast(bool)graphene_vec3_near(cast(const(graphene_vec3_t)*)this._cPtr, v2 ? cast(const(graphene_vec3_t)*)v2._cPtr(No.Dup) : null, epsilon);
    return _retval;
  }

  /**
      Negates the given #graphene_vec3_t.
  
      Params:
        res = return location for the result vector
  */
  void negate(out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_negate(cast(const(graphene_vec3_t)*)this._cPtr, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Normalizes the given #graphene_vec3_t.
  
      Params:
        res = return location for the normalized vector
  */
  void normalize(out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_normalize(cast(const(graphene_vec3_t)*)this._cPtr, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Multiplies all components of the given vector with the given scalar factor.
  
      Params:
        factor = the scalar factor
        res = return location for the result vector
  */
  void scale(float factor, out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_scale(cast(const(graphene_vec3_t)*)this._cPtr, factor, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Subtracts from each component of the first operand `a` the
      corresponding component of the second operand `b` and places
      each result into the components of res.
  
      Params:
        b = a #graphene_vec3_t
        res = return location for the resulting vector
  */
  void subtract(graphene.vec3.Vec3 b, out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec3_subtract(cast(const(graphene_vec3_t)*)this._cPtr, b ? cast(const(graphene_vec3_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Copies the components of a #graphene_vec3_t into the given array.
  
      Params:
        dest = return location for
            an array of floating point values
  */
  void toFloat(ref float[] dest)
  {
    graphene_vec3_to_float(cast(const(graphene_vec3_t)*)this._cPtr, dest.ptr);
  }

  /**
      Provides a constant pointer to a vector with three components,
      all sets to 1.
      Returns: a constant vector
  */
  static graphene.vec3.Vec3 one()
  {
    const(graphene_vec3_t)* _cretval;
    _cretval = graphene_vec3_one();
    auto _retval = _cretval ? new graphene.vec3.Vec3(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Provides a constant pointer to a vector with three components
      with values set to (1, 0, 0).
      Returns: a constant vector
  */
  static graphene.vec3.Vec3 xAxis()
  {
    const(graphene_vec3_t)* _cretval;
    _cretval = graphene_vec3_x_axis();
    auto _retval = _cretval ? new graphene.vec3.Vec3(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Provides a constant pointer to a vector with three components
      with values set to (0, 1, 0).
      Returns: a constant vector
  */
  static graphene.vec3.Vec3 yAxis()
  {
    const(graphene_vec3_t)* _cretval;
    _cretval = graphene_vec3_y_axis();
    auto _retval = _cretval ? new graphene.vec3.Vec3(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Provides a constant pointer to a vector with three components
      with values set to (0, 0, 1).
      Returns: a constant vector
  */
  static graphene.vec3.Vec3 zAxis()
  {
    const(graphene_vec3_t)* _cretval;
    _cretval = graphene_vec3_z_axis();
    auto _retval = _cretval ? new graphene.vec3.Vec3(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Provides a constant pointer to a vector with three components,
      all sets to 0.
      Returns: a constant vector
  */
  static graphene.vec3.Vec3 zero()
  {
    const(graphene_vec3_t)* _cretval;
    _cretval = graphene_vec3_zero();
    auto _retval = _cretval ? new graphene.vec3.Vec3(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
