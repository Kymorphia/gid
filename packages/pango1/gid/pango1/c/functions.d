/// C functions for pango1 library
module gid.pango1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.pango1.c.types;
public import gid.cairo1.c.types;
public import gid.gio2.c.types;
public import gid.gobject2.c.types;
public import gid.harfbuzz0.c.types;

private immutable LIBS = ["pango-1.0_0"];

// AttrFontDesc
private alias c_pango_attr_font_desc_newFn = extern(C) PangoAttribute* function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_attr_font_desc_newFn c_pango_attr_font_desc_new; ///

// AttrFontFeatures
private alias c_pango_attr_font_features_newFn = extern(C) PangoAttribute* function(const(char)* features) nothrow;
__gshared c_pango_attr_font_features_newFn c_pango_attr_font_features_new; ///

// AttrIterator
private alias c_pango_attr_iterator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_attr_iterator_get_typeFn c_pango_attr_iterator_get_type; ///
private alias c_pango_attr_iterator_copyFn = extern(C) PangoAttrIterator* function(PangoAttrIterator* iterator) nothrow;
__gshared c_pango_attr_iterator_copyFn c_pango_attr_iterator_copy; ///
private alias c_pango_attr_iterator_destroyFn = extern(C) void function(PangoAttrIterator* iterator) nothrow;
__gshared c_pango_attr_iterator_destroyFn c_pango_attr_iterator_destroy; ///
private alias c_pango_attr_iterator_getFn = extern(C) PangoAttribute* function(PangoAttrIterator* iterator, PangoAttrType type) nothrow;
__gshared c_pango_attr_iterator_getFn c_pango_attr_iterator_get; ///
private alias c_pango_attr_iterator_get_attrsFn = extern(C) GSList* function(PangoAttrIterator* iterator) nothrow;
__gshared c_pango_attr_iterator_get_attrsFn c_pango_attr_iterator_get_attrs; ///
private alias c_pango_attr_iterator_get_fontFn = extern(C) void function(PangoAttrIterator* iterator, PangoFontDescription* desc, PangoLanguage** language, GSList** extraAttrs) nothrow;
__gshared c_pango_attr_iterator_get_fontFn c_pango_attr_iterator_get_font; ///
private alias c_pango_attr_iterator_nextFn = extern(C) gboolean function(PangoAttrIterator* iterator) nothrow;
__gshared c_pango_attr_iterator_nextFn c_pango_attr_iterator_next; ///
private alias c_pango_attr_iterator_rangeFn = extern(C) void function(PangoAttrIterator* iterator, int* start, int* end) nothrow;
__gshared c_pango_attr_iterator_rangeFn c_pango_attr_iterator_range; ///

// AttrLanguage
private alias c_pango_attr_language_newFn = extern(C) PangoAttribute* function(PangoLanguage* language) nothrow;
__gshared c_pango_attr_language_newFn c_pango_attr_language_new; ///

// AttrList
private alias c_pango_attr_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_attr_list_get_typeFn c_pango_attr_list_get_type; ///
private alias c_pango_attr_list_newFn = extern(C) PangoAttrList* function() nothrow;
__gshared c_pango_attr_list_newFn c_pango_attr_list_new; ///
private alias c_pango_attr_list_changeFn = extern(C) void function(PangoAttrList* list, PangoAttribute* attr) nothrow;
__gshared c_pango_attr_list_changeFn c_pango_attr_list_change; ///
private alias c_pango_attr_list_copyFn = extern(C) PangoAttrList* function(PangoAttrList* list) nothrow;
__gshared c_pango_attr_list_copyFn c_pango_attr_list_copy; ///
private alias c_pango_attr_list_equalFn = extern(C) gboolean function(PangoAttrList* list, PangoAttrList* otherList) nothrow;
__gshared c_pango_attr_list_equalFn c_pango_attr_list_equal; ///
private alias c_pango_attr_list_filterFn = extern(C) PangoAttrList* function(PangoAttrList* list, PangoAttrFilterFunc func, void* data) nothrow;
__gshared c_pango_attr_list_filterFn c_pango_attr_list_filter; ///
private alias c_pango_attr_list_get_attributesFn = extern(C) GSList* function(PangoAttrList* list) nothrow;
__gshared c_pango_attr_list_get_attributesFn c_pango_attr_list_get_attributes; ///
private alias c_pango_attr_list_get_iteratorFn = extern(C) PangoAttrIterator* function(PangoAttrList* list) nothrow;
__gshared c_pango_attr_list_get_iteratorFn c_pango_attr_list_get_iterator; ///
private alias c_pango_attr_list_insertFn = extern(C) void function(PangoAttrList* list, PangoAttribute* attr) nothrow;
__gshared c_pango_attr_list_insertFn c_pango_attr_list_insert; ///
private alias c_pango_attr_list_insert_beforeFn = extern(C) void function(PangoAttrList* list, PangoAttribute* attr) nothrow;
__gshared c_pango_attr_list_insert_beforeFn c_pango_attr_list_insert_before; ///
private alias c_pango_attr_list_refFn = extern(C) PangoAttrList* function(PangoAttrList* list) nothrow;
__gshared c_pango_attr_list_refFn c_pango_attr_list_ref; ///
private alias c_pango_attr_list_spliceFn = extern(C) void function(PangoAttrList* list, PangoAttrList* other, int pos, int len) nothrow;
__gshared c_pango_attr_list_spliceFn c_pango_attr_list_splice; ///
private alias c_pango_attr_list_to_stringFn = extern(C) char* function(PangoAttrList* list) nothrow;
__gshared c_pango_attr_list_to_stringFn c_pango_attr_list_to_string; ///
private alias c_pango_attr_list_unrefFn = extern(C) void function(PangoAttrList* list) nothrow;
__gshared c_pango_attr_list_unrefFn c_pango_attr_list_unref; ///
private alias c_pango_attr_list_updateFn = extern(C) void function(PangoAttrList* list, int pos, int remove, int add) nothrow;
__gshared c_pango_attr_list_updateFn c_pango_attr_list_update; ///
private alias c_pango_attr_list_from_stringFn = extern(C) PangoAttrList* function(const(char)* text) nothrow;
__gshared c_pango_attr_list_from_stringFn c_pango_attr_list_from_string; ///

// AttrShape
private alias c_pango_attr_shape_newFn = extern(C) PangoAttribute* function(const(PangoRectangle)* inkRect, const(PangoRectangle)* logicalRect) nothrow;
__gshared c_pango_attr_shape_newFn c_pango_attr_shape_new; ///
private alias c_pango_attr_shape_new_with_dataFn = extern(C) PangoAttribute* function(const(PangoRectangle)* inkRect, const(PangoRectangle)* logicalRect, void* data, PangoAttrDataCopyFunc copyFunc, GDestroyNotify destroyFunc) nothrow;
__gshared c_pango_attr_shape_new_with_dataFn c_pango_attr_shape_new_with_data; ///

// AttrSize
private alias c_pango_attr_size_newFn = extern(C) PangoAttribute* function(int size) nothrow;
__gshared c_pango_attr_size_newFn c_pango_attr_size_new; ///
private alias c_pango_attr_size_new_absoluteFn = extern(C) PangoAttribute* function(int size) nothrow;
__gshared c_pango_attr_size_new_absoluteFn c_pango_attr_size_new_absolute; ///

// Attribute
private alias c_pango_attribute_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_attribute_get_typeFn c_pango_attribute_get_type; ///
private alias c_pango_attribute_as_colorFn = extern(C) PangoAttrColor* function(PangoAttribute* attr) nothrow;
__gshared c_pango_attribute_as_colorFn c_pango_attribute_as_color; ///
private alias c_pango_attribute_as_floatFn = extern(C) PangoAttrFloat* function(PangoAttribute* attr) nothrow;
__gshared c_pango_attribute_as_floatFn c_pango_attribute_as_float; ///
private alias c_pango_attribute_as_font_descFn = extern(C) PangoAttrFontDesc* function(PangoAttribute* attr) nothrow;
__gshared c_pango_attribute_as_font_descFn c_pango_attribute_as_font_desc; ///
private alias c_pango_attribute_as_font_featuresFn = extern(C) PangoAttrFontFeatures* function(PangoAttribute* attr) nothrow;
__gshared c_pango_attribute_as_font_featuresFn c_pango_attribute_as_font_features; ///
private alias c_pango_attribute_as_intFn = extern(C) PangoAttrInt* function(PangoAttribute* attr) nothrow;
__gshared c_pango_attribute_as_intFn c_pango_attribute_as_int; ///
private alias c_pango_attribute_as_languageFn = extern(C) PangoAttrLanguage* function(PangoAttribute* attr) nothrow;
__gshared c_pango_attribute_as_languageFn c_pango_attribute_as_language; ///
private alias c_pango_attribute_as_shapeFn = extern(C) PangoAttrShape* function(PangoAttribute* attr) nothrow;
__gshared c_pango_attribute_as_shapeFn c_pango_attribute_as_shape; ///
private alias c_pango_attribute_as_sizeFn = extern(C) PangoAttrSize* function(PangoAttribute* attr) nothrow;
__gshared c_pango_attribute_as_sizeFn c_pango_attribute_as_size; ///
private alias c_pango_attribute_as_stringFn = extern(C) PangoAttrString* function(PangoAttribute* attr) nothrow;
__gshared c_pango_attribute_as_stringFn c_pango_attribute_as_string; ///
private alias c_pango_attribute_copyFn = extern(C) PangoAttribute* function(const(PangoAttribute)* attr) nothrow;
__gshared c_pango_attribute_copyFn c_pango_attribute_copy; ///
private alias c_pango_attribute_destroyFn = extern(C) void function(PangoAttribute* attr) nothrow;
__gshared c_pango_attribute_destroyFn c_pango_attribute_destroy; ///
private alias c_pango_attribute_equalFn = extern(C) gboolean function(const(PangoAttribute)* attr1, const(PangoAttribute)* attr2) nothrow;
__gshared c_pango_attribute_equalFn c_pango_attribute_equal; ///
private alias c_pango_attribute_initFn = extern(C) void function(PangoAttribute* attr, const(PangoAttrClass)* klass) nothrow;
__gshared c_pango_attribute_initFn c_pango_attribute_init; ///

// Color
private alias c_pango_color_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_color_get_typeFn c_pango_color_get_type; ///
private alias c_pango_color_copyFn = extern(C) PangoColor* function(const(PangoColor)* src) nothrow;
__gshared c_pango_color_copyFn c_pango_color_copy; ///
private alias c_pango_color_freeFn = extern(C) void function(PangoColor* color) nothrow;
__gshared c_pango_color_freeFn c_pango_color_free; ///
private alias c_pango_color_parseFn = extern(C) gboolean function(PangoColor* color, const(char)* spec) nothrow;
__gshared c_pango_color_parseFn c_pango_color_parse; ///
private alias c_pango_color_parse_with_alphaFn = extern(C) gboolean function(PangoColor* color, ushort* alpha, const(char)* spec) nothrow;
__gshared c_pango_color_parse_with_alphaFn c_pango_color_parse_with_alpha; ///
private alias c_pango_color_to_stringFn = extern(C) char* function(const(PangoColor)* color) nothrow;
__gshared c_pango_color_to_stringFn c_pango_color_to_string; ///

// Context
private alias c_pango_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_context_get_typeFn c_pango_context_get_type; ///
private alias c_pango_context_newFn = extern(C) PangoContext* function() nothrow;
__gshared c_pango_context_newFn c_pango_context_new; ///
private alias c_pango_context_changedFn = extern(C) void function(PangoContext* context) nothrow;
__gshared c_pango_context_changedFn c_pango_context_changed; ///
private alias c_pango_context_get_base_dirFn = extern(C) PangoDirection function(PangoContext* context) nothrow;
__gshared c_pango_context_get_base_dirFn c_pango_context_get_base_dir; ///
private alias c_pango_context_get_base_gravityFn = extern(C) PangoGravity function(PangoContext* context) nothrow;
__gshared c_pango_context_get_base_gravityFn c_pango_context_get_base_gravity; ///
private alias c_pango_context_get_font_descriptionFn = extern(C) PangoFontDescription* function(PangoContext* context) nothrow;
__gshared c_pango_context_get_font_descriptionFn c_pango_context_get_font_description; ///
private alias c_pango_context_get_font_mapFn = extern(C) PangoFontMap* function(PangoContext* context) nothrow;
__gshared c_pango_context_get_font_mapFn c_pango_context_get_font_map; ///
private alias c_pango_context_get_gravityFn = extern(C) PangoGravity function(PangoContext* context) nothrow;
__gshared c_pango_context_get_gravityFn c_pango_context_get_gravity; ///
private alias c_pango_context_get_gravity_hintFn = extern(C) PangoGravityHint function(PangoContext* context) nothrow;
__gshared c_pango_context_get_gravity_hintFn c_pango_context_get_gravity_hint; ///
private alias c_pango_context_get_languageFn = extern(C) PangoLanguage* function(PangoContext* context) nothrow;
__gshared c_pango_context_get_languageFn c_pango_context_get_language; ///
private alias c_pango_context_get_matrixFn = extern(C) const(PangoMatrix)* function(PangoContext* context) nothrow;
__gshared c_pango_context_get_matrixFn c_pango_context_get_matrix; ///
private alias c_pango_context_get_metricsFn = extern(C) PangoFontMetrics* function(PangoContext* context, const(PangoFontDescription)* desc, PangoLanguage* language) nothrow;
__gshared c_pango_context_get_metricsFn c_pango_context_get_metrics; ///
private alias c_pango_context_get_round_glyph_positionsFn = extern(C) gboolean function(PangoContext* context) nothrow;
__gshared c_pango_context_get_round_glyph_positionsFn c_pango_context_get_round_glyph_positions; ///
private alias c_pango_context_get_serialFn = extern(C) uint function(PangoContext* context) nothrow;
__gshared c_pango_context_get_serialFn c_pango_context_get_serial; ///
private alias c_pango_context_list_familiesFn = extern(C) void function(PangoContext* context, PangoFontFamily*** families, int* nFamilies) nothrow;
__gshared c_pango_context_list_familiesFn c_pango_context_list_families; ///
private alias c_pango_context_load_fontFn = extern(C) PangoFont* function(PangoContext* context, const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_context_load_fontFn c_pango_context_load_font; ///
private alias c_pango_context_load_fontsetFn = extern(C) PangoFontset* function(PangoContext* context, const(PangoFontDescription)* desc, PangoLanguage* language) nothrow;
__gshared c_pango_context_load_fontsetFn c_pango_context_load_fontset; ///
private alias c_pango_context_set_base_dirFn = extern(C) void function(PangoContext* context, PangoDirection direction) nothrow;
__gshared c_pango_context_set_base_dirFn c_pango_context_set_base_dir; ///
private alias c_pango_context_set_base_gravityFn = extern(C) void function(PangoContext* context, PangoGravity gravity) nothrow;
__gshared c_pango_context_set_base_gravityFn c_pango_context_set_base_gravity; ///
private alias c_pango_context_set_font_descriptionFn = extern(C) void function(PangoContext* context, const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_context_set_font_descriptionFn c_pango_context_set_font_description; ///
private alias c_pango_context_set_font_mapFn = extern(C) void function(PangoContext* context, PangoFontMap* fontMap) nothrow;
__gshared c_pango_context_set_font_mapFn c_pango_context_set_font_map; ///
private alias c_pango_context_set_gravity_hintFn = extern(C) void function(PangoContext* context, PangoGravityHint hint) nothrow;
__gshared c_pango_context_set_gravity_hintFn c_pango_context_set_gravity_hint; ///
private alias c_pango_context_set_languageFn = extern(C) void function(PangoContext* context, PangoLanguage* language) nothrow;
__gshared c_pango_context_set_languageFn c_pango_context_set_language; ///
private alias c_pango_context_set_matrixFn = extern(C) void function(PangoContext* context, const(PangoMatrix)* matrix) nothrow;
__gshared c_pango_context_set_matrixFn c_pango_context_set_matrix; ///
private alias c_pango_context_set_round_glyph_positionsFn = extern(C) void function(PangoContext* context, gboolean roundPositions) nothrow;
__gshared c_pango_context_set_round_glyph_positionsFn c_pango_context_set_round_glyph_positions; ///

// Coverage
private alias c_pango_coverage_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_coverage_get_typeFn c_pango_coverage_get_type; ///
private alias c_pango_coverage_newFn = extern(C) PangoCoverage* function() nothrow;
__gshared c_pango_coverage_newFn c_pango_coverage_new; ///
private alias c_pango_coverage_from_bytesFn = extern(C) PangoCoverage* function(ubyte* bytes, int nBytes) nothrow;
__gshared c_pango_coverage_from_bytesFn c_pango_coverage_from_bytes; ///
private alias c_pango_coverage_copyFn = extern(C) PangoCoverage* function(PangoCoverage* coverage) nothrow;
__gshared c_pango_coverage_copyFn c_pango_coverage_copy; ///
private alias c_pango_coverage_getFn = extern(C) PangoCoverageLevel function(PangoCoverage* coverage, int index) nothrow;
__gshared c_pango_coverage_getFn c_pango_coverage_get; ///
private alias c_pango_coverage_maxFn = extern(C) void function(PangoCoverage* coverage, PangoCoverage* other) nothrow;
__gshared c_pango_coverage_maxFn c_pango_coverage_max; ///
private alias c_pango_coverage_refFn = extern(C) PangoCoverage* function(PangoCoverage* coverage) nothrow;
__gshared c_pango_coverage_refFn c_pango_coverage_ref; ///
private alias c_pango_coverage_setFn = extern(C) void function(PangoCoverage* coverage, int index, PangoCoverageLevel level) nothrow;
__gshared c_pango_coverage_setFn c_pango_coverage_set; ///
private alias c_pango_coverage_to_bytesFn = extern(C) void function(PangoCoverage* coverage, ubyte** bytes, int* nBytes) nothrow;
__gshared c_pango_coverage_to_bytesFn c_pango_coverage_to_bytes; ///
private alias c_pango_coverage_unrefFn = extern(C) void function(PangoCoverage* coverage) nothrow;
__gshared c_pango_coverage_unrefFn c_pango_coverage_unref; ///

// Font
private alias c_pango_font_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_font_get_typeFn c_pango_font_get_type; ///
private alias c_pango_font_descriptions_freeFn = extern(C) void function(PangoFontDescription** descs, int nDescs) nothrow;
__gshared c_pango_font_descriptions_freeFn c_pango_font_descriptions_free; ///
private alias c_pango_font_deserializeFn = extern(C) PangoFont* function(PangoContext* context, GBytes* bytes, GError** _err) nothrow;
__gshared c_pango_font_deserializeFn c_pango_font_deserialize; ///
private alias c_pango_font_describeFn = extern(C) PangoFontDescription* function(PangoFont* font) nothrow;
__gshared c_pango_font_describeFn c_pango_font_describe; ///
private alias c_pango_font_describe_with_absolute_sizeFn = extern(C) PangoFontDescription* function(PangoFont* font) nothrow;
__gshared c_pango_font_describe_with_absolute_sizeFn c_pango_font_describe_with_absolute_size; ///
private alias c_pango_font_get_coverageFn = extern(C) PangoCoverage* function(PangoFont* font, PangoLanguage* language) nothrow;
__gshared c_pango_font_get_coverageFn c_pango_font_get_coverage; ///
private alias c_pango_font_get_faceFn = extern(C) PangoFontFace* function(PangoFont* font) nothrow;
__gshared c_pango_font_get_faceFn c_pango_font_get_face; ///
private alias c_pango_font_get_featuresFn = extern(C) void function(PangoFont* font, hb_feature_t* features, uint len, uint* numFeatures) nothrow;
__gshared c_pango_font_get_featuresFn c_pango_font_get_features; ///
private alias c_pango_font_get_font_mapFn = extern(C) PangoFontMap* function(PangoFont* font) nothrow;
__gshared c_pango_font_get_font_mapFn c_pango_font_get_font_map; ///
private alias c_pango_font_get_glyph_extentsFn = extern(C) void function(PangoFont* font, PangoGlyph glyph, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_font_get_glyph_extentsFn c_pango_font_get_glyph_extents; ///
private alias c_pango_font_get_hb_fontFn = extern(C) hb_font_t* function(PangoFont* font) nothrow;
__gshared c_pango_font_get_hb_fontFn c_pango_font_get_hb_font; ///
private alias c_pango_font_get_languagesFn = extern(C) PangoLanguage** function(PangoFont* font) nothrow;
__gshared c_pango_font_get_languagesFn c_pango_font_get_languages; ///
private alias c_pango_font_get_metricsFn = extern(C) PangoFontMetrics* function(PangoFont* font, PangoLanguage* language) nothrow;
__gshared c_pango_font_get_metricsFn c_pango_font_get_metrics; ///
private alias c_pango_font_has_charFn = extern(C) gboolean function(PangoFont* font, dchar wc) nothrow;
__gshared c_pango_font_has_charFn c_pango_font_has_char; ///
private alias c_pango_font_serializeFn = extern(C) GBytes* function(PangoFont* font) nothrow;
__gshared c_pango_font_serializeFn c_pango_font_serialize; ///

// FontDescription
private alias c_pango_font_description_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_font_description_get_typeFn c_pango_font_description_get_type; ///
private alias c_pango_font_description_newFn = extern(C) PangoFontDescription* function() nothrow;
__gshared c_pango_font_description_newFn c_pango_font_description_new; ///
private alias c_pango_font_description_better_matchFn = extern(C) gboolean function(const(PangoFontDescription)* desc, const(PangoFontDescription)* oldMatch, const(PangoFontDescription)* newMatch) nothrow;
__gshared c_pango_font_description_better_matchFn c_pango_font_description_better_match; ///
private alias c_pango_font_description_copyFn = extern(C) PangoFontDescription* function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_copyFn c_pango_font_description_copy; ///
private alias c_pango_font_description_copy_staticFn = extern(C) PangoFontDescription* function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_copy_staticFn c_pango_font_description_copy_static; ///
private alias c_pango_font_description_equalFn = extern(C) gboolean function(const(PangoFontDescription)* desc1, const(PangoFontDescription)* desc2) nothrow;
__gshared c_pango_font_description_equalFn c_pango_font_description_equal; ///
private alias c_pango_font_description_freeFn = extern(C) void function(PangoFontDescription* desc) nothrow;
__gshared c_pango_font_description_freeFn c_pango_font_description_free; ///
private alias c_pango_font_description_get_colorFn = extern(C) PangoFontColor function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_colorFn c_pango_font_description_get_color; ///
private alias c_pango_font_description_get_familyFn = extern(C) const(char)* function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_familyFn c_pango_font_description_get_family; ///
private alias c_pango_font_description_get_featuresFn = extern(C) const(char)* function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_featuresFn c_pango_font_description_get_features; ///
private alias c_pango_font_description_get_gravityFn = extern(C) PangoGravity function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_gravityFn c_pango_font_description_get_gravity; ///
private alias c_pango_font_description_get_set_fieldsFn = extern(C) PangoFontMask function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_set_fieldsFn c_pango_font_description_get_set_fields; ///
private alias c_pango_font_description_get_sizeFn = extern(C) int function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_sizeFn c_pango_font_description_get_size; ///
private alias c_pango_font_description_get_size_is_absoluteFn = extern(C) gboolean function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_size_is_absoluteFn c_pango_font_description_get_size_is_absolute; ///
private alias c_pango_font_description_get_stretchFn = extern(C) PangoStretch function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_stretchFn c_pango_font_description_get_stretch; ///
private alias c_pango_font_description_get_styleFn = extern(C) PangoStyle function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_styleFn c_pango_font_description_get_style; ///
private alias c_pango_font_description_get_variantFn = extern(C) PangoVariant function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_variantFn c_pango_font_description_get_variant; ///
private alias c_pango_font_description_get_variationsFn = extern(C) const(char)* function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_variationsFn c_pango_font_description_get_variations; ///
private alias c_pango_font_description_get_weightFn = extern(C) PangoWeight function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_get_weightFn c_pango_font_description_get_weight; ///
private alias c_pango_font_description_hashFn = extern(C) uint function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_hashFn c_pango_font_description_hash; ///
private alias c_pango_font_description_mergeFn = extern(C) void function(PangoFontDescription* desc, const(PangoFontDescription)* descToMerge, gboolean replaceExisting) nothrow;
__gshared c_pango_font_description_mergeFn c_pango_font_description_merge; ///
private alias c_pango_font_description_merge_staticFn = extern(C) void function(PangoFontDescription* desc, const(PangoFontDescription)* descToMerge, gboolean replaceExisting) nothrow;
__gshared c_pango_font_description_merge_staticFn c_pango_font_description_merge_static; ///
private alias c_pango_font_description_set_absolute_sizeFn = extern(C) void function(PangoFontDescription* desc, double size) nothrow;
__gshared c_pango_font_description_set_absolute_sizeFn c_pango_font_description_set_absolute_size; ///
private alias c_pango_font_description_set_colorFn = extern(C) void function(PangoFontDescription* desc, PangoFontColor color) nothrow;
__gshared c_pango_font_description_set_colorFn c_pango_font_description_set_color; ///
private alias c_pango_font_description_set_familyFn = extern(C) void function(PangoFontDescription* desc, const(char)* family) nothrow;
__gshared c_pango_font_description_set_familyFn c_pango_font_description_set_family; ///
private alias c_pango_font_description_set_family_staticFn = extern(C) void function(PangoFontDescription* desc, const(char)* family) nothrow;
__gshared c_pango_font_description_set_family_staticFn c_pango_font_description_set_family_static; ///
private alias c_pango_font_description_set_featuresFn = extern(C) void function(PangoFontDescription* desc, const(char)* features) nothrow;
__gshared c_pango_font_description_set_featuresFn c_pango_font_description_set_features; ///
private alias c_pango_font_description_set_features_staticFn = extern(C) void function(PangoFontDescription* desc, const(char)* features) nothrow;
__gshared c_pango_font_description_set_features_staticFn c_pango_font_description_set_features_static; ///
private alias c_pango_font_description_set_gravityFn = extern(C) void function(PangoFontDescription* desc, PangoGravity gravity) nothrow;
__gshared c_pango_font_description_set_gravityFn c_pango_font_description_set_gravity; ///
private alias c_pango_font_description_set_sizeFn = extern(C) void function(PangoFontDescription* desc, int size) nothrow;
__gshared c_pango_font_description_set_sizeFn c_pango_font_description_set_size; ///
private alias c_pango_font_description_set_stretchFn = extern(C) void function(PangoFontDescription* desc, PangoStretch stretch) nothrow;
__gshared c_pango_font_description_set_stretchFn c_pango_font_description_set_stretch; ///
private alias c_pango_font_description_set_styleFn = extern(C) void function(PangoFontDescription* desc, PangoStyle style) nothrow;
__gshared c_pango_font_description_set_styleFn c_pango_font_description_set_style; ///
private alias c_pango_font_description_set_variantFn = extern(C) void function(PangoFontDescription* desc, PangoVariant variant) nothrow;
__gshared c_pango_font_description_set_variantFn c_pango_font_description_set_variant; ///
private alias c_pango_font_description_set_variationsFn = extern(C) void function(PangoFontDescription* desc, const(char)* variations) nothrow;
__gshared c_pango_font_description_set_variationsFn c_pango_font_description_set_variations; ///
private alias c_pango_font_description_set_variations_staticFn = extern(C) void function(PangoFontDescription* desc, const(char)* variations) nothrow;
__gshared c_pango_font_description_set_variations_staticFn c_pango_font_description_set_variations_static; ///
private alias c_pango_font_description_set_weightFn = extern(C) void function(PangoFontDescription* desc, PangoWeight weight) nothrow;
__gshared c_pango_font_description_set_weightFn c_pango_font_description_set_weight; ///
private alias c_pango_font_description_to_filenameFn = extern(C) char* function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_to_filenameFn c_pango_font_description_to_filename; ///
private alias c_pango_font_description_to_stringFn = extern(C) char* function(const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_description_to_stringFn c_pango_font_description_to_string; ///
private alias c_pango_font_description_unset_fieldsFn = extern(C) void function(PangoFontDescription* desc, PangoFontMask toUnset) nothrow;
__gshared c_pango_font_description_unset_fieldsFn c_pango_font_description_unset_fields; ///
private alias c_pango_font_description_from_stringFn = extern(C) PangoFontDescription* function(const(char)* str) nothrow;
__gshared c_pango_font_description_from_stringFn c_pango_font_description_from_string; ///

// FontFace
private alias c_pango_font_face_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_font_face_get_typeFn c_pango_font_face_get_type; ///
private alias c_pango_font_face_describeFn = extern(C) PangoFontDescription* function(PangoFontFace* face) nothrow;
__gshared c_pango_font_face_describeFn c_pango_font_face_describe; ///
private alias c_pango_font_face_get_face_nameFn = extern(C) const(char)* function(PangoFontFace* face) nothrow;
__gshared c_pango_font_face_get_face_nameFn c_pango_font_face_get_face_name; ///
private alias c_pango_font_face_get_familyFn = extern(C) PangoFontFamily* function(PangoFontFace* face) nothrow;
__gshared c_pango_font_face_get_familyFn c_pango_font_face_get_family; ///
private alias c_pango_font_face_is_synthesizedFn = extern(C) gboolean function(PangoFontFace* face) nothrow;
__gshared c_pango_font_face_is_synthesizedFn c_pango_font_face_is_synthesized; ///
private alias c_pango_font_face_list_sizesFn = extern(C) void function(PangoFontFace* face, int** sizes, int* nSizes) nothrow;
__gshared c_pango_font_face_list_sizesFn c_pango_font_face_list_sizes; ///

// FontFamily
private alias c_pango_font_family_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_font_family_get_typeFn c_pango_font_family_get_type; ///
private alias c_pango_font_family_get_faceFn = extern(C) PangoFontFace* function(PangoFontFamily* family, const(char)* name) nothrow;
__gshared c_pango_font_family_get_faceFn c_pango_font_family_get_face; ///
private alias c_pango_font_family_get_nameFn = extern(C) const(char)* function(PangoFontFamily* family) nothrow;
__gshared c_pango_font_family_get_nameFn c_pango_font_family_get_name; ///
private alias c_pango_font_family_is_monospaceFn = extern(C) gboolean function(PangoFontFamily* family) nothrow;
__gshared c_pango_font_family_is_monospaceFn c_pango_font_family_is_monospace; ///
private alias c_pango_font_family_is_variableFn = extern(C) gboolean function(PangoFontFamily* family) nothrow;
__gshared c_pango_font_family_is_variableFn c_pango_font_family_is_variable; ///
private alias c_pango_font_family_list_facesFn = extern(C) void function(PangoFontFamily* family, PangoFontFace*** faces, int* nFaces) nothrow;
__gshared c_pango_font_family_list_facesFn c_pango_font_family_list_faces; ///

// FontMap
private alias c_pango_font_map_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_font_map_get_typeFn c_pango_font_map_get_type; ///
private alias c_pango_font_map_add_font_fileFn = extern(C) gboolean function(PangoFontMap* fontmap, const(char)* filename, GError** _err) nothrow;
__gshared c_pango_font_map_add_font_fileFn c_pango_font_map_add_font_file; ///
private alias c_pango_font_map_changedFn = extern(C) void function(PangoFontMap* fontmap) nothrow;
__gshared c_pango_font_map_changedFn c_pango_font_map_changed; ///
private alias c_pango_font_map_create_contextFn = extern(C) PangoContext* function(PangoFontMap* fontmap) nothrow;
__gshared c_pango_font_map_create_contextFn c_pango_font_map_create_context; ///
private alias c_pango_font_map_get_familyFn = extern(C) PangoFontFamily* function(PangoFontMap* fontmap, const(char)* name) nothrow;
__gshared c_pango_font_map_get_familyFn c_pango_font_map_get_family; ///
private alias c_pango_font_map_get_serialFn = extern(C) uint function(PangoFontMap* fontmap) nothrow;
__gshared c_pango_font_map_get_serialFn c_pango_font_map_get_serial; ///
private alias c_pango_font_map_list_familiesFn = extern(C) void function(PangoFontMap* fontmap, PangoFontFamily*** families, int* nFamilies) nothrow;
__gshared c_pango_font_map_list_familiesFn c_pango_font_map_list_families; ///
private alias c_pango_font_map_load_fontFn = extern(C) PangoFont* function(PangoFontMap* fontmap, PangoContext* context, const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_font_map_load_fontFn c_pango_font_map_load_font; ///
private alias c_pango_font_map_load_fontsetFn = extern(C) PangoFontset* function(PangoFontMap* fontmap, PangoContext* context, const(PangoFontDescription)* desc, PangoLanguage* language) nothrow;
__gshared c_pango_font_map_load_fontsetFn c_pango_font_map_load_fontset; ///
private alias c_pango_font_map_reload_fontFn = extern(C) PangoFont* function(PangoFontMap* fontmap, PangoFont* font, double scale, PangoContext* context, const(char)* variations) nothrow;
__gshared c_pango_font_map_reload_fontFn c_pango_font_map_reload_font; ///

// FontMetrics
private alias c_pango_font_metrics_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_font_metrics_get_typeFn c_pango_font_metrics_get_type; ///
private alias c_pango_font_metrics_get_approximate_char_widthFn = extern(C) int function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_get_approximate_char_widthFn c_pango_font_metrics_get_approximate_char_width; ///
private alias c_pango_font_metrics_get_approximate_digit_widthFn = extern(C) int function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_get_approximate_digit_widthFn c_pango_font_metrics_get_approximate_digit_width; ///
private alias c_pango_font_metrics_get_ascentFn = extern(C) int function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_get_ascentFn c_pango_font_metrics_get_ascent; ///
private alias c_pango_font_metrics_get_descentFn = extern(C) int function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_get_descentFn c_pango_font_metrics_get_descent; ///
private alias c_pango_font_metrics_get_heightFn = extern(C) int function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_get_heightFn c_pango_font_metrics_get_height; ///
private alias c_pango_font_metrics_get_strikethrough_positionFn = extern(C) int function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_get_strikethrough_positionFn c_pango_font_metrics_get_strikethrough_position; ///
private alias c_pango_font_metrics_get_strikethrough_thicknessFn = extern(C) int function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_get_strikethrough_thicknessFn c_pango_font_metrics_get_strikethrough_thickness; ///
private alias c_pango_font_metrics_get_underline_positionFn = extern(C) int function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_get_underline_positionFn c_pango_font_metrics_get_underline_position; ///
private alias c_pango_font_metrics_get_underline_thicknessFn = extern(C) int function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_get_underline_thicknessFn c_pango_font_metrics_get_underline_thickness; ///
private alias c_pango_font_metrics_refFn = extern(C) PangoFontMetrics* function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_refFn c_pango_font_metrics_ref; ///
private alias c_pango_font_metrics_unrefFn = extern(C) void function(PangoFontMetrics* metrics) nothrow;
__gshared c_pango_font_metrics_unrefFn c_pango_font_metrics_unref; ///

// Fontset
private alias c_pango_fontset_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_fontset_get_typeFn c_pango_fontset_get_type; ///
private alias c_pango_fontset_foreachFn = extern(C) void function(PangoFontset* fontset, PangoFontsetForeachFunc func, void* data) nothrow;
__gshared c_pango_fontset_foreachFn c_pango_fontset_foreach; ///
private alias c_pango_fontset_get_fontFn = extern(C) PangoFont* function(PangoFontset* fontset, uint wc) nothrow;
__gshared c_pango_fontset_get_fontFn c_pango_fontset_get_font; ///
private alias c_pango_fontset_get_metricsFn = extern(C) PangoFontMetrics* function(PangoFontset* fontset) nothrow;
__gshared c_pango_fontset_get_metricsFn c_pango_fontset_get_metrics; ///

// FontsetSimple
private alias c_pango_fontset_simple_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_fontset_simple_get_typeFn c_pango_fontset_simple_get_type; ///
private alias c_pango_fontset_simple_newFn = extern(C) PangoFontsetSimple* function(PangoLanguage* language) nothrow;
__gshared c_pango_fontset_simple_newFn c_pango_fontset_simple_new; ///
private alias c_pango_fontset_simple_appendFn = extern(C) void function(PangoFontsetSimple* fontset, PangoFont* font) nothrow;
__gshared c_pango_fontset_simple_appendFn c_pango_fontset_simple_append; ///
private alias c_pango_fontset_simple_sizeFn = extern(C) int function(PangoFontsetSimple* fontset) nothrow;
__gshared c_pango_fontset_simple_sizeFn c_pango_fontset_simple_size; ///

// GlyphItem
private alias c_pango_glyph_item_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_glyph_item_get_typeFn c_pango_glyph_item_get_type; ///
private alias c_pango_glyph_item_apply_attrsFn = extern(C) GSList* function(PangoGlyphItem* glyphItem, const(char)* text, PangoAttrList* list) nothrow;
__gshared c_pango_glyph_item_apply_attrsFn c_pango_glyph_item_apply_attrs; ///
private alias c_pango_glyph_item_copyFn = extern(C) PangoGlyphItem* function(PangoGlyphItem* orig) nothrow;
__gshared c_pango_glyph_item_copyFn c_pango_glyph_item_copy; ///
private alias c_pango_glyph_item_freeFn = extern(C) void function(PangoGlyphItem* glyphItem) nothrow;
__gshared c_pango_glyph_item_freeFn c_pango_glyph_item_free; ///
private alias c_pango_glyph_item_get_logical_widthsFn = extern(C) void function(PangoGlyphItem* glyphItem, const(char)* text, int* logicalWidths) nothrow;
__gshared c_pango_glyph_item_get_logical_widthsFn c_pango_glyph_item_get_logical_widths; ///
private alias c_pango_glyph_item_letter_spaceFn = extern(C) void function(PangoGlyphItem* glyphItem, const(char)* text, PangoLogAttr* logAttrs, int letterSpacing) nothrow;
__gshared c_pango_glyph_item_letter_spaceFn c_pango_glyph_item_letter_space; ///
private alias c_pango_glyph_item_splitFn = extern(C) PangoGlyphItem* function(PangoGlyphItem* orig, const(char)* text, int splitIndex) nothrow;
__gshared c_pango_glyph_item_splitFn c_pango_glyph_item_split; ///

// GlyphItemIter
private alias c_pango_glyph_item_iter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_glyph_item_iter_get_typeFn c_pango_glyph_item_iter_get_type; ///
private alias c_pango_glyph_item_iter_copyFn = extern(C) PangoGlyphItemIter* function(PangoGlyphItemIter* orig) nothrow;
__gshared c_pango_glyph_item_iter_copyFn c_pango_glyph_item_iter_copy; ///
private alias c_pango_glyph_item_iter_freeFn = extern(C) void function(PangoGlyphItemIter* iter) nothrow;
__gshared c_pango_glyph_item_iter_freeFn c_pango_glyph_item_iter_free; ///
private alias c_pango_glyph_item_iter_init_endFn = extern(C) gboolean function(PangoGlyphItemIter* iter, PangoGlyphItem* glyphItem, const(char)* text) nothrow;
__gshared c_pango_glyph_item_iter_init_endFn c_pango_glyph_item_iter_init_end; ///
private alias c_pango_glyph_item_iter_init_startFn = extern(C) gboolean function(PangoGlyphItemIter* iter, PangoGlyphItem* glyphItem, const(char)* text) nothrow;
__gshared c_pango_glyph_item_iter_init_startFn c_pango_glyph_item_iter_init_start; ///
private alias c_pango_glyph_item_iter_next_clusterFn = extern(C) gboolean function(PangoGlyphItemIter* iter) nothrow;
__gshared c_pango_glyph_item_iter_next_clusterFn c_pango_glyph_item_iter_next_cluster; ///
private alias c_pango_glyph_item_iter_prev_clusterFn = extern(C) gboolean function(PangoGlyphItemIter* iter) nothrow;
__gshared c_pango_glyph_item_iter_prev_clusterFn c_pango_glyph_item_iter_prev_cluster; ///

// GlyphString
private alias c_pango_glyph_string_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_glyph_string_get_typeFn c_pango_glyph_string_get_type; ///
private alias c_pango_glyph_string_newFn = extern(C) PangoGlyphString* function() nothrow;
__gshared c_pango_glyph_string_newFn c_pango_glyph_string_new; ///
private alias c_pango_glyph_string_copyFn = extern(C) PangoGlyphString* function(PangoGlyphString* string_) nothrow;
__gshared c_pango_glyph_string_copyFn c_pango_glyph_string_copy; ///
private alias c_pango_glyph_string_extentsFn = extern(C) void function(PangoGlyphString* glyphs, PangoFont* font, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_glyph_string_extentsFn c_pango_glyph_string_extents; ///
private alias c_pango_glyph_string_extents_rangeFn = extern(C) void function(PangoGlyphString* glyphs, int start, int end, PangoFont* font, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_glyph_string_extents_rangeFn c_pango_glyph_string_extents_range; ///
private alias c_pango_glyph_string_freeFn = extern(C) void function(PangoGlyphString* string_) nothrow;
__gshared c_pango_glyph_string_freeFn c_pango_glyph_string_free; ///
private alias c_pango_glyph_string_get_logical_widthsFn = extern(C) void function(PangoGlyphString* glyphs, const(char)* text, int length, int embeddingLevel, int* logicalWidths) nothrow;
__gshared c_pango_glyph_string_get_logical_widthsFn c_pango_glyph_string_get_logical_widths; ///
private alias c_pango_glyph_string_get_widthFn = extern(C) int function(PangoGlyphString* glyphs) nothrow;
__gshared c_pango_glyph_string_get_widthFn c_pango_glyph_string_get_width; ///
private alias c_pango_glyph_string_index_to_xFn = extern(C) void function(PangoGlyphString* glyphs, const(char)* text, int length, PangoAnalysis* analysis, int index, gboolean trailing, int* xPos) nothrow;
__gshared c_pango_glyph_string_index_to_xFn c_pango_glyph_string_index_to_x; ///
private alias c_pango_glyph_string_index_to_x_fullFn = extern(C) void function(PangoGlyphString* glyphs, const(char)* text, int length, PangoAnalysis* analysis, PangoLogAttr* attrs, int index, gboolean trailing, int* xPos) nothrow;
__gshared c_pango_glyph_string_index_to_x_fullFn c_pango_glyph_string_index_to_x_full; ///
private alias c_pango_glyph_string_set_sizeFn = extern(C) void function(PangoGlyphString* string_, int newLen) nothrow;
__gshared c_pango_glyph_string_set_sizeFn c_pango_glyph_string_set_size; ///
private alias c_pango_glyph_string_x_to_indexFn = extern(C) void function(PangoGlyphString* glyphs, const(char)* text, int length, PangoAnalysis* analysis, int xPos, int* index, int* trailing) nothrow;
__gshared c_pango_glyph_string_x_to_indexFn c_pango_glyph_string_x_to_index; ///

// Item
private alias c_pango_item_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_item_get_typeFn c_pango_item_get_type; ///
private alias c_pango_item_newFn = extern(C) PangoItem* function() nothrow;
__gshared c_pango_item_newFn c_pango_item_new; ///
private alias c_pango_item_apply_attrsFn = extern(C) void function(PangoItem* item, PangoAttrIterator* iter) nothrow;
__gshared c_pango_item_apply_attrsFn c_pango_item_apply_attrs; ///
private alias c_pango_item_copyFn = extern(C) PangoItem* function(PangoItem* item) nothrow;
__gshared c_pango_item_copyFn c_pango_item_copy; ///
private alias c_pango_item_freeFn = extern(C) void function(PangoItem* item) nothrow;
__gshared c_pango_item_freeFn c_pango_item_free; ///
private alias c_pango_item_get_char_offsetFn = extern(C) int function(PangoItem* item) nothrow;
__gshared c_pango_item_get_char_offsetFn c_pango_item_get_char_offset; ///
private alias c_pango_item_splitFn = extern(C) PangoItem* function(PangoItem* orig, int splitIndex, int splitOffset) nothrow;
__gshared c_pango_item_splitFn c_pango_item_split; ///

// Language
private alias c_pango_language_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_language_get_typeFn c_pango_language_get_type; ///
private alias c_pango_language_get_sample_stringFn = extern(C) const(char)* function(PangoLanguage* language) nothrow;
__gshared c_pango_language_get_sample_stringFn c_pango_language_get_sample_string; ///
private alias c_pango_language_get_scriptsFn = extern(C) const(PangoScript)* function(PangoLanguage* language, int* numScripts) nothrow;
__gshared c_pango_language_get_scriptsFn c_pango_language_get_scripts; ///
private alias c_pango_language_includes_scriptFn = extern(C) gboolean function(PangoLanguage* language, PangoScript script) nothrow;
__gshared c_pango_language_includes_scriptFn c_pango_language_includes_script; ///
private alias c_pango_language_matchesFn = extern(C) gboolean function(PangoLanguage* language, const(char)* rangeList) nothrow;
__gshared c_pango_language_matchesFn c_pango_language_matches; ///
private alias c_pango_language_to_stringFn = extern(C) const(char)* function(PangoLanguage* language) nothrow;
__gshared c_pango_language_to_stringFn c_pango_language_to_string; ///
private alias c_pango_language_from_stringFn = extern(C) PangoLanguage* function(const(char)* language) nothrow;
__gshared c_pango_language_from_stringFn c_pango_language_from_string; ///
private alias c_pango_language_get_defaultFn = extern(C) PangoLanguage* function() nothrow;
__gshared c_pango_language_get_defaultFn c_pango_language_get_default; ///
private alias c_pango_language_get_preferredFn = extern(C) PangoLanguage** function() nothrow;
__gshared c_pango_language_get_preferredFn c_pango_language_get_preferred; ///

// Layout
private alias c_pango_layout_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_layout_get_typeFn c_pango_layout_get_type; ///
private alias c_pango_layout_newFn = extern(C) PangoLayout* function(PangoContext* context) nothrow;
__gshared c_pango_layout_newFn c_pango_layout_new; ///
private alias c_pango_layout_deserializeFn = extern(C) PangoLayout* function(PangoContext* context, GBytes* bytes, PangoLayoutDeserializeFlags flags, GError** _err) nothrow;
__gshared c_pango_layout_deserializeFn c_pango_layout_deserialize; ///
private alias c_pango_layout_context_changedFn = extern(C) void function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_context_changedFn c_pango_layout_context_changed; ///
private alias c_pango_layout_copyFn = extern(C) PangoLayout* function(PangoLayout* src) nothrow;
__gshared c_pango_layout_copyFn c_pango_layout_copy; ///
private alias c_pango_layout_get_alignmentFn = extern(C) PangoAlignment function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_alignmentFn c_pango_layout_get_alignment; ///
private alias c_pango_layout_get_attributesFn = extern(C) PangoAttrList* function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_attributesFn c_pango_layout_get_attributes; ///
private alias c_pango_layout_get_auto_dirFn = extern(C) gboolean function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_auto_dirFn c_pango_layout_get_auto_dir; ///
private alias c_pango_layout_get_baselineFn = extern(C) int function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_baselineFn c_pango_layout_get_baseline; ///
private alias c_pango_layout_get_caret_posFn = extern(C) void function(PangoLayout* layout, int index, PangoRectangle* strongPos, PangoRectangle* weakPos) nothrow;
__gshared c_pango_layout_get_caret_posFn c_pango_layout_get_caret_pos; ///
private alias c_pango_layout_get_character_countFn = extern(C) int function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_character_countFn c_pango_layout_get_character_count; ///
private alias c_pango_layout_get_contextFn = extern(C) PangoContext* function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_contextFn c_pango_layout_get_context; ///
private alias c_pango_layout_get_cursor_posFn = extern(C) void function(PangoLayout* layout, int index, PangoRectangle* strongPos, PangoRectangle* weakPos) nothrow;
__gshared c_pango_layout_get_cursor_posFn c_pango_layout_get_cursor_pos; ///
private alias c_pango_layout_get_directionFn = extern(C) PangoDirection function(PangoLayout* layout, int index) nothrow;
__gshared c_pango_layout_get_directionFn c_pango_layout_get_direction; ///
private alias c_pango_layout_get_ellipsizeFn = extern(C) PangoEllipsizeMode function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_ellipsizeFn c_pango_layout_get_ellipsize; ///
private alias c_pango_layout_get_extentsFn = extern(C) void function(PangoLayout* layout, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_layout_get_extentsFn c_pango_layout_get_extents; ///
private alias c_pango_layout_get_font_descriptionFn = extern(C) const(PangoFontDescription)* function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_font_descriptionFn c_pango_layout_get_font_description; ///
private alias c_pango_layout_get_heightFn = extern(C) int function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_heightFn c_pango_layout_get_height; ///
private alias c_pango_layout_get_indentFn = extern(C) int function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_indentFn c_pango_layout_get_indent; ///
private alias c_pango_layout_get_iterFn = extern(C) PangoLayoutIter* function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_iterFn c_pango_layout_get_iter; ///
private alias c_pango_layout_get_justifyFn = extern(C) gboolean function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_justifyFn c_pango_layout_get_justify; ///
private alias c_pango_layout_get_justify_last_lineFn = extern(C) gboolean function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_justify_last_lineFn c_pango_layout_get_justify_last_line; ///
private alias c_pango_layout_get_lineFn = extern(C) PangoLayoutLine* function(PangoLayout* layout, int line) nothrow;
__gshared c_pango_layout_get_lineFn c_pango_layout_get_line; ///
private alias c_pango_layout_get_line_countFn = extern(C) int function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_line_countFn c_pango_layout_get_line_count; ///
private alias c_pango_layout_get_line_readonlyFn = extern(C) PangoLayoutLine* function(PangoLayout* layout, int line) nothrow;
__gshared c_pango_layout_get_line_readonlyFn c_pango_layout_get_line_readonly; ///
private alias c_pango_layout_get_line_spacingFn = extern(C) float function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_line_spacingFn c_pango_layout_get_line_spacing; ///
private alias c_pango_layout_get_linesFn = extern(C) GSList* function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_linesFn c_pango_layout_get_lines; ///
private alias c_pango_layout_get_lines_readonlyFn = extern(C) GSList* function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_lines_readonlyFn c_pango_layout_get_lines_readonly; ///
private alias c_pango_layout_get_log_attrsFn = extern(C) void function(PangoLayout* layout, PangoLogAttr** attrs, int* nAttrs) nothrow;
__gshared c_pango_layout_get_log_attrsFn c_pango_layout_get_log_attrs; ///
private alias c_pango_layout_get_log_attrs_readonlyFn = extern(C) const(PangoLogAttr)* function(PangoLayout* layout, int* nAttrs) nothrow;
__gshared c_pango_layout_get_log_attrs_readonlyFn c_pango_layout_get_log_attrs_readonly; ///
private alias c_pango_layout_get_pixel_extentsFn = extern(C) void function(PangoLayout* layout, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_layout_get_pixel_extentsFn c_pango_layout_get_pixel_extents; ///
private alias c_pango_layout_get_pixel_sizeFn = extern(C) void function(PangoLayout* layout, int* width, int* height) nothrow;
__gshared c_pango_layout_get_pixel_sizeFn c_pango_layout_get_pixel_size; ///
private alias c_pango_layout_get_serialFn = extern(C) uint function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_serialFn c_pango_layout_get_serial; ///
private alias c_pango_layout_get_single_paragraph_modeFn = extern(C) gboolean function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_single_paragraph_modeFn c_pango_layout_get_single_paragraph_mode; ///
private alias c_pango_layout_get_sizeFn = extern(C) void function(PangoLayout* layout, int* width, int* height) nothrow;
__gshared c_pango_layout_get_sizeFn c_pango_layout_get_size; ///
private alias c_pango_layout_get_spacingFn = extern(C) int function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_spacingFn c_pango_layout_get_spacing; ///
private alias c_pango_layout_get_tabsFn = extern(C) PangoTabArray* function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_tabsFn c_pango_layout_get_tabs; ///
private alias c_pango_layout_get_textFn = extern(C) const(char)* function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_textFn c_pango_layout_get_text; ///
private alias c_pango_layout_get_unknown_glyphs_countFn = extern(C) int function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_unknown_glyphs_countFn c_pango_layout_get_unknown_glyphs_count; ///
private alias c_pango_layout_get_widthFn = extern(C) int function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_widthFn c_pango_layout_get_width; ///
private alias c_pango_layout_get_wrapFn = extern(C) PangoWrapMode function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_get_wrapFn c_pango_layout_get_wrap; ///
private alias c_pango_layout_index_to_line_xFn = extern(C) void function(PangoLayout* layout, int index, gboolean trailing, int* line, int* xPos) nothrow;
__gshared c_pango_layout_index_to_line_xFn c_pango_layout_index_to_line_x; ///
private alias c_pango_layout_index_to_posFn = extern(C) void function(PangoLayout* layout, int index, PangoRectangle* pos) nothrow;
__gshared c_pango_layout_index_to_posFn c_pango_layout_index_to_pos; ///
private alias c_pango_layout_is_ellipsizedFn = extern(C) gboolean function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_is_ellipsizedFn c_pango_layout_is_ellipsized; ///
private alias c_pango_layout_is_wrappedFn = extern(C) gboolean function(PangoLayout* layout) nothrow;
__gshared c_pango_layout_is_wrappedFn c_pango_layout_is_wrapped; ///
private alias c_pango_layout_move_cursor_visuallyFn = extern(C) void function(PangoLayout* layout, gboolean strong, int oldIndex, int oldTrailing, int direction, int* newIndex, int* newTrailing) nothrow;
__gshared c_pango_layout_move_cursor_visuallyFn c_pango_layout_move_cursor_visually; ///
private alias c_pango_layout_serializeFn = extern(C) GBytes* function(PangoLayout* layout, PangoLayoutSerializeFlags flags) nothrow;
__gshared c_pango_layout_serializeFn c_pango_layout_serialize; ///
private alias c_pango_layout_set_alignmentFn = extern(C) void function(PangoLayout* layout, PangoAlignment alignment) nothrow;
__gshared c_pango_layout_set_alignmentFn c_pango_layout_set_alignment; ///
private alias c_pango_layout_set_attributesFn = extern(C) void function(PangoLayout* layout, PangoAttrList* attrs) nothrow;
__gshared c_pango_layout_set_attributesFn c_pango_layout_set_attributes; ///
private alias c_pango_layout_set_auto_dirFn = extern(C) void function(PangoLayout* layout, gboolean autoDir) nothrow;
__gshared c_pango_layout_set_auto_dirFn c_pango_layout_set_auto_dir; ///
private alias c_pango_layout_set_ellipsizeFn = extern(C) void function(PangoLayout* layout, PangoEllipsizeMode ellipsize) nothrow;
__gshared c_pango_layout_set_ellipsizeFn c_pango_layout_set_ellipsize; ///
private alias c_pango_layout_set_font_descriptionFn = extern(C) void function(PangoLayout* layout, const(PangoFontDescription)* desc) nothrow;
__gshared c_pango_layout_set_font_descriptionFn c_pango_layout_set_font_description; ///
private alias c_pango_layout_set_heightFn = extern(C) void function(PangoLayout* layout, int height) nothrow;
__gshared c_pango_layout_set_heightFn c_pango_layout_set_height; ///
private alias c_pango_layout_set_indentFn = extern(C) void function(PangoLayout* layout, int indent) nothrow;
__gshared c_pango_layout_set_indentFn c_pango_layout_set_indent; ///
private alias c_pango_layout_set_justifyFn = extern(C) void function(PangoLayout* layout, gboolean justify) nothrow;
__gshared c_pango_layout_set_justifyFn c_pango_layout_set_justify; ///
private alias c_pango_layout_set_justify_last_lineFn = extern(C) void function(PangoLayout* layout, gboolean justify) nothrow;
__gshared c_pango_layout_set_justify_last_lineFn c_pango_layout_set_justify_last_line; ///
private alias c_pango_layout_set_line_spacingFn = extern(C) void function(PangoLayout* layout, float factor) nothrow;
__gshared c_pango_layout_set_line_spacingFn c_pango_layout_set_line_spacing; ///
private alias c_pango_layout_set_markupFn = extern(C) void function(PangoLayout* layout, const(char)* markup, int length) nothrow;
__gshared c_pango_layout_set_markupFn c_pango_layout_set_markup; ///
private alias c_pango_layout_set_markup_with_accelFn = extern(C) void function(PangoLayout* layout, const(char)* markup, int length, dchar accelMarker, dchar* accelChar) nothrow;
__gshared c_pango_layout_set_markup_with_accelFn c_pango_layout_set_markup_with_accel; ///
private alias c_pango_layout_set_single_paragraph_modeFn = extern(C) void function(PangoLayout* layout, gboolean setting) nothrow;
__gshared c_pango_layout_set_single_paragraph_modeFn c_pango_layout_set_single_paragraph_mode; ///
private alias c_pango_layout_set_spacingFn = extern(C) void function(PangoLayout* layout, int spacing) nothrow;
__gshared c_pango_layout_set_spacingFn c_pango_layout_set_spacing; ///
private alias c_pango_layout_set_tabsFn = extern(C) void function(PangoLayout* layout, PangoTabArray* tabs) nothrow;
__gshared c_pango_layout_set_tabsFn c_pango_layout_set_tabs; ///
private alias c_pango_layout_set_textFn = extern(C) void function(PangoLayout* layout, char* text, int length) nothrow;
__gshared c_pango_layout_set_textFn c_pango_layout_set_text; ///
private alias c_pango_layout_set_widthFn = extern(C) void function(PangoLayout* layout, int width) nothrow;
__gshared c_pango_layout_set_widthFn c_pango_layout_set_width; ///
private alias c_pango_layout_set_wrapFn = extern(C) void function(PangoLayout* layout, PangoWrapMode wrap) nothrow;
__gshared c_pango_layout_set_wrapFn c_pango_layout_set_wrap; ///
private alias c_pango_layout_write_to_fileFn = extern(C) gboolean function(PangoLayout* layout, PangoLayoutSerializeFlags flags, const(char)* filename, GError** _err) nothrow;
__gshared c_pango_layout_write_to_fileFn c_pango_layout_write_to_file; ///
private alias c_pango_layout_xy_to_indexFn = extern(C) gboolean function(PangoLayout* layout, int x, int y, int* index, int* trailing) nothrow;
__gshared c_pango_layout_xy_to_indexFn c_pango_layout_xy_to_index; ///

// LayoutIter
private alias c_pango_layout_iter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_layout_iter_get_typeFn c_pango_layout_iter_get_type; ///
private alias c_pango_layout_iter_at_last_lineFn = extern(C) gboolean function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_at_last_lineFn c_pango_layout_iter_at_last_line; ///
private alias c_pango_layout_iter_copyFn = extern(C) PangoLayoutIter* function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_copyFn c_pango_layout_iter_copy; ///
private alias c_pango_layout_iter_freeFn = extern(C) void function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_freeFn c_pango_layout_iter_free; ///
private alias c_pango_layout_iter_get_baselineFn = extern(C) int function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_get_baselineFn c_pango_layout_iter_get_baseline; ///
private alias c_pango_layout_iter_get_char_extentsFn = extern(C) void function(PangoLayoutIter* iter, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_layout_iter_get_char_extentsFn c_pango_layout_iter_get_char_extents; ///
private alias c_pango_layout_iter_get_cluster_extentsFn = extern(C) void function(PangoLayoutIter* iter, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_layout_iter_get_cluster_extentsFn c_pango_layout_iter_get_cluster_extents; ///
private alias c_pango_layout_iter_get_indexFn = extern(C) int function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_get_indexFn c_pango_layout_iter_get_index; ///
private alias c_pango_layout_iter_get_layoutFn = extern(C) PangoLayout* function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_get_layoutFn c_pango_layout_iter_get_layout; ///
private alias c_pango_layout_iter_get_layout_extentsFn = extern(C) void function(PangoLayoutIter* iter, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_layout_iter_get_layout_extentsFn c_pango_layout_iter_get_layout_extents; ///
private alias c_pango_layout_iter_get_lineFn = extern(C) PangoLayoutLine* function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_get_lineFn c_pango_layout_iter_get_line; ///
private alias c_pango_layout_iter_get_line_extentsFn = extern(C) void function(PangoLayoutIter* iter, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_layout_iter_get_line_extentsFn c_pango_layout_iter_get_line_extents; ///
private alias c_pango_layout_iter_get_line_readonlyFn = extern(C) PangoLayoutLine* function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_get_line_readonlyFn c_pango_layout_iter_get_line_readonly; ///
private alias c_pango_layout_iter_get_line_yrangeFn = extern(C) void function(PangoLayoutIter* iter, int* y0, int* y1) nothrow;
__gshared c_pango_layout_iter_get_line_yrangeFn c_pango_layout_iter_get_line_yrange; ///
private alias c_pango_layout_iter_get_runFn = extern(C) PangoLayoutRun* function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_get_runFn c_pango_layout_iter_get_run; ///
private alias c_pango_layout_iter_get_run_baselineFn = extern(C) int function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_get_run_baselineFn c_pango_layout_iter_get_run_baseline; ///
private alias c_pango_layout_iter_get_run_extentsFn = extern(C) void function(PangoLayoutIter* iter, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_layout_iter_get_run_extentsFn c_pango_layout_iter_get_run_extents; ///
private alias c_pango_layout_iter_get_run_readonlyFn = extern(C) PangoLayoutRun* function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_get_run_readonlyFn c_pango_layout_iter_get_run_readonly; ///
private alias c_pango_layout_iter_next_charFn = extern(C) gboolean function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_next_charFn c_pango_layout_iter_next_char; ///
private alias c_pango_layout_iter_next_clusterFn = extern(C) gboolean function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_next_clusterFn c_pango_layout_iter_next_cluster; ///
private alias c_pango_layout_iter_next_lineFn = extern(C) gboolean function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_next_lineFn c_pango_layout_iter_next_line; ///
private alias c_pango_layout_iter_next_runFn = extern(C) gboolean function(PangoLayoutIter* iter) nothrow;
__gshared c_pango_layout_iter_next_runFn c_pango_layout_iter_next_run; ///

// LayoutLine
private alias c_pango_layout_line_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_layout_line_get_typeFn c_pango_layout_line_get_type; ///
private alias c_pango_layout_line_get_extentsFn = extern(C) void function(PangoLayoutLine* line, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_layout_line_get_extentsFn c_pango_layout_line_get_extents; ///
private alias c_pango_layout_line_get_heightFn = extern(C) void function(PangoLayoutLine* line, int* height) nothrow;
__gshared c_pango_layout_line_get_heightFn c_pango_layout_line_get_height; ///
private alias c_pango_layout_line_get_lengthFn = extern(C) int function(PangoLayoutLine* line) nothrow;
__gshared c_pango_layout_line_get_lengthFn c_pango_layout_line_get_length; ///
private alias c_pango_layout_line_get_pixel_extentsFn = extern(C) void function(PangoLayoutLine* layoutLine, PangoRectangle* inkRect, PangoRectangle* logicalRect) nothrow;
__gshared c_pango_layout_line_get_pixel_extentsFn c_pango_layout_line_get_pixel_extents; ///
private alias c_pango_layout_line_get_resolved_directionFn = extern(C) PangoDirection function(PangoLayoutLine* line) nothrow;
__gshared c_pango_layout_line_get_resolved_directionFn c_pango_layout_line_get_resolved_direction; ///
private alias c_pango_layout_line_get_start_indexFn = extern(C) int function(PangoLayoutLine* line) nothrow;
__gshared c_pango_layout_line_get_start_indexFn c_pango_layout_line_get_start_index; ///
private alias c_pango_layout_line_get_x_rangesFn = extern(C) void function(PangoLayoutLine* line, int startIndex, int endIndex, int** ranges, int* nRanges) nothrow;
__gshared c_pango_layout_line_get_x_rangesFn c_pango_layout_line_get_x_ranges; ///
private alias c_pango_layout_line_index_to_xFn = extern(C) void function(PangoLayoutLine* line, int index, gboolean trailing, int* xPos) nothrow;
__gshared c_pango_layout_line_index_to_xFn c_pango_layout_line_index_to_x; ///
private alias c_pango_layout_line_is_paragraph_startFn = extern(C) gboolean function(PangoLayoutLine* line) nothrow;
__gshared c_pango_layout_line_is_paragraph_startFn c_pango_layout_line_is_paragraph_start; ///
private alias c_pango_layout_line_refFn = extern(C) PangoLayoutLine* function(PangoLayoutLine* line) nothrow;
__gshared c_pango_layout_line_refFn c_pango_layout_line_ref; ///
private alias c_pango_layout_line_unrefFn = extern(C) void function(PangoLayoutLine* line) nothrow;
__gshared c_pango_layout_line_unrefFn c_pango_layout_line_unref; ///
private alias c_pango_layout_line_x_to_indexFn = extern(C) gboolean function(PangoLayoutLine* line, int xPos, int* index, int* trailing) nothrow;
__gshared c_pango_layout_line_x_to_indexFn c_pango_layout_line_x_to_index; ///

// Matrix
private alias c_pango_matrix_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_matrix_get_typeFn c_pango_matrix_get_type; ///
private alias c_pango_matrix_concatFn = extern(C) void function(PangoMatrix* matrix, const(PangoMatrix)* newMatrix) nothrow;
__gshared c_pango_matrix_concatFn c_pango_matrix_concat; ///
private alias c_pango_matrix_copyFn = extern(C) PangoMatrix* function(const(PangoMatrix)* matrix) nothrow;
__gshared c_pango_matrix_copyFn c_pango_matrix_copy; ///
private alias c_pango_matrix_freeFn = extern(C) void function(PangoMatrix* matrix) nothrow;
__gshared c_pango_matrix_freeFn c_pango_matrix_free; ///
private alias c_pango_matrix_get_font_scale_factorFn = extern(C) double function(const(PangoMatrix)* matrix) nothrow;
__gshared c_pango_matrix_get_font_scale_factorFn c_pango_matrix_get_font_scale_factor; ///
private alias c_pango_matrix_get_font_scale_factorsFn = extern(C) void function(const(PangoMatrix)* matrix, double* xscale, double* yscale) nothrow;
__gshared c_pango_matrix_get_font_scale_factorsFn c_pango_matrix_get_font_scale_factors; ///
private alias c_pango_matrix_get_slant_ratioFn = extern(C) double function(const(PangoMatrix)* matrix) nothrow;
__gshared c_pango_matrix_get_slant_ratioFn c_pango_matrix_get_slant_ratio; ///
private alias c_pango_matrix_rotateFn = extern(C) void function(PangoMatrix* matrix, double degrees) nothrow;
__gshared c_pango_matrix_rotateFn c_pango_matrix_rotate; ///
private alias c_pango_matrix_scaleFn = extern(C) void function(PangoMatrix* matrix, double scaleX, double scaleY) nothrow;
__gshared c_pango_matrix_scaleFn c_pango_matrix_scale; ///
private alias c_pango_matrix_transform_distanceFn = extern(C) void function(const(PangoMatrix)* matrix, double* dx, double* dy) nothrow;
__gshared c_pango_matrix_transform_distanceFn c_pango_matrix_transform_distance; ///
private alias c_pango_matrix_transform_pixel_rectangleFn = extern(C) void function(const(PangoMatrix)* matrix, PangoRectangle* rect) nothrow;
__gshared c_pango_matrix_transform_pixel_rectangleFn c_pango_matrix_transform_pixel_rectangle; ///
private alias c_pango_matrix_transform_pointFn = extern(C) void function(const(PangoMatrix)* matrix, double* x, double* y) nothrow;
__gshared c_pango_matrix_transform_pointFn c_pango_matrix_transform_point; ///
private alias c_pango_matrix_transform_rectangleFn = extern(C) void function(const(PangoMatrix)* matrix, PangoRectangle* rect) nothrow;
__gshared c_pango_matrix_transform_rectangleFn c_pango_matrix_transform_rectangle; ///
private alias c_pango_matrix_translateFn = extern(C) void function(PangoMatrix* matrix, double tx, double ty) nothrow;
__gshared c_pango_matrix_translateFn c_pango_matrix_translate; ///

// Renderer
private alias c_pango_renderer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_renderer_get_typeFn c_pango_renderer_get_type; ///
private alias c_pango_renderer_activateFn = extern(C) void function(PangoRenderer* renderer) nothrow;
__gshared c_pango_renderer_activateFn c_pango_renderer_activate; ///
private alias c_pango_renderer_deactivateFn = extern(C) void function(PangoRenderer* renderer) nothrow;
__gshared c_pango_renderer_deactivateFn c_pango_renderer_deactivate; ///
private alias c_pango_renderer_draw_error_underlineFn = extern(C) void function(PangoRenderer* renderer, int x, int y, int width, int height) nothrow;
__gshared c_pango_renderer_draw_error_underlineFn c_pango_renderer_draw_error_underline; ///
private alias c_pango_renderer_draw_glyphFn = extern(C) void function(PangoRenderer* renderer, PangoFont* font, PangoGlyph glyph, double x, double y) nothrow;
__gshared c_pango_renderer_draw_glyphFn c_pango_renderer_draw_glyph; ///
private alias c_pango_renderer_draw_glyph_itemFn = extern(C) void function(PangoRenderer* renderer, const(char)* text, PangoGlyphItem* glyphItem, int x, int y) nothrow;
__gshared c_pango_renderer_draw_glyph_itemFn c_pango_renderer_draw_glyph_item; ///
private alias c_pango_renderer_draw_glyphsFn = extern(C) void function(PangoRenderer* renderer, PangoFont* font, PangoGlyphString* glyphs, int x, int y) nothrow;
__gshared c_pango_renderer_draw_glyphsFn c_pango_renderer_draw_glyphs; ///
private alias c_pango_renderer_draw_layoutFn = extern(C) void function(PangoRenderer* renderer, PangoLayout* layout, int x, int y) nothrow;
__gshared c_pango_renderer_draw_layoutFn c_pango_renderer_draw_layout; ///
private alias c_pango_renderer_draw_layout_lineFn = extern(C) void function(PangoRenderer* renderer, PangoLayoutLine* line, int x, int y) nothrow;
__gshared c_pango_renderer_draw_layout_lineFn c_pango_renderer_draw_layout_line; ///
private alias c_pango_renderer_draw_rectangleFn = extern(C) void function(PangoRenderer* renderer, PangoRenderPart part, int x, int y, int width, int height) nothrow;
__gshared c_pango_renderer_draw_rectangleFn c_pango_renderer_draw_rectangle; ///
private alias c_pango_renderer_draw_trapezoidFn = extern(C) void function(PangoRenderer* renderer, PangoRenderPart part, double y1, double x11, double x21, double y2, double x12, double x22) nothrow;
__gshared c_pango_renderer_draw_trapezoidFn c_pango_renderer_draw_trapezoid; ///
private alias c_pango_renderer_get_alphaFn = extern(C) ushort function(PangoRenderer* renderer, PangoRenderPart part) nothrow;
__gshared c_pango_renderer_get_alphaFn c_pango_renderer_get_alpha; ///
private alias c_pango_renderer_get_colorFn = extern(C) PangoColor* function(PangoRenderer* renderer, PangoRenderPart part) nothrow;
__gshared c_pango_renderer_get_colorFn c_pango_renderer_get_color; ///
private alias c_pango_renderer_get_layoutFn = extern(C) PangoLayout* function(PangoRenderer* renderer) nothrow;
__gshared c_pango_renderer_get_layoutFn c_pango_renderer_get_layout; ///
private alias c_pango_renderer_get_layout_lineFn = extern(C) PangoLayoutLine* function(PangoRenderer* renderer) nothrow;
__gshared c_pango_renderer_get_layout_lineFn c_pango_renderer_get_layout_line; ///
private alias c_pango_renderer_get_matrixFn = extern(C) const(PangoMatrix)* function(PangoRenderer* renderer) nothrow;
__gshared c_pango_renderer_get_matrixFn c_pango_renderer_get_matrix; ///
private alias c_pango_renderer_part_changedFn = extern(C) void function(PangoRenderer* renderer, PangoRenderPart part) nothrow;
__gshared c_pango_renderer_part_changedFn c_pango_renderer_part_changed; ///
private alias c_pango_renderer_set_alphaFn = extern(C) void function(PangoRenderer* renderer, PangoRenderPart part, ushort alpha) nothrow;
__gshared c_pango_renderer_set_alphaFn c_pango_renderer_set_alpha; ///
private alias c_pango_renderer_set_colorFn = extern(C) void function(PangoRenderer* renderer, PangoRenderPart part, const(PangoColor)* color) nothrow;
__gshared c_pango_renderer_set_colorFn c_pango_renderer_set_color; ///
private alias c_pango_renderer_set_matrixFn = extern(C) void function(PangoRenderer* renderer, const(PangoMatrix)* matrix) nothrow;
__gshared c_pango_renderer_set_matrixFn c_pango_renderer_set_matrix; ///

// ScriptIter
private alias c_pango_script_iter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_script_iter_get_typeFn c_pango_script_iter_get_type; ///
private alias c_pango_script_iter_newFn = extern(C) PangoScriptIter* function(const(char)* text, int length) nothrow;
__gshared c_pango_script_iter_newFn c_pango_script_iter_new; ///
private alias c_pango_script_iter_freeFn = extern(C) void function(PangoScriptIter* iter) nothrow;
__gshared c_pango_script_iter_freeFn c_pango_script_iter_free; ///
private alias c_pango_script_iter_get_rangeFn = extern(C) void function(PangoScriptIter* iter, const(char*)* start, const(char*)* end, PangoScript* script) nothrow;
__gshared c_pango_script_iter_get_rangeFn c_pango_script_iter_get_range; ///
private alias c_pango_script_iter_nextFn = extern(C) gboolean function(PangoScriptIter* iter) nothrow;
__gshared c_pango_script_iter_nextFn c_pango_script_iter_next; ///

// TabArray
private alias c_pango_tab_array_get_typeFn = extern(C) GType function() nothrow;
__gshared c_pango_tab_array_get_typeFn c_pango_tab_array_get_type; ///
private alias c_pango_tab_array_newFn = extern(C) PangoTabArray* function(int initialSize, gboolean positionsInPixels) nothrow;
__gshared c_pango_tab_array_newFn c_pango_tab_array_new; ///
private alias c_pango_tab_array_new_with_positionsFn = extern(C) PangoTabArray* function(int size, gboolean positionsInPixels, PangoTabAlign firstAlignment, int firstPosition,  ...) nothrow;
__gshared c_pango_tab_array_new_with_positionsFn c_pango_tab_array_new_with_positions; ///
private alias c_pango_tab_array_copyFn = extern(C) PangoTabArray* function(PangoTabArray* src) nothrow;
__gshared c_pango_tab_array_copyFn c_pango_tab_array_copy; ///
private alias c_pango_tab_array_freeFn = extern(C) void function(PangoTabArray* tabArray) nothrow;
__gshared c_pango_tab_array_freeFn c_pango_tab_array_free; ///
private alias c_pango_tab_array_get_decimal_pointFn = extern(C) dchar function(PangoTabArray* tabArray, int tabIndex) nothrow;
__gshared c_pango_tab_array_get_decimal_pointFn c_pango_tab_array_get_decimal_point; ///
private alias c_pango_tab_array_get_positions_in_pixelsFn = extern(C) gboolean function(PangoTabArray* tabArray) nothrow;
__gshared c_pango_tab_array_get_positions_in_pixelsFn c_pango_tab_array_get_positions_in_pixels; ///
private alias c_pango_tab_array_get_sizeFn = extern(C) int function(PangoTabArray* tabArray) nothrow;
__gshared c_pango_tab_array_get_sizeFn c_pango_tab_array_get_size; ///
private alias c_pango_tab_array_get_tabFn = extern(C) void function(PangoTabArray* tabArray, int tabIndex, PangoTabAlign* alignment, int* location) nothrow;
__gshared c_pango_tab_array_get_tabFn c_pango_tab_array_get_tab; ///
private alias c_pango_tab_array_get_tabsFn = extern(C) void function(PangoTabArray* tabArray, PangoTabAlign** alignments, int** locations) nothrow;
__gshared c_pango_tab_array_get_tabsFn c_pango_tab_array_get_tabs; ///
private alias c_pango_tab_array_resizeFn = extern(C) void function(PangoTabArray* tabArray, int newSize) nothrow;
__gshared c_pango_tab_array_resizeFn c_pango_tab_array_resize; ///
private alias c_pango_tab_array_set_decimal_pointFn = extern(C) void function(PangoTabArray* tabArray, int tabIndex, dchar decimalPoint) nothrow;
__gshared c_pango_tab_array_set_decimal_pointFn c_pango_tab_array_set_decimal_point; ///
private alias c_pango_tab_array_set_positions_in_pixelsFn = extern(C) void function(PangoTabArray* tabArray, gboolean positionsInPixels) nothrow;
__gshared c_pango_tab_array_set_positions_in_pixelsFn c_pango_tab_array_set_positions_in_pixels; ///
private alias c_pango_tab_array_set_tabFn = extern(C) void function(PangoTabArray* tabArray, int tabIndex, PangoTabAlign alignment, int location) nothrow;
__gshared c_pango_tab_array_set_tabFn c_pango_tab_array_set_tab; ///
private alias c_pango_tab_array_sortFn = extern(C) void function(PangoTabArray* tabArray) nothrow;
__gshared c_pango_tab_array_sortFn c_pango_tab_array_sort; ///
private alias c_pango_tab_array_to_stringFn = extern(C) char* function(PangoTabArray* tabArray) nothrow;
__gshared c_pango_tab_array_to_stringFn c_pango_tab_array_to_string; ///
private alias c_pango_tab_array_from_stringFn = extern(C) PangoTabArray* function(const(char)* text) nothrow;
__gshared c_pango_tab_array_from_stringFn c_pango_tab_array_from_string; ///

// global
private alias c_pango_attr_allow_breaks_newFn = extern(C) PangoAttribute* function(gboolean allowBreaks) nothrow;
__gshared c_pango_attr_allow_breaks_newFn c_pango_attr_allow_breaks_new; ///
private alias c_pango_attr_background_alpha_newFn = extern(C) PangoAttribute* function(ushort alpha) nothrow;
__gshared c_pango_attr_background_alpha_newFn c_pango_attr_background_alpha_new; ///
private alias c_pango_attr_background_newFn = extern(C) PangoAttribute* function(ushort red, ushort green, ushort blue) nothrow;
__gshared c_pango_attr_background_newFn c_pango_attr_background_new; ///
private alias c_pango_attr_baseline_shift_newFn = extern(C) PangoAttribute* function(int shift) nothrow;
__gshared c_pango_attr_baseline_shift_newFn c_pango_attr_baseline_shift_new; ///
private alias c_pango_attr_breakFn = extern(C) void function(const(char)* text, int length, PangoAttrList* attrList, int offset, PangoLogAttr* attrs, int attrsLen) nothrow;
__gshared c_pango_attr_breakFn c_pango_attr_break; ///
private alias c_pango_attr_fallback_newFn = extern(C) PangoAttribute* function(gboolean enableFallback) nothrow;
__gshared c_pango_attr_fallback_newFn c_pango_attr_fallback_new; ///
private alias c_pango_attr_family_newFn = extern(C) PangoAttribute* function(const(char)* family) nothrow;
__gshared c_pango_attr_family_newFn c_pango_attr_family_new; ///
private alias c_pango_attr_font_scale_newFn = extern(C) PangoAttribute* function(PangoFontScale scale) nothrow;
__gshared c_pango_attr_font_scale_newFn c_pango_attr_font_scale_new; ///
private alias c_pango_attr_foreground_alpha_newFn = extern(C) PangoAttribute* function(ushort alpha) nothrow;
__gshared c_pango_attr_foreground_alpha_newFn c_pango_attr_foreground_alpha_new; ///
private alias c_pango_attr_foreground_newFn = extern(C) PangoAttribute* function(ushort red, ushort green, ushort blue) nothrow;
__gshared c_pango_attr_foreground_newFn c_pango_attr_foreground_new; ///
private alias c_pango_attr_gravity_hint_newFn = extern(C) PangoAttribute* function(PangoGravityHint hint) nothrow;
__gshared c_pango_attr_gravity_hint_newFn c_pango_attr_gravity_hint_new; ///
private alias c_pango_attr_gravity_newFn = extern(C) PangoAttribute* function(PangoGravity gravity) nothrow;
__gshared c_pango_attr_gravity_newFn c_pango_attr_gravity_new; ///
private alias c_pango_attr_insert_hyphens_newFn = extern(C) PangoAttribute* function(gboolean insertHyphens) nothrow;
__gshared c_pango_attr_insert_hyphens_newFn c_pango_attr_insert_hyphens_new; ///
private alias c_pango_attr_letter_spacing_newFn = extern(C) PangoAttribute* function(int letterSpacing) nothrow;
__gshared c_pango_attr_letter_spacing_newFn c_pango_attr_letter_spacing_new; ///
private alias c_pango_attr_line_height_newFn = extern(C) PangoAttribute* function(double factor) nothrow;
__gshared c_pango_attr_line_height_newFn c_pango_attr_line_height_new; ///
private alias c_pango_attr_line_height_new_absoluteFn = extern(C) PangoAttribute* function(int height) nothrow;
__gshared c_pango_attr_line_height_new_absoluteFn c_pango_attr_line_height_new_absolute; ///
private alias c_pango_attr_overline_color_newFn = extern(C) PangoAttribute* function(ushort red, ushort green, ushort blue) nothrow;
__gshared c_pango_attr_overline_color_newFn c_pango_attr_overline_color_new; ///
private alias c_pango_attr_overline_newFn = extern(C) PangoAttribute* function(PangoOverline overline) nothrow;
__gshared c_pango_attr_overline_newFn c_pango_attr_overline_new; ///
private alias c_pango_attr_rise_newFn = extern(C) PangoAttribute* function(int rise) nothrow;
__gshared c_pango_attr_rise_newFn c_pango_attr_rise_new; ///
private alias c_pango_attr_scale_newFn = extern(C) PangoAttribute* function(double scaleFactor) nothrow;
__gshared c_pango_attr_scale_newFn c_pango_attr_scale_new; ///
private alias c_pango_attr_sentence_newFn = extern(C) PangoAttribute* function() nothrow;
__gshared c_pango_attr_sentence_newFn c_pango_attr_sentence_new; ///
private alias c_pango_attr_show_newFn = extern(C) PangoAttribute* function(PangoShowFlags flags) nothrow;
__gshared c_pango_attr_show_newFn c_pango_attr_show_new; ///
private alias c_pango_attr_stretch_newFn = extern(C) PangoAttribute* function(PangoStretch stretch) nothrow;
__gshared c_pango_attr_stretch_newFn c_pango_attr_stretch_new; ///
private alias c_pango_attr_strikethrough_color_newFn = extern(C) PangoAttribute* function(ushort red, ushort green, ushort blue) nothrow;
__gshared c_pango_attr_strikethrough_color_newFn c_pango_attr_strikethrough_color_new; ///
private alias c_pango_attr_strikethrough_newFn = extern(C) PangoAttribute* function(gboolean strikethrough) nothrow;
__gshared c_pango_attr_strikethrough_newFn c_pango_attr_strikethrough_new; ///
private alias c_pango_attr_style_newFn = extern(C) PangoAttribute* function(PangoStyle style) nothrow;
__gshared c_pango_attr_style_newFn c_pango_attr_style_new; ///
private alias c_pango_attr_text_transform_newFn = extern(C) PangoAttribute* function(PangoTextTransform transform) nothrow;
__gshared c_pango_attr_text_transform_newFn c_pango_attr_text_transform_new; ///
private alias c_pango_attr_underline_color_newFn = extern(C) PangoAttribute* function(ushort red, ushort green, ushort blue) nothrow;
__gshared c_pango_attr_underline_color_newFn c_pango_attr_underline_color_new; ///
private alias c_pango_attr_underline_newFn = extern(C) PangoAttribute* function(PangoUnderline underline) nothrow;
__gshared c_pango_attr_underline_newFn c_pango_attr_underline_new; ///
private alias c_pango_attr_variant_newFn = extern(C) PangoAttribute* function(PangoVariant variant) nothrow;
__gshared c_pango_attr_variant_newFn c_pango_attr_variant_new; ///
private alias c_pango_attr_weight_newFn = extern(C) PangoAttribute* function(PangoWeight weight) nothrow;
__gshared c_pango_attr_weight_newFn c_pango_attr_weight_new; ///
private alias c_pango_attr_word_newFn = extern(C) PangoAttribute* function() nothrow;
__gshared c_pango_attr_word_newFn c_pango_attr_word_new; ///
private alias c_pango_breakFn = extern(C) void function(const(char)* text, int length, PangoAnalysis* analysis, PangoLogAttr* attrs, int attrsLen) nothrow;
__gshared c_pango_breakFn c_pango_break; ///
private alias c_pango_default_breakFn = extern(C) void function(const(char)* text, int length, PangoAnalysis* analysis, PangoLogAttr* attrs, int attrsLen) nothrow;
__gshared c_pango_default_breakFn c_pango_default_break; ///
private alias c_pango_extents_to_pixelsFn = extern(C) void function(PangoRectangle* inclusive, PangoRectangle* nearest) nothrow;
__gshared c_pango_extents_to_pixelsFn c_pango_extents_to_pixels; ///
private alias c_pango_find_base_dirFn = extern(C) PangoDirection function(const(char)* text, int length) nothrow;
__gshared c_pango_find_base_dirFn c_pango_find_base_dir; ///
private alias c_pango_find_paragraph_boundaryFn = extern(C) void function(const(char)* text, int length, int* paragraphDelimiterIndex, int* nextParagraphStart) nothrow;
__gshared c_pango_find_paragraph_boundaryFn c_pango_find_paragraph_boundary; ///
private alias c_pango_get_log_attrsFn = extern(C) void function(const(char)* text, int length, int level, PangoLanguage* language, PangoLogAttr* attrs, int attrsLen) nothrow;
__gshared c_pango_get_log_attrsFn c_pango_get_log_attrs; ///
private alias c_pango_get_mirror_charFn = extern(C) gboolean function(dchar ch, dchar* mirroredCh) nothrow;
__gshared c_pango_get_mirror_charFn c_pango_get_mirror_char; ///
private alias c_pango_is_zero_widthFn = extern(C) gboolean function(dchar ch) nothrow;
__gshared c_pango_is_zero_widthFn c_pango_is_zero_width; ///
private alias c_pango_itemizeFn = extern(C) GList* function(PangoContext* context, const(char)* text, int startIndex, int length, PangoAttrList* attrs, PangoAttrIterator* cachedIter) nothrow;
__gshared c_pango_itemizeFn c_pango_itemize; ///
private alias c_pango_itemize_with_base_dirFn = extern(C) GList* function(PangoContext* context, PangoDirection baseDir, const(char)* text, int startIndex, int length, PangoAttrList* attrs, PangoAttrIterator* cachedIter) nothrow;
__gshared c_pango_itemize_with_base_dirFn c_pango_itemize_with_base_dir; ///
private alias c_pango_log2vis_get_embedding_levelsFn = extern(C) ubyte* function(const(char)* text, int length, PangoDirection* pbaseDir) nothrow;
__gshared c_pango_log2vis_get_embedding_levelsFn c_pango_log2vis_get_embedding_levels; ///
private alias c_pango_markup_parser_finishFn = extern(C) gboolean function(GMarkupParseContext* context, PangoAttrList** attrList, char** text, dchar* accelChar, GError** _err) nothrow;
__gshared c_pango_markup_parser_finishFn c_pango_markup_parser_finish; ///
private alias c_pango_markup_parser_newFn = extern(C) GMarkupParseContext* function(dchar accelMarker) nothrow;
__gshared c_pango_markup_parser_newFn c_pango_markup_parser_new; ///
private alias c_pango_parse_enumFn = extern(C) gboolean function(GType type, const(char)* str, int* value, gboolean warn, char** possibleValues) nothrow;
__gshared c_pango_parse_enumFn c_pango_parse_enum; ///
private alias c_pango_parse_markupFn = extern(C) gboolean function(const(char)* markupText, int length, dchar accelMarker, PangoAttrList** attrList, char** text, dchar* accelChar, GError** _err) nothrow;
__gshared c_pango_parse_markupFn c_pango_parse_markup; ///
private alias c_pango_parse_stretchFn = extern(C) gboolean function(const(char)* str, PangoStretch* stretch, gboolean warn) nothrow;
__gshared c_pango_parse_stretchFn c_pango_parse_stretch; ///
private alias c_pango_parse_styleFn = extern(C) gboolean function(const(char)* str, PangoStyle* style, gboolean warn) nothrow;
__gshared c_pango_parse_styleFn c_pango_parse_style; ///
private alias c_pango_parse_variantFn = extern(C) gboolean function(const(char)* str, PangoVariant* variant, gboolean warn) nothrow;
__gshared c_pango_parse_variantFn c_pango_parse_variant; ///
private alias c_pango_parse_weightFn = extern(C) gboolean function(const(char)* str, PangoWeight* weight, gboolean warn) nothrow;
__gshared c_pango_parse_weightFn c_pango_parse_weight; ///
private alias c_pango_quantize_line_geometryFn = extern(C) void function(int* thickness, int* position) nothrow;
__gshared c_pango_quantize_line_geometryFn c_pango_quantize_line_geometry; ///
private alias c_pango_read_lineFn = extern(C) int function(void* stream, GString* str) nothrow;
__gshared c_pango_read_lineFn c_pango_read_line; ///
private alias c_pango_reorder_itemsFn = extern(C) GList* function(GList* items) nothrow;
__gshared c_pango_reorder_itemsFn c_pango_reorder_items; ///
private alias c_pango_scan_intFn = extern(C) gboolean function(const(char*)* pos, int* out_) nothrow;
__gshared c_pango_scan_intFn c_pango_scan_int; ///
private alias c_pango_scan_stringFn = extern(C) gboolean function(const(char*)* pos, GString* out_) nothrow;
__gshared c_pango_scan_stringFn c_pango_scan_string; ///
private alias c_pango_scan_wordFn = extern(C) gboolean function(const(char*)* pos, GString* out_) nothrow;
__gshared c_pango_scan_wordFn c_pango_scan_word; ///
private alias c_pango_shapeFn = extern(C) void function(const(char)* text, int length, const(PangoAnalysis)* analysis, PangoGlyphString* glyphs) nothrow;
__gshared c_pango_shapeFn c_pango_shape; ///
private alias c_pango_shape_fullFn = extern(C) void function(const(char)* itemText, int itemLength, const(char)* paragraphText, int paragraphLength, const(PangoAnalysis)* analysis, PangoGlyphString* glyphs) nothrow;
__gshared c_pango_shape_fullFn c_pango_shape_full; ///
private alias c_pango_shape_itemFn = extern(C) void function(PangoItem* item, const(char)* paragraphText, int paragraphLength, PangoLogAttr* logAttrs, PangoGlyphString* glyphs, PangoShapeFlags flags) nothrow;
__gshared c_pango_shape_itemFn c_pango_shape_item; ///
private alias c_pango_shape_with_flagsFn = extern(C) void function(const(char)* itemText, int itemLength, const(char)* paragraphText, int paragraphLength, const(PangoAnalysis)* analysis, PangoGlyphString* glyphs, PangoShapeFlags flags) nothrow;
__gshared c_pango_shape_with_flagsFn c_pango_shape_with_flags; ///
private alias c_pango_skip_spaceFn = extern(C) gboolean function(const(char*)* pos) nothrow;
__gshared c_pango_skip_spaceFn c_pango_skip_space; ///
private alias c_pango_split_file_listFn = extern(C) char** function(const(char)* str) nothrow;
__gshared c_pango_split_file_listFn c_pango_split_file_list; ///
private alias c_pango_tailor_breakFn = extern(C) void function(const(char)* text, int length, PangoAnalysis* analysis, int offset, PangoLogAttr* attrs, int attrsLen) nothrow;
__gshared c_pango_tailor_breakFn c_pango_tailor_break; ///
private alias c_pango_trim_stringFn = extern(C) char* function(const(char)* str) nothrow;
__gshared c_pango_trim_stringFn c_pango_trim_string; ///
private alias c_pango_unichar_directionFn = extern(C) PangoDirection function(dchar ch) nothrow;
__gshared c_pango_unichar_directionFn c_pango_unichar_direction; ///
private alias c_pango_units_from_doubleFn = extern(C) int function(double d) nothrow;
__gshared c_pango_units_from_doubleFn c_pango_units_from_double; ///
private alias c_pango_units_to_doubleFn = extern(C) double function(int i) nothrow;
__gshared c_pango_units_to_doubleFn c_pango_units_to_double; ///
private alias c_pango_versionFn = extern(C) int function() nothrow;
__gshared c_pango_versionFn c_pango_version; ///
private alias c_pango_version_checkFn = extern(C) const(char)* function(int requiredMajor, int requiredMinor, int requiredMicro) nothrow;
__gshared c_pango_version_checkFn c_pango_version_check; ///
private alias c_pango_version_stringFn = extern(C) const(char)* function() nothrow;
__gshared c_pango_version_stringFn c_pango_version_string; ///

// AttrType
private alias c_pango_attr_type_get_nameFn = extern(C) const(char)* function(PangoAttrType type) nothrow;
__gshared c_pango_attr_type_get_nameFn c_pango_attr_type_get_name; ///
private alias c_pango_attr_type_registerFn = extern(C) PangoAttrType function(const(char)* name) nothrow;
__gshared c_pango_attr_type_registerFn c_pango_attr_type_register; ///

// BidiType
private alias c_pango_bidi_type_for_unicharFn = extern(C) PangoBidiType function(dchar ch) nothrow;
__gshared c_pango_bidi_type_for_unicharFn c_pango_bidi_type_for_unichar; ///

// Gravity
private alias c_pango_gravity_get_for_matrixFn = extern(C) PangoGravity function(const(PangoMatrix)* matrix) nothrow;
__gshared c_pango_gravity_get_for_matrixFn c_pango_gravity_get_for_matrix; ///
private alias c_pango_gravity_get_for_scriptFn = extern(C) PangoGravity function(PangoScript script, PangoGravity baseGravity, PangoGravityHint hint) nothrow;
__gshared c_pango_gravity_get_for_scriptFn c_pango_gravity_get_for_script; ///
private alias c_pango_gravity_get_for_script_and_widthFn = extern(C) PangoGravity function(PangoScript script, gboolean wide, PangoGravity baseGravity, PangoGravityHint hint) nothrow;
__gshared c_pango_gravity_get_for_script_and_widthFn c_pango_gravity_get_for_script_and_width; ///
private alias c_pango_gravity_to_rotationFn = extern(C) double function(PangoGravity gravity) nothrow;
__gshared c_pango_gravity_to_rotationFn c_pango_gravity_to_rotation; ///

// LayoutDeserializeError
private alias c_pango_layout_deserialize_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_pango_layout_deserialize_error_quarkFn c_pango_layout_deserialize_error_quark; ///

// Script
private alias c_pango_script_for_unicharFn = extern(C) PangoScript function(dchar ch) nothrow;
__gshared c_pango_script_for_unicharFn c_pango_script_for_unichar; ///
private alias c_pango_script_get_sample_languageFn = extern(C) PangoLanguage* function(PangoScript script) nothrow;
__gshared c_pango_script_get_sample_languageFn c_pango_script_get_sample_language; ///

// AttrFontDesc

/** */
alias pango_attr_font_desc_new = c_pango_attr_font_desc_new;

// AttrFontFeatures

/** */
alias pango_attr_font_features_new = c_pango_attr_font_features_new;

// AttrIterator

/** */
alias pango_attr_iterator_get_type = c_pango_attr_iterator_get_type;

/** */
alias pango_attr_iterator_copy = c_pango_attr_iterator_copy;

/** */
alias pango_attr_iterator_destroy = c_pango_attr_iterator_destroy;

/** */
alias pango_attr_iterator_get = c_pango_attr_iterator_get;

/** */
alias pango_attr_iterator_get_attrs = c_pango_attr_iterator_get_attrs;

/** */
alias pango_attr_iterator_get_font = c_pango_attr_iterator_get_font;

/** */
alias pango_attr_iterator_next = c_pango_attr_iterator_next;

/** */
alias pango_attr_iterator_range = c_pango_attr_iterator_range;

// AttrLanguage

/** */
alias pango_attr_language_new = c_pango_attr_language_new;

// AttrList

/** */
alias pango_attr_list_get_type = c_pango_attr_list_get_type;

/** */
alias pango_attr_list_new = c_pango_attr_list_new;

/** */
alias pango_attr_list_change = c_pango_attr_list_change;

/** */
alias pango_attr_list_copy = c_pango_attr_list_copy;

/** */
alias pango_attr_list_equal = c_pango_attr_list_equal;

/** */
alias pango_attr_list_filter = c_pango_attr_list_filter;

/** */
alias pango_attr_list_get_attributes = c_pango_attr_list_get_attributes;

/** */
alias pango_attr_list_get_iterator = c_pango_attr_list_get_iterator;

/** */
alias pango_attr_list_insert = c_pango_attr_list_insert;

/** */
alias pango_attr_list_insert_before = c_pango_attr_list_insert_before;

/** */
alias pango_attr_list_ref = c_pango_attr_list_ref;

/** */
alias pango_attr_list_splice = c_pango_attr_list_splice;

/** */
alias pango_attr_list_to_string = c_pango_attr_list_to_string;

/** */
alias pango_attr_list_unref = c_pango_attr_list_unref;

/** */
alias pango_attr_list_update = c_pango_attr_list_update;

/** */
alias pango_attr_list_from_string = c_pango_attr_list_from_string;

// AttrShape

/** */
alias pango_attr_shape_new = c_pango_attr_shape_new;

/** */
alias pango_attr_shape_new_with_data = c_pango_attr_shape_new_with_data;

// AttrSize

/** */
alias pango_attr_size_new = c_pango_attr_size_new;

/** */
alias pango_attr_size_new_absolute = c_pango_attr_size_new_absolute;

// Attribute

/** */
alias pango_attribute_get_type = c_pango_attribute_get_type;

/** */
alias pango_attribute_as_color = c_pango_attribute_as_color;

/** */
alias pango_attribute_as_float = c_pango_attribute_as_float;

/** */
alias pango_attribute_as_font_desc = c_pango_attribute_as_font_desc;

/** */
alias pango_attribute_as_font_features = c_pango_attribute_as_font_features;

/** */
alias pango_attribute_as_int = c_pango_attribute_as_int;

/** */
alias pango_attribute_as_language = c_pango_attribute_as_language;

/** */
alias pango_attribute_as_shape = c_pango_attribute_as_shape;

/** */
alias pango_attribute_as_size = c_pango_attribute_as_size;

/** */
alias pango_attribute_as_string = c_pango_attribute_as_string;

/** */
alias pango_attribute_copy = c_pango_attribute_copy;

/** */
alias pango_attribute_destroy = c_pango_attribute_destroy;

/** */
alias pango_attribute_equal = c_pango_attribute_equal;

/** */
alias pango_attribute_init = c_pango_attribute_init;

// Color

/** */
alias pango_color_get_type = c_pango_color_get_type;

/** */
alias pango_color_copy = c_pango_color_copy;

/** */
alias pango_color_free = c_pango_color_free;

/** */
alias pango_color_parse = c_pango_color_parse;

/** */
alias pango_color_parse_with_alpha = c_pango_color_parse_with_alpha;

/** */
alias pango_color_to_string = c_pango_color_to_string;

// Context

/** */
alias pango_context_get_type = c_pango_context_get_type;

/** */
alias pango_context_new = c_pango_context_new;

/** */
alias pango_context_changed = c_pango_context_changed;

/** */
alias pango_context_get_base_dir = c_pango_context_get_base_dir;

/** */
alias pango_context_get_base_gravity = c_pango_context_get_base_gravity;

/** */
alias pango_context_get_font_description = c_pango_context_get_font_description;

/** */
alias pango_context_get_font_map = c_pango_context_get_font_map;

/** */
alias pango_context_get_gravity = c_pango_context_get_gravity;

/** */
alias pango_context_get_gravity_hint = c_pango_context_get_gravity_hint;

/** */
alias pango_context_get_language = c_pango_context_get_language;

/** */
alias pango_context_get_matrix = c_pango_context_get_matrix;

/** */
alias pango_context_get_metrics = c_pango_context_get_metrics;

/** */
alias pango_context_get_round_glyph_positions = c_pango_context_get_round_glyph_positions;

/** */
alias pango_context_get_serial = c_pango_context_get_serial;

/** */
alias pango_context_list_families = c_pango_context_list_families;

/** */
alias pango_context_load_font = c_pango_context_load_font;

/** */
alias pango_context_load_fontset = c_pango_context_load_fontset;

/** */
alias pango_context_set_base_dir = c_pango_context_set_base_dir;

/** */
alias pango_context_set_base_gravity = c_pango_context_set_base_gravity;

/** */
alias pango_context_set_font_description = c_pango_context_set_font_description;

/** */
alias pango_context_set_font_map = c_pango_context_set_font_map;

/** */
alias pango_context_set_gravity_hint = c_pango_context_set_gravity_hint;

/** */
alias pango_context_set_language = c_pango_context_set_language;

/** */
alias pango_context_set_matrix = c_pango_context_set_matrix;

/** */
alias pango_context_set_round_glyph_positions = c_pango_context_set_round_glyph_positions;

// Coverage

/** */
alias pango_coverage_get_type = c_pango_coverage_get_type;

/** */
alias pango_coverage_new = c_pango_coverage_new;

/** */
alias pango_coverage_from_bytes = c_pango_coverage_from_bytes;

/** */
alias pango_coverage_copy = c_pango_coverage_copy;

/** */
alias pango_coverage_get = c_pango_coverage_get;

/** */
alias pango_coverage_max = c_pango_coverage_max;

/** */
alias pango_coverage_ref = c_pango_coverage_ref;

/** */
alias pango_coverage_set = c_pango_coverage_set;

/** */
alias pango_coverage_to_bytes = c_pango_coverage_to_bytes;

/** */
alias pango_coverage_unref = c_pango_coverage_unref;

// Font

/** */
alias pango_font_get_type = c_pango_font_get_type;

/** */
alias pango_font_descriptions_free = c_pango_font_descriptions_free;

/** */
alias pango_font_deserialize = c_pango_font_deserialize;

/** */
alias pango_font_describe = c_pango_font_describe;

/** */
alias pango_font_describe_with_absolute_size = c_pango_font_describe_with_absolute_size;

/** */
alias pango_font_get_coverage = c_pango_font_get_coverage;

/** */
alias pango_font_get_face = c_pango_font_get_face;

/** */
alias pango_font_get_features = c_pango_font_get_features;

/** */
alias pango_font_get_font_map = c_pango_font_get_font_map;

/** */
alias pango_font_get_glyph_extents = c_pango_font_get_glyph_extents;

/** */
alias pango_font_get_hb_font = c_pango_font_get_hb_font;

/** */
alias pango_font_get_languages = c_pango_font_get_languages;

/** */
alias pango_font_get_metrics = c_pango_font_get_metrics;

/** */
alias pango_font_has_char = c_pango_font_has_char;

/** */
alias pango_font_serialize = c_pango_font_serialize;

// FontDescription

/** */
alias pango_font_description_get_type = c_pango_font_description_get_type;

/** */
alias pango_font_description_new = c_pango_font_description_new;

/** */
alias pango_font_description_better_match = c_pango_font_description_better_match;

/** */
alias pango_font_description_copy = c_pango_font_description_copy;

/** */
alias pango_font_description_copy_static = c_pango_font_description_copy_static;

/** */
alias pango_font_description_equal = c_pango_font_description_equal;

/** */
alias pango_font_description_free = c_pango_font_description_free;

/** */
alias pango_font_description_get_color = c_pango_font_description_get_color;

/** */
alias pango_font_description_get_family = c_pango_font_description_get_family;

/** */
alias pango_font_description_get_features = c_pango_font_description_get_features;

/** */
alias pango_font_description_get_gravity = c_pango_font_description_get_gravity;

/** */
alias pango_font_description_get_set_fields = c_pango_font_description_get_set_fields;

/** */
alias pango_font_description_get_size = c_pango_font_description_get_size;

/** */
alias pango_font_description_get_size_is_absolute = c_pango_font_description_get_size_is_absolute;

/** */
alias pango_font_description_get_stretch = c_pango_font_description_get_stretch;

/** */
alias pango_font_description_get_style = c_pango_font_description_get_style;

/** */
alias pango_font_description_get_variant = c_pango_font_description_get_variant;

/** */
alias pango_font_description_get_variations = c_pango_font_description_get_variations;

/** */
alias pango_font_description_get_weight = c_pango_font_description_get_weight;

/** */
alias pango_font_description_hash = c_pango_font_description_hash;

/** */
alias pango_font_description_merge = c_pango_font_description_merge;

/** */
alias pango_font_description_merge_static = c_pango_font_description_merge_static;

/** */
alias pango_font_description_set_absolute_size = c_pango_font_description_set_absolute_size;

/** */
alias pango_font_description_set_color = c_pango_font_description_set_color;

/** */
alias pango_font_description_set_family = c_pango_font_description_set_family;

/** */
alias pango_font_description_set_family_static = c_pango_font_description_set_family_static;

/** */
alias pango_font_description_set_features = c_pango_font_description_set_features;

/** */
alias pango_font_description_set_features_static = c_pango_font_description_set_features_static;

/** */
alias pango_font_description_set_gravity = c_pango_font_description_set_gravity;

/** */
alias pango_font_description_set_size = c_pango_font_description_set_size;

/** */
alias pango_font_description_set_stretch = c_pango_font_description_set_stretch;

/** */
alias pango_font_description_set_style = c_pango_font_description_set_style;

/** */
alias pango_font_description_set_variant = c_pango_font_description_set_variant;

/** */
alias pango_font_description_set_variations = c_pango_font_description_set_variations;

/** */
alias pango_font_description_set_variations_static = c_pango_font_description_set_variations_static;

/** */
alias pango_font_description_set_weight = c_pango_font_description_set_weight;

/** */
alias pango_font_description_to_filename = c_pango_font_description_to_filename;

/** */
alias pango_font_description_to_string = c_pango_font_description_to_string;

/** */
alias pango_font_description_unset_fields = c_pango_font_description_unset_fields;

/** */
alias pango_font_description_from_string = c_pango_font_description_from_string;

// FontFace

/** */
alias pango_font_face_get_type = c_pango_font_face_get_type;

/** */
alias pango_font_face_describe = c_pango_font_face_describe;

/** */
alias pango_font_face_get_face_name = c_pango_font_face_get_face_name;

/** */
alias pango_font_face_get_family = c_pango_font_face_get_family;

/** */
alias pango_font_face_is_synthesized = c_pango_font_face_is_synthesized;

/** */
alias pango_font_face_list_sizes = c_pango_font_face_list_sizes;

// FontFamily

/** */
alias pango_font_family_get_type = c_pango_font_family_get_type;

/** */
alias pango_font_family_get_face = c_pango_font_family_get_face;

/** */
alias pango_font_family_get_name = c_pango_font_family_get_name;

/** */
alias pango_font_family_is_monospace = c_pango_font_family_is_monospace;

/** */
alias pango_font_family_is_variable = c_pango_font_family_is_variable;

/** */
alias pango_font_family_list_faces = c_pango_font_family_list_faces;

// FontMap

/** */
alias pango_font_map_get_type = c_pango_font_map_get_type;

/** */
alias pango_font_map_add_font_file = c_pango_font_map_add_font_file;

/** */
alias pango_font_map_changed = c_pango_font_map_changed;

/** */
alias pango_font_map_create_context = c_pango_font_map_create_context;

/** */
alias pango_font_map_get_family = c_pango_font_map_get_family;

/** */
alias pango_font_map_get_serial = c_pango_font_map_get_serial;

/** */
alias pango_font_map_list_families = c_pango_font_map_list_families;

/** */
alias pango_font_map_load_font = c_pango_font_map_load_font;

/** */
alias pango_font_map_load_fontset = c_pango_font_map_load_fontset;

/** */
alias pango_font_map_reload_font = c_pango_font_map_reload_font;

// FontMetrics

/** */
alias pango_font_metrics_get_type = c_pango_font_metrics_get_type;

/** */
alias pango_font_metrics_get_approximate_char_width = c_pango_font_metrics_get_approximate_char_width;

/** */
alias pango_font_metrics_get_approximate_digit_width = c_pango_font_metrics_get_approximate_digit_width;

/** */
alias pango_font_metrics_get_ascent = c_pango_font_metrics_get_ascent;

/** */
alias pango_font_metrics_get_descent = c_pango_font_metrics_get_descent;

/** */
alias pango_font_metrics_get_height = c_pango_font_metrics_get_height;

/** */
alias pango_font_metrics_get_strikethrough_position = c_pango_font_metrics_get_strikethrough_position;

/** */
alias pango_font_metrics_get_strikethrough_thickness = c_pango_font_metrics_get_strikethrough_thickness;

/** */
alias pango_font_metrics_get_underline_position = c_pango_font_metrics_get_underline_position;

/** */
alias pango_font_metrics_get_underline_thickness = c_pango_font_metrics_get_underline_thickness;

/** */
alias pango_font_metrics_ref = c_pango_font_metrics_ref;

/** */
alias pango_font_metrics_unref = c_pango_font_metrics_unref;

// Fontset

/** */
alias pango_fontset_get_type = c_pango_fontset_get_type;

/** */
alias pango_fontset_foreach = c_pango_fontset_foreach;

/** */
alias pango_fontset_get_font = c_pango_fontset_get_font;

/** */
alias pango_fontset_get_metrics = c_pango_fontset_get_metrics;

// FontsetSimple

/** */
alias pango_fontset_simple_get_type = c_pango_fontset_simple_get_type;

/** */
alias pango_fontset_simple_new = c_pango_fontset_simple_new;

/** */
alias pango_fontset_simple_append = c_pango_fontset_simple_append;

/** */
alias pango_fontset_simple_size = c_pango_fontset_simple_size;

// GlyphItem

/** */
alias pango_glyph_item_get_type = c_pango_glyph_item_get_type;

/** */
alias pango_glyph_item_apply_attrs = c_pango_glyph_item_apply_attrs;

/** */
alias pango_glyph_item_copy = c_pango_glyph_item_copy;

/** */
alias pango_glyph_item_free = c_pango_glyph_item_free;

/** */
alias pango_glyph_item_get_logical_widths = c_pango_glyph_item_get_logical_widths;

/** */
alias pango_glyph_item_letter_space = c_pango_glyph_item_letter_space;

/** */
alias pango_glyph_item_split = c_pango_glyph_item_split;

// GlyphItemIter

/** */
alias pango_glyph_item_iter_get_type = c_pango_glyph_item_iter_get_type;

/** */
alias pango_glyph_item_iter_copy = c_pango_glyph_item_iter_copy;

/** */
alias pango_glyph_item_iter_free = c_pango_glyph_item_iter_free;

/** */
alias pango_glyph_item_iter_init_end = c_pango_glyph_item_iter_init_end;

/** */
alias pango_glyph_item_iter_init_start = c_pango_glyph_item_iter_init_start;

/** */
alias pango_glyph_item_iter_next_cluster = c_pango_glyph_item_iter_next_cluster;

/** */
alias pango_glyph_item_iter_prev_cluster = c_pango_glyph_item_iter_prev_cluster;

// GlyphString

/** */
alias pango_glyph_string_get_type = c_pango_glyph_string_get_type;

/** */
alias pango_glyph_string_new = c_pango_glyph_string_new;

/** */
alias pango_glyph_string_copy = c_pango_glyph_string_copy;

/** */
alias pango_glyph_string_extents = c_pango_glyph_string_extents;

/** */
alias pango_glyph_string_extents_range = c_pango_glyph_string_extents_range;

/** */
alias pango_glyph_string_free = c_pango_glyph_string_free;

/** */
alias pango_glyph_string_get_logical_widths = c_pango_glyph_string_get_logical_widths;

/** */
alias pango_glyph_string_get_width = c_pango_glyph_string_get_width;

/** */
alias pango_glyph_string_index_to_x = c_pango_glyph_string_index_to_x;

/** */
alias pango_glyph_string_index_to_x_full = c_pango_glyph_string_index_to_x_full;

/** */
alias pango_glyph_string_set_size = c_pango_glyph_string_set_size;

/** */
alias pango_glyph_string_x_to_index = c_pango_glyph_string_x_to_index;

// Item

/** */
alias pango_item_get_type = c_pango_item_get_type;

/** */
alias pango_item_new = c_pango_item_new;

/** */
alias pango_item_apply_attrs = c_pango_item_apply_attrs;

/** */
alias pango_item_copy = c_pango_item_copy;

/** */
alias pango_item_free = c_pango_item_free;

/** */
alias pango_item_get_char_offset = c_pango_item_get_char_offset;

/** */
alias pango_item_split = c_pango_item_split;

// Language

/** */
alias pango_language_get_type = c_pango_language_get_type;

/** */
alias pango_language_get_sample_string = c_pango_language_get_sample_string;

/** */
alias pango_language_get_scripts = c_pango_language_get_scripts;

/** */
alias pango_language_includes_script = c_pango_language_includes_script;

/** */
alias pango_language_matches = c_pango_language_matches;

/** */
alias pango_language_to_string = c_pango_language_to_string;

/** */
alias pango_language_from_string = c_pango_language_from_string;

/** */
alias pango_language_get_default = c_pango_language_get_default;

/** */
alias pango_language_get_preferred = c_pango_language_get_preferred;

// Layout

/** */
alias pango_layout_get_type = c_pango_layout_get_type;

/** */
alias pango_layout_new = c_pango_layout_new;

/** */
alias pango_layout_deserialize = c_pango_layout_deserialize;

/** */
alias pango_layout_context_changed = c_pango_layout_context_changed;

/** */
alias pango_layout_copy = c_pango_layout_copy;

/** */
alias pango_layout_get_alignment = c_pango_layout_get_alignment;

/** */
alias pango_layout_get_attributes = c_pango_layout_get_attributes;

/** */
alias pango_layout_get_auto_dir = c_pango_layout_get_auto_dir;

/** */
alias pango_layout_get_baseline = c_pango_layout_get_baseline;

/** */
alias pango_layout_get_caret_pos = c_pango_layout_get_caret_pos;

/** */
alias pango_layout_get_character_count = c_pango_layout_get_character_count;

/** */
alias pango_layout_get_context = c_pango_layout_get_context;

/** */
alias pango_layout_get_cursor_pos = c_pango_layout_get_cursor_pos;

/** */
alias pango_layout_get_direction = c_pango_layout_get_direction;

/** */
alias pango_layout_get_ellipsize = c_pango_layout_get_ellipsize;

/** */
alias pango_layout_get_extents = c_pango_layout_get_extents;

/** */
alias pango_layout_get_font_description = c_pango_layout_get_font_description;

/** */
alias pango_layout_get_height = c_pango_layout_get_height;

/** */
alias pango_layout_get_indent = c_pango_layout_get_indent;

/** */
alias pango_layout_get_iter = c_pango_layout_get_iter;

/** */
alias pango_layout_get_justify = c_pango_layout_get_justify;

/** */
alias pango_layout_get_justify_last_line = c_pango_layout_get_justify_last_line;

/** */
alias pango_layout_get_line = c_pango_layout_get_line;

/** */
alias pango_layout_get_line_count = c_pango_layout_get_line_count;

/** */
alias pango_layout_get_line_readonly = c_pango_layout_get_line_readonly;

/** */
alias pango_layout_get_line_spacing = c_pango_layout_get_line_spacing;

/** */
alias pango_layout_get_lines = c_pango_layout_get_lines;

/** */
alias pango_layout_get_lines_readonly = c_pango_layout_get_lines_readonly;

/** */
alias pango_layout_get_log_attrs = c_pango_layout_get_log_attrs;

/** */
alias pango_layout_get_log_attrs_readonly = c_pango_layout_get_log_attrs_readonly;

/** */
alias pango_layout_get_pixel_extents = c_pango_layout_get_pixel_extents;

/** */
alias pango_layout_get_pixel_size = c_pango_layout_get_pixel_size;

/** */
alias pango_layout_get_serial = c_pango_layout_get_serial;

/** */
alias pango_layout_get_single_paragraph_mode = c_pango_layout_get_single_paragraph_mode;

/** */
alias pango_layout_get_size = c_pango_layout_get_size;

/** */
alias pango_layout_get_spacing = c_pango_layout_get_spacing;

/** */
alias pango_layout_get_tabs = c_pango_layout_get_tabs;

/** */
alias pango_layout_get_text = c_pango_layout_get_text;

/** */
alias pango_layout_get_unknown_glyphs_count = c_pango_layout_get_unknown_glyphs_count;

/** */
alias pango_layout_get_width = c_pango_layout_get_width;

/** */
alias pango_layout_get_wrap = c_pango_layout_get_wrap;

/** */
alias pango_layout_index_to_line_x = c_pango_layout_index_to_line_x;

/** */
alias pango_layout_index_to_pos = c_pango_layout_index_to_pos;

/** */
alias pango_layout_is_ellipsized = c_pango_layout_is_ellipsized;

/** */
alias pango_layout_is_wrapped = c_pango_layout_is_wrapped;

/** */
alias pango_layout_move_cursor_visually = c_pango_layout_move_cursor_visually;

/** */
alias pango_layout_serialize = c_pango_layout_serialize;

/** */
alias pango_layout_set_alignment = c_pango_layout_set_alignment;

/** */
alias pango_layout_set_attributes = c_pango_layout_set_attributes;

/** */
alias pango_layout_set_auto_dir = c_pango_layout_set_auto_dir;

/** */
alias pango_layout_set_ellipsize = c_pango_layout_set_ellipsize;

/** */
alias pango_layout_set_font_description = c_pango_layout_set_font_description;

/** */
alias pango_layout_set_height = c_pango_layout_set_height;

/** */
alias pango_layout_set_indent = c_pango_layout_set_indent;

/** */
alias pango_layout_set_justify = c_pango_layout_set_justify;

/** */
alias pango_layout_set_justify_last_line = c_pango_layout_set_justify_last_line;

/** */
alias pango_layout_set_line_spacing = c_pango_layout_set_line_spacing;

/** */
alias pango_layout_set_markup = c_pango_layout_set_markup;

/** */
alias pango_layout_set_markup_with_accel = c_pango_layout_set_markup_with_accel;

/** */
alias pango_layout_set_single_paragraph_mode = c_pango_layout_set_single_paragraph_mode;

/** */
alias pango_layout_set_spacing = c_pango_layout_set_spacing;

/** */
alias pango_layout_set_tabs = c_pango_layout_set_tabs;

/** */
alias pango_layout_set_text = c_pango_layout_set_text;

/** */
alias pango_layout_set_width = c_pango_layout_set_width;

/** */
alias pango_layout_set_wrap = c_pango_layout_set_wrap;

/** */
alias pango_layout_write_to_file = c_pango_layout_write_to_file;

/** */
alias pango_layout_xy_to_index = c_pango_layout_xy_to_index;

// LayoutIter

/** */
alias pango_layout_iter_get_type = c_pango_layout_iter_get_type;

/** */
alias pango_layout_iter_at_last_line = c_pango_layout_iter_at_last_line;

/** */
alias pango_layout_iter_copy = c_pango_layout_iter_copy;

/** */
alias pango_layout_iter_free = c_pango_layout_iter_free;

/** */
alias pango_layout_iter_get_baseline = c_pango_layout_iter_get_baseline;

/** */
alias pango_layout_iter_get_char_extents = c_pango_layout_iter_get_char_extents;

/** */
alias pango_layout_iter_get_cluster_extents = c_pango_layout_iter_get_cluster_extents;

/** */
alias pango_layout_iter_get_index = c_pango_layout_iter_get_index;

/** */
alias pango_layout_iter_get_layout = c_pango_layout_iter_get_layout;

/** */
alias pango_layout_iter_get_layout_extents = c_pango_layout_iter_get_layout_extents;

/** */
alias pango_layout_iter_get_line = c_pango_layout_iter_get_line;

/** */
alias pango_layout_iter_get_line_extents = c_pango_layout_iter_get_line_extents;

/** */
alias pango_layout_iter_get_line_readonly = c_pango_layout_iter_get_line_readonly;

/** */
alias pango_layout_iter_get_line_yrange = c_pango_layout_iter_get_line_yrange;

/** */
alias pango_layout_iter_get_run = c_pango_layout_iter_get_run;

/** */
alias pango_layout_iter_get_run_baseline = c_pango_layout_iter_get_run_baseline;

/** */
alias pango_layout_iter_get_run_extents = c_pango_layout_iter_get_run_extents;

/** */
alias pango_layout_iter_get_run_readonly = c_pango_layout_iter_get_run_readonly;

/** */
alias pango_layout_iter_next_char = c_pango_layout_iter_next_char;

/** */
alias pango_layout_iter_next_cluster = c_pango_layout_iter_next_cluster;

/** */
alias pango_layout_iter_next_line = c_pango_layout_iter_next_line;

/** */
alias pango_layout_iter_next_run = c_pango_layout_iter_next_run;

// LayoutLine

/** */
alias pango_layout_line_get_type = c_pango_layout_line_get_type;

/** */
alias pango_layout_line_get_extents = c_pango_layout_line_get_extents;

/** */
alias pango_layout_line_get_height = c_pango_layout_line_get_height;

/** */
alias pango_layout_line_get_length = c_pango_layout_line_get_length;

/** */
alias pango_layout_line_get_pixel_extents = c_pango_layout_line_get_pixel_extents;

/** */
alias pango_layout_line_get_resolved_direction = c_pango_layout_line_get_resolved_direction;

/** */
alias pango_layout_line_get_start_index = c_pango_layout_line_get_start_index;

/** */
alias pango_layout_line_get_x_ranges = c_pango_layout_line_get_x_ranges;

/** */
alias pango_layout_line_index_to_x = c_pango_layout_line_index_to_x;

/** */
alias pango_layout_line_is_paragraph_start = c_pango_layout_line_is_paragraph_start;

/** */
alias pango_layout_line_ref = c_pango_layout_line_ref;

/** */
alias pango_layout_line_unref = c_pango_layout_line_unref;

/** */
alias pango_layout_line_x_to_index = c_pango_layout_line_x_to_index;

// Matrix

/** */
alias pango_matrix_get_type = c_pango_matrix_get_type;

/** */
alias pango_matrix_concat = c_pango_matrix_concat;

/** */
alias pango_matrix_copy = c_pango_matrix_copy;

/** */
alias pango_matrix_free = c_pango_matrix_free;

/** */
alias pango_matrix_get_font_scale_factor = c_pango_matrix_get_font_scale_factor;

/** */
alias pango_matrix_get_font_scale_factors = c_pango_matrix_get_font_scale_factors;

/** */
alias pango_matrix_get_slant_ratio = c_pango_matrix_get_slant_ratio;

/** */
alias pango_matrix_rotate = c_pango_matrix_rotate;

/** */
alias pango_matrix_scale = c_pango_matrix_scale;

/** */
alias pango_matrix_transform_distance = c_pango_matrix_transform_distance;

/** */
alias pango_matrix_transform_pixel_rectangle = c_pango_matrix_transform_pixel_rectangle;

/** */
alias pango_matrix_transform_point = c_pango_matrix_transform_point;

/** */
alias pango_matrix_transform_rectangle = c_pango_matrix_transform_rectangle;

/** */
alias pango_matrix_translate = c_pango_matrix_translate;

// Renderer

/** */
alias pango_renderer_get_type = c_pango_renderer_get_type;

/** */
alias pango_renderer_activate = c_pango_renderer_activate;

/** */
alias pango_renderer_deactivate = c_pango_renderer_deactivate;

/** */
alias pango_renderer_draw_error_underline = c_pango_renderer_draw_error_underline;

/** */
alias pango_renderer_draw_glyph = c_pango_renderer_draw_glyph;

/** */
alias pango_renderer_draw_glyph_item = c_pango_renderer_draw_glyph_item;

/** */
alias pango_renderer_draw_glyphs = c_pango_renderer_draw_glyphs;

/** */
alias pango_renderer_draw_layout = c_pango_renderer_draw_layout;

/** */
alias pango_renderer_draw_layout_line = c_pango_renderer_draw_layout_line;

/** */
alias pango_renderer_draw_rectangle = c_pango_renderer_draw_rectangle;

/** */
alias pango_renderer_draw_trapezoid = c_pango_renderer_draw_trapezoid;

/** */
alias pango_renderer_get_alpha = c_pango_renderer_get_alpha;

/** */
alias pango_renderer_get_color = c_pango_renderer_get_color;

/** */
alias pango_renderer_get_layout = c_pango_renderer_get_layout;

/** */
alias pango_renderer_get_layout_line = c_pango_renderer_get_layout_line;

/** */
alias pango_renderer_get_matrix = c_pango_renderer_get_matrix;

/** */
alias pango_renderer_part_changed = c_pango_renderer_part_changed;

/** */
alias pango_renderer_set_alpha = c_pango_renderer_set_alpha;

/** */
alias pango_renderer_set_color = c_pango_renderer_set_color;

/** */
alias pango_renderer_set_matrix = c_pango_renderer_set_matrix;

// ScriptIter

/** */
alias pango_script_iter_get_type = c_pango_script_iter_get_type;

/** */
alias pango_script_iter_new = c_pango_script_iter_new;

/** */
alias pango_script_iter_free = c_pango_script_iter_free;

/** */
alias pango_script_iter_get_range = c_pango_script_iter_get_range;

/** */
alias pango_script_iter_next = c_pango_script_iter_next;

// TabArray

/** */
alias pango_tab_array_get_type = c_pango_tab_array_get_type;

/** */
alias pango_tab_array_new = c_pango_tab_array_new;

/** */
alias pango_tab_array_new_with_positions = c_pango_tab_array_new_with_positions;

/** */
alias pango_tab_array_copy = c_pango_tab_array_copy;

/** */
alias pango_tab_array_free = c_pango_tab_array_free;

/** */
alias pango_tab_array_get_decimal_point = c_pango_tab_array_get_decimal_point;

/** */
alias pango_tab_array_get_positions_in_pixels = c_pango_tab_array_get_positions_in_pixels;

/** */
alias pango_tab_array_get_size = c_pango_tab_array_get_size;

/** */
alias pango_tab_array_get_tab = c_pango_tab_array_get_tab;

/** */
alias pango_tab_array_get_tabs = c_pango_tab_array_get_tabs;

/** */
alias pango_tab_array_resize = c_pango_tab_array_resize;

/** */
alias pango_tab_array_set_decimal_point = c_pango_tab_array_set_decimal_point;

/** */
alias pango_tab_array_set_positions_in_pixels = c_pango_tab_array_set_positions_in_pixels;

/** */
alias pango_tab_array_set_tab = c_pango_tab_array_set_tab;

/** */
alias pango_tab_array_sort = c_pango_tab_array_sort;

/** */
alias pango_tab_array_to_string = c_pango_tab_array_to_string;

/** */
alias pango_tab_array_from_string = c_pango_tab_array_from_string;

// global

/** */
alias pango_attr_allow_breaks_new = c_pango_attr_allow_breaks_new;

/** */
alias pango_attr_background_alpha_new = c_pango_attr_background_alpha_new;

/** */
alias pango_attr_background_new = c_pango_attr_background_new;

/** */
alias pango_attr_baseline_shift_new = c_pango_attr_baseline_shift_new;

/** */
alias pango_attr_break = c_pango_attr_break;

/** */
alias pango_attr_fallback_new = c_pango_attr_fallback_new;

/** */
alias pango_attr_family_new = c_pango_attr_family_new;

/** */
alias pango_attr_font_scale_new = c_pango_attr_font_scale_new;

/** */
alias pango_attr_foreground_alpha_new = c_pango_attr_foreground_alpha_new;

/** */
alias pango_attr_foreground_new = c_pango_attr_foreground_new;

/** */
alias pango_attr_gravity_hint_new = c_pango_attr_gravity_hint_new;

/** */
alias pango_attr_gravity_new = c_pango_attr_gravity_new;

/** */
alias pango_attr_insert_hyphens_new = c_pango_attr_insert_hyphens_new;

/** */
alias pango_attr_letter_spacing_new = c_pango_attr_letter_spacing_new;

/** */
alias pango_attr_line_height_new = c_pango_attr_line_height_new;

/** */
alias pango_attr_line_height_new_absolute = c_pango_attr_line_height_new_absolute;

/** */
alias pango_attr_overline_color_new = c_pango_attr_overline_color_new;

/** */
alias pango_attr_overline_new = c_pango_attr_overline_new;

/** */
alias pango_attr_rise_new = c_pango_attr_rise_new;

/** */
alias pango_attr_scale_new = c_pango_attr_scale_new;

/** */
alias pango_attr_sentence_new = c_pango_attr_sentence_new;

/** */
alias pango_attr_show_new = c_pango_attr_show_new;

/** */
alias pango_attr_stretch_new = c_pango_attr_stretch_new;

/** */
alias pango_attr_strikethrough_color_new = c_pango_attr_strikethrough_color_new;

/** */
alias pango_attr_strikethrough_new = c_pango_attr_strikethrough_new;

/** */
alias pango_attr_style_new = c_pango_attr_style_new;

/** */
alias pango_attr_text_transform_new = c_pango_attr_text_transform_new;

/** */
alias pango_attr_underline_color_new = c_pango_attr_underline_color_new;

/** */
alias pango_attr_underline_new = c_pango_attr_underline_new;

/** */
alias pango_attr_variant_new = c_pango_attr_variant_new;

/** */
alias pango_attr_weight_new = c_pango_attr_weight_new;

/** */
alias pango_attr_word_new = c_pango_attr_word_new;

/** */
alias pango_break = c_pango_break;

/** */
alias pango_default_break = c_pango_default_break;

/** */
alias pango_extents_to_pixels = c_pango_extents_to_pixels;

/** */
alias pango_find_base_dir = c_pango_find_base_dir;

/** */
alias pango_find_paragraph_boundary = c_pango_find_paragraph_boundary;

/** */
alias pango_get_log_attrs = c_pango_get_log_attrs;

/** */
alias pango_get_mirror_char = c_pango_get_mirror_char;

/** */
alias pango_is_zero_width = c_pango_is_zero_width;

/** */
alias pango_itemize = c_pango_itemize;

/** */
alias pango_itemize_with_base_dir = c_pango_itemize_with_base_dir;

/** */
alias pango_log2vis_get_embedding_levels = c_pango_log2vis_get_embedding_levels;

/** */
alias pango_markup_parser_finish = c_pango_markup_parser_finish;

/** */
alias pango_markup_parser_new = c_pango_markup_parser_new;

/** */
alias pango_parse_enum = c_pango_parse_enum;

/** */
alias pango_parse_markup = c_pango_parse_markup;

/** */
alias pango_parse_stretch = c_pango_parse_stretch;

/** */
alias pango_parse_style = c_pango_parse_style;

/** */
alias pango_parse_variant = c_pango_parse_variant;

/** */
alias pango_parse_weight = c_pango_parse_weight;

/** */
alias pango_quantize_line_geometry = c_pango_quantize_line_geometry;

/** */
alias pango_read_line = c_pango_read_line;

/** */
alias pango_reorder_items = c_pango_reorder_items;

/** */
alias pango_scan_int = c_pango_scan_int;

/** */
alias pango_scan_string = c_pango_scan_string;

/** */
alias pango_scan_word = c_pango_scan_word;

/** */
alias pango_shape = c_pango_shape;

/** */
alias pango_shape_full = c_pango_shape_full;

/** */
alias pango_shape_item = c_pango_shape_item;

/** */
alias pango_shape_with_flags = c_pango_shape_with_flags;

/** */
alias pango_skip_space = c_pango_skip_space;

/** */
alias pango_split_file_list = c_pango_split_file_list;

/** */
alias pango_tailor_break = c_pango_tailor_break;

/** */
alias pango_trim_string = c_pango_trim_string;

/** */
alias pango_unichar_direction = c_pango_unichar_direction;

/** */
alias pango_units_from_double = c_pango_units_from_double;

/** */
alias pango_units_to_double = c_pango_units_to_double;

/** */
alias pango_version = c_pango_version;

/** */
alias pango_version_check = c_pango_version_check;

/** */
alias pango_version_string = c_pango_version_string;

// AttrType

/** */
alias pango_attr_type_get_name = c_pango_attr_type_get_name;

/** */
alias pango_attr_type_register = c_pango_attr_type_register;

// BidiType

/** */
alias pango_bidi_type_for_unichar = c_pango_bidi_type_for_unichar;

// Gravity

/** */
alias pango_gravity_get_for_matrix = c_pango_gravity_get_for_matrix;

/** */
alias pango_gravity_get_for_script = c_pango_gravity_get_for_script;

/** */
alias pango_gravity_get_for_script_and_width = c_pango_gravity_get_for_script_and_width;

/** */
alias pango_gravity_to_rotation = c_pango_gravity_to_rotation;

// LayoutDeserializeError

/** */
alias pango_layout_deserialize_error_quark = c_pango_layout_deserialize_error_quark;

// Script

/** */
alias pango_script_for_unichar = c_pango_script_for_unichar;

/** */
alias pango_script_get_sample_language = c_pango_script_get_sample_language;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // AttrFontDesc
  gidLink(cast(void**)&pango_attr_font_desc_new, "pango_attr_font_desc_new", libs);

  // AttrFontFeatures
  gidLink(cast(void**)&pango_attr_font_features_new, "pango_attr_font_features_new", libs);

  // AttrIterator
  gidLink(cast(void**)&pango_attr_iterator_get_type, "pango_attr_iterator_get_type", libs);
  gidLink(cast(void**)&pango_attr_iterator_copy, "pango_attr_iterator_copy", libs);
  gidLink(cast(void**)&pango_attr_iterator_destroy, "pango_attr_iterator_destroy", libs);
  gidLink(cast(void**)&pango_attr_iterator_get, "pango_attr_iterator_get", libs);
  gidLink(cast(void**)&pango_attr_iterator_get_attrs, "pango_attr_iterator_get_attrs", libs);
  gidLink(cast(void**)&pango_attr_iterator_get_font, "pango_attr_iterator_get_font", libs);
  gidLink(cast(void**)&pango_attr_iterator_next, "pango_attr_iterator_next", libs);
  gidLink(cast(void**)&pango_attr_iterator_range, "pango_attr_iterator_range", libs);

  // AttrLanguage
  gidLink(cast(void**)&pango_attr_language_new, "pango_attr_language_new", libs);

  // AttrList
  gidLink(cast(void**)&pango_attr_list_get_type, "pango_attr_list_get_type", libs);
  gidLink(cast(void**)&pango_attr_list_new, "pango_attr_list_new", libs);
  gidLink(cast(void**)&pango_attr_list_change, "pango_attr_list_change", libs);
  gidLink(cast(void**)&pango_attr_list_copy, "pango_attr_list_copy", libs);
  gidLink(cast(void**)&pango_attr_list_equal, "pango_attr_list_equal", libs);
  gidLink(cast(void**)&pango_attr_list_filter, "pango_attr_list_filter", libs);
  gidLink(cast(void**)&pango_attr_list_get_attributes, "pango_attr_list_get_attributes", libs);
  gidLink(cast(void**)&pango_attr_list_get_iterator, "pango_attr_list_get_iterator", libs);
  gidLink(cast(void**)&pango_attr_list_insert, "pango_attr_list_insert", libs);
  gidLink(cast(void**)&pango_attr_list_insert_before, "pango_attr_list_insert_before", libs);
  gidLink(cast(void**)&pango_attr_list_ref, "pango_attr_list_ref", libs);
  gidLink(cast(void**)&pango_attr_list_splice, "pango_attr_list_splice", libs);
  gidLink(cast(void**)&pango_attr_list_to_string, "pango_attr_list_to_string", libs);
  gidLink(cast(void**)&pango_attr_list_unref, "pango_attr_list_unref", libs);
  gidLink(cast(void**)&pango_attr_list_update, "pango_attr_list_update", libs);
  gidLink(cast(void**)&pango_attr_list_from_string, "pango_attr_list_from_string", libs);

  // AttrShape
  gidLink(cast(void**)&pango_attr_shape_new, "pango_attr_shape_new", libs);
  gidLink(cast(void**)&pango_attr_shape_new_with_data, "pango_attr_shape_new_with_data", libs);

  // AttrSize
  gidLink(cast(void**)&pango_attr_size_new, "pango_attr_size_new", libs);
  gidLink(cast(void**)&pango_attr_size_new_absolute, "pango_attr_size_new_absolute", libs);

  // Attribute
  gidLink(cast(void**)&pango_attribute_get_type, "pango_attribute_get_type", libs);
  gidLink(cast(void**)&pango_attribute_as_color, "pango_attribute_as_color", libs);
  gidLink(cast(void**)&pango_attribute_as_float, "pango_attribute_as_float", libs);
  gidLink(cast(void**)&pango_attribute_as_font_desc, "pango_attribute_as_font_desc", libs);
  gidLink(cast(void**)&pango_attribute_as_font_features, "pango_attribute_as_font_features", libs);
  gidLink(cast(void**)&pango_attribute_as_int, "pango_attribute_as_int", libs);
  gidLink(cast(void**)&pango_attribute_as_language, "pango_attribute_as_language", libs);
  gidLink(cast(void**)&pango_attribute_as_shape, "pango_attribute_as_shape", libs);
  gidLink(cast(void**)&pango_attribute_as_size, "pango_attribute_as_size", libs);
  gidLink(cast(void**)&pango_attribute_as_string, "pango_attribute_as_string", libs);
  gidLink(cast(void**)&pango_attribute_copy, "pango_attribute_copy", libs);
  gidLink(cast(void**)&pango_attribute_destroy, "pango_attribute_destroy", libs);
  gidLink(cast(void**)&pango_attribute_equal, "pango_attribute_equal", libs);
  gidLink(cast(void**)&pango_attribute_init, "pango_attribute_init", libs);

  // Color
  gidLink(cast(void**)&pango_color_get_type, "pango_color_get_type", libs);
  gidLink(cast(void**)&pango_color_copy, "pango_color_copy", libs);
  gidLink(cast(void**)&pango_color_free, "pango_color_free", libs);
  gidLink(cast(void**)&pango_color_parse, "pango_color_parse", libs);
  gidLink(cast(void**)&pango_color_parse_with_alpha, "pango_color_parse_with_alpha", libs);
  gidLink(cast(void**)&pango_color_to_string, "pango_color_to_string", libs);

  // Context
  gidLink(cast(void**)&pango_context_get_type, "pango_context_get_type", libs);
  gidLink(cast(void**)&pango_context_new, "pango_context_new", libs);
  gidLink(cast(void**)&pango_context_changed, "pango_context_changed", libs);
  gidLink(cast(void**)&pango_context_get_base_dir, "pango_context_get_base_dir", libs);
  gidLink(cast(void**)&pango_context_get_base_gravity, "pango_context_get_base_gravity", libs);
  gidLink(cast(void**)&pango_context_get_font_description, "pango_context_get_font_description", libs);
  gidLink(cast(void**)&pango_context_get_font_map, "pango_context_get_font_map", libs);
  gidLink(cast(void**)&pango_context_get_gravity, "pango_context_get_gravity", libs);
  gidLink(cast(void**)&pango_context_get_gravity_hint, "pango_context_get_gravity_hint", libs);
  gidLink(cast(void**)&pango_context_get_language, "pango_context_get_language", libs);
  gidLink(cast(void**)&pango_context_get_matrix, "pango_context_get_matrix", libs);
  gidLink(cast(void**)&pango_context_get_metrics, "pango_context_get_metrics", libs);
  gidLink(cast(void**)&pango_context_get_round_glyph_positions, "pango_context_get_round_glyph_positions", libs);
  gidLink(cast(void**)&pango_context_get_serial, "pango_context_get_serial", libs);
  gidLink(cast(void**)&pango_context_list_families, "pango_context_list_families", libs);
  gidLink(cast(void**)&pango_context_load_font, "pango_context_load_font", libs);
  gidLink(cast(void**)&pango_context_load_fontset, "pango_context_load_fontset", libs);
  gidLink(cast(void**)&pango_context_set_base_dir, "pango_context_set_base_dir", libs);
  gidLink(cast(void**)&pango_context_set_base_gravity, "pango_context_set_base_gravity", libs);
  gidLink(cast(void**)&pango_context_set_font_description, "pango_context_set_font_description", libs);
  gidLink(cast(void**)&pango_context_set_font_map, "pango_context_set_font_map", libs);
  gidLink(cast(void**)&pango_context_set_gravity_hint, "pango_context_set_gravity_hint", libs);
  gidLink(cast(void**)&pango_context_set_language, "pango_context_set_language", libs);
  gidLink(cast(void**)&pango_context_set_matrix, "pango_context_set_matrix", libs);
  gidLink(cast(void**)&pango_context_set_round_glyph_positions, "pango_context_set_round_glyph_positions", libs);

  // Coverage
  gidLink(cast(void**)&pango_coverage_get_type, "pango_coverage_get_type", libs);
  gidLink(cast(void**)&pango_coverage_new, "pango_coverage_new", libs);
  gidLink(cast(void**)&pango_coverage_from_bytes, "pango_coverage_from_bytes", libs);
  gidLink(cast(void**)&pango_coverage_copy, "pango_coverage_copy", libs);
  gidLink(cast(void**)&pango_coverage_get, "pango_coverage_get", libs);
  gidLink(cast(void**)&pango_coverage_max, "pango_coverage_max", libs);
  gidLink(cast(void**)&pango_coverage_ref, "pango_coverage_ref", libs);
  gidLink(cast(void**)&pango_coverage_set, "pango_coverage_set", libs);
  gidLink(cast(void**)&pango_coverage_to_bytes, "pango_coverage_to_bytes", libs);
  gidLink(cast(void**)&pango_coverage_unref, "pango_coverage_unref", libs);

  // Font
  gidLink(cast(void**)&pango_font_get_type, "pango_font_get_type", libs);
  gidLink(cast(void**)&pango_font_descriptions_free, "pango_font_descriptions_free", libs);
  gidLink(cast(void**)&pango_font_deserialize, "pango_font_deserialize", libs);
  gidLink(cast(void**)&pango_font_describe, "pango_font_describe", libs);
  gidLink(cast(void**)&pango_font_describe_with_absolute_size, "pango_font_describe_with_absolute_size", libs);
  gidLink(cast(void**)&pango_font_get_coverage, "pango_font_get_coverage", libs);
  gidLink(cast(void**)&pango_font_get_face, "pango_font_get_face", libs);
  gidLink(cast(void**)&pango_font_get_features, "pango_font_get_features", libs);
  gidLink(cast(void**)&pango_font_get_font_map, "pango_font_get_font_map", libs);
  gidLink(cast(void**)&pango_font_get_glyph_extents, "pango_font_get_glyph_extents", libs);
  gidLink(cast(void**)&pango_font_get_hb_font, "pango_font_get_hb_font", libs);
  gidLink(cast(void**)&pango_font_get_languages, "pango_font_get_languages", libs);
  gidLink(cast(void**)&pango_font_get_metrics, "pango_font_get_metrics", libs);
  gidLink(cast(void**)&pango_font_has_char, "pango_font_has_char", libs);
  gidLink(cast(void**)&pango_font_serialize, "pango_font_serialize", libs);

  // FontDescription
  gidLink(cast(void**)&pango_font_description_get_type, "pango_font_description_get_type", libs);
  gidLink(cast(void**)&pango_font_description_new, "pango_font_description_new", libs);
  gidLink(cast(void**)&pango_font_description_better_match, "pango_font_description_better_match", libs);
  gidLink(cast(void**)&pango_font_description_copy, "pango_font_description_copy", libs);
  gidLink(cast(void**)&pango_font_description_copy_static, "pango_font_description_copy_static", libs);
  gidLink(cast(void**)&pango_font_description_equal, "pango_font_description_equal", libs);
  gidLink(cast(void**)&pango_font_description_free, "pango_font_description_free", libs);
  gidLink(cast(void**)&pango_font_description_get_color, "pango_font_description_get_color", libs);
  gidLink(cast(void**)&pango_font_description_get_family, "pango_font_description_get_family", libs);
  gidLink(cast(void**)&pango_font_description_get_features, "pango_font_description_get_features", libs);
  gidLink(cast(void**)&pango_font_description_get_gravity, "pango_font_description_get_gravity", libs);
  gidLink(cast(void**)&pango_font_description_get_set_fields, "pango_font_description_get_set_fields", libs);
  gidLink(cast(void**)&pango_font_description_get_size, "pango_font_description_get_size", libs);
  gidLink(cast(void**)&pango_font_description_get_size_is_absolute, "pango_font_description_get_size_is_absolute", libs);
  gidLink(cast(void**)&pango_font_description_get_stretch, "pango_font_description_get_stretch", libs);
  gidLink(cast(void**)&pango_font_description_get_style, "pango_font_description_get_style", libs);
  gidLink(cast(void**)&pango_font_description_get_variant, "pango_font_description_get_variant", libs);
  gidLink(cast(void**)&pango_font_description_get_variations, "pango_font_description_get_variations", libs);
  gidLink(cast(void**)&pango_font_description_get_weight, "pango_font_description_get_weight", libs);
  gidLink(cast(void**)&pango_font_description_hash, "pango_font_description_hash", libs);
  gidLink(cast(void**)&pango_font_description_merge, "pango_font_description_merge", libs);
  gidLink(cast(void**)&pango_font_description_merge_static, "pango_font_description_merge_static", libs);
  gidLink(cast(void**)&pango_font_description_set_absolute_size, "pango_font_description_set_absolute_size", libs);
  gidLink(cast(void**)&pango_font_description_set_color, "pango_font_description_set_color", libs);
  gidLink(cast(void**)&pango_font_description_set_family, "pango_font_description_set_family", libs);
  gidLink(cast(void**)&pango_font_description_set_family_static, "pango_font_description_set_family_static", libs);
  gidLink(cast(void**)&pango_font_description_set_features, "pango_font_description_set_features", libs);
  gidLink(cast(void**)&pango_font_description_set_features_static, "pango_font_description_set_features_static", libs);
  gidLink(cast(void**)&pango_font_description_set_gravity, "pango_font_description_set_gravity", libs);
  gidLink(cast(void**)&pango_font_description_set_size, "pango_font_description_set_size", libs);
  gidLink(cast(void**)&pango_font_description_set_stretch, "pango_font_description_set_stretch", libs);
  gidLink(cast(void**)&pango_font_description_set_style, "pango_font_description_set_style", libs);
  gidLink(cast(void**)&pango_font_description_set_variant, "pango_font_description_set_variant", libs);
  gidLink(cast(void**)&pango_font_description_set_variations, "pango_font_description_set_variations", libs);
  gidLink(cast(void**)&pango_font_description_set_variations_static, "pango_font_description_set_variations_static", libs);
  gidLink(cast(void**)&pango_font_description_set_weight, "pango_font_description_set_weight", libs);
  gidLink(cast(void**)&pango_font_description_to_filename, "pango_font_description_to_filename", libs);
  gidLink(cast(void**)&pango_font_description_to_string, "pango_font_description_to_string", libs);
  gidLink(cast(void**)&pango_font_description_unset_fields, "pango_font_description_unset_fields", libs);
  gidLink(cast(void**)&pango_font_description_from_string, "pango_font_description_from_string", libs);

  // FontFace
  gidLink(cast(void**)&pango_font_face_get_type, "pango_font_face_get_type", libs);
  gidLink(cast(void**)&pango_font_face_describe, "pango_font_face_describe", libs);
  gidLink(cast(void**)&pango_font_face_get_face_name, "pango_font_face_get_face_name", libs);
  gidLink(cast(void**)&pango_font_face_get_family, "pango_font_face_get_family", libs);
  gidLink(cast(void**)&pango_font_face_is_synthesized, "pango_font_face_is_synthesized", libs);
  gidLink(cast(void**)&pango_font_face_list_sizes, "pango_font_face_list_sizes", libs);

  // FontFamily
  gidLink(cast(void**)&pango_font_family_get_type, "pango_font_family_get_type", libs);
  gidLink(cast(void**)&pango_font_family_get_face, "pango_font_family_get_face", libs);
  gidLink(cast(void**)&pango_font_family_get_name, "pango_font_family_get_name", libs);
  gidLink(cast(void**)&pango_font_family_is_monospace, "pango_font_family_is_monospace", libs);
  gidLink(cast(void**)&pango_font_family_is_variable, "pango_font_family_is_variable", libs);
  gidLink(cast(void**)&pango_font_family_list_faces, "pango_font_family_list_faces", libs);

  // FontMap
  gidLink(cast(void**)&pango_font_map_get_type, "pango_font_map_get_type", libs);
  gidLink(cast(void**)&pango_font_map_add_font_file, "pango_font_map_add_font_file", libs);
  gidLink(cast(void**)&pango_font_map_changed, "pango_font_map_changed", libs);
  gidLink(cast(void**)&pango_font_map_create_context, "pango_font_map_create_context", libs);
  gidLink(cast(void**)&pango_font_map_get_family, "pango_font_map_get_family", libs);
  gidLink(cast(void**)&pango_font_map_get_serial, "pango_font_map_get_serial", libs);
  gidLink(cast(void**)&pango_font_map_list_families, "pango_font_map_list_families", libs);
  gidLink(cast(void**)&pango_font_map_load_font, "pango_font_map_load_font", libs);
  gidLink(cast(void**)&pango_font_map_load_fontset, "pango_font_map_load_fontset", libs);
  gidLink(cast(void**)&pango_font_map_reload_font, "pango_font_map_reload_font", libs);

  // FontMetrics
  gidLink(cast(void**)&pango_font_metrics_get_type, "pango_font_metrics_get_type", libs);
  gidLink(cast(void**)&pango_font_metrics_get_approximate_char_width, "pango_font_metrics_get_approximate_char_width", libs);
  gidLink(cast(void**)&pango_font_metrics_get_approximate_digit_width, "pango_font_metrics_get_approximate_digit_width", libs);
  gidLink(cast(void**)&pango_font_metrics_get_ascent, "pango_font_metrics_get_ascent", libs);
  gidLink(cast(void**)&pango_font_metrics_get_descent, "pango_font_metrics_get_descent", libs);
  gidLink(cast(void**)&pango_font_metrics_get_height, "pango_font_metrics_get_height", libs);
  gidLink(cast(void**)&pango_font_metrics_get_strikethrough_position, "pango_font_metrics_get_strikethrough_position", libs);
  gidLink(cast(void**)&pango_font_metrics_get_strikethrough_thickness, "pango_font_metrics_get_strikethrough_thickness", libs);
  gidLink(cast(void**)&pango_font_metrics_get_underline_position, "pango_font_metrics_get_underline_position", libs);
  gidLink(cast(void**)&pango_font_metrics_get_underline_thickness, "pango_font_metrics_get_underline_thickness", libs);
  gidLink(cast(void**)&pango_font_metrics_ref, "pango_font_metrics_ref", libs);
  gidLink(cast(void**)&pango_font_metrics_unref, "pango_font_metrics_unref", libs);

  // Fontset
  gidLink(cast(void**)&pango_fontset_get_type, "pango_fontset_get_type", libs);
  gidLink(cast(void**)&pango_fontset_foreach, "pango_fontset_foreach", libs);
  gidLink(cast(void**)&pango_fontset_get_font, "pango_fontset_get_font", libs);
  gidLink(cast(void**)&pango_fontset_get_metrics, "pango_fontset_get_metrics", libs);

  // FontsetSimple
  gidLink(cast(void**)&pango_fontset_simple_get_type, "pango_fontset_simple_get_type", libs);
  gidLink(cast(void**)&pango_fontset_simple_new, "pango_fontset_simple_new", libs);
  gidLink(cast(void**)&pango_fontset_simple_append, "pango_fontset_simple_append", libs);
  gidLink(cast(void**)&pango_fontset_simple_size, "pango_fontset_simple_size", libs);

  // GlyphItem
  gidLink(cast(void**)&pango_glyph_item_get_type, "pango_glyph_item_get_type", libs);
  gidLink(cast(void**)&pango_glyph_item_apply_attrs, "pango_glyph_item_apply_attrs", libs);
  gidLink(cast(void**)&pango_glyph_item_copy, "pango_glyph_item_copy", libs);
  gidLink(cast(void**)&pango_glyph_item_free, "pango_glyph_item_free", libs);
  gidLink(cast(void**)&pango_glyph_item_get_logical_widths, "pango_glyph_item_get_logical_widths", libs);
  gidLink(cast(void**)&pango_glyph_item_letter_space, "pango_glyph_item_letter_space", libs);
  gidLink(cast(void**)&pango_glyph_item_split, "pango_glyph_item_split", libs);

  // GlyphItemIter
  gidLink(cast(void**)&pango_glyph_item_iter_get_type, "pango_glyph_item_iter_get_type", libs);
  gidLink(cast(void**)&pango_glyph_item_iter_copy, "pango_glyph_item_iter_copy", libs);
  gidLink(cast(void**)&pango_glyph_item_iter_free, "pango_glyph_item_iter_free", libs);
  gidLink(cast(void**)&pango_glyph_item_iter_init_end, "pango_glyph_item_iter_init_end", libs);
  gidLink(cast(void**)&pango_glyph_item_iter_init_start, "pango_glyph_item_iter_init_start", libs);
  gidLink(cast(void**)&pango_glyph_item_iter_next_cluster, "pango_glyph_item_iter_next_cluster", libs);
  gidLink(cast(void**)&pango_glyph_item_iter_prev_cluster, "pango_glyph_item_iter_prev_cluster", libs);

  // GlyphString
  gidLink(cast(void**)&pango_glyph_string_get_type, "pango_glyph_string_get_type", libs);
  gidLink(cast(void**)&pango_glyph_string_new, "pango_glyph_string_new", libs);
  gidLink(cast(void**)&pango_glyph_string_copy, "pango_glyph_string_copy", libs);
  gidLink(cast(void**)&pango_glyph_string_extents, "pango_glyph_string_extents", libs);
  gidLink(cast(void**)&pango_glyph_string_extents_range, "pango_glyph_string_extents_range", libs);
  gidLink(cast(void**)&pango_glyph_string_free, "pango_glyph_string_free", libs);
  gidLink(cast(void**)&pango_glyph_string_get_logical_widths, "pango_glyph_string_get_logical_widths", libs);
  gidLink(cast(void**)&pango_glyph_string_get_width, "pango_glyph_string_get_width", libs);
  gidLink(cast(void**)&pango_glyph_string_index_to_x, "pango_glyph_string_index_to_x", libs);
  gidLink(cast(void**)&pango_glyph_string_index_to_x_full, "pango_glyph_string_index_to_x_full", libs);
  gidLink(cast(void**)&pango_glyph_string_set_size, "pango_glyph_string_set_size", libs);
  gidLink(cast(void**)&pango_glyph_string_x_to_index, "pango_glyph_string_x_to_index", libs);

  // Item
  gidLink(cast(void**)&pango_item_get_type, "pango_item_get_type", libs);
  gidLink(cast(void**)&pango_item_new, "pango_item_new", libs);
  gidLink(cast(void**)&pango_item_apply_attrs, "pango_item_apply_attrs", libs);
  gidLink(cast(void**)&pango_item_copy, "pango_item_copy", libs);
  gidLink(cast(void**)&pango_item_free, "pango_item_free", libs);
  gidLink(cast(void**)&pango_item_get_char_offset, "pango_item_get_char_offset", libs);
  gidLink(cast(void**)&pango_item_split, "pango_item_split", libs);

  // Language
  gidLink(cast(void**)&pango_language_get_type, "pango_language_get_type", libs);
  gidLink(cast(void**)&pango_language_get_sample_string, "pango_language_get_sample_string", libs);
  gidLink(cast(void**)&pango_language_get_scripts, "pango_language_get_scripts", libs);
  gidLink(cast(void**)&pango_language_includes_script, "pango_language_includes_script", libs);
  gidLink(cast(void**)&pango_language_matches, "pango_language_matches", libs);
  gidLink(cast(void**)&pango_language_to_string, "pango_language_to_string", libs);
  gidLink(cast(void**)&pango_language_from_string, "pango_language_from_string", libs);
  gidLink(cast(void**)&pango_language_get_default, "pango_language_get_default", libs);
  gidLink(cast(void**)&pango_language_get_preferred, "pango_language_get_preferred", libs);

  // Layout
  gidLink(cast(void**)&pango_layout_get_type, "pango_layout_get_type", libs);
  gidLink(cast(void**)&pango_layout_new, "pango_layout_new", libs);
  gidLink(cast(void**)&pango_layout_deserialize, "pango_layout_deserialize", libs);
  gidLink(cast(void**)&pango_layout_context_changed, "pango_layout_context_changed", libs);
  gidLink(cast(void**)&pango_layout_copy, "pango_layout_copy", libs);
  gidLink(cast(void**)&pango_layout_get_alignment, "pango_layout_get_alignment", libs);
  gidLink(cast(void**)&pango_layout_get_attributes, "pango_layout_get_attributes", libs);
  gidLink(cast(void**)&pango_layout_get_auto_dir, "pango_layout_get_auto_dir", libs);
  gidLink(cast(void**)&pango_layout_get_baseline, "pango_layout_get_baseline", libs);
  gidLink(cast(void**)&pango_layout_get_caret_pos, "pango_layout_get_caret_pos", libs);
  gidLink(cast(void**)&pango_layout_get_character_count, "pango_layout_get_character_count", libs);
  gidLink(cast(void**)&pango_layout_get_context, "pango_layout_get_context", libs);
  gidLink(cast(void**)&pango_layout_get_cursor_pos, "pango_layout_get_cursor_pos", libs);
  gidLink(cast(void**)&pango_layout_get_direction, "pango_layout_get_direction", libs);
  gidLink(cast(void**)&pango_layout_get_ellipsize, "pango_layout_get_ellipsize", libs);
  gidLink(cast(void**)&pango_layout_get_extents, "pango_layout_get_extents", libs);
  gidLink(cast(void**)&pango_layout_get_font_description, "pango_layout_get_font_description", libs);
  gidLink(cast(void**)&pango_layout_get_height, "pango_layout_get_height", libs);
  gidLink(cast(void**)&pango_layout_get_indent, "pango_layout_get_indent", libs);
  gidLink(cast(void**)&pango_layout_get_iter, "pango_layout_get_iter", libs);
  gidLink(cast(void**)&pango_layout_get_justify, "pango_layout_get_justify", libs);
  gidLink(cast(void**)&pango_layout_get_justify_last_line, "pango_layout_get_justify_last_line", libs);
  gidLink(cast(void**)&pango_layout_get_line, "pango_layout_get_line", libs);
  gidLink(cast(void**)&pango_layout_get_line_count, "pango_layout_get_line_count", libs);
  gidLink(cast(void**)&pango_layout_get_line_readonly, "pango_layout_get_line_readonly", libs);
  gidLink(cast(void**)&pango_layout_get_line_spacing, "pango_layout_get_line_spacing", libs);
  gidLink(cast(void**)&pango_layout_get_lines, "pango_layout_get_lines", libs);
  gidLink(cast(void**)&pango_layout_get_lines_readonly, "pango_layout_get_lines_readonly", libs);
  gidLink(cast(void**)&pango_layout_get_log_attrs, "pango_layout_get_log_attrs", libs);
  gidLink(cast(void**)&pango_layout_get_log_attrs_readonly, "pango_layout_get_log_attrs_readonly", libs);
  gidLink(cast(void**)&pango_layout_get_pixel_extents, "pango_layout_get_pixel_extents", libs);
  gidLink(cast(void**)&pango_layout_get_pixel_size, "pango_layout_get_pixel_size", libs);
  gidLink(cast(void**)&pango_layout_get_serial, "pango_layout_get_serial", libs);
  gidLink(cast(void**)&pango_layout_get_single_paragraph_mode, "pango_layout_get_single_paragraph_mode", libs);
  gidLink(cast(void**)&pango_layout_get_size, "pango_layout_get_size", libs);
  gidLink(cast(void**)&pango_layout_get_spacing, "pango_layout_get_spacing", libs);
  gidLink(cast(void**)&pango_layout_get_tabs, "pango_layout_get_tabs", libs);
  gidLink(cast(void**)&pango_layout_get_text, "pango_layout_get_text", libs);
  gidLink(cast(void**)&pango_layout_get_unknown_glyphs_count, "pango_layout_get_unknown_glyphs_count", libs);
  gidLink(cast(void**)&pango_layout_get_width, "pango_layout_get_width", libs);
  gidLink(cast(void**)&pango_layout_get_wrap, "pango_layout_get_wrap", libs);
  gidLink(cast(void**)&pango_layout_index_to_line_x, "pango_layout_index_to_line_x", libs);
  gidLink(cast(void**)&pango_layout_index_to_pos, "pango_layout_index_to_pos", libs);
  gidLink(cast(void**)&pango_layout_is_ellipsized, "pango_layout_is_ellipsized", libs);
  gidLink(cast(void**)&pango_layout_is_wrapped, "pango_layout_is_wrapped", libs);
  gidLink(cast(void**)&pango_layout_move_cursor_visually, "pango_layout_move_cursor_visually", libs);
  gidLink(cast(void**)&pango_layout_serialize, "pango_layout_serialize", libs);
  gidLink(cast(void**)&pango_layout_set_alignment, "pango_layout_set_alignment", libs);
  gidLink(cast(void**)&pango_layout_set_attributes, "pango_layout_set_attributes", libs);
  gidLink(cast(void**)&pango_layout_set_auto_dir, "pango_layout_set_auto_dir", libs);
  gidLink(cast(void**)&pango_layout_set_ellipsize, "pango_layout_set_ellipsize", libs);
  gidLink(cast(void**)&pango_layout_set_font_description, "pango_layout_set_font_description", libs);
  gidLink(cast(void**)&pango_layout_set_height, "pango_layout_set_height", libs);
  gidLink(cast(void**)&pango_layout_set_indent, "pango_layout_set_indent", libs);
  gidLink(cast(void**)&pango_layout_set_justify, "pango_layout_set_justify", libs);
  gidLink(cast(void**)&pango_layout_set_justify_last_line, "pango_layout_set_justify_last_line", libs);
  gidLink(cast(void**)&pango_layout_set_line_spacing, "pango_layout_set_line_spacing", libs);
  gidLink(cast(void**)&pango_layout_set_markup, "pango_layout_set_markup", libs);
  gidLink(cast(void**)&pango_layout_set_markup_with_accel, "pango_layout_set_markup_with_accel", libs);
  gidLink(cast(void**)&pango_layout_set_single_paragraph_mode, "pango_layout_set_single_paragraph_mode", libs);
  gidLink(cast(void**)&pango_layout_set_spacing, "pango_layout_set_spacing", libs);
  gidLink(cast(void**)&pango_layout_set_tabs, "pango_layout_set_tabs", libs);
  gidLink(cast(void**)&pango_layout_set_text, "pango_layout_set_text", libs);
  gidLink(cast(void**)&pango_layout_set_width, "pango_layout_set_width", libs);
  gidLink(cast(void**)&pango_layout_set_wrap, "pango_layout_set_wrap", libs);
  gidLink(cast(void**)&pango_layout_write_to_file, "pango_layout_write_to_file", libs);
  gidLink(cast(void**)&pango_layout_xy_to_index, "pango_layout_xy_to_index", libs);

  // LayoutIter
  gidLink(cast(void**)&pango_layout_iter_get_type, "pango_layout_iter_get_type", libs);
  gidLink(cast(void**)&pango_layout_iter_at_last_line, "pango_layout_iter_at_last_line", libs);
  gidLink(cast(void**)&pango_layout_iter_copy, "pango_layout_iter_copy", libs);
  gidLink(cast(void**)&pango_layout_iter_free, "pango_layout_iter_free", libs);
  gidLink(cast(void**)&pango_layout_iter_get_baseline, "pango_layout_iter_get_baseline", libs);
  gidLink(cast(void**)&pango_layout_iter_get_char_extents, "pango_layout_iter_get_char_extents", libs);
  gidLink(cast(void**)&pango_layout_iter_get_cluster_extents, "pango_layout_iter_get_cluster_extents", libs);
  gidLink(cast(void**)&pango_layout_iter_get_index, "pango_layout_iter_get_index", libs);
  gidLink(cast(void**)&pango_layout_iter_get_layout, "pango_layout_iter_get_layout", libs);
  gidLink(cast(void**)&pango_layout_iter_get_layout_extents, "pango_layout_iter_get_layout_extents", libs);
  gidLink(cast(void**)&pango_layout_iter_get_line, "pango_layout_iter_get_line", libs);
  gidLink(cast(void**)&pango_layout_iter_get_line_extents, "pango_layout_iter_get_line_extents", libs);
  gidLink(cast(void**)&pango_layout_iter_get_line_readonly, "pango_layout_iter_get_line_readonly", libs);
  gidLink(cast(void**)&pango_layout_iter_get_line_yrange, "pango_layout_iter_get_line_yrange", libs);
  gidLink(cast(void**)&pango_layout_iter_get_run, "pango_layout_iter_get_run", libs);
  gidLink(cast(void**)&pango_layout_iter_get_run_baseline, "pango_layout_iter_get_run_baseline", libs);
  gidLink(cast(void**)&pango_layout_iter_get_run_extents, "pango_layout_iter_get_run_extents", libs);
  gidLink(cast(void**)&pango_layout_iter_get_run_readonly, "pango_layout_iter_get_run_readonly", libs);
  gidLink(cast(void**)&pango_layout_iter_next_char, "pango_layout_iter_next_char", libs);
  gidLink(cast(void**)&pango_layout_iter_next_cluster, "pango_layout_iter_next_cluster", libs);
  gidLink(cast(void**)&pango_layout_iter_next_line, "pango_layout_iter_next_line", libs);
  gidLink(cast(void**)&pango_layout_iter_next_run, "pango_layout_iter_next_run", libs);

  // LayoutLine
  gidLink(cast(void**)&pango_layout_line_get_type, "pango_layout_line_get_type", libs);
  gidLink(cast(void**)&pango_layout_line_get_extents, "pango_layout_line_get_extents", libs);
  gidLink(cast(void**)&pango_layout_line_get_height, "pango_layout_line_get_height", libs);
  gidLink(cast(void**)&pango_layout_line_get_length, "pango_layout_line_get_length", libs);
  gidLink(cast(void**)&pango_layout_line_get_pixel_extents, "pango_layout_line_get_pixel_extents", libs);
  gidLink(cast(void**)&pango_layout_line_get_resolved_direction, "pango_layout_line_get_resolved_direction", libs);
  gidLink(cast(void**)&pango_layout_line_get_start_index, "pango_layout_line_get_start_index", libs);
  gidLink(cast(void**)&pango_layout_line_get_x_ranges, "pango_layout_line_get_x_ranges", libs);
  gidLink(cast(void**)&pango_layout_line_index_to_x, "pango_layout_line_index_to_x", libs);
  gidLink(cast(void**)&pango_layout_line_is_paragraph_start, "pango_layout_line_is_paragraph_start", libs);
  gidLink(cast(void**)&pango_layout_line_ref, "pango_layout_line_ref", libs);
  gidLink(cast(void**)&pango_layout_line_unref, "pango_layout_line_unref", libs);
  gidLink(cast(void**)&pango_layout_line_x_to_index, "pango_layout_line_x_to_index", libs);

  // Matrix
  gidLink(cast(void**)&pango_matrix_get_type, "pango_matrix_get_type", libs);
  gidLink(cast(void**)&pango_matrix_concat, "pango_matrix_concat", libs);
  gidLink(cast(void**)&pango_matrix_copy, "pango_matrix_copy", libs);
  gidLink(cast(void**)&pango_matrix_free, "pango_matrix_free", libs);
  gidLink(cast(void**)&pango_matrix_get_font_scale_factor, "pango_matrix_get_font_scale_factor", libs);
  gidLink(cast(void**)&pango_matrix_get_font_scale_factors, "pango_matrix_get_font_scale_factors", libs);
  gidLink(cast(void**)&pango_matrix_get_slant_ratio, "pango_matrix_get_slant_ratio", libs);
  gidLink(cast(void**)&pango_matrix_rotate, "pango_matrix_rotate", libs);
  gidLink(cast(void**)&pango_matrix_scale, "pango_matrix_scale", libs);
  gidLink(cast(void**)&pango_matrix_transform_distance, "pango_matrix_transform_distance", libs);
  gidLink(cast(void**)&pango_matrix_transform_pixel_rectangle, "pango_matrix_transform_pixel_rectangle", libs);
  gidLink(cast(void**)&pango_matrix_transform_point, "pango_matrix_transform_point", libs);
  gidLink(cast(void**)&pango_matrix_transform_rectangle, "pango_matrix_transform_rectangle", libs);
  gidLink(cast(void**)&pango_matrix_translate, "pango_matrix_translate", libs);

  // Renderer
  gidLink(cast(void**)&pango_renderer_get_type, "pango_renderer_get_type", libs);
  gidLink(cast(void**)&pango_renderer_activate, "pango_renderer_activate", libs);
  gidLink(cast(void**)&pango_renderer_deactivate, "pango_renderer_deactivate", libs);
  gidLink(cast(void**)&pango_renderer_draw_error_underline, "pango_renderer_draw_error_underline", libs);
  gidLink(cast(void**)&pango_renderer_draw_glyph, "pango_renderer_draw_glyph", libs);
  gidLink(cast(void**)&pango_renderer_draw_glyph_item, "pango_renderer_draw_glyph_item", libs);
  gidLink(cast(void**)&pango_renderer_draw_glyphs, "pango_renderer_draw_glyphs", libs);
  gidLink(cast(void**)&pango_renderer_draw_layout, "pango_renderer_draw_layout", libs);
  gidLink(cast(void**)&pango_renderer_draw_layout_line, "pango_renderer_draw_layout_line", libs);
  gidLink(cast(void**)&pango_renderer_draw_rectangle, "pango_renderer_draw_rectangle", libs);
  gidLink(cast(void**)&pango_renderer_draw_trapezoid, "pango_renderer_draw_trapezoid", libs);
  gidLink(cast(void**)&pango_renderer_get_alpha, "pango_renderer_get_alpha", libs);
  gidLink(cast(void**)&pango_renderer_get_color, "pango_renderer_get_color", libs);
  gidLink(cast(void**)&pango_renderer_get_layout, "pango_renderer_get_layout", libs);
  gidLink(cast(void**)&pango_renderer_get_layout_line, "pango_renderer_get_layout_line", libs);
  gidLink(cast(void**)&pango_renderer_get_matrix, "pango_renderer_get_matrix", libs);
  gidLink(cast(void**)&pango_renderer_part_changed, "pango_renderer_part_changed", libs);
  gidLink(cast(void**)&pango_renderer_set_alpha, "pango_renderer_set_alpha", libs);
  gidLink(cast(void**)&pango_renderer_set_color, "pango_renderer_set_color", libs);
  gidLink(cast(void**)&pango_renderer_set_matrix, "pango_renderer_set_matrix", libs);

  // ScriptIter
  gidLink(cast(void**)&pango_script_iter_get_type, "pango_script_iter_get_type", libs);
  gidLink(cast(void**)&pango_script_iter_new, "pango_script_iter_new", libs);
  gidLink(cast(void**)&pango_script_iter_free, "pango_script_iter_free", libs);
  gidLink(cast(void**)&pango_script_iter_get_range, "pango_script_iter_get_range", libs);
  gidLink(cast(void**)&pango_script_iter_next, "pango_script_iter_next", libs);

  // TabArray
  gidLink(cast(void**)&pango_tab_array_get_type, "pango_tab_array_get_type", libs);
  gidLink(cast(void**)&pango_tab_array_new, "pango_tab_array_new", libs);
  gidLink(cast(void**)&pango_tab_array_new_with_positions, "pango_tab_array_new_with_positions", libs);
  gidLink(cast(void**)&pango_tab_array_copy, "pango_tab_array_copy", libs);
  gidLink(cast(void**)&pango_tab_array_free, "pango_tab_array_free", libs);
  gidLink(cast(void**)&pango_tab_array_get_decimal_point, "pango_tab_array_get_decimal_point", libs);
  gidLink(cast(void**)&pango_tab_array_get_positions_in_pixels, "pango_tab_array_get_positions_in_pixels", libs);
  gidLink(cast(void**)&pango_tab_array_get_size, "pango_tab_array_get_size", libs);
  gidLink(cast(void**)&pango_tab_array_get_tab, "pango_tab_array_get_tab", libs);
  gidLink(cast(void**)&pango_tab_array_get_tabs, "pango_tab_array_get_tabs", libs);
  gidLink(cast(void**)&pango_tab_array_resize, "pango_tab_array_resize", libs);
  gidLink(cast(void**)&pango_tab_array_set_decimal_point, "pango_tab_array_set_decimal_point", libs);
  gidLink(cast(void**)&pango_tab_array_set_positions_in_pixels, "pango_tab_array_set_positions_in_pixels", libs);
  gidLink(cast(void**)&pango_tab_array_set_tab, "pango_tab_array_set_tab", libs);
  gidLink(cast(void**)&pango_tab_array_sort, "pango_tab_array_sort", libs);
  gidLink(cast(void**)&pango_tab_array_to_string, "pango_tab_array_to_string", libs);
  gidLink(cast(void**)&pango_tab_array_from_string, "pango_tab_array_from_string", libs);

  // global
  gidLink(cast(void**)&pango_attr_allow_breaks_new, "pango_attr_allow_breaks_new", libs);
  gidLink(cast(void**)&pango_attr_background_alpha_new, "pango_attr_background_alpha_new", libs);
  gidLink(cast(void**)&pango_attr_background_new, "pango_attr_background_new", libs);
  gidLink(cast(void**)&pango_attr_baseline_shift_new, "pango_attr_baseline_shift_new", libs);
  gidLink(cast(void**)&pango_attr_break, "pango_attr_break", libs);
  gidLink(cast(void**)&pango_attr_fallback_new, "pango_attr_fallback_new", libs);
  gidLink(cast(void**)&pango_attr_family_new, "pango_attr_family_new", libs);
  gidLink(cast(void**)&pango_attr_font_scale_new, "pango_attr_font_scale_new", libs);
  gidLink(cast(void**)&pango_attr_foreground_alpha_new, "pango_attr_foreground_alpha_new", libs);
  gidLink(cast(void**)&pango_attr_foreground_new, "pango_attr_foreground_new", libs);
  gidLink(cast(void**)&pango_attr_gravity_hint_new, "pango_attr_gravity_hint_new", libs);
  gidLink(cast(void**)&pango_attr_gravity_new, "pango_attr_gravity_new", libs);
  gidLink(cast(void**)&pango_attr_insert_hyphens_new, "pango_attr_insert_hyphens_new", libs);
  gidLink(cast(void**)&pango_attr_letter_spacing_new, "pango_attr_letter_spacing_new", libs);
  gidLink(cast(void**)&pango_attr_line_height_new, "pango_attr_line_height_new", libs);
  gidLink(cast(void**)&pango_attr_line_height_new_absolute, "pango_attr_line_height_new_absolute", libs);
  gidLink(cast(void**)&pango_attr_overline_color_new, "pango_attr_overline_color_new", libs);
  gidLink(cast(void**)&pango_attr_overline_new, "pango_attr_overline_new", libs);
  gidLink(cast(void**)&pango_attr_rise_new, "pango_attr_rise_new", libs);
  gidLink(cast(void**)&pango_attr_scale_new, "pango_attr_scale_new", libs);
  gidLink(cast(void**)&pango_attr_sentence_new, "pango_attr_sentence_new", libs);
  gidLink(cast(void**)&pango_attr_show_new, "pango_attr_show_new", libs);
  gidLink(cast(void**)&pango_attr_stretch_new, "pango_attr_stretch_new", libs);
  gidLink(cast(void**)&pango_attr_strikethrough_color_new, "pango_attr_strikethrough_color_new", libs);
  gidLink(cast(void**)&pango_attr_strikethrough_new, "pango_attr_strikethrough_new", libs);
  gidLink(cast(void**)&pango_attr_style_new, "pango_attr_style_new", libs);
  gidLink(cast(void**)&pango_attr_text_transform_new, "pango_attr_text_transform_new", libs);
  gidLink(cast(void**)&pango_attr_underline_color_new, "pango_attr_underline_color_new", libs);
  gidLink(cast(void**)&pango_attr_underline_new, "pango_attr_underline_new", libs);
  gidLink(cast(void**)&pango_attr_variant_new, "pango_attr_variant_new", libs);
  gidLink(cast(void**)&pango_attr_weight_new, "pango_attr_weight_new", libs);
  gidLink(cast(void**)&pango_attr_word_new, "pango_attr_word_new", libs);
  gidLink(cast(void**)&pango_break, "pango_break", libs);
  gidLink(cast(void**)&pango_default_break, "pango_default_break", libs);
  gidLink(cast(void**)&pango_extents_to_pixels, "pango_extents_to_pixels", libs);
  gidLink(cast(void**)&pango_find_base_dir, "pango_find_base_dir", libs);
  gidLink(cast(void**)&pango_find_paragraph_boundary, "pango_find_paragraph_boundary", libs);
  gidLink(cast(void**)&pango_get_log_attrs, "pango_get_log_attrs", libs);
  gidLink(cast(void**)&pango_get_mirror_char, "pango_get_mirror_char", libs);
  gidLink(cast(void**)&pango_is_zero_width, "pango_is_zero_width", libs);
  gidLink(cast(void**)&pango_itemize, "pango_itemize", libs);
  gidLink(cast(void**)&pango_itemize_with_base_dir, "pango_itemize_with_base_dir", libs);
  gidLink(cast(void**)&pango_log2vis_get_embedding_levels, "pango_log2vis_get_embedding_levels", libs);
  gidLink(cast(void**)&pango_markup_parser_finish, "pango_markup_parser_finish", libs);
  gidLink(cast(void**)&pango_markup_parser_new, "pango_markup_parser_new", libs);
  gidLink(cast(void**)&pango_parse_enum, "pango_parse_enum", libs);
  gidLink(cast(void**)&pango_parse_markup, "pango_parse_markup", libs);
  gidLink(cast(void**)&pango_parse_stretch, "pango_parse_stretch", libs);
  gidLink(cast(void**)&pango_parse_style, "pango_parse_style", libs);
  gidLink(cast(void**)&pango_parse_variant, "pango_parse_variant", libs);
  gidLink(cast(void**)&pango_parse_weight, "pango_parse_weight", libs);
  gidLink(cast(void**)&pango_quantize_line_geometry, "pango_quantize_line_geometry", libs);
  gidLink(cast(void**)&pango_read_line, "pango_read_line", libs);
  gidLink(cast(void**)&pango_reorder_items, "pango_reorder_items", libs);
  gidLink(cast(void**)&pango_scan_int, "pango_scan_int", libs);
  gidLink(cast(void**)&pango_scan_string, "pango_scan_string", libs);
  gidLink(cast(void**)&pango_scan_word, "pango_scan_word", libs);
  gidLink(cast(void**)&pango_shape, "pango_shape", libs);
  gidLink(cast(void**)&pango_shape_full, "pango_shape_full", libs);
  gidLink(cast(void**)&pango_shape_item, "pango_shape_item", libs);
  gidLink(cast(void**)&pango_shape_with_flags, "pango_shape_with_flags", libs);
  gidLink(cast(void**)&pango_skip_space, "pango_skip_space", libs);
  gidLink(cast(void**)&pango_split_file_list, "pango_split_file_list", libs);
  gidLink(cast(void**)&pango_tailor_break, "pango_tailor_break", libs);
  gidLink(cast(void**)&pango_trim_string, "pango_trim_string", libs);
  gidLink(cast(void**)&pango_unichar_direction, "pango_unichar_direction", libs);
  gidLink(cast(void**)&pango_units_from_double, "pango_units_from_double", libs);
  gidLink(cast(void**)&pango_units_to_double, "pango_units_to_double", libs);
  gidLink(cast(void**)&pango_version, "pango_version", libs);
  gidLink(cast(void**)&pango_version_check, "pango_version_check", libs);
  gidLink(cast(void**)&pango_version_string, "pango_version_string", libs);

  // AttrType
  gidLink(cast(void**)&pango_attr_type_get_name, "pango_attr_type_get_name", libs);
  gidLink(cast(void**)&pango_attr_type_register, "pango_attr_type_register", libs);

  // BidiType
  gidLink(cast(void**)&pango_bidi_type_for_unichar, "pango_bidi_type_for_unichar", libs);

  // Gravity
  gidLink(cast(void**)&pango_gravity_get_for_matrix, "pango_gravity_get_for_matrix", libs);
  gidLink(cast(void**)&pango_gravity_get_for_script, "pango_gravity_get_for_script", libs);
  gidLink(cast(void**)&pango_gravity_get_for_script_and_width, "pango_gravity_get_for_script_and_width", libs);
  gidLink(cast(void**)&pango_gravity_to_rotation, "pango_gravity_to_rotation", libs);

  // LayoutDeserializeError
  gidLink(cast(void**)&pango_layout_deserialize_error_quark, "pango_layout_deserialize_error_quark", libs);

  // Script
  gidLink(cast(void**)&pango_script_for_unichar, "pango_script_for_unichar", libs);
  gidLink(cast(void**)&pango_script_get_sample_language, "pango_script_get_sample_language", libs);
}
