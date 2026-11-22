/// C functions for cairo1 library
module gid.cairo1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.cairo1.c.types;
static import gid.cairo1.c._gidlib_cairo;
public import gid.freetype2.c.types;
public import gid.gobject2.c.types;

private immutable LIBS = ["cairo-gobject_2", "cairo_2"];

private __gshared immutable(bool)* _gidLibMarker = &gid.cairo1.c._gidlib_cairo.gidLibLinked;

// Context
private alias c_cairo_gobject_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_context_get_typeFn c_cairo_gobject_context_get_type; ///
private alias c_cairo_append_pathFn = extern(C) void function(cairo_t* cr, const(cairo_path_t)* path) nothrow;
__gshared c_cairo_append_pathFn c_cairo_append_path; ///
private alias c_cairo_arcFn = extern(C) void function(cairo_t* cr, double xc, double yc, double radius, double angle1, double angle2) nothrow;
__gshared c_cairo_arcFn c_cairo_arc; ///
private alias c_cairo_arc_negativeFn = extern(C) void function(cairo_t* cr, double xc, double yc, double radius, double angle1, double angle2) nothrow;
__gshared c_cairo_arc_negativeFn c_cairo_arc_negative; ///
private alias c_cairo_clipFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_clipFn c_cairo_clip; ///
private alias c_cairo_clip_extentsFn = extern(C) void function(cairo_t* cr, double* x1, double* y1, double* x2, double* y2) nothrow;
__gshared c_cairo_clip_extentsFn c_cairo_clip_extents; ///
private alias c_cairo_clip_preserveFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_clip_preserveFn c_cairo_clip_preserve; ///
private alias c_cairo_close_pathFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_close_pathFn c_cairo_close_path; ///
private alias c_cairo_copy_clip_rectangle_listFn = extern(C) cairo_rectangle_list_t* function(cairo_t* cr) nothrow;
__gshared c_cairo_copy_clip_rectangle_listFn c_cairo_copy_clip_rectangle_list; ///
private alias c_cairo_copy_pageFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_copy_pageFn c_cairo_copy_page; ///
private alias c_cairo_copy_pathFn = extern(C) cairo_path_t* function(cairo_t* cr) nothrow;
__gshared c_cairo_copy_pathFn c_cairo_copy_path; ///
private alias c_cairo_copy_path_flatFn = extern(C) cairo_path_t* function(cairo_t* cr) nothrow;
__gshared c_cairo_copy_path_flatFn c_cairo_copy_path_flat; ///
private alias c_cairo_curve_toFn = extern(C) void function(cairo_t* cr, double x1, double y1, double x2, double y2, double x3, double y3) nothrow;
__gshared c_cairo_curve_toFn c_cairo_curve_to; ///
private alias c_cairo_device_to_userFn = extern(C) void function(cairo_t* cr, double* x, double* y) nothrow;
__gshared c_cairo_device_to_userFn c_cairo_device_to_user; ///
private alias c_cairo_device_to_user_distanceFn = extern(C) void function(cairo_t* cr, double* dx, double* dy) nothrow;
__gshared c_cairo_device_to_user_distanceFn c_cairo_device_to_user_distance; ///
private alias c_cairo_fillFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_fillFn c_cairo_fill; ///
private alias c_cairo_fill_extentsFn = extern(C) void function(cairo_t* cr, double* x1, double* y1, double* x2, double* y2) nothrow;
__gshared c_cairo_fill_extentsFn c_cairo_fill_extents; ///
private alias c_cairo_fill_preserveFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_fill_preserveFn c_cairo_fill_preserve; ///
private alias c_cairo_font_extentsFn = extern(C) void function(cairo_t* cr, cairo_font_extents_t* extents) nothrow;
__gshared c_cairo_font_extentsFn c_cairo_font_extents; ///
private alias c_cairo_get_antialiasFn = extern(C) cairo_antialias_t function(cairo_t* cr) nothrow;
__gshared c_cairo_get_antialiasFn c_cairo_get_antialias; ///
private alias c_cairo_get_current_pointFn = extern(C) void function(cairo_t* cr, double* x, double* y) nothrow;
__gshared c_cairo_get_current_pointFn c_cairo_get_current_point; ///
private alias c_cairo_get_dashFn = extern(C) void function(cairo_t* cr, double* dashes, double* offset) nothrow;
__gshared c_cairo_get_dashFn c_cairo_get_dash; ///
private alias c_cairo_get_dash_countFn = extern(C) int function(cairo_t* cr) nothrow;
__gshared c_cairo_get_dash_countFn c_cairo_get_dash_count; ///
private alias c_cairo_get_fill_ruleFn = extern(C) cairo_fill_rule_t function(cairo_t* cr) nothrow;
__gshared c_cairo_get_fill_ruleFn c_cairo_get_fill_rule; ///
private alias c_cairo_get_font_faceFn = extern(C) cairo_font_face_t* function(cairo_t* cr) nothrow;
__gshared c_cairo_get_font_faceFn c_cairo_get_font_face; ///
private alias c_cairo_get_font_matrixFn = extern(C) void function(cairo_t* cr, cairo_matrix_t* matrix) nothrow;
__gshared c_cairo_get_font_matrixFn c_cairo_get_font_matrix; ///
private alias c_cairo_get_font_optionsFn = extern(C) void function(cairo_t* cr, cairo_font_options_t* options) nothrow;
__gshared c_cairo_get_font_optionsFn c_cairo_get_font_options; ///
private alias c_cairo_get_group_targetFn = extern(C) cairo_surface_t* function(cairo_t* cr) nothrow;
__gshared c_cairo_get_group_targetFn c_cairo_get_group_target; ///
private alias c_cairo_get_hairlineFn = extern(C) cairo_bool_t function(cairo_t* cr) nothrow;
__gshared c_cairo_get_hairlineFn c_cairo_get_hairline; ///
private alias c_cairo_get_line_capFn = extern(C) cairo_line_cap_t function(cairo_t* cr) nothrow;
__gshared c_cairo_get_line_capFn c_cairo_get_line_cap; ///
private alias c_cairo_get_line_joinFn = extern(C) cairo_line_join_t function(cairo_t* cr) nothrow;
__gshared c_cairo_get_line_joinFn c_cairo_get_line_join; ///
private alias c_cairo_get_line_widthFn = extern(C) double function(cairo_t* cr) nothrow;
__gshared c_cairo_get_line_widthFn c_cairo_get_line_width; ///
private alias c_cairo_get_matrixFn = extern(C) void function(cairo_t* cr, cairo_matrix_t* matrix) nothrow;
__gshared c_cairo_get_matrixFn c_cairo_get_matrix; ///
private alias c_cairo_get_miter_limitFn = extern(C) double function(cairo_t* cr) nothrow;
__gshared c_cairo_get_miter_limitFn c_cairo_get_miter_limit; ///
private alias c_cairo_get_operatorFn = extern(C) cairo_operator_t function(cairo_t* cr) nothrow;
__gshared c_cairo_get_operatorFn c_cairo_get_operator; ///
private alias c_cairo_get_scaled_fontFn = extern(C) cairo_scaled_font_t* function(cairo_t* cr) nothrow;
__gshared c_cairo_get_scaled_fontFn c_cairo_get_scaled_font; ///
private alias c_cairo_get_sourceFn = extern(C) cairo_pattern_t* function(cairo_t* cr) nothrow;
__gshared c_cairo_get_sourceFn c_cairo_get_source; ///
private alias c_cairo_get_targetFn = extern(C) cairo_surface_t* function(cairo_t* cr) nothrow;
__gshared c_cairo_get_targetFn c_cairo_get_target; ///
private alias c_cairo_get_toleranceFn = extern(C) double function(cairo_t* cr) nothrow;
__gshared c_cairo_get_toleranceFn c_cairo_get_tolerance; ///
private alias c_cairo_glyph_extentsFn = extern(C) void function(cairo_t* cr, const(cairo_glyph_t)* glyphs, int numGlyphs, cairo_text_extents_t* extents) nothrow;
__gshared c_cairo_glyph_extentsFn c_cairo_glyph_extents; ///
private alias c_cairo_glyph_pathFn = extern(C) void function(cairo_t* cr, const(cairo_glyph_t)* glyphs, int numGlyphs) nothrow;
__gshared c_cairo_glyph_pathFn c_cairo_glyph_path; ///
private alias c_cairo_has_current_pointFn = extern(C) cairo_bool_t function(cairo_t* cr) nothrow;
__gshared c_cairo_has_current_pointFn c_cairo_has_current_point; ///
private alias c_cairo_identity_matrixFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_identity_matrixFn c_cairo_identity_matrix; ///
private alias c_cairo_in_clipFn = extern(C) cairo_bool_t function(cairo_t* cr, double x, double y) nothrow;
__gshared c_cairo_in_clipFn c_cairo_in_clip; ///
private alias c_cairo_in_fillFn = extern(C) cairo_bool_t function(cairo_t* cr, double x, double y) nothrow;
__gshared c_cairo_in_fillFn c_cairo_in_fill; ///
private alias c_cairo_in_strokeFn = extern(C) cairo_bool_t function(cairo_t* cr, double x, double y) nothrow;
__gshared c_cairo_in_strokeFn c_cairo_in_stroke; ///
private alias c_cairo_line_toFn = extern(C) void function(cairo_t* cr, double x, double y) nothrow;
__gshared c_cairo_line_toFn c_cairo_line_to; ///
private alias c_cairo_maskFn = extern(C) void function(cairo_t* cr, cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_maskFn c_cairo_mask; ///
private alias c_cairo_mask_surfaceFn = extern(C) void function(cairo_t* cr, cairo_surface_t* surface, double surfaceX, double surfaceY) nothrow;
__gshared c_cairo_mask_surfaceFn c_cairo_mask_surface; ///
private alias c_cairo_move_toFn = extern(C) void function(cairo_t* cr, double x, double y) nothrow;
__gshared c_cairo_move_toFn c_cairo_move_to; ///
private alias c_cairo_new_pathFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_new_pathFn c_cairo_new_path; ///
private alias c_cairo_new_sub_pathFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_new_sub_pathFn c_cairo_new_sub_path; ///
private alias c_cairo_paintFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_paintFn c_cairo_paint; ///
private alias c_cairo_paint_with_alphaFn = extern(C) void function(cairo_t* cr, double alpha) nothrow;
__gshared c_cairo_paint_with_alphaFn c_cairo_paint_with_alpha; ///
private alias c_cairo_path_extentsFn = extern(C) void function(cairo_t* cr, double* x1, double* y1, double* x2, double* y2) nothrow;
__gshared c_cairo_path_extentsFn c_cairo_path_extents; ///
private alias c_cairo_pop_groupFn = extern(C) cairo_pattern_t* function(cairo_t* cr) nothrow;
__gshared c_cairo_pop_groupFn c_cairo_pop_group; ///
private alias c_cairo_pop_group_to_sourceFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_pop_group_to_sourceFn c_cairo_pop_group_to_source; ///
private alias c_cairo_push_groupFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_push_groupFn c_cairo_push_group; ///
private alias c_cairo_push_group_with_contentFn = extern(C) void function(cairo_t* cr, cairo_content_t content) nothrow;
__gshared c_cairo_push_group_with_contentFn c_cairo_push_group_with_content; ///
private alias c_cairo_rectangleFn = extern(C) void function(cairo_t* cr, double x, double y, double width, double height) nothrow;
__gshared c_cairo_rectangleFn c_cairo_rectangle; ///
private alias c_cairo_rel_curve_toFn = extern(C) void function(cairo_t* cr, double dx1, double dy1, double dx2, double dy2, double dx3, double dy3) nothrow;
__gshared c_cairo_rel_curve_toFn c_cairo_rel_curve_to; ///
private alias c_cairo_rel_line_toFn = extern(C) void function(cairo_t* cr, double dx, double dy) nothrow;
__gshared c_cairo_rel_line_toFn c_cairo_rel_line_to; ///
private alias c_cairo_rel_move_toFn = extern(C) void function(cairo_t* cr, double dx, double dy) nothrow;
__gshared c_cairo_rel_move_toFn c_cairo_rel_move_to; ///
private alias c_cairo_reset_clipFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_reset_clipFn c_cairo_reset_clip; ///
private alias c_cairo_restoreFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_restoreFn c_cairo_restore; ///
private alias c_cairo_rotateFn = extern(C) void function(cairo_t* cr, double angle) nothrow;
__gshared c_cairo_rotateFn c_cairo_rotate; ///
private alias c_cairo_saveFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_saveFn c_cairo_save; ///
private alias c_cairo_scaleFn = extern(C) void function(cairo_t* cr, double sx, double sy) nothrow;
__gshared c_cairo_scaleFn c_cairo_scale; ///
private alias c_cairo_select_font_faceFn = extern(C) void function(cairo_t* cr, const(char)* family, cairo_font_slant_t slant, cairo_font_weight_t weight) nothrow;
__gshared c_cairo_select_font_faceFn c_cairo_select_font_face; ///
private alias c_cairo_set_antialiasFn = extern(C) void function(cairo_t* cr, cairo_antialias_t antialias) nothrow;
__gshared c_cairo_set_antialiasFn c_cairo_set_antialias; ///
private alias c_cairo_set_dashFn = extern(C) void function(cairo_t* cr, const(double)* dashes, int numDashes, double offset) nothrow;
__gshared c_cairo_set_dashFn c_cairo_set_dash; ///
private alias c_cairo_set_fill_ruleFn = extern(C) void function(cairo_t* cr, cairo_fill_rule_t fillRule) nothrow;
__gshared c_cairo_set_fill_ruleFn c_cairo_set_fill_rule; ///
private alias c_cairo_set_font_faceFn = extern(C) void function(cairo_t* cr, cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_set_font_faceFn c_cairo_set_font_face; ///
private alias c_cairo_set_font_matrixFn = extern(C) void function(cairo_t* cr, const(cairo_matrix_t)* matrix) nothrow;
__gshared c_cairo_set_font_matrixFn c_cairo_set_font_matrix; ///
private alias c_cairo_set_font_optionsFn = extern(C) void function(cairo_t* cr, const(cairo_font_options_t)* options) nothrow;
__gshared c_cairo_set_font_optionsFn c_cairo_set_font_options; ///
private alias c_cairo_set_font_sizeFn = extern(C) void function(cairo_t* cr, double size) nothrow;
__gshared c_cairo_set_font_sizeFn c_cairo_set_font_size; ///
private alias c_cairo_set_hairlineFn = extern(C) void function(cairo_t* cr, cairo_bool_t setHairline) nothrow;
__gshared c_cairo_set_hairlineFn c_cairo_set_hairline; ///
private alias c_cairo_set_line_capFn = extern(C) void function(cairo_t* cr, cairo_line_cap_t lineCap) nothrow;
__gshared c_cairo_set_line_capFn c_cairo_set_line_cap; ///
private alias c_cairo_set_line_joinFn = extern(C) void function(cairo_t* cr, cairo_line_join_t lineJoin) nothrow;
__gshared c_cairo_set_line_joinFn c_cairo_set_line_join; ///
private alias c_cairo_set_line_widthFn = extern(C) void function(cairo_t* cr, double width) nothrow;
__gshared c_cairo_set_line_widthFn c_cairo_set_line_width; ///
private alias c_cairo_set_matrixFn = extern(C) void function(cairo_t* cr, const(cairo_matrix_t)* matrix) nothrow;
__gshared c_cairo_set_matrixFn c_cairo_set_matrix; ///
private alias c_cairo_set_miter_limitFn = extern(C) void function(cairo_t* cr, double limit) nothrow;
__gshared c_cairo_set_miter_limitFn c_cairo_set_miter_limit; ///
private alias c_cairo_set_operatorFn = extern(C) void function(cairo_t* cr, cairo_operator_t op) nothrow;
__gshared c_cairo_set_operatorFn c_cairo_set_operator; ///
private alias c_cairo_set_scaled_fontFn = extern(C) void function(cairo_t* cr, const(cairo_scaled_font_t)* scaledFont) nothrow;
__gshared c_cairo_set_scaled_fontFn c_cairo_set_scaled_font; ///
private alias c_cairo_set_sourceFn = extern(C) void function(cairo_t* cr, cairo_pattern_t* source) nothrow;
__gshared c_cairo_set_sourceFn c_cairo_set_source; ///
private alias c_cairo_set_source_rgbFn = extern(C) void function(cairo_t* cr, double red, double green, double blue) nothrow;
__gshared c_cairo_set_source_rgbFn c_cairo_set_source_rgb; ///
private alias c_cairo_set_source_rgbaFn = extern(C) void function(cairo_t* cr, double red, double green, double blue, double alpha) nothrow;
__gshared c_cairo_set_source_rgbaFn c_cairo_set_source_rgba; ///
private alias c_cairo_set_source_surfaceFn = extern(C) void function(cairo_t* cr, cairo_surface_t* surface, double x, double y) nothrow;
__gshared c_cairo_set_source_surfaceFn c_cairo_set_source_surface; ///
private alias c_cairo_set_toleranceFn = extern(C) void function(cairo_t* cr, double tolerance) nothrow;
__gshared c_cairo_set_toleranceFn c_cairo_set_tolerance; ///
private alias c_cairo_show_glyphsFn = extern(C) void function(cairo_t* cr, const(cairo_glyph_t)* glyphs, int numGlyphs) nothrow;
__gshared c_cairo_show_glyphsFn c_cairo_show_glyphs; ///
private alias c_cairo_show_pageFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_show_pageFn c_cairo_show_page; ///
private alias c_cairo_show_textFn = extern(C) void function(cairo_t* cr, const(char)* utf8) nothrow;
__gshared c_cairo_show_textFn c_cairo_show_text; ///
private alias c_cairo_show_text_glyphsFn = extern(C) void function(cairo_t* cr, const(char)* utf8, int utf8Len, const(cairo_glyph_t)* glyphs, int numGlyphs, const(cairo_text_cluster_t)* clusters, int numClusters, cairo_text_cluster_flags_t clusterFlags) nothrow;
__gshared c_cairo_show_text_glyphsFn c_cairo_show_text_glyphs; ///
private alias c_cairo_statusFn = extern(C) cairo_status_t function(cairo_t* cr) nothrow;
__gshared c_cairo_statusFn c_cairo_status; ///
private alias c_cairo_strokeFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_strokeFn c_cairo_stroke; ///
private alias c_cairo_stroke_extentsFn = extern(C) void function(cairo_t* cr, double* x1, double* y1, double* x2, double* y2) nothrow;
__gshared c_cairo_stroke_extentsFn c_cairo_stroke_extents; ///
private alias c_cairo_stroke_preserveFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_stroke_preserveFn c_cairo_stroke_preserve; ///
private alias c_cairo_tag_beginFn = extern(C) void function(cairo_t* cr, const(char)* tagName, const(char)* attributes) nothrow;
__gshared c_cairo_tag_beginFn c_cairo_tag_begin; ///
private alias c_cairo_tag_endFn = extern(C) void function(cairo_t* cr, const(char)* tagName) nothrow;
__gshared c_cairo_tag_endFn c_cairo_tag_end; ///
private alias c_cairo_text_extentsFn = extern(C) void function(cairo_t* cr, const(char)* utf8, cairo_text_extents_t* extents) nothrow;
__gshared c_cairo_text_extentsFn c_cairo_text_extents; ///
private alias c_cairo_text_pathFn = extern(C) void function(cairo_t* cr, const(char)* utf8) nothrow;
__gshared c_cairo_text_pathFn c_cairo_text_path; ///
private alias c_cairo_transformFn = extern(C) void function(cairo_t* cr, const(cairo_matrix_t)* matrix) nothrow;
__gshared c_cairo_transformFn c_cairo_transform; ///
private alias c_cairo_translateFn = extern(C) void function(cairo_t* cr, double tx, double ty) nothrow;
__gshared c_cairo_translateFn c_cairo_translate; ///
private alias c_cairo_user_to_deviceFn = extern(C) void function(cairo_t* cr, double* x, double* y) nothrow;
__gshared c_cairo_user_to_deviceFn c_cairo_user_to_device; ///
private alias c_cairo_user_to_device_distanceFn = extern(C) void function(cairo_t* cr, double* dx, double* dy) nothrow;
__gshared c_cairo_user_to_device_distanceFn c_cairo_user_to_device_distance; ///

// Device
private alias c_cairo_gobject_device_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_device_get_typeFn c_cairo_gobject_device_get_type; ///
private alias c_cairo_device_acquireFn = extern(C) cairo_status_t function(cairo_device_t* device) nothrow;
__gshared c_cairo_device_acquireFn c_cairo_device_acquire; ///
private alias c_cairo_device_destroyFn = extern(C) void function(cairo_device_t* device) nothrow;
__gshared c_cairo_device_destroyFn c_cairo_device_destroy; ///
private alias c_cairo_device_finishFn = extern(C) void function(cairo_device_t* device) nothrow;
__gshared c_cairo_device_finishFn c_cairo_device_finish; ///
private alias c_cairo_device_flushFn = extern(C) void function(cairo_device_t* device) nothrow;
__gshared c_cairo_device_flushFn c_cairo_device_flush; ///
private alias c_cairo_device_get_reference_countFn = extern(C) uint function(cairo_device_t* device) nothrow;
__gshared c_cairo_device_get_reference_countFn c_cairo_device_get_reference_count; ///
private alias c_cairo_device_get_typeFn = extern(C) cairo_device_type_t function(cairo_device_t* device) nothrow;
__gshared c_cairo_device_get_typeFn c_cairo_device_get_type; ///
private alias c_cairo_device_get_user_dataFn = extern(C) void* function(cairo_device_t* device, const(cairo_user_data_key_t)* key) nothrow;
__gshared c_cairo_device_get_user_dataFn c_cairo_device_get_user_data; ///
private alias c_cairo_device_observer_elapsedFn = extern(C) double function(cairo_device_t* abstractDevice) nothrow;
__gshared c_cairo_device_observer_elapsedFn c_cairo_device_observer_elapsed; ///
private alias c_cairo_device_observer_fill_elapsedFn = extern(C) double function(cairo_device_t* abstractDevice) nothrow;
__gshared c_cairo_device_observer_fill_elapsedFn c_cairo_device_observer_fill_elapsed; ///
private alias c_cairo_device_observer_glyphs_elapsedFn = extern(C) double function(cairo_device_t* abstractDevice) nothrow;
__gshared c_cairo_device_observer_glyphs_elapsedFn c_cairo_device_observer_glyphs_elapsed; ///
private alias c_cairo_device_observer_mask_elapsedFn = extern(C) double function(cairo_device_t* abstractDevice) nothrow;
__gshared c_cairo_device_observer_mask_elapsedFn c_cairo_device_observer_mask_elapsed; ///
private alias c_cairo_device_observer_paint_elapsedFn = extern(C) double function(cairo_device_t* abstractDevice) nothrow;
__gshared c_cairo_device_observer_paint_elapsedFn c_cairo_device_observer_paint_elapsed; ///
private alias c_cairo_device_observer_printFn = extern(C) cairo_status_t function(cairo_device_t* abstractDevice, cairo_write_func_t writeFunc, void* closure) nothrow;
__gshared c_cairo_device_observer_printFn c_cairo_device_observer_print; ///
private alias c_cairo_device_observer_stroke_elapsedFn = extern(C) double function(cairo_device_t* abstractDevice) nothrow;
__gshared c_cairo_device_observer_stroke_elapsedFn c_cairo_device_observer_stroke_elapsed; ///
private alias c_cairo_device_referenceFn = extern(C) cairo_device_t* function(cairo_device_t* device) nothrow;
__gshared c_cairo_device_referenceFn c_cairo_device_reference; ///
private alias c_cairo_device_releaseFn = extern(C) void function(cairo_device_t* device) nothrow;
__gshared c_cairo_device_releaseFn c_cairo_device_release; ///
private alias c_cairo_device_set_user_dataFn = extern(C) cairo_status_t function(cairo_device_t* device, const(cairo_user_data_key_t)* key, void* userData, cairo_destroy_func_t destroy) nothrow;
__gshared c_cairo_device_set_user_dataFn c_cairo_device_set_user_data; ///
private alias c_cairo_device_statusFn = extern(C) cairo_status_t function(cairo_device_t* device) nothrow;
__gshared c_cairo_device_statusFn c_cairo_device_status; ///

// FontFace
private alias c_cairo_gobject_font_face_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_font_face_get_typeFn c_cairo_gobject_font_face_get_type; ///
private alias c_cairo_font_face_destroyFn = extern(C) void function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_font_face_destroyFn c_cairo_font_face_destroy; ///
private alias c_cairo_font_face_get_reference_countFn = extern(C) uint function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_font_face_get_reference_countFn c_cairo_font_face_get_reference_count; ///
private alias c_cairo_font_face_get_typeFn = extern(C) cairo_font_type_t function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_font_face_get_typeFn c_cairo_font_face_get_type; ///
private alias c_cairo_font_face_get_user_dataFn = extern(C) void* function(cairo_font_face_t* fontFace, const(cairo_user_data_key_t)* key) nothrow;
__gshared c_cairo_font_face_get_user_dataFn c_cairo_font_face_get_user_data; ///
private alias c_cairo_font_face_referenceFn = extern(C) cairo_font_face_t* function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_font_face_referenceFn c_cairo_font_face_reference; ///
private alias c_cairo_font_face_set_user_dataFn = extern(C) cairo_status_t function(cairo_font_face_t* fontFace, const(cairo_user_data_key_t)* key, void* userData, cairo_destroy_func_t destroy) nothrow;
__gshared c_cairo_font_face_set_user_dataFn c_cairo_font_face_set_user_data; ///
private alias c_cairo_font_face_statusFn = extern(C) cairo_status_t function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_font_face_statusFn c_cairo_font_face_status; ///

// FontOptions
private alias c_cairo_gobject_font_options_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_font_options_get_typeFn c_cairo_gobject_font_options_get_type; ///
private alias c_cairo_font_options_copyFn = extern(C) cairo_font_options_t* function(const(cairo_font_options_t)* original) nothrow;
__gshared c_cairo_font_options_copyFn c_cairo_font_options_copy; ///
private alias c_cairo_font_options_destroyFn = extern(C) void function(cairo_font_options_t* options) nothrow;
__gshared c_cairo_font_options_destroyFn c_cairo_font_options_destroy; ///
private alias c_cairo_font_options_equalFn = extern(C) cairo_bool_t function(const(cairo_font_options_t)* options, const(cairo_font_options_t)* other) nothrow;
__gshared c_cairo_font_options_equalFn c_cairo_font_options_equal; ///
private alias c_cairo_font_options_get_antialiasFn = extern(C) cairo_antialias_t function(const(cairo_font_options_t)* options) nothrow;
__gshared c_cairo_font_options_get_antialiasFn c_cairo_font_options_get_antialias; ///
private alias c_cairo_font_options_get_color_modeFn = extern(C) cairo_color_mode_t function(const(cairo_font_options_t)* options) nothrow;
__gshared c_cairo_font_options_get_color_modeFn c_cairo_font_options_get_color_mode; ///
private alias c_cairo_font_options_get_color_paletteFn = extern(C) uint function(const(cairo_font_options_t)* options) nothrow;
__gshared c_cairo_font_options_get_color_paletteFn c_cairo_font_options_get_color_palette; ///
private alias c_cairo_font_options_get_custom_palette_colorFn = extern(C) cairo_status_t function(cairo_font_options_t* options, uint index, double* red, double* green, double* blue, double* alpha) nothrow;
__gshared c_cairo_font_options_get_custom_palette_colorFn c_cairo_font_options_get_custom_palette_color; ///
private alias c_cairo_font_options_get_hint_metricsFn = extern(C) cairo_hint_metrics_t function(const(cairo_font_options_t)* options) nothrow;
__gshared c_cairo_font_options_get_hint_metricsFn c_cairo_font_options_get_hint_metrics; ///
private alias c_cairo_font_options_get_hint_styleFn = extern(C) cairo_hint_style_t function(const(cairo_font_options_t)* options) nothrow;
__gshared c_cairo_font_options_get_hint_styleFn c_cairo_font_options_get_hint_style; ///
private alias c_cairo_font_options_get_subpixel_orderFn = extern(C) cairo_subpixel_order_t function(const(cairo_font_options_t)* options) nothrow;
__gshared c_cairo_font_options_get_subpixel_orderFn c_cairo_font_options_get_subpixel_order; ///
private alias c_cairo_font_options_get_variationsFn = extern(C) const(char)* function(cairo_font_options_t* options) nothrow;
__gshared c_cairo_font_options_get_variationsFn c_cairo_font_options_get_variations; ///
private alias c_cairo_font_options_hashFn = extern(C) gulong function(const(cairo_font_options_t)* options) nothrow;
__gshared c_cairo_font_options_hashFn c_cairo_font_options_hash; ///
private alias c_cairo_font_options_mergeFn = extern(C) void function(cairo_font_options_t* options, const(cairo_font_options_t)* other) nothrow;
__gshared c_cairo_font_options_mergeFn c_cairo_font_options_merge; ///
private alias c_cairo_font_options_set_antialiasFn = extern(C) void function(cairo_font_options_t* options, cairo_antialias_t antialias) nothrow;
__gshared c_cairo_font_options_set_antialiasFn c_cairo_font_options_set_antialias; ///
private alias c_cairo_font_options_set_color_modeFn = extern(C) void function(cairo_font_options_t* options, cairo_color_mode_t colorMode) nothrow;
__gshared c_cairo_font_options_set_color_modeFn c_cairo_font_options_set_color_mode; ///
private alias c_cairo_font_options_set_color_paletteFn = extern(C) void function(cairo_font_options_t* options, uint paletteIndex) nothrow;
__gshared c_cairo_font_options_set_color_paletteFn c_cairo_font_options_set_color_palette; ///
private alias c_cairo_font_options_set_custom_palette_colorFn = extern(C) void function(cairo_font_options_t* options, uint index, double red, double green, double blue, double alpha) nothrow;
__gshared c_cairo_font_options_set_custom_palette_colorFn c_cairo_font_options_set_custom_palette_color; ///
private alias c_cairo_font_options_set_hint_metricsFn = extern(C) void function(cairo_font_options_t* options, cairo_hint_metrics_t hintMetrics) nothrow;
__gshared c_cairo_font_options_set_hint_metricsFn c_cairo_font_options_set_hint_metrics; ///
private alias c_cairo_font_options_set_hint_styleFn = extern(C) void function(cairo_font_options_t* options, cairo_hint_style_t hintStyle) nothrow;
__gshared c_cairo_font_options_set_hint_styleFn c_cairo_font_options_set_hint_style; ///
private alias c_cairo_font_options_set_subpixel_orderFn = extern(C) void function(cairo_font_options_t* options, cairo_subpixel_order_t subpixelOrder) nothrow;
__gshared c_cairo_font_options_set_subpixel_orderFn c_cairo_font_options_set_subpixel_order; ///
private alias c_cairo_font_options_set_variationsFn = extern(C) void function(cairo_font_options_t* options, const(char)* variations) nothrow;
__gshared c_cairo_font_options_set_variationsFn c_cairo_font_options_set_variations; ///
private alias c_cairo_font_options_statusFn = extern(C) cairo_status_t function(cairo_font_options_t* options) nothrow;
__gshared c_cairo_font_options_statusFn c_cairo_font_options_status; ///

// Glyph
private alias c_cairo_gobject_glyph_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_glyph_get_typeFn c_cairo_gobject_glyph_get_type; ///
private alias c_cairo_glyph_freeFn = extern(C) void function(cairo_glyph_t* glyphs) nothrow;
__gshared c_cairo_glyph_freeFn c_cairo_glyph_free; ///

// Matrix
private alias c_cairo_gobject_matrix_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_matrix_get_typeFn c_cairo_gobject_matrix_get_type; ///
private alias c_cairo_matrix_initFn = extern(C) void function(cairo_matrix_t* matrix, double xx, double yx, double xy, double yy, double x0, double y0) nothrow;
__gshared c_cairo_matrix_initFn c_cairo_matrix_init; ///
private alias c_cairo_matrix_init_identityFn = extern(C) void function(cairo_matrix_t* matrix) nothrow;
__gshared c_cairo_matrix_init_identityFn c_cairo_matrix_init_identity; ///
private alias c_cairo_matrix_init_rotateFn = extern(C) void function(cairo_matrix_t* matrix, double radians) nothrow;
__gshared c_cairo_matrix_init_rotateFn c_cairo_matrix_init_rotate; ///
private alias c_cairo_matrix_init_scaleFn = extern(C) void function(cairo_matrix_t* matrix, double sx, double sy) nothrow;
__gshared c_cairo_matrix_init_scaleFn c_cairo_matrix_init_scale; ///
private alias c_cairo_matrix_init_translateFn = extern(C) void function(cairo_matrix_t* matrix, double tx, double ty) nothrow;
__gshared c_cairo_matrix_init_translateFn c_cairo_matrix_init_translate; ///
private alias c_cairo_matrix_invertFn = extern(C) cairo_status_t function(cairo_matrix_t* matrix) nothrow;
__gshared c_cairo_matrix_invertFn c_cairo_matrix_invert; ///
private alias c_cairo_matrix_multiplyFn = extern(C) void function(cairo_matrix_t* result, const(cairo_matrix_t)* a, const(cairo_matrix_t)* b) nothrow;
__gshared c_cairo_matrix_multiplyFn c_cairo_matrix_multiply; ///
private alias c_cairo_matrix_rotateFn = extern(C) void function(cairo_matrix_t* matrix, double radians) nothrow;
__gshared c_cairo_matrix_rotateFn c_cairo_matrix_rotate; ///
private alias c_cairo_matrix_scaleFn = extern(C) void function(cairo_matrix_t* matrix, double sx, double sy) nothrow;
__gshared c_cairo_matrix_scaleFn c_cairo_matrix_scale; ///
private alias c_cairo_matrix_transform_distanceFn = extern(C) void function(const(cairo_matrix_t)* matrix, double* dx, double* dy) nothrow;
__gshared c_cairo_matrix_transform_distanceFn c_cairo_matrix_transform_distance; ///
private alias c_cairo_matrix_transform_pointFn = extern(C) void function(const(cairo_matrix_t)* matrix, double* x, double* y) nothrow;
__gshared c_cairo_matrix_transform_pointFn c_cairo_matrix_transform_point; ///
private alias c_cairo_matrix_translateFn = extern(C) void function(cairo_matrix_t* matrix, double tx, double ty) nothrow;
__gshared c_cairo_matrix_translateFn c_cairo_matrix_translate; ///

// Path
private alias c_cairo_gobject_path_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_path_get_typeFn c_cairo_gobject_path_get_type; ///
private alias c_cairo_path_destroyFn = extern(C) void function(cairo_path_t* path) nothrow;
__gshared c_cairo_path_destroyFn c_cairo_path_destroy; ///

// Pattern
private alias c_cairo_gobject_pattern_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_pattern_get_typeFn c_cairo_gobject_pattern_get_type; ///
private alias c_cairo_pattern_add_color_stop_rgbFn = extern(C) void function(cairo_pattern_t* pattern, double offset, double red, double green, double blue) nothrow;
__gshared c_cairo_pattern_add_color_stop_rgbFn c_cairo_pattern_add_color_stop_rgb; ///
private alias c_cairo_pattern_add_color_stop_rgbaFn = extern(C) void function(cairo_pattern_t* pattern, double offset, double red, double green, double blue, double alpha) nothrow;
__gshared c_cairo_pattern_add_color_stop_rgbaFn c_cairo_pattern_add_color_stop_rgba; ///
private alias c_cairo_pattern_destroyFn = extern(C) void function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_pattern_destroyFn c_cairo_pattern_destroy; ///
private alias c_cairo_pattern_get_color_stop_countFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern, int* count) nothrow;
__gshared c_cairo_pattern_get_color_stop_countFn c_cairo_pattern_get_color_stop_count; ///
private alias c_cairo_pattern_get_color_stop_rgbaFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern, int index, double* offset, double* red, double* green, double* blue, double* alpha) nothrow;
__gshared c_cairo_pattern_get_color_stop_rgbaFn c_cairo_pattern_get_color_stop_rgba; ///
private alias c_cairo_pattern_get_ditherFn = extern(C) cairo_dither_t function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_pattern_get_ditherFn c_cairo_pattern_get_dither; ///
private alias c_cairo_pattern_get_extendFn = extern(C) cairo_extend_t function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_pattern_get_extendFn c_cairo_pattern_get_extend; ///
private alias c_cairo_pattern_get_filterFn = extern(C) cairo_filter_t function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_pattern_get_filterFn c_cairo_pattern_get_filter; ///
private alias c_cairo_pattern_get_linear_pointsFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern, double* x0, double* y0, double* x1, double* y1) nothrow;
__gshared c_cairo_pattern_get_linear_pointsFn c_cairo_pattern_get_linear_points; ///
private alias c_cairo_pattern_get_matrixFn = extern(C) void function(cairo_pattern_t* pattern, cairo_matrix_t* matrix) nothrow;
__gshared c_cairo_pattern_get_matrixFn c_cairo_pattern_get_matrix; ///
private alias c_cairo_pattern_get_radial_circlesFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern, double* x0, double* y0, double* r0, double* x1, double* y1, double* r1) nothrow;
__gshared c_cairo_pattern_get_radial_circlesFn c_cairo_pattern_get_radial_circles; ///
private alias c_cairo_pattern_get_reference_countFn = extern(C) uint function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_pattern_get_reference_countFn c_cairo_pattern_get_reference_count; ///
private alias c_cairo_pattern_get_rgbaFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern, double* red, double* green, double* blue, double* alpha) nothrow;
__gshared c_cairo_pattern_get_rgbaFn c_cairo_pattern_get_rgba; ///
private alias c_cairo_pattern_get_surfaceFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern, cairo_surface_t** surface) nothrow;
__gshared c_cairo_pattern_get_surfaceFn c_cairo_pattern_get_surface; ///
private alias c_cairo_pattern_get_typeFn = extern(C) cairo_pattern_type_t function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_pattern_get_typeFn c_cairo_pattern_get_type; ///
private alias c_cairo_pattern_get_user_dataFn = extern(C) void* function(cairo_pattern_t* pattern, const(cairo_user_data_key_t)* key) nothrow;
__gshared c_cairo_pattern_get_user_dataFn c_cairo_pattern_get_user_data; ///
private alias c_cairo_pattern_referenceFn = extern(C) cairo_pattern_t* function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_pattern_referenceFn c_cairo_pattern_reference; ///
private alias c_cairo_pattern_set_ditherFn = extern(C) void function(cairo_pattern_t* pattern, cairo_dither_t dither) nothrow;
__gshared c_cairo_pattern_set_ditherFn c_cairo_pattern_set_dither; ///
private alias c_cairo_pattern_set_extendFn = extern(C) void function(cairo_pattern_t* pattern, cairo_extend_t extend) nothrow;
__gshared c_cairo_pattern_set_extendFn c_cairo_pattern_set_extend; ///
private alias c_cairo_pattern_set_filterFn = extern(C) void function(cairo_pattern_t* pattern, cairo_filter_t filter) nothrow;
__gshared c_cairo_pattern_set_filterFn c_cairo_pattern_set_filter; ///
private alias c_cairo_pattern_set_matrixFn = extern(C) void function(cairo_pattern_t* pattern, const(cairo_matrix_t)* matrix) nothrow;
__gshared c_cairo_pattern_set_matrixFn c_cairo_pattern_set_matrix; ///
private alias c_cairo_pattern_set_user_dataFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern, const(cairo_user_data_key_t)* key, void* userData, cairo_destroy_func_t destroy) nothrow;
__gshared c_cairo_pattern_set_user_dataFn c_cairo_pattern_set_user_data; ///
private alias c_cairo_pattern_statusFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_pattern_statusFn c_cairo_pattern_status; ///

// Rectangle
private alias c_cairo_gobject_rectangle_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_rectangle_get_typeFn c_cairo_gobject_rectangle_get_type; ///

// RectangleInt
private alias c_cairo_gobject_rectangle_int_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_rectangle_int_get_typeFn c_cairo_gobject_rectangle_int_get_type; ///

// RectangleList
private alias c_cairo_gobject_rectangle_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_rectangle_list_get_typeFn c_cairo_gobject_rectangle_list_get_type; ///
private alias c_cairo_rectangle_list_destroyFn = extern(C) void function(cairo_rectangle_list_t* rectangleList) nothrow;
__gshared c_cairo_rectangle_list_destroyFn c_cairo_rectangle_list_destroy; ///

// Region
private alias c_cairo_gobject_region_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_region_get_typeFn c_cairo_gobject_region_get_type; ///
private alias c_cairo_region_contains_pointFn = extern(C) cairo_bool_t function(const(cairo_region_t)* region, int x, int y) nothrow;
__gshared c_cairo_region_contains_pointFn c_cairo_region_contains_point; ///
private alias c_cairo_region_contains_rectangleFn = extern(C) cairo_region_overlap_t function(const(cairo_region_t)* region, const(cairo_rectangle_int_t)* rectangle) nothrow;
__gshared c_cairo_region_contains_rectangleFn c_cairo_region_contains_rectangle; ///
private alias c_cairo_region_copyFn = extern(C) cairo_region_t* function(const(cairo_region_t)* original) nothrow;
__gshared c_cairo_region_copyFn c_cairo_region_copy; ///
private alias c_cairo_region_destroyFn = extern(C) void function(cairo_region_t* region) nothrow;
__gshared c_cairo_region_destroyFn c_cairo_region_destroy; ///
private alias c_cairo_region_equalFn = extern(C) cairo_bool_t function(const(cairo_region_t)* a, const(cairo_region_t)* b) nothrow;
__gshared c_cairo_region_equalFn c_cairo_region_equal; ///
private alias c_cairo_region_get_extentsFn = extern(C) void function(const(cairo_region_t)* region, cairo_rectangle_int_t* extents) nothrow;
__gshared c_cairo_region_get_extentsFn c_cairo_region_get_extents; ///
private alias c_cairo_region_get_rectangleFn = extern(C) void function(const(cairo_region_t)* region, int nth, cairo_rectangle_int_t* rectangle) nothrow;
__gshared c_cairo_region_get_rectangleFn c_cairo_region_get_rectangle; ///
private alias c_cairo_region_intersectFn = extern(C) cairo_status_t function(cairo_region_t* dst, const(cairo_region_t)* other) nothrow;
__gshared c_cairo_region_intersectFn c_cairo_region_intersect; ///
private alias c_cairo_region_intersect_rectangleFn = extern(C) cairo_status_t function(cairo_region_t* dst, const(cairo_rectangle_int_t)* rectangle) nothrow;
__gshared c_cairo_region_intersect_rectangleFn c_cairo_region_intersect_rectangle; ///
private alias c_cairo_region_is_emptyFn = extern(C) cairo_bool_t function(const(cairo_region_t)* region) nothrow;
__gshared c_cairo_region_is_emptyFn c_cairo_region_is_empty; ///
private alias c_cairo_region_num_rectanglesFn = extern(C) int function(const(cairo_region_t)* region) nothrow;
__gshared c_cairo_region_num_rectanglesFn c_cairo_region_num_rectangles; ///
private alias c_cairo_region_referenceFn = extern(C) cairo_region_t* function(cairo_region_t* region) nothrow;
__gshared c_cairo_region_referenceFn c_cairo_region_reference; ///
private alias c_cairo_region_statusFn = extern(C) cairo_status_t function(const(cairo_region_t)* region) nothrow;
__gshared c_cairo_region_statusFn c_cairo_region_status; ///
private alias c_cairo_region_subtractFn = extern(C) cairo_status_t function(cairo_region_t* dst, const(cairo_region_t)* other) nothrow;
__gshared c_cairo_region_subtractFn c_cairo_region_subtract; ///
private alias c_cairo_region_subtract_rectangleFn = extern(C) cairo_status_t function(cairo_region_t* dst, const(cairo_rectangle_int_t)* rectangle) nothrow;
__gshared c_cairo_region_subtract_rectangleFn c_cairo_region_subtract_rectangle; ///
private alias c_cairo_region_translateFn = extern(C) void function(cairo_region_t* region, int dx, int dy) nothrow;
__gshared c_cairo_region_translateFn c_cairo_region_translate; ///
private alias c_cairo_region_unionFn = extern(C) cairo_status_t function(cairo_region_t* dst, const(cairo_region_t)* other) nothrow;
__gshared c_cairo_region_unionFn c_cairo_region_union; ///
private alias c_cairo_region_union_rectangleFn = extern(C) cairo_status_t function(cairo_region_t* dst, const(cairo_rectangle_int_t)* rectangle) nothrow;
__gshared c_cairo_region_union_rectangleFn c_cairo_region_union_rectangle; ///
private alias c_cairo_region_xorFn = extern(C) cairo_status_t function(cairo_region_t* dst, const(cairo_region_t)* other) nothrow;
__gshared c_cairo_region_xorFn c_cairo_region_xor; ///
private alias c_cairo_region_xor_rectangleFn = extern(C) cairo_status_t function(cairo_region_t* dst, const(cairo_rectangle_int_t)* rectangle) nothrow;
__gshared c_cairo_region_xor_rectangleFn c_cairo_region_xor_rectangle; ///

// ScaledFont
private alias c_cairo_gobject_scaled_font_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_scaled_font_get_typeFn c_cairo_gobject_scaled_font_get_type; ///
private alias c_cairo_scaled_font_destroyFn = extern(C) void function(cairo_scaled_font_t* scaledFont) nothrow;
__gshared c_cairo_scaled_font_destroyFn c_cairo_scaled_font_destroy; ///
private alias c_cairo_scaled_font_extentsFn = extern(C) void function(cairo_scaled_font_t* scaledFont, cairo_font_extents_t* extents) nothrow;
__gshared c_cairo_scaled_font_extentsFn c_cairo_scaled_font_extents; ///
private alias c_cairo_scaled_font_get_ctmFn = extern(C) void function(cairo_scaled_font_t* scaledFont, cairo_matrix_t* ctm) nothrow;
__gshared c_cairo_scaled_font_get_ctmFn c_cairo_scaled_font_get_ctm; ///
private alias c_cairo_scaled_font_get_font_faceFn = extern(C) cairo_font_face_t* function(cairo_scaled_font_t* scaledFont) nothrow;
__gshared c_cairo_scaled_font_get_font_faceFn c_cairo_scaled_font_get_font_face; ///
private alias c_cairo_scaled_font_get_font_matrixFn = extern(C) void function(cairo_scaled_font_t* scaledFont, cairo_matrix_t* fontMatrix) nothrow;
__gshared c_cairo_scaled_font_get_font_matrixFn c_cairo_scaled_font_get_font_matrix; ///
private alias c_cairo_scaled_font_get_font_optionsFn = extern(C) void function(cairo_scaled_font_t* scaledFont, cairo_font_options_t* options) nothrow;
__gshared c_cairo_scaled_font_get_font_optionsFn c_cairo_scaled_font_get_font_options; ///
private alias c_cairo_scaled_font_get_reference_countFn = extern(C) uint function(cairo_scaled_font_t* scaledFont) nothrow;
__gshared c_cairo_scaled_font_get_reference_countFn c_cairo_scaled_font_get_reference_count; ///
private alias c_cairo_scaled_font_get_scale_matrixFn = extern(C) void function(cairo_scaled_font_t* scaledFont, cairo_matrix_t* scaleMatrix) nothrow;
__gshared c_cairo_scaled_font_get_scale_matrixFn c_cairo_scaled_font_get_scale_matrix; ///
private alias c_cairo_scaled_font_get_typeFn = extern(C) cairo_font_type_t function(cairo_scaled_font_t* scaledFont) nothrow;
__gshared c_cairo_scaled_font_get_typeFn c_cairo_scaled_font_get_type; ///
private alias c_cairo_scaled_font_get_user_dataFn = extern(C) void* function(cairo_scaled_font_t* scaledFont, const(cairo_user_data_key_t)* key) nothrow;
__gshared c_cairo_scaled_font_get_user_dataFn c_cairo_scaled_font_get_user_data; ///
private alias c_cairo_scaled_font_glyph_extentsFn = extern(C) void function(cairo_scaled_font_t* scaledFont, const(cairo_glyph_t)* glyphs, int numGlyphs, cairo_text_extents_t* extents) nothrow;
__gshared c_cairo_scaled_font_glyph_extentsFn c_cairo_scaled_font_glyph_extents; ///
private alias c_cairo_scaled_font_referenceFn = extern(C) cairo_scaled_font_t* function(cairo_scaled_font_t* scaledFont) nothrow;
__gshared c_cairo_scaled_font_referenceFn c_cairo_scaled_font_reference; ///
private alias c_cairo_scaled_font_set_user_dataFn = extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont, const(cairo_user_data_key_t)* key, void* userData, cairo_destroy_func_t destroy) nothrow;
__gshared c_cairo_scaled_font_set_user_dataFn c_cairo_scaled_font_set_user_data; ///
private alias c_cairo_scaled_font_statusFn = extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont) nothrow;
__gshared c_cairo_scaled_font_statusFn c_cairo_scaled_font_status; ///
private alias c_cairo_scaled_font_text_extentsFn = extern(C) void function(cairo_scaled_font_t* scaledFont, const(char)* utf8, cairo_text_extents_t* extents) nothrow;
__gshared c_cairo_scaled_font_text_extentsFn c_cairo_scaled_font_text_extents; ///
private alias c_cairo_scaled_font_text_to_glyphsFn = extern(C) cairo_status_t function(cairo_scaled_font_t* scaledFont, double x, double y, const(char)* utf8, int utf8Len, cairo_glyph_t** glyphs, int* numGlyphs, cairo_text_cluster_t** clusters, int* numClusters, cairo_text_cluster_flags_t* clusterFlags) nothrow;
__gshared c_cairo_scaled_font_text_to_glyphsFn c_cairo_scaled_font_text_to_glyphs; ///

// Surface
private alias c_cairo_gobject_surface_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_surface_get_typeFn c_cairo_gobject_surface_get_type; ///
private alias c_cairo_surface_copy_pageFn = extern(C) void function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_copy_pageFn c_cairo_surface_copy_page; ///
private alias c_cairo_surface_create_for_rectangleFn = extern(C) cairo_surface_t* function(cairo_surface_t* target, double x, double y, double width, double height) nothrow;
__gshared c_cairo_surface_create_for_rectangleFn c_cairo_surface_create_for_rectangle; ///
private alias c_cairo_surface_create_observerFn = extern(C) cairo_surface_t* function(cairo_surface_t* target, cairo_surface_observer_mode_t mode) nothrow;
__gshared c_cairo_surface_create_observerFn c_cairo_surface_create_observer; ///
private alias c_cairo_surface_create_similarFn = extern(C) cairo_surface_t* function(cairo_surface_t* other, cairo_content_t content, int width, int height) nothrow;
__gshared c_cairo_surface_create_similarFn c_cairo_surface_create_similar; ///
private alias c_cairo_surface_create_similar_imageFn = extern(C) cairo_surface_t* function(cairo_surface_t* other, cairo_format_t format, int width, int height) nothrow;
__gshared c_cairo_surface_create_similar_imageFn c_cairo_surface_create_similar_image; ///
private alias c_cairo_surface_destroyFn = extern(C) void function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_destroyFn c_cairo_surface_destroy; ///
private alias c_cairo_surface_finishFn = extern(C) void function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_finishFn c_cairo_surface_finish; ///
private alias c_cairo_surface_flushFn = extern(C) void function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_flushFn c_cairo_surface_flush; ///
private alias c_cairo_surface_get_contentFn = extern(C) cairo_content_t function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_get_contentFn c_cairo_surface_get_content; ///
private alias c_cairo_surface_get_deviceFn = extern(C) cairo_device_t* function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_get_deviceFn c_cairo_surface_get_device; ///
private alias c_cairo_surface_get_device_offsetFn = extern(C) void function(cairo_surface_t* surface, double* xOffset, double* yOffset) nothrow;
__gshared c_cairo_surface_get_device_offsetFn c_cairo_surface_get_device_offset; ///
private alias c_cairo_surface_get_device_scaleFn = extern(C) void function(cairo_surface_t* surface, double* xScale, double* yScale) nothrow;
__gshared c_cairo_surface_get_device_scaleFn c_cairo_surface_get_device_scale; ///
private alias c_cairo_surface_get_fallback_resolutionFn = extern(C) void function(cairo_surface_t* surface, double* xPixelsPerInch, double* yPixelsPerInch) nothrow;
__gshared c_cairo_surface_get_fallback_resolutionFn c_cairo_surface_get_fallback_resolution; ///
private alias c_cairo_surface_get_font_optionsFn = extern(C) void function(cairo_surface_t* surface, cairo_font_options_t* options) nothrow;
__gshared c_cairo_surface_get_font_optionsFn c_cairo_surface_get_font_options; ///
private alias c_cairo_surface_get_mime_dataFn = extern(C) void function(cairo_surface_t* surface, const(char)* mimeType, const(ubyte*)* data, gulong* length) nothrow;
__gshared c_cairo_surface_get_mime_dataFn c_cairo_surface_get_mime_data; ///
private alias c_cairo_surface_get_reference_countFn = extern(C) uint function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_get_reference_countFn c_cairo_surface_get_reference_count; ///
private alias c_cairo_surface_get_typeFn = extern(C) cairo_surface_type_t function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_get_typeFn c_cairo_surface_get_type; ///
private alias c_cairo_surface_get_user_dataFn = extern(C) void* function(cairo_surface_t* surface, const(cairo_user_data_key_t)* key) nothrow;
__gshared c_cairo_surface_get_user_dataFn c_cairo_surface_get_user_data; ///
private alias c_cairo_surface_has_show_text_glyphsFn = extern(C) cairo_bool_t function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_has_show_text_glyphsFn c_cairo_surface_has_show_text_glyphs; ///
private alias c_cairo_surface_map_to_imageFn = extern(C) cairo_surface_t* function(cairo_surface_t* surface, const(cairo_rectangle_int_t)* extents) nothrow;
__gshared c_cairo_surface_map_to_imageFn c_cairo_surface_map_to_image; ///
private alias c_cairo_surface_mark_dirtyFn = extern(C) void function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_mark_dirtyFn c_cairo_surface_mark_dirty; ///
private alias c_cairo_surface_mark_dirty_rectangleFn = extern(C) void function(cairo_surface_t* surface, int x, int y, int width, int height) nothrow;
__gshared c_cairo_surface_mark_dirty_rectangleFn c_cairo_surface_mark_dirty_rectangle; ///
private alias c_cairo_surface_observer_add_fill_callbackFn = extern(C) cairo_status_t function(cairo_surface_t* abstractSurface, cairo_surface_observer_callback_t func, void* data) nothrow;
__gshared c_cairo_surface_observer_add_fill_callbackFn c_cairo_surface_observer_add_fill_callback; ///
private alias c_cairo_surface_observer_add_finish_callbackFn = extern(C) cairo_status_t function(cairo_surface_t* abstractSurface, cairo_surface_observer_callback_t func, void* data) nothrow;
__gshared c_cairo_surface_observer_add_finish_callbackFn c_cairo_surface_observer_add_finish_callback; ///
private alias c_cairo_surface_observer_add_flush_callbackFn = extern(C) cairo_status_t function(cairo_surface_t* abstractSurface, cairo_surface_observer_callback_t func, void* data) nothrow;
__gshared c_cairo_surface_observer_add_flush_callbackFn c_cairo_surface_observer_add_flush_callback; ///
private alias c_cairo_surface_observer_add_glyphs_callbackFn = extern(C) cairo_status_t function(cairo_surface_t* abstractSurface, cairo_surface_observer_callback_t func, void* data) nothrow;
__gshared c_cairo_surface_observer_add_glyphs_callbackFn c_cairo_surface_observer_add_glyphs_callback; ///
private alias c_cairo_surface_observer_add_mask_callbackFn = extern(C) cairo_status_t function(cairo_surface_t* abstractSurface, cairo_surface_observer_callback_t func, void* data) nothrow;
__gshared c_cairo_surface_observer_add_mask_callbackFn c_cairo_surface_observer_add_mask_callback; ///
private alias c_cairo_surface_observer_add_paint_callbackFn = extern(C) cairo_status_t function(cairo_surface_t* abstractSurface, cairo_surface_observer_callback_t func, void* data) nothrow;
__gshared c_cairo_surface_observer_add_paint_callbackFn c_cairo_surface_observer_add_paint_callback; ///
private alias c_cairo_surface_observer_add_stroke_callbackFn = extern(C) cairo_status_t function(cairo_surface_t* abstractSurface, cairo_surface_observer_callback_t func, void* data) nothrow;
__gshared c_cairo_surface_observer_add_stroke_callbackFn c_cairo_surface_observer_add_stroke_callback; ///
private alias c_cairo_surface_observer_elapsedFn = extern(C) double function(cairo_surface_t* abstractSurface) nothrow;
__gshared c_cairo_surface_observer_elapsedFn c_cairo_surface_observer_elapsed; ///
private alias c_cairo_surface_observer_printFn = extern(C) cairo_status_t function(cairo_surface_t* abstractSurface, cairo_write_func_t writeFunc, void* closure) nothrow;
__gshared c_cairo_surface_observer_printFn c_cairo_surface_observer_print; ///
private alias c_cairo_surface_referenceFn = extern(C) cairo_surface_t* function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_referenceFn c_cairo_surface_reference; ///
private alias c_cairo_surface_set_device_offsetFn = extern(C) void function(cairo_surface_t* surface, double xOffset, double yOffset) nothrow;
__gshared c_cairo_surface_set_device_offsetFn c_cairo_surface_set_device_offset; ///
private alias c_cairo_surface_set_device_scaleFn = extern(C) void function(cairo_surface_t* surface, double xScale, double yScale) nothrow;
__gshared c_cairo_surface_set_device_scaleFn c_cairo_surface_set_device_scale; ///
private alias c_cairo_surface_set_fallback_resolutionFn = extern(C) void function(cairo_surface_t* surface, double xPixelsPerInch, double yPixelsPerInch) nothrow;
__gshared c_cairo_surface_set_fallback_resolutionFn c_cairo_surface_set_fallback_resolution; ///
private alias c_cairo_surface_set_mime_dataFn = extern(C) cairo_status_t function(cairo_surface_t* surface, const(char)* mimeType, const(ubyte)* data, gulong length, cairo_destroy_func_t destroy, void* closure) nothrow;
__gshared c_cairo_surface_set_mime_dataFn c_cairo_surface_set_mime_data; ///
private alias c_cairo_surface_set_user_dataFn = extern(C) cairo_status_t function(cairo_surface_t* surface, const(cairo_user_data_key_t)* key, void* userData, cairo_destroy_func_t destroy) nothrow;
__gshared c_cairo_surface_set_user_dataFn c_cairo_surface_set_user_data; ///
private alias c_cairo_surface_show_pageFn = extern(C) void function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_show_pageFn c_cairo_surface_show_page; ///
private alias c_cairo_surface_statusFn = extern(C) cairo_status_t function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_surface_statusFn c_cairo_surface_status; ///
private alias c_cairo_surface_supports_mime_typeFn = extern(C) cairo_bool_t function(cairo_surface_t* surface, const(char)* mimeType) nothrow;
__gshared c_cairo_surface_supports_mime_typeFn c_cairo_surface_supports_mime_type; ///
private alias c_cairo_surface_unmap_imageFn = extern(C) void function(cairo_surface_t* surface, cairo_surface_t* image) nothrow;
__gshared c_cairo_surface_unmap_imageFn c_cairo_surface_unmap_image; ///
private alias c_cairo_surface_write_to_pngFn = extern(C) cairo_status_t function(cairo_surface_t* surface, const(char)* filename) nothrow;
__gshared c_cairo_surface_write_to_pngFn c_cairo_surface_write_to_png; ///
private alias c_cairo_surface_write_to_png_streamFn = extern(C) cairo_status_t function(cairo_surface_t* surface, cairo_write_func_t writeFunc, void* closure) nothrow;
__gshared c_cairo_surface_write_to_png_streamFn c_cairo_surface_write_to_png_stream; ///

// TextCluster
private alias c_cairo_gobject_text_cluster_get_typeFn = extern(C) GType function() nothrow;
__gshared c_cairo_gobject_text_cluster_get_typeFn c_cairo_gobject_text_cluster_get_type; ///
private alias c_cairo_text_cluster_freeFn = extern(C) void function(cairo_text_cluster_t* clusters) nothrow;
__gshared c_cairo_text_cluster_freeFn c_cairo_text_cluster_free; ///

// global
private alias c_cairo_createFn = extern(C) cairo_t* function(cairo_surface_t* target) nothrow;
__gshared c_cairo_createFn c_cairo_create; ///
private alias c_cairo_debug_reset_static_dataFn = extern(C) void function() nothrow;
__gshared c_cairo_debug_reset_static_dataFn c_cairo_debug_reset_static_data; ///
private alias c_cairo_destroyFn = extern(C) void function(cairo_t* cr) nothrow;
__gshared c_cairo_destroyFn c_cairo_destroy; ///
private alias c_cairo_font_options_createFn = extern(C) cairo_font_options_t* function() nothrow;
__gshared c_cairo_font_options_createFn c_cairo_font_options_create; ///
private alias c_cairo_format_stride_for_widthFn = extern(C) int function(cairo_format_t format, int width) nothrow;
__gshared c_cairo_format_stride_for_widthFn c_cairo_format_stride_for_width; ///
private alias c_cairo_get_reference_countFn = extern(C) uint function(cairo_t* cr) nothrow;
__gshared c_cairo_get_reference_countFn c_cairo_get_reference_count; ///
private alias c_cairo_get_user_dataFn = extern(C) void* function(cairo_t* cr, const(cairo_user_data_key_t)* key) nothrow;
__gshared c_cairo_get_user_dataFn c_cairo_get_user_data; ///
private alias c_cairo_glyph_allocateFn = extern(C) cairo_glyph_t* function(int numGlyphs) nothrow;
__gshared c_cairo_glyph_allocateFn c_cairo_glyph_allocate; ///
private alias c_cairo_image_surface_createFn = extern(C) cairo_surface_t* function(cairo_format_t format, int width, int height) nothrow;
__gshared c_cairo_image_surface_createFn c_cairo_image_surface_create; ///
private alias c_cairo_image_surface_create_for_dataFn = extern(C) cairo_surface_t* function(ubyte* data, cairo_format_t format, int width, int height, int stride) nothrow;
__gshared c_cairo_image_surface_create_for_dataFn c_cairo_image_surface_create_for_data; ///
private alias c_cairo_image_surface_create_from_pngFn = extern(C) cairo_surface_t* function(const(char)* filename) nothrow;
__gshared c_cairo_image_surface_create_from_pngFn c_cairo_image_surface_create_from_png; ///
private alias c_cairo_image_surface_create_from_png_streamFn = extern(C) cairo_surface_t* function(cairo_read_func_t readFunc, void* closure) nothrow;
__gshared c_cairo_image_surface_create_from_png_streamFn c_cairo_image_surface_create_from_png_stream; ///
private alias c_cairo_image_surface_get_dataFn = extern(C) ubyte* function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_image_surface_get_dataFn c_cairo_image_surface_get_data; ///
private alias c_cairo_image_surface_get_formatFn = extern(C) cairo_format_t function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_image_surface_get_formatFn c_cairo_image_surface_get_format; ///
private alias c_cairo_image_surface_get_heightFn = extern(C) int function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_image_surface_get_heightFn c_cairo_image_surface_get_height; ///
private alias c_cairo_image_surface_get_strideFn = extern(C) int function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_image_surface_get_strideFn c_cairo_image_surface_get_stride; ///
private alias c_cairo_image_surface_get_widthFn = extern(C) int function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_image_surface_get_widthFn c_cairo_image_surface_get_width; ///
private alias c_cairo_mesh_pattern_begin_patchFn = extern(C) void function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_mesh_pattern_begin_patchFn c_cairo_mesh_pattern_begin_patch; ///
private alias c_cairo_mesh_pattern_curve_toFn = extern(C) void function(cairo_pattern_t* pattern, double x1, double y1, double x2, double y2, double x3, double y3) nothrow;
__gshared c_cairo_mesh_pattern_curve_toFn c_cairo_mesh_pattern_curve_to; ///
private alias c_cairo_mesh_pattern_end_patchFn = extern(C) void function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_mesh_pattern_end_patchFn c_cairo_mesh_pattern_end_patch; ///
private alias c_cairo_mesh_pattern_get_control_pointFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern, uint patchNum, uint pointNum, double* x, double* y) nothrow;
__gshared c_cairo_mesh_pattern_get_control_pointFn c_cairo_mesh_pattern_get_control_point; ///
private alias c_cairo_mesh_pattern_get_corner_color_rgbaFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern, uint patchNum, uint cornerNum, double* red, double* green, double* blue, double* alpha) nothrow;
__gshared c_cairo_mesh_pattern_get_corner_color_rgbaFn c_cairo_mesh_pattern_get_corner_color_rgba; ///
private alias c_cairo_mesh_pattern_get_patch_countFn = extern(C) cairo_status_t function(cairo_pattern_t* pattern, uint* count) nothrow;
__gshared c_cairo_mesh_pattern_get_patch_countFn c_cairo_mesh_pattern_get_patch_count; ///
private alias c_cairo_mesh_pattern_get_pathFn = extern(C) cairo_path_t* function(cairo_pattern_t* pattern, uint patchNum) nothrow;
__gshared c_cairo_mesh_pattern_get_pathFn c_cairo_mesh_pattern_get_path; ///
private alias c_cairo_mesh_pattern_line_toFn = extern(C) void function(cairo_pattern_t* pattern, double x, double y) nothrow;
__gshared c_cairo_mesh_pattern_line_toFn c_cairo_mesh_pattern_line_to; ///
private alias c_cairo_mesh_pattern_move_toFn = extern(C) void function(cairo_pattern_t* pattern, double x, double y) nothrow;
__gshared c_cairo_mesh_pattern_move_toFn c_cairo_mesh_pattern_move_to; ///
private alias c_cairo_mesh_pattern_set_control_pointFn = extern(C) void function(cairo_pattern_t* pattern, uint pointNum, double x, double y) nothrow;
__gshared c_cairo_mesh_pattern_set_control_pointFn c_cairo_mesh_pattern_set_control_point; ///
private alias c_cairo_mesh_pattern_set_corner_color_rgbFn = extern(C) void function(cairo_pattern_t* pattern, uint cornerNum, double red, double green, double blue) nothrow;
__gshared c_cairo_mesh_pattern_set_corner_color_rgbFn c_cairo_mesh_pattern_set_corner_color_rgb; ///
private alias c_cairo_mesh_pattern_set_corner_color_rgbaFn = extern(C) void function(cairo_pattern_t* pattern, uint cornerNum, double red, double green, double blue, double alpha) nothrow;
__gshared c_cairo_mesh_pattern_set_corner_color_rgbaFn c_cairo_mesh_pattern_set_corner_color_rgba; ///
private alias c_cairo_pattern_create_for_surfaceFn = extern(C) cairo_pattern_t* function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_pattern_create_for_surfaceFn c_cairo_pattern_create_for_surface; ///
private alias c_cairo_pattern_create_linearFn = extern(C) cairo_pattern_t* function(double x0, double y0, double x1, double y1) nothrow;
__gshared c_cairo_pattern_create_linearFn c_cairo_pattern_create_linear; ///
private alias c_cairo_pattern_create_meshFn = extern(C) cairo_pattern_t* function() nothrow;
__gshared c_cairo_pattern_create_meshFn c_cairo_pattern_create_mesh; ///
private alias c_cairo_pattern_create_radialFn = extern(C) cairo_pattern_t* function(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1) nothrow;
__gshared c_cairo_pattern_create_radialFn c_cairo_pattern_create_radial; ///
private alias c_cairo_pattern_create_raster_sourceFn = extern(C) cairo_pattern_t* function(void* userData, cairo_content_t content, int width, int height) nothrow;
__gshared c_cairo_pattern_create_raster_sourceFn c_cairo_pattern_create_raster_source; ///
private alias c_cairo_pattern_create_rgbFn = extern(C) cairo_pattern_t* function(double red, double green, double blue) nothrow;
__gshared c_cairo_pattern_create_rgbFn c_cairo_pattern_create_rgb; ///
private alias c_cairo_pattern_create_rgbaFn = extern(C) cairo_pattern_t* function(double red, double green, double blue, double alpha) nothrow;
__gshared c_cairo_pattern_create_rgbaFn c_cairo_pattern_create_rgba; ///
private alias c_cairo_pdf_get_versionsFn = extern(C) void function(const(cairo_pdf_version_t*)* versions, int* numVersions) nothrow;
__gshared c_cairo_pdf_get_versionsFn c_cairo_pdf_get_versions; ///
private alias c_cairo_pdf_surface_add_outlineFn = extern(C) int function(cairo_surface_t* surface, int parentId, const(char)* utf8, const(char)* linkAttribs, cairo_pdf_outline_flags_t flags) nothrow;
__gshared c_cairo_pdf_surface_add_outlineFn c_cairo_pdf_surface_add_outline; ///
private alias c_cairo_pdf_surface_createFn = extern(C) cairo_surface_t* function(const(char)* filename, double widthInPoints, double heightInPoints) nothrow;
__gshared c_cairo_pdf_surface_createFn c_cairo_pdf_surface_create; ///
private alias c_cairo_pdf_surface_create_for_streamFn = extern(C) cairo_surface_t* function(cairo_write_func_t writeFunc, void* closure, double widthInPoints, double heightInPoints) nothrow;
__gshared c_cairo_pdf_surface_create_for_streamFn c_cairo_pdf_surface_create_for_stream; ///
private alias c_cairo_pdf_surface_restrict_to_versionFn = extern(C) void function(cairo_surface_t* surface, cairo_pdf_version_t version_) nothrow;
__gshared c_cairo_pdf_surface_restrict_to_versionFn c_cairo_pdf_surface_restrict_to_version; ///
private alias c_cairo_pdf_surface_set_custom_metadataFn = extern(C) void function(cairo_surface_t* surface, const(char)* name, const(char)* value) nothrow;
__gshared c_cairo_pdf_surface_set_custom_metadataFn c_cairo_pdf_surface_set_custom_metadata; ///
private alias c_cairo_pdf_surface_set_metadataFn = extern(C) void function(cairo_surface_t* surface, cairo_pdf_metadata_t metadata, const(char)* utf8) nothrow;
__gshared c_cairo_pdf_surface_set_metadataFn c_cairo_pdf_surface_set_metadata; ///
private alias c_cairo_pdf_surface_set_page_labelFn = extern(C) void function(cairo_surface_t* surface, const(char)* utf8) nothrow;
__gshared c_cairo_pdf_surface_set_page_labelFn c_cairo_pdf_surface_set_page_label; ///
private alias c_cairo_pdf_surface_set_sizeFn = extern(C) void function(cairo_surface_t* surface, double widthInPoints, double heightInPoints) nothrow;
__gshared c_cairo_pdf_surface_set_sizeFn c_cairo_pdf_surface_set_size; ///
private alias c_cairo_pdf_surface_set_thumbnail_sizeFn = extern(C) void function(cairo_surface_t* surface, int width, int height) nothrow;
__gshared c_cairo_pdf_surface_set_thumbnail_sizeFn c_cairo_pdf_surface_set_thumbnail_size; ///
private alias c_cairo_pdf_version_to_stringFn = extern(C) const(char)* function(cairo_pdf_version_t version_) nothrow;
__gshared c_cairo_pdf_version_to_stringFn c_cairo_pdf_version_to_string; ///
private alias c_cairo_ps_get_levelsFn = extern(C) void function(const(cairo_ps_level_t*)* levels, int* numLevels) nothrow;
__gshared c_cairo_ps_get_levelsFn c_cairo_ps_get_levels; ///
private alias c_cairo_ps_level_to_stringFn = extern(C) const(char)* function(cairo_ps_level_t level) nothrow;
__gshared c_cairo_ps_level_to_stringFn c_cairo_ps_level_to_string; ///
private alias c_cairo_ps_surface_createFn = extern(C) cairo_surface_t* function(const(char)* filename, double widthInPoints, double heightInPoints) nothrow;
__gshared c_cairo_ps_surface_createFn c_cairo_ps_surface_create; ///
private alias c_cairo_ps_surface_create_for_streamFn = extern(C) cairo_surface_t* function(cairo_write_func_t writeFunc, void* closure, double widthInPoints, double heightInPoints) nothrow;
__gshared c_cairo_ps_surface_create_for_streamFn c_cairo_ps_surface_create_for_stream; ///
private alias c_cairo_ps_surface_dsc_begin_page_setupFn = extern(C) void function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_ps_surface_dsc_begin_page_setupFn c_cairo_ps_surface_dsc_begin_page_setup; ///
private alias c_cairo_ps_surface_dsc_begin_setupFn = extern(C) void function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_ps_surface_dsc_begin_setupFn c_cairo_ps_surface_dsc_begin_setup; ///
private alias c_cairo_ps_surface_dsc_commentFn = extern(C) void function(cairo_surface_t* surface, const(char)* comment) nothrow;
__gshared c_cairo_ps_surface_dsc_commentFn c_cairo_ps_surface_dsc_comment; ///
private alias c_cairo_ps_surface_get_epsFn = extern(C) cairo_bool_t function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_ps_surface_get_epsFn c_cairo_ps_surface_get_eps; ///
private alias c_cairo_ps_surface_restrict_to_levelFn = extern(C) void function(cairo_surface_t* surface, cairo_ps_level_t level) nothrow;
__gshared c_cairo_ps_surface_restrict_to_levelFn c_cairo_ps_surface_restrict_to_level; ///
private alias c_cairo_ps_surface_set_epsFn = extern(C) void function(cairo_surface_t* surface, cairo_bool_t eps) nothrow;
__gshared c_cairo_ps_surface_set_epsFn c_cairo_ps_surface_set_eps; ///
private alias c_cairo_ps_surface_set_sizeFn = extern(C) void function(cairo_surface_t* surface, double widthInPoints, double heightInPoints) nothrow;
__gshared c_cairo_ps_surface_set_sizeFn c_cairo_ps_surface_set_size; ///
private alias c_cairo_raster_source_pattern_get_acquireFn = extern(C) void function(cairo_pattern_t* pattern, cairo_raster_source_acquire_func_t* acquire, cairo_raster_source_release_func_t* release) nothrow;
__gshared c_cairo_raster_source_pattern_get_acquireFn c_cairo_raster_source_pattern_get_acquire; ///
private alias c_cairo_raster_source_pattern_get_callback_dataFn = extern(C) void* function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_raster_source_pattern_get_callback_dataFn c_cairo_raster_source_pattern_get_callback_data; ///
private alias c_cairo_raster_source_pattern_get_copyFn = extern(C) cairo_raster_source_copy_func_t function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_raster_source_pattern_get_copyFn c_cairo_raster_source_pattern_get_copy; ///
private alias c_cairo_raster_source_pattern_get_finishFn = extern(C) cairo_raster_source_finish_func_t function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_raster_source_pattern_get_finishFn c_cairo_raster_source_pattern_get_finish; ///
private alias c_cairo_raster_source_pattern_get_snapshotFn = extern(C) cairo_raster_source_snapshot_func_t function(cairo_pattern_t* pattern) nothrow;
__gshared c_cairo_raster_source_pattern_get_snapshotFn c_cairo_raster_source_pattern_get_snapshot; ///
private alias c_cairo_raster_source_pattern_set_acquireFn = extern(C) void function(cairo_pattern_t* pattern, cairo_raster_source_acquire_func_t acquire, cairo_raster_source_release_func_t release) nothrow;
__gshared c_cairo_raster_source_pattern_set_acquireFn c_cairo_raster_source_pattern_set_acquire; ///
private alias c_cairo_raster_source_pattern_set_callback_dataFn = extern(C) void function(cairo_pattern_t* pattern, void* data) nothrow;
__gshared c_cairo_raster_source_pattern_set_callback_dataFn c_cairo_raster_source_pattern_set_callback_data; ///
private alias c_cairo_raster_source_pattern_set_copyFn = extern(C) void function(cairo_pattern_t* pattern, cairo_raster_source_copy_func_t copy) nothrow;
__gshared c_cairo_raster_source_pattern_set_copyFn c_cairo_raster_source_pattern_set_copy; ///
private alias c_cairo_raster_source_pattern_set_finishFn = extern(C) void function(cairo_pattern_t* pattern, cairo_raster_source_finish_func_t finish) nothrow;
__gshared c_cairo_raster_source_pattern_set_finishFn c_cairo_raster_source_pattern_set_finish; ///
private alias c_cairo_raster_source_pattern_set_snapshotFn = extern(C) void function(cairo_pattern_t* pattern, cairo_raster_source_snapshot_func_t snapshot) nothrow;
__gshared c_cairo_raster_source_pattern_set_snapshotFn c_cairo_raster_source_pattern_set_snapshot; ///
private alias c_cairo_recording_surface_createFn = extern(C) cairo_surface_t* function(cairo_content_t content, const(cairo_rectangle_t)* extents) nothrow;
__gshared c_cairo_recording_surface_createFn c_cairo_recording_surface_create; ///
private alias c_cairo_recording_surface_get_extentsFn = extern(C) cairo_bool_t function(cairo_surface_t* surface, cairo_rectangle_t* extents) nothrow;
__gshared c_cairo_recording_surface_get_extentsFn c_cairo_recording_surface_get_extents; ///
private alias c_cairo_recording_surface_ink_extentsFn = extern(C) void function(cairo_surface_t* surface, double* x0, double* y0, double* width, double* height) nothrow;
__gshared c_cairo_recording_surface_ink_extentsFn c_cairo_recording_surface_ink_extents; ///
private alias c_cairo_referenceFn = extern(C) cairo_t* function(cairo_t* cr) nothrow;
__gshared c_cairo_referenceFn c_cairo_reference; ///
private alias c_cairo_region_createFn = extern(C) cairo_region_t* function() nothrow;
__gshared c_cairo_region_createFn c_cairo_region_create; ///
private alias c_cairo_region_create_rectangleFn = extern(C) cairo_region_t* function(const(cairo_rectangle_int_t)* rectangle) nothrow;
__gshared c_cairo_region_create_rectangleFn c_cairo_region_create_rectangle; ///
private alias c_cairo_region_create_rectanglesFn = extern(C) cairo_region_t* function(const(cairo_rectangle_int_t)* rects, int count) nothrow;
__gshared c_cairo_region_create_rectanglesFn c_cairo_region_create_rectangles; ///
private alias c_cairo_scaled_font_createFn = extern(C) cairo_scaled_font_t* function(cairo_font_face_t* fontFace, const(cairo_matrix_t)* fontMatrix, const(cairo_matrix_t)* ctm, const(cairo_font_options_t)* options) nothrow;
__gshared c_cairo_scaled_font_createFn c_cairo_scaled_font_create; ///
private alias c_cairo_script_createFn = extern(C) cairo_device_t* function(const(char)* filename) nothrow;
__gshared c_cairo_script_createFn c_cairo_script_create; ///
private alias c_cairo_script_create_for_streamFn = extern(C) cairo_device_t* function(cairo_write_func_t writeFunc, void* closure) nothrow;
__gshared c_cairo_script_create_for_streamFn c_cairo_script_create_for_stream; ///
private alias c_cairo_script_from_recording_surfaceFn = extern(C) cairo_status_t function(cairo_device_t* script, cairo_surface_t* recordingSurface) nothrow;
__gshared c_cairo_script_from_recording_surfaceFn c_cairo_script_from_recording_surface; ///
private alias c_cairo_script_get_modeFn = extern(C) cairo_script_mode_t function(cairo_device_t* script) nothrow;
__gshared c_cairo_script_get_modeFn c_cairo_script_get_mode; ///
private alias c_cairo_script_set_modeFn = extern(C) void function(cairo_device_t* script, cairo_script_mode_t mode) nothrow;
__gshared c_cairo_script_set_modeFn c_cairo_script_set_mode; ///
private alias c_cairo_script_surface_createFn = extern(C) cairo_surface_t* function(cairo_device_t* script, cairo_content_t content, double width, double height) nothrow;
__gshared c_cairo_script_surface_createFn c_cairo_script_surface_create; ///
private alias c_cairo_script_surface_create_for_targetFn = extern(C) cairo_surface_t* function(cairo_device_t* script, cairo_surface_t* target) nothrow;
__gshared c_cairo_script_surface_create_for_targetFn c_cairo_script_surface_create_for_target; ///
private alias c_cairo_script_write_commentFn = extern(C) void function(cairo_device_t* script, const(char)* comment, int len) nothrow;
__gshared c_cairo_script_write_commentFn c_cairo_script_write_comment; ///
private alias c_cairo_set_user_dataFn = extern(C) cairo_status_t function(cairo_t* cr, const(cairo_user_data_key_t)* key, void* userData, cairo_destroy_func_t destroy) nothrow;
__gshared c_cairo_set_user_dataFn c_cairo_set_user_data; ///
private alias c_cairo_status_to_stringFn = extern(C) const(char)* function(cairo_status_t status) nothrow;
__gshared c_cairo_status_to_stringFn c_cairo_status_to_string; ///
private alias c_cairo_svg_get_versionsFn = extern(C) void function(const(cairo_svg_version_t*)* versions, int* numVersions) nothrow;
__gshared c_cairo_svg_get_versionsFn c_cairo_svg_get_versions; ///
private alias c_cairo_svg_surface_createFn = extern(C) cairo_surface_t* function(const(char)* filename, double widthInPoints, double heightInPoints) nothrow;
__gshared c_cairo_svg_surface_createFn c_cairo_svg_surface_create; ///
private alias c_cairo_svg_surface_create_for_streamFn = extern(C) cairo_surface_t* function(cairo_write_func_t writeFunc, void* closure, double widthInPoints, double heightInPoints) nothrow;
__gshared c_cairo_svg_surface_create_for_streamFn c_cairo_svg_surface_create_for_stream; ///
private alias c_cairo_svg_surface_get_document_unitFn = extern(C) cairo_svg_unit_t function(cairo_surface_t* surface) nothrow;
__gshared c_cairo_svg_surface_get_document_unitFn c_cairo_svg_surface_get_document_unit; ///
private alias c_cairo_svg_surface_restrict_to_versionFn = extern(C) void function(cairo_surface_t* surface, cairo_svg_version_t version_) nothrow;
__gshared c_cairo_svg_surface_restrict_to_versionFn c_cairo_svg_surface_restrict_to_version; ///
private alias c_cairo_svg_surface_set_document_unitFn = extern(C) void function(cairo_surface_t* surface, cairo_svg_unit_t unit) nothrow;
__gshared c_cairo_svg_surface_set_document_unitFn c_cairo_svg_surface_set_document_unit; ///
private alias c_cairo_svg_version_to_stringFn = extern(C) const(char)* function(cairo_svg_version_t version_) nothrow;
__gshared c_cairo_svg_version_to_stringFn c_cairo_svg_version_to_string; ///
private alias c_cairo_tee_surface_addFn = extern(C) void function(cairo_surface_t* abstractSurface, cairo_surface_t* target) nothrow;
__gshared c_cairo_tee_surface_addFn c_cairo_tee_surface_add; ///
private alias c_cairo_tee_surface_createFn = extern(C) cairo_surface_t* function(cairo_surface_t* primary) nothrow;
__gshared c_cairo_tee_surface_createFn c_cairo_tee_surface_create; ///
private alias c_cairo_tee_surface_indexFn = extern(C) cairo_surface_t* function(cairo_surface_t* abstractSurface, uint index) nothrow;
__gshared c_cairo_tee_surface_indexFn c_cairo_tee_surface_index; ///
private alias c_cairo_tee_surface_removeFn = extern(C) void function(cairo_surface_t* abstractSurface, cairo_surface_t* target) nothrow;
__gshared c_cairo_tee_surface_removeFn c_cairo_tee_surface_remove; ///
private alias c_cairo_text_cluster_allocateFn = extern(C) cairo_text_cluster_t* function(int numClusters) nothrow;
__gshared c_cairo_text_cluster_allocateFn c_cairo_text_cluster_allocate; ///
private alias c_cairo_toy_font_face_createFn = extern(C) cairo_font_face_t* function(const(char)* family, cairo_font_slant_t slant, cairo_font_weight_t weight) nothrow;
__gshared c_cairo_toy_font_face_createFn c_cairo_toy_font_face_create; ///
private alias c_cairo_toy_font_face_get_familyFn = extern(C) const(char)* function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_toy_font_face_get_familyFn c_cairo_toy_font_face_get_family; ///
private alias c_cairo_toy_font_face_get_slantFn = extern(C) cairo_font_slant_t function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_toy_font_face_get_slantFn c_cairo_toy_font_face_get_slant; ///
private alias c_cairo_toy_font_face_get_weightFn = extern(C) cairo_font_weight_t function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_toy_font_face_get_weightFn c_cairo_toy_font_face_get_weight; ///
private alias c_cairo_user_font_face_createFn = extern(C) cairo_font_face_t* function() nothrow;
__gshared c_cairo_user_font_face_createFn c_cairo_user_font_face_create; ///
private alias c_cairo_user_font_face_get_init_funcFn = extern(C) cairo_user_scaled_font_init_func_t function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_user_font_face_get_init_funcFn c_cairo_user_font_face_get_init_func; ///
private alias c_cairo_user_font_face_get_render_color_glyph_funcFn = extern(C) cairo_user_scaled_font_render_glyph_func_t function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_user_font_face_get_render_color_glyph_funcFn c_cairo_user_font_face_get_render_color_glyph_func; ///
private alias c_cairo_user_font_face_get_render_glyph_funcFn = extern(C) cairo_user_scaled_font_render_glyph_func_t function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_user_font_face_get_render_glyph_funcFn c_cairo_user_font_face_get_render_glyph_func; ///
private alias c_cairo_user_font_face_get_text_to_glyphs_funcFn = extern(C) cairo_user_scaled_font_text_to_glyphs_func_t function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_user_font_face_get_text_to_glyphs_funcFn c_cairo_user_font_face_get_text_to_glyphs_func; ///
private alias c_cairo_user_font_face_get_unicode_to_glyph_funcFn = extern(C) cairo_user_scaled_font_unicode_to_glyph_func_t function(cairo_font_face_t* fontFace) nothrow;
__gshared c_cairo_user_font_face_get_unicode_to_glyph_funcFn c_cairo_user_font_face_get_unicode_to_glyph_func; ///
private alias c_cairo_user_font_face_set_init_funcFn = extern(C) void function(cairo_font_face_t* fontFace, cairo_user_scaled_font_init_func_t initFunc) nothrow;
__gshared c_cairo_user_font_face_set_init_funcFn c_cairo_user_font_face_set_init_func; ///
private alias c_cairo_user_font_face_set_render_color_glyph_funcFn = extern(C) void function(cairo_font_face_t* fontFace, cairo_user_scaled_font_render_glyph_func_t renderGlyphFunc) nothrow;
__gshared c_cairo_user_font_face_set_render_color_glyph_funcFn c_cairo_user_font_face_set_render_color_glyph_func; ///
private alias c_cairo_user_font_face_set_render_glyph_funcFn = extern(C) void function(cairo_font_face_t* fontFace, cairo_user_scaled_font_render_glyph_func_t renderGlyphFunc) nothrow;
__gshared c_cairo_user_font_face_set_render_glyph_funcFn c_cairo_user_font_face_set_render_glyph_func; ///
private alias c_cairo_user_font_face_set_text_to_glyphs_funcFn = extern(C) void function(cairo_font_face_t* fontFace, cairo_user_scaled_font_text_to_glyphs_func_t textToGlyphsFunc) nothrow;
__gshared c_cairo_user_font_face_set_text_to_glyphs_funcFn c_cairo_user_font_face_set_text_to_glyphs_func; ///
private alias c_cairo_user_font_face_set_unicode_to_glyph_funcFn = extern(C) void function(cairo_font_face_t* fontFace, cairo_user_scaled_font_unicode_to_glyph_func_t unicodeToGlyphFunc) nothrow;
__gshared c_cairo_user_font_face_set_unicode_to_glyph_funcFn c_cairo_user_font_face_set_unicode_to_glyph_func; ///
private alias c_cairo_user_scaled_font_get_foreground_markerFn = extern(C) cairo_pattern_t* function(cairo_scaled_font_t* scaledFont) nothrow;
__gshared c_cairo_user_scaled_font_get_foreground_markerFn c_cairo_user_scaled_font_get_foreground_marker; ///
private alias c_cairo_user_scaled_font_get_foreground_sourceFn = extern(C) cairo_pattern_t* function(cairo_scaled_font_t* scaledFont) nothrow;
__gshared c_cairo_user_scaled_font_get_foreground_sourceFn c_cairo_user_scaled_font_get_foreground_source; ///
private alias c_cairo_versionFn = extern(C) int function() nothrow;
__gshared c_cairo_versionFn c_cairo_version; ///
private alias c_cairo_version_stringFn = extern(C) const(char)* function() nothrow;
__gshared c_cairo_version_stringFn c_cairo_version_string; ///

// Context

/** */
alias cairo_gobject_context_get_type = c_cairo_gobject_context_get_type;

/** */
alias cairo_append_path = c_cairo_append_path;

/** */
alias cairo_arc = c_cairo_arc;

/** */
alias cairo_arc_negative = c_cairo_arc_negative;

/** */
alias cairo_clip = c_cairo_clip;

/** */
alias cairo_clip_extents = c_cairo_clip_extents;

/** */
alias cairo_clip_preserve = c_cairo_clip_preserve;

/** */
alias cairo_close_path = c_cairo_close_path;

/** */
alias cairo_copy_clip_rectangle_list = c_cairo_copy_clip_rectangle_list;

/** */
alias cairo_copy_page = c_cairo_copy_page;

/** */
alias cairo_copy_path = c_cairo_copy_path;

/** */
alias cairo_copy_path_flat = c_cairo_copy_path_flat;

/** */
alias cairo_curve_to = c_cairo_curve_to;

/** */
alias cairo_device_to_user = c_cairo_device_to_user;

/** */
alias cairo_device_to_user_distance = c_cairo_device_to_user_distance;

/** */
alias cairo_fill = c_cairo_fill;

/** */
alias cairo_fill_extents = c_cairo_fill_extents;

/** */
alias cairo_fill_preserve = c_cairo_fill_preserve;

/** */
alias cairo_font_extents = c_cairo_font_extents;

/** */
alias cairo_get_antialias = c_cairo_get_antialias;

/** */
alias cairo_get_current_point = c_cairo_get_current_point;

/** */
alias cairo_get_dash = c_cairo_get_dash;

/** */
alias cairo_get_dash_count = c_cairo_get_dash_count;

/** */
alias cairo_get_fill_rule = c_cairo_get_fill_rule;

/** */
alias cairo_get_font_face = c_cairo_get_font_face;

/** */
alias cairo_get_font_matrix = c_cairo_get_font_matrix;

/** */
alias cairo_get_font_options = c_cairo_get_font_options;

/** */
alias cairo_get_group_target = c_cairo_get_group_target;

/** */
alias cairo_get_hairline = c_cairo_get_hairline;

/** */
alias cairo_get_line_cap = c_cairo_get_line_cap;

/** */
alias cairo_get_line_join = c_cairo_get_line_join;

/** */
alias cairo_get_line_width = c_cairo_get_line_width;

/** */
alias cairo_get_matrix = c_cairo_get_matrix;

/** */
alias cairo_get_miter_limit = c_cairo_get_miter_limit;

/** */
alias cairo_get_operator = c_cairo_get_operator;

/** */
alias cairo_get_scaled_font = c_cairo_get_scaled_font;

/** */
alias cairo_get_source = c_cairo_get_source;

/** */
alias cairo_get_target = c_cairo_get_target;

/** */
alias cairo_get_tolerance = c_cairo_get_tolerance;

/** */
alias cairo_glyph_extents = c_cairo_glyph_extents;

/** */
alias cairo_glyph_path = c_cairo_glyph_path;

/** */
alias cairo_has_current_point = c_cairo_has_current_point;

/** */
alias cairo_identity_matrix = c_cairo_identity_matrix;

/** */
alias cairo_in_clip = c_cairo_in_clip;

/** */
alias cairo_in_fill = c_cairo_in_fill;

/** */
alias cairo_in_stroke = c_cairo_in_stroke;

/** */
alias cairo_line_to = c_cairo_line_to;

/** */
alias cairo_mask = c_cairo_mask;

/** */
alias cairo_mask_surface = c_cairo_mask_surface;

/** */
alias cairo_move_to = c_cairo_move_to;

/** */
alias cairo_new_path = c_cairo_new_path;

/** */
alias cairo_new_sub_path = c_cairo_new_sub_path;

/** */
alias cairo_paint = c_cairo_paint;

/** */
alias cairo_paint_with_alpha = c_cairo_paint_with_alpha;

/** */
alias cairo_path_extents = c_cairo_path_extents;

/** */
alias cairo_pop_group = c_cairo_pop_group;

/** */
alias cairo_pop_group_to_source = c_cairo_pop_group_to_source;

/** */
alias cairo_push_group = c_cairo_push_group;

/** */
alias cairo_push_group_with_content = c_cairo_push_group_with_content;

/** */
alias cairo_rectangle = c_cairo_rectangle;

/** */
alias cairo_rel_curve_to = c_cairo_rel_curve_to;

/** */
alias cairo_rel_line_to = c_cairo_rel_line_to;

/** */
alias cairo_rel_move_to = c_cairo_rel_move_to;

/** */
alias cairo_reset_clip = c_cairo_reset_clip;

/** */
alias cairo_restore = c_cairo_restore;

/** */
alias cairo_rotate = c_cairo_rotate;

/** */
alias cairo_save = c_cairo_save;

/** */
alias cairo_scale = c_cairo_scale;

/** */
alias cairo_select_font_face = c_cairo_select_font_face;

/** */
alias cairo_set_antialias = c_cairo_set_antialias;

/** */
alias cairo_set_dash = c_cairo_set_dash;

/** */
alias cairo_set_fill_rule = c_cairo_set_fill_rule;

/** */
alias cairo_set_font_face = c_cairo_set_font_face;

/** */
alias cairo_set_font_matrix = c_cairo_set_font_matrix;

/** */
alias cairo_set_font_options = c_cairo_set_font_options;

/** */
alias cairo_set_font_size = c_cairo_set_font_size;

/** */
alias cairo_set_hairline = c_cairo_set_hairline;

/** */
alias cairo_set_line_cap = c_cairo_set_line_cap;

/** */
alias cairo_set_line_join = c_cairo_set_line_join;

/** */
alias cairo_set_line_width = c_cairo_set_line_width;

/** */
alias cairo_set_matrix = c_cairo_set_matrix;

/** */
alias cairo_set_miter_limit = c_cairo_set_miter_limit;

/** */
alias cairo_set_operator = c_cairo_set_operator;

/** */
alias cairo_set_scaled_font = c_cairo_set_scaled_font;

/** */
alias cairo_set_source = c_cairo_set_source;

/** */
alias cairo_set_source_rgb = c_cairo_set_source_rgb;

/** */
alias cairo_set_source_rgba = c_cairo_set_source_rgba;

/** */
alias cairo_set_source_surface = c_cairo_set_source_surface;

/** */
alias cairo_set_tolerance = c_cairo_set_tolerance;

/** */
alias cairo_show_glyphs = c_cairo_show_glyphs;

/** */
alias cairo_show_page = c_cairo_show_page;

/** */
alias cairo_show_text = c_cairo_show_text;

/** */
alias cairo_show_text_glyphs = c_cairo_show_text_glyphs;

/** */
alias cairo_status = c_cairo_status;

/** */
alias cairo_stroke = c_cairo_stroke;

/** */
alias cairo_stroke_extents = c_cairo_stroke_extents;

/** */
alias cairo_stroke_preserve = c_cairo_stroke_preserve;

/** */
alias cairo_tag_begin = c_cairo_tag_begin;

/** */
alias cairo_tag_end = c_cairo_tag_end;

/** */
alias cairo_text_extents = c_cairo_text_extents;

/** */
alias cairo_text_path = c_cairo_text_path;

/** */
alias cairo_transform = c_cairo_transform;

/** */
alias cairo_translate = c_cairo_translate;

/** */
alias cairo_user_to_device = c_cairo_user_to_device;

/** */
alias cairo_user_to_device_distance = c_cairo_user_to_device_distance;

// Device

/** */
alias cairo_gobject_device_get_type = c_cairo_gobject_device_get_type;

/** */
alias cairo_device_acquire = c_cairo_device_acquire;

/** */
alias cairo_device_destroy = c_cairo_device_destroy;

/** */
alias cairo_device_finish = c_cairo_device_finish;

/** */
alias cairo_device_flush = c_cairo_device_flush;

/** */
alias cairo_device_get_reference_count = c_cairo_device_get_reference_count;

/** */
alias cairo_device_get_type = c_cairo_device_get_type;

/** */
alias cairo_device_get_user_data = c_cairo_device_get_user_data;

/** */
alias cairo_device_observer_elapsed = c_cairo_device_observer_elapsed;

/** */
alias cairo_device_observer_fill_elapsed = c_cairo_device_observer_fill_elapsed;

/** */
alias cairo_device_observer_glyphs_elapsed = c_cairo_device_observer_glyphs_elapsed;

/** */
alias cairo_device_observer_mask_elapsed = c_cairo_device_observer_mask_elapsed;

/** */
alias cairo_device_observer_paint_elapsed = c_cairo_device_observer_paint_elapsed;

/** */
alias cairo_device_observer_print = c_cairo_device_observer_print;

/** */
alias cairo_device_observer_stroke_elapsed = c_cairo_device_observer_stroke_elapsed;

/** */
alias cairo_device_reference = c_cairo_device_reference;

/** */
alias cairo_device_release = c_cairo_device_release;

/** */
alias cairo_device_set_user_data = c_cairo_device_set_user_data;

/** */
alias cairo_device_status = c_cairo_device_status;

// FontFace

/** */
alias cairo_gobject_font_face_get_type = c_cairo_gobject_font_face_get_type;

/** */
alias cairo_font_face_destroy = c_cairo_font_face_destroy;

/** */
alias cairo_font_face_get_reference_count = c_cairo_font_face_get_reference_count;

/** */
alias cairo_font_face_get_type = c_cairo_font_face_get_type;

/** */
alias cairo_font_face_get_user_data = c_cairo_font_face_get_user_data;

/** */
alias cairo_font_face_reference = c_cairo_font_face_reference;

/** */
alias cairo_font_face_set_user_data = c_cairo_font_face_set_user_data;

/** */
alias cairo_font_face_status = c_cairo_font_face_status;

// FontOptions

/** */
alias cairo_gobject_font_options_get_type = c_cairo_gobject_font_options_get_type;

/** */
alias cairo_font_options_copy = c_cairo_font_options_copy;

/** */
alias cairo_font_options_destroy = c_cairo_font_options_destroy;

/** */
alias cairo_font_options_equal = c_cairo_font_options_equal;

/** */
alias cairo_font_options_get_antialias = c_cairo_font_options_get_antialias;

/** */
alias cairo_font_options_get_color_mode = c_cairo_font_options_get_color_mode;

/** */
alias cairo_font_options_get_color_palette = c_cairo_font_options_get_color_palette;

/** */
alias cairo_font_options_get_custom_palette_color = c_cairo_font_options_get_custom_palette_color;

/** */
alias cairo_font_options_get_hint_metrics = c_cairo_font_options_get_hint_metrics;

/** */
alias cairo_font_options_get_hint_style = c_cairo_font_options_get_hint_style;

/** */
alias cairo_font_options_get_subpixel_order = c_cairo_font_options_get_subpixel_order;

/** */
alias cairo_font_options_get_variations = c_cairo_font_options_get_variations;

/** */
alias cairo_font_options_hash = c_cairo_font_options_hash;

/** */
alias cairo_font_options_merge = c_cairo_font_options_merge;

/** */
alias cairo_font_options_set_antialias = c_cairo_font_options_set_antialias;

/** */
alias cairo_font_options_set_color_mode = c_cairo_font_options_set_color_mode;

/** */
alias cairo_font_options_set_color_palette = c_cairo_font_options_set_color_palette;

/** */
alias cairo_font_options_set_custom_palette_color = c_cairo_font_options_set_custom_palette_color;

/** */
alias cairo_font_options_set_hint_metrics = c_cairo_font_options_set_hint_metrics;

/** */
alias cairo_font_options_set_hint_style = c_cairo_font_options_set_hint_style;

/** */
alias cairo_font_options_set_subpixel_order = c_cairo_font_options_set_subpixel_order;

/** */
alias cairo_font_options_set_variations = c_cairo_font_options_set_variations;

/** */
alias cairo_font_options_status = c_cairo_font_options_status;

// Glyph

/** */
alias cairo_gobject_glyph_get_type = c_cairo_gobject_glyph_get_type;

/** */
alias cairo_glyph_free = c_cairo_glyph_free;

// Matrix

/** */
alias cairo_gobject_matrix_get_type = c_cairo_gobject_matrix_get_type;

/** */
alias cairo_matrix_init = c_cairo_matrix_init;

/** */
alias cairo_matrix_init_identity = c_cairo_matrix_init_identity;

/** */
alias cairo_matrix_init_rotate = c_cairo_matrix_init_rotate;

/** */
alias cairo_matrix_init_scale = c_cairo_matrix_init_scale;

/** */
alias cairo_matrix_init_translate = c_cairo_matrix_init_translate;

/** */
alias cairo_matrix_invert = c_cairo_matrix_invert;

/** */
alias cairo_matrix_multiply = c_cairo_matrix_multiply;

/** */
alias cairo_matrix_rotate = c_cairo_matrix_rotate;

/** */
alias cairo_matrix_scale = c_cairo_matrix_scale;

/** */
alias cairo_matrix_transform_distance = c_cairo_matrix_transform_distance;

/** */
alias cairo_matrix_transform_point = c_cairo_matrix_transform_point;

/** */
alias cairo_matrix_translate = c_cairo_matrix_translate;

// Path

/** */
alias cairo_gobject_path_get_type = c_cairo_gobject_path_get_type;

/** */
alias cairo_path_destroy = c_cairo_path_destroy;

// Pattern

/** */
alias cairo_gobject_pattern_get_type = c_cairo_gobject_pattern_get_type;

/** */
alias cairo_pattern_add_color_stop_rgb = c_cairo_pattern_add_color_stop_rgb;

/** */
alias cairo_pattern_add_color_stop_rgba = c_cairo_pattern_add_color_stop_rgba;

/** */
alias cairo_pattern_destroy = c_cairo_pattern_destroy;

/** */
alias cairo_pattern_get_color_stop_count = c_cairo_pattern_get_color_stop_count;

/** */
alias cairo_pattern_get_color_stop_rgba = c_cairo_pattern_get_color_stop_rgba;

/** */
alias cairo_pattern_get_dither = c_cairo_pattern_get_dither;

/** */
alias cairo_pattern_get_extend = c_cairo_pattern_get_extend;

/** */
alias cairo_pattern_get_filter = c_cairo_pattern_get_filter;

/** */
alias cairo_pattern_get_linear_points = c_cairo_pattern_get_linear_points;

/** */
alias cairo_pattern_get_matrix = c_cairo_pattern_get_matrix;

/** */
alias cairo_pattern_get_radial_circles = c_cairo_pattern_get_radial_circles;

/** */
alias cairo_pattern_get_reference_count = c_cairo_pattern_get_reference_count;

/** */
alias cairo_pattern_get_rgba = c_cairo_pattern_get_rgba;

/** */
alias cairo_pattern_get_surface = c_cairo_pattern_get_surface;

/** */
alias cairo_pattern_get_type = c_cairo_pattern_get_type;

/** */
alias cairo_pattern_get_user_data = c_cairo_pattern_get_user_data;

/** */
alias cairo_pattern_reference = c_cairo_pattern_reference;

/** */
alias cairo_pattern_set_dither = c_cairo_pattern_set_dither;

/** */
alias cairo_pattern_set_extend = c_cairo_pattern_set_extend;

/** */
alias cairo_pattern_set_filter = c_cairo_pattern_set_filter;

/** */
alias cairo_pattern_set_matrix = c_cairo_pattern_set_matrix;

/** */
alias cairo_pattern_set_user_data = c_cairo_pattern_set_user_data;

/** */
alias cairo_pattern_status = c_cairo_pattern_status;

// Rectangle

/** */
alias cairo_gobject_rectangle_get_type = c_cairo_gobject_rectangle_get_type;

// RectangleInt

/** */
alias cairo_gobject_rectangle_int_get_type = c_cairo_gobject_rectangle_int_get_type;

// RectangleList

/** */
alias cairo_gobject_rectangle_list_get_type = c_cairo_gobject_rectangle_list_get_type;

/** */
alias cairo_rectangle_list_destroy = c_cairo_rectangle_list_destroy;

// Region

/** */
alias cairo_gobject_region_get_type = c_cairo_gobject_region_get_type;

/** */
alias cairo_region_contains_point = c_cairo_region_contains_point;

/** */
alias cairo_region_contains_rectangle = c_cairo_region_contains_rectangle;

/** */
alias cairo_region_copy = c_cairo_region_copy;

/** */
alias cairo_region_destroy = c_cairo_region_destroy;

/** */
alias cairo_region_equal = c_cairo_region_equal;

/** */
alias cairo_region_get_extents = c_cairo_region_get_extents;

/** */
alias cairo_region_get_rectangle = c_cairo_region_get_rectangle;

/** */
alias cairo_region_intersect = c_cairo_region_intersect;

/** */
alias cairo_region_intersect_rectangle = c_cairo_region_intersect_rectangle;

/** */
alias cairo_region_is_empty = c_cairo_region_is_empty;

/** */
alias cairo_region_num_rectangles = c_cairo_region_num_rectangles;

/** */
alias cairo_region_reference = c_cairo_region_reference;

/** */
alias cairo_region_status = c_cairo_region_status;

/** */
alias cairo_region_subtract = c_cairo_region_subtract;

/** */
alias cairo_region_subtract_rectangle = c_cairo_region_subtract_rectangle;

/** */
alias cairo_region_translate = c_cairo_region_translate;

/** */
alias cairo_region_union = c_cairo_region_union;

/** */
alias cairo_region_union_rectangle = c_cairo_region_union_rectangle;

/** */
alias cairo_region_xor = c_cairo_region_xor;

/** */
alias cairo_region_xor_rectangle = c_cairo_region_xor_rectangle;

// ScaledFont

/** */
alias cairo_gobject_scaled_font_get_type = c_cairo_gobject_scaled_font_get_type;

/** */
alias cairo_scaled_font_destroy = c_cairo_scaled_font_destroy;

/** */
alias cairo_scaled_font_extents = c_cairo_scaled_font_extents;

/** */
alias cairo_scaled_font_get_ctm = c_cairo_scaled_font_get_ctm;

/** */
alias cairo_scaled_font_get_font_face = c_cairo_scaled_font_get_font_face;

/** */
alias cairo_scaled_font_get_font_matrix = c_cairo_scaled_font_get_font_matrix;

/** */
alias cairo_scaled_font_get_font_options = c_cairo_scaled_font_get_font_options;

/** */
alias cairo_scaled_font_get_reference_count = c_cairo_scaled_font_get_reference_count;

/** */
alias cairo_scaled_font_get_scale_matrix = c_cairo_scaled_font_get_scale_matrix;

/** */
alias cairo_scaled_font_get_type = c_cairo_scaled_font_get_type;

/** */
alias cairo_scaled_font_get_user_data = c_cairo_scaled_font_get_user_data;

/** */
alias cairo_scaled_font_glyph_extents = c_cairo_scaled_font_glyph_extents;

/** */
alias cairo_scaled_font_reference = c_cairo_scaled_font_reference;

/** */
alias cairo_scaled_font_set_user_data = c_cairo_scaled_font_set_user_data;

/** */
alias cairo_scaled_font_status = c_cairo_scaled_font_status;

/** */
alias cairo_scaled_font_text_extents = c_cairo_scaled_font_text_extents;

/** */
alias cairo_scaled_font_text_to_glyphs = c_cairo_scaled_font_text_to_glyphs;

// Surface

/** */
alias cairo_gobject_surface_get_type = c_cairo_gobject_surface_get_type;

/** */
alias cairo_surface_copy_page = c_cairo_surface_copy_page;

/** */
alias cairo_surface_create_for_rectangle = c_cairo_surface_create_for_rectangle;

/** */
alias cairo_surface_create_observer = c_cairo_surface_create_observer;

/** */
alias cairo_surface_create_similar = c_cairo_surface_create_similar;

/** */
alias cairo_surface_create_similar_image = c_cairo_surface_create_similar_image;

/** */
alias cairo_surface_destroy = c_cairo_surface_destroy;

/** */
alias cairo_surface_finish = c_cairo_surface_finish;

/** */
alias cairo_surface_flush = c_cairo_surface_flush;

/** */
alias cairo_surface_get_content = c_cairo_surface_get_content;

/** */
alias cairo_surface_get_device = c_cairo_surface_get_device;

/** */
alias cairo_surface_get_device_offset = c_cairo_surface_get_device_offset;

/** */
alias cairo_surface_get_device_scale = c_cairo_surface_get_device_scale;

/** */
alias cairo_surface_get_fallback_resolution = c_cairo_surface_get_fallback_resolution;

/** */
alias cairo_surface_get_font_options = c_cairo_surface_get_font_options;

/** */
alias cairo_surface_get_mime_data = c_cairo_surface_get_mime_data;

/** */
alias cairo_surface_get_reference_count = c_cairo_surface_get_reference_count;

/** */
alias cairo_surface_get_type = c_cairo_surface_get_type;

/** */
alias cairo_surface_get_user_data = c_cairo_surface_get_user_data;

/** */
alias cairo_surface_has_show_text_glyphs = c_cairo_surface_has_show_text_glyphs;

/** */
alias cairo_surface_map_to_image = c_cairo_surface_map_to_image;

/** */
alias cairo_surface_mark_dirty = c_cairo_surface_mark_dirty;

/** */
alias cairo_surface_mark_dirty_rectangle = c_cairo_surface_mark_dirty_rectangle;

/** */
alias cairo_surface_observer_add_fill_callback = c_cairo_surface_observer_add_fill_callback;

/** */
alias cairo_surface_observer_add_finish_callback = c_cairo_surface_observer_add_finish_callback;

/** */
alias cairo_surface_observer_add_flush_callback = c_cairo_surface_observer_add_flush_callback;

/** */
alias cairo_surface_observer_add_glyphs_callback = c_cairo_surface_observer_add_glyphs_callback;

/** */
alias cairo_surface_observer_add_mask_callback = c_cairo_surface_observer_add_mask_callback;

/** */
alias cairo_surface_observer_add_paint_callback = c_cairo_surface_observer_add_paint_callback;

/** */
alias cairo_surface_observer_add_stroke_callback = c_cairo_surface_observer_add_stroke_callback;

/** */
alias cairo_surface_observer_elapsed = c_cairo_surface_observer_elapsed;

/** */
alias cairo_surface_observer_print = c_cairo_surface_observer_print;

/** */
alias cairo_surface_reference = c_cairo_surface_reference;

/** */
alias cairo_surface_set_device_offset = c_cairo_surface_set_device_offset;

/** */
alias cairo_surface_set_device_scale = c_cairo_surface_set_device_scale;

/** */
alias cairo_surface_set_fallback_resolution = c_cairo_surface_set_fallback_resolution;

/** */
alias cairo_surface_set_mime_data = c_cairo_surface_set_mime_data;

/** */
alias cairo_surface_set_user_data = c_cairo_surface_set_user_data;

/** */
alias cairo_surface_show_page = c_cairo_surface_show_page;

/** */
alias cairo_surface_status = c_cairo_surface_status;

/** */
alias cairo_surface_supports_mime_type = c_cairo_surface_supports_mime_type;

/** */
alias cairo_surface_unmap_image = c_cairo_surface_unmap_image;

/** */
alias cairo_surface_write_to_png = c_cairo_surface_write_to_png;

/** */
alias cairo_surface_write_to_png_stream = c_cairo_surface_write_to_png_stream;

// TextCluster

/** */
alias cairo_gobject_text_cluster_get_type = c_cairo_gobject_text_cluster_get_type;

/** */
alias cairo_text_cluster_free = c_cairo_text_cluster_free;

// global

/** */
alias cairo_create = c_cairo_create;

/** */
alias cairo_debug_reset_static_data = c_cairo_debug_reset_static_data;

/** */
alias cairo_destroy = c_cairo_destroy;

/** */
alias cairo_font_options_create = c_cairo_font_options_create;

/** */
alias cairo_format_stride_for_width = c_cairo_format_stride_for_width;

/** */
alias cairo_get_reference_count = c_cairo_get_reference_count;

/** */
alias cairo_get_user_data = c_cairo_get_user_data;

/** */
alias cairo_glyph_allocate = c_cairo_glyph_allocate;

/** */
alias cairo_image_surface_create = c_cairo_image_surface_create;

/** */
alias cairo_image_surface_create_for_data = c_cairo_image_surface_create_for_data;

/** */
alias cairo_image_surface_create_from_png = c_cairo_image_surface_create_from_png;

/** */
alias cairo_image_surface_create_from_png_stream = c_cairo_image_surface_create_from_png_stream;

/** */
alias cairo_image_surface_get_data = c_cairo_image_surface_get_data;

/** */
alias cairo_image_surface_get_format = c_cairo_image_surface_get_format;

/** */
alias cairo_image_surface_get_height = c_cairo_image_surface_get_height;

/** */
alias cairo_image_surface_get_stride = c_cairo_image_surface_get_stride;

/** */
alias cairo_image_surface_get_width = c_cairo_image_surface_get_width;

/** */
alias cairo_mesh_pattern_begin_patch = c_cairo_mesh_pattern_begin_patch;

/** */
alias cairo_mesh_pattern_curve_to = c_cairo_mesh_pattern_curve_to;

/** */
alias cairo_mesh_pattern_end_patch = c_cairo_mesh_pattern_end_patch;

/** */
alias cairo_mesh_pattern_get_control_point = c_cairo_mesh_pattern_get_control_point;

/** */
alias cairo_mesh_pattern_get_corner_color_rgba = c_cairo_mesh_pattern_get_corner_color_rgba;

/** */
alias cairo_mesh_pattern_get_patch_count = c_cairo_mesh_pattern_get_patch_count;

/** */
alias cairo_mesh_pattern_get_path = c_cairo_mesh_pattern_get_path;

/** */
alias cairo_mesh_pattern_line_to = c_cairo_mesh_pattern_line_to;

/** */
alias cairo_mesh_pattern_move_to = c_cairo_mesh_pattern_move_to;

/** */
alias cairo_mesh_pattern_set_control_point = c_cairo_mesh_pattern_set_control_point;

/** */
alias cairo_mesh_pattern_set_corner_color_rgb = c_cairo_mesh_pattern_set_corner_color_rgb;

/** */
alias cairo_mesh_pattern_set_corner_color_rgba = c_cairo_mesh_pattern_set_corner_color_rgba;

/** */
alias cairo_pattern_create_for_surface = c_cairo_pattern_create_for_surface;

/** */
alias cairo_pattern_create_linear = c_cairo_pattern_create_linear;

/** */
alias cairo_pattern_create_mesh = c_cairo_pattern_create_mesh;

/** */
alias cairo_pattern_create_radial = c_cairo_pattern_create_radial;

/** */
alias cairo_pattern_create_raster_source = c_cairo_pattern_create_raster_source;

/** */
alias cairo_pattern_create_rgb = c_cairo_pattern_create_rgb;

/** */
alias cairo_pattern_create_rgba = c_cairo_pattern_create_rgba;

/** */
alias cairo_pdf_get_versions = c_cairo_pdf_get_versions;

/** */
alias cairo_pdf_surface_add_outline = c_cairo_pdf_surface_add_outline;

/** */
alias cairo_pdf_surface_create = c_cairo_pdf_surface_create;

/** */
alias cairo_pdf_surface_create_for_stream = c_cairo_pdf_surface_create_for_stream;

/** */
alias cairo_pdf_surface_restrict_to_version = c_cairo_pdf_surface_restrict_to_version;

/** */
alias cairo_pdf_surface_set_custom_metadata = c_cairo_pdf_surface_set_custom_metadata;

/** */
alias cairo_pdf_surface_set_metadata = c_cairo_pdf_surface_set_metadata;

/** */
alias cairo_pdf_surface_set_page_label = c_cairo_pdf_surface_set_page_label;

/** */
alias cairo_pdf_surface_set_size = c_cairo_pdf_surface_set_size;

/** */
alias cairo_pdf_surface_set_thumbnail_size = c_cairo_pdf_surface_set_thumbnail_size;

/** */
alias cairo_pdf_version_to_string = c_cairo_pdf_version_to_string;

/** */
alias cairo_ps_get_levels = c_cairo_ps_get_levels;

/** */
alias cairo_ps_level_to_string = c_cairo_ps_level_to_string;

/** */
alias cairo_ps_surface_create = c_cairo_ps_surface_create;

/** */
alias cairo_ps_surface_create_for_stream = c_cairo_ps_surface_create_for_stream;

/** */
alias cairo_ps_surface_dsc_begin_page_setup = c_cairo_ps_surface_dsc_begin_page_setup;

/** */
alias cairo_ps_surface_dsc_begin_setup = c_cairo_ps_surface_dsc_begin_setup;

/** */
alias cairo_ps_surface_dsc_comment = c_cairo_ps_surface_dsc_comment;

/** */
alias cairo_ps_surface_get_eps = c_cairo_ps_surface_get_eps;

/** */
alias cairo_ps_surface_restrict_to_level = c_cairo_ps_surface_restrict_to_level;

/** */
alias cairo_ps_surface_set_eps = c_cairo_ps_surface_set_eps;

/** */
alias cairo_ps_surface_set_size = c_cairo_ps_surface_set_size;

/** */
alias cairo_raster_source_pattern_get_acquire = c_cairo_raster_source_pattern_get_acquire;

/** */
alias cairo_raster_source_pattern_get_callback_data = c_cairo_raster_source_pattern_get_callback_data;

/** */
alias cairo_raster_source_pattern_get_copy = c_cairo_raster_source_pattern_get_copy;

/** */
alias cairo_raster_source_pattern_get_finish = c_cairo_raster_source_pattern_get_finish;

/** */
alias cairo_raster_source_pattern_get_snapshot = c_cairo_raster_source_pattern_get_snapshot;

/** */
alias cairo_raster_source_pattern_set_acquire = c_cairo_raster_source_pattern_set_acquire;

/** */
alias cairo_raster_source_pattern_set_callback_data = c_cairo_raster_source_pattern_set_callback_data;

/** */
alias cairo_raster_source_pattern_set_copy = c_cairo_raster_source_pattern_set_copy;

/** */
alias cairo_raster_source_pattern_set_finish = c_cairo_raster_source_pattern_set_finish;

/** */
alias cairo_raster_source_pattern_set_snapshot = c_cairo_raster_source_pattern_set_snapshot;

/** */
alias cairo_recording_surface_create = c_cairo_recording_surface_create;

/** */
alias cairo_recording_surface_get_extents = c_cairo_recording_surface_get_extents;

/** */
alias cairo_recording_surface_ink_extents = c_cairo_recording_surface_ink_extents;

/** */
alias cairo_reference = c_cairo_reference;

/** */
alias cairo_region_create = c_cairo_region_create;

/** */
alias cairo_region_create_rectangle = c_cairo_region_create_rectangle;

/** */
alias cairo_region_create_rectangles = c_cairo_region_create_rectangles;

/** */
alias cairo_scaled_font_create = c_cairo_scaled_font_create;

/** */
alias cairo_script_create = c_cairo_script_create;

/** */
alias cairo_script_create_for_stream = c_cairo_script_create_for_stream;

/** */
alias cairo_script_from_recording_surface = c_cairo_script_from_recording_surface;

/** */
alias cairo_script_get_mode = c_cairo_script_get_mode;

/** */
alias cairo_script_set_mode = c_cairo_script_set_mode;

/** */
alias cairo_script_surface_create = c_cairo_script_surface_create;

/** */
alias cairo_script_surface_create_for_target = c_cairo_script_surface_create_for_target;

/** */
alias cairo_script_write_comment = c_cairo_script_write_comment;

/** */
alias cairo_set_user_data = c_cairo_set_user_data;

/** */
alias cairo_status_to_string = c_cairo_status_to_string;

/** */
alias cairo_svg_get_versions = c_cairo_svg_get_versions;

/** */
alias cairo_svg_surface_create = c_cairo_svg_surface_create;

/** */
alias cairo_svg_surface_create_for_stream = c_cairo_svg_surface_create_for_stream;

/** */
alias cairo_svg_surface_get_document_unit = c_cairo_svg_surface_get_document_unit;

/** */
alias cairo_svg_surface_restrict_to_version = c_cairo_svg_surface_restrict_to_version;

/** */
alias cairo_svg_surface_set_document_unit = c_cairo_svg_surface_set_document_unit;

/** */
alias cairo_svg_version_to_string = c_cairo_svg_version_to_string;

/** */
alias cairo_tee_surface_add = c_cairo_tee_surface_add;

/** */
alias cairo_tee_surface_create = c_cairo_tee_surface_create;

/** */
alias cairo_tee_surface_index = c_cairo_tee_surface_index;

/** */
alias cairo_tee_surface_remove = c_cairo_tee_surface_remove;

/** */
alias cairo_text_cluster_allocate = c_cairo_text_cluster_allocate;

/** */
alias cairo_toy_font_face_create = c_cairo_toy_font_face_create;

/** */
alias cairo_toy_font_face_get_family = c_cairo_toy_font_face_get_family;

/** */
alias cairo_toy_font_face_get_slant = c_cairo_toy_font_face_get_slant;

/** */
alias cairo_toy_font_face_get_weight = c_cairo_toy_font_face_get_weight;

/** */
alias cairo_user_font_face_create = c_cairo_user_font_face_create;

/** */
alias cairo_user_font_face_get_init_func = c_cairo_user_font_face_get_init_func;

/** */
alias cairo_user_font_face_get_render_color_glyph_func = c_cairo_user_font_face_get_render_color_glyph_func;

/** */
alias cairo_user_font_face_get_render_glyph_func = c_cairo_user_font_face_get_render_glyph_func;

/** */
alias cairo_user_font_face_get_text_to_glyphs_func = c_cairo_user_font_face_get_text_to_glyphs_func;

/** */
alias cairo_user_font_face_get_unicode_to_glyph_func = c_cairo_user_font_face_get_unicode_to_glyph_func;

/** */
alias cairo_user_font_face_set_init_func = c_cairo_user_font_face_set_init_func;

/** */
alias cairo_user_font_face_set_render_color_glyph_func = c_cairo_user_font_face_set_render_color_glyph_func;

/** */
alias cairo_user_font_face_set_render_glyph_func = c_cairo_user_font_face_set_render_glyph_func;

/** */
alias cairo_user_font_face_set_text_to_glyphs_func = c_cairo_user_font_face_set_text_to_glyphs_func;

/** */
alias cairo_user_font_face_set_unicode_to_glyph_func = c_cairo_user_font_face_set_unicode_to_glyph_func;

/** */
alias cairo_user_scaled_font_get_foreground_marker = c_cairo_user_scaled_font_get_foreground_marker;

/** */
alias cairo_user_scaled_font_get_foreground_source = c_cairo_user_scaled_font_get_foreground_source;

/** */
alias cairo_version = c_cairo_version;

/** */
alias cairo_version_string = c_cairo_version_string;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.cairo1", "cairo");

  // Context
  gidLink(cast(void**)&cairo_gobject_context_get_type, "cairo_gobject_context_get_type", libs);
  gidLink(cast(void**)&cairo_append_path, "cairo_append_path", libs);
  gidLink(cast(void**)&cairo_arc, "cairo_arc", libs);
  gidLink(cast(void**)&cairo_arc_negative, "cairo_arc_negative", libs);
  gidLink(cast(void**)&cairo_clip, "cairo_clip", libs);
  gidLink(cast(void**)&cairo_clip_extents, "cairo_clip_extents", libs);
  gidLink(cast(void**)&cairo_clip_preserve, "cairo_clip_preserve", libs);
  gidLink(cast(void**)&cairo_close_path, "cairo_close_path", libs);
  gidLink(cast(void**)&cairo_copy_clip_rectangle_list, "cairo_copy_clip_rectangle_list", libs);
  gidLink(cast(void**)&cairo_copy_page, "cairo_copy_page", libs);
  gidLink(cast(void**)&cairo_copy_path, "cairo_copy_path", libs);
  gidLink(cast(void**)&cairo_copy_path_flat, "cairo_copy_path_flat", libs);
  gidLink(cast(void**)&cairo_curve_to, "cairo_curve_to", libs);
  gidLink(cast(void**)&cairo_device_to_user, "cairo_device_to_user", libs);
  gidLink(cast(void**)&cairo_device_to_user_distance, "cairo_device_to_user_distance", libs);
  gidLink(cast(void**)&cairo_fill, "cairo_fill", libs);
  gidLink(cast(void**)&cairo_fill_extents, "cairo_fill_extents", libs);
  gidLink(cast(void**)&cairo_fill_preserve, "cairo_fill_preserve", libs);
  gidLink(cast(void**)&cairo_font_extents, "cairo_font_extents", libs);
  gidLink(cast(void**)&cairo_get_antialias, "cairo_get_antialias", libs);
  gidLink(cast(void**)&cairo_get_current_point, "cairo_get_current_point", libs);
  gidLink(cast(void**)&cairo_get_dash, "cairo_get_dash", libs);
  gidLink(cast(void**)&cairo_get_dash_count, "cairo_get_dash_count", libs);
  gidLink(cast(void**)&cairo_get_fill_rule, "cairo_get_fill_rule", libs);
  gidLink(cast(void**)&cairo_get_font_face, "cairo_get_font_face", libs);
  gidLink(cast(void**)&cairo_get_font_matrix, "cairo_get_font_matrix", libs);
  gidLink(cast(void**)&cairo_get_font_options, "cairo_get_font_options", libs);
  gidLink(cast(void**)&cairo_get_group_target, "cairo_get_group_target", libs);
  gidLink(cast(void**)&cairo_get_hairline, "cairo_get_hairline", libs);
  gidLink(cast(void**)&cairo_get_line_cap, "cairo_get_line_cap", libs);
  gidLink(cast(void**)&cairo_get_line_join, "cairo_get_line_join", libs);
  gidLink(cast(void**)&cairo_get_line_width, "cairo_get_line_width", libs);
  gidLink(cast(void**)&cairo_get_matrix, "cairo_get_matrix", libs);
  gidLink(cast(void**)&cairo_get_miter_limit, "cairo_get_miter_limit", libs);
  gidLink(cast(void**)&cairo_get_operator, "cairo_get_operator", libs);
  gidLink(cast(void**)&cairo_get_scaled_font, "cairo_get_scaled_font", libs);
  gidLink(cast(void**)&cairo_get_source, "cairo_get_source", libs);
  gidLink(cast(void**)&cairo_get_target, "cairo_get_target", libs);
  gidLink(cast(void**)&cairo_get_tolerance, "cairo_get_tolerance", libs);
  gidLink(cast(void**)&cairo_glyph_extents, "cairo_glyph_extents", libs);
  gidLink(cast(void**)&cairo_glyph_path, "cairo_glyph_path", libs);
  gidLink(cast(void**)&cairo_has_current_point, "cairo_has_current_point", libs);
  gidLink(cast(void**)&cairo_identity_matrix, "cairo_identity_matrix", libs);
  gidLink(cast(void**)&cairo_in_clip, "cairo_in_clip", libs);
  gidLink(cast(void**)&cairo_in_fill, "cairo_in_fill", libs);
  gidLink(cast(void**)&cairo_in_stroke, "cairo_in_stroke", libs);
  gidLink(cast(void**)&cairo_line_to, "cairo_line_to", libs);
  gidLink(cast(void**)&cairo_mask, "cairo_mask", libs);
  gidLink(cast(void**)&cairo_mask_surface, "cairo_mask_surface", libs);
  gidLink(cast(void**)&cairo_move_to, "cairo_move_to", libs);
  gidLink(cast(void**)&cairo_new_path, "cairo_new_path", libs);
  gidLink(cast(void**)&cairo_new_sub_path, "cairo_new_sub_path", libs);
  gidLink(cast(void**)&cairo_paint, "cairo_paint", libs);
  gidLink(cast(void**)&cairo_paint_with_alpha, "cairo_paint_with_alpha", libs);
  gidLink(cast(void**)&cairo_path_extents, "cairo_path_extents", libs);
  gidLink(cast(void**)&cairo_pop_group, "cairo_pop_group", libs);
  gidLink(cast(void**)&cairo_pop_group_to_source, "cairo_pop_group_to_source", libs);
  gidLink(cast(void**)&cairo_push_group, "cairo_push_group", libs);
  gidLink(cast(void**)&cairo_push_group_with_content, "cairo_push_group_with_content", libs);
  gidLink(cast(void**)&cairo_rectangle, "cairo_rectangle", libs);
  gidLink(cast(void**)&cairo_rel_curve_to, "cairo_rel_curve_to", libs);
  gidLink(cast(void**)&cairo_rel_line_to, "cairo_rel_line_to", libs);
  gidLink(cast(void**)&cairo_rel_move_to, "cairo_rel_move_to", libs);
  gidLink(cast(void**)&cairo_reset_clip, "cairo_reset_clip", libs);
  gidLink(cast(void**)&cairo_restore, "cairo_restore", libs);
  gidLink(cast(void**)&cairo_rotate, "cairo_rotate", libs);
  gidLink(cast(void**)&cairo_save, "cairo_save", libs);
  gidLink(cast(void**)&cairo_scale, "cairo_scale", libs);
  gidLink(cast(void**)&cairo_select_font_face, "cairo_select_font_face", libs);
  gidLink(cast(void**)&cairo_set_antialias, "cairo_set_antialias", libs);
  gidLink(cast(void**)&cairo_set_dash, "cairo_set_dash", libs);
  gidLink(cast(void**)&cairo_set_fill_rule, "cairo_set_fill_rule", libs);
  gidLink(cast(void**)&cairo_set_font_face, "cairo_set_font_face", libs);
  gidLink(cast(void**)&cairo_set_font_matrix, "cairo_set_font_matrix", libs);
  gidLink(cast(void**)&cairo_set_font_options, "cairo_set_font_options", libs);
  gidLink(cast(void**)&cairo_set_font_size, "cairo_set_font_size", libs);
  gidLink(cast(void**)&cairo_set_hairline, "cairo_set_hairline", libs);
  gidLink(cast(void**)&cairo_set_line_cap, "cairo_set_line_cap", libs);
  gidLink(cast(void**)&cairo_set_line_join, "cairo_set_line_join", libs);
  gidLink(cast(void**)&cairo_set_line_width, "cairo_set_line_width", libs);
  gidLink(cast(void**)&cairo_set_matrix, "cairo_set_matrix", libs);
  gidLink(cast(void**)&cairo_set_miter_limit, "cairo_set_miter_limit", libs);
  gidLink(cast(void**)&cairo_set_operator, "cairo_set_operator", libs);
  gidLink(cast(void**)&cairo_set_scaled_font, "cairo_set_scaled_font", libs);
  gidLink(cast(void**)&cairo_set_source, "cairo_set_source", libs);
  gidLink(cast(void**)&cairo_set_source_rgb, "cairo_set_source_rgb", libs);
  gidLink(cast(void**)&cairo_set_source_rgba, "cairo_set_source_rgba", libs);
  gidLink(cast(void**)&cairo_set_source_surface, "cairo_set_source_surface", libs);
  gidLink(cast(void**)&cairo_set_tolerance, "cairo_set_tolerance", libs);
  gidLink(cast(void**)&cairo_show_glyphs, "cairo_show_glyphs", libs);
  gidLink(cast(void**)&cairo_show_page, "cairo_show_page", libs);
  gidLink(cast(void**)&cairo_show_text, "cairo_show_text", libs);
  gidLink(cast(void**)&cairo_show_text_glyphs, "cairo_show_text_glyphs", libs);
  gidLink(cast(void**)&cairo_status, "cairo_status", libs);
  gidLink(cast(void**)&cairo_stroke, "cairo_stroke", libs);
  gidLink(cast(void**)&cairo_stroke_extents, "cairo_stroke_extents", libs);
  gidLink(cast(void**)&cairo_stroke_preserve, "cairo_stroke_preserve", libs);
  gidLink(cast(void**)&cairo_tag_begin, "cairo_tag_begin", libs);
  gidLink(cast(void**)&cairo_tag_end, "cairo_tag_end", libs);
  gidLink(cast(void**)&cairo_text_extents, "cairo_text_extents", libs);
  gidLink(cast(void**)&cairo_text_path, "cairo_text_path", libs);
  gidLink(cast(void**)&cairo_transform, "cairo_transform", libs);
  gidLink(cast(void**)&cairo_translate, "cairo_translate", libs);
  gidLink(cast(void**)&cairo_user_to_device, "cairo_user_to_device", libs);
  gidLink(cast(void**)&cairo_user_to_device_distance, "cairo_user_to_device_distance", libs);

  // Device
  gidLink(cast(void**)&cairo_gobject_device_get_type, "cairo_gobject_device_get_type", libs);
  gidLink(cast(void**)&cairo_device_acquire, "cairo_device_acquire", libs);
  gidLink(cast(void**)&cairo_device_destroy, "cairo_device_destroy", libs);
  gidLink(cast(void**)&cairo_device_finish, "cairo_device_finish", libs);
  gidLink(cast(void**)&cairo_device_flush, "cairo_device_flush", libs);
  gidLink(cast(void**)&cairo_device_get_reference_count, "cairo_device_get_reference_count", libs);
  gidLink(cast(void**)&cairo_device_get_type, "cairo_device_get_type", libs);
  gidLink(cast(void**)&cairo_device_get_user_data, "cairo_device_get_user_data", libs);
  gidLink(cast(void**)&cairo_device_observer_elapsed, "cairo_device_observer_elapsed", libs);
  gidLink(cast(void**)&cairo_device_observer_fill_elapsed, "cairo_device_observer_fill_elapsed", libs);
  gidLink(cast(void**)&cairo_device_observer_glyphs_elapsed, "cairo_device_observer_glyphs_elapsed", libs);
  gidLink(cast(void**)&cairo_device_observer_mask_elapsed, "cairo_device_observer_mask_elapsed", libs);
  gidLink(cast(void**)&cairo_device_observer_paint_elapsed, "cairo_device_observer_paint_elapsed", libs);
  gidLink(cast(void**)&cairo_device_observer_print, "cairo_device_observer_print", libs);
  gidLink(cast(void**)&cairo_device_observer_stroke_elapsed, "cairo_device_observer_stroke_elapsed", libs);
  gidLink(cast(void**)&cairo_device_reference, "cairo_device_reference", libs);
  gidLink(cast(void**)&cairo_device_release, "cairo_device_release", libs);
  gidLink(cast(void**)&cairo_device_set_user_data, "cairo_device_set_user_data", libs);
  gidLink(cast(void**)&cairo_device_status, "cairo_device_status", libs);

  // FontFace
  gidLink(cast(void**)&cairo_gobject_font_face_get_type, "cairo_gobject_font_face_get_type", libs);
  gidLink(cast(void**)&cairo_font_face_destroy, "cairo_font_face_destroy", libs);
  gidLink(cast(void**)&cairo_font_face_get_reference_count, "cairo_font_face_get_reference_count", libs);
  gidLink(cast(void**)&cairo_font_face_get_type, "cairo_font_face_get_type", libs);
  gidLink(cast(void**)&cairo_font_face_get_user_data, "cairo_font_face_get_user_data", libs);
  gidLink(cast(void**)&cairo_font_face_reference, "cairo_font_face_reference", libs);
  gidLink(cast(void**)&cairo_font_face_set_user_data, "cairo_font_face_set_user_data", libs);
  gidLink(cast(void**)&cairo_font_face_status, "cairo_font_face_status", libs);

  // FontOptions
  gidLink(cast(void**)&cairo_gobject_font_options_get_type, "cairo_gobject_font_options_get_type", libs);
  gidLink(cast(void**)&cairo_font_options_copy, "cairo_font_options_copy", libs);
  gidLink(cast(void**)&cairo_font_options_destroy, "cairo_font_options_destroy", libs);
  gidLink(cast(void**)&cairo_font_options_equal, "cairo_font_options_equal", libs);
  gidLink(cast(void**)&cairo_font_options_get_antialias, "cairo_font_options_get_antialias", libs);
  gidLink(cast(void**)&cairo_font_options_get_color_mode, "cairo_font_options_get_color_mode", libs);
  gidLink(cast(void**)&cairo_font_options_get_color_palette, "cairo_font_options_get_color_palette", libs);
  gidLink(cast(void**)&cairo_font_options_get_custom_palette_color, "cairo_font_options_get_custom_palette_color", libs);
  gidLink(cast(void**)&cairo_font_options_get_hint_metrics, "cairo_font_options_get_hint_metrics", libs);
  gidLink(cast(void**)&cairo_font_options_get_hint_style, "cairo_font_options_get_hint_style", libs);
  gidLink(cast(void**)&cairo_font_options_get_subpixel_order, "cairo_font_options_get_subpixel_order", libs);
  gidLink(cast(void**)&cairo_font_options_get_variations, "cairo_font_options_get_variations", libs);
  gidLink(cast(void**)&cairo_font_options_hash, "cairo_font_options_hash", libs);
  gidLink(cast(void**)&cairo_font_options_merge, "cairo_font_options_merge", libs);
  gidLink(cast(void**)&cairo_font_options_set_antialias, "cairo_font_options_set_antialias", libs);
  gidLink(cast(void**)&cairo_font_options_set_color_mode, "cairo_font_options_set_color_mode", libs);
  gidLink(cast(void**)&cairo_font_options_set_color_palette, "cairo_font_options_set_color_palette", libs);
  gidLink(cast(void**)&cairo_font_options_set_custom_palette_color, "cairo_font_options_set_custom_palette_color", libs);
  gidLink(cast(void**)&cairo_font_options_set_hint_metrics, "cairo_font_options_set_hint_metrics", libs);
  gidLink(cast(void**)&cairo_font_options_set_hint_style, "cairo_font_options_set_hint_style", libs);
  gidLink(cast(void**)&cairo_font_options_set_subpixel_order, "cairo_font_options_set_subpixel_order", libs);
  gidLink(cast(void**)&cairo_font_options_set_variations, "cairo_font_options_set_variations", libs);
  gidLink(cast(void**)&cairo_font_options_status, "cairo_font_options_status", libs);

  // Glyph
  gidLink(cast(void**)&cairo_gobject_glyph_get_type, "cairo_gobject_glyph_get_type", libs);
  gidLink(cast(void**)&cairo_glyph_free, "cairo_glyph_free", libs);

  // Matrix
  gidLink(cast(void**)&cairo_gobject_matrix_get_type, "cairo_gobject_matrix_get_type", libs);
  gidLink(cast(void**)&cairo_matrix_init, "cairo_matrix_init", libs);
  gidLink(cast(void**)&cairo_matrix_init_identity, "cairo_matrix_init_identity", libs);
  gidLink(cast(void**)&cairo_matrix_init_rotate, "cairo_matrix_init_rotate", libs);
  gidLink(cast(void**)&cairo_matrix_init_scale, "cairo_matrix_init_scale", libs);
  gidLink(cast(void**)&cairo_matrix_init_translate, "cairo_matrix_init_translate", libs);
  gidLink(cast(void**)&cairo_matrix_invert, "cairo_matrix_invert", libs);
  gidLink(cast(void**)&cairo_matrix_multiply, "cairo_matrix_multiply", libs);
  gidLink(cast(void**)&cairo_matrix_rotate, "cairo_matrix_rotate", libs);
  gidLink(cast(void**)&cairo_matrix_scale, "cairo_matrix_scale", libs);
  gidLink(cast(void**)&cairo_matrix_transform_distance, "cairo_matrix_transform_distance", libs);
  gidLink(cast(void**)&cairo_matrix_transform_point, "cairo_matrix_transform_point", libs);
  gidLink(cast(void**)&cairo_matrix_translate, "cairo_matrix_translate", libs);

  // Path
  gidLink(cast(void**)&cairo_gobject_path_get_type, "cairo_gobject_path_get_type", libs);
  gidLink(cast(void**)&cairo_path_destroy, "cairo_path_destroy", libs);

  // Pattern
  gidLink(cast(void**)&cairo_gobject_pattern_get_type, "cairo_gobject_pattern_get_type", libs);
  gidLink(cast(void**)&cairo_pattern_add_color_stop_rgb, "cairo_pattern_add_color_stop_rgb", libs);
  gidLink(cast(void**)&cairo_pattern_add_color_stop_rgba, "cairo_pattern_add_color_stop_rgba", libs);
  gidLink(cast(void**)&cairo_pattern_destroy, "cairo_pattern_destroy", libs);
  gidLink(cast(void**)&cairo_pattern_get_color_stop_count, "cairo_pattern_get_color_stop_count", libs);
  gidLink(cast(void**)&cairo_pattern_get_color_stop_rgba, "cairo_pattern_get_color_stop_rgba", libs);
  gidLink(cast(void**)&cairo_pattern_get_dither, "cairo_pattern_get_dither", libs);
  gidLink(cast(void**)&cairo_pattern_get_extend, "cairo_pattern_get_extend", libs);
  gidLink(cast(void**)&cairo_pattern_get_filter, "cairo_pattern_get_filter", libs);
  gidLink(cast(void**)&cairo_pattern_get_linear_points, "cairo_pattern_get_linear_points", libs);
  gidLink(cast(void**)&cairo_pattern_get_matrix, "cairo_pattern_get_matrix", libs);
  gidLink(cast(void**)&cairo_pattern_get_radial_circles, "cairo_pattern_get_radial_circles", libs);
  gidLink(cast(void**)&cairo_pattern_get_reference_count, "cairo_pattern_get_reference_count", libs);
  gidLink(cast(void**)&cairo_pattern_get_rgba, "cairo_pattern_get_rgba", libs);
  gidLink(cast(void**)&cairo_pattern_get_surface, "cairo_pattern_get_surface", libs);
  gidLink(cast(void**)&cairo_pattern_get_type, "cairo_pattern_get_type", libs);
  gidLink(cast(void**)&cairo_pattern_get_user_data, "cairo_pattern_get_user_data", libs);
  gidLink(cast(void**)&cairo_pattern_reference, "cairo_pattern_reference", libs);
  gidLink(cast(void**)&cairo_pattern_set_dither, "cairo_pattern_set_dither", libs);
  gidLink(cast(void**)&cairo_pattern_set_extend, "cairo_pattern_set_extend", libs);
  gidLink(cast(void**)&cairo_pattern_set_filter, "cairo_pattern_set_filter", libs);
  gidLink(cast(void**)&cairo_pattern_set_matrix, "cairo_pattern_set_matrix", libs);
  gidLink(cast(void**)&cairo_pattern_set_user_data, "cairo_pattern_set_user_data", libs);
  gidLink(cast(void**)&cairo_pattern_status, "cairo_pattern_status", libs);

  // Rectangle
  gidLink(cast(void**)&cairo_gobject_rectangle_get_type, "cairo_gobject_rectangle_get_type", libs);

  // RectangleInt
  gidLink(cast(void**)&cairo_gobject_rectangle_int_get_type, "cairo_gobject_rectangle_int_get_type", libs);

  // RectangleList
  gidLink(cast(void**)&cairo_gobject_rectangle_list_get_type, "cairo_gobject_rectangle_list_get_type", libs);
  gidLink(cast(void**)&cairo_rectangle_list_destroy, "cairo_rectangle_list_destroy", libs);

  // Region
  gidLink(cast(void**)&cairo_gobject_region_get_type, "cairo_gobject_region_get_type", libs);
  gidLink(cast(void**)&cairo_region_contains_point, "cairo_region_contains_point", libs);
  gidLink(cast(void**)&cairo_region_contains_rectangle, "cairo_region_contains_rectangle", libs);
  gidLink(cast(void**)&cairo_region_copy, "cairo_region_copy", libs);
  gidLink(cast(void**)&cairo_region_destroy, "cairo_region_destroy", libs);
  gidLink(cast(void**)&cairo_region_equal, "cairo_region_equal", libs);
  gidLink(cast(void**)&cairo_region_get_extents, "cairo_region_get_extents", libs);
  gidLink(cast(void**)&cairo_region_get_rectangle, "cairo_region_get_rectangle", libs);
  gidLink(cast(void**)&cairo_region_intersect, "cairo_region_intersect", libs);
  gidLink(cast(void**)&cairo_region_intersect_rectangle, "cairo_region_intersect_rectangle", libs);
  gidLink(cast(void**)&cairo_region_is_empty, "cairo_region_is_empty", libs);
  gidLink(cast(void**)&cairo_region_num_rectangles, "cairo_region_num_rectangles", libs);
  gidLink(cast(void**)&cairo_region_reference, "cairo_region_reference", libs);
  gidLink(cast(void**)&cairo_region_status, "cairo_region_status", libs);
  gidLink(cast(void**)&cairo_region_subtract, "cairo_region_subtract", libs);
  gidLink(cast(void**)&cairo_region_subtract_rectangle, "cairo_region_subtract_rectangle", libs);
  gidLink(cast(void**)&cairo_region_translate, "cairo_region_translate", libs);
  gidLink(cast(void**)&cairo_region_union, "cairo_region_union", libs);
  gidLink(cast(void**)&cairo_region_union_rectangle, "cairo_region_union_rectangle", libs);
  gidLink(cast(void**)&cairo_region_xor, "cairo_region_xor", libs);
  gidLink(cast(void**)&cairo_region_xor_rectangle, "cairo_region_xor_rectangle", libs);

  // ScaledFont
  gidLink(cast(void**)&cairo_gobject_scaled_font_get_type, "cairo_gobject_scaled_font_get_type", libs);
  gidLink(cast(void**)&cairo_scaled_font_destroy, "cairo_scaled_font_destroy", libs);
  gidLink(cast(void**)&cairo_scaled_font_extents, "cairo_scaled_font_extents", libs);
  gidLink(cast(void**)&cairo_scaled_font_get_ctm, "cairo_scaled_font_get_ctm", libs);
  gidLink(cast(void**)&cairo_scaled_font_get_font_face, "cairo_scaled_font_get_font_face", libs);
  gidLink(cast(void**)&cairo_scaled_font_get_font_matrix, "cairo_scaled_font_get_font_matrix", libs);
  gidLink(cast(void**)&cairo_scaled_font_get_font_options, "cairo_scaled_font_get_font_options", libs);
  gidLink(cast(void**)&cairo_scaled_font_get_reference_count, "cairo_scaled_font_get_reference_count", libs);
  gidLink(cast(void**)&cairo_scaled_font_get_scale_matrix, "cairo_scaled_font_get_scale_matrix", libs);
  gidLink(cast(void**)&cairo_scaled_font_get_type, "cairo_scaled_font_get_type", libs);
  gidLink(cast(void**)&cairo_scaled_font_get_user_data, "cairo_scaled_font_get_user_data", libs);
  gidLink(cast(void**)&cairo_scaled_font_glyph_extents, "cairo_scaled_font_glyph_extents", libs);
  gidLink(cast(void**)&cairo_scaled_font_reference, "cairo_scaled_font_reference", libs);
  gidLink(cast(void**)&cairo_scaled_font_set_user_data, "cairo_scaled_font_set_user_data", libs);
  gidLink(cast(void**)&cairo_scaled_font_status, "cairo_scaled_font_status", libs);
  gidLink(cast(void**)&cairo_scaled_font_text_extents, "cairo_scaled_font_text_extents", libs);
  gidLink(cast(void**)&cairo_scaled_font_text_to_glyphs, "cairo_scaled_font_text_to_glyphs", libs);

  // Surface
  gidLink(cast(void**)&cairo_gobject_surface_get_type, "cairo_gobject_surface_get_type", libs);
  gidLink(cast(void**)&cairo_surface_copy_page, "cairo_surface_copy_page", libs);
  gidLink(cast(void**)&cairo_surface_create_for_rectangle, "cairo_surface_create_for_rectangle", libs);
  gidLink(cast(void**)&cairo_surface_create_observer, "cairo_surface_create_observer", libs);
  gidLink(cast(void**)&cairo_surface_create_similar, "cairo_surface_create_similar", libs);
  gidLink(cast(void**)&cairo_surface_create_similar_image, "cairo_surface_create_similar_image", libs);
  gidLink(cast(void**)&cairo_surface_destroy, "cairo_surface_destroy", libs);
  gidLink(cast(void**)&cairo_surface_finish, "cairo_surface_finish", libs);
  gidLink(cast(void**)&cairo_surface_flush, "cairo_surface_flush", libs);
  gidLink(cast(void**)&cairo_surface_get_content, "cairo_surface_get_content", libs);
  gidLink(cast(void**)&cairo_surface_get_device, "cairo_surface_get_device", libs);
  gidLink(cast(void**)&cairo_surface_get_device_offset, "cairo_surface_get_device_offset", libs);
  gidLink(cast(void**)&cairo_surface_get_device_scale, "cairo_surface_get_device_scale", libs);
  gidLink(cast(void**)&cairo_surface_get_fallback_resolution, "cairo_surface_get_fallback_resolution", libs);
  gidLink(cast(void**)&cairo_surface_get_font_options, "cairo_surface_get_font_options", libs);
  gidLink(cast(void**)&cairo_surface_get_mime_data, "cairo_surface_get_mime_data", libs);
  gidLink(cast(void**)&cairo_surface_get_reference_count, "cairo_surface_get_reference_count", libs);
  gidLink(cast(void**)&cairo_surface_get_type, "cairo_surface_get_type", libs);
  gidLink(cast(void**)&cairo_surface_get_user_data, "cairo_surface_get_user_data", libs);
  gidLink(cast(void**)&cairo_surface_has_show_text_glyphs, "cairo_surface_has_show_text_glyphs", libs);
  gidLink(cast(void**)&cairo_surface_map_to_image, "cairo_surface_map_to_image", libs);
  gidLink(cast(void**)&cairo_surface_mark_dirty, "cairo_surface_mark_dirty", libs);
  gidLink(cast(void**)&cairo_surface_mark_dirty_rectangle, "cairo_surface_mark_dirty_rectangle", libs);
  gidLink(cast(void**)&cairo_surface_observer_add_fill_callback, "cairo_surface_observer_add_fill_callback", libs);
  gidLink(cast(void**)&cairo_surface_observer_add_finish_callback, "cairo_surface_observer_add_finish_callback", libs);
  gidLink(cast(void**)&cairo_surface_observer_add_flush_callback, "cairo_surface_observer_add_flush_callback", libs);
  gidLink(cast(void**)&cairo_surface_observer_add_glyphs_callback, "cairo_surface_observer_add_glyphs_callback", libs);
  gidLink(cast(void**)&cairo_surface_observer_add_mask_callback, "cairo_surface_observer_add_mask_callback", libs);
  gidLink(cast(void**)&cairo_surface_observer_add_paint_callback, "cairo_surface_observer_add_paint_callback", libs);
  gidLink(cast(void**)&cairo_surface_observer_add_stroke_callback, "cairo_surface_observer_add_stroke_callback", libs);
  gidLink(cast(void**)&cairo_surface_observer_elapsed, "cairo_surface_observer_elapsed", libs);
  gidLink(cast(void**)&cairo_surface_observer_print, "cairo_surface_observer_print", libs);
  gidLink(cast(void**)&cairo_surface_reference, "cairo_surface_reference", libs);
  gidLink(cast(void**)&cairo_surface_set_device_offset, "cairo_surface_set_device_offset", libs);
  gidLink(cast(void**)&cairo_surface_set_device_scale, "cairo_surface_set_device_scale", libs);
  gidLink(cast(void**)&cairo_surface_set_fallback_resolution, "cairo_surface_set_fallback_resolution", libs);
  gidLink(cast(void**)&cairo_surface_set_mime_data, "cairo_surface_set_mime_data", libs);
  gidLink(cast(void**)&cairo_surface_set_user_data, "cairo_surface_set_user_data", libs);
  gidLink(cast(void**)&cairo_surface_show_page, "cairo_surface_show_page", libs);
  gidLink(cast(void**)&cairo_surface_status, "cairo_surface_status", libs);
  gidLink(cast(void**)&cairo_surface_supports_mime_type, "cairo_surface_supports_mime_type", libs);
  gidLink(cast(void**)&cairo_surface_unmap_image, "cairo_surface_unmap_image", libs);
  gidLink(cast(void**)&cairo_surface_write_to_png, "cairo_surface_write_to_png", libs);
  gidLink(cast(void**)&cairo_surface_write_to_png_stream, "cairo_surface_write_to_png_stream", libs);

  // TextCluster
  gidLink(cast(void**)&cairo_gobject_text_cluster_get_type, "cairo_gobject_text_cluster_get_type", libs);
  gidLink(cast(void**)&cairo_text_cluster_free, "cairo_text_cluster_free", libs);

  // global
  gidLink(cast(void**)&cairo_create, "cairo_create", libs);
  gidLink(cast(void**)&cairo_debug_reset_static_data, "cairo_debug_reset_static_data", libs);
  gidLink(cast(void**)&cairo_destroy, "cairo_destroy", libs);
  gidLink(cast(void**)&cairo_font_options_create, "cairo_font_options_create", libs);
  gidLink(cast(void**)&cairo_format_stride_for_width, "cairo_format_stride_for_width", libs);
  gidLink(cast(void**)&cairo_get_reference_count, "cairo_get_reference_count", libs);
  gidLink(cast(void**)&cairo_get_user_data, "cairo_get_user_data", libs);
  gidLink(cast(void**)&cairo_glyph_allocate, "cairo_glyph_allocate", libs);
  gidLink(cast(void**)&cairo_image_surface_create, "cairo_image_surface_create", libs);
  gidLink(cast(void**)&cairo_image_surface_create_for_data, "cairo_image_surface_create_for_data", libs);
  gidLink(cast(void**)&cairo_image_surface_create_from_png, "cairo_image_surface_create_from_png", libs);
  gidLink(cast(void**)&cairo_image_surface_create_from_png_stream, "cairo_image_surface_create_from_png_stream", libs);
  gidLink(cast(void**)&cairo_image_surface_get_data, "cairo_image_surface_get_data", libs);
  gidLink(cast(void**)&cairo_image_surface_get_format, "cairo_image_surface_get_format", libs);
  gidLink(cast(void**)&cairo_image_surface_get_height, "cairo_image_surface_get_height", libs);
  gidLink(cast(void**)&cairo_image_surface_get_stride, "cairo_image_surface_get_stride", libs);
  gidLink(cast(void**)&cairo_image_surface_get_width, "cairo_image_surface_get_width", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_begin_patch, "cairo_mesh_pattern_begin_patch", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_curve_to, "cairo_mesh_pattern_curve_to", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_end_patch, "cairo_mesh_pattern_end_patch", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_get_control_point, "cairo_mesh_pattern_get_control_point", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_get_corner_color_rgba, "cairo_mesh_pattern_get_corner_color_rgba", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_get_patch_count, "cairo_mesh_pattern_get_patch_count", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_get_path, "cairo_mesh_pattern_get_path", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_line_to, "cairo_mesh_pattern_line_to", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_move_to, "cairo_mesh_pattern_move_to", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_set_control_point, "cairo_mesh_pattern_set_control_point", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_set_corner_color_rgb, "cairo_mesh_pattern_set_corner_color_rgb", libs);
  gidLink(cast(void**)&cairo_mesh_pattern_set_corner_color_rgba, "cairo_mesh_pattern_set_corner_color_rgba", libs);
  gidLink(cast(void**)&cairo_pattern_create_for_surface, "cairo_pattern_create_for_surface", libs);
  gidLink(cast(void**)&cairo_pattern_create_linear, "cairo_pattern_create_linear", libs);
  gidLink(cast(void**)&cairo_pattern_create_mesh, "cairo_pattern_create_mesh", libs);
  gidLink(cast(void**)&cairo_pattern_create_radial, "cairo_pattern_create_radial", libs);
  gidLink(cast(void**)&cairo_pattern_create_raster_source, "cairo_pattern_create_raster_source", libs);
  gidLink(cast(void**)&cairo_pattern_create_rgb, "cairo_pattern_create_rgb", libs);
  gidLink(cast(void**)&cairo_pattern_create_rgba, "cairo_pattern_create_rgba", libs);
  gidLink(cast(void**)&cairo_pdf_get_versions, "cairo_pdf_get_versions", libs);
  gidLink(cast(void**)&cairo_pdf_surface_add_outline, "cairo_pdf_surface_add_outline", libs);
  gidLink(cast(void**)&cairo_pdf_surface_create, "cairo_pdf_surface_create", libs);
  gidLink(cast(void**)&cairo_pdf_surface_create_for_stream, "cairo_pdf_surface_create_for_stream", libs);
  gidLink(cast(void**)&cairo_pdf_surface_restrict_to_version, "cairo_pdf_surface_restrict_to_version", libs);
  gidLink(cast(void**)&cairo_pdf_surface_set_custom_metadata, "cairo_pdf_surface_set_custom_metadata", libs);
  gidLink(cast(void**)&cairo_pdf_surface_set_metadata, "cairo_pdf_surface_set_metadata", libs);
  gidLink(cast(void**)&cairo_pdf_surface_set_page_label, "cairo_pdf_surface_set_page_label", libs);
  gidLink(cast(void**)&cairo_pdf_surface_set_size, "cairo_pdf_surface_set_size", libs);
  gidLink(cast(void**)&cairo_pdf_surface_set_thumbnail_size, "cairo_pdf_surface_set_thumbnail_size", libs);
  gidLink(cast(void**)&cairo_pdf_version_to_string, "cairo_pdf_version_to_string", libs);
  gidLink(cast(void**)&cairo_ps_get_levels, "cairo_ps_get_levels", libs);
  gidLink(cast(void**)&cairo_ps_level_to_string, "cairo_ps_level_to_string", libs);
  gidLink(cast(void**)&cairo_ps_surface_create, "cairo_ps_surface_create", libs);
  gidLink(cast(void**)&cairo_ps_surface_create_for_stream, "cairo_ps_surface_create_for_stream", libs);
  gidLink(cast(void**)&cairo_ps_surface_dsc_begin_page_setup, "cairo_ps_surface_dsc_begin_page_setup", libs);
  gidLink(cast(void**)&cairo_ps_surface_dsc_begin_setup, "cairo_ps_surface_dsc_begin_setup", libs);
  gidLink(cast(void**)&cairo_ps_surface_dsc_comment, "cairo_ps_surface_dsc_comment", libs);
  gidLink(cast(void**)&cairo_ps_surface_get_eps, "cairo_ps_surface_get_eps", libs);
  gidLink(cast(void**)&cairo_ps_surface_restrict_to_level, "cairo_ps_surface_restrict_to_level", libs);
  gidLink(cast(void**)&cairo_ps_surface_set_eps, "cairo_ps_surface_set_eps", libs);
  gidLink(cast(void**)&cairo_ps_surface_set_size, "cairo_ps_surface_set_size", libs);
  gidLink(cast(void**)&cairo_raster_source_pattern_get_acquire, "cairo_raster_source_pattern_get_acquire", libs);
  gidLink(cast(void**)&cairo_raster_source_pattern_get_callback_data, "cairo_raster_source_pattern_get_callback_data", libs);
  gidLink(cast(void**)&cairo_raster_source_pattern_get_copy, "cairo_raster_source_pattern_get_copy", libs);
  gidLink(cast(void**)&cairo_raster_source_pattern_get_finish, "cairo_raster_source_pattern_get_finish", libs);
  gidLink(cast(void**)&cairo_raster_source_pattern_get_snapshot, "cairo_raster_source_pattern_get_snapshot", libs);
  gidLink(cast(void**)&cairo_raster_source_pattern_set_acquire, "cairo_raster_source_pattern_set_acquire", libs);
  gidLink(cast(void**)&cairo_raster_source_pattern_set_callback_data, "cairo_raster_source_pattern_set_callback_data", libs);
  gidLink(cast(void**)&cairo_raster_source_pattern_set_copy, "cairo_raster_source_pattern_set_copy", libs);
  gidLink(cast(void**)&cairo_raster_source_pattern_set_finish, "cairo_raster_source_pattern_set_finish", libs);
  gidLink(cast(void**)&cairo_raster_source_pattern_set_snapshot, "cairo_raster_source_pattern_set_snapshot", libs);
  gidLink(cast(void**)&cairo_recording_surface_create, "cairo_recording_surface_create", libs);
  gidLink(cast(void**)&cairo_recording_surface_get_extents, "cairo_recording_surface_get_extents", libs);
  gidLink(cast(void**)&cairo_recording_surface_ink_extents, "cairo_recording_surface_ink_extents", libs);
  gidLink(cast(void**)&cairo_reference, "cairo_reference", libs);
  gidLink(cast(void**)&cairo_region_create, "cairo_region_create", libs);
  gidLink(cast(void**)&cairo_region_create_rectangle, "cairo_region_create_rectangle", libs);
  gidLink(cast(void**)&cairo_region_create_rectangles, "cairo_region_create_rectangles", libs);
  gidLink(cast(void**)&cairo_scaled_font_create, "cairo_scaled_font_create", libs);
  gidLink(cast(void**)&cairo_script_create, "cairo_script_create", libs);
  gidLink(cast(void**)&cairo_script_create_for_stream, "cairo_script_create_for_stream", libs);
  gidLink(cast(void**)&cairo_script_from_recording_surface, "cairo_script_from_recording_surface", libs);
  gidLink(cast(void**)&cairo_script_get_mode, "cairo_script_get_mode", libs);
  gidLink(cast(void**)&cairo_script_set_mode, "cairo_script_set_mode", libs);
  gidLink(cast(void**)&cairo_script_surface_create, "cairo_script_surface_create", libs);
  gidLink(cast(void**)&cairo_script_surface_create_for_target, "cairo_script_surface_create_for_target", libs);
  gidLink(cast(void**)&cairo_script_write_comment, "cairo_script_write_comment", libs);
  gidLink(cast(void**)&cairo_set_user_data, "cairo_set_user_data", libs);
  gidLink(cast(void**)&cairo_status_to_string, "cairo_status_to_string", libs);
  gidLink(cast(void**)&cairo_svg_get_versions, "cairo_svg_get_versions", libs);
  gidLink(cast(void**)&cairo_svg_surface_create, "cairo_svg_surface_create", libs);
  gidLink(cast(void**)&cairo_svg_surface_create_for_stream, "cairo_svg_surface_create_for_stream", libs);
  gidLink(cast(void**)&cairo_svg_surface_get_document_unit, "cairo_svg_surface_get_document_unit", libs);
  gidLink(cast(void**)&cairo_svg_surface_restrict_to_version, "cairo_svg_surface_restrict_to_version", libs);
  gidLink(cast(void**)&cairo_svg_surface_set_document_unit, "cairo_svg_surface_set_document_unit", libs);
  gidLink(cast(void**)&cairo_svg_version_to_string, "cairo_svg_version_to_string", libs);
  gidLink(cast(void**)&cairo_tee_surface_add, "cairo_tee_surface_add", libs);
  gidLink(cast(void**)&cairo_tee_surface_create, "cairo_tee_surface_create", libs);
  gidLink(cast(void**)&cairo_tee_surface_index, "cairo_tee_surface_index", libs);
  gidLink(cast(void**)&cairo_tee_surface_remove, "cairo_tee_surface_remove", libs);
  gidLink(cast(void**)&cairo_text_cluster_allocate, "cairo_text_cluster_allocate", libs);
  gidLink(cast(void**)&cairo_toy_font_face_create, "cairo_toy_font_face_create", libs);
  gidLink(cast(void**)&cairo_toy_font_face_get_family, "cairo_toy_font_face_get_family", libs);
  gidLink(cast(void**)&cairo_toy_font_face_get_slant, "cairo_toy_font_face_get_slant", libs);
  gidLink(cast(void**)&cairo_toy_font_face_get_weight, "cairo_toy_font_face_get_weight", libs);
  gidLink(cast(void**)&cairo_user_font_face_create, "cairo_user_font_face_create", libs);
  gidLink(cast(void**)&cairo_user_font_face_get_init_func, "cairo_user_font_face_get_init_func", libs);
  gidLink(cast(void**)&cairo_user_font_face_get_render_color_glyph_func, "cairo_user_font_face_get_render_color_glyph_func", libs);
  gidLink(cast(void**)&cairo_user_font_face_get_render_glyph_func, "cairo_user_font_face_get_render_glyph_func", libs);
  gidLink(cast(void**)&cairo_user_font_face_get_text_to_glyphs_func, "cairo_user_font_face_get_text_to_glyphs_func", libs);
  gidLink(cast(void**)&cairo_user_font_face_get_unicode_to_glyph_func, "cairo_user_font_face_get_unicode_to_glyph_func", libs);
  gidLink(cast(void**)&cairo_user_font_face_set_init_func, "cairo_user_font_face_set_init_func", libs);
  gidLink(cast(void**)&cairo_user_font_face_set_render_color_glyph_func, "cairo_user_font_face_set_render_color_glyph_func", libs);
  gidLink(cast(void**)&cairo_user_font_face_set_render_glyph_func, "cairo_user_font_face_set_render_glyph_func", libs);
  gidLink(cast(void**)&cairo_user_font_face_set_text_to_glyphs_func, "cairo_user_font_face_set_text_to_glyphs_func", libs);
  gidLink(cast(void**)&cairo_user_font_face_set_unicode_to_glyph_func, "cairo_user_font_face_set_unicode_to_glyph_func", libs);
  gidLink(cast(void**)&cairo_user_scaled_font_get_foreground_marker, "cairo_user_scaled_font_get_foreground_marker", libs);
  gidLink(cast(void**)&cairo_user_scaled_font_get_foreground_source, "cairo_user_scaled_font_get_foreground_source", libs);
  gidLink(cast(void**)&cairo_version, "cairo_version", libs);
  gidLink(cast(void**)&cairo_version_string, "cairo_version_string", libs);
}
