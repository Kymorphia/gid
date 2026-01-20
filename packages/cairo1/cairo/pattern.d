/// Module for [Pattern] class
module cairo.pattern;

import cairo.c.functions;
import cairo.c.types;
import cairo.matrix;
import cairo.surface;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A #cairo_pattern_t represents a source when drawing onto a
    surface. There are different subtypes of #cairo_pattern_t,
    for different types of sources; for example,
    [cairo.global.patternCreateRgb] creates a pattern for a solid
    opaque color.
    
    Other than various
    <function>cairo_pattern_create_<emphasis>type</emphasis>()</function>
    functions, some of the pattern types can be implicitly created using various
    <function>cairo_set_source_<emphasis>type</emphasis>()</function> functions;
    for example [cairo.context.Context.setSourceRgb].
    
    The type of a pattern can be queried with [cairo.pattern.Pattern.getPatternType].
    
    Memory management of #cairo_pattern_t is done with
    [cairo.pattern.Pattern.reference] and [cairo.pattern.Pattern.destroy].
*/
class Pattern : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_pattern_get_type != &gidSymbolNotFound ? cairo_gobject_pattern_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Pattern self()
  {
    return this;
  }

  /**
      Adds an opaque color stop to a gradient pattern. The offset
      specifies the location along the gradient's control vector. For
      example, a linear gradient's control vector is from (x0,y0) to
      (x1,y1) while a radial gradient's control vector is from any point
      on the start circle to the corresponding point on the end circle.
      
      The color is specified in the same way as in [cairo.context.Context.setSourceRgb].
      
      If two (or more) stops are specified with identical offset values,
      they will be sorted according to the order in which the stops are
      added, (stops added earlier will compare less than stops added
      later). This can be useful for reliably making sharp color
      transitions instead of the typical blend.
      
      
      Note: If the pattern is not a gradient pattern, (eg. a linear or
      radial pattern), then the pattern will be put into an error status
      with a status of [cairo.types.Status.PatternTypeMismatch].
  
      Params:
        offset = an offset in the range [0.0 .. 1.0]
        red = red component of color
        green = green component of color
        blue = blue component of color
  */
  void addColorStopRgb(double offset, double red, double green, double blue)
  {
    cairo_pattern_add_color_stop_rgb(cast(cairo_pattern_t*)this._cPtr, offset, red, green, blue);
  }

  /**
      Adds a translucent color stop to a gradient pattern. The offset
      specifies the location along the gradient's control vector. For
      example, a linear gradient's control vector is from (x0,y0) to
      (x1,y1) while a radial gradient's control vector is from any point
      on the start circle to the corresponding point on the end circle.
      
      The color is specified in the same way as in [cairo.context.Context.setSourceRgba].
      
      If two (or more) stops are specified with identical offset values,
      they will be sorted according to the order in which the stops are
      added, (stops added earlier will compare less than stops added
      later). This can be useful for reliably making sharp color
      transitions instead of the typical blend.
      
      Note: If the pattern is not a gradient pattern, (eg. a linear or
      radial pattern), then the pattern will be put into an error status
      with a status of [cairo.types.Status.PatternTypeMismatch].
  
      Params:
        offset = an offset in the range [0.0 .. 1.0]
        red = red component of color
        green = green component of color
        blue = blue component of color
        alpha = alpha component of color
  */
  void addColorStopRgba(double offset, double red, double green, double blue, double alpha)
  {
    cairo_pattern_add_color_stop_rgba(cast(cairo_pattern_t*)this._cPtr, offset, red, green, blue, alpha);
  }

  /**
      Gets the number of color stops specified in the given gradient
      pattern.
  
      Params:
        count = return value for the number of color stops, or null
      Returns: [cairo.types.Status.Success], or
        [cairo.types.Status.PatternTypeMismatch] if pattern is not a gradient
        pattern.
  */
  cairo.types.Status getColorStopCount(out int count)
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_color_stop_count(cast(cairo_pattern_t*)this._cPtr, cast(int*)&count);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Gets the color and offset information at the given index for a
      gradient pattern.  Values of index range from 0 to n-1
      where n is the number returned
      by [cairo.pattern.Pattern.getColorStopCount].
      
      Note that the color and alpha values are not premultiplied.
  
      Params:
        index = index of the stop to return data for
        offset = return value for the offset of the stop, or null
        red = return value for red component of color, or null
        green = return value for green component of color, or null
        blue = return value for blue component of color, or null
        alpha = return value for alpha component of color, or null
      Returns: [cairo.types.Status.Success], or [cairo.types.Status.InvalidIndex]
        if index is not valid for the given pattern.  If the pattern is
        not a gradient pattern, [cairo.types.Status.PatternTypeMismatch] is
        returned.
  */
  cairo.types.Status getColorStopRgba(int index, out double offset, out double red, out double green, out double blue, out double alpha)
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_color_stop_rgba(cast(cairo_pattern_t*)this._cPtr, index, cast(double*)&offset, cast(double*)&red, cast(double*)&green, cast(double*)&blue, cast(double*)&alpha);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Gets the current dithering mode, as set by
      [cairo.pattern.Pattern.setDither].
      Returns: the current dithering mode.
  */
  cairo.types.Dither getDither()
  {
    cairo_dither_t _cretval;
    _cretval = cairo_pattern_get_dither(cast(cairo_pattern_t*)this._cPtr);
    cairo.types.Dither _retval = cast(cairo.types.Dither)_cretval;
    return _retval;
  }

  /**
      Gets the current extend mode for a pattern.  See #cairo_extend_t
      for details on the semantics of each extend strategy.
      Returns: the current extend strategy used for drawing the
        pattern.
  */
  cairo.types.Extend getExtend()
  {
    cairo_extend_t _cretval;
    _cretval = cairo_pattern_get_extend(cast(cairo_pattern_t*)this._cPtr);
    cairo.types.Extend _retval = cast(cairo.types.Extend)_cretval;
    return _retval;
  }

  /**
      Gets the current filter for a pattern.  See #cairo_filter_t
      for details on each filter.
      Returns: the current filter used for resizing the pattern.
  */
  cairo.types.Filter getFilter()
  {
    cairo_filter_t _cretval;
    _cretval = cairo_pattern_get_filter(cast(cairo_pattern_t*)this._cPtr);
    cairo.types.Filter _retval = cast(cairo.types.Filter)_cretval;
    return _retval;
  }

  /**
      Gets the gradient endpoints for a linear gradient.
  
      Params:
        x0 = return value for the x coordinate of the first point, or null
        y0 = return value for the y coordinate of the first point, or null
        x1 = return value for the x coordinate of the second point, or null
        y1 = return value for the y coordinate of the second point, or null
      Returns: [cairo.types.Status.Success], or
        [cairo.types.Status.PatternTypeMismatch] if pattern is not a linear
        gradient pattern.
  */
  cairo.types.Status getLinearPoints(out double x0, out double y0, out double x1, out double y1)
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_linear_points(cast(cairo_pattern_t*)this._cPtr, cast(double*)&x0, cast(double*)&y0, cast(double*)&x1, cast(double*)&y1);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Stores the pattern's transformation matrix into matrix.
  
      Params:
        matrix = return value for the matrix
  */
  void getMatrix(out cairo.matrix.Matrix matrix)
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
      Returns: [cairo.types.Status.Success], or
        [cairo.types.Status.PatternTypeMismatch] if pattern is not a radial
        gradient pattern.
  */
  cairo.types.Status getRadialCircles(out double x0, out double y0, out double r0, out double x1, out double y1, out double r1)
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_radial_circles(cast(cairo_pattern_t*)this._cPtr, cast(double*)&x0, cast(double*)&y0, cast(double*)&r0, cast(double*)&x1, cast(double*)&y1, cast(double*)&r1);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
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
      Returns: [cairo.types.Status.Success], or
        [cairo.types.Status.PatternTypeMismatch] if the pattern is not a solid
        color pattern.
  */
  cairo.types.Status getRgba(out double red, out double green, out double blue, out double alpha)
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_rgba(cast(cairo_pattern_t*)this._cPtr, cast(double*)&red, cast(double*)&green, cast(double*)&blue, cast(double*)&alpha);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Gets the surface of a surface pattern.  The reference returned in
      surface is owned by the pattern; the caller should call
      [cairo.surface.Surface.reference] if the surface is to be retained.
  
      Params:
        surface = return value for surface of pattern, or null
      Returns: [cairo.types.Status.Success], or
        [cairo.types.Status.PatternTypeMismatch] if the pattern is not a surface
        pattern.
  */
  cairo.types.Status getSurface(cairo.surface.Surface surface)
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_get_surface(cast(cairo_pattern_t*)this._cPtr, surface ? cast(cairo_surface_t**)surface._cPtr(No.Dup) : null);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Get the pattern's type.  See #cairo_pattern_type_t for available
      types.
      Returns: The type of pattern.
  */
  cairo.types.PatternType getPatternType()
  {
    cairo_pattern_type_t _cretval;
    _cretval = cairo_pattern_get_type(cast(cairo_pattern_t*)this._cPtr);
    cairo.types.PatternType _retval = cast(cairo.types.PatternType)_cretval;
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
  void* getUserData(cairo.types.UserDataKey key)
  {
    auto _retval = cairo_pattern_get_user_data(cast(cairo_pattern_t*)this._cPtr, &key);
    return _retval;
  }

  /**
      Set the dithering mode of the rasterizer used for drawing shapes.
      This value is a hint, and a particular backend may or may not support
      a particular value.  At the current time, only pixman is supported.
  
      Params:
        dither = a #cairo_dither_t describing the new dithering mode
  */
  void setDither(cairo.types.Dither dither)
  {
    cairo_pattern_set_dither(cast(cairo_pattern_t*)this._cPtr, dither);
  }

  /**
      Sets the mode to be used for drawing outside the area of a pattern.
      See #cairo_extend_t for details on the semantics of each extend
      strategy.
      
      The default extend mode is [cairo.types.Extend.None] for surface patterns
      and [cairo.types.Extend.Pad] for gradient patterns.
  
      Params:
        extend = a #cairo_extend_t describing how the area outside of the
          pattern will be drawn
  */
  void setExtend(cairo.types.Extend extend)
  {
    cairo_pattern_set_extend(cast(cairo_pattern_t*)this._cPtr, extend);
  }

  /**
      Sets the filter to be used for resizing when using this pattern.
      See #cairo_filter_t for details on each filter.
      
      $(LIST
        * Note that you might want to control filtering even when you do not
      )
      have an explicit #cairo_pattern_t object, (for example when using
      [cairo.context.Context.setSourceSurface]). In these cases, it is convenient to
      use [cairo.context.Context.getSource] to get access to the pattern that cairo
      creates implicitly. For example:
      
      <informalexample><programlisting>
      cairo_set_source_surface (cr, image, x, y);
      cairo_pattern_set_filter (cairo_get_source (cr), CAIRO_FILTER_NEAREST);
      </programlisting></informalexample>
  
      Params:
        filter = a #cairo_filter_t describing the filter to use for resizing
          the pattern
  */
  void setFilter(cairo.types.Filter filter)
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
      semantics of [cairo.context.Context.setSource].
  
      Params:
        matrix = a #cairo_matrix_t
  */
  void setMatrix(cairo.matrix.Matrix matrix)
  {
    cairo_pattern_set_matrix(cast(cairo_pattern_t*)this._cPtr, cast(const(cairo_matrix_t)*)&matrix);
  }

  /**
      Checks whether an error has previously occurred for this
      pattern.
      Returns: [cairo.types.Status.Success], [cairo.types.Status.NoMemory],
        [cairo.types.Status.InvalidMatrix], [cairo.types.Status.PatternTypeMismatch],
        or [cairo.types.Status.InvalidMeshConstruction].
  */
  cairo.types.Status status()
  {
    cairo_status_t _cretval;
    _cretval = cairo_pattern_status(cast(cairo_pattern_t*)this._cPtr);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }
}
