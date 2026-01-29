/// Module for [Triangle] class
module graphene.triangle;

import gid.gid;
import gobject.boxed;
import graphene.box;
import graphene.c.functions;
import graphene.c.types;
import graphene.plane;
import graphene.point3_d;
import graphene.types;
import graphene.vec2;
import graphene.vec3;

/**
    A triangle.
*/
class Triangle : gobject.boxed.Boxed
{

  /**
      Create a `triangle.Triangle` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_triangle_t.sizeof), Yes.Take);
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
    return cast(void function())graphene_triangle_get_type != &gidSymbolNotFound ? graphene_triangle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Triangle self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_triangle_t.
      
      The contents of the returned structure are undefined.
      Returns: the newly allocated #graphene_triangle_t
          structure. Use [graphene.triangle.Triangle.free] to free the resources
          allocated by this function
  */
  static graphene.triangle.Triangle alloc()
  {
    graphene_triangle_t* _cretval;
    _cretval = graphene_triangle_alloc();
    auto _retval = _cretval ? new graphene.triangle.Triangle(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks whether the given triangle `t` contains the point `p`.
  
      Params:
        p = a #graphene_point3d_t
      Returns: `true` if the point is inside the triangle
  */
  bool containsPoint(graphene.point3_d.Point3D p)
  {
    bool _retval;
    _retval = cast(bool)graphene_triangle_contains_point(cast(const(graphene_triangle_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&p);
    return _retval;
  }

  /**
      Checks whether the two given #graphene_triangle_t are equal.
  
      Params:
        b = a #graphene_triangle_t
      Returns: `true` if the triangles are equal
  */
  bool equal(graphene.triangle.Triangle b)
  {
    bool _retval;
    _retval = cast(bool)graphene_triangle_equal(cast(const(graphene_triangle_t)*)this._cPtr, b ? cast(const(graphene_triangle_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Computes the area of the given #graphene_triangle_t.
      Returns: the area of the triangle
  */
  float getArea()
  {
    float _retval;
    _retval = graphene_triangle_get_area(cast(const(graphene_triangle_t)*)this._cPtr);
    return _retval;
  }

  /**
      Computes the [barycentric coordinates](http://en.wikipedia.org/wiki/Barycentric_coordinate_system)
      of the given point `p`.
      
      The point `p` must lie on the same plane as the triangle `t`; if the
      point is not coplanar, the result of this function is undefined.
      
      If we place the origin in the coordinates of the triangle's A point,
      the barycentric coordinates are `u`, which is on the AC vector; and `v`
      which is on the AB vector:
      
      ![](triangle-barycentric.png)
      
      The returned #graphene_vec2_t contains the following values, in order:
      
       $(LIST
          * `res.x = u`
          * `res.y = v`
       )
  
      Params:
        p = a #graphene_point3d_t
        res = return location for the vector
            with the barycentric coordinates
      Returns: `true` if the barycentric coordinates are valid
  */
  bool getBarycoords(graphene.point3_d.Point3D p, out graphene.vec2.Vec2 res)
  {
    bool _retval;
    graphene_vec2_t _res;
    _retval = cast(bool)graphene_triangle_get_barycoords(cast(const(graphene_triangle_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&p, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
    return _retval;
  }

  /**
      Computes the bounding box of the given #graphene_triangle_t.
  
      Params:
        res = return location for the box
  */
  void getBoundingBox(out graphene.box.Box res)
  {
    graphene_box_t _res;
    graphene_triangle_get_bounding_box(cast(const(graphene_triangle_t)*)this._cPtr, &_res);
    res = new graphene.box.Box(cast(void*)&_res, No.Take);
  }

  /**
      Computes the coordinates of the midpoint of the given #graphene_triangle_t.
      
      The midpoint G is the [centroid](https://en.wikipedia.org/wiki/Centroid#Triangle_centroid)
      of the triangle, i.e. the intersection of its medians.
  
      Params:
        res = return location for the coordinates of
            the midpoint
  */
  void getMidpoint(out graphene.point3_d.Point3D res)
  {
    graphene_triangle_get_midpoint(cast(const(graphene_triangle_t)*)this._cPtr, cast(graphene_point3d_t*)&res);
  }

  /**
      Computes the normal vector of the given #graphene_triangle_t.
  
      Params:
        res = return location for the normal vector
  */
  void getNormal(out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_triangle_get_normal(cast(const(graphene_triangle_t)*)this._cPtr, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Computes the plane based on the vertices of the given #graphene_triangle_t.
  
      Params:
        res = return location for the plane
  */
  void getPlane(out graphene.plane.Plane res)
  {
    graphene_plane_t _res;
    graphene_triangle_get_plane(cast(const(graphene_triangle_t)*)this._cPtr, &_res);
    res = new graphene.plane.Plane(cast(void*)&_res, No.Take);
  }

  /**
      Retrieves the three vertices of the given #graphene_triangle_t and returns
      their coordinates as #graphene_point3d_t.
  
      Params:
        a = return location for the coordinates
            of the first vertex
        b = return location for the coordinates
            of the second vertex
        c = return location for the coordinates
            of the third vertex
  */
  void getPoints(out graphene.point3_d.Point3D a, out graphene.point3_d.Point3D b, out graphene.point3_d.Point3D c)
  {
    graphene_triangle_get_points(cast(const(graphene_triangle_t)*)this._cPtr, cast(graphene_point3d_t*)&a, cast(graphene_point3d_t*)&b, cast(graphene_point3d_t*)&c);
  }

  /**
      Computes the UV coordinates of the given point `p`.
      
      The point `p` must lie on the same plane as the triangle `t`; if the point
      is not coplanar, the result of this function is undefined. If `p` is null,
      the point will be set in (0, 0, 0).
      
      The UV coordinates will be placed in the res vector:
      
       $(LIST
          * `res.x = u`
          * `res.y = v`
       )
         
      See also: [graphene.triangle.Triangle.getBarycoords]
  
      Params:
        p = a #graphene_point3d_t
        uvA = the UV coordinates of the first point
        uvB = the UV coordinates of the second point
        uvC = the UV coordinates of the third point
        res = a vector containing the UV coordinates
            of the given point `p`
      Returns: `true` if the coordinates are valid
  */
  bool getUv(graphene.point3_d.Point3D p, graphene.vec2.Vec2 uvA, graphene.vec2.Vec2 uvB, graphene.vec2.Vec2 uvC, out graphene.vec2.Vec2 res)
  {
    bool _retval;
    graphene_vec2_t _res;
    _retval = cast(bool)graphene_triangle_get_uv(cast(const(graphene_triangle_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&p, uvA ? cast(const(graphene_vec2_t)*)uvA._cPtr(No.Dup) : null, uvB ? cast(const(graphene_vec2_t)*)uvB._cPtr(No.Dup) : null, uvC ? cast(const(graphene_vec2_t)*)uvC._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec2.Vec2(cast(void*)&_res, No.Take);
    return _retval;
  }

  /**
      Retrieves the three vertices of the given #graphene_triangle_t.
  
      Params:
        a = return location for the first vertex
        b = return location for the second vertex
        c = return location for the third vertex
  */
  void getVertices(out graphene.vec3.Vec3 a, out graphene.vec3.Vec3 b, out graphene.vec3.Vec3 c)
  {
    graphene_vec3_t _a;
    graphene_vec3_t _b;
    graphene_vec3_t _c;
    graphene_triangle_get_vertices(cast(const(graphene_triangle_t)*)this._cPtr, &_a, &_b, &_c);
    a = new graphene.vec3.Vec3(cast(void*)&_a, No.Take);
    b = new graphene.vec3.Vec3(cast(void*)&_b, No.Take);
    c = new graphene.vec3.Vec3(cast(void*)&_c, No.Take);
  }

  /**
      Initializes a #graphene_triangle_t using the three given arrays
      of floating point values, each representing the coordinates of
      a point in 3D space.
  
      Params:
        a = an array of 3 floating point values
        b = an array of 3 floating point values
        c = an array of 3 floating point values
      Returns: the initialized #graphene_triangle_t
  */
  graphene.triangle.Triangle initFromFloat(float[] a, float[] b, float[] c)
  {
    graphene_triangle_t* _cretval;
    assert(!a || a.length == 3);
    auto _a = cast(const(float)*)a.ptr;
    assert(!b || b.length == 3);
    auto _b = cast(const(float)*)b.ptr;
    assert(!c || c.length == 3);
    auto _c = cast(const(float)*)c.ptr;
    _cretval = graphene_triangle_init_from_float(cast(graphene_triangle_t*)this._cPtr, _a, _b, _c);
    auto _retval = _cretval ? new graphene.triangle.Triangle(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_triangle_t using the three given 3D points.
  
      Params:
        a = a #graphene_point3d_t
        b = a #graphene_point3d_t
        c = a #graphene_point3d_t
      Returns: the initialized #graphene_triangle_t
  */
  graphene.triangle.Triangle initFromPoint3d(graphene.point3_d.Point3D a, graphene.point3_d.Point3D b, graphene.point3_d.Point3D c)
  {
    graphene_triangle_t* _cretval;
    _cretval = graphene_triangle_init_from_point3d(cast(graphene_triangle_t*)this._cPtr, cast(const(graphene_point3d_t)*)&a, cast(const(graphene_point3d_t)*)&b, cast(const(graphene_point3d_t)*)&c);
    auto _retval = _cretval ? new graphene.triangle.Triangle(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_triangle_t using the three given vectors.
  
      Params:
        a = a #graphene_vec3_t
        b = a #graphene_vec3_t
        c = a #graphene_vec3_t
      Returns: the initialized #graphene_triangle_t
  */
  graphene.triangle.Triangle initFromVec3(graphene.vec3.Vec3 a = null, graphene.vec3.Vec3 b = null, graphene.vec3.Vec3 c = null)
  {
    graphene_triangle_t* _cretval;
    _cretval = graphene_triangle_init_from_vec3(cast(graphene_triangle_t*)this._cPtr, a ? cast(const(graphene_vec3_t)*)a._cPtr(No.Dup) : null, b ? cast(const(graphene_vec3_t)*)b._cPtr(No.Dup) : null, c ? cast(const(graphene_vec3_t)*)c._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.triangle.Triangle(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
