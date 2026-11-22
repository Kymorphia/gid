/// C functions for harfbuzz0 library
module gid.harfbuzz0.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.harfbuzz0.c.types;
static import gid.harfbuzz0.c._gidlib_HarfBuzz;
public import gid.freetype2.c.types;
public import gid.gobject2.c.types;

private immutable LIBS = ["harfbuzz-gobject_0", "harfbuzz_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.harfbuzz0.c._gidlib_HarfBuzz.gidLibLinked;

// Blob
private alias c_hb_gobject_blob_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_blob_get_typeFn c_hb_gobject_blob_get_type; ///

// Buffer
private alias c_hb_gobject_buffer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_buffer_get_typeFn c_hb_gobject_buffer_get_type; ///

// ColorLine
private alias c_hb_gobject_color_line_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_color_line_get_typeFn c_hb_gobject_color_line_get_type; ///

// ColorStop
private alias c_hb_gobject_color_stop_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_color_stop_get_typeFn c_hb_gobject_color_stop_get_type; ///

// DrawFuncs
private alias c_hb_gobject_draw_funcs_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_draw_funcs_get_typeFn c_hb_gobject_draw_funcs_get_type; ///

// Face
private alias c_hb_gobject_face_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_face_get_typeFn c_hb_gobject_face_get_type; ///

// Feature
private alias c_hb_gobject_feature_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_feature_get_typeFn c_hb_gobject_feature_get_type; ///

// Font
private alias c_hb_gobject_font_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_font_get_typeFn c_hb_gobject_font_get_type; ///

// FontFuncs
private alias c_hb_gobject_font_funcs_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_font_funcs_get_typeFn c_hb_gobject_font_funcs_get_type; ///

// Map
private alias c_hb_gobject_map_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_map_get_typeFn c_hb_gobject_map_get_type; ///

// OtMathGlyphPart
private alias c_hb_gobject_ot_math_glyph_part_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_ot_math_glyph_part_get_typeFn c_hb_gobject_ot_math_glyph_part_get_type; ///

// OtMathGlyphVariant
private alias c_hb_gobject_ot_math_glyph_variant_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_ot_math_glyph_variant_get_typeFn c_hb_gobject_ot_math_glyph_variant_get_type; ///

// OtVarAxisInfo
private alias c_hb_gobject_ot_var_axis_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_ot_var_axis_info_get_typeFn c_hb_gobject_ot_var_axis_info_get_type; ///

// PaintFuncs
private alias c_hb_gobject_paint_funcs_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_paint_funcs_get_typeFn c_hb_gobject_paint_funcs_get_type; ///

// SegmentProperties
private alias c_hb_gobject_segment_properties_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_segment_properties_get_typeFn c_hb_gobject_segment_properties_get_type; ///

// Set
private alias c_hb_gobject_set_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_set_get_typeFn c_hb_gobject_set_get_type; ///

// ShapePlan
private alias c_hb_gobject_shape_plan_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_shape_plan_get_typeFn c_hb_gobject_shape_plan_get_type; ///

// UnicodeFuncs
private alias c_hb_gobject_unicode_funcs_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_unicode_funcs_get_typeFn c_hb_gobject_unicode_funcs_get_type; ///

// UserDataKey
private alias c_hb_gobject_user_data_key_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_user_data_key_get_typeFn c_hb_gobject_user_data_key_get_type; ///

// DrawState
private alias c_hb_gobject_draw_state_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_draw_state_get_typeFn c_hb_gobject_draw_state_get_type; ///

// global
private alias c_hb_aat_layout_feature_type_get_name_idFn = extern(C) hb_ot_name_id_t function(hb_face_t* face, hb_aat_layout_feature_type_t featureType) nothrow;
__gshared c_hb_aat_layout_feature_type_get_name_idFn c_hb_aat_layout_feature_type_get_name_id; ///
private alias c_hb_aat_layout_feature_type_get_selector_infosFn = extern(C) uint function(hb_face_t* face, hb_aat_layout_feature_type_t featureType, uint startOffset, uint* selectorCount, hb_aat_layout_feature_selector_info_t* selectors, uint* defaultIndex) nothrow;
__gshared c_hb_aat_layout_feature_type_get_selector_infosFn c_hb_aat_layout_feature_type_get_selector_infos; ///
private alias c_hb_aat_layout_get_feature_typesFn = extern(C) uint function(hb_face_t* face, uint startOffset, uint* featureCount, hb_aat_layout_feature_type_t* features) nothrow;
__gshared c_hb_aat_layout_get_feature_typesFn c_hb_aat_layout_get_feature_types; ///
private alias c_hb_aat_layout_has_positioningFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_aat_layout_has_positioningFn c_hb_aat_layout_has_positioning; ///
private alias c_hb_aat_layout_has_substitutionFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_aat_layout_has_substitutionFn c_hb_aat_layout_has_substitution; ///
private alias c_hb_aat_layout_has_trackingFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_aat_layout_has_trackingFn c_hb_aat_layout_has_tracking; ///
private alias c_hb_blob_copy_writable_or_failFn = extern(C) hb_blob_t* function(hb_blob_t* blob) nothrow;
__gshared c_hb_blob_copy_writable_or_failFn c_hb_blob_copy_writable_or_fail; ///
private alias c_hb_blob_createFn = extern(C) hb_blob_t* function(const(char)* data, uint length, hb_memory_mode_t mode, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_blob_createFn c_hb_blob_create; ///
private alias c_hb_blob_create_from_fileFn = extern(C) hb_blob_t* function(const(char)* fileName) nothrow;
__gshared c_hb_blob_create_from_fileFn c_hb_blob_create_from_file; ///
private alias c_hb_blob_create_from_file_or_failFn = extern(C) hb_blob_t* function(const(char)* fileName) nothrow;
__gshared c_hb_blob_create_from_file_or_failFn c_hb_blob_create_from_file_or_fail; ///
private alias c_hb_blob_create_or_failFn = extern(C) hb_blob_t* function(const(char)* data, uint length, hb_memory_mode_t mode, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_blob_create_or_failFn c_hb_blob_create_or_fail; ///
private alias c_hb_blob_create_sub_blobFn = extern(C) hb_blob_t* function(hb_blob_t* parent, uint offset, uint length) nothrow;
__gshared c_hb_blob_create_sub_blobFn c_hb_blob_create_sub_blob; ///
private alias c_hb_blob_destroyFn = extern(C) void function(hb_blob_t* blob) nothrow;
__gshared c_hb_blob_destroyFn c_hb_blob_destroy; ///
private alias c_hb_blob_get_dataFn = extern(C) const(char)* function(hb_blob_t* blob, uint* length) nothrow;
__gshared c_hb_blob_get_dataFn c_hb_blob_get_data; ///
private alias c_hb_blob_get_data_writableFn = extern(C) char* function(hb_blob_t* blob, uint* length) nothrow;
__gshared c_hb_blob_get_data_writableFn c_hb_blob_get_data_writable; ///
private alias c_hb_blob_get_emptyFn = extern(C) hb_blob_t* function() nothrow;
__gshared c_hb_blob_get_emptyFn c_hb_blob_get_empty; ///
private alias c_hb_blob_get_lengthFn = extern(C) uint function(hb_blob_t* blob) nothrow;
__gshared c_hb_blob_get_lengthFn c_hb_blob_get_length; ///
private alias c_hb_blob_get_user_dataFn = extern(C) void* function(const(hb_blob_t)* blob, hb_user_data_key_t* key) nothrow;
__gshared c_hb_blob_get_user_dataFn c_hb_blob_get_user_data; ///
private alias c_hb_blob_is_immutableFn = extern(C) hb_bool_t function(hb_blob_t* blob) nothrow;
__gshared c_hb_blob_is_immutableFn c_hb_blob_is_immutable; ///
private alias c_hb_blob_make_immutableFn = extern(C) void function(hb_blob_t* blob) nothrow;
__gshared c_hb_blob_make_immutableFn c_hb_blob_make_immutable; ///
private alias c_hb_blob_referenceFn = extern(C) hb_blob_t* function(hb_blob_t* blob) nothrow;
__gshared c_hb_blob_referenceFn c_hb_blob_reference; ///
private alias c_hb_blob_set_user_dataFn = extern(C) hb_bool_t function(hb_blob_t* blob, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_blob_set_user_dataFn c_hb_blob_set_user_data; ///
private alias c_hb_buffer_addFn = extern(C) void function(hb_buffer_t* buffer, hb_codepoint_t codepoint, uint cluster) nothrow;
__gshared c_hb_buffer_addFn c_hb_buffer_add; ///
private alias c_hb_buffer_add_codepointsFn = extern(C) void function(hb_buffer_t* buffer, const(hb_codepoint_t)* text, int textLength, uint itemOffset, int itemLength) nothrow;
__gshared c_hb_buffer_add_codepointsFn c_hb_buffer_add_codepoints; ///
private alias c_hb_buffer_add_latin1Fn = extern(C) void function(hb_buffer_t* buffer, const(ubyte)* text, int textLength, uint itemOffset, int itemLength) nothrow;
__gshared c_hb_buffer_add_latin1Fn c_hb_buffer_add_latin1; ///
private alias c_hb_buffer_add_utf16Fn = extern(C) void function(hb_buffer_t* buffer, const(ushort)* text, int textLength, uint itemOffset, int itemLength) nothrow;
__gshared c_hb_buffer_add_utf16Fn c_hb_buffer_add_utf16; ///
private alias c_hb_buffer_add_utf32Fn = extern(C) void function(hb_buffer_t* buffer, const(uint)* text, int textLength, uint itemOffset, int itemLength) nothrow;
__gshared c_hb_buffer_add_utf32Fn c_hb_buffer_add_utf32; ///
private alias c_hb_buffer_add_utf8Fn = extern(C) void function(hb_buffer_t* buffer, const(ubyte)* text, int textLength, uint itemOffset, int itemLength) nothrow;
__gshared c_hb_buffer_add_utf8Fn c_hb_buffer_add_utf8; ///
private alias c_hb_buffer_allocation_successfulFn = extern(C) hb_bool_t function(hb_buffer_t* buffer) nothrow;
__gshared c_hb_buffer_allocation_successfulFn c_hb_buffer_allocation_successful; ///
private alias c_hb_buffer_appendFn = extern(C) void function(hb_buffer_t* buffer, const(hb_buffer_t)* source, uint start, uint end) nothrow;
__gshared c_hb_buffer_appendFn c_hb_buffer_append; ///
private alias c_hb_buffer_clear_contentsFn = extern(C) void function(hb_buffer_t* buffer) nothrow;
__gshared c_hb_buffer_clear_contentsFn c_hb_buffer_clear_contents; ///
private alias c_hb_buffer_createFn = extern(C) hb_buffer_t* function() nothrow;
__gshared c_hb_buffer_createFn c_hb_buffer_create; ///
private alias c_hb_buffer_create_similarFn = extern(C) hb_buffer_t* function(const(hb_buffer_t)* src) nothrow;
__gshared c_hb_buffer_create_similarFn c_hb_buffer_create_similar; ///
private alias c_hb_buffer_deserialize_glyphsFn = extern(C) hb_bool_t function(hb_buffer_t* buffer, const(char)* buf, int bufLen, const(char*)* endPtr, hb_font_t* font, hb_buffer_serialize_format_t format) nothrow;
__gshared c_hb_buffer_deserialize_glyphsFn c_hb_buffer_deserialize_glyphs; ///
private alias c_hb_buffer_deserialize_unicodeFn = extern(C) hb_bool_t function(hb_buffer_t* buffer, const(char)* buf, int bufLen, const(char*)* endPtr, hb_buffer_serialize_format_t format) nothrow;
__gshared c_hb_buffer_deserialize_unicodeFn c_hb_buffer_deserialize_unicode; ///
private alias c_hb_buffer_destroyFn = extern(C) void function(hb_buffer_t* buffer) nothrow;
__gshared c_hb_buffer_destroyFn c_hb_buffer_destroy; ///
private alias c_hb_buffer_diffFn = extern(C) hb_buffer_diff_flags_t function(hb_buffer_t* buffer, hb_buffer_t* reference, hb_codepoint_t dottedcircleGlyph, uint positionFuzz) nothrow;
__gshared c_hb_buffer_diffFn c_hb_buffer_diff; ///
private alias c_hb_buffer_get_cluster_levelFn = extern(C) hb_buffer_cluster_level_t function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_cluster_levelFn c_hb_buffer_get_cluster_level; ///
private alias c_hb_buffer_get_content_typeFn = extern(C) hb_buffer_content_type_t function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_content_typeFn c_hb_buffer_get_content_type; ///
private alias c_hb_buffer_get_directionFn = extern(C) hb_direction_t function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_directionFn c_hb_buffer_get_direction; ///
private alias c_hb_buffer_get_emptyFn = extern(C) hb_buffer_t* function() nothrow;
__gshared c_hb_buffer_get_emptyFn c_hb_buffer_get_empty; ///
private alias c_hb_buffer_get_flagsFn = extern(C) hb_buffer_flags_t function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_flagsFn c_hb_buffer_get_flags; ///
private alias c_hb_buffer_get_glyph_infosFn = extern(C) hb_glyph_info_t* function(hb_buffer_t* buffer, uint* length) nothrow;
__gshared c_hb_buffer_get_glyph_infosFn c_hb_buffer_get_glyph_infos; ///
private alias c_hb_buffer_get_glyph_positionsFn = extern(C) hb_glyph_position_t* function(hb_buffer_t* buffer, uint* length) nothrow;
__gshared c_hb_buffer_get_glyph_positionsFn c_hb_buffer_get_glyph_positions; ///
private alias c_hb_buffer_get_invisible_glyphFn = extern(C) hb_codepoint_t function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_invisible_glyphFn c_hb_buffer_get_invisible_glyph; ///
private alias c_hb_buffer_get_languageFn = extern(C) hb_language_t function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_languageFn c_hb_buffer_get_language; ///
private alias c_hb_buffer_get_lengthFn = extern(C) uint function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_lengthFn c_hb_buffer_get_length; ///
private alias c_hb_buffer_get_not_found_glyphFn = extern(C) hb_codepoint_t function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_not_found_glyphFn c_hb_buffer_get_not_found_glyph; ///
private alias c_hb_buffer_get_not_found_variation_selector_glyphFn = extern(C) hb_codepoint_t function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_not_found_variation_selector_glyphFn c_hb_buffer_get_not_found_variation_selector_glyph; ///
private alias c_hb_buffer_get_random_stateFn = extern(C) uint function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_random_stateFn c_hb_buffer_get_random_state; ///
private alias c_hb_buffer_get_replacement_codepointFn = extern(C) hb_codepoint_t function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_replacement_codepointFn c_hb_buffer_get_replacement_codepoint; ///
private alias c_hb_buffer_get_scriptFn = extern(C) hb_script_t function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_scriptFn c_hb_buffer_get_script; ///
private alias c_hb_buffer_get_segment_propertiesFn = extern(C) void function(const(hb_buffer_t)* buffer, hb_segment_properties_t* props) nothrow;
__gshared c_hb_buffer_get_segment_propertiesFn c_hb_buffer_get_segment_properties; ///
private alias c_hb_buffer_get_unicode_funcsFn = extern(C) hb_unicode_funcs_t* function(const(hb_buffer_t)* buffer) nothrow;
__gshared c_hb_buffer_get_unicode_funcsFn c_hb_buffer_get_unicode_funcs; ///
private alias c_hb_buffer_get_user_dataFn = extern(C) void* function(const(hb_buffer_t)* buffer, hb_user_data_key_t* key) nothrow;
__gshared c_hb_buffer_get_user_dataFn c_hb_buffer_get_user_data; ///
private alias c_hb_buffer_guess_segment_propertiesFn = extern(C) void function(hb_buffer_t* buffer) nothrow;
__gshared c_hb_buffer_guess_segment_propertiesFn c_hb_buffer_guess_segment_properties; ///
private alias c_hb_buffer_has_positionsFn = extern(C) hb_bool_t function(hb_buffer_t* buffer) nothrow;
__gshared c_hb_buffer_has_positionsFn c_hb_buffer_has_positions; ///
private alias c_hb_buffer_normalize_glyphsFn = extern(C) void function(hb_buffer_t* buffer) nothrow;
__gshared c_hb_buffer_normalize_glyphsFn c_hb_buffer_normalize_glyphs; ///
private alias c_hb_buffer_pre_allocateFn = extern(C) hb_bool_t function(hb_buffer_t* buffer, uint size) nothrow;
__gshared c_hb_buffer_pre_allocateFn c_hb_buffer_pre_allocate; ///
private alias c_hb_buffer_referenceFn = extern(C) hb_buffer_t* function(hb_buffer_t* buffer) nothrow;
__gshared c_hb_buffer_referenceFn c_hb_buffer_reference; ///
private alias c_hb_buffer_resetFn = extern(C) void function(hb_buffer_t* buffer) nothrow;
__gshared c_hb_buffer_resetFn c_hb_buffer_reset; ///
private alias c_hb_buffer_reverseFn = extern(C) void function(hb_buffer_t* buffer) nothrow;
__gshared c_hb_buffer_reverseFn c_hb_buffer_reverse; ///
private alias c_hb_buffer_reverse_clustersFn = extern(C) void function(hb_buffer_t* buffer) nothrow;
__gshared c_hb_buffer_reverse_clustersFn c_hb_buffer_reverse_clusters; ///
private alias c_hb_buffer_reverse_rangeFn = extern(C) void function(hb_buffer_t* buffer, uint start, uint end) nothrow;
__gshared c_hb_buffer_reverse_rangeFn c_hb_buffer_reverse_range; ///
private alias c_hb_buffer_serializeFn = extern(C) uint function(hb_buffer_t* buffer, uint start, uint end, ubyte* buf, uint bufSize, uint* bufConsumed, hb_font_t* font, hb_buffer_serialize_format_t format, hb_buffer_serialize_flags_t flags) nothrow;
__gshared c_hb_buffer_serializeFn c_hb_buffer_serialize; ///
private alias c_hb_buffer_serialize_format_from_stringFn = extern(C) hb_buffer_serialize_format_t function(const(ubyte)* str, int len) nothrow;
__gshared c_hb_buffer_serialize_format_from_stringFn c_hb_buffer_serialize_format_from_string; ///
private alias c_hb_buffer_serialize_format_to_stringFn = extern(C) const(char)* function(hb_buffer_serialize_format_t format) nothrow;
__gshared c_hb_buffer_serialize_format_to_stringFn c_hb_buffer_serialize_format_to_string; ///
private alias c_hb_buffer_serialize_glyphsFn = extern(C) uint function(hb_buffer_t* buffer, uint start, uint end, ubyte* buf, uint bufSize, uint* bufConsumed, hb_font_t* font, hb_buffer_serialize_format_t format, hb_buffer_serialize_flags_t flags) nothrow;
__gshared c_hb_buffer_serialize_glyphsFn c_hb_buffer_serialize_glyphs; ///
private alias c_hb_buffer_serialize_list_formatsFn = extern(C) const(char*)* function() nothrow;
__gshared c_hb_buffer_serialize_list_formatsFn c_hb_buffer_serialize_list_formats; ///
private alias c_hb_buffer_serialize_unicodeFn = extern(C) uint function(hb_buffer_t* buffer, uint start, uint end, ubyte* buf, uint bufSize, uint* bufConsumed, hb_buffer_serialize_format_t format, hb_buffer_serialize_flags_t flags) nothrow;
__gshared c_hb_buffer_serialize_unicodeFn c_hb_buffer_serialize_unicode; ///
private alias c_hb_buffer_set_cluster_levelFn = extern(C) void function(hb_buffer_t* buffer, hb_buffer_cluster_level_t clusterLevel) nothrow;
__gshared c_hb_buffer_set_cluster_levelFn c_hb_buffer_set_cluster_level; ///
private alias c_hb_buffer_set_content_typeFn = extern(C) void function(hb_buffer_t* buffer, hb_buffer_content_type_t contentType) nothrow;
__gshared c_hb_buffer_set_content_typeFn c_hb_buffer_set_content_type; ///
private alias c_hb_buffer_set_directionFn = extern(C) void function(hb_buffer_t* buffer, hb_direction_t direction) nothrow;
__gshared c_hb_buffer_set_directionFn c_hb_buffer_set_direction; ///
private alias c_hb_buffer_set_flagsFn = extern(C) void function(hb_buffer_t* buffer, hb_buffer_flags_t flags) nothrow;
__gshared c_hb_buffer_set_flagsFn c_hb_buffer_set_flags; ///
private alias c_hb_buffer_set_invisible_glyphFn = extern(C) void function(hb_buffer_t* buffer, hb_codepoint_t invisible) nothrow;
__gshared c_hb_buffer_set_invisible_glyphFn c_hb_buffer_set_invisible_glyph; ///
private alias c_hb_buffer_set_languageFn = extern(C) void function(hb_buffer_t* buffer, hb_language_t language) nothrow;
__gshared c_hb_buffer_set_languageFn c_hb_buffer_set_language; ///
private alias c_hb_buffer_set_lengthFn = extern(C) hb_bool_t function(hb_buffer_t* buffer, uint length) nothrow;
__gshared c_hb_buffer_set_lengthFn c_hb_buffer_set_length; ///
private alias c_hb_buffer_set_message_funcFn = extern(C) void function(hb_buffer_t* buffer, hb_buffer_message_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_buffer_set_message_funcFn c_hb_buffer_set_message_func; ///
private alias c_hb_buffer_set_not_found_glyphFn = extern(C) void function(hb_buffer_t* buffer, hb_codepoint_t notFound) nothrow;
__gshared c_hb_buffer_set_not_found_glyphFn c_hb_buffer_set_not_found_glyph; ///
private alias c_hb_buffer_set_not_found_variation_selector_glyphFn = extern(C) void function(hb_buffer_t* buffer, hb_codepoint_t notFoundVariationSelector) nothrow;
__gshared c_hb_buffer_set_not_found_variation_selector_glyphFn c_hb_buffer_set_not_found_variation_selector_glyph; ///
private alias c_hb_buffer_set_random_stateFn = extern(C) void function(hb_buffer_t* buffer, uint state) nothrow;
__gshared c_hb_buffer_set_random_stateFn c_hb_buffer_set_random_state; ///
private alias c_hb_buffer_set_replacement_codepointFn = extern(C) void function(hb_buffer_t* buffer, hb_codepoint_t replacement) nothrow;
__gshared c_hb_buffer_set_replacement_codepointFn c_hb_buffer_set_replacement_codepoint; ///
private alias c_hb_buffer_set_scriptFn = extern(C) void function(hb_buffer_t* buffer, hb_script_t script) nothrow;
__gshared c_hb_buffer_set_scriptFn c_hb_buffer_set_script; ///
private alias c_hb_buffer_set_segment_propertiesFn = extern(C) void function(hb_buffer_t* buffer, const(hb_segment_properties_t)* props) nothrow;
__gshared c_hb_buffer_set_segment_propertiesFn c_hb_buffer_set_segment_properties; ///
private alias c_hb_buffer_set_unicode_funcsFn = extern(C) void function(hb_buffer_t* buffer, hb_unicode_funcs_t* unicodeFuncs) nothrow;
__gshared c_hb_buffer_set_unicode_funcsFn c_hb_buffer_set_unicode_funcs; ///
private alias c_hb_buffer_set_user_dataFn = extern(C) hb_bool_t function(hb_buffer_t* buffer, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_buffer_set_user_dataFn c_hb_buffer_set_user_data; ///
private alias c_hb_callocFn = extern(C) void* function(size_t nmemb, size_t size) nothrow;
__gshared c_hb_callocFn c_hb_calloc; ///
private alias c_hb_color_get_alphaFn = extern(C) ubyte function(hb_color_t color) nothrow;
__gshared c_hb_color_get_alphaFn c_hb_color_get_alpha; ///
private alias c_hb_color_get_blueFn = extern(C) ubyte function(hb_color_t color) nothrow;
__gshared c_hb_color_get_blueFn c_hb_color_get_blue; ///
private alias c_hb_color_get_greenFn = extern(C) ubyte function(hb_color_t color) nothrow;
__gshared c_hb_color_get_greenFn c_hb_color_get_green; ///
private alias c_hb_color_get_redFn = extern(C) ubyte function(hb_color_t color) nothrow;
__gshared c_hb_color_get_redFn c_hb_color_get_red; ///
private alias c_hb_color_line_get_color_stopsFn = extern(C) uint function(hb_color_line_t* colorLine, uint start, uint* count, hb_color_stop_t* colorStops) nothrow;
__gshared c_hb_color_line_get_color_stopsFn c_hb_color_line_get_color_stops; ///
private alias c_hb_color_line_get_extendFn = extern(C) hb_paint_extend_t function(hb_color_line_t* colorLine) nothrow;
__gshared c_hb_color_line_get_extendFn c_hb_color_line_get_extend; ///
private alias c_hb_direction_from_stringFn = extern(C) hb_direction_t function(const(ubyte)* str, int len) nothrow;
__gshared c_hb_direction_from_stringFn c_hb_direction_from_string; ///
private alias c_hb_direction_to_stringFn = extern(C) const(char)* function(hb_direction_t direction) nothrow;
__gshared c_hb_direction_to_stringFn c_hb_direction_to_string; ///
private alias c_hb_draw_close_pathFn = extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st) nothrow;
__gshared c_hb_draw_close_pathFn c_hb_draw_close_path; ///
private alias c_hb_draw_cubic_toFn = extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float control1X, float control1Y, float control2X, float control2Y, float toX, float toY) nothrow;
__gshared c_hb_draw_cubic_toFn c_hb_draw_cubic_to; ///
private alias c_hb_draw_funcs_createFn = extern(C) hb_draw_funcs_t* function() nothrow;
__gshared c_hb_draw_funcs_createFn c_hb_draw_funcs_create; ///
private alias c_hb_draw_funcs_destroyFn = extern(C) void function(hb_draw_funcs_t* dfuncs) nothrow;
__gshared c_hb_draw_funcs_destroyFn c_hb_draw_funcs_destroy; ///
private alias c_hb_draw_funcs_get_emptyFn = extern(C) hb_draw_funcs_t* function() nothrow;
__gshared c_hb_draw_funcs_get_emptyFn c_hb_draw_funcs_get_empty; ///
private alias c_hb_draw_funcs_get_user_dataFn = extern(C) void* function(const(hb_draw_funcs_t)* dfuncs, hb_user_data_key_t* key) nothrow;
__gshared c_hb_draw_funcs_get_user_dataFn c_hb_draw_funcs_get_user_data; ///
private alias c_hb_draw_funcs_is_immutableFn = extern(C) hb_bool_t function(hb_draw_funcs_t* dfuncs) nothrow;
__gshared c_hb_draw_funcs_is_immutableFn c_hb_draw_funcs_is_immutable; ///
private alias c_hb_draw_funcs_make_immutableFn = extern(C) void function(hb_draw_funcs_t* dfuncs) nothrow;
__gshared c_hb_draw_funcs_make_immutableFn c_hb_draw_funcs_make_immutable; ///
private alias c_hb_draw_funcs_referenceFn = extern(C) hb_draw_funcs_t* function(hb_draw_funcs_t* dfuncs) nothrow;
__gshared c_hb_draw_funcs_referenceFn c_hb_draw_funcs_reference; ///
private alias c_hb_draw_funcs_set_close_path_funcFn = extern(C) void function(hb_draw_funcs_t* dfuncs, hb_draw_close_path_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_draw_funcs_set_close_path_funcFn c_hb_draw_funcs_set_close_path_func; ///
private alias c_hb_draw_funcs_set_cubic_to_funcFn = extern(C) void function(hb_draw_funcs_t* dfuncs, hb_draw_cubic_to_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_draw_funcs_set_cubic_to_funcFn c_hb_draw_funcs_set_cubic_to_func; ///
private alias c_hb_draw_funcs_set_line_to_funcFn = extern(C) void function(hb_draw_funcs_t* dfuncs, hb_draw_line_to_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_draw_funcs_set_line_to_funcFn c_hb_draw_funcs_set_line_to_func; ///
private alias c_hb_draw_funcs_set_move_to_funcFn = extern(C) void function(hb_draw_funcs_t* dfuncs, hb_draw_move_to_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_draw_funcs_set_move_to_funcFn c_hb_draw_funcs_set_move_to_func; ///
private alias c_hb_draw_funcs_set_quadratic_to_funcFn = extern(C) void function(hb_draw_funcs_t* dfuncs, hb_draw_quadratic_to_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_draw_funcs_set_quadratic_to_funcFn c_hb_draw_funcs_set_quadratic_to_func; ///
private alias c_hb_draw_funcs_set_user_dataFn = extern(C) hb_bool_t function(hb_draw_funcs_t* dfuncs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_draw_funcs_set_user_dataFn c_hb_draw_funcs_set_user_data; ///
private alias c_hb_draw_line_toFn = extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY) nothrow;
__gshared c_hb_draw_line_toFn c_hb_draw_line_to; ///
private alias c_hb_draw_move_toFn = extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY) nothrow;
__gshared c_hb_draw_move_toFn c_hb_draw_move_to; ///
private alias c_hb_draw_quadratic_toFn = extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float controlX, float controlY, float toX, float toY) nothrow;
__gshared c_hb_draw_quadratic_toFn c_hb_draw_quadratic_to; ///
private alias c_hb_face_builder_add_tableFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tag, hb_blob_t* blob) nothrow;
__gshared c_hb_face_builder_add_tableFn c_hb_face_builder_add_table; ///
private alias c_hb_face_builder_createFn = extern(C) hb_face_t* function() nothrow;
__gshared c_hb_face_builder_createFn c_hb_face_builder_create; ///
private alias c_hb_face_builder_sort_tablesFn = extern(C) void function(hb_face_t* face, const(hb_tag_t)* tags) nothrow;
__gshared c_hb_face_builder_sort_tablesFn c_hb_face_builder_sort_tables; ///
private alias c_hb_face_collect_nominal_glyph_mappingFn = extern(C) void function(hb_face_t* face, hb_map_t* mapping, hb_set_t* unicodes) nothrow;
__gshared c_hb_face_collect_nominal_glyph_mappingFn c_hb_face_collect_nominal_glyph_mapping; ///
private alias c_hb_face_collect_unicodesFn = extern(C) void function(hb_face_t* face, hb_set_t* out_) nothrow;
__gshared c_hb_face_collect_unicodesFn c_hb_face_collect_unicodes; ///
private alias c_hb_face_collect_variation_selectorsFn = extern(C) void function(hb_face_t* face, hb_set_t* out_) nothrow;
__gshared c_hb_face_collect_variation_selectorsFn c_hb_face_collect_variation_selectors; ///
private alias c_hb_face_collect_variation_unicodesFn = extern(C) void function(hb_face_t* face, hb_codepoint_t variationSelector, hb_set_t* out_) nothrow;
__gshared c_hb_face_collect_variation_unicodesFn c_hb_face_collect_variation_unicodes; ///
private alias c_hb_face_countFn = extern(C) uint function(hb_blob_t* blob) nothrow;
__gshared c_hb_face_countFn c_hb_face_count; ///
private alias c_hb_face_createFn = extern(C) hb_face_t* function(hb_blob_t* blob, uint index) nothrow;
__gshared c_hb_face_createFn c_hb_face_create; ///
private alias c_hb_face_create_for_tablesFn = extern(C) hb_face_t* function(hb_reference_table_func_t referenceTableFunc, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_face_create_for_tablesFn c_hb_face_create_for_tables; ///
private alias c_hb_face_create_from_file_or_failFn = extern(C) hb_face_t* function(const(char)* fileName, uint index) nothrow;
__gshared c_hb_face_create_from_file_or_failFn c_hb_face_create_from_file_or_fail; ///
private alias c_hb_face_create_from_file_or_fail_usingFn = extern(C) hb_face_t* function(const(char)* fileName, uint index, const(char)* loaderName) nothrow;
__gshared c_hb_face_create_from_file_or_fail_usingFn c_hb_face_create_from_file_or_fail_using; ///
private alias c_hb_face_create_or_failFn = extern(C) hb_face_t* function(hb_blob_t* blob, uint index) nothrow;
__gshared c_hb_face_create_or_failFn c_hb_face_create_or_fail; ///
private alias c_hb_face_create_or_fail_usingFn = extern(C) hb_face_t* function(hb_blob_t* blob, uint index, const(char)* loaderName) nothrow;
__gshared c_hb_face_create_or_fail_usingFn c_hb_face_create_or_fail_using; ///
private alias c_hb_face_destroyFn = extern(C) void function(hb_face_t* face) nothrow;
__gshared c_hb_face_destroyFn c_hb_face_destroy; ///
private alias c_hb_face_get_emptyFn = extern(C) hb_face_t* function() nothrow;
__gshared c_hb_face_get_emptyFn c_hb_face_get_empty; ///
private alias c_hb_face_get_glyph_countFn = extern(C) uint function(const(hb_face_t)* face) nothrow;
__gshared c_hb_face_get_glyph_countFn c_hb_face_get_glyph_count; ///
private alias c_hb_face_get_indexFn = extern(C) uint function(const(hb_face_t)* face) nothrow;
__gshared c_hb_face_get_indexFn c_hb_face_get_index; ///
private alias c_hb_face_get_table_tagsFn = extern(C) uint function(const(hb_face_t)* face, uint startOffset, uint* tableCount, hb_tag_t* tableTags) nothrow;
__gshared c_hb_face_get_table_tagsFn c_hb_face_get_table_tags; ///
private alias c_hb_face_get_upemFn = extern(C) uint function(const(hb_face_t)* face) nothrow;
__gshared c_hb_face_get_upemFn c_hb_face_get_upem; ///
private alias c_hb_face_get_user_dataFn = extern(C) void* function(const(hb_face_t)* face, hb_user_data_key_t* key) nothrow;
__gshared c_hb_face_get_user_dataFn c_hb_face_get_user_data; ///
private alias c_hb_face_is_immutableFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_face_is_immutableFn c_hb_face_is_immutable; ///
private alias c_hb_face_list_loadersFn = extern(C) const(char*)* function() nothrow;
__gshared c_hb_face_list_loadersFn c_hb_face_list_loaders; ///
private alias c_hb_face_make_immutableFn = extern(C) void function(hb_face_t* face) nothrow;
__gshared c_hb_face_make_immutableFn c_hb_face_make_immutable; ///
private alias c_hb_face_referenceFn = extern(C) hb_face_t* function(hb_face_t* face) nothrow;
__gshared c_hb_face_referenceFn c_hb_face_reference; ///
private alias c_hb_face_reference_blobFn = extern(C) hb_blob_t* function(hb_face_t* face) nothrow;
__gshared c_hb_face_reference_blobFn c_hb_face_reference_blob; ///
private alias c_hb_face_reference_tableFn = extern(C) hb_blob_t* function(const(hb_face_t)* face, hb_tag_t tag) nothrow;
__gshared c_hb_face_reference_tableFn c_hb_face_reference_table; ///
private alias c_hb_face_set_get_table_tags_funcFn = extern(C) void function(hb_face_t* face, hb_get_table_tags_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_face_set_get_table_tags_funcFn c_hb_face_set_get_table_tags_func; ///
private alias c_hb_face_set_glyph_countFn = extern(C) void function(hb_face_t* face, uint glyphCount) nothrow;
__gshared c_hb_face_set_glyph_countFn c_hb_face_set_glyph_count; ///
private alias c_hb_face_set_indexFn = extern(C) void function(hb_face_t* face, uint index) nothrow;
__gshared c_hb_face_set_indexFn c_hb_face_set_index; ///
private alias c_hb_face_set_upemFn = extern(C) void function(hb_face_t* face, uint upem) nothrow;
__gshared c_hb_face_set_upemFn c_hb_face_set_upem; ///
private alias c_hb_face_set_user_dataFn = extern(C) hb_bool_t function(hb_face_t* face, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_face_set_user_dataFn c_hb_face_set_user_data; ///
private alias c_hb_feature_from_stringFn = extern(C) hb_bool_t function(const(ubyte)* str, int len, hb_feature_t* feature) nothrow;
__gshared c_hb_feature_from_stringFn c_hb_feature_from_string; ///
private alias c_hb_feature_to_stringFn = extern(C) void function(hb_feature_t* feature, char* buf, uint size) nothrow;
__gshared c_hb_feature_to_stringFn c_hb_feature_to_string; ///
private alias c_hb_font_add_glyph_origin_for_directionFn = extern(C) void function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y) nothrow;
__gshared c_hb_font_add_glyph_origin_for_directionFn c_hb_font_add_glyph_origin_for_direction; ///
private alias c_hb_font_changedFn = extern(C) void function(hb_font_t* font) nothrow;
__gshared c_hb_font_changedFn c_hb_font_changed; ///
private alias c_hb_font_createFn = extern(C) hb_font_t* function(hb_face_t* face) nothrow;
__gshared c_hb_font_createFn c_hb_font_create; ///
private alias c_hb_font_create_sub_fontFn = extern(C) hb_font_t* function(hb_font_t* parent) nothrow;
__gshared c_hb_font_create_sub_fontFn c_hb_font_create_sub_font; ///
private alias c_hb_font_destroyFn = extern(C) void function(hb_font_t* font) nothrow;
__gshared c_hb_font_destroyFn c_hb_font_destroy; ///
private alias c_hb_font_draw_glyphFn = extern(C) void function(hb_font_t* font, hb_codepoint_t glyph, hb_draw_funcs_t* dfuncs, void* drawData) nothrow;
__gshared c_hb_font_draw_glyphFn c_hb_font_draw_glyph; ///
private alias c_hb_font_draw_glyph_or_failFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, hb_draw_funcs_t* dfuncs, void* drawData) nothrow;
__gshared c_hb_font_draw_glyph_or_failFn c_hb_font_draw_glyph_or_fail; ///
private alias c_hb_font_funcs_createFn = extern(C) hb_font_funcs_t* function() nothrow;
__gshared c_hb_font_funcs_createFn c_hb_font_funcs_create; ///
private alias c_hb_font_funcs_destroyFn = extern(C) void function(hb_font_funcs_t* ffuncs) nothrow;
__gshared c_hb_font_funcs_destroyFn c_hb_font_funcs_destroy; ///
private alias c_hb_font_funcs_get_emptyFn = extern(C) hb_font_funcs_t* function() nothrow;
__gshared c_hb_font_funcs_get_emptyFn c_hb_font_funcs_get_empty; ///
private alias c_hb_font_funcs_get_user_dataFn = extern(C) void* function(const(hb_font_funcs_t)* ffuncs, hb_user_data_key_t* key) nothrow;
__gshared c_hb_font_funcs_get_user_dataFn c_hb_font_funcs_get_user_data; ///
private alias c_hb_font_funcs_is_immutableFn = extern(C) hb_bool_t function(hb_font_funcs_t* ffuncs) nothrow;
__gshared c_hb_font_funcs_is_immutableFn c_hb_font_funcs_is_immutable; ///
private alias c_hb_font_funcs_make_immutableFn = extern(C) void function(hb_font_funcs_t* ffuncs) nothrow;
__gshared c_hb_font_funcs_make_immutableFn c_hb_font_funcs_make_immutable; ///
private alias c_hb_font_funcs_referenceFn = extern(C) hb_font_funcs_t* function(hb_font_funcs_t* ffuncs) nothrow;
__gshared c_hb_font_funcs_referenceFn c_hb_font_funcs_reference; ///
private alias c_hb_font_funcs_set_draw_glyph_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_draw_glyph_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_draw_glyph_funcFn c_hb_font_funcs_set_draw_glyph_func; ///
private alias c_hb_font_funcs_set_draw_glyph_or_fail_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_draw_glyph_or_fail_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_draw_glyph_or_fail_funcFn c_hb_font_funcs_set_draw_glyph_or_fail_func; ///
private alias c_hb_font_funcs_set_font_h_extents_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_font_h_extents_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_font_h_extents_funcFn c_hb_font_funcs_set_font_h_extents_func; ///
private alias c_hb_font_funcs_set_font_v_extents_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_font_v_extents_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_font_v_extents_funcFn c_hb_font_funcs_set_font_v_extents_func; ///
private alias c_hb_font_funcs_set_glyph_contour_point_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_contour_point_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_contour_point_funcFn c_hb_font_funcs_set_glyph_contour_point_func; ///
private alias c_hb_font_funcs_set_glyph_extents_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_extents_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_extents_funcFn c_hb_font_funcs_set_glyph_extents_func; ///
private alias c_hb_font_funcs_set_glyph_from_name_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_from_name_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_from_name_funcFn c_hb_font_funcs_set_glyph_from_name_func; ///
private alias c_hb_font_funcs_set_glyph_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_funcFn c_hb_font_funcs_set_glyph_func; ///
private alias c_hb_font_funcs_set_glyph_h_advance_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_advance_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_h_advance_funcFn c_hb_font_funcs_set_glyph_h_advance_func; ///
private alias c_hb_font_funcs_set_glyph_h_advances_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_advances_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_h_advances_funcFn c_hb_font_funcs_set_glyph_h_advances_func; ///
private alias c_hb_font_funcs_set_glyph_h_kerning_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_kerning_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_h_kerning_funcFn c_hb_font_funcs_set_glyph_h_kerning_func; ///
private alias c_hb_font_funcs_set_glyph_h_origin_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_origin_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_h_origin_funcFn c_hb_font_funcs_set_glyph_h_origin_func; ///
private alias c_hb_font_funcs_set_glyph_h_origins_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_origins_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_h_origins_funcFn c_hb_font_funcs_set_glyph_h_origins_func; ///
private alias c_hb_font_funcs_set_glyph_name_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_name_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_name_funcFn c_hb_font_funcs_set_glyph_name_func; ///
private alias c_hb_font_funcs_set_glyph_shape_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_shape_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_shape_funcFn c_hb_font_funcs_set_glyph_shape_func; ///
private alias c_hb_font_funcs_set_glyph_v_advance_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_advance_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_v_advance_funcFn c_hb_font_funcs_set_glyph_v_advance_func; ///
private alias c_hb_font_funcs_set_glyph_v_advances_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_advances_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_v_advances_funcFn c_hb_font_funcs_set_glyph_v_advances_func; ///
private alias c_hb_font_funcs_set_glyph_v_kerning_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_kerning_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_v_kerning_funcFn c_hb_font_funcs_set_glyph_v_kerning_func; ///
private alias c_hb_font_funcs_set_glyph_v_origin_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_origin_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_v_origin_funcFn c_hb_font_funcs_set_glyph_v_origin_func; ///
private alias c_hb_font_funcs_set_glyph_v_origins_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_origins_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_glyph_v_origins_funcFn c_hb_font_funcs_set_glyph_v_origins_func; ///
private alias c_hb_font_funcs_set_nominal_glyph_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_nominal_glyph_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_nominal_glyph_funcFn c_hb_font_funcs_set_nominal_glyph_func; ///
private alias c_hb_font_funcs_set_nominal_glyphs_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_nominal_glyphs_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_nominal_glyphs_funcFn c_hb_font_funcs_set_nominal_glyphs_func; ///
private alias c_hb_font_funcs_set_paint_glyph_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_paint_glyph_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_paint_glyph_funcFn c_hb_font_funcs_set_paint_glyph_func; ///
private alias c_hb_font_funcs_set_paint_glyph_or_fail_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_paint_glyph_or_fail_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_paint_glyph_or_fail_funcFn c_hb_font_funcs_set_paint_glyph_or_fail_func; ///
private alias c_hb_font_funcs_set_user_dataFn = extern(C) hb_bool_t function(hb_font_funcs_t* ffuncs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_font_funcs_set_user_dataFn c_hb_font_funcs_set_user_data; ///
private alias c_hb_font_funcs_set_variation_glyph_funcFn = extern(C) void function(hb_font_funcs_t* ffuncs, hb_font_get_variation_glyph_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_funcs_set_variation_glyph_funcFn c_hb_font_funcs_set_variation_glyph_func; ///
private alias c_hb_font_get_emptyFn = extern(C) hb_font_t* function() nothrow;
__gshared c_hb_font_get_emptyFn c_hb_font_get_empty; ///
private alias c_hb_font_get_extents_for_directionFn = extern(C) void function(hb_font_t* font, hb_direction_t direction, hb_font_extents_t* extents) nothrow;
__gshared c_hb_font_get_extents_for_directionFn c_hb_font_get_extents_for_direction; ///
private alias c_hb_font_get_faceFn = extern(C) hb_face_t* function(hb_font_t* font) nothrow;
__gshared c_hb_font_get_faceFn c_hb_font_get_face; ///
private alias c_hb_font_get_glyphFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph) nothrow;
__gshared c_hb_font_get_glyphFn c_hb_font_get_glyph; ///
private alias c_hb_font_get_glyph_advance_for_directionFn = extern(C) void function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y) nothrow;
__gshared c_hb_font_get_glyph_advance_for_directionFn c_hb_font_get_glyph_advance_for_direction; ///
private alias c_hb_font_get_glyph_advances_for_directionFn = extern(C) void function(hb_font_t* font, hb_direction_t direction, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstAdvance, uint advanceStride) nothrow;
__gshared c_hb_font_get_glyph_advances_for_directionFn c_hb_font_get_glyph_advances_for_direction; ///
private alias c_hb_font_get_glyph_contour_pointFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, uint pointIndex, hb_position_t* x, hb_position_t* y) nothrow;
__gshared c_hb_font_get_glyph_contour_pointFn c_hb_font_get_glyph_contour_point; ///
private alias c_hb_font_get_glyph_contour_point_for_originFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, uint pointIndex, hb_direction_t direction, hb_position_t* x, hb_position_t* y) nothrow;
__gshared c_hb_font_get_glyph_contour_point_for_originFn c_hb_font_get_glyph_contour_point_for_origin; ///
private alias c_hb_font_get_glyph_extentsFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, hb_glyph_extents_t* extents) nothrow;
__gshared c_hb_font_get_glyph_extentsFn c_hb_font_get_glyph_extents; ///
private alias c_hb_font_get_glyph_extents_for_originFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_glyph_extents_t* extents) nothrow;
__gshared c_hb_font_get_glyph_extents_for_originFn c_hb_font_get_glyph_extents_for_origin; ///
private alias c_hb_font_get_glyph_from_nameFn = extern(C) hb_bool_t function(hb_font_t* font, const(char)* name, int len, hb_codepoint_t* glyph) nothrow;
__gshared c_hb_font_get_glyph_from_nameFn c_hb_font_get_glyph_from_name; ///
private alias c_hb_font_get_glyph_h_advanceFn = extern(C) hb_position_t function(hb_font_t* font, hb_codepoint_t glyph) nothrow;
__gshared c_hb_font_get_glyph_h_advanceFn c_hb_font_get_glyph_h_advance; ///
private alias c_hb_font_get_glyph_h_advancesFn = extern(C) void function(hb_font_t* font, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstAdvance, uint advanceStride) nothrow;
__gshared c_hb_font_get_glyph_h_advancesFn c_hb_font_get_glyph_h_advances; ///
private alias c_hb_font_get_glyph_h_kerningFn = extern(C) hb_position_t function(hb_font_t* font, hb_codepoint_t leftGlyph, hb_codepoint_t rightGlyph) nothrow;
__gshared c_hb_font_get_glyph_h_kerningFn c_hb_font_get_glyph_h_kerning; ///
private alias c_hb_font_get_glyph_h_originFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, hb_position_t* x, hb_position_t* y) nothrow;
__gshared c_hb_font_get_glyph_h_originFn c_hb_font_get_glyph_h_origin; ///
private alias c_hb_font_get_glyph_h_originsFn = extern(C) hb_bool_t function(hb_font_t* font, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstX, uint xStride, hb_position_t* firstY, uint yStride) nothrow;
__gshared c_hb_font_get_glyph_h_originsFn c_hb_font_get_glyph_h_origins; ///
private alias c_hb_font_get_glyph_kerning_for_directionFn = extern(C) void function(hb_font_t* font, hb_codepoint_t firstGlyph, hb_codepoint_t secondGlyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y) nothrow;
__gshared c_hb_font_get_glyph_kerning_for_directionFn c_hb_font_get_glyph_kerning_for_direction; ///
private alias c_hb_font_get_glyph_nameFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, char* name, uint size) nothrow;
__gshared c_hb_font_get_glyph_nameFn c_hb_font_get_glyph_name; ///
private alias c_hb_font_get_glyph_origin_for_directionFn = extern(C) void function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y) nothrow;
__gshared c_hb_font_get_glyph_origin_for_directionFn c_hb_font_get_glyph_origin_for_direction; ///
private alias c_hb_font_get_glyph_shapeFn = extern(C) void function(hb_font_t* font, hb_codepoint_t glyph, hb_draw_funcs_t* dfuncs, void* drawData) nothrow;
__gshared c_hb_font_get_glyph_shapeFn c_hb_font_get_glyph_shape; ///
private alias c_hb_font_get_glyph_v_advanceFn = extern(C) hb_position_t function(hb_font_t* font, hb_codepoint_t glyph) nothrow;
__gshared c_hb_font_get_glyph_v_advanceFn c_hb_font_get_glyph_v_advance; ///
private alias c_hb_font_get_glyph_v_advancesFn = extern(C) void function(hb_font_t* font, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstAdvance, uint advanceStride) nothrow;
__gshared c_hb_font_get_glyph_v_advancesFn c_hb_font_get_glyph_v_advances; ///
private alias c_hb_font_get_glyph_v_kerningFn = extern(C) hb_position_t function(hb_font_t* font, hb_codepoint_t topGlyph, hb_codepoint_t bottomGlyph) nothrow;
__gshared c_hb_font_get_glyph_v_kerningFn c_hb_font_get_glyph_v_kerning; ///
private alias c_hb_font_get_glyph_v_originFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, hb_position_t* x, hb_position_t* y) nothrow;
__gshared c_hb_font_get_glyph_v_originFn c_hb_font_get_glyph_v_origin; ///
private alias c_hb_font_get_glyph_v_originsFn = extern(C) hb_bool_t function(hb_font_t* font, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstX, uint xStride, hb_position_t* firstY, uint yStride) nothrow;
__gshared c_hb_font_get_glyph_v_originsFn c_hb_font_get_glyph_v_origins; ///
private alias c_hb_font_get_h_extentsFn = extern(C) hb_bool_t function(hb_font_t* font, hb_font_extents_t* extents) nothrow;
__gshared c_hb_font_get_h_extentsFn c_hb_font_get_h_extents; ///
private alias c_hb_font_get_nominal_glyphFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t unicode, hb_codepoint_t* glyph) nothrow;
__gshared c_hb_font_get_nominal_glyphFn c_hb_font_get_nominal_glyph; ///
private alias c_hb_font_get_nominal_glyphsFn = extern(C) uint function(hb_font_t* font, uint count, const(hb_codepoint_t)* firstUnicode, uint unicodeStride, hb_codepoint_t* firstGlyph, uint glyphStride) nothrow;
__gshared c_hb_font_get_nominal_glyphsFn c_hb_font_get_nominal_glyphs; ///
private alias c_hb_font_get_parentFn = extern(C) hb_font_t* function(hb_font_t* font) nothrow;
__gshared c_hb_font_get_parentFn c_hb_font_get_parent; ///
private alias c_hb_font_get_ppemFn = extern(C) void function(hb_font_t* font, uint* xPpem, uint* yPpem) nothrow;
__gshared c_hb_font_get_ppemFn c_hb_font_get_ppem; ///
private alias c_hb_font_get_ptemFn = extern(C) float function(hb_font_t* font) nothrow;
__gshared c_hb_font_get_ptemFn c_hb_font_get_ptem; ///
private alias c_hb_font_get_scaleFn = extern(C) void function(hb_font_t* font, int* xScale, int* yScale) nothrow;
__gshared c_hb_font_get_scaleFn c_hb_font_get_scale; ///
private alias c_hb_font_get_serialFn = extern(C) uint function(hb_font_t* font) nothrow;
__gshared c_hb_font_get_serialFn c_hb_font_get_serial; ///
private alias c_hb_font_get_synthetic_boldFn = extern(C) void function(hb_font_t* font, float* xEmbolden, float* yEmbolden, hb_bool_t* inPlace) nothrow;
__gshared c_hb_font_get_synthetic_boldFn c_hb_font_get_synthetic_bold; ///
private alias c_hb_font_get_synthetic_slantFn = extern(C) float function(hb_font_t* font) nothrow;
__gshared c_hb_font_get_synthetic_slantFn c_hb_font_get_synthetic_slant; ///
private alias c_hb_font_get_user_dataFn = extern(C) void* function(const(hb_font_t)* font, hb_user_data_key_t* key) nothrow;
__gshared c_hb_font_get_user_dataFn c_hb_font_get_user_data; ///
private alias c_hb_font_get_v_extentsFn = extern(C) hb_bool_t function(hb_font_t* font, hb_font_extents_t* extents) nothrow;
__gshared c_hb_font_get_v_extentsFn c_hb_font_get_v_extents; ///
private alias c_hb_font_get_var_coords_designFn = extern(C) const(float)* function(hb_font_t* font, uint* length) nothrow;
__gshared c_hb_font_get_var_coords_designFn c_hb_font_get_var_coords_design; ///
private alias c_hb_font_get_var_coords_normalizedFn = extern(C) const(int)* function(hb_font_t* font, uint* length) nothrow;
__gshared c_hb_font_get_var_coords_normalizedFn c_hb_font_get_var_coords_normalized; ///
private alias c_hb_font_get_var_named_instanceFn = extern(C) uint function(hb_font_t* font) nothrow;
__gshared c_hb_font_get_var_named_instanceFn c_hb_font_get_var_named_instance; ///
private alias c_hb_font_get_variation_glyphFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph) nothrow;
__gshared c_hb_font_get_variation_glyphFn c_hb_font_get_variation_glyph; ///
private alias c_hb_font_glyph_from_stringFn = extern(C) hb_bool_t function(hb_font_t* font, const(ubyte)* s, int len, hb_codepoint_t* glyph) nothrow;
__gshared c_hb_font_glyph_from_stringFn c_hb_font_glyph_from_string; ///
private alias c_hb_font_glyph_to_stringFn = extern(C) void function(hb_font_t* font, hb_codepoint_t glyph, char* s, uint size) nothrow;
__gshared c_hb_font_glyph_to_stringFn c_hb_font_glyph_to_string; ///
private alias c_hb_font_is_immutableFn = extern(C) hb_bool_t function(hb_font_t* font) nothrow;
__gshared c_hb_font_is_immutableFn c_hb_font_is_immutable; ///
private alias c_hb_font_is_syntheticFn = extern(C) hb_bool_t function(hb_font_t* font) nothrow;
__gshared c_hb_font_is_syntheticFn c_hb_font_is_synthetic; ///
private alias c_hb_font_list_funcsFn = extern(C) const(char*)* function() nothrow;
__gshared c_hb_font_list_funcsFn c_hb_font_list_funcs; ///
private alias c_hb_font_make_immutableFn = extern(C) void function(hb_font_t* font) nothrow;
__gshared c_hb_font_make_immutableFn c_hb_font_make_immutable; ///
private alias c_hb_font_paint_glyphFn = extern(C) void function(hb_font_t* font, hb_codepoint_t glyph, hb_paint_funcs_t* pfuncs, void* paintData, uint paletteIndex, hb_color_t foreground) nothrow;
__gshared c_hb_font_paint_glyphFn c_hb_font_paint_glyph; ///
private alias c_hb_font_paint_glyph_or_failFn = extern(C) hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, hb_paint_funcs_t* pfuncs, void* paintData, uint paletteIndex, hb_color_t foreground) nothrow;
__gshared c_hb_font_paint_glyph_or_failFn c_hb_font_paint_glyph_or_fail; ///
private alias c_hb_font_referenceFn = extern(C) hb_font_t* function(hb_font_t* font) nothrow;
__gshared c_hb_font_referenceFn c_hb_font_reference; ///
private alias c_hb_font_set_faceFn = extern(C) void function(hb_font_t* font, hb_face_t* face) nothrow;
__gshared c_hb_font_set_faceFn c_hb_font_set_face; ///
private alias c_hb_font_set_funcsFn = extern(C) void function(hb_font_t* font, hb_font_funcs_t* klass, void* fontData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_set_funcsFn c_hb_font_set_funcs; ///
private alias c_hb_font_set_funcs_dataFn = extern(C) void function(hb_font_t* font, void* fontData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_font_set_funcs_dataFn c_hb_font_set_funcs_data; ///
private alias c_hb_font_set_funcs_usingFn = extern(C) hb_bool_t function(hb_font_t* font, const(char)* name) nothrow;
__gshared c_hb_font_set_funcs_usingFn c_hb_font_set_funcs_using; ///
private alias c_hb_font_set_parentFn = extern(C) void function(hb_font_t* font, hb_font_t* parent) nothrow;
__gshared c_hb_font_set_parentFn c_hb_font_set_parent; ///
private alias c_hb_font_set_ppemFn = extern(C) void function(hb_font_t* font, uint xPpem, uint yPpem) nothrow;
__gshared c_hb_font_set_ppemFn c_hb_font_set_ppem; ///
private alias c_hb_font_set_ptemFn = extern(C) void function(hb_font_t* font, float ptem) nothrow;
__gshared c_hb_font_set_ptemFn c_hb_font_set_ptem; ///
private alias c_hb_font_set_scaleFn = extern(C) void function(hb_font_t* font, int xScale, int yScale) nothrow;
__gshared c_hb_font_set_scaleFn c_hb_font_set_scale; ///
private alias c_hb_font_set_synthetic_boldFn = extern(C) void function(hb_font_t* font, float xEmbolden, float yEmbolden, hb_bool_t inPlace) nothrow;
__gshared c_hb_font_set_synthetic_boldFn c_hb_font_set_synthetic_bold; ///
private alias c_hb_font_set_synthetic_slantFn = extern(C) void function(hb_font_t* font, float slant) nothrow;
__gshared c_hb_font_set_synthetic_slantFn c_hb_font_set_synthetic_slant; ///
private alias c_hb_font_set_user_dataFn = extern(C) hb_bool_t function(hb_font_t* font, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_font_set_user_dataFn c_hb_font_set_user_data; ///
private alias c_hb_font_set_var_coords_designFn = extern(C) void function(hb_font_t* font, const(float)* coords, uint coordsLength) nothrow;
__gshared c_hb_font_set_var_coords_designFn c_hb_font_set_var_coords_design; ///
private alias c_hb_font_set_var_coords_normalizedFn = extern(C) void function(hb_font_t* font, const(int)* coords, uint coordsLength) nothrow;
__gshared c_hb_font_set_var_coords_normalizedFn c_hb_font_set_var_coords_normalized; ///
private alias c_hb_font_set_var_named_instanceFn = extern(C) void function(hb_font_t* font, uint instanceIndex) nothrow;
__gshared c_hb_font_set_var_named_instanceFn c_hb_font_set_var_named_instance; ///
private alias c_hb_font_set_variationFn = extern(C) void function(hb_font_t* font, hb_tag_t tag, float value) nothrow;
__gshared c_hb_font_set_variationFn c_hb_font_set_variation; ///
private alias c_hb_font_set_variationsFn = extern(C) void function(hb_font_t* font, const(hb_variation_t)* variations, uint variationsLength) nothrow;
__gshared c_hb_font_set_variationsFn c_hb_font_set_variations; ///
private alias c_hb_font_subtract_glyph_origin_for_directionFn = extern(C) void function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y) nothrow;
__gshared c_hb_font_subtract_glyph_origin_for_directionFn c_hb_font_subtract_glyph_origin_for_direction; ///
private alias c_hb_freeFn = extern(C) void function(void* ptr) nothrow;
__gshared c_hb_freeFn c_hb_free; ///
private alias c_hb_ft_face_createFn = extern(C) hb_face_t* function(FT_Face ftFace, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_ft_face_createFn c_hb_ft_face_create; ///
private alias c_hb_ft_face_create_cachedFn = extern(C) hb_face_t* function(FT_Face ftFace) nothrow;
__gshared c_hb_ft_face_create_cachedFn c_hb_ft_face_create_cached; ///
private alias c_hb_ft_face_create_from_blob_or_failFn = extern(C) hb_face_t* function(hb_blob_t* blob, uint index) nothrow;
__gshared c_hb_ft_face_create_from_blob_or_failFn c_hb_ft_face_create_from_blob_or_fail; ///
private alias c_hb_ft_face_create_from_file_or_failFn = extern(C) hb_face_t* function(const(char)* fileName, uint index) nothrow;
__gshared c_hb_ft_face_create_from_file_or_failFn c_hb_ft_face_create_from_file_or_fail; ///
private alias c_hb_ft_face_create_referencedFn = extern(C) hb_face_t* function(FT_Face ftFace) nothrow;
__gshared c_hb_ft_face_create_referencedFn c_hb_ft_face_create_referenced; ///
private alias c_hb_ft_font_changedFn = extern(C) void function(hb_font_t* font) nothrow;
__gshared c_hb_ft_font_changedFn c_hb_ft_font_changed; ///
private alias c_hb_ft_font_createFn = extern(C) hb_font_t* function(FT_Face ftFace, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_ft_font_createFn c_hb_ft_font_create; ///
private alias c_hb_ft_font_create_referencedFn = extern(C) hb_font_t* function(FT_Face ftFace) nothrow;
__gshared c_hb_ft_font_create_referencedFn c_hb_ft_font_create_referenced; ///
private alias c_hb_ft_font_get_faceFn = extern(C) FT_Face function(hb_font_t* font) nothrow;
__gshared c_hb_ft_font_get_faceFn c_hb_ft_font_get_face; ///
private alias c_hb_ft_font_get_ft_faceFn = extern(C) FT_Face function(hb_font_t* font) nothrow;
__gshared c_hb_ft_font_get_ft_faceFn c_hb_ft_font_get_ft_face; ///
private alias c_hb_ft_font_get_load_flagsFn = extern(C) int function(hb_font_t* font) nothrow;
__gshared c_hb_ft_font_get_load_flagsFn c_hb_ft_font_get_load_flags; ///
private alias c_hb_ft_font_lock_faceFn = extern(C) FT_Face function(hb_font_t* font) nothrow;
__gshared c_hb_ft_font_lock_faceFn c_hb_ft_font_lock_face; ///
private alias c_hb_ft_font_set_funcsFn = extern(C) void function(hb_font_t* font) nothrow;
__gshared c_hb_ft_font_set_funcsFn c_hb_ft_font_set_funcs; ///
private alias c_hb_ft_font_set_load_flagsFn = extern(C) void function(hb_font_t* font, int loadFlags) nothrow;
__gshared c_hb_ft_font_set_load_flagsFn c_hb_ft_font_set_load_flags; ///
private alias c_hb_ft_font_unlock_faceFn = extern(C) void function(hb_font_t* font) nothrow;
__gshared c_hb_ft_font_unlock_faceFn c_hb_ft_font_unlock_face; ///
private alias c_hb_ft_hb_font_changedFn = extern(C) hb_bool_t function(hb_font_t* font) nothrow;
__gshared c_hb_ft_hb_font_changedFn c_hb_ft_hb_font_changed; ///
private alias c_hb_glib_blob_createFn = extern(C) hb_blob_t* function(GBytes* gbytes) nothrow;
__gshared c_hb_glib_blob_createFn c_hb_glib_blob_create; ///
private alias c_hb_glib_get_unicode_funcsFn = extern(C) hb_unicode_funcs_t* function() nothrow;
__gshared c_hb_glib_get_unicode_funcsFn c_hb_glib_get_unicode_funcs; ///
private alias c_hb_glib_script_from_scriptFn = extern(C) GUnicodeScript function(hb_script_t script) nothrow;
__gshared c_hb_glib_script_from_scriptFn c_hb_glib_script_from_script; ///
private alias c_hb_glib_script_to_scriptFn = extern(C) hb_script_t function(GUnicodeScript script) nothrow;
__gshared c_hb_glib_script_to_scriptFn c_hb_glib_script_to_script; ///
private alias c_hb_glyph_info_get_glyph_flagsFn = extern(C) hb_glyph_flags_t function(const(hb_glyph_info_t)* info) nothrow;
__gshared c_hb_glyph_info_get_glyph_flagsFn c_hb_glyph_info_get_glyph_flags; ///
private alias c_hb_language_from_stringFn = extern(C) hb_language_t function(const(ubyte)* str, int len) nothrow;
__gshared c_hb_language_from_stringFn c_hb_language_from_string; ///
private alias c_hb_language_get_defaultFn = extern(C) hb_language_t function() nothrow;
__gshared c_hb_language_get_defaultFn c_hb_language_get_default; ///
private alias c_hb_language_matchesFn = extern(C) hb_bool_t function(hb_language_t language, hb_language_t specific) nothrow;
__gshared c_hb_language_matchesFn c_hb_language_matches; ///
private alias c_hb_language_to_stringFn = extern(C) const(char)* function(hb_language_t language) nothrow;
__gshared c_hb_language_to_stringFn c_hb_language_to_string; ///
private alias c_hb_mallocFn = extern(C) void* function(size_t size) nothrow;
__gshared c_hb_mallocFn c_hb_malloc; ///
private alias c_hb_map_allocation_successfulFn = extern(C) hb_bool_t function(const(hb_map_t)* map) nothrow;
__gshared c_hb_map_allocation_successfulFn c_hb_map_allocation_successful; ///
private alias c_hb_map_clearFn = extern(C) void function(hb_map_t* map) nothrow;
__gshared c_hb_map_clearFn c_hb_map_clear; ///
private alias c_hb_map_copyFn = extern(C) hb_map_t* function(const(hb_map_t)* map) nothrow;
__gshared c_hb_map_copyFn c_hb_map_copy; ///
private alias c_hb_map_createFn = extern(C) hb_map_t* function() nothrow;
__gshared c_hb_map_createFn c_hb_map_create; ///
private alias c_hb_map_delFn = extern(C) void function(hb_map_t* map, hb_codepoint_t key) nothrow;
__gshared c_hb_map_delFn c_hb_map_del; ///
private alias c_hb_map_destroyFn = extern(C) void function(hb_map_t* map) nothrow;
__gshared c_hb_map_destroyFn c_hb_map_destroy; ///
private alias c_hb_map_getFn = extern(C) hb_codepoint_t function(const(hb_map_t)* map, hb_codepoint_t key) nothrow;
__gshared c_hb_map_getFn c_hb_map_get; ///
private alias c_hb_map_get_emptyFn = extern(C) hb_map_t* function() nothrow;
__gshared c_hb_map_get_emptyFn c_hb_map_get_empty; ///
private alias c_hb_map_get_populationFn = extern(C) uint function(const(hb_map_t)* map) nothrow;
__gshared c_hb_map_get_populationFn c_hb_map_get_population; ///
private alias c_hb_map_get_user_dataFn = extern(C) void* function(const(hb_map_t)* map, hb_user_data_key_t* key) nothrow;
__gshared c_hb_map_get_user_dataFn c_hb_map_get_user_data; ///
private alias c_hb_map_hasFn = extern(C) hb_bool_t function(const(hb_map_t)* map, hb_codepoint_t key) nothrow;
__gshared c_hb_map_hasFn c_hb_map_has; ///
private alias c_hb_map_hashFn = extern(C) uint function(const(hb_map_t)* map) nothrow;
__gshared c_hb_map_hashFn c_hb_map_hash; ///
private alias c_hb_map_is_emptyFn = extern(C) hb_bool_t function(const(hb_map_t)* map) nothrow;
__gshared c_hb_map_is_emptyFn c_hb_map_is_empty; ///
private alias c_hb_map_is_equalFn = extern(C) hb_bool_t function(const(hb_map_t)* map, const(hb_map_t)* other) nothrow;
__gshared c_hb_map_is_equalFn c_hb_map_is_equal; ///
private alias c_hb_map_keysFn = extern(C) void function(const(hb_map_t)* map, hb_set_t* keys) nothrow;
__gshared c_hb_map_keysFn c_hb_map_keys; ///
private alias c_hb_map_nextFn = extern(C) hb_bool_t function(const(hb_map_t)* map, int* idx, hb_codepoint_t* key, hb_codepoint_t* value) nothrow;
__gshared c_hb_map_nextFn c_hb_map_next; ///
private alias c_hb_map_referenceFn = extern(C) hb_map_t* function(hb_map_t* map) nothrow;
__gshared c_hb_map_referenceFn c_hb_map_reference; ///
private alias c_hb_map_setFn = extern(C) void function(hb_map_t* map, hb_codepoint_t key, hb_codepoint_t value) nothrow;
__gshared c_hb_map_setFn c_hb_map_set; ///
private alias c_hb_map_set_user_dataFn = extern(C) hb_bool_t function(hb_map_t* map, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_map_set_user_dataFn c_hb_map_set_user_data; ///
private alias c_hb_map_updateFn = extern(C) void function(hb_map_t* map, const(hb_map_t)* other) nothrow;
__gshared c_hb_map_updateFn c_hb_map_update; ///
private alias c_hb_map_valuesFn = extern(C) void function(const(hb_map_t)* map, hb_set_t* values) nothrow;
__gshared c_hb_map_valuesFn c_hb_map_values; ///
private alias c_hb_ot_color_glyph_get_layersFn = extern(C) uint function(hb_face_t* face, hb_codepoint_t glyph, uint startOffset, uint* layerCount, hb_ot_color_layer_t* layers) nothrow;
__gshared c_hb_ot_color_glyph_get_layersFn c_hb_ot_color_glyph_get_layers; ///
private alias c_hb_ot_color_glyph_has_paintFn = extern(C) hb_bool_t function(hb_face_t* face, hb_codepoint_t glyph) nothrow;
__gshared c_hb_ot_color_glyph_has_paintFn c_hb_ot_color_glyph_has_paint; ///
private alias c_hb_ot_color_glyph_reference_pngFn = extern(C) hb_blob_t* function(hb_font_t* font, hb_codepoint_t glyph) nothrow;
__gshared c_hb_ot_color_glyph_reference_pngFn c_hb_ot_color_glyph_reference_png; ///
private alias c_hb_ot_color_glyph_reference_svgFn = extern(C) hb_blob_t* function(hb_face_t* face, hb_codepoint_t glyph) nothrow;
__gshared c_hb_ot_color_glyph_reference_svgFn c_hb_ot_color_glyph_reference_svg; ///
private alias c_hb_ot_color_has_layersFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_ot_color_has_layersFn c_hb_ot_color_has_layers; ///
private alias c_hb_ot_color_has_paintFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_ot_color_has_paintFn c_hb_ot_color_has_paint; ///
private alias c_hb_ot_color_has_palettesFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_ot_color_has_palettesFn c_hb_ot_color_has_palettes; ///
private alias c_hb_ot_color_has_pngFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_ot_color_has_pngFn c_hb_ot_color_has_png; ///
private alias c_hb_ot_color_has_svgFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_ot_color_has_svgFn c_hb_ot_color_has_svg; ///
private alias c_hb_ot_color_palette_color_get_name_idFn = extern(C) hb_ot_name_id_t function(hb_face_t* face, uint colorIndex) nothrow;
__gshared c_hb_ot_color_palette_color_get_name_idFn c_hb_ot_color_palette_color_get_name_id; ///
private alias c_hb_ot_color_palette_get_colorsFn = extern(C) uint function(hb_face_t* face, uint paletteIndex, uint startOffset, uint* colorCount, hb_color_t* colors) nothrow;
__gshared c_hb_ot_color_palette_get_colorsFn c_hb_ot_color_palette_get_colors; ///
private alias c_hb_ot_color_palette_get_countFn = extern(C) uint function(hb_face_t* face) nothrow;
__gshared c_hb_ot_color_palette_get_countFn c_hb_ot_color_palette_get_count; ///
private alias c_hb_ot_color_palette_get_flagsFn = extern(C) hb_ot_color_palette_flags_t function(hb_face_t* face, uint paletteIndex) nothrow;
__gshared c_hb_ot_color_palette_get_flagsFn c_hb_ot_color_palette_get_flags; ///
private alias c_hb_ot_color_palette_get_name_idFn = extern(C) hb_ot_name_id_t function(hb_face_t* face, uint paletteIndex) nothrow;
__gshared c_hb_ot_color_palette_get_name_idFn c_hb_ot_color_palette_get_name_id; ///
private alias c_hb_ot_font_set_funcsFn = extern(C) void function(hb_font_t* font) nothrow;
__gshared c_hb_ot_font_set_funcsFn c_hb_ot_font_set_funcs; ///
private alias c_hb_ot_layout_collect_featuresFn = extern(C) void function(hb_face_t* face, hb_tag_t tableTag, const(hb_tag_t)* scripts, const(hb_tag_t)* languages, const(hb_tag_t)* features, hb_set_t* featureIndexes) nothrow;
__gshared c_hb_ot_layout_collect_featuresFn c_hb_ot_layout_collect_features; ///
private alias c_hb_ot_layout_collect_features_mapFn = extern(C) void function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, hb_map_t* featureMap) nothrow;
__gshared c_hb_ot_layout_collect_features_mapFn c_hb_ot_layout_collect_features_map; ///
private alias c_hb_ot_layout_collect_lookupsFn = extern(C) void function(hb_face_t* face, hb_tag_t tableTag, const(hb_tag_t)* scripts, const(hb_tag_t)* languages, const(hb_tag_t)* features, hb_set_t* lookupIndexes) nothrow;
__gshared c_hb_ot_layout_collect_lookupsFn c_hb_ot_layout_collect_lookups; ///
private alias c_hb_ot_layout_feature_get_charactersFn = extern(C) uint function(hb_face_t* face, hb_tag_t tableTag, uint featureIndex, uint startOffset, uint* charCount, hb_codepoint_t* characters) nothrow;
__gshared c_hb_ot_layout_feature_get_charactersFn c_hb_ot_layout_feature_get_characters; ///
private alias c_hb_ot_layout_feature_get_lookupsFn = extern(C) uint function(hb_face_t* face, hb_tag_t tableTag, uint featureIndex, uint startOffset, uint* lookupCount, uint* lookupIndexes) nothrow;
__gshared c_hb_ot_layout_feature_get_lookupsFn c_hb_ot_layout_feature_get_lookups; ///
private alias c_hb_ot_layout_feature_get_name_idsFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint featureIndex, hb_ot_name_id_t* labelId, hb_ot_name_id_t* tooltipId, hb_ot_name_id_t* sampleId, uint* numNamedParameters, hb_ot_name_id_t* firstParamId) nothrow;
__gshared c_hb_ot_layout_feature_get_name_idsFn c_hb_ot_layout_feature_get_name_ids; ///
private alias c_hb_ot_layout_feature_with_variations_get_lookupsFn = extern(C) uint function(hb_face_t* face, hb_tag_t tableTag, uint featureIndex, uint variationsIndex, uint startOffset, uint* lookupCount, uint* lookupIndexes) nothrow;
__gshared c_hb_ot_layout_feature_with_variations_get_lookupsFn c_hb_ot_layout_feature_with_variations_get_lookups; ///
private alias c_hb_ot_layout_get_attach_pointsFn = extern(C) uint function(hb_face_t* face, hb_codepoint_t glyph, uint startOffset, uint* pointCount, uint* pointArray) nothrow;
__gshared c_hb_ot_layout_get_attach_pointsFn c_hb_ot_layout_get_attach_points; ///
private alias c_hb_ot_layout_get_baselineFn = extern(C) hb_bool_t function(hb_font_t* font, hb_ot_layout_baseline_tag_t baselineTag, hb_direction_t direction, hb_tag_t scriptTag, hb_tag_t languageTag, hb_position_t* coord) nothrow;
__gshared c_hb_ot_layout_get_baselineFn c_hb_ot_layout_get_baseline; ///
private alias c_hb_ot_layout_get_baseline2Fn = extern(C) hb_bool_t function(hb_font_t* font, hb_ot_layout_baseline_tag_t baselineTag, hb_direction_t direction, hb_script_t script, hb_language_t language, hb_position_t* coord) nothrow;
__gshared c_hb_ot_layout_get_baseline2Fn c_hb_ot_layout_get_baseline2; ///
private alias c_hb_ot_layout_get_baseline_with_fallbackFn = extern(C) void function(hb_font_t* font, hb_ot_layout_baseline_tag_t baselineTag, hb_direction_t direction, hb_tag_t scriptTag, hb_tag_t languageTag, hb_position_t* coord) nothrow;
__gshared c_hb_ot_layout_get_baseline_with_fallbackFn c_hb_ot_layout_get_baseline_with_fallback; ///
private alias c_hb_ot_layout_get_baseline_with_fallback2Fn = extern(C) void function(hb_font_t* font, hb_ot_layout_baseline_tag_t baselineTag, hb_direction_t direction, hb_script_t script, hb_language_t language, hb_position_t* coord) nothrow;
__gshared c_hb_ot_layout_get_baseline_with_fallback2Fn c_hb_ot_layout_get_baseline_with_fallback2; ///
private alias c_hb_ot_layout_get_font_extentsFn = extern(C) hb_bool_t function(hb_font_t* font, hb_direction_t direction, hb_tag_t scriptTag, hb_tag_t languageTag, hb_font_extents_t* extents) nothrow;
__gshared c_hb_ot_layout_get_font_extentsFn c_hb_ot_layout_get_font_extents; ///
private alias c_hb_ot_layout_get_font_extents2Fn = extern(C) hb_bool_t function(hb_font_t* font, hb_direction_t direction, hb_script_t script, hb_language_t language, hb_font_extents_t* extents) nothrow;
__gshared c_hb_ot_layout_get_font_extents2Fn c_hb_ot_layout_get_font_extents2; ///
private alias c_hb_ot_layout_get_glyph_classFn = extern(C) hb_ot_layout_glyph_class_t function(hb_face_t* face, hb_codepoint_t glyph) nothrow;
__gshared c_hb_ot_layout_get_glyph_classFn c_hb_ot_layout_get_glyph_class; ///
private alias c_hb_ot_layout_get_glyphs_in_classFn = extern(C) void function(hb_face_t* face, hb_ot_layout_glyph_class_t klass, hb_set_t* glyphs) nothrow;
__gshared c_hb_ot_layout_get_glyphs_in_classFn c_hb_ot_layout_get_glyphs_in_class; ///
private alias c_hb_ot_layout_get_horizontal_baseline_tag_for_scriptFn = extern(C) hb_ot_layout_baseline_tag_t function(hb_script_t script) nothrow;
__gshared c_hb_ot_layout_get_horizontal_baseline_tag_for_scriptFn c_hb_ot_layout_get_horizontal_baseline_tag_for_script; ///
private alias c_hb_ot_layout_get_ligature_caretsFn = extern(C) uint function(hb_font_t* font, hb_direction_t direction, hb_codepoint_t glyph, uint startOffset, uint* caretCount, hb_position_t* caretArray) nothrow;
__gshared c_hb_ot_layout_get_ligature_caretsFn c_hb_ot_layout_get_ligature_carets; ///
private alias c_hb_ot_layout_get_size_paramsFn = extern(C) hb_bool_t function(hb_face_t* face, uint* designSize, uint* subfamilyId, hb_ot_name_id_t* subfamilyNameId, uint* rangeStart, uint* rangeEnd) nothrow;
__gshared c_hb_ot_layout_get_size_paramsFn c_hb_ot_layout_get_size_params; ///
private alias c_hb_ot_layout_has_glyph_classesFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_ot_layout_has_glyph_classesFn c_hb_ot_layout_has_glyph_classes; ///
private alias c_hb_ot_layout_has_positioningFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_ot_layout_has_positioningFn c_hb_ot_layout_has_positioning; ///
private alias c_hb_ot_layout_has_substitutionFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_ot_layout_has_substitutionFn c_hb_ot_layout_has_substitution; ///
private alias c_hb_ot_layout_language_find_featureFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, hb_tag_t featureTag, uint* featureIndex) nothrow;
__gshared c_hb_ot_layout_language_find_featureFn c_hb_ot_layout_language_find_feature; ///
private alias c_hb_ot_layout_language_get_feature_indexesFn = extern(C) uint function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, uint startOffset, uint* featureCount, uint* featureIndexes) nothrow;
__gshared c_hb_ot_layout_language_get_feature_indexesFn c_hb_ot_layout_language_get_feature_indexes; ///
private alias c_hb_ot_layout_language_get_feature_tagsFn = extern(C) uint function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, uint startOffset, uint* featureCount, hb_tag_t* featureTags) nothrow;
__gshared c_hb_ot_layout_language_get_feature_tagsFn c_hb_ot_layout_language_get_feature_tags; ///
private alias c_hb_ot_layout_language_get_required_featureFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, uint* featureIndex, hb_tag_t* featureTag) nothrow;
__gshared c_hb_ot_layout_language_get_required_featureFn c_hb_ot_layout_language_get_required_feature; ///
private alias c_hb_ot_layout_language_get_required_feature_indexFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, uint* featureIndex) nothrow;
__gshared c_hb_ot_layout_language_get_required_feature_indexFn c_hb_ot_layout_language_get_required_feature_index; ///
private alias c_hb_ot_layout_lookup_collect_glyph_alternatesFn = extern(C) hb_bool_t function(hb_face_t* face, uint lookupIndex, hb_map_t* alternateCount, hb_map_t* alternateGlyphs) nothrow;
__gshared c_hb_ot_layout_lookup_collect_glyph_alternatesFn c_hb_ot_layout_lookup_collect_glyph_alternates; ///
private alias c_hb_ot_layout_lookup_collect_glyphsFn = extern(C) void function(hb_face_t* face, hb_tag_t tableTag, uint lookupIndex, hb_set_t* glyphsBefore, hb_set_t* glyphsInput, hb_set_t* glyphsAfter, hb_set_t* glyphsOutput) nothrow;
__gshared c_hb_ot_layout_lookup_collect_glyphsFn c_hb_ot_layout_lookup_collect_glyphs; ///
private alias c_hb_ot_layout_lookup_get_glyph_alternatesFn = extern(C) uint function(hb_face_t* face, uint lookupIndex, hb_codepoint_t glyph, uint startOffset, uint* alternateCount, hb_codepoint_t* alternateGlyphs) nothrow;
__gshared c_hb_ot_layout_lookup_get_glyph_alternatesFn c_hb_ot_layout_lookup_get_glyph_alternates; ///
private alias c_hb_ot_layout_lookup_get_optical_boundFn = extern(C) hb_position_t function(hb_font_t* font, uint lookupIndex, hb_direction_t direction, hb_codepoint_t glyph) nothrow;
__gshared c_hb_ot_layout_lookup_get_optical_boundFn c_hb_ot_layout_lookup_get_optical_bound; ///
private alias c_hb_ot_layout_lookup_substitute_closureFn = extern(C) void function(hb_face_t* face, uint lookupIndex, hb_set_t* glyphs) nothrow;
__gshared c_hb_ot_layout_lookup_substitute_closureFn c_hb_ot_layout_lookup_substitute_closure; ///
private alias c_hb_ot_layout_lookup_would_substituteFn = extern(C) hb_bool_t function(hb_face_t* face, uint lookupIndex, const(hb_codepoint_t)* glyphs, uint glyphsLength, hb_bool_t zeroContext) nothrow;
__gshared c_hb_ot_layout_lookup_would_substituteFn c_hb_ot_layout_lookup_would_substitute; ///
private alias c_hb_ot_layout_lookups_substitute_closureFn = extern(C) void function(hb_face_t* face, const(hb_set_t)* lookups, hb_set_t* glyphs) nothrow;
__gshared c_hb_ot_layout_lookups_substitute_closureFn c_hb_ot_layout_lookups_substitute_closure; ///
private alias c_hb_ot_layout_script_find_languageFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, hb_tag_t languageTag, uint* languageIndex) nothrow;
__gshared c_hb_ot_layout_script_find_languageFn c_hb_ot_layout_script_find_language; ///
private alias c_hb_ot_layout_script_get_language_tagsFn = extern(C) uint function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint startOffset, uint* languageCount, hb_tag_t* languageTags) nothrow;
__gshared c_hb_ot_layout_script_get_language_tagsFn c_hb_ot_layout_script_get_language_tags; ///
private alias c_hb_ot_layout_script_select_languageFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageCount, const(hb_tag_t)* languageTags, uint* languageIndex) nothrow;
__gshared c_hb_ot_layout_script_select_languageFn c_hb_ot_layout_script_select_language; ///
private alias c_hb_ot_layout_script_select_language2Fn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageCount, const(hb_tag_t)* languageTags, uint* languageIndex, hb_tag_t* chosenLanguage) nothrow;
__gshared c_hb_ot_layout_script_select_language2Fn c_hb_ot_layout_script_select_language2; ///
private alias c_hb_ot_layout_table_choose_scriptFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, const(hb_tag_t)* scriptTags, uint* scriptIndex, hb_tag_t* chosenScript) nothrow;
__gshared c_hb_ot_layout_table_choose_scriptFn c_hb_ot_layout_table_choose_script; ///
private alias c_hb_ot_layout_table_find_feature_variationsFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, const(int)* coords, uint numCoords, uint* variationsIndex) nothrow;
__gshared c_hb_ot_layout_table_find_feature_variationsFn c_hb_ot_layout_table_find_feature_variations; ///
private alias c_hb_ot_layout_table_find_scriptFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, hb_tag_t scriptTag, uint* scriptIndex) nothrow;
__gshared c_hb_ot_layout_table_find_scriptFn c_hb_ot_layout_table_find_script; ///
private alias c_hb_ot_layout_table_get_feature_tagsFn = extern(C) uint function(hb_face_t* face, hb_tag_t tableTag, uint startOffset, uint* featureCount, hb_tag_t* featureTags) nothrow;
__gshared c_hb_ot_layout_table_get_feature_tagsFn c_hb_ot_layout_table_get_feature_tags; ///
private alias c_hb_ot_layout_table_get_lookup_countFn = extern(C) uint function(hb_face_t* face, hb_tag_t tableTag) nothrow;
__gshared c_hb_ot_layout_table_get_lookup_countFn c_hb_ot_layout_table_get_lookup_count; ///
private alias c_hb_ot_layout_table_get_script_tagsFn = extern(C) uint function(hb_face_t* face, hb_tag_t tableTag, uint startOffset, uint* scriptCount, hb_tag_t* scriptTags) nothrow;
__gshared c_hb_ot_layout_table_get_script_tagsFn c_hb_ot_layout_table_get_script_tags; ///
private alias c_hb_ot_layout_table_select_scriptFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptCount, const(hb_tag_t)* scriptTags, uint* scriptIndex, hb_tag_t* chosenScript) nothrow;
__gshared c_hb_ot_layout_table_select_scriptFn c_hb_ot_layout_table_select_script; ///
private alias c_hb_ot_math_get_constantFn = extern(C) hb_position_t function(hb_font_t* font, hb_ot_math_constant_t constant) nothrow;
__gshared c_hb_ot_math_get_constantFn c_hb_ot_math_get_constant; ///
private alias c_hb_ot_math_get_glyph_assemblyFn = extern(C) uint function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, uint startOffset, uint* partsCount, hb_ot_math_glyph_part_t* parts, hb_position_t* italicsCorrection) nothrow;
__gshared c_hb_ot_math_get_glyph_assemblyFn c_hb_ot_math_get_glyph_assembly; ///
private alias c_hb_ot_math_get_glyph_italics_correctionFn = extern(C) hb_position_t function(hb_font_t* font, hb_codepoint_t glyph) nothrow;
__gshared c_hb_ot_math_get_glyph_italics_correctionFn c_hb_ot_math_get_glyph_italics_correction; ///
private alias c_hb_ot_math_get_glyph_kerningFn = extern(C) hb_position_t function(hb_font_t* font, hb_codepoint_t glyph, hb_ot_math_kern_t kern, hb_position_t correctionHeight) nothrow;
__gshared c_hb_ot_math_get_glyph_kerningFn c_hb_ot_math_get_glyph_kerning; ///
private alias c_hb_ot_math_get_glyph_kerningsFn = extern(C) uint function(hb_font_t* font, hb_codepoint_t glyph, hb_ot_math_kern_t kern, uint startOffset, uint* entriesCount, hb_ot_math_kern_entry_t* kernEntries) nothrow;
__gshared c_hb_ot_math_get_glyph_kerningsFn c_hb_ot_math_get_glyph_kernings; ///
private alias c_hb_ot_math_get_glyph_top_accent_attachmentFn = extern(C) hb_position_t function(hb_font_t* font, hb_codepoint_t glyph) nothrow;
__gshared c_hb_ot_math_get_glyph_top_accent_attachmentFn c_hb_ot_math_get_glyph_top_accent_attachment; ///
private alias c_hb_ot_math_get_glyph_variantsFn = extern(C) uint function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, uint startOffset, uint* variantsCount, hb_ot_math_glyph_variant_t* variants) nothrow;
__gshared c_hb_ot_math_get_glyph_variantsFn c_hb_ot_math_get_glyph_variants; ///
private alias c_hb_ot_math_get_min_connector_overlapFn = extern(C) hb_position_t function(hb_font_t* font, hb_direction_t direction) nothrow;
__gshared c_hb_ot_math_get_min_connector_overlapFn c_hb_ot_math_get_min_connector_overlap; ///
private alias c_hb_ot_math_has_dataFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_ot_math_has_dataFn c_hb_ot_math_has_data; ///
private alias c_hb_ot_math_is_glyph_extended_shapeFn = extern(C) hb_bool_t function(hb_face_t* face, hb_codepoint_t glyph) nothrow;
__gshared c_hb_ot_math_is_glyph_extended_shapeFn c_hb_ot_math_is_glyph_extended_shape; ///
private alias c_hb_ot_meta_get_entry_tagsFn = extern(C) uint function(hb_face_t* face, uint startOffset, uint* entriesCount, hb_ot_meta_tag_t* entries) nothrow;
__gshared c_hb_ot_meta_get_entry_tagsFn c_hb_ot_meta_get_entry_tags; ///
private alias c_hb_ot_meta_reference_entryFn = extern(C) hb_blob_t* function(hb_face_t* face, hb_ot_meta_tag_t metaTag) nothrow;
__gshared c_hb_ot_meta_reference_entryFn c_hb_ot_meta_reference_entry; ///
private alias c_hb_ot_metrics_get_positionFn = extern(C) hb_bool_t function(hb_font_t* font, hb_ot_metrics_tag_t metricsTag, hb_position_t* position) nothrow;
__gshared c_hb_ot_metrics_get_positionFn c_hb_ot_metrics_get_position; ///
private alias c_hb_ot_metrics_get_position_with_fallbackFn = extern(C) void function(hb_font_t* font, hb_ot_metrics_tag_t metricsTag, hb_position_t* position) nothrow;
__gshared c_hb_ot_metrics_get_position_with_fallbackFn c_hb_ot_metrics_get_position_with_fallback; ///
private alias c_hb_ot_metrics_get_variationFn = extern(C) float function(hb_font_t* font, hb_ot_metrics_tag_t metricsTag) nothrow;
__gshared c_hb_ot_metrics_get_variationFn c_hb_ot_metrics_get_variation; ///
private alias c_hb_ot_metrics_get_x_variationFn = extern(C) hb_position_t function(hb_font_t* font, hb_ot_metrics_tag_t metricsTag) nothrow;
__gshared c_hb_ot_metrics_get_x_variationFn c_hb_ot_metrics_get_x_variation; ///
private alias c_hb_ot_metrics_get_y_variationFn = extern(C) hb_position_t function(hb_font_t* font, hb_ot_metrics_tag_t metricsTag) nothrow;
__gshared c_hb_ot_metrics_get_y_variationFn c_hb_ot_metrics_get_y_variation; ///
private alias c_hb_ot_name_get_utf16Fn = extern(C) uint function(hb_face_t* face, hb_ot_name_id_t nameId, hb_language_t language, uint* textSize, ushort* text) nothrow;
__gshared c_hb_ot_name_get_utf16Fn c_hb_ot_name_get_utf16; ///
private alias c_hb_ot_name_get_utf32Fn = extern(C) uint function(hb_face_t* face, hb_ot_name_id_t nameId, hb_language_t language, uint* textSize, uint* text) nothrow;
__gshared c_hb_ot_name_get_utf32Fn c_hb_ot_name_get_utf32; ///
private alias c_hb_ot_name_get_utf8Fn = extern(C) uint function(hb_face_t* face, hb_ot_name_id_t nameId, hb_language_t language, uint* textSize, char* text) nothrow;
__gshared c_hb_ot_name_get_utf8Fn c_hb_ot_name_get_utf8; ///
private alias c_hb_ot_name_list_namesFn = extern(C) const(hb_ot_name_entry_t)* function(hb_face_t* face, uint* numEntries) nothrow;
__gshared c_hb_ot_name_list_namesFn c_hb_ot_name_list_names; ///
private alias c_hb_ot_shape_glyphs_closureFn = extern(C) void function(hb_font_t* font, hb_buffer_t* buffer, const(hb_feature_t)* features, uint numFeatures, hb_set_t* glyphs) nothrow;
__gshared c_hb_ot_shape_glyphs_closureFn c_hb_ot_shape_glyphs_closure; ///
private alias c_hb_ot_shape_plan_collect_lookupsFn = extern(C) void function(hb_shape_plan_t* shapePlan, hb_tag_t tableTag, hb_set_t* lookupIndexes) nothrow;
__gshared c_hb_ot_shape_plan_collect_lookupsFn c_hb_ot_shape_plan_collect_lookups; ///
private alias c_hb_ot_shape_plan_get_feature_tagsFn = extern(C) uint function(hb_shape_plan_t* shapePlan, uint startOffset, uint* tagCount, hb_tag_t* tags) nothrow;
__gshared c_hb_ot_shape_plan_get_feature_tagsFn c_hb_ot_shape_plan_get_feature_tags; ///
private alias c_hb_ot_tag_from_languageFn = extern(C) hb_tag_t function(hb_language_t language) nothrow;
__gshared c_hb_ot_tag_from_languageFn c_hb_ot_tag_from_language; ///
private alias c_hb_ot_tag_to_languageFn = extern(C) hb_language_t function(hb_tag_t tag) nothrow;
__gshared c_hb_ot_tag_to_languageFn c_hb_ot_tag_to_language; ///
private alias c_hb_ot_tag_to_scriptFn = extern(C) hb_script_t function(hb_tag_t tag) nothrow;
__gshared c_hb_ot_tag_to_scriptFn c_hb_ot_tag_to_script; ///
private alias c_hb_ot_tags_from_scriptFn = extern(C) void function(hb_script_t script, hb_tag_t* scriptTag1, hb_tag_t* scriptTag2) nothrow;
__gshared c_hb_ot_tags_from_scriptFn c_hb_ot_tags_from_script; ///
private alias c_hb_ot_tags_from_script_and_languageFn = extern(C) void function(hb_script_t script, hb_language_t language, uint* scriptCount, hb_tag_t* scriptTags, uint* languageCount, hb_tag_t* languageTags) nothrow;
__gshared c_hb_ot_tags_from_script_and_languageFn c_hb_ot_tags_from_script_and_language; ///
private alias c_hb_ot_tags_to_script_and_languageFn = extern(C) void function(hb_tag_t scriptTag, hb_tag_t languageTag, hb_script_t* script, hb_language_t* language) nothrow;
__gshared c_hb_ot_tags_to_script_and_languageFn c_hb_ot_tags_to_script_and_language; ///
private alias c_hb_ot_var_find_axisFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t axisTag, uint* axisIndex, hb_ot_var_axis_t* axisInfo) nothrow;
__gshared c_hb_ot_var_find_axisFn c_hb_ot_var_find_axis; ///
private alias c_hb_ot_var_find_axis_infoFn = extern(C) hb_bool_t function(hb_face_t* face, hb_tag_t axisTag, hb_ot_var_axis_info_t* axisInfo) nothrow;
__gshared c_hb_ot_var_find_axis_infoFn c_hb_ot_var_find_axis_info; ///
private alias c_hb_ot_var_get_axesFn = extern(C) uint function(hb_face_t* face, uint startOffset, uint* axesCount, hb_ot_var_axis_t* axesArray) nothrow;
__gshared c_hb_ot_var_get_axesFn c_hb_ot_var_get_axes; ///
private alias c_hb_ot_var_get_axis_countFn = extern(C) uint function(hb_face_t* face) nothrow;
__gshared c_hb_ot_var_get_axis_countFn c_hb_ot_var_get_axis_count; ///
private alias c_hb_ot_var_get_axis_infosFn = extern(C) uint function(hb_face_t* face, uint startOffset, uint* axesCount, hb_ot_var_axis_info_t* axesArray) nothrow;
__gshared c_hb_ot_var_get_axis_infosFn c_hb_ot_var_get_axis_infos; ///
private alias c_hb_ot_var_get_named_instance_countFn = extern(C) uint function(hb_face_t* face) nothrow;
__gshared c_hb_ot_var_get_named_instance_countFn c_hb_ot_var_get_named_instance_count; ///
private alias c_hb_ot_var_has_dataFn = extern(C) hb_bool_t function(hb_face_t* face) nothrow;
__gshared c_hb_ot_var_has_dataFn c_hb_ot_var_has_data; ///
private alias c_hb_ot_var_named_instance_get_design_coordsFn = extern(C) uint function(hb_face_t* face, uint instanceIndex, uint* coordsLength, float* coords) nothrow;
__gshared c_hb_ot_var_named_instance_get_design_coordsFn c_hb_ot_var_named_instance_get_design_coords; ///
private alias c_hb_ot_var_named_instance_get_postscript_name_idFn = extern(C) hb_ot_name_id_t function(hb_face_t* face, uint instanceIndex) nothrow;
__gshared c_hb_ot_var_named_instance_get_postscript_name_idFn c_hb_ot_var_named_instance_get_postscript_name_id; ///
private alias c_hb_ot_var_named_instance_get_subfamily_name_idFn = extern(C) hb_ot_name_id_t function(hb_face_t* face, uint instanceIndex) nothrow;
__gshared c_hb_ot_var_named_instance_get_subfamily_name_idFn c_hb_ot_var_named_instance_get_subfamily_name_id; ///
private alias c_hb_ot_var_normalize_coordsFn = extern(C) void function(hb_face_t* face, uint coordsLength, const(float)* designCoords, int* normalizedCoords) nothrow;
__gshared c_hb_ot_var_normalize_coordsFn c_hb_ot_var_normalize_coords; ///
private alias c_hb_ot_var_normalize_variationsFn = extern(C) void function(hb_face_t* face, const(hb_variation_t)* variations, uint variationsLength, int* coords, uint coordsLength) nothrow;
__gshared c_hb_ot_var_normalize_variationsFn c_hb_ot_var_normalize_variations; ///
private alias c_hb_paint_colorFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_bool_t isForeground, hb_color_t color) nothrow;
__gshared c_hb_paint_colorFn c_hb_paint_color; ///
private alias c_hb_paint_color_glyphFn = extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font) nothrow;
__gshared c_hb_paint_color_glyphFn c_hb_paint_color_glyph; ///
private alias c_hb_paint_custom_palette_colorFn = extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, uint colorIndex, hb_color_t* color) nothrow;
__gshared c_hb_paint_custom_palette_colorFn c_hb_paint_custom_palette_color; ///
private alias c_hb_paint_funcs_createFn = extern(C) hb_paint_funcs_t* function() nothrow;
__gshared c_hb_paint_funcs_createFn c_hb_paint_funcs_create; ///
private alias c_hb_paint_funcs_destroyFn = extern(C) void function(hb_paint_funcs_t* funcs) nothrow;
__gshared c_hb_paint_funcs_destroyFn c_hb_paint_funcs_destroy; ///
private alias c_hb_paint_funcs_get_emptyFn = extern(C) hb_paint_funcs_t* function() nothrow;
__gshared c_hb_paint_funcs_get_emptyFn c_hb_paint_funcs_get_empty; ///
private alias c_hb_paint_funcs_get_user_dataFn = extern(C) void* function(const(hb_paint_funcs_t)* funcs, hb_user_data_key_t* key) nothrow;
__gshared c_hb_paint_funcs_get_user_dataFn c_hb_paint_funcs_get_user_data; ///
private alias c_hb_paint_funcs_is_immutableFn = extern(C) hb_bool_t function(hb_paint_funcs_t* funcs) nothrow;
__gshared c_hb_paint_funcs_is_immutableFn c_hb_paint_funcs_is_immutable; ///
private alias c_hb_paint_funcs_make_immutableFn = extern(C) void function(hb_paint_funcs_t* funcs) nothrow;
__gshared c_hb_paint_funcs_make_immutableFn c_hb_paint_funcs_make_immutable; ///
private alias c_hb_paint_funcs_referenceFn = extern(C) hb_paint_funcs_t* function(hb_paint_funcs_t* funcs) nothrow;
__gshared c_hb_paint_funcs_referenceFn c_hb_paint_funcs_reference; ///
private alias c_hb_paint_funcs_set_color_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_color_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_color_funcFn c_hb_paint_funcs_set_color_func; ///
private alias c_hb_paint_funcs_set_color_glyph_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_color_glyph_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_color_glyph_funcFn c_hb_paint_funcs_set_color_glyph_func; ///
private alias c_hb_paint_funcs_set_custom_palette_color_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_custom_palette_color_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_custom_palette_color_funcFn c_hb_paint_funcs_set_custom_palette_color_func; ///
private alias c_hb_paint_funcs_set_image_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_image_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_image_funcFn c_hb_paint_funcs_set_image_func; ///
private alias c_hb_paint_funcs_set_linear_gradient_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_linear_gradient_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_linear_gradient_funcFn c_hb_paint_funcs_set_linear_gradient_func; ///
private alias c_hb_paint_funcs_set_pop_clip_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_pop_clip_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_pop_clip_funcFn c_hb_paint_funcs_set_pop_clip_func; ///
private alias c_hb_paint_funcs_set_pop_group_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_pop_group_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_pop_group_funcFn c_hb_paint_funcs_set_pop_group_func; ///
private alias c_hb_paint_funcs_set_pop_transform_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_pop_transform_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_pop_transform_funcFn c_hb_paint_funcs_set_pop_transform_func; ///
private alias c_hb_paint_funcs_set_push_clip_glyph_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_push_clip_glyph_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_push_clip_glyph_funcFn c_hb_paint_funcs_set_push_clip_glyph_func; ///
private alias c_hb_paint_funcs_set_push_clip_rectangle_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_push_clip_rectangle_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_push_clip_rectangle_funcFn c_hb_paint_funcs_set_push_clip_rectangle_func; ///
private alias c_hb_paint_funcs_set_push_group_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_push_group_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_push_group_funcFn c_hb_paint_funcs_set_push_group_func; ///
private alias c_hb_paint_funcs_set_push_transform_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_push_transform_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_push_transform_funcFn c_hb_paint_funcs_set_push_transform_func; ///
private alias c_hb_paint_funcs_set_radial_gradient_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_radial_gradient_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_radial_gradient_funcFn c_hb_paint_funcs_set_radial_gradient_func; ///
private alias c_hb_paint_funcs_set_sweep_gradient_funcFn = extern(C) void function(hb_paint_funcs_t* funcs, hb_paint_sweep_gradient_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_paint_funcs_set_sweep_gradient_funcFn c_hb_paint_funcs_set_sweep_gradient_func; ///
private alias c_hb_paint_funcs_set_user_dataFn = extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_paint_funcs_set_user_dataFn c_hb_paint_funcs_set_user_data; ///
private alias c_hb_paint_imageFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_blob_t* image, uint width, uint height, hb_tag_t format, float slant, hb_glyph_extents_t* extents) nothrow;
__gshared c_hb_paint_imageFn c_hb_paint_image; ///
private alias c_hb_paint_linear_gradientFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float x1, float y1, float x2, float y2) nothrow;
__gshared c_hb_paint_linear_gradientFn c_hb_paint_linear_gradient; ///
private alias c_hb_paint_pop_clipFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData) nothrow;
__gshared c_hb_paint_pop_clipFn c_hb_paint_pop_clip; ///
private alias c_hb_paint_pop_groupFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_paint_composite_mode_t mode) nothrow;
__gshared c_hb_paint_pop_groupFn c_hb_paint_pop_group; ///
private alias c_hb_paint_pop_transformFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData) nothrow;
__gshared c_hb_paint_pop_transformFn c_hb_paint_pop_transform; ///
private alias c_hb_paint_push_clip_glyphFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font) nothrow;
__gshared c_hb_paint_push_clip_glyphFn c_hb_paint_push_clip_glyph; ///
private alias c_hb_paint_push_clip_rectangleFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, float xmin, float ymin, float xmax, float ymax) nothrow;
__gshared c_hb_paint_push_clip_rectangleFn c_hb_paint_push_clip_rectangle; ///
private alias c_hb_paint_push_font_transformFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, const(hb_font_t)* font) nothrow;
__gshared c_hb_paint_push_font_transformFn c_hb_paint_push_font_transform; ///
private alias c_hb_paint_push_groupFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData) nothrow;
__gshared c_hb_paint_push_groupFn c_hb_paint_push_group; ///
private alias c_hb_paint_push_inverse_font_transformFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, const(hb_font_t)* font) nothrow;
__gshared c_hb_paint_push_inverse_font_transformFn c_hb_paint_push_inverse_font_transform; ///
private alias c_hb_paint_push_transformFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, float xx, float yx, float xy, float yy, float dx, float dy) nothrow;
__gshared c_hb_paint_push_transformFn c_hb_paint_push_transform; ///
private alias c_hb_paint_radial_gradientFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float r0, float x1, float y1, float r1) nothrow;
__gshared c_hb_paint_radial_gradientFn c_hb_paint_radial_gradient; ///
private alias c_hb_paint_sweep_gradientFn = extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float startAngle, float endAngle) nothrow;
__gshared c_hb_paint_sweep_gradientFn c_hb_paint_sweep_gradient; ///
private alias c_hb_reallocFn = extern(C) void* function(void* ptr, size_t size) nothrow;
__gshared c_hb_reallocFn c_hb_realloc; ///
private alias c_hb_script_from_iso15924_tagFn = extern(C) hb_script_t function(hb_tag_t tag) nothrow;
__gshared c_hb_script_from_iso15924_tagFn c_hb_script_from_iso15924_tag; ///
private alias c_hb_script_from_stringFn = extern(C) hb_script_t function(const(ubyte)* str, int len) nothrow;
__gshared c_hb_script_from_stringFn c_hb_script_from_string; ///
private alias c_hb_script_get_horizontal_directionFn = extern(C) hb_direction_t function(hb_script_t script) nothrow;
__gshared c_hb_script_get_horizontal_directionFn c_hb_script_get_horizontal_direction; ///
private alias c_hb_script_to_iso15924_tagFn = extern(C) hb_tag_t function(hb_script_t script) nothrow;
__gshared c_hb_script_to_iso15924_tagFn c_hb_script_to_iso15924_tag; ///
private alias c_hb_segment_properties_equalFn = extern(C) hb_bool_t function(const(hb_segment_properties_t)* a, const(hb_segment_properties_t)* b) nothrow;
__gshared c_hb_segment_properties_equalFn c_hb_segment_properties_equal; ///
private alias c_hb_segment_properties_hashFn = extern(C) uint function(const(hb_segment_properties_t)* p) nothrow;
__gshared c_hb_segment_properties_hashFn c_hb_segment_properties_hash; ///
private alias c_hb_segment_properties_overlayFn = extern(C) void function(hb_segment_properties_t* p, const(hb_segment_properties_t)* src) nothrow;
__gshared c_hb_segment_properties_overlayFn c_hb_segment_properties_overlay; ///
private alias c_hb_set_addFn = extern(C) void function(hb_set_t* set, hb_codepoint_t codepoint) nothrow;
__gshared c_hb_set_addFn c_hb_set_add; ///
private alias c_hb_set_add_rangeFn = extern(C) void function(hb_set_t* set, hb_codepoint_t first, hb_codepoint_t last) nothrow;
__gshared c_hb_set_add_rangeFn c_hb_set_add_range; ///
private alias c_hb_set_add_sorted_arrayFn = extern(C) void function(hb_set_t* set, const(hb_codepoint_t)* sortedCodepoints, uint numCodepoints) nothrow;
__gshared c_hb_set_add_sorted_arrayFn c_hb_set_add_sorted_array; ///
private alias c_hb_set_allocation_successfulFn = extern(C) hb_bool_t function(const(hb_set_t)* set) nothrow;
__gshared c_hb_set_allocation_successfulFn c_hb_set_allocation_successful; ///
private alias c_hb_set_clearFn = extern(C) void function(hb_set_t* set) nothrow;
__gshared c_hb_set_clearFn c_hb_set_clear; ///
private alias c_hb_set_copyFn = extern(C) hb_set_t* function(const(hb_set_t)* set) nothrow;
__gshared c_hb_set_copyFn c_hb_set_copy; ///
private alias c_hb_set_createFn = extern(C) hb_set_t* function() nothrow;
__gshared c_hb_set_createFn c_hb_set_create; ///
private alias c_hb_set_delFn = extern(C) void function(hb_set_t* set, hb_codepoint_t codepoint) nothrow;
__gshared c_hb_set_delFn c_hb_set_del; ///
private alias c_hb_set_del_rangeFn = extern(C) void function(hb_set_t* set, hb_codepoint_t first, hb_codepoint_t last) nothrow;
__gshared c_hb_set_del_rangeFn c_hb_set_del_range; ///
private alias c_hb_set_destroyFn = extern(C) void function(hb_set_t* set) nothrow;
__gshared c_hb_set_destroyFn c_hb_set_destroy; ///
private alias c_hb_set_get_emptyFn = extern(C) hb_set_t* function() nothrow;
__gshared c_hb_set_get_emptyFn c_hb_set_get_empty; ///
private alias c_hb_set_get_maxFn = extern(C) hb_codepoint_t function(const(hb_set_t)* set) nothrow;
__gshared c_hb_set_get_maxFn c_hb_set_get_max; ///
private alias c_hb_set_get_minFn = extern(C) hb_codepoint_t function(const(hb_set_t)* set) nothrow;
__gshared c_hb_set_get_minFn c_hb_set_get_min; ///
private alias c_hb_set_get_populationFn = extern(C) uint function(const(hb_set_t)* set) nothrow;
__gshared c_hb_set_get_populationFn c_hb_set_get_population; ///
private alias c_hb_set_get_user_dataFn = extern(C) void* function(const(hb_set_t)* set, hb_user_data_key_t* key) nothrow;
__gshared c_hb_set_get_user_dataFn c_hb_set_get_user_data; ///
private alias c_hb_set_hasFn = extern(C) hb_bool_t function(const(hb_set_t)* set, hb_codepoint_t codepoint) nothrow;
__gshared c_hb_set_hasFn c_hb_set_has; ///
private alias c_hb_set_hashFn = extern(C) uint function(const(hb_set_t)* set) nothrow;
__gshared c_hb_set_hashFn c_hb_set_hash; ///
private alias c_hb_set_intersectFn = extern(C) void function(hb_set_t* set, const(hb_set_t)* other) nothrow;
__gshared c_hb_set_intersectFn c_hb_set_intersect; ///
private alias c_hb_set_invertFn = extern(C) void function(hb_set_t* set) nothrow;
__gshared c_hb_set_invertFn c_hb_set_invert; ///
private alias c_hb_set_is_emptyFn = extern(C) hb_bool_t function(const(hb_set_t)* set) nothrow;
__gshared c_hb_set_is_emptyFn c_hb_set_is_empty; ///
private alias c_hb_set_is_equalFn = extern(C) hb_bool_t function(const(hb_set_t)* set, const(hb_set_t)* other) nothrow;
__gshared c_hb_set_is_equalFn c_hb_set_is_equal; ///
private alias c_hb_set_is_invertedFn = extern(C) hb_bool_t function(const(hb_set_t)* set) nothrow;
__gshared c_hb_set_is_invertedFn c_hb_set_is_inverted; ///
private alias c_hb_set_is_subsetFn = extern(C) hb_bool_t function(const(hb_set_t)* set, const(hb_set_t)* largerSet) nothrow;
__gshared c_hb_set_is_subsetFn c_hb_set_is_subset; ///
private alias c_hb_set_nextFn = extern(C) hb_bool_t function(const(hb_set_t)* set, hb_codepoint_t* codepoint) nothrow;
__gshared c_hb_set_nextFn c_hb_set_next; ///
private alias c_hb_set_next_manyFn = extern(C) uint function(const(hb_set_t)* set, hb_codepoint_t codepoint, hb_codepoint_t* out_, uint size) nothrow;
__gshared c_hb_set_next_manyFn c_hb_set_next_many; ///
private alias c_hb_set_next_rangeFn = extern(C) hb_bool_t function(const(hb_set_t)* set, hb_codepoint_t* first, hb_codepoint_t* last) nothrow;
__gshared c_hb_set_next_rangeFn c_hb_set_next_range; ///
private alias c_hb_set_previousFn = extern(C) hb_bool_t function(const(hb_set_t)* set, hb_codepoint_t* codepoint) nothrow;
__gshared c_hb_set_previousFn c_hb_set_previous; ///
private alias c_hb_set_previous_rangeFn = extern(C) hb_bool_t function(const(hb_set_t)* set, hb_codepoint_t* first, hb_codepoint_t* last) nothrow;
__gshared c_hb_set_previous_rangeFn c_hb_set_previous_range; ///
private alias c_hb_set_referenceFn = extern(C) hb_set_t* function(hb_set_t* set) nothrow;
__gshared c_hb_set_referenceFn c_hb_set_reference; ///
private alias c_hb_set_setFn = extern(C) void function(hb_set_t* set, const(hb_set_t)* other) nothrow;
__gshared c_hb_set_setFn c_hb_set_set; ///
private alias c_hb_set_set_user_dataFn = extern(C) hb_bool_t function(hb_set_t* set, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_set_set_user_dataFn c_hb_set_set_user_data; ///
private alias c_hb_set_subtractFn = extern(C) void function(hb_set_t* set, const(hb_set_t)* other) nothrow;
__gshared c_hb_set_subtractFn c_hb_set_subtract; ///
private alias c_hb_set_symmetric_differenceFn = extern(C) void function(hb_set_t* set, const(hb_set_t)* other) nothrow;
__gshared c_hb_set_symmetric_differenceFn c_hb_set_symmetric_difference; ///
private alias c_hb_set_unionFn = extern(C) void function(hb_set_t* set, const(hb_set_t)* other) nothrow;
__gshared c_hb_set_unionFn c_hb_set_union; ///
private alias c_hb_shapeFn = extern(C) void function(hb_font_t* font, hb_buffer_t* buffer, const(hb_feature_t)* features, uint numFeatures) nothrow;
__gshared c_hb_shapeFn c_hb_shape; ///
private alias c_hb_shape_fullFn = extern(C) hb_bool_t function(hb_font_t* font, hb_buffer_t* buffer, const(hb_feature_t)* features, uint numFeatures, const(char*)* shaperList) nothrow;
__gshared c_hb_shape_fullFn c_hb_shape_full; ///
private alias c_hb_shape_list_shapersFn = extern(C) const(char*)* function() nothrow;
__gshared c_hb_shape_list_shapersFn c_hb_shape_list_shapers; ///
private alias c_hb_shape_plan_createFn = extern(C) hb_shape_plan_t* function(hb_face_t* face, const(hb_segment_properties_t)* props, const(hb_feature_t)* userFeatures, uint numUserFeatures, const(char*)* shaperList) nothrow;
__gshared c_hb_shape_plan_createFn c_hb_shape_plan_create; ///
private alias c_hb_shape_plan_create2Fn = extern(C) hb_shape_plan_t* function(hb_face_t* face, const(hb_segment_properties_t)* props, const(hb_feature_t)* userFeatures, uint numUserFeatures, const(int)* coords, uint numCoords, const(char*)* shaperList) nothrow;
__gshared c_hb_shape_plan_create2Fn c_hb_shape_plan_create2; ///
private alias c_hb_shape_plan_create_cachedFn = extern(C) hb_shape_plan_t* function(hb_face_t* face, const(hb_segment_properties_t)* props, const(hb_feature_t)* userFeatures, uint numUserFeatures, const(char*)* shaperList) nothrow;
__gshared c_hb_shape_plan_create_cachedFn c_hb_shape_plan_create_cached; ///
private alias c_hb_shape_plan_create_cached2Fn = extern(C) hb_shape_plan_t* function(hb_face_t* face, const(hb_segment_properties_t)* props, const(hb_feature_t)* userFeatures, uint numUserFeatures, const(int)* coords, uint numCoords, const(char*)* shaperList) nothrow;
__gshared c_hb_shape_plan_create_cached2Fn c_hb_shape_plan_create_cached2; ///
private alias c_hb_shape_plan_destroyFn = extern(C) void function(hb_shape_plan_t* shapePlan) nothrow;
__gshared c_hb_shape_plan_destroyFn c_hb_shape_plan_destroy; ///
private alias c_hb_shape_plan_executeFn = extern(C) hb_bool_t function(hb_shape_plan_t* shapePlan, hb_font_t* font, hb_buffer_t* buffer, const(hb_feature_t)* features, uint numFeatures) nothrow;
__gshared c_hb_shape_plan_executeFn c_hb_shape_plan_execute; ///
private alias c_hb_shape_plan_get_emptyFn = extern(C) hb_shape_plan_t* function() nothrow;
__gshared c_hb_shape_plan_get_emptyFn c_hb_shape_plan_get_empty; ///
private alias c_hb_shape_plan_get_shaperFn = extern(C) const(char)* function(hb_shape_plan_t* shapePlan) nothrow;
__gshared c_hb_shape_plan_get_shaperFn c_hb_shape_plan_get_shaper; ///
private alias c_hb_shape_plan_get_user_dataFn = extern(C) void* function(const(hb_shape_plan_t)* shapePlan, hb_user_data_key_t* key) nothrow;
__gshared c_hb_shape_plan_get_user_dataFn c_hb_shape_plan_get_user_data; ///
private alias c_hb_shape_plan_referenceFn = extern(C) hb_shape_plan_t* function(hb_shape_plan_t* shapePlan) nothrow;
__gshared c_hb_shape_plan_referenceFn c_hb_shape_plan_reference; ///
private alias c_hb_shape_plan_set_user_dataFn = extern(C) hb_bool_t function(hb_shape_plan_t* shapePlan, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_shape_plan_set_user_dataFn c_hb_shape_plan_set_user_data; ///
private alias c_hb_style_get_valueFn = extern(C) float function(hb_font_t* font, hb_style_tag_t styleTag) nothrow;
__gshared c_hb_style_get_valueFn c_hb_style_get_value; ///
private alias c_hb_tag_from_stringFn = extern(C) hb_tag_t function(const(ubyte)* str, int len) nothrow;
__gshared c_hb_tag_from_stringFn c_hb_tag_from_string; ///
private alias c_hb_tag_to_stringFn = extern(C) void function(hb_tag_t tag, char* buf) nothrow;
__gshared c_hb_tag_to_stringFn c_hb_tag_to_string; ///
private alias c_hb_unicode_combining_classFn = extern(C) hb_unicode_combining_class_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode) nothrow;
__gshared c_hb_unicode_combining_classFn c_hb_unicode_combining_class; ///
private alias c_hb_unicode_composeFn = extern(C) hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t a, hb_codepoint_t b, hb_codepoint_t* ab) nothrow;
__gshared c_hb_unicode_composeFn c_hb_unicode_compose; ///
private alias c_hb_unicode_decomposeFn = extern(C) hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t ab, hb_codepoint_t* a, hb_codepoint_t* b) nothrow;
__gshared c_hb_unicode_decomposeFn c_hb_unicode_decompose; ///
private alias c_hb_unicode_decompose_compatibilityFn = extern(C) uint function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t u, hb_codepoint_t* decomposed) nothrow;
__gshared c_hb_unicode_decompose_compatibilityFn c_hb_unicode_decompose_compatibility; ///
private alias c_hb_unicode_eastasian_widthFn = extern(C) uint function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode) nothrow;
__gshared c_hb_unicode_eastasian_widthFn c_hb_unicode_eastasian_width; ///
private alias c_hb_unicode_funcs_createFn = extern(C) hb_unicode_funcs_t* function(hb_unicode_funcs_t* parent) nothrow;
__gshared c_hb_unicode_funcs_createFn c_hb_unicode_funcs_create; ///
private alias c_hb_unicode_funcs_destroyFn = extern(C) void function(hb_unicode_funcs_t* ufuncs) nothrow;
__gshared c_hb_unicode_funcs_destroyFn c_hb_unicode_funcs_destroy; ///
private alias c_hb_unicode_funcs_get_defaultFn = extern(C) hb_unicode_funcs_t* function() nothrow;
__gshared c_hb_unicode_funcs_get_defaultFn c_hb_unicode_funcs_get_default; ///
private alias c_hb_unicode_funcs_get_emptyFn = extern(C) hb_unicode_funcs_t* function() nothrow;
__gshared c_hb_unicode_funcs_get_emptyFn c_hb_unicode_funcs_get_empty; ///
private alias c_hb_unicode_funcs_get_parentFn = extern(C) hb_unicode_funcs_t* function(hb_unicode_funcs_t* ufuncs) nothrow;
__gshared c_hb_unicode_funcs_get_parentFn c_hb_unicode_funcs_get_parent; ///
private alias c_hb_unicode_funcs_get_user_dataFn = extern(C) void* function(const(hb_unicode_funcs_t)* ufuncs, hb_user_data_key_t* key) nothrow;
__gshared c_hb_unicode_funcs_get_user_dataFn c_hb_unicode_funcs_get_user_data; ///
private alias c_hb_unicode_funcs_is_immutableFn = extern(C) hb_bool_t function(hb_unicode_funcs_t* ufuncs) nothrow;
__gshared c_hb_unicode_funcs_is_immutableFn c_hb_unicode_funcs_is_immutable; ///
private alias c_hb_unicode_funcs_make_immutableFn = extern(C) void function(hb_unicode_funcs_t* ufuncs) nothrow;
__gshared c_hb_unicode_funcs_make_immutableFn c_hb_unicode_funcs_make_immutable; ///
private alias c_hb_unicode_funcs_referenceFn = extern(C) hb_unicode_funcs_t* function(hb_unicode_funcs_t* ufuncs) nothrow;
__gshared c_hb_unicode_funcs_referenceFn c_hb_unicode_funcs_reference; ///
private alias c_hb_unicode_funcs_set_combining_class_funcFn = extern(C) void function(hb_unicode_funcs_t* ufuncs, hb_unicode_combining_class_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_unicode_funcs_set_combining_class_funcFn c_hb_unicode_funcs_set_combining_class_func; ///
private alias c_hb_unicode_funcs_set_compose_funcFn = extern(C) void function(hb_unicode_funcs_t* ufuncs, hb_unicode_compose_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_unicode_funcs_set_compose_funcFn c_hb_unicode_funcs_set_compose_func; ///
private alias c_hb_unicode_funcs_set_decompose_compatibility_funcFn = extern(C) void function(hb_unicode_funcs_t* ufuncs, hb_unicode_decompose_compatibility_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_unicode_funcs_set_decompose_compatibility_funcFn c_hb_unicode_funcs_set_decompose_compatibility_func; ///
private alias c_hb_unicode_funcs_set_decompose_funcFn = extern(C) void function(hb_unicode_funcs_t* ufuncs, hb_unicode_decompose_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_unicode_funcs_set_decompose_funcFn c_hb_unicode_funcs_set_decompose_func; ///
private alias c_hb_unicode_funcs_set_eastasian_width_funcFn = extern(C) void function(hb_unicode_funcs_t* ufuncs, hb_unicode_eastasian_width_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_unicode_funcs_set_eastasian_width_funcFn c_hb_unicode_funcs_set_eastasian_width_func; ///
private alias c_hb_unicode_funcs_set_general_category_funcFn = extern(C) void function(hb_unicode_funcs_t* ufuncs, hb_unicode_general_category_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_unicode_funcs_set_general_category_funcFn c_hb_unicode_funcs_set_general_category_func; ///
private alias c_hb_unicode_funcs_set_mirroring_funcFn = extern(C) void function(hb_unicode_funcs_t* ufuncs, hb_unicode_mirroring_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_unicode_funcs_set_mirroring_funcFn c_hb_unicode_funcs_set_mirroring_func; ///
private alias c_hb_unicode_funcs_set_script_funcFn = extern(C) void function(hb_unicode_funcs_t* ufuncs, hb_unicode_script_func_t func, void* userData, hb_destroy_func_t destroy) nothrow;
__gshared c_hb_unicode_funcs_set_script_funcFn c_hb_unicode_funcs_set_script_func; ///
private alias c_hb_unicode_funcs_set_user_dataFn = extern(C) hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) nothrow;
__gshared c_hb_unicode_funcs_set_user_dataFn c_hb_unicode_funcs_set_user_data; ///
private alias c_hb_unicode_general_categoryFn = extern(C) hb_unicode_general_category_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode) nothrow;
__gshared c_hb_unicode_general_categoryFn c_hb_unicode_general_category; ///
private alias c_hb_unicode_mirroringFn = extern(C) hb_codepoint_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode) nothrow;
__gshared c_hb_unicode_mirroringFn c_hb_unicode_mirroring; ///
private alias c_hb_unicode_scriptFn = extern(C) hb_script_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode) nothrow;
__gshared c_hb_unicode_scriptFn c_hb_unicode_script; ///
private alias c_hb_variation_from_stringFn = extern(C) hb_bool_t function(const(ubyte)* str, int len, hb_variation_t* variation) nothrow;
__gshared c_hb_variation_from_stringFn c_hb_variation_from_string; ///
private alias c_hb_variation_to_stringFn = extern(C) void function(hb_variation_t* variation, char* buf, uint size) nothrow;
__gshared c_hb_variation_to_stringFn c_hb_variation_to_string; ///

// GlyphInfo
private alias c_hb_gobject_glyph_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_glyph_info_get_typeFn c_hb_gobject_glyph_info_get_type; ///

// GlyphPosition
private alias c_hb_gobject_glyph_position_get_typeFn = extern(C) GType function() nothrow;
__gshared c_hb_gobject_glyph_position_get_typeFn c_hb_gobject_glyph_position_get_type; ///

// Blob

/** */
alias hb_gobject_blob_get_type = c_hb_gobject_blob_get_type;

// Buffer

/** */
alias hb_gobject_buffer_get_type = c_hb_gobject_buffer_get_type;

// ColorLine

/** */
alias hb_gobject_color_line_get_type = c_hb_gobject_color_line_get_type;

// ColorStop

/** */
alias hb_gobject_color_stop_get_type = c_hb_gobject_color_stop_get_type;

// DrawFuncs

/** */
alias hb_gobject_draw_funcs_get_type = c_hb_gobject_draw_funcs_get_type;

// Face

/** */
alias hb_gobject_face_get_type = c_hb_gobject_face_get_type;

// Feature

/** */
alias hb_gobject_feature_get_type = c_hb_gobject_feature_get_type;

// Font

/** */
alias hb_gobject_font_get_type = c_hb_gobject_font_get_type;

// FontFuncs

/** */
alias hb_gobject_font_funcs_get_type = c_hb_gobject_font_funcs_get_type;

// Map

/** */
alias hb_gobject_map_get_type = c_hb_gobject_map_get_type;

// OtMathGlyphPart

/** */
alias hb_gobject_ot_math_glyph_part_get_type = c_hb_gobject_ot_math_glyph_part_get_type;

// OtMathGlyphVariant

/** */
alias hb_gobject_ot_math_glyph_variant_get_type = c_hb_gobject_ot_math_glyph_variant_get_type;

// OtVarAxisInfo

/** */
alias hb_gobject_ot_var_axis_info_get_type = c_hb_gobject_ot_var_axis_info_get_type;

// PaintFuncs

/** */
alias hb_gobject_paint_funcs_get_type = c_hb_gobject_paint_funcs_get_type;

// SegmentProperties

/** */
alias hb_gobject_segment_properties_get_type = c_hb_gobject_segment_properties_get_type;

// Set

/** */
alias hb_gobject_set_get_type = c_hb_gobject_set_get_type;

// ShapePlan

/** */
alias hb_gobject_shape_plan_get_type = c_hb_gobject_shape_plan_get_type;

// UnicodeFuncs

/** */
alias hb_gobject_unicode_funcs_get_type = c_hb_gobject_unicode_funcs_get_type;

// UserDataKey

/** */
alias hb_gobject_user_data_key_get_type = c_hb_gobject_user_data_key_get_type;

// DrawState

/** */
alias hb_gobject_draw_state_get_type = c_hb_gobject_draw_state_get_type;

// global

/** */
alias hb_aat_layout_feature_type_get_name_id = c_hb_aat_layout_feature_type_get_name_id;

/** */
alias hb_aat_layout_feature_type_get_selector_infos = c_hb_aat_layout_feature_type_get_selector_infos;

/** */
alias hb_aat_layout_get_feature_types = c_hb_aat_layout_get_feature_types;

/** */
alias hb_aat_layout_has_positioning = c_hb_aat_layout_has_positioning;

/** */
alias hb_aat_layout_has_substitution = c_hb_aat_layout_has_substitution;

/** */
alias hb_aat_layout_has_tracking = c_hb_aat_layout_has_tracking;

/** */
alias hb_blob_copy_writable_or_fail = c_hb_blob_copy_writable_or_fail;

/** */
alias hb_blob_create = c_hb_blob_create;

/** */
alias hb_blob_create_from_file = c_hb_blob_create_from_file;

/** */
alias hb_blob_create_from_file_or_fail = c_hb_blob_create_from_file_or_fail;

/** */
alias hb_blob_create_or_fail = c_hb_blob_create_or_fail;

/** */
alias hb_blob_create_sub_blob = c_hb_blob_create_sub_blob;

/** */
alias hb_blob_destroy = c_hb_blob_destroy;

/** */
alias hb_blob_get_data = c_hb_blob_get_data;

/** */
alias hb_blob_get_data_writable = c_hb_blob_get_data_writable;

/** */
alias hb_blob_get_empty = c_hb_blob_get_empty;

/** */
alias hb_blob_get_length = c_hb_blob_get_length;

/** */
alias hb_blob_get_user_data = c_hb_blob_get_user_data;

/** */
alias hb_blob_is_immutable = c_hb_blob_is_immutable;

/** */
alias hb_blob_make_immutable = c_hb_blob_make_immutable;

/** */
alias hb_blob_reference = c_hb_blob_reference;

/** */
alias hb_blob_set_user_data = c_hb_blob_set_user_data;

/** */
alias hb_buffer_add = c_hb_buffer_add;

/** */
alias hb_buffer_add_codepoints = c_hb_buffer_add_codepoints;

/** */
alias hb_buffer_add_latin1 = c_hb_buffer_add_latin1;

/** */
alias hb_buffer_add_utf16 = c_hb_buffer_add_utf16;

/** */
alias hb_buffer_add_utf32 = c_hb_buffer_add_utf32;

/** */
alias hb_buffer_add_utf8 = c_hb_buffer_add_utf8;

/** */
alias hb_buffer_allocation_successful = c_hb_buffer_allocation_successful;

/** */
alias hb_buffer_append = c_hb_buffer_append;

/** */
alias hb_buffer_clear_contents = c_hb_buffer_clear_contents;

/** */
alias hb_buffer_create = c_hb_buffer_create;

/** */
alias hb_buffer_create_similar = c_hb_buffer_create_similar;

/** */
alias hb_buffer_deserialize_glyphs = c_hb_buffer_deserialize_glyphs;

/** */
alias hb_buffer_deserialize_unicode = c_hb_buffer_deserialize_unicode;

/** */
alias hb_buffer_destroy = c_hb_buffer_destroy;

/** */
alias hb_buffer_diff = c_hb_buffer_diff;

/** */
alias hb_buffer_get_cluster_level = c_hb_buffer_get_cluster_level;

/** */
alias hb_buffer_get_content_type = c_hb_buffer_get_content_type;

/** */
alias hb_buffer_get_direction = c_hb_buffer_get_direction;

/** */
alias hb_buffer_get_empty = c_hb_buffer_get_empty;

/** */
alias hb_buffer_get_flags = c_hb_buffer_get_flags;

/** */
alias hb_buffer_get_glyph_infos = c_hb_buffer_get_glyph_infos;

/** */
alias hb_buffer_get_glyph_positions = c_hb_buffer_get_glyph_positions;

/** */
alias hb_buffer_get_invisible_glyph = c_hb_buffer_get_invisible_glyph;

/** */
alias hb_buffer_get_language = c_hb_buffer_get_language;

/** */
alias hb_buffer_get_length = c_hb_buffer_get_length;

/** */
alias hb_buffer_get_not_found_glyph = c_hb_buffer_get_not_found_glyph;

/** */
alias hb_buffer_get_not_found_variation_selector_glyph = c_hb_buffer_get_not_found_variation_selector_glyph;

/** */
alias hb_buffer_get_random_state = c_hb_buffer_get_random_state;

/** */
alias hb_buffer_get_replacement_codepoint = c_hb_buffer_get_replacement_codepoint;

/** */
alias hb_buffer_get_script = c_hb_buffer_get_script;

/** */
alias hb_buffer_get_segment_properties = c_hb_buffer_get_segment_properties;

/** */
alias hb_buffer_get_unicode_funcs = c_hb_buffer_get_unicode_funcs;

/** */
alias hb_buffer_get_user_data = c_hb_buffer_get_user_data;

/** */
alias hb_buffer_guess_segment_properties = c_hb_buffer_guess_segment_properties;

/** */
alias hb_buffer_has_positions = c_hb_buffer_has_positions;

/** */
alias hb_buffer_normalize_glyphs = c_hb_buffer_normalize_glyphs;

/** */
alias hb_buffer_pre_allocate = c_hb_buffer_pre_allocate;

/** */
alias hb_buffer_reference = c_hb_buffer_reference;

/** */
alias hb_buffer_reset = c_hb_buffer_reset;

/** */
alias hb_buffer_reverse = c_hb_buffer_reverse;

/** */
alias hb_buffer_reverse_clusters = c_hb_buffer_reverse_clusters;

/** */
alias hb_buffer_reverse_range = c_hb_buffer_reverse_range;

/** */
alias hb_buffer_serialize = c_hb_buffer_serialize;

/** */
alias hb_buffer_serialize_format_from_string = c_hb_buffer_serialize_format_from_string;

/** */
alias hb_buffer_serialize_format_to_string = c_hb_buffer_serialize_format_to_string;

/** */
alias hb_buffer_serialize_glyphs = c_hb_buffer_serialize_glyphs;

/** */
alias hb_buffer_serialize_list_formats = c_hb_buffer_serialize_list_formats;

/** */
alias hb_buffer_serialize_unicode = c_hb_buffer_serialize_unicode;

/** */
alias hb_buffer_set_cluster_level = c_hb_buffer_set_cluster_level;

/** */
alias hb_buffer_set_content_type = c_hb_buffer_set_content_type;

/** */
alias hb_buffer_set_direction = c_hb_buffer_set_direction;

/** */
alias hb_buffer_set_flags = c_hb_buffer_set_flags;

/** */
alias hb_buffer_set_invisible_glyph = c_hb_buffer_set_invisible_glyph;

/** */
alias hb_buffer_set_language = c_hb_buffer_set_language;

/** */
alias hb_buffer_set_length = c_hb_buffer_set_length;

/** */
alias hb_buffer_set_message_func = c_hb_buffer_set_message_func;

/** */
alias hb_buffer_set_not_found_glyph = c_hb_buffer_set_not_found_glyph;

/** */
alias hb_buffer_set_not_found_variation_selector_glyph = c_hb_buffer_set_not_found_variation_selector_glyph;

/** */
alias hb_buffer_set_random_state = c_hb_buffer_set_random_state;

/** */
alias hb_buffer_set_replacement_codepoint = c_hb_buffer_set_replacement_codepoint;

/** */
alias hb_buffer_set_script = c_hb_buffer_set_script;

/** */
alias hb_buffer_set_segment_properties = c_hb_buffer_set_segment_properties;

/** */
alias hb_buffer_set_unicode_funcs = c_hb_buffer_set_unicode_funcs;

/** */
alias hb_buffer_set_user_data = c_hb_buffer_set_user_data;

/** */
alias hb_calloc = c_hb_calloc;

/** */
alias hb_color_get_alpha = c_hb_color_get_alpha;

/** */
alias hb_color_get_blue = c_hb_color_get_blue;

/** */
alias hb_color_get_green = c_hb_color_get_green;

/** */
alias hb_color_get_red = c_hb_color_get_red;

/** */
alias hb_color_line_get_color_stops = c_hb_color_line_get_color_stops;

/** */
alias hb_color_line_get_extend = c_hb_color_line_get_extend;

/** */
alias hb_direction_from_string = c_hb_direction_from_string;

/** */
alias hb_direction_to_string = c_hb_direction_to_string;

/** */
alias hb_draw_close_path = c_hb_draw_close_path;

/** */
alias hb_draw_cubic_to = c_hb_draw_cubic_to;

/** */
alias hb_draw_funcs_create = c_hb_draw_funcs_create;

/** */
alias hb_draw_funcs_destroy = c_hb_draw_funcs_destroy;

/** */
alias hb_draw_funcs_get_empty = c_hb_draw_funcs_get_empty;

/** */
alias hb_draw_funcs_get_user_data = c_hb_draw_funcs_get_user_data;

/** */
alias hb_draw_funcs_is_immutable = c_hb_draw_funcs_is_immutable;

/** */
alias hb_draw_funcs_make_immutable = c_hb_draw_funcs_make_immutable;

/** */
alias hb_draw_funcs_reference = c_hb_draw_funcs_reference;

/** */
alias hb_draw_funcs_set_close_path_func = c_hb_draw_funcs_set_close_path_func;

/** */
alias hb_draw_funcs_set_cubic_to_func = c_hb_draw_funcs_set_cubic_to_func;

/** */
alias hb_draw_funcs_set_line_to_func = c_hb_draw_funcs_set_line_to_func;

/** */
alias hb_draw_funcs_set_move_to_func = c_hb_draw_funcs_set_move_to_func;

/** */
alias hb_draw_funcs_set_quadratic_to_func = c_hb_draw_funcs_set_quadratic_to_func;

/** */
alias hb_draw_funcs_set_user_data = c_hb_draw_funcs_set_user_data;

/** */
alias hb_draw_line_to = c_hb_draw_line_to;

/** */
alias hb_draw_move_to = c_hb_draw_move_to;

/** */
alias hb_draw_quadratic_to = c_hb_draw_quadratic_to;

/** */
alias hb_face_builder_add_table = c_hb_face_builder_add_table;

/** */
alias hb_face_builder_create = c_hb_face_builder_create;

/** */
alias hb_face_builder_sort_tables = c_hb_face_builder_sort_tables;

/** */
alias hb_face_collect_nominal_glyph_mapping = c_hb_face_collect_nominal_glyph_mapping;

/** */
alias hb_face_collect_unicodes = c_hb_face_collect_unicodes;

/** */
alias hb_face_collect_variation_selectors = c_hb_face_collect_variation_selectors;

/** */
alias hb_face_collect_variation_unicodes = c_hb_face_collect_variation_unicodes;

/** */
alias hb_face_count = c_hb_face_count;

/** */
alias hb_face_create = c_hb_face_create;

/** */
alias hb_face_create_for_tables = c_hb_face_create_for_tables;

/** */
alias hb_face_create_from_file_or_fail = c_hb_face_create_from_file_or_fail;

/** */
alias hb_face_create_from_file_or_fail_using = c_hb_face_create_from_file_or_fail_using;

/** */
alias hb_face_create_or_fail = c_hb_face_create_or_fail;

/** */
alias hb_face_create_or_fail_using = c_hb_face_create_or_fail_using;

/** */
alias hb_face_destroy = c_hb_face_destroy;

/** */
alias hb_face_get_empty = c_hb_face_get_empty;

/** */
alias hb_face_get_glyph_count = c_hb_face_get_glyph_count;

/** */
alias hb_face_get_index = c_hb_face_get_index;

/** */
alias hb_face_get_table_tags = c_hb_face_get_table_tags;

/** */
alias hb_face_get_upem = c_hb_face_get_upem;

/** */
alias hb_face_get_user_data = c_hb_face_get_user_data;

/** */
alias hb_face_is_immutable = c_hb_face_is_immutable;

/** */
alias hb_face_list_loaders = c_hb_face_list_loaders;

/** */
alias hb_face_make_immutable = c_hb_face_make_immutable;

/** */
alias hb_face_reference = c_hb_face_reference;

/** */
alias hb_face_reference_blob = c_hb_face_reference_blob;

/** */
alias hb_face_reference_table = c_hb_face_reference_table;

/** */
alias hb_face_set_get_table_tags_func = c_hb_face_set_get_table_tags_func;

/** */
alias hb_face_set_glyph_count = c_hb_face_set_glyph_count;

/** */
alias hb_face_set_index = c_hb_face_set_index;

/** */
alias hb_face_set_upem = c_hb_face_set_upem;

/** */
alias hb_face_set_user_data = c_hb_face_set_user_data;

/** */
alias hb_feature_from_string = c_hb_feature_from_string;

/** */
alias hb_feature_to_string = c_hb_feature_to_string;

/** */
alias hb_font_add_glyph_origin_for_direction = c_hb_font_add_glyph_origin_for_direction;

/** */
alias hb_font_changed = c_hb_font_changed;

/** */
alias hb_font_create = c_hb_font_create;

/** */
alias hb_font_create_sub_font = c_hb_font_create_sub_font;

/** */
alias hb_font_destroy = c_hb_font_destroy;

/** */
alias hb_font_draw_glyph = c_hb_font_draw_glyph;

/** */
alias hb_font_draw_glyph_or_fail = c_hb_font_draw_glyph_or_fail;

/** */
alias hb_font_funcs_create = c_hb_font_funcs_create;

/** */
alias hb_font_funcs_destroy = c_hb_font_funcs_destroy;

/** */
alias hb_font_funcs_get_empty = c_hb_font_funcs_get_empty;

/** */
alias hb_font_funcs_get_user_data = c_hb_font_funcs_get_user_data;

/** */
alias hb_font_funcs_is_immutable = c_hb_font_funcs_is_immutable;

/** */
alias hb_font_funcs_make_immutable = c_hb_font_funcs_make_immutable;

/** */
alias hb_font_funcs_reference = c_hb_font_funcs_reference;

/** */
alias hb_font_funcs_set_draw_glyph_func = c_hb_font_funcs_set_draw_glyph_func;

/** */
alias hb_font_funcs_set_draw_glyph_or_fail_func = c_hb_font_funcs_set_draw_glyph_or_fail_func;

/** */
alias hb_font_funcs_set_font_h_extents_func = c_hb_font_funcs_set_font_h_extents_func;

/** */
alias hb_font_funcs_set_font_v_extents_func = c_hb_font_funcs_set_font_v_extents_func;

/** */
alias hb_font_funcs_set_glyph_contour_point_func = c_hb_font_funcs_set_glyph_contour_point_func;

/** */
alias hb_font_funcs_set_glyph_extents_func = c_hb_font_funcs_set_glyph_extents_func;

/** */
alias hb_font_funcs_set_glyph_from_name_func = c_hb_font_funcs_set_glyph_from_name_func;

/** */
alias hb_font_funcs_set_glyph_func = c_hb_font_funcs_set_glyph_func;

/** */
alias hb_font_funcs_set_glyph_h_advance_func = c_hb_font_funcs_set_glyph_h_advance_func;

/** */
alias hb_font_funcs_set_glyph_h_advances_func = c_hb_font_funcs_set_glyph_h_advances_func;

/** */
alias hb_font_funcs_set_glyph_h_kerning_func = c_hb_font_funcs_set_glyph_h_kerning_func;

/** */
alias hb_font_funcs_set_glyph_h_origin_func = c_hb_font_funcs_set_glyph_h_origin_func;

/** */
alias hb_font_funcs_set_glyph_h_origins_func = c_hb_font_funcs_set_glyph_h_origins_func;

/** */
alias hb_font_funcs_set_glyph_name_func = c_hb_font_funcs_set_glyph_name_func;

/** */
alias hb_font_funcs_set_glyph_shape_func = c_hb_font_funcs_set_glyph_shape_func;

/** */
alias hb_font_funcs_set_glyph_v_advance_func = c_hb_font_funcs_set_glyph_v_advance_func;

/** */
alias hb_font_funcs_set_glyph_v_advances_func = c_hb_font_funcs_set_glyph_v_advances_func;

/** */
alias hb_font_funcs_set_glyph_v_kerning_func = c_hb_font_funcs_set_glyph_v_kerning_func;

/** */
alias hb_font_funcs_set_glyph_v_origin_func = c_hb_font_funcs_set_glyph_v_origin_func;

/** */
alias hb_font_funcs_set_glyph_v_origins_func = c_hb_font_funcs_set_glyph_v_origins_func;

/** */
alias hb_font_funcs_set_nominal_glyph_func = c_hb_font_funcs_set_nominal_glyph_func;

/** */
alias hb_font_funcs_set_nominal_glyphs_func = c_hb_font_funcs_set_nominal_glyphs_func;

/** */
alias hb_font_funcs_set_paint_glyph_func = c_hb_font_funcs_set_paint_glyph_func;

/** */
alias hb_font_funcs_set_paint_glyph_or_fail_func = c_hb_font_funcs_set_paint_glyph_or_fail_func;

/** */
alias hb_font_funcs_set_user_data = c_hb_font_funcs_set_user_data;

/** */
alias hb_font_funcs_set_variation_glyph_func = c_hb_font_funcs_set_variation_glyph_func;

/** */
alias hb_font_get_empty = c_hb_font_get_empty;

/** */
alias hb_font_get_extents_for_direction = c_hb_font_get_extents_for_direction;

/** */
alias hb_font_get_face = c_hb_font_get_face;

/** */
alias hb_font_get_glyph = c_hb_font_get_glyph;

/** */
alias hb_font_get_glyph_advance_for_direction = c_hb_font_get_glyph_advance_for_direction;

/** */
alias hb_font_get_glyph_advances_for_direction = c_hb_font_get_glyph_advances_for_direction;

/** */
alias hb_font_get_glyph_contour_point = c_hb_font_get_glyph_contour_point;

/** */
alias hb_font_get_glyph_contour_point_for_origin = c_hb_font_get_glyph_contour_point_for_origin;

/** */
alias hb_font_get_glyph_extents = c_hb_font_get_glyph_extents;

/** */
alias hb_font_get_glyph_extents_for_origin = c_hb_font_get_glyph_extents_for_origin;

/** */
alias hb_font_get_glyph_from_name = c_hb_font_get_glyph_from_name;

/** */
alias hb_font_get_glyph_h_advance = c_hb_font_get_glyph_h_advance;

/** */
alias hb_font_get_glyph_h_advances = c_hb_font_get_glyph_h_advances;

/** */
alias hb_font_get_glyph_h_kerning = c_hb_font_get_glyph_h_kerning;

/** */
alias hb_font_get_glyph_h_origin = c_hb_font_get_glyph_h_origin;

/** */
alias hb_font_get_glyph_h_origins = c_hb_font_get_glyph_h_origins;

/** */
alias hb_font_get_glyph_kerning_for_direction = c_hb_font_get_glyph_kerning_for_direction;

/** */
alias hb_font_get_glyph_name = c_hb_font_get_glyph_name;

/** */
alias hb_font_get_glyph_origin_for_direction = c_hb_font_get_glyph_origin_for_direction;

/** */
alias hb_font_get_glyph_shape = c_hb_font_get_glyph_shape;

/** */
alias hb_font_get_glyph_v_advance = c_hb_font_get_glyph_v_advance;

/** */
alias hb_font_get_glyph_v_advances = c_hb_font_get_glyph_v_advances;

/** */
alias hb_font_get_glyph_v_kerning = c_hb_font_get_glyph_v_kerning;

/** */
alias hb_font_get_glyph_v_origin = c_hb_font_get_glyph_v_origin;

/** */
alias hb_font_get_glyph_v_origins = c_hb_font_get_glyph_v_origins;

/** */
alias hb_font_get_h_extents = c_hb_font_get_h_extents;

/** */
alias hb_font_get_nominal_glyph = c_hb_font_get_nominal_glyph;

/** */
alias hb_font_get_nominal_glyphs = c_hb_font_get_nominal_glyphs;

/** */
alias hb_font_get_parent = c_hb_font_get_parent;

/** */
alias hb_font_get_ppem = c_hb_font_get_ppem;

/** */
alias hb_font_get_ptem = c_hb_font_get_ptem;

/** */
alias hb_font_get_scale = c_hb_font_get_scale;

/** */
alias hb_font_get_serial = c_hb_font_get_serial;

/** */
alias hb_font_get_synthetic_bold = c_hb_font_get_synthetic_bold;

/** */
alias hb_font_get_synthetic_slant = c_hb_font_get_synthetic_slant;

/** */
alias hb_font_get_user_data = c_hb_font_get_user_data;

/** */
alias hb_font_get_v_extents = c_hb_font_get_v_extents;

/** */
alias hb_font_get_var_coords_design = c_hb_font_get_var_coords_design;

/** */
alias hb_font_get_var_coords_normalized = c_hb_font_get_var_coords_normalized;

/** */
alias hb_font_get_var_named_instance = c_hb_font_get_var_named_instance;

/** */
alias hb_font_get_variation_glyph = c_hb_font_get_variation_glyph;

/** */
alias hb_font_glyph_from_string = c_hb_font_glyph_from_string;

/** */
alias hb_font_glyph_to_string = c_hb_font_glyph_to_string;

/** */
alias hb_font_is_immutable = c_hb_font_is_immutable;

/** */
alias hb_font_is_synthetic = c_hb_font_is_synthetic;

/** */
alias hb_font_list_funcs = c_hb_font_list_funcs;

/** */
alias hb_font_make_immutable = c_hb_font_make_immutable;

/** */
alias hb_font_paint_glyph = c_hb_font_paint_glyph;

/** */
alias hb_font_paint_glyph_or_fail = c_hb_font_paint_glyph_or_fail;

/** */
alias hb_font_reference = c_hb_font_reference;

/** */
alias hb_font_set_face = c_hb_font_set_face;

/** */
alias hb_font_set_funcs = c_hb_font_set_funcs;

/** */
alias hb_font_set_funcs_data = c_hb_font_set_funcs_data;

/** */
alias hb_font_set_funcs_using = c_hb_font_set_funcs_using;

/** */
alias hb_font_set_parent = c_hb_font_set_parent;

/** */
alias hb_font_set_ppem = c_hb_font_set_ppem;

/** */
alias hb_font_set_ptem = c_hb_font_set_ptem;

/** */
alias hb_font_set_scale = c_hb_font_set_scale;

/** */
alias hb_font_set_synthetic_bold = c_hb_font_set_synthetic_bold;

/** */
alias hb_font_set_synthetic_slant = c_hb_font_set_synthetic_slant;

/** */
alias hb_font_set_user_data = c_hb_font_set_user_data;

/** */
alias hb_font_set_var_coords_design = c_hb_font_set_var_coords_design;

/** */
alias hb_font_set_var_coords_normalized = c_hb_font_set_var_coords_normalized;

/** */
alias hb_font_set_var_named_instance = c_hb_font_set_var_named_instance;

/** */
alias hb_font_set_variation = c_hb_font_set_variation;

/** */
alias hb_font_set_variations = c_hb_font_set_variations;

/** */
alias hb_font_subtract_glyph_origin_for_direction = c_hb_font_subtract_glyph_origin_for_direction;

/** */
alias hb_free = c_hb_free;

/** */
alias hb_ft_face_create = c_hb_ft_face_create;

/** */
alias hb_ft_face_create_cached = c_hb_ft_face_create_cached;

/** */
alias hb_ft_face_create_from_blob_or_fail = c_hb_ft_face_create_from_blob_or_fail;

/** */
alias hb_ft_face_create_from_file_or_fail = c_hb_ft_face_create_from_file_or_fail;

/** */
alias hb_ft_face_create_referenced = c_hb_ft_face_create_referenced;

/** */
alias hb_ft_font_changed = c_hb_ft_font_changed;

/** */
alias hb_ft_font_create = c_hb_ft_font_create;

/** */
alias hb_ft_font_create_referenced = c_hb_ft_font_create_referenced;

/** */
alias hb_ft_font_get_face = c_hb_ft_font_get_face;

/** */
alias hb_ft_font_get_ft_face = c_hb_ft_font_get_ft_face;

/** */
alias hb_ft_font_get_load_flags = c_hb_ft_font_get_load_flags;

/** */
alias hb_ft_font_lock_face = c_hb_ft_font_lock_face;

/** */
alias hb_ft_font_set_funcs = c_hb_ft_font_set_funcs;

/** */
alias hb_ft_font_set_load_flags = c_hb_ft_font_set_load_flags;

/** */
alias hb_ft_font_unlock_face = c_hb_ft_font_unlock_face;

/** */
alias hb_ft_hb_font_changed = c_hb_ft_hb_font_changed;

/** */
alias hb_glib_blob_create = c_hb_glib_blob_create;

/** */
alias hb_glib_get_unicode_funcs = c_hb_glib_get_unicode_funcs;

/** */
alias hb_glib_script_from_script = c_hb_glib_script_from_script;

/** */
alias hb_glib_script_to_script = c_hb_glib_script_to_script;

/** */
alias hb_glyph_info_get_glyph_flags = c_hb_glyph_info_get_glyph_flags;

/** */
alias hb_language_from_string = c_hb_language_from_string;

/** */
alias hb_language_get_default = c_hb_language_get_default;

/** */
alias hb_language_matches = c_hb_language_matches;

/** */
alias hb_language_to_string = c_hb_language_to_string;

/** */
alias hb_malloc = c_hb_malloc;

/** */
alias hb_map_allocation_successful = c_hb_map_allocation_successful;

/** */
alias hb_map_clear = c_hb_map_clear;

/** */
alias hb_map_copy = c_hb_map_copy;

/** */
alias hb_map_create = c_hb_map_create;

/** */
alias hb_map_del = c_hb_map_del;

/** */
alias hb_map_destroy = c_hb_map_destroy;

/** */
alias hb_map_get = c_hb_map_get;

/** */
alias hb_map_get_empty = c_hb_map_get_empty;

/** */
alias hb_map_get_population = c_hb_map_get_population;

/** */
alias hb_map_get_user_data = c_hb_map_get_user_data;

/** */
alias hb_map_has = c_hb_map_has;

/** */
alias hb_map_hash = c_hb_map_hash;

/** */
alias hb_map_is_empty = c_hb_map_is_empty;

/** */
alias hb_map_is_equal = c_hb_map_is_equal;

/** */
alias hb_map_keys = c_hb_map_keys;

/** */
alias hb_map_next = c_hb_map_next;

/** */
alias hb_map_reference = c_hb_map_reference;

/** */
alias hb_map_set = c_hb_map_set;

/** */
alias hb_map_set_user_data = c_hb_map_set_user_data;

/** */
alias hb_map_update = c_hb_map_update;

/** */
alias hb_map_values = c_hb_map_values;

/** */
alias hb_ot_color_glyph_get_layers = c_hb_ot_color_glyph_get_layers;

/** */
alias hb_ot_color_glyph_has_paint = c_hb_ot_color_glyph_has_paint;

/** */
alias hb_ot_color_glyph_reference_png = c_hb_ot_color_glyph_reference_png;

/** */
alias hb_ot_color_glyph_reference_svg = c_hb_ot_color_glyph_reference_svg;

/** */
alias hb_ot_color_has_layers = c_hb_ot_color_has_layers;

/** */
alias hb_ot_color_has_paint = c_hb_ot_color_has_paint;

/** */
alias hb_ot_color_has_palettes = c_hb_ot_color_has_palettes;

/** */
alias hb_ot_color_has_png = c_hb_ot_color_has_png;

/** */
alias hb_ot_color_has_svg = c_hb_ot_color_has_svg;

/** */
alias hb_ot_color_palette_color_get_name_id = c_hb_ot_color_palette_color_get_name_id;

/** */
alias hb_ot_color_palette_get_colors = c_hb_ot_color_palette_get_colors;

/** */
alias hb_ot_color_palette_get_count = c_hb_ot_color_palette_get_count;

/** */
alias hb_ot_color_palette_get_flags = c_hb_ot_color_palette_get_flags;

/** */
alias hb_ot_color_palette_get_name_id = c_hb_ot_color_palette_get_name_id;

/** */
alias hb_ot_font_set_funcs = c_hb_ot_font_set_funcs;

/** */
alias hb_ot_layout_collect_features = c_hb_ot_layout_collect_features;

/** */
alias hb_ot_layout_collect_features_map = c_hb_ot_layout_collect_features_map;

/** */
alias hb_ot_layout_collect_lookups = c_hb_ot_layout_collect_lookups;

/** */
alias hb_ot_layout_feature_get_characters = c_hb_ot_layout_feature_get_characters;

/** */
alias hb_ot_layout_feature_get_lookups = c_hb_ot_layout_feature_get_lookups;

/** */
alias hb_ot_layout_feature_get_name_ids = c_hb_ot_layout_feature_get_name_ids;

/** */
alias hb_ot_layout_feature_with_variations_get_lookups = c_hb_ot_layout_feature_with_variations_get_lookups;

/** */
alias hb_ot_layout_get_attach_points = c_hb_ot_layout_get_attach_points;

/** */
alias hb_ot_layout_get_baseline = c_hb_ot_layout_get_baseline;

/** */
alias hb_ot_layout_get_baseline2 = c_hb_ot_layout_get_baseline2;

/** */
alias hb_ot_layout_get_baseline_with_fallback = c_hb_ot_layout_get_baseline_with_fallback;

/** */
alias hb_ot_layout_get_baseline_with_fallback2 = c_hb_ot_layout_get_baseline_with_fallback2;

/** */
alias hb_ot_layout_get_font_extents = c_hb_ot_layout_get_font_extents;

/** */
alias hb_ot_layout_get_font_extents2 = c_hb_ot_layout_get_font_extents2;

/** */
alias hb_ot_layout_get_glyph_class = c_hb_ot_layout_get_glyph_class;

/** */
alias hb_ot_layout_get_glyphs_in_class = c_hb_ot_layout_get_glyphs_in_class;

/** */
alias hb_ot_layout_get_horizontal_baseline_tag_for_script = c_hb_ot_layout_get_horizontal_baseline_tag_for_script;

/** */
alias hb_ot_layout_get_ligature_carets = c_hb_ot_layout_get_ligature_carets;

/** */
alias hb_ot_layout_get_size_params = c_hb_ot_layout_get_size_params;

/** */
alias hb_ot_layout_has_glyph_classes = c_hb_ot_layout_has_glyph_classes;

/** */
alias hb_ot_layout_has_positioning = c_hb_ot_layout_has_positioning;

/** */
alias hb_ot_layout_has_substitution = c_hb_ot_layout_has_substitution;

/** */
alias hb_ot_layout_language_find_feature = c_hb_ot_layout_language_find_feature;

/** */
alias hb_ot_layout_language_get_feature_indexes = c_hb_ot_layout_language_get_feature_indexes;

/** */
alias hb_ot_layout_language_get_feature_tags = c_hb_ot_layout_language_get_feature_tags;

/** */
alias hb_ot_layout_language_get_required_feature = c_hb_ot_layout_language_get_required_feature;

/** */
alias hb_ot_layout_language_get_required_feature_index = c_hb_ot_layout_language_get_required_feature_index;

/** */
alias hb_ot_layout_lookup_collect_glyph_alternates = c_hb_ot_layout_lookup_collect_glyph_alternates;

/** */
alias hb_ot_layout_lookup_collect_glyphs = c_hb_ot_layout_lookup_collect_glyphs;

/** */
alias hb_ot_layout_lookup_get_glyph_alternates = c_hb_ot_layout_lookup_get_glyph_alternates;

/** */
alias hb_ot_layout_lookup_get_optical_bound = c_hb_ot_layout_lookup_get_optical_bound;

/** */
alias hb_ot_layout_lookup_substitute_closure = c_hb_ot_layout_lookup_substitute_closure;

/** */
alias hb_ot_layout_lookup_would_substitute = c_hb_ot_layout_lookup_would_substitute;

/** */
alias hb_ot_layout_lookups_substitute_closure = c_hb_ot_layout_lookups_substitute_closure;

/** */
alias hb_ot_layout_script_find_language = c_hb_ot_layout_script_find_language;

/** */
alias hb_ot_layout_script_get_language_tags = c_hb_ot_layout_script_get_language_tags;

/** */
alias hb_ot_layout_script_select_language = c_hb_ot_layout_script_select_language;

/** */
alias hb_ot_layout_script_select_language2 = c_hb_ot_layout_script_select_language2;

/** */
alias hb_ot_layout_table_choose_script = c_hb_ot_layout_table_choose_script;

/** */
alias hb_ot_layout_table_find_feature_variations = c_hb_ot_layout_table_find_feature_variations;

/** */
alias hb_ot_layout_table_find_script = c_hb_ot_layout_table_find_script;

/** */
alias hb_ot_layout_table_get_feature_tags = c_hb_ot_layout_table_get_feature_tags;

/** */
alias hb_ot_layout_table_get_lookup_count = c_hb_ot_layout_table_get_lookup_count;

/** */
alias hb_ot_layout_table_get_script_tags = c_hb_ot_layout_table_get_script_tags;

/** */
alias hb_ot_layout_table_select_script = c_hb_ot_layout_table_select_script;

/** */
alias hb_ot_math_get_constant = c_hb_ot_math_get_constant;

/** */
alias hb_ot_math_get_glyph_assembly = c_hb_ot_math_get_glyph_assembly;

/** */
alias hb_ot_math_get_glyph_italics_correction = c_hb_ot_math_get_glyph_italics_correction;

/** */
alias hb_ot_math_get_glyph_kerning = c_hb_ot_math_get_glyph_kerning;

/** */
alias hb_ot_math_get_glyph_kernings = c_hb_ot_math_get_glyph_kernings;

/** */
alias hb_ot_math_get_glyph_top_accent_attachment = c_hb_ot_math_get_glyph_top_accent_attachment;

/** */
alias hb_ot_math_get_glyph_variants = c_hb_ot_math_get_glyph_variants;

/** */
alias hb_ot_math_get_min_connector_overlap = c_hb_ot_math_get_min_connector_overlap;

/** */
alias hb_ot_math_has_data = c_hb_ot_math_has_data;

/** */
alias hb_ot_math_is_glyph_extended_shape = c_hb_ot_math_is_glyph_extended_shape;

/** */
alias hb_ot_meta_get_entry_tags = c_hb_ot_meta_get_entry_tags;

/** */
alias hb_ot_meta_reference_entry = c_hb_ot_meta_reference_entry;

/** */
alias hb_ot_metrics_get_position = c_hb_ot_metrics_get_position;

/** */
alias hb_ot_metrics_get_position_with_fallback = c_hb_ot_metrics_get_position_with_fallback;

/** */
alias hb_ot_metrics_get_variation = c_hb_ot_metrics_get_variation;

/** */
alias hb_ot_metrics_get_x_variation = c_hb_ot_metrics_get_x_variation;

/** */
alias hb_ot_metrics_get_y_variation = c_hb_ot_metrics_get_y_variation;

/** */
alias hb_ot_name_get_utf16 = c_hb_ot_name_get_utf16;

/** */
alias hb_ot_name_get_utf32 = c_hb_ot_name_get_utf32;

/** */
alias hb_ot_name_get_utf8 = c_hb_ot_name_get_utf8;

/** */
alias hb_ot_name_list_names = c_hb_ot_name_list_names;

/** */
alias hb_ot_shape_glyphs_closure = c_hb_ot_shape_glyphs_closure;

/** */
alias hb_ot_shape_plan_collect_lookups = c_hb_ot_shape_plan_collect_lookups;

/** */
alias hb_ot_shape_plan_get_feature_tags = c_hb_ot_shape_plan_get_feature_tags;

/** */
alias hb_ot_tag_from_language = c_hb_ot_tag_from_language;

/** */
alias hb_ot_tag_to_language = c_hb_ot_tag_to_language;

/** */
alias hb_ot_tag_to_script = c_hb_ot_tag_to_script;

/** */
alias hb_ot_tags_from_script = c_hb_ot_tags_from_script;

/** */
alias hb_ot_tags_from_script_and_language = c_hb_ot_tags_from_script_and_language;

/** */
alias hb_ot_tags_to_script_and_language = c_hb_ot_tags_to_script_and_language;

/** */
alias hb_ot_var_find_axis = c_hb_ot_var_find_axis;

/** */
alias hb_ot_var_find_axis_info = c_hb_ot_var_find_axis_info;

/** */
alias hb_ot_var_get_axes = c_hb_ot_var_get_axes;

/** */
alias hb_ot_var_get_axis_count = c_hb_ot_var_get_axis_count;

/** */
alias hb_ot_var_get_axis_infos = c_hb_ot_var_get_axis_infos;

/** */
alias hb_ot_var_get_named_instance_count = c_hb_ot_var_get_named_instance_count;

/** */
alias hb_ot_var_has_data = c_hb_ot_var_has_data;

/** */
alias hb_ot_var_named_instance_get_design_coords = c_hb_ot_var_named_instance_get_design_coords;

/** */
alias hb_ot_var_named_instance_get_postscript_name_id = c_hb_ot_var_named_instance_get_postscript_name_id;

/** */
alias hb_ot_var_named_instance_get_subfamily_name_id = c_hb_ot_var_named_instance_get_subfamily_name_id;

/** */
alias hb_ot_var_normalize_coords = c_hb_ot_var_normalize_coords;

/** */
alias hb_ot_var_normalize_variations = c_hb_ot_var_normalize_variations;

/** */
alias hb_paint_color = c_hb_paint_color;

/** */
alias hb_paint_color_glyph = c_hb_paint_color_glyph;

/** */
alias hb_paint_custom_palette_color = c_hb_paint_custom_palette_color;

/** */
alias hb_paint_funcs_create = c_hb_paint_funcs_create;

/** */
alias hb_paint_funcs_destroy = c_hb_paint_funcs_destroy;

/** */
alias hb_paint_funcs_get_empty = c_hb_paint_funcs_get_empty;

/** */
alias hb_paint_funcs_get_user_data = c_hb_paint_funcs_get_user_data;

/** */
alias hb_paint_funcs_is_immutable = c_hb_paint_funcs_is_immutable;

/** */
alias hb_paint_funcs_make_immutable = c_hb_paint_funcs_make_immutable;

/** */
alias hb_paint_funcs_reference = c_hb_paint_funcs_reference;

/** */
alias hb_paint_funcs_set_color_func = c_hb_paint_funcs_set_color_func;

/** */
alias hb_paint_funcs_set_color_glyph_func = c_hb_paint_funcs_set_color_glyph_func;

/** */
alias hb_paint_funcs_set_custom_palette_color_func = c_hb_paint_funcs_set_custom_palette_color_func;

/** */
alias hb_paint_funcs_set_image_func = c_hb_paint_funcs_set_image_func;

/** */
alias hb_paint_funcs_set_linear_gradient_func = c_hb_paint_funcs_set_linear_gradient_func;

/** */
alias hb_paint_funcs_set_pop_clip_func = c_hb_paint_funcs_set_pop_clip_func;

/** */
alias hb_paint_funcs_set_pop_group_func = c_hb_paint_funcs_set_pop_group_func;

/** */
alias hb_paint_funcs_set_pop_transform_func = c_hb_paint_funcs_set_pop_transform_func;

/** */
alias hb_paint_funcs_set_push_clip_glyph_func = c_hb_paint_funcs_set_push_clip_glyph_func;

/** */
alias hb_paint_funcs_set_push_clip_rectangle_func = c_hb_paint_funcs_set_push_clip_rectangle_func;

/** */
alias hb_paint_funcs_set_push_group_func = c_hb_paint_funcs_set_push_group_func;

/** */
alias hb_paint_funcs_set_push_transform_func = c_hb_paint_funcs_set_push_transform_func;

/** */
alias hb_paint_funcs_set_radial_gradient_func = c_hb_paint_funcs_set_radial_gradient_func;

/** */
alias hb_paint_funcs_set_sweep_gradient_func = c_hb_paint_funcs_set_sweep_gradient_func;

/** */
alias hb_paint_funcs_set_user_data = c_hb_paint_funcs_set_user_data;

/** */
alias hb_paint_image = c_hb_paint_image;

/** */
alias hb_paint_linear_gradient = c_hb_paint_linear_gradient;

/** */
alias hb_paint_pop_clip = c_hb_paint_pop_clip;

/** */
alias hb_paint_pop_group = c_hb_paint_pop_group;

/** */
alias hb_paint_pop_transform = c_hb_paint_pop_transform;

/** */
alias hb_paint_push_clip_glyph = c_hb_paint_push_clip_glyph;

/** */
alias hb_paint_push_clip_rectangle = c_hb_paint_push_clip_rectangle;

/** */
alias hb_paint_push_font_transform = c_hb_paint_push_font_transform;

/** */
alias hb_paint_push_group = c_hb_paint_push_group;

/** */
alias hb_paint_push_inverse_font_transform = c_hb_paint_push_inverse_font_transform;

/** */
alias hb_paint_push_transform = c_hb_paint_push_transform;

/** */
alias hb_paint_radial_gradient = c_hb_paint_radial_gradient;

/** */
alias hb_paint_sweep_gradient = c_hb_paint_sweep_gradient;

/** */
alias hb_realloc = c_hb_realloc;

/** */
alias hb_script_from_iso15924_tag = c_hb_script_from_iso15924_tag;

/** */
alias hb_script_from_string = c_hb_script_from_string;

/** */
alias hb_script_get_horizontal_direction = c_hb_script_get_horizontal_direction;

/** */
alias hb_script_to_iso15924_tag = c_hb_script_to_iso15924_tag;

/** */
alias hb_segment_properties_equal = c_hb_segment_properties_equal;

/** */
alias hb_segment_properties_hash = c_hb_segment_properties_hash;

/** */
alias hb_segment_properties_overlay = c_hb_segment_properties_overlay;

/** */
alias hb_set_add = c_hb_set_add;

/** */
alias hb_set_add_range = c_hb_set_add_range;

/** */
alias hb_set_add_sorted_array = c_hb_set_add_sorted_array;

/** */
alias hb_set_allocation_successful = c_hb_set_allocation_successful;

/** */
alias hb_set_clear = c_hb_set_clear;

/** */
alias hb_set_copy = c_hb_set_copy;

/** */
alias hb_set_create = c_hb_set_create;

/** */
alias hb_set_del = c_hb_set_del;

/** */
alias hb_set_del_range = c_hb_set_del_range;

/** */
alias hb_set_destroy = c_hb_set_destroy;

/** */
alias hb_set_get_empty = c_hb_set_get_empty;

/** */
alias hb_set_get_max = c_hb_set_get_max;

/** */
alias hb_set_get_min = c_hb_set_get_min;

/** */
alias hb_set_get_population = c_hb_set_get_population;

/** */
alias hb_set_get_user_data = c_hb_set_get_user_data;

/** */
alias hb_set_has = c_hb_set_has;

/** */
alias hb_set_hash = c_hb_set_hash;

/** */
alias hb_set_intersect = c_hb_set_intersect;

/** */
alias hb_set_invert = c_hb_set_invert;

/** */
alias hb_set_is_empty = c_hb_set_is_empty;

/** */
alias hb_set_is_equal = c_hb_set_is_equal;

/** */
alias hb_set_is_inverted = c_hb_set_is_inverted;

/** */
alias hb_set_is_subset = c_hb_set_is_subset;

/** */
alias hb_set_next = c_hb_set_next;

/** */
alias hb_set_next_many = c_hb_set_next_many;

/** */
alias hb_set_next_range = c_hb_set_next_range;

/** */
alias hb_set_previous = c_hb_set_previous;

/** */
alias hb_set_previous_range = c_hb_set_previous_range;

/** */
alias hb_set_reference = c_hb_set_reference;

/** */
alias hb_set_set = c_hb_set_set;

/** */
alias hb_set_set_user_data = c_hb_set_set_user_data;

/** */
alias hb_set_subtract = c_hb_set_subtract;

/** */
alias hb_set_symmetric_difference = c_hb_set_symmetric_difference;

/** */
alias hb_set_union = c_hb_set_union;

/** */
alias hb_shape = c_hb_shape;

/** */
alias hb_shape_full = c_hb_shape_full;

/** */
alias hb_shape_list_shapers = c_hb_shape_list_shapers;

/** */
alias hb_shape_plan_create = c_hb_shape_plan_create;

/** */
alias hb_shape_plan_create2 = c_hb_shape_plan_create2;

/** */
alias hb_shape_plan_create_cached = c_hb_shape_plan_create_cached;

/** */
alias hb_shape_plan_create_cached2 = c_hb_shape_plan_create_cached2;

/** */
alias hb_shape_plan_destroy = c_hb_shape_plan_destroy;

/** */
alias hb_shape_plan_execute = c_hb_shape_plan_execute;

/** */
alias hb_shape_plan_get_empty = c_hb_shape_plan_get_empty;

/** */
alias hb_shape_plan_get_shaper = c_hb_shape_plan_get_shaper;

/** */
alias hb_shape_plan_get_user_data = c_hb_shape_plan_get_user_data;

/** */
alias hb_shape_plan_reference = c_hb_shape_plan_reference;

/** */
alias hb_shape_plan_set_user_data = c_hb_shape_plan_set_user_data;

/** */
alias hb_style_get_value = c_hb_style_get_value;

/** */
alias hb_tag_from_string = c_hb_tag_from_string;

/** */
alias hb_tag_to_string = c_hb_tag_to_string;

/** */
alias hb_unicode_combining_class = c_hb_unicode_combining_class;

/** */
alias hb_unicode_compose = c_hb_unicode_compose;

/** */
alias hb_unicode_decompose = c_hb_unicode_decompose;

/** */
alias hb_unicode_decompose_compatibility = c_hb_unicode_decompose_compatibility;

/** */
alias hb_unicode_eastasian_width = c_hb_unicode_eastasian_width;

/** */
alias hb_unicode_funcs_create = c_hb_unicode_funcs_create;

/** */
alias hb_unicode_funcs_destroy = c_hb_unicode_funcs_destroy;

/** */
alias hb_unicode_funcs_get_default = c_hb_unicode_funcs_get_default;

/** */
alias hb_unicode_funcs_get_empty = c_hb_unicode_funcs_get_empty;

/** */
alias hb_unicode_funcs_get_parent = c_hb_unicode_funcs_get_parent;

/** */
alias hb_unicode_funcs_get_user_data = c_hb_unicode_funcs_get_user_data;

/** */
alias hb_unicode_funcs_is_immutable = c_hb_unicode_funcs_is_immutable;

/** */
alias hb_unicode_funcs_make_immutable = c_hb_unicode_funcs_make_immutable;

/** */
alias hb_unicode_funcs_reference = c_hb_unicode_funcs_reference;

/** */
alias hb_unicode_funcs_set_combining_class_func = c_hb_unicode_funcs_set_combining_class_func;

/** */
alias hb_unicode_funcs_set_compose_func = c_hb_unicode_funcs_set_compose_func;

/** */
alias hb_unicode_funcs_set_decompose_compatibility_func = c_hb_unicode_funcs_set_decompose_compatibility_func;

/** */
alias hb_unicode_funcs_set_decompose_func = c_hb_unicode_funcs_set_decompose_func;

/** */
alias hb_unicode_funcs_set_eastasian_width_func = c_hb_unicode_funcs_set_eastasian_width_func;

/** */
alias hb_unicode_funcs_set_general_category_func = c_hb_unicode_funcs_set_general_category_func;

/** */
alias hb_unicode_funcs_set_mirroring_func = c_hb_unicode_funcs_set_mirroring_func;

/** */
alias hb_unicode_funcs_set_script_func = c_hb_unicode_funcs_set_script_func;

/** */
alias hb_unicode_funcs_set_user_data = c_hb_unicode_funcs_set_user_data;

/** */
alias hb_unicode_general_category = c_hb_unicode_general_category;

/** */
alias hb_unicode_mirroring = c_hb_unicode_mirroring;

/** */
alias hb_unicode_script = c_hb_unicode_script;

/** */
alias hb_variation_from_string = c_hb_variation_from_string;

/** */
alias hb_variation_to_string = c_hb_variation_to_string;

// GlyphInfo

/** */
alias hb_gobject_glyph_info_get_type = c_hb_gobject_glyph_info_get_type;

// GlyphPosition

/** */
alias hb_gobject_glyph_position_get_type = c_hb_gobject_glyph_position_get_type;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.harfbuzz0", "HarfBuzz");

  // Blob
  gidLink(cast(void**)&hb_gobject_blob_get_type, "hb_gobject_blob_get_type", libs);

  // Buffer
  gidLink(cast(void**)&hb_gobject_buffer_get_type, "hb_gobject_buffer_get_type", libs);

  // ColorLine
  gidLink(cast(void**)&hb_gobject_color_line_get_type, "hb_gobject_color_line_get_type", libs);

  // ColorStop
  gidLink(cast(void**)&hb_gobject_color_stop_get_type, "hb_gobject_color_stop_get_type", libs);

  // DrawFuncs
  gidLink(cast(void**)&hb_gobject_draw_funcs_get_type, "hb_gobject_draw_funcs_get_type", libs);

  // Face
  gidLink(cast(void**)&hb_gobject_face_get_type, "hb_gobject_face_get_type", libs);

  // Feature
  gidLink(cast(void**)&hb_gobject_feature_get_type, "hb_gobject_feature_get_type", libs);

  // Font
  gidLink(cast(void**)&hb_gobject_font_get_type, "hb_gobject_font_get_type", libs);

  // FontFuncs
  gidLink(cast(void**)&hb_gobject_font_funcs_get_type, "hb_gobject_font_funcs_get_type", libs);

  // Map
  gidLink(cast(void**)&hb_gobject_map_get_type, "hb_gobject_map_get_type", libs);

  // OtMathGlyphPart
  gidLink(cast(void**)&hb_gobject_ot_math_glyph_part_get_type, "hb_gobject_ot_math_glyph_part_get_type", libs);

  // OtMathGlyphVariant
  gidLink(cast(void**)&hb_gobject_ot_math_glyph_variant_get_type, "hb_gobject_ot_math_glyph_variant_get_type", libs);

  // OtVarAxisInfo
  gidLink(cast(void**)&hb_gobject_ot_var_axis_info_get_type, "hb_gobject_ot_var_axis_info_get_type", libs);

  // PaintFuncs
  gidLink(cast(void**)&hb_gobject_paint_funcs_get_type, "hb_gobject_paint_funcs_get_type", libs);

  // SegmentProperties
  gidLink(cast(void**)&hb_gobject_segment_properties_get_type, "hb_gobject_segment_properties_get_type", libs);

  // Set
  gidLink(cast(void**)&hb_gobject_set_get_type, "hb_gobject_set_get_type", libs);

  // ShapePlan
  gidLink(cast(void**)&hb_gobject_shape_plan_get_type, "hb_gobject_shape_plan_get_type", libs);

  // UnicodeFuncs
  gidLink(cast(void**)&hb_gobject_unicode_funcs_get_type, "hb_gobject_unicode_funcs_get_type", libs);

  // UserDataKey
  gidLink(cast(void**)&hb_gobject_user_data_key_get_type, "hb_gobject_user_data_key_get_type", libs);

  // DrawState
  gidLink(cast(void**)&hb_gobject_draw_state_get_type, "hb_gobject_draw_state_get_type", libs);

  // global
  gidLink(cast(void**)&hb_aat_layout_feature_type_get_name_id, "hb_aat_layout_feature_type_get_name_id", libs);
  gidLink(cast(void**)&hb_aat_layout_feature_type_get_selector_infos, "hb_aat_layout_feature_type_get_selector_infos", libs);
  gidLink(cast(void**)&hb_aat_layout_get_feature_types, "hb_aat_layout_get_feature_types", libs);
  gidLink(cast(void**)&hb_aat_layout_has_positioning, "hb_aat_layout_has_positioning", libs);
  gidLink(cast(void**)&hb_aat_layout_has_substitution, "hb_aat_layout_has_substitution", libs);
  gidLink(cast(void**)&hb_aat_layout_has_tracking, "hb_aat_layout_has_tracking", libs);
  gidLink(cast(void**)&hb_blob_copy_writable_or_fail, "hb_blob_copy_writable_or_fail", libs);
  gidLink(cast(void**)&hb_blob_create, "hb_blob_create", libs);
  gidLink(cast(void**)&hb_blob_create_from_file, "hb_blob_create_from_file", libs);
  gidLink(cast(void**)&hb_blob_create_from_file_or_fail, "hb_blob_create_from_file_or_fail", libs);
  gidLink(cast(void**)&hb_blob_create_or_fail, "hb_blob_create_or_fail", libs);
  gidLink(cast(void**)&hb_blob_create_sub_blob, "hb_blob_create_sub_blob", libs);
  gidLink(cast(void**)&hb_blob_destroy, "hb_blob_destroy", libs);
  gidLink(cast(void**)&hb_blob_get_data, "hb_blob_get_data", libs);
  gidLink(cast(void**)&hb_blob_get_data_writable, "hb_blob_get_data_writable", libs);
  gidLink(cast(void**)&hb_blob_get_empty, "hb_blob_get_empty", libs);
  gidLink(cast(void**)&hb_blob_get_length, "hb_blob_get_length", libs);
  gidLink(cast(void**)&hb_blob_get_user_data, "hb_blob_get_user_data", libs);
  gidLink(cast(void**)&hb_blob_is_immutable, "hb_blob_is_immutable", libs);
  gidLink(cast(void**)&hb_blob_make_immutable, "hb_blob_make_immutable", libs);
  gidLink(cast(void**)&hb_blob_reference, "hb_blob_reference", libs);
  gidLink(cast(void**)&hb_blob_set_user_data, "hb_blob_set_user_data", libs);
  gidLink(cast(void**)&hb_buffer_add, "hb_buffer_add", libs);
  gidLink(cast(void**)&hb_buffer_add_codepoints, "hb_buffer_add_codepoints", libs);
  gidLink(cast(void**)&hb_buffer_add_latin1, "hb_buffer_add_latin1", libs);
  gidLink(cast(void**)&hb_buffer_add_utf16, "hb_buffer_add_utf16", libs);
  gidLink(cast(void**)&hb_buffer_add_utf32, "hb_buffer_add_utf32", libs);
  gidLink(cast(void**)&hb_buffer_add_utf8, "hb_buffer_add_utf8", libs);
  gidLink(cast(void**)&hb_buffer_allocation_successful, "hb_buffer_allocation_successful", libs);
  gidLink(cast(void**)&hb_buffer_append, "hb_buffer_append", libs);
  gidLink(cast(void**)&hb_buffer_clear_contents, "hb_buffer_clear_contents", libs);
  gidLink(cast(void**)&hb_buffer_create, "hb_buffer_create", libs);
  gidLink(cast(void**)&hb_buffer_create_similar, "hb_buffer_create_similar", libs);
  gidLink(cast(void**)&hb_buffer_deserialize_glyphs, "hb_buffer_deserialize_glyphs", libs);
  gidLink(cast(void**)&hb_buffer_deserialize_unicode, "hb_buffer_deserialize_unicode", libs);
  gidLink(cast(void**)&hb_buffer_destroy, "hb_buffer_destroy", libs);
  gidLink(cast(void**)&hb_buffer_diff, "hb_buffer_diff", libs);
  gidLink(cast(void**)&hb_buffer_get_cluster_level, "hb_buffer_get_cluster_level", libs);
  gidLink(cast(void**)&hb_buffer_get_content_type, "hb_buffer_get_content_type", libs);
  gidLink(cast(void**)&hb_buffer_get_direction, "hb_buffer_get_direction", libs);
  gidLink(cast(void**)&hb_buffer_get_empty, "hb_buffer_get_empty", libs);
  gidLink(cast(void**)&hb_buffer_get_flags, "hb_buffer_get_flags", libs);
  gidLink(cast(void**)&hb_buffer_get_glyph_infos, "hb_buffer_get_glyph_infos", libs);
  gidLink(cast(void**)&hb_buffer_get_glyph_positions, "hb_buffer_get_glyph_positions", libs);
  gidLink(cast(void**)&hb_buffer_get_invisible_glyph, "hb_buffer_get_invisible_glyph", libs);
  gidLink(cast(void**)&hb_buffer_get_language, "hb_buffer_get_language", libs);
  gidLink(cast(void**)&hb_buffer_get_length, "hb_buffer_get_length", libs);
  gidLink(cast(void**)&hb_buffer_get_not_found_glyph, "hb_buffer_get_not_found_glyph", libs);
  gidLink(cast(void**)&hb_buffer_get_not_found_variation_selector_glyph, "hb_buffer_get_not_found_variation_selector_glyph", libs);
  gidLink(cast(void**)&hb_buffer_get_random_state, "hb_buffer_get_random_state", libs);
  gidLink(cast(void**)&hb_buffer_get_replacement_codepoint, "hb_buffer_get_replacement_codepoint", libs);
  gidLink(cast(void**)&hb_buffer_get_script, "hb_buffer_get_script", libs);
  gidLink(cast(void**)&hb_buffer_get_segment_properties, "hb_buffer_get_segment_properties", libs);
  gidLink(cast(void**)&hb_buffer_get_unicode_funcs, "hb_buffer_get_unicode_funcs", libs);
  gidLink(cast(void**)&hb_buffer_get_user_data, "hb_buffer_get_user_data", libs);
  gidLink(cast(void**)&hb_buffer_guess_segment_properties, "hb_buffer_guess_segment_properties", libs);
  gidLink(cast(void**)&hb_buffer_has_positions, "hb_buffer_has_positions", libs);
  gidLink(cast(void**)&hb_buffer_normalize_glyphs, "hb_buffer_normalize_glyphs", libs);
  gidLink(cast(void**)&hb_buffer_pre_allocate, "hb_buffer_pre_allocate", libs);
  gidLink(cast(void**)&hb_buffer_reference, "hb_buffer_reference", libs);
  gidLink(cast(void**)&hb_buffer_reset, "hb_buffer_reset", libs);
  gidLink(cast(void**)&hb_buffer_reverse, "hb_buffer_reverse", libs);
  gidLink(cast(void**)&hb_buffer_reverse_clusters, "hb_buffer_reverse_clusters", libs);
  gidLink(cast(void**)&hb_buffer_reverse_range, "hb_buffer_reverse_range", libs);
  gidLink(cast(void**)&hb_buffer_serialize, "hb_buffer_serialize", libs);
  gidLink(cast(void**)&hb_buffer_serialize_format_from_string, "hb_buffer_serialize_format_from_string", libs);
  gidLink(cast(void**)&hb_buffer_serialize_format_to_string, "hb_buffer_serialize_format_to_string", libs);
  gidLink(cast(void**)&hb_buffer_serialize_glyphs, "hb_buffer_serialize_glyphs", libs);
  gidLink(cast(void**)&hb_buffer_serialize_list_formats, "hb_buffer_serialize_list_formats", libs);
  gidLink(cast(void**)&hb_buffer_serialize_unicode, "hb_buffer_serialize_unicode", libs);
  gidLink(cast(void**)&hb_buffer_set_cluster_level, "hb_buffer_set_cluster_level", libs);
  gidLink(cast(void**)&hb_buffer_set_content_type, "hb_buffer_set_content_type", libs);
  gidLink(cast(void**)&hb_buffer_set_direction, "hb_buffer_set_direction", libs);
  gidLink(cast(void**)&hb_buffer_set_flags, "hb_buffer_set_flags", libs);
  gidLink(cast(void**)&hb_buffer_set_invisible_glyph, "hb_buffer_set_invisible_glyph", libs);
  gidLink(cast(void**)&hb_buffer_set_language, "hb_buffer_set_language", libs);
  gidLink(cast(void**)&hb_buffer_set_length, "hb_buffer_set_length", libs);
  gidLink(cast(void**)&hb_buffer_set_message_func, "hb_buffer_set_message_func", libs);
  gidLink(cast(void**)&hb_buffer_set_not_found_glyph, "hb_buffer_set_not_found_glyph", libs);
  gidLink(cast(void**)&hb_buffer_set_not_found_variation_selector_glyph, "hb_buffer_set_not_found_variation_selector_glyph", libs);
  gidLink(cast(void**)&hb_buffer_set_random_state, "hb_buffer_set_random_state", libs);
  gidLink(cast(void**)&hb_buffer_set_replacement_codepoint, "hb_buffer_set_replacement_codepoint", libs);
  gidLink(cast(void**)&hb_buffer_set_script, "hb_buffer_set_script", libs);
  gidLink(cast(void**)&hb_buffer_set_segment_properties, "hb_buffer_set_segment_properties", libs);
  gidLink(cast(void**)&hb_buffer_set_unicode_funcs, "hb_buffer_set_unicode_funcs", libs);
  gidLink(cast(void**)&hb_buffer_set_user_data, "hb_buffer_set_user_data", libs);
  gidLink(cast(void**)&hb_calloc, "hb_calloc", libs);
  gidLink(cast(void**)&hb_color_get_alpha, "hb_color_get_alpha", libs);
  gidLink(cast(void**)&hb_color_get_blue, "hb_color_get_blue", libs);
  gidLink(cast(void**)&hb_color_get_green, "hb_color_get_green", libs);
  gidLink(cast(void**)&hb_color_get_red, "hb_color_get_red", libs);
  gidLink(cast(void**)&hb_color_line_get_color_stops, "hb_color_line_get_color_stops", libs);
  gidLink(cast(void**)&hb_color_line_get_extend, "hb_color_line_get_extend", libs);
  gidLink(cast(void**)&hb_direction_from_string, "hb_direction_from_string", libs);
  gidLink(cast(void**)&hb_direction_to_string, "hb_direction_to_string", libs);
  gidLink(cast(void**)&hb_draw_close_path, "hb_draw_close_path", libs);
  gidLink(cast(void**)&hb_draw_cubic_to, "hb_draw_cubic_to", libs);
  gidLink(cast(void**)&hb_draw_funcs_create, "hb_draw_funcs_create", libs);
  gidLink(cast(void**)&hb_draw_funcs_destroy, "hb_draw_funcs_destroy", libs);
  gidLink(cast(void**)&hb_draw_funcs_get_empty, "hb_draw_funcs_get_empty", libs);
  gidLink(cast(void**)&hb_draw_funcs_get_user_data, "hb_draw_funcs_get_user_data", libs);
  gidLink(cast(void**)&hb_draw_funcs_is_immutable, "hb_draw_funcs_is_immutable", libs);
  gidLink(cast(void**)&hb_draw_funcs_make_immutable, "hb_draw_funcs_make_immutable", libs);
  gidLink(cast(void**)&hb_draw_funcs_reference, "hb_draw_funcs_reference", libs);
  gidLink(cast(void**)&hb_draw_funcs_set_close_path_func, "hb_draw_funcs_set_close_path_func", libs);
  gidLink(cast(void**)&hb_draw_funcs_set_cubic_to_func, "hb_draw_funcs_set_cubic_to_func", libs);
  gidLink(cast(void**)&hb_draw_funcs_set_line_to_func, "hb_draw_funcs_set_line_to_func", libs);
  gidLink(cast(void**)&hb_draw_funcs_set_move_to_func, "hb_draw_funcs_set_move_to_func", libs);
  gidLink(cast(void**)&hb_draw_funcs_set_quadratic_to_func, "hb_draw_funcs_set_quadratic_to_func", libs);
  gidLink(cast(void**)&hb_draw_funcs_set_user_data, "hb_draw_funcs_set_user_data", libs);
  gidLink(cast(void**)&hb_draw_line_to, "hb_draw_line_to", libs);
  gidLink(cast(void**)&hb_draw_move_to, "hb_draw_move_to", libs);
  gidLink(cast(void**)&hb_draw_quadratic_to, "hb_draw_quadratic_to", libs);
  gidLink(cast(void**)&hb_face_builder_add_table, "hb_face_builder_add_table", libs);
  gidLink(cast(void**)&hb_face_builder_create, "hb_face_builder_create", libs);
  gidLink(cast(void**)&hb_face_builder_sort_tables, "hb_face_builder_sort_tables", libs);
  gidLink(cast(void**)&hb_face_collect_nominal_glyph_mapping, "hb_face_collect_nominal_glyph_mapping", libs);
  gidLink(cast(void**)&hb_face_collect_unicodes, "hb_face_collect_unicodes", libs);
  gidLink(cast(void**)&hb_face_collect_variation_selectors, "hb_face_collect_variation_selectors", libs);
  gidLink(cast(void**)&hb_face_collect_variation_unicodes, "hb_face_collect_variation_unicodes", libs);
  gidLink(cast(void**)&hb_face_count, "hb_face_count", libs);
  gidLink(cast(void**)&hb_face_create, "hb_face_create", libs);
  gidLink(cast(void**)&hb_face_create_for_tables, "hb_face_create_for_tables", libs);
  gidLink(cast(void**)&hb_face_create_from_file_or_fail, "hb_face_create_from_file_or_fail", libs);
  gidLink(cast(void**)&hb_face_create_from_file_or_fail_using, "hb_face_create_from_file_or_fail_using", libs);
  gidLink(cast(void**)&hb_face_create_or_fail, "hb_face_create_or_fail", libs);
  gidLink(cast(void**)&hb_face_create_or_fail_using, "hb_face_create_or_fail_using", libs);
  gidLink(cast(void**)&hb_face_destroy, "hb_face_destroy", libs);
  gidLink(cast(void**)&hb_face_get_empty, "hb_face_get_empty", libs);
  gidLink(cast(void**)&hb_face_get_glyph_count, "hb_face_get_glyph_count", libs);
  gidLink(cast(void**)&hb_face_get_index, "hb_face_get_index", libs);
  gidLink(cast(void**)&hb_face_get_table_tags, "hb_face_get_table_tags", libs);
  gidLink(cast(void**)&hb_face_get_upem, "hb_face_get_upem", libs);
  gidLink(cast(void**)&hb_face_get_user_data, "hb_face_get_user_data", libs);
  gidLink(cast(void**)&hb_face_is_immutable, "hb_face_is_immutable", libs);
  gidLink(cast(void**)&hb_face_list_loaders, "hb_face_list_loaders", libs);
  gidLink(cast(void**)&hb_face_make_immutable, "hb_face_make_immutable", libs);
  gidLink(cast(void**)&hb_face_reference, "hb_face_reference", libs);
  gidLink(cast(void**)&hb_face_reference_blob, "hb_face_reference_blob", libs);
  gidLink(cast(void**)&hb_face_reference_table, "hb_face_reference_table", libs);
  gidLink(cast(void**)&hb_face_set_get_table_tags_func, "hb_face_set_get_table_tags_func", libs);
  gidLink(cast(void**)&hb_face_set_glyph_count, "hb_face_set_glyph_count", libs);
  gidLink(cast(void**)&hb_face_set_index, "hb_face_set_index", libs);
  gidLink(cast(void**)&hb_face_set_upem, "hb_face_set_upem", libs);
  gidLink(cast(void**)&hb_face_set_user_data, "hb_face_set_user_data", libs);
  gidLink(cast(void**)&hb_feature_from_string, "hb_feature_from_string", libs);
  gidLink(cast(void**)&hb_feature_to_string, "hb_feature_to_string", libs);
  gidLink(cast(void**)&hb_font_add_glyph_origin_for_direction, "hb_font_add_glyph_origin_for_direction", libs);
  gidLink(cast(void**)&hb_font_changed, "hb_font_changed", libs);
  gidLink(cast(void**)&hb_font_create, "hb_font_create", libs);
  gidLink(cast(void**)&hb_font_create_sub_font, "hb_font_create_sub_font", libs);
  gidLink(cast(void**)&hb_font_destroy, "hb_font_destroy", libs);
  gidLink(cast(void**)&hb_font_draw_glyph, "hb_font_draw_glyph", libs);
  gidLink(cast(void**)&hb_font_draw_glyph_or_fail, "hb_font_draw_glyph_or_fail", libs);
  gidLink(cast(void**)&hb_font_funcs_create, "hb_font_funcs_create", libs);
  gidLink(cast(void**)&hb_font_funcs_destroy, "hb_font_funcs_destroy", libs);
  gidLink(cast(void**)&hb_font_funcs_get_empty, "hb_font_funcs_get_empty", libs);
  gidLink(cast(void**)&hb_font_funcs_get_user_data, "hb_font_funcs_get_user_data", libs);
  gidLink(cast(void**)&hb_font_funcs_is_immutable, "hb_font_funcs_is_immutable", libs);
  gidLink(cast(void**)&hb_font_funcs_make_immutable, "hb_font_funcs_make_immutable", libs);
  gidLink(cast(void**)&hb_font_funcs_reference, "hb_font_funcs_reference", libs);
  gidLink(cast(void**)&hb_font_funcs_set_draw_glyph_func, "hb_font_funcs_set_draw_glyph_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_draw_glyph_or_fail_func, "hb_font_funcs_set_draw_glyph_or_fail_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_font_h_extents_func, "hb_font_funcs_set_font_h_extents_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_font_v_extents_func, "hb_font_funcs_set_font_v_extents_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_contour_point_func, "hb_font_funcs_set_glyph_contour_point_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_extents_func, "hb_font_funcs_set_glyph_extents_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_from_name_func, "hb_font_funcs_set_glyph_from_name_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_func, "hb_font_funcs_set_glyph_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_h_advance_func, "hb_font_funcs_set_glyph_h_advance_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_h_advances_func, "hb_font_funcs_set_glyph_h_advances_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_h_kerning_func, "hb_font_funcs_set_glyph_h_kerning_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_h_origin_func, "hb_font_funcs_set_glyph_h_origin_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_h_origins_func, "hb_font_funcs_set_glyph_h_origins_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_name_func, "hb_font_funcs_set_glyph_name_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_shape_func, "hb_font_funcs_set_glyph_shape_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_v_advance_func, "hb_font_funcs_set_glyph_v_advance_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_v_advances_func, "hb_font_funcs_set_glyph_v_advances_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_v_kerning_func, "hb_font_funcs_set_glyph_v_kerning_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_v_origin_func, "hb_font_funcs_set_glyph_v_origin_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_v_origins_func, "hb_font_funcs_set_glyph_v_origins_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_nominal_glyph_func, "hb_font_funcs_set_nominal_glyph_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_nominal_glyphs_func, "hb_font_funcs_set_nominal_glyphs_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_paint_glyph_func, "hb_font_funcs_set_paint_glyph_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_paint_glyph_or_fail_func, "hb_font_funcs_set_paint_glyph_or_fail_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_user_data, "hb_font_funcs_set_user_data", libs);
  gidLink(cast(void**)&hb_font_funcs_set_variation_glyph_func, "hb_font_funcs_set_variation_glyph_func", libs);
  gidLink(cast(void**)&hb_font_get_empty, "hb_font_get_empty", libs);
  gidLink(cast(void**)&hb_font_get_extents_for_direction, "hb_font_get_extents_for_direction", libs);
  gidLink(cast(void**)&hb_font_get_face, "hb_font_get_face", libs);
  gidLink(cast(void**)&hb_font_get_glyph, "hb_font_get_glyph", libs);
  gidLink(cast(void**)&hb_font_get_glyph_advance_for_direction, "hb_font_get_glyph_advance_for_direction", libs);
  gidLink(cast(void**)&hb_font_get_glyph_advances_for_direction, "hb_font_get_glyph_advances_for_direction", libs);
  gidLink(cast(void**)&hb_font_get_glyph_contour_point, "hb_font_get_glyph_contour_point", libs);
  gidLink(cast(void**)&hb_font_get_glyph_contour_point_for_origin, "hb_font_get_glyph_contour_point_for_origin", libs);
  gidLink(cast(void**)&hb_font_get_glyph_extents, "hb_font_get_glyph_extents", libs);
  gidLink(cast(void**)&hb_font_get_glyph_extents_for_origin, "hb_font_get_glyph_extents_for_origin", libs);
  gidLink(cast(void**)&hb_font_get_glyph_from_name, "hb_font_get_glyph_from_name", libs);
  gidLink(cast(void**)&hb_font_get_glyph_h_advance, "hb_font_get_glyph_h_advance", libs);
  gidLink(cast(void**)&hb_font_get_glyph_h_advances, "hb_font_get_glyph_h_advances", libs);
  gidLink(cast(void**)&hb_font_get_glyph_h_kerning, "hb_font_get_glyph_h_kerning", libs);
  gidLink(cast(void**)&hb_font_get_glyph_h_origin, "hb_font_get_glyph_h_origin", libs);
  gidLink(cast(void**)&hb_font_get_glyph_h_origins, "hb_font_get_glyph_h_origins", libs);
  gidLink(cast(void**)&hb_font_get_glyph_kerning_for_direction, "hb_font_get_glyph_kerning_for_direction", libs);
  gidLink(cast(void**)&hb_font_get_glyph_name, "hb_font_get_glyph_name", libs);
  gidLink(cast(void**)&hb_font_get_glyph_origin_for_direction, "hb_font_get_glyph_origin_for_direction", libs);
  gidLink(cast(void**)&hb_font_get_glyph_shape, "hb_font_get_glyph_shape", libs);
  gidLink(cast(void**)&hb_font_get_glyph_v_advance, "hb_font_get_glyph_v_advance", libs);
  gidLink(cast(void**)&hb_font_get_glyph_v_advances, "hb_font_get_glyph_v_advances", libs);
  gidLink(cast(void**)&hb_font_get_glyph_v_kerning, "hb_font_get_glyph_v_kerning", libs);
  gidLink(cast(void**)&hb_font_get_glyph_v_origin, "hb_font_get_glyph_v_origin", libs);
  gidLink(cast(void**)&hb_font_get_glyph_v_origins, "hb_font_get_glyph_v_origins", libs);
  gidLink(cast(void**)&hb_font_get_h_extents, "hb_font_get_h_extents", libs);
  gidLink(cast(void**)&hb_font_get_nominal_glyph, "hb_font_get_nominal_glyph", libs);
  gidLink(cast(void**)&hb_font_get_nominal_glyphs, "hb_font_get_nominal_glyphs", libs);
  gidLink(cast(void**)&hb_font_get_parent, "hb_font_get_parent", libs);
  gidLink(cast(void**)&hb_font_get_ppem, "hb_font_get_ppem", libs);
  gidLink(cast(void**)&hb_font_get_ptem, "hb_font_get_ptem", libs);
  gidLink(cast(void**)&hb_font_get_scale, "hb_font_get_scale", libs);
  gidLink(cast(void**)&hb_font_get_serial, "hb_font_get_serial", libs);
  gidLink(cast(void**)&hb_font_get_synthetic_bold, "hb_font_get_synthetic_bold", libs);
  gidLink(cast(void**)&hb_font_get_synthetic_slant, "hb_font_get_synthetic_slant", libs);
  gidLink(cast(void**)&hb_font_get_user_data, "hb_font_get_user_data", libs);
  gidLink(cast(void**)&hb_font_get_v_extents, "hb_font_get_v_extents", libs);
  gidLink(cast(void**)&hb_font_get_var_coords_design, "hb_font_get_var_coords_design", libs);
  gidLink(cast(void**)&hb_font_get_var_coords_normalized, "hb_font_get_var_coords_normalized", libs);
  gidLink(cast(void**)&hb_font_get_var_named_instance, "hb_font_get_var_named_instance", libs);
  gidLink(cast(void**)&hb_font_get_variation_glyph, "hb_font_get_variation_glyph", libs);
  gidLink(cast(void**)&hb_font_glyph_from_string, "hb_font_glyph_from_string", libs);
  gidLink(cast(void**)&hb_font_glyph_to_string, "hb_font_glyph_to_string", libs);
  gidLink(cast(void**)&hb_font_is_immutable, "hb_font_is_immutable", libs);
  gidLink(cast(void**)&hb_font_is_synthetic, "hb_font_is_synthetic", libs);
  gidLink(cast(void**)&hb_font_list_funcs, "hb_font_list_funcs", libs);
  gidLink(cast(void**)&hb_font_make_immutable, "hb_font_make_immutable", libs);
  gidLink(cast(void**)&hb_font_paint_glyph, "hb_font_paint_glyph", libs);
  gidLink(cast(void**)&hb_font_paint_glyph_or_fail, "hb_font_paint_glyph_or_fail", libs);
  gidLink(cast(void**)&hb_font_reference, "hb_font_reference", libs);
  gidLink(cast(void**)&hb_font_set_face, "hb_font_set_face", libs);
  gidLink(cast(void**)&hb_font_set_funcs, "hb_font_set_funcs", libs);
  gidLink(cast(void**)&hb_font_set_funcs_data, "hb_font_set_funcs_data", libs);
  gidLink(cast(void**)&hb_font_set_funcs_using, "hb_font_set_funcs_using", libs);
  gidLink(cast(void**)&hb_font_set_parent, "hb_font_set_parent", libs);
  gidLink(cast(void**)&hb_font_set_ppem, "hb_font_set_ppem", libs);
  gidLink(cast(void**)&hb_font_set_ptem, "hb_font_set_ptem", libs);
  gidLink(cast(void**)&hb_font_set_scale, "hb_font_set_scale", libs);
  gidLink(cast(void**)&hb_font_set_synthetic_bold, "hb_font_set_synthetic_bold", libs);
  gidLink(cast(void**)&hb_font_set_synthetic_slant, "hb_font_set_synthetic_slant", libs);
  gidLink(cast(void**)&hb_font_set_user_data, "hb_font_set_user_data", libs);
  gidLink(cast(void**)&hb_font_set_var_coords_design, "hb_font_set_var_coords_design", libs);
  gidLink(cast(void**)&hb_font_set_var_coords_normalized, "hb_font_set_var_coords_normalized", libs);
  gidLink(cast(void**)&hb_font_set_var_named_instance, "hb_font_set_var_named_instance", libs);
  gidLink(cast(void**)&hb_font_set_variation, "hb_font_set_variation", libs);
  gidLink(cast(void**)&hb_font_set_variations, "hb_font_set_variations", libs);
  gidLink(cast(void**)&hb_font_subtract_glyph_origin_for_direction, "hb_font_subtract_glyph_origin_for_direction", libs);
  gidLink(cast(void**)&hb_free, "hb_free", libs);
  gidLink(cast(void**)&hb_ft_face_create, "hb_ft_face_create", libs);
  gidLink(cast(void**)&hb_ft_face_create_cached, "hb_ft_face_create_cached", libs);
  gidLink(cast(void**)&hb_ft_face_create_from_blob_or_fail, "hb_ft_face_create_from_blob_or_fail", libs);
  gidLink(cast(void**)&hb_ft_face_create_from_file_or_fail, "hb_ft_face_create_from_file_or_fail", libs);
  gidLink(cast(void**)&hb_ft_face_create_referenced, "hb_ft_face_create_referenced", libs);
  gidLink(cast(void**)&hb_ft_font_changed, "hb_ft_font_changed", libs);
  gidLink(cast(void**)&hb_ft_font_create, "hb_ft_font_create", libs);
  gidLink(cast(void**)&hb_ft_font_create_referenced, "hb_ft_font_create_referenced", libs);
  gidLink(cast(void**)&hb_ft_font_get_face, "hb_ft_font_get_face", libs);
  gidLink(cast(void**)&hb_ft_font_get_ft_face, "hb_ft_font_get_ft_face", libs);
  gidLink(cast(void**)&hb_ft_font_get_load_flags, "hb_ft_font_get_load_flags", libs);
  gidLink(cast(void**)&hb_ft_font_lock_face, "hb_ft_font_lock_face", libs);
  gidLink(cast(void**)&hb_ft_font_set_funcs, "hb_ft_font_set_funcs", libs);
  gidLink(cast(void**)&hb_ft_font_set_load_flags, "hb_ft_font_set_load_flags", libs);
  gidLink(cast(void**)&hb_ft_font_unlock_face, "hb_ft_font_unlock_face", libs);
  gidLink(cast(void**)&hb_ft_hb_font_changed, "hb_ft_hb_font_changed", libs);
  gidLink(cast(void**)&hb_glib_blob_create, "hb_glib_blob_create", libs);
  gidLink(cast(void**)&hb_glib_get_unicode_funcs, "hb_glib_get_unicode_funcs", libs);
  gidLink(cast(void**)&hb_glib_script_from_script, "hb_glib_script_from_script", libs);
  gidLink(cast(void**)&hb_glib_script_to_script, "hb_glib_script_to_script", libs);
  gidLink(cast(void**)&hb_glyph_info_get_glyph_flags, "hb_glyph_info_get_glyph_flags", libs);
  gidLink(cast(void**)&hb_language_from_string, "hb_language_from_string", libs);
  gidLink(cast(void**)&hb_language_get_default, "hb_language_get_default", libs);
  gidLink(cast(void**)&hb_language_matches, "hb_language_matches", libs);
  gidLink(cast(void**)&hb_language_to_string, "hb_language_to_string", libs);
  gidLink(cast(void**)&hb_malloc, "hb_malloc", libs);
  gidLink(cast(void**)&hb_map_allocation_successful, "hb_map_allocation_successful", libs);
  gidLink(cast(void**)&hb_map_clear, "hb_map_clear", libs);
  gidLink(cast(void**)&hb_map_copy, "hb_map_copy", libs);
  gidLink(cast(void**)&hb_map_create, "hb_map_create", libs);
  gidLink(cast(void**)&hb_map_del, "hb_map_del", libs);
  gidLink(cast(void**)&hb_map_destroy, "hb_map_destroy", libs);
  gidLink(cast(void**)&hb_map_get, "hb_map_get", libs);
  gidLink(cast(void**)&hb_map_get_empty, "hb_map_get_empty", libs);
  gidLink(cast(void**)&hb_map_get_population, "hb_map_get_population", libs);
  gidLink(cast(void**)&hb_map_get_user_data, "hb_map_get_user_data", libs);
  gidLink(cast(void**)&hb_map_has, "hb_map_has", libs);
  gidLink(cast(void**)&hb_map_hash, "hb_map_hash", libs);
  gidLink(cast(void**)&hb_map_is_empty, "hb_map_is_empty", libs);
  gidLink(cast(void**)&hb_map_is_equal, "hb_map_is_equal", libs);
  gidLink(cast(void**)&hb_map_keys, "hb_map_keys", libs);
  gidLink(cast(void**)&hb_map_next, "hb_map_next", libs);
  gidLink(cast(void**)&hb_map_reference, "hb_map_reference", libs);
  gidLink(cast(void**)&hb_map_set, "hb_map_set", libs);
  gidLink(cast(void**)&hb_map_set_user_data, "hb_map_set_user_data", libs);
  gidLink(cast(void**)&hb_map_update, "hb_map_update", libs);
  gidLink(cast(void**)&hb_map_values, "hb_map_values", libs);
  gidLink(cast(void**)&hb_ot_color_glyph_get_layers, "hb_ot_color_glyph_get_layers", libs);
  gidLink(cast(void**)&hb_ot_color_glyph_has_paint, "hb_ot_color_glyph_has_paint", libs);
  gidLink(cast(void**)&hb_ot_color_glyph_reference_png, "hb_ot_color_glyph_reference_png", libs);
  gidLink(cast(void**)&hb_ot_color_glyph_reference_svg, "hb_ot_color_glyph_reference_svg", libs);
  gidLink(cast(void**)&hb_ot_color_has_layers, "hb_ot_color_has_layers", libs);
  gidLink(cast(void**)&hb_ot_color_has_paint, "hb_ot_color_has_paint", libs);
  gidLink(cast(void**)&hb_ot_color_has_palettes, "hb_ot_color_has_palettes", libs);
  gidLink(cast(void**)&hb_ot_color_has_png, "hb_ot_color_has_png", libs);
  gidLink(cast(void**)&hb_ot_color_has_svg, "hb_ot_color_has_svg", libs);
  gidLink(cast(void**)&hb_ot_color_palette_color_get_name_id, "hb_ot_color_palette_color_get_name_id", libs);
  gidLink(cast(void**)&hb_ot_color_palette_get_colors, "hb_ot_color_palette_get_colors", libs);
  gidLink(cast(void**)&hb_ot_color_palette_get_count, "hb_ot_color_palette_get_count", libs);
  gidLink(cast(void**)&hb_ot_color_palette_get_flags, "hb_ot_color_palette_get_flags", libs);
  gidLink(cast(void**)&hb_ot_color_palette_get_name_id, "hb_ot_color_palette_get_name_id", libs);
  gidLink(cast(void**)&hb_ot_font_set_funcs, "hb_ot_font_set_funcs", libs);
  gidLink(cast(void**)&hb_ot_layout_collect_features, "hb_ot_layout_collect_features", libs);
  gidLink(cast(void**)&hb_ot_layout_collect_features_map, "hb_ot_layout_collect_features_map", libs);
  gidLink(cast(void**)&hb_ot_layout_collect_lookups, "hb_ot_layout_collect_lookups", libs);
  gidLink(cast(void**)&hb_ot_layout_feature_get_characters, "hb_ot_layout_feature_get_characters", libs);
  gidLink(cast(void**)&hb_ot_layout_feature_get_lookups, "hb_ot_layout_feature_get_lookups", libs);
  gidLink(cast(void**)&hb_ot_layout_feature_get_name_ids, "hb_ot_layout_feature_get_name_ids", libs);
  gidLink(cast(void**)&hb_ot_layout_feature_with_variations_get_lookups, "hb_ot_layout_feature_with_variations_get_lookups", libs);
  gidLink(cast(void**)&hb_ot_layout_get_attach_points, "hb_ot_layout_get_attach_points", libs);
  gidLink(cast(void**)&hb_ot_layout_get_baseline, "hb_ot_layout_get_baseline", libs);
  gidLink(cast(void**)&hb_ot_layout_get_baseline2, "hb_ot_layout_get_baseline2", libs);
  gidLink(cast(void**)&hb_ot_layout_get_baseline_with_fallback, "hb_ot_layout_get_baseline_with_fallback", libs);
  gidLink(cast(void**)&hb_ot_layout_get_baseline_with_fallback2, "hb_ot_layout_get_baseline_with_fallback2", libs);
  gidLink(cast(void**)&hb_ot_layout_get_font_extents, "hb_ot_layout_get_font_extents", libs);
  gidLink(cast(void**)&hb_ot_layout_get_font_extents2, "hb_ot_layout_get_font_extents2", libs);
  gidLink(cast(void**)&hb_ot_layout_get_glyph_class, "hb_ot_layout_get_glyph_class", libs);
  gidLink(cast(void**)&hb_ot_layout_get_glyphs_in_class, "hb_ot_layout_get_glyphs_in_class", libs);
  gidLink(cast(void**)&hb_ot_layout_get_horizontal_baseline_tag_for_script, "hb_ot_layout_get_horizontal_baseline_tag_for_script", libs);
  gidLink(cast(void**)&hb_ot_layout_get_ligature_carets, "hb_ot_layout_get_ligature_carets", libs);
  gidLink(cast(void**)&hb_ot_layout_get_size_params, "hb_ot_layout_get_size_params", libs);
  gidLink(cast(void**)&hb_ot_layout_has_glyph_classes, "hb_ot_layout_has_glyph_classes", libs);
  gidLink(cast(void**)&hb_ot_layout_has_positioning, "hb_ot_layout_has_positioning", libs);
  gidLink(cast(void**)&hb_ot_layout_has_substitution, "hb_ot_layout_has_substitution", libs);
  gidLink(cast(void**)&hb_ot_layout_language_find_feature, "hb_ot_layout_language_find_feature", libs);
  gidLink(cast(void**)&hb_ot_layout_language_get_feature_indexes, "hb_ot_layout_language_get_feature_indexes", libs);
  gidLink(cast(void**)&hb_ot_layout_language_get_feature_tags, "hb_ot_layout_language_get_feature_tags", libs);
  gidLink(cast(void**)&hb_ot_layout_language_get_required_feature, "hb_ot_layout_language_get_required_feature", libs);
  gidLink(cast(void**)&hb_ot_layout_language_get_required_feature_index, "hb_ot_layout_language_get_required_feature_index", libs);
  gidLink(cast(void**)&hb_ot_layout_lookup_collect_glyph_alternates, "hb_ot_layout_lookup_collect_glyph_alternates", libs);
  gidLink(cast(void**)&hb_ot_layout_lookup_collect_glyphs, "hb_ot_layout_lookup_collect_glyphs", libs);
  gidLink(cast(void**)&hb_ot_layout_lookup_get_glyph_alternates, "hb_ot_layout_lookup_get_glyph_alternates", libs);
  gidLink(cast(void**)&hb_ot_layout_lookup_get_optical_bound, "hb_ot_layout_lookup_get_optical_bound", libs);
  gidLink(cast(void**)&hb_ot_layout_lookup_substitute_closure, "hb_ot_layout_lookup_substitute_closure", libs);
  gidLink(cast(void**)&hb_ot_layout_lookup_would_substitute, "hb_ot_layout_lookup_would_substitute", libs);
  gidLink(cast(void**)&hb_ot_layout_lookups_substitute_closure, "hb_ot_layout_lookups_substitute_closure", libs);
  gidLink(cast(void**)&hb_ot_layout_script_find_language, "hb_ot_layout_script_find_language", libs);
  gidLink(cast(void**)&hb_ot_layout_script_get_language_tags, "hb_ot_layout_script_get_language_tags", libs);
  gidLink(cast(void**)&hb_ot_layout_script_select_language, "hb_ot_layout_script_select_language", libs);
  gidLink(cast(void**)&hb_ot_layout_script_select_language2, "hb_ot_layout_script_select_language2", libs);
  gidLink(cast(void**)&hb_ot_layout_table_choose_script, "hb_ot_layout_table_choose_script", libs);
  gidLink(cast(void**)&hb_ot_layout_table_find_feature_variations, "hb_ot_layout_table_find_feature_variations", libs);
  gidLink(cast(void**)&hb_ot_layout_table_find_script, "hb_ot_layout_table_find_script", libs);
  gidLink(cast(void**)&hb_ot_layout_table_get_feature_tags, "hb_ot_layout_table_get_feature_tags", libs);
  gidLink(cast(void**)&hb_ot_layout_table_get_lookup_count, "hb_ot_layout_table_get_lookup_count", libs);
  gidLink(cast(void**)&hb_ot_layout_table_get_script_tags, "hb_ot_layout_table_get_script_tags", libs);
  gidLink(cast(void**)&hb_ot_layout_table_select_script, "hb_ot_layout_table_select_script", libs);
  gidLink(cast(void**)&hb_ot_math_get_constant, "hb_ot_math_get_constant", libs);
  gidLink(cast(void**)&hb_ot_math_get_glyph_assembly, "hb_ot_math_get_glyph_assembly", libs);
  gidLink(cast(void**)&hb_ot_math_get_glyph_italics_correction, "hb_ot_math_get_glyph_italics_correction", libs);
  gidLink(cast(void**)&hb_ot_math_get_glyph_kerning, "hb_ot_math_get_glyph_kerning", libs);
  gidLink(cast(void**)&hb_ot_math_get_glyph_kernings, "hb_ot_math_get_glyph_kernings", libs);
  gidLink(cast(void**)&hb_ot_math_get_glyph_top_accent_attachment, "hb_ot_math_get_glyph_top_accent_attachment", libs);
  gidLink(cast(void**)&hb_ot_math_get_glyph_variants, "hb_ot_math_get_glyph_variants", libs);
  gidLink(cast(void**)&hb_ot_math_get_min_connector_overlap, "hb_ot_math_get_min_connector_overlap", libs);
  gidLink(cast(void**)&hb_ot_math_has_data, "hb_ot_math_has_data", libs);
  gidLink(cast(void**)&hb_ot_math_is_glyph_extended_shape, "hb_ot_math_is_glyph_extended_shape", libs);
  gidLink(cast(void**)&hb_ot_meta_get_entry_tags, "hb_ot_meta_get_entry_tags", libs);
  gidLink(cast(void**)&hb_ot_meta_reference_entry, "hb_ot_meta_reference_entry", libs);
  gidLink(cast(void**)&hb_ot_metrics_get_position, "hb_ot_metrics_get_position", libs);
  gidLink(cast(void**)&hb_ot_metrics_get_position_with_fallback, "hb_ot_metrics_get_position_with_fallback", libs);
  gidLink(cast(void**)&hb_ot_metrics_get_variation, "hb_ot_metrics_get_variation", libs);
  gidLink(cast(void**)&hb_ot_metrics_get_x_variation, "hb_ot_metrics_get_x_variation", libs);
  gidLink(cast(void**)&hb_ot_metrics_get_y_variation, "hb_ot_metrics_get_y_variation", libs);
  gidLink(cast(void**)&hb_ot_name_get_utf16, "hb_ot_name_get_utf16", libs);
  gidLink(cast(void**)&hb_ot_name_get_utf32, "hb_ot_name_get_utf32", libs);
  gidLink(cast(void**)&hb_ot_name_get_utf8, "hb_ot_name_get_utf8", libs);
  gidLink(cast(void**)&hb_ot_name_list_names, "hb_ot_name_list_names", libs);
  gidLink(cast(void**)&hb_ot_shape_glyphs_closure, "hb_ot_shape_glyphs_closure", libs);
  gidLink(cast(void**)&hb_ot_shape_plan_collect_lookups, "hb_ot_shape_plan_collect_lookups", libs);
  gidLink(cast(void**)&hb_ot_shape_plan_get_feature_tags, "hb_ot_shape_plan_get_feature_tags", libs);
  gidLink(cast(void**)&hb_ot_tag_from_language, "hb_ot_tag_from_language", libs);
  gidLink(cast(void**)&hb_ot_tag_to_language, "hb_ot_tag_to_language", libs);
  gidLink(cast(void**)&hb_ot_tag_to_script, "hb_ot_tag_to_script", libs);
  gidLink(cast(void**)&hb_ot_tags_from_script, "hb_ot_tags_from_script", libs);
  gidLink(cast(void**)&hb_ot_tags_from_script_and_language, "hb_ot_tags_from_script_and_language", libs);
  gidLink(cast(void**)&hb_ot_tags_to_script_and_language, "hb_ot_tags_to_script_and_language", libs);
  gidLink(cast(void**)&hb_ot_var_find_axis, "hb_ot_var_find_axis", libs);
  gidLink(cast(void**)&hb_ot_var_find_axis_info, "hb_ot_var_find_axis_info", libs);
  gidLink(cast(void**)&hb_ot_var_get_axes, "hb_ot_var_get_axes", libs);
  gidLink(cast(void**)&hb_ot_var_get_axis_count, "hb_ot_var_get_axis_count", libs);
  gidLink(cast(void**)&hb_ot_var_get_axis_infos, "hb_ot_var_get_axis_infos", libs);
  gidLink(cast(void**)&hb_ot_var_get_named_instance_count, "hb_ot_var_get_named_instance_count", libs);
  gidLink(cast(void**)&hb_ot_var_has_data, "hb_ot_var_has_data", libs);
  gidLink(cast(void**)&hb_ot_var_named_instance_get_design_coords, "hb_ot_var_named_instance_get_design_coords", libs);
  gidLink(cast(void**)&hb_ot_var_named_instance_get_postscript_name_id, "hb_ot_var_named_instance_get_postscript_name_id", libs);
  gidLink(cast(void**)&hb_ot_var_named_instance_get_subfamily_name_id, "hb_ot_var_named_instance_get_subfamily_name_id", libs);
  gidLink(cast(void**)&hb_ot_var_normalize_coords, "hb_ot_var_normalize_coords", libs);
  gidLink(cast(void**)&hb_ot_var_normalize_variations, "hb_ot_var_normalize_variations", libs);
  gidLink(cast(void**)&hb_paint_color, "hb_paint_color", libs);
  gidLink(cast(void**)&hb_paint_color_glyph, "hb_paint_color_glyph", libs);
  gidLink(cast(void**)&hb_paint_custom_palette_color, "hb_paint_custom_palette_color", libs);
  gidLink(cast(void**)&hb_paint_funcs_create, "hb_paint_funcs_create", libs);
  gidLink(cast(void**)&hb_paint_funcs_destroy, "hb_paint_funcs_destroy", libs);
  gidLink(cast(void**)&hb_paint_funcs_get_empty, "hb_paint_funcs_get_empty", libs);
  gidLink(cast(void**)&hb_paint_funcs_get_user_data, "hb_paint_funcs_get_user_data", libs);
  gidLink(cast(void**)&hb_paint_funcs_is_immutable, "hb_paint_funcs_is_immutable", libs);
  gidLink(cast(void**)&hb_paint_funcs_make_immutable, "hb_paint_funcs_make_immutable", libs);
  gidLink(cast(void**)&hb_paint_funcs_reference, "hb_paint_funcs_reference", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_color_func, "hb_paint_funcs_set_color_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_color_glyph_func, "hb_paint_funcs_set_color_glyph_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_custom_palette_color_func, "hb_paint_funcs_set_custom_palette_color_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_image_func, "hb_paint_funcs_set_image_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_linear_gradient_func, "hb_paint_funcs_set_linear_gradient_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_pop_clip_func, "hb_paint_funcs_set_pop_clip_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_pop_group_func, "hb_paint_funcs_set_pop_group_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_pop_transform_func, "hb_paint_funcs_set_pop_transform_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_push_clip_glyph_func, "hb_paint_funcs_set_push_clip_glyph_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_push_clip_rectangle_func, "hb_paint_funcs_set_push_clip_rectangle_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_push_group_func, "hb_paint_funcs_set_push_group_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_push_transform_func, "hb_paint_funcs_set_push_transform_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_radial_gradient_func, "hb_paint_funcs_set_radial_gradient_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_sweep_gradient_func, "hb_paint_funcs_set_sweep_gradient_func", libs);
  gidLink(cast(void**)&hb_paint_funcs_set_user_data, "hb_paint_funcs_set_user_data", libs);
  gidLink(cast(void**)&hb_paint_image, "hb_paint_image", libs);
  gidLink(cast(void**)&hb_paint_linear_gradient, "hb_paint_linear_gradient", libs);
  gidLink(cast(void**)&hb_paint_pop_clip, "hb_paint_pop_clip", libs);
  gidLink(cast(void**)&hb_paint_pop_group, "hb_paint_pop_group", libs);
  gidLink(cast(void**)&hb_paint_pop_transform, "hb_paint_pop_transform", libs);
  gidLink(cast(void**)&hb_paint_push_clip_glyph, "hb_paint_push_clip_glyph", libs);
  gidLink(cast(void**)&hb_paint_push_clip_rectangle, "hb_paint_push_clip_rectangle", libs);
  gidLink(cast(void**)&hb_paint_push_font_transform, "hb_paint_push_font_transform", libs);
  gidLink(cast(void**)&hb_paint_push_group, "hb_paint_push_group", libs);
  gidLink(cast(void**)&hb_paint_push_inverse_font_transform, "hb_paint_push_inverse_font_transform", libs);
  gidLink(cast(void**)&hb_paint_push_transform, "hb_paint_push_transform", libs);
  gidLink(cast(void**)&hb_paint_radial_gradient, "hb_paint_radial_gradient", libs);
  gidLink(cast(void**)&hb_paint_sweep_gradient, "hb_paint_sweep_gradient", libs);
  gidLink(cast(void**)&hb_realloc, "hb_realloc", libs);
  gidLink(cast(void**)&hb_script_from_iso15924_tag, "hb_script_from_iso15924_tag", libs);
  gidLink(cast(void**)&hb_script_from_string, "hb_script_from_string", libs);
  gidLink(cast(void**)&hb_script_get_horizontal_direction, "hb_script_get_horizontal_direction", libs);
  gidLink(cast(void**)&hb_script_to_iso15924_tag, "hb_script_to_iso15924_tag", libs);
  gidLink(cast(void**)&hb_segment_properties_equal, "hb_segment_properties_equal", libs);
  gidLink(cast(void**)&hb_segment_properties_hash, "hb_segment_properties_hash", libs);
  gidLink(cast(void**)&hb_segment_properties_overlay, "hb_segment_properties_overlay", libs);
  gidLink(cast(void**)&hb_set_add, "hb_set_add", libs);
  gidLink(cast(void**)&hb_set_add_range, "hb_set_add_range", libs);
  gidLink(cast(void**)&hb_set_add_sorted_array, "hb_set_add_sorted_array", libs);
  gidLink(cast(void**)&hb_set_allocation_successful, "hb_set_allocation_successful", libs);
  gidLink(cast(void**)&hb_set_clear, "hb_set_clear", libs);
  gidLink(cast(void**)&hb_set_copy, "hb_set_copy", libs);
  gidLink(cast(void**)&hb_set_create, "hb_set_create", libs);
  gidLink(cast(void**)&hb_set_del, "hb_set_del", libs);
  gidLink(cast(void**)&hb_set_del_range, "hb_set_del_range", libs);
  gidLink(cast(void**)&hb_set_destroy, "hb_set_destroy", libs);
  gidLink(cast(void**)&hb_set_get_empty, "hb_set_get_empty", libs);
  gidLink(cast(void**)&hb_set_get_max, "hb_set_get_max", libs);
  gidLink(cast(void**)&hb_set_get_min, "hb_set_get_min", libs);
  gidLink(cast(void**)&hb_set_get_population, "hb_set_get_population", libs);
  gidLink(cast(void**)&hb_set_get_user_data, "hb_set_get_user_data", libs);
  gidLink(cast(void**)&hb_set_has, "hb_set_has", libs);
  gidLink(cast(void**)&hb_set_hash, "hb_set_hash", libs);
  gidLink(cast(void**)&hb_set_intersect, "hb_set_intersect", libs);
  gidLink(cast(void**)&hb_set_invert, "hb_set_invert", libs);
  gidLink(cast(void**)&hb_set_is_empty, "hb_set_is_empty", libs);
  gidLink(cast(void**)&hb_set_is_equal, "hb_set_is_equal", libs);
  gidLink(cast(void**)&hb_set_is_inverted, "hb_set_is_inverted", libs);
  gidLink(cast(void**)&hb_set_is_subset, "hb_set_is_subset", libs);
  gidLink(cast(void**)&hb_set_next, "hb_set_next", libs);
  gidLink(cast(void**)&hb_set_next_many, "hb_set_next_many", libs);
  gidLink(cast(void**)&hb_set_next_range, "hb_set_next_range", libs);
  gidLink(cast(void**)&hb_set_previous, "hb_set_previous", libs);
  gidLink(cast(void**)&hb_set_previous_range, "hb_set_previous_range", libs);
  gidLink(cast(void**)&hb_set_reference, "hb_set_reference", libs);
  gidLink(cast(void**)&hb_set_set, "hb_set_set", libs);
  gidLink(cast(void**)&hb_set_set_user_data, "hb_set_set_user_data", libs);
  gidLink(cast(void**)&hb_set_subtract, "hb_set_subtract", libs);
  gidLink(cast(void**)&hb_set_symmetric_difference, "hb_set_symmetric_difference", libs);
  gidLink(cast(void**)&hb_set_union, "hb_set_union", libs);
  gidLink(cast(void**)&hb_shape, "hb_shape", libs);
  gidLink(cast(void**)&hb_shape_full, "hb_shape_full", libs);
  gidLink(cast(void**)&hb_shape_list_shapers, "hb_shape_list_shapers", libs);
  gidLink(cast(void**)&hb_shape_plan_create, "hb_shape_plan_create", libs);
  gidLink(cast(void**)&hb_shape_plan_create2, "hb_shape_plan_create2", libs);
  gidLink(cast(void**)&hb_shape_plan_create_cached, "hb_shape_plan_create_cached", libs);
  gidLink(cast(void**)&hb_shape_plan_create_cached2, "hb_shape_plan_create_cached2", libs);
  gidLink(cast(void**)&hb_shape_plan_destroy, "hb_shape_plan_destroy", libs);
  gidLink(cast(void**)&hb_shape_plan_execute, "hb_shape_plan_execute", libs);
  gidLink(cast(void**)&hb_shape_plan_get_empty, "hb_shape_plan_get_empty", libs);
  gidLink(cast(void**)&hb_shape_plan_get_shaper, "hb_shape_plan_get_shaper", libs);
  gidLink(cast(void**)&hb_shape_plan_get_user_data, "hb_shape_plan_get_user_data", libs);
  gidLink(cast(void**)&hb_shape_plan_reference, "hb_shape_plan_reference", libs);
  gidLink(cast(void**)&hb_shape_plan_set_user_data, "hb_shape_plan_set_user_data", libs);
  gidLink(cast(void**)&hb_style_get_value, "hb_style_get_value", libs);
  gidLink(cast(void**)&hb_tag_from_string, "hb_tag_from_string", libs);
  gidLink(cast(void**)&hb_tag_to_string, "hb_tag_to_string", libs);
  gidLink(cast(void**)&hb_unicode_combining_class, "hb_unicode_combining_class", libs);
  gidLink(cast(void**)&hb_unicode_compose, "hb_unicode_compose", libs);
  gidLink(cast(void**)&hb_unicode_decompose, "hb_unicode_decompose", libs);
  gidLink(cast(void**)&hb_unicode_decompose_compatibility, "hb_unicode_decompose_compatibility", libs);
  gidLink(cast(void**)&hb_unicode_eastasian_width, "hb_unicode_eastasian_width", libs);
  gidLink(cast(void**)&hb_unicode_funcs_create, "hb_unicode_funcs_create", libs);
  gidLink(cast(void**)&hb_unicode_funcs_destroy, "hb_unicode_funcs_destroy", libs);
  gidLink(cast(void**)&hb_unicode_funcs_get_default, "hb_unicode_funcs_get_default", libs);
  gidLink(cast(void**)&hb_unicode_funcs_get_empty, "hb_unicode_funcs_get_empty", libs);
  gidLink(cast(void**)&hb_unicode_funcs_get_parent, "hb_unicode_funcs_get_parent", libs);
  gidLink(cast(void**)&hb_unicode_funcs_get_user_data, "hb_unicode_funcs_get_user_data", libs);
  gidLink(cast(void**)&hb_unicode_funcs_is_immutable, "hb_unicode_funcs_is_immutable", libs);
  gidLink(cast(void**)&hb_unicode_funcs_make_immutable, "hb_unicode_funcs_make_immutable", libs);
  gidLink(cast(void**)&hb_unicode_funcs_reference, "hb_unicode_funcs_reference", libs);
  gidLink(cast(void**)&hb_unicode_funcs_set_combining_class_func, "hb_unicode_funcs_set_combining_class_func", libs);
  gidLink(cast(void**)&hb_unicode_funcs_set_compose_func, "hb_unicode_funcs_set_compose_func", libs);
  gidLink(cast(void**)&hb_unicode_funcs_set_decompose_compatibility_func, "hb_unicode_funcs_set_decompose_compatibility_func", libs);
  gidLink(cast(void**)&hb_unicode_funcs_set_decompose_func, "hb_unicode_funcs_set_decompose_func", libs);
  gidLink(cast(void**)&hb_unicode_funcs_set_eastasian_width_func, "hb_unicode_funcs_set_eastasian_width_func", libs);
  gidLink(cast(void**)&hb_unicode_funcs_set_general_category_func, "hb_unicode_funcs_set_general_category_func", libs);
  gidLink(cast(void**)&hb_unicode_funcs_set_mirroring_func, "hb_unicode_funcs_set_mirroring_func", libs);
  gidLink(cast(void**)&hb_unicode_funcs_set_script_func, "hb_unicode_funcs_set_script_func", libs);
  gidLink(cast(void**)&hb_unicode_funcs_set_user_data, "hb_unicode_funcs_set_user_data", libs);
  gidLink(cast(void**)&hb_unicode_general_category, "hb_unicode_general_category", libs);
  gidLink(cast(void**)&hb_unicode_mirroring, "hb_unicode_mirroring", libs);
  gidLink(cast(void**)&hb_unicode_script, "hb_unicode_script", libs);
  gidLink(cast(void**)&hb_variation_from_string, "hb_variation_from_string", libs);
  gidLink(cast(void**)&hb_variation_to_string, "hb_variation_to_string", libs);

  // GlyphInfo
  gidLink(cast(void**)&hb_gobject_glyph_info_get_type, "hb_gobject_glyph_info_get_type", libs);

  // GlyphPosition
  gidLink(cast(void**)&hb_gobject_glyph_position_get_type, "hb_gobject_glyph_position_get_type", libs);
}
