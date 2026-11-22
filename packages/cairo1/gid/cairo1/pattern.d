/// Module for [Pattern] class
module gid.cairo1.pattern;

public import gid.core.basictypes;
import gid.cairo1.c.functions;
import gid.cairo1.c.types;
import gid.cairo1.matrix;
import gid.cairo1.surface;
import gid.cairo1.types;
import gid.core.utils;
import gid.gobject2.boxed;

/**
    A #cairo_pattern_t represents a source when drawing onto a
    surface. There are different subtypes of #cairo_pattern_t,
    for different types of sources; for example,
    [gid.cairo1.global.patternCreateRgb] creates a pattern for a solid
    opaque color.
    
    Other than various
    <function>cairo_pattern_create_<emphasis>type</emphasis>()</function>
    functions, some of the pattern types can be implicitly created using various
    <function>cairo_set_source_<emphasis>type</emphasis>()</function> functions;
    for example [gid.cairo1.context.Context.setSourceRgb].
    
    The type of a pattern can be queried with [gid.cairo1.pattern.Pattern.getPatternType].
    
    Memory management of #cairo_pattern_t is done with
    [gid.cairo1.pattern.Pattern.reference] and [gid.cairo1.pattern.Pattern.destroy].
*/
class Pattern : gid.gobject2.boxed.BoxedWrap!(cairo_gobject_pattern_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Pattern self() nothrow
  {
    return this;
  }

  /**
      Adds an opaque color stop to a gradient pattern. The offset
      specifies the location along the gradient's control vector. For
      example, a linear gradient's control vector is from (x0,y0) to
      (x1,y1) while a radial gradient's control vector is from any point
      on the start circle to the corresponding point on the end circle.
      
      The color is specified in the same way as in [gid.cairo1.context.Context.setSourceRgb].
      
      If two (or more) stops are specified with identical offset values,
      they will be sorted according to the order in which the stops are
      added, (stops added earlier will compare less than stops added
      later). This can be useful for reliably making sharp color
      transitions instead of the typical blend.
      
      
      Note: If the pattern is not a gradient pattern, (eg. a linear or
      radial pattern), then the pattern will be put into an error status
      with a status of [gid.cairo1.types.Status.PatternTypeMismatch].
  
      Params:
        offset = an offset in the range [0.0 .. 1.0]
        red = red component of color
        green = green component of color
        blue = blue component of color
  */
  void addColorStopRgb(double offset, double red, double green, double blue) nothrow
  {
    cairo_pattern_add_color_stop_rgb(cast(cairo_pattern_t*)this._cPtr, offset, red, green, blue);
  }

  /**
      Adds a translucent color stop to a gradient pattern. The offset
      specifies the location along the gradient's control vector. For
      example, a linear gradient's control vector is from (x0,y0) to
      (x1,y1) while a radial gradient's control vector is from any point
      on the start circle to the corresponding point on the end circle.
      
      The color is specified in the same way as in [gid.cairo1.context.Context.setSourceRgba].
      
      If two (or more) stops are specified with identical offset values,
      they will be sorted according to the order in which the stops are
      added, (stops added earlier will compare less than stops added
      later). This can be useful for reliably making sharp color
      transitions instead of the typical blend.
      
      Note: If the pattern is not a gradient pattern, (eg. a linear or
      radial pattern), then the pattern will be put into an error status
      with a status of [gid.cairo1.types.Status.PatternTypeMismatch].
  
      Params:
        offset = an offset in the range [0.0 .. 1.0]
        red = red component of color
        green = green component of color
        blue = blue component of color
        alpha = alpha component of color
  */
  void addColorStopRgba(double offset, double red, double green, double blue, double alpha) nothrow
  {
    cairo_pattern_add_color_stop_rgba(cast(cairo_pattern_t*)this._cPtr, offset, red, green, blue, alpha);
  }

  /**
      Gets the number of color stops specified in the given gradient
      pattern.
  
      Params:
        count = return value for the number of color stops, or null
      Returns: [gid.cairo1.types.Status.Success], or
        [gid.cairo1.types.Status.PatternTypeMismatch] if pattern is not a gradient
        pattern.
  */
  gid.cairo1.types.Status getColorStopCount(out int count) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_color_stop_count(cast(cairo_pattern_t*)this._cPtr, cast(int*)&count);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Gets the color and offset information at the given index for a
      gradient pattern.  Values of index range from 0 to n-1
      where n is the number returned
      by [gid.cairo1.pattern.Pattern.getColorStopCount].
      
      Note that the color and alpha values are not premultiplied.
  
      Params:
        index = index of the stop to return data for
        offset = return value for the offset of the stop, or null
        red = return value for red component of color, or null
        green = return value for green component of color, or null
        blue = return value for blue component of color, or null
        alpha = return value for alpha component of color, or null
      Returns: [gid.cairo1.types.Status.Success], or [gid.cairo1.types.Status.InvalidIndex]
        if index is not valid for the given pattern.  If the pattern is
        not a gradient pattern, [gid.cairo1.types.Status.PatternTypeMismatch] is
        returned.
  */
  gid.cairo1.types.Status getColorStopRgba(int index, out double offset, out double red, out double green, out double blue, out double alpha) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_color_stop_rgba(cast(cairo_pattern_t*)this._cPtr, index, cast(double*)&offset, cast(double*)&red, cast(double*)&green, cast(double*)&blue, cast(double*)&alpha);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Gets the current dithering mode, as set by
      [gid.cairo1.pattern.Pattern.setDither].
      Returns: the current dithering mode.
  */
  gid.cairo1.types.Dither getDither() nothrow
  {
    cairo_dither_t _cretval;
    _cretval = cairo_pattern_get_dither(cast(cairo_pattern_t*)this._cPtr);
    gid.cairo1.types.Dither _retval = cast(gid.cairo1.types.Dither)_cretval;
    return _retval;
  }

  /**
      Gets the current extend mode for a pattern.  See #cairo_extend_t
      for details on the semantics of each extend strategy.
      Returns: the current extend strategy used for drawing the
        pattern.
  */
  gid.cairo1.types.Extend getExtend() nothrow
  {
    cairo_extend_t _cretval;
    _cretval = cairo_pattern_get_extend(cast(cairo_pattern_t*)this._cPtr);
    gid.cairo1.types.Extend _retval = cast(gid.cairo1.types.Extend)_cretval;
    return _retval;
  }

  /**
      Gets the current filter for a pattern.  See #cairo_filter_t
      for details on each filter.
      Returns: the current filter used for resizing the pattern.
  */
  gid.cairo1.types.Filter getFilter() nothrow
  {
    cairo_filter_t _cretval;
    _cretval = cairo_pattern_get_filter(cast(cairo_pattern_t*)this._cPtr);
    gid.cairo1.types.Filter _retval = cast(gid.cairo1.types.Filter)_cretval;
    return _retval;
  }

  /**
      Gets the gradient endpoints for a linear gradient.
  
      Params:
        x0 = return value for the x coordinate of the first point, or null
        y0 = return value for the y coordinate of the first point, or null
        x1 = return value for the x coordinate of the second point, or null
        y1 = return value for the y coordinate of the second point, or null
      Returns: [gid.cairo1.types.Status.Success], or
        [gid.cairo1.types.Status.PatternTypeMismatch] if pattern is not a linear
        gradient pattern.
  */
  gid.cairo1.types.Status getLinearPoints(out double x0, out double y0, out double x1, out double y1) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_linear_points(cast(cairo_pattern_t*)this._cPtr, cast(double*)&x0, cast(double*)&y0, cast(double*)&x1, cast(double*)&y1);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Stores the pattern's transformation matrix into matrix.
  
      Params:
        matrix = return value for the matrix
  */
  void getMatrix(out gid.cairo1.matrix.Matrix matrix) nothrow
  {
    cairo_pattern_get_matrix(cast(cairo_pattern_t*)this._cPtr, cast(cairo_matrix_t*)&matrix);
  }

  /**
      Gets the gradient endpoint circles for a radial gradient, each
      specified as a center coordinate and a radius.
  
      Params:
        x0 = return value for the x coordinate of the center of the first circle, or null
        y0 = return value for the y coordinate of the center of the first circle, or null
        r0 = return value for the radius of the first circle, or null
        x1 = return value for the x coordinate of the center of the second circle, or null
        y1 = return value for the y coordinate of the center of the second circle, or null
        r1 = return value for the radius of the second circle, or null
      Returns: [gid.cairo1.types.Status.Success], or
        [gid.cairo1.types.Status.PatternTypeMismatch] if pattern is not a radial
        gradient pattern.
  */
  gid.cairo1.types.Status getRadialCircles(out double x0, out double y0, out double r0, out double x1, out double y1, out double r1) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_radial_circles(cast(cairo_pattern_t*)this._cPtr, cast(double*)&x0, cast(double*)&y0, cast(double*)&r0, cast(double*)&x1, cast(double*)&y1, cast(double*)&r1);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Gets the solid color for a solid color pattern.
      
      Note that the color and alpha values are not premultiplied.
  
      Params:
        red = return value for red component of color, or null
        green = return value for green component of color, or null
        blue = return value for blue component of color, or null
        alpha = return value for alpha component of color, or null
      Returns: [gid.cairo1.types.Status.Success], or
        [gid.cairo1.types.Status.PatternTypeMismatch] if the pattern is not a solid
        color pattern.
  */
  gid.cairo1.types.Status getRgba(out double red, out double green, out double blue, out double alpha) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_rgba(cast(cairo_pattern_t*)this._cPtr, cast(double*)&red, cast(double*)&green, cast(double*)&blue, cast(double*)&alpha);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Gets the surface of a surface pattern.  The reference returned in
      surface is owned by the pattern; the caller should call
      [gid.cairo1.surface.Surface.reference] if the surface is to be retained.
  
      Params:
        surface = return value for surface of pattern, or null
      Returns: [gid.cairo1.types.Status.Success], or
        [gid.cairo1.types.Status.PatternTypeMismatch] if the pattern is not a surface
        pattern.
  */
  gid.cairo1.types.Status getSurface(out gid.cairo1.surface.Surface surface) nothrow
  {
    cairo_status_t _cretval;
    cairo_surface_t* _surface;
    _cretval = cairo_pattern_get_surface(cast(cairo_pattern_t*)this._cPtr, &_surface);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    if (_surface)
      surface = new gid.cairo1.surface.Surface(cast(void*)_surface, No.Take);
    return _retval;
  }

  /**
      Get the pattern's type.  See #cairo_pattern_type_t for available
      types.
      Returns: The type of pattern.
  */
  gid.cairo1.types.PatternType getPatternType() nothrow
  {
    cairo_pattern_type_t _cretval;
    _cretval = cairo_pattern_get_type(cast(cairo_pattern_t*)this._cPtr);
    gid.cairo1.types.PatternType _retval = cast(gid.cairo1.types.PatternType)_cretval;
    return _retval;
  }

  /**
      Return user data previously attached to pattern using the
      specified key.  If no user data has been attached with the given
      key this function returns null.
  
      Params:
        key = the address of the #cairo_user_data_key_t the user data was
          attached to
      Returns: the user data previously attached or null.
  */
  void* getUserData(gid.cairo1.types.UserDataKey key) nothrow
  {
    auto _retval = cairo_pattern_get_user_data(cast(cairo_pattern_t*)this._cPtr, cast(const(cairo_user_data_key_t)*)&key);
    return _retval;
  }

  /**
      Set the dithering mode of the rasterizer used for drawing shapes.
      This value is a hint, and a particular backend may or may not support
      a particular value.  At the current time, only pixman is supported.
  
      Params:
        dither = a #cairo_dither_t describing the new dithering mode
  */
  void setDither(gid.cairo1.types.Dither dither) nothrow
  {
    cairo_pattern_set_dither(cast(cairo_pattern_t*)this._cPtr, dither);
  }

  /**
      Sets the mode to be used for drawing outside the area of a pattern.
      See #cairo_extend_t for details on the semantics of each extend
      strategy.
      
      The default extend mode is [gid.cairo1.types.Extend.None] for surface patterns
      and [gid.cairo1.types.Extend.Pad] for gradient patterns.
  
      Params:
        extend = a #cairo_extend_t describing how the area outside of the
          pattern will be drawn
  */
  void setExtend(gid.cairo1.types.Extend extend) nothrow
  {
    cairo_pattern_set_extend(cast(cairo_pattern_t*)this._cPtr, extend);
  }

  /**
      Sets the filter to be used for resizing when using this pattern.
      See #cairo_filter_t for details on each filter.
      
      * Note that you might want to control filtering even when you do not
      have an explicit #cairo_pattern_t object, (for example when using
      [gid.cairo1.context.Context.setSourceSurface]). In these cases, it is convenient to
      use [gid.cairo1.context.Context.getSource] to get access to the pattern that cairo
      creates implicitly. For example:
      
      <informalexample><programlisting>
      cairo_set_source_surface (cr, image, x, y);
      cairo_pattern_set_filter (cairo_get_source (cr), CAIRO_FILTER_NEAREST);
      </programlisting></informalexample>
  
      Params:
        filter = a #cairo_filter_t describing the filter to use for resizing
          the pattern
  */
  void setFilter(gid.cairo1.types.Filter filter) nothrow
  {
    cairo_pattern_set_filter(cast(cairo_pattern_t*)this._cPtr, filter);
  }

  /**
      Sets the pattern's transformation matrix to matrix. This matrix is
      a transformation from user space to pattern space.
      
      When a pattern is first created it always has the identity matrix
      for its transformation matrix, which means that pattern space is
      initially identical to user space.
      
      Important: Please note that the direction of this transformation
      matrix is from user space to pattern space. This means that if you
      imagine the flow from a pattern to user space (and on to device
      space), then coordinates in that flow will be transformed by the
      inverse of the pattern matrix.
      
      For example, if you want to make a pattern appear twice as large as
      it does by default the correct code to use is:
      
      <informalexample><programlisting>
      cairo_matrix_init_scale (&amp;matrix, 0.5, 0.5);
      cairo_pattern_set_matrix (pattern, &amp;matrix);
      </programlisting></informalexample>
      
      Meanwhile, using values of 2.0 rather than 0.5 in the code above
      would cause the pattern to appear at half of its default size.
      
      Also, please note the discussion of the user-space locking
      semantics of [gid.cairo1.context.Context.setSource].
  
      Params:
        matrix = a #cairo_matrix_t
  */
  void setMatrix(gid.cairo1.matrix.Matrix matrix) nothrow
  {
    cairo_pattern_set_matrix(cast(cairo_pattern_t*)this._cPtr, cast(const(cairo_matrix_t)*)&matrix);
  }

  /**
      Checks whether an error has previously occurred for this
      pattern.
      Returns: [gid.cairo1.types.Status.Success], [gid.cairo1.types.Status.NoMemory],
        [gid.cairo1.types.Status.InvalidMatrix], [gid.cairo1.types.Status.PatternTypeMismatch],
        or [gid.cairo1.types.Status.InvalidMeshConstruction].
  */
  gid.cairo1.types.Status status() nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_status(cast(cairo_pattern_t*)this._cPtr);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }
}
