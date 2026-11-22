/// Module for [Stroke] class
module gid.gsk4.stroke;

public import gid.core.basictypes;
import gid.cairo1.context;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.types;

/**
    Collects the parameters that are needed when stroking a path.
*/
class Stroke : gid.gobject2.boxed.BoxedWrap!(gsk_stroke_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Stroke self() nothrow
  {
    return this;
  }

  /**
      Creates a new [gid.gsk4.stroke.Stroke] with the given line_width.
  
      Params:
        lineWidth = line width of the stroke. Must be > 0
      Returns: a new [gid.gsk4.stroke.Stroke]
  */
  this(float lineWidth) nothrow
  {
    GskStroke* _cretval;
    _cretval = gsk_stroke_new(lineWidth);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a copy of a [gid.gsk4.stroke.Stroke].
      Returns: a new [gid.gsk4.stroke.Stroke]. Use [gid.gsk4.stroke.Stroke.free] to free it
  */
  gid.gsk4.stroke.Stroke copy() nothrow
  {
    GskStroke* _cretval;
    _cretval = gsk_stroke_copy(cast(const(GskStroke)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.stroke.Stroke(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the dash array in use.
      Returns: the dash array or `NULL` if the dash array is empty
  */
  float[] getDash() nothrow
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
      Gets the dash offset.
      Returns: the dash offset
  */
  float getDashOffset() nothrow
  {
    float _retval;
    _retval = gsk_stroke_get_dash_offset(cast(const(GskStroke)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the line cap used.
      
      See [gid.gsk4.types.LineCap] for details.
      Returns: the line cap
  */
  gid.gsk4.types.LineCap getLineCap() nothrow
  {
    GskLineCap _cretval;
    _cretval = gsk_stroke_get_line_cap(cast(const(GskStroke)*)this._cPtr);
    gid.gsk4.types.LineCap _retval = cast(gid.gsk4.types.LineCap)_cretval;
    return _retval;
  }

  /**
      Gets the line join used.
      
      See [gid.gsk4.types.LineJoin] for details.
      Returns: the line join
  */
  gid.gsk4.types.LineJoin getLineJoin() nothrow
  {
    GskLineJoin _cretval;
    _cretval = gsk_stroke_get_line_join(cast(const(GskStroke)*)this._cPtr);
    gid.gsk4.types.LineJoin _retval = cast(gid.gsk4.types.LineJoin)_cretval;
    return _retval;
  }

  /**
      Gets the line width used.
      Returns: the line width
  */
  float getLineWidth() nothrow
  {
    float _retval;
    _retval = gsk_stroke_get_line_width(cast(const(GskStroke)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the miter limit.
      Returns: the miter limit
  */
  float getMiterLimit() nothrow
  {
    float _retval;
    _retval = gsk_stroke_get_miter_limit(cast(const(GskStroke)*)this._cPtr);
    return _retval;
  }

  /**
      Sets the dash pattern to use.
      
      A dash pattern is specified by an array of alternating non-negative
      values. Each value provides the length of alternate "on" and "off"
      portions of the stroke.
      
      Each "on" segment will have caps applied as if the segment were a
      separate contour. In particular, it is valid to use an "on" length
      of 0 with [gid.gsk4.types.LineCap.Round] or [gid.gsk4.types.LineCap.Square]
      to draw dots or squares along a path.
      
      If n_dash is 0, if all elements in dash are 0, or if there are
      negative values in dash, then dashing is disabled.
      
      If n_dash is 1, an alternating "on" and "off" pattern with the
      single dash length provided is assumed.
      
      If n_dash is uneven, the dash array will be used with the first
      element in dash defining an "on" or "off" in alternating passes
      through the array.
      
      You can specify a starting offset into the dash with
      [gid.gsk4.stroke.Stroke.setDashOffset].
  
      Params:
        dash = the array of dashes
  */
  void setDash(float[] dash = null) nothrow
  {
    size_t _nDash;
    if (dash)
      _nDash = cast(size_t)dash.length;

    auto _dash = cast(float*)dash.ptr;
    gsk_stroke_set_dash(cast(GskStroke*)this._cPtr, _dash, _nDash);
  }

  /**
      Sets the offset into the dash pattern where dashing should begin.
      
      This is an offset into the length of the path, not an index into
      the array values of the dash array.
      
      See [gid.gsk4.stroke.Stroke.setDash] for more details on dashing.
  
      Params:
        offset = offset into the dash pattern
  */
  void setDashOffset(float offset) nothrow
  {
    gsk_stroke_set_dash_offset(cast(GskStroke*)this._cPtr, offset);
  }

  /**
      Sets the line cap to be used when stroking.
      
      See [gid.gsk4.types.LineCap] for details.
  
      Params:
        lineCap = the line cap
  */
  void setLineCap(gid.gsk4.types.LineCap lineCap) nothrow
  {
    gsk_stroke_set_line_cap(cast(GskStroke*)this._cPtr, lineCap);
  }

  /**
      Sets the line join to be used when stroking.
      
      See [gid.gsk4.types.LineJoin] for details.
  
      Params:
        lineJoin = the line join to use
  */
  void setLineJoin(gid.gsk4.types.LineJoin lineJoin) nothrow
  {
    gsk_stroke_set_line_join(cast(GskStroke*)this._cPtr, lineJoin);
  }

  /**
      Sets the line width to be used when stroking.
      
      The line width must be >= 0.
  
      Params:
        lineWidth = width of the line in pixels
  */
  void setLineWidth(float lineWidth) nothrow
  {
    gsk_stroke_set_line_width(cast(GskStroke*)this._cPtr, lineWidth);
  }

  /**
      Sets the miter limit to be used when stroking.
      
      The miter limit is the distance from the corner where sharp
      turns of joins get cut off.
      
      The limit is specfied in units of line width and must be non-negative.
      
      For joins of type [gid.gsk4.types.LineJoin.Miter] that exceed the miter limit,
      the join gets rendered as if it was of type [gid.gsk4.types.LineJoin.Bevel].
  
      Params:
        limit = the miter limit
  */
  void setMiterLimit(float limit) nothrow
  {
    gsk_stroke_set_miter_limit(cast(GskStroke*)this._cPtr, limit);
  }

  /**
      A helper function that sets the stroke parameters
      of a cairo context from a [gid.gsk4.stroke.Stroke].
  
      Params:
        cr = the cairo context to configure
  */
  void toCairo(gid.cairo1.context.Context cr) nothrow
  {
    gsk_stroke_to_cairo(cast(const(GskStroke)*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  }

  /**
      Checks if two strokes are identical.
  
      Params:
        stroke1 = the first stroke
        stroke2 = the second stroke
      Returns: true if the two strokes are equal, false otherwise
  */
  static bool equal(const(void)* stroke1 = null, const(void)* stroke2 = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_stroke_equal(stroke1, stroke2);
    return _retval;
  }
}
