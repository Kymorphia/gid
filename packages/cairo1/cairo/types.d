/// D types for cairo1 library
module cairo.types;

import cairo.c.functions;
import cairo.c.types;
import cairo.context;
import cairo.pattern;
import cairo.scaled_font;
import cairo.surface;
import gid.gid;


// Aliases

/** */
alias Bool = cairo_bool_t;

// Enums

/** */
alias Antialias = cairo_antialias_t;

/** */
alias ColorMode = cairo_color_mode_t;

/** */
alias Content = cairo_content_t;

/** */
alias DeviceType = cairo_device_type_t;

/** */
alias Dither = cairo_dither_t;

/** */
alias Extend = cairo_extend_t;

/** */
alias FillRule = cairo_fill_rule_t;

/** */
alias Filter = cairo_filter_t;

/** */
alias FontSlant = cairo_font_slant_t;

/** */
alias FontType = cairo_font_type_t;

/** */
alias FontWeight = cairo_font_weight_t;

/** */
alias Format = cairo_format_t;

/** */
alias HintMetrics = cairo_hint_metrics_t;

/** */
alias HintStyle = cairo_hint_style_t;

/** */
alias LineCap = cairo_line_cap_t;

/** */
alias LineJoin = cairo_line_join_t;

/** */
alias Operator = cairo_operator_t;

/** */
alias PathDataType = cairo_path_data_type_t;

/** */
alias PatternType = cairo_pattern_type_t;

/** */
alias PdfMetadata = cairo_pdf_metadata_t;

/** */
alias PdfOutlineFlags = cairo_pdf_outline_flags_t;

/** */
alias PdfVersion = cairo_pdf_version_t;

/** */
alias PsLevel = cairo_ps_level_t;

/** */
alias RegionOverlap = cairo_region_overlap_t;

/** */
alias ScriptMode = cairo_script_mode_t;

/** */
alias Status = cairo_status_t;

/** */
alias SubpixelOrder = cairo_subpixel_order_t;

/** */
alias SurfaceObserverMode = cairo_surface_observer_mode_t;

/** */
alias SurfaceType = cairo_surface_type_t;

/** */
alias SvgUnit = cairo_svg_unit_t;

/** */
alias SvgVersion = cairo_svg_version_t;

/** */
alias TextClusterFlags = cairo_text_cluster_flags_t;

// Structs

/** */
alias FontExtents = cairo_font_extents_t;

/** */
alias Rectangle = cairo_rectangle_t;

/** */
alias RectangleInt = cairo_rectangle_int_t;

/** */
alias TextExtents = cairo_text_extents_t;

/** */
alias UserDataKey = cairo_user_data_key_t;

// Callbacks

/**
    #cairo_destroy_func_t the type of function which is called when a
    data element is destroyed. It is passed the pointer to the data
    element and should free any memory and resources allocated for it.
*/
alias DestroyFunc = void delegate();

/**
    #cairo_raster_source_acquire_func_t is the type of function which is
    called when a pattern is being rendered from. It should create a surface
    that provides the pixel data for the region of interest as defined by
    extents, though the surface itself does not have to be limited to that
    area. For convenience the surface should probably be of image type,
    created with [cairo.surface.Surface.createSimilarImage] for the target (which
    enables the number of copies to be reduced during transfer to the
    device). Another option, might be to return a similar surface to the
    target for explicit handling by the application of a set of cached sources
    on the device. The region of sample data provided should be defined using
    [cairo.surface.Surface.setDeviceOffset] to specify the top-left corner of the
    sample data (along with width and height of the surface).

    Params:
      pattern = the pattern being rendered from
      target = the rendering target surface
      extents = rectangular region of interest in pixels in sample space
    Returns: a #cairo_surface_t
*/
alias RasterSourceAcquireFunc = cairo.surface.Surface delegate(cairo.pattern.Pattern pattern, cairo.surface.Surface target, cairo.types.RectangleInt extents);

/**
    #cairo_raster_source_copy_func_t is the type of function which is
    called when the pattern gets copied as a normal part of rendering.

    Params:
      pattern = the #cairo_pattern_t that was copied to
      other = the #cairo_pattern_t being used as the source for the copy
    Returns: CAIRO_STATUS_SUCCESS on success, or one of the
      #cairo_status_t error codes for failure.
*/
alias RasterSourceCopyFunc = cairo.types.Status delegate(cairo.pattern.Pattern pattern, cairo.pattern.Pattern other);

/**
    #cairo_raster_source_finish_func_t is the type of function which is
    called when the pattern (or a copy thereof) is no longer required.

    Params:
      pattern = the pattern being rendered from
*/
alias RasterSourceFinishFunc = void delegate(cairo.pattern.Pattern pattern);

/**
    #cairo_raster_source_release_func_t is the type of function which is
    called when the pixel data is no longer being access by the pattern
    for the rendering operation. Typically this function will simply
    destroy the surface created during acquire.

    Params:
      pattern = the pattern being rendered from
      surface = the surface created during acquire
*/
alias RasterSourceReleaseFunc = void delegate(cairo.pattern.Pattern pattern, cairo.surface.Surface surface);

/**
    #cairo_raster_source_snapshot_func_t is the type of function which is
    called when the pixel data needs to be preserved for later use
    during printing. This pattern will be accessed again later, and it
    is expected to provide the pixel data that was current at the time
    of snapshotting.

    Params:
      pattern = the pattern being rendered from
    Returns: CAIRO_STATUS_SUCCESS on success, or one of the
      #cairo_status_t error codes for failure.
*/
alias RasterSourceSnapshotFunc = cairo.types.Status delegate(cairo.pattern.Pattern pattern);

/**
    #cairo_read_func_t is the type of function which is called when a
    backend needs to read data from an input stream.  It is passed the
    closure which was specified by the user at the time the read
    function was registered, the buffer to read the data into and the
    length of the data in bytes.  The read function should return
    [cairo.types.Status.Success] if all the data was successfully read,
    [cairo.types.Status.ReadError] otherwise.

    Params:
      data = the buffer into which to read the data
    Returns: the status code of the read operation
*/
alias ReadFunc = cairo.types.Status delegate(ubyte[] data);

/**
    A generic callback function for surface operations.

    Params:
      observer = the #cairo_surface_observer_t
      target = the observed surface
*/
alias SurfaceObserverCallback = void delegate(cairo.surface.Surface observer, cairo.surface.Surface target);

/**
    #cairo_user_scaled_font_init_func_t is the type of function which is
    called when a scaled-font needs to be created for a user font-face.
    
    The cairo context cr is not used by the caller, but is prepared in font
    space, similar to what the cairo contexts passed to the render_glyph
    method will look like.  The callback can use this context for extents
    computation for example.  After the callback is called, cr is checked
    for any error status.
    
    The extents argument is where the user font sets the font extents for
    scaled_font.  It is in font space, which means that for most cases its
    ascent and descent members should add to 1.0.  extents is preset to
    hold a value of 1.0 for ascent, height, and max_x_advance, and 0.0 for
    descent and max_y_advance members.
    
    The callback is optional.  If not set, default font extents as described
    in the previous paragraph will be used.
    
    Note that scaled_font is not fully initialized at this
    point and trying to use it for text operations in the callback will result
    in deadlock.

    Params:
      scaledFont = the scaled-font being created
      cr = a cairo context, in font space
      extents = font extents to fill in, in font space
    Returns: [cairo.types.Status.Success] upon success, or an error status on error.
*/
alias UserScaledFontInitFunc = cairo.types.Status delegate(cairo.scaled_font.ScaledFont scaledFont, cairo.context.Context cr, cairo.types.FontExtents extents);

/**
    #cairo_user_scaled_font_render_glyph_func_t is the type of function which
    is called when a user scaled-font needs to render a glyph.
    
    The callback is mandatory, and expected to draw the glyph with code glyph to
    the cairo context cr.  cr is prepared such that the glyph drawing is done in
    font space.  That is, the matrix set on cr is the scale matrix of scaled_font.
    The extents argument is where the user font sets the font extents for
    scaled_font.  However, if user prefers to draw in user space, they can
    achieve that by changing the matrix on cr.
    
    All cairo rendering operations to cr are permitted. However, when
    this callback is set with
    [cairo.global.userFontFaceSetRenderGlyphFunc], the result is
    undefined if any source other than the default source on cr is
    used.  That means, glyph bitmaps should be rendered using
    [cairo.context.Context.mask] instead of [cairo.context.Context.paint].
    
    When this callback is set with
    [cairo.global.userFontFaceSetRenderColorGlyphFunc], the default
    source is black. Setting the source is a valid
    operation. [cairo.global.userScaledFontGetForegroundMarker] or
    [cairo.global.userScaledFontGetForegroundSource] may be called to
    obtain the current source at the time the glyph is rendered.
    
    Other non-default settings on cr include a font size of 1.0 (given that
    it is set up to be in font space), and font options corresponding to
    scaled_font.
    
    The extents argument is preset to have <literal>x_bearing</literal>,
    <literal>width</literal>, and <literal>y_advance</literal> of zero,
    <literal>y_bearing</literal> set to <literal>-font_extents.ascent</literal>,
    <literal>height</literal> to <literal>font_extents.ascent+font_extents.descent</literal>,
    and <literal>x_advance</literal> to <literal>font_extents.max_x_advance</literal>.
    The only field user needs to set in majority of cases is
    <literal>x_advance</literal>.
    If the <literal>width</literal> field is zero upon the callback returning
    (which is its preset value), the glyph extents are automatically computed
    based on the drawings done to cr.  This is in most cases exactly what the
    desired behavior is.  However, if for any reason the callback sets the
    extents, it must be ink extents, and include the extents of all drawing
    done to cr in the callback.
    
    Where both color and non-color callbacks has been set using
    [cairo.global.userFontFaceSetRenderColorGlyphFunc], and
    [cairo.global.userFontFaceSetRenderGlyphFunc], the color glyph
    callback will be called first. If the color glyph callback returns
    [cairo.types.Status.UserFontNotImplemented], any drawing operations are
    discarded and the non-color callback will be called. This is the
    only case in which the [cairo.types.Status.UserFontNotImplemented] may
    be returned from a render callback. This fallback sequence allows a
    user font face to contain a combination of both color and non-color
    glyphs.

    Params:
      scaledFont = user scaled-font
      glyph = glyph code to render
      cr = cairo context to draw to, in font space
      extents = glyph extents to fill in, in font space
    Returns: [cairo.types.Status.Success] upon success,
      [cairo.types.Status.UserFontNotImplemented] if fallback options should be tried,
      or [cairo.types.Status.UserFontError] or any other error status on error.
*/
alias UserScaledFontRenderGlyphFunc = cairo.types.Status delegate(cairo.scaled_font.ScaledFont scaledFont, gulong glyph, cairo.context.Context cr, cairo.types.TextExtents extents);

/**
    #cairo_user_scaled_font_unicode_to_glyph_func_t is the type of function which
    is called to convert an input Unicode character to a single glyph.
    This is used by the [cairo.context.Context.showText] operation.
    
    This callback is used to provide the same functionality as the
    text_to_glyphs callback does (see #cairo_user_scaled_font_text_to_glyphs_func_t)
    but has much less control on the output,
    in exchange for increased ease of use.  The inherent assumption to using
    this callback is that each character maps to one glyph, and that the
    mapping is context independent.  It also assumes that glyphs are positioned
    according to their advance width.  These mean no ligatures, kerning, or
    complex scripts can be implemented using this callback.
    
    The callback is optional, and only used if text_to_glyphs callback is not
    set or fails to return glyphs.  If this callback is not set or if it returns
    [cairo.types.Status.UserFontNotImplemented], an identity mapping from Unicode
    code-points to glyph indices is assumed.
    
    Note: While cairo does not impose any limitation on glyph indices,
    some applications may assume that a glyph index fits in a 16-bit
    unsigned integer.  As such, it is advised that user-fonts keep their
    glyphs in the 0 to 65535 range.  Furthermore, some applications may
    assume that glyph 0 is a special glyph-not-found glyph.  User-fonts
    are advised to use glyph 0 for such purposes and do not use that
    glyph value for other purposes.

    Params:
      scaledFont = the scaled-font being created
      unicode = input unicode character code-point
      glyphIndex = output glyph index
    Returns: [cairo.types.Status.Success] upon success,
      [cairo.types.Status.UserFontNotImplemented] if fallback options should be tried,
      or [cairo.types.Status.UserFontError] or any other error status on error.
*/
alias UserScaledFontUnicodeToGlyphFunc = cairo.types.Status delegate(cairo.scaled_font.ScaledFont scaledFont, gulong unicode, out gulong glyphIndex);

/**
    #cairo_write_func_t is the type of function which is called when a
    backend needs to write data to an output stream.  It is passed the
    closure which was specified by the user at the time the write
    function was registered, the data to write and the length of the
    data in bytes.  The write function should return
    [cairo.types.Status.Success] if all the data was successfully written,
    [cairo.types.Status.WriteError] otherwise.

    Params:
      data = the buffer containing the data to write
    Returns: the status code of the write operation
*/
alias WriteFunc = cairo.types.Status delegate(ubyte[] data);

/**
    The default color palette index.
*/
enum COLOR_PALETTE_DEFAULT = 0;

/**
    Group 3 or Group 4 CCITT facsimile encoding (International
    Telecommunication Union, Recommendations T.4 and T.6.)
*/
enum MIME_TYPE_CCITT_FAX = "image/g3fax";

/**
    Decode parameters for Group 3 or Group 4 CCITT facsimile encoding.
    See [CCITT Fax Images][ccitt].
*/
enum MIME_TYPE_CCITT_FAX_PARAMS = "application/x-cairo.ccitt.params";

/**
    Encapsulated PostScript file.
    [Encapsulated PostScript File Format Specification](http://wwwimages.adobe.com/content/dam/Adobe/endevnet/postscript/pdfs/5002.EPSF_Spec.pdf)
*/
enum MIME_TYPE_EPS = "application/postscript";

/**
    Embedding parameters Encapsulated PostScript data.
    See [Embedding EPS files][eps].
*/
enum MIME_TYPE_EPS_PARAMS = "application/x-cairo.eps.params";

/**
    Joint Bi-level Image Experts Group image coding standard (ISO/IEC 11544).
*/
enum MIME_TYPE_JBIG2 = "application/x-cairo.jbig2";

/**
    Joint Bi-level Image Experts Group image coding standard (ISO/IEC 11544) global segment.
*/
enum MIME_TYPE_JBIG2_GLOBAL = "application/x-cairo.jbig2-global";

/**
    An unique identifier shared by a JBIG2 global segment and all JBIG2 images
    that depend on the global segment.
*/
enum MIME_TYPE_JBIG2_GLOBAL_ID = "application/x-cairo.jbig2-global-id";

/**
    The Joint Photographic Experts Group (JPEG) 2000 image coding standard (ISO/IEC 15444-1).
*/
enum MIME_TYPE_JP2 = "image/jp2";

/**
    The Joint Photographic Experts Group (JPEG) image coding standard (ISO/IEC 10918-1).
*/
enum MIME_TYPE_JPEG = "image/jpeg";

/**
    The Portable Network Graphics image file format (ISO/IEC 15948).
*/
enum MIME_TYPE_PNG = "image/png";

/**
    Unique identifier for a surface (cairo specific MIME type). All surfaces with
    the same unique identifier will only be embedded once.
*/
enum MIME_TYPE_UNIQUE_ID = "application/x-cairo.uuid";

/**
    URI for an image file (unofficial MIME type).
*/
enum MIME_TYPE_URI = "text/x-uri";

/**
    The root outline item in [cairo.global.pdfSurfaceAddOutline].
*/
enum PDF_OUTLINE_ROOT = 0;

/**
    Create a content tag.
*/
enum TAG_CONTENT = "cairo.content";

/**
    Create a content reference tag.
*/
enum TAG_CONTENT_REF = "cairo.content_ref";

/**
    Create a destination for a hyperlink. Destination tag attributes
    are detailed at [Destinations][dest].
*/
enum TAG_DEST = "cairo.dest";

/**
    Create hyperlink. Link tag attributes are detailed at
    [Links][link].
*/
enum TAG_LINK = "Link";
