/// Module for [Quaternion] struct
module gid.graphene1.quaternion;

public import gid.core.basictypes;
import gid.core.utils;
import gid.graphene1.c.functions;
import gid.graphene1.c.types;
import gid.graphene1.euler;
import gid.graphene1.matrix;
import gid.graphene1.types;
import gid.graphene1.vec3;
import gid.graphene1.vec4;

/**
    A quaternion.
    
    The contents of the #graphene_quaternion_t structure are private
    and should never be accessed directly.
*/
@gidGir("Quaternion")
struct Quaternion
{
  /** */
  float x;

  /** */
  float y;

  /** */
  float z;

  /** */
  float w;

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())graphene_quaternion_get_type != &gidSymbolNotFound ? graphene_quaternion_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  static void* _cDup(void* ptr) nothrow
  {
    return boxedCopy(_getGType, ptr);
  }

  /** */
  static void _cFree(void* ptr) nothrow
  {
    boxedFree(_getGType, ptr);
  }

  /**
      Adds two #graphene_quaternion_t `a` and `b`.
  
      Params:
        b = a #graphene_quaternion_t
        res = the result of the operation
  */
  void add(gid.graphene1.quaternion.Quaternion b, out gid.graphene1.quaternion.Quaternion res) nothrow
  {
    graphene_quaternion_add(cast(const(graphene_quaternion_t)*)&this, cast(const(graphene_quaternion_t)*)&b, cast(graphene_quaternion_t*)&res);
  }

  /**
      Computes the dot product of two #graphene_quaternion_t.
  
      Params:
        b = a #graphene_quaternion_t
      Returns: the value of the dot products
  */
  float dot(gid.graphene1.quaternion.Quaternion b) nothrow
  {
    float _retval;
    _retval = graphene_quaternion_dot(cast(const(graphene_quaternion_t)*)&this, cast(const(graphene_quaternion_t)*)&b);
    return _retval;
  }

  /**
      Checks whether the given quaternions are equal.
  
      Params:
        b = a #graphene_quaternion_t
      Returns: `true` if the quaternions are equal
  */
  bool equal(gid.graphene1.quaternion.Quaternion b) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_quaternion_equal(cast(const(graphene_quaternion_t)*)&this, cast(const(graphene_quaternion_t)*)&b);
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
  gid.graphene1.quaternion.Quaternion init_(float x, float y, float z, float w) nothrow
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init(cast(graphene_quaternion_t*)&this, x, y, z, w);
    gid.graphene1.quaternion.Quaternion _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.quaternion.Quaternion*)_cretval;
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
  gid.graphene1.quaternion.Quaternion initFromAngleVec3(float angle, gid.graphene1.vec3.Vec3 axis) nothrow
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_angle_vec3(cast(graphene_quaternion_t*)&this, angle, axis ? cast(const(graphene_vec3_t)*)axis._cPtr(No.Dup) : null);
    gid.graphene1.quaternion.Quaternion _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.quaternion.Quaternion*)_cretval;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the values of
      the [Euler angles](http://en.wikipedia.org/wiki/Euler_angles)
      on each axis.
      
      See also: [gid.graphene1.quaternion.Quaternion.initFromEuler]
  
      Params:
        degX = rotation angle on the X axis (yaw), in degrees
        degY = rotation angle on the Y axis (pitch), in degrees
        degZ = rotation angle on the Z axis (roll), in degrees
      Returns: the initialized quaternion
  */
  gid.graphene1.quaternion.Quaternion initFromAngles(float degX, float degY, float degZ) nothrow
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_angles(cast(graphene_quaternion_t*)&this, degX, degY, degZ);
    gid.graphene1.quaternion.Quaternion _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.quaternion.Quaternion*)_cretval;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the given #graphene_euler_t.
  
      Params:
        e = a #graphene_euler_t
      Returns: the initialized #graphene_quaternion_t
  */
  gid.graphene1.quaternion.Quaternion initFromEuler(gid.graphene1.euler.Euler e) nothrow
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_euler(cast(graphene_quaternion_t*)&this, e ? cast(const(graphene_euler_t)*)e._cPtr(No.Dup) : null);
    gid.graphene1.quaternion.Quaternion _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.quaternion.Quaternion*)_cretval;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the rotation components
      of a transformation matrix.
  
      Params:
        m = a #graphene_matrix_t
      Returns: the initialized quaternion
  */
  gid.graphene1.quaternion.Quaternion initFromMatrix(gid.graphene1.matrix.Matrix m) nothrow
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_matrix(cast(graphene_quaternion_t*)&this, m ? cast(const(graphene_matrix_t)*)m._cPtr(No.Dup) : null);
    gid.graphene1.quaternion.Quaternion _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.quaternion.Quaternion*)_cretval;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t with the values from src.
  
      Params:
        src = a #graphene_quaternion_t
      Returns: the initialized quaternion
  */
  gid.graphene1.quaternion.Quaternion initFromQuaternion(gid.graphene1.quaternion.Quaternion src) nothrow
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_quaternion(cast(graphene_quaternion_t*)&this, cast(const(graphene_quaternion_t)*)&src);
    gid.graphene1.quaternion.Quaternion _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.quaternion.Quaternion*)_cretval;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the values of
      the [Euler angles](http://en.wikipedia.org/wiki/Euler_angles)
      on each axis.
      
      See also: [gid.graphene1.quaternion.Quaternion.initFromEuler]
  
      Params:
        radX = rotation angle on the X axis (yaw), in radians
        radY = rotation angle on the Y axis (pitch), in radians
        radZ = rotation angle on the Z axis (roll), in radians
      Returns: the initialized quaternion
  */
  gid.graphene1.quaternion.Quaternion initFromRadians(float radX, float radY, float radZ) nothrow
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_radians(cast(graphene_quaternion_t*)&this, radX, radY, radZ);
    gid.graphene1.quaternion.Quaternion _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.quaternion.Quaternion*)_cretval;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t with the values from src.
  
      Params:
        src = a #graphene_vec4_t
      Returns: the initialized quaternion
  */
  gid.graphene1.quaternion.Quaternion initFromVec4(gid.graphene1.vec4.Vec4 src) nothrow
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_from_vec4(cast(graphene_quaternion_t*)&this, src ? cast(const(graphene_vec4_t)*)src._cPtr(No.Dup) : null);
    gid.graphene1.quaternion.Quaternion _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.quaternion.Quaternion*)_cretval;
    return _retval;
  }

  /**
      Initializes a #graphene_quaternion_t using the identity
      transformation.
      Returns: the initialized quaternion
  */
  gid.graphene1.quaternion.Quaternion initIdentity() nothrow
  {
    graphene_quaternion_t* _cretval;
    _cretval = graphene_quaternion_init_identity(cast(graphene_quaternion_t*)&this);
    gid.graphene1.quaternion.Quaternion _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.quaternion.Quaternion*)_cretval;
    return _retval;
  }

  /**
      Inverts a #graphene_quaternion_t, and returns the conjugate
      quaternion of `q`.
  
      Params:
        res = return location for the inverted
            quaternion
  */
  void invert(out gid.graphene1.quaternion.Quaternion res) nothrow
  {
    graphene_quaternion_invert(cast(const(graphene_quaternion_t)*)&this, cast(graphene_quaternion_t*)&res);
  }

  /**
      Multiplies two #graphene_quaternion_t `a` and `b`.
  
      Params:
        b = a #graphene_quaternion_t
        res = the result of the operation
  */
  void multiply(gid.graphene1.quaternion.Quaternion b, out gid.graphene1.quaternion.Quaternion res) nothrow
  {
    graphene_quaternion_multiply(cast(const(graphene_quaternion_t)*)&this, cast(const(graphene_quaternion_t)*)&b, cast(graphene_quaternion_t*)&res);
  }

  /**
      Normalizes a #graphene_quaternion_t.
  
      Params:
        res = return location for the normalized
            quaternion
  */
  void normalize(out gid.graphene1.quaternion.Quaternion res) nothrow
  {
    graphene_quaternion_normalize(cast(const(graphene_quaternion_t)*)&this, cast(graphene_quaternion_t*)&res);
  }

  /**
      Scales all the elements of a #graphene_quaternion_t `q` using
      the given scalar factor.
  
      Params:
        factor = a scaling factor
        res = the result of the operation
  */
  void scale(float factor, out gid.graphene1.quaternion.Quaternion res) nothrow
  {
    graphene_quaternion_scale(cast(const(graphene_quaternion_t)*)&this, factor, cast(graphene_quaternion_t*)&res);
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
  void slerp(gid.graphene1.quaternion.Quaternion b, float factor, out gid.graphene1.quaternion.Quaternion res) nothrow
  {
    graphene_quaternion_slerp(cast(const(graphene_quaternion_t)*)&this, cast(const(graphene_quaternion_t)*)&b, factor, cast(graphene_quaternion_t*)&res);
  }

  /**
      Converts a quaternion into an angle, axis pair.
  
      Params:
        angle = return location for the angle, in degrees
        axis = return location for the rotation axis
  */
  void toAngleVec3(out float angle, out gid.graphene1.vec3.Vec3 axis) nothrow
  {
    auto _axis = boxedNew!graphene_vec3_t(gid.graphene1.vec3.Vec3._getGType);
    graphene_quaternion_to_angle_vec3(cast(const(graphene_quaternion_t)*)&this, cast(float*)&angle, _axis);
    axis = new gid.graphene1.vec3.Vec3(cast(void*)_axis, Yes.Take);
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
  void toAngles(out float degX, out float degY, out float degZ) nothrow
  {
    graphene_quaternion_to_angles(cast(const(graphene_quaternion_t)*)&this, cast(float*)&degX, cast(float*)&degY, cast(float*)&degZ);
  }

  /**
      Converts a quaternion into a transformation matrix expressing
      the rotation defined by the #graphene_quaternion_t.
  
      Params:
        m = a #graphene_matrix_t
  */
  void toMatrix(out gid.graphene1.matrix.Matrix m) nothrow
  {
    auto _m = boxedNew!graphene_matrix_t(gid.graphene1.matrix.Matrix._getGType);
    graphene_quaternion_to_matrix(cast(const(graphene_quaternion_t)*)&this, _m);
    m = new gid.graphene1.matrix.Matrix(cast(void*)_m, Yes.Take);
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
  void toRadians(out float radX, out float radY, out float radZ) nothrow
  {
    graphene_quaternion_to_radians(cast(const(graphene_quaternion_t)*)&this, cast(float*)&radX, cast(float*)&radY, cast(float*)&radZ);
  }

  /**
      Copies the components of a #graphene_quaternion_t into a
      #graphene_vec4_t.
  
      Params:
        res = return location for a
            #graphene_vec4_t
  */
  void toVec4(out gid.graphene1.vec4.Vec4 res) nothrow
  {
    auto _res = boxedNew!graphene_vec4_t(gid.graphene1.vec4.Vec4._getGType);
    graphene_quaternion_to_vec4(cast(const(graphene_quaternion_t)*)&this, _res);
    res = new gid.graphene1.vec4.Vec4(cast(void*)_res, Yes.Take);
  }
}
