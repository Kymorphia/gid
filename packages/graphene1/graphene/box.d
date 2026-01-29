/// Module for [Box] class
module graphene.box;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.point3_d;
import graphene.sphere;
import graphene.types;
import graphene.vec3;

/**
    A 3D box, described as the volume between a minimum and
    a maximum vertices.
*/
class Box : gobject.boxed.Boxed
{

  /**
      Create a `box.Box` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_box_t.sizeof), Yes.Take);
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
    return cast(void function())graphene_box_get_type != &gidSymbolNotFound ? graphene_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Box self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_box_t.
      
      The contents of the returned structure are undefined.
      Returns: the newly allocated #graphene_box_t structure.
          Use [graphene.box.Box.free] to free the resources allocated by this function
  */
  static graphene.box.Box alloc()
  {
    graphene_box_t* _cretval;
    _cretval = graphene_box_alloc();
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks whether the #graphene_box_t `a` contains the given
      #graphene_box_t `b`.
  
      Params:
        b = a #graphene_box_t
      Returns: `true` if the box is contained in the given box
  */
  bool containsBox(graphene.box.Box b)
  {
    bool _retval;
    _retval = cast(bool)graphene_box_contains_box(cast(const(graphene_box_t)*)this._cPtr, b ? cast(const(graphene_box_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether box contains the given point.
  
      Params:
        point = the coordinates to check
      Returns: `true` if the point is contained in the given box
  */
  bool containsPoint(graphene.point3_d.Point3D point)
  {
    bool _retval;
    _retval = cast(bool)graphene_box_contains_point(cast(const(graphene_box_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&point);
    return _retval;
  }

  /**
      Checks whether the two given boxes are equal.
  
      Params:
        b = a #graphene_box_t
      Returns: `true` if the boxes are equal
  */
  bool equal(graphene.box.Box b)
  {
    bool _retval;
    _retval = cast(bool)graphene_box_equal(cast(const(graphene_box_t)*)this._cPtr, b ? cast(const(graphene_box_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Expands the dimensions of box to include the coordinates at point.
  
      Params:
        point = the coordinates of the point to include
        res = return location for the expanded box
  */
  void expand(graphene.point3_d.Point3D point, out graphene.box.Box res)
  {
    graphene_box_t _res;
    graphene_box_expand(cast(const(graphene_box_t)*)this._cPtr, cast(const(graphene_point3d_t)*)&point, &_res);
    res = new graphene.box.Box(cast(void*)&_res, No.Take);
  }

  /**
      Expands the dimensions of box by the given scalar value.
      
      If scalar is positive, the #graphene_box_t will grow; if scalar is
      negative, the #graphene_box_t will shrink.
  
      Params:
        scalar = a scalar value
        res = return location for the expanded box
  */
  void expandScalar(float scalar, out graphene.box.Box res)
  {
    graphene_box_t _res;
    graphene_box_expand_scalar(cast(const(graphene_box_t)*)this._cPtr, scalar, &_res);
    res = new graphene.box.Box(cast(void*)&_res, No.Take);
  }

  /**
      Expands the dimensions of box to include the coordinates of the
      given vector.
  
      Params:
        vec = the coordinates of the point to include, as a #graphene_vec3_t
        res = return location for the expanded box
  */
  void expandVec3(graphene.vec3.Vec3 vec, out graphene.box.Box res)
  {
    graphene_box_t _res;
    graphene_box_expand_vec3(cast(const(graphene_box_t)*)this._cPtr, vec ? cast(const(graphene_vec3_t)*)vec._cPtr(No.Dup) : null, &_res);
    res = new graphene.box.Box(cast(void*)&_res, No.Take);
  }

  /**
      Computes the bounding #graphene_sphere_t capable of containing the given
      #graphene_box_t.
  
      Params:
        sphere = return location for the bounding sphere
  */
  void getBoundingSphere(out graphene.sphere.Sphere sphere)
  {
    graphene_sphere_t _sphere;
    graphene_box_get_bounding_sphere(cast(const(graphene_box_t)*)this._cPtr, &_sphere);
    sphere = new graphene.sphere.Sphere(cast(void*)&_sphere, No.Take);
  }

  /**
      Retrieves the coordinates of the center of a #graphene_box_t.
  
      Params:
        center = return location for the coordinates of
            the center
  */
  void getCenter(out graphene.point3_d.Point3D center)
  {
    graphene_box_get_center(cast(const(graphene_box_t)*)this._cPtr, cast(graphene_point3d_t*)&center);
  }

  /**
      Retrieves the size of the box on the Z axis.
      Returns: the depth of the box
  */
  float getDepth()
  {
    float _retval;
    _retval = graphene_box_get_depth(cast(const(graphene_box_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the size of the box on the Y axis.
      Returns: the height of the box
  */
  float getHeight()
  {
    float _retval;
    _retval = graphene_box_get_height(cast(const(graphene_box_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the coordinates of the maximum point of the given
      #graphene_box_t.
  
      Params:
        max = return location for the maximum point
  */
  void getMax(out graphene.point3_d.Point3D max)
  {
    graphene_box_get_max(cast(const(graphene_box_t)*)this._cPtr, cast(graphene_point3d_t*)&max);
  }

  /**
      Retrieves the coordinates of the minimum point of the given
      #graphene_box_t.
  
      Params:
        min = return location for the minimum point
  */
  void getMin(out graphene.point3_d.Point3D min)
  {
    graphene_box_get_min(cast(const(graphene_box_t)*)this._cPtr, cast(graphene_point3d_t*)&min);
  }

  /**
      Retrieves the size of the box on all three axes, and stores
      it into the given size vector.
  
      Params:
        size = return location for the size
  */
  void getSize(out graphene.vec3.Vec3 size)
  {
    graphene_vec3_t _size;
    graphene_box_get_size(cast(const(graphene_box_t)*)this._cPtr, &_size);
    size = new graphene.vec3.Vec3(cast(void*)&_size, No.Take);
  }

  /**
      Computes the vertices of the given #graphene_box_t.
  
      Params:
        vertices = return location for an array
            of 8 #graphene_vec3_t
  */
  void getVertices(ref graphene.vec3.Vec3[] vertices)
  {
    graphene_vec3_t[] _vertices;
    _vertices.length = 8;
    graphene_box_get_vertices(cast(const(graphene_box_t)*)this._cPtr, _vertices.ptr);
    vertices.length = 8;
    foreach (i; 0 .. 8)
      vertices[i] = new graphene.vec3.Vec3(cast(void*)&_vertices[i], No.Take);
  }

  /**
      Retrieves the size of the box on the X axis.
      Returns: the width of the box
  */
  float getWidth()
  {
    float _retval;
    _retval = graphene_box_get_width(cast(const(graphene_box_t)*)this._cPtr);
    return _retval;
  }

  /**
      Initializes the given #graphene_box_t with two vertices.
  
      Params:
        min = the coordinates of the minimum vertex
        max = the coordinates of the maximum vertex
      Returns: the initialized #graphene_box_t
  */
  graphene.box.Box init_(graphene.point3_d.Point3D min, graphene.point3_d.Point3D max)
  {
    graphene_box_t* _cretval;
    _cretval = graphene_box_init(cast(graphene_box_t*)this._cPtr, cast(const(graphene_point3d_t)*)&min, cast(const(graphene_point3d_t)*)&max);
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_box_t with the vertices of
      another #graphene_box_t.
  
      Params:
        src = a #graphene_box_t
      Returns: the initialized #graphene_box_t
  */
  graphene.box.Box initFromBox(graphene.box.Box src)
  {
    graphene_box_t* _cretval;
    _cretval = graphene_box_init_from_box(cast(graphene_box_t*)this._cPtr, src ? cast(const(graphene_box_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_box_t with the given array
      of vertices.
      
      If n_points is 0, the returned box is initialized with
      [graphene.box.Box.empty].
  
      Params:
        points = an array of #graphene_point3d_t
      Returns: the initialized #graphene_box_t
  */
  graphene.box.Box initFromPoints(graphene.point3_d.Point3D[] points)
  {
    graphene_box_t* _cretval;
    uint _nPoints;
    if (points)
      _nPoints = cast(uint)points.length;

    auto _points = cast(const(graphene_point3d_t)*)points.ptr;
    _cretval = graphene_box_init_from_points(cast(graphene_box_t*)this._cPtr, _nPoints, _points);
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_box_t with two vertices
      stored inside #graphene_vec3_t.
  
      Params:
        min = the coordinates of the minimum vertex
        max = the coordinates of the maximum vertex
      Returns: the initialized #graphene_box_t
  */
  graphene.box.Box initFromVec3(graphene.vec3.Vec3 min = null, graphene.vec3.Vec3 max = null)
  {
    graphene_box_t* _cretval;
    _cretval = graphene_box_init_from_vec3(cast(graphene_box_t*)this._cPtr, min ? cast(const(graphene_vec3_t)*)min._cPtr(No.Dup) : null, max ? cast(const(graphene_vec3_t)*)max._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes the given #graphene_box_t with the given array
      of vertices.
      
      If n_vectors is 0, the returned box is initialized with
      [graphene.box.Box.empty].
  
      Params:
        vectors = an array of #graphene_vec3_t
      Returns: the initialized #graphene_box_t
  */
  graphene.box.Box initFromVectors(graphene.vec3.Vec3[] vectors)
  {
    graphene_box_t* _cretval;
    uint _nVectors;
    if (vectors)
      _nVectors = cast(uint)vectors.length;

    graphene_vec3_t[] _tmpvectors;
    foreach (obj; vectors)
      _tmpvectors ~= *cast(graphene_vec3_t*)obj._cPtr;
    const(graphene_vec3_t)* _vectors = _tmpvectors.ptr;

    _cretval = graphene_box_init_from_vectors(cast(graphene_box_t*)this._cPtr, _nVectors, _vectors);
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Intersects the two given #graphene_box_t.
      
      If the two boxes do not intersect, res will contain a degenerate box
      initialized with [graphene.box.Box.empty].
  
      Params:
        b = a #graphene_box_t
        res = return location for the result
      Returns: true if the two boxes intersect
  */
  bool intersection(graphene.box.Box b, out graphene.box.Box res)
  {
    bool _retval;
    graphene_box_t _res;
    _retval = cast(bool)graphene_box_intersection(cast(const(graphene_box_t)*)this._cPtr, b ? cast(const(graphene_box_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.box.Box(cast(void*)&_res, No.Take);
    return _retval;
  }

  /**
      Unions the two given #graphene_box_t.
  
      Params:
        b = the box to union to `a`
        res = return location for the result
  */
  void union_(graphene.box.Box b, out graphene.box.Box res)
  {
    graphene_box_t _res;
    graphene_box_union(cast(const(graphene_box_t)*)this._cPtr, b ? cast(const(graphene_box_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.box.Box(cast(void*)&_res, No.Take);
  }

  /**
      A degenerate #graphene_box_t that can only be expanded.
      
      The returned value is owned by Graphene and should not be modified or freed.
      Returns: a #graphene_box_t
  */
  static graphene.box.Box empty()
  {
    const(graphene_box_t)* _cretval;
    _cretval = graphene_box_empty();
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      A degenerate #graphene_box_t that cannot be expanded.
      
      The returned value is owned by Graphene and should not be modified or freed.
      Returns: a #graphene_box_t
  */
  static graphene.box.Box infinite()
  {
    const(graphene_box_t)* _cretval;
    _cretval = graphene_box_infinite();
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      A #graphene_box_t with the minimum vertex set at (-1, -1, -1) and the
      maximum vertex set at (0, 0, 0).
      
      The returned value is owned by Graphene and should not be modified or freed.
      Returns: a #graphene_box_t
  */
  static graphene.box.Box minusOne()
  {
    const(graphene_box_t)* _cretval;
    _cretval = graphene_box_minus_one();
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      A #graphene_box_t with the minimum vertex set at (0, 0, 0) and the
      maximum vertex set at (1, 1, 1).
      
      The returned value is owned by Graphene and should not be modified or freed.
      Returns: a #graphene_box_t
  */
  static graphene.box.Box one()
  {
    const(graphene_box_t)* _cretval;
    _cretval = graphene_box_one();
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      A #graphene_box_t with the minimum vertex set at (-1, -1, -1) and the
      maximum vertex set at (1, 1, 1).
      
      The returned value is owned by Graphene and should not be modified or freed.
      Returns: a #graphene_box_t
  */
  static graphene.box.Box oneMinusOne()
  {
    const(graphene_box_t)* _cretval;
    _cretval = graphene_box_one_minus_one();
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      A #graphene_box_t with both the minimum and maximum vertices set at (0, 0, 0).
      
      The returned value is owned by Graphene and should not be modified or freed.
      Returns: a #graphene_box_t
  */
  static graphene.box.Box zero()
  {
    const(graphene_box_t)* _cretval;
    _cretval = graphene_box_zero();
    auto _retval = _cretval ? new graphene.box.Box(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
