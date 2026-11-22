/// Module for [Ray] class
module gid.graphene1.ray;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.graphene1.box;
import gid.graphene1.c.functions;
import gid.graphene1.c.types;
import gid.graphene1.plane;
import gid.graphene1.point3_d;
import gid.graphene1.sphere;
import gid.graphene1.triangle;
import gid.graphene1.types;
import gid.graphene1.vec3;

/**
    A ray emitted from an origin in a given direction.
    
    The contents of the [gid.graphene1.ray.Ray] structure are private, and should not
    be modified directly.
*/
class Ray : gid.gobject2.boxed.BoxedWrap!(graphene_ray_get_type)
{
  /**
      Create a `ray.Ray` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!graphene_ray_t(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Ray self() nothrow
  {
    return this;
  }

  /**
      Allocates a new #graphene_ray_t structure.
      
      The contents of the returned structure are undefined.
      Returns: the newly allocated #graphene_ray_t.
          Use [gid.graphene1.ray.Ray.free] to free the resources allocated by
          this function
  */
  static gid.graphene1.ray.Ray alloc() nothrow
  {
    graphene_ray_t* _cretval;
    _cretval = graphene_ray_alloc();
    auto _retval = _cretval ? new gid.graphene1.ray.Ray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks whether the two given #graphene_ray_t are equal.
  
      Params:
        b = a #graphene_ray_t
      Returns: `true` if the given rays are equal
  */
  bool equal(gid.graphene1.ray.Ray b) nothrow
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
  void getClosestPointToPoint(gid.graphene1.point3_d.Point3D p, out gid.graphene1.point3_d.Point3D res) nothrow
  {
    graphene_ray_get_closest_point_to_point(cast(const(graphene_ray_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&p, cast(graphene_point3d_t*)&res);
  }

  /**
      Retrieves the direction of the given #graphene_ray_t.
  
      Params:
        direction = return location for the direction
  */
  void getDirection(out gid.graphene1.vec3.Vec3 direction) nothrow
  {
    auto _direction = boxedNew!graphene_vec3_t(gid.graphene1.vec3.Vec3._getGType);
    graphene_ray_get_direction(cast(const(graphene_ray_t)*)this._cPtr, _direction);
    direction = new gid.graphene1.vec3.Vec3(cast(void*)_direction, Yes.Take);
  }

  /**
      Computes the distance of the origin of the given #graphene_ray_t from the
      given plane.
      
      If the ray does not intersect the plane, this function returns `INFINITY`.
  
      Params:
        p = a #graphene_plane_t
      Returns: the distance of the origin of the ray from the plane
  */
  float getDistanceToPlane(gid.graphene1.plane.Plane p) nothrow
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
  float getDistanceToPoint(gid.graphene1.point3_d.Point3D p) nothrow
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
  void getOrigin(out gid.graphene1.point3_d.Point3D origin) nothrow
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
  void getPositionAt(float t, out gid.graphene1.point3_d.Point3D position) nothrow
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
  gid.graphene1.ray.Ray init_(gid.graphene1.point3_d.Point3D* origin = null, gid.graphene1.vec3.Vec3 direction = null) nothrow
  {
    graphene_ray_t* _cretval;
    _cretval = graphene_ray_init(cast(graphene_ray_t*)this._cPtr, cast(const(graphene_point3d_t)*)origin, direction ? cast(const(graphene_vec3_t)*)direction._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.graphene1.ray.Ray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_ray_t using the origin and direction
      values of another #graphene_ray_t.
  
      Params:
        src = a #graphene_ray_t
      Returns: the initialized ray
  */
  gid.graphene1.ray.Ray initFromRay(gid.graphene1.ray.Ray src) nothrow
  {
    graphene_ray_t* _cretval;
    _cretval = graphene_ray_init_from_ray(cast(graphene_ray_t*)this._cPtr, src ? cast(const(graphene_ray_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.graphene1.ray.Ray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_ray_t using the given vectors.
  
      Params:
        origin = a #graphene_vec3_t
        direction = a #graphene_vec3_t
      Returns: the initialized ray
  */
  gid.graphene1.ray.Ray initFromVec3(gid.graphene1.vec3.Vec3 origin = null, gid.graphene1.vec3.Vec3 direction = null) nothrow
  {
    graphene_ray_t* _cretval;
    _cretval = graphene_ray_init_from_vec3(cast(graphene_ray_t*)this._cPtr, origin ? cast(const(graphene_vec3_t)*)origin._cPtr(No.Dup) : null, direction ? cast(const(graphene_vec3_t)*)direction._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.graphene1.ray.Ray(cast(void*)_cretval, No.Take) : null;
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
  gid.graphene1.types.RayIntersectionKind intersectBox(gid.graphene1.box.Box b, out float tOut) nothrow
  {
    graphene_ray_intersection_kind_t _cretval;
    _cretval = graphene_ray_intersect_box(cast(const(graphene_ray_t)*)this._cPtr, b ? cast(const(graphene_box_t)*)b._cPtr(No.Dup) : null, cast(float*)&tOut);
    gid.graphene1.types.RayIntersectionKind _retval = cast(gid.graphene1.types.RayIntersectionKind)_cretval;
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
  gid.graphene1.types.RayIntersectionKind intersectSphere(gid.graphene1.sphere.Sphere s, out float tOut) nothrow
  {
    graphene_ray_intersection_kind_t _cretval;
    _cretval = graphene_ray_intersect_sphere(cast(const(graphene_ray_t)*)this._cPtr, s ? cast(const(graphene_sphere_t)*)s._cPtr(No.Dup) : null, cast(float*)&tOut);
    gid.graphene1.types.RayIntersectionKind _retval = cast(gid.graphene1.types.RayIntersectionKind)_cretval;
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
  gid.graphene1.types.RayIntersectionKind intersectTriangle(gid.graphene1.triangle.Triangle t, out float tOut) nothrow
  {
    graphene_ray_intersection_kind_t _cretval;
    _cretval = graphene_ray_intersect_triangle(cast(const(graphene_ray_t)*)this._cPtr, t ? cast(const(graphene_triangle_t)*)t._cPtr(No.Dup) : null, cast(float*)&tOut);
    gid.graphene1.types.RayIntersectionKind _retval = cast(gid.graphene1.types.RayIntersectionKind)_cretval;
    return _retval;
  }

  /**
      Checks whether the given #graphene_ray_t `r` intersects the
      given #graphene_box_t `b`.
      
      See also: [gid.graphene1.ray.Ray.intersectBox]
  
      Params:
        b = a #graphene_box_t
      Returns: `true` if the ray intersects the box
  */
  bool intersectsBox(gid.graphene1.box.Box b) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_ray_intersects_box(cast(const(graphene_ray_t)*)this._cPtr, b ? cast(const(graphene_box_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if the given #graphene_ray_t `r` intersects the
      given #graphene_sphere_t `s`.
      
      See also: [gid.graphene1.ray.Ray.intersectSphere]
  
      Params:
        s = a #graphene_sphere_t
      Returns: `true` if the ray intersects the sphere
  */
  bool intersectsSphere(gid.graphene1.sphere.Sphere s) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_ray_intersects_sphere(cast(const(graphene_ray_t)*)this._cPtr, s ? cast(const(graphene_sphere_t)*)s._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether the given #graphene_ray_t `r` intersects the
      given #graphene_triangle_t b.
      
      See also: [gid.graphene1.ray.Ray.intersectTriangle]
  
      Params:
        t = a #graphene_triangle_t
      Returns: `true` if the ray intersects the triangle
  */
  bool intersectsTriangle(gid.graphene1.triangle.Triangle t) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_ray_intersects_triangle(cast(const(graphene_ray_t)*)this._cPtr, t ? cast(const(graphene_triangle_t)*)t._cPtr(No.Dup) : null);
    return _retval;
  }
}
