/// C types for cairo1 library
module cairo.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import freetype2.c.types;

/**
    #cairo_bool_t is used for boolean values. Returns of type
    #cairo_bool_t will always be either 0 or 1, but testing against
    these values explicitly is not encouraged; just use the
    value as a boolean condition.
    
    <informalexample><programlisting>
     if (cairo_in_stroke (cr, x, y)) {
         /<!-- -->* do something *<!-- -->/
     }
    </programlisting></informalexample>
*/
alias cairo_bool_t = int;

/**
    Specifies the type of antialiasing to do when rendering text or shapes.
    
    These make no guarantee on how the backend will perform its rasterisation
    (if it even rasterises!), nor that they have any differing effect other
    than to enable some form of antialiasing. In the case of glyph rendering,
    @CAIRO_ANTIALIAS_FAST and @CAIRO_ANTIALIAS_GOOD will be mapped to
    @CAIRO_ANTIALIAS_GRAY, with @CAIRO_ANTALIAS_BEST being equivalent to
    @CAIRO_ANTIALIAS_SUBPIXEL.
    
    The interpretation of @CAIRO_ANTIALIAS_DEFAULT is left entirely up to
    the backend, typically this will be similar to @CAIRO_ANTIALIAS_GOOD.
*/
enum cairo_antialias_t
{
  /**
      Use the default antialiasing for
        the subsystem and target device, since 1.0
  */
  Default = 0,

  /**
      Use a bilevel alpha mask, since 1.0
  */
  None = 1,

  /**
      Perform single-color antialiasing (using
       shades of gray for black text on a white background, for example), since 1.0
  */
  Gray = 2,

  /**
      Perform antialiasing by taking
       advantage of the order of subpixel elements on devices
       such as LCD panels, since 1.0
  */
  Subpixel = 3,

  /**
      Hint that the backend should perform some
      antialiasing but prefer speed over quality, since 1.12
  */
  Fast = 4,

  /**
      The backend should balance quality against
      performance, since 1.12
  */
  Good = 5,

  /**
      Hint that the backend should render at the highest
      quality, sacrificing speed if necessary, since 1.12
  */
  Best = 6,
}

/**
    Specifies if color fonts are to be rendered using the color
    glyphs or outline glyphs. Glyphs that do not have a color
    presentation, and non-color fonts are not affected by this font
    option.
*/
enum cairo_color_mode_t
{
  /**
      Use the default color mode for
      font backend and target device, since 1.18.
  */
  Default = 0,

  /**
      Disable rendering color glyphs. Glyphs are
      always rendered as outline glyphs, since 1.18.
  */
  NoColor = 1,

  /**
      Enable rendering color glyphs. If the font
      contains a color presentation for a glyph, and when supported by
      the font backend, the glyph will be rendered in color, since 1.18.
  */
  Color = 2,
}

/**
    #cairo_content_t is used to describe the content that a surface will
    contain, whether color information, alpha information (translucence
    vs. opacity), or both.
    
    Note: The large values here are designed to keep #cairo_content_t
    values distinct from #cairo_format_t values so that the
    implementation can detect the error if users confuse the two types.
*/
enum cairo_content_t
{
  /**
      The surface will hold color content only. (Since 1.0)
  */
  Color = 4096,

  /**
      The surface will hold alpha content only. (Since 1.0)
  */
  Alpha = 8192,

  /**
      The surface will hold color and alpha content. (Since 1.0)
  */
  ColorAlpha = 12288,
}

/**
    #cairo_device_type_t is used to describe the type of a given
    device. The devices types are also known as "backends" within cairo.
    
    The device type can be queried with [cairo.device.Device.getDeviceType]
    
    The various #cairo_device_t functions can be used with devices of
    any type, but some backends also provide type-specific functions
    that must only be called with a device of the appropriate
    type. These functions have names that begin with
    <literal>cairo_<emphasis>type</emphasis>_device</literal> such as
    cairo_xcb_device_debug_cap_xrender_version().
    
    The behavior of calling a type-specific function with a device of
    the wrong type is undefined.
    
    New entries may be added in future versions.
*/
enum cairo_device_type_t
{
  /**
      The device is of type Direct Render Manager, since 1.10
  */
  Drm = 0,

  /**
      The device is of type OpenGL, since 1.10
  */
  Gl = 1,

  /**
      The device is of type script, since 1.10
  */
  Script = 2,

  /**
      The device is of type xcb, since 1.10
  */
  Xcb = 3,

  /**
      The device is of type xlib, since 1.10
  */
  Xlib = 4,

  /**
      The device is of type XML, since 1.10
  */
  Xml = 5,
}

/**
    Dither is an intentionally applied form of noise used to randomize
    quantization error, preventing large-scale patterns such as color banding
    in images (e.g. for gradients). Ordered dithering applies a precomputed
    threshold matrix to spread the errors smoothly.
    
     #cairo_dither_t is modeled on pixman dithering algorithm choice.
    As of Pixman 0.40, FAST corresponds to a 8x8 ordered bayer noise and GOOD
    and BEST use an ordered 64x64 precomputed blue noise.
*/
enum cairo_dither_t
{
  /**
      No dithering.
  */
  None = 0,

  /**
      Default choice at cairo compile time. Currently NONE.
  */
  Default = 1,

  /**
      Fastest dithering algorithm supported by the backend
  */
  Fast = 2,

  /**
      An algorithm with smoother dithering than FAST
  */
  Good = 3,

  /**
      Best algorithm available in the backend
  */
  Best = 4,
}

/**
    #cairo_extend_t is used to describe how pattern color/alpha will be
    determined for areas "outside" the pattern's natural area, (for
    example, outside the surface bounds or outside the gradient
    geometry).
    
    Mesh patterns are not affected by the extend mode.
    
    The default extend mode is [cairo.types.Extend.None] for surface patterns
    and [cairo.types.Extend.Pad] for gradient patterns.
    
    New entries may be added in future versions.
*/
enum cairo_extend_t
{
  /**
      pixels outside of the source pattern
        are fully transparent (Since 1.0)
  */
  None = 0,

  /**
      the pattern is tiled by repeating (Since 1.0)
  */
  Repeat = 1,

  /**
      the pattern is tiled by reflecting
        at the edges (Since 1.0; but only implemented for surface patterns since 1.6)
  */
  Reflect = 2,

  /**
      pixels outside of the pattern copy
        the closest pixel from the source (Since 1.2; but only
        implemented for surface patterns since 1.6)
  */
  Pad = 3,
}

/**
    #cairo_fill_rule_t is used to select how paths are filled. For both
    fill rules, whether or not a point is included in the fill is
    determined by taking a ray from that point to infinity and looking
    at intersections with the path. The ray can be in any direction,
    as long as it doesn't pass through the end point of a segment
    or have a tricky intersection such as intersecting tangent to the path.
    (Note that filling is not actually implemented in this way. This
    is just a description of the rule that is applied.)
    
    The default fill rule is [cairo.types.FillRule.Winding].
    
    New entries may be added in future versions.
*/
enum cairo_fill_rule_t
{
  /**
      If the path crosses the ray from
      left-to-right, counts +1. If the path crosses the ray
      from right to left, counts -1. (Left and right are determined
      from the perspective of looking along the ray from the starting
      point.) If the total count is non-zero, the point will be filled. (Since 1.0)
  */
  Winding = 0,

  /**
      Counts the total number of
      intersections, without regard to the orientation of the contour. If
      the total number of intersections is odd, the point will be
      filled. (Since 1.0)
  */
  EvenOdd = 1,
}

/**
    #cairo_filter_t is used to indicate what filtering should be
    applied when reading pixel values from patterns. See
    [cairo.pattern.Pattern.setFilter] for indicating the desired filter to be
    used with a particular pattern.
*/
enum cairo_filter_t
{
  /**
      A high-performance filter, with quality similar
          to [cairo.types.Filter.Nearest] (Since 1.0)
  */
  Fast = 0,

  /**
      A reasonable-performance filter, with quality
          similar to [cairo.types.Filter.Bilinear] (Since 1.0)
  */
  Good = 1,

  /**
      The highest-quality available, performance may
          not be suitable for interactive use. (Since 1.0)
  */
  Best = 2,

  /**
      Nearest-neighbor filtering (Since 1.0)
  */
  Nearest = 3,

  /**
      Linear interpolation in two dimensions (Since 1.0)
  */
  Bilinear = 4,

  /**
      This filter value is currently
          unimplemented, and should not be used in current code. (Since 1.0)
  */
  Gaussian = 5,
}

/**
    Specifies variants of a font face based on their slant.
*/
enum cairo_font_slant_t
{
  /**
      Upright font style, since 1.0
  */
  Normal = 0,

  /**
      Italic font style, since 1.0
  */
  Italic = 1,

  /**
      Oblique font style, since 1.0
  */
  Oblique = 2,
}

/**
    #cairo_font_type_t is used to describe the type of a given font
    face or scaled font. The font types are also known as "font
    backends" within cairo.
    
    The type of a font face is determined by the function used to
    create it, which will generally be of the form
    <function>cairo_<emphasis>type</emphasis>_font_face_create(<!-- -->)</function>.
    The font face type can be queried with [cairo.font_face.FontFace.getFontType]
    
    The various #cairo_font_face_t functions can be used with a font face
    of any type.
    
    The type of a scaled font is determined by the type of the font
    face passed to [cairo.global.scaledFontCreate]. The scaled font type can
    be queried with [cairo.scaled_font.ScaledFont.getFontType]
    
    The various #cairo_scaled_font_t functions can be used with scaled
    fonts of any type, but some font backends also provide
    type-specific functions that must only be called with a scaled font
    of the appropriate type. These functions have names that begin with
    <function>cairo_<emphasis>type</emphasis>_scaled_font(<!-- -->)</function>
    such as cairo_ft_scaled_font_lock_face().
    
    The behavior of calling a type-specific function with a scaled font
    of the wrong type is undefined.
    
    New entries may be added in future versions.
*/
enum cairo_font_type_t
{
  /**
      The font was created using cairo's toy font api (Since: 1.2)
  */
  Toy = 0,

  /**
      The font is of type FreeType (Since: 1.2)
  */
  Ft = 1,

  /**
      The font is of type Win32 (Since: 1.2)
  */
  Win32 = 2,

  /**
      The font is of type Quartz (Since: 1.6, in 1.2 and
      1.4 it was named CAIRO_FONT_TYPE_ATSUI)
  */
  Quartz = 3,

  /**
      The font was create using cairo's user font api (Since: 1.8)
  */
  User = 4,
}

/**
    Specifies variants of a font face based on their weight.
*/
enum cairo_font_weight_t
{
  /**
      Normal font weight, since 1.0
  */
  Normal = 0,

  /**
      Bold font weight, since 1.0
  */
  Bold = 1,
}

/**
    #cairo_format_t is used to identify the memory format of
    image data.
    
    New entries may be added in future versions.
*/
enum cairo_format_t
{
  /**
      no such format exists or is supported.
  */
  Invalid = -1,

  /**
      each pixel is a 32-bit quantity, with
        alpha in the upper 8 bits, then red, then green, then blue.
        The 32-bit quantities are stored native-endian. Pre-multiplied
        alpha is used. (That is, 50% transparent red is 0x80800000,
        not 0x80ff0000.) (Since 1.0)
  */
  Argb32 = 0,

  /**
      each pixel is a 32-bit quantity, with
        the upper 8 bits unused. Red, Green, and Blue are stored
        in the remaining 24 bits in that order. (Since 1.0)
  */
  Rgb24 = 1,

  /**
      each pixel is a 8-bit quantity holding
        an alpha value. (Since 1.0)
  */
  A8 = 2,

  /**
      each pixel is a 1-bit quantity holding
        an alpha value. Pixels are packed together into 32-bit
        quantities. The ordering of the bits matches the
        endianness of the platform. On a big-endian machine, the
        first pixel is in the uppermost bit, on a little-endian
        machine the first pixel is in the least-significant bit. (Since 1.0)
  */
  A1 = 3,

  /**
      each pixel is a 16-bit quantity
        with red in the upper 5 bits, then green in the middle
        6 bits, and blue in the lower 5 bits. (Since 1.2)
  */
  Rgb16565 = 4,
}

/**
    Specifies whether to hint font metrics; hinting font metrics
    means quantizing them so that they are integer values in
    device space. Doing this improves the consistency of
    letter and line spacing, however it also means that text
    will be laid out differently at different zoom factors.
*/
enum cairo_hint_metrics_t
{
  /**
      Hint metrics in the default
       manner for the font backend and target device, since 1.0
  */
  Default = 0,

  /**
      Do not hint font metrics, since 1.0
  */
  Off = 1,

  /**
      Hint font metrics, since 1.0
  */
  On = 2,
}

/**
    Specifies the type of hinting to do on font outlines. Hinting
    is the process of fitting outlines to the pixel grid in order
    to improve the appearance of the result. Since hinting outlines
    involves distorting them, it also reduces the faithfulness
    to the original outline shapes. Not all of the outline hinting
    styles are supported by all font backends.
    
    New entries may be added in future versions.
*/
enum cairo_hint_style_t
{
  /**
      Use the default hint style for
        font backend and target device, since 1.0
  */
  Default = 0,

  /**
      Do not hint outlines, since 1.0
  */
  None = 1,

  /**
      Hint outlines slightly to improve
        contrast while retaining good fidelity to the original
        shapes, since 1.0
  */
  Slight = 2,

  /**
      Hint outlines with medium strength
        giving a compromise between fidelity to the original shapes
        and contrast, since 1.0
  */
  Medium = 3,

  /**
      Hint outlines to maximize contrast, since 1.0
  */
  Full = 4,
}

/**
    Specifies how to render the endpoints of the path when stroking.
    
    The default line cap style is [cairo.types.LineCap.Butt].
*/
enum cairo_line_cap_t
{
  /**
      start(stop) the line exactly at the start(end) point (Since 1.0)
  */
  Butt = 0,

  /**
      use a round ending, the center of the circle is the end point (Since 1.0)
  */
  Round = 1,

  /**
      use squared ending, the center of the square is the end point (Since 1.0)
  */
  Square = 2,
}

/**
    Specifies how to render the junction of two lines when stroking.
    
    The default line join style is [cairo.types.LineJoin.Miter].
*/
enum cairo_line_join_t
{
  /**
      use a sharp (angled) corner, see
      [cairo.context.Context.setMiterLimit] (Since 1.0)
  */
  Miter = 0,

  /**
      use a rounded join, the center of the circle is the
      joint point (Since 1.0)
  */
  Round = 1,

  /**
      use a cut-off join, the join is cut off at half
      the line width from the joint point (Since 1.0)
  */
  Bevel = 2,
}

/**
    #cairo_operator_t is used to set the compositing operator for all cairo
    drawing operations.
    
    The default operator is [cairo.types.Operator.Over].
    
    The operators marked as <firstterm>unbounded</firstterm> modify their
    destination even outside of the mask layer (that is, their effect is not
    bound by the mask layer).  However, their effect can still be limited by
    way of clipping.
    
    To keep things simple, the operator descriptions here
    document the behavior for when both source and destination are either fully
    transparent or fully opaque.  The actual implementation works for
    translucent layers too.
    For a more detailed explanation of the effects of each operator, including
    the mathematical definitions, see
    <ulink url="https://cairographics.org/operators/">https://cairographics.org/operators/</ulink>.
*/
enum cairo_operator_t
{
  /**
      clear destination layer (bounded) (Since 1.0)
  */
  Clear = 0,

  /**
      replace destination layer (bounded) (Since 1.0)
  */
  Source = 1,

  /**
      draw source layer on top of destination layer
      (bounded) (Since 1.0)
  */
  Over = 2,

  /**
      draw source where there was destination content
      (unbounded) (Since 1.0)
  */
  In = 3,

  /**
      draw source where there was no destination
      content (unbounded) (Since 1.0)
  */
  Out = 4,

  /**
      draw source on top of destination content and
      only there (Since 1.0)
  */
  Atop = 5,

  /**
      ignore the source (Since 1.0)
  */
  Dest = 6,

  /**
      draw destination on top of source (Since 1.0)
  */
  DestOver = 7,

  /**
      leave destination only where there was
      source content (unbounded) (Since 1.0)
  */
  DestIn = 8,

  /**
      leave destination only where there was no
      source content (Since 1.0)
  */
  DestOut = 9,

  /**
      leave destination on top of source content
      and only there (unbounded) (Since 1.0)
  */
  DestAtop = 10,

  /**
      source and destination are shown where there is only
      one of them (Since 1.0)
  */
  Xor = 11,

  /**
      source and destination layers are accumulated (Since 1.0)
  */
  Add = 12,

  /**
      like over, but assuming source and dest are
      disjoint geometries (Since 1.0)
  */
  Saturate = 13,

  /**
      source and destination layers are multiplied.
      This causes the result to be at least as dark as the darker inputs. (Since 1.10)
  */
  Multiply = 14,

  /**
      source and destination are complemented and
      multiplied. This causes the result to be at least as light as the lighter
      inputs. (Since 1.10)
  */
  Screen = 15,

  /**
      multiplies or screens, depending on the
      lightness of the destination color. (Since 1.10)
  */
  Overlay = 16,

  /**
      replaces the destination with the source if it
      is darker, otherwise keeps the source. (Since 1.10)
  */
  Darken = 17,

  /**
      replaces the destination with the source if it
      is lighter, otherwise keeps the source. (Since 1.10)
  */
  Lighten = 18,

  /**
      brightens the destination color to reflect
      the source color. (Since 1.10)
  */
  ColorDodge = 19,

  /**
      darkens the destination color to reflect
      the source color. (Since 1.10)
  */
  ColorBurn = 20,

  /**
      Multiplies or screens, dependent on source
      color. (Since 1.10)
  */
  HardLight = 21,

  /**
      Darkens or lightens, dependent on source
      color. (Since 1.10)
  */
  SoftLight = 22,

  /**
      Takes the difference of the source and
      destination color. (Since 1.10)
  */
  Difference = 23,

  /**
      Produces an effect similar to difference, but
      with lower contrast. (Since 1.10)
  */
  Exclusion = 24,

  /**
      Creates a color with the hue of the source
      and the saturation and luminosity of the target. (Since 1.10)
  */
  HslHue = 25,

  /**
      Creates a color with the saturation
      of the source and the hue and luminosity of the target. Painting with
      this mode onto a gray area produces no change. (Since 1.10)
  */
  HslSaturation = 26,

  /**
      Creates a color with the hue and saturation
      of the source and the luminosity of the target. This preserves the gray
      levels of the target and is useful for coloring monochrome images or
      tinting color images. (Since 1.10)
  */
  HslColor = 27,

  /**
      Creates a color with the luminosity of
      the source and the hue and saturation of the target. This produces an
      inverse effect to @CAIRO_OPERATOR_HSL_COLOR. (Since 1.10)
  */
  HslLuminosity = 28,
}

/**
    #cairo_path_data_t is used to describe the type of one portion
    of a path when represented as a #cairo_path_t.
    See #cairo_path_data_t for details.
*/
enum cairo_path_data_type_t
{
  /**
      A move-to operation, since 1.0
  */
  MoveTo = 0,

  /**
      A line-to operation, since 1.0
  */
  LineTo = 1,

  /**
      A curve-to operation, since 1.0
  */
  CurveTo = 2,

  /**
      A close-path operation, since 1.0
  */
  ClosePath = 3,
}

/**
    #cairo_pattern_type_t is used to describe the type of a given pattern.
    
    The type of a pattern is determined by the function used to create
    it. The [cairo.global.patternCreateRgb] and [cairo.global.patternCreateRgba]
    functions create SOLID patterns. The remaining
    cairo_pattern_create<!-- --> functions map to pattern types in obvious
    ways.
    
    The pattern type can be queried with [cairo.pattern.Pattern.getPatternType]
    
    Most #cairo_pattern_t functions can be called with a pattern of any
    type, (though trying to change the extend or filter for a solid
    pattern will have no effect). A notable exception is
    [cairo.pattern.Pattern.addColorStopRgb] and
    [cairo.pattern.Pattern.addColorStopRgba] which must only be called with
    gradient patterns (either LINEAR or RADIAL). Otherwise the pattern
    will be shutdown and put into an error state.
    
    New entries may be added in future versions.
*/
enum cairo_pattern_type_t
{
  /**
      The pattern is a solid (uniform)
      color. It may be opaque or translucent, since 1.2.
  */
  Solid = 0,

  /**
      The pattern is a based on a surface (an image), since 1.2.
  */
  Surface = 1,

  /**
      The pattern is a linear gradient, since 1.2.
  */
  Linear = 2,

  /**
      The pattern is a radial gradient, since 1.2.
  */
  Radial = 3,

  /**
      The pattern is a mesh, since 1.12.
  */
  Mesh = 4,
}

/**
    #cairo_pdf_metadata_t is used by the
    [cairo.global.pdfSurfaceSetMetadata] function specify the metadata to set.
*/
enum cairo_pdf_metadata_t
{
  /**
      The document title (Since 1.16)
  */
  Title = 0,

  /**
      The document author (Since 1.16)
  */
  Author = 1,

  /**
      The document subject (Since 1.16)
  */
  Subject = 2,

  /**
      The document keywords (Since 1.16)
  */
  Keywords = 3,

  /**
      The document creator (Since 1.16)
  */
  Creator = 4,

  /**
      The document creation date (Since 1.16)
  */
  CreateDate = 5,

  /**
      The document modification date (Since 1.16)
  */
  ModDate = 6,
}

/**
    #cairo_pdf_outline_flags_t is used by the
    [cairo.global.pdfSurfaceAddOutline] function specify the attributes of
    an outline item. These flags may be bitwise-or'd to produce any
    combination of flags.
*/
enum cairo_pdf_outline_flags_t
{
  /**
      The outline item defaults to open in the PDF viewer (Since 1.16)
  */
  Open = 1,

  /**
      The outline item is displayed by the viewer in bold text (Since 1.16)
  */
  Bold = 2,

  /**
      The outline item is displayed by the viewer in italic text (Since 1.16)
  */
  Italic = 4,
}

/**
    #cairo_pdf_version_t is used to describe the version number of the PDF
    specification that a generated PDF file will conform to.
*/
enum cairo_pdf_version_t
{
  /**
      The version 1.4 of the PDF specification. (Since 1.10)
  */
  _4 = 0,

  /**
      The version 1.5 of the PDF specification. (Since 1.10)
  */
  _5 = 1,

  /**
      The version 1.6 of the PDF specification. (Since 1.18)
  */
  _6 = 2,

  /**
      The version 1.7 of the PDF specification. (Since 1.18)
  */
  _7 = 3,
}

/**
    #cairo_ps_level_t is used to describe the language level of the
    PostScript Language Reference that a generated PostScript file will
    conform to.
*/
enum cairo_ps_level_t
{
  /**
      The language level 2 of the PostScript specification. (Since 1.6)
  */
  _2 = 0,

  /**
      The language level 3 of the PostScript specification. (Since 1.6)
  */
  _3 = 1,
}

/**
    Used as the return value for [cairo.region.Region.containsRectangle].
*/
enum cairo_region_overlap_t
{
  /**
      The contents are entirely inside the region. (Since 1.10)
  */
  In = 0,

  /**
      The contents are entirely outside the region. (Since 1.10)
  */
  Out = 1,

  /**
      The contents are partially inside and
          partially outside the region. (Since 1.10)
  */
  Part = 2,
}

/**
    A set of script output variants.
*/
enum cairo_script_mode_t
{
  /**
      the output will be in readable text (default). (Since 1.12)
  */
  Ascii = 0,

  /**
      the output will use byte codes. (Since 1.12)
  */
  Binary = 1,
}

/**
    #cairo_status_t is used to indicate errors that can occur when
    using Cairo. In some cases it is returned directly by functions.
    but when using #cairo_t, the last error, if any, is stored in
    the context and can be retrieved with [cairo.context.Context.status].
    
    New entries may be added in future versions.  Use [cairo.global.statusToString]
    to get a human-readable representation of an error message.
*/
enum cairo_status_t
{
  /**
      no error has occurred (Since 1.0)
  */
  Success = 0,

  /**
      out of memory (Since 1.0)
  */
  NoMemory = 1,

  /**
      [cairo.context.Context.restore] called without matching [cairo.context.Context.save] (Since 1.0)
  */
  InvalidRestore = 2,

  /**
      no saved group to pop, i.e. [cairo.context.Context.popGroup] without matching [cairo.context.Context.pushGroup] (Since 1.0)
  */
  InvalidPopGroup = 3,

  /**
      no current point defined (Since 1.0)
  */
  NoCurrentPoint = 4,

  /**
      invalid matrix (not invertible) (Since 1.0)
  */
  InvalidMatrix = 5,

  /**
      invalid value for an input #cairo_status_t (Since 1.0)
  */
  InvalidStatus = 6,

  /**
      null pointer (Since 1.0)
  */
  NullPointer = 7,

  /**
      input string not valid UTF-8 (Since 1.0)
  */
  InvalidString = 8,

  /**
      input path data not valid (Since 1.0)
  */
  InvalidPathData = 9,

  /**
      error while reading from input stream (Since 1.0)
  */
  ReadError = 10,

  /**
      error while writing to output stream (Since 1.0)
  */
  WriteError = 11,

  /**
      target surface has been finished (Since 1.0)
  */
  SurfaceFinished = 12,

  /**
      the surface type is not appropriate for the operation (Since 1.0)
  */
  SurfaceTypeMismatch = 13,

  /**
      the pattern type is not appropriate for the operation (Since 1.0)
  */
  PatternTypeMismatch = 14,

  /**
      invalid value for an input #cairo_content_t (Since 1.0)
  */
  InvalidContent = 15,

  /**
      invalid value for an input #cairo_format_t (Since 1.0)
  */
  InvalidFormat = 16,

  /**
      invalid value for an input Visual* (Since 1.0)
  */
  InvalidVisual = 17,

  /**
      file not found (Since 1.0)
  */
  FileNotFound = 18,

  /**
      invalid value for a dash setting (Since 1.0)
  */
  InvalidDash = 19,

  /**
      invalid value for a DSC comment (Since 1.2)
  */
  InvalidDscComment = 20,

  /**
      invalid index passed to getter (Since 1.4)
  */
  InvalidIndex = 21,

  /**
      clip region not representable in desired format (Since 1.4)
  */
  ClipNotRepresentable = 22,

  /**
      error creating or writing to a temporary file (Since 1.6)
  */
  TempFileError = 23,

  /**
      invalid value for stride (Since 1.6)
  */
  InvalidStride = 24,

  /**
      the font type is not appropriate for the operation (Since 1.8)
  */
  FontTypeMismatch = 25,

  /**
      the user-font is immutable (Since 1.8)
  */
  UserFontImmutable = 26,

  /**
      error occurred in a user-font callback function (Since 1.8)
  */
  UserFontError = 27,

  /**
      negative number used where it is not allowed (Since 1.8)
  */
  NegativeCount = 28,

  /**
      input clusters do not represent the accompanying text and glyph array (Since 1.8)
  */
  InvalidClusters = 29,

  /**
      invalid value for an input #cairo_font_slant_t (Since 1.8)
  */
  InvalidSlant = 30,

  /**
      invalid value for an input #cairo_font_weight_t (Since 1.8)
  */
  InvalidWeight = 31,

  /**
      invalid value (typically too big) for the size of the input (surface, pattern, etc.) (Since 1.10)
  */
  InvalidSize = 32,

  /**
      user-font method not implemented (Since 1.10)
  */
  UserFontNotImplemented = 33,

  /**
      the device type is not appropriate for the operation (Since 1.10)
  */
  DeviceTypeMismatch = 34,

  /**
      an operation to the device caused an unspecified error (Since 1.10)
  */
  DeviceError = 35,

  /**
      a mesh pattern
        construction operation was used outside of a
        [cairo.global.meshPatternBeginPatch]/[cairo.global.meshPatternEndPatch]
        pair (Since 1.12)
  */
  InvalidMeshConstruction = 36,

  /**
      target device has been finished (Since 1.12)
  */
  DeviceFinished = 37,

  /**
      [cairo.types.MIME_TYPE_JBIG2_GLOBAL_ID] has been used on at least one image
        but no image provided [cairo.types.MIME_TYPE_JBIG2_GLOBAL] (Since 1.14)
  */
  Jbig2GlobalMissing = 38,

  /**
      error occurred in libpng while reading from or writing to a PNG file (Since 1.16)
  */
  PngError = 39,

  /**
      error occurred in libfreetype (Since 1.16)
  */
  FreetypeError = 40,

  /**
      this is a special value indicating the number of
        status values defined in this enumeration.  When using this value, note
        that the version of cairo at run-time may have additional status values
        defined than the value of this symbol at compile-time. (Since 1.10)
  */
  LastStatus = 45,

  /**
      error occurred in the Windows Graphics Device Interface (Since 1.16)
  */
  Win32GdiError = 41,
}

/**
    The subpixel order specifies the order of color elements within
    each pixel on the display device when rendering with an
    antialiasing mode of [cairo.types.Antialias.Subpixel].
*/
enum cairo_subpixel_order_t
{
  /**
      Use the default subpixel order for
        for the target device, since 1.0
  */
  Default = 0,

  /**
      Subpixel elements are arranged horizontally
        with red at the left, since 1.0
  */
  Rgb = 1,

  /**
      Subpixel elements are arranged horizontally
        with blue at the left, since 1.0
  */
  Bgr = 2,

  /**
      Subpixel elements are arranged vertically
        with red at the top, since 1.0
  */
  Vrgb = 3,

  /**
      Subpixel elements are arranged vertically
        with blue at the top, since 1.0
  */
  Vbgr = 4,
}

/**
    Whether operations should be recorded.
*/
enum cairo_surface_observer_mode_t
{
  /**
      no recording is done
  */
  Normal = 0,

  /**
      operations are recorded
  */
  RecordOperations = 1,
}

/**
    #cairo_surface_type_t is used to describe the type of a given
    surface. The surface types are also known as "backends" or "surface
    backends" within cairo.
    
    The type of a surface is determined by the function used to create
    it, which will generally be of the form
    <function>cairo_<emphasis>type</emphasis>_surface_create(<!-- -->)</function>,
    (though see [cairo.surface.Surface.createSimilar] as well).
    
    The surface type can be queried with [cairo.surface.Surface.getSurfaceType]
    
    The various #cairo_surface_t functions can be used with surfaces of
    any type, but some backends also provide type-specific functions
    that must only be called with a surface of the appropriate
    type. These functions have names that begin with
    <literal>cairo_<emphasis>type</emphasis>_surface</literal> such as [cairo.global.imageSurfaceGetWidth].
    
    The behavior of calling a type-specific function with a surface of
    the wrong type is undefined.
    
    New entries may be added in future versions.
*/
enum cairo_surface_type_t
{
  /**
      The surface is of type image, since 1.2
  */
  Image = 0,

  /**
      The surface is of type pdf, since 1.2
  */
  Pdf = 1,

  /**
      The surface is of type ps, since 1.2
  */
  Ps = 2,

  /**
      The surface is of type xlib, since 1.2
  */
  Xlib = 3,

  /**
      The surface is of type xcb, since 1.2
  */
  Xcb = 4,

  /**
      The surface is of type glitz, since 1.2, deprecated 1.18
        (glitz support have been removed, this surface type will never be set by cairo)
  */
  Glitz = 5,

  /**
      The surface is of type quartz, since 1.2
  */
  Quartz = 6,

  /**
      The surface is of type win32, since 1.2
  */
  Win32 = 7,

  /**
      The surface is of type beos, since 1.2, deprecated 1.18
        (beos support have been removed, this surface type will never be set by cairo)
  */
  Beos = 8,

  /**
      The surface is of type directfb, since 1.2, deprecated 1.18
        (directfb support have been removed, this surface type will never be set by cairo)
  */
  Directfb = 9,

  /**
      The surface is of type svg, since 1.2
  */
  Svg = 10,

  /**
      The surface is of type os2, since 1.4, deprecated 1.18
        (os2 support have been removed, this surface type will never be set by cairo)
  */
  Os2 = 11,

  /**
      The surface is a win32 printing surface, since 1.6
  */
  Win32Printing = 12,

  /**
      The surface is of type quartz_image, since 1.6
  */
  QuartzImage = 13,

  /**
      The surface is of type script, since 1.10
  */
  Script = 14,

  /**
      The surface is of type Qt, since 1.10, deprecated 1.18
        (Ot support have been removed, this surface type will never be set by cairo)
  */
  Qt = 15,

  /**
      The surface is of type recording, since 1.10
  */
  Recording = 16,

  /**
      The surface is a OpenVG surface, since 1.10, deprecated 1.18
        (OpenVG support have been removed, this surface type will never be set by cairo)
  */
  Vg = 17,

  /**
      The surface is of type OpenGL, since 1.10, deprecated 1.18
        (OpenGL support have been removed, this surface type will never be set by cairo)
  */
  Gl = 18,

  /**
      The surface is of type Direct Render Manager, since 1.10, deprecated 1.18
        (DRM support have been removed, this surface type will never be set by cairo)
  */
  Drm = 19,

  /**
      The surface is of type 'tee' (a multiplexing surface), since 1.10
  */
  Tee = 20,

  /**
      The surface is of type XML (for debugging), since 1.10
  */
  Xml = 21,

  /**
      The surface is of type Skia, since 1.10, deprecated 1.18
        (Skia support have been removed, this surface type will never be set by cairo)
  */
  Skia = 22,
}

/**
    #cairo_svg_unit_t is used to describe the units valid for coordinates and
    lengths in the SVG specification.
    
    See also:
    $(LIST
      * [SVG Units](https://www.w3.org/TR/SVG/coords.html#Units)
      * [SVG Types](https://www.w3.org/TR/SVG/types.html#DataTypeLength)
      * [CSS Length](https://www.w3.org/TR/css-values-3/#lengths)
    )
*/
enum cairo_svg_unit_t
{
  /**
      User unit, a value in the current coordinate system.
        If used in the root element for the initial coordinate systems it
        corresponds to pixels. (Since 1.16)
  */
  User = 0,

  /**
      The size of the element's font. (Since 1.16)
  */
  Em = 1,

  /**
      The x-height of the element’s font. (Since 1.16)
  */
  Ex = 2,

  /**
      Pixels (1px = 1/96th of 1in). (Since 1.16)
  */
  Px = 3,

  /**
      Inches (1in = 2.54cm = 96px). (Since 1.16)
  */
  In = 4,

  /**
      Centimeters (1cm = 96px/2.54). (Since 1.16)
  */
  Cm = 5,

  /**
      Millimeters (1mm = 1/10th of 1cm). (Since 1.16)
  */
  Mm = 6,

  /**
      Points (1pt = 1/72th of 1in). (Since 1.16)
  */
  Pt = 7,

  /**
      Picas (1pc = 1/6th of 1in). (Since 1.16)
  */
  Pc = 8,

  /**
      Percent, a value that is some fraction of another
        reference value. (Since 1.16)
  */
  Percent = 9,
}

/**
    #cairo_svg_version_t is used to describe the version number of the SVG
    specification that a generated SVG file will conform to.
*/
enum cairo_svg_version_t
{
  /**
      The version 1.1 of the SVG specification. (Since 1.2)
  */
  _1 = 0,

  /**
      The version 1.2 of the SVG specification. (Since 1.2)
  */
  _2 = 1,
}

/**
    Specifies properties of a text cluster mapping.
*/
enum cairo_text_cluster_flags_t
{
  /**
      The clusters in the cluster array
      map to glyphs in the glyph array from end to start. (Since 1.8)
  */
  Backward = 1,
}

/**
    A #cairo_t contains the current state of the rendering device,
    including coordinates of yet to be drawn shapes.
    
    Cairo contexts, as #cairo_t objects are named, are central to
    cairo and all drawing with cairo is always done to a #cairo_t
    object.
    
    Memory management of #cairo_t is done with
    [cairo.global.reference] and [cairo.global.destroy].
*/
struct cairo_t;

/**
    A #cairo_device_t represents the driver interface for drawing
    operations to a #cairo_surface_t.  There are different subtypes of
    #cairo_device_t for different drawing backends.
    
    The type of a device can be queried with [cairo.device.Device.getDeviceType].
    
    Memory management of #cairo_device_t is done with
    [cairo.device.Device.reference] and [cairo.device.Device.destroy].
*/
struct cairo_device_t;

/**
    The #cairo_font_extents_t structure stores metric information for
    a font. Values are given in the current user-space coordinate
    system.
    
    Because font metrics are in user-space coordinates, they are
    mostly, but not entirely, independent of the current transformation
    matrix. If you call <literal>cairo_scale(cr, 2.0, 2.0)</literal>,
    text will be drawn twice as big, but the reported text extents will
    not be doubled. They will change slightly due to hinting (so you
    can't assume that metrics are independent of the transformation
    matrix), but otherwise will remain unchanged.
*/
struct cairo_font_extents_t
{
  /**
      the distance that the font extends above the baseline.
               Note that this is not always exactly equal to the maximum
               of the extents of all the glyphs in the font, but rather
               is picked to express the font designer's intent as to
               how the font should align with elements above it.
  */
  double ascent;

  /**
      the distance that the font extends below the baseline.
                This value is positive for typical fonts that include
                portions below the baseline. Note that this is not always
                exactly equal to the maximum of the extents of all the
                glyphs in the font, but rather is picked to express the
                font designer's intent as to how the font should
                align with elements below it.
  */
  double descent;

  /**
      the recommended vertical distance between baselines when
               setting consecutive lines of text with the font. This
               is greater than @ascent+@descent by a
               quantity known as the <firstterm>line spacing</firstterm>
               or <firstterm>external leading</firstterm>. When space
               is at a premium, most fonts can be set with only
               a distance of @ascent+@descent between lines.
  */
  double height;

  /**
      the maximum distance in the X direction that
              the origin is advanced for any glyph in the font.
  */
  double maxXAdvance;

  /**
      the maximum distance in the Y direction that
              the origin is advanced for any glyph in the font.
              This will be zero for normal fonts used for horizontal
              writing. (The scripts of East Asia are sometimes written
              vertically.)
  */
  double maxYAdvance;
}

/**
    A #cairo_font_face_t specifies all aspects of a font other
    than the size or font matrix (a font matrix is used to distort
    a font by shearing it or scaling it unequally in the two
    directions) . A font face can be set on a #cairo_t by using
    [cairo.context.Context.setFontFace]; the size and font matrix are set with
    [cairo.context.Context.setFontSize] and [cairo.context.Context.setFontMatrix].
    
    There are various types of font faces, depending on the
    <firstterm>font backend</firstterm> they use. The type of a
    font face can be queried using [cairo.font_face.FontFace.getFontType].
    
    Memory management of #cairo_font_face_t is done with
    [cairo.font_face.FontFace.reference] and [cairo.font_face.FontFace.destroy].
*/
struct cairo_font_face_t;

/**
    An opaque structure holding all options that are used when
    rendering fonts.
    
    Individual features of a #cairo_font_options_t can be set or
    accessed using functions named
    <function>cairo_font_options_set_<emphasis>feature_name</emphasis>()</function> and
    <function>cairo_font_options_get_<emphasis>feature_name</emphasis>()</function>, like
    [cairo.font_options.FontOptions.setAntialias] and
    [cairo.font_options.FontOptions.getAntialias].
    
    New features may be added to a #cairo_font_options_t in the
    future.  For this reason, [cairo.font_options.FontOptions.copy],
    [cairo.font_options.FontOptions.equal], [cairo.font_options.FontOptions.merge], and
    [cairo.font_options.FontOptions.hash] should be used to copy, check
    for equality, merge, or compute a hash value of
    #cairo_font_options_t objects.
*/
struct cairo_font_options_t;

/**
    The #cairo_glyph_t structure holds information about a single glyph
    when drawing or measuring text. A font is (in simple terms) a
    collection of shapes used to draw text. A glyph is one of these
    shapes. There can be multiple glyphs for a single character
    (alternates to be used in different contexts, for example), or a
    glyph can be a <firstterm>ligature</firstterm> of multiple
    characters. Cairo doesn't expose any way of converting input text
    into glyphs, so in order to use the Cairo interfaces that take
    arrays of glyphs, you must directly access the appropriate
    underlying font system.
    
    Note that the offsets given by @x and @y are not cumulative. When
    drawing or measuring text, each glyph is individually positioned
    with respect to the overall origin
*/
struct cairo_glyph_t
{
  /**
      glyph index in the font. The exact interpretation of the
           glyph index depends on the font technology being used.
  */
  gulong index;

  /**
      the offset in the X direction between the origin used for
          drawing or measuring the string and the origin of this glyph.
  */
  double x;

  /**
      the offset in the Y direction between the origin used for
          drawing or measuring the string and the origin of this glyph.
  */
  double y;
}

/**
    A #cairo_matrix_t holds an affine transformation, such as a scale,
    rotation, shear, or a combination of those. The transformation of
    a point (x, y) is given by:
    <programlisting>
        x_new = xx * x + xy * y + x0;
        y_new = yx * x + yy * y + y0;
    </programlisting>
*/
struct cairo_matrix_t
{
  /**
      xx component of the affine transformation
  */
  double xx;

  /**
      yx component of the affine transformation
  */
  double yx;

  /**
      xy component of the affine transformation
  */
  double xy;

  /**
      yy component of the affine transformation
  */
  double yy;

  /**
      X translation component of the affine transformation
  */
  double x0;

  /**
      Y translation component of the affine transformation
  */
  double y0;
}

/**
    A data structure for holding a path. This data structure serves as
    the return value for [cairo.context.Context.copyPath] and
    [cairo.context.Context.copyPathFlat] as well the input value for
    [cairo.context.Context.appendPath].
    
    See #cairo_path_data_t for hints on how to iterate over the
    actual data within the path.
    
    The num_data member gives the number of elements in the data
    array. This number is larger than the number of independent path
    portions (defined in #cairo_path_data_type_t), since the data
    includes both headers and coordinates for each portion.
*/
struct cairo_path_t
{
  /**
      the current error status
  */
  cairo_status_t status;

  /**
      the elements in the path
  */
  cairo_path_data_t* data;

  /**
      the number of elements in the data array
  */
  int numData;
}

/**
    #cairo_path_data_t is used to represent the path data inside a
    #cairo_path_t.
    
    The data structure is designed to try to balance the demands of
    efficiency and ease-of-use. A path is represented as an array of
    #cairo_path_data_t, which is a union of headers and points.
    
    Each portion of the path is represented by one or more elements in
    the array, (one header followed by 0 or more points). The length
    value of the header is the number of array elements for the current
    portion including the header, (ie. length == 1 + # of points), and
    where the number of points for each element type is as follows:
    
    <programlisting>
        [cairo.types.PathDataType.MoveTo]:     1 point
        [cairo.types.PathDataType.LineTo]:     1 point
        [cairo.types.PathDataType.CurveTo]:    3 points
        [cairo.types.PathDataType.ClosePath]:  0 points
    </programlisting>
    
    The semantics and ordering of the coordinate values are consistent
    with [cairo.context.Context.moveTo], [cairo.context.Context.lineTo], [cairo.context.Context.curveTo], and
    [cairo.context.Context.closePath].
    
    Here is sample code for iterating through a #cairo_path_t:
    
    <informalexample><programlisting>
         int i;
         cairo_path_t *path;
         cairo_path_data_t *data;
    &nbsp;
         path = cairo_copy_path (cr);
    &nbsp;
         for (i=0; i < path->num_data; i += path->data[i].header.length) {
             data = &amp;path->data[i];
             switch (data->header.type) {
             case CAIRO_PATH_MOVE_TO:
                 do_move_to_things (data[1].point.x, data[1].point.y);
                 break;
             case CAIRO_PATH_LINE_TO:
                 do_line_to_things (data[1].point.x, data[1].point.y);
                 break;
             case CAIRO_PATH_CURVE_TO:
                 do_curve_to_things (data[1].point.x, data[1].point.y,
                                     data[2].point.x, data[2].point.y,
                                     data[3].point.x, data[3].point.y);
                 break;
             case CAIRO_PATH_CLOSE_PATH:
                 do_close_path_things ();
                 break;
             }
         }
         cairo_path_destroy (path);
    </programlisting></informalexample>
    
    As of cairo 1.4, cairo does not mind if there are more elements in
    a portion of the path than needed.  Such elements can be used by
    users of the cairo API to hold extra values in the path data
    structure.  For this reason, it is recommended that applications
    always use <literal>data->header.length</literal> to
    iterate over the path data, instead of hardcoding the number of
    elements for each element type.
*/
union cairo_path_data_t
{
  /** */
  /** */
  struct HeaderType
  {
    /** */
    cairo_path_data_type_t type;

    /** */
    int length;
  }

  HeaderType header;

  /** */
  /** */
  struct PointType
  {
    /** */
    double x;

    /** */
    double y;
  }

  PointType point;
}

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
struct cairo_pattern_t;

/**
    A data structure for holding a rectangle.
*/
struct cairo_rectangle_t
{
  /**
      X coordinate of the left side of the rectangle
  */
  double x;

  /**
      Y coordinate of the top side of the rectangle
  */
  double y;

  /**
      width of the rectangle
  */
  double width;

  /**
      height of the rectangle
  */
  double height;
}

/**
    A data structure for holding a rectangle with integer coordinates.
*/
struct cairo_rectangle_int_t
{
  /**
      X coordinate of the left side of the rectangle
  */
  int x;

  /**
      Y coordinate of the top side of the rectangle
  */
  int y;

  /**
      width of the rectangle
  */
  int width;

  /**
      height of the rectangle
  */
  int height;
}

/**
    A data structure for holding a dynamically allocated
    array of rectangles.
*/
struct cairo_rectangle_list_t
{
  /**
      Error status of the rectangle list
  */
  cairo_status_t status;

  /**
      Array containing the rectangles
  */
  cairo_rectangle_t* rectangles;

  /**
      Number of rectangles in this list
  */
  int numRectangles;
}

/**
    A #cairo_region_t represents a set of integer-aligned rectangles.
    
    It allows set-theoretical operations like [cairo.region.Region.union_] and
    [cairo.region.Region.intersect] to be performed on them.
    
    Memory management of #cairo_region_t is done with
    [cairo.region.Region.reference] and [cairo.region.Region.destroy].
*/
struct cairo_region_t;

/**
    A #cairo_scaled_font_t is a font scaled to a particular size and device
    resolution. A #cairo_scaled_font_t is most useful for low-level font
    usage where a library or application wants to cache a reference
    to a scaled font to speed up the computation of metrics.
    
    There are various types of scaled fonts, depending on the
    <firstterm>font backend</firstterm> they use. The type of a
    scaled font can be queried using [cairo.scaled_font.ScaledFont.getFontType].
    
    Memory management of #cairo_scaled_font_t is done with
    [cairo.scaled_font.ScaledFont.reference] and [cairo.scaled_font.ScaledFont.destroy].
*/
struct cairo_scaled_font_t;

/**
    A #cairo_surface_t represents an image, either as the destination
    of a drawing operation or as source when drawing onto another
    surface.  To draw to a #cairo_surface_t, create a cairo context
    with the surface as the target, using [cairo.global.create].
    
    There are different subtypes of #cairo_surface_t for
    different drawing backends; for example, [cairo.global.imageSurfaceCreate]
    creates a bitmap image in memory.
    The type of a surface can be queried with [cairo.surface.Surface.getSurfaceType].
    
    The initial contents of a surface after creation depend upon the manner
    of its creation. If cairo creates the surface and backing storage for
    the user, it will be initially cleared; for example,
    [cairo.global.imageSurfaceCreate] and [cairo.surface.Surface.createSimilar].
    Alternatively, if the user passes in a reference to some backing storage
    and asks cairo to wrap that in a #cairo_surface_t, then the contents are
    not modified; for example, [cairo.global.imageSurfaceCreateForData] and
    cairo_xlib_surface_create().
    
    Memory management of #cairo_surface_t is done with
    [cairo.surface.Surface.reference] and [cairo.surface.Surface.destroy].
*/
struct cairo_surface_t;

/**
    The #cairo_text_cluster_t structure holds information about a single
    <firstterm>text cluster</firstterm>.  A text cluster is a minimal
    mapping of some glyphs corresponding to some UTF-8 text.
    
    For a cluster to be valid, both @num_bytes and @num_glyphs should
    be non-negative, and at least one should be non-zero.
    Note that clusters with zero glyphs are not as well supported as
    normal clusters.  For example, PDF rendering applications typically
    ignore those clusters when PDF text is being selected.
    
    See [cairo.context.Context.showTextGlyphs] for how clusters are used in advanced
    text operations.
*/
struct cairo_text_cluster_t
{
  /**
      the number of bytes of UTF-8 text covered by cluster
  */
  int numBytes;

  /**
      the number of glyphs covered by cluster
  */
  int numGlyphs;
}

/**
    The #cairo_text_extents_t structure stores the extents of a single
    glyph or a string of glyphs in user-space coordinates. Because text
    extents are in user-space coordinates, they are mostly, but not
    entirely, independent of the current transformation matrix. If you call
    <literal>cairo_scale(cr, 2.0, 2.0)</literal>, text will
    be drawn twice as big, but the reported text extents will not be
    doubled. They will change slightly due to hinting (so you can't
    assume that metrics are independent of the transformation matrix),
    but otherwise will remain unchanged.
*/
struct cairo_text_extents_t
{
  /**
      the horizontal distance from the origin to the
        leftmost part of the glyphs as drawn. Positive if the
        glyphs lie entirely to the right of the origin.
  */
  double xBearing;

  /**
      the vertical distance from the origin to the
        topmost part of the glyphs as drawn. Positive only if the
        glyphs lie completely below the origin; will usually be
        negative.
  */
  double yBearing;

  /**
      width of the glyphs as drawn
  */
  double width;

  /**
      height of the glyphs as drawn
  */
  double height;

  /**
      distance to advance in the X direction
         after drawing these glyphs
  */
  double xAdvance;

  /**
      distance to advance in the Y direction
        after drawing these glyphs. Will typically be zero except
        for vertical text layout as found in East-Asian languages.
  */
  double yAdvance;
}

/**
    #cairo_user_data_key_t is used for attaching user data to cairo
    data structures.  The actual contents of the struct is never used,
    and there is no need to initialize the object; only the unique
    address of a #cairo_data_key_t object is used.  Typically, you
    would just use the address of a static #cairo_data_key_t object.
*/
struct cairo_user_data_key_t
{
  /**
      not used; ignore.
  */
  int unused;
}

alias extern(C) void function(void* data) cairo_destroy_func_t;

alias extern(C) cairo_surface_t* function(cairo_pattern_t* pattern, void* callbackData, cairo_surface_t* target, const(cairo_rectangle_int_t)* extents) cairo_raster_source_acquire_func_t;

alias extern(C) cairo_status_t function(cairo_pattern_t* pattern, void* callbackData, const(cairo_pattern_t)* other) cairo_raster_source_copy_func_t;

alias extern(C) void function(cairo_pattern_t* pattern, void* callbackData) cairo_raster_source_finish_func_t;

alias extern(C) void function(cairo_pattern_t* pattern, void* callbackData, cairo_surface_t* surface) cairo_raster_source_release_func_t;

alias extern(C) cairo_status_t function(cairo_pattern_t* pattern, void* callbackData) cairo_raster_source_snapshot_func_t;

alias extern(C) cairo_status_t function(void* closure, ubyte* data, uint length) cairo_read_func_t;

alias extern(C) void function(cairo_surface_t* observer, cairo_surface_t* target, void* data) cairo_surface_observer_callback_t;

alias extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont, cairo_t* cr, cairo_font_extents_t* extents) cairo_user_scaled_font_init_func_t;

alias extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont, gulong glyph, cairo_t* cr, cairo_text_extents_t* extents) cairo_user_scaled_font_render_glyph_func_t;

alias extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont, const(char)* utf8, int utf8Len, cairo_glyph_t** glyphs, int* numGlyphs, cairo_text_cluster_t** clusters, int* numClusters, cairo_text_cluster_flags_t* clusterFlags) cairo_user_scaled_font_text_to_glyphs_func_t;

alias extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont, gulong unicode, gulong* glyphIndex) cairo_user_scaled_font_unicode_to_glyph_func_t;

alias extern(C) cairo_status_t function(void* closure, const(ubyte)* data, uint length) cairo_write_func_t;

