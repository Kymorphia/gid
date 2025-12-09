/// Module for [Stroke] class
module gsk.stroke;

import cairo.context;
import gid.gid;
import gobject.boxed;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/**
    A [gsk.stroke.Stroke] struct collects the parameters that influence
    the operation of stroking a path.
*/
class Stroke : gobject.boxed.Boxed
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
    return cast(void function())gsk_stroke_get_type != &gidSymbolNotFound ? gsk_stroke_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Stroke self()
  {
    return this;
  }

  /**
      Creates a new [gsk.stroke.Stroke] with the given line_width.
  
      Params:
        lineWidth = line width of the stroke. Must be > 0
      Returns: a new [gsk.stroke.Stroke]
  */
  this(float lineWidth)
  {
    GskStroke* _cretval;
    _cretval = gsk_stroke_new(lineWidth);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a copy of the given other stroke.
      Returns: a new [gsk.stroke.Stroke]. Use [gsk.stroke.Stroke.free] to free it
  */
  gsk.stroke.Stroke copy()
  {
    GskStroke* _cretval;
    _cretval = gsk_stroke_copy(cast(const(GskStroke)*)this._cPtr);
    auto _retval = _cretval ? new gsk.stroke.Stroke(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the dash array in use or `NULL` if dashing is disabled.
      Returns: The dash array or `NULL` if the dash array is empty.
  */
  float[] getDash()
  {
    const(float)* _cretval;
    size_t _cretlength;
    _cretval = gsk_stroke_get_dash(cast(const(GskStroke)*)this._cPtr, &_cretlength);
    float[] _retval;

    if (_cretval)
    {
      _retval = cast(float[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Returns the dash_offset of a [gsk.stroke.Stroke].
      Returns: 
  */
  float getDashOffset()
  {
    float _retval;
    _retval = gsk_stroke_get_dash_offset(cast(const(GskStroke)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the line cap used.
      
      See [gsk.types.LineCap] for details.
      Returns: The line cap
  */
  gsk.types.LineCap getLineCap()
  {
    GskLineCap _cretval;
    _cretval = gsk_stroke_get_line_cap(cast(const(GskStroke)*)this._cPtr);
    gsk.types.LineCap _retval = cast(gsk.types.LineCap)_cretval;
    return _retval;
  }

  /**
      Gets the line join used.
      
      See [gsk.types.LineJoin] for details.
      Returns: The line join
  */
  gsk.types.LineJoin getLineJoin()
  {
    GskLineJoin _cretval;
    _cretval = gsk_stroke_get_line_join(cast(const(GskStroke)*)this._cPtr);
    gsk.types.LineJoin _retval = cast(gsk.types.LineJoin)_cretval;
    return _retval;
  }

  /**
      Gets the line width used.
      Returns: The line width
  */
  float getLineWidth()
  {
    float _retval;
    _retval = gsk_stroke_get_line_width(cast(const(GskStroke)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the miter limit of a [gsk.stroke.Stroke].
      Returns: 
  */
  float getMiterLimit()
  {
    float _retval;
    _retval = gsk_stroke_get_miter_limit(cast(const(GskStroke)*)this._cPtr);
    return _retval;
  }

  /**
      Sets the dash pattern to use by this stroke.
      
      A dash pattern is specified by an array of alternating non-negative
      values. Each value provides the length of alternate "on" and "off"
      portions of the stroke.
      
      Each "on" segment will have caps applied as if the segment were a
      separate contour. In particular, it is valid to use an "on" length
      of 0 with [gsk.types.LineCap.Round] or [gsk.types.LineCap.Square] to draw dots
      or squares along a path.
      
      If n_dash is 0, if all elements in dash are 0, or if there are
      negative values in dash, then dashing is disabled.
      
      If n_dash is 1, an alternating "on" and "off" pattern with the
      single dash length provided is assumed.
      
      If n_dash is uneven, the dash array will be used with the first
      element in dash defining an "on" or "off" in alternating passes
      through the array.
      
      You can specify a starting offset into the dash with
      [gsk.stroke.Stroke.setDashOffset].
  
      Params:
        dash = the array of dashes
  */
  void setDash(float[] dash = null)
  {
    size_t _nDash;
    if (dash)
      _nDash = cast(size_t)dash.length;

    auto _dash = cast(const(float)*)dash.ptr;
    gsk_stroke_set_dash(cast(GskStroke*)this._cPtr, _dash, _nDash);
  }

  /**
      Sets the offset into the dash pattern where dashing should begin.
      
      This is an offset into the length of the path, not an index into
      the array values of the dash array.
      
      See [gsk.stroke.Stroke.setDash] for more details on dashing.
  
      Params:
        offset = offset into the dash pattern
  */
  void setDashOffset(float offset)
  {
    gsk_stroke_set_dash_offset(cast(GskStroke*)this._cPtr, offset);
  }

  /**
      Sets the line cap to be used when stroking.
      
      See [gsk.types.LineCap] for details.
  
      Params:
        lineCap = the [gsk.types.LineCap]
  */
  void setLineCap(gsk.types.LineCap lineCap)
  {
    gsk_stroke_set_line_cap(cast(GskStroke*)this._cPtr, lineCap);
  }

  /**
      Sets the line join to be used when stroking.
      
      See [gsk.types.LineJoin] for details.
  
      Params:
        lineJoin = The line join to use
  */
  void setLineJoin(gsk.types.LineJoin lineJoin)
  {
    gsk_stroke_set_line_join(cast(GskStroke*)this._cPtr, lineJoin);
  }

  /**
      Sets the line width to be used when stroking.
      
      The line width must be > 0.
  
      Params:
        lineWidth = width of the line in pixels
  */
  void setLineWidth(float lineWidth)
  {
    gsk_stroke_set_line_width(cast(GskStroke*)this._cPtr, lineWidth);
  }

  /**
      Sets the limit for the distance from the corner where sharp
      turns of joins get cut off.
      
      The miter limit is in units of line width and must be non-negative.
      
      For joins of type [gsk.types.LineJoin.Miter] that exceed the miter
      limit, the join gets rendered as if it was of type
      [gsk.types.LineJoin.Bevel].
  
      Params:
        limit = the miter limit
  */
  void setMiterLimit(float limit)
  {
    gsk_stroke_set_miter_limit(cast(GskStroke*)this._cPtr, limit);
  }

  /**
      A helper function that sets the stroke parameters
      of cr from the values found in self.
  
      Params:
        cr = the cairo context to configure
  */
  void toCairo(cairo.context.Context cr)
  {
    gsk_stroke_to_cairo(cast(const(GskStroke)*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  }

  /**
      Checks if 2 strokes are identical.
  
      Params:
        stroke1 = the first [gsk.stroke.Stroke]
        stroke2 = the second [gsk.stroke.Stroke]
      Returns: `TRUE` if the 2 strokes are equal, `FALSE` otherwise
  */
  static bool equal(const(void)* stroke1 = null, const(void)* stroke2 = null)
  {
    bool _retval;
    _retval = gsk_stroke_equal(stroke1, stroke2);
    return _retval;
  }
}
