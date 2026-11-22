/// Module for [PathMeasure] class
module gid.gsk4.path_measure;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.path;
import gid.gsk4.path_point;
import gid.gsk4.types;

/**
    Performs measurements on paths such as determining the length of the path.
    
    Many measuring operations require sampling the path length
    at intermediate points. Therefore, a [gid.gsk4.path_measure.PathMeasure] has
    a tolerance that determines what precision is required
    for such approximations.
    
    A [gid.gsk4.path_measure.PathMeasure] struct is a reference counted struct
    and should be treated as opaque.
*/
class PathMeasure : gid.gobject2.boxed.BoxedWrap!(gsk_path_measure_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override PathMeasure self() nothrow
  {
    return this;
  }

  /**
      Creates a measure object for the given path with the
      default tolerance.
  
      Params:
        path = the path to measure
      Returns: a new [gid.gsk4.path_measure.PathMeasure] representing path
  */
  this(gid.gsk4.path.Path path) nothrow
  {
    GskPathMeasure* _cretval;
    _cretval = gsk_path_measure_new(path ? cast(GskPath*)path._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a measure object for the given path and tolerance.
  
      Params:
        path = the path to measure
        tolerance = the tolerance for measuring operations
      Returns: a new [gid.gsk4.path_measure.PathMeasure] representing path
  */
  static gid.gsk4.path_measure.PathMeasure newWithTolerance(gid.gsk4.path.Path path, float tolerance) nothrow
  {
    GskPathMeasure* _cretval;
    _cretval = gsk_path_measure_new_with_tolerance(path ? cast(GskPath*)path._cPtr(No.Dup) : null, tolerance);
    auto _retval = _cretval ? new gid.gsk4.path_measure.PathMeasure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the length of the path being measured.
      
      The length is cached, so this function does not do any work.
      Returns: the length of the path measured by self
  */
  float getLength() nothrow
  {
    float _retval;
    _retval = gsk_path_measure_get_length(cast(GskPathMeasure*)this._cPtr);
    return _retval;
  }

  /**
      Returns the path that the measure was created for.
      Returns: the path of self
  */
  gid.gsk4.path.Path getPath() nothrow
  {
    GskPath* _cretval;
    _cretval = gsk_path_measure_get_path(cast(GskPathMeasure*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.path.Path(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the point at the given distance into the path.
      
      An empty path has no points, so false is returned in that case.
  
      Params:
        distance = the distance
        result = return location for the point
      Returns: true if result was set
  */
  bool getPoint(float distance, out gid.gsk4.path_point.PathPoint result) nothrow
  {
    bool _retval;
    GskPathPoint _result;
    _retval = cast(bool)gsk_path_measure_get_point(cast(GskPathMeasure*)this._cPtr, distance, &_result);
    if (_retval)
      result = new gid.gsk4.path_point.PathPoint(boxedCopy(gid.gsk4.path_point.PathPoint._getGType, &_result), Yes.Take);
    return _retval;
  }

  /**
      Returns the tolerance that the measure was created with.
      Returns: the tolerance of self
  */
  float getTolerance() nothrow
  {
    float _retval;
    _retval = gsk_path_measure_get_tolerance(cast(GskPathMeasure*)this._cPtr);
    return _retval;
  }
}
