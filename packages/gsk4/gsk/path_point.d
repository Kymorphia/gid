/// Module for [PathPoint] class
module gsk.path_point;

import gid.gid;
import gobject.boxed;
import graphene.point;
import graphene.vec2;
import gsk.c.functions;
import gsk.c.types;
import gsk.path;
import gsk.path_measure;
import gsk.types;

/**
    [gsk.path_point.PathPoint] is an opaque type representing a point on a path.
    
    It can be queried for properties of the path at that point, such as
    its tangent or its curvature.
    
    To obtain a [gsk.path_point.PathPoint], use [gsk.path.Path.getClosestPoint],
    [gsk.path.Path.getStartPoint], [gsk.path.Path.getEndPoint]
    or [gsk.path_measure.PathMeasure.getPoint].
    
    Note that [gsk.path_point.PathPoint] structs are meant to be stack-allocated,
    and don't hold a reference to the path object they are obtained from.
    It is the callers responsibility to keep a reference to the path
    as long as the [gsk.path_point.PathPoint] is used.
*/
class PathPoint : gobject.boxed.Boxed
{

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
    return cast(void function())gsk_path_point_get_type != &gidSymbolNotFound ? gsk_path_point_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PathPoint self()
  {
    return this;
  }

  /**
      Returns whether point1 is before or after point2.
  
      Params:
        point2 = another [gsk.path_point.PathPoint]
      Returns: -1 if point1 is before point2,
          1 if point1 is after point2,
          0 if they are equal
  */
  int compare(gsk.path_point.PathPoint point2)
  {
    int _retval;
    _retval = gsk_path_point_compare(cast(const(GskPathPoint)*)this._cPtr, point2 ? cast(const(GskPathPoint)*)point2._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  gsk.path_point.PathPoint copy()
  {
    GskPathPoint* _cretval;
    _cretval = gsk_path_point_copy(cast(GskPathPoint*)this._cPtr);
    auto _retval = _cretval ? new gsk.path_point.PathPoint(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns whether the two path points refer to the same
      location on all paths.
      
      Note that the start- and endpoint of a closed contour
      will compare nonequal according to this definition.
      Use [gsk.path.Path.isClosed] to find out if the
      start- and endpoint of a concrete path refer to the
      same location.
  
      Params:
        point2 = another [gsk.path_point.PathPoint]
      Returns: `TRUE` if point1 and point2 are equal
  */
  bool equal(gsk.path_point.PathPoint point2)
  {
    bool _retval;
    _retval = cast(bool)gsk_path_point_equal(cast(const(GskPathPoint)*)this._cPtr, point2 ? cast(const(GskPathPoint)*)point2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calculates the curvature of the path at the point.
      
      Optionally, returns the center of the osculating circle as well.
      The curvature is the inverse of the radius of the osculating circle.
      
      Lines have a curvature of zero (indicating an osculating circle of
      infinite radius. In this case, the center is not modified.
      
      Circles with a radius of zero have `INFINITY` as curvature
      
      Note that certain points on a path may not have a single curvature,
      such as sharp turns. At such points, there are two curvatures --
      the (limit of) the curvature of the path going into the point,
      and the (limit of) the curvature of the path coming out of it.
      The direction argument lets you choose which one to get.
      
      <picture>
        <source srcset="curvature-dark.png" media="(prefers-color-scheme: dark)">
        <img alt="Osculating circle" src="curvature-light.png">
      </picture>
  
      Params:
        path = the path that point is on
        direction = the direction for which to return the curvature
        center = Return location for
            the center of the osculating circle
      Returns: The curvature of the path at the given point
  */
  float getCurvature(gsk.path.Path path, gsk.types.PathDirection direction, out graphene.point.Point center)
  {
    float _retval;
    graphene_point_t _center;
    _retval = gsk_path_point_get_curvature(cast(const(GskPathPoint)*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, direction, &_center);
    center = new graphene.point.Point(cast(void*)&_center, No.Take);
    return _retval;
  }

  /**
      Returns the distance from the beginning of the path
      to point.
  
      Params:
        measure = a [gsk.path_measure.PathMeasure] for the path
      Returns: the distance of point
  */
  float getDistance(gsk.path_measure.PathMeasure measure)
  {
    float _retval;
    _retval = gsk_path_point_get_distance(cast(const(GskPathPoint)*)this._cPtr, measure ? cast(GskPathMeasure*)measure._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the position of the point.
  
      Params:
        path = the path that point is on
        position = Return location for
            the coordinates of the point
  */
  void getPosition(gsk.path.Path path, out graphene.point.Point position)
  {
    graphene_point_t _position;
    gsk_path_point_get_position(cast(const(GskPathPoint)*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, &_position);
    position = new graphene.point.Point(cast(void*)&_position, No.Take);
  }

  /**
      Gets the direction of the tangent at a given point.
      
      This is a convenience variant of [gsk.path_point.PathPoint.getTangent]
      that returns the angle between the tangent and the X axis. The angle
      can e.g. be used in
      [[gtk.snapshot.Snapshot.rotate]](../gtk4/method.Snapshot.rotate.html).
  
      Params:
        path = the path that point is on
        direction = the direction for which to return the rotation
      Returns: the angle between the tangent and the X axis, in degrees
  */
  float getRotation(gsk.path.Path path, gsk.types.PathDirection direction)
  {
    float _retval;
    _retval = gsk_path_point_get_rotation(cast(const(GskPathPoint)*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, direction);
    return _retval;
  }

  /**
      Gets the tangent of the path at the point.
      
      Note that certain points on a path may not have a single
      tangent, such as sharp turns. At such points, there are
      two tangents -- the direction of the path going into the
      point, and the direction coming out of it. The direction
      argument lets you choose which one to get.
      
      If the path is just a single point (e.g. a circle with
      radius zero), then tangent is set to `0, 0`.
      
      If you want to orient something in the direction of the
      path, [gsk.path_point.PathPoint.getRotation] may be more
      convenient to use.
  
      Params:
        path = the path that point is on
        direction = the direction for which to return the tangent
        tangent = Return location for
            the tangent at the point
  */
  void getTangent(gsk.path.Path path, gsk.types.PathDirection direction, out graphene.vec2.Vec2 tangent)
  {
    graphene_vec2_t _tangent;
    gsk_path_point_get_tangent(cast(const(GskPathPoint)*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, direction, &_tangent);
    tangent = new graphene.vec2.Vec2(cast(void*)&_tangent, No.Take);
  }
}
