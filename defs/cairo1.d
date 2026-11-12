//!gir cairo-1.0
//!info description "D binding for the Cairo library - 2D graphics library with support for multiple output devices"
//!info homepage https://cairographics.org
//!info docs https://www.kymorphia.com/gid/gid~cairo1/
//!info capi https://www.cairographics.org/manual/

//# Add libcairo.so.2 to shared library list
//!set repository.namespace[cairo][shared-library] libcairo-gobject.so.2,libcairo.so.2

//!set record[Device].method[get_type][name] get_device_type
//!set record[FontFace].method[get_type][name] get_font_type
//!set record[Pattern].method[get_type][name] get_pattern_type
//!set record[ScaledFont].method[get_type][name] get_font_type
//!set record[Surface].method[get_type][name] get_surface_type

//# Set basic parameters to out
//!set callback[UserScaledFontUnicodeToGlyphFunc].parameters.parameter[glyph_index][direction] out
//!set function[pdf_get_versions].parameters.parameter[versions][direction] out
//!set function[pdf_get_versions].parameters.parameter[num_versions][direction] out
//!set function[ps_get_levels].parameters.parameter[levels][direction] out
//!set function[ps_get_levels].parameters.parameter[num_levels][direction] out
//!set function[svg_get_versions].parameters.parameter[versions][direction] out
//!set function[svg_get_versions].parameters.parameter[num_versions][direction] out
//!set record[Context].method[clip_extents].parameters.parameter[x1][direction] out
//!set record[Context].method[clip_extents].parameters.parameter[y1][direction] out
//!set record[Context].method[clip_extents].parameters.parameter[x2][direction] out
//!set record[Context].method[clip_extents].parameters.parameter[y2][direction] out
//!set record[Context].method[device_to_user].parameters.parameter[x][direction] out
//!set record[Context].method[device_to_user].parameters.parameter[y][direction] out
//!set record[Context].method[device_to_user_distance].parameters.parameter[dx][direction] out
//!set record[Context].method[device_to_user_distance].parameters.parameter[dy][direction] out
//!set record[Context].method[fill_extents].parameters.parameter[x1][direction] out
//!set record[Context].method[fill_extents].parameters.parameter[y1][direction] out
//!set record[Context].method[fill_extents].parameters.parameter[x2][direction] out
//!set record[Context].method[fill_extents].parameters.parameter[y2][direction] out
//!set record[Context].method[font_extents].parameters.parameter[extents][direction] out
//!set record[Context].method[get_current_point].parameters.parameter[x][direction] out
//!set record[Context].method[get_current_point].parameters.parameter[y][direction] out
//!set record[Context].method[get_dash].parameters.parameter[dashes][direction] out
//!set record[Context].method[get_dash].parameters.parameter[offset][direction] out
//!set record[Context].method[get_font_matrix].parameters.parameter[matrix][direction] out
//!set record[Context].method[get_matrix].parameters.parameter[matrix][direction] out
//!set record[Context].method[glyph_extents].parameters.parameter[extents][direction] out
//!set record[Context].method[path_extents].parameters.parameter[x1][direction] out
//!set record[Context].method[path_extents].parameters.parameter[y1][direction] out
//!set record[Context].method[path_extents].parameters.parameter[x2][direction] out
//!set record[Context].method[path_extents].parameters.parameter[y2][direction] out
//!set record[Context].method[stroke_extents].parameters.parameter[x1][direction] out
//!set record[Context].method[stroke_extents].parameters.parameter[y1][direction] out
//!set record[Context].method[stroke_extents].parameters.parameter[x2][direction] out
//!set record[Context].method[stroke_extents].parameters.parameter[y2][direction] out
//!set record[Context].method[text_extents].parameters.parameter[extents][direction] out
//!set record[Context].method[user_to_device].parameters.parameter[x][direction] out
//!set record[Context].method[user_to_device].parameters.parameter[y][direction] out
//!set record[Context].method[user_to_device_distance].parameters.parameter[dx][direction] out
//!set record[Context].method[user_to_device_distance].parameters.parameter[dy][direction] out
//!set record[FontOptions].method[get_custom_palette_color].parameters.parameter[red][direction] out
//!set record[FontOptions].method[get_custom_palette_color].parameters.parameter[green][direction] out
//!set record[FontOptions].method[get_custom_palette_color].parameters.parameter[blue][direction] out
//!set record[FontOptions].method[get_custom_palette_color].parameters.parameter[alpha][direction] out
//!set function[mesh_pattern_get_control_point].parameters.parameter[x][direction] out
//!set function[mesh_pattern_get_control_point].parameters.parameter[y][direction] out
//!set function[mesh_pattern_get_corner_color_rgba].parameters.parameter[red][direction] out
//!set function[mesh_pattern_get_corner_color_rgba].parameters.parameter[green][direction] out
//!set function[mesh_pattern_get_corner_color_rgba].parameters.parameter[blue][direction] out
//!set function[mesh_pattern_get_corner_color_rgba].parameters.parameter[alpha][direction] out
//!set function[mesh_pattern_get_patch_count].parameters.parameter[count][direction] out
//!set function[recording_surface_get_extents].parameters.parameter[extents][direction] out
//!set function[recording_surface_ink_extents].parameters.parameter[x0][direction] out
//!set function[recording_surface_ink_extents].parameters.parameter[y0][direction] out
//!set function[recording_surface_ink_extents].parameters.parameter[width][direction] out
//!set function[recording_surface_ink_extents].parameters.parameter[height][direction] out
//!set record[Matrix].method[transform_distance].parameters.parameter[dx][direction] out
//!set record[Matrix].method[transform_distance].parameters.parameter[dy][direction] out
//!set record[Matrix].method[transform_point].parameters.parameter[x][direction] out
//!set record[Matrix].method[transform_point].parameters.parameter[y][direction] out
//!set record[Pattern].method[get_color_stop_count].parameters.parameter[count][direction] out
//!set record[Pattern].method[get_color_stop_rgba].parameters.parameter[offset][direction] out
//!set record[Pattern].method[get_color_stop_rgba].parameters.parameter[red][direction] out
//!set record[Pattern].method[get_color_stop_rgba].parameters.parameter[green][direction] out
//!set record[Pattern].method[get_color_stop_rgba].parameters.parameter[blue][direction] out
//!set record[Pattern].method[get_color_stop_rgba].parameters.parameter[alpha][direction] out
//!set record[Pattern].method[get_linear_points].parameters.parameter[x0][direction] out
//!set record[Pattern].method[get_linear_points].parameters.parameter[y0][direction] out
//!set record[Pattern].method[get_linear_points].parameters.parameter[x1][direction] out
//!set record[Pattern].method[get_linear_points].parameters.parameter[y1][direction] out
//!set record[Pattern].method[get_matrix].parameters.parameter[matrix][direction] out
//!set record[Pattern].method[get_radial_circles].parameters.parameter[x0][direction] out
//!set record[Pattern].method[get_radial_circles].parameters.parameter[y0][direction] out
//!set record[Pattern].method[get_radial_circles].parameters.parameter[r0][direction] out
//!set record[Pattern].method[get_radial_circles].parameters.parameter[x1][direction] out
//!set record[Pattern].method[get_radial_circles].parameters.parameter[y1][direction] out
//!set record[Pattern].method[get_radial_circles].parameters.parameter[r1][direction] out
//!set record[Pattern].method[get_rgba].parameters.parameter[red][direction] out
//!set record[Pattern].method[get_rgba].parameters.parameter[green][direction] out
//!set record[Pattern].method[get_rgba].parameters.parameter[blue][direction] out
//!set record[Pattern].method[get_rgba].parameters.parameter[alpha][direction] out
//!set record[Pattern].method[get_surface].parameters.parameter[surface][direction] out
//!set record[Region].method[get_extents].parameters.parameter[extents][direction] out
//!set record[Region].method[get_rectangle].parameters.parameter[rectangle][direction] out
//!set record[ScaledFont].method[extents].parameters.parameter[extents][direction] out
//!set record[ScaledFont].method[get_ctm].parameters.parameter[ctm][direction] out
//!set record[ScaledFont].method[get_font_matrix].parameters.parameter[font_matrix][direction] out
//!set record[ScaledFont].method[get_scale_matrix].parameters.parameter[scale_matrix][direction] out
//!set record[ScaledFont].method[glyph_extents].parameters.parameter[extents][direction] out
//!set record[ScaledFont].method[text_extents].parameters.parameter[extents][direction] out
//!set record[Surface].method[get_device_offset].parameters.parameter[x_offset][direction] out
//!set record[Surface].method[get_device_offset].parameters.parameter[y_offset][direction] out
//!set record[Surface].method[get_device_scale].parameters.parameter[x_scale][direction] out
//!set record[Surface].method[get_device_scale].parameters.parameter[y_scale][direction] out
//!set record[Surface].method[get_fallback_resolution].parameters.parameter[x_pixels_per_inch][direction] out
//!set record[Surface].method[get_fallback_resolution].parameters.parameter[y_pixels_per_inch][direction] out
//!set record[Surface].method[get_mime_data].parameters.parameter[data][direction] out
//!set record[Surface].method[get_mime_data].parameters.parameter[length][direction] out

//# Fix array information
//!set callback[ReadFunc].parameters.parameter[data].type '<array length="2" zero-terminated="0" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set callback[WriteFunc].parameters.parameter[data].type '<array length="2" zero-terminated="0" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Context].method[set_dash].parameters.parameter[dashes].type '<array length="1" zero-terminated="0" c:type="const double*"><type name="double" c:type="double"/></array>'
//!set function[pdf_get_versions].parameters.parameter[versions].type '<array length="1" zero-terminated="0" c:type="const cairo_pdf_version_t **"><type name="PdfVersion" c:type="cairo_pdf_version_t"/></array>'
//!set function[ps_get_levels].parameters.parameter[levels].type '<array length="1" zero-terminated="0" c:type="const cairo_ps_level_t **"><type name="PsLevel" c:type="cairo_ps_level_t"/></array>'
//!set function[svg_get_versions].parameters.parameter[versions].type '<array length="1" zero-terminated="0" c:type="const cairo_svg_version_t **"><type name="SvgVersion" c:type="cairo_ps_level_t"/></array>'
//!set record[Surface].method[get_mime_data].parameters.parameter[data].type '<array length="2" zero-terminated="0" c:type="const guint8**"><type name="guint8" c:type="guint8"/></array>'
//!set record[Surface].method[set_mime_data].parameters.parameter[data].type '<array length="2" zero-terminated="0" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'

//# Glyph and cluster arrays
//!set record[Context].method[glyph_extents].parameters.parameter[glyphs].type '<array length="1" zero-terminated="0" c:type="const cairo_glyph_t*"><type name="Glyph" c:type="cairo_glyph_t"/></array>'
//!set record[Context].method[glyph_path].parameters.parameter[glyphs].type '<array length="1" zero-terminated="0" c:type="const cairo_glyph_t*"><type name="Glyph" c:type="cairo_glyph_t"/></array>'
//!set record[Context].method[show_glyphs].parameters.parameter[glyphs].type '<array length="1" zero-terminated="0" c:type="const cairo_glyph_t*"><type name="Glyph" c:type="cairo_glyph_t"/></array>'
//!set record[Context].method[show_text_glyphs].parameters.parameter[glyphs].type '<array length="3" zero-terminated="0" c:type="const cairo_glyph_t*"><type name="Glyph" c:type="cairo_glyph_t"/></array>'
//!set record[Context].method[show_text_glyphs].parameters.parameter[clusters].type '<array length="5" zero-terminated="0" c:type="const cairo_text_cluster_t*"><type name="TextCluster" c:type="cairo_text_cluster_t"/></array>'
//!set record[ScaledFont].method[glyph_extents].parameters.parameter[glyphs].type '<array length="1" zero-terminated="0" c:type="const cairo_glyph_t*"><type name="Glyph" c:type="cairo_glyph_t"/></array>'

//# Use array of characters with a length, to remove the length and optimize
//!set function[script_write_comment].parameters.parameter[comment].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'

//# Designate parameters as closure data
//!set callback[ReadFunc].parameters.parameter[closure][closure] 0
//!set callback[WriteFunc].parameters.parameter[closure][closure] 0

//# Designate closure data parameter
//!set function[image_surface_create_from_png_stream].parameters.parameter[read_func][closure] 1
//!set function[pdf_surface_create_for_stream].parameters.parameter[write_func][closure] 1
//!set function[ps_surface_create_for_stream].parameters.parameter[write_func][closure] 1
//!set function[script_create_for_stream].parameters.parameter[write_func][closure] 1
//!set function[svg_surface_create_for_stream].parameters.parameter[write_func][closure] 1
//!set record[Device].method[observer_print].parameters.parameter[write_func][closure] 1
//!set record[Surface].method[observer_print].parameters.parameter[write_func][closure] 1
//!set record[Surface].method[set_mime_data].parameters.parameter[destroy][closure] 4
//!set record[Surface].method[write_to_png_stream].parameters.parameter[write_func][closure] 1

//# string-length-param (Strings with array length parameters)
//!set callback[UserScaledFontTextToGlyphsFunc].parameters.parameter[utf8].type '<array length="2" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set record[Context].method[show_text_glyphs].parameters.parameter[utf8].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set record[ScaledFont].method[text_to_glyphs].parameters.parameter[utf8].type '<array length="3" c:type="const char*"><type name="char" c:type="char"/></array>'

//# Fix transfer of returned objects owned by cairo (GIR has full, double unref crash)
//!set record[Context].method[get_font_face].return-value[][transfer-ownership] none
//!set record[Context].method[get_group_target].return-value[][transfer-ownership] none
//!set record[Context].method[get_scaled_font].return-value[][transfer-ownership] none
//!set record[Context].method[get_source].return-value[][transfer-ownership] none
//!set record[Context].method[get_target].return-value[][transfer-ownership] none
//!set record[ScaledFont].method[get_font_face].return-value[][transfer-ownership] none
//!set record[Surface].method[get_device].return-value[][transfer-ownership] none
//!set function[tee_surface_index].return-value[][transfer-ownership] none
//!set function[user_scaled_font_get_foreground_marker].return-value[][transfer-ownership] none
//!set function[user_scaled_font_get_foreground_source].return-value[][transfer-ownership] none

//# Hand-written below: D pixel data must be kept alive by the surface (D memory can't be handed to C without an owner)
//!set function[image_surface_create_for_data][ignore] 1

//# Hand-written below: Inout allocated glyph/cluster arrays with inout counts, freed with cairo_glyph_free/cairo_text_cluster_free
//!set record[ScaledFont].method[text_to_glyphs][ignore] 1

//# Disable: Callback filling inout allocated glyph/cluster arrays with inout counts
//!set callback[UserScaledFontTextToGlyphsFunc][disable] 1

//# Ignore: Glyph and cluster array allocation, D arrays are used instead
//!set function[glyph_allocate][ignore] 1
//!set function[text_cluster_allocate][ignore] 1
//!set record[Glyph].method[free][ignore] 1
//!set record[TextCluster].method[free][ignore] 1

//# Make read-only (no write support): Arrays allocated and freed by cairo (cairo_path_destroy/cairo_rectangle_list_destroy)
//!set record[Path].field[data][writable] 0
//!set record[RectangleList].field[rectangles][writable] 0

//!class global pre

/**
    Creates an image surface for the provided pixel data.
    The surface keeps a reference to data, preventing it from being garbage collected until the surface is destroyed
    (also when the surface is still referenced from C after the D object is gone), so data does not need to be kept
    by the caller. The initial contents of data are used as the initial image contents and drawing to the surface
    modifies data. Call [cairo.surface.Surface.flush] before accessing data directly after drawing, and
    [cairo.surface.Surface.markDirty] after modifying it.

    The stride may be larger than width times the bytes per pixel to provide alignment for each pixel and row, use
    [cairo.global.formatStrideForWidth] to get a valid stride for format and width.

    Params:
      data = pixel data buffer, must be at least stride * height bytes long
      format = the format of pixels in the buffer
      width = the width of the image to be stored in the buffer
      height = the height of the image to be stored in the buffer
      stride = the number of bytes between the start of rows in the buffer as allocated
    Returns: the newly created surface. This function never returns null, in case of an error such as an invalid
      stride or data being too short for stride * height a "nil" surface is returned whose
      [cairo.surface.Surface.status] is [cairo.types.Status.InvalidStride] (or another error status like
      [cairo.types.Status.InvalidFormat], [cairo.types.Status.InvalidSize] or [cairo.types.Status.NoMemory]).
*/
cairo.surface.Surface imageSurfaceCreateForData(ubyte[] data, cairo.types.Format format, int width, int height, int stride) nothrow
{
  import core.memory : GC;

  __gshared cairo_user_data_key_t dataKey; // Address used as the surface user data key for the data owner

  // A negative stride is rejected by cairo with an invalid stride error surface, used if data is too short
  if (stride < 0 || height < 0 || data.length < cast(size_t)stride * height)
    stride = -1;

  auto _cretval = cairo_image_surface_create_for_data(stride >= 0 ? data.ptr : null, format, width, height, stride);

  if (cairo_surface_status(_cretval) == cairo_status_t.Success)
  { // Separate GC allocated owner per surface (a root on data itself would be shared between surfaces using it)
    auto owner = cast(ubyte[]*)GC.malloc((ubyte[]).sizeof, GC.BlkAttr.NO_MOVE);
    *owner = data;
    ptrFreezeGC(owner);

    auto status = cairo_surface_set_user_data(_cretval, &dataKey, owner, cast(cairo_destroy_func_t)&thawPtrDestroyFunc);

    if (status != cairo_status_t.Success)
    { // Failed to attach the owner (out of memory), finish the surface so that cairo no longer accesses data
      ptrThawGC(owner);
      cairo_surface_finish(_cretval);
    }
  }

  return new cairo.surface.Surface(cast(void*)_cretval, Yes.Take);
}

//!class ScaledFont pre
import cairo.text_cluster;

//!class ScaledFont

  /**
      Converts UTF-8 text to an array of glyphs, with cluster mapping, that can be used to render later using this
      scaled font (with [cairo.context.Context.showTextGlyphs] for example).
      Params:
        x = X position to place first glyph
        y = Y position to place first glyph
        utf8 = a string of text encoded in UTF-8
        glyphs = Output array of glyphs (empty on error)
        clusters = Output array of cluster mapping information (empty on error)
        clusterFlags = Output cluster mapping flags
      Returns: [cairo.types.Status.Success] upon success, or an error status if the input values are wrong or if
        conversion failed. If the scaled font is in an error state, its status is returned.
  */
  cairo.types.Status textToGlyphs(double x, double y, string utf8, out cairo.glyph.Glyph[] glyphs, out cairo.text_cluster.TextCluster[] clusters, out cairo.types.TextClusterFlags clusterFlags) nothrow
  {
    import cairo.glyph : Glyph;
    import cairo.text_cluster : TextCluster;

    cairo_glyph_t* _glyphs; // Allocated by cairo (initial null)
    int _numGlyphs;
    cairo_text_cluster_t* _clusters;
    int _numClusters;
    auto _retval = cairo_scaled_font_text_to_glyphs(cast(cairo_scaled_font_t*)this._cPtr, x, y, utf8.length > 0 ? utf8.ptr : "".ptr, cast(int)utf8.length, &_glyphs, &_numGlyphs, &_clusters, &_numClusters, &clusterFlags);

    if (_retval == cairo_status_t.Success)
    {
      glyphs = (cast(Glyph*)_glyphs)[0 .. _numGlyphs].dup;
      clusters = (cast(TextCluster*)_clusters)[0 .. _numClusters].dup;
    }

    cairo_glyph_free(_glyphs); // Pointers are reset to the initial null by cairo on error
    cairo_text_cluster_free(_clusters);
    return _retval;
  }

  /**
      Converts UTF-8 text to an array of glyphs, without cluster mapping, that can be used to render later using this
      scaled font (with [cairo.context.Context.showGlyphs] for example).
      Params:
        x = X position to place first glyph
        y = Y position to place first glyph
        utf8 = a string of text encoded in UTF-8
        glyphs = Output array of glyphs (empty on error)
      Returns: [cairo.types.Status.Success] upon success, or an error status if the input values are wrong or if
        conversion failed. If the scaled font is in an error state, its status is returned.
  */
  cairo.types.Status textToGlyphs(double x, double y, string utf8, out cairo.glyph.Glyph[] glyphs) nothrow
  {
    import cairo.glyph : Glyph;

    cairo_glyph_t* _glyphs; // Allocated by cairo (initial null)
    int _numGlyphs;
    auto _retval = cairo_scaled_font_text_to_glyphs(cast(cairo_scaled_font_t*)this._cPtr, x, y, utf8.length > 0 ? utf8.ptr : "".ptr, cast(int)utf8.length, &_glyphs, &_numGlyphs, null, null, null);

    if (_retval == cairo_status_t.Success)
      glyphs = (cast(Glyph*)_glyphs)[0 .. _numGlyphs].dup;

    cairo_glyph_free(_glyphs); // Pointer is reset to the initial null by cairo on error
    return _retval;
  }
