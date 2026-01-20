/// C functions for harfbuzz0 library
module harfbuzz.c.functions;

public import gid.basictypes;
import gid.loader;
import harfbuzz.c.types;
public import gobject.c.types;
public import freetype2.c.types;

version(Windows)
  private immutable LIBS = ["libharfbuzz-gobject-0.dll;harfbuzz-gobject-0.dll;harfbuzz-gobject.dll", "libharfbuzz-0.dll;harfbuzz-0.dll;harfbuzz.dll"];
else version(OSX)
  private immutable LIBS = ["libharfbuzz-gobject.0.dylib", "libharfbuzz.0.dylib"];
else
  private immutable LIBS = ["libharfbuzz-gobject.so.0", "libharfbuzz.so.0"];

__gshared extern(C)
{
  // Blob
  GType function() c_hb_gobject_blob_get_type; ///

  // Buffer
  GType function() c_hb_gobject_buffer_get_type; ///

  // ColorLine
  GType function() c_hb_gobject_color_line_get_type; ///

  // ColorStop
  GType function() c_hb_gobject_color_stop_get_type; ///

  // DrawFuncs
  GType function() c_hb_gobject_draw_funcs_get_type; ///

  // Face
  GType function() c_hb_gobject_face_get_type; ///

  // Feature
  GType function() c_hb_gobject_feature_get_type; ///

  // Font
  GType function() c_hb_gobject_font_get_type; ///

  // FontFuncs
  GType function() c_hb_gobject_font_funcs_get_type; ///

  // Map
  GType function() c_hb_gobject_map_get_type; ///

  // OtMathGlyphPart
  GType function() c_hb_gobject_ot_math_glyph_part_get_type; ///

  // OtMathGlyphVariant
  GType function() c_hb_gobject_ot_math_glyph_variant_get_type; ///

  // OtVarAxisInfo
  GType function() c_hb_gobject_ot_var_axis_info_get_type; ///

  // PaintFuncs
  GType function() c_hb_gobject_paint_funcs_get_type; ///

  // SegmentProperties
  GType function() c_hb_gobject_segment_properties_get_type; ///

  // Set
  GType function() c_hb_gobject_set_get_type; ///

  // ShapePlan
  GType function() c_hb_gobject_shape_plan_get_type; ///

  // UnicodeFuncs
  GType function() c_hb_gobject_unicode_funcs_get_type; ///

  // UserDataKey
  GType function() c_hb_gobject_user_data_key_get_type; ///

  // DrawState
  GType function() c_hb_gobject_draw_state_get_type; ///

  // global
  hb_ot_name_id_t function(hb_face_t* face, hb_aat_layout_feature_type_t featureType) c_hb_aat_layout_feature_type_get_name_id; ///
  uint function(hb_face_t* face, hb_aat_layout_feature_type_t featureType, uint startOffset, uint* selectorCount, hb_aat_layout_feature_selector_info_t* selectors, uint* defaultIndex) c_hb_aat_layout_feature_type_get_selector_infos; ///
  uint function(hb_face_t* face, uint startOffset, uint* featureCount, hb_aat_layout_feature_type_t* features) c_hb_aat_layout_get_feature_types; ///
  hb_bool_t function(hb_face_t* face) c_hb_aat_layout_has_positioning; ///
  hb_bool_t function(hb_face_t* face) c_hb_aat_layout_has_substitution; ///
  hb_bool_t function(hb_face_t* face) c_hb_aat_layout_has_tracking; ///
  hb_blob_t* function(hb_blob_t* blob) c_hb_blob_copy_writable_or_fail; ///
  hb_blob_t* function(const(char)* data, uint length, hb_memory_mode_t mode, void* userData, hb_destroy_func_t destroy) c_hb_blob_create; ///
  hb_blob_t* function(const(char)* fileName) c_hb_blob_create_from_file; ///
  hb_blob_t* function(const(char)* fileName) c_hb_blob_create_from_file_or_fail; ///
  hb_blob_t* function(const(char)* data, uint length, hb_memory_mode_t mode, void* userData, hb_destroy_func_t destroy) c_hb_blob_create_or_fail; ///
  hb_blob_t* function(hb_blob_t* parent, uint offset, uint length) c_hb_blob_create_sub_blob; ///
  void function(hb_blob_t* blob) c_hb_blob_destroy; ///
  const(char)* function(hb_blob_t* blob, uint* length) c_hb_blob_get_data; ///
  char* function(hb_blob_t* blob, uint* length) c_hb_blob_get_data_writable; ///
  hb_blob_t* function() c_hb_blob_get_empty; ///
  uint function(hb_blob_t* blob) c_hb_blob_get_length; ///
  void* function(const(hb_blob_t)* blob, hb_user_data_key_t* key) c_hb_blob_get_user_data; ///
  hb_bool_t function(hb_blob_t* blob) c_hb_blob_is_immutable; ///
  void function(hb_blob_t* blob) c_hb_blob_make_immutable; ///
  hb_blob_t* function(hb_blob_t* blob) c_hb_blob_reference; ///
  hb_bool_t function(hb_blob_t* blob, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_blob_set_user_data; ///
  void function(hb_buffer_t* buffer, hb_codepoint_t codepoint, uint cluster) c_hb_buffer_add; ///
  void function(hb_buffer_t* buffer, const(hb_codepoint_t)* text, int textLength, uint itemOffset, int itemLength) c_hb_buffer_add_codepoints; ///
  void function(hb_buffer_t* buffer, const(ubyte)* text, int textLength, uint itemOffset, int itemLength) c_hb_buffer_add_latin1; ///
  void function(hb_buffer_t* buffer, const(ushort)* text, int textLength, uint itemOffset, int itemLength) c_hb_buffer_add_utf16; ///
  void function(hb_buffer_t* buffer, const(uint)* text, int textLength, uint itemOffset, int itemLength) c_hb_buffer_add_utf32; ///
  void function(hb_buffer_t* buffer, const(ubyte)* text, int textLength, uint itemOffset, int itemLength) c_hb_buffer_add_utf8; ///
  hb_bool_t function(hb_buffer_t* buffer) c_hb_buffer_allocation_successful; ///
  void function(hb_buffer_t* buffer, const(hb_buffer_t)* source, uint start, uint end) c_hb_buffer_append; ///
  void function(hb_buffer_t* buffer) c_hb_buffer_clear_contents; ///
  hb_buffer_t* function() c_hb_buffer_create; ///
  hb_buffer_t* function(const(hb_buffer_t)* src) c_hb_buffer_create_similar; ///
  hb_bool_t function(hb_buffer_t* buffer, const(char)* buf, int bufLen, const(char*)* endPtr, hb_font_t* font, hb_buffer_serialize_format_t format) c_hb_buffer_deserialize_glyphs; ///
  hb_bool_t function(hb_buffer_t* buffer, const(char)* buf, int bufLen, const(char*)* endPtr, hb_buffer_serialize_format_t format) c_hb_buffer_deserialize_unicode; ///
  void function(hb_buffer_t* buffer) c_hb_buffer_destroy; ///
  hb_buffer_diff_flags_t function(hb_buffer_t* buffer, hb_buffer_t* reference, hb_codepoint_t dottedcircleGlyph, uint positionFuzz) c_hb_buffer_diff; ///
  hb_buffer_cluster_level_t function(const(hb_buffer_t)* buffer) c_hb_buffer_get_cluster_level; ///
  hb_buffer_content_type_t function(const(hb_buffer_t)* buffer) c_hb_buffer_get_content_type; ///
  hb_direction_t function(const(hb_buffer_t)* buffer) c_hb_buffer_get_direction; ///
  hb_buffer_t* function() c_hb_buffer_get_empty; ///
  hb_buffer_flags_t function(const(hb_buffer_t)* buffer) c_hb_buffer_get_flags; ///
  hb_glyph_info_t* function(hb_buffer_t* buffer, uint* length) c_hb_buffer_get_glyph_infos; ///
  hb_glyph_position_t* function(hb_buffer_t* buffer, uint* length) c_hb_buffer_get_glyph_positions; ///
  hb_codepoint_t function(const(hb_buffer_t)* buffer) c_hb_buffer_get_invisible_glyph; ///
  hb_language_t function(const(hb_buffer_t)* buffer) c_hb_buffer_get_language; ///
  uint function(const(hb_buffer_t)* buffer) c_hb_buffer_get_length; ///
  hb_codepoint_t function(const(hb_buffer_t)* buffer) c_hb_buffer_get_not_found_glyph; ///
  hb_codepoint_t function(const(hb_buffer_t)* buffer) c_hb_buffer_get_replacement_codepoint; ///
  hb_script_t function(const(hb_buffer_t)* buffer) c_hb_buffer_get_script; ///
  void function(const(hb_buffer_t)* buffer, hb_segment_properties_t* props) c_hb_buffer_get_segment_properties; ///
  hb_unicode_funcs_t* function(const(hb_buffer_t)* buffer) c_hb_buffer_get_unicode_funcs; ///
  void* function(const(hb_buffer_t)* buffer, hb_user_data_key_t* key) c_hb_buffer_get_user_data; ///
  void function(hb_buffer_t* buffer) c_hb_buffer_guess_segment_properties; ///
  hb_bool_t function(hb_buffer_t* buffer) c_hb_buffer_has_positions; ///
  void function(hb_buffer_t* buffer) c_hb_buffer_normalize_glyphs; ///
  hb_bool_t function(hb_buffer_t* buffer, uint size) c_hb_buffer_pre_allocate; ///
  hb_buffer_t* function(hb_buffer_t* buffer) c_hb_buffer_reference; ///
  void function(hb_buffer_t* buffer) c_hb_buffer_reset; ///
  void function(hb_buffer_t* buffer) c_hb_buffer_reverse; ///
  void function(hb_buffer_t* buffer) c_hb_buffer_reverse_clusters; ///
  void function(hb_buffer_t* buffer, uint start, uint end) c_hb_buffer_reverse_range; ///
  uint function(hb_buffer_t* buffer, uint start, uint end, ubyte* buf, uint bufSize, uint* bufConsumed, hb_font_t* font, hb_buffer_serialize_format_t format, hb_buffer_serialize_flags_t flags) c_hb_buffer_serialize; ///
  hb_buffer_serialize_format_t function(const(ubyte)* str, int len) c_hb_buffer_serialize_format_from_string; ///
  const(char)* function(hb_buffer_serialize_format_t format) c_hb_buffer_serialize_format_to_string; ///
  uint function(hb_buffer_t* buffer, uint start, uint end, ubyte* buf, uint bufSize, uint* bufConsumed, hb_font_t* font, hb_buffer_serialize_format_t format, hb_buffer_serialize_flags_t flags) c_hb_buffer_serialize_glyphs; ///
  const(char*)* function() c_hb_buffer_serialize_list_formats; ///
  uint function(hb_buffer_t* buffer, uint start, uint end, ubyte* buf, uint bufSize, uint* bufConsumed, hb_buffer_serialize_format_t format, hb_buffer_serialize_flags_t flags) c_hb_buffer_serialize_unicode; ///
  void function(hb_buffer_t* buffer, hb_buffer_cluster_level_t clusterLevel) c_hb_buffer_set_cluster_level; ///
  void function(hb_buffer_t* buffer, hb_buffer_content_type_t contentType) c_hb_buffer_set_content_type; ///
  void function(hb_buffer_t* buffer, hb_direction_t direction) c_hb_buffer_set_direction; ///
  void function(hb_buffer_t* buffer, hb_buffer_flags_t flags) c_hb_buffer_set_flags; ///
  void function(hb_buffer_t* buffer, hb_codepoint_t invisible) c_hb_buffer_set_invisible_glyph; ///
  void function(hb_buffer_t* buffer, hb_language_t language) c_hb_buffer_set_language; ///
  hb_bool_t function(hb_buffer_t* buffer, uint length) c_hb_buffer_set_length; ///
  void function(hb_buffer_t* buffer, hb_buffer_message_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_buffer_set_message_func; ///
  void function(hb_buffer_t* buffer, hb_codepoint_t notFound) c_hb_buffer_set_not_found_glyph; ///
  void function(hb_buffer_t* buffer, hb_codepoint_t replacement) c_hb_buffer_set_replacement_codepoint; ///
  void function(hb_buffer_t* buffer, hb_script_t script) c_hb_buffer_set_script; ///
  void function(hb_buffer_t* buffer, const(hb_segment_properties_t)* props) c_hb_buffer_set_segment_properties; ///
  void function(hb_buffer_t* buffer, hb_unicode_funcs_t* unicodeFuncs) c_hb_buffer_set_unicode_funcs; ///
  hb_bool_t function(hb_buffer_t* buffer, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_buffer_set_user_data; ///
  ubyte function(hb_color_t color) c_hb_color_get_alpha; ///
  ubyte function(hb_color_t color) c_hb_color_get_blue; ///
  ubyte function(hb_color_t color) c_hb_color_get_green; ///
  ubyte function(hb_color_t color) c_hb_color_get_red; ///
  uint function(hb_color_line_t* colorLine, uint start, uint* count, hb_color_stop_t* colorStops) c_hb_color_line_get_color_stops; ///
  hb_paint_extend_t function(hb_color_line_t* colorLine) c_hb_color_line_get_extend; ///
  hb_direction_t function(const(ubyte)* str, int len) c_hb_direction_from_string; ///
  const(char)* function(hb_direction_t direction) c_hb_direction_to_string; ///
  void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st) c_hb_draw_close_path; ///
  void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float control1X, float control1Y, float control2X, float control2Y, float toX, float toY) c_hb_draw_cubic_to; ///
  hb_draw_funcs_t* function() c_hb_draw_funcs_create; ///
  void function(hb_draw_funcs_t* dfuncs) c_hb_draw_funcs_destroy; ///
  hb_draw_funcs_t* function() c_hb_draw_funcs_get_empty; ///
  void* function(const(hb_draw_funcs_t)* dfuncs, hb_user_data_key_t* key) c_hb_draw_funcs_get_user_data; ///
  hb_bool_t function(hb_draw_funcs_t* dfuncs) c_hb_draw_funcs_is_immutable; ///
  void function(hb_draw_funcs_t* dfuncs) c_hb_draw_funcs_make_immutable; ///
  hb_draw_funcs_t* function(hb_draw_funcs_t* dfuncs) c_hb_draw_funcs_reference; ///
  void function(hb_draw_funcs_t* dfuncs, hb_draw_close_path_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_draw_funcs_set_close_path_func; ///
  void function(hb_draw_funcs_t* dfuncs, hb_draw_cubic_to_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_draw_funcs_set_cubic_to_func; ///
  void function(hb_draw_funcs_t* dfuncs, hb_draw_line_to_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_draw_funcs_set_line_to_func; ///
  void function(hb_draw_funcs_t* dfuncs, hb_draw_move_to_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_draw_funcs_set_move_to_func; ///
  void function(hb_draw_funcs_t* dfuncs, hb_draw_quadratic_to_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_draw_funcs_set_quadratic_to_func; ///
  hb_bool_t function(hb_draw_funcs_t* dfuncs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_draw_funcs_set_user_data; ///
  void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY) c_hb_draw_line_to; ///
  void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY) c_hb_draw_move_to; ///
  void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float controlX, float controlY, float toX, float toY) c_hb_draw_quadratic_to; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tag, hb_blob_t* blob) c_hb_face_builder_add_table; ///
  hb_face_t* function() c_hb_face_builder_create; ///
  void function(hb_face_t* face, const(hb_tag_t)* tags) c_hb_face_builder_sort_tables; ///
  void function(hb_face_t* face, hb_map_t* mapping, hb_set_t* unicodes) c_hb_face_collect_nominal_glyph_mapping; ///
  void function(hb_face_t* face, hb_set_t* out_) c_hb_face_collect_unicodes; ///
  void function(hb_face_t* face, hb_set_t* out_) c_hb_face_collect_variation_selectors; ///
  void function(hb_face_t* face, hb_codepoint_t variationSelector, hb_set_t* out_) c_hb_face_collect_variation_unicodes; ///
  uint function(hb_blob_t* blob) c_hb_face_count; ///
  hb_face_t* function(hb_blob_t* blob, uint index) c_hb_face_create; ///
  hb_face_t* function(hb_reference_table_func_t referenceTableFunc, void* userData, hb_destroy_func_t destroy) c_hb_face_create_for_tables; ///
  void function(hb_face_t* face) c_hb_face_destroy; ///
  hb_face_t* function() c_hb_face_get_empty; ///
  uint function(const(hb_face_t)* face) c_hb_face_get_glyph_count; ///
  uint function(const(hb_face_t)* face) c_hb_face_get_index; ///
  uint function(const(hb_face_t)* face, uint startOffset, uint* tableCount, hb_tag_t* tableTags) c_hb_face_get_table_tags; ///
  uint function(const(hb_face_t)* face) c_hb_face_get_upem; ///
  void* function(const(hb_face_t)* face, hb_user_data_key_t* key) c_hb_face_get_user_data; ///
  hb_bool_t function(const(hb_face_t)* face) c_hb_face_is_immutable; ///
  void function(hb_face_t* face) c_hb_face_make_immutable; ///
  hb_face_t* function(hb_face_t* face) c_hb_face_reference; ///
  hb_blob_t* function(hb_face_t* face) c_hb_face_reference_blob; ///
  hb_blob_t* function(const(hb_face_t)* face, hb_tag_t tag) c_hb_face_reference_table; ///
  void function(hb_face_t* face, uint glyphCount) c_hb_face_set_glyph_count; ///
  void function(hb_face_t* face, uint index) c_hb_face_set_index; ///
  void function(hb_face_t* face, uint upem) c_hb_face_set_upem; ///
  hb_bool_t function(hb_face_t* face, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_face_set_user_data; ///
  hb_bool_t function(const(ubyte)* str, int len, hb_feature_t* feature) c_hb_feature_from_string; ///
  void function(hb_feature_t* feature, char* buf, uint size) c_hb_feature_to_string; ///
  void function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y) c_hb_font_add_glyph_origin_for_direction; ///
  void function(hb_font_t* font) c_hb_font_changed; ///
  hb_font_t* function(hb_face_t* face) c_hb_font_create; ///
  hb_font_t* function(hb_font_t* parent) c_hb_font_create_sub_font; ///
  void function(hb_font_t* font) c_hb_font_destroy; ///
  void function(hb_font_t* font, hb_codepoint_t glyph, hb_draw_funcs_t* dfuncs, void* drawData) c_hb_font_draw_glyph; ///
  hb_font_funcs_t* function() c_hb_font_funcs_create; ///
  void function(hb_font_funcs_t* ffuncs) c_hb_font_funcs_destroy; ///
  hb_font_funcs_t* function() c_hb_font_funcs_get_empty; ///
  void* function(const(hb_font_funcs_t)* ffuncs, hb_user_data_key_t* key) c_hb_font_funcs_get_user_data; ///
  hb_bool_t function(hb_font_funcs_t* ffuncs) c_hb_font_funcs_is_immutable; ///
  void function(hb_font_funcs_t* ffuncs) c_hb_font_funcs_make_immutable; ///
  hb_font_funcs_t* function(hb_font_funcs_t* ffuncs) c_hb_font_funcs_reference; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_draw_glyph_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_draw_glyph_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_font_h_extents_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_font_h_extents_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_font_v_extents_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_font_v_extents_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_contour_point_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_contour_point_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_extents_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_extents_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_from_name_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_from_name_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_advance_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_h_advance_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_advances_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_h_advances_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_kerning_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_h_kerning_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_origin_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_h_origin_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_name_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_name_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_shape_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_shape_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_advance_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_v_advance_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_advances_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_v_advances_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_kerning_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_v_kerning_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_origin_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_glyph_v_origin_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_nominal_glyph_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_nominal_glyph_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_nominal_glyphs_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_nominal_glyphs_func; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_paint_glyph_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_paint_glyph_func; ///
  hb_bool_t function(hb_font_funcs_t* ffuncs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_font_funcs_set_user_data; ///
  void function(hb_font_funcs_t* ffuncs, hb_font_get_variation_glyph_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_font_funcs_set_variation_glyph_func; ///
  hb_font_t* function() c_hb_font_get_empty; ///
  void function(hb_font_t* font, hb_direction_t direction, hb_font_extents_t* extents) c_hb_font_get_extents_for_direction; ///
  hb_face_t* function(hb_font_t* font) c_hb_font_get_face; ///
  hb_bool_t function(hb_font_t* font, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph) c_hb_font_get_glyph; ///
  void function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y) c_hb_font_get_glyph_advance_for_direction; ///
  void function(hb_font_t* font, hb_direction_t direction, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstAdvance, uint advanceStride) c_hb_font_get_glyph_advances_for_direction; ///
  hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, uint pointIndex, hb_position_t* x, hb_position_t* y) c_hb_font_get_glyph_contour_point; ///
  hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, uint pointIndex, hb_direction_t direction, hb_position_t* x, hb_position_t* y) c_hb_font_get_glyph_contour_point_for_origin; ///
  hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, hb_glyph_extents_t* extents) c_hb_font_get_glyph_extents; ///
  hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_glyph_extents_t* extents) c_hb_font_get_glyph_extents_for_origin; ///
  hb_bool_t function(hb_font_t* font, const(char)* name, int len, hb_codepoint_t* glyph) c_hb_font_get_glyph_from_name; ///
  hb_position_t function(hb_font_t* font, hb_codepoint_t glyph) c_hb_font_get_glyph_h_advance; ///
  void function(hb_font_t* font, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstAdvance, uint advanceStride) c_hb_font_get_glyph_h_advances; ///
  hb_position_t function(hb_font_t* font, hb_codepoint_t leftGlyph, hb_codepoint_t rightGlyph) c_hb_font_get_glyph_h_kerning; ///
  hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, hb_position_t* x, hb_position_t* y) c_hb_font_get_glyph_h_origin; ///
  void function(hb_font_t* font, hb_codepoint_t firstGlyph, hb_codepoint_t secondGlyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y) c_hb_font_get_glyph_kerning_for_direction; ///
  hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, char* name, uint size) c_hb_font_get_glyph_name; ///
  void function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y) c_hb_font_get_glyph_origin_for_direction; ///
  void function(hb_font_t* font, hb_codepoint_t glyph, hb_draw_funcs_t* dfuncs, void* drawData) c_hb_font_get_glyph_shape; ///
  hb_position_t function(hb_font_t* font, hb_codepoint_t glyph) c_hb_font_get_glyph_v_advance; ///
  void function(hb_font_t* font, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstAdvance, uint advanceStride) c_hb_font_get_glyph_v_advances; ///
  hb_position_t function(hb_font_t* font, hb_codepoint_t topGlyph, hb_codepoint_t bottomGlyph) c_hb_font_get_glyph_v_kerning; ///
  hb_bool_t function(hb_font_t* font, hb_codepoint_t glyph, hb_position_t* x, hb_position_t* y) c_hb_font_get_glyph_v_origin; ///
  hb_bool_t function(hb_font_t* font, hb_font_extents_t* extents) c_hb_font_get_h_extents; ///
  hb_bool_t function(hb_font_t* font, hb_codepoint_t unicode, hb_codepoint_t* glyph) c_hb_font_get_nominal_glyph; ///
  uint function(hb_font_t* font, uint count, const(hb_codepoint_t)* firstUnicode, uint unicodeStride, hb_codepoint_t* firstGlyph, uint glyphStride) c_hb_font_get_nominal_glyphs; ///
  hb_font_t* function(hb_font_t* font) c_hb_font_get_parent; ///
  void function(hb_font_t* font, uint* xPpem, uint* yPpem) c_hb_font_get_ppem; ///
  float function(hb_font_t* font) c_hb_font_get_ptem; ///
  void function(hb_font_t* font, int* xScale, int* yScale) c_hb_font_get_scale; ///
  uint function(hb_font_t* font) c_hb_font_get_serial; ///
  void function(hb_font_t* font, float* xEmbolden, float* yEmbolden, hb_bool_t* inPlace) c_hb_font_get_synthetic_bold; ///
  float function(hb_font_t* font) c_hb_font_get_synthetic_slant; ///
  void* function(const(hb_font_t)* font, hb_user_data_key_t* key) c_hb_font_get_user_data; ///
  hb_bool_t function(hb_font_t* font, hb_font_extents_t* extents) c_hb_font_get_v_extents; ///
  const(float)* function(hb_font_t* font, uint* length) c_hb_font_get_var_coords_design; ///
  const(int)* function(hb_font_t* font, uint* length) c_hb_font_get_var_coords_normalized; ///
  uint function(hb_font_t* font) c_hb_font_get_var_named_instance; ///
  hb_bool_t function(hb_font_t* font, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph) c_hb_font_get_variation_glyph; ///
  hb_bool_t function(hb_font_t* font, const(ubyte)* s, int len, hb_codepoint_t* glyph) c_hb_font_glyph_from_string; ///
  void function(hb_font_t* font, hb_codepoint_t glyph, char* s, uint size) c_hb_font_glyph_to_string; ///
  hb_bool_t function(hb_font_t* font) c_hb_font_is_immutable; ///
  void function(hb_font_t* font) c_hb_font_make_immutable; ///
  void function(hb_font_t* font, hb_codepoint_t glyph, hb_paint_funcs_t* pfuncs, void* paintData, uint paletteIndex, hb_color_t foreground) c_hb_font_paint_glyph; ///
  hb_font_t* function(hb_font_t* font) c_hb_font_reference; ///
  void function(hb_font_t* font, hb_face_t* face) c_hb_font_set_face; ///
  void function(hb_font_t* font, hb_font_funcs_t* klass, void* fontData, hb_destroy_func_t destroy) c_hb_font_set_funcs; ///
  void function(hb_font_t* font, void* fontData, hb_destroy_func_t destroy) c_hb_font_set_funcs_data; ///
  void function(hb_font_t* font, hb_font_t* parent) c_hb_font_set_parent; ///
  void function(hb_font_t* font, uint xPpem, uint yPpem) c_hb_font_set_ppem; ///
  void function(hb_font_t* font, float ptem) c_hb_font_set_ptem; ///
  void function(hb_font_t* font, int xScale, int yScale) c_hb_font_set_scale; ///
  void function(hb_font_t* font, float xEmbolden, float yEmbolden, hb_bool_t inPlace) c_hb_font_set_synthetic_bold; ///
  void function(hb_font_t* font, float slant) c_hb_font_set_synthetic_slant; ///
  hb_bool_t function(hb_font_t* font, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_font_set_user_data; ///
  void function(hb_font_t* font, const(float)* coords, uint coordsLength) c_hb_font_set_var_coords_design; ///
  void function(hb_font_t* font, const(int)* coords, uint coordsLength) c_hb_font_set_var_coords_normalized; ///
  void function(hb_font_t* font, uint instanceIndex) c_hb_font_set_var_named_instance; ///
  void function(hb_font_t* font, hb_tag_t tag, float value) c_hb_font_set_variation; ///
  void function(hb_font_t* font, const(hb_variation_t)* variations, uint variationsLength) c_hb_font_set_variations; ///
  void function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y) c_hb_font_subtract_glyph_origin_for_direction; ///
  hb_face_t* function(FT_Face ftFace, hb_destroy_func_t destroy) c_hb_ft_face_create; ///
  hb_face_t* function(FT_Face ftFace) c_hb_ft_face_create_cached; ///
  hb_face_t* function(FT_Face ftFace) c_hb_ft_face_create_referenced; ///
  void function(hb_font_t* font) c_hb_ft_font_changed; ///
  hb_font_t* function(FT_Face ftFace, hb_destroy_func_t destroy) c_hb_ft_font_create; ///
  hb_font_t* function(FT_Face ftFace) c_hb_ft_font_create_referenced; ///
  FT_Face function(hb_font_t* font) c_hb_ft_font_get_face; ///
  int function(hb_font_t* font) c_hb_ft_font_get_load_flags; ///
  FT_Face function(hb_font_t* font) c_hb_ft_font_lock_face; ///
  void function(hb_font_t* font) c_hb_ft_font_set_funcs; ///
  void function(hb_font_t* font, int loadFlags) c_hb_ft_font_set_load_flags; ///
  void function(hb_font_t* font) c_hb_ft_font_unlock_face; ///
  hb_bool_t function(hb_font_t* font) c_hb_ft_hb_font_changed; ///
  hb_blob_t* function(GBytes* gbytes) c_hb_glib_blob_create; ///
  hb_unicode_funcs_t* function() c_hb_glib_get_unicode_funcs; ///
  GUnicodeScript function(hb_script_t script) c_hb_glib_script_from_script; ///
  hb_script_t function(GUnicodeScript script) c_hb_glib_script_to_script; ///
  hb_glyph_flags_t function(const(hb_glyph_info_t)* info) c_hb_glyph_info_get_glyph_flags; ///
  hb_language_t function(const(ubyte)* str, int len) c_hb_language_from_string; ///
  hb_language_t function() c_hb_language_get_default; ///
  hb_bool_t function(hb_language_t language, hb_language_t specific) c_hb_language_matches; ///
  const(char)* function(hb_language_t language) c_hb_language_to_string; ///
  hb_bool_t function(const(hb_map_t)* map) c_hb_map_allocation_successful; ///
  void function(hb_map_t* map) c_hb_map_clear; ///
  hb_map_t* function(const(hb_map_t)* map) c_hb_map_copy; ///
  hb_map_t* function() c_hb_map_create; ///
  void function(hb_map_t* map, hb_codepoint_t key) c_hb_map_del; ///
  void function(hb_map_t* map) c_hb_map_destroy; ///
  hb_codepoint_t function(const(hb_map_t)* map, hb_codepoint_t key) c_hb_map_get; ///
  hb_map_t* function() c_hb_map_get_empty; ///
  uint function(const(hb_map_t)* map) c_hb_map_get_population; ///
  void* function(const(hb_map_t)* map, hb_user_data_key_t* key) c_hb_map_get_user_data; ///
  hb_bool_t function(const(hb_map_t)* map, hb_codepoint_t key) c_hb_map_has; ///
  uint function(const(hb_map_t)* map) c_hb_map_hash; ///
  hb_bool_t function(const(hb_map_t)* map) c_hb_map_is_empty; ///
  hb_bool_t function(const(hb_map_t)* map, const(hb_map_t)* other) c_hb_map_is_equal; ///
  void function(const(hb_map_t)* map, hb_set_t* keys) c_hb_map_keys; ///
  hb_bool_t function(const(hb_map_t)* map, int* idx, hb_codepoint_t* key, hb_codepoint_t* value) c_hb_map_next; ///
  hb_map_t* function(hb_map_t* map) c_hb_map_reference; ///
  void function(hb_map_t* map, hb_codepoint_t key, hb_codepoint_t value) c_hb_map_set; ///
  hb_bool_t function(hb_map_t* map, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_map_set_user_data; ///
  void function(hb_map_t* map, const(hb_map_t)* other) c_hb_map_update; ///
  void function(const(hb_map_t)* map, hb_set_t* values) c_hb_map_values; ///
  uint function(hb_face_t* face, hb_codepoint_t glyph, uint startOffset, uint* layerCount, hb_ot_color_layer_t* layers) c_hb_ot_color_glyph_get_layers; ///
  hb_bool_t function(hb_face_t* face, hb_codepoint_t glyph) c_hb_ot_color_glyph_has_paint; ///
  hb_blob_t* function(hb_font_t* font, hb_codepoint_t glyph) c_hb_ot_color_glyph_reference_png; ///
  hb_blob_t* function(hb_face_t* face, hb_codepoint_t glyph) c_hb_ot_color_glyph_reference_svg; ///
  hb_bool_t function(hb_face_t* face) c_hb_ot_color_has_layers; ///
  hb_bool_t function(hb_face_t* face) c_hb_ot_color_has_paint; ///
  hb_bool_t function(hb_face_t* face) c_hb_ot_color_has_palettes; ///
  hb_bool_t function(hb_face_t* face) c_hb_ot_color_has_png; ///
  hb_bool_t function(hb_face_t* face) c_hb_ot_color_has_svg; ///
  hb_ot_name_id_t function(hb_face_t* face, uint colorIndex) c_hb_ot_color_palette_color_get_name_id; ///
  uint function(hb_face_t* face, uint paletteIndex, uint startOffset, uint* colorCount, hb_color_t* colors) c_hb_ot_color_palette_get_colors; ///
  uint function(hb_face_t* face) c_hb_ot_color_palette_get_count; ///
  hb_ot_color_palette_flags_t function(hb_face_t* face, uint paletteIndex) c_hb_ot_color_palette_get_flags; ///
  hb_ot_name_id_t function(hb_face_t* face, uint paletteIndex) c_hb_ot_color_palette_get_name_id; ///
  void function(hb_font_t* font) c_hb_ot_font_set_funcs; ///
  void function(hb_face_t* face, hb_tag_t tableTag, const(hb_tag_t)* scripts, const(hb_tag_t)* languages, const(hb_tag_t)* features, hb_set_t* featureIndexes) c_hb_ot_layout_collect_features; ///
  void function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, hb_map_t* featureMap) c_hb_ot_layout_collect_features_map; ///
  void function(hb_face_t* face, hb_tag_t tableTag, const(hb_tag_t)* scripts, const(hb_tag_t)* languages, const(hb_tag_t)* features, hb_set_t* lookupIndexes) c_hb_ot_layout_collect_lookups; ///
  uint function(hb_face_t* face, hb_tag_t tableTag, uint featureIndex, uint startOffset, uint* charCount, hb_codepoint_t* characters) c_hb_ot_layout_feature_get_characters; ///
  uint function(hb_face_t* face, hb_tag_t tableTag, uint featureIndex, uint startOffset, uint* lookupCount, uint* lookupIndexes) c_hb_ot_layout_feature_get_lookups; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint featureIndex, hb_ot_name_id_t* labelId, hb_ot_name_id_t* tooltipId, hb_ot_name_id_t* sampleId, uint* numNamedParameters, hb_ot_name_id_t* firstParamId) c_hb_ot_layout_feature_get_name_ids; ///
  uint function(hb_face_t* face, hb_tag_t tableTag, uint featureIndex, uint variationsIndex, uint startOffset, uint* lookupCount, uint* lookupIndexes) c_hb_ot_layout_feature_with_variations_get_lookups; ///
  uint function(hb_face_t* face, hb_codepoint_t glyph, uint startOffset, uint* pointCount, uint* pointArray) c_hb_ot_layout_get_attach_points; ///
  hb_bool_t function(hb_font_t* font, hb_ot_layout_baseline_tag_t baselineTag, hb_direction_t direction, hb_tag_t scriptTag, hb_tag_t languageTag, hb_position_t* coord) c_hb_ot_layout_get_baseline; ///
  hb_bool_t function(hb_font_t* font, hb_ot_layout_baseline_tag_t baselineTag, hb_direction_t direction, hb_script_t script, hb_language_t language, hb_position_t* coord) c_hb_ot_layout_get_baseline2; ///
  void function(hb_font_t* font, hb_ot_layout_baseline_tag_t baselineTag, hb_direction_t direction, hb_tag_t scriptTag, hb_tag_t languageTag, hb_position_t* coord) c_hb_ot_layout_get_baseline_with_fallback; ///
  void function(hb_font_t* font, hb_ot_layout_baseline_tag_t baselineTag, hb_direction_t direction, hb_script_t script, hb_language_t language, hb_position_t* coord) c_hb_ot_layout_get_baseline_with_fallback2; ///
  hb_bool_t function(hb_font_t* font, hb_direction_t direction, hb_tag_t scriptTag, hb_tag_t languageTag, hb_font_extents_t* extents) c_hb_ot_layout_get_font_extents; ///
  hb_bool_t function(hb_font_t* font, hb_direction_t direction, hb_script_t script, hb_language_t language, hb_font_extents_t* extents) c_hb_ot_layout_get_font_extents2; ///
  hb_ot_layout_glyph_class_t function(hb_face_t* face, hb_codepoint_t glyph) c_hb_ot_layout_get_glyph_class; ///
  void function(hb_face_t* face, hb_ot_layout_glyph_class_t klass, hb_set_t* glyphs) c_hb_ot_layout_get_glyphs_in_class; ///
  hb_ot_layout_baseline_tag_t function(hb_script_t script) c_hb_ot_layout_get_horizontal_baseline_tag_for_script; ///
  uint function(hb_font_t* font, hb_direction_t direction, hb_codepoint_t glyph, uint startOffset, uint* caretCount, hb_position_t* caretArray) c_hb_ot_layout_get_ligature_carets; ///
  hb_bool_t function(hb_face_t* face, uint* designSize, uint* subfamilyId, hb_ot_name_id_t* subfamilyNameId, uint* rangeStart, uint* rangeEnd) c_hb_ot_layout_get_size_params; ///
  hb_bool_t function(hb_face_t* face) c_hb_ot_layout_has_glyph_classes; ///
  hb_bool_t function(hb_face_t* face) c_hb_ot_layout_has_positioning; ///
  hb_bool_t function(hb_face_t* face) c_hb_ot_layout_has_substitution; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, hb_tag_t featureTag, uint* featureIndex) c_hb_ot_layout_language_find_feature; ///
  uint function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, uint startOffset, uint* featureCount, uint* featureIndexes) c_hb_ot_layout_language_get_feature_indexes; ///
  uint function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, uint startOffset, uint* featureCount, hb_tag_t* featureTags) c_hb_ot_layout_language_get_feature_tags; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, uint* featureIndex, hb_tag_t* featureTag) c_hb_ot_layout_language_get_required_feature; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageIndex, uint* featureIndex) c_hb_ot_layout_language_get_required_feature_index; ///
  void function(hb_face_t* face, hb_tag_t tableTag, uint lookupIndex, hb_set_t* glyphsBefore, hb_set_t* glyphsInput, hb_set_t* glyphsAfter, hb_set_t* glyphsOutput) c_hb_ot_layout_lookup_collect_glyphs; ///
  uint function(hb_face_t* face, uint lookupIndex, hb_codepoint_t glyph, uint startOffset, uint* alternateCount, hb_codepoint_t* alternateGlyphs) c_hb_ot_layout_lookup_get_glyph_alternates; ///
  hb_position_t function(hb_font_t* font, uint lookupIndex, hb_direction_t direction, hb_codepoint_t glyph) c_hb_ot_layout_lookup_get_optical_bound; ///
  void function(hb_face_t* face, uint lookupIndex, hb_set_t* glyphs) c_hb_ot_layout_lookup_substitute_closure; ///
  hb_bool_t function(hb_face_t* face, uint lookupIndex, const(hb_codepoint_t)* glyphs, uint glyphsLength, hb_bool_t zeroContext) c_hb_ot_layout_lookup_would_substitute; ///
  void function(hb_face_t* face, const(hb_set_t)* lookups, hb_set_t* glyphs) c_hb_ot_layout_lookups_substitute_closure; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, hb_tag_t languageTag, uint* languageIndex) c_hb_ot_layout_script_find_language; ///
  uint function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint startOffset, uint* languageCount, hb_tag_t* languageTags) c_hb_ot_layout_script_get_language_tags; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageCount, const(hb_tag_t)* languageTags, uint* languageIndex) c_hb_ot_layout_script_select_language; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptIndex, uint languageCount, const(hb_tag_t)* languageTags, uint* languageIndex, hb_tag_t* chosenLanguage) c_hb_ot_layout_script_select_language2; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, const(hb_tag_t)* scriptTags, uint* scriptIndex, hb_tag_t* chosenScript) c_hb_ot_layout_table_choose_script; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, const(int)* coords, uint numCoords, uint* variationsIndex) c_hb_ot_layout_table_find_feature_variations; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, hb_tag_t scriptTag, uint* scriptIndex) c_hb_ot_layout_table_find_script; ///
  uint function(hb_face_t* face, hb_tag_t tableTag, uint startOffset, uint* featureCount, hb_tag_t* featureTags) c_hb_ot_layout_table_get_feature_tags; ///
  uint function(hb_face_t* face, hb_tag_t tableTag) c_hb_ot_layout_table_get_lookup_count; ///
  uint function(hb_face_t* face, hb_tag_t tableTag, uint startOffset, uint* scriptCount, hb_tag_t* scriptTags) c_hb_ot_layout_table_get_script_tags; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t tableTag, uint scriptCount, const(hb_tag_t)* scriptTags, uint* scriptIndex, hb_tag_t* chosenScript) c_hb_ot_layout_table_select_script; ///
  hb_position_t function(hb_font_t* font, hb_ot_math_constant_t constant) c_hb_ot_math_get_constant; ///
  uint function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, uint startOffset, uint* partsCount, hb_ot_math_glyph_part_t* parts, hb_position_t* italicsCorrection) c_hb_ot_math_get_glyph_assembly; ///
  hb_position_t function(hb_font_t* font, hb_codepoint_t glyph) c_hb_ot_math_get_glyph_italics_correction; ///
  hb_position_t function(hb_font_t* font, hb_codepoint_t glyph, hb_ot_math_kern_t kern, hb_position_t correctionHeight) c_hb_ot_math_get_glyph_kerning; ///
  uint function(hb_font_t* font, hb_codepoint_t glyph, hb_ot_math_kern_t kern, uint startOffset, uint* entriesCount, hb_ot_math_kern_entry_t* kernEntries) c_hb_ot_math_get_glyph_kernings; ///
  hb_position_t function(hb_font_t* font, hb_codepoint_t glyph) c_hb_ot_math_get_glyph_top_accent_attachment; ///
  uint function(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, uint startOffset, uint* variantsCount, hb_ot_math_glyph_variant_t* variants) c_hb_ot_math_get_glyph_variants; ///
  hb_position_t function(hb_font_t* font, hb_direction_t direction) c_hb_ot_math_get_min_connector_overlap; ///
  hb_bool_t function(hb_face_t* face) c_hb_ot_math_has_data; ///
  hb_bool_t function(hb_face_t* face, hb_codepoint_t glyph) c_hb_ot_math_is_glyph_extended_shape; ///
  uint function(hb_face_t* face, uint startOffset, uint* entriesCount, hb_ot_meta_tag_t* entries) c_hb_ot_meta_get_entry_tags; ///
  hb_blob_t* function(hb_face_t* face, hb_ot_meta_tag_t metaTag) c_hb_ot_meta_reference_entry; ///
  hb_bool_t function(hb_font_t* font, hb_ot_metrics_tag_t metricsTag, hb_position_t* position) c_hb_ot_metrics_get_position; ///
  void function(hb_font_t* font, hb_ot_metrics_tag_t metricsTag, hb_position_t* position) c_hb_ot_metrics_get_position_with_fallback; ///
  float function(hb_font_t* font, hb_ot_metrics_tag_t metricsTag) c_hb_ot_metrics_get_variation; ///
  hb_position_t function(hb_font_t* font, hb_ot_metrics_tag_t metricsTag) c_hb_ot_metrics_get_x_variation; ///
  hb_position_t function(hb_font_t* font, hb_ot_metrics_tag_t metricsTag) c_hb_ot_metrics_get_y_variation; ///
  uint function(hb_face_t* face, hb_ot_name_id_t nameId, hb_language_t language, uint* textSize, ushort* text) c_hb_ot_name_get_utf16; ///
  uint function(hb_face_t* face, hb_ot_name_id_t nameId, hb_language_t language, uint* textSize, uint* text) c_hb_ot_name_get_utf32; ///
  uint function(hb_face_t* face, hb_ot_name_id_t nameId, hb_language_t language, uint* textSize, char* text) c_hb_ot_name_get_utf8; ///
  const(hb_ot_name_entry_t)* function(hb_face_t* face, uint* numEntries) c_hb_ot_name_list_names; ///
  void function(hb_font_t* font, hb_buffer_t* buffer, const(hb_feature_t)* features, uint numFeatures, hb_set_t* glyphs) c_hb_ot_shape_glyphs_closure; ///
  void function(hb_shape_plan_t* shapePlan, hb_tag_t tableTag, hb_set_t* lookupIndexes) c_hb_ot_shape_plan_collect_lookups; ///
  hb_tag_t function(hb_language_t language) c_hb_ot_tag_from_language; ///
  hb_language_t function(hb_tag_t tag) c_hb_ot_tag_to_language; ///
  hb_script_t function(hb_tag_t tag) c_hb_ot_tag_to_script; ///
  void function(hb_script_t script, hb_tag_t* scriptTag1, hb_tag_t* scriptTag2) c_hb_ot_tags_from_script; ///
  void function(hb_script_t script, hb_language_t language, uint* scriptCount, hb_tag_t* scriptTags, uint* languageCount, hb_tag_t* languageTags) c_hb_ot_tags_from_script_and_language; ///
  void function(hb_tag_t scriptTag, hb_tag_t languageTag, hb_script_t* script, hb_language_t* language) c_hb_ot_tags_to_script_and_language; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t axisTag, uint* axisIndex, hb_ot_var_axis_t* axisInfo) c_hb_ot_var_find_axis; ///
  hb_bool_t function(hb_face_t* face, hb_tag_t axisTag, hb_ot_var_axis_info_t* axisInfo) c_hb_ot_var_find_axis_info; ///
  uint function(hb_face_t* face, uint startOffset, uint* axesCount, hb_ot_var_axis_t* axesArray) c_hb_ot_var_get_axes; ///
  uint function(hb_face_t* face) c_hb_ot_var_get_axis_count; ///
  uint function(hb_face_t* face, uint startOffset, uint* axesCount, hb_ot_var_axis_info_t* axesArray) c_hb_ot_var_get_axis_infos; ///
  uint function(hb_face_t* face) c_hb_ot_var_get_named_instance_count; ///
  hb_bool_t function(hb_face_t* face) c_hb_ot_var_has_data; ///
  uint function(hb_face_t* face, uint instanceIndex, uint* coordsLength, float* coords) c_hb_ot_var_named_instance_get_design_coords; ///
  hb_ot_name_id_t function(hb_face_t* face, uint instanceIndex) c_hb_ot_var_named_instance_get_postscript_name_id; ///
  hb_ot_name_id_t function(hb_face_t* face, uint instanceIndex) c_hb_ot_var_named_instance_get_subfamily_name_id; ///
  void function(hb_face_t* face, uint coordsLength, const(float)* designCoords, int* normalizedCoords) c_hb_ot_var_normalize_coords; ///
  void function(hb_face_t* face, const(hb_variation_t)* variations, uint variationsLength, int* coords, uint coordsLength) c_hb_ot_var_normalize_variations; ///
  void function(hb_paint_funcs_t* funcs, void* paintData, hb_bool_t isForeground, hb_color_t color) c_hb_paint_color; ///
  hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font) c_hb_paint_color_glyph; ///
  hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, uint colorIndex, hb_color_t* color) c_hb_paint_custom_palette_color; ///
  hb_paint_funcs_t* function() c_hb_paint_funcs_create; ///
  void function(hb_paint_funcs_t* funcs) c_hb_paint_funcs_destroy; ///
  hb_paint_funcs_t* function() c_hb_paint_funcs_get_empty; ///
  void* function(const(hb_paint_funcs_t)* funcs, hb_user_data_key_t* key) c_hb_paint_funcs_get_user_data; ///
  hb_bool_t function(hb_paint_funcs_t* funcs) c_hb_paint_funcs_is_immutable; ///
  void function(hb_paint_funcs_t* funcs) c_hb_paint_funcs_make_immutable; ///
  hb_paint_funcs_t* function(hb_paint_funcs_t* funcs) c_hb_paint_funcs_reference; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_color_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_color_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_color_glyph_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_color_glyph_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_custom_palette_color_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_custom_palette_color_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_image_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_image_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_linear_gradient_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_linear_gradient_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_pop_clip_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_pop_clip_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_pop_group_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_pop_group_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_pop_transform_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_pop_transform_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_push_clip_glyph_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_push_clip_glyph_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_push_clip_rectangle_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_push_clip_rectangle_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_push_group_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_push_group_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_push_transform_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_push_transform_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_radial_gradient_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_radial_gradient_func; ///
  void function(hb_paint_funcs_t* funcs, hb_paint_sweep_gradient_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_paint_funcs_set_sweep_gradient_func; ///
  hb_bool_t function(hb_paint_funcs_t* funcs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_paint_funcs_set_user_data; ///
  void function(hb_paint_funcs_t* funcs, void* paintData, hb_blob_t* image, uint width, uint height, hb_tag_t format, float slant, hb_glyph_extents_t* extents) c_hb_paint_image; ///
  void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float x1, float y1, float x2, float y2) c_hb_paint_linear_gradient; ///
  void function(hb_paint_funcs_t* funcs, void* paintData) c_hb_paint_pop_clip; ///
  void function(hb_paint_funcs_t* funcs, void* paintData, hb_paint_composite_mode_t mode) c_hb_paint_pop_group; ///
  void function(hb_paint_funcs_t* funcs, void* paintData) c_hb_paint_pop_transform; ///
  void function(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font) c_hb_paint_push_clip_glyph; ///
  void function(hb_paint_funcs_t* funcs, void* paintData, float xmin, float ymin, float xmax, float ymax) c_hb_paint_push_clip_rectangle; ///
  void function(hb_paint_funcs_t* funcs, void* paintData) c_hb_paint_push_group; ///
  void function(hb_paint_funcs_t* funcs, void* paintData, float xx, float yx, float xy, float yy, float dx, float dy) c_hb_paint_push_transform; ///
  void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float r0, float x1, float y1, float r1) c_hb_paint_radial_gradient; ///
  void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float startAngle, float endAngle) c_hb_paint_sweep_gradient; ///
  hb_script_t function(hb_tag_t tag) c_hb_script_from_iso15924_tag; ///
  hb_script_t function(const(ubyte)* str, int len) c_hb_script_from_string; ///
  hb_direction_t function(hb_script_t script) c_hb_script_get_horizontal_direction; ///
  hb_tag_t function(hb_script_t script) c_hb_script_to_iso15924_tag; ///
  hb_bool_t function(const(hb_segment_properties_t)* a, const(hb_segment_properties_t)* b) c_hb_segment_properties_equal; ///
  uint function(const(hb_segment_properties_t)* p) c_hb_segment_properties_hash; ///
  void function(hb_segment_properties_t* p, const(hb_segment_properties_t)* src) c_hb_segment_properties_overlay; ///
  void function(hb_set_t* set, hb_codepoint_t codepoint) c_hb_set_add; ///
  void function(hb_set_t* set, hb_codepoint_t first, hb_codepoint_t last) c_hb_set_add_range; ///
  void function(hb_set_t* set, const(hb_codepoint_t)* sortedCodepoints, uint numCodepoints) c_hb_set_add_sorted_array; ///
  hb_bool_t function(const(hb_set_t)* set) c_hb_set_allocation_successful; ///
  void function(hb_set_t* set) c_hb_set_clear; ///
  hb_set_t* function(const(hb_set_t)* set) c_hb_set_copy; ///
  hb_set_t* function() c_hb_set_create; ///
  void function(hb_set_t* set, hb_codepoint_t codepoint) c_hb_set_del; ///
  void function(hb_set_t* set, hb_codepoint_t first, hb_codepoint_t last) c_hb_set_del_range; ///
  void function(hb_set_t* set) c_hb_set_destroy; ///
  hb_set_t* function() c_hb_set_get_empty; ///
  hb_codepoint_t function(const(hb_set_t)* set) c_hb_set_get_max; ///
  hb_codepoint_t function(const(hb_set_t)* set) c_hb_set_get_min; ///
  uint function(const(hb_set_t)* set) c_hb_set_get_population; ///
  void* function(const(hb_set_t)* set, hb_user_data_key_t* key) c_hb_set_get_user_data; ///
  hb_bool_t function(const(hb_set_t)* set, hb_codepoint_t codepoint) c_hb_set_has; ///
  uint function(const(hb_set_t)* set) c_hb_set_hash; ///
  void function(hb_set_t* set, const(hb_set_t)* other) c_hb_set_intersect; ///
  void function(hb_set_t* set) c_hb_set_invert; ///
  hb_bool_t function(const(hb_set_t)* set) c_hb_set_is_empty; ///
  hb_bool_t function(const(hb_set_t)* set, const(hb_set_t)* other) c_hb_set_is_equal; ///
  hb_bool_t function(const(hb_set_t)* set) c_hb_set_is_inverted; ///
  hb_bool_t function(const(hb_set_t)* set, const(hb_set_t)* largerSet) c_hb_set_is_subset; ///
  hb_bool_t function(const(hb_set_t)* set, hb_codepoint_t* codepoint) c_hb_set_next; ///
  uint function(const(hb_set_t)* set, hb_codepoint_t codepoint, hb_codepoint_t* out_, uint size) c_hb_set_next_many; ///
  hb_bool_t function(const(hb_set_t)* set, hb_codepoint_t* first, hb_codepoint_t* last) c_hb_set_next_range; ///
  hb_bool_t function(const(hb_set_t)* set, hb_codepoint_t* codepoint) c_hb_set_previous; ///
  hb_bool_t function(const(hb_set_t)* set, hb_codepoint_t* first, hb_codepoint_t* last) c_hb_set_previous_range; ///
  hb_set_t* function(hb_set_t* set) c_hb_set_reference; ///
  void function(hb_set_t* set, const(hb_set_t)* other) c_hb_set_set; ///
  hb_bool_t function(hb_set_t* set, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_set_set_user_data; ///
  void function(hb_set_t* set, const(hb_set_t)* other) c_hb_set_subtract; ///
  void function(hb_set_t* set, const(hb_set_t)* other) c_hb_set_symmetric_difference; ///
  void function(hb_set_t* set, const(hb_set_t)* other) c_hb_set_union; ///
  void function(hb_font_t* font, hb_buffer_t* buffer, const(hb_feature_t)* features, uint numFeatures) c_hb_shape; ///
  hb_bool_t function(hb_font_t* font, hb_buffer_t* buffer, const(hb_feature_t)* features, uint numFeatures, const(char*)* shaperList) c_hb_shape_full; ///
  hb_bool_t function(hb_font_t* font, hb_buffer_t* buffer, const(hb_feature_t)* features, uint numFeatures, const(char*)* shaperList, float minTargetAdvance, float maxTargetAdvance, float* advance, hb_tag_t* varTag, float* varValue) c_hb_shape_justify; ///
  const(char*)* function() c_hb_shape_list_shapers; ///
  hb_shape_plan_t* function(hb_face_t* face, const(hb_segment_properties_t)* props, const(hb_feature_t)* userFeatures, uint numUserFeatures, const(char*)* shaperList) c_hb_shape_plan_create; ///
  hb_shape_plan_t* function(hb_face_t* face, const(hb_segment_properties_t)* props, const(hb_feature_t)* userFeatures, uint numUserFeatures, const(int)* coords, uint numCoords, const(char*)* shaperList) c_hb_shape_plan_create2; ///
  hb_shape_plan_t* function(hb_face_t* face, const(hb_segment_properties_t)* props, const(hb_feature_t)* userFeatures, uint numUserFeatures, const(char*)* shaperList) c_hb_shape_plan_create_cached; ///
  hb_shape_plan_t* function(hb_face_t* face, const(hb_segment_properties_t)* props, const(hb_feature_t)* userFeatures, uint numUserFeatures, const(int)* coords, uint numCoords, const(char*)* shaperList) c_hb_shape_plan_create_cached2; ///
  void function(hb_shape_plan_t* shapePlan) c_hb_shape_plan_destroy; ///
  hb_bool_t function(hb_shape_plan_t* shapePlan, hb_font_t* font, hb_buffer_t* buffer, const(hb_feature_t)* features, uint numFeatures) c_hb_shape_plan_execute; ///
  hb_shape_plan_t* function() c_hb_shape_plan_get_empty; ///
  const(char)* function(hb_shape_plan_t* shapePlan) c_hb_shape_plan_get_shaper; ///
  void* function(const(hb_shape_plan_t)* shapePlan, hb_user_data_key_t* key) c_hb_shape_plan_get_user_data; ///
  hb_shape_plan_t* function(hb_shape_plan_t* shapePlan) c_hb_shape_plan_reference; ///
  hb_bool_t function(hb_shape_plan_t* shapePlan, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_shape_plan_set_user_data; ///
  float function(hb_font_t* font, hb_style_tag_t styleTag) c_hb_style_get_value; ///
  hb_tag_t function(const(ubyte)* str, int len) c_hb_tag_from_string; ///
  void function(hb_tag_t tag, char* buf) c_hb_tag_to_string; ///
  hb_unicode_combining_class_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode) c_hb_unicode_combining_class; ///
  hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t a, hb_codepoint_t b, hb_codepoint_t* ab) c_hb_unicode_compose; ///
  hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t ab, hb_codepoint_t* a, hb_codepoint_t* b) c_hb_unicode_decompose; ///
  uint function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t u, hb_codepoint_t* decomposed) c_hb_unicode_decompose_compatibility; ///
  uint function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode) c_hb_unicode_eastasian_width; ///
  hb_unicode_funcs_t* function(hb_unicode_funcs_t* parent) c_hb_unicode_funcs_create; ///
  void function(hb_unicode_funcs_t* ufuncs) c_hb_unicode_funcs_destroy; ///
  hb_unicode_funcs_t* function() c_hb_unicode_funcs_get_default; ///
  hb_unicode_funcs_t* function() c_hb_unicode_funcs_get_empty; ///
  hb_unicode_funcs_t* function(hb_unicode_funcs_t* ufuncs) c_hb_unicode_funcs_get_parent; ///
  void* function(const(hb_unicode_funcs_t)* ufuncs, hb_user_data_key_t* key) c_hb_unicode_funcs_get_user_data; ///
  hb_bool_t function(hb_unicode_funcs_t* ufuncs) c_hb_unicode_funcs_is_immutable; ///
  void function(hb_unicode_funcs_t* ufuncs) c_hb_unicode_funcs_make_immutable; ///
  hb_unicode_funcs_t* function(hb_unicode_funcs_t* ufuncs) c_hb_unicode_funcs_reference; ///
  void function(hb_unicode_funcs_t* ufuncs, hb_unicode_combining_class_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_unicode_funcs_set_combining_class_func; ///
  void function(hb_unicode_funcs_t* ufuncs, hb_unicode_compose_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_unicode_funcs_set_compose_func; ///
  void function(hb_unicode_funcs_t* ufuncs, hb_unicode_decompose_compatibility_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_unicode_funcs_set_decompose_compatibility_func; ///
  void function(hb_unicode_funcs_t* ufuncs, hb_unicode_decompose_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_unicode_funcs_set_decompose_func; ///
  void function(hb_unicode_funcs_t* ufuncs, hb_unicode_eastasian_width_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_unicode_funcs_set_eastasian_width_func; ///
  void function(hb_unicode_funcs_t* ufuncs, hb_unicode_general_category_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_unicode_funcs_set_general_category_func; ///
  void function(hb_unicode_funcs_t* ufuncs, hb_unicode_mirroring_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_unicode_funcs_set_mirroring_func; ///
  void function(hb_unicode_funcs_t* ufuncs, hb_unicode_script_func_t func, void* userData, hb_destroy_func_t destroy) c_hb_unicode_funcs_set_script_func; ///
  hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace) c_hb_unicode_funcs_set_user_data; ///
  hb_unicode_general_category_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode) c_hb_unicode_general_category; ///
  hb_codepoint_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode) c_hb_unicode_mirroring; ///
  hb_script_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode) c_hb_unicode_script; ///
  hb_bool_t function(const(ubyte)* str, int len, hb_variation_t* variation) c_hb_variation_from_string; ///
  void function(hb_variation_t* variation, char* buf, uint size) c_hb_variation_to_string; ///

  // GlyphInfo
  GType function() c_hb_gobject_glyph_info_get_type; ///

  // GlyphPosition
  GType function() c_hb_gobject_glyph_position_get_type; ///
}

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
alias hb_face_make_immutable = c_hb_face_make_immutable;

/** */
alias hb_face_reference = c_hb_face_reference;

/** */
alias hb_face_reference_blob = c_hb_face_reference_blob;

/** */
alias hb_face_reference_table = c_hb_face_reference_table;

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
alias hb_font_funcs_set_nominal_glyph_func = c_hb_font_funcs_set_nominal_glyph_func;

/** */
alias hb_font_funcs_set_nominal_glyphs_func = c_hb_font_funcs_set_nominal_glyphs_func;

/** */
alias hb_font_funcs_set_paint_glyph_func = c_hb_font_funcs_set_paint_glyph_func;

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
alias hb_font_make_immutable = c_hb_font_make_immutable;

/** */
alias hb_font_paint_glyph = c_hb_font_paint_glyph;

/** */
alias hb_font_reference = c_hb_font_reference;

/** */
alias hb_font_set_face = c_hb_font_set_face;

/** */
alias hb_font_set_funcs = c_hb_font_set_funcs;

/** */
alias hb_font_set_funcs_data = c_hb_font_set_funcs_data;

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
alias hb_ft_face_create = c_hb_ft_face_create;

/** */
alias hb_ft_face_create_cached = c_hb_ft_face_create_cached;

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
alias hb_paint_push_group = c_hb_paint_push_group;

/** */
alias hb_paint_push_transform = c_hb_paint_push_transform;

/** */
alias hb_paint_radial_gradient = c_hb_paint_radial_gradient;

/** */
alias hb_paint_sweep_gradient = c_hb_paint_sweep_gradient;

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
alias hb_shape_justify = c_hb_shape_justify;

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
  auto libs = gidResolveLibs(LIBS);

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
  gidLink(cast(void**)&hb_buffer_set_replacement_codepoint, "hb_buffer_set_replacement_codepoint", libs);
  gidLink(cast(void**)&hb_buffer_set_script, "hb_buffer_set_script", libs);
  gidLink(cast(void**)&hb_buffer_set_segment_properties, "hb_buffer_set_segment_properties", libs);
  gidLink(cast(void**)&hb_buffer_set_unicode_funcs, "hb_buffer_set_unicode_funcs", libs);
  gidLink(cast(void**)&hb_buffer_set_user_data, "hb_buffer_set_user_data", libs);
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
  gidLink(cast(void**)&hb_face_destroy, "hb_face_destroy", libs);
  gidLink(cast(void**)&hb_face_get_empty, "hb_face_get_empty", libs);
  gidLink(cast(void**)&hb_face_get_glyph_count, "hb_face_get_glyph_count", libs);
  gidLink(cast(void**)&hb_face_get_index, "hb_face_get_index", libs);
  gidLink(cast(void**)&hb_face_get_table_tags, "hb_face_get_table_tags", libs);
  gidLink(cast(void**)&hb_face_get_upem, "hb_face_get_upem", libs);
  gidLink(cast(void**)&hb_face_get_user_data, "hb_face_get_user_data", libs);
  gidLink(cast(void**)&hb_face_is_immutable, "hb_face_is_immutable", libs);
  gidLink(cast(void**)&hb_face_make_immutable, "hb_face_make_immutable", libs);
  gidLink(cast(void**)&hb_face_reference, "hb_face_reference", libs);
  gidLink(cast(void**)&hb_face_reference_blob, "hb_face_reference_blob", libs);
  gidLink(cast(void**)&hb_face_reference_table, "hb_face_reference_table", libs);
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
  gidLink(cast(void**)&hb_font_funcs_create, "hb_font_funcs_create", libs);
  gidLink(cast(void**)&hb_font_funcs_destroy, "hb_font_funcs_destroy", libs);
  gidLink(cast(void**)&hb_font_funcs_get_empty, "hb_font_funcs_get_empty", libs);
  gidLink(cast(void**)&hb_font_funcs_get_user_data, "hb_font_funcs_get_user_data", libs);
  gidLink(cast(void**)&hb_font_funcs_is_immutable, "hb_font_funcs_is_immutable", libs);
  gidLink(cast(void**)&hb_font_funcs_make_immutable, "hb_font_funcs_make_immutable", libs);
  gidLink(cast(void**)&hb_font_funcs_reference, "hb_font_funcs_reference", libs);
  gidLink(cast(void**)&hb_font_funcs_set_draw_glyph_func, "hb_font_funcs_set_draw_glyph_func", libs);
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
  gidLink(cast(void**)&hb_font_funcs_set_glyph_name_func, "hb_font_funcs_set_glyph_name_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_shape_func, "hb_font_funcs_set_glyph_shape_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_v_advance_func, "hb_font_funcs_set_glyph_v_advance_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_v_advances_func, "hb_font_funcs_set_glyph_v_advances_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_v_kerning_func, "hb_font_funcs_set_glyph_v_kerning_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_glyph_v_origin_func, "hb_font_funcs_set_glyph_v_origin_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_nominal_glyph_func, "hb_font_funcs_set_nominal_glyph_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_nominal_glyphs_func, "hb_font_funcs_set_nominal_glyphs_func", libs);
  gidLink(cast(void**)&hb_font_funcs_set_paint_glyph_func, "hb_font_funcs_set_paint_glyph_func", libs);
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
  gidLink(cast(void**)&hb_font_get_glyph_kerning_for_direction, "hb_font_get_glyph_kerning_for_direction", libs);
  gidLink(cast(void**)&hb_font_get_glyph_name, "hb_font_get_glyph_name", libs);
  gidLink(cast(void**)&hb_font_get_glyph_origin_for_direction, "hb_font_get_glyph_origin_for_direction", libs);
  gidLink(cast(void**)&hb_font_get_glyph_shape, "hb_font_get_glyph_shape", libs);
  gidLink(cast(void**)&hb_font_get_glyph_v_advance, "hb_font_get_glyph_v_advance", libs);
  gidLink(cast(void**)&hb_font_get_glyph_v_advances, "hb_font_get_glyph_v_advances", libs);
  gidLink(cast(void**)&hb_font_get_glyph_v_kerning, "hb_font_get_glyph_v_kerning", libs);
  gidLink(cast(void**)&hb_font_get_glyph_v_origin, "hb_font_get_glyph_v_origin", libs);
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
  gidLink(cast(void**)&hb_font_make_immutable, "hb_font_make_immutable", libs);
  gidLink(cast(void**)&hb_font_paint_glyph, "hb_font_paint_glyph", libs);
  gidLink(cast(void**)&hb_font_reference, "hb_font_reference", libs);
  gidLink(cast(void**)&hb_font_set_face, "hb_font_set_face", libs);
  gidLink(cast(void**)&hb_font_set_funcs, "hb_font_set_funcs", libs);
  gidLink(cast(void**)&hb_font_set_funcs_data, "hb_font_set_funcs_data", libs);
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
  gidLink(cast(void**)&hb_ft_face_create, "hb_ft_face_create", libs);
  gidLink(cast(void**)&hb_ft_face_create_cached, "hb_ft_face_create_cached", libs);
  gidLink(cast(void**)&hb_ft_face_create_referenced, "hb_ft_face_create_referenced", libs);
  gidLink(cast(void**)&hb_ft_font_changed, "hb_ft_font_changed", libs);
  gidLink(cast(void**)&hb_ft_font_create, "hb_ft_font_create", libs);
  gidLink(cast(void**)&hb_ft_font_create_referenced, "hb_ft_font_create_referenced", libs);
  gidLink(cast(void**)&hb_ft_font_get_face, "hb_ft_font_get_face", libs);
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
  gidLink(cast(void**)&hb_paint_push_group, "hb_paint_push_group", libs);
  gidLink(cast(void**)&hb_paint_push_transform, "hb_paint_push_transform", libs);
  gidLink(cast(void**)&hb_paint_radial_gradient, "hb_paint_radial_gradient", libs);
  gidLink(cast(void**)&hb_paint_sweep_gradient, "hb_paint_sweep_gradient", libs);
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
  gidLink(cast(void**)&hb_shape_justify, "hb_shape_justify", libs);
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
