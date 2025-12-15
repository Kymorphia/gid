/// C functions for pango1 library
module pango.c.functions;

public import gid.basictypes;
import gid.loader;
import pango.c.types;
public import gobject.c.types;
public import gio.c.types;
public import harfbuzz.c.types;
public import cairo.c.types;

version(Windows)
  private immutable LIBS = ["libpango-1.0-0.dll;pango-1.0-0.dll;pango-1.dll"];
else version(OSX)
  private immutable LIBS = ["libpango-1.0.0.dylib"];
else
  private immutable LIBS = ["libpango-1.0.so.0"];

__gshared extern(C)
{
  // AttrFontDesc
  PangoAttribute* function(const(PangoFontDescription)* desc) c_pango_attr_font_desc_new; ///

  // AttrFontFeatures
  PangoAttribute* function(const(char)* features) c_pango_attr_font_features_new; ///

  // AttrIterator
  GType function() c_pango_attr_iterator_get_type; ///
  PangoAttrIterator* function(PangoAttrIterator* iterator) c_pango_attr_iterator_copy; ///
  void function(PangoAttrIterator* iterator) c_pango_attr_iterator_destroy; ///
  PangoAttribute* function(PangoAttrIterator* iterator, PangoAttrType type) c_pango_attr_iterator_get; ///
  GSList* function(PangoAttrIterator* iterator) c_pango_attr_iterator_get_attrs; ///
  void function(PangoAttrIterator* iterator, PangoFontDescription* desc, PangoLanguage** language, GSList** extraAttrs) c_pango_attr_iterator_get_font; ///
  gboolean function(PangoAttrIterator* iterator) c_pango_attr_iterator_next; ///
  void function(PangoAttrIterator* iterator, int* start, int* end) c_pango_attr_iterator_range; ///

  // AttrLanguage
  PangoAttribute* function(PangoLanguage* language) c_pango_attr_language_new; ///

  // AttrList
  GType function() c_pango_attr_list_get_type; ///
  PangoAttrList* function() c_pango_attr_list_new; ///
  void function(PangoAttrList* list, PangoAttribute* attr) c_pango_attr_list_change; ///
  PangoAttrList* function(PangoAttrList* list) c_pango_attr_list_copy; ///
  gboolean function(PangoAttrList* list, PangoAttrList* otherList) c_pango_attr_list_equal; ///
  PangoAttrList* function(PangoAttrList* list, PangoAttrFilterFunc func, void* data) c_pango_attr_list_filter; ///
  GSList* function(PangoAttrList* list) c_pango_attr_list_get_attributes; ///
  PangoAttrIterator* function(PangoAttrList* list) c_pango_attr_list_get_iterator; ///
  void function(PangoAttrList* list, PangoAttribute* attr) c_pango_attr_list_insert; ///
  void function(PangoAttrList* list, PangoAttribute* attr) c_pango_attr_list_insert_before; ///
  PangoAttrList* function(PangoAttrList* list) c_pango_attr_list_ref; ///
  void function(PangoAttrList* list, PangoAttrList* other, int pos, int len) c_pango_attr_list_splice; ///
  char* function(PangoAttrList* list) c_pango_attr_list_to_string; ///
  void function(PangoAttrList* list) c_pango_attr_list_unref; ///
  void function(PangoAttrList* list, int pos, int remove, int add) c_pango_attr_list_update; ///
  PangoAttrList* function(const(char)* text) c_pango_attr_list_from_string; ///

  // AttrShape
  PangoAttribute* function(const(PangoRectangle)* inkRect, const(PangoRectangle)* logicalRect) c_pango_attr_shape_new; ///
  PangoAttribute* function(const(PangoRectangle)* inkRect, const(PangoRectangle)* logicalRect, void* data, PangoAttrDataCopyFunc copyFunc, GDestroyNotify destroyFunc) c_pango_attr_shape_new_with_data; ///

  // AttrSize
  PangoAttribute* function(int size) c_pango_attr_size_new; ///
  PangoAttribute* function(int size) c_pango_attr_size_new_absolute; ///

  // Attribute
  GType function() c_pango_attribute_get_type; ///
  PangoAttrColor* function(PangoAttribute* attr) c_pango_attribute_as_color; ///
  PangoAttrFloat* function(PangoAttribute* attr) c_pango_attribute_as_float; ///
  PangoAttrFontDesc* function(PangoAttribute* attr) c_pango_attribute_as_font_desc; ///
  PangoAttrFontFeatures* function(PangoAttribute* attr) c_pango_attribute_as_font_features; ///
  PangoAttrInt* function(PangoAttribute* attr) c_pango_attribute_as_int; ///
  PangoAttrLanguage* function(PangoAttribute* attr) c_pango_attribute_as_language; ///
  PangoAttrShape* function(PangoAttribute* attr) c_pango_attribute_as_shape; ///
  PangoAttrSize* function(PangoAttribute* attr) c_pango_attribute_as_size; ///
  PangoAttrString* function(PangoAttribute* attr) c_pango_attribute_as_string; ///
  PangoAttribute* function(const(PangoAttribute)* attr) c_pango_attribute_copy; ///
  void function(PangoAttribute* attr) c_pango_attribute_destroy; ///
  gboolean function(const(PangoAttribute)* attr1, const(PangoAttribute)* attr2) c_pango_attribute_equal; ///
  void function(PangoAttribute* attr, const(PangoAttrClass)* klass) c_pango_attribute_init; ///

  // Color
  GType function() c_pango_color_get_type; ///
  PangoColor* function(const(PangoColor)* src) c_pango_color_copy; ///
  void function(PangoColor* color) c_pango_color_free; ///
  gboolean function(PangoColor* color, const(char)* spec) c_pango_color_parse; ///
  gboolean function(PangoColor* color, ushort* alpha, const(char)* spec) c_pango_color_parse_with_alpha; ///
  char* function(const(PangoColor)* color) c_pango_color_to_string; ///

  // Context
  GType function() c_pango_context_get_type; ///
  PangoContext* function() c_pango_context_new; ///
  void function(PangoContext* context) c_pango_context_changed; ///
  PangoDirection function(PangoContext* context) c_pango_context_get_base_dir; ///
  PangoGravity function(PangoContext* context) c_pango_context_get_base_gravity; ///
  PangoFontDescription* function(PangoContext* context) c_pango_context_get_font_description; ///
  PangoFontMap* function(PangoContext* context) c_pango_context_get_font_map; ///
  PangoGravity function(PangoContext* context) c_pango_context_get_gravity; ///
  PangoGravityHint function(PangoContext* context) c_pango_context_get_gravity_hint; ///
  PangoLanguage* function(PangoContext* context) c_pango_context_get_language; ///
  const(PangoMatrix)* function(PangoContext* context) c_pango_context_get_matrix; ///
  PangoFontMetrics* function(PangoContext* context, const(PangoFontDescription)* desc, PangoLanguage* language) c_pango_context_get_metrics; ///
  gboolean function(PangoContext* context) c_pango_context_get_round_glyph_positions; ///
  uint function(PangoContext* context) c_pango_context_get_serial; ///
  void function(PangoContext* context, PangoFontFamily*** families, int* nFamilies) c_pango_context_list_families; ///
  PangoFont* function(PangoContext* context, const(PangoFontDescription)* desc) c_pango_context_load_font; ///
  PangoFontset* function(PangoContext* context, const(PangoFontDescription)* desc, PangoLanguage* language) c_pango_context_load_fontset; ///
  void function(PangoContext* context, PangoDirection direction) c_pango_context_set_base_dir; ///
  void function(PangoContext* context, PangoGravity gravity) c_pango_context_set_base_gravity; ///
  void function(PangoContext* context, const(PangoFontDescription)* desc) c_pango_context_set_font_description; ///
  void function(PangoContext* context, PangoFontMap* fontMap) c_pango_context_set_font_map; ///
  void function(PangoContext* context, PangoGravityHint hint) c_pango_context_set_gravity_hint; ///
  void function(PangoContext* context, PangoLanguage* language) c_pango_context_set_language; ///
  void function(PangoContext* context, const(PangoMatrix)* matrix) c_pango_context_set_matrix; ///
  void function(PangoContext* context, gboolean roundPositions) c_pango_context_set_round_glyph_positions; ///

  // Coverage
  GType function() c_pango_coverage_get_type; ///
  PangoCoverage* function() c_pango_coverage_new; ///
  PangoCoverage* function(ubyte* bytes, int nBytes) c_pango_coverage_from_bytes; ///
  PangoCoverage* function(PangoCoverage* coverage) c_pango_coverage_copy; ///
  PangoCoverageLevel function(PangoCoverage* coverage, int index) c_pango_coverage_get; ///
  void function(PangoCoverage* coverage, PangoCoverage* other) c_pango_coverage_max; ///
  PangoCoverage* function(PangoCoverage* coverage) c_pango_coverage_ref; ///
  void function(PangoCoverage* coverage, int index, PangoCoverageLevel level) c_pango_coverage_set; ///
  void function(PangoCoverage* coverage, ubyte** bytes, int* nBytes) c_pango_coverage_to_bytes; ///
  void function(PangoCoverage* coverage) c_pango_coverage_unref; ///

  // Font
  GType function() c_pango_font_get_type; ///
  void function(PangoFontDescription** descs, int nDescs) c_pango_font_descriptions_free; ///
  PangoFont* function(PangoContext* context, GBytes* bytes, GError** _err) c_pango_font_deserialize; ///
  PangoFontDescription* function(PangoFont* font) c_pango_font_describe; ///
  PangoFontDescription* function(PangoFont* font) c_pango_font_describe_with_absolute_size; ///
  PangoCoverage* function(PangoFont* font, PangoLanguage* language) c_pango_font_get_coverage; ///
  PangoFontFace* function(PangoFont* font) c_pango_font_get_face; ///
  void function(PangoFont* font, hb_feature_t* features, uint len, uint* numFeatures) c_pango_font_get_features; ///
  PangoFontMap* function(PangoFont* font) c_pango_font_get_font_map; ///
  void function(PangoFont* font, PangoGlyph glyph, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_font_get_glyph_extents; ///
  hb_font_t* function(PangoFont* font) c_pango_font_get_hb_font; ///
  PangoLanguage** function(PangoFont* font) c_pango_font_get_languages; ///
  PangoFontMetrics* function(PangoFont* font, PangoLanguage* language) c_pango_font_get_metrics; ///
  gboolean function(PangoFont* font, dchar wc) c_pango_font_has_char; ///
  GBytes* function(PangoFont* font) c_pango_font_serialize; ///

  // FontDescription
  GType function() c_pango_font_description_get_type; ///
  PangoFontDescription* function() c_pango_font_description_new; ///
  gboolean function(const(PangoFontDescription)* desc, const(PangoFontDescription)* oldMatch, const(PangoFontDescription)* newMatch) c_pango_font_description_better_match; ///
  PangoFontDescription* function(const(PangoFontDescription)* desc) c_pango_font_description_copy; ///
  PangoFontDescription* function(const(PangoFontDescription)* desc) c_pango_font_description_copy_static; ///
  gboolean function(const(PangoFontDescription)* desc1, const(PangoFontDescription)* desc2) c_pango_font_description_equal; ///
  void function(PangoFontDescription* desc) c_pango_font_description_free; ///
  const(char)* function(const(PangoFontDescription)* desc) c_pango_font_description_get_family; ///
  PangoGravity function(const(PangoFontDescription)* desc) c_pango_font_description_get_gravity; ///
  PangoFontMask function(const(PangoFontDescription)* desc) c_pango_font_description_get_set_fields; ///
  int function(const(PangoFontDescription)* desc) c_pango_font_description_get_size; ///
  gboolean function(const(PangoFontDescription)* desc) c_pango_font_description_get_size_is_absolute; ///
  PangoStretch function(const(PangoFontDescription)* desc) c_pango_font_description_get_stretch; ///
  PangoStyle function(const(PangoFontDescription)* desc) c_pango_font_description_get_style; ///
  PangoVariant function(const(PangoFontDescription)* desc) c_pango_font_description_get_variant; ///
  const(char)* function(const(PangoFontDescription)* desc) c_pango_font_description_get_variations; ///
  PangoWeight function(const(PangoFontDescription)* desc) c_pango_font_description_get_weight; ///
  uint function(const(PangoFontDescription)* desc) c_pango_font_description_hash; ///
  void function(PangoFontDescription* desc, const(PangoFontDescription)* descToMerge, gboolean replaceExisting) c_pango_font_description_merge; ///
  void function(PangoFontDescription* desc, const(PangoFontDescription)* descToMerge, gboolean replaceExisting) c_pango_font_description_merge_static; ///
  void function(PangoFontDescription* desc, double size) c_pango_font_description_set_absolute_size; ///
  void function(PangoFontDescription* desc, const(char)* family) c_pango_font_description_set_family; ///
  void function(PangoFontDescription* desc, const(char)* family) c_pango_font_description_set_family_static; ///
  void function(PangoFontDescription* desc, PangoGravity gravity) c_pango_font_description_set_gravity; ///
  void function(PangoFontDescription* desc, int size) c_pango_font_description_set_size; ///
  void function(PangoFontDescription* desc, PangoStretch stretch) c_pango_font_description_set_stretch; ///
  void function(PangoFontDescription* desc, PangoStyle style) c_pango_font_description_set_style; ///
  void function(PangoFontDescription* desc, PangoVariant variant) c_pango_font_description_set_variant; ///
  void function(PangoFontDescription* desc, const(char)* variations) c_pango_font_description_set_variations; ///
  void function(PangoFontDescription* desc, const(char)* variations) c_pango_font_description_set_variations_static; ///
  void function(PangoFontDescription* desc, PangoWeight weight) c_pango_font_description_set_weight; ///
  char* function(const(PangoFontDescription)* desc) c_pango_font_description_to_filename; ///
  char* function(const(PangoFontDescription)* desc) c_pango_font_description_to_string; ///
  void function(PangoFontDescription* desc, PangoFontMask toUnset) c_pango_font_description_unset_fields; ///
  PangoFontDescription* function(const(char)* str) c_pango_font_description_from_string; ///

  // FontFace
  GType function() c_pango_font_face_get_type; ///
  PangoFontDescription* function(PangoFontFace* face) c_pango_font_face_describe; ///
  const(char)* function(PangoFontFace* face) c_pango_font_face_get_face_name; ///
  PangoFontFamily* function(PangoFontFace* face) c_pango_font_face_get_family; ///
  gboolean function(PangoFontFace* face) c_pango_font_face_is_synthesized; ///
  void function(PangoFontFace* face, int** sizes, int* nSizes) c_pango_font_face_list_sizes; ///

  // FontFamily
  GType function() c_pango_font_family_get_type; ///
  PangoFontFace* function(PangoFontFamily* family, const(char)* name) c_pango_font_family_get_face; ///
  const(char)* function(PangoFontFamily* family) c_pango_font_family_get_name; ///
  gboolean function(PangoFontFamily* family) c_pango_font_family_is_monospace; ///
  gboolean function(PangoFontFamily* family) c_pango_font_family_is_variable; ///
  void function(PangoFontFamily* family, PangoFontFace*** faces, int* nFaces) c_pango_font_family_list_faces; ///

  // FontMap
  GType function() c_pango_font_map_get_type; ///
  void function(PangoFontMap* fontmap) c_pango_font_map_changed; ///
  PangoContext* function(PangoFontMap* fontmap) c_pango_font_map_create_context; ///
  PangoFontFamily* function(PangoFontMap* fontmap, const(char)* name) c_pango_font_map_get_family; ///
  uint function(PangoFontMap* fontmap) c_pango_font_map_get_serial; ///
  void function(PangoFontMap* fontmap, PangoFontFamily*** families, int* nFamilies) c_pango_font_map_list_families; ///
  PangoFont* function(PangoFontMap* fontmap, PangoContext* context, const(PangoFontDescription)* desc) c_pango_font_map_load_font; ///
  PangoFontset* function(PangoFontMap* fontmap, PangoContext* context, const(PangoFontDescription)* desc, PangoLanguage* language) c_pango_font_map_load_fontset; ///
  PangoFont* function(PangoFontMap* fontmap, PangoFont* font, double scale, PangoContext* context, const(char)* variations) c_pango_font_map_reload_font; ///

  // FontMetrics
  GType function() c_pango_font_metrics_get_type; ///
  int function(PangoFontMetrics* metrics) c_pango_font_metrics_get_approximate_char_width; ///
  int function(PangoFontMetrics* metrics) c_pango_font_metrics_get_approximate_digit_width; ///
  int function(PangoFontMetrics* metrics) c_pango_font_metrics_get_ascent; ///
  int function(PangoFontMetrics* metrics) c_pango_font_metrics_get_descent; ///
  int function(PangoFontMetrics* metrics) c_pango_font_metrics_get_height; ///
  int function(PangoFontMetrics* metrics) c_pango_font_metrics_get_strikethrough_position; ///
  int function(PangoFontMetrics* metrics) c_pango_font_metrics_get_strikethrough_thickness; ///
  int function(PangoFontMetrics* metrics) c_pango_font_metrics_get_underline_position; ///
  int function(PangoFontMetrics* metrics) c_pango_font_metrics_get_underline_thickness; ///
  PangoFontMetrics* function(PangoFontMetrics* metrics) c_pango_font_metrics_ref; ///
  void function(PangoFontMetrics* metrics) c_pango_font_metrics_unref; ///

  // Fontset
  GType function() c_pango_fontset_get_type; ///
  void function(PangoFontset* fontset, PangoFontsetForeachFunc func, void* data) c_pango_fontset_foreach; ///
  PangoFont* function(PangoFontset* fontset, uint wc) c_pango_fontset_get_font; ///
  PangoFontMetrics* function(PangoFontset* fontset) c_pango_fontset_get_metrics; ///

  // FontsetSimple
  GType function() c_pango_fontset_simple_get_type; ///
  PangoFontsetSimple* function(PangoLanguage* language) c_pango_fontset_simple_new; ///
  void function(PangoFontsetSimple* fontset, PangoFont* font) c_pango_fontset_simple_append; ///
  int function(PangoFontsetSimple* fontset) c_pango_fontset_simple_size; ///

  // GlyphItem
  GType function() c_pango_glyph_item_get_type; ///
  GSList* function(PangoGlyphItem* glyphItem, const(char)* text, PangoAttrList* list) c_pango_glyph_item_apply_attrs; ///
  PangoGlyphItem* function(PangoGlyphItem* orig) c_pango_glyph_item_copy; ///
  void function(PangoGlyphItem* glyphItem) c_pango_glyph_item_free; ///
  void function(PangoGlyphItem* glyphItem, const(char)* text, int* logicalWidths) c_pango_glyph_item_get_logical_widths; ///
  void function(PangoGlyphItem* glyphItem, const(char)* text, PangoLogAttr* logAttrs, int letterSpacing) c_pango_glyph_item_letter_space; ///
  PangoGlyphItem* function(PangoGlyphItem* orig, const(char)* text, int splitIndex) c_pango_glyph_item_split; ///

  // GlyphItemIter
  GType function() c_pango_glyph_item_iter_get_type; ///
  PangoGlyphItemIter* function(PangoGlyphItemIter* orig) c_pango_glyph_item_iter_copy; ///
  void function(PangoGlyphItemIter* iter) c_pango_glyph_item_iter_free; ///
  gboolean function(PangoGlyphItemIter* iter, PangoGlyphItem* glyphItem, const(char)* text) c_pango_glyph_item_iter_init_end; ///
  gboolean function(PangoGlyphItemIter* iter, PangoGlyphItem* glyphItem, const(char)* text) c_pango_glyph_item_iter_init_start; ///
  gboolean function(PangoGlyphItemIter* iter) c_pango_glyph_item_iter_next_cluster; ///
  gboolean function(PangoGlyphItemIter* iter) c_pango_glyph_item_iter_prev_cluster; ///

  // GlyphString
  GType function() c_pango_glyph_string_get_type; ///
  PangoGlyphString* function() c_pango_glyph_string_new; ///
  PangoGlyphString* function(PangoGlyphString* string_) c_pango_glyph_string_copy; ///
  void function(PangoGlyphString* glyphs, PangoFont* font, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_glyph_string_extents; ///
  void function(PangoGlyphString* glyphs, int start, int end, PangoFont* font, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_glyph_string_extents_range; ///
  void function(PangoGlyphString* string_) c_pango_glyph_string_free; ///
  void function(PangoGlyphString* glyphs, const(char)* text, int length, int embeddingLevel, int* logicalWidths) c_pango_glyph_string_get_logical_widths; ///
  int function(PangoGlyphString* glyphs) c_pango_glyph_string_get_width; ///
  void function(PangoGlyphString* glyphs, const(char)* text, int length, PangoAnalysis* analysis, int index, gboolean trailing, int* xPos) c_pango_glyph_string_index_to_x; ///
  void function(PangoGlyphString* glyphs, const(char)* text, int length, PangoAnalysis* analysis, PangoLogAttr* attrs, int index, gboolean trailing, int* xPos) c_pango_glyph_string_index_to_x_full; ///
  void function(PangoGlyphString* string_, int newLen) c_pango_glyph_string_set_size; ///
  void function(PangoGlyphString* glyphs, const(char)* text, int length, PangoAnalysis* analysis, int xPos, int* index, int* trailing) c_pango_glyph_string_x_to_index; ///

  // Item
  GType function() c_pango_item_get_type; ///
  PangoItem* function() c_pango_item_new; ///
  void function(PangoItem* item, PangoAttrIterator* iter) c_pango_item_apply_attrs; ///
  PangoItem* function(PangoItem* item) c_pango_item_copy; ///
  void function(PangoItem* item) c_pango_item_free; ///
  PangoItem* function(PangoItem* orig, int splitIndex, int splitOffset) c_pango_item_split; ///

  // Language
  GType function() c_pango_language_get_type; ///
  const(char)* function(PangoLanguage* language) c_pango_language_get_sample_string; ///
  const(PangoScript)* function(PangoLanguage* language, int* numScripts) c_pango_language_get_scripts; ///
  gboolean function(PangoLanguage* language, PangoScript script) c_pango_language_includes_script; ///
  gboolean function(PangoLanguage* language, const(char)* rangeList) c_pango_language_matches; ///
  const(char)* function(PangoLanguage* language) c_pango_language_to_string; ///
  PangoLanguage* function(const(char)* language) c_pango_language_from_string; ///
  PangoLanguage* function() c_pango_language_get_default; ///
  PangoLanguage** function() c_pango_language_get_preferred; ///

  // Layout
  GType function() c_pango_layout_get_type; ///
  PangoLayout* function(PangoContext* context) c_pango_layout_new; ///
  PangoLayout* function(PangoContext* context, GBytes* bytes, PangoLayoutDeserializeFlags flags, GError** _err) c_pango_layout_deserialize; ///
  void function(PangoLayout* layout) c_pango_layout_context_changed; ///
  PangoLayout* function(PangoLayout* src) c_pango_layout_copy; ///
  PangoAlignment function(PangoLayout* layout) c_pango_layout_get_alignment; ///
  PangoAttrList* function(PangoLayout* layout) c_pango_layout_get_attributes; ///
  gboolean function(PangoLayout* layout) c_pango_layout_get_auto_dir; ///
  int function(PangoLayout* layout) c_pango_layout_get_baseline; ///
  void function(PangoLayout* layout, int index, PangoRectangle* strongPos, PangoRectangle* weakPos) c_pango_layout_get_caret_pos; ///
  int function(PangoLayout* layout) c_pango_layout_get_character_count; ///
  PangoContext* function(PangoLayout* layout) c_pango_layout_get_context; ///
  void function(PangoLayout* layout, int index, PangoRectangle* strongPos, PangoRectangle* weakPos) c_pango_layout_get_cursor_pos; ///
  PangoDirection function(PangoLayout* layout, int index) c_pango_layout_get_direction; ///
  PangoEllipsizeMode function(PangoLayout* layout) c_pango_layout_get_ellipsize; ///
  void function(PangoLayout* layout, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_layout_get_extents; ///
  const(PangoFontDescription)* function(PangoLayout* layout) c_pango_layout_get_font_description; ///
  int function(PangoLayout* layout) c_pango_layout_get_height; ///
  int function(PangoLayout* layout) c_pango_layout_get_indent; ///
  PangoLayoutIter* function(PangoLayout* layout) c_pango_layout_get_iter; ///
  gboolean function(PangoLayout* layout) c_pango_layout_get_justify; ///
  gboolean function(PangoLayout* layout) c_pango_layout_get_justify_last_line; ///
  PangoLayoutLine* function(PangoLayout* layout, int line) c_pango_layout_get_line; ///
  int function(PangoLayout* layout) c_pango_layout_get_line_count; ///
  PangoLayoutLine* function(PangoLayout* layout, int line) c_pango_layout_get_line_readonly; ///
  float function(PangoLayout* layout) c_pango_layout_get_line_spacing; ///
  GSList* function(PangoLayout* layout) c_pango_layout_get_lines; ///
  GSList* function(PangoLayout* layout) c_pango_layout_get_lines_readonly; ///
  void function(PangoLayout* layout, PangoLogAttr** attrs, int* nAttrs) c_pango_layout_get_log_attrs; ///
  const(PangoLogAttr)* function(PangoLayout* layout, int* nAttrs) c_pango_layout_get_log_attrs_readonly; ///
  void function(PangoLayout* layout, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_layout_get_pixel_extents; ///
  void function(PangoLayout* layout, int* width, int* height) c_pango_layout_get_pixel_size; ///
  uint function(PangoLayout* layout) c_pango_layout_get_serial; ///
  gboolean function(PangoLayout* layout) c_pango_layout_get_single_paragraph_mode; ///
  void function(PangoLayout* layout, int* width, int* height) c_pango_layout_get_size; ///
  int function(PangoLayout* layout) c_pango_layout_get_spacing; ///
  PangoTabArray* function(PangoLayout* layout) c_pango_layout_get_tabs; ///
  const(char)* function(PangoLayout* layout) c_pango_layout_get_text; ///
  int function(PangoLayout* layout) c_pango_layout_get_unknown_glyphs_count; ///
  int function(PangoLayout* layout) c_pango_layout_get_width; ///
  PangoWrapMode function(PangoLayout* layout) c_pango_layout_get_wrap; ///
  void function(PangoLayout* layout, int index, gboolean trailing, int* line, int* xPos) c_pango_layout_index_to_line_x; ///
  void function(PangoLayout* layout, int index, PangoRectangle* pos) c_pango_layout_index_to_pos; ///
  gboolean function(PangoLayout* layout) c_pango_layout_is_ellipsized; ///
  gboolean function(PangoLayout* layout) c_pango_layout_is_wrapped; ///
  void function(PangoLayout* layout, gboolean strong, int oldIndex, int oldTrailing, int direction, int* newIndex, int* newTrailing) c_pango_layout_move_cursor_visually; ///
  GBytes* function(PangoLayout* layout, PangoLayoutSerializeFlags flags) c_pango_layout_serialize; ///
  void function(PangoLayout* layout, PangoAlignment alignment) c_pango_layout_set_alignment; ///
  void function(PangoLayout* layout, PangoAttrList* attrs) c_pango_layout_set_attributes; ///
  void function(PangoLayout* layout, gboolean autoDir) c_pango_layout_set_auto_dir; ///
  void function(PangoLayout* layout, PangoEllipsizeMode ellipsize) c_pango_layout_set_ellipsize; ///
  void function(PangoLayout* layout, const(PangoFontDescription)* desc) c_pango_layout_set_font_description; ///
  void function(PangoLayout* layout, int height) c_pango_layout_set_height; ///
  void function(PangoLayout* layout, int indent) c_pango_layout_set_indent; ///
  void function(PangoLayout* layout, gboolean justify) c_pango_layout_set_justify; ///
  void function(PangoLayout* layout, gboolean justify) c_pango_layout_set_justify_last_line; ///
  void function(PangoLayout* layout, float factor) c_pango_layout_set_line_spacing; ///
  void function(PangoLayout* layout, const(char)* markup, int length) c_pango_layout_set_markup; ///
  void function(PangoLayout* layout, const(char)* markup, int length, dchar accelMarker, dchar* accelChar) c_pango_layout_set_markup_with_accel; ///
  void function(PangoLayout* layout, gboolean setting) c_pango_layout_set_single_paragraph_mode; ///
  void function(PangoLayout* layout, int spacing) c_pango_layout_set_spacing; ///
  void function(PangoLayout* layout, PangoTabArray* tabs) c_pango_layout_set_tabs; ///
  void function(PangoLayout* layout, char* text, int length) c_pango_layout_set_text; ///
  void function(PangoLayout* layout, int width) c_pango_layout_set_width; ///
  void function(PangoLayout* layout, PangoWrapMode wrap) c_pango_layout_set_wrap; ///
  gboolean function(PangoLayout* layout, PangoLayoutSerializeFlags flags, const(char)* filename, GError** _err) c_pango_layout_write_to_file; ///
  gboolean function(PangoLayout* layout, int x, int y, int* index, int* trailing) c_pango_layout_xy_to_index; ///

  // LayoutIter
  GType function() c_pango_layout_iter_get_type; ///
  gboolean function(PangoLayoutIter* iter) c_pango_layout_iter_at_last_line; ///
  PangoLayoutIter* function(PangoLayoutIter* iter) c_pango_layout_iter_copy; ///
  void function(PangoLayoutIter* iter) c_pango_layout_iter_free; ///
  int function(PangoLayoutIter* iter) c_pango_layout_iter_get_baseline; ///
  void function(PangoLayoutIter* iter, PangoRectangle* logicalRect) c_pango_layout_iter_get_char_extents; ///
  void function(PangoLayoutIter* iter, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_layout_iter_get_cluster_extents; ///
  int function(PangoLayoutIter* iter) c_pango_layout_iter_get_index; ///
  PangoLayout* function(PangoLayoutIter* iter) c_pango_layout_iter_get_layout; ///
  void function(PangoLayoutIter* iter, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_layout_iter_get_layout_extents; ///
  PangoLayoutLine* function(PangoLayoutIter* iter) c_pango_layout_iter_get_line; ///
  void function(PangoLayoutIter* iter, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_layout_iter_get_line_extents; ///
  PangoLayoutLine* function(PangoLayoutIter* iter) c_pango_layout_iter_get_line_readonly; ///
  void function(PangoLayoutIter* iter, int* y0, int* y1) c_pango_layout_iter_get_line_yrange; ///
  PangoLayoutRun* function(PangoLayoutIter* iter) c_pango_layout_iter_get_run; ///
  int function(PangoLayoutIter* iter) c_pango_layout_iter_get_run_baseline; ///
  void function(PangoLayoutIter* iter, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_layout_iter_get_run_extents; ///
  PangoLayoutRun* function(PangoLayoutIter* iter) c_pango_layout_iter_get_run_readonly; ///
  gboolean function(PangoLayoutIter* iter) c_pango_layout_iter_next_char; ///
  gboolean function(PangoLayoutIter* iter) c_pango_layout_iter_next_cluster; ///
  gboolean function(PangoLayoutIter* iter) c_pango_layout_iter_next_line; ///
  gboolean function(PangoLayoutIter* iter) c_pango_layout_iter_next_run; ///

  // LayoutLine
  GType function() c_pango_layout_line_get_type; ///
  void function(PangoLayoutLine* line, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_layout_line_get_extents; ///
  void function(PangoLayoutLine* line, int* height) c_pango_layout_line_get_height; ///
  int function(PangoLayoutLine* line) c_pango_layout_line_get_length; ///
  void function(PangoLayoutLine* layoutLine, PangoRectangle* inkRect, PangoRectangle* logicalRect) c_pango_layout_line_get_pixel_extents; ///
  PangoDirection function(PangoLayoutLine* line) c_pango_layout_line_get_resolved_direction; ///
  int function(PangoLayoutLine* line) c_pango_layout_line_get_start_index; ///
  void function(PangoLayoutLine* line, int startIndex, int endIndex, int** ranges, int* nRanges) c_pango_layout_line_get_x_ranges; ///
  void function(PangoLayoutLine* line, int index, gboolean trailing, int* xPos) c_pango_layout_line_index_to_x; ///
  gboolean function(PangoLayoutLine* line) c_pango_layout_line_is_paragraph_start; ///
  PangoLayoutLine* function(PangoLayoutLine* line) c_pango_layout_line_ref; ///
  void function(PangoLayoutLine* line) c_pango_layout_line_unref; ///
  gboolean function(PangoLayoutLine* line, int xPos, int* index, int* trailing) c_pango_layout_line_x_to_index; ///

  // Matrix
  GType function() c_pango_matrix_get_type; ///
  void function(PangoMatrix* matrix, const(PangoMatrix)* newMatrix) c_pango_matrix_concat; ///
  PangoMatrix* function(const(PangoMatrix)* matrix) c_pango_matrix_copy; ///
  void function(PangoMatrix* matrix) c_pango_matrix_free; ///
  double function(const(PangoMatrix)* matrix) c_pango_matrix_get_font_scale_factor; ///
  void function(const(PangoMatrix)* matrix, double* xscale, double* yscale) c_pango_matrix_get_font_scale_factors; ///
  double function(const(PangoMatrix)* matrix) c_pango_matrix_get_slant_ratio; ///
  void function(PangoMatrix* matrix, double degrees) c_pango_matrix_rotate; ///
  void function(PangoMatrix* matrix, double scaleX, double scaleY) c_pango_matrix_scale; ///
  void function(const(PangoMatrix)* matrix, double* dx, double* dy) c_pango_matrix_transform_distance; ///
  void function(const(PangoMatrix)* matrix, PangoRectangle* rect) c_pango_matrix_transform_pixel_rectangle; ///
  void function(const(PangoMatrix)* matrix, double* x, double* y) c_pango_matrix_transform_point; ///
  void function(const(PangoMatrix)* matrix, PangoRectangle* rect) c_pango_matrix_transform_rectangle; ///
  void function(PangoMatrix* matrix, double tx, double ty) c_pango_matrix_translate; ///

  // Renderer
  GType function() c_pango_renderer_get_type; ///
  void function(PangoRenderer* renderer) c_pango_renderer_activate; ///
  void function(PangoRenderer* renderer) c_pango_renderer_deactivate; ///
  void function(PangoRenderer* renderer, int x, int y, int width, int height) c_pango_renderer_draw_error_underline; ///
  void function(PangoRenderer* renderer, PangoFont* font, PangoGlyph glyph, double x, double y) c_pango_renderer_draw_glyph; ///
  void function(PangoRenderer* renderer, const(char)* text, PangoGlyphItem* glyphItem, int x, int y) c_pango_renderer_draw_glyph_item; ///
  void function(PangoRenderer* renderer, PangoFont* font, PangoGlyphString* glyphs, int x, int y) c_pango_renderer_draw_glyphs; ///
  void function(PangoRenderer* renderer, PangoLayout* layout, int x, int y) c_pango_renderer_draw_layout; ///
  void function(PangoRenderer* renderer, PangoLayoutLine* line, int x, int y) c_pango_renderer_draw_layout_line; ///
  void function(PangoRenderer* renderer, PangoRenderPart part, int x, int y, int width, int height) c_pango_renderer_draw_rectangle; ///
  void function(PangoRenderer* renderer, PangoRenderPart part, double y1, double x11, double x21, double y2, double x12, double x22) c_pango_renderer_draw_trapezoid; ///
  ushort function(PangoRenderer* renderer, PangoRenderPart part) c_pango_renderer_get_alpha; ///
  PangoColor* function(PangoRenderer* renderer, PangoRenderPart part) c_pango_renderer_get_color; ///
  PangoLayout* function(PangoRenderer* renderer) c_pango_renderer_get_layout; ///
  PangoLayoutLine* function(PangoRenderer* renderer) c_pango_renderer_get_layout_line; ///
  const(PangoMatrix)* function(PangoRenderer* renderer) c_pango_renderer_get_matrix; ///
  void function(PangoRenderer* renderer, PangoRenderPart part) c_pango_renderer_part_changed; ///
  void function(PangoRenderer* renderer, PangoRenderPart part, ushort alpha) c_pango_renderer_set_alpha; ///
  void function(PangoRenderer* renderer, PangoRenderPart part, const(PangoColor)* color) c_pango_renderer_set_color; ///
  void function(PangoRenderer* renderer, const(PangoMatrix)* matrix) c_pango_renderer_set_matrix; ///

  // ScriptIter
  GType function() c_pango_script_iter_get_type; ///
  PangoScriptIter* function(const(char)* text, int length) c_pango_script_iter_new; ///
  void function(PangoScriptIter* iter) c_pango_script_iter_free; ///
  void function(PangoScriptIter* iter, const(char*)* start, const(char*)* end, PangoScript* script) c_pango_script_iter_get_range; ///
  gboolean function(PangoScriptIter* iter) c_pango_script_iter_next; ///

  // TabArray
  GType function() c_pango_tab_array_get_type; ///
  PangoTabArray* function(int initialSize, gboolean positionsInPixels) c_pango_tab_array_new; ///
  PangoTabArray* function(int size, gboolean positionsInPixels, PangoTabAlign firstAlignment, int firstPosition,  ...) c_pango_tab_array_new_with_positions; ///
  PangoTabArray* function(PangoTabArray* src) c_pango_tab_array_copy; ///
  void function(PangoTabArray* tabArray) c_pango_tab_array_free; ///
  dchar function(PangoTabArray* tabArray, int tabIndex) c_pango_tab_array_get_decimal_point; ///
  gboolean function(PangoTabArray* tabArray) c_pango_tab_array_get_positions_in_pixels; ///
  int function(PangoTabArray* tabArray) c_pango_tab_array_get_size; ///
  void function(PangoTabArray* tabArray, int tabIndex, PangoTabAlign* alignment, int* location) c_pango_tab_array_get_tab; ///
  void function(PangoTabArray* tabArray, PangoTabAlign** alignments, int** locations) c_pango_tab_array_get_tabs; ///
  void function(PangoTabArray* tabArray, int newSize) c_pango_tab_array_resize; ///
  void function(PangoTabArray* tabArray, int tabIndex, dchar decimalPoint) c_pango_tab_array_set_decimal_point; ///
  void function(PangoTabArray* tabArray, gboolean positionsInPixels) c_pango_tab_array_set_positions_in_pixels; ///
  void function(PangoTabArray* tabArray, int tabIndex, PangoTabAlign alignment, int location) c_pango_tab_array_set_tab; ///
  void function(PangoTabArray* tabArray) c_pango_tab_array_sort; ///
  char* function(PangoTabArray* tabArray) c_pango_tab_array_to_string; ///
  PangoTabArray* function(const(char)* text) c_pango_tab_array_from_string; ///

  // global
  PangoAttribute* function(gboolean allowBreaks) c_pango_attr_allow_breaks_new; ///
  PangoAttribute* function(ushort alpha) c_pango_attr_background_alpha_new; ///
  PangoAttribute* function(ushort red, ushort green, ushort blue) c_pango_attr_background_new; ///
  PangoAttribute* function(int shift) c_pango_attr_baseline_shift_new; ///
  void function(const(char)* text, int length, PangoAttrList* attrList, int offset, PangoLogAttr* attrs, int attrsLen) c_pango_attr_break; ///
  PangoAttribute* function(gboolean enableFallback) c_pango_attr_fallback_new; ///
  PangoAttribute* function(const(char)* family) c_pango_attr_family_new; ///
  PangoAttribute* function(PangoFontScale scale) c_pango_attr_font_scale_new; ///
  PangoAttribute* function(ushort alpha) c_pango_attr_foreground_alpha_new; ///
  PangoAttribute* function(ushort red, ushort green, ushort blue) c_pango_attr_foreground_new; ///
  PangoAttribute* function(PangoGravityHint hint) c_pango_attr_gravity_hint_new; ///
  PangoAttribute* function(PangoGravity gravity) c_pango_attr_gravity_new; ///
  PangoAttribute* function(gboolean insertHyphens) c_pango_attr_insert_hyphens_new; ///
  PangoAttribute* function(int letterSpacing) c_pango_attr_letter_spacing_new; ///
  PangoAttribute* function(double factor) c_pango_attr_line_height_new; ///
  PangoAttribute* function(int height) c_pango_attr_line_height_new_absolute; ///
  PangoAttribute* function(ushort red, ushort green, ushort blue) c_pango_attr_overline_color_new; ///
  PangoAttribute* function(PangoOverline overline) c_pango_attr_overline_new; ///
  PangoAttribute* function(int rise) c_pango_attr_rise_new; ///
  PangoAttribute* function(double scaleFactor) c_pango_attr_scale_new; ///
  PangoAttribute* function() c_pango_attr_sentence_new; ///
  PangoAttribute* function(PangoShowFlags flags) c_pango_attr_show_new; ///
  PangoAttribute* function(PangoStretch stretch) c_pango_attr_stretch_new; ///
  PangoAttribute* function(ushort red, ushort green, ushort blue) c_pango_attr_strikethrough_color_new; ///
  PangoAttribute* function(gboolean strikethrough) c_pango_attr_strikethrough_new; ///
  PangoAttribute* function(PangoStyle style) c_pango_attr_style_new; ///
  PangoAttribute* function(PangoTextTransform transform) c_pango_attr_text_transform_new; ///
  PangoAttribute* function(ushort red, ushort green, ushort blue) c_pango_attr_underline_color_new; ///
  PangoAttribute* function(PangoUnderline underline) c_pango_attr_underline_new; ///
  PangoAttribute* function(PangoVariant variant) c_pango_attr_variant_new; ///
  PangoAttribute* function(PangoWeight weight) c_pango_attr_weight_new; ///
  PangoAttribute* function() c_pango_attr_word_new; ///
  void function(const(char)* text, int length, PangoAnalysis* analysis, PangoLogAttr* attrs, int attrsLen) c_pango_break; ///
  void function(const(char)* text, int length, PangoAnalysis* analysis, PangoLogAttr* attrs, int attrsLen) c_pango_default_break; ///
  void function(PangoRectangle* inclusive, PangoRectangle* nearest) c_pango_extents_to_pixels; ///
  PangoDirection function(const(char)* text, int length) c_pango_find_base_dir; ///
  void function(const(char)* text, int length, int* paragraphDelimiterIndex, int* nextParagraphStart) c_pango_find_paragraph_boundary; ///
  void function(const(char)* text, int length, int level, PangoLanguage* language, PangoLogAttr* attrs, int attrsLen) c_pango_get_log_attrs; ///
  gboolean function(dchar ch, dchar* mirroredCh) c_pango_get_mirror_char; ///
  gboolean function(dchar ch) c_pango_is_zero_width; ///
  GList* function(PangoContext* context, const(char)* text, int startIndex, int length, PangoAttrList* attrs, PangoAttrIterator* cachedIter) c_pango_itemize; ///
  GList* function(PangoContext* context, PangoDirection baseDir, const(char)* text, int startIndex, int length, PangoAttrList* attrs, PangoAttrIterator* cachedIter) c_pango_itemize_with_base_dir; ///
  ubyte* function(const(char)* text, int length, PangoDirection* pbaseDir) c_pango_log2vis_get_embedding_levels; ///
  gboolean function(GMarkupParseContext* context, PangoAttrList** attrList, char** text, dchar* accelChar, GError** _err) c_pango_markup_parser_finish; ///
  GMarkupParseContext* function(dchar accelMarker) c_pango_markup_parser_new; ///
  gboolean function(GType type, const(char)* str, int* value, gboolean warn, char** possibleValues) c_pango_parse_enum; ///
  gboolean function(const(char)* markupText, int length, dchar accelMarker, PangoAttrList** attrList, char** text, dchar* accelChar, GError** _err) c_pango_parse_markup; ///
  gboolean function(const(char)* str, PangoStretch* stretch, gboolean warn) c_pango_parse_stretch; ///
  gboolean function(const(char)* str, PangoStyle* style, gboolean warn) c_pango_parse_style; ///
  gboolean function(const(char)* str, PangoVariant* variant, gboolean warn) c_pango_parse_variant; ///
  gboolean function(const(char)* str, PangoWeight* weight, gboolean warn) c_pango_parse_weight; ///
  void function(int* thickness, int* position) c_pango_quantize_line_geometry; ///
  int function(void* stream, GString* str) c_pango_read_line; ///
  GList* function(GList* items) c_pango_reorder_items; ///
  gboolean function(const(char*)* pos, int* out_) c_pango_scan_int; ///
  gboolean function(const(char*)* pos, GString* out_) c_pango_scan_string; ///
  gboolean function(const(char*)* pos, GString* out_) c_pango_scan_word; ///
  void function(const(char)* text, int length, const(PangoAnalysis)* analysis, PangoGlyphString* glyphs) c_pango_shape; ///
  void function(const(char)* itemText, int itemLength, const(char)* paragraphText, int paragraphLength, const(PangoAnalysis)* analysis, PangoGlyphString* glyphs) c_pango_shape_full; ///
  void function(PangoItem* item, const(char)* paragraphText, int paragraphLength, PangoLogAttr* logAttrs, PangoGlyphString* glyphs, PangoShapeFlags flags) c_pango_shape_item; ///
  void function(const(char)* itemText, int itemLength, const(char)* paragraphText, int paragraphLength, const(PangoAnalysis)* analysis, PangoGlyphString* glyphs, PangoShapeFlags flags) c_pango_shape_with_flags; ///
  gboolean function(const(char*)* pos) c_pango_skip_space; ///
  char** function(const(char)* str) c_pango_split_file_list; ///
  void function(const(char)* text, int length, PangoAnalysis* analysis, int offset, PangoLogAttr* attrs, int attrsLen) c_pango_tailor_break; ///
  char* function(const(char)* str) c_pango_trim_string; ///
  PangoDirection function(dchar ch) c_pango_unichar_direction; ///
  int function(double d) c_pango_units_from_double; ///
  double function(int i) c_pango_units_to_double; ///
  int function() c_pango_version; ///
  const(char)* function(int requiredMajor, int requiredMinor, int requiredMicro) c_pango_version_check; ///
  const(char)* function() c_pango_version_string; ///

  // AttrType
  const(char)* function(PangoAttrType type) c_pango_attr_type_get_name; ///
  PangoAttrType function(const(char)* name) c_pango_attr_type_register; ///

  // BidiType
  PangoBidiType function(dchar ch) c_pango_bidi_type_for_unichar; ///

  // Gravity
  PangoGravity function(const(PangoMatrix)* matrix) c_pango_gravity_get_for_matrix; ///
  PangoGravity function(PangoScript script, PangoGravity baseGravity, PangoGravityHint hint) c_pango_gravity_get_for_script; ///
  PangoGravity function(PangoScript script, gboolean wide, PangoGravity baseGravity, PangoGravityHint hint) c_pango_gravity_get_for_script_and_width; ///
  double function(PangoGravity gravity) c_pango_gravity_to_rotation; ///

  // LayoutDeserializeError
  GQuark function() c_pango_layout_deserialize_error_quark; ///

  // Script
  PangoScript function(dchar ch) c_pango_script_for_unichar; ///
  PangoLanguage* function(PangoScript script) c_pango_script_get_sample_language; ///
}

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
alias pango_font_description_get_family = c_pango_font_description_get_family;

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
alias pango_font_description_set_family = c_pango_font_description_set_family;

/** */
alias pango_font_description_set_family_static = c_pango_font_description_set_family_static;

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
  gidLink(cast(void**)&pango_font_description_get_family, "pango_font_description_get_family", libs);
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
  gidLink(cast(void**)&pango_font_description_set_family, "pango_font_description_set_family", libs);
  gidLink(cast(void**)&pango_font_description_set_family_static, "pango_font_description_set_family_static", libs);
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
