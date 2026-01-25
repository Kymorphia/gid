/// Global functions for cairo1 library
module cairo.global;

import cairo.c.functions;
import cairo.c.types;
import cairo.context;
import cairo.device;
import cairo.font_face;
import cairo.font_options;
import cairo.glyph;
import cairo.matrix;
import cairo.path;
import cairo.pattern;
import cairo.region;
import cairo.scaled_font;
import cairo.surface;
import cairo.text_cluster;
import cairo.types;
import gid.gid;


/**
    Creates a new #cairo_t with all graphics state parameters set to
    default values and with target as a target surface. The target
    surface should be constructed with a backend-specific function such
    as [cairo.global.imageSurfaceCreate] (or any other
    <function>cairo_<emphasis>backend</emphasis>_surface_create(<!-- -->)</function>
    variant).
    
    This function references target, so you can immediately
    call [cairo.surface.Surface.destroy] on it if you don't need to
    maintain a separate reference to it.

    Params:
      target = target surface for the context
    Returns: a newly allocated #cairo_t with a reference
       count of 1. The initial reference count should be released
       with [cairo.global.destroy] when you are done using the #cairo_t.
       This function never returns null. If memory cannot be
       allocated, a special #cairo_t object will be returned on
       which [cairo.context.Context.status] returns [cairo.types.Status.NoMemory]. If
       you attempt to target a surface which does not support
       writing (such as #cairo_mime_surface_t) then a
       [cairo.types.Status.WriteError] will be raised.  You can use this
       object normally, but no drawing will be done.
*/
cairo.context.Context create(cairo.surface.Surface target)
{
  cairo_t* _cretval;
  _cretval = cairo_create(target ? cast(cairo_surface_t*)target._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.context.Context(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Resets all static data within cairo to its original state,
    (ie. identical to the state at the time of program invocation). For
    example, all caches within cairo will be flushed empty.
    
    This function is intended to be useful when using memory-checking
    tools such as valgrind. When valgrind's memcheck analyzes a
    cairo-using program without a call to [cairo.global.debugResetStaticData],
    it will report all data reachable via cairo's static objects as
    "still reachable". Calling [cairo.global.debugResetStaticData] just prior
    to program termination will make it easier to get squeaky clean
    reports from valgrind.
    
    WARNING: It is only safe to call this function when there are no
    active cairo objects remaining, (ie. the appropriate destroy
    functions have been called as necessary). If there are active cairo
    objects, this call is likely to cause a crash, (eg. an assertion
    failure due to a hash table being destroyed when non-empty).
*/
void debugResetStaticData()
{
  cairo_debug_reset_static_data();
}

/**
    Allocates a new font options object with all options initialized
     to default values.
    Returns: a newly allocated #cairo_font_options_t. Free with
        [cairo.font_options.FontOptions.destroy]. This function always returns a
        valid pointer; if memory cannot be allocated, then a special
        error object is returned where all operations on the object do nothing.
        You can check for this with [cairo.font_options.FontOptions.status].
*/
cairo.font_options.FontOptions fontOptionsCreate()
{
  cairo_font_options_t* _cretval;
  _cretval = cairo_font_options_create();
  auto _retval = _cretval ? new cairo.font_options.FontOptions(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    This function provides a stride value that will respect all
    alignment requirements of the accelerated image-rendering code
    within cairo. Typical usage will be of the form:
    
    <informalexample><programlisting>
    int stride;
    unsigned char *data;
    cairo_surface_t *surface;
    
    stride = cairo_format_stride_for_width (format, width);
    data = malloc (stride * height);
    surface = cairo_image_surface_create_for_data (data, format,
    					  width, height,
    					  stride);
    </programlisting></informalexample>

    Params:
      format = A #cairo_format_t value
      width = The desired width of an image surface to be created.
    Returns: the appropriate stride to use given the desired
      format and width, or -1 if either the format is invalid or the width
      too large.
*/
int formatStrideForWidth(cairo.types.Format format, int width)
{
  int _retval;
  _retval = cairo_format_stride_for_width(format, width);
  return _retval;
}

/**
    Return user data previously attached to cr using the specified
    key.  If no user data has been attached with the given key this
    function returns null.

    Params:
      cr = a #cairo_t
      key = the address of the #cairo_user_data_key_t the user data was
        attached to
    Returns: the user data previously attached or null.
*/
void* getUserData(cairo.context.Context cr, cairo.types.UserDataKey key)
{
  auto _retval = cairo_get_user_data(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, &key);
  return _retval;
}

/**
    Allocates an array of #cairo_glyph_t's.
    This function is only useful in implementations of
    #cairo_user_scaled_font_text_to_glyphs_func_t where the user
    needs to allocate an array of glyphs that cairo will free.
    For all other uses, user can use their own allocation method
    for glyphs.
    
    This function returns null if num_glyphs is not positive,
    or if out of memory.  That means, the null return value
    signals out-of-memory only if num_glyphs was positive.

    Params:
      numGlyphs = number of glyphs to allocate
    Returns: the newly allocated array of glyphs that should be
               freed using [cairo.glyph.Glyph.free]
*/
cairo.glyph.Glyph glyphAllocate(int numGlyphs)
{
  cairo_glyph_t* _cretval;
  _cretval = cairo_glyph_allocate(numGlyphs);
  cairo.glyph.Glyph _retval;
  if (_cretval)
    _retval = *cast(cairo.glyph.Glyph*)_cretval;
  return _retval;
}

/**
    Creates an image surface of the specified format and
    dimensions. Initially the surface contents are set to 0.
    (Specifically, within each pixel, each color or alpha channel
    belonging to format will be 0. The contents of bits within a pixel,
    but not belonging to the given format are undefined).

    Params:
      format = format of pixels in the surface to create
      width = width of the surface, in pixels
      height = height of the surface, in pixels
    Returns: a pointer to the newly created surface. The caller
      owns the surface and should call [cairo.surface.Surface.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" surface if an error such as out of memory
      occurs. You can use [cairo.surface.Surface.status] to check for this.
*/
cairo.surface.Surface imageSurfaceCreate(cairo.types.Format format, int width, int height)
{
  cairo_surface_t* _cretval;
  _cretval = cairo_image_surface_create(format, width, height);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new image surface and initializes the contents to the
    given PNG file.

    Params:
      filename = name of PNG file to load. On Windows this filename
          is encoded in UTF-8.
    Returns: a new #cairo_surface_t initialized with the contents
      of the PNG file, or a "nil" surface if any error occurred. A nil
      surface can be checked for with cairo_surface_status(surface) which
      may return one of the following values:
      
      [cairo.types.Status.NoMemory]
      [cairo.types.Status.FileNotFound]
      [cairo.types.Status.ReadError]
      [cairo.types.Status.PngError]
      
      Alternatively, you can allow errors to propagate through the drawing
      operations and check the status on the context upon completion
      using [cairo.context.Context.status].
*/
cairo.surface.Surface imageSurfaceCreateFromPng(string filename)
{
  cairo_surface_t* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _cretval = cairo_image_surface_create_from_png(_filename);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new image surface from PNG data read incrementally
    via the read_func function.

    Params:
      readFunc = function called to read the data of the file
    Returns: a new #cairo_surface_t initialized with the contents
      of the PNG file or a "nil" surface if the data read is not a valid PNG image
      or memory could not be allocated for the operation.  A nil
      surface can be checked for with cairo_surface_status(surface) which
      may return one of the following values:
      
      [cairo.types.Status.NoMemory]
      [cairo.types.Status.ReadError]
      [cairo.types.Status.PngError]
      
      Alternatively, you can allow errors to propagate through the drawing
      operations and check the status on the context upon completion
      using [cairo.context.Context.status].
*/
cairo.surface.Surface imageSurfaceCreateFromPngStream(cairo.types.ReadFunc readFunc)
{
  extern(C) cairo_status_t _readFuncCallback(void* closure, ubyte* data, uint length)
  {
    cairo.types.Status _dretval;
    auto _dlg = cast(cairo.types.ReadFunc*)closure;
    ubyte[] _data;
    _data.length = length;
    _data[0 .. length] = data[0 .. length];

    _dretval = (*_dlg)(_data);
    auto _retval = cast(cairo_status_t)_dretval;

    return _retval;
  }
  auto _readFuncCB = readFunc ? &_readFuncCallback : null;
  cairo_surface_t* _cretval;
  auto _readFunc = readFunc ? cast(void*)&(readFunc) : null;
  _cretval = cairo_image_surface_create_from_png_stream(_readFuncCB, _readFunc);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Get a pointer to the data of the image surface, for direct
    inspection or modification.
    
    A call to [cairo.surface.Surface.flush] is required before accessing the
    pixel data to ensure that all pending drawing operations are
    finished. A call to [cairo.surface.Surface.markDirty] is required after
    the data is modified.

    Params:
      surface = a #cairo_image_surface_t
    Returns: a pointer to the image data of this surface or null
      if surface is not an image surface, or if [cairo.surface.Surface.finish]
      has been called.
*/
ubyte* imageSurfaceGetData(cairo.surface.Surface surface)
{
  auto _retval = cairo_image_surface_get_data(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Get the format of the surface.

    Params:
      surface = a #cairo_image_surface_t
    Returns: the format of the surface
*/
cairo.types.Format imageSurfaceGetFormat(cairo.surface.Surface surface)
{
  cairo_format_t _cretval;
  _cretval = cairo_image_surface_get_format(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  cairo.types.Format _retval = cast(cairo.types.Format)_cretval;
  return _retval;
}

/**
    Get the height of the image surface in pixels.

    Params:
      surface = a #cairo_image_surface_t
    Returns: the height of the surface in pixels.
*/
int imageSurfaceGetHeight(cairo.surface.Surface surface)
{
  int _retval;
  _retval = cairo_image_surface_get_height(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Get the stride of the image surface in bytes

    Params:
      surface = a #cairo_image_surface_t
    Returns: the stride of the image surface in bytes (or 0 if
      surface is not an image surface). The stride is the distance in
      bytes from the beginning of one row of the image data to the
      beginning of the next row.
*/
int imageSurfaceGetStride(cairo.surface.Surface surface)
{
  int _retval;
  _retval = cairo_image_surface_get_stride(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Get the width of the image surface in pixels.

    Params:
      surface = a #cairo_image_surface_t
    Returns: the width of the surface in pixels.
*/
int imageSurfaceGetWidth(cairo.surface.Surface surface)
{
  int _retval;
  _retval = cairo_image_surface_get_width(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Begin a patch in a mesh pattern.
    
    After calling this function, the patch shape should be defined with
    [cairo.global.meshPatternMoveTo], [cairo.global.meshPatternLineTo] and
    [cairo.global.meshPatternCurveTo].
    
    After defining the patch, [cairo.global.meshPatternEndPatch] must be
    called before using pattern as a source or mask.
    
    Note: If pattern is not a mesh pattern then pattern will be put
    into an error status with a status of
    [cairo.types.Status.PatternTypeMismatch]. If pattern already has a
    current patch, it will be put into an error status with a status of
    [cairo.types.Status.InvalidMeshConstruction].

    Params:
      pattern = a #cairo_pattern_t
*/
void meshPatternBeginPatch(cairo.pattern.Pattern pattern)
{
  cairo_mesh_pattern_begin_patch(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null);
}

/**
    Adds a cubic Bézier spline to the current patch from the current
    point to position (x3, y3) in pattern-space coordinates, using
    (x1, y1) and (x2, y2) as the control points.
    
    If the current patch has no current point before the call to
    [cairo.global.meshPatternCurveTo], this function will behave as if
    preceded by a call to cairo_mesh_pattern_move_to(pattern, x1,
    y1).
    
    After this call the current point will be (x3, y3).
    
    Note: If pattern is not a mesh pattern then pattern will be put
    into an error status with a status of
    [cairo.types.Status.PatternTypeMismatch]. If pattern has no current
    patch or the current patch already has 4 sides, pattern will be
    put into an error status with a status of
    [cairo.types.Status.InvalidMeshConstruction].

    Params:
      pattern = a #cairo_pattern_t
      x1 = the X coordinate of the first control point
      y1 = the Y coordinate of the first control point
      x2 = the X coordinate of the second control point
      y2 = the Y coordinate of the second control point
      x3 = the X coordinate of the end of the curve
      y3 = the Y coordinate of the end of the curve
*/
void meshPatternCurveTo(cairo.pattern.Pattern pattern, double x1, double y1, double x2, double y2, double x3, double y3)
{
  cairo_mesh_pattern_curve_to(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, x1, y1, x2, y2, x3, y3);
}

/**
    Indicates the end of the current patch in a mesh pattern.
    
    If the current patch has less than 4 sides, it is closed with a
    straight line from the current point to the first point of the
    patch as if [cairo.global.meshPatternLineTo] was used.
    
    Note: If pattern is not a mesh pattern then pattern will be put
    into an error status with a status of
    [cairo.types.Status.PatternTypeMismatch]. If pattern has no current
    patch or the current patch has no current point, pattern will be
    put into an error status with a status of
    [cairo.types.Status.InvalidMeshConstruction].

    Params:
      pattern = a #cairo_pattern_t
*/
void meshPatternEndPatch(cairo.pattern.Pattern pattern)
{
  cairo_mesh_pattern_end_patch(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null);
}

/**
    Gets the control point point_num of patch patch_num for a mesh
    pattern.
    
    patch_num can range from 0 to n-1 where n is the number returned by
    [cairo.global.meshPatternGetPatchCount].
    
    Valid values for point_num are from 0 to 3 and identify the
    control points as explained in [cairo.global.patternCreateMesh].

    Params:
      pattern = a #cairo_pattern_t
      patchNum = the patch number to return data for
      pointNum = the control point number to return data for
      x = return value for the x coordinate of the control point, or null
      y = return value for the y coordinate of the control point, or null
    Returns: [cairo.types.Status.Success], or [cairo.types.Status.InvalidIndex]
      if patch_num or point_num is not valid for pattern. If pattern
      is not a mesh pattern, [cairo.types.Status.PatternTypeMismatch] is
      returned.
*/
cairo.types.Status meshPatternGetControlPoint(cairo.pattern.Pattern pattern, uint patchNum, uint pointNum, out double x, out double y)
{
  cairo_status_t _cretval;
  _cretval = cairo_mesh_pattern_get_control_point(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, patchNum, pointNum, cast(double*)&x, cast(double*)&y);
  cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
  return _retval;
}

/**
    Gets the color information in corner corner_num of patch
    patch_num for a mesh pattern.
    
    patch_num can range from 0 to n-1 where n is the number returned by
    [cairo.global.meshPatternGetPatchCount].
    
    Valid values for corner_num are from 0 to 3 and identify the
    corners as explained in [cairo.global.patternCreateMesh].
    
    Note that the color and alpha values are not premultiplied.

    Params:
      pattern = a #cairo_pattern_t
      patchNum = the patch number to return data for
      cornerNum = the corner number to return data for
      red = return value for red component of color, or null
      green = return value for green component of color, or null
      blue = return value for blue component of color, or null
      alpha = return value for alpha component of color, or null
    Returns: [cairo.types.Status.Success], or [cairo.types.Status.InvalidIndex]
      if patch_num or corner_num is not valid for pattern. If
      pattern is not a mesh pattern, [cairo.types.Status.PatternTypeMismatch]
      is returned.
*/
cairo.types.Status meshPatternGetCornerColorRgba(cairo.pattern.Pattern pattern, uint patchNum, uint cornerNum, out double red, out double green, out double blue, out double alpha)
{
  cairo_status_t _cretval;
  _cretval = cairo_mesh_pattern_get_corner_color_rgba(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, patchNum, cornerNum, cast(double*)&red, cast(double*)&green, cast(double*)&blue, cast(double*)&alpha);
  cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
  return _retval;
}

/**
    Gets the number of patches specified in the given mesh pattern.
    
    The number only includes patches which have been finished by
    calling [cairo.global.meshPatternEndPatch]. For example it will be 0
    during the definition of the first patch.

    Params:
      pattern = a #cairo_pattern_t
      count = return value for the number patches, or null
    Returns: [cairo.types.Status.Success], or
      [cairo.types.Status.PatternTypeMismatch] if pattern is not a mesh
      pattern.
*/
cairo.types.Status meshPatternGetPatchCount(cairo.pattern.Pattern pattern, out uint count)
{
  cairo_status_t _cretval;
  _cretval = cairo_mesh_pattern_get_patch_count(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, cast(uint*)&count);
  cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
  return _retval;
}

/**
    Gets path defining the patch patch_num for a mesh
    pattern.
    
    patch_num can range from 0 to n-1 where n is the number returned by
    [cairo.global.meshPatternGetPatchCount].

    Params:
      pattern = a #cairo_pattern_t
      patchNum = the patch number to return data for
    Returns: the path defining the patch, or a path with status
      [cairo.types.Status.InvalidIndex] if patch_num or point_num is not
      valid for pattern. If pattern is not a mesh pattern, a path with
      status [cairo.types.Status.PatternTypeMismatch] is returned.
*/
cairo.path.Path meshPatternGetPath(cairo.pattern.Pattern pattern, uint patchNum)
{
  cairo_path_t* _cretval;
  _cretval = cairo_mesh_pattern_get_path(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, patchNum);
  auto _retval = _cretval ? new cairo.path.Path(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Adds a line to the current patch from the current point to position
    (`x`, `y`) in pattern-space coordinates.
    
    If there is no current point before the call to
    [cairo.global.meshPatternLineTo] this function will behave as
    cairo_mesh_pattern_move_to(pattern, `x`, `y`).
    
    After this call the current point will be (`x`, `y`).
    
    Note: If pattern is not a mesh pattern then pattern will be put
    into an error status with a status of
    [cairo.types.Status.PatternTypeMismatch]. If pattern has no current
    patch or the current patch already has 4 sides, pattern will be
    put into an error status with a status of
    [cairo.types.Status.InvalidMeshConstruction].

    Params:
      pattern = a #cairo_pattern_t
      x = the X coordinate of the end of the new line
      y = the Y coordinate of the end of the new line
*/
void meshPatternLineTo(cairo.pattern.Pattern pattern, double x, double y)
{
  cairo_mesh_pattern_line_to(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, x, y);
}

/**
    Define the first point of the current patch in a mesh pattern.
    
    After this call the current point will be (`x`, `y`).
    
    Note: If pattern is not a mesh pattern then pattern will be put
    into an error status with a status of
    [cairo.types.Status.PatternTypeMismatch]. If pattern has no current
    patch or the current patch already has at least one side, pattern
    will be put into an error status with a status of
    [cairo.types.Status.InvalidMeshConstruction].

    Params:
      pattern = a #cairo_pattern_t
      x = the X coordinate of the new position
      y = the Y coordinate of the new position
*/
void meshPatternMoveTo(cairo.pattern.Pattern pattern, double x, double y)
{
  cairo_mesh_pattern_move_to(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, x, y);
}

/**
    Set an internal control point of the current patch.
    
    Valid values for point_num are from 0 to 3 and identify the
    control points as explained in [cairo.global.patternCreateMesh].
    
    Note: If pattern is not a mesh pattern then pattern will be put
    into an error status with a status of
    [cairo.types.Status.PatternTypeMismatch]. If point_num is not valid,
    pattern will be put into an error status with a status of
    [cairo.types.Status.InvalidIndex].  If pattern has no current patch,
    pattern will be put into an error status with a status of
    [cairo.types.Status.InvalidMeshConstruction].

    Params:
      pattern = a #cairo_pattern_t
      pointNum = the control point to set the position for
      x = the X coordinate of the control point
      y = the Y coordinate of the control point
*/
void meshPatternSetControlPoint(cairo.pattern.Pattern pattern, uint pointNum, double x, double y)
{
  cairo_mesh_pattern_set_control_point(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, pointNum, x, y);
}

/**
    Sets the color of a corner of the current patch in a mesh pattern.
    
    The color is specified in the same way as in [cairo.context.Context.setSourceRgb].
    
    Valid values for corner_num are from 0 to 3 and identify the
    corners as explained in [cairo.global.patternCreateMesh].
    
    Note: If pattern is not a mesh pattern then pattern will be put
    into an error status with a status of
    [cairo.types.Status.PatternTypeMismatch]. If corner_num is not valid,
    pattern will be put into an error status with a status of
    [cairo.types.Status.InvalidIndex].  If pattern has no current patch,
    pattern will be put into an error status with a status of
    [cairo.types.Status.InvalidMeshConstruction].

    Params:
      pattern = a #cairo_pattern_t
      cornerNum = the corner to set the color for
      red = red component of color
      green = green component of color
      blue = blue component of color
*/
void meshPatternSetCornerColorRgb(cairo.pattern.Pattern pattern, uint cornerNum, double red, double green, double blue)
{
  cairo_mesh_pattern_set_corner_color_rgb(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, cornerNum, red, green, blue);
}

/**
    Sets the color of a corner of the current patch in a mesh pattern.
    
    The color is specified in the same way as in [cairo.context.Context.setSourceRgba].
    
    Valid values for corner_num are from 0 to 3 and identify the
    corners as explained in [cairo.global.patternCreateMesh].
    
    Note: If pattern is not a mesh pattern then pattern will be put
    into an error status with a status of
    [cairo.types.Status.PatternTypeMismatch]. If corner_num is not valid,
    pattern will be put into an error status with a status of
    [cairo.types.Status.InvalidIndex].  If pattern has no current patch,
    pattern will be put into an error status with a status of
    [cairo.types.Status.InvalidMeshConstruction].

    Params:
      pattern = a #cairo_pattern_t
      cornerNum = the corner to set the color for
      red = red component of color
      green = green component of color
      blue = blue component of color
      alpha = alpha component of color
*/
void meshPatternSetCornerColorRgba(cairo.pattern.Pattern pattern, uint cornerNum, double red, double green, double blue, double alpha)
{
  cairo_mesh_pattern_set_corner_color_rgba(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, cornerNum, red, green, blue, alpha);
}

/**
    Create a new #cairo_pattern_t for the given surface.

    Params:
      surface = the surface
    Returns: the newly created #cairo_pattern_t if successful, or
      an error pattern in case of no memory.  The caller owns the
      returned object and should call [cairo.pattern.Pattern.destroy] when
      finished with it.
      
      This function will always return a valid pointer, but if an error
      occurred the pattern status will be set to an error.  To inspect
      the status of a pattern use [cairo.pattern.Pattern.status].
*/
cairo.pattern.Pattern patternCreateForSurface(cairo.surface.Surface surface)
{
  cairo_pattern_t* _cretval;
  _cretval = cairo_pattern_create_for_surface(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Create a new linear gradient #cairo_pattern_t along the line defined
    by (x0, y0) and (x1, y1).  Before using the gradient pattern, a
    number of color stops should be defined using
    [cairo.pattern.Pattern.addColorStopRgb] or
    [cairo.pattern.Pattern.addColorStopRgba].
    
    Note: The coordinates here are in pattern space. For a new pattern,
    pattern space is identical to user space, but the relationship
    between the spaces can be changed with [cairo.pattern.Pattern.setMatrix].

    Params:
      x0 = x coordinate of the start point
      y0 = y coordinate of the start point
      x1 = x coordinate of the end point
      y1 = y coordinate of the end point
    Returns: the newly created #cairo_pattern_t if successful, or
      an error pattern in case of no memory.  The caller owns the
      returned object and should call [cairo.pattern.Pattern.destroy] when
      finished with it.
      
      This function will always return a valid pointer, but if an error
      occurred the pattern status will be set to an error.  To inspect
      the status of a pattern use [cairo.pattern.Pattern.status].
*/
cairo.pattern.Pattern patternCreateLinear(double x0, double y0, double x1, double y1)
{
  cairo_pattern_t* _cretval;
  _cretval = cairo_pattern_create_linear(x0, y0, x1, y1);
  auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Create a new mesh pattern.
    
    Mesh patterns are tensor-product patch meshes (type 7 shadings in
    PDF). Mesh patterns may also be used to create other types of
    shadings that are special cases of tensor-product patch meshes such
    as Coons patch meshes (type 6 shading in PDF) and Gouraud-shaded
    triangle meshes (type 4 and 5 shadings in PDF).
    
    Mesh patterns consist of one or more tensor-product patches, which
    should be defined before using the mesh pattern. Using a mesh
    pattern with a partially defined patch as source or mask will put
    the context in an error status with a status of
    [cairo.types.Status.InvalidMeshConstruction].
    
    A tensor-product patch is defined by 4 Bézier curves (side 0, 1, 2,
    3) and by 4 additional control points (P0, P1, P2, P3) that provide
    further control over the patch and complete the definition of the
    tensor-product patch. The corner C0 is the first point of the
    patch.
    
    Degenerate sides are permitted so straight lines may be used. A
    zero length line on one side may be used to create 3 sided patches.
    
    <informalexample><screen>
          C1     Side 1       C2
           +---------------+
           |               |
           |  P1       P2  |
           |               |
    Side 0 |               | Side 2
           |               |
           |               |
           |  P0       P3  |
           |               |
           +---------------+
         C0     Side 3        C3
    </screen></informalexample>
    
    Each patch is constructed by first calling
    [cairo.global.meshPatternBeginPatch], then [cairo.global.meshPatternMoveTo]
    to specify the first point in the patch (C0). Then the sides are
    specified with calls to [cairo.global.meshPatternCurveTo] and
    [cairo.global.meshPatternLineTo].
    
    The four additional control points (P0, P1, P2, P3) in a patch can
    be specified with [cairo.global.meshPatternSetControlPoint].
    
    At each corner of the patch (C0, C1, C2, C3) a color may be
    specified with [cairo.global.meshPatternSetCornerColorRgb] or
    [cairo.global.meshPatternSetCornerColorRgba]. Any corner whose color
    is not explicitly specified defaults to transparent black.
    
    A Coons patch is a special case of the tensor-product patch where
    the control points are implicitly defined by the sides of the
    patch. The default value for any control point not specified is the
    implicit value for a Coons patch, i.e. if no control points are
    specified the patch is a Coons patch.
    
    A triangle is a special case of the tensor-product patch where the
    control points are implicitly defined by the sides of the patch,
    all the sides are lines and one of them has length 0, i.e. if the
    patch is specified using just 3 lines, it is a triangle. If the
    corners connected by the 0-length side have the same color, the
    patch is a Gouraud-shaded triangle.
    
    Patches may be oriented differently to the above diagram. For
    example the first point could be at the top left. The diagram only
    shows the relationship between the sides, corners and control
    points. Regardless of where the first point is located, when
    specifying colors, corner 0 will always be the first point, corner
    1 the point between side 0 and side 1 etc.
    
    Calling [cairo.global.meshPatternEndPatch] completes the current
    patch. If less than 4 sides have been defined, the first missing
    side is defined as a line from the current point to the first point
    of the patch (C0) and the other sides are degenerate lines from C0
    to C0. The corners between the added sides will all be coincident
    with C0 of the patch and their color will be set to be the same as
    the color of C0.
    
    Additional patches may be added with additional calls to
    [cairo.global.meshPatternBeginPatch]/[cairo.global.meshPatternEndPatch].
    
    <informalexample><programlisting>
    cairo_pattern_t *pattern = cairo_pattern_create_mesh ();
    
    /&ast; Add a Coons patch &ast;/
    cairo_mesh_pattern_begin_patch (pattern);
    cairo_mesh_pattern_move_to (pattern, 0, 0);
    cairo_mesh_pattern_curve_to (pattern, 30, -30,  60,  30, 100, 0);
    cairo_mesh_pattern_curve_to (pattern, 60,  30, 130,  60, 100, 100);
    cairo_mesh_pattern_curve_to (pattern, 60,  70,  30, 130,   0, 100);
    cairo_mesh_pattern_curve_to (pattern, 30,  70, -30,  30,   0, 0);
    cairo_mesh_pattern_set_corner_color_rgb (pattern, 0, 1, 0, 0);
    cairo_mesh_pattern_set_corner_color_rgb (pattern, 1, 0, 1, 0);
    cairo_mesh_pattern_set_corner_color_rgb (pattern, 2, 0, 0, 1);
    cairo_mesh_pattern_set_corner_color_rgb (pattern, 3, 1, 1, 0);
    cairo_mesh_pattern_end_patch (pattern);
    
    /&ast; Add a Gouraud-shaded triangle &ast;/
    cairo_mesh_pattern_begin_patch (pattern)
    cairo_mesh_pattern_move_to (pattern, 100, 100);
    cairo_mesh_pattern_line_to (pattern, 130, 130);
    cairo_mesh_pattern_line_to (pattern, 130,  70);
    cairo_mesh_pattern_set_corner_color_rgb (pattern, 0, 1, 0, 0);
    cairo_mesh_pattern_set_corner_color_rgb (pattern, 1, 0, 1, 0);
    cairo_mesh_pattern_set_corner_color_rgb (pattern, 2, 0, 0, 1);
    cairo_mesh_pattern_end_patch (pattern)
    </programlisting></informalexample>
    
    When two patches overlap, the last one that has been added is drawn
    over the first one.
    
    When a patch folds over itself, points are sorted depending on
    their parameter coordinates inside the patch. The v coordinate
    ranges from 0 to 1 when moving from side 3 to side 1; the u
    coordinate ranges from 0 to 1 when going from side 0 to side
    2. Points with higher v coordinate hide points with lower v
    coordinate. When two points have the same v coordinate, the one
    with higher u coordinate is above. This means that points nearer to
    side 1 are above points nearer to side 3; when this is not
    sufficient to decide which point is above (for example when both
    points belong to side 1 or side 3) points nearer to side 2 are
    above points nearer to side 0.
    
    For a complete definition of tensor-product patches, see the PDF
    specification (ISO32000), which describes the parametrization in
    detail.
    
    Note: The coordinates are always in pattern space. For a new
    pattern, pattern space is identical to user space, but the
    relationship between the spaces can be changed with
    [cairo.pattern.Pattern.setMatrix].
    Returns: the newly created #cairo_pattern_t if successful, or
      an error pattern in case of no memory. The caller owns the returned
      object and should call [cairo.pattern.Pattern.destroy] when finished with
      it.
      
      This function will always return a valid pointer, but if an error
      occurred the pattern status will be set to an error. To inspect the
      status of a pattern use [cairo.pattern.Pattern.status].
*/
cairo.pattern.Pattern patternCreateMesh()
{
  cairo_pattern_t* _cretval;
  _cretval = cairo_pattern_create_mesh();
  auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new radial gradient #cairo_pattern_t between the two
    circles defined by (cx0, cy0, radius0) and (cx1, cy1, radius1).  Before using the
    gradient pattern, a number of color stops should be defined using
    [cairo.pattern.Pattern.addColorStopRgb] or
    [cairo.pattern.Pattern.addColorStopRgba].
    
    Note: The coordinates here are in pattern space. For a new pattern,
    pattern space is identical to user space, but the relationship
    between the spaces can be changed with [cairo.pattern.Pattern.setMatrix].

    Params:
      cx0 = x coordinate for the center of the start circle
      cy0 = y coordinate for the center of the start circle
      radius0 = radius of the start circle
      cx1 = x coordinate for the center of the end circle
      cy1 = y coordinate for the center of the end circle
      radius1 = radius of the end circle
    Returns: the newly created #cairo_pattern_t if successful, or
      an error pattern in case of no memory.  The caller owns the
      returned object and should call [cairo.pattern.Pattern.destroy] when
      finished with it.
      
      This function will always return a valid pointer, but if an error
      occurred the pattern status will be set to an error.  To inspect
      the status of a pattern use [cairo.pattern.Pattern.status].
*/
cairo.pattern.Pattern patternCreateRadial(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1)
{
  cairo_pattern_t* _cretval;
  _cretval = cairo_pattern_create_radial(cx0, cy0, radius0, cx1, cy1, radius1);
  auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new user pattern for providing pixel data.
    
    Use the setter functions to associate callbacks with the returned
    pattern.  The only mandatory callback is acquire.

    Params:
      userData = the user data to be passed to all callbacks
      content = content type for the pixel data that will be returned. Knowing
        the content type ahead of time is used for analysing the operation and
        picking the appropriate rendering path.
      width = maximum size of the sample area
      height = maximum size of the sample area
    Returns: a newly created #cairo_pattern_t. Free with
       [cairo.pattern.Pattern.destroy] when you are done using it.
*/
cairo.pattern.Pattern patternCreateRasterSource(void* userData, cairo.types.Content content, int width, int height)
{
  cairo_pattern_t* _cretval;
  _cretval = cairo_pattern_create_raster_source(userData, content, width, height);
  auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #cairo_pattern_t corresponding to an opaque color.  The
    color components are floating point numbers in the range 0 to 1.
    If the values passed in are outside that range, they will be
    clamped.

    Params:
      red = red component of the color
      green = green component of the color
      blue = blue component of the color
    Returns: the newly created #cairo_pattern_t if successful, or
      an error pattern in case of no memory.  The caller owns the
      returned object and should call [cairo.pattern.Pattern.destroy] when
      finished with it.
      
      This function will always return a valid pointer, but if an error
      occurred the pattern status will be set to an error.  To inspect
      the status of a pattern use [cairo.pattern.Pattern.status].
*/
cairo.pattern.Pattern patternCreateRgb(double red, double green, double blue)
{
  cairo_pattern_t* _cretval;
  _cretval = cairo_pattern_create_rgb(red, green, blue);
  auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #cairo_pattern_t corresponding to a translucent color.
    The color components are floating point numbers in the range 0 to
    1.  If the values passed in are outside that range, they will be
    clamped.
    
    The color is specified in the same way as in [cairo.context.Context.setSourceRgb].

    Params:
      red = red component of the color
      green = green component of the color
      blue = blue component of the color
      alpha = alpha component of the color
    Returns: the newly created #cairo_pattern_t if successful, or
      an error pattern in case of no memory.  The caller owns the
      returned object and should call [cairo.pattern.Pattern.destroy] when
      finished with it.
      
      This function will always return a valid pointer, but if an error
      occurred the pattern status will be set to an error.  To inspect
      the status of a pattern use [cairo.pattern.Pattern.status].
*/
cairo.pattern.Pattern patternCreateRgba(double red, double green, double blue, double alpha)
{
  cairo_pattern_t* _cretval;
  _cretval = cairo_pattern_create_rgba(red, green, blue, alpha);
  auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Used to retrieve the list of supported versions. See
    [cairo.global.pdfSurfaceRestrictToVersion].

    Params:
      versions = supported version list
*/
void pdfGetVersions(out cairo.types.PdfVersion[] versions)
{
  int _numVersions;
  const(cairo_pdf_version_t)* _versions;
  cairo_pdf_get_versions(&_versions, &_numVersions);
  versions.length = _numVersions;
  versions[0 .. $] = (cast(cairo.types.PdfVersion*)_versions)[0 .. _numVersions];
}

/**
    Add an item to the document outline hierarchy with the name utf8
    that links to the location specified by link_attribs. Link
    attributes have the same keys and values as the [Link Tag][link],
    excluding the "rect" attribute. The item will be a child of the
    item with id parent_id. Use [cairo.types.PDF_OUTLINE_ROOT] as the parent
    id of top level items.

    Params:
      surface = a PDF #cairo_surface_t
      parentId = the id of the parent item or [cairo.types.PDF_OUTLINE_ROOT] if this is a top level item.
      utf8 = the name of the outline
      linkAttribs = the link attributes specifying where this outline links to
      flags = outline item flags
    Returns: the id for the added item.
*/
int pdfSurfaceAddOutline(cairo.surface.Surface surface, int parentId, string utf8, string linkAttribs, cairo.types.PdfOutlineFlags flags)
{
  int _retval;
  const(char)* _utf8 = utf8.toCString(No.Alloc);
  const(char)* _linkAttribs = linkAttribs.toCString(No.Alloc);
  _retval = cairo_pdf_surface_add_outline(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, parentId, _utf8, _linkAttribs, flags);
  return _retval;
}

/**
    Creates a PDF surface of the specified size in points to be written
    to filename.

    Params:
      filename = a filename for the PDF output (must be writable), null may be
                   used to specify no output. This will generate a PDF surface that
                   may be queried and used as a source, without generating a
                   temporary file.
      widthInPoints = width of the surface, in points (1 point == 1/72.0 inch)
      heightInPoints = height of the surface, in points (1 point == 1/72.0 inch)
    Returns: a pointer to the newly created surface. The caller
      owns the surface and should call [cairo.surface.Surface.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" surface if an error such as out of memory
      occurs. You can use [cairo.surface.Surface.status] to check for this.
*/
cairo.surface.Surface pdfSurfaceCreate(string filename, double widthInPoints, double heightInPoints)
{
  cairo_surface_t* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _cretval = cairo_pdf_surface_create(_filename, widthInPoints, heightInPoints);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a PDF surface of the specified size in points to be written
    incrementally to the stream represented by write_func and closure.

    Params:
      writeFunc = a #cairo_write_func_t to accept the output data, may be null
                     to indicate a no-op write_func. With a no-op write_func,
                     the surface may be queried or used as a source without
                     generating any temporary files.
      widthInPoints = width of the surface, in points (1 point == 1/72.0 inch)
      heightInPoints = height of the surface, in points (1 point == 1/72.0 inch)
    Returns: a pointer to the newly created surface. The caller
      owns the surface and should call [cairo.surface.Surface.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" surface if an error such as out of memory
      occurs. You can use [cairo.surface.Surface.status] to check for this.
*/
cairo.surface.Surface pdfSurfaceCreateForStream(cairo.types.WriteFunc writeFunc, double widthInPoints, double heightInPoints)
{
  extern(C) cairo_status_t _writeFuncCallback(void* closure, const(ubyte)* data, uint length)
  {
    cairo.types.Status _dretval;
    auto _dlg = cast(cairo.types.WriteFunc*)closure;
    ubyte[] _data;
    _data.length = length;
    _data[0 .. length] = data[0 .. length];

    _dretval = (*_dlg)(_data);
    auto _retval = cast(cairo_status_t)_dretval;

    return _retval;
  }
  auto _writeFuncCB = writeFunc ? &_writeFuncCallback : null;
  cairo_surface_t* _cretval;
  auto _writeFunc = writeFunc ? cast(void*)&(writeFunc) : null;
  _cretval = cairo_pdf_surface_create_for_stream(_writeFuncCB, _writeFunc, widthInPoints, heightInPoints);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Restricts the generated PDF file to version. See [cairo.global.pdfGetVersions]
    for a list of available version values that can be used here.
    
    This function should only be called before any drawing operations
    have been performed on the given surface. The simplest way to do
    this is to call this function immediately after creating the
    surface.

    Params:
      surface = a PDF #cairo_surface_t
      version_ = PDF version
*/
void pdfSurfaceRestrictToVersion(cairo.surface.Surface surface, cairo.types.PdfVersion version_)
{
  cairo_pdf_surface_restrict_to_version(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, version_);
}

/**
    Set custom document metadata. name may be any string except for
    the following names reserved by PDF: "Title", "Author", "Subject",
    "Keywords", "Creator", "Producer", "CreationDate", "ModDate",
    "Trapped".
    
    If value is NULL or an empty string, the name metadata will not be set.
    
    For example:
    <informalexample><programlisting>
    cairo_pdf_surface_set_custom_metadata (surface, "ISBN", "978-0123456789");
    </programlisting></informalexample>

    Params:
      surface = a PDF #cairo_surface_t
      name = The name of the custom metadata item to set (utf8).
      value = The value of the metadata (utf8).
*/
void pdfSurfaceSetCustomMetadata(cairo.surface.Surface surface, string name, string value)
{
  const(char)* _name = name.toCString(No.Alloc);
  const(char)* _value = value.toCString(No.Alloc);
  cairo_pdf_surface_set_custom_metadata(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, _name, _value);
}

/**
    Set document metadata. The `CAIRO_PDF_METADATA_CREATE_DATE` and
    `CAIRO_PDF_METADATA_MOD_DATE` values must be in ISO-8601 format:
    YYYY-MM-DDThh:mm:ss. An optional timezone of the form "[+/-]hh:mm"
    or "Z" for UTC time can be appended. All other metadata values can be any UTF-8
    string.
    
    For example:
    <informalexample><programlisting>
    cairo_pdf_surface_set_metadata (surface, CAIRO_PDF_METADATA_TITLE, "My Document");
    cairo_pdf_surface_set_metadata (surface, CAIRO_PDF_METADATA_CREATE_DATE, "2015-12-31T23:59+02:00");
    </programlisting></informalexample>

    Params:
      surface = a PDF #cairo_surface_t
      metadata = The metadata item to set.
      utf8 = metadata value
*/
void pdfSurfaceSetMetadata(cairo.surface.Surface surface, cairo.types.PdfMetadata metadata, string utf8)
{
  const(char)* _utf8 = utf8.toCString(No.Alloc);
  cairo_pdf_surface_set_metadata(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, metadata, _utf8);
}

/**
    Set page label for the current page.

    Params:
      surface = a PDF #cairo_surface_t
      utf8 = The page label.
*/
void pdfSurfaceSetPageLabel(cairo.surface.Surface surface, string utf8)
{
  const(char)* _utf8 = utf8.toCString(No.Alloc);
  cairo_pdf_surface_set_page_label(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, _utf8);
}

/**
    Changes the size of a PDF surface for the current (and
    subsequent) pages.
    
    This function should only be called before any drawing operations
    have been performed on the current page. The simplest way to do
    this is to call this function immediately after creating the
    surface or immediately after completing a page with either
    [cairo.context.Context.showPage] or [cairo.context.Context.copyPage].

    Params:
      surface = a PDF #cairo_surface_t
      widthInPoints = new surface width, in points (1 point == 1/72.0 inch)
      heightInPoints = new surface height, in points (1 point == 1/72.0 inch)
*/
void pdfSurfaceSetSize(cairo.surface.Surface surface, double widthInPoints, double heightInPoints)
{
  cairo_pdf_surface_set_size(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, widthInPoints, heightInPoints);
}

/**
    Set the thumbnail image size for the current and all subsequent
    pages. Setting a width or height of 0 disables thumbnails for the
    current and subsequent pages.

    Params:
      surface = a PDF #cairo_surface_t
      width = Thumbnail width.
      height = Thumbnail height
*/
void pdfSurfaceSetThumbnailSize(cairo.surface.Surface surface, int width, int height)
{
  cairo_pdf_surface_set_thumbnail_size(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, width, height);
}

/**
    Get the string representation of the given version id. This function
    will return null if version isn't valid. See [cairo.global.pdfGetVersions]
    for a way to get the list of valid version ids.

    Params:
      version_ = a version id
    Returns: the string associated to given version.
*/
string pdfVersionToString(cairo.types.PdfVersion version_)
{
  const(char)* _cretval;
  _cretval = cairo_pdf_version_to_string(version_);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Used to retrieve the list of supported levels. See
    [cairo.global.psSurfaceRestrictToLevel].

    Params:
      levels = supported level list
*/
void psGetLevels(out cairo.types.PsLevel[] levels)
{
  int _numLevels;
  const(cairo_ps_level_t)* _levels;
  cairo_ps_get_levels(&_levels, &_numLevels);
  levels.length = _numLevels;
  levels[0 .. $] = (cast(cairo.types.PsLevel*)_levels)[0 .. _numLevels];
}

/**
    Get the string representation of the given level id. This function
    will return null if level id isn't valid. See [cairo.global.psGetLevels]
    for a way to get the list of valid level ids.

    Params:
      level = a level id
    Returns: the string associated to given level.
*/
string psLevelToString(cairo.types.PsLevel level)
{
  const(char)* _cretval;
  _cretval = cairo_ps_level_to_string(level);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Creates a PostScript surface of the specified size in points to be
    written to filename. See [cairo.global.psSurfaceCreateForStream] for
    a more flexible mechanism for handling the PostScript output than
    simply writing it to a named file.
    
    Note that the size of individual pages of the PostScript output can
    vary. See [cairo.global.psSurfaceSetSize].

    Params:
      filename = a filename for the PS output (must be writable), null may be
                   used to specify no output. This will generate a PS surface that
                   may be queried and used as a source, without generating a
                   temporary file.
      widthInPoints = width of the surface, in points (1 point == 1/72.0 inch)
      heightInPoints = height of the surface, in points (1 point == 1/72.0 inch)
    Returns: a pointer to the newly created surface. The caller
      owns the surface and should call [cairo.surface.Surface.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" surface if an error such as out of memory
      occurs. You can use [cairo.surface.Surface.status] to check for this.
*/
cairo.surface.Surface psSurfaceCreate(string filename, double widthInPoints, double heightInPoints)
{
  cairo_surface_t* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _cretval = cairo_ps_surface_create(_filename, widthInPoints, heightInPoints);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a PostScript surface of the specified size in points to be
    written incrementally to the stream represented by write_func and
    closure. See [cairo.global.psSurfaceCreate] for a more convenient way
    to simply direct the PostScript output to a named file.
    
    Note that the size of individual pages of the PostScript
    output can vary. See [cairo.global.psSurfaceSetSize].

    Params:
      writeFunc = a #cairo_write_func_t to accept the output data, may be null
                     to indicate a no-op write_func. With a no-op write_func,
                     the surface may be queried or used as a source without
                     generating any temporary files.
      widthInPoints = width of the surface, in points (1 point == 1/72.0 inch)
      heightInPoints = height of the surface, in points (1 point == 1/72.0 inch)
    Returns: a pointer to the newly created surface. The caller
      owns the surface and should call [cairo.surface.Surface.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" surface if an error such as out of memory
      occurs. You can use [cairo.surface.Surface.status] to check for this.
*/
cairo.surface.Surface psSurfaceCreateForStream(cairo.types.WriteFunc writeFunc, double widthInPoints, double heightInPoints)
{
  extern(C) cairo_status_t _writeFuncCallback(void* closure, const(ubyte)* data, uint length)
  {
    cairo.types.Status _dretval;
    auto _dlg = cast(cairo.types.WriteFunc*)closure;
    ubyte[] _data;
    _data.length = length;
    _data[0 .. length] = data[0 .. length];

    _dretval = (*_dlg)(_data);
    auto _retval = cast(cairo_status_t)_dretval;

    return _retval;
  }
  auto _writeFuncCB = writeFunc ? &_writeFuncCallback : null;
  cairo_surface_t* _cretval;
  auto _writeFunc = writeFunc ? cast(void*)&(writeFunc) : null;
  _cretval = cairo_ps_surface_create_for_stream(_writeFuncCB, _writeFunc, widthInPoints, heightInPoints);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    This function indicates that subsequent calls to
    [cairo.global.psSurfaceDscComment] should direct comments to the
    PageSetup section of the PostScript output.
    
    This function call is only needed for the first page of a
    surface. It should be called after any call to
    [cairo.global.psSurfaceDscBeginSetup] and before any drawing is
    performed to the surface.
    
    See [cairo.global.psSurfaceDscComment] for more details.

    Params:
      surface = a PostScript #cairo_surface_t
*/
void psSurfaceDscBeginPageSetup(cairo.surface.Surface surface)
{
  cairo_ps_surface_dsc_begin_page_setup(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
}

/**
    This function indicates that subsequent calls to
    [cairo.global.psSurfaceDscComment] should direct comments to the Setup
    section of the PostScript output.
    
    This function should be called at most once per surface, and must
    be called before any call to [cairo.global.psSurfaceDscBeginPageSetup]
    and before any drawing is performed to the surface.
    
    See [cairo.global.psSurfaceDscComment] for more details.

    Params:
      surface = a PostScript #cairo_surface_t
*/
void psSurfaceDscBeginSetup(cairo.surface.Surface surface)
{
  cairo_ps_surface_dsc_begin_setup(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
}

/**
    Emit a comment into the PostScript output for the given surface.
    
    The comment is expected to conform to the PostScript Language
    Document Structuring Conventions (DSC). Please see that manual for
    details on the available comments and their meanings. In
    particular, the \%\`IncludeFeature` comment allows a
    device-independent means of controlling printer device features. So
    the PostScript Printer Description Files Specification will also be
    a useful reference.
    
    The comment string must begin with a percent character (\%) and the
    total length of the string (including any initial percent
    characters) must not exceed 255 characters. Violating either of
    these conditions will place surface into an error state. But
    beyond these two conditions, this function will not enforce
    conformance of the comment with any particular specification.
    
    The comment string must not contain any newline characters.
    
    The DSC specifies different sections in which particular comments
    can appear. This function provides for comments to be emitted
    within three sections: the header, the Setup section, and the
    PageSetup section.  Comments appearing in the first two sections
    apply to the entire document while comments in the BeginPageSetup
    section apply only to a single page.
    
    For comments to appear in the header section, this function should
    be called after the surface is created, but before a call to
    [cairo.global.psSurfaceDscBeginSetup].
    
    For comments to appear in the Setup section, this function should
    be called after a call to [cairo.global.psSurfaceDscBeginSetup] but
    before a call to [cairo.global.psSurfaceDscBeginPageSetup].
    
    For comments to appear in the PageSetup section, this function
    should be called after a call to
    [cairo.global.psSurfaceDscBeginPageSetup].
    
    Note that it is only necessary to call
    [cairo.global.psSurfaceDscBeginPageSetup] for the first page of any
    surface. After a call to [cairo.context.Context.showPage] or [cairo.context.Context.copyPage]
    comments are unambiguously directed to the PageSetup section of the
    current page. But it doesn't hurt to call this function at the
    beginning of every page as that consistency may make the calling
    code simpler.
    
    As a final note, cairo automatically generates several comments on
    its own. As such, applications must not manually generate any of
    the following comments:
    
    Header section: \%!PS-Adobe-3.0, \%\`Creator`, \%\`CreationDate`, \%\`Pages`,
    \%\`BoundingBox`, \%\`DocumentData`, \%\`LanguageLevel`, \%\`EndComments`.
    
    Setup section: \%\`BeginSetup`, \%\`EndSetup`
    
    PageSetup section: \%\`BeginPageSetup`, \%\`PageBoundingBox`, \%\`EndPageSetup`.
    
    Other sections: \%\`BeginProlog`, \%\`EndProlog`, \%\`Page`, \%\`Trailer`, \%\`EOF`
    
    Here is an example sequence showing how this function might be used:
    
    <informalexample><programlisting>
    cairo_surface_t *surface = cairo_ps_surface_create (filename, width, height);
    ...
    cairo_ps_surface_dsc_comment (surface, "%`Title`: My excellent document");
    cairo_ps_surface_dsc_comment (surface, "%`Copyright`: Copyright (C) 2006 Cairo Lover")
    ...
    cairo_ps_surface_dsc_begin_setup (surface);
    cairo_ps_surface_dsc_comment (surface, "%`IncludeFeature`: *MediaColor White");
    ...
    cairo_ps_surface_dsc_begin_page_setup (surface);
    cairo_ps_surface_dsc_comment (surface, "%`IncludeFeature`: *PageSize A3");
    cairo_ps_surface_dsc_comment (surface, "%`IncludeFeature`: *InputSlot LargeCapacity");
    cairo_ps_surface_dsc_comment (surface, "%`IncludeFeature`: *MediaType Glossy");
    cairo_ps_surface_dsc_comment (surface, "%`IncludeFeature`: *MediaColor Blue");
    ... draw to first page here ..
    cairo_show_page (cr);
    ...
    cairo_ps_surface_dsc_comment (surface, "%`IncludeFeature`: *PageSize A5");
    ...
    </programlisting></informalexample>

    Params:
      surface = a PostScript #cairo_surface_t
      comment = a comment string to be emitted into the PostScript output
*/
void psSurfaceDscComment(cairo.surface.Surface surface, string comment)
{
  const(char)* _comment = comment.toCString(No.Alloc);
  cairo_ps_surface_dsc_comment(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, _comment);
}

/**
    Check whether the PostScript surface will output Encapsulated PostScript.

    Params:
      surface = a PostScript #cairo_surface_t
    Returns: true if the surface will output Encapsulated PostScript.
*/
cairo.types.Bool psSurfaceGetEps(cairo.surface.Surface surface)
{
  cairo.types.Bool _retval;
  _retval = cairo_ps_surface_get_eps(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Restricts the generated PostSript file to level. See
    [cairo.global.psGetLevels] for a list of available level values that
    can be used here.
    
    This function should only be called before any drawing operations
    have been performed on the given surface. The simplest way to do
    this is to call this function immediately after creating the
    surface.

    Params:
      surface = a PostScript #cairo_surface_t
      level = PostScript level
*/
void psSurfaceRestrictToLevel(cairo.surface.Surface surface, cairo.types.PsLevel level)
{
  cairo_ps_surface_restrict_to_level(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, level);
}

/**
    If eps is true, the PostScript surface will output Encapsulated
    PostScript.
    
    This function should only be called before any drawing operations
    have been performed on the current page. The simplest way to do
    this is to call this function immediately after creating the
    surface. An Encapsulated PostScript file should never contain more
    than one page.

    Params:
      surface = a PostScript #cairo_surface_t
      eps = true to output EPS format PostScript
*/
void psSurfaceSetEps(cairo.surface.Surface surface, cairo.types.Bool eps)
{
  cairo_ps_surface_set_eps(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, eps);
}

/**
    Changes the size of a PostScript surface for the current (and
    subsequent) pages.
    
    This function should only be called before any drawing operations
    have been performed on the current page. The simplest way to do
    this is to call this function immediately after creating the
    surface or immediately after completing a page with either
    [cairo.context.Context.showPage] or [cairo.context.Context.copyPage].

    Params:
      surface = a PostScript #cairo_surface_t
      widthInPoints = new surface width, in points (1 point == 1/72.0 inch)
      heightInPoints = new surface height, in points (1 point == 1/72.0 inch)
*/
void psSurfaceSetSize(cairo.surface.Surface surface, double widthInPoints, double heightInPoints)
{
  cairo_ps_surface_set_size(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, widthInPoints, heightInPoints);
}

/**
    Queries the current user data.

    Params:
      pattern = the pattern to update
    Returns: the current user-data passed to each callback
*/
void* rasterSourcePatternGetCallbackData(cairo.pattern.Pattern pattern)
{
  auto _retval = cairo_raster_source_pattern_get_callback_data(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Updates the user data that is provided to all callbacks.

    Params:
      pattern = the pattern to update
      data = the user data to be passed to all callbacks
*/
void rasterSourcePatternSetCallbackData(cairo.pattern.Pattern pattern, void* data = null)
{
  cairo_raster_source_pattern_set_callback_data(pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null, data);
}

/**
    Creates a recording-surface which can be used to record all drawing operations
    at the highest level (that is, the level of paint, mask, stroke, fill
    and show_text_glyphs). The recording surface can then be "replayed" against
    any target surface by using it as a source to drawing operations.
    
    The recording phase of the recording surface is careful to snapshot all
    necessary objects (paths, patterns, etc.), in order to achieve
    accurate replay.

    Params:
      content = the content of the recording surface
      extents = the extents to record in pixels, can be null to record
                  unbounded operations.
    Returns: a pointer to the newly created surface. The caller
      owns the surface and should call [cairo.surface.Surface.destroy] when done
      with it.
*/
cairo.surface.Surface recordingSurfaceCreate(cairo.types.Content content, cairo.types.Rectangle extents)
{
  cairo_surface_t* _cretval;
  _cretval = cairo_recording_surface_create(content, &extents);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Get the extents of the recording-surface.

    Params:
      surface = a #cairo_recording_surface_t
      extents = the #cairo_rectangle_t to be assigned the extents
    Returns: true if the surface is bounded, of recording type, and
      not in an error state, otherwise false
*/
cairo.types.Bool recordingSurfaceGetExtents(cairo.surface.Surface surface, out cairo.types.Rectangle extents)
{
  cairo.types.Bool _retval;
  _retval = cairo_recording_surface_get_extents(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, &extents);
  return _retval;
}

/**
    Measures the extents of the operations stored within the recording-surface.
    This is useful to compute the required size of an image surface (or
    equivalent) into which to replay the full sequence of drawing operations.

    Params:
      surface = a #cairo_recording_surface_t
      x0 = the x-coordinate of the top-left of the ink bounding box
      y0 = the y-coordinate of the top-left of the ink bounding box
      width = the width of the ink bounding box
      height = the height of the ink bounding box
*/
void recordingSurfaceInkExtents(cairo.surface.Surface surface, out double x0, out double y0, out double width, out double height)
{
  cairo_recording_surface_ink_extents(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, cast(double*)&x0, cast(double*)&y0, cast(double*)&width, cast(double*)&height);
}

/**
    Allocates a new empty region object.
    Returns: A newly allocated #cairo_region_t. Free with
        [cairo.region.Region.destroy]. This function always returns a
        valid pointer; if memory cannot be allocated, then a special
        error object is returned where all operations on the object do nothing.
        You can check for this with [cairo.region.Region.status].
*/
cairo.region.Region regionCreate()
{
  cairo_region_t* _cretval;
  _cretval = cairo_region_create();
  auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Allocates a new region object containing rectangle.

    Params:
      rectangle = a #cairo_rectangle_int_t
    Returns: A newly allocated #cairo_region_t. Free with
        [cairo.region.Region.destroy]. This function always returns a
        valid pointer; if memory cannot be allocated, then a special
        error object is returned where all operations on the object do nothing.
        You can check for this with [cairo.region.Region.status].
*/
cairo.region.Region regionCreateRectangle(cairo.types.RectangleInt rectangle)
{
  cairo_region_t* _cretval;
  _cretval = cairo_region_create_rectangle(&rectangle);
  auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Allocates a new region object containing the union of all given rects.

    Params:
      rects = an array of count rectangles
      count = number of rectangles
    Returns: A newly allocated #cairo_region_t. Free with
        [cairo.region.Region.destroy]. This function always returns a
        valid pointer; if memory cannot be allocated, then a special
        error object is returned where all operations on the object do nothing.
        You can check for this with [cairo.region.Region.status].
*/
cairo.region.Region regionCreateRectangles(cairo.types.RectangleInt rects, int count)
{
  cairo_region_t* _cretval;
  _cretval = cairo_region_create_rectangles(&rects, count);
  auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a #cairo_scaled_font_t object from a font face and matrices that
    describe the size of the font and the environment in which it will
    be used.

    Params:
      fontFace = a #cairo_font_face_t
      fontMatrix = font space to user space transformation matrix for the
              font. In the simplest case of a N point font, this matrix is
              just a scale by N, but it can also be used to shear the font
              or stretch it unequally along the two axes. See
              [cairo.context.Context.setFontMatrix].
      ctm = user to device transformation matrix with which the font will
              be used.
      options = options to use when getting metrics for the font and
                  rendering with it.
    Returns: a newly created #cairo_scaled_font_t. Destroy with
       [cairo.scaled_font.ScaledFont.destroy]
*/
cairo.scaled_font.ScaledFont scaledFontCreate(cairo.font_face.FontFace fontFace, cairo.matrix.Matrix fontMatrix, cairo.matrix.Matrix ctm, cairo.font_options.FontOptions options)
{
  cairo_scaled_font_t* _cretval;
  _cretval = cairo_scaled_font_create(fontFace ? cast(cairo_font_face_t*)fontFace._cPtr(No.Dup) : null, cast(const(cairo_matrix_t)*)&fontMatrix, cast(const(cairo_matrix_t)*)&ctm, options ? cast(const(cairo_font_options_t)*)options._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.scaled_font.ScaledFont(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a output device for emitting the script, used when
    creating the individual surfaces.

    Params:
      filename = the name (path) of the file to write the script to
    Returns: a pointer to the newly created device. The caller
      owns the surface and should call [cairo.device.Device.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" device if an error such as out of memory
      occurs. You can use [cairo.device.Device.status] to check for this.
*/
cairo.device.Device scriptCreate(string filename)
{
  cairo_device_t* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _cretval = cairo_script_create(_filename);
  auto _retval = _cretval ? new cairo.device.Device(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a output device for emitting the script, used when
    creating the individual surfaces.

    Params:
      writeFunc = callback function passed the bytes written to the script
    Returns: a pointer to the newly created device. The caller
      owns the surface and should call [cairo.device.Device.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" device if an error such as out of memory
      occurs. You can use [cairo.device.Device.status] to check for this.
*/
cairo.device.Device scriptCreateForStream(cairo.types.WriteFunc writeFunc)
{
  extern(C) cairo_status_t _writeFuncCallback(void* closure, const(ubyte)* data, uint length)
  {
    cairo.types.Status _dretval;
    auto _dlg = cast(cairo.types.WriteFunc*)closure;
    ubyte[] _data;
    _data.length = length;
    _data[0 .. length] = data[0 .. length];

    _dretval = (*_dlg)(_data);
    auto _retval = cast(cairo_status_t)_dretval;

    return _retval;
  }
  auto _writeFuncCB = writeFunc ? &_writeFuncCallback : null;
  cairo_device_t* _cretval;
  auto _writeFunc = writeFunc ? cast(void*)&(writeFunc) : null;
  _cretval = cairo_script_create_for_stream(_writeFuncCB, _writeFunc);
  auto _retval = _cretval ? new cairo.device.Device(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Converts the record operations in recording_surface into a script.

    Params:
      script = the script (output device)
      recordingSurface = the recording surface to replay
    Returns: #CAIRO_STATUS_SUCCESS on successful completion or an error code.
*/
cairo.types.Status scriptFromRecordingSurface(cairo.device.Device script, cairo.surface.Surface recordingSurface)
{
  cairo_status_t _cretval;
  _cretval = cairo_script_from_recording_surface(script ? cast(cairo_device_t*)script._cPtr(No.Dup) : null, recordingSurface ? cast(cairo_surface_t*)recordingSurface._cPtr(No.Dup) : null);
  cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
  return _retval;
}

/**
    Queries the script for its current output mode.

    Params:
      script = The script (output device) to query
    Returns: the current output mode of the script
*/
cairo.types.ScriptMode scriptGetMode(cairo.device.Device script)
{
  cairo_script_mode_t _cretval;
  _cretval = cairo_script_get_mode(script ? cast(cairo_device_t*)script._cPtr(No.Dup) : null);
  cairo.types.ScriptMode _retval = cast(cairo.types.ScriptMode)_cretval;
  return _retval;
}

/**
    Change the output mode of the script

    Params:
      script = The script (output device)
      mode = the new mode
*/
void scriptSetMode(cairo.device.Device script, cairo.types.ScriptMode mode)
{
  cairo_script_set_mode(script ? cast(cairo_device_t*)script._cPtr(No.Dup) : null, mode);
}

/**
    Create a new surface that will emit its rendering through script

    Params:
      script = the script (output device)
      content = the content of the surface
      width = width in pixels
      height = height in pixels
    Returns: a pointer to the newly created surface. The caller
      owns the surface and should call [cairo.surface.Surface.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" surface if an error such as out of memory
      occurs. You can use [cairo.surface.Surface.status] to check for this.
*/
cairo.surface.Surface scriptSurfaceCreate(cairo.device.Device script, cairo.types.Content content, double width, double height)
{
  cairo_surface_t* _cretval;
  _cretval = cairo_script_surface_create(script ? cast(cairo_device_t*)script._cPtr(No.Dup) : null, content, width, height);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Create a pxoy surface that will render to target and record
    the operations to device.

    Params:
      script = the script (output device)
      target = a target surface to wrap
    Returns: a pointer to the newly created surface. The caller
      owns the surface and should call [cairo.surface.Surface.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" surface if an error such as out of memory
      occurs. You can use [cairo.surface.Surface.status] to check for this.
*/
cairo.surface.Surface scriptSurfaceCreateForTarget(cairo.device.Device script, cairo.surface.Surface target)
{
  cairo_surface_t* _cretval;
  _cretval = cairo_script_surface_create_for_target(script ? cast(cairo_device_t*)script._cPtr(No.Dup) : null, target ? cast(cairo_surface_t*)target._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Emit a string verbatim into the script.

    Params:
      script = the script (output device)
      comment = the string to emit
*/
void scriptWriteComment(cairo.device.Device script, string comment)
{
  int _len;
  if (comment)
    _len = cast(int)comment.length;

  auto _comment = cast(const(char)*)comment.ptr;
  cairo_script_write_comment(script ? cast(cairo_device_t*)script._cPtr(No.Dup) : null, _comment, _len);
}

/**
    Provides a human-readable description of a #cairo_status_t.

    Params:
      status = a cairo status
    Returns: a string representation of the status
*/
string statusToString(cairo.types.Status status)
{
  const(char)* _cretval;
  _cretval = cairo_status_to_string(status);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Used to retrieve the list of supported versions. See
    [cairo.global.svgSurfaceRestrictToVersion].

    Params:
      versions = supported version list
*/
void svgGetVersions(out cairo.types.SvgVersion[] versions)
{
  int _numVersions;
  const(cairo_svg_version_t)* _versions;
  cairo_svg_get_versions(&_versions, &_numVersions);
  versions.length = _numVersions;
  versions[0 .. $] = (cast(cairo.types.SvgVersion*)_versions)[0 .. _numVersions];
}

/**
    Creates a SVG surface of the specified size in points to be written
    to filename.
    
    The SVG surface backend recognizes the following MIME types for the
    data attached to a surface (see [cairo.surface.Surface.setMimeData]) when
    it is used as a source pattern for drawing on this surface:
    [cairo.types.MIME_TYPE_JPEG], [cairo.types.MIME_TYPE_PNG],
    [cairo.types.MIME_TYPE_URI]. If any of them is specified, the SVG backend
    emits a href with the content of MIME data instead of a surface
    snapshot (PNG, Base64-encoded) in the corresponding image tag.
    
    The unofficial MIME type [cairo.types.MIME_TYPE_URI] is examined
    first. If present, the URI is emitted as is: assuring the
    correctness of URI is left to the client code.
    
    If [cairo.types.MIME_TYPE_URI] is not present, but [cairo.types.MIME_TYPE_JPEG]
    or [cairo.types.MIME_TYPE_PNG] is specified, the corresponding data is
    Base64-encoded and emitted.
    
    If [cairo.types.MIME_TYPE_UNIQUE_ID] is present, all surfaces with the same
    unique identifier will only be embedded once.

    Params:
      filename = a filename for the SVG output (must be writable), null may be
                   used to specify no output. This will generate a SVG surface that
                   may be queried and used as a source, without generating a
                   temporary file.
      widthInPoints = width of the surface, in points (1 point == 1/72.0 inch)
      heightInPoints = height of the surface, in points (1 point == 1/72.0 inch)
    Returns: a pointer to the newly created surface. The caller
      owns the surface and should call [cairo.surface.Surface.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" surface if an error such as out of memory
      occurs. You can use [cairo.surface.Surface.status] to check for this.
*/
cairo.surface.Surface svgSurfaceCreate(string filename, double widthInPoints, double heightInPoints)
{
  cairo_surface_t* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _cretval = cairo_svg_surface_create(_filename, widthInPoints, heightInPoints);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a SVG surface of the specified size in points to be written
    incrementally to the stream represented by write_func and closure.

    Params:
      writeFunc = a #cairo_write_func_t to accept the output data, may be null
                     to indicate a no-op write_func. With a no-op write_func,
                     the surface may be queried or used as a source without
                     generating any temporary files.
      widthInPoints = width of the surface, in points (1 point == 1/72.0 inch)
      heightInPoints = height of the surface, in points (1 point == 1/72.0 inch)
    Returns: a pointer to the newly created surface. The caller
      owns the surface and should call [cairo.surface.Surface.destroy] when done
      with it.
      
      This function always returns a valid pointer, but it will return a
      pointer to a "nil" surface if an error such as out of memory
      occurs. You can use [cairo.surface.Surface.status] to check for this.
*/
cairo.surface.Surface svgSurfaceCreateForStream(cairo.types.WriteFunc writeFunc, double widthInPoints, double heightInPoints)
{
  extern(C) cairo_status_t _writeFuncCallback(void* closure, const(ubyte)* data, uint length)
  {
    cairo.types.Status _dretval;
    auto _dlg = cast(cairo.types.WriteFunc*)closure;
    ubyte[] _data;
    _data.length = length;
    _data[0 .. length] = data[0 .. length];

    _dretval = (*_dlg)(_data);
    auto _retval = cast(cairo_status_t)_dretval;

    return _retval;
  }
  auto _writeFuncCB = writeFunc ? &_writeFuncCallback : null;
  cairo_surface_t* _cretval;
  auto _writeFunc = writeFunc ? cast(void*)&(writeFunc) : null;
  _cretval = cairo_svg_surface_create_for_stream(_writeFuncCB, _writeFunc, widthInPoints, heightInPoints);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Get the unit of the SVG surface.
    
    If the surface passed as an argument is not a SVG surface, the function
    sets the error status to CAIRO_STATUS_SURFACE_TYPE_MISMATCH and returns
    CAIRO_SVG_UNIT_USER.

    Params:
      surface = a SVG #cairo_surface_t
    Returns: the SVG unit of the SVG surface.
*/
cairo.types.SvgUnit svgSurfaceGetDocumentUnit(cairo.surface.Surface surface)
{
  cairo_svg_unit_t _cretval;
  _cretval = cairo_svg_surface_get_document_unit(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  cairo.types.SvgUnit _retval = cast(cairo.types.SvgUnit)_cretval;
  return _retval;
}

/**
    Restricts the generated SVG file to version. See [cairo.global.svgGetVersions]
    for a list of available version values that can be used here.
    
    This function should only be called before any drawing operations
    have been performed on the given surface. The simplest way to do
    this is to call this function immediately after creating the
    surface.

    Params:
      surface = a SVG #cairo_surface_t
      version_ = SVG version
*/
void svgSurfaceRestrictToVersion(cairo.surface.Surface surface, cairo.types.SvgVersion version_)
{
  cairo_svg_surface_restrict_to_version(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, version_);
}

/**
    Use the specified unit for the width and height of the generated SVG file.
    See #cairo_svg_unit_t for a list of available unit values that can be used
    here.
    
    This function can be called at any time before generating the SVG file.
    
    However to minimize the risk of ambiguities it's recommended to call it
    before any drawing operations have been performed on the given surface, to
    make it clearer what the unit used in the drawing operations is.
    
    The simplest way to do this is to call this function immediately after
    creating the SVG surface.
    
    Note if this function is never called, the default unit for SVG documents
    generated by cairo will be user unit.

    Params:
      surface = a SVG #cairo_surface_t
      unit = SVG unit
*/
void svgSurfaceSetDocumentUnit(cairo.surface.Surface surface, cairo.types.SvgUnit unit)
{
  cairo_svg_surface_set_document_unit(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, unit);
}

/**
    Get the string representation of the given version id. This function
    will return null if version isn't valid. See [cairo.global.svgGetVersions]
    for a way to get the list of valid version ids.

    Params:
      version_ = a version id
    Returns: the string associated to given version.
*/
string svgVersionToString(cairo.types.SvgVersion version_)
{
  const(char)* _cretval;
  _cretval = cairo_svg_version_to_string(version_);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Adds a new target surface to the list of replicas of a
    tee surface.

    Params:
      abstractSurface = a #cairo_tee_surface_t
      target = the surface to add
*/
void teeSurfaceAdd(cairo.surface.Surface abstractSurface, cairo.surface.Surface target)
{
  cairo_tee_surface_add(abstractSurface ? cast(cairo_surface_t*)abstractSurface._cPtr(No.Dup) : null, target ? cast(cairo_surface_t*)target._cPtr(No.Dup) : null);
}

/**
    Creates a new "tee" surface.
    
    The primary surface is used when querying surface options, like
    font options and extents.
    
    Operations performed on the tee surface will be replayed on any
    surface added to it.

    Params:
      primary = the primary #cairo_surface_t
    Returns: the newly created surface
*/
cairo.surface.Surface teeSurfaceCreate(cairo.surface.Surface primary)
{
  cairo_surface_t* _cretval;
  _cretval = cairo_tee_surface_create(primary ? cast(cairo_surface_t*)primary._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Retrieves the replica surface at the given index.
    
    The primary surface used to create the #cairo_tee_surface_t is
    always set at the zero index.

    Params:
      abstractSurface = a #cairo_tee_surface_t
      index = the index of the replica to retrieve
    Returns: the surface at the given index
*/
cairo.surface.Surface teeSurfaceIndex(cairo.surface.Surface abstractSurface, uint index)
{
  cairo_surface_t* _cretval;
  _cretval = cairo_tee_surface_index(abstractSurface ? cast(cairo_surface_t*)abstractSurface._cPtr(No.Dup) : null, index);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Removes the given surface from the list of replicas of a
    tee surface.

    Params:
      abstractSurface = a #cairo_tee_surface_t
      target = the surface to remove
*/
void teeSurfaceRemove(cairo.surface.Surface abstractSurface, cairo.surface.Surface target)
{
  cairo_tee_surface_remove(abstractSurface ? cast(cairo_surface_t*)abstractSurface._cPtr(No.Dup) : null, target ? cast(cairo_surface_t*)target._cPtr(No.Dup) : null);
}

/**
    Allocates an array of #cairo_text_cluster_t's.
    This function is only useful in implementations of
    #cairo_user_scaled_font_text_to_glyphs_func_t where the user
    needs to allocate an array of text clusters that cairo will free.
    For all other uses, user can use their own allocation method
    for text clusters.
    
    This function returns null if num_clusters is not positive,
    or if out of memory.  That means, the null return value
    signals out-of-memory only if num_clusters was positive.

    Params:
      numClusters = number of text_clusters to allocate
    Returns: the newly allocated array of text clusters that should be
               freed using [cairo.text_cluster.TextCluster.free]
*/
cairo.text_cluster.TextCluster textClusterAllocate(int numClusters)
{
  cairo_text_cluster_t* _cretval;
  _cretval = cairo_text_cluster_allocate(numClusters);
  cairo.text_cluster.TextCluster _retval;
  if (_cretval)
    _retval = *cast(cairo.text_cluster.TextCluster*)_cretval;
  return _retval;
}

/**
    Creates a font face from a triplet of family, slant, and weight.
    These font faces are used in implementation of the #cairo_t "toy"
    font API.
    
    If family is the zero-length string "", the platform-specific default
    family is assumed.  The default family then can be queried using
    [cairo.global.toyFontFaceGetFamily].
    
    The [cairo.context.Context.selectFontFace] function uses this to create font faces.
    See that function for limitations and other details of toy font faces.

    Params:
      family = a font family name, encoded in UTF-8
      slant = the slant for the font
      weight = the weight for the font
    Returns: a newly created #cairo_font_face_t. Free with
       [cairo.font_face.FontFace.destroy] when you are done using it.
*/
cairo.font_face.FontFace toyFontFaceCreate(string family, cairo.types.FontSlant slant, cairo.types.FontWeight weight)
{
  cairo_font_face_t* _cretval;
  const(char)* _family = family.toCString(No.Alloc);
  _cretval = cairo_toy_font_face_create(_family, slant, weight);
  auto _retval = _cretval ? new cairo.font_face.FontFace(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Gets the family name of a toy font.

    Params:
      fontFace = A toy font face
    Returns: The family name.  This string is owned by the font face
      and remains valid as long as the font face is alive (referenced).
*/
string toyFontFaceGetFamily(cairo.font_face.FontFace fontFace)
{
  const(char)* _cretval;
  _cretval = cairo_toy_font_face_get_family(fontFace ? cast(cairo_font_face_t*)fontFace._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the slant a toy font.

    Params:
      fontFace = A toy font face
    Returns: The slant value
*/
cairo.types.FontSlant toyFontFaceGetSlant(cairo.font_face.FontFace fontFace)
{
  cairo_font_slant_t _cretval;
  _cretval = cairo_toy_font_face_get_slant(fontFace ? cast(cairo_font_face_t*)fontFace._cPtr(No.Dup) : null);
  cairo.types.FontSlant _retval = cast(cairo.types.FontSlant)_cretval;
  return _retval;
}

/**
    Gets the weight a toy font.

    Params:
      fontFace = A toy font face
    Returns: The weight value
*/
cairo.types.FontWeight toyFontFaceGetWeight(cairo.font_face.FontFace fontFace)
{
  cairo_font_weight_t _cretval;
  _cretval = cairo_toy_font_face_get_weight(fontFace ? cast(cairo_font_face_t*)fontFace._cPtr(No.Dup) : null);
  cairo.types.FontWeight _retval = cast(cairo.types.FontWeight)_cretval;
  return _retval;
}

/**
    Creates a new user font-face.
    
    Use the setter functions to associate callbacks with the returned
    user font.  The only mandatory callback is render_glyph.
    
    After the font-face is created, the user can attach arbitrary data
    (the actual font data) to it using [cairo.font_face.FontFace.setUserData]
    and access it from the user-font callbacks by using
    [cairo.scaled_font.ScaledFont.getFontFace] followed by
    [cairo.font_face.FontFace.getUserData].
    Returns: a newly created #cairo_font_face_t. Free with
       [cairo.font_face.FontFace.destroy] when you are done using it.
*/
cairo.font_face.FontFace userFontFaceCreate()
{
  cairo_font_face_t* _cretval;
  _cretval = cairo_user_font_face_create();
  auto _retval = _cretval ? new cairo.font_face.FontFace(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Gets the foreground pattern of the glyph currently being
    rendered. A #cairo_user_scaled_font_render_glyph_func_t function
    that has been set with
    [cairo.global.userFontFaceSetRenderColorGlyphFunc] may call this
    function to retrieve the current foreground pattern for the glyph
    being rendered. The function should not be called outside of a
    [cairo.global.userFontFaceSetRenderColorGlyphFunc] callback.
    
    The foreground marker pattern contains an internal marker to
    indicate that it is to be substituted with the current source when
    rendered to a surface. Querying the foreground marker will reveal a
    solid black color, however this is not representative of the color
    that will actually be used. Similarly, setting a solid black color
    will render black, not the foreground pattern when the glyph is
    painted to a surface. Using the foreground marker as the source
    instead of [cairo.global.userScaledFontGetForegroundSource] in a
    color render callback has the following benefits:
    
    1. Cairo only needs to call the render callback once as it can
    cache the recording. Cairo will substitute the actual foreground
    color when rendering the recording.
    
    2. On backends that have the concept of a foreground color in fonts such as
    PDF, PostScript, and SVG, cairo can generate more optimal
    output. The glyph can be included in an embedded font.
    
    The one drawback of the using foreground marker is the render
    callback can not access the color components of the pattern as the
    actual foreground pattern is not available at the time the render
    callback is invoked. If the render callback needs to query the
    foreground pattern, use
    [cairo.global.userScaledFontGetForegroundSource].
    
    If the render callback simply wants to call [cairo.context.Context.setSource] with
    the foreground pattern,
    [cairo.global.userScaledFontGetForegroundMarker] is the preferred
    function to use as it results in better performance than
    [cairo.global.userScaledFontGetForegroundSource].

    Params:
      scaledFont = A user scaled font
    Returns: the current foreground source marker pattern. This
      object is owned by cairo. This object must not be modified or used
      outside of a color render callback. To keep a reference to it,
      you must call [cairo.pattern.Pattern.reference].
*/
cairo.pattern.Pattern userScaledFontGetForegroundMarker(cairo.scaled_font.ScaledFont scaledFont)
{
  cairo_pattern_t* _cretval;
  _cretval = cairo_user_scaled_font_get_foreground_marker(scaledFont ? cast(cairo_scaled_font_t*)scaledFont._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Gets the foreground pattern of the glyph currently being
    rendered. A #cairo_user_scaled_font_render_glyph_func_t function
    that has been set with
    [cairo.global.userFontFaceSetRenderColorGlyphFunc] may call this
    function to retrieve the current foreground pattern for the glyph
    being rendered. The function should not be called outside of a
    [cairo.global.userFontFaceSetRenderColorGlyphFunc] callback.
    
    This function returns the current source at the time the glyph is
    rendered. Compared with
    [cairo.global.userScaledFontGetForegroundMarker], this function
    returns the actual source pattern that will be used to render the
    glyph.  The render callback is free to query the pattern and
    extract color components or other pattern data. For example if the
    render callback wants to create a gradient stop based on colors in
    the foreground source pattern, it will need to use this function in
    order to be able to query the colors in the foreground pattern.
    
    While this function does not have the restrictions on using the
    pattern that [cairo.global.userScaledFontGetForegroundMarker] has, it
    does incur a performance penalty. If a render callback calls this
    function:
    
    1. Cairo will call the render callback whenever the current pattern
    of the context in which the glyph is rendered changes.
    
    2. On backends that support font embedding (PDF, PostScript, and
    SVG), cairo can not embed this glyph in a font. Instead the glyph
    will be emitted as an image or sequence of drawing operations each
    time it is used.

    Params:
      scaledFont = A user scaled font
    Returns: the current foreground source pattern. This object is
      owned by cairo. To keep a reference to it, you must call
      [cairo.pattern.Pattern.reference].
*/
cairo.pattern.Pattern userScaledFontGetForegroundSource(cairo.scaled_font.ScaledFont scaledFont)
{
  cairo_pattern_t* _cretval;
  _cretval = cairo_user_scaled_font_get_foreground_source(scaledFont ? cast(cairo_scaled_font_t*)scaledFont._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Returns the version of the cairo library encoded in a single
    integer as per `CAIRO_VERSION_ENCODE`. The encoding ensures that
    later versions compare greater than earlier versions.
    
    A run-time comparison to check that cairo's version is greater than
    or equal to version X.Y.Z could be performed as follows:
    
    <informalexample><programlisting>
    if ([cairo.global.version_] >= CAIRO_VERSION_ENCODE(X,Y,Z)) {...}
    </programlisting></informalexample>
    
    See also [cairo.global.versionString] as well as the compile-time
    equivalents `CAIRO_VERSION` and `CAIRO_VERSION_STRING`.
    Returns: the encoded version.
*/
int version_()
{
  int _retval;
  _retval = cairo_version();
  return _retval;
}

/**
    Returns the version of the cairo library as a human-readable string
    of the form "X.Y.Z".
    
    See also [cairo.global.version_] as well as the compile-time equivalents
    `CAIRO_VERSION_STRING` and `CAIRO_VERSION`.
    Returns: a string containing the version.
*/
string versionString()
{
  const(char)* _cretval;
  _cretval = cairo_version_string();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}
