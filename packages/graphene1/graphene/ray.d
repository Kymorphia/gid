/// Module for [Ray] class
module graphene.ray;

import gid.gid;
import gobject.boxed;
import graphene.box;
import graphene.c.functions;
import graphene.c.types;
import graphene.plane;
import graphene.point3_d;
import graphene.sphere;
import graphene.triangle;
import graphene.types;
import graphene.vec3;

/**
    A ray emitted from an origin in a given direction.
    
    The contents of the [graphene.ray.Ray] structure are private, and should not
    be modified directly.
*/
class Ray : gobject.boxed.Boxed
{

  /**
      Create a `ray.Ray` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_ray_t.sizeof), Yes.Take);
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
    return cast(void function())graphene_ray_get_type != &gidSymbolNotFound ? graphene_ray_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Ray self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_ray_t structure.
      
      The contents of the returned structure are undefined.
      Returns: the newly allocated #graphene_ray_t.
          Use [graphene.ray.Ray.free] to free the resources allocated by
          this function
  */
  static graphene.ray.Ray alloc()
  {
    graphene_ray_t* _cretval;
    _cretval = graphene_ray_alloc();
    auto _retval = _cretval ? new graphene.ray.Ray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks whether the two given #graphene_ray_t are equal.
  
      Params:
        b = a #graphene_ray_t
      Returns: `true` if the given rays are equal
  */
  bool equal(graphene.ray.Ray b)
  {
    bool _retval;
    _retval = cast(bool)graphene_ray_equal(cast(const(graphene_ray_t)*)this._cPtr, b ? cast(const(graphene_ray_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Computes the point on the given #graphene_ray_t that is closest to the
      given point `p`.
  
      Params:
        p = a #graphene_point3d_t
        res = return location for the closest point3d
  */
  void getClosestPointToPoint(graphene.point3_d.Point3D p, out graphene.point3_d.Point3D res)
  {
    graphene_ray_get_closest_point_to_point(cast(const(graphene_ray_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&p, cast(graphene_point3d_t*)&res);
  }

  /**
      Retrieves the direction of the given #graphene_ray_t.
  
      Params:
        direction = return location for the direction
  */
  void getDirection(out graphene.vec3.Vec3 direction)
  {
    graphene_vec3_t _direction;
    graphene_ray_get_direction(cast(const(graphene_ray_t)*)this._cPtr, &_direction);
    direction = new graphene.vec3.Vec3(cast(void*)&_direction, No.Take);
  }

  /**
      Computes the distance of the origin of the given #graphene_ray_t from the
      given plane.
      
      If the ray does not intersect the plane, this function returns `INFINITY`.
  
      Params:
        p = a #graphene_plane_t
      Returns: the distance of the origin of the ray from the plane
  */
  float getDistanceToPlane(graphene.plane.Plane p)
  {
    float _retval;
    _retval = graphene_ray_get_distance_to_plane(cast(const(graphene_ray_t)*)this._cPtr, p ? cast(const(graphene_plane_t)*)p._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Computes the distance of the closest approach between the
      given #graphene_ray_t `r` and the point `p`.
      
      The closest approach to a ray from a point is the distance
      between the point and the projection of the point on the
      ray itself.
  
      Params:
        p = a #graphene_point3d_t
      Returns: the distance of the point
  */
  float getDistanceToPoint(graphene.point3_d.Point3D p)
  {
    float _retval;
    _retval = graphene_ray_get_distance_to_point(cast(const(graphene_ray_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&p);
    return _retval;
  }

  /**
      Retrieves the origin of the given #graphene_ray_t.
  
      Params:
        origin = return location for the origin
  */
  void getOrigin(out graphene.point3_d.Point3D origin)
  {
    graphene_ray_get_origin(cast(const(graphene_ray_t)*)this._cPtr, cast(graphene_point3d_t*)&origin);
  }

  /**
      Retrieves the coordinates of a point at the distance `t` along the
      given #graphene_ray_t.
  
      Params:
        t = the distance along the ray
        position = return location for the position
  */
  void getPositionAt(float t, out graphene.point3_d.Point3D position)
  {
    graphene_ray_get_position_at(cast(const(graphene_ray_t)*)this._cPtr, t, cast(graphene_point3d_t*)&position);
  }

  /**
      Initializes the given #graphene_ray_t using the given origin
      and direction values.
  
      Params:
        origin = the origin of the ray
        direction = the direction vector
      Returns: the initialized ray
  */
  graphene.ray.Ray init_(graphene.point3_d.Point3D origin, graphene.vec3.Vec3 direction = null)
  {
    graphene_ray_t* _cretval;
    _cretval = graphene_ray_init(cast(graphene_ray_t*)this._cPtr, cast(const(graphene_point3d_t)*)&origin, direction ? cast(const(graphene_vec3_t)*)direction._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.ray.Ray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_ray_t using the origin and direction
      values of another #graphene_ray_t.
  
      Params:
        src = a #graphene_ray_t
      Returns: the initialized ray
  */
  graphene.ray.Ray initFromRay(graphene.ray.Ray src)
  {
    graphene_ray_t* _cretval;
    _cretval = graphene_ray_init_from_ray(cast(graphene_ray_t*)this._cPtr, src ? cast(const(graphene_ray_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.ray.Ray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_ray_t using the given vectors.
  
      Params:
        origin = a #graphene_vec3_t
        direction = a #graphene_vec3_t
      Returns: the initialized ray
  */
  graphene.ray.Ray initFromVec3(graphene.vec3.Vec3 origin = null, graphene.vec3.Vec3 direction = null)
  {
    graphene_ray_t* _cretval;
    _cretval = graphene_ray_init_from_vec3(cast(graphene_ray_t*)this._cPtr, origin ? cast(const(graphene_vec3_t)*)origin._cPtr(No.Dup) : null, direction ? cast(const(graphene_vec3_t)*)direction._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.ray.Ray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Intersects the given #graphene_ray_t `r` with the given
      #graphene_box_t `b`.
  
      Params:
        b = a #graphene_box_t
        tOut = the distance of the point on the ray that intersects the box
      Returns: the type of intersection
  */
  graphene.types.RayIntersectionKind intersectBox(graphene.box.Box b, out float tOut)
  {
    graphene_ray_intersection_kind_t _cretval;
    _cretval = graphene_ray_intersect_box(cast(const(graphene_ray_t)*)this._cPtr, b ? cast(const(graphene_box_t)*)b._cPtr(No.Dup) : null, cast(float*)&tOut);
    graphene.types.RayIntersectionKind _retval = cast(graphene.types.RayIntersectionKind)_cretval;
    return _retval;
  }

  /**
      Intersects the given #graphene_ray_t `r` with the given
      #graphene_sphere_t `s`.
  
      Params:
        s = a #graphene_sphere_t
        tOut = the distance of the point on the ray that intersects the sphere
      Returns: the type of intersection
  */
  graphene.types.RayIntersectionKind intersectSphere(graphene.sphere.Sphere s, out float tOut)
  {
    graphene_ray_intersection_kind_t _cretval;
    _cretval = graphene_ray_intersect_sphere(cast(const(graphene_ray_t)*)this._cPtr, s ? cast(const(graphene_sphere_t)*)s._cPtr(No.Dup) : null, cast(float*)&tOut);
    graphene.types.RayIntersectionKind _retval = cast(graphene.types.RayIntersectionKind)_cretval;
    return _retval;
  }

  /**
      Intersects the given #graphene_ray_t `r` with the given
      #graphene_triangle_t `t`.
  
      Params:
        t = a #graphene_triangle_t
        tOut = the distance of the point on the ray that intersects the triangle
      Returns: the type of intersection
  */
  graphene.types.RayIntersectionKind intersectTriangle(graphene.triangle.Triangle t, out float tOut)
  {
    graphene_ray_intersection_kind_t _cretval;
    _cretval = graphene_ray_intersect_triangle(cast(const(graphene_ray_t)*)this._cPtr, t ? cast(const(graphene_triangle_t)*)t._cPtr(No.Dup) : null, cast(float*)&tOut);
    graphene.types.RayIntersectionKind _retval = cast(graphene.types.RayIntersectionKind)_cretval;
    return _retval;
  }

  /**
      Checks whether the given #graphene_ray_t `r` intersects the
      given #graphene_box_t `b`.
      
      See also: [graphene.ray.Ray.intersectBox]
  
      Params:
        b = a #graphene_box_t
      Returns: `true` if the ray intersects the box
  */
  bool intersectsBox(graphene.box.Box b)
  {
    bool _retval;
    _retval = cast(bool)graphene_ray_intersects_box(cast(const(graphene_ray_t)*)this._cPtr, b ? cast(const(graphene_box_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if the given #graphene_ray_t `r` intersects the
      given #graphene_sphere_t `s`.
      
      See also: [graphene.ray.Ray.intersectSphere]
  
      Params:
        s = a #graphene_sphere_t
      Returns: `true` if the ray intersects the sphere
  */
  bool intersectsSphere(graphene.sphere.Sphere s)
  {
    bool _retval;
    _retval = cast(bool)graphene_ray_intersects_sphere(cast(const(graphene_ray_t)*)this._cPtr, s ? cast(const(graphene_sphere_t)*)s._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether the given #graphene_ray_t `r` intersects the
      given #graphene_triangle_t b.
      
      See also: [graphene.ray.Ray.intersectTriangle]
  
      Params:
        t = a #graphene_triangle_t
      Returns: `true` if the ray intersects the triangle
  */
  bool intersectsTriangle(graphene.triangle.Triangle t)
  {
    bool _retval;
    _retval = cast(bool)graphene_ray_intersects_triangle(cast(const(graphene_ray_t)*)this._cPtr, t ? cast(const(graphene_triangle_t)*)t._cPtr(No.Dup) : null);
    return _retval;
  }
}
