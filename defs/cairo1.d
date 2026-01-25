//!gir cairo-1.0
//!info description "D binding for the Cairo library - 2D graphics library with support for multiple output devices"
//!info homepage https://cairographics.org
//!info docs https://www.kymorphia.com/gid/cairo.html
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
