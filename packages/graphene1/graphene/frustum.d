/// Module for [Frustum] class
module graphene.frustum;

import gid.gid;
import gobject.boxed;
import graphene.box;
import graphene.c.functions;
import graphene.c.types;
import graphene.matrix;
import graphene.plane;
import graphene.point3_d;
import graphene.sphere;
import graphene.types;

/**
    A 3D volume delimited by 2D clip planes.
    
    The contents of the [graphene.frustum.Frustum] are private, and should not be
    modified directly.
*/
class Frustum : gobject.boxed.Boxed
{

  /**
      Create a `frustum.Frustum` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_frustum_t.sizeof), Yes.Take);
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
    return cast(void function())graphene_frustum_get_type != &gidSymbolNotFound ? graphene_frustum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Frustum self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_frustum_t structure.
      
      The contents of the returned structure are undefined.
      Returns: the newly allocated #graphene_frustum_t
          structure. Use [graphene.frustum.Frustum.free] to free the resources
          allocated by this function.
  */
  static graphene.frustum.Frustum alloc()
  {
    graphene_frustum_t* _cretval;
    _cretval = graphene_frustum_alloc();
    auto _retval = _cretval ? new graphene.frustum.Frustum(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks whether a point is inside the volume defined by the given
      #graphene_frustum_t.
  
      Params:
        point = a #graphene_point3d_t
      Returns: `true` if the point is inside the frustum
  */
  bool containsPoint(graphene.point3_d.Point3D point)
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
  bool equal(graphene.frustum.Frustum b)
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
  void getPlanes(ref graphene.plane.Plane[] planes)
  {
    graphene_plane_t[] _planes;
    _planes.length = 6;
    graphene_frustum_get_planes(cast(const(graphene_frustum_t)*)this._cPtr, _planes.ptr);
    planes.length = 6;
    foreach (i; 0 .. 6)
      planes[i] = new graphene.plane.Plane(cast(void*)&_planes[i], No.Take);
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
  graphene.frustum.Frustum init_(graphene.plane.Plane p0, graphene.plane.Plane p1, graphene.plane.Plane p2, graphene.plane.Plane p3, graphene.plane.Plane p4, graphene.plane.Plane p5)
  {
    graphene_frustum_t* _cretval;
    _cretval = graphene_frustum_init(cast(graphene_frustum_t*)this._cPtr, p0 ? cast(const(graphene_plane_t)*)p0._cPtr(No.Dup) : null, p1 ? cast(const(graphene_plane_t)*)p1._cPtr(No.Dup) : null, p2 ? cast(const(graphene_plane_t)*)p2._cPtr(No.Dup) : null, p3 ? cast(const(graphene_plane_t)*)p3._cPtr(No.Dup) : null, p4 ? cast(const(graphene_plane_t)*)p4._cPtr(No.Dup) : null, p5 ? cast(const(graphene_plane_t)*)p5._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.frustum.Frustum(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_frustum_t using the clipping
      planes of another #graphene_frustum_t.
  
      Params:
        src = a #graphene_frustum_t
      Returns: the initialized frustum
  */
  graphene.frustum.Frustum initFromFrustum(graphene.frustum.Frustum src)
  {
    graphene_frustum_t* _cretval;
    _cretval = graphene_frustum_init_from_frustum(cast(graphene_frustum_t*)this._cPtr, src ? cast(const(graphene_frustum_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.frustum.Frustum(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_frustum_t using the given matrix.
  
      Params:
        matrix = a #graphene_matrix_t
      Returns: the initialized frustum
  */
  graphene.frustum.Frustum initFromMatrix(graphene.matrix.Matrix matrix)
  {
    graphene_frustum_t* _cretval;
    _cretval = graphene_frustum_init_from_matrix(cast(graphene_frustum_t*)this._cPtr, matrix ? cast(const(graphene_matrix_t)*)matrix._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.frustum.Frustum(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks whether the given box intersects a plane of
      a #graphene_frustum_t.
  
      Params:
        box = a #graphene_box_t
      Returns: `true` if the box intersects the frustum
  */
  bool intersectsBox(graphene.box.Box box)
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
  bool intersectsSphere(graphene.sphere.Sphere sphere)
  {
    bool _retval;
    _retval = cast(bool)graphene_frustum_intersects_sphere(cast(const(graphene_frustum_t)*)this._cPtr, sphere ? cast(const(graphene_sphere_t)*)sphere._cPtr(No.Dup) : null);
    return _retval;
  }
}
