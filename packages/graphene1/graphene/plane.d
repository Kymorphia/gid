/// Module for [Plane] class
module graphene.plane;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.matrix;
import graphene.point3_d;
import graphene.types;
import graphene.vec3;
import graphene.vec4;

/**
    A 2D plane that extends infinitely in a 3D volume.
    
    The contents of the [graphene.plane.Plane] are private, and should not be
    modified directly.
*/
class Plane : gobject.boxed.Boxed
{

  /**
      Create a `plane.Plane` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_plane_t.sizeof), Yes.Take);
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
    return cast(void function())graphene_plane_get_type != &gidSymbolNotFound ? graphene_plane_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Plane self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_plane_t structure.
      
      The contents of the returned structure are undefined.
      Returns: the newly allocated #graphene_plane_t.
          Use [graphene.plane.Plane.free] to free the resources allocated by
          this function
  */
  static graphene.plane.Plane alloc()
  {
    graphene_plane_t* _cretval;
    _cretval = graphene_plane_alloc();
    auto _retval = _cretval ? new graphene.plane.Plane(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Computes the distance of `p`oint from a #graphene_plane_t.
  
      Params:
        point = a #graphene_point3d_t
      Returns: the distance of the given #graphene_point3d_t from the plane
  */
  float distance(graphene.point3_d.Point3D point)
  {
    float _retval;
    _retval = graphene_plane_distance(cast(const(graphene_plane_t)*)this._cPtr, point ? cast(const(graphene_point3d_t)*)point._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether the two given #graphene_plane_t are equal.
  
      Params:
        b = a #graphene_plane_t
      Returns: `true` if the given planes are equal
  */
  bool equal(graphene.plane.Plane b)
  {
    bool _retval;
    _retval = cast(bool)graphene_plane_equal(cast(const(graphene_plane_t)*)this._cPtr, b ? cast(const(graphene_plane_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the distance along the normal vector of the
      given #graphene_plane_t from the origin.
      Returns: the constant value of the plane
  */
  float getConstant()
  {
    float _retval;
    _retval = graphene_plane_get_constant(cast(const(graphene_plane_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the normal vector pointing towards the origin of the
      given #graphene_plane_t.
  
      Params:
        normal = return location for the normal vector
  */
  void getNormal(out graphene.vec3.Vec3 normal)
  {
    graphene_vec3_t _normal;
    graphene_plane_get_normal(cast(const(graphene_plane_t)*)this._cPtr, &_normal);
    normal = new graphene.vec3.Vec3(cast(void*)&_normal, No.Take);
  }

  /**
      Initializes the given #graphene_plane_t using the given normal vector
      and constant values.
  
      Params:
        normal = a unit length normal vector defining the plane
            pointing towards the origin; if unset, we use the X axis by default
        constant = the distance from the origin to the plane along the
            normal vector; the sign determines the half-space occupied by the
            plane
      Returns: the initialized plane
  */
  graphene.plane.Plane init_(graphene.vec3.Vec3 normal, float constant)
  {
    graphene_plane_t* _cretval;
    _cretval = graphene_plane_init(cast(graphene_plane_t*)this._cPtr, normal ? cast(const(graphene_vec3_t)*)normal._cPtr(No.Dup) : null, constant);
    auto _retval = _cretval ? new graphene.plane.Plane(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_plane_t using the normal
      vector and constant of another #graphene_plane_t.
  
      Params:
        src = a #graphene_plane_t
      Returns: the initialized plane
  */
  graphene.plane.Plane initFromPlane(graphene.plane.Plane src)
  {
    graphene_plane_t* _cretval;
    _cretval = graphene_plane_init_from_plane(cast(graphene_plane_t*)this._cPtr, src ? cast(const(graphene_plane_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.plane.Plane(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_plane_t using the given normal vector
      and an arbitrary co-planar point.
  
      Params:
        normal = a normal vector defining the plane pointing towards the origin
        point = a #graphene_point3d_t
      Returns: the initialized plane
  */
  graphene.plane.Plane initFromPoint(graphene.vec3.Vec3 normal, graphene.point3_d.Point3D point)
  {
    graphene_plane_t* _cretval;
    _cretval = graphene_plane_init_from_point(cast(graphene_plane_t*)this._cPtr, normal ? cast(const(graphene_vec3_t)*)normal._cPtr(No.Dup) : null, point ? cast(const(graphene_point3d_t)*)point._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.plane.Plane(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_plane_t using the 3 provided co-planar
      points.
      
      The winding order is counter-clockwise, and determines which direction
      the normal vector will point.
  
      Params:
        a = a #graphene_point3d_t
        b = a #graphene_point3d_t
        c = a #graphene_point3d_t
      Returns: the initialized plane
  */
  graphene.plane.Plane initFromPoints(graphene.point3_d.Point3D a, graphene.point3_d.Point3D b, graphene.point3_d.Point3D c)
  {
    graphene_plane_t* _cretval;
    _cretval = graphene_plane_init_from_points(cast(graphene_plane_t*)this._cPtr, a ? cast(const(graphene_point3d_t)*)a._cPtr(No.Dup) : null, b ? cast(const(graphene_point3d_t)*)b._cPtr(No.Dup) : null, c ? cast(const(graphene_point3d_t)*)c._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.plane.Plane(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_plane_t using the components of
      the given #graphene_vec4_t vector.
  
      Params:
        src = a #graphene_vec4_t containing the normal vector in its first
            three components, and the distance in its fourth component
      Returns: the initialized plane
  */
  graphene.plane.Plane initFromVec4(graphene.vec4.Vec4 src)
  {
    graphene_plane_t* _cretval;
    _cretval = graphene_plane_init_from_vec4(cast(graphene_plane_t*)this._cPtr, src ? cast(const(graphene_vec4_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.plane.Plane(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Negates the normal vector and constant of a #graphene_plane_t, effectively
      mirroring the plane across the origin.
  
      Params:
        res = return location for the negated plane
  */
  void negate(out graphene.plane.Plane res)
  {
    graphene_plane_t _res;
    graphene_plane_negate(cast(const(graphene_plane_t)*)this._cPtr, &_res);
    res = new graphene.plane.Plane(cast(void*)&_res, No.Take);
  }

  /**
      Normalizes the vector of the given #graphene_plane_t,
      and adjusts the constant accordingly.
  
      Params:
        res = return location for the normalized plane
  */
  void normalize(out graphene.plane.Plane res)
  {
    graphene_plane_t _res;
    graphene_plane_normalize(cast(const(graphene_plane_t)*)this._cPtr, &_res);
    res = new graphene.plane.Plane(cast(void*)&_res, No.Take);
  }

  /**
      Transforms a #graphene_plane_t `p` using the given matrix
      and normal_matrix.
      
      If normal_matrix is null, a transformation matrix for the plane
      normal will be computed from matrix. If you are transforming
      multiple planes using the same matrix it's recommended to compute
      the normal matrix beforehand to avoid incurring in the cost of
      recomputing it every time.
  
      Params:
        matrix = a #graphene_matrix_t
        normalMatrix = a #graphene_matrix_t
        res = the transformed plane
  */
  void transform(graphene.matrix.Matrix matrix, graphene.matrix.Matrix normalMatrix, out graphene.plane.Plane res)
  {
    graphene_plane_t _res;
    graphene_plane_transform(cast(const(graphene_plane_t)*)this._cPtr, matrix ? cast(const(graphene_matrix_t)*)matrix._cPtr(No.Dup) : null, normalMatrix ? cast(const(graphene_matrix_t)*)normalMatrix._cPtr(No.Dup) : null, &_res);
    res = new graphene.plane.Plane(cast(void*)&_res, No.Take);
  }
}
