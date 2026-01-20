/// Module for [Vec4] class
module graphene.vec4;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;
import graphene.vec2;
import graphene.vec3;

/**
    A structure capable of holding a vector with four dimensions: x, y, z, and w.
    
    The contents of the #graphene_vec4_t structure are private and should
    never be accessed directly.
*/
class Vec4 : gobject.boxed.Boxed
{

  /**
      Create a `vec4.Vec4` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_vec4_t.sizeof), Yes.Take);
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
    return cast(void function())graphene_vec4_get_type != &gidSymbolNotFound ? graphene_vec4_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Vec4 self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_vec4_t structure.
      
      The contents of the returned structure are undefined.
      
      Use [graphene.vec4.Vec4.init_] to initialize the vector.
      Returns: the newly allocated #graphene_vec4_t
          structure. Use [graphene.vec4.Vec4.free] to free the resources allocated
          by this function.
  */
  static graphene.vec4.Vec4 alloc()
  {
    graphene_vec4_t* _cretval;
    _cretval = graphene_vec4_alloc();
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adds each component of the two given vectors.
  
      Params:
        b = a #graphene_vec4_t
        res = return location for the resulting vector
  */
  void add(graphene.vec4.Vec4 b, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec4_add(cast(const(graphene_vec4_t)*)this._cPtr, b ? cast(const(graphene_vec4_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Divides each component of the first operand `a` by the corresponding
      component of the second operand `b`, and places the results into the
      vector res.
  
      Params:
        b = a #graphene_vec4_t
        res = return location for the resulting vector
  */
  void divide(graphene.vec4.Vec4 b, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec4_divide(cast(const(graphene_vec4_t)*)this._cPtr, b ? cast(const(graphene_vec4_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Computes the dot product of the two given vectors.
  
      Params:
        b = a #graphene_vec4_t
      Returns: the value of the dot product
  */
  float dot(graphene.vec4.Vec4 b)
  {
    float _retval;
    _retval = graphene_vec4_dot(cast(const(graphene_vec4_t)*)this._cPtr, b ? cast(const(graphene_vec4_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether the two given #graphene_vec4_t are equal.
  
      Params:
        v2 = a #graphene_vec4_t
      Returns: `true` if the two vectors are equal, and false otherwise
  */
  bool equal(graphene.vec4.Vec4 v2)
  {
    bool _retval;
    _retval = cast(bool)graphene_vec4_equal(cast(const(graphene_vec4_t)*)this._cPtr, v2 ? cast(const(graphene_vec4_t)*)v2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the value of the fourth component of the given #graphene_vec4_t.
      Returns: the value of the fourth component
  */
  float getW()
  {
    float _retval;
    _retval = graphene_vec4_get_w(cast(const(graphene_vec4_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the value of the first component of the given #graphene_vec4_t.
      Returns: the value of the first component
  */
  float getX()
  {
    float _retval;
    _retval = graphene_vec4_get_x(cast(const(graphene_vec4_t)*)this._cPtr);
    return _retval;
  }

  /**
      Creates a #graphene_vec2_t that contains the first two components
      of the given #graphene_vec4_t.
  
      Params:
        res = return location for a #graphene_vec2_t
  */
  void getXy(out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec4_get_xy(cast(const(graphene_vec4_t)*)this._cPtr, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Creates a #graphene_vec3_t that contains the first three components
      of the given #graphene_vec4_t.
  
      Params:
        res = return location for a graphene_vec3_t
  */
  void getXyz(out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_vec4_get_xyz(cast(const(graphene_vec4_t)*)this._cPtr, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Retrieves the value of the second component of the given #graphene_vec4_t.
      Returns: the value of the second component
  */
  float getY()
  {
    float _retval;
    _retval = graphene_vec4_get_y(cast(const(graphene_vec4_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the value of the third component of the given #graphene_vec4_t.
      Returns: the value of the third component
  */
  float getZ()
  {
    float _retval;
    _retval = graphene_vec4_get_z(cast(const(graphene_vec4_t)*)this._cPtr);
    return _retval;
  }

  /**
      Initializes a #graphene_vec4_t using the given values.
      
      This function can be called multiple times.
  
      Params:
        x = the X field of the vector
        y = the Y field of the vector
        z = the Z field of the vector
        w = the W field of the vector
      Returns: a pointer to the initialized
          vector
  */
  graphene.vec4.Vec4 init_(float x, float y, float z, float w)
  {
    graphene_vec4_t* _cretval;
    _cretval = graphene_vec4_init(cast(graphene_vec4_t*)this._cPtr, x, y, z, w);
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_vec4_t with the values inside the given array.
  
      Params:
        src = an array of four floating point values
      Returns: the initialized vector
  */
  graphene.vec4.Vec4 initFromFloat(float[] src)
  {
    graphene_vec4_t* _cretval;
    assert(!src || src.length == 4);
    auto _src = cast(const(float)*)src.ptr;
    _cretval = graphene_vec4_init_from_float(cast(graphene_vec4_t*)this._cPtr, _src);
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_vec4_t using the components of a
      #graphene_vec2_t and the values of `z` and `w`.
  
      Params:
        src = a #graphene_vec2_t
        z = the value for the third component of `v`
        w = the value for the fourth component of `v`
      Returns: the initialized vector
  */
  graphene.vec4.Vec4 initFromVec2(graphene.vec2.Vec2 src, float z, float w)
  {
    graphene_vec4_t* _cretval;
    _cretval = graphene_vec4_init_from_vec2(cast(graphene_vec4_t*)this._cPtr, src ? cast(const(graphene_vec2_t)*)src._cPtr(No.Dup) : null, z, w);
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_vec4_t using the components of a
      #graphene_vec3_t and the value of `w`.
  
      Params:
        src = a #graphene_vec3_t
        w = the value for the fourth component of `v`
      Returns: the initialized vector
  */
  graphene.vec4.Vec4 initFromVec3(graphene.vec3.Vec3 src, float w)
  {
    graphene_vec4_t* _cretval;
    _cretval = graphene_vec4_init_from_vec3(cast(graphene_vec4_t*)this._cPtr, src ? cast(const(graphene_vec3_t)*)src._cPtr(No.Dup) : null, w);
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_vec4_t using the components of
      another #graphene_vec4_t.
  
      Params:
        src = a #graphene_vec4_t
      Returns: the initialized vector
  */
  graphene.vec4.Vec4 initFromVec4(graphene.vec4.Vec4 src)
  {
    graphene_vec4_t* _cretval;
    _cretval = graphene_vec4_init_from_vec4(cast(graphene_vec4_t*)this._cPtr, src ? cast(const(graphene_vec4_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Linearly interpolates v1 and v2 using the given factor.
  
      Params:
        v2 = a #graphene_vec4_t
        factor = the interpolation factor
        res = the interpolated vector
  */
  void interpolate(graphene.vec4.Vec4 v2, double factor, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec4_interpolate(cast(const(graphene_vec4_t)*)this._cPtr, v2 ? cast(const(graphene_vec4_t)*)v2._cPtr(No.Dup) : null, factor, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Computes the length of the given #graphene_vec4_t.
      Returns: the length of the vector
  */
  float length()
  {
    float _retval;
    _retval = graphene_vec4_length(cast(const(graphene_vec4_t)*)this._cPtr);
    return _retval;
  }

  /**
      Compares each component of the two given vectors and creates a
      vector that contains the maximum values.
  
      Params:
        b = a #graphene_vec4_t
        res = return location for the result vector
  */
  void max(graphene.vec4.Vec4 b, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec4_max(cast(const(graphene_vec4_t)*)this._cPtr, b ? cast(const(graphene_vec4_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Compares each component of the two given vectors and creates a
      vector that contains the minimum values.
  
      Params:
        b = a #graphene_vec4_t
        res = return location for the result vector
  */
  void min(graphene.vec4.Vec4 b, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec4_min(cast(const(graphene_vec4_t)*)this._cPtr, b ? cast(const(graphene_vec4_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Multiplies each component of the two given vectors.
  
      Params:
        b = a #graphene_vec4_t
        res = return location for the resulting vector
  */
  void multiply(graphene.vec4.Vec4 b, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec4_multiply(cast(const(graphene_vec4_t)*)this._cPtr, b ? cast(const(graphene_vec4_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Compares the two given #graphene_vec4_t vectors and checks
      whether their values are within the given epsilon.
  
      Params:
        v2 = a #graphene_vec4_t
        epsilon = the threshold between the two vectors
      Returns: `true` if the two vectors are near each other
  */
  bool near(graphene.vec4.Vec4 v2, float epsilon)
  {
    bool _retval;
    _retval = cast(bool)graphene_vec4_near(cast(const(graphene_vec4_t)*)this._cPtr, v2 ? cast(const(graphene_vec4_t)*)v2._cPtr(No.Dup) : null, epsilon);
    return _retval;
  }

  /**
      Negates the given #graphene_vec4_t.
  
      Params:
        res = return location for the result vector
  */
  void negate(out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec4_negate(cast(const(graphene_vec4_t)*)this._cPtr, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Normalizes the given #graphene_vec4_t.
  
      Params:
        res = return location for the normalized
            vector
  */
  void normalize(out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec4_normalize(cast(const(graphene_vec4_t)*)this._cPtr, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Multiplies all components of the given vector with the given scalar factor.
  
      Params:
        factor = the scalar factor
        res = return location for the result vector
  */
  void scale(float factor, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec4_scale(cast(const(graphene_vec4_t)*)this._cPtr, factor, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Subtracts from each component of the first operand `a` the
      corresponding component of the second operand `b` and places
      each result into the components of res.
  
      Params:
        b = a #graphene_vec4_t
        res = return location for the resulting vector
  */
  void subtract(graphene.vec4.Vec4 b, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_vec4_subtract(cast(const(graphene_vec4_t)*)this._cPtr, b ? cast(const(graphene_vec4_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Stores the components of the given #graphene_vec4_t into an array
      of floating point values.
  
      Params:
        dest = return location for
            an array of floating point values
  */
  void toFloat(ref float[] dest)
  {
    graphene_vec4_to_float(cast(const(graphene_vec4_t)*)this._cPtr, dest.ptr);
  }

  /**
      Retrieves a pointer to a #graphene_vec4_t with all its
      components set to 1.
      Returns: a constant vector
  */
  static graphene.vec4.Vec4 one()
  {
    const(graphene_vec4_t)* _cretval;
    _cretval = graphene_vec4_one();
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves a pointer to a #graphene_vec4_t with its
      components set to (0, 0, 0, 1).
      Returns: a constant vector
  */
  static graphene.vec4.Vec4 wAxis()
  {
    const(graphene_vec4_t)* _cretval;
    _cretval = graphene_vec4_w_axis();
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves a pointer to a #graphene_vec4_t with its
      components set to (1, 0, 0, 0).
      Returns: a constant vector
  */
  static graphene.vec4.Vec4 xAxis()
  {
    const(graphene_vec4_t)* _cretval;
    _cretval = graphene_vec4_x_axis();
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves a pointer to a #graphene_vec4_t with its
      components set to (0, 1, 0, 0).
      Returns: a constant vector
  */
  static graphene.vec4.Vec4 yAxis()
  {
    const(graphene_vec4_t)* _cretval;
    _cretval = graphene_vec4_y_axis();
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves a pointer to a #graphene_vec4_t with its
      components set to (0, 0, 1, 0).
      Returns: a constant vector
  */
  static graphene.vec4.Vec4 zAxis()
  {
    const(graphene_vec4_t)* _cretval;
    _cretval = graphene_vec4_z_axis();
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves a pointer to a #graphene_vec4_t with all its
      components set to 0.
      Returns: a constant vector
  */
  static graphene.vec4.Vec4 zero()
  {
    const(graphene_vec4_t)* _cretval;
    _cretval = graphene_vec4_zero();
    auto _retval = _cretval ? new graphene.vec4.Vec4(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
