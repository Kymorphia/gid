/// Module for [Context] class
module cairo.context;

import cairo.c.functions;
import cairo.c.types;
import cairo.font_face;
import cairo.font_options;
import cairo.glyph;
import cairo.matrix;
import cairo.path;
import cairo.pattern;
import cairo.rectangle_list;
import cairo.scaled_font;
import cairo.surface;
import cairo.text_cluster;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A #cairo_t contains the current state of the rendering device,
    including coordinates of yet to be drawn shapes.
    
    Cairo contexts, as #cairo_t objects are named, are central to
    cairo and all drawing with cairo is always done to a #cairo_t
    object.
    
    Memory management of #cairo_t is done with
    [cairo.global.reference] and [cairo.global.destroy].
*/
class Context : gobject.boxed.Boxed
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
    return cast(void function())cairo_gobject_context_get_type != &gidSymbolNotFound ? cairo_gobject_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Context self()
  {
    return this;
  }

  /**
      Append the path onto the current path. The path may be either the
      return value from one of [cairo.context.Context.copyPath] or
      [cairo.context.Context.copyPathFlat] or it may be constructed manually.  See
      #cairo_path_t for details on how the path data structure should be
      initialized, and note that <literal>path->status</literal> must be
      initialized to [cairo.types.Status.Success].
  
      Params:
        path = path to be appended
  */
  void appendPath(cairo.path.Path path)
  {
    cairo_append_path(cast(cairo_t*)this._cPtr, path ? cast(const(cairo_path_t)*)path._cPtr(No.Dup) : null);
  }

  /**
      Adds a circular arc of the given radius to the current path.  The
      arc is centered at (xc, yc), begins at angle1 and proceeds in
      the direction of increasing angles to end at angle2. If angle2 is
      less than angle1 it will be progressively increased by
      <literal>2*M_PI</literal> until it is greater than angle1.
      
      If there is a current point, an initial line segment will be added
      to the path to connect the current point to the beginning of the
      arc. If this initial line is undesired, it can be avoided by
      calling [cairo.context.Context.newSubPath] before calling [cairo.context.Context.arc].
      
      Angles are measured in radians. An angle of 0.0 is in the direction
      of the positive X axis (in user space). An angle of
      <literal>M_PI/2.0</literal> radians (90 degrees) is in the
      direction of the positive Y axis (in user space). Angles increase
      in the direction from the positive X axis toward the positive Y
      axis. So with the default transformation matrix, angles increase in
      a clockwise direction.
      
      (To convert from degrees to radians, use <literal>degrees * (M_PI /
      180.)</literal>.)
      
      This function gives the arc in the direction of increasing angles;
      see [cairo.context.Context.arcNegative] to get the arc in the direction of
      decreasing angles.
      
      The arc is circular in user space. To achieve an elliptical arc,
      you can scale the current transformation matrix by different
      amounts in the X and Y directions. For example, to draw an ellipse
      in the box given by x, y, width, height:
      
      <informalexample><programlisting>
      cairo_save (cr);
      cairo_translate (cr, x + width / 2., y + height / 2.);
      cairo_scale (cr, width / 2., height / 2.);
      cairo_arc (cr, 0., 0., 1., 0., 2 * M_PI);
      cairo_restore (cr);
      </programlisting></informalexample>
  
      Params:
        xc = X position of the center of the arc
        yc = Y position of the center of the arc
        radius = the radius of the arc
        angle1 = the start angle, in radians
        angle2 = the end angle, in radians
  */
  void arc(double xc, double yc, double radius, double angle1, double angle2)
  {
    cairo_arc(cast(cairo_t*)this._cPtr, xc, yc, radius, angle1, angle2);
  }

  /**
      Adds a circular arc of the given radius to the current path.  The
      arc is centered at (xc, yc), begins at angle1 and proceeds in
      the direction of decreasing angles to end at angle2. If angle2 is
      greater than angle1 it will be progressively decreased by
      <literal>2*M_PI</literal> until it is less than angle1.
      
      See [cairo.context.Context.arc] for more details. This function differs only in the
      direction of the arc between the two angles.
  
      Params:
        xc = X position of the center of the arc
        yc = Y position of the center of the arc
        radius = the radius of the arc
        angle1 = the start angle, in radians
        angle2 = the end angle, in radians
  */
  void arcNegative(double xc, double yc, double radius, double angle1, double angle2)
  {
    cairo_arc_negative(cast(cairo_t*)this._cPtr, xc, yc, radius, angle1, angle2);
  }

  /**
      Establishes a new clip region by intersecting the current clip
      region with the current path as it would be filled by [cairo.context.Context.fill]
      and according to the current fill rule (see [cairo.context.Context.setFillRule]).
      
      After [cairo.context.Context.clip], the current path will be cleared from the cairo
      context.
      
      The current clip region affects all drawing operations by
      effectively masking out any changes to the surface that are outside
      the current clip region.
      
      Calling [cairo.context.Context.clip] can only make the clip region smaller, never
      larger. But the current clip is part of the graphics state, so a
      temporary restriction of the clip region can be achieved by
      calling [cairo.context.Context.clip] within a [cairo.context.Context.save]/[cairo.context.Context.restore]
      pair. The only other means of increasing the size of the clip
      region is [cairo.context.Context.resetClip].
  */
  void clip()
  {
    cairo_clip(cast(cairo_t*)this._cPtr);
  }

  /**
      Computes a bounding box in user coordinates covering the area inside the
      current clip.
  
      Params:
        x1 = left of the resulting extents
        y1 = top of the resulting extents
        x2 = right of the resulting extents
        y2 = bottom of the resulting extents
  */
  void clipExtents(out double x1, out double y1, out double x2, out double y2)
  {
    cairo_clip_extents(cast(cairo_t*)this._cPtr, cast(double*)&x1, cast(double*)&y1, cast(double*)&x2, cast(double*)&y2);
  }

  /**
      Establishes a new clip region by intersecting the current clip
      region with the current path as it would be filled by [cairo.context.Context.fill]
      and according to the current fill rule (see [cairo.context.Context.setFillRule]).
      
      Unlike [cairo.context.Context.clip], [cairo.context.Context.clipPreserve] preserves the path within
      the cairo context.
      
      The current clip region affects all drawing operations by
      effectively masking out any changes to the surface that are outside
      the current clip region.
      
      Calling [cairo.context.Context.clipPreserve] can only make the clip region smaller, never
      larger. But the current clip is part of the graphics state, so a
      temporary restriction of the clip region can be achieved by
      calling [cairo.context.Context.clipPreserve] within a [cairo.context.Context.save]/[cairo.context.Context.restore]
      pair. The only other means of increasing the size of the clip
      region is [cairo.context.Context.resetClip].
  */
  void clipPreserve()
  {
    cairo_clip_preserve(cast(cairo_t*)this._cPtr);
  }

  /**
      Adds a line segment to the path from the current point to the
      beginning of the current sub-path, (the most recent point passed to
      [cairo.context.Context.moveTo]), and closes this sub-path. After this call the
      current point will be at the joined endpoint of the sub-path.
      
      The behavior of [cairo.context.Context.closePath] is distinct from simply calling
      [cairo.context.Context.lineTo] with the equivalent coordinate in the case of
      stroking. When a closed sub-path is stroked, there are no caps on
      the ends of the sub-path. Instead, there is a line join connecting
      the final and initial segments of the sub-path.
      
      If there is no current point before the call to [cairo.context.Context.closePath],
      this function will have no effect.
      
      Note: As of cairo version 1.2.4 any call to [cairo.context.Context.closePath] will
      place an explicit MOVE_TO element into the path immediately after
      the CLOSE_PATH element, (which can be seen in [cairo.context.Context.copyPath] for
      example). This can simplify path processing in some cases as it may
      not be necessary to save the "last move_to point" during processing
      as the MOVE_TO immediately after the CLOSE_PATH will provide that
      point.
  */
  void closePath()
  {
    cairo_close_path(cast(cairo_t*)this._cPtr);
  }

  /**
      Gets the current clip region as a list of rectangles in user coordinates.
      Never returns null.
      
      The status in the list may be [cairo.types.Status.ClipNotRepresentable] to
      indicate that the clip region cannot be represented as a list of
      user-space rectangles. The status may have other values to indicate
      other errors.
      Returns: the current clip region as a list of rectangles in user coordinates,
        which should be destroyed using [cairo.rectangle_list.RectangleList.destroy].
  */
  cairo.rectangle_list.RectangleList copyClipRectangleList()
  {
    cairo_rectangle_list_t* _cretval;
    _cretval = cairo_copy_clip_rectangle_list(cast(cairo_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.rectangle_list.RectangleList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Emits the current page for backends that support multiple pages, but
      doesn't clear it, so, the contents of the current page will be retained
      for the next page too.  Use [cairo.context.Context.showPage] if you want to get an
      empty page after the emission.
      
      This is a convenience function that simply calls
      [cairo.surface.Surface.copyPage] on cr's target.
  */
  void copyPage()
  {
    cairo_copy_page(cast(cairo_t*)this._cPtr);
  }

  /**
      Creates a copy of the current path and returns it to the user as a
      #cairo_path_t. See #cairo_path_data_t for hints on how to iterate
      over the returned data structure.
      
      This function will always return a valid pointer, but the result
      will have no data (<literal>data==null</literal> and
      <literal>num_data==0</literal>), if either of the following
      conditions hold:
      
      <orderedlist>
      <listitem>If there is insufficient memory to copy the path. In this
          case <literal>path->status</literal> will be set to
          [cairo.types.Status.NoMemory].</listitem>
      <listitem>If cr is already in an error state. In this case
         <literal>path->status</literal> will contain the same status that
         would be returned by [cairo.context.Context.status].</listitem>
      </orderedlist>
      Returns: the copy of the current path. The caller owns the
        returned object and should call [cairo.path.Path.destroy] when finished
        with it.
  */
  cairo.path.Path copyPath()
  {
    cairo_path_t* _cretval;
    _cretval = cairo_copy_path(cast(cairo_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.path.Path(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a flattened copy of the current path and returns it to the
      user as a #cairo_path_t. See #cairo_path_data_t for hints on
      how to iterate over the returned data structure.
      
      This function is like [cairo.context.Context.copyPath] except that any curves
      in the path will be approximated with piecewise-linear
      approximations, (accurate to within the current tolerance
      value). That is, the result is guaranteed to not have any elements
      of type [cairo.types.PathDataType.CurveTo] which will instead be replaced by a
      series of [cairo.types.PathDataType.LineTo] elements.
      
      This function will always return a valid pointer, but the result
      will have no data (<literal>data==null</literal> and
      <literal>num_data==0</literal>), if either of the following
      conditions hold:
      
      <orderedlist>
      <listitem>If there is insufficient memory to copy the path. In this
          case <literal>path->status</literal> will be set to
          [cairo.types.Status.NoMemory].</listitem>
      <listitem>If cr is already in an error state. In this case
         <literal>path->status</literal> will contain the same status that
         would be returned by [cairo.context.Context.status].</listitem>
      </orderedlist>
      Returns: the copy of the current path. The caller owns the
        returned object and should call [cairo.path.Path.destroy] when finished
        with it.
  */
  cairo.path.Path copyPathFlat()
  {
    cairo_path_t* _cretval;
    _cretval = cairo_copy_path_flat(cast(cairo_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.path.Path(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adds a cubic Bézier spline to the path from the current point to
      position (x3, y3) in user-space coordinates, using (x1, y1) and
      (x2, y2) as the control points. After this call the current point
      will be (x3, y3).
      
      If there is no current point before the call to [cairo.context.Context.curveTo]
      this function will behave as if preceded by a call to
      cairo_move_to(cr, x1, y1).
  
      Params:
        x1 = the X coordinate of the first control point
        y1 = the Y coordinate of the first control point
        x2 = the X coordinate of the second control point
        y2 = the Y coordinate of the second control point
        x3 = the X coordinate of the end of the curve
        y3 = the Y coordinate of the end of the curve
  */
  void curveTo(double x1, double y1, double x2, double y2, double x3, double y3)
  {
    cairo_curve_to(cast(cairo_t*)this._cPtr, x1, y1, x2, y2, x3, y3);
  }

  /**
      Transform a coordinate from device space to user space by
      multiplying the given point by the inverse of the current
      transformation matrix (CTM).
  
      Params:
        x = X value of coordinate (in/out parameter)
        y = Y value of coordinate (in/out parameter)
  */
  void deviceToUser(out double x, out double y)
  {
    cairo_device_to_user(cast(cairo_t*)this._cPtr, cast(double*)&x, cast(double*)&y);
  }

  /**
      Transform a distance vector from device space to user space. This
      function is similar to [cairo.context.Context.deviceToUser] except that the
      translation components of the inverse CTM will be ignored when
      transforming (dx,dy).
  
      Params:
        dx = X component of a distance vector (in/out parameter)
        dy = Y component of a distance vector (in/out parameter)
  */
  void deviceToUserDistance(out double dx, out double dy)
  {
    cairo_device_to_user_distance(cast(cairo_t*)this._cPtr, cast(double*)&dx, cast(double*)&dy);
  }

  /**
      A drawing operator that fills the current path according to the
      current fill rule, (each sub-path is implicitly closed before being
      filled). After [cairo.context.Context.fill], the current path will be cleared from
      the cairo context. See [cairo.context.Context.setFillRule] and
      [cairo.context.Context.fillPreserve].
  */
  void fill()
  {
    cairo_fill(cast(cairo_t*)this._cPtr);
  }

  /**
      Computes a bounding box in user coordinates covering the area that
      would be affected, (the "inked" area), by a [cairo.context.Context.fill] operation
      given the current path and fill parameters. If the current path is
      empty, returns an empty rectangle ((0,0), (0,0)). Surface
      dimensions and clipping are not taken into account.
      
      Contrast with [cairo.context.Context.pathExtents], which is similar, but returns
      non-zero extents for some paths with no inked area, (such as a
      simple line segment).
      
      Note that [cairo.context.Context.fillExtents] must necessarily do more work to
      compute the precise inked areas in light of the fill rule, so
      [cairo.context.Context.pathExtents] may be more desirable for sake of performance
      if the non-inked path extents are desired.
      
      See [cairo.context.Context.fill], [cairo.context.Context.setFillRule] and [cairo.context.Context.fillPreserve].
  
      Params:
        x1 = left of the resulting extents
        y1 = top of the resulting extents
        x2 = right of the resulting extents
        y2 = bottom of the resulting extents
  */
  void fillExtents(out double x1, out double y1, out double x2, out double y2)
  {
    cairo_fill_extents(cast(cairo_t*)this._cPtr, cast(double*)&x1, cast(double*)&y1, cast(double*)&x2, cast(double*)&y2);
  }

  /**
      A drawing operator that fills the current path according to the
      current fill rule, (each sub-path is implicitly closed before being
      filled). Unlike [cairo.context.Context.fill], [cairo.context.Context.fillPreserve] preserves the
      path within the cairo context.
      
      See [cairo.context.Context.setFillRule] and [cairo.context.Context.fill].
  */
  void fillPreserve()
  {
    cairo_fill_preserve(cast(cairo_t*)this._cPtr);
  }

  /**
      Gets the font extents for the currently selected font.
  
      Params:
        extents = a #cairo_font_extents_t object into which the results
          will be stored.
  */
  void fontExtents(out cairo.types.FontExtents extents)
  {
    cairo_font_extents(cast(cairo_t*)this._cPtr, &extents);
  }

  /**
      Gets the current shape antialiasing mode, as set by
      [cairo.context.Context.setAntialias].
      Returns: the current shape antialiasing mode.
  */
  cairo.types.Antialias getAntialias()
  {
    cairo_antialias_t _cretval;
    _cretval = cairo_get_antialias(cast(cairo_t*)this._cPtr);
    cairo.types.Antialias _retval = cast(cairo.types.Antialias)_cretval;
    return _retval;
  }

  /**
      Gets the current point of the current path, which is
      conceptually the final point reached by the path so far.
      
      The current point is returned in the user-space coordinate
      system. If there is no defined current point or if cr is in an
      error status, `x` and `y` will both be set to 0.0. It is possible to
      check this in advance with [cairo.context.Context.hasCurrentPoint].
      
      Most path construction functions alter the current point. See the
      following for details on how they affect the current point:
      [cairo.context.Context.newPath], [cairo.context.Context.newSubPath],
      [cairo.context.Context.appendPath], [cairo.context.Context.closePath],
      [cairo.context.Context.moveTo], [cairo.context.Context.lineTo], [cairo.context.Context.curveTo],
      [cairo.context.Context.relMoveTo], [cairo.context.Context.relLineTo], [cairo.context.Context.relCurveTo],
      [cairo.context.Context.arc], [cairo.context.Context.arcNegative], [cairo.context.Context.rectangle],
      [cairo.context.Context.textPath], [cairo.context.Context.glyphPath].
      
      Some functions use and alter the current point but do not
      otherwise change current path:
      [cairo.context.Context.showText].
      
      Some functions unset the current path and as a result, current point:
      [cairo.context.Context.fill], [cairo.context.Context.stroke].
  
      Params:
        x = return value for X coordinate of the current point
        y = return value for Y coordinate of the current point
  */
  void getCurrentPoint(out double x, out double y)
  {
    cairo_get_current_point(cast(cairo_t*)this._cPtr, cast(double*)&x, cast(double*)&y);
  }

  /**
      Gets the current dash array.  If not null, dashes should be big
      enough to hold at least the number of values returned by
      [cairo.context.Context.getDashCount].
  
      Params:
        dashes = return value for the dash array, or null
        offset = return value for the current dash offset, or null
  */
  void getDash(out double dashes, out double offset)
  {
    cairo_get_dash(cast(cairo_t*)this._cPtr, cast(double*)&dashes, cast(double*)&offset);
  }

  /**
      This function returns the length of the dash array in cr (0 if dashing
      is not currently in effect).
      
      See also [cairo.context.Context.setDash] and [cairo.context.Context.getDash].
      Returns: the length of the dash array, or 0 if no dash array set.
  */
  int getDashCount()
  {
    int _retval;
    _retval = cairo_get_dash_count(cast(cairo_t*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current fill rule, as set by [cairo.context.Context.setFillRule].
      Returns: the current fill rule.
  */
  cairo.types.FillRule getFillRule()
  {
    cairo_fill_rule_t _cretval;
    _cretval = cairo_get_fill_rule(cast(cairo_t*)this._cPtr);
    cairo.types.FillRule _retval = cast(cairo.types.FillRule)_cretval;
    return _retval;
  }

  /**
      Gets the current font face for a #cairo_t.
      Returns: the current font face.  This object is owned by
        cairo. To keep a reference to it, you must call
        [cairo.font_face.FontFace.reference].
        
        This function never returns null. If memory cannot be allocated, a
        special "nil" #cairo_font_face_t object will be returned on which
        [cairo.font_face.FontFace.status] returns [cairo.types.Status.NoMemory]. Using
        this nil object will cause its error state to propagate to other
        objects it is passed to, (for example, calling
        [cairo.context.Context.setFontFace] with a nil font will trigger an error that
        will shutdown the #cairo_t object).
  */
  cairo.font_face.FontFace getFontFace()
  {
    cairo_font_face_t* _cretval;
    _cretval = cairo_get_font_face(cast(cairo_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.font_face.FontFace(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Stores the current font matrix into matrix. See
      [cairo.context.Context.setFontMatrix].
  
      Params:
        matrix = return value for the matrix
  */
  void getFontMatrix(out cairo.matrix.Matrix matrix)
  {
    cairo_get_font_matrix(cast(cairo_t*)this._cPtr, cast(cairo_matrix_t*)&matrix);
  }

  /**
      Retrieves font rendering options set via #cairo_set_font_options.
      Note that the returned options do not include any options derived
      from the underlying surface; they are literally the options
      passed to [cairo.context.Context.setFontOptions].
  
      Params:
        options = a #cairo_font_options_t object into which to store
            the retrieved options. All existing values are overwritten
  */
  void getFontOptions(cairo.font_options.FontOptions options)
  {
    cairo_get_font_options(cast(cairo_t*)this._cPtr, options ? cast(cairo_font_options_t*)options._cPtr(No.Dup) : null);
  }

  /**
      Gets the current destination surface for the context. This is either
      the original target surface as passed to [cairo.global.create] or the target
      surface for the current group as started by the most recent call to
      [cairo.context.Context.pushGroup] or [cairo.context.Context.pushGroupWithContent].
      
      This function will always return a valid pointer, but the result
      can be a "nil" surface if cr is already in an error state,
      (ie. [cairo.context.Context.status] <literal>!=</literal> [cairo.types.Status.Success]).
      A nil surface is indicated by [cairo.surface.Surface.status]
      <literal>!=</literal> [cairo.types.Status.Success].
      Returns: the target surface. This object is owned by cairo. To
        keep a reference to it, you must call [cairo.surface.Surface.reference].
  */
  cairo.surface.Surface getGroupTarget()
  {
    cairo_surface_t* _cretval;
    _cretval = cairo_get_group_target(cast(cairo_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns whether or not hairline mode is set, as set by [cairo.context.Context.setHairline].
      Returns: whether hairline mode is set.
  */
  cairo.types.Bool getHairline()
  {
    cairo.types.Bool _retval;
    _retval = cairo_get_hairline(cast(cairo_t*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current line cap style, as set by [cairo.context.Context.setLineCap].
      Returns: the current line cap style.
  */
  cairo.types.LineCap getLineCap()
  {
    cairo_line_cap_t _cretval;
    _cretval = cairo_get_line_cap(cast(cairo_t*)this._cPtr);
    cairo.types.LineCap _retval = cast(cairo.types.LineCap)_cretval;
    return _retval;
  }

  /**
      Gets the current line join style, as set by [cairo.context.Context.setLineJoin].
      Returns: the current line join style.
  */
  cairo.types.LineJoin getLineJoin()
  {
    cairo_line_join_t _cretval;
    _cretval = cairo_get_line_join(cast(cairo_t*)this._cPtr);
    cairo.types.LineJoin _retval = cast(cairo.types.LineJoin)_cretval;
    return _retval;
  }

  /**
      This function returns the current line width value exactly as set by
      [cairo.context.Context.setLineWidth]. Note that the value is unchanged even if
      the CTM has changed between the calls to [cairo.context.Context.setLineWidth] and
      [cairo.context.Context.getLineWidth].
      Returns: the current line width.
  */
  double getLineWidth()
  {
    double _retval;
    _retval = cairo_get_line_width(cast(cairo_t*)this._cPtr);
    return _retval;
  }

  /**
      Stores the current transformation matrix (CTM) into matrix.
  
      Params:
        matrix = return value for the matrix
  */
  void getMatrix(out cairo.matrix.Matrix matrix)
  {
    cairo_get_matrix(cast(cairo_t*)this._cPtr, cast(cairo_matrix_t*)&matrix);
  }

  /**
      Gets the current miter limit, as set by [cairo.context.Context.setMiterLimit].
      Returns: the current miter limit.
  */
  double getMiterLimit()
  {
    double _retval;
    _retval = cairo_get_miter_limit(cast(cairo_t*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current compositing operator for a cairo context.
      Returns: the current compositing operator.
  */
  cairo.types.Operator getOperator()
  {
    cairo_operator_t _cretval;
    _cretval = cairo_get_operator(cast(cairo_t*)this._cPtr);
    cairo.types.Operator _retval = cast(cairo.types.Operator)_cretval;
    return _retval;
  }

  /**
      Gets the current scaled font for a #cairo_t.
      Returns: the current scaled font. This object is owned by
        cairo. To keep a reference to it, you must call
        [cairo.scaled_font.ScaledFont.reference].
        
        This function never returns null. If memory cannot be allocated, a
        special "nil" #cairo_scaled_font_t object will be returned on which
        [cairo.scaled_font.ScaledFont.status] returns [cairo.types.Status.NoMemory]. Using
        this nil object will cause its error state to propagate to other
        objects it is passed to, (for example, calling
        [cairo.context.Context.setScaledFont] with a nil font will trigger an error that
        will shutdown the #cairo_t object).
  */
  cairo.scaled_font.ScaledFont getScaledFont()
  {
    cairo_scaled_font_t* _cretval;
    _cretval = cairo_get_scaled_font(cast(cairo_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.scaled_font.ScaledFont(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the current source pattern for cr.
      Returns: the current source pattern. This object is owned by
        cairo. To keep a reference to it, you must call
        [cairo.pattern.Pattern.reference].
  */
  cairo.pattern.Pattern getSource()
  {
    cairo_pattern_t* _cretval;
    _cretval = cairo_get_source(cast(cairo_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the target surface for the cairo context as passed to
      [cairo.global.create].
      
      This function will always return a valid pointer, but the result
      can be a "nil" surface if cr is already in an error state,
      (ie. [cairo.context.Context.status] <literal>!=</literal> [cairo.types.Status.Success]).
      A nil surface is indicated by [cairo.surface.Surface.status]
      <literal>!=</literal> [cairo.types.Status.Success].
      Returns: the target surface. This object is owned by cairo. To
        keep a reference to it, you must call [cairo.surface.Surface.reference].
  */
  cairo.surface.Surface getTarget()
  {
    cairo_surface_t* _cretval;
    _cretval = cairo_get_target(cast(cairo_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the current tolerance value, as set by [cairo.context.Context.setTolerance].
      Returns: the current tolerance value.
  */
  double getTolerance()
  {
    double _retval;
    _retval = cairo_get_tolerance(cast(cairo_t*)this._cPtr);
    return _retval;
  }

  /**
      Gets the extents for an array of glyphs. The extents describe a
      user-space rectangle that encloses the "inked" portion of the
      glyphs, (as they would be drawn by [cairo.context.Context.showGlyphs]).
      Additionally, the x_advance and y_advance values indicate the
      amount by which the current point would be advanced by
      [cairo.context.Context.showGlyphs].
      
      Note that whitespace glyphs do not contribute to the size of the
      rectangle (extents.width and extents.height).
  
      Params:
        glyphs = an array of #cairo_glyph_t objects
        numGlyphs = the number of elements in glyphs
        extents = a #cairo_text_extents_t object into which the results
          will be stored
  */
  void glyphExtents(cairo.glyph.Glyph glyphs, int numGlyphs, out cairo.types.TextExtents extents)
  {
    cairo_glyph_extents(cast(cairo_t*)this._cPtr, cast(const(cairo_glyph_t)*)&glyphs, numGlyphs, &extents);
  }

  /**
      Adds closed paths for the glyphs to the current path.  The generated
      path if filled, achieves an effect similar to that of
      [cairo.context.Context.showGlyphs].
  
      Params:
        glyphs = array of glyphs to show
        numGlyphs = number of glyphs to show
  */
  void glyphPath(cairo.glyph.Glyph glyphs, int numGlyphs)
  {
    cairo_glyph_path(cast(cairo_t*)this._cPtr, cast(const(cairo_glyph_t)*)&glyphs, numGlyphs);
  }

  /**
      Returns whether a current point is defined on the current path.
      See [cairo.context.Context.getCurrentPoint] for details on the current point.
      Returns: whether a current point is defined.
  */
  cairo.types.Bool hasCurrentPoint()
  {
    cairo.types.Bool _retval;
    _retval = cairo_has_current_point(cast(cairo_t*)this._cPtr);
    return _retval;
  }

  /**
      Resets the current transformation matrix (CTM) by setting it equal
      to the identity matrix. That is, the user-space and device-space
      axes will be aligned and one user-space unit will transform to one
      device-space unit.
  */
  void identityMatrix()
  {
    cairo_identity_matrix(cast(cairo_t*)this._cPtr);
  }

  /**
      Tests whether the given point is inside the area that would be
      visible through the current clip, i.e. the area that would be filled by
      a [cairo.context.Context.paint] operation.
      
      See [cairo.context.Context.clip], and [cairo.context.Context.clipPreserve].
  
      Params:
        x = X coordinate of the point to test
        y = Y coordinate of the point to test
      Returns: A non-zero value if the point is inside, or zero if
        outside.
  */
  cairo.types.Bool inClip(double x, double y)
  {
    cairo.types.Bool _retval;
    _retval = cairo_in_clip(cast(cairo_t*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Tests whether the given point is inside the area that would be
      affected by a [cairo.context.Context.fill] operation given the current path and
      filling parameters. Surface dimensions and clipping are not taken
      into account.
      
      See [cairo.context.Context.fill], [cairo.context.Context.setFillRule] and [cairo.context.Context.fillPreserve].
  
      Params:
        x = X coordinate of the point to test
        y = Y coordinate of the point to test
      Returns: A non-zero value if the point is inside, or zero if
        outside.
  */
  cairo.types.Bool inFill(double x, double y)
  {
    cairo.types.Bool _retval;
    _retval = cairo_in_fill(cast(cairo_t*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Tests whether the given point is inside the area that would be
      affected by a [cairo.context.Context.stroke] operation given the current path and
      stroking parameters. Surface dimensions and clipping are not taken
      into account.
      
      See [cairo.context.Context.stroke], [cairo.context.Context.setLineWidth], [cairo.context.Context.setLineJoin],
      [cairo.context.Context.setLineCap], [cairo.context.Context.setDash], and
      [cairo.context.Context.strokePreserve].
  
      Params:
        x = X coordinate of the point to test
        y = Y coordinate of the point to test
      Returns: A non-zero value if the point is inside, or zero if
        outside.
  */
  cairo.types.Bool inStroke(double x, double y)
  {
    cairo.types.Bool _retval;
    _retval = cairo_in_stroke(cast(cairo_t*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Adds a line to the path from the current point to position (`x`, `y`)
      in user-space coordinates. After this call the current point
      will be (`x`, `y`).
      
      If there is no current point before the call to [cairo.context.Context.lineTo]
      this function will behave as cairo_move_to(cr, `x`, `y`).
  
      Params:
        x = the X coordinate of the end of the new line
        y = the Y coordinate of the end of the new line
  */
  void lineTo(double x, double y)
  {
    cairo_line_to(cast(cairo_t*)this._cPtr, x, y);
  }

  /**
      A drawing operator that paints the current source
      using the alpha channel of pattern as a mask. (Opaque
      areas of pattern are painted with the source, transparent
      areas are not painted.)
  
      Params:
        pattern = a #cairo_pattern_t
  */
  void mask(cairo.pattern.Pattern pattern)
  {
    cairo_mask(cast(cairo_t*)this._cPtr, pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null);
  }

  /**
      A drawing operator that paints the current source
      using the alpha channel of surface as a mask. (Opaque
      areas of surface are painted with the source, transparent
      areas are not painted.)
  
      Params:
        surface = a #cairo_surface_t
        surfaceX = X coordinate at which to place the origin of surface
        surfaceY = Y coordinate at which to place the origin of surface
  */
  void maskSurface(cairo.surface.Surface surface, double surfaceX, double surfaceY)
  {
    cairo_mask_surface(cast(cairo_t*)this._cPtr, surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, surfaceX, surfaceY);
  }

  /**
      Begin a new sub-path. After this call the current point will be (`x`,
      `y`).
  
      Params:
        x = the X coordinate of the new position
        y = the Y coordinate of the new position
  */
  void moveTo(double x, double y)
  {
    cairo_move_to(cast(cairo_t*)this._cPtr, x, y);
  }

  /**
      Clears the current path. After this call there will be no path and
      no current point.
  */
  void newPath()
  {
    cairo_new_path(cast(cairo_t*)this._cPtr);
  }

  /**
      Begin a new sub-path. Note that the existing path is not
      affected. After this call there will be no current point.
      
      In many cases, this call is not needed since new sub-paths are
      frequently started with [cairo.context.Context.moveTo].
      
      A call to [cairo.context.Context.newSubPath] is particularly useful when
      beginning a new sub-path with one of the [cairo.context.Context.arc] calls. This
      makes things easier as it is no longer necessary to manually
      compute the arc's initial coordinates for a call to
      [cairo.context.Context.moveTo].
  */
  void newSubPath()
  {
    cairo_new_sub_path(cast(cairo_t*)this._cPtr);
  }

  /**
      A drawing operator that paints the current source everywhere within
      the current clip region.
  */
  void paint()
  {
    cairo_paint(cast(cairo_t*)this._cPtr);
  }

  /**
      A drawing operator that paints the current source everywhere within
      the current clip region using a mask of constant alpha value
      alpha. The effect is similar to [cairo.context.Context.paint], but the drawing
      is faded out using the alpha value.
  
      Params:
        alpha = alpha value, between 0 (transparent) and 1 (opaque)
  */
  void paintWithAlpha(double alpha)
  {
    cairo_paint_with_alpha(cast(cairo_t*)this._cPtr, alpha);
  }

  /**
      Computes a bounding box in user-space coordinates covering the
      points on the current path. If the current path is empty, returns
      an empty rectangle ((0,0), (0,0)). Stroke parameters, fill rule,
      surface dimensions and clipping are not taken into account.
      
      Contrast with [cairo.context.Context.fillExtents] and [cairo.context.Context.strokeExtents] which
      return the extents of only the area that would be "inked" by
      the corresponding drawing operations.
      
      The result of [cairo.context.Context.pathExtents] is defined as equivalent to the
      limit of [cairo.context.Context.strokeExtents] with [cairo.types.LineCap.Round] as the
      line width approaches 0.0, (but never reaching the empty-rectangle
      returned by [cairo.context.Context.strokeExtents] for a line width of 0.0).
      
      Specifically, this means that zero-area sub-paths such as
      [cairo.context.Context.moveTo];[cairo.context.Context.lineTo] segments, (even degenerate cases
      where the coordinates to both calls are identical), will be
      considered as contributing to the extents. However, a lone
      [cairo.context.Context.moveTo] will not contribute to the results of
      [cairo.context.Context.pathExtents].
  
      Params:
        x1 = left of the resulting extents
        y1 = top of the resulting extents
        x2 = right of the resulting extents
        y2 = bottom of the resulting extents
  */
  void pathExtents(out double x1, out double y1, out double x2, out double y2)
  {
    cairo_path_extents(cast(cairo_t*)this._cPtr, cast(double*)&x1, cast(double*)&y1, cast(double*)&x2, cast(double*)&y2);
  }

  /**
      Terminates the redirection begun by a call to [cairo.context.Context.pushGroup] or
      [cairo.context.Context.pushGroupWithContent] and returns a new pattern
      containing the results of all drawing operations performed to the
      group.
      
      The [cairo.context.Context.popGroup] function calls [cairo.context.Context.restore], (balancing a
      call to [cairo.context.Context.save] by the push_group function), so that any
      changes to the graphics state will not be visible outside the
      group.
      Returns: a newly created (surface) pattern containing the
        results of all drawing operations performed to the group. The
        caller owns the returned object and should call
        [cairo.pattern.Pattern.destroy] when finished with it.
  */
  cairo.pattern.Pattern popGroup()
  {
    cairo_pattern_t* _cretval;
    _cretval = cairo_pop_group(cast(cairo_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Terminates the redirection begun by a call to [cairo.context.Context.pushGroup] or
      [cairo.context.Context.pushGroupWithContent] and installs the resulting pattern
      as the source pattern in the given cairo context.
      
      The behavior of this function is equivalent to the sequence of
      operations:
      
      <informalexample><programlisting>
      cairo_pattern_t *group = cairo_pop_group (cr);
      cairo_set_source (cr, group);
      cairo_pattern_destroy (group);
      </programlisting></informalexample>
      
      but is more convenient as their is no need for a variable to store
      the short-lived pointer to the pattern.
      
      The [cairo.context.Context.popGroup] function calls [cairo.context.Context.restore], (balancing a
      call to [cairo.context.Context.save] by the push_group function), so that any
      changes to the graphics state will not be visible outside the
      group.
  */
  void popGroupToSource()
  {
    cairo_pop_group_to_source(cast(cairo_t*)this._cPtr);
  }

  /**
      Temporarily redirects drawing to an intermediate surface known as a
      group. The redirection lasts until the group is completed by a call
      to [cairo.context.Context.popGroup] or [cairo.context.Context.popGroupToSource]. These calls
      provide the result of any drawing to the group as a pattern,
      (either as an explicit object, or set as the source pattern).
      
      This group functionality can be convenient for performing
      intermediate compositing. One common use of a group is to render
      objects as opaque within the group, (so that they occlude each
      other), and then blend the result with translucence onto the
      destination.
      
      Groups can be nested arbitrarily deep by making balanced calls to
      [cairo.context.Context.pushGroup]/[cairo.context.Context.popGroup]. Each call pushes/pops the new
      target group onto/from a stack.
      
      The [cairo.context.Context.pushGroup] function calls [cairo.context.Context.save] so that any
      changes to the graphics state will not be visible outside the
      group, (the pop_group functions call [cairo.context.Context.restore]).
      
      By default the intermediate group will have a content type of
      [cairo.types.Content.ColorAlpha]. Other content types can be chosen for
      the group by using [cairo.context.Context.pushGroupWithContent] instead.
      
      As an example, here is how one might fill and stroke a path with
      translucence, but without any portion of the fill being visible
      under the stroke:
      
      <informalexample><programlisting>
      cairo_push_group (cr);
      cairo_set_source (cr, fill_pattern);
      cairo_fill_preserve (cr);
      cairo_set_source (cr, stroke_pattern);
      cairo_stroke (cr);
      cairo_pop_group_to_source (cr);
      cairo_paint_with_alpha (cr, alpha);
      </programlisting></informalexample>
  */
  void pushGroup()
  {
    cairo_push_group(cast(cairo_t*)this._cPtr);
  }

  /**
      Temporarily redirects drawing to an intermediate surface known as a
      group. The redirection lasts until the group is completed by a call
      to [cairo.context.Context.popGroup] or [cairo.context.Context.popGroupToSource]. These calls
      provide the result of any drawing to the group as a pattern,
      (either as an explicit object, or set as the source pattern).
      
      The group will have a content type of content. The ability to
      control this content type is the only distinction between this
      function and [cairo.context.Context.pushGroup] which you should see for a more
      detailed description of group rendering.
  
      Params:
        content = a #cairo_content_t indicating the type of group that
                    will be created
  */
  void pushGroupWithContent(cairo.types.Content content)
  {
    cairo_push_group_with_content(cast(cairo_t*)this._cPtr, content);
  }

  /**
      Adds a closed sub-path rectangle of the given size to the current
      path at position (`x`, `y`) in user-space coordinates.
      
      This function is logically equivalent to:
      <informalexample><programlisting>
      cairo_move_to (cr, x, y);
      cairo_rel_line_to (cr, width, 0);
      cairo_rel_line_to (cr, 0, height);
      cairo_rel_line_to (cr, -width, 0);
      cairo_close_path (cr);
      </programlisting></informalexample>
  
      Params:
        x = the X coordinate of the top left corner of the rectangle
        y = the Y coordinate to the top left corner of the rectangle
        width = the width of the rectangle
        height = the height of the rectangle
  */
  void rectangle(double x, double y, double width, double height)
  {
    cairo_rectangle(cast(cairo_t*)this._cPtr, x, y, width, height);
  }

  /**
      Relative-coordinate version of [cairo.context.Context.curveTo]. All offsets are
      relative to the current point. Adds a cubic Bézier spline to the
      path from the current point to a point offset from the current
      point by (dx3, dy3), using points offset by (dx1, dy1) and
      (dx2, dy2) as the control points. After this call the current
      point will be offset by (dx3, dy3).
      
      Given a current point of (x, y), cairo_rel_curve_to(cr, dx1,
      dy1, dx2, dy2, dx3, dy3) is logically equivalent to
      cairo_curve_to(cr, x+dx1, y+dy1, x+dx2, y+dy2, x+dx3, y+dy3).
      
      It is an error to call this function with no current point. Doing
      so will cause cr to shutdown with a status of
      [cairo.types.Status.NoCurrentPoint].
  
      Params:
        dx1 = the X offset to the first control point
        dy1 = the Y offset to the first control point
        dx2 = the X offset to the second control point
        dy2 = the Y offset to the second control point
        dx3 = the X offset to the end of the curve
        dy3 = the Y offset to the end of the curve
  */
  void relCurveTo(double dx1, double dy1, double dx2, double dy2, double dx3, double dy3)
  {
    cairo_rel_curve_to(cast(cairo_t*)this._cPtr, dx1, dy1, dx2, dy2, dx3, dy3);
  }

  /**
      Relative-coordinate version of [cairo.context.Context.lineTo]. Adds a line to the
      path from the current point to a point that is offset from the
      current point by (dx, dy) in user space. After this call the
      current point will be offset by (dx, dy).
      
      Given a current point of (x, y), cairo_rel_line_to(cr, dx, dy)
      is logically equivalent to cairo_line_to(cr, x + dx, y + dy).
      
      It is an error to call this function with no current point. Doing
      so will cause cr to shutdown with a status of
      [cairo.types.Status.NoCurrentPoint].
  
      Params:
        dx = the X offset to the end of the new line
        dy = the Y offset to the end of the new line
  */
  void relLineTo(double dx, double dy)
  {
    cairo_rel_line_to(cast(cairo_t*)this._cPtr, dx, dy);
  }

  /**
      Begin a new sub-path. After this call the current point will offset
      by (x, y).
      
      Given a current point of (x, y), cairo_rel_move_to(cr, dx, dy)
      is logically equivalent to cairo_move_to(cr, x + dx, y + dy).
      
      It is an error to call this function with no current point. Doing
      so will cause cr to shutdown with a status of
      [cairo.types.Status.NoCurrentPoint].
  
      Params:
        dx = the X offset
        dy = the Y offset
  */
  void relMoveTo(double dx, double dy)
  {
    cairo_rel_move_to(cast(cairo_t*)this._cPtr, dx, dy);
  }

  /**
      Reset the current clip region to its original, unrestricted
      state. That is, set the clip region to an infinitely large shape
      containing the target surface. Equivalently, if infinity is too
      hard to grasp, one can imagine the clip region being reset to the
      exact bounds of the target surface.
      
      Note that code meant to be reusable should not call
      [cairo.context.Context.resetClip] as it will cause results unexpected by
      higher-level code which calls [cairo.context.Context.clip]. Consider using
      [cairo.context.Context.save] and [cairo.context.Context.restore] around [cairo.context.Context.clip] as a more
      robust means of temporarily restricting the clip region.
  */
  void resetClip()
  {
    cairo_reset_clip(cast(cairo_t*)this._cPtr);
  }

  /**
      Restores cr to the state saved by a preceding call to
      [cairo.context.Context.save] and removes that state from the stack of
      saved states.
  */
  void restore()
  {
    cairo_restore(cast(cairo_t*)this._cPtr);
  }

  /**
      Modifies the current transformation matrix (CTM) by rotating the
      user-space axes by angle radians. The rotation of the axes takes
      places after any existing transformation of user space. The
      rotation direction for positive angles is from the positive X axis
      toward the positive Y axis.
  
      Params:
        angle = angle (in radians) by which the user-space axes will be
          rotated
  */
  void rotate(double angle)
  {
    cairo_rotate(cast(cairo_t*)this._cPtr, angle);
  }

  /**
      Makes a copy of the current state of cr and saves it
      on an internal stack of saved states for cr. When
      [cairo.context.Context.restore] is called, cr will be restored to
      the saved state. Multiple calls to [cairo.context.Context.save] and
      [cairo.context.Context.restore] can be nested; each call to [cairo.context.Context.restore]
      restores the state from the matching paired [cairo.context.Context.save].
      
      It isn't necessary to clear all saved states before
      a #cairo_t is freed. If the reference count of a #cairo_t
      drops to zero in response to a call to [cairo.global.destroy],
      any saved states will be freed along with the #cairo_t.
  */
  void save()
  {
    cairo_save(cast(cairo_t*)this._cPtr);
  }

  /**
      Modifies the current transformation matrix (CTM) by scaling the X
      and Y user-space axes by sx and sy respectively. The scaling of
      the axes takes place after any existing transformation of user
      space.
  
      Params:
        sx = scale factor for the X dimension
        sy = scale factor for the Y dimension
  */
  void scale(double sx, double sy)
  {
    cairo_scale(cast(cairo_t*)this._cPtr, sx, sy);
  }

  /**
      Note: The [cairo.context.Context.selectFontFace] function call is part of what
      the cairo designers call the "toy" text API. It is convenient for
      short demos and simple programs, but it is not expected to be
      adequate for serious text-using applications.
      
      Selects a family and style of font from a simplified description as
      a family name, slant and weight. Cairo provides no operation to
      list available family names on the system (this is a "toy",
      remember), but the standard CSS2 generic family names, ("serif",
      "sans-serif", "cursive", "fantasy", "monospace"), are likely to
      work as expected.
      
      If family starts with the string "cairo:", or if no native font
      backends are compiled in, cairo will use an internal font family.
      The internal font family recognizes many modifiers in the family
      string, most notably, it recognizes the string "monospace".  That is,
      the family name "cairo:monospace" will use the monospace version of
      the internal font family.
      
      For "real" font selection, see the font-backend-specific
      font_face_create functions for the font backend you are using. (For
      example, if you are using the freetype-based cairo-ft font backend,
      see cairo_ft_font_face_create_for_ft_face() or
      cairo_ft_font_face_create_for_pattern().) The resulting font face
      could then be used with [cairo.global.scaledFontCreate] and
      [cairo.context.Context.setScaledFont].
      
      Similarly, when using the "real" font support, you can call
      directly into the underlying font system, (such as fontconfig or
      freetype), for operations such as listing available fonts, etc.
      
      It is expected that most applications will need to use a more
      comprehensive font handling and text layout library, (for example,
      pango), in conjunction with cairo.
      
      If text is drawn without a call to [cairo.context.Context.selectFontFace], (nor
      [cairo.context.Context.setFontFace] nor [cairo.context.Context.setScaledFont]), the default
      family is platform-specific, but is essentially "sans-serif".
      Default slant is [cairo.types.FontSlant.Normal], and default weight is
      [cairo.types.FontWeight.Normal].
      
      This function is equivalent to a call to [cairo.global.toyFontFaceCreate]
      followed by [cairo.context.Context.setFontFace].
  
      Params:
        family = a font family name, encoded in UTF-8
        slant = the slant for the font
        weight = the weight for the font
  */
  void selectFontFace(string family, cairo.types.FontSlant slant, cairo.types.FontWeight weight)
  {
    const(char)* _family = family.toCString(No.Alloc);
    cairo_select_font_face(cast(cairo_t*)this._cPtr, _family, slant, weight);
  }

  /**
      Set the antialiasing mode of the rasterizer used for drawing shapes.
      This value is a hint, and a particular backend may or may not support
      a particular value.  At the current time, no backend supports
      [cairo.types.Antialias.Subpixel] when drawing shapes.
      
      Note that this option does not affect text rendering, instead see
      [cairo.font_options.FontOptions.setAntialias].
  
      Params:
        antialias = the new antialiasing mode
  */
  void setAntialias(cairo.types.Antialias antialias)
  {
    cairo_set_antialias(cast(cairo_t*)this._cPtr, antialias);
  }

  /**
      Sets the dash pattern to be used by [cairo.context.Context.stroke]. A dash pattern
      is specified by dashes, an array of positive values. Each value
      provides the length of alternate "on" and "off" portions of the
      stroke. The offset specifies an offset into the pattern at which
      the stroke begins.
      
      Each "on" segment will have caps applied as if the segment were a
      separate sub-path. In particular, it is valid to use an "on" length
      of 0.0 with [cairo.types.LineCap.Round] or [cairo.types.LineCap.Square] in order
      to distributed dots or squares along a path.
      
      Note: The length values are in user-space units as evaluated at the
      time of stroking. This is not necessarily the same as the user
      space at the time of [cairo.context.Context.setDash].
      
      If num_dashes is 0 dashing is disabled.
      
      If num_dashes is 1 a symmetric pattern is assumed with alternating
      on and off portions of the size specified by the single value in
      dashes.
      
      If any value in dashes is negative, or if all values are 0, then
      cr will be put into an error state with a status of
      [cairo.types.Status.InvalidDash].
  
      Params:
        dashes = an array specifying alternate lengths of on and off stroke portions
        offset = an offset into the dash pattern at which the stroke should start
  */
  void setDash(double[] dashes, double offset)
  {
    int _numDashes;
    if (dashes)
      _numDashes = cast(int)dashes.length;

    auto _dashes = cast(const(double)*)dashes.ptr;
    cairo_set_dash(cast(cairo_t*)this._cPtr, _dashes, _numDashes, offset);
  }

  /**
      Set the current fill rule within the cairo context. The fill rule
      is used to determine which regions are inside or outside a complex
      (potentially self-intersecting) path. The current fill rule affects
      both [cairo.context.Context.fill] and [cairo.context.Context.clip]. See #cairo_fill_rule_t for details
      on the semantics of each available fill rule.
      
      The default fill rule is [cairo.types.FillRule.Winding].
  
      Params:
        fillRule = a fill rule, specified as a #cairo_fill_rule_t
  */
  void setFillRule(cairo.types.FillRule fillRule)
  {
    cairo_set_fill_rule(cast(cairo_t*)this._cPtr, fillRule);
  }

  /**
      Replaces the current #cairo_font_face_t object in the #cairo_t with
      font_face. The replaced font face in the #cairo_t will be
      destroyed if there are no other references to it.
  
      Params:
        fontFace = a #cairo_font_face_t, or null to restore to the default font
  */
  void setFontFace(cairo.font_face.FontFace fontFace)
  {
    cairo_set_font_face(cast(cairo_t*)this._cPtr, fontFace ? cast(cairo_font_face_t*)fontFace._cPtr(No.Dup) : null);
  }

  /**
      Sets the current font matrix to matrix. The font matrix gives a
      transformation from the design space of the font (in this space,
      the em-square is 1 unit by 1 unit) to user space. Normally, a
      simple scale is used (see [cairo.context.Context.setFontSize]), but a more
      complex font matrix can be used to shear the font
      or stretch it unequally along the two axes
  
      Params:
        matrix = a #cairo_matrix_t describing a transform to be applied to
          the current font.
  */
  void setFontMatrix(cairo.matrix.Matrix matrix)
  {
    cairo_set_font_matrix(cast(cairo_t*)this._cPtr, cast(const(cairo_matrix_t)*)&matrix);
  }

  /**
      Sets a set of custom font rendering options for the #cairo_t.
      Rendering options are derived by merging these options with the
      options derived from underlying surface; if the value in options
      has a default value (like [cairo.types.Antialias.Default]), then the value
      from the surface is used.
  
      Params:
        options = font options to use
  */
  void setFontOptions(cairo.font_options.FontOptions options)
  {
    cairo_set_font_options(cast(cairo_t*)this._cPtr, options ? cast(const(cairo_font_options_t)*)options._cPtr(No.Dup) : null);
  }

  /**
      Sets the current font matrix to a scale by a factor of size, replacing
      any font matrix previously set with [cairo.context.Context.setFontSize] or
      [cairo.context.Context.setFontMatrix]. This results in a font size of size user space
      units. (More precisely, this matrix will result in the font's
      em-square being a size by size square in user space.)
      
      If text is drawn without a call to [cairo.context.Context.setFontSize], (nor
      [cairo.context.Context.setFontMatrix] nor [cairo.context.Context.setScaledFont]), the default
      font size is 10.0.
  
      Params:
        size = the new font size, in user space units
  */
  void setFontSize(double size)
  {
    cairo_set_font_size(cast(cairo_t*)this._cPtr, size);
  }

  /**
      Sets lines within the cairo context to be hairlines.
      Hairlines are logically zero-width lines that are drawn at the
      thinnest renderable width possible in the current context.
      
      On surfaces with native hairline support, the native hairline
      functionality will be used. Surfaces that support hairlines include:
      $(LIST
        * pdf/ps: Encoded as 0-width line.
        * win32_printing: Rendered with PS_COSMETIC pen.
        * svg: Encoded as 1px non-scaling-stroke.
        * script: Encoded with set-hairline function.
      )
        
      Cairo will always render hairlines at 1 device unit wide, even if
      an anisotropic scaling was applied to the stroke width. In the wild,
      handling of this situation is not well-defined. Some PDF, PS, and SVG
      renderers match Cairo's output, but some very popular implementations
      (Acrobat, Chrome, rsvg) will scale the hairline unevenly.
      As such, best practice is to reset any anisotropic scaling before calling
      [cairo.context.Context.stroke]. See https://cairographics.org/cookbook/ellipses/
      for an example.
  
      Params:
        setHairline = whether or not to set hairline mode
  */
  void setHairline(cairo.types.Bool setHairline)
  {
    cairo_set_hairline(cast(cairo_t*)this._cPtr, setHairline);
  }

  /**
      Sets the current line cap style within the cairo context. See
      #cairo_line_cap_t for details about how the available line cap
      styles are drawn.
      
      As with the other stroke parameters, the current line cap style is
      examined by [cairo.context.Context.stroke], and [cairo.context.Context.strokeExtents], but does not have
      any effect during path construction.
      
      The default line cap style is [cairo.types.LineCap.Butt].
  
      Params:
        lineCap = a line cap style
  */
  void setLineCap(cairo.types.LineCap lineCap)
  {
    cairo_set_line_cap(cast(cairo_t*)this._cPtr, lineCap);
  }

  /**
      Sets the current line join style within the cairo context. See
      #cairo_line_join_t for details about how the available line join
      styles are drawn.
      
      As with the other stroke parameters, the current line join style is
      examined by [cairo.context.Context.stroke], and [cairo.context.Context.strokeExtents], but does not have
      any effect during path construction.
      
      The default line join style is [cairo.types.LineJoin.Miter].
  
      Params:
        lineJoin = a line join style
  */
  void setLineJoin(cairo.types.LineJoin lineJoin)
  {
    cairo_set_line_join(cast(cairo_t*)this._cPtr, lineJoin);
  }

  /**
      Sets the current line width within the cairo context. The line
      width value specifies the diameter of a pen that is circular in
      user space, (though device-space pen may be an ellipse in general
      due to scaling/shear/rotation of the CTM).
      
      Note: When the description above refers to user space and CTM it
      refers to the user space and CTM in effect at the time of the
      stroking operation, not the user space and CTM in effect at the
      time of the call to [cairo.context.Context.setLineWidth]. The simplest usage
      makes both of these spaces identical. That is, if there is no
      change to the CTM between a call to [cairo.context.Context.setLineWidth] and the
      stroking operation, then one can just pass user-space values to
      [cairo.context.Context.setLineWidth] and ignore this note.
      
      As with the other stroke parameters, the current line width is
      examined by [cairo.context.Context.stroke], and [cairo.context.Context.strokeExtents], but does not have
      any effect during path construction.
      
      The default line width value is 2.0.
  
      Params:
        width = a line width
  */
  void setLineWidth(double width)
  {
    cairo_set_line_width(cast(cairo_t*)this._cPtr, width);
  }

  /**
      Modifies the current transformation matrix (CTM) by setting it
      equal to matrix.
  
      Params:
        matrix = a transformation matrix from user space to device space
  */
  void setMatrix(cairo.matrix.Matrix matrix)
  {
    cairo_set_matrix(cast(cairo_t*)this._cPtr, cast(const(cairo_matrix_t)*)&matrix);
  }

  /**
      Sets the current miter limit within the cairo context.
      
      If the current line join style is set to [cairo.types.LineJoin.Miter]
      (see [cairo.context.Context.setLineJoin]), the miter limit is used to determine
      whether the lines should be joined with a bevel instead of a miter.
      Cairo divides the length of the miter by the line width.
      If the result is greater than the miter limit, the style is
      converted to a bevel.
      
      As with the other stroke parameters, the current line miter limit is
      examined by [cairo.context.Context.stroke], and [cairo.context.Context.strokeExtents], but does not have
      any effect during path construction.
      
      The default miter limit value is 10.0, which will convert joins
      with interior angles less than 11 degrees to bevels instead of
      miters. For reference, a miter limit of 2.0 makes the miter cutoff
      at 60 degrees, and a miter limit of 1.414 makes the cutoff at 90
      degrees.
      
      A miter limit for a desired angle can be computed as: miter limit =
      1/sin(angle/2)
  
      Params:
        limit = miter limit to set
  */
  void setMiterLimit(double limit)
  {
    cairo_set_miter_limit(cast(cairo_t*)this._cPtr, limit);
  }

  /**
      Sets the compositing operator to be used for all drawing
      operations. See #cairo_operator_t for details on the semantics of
      each available compositing operator.
      
      The default operator is [cairo.types.Operator.Over].
  
      Params:
        op = a compositing operator, specified as a #cairo_operator_t
  */
  void setOperator(cairo.types.Operator op)
  {
    cairo_set_operator(cast(cairo_t*)this._cPtr, op);
  }

  /**
      Replaces the current font face, font matrix, and font options in
      the #cairo_t with those of the #cairo_scaled_font_t.  Except for
      some translation, the current CTM of the #cairo_t should be the
      same as that of the #cairo_scaled_font_t, which can be accessed
      using [cairo.scaled_font.ScaledFont.getCtm].
  
      Params:
        scaledFont = a #cairo_scaled_font_t
  */
  void setScaledFont(cairo.scaled_font.ScaledFont scaledFont)
  {
    cairo_set_scaled_font(cast(cairo_t*)this._cPtr, scaledFont ? cast(const(cairo_scaled_font_t)*)scaledFont._cPtr(No.Dup) : null);
  }

  /**
      Sets the source pattern within cr to source. This pattern
      will then be used for any subsequent drawing operation until a new
      source pattern is set.
      
      Note: The pattern's transformation matrix will be locked to the
      user space in effect at the time of [cairo.context.Context.setSource]. This means
      that further modifications of the current transformation matrix
      will not affect the source pattern. See [cairo.pattern.Pattern.setMatrix].
      
      The default source pattern is a solid pattern that is opaque black,
      (that is, it is equivalent to cairo_set_source_rgb(cr, 0.0, 0.0,
      0.0)).
  
      Params:
        source = a #cairo_pattern_t to be used as the source for
          subsequent drawing operations.
  */
  void setSource(cairo.pattern.Pattern source)
  {
    cairo_set_source(cast(cairo_t*)this._cPtr, source ? cast(cairo_pattern_t*)source._cPtr(No.Dup) : null);
  }

  /**
      Sets the source pattern within cr to an opaque color. This opaque
      color will then be used for any subsequent drawing operation until
      a new source pattern is set.
      
      The color components are floating point numbers in the range 0 to
      1. If the values passed in are outside that range, they will be
      clamped.
      
      The default source pattern is opaque black, (that is, it is
      equivalent to cairo_set_source_rgb(cr, 0.0, 0.0, 0.0)).
  
      Params:
        red = red component of color
        green = green component of color
        blue = blue component of color
  */
  void setSourceRgb(double red, double green, double blue)
  {
    cairo_set_source_rgb(cast(cairo_t*)this._cPtr, red, green, blue);
  }

  /**
      Sets the source pattern within cr to a translucent color. This
      color will then be used for any subsequent drawing operation until
      a new source pattern is set.
      
      The color and alpha components are floating point numbers in the
      range 0 to 1. If the values passed in are outside that range, they
      will be clamped.
      
      Note that the color and alpha values are not premultiplied.
      
      The default source pattern is opaque black, (that is, it is
      equivalent to cairo_set_source_rgba(cr, 0.0, 0.0, 0.0, 1.0)).
  
      Params:
        red = red component of color
        green = green component of color
        blue = blue component of color
        alpha = alpha component of color
  */
  void setSourceRgba(double red, double green, double blue, double alpha)
  {
    cairo_set_source_rgba(cast(cairo_t*)this._cPtr, red, green, blue, alpha);
  }

  /**
      This is a convenience function for creating a pattern from surface
      and setting it as the source in cr with [cairo.context.Context.setSource].
      
      The `x` and `y` parameters give the user-space coordinate at which
      the surface origin should appear. (The surface origin is its
      upper-left corner before any transformation has been applied.) The
      `x` and `y` parameters are negated and then set as translation values
      in the pattern matrix.
      
      Other than the initial translation pattern matrix, as described
      above, all other pattern attributes, (such as its extend mode), are
      set to the default values as in [cairo.global.patternCreateForSurface].
      The resulting pattern can be queried with [cairo.context.Context.getSource] so
      that these attributes can be modified if desired, (eg. to create a
      repeating pattern with [cairo.pattern.Pattern.setExtend]).
  
      Params:
        surface = a surface to be used to set the source pattern
        x = User-space X coordinate for surface origin
        y = User-space Y coordinate for surface origin
  */
  void setSourceSurface(cairo.surface.Surface surface, double x, double y)
  {
    cairo_set_source_surface(cast(cairo_t*)this._cPtr, surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, x, y);
  }

  /**
      Sets the tolerance used when converting paths into trapezoids.
      Curved segments of the path will be subdivided until the maximum
      deviation between the original path and the polygonal approximation
      is less than tolerance. The default value is 0.1. A larger
      value will give better performance, a smaller value, better
      appearance. (Reducing the value from the default value of 0.1
      is unlikely to improve appearance significantly.)  The accuracy of paths
      within Cairo is limited by the precision of its internal arithmetic, and
      the prescribed tolerance is restricted to the smallest
      representable internal value.
  
      Params:
        tolerance = the tolerance, in device units (typically pixels)
  */
  void setTolerance(double tolerance)
  {
    cairo_set_tolerance(cast(cairo_t*)this._cPtr, tolerance);
  }

  /**
      A drawing operator that generates the shape from an array of glyphs,
      rendered according to the current font face, font size
      (font matrix), and font options.
  
      Params:
        glyphs = array of glyphs to show
        numGlyphs = number of glyphs to show
  */
  void showGlyphs(cairo.glyph.Glyph glyphs, int numGlyphs)
  {
    cairo_show_glyphs(cast(cairo_t*)this._cPtr, cast(const(cairo_glyph_t)*)&glyphs, numGlyphs);
  }

  /**
      Emits and clears the current page for backends that support multiple
      pages.  Use [cairo.context.Context.copyPage] if you don't want to clear the page.
      
      This is a convenience function that simply calls
      [cairo.surface.Surface.showPage] on cr's target.
  */
  void showPage()
  {
    cairo_show_page(cast(cairo_t*)this._cPtr);
  }

  /**
      A drawing operator that generates the shape from a string of UTF-8
      characters, rendered according to the current font_face, font_size
      (font_matrix), and font_options.
      
      This function first computes a set of glyphs for the string of
      text. The first glyph is placed so that its origin is at the
      current point. The origin of each subsequent glyph is offset from
      that of the previous glyph by the advance values of the previous
      glyph.
      
      After this call the current point is moved to the origin of where
      the next glyph would be placed in this same progression. That is,
      the current point will be at the origin of the final glyph offset
      by its advance values. This allows for easy display of a single
      logical string with multiple calls to [cairo.context.Context.showText].
      
      Note: The [cairo.context.Context.showText] function call is part of what the cairo
      designers call the "toy" text API. It is convenient for short demos
      and simple programs, but it is not expected to be adequate for
      serious text-using applications. See [cairo.context.Context.showGlyphs] for the
      "real" text display API in cairo.
  
      Params:
        utf8 = a NUL-terminated string of text encoded in UTF-8, or null
  */
  void showText(string utf8)
  {
    const(char)* _utf8 = utf8.toCString(No.Alloc);
    cairo_show_text(cast(cairo_t*)this._cPtr, _utf8);
  }

  /**
      This operation has rendering effects similar to [cairo.context.Context.showGlyphs]
      but, if the target surface supports it, uses the provided text and
      cluster mapping to embed the text for the glyphs shown in the output.
      If the target does not support the extended attributes, this function
      acts like the basic [cairo.context.Context.showGlyphs] as if it had been passed
      glyphs and num_glyphs.
      
      The mapping between utf8 and glyphs is provided by an array of
      <firstterm>clusters</firstterm>.  Each cluster covers a number of
      text bytes and glyphs, and neighboring clusters cover neighboring
      areas of utf8 and glyphs.  The clusters should collectively cover utf8
      and glyphs in entirety.
      
      The first cluster always covers bytes from the beginning of utf8.
      If cluster_flags do not have the [cairo.types.TextClusterFlags.Backward]
      set, the first cluster also covers the beginning
      of glyphs, otherwise it covers the end of the glyphs array and
      following clusters move backward.
      
      See #cairo_text_cluster_t for constraints on valid clusters.
  
      Params:
        utf8 = a string of text encoded in UTF-8
        glyphs = array of glyphs to show
        numGlyphs = number of glyphs to show
        clusters = array of cluster mapping information
        numClusters = number of clusters in the mapping
        clusterFlags = cluster mapping flags
  */
  void showTextGlyphs(string utf8, cairo.glyph.Glyph glyphs, int numGlyphs, cairo.text_cluster.TextCluster clusters, int numClusters, cairo.types.TextClusterFlags clusterFlags)
  {
    int _utf8Len;
    if (utf8)
      _utf8Len = cast(int)utf8.length;

    auto _utf8 = cast(const(char)*)utf8.ptr;
    cairo_show_text_glyphs(cast(cairo_t*)this._cPtr, _utf8, _utf8Len, cast(const(cairo_glyph_t)*)&glyphs, numGlyphs, cast(const(cairo_text_cluster_t)*)&clusters, numClusters, clusterFlags);
  }

  /**
      Checks whether an error has previously occurred for this context.
      Returns: the current status of this context, see #cairo_status_t
  */
  cairo.types.Status status()
  {
    cairo_status_t _cretval;
    _cretval = cairo_status(cast(cairo_t*)this._cPtr);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      A drawing operator that strokes the current path according to the
      current line width, line join, line cap, and dash settings. After
      [cairo.context.Context.stroke], the current path will be cleared from the cairo
      context. See [cairo.context.Context.setLineWidth], [cairo.context.Context.setLineJoin],
      [cairo.context.Context.setLineCap], [cairo.context.Context.setDash], and
      [cairo.context.Context.strokePreserve].
      
      Note: Degenerate segments and sub-paths are treated specially and
      provide a useful result. These can result in two different
      situations:
      
      1. Zero-length "on" segments set in [cairo.context.Context.setDash]. If the cap
      style is [cairo.types.LineCap.Round] or [cairo.types.LineCap.Square] then these
      segments will be drawn as circular dots or squares respectively. In
      the case of [cairo.types.LineCap.Square], the orientation of the squares
      is determined by the direction of the underlying path.
      
      2. A sub-path created by [cairo.context.Context.moveTo] followed by either a
      [cairo.context.Context.closePath] or one or more calls to [cairo.context.Context.lineTo] to the
      same coordinate as the [cairo.context.Context.moveTo]. If the cap style is
      [cairo.types.LineCap.Round] then these sub-paths will be drawn as circular
      dots. Note that in the case of [cairo.types.LineCap.Square] a degenerate
      sub-path will not be drawn at all, (since the correct orientation
      is indeterminate).
      
      In no case will a cap style of [cairo.types.LineCap.Butt] cause anything
      to be drawn in the case of either degenerate segments or sub-paths.
  */
  void stroke()
  {
    cairo_stroke(cast(cairo_t*)this._cPtr);
  }

  /**
      Computes a bounding box in user coordinates covering the area that
      would be affected, (the "inked" area), by a [cairo.context.Context.stroke]
      operation given the current path and stroke parameters.
      If the current path is empty, returns an empty rectangle ((0,0), (0,0)).
      Surface dimensions and clipping are not taken into account.
      
      Note that if the line width is set to exactly zero, then
      [cairo.context.Context.strokeExtents] will return an empty rectangle. Contrast with
      [cairo.context.Context.pathExtents] which can be used to compute the non-empty
      bounds as the line width approaches zero.
      
      Note that [cairo.context.Context.strokeExtents] must necessarily do more work to
      compute the precise inked areas in light of the stroke parameters,
      so [cairo.context.Context.pathExtents] may be more desirable for sake of
      performance if non-inked path extents are desired.
      
      See [cairo.context.Context.stroke], [cairo.context.Context.setLineWidth], [cairo.context.Context.setLineJoin],
      [cairo.context.Context.setLineCap], [cairo.context.Context.setDash], and
      [cairo.context.Context.strokePreserve].
  
      Params:
        x1 = left of the resulting extents
        y1 = top of the resulting extents
        x2 = right of the resulting extents
        y2 = bottom of the resulting extents
  */
  void strokeExtents(out double x1, out double y1, out double x2, out double y2)
  {
    cairo_stroke_extents(cast(cairo_t*)this._cPtr, cast(double*)&x1, cast(double*)&y1, cast(double*)&x2, cast(double*)&y2);
  }

  /**
      A drawing operator that strokes the current path according to the
      current line width, line join, line cap, and dash settings. Unlike
      [cairo.context.Context.stroke], [cairo.context.Context.strokePreserve] preserves the path within the
      cairo context.
      
      See [cairo.context.Context.setLineWidth], [cairo.context.Context.setLineJoin],
      [cairo.context.Context.setLineCap], [cairo.context.Context.setDash], and
      [cairo.context.Context.strokePreserve].
  */
  void strokePreserve()
  {
    cairo_stroke_preserve(cast(cairo_t*)this._cPtr);
  }

  /**
      Marks the beginning of the tag_name structure. Call
      [cairo.context.Context.tagEnd] with the same tag_name to mark the end of the
      structure.
      
      The attributes string is of the form "key1=value2 key2=value2 ...".
      Values may be boolean (true/false or 1/0), integer, float, string,
      or an array.
      
      String values are enclosed in single quotes
      ('). Single quotes and backslashes inside the string should be
      escaped with a backslash.
      
      Boolean values may be set to true by only
      specifying the key. eg the attribute string "key" is the equivalent
      to "key=true".
      
      Arrays are enclosed in '[]'. eg "rect=[1.2 4.3 2.0 3.0]".
      
      If no attributes are required, attributes can be an empty string or NULL.
      
      See [Tags and Links Description][cairo-Tags-and-Links.description]
      for the list of tags and attributes.
      
      Invalid nesting of tags or invalid attributes will cause cr to
      shutdown with a status of `CAIRO_STATUS_TAG_ERROR`.
      
      See [cairo.context.Context.tagEnd].
  
      Params:
        tagName = tag name
        attributes = tag attributes
  */
  void tagBegin(string tagName, string attributes)
  {
    const(char)* _tagName = tagName.toCString(No.Alloc);
    const(char)* _attributes = attributes.toCString(No.Alloc);
    cairo_tag_begin(cast(cairo_t*)this._cPtr, _tagName, _attributes);
  }

  /**
      Marks the end of the tag_name structure.
      
      Invalid nesting of tags will cause cr to shutdown with a status of
      `CAIRO_STATUS_TAG_ERROR`.
      
      See [cairo.context.Context.tagBegin].
  
      Params:
        tagName = tag name
  */
  void tagEnd(string tagName)
  {
    const(char)* _tagName = tagName.toCString(No.Alloc);
    cairo_tag_end(cast(cairo_t*)this._cPtr, _tagName);
  }

  /**
      Gets the extents for a string of text. The extents describe a
      user-space rectangle that encloses the "inked" portion of the text,
      (as it would be drawn by [cairo.context.Context.showText]). Additionally, the
      x_advance and y_advance values indicate the amount by which the
      current point would be advanced by [cairo.context.Context.showText].
      
      Note that whitespace characters do not directly contribute to the
      size of the rectangle (extents.width and extents.height). They do
      contribute indirectly by changing the position of non-whitespace
      characters. In particular, trailing whitespace characters are
      likely to not affect the size of the rectangle, though they will
      affect the x_advance and y_advance values.
  
      Params:
        utf8 = a NUL-terminated string of text encoded in UTF-8, or null
        extents = a #cairo_text_extents_t object into which the results
          will be stored
  */
  void textExtents(string utf8, out cairo.types.TextExtents extents)
  {
    const(char)* _utf8 = utf8.toCString(No.Alloc);
    cairo_text_extents(cast(cairo_t*)this._cPtr, _utf8, &extents);
  }

  /**
      Adds closed paths for text to the current path.  The generated
      path if filled, achieves an effect similar to that of
      [cairo.context.Context.showText].
      
      Text conversion and positioning is done similar to [cairo.context.Context.showText].
      
      Like [cairo.context.Context.showText], After this call the current point is
      moved to the origin of where the next glyph would be placed in
      this same progression.  That is, the current point will be at
      the origin of the final glyph offset by its advance values.
      This allows for chaining multiple calls to to [cairo.context.Context.textPath]
      without having to set current point in between.
      
      Note: The [cairo.context.Context.textPath] function call is part of what the cairo
      designers call the "toy" text API. It is convenient for short demos
      and simple programs, but it is not expected to be adequate for
      serious text-using applications. See [cairo.context.Context.glyphPath] for the
      "real" text path API in cairo.
  
      Params:
        utf8 = a NUL-terminated string of text encoded in UTF-8, or null
  */
  void textPath(string utf8)
  {
    const(char)* _utf8 = utf8.toCString(No.Alloc);
    cairo_text_path(cast(cairo_t*)this._cPtr, _utf8);
  }

  /**
      Modifies the current transformation matrix (CTM) by applying
      matrix as an additional transformation. The new transformation of
      user space takes place after any existing transformation.
  
      Params:
        matrix = a transformation to be applied to the user-space axes
  */
  void transform(cairo.matrix.Matrix matrix)
  {
    cairo_transform(cast(cairo_t*)this._cPtr, cast(const(cairo_matrix_t)*)&matrix);
  }

  /**
      Modifies the current transformation matrix (CTM) by translating the
      user-space origin by (tx, ty). This offset is interpreted as a
      user-space coordinate according to the CTM in place before the new
      call to [cairo.context.Context.translate]. In other words, the translation of the
      user-space origin takes place after any existing transformation.
  
      Params:
        tx = amount to translate in the X direction
        ty = amount to translate in the Y direction
  */
  void translate(double tx, double ty)
  {
    cairo_translate(cast(cairo_t*)this._cPtr, tx, ty);
  }

  /**
      Transform a coordinate from user space to device space by
      multiplying the given point by the current transformation matrix
      (CTM).
  
      Params:
        x = X value of coordinate (in/out parameter)
        y = Y value of coordinate (in/out parameter)
  */
  void userToDevice(out double x, out double y)
  {
    cairo_user_to_device(cast(cairo_t*)this._cPtr, cast(double*)&x, cast(double*)&y);
  }

  /**
      Transform a distance vector from user space to device space. This
      function is similar to [cairo.context.Context.userToDevice] except that the
      translation components of the CTM will be ignored when transforming
      (dx,dy).
  
      Params:
        dx = X component of a distance vector (in/out parameter)
        dy = Y component of a distance vector (in/out parameter)
  */
  void userToDeviceDistance(out double dx, out double dy)
  {
    cairo_user_to_device_distance(cast(cairo_t*)this._cPtr, cast(double*)&dx, cast(double*)&dy);
  }
}
