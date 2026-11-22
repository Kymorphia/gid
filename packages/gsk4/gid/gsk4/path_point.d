/// Module for [PathPoint] class
module gid.gsk4.path_point;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.graphene1.point;
import gid.graphene1.vec2;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.path;
import gid.gsk4.path_measure;
import gid.gsk4.types;

/**
    Represents a point on a path.
    
    It can be queried for properties of the path at that point,
    such as its tangent or its curvature.
    
    To obtain a [gid.gsk4.path_point.PathPoint], use [gid.gsk4.path.Path.getClosestPoint],
    [gid.gsk4.path.Path.getStartPoint], [gid.gsk4.path.Path.getEndPoint]
    or [gid.gsk4.path_measure.PathMeasure.getPoint].
    
    Note that [gid.gsk4.path_point.PathPoint] structs are meant to be stack-allocated,
    and don't hold a reference to the path object they are obtained from.
    It is the callers responsibility to keep a reference to the path
    as long as the [gid.gsk4.path_point.PathPoint] is used.
*/
class PathPoint : gid.gobject2.boxed.BoxedWrap!(gsk_path_point_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override PathPoint self() nothrow
  {
    return this;
  }

  /**
      Returns whether point1 is before or after point2.
  
      Params:
        point2 = another path point
      Returns: -1 if point1 is before point2,
          1 if point1 is after point2,
          0 if they are equal
  */
  int compare(gid.gsk4.path_point.PathPoint point2) nothrow
  {
    int _retval;
    _retval = gsk_path_point_compare(cast(const(GskPathPoint)*)this._cPtr, point2 ? cast(const(GskPathPoint)*)point2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Copies a path point.
      Returns: the copied point
  */
  gid.gsk4.path_point.PathPoint copy() nothrow
  {
    GskPathPoint* _cretval;
    _cretval = gsk_path_point_copy(cast(GskPathPoint*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.path_point.PathPoint(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns whether the two path points refer to the same
      location on all paths.
      
      Note that the start- and endpoint of a closed contour
      will compare nonequal according to this definition.
      Use [gid.gsk4.path.Path.isClosed] to find out if the
      start- and endpoint of a concrete path refer to the
      same location.
  
      Params:
        point2 = another path point
      Returns: true if point1 and point2 are equal
  */
  bool equal(gid.gsk4.path_point.PathPoint point2) nothrow
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
      infinite radius). In this case, the center is not modified.
      
      Circles with a radius of zero have `INFINITY` as curvature
      
      Note that certain points on a path may not have a single curvature,
      such as sharp turns. At such points, there are two curvatures — the
      (limit of) the curvature of the path going into the point, and the
      (limit of) the curvature of the path coming out of it. The direction
      argument lets you choose which one to get.
      
      <picture>
        <source srcset="curvature-dark.png" media="(prefers-color-scheme: dark)">
        <img alt="Osculating circle" src="curvature-light.png">
      </picture>
  
      Params:
        path = the path that point is on
        direction = the direction for which to return the curvature
        center = return location for
            the center of the osculating circle
      Returns: the curvature of the path at the given point
  */
  float getCurvature(gid.gsk4.path.Path path, gid.gsk4.types.PathDirection direction, out gid.graphene1.point.Point center) nothrow
  {
    float _retval;
    _retval = gsk_path_point_get_curvature(cast(const(GskPathPoint)*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, direction, cast(graphene_point_t*)&center);
    return _retval;
  }

  /**
      Returns the distance from the beginning of the path
      to the point.
  
      Params:
        measure = a path measure for the path
      Returns: the distance of point
  */
  float getDistance(gid.gsk4.path_measure.PathMeasure measure) nothrow
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
  void getPosition(gid.gsk4.path.Path path, out gid.graphene1.point.Point position) nothrow
  {
    gsk_path_point_get_position(cast(const(GskPathPoint)*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, cast(graphene_point_t*)&position);
  }

  /**
      Gets the direction of the tangent at a given point.
      
      This is a convenience variant of [gid.gsk4.path_point.PathPoint.getTangent]
      that returns the angle between the tangent and the X axis. The angle
      can e.g. be used in
      [[gid.gtk4.snapshot.Snapshot.rotate]](../gtk4/method.Snapshot.rotate.html).
  
      Params:
        path = the path that point is on
        direction = the direction for which to return the rotation
      Returns: the angle between the tangent and the X axis, in degrees
  */
  float getRotation(gid.gsk4.path.Path path, gid.gsk4.types.PathDirection direction) nothrow
  {
    float _retval;
    _retval = gsk_path_point_get_rotation(cast(const(GskPathPoint)*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, direction);
    return _retval;
  }

  /**
      Gets the tangent of the path at the point.
      
      Note that certain points on a path may not have a single
      tangent, such as sharp turns. At such points, there are
      two tangents — the direction of the path going into the
      point, and the direction coming out of it. The direction
      argument lets you choose which one to get.
      
      If the path is just a single point (e.g. a circle with
      radius zero), then the tangent is set to `0, 0`.
      
      If you want to orient something in the direction of the
      path, [gid.gsk4.path_point.PathPoint.getRotation] may be more
      convenient to use.
  
      Params:
        path = the path that point is on
        direction = the direction for which to return the tangent
        tangent = Return location for
            the tangent at the point
  */
  void getTangent(gid.gsk4.path.Path path, gid.gsk4.types.PathDirection direction, out gid.graphene1.vec2.Vec2 tangent) nothrow
  {
    auto _tangent = boxedNew!graphene_vec2_t(gid.graphene1.vec2.Vec2._getGType);
    gsk_path_point_get_tangent(cast(const(GskPathPoint)*)this._cPtr, path ? cast(GskPath*)path._cPtr(No.Dup) : null, direction, _tangent);
    tangent = new gid.graphene1.vec2.Vec2(cast(void*)_tangent, Yes.Take);
  }
}
