/// Module for [Euler] class
module graphene.euler;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.matrix;
import graphene.quaternion;
import graphene.types;
import graphene.vec3;

/**
    Describe a rotation using Euler angles.
    
    The contents of the #graphene_euler_t structure are private
    and should never be accessed directly.
*/
class Euler : gobject.boxed.Boxed
{

  /**
      Create a `euler.Euler` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_euler_t.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())graphene_euler_get_type != &gidSymbolNotFound ? graphene_euler_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Euler self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_euler_t.
      
      The contents of the returned structure are undefined.
      Returns: the newly allocated #graphene_euler_t
  */
  static graphene.euler.Euler alloc()
  {
    graphene_euler_t* _cretval;
    _cretval = graphene_euler_alloc();
    auto _retval = _cretval ? new graphene.euler.Euler(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if two #graphene_euler_t are equal.
  
      Params:
        b = a #graphene_euler_t
      Returns: `true` if the two #graphene_euler_t are equal
  */
  bool equal(graphene.euler.Euler b)
  {
    bool _retval;
    _retval = cast(bool)graphene_euler_equal(cast(const(graphene_euler_t)*)this._cPtr, b ? cast(const(graphene_euler_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the first component of the Euler angle vector,
      depending on the order of rotation.
      
      See also: [graphene.euler.Euler.getX]
      Returns: the first component of the Euler angle vector, in radians
  */
  float getAlpha()
  {
    float _retval;
    _retval = graphene_euler_get_alpha(cast(const(graphene_euler_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the second component of the Euler angle vector,
      depending on the order of rotation.
      
      See also: [graphene.euler.Euler.getY]
      Returns: the second component of the Euler angle vector, in radians
  */
  float getBeta()
  {
    float _retval;
    _retval = graphene_euler_get_beta(cast(const(graphene_euler_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the third component of the Euler angle vector,
      depending on the order of rotation.
      
      See also: [graphene.euler.Euler.getZ]
      Returns: the third component of the Euler angle vector, in radians
  */
  float getGamma()
  {
    float _retval;
    _retval = graphene_euler_get_gamma(cast(const(graphene_euler_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the order used to apply the rotations described in the
      #graphene_euler_t structure, when converting to and from other
      structures, like #graphene_quaternion_t and #graphene_matrix_t.
      
      This function does not return the `GRAPHENE_EULER_ORDER_DEFAULT`
      enumeration value; it will return the effective order of rotation
      instead.
      Returns: the order used to apply the rotations
  */
  graphene.types.EulerOrder getOrder()
  {
    graphene_euler_order_t _cretval;
    _cretval = graphene_euler_get_order(cast(const(graphene_euler_t)*)this._cPtr);
    graphene.types.EulerOrder _retval = cast(graphene.types.EulerOrder)_cretval;
    return _retval;
  }

  /**
      Retrieves the rotation angle on the X axis, in degrees.
      Returns: the rotation angle
  */
  float getX()
  {
    float _retval;
    _retval = graphene_euler_get_x(cast(const(graphene_euler_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the rotation angle on the Y axis, in degrees.
      Returns: the rotation angle
  */
  float getY()
  {
    float _retval;
    _retval = graphene_euler_get_y(cast(const(graphene_euler_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the rotation angle on the Z axis, in degrees.
      Returns: the rotation angle
  */
  float getZ()
  {
    float _retval;
    _retval = graphene_euler_get_z(cast(const(graphene_euler_t)*)this._cPtr);
    return _retval;
  }

  /**
      Initializes a #graphene_euler_t using the given angles.
      
      The order of the rotations is `GRAPHENE_EULER_ORDER_DEFAULT`.
  
      Params:
        x = rotation angle on the X axis, in degrees
        y = rotation angle on the Y axis, in degrees
        z = rotation angle on the Z axis, in degrees
      Returns: the initialized #graphene_euler_t
  */
  graphene.euler.Euler init_(float x, float y, float z)
  {
    graphene_euler_t* _cretval;
    _cretval = graphene_euler_init(cast(graphene_euler_t*)this._cPtr, x, y, z);
    auto _retval = _cretval ? new graphene.euler.Euler(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_euler_t using the angles and order of
      another #graphene_euler_t.
      
      If the #graphene_euler_t src is null, this function is equivalent
      to calling [graphene.euler.Euler.init_] with all angles set to 0.
  
      Params:
        src = a #graphene_euler_t
      Returns: the initialized #graphene_euler_t
  */
  graphene.euler.Euler initFromEuler(graphene.euler.Euler src = null)
  {
    graphene_euler_t* _cretval;
    _cretval = graphene_euler_init_from_euler(cast(graphene_euler_t*)this._cPtr, src ? cast(const(graphene_euler_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.euler.Euler(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_euler_t using the given rotation matrix.
      
      If the #graphene_matrix_t `m` is null, the #graphene_euler_t will
      be initialized with all angles set to 0.
  
      Params:
        m = a rotation matrix
        order = the order used to apply the rotations
      Returns: the initialized #graphene_euler_t
  */
  graphene.euler.Euler initFromMatrix(graphene.matrix.Matrix m, graphene.types.EulerOrder order)
  {
    graphene_euler_t* _cretval;
    _cretval = graphene_euler_init_from_matrix(cast(graphene_euler_t*)this._cPtr, m ? cast(const(graphene_matrix_t)*)m._cPtr(No.Dup) : null, order);
    auto _retval = _cretval ? new graphene.euler.Euler(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_euler_t using the given normalized quaternion.
      
      If the #graphene_quaternion_t `q` is null, the #graphene_euler_t will
      be initialized with all angles set to 0.
  
      Params:
        q = a normalized #graphene_quaternion_t
        order = the order used to apply the rotations
      Returns: the initialized #graphene_euler_t
  */
  graphene.euler.Euler initFromQuaternion(graphene.quaternion.Quaternion q, graphene.types.EulerOrder order)
  {
    graphene_euler_t* _cretval;
    _cretval = graphene_euler_init_from_quaternion(cast(graphene_euler_t*)this._cPtr, cast(const(graphene_quaternion_t)*)&q, order);
    auto _retval = _cretval ? new graphene.euler.Euler(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_euler_t using the given angles
      and order of rotation.
  
      Params:
        x = rotation angle on the X axis, in radians
        y = rotation angle on the Y axis, in radians
        z = rotation angle on the Z axis, in radians
        order = order of rotations
      Returns: the initialized #graphene_euler_t
  */
  graphene.euler.Euler initFromRadians(float x, float y, float z, graphene.types.EulerOrder order)
  {
    graphene_euler_t* _cretval;
    _cretval = graphene_euler_init_from_radians(cast(graphene_euler_t*)this._cPtr, x, y, z, order);
    auto _retval = _cretval ? new graphene.euler.Euler(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_euler_t using the angles contained in a
      #graphene_vec3_t.
      
      If the #graphene_vec3_t `v` is null, the #graphene_euler_t will be
      initialized with all angles set to 0.
  
      Params:
        v = a #graphene_vec3_t containing the rotation
            angles in degrees
        order = the order used to apply the rotations
      Returns: the initialized #graphene_euler_t
  */
  graphene.euler.Euler initFromVec3(graphene.vec3.Vec3 v, graphene.types.EulerOrder order)
  {
    graphene_euler_t* _cretval;
    _cretval = graphene_euler_init_from_vec3(cast(graphene_euler_t*)this._cPtr, v ? cast(const(graphene_vec3_t)*)v._cPtr(No.Dup) : null, order);
    auto _retval = _cretval ? new graphene.euler.Euler(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_euler_t with the given angles and order.
  
      Params:
        x = rotation angle on the X axis, in degrees
        y = rotation angle on the Y axis, in degrees
        z = rotation angle on the Z axis, in degrees
        order = the order used to apply the rotations
      Returns: the initialized #graphene_euler_t
  */
  graphene.euler.Euler initWithOrder(float x, float y, float z, graphene.types.EulerOrder order)
  {
    graphene_euler_t* _cretval;
    _cretval = graphene_euler_init_with_order(cast(graphene_euler_t*)this._cPtr, x, y, z, order);
    auto _retval = _cretval ? new graphene.euler.Euler(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Reorders a #graphene_euler_t using order.
      
      This function is equivalent to creating a #graphene_quaternion_t from the
      given #graphene_euler_t, and then converting the quaternion into another
      #graphene_euler_t.
  
      Params:
        order = the new order
        res = return location for the reordered
            #graphene_euler_t
  */
  void reorder(graphene.types.EulerOrder order, out graphene.euler.Euler res)
  {
    graphene_euler_t _res;
    graphene_euler_reorder(cast(const(graphene_euler_t)*)this._cPtr, order, &_res);
    res = new graphene.euler.Euler(cast(void*)&_res, No.Take);
  }

  /**
      Converts a #graphene_euler_t into a transformation matrix expressing
      the extrinsic composition of rotations described by the Euler angles.
      
      The rotations are applied over the reference frame axes in the order
      associated with the #graphene_euler_t; for instance, if the order
      used to initialize `e` is `GRAPHENE_EULER_ORDER_XYZ`:
      
       $(LIST
          * the first rotation moves the body around the X axis with
            an angle φ
          * the second rotation moves the body around the Y axis with
            an angle of ϑ
          * the third rotation moves the body around the Z axis with
            an angle of ψ
       )
         
      The rotation sign convention is right-handed, to preserve compatibility
      between Euler-based, quaternion-based, and angle-axis-based rotations.
  
      Params:
        res = return location for a #graphene_matrix_t
  */
  void toMatrix(out graphene.matrix.Matrix res)
  {
    graphene_matrix_t _res;
    graphene_euler_to_matrix(cast(const(graphene_euler_t)*)this._cPtr, &_res);
    res = new graphene.matrix.Matrix(cast(void*)&_res, No.Take);
  }

  /**
      Converts a #graphene_euler_t into a #graphene_quaternion_t.
  
      Params:
        res = return location for a #graphene_quaternion_t
  */
  void toQuaternion(out graphene.quaternion.Quaternion res)
  {
    graphene_euler_to_quaternion(cast(const(graphene_euler_t)*)this._cPtr, cast(graphene_quaternion_t*)&res);
  }

  /**
      Retrieves the angles of a #graphene_euler_t and initializes a
      #graphene_vec3_t with them.
  
      Params:
        res = return location for a #graphene_vec3_t
  */
  void toVec3(out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_euler_to_vec3(cast(const(graphene_euler_t)*)this._cPtr, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }
}
