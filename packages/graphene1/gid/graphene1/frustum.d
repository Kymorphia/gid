/// Module for [Frustum] class
module gid.graphene1.frustum;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.graphene1.box;
import gid.graphene1.c.functions;
import gid.graphene1.c.types;
import gid.graphene1.matrix;
import gid.graphene1.plane;
import gid.graphene1.point3_d;
import gid.graphene1.sphere;
import gid.graphene1.types;

/**
    A 3D volume delimited by 2D clip planes.
    
    The contents of the [gid.graphene1.frustum.Frustum] are private, and should not be
    modified directly.
*/
@gidGir("Frustum")
class Frustum : gid.gobject2.boxed.BoxedWrap!(graphene_frustum_get_type)
{
  /**
      Create a `frustum.Frustum` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!graphene_frustum_t(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Frustum self() nothrow
  {
    return this;
  }

  /**
      Allocates a new #graphene_frustum_t structure.
      
      The contents of the returned structure are undefined.
      Returns: the newly allocated #graphene_frustum_t
          structure. Use [gid.graphene1.frustum.Frustum.free] to free the resources
          allocated by this function.
  */
  static gid.graphene1.frustum.Frustum alloc() nothrow
  {
    graphene_frustum_t* _cretval;
    _cretval = graphene_frustum_alloc();
    auto _retval = _cretval ? new gid.graphene1.frustum.Frustum(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks whether a point is inside the volume defined by the given
      #graphene_frustum_t.
  
      Params:
        point = a #graphene_point3d_t
      Returns: `true` if the point is inside the frustum
  */
  bool containsPoint(gid.graphene1.point3_d.Point3D point) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_frustum_contains_point(cast(const(graphene_frustum_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&point);
    return _retval;
  }

  /**
      Checks whether the two given #graphene_frustum_t are equal.
  
      Params:
        b = a #graphene_frustum_t
      Returns: `true` if the given frustums are equal
  */
  bool equal(gid.graphene1.frustum.Frustum b) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_frustum_equal(cast(const(graphene_frustum_t)*)this._cPtr, b ? cast(const(graphene_frustum_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the planes that define the given #graphene_frustum_t.
  
      Params:
        planes = return location for an array
            of 6 #graphene_plane_t
  */
  void getPlanes(out gid.graphene1.plane.Plane[] planes) nothrow
  {
    graphene_plane_t[] _planes;
    _planes.length = 6;
    graphene_frustum_get_planes(cast(const(graphene_frustum_t)*)this._cPtr, _planes.ptr);
    planes.length = 6;
    foreach (i; 0 .. 6)
      planes[i] = new gid.graphene1.plane.Plane(cast(void*)&_planes[i], No.Take);
  }

  /**
      Initializes the given #graphene_frustum_t using the provided
      clipping planes.
  
      Params:
        p0 = a clipping plane
        p1 = a clipping plane
        p2 = a clipping plane
        p3 = a clipping plane
        p4 = a clipping plane
        p5 = a clipping plane
      Returns: the initialized frustum
  */
  gid.graphene1.frustum.Frustum init_(gid.graphene1.plane.Plane p0, gid.graphene1.plane.Plane p1, gid.graphene1.plane.Plane p2, gid.graphene1.plane.Plane p3, gid.graphene1.plane.Plane p4, gid.graphene1.plane.Plane p5) nothrow
  {
    graphene_frustum_t* _cretval;
    _cretval = graphene_frustum_init(cast(graphene_frustum_t*)this._cPtr, p0 ? cast(const(graphene_plane_t)*)p0._cPtr(No.Dup) : null, p1 ? cast(const(graphene_plane_t)*)p1._cPtr(No.Dup) : null, p2 ? cast(const(graphene_plane_t)*)p2._cPtr(No.Dup) : null, p3 ? cast(const(graphene_plane_t)*)p3._cPtr(No.Dup) : null, p4 ? cast(const(graphene_plane_t)*)p4._cPtr(No.Dup) : null, p5 ? cast(const(graphene_plane_t)*)p5._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.graphene1.frustum.Frustum(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_frustum_t using the clipping
      planes of another #graphene_frustum_t.
  
      Params:
        src = a #graphene_frustum_t
      Returns: the initialized frustum
  */
  gid.graphene1.frustum.Frustum initFromFrustum(gid.graphene1.frustum.Frustum src) nothrow
  {
    graphene_frustum_t* _cretval;
    _cretval = graphene_frustum_init_from_frustum(cast(graphene_frustum_t*)this._cPtr, src ? cast(const(graphene_frustum_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.graphene1.frustum.Frustum(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_frustum_t using the given matrix.
  
      Params:
        matrix = a #graphene_matrix_t
      Returns: the initialized frustum
  */
  gid.graphene1.frustum.Frustum initFromMatrix(gid.graphene1.matrix.Matrix matrix) nothrow
  {
    graphene_frustum_t* _cretval;
    _cretval = graphene_frustum_init_from_matrix(cast(graphene_frustum_t*)this._cPtr, matrix ? cast(const(graphene_matrix_t)*)matrix._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.graphene1.frustum.Frustum(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks whether the given box intersects a plane of
      a #graphene_frustum_t.
  
      Params:
        box = a #graphene_box_t
      Returns: `true` if the box intersects the frustum
  */
  bool intersectsBox(gid.graphene1.box.Box box) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_frustum_intersects_box(cast(const(graphene_frustum_t)*)this._cPtr, box ? cast(const(graphene_box_t)*)box._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether the given sphere intersects a plane of
      a #graphene_frustum_t.
  
      Params:
        sphere = a #graphene_sphere_t
      Returns: `true` if the sphere intersects the frustum
  */
  bool intersectsSphere(gid.graphene1.sphere.Sphere sphere) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_frustum_intersects_sphere(cast(const(graphene_frustum_t)*)this._cPtr, sphere ? cast(const(graphene_sphere_t)*)sphere._cPtr(No.Dup) : null);
    return _retval;
  }
}
