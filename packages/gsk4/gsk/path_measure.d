/// Module for [PathMeasure] class
module gsk.path_measure;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gsk.c.functions;
import gsk.c.types;
import gsk.path;
import gsk.types;

/**
    Performs measurements on paths such as determining the length of the path.
    
    Many measuring operations require sampling the path length
    at intermediate points. Therefore, a [gsk.path_measure.PathMeasure] has
    a tolerance that determines what precision is required
    for such approximations.
    
    A [gsk.path_measure.PathMeasure] struct is a reference counted struct
    and should be treated as opaque.
*/
class PathMeasure : gobject.boxed.BoxedWrap!(gsk_path_measure_get_type)
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
      Returns: a new [gsk.path_measure.PathMeasure] representing path
  */
  this(gsk.path.Path path) nothrow
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
      Returns: a new [gsk.path_measure.PathMeasure] representing path
  */
  static gsk.path_measure.PathMeasure newWithTolerance(gsk.path.Path path, float tolerance) nothrow
  {
    GskPathMeasure* _cretval;
    _cretval = gsk_path_measure_new_with_tolerance(path ? cast(GskPath*)path._cPtr(No.Dup) : null, tolerance);
    auto _retval = _cretval ? new gsk.path_measure.PathMeasure(cast(void*)_cretval, Yes.Take) : null;
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
  gsk.path.Path getPath() nothrow
  {
    GskPath* _cretval;
    _cretval = gsk_path_measure_get_path(cast(GskPathMeasure*)this._cPtr);
    auto _retval = _cretval ? new gsk.path.Path(cast(void*)_cretval, No.Take) : null;
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
