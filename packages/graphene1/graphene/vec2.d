/// Module for [Vec2] class
module graphene.vec2;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;

/**
    A structure capable of holding a vector with two dimensions, x and y.
    
    The contents of the #graphene_vec2_t structure are private and should
    never be accessed directly.
*/
class Vec2 : gobject.boxed.Boxed
{

  /**
      Create a `vec2.Vec2` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_vec2_t.sizeof), Yes.Take);
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
    return cast(void function())graphene_vec2_get_type != &gidSymbolNotFound ? graphene_vec2_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Vec2 self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_vec2_t structure.
      
      The contents of the returned structure are undefined.
      
      Use [graphene.vec2.Vec2.init_] to initialize the vector.
      Returns: the newly allocated #graphene_vec2_t
          structure. Use [graphene.vec2.Vec2.free] to free the resources allocated
          by this function.
  */
  static graphene.vec2.Vec2 alloc()
  {
    graphene_vec2_t* _cretval;
    _cretval = graphene_vec2_alloc();
    auto _retval = _cretval ? new graphene.vec2.Vec2(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adds each component of the two passed vectors and places
      each result into the components of res.
  
      Params:
        b = a #graphene_vec2_t
        res = return location for the result
  */
  void add(graphene.vec2.Vec2 b, out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec2_add(cast(const(graphene_vec2_t)*)this._cPtr, b ? cast(const(graphene_vec2_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Divides each component of the first operand `a` by the corresponding
      component of the second operand `b`, and places the results into the
      vector res.
  
      Params:
        b = a #graphene_vec2_t
        res = return location for the result
  */
  void divide(graphene.vec2.Vec2 b, out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec2_divide(cast(const(graphene_vec2_t)*)this._cPtr, b ? cast(const(graphene_vec2_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Computes the dot product of the two given vectors.
  
      Params:
        b = a #graphene_vec2_t
      Returns: the dot product of the vectors
  */
  float dot(graphene.vec2.Vec2 b)
  {
    float _retval;
    _retval = graphene_vec2_dot(cast(const(graphene_vec2_t)*)this._cPtr, b ? cast(const(graphene_vec2_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether the two given #graphene_vec2_t are equal.
  
      Params:
        v2 = a #graphene_vec2_t
      Returns: `true` if the two vectors are equal, and false otherwise
  */
  bool equal(graphene.vec2.Vec2 v2)
  {
    bool _retval;
    _retval = cast(bool)graphene_vec2_equal(cast(const(graphene_vec2_t)*)this._cPtr, v2 ? cast(const(graphene_vec2_t)*)v2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the X component of the #graphene_vec2_t.
      Returns: the value of the X component
  */
  float getX()
  {
    float _retval;
    _retval = graphene_vec2_get_x(cast(const(graphene_vec2_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the Y component of the #graphene_vec2_t.
      Returns: the value of the Y component
  */
  float getY()
  {
    float _retval;
    _retval = graphene_vec2_get_y(cast(const(graphene_vec2_t)*)this._cPtr);
    return _retval;
  }

  /**
      Initializes a #graphene_vec2_t using the given values.
      
      This function can be called multiple times.
  
      Params:
        x = the X field of the vector
        y = the Y field of the vector
      Returns: the initialized vector
  */
  graphene.vec2.Vec2 init_(float x, float y)
  {
    graphene_vec2_t* _cretval;
    _cretval = graphene_vec2_init(cast(graphene_vec2_t*)this._cPtr, x, y);
    auto _retval = _cretval ? new graphene.vec2.Vec2(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes `v` with the contents of the given array.
  
      Params:
        src = an array of floating point values
            with at least two elements
      Returns: the initialized vector
  */
  graphene.vec2.Vec2 initFromFloat(float[] src)
  {
    graphene_vec2_t* _cretval;
    assert(!src || src.length == 2);
    auto _src = cast(const(float)*)src.ptr;
    _cretval = graphene_vec2_init_from_float(cast(graphene_vec2_t*)this._cPtr, _src);
    auto _retval = _cretval ? new graphene.vec2.Vec2(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Copies the contents of src into `v`.
  
      Params:
        src = a #graphene_vec2_t
      Returns: the initialized vector
  */
  graphene.vec2.Vec2 initFromVec2(graphene.vec2.Vec2 src)
  {
    graphene_vec2_t* _cretval;
    _cretval = graphene_vec2_init_from_vec2(cast(graphene_vec2_t*)this._cPtr, src ? cast(const(graphene_vec2_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.vec2.Vec2(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Linearly interpolates v1 and v2 using the given factor.
  
      Params:
        v2 = a #graphene_vec2_t
        factor = the interpolation factor
        res = the interpolated vector
  */
  void interpolate(graphene.vec2.Vec2 v2, double factor, out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec2_interpolate(cast(const(graphene_vec2_t)*)this._cPtr, v2 ? cast(const(graphene_vec2_t)*)v2._cPtr(No.Dup) : null, factor, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Computes the length of the given vector.
      Returns: the length of the vector
  */
  float length()
  {
    float _retval;
    _retval = graphene_vec2_length(cast(const(graphene_vec2_t)*)this._cPtr);
    return _retval;
  }

  /**
      Compares the two given vectors and places the maximum
      values of each component into res.
  
      Params:
        b = a #graphene_vec2_t
        res = the resulting vector
  */
  void max(graphene.vec2.Vec2 b, out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec2_max(cast(const(graphene_vec2_t)*)this._cPtr, b ? cast(const(graphene_vec2_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Compares the two given vectors and places the minimum
      values of each component into res.
  
      Params:
        b = a #graphene_vec2_t
        res = the resulting vector
  */
  void min(graphene.vec2.Vec2 b, out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec2_min(cast(const(graphene_vec2_t)*)this._cPtr, b ? cast(const(graphene_vec2_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Multiplies each component of the two passed vectors and places
      each result into the components of res.
  
      Params:
        b = a #graphene_vec2_t
        res = return location for the result
  */
  void multiply(graphene.vec2.Vec2 b, out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec2_multiply(cast(const(graphene_vec2_t)*)this._cPtr, b ? cast(const(graphene_vec2_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Compares the two given #graphene_vec2_t vectors and checks
      whether their values are within the given epsilon.
  
      Params:
        v2 = a #graphene_vec2_t
        epsilon = the threshold between the two vectors
      Returns: `true` if the two vectors are near each other
  */
  bool near(graphene.vec2.Vec2 v2, float epsilon)
  {
    bool _retval;
    _retval = cast(bool)graphene_vec2_near(cast(const(graphene_vec2_t)*)this._cPtr, v2 ? cast(const(graphene_vec2_t)*)v2._cPtr(No.Dup) : null, epsilon);
    return _retval;
  }

  /**
      Negates the given #graphene_vec2_t.
  
      Params:
        res = return location for the result vector
  */
  void negate(out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec2_negate(cast(const(graphene_vec2_t)*)this._cPtr, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Computes the normalized vector for the given vector `v`.
  
      Params:
        res = return location for the
            normalized vector
  */
  void normalize(out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec2_normalize(cast(const(graphene_vec2_t)*)this._cPtr, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Multiplies all components of the given vector with the given scalar factor.
  
      Params:
        factor = the scalar factor
        res = return location for the result vector
  */
  void scale(float factor, out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec2_scale(cast(const(graphene_vec2_t)*)this._cPtr, factor, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Subtracts from each component of the first operand `a` the
      corresponding component of the second operand `b` and places
      each result into the components of res.
  
      Params:
        b = a #graphene_vec2_t
        res = return location for the result
  */
  void subtract(graphene.vec2.Vec2 b, out graphene.vec2.Vec2 res)
  {
    graphene_vec2_t _res;
    graphene_vec2_subtract(cast(const(graphene_vec2_t)*)this._cPtr, b ? cast(const(graphene_vec2_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
  }

  /**
      Stores the components of `v` into an array.
  
      Params:
        dest = return location
            for an array of floating point values with at least 2 elements
  */
  void toFloat(ref float[] dest)
  {
    graphene_vec2_to_float(cast(const(graphene_vec2_t)*)this._cPtr, dest.ptr);
  }

  /**
      Retrieves a constant vector with (1, 1) components.
      Returns: the one vector
  */
  static graphene.vec2.Vec2 one()
  {
    const(graphene_vec2_t)* _cretval;
    _cretval = graphene_vec2_one();
    auto _retval = _cretval ? new graphene.vec2.Vec2(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves a constant vector with (1, 0) components.
      Returns: the X axis vector
  */
  static graphene.vec2.Vec2 xAxis()
  {
    const(graphene_vec2_t)* _cretval;
    _cretval = graphene_vec2_x_axis();
    auto _retval = _cretval ? new graphene.vec2.Vec2(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves a constant vector with (0, 1) components.
      Returns: the Y axis vector
  */
  static graphene.vec2.Vec2 yAxis()
  {
    const(graphene_vec2_t)* _cretval;
    _cretval = graphene_vec2_y_axis();
    auto _retval = _cretval ? new graphene.vec2.Vec2(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves a constant vector with (0, 0) components.
      Returns: the zero vector
  */
  static graphene.vec2.Vec2 zero()
  {
    const(graphene_vec2_t)* _cretval;
    _cretval = graphene_vec2_zero();
    auto _retval = _cretval ? new graphene.vec2.Vec2(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
