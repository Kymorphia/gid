/// D types for harfbuzz0 library
module harfbuzz.types;

import gid.gid;
import harfbuzz.blob;
import harfbuzz.buffer;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.color_line;
import harfbuzz.draw_funcs;
import harfbuzz.draw_state;
import harfbuzz.face;
import harfbuzz.font;
import harfbuzz.paint_funcs;
import harfbuzz.unicode_funcs;


// Aliases

/** */
alias Bool = hb_bool_t;

/** */
alias Codepoint = hb_codepoint_t;

/** */
alias Color = hb_color_t;

/** */
alias FontGetFontHExtentsFunc = harfbuzz.types.FontGetFontExtentsFunc;

/** */
alias FontGetFontVExtentsFunc = harfbuzz.types.FontGetFontExtentsFunc;

/** */
alias FontGetGlyphHAdvanceFunc = harfbuzz.types.FontGetGlyphAdvanceFunc;

/** */
alias FontGetGlyphHKerningFunc = harfbuzz.types.FontGetGlyphKerningFunc;

/** */
alias FontGetGlyphHOriginFunc = harfbuzz.types.FontGetGlyphOriginFunc;

/** */
alias FontGetGlyphVAdvanceFunc = harfbuzz.types.FontGetGlyphAdvanceFunc;

/** */
alias FontGetGlyphVKerningFunc = harfbuzz.types.FontGetGlyphKerningFunc;

/** */
alias FontGetGlyphVOriginFunc = harfbuzz.types.FontGetGlyphOriginFunc;

/** */
alias Mask = hb_mask_t;

/** */
alias OtNameId = hb_ot_name_id_t;

/** */
alias Position = hb_position_t;

/** */
alias Tag = hb_tag_t;

// Enums

/** */
alias AatLayoutFeatureSelector = hb_aat_layout_feature_selector_t;

/** */
alias AatLayoutFeatureType = hb_aat_layout_feature_type_t;

/** */
alias BufferClusterLevel = hb_buffer_cluster_level_t;

/** */
alias BufferContentType = hb_buffer_content_type_t;

/** */
alias BufferDiffFlags = hb_buffer_diff_flags_t;

/** */
alias BufferFlags = hb_buffer_flags_t;

/** */
alias BufferSerializeFlags = hb_buffer_serialize_flags_t;

/** */
alias BufferSerializeFormat = hb_buffer_serialize_format_t;

/** */
alias Direction = hb_direction_t;

/** */
alias GlyphFlags = hb_glyph_flags_t;

/** */
alias MemoryMode = hb_memory_mode_t;

/** */
alias OtColorPaletteFlags = hb_ot_color_palette_flags_t;

/** */
alias OtLayoutBaselineTag = hb_ot_layout_baseline_tag_t;

/** */
alias OtLayoutGlyphClass = hb_ot_layout_glyph_class_t;

/** */
alias OtMathConstant = hb_ot_math_constant_t;

/** */
alias OtMathGlyphPartFlags = hb_ot_math_glyph_part_flags_t;

/** */
alias OtMathKern = hb_ot_math_kern_t;

/** */
alias OtMetaTag = hb_ot_meta_tag_t;

/** */
alias OtMetricsTag = hb_ot_metrics_tag_t;

/** */
alias OtNameIdPredefined = hb_ot_name_id_predefined_t;

/** */
alias OtVarAxisFlags = hb_ot_var_axis_flags_t;

/** */
alias PaintCompositeMode = hb_paint_composite_mode_t;

/** */
alias PaintExtend = hb_paint_extend_t;

/** */
alias Script = hb_script_t;

/** */
alias StyleTag = hb_style_tag_t;

/** */
alias UnicodeCombiningClass = hb_unicode_combining_class_t;

/** */
alias UnicodeGeneralCategory = hb_unicode_general_category_t;

// Structs

/** */
alias AatLayoutFeatureSelectorInfo = hb_aat_layout_feature_selector_info_t;

/** */
alias ColorStop = hb_color_stop_t;

/** */
alias FontExtents = hb_font_extents_t;

/** */
alias GlyphExtents = hb_glyph_extents_t;

/** */
alias Language = hb_language_t;

/** */
alias OtColorLayer = hb_ot_color_layer_t;

/** */
alias OtMathGlyphPart = hb_ot_math_glyph_part_t;

/** */
alias OtMathGlyphVariant = hb_ot_math_glyph_variant_t;

/** */
alias OtMathKernEntry = hb_ot_math_kern_entry_t;

/** */
alias OtVarAxis = hb_ot_var_axis_t;

/** */
alias OtVarAxisInfo = hb_ot_var_axis_info_t;

/** */
alias UserDataKey = hb_user_data_key_t;

/** */
alias VarInt = hb_var_int_t;

/** */
alias VarNum = hb_var_num_t;

// Callbacks

/**
    A callback method for #hb_buffer_t. The method gets called with the
    #hb_buffer_t it was set on, the #hb_font_t the buffer is shaped with and a
    message describing what step of the shaping process will be performed.
    Returning `false` from this method will skip this shaping step and move to
    the next one.

    Params:
      buffer = An #hb_buffer_t to work upon
      font = The #hb_font_t the buffer is shaped with
      message = `NULL`-terminated message passed to the function
    Returns: `true` to perform the shaping step, `false` to skip it.
*/
alias BufferMessageFunc = harfbuzz.types.Bool delegate(harfbuzz.buffer.Buffer buffer, harfbuzz.font.Font font, string message);

/**
    A virtual method for the #hb_color_line_t to fetch color stops.

    Params:
      colorLine = a #hb_color_line_t object
      colorLineData = the data accompanying color_line
      start = the index of the first color stop to return
      colorStops = Array of #hb_color_stop_t to populate
    Returns: the total number of color stops in color_line
*/
alias ColorLineGetColorStopsFunc = uint delegate(harfbuzz.color_line.ColorLine colorLine, void* colorLineData, uint start, ref harfbuzz.types.ColorStop[] colorStops);

/**
    A virtual method for the hb_color_line_t to fetches the extend mode.

    Params:
      colorLine = a #hb_color_line_t object
      colorLineData = the data accompanying color_line
    Returns: the extend mode of color_line
*/
alias ColorLineGetExtendFunc = harfbuzz.types.PaintExtend delegate(harfbuzz.color_line.ColorLine colorLine, void* colorLineData);

/**
    A virtual method for destroy user-data callbacks.
*/
alias DestroyFunc = void delegate();

/**
    A virtual method for the #hb_draw_funcs_t to perform a "close-path" draw
    operation.

    Params:
      dfuncs = draw functions object
      drawData = The data accompanying the draw functions in [harfbuzz.global.fontDrawGlyph]
      st = current draw state
*/
alias DrawClosePathFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st);

/**
    A virtual method for the #hb_draw_funcs_t to perform a "cubic-to" draw
    operation.

    Params:
      dfuncs = draw functions object
      drawData = The data accompanying the draw functions in [harfbuzz.global.fontDrawGlyph]
      st = current draw state
      control1X = X component of first control point
      control1Y = Y component of first control point
      control2X = X component of second control point
      control2Y = Y component of second control point
      toX = X component of target point
      toY = Y component of target point
*/
alias DrawCubicToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float control1X, float control1Y, float control2X, float control2Y, float toX, float toY);

/**
    A virtual method for the #hb_draw_funcs_t to perform a "line-to" draw
    operation.

    Params:
      dfuncs = draw functions object
      drawData = The data accompanying the draw functions in [harfbuzz.global.fontDrawGlyph]
      st = current draw state
      toX = X component of target point
      toY = Y component of target point
*/
alias DrawLineToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float toX, float toY);

/**
    A virtual method for the #hb_draw_funcs_t to perform a "move-to" draw
    operation.

    Params:
      dfuncs = draw functions object
      drawData = The data accompanying the draw functions in [harfbuzz.global.fontDrawGlyph]
      st = current draw state
      toX = X component of target point
      toY = Y component of target point
*/
alias DrawMoveToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float toX, float toY);

/**
    A virtual method for the #hb_draw_funcs_t to perform a "quadratic-to" draw
    operation.

    Params:
      dfuncs = draw functions object
      drawData = The data accompanying the draw functions in [harfbuzz.global.fontDrawGlyph]
      st = current draw state
      controlX = X component of control point
      controlY = Y component of control point
      toX = X component of target point
      toY = Y component of target point
*/
alias DrawQuadraticToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float controlX, float controlY, float toX, float toY);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      glyph = The glyph ID to query
      drawFuncs = The draw functions to send the shape data to
      drawData = The data accompanying the draw functions
*/
alias FontDrawGlyphFunc = void delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, harfbuzz.draw_funcs.DrawFuncs drawFuncs, void* drawData);

/**
    This method should retrieve the extents for a font.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      extents = The font extents retrieved
    Returns: 
*/
alias FontGetFontExtentsFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, out harfbuzz.types.FontExtents extents);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the advance for a specified glyph. The
    method must return an #hb_position_t.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      glyph = The glyph ID to query
    Returns: The advance of glyph within font
*/
alias FontGetGlyphAdvanceFunc = harfbuzz.types.Position delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the (X,Y) coordinates (in font units) for a
    specified contour point in a glyph. Each coordinate must be returned as
    an #hb_position_t output parameter.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      glyph = The glyph ID to query
      pointIndex = The contour-point index to query
      x = The X value retrieved for the contour point
      y = The Y value retrieved for the contour point
    Returns: `true` if data found, `false` otherwise
*/
alias FontGetGlyphContourPointFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, uint pointIndex, out harfbuzz.types.Position x, out harfbuzz.types.Position y);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the extents for a specified glyph. Extents must be
    returned in an #hb_glyph_extents output parameter.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      glyph = The glyph ID to query
      extents = The #hb_glyph_extents_t retrieved
    Returns: `true` if data found, `false` otherwise
*/
alias FontGetGlyphExtentsFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, out harfbuzz.types.GlyphExtents extents);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the glyph ID that corresponds to a glyph-name
    string.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      name = The name string to query
      glyph = The glyph ID retrieved
    Returns: `true` if data found, `false` otherwise
*/
alias FontGetGlyphFromNameFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, char[] name, out harfbuzz.types.Codepoint glyph);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the glyph ID for a specified Unicode code point
    font, with an optional variation selector.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      unicode = The Unicode code point to query
      variationSelector = The  variation-selector code point to query
      glyph = The glyph ID retrieved
    Returns: `true` if data found, `false` otherwise
*/
alias FontGetGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint unicode, harfbuzz.types.Codepoint variationSelector, out harfbuzz.types.Codepoint glyph);

/**
    This method should retrieve the kerning-adjustment value for a glyph-pair in
    the specified font, for horizontal text segments.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      firstGlyph = The glyph ID of the first glyph in the glyph pair
      secondGlyph = The glyph ID of the second glyph in the glyph pair
    Returns: 
*/
alias FontGetGlyphKerningFunc = harfbuzz.types.Position delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint firstGlyph, harfbuzz.types.Codepoint secondGlyph);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the glyph name that corresponds to a
    glyph ID. The name should be returned in a string output parameter.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      glyph = The glyph ID to query
      name = Name string retrieved for the glyph ID
    Returns: `true` if data found, `false` otherwise
*/
alias FontGetGlyphNameFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, ref char[] name);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the (X,Y) coordinates (in font units) of the
    origin for a glyph. Each coordinate must be returned in an #hb_position_t
    output parameter.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      glyph = The glyph ID to query
      x = The X coordinate of the origin
      y = The Y coordinate of the origin
    Returns: `true` if data found, `false` otherwise
*/
alias FontGetGlyphOriginFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, out harfbuzz.types.Position x, out harfbuzz.types.Position y);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      glyph = The glyph ID to query
      drawFuncs = The draw functions to send the shape data to
      drawData = The data accompanying the draw functions

    Deprecated: Use #hb_font_draw_glyph_func_t instead
*/
alias FontGetGlyphShapeFunc = void delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, harfbuzz.draw_funcs.DrawFuncs drawFuncs, void* drawData);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the nominal glyph ID for a specified Unicode code
    point. Glyph IDs must be returned in a #hb_codepoint_t output parameter.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      unicode = The Unicode code point to query
      glyph = The glyph ID retrieved
    Returns: `true` if data found, `false` otherwise
*/
alias FontGetNominalGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint unicode, out harfbuzz.types.Codepoint glyph);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the glyph ID for a specified Unicode code point
    followed by a specified Variation Selector code point. Glyph IDs must be
    returned in a #hb_codepoint_t output parameter.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      unicode = The Unicode code point to query
      variationSelector = The  variation-selector code point to query
      glyph = The glyph ID retrieved
    Returns: `true` if data found, `false` otherwise
*/
alias FontGetVariationGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint unicode, harfbuzz.types.Codepoint variationSelector, out harfbuzz.types.Codepoint glyph);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.

    Params:
      font = #hb_font_t to work upon
      fontData = font user data pointer
      glyph = The glyph ID to query
      paintFuncs = The paint functions to use
      paintData = The data accompanying the paint functions
      paletteIndex = The color palette to use
      foreground = The foreground color
*/
alias FontPaintGlyphFunc = void delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, harfbuzz.paint_funcs.PaintFuncs paintFuncs, void* paintData, uint paletteIndex, harfbuzz.types.Color foreground);

/**
    A virtual method for the #hb_paint_funcs_t to paint a
    color everywhere within the current clip.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      isForeground = whether the color is the foreground
      color = The color to use, unpremultiplied
*/
alias PaintColorFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Bool isForeground, harfbuzz.types.Color color);

/**
    A virtual method for the #hb_paint_funcs_t to render a color glyph by glyph index.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      glyph = the glyph ID
      font = the font
    Returns: true if the glyph was painted, false otherwise.
*/
alias PaintColorGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Codepoint glyph, harfbuzz.font.Font font);

/**
    A virtual method for the #hb_paint_funcs_t to fetch a color from the custom
    color palette.
    
    Custom palette colors override the colors from the fonts selected color
    palette. It is not necessary to override all palette entries; for entries
    that should be taken from the font palette, return `false`.
    
    This function might get called multiple times, but the custom palette is
    expected to remain unchanged for duration of a [harfbuzz.global.fontPaintGlyph] call.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      colorIndex = the color index
      color = fetched color
    Returns: `true` if found, `false` otherwise
*/
alias PaintCustomPaletteColorFunc = harfbuzz.types.Bool delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, uint colorIndex, out harfbuzz.types.Color color);

/**
    A virtual method for the #hb_paint_funcs_t to paint a glyph image.
    
    This method is called for glyphs with image blobs in the CBDT,
    sbix or SVG tables. The format identifies the kind of data that
    is contained in image. Possible values include #HB_PAINT_IMAGE_FORMAT_PNG,
    #HB_PAINT_IMAGE_FORMAT_SVG and #HB_PAINT_IMAGE_FORMAT_BGRA.
    
    The image dimensions and glyph extents are provided if available,
    and should be used to size and position the image.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      image = the image data
      width = width of the raster image in pixels, or 0
      height = height of the raster image in pixels, or 0
      format = the image format as a tag
      slant = the synthetic slant ratio to be applied to the image during rendering
      extents = glyph extents for desired rendering
    Returns: Whether the operation was successful.
*/
alias PaintImageFunc = harfbuzz.types.Bool delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.blob.Blob image, uint width, uint height, harfbuzz.types.Tag format, float slant, harfbuzz.types.GlyphExtents extents);

/**
    A virtual method for the #hb_paint_funcs_t to paint a linear
    gradient everywhere within the current clip.
    
    The color_line object contains information about the colors of the gradients.
    It is only valid for the duration of the callback, you cannot keep it around.
    
    The coordinates of the points are interpreted according
    to the current transform.
    
    See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
    section for details on how the points define the direction
    of the gradient, and how to interpret the color_line.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      colorLine = Color information for the gradient
      x0 = X coordinate of the first point
      y0 = Y coordinate of the first point
      x1 = X coordinate of the second point
      y1 = Y coordinate of the second point
      x2 = X coordinate of the third point
      y2 = Y coordinate of the third point
*/
alias PaintLinearGradientFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.color_line.ColorLine colorLine, float x0, float y0, float x1, float y1, float x2, float y2);

/**
    A virtual method for the #hb_paint_funcs_t to undo
    the effect of a prior call to the #hb_paint_funcs_push_clip_glyph_func_t
    or #hb_paint_funcs_push_clip_rectangle_func_t vfuncs.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
*/
alias PaintPopClipFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData);

/**
    A virtual method for the #hb_paint_funcs_t to undo
    the effect of a prior call to the #hb_paint_funcs_push_group_func_t
    vfunc.
    
    This call stops the redirection to the intermediate surface,
    and then composites it on the previous surface, using the
    compositing mode passed to this call.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      mode = the compositing mode to use
*/
alias PaintPopGroupFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.PaintCompositeMode mode);

/**
    A virtual method for the #hb_paint_funcs_t to undo
    the effect of a prior call to the #hb_paint_funcs_push_transform_func_t
    vfunc.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
*/
alias PaintPopTransformFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData);

/**
    A virtual method for the #hb_paint_funcs_t to clip
    subsequent paint calls to the outline of a glyph.
    
    The coordinates of the glyph outline are interpreted according
    to the current transform.
    
    This clip is applied in addition to the current clip,
    and remains in effect until a matching call to
    the #hb_paint_funcs_pop_clip_func_t vfunc.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      glyph = the glyph ID
      font = the font
*/
alias PaintPushClipGlyphFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Codepoint glyph, harfbuzz.font.Font font);

/**
    A virtual method for the #hb_paint_funcs_t to clip
    subsequent paint calls to a rectangle.
    
    The coordinates of the rectangle are interpreted according
    to the current transform.
    
    This clip is applied in addition to the current clip,
    and remains in effect until a matching call to
    the #hb_paint_funcs_pop_clip_func_t vfunc.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      xmin = min X for the rectangle
      ymin = min Y for the rectangle
      xmax = max X for the rectangle
      ymax = max Y for the rectangle
*/
alias PaintPushClipRectangleFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, float xmin, float ymin, float xmax, float ymax);

/**
    A virtual method for the #hb_paint_funcs_t to use
    an intermediate surface for subsequent paint calls.
    
    The drawing will be redirected to an intermediate surface
    until a matching call to the #hb_paint_funcs_pop_group_func_t
    vfunc.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
*/
alias PaintPushGroupFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData);

/**
    A virtual method for the #hb_paint_funcs_t to apply
    a transform to subsequent paint calls.
    
    This transform is applied after the current transform,
    and remains in effect until a matching call to
    the #hb_paint_funcs_pop_transform_func_t vfunc.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      xx = xx component of the transform matrix
      yx = yx component of the transform matrix
      xy = xy component of the transform matrix
      yy = yy component of the transform matrix
      dx = dx component of the transform matrix
      dy = dy component of the transform matrix
*/
alias PaintPushTransformFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, float xx, float yx, float xy, float yy, float dx, float dy);

/**
    A virtual method for the #hb_paint_funcs_t to paint a radial
    gradient everywhere within the current clip.
    
    The color_line object contains information about the colors of the gradients.
    It is only valid for the duration of the callback, you cannot keep it around.
    
    The coordinates of the points are interpreted according
    to the current transform.
    
    See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
    section for details on how the points define the direction
    of the gradient, and how to interpret the color_line.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      colorLine = Color information for the gradient
      x0 = X coordinate of the first circle's center
      y0 = Y coordinate of the first circle's center
      r0 = radius of the first circle
      x1 = X coordinate of the second circle's center
      y1 = Y coordinate of the second circle's center
      r1 = radius of the second circle
*/
alias PaintRadialGradientFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.color_line.ColorLine colorLine, float x0, float y0, float r0, float x1, float y1, float r1);

/**
    A virtual method for the #hb_paint_funcs_t to paint a sweep
    gradient everywhere within the current clip.
    
    The color_line object contains information about the colors of the gradients.
    It is only valid for the duration of the callback, you cannot keep it around.
    
    The coordinates of the points are interpreted according
    to the current transform.
    
    See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
    section for details on how the points define the direction
    of the gradient, and how to interpret the color_line.

    Params:
      funcs = paint functions object
      paintData = The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
      colorLine = Color information for the gradient
      x0 = X coordinate of the circle's center
      y0 = Y coordinate of the circle's center
      startAngle = the start angle, in radians
      endAngle = the end angle, in radians
*/
alias PaintSweepGradientFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.color_line.ColorLine colorLine, float x0, float y0, float startAngle, float endAngle);

/**
    Callback function for [harfbuzz.global.faceCreateForTables].

    Params:
      face = an #hb_face_t to reference table for
      tag = the tag of the table to reference
    Returns: A pointer to the tag table within face
*/
alias ReferenceTableFunc = harfbuzz.blob.Blob delegate(harfbuzz.face.Face face, harfbuzz.types.Tag tag);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
    
    This method should retrieve the Canonical Combining Class (ccc)
    property for a specified Unicode code point.

    Params:
      ufuncs = A Unicode-functions structure
      unicode = The code point to query
    Returns: The #hb_unicode_combining_class_t of unicode
*/
alias UnicodeCombiningClassFunc = harfbuzz.types.UnicodeCombiningClass delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
    
    This method should compose a sequence of two input Unicode code
    points by canonical equivalence, returning the composed code
    point in a #hb_codepoint_t output parameter (if successful).
    The method must return an #hb_bool_t indicating the success
    of the composition.

    Params:
      ufuncs = A Unicode-functions structure
      a = The first code point to compose
      b = The second code point to compose
      ab = The composed code point
    Returns: `true` is `a`,`b` composed, `false` otherwise
*/
alias UnicodeComposeFunc = harfbuzz.types.Bool delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint a, harfbuzz.types.Codepoint b, out harfbuzz.types.Codepoint ab);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
    
    This method should decompose an input Unicode code point,
    returning the two decomposed code points in #hb_codepoint_t
    output parameters (if successful). The method must return an
    #hb_bool_t indicating the success of the composition.

    Params:
      ufuncs = A Unicode-functions structure
      ab = The code point to decompose
      a = The first decomposed code point
      b = The second decomposed code point
    Returns: `true` if `a`b decomposed, `false` otherwise
*/
alias UnicodeDecomposeFunc = harfbuzz.types.Bool delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint ab, out harfbuzz.types.Codepoint a, out harfbuzz.types.Codepoint b);

/**
    A virtual method for the #hb_unicode_funcs_t structure.

    Params:
      ufuncs = A Unicode-functions structure
      unicode = The code point to query
    Returns: 
*/
alias UnicodeEastasianWidthFunc = uint delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
    
    This method should retrieve the General Category property for
    a specified Unicode code point.

    Params:
      ufuncs = A Unicode-functions structure
      unicode = The code point to query
    Returns: The #hb_unicode_general_category_t of unicode
*/
alias UnicodeGeneralCategoryFunc = harfbuzz.types.UnicodeGeneralCategory delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
    
    This method should retrieve the Bi-Directional Mirroring Glyph
    code point for a specified Unicode code point.
    
    <note>Note: If a code point does not have a specified
    Bi-Directional Mirroring Glyph defined, the method should
    return the original code point.</note>

    Params:
      ufuncs = A Unicode-functions structure
      unicode = The code point to query
    Returns: The #hb_codepoint_t of the Mirroring Glyph for unicode
*/
alias UnicodeMirroringFunc = harfbuzz.types.Codepoint delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
    
    This method should retrieve the Script property for a
    specified Unicode code point.

    Params:
      ufuncs = A Unicode-functions structure
      unicode = The code point to query
    Returns: The #hb_script_t of unicode
*/
alias UnicodeScriptFunc = harfbuzz.types.Script delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
    Used when getting or setting AAT feature selectors. Indicates that
    there is no selector index corresponding to the selector of interest.
*/
enum AAT_LAYOUT_NO_SELECTOR_INDEX = 65535;

/**
    The default code point for replacing invalid characters in a given encoding.
    Set to U+FFFD REPLACEMENT CHARACTER.
*/
enum BUFFER_REPLACEMENT_CODEPOINT_DEFAULT = 65533;

/**
    Unused #hb_codepoint_t value.
*/
enum CODEPOINT_INVALID = 4294967295;

/**
    Special setting for #hb_feature_t.start to apply the feature from the start
    of the buffer.
*/
enum FEATURE_GLOBAL_START = 0;

/**
    Constant signifying that a font does not have any
    named-instance index set.  This is the default of
    a font.
*/
enum FONT_NO_VAR_NAMED_INSTANCE = 4294967295;

/**
    An unset #hb_language_t.
*/
enum LANGUAGE_INVALID = 0;

/**
    Special value for language index indicating default or unsupported language.
*/
enum OT_LAYOUT_DEFAULT_LANGUAGE_INDEX = 65535;

/**
    Special value for feature index indicating unsupported feature.
*/
enum OT_LAYOUT_NO_FEATURE_INDEX = 65535;

/**
    Special value for script index indicating unsupported script.
*/
enum OT_LAYOUT_NO_SCRIPT_INDEX = 65535;

/**
    Special value for variations index indicating unsupported variation.
*/
enum OT_LAYOUT_NO_VARIATIONS_INDEX = 4294967295;

/**
    Maximum number of OpenType tags that can correspond to a give #hb_language_t.
*/
enum OT_MAX_TAGS_PER_LANGUAGE = 3;

/**
    Maximum number of OpenType tags that can correspond to a give #hb_script_t.
*/
enum OT_MAX_TAGS_PER_SCRIPT = 3;

/**
    Do not use.
*/
enum OT_VAR_NO_AXIS_INDEX = 4294967295;

/**
    [Tibetan]
*/
enum UNICODE_COMBINING_CLASS_CCC133 = 133;

/**
    Maximum valid Unicode code point.
*/
enum UNICODE_MAX = 1114111;

/**
    See Unicode 6.1 for details on the maximum decomposition length.
*/
enum UNICODE_MAX_DECOMPOSITION_LEN = 19;

/** */
enum VERSION_MAJOR = 8;

/** */
enum VERSION_MICRO = 0;

/** */
enum VERSION_MINOR = 3;

/** */
enum VERSION_STRING = "8.3.0";
