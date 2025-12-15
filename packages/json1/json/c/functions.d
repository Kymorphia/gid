/// C functions for json1 library
module json.c.functions;

public import gid.basictypes;
import gid.loader;
import json.c.types;
public import gobject.c.types;
public import gio.c.types;

version(Windows)
  private immutable LIBS = ["libjson-glib-1.0-0.dll;json-glib-1.0-0.dll;json-glib-1.dll"];
else version(OSX)
  private immutable LIBS = ["libjson-glib-1.0.0.dylib"];
else
  private immutable LIBS = ["libjson-glib-1.0.so.0"];

__gshared extern(C)
{
  // Array
  GType function() c_json_array_get_type; ///
  JsonArray* function() c_json_array_new; ///
  JsonArray* function(uint nElements) c_json_array_sized_new; ///
  void function(JsonArray* array, JsonArray* value) c_json_array_add_array_element; ///
  void function(JsonArray* array, gboolean value) c_json_array_add_boolean_element; ///
  void function(JsonArray* array, double value) c_json_array_add_double_element; ///
  void function(JsonArray* array, JsonNode* node) c_json_array_add_element; ///
  void function(JsonArray* array, long value) c_json_array_add_int_element; ///
  void function(JsonArray* array) c_json_array_add_null_element; ///
  void function(JsonArray* array, JsonObject* value) c_json_array_add_object_element; ///
  void function(JsonArray* array, const(char)* value) c_json_array_add_string_element; ///
  JsonNode* function(JsonArray* array, uint index) c_json_array_dup_element; ///
  gboolean function(JsonArray* a, JsonArray* b) c_json_array_equal; ///
  void function(JsonArray* array, JsonArrayForeach func, void* data) c_json_array_foreach_element; ///
  JsonArray* function(JsonArray* array, uint index) c_json_array_get_array_element; ///
  gboolean function(JsonArray* array, uint index) c_json_array_get_boolean_element; ///
  double function(JsonArray* array, uint index) c_json_array_get_double_element; ///
  JsonNode* function(JsonArray* array, uint index) c_json_array_get_element; ///
  GList* function(JsonArray* array) c_json_array_get_elements; ///
  long function(JsonArray* array, uint index) c_json_array_get_int_element; ///
  uint function(JsonArray* array) c_json_array_get_length; ///
  gboolean function(JsonArray* array, uint index) c_json_array_get_null_element; ///
  JsonObject* function(JsonArray* array, uint index) c_json_array_get_object_element; ///
  const(char)* function(JsonArray* array, uint index) c_json_array_get_string_element; ///
  uint function(JsonArray* key) c_json_array_hash; ///
  gboolean function(JsonArray* array) c_json_array_is_immutable; ///
  JsonArray* function(JsonArray* array) c_json_array_ref; ///
  void function(JsonArray* array, uint index) c_json_array_remove_element; ///
  void function(JsonArray* array) c_json_array_seal; ///
  void function(JsonArray* array) c_json_array_unref; ///

  // Builder
  GType function() c_json_builder_get_type; ///
  JsonBuilder* function() c_json_builder_new; ///
  JsonBuilder* function() c_json_builder_new_immutable; ///
  JsonBuilder* function(JsonBuilder* builder, gboolean value) c_json_builder_add_boolean_value; ///
  JsonBuilder* function(JsonBuilder* builder, double value) c_json_builder_add_double_value; ///
  JsonBuilder* function(JsonBuilder* builder, long value) c_json_builder_add_int_value; ///
  JsonBuilder* function(JsonBuilder* builder) c_json_builder_add_null_value; ///
  JsonBuilder* function(JsonBuilder* builder, const(char)* value) c_json_builder_add_string_value; ///
  JsonBuilder* function(JsonBuilder* builder, JsonNode* node) c_json_builder_add_value; ///
  JsonBuilder* function(JsonBuilder* builder) c_json_builder_begin_array; ///
  JsonBuilder* function(JsonBuilder* builder) c_json_builder_begin_object; ///
  JsonBuilder* function(JsonBuilder* builder) c_json_builder_end_array; ///
  JsonBuilder* function(JsonBuilder* builder) c_json_builder_end_object; ///
  JsonNode* function(JsonBuilder* builder) c_json_builder_get_root; ///
  void function(JsonBuilder* builder) c_json_builder_reset; ///
  JsonBuilder* function(JsonBuilder* builder, const(char)* memberName) c_json_builder_set_member_name; ///

  // Generator
  GType function() c_json_generator_get_type; ///
  JsonGenerator* function() c_json_generator_new; ///
  uint function(JsonGenerator* generator) c_json_generator_get_indent; ///
  dchar function(JsonGenerator* generator) c_json_generator_get_indent_char; ///
  gboolean function(JsonGenerator* generator) c_json_generator_get_pretty; ///
  JsonNode* function(JsonGenerator* generator) c_json_generator_get_root; ///
  void function(JsonGenerator* generator, uint indentLevel) c_json_generator_set_indent; ///
  void function(JsonGenerator* generator, dchar indentChar) c_json_generator_set_indent_char; ///
  void function(JsonGenerator* generator, gboolean isPretty) c_json_generator_set_pretty; ///
  void function(JsonGenerator* generator, JsonNode* node) c_json_generator_set_root; ///
  char* function(JsonGenerator* generator, size_t* length) c_json_generator_to_data; ///
  gboolean function(JsonGenerator* generator, const(char)* filename, GError** _err) c_json_generator_to_file; ///
  GString* function(JsonGenerator* generator, GString* string_) c_json_generator_to_gstring; ///
  gboolean function(JsonGenerator* generator, GOutputStream* stream, GCancellable* cancellable, GError** _err) c_json_generator_to_stream; ///

  // Node
  GType function() c_json_node_get_type; ///
  JsonNode* function() c_json_node_alloc; ///
  JsonNode* function(JsonNodeType type) c_json_node_new; ///
  JsonNode* function(JsonNode* node) c_json_node_copy; ///
  JsonArray* function(JsonNode* node) c_json_node_dup_array; ///
  JsonObject* function(JsonNode* node) c_json_node_dup_object; ///
  char* function(JsonNode* node) c_json_node_dup_string; ///
  gboolean function(JsonNode* a, JsonNode* b) c_json_node_equal; ///
  void function(JsonNode* node) c_json_node_free; ///
  JsonArray* function(JsonNode* node) c_json_node_get_array; ///
  gboolean function(JsonNode* node) c_json_node_get_boolean; ///
  double function(JsonNode* node) c_json_node_get_double; ///
  long function(JsonNode* node) c_json_node_get_int; ///
  JsonNodeType function(JsonNode* node) c_json_node_get_node_type; ///
  JsonObject* function(JsonNode* node) c_json_node_get_object; ///
  JsonNode* function(JsonNode* node) c_json_node_get_parent; ///
  const(char)* function(JsonNode* node) c_json_node_get_string; ///
  void function(JsonNode* node, GValue* value) c_json_node_get_value; ///
  GType function(JsonNode* node) c_json_node_get_value_type; ///
  uint function(JsonNode* key) c_json_node_hash; ///
  JsonNode* function(JsonNode* node, JsonNodeType type) c_json_node_init; ///
  JsonNode* function(JsonNode* node, JsonArray* array) c_json_node_init_array; ///
  JsonNode* function(JsonNode* node, gboolean value) c_json_node_init_boolean; ///
  JsonNode* function(JsonNode* node, double value) c_json_node_init_double; ///
  JsonNode* function(JsonNode* node, long value) c_json_node_init_int; ///
  JsonNode* function(JsonNode* node) c_json_node_init_null; ///
  JsonNode* function(JsonNode* node, JsonObject* object) c_json_node_init_object; ///
  JsonNode* function(JsonNode* node, const(char)* value) c_json_node_init_string; ///
  gboolean function(JsonNode* node) c_json_node_is_immutable; ///
  gboolean function(JsonNode* node) c_json_node_is_null; ///
  JsonNode* function(JsonNode* node) c_json_node_ref; ///
  void function(JsonNode* node) c_json_node_seal; ///
  void function(JsonNode* node, JsonArray* array) c_json_node_set_array; ///
  void function(JsonNode* node, gboolean value) c_json_node_set_boolean; ///
  void function(JsonNode* node, double value) c_json_node_set_double; ///
  void function(JsonNode* node, long value) c_json_node_set_int; ///
  void function(JsonNode* node, JsonObject* object) c_json_node_set_object; ///
  void function(JsonNode* node, JsonNode* parent) c_json_node_set_parent; ///
  void function(JsonNode* node, const(char)* value) c_json_node_set_string; ///
  void function(JsonNode* node, const(GValue)* value) c_json_node_set_value; ///
  void function(JsonNode* node, JsonArray* array) c_json_node_take_array; ///
  void function(JsonNode* node, JsonObject* object) c_json_node_take_object; ///
  const(char)* function(JsonNode* node) c_json_node_type_name; ///
  void function(JsonNode* node) c_json_node_unref; ///

  // ObjectIter
  void function(JsonObjectIter* iter, JsonObject* object) c_json_object_iter_init; ///
  void function(JsonObjectIter* iter, JsonObject* object) c_json_object_iter_init_ordered; ///
  gboolean function(JsonObjectIter* iter, const(char*)* memberName, JsonNode** memberNode) c_json_object_iter_next; ///
  gboolean function(JsonObjectIter* iter, const(char*)* memberName, JsonNode** memberNode) c_json_object_iter_next_ordered; ///

  // ObjectWrap
  GType function() c_json_object_get_type; ///
  JsonObject* function() c_json_object_new; ///
  void function(JsonObject* object, const(char)* memberName, JsonNode* node) c_json_object_add_member; ///
  JsonNode* function(JsonObject* object, const(char)* memberName) c_json_object_dup_member; ///
  gboolean function(JsonObject* a, JsonObject* b) c_json_object_equal; ///
  void function(JsonObject* object, JsonObjectForeach func, void* data) c_json_object_foreach_member; ///
  JsonArray* function(JsonObject* object, const(char)* memberName) c_json_object_get_array_member; ///
  gboolean function(JsonObject* object, const(char)* memberName) c_json_object_get_boolean_member; ///
  gboolean function(JsonObject* object, const(char)* memberName, gboolean defaultValue) c_json_object_get_boolean_member_with_default; ///
  double function(JsonObject* object, const(char)* memberName) c_json_object_get_double_member; ///
  double function(JsonObject* object, const(char)* memberName, double defaultValue) c_json_object_get_double_member_with_default; ///
  long function(JsonObject* object, const(char)* memberName) c_json_object_get_int_member; ///
  long function(JsonObject* object, const(char)* memberName, long defaultValue) c_json_object_get_int_member_with_default; ///
  JsonNode* function(JsonObject* object, const(char)* memberName) c_json_object_get_member; ///
  GList* function(JsonObject* object) c_json_object_get_members; ///
  gboolean function(JsonObject* object, const(char)* memberName) c_json_object_get_null_member; ///
  JsonObject* function(JsonObject* object, const(char)* memberName) c_json_object_get_object_member; ///
  uint function(JsonObject* object) c_json_object_get_size; ///
  const(char)* function(JsonObject* object, const(char)* memberName) c_json_object_get_string_member; ///
  const(char)* function(JsonObject* object, const(char)* memberName, const(char)* defaultValue) c_json_object_get_string_member_with_default; ///
  GList* function(JsonObject* object) c_json_object_get_values; ///
  gboolean function(JsonObject* object, const(char)* memberName) c_json_object_has_member; ///
  uint function(JsonObject* key) c_json_object_hash; ///
  gboolean function(JsonObject* object) c_json_object_is_immutable; ///
  JsonObject* function(JsonObject* object) c_json_object_ref; ///
  void function(JsonObject* object, const(char)* memberName) c_json_object_remove_member; ///
  void function(JsonObject* object) c_json_object_seal; ///
  void function(JsonObject* object, const(char)* memberName, JsonArray* value) c_json_object_set_array_member; ///
  void function(JsonObject* object, const(char)* memberName, gboolean value) c_json_object_set_boolean_member; ///
  void function(JsonObject* object, const(char)* memberName, double value) c_json_object_set_double_member; ///
  void function(JsonObject* object, const(char)* memberName, long value) c_json_object_set_int_member; ///
  void function(JsonObject* object, const(char)* memberName, JsonNode* node) c_json_object_set_member; ///
  void function(JsonObject* object, const(char)* memberName) c_json_object_set_null_member; ///
  void function(JsonObject* object, const(char)* memberName, JsonObject* value) c_json_object_set_object_member; ///
  void function(JsonObject* object, const(char)* memberName, const(char)* value) c_json_object_set_string_member; ///
  void function(JsonObject* object) c_json_object_unref; ///

  // Parser
  GType function() c_json_parser_get_type; ///
  JsonParser* function() c_json_parser_new; ///
  JsonParser* function() c_json_parser_new_immutable; ///
  uint function(JsonParser* parser) c_json_parser_get_current_line; ///
  uint function(JsonParser* parser) c_json_parser_get_current_pos; ///
  JsonNode* function(JsonParser* parser) c_json_parser_get_root; ///
  gboolean function(JsonParser* parser, char** variableName) c_json_parser_has_assignment; ///
  gboolean function(JsonParser* parser, const(char)* data, ptrdiff_t length, GError** _err) c_json_parser_load_from_data; ///
  gboolean function(JsonParser* parser, const(char)* filename, GError** _err) c_json_parser_load_from_file; ///
  gboolean function(JsonParser* parser, const(char)* filename, GError** _err) c_json_parser_load_from_mapped_file; ///
  gboolean function(JsonParser* parser, GInputStream* stream, GCancellable* cancellable, GError** _err) c_json_parser_load_from_stream; ///
  void function(JsonParser* parser, GInputStream* stream, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_json_parser_load_from_stream_async; ///
  gboolean function(JsonParser* parser, GAsyncResult* result, GError** _err) c_json_parser_load_from_stream_finish; ///
  JsonNode* function(JsonParser* parser) c_json_parser_steal_root; ///

  // Path
  GType function() c_json_path_get_type; ///
  JsonPath* function() c_json_path_new; ///
  JsonNode* function(const(char)* expression, JsonNode* root, GError** _err) c_json_path_query; ///
  gboolean function(JsonPath* path, const(char)* expression, GError** _err) c_json_path_compile; ///
  JsonNode* function(JsonPath* path, JsonNode* root) c_json_path_match; ///

  // Reader
  GType function() c_json_reader_get_type; ///
  JsonReader* function(JsonNode* node) c_json_reader_new; ///
  int function(JsonReader* reader) c_json_reader_count_elements; ///
  int function(JsonReader* reader) c_json_reader_count_members; ///
  void function(JsonReader* reader) c_json_reader_end_element; ///
  void function(JsonReader* reader) c_json_reader_end_member; ///
  gboolean function(JsonReader* reader) c_json_reader_get_boolean_value; ///
  JsonNode* function(JsonReader* reader) c_json_reader_get_current_node; ///
  double function(JsonReader* reader) c_json_reader_get_double_value; ///
  const(GError)* function(JsonReader* reader) c_json_reader_get_error; ///
  long function(JsonReader* reader) c_json_reader_get_int_value; ///
  const(char)* function(JsonReader* reader) c_json_reader_get_member_name; ///
  gboolean function(JsonReader* reader) c_json_reader_get_null_value; ///
  const(char)* function(JsonReader* reader) c_json_reader_get_string_value; ///
  JsonNode* function(JsonReader* reader) c_json_reader_get_value; ///
  gboolean function(JsonReader* reader) c_json_reader_is_array; ///
  gboolean function(JsonReader* reader) c_json_reader_is_object; ///
  gboolean function(JsonReader* reader) c_json_reader_is_value; ///
  char** function(JsonReader* reader) c_json_reader_list_members; ///
  gboolean function(JsonReader* reader, uint index) c_json_reader_read_element; ///
  gboolean function(JsonReader* reader, const(char)* memberName) c_json_reader_read_member; ///
  void function(JsonReader* reader, JsonNode* root) c_json_reader_set_root; ///

  // Serializable
  GType function() c_json_serializable_get_type; ///
  gboolean function(JsonSerializable* serializable, const(char)* propertyName, GValue* value, GParamSpec* pspec, JsonNode* propertyNode) c_json_serializable_default_deserialize_property; ///
  JsonNode* function(JsonSerializable* serializable, const(char)* propertyName, const(GValue)* value, GParamSpec* pspec) c_json_serializable_default_serialize_property; ///
  gboolean function(JsonSerializable* serializable, const(char)* propertyName, GValue* value, GParamSpec* pspec, JsonNode* propertyNode) c_json_serializable_deserialize_property; ///
  GParamSpec* function(JsonSerializable* serializable, const(char)* name) c_json_serializable_find_property; ///
  void function(JsonSerializable* serializable, GParamSpec* pspec, GValue* value) c_json_serializable_get_property; ///
  GParamSpec** function(JsonSerializable* serializable, uint* nPspecs) c_json_serializable_list_properties; ///
  JsonNode* function(JsonSerializable* serializable, const(char)* propertyName, const(GValue)* value, GParamSpec* pspec) c_json_serializable_serialize_property; ///
  void function(JsonSerializable* serializable, GParamSpec* pspec, const(GValue)* value) c_json_serializable_set_property; ///

  // global
  gboolean function(GType gboxedType, JsonNodeType nodeType) c_json_boxed_can_deserialize; ///
  gboolean function(GType gboxedType, JsonNodeType* nodeType) c_json_boxed_can_serialize; ///
  void* function(GType gboxedType, JsonNode* node) c_json_boxed_deserialize; ///
  void function(GType gboxedType, JsonNodeType nodeType, JsonBoxedDeserializeFunc deserializeFunc) c_json_boxed_register_deserialize_func; ///
  void function(GType gboxedType, JsonNodeType nodeType, JsonBoxedSerializeFunc serializeFunc) c_json_boxed_register_serialize_func; ///
  JsonNode* function(GType gboxedType, const(void)* boxed) c_json_boxed_serialize; ///
  GObject* function(GType gtype, const(char)* data, size_t length, GError** _err) c_json_construct_gobject; ///
  JsonNode* function(const(char)* str, GError** _err) c_json_from_string; ///
  GObject* function(GType gtype, JsonNode* node) c_json_gobject_deserialize; ///
  GObject* function(GType gtype, const(char)* data, ptrdiff_t length, GError** _err) c_json_gobject_from_data; ///
  JsonNode* function(GObject* gobject) c_json_gobject_serialize; ///
  char* function(GObject* gobject, size_t* length) c_json_gobject_to_data; ///
  GVariant* function(JsonNode* jsonNode, const(char)* signature, GError** _err) c_json_gvariant_deserialize; ///
  GVariant* function(const(char)* json, ptrdiff_t length, const(char)* signature, GError** _err) c_json_gvariant_deserialize_data; ///
  JsonNode* function(GVariant* variant) c_json_gvariant_serialize; ///
  char* function(GVariant* variant, size_t* length) c_json_gvariant_serialize_data; ///
  char* function(GObject* gobject, size_t* length) c_json_serialize_gobject; ///
  int function(const(void)* a, const(void)* b) c_json_string_compare; ///
  gboolean function(const(void)* a, const(void)* b) c_json_string_equal; ///
  uint function(const(void)* key) c_json_string_hash; ///
  char* function(JsonNode* node, gboolean pretty) c_json_to_string; ///

  // ParserError
  GQuark function() c_json_parser_error_quark; ///

  // PathError
  GQuark function() c_json_path_error_quark; ///

  // ReaderError
  GQuark function() c_json_reader_error_quark; ///
}

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
  auto libs = gidResolveLibs(LIBS);

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
  gidLink(cast(void**)&json_parser_has_assignment, "json_parser_has_assignment", libs);
  gidLink(cast(void**)&json_parser_load_from_data, "json_parser_load_from_data", libs);
  gidLink(cast(void**)&json_parser_load_from_file, "json_parser_load_from_file", libs);
  gidLink(cast(void**)&json_parser_load_from_mapped_file, "json_parser_load_from_mapped_file", libs);
  gidLink(cast(void**)&json_parser_load_from_stream, "json_parser_load_from_stream", libs);
  gidLink(cast(void**)&json_parser_load_from_stream_async, "json_parser_load_from_stream_async", libs);
  gidLink(cast(void**)&json_parser_load_from_stream_finish, "json_parser_load_from_stream_finish", libs);
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
