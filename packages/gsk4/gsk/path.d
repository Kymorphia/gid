/// Module for [Path] class
module gsk.path;

public import gid.basictypes;
import cairo.context;
import gid.gid;
import glib.string_;
import gobject.boxed;
import graphene.point;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.path_point;
import gsk.stroke;
import gsk.types;

/**
    Describes lines and curves that are more complex than simple rectangles.
    
    Paths can used for rendering (filling or stroking) and for animations
    (e.g. as trajectories).
    
    [gsk.path.Path] is an immutable, opaque, reference-counted struct.
    After creation, you cannot change the types it represents. Instead,
    new [gsk.path.Path] objects have to be created. The [gsk.path_builder.PathBuilder]
    structure is meant to help in this endeavor.
    
    Conceptually, a path consists of zero or more contours (continuous, connected
    curves), each of which may or may not be closed. Contours are typically
    constructed from Bézier segments.
    
    <picture>
      <source srcset="path-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="A Path" src="path-light.png">
    </picture>
*/
class Path : gobject.boxed.BoxedWrap!(gsk_path_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Path self() nothrow
  {
    return this;
  }

  /**
      Returns whether two paths have identical structure.
      
      Note that it is possible to construct paths that render
      identical even though they don't have the same structure.
  
      Params:
        path2 = another path
      Returns: true if path1 and path2 have identical structure
  */
  bool equal(gsk.path.Path path2) nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_path_equal(cast(const(GskPath)*)this._cPtr, path2 ? cast(const(GskPath)*)path2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calls func for every operation of the path.
      
      Note that this may only approximate self, because paths can contain
      optimizations for various specialized contours, and depending on the
      flags, the path may be decomposed into simpler curves than the ones
      that it contained originally.
      
      This function serves two purposes:
      
      - When the flags allow everything, it provides access to the raw,
        unmodified data of the path.
      - When the flags disallow certain operations, it provides
        an approximation of the path using just the allowed operations.
  
      Params:
        flags = flags to pass to the foreach function
        func = the function to call for operations
      Returns: false if func returned false, true otherwise.
  */
  bool foreach_(gsk.types.PathForeachFlags flags, gsk.types.PathForeachFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(GskPathOperation op, const(graphene_point_t)* pts, size_t nPts, float weight, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gsk.types.PathForeachFunc*)userData;
      graphene.point.Point[] _pts;
      _pts.length = nPts;
      _pts[0 .. nPts] = (cast(graphene.point.Point*)pts)[0 .. nPts];

      try
      {
        _dretval = (*_dlg)(op, _pts, weight);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gsk.types.PathForeachFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gsk_path_foreach(cast(GskPath*)this._cPtr, flags, _funcCB, _func);
    return _retval;
  }

  /**
      Finds intersections between two paths.
      
      This function finds intersections between path1 and path2,
      and calls func for each of them, in increasing order for path1.
      
      If path2 is not provided or equal to path1, the function finds
      non-trivial self-intersections of path1.
      
      When segments of the paths coincide, the callback is called once
      for the start of the segment, with GSK_PATH_INTERSECTION_START, and
      once for the end of the segment, with GSK_PATH_INTERSECTION_END.
      Note that other intersections may occur between the start and end
      of such a segment.
      
      If func returns `FALSE`, the iteration is stopped.
  
      Params:
        path2 = the second path
        func = the function to call for intersections
      Returns: `FALSE` if func returned FALSE`, `TRUE` otherwise.
  */
  bool foreachIntersection(gsk.path.Path path2, gsk.types.PathIntersectionFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(GskPath* path1, const(GskPathPoint)* point1, GskPath* path2, const(GskPathPoint)* point2, GskPathIntersection kind, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gsk.types.PathIntersectionFunc*)userData;

      try
      {
        _dretval = (*_dlg)(path1 ? new gsk.path.Path(cast(void*)path1, No.Take) : null, point1 ? new gsk.path_point.PathPoint(cast(void*)point1, No.Take) : null, path2 ? new gsk.path.Path(cast(void*)path2, No.Take) : null, point2 ? new gsk.path_point.PathPoint(cast(void*)point2, No.Take) : null, kind);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gsk.types.PathIntersectionFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gsk_path_foreach_intersection(cast(GskPath*)this._cPtr, path2 ? cast(GskPath*)path2._cPtr(No.Dup) : null, _funcCB, _func);
    return _retval;
  }

  /**
      Computes the bounds of the given path.
      
      The returned bounds may be larger than necessary, because this
      function aims to be fast, not accurate. The bounds are guaranteed
      to contain the path. For accurate bounds, use
      [gsk.path.Path.getTightBounds].
      
      It is possible that the returned rectangle has 0 width and/or height.
      This can happen when the path only describes a point or an
      axis-aligned line.
      
      If the path is empty, false is returned and bounds are set to
      [graphene.rect.Rect.zero]. This is different from the case where the path
      is a single point at the origin, where the bounds will also be set to
      the zero rectangle but true will be returned.
  
      Params:
        bounds = return location for the bounds
      Returns: true if the path has bounds, false if the path is known
          to be empty and have no bounds
  */
  bool getBounds(out graphene.rect.Rect bounds) nothrow
  {
    bool _retval;
    auto _bounds = boxedNew!graphene_rect_t(graphene.rect.Rect._getGType);
    _retval = cast(bool)gsk_path_get_bounds(cast(GskPath*)this._cPtr, _bounds);
    bounds = new graphene.rect.Rect(cast(void*)_bounds, Yes.Take);
    return _retval;
  }

  /**
      Computes the closest point on the path to the given point.
      
      If there is no point closer than the given threshold,
      false is returned.
  
      Params:
        point = the point
        threshold = maximum allowed distance
        result = return location for the closest point
        distance = return location for the distance
      Returns: true if point was set to the closest point
          on self, false if no point is closer than threshold
  */
  bool getClosestPoint(graphene.point.Point point, float threshold, out gsk.path_point.PathPoint result, out float distance) nothrow
  {
    bool _retval;
    GskPathPoint _result;
    _retval = cast(bool)gsk_path_get_closest_point(cast(GskPath*)this._cPtr, cast(const(graphene_point_t)*)&point, threshold, &_result, cast(float*)&distance);
    if (_retval)
      result = new gsk.path_point.PathPoint(boxedCopy(gsk.path_point.PathPoint._getGType, &_result), Yes.Take);
    return _retval;
  }

  /**
      Gets the end point of the path.
      
      An empty path has no points, so false
      is returned in this case.
  
      Params:
        result = return location for point
      Returns: true if result was filled
  */
  bool getEndPoint(out gsk.path_point.PathPoint result) nothrow
  {
    bool _retval;
    GskPathPoint _result;
    _retval = cast(bool)gsk_path_get_end_point(cast(GskPath*)this._cPtr, &_result);
    if (_retval)
      result = new gsk.path_point.PathPoint(boxedCopy(gsk.path_point.PathPoint._getGType, &_result), Yes.Take);
    return _retval;
  }

  /**
      Moves point to the next vertex.
      
      An empty path has no points, so false
      is returned in this case.
  
      Params:
        point = the current point
      Returns: true if point was set
  */
  bool getNext(gsk.path_point.PathPoint point) nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_path_get_next(cast(GskPath*)this._cPtr, point ? cast(GskPathPoint*)point._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves point to the previous vertex.
      
      An empty path has no points, so false
      is returned in this case.
  
      Params:
        point = the current point
      Returns: true if point was set
  */
  bool getPrevious(gsk.path_point.PathPoint point) nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_path_get_previous(cast(GskPath*)this._cPtr, point ? cast(GskPathPoint*)point._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the start point of the path.
      
      An empty path has no points, so false
      is returned in this case.
  
      Params:
        result = return location for point
      Returns: true if result was filled
  */
  bool getStartPoint(out gsk.path_point.PathPoint result) nothrow
  {
    bool _retval;
    GskPathPoint _result;
    _retval = cast(bool)gsk_path_get_start_point(cast(GskPath*)this._cPtr, &_result);
    if (_retval)
      result = new gsk.path_point.PathPoint(boxedCopy(gsk.path_point.PathPoint._getGType, &_result), Yes.Take);
    return _retval;
  }

  /**
      Computes the bounds for stroking the given path with the
      given parameters.
      
      The returned bounds may be larger than necessary, because this
      function aims to be fast, not accurate. The bounds are guaranteed
      to contain the area affected by the stroke, including protrusions
      like miters.
  
      Params:
        stroke = stroke parameters
        bounds = the bounds to fill in
      Returns: true if the path has bounds, false if the path is known
          to be empty and have no bounds.
  */
  bool getStrokeBounds(gsk.stroke.Stroke stroke, out graphene.rect.Rect bounds) nothrow
  {
    bool _retval;
    auto _bounds = boxedNew!graphene_rect_t(graphene.rect.Rect._getGType);
    _retval = cast(bool)gsk_path_get_stroke_bounds(cast(GskPath*)this._cPtr, stroke ? cast(const(GskStroke)*)stroke._cPtr(No.Dup) : null, _bounds);
    bounds = new graphene.rect.Rect(cast(void*)_bounds, Yes.Take);
    return _retval;
  }

  /**
      Computes the tight bounds of the given path.
      
      This function works harder than [gsk.path.Path.getBounds] to
      produce the smallest possible bounds.
  
      Params:
        bounds = return location for the bounds
      Returns: true if the path has bounds, false if the path is known
          to be empty and have no bounds
  */
  bool getTightBounds(out graphene.rect.Rect bounds) nothrow
  {
    bool _retval;
    auto _bounds = boxedNew!graphene_rect_t(graphene.rect.Rect._getGType);
    _retval = cast(bool)gsk_path_get_tight_bounds(cast(GskPath*)this._cPtr, _bounds);
    bounds = new graphene.rect.Rect(cast(void*)_bounds, Yes.Take);
    return _retval;
  }

  /**
      Returns whether a point is inside the fill area of a path.
      
      Note that this function assumes that filling a contour
      implicitly closes it.
  
      Params:
        point = the point to test
        fillRule = the fill rule to follow
      Returns: true if point is inside
  */
  bool inFill(graphene.point.Point point, gsk.types.FillRule fillRule) nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_path_in_fill(cast(GskPath*)this._cPtr, cast(const(graphene_point_t)*)&point, fillRule);
    return _retval;
  }

  /**
      Returns if the path represents a single closed contour.
      Returns: true if the path is closed
  */
  bool isClosed() nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_path_is_closed(cast(GskPath*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the path is empty, i.e. contains no lines or curves.
      Returns: true if the path is empty
  */
  bool isEmpty() nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_path_is_empty(cast(GskPath*)this._cPtr);
    return _retval;
  }

  /**
      Converts the path into a human-readable representation.
      
      The string is compatible with (a superset of)
      [SVG path syntax](https://www.w3.org/TR/SVG11/paths.html#PathData),
      see [gsk.path.Path.parse] for a summary of the syntax.
  
      Params:
        string_ = the string to print into
  */
  void print(glib.string_.String string_) nothrow
  {
    gsk_path_print(cast(GskPath*)this._cPtr, string_ ? cast(GString*)string_._cPtr(No.Dup) : null);
  }

  /**
      Appends the path to a cairo context for drawing with Cairo.
      
      This may cause some suboptimal conversions to be performed as
      Cairo does not support all features of [gsk.path.Path].
      
      This function does not clear the existing Cairo path. Call
      [cairo.context.Context.newPath] if you want this.
  
      Params:
        cr = a cairo context
  */
  void toCairo(cairo.context.Context cr) nothrow
  {
    gsk_path_to_cairo(cast(GskPath*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  }

  /**
      Converts the path into a human-readable string.
      
      You can use this function in a debugger to get a quick overview
      of the path.
      
      This is a wrapper around [gsk.path.Path.print], see that function
      for details.
      Returns: a new string for self
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gsk_path_to_string(cast(GskPath*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Constructs a path from a serialized form.
      
      The string is expected to be in (a superset of)
      [SVG path syntax](https://www.w3.org/TR/SVG11/paths.html#PathData),
      as e.g. produced by [gsk.path.Path.toString_].
      
      A high-level summary of the syntax:
      
      - `M x y` Move to `(x, y)`
      - `L x y` Add a line from the current point to `(x, y)`
      - `Q x1 y1 x2 y2` Add a quadratic Bézier from the current point to `(x2, y2)`, with control point `(x1, y1)`
      - `C x1 y1 x2 y2 x3 y3` Add a cubic Bézier from the current point to `(x3, y3)`, with control points `(x1, y1)` and `(x2, y2)`
      - `Z` Close the contour by drawing a line back to the start point
      - `H x` Add a horizontal line from the current point to the given x value
      - `V y` Add a vertical line from the current point to the given y value
      - `T x2 y2` Add a quadratic Bézier, using the reflection of the previous segments' control point as control point
      - `S x2 y2 x3 y3` Add a cubic Bézier, using the reflection of the previous segments' second control point as first control point
      - `A rx ry r l s x y` Add an elliptical arc from the current point to `(x, y)` with radii rx and ry. See the SVG documentation for how the other parameters influence the arc.
      - `O x1 y1 x2 y2 w` Add a rational quadratic Bézier from the current point to `(x2, y2)` with control point `(x1, y1)` and weight `w`.
      
      All the commands have lowercase variants that interpret coordinates
      relative to the current point.
      
      The `O` command is an extension that is not supported in SVG.
  
      Params:
        string_ = a string
      Returns: a new [gsk.path.Path], or `NULL` if string could not be parsed
  */
  static gsk.path.Path parse(string string_) nothrow
  {
    GskPath* _cretval;
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    _cretval = gsk_path_parse(_string_);
    auto _retval = _cretval ? new gsk.path.Path(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
