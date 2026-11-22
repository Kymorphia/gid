/// C functions for json1 library
module gid.json1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.json1.c.types;
static import gid.json1.c._gidlib_Json;
public import gid.gio2.c.types;
public import gid.gobject2.c.types;

private immutable LIBS = ["json-glib-1.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.json1.c._gidlib_Json.gidLibLinked;

// Array
private alias c_json_array_get_typeFn = extern(C) GType function() nothrow;
__gshared c_json_array_get_typeFn c_json_array_get_type; ///
private alias c_json_array_newFn = extern(C) JsonArray* function() nothrow;
__gshared c_json_array_newFn c_json_array_new; ///
private alias c_json_array_sized_newFn = extern(C) JsonArray* function(uint nElements) nothrow;
__gshared c_json_array_sized_newFn c_json_array_sized_new; ///
private alias c_json_array_add_array_elementFn = extern(C) void function(JsonArray* array, JsonArray* value) nothrow;
__gshared c_json_array_add_array_elementFn c_json_array_add_array_element; ///
private alias c_json_array_add_boolean_elementFn = extern(C) void function(JsonArray* array, gboolean value) nothrow;
__gshared c_json_array_add_boolean_elementFn c_json_array_add_boolean_element; ///
private alias c_json_array_add_double_elementFn = extern(C) void function(JsonArray* array, double value) nothrow;
__gshared c_json_array_add_double_elementFn c_json_array_add_double_element; ///
private alias c_json_array_add_elementFn = extern(C) void function(JsonArray* array, JsonNode* node) nothrow;
__gshared c_json_array_add_elementFn c_json_array_add_element; ///
private alias c_json_array_add_int_elementFn = extern(C) void function(JsonArray* array, long value) nothrow;
__gshared c_json_array_add_int_elementFn c_json_array_add_int_element; ///
private alias c_json_array_add_null_elementFn = extern(C) void function(JsonArray* array) nothrow;
__gshared c_json_array_add_null_elementFn c_json_array_add_null_element; ///
private alias c_json_array_add_object_elementFn = extern(C) void function(JsonArray* array, JsonObject* value) nothrow;
__gshared c_json_array_add_object_elementFn c_json_array_add_object_element; ///
private alias c_json_array_add_string_elementFn = extern(C) void function(JsonArray* array, const(char)* value) nothrow;
__gshared c_json_array_add_string_elementFn c_json_array_add_string_element; ///
private alias c_json_array_dup_elementFn = extern(C) JsonNode* function(JsonArray* array, uint index) nothrow;
__gshared c_json_array_dup_elementFn c_json_array_dup_element; ///
private alias c_json_array_equalFn = extern(C) gboolean function(JsonArray* a, JsonArray* b) nothrow;
__gshared c_json_array_equalFn c_json_array_equal; ///
private alias c_json_array_foreach_elementFn = extern(C) void function(JsonArray* array, JsonArrayForeach func, void* data) nothrow;
__gshared c_json_array_foreach_elementFn c_json_array_foreach_element; ///
private alias c_json_array_get_array_elementFn = extern(C) JsonArray* function(JsonArray* array, uint index) nothrow;
__gshared c_json_array_get_array_elementFn c_json_array_get_array_element; ///
private alias c_json_array_get_boolean_elementFn = extern(C) gboolean function(JsonArray* array, uint index) nothrow;
__gshared c_json_array_get_boolean_elementFn c_json_array_get_boolean_element; ///
private alias c_json_array_get_double_elementFn = extern(C) double function(JsonArray* array, uint index) nothrow;
__gshared c_json_array_get_double_elementFn c_json_array_get_double_element; ///
private alias c_json_array_get_elementFn = extern(C) JsonNode* function(JsonArray* array, uint index) nothrow;
__gshared c_json_array_get_elementFn c_json_array_get_element; ///
private alias c_json_array_get_elementsFn = extern(C) GList* function(JsonArray* array) nothrow;
__gshared c_json_array_get_elementsFn c_json_array_get_elements; ///
private alias c_json_array_get_int_elementFn = extern(C) long function(JsonArray* array, uint index) nothrow;
__gshared c_json_array_get_int_elementFn c_json_array_get_int_element; ///
private alias c_json_array_get_lengthFn = extern(C) uint function(JsonArray* array) nothrow;
__gshared c_json_array_get_lengthFn c_json_array_get_length; ///
private alias c_json_array_get_null_elementFn = extern(C) gboolean function(JsonArray* array, uint index) nothrow;
__gshared c_json_array_get_null_elementFn c_json_array_get_null_element; ///
private alias c_json_array_get_object_elementFn = extern(C) JsonObject* function(JsonArray* array, uint index) nothrow;
__gshared c_json_array_get_object_elementFn c_json_array_get_object_element; ///
private alias c_json_array_get_string_elementFn = extern(C) const(char)* function(JsonArray* array, uint index) nothrow;
__gshared c_json_array_get_string_elementFn c_json_array_get_string_element; ///
private alias c_json_array_hashFn = extern(C) uint function(JsonArray* key) nothrow;
__gshared c_json_array_hashFn c_json_array_hash; ///
private alias c_json_array_is_immutableFn = extern(C) gboolean function(JsonArray* array) nothrow;
__gshared c_json_array_is_immutableFn c_json_array_is_immutable; ///
private alias c_json_array_refFn = extern(C) JsonArray* function(JsonArray* array) nothrow;
__gshared c_json_array_refFn c_json_array_ref; ///
private alias c_json_array_remove_elementFn = extern(C) void function(JsonArray* array, uint index) nothrow;
__gshared c_json_array_remove_elementFn c_json_array_remove_element; ///
private alias c_json_array_sealFn = extern(C) void function(JsonArray* array) nothrow;
__gshared c_json_array_sealFn c_json_array_seal; ///
private alias c_json_array_unrefFn = extern(C) void function(JsonArray* array) nothrow;
__gshared c_json_array_unrefFn c_json_array_unref; ///

// Builder
private alias c_json_builder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_json_builder_get_typeFn c_json_builder_get_type; ///
private alias c_json_builder_newFn = extern(C) JsonBuilder* function() nothrow;
__gshared c_json_builder_newFn c_json_builder_new; ///
private alias c_json_builder_new_immutableFn = extern(C) JsonBuilder* function() nothrow;
__gshared c_json_builder_new_immutableFn c_json_builder_new_immutable; ///
private alias c_json_builder_add_boolean_valueFn = extern(C) JsonBuilder* function(JsonBuilder* builder, gboolean value) nothrow;
__gshared c_json_builder_add_boolean_valueFn c_json_builder_add_boolean_value; ///
private alias c_json_builder_add_double_valueFn = extern(C) JsonBuilder* function(JsonBuilder* builder, double value) nothrow;
__gshared c_json_builder_add_double_valueFn c_json_builder_add_double_value; ///
private alias c_json_builder_add_int_valueFn = extern(C) JsonBuilder* function(JsonBuilder* builder, long value) nothrow;
__gshared c_json_builder_add_int_valueFn c_json_builder_add_int_value; ///
private alias c_json_builder_add_null_valueFn = extern(C) JsonBuilder* function(JsonBuilder* builder) nothrow;
__gshared c_json_builder_add_null_valueFn c_json_builder_add_null_value; ///
private alias c_json_builder_add_string_valueFn = extern(C) JsonBuilder* function(JsonBuilder* builder, const(char)* value) nothrow;
__gshared c_json_builder_add_string_valueFn c_json_builder_add_string_value; ///
private alias c_json_builder_add_valueFn = extern(C) JsonBuilder* function(JsonBuilder* builder, JsonNode* node) nothrow;
__gshared c_json_builder_add_valueFn c_json_builder_add_value; ///
private alias c_json_builder_begin_arrayFn = extern(C) JsonBuilder* function(JsonBuilder* builder) nothrow;
__gshared c_json_builder_begin_arrayFn c_json_builder_begin_array; ///
private alias c_json_builder_begin_objectFn = extern(C) JsonBuilder* function(JsonBuilder* builder) nothrow;
__gshared c_json_builder_begin_objectFn c_json_builder_begin_object; ///
private alias c_json_builder_end_arrayFn = extern(C) JsonBuilder* function(JsonBuilder* builder) nothrow;
__gshared c_json_builder_end_arrayFn c_json_builder_end_array; ///
private alias c_json_builder_end_objectFn = extern(C) JsonBuilder* function(JsonBuilder* builder) nothrow;
__gshared c_json_builder_end_objectFn c_json_builder_end_object; ///
private alias c_json_builder_get_rootFn = extern(C) JsonNode* function(JsonBuilder* builder) nothrow;
__gshared c_json_builder_get_rootFn c_json_builder_get_root; ///
private alias c_json_builder_resetFn = extern(C) void function(JsonBuilder* builder) nothrow;
__gshared c_json_builder_resetFn c_json_builder_reset; ///
private alias c_json_builder_set_member_nameFn = extern(C) JsonBuilder* function(JsonBuilder* builder, const(char)* memberName) nothrow;
__gshared c_json_builder_set_member_nameFn c_json_builder_set_member_name; ///

// Generator
private alias c_json_generator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_json_generator_get_typeFn c_json_generator_get_type; ///
private alias c_json_generator_newFn = extern(C) JsonGenerator* function() nothrow;
__gshared c_json_generator_newFn c_json_generator_new; ///
private alias c_json_generator_get_indentFn = extern(C) uint function(JsonGenerator* generator) nothrow;
__gshared c_json_generator_get_indentFn c_json_generator_get_indent; ///
private alias c_json_generator_get_indent_charFn = extern(C) dchar function(JsonGenerator* generator) nothrow;
__gshared c_json_generator_get_indent_charFn c_json_generator_get_indent_char; ///
private alias c_json_generator_get_prettyFn = extern(C) gboolean function(JsonGenerator* generator) nothrow;
__gshared c_json_generator_get_prettyFn c_json_generator_get_pretty; ///
private alias c_json_generator_get_rootFn = extern(C) JsonNode* function(JsonGenerator* generator) nothrow;
__gshared c_json_generator_get_rootFn c_json_generator_get_root; ///
private alias c_json_generator_set_indentFn = extern(C) void function(JsonGenerator* generator, uint indentLevel) nothrow;
__gshared c_json_generator_set_indentFn c_json_generator_set_indent; ///
private alias c_json_generator_set_indent_charFn = extern(C) void function(JsonGenerator* generator, dchar indentChar) nothrow;
__gshared c_json_generator_set_indent_charFn c_json_generator_set_indent_char; ///
private alias c_json_generator_set_prettyFn = extern(C) void function(JsonGenerator* generator, gboolean isPretty) nothrow;
__gshared c_json_generator_set_prettyFn c_json_generator_set_pretty; ///
private alias c_json_generator_set_rootFn = extern(C) void function(JsonGenerator* generator, JsonNode* node) nothrow;
__gshared c_json_generator_set_rootFn c_json_generator_set_root; ///
private alias c_json_generator_take_rootFn = extern(C) void function(JsonGenerator* generator, JsonNode* node) nothrow;
__gshared c_json_generator_take_rootFn c_json_generator_take_root; ///
private alias c_json_generator_to_dataFn = extern(C) char* function(JsonGenerator* generator, size_t* length) nothrow;
__gshared c_json_generator_to_dataFn c_json_generator_to_data; ///
private alias c_json_generator_to_fileFn = extern(C) gboolean function(JsonGenerator* generator, const(char)* filename, GError** _err) nothrow;
__gshared c_json_generator_to_fileFn c_json_generator_to_file; ///
private alias c_json_generator_to_gstringFn = extern(C) GString* function(JsonGenerator* generator, GString* string_) nothrow;
__gshared c_json_generator_to_gstringFn c_json_generator_to_gstring; ///
private alias c_json_generator_to_streamFn = extern(C) gboolean function(JsonGenerator* generator, GOutputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_json_generator_to_streamFn c_json_generator_to_stream; ///

// Node
private alias c_json_node_get_typeFn = extern(C) GType function() nothrow;
__gshared c_json_node_get_typeFn c_json_node_get_type; ///
private alias c_json_node_allocFn = extern(C) JsonNode* function() nothrow;
__gshared c_json_node_allocFn c_json_node_alloc; ///
private alias c_json_node_newFn = extern(C) JsonNode* function(JsonNodeType type) nothrow;
__gshared c_json_node_newFn c_json_node_new; ///
private alias c_json_node_copyFn = extern(C) JsonNode* function(JsonNode* node) nothrow;
__gshared c_json_node_copyFn c_json_node_copy; ///
private alias c_json_node_dup_arrayFn = extern(C) JsonArray* function(JsonNode* node) nothrow;
__gshared c_json_node_dup_arrayFn c_json_node_dup_array; ///
private alias c_json_node_dup_objectFn = extern(C) JsonObject* function(JsonNode* node) nothrow;
__gshared c_json_node_dup_objectFn c_json_node_dup_object; ///
private alias c_json_node_dup_stringFn = extern(C) char* function(JsonNode* node) nothrow;
__gshared c_json_node_dup_stringFn c_json_node_dup_string; ///
private alias c_json_node_equalFn = extern(C) gboolean function(JsonNode* a, JsonNode* b) nothrow;
__gshared c_json_node_equalFn c_json_node_equal; ///
private alias c_json_node_freeFn = extern(C) void function(JsonNode* node) nothrow;
__gshared c_json_node_freeFn c_json_node_free; ///
private alias c_json_node_get_arrayFn = extern(C) JsonArray* function(JsonNode* node) nothrow;
__gshared c_json_node_get_arrayFn c_json_node_get_array; ///
private alias c_json_node_get_booleanFn = extern(C) gboolean function(JsonNode* node) nothrow;
__gshared c_json_node_get_booleanFn c_json_node_get_boolean; ///
private alias c_json_node_get_doubleFn = extern(C) double function(JsonNode* node) nothrow;
__gshared c_json_node_get_doubleFn c_json_node_get_double; ///
private alias c_json_node_get_intFn = extern(C) long function(JsonNode* node) nothrow;
__gshared c_json_node_get_intFn c_json_node_get_int; ///
private alias c_json_node_get_node_typeFn = extern(C) JsonNodeType function(JsonNode* node) nothrow;
__gshared c_json_node_get_node_typeFn c_json_node_get_node_type; ///
private alias c_json_node_get_objectFn = extern(C) JsonObject* function(JsonNode* node) nothrow;
__gshared c_json_node_get_objectFn c_json_node_get_object; ///
private alias c_json_node_get_parentFn = extern(C) JsonNode* function(JsonNode* node) nothrow;
__gshared c_json_node_get_parentFn c_json_node_get_parent; ///
private alias c_json_node_get_stringFn = extern(C) const(char)* function(JsonNode* node) nothrow;
__gshared c_json_node_get_stringFn c_json_node_get_string; ///
private alias c_json_node_get_valueFn = extern(C) void function(JsonNode* node, GValue* value) nothrow;
__gshared c_json_node_get_valueFn c_json_node_get_value; ///
private alias c_json_node_get_value_typeFn = extern(C) GType function(JsonNode* node) nothrow;
__gshared c_json_node_get_value_typeFn c_json_node_get_value_type; ///
private alias c_json_node_hashFn = extern(C) uint function(JsonNode* key) nothrow;
__gshared c_json_node_hashFn c_json_node_hash; ///
private alias c_json_node_initFn = extern(C) JsonNode* function(JsonNode* node, JsonNodeType type) nothrow;
__gshared c_json_node_initFn c_json_node_init; ///
private alias c_json_node_init_arrayFn = extern(C) JsonNode* function(JsonNode* node, JsonArray* array) nothrow;
__gshared c_json_node_init_arrayFn c_json_node_init_array; ///
private alias c_json_node_init_booleanFn = extern(C) JsonNode* function(JsonNode* node, gboolean value) nothrow;
__gshared c_json_node_init_booleanFn c_json_node_init_boolean; ///
private alias c_json_node_init_doubleFn = extern(C) JsonNode* function(JsonNode* node, double value) nothrow;
__gshared c_json_node_init_doubleFn c_json_node_init_double; ///
private alias c_json_node_init_intFn = extern(C) JsonNode* function(JsonNode* node, long value) nothrow;
__gshared c_json_node_init_intFn c_json_node_init_int; ///
private alias c_json_node_init_nullFn = extern(C) JsonNode* function(JsonNode* node) nothrow;
__gshared c_json_node_init_nullFn c_json_node_init_null; ///
private alias c_json_node_init_objectFn = extern(C) JsonNode* function(JsonNode* node, JsonObject* object) nothrow;
__gshared c_json_node_init_objectFn c_json_node_init_object; ///
private alias c_json_node_init_stringFn = extern(C) JsonNode* function(JsonNode* node, const(char)* value) nothrow;
__gshared c_json_node_init_stringFn c_json_node_init_string; ///
private alias c_json_node_is_immutableFn = extern(C) gboolean function(JsonNode* node) nothrow;
__gshared c_json_node_is_immutableFn c_json_node_is_immutable; ///
private alias c_json_node_is_nullFn = extern(C) gboolean function(JsonNode* node) nothrow;
__gshared c_json_node_is_nullFn c_json_node_is_null; ///
private alias c_json_node_refFn = extern(C) JsonNode* function(JsonNode* node) nothrow;
__gshared c_json_node_refFn c_json_node_ref; ///
private alias c_json_node_sealFn = extern(C) void function(JsonNode* node) nothrow;
__gshared c_json_node_sealFn c_json_node_seal; ///
private alias c_json_node_set_arrayFn = extern(C) void function(JsonNode* node, JsonArray* array) nothrow;
__gshared c_json_node_set_arrayFn c_json_node_set_array; ///
private alias c_json_node_set_booleanFn = extern(C) void function(JsonNode* node, gboolean value) nothrow;
__gshared c_json_node_set_booleanFn c_json_node_set_boolean; ///
private alias c_json_node_set_doubleFn = extern(C) void function(JsonNode* node, double value) nothrow;
__gshared c_json_node_set_doubleFn c_json_node_set_double; ///
private alias c_json_node_set_intFn = extern(C) void function(JsonNode* node, long value) nothrow;
__gshared c_json_node_set_intFn c_json_node_set_int; ///
private alias c_json_node_set_objectFn = extern(C) void function(JsonNode* node, JsonObject* object) nothrow;
__gshared c_json_node_set_objectFn c_json_node_set_object; ///
private alias c_json_node_set_parentFn = extern(C) void function(JsonNode* node, JsonNode* parent) nothrow;
__gshared c_json_node_set_parentFn c_json_node_set_parent; ///
private alias c_json_node_set_stringFn = extern(C) void function(JsonNode* node, const(char)* value) nothrow;
__gshared c_json_node_set_stringFn c_json_node_set_string; ///
private alias c_json_node_set_valueFn = extern(C) void function(JsonNode* node, const(GValue)* value) nothrow;
__gshared c_json_node_set_valueFn c_json_node_set_value; ///
private alias c_json_node_take_arrayFn = extern(C) void function(JsonNode* node, JsonArray* array) nothrow;
__gshared c_json_node_take_arrayFn c_json_node_take_array; ///
private alias c_json_node_take_objectFn = extern(C) void function(JsonNode* node, JsonObject* object) nothrow;
__gshared c_json_node_take_objectFn c_json_node_take_object; ///
private alias c_json_node_type_nameFn = extern(C) const(char)* function(JsonNode* node) nothrow;
__gshared c_json_node_type_nameFn c_json_node_type_name; ///
private alias c_json_node_unrefFn = extern(C) void function(JsonNode* node) nothrow;
__gshared c_json_node_unrefFn c_json_node_unref; ///

// ObjectIter
private alias c_json_object_iter_initFn = extern(C) void function(JsonObjectIter* iter, JsonObject* object) nothrow;
__gshared c_json_object_iter_initFn c_json_object_iter_init; ///
private alias c_json_object_iter_init_orderedFn = extern(C) void function(JsonObjectIter* iter, JsonObject* object) nothrow;
__gshared c_json_object_iter_init_orderedFn c_json_object_iter_init_ordered; ///
private alias c_json_object_iter_nextFn = extern(C) gboolean function(JsonObjectIter* iter, const(char*)* memberName, JsonNode** memberNode) nothrow;
__gshared c_json_object_iter_nextFn c_json_object_iter_next; ///
private alias c_json_object_iter_next_orderedFn = extern(C) gboolean function(JsonObjectIter* iter, const(char*)* memberName, JsonNode** memberNode) nothrow;
__gshared c_json_object_iter_next_orderedFn c_json_object_iter_next_ordered; ///

// ObjectWrap
private alias c_json_object_get_typeFn = extern(C) GType function() nothrow;
__gshared c_json_object_get_typeFn c_json_object_get_type; ///
private alias c_json_object_newFn = extern(C) JsonObject* function() nothrow;
__gshared c_json_object_newFn c_json_object_new; ///
private alias c_json_object_add_memberFn = extern(C) void function(JsonObject* object, const(char)* memberName, JsonNode* node) nothrow;
__gshared c_json_object_add_memberFn c_json_object_add_member; ///
private alias c_json_object_dup_memberFn = extern(C) JsonNode* function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_dup_memberFn c_json_object_dup_member; ///
private alias c_json_object_equalFn = extern(C) gboolean function(JsonObject* a, JsonObject* b) nothrow;
__gshared c_json_object_equalFn c_json_object_equal; ///
private alias c_json_object_foreach_memberFn = extern(C) void function(JsonObject* object, JsonObjectForeach func, void* data) nothrow;
__gshared c_json_object_foreach_memberFn c_json_object_foreach_member; ///
private alias c_json_object_get_array_memberFn = extern(C) JsonArray* function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_get_array_memberFn c_json_object_get_array_member; ///
private alias c_json_object_get_boolean_memberFn = extern(C) gboolean function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_get_boolean_memberFn c_json_object_get_boolean_member; ///
private alias c_json_object_get_boolean_member_with_defaultFn = extern(C) gboolean function(JsonObject* object, const(char)* memberName, gboolean defaultValue) nothrow;
__gshared c_json_object_get_boolean_member_with_defaultFn c_json_object_get_boolean_member_with_default; ///
private alias c_json_object_get_double_memberFn = extern(C) double function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_get_double_memberFn c_json_object_get_double_member; ///
private alias c_json_object_get_double_member_with_defaultFn = extern(C) double function(JsonObject* object, const(char)* memberName, double defaultValue) nothrow;
__gshared c_json_object_get_double_member_with_defaultFn c_json_object_get_double_member_with_default; ///
private alias c_json_object_get_int_memberFn = extern(C) long function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_get_int_memberFn c_json_object_get_int_member; ///
private alias c_json_object_get_int_member_with_defaultFn = extern(C) long function(JsonObject* object, const(char)* memberName, long defaultValue) nothrow;
__gshared c_json_object_get_int_member_with_defaultFn c_json_object_get_int_member_with_default; ///
private alias c_json_object_get_memberFn = extern(C) JsonNode* function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_get_memberFn c_json_object_get_member; ///
private alias c_json_object_get_membersFn = extern(C) GList* function(JsonObject* object) nothrow;
__gshared c_json_object_get_membersFn c_json_object_get_members; ///
private alias c_json_object_get_null_memberFn = extern(C) gboolean function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_get_null_memberFn c_json_object_get_null_member; ///
private alias c_json_object_get_object_memberFn = extern(C) JsonObject* function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_get_object_memberFn c_json_object_get_object_member; ///
private alias c_json_object_get_sizeFn = extern(C) uint function(JsonObject* object) nothrow;
__gshared c_json_object_get_sizeFn c_json_object_get_size; ///
private alias c_json_object_get_string_memberFn = extern(C) const(char)* function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_get_string_memberFn c_json_object_get_string_member; ///
private alias c_json_object_get_string_member_with_defaultFn = extern(C) const(char)* function(JsonObject* object, const(char)* memberName, const(char)* defaultValue) nothrow;
__gshared c_json_object_get_string_member_with_defaultFn c_json_object_get_string_member_with_default; ///
private alias c_json_object_get_valuesFn = extern(C) GList* function(JsonObject* object) nothrow;
__gshared c_json_object_get_valuesFn c_json_object_get_values; ///
private alias c_json_object_has_memberFn = extern(C) gboolean function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_has_memberFn c_json_object_has_member; ///
private alias c_json_object_hashFn = extern(C) uint function(JsonObject* key) nothrow;
__gshared c_json_object_hashFn c_json_object_hash; ///
private alias c_json_object_is_immutableFn = extern(C) gboolean function(JsonObject* object) nothrow;
__gshared c_json_object_is_immutableFn c_json_object_is_immutable; ///
private alias c_json_object_refFn = extern(C) JsonObject* function(JsonObject* object) nothrow;
__gshared c_json_object_refFn c_json_object_ref; ///
private alias c_json_object_remove_memberFn = extern(C) void function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_remove_memberFn c_json_object_remove_member; ///
private alias c_json_object_sealFn = extern(C) void function(JsonObject* object) nothrow;
__gshared c_json_object_sealFn c_json_object_seal; ///
private alias c_json_object_set_array_memberFn = extern(C) void function(JsonObject* object, const(char)* memberName, JsonArray* value) nothrow;
__gshared c_json_object_set_array_memberFn c_json_object_set_array_member; ///
private alias c_json_object_set_boolean_memberFn = extern(C) void function(JsonObject* object, const(char)* memberName, gboolean value) nothrow;
__gshared c_json_object_set_boolean_memberFn c_json_object_set_boolean_member; ///
private alias c_json_object_set_double_memberFn = extern(C) void function(JsonObject* object, const(char)* memberName, double value) nothrow;
__gshared c_json_object_set_double_memberFn c_json_object_set_double_member; ///
private alias c_json_object_set_int_memberFn = extern(C) void function(JsonObject* object, const(char)* memberName, long value) nothrow;
__gshared c_json_object_set_int_memberFn c_json_object_set_int_member; ///
private alias c_json_object_set_memberFn = extern(C) void function(JsonObject* object, const(char)* memberName, JsonNode* node) nothrow;
__gshared c_json_object_set_memberFn c_json_object_set_member; ///
private alias c_json_object_set_null_memberFn = extern(C) void function(JsonObject* object, const(char)* memberName) nothrow;
__gshared c_json_object_set_null_memberFn c_json_object_set_null_member; ///
private alias c_json_object_set_object_memberFn = extern(C) void function(JsonObject* object, const(char)* memberName, JsonObject* value) nothrow;
__gshared c_json_object_set_object_memberFn c_json_object_set_object_member; ///
private alias c_json_object_set_string_memberFn = extern(C) void function(JsonObject* object, const(char)* memberName, const(char)* value) nothrow;
__gshared c_json_object_set_string_memberFn c_json_object_set_string_member; ///
private alias c_json_object_unrefFn = extern(C) void function(JsonObject* object) nothrow;
__gshared c_json_object_unrefFn c_json_object_unref; ///

// Parser
private alias c_json_parser_get_typeFn = extern(C) GType function() nothrow;
__gshared c_json_parser_get_typeFn c_json_parser_get_type; ///
private alias c_json_parser_newFn = extern(C) JsonParser* function() nothrow;
__gshared c_json_parser_newFn c_json_parser_new; ///
private alias c_json_parser_new_immutableFn = extern(C) JsonParser* function() nothrow;
__gshared c_json_parser_new_immutableFn c_json_parser_new_immutable; ///
private alias c_json_parser_get_current_lineFn = extern(C) uint function(JsonParser* parser) nothrow;
__gshared c_json_parser_get_current_lineFn c_json_parser_get_current_line; ///
private alias c_json_parser_get_current_posFn = extern(C) uint function(JsonParser* parser) nothrow;
__gshared c_json_parser_get_current_posFn c_json_parser_get_current_pos; ///
private alias c_json_parser_get_rootFn = extern(C) JsonNode* function(JsonParser* parser) nothrow;
__gshared c_json_parser_get_rootFn c_json_parser_get_root; ///
private alias c_json_parser_get_strictFn = extern(C) gboolean function(JsonParser* parser) nothrow;
__gshared c_json_parser_get_strictFn c_json_parser_get_strict; ///
private alias c_json_parser_has_assignmentFn = extern(C) gboolean function(JsonParser* parser, char** variableName) nothrow;
__gshared c_json_parser_has_assignmentFn c_json_parser_has_assignment; ///
private alias c_json_parser_load_from_dataFn = extern(C) gboolean function(JsonParser* parser, const(char)* data, ptrdiff_t length, GError** _err) nothrow;
__gshared c_json_parser_load_from_dataFn c_json_parser_load_from_data; ///
private alias c_json_parser_load_from_fileFn = extern(C) gboolean function(JsonParser* parser, const(char)* filename, GError** _err) nothrow;
__gshared c_json_parser_load_from_fileFn c_json_parser_load_from_file; ///
private alias c_json_parser_load_from_mapped_fileFn = extern(C) gboolean function(JsonParser* parser, const(char)* filename, GError** _err) nothrow;
__gshared c_json_parser_load_from_mapped_fileFn c_json_parser_load_from_mapped_file; ///
private alias c_json_parser_load_from_streamFn = extern(C) gboolean function(JsonParser* parser, GInputStream* stream, GCancellable* cancellable, GError** _err) nothrow;
__gshared c_json_parser_load_from_streamFn c_json_parser_load_from_stream; ///
private alias c_json_parser_load_from_stream_asyncFn = extern(C) void function(JsonParser* parser, GInputStream* stream, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_json_parser_load_from_stream_asyncFn c_json_parser_load_from_stream_async; ///
private alias c_json_parser_load_from_stream_finishFn = extern(C) gboolean function(JsonParser* parser, GAsyncResult* result, GError** _err) nothrow;
__gshared c_json_parser_load_from_stream_finishFn c_json_parser_load_from_stream_finish; ///
private alias c_json_parser_set_strictFn = extern(C) void function(JsonParser* parser, gboolean strict) nothrow;
__gshared c_json_parser_set_strictFn c_json_parser_set_strict; ///
private alias c_json_parser_steal_rootFn = extern(C) JsonNode* function(JsonParser* parser) nothrow;
__gshared c_json_parser_steal_rootFn c_json_parser_steal_root; ///

// Path
private alias c_json_path_get_typeFn = extern(C) GType function() nothrow;
__gshared c_json_path_get_typeFn c_json_path_get_type; ///
private alias c_json_path_newFn = extern(C) JsonPath* function() nothrow;
__gshared c_json_path_newFn c_json_path_new; ///
private alias c_json_path_queryFn = extern(C) JsonNode* function(const(char)* expression, JsonNode* root, GError** _err) nothrow;
__gshared c_json_path_queryFn c_json_path_query; ///
private alias c_json_path_compileFn = extern(C) gboolean function(JsonPath* path, const(char)* expression, GError** _err) nothrow;
__gshared c_json_path_compileFn c_json_path_compile; ///
private alias c_json_path_matchFn = extern(C) JsonNode* function(JsonPath* path, JsonNode* root) nothrow;
__gshared c_json_path_matchFn c_json_path_match; ///

// Reader
private alias c_json_reader_get_typeFn = extern(C) GType function() nothrow;
__gshared c_json_reader_get_typeFn c_json_reader_get_type; ///
private alias c_json_reader_newFn = extern(C) JsonReader* function(JsonNode* node) nothrow;
__gshared c_json_reader_newFn c_json_reader_new; ///
private alias c_json_reader_count_elementsFn = extern(C) int function(JsonReader* reader) nothrow;
__gshared c_json_reader_count_elementsFn c_json_reader_count_elements; ///
private alias c_json_reader_count_membersFn = extern(C) int function(JsonReader* reader) nothrow;
__gshared c_json_reader_count_membersFn c_json_reader_count_members; ///
private alias c_json_reader_end_elementFn = extern(C) void function(JsonReader* reader) nothrow;
__gshared c_json_reader_end_elementFn c_json_reader_end_element; ///
private alias c_json_reader_end_memberFn = extern(C) void function(JsonReader* reader) nothrow;
__gshared c_json_reader_end_memberFn c_json_reader_end_member; ///
private alias c_json_reader_get_boolean_valueFn = extern(C) gboolean function(JsonReader* reader) nothrow;
__gshared c_json_reader_get_boolean_valueFn c_json_reader_get_boolean_value; ///
private alias c_json_reader_get_current_nodeFn = extern(C) JsonNode* function(JsonReader* reader) nothrow;
__gshared c_json_reader_get_current_nodeFn c_json_reader_get_current_node; ///
private alias c_json_reader_get_double_valueFn = extern(C) double function(JsonReader* reader) nothrow;
__gshared c_json_reader_get_double_valueFn c_json_reader_get_double_value; ///
private alias c_json_reader_get_errorFn = extern(C) const(GError)* function(JsonReader* reader) nothrow;
__gshared c_json_reader_get_errorFn c_json_reader_get_error; ///
private alias c_json_reader_get_int_valueFn = extern(C) long function(JsonReader* reader) nothrow;
__gshared c_json_reader_get_int_valueFn c_json_reader_get_int_value; ///
private alias c_json_reader_get_member_nameFn = extern(C) const(char)* function(JsonReader* reader) nothrow;
__gshared c_json_reader_get_member_nameFn c_json_reader_get_member_name; ///
private alias c_json_reader_get_null_valueFn = extern(C) gboolean function(JsonReader* reader) nothrow;
__gshared c_json_reader_get_null_valueFn c_json_reader_get_null_value; ///
private alias c_json_reader_get_string_valueFn = extern(C) const(char)* function(JsonReader* reader) nothrow;
__gshared c_json_reader_get_string_valueFn c_json_reader_get_string_value; ///
private alias c_json_reader_get_valueFn = extern(C) JsonNode* function(JsonReader* reader) nothrow;
__gshared c_json_reader_get_valueFn c_json_reader_get_value; ///
private alias c_json_reader_is_arrayFn = extern(C) gboolean function(JsonReader* reader) nothrow;
__gshared c_json_reader_is_arrayFn c_json_reader_is_array; ///
private alias c_json_reader_is_objectFn = extern(C) gboolean function(JsonReader* reader) nothrow;
__gshared c_json_reader_is_objectFn c_json_reader_is_object; ///
private alias c_json_reader_is_valueFn = extern(C) gboolean function(JsonReader* reader) nothrow;
__gshared c_json_reader_is_valueFn c_json_reader_is_value; ///
private alias c_json_reader_list_membersFn = extern(C) char** function(JsonReader* reader) nothrow;
__gshared c_json_reader_list_membersFn c_json_reader_list_members; ///
private alias c_json_reader_read_elementFn = extern(C) gboolean function(JsonReader* reader, uint index) nothrow;
__gshared c_json_reader_read_elementFn c_json_reader_read_element; ///
private alias c_json_reader_read_memberFn = extern(C) gboolean function(JsonReader* reader, const(char)* memberName) nothrow;
__gshared c_json_reader_read_memberFn c_json_reader_read_member; ///
private alias c_json_reader_set_rootFn = extern(C) void function(JsonReader* reader, JsonNode* root) nothrow;
__gshared c_json_reader_set_rootFn c_json_reader_set_root; ///

// Serializable
private alias c_json_serializable_get_typeFn = extern(C) GType function() nothrow;
__gshared c_json_serializable_get_typeFn c_json_serializable_get_type; ///
private alias c_json_serializable_default_deserialize_propertyFn = extern(C) gboolean function(JsonSerializable* serializable, const(char)* propertyName, GValue* value, GParamSpec* pspec, JsonNode* propertyNode) nothrow;
__gshared c_json_serializable_default_deserialize_propertyFn c_json_serializable_default_deserialize_property; ///
private alias c_json_serializable_default_serialize_propertyFn = extern(C) JsonNode* function(JsonSerializable* serializable, const(char)* propertyName, const(GValue)* value, GParamSpec* pspec) nothrow;
__gshared c_json_serializable_default_serialize_propertyFn c_json_serializable_default_serialize_property; ///
private alias c_json_serializable_deserialize_propertyFn = extern(C) gboolean function(JsonSerializable* serializable, const(char)* propertyName, GValue* value, GParamSpec* pspec, JsonNode* propertyNode) nothrow;
__gshared c_json_serializable_deserialize_propertyFn c_json_serializable_deserialize_property; ///
private alias c_json_serializable_find_propertyFn = extern(C) GParamSpec* function(JsonSerializable* serializable, const(char)* name) nothrow;
__gshared c_json_serializable_find_propertyFn c_json_serializable_find_property; ///
private alias c_json_serializable_get_propertyFn = extern(C) void function(JsonSerializable* serializable, GParamSpec* pspec, GValue* value) nothrow;
__gshared c_json_serializable_get_propertyFn c_json_serializable_get_property; ///
private alias c_json_serializable_list_propertiesFn = extern(C) GParamSpec** function(JsonSerializable* serializable, uint* nPspecs) nothrow;
__gshared c_json_serializable_list_propertiesFn c_json_serializable_list_properties; ///
private alias c_json_serializable_serialize_propertyFn = extern(C) JsonNode* function(JsonSerializable* serializable, const(char)* propertyName, const(GValue)* value, GParamSpec* pspec) nothrow;
__gshared c_json_serializable_serialize_propertyFn c_json_serializable_serialize_property; ///
private alias c_json_serializable_set_propertyFn = extern(C) void function(JsonSerializable* serializable, GParamSpec* pspec, const(GValue)* value) nothrow;
__gshared c_json_serializable_set_propertyFn c_json_serializable_set_property; ///

// global
private alias c_json_boxed_can_deserializeFn = extern(C) gboolean function(GType gboxedType, JsonNodeType nodeType) nothrow;
__gshared c_json_boxed_can_deserializeFn c_json_boxed_can_deserialize; ///
private alias c_json_boxed_can_serializeFn = extern(C) gboolean function(GType gboxedType, JsonNodeType* nodeType) nothrow;
__gshared c_json_boxed_can_serializeFn c_json_boxed_can_serialize; ///
private alias c_json_boxed_deserializeFn = extern(C) void* function(GType gboxedType, JsonNode* node) nothrow;
__gshared c_json_boxed_deserializeFn c_json_boxed_deserialize; ///
private alias c_json_boxed_register_deserialize_funcFn = extern(C) void function(GType gboxedType, JsonNodeType nodeType, JsonBoxedDeserializeFunc deserializeFunc) nothrow;
__gshared c_json_boxed_register_deserialize_funcFn c_json_boxed_register_deserialize_func; ///
private alias c_json_boxed_register_serialize_funcFn = extern(C) void function(GType gboxedType, JsonNodeType nodeType, JsonBoxedSerializeFunc serializeFunc) nothrow;
__gshared c_json_boxed_register_serialize_funcFn c_json_boxed_register_serialize_func; ///
private alias c_json_boxed_serializeFn = extern(C) JsonNode* function(GType gboxedType, const(void)* boxed) nothrow;
__gshared c_json_boxed_serializeFn c_json_boxed_serialize; ///
private alias c_json_construct_gobjectFn = extern(C) GObject* function(GType gtype, const(char)* data, size_t length, GError** _err) nothrow;
__gshared c_json_construct_gobjectFn c_json_construct_gobject; ///
private alias c_json_from_stringFn = extern(C) JsonNode* function(const(char)* str, GError** _err) nothrow;
__gshared c_json_from_stringFn c_json_from_string; ///
private alias c_json_gobject_deserializeFn = extern(C) GObject* function(GType gtype, JsonNode* node) nothrow;
__gshared c_json_gobject_deserializeFn c_json_gobject_deserialize; ///
private alias c_json_gobject_from_dataFn = extern(C) GObject* function(GType gtype, const(char)* data, ptrdiff_t length, GError** _err) nothrow;
__gshared c_json_gobject_from_dataFn c_json_gobject_from_data; ///
private alias c_json_gobject_serializeFn = extern(C) JsonNode* function(GObject* gobject) nothrow;
__gshared c_json_gobject_serializeFn c_json_gobject_serialize; ///
private alias c_json_gobject_to_dataFn = extern(C) char* function(GObject* gobject, size_t* length) nothrow;
__gshared c_json_gobject_to_dataFn c_json_gobject_to_data; ///
private alias c_json_gvariant_deserializeFn = extern(C) GVariant* function(JsonNode* jsonNode, const(char)* signature, GError** _err) nothrow;
__gshared c_json_gvariant_deserializeFn c_json_gvariant_deserialize; ///
private alias c_json_gvariant_deserialize_dataFn = extern(C) GVariant* function(const(char)* json, ptrdiff_t length, const(char)* signature, GError** _err) nothrow;
__gshared c_json_gvariant_deserialize_dataFn c_json_gvariant_deserialize_data; ///
private alias c_json_gvariant_serializeFn = extern(C) JsonNode* function(GVariant* variant) nothrow;
__gshared c_json_gvariant_serializeFn c_json_gvariant_serialize; ///
private alias c_json_gvariant_serialize_dataFn = extern(C) char* function(GVariant* variant, size_t* length) nothrow;
__gshared c_json_gvariant_serialize_dataFn c_json_gvariant_serialize_data; ///
private alias c_json_serialize_gobjectFn = extern(C) char* function(GObject* gobject, size_t* length) nothrow;
__gshared c_json_serialize_gobjectFn c_json_serialize_gobject; ///
private alias c_json_string_compareFn = extern(C) int function(const(void)* a, const(void)* b) nothrow;
__gshared c_json_string_compareFn c_json_string_compare; ///
private alias c_json_string_equalFn = extern(C) gboolean function(const(void)* a, const(void)* b) nothrow;
__gshared c_json_string_equalFn c_json_string_equal; ///
private alias c_json_string_hashFn = extern(C) uint function(const(void)* key) nothrow;
__gshared c_json_string_hashFn c_json_string_hash; ///
private alias c_json_to_stringFn = extern(C) char* function(JsonNode* node, gboolean pretty) nothrow;
__gshared c_json_to_stringFn c_json_to_string; ///

// ParserError
private alias c_json_parser_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_json_parser_error_quarkFn c_json_parser_error_quark; ///

// PathError
private alias c_json_path_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_json_path_error_quarkFn c_json_path_error_quark; ///

// ReaderError
private alias c_json_reader_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_json_reader_error_quarkFn c_json_reader_error_quark; ///

// Array

/** */
alias json_array_get_type = c_json_array_get_type;

/** */
alias json_array_new = c_json_array_new;

/** */
alias json_array_sized_new = c_json_array_sized_new;

/** */
alias json_array_add_array_element = c_json_array_add_array_element;

/** */
alias json_array_add_boolean_element = c_json_array_add_boolean_element;

/** */
alias json_array_add_double_element = c_json_array_add_double_element;

/** */
alias json_array_add_element = c_json_array_add_element;

/** */
alias json_array_add_int_element = c_json_array_add_int_element;

/** */
alias json_array_add_null_element = c_json_array_add_null_element;

/** */
alias json_array_add_object_element = c_json_array_add_object_element;

/** */
alias json_array_add_string_element = c_json_array_add_string_element;

/** */
alias json_array_dup_element = c_json_array_dup_element;

/** */
alias json_array_equal = c_json_array_equal;

/** */
alias json_array_foreach_element = c_json_array_foreach_element;

/** */
alias json_array_get_array_element = c_json_array_get_array_element;

/** */
alias json_array_get_boolean_element = c_json_array_get_boolean_element;

/** */
alias json_array_get_double_element = c_json_array_get_double_element;

/** */
alias json_array_get_element = c_json_array_get_element;

/** */
alias json_array_get_elements = c_json_array_get_elements;

/** */
alias json_array_get_int_element = c_json_array_get_int_element;

/** */
alias json_array_get_length = c_json_array_get_length;

/** */
alias json_array_get_null_element = c_json_array_get_null_element;

/** */
alias json_array_get_object_element = c_json_array_get_object_element;

/** */
alias json_array_get_string_element = c_json_array_get_string_element;

/** */
alias json_array_hash = c_json_array_hash;

/** */
alias json_array_is_immutable = c_json_array_is_immutable;

/** */
alias json_array_ref = c_json_array_ref;

/** */
alias json_array_remove_element = c_json_array_remove_element;

/** */
alias json_array_seal = c_json_array_seal;

/** */
alias json_array_unref = c_json_array_unref;

// Builder

/** */
alias json_builder_get_type = c_json_builder_get_type;

/** */
alias json_builder_new = c_json_builder_new;

/** */
alias json_builder_new_immutable = c_json_builder_new_immutable;

/** */
alias json_builder_add_boolean_value = c_json_builder_add_boolean_value;

/** */
alias json_builder_add_double_value = c_json_builder_add_double_value;

/** */
alias json_builder_add_int_value = c_json_builder_add_int_value;

/** */
alias json_builder_add_null_value = c_json_builder_add_null_value;

/** */
alias json_builder_add_string_value = c_json_builder_add_string_value;

/** */
alias json_builder_add_value = c_json_builder_add_value;

/** */
alias json_builder_begin_array = c_json_builder_begin_array;

/** */
alias json_builder_begin_object = c_json_builder_begin_object;

/** */
alias json_builder_end_array = c_json_builder_end_array;

/** */
alias json_builder_end_object = c_json_builder_end_object;

/** */
alias json_builder_get_root = c_json_builder_get_root;

/** */
alias json_builder_reset = c_json_builder_reset;

/** */
alias json_builder_set_member_name = c_json_builder_set_member_name;

// Generator

/** */
alias json_generator_get_type = c_json_generator_get_type;

/** */
alias json_generator_new = c_json_generator_new;

/** */
alias json_generator_get_indent = c_json_generator_get_indent;

/** */
alias json_generator_get_indent_char = c_json_generator_get_indent_char;

/** */
alias json_generator_get_pretty = c_json_generator_get_pretty;

/** */
alias json_generator_get_root = c_json_generator_get_root;

/** */
alias json_generator_set_indent = c_json_generator_set_indent;

/** */
alias json_generator_set_indent_char = c_json_generator_set_indent_char;

/** */
alias json_generator_set_pretty = c_json_generator_set_pretty;

/** */
alias json_generator_set_root = c_json_generator_set_root;

/** */
alias json_generator_take_root = c_json_generator_take_root;

/** */
alias json_generator_to_data = c_json_generator_to_data;

/** */
alias json_generator_to_file = c_json_generator_to_file;

/** */
alias json_generator_to_gstring = c_json_generator_to_gstring;

/** */
alias json_generator_to_stream = c_json_generator_to_stream;

// Node

/** */
alias json_node_get_type = c_json_node_get_type;

/** */
alias json_node_alloc = c_json_node_alloc;

/** */
alias json_node_new = c_json_node_new;

/** */
alias json_node_copy = c_json_node_copy;

/** */
alias json_node_dup_array = c_json_node_dup_array;

/** */
alias json_node_dup_object = c_json_node_dup_object;

/** */
alias json_node_dup_string = c_json_node_dup_string;

/** */
alias json_node_equal = c_json_node_equal;

/** */
alias json_node_free = c_json_node_free;

/** */
alias json_node_get_array = c_json_node_get_array;

/** */
alias json_node_get_boolean = c_json_node_get_boolean;

/** */
alias json_node_get_double = c_json_node_get_double;

/** */
alias json_node_get_int = c_json_node_get_int;

/** */
alias json_node_get_node_type = c_json_node_get_node_type;

/** */
alias json_node_get_object = c_json_node_get_object;

/** */
alias json_node_get_parent = c_json_node_get_parent;

/** */
alias json_node_get_string = c_json_node_get_string;

/** */
alias json_node_get_value = c_json_node_get_value;

/** */
alias json_node_get_value_type = c_json_node_get_value_type;

/** */
alias json_node_hash = c_json_node_hash;

/** */
alias json_node_init = c_json_node_init;

/** */
alias json_node_init_array = c_json_node_init_array;

/** */
alias json_node_init_boolean = c_json_node_init_boolean;

/** */
alias json_node_init_double = c_json_node_init_double;

/** */
alias json_node_init_int = c_json_node_init_int;

/** */
alias json_node_init_null = c_json_node_init_null;

/** */
alias json_node_init_object = c_json_node_init_object;

/** */
alias json_node_init_string = c_json_node_init_string;

/** */
alias json_node_is_immutable = c_json_node_is_immutable;

/** */
alias json_node_is_null = c_json_node_is_null;

/** */
alias json_node_ref = c_json_node_ref;

/** */
alias json_node_seal = c_json_node_seal;

/** */
alias json_node_set_array = c_json_node_set_array;

/** */
alias json_node_set_boolean = c_json_node_set_boolean;

/** */
alias json_node_set_double = c_json_node_set_double;

/** */
alias json_node_set_int = c_json_node_set_int;

/** */
alias json_node_set_object = c_json_node_set_object;

/** */
alias json_node_set_parent = c_json_node_set_parent;

/** */
alias json_node_set_string = c_json_node_set_string;

/** */
alias json_node_set_value = c_json_node_set_value;

/** */
alias json_node_take_array = c_json_node_take_array;

/** */
alias json_node_take_object = c_json_node_take_object;

/** */
alias json_node_type_name = c_json_node_type_name;

/** */
alias json_node_unref = c_json_node_unref;

// ObjectIter

/** */
alias json_object_iter_init = c_json_object_iter_init;

/** */
alias json_object_iter_init_ordered = c_json_object_iter_init_ordered;

/** */
alias json_object_iter_next = c_json_object_iter_next;

/** */
alias json_object_iter_next_ordered = c_json_object_iter_next_ordered;

// ObjectWrap

/** */
alias json_object_get_type = c_json_object_get_type;

/** */
alias json_object_new = c_json_object_new;

/** */
alias json_object_add_member = c_json_object_add_member;

/** */
alias json_object_dup_member = c_json_object_dup_member;

/** */
alias json_object_equal = c_json_object_equal;

/** */
alias json_object_foreach_member = c_json_object_foreach_member;

/** */
alias json_object_get_array_member = c_json_object_get_array_member;

/** */
alias json_object_get_boolean_member = c_json_object_get_boolean_member;

/** */
alias json_object_get_boolean_member_with_default = c_json_object_get_boolean_member_with_default;

/** */
alias json_object_get_double_member = c_json_object_get_double_member;

/** */
alias json_object_get_double_member_with_default = c_json_object_get_double_member_with_default;

/** */
alias json_object_get_int_member = c_json_object_get_int_member;

/** */
alias json_object_get_int_member_with_default = c_json_object_get_int_member_with_default;

/** */
alias json_object_get_member = c_json_object_get_member;

/** */
alias json_object_get_members = c_json_object_get_members;

/** */
alias json_object_get_null_member = c_json_object_get_null_member;

/** */
alias json_object_get_object_member = c_json_object_get_object_member;

/** */
alias json_object_get_size = c_json_object_get_size;

/** */
alias json_object_get_string_member = c_json_object_get_string_member;

/** */
alias json_object_get_string_member_with_default = c_json_object_get_string_member_with_default;

/** */
alias json_object_get_values = c_json_object_get_values;

/** */
alias json_object_has_member = c_json_object_has_member;

/** */
alias json_object_hash = c_json_object_hash;

/** */
alias json_object_is_immutable = c_json_object_is_immutable;

/** */
alias json_object_ref = c_json_object_ref;

/** */
alias json_object_remove_member = c_json_object_remove_member;

/** */
alias json_object_seal = c_json_object_seal;

/** */
alias json_object_set_array_member = c_json_object_set_array_member;

/** */
alias json_object_set_boolean_member = c_json_object_set_boolean_member;

/** */
alias json_object_set_double_member = c_json_object_set_double_member;

/** */
alias json_object_set_int_member = c_json_object_set_int_member;

/** */
alias json_object_set_member = c_json_object_set_member;

/** */
alias json_object_set_null_member = c_json_object_set_null_member;

/** */
alias json_object_set_object_member = c_json_object_set_object_member;

/** */
alias json_object_set_string_member = c_json_object_set_string_member;

/** */
alias json_object_unref = c_json_object_unref;

// Parser

/** */
alias json_parser_get_type = c_json_parser_get_type;

/** */
alias json_parser_new = c_json_parser_new;

/** */
alias json_parser_new_immutable = c_json_parser_new_immutable;

/** */
alias json_parser_get_current_line = c_json_parser_get_current_line;

/** */
alias json_parser_get_current_pos = c_json_parser_get_current_pos;

/** */
alias json_parser_get_root = c_json_parser_get_root;

/** */
alias json_parser_get_strict = c_json_parser_get_strict;

/** */
alias json_parser_has_assignment = c_json_parser_has_assignment;

/** */
alias json_parser_load_from_data = c_json_parser_load_from_data;

/** */
alias json_parser_load_from_file = c_json_parser_load_from_file;

/** */
alias json_parser_load_from_mapped_file = c_json_parser_load_from_mapped_file;

/** */
alias json_parser_load_from_stream = c_json_parser_load_from_stream;

/** */
alias json_parser_load_from_stream_async = c_json_parser_load_from_stream_async;

/** */
alias json_parser_load_from_stream_finish = c_json_parser_load_from_stream_finish;

/** */
alias json_parser_set_strict = c_json_parser_set_strict;

/** */
alias json_parser_steal_root = c_json_parser_steal_root;

// Path

/** */
alias json_path_get_type = c_json_path_get_type;

/** */
alias json_path_new = c_json_path_new;

/** */
alias json_path_query = c_json_path_query;

/** */
alias json_path_compile = c_json_path_compile;

/** */
alias json_path_match = c_json_path_match;

// Reader

/** */
alias json_reader_get_type = c_json_reader_get_type;

/** */
alias json_reader_new = c_json_reader_new;

/** */
alias json_reader_count_elements = c_json_reader_count_elements;

/** */
alias json_reader_count_members = c_json_reader_count_members;

/** */
alias json_reader_end_element = c_json_reader_end_element;

/** */
alias json_reader_end_member = c_json_reader_end_member;

/** */
alias json_reader_get_boolean_value = c_json_reader_get_boolean_value;

/** */
alias json_reader_get_current_node = c_json_reader_get_current_node;

/** */
alias json_reader_get_double_value = c_json_reader_get_double_value;

/** */
alias json_reader_get_error = c_json_reader_get_error;

/** */
alias json_reader_get_int_value = c_json_reader_get_int_value;

/** */
alias json_reader_get_member_name = c_json_reader_get_member_name;

/** */
alias json_reader_get_null_value = c_json_reader_get_null_value;

/** */
alias json_reader_get_string_value = c_json_reader_get_string_value;

/** */
alias json_reader_get_value = c_json_reader_get_value;

/** */
alias json_reader_is_array = c_json_reader_is_array;

/** */
alias json_reader_is_object = c_json_reader_is_object;

/** */
alias json_reader_is_value = c_json_reader_is_value;

/** */
alias json_reader_list_members = c_json_reader_list_members;

/** */
alias json_reader_read_element = c_json_reader_read_element;

/** */
alias json_reader_read_member = c_json_reader_read_member;

/** */
alias json_reader_set_root = c_json_reader_set_root;

// Serializable

/** */
alias json_serializable_get_type = c_json_serializable_get_type;

/** */
alias json_serializable_default_deserialize_property = c_json_serializable_default_deserialize_property;

/** */
alias json_serializable_default_serialize_property = c_json_serializable_default_serialize_property;

/** */
alias json_serializable_deserialize_property = c_json_serializable_deserialize_property;

/** */
alias json_serializable_find_property = c_json_serializable_find_property;

/** */
alias json_serializable_get_property = c_json_serializable_get_property;

/** */
alias json_serializable_list_properties = c_json_serializable_list_properties;

/** */
alias json_serializable_serialize_property = c_json_serializable_serialize_property;

/** */
alias json_serializable_set_property = c_json_serializable_set_property;

// global

/** */
alias json_boxed_can_deserialize = c_json_boxed_can_deserialize;

/** */
alias json_boxed_can_serialize = c_json_boxed_can_serialize;

/** */
alias json_boxed_deserialize = c_json_boxed_deserialize;

/** */
alias json_boxed_register_deserialize_func = c_json_boxed_register_deserialize_func;

/** */
alias json_boxed_register_serialize_func = c_json_boxed_register_serialize_func;

/** */
alias json_boxed_serialize = c_json_boxed_serialize;

/** */
alias json_construct_gobject = c_json_construct_gobject;

/** */
alias json_from_string = c_json_from_string;

/** */
alias json_gobject_deserialize = c_json_gobject_deserialize;

/** */
alias json_gobject_from_data = c_json_gobject_from_data;

/** */
alias json_gobject_serialize = c_json_gobject_serialize;

/** */
alias json_gobject_to_data = c_json_gobject_to_data;

/** */
alias json_gvariant_deserialize = c_json_gvariant_deserialize;

/** */
alias json_gvariant_deserialize_data = c_json_gvariant_deserialize_data;

/** */
alias json_gvariant_serialize = c_json_gvariant_serialize;

/** */
alias json_gvariant_serialize_data = c_json_gvariant_serialize_data;

/** */
alias json_serialize_gobject = c_json_serialize_gobject;

/** */
alias json_string_compare = c_json_string_compare;

/** */
alias json_string_equal = c_json_string_equal;

/** */
alias json_string_hash = c_json_string_hash;

/** */
alias json_to_string = c_json_to_string;

// ParserError

/** */
alias json_parser_error_quark = c_json_parser_error_quark;

// PathError

/** */
alias json_path_error_quark = c_json_path_error_quark;

// ReaderError

/** */
alias json_reader_error_quark = c_json_reader_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.json1", "Json");

  // Array
  gidLink(cast(void**)&json_array_get_type, "json_array_get_type", libs);
  gidLink(cast(void**)&json_array_new, "json_array_new", libs);
  gidLink(cast(void**)&json_array_sized_new, "json_array_sized_new", libs);
  gidLink(cast(void**)&json_array_add_array_element, "json_array_add_array_element", libs);
  gidLink(cast(void**)&json_array_add_boolean_element, "json_array_add_boolean_element", libs);
  gidLink(cast(void**)&json_array_add_double_element, "json_array_add_double_element", libs);
  gidLink(cast(void**)&json_array_add_element, "json_array_add_element", libs);
  gidLink(cast(void**)&json_array_add_int_element, "json_array_add_int_element", libs);
  gidLink(cast(void**)&json_array_add_null_element, "json_array_add_null_element", libs);
  gidLink(cast(void**)&json_array_add_object_element, "json_array_add_object_element", libs);
  gidLink(cast(void**)&json_array_add_string_element, "json_array_add_string_element", libs);
  gidLink(cast(void**)&json_array_dup_element, "json_array_dup_element", libs);
  gidLink(cast(void**)&json_array_equal, "json_array_equal", libs);
  gidLink(cast(void**)&json_array_foreach_element, "json_array_foreach_element", libs);
  gidLink(cast(void**)&json_array_get_array_element, "json_array_get_array_element", libs);
  gidLink(cast(void**)&json_array_get_boolean_element, "json_array_get_boolean_element", libs);
  gidLink(cast(void**)&json_array_get_double_element, "json_array_get_double_element", libs);
  gidLink(cast(void**)&json_array_get_element, "json_array_get_element", libs);
  gidLink(cast(void**)&json_array_get_elements, "json_array_get_elements", libs);
  gidLink(cast(void**)&json_array_get_int_element, "json_array_get_int_element", libs);
  gidLink(cast(void**)&json_array_get_length, "json_array_get_length", libs);
  gidLink(cast(void**)&json_array_get_null_element, "json_array_get_null_element", libs);
  gidLink(cast(void**)&json_array_get_object_element, "json_array_get_object_element", libs);
  gidLink(cast(void**)&json_array_get_string_element, "json_array_get_string_element", libs);
  gidLink(cast(void**)&json_array_hash, "json_array_hash", libs);
  gidLink(cast(void**)&json_array_is_immutable, "json_array_is_immutable", libs);
  gidLink(cast(void**)&json_array_ref, "json_array_ref", libs);
  gidLink(cast(void**)&json_array_remove_element, "json_array_remove_element", libs);
  gidLink(cast(void**)&json_array_seal, "json_array_seal", libs);
  gidLink(cast(void**)&json_array_unref, "json_array_unref", libs);

  // Builder
  gidLink(cast(void**)&json_builder_get_type, "json_builder_get_type", libs);
  gidLink(cast(void**)&json_builder_new, "json_builder_new", libs);
  gidLink(cast(void**)&json_builder_new_immutable, "json_builder_new_immutable", libs);
  gidLink(cast(void**)&json_builder_add_boolean_value, "json_builder_add_boolean_value", libs);
  gidLink(cast(void**)&json_builder_add_double_value, "json_builder_add_double_value", libs);
  gidLink(cast(void**)&json_builder_add_int_value, "json_builder_add_int_value", libs);
  gidLink(cast(void**)&json_builder_add_null_value, "json_builder_add_null_value", libs);
  gidLink(cast(void**)&json_builder_add_string_value, "json_builder_add_string_value", libs);
  gidLink(cast(void**)&json_builder_add_value, "json_builder_add_value", libs);
  gidLink(cast(void**)&json_builder_begin_array, "json_builder_begin_array", libs);
  gidLink(cast(void**)&json_builder_begin_object, "json_builder_begin_object", libs);
  gidLink(cast(void**)&json_builder_end_array, "json_builder_end_array", libs);
  gidLink(cast(void**)&json_builder_end_object, "json_builder_end_object", libs);
  gidLink(cast(void**)&json_builder_get_root, "json_builder_get_root", libs);
  gidLink(cast(void**)&json_builder_reset, "json_builder_reset", libs);
  gidLink(cast(void**)&json_builder_set_member_name, "json_builder_set_member_name", libs);

  // Generator
  gidLink(cast(void**)&json_generator_get_type, "json_generator_get_type", libs);
  gidLink(cast(void**)&json_generator_new, "json_generator_new", libs);
  gidLink(cast(void**)&json_generator_get_indent, "json_generator_get_indent", libs);
  gidLink(cast(void**)&json_generator_get_indent_char, "json_generator_get_indent_char", libs);
  gidLink(cast(void**)&json_generator_get_pretty, "json_generator_get_pretty", libs);
  gidLink(cast(void**)&json_generator_get_root, "json_generator_get_root", libs);
  gidLink(cast(void**)&json_generator_set_indent, "json_generator_set_indent", libs);
  gidLink(cast(void**)&json_generator_set_indent_char, "json_generator_set_indent_char", libs);
  gidLink(cast(void**)&json_generator_set_pretty, "json_generator_set_pretty", libs);
  gidLink(cast(void**)&json_generator_set_root, "json_generator_set_root", libs);
  gidLink(cast(void**)&json_generator_take_root, "json_generator_take_root", libs);
  gidLink(cast(void**)&json_generator_to_data, "json_generator_to_data", libs);
  gidLink(cast(void**)&json_generator_to_file, "json_generator_to_file", libs);
  gidLink(cast(void**)&json_generator_to_gstring, "json_generator_to_gstring", libs);
  gidLink(cast(void**)&json_generator_to_stream, "json_generator_to_stream", libs);

  // Node
  gidLink(cast(void**)&json_node_get_type, "json_node_get_type", libs);
  gidLink(cast(void**)&json_node_alloc, "json_node_alloc", libs);
  gidLink(cast(void**)&json_node_new, "json_node_new", libs);
  gidLink(cast(void**)&json_node_copy, "json_node_copy", libs);
  gidLink(cast(void**)&json_node_dup_array, "json_node_dup_array", libs);
  gidLink(cast(void**)&json_node_dup_object, "json_node_dup_object", libs);
  gidLink(cast(void**)&json_node_dup_string, "json_node_dup_string", libs);
  gidLink(cast(void**)&json_node_equal, "json_node_equal", libs);
  gidLink(cast(void**)&json_node_free, "json_node_free", libs);
  gidLink(cast(void**)&json_node_get_array, "json_node_get_array", libs);
  gidLink(cast(void**)&json_node_get_boolean, "json_node_get_boolean", libs);
  gidLink(cast(void**)&json_node_get_double, "json_node_get_double", libs);
  gidLink(cast(void**)&json_node_get_int, "json_node_get_int", libs);
  gidLink(cast(void**)&json_node_get_node_type, "json_node_get_node_type", libs);
  gidLink(cast(void**)&json_node_get_object, "json_node_get_object", libs);
  gidLink(cast(void**)&json_node_get_parent, "json_node_get_parent", libs);
  gidLink(cast(void**)&json_node_get_string, "json_node_get_string", libs);
  gidLink(cast(void**)&json_node_get_value, "json_node_get_value", libs);
  gidLink(cast(void**)&json_node_get_value_type, "json_node_get_value_type", libs);
  gidLink(cast(void**)&json_node_hash, "json_node_hash", libs);
  gidLink(cast(void**)&json_node_init, "json_node_init", libs);
  gidLink(cast(void**)&json_node_init_array, "json_node_init_array", libs);
  gidLink(cast(void**)&json_node_init_boolean, "json_node_init_boolean", libs);
  gidLink(cast(void**)&json_node_init_double, "json_node_init_double", libs);
  gidLink(cast(void**)&json_node_init_int, "json_node_init_int", libs);
  gidLink(cast(void**)&json_node_init_null, "json_node_init_null", libs);
  gidLink(cast(void**)&json_node_init_object, "json_node_init_object", libs);
  gidLink(cast(void**)&json_node_init_string, "json_node_init_string", libs);
  gidLink(cast(void**)&json_node_is_immutable, "json_node_is_immutable", libs);
  gidLink(cast(void**)&json_node_is_null, "json_node_is_null", libs);
  gidLink(cast(void**)&json_node_ref, "json_node_ref", libs);
  gidLink(cast(void**)&json_node_seal, "json_node_seal", libs);
  gidLink(cast(void**)&json_node_set_array, "json_node_set_array", libs);
  gidLink(cast(void**)&json_node_set_boolean, "json_node_set_boolean", libs);
  gidLink(cast(void**)&json_node_set_double, "json_node_set_double", libs);
  gidLink(cast(void**)&json_node_set_int, "json_node_set_int", libs);
  gidLink(cast(void**)&json_node_set_object, "json_node_set_object", libs);
  gidLink(cast(void**)&json_node_set_parent, "json_node_set_parent", libs);
  gidLink(cast(void**)&json_node_set_string, "json_node_set_string", libs);
  gidLink(cast(void**)&json_node_set_value, "json_node_set_value", libs);
  gidLink(cast(void**)&json_node_take_array, "json_node_take_array", libs);
  gidLink(cast(void**)&json_node_take_object, "json_node_take_object", libs);
  gidLink(cast(void**)&json_node_type_name, "json_node_type_name", libs);
  gidLink(cast(void**)&json_node_unref, "json_node_unref", libs);

  // ObjectIter
  gidLink(cast(void**)&json_object_iter_init, "json_object_iter_init", libs);
  gidLink(cast(void**)&json_object_iter_init_ordered, "json_object_iter_init_ordered", libs);
  gidLink(cast(void**)&json_object_iter_next, "json_object_iter_next", libs);
  gidLink(cast(void**)&json_object_iter_next_ordered, "json_object_iter_next_ordered", libs);

  // ObjectWrap
  gidLink(cast(void**)&json_object_get_type, "json_object_get_type", libs);
  gidLink(cast(void**)&json_object_new, "json_object_new", libs);
  gidLink(cast(void**)&json_object_add_member, "json_object_add_member", libs);
  gidLink(cast(void**)&json_object_dup_member, "json_object_dup_member", libs);
  gidLink(cast(void**)&json_object_equal, "json_object_equal", libs);
  gidLink(cast(void**)&json_object_foreach_member, "json_object_foreach_member", libs);
  gidLink(cast(void**)&json_object_get_array_member, "json_object_get_array_member", libs);
  gidLink(cast(void**)&json_object_get_boolean_member, "json_object_get_boolean_member", libs);
  gidLink(cast(void**)&json_object_get_boolean_member_with_default, "json_object_get_boolean_member_with_default", libs);
  gidLink(cast(void**)&json_object_get_double_member, "json_object_get_double_member", libs);
  gidLink(cast(void**)&json_object_get_double_member_with_default, "json_object_get_double_member_with_default", libs);
  gidLink(cast(void**)&json_object_get_int_member, "json_object_get_int_member", libs);
  gidLink(cast(void**)&json_object_get_int_member_with_default, "json_object_get_int_member_with_default", libs);
  gidLink(cast(void**)&json_object_get_member, "json_object_get_member", libs);
  gidLink(cast(void**)&json_object_get_members, "json_object_get_members", libs);
  gidLink(cast(void**)&json_object_get_null_member, "json_object_get_null_member", libs);
  gidLink(cast(void**)&json_object_get_object_member, "json_object_get_object_member", libs);
  gidLink(cast(void**)&json_object_get_size, "json_object_get_size", libs);
  gidLink(cast(void**)&json_object_get_string_member, "json_object_get_string_member", libs);
  gidLink(cast(void**)&json_object_get_string_member_with_default, "json_object_get_string_member_with_default", libs);
  gidLink(cast(void**)&json_object_get_values, "json_object_get_values", libs);
  gidLink(cast(void**)&json_object_has_member, "json_object_has_member", libs);
  gidLink(cast(void**)&json_object_hash, "json_object_hash", libs);
  gidLink(cast(void**)&json_object_is_immutable, "json_object_is_immutable", libs);
  gidLink(cast(void**)&json_object_ref, "json_object_ref", libs);
  gidLink(cast(void**)&json_object_remove_member, "json_object_remove_member", libs);
  gidLink(cast(void**)&json_object_seal, "json_object_seal", libs);
  gidLink(cast(void**)&json_object_set_array_member, "json_object_set_array_member", libs);
  gidLink(cast(void**)&json_object_set_boolean_member, "json_object_set_boolean_member", libs);
  gidLink(cast(void**)&json_object_set_double_member, "json_object_set_double_member", libs);
  gidLink(cast(void**)&json_object_set_int_member, "json_object_set_int_member", libs);
  gidLink(cast(void**)&json_object_set_member, "json_object_set_member", libs);
  gidLink(cast(void**)&json_object_set_null_member, "json_object_set_null_member", libs);
  gidLink(cast(void**)&json_object_set_object_member, "json_object_set_object_member", libs);
  gidLink(cast(void**)&json_object_set_string_member, "json_object_set_string_member", libs);
  gidLink(cast(void**)&json_object_unref, "json_object_unref", libs);

  // Parser
  gidLink(cast(void**)&json_parser_get_type, "json_parser_get_type", libs);
  gidLink(cast(void**)&json_parser_new, "json_parser_new", libs);
  gidLink(cast(void**)&json_parser_new_immutable, "json_parser_new_immutable", libs);
  gidLink(cast(void**)&json_parser_get_current_line, "json_parser_get_current_line", libs);
  gidLink(cast(void**)&json_parser_get_current_pos, "json_parser_get_current_pos", libs);
  gidLink(cast(void**)&json_parser_get_root, "json_parser_get_root", libs);
  gidLink(cast(void**)&json_parser_get_strict, "json_parser_get_strict", libs);
  gidLink(cast(void**)&json_parser_has_assignment, "json_parser_has_assignment", libs);
  gidLink(cast(void**)&json_parser_load_from_data, "json_parser_load_from_data", libs);
  gidLink(cast(void**)&json_parser_load_from_file, "json_parser_load_from_file", libs);
  gidLink(cast(void**)&json_parser_load_from_mapped_file, "json_parser_load_from_mapped_file", libs);
  gidLink(cast(void**)&json_parser_load_from_stream, "json_parser_load_from_stream", libs);
  gidLink(cast(void**)&json_parser_load_from_stream_async, "json_parser_load_from_stream_async", libs);
  gidLink(cast(void**)&json_parser_load_from_stream_finish, "json_parser_load_from_stream_finish", libs);
  gidLink(cast(void**)&json_parser_set_strict, "json_parser_set_strict", libs);
  gidLink(cast(void**)&json_parser_steal_root, "json_parser_steal_root", libs);

  // Path
  gidLink(cast(void**)&json_path_get_type, "json_path_get_type", libs);
  gidLink(cast(void**)&json_path_new, "json_path_new", libs);
  gidLink(cast(void**)&json_path_query, "json_path_query", libs);
  gidLink(cast(void**)&json_path_compile, "json_path_compile", libs);
  gidLink(cast(void**)&json_path_match, "json_path_match", libs);

  // Reader
  gidLink(cast(void**)&json_reader_get_type, "json_reader_get_type", libs);
  gidLink(cast(void**)&json_reader_new, "json_reader_new", libs);
  gidLink(cast(void**)&json_reader_count_elements, "json_reader_count_elements", libs);
  gidLink(cast(void**)&json_reader_count_members, "json_reader_count_members", libs);
  gidLink(cast(void**)&json_reader_end_element, "json_reader_end_element", libs);
  gidLink(cast(void**)&json_reader_end_member, "json_reader_end_member", libs);
  gidLink(cast(void**)&json_reader_get_boolean_value, "json_reader_get_boolean_value", libs);
  gidLink(cast(void**)&json_reader_get_current_node, "json_reader_get_current_node", libs);
  gidLink(cast(void**)&json_reader_get_double_value, "json_reader_get_double_value", libs);
  gidLink(cast(void**)&json_reader_get_error, "json_reader_get_error", libs);
  gidLink(cast(void**)&json_reader_get_int_value, "json_reader_get_int_value", libs);
  gidLink(cast(void**)&json_reader_get_member_name, "json_reader_get_member_name", libs);
  gidLink(cast(void**)&json_reader_get_null_value, "json_reader_get_null_value", libs);
  gidLink(cast(void**)&json_reader_get_string_value, "json_reader_get_string_value", libs);
  gidLink(cast(void**)&json_reader_get_value, "json_reader_get_value", libs);
  gidLink(cast(void**)&json_reader_is_array, "json_reader_is_array", libs);
  gidLink(cast(void**)&json_reader_is_object, "json_reader_is_object", libs);
  gidLink(cast(void**)&json_reader_is_value, "json_reader_is_value", libs);
  gidLink(cast(void**)&json_reader_list_members, "json_reader_list_members", libs);
  gidLink(cast(void**)&json_reader_read_element, "json_reader_read_element", libs);
  gidLink(cast(void**)&json_reader_read_member, "json_reader_read_member", libs);
  gidLink(cast(void**)&json_reader_set_root, "json_reader_set_root", libs);

  // Serializable
  gidLink(cast(void**)&json_serializable_get_type, "json_serializable_get_type", libs);
  gidLink(cast(void**)&json_serializable_default_deserialize_property, "json_serializable_default_deserialize_property", libs);
  gidLink(cast(void**)&json_serializable_default_serialize_property, "json_serializable_default_serialize_property", libs);
  gidLink(cast(void**)&json_serializable_deserialize_property, "json_serializable_deserialize_property", libs);
  gidLink(cast(void**)&json_serializable_find_property, "json_serializable_find_property", libs);
  gidLink(cast(void**)&json_serializable_get_property, "json_serializable_get_property", libs);
  gidLink(cast(void**)&json_serializable_list_properties, "json_serializable_list_properties", libs);
  gidLink(cast(void**)&json_serializable_serialize_property, "json_serializable_serialize_property", libs);
  gidLink(cast(void**)&json_serializable_set_property, "json_serializable_set_property", libs);

  // global
  gidLink(cast(void**)&json_boxed_can_deserialize, "json_boxed_can_deserialize", libs);
  gidLink(cast(void**)&json_boxed_can_serialize, "json_boxed_can_serialize", libs);
  gidLink(cast(void**)&json_boxed_deserialize, "json_boxed_deserialize", libs);
  gidLink(cast(void**)&json_boxed_register_deserialize_func, "json_boxed_register_deserialize_func", libs);
  gidLink(cast(void**)&json_boxed_register_serialize_func, "json_boxed_register_serialize_func", libs);
  gidLink(cast(void**)&json_boxed_serialize, "json_boxed_serialize", libs);
  gidLink(cast(void**)&json_construct_gobject, "json_construct_gobject", libs);
  gidLink(cast(void**)&json_from_string, "json_from_string", libs);
  gidLink(cast(void**)&json_gobject_deserialize, "json_gobject_deserialize", libs);
  gidLink(cast(void**)&json_gobject_from_data, "json_gobject_from_data", libs);
  gidLink(cast(void**)&json_gobject_serialize, "json_gobject_serialize", libs);
  gidLink(cast(void**)&json_gobject_to_data, "json_gobject_to_data", libs);
  gidLink(cast(void**)&json_gvariant_deserialize, "json_gvariant_deserialize", libs);
  gidLink(cast(void**)&json_gvariant_deserialize_data, "json_gvariant_deserialize_data", libs);
  gidLink(cast(void**)&json_gvariant_serialize, "json_gvariant_serialize", libs);
  gidLink(cast(void**)&json_gvariant_serialize_data, "json_gvariant_serialize_data", libs);
  gidLink(cast(void**)&json_serialize_gobject, "json_serialize_gobject", libs);
  gidLink(cast(void**)&json_string_compare, "json_string_compare", libs);
  gidLink(cast(void**)&json_string_equal, "json_string_equal", libs);
  gidLink(cast(void**)&json_string_hash, "json_string_hash", libs);
  gidLink(cast(void**)&json_to_string, "json_to_string", libs);

  // ParserError
  gidLink(cast(void**)&json_parser_error_quark, "json_parser_error_quark", libs);

  // PathError
  gidLink(cast(void**)&json_path_error_quark, "json_path_error_quark", libs);

  // ReaderError
  gidLink(cast(void**)&json_reader_error_quark, "json_reader_error_quark", libs);
}
