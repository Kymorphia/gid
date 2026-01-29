/// Module for [Path] class
module gsk.path;

import cairo.context;
import gid.gid;
import glib.string_;
import gobject.boxed;
import graphene.point;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.stroke;
import gsk.types;

/**
    A [gsk.path.Path] describes lines and curves that are more complex
    than simple rectangles.
    
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
class Path : gobject.boxed.Boxed
{

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
    return cast(void function())gsk_path_get_type != &gidSymbolNotFound ? gsk_path_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Path self()
  {
    return this;
  }

  /**
      Calls func for every operation of the path.
      
      Note that this may only approximate self, because paths can contain
      optimizations for various specialized contours, and depending on the
      flags, the path may be decomposed into simpler curves than the ones
      that it contained originally.
      
      This function serves two purposes:
      
      $(LIST
        * When the flags allow everything, it provides access to the raw,
          unmodified data of the path.
        * When the flags disallow certain operations, it provides
          an approximation of the path using just the allowed operations.
      )
  
      Params:
        flags = flags to pass to the foreach function. See [gsk.types.PathForeachFlags]
            for details about flags
        func = the function to call for operations
      Returns: `FALSE` if func returned FALSE`, `TRUE` otherwise.
  */
  bool foreach_(gsk.types.PathForeachFlags flags, gsk.types.PathForeachFunc func)
  {
    extern(C) gboolean _funcCallback(GskPathOperation op, const(graphene_point_t)* pts, size_t nPts, float weight, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gsk.types.PathForeachFunc*)userData;

      _dretval = (*_dlg)(op, *cast(graphene.point.Point*)pts, nPts, weight);
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
      Computes the bounds of the given path.
      
      The returned bounds may be larger than necessary, because this
      function aims to be fast, not accurate. The bounds are guaranteed
      to contain the path.
      
      It is possible that the returned rectangle has 0 width and/or height.
      This can happen when the path only describes a point or an
      axis-aligned line.
      
      If the path is empty, `FALSE` is returned and bounds are set to
      [graphene.rect.Rect.zero]. This is different from the case where the path
      is a single point at the origin, where the bounds will also be set to
      the zero rectangle but `TRUE` will be returned.
  
      Params:
        bounds = the bounds of the given path
      Returns: `TRUE` if the path has bounds, `FALSE` if the path is known
          to be empty and have no bounds.
  */
  bool getBounds(out graphene.rect.Rect bounds)
  {
    bool _retval;
    graphene_rect_t _bounds;
    _retval = cast(bool)gsk_path_get_bounds(cast(GskPath*)this._cPtr, &_bounds);
    bounds = new graphene.rect.Rect(cast(void*)&_bounds, No.Take);
    return _retval;
  }

  /**
      Computes the bounds for stroking the given path with the
      parameters in stroke.
      
      The returned bounds may be larger than necessary, because this
      function aims to be fast, not accurate. The bounds are guaranteed
      to contain the area affected by the stroke, including protrusions
      like miters.
  
      Params:
        stroke = stroke parameters
        bounds = the bounds to fill in
      Returns: `TRUE` if the path has bounds, `FALSE` if the path is known
          to be empty and have no bounds.
  */
  bool getStrokeBounds(gsk.stroke.Stroke stroke, out graphene.rect.Rect bounds)
  {
    bool _retval;
    graphene_rect_t _bounds;
    _retval = cast(bool)gsk_path_get_stroke_bounds(cast(GskPath*)this._cPtr, stroke ? cast(const(GskStroke)*)stroke._cPtr(No.Dup) : null, &_bounds);
    bounds = new graphene.rect.Rect(cast(void*)&_bounds, No.Take);
    return _retval;
  }

  /**
      Returns whether the given point is inside the area
      that would be affected if the path was filled according
      to fill_rule.
      
      Note that this function assumes that filling a contour
      implicitly closes it.
  
      Params:
        point = the point to test
        fillRule = the fill rule to follow
      Returns: `TRUE` if point is inside
  */
  bool inFill(graphene.point.Point point, gsk.types.FillRule fillRule)
  {
    bool _retval;
    _retval = cast(bool)gsk_path_in_fill(cast(GskPath*)this._cPtr, cast(const(graphene_point_t)*)&point, fillRule);
    return _retval;
  }

  /**
      Returns if the path represents a single closed
      contour.
      Returns: `TRUE` if the path is closed
  */
  bool isClosed()
  {
    bool _retval;
    _retval = cast(bool)gsk_path_is_closed(cast(GskPath*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the path is empty, i.e. contains no lines or curves.
      Returns: `TRUE` if the path is empty
  */
  bool isEmpty()
  {
    bool _retval;
    _retval = cast(bool)gsk_path_is_empty(cast(GskPath*)this._cPtr);
    return _retval;
  }

  /**
      Converts self into a human-readable string representation suitable
      for printing.
      
      The string is compatible with (a superset of)
      [SVG path syntax](https://www.w3.org/TR/SVG11/paths.html#PathData),
      see [gsk.path.Path.parse] for a summary of the syntax.
  
      Params:
        string_ = The string to print into
  */
  void print(glib.string_.String string_)
  {
    gsk_path_print(cast(GskPath*)this._cPtr, string_ ? cast(GString*)string_._cPtr(No.Dup) : null);
  }

  /**
      Appends the given path to the given cairo context for drawing
      with Cairo.
      
      This may cause some suboptimal conversions to be performed as
      Cairo does not support all features of [gsk.path.Path].
      
      This function does not clear the existing Cairo path. Call
      [cairo.context.Context.newPath] if you want this.
  
      Params:
        cr = a cairo context
  */
  void toCairo(cairo.context.Context cr)
  {
    gsk_path_to_cairo(cast(GskPath*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  }

  /**
      Converts the path into a string that is suitable for printing.
      
      You can use this function in a debugger to get a quick overview
      of the path.
      
      This is a wrapper around [gsk.path.Path.print], see that function
      for details.
      Returns: A new string for self
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gsk_path_to_string(cast(GskPath*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      This is a convenience function that constructs a [gsk.path.Path]
      from a serialized form.
      
      The string is expected to be in (a superset of)
      [SVG path syntax](https://www.w3.org/TR/SVG11/paths.html#PathData),
      as e.g. produced by [gsk.path.Path.toString_].
      
      A high-level summary of the syntax:
      
      $(LIST
        * `M x y` Move to `(x, y)`
        * `L x y` Add a line from the current point to `(x, y)`
        * `Q x1 y1 x2 y2` Add a quadratic Bézier from the current point to `(x2, y2)`, with control point `(x1, y1)`
        * `C x1 y1 x2 y2 x3 y3` Add a cubic Bézier from the current point to `(x3, y3)`, with control points `(x1, y1)` and `(x2, y2)`
        * `Z` Close the contour by drawing a line back to the start point
        * `H x` Add a horizontal line from the current point to the given x value
        * `V y` Add a vertical line from the current point to the given y value
        * `T x2 y2` Add a quadratic Bézier, using the reflection of the previous segments' control point as control point
        * `S x2 y2 x3 y3` Add a cubic Bézier, using the reflection of the previous segments' second control point as first control point
        * `A rx ry r l s x y` Add an elliptical arc from the current point to `(x, y)` with radii rx and ry. See the SVG documentation for how the other parameters influence the arc.
        * `O x1 y1 x2 y2 w` Add a rational quadratic Bézier from the current point to `(x2, y2)` with control point `(x1, y1)` and weight `w`.
      )
        
      All the commands have lowercase variants that interpret coordinates
      relative to the current point.
      
      The `O` command is an extension that is not supported in SVG.
  
      Params:
        string_ = a string
      Returns: a new [gsk.path.Path], or `NULL` if string could not be parsed
  */
  static gsk.path.Path parse(string string_)
  {
    GskPath* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gsk_path_parse(_string_);
    auto _retval = _cretval ? new gsk.path.Path(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
