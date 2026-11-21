/// Module for [Sphere] class
module gid.graphene1.sphere;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.graphene1.box;
import gid.graphene1.c.functions;
import gid.graphene1.c.types;
import gid.graphene1.point3_d;
import gid.graphene1.types;
import gid.graphene1.vec3;

/**
    A sphere, represented by its center and radius.
*/
class Sphere : gid.gobject2.boxed.BoxedWrap!(graphene_sphere_get_type)
{
  /**
      Create a `sphere.Sphere` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!graphene_sphere_t(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Sphere self() nothrow
  {
    return this;
  }

  /**
      Allocates a new #graphene_sphere_t.
      
      The contents of the newly allocated structure are undefined.
      Returns: the newly allocated #graphene_sphere_t. Use
          [gid.graphene1.sphere.Sphere.free] to free the resources allocated by this function
  */
  static gid.graphene1.sphere.Sphere alloc() nothrow
  {
    graphene_sphere_t* _cretval;
    _cretval = graphene_sphere_alloc();
    auto _retval = _cretval ? new gid.graphene1.sphere.Sphere(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks whether the given point is contained in the volume
      of a #graphene_sphere_t.
  
      Params:
        point = a #graphene_point3d_t
      Returns: `true` if the sphere contains the point
  */
  bool containsPoint(gid.graphene1.point3_d.Point3D point) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_sphere_contains_point(cast(const(graphene_sphere_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&point);
    return _retval;
  }

  /**
      Computes the distance of the given point from the surface of
      a #graphene_sphere_t.
  
      Params:
        point = a #graphene_point3d_t
      Returns: the distance of the point
  */
  float distance(gid.graphene1.point3_d.Point3D point) nothrow
  {
    float _retval;
    _retval = graphene_sphere_distance(cast(const(graphene_sphere_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&point);
    return _retval;
  }

  /**
      Checks whether two #graphene_sphere_t are equal.
  
      Params:
        b = a #graphene_sphere_t
      Returns: `true` if the spheres are equal
  */
  bool equal(gid.graphene1.sphere.Sphere b) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_sphere_equal(cast(const(graphene_sphere_t)*)this._cPtr, b ? cast(const(graphene_sphere_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Computes the bounding box capable of containing the
      given #graphene_sphere_t.
  
      Params:
        box = return location for the bounding box
  */
  void getBoundingBox(out gid.graphene1.box.Box box) nothrow
  {
    auto _box = boxedNew!graphene_box_t(gid.graphene1.box.Box._getGType);
    graphene_sphere_get_bounding_box(cast(const(graphene_sphere_t)*)this._cPtr, _box);
    box = new gid.graphene1.box.Box(cast(void*)_box, Yes.Take);
  }

  /**
      Retrieves the coordinates of the center of a #graphene_sphere_t.
  
      Params:
        center = return location for the coordinates of
            the center
  */
  void getCenter(out gid.graphene1.point3_d.Point3D center) nothrow
  {
    graphene_sphere_get_center(cast(const(graphene_sphere_t)*)this._cPtr, cast(graphene_point3d_t*)&center);
  }

  /**
      Retrieves the radius of a #graphene_sphere_t.
      Returns: 
  */
  float getRadius() nothrow
  {
    float _retval;
    _retval = graphene_sphere_get_radius(cast(const(graphene_sphere_t)*)this._cPtr);
    return _retval;
  }

  /**
      Initializes the given #graphene_sphere_t with the given center and radius.
  
      Params:
        center = the coordinates of the center of the sphere, or null
            for a center in (0, 0, 0)
        radius = the radius of the sphere
      Returns: the initialized #graphene_sphere_t
  */
  gid.graphene1.sphere.Sphere init_(gid.graphene1.point3_d.Point3D* center, float radius) nothrow
  {
    graphene_sphere_t* _cretval;
    _cretval = graphene_sphere_init(cast(graphene_sphere_t*)this._cPtr, cast(const(graphene_point3d_t)*)center, radius);
    auto _retval = _cretval ? new gid.graphene1.sphere.Sphere(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_sphere_t using the given array
      of 3D coordinates so that the sphere includes them.
      
      The center of the sphere can either be specified, or will be center
      of the 3D volume that encompasses all points.
  
      Params:
        points = an array of #graphene_point3d_t
        center = the center of the sphere
      Returns: the initialized #graphene_sphere_t
  */
  gid.graphene1.sphere.Sphere initFromPoints(gid.graphene1.point3_d.Point3D[] points, gid.graphene1.point3_d.Point3D* center = null) nothrow
  {
    graphene_sphere_t* _cretval;
    uint _nPoints;
    if (points)
      _nPoints = cast(uint)points.length;

    auto _points = cast(graphene_point3d_t*)points.ptr;
    _cretval = graphene_sphere_init_from_points(cast(graphene_sphere_t*)this._cPtr, _nPoints, _points, cast(const(graphene_point3d_t)*)center);
    auto _retval = _cretval ? new gid.graphene1.sphere.Sphere(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_sphere_t using the given array
      of 3D coordinates so that the sphere includes them.
      
      The center of the sphere can either be specified, or will be center
      of the 3D volume that encompasses all vectors.
  
      Params:
        vectors = an array of #graphene_vec3_t
        center = the center of the sphere
      Returns: the initialized #graphene_sphere_t
  */
  gid.graphene1.sphere.Sphere initFromVectors(gid.graphene1.vec3.Vec3[] vectors, gid.graphene1.point3_d.Point3D* center = null) nothrow
  {
    graphene_sphere_t* _cretval;
    uint _nVectors;
    if (vectors)
      _nVectors = cast(uint)vectors.length;

    auto _vectors_arr = new graphene_vec3_t[](vectors.length);
    auto _vectors = _vectors_arr.ptr;
    foreach (i, obj; vectors) _vectors[i] = obj ? *cast(graphene_vec3_t*)obj._cPtr(No.Dup) : graphene_vec3_t.init;
    _cretval = graphene_sphere_init_from_vectors(cast(graphene_sphere_t*)this._cPtr, _nVectors, _vectors, cast(const(graphene_point3d_t)*)center);
    auto _retval = _cretval ? new gid.graphene1.sphere.Sphere(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks whether the sphere has a zero radius.
      Returns: `true` if the sphere is empty
  */
  bool isEmpty() nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_sphere_is_empty(cast(const(graphene_sphere_t)*)this._cPtr);
    return _retval;
  }

  /**
      Translates the center of the given #graphene_sphere_t using the point
      coordinates as the delta of the translation.
  
      Params:
        point = the coordinates of the translation
        res = return location for the translated sphere
  */
  void translate(gid.graphene1.point3_d.Point3D point, out gid.graphene1.sphere.Sphere res) nothrow
  {
    auto _res = boxedNew!graphene_sphere_t(gid.graphene1.sphere.Sphere._getGType);
    graphene_sphere_translate(cast(const(graphene_sphere_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&point, _res);
    res = new gid.graphene1.sphere.Sphere(cast(void*)_res, Yes.Take);
  }
}
