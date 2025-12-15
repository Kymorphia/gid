/// Module for [Quaternion] class
module graphene.quaternion;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.euler;
import graphene.matrix;
import graphene.types;
import graphene.vec3;
import graphene.vec4;

/**
    A quaternion.
    
    The contents of the #graphene_quaternion_t structure are private
    and should never be accessed directly.
*/
class Quaternion : gobject.boxed.Boxed
{

  /**
      Create a `quaternion.Quaternion` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_quaternion_t.sizeof), Yes.Take);
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
    return cast(void function())graphene_quaternion_get_type != &gidSymbolNotFound ? graphene_quaternion_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Quaternion self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_quaternion_t.
      
      The contents of the returned value are undefined.
      Returns: the newly allocated #graphene_quaternion_t
  */
  static graphene.quaternion.Quaternion alloc()
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_alloc();
    auto _retval = _cretval ? new graphene.quaternion.Quaternion(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adds two #graphene_quaternion_t `a` and `b`.
  
      Params:
        b = a #graphene_quaternion_t
        res = the result of the operation
  */
  void add(graphene.quaternion.Quaternion b, out graphene.quaternion.Quaternion res)
  {
    graphene_quaternion_t _res;
    graphene_quaternion_add(cast(const(graphene_quaternion_t)*)this._cPtr, b ? cast(const(graphene_quaternion_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.quaternion.Quaternion(cast(void*)&_res, No.Take);
  }

  /**
      Computes the dot product of two #graphene_quaternion_t.
  
      Params:
        b = a #graphene_quaternion_t
      Returns: the value of the dot products
  */
  float dot(graphene.quaternion.Quaternion b)
  {
    float _retval;
    _retval = graphene_quaternion_dot(cast(const(graphene_quaternion_t)*)this._cPtr, b ? cast(const(graphene_quaternion_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether the given quaternions are equal.
  
      Params:
        b = a #graphene_quaternion_t
      Returns: `true` if the quaternions are equal
  */
  bool equal(graphene.quaternion.Quaternion b)
  {
    bool _retval;
    _retval = cast(bool)graphene_quaternion_equal(cast(const(graphene_quaternion_t)*)this._cPtr, b ? cast(const(graphene_quaternion_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the given four values.
  
      Params:
        x = the first component of the quaternion
        y = the second component of the quaternion
        z = the third component of the quaternion
        w = the fourth component of the quaternion
      Returns: the initialized quaternion
  */
  graphene.quaternion.Quaternion init_(float x, float y, float z, float w)
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init(cast(graphene_quaternion_t*)this._cPtr, x, y, z, w);
    auto _retval = _cretval ? new graphene.quaternion.Quaternion(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using an angle on a
      specific axis.
  
      Params:
        angle = the rotation on a given axis, in degrees
        axis = the axis of rotation, expressed as a vector
      Returns: the initialized quaternion
  */
  graphene.quaternion.Quaternion initFromAngleVec3(float angle, graphene.vec3.Vec3 axis)
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_angle_vec3(cast(graphene_quaternion_t*)this._cPtr, angle, axis ? cast(const(graphene_vec3_t)*)axis._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.quaternion.Quaternion(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the values of
      the [Euler angles](http://en.wikipedia.org/wiki/Euler_angles)
      on each axis.
      
      See also: [graphene.quaternion.Quaternion.initFromEuler]
  
      Params:
        degX = rotation angle on the X axis (yaw), in degrees
        degY = rotation angle on the Y axis (pitch), in degrees
        degZ = rotation angle on the Z axis (roll), in degrees
      Returns: the initialized quaternion
  */
  graphene.quaternion.Quaternion initFromAngles(float degX, float degY, float degZ)
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_angles(cast(graphene_quaternion_t*)this._cPtr, degX, degY, degZ);
    auto _retval = _cretval ? new graphene.quaternion.Quaternion(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the given #graphene_euler_t.
  
      Params:
        e = a #graphene_euler_t
      Returns: the initialized #graphene_quaternion_t
  */
  graphene.quaternion.Quaternion initFromEuler(graphene.euler.Euler e)
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_euler(cast(graphene_quaternion_t*)this._cPtr, e ? cast(const(graphene_euler_t)*)e._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.quaternion.Quaternion(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the rotation components
      of a transformation matrix.
  
      Params:
        m = a #graphene_matrix_t
      Returns: the initialized quaternion
  */
  graphene.quaternion.Quaternion initFromMatrix(graphene.matrix.Matrix m)
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_matrix(cast(graphene_quaternion_t*)this._cPtr, m ? cast(const(graphene_matrix_t)*)m._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.quaternion.Quaternion(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t with the values from src.
  
      Params:
        src = a #graphene_quaternion_t
      Returns: the initialized quaternion
  */
  graphene.quaternion.Quaternion initFromQuaternion(graphene.quaternion.Quaternion src)
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_quaternion(cast(graphene_quaternion_t*)this._cPtr, src ? cast(const(graphene_quaternion_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.quaternion.Quaternion(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the values of
      the [Euler angles](http://en.wikipedia.org/wiki/Euler_angles)
      on each axis.
      
      See also: [graphene.quaternion.Quaternion.initFromEuler]
  
      Params:
        radX = rotation angle on the X axis (yaw), in radians
        radY = rotation angle on the Y axis (pitch), in radians
        radZ = rotation angle on the Z axis (roll), in radians
      Returns: the initialized quaternion
  */
  graphene.quaternion.Quaternion initFromRadians(float radX, float radY, float radZ)
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_radians(cast(graphene_quaternion_t*)this._cPtr, radX, radY, radZ);
    auto _retval = _cretval ? new graphene.quaternion.Quaternion(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t with the values from src.
  
      Params:
        src = a #graphene_vec4_t
      Returns: the initialized quaternion
  */
  graphene.quaternion.Quaternion initFromVec4(graphene.vec4.Vec4 src)
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_vec4(cast(graphene_quaternion_t*)this._cPtr, src ? cast(const(graphene_vec4_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.quaternion.Quaternion(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the identity
      transformation.
      Returns: the initialized quaternion
  */
  graphene.quaternion.Quaternion initIdentity()
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_identity(cast(graphene_quaternion_t*)this._cPtr);
    auto _retval = _cretval ? new graphene.quaternion.Quaternion(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Inverts a #graphene_quaternion_t, and returns the conjugate
      quaternion of `q`.
  
      Params:
        res = return location for the inverted
            quaternion
  */
  void invert(out graphene.quaternion.Quaternion res)
  {
    graphene_quaternion_t _res;
    graphene_quaternion_invert(cast(const(graphene_quaternion_t)*)this._cPtr, &_res);
    res = new graphene.quaternion.Quaternion(cast(void*)&_res, No.Take);
  }

  /**
      Multiplies two #graphene_quaternion_t `a` and `b`.
  
      Params:
        b = a #graphene_quaternion_t
        res = the result of the operation
  */
  void multiply(graphene.quaternion.Quaternion b, out graphene.quaternion.Quaternion res)
  {
    graphene_quaternion_t _res;
    graphene_quaternion_multiply(cast(const(graphene_quaternion_t)*)this._cPtr, b ? cast(const(graphene_quaternion_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.quaternion.Quaternion(cast(void*)&_res, No.Take);
  }

  /**
      Normalizes a #graphene_quaternion_t.
  
      Params:
        res = return location for the normalized
            quaternion
  */
  void normalize(out graphene.quaternion.Quaternion res)
  {
    graphene_quaternion_t _res;
    graphene_quaternion_normalize(cast(const(graphene_quaternion_t)*)this._cPtr, &_res);
    res = new graphene.quaternion.Quaternion(cast(void*)&_res, No.Take);
  }

  /**
      Scales all the elements of a #graphene_quaternion_t `q` using
      the given scalar factor.
  
      Params:
        factor = a scaling factor
        res = the result of the operation
  */
  void scale(float factor, out graphene.quaternion.Quaternion res)
  {
    graphene_quaternion_t _res;
    graphene_quaternion_scale(cast(const(graphene_quaternion_t)*)this._cPtr, factor, &_res);
    res = new graphene.quaternion.Quaternion(cast(void*)&_res, No.Take);
  }

  /**
      Interpolates between the two given quaternions using a spherical
      linear interpolation, or [SLERP](http://en.wikipedia.org/wiki/Slerp),
      using the given interpolation factor.
  
      Params:
        b = a #graphene_quaternion_t
        factor = the linear interpolation factor
        res = return location for the interpolated
            quaternion
  */
  void slerp(graphene.quaternion.Quaternion b, float factor, out graphene.quaternion.Quaternion res)
  {
    graphene_quaternion_t _res;
    graphene_quaternion_slerp(cast(const(graphene_quaternion_t)*)this._cPtr, b ? cast(const(graphene_quaternion_t)*)b._cPtr(No.Dup) : null, factor, &_res);
    res = new graphene.quaternion.Quaternion(cast(void*)&_res, No.Take);
  }

  /**
      Converts a quaternion into an angle, axis pair.
  
      Params:
        angle = return location for the angle, in degrees
        axis = return location for the rotation axis
  */
  void toAngleVec3(out float angle, out graphene.vec3.Vec3 axis)
  {
    graphene_vec3_t _axis;
    graphene_quaternion_to_angle_vec3(cast(const(graphene_quaternion_t)*)this._cPtr, cast(float*)&angle, &_axis);
    axis = new graphene.vec3.Vec3(cast(void*)&_axis, No.Take);
  }

  /**
      Converts a #graphene_quaternion_t to its corresponding rotations
      on the [Euler angles](http://en.wikipedia.org/wiki/Euler_angles)
      on each axis.
  
      Params:
        degX = return location for the rotation angle on
            the X axis (yaw), in degrees
        degY = return location for the rotation angle on
            the Y axis (pitch), in degrees
        degZ = return location for the rotation angle on
            the Z axis (roll), in degrees
  */
  void toAngles(out float degX, out float degY, out float degZ)
  {
    graphene_quaternion_to_angles(cast(const(graphene_quaternion_t)*)this._cPtr, cast(float*)&degX, cast(float*)&degY, cast(float*)&degZ);
  }

  /**
      Converts a quaternion into a transformation matrix expressing
      the rotation defined by the #graphene_quaternion_t.
  
      Params:
        m = a #graphene_matrix_t
  */
  void toMatrix(out graphene.matrix.Matrix m)
  {
    graphene_matrix_t _m;
    graphene_quaternion_to_matrix(cast(const(graphene_quaternion_t)*)this._cPtr, &_m);
    m = new graphene.matrix.Matrix(cast(void*)&_m, No.Take);
  }

  /**
      Converts a #graphene_quaternion_t to its corresponding rotations
      on the [Euler angles](http://en.wikipedia.org/wiki/Euler_angles)
      on each axis.
  
      Params:
        radX = return location for the rotation angle on
            the X axis (yaw), in radians
        radY = return location for the rotation angle on
            the Y axis (pitch), in radians
        radZ = return location for the rotation angle on
            the Z axis (roll), in radians
  */
  void toRadians(out float radX, out float radY, out float radZ)
  {
    graphene_quaternion_to_radians(cast(const(graphene_quaternion_t)*)this._cPtr, cast(float*)&radX, cast(float*)&radY, cast(float*)&radZ);
  }

  /**
      Copies the components of a #graphene_quaternion_t into a
      #graphene_vec4_t.
  
      Params:
        res = return location for a
            #graphene_vec4_t
  */
  void toVec4(out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_quaternion_to_vec4(cast(const(graphene_quaternion_t)*)this._cPtr, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }
}
