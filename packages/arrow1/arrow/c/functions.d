/// C functions for arrow1 library
module arrow.c.functions;

public import gid.basictypes;
import gid.loader;
import arrow.c.types;
public import gobject.c.types;
public import gio.c.types;

version(Windows)
  private immutable LIBS = ["libarrow-glib-1900.dll;arrow-glib-1900.dll;arrow-glib.dll"];
else version(OSX)
  private immutable LIBS = ["libarrow-glib.1900.dylib"];
else
  private immutable LIBS = ["libarrow-glib.so.1900"];

__gshared extern(C)
{
  // AggregateNodeOptions
  GType function() c_garrow_aggregate_node_options_get_type; ///
  GArrowAggregateNodeOptions* function(GList* aggregations, const(char*)* keys, size_t nKeys, GError** _err) c_garrow_aggregate_node_options_new; ///

  // Aggregation
  GType function() c_garrow_aggregation_get_type; ///
  GArrowAggregation* function(const(char)* function_, GArrowFunctionOptions* options, const(char)* input, const(char)* output) c_garrow_aggregation_new; ///

  // Array
  GType function() c_garrow_array_get_type; ///
  GArrowArray* function(void* cAbiArray, GArrowDataType* dataType, GError** _err) c_garrow_array_import; ///
  GArrowArray* function(GArrowArray* array, GArrowDataType* targetDataType, GArrowCastOptions* options, GError** _err) c_garrow_array_cast; ///
  GArrowArray* function(GArrowArray* array, GList* otherArrays, GError** _err) c_garrow_array_concatenate; ///
  long function(GArrowArray* array, GArrowCountOptions* options, GError** _err) c_garrow_array_count; ///
  GArrowStructArray* function(GArrowArray* array, GError** _err) c_garrow_array_count_values; ///
  GArrowDictionaryArray* function(GArrowArray* array, GError** _err) c_garrow_array_dictionary_encode; ///
  char* function(GArrowArray* array, GArrowArray* otherArray) c_garrow_array_diff_unified; ///
  gboolean function(GArrowArray* array, GArrowArray* otherArray) c_garrow_array_equal; ///
  gboolean function(GArrowArray* array, GArrowArray* otherArray) c_garrow_array_equal_approx; ///
  gboolean function(GArrowArray* array, GArrowArray* otherArray, GArrowEqualOptions* options) c_garrow_array_equal_options; ///
  gboolean function(GArrowArray* array, long startIndex, GArrowArray* otherArray, long otherStartIndex, long endIndex, GArrowEqualOptions* options) c_garrow_array_equal_range; ///
  gboolean function(GArrowArray* array, void** cAbiArray, void** cAbiSchema, GError** _err) c_garrow_array_export; ///
  GArrowArray* function(GArrowArray* array, GArrowBooleanArray* filter, GArrowFilterOptions* options, GError** _err) c_garrow_array_filter; ///
  long function(GArrowArray* array) c_garrow_array_get_length; ///
  long function(GArrowArray* array) c_garrow_array_get_n_nulls; ///
  GArrowBuffer* function(GArrowArray* array) c_garrow_array_get_null_bitmap; ///
  long function(GArrowArray* array) c_garrow_array_get_offset; ///
  GArrowDataType* function(GArrowArray* array) c_garrow_array_get_value_data_type; ///
  GArrowType function(GArrowArray* array) c_garrow_array_get_value_type; ///
  GArrowBooleanArray* function(GArrowArray* left, GArrowArray* right, GError** _err) c_garrow_array_is_in; ///
  GArrowBooleanArray* function(GArrowArray* left, GArrowChunkedArray* right, GError** _err) c_garrow_array_is_in_chunked_array; ///
  gboolean function(GArrowArray* array, long i) c_garrow_array_is_null; ///
  gboolean function(GArrowArray* array, long i) c_garrow_array_is_valid; ///
  GArrowRunEndEncodedArray* function(GArrowArray* array, GArrowRunEndEncodeOptions* options, GError** _err) c_garrow_array_run_end_encode; ///
  GArrowArray* function(GArrowArray* array, long offset, long length) c_garrow_array_slice; ///
  GArrowUInt64Array* function(GArrowArray* array, GArrowSortOrder order, GError** _err) c_garrow_array_sort_indices; ///
  GArrowUInt64Array* function(GArrowArray* array, GError** _err) c_garrow_array_sort_to_indices; ///
  GArrowArray* function(GArrowArray* array, GArrowArray* indices, GArrowTakeOptions* options, GError** _err) c_garrow_array_take; ///
  GArrowChunkedArray* function(GArrowArray* array, GArrowChunkedArray* indices, GArrowTakeOptions* options, GError** _err) c_garrow_array_take_chunked_array; ///
  char* function(GArrowArray* array, GError** _err) c_garrow_array_to_string; ///
  GArrowArray* function(GArrowArray* array, GError** _err) c_garrow_array_unique; ///
  GArrowArray* function(GArrowArray* array, GArrowDataType* returnType, GError** _err) c_garrow_array_view; ///

  // ArrayBuilder
  GType function() c_garrow_array_builder_get_type; ///
  gboolean function(GArrowArrayBuilder* builder, GError** _err) c_garrow_array_builder_append_empty_value; ///
  gboolean function(GArrowArrayBuilder* builder, long n, GError** _err) c_garrow_array_builder_append_empty_values; ///
  gboolean function(GArrowArrayBuilder* builder, GError** _err) c_garrow_array_builder_append_null; ///
  gboolean function(GArrowArrayBuilder* builder, long n, GError** _err) c_garrow_array_builder_append_nulls; ///
  GArrowArray* function(GArrowArrayBuilder* builder, GError** _err) c_garrow_array_builder_finish; ///
  long function(GArrowArrayBuilder* builder) c_garrow_array_builder_get_capacity; ///
  GArrowArrayBuilder* function(GArrowArrayBuilder* builder, int i) c_garrow_array_builder_get_child; ///
  GList* function(GArrowArrayBuilder* builder) c_garrow_array_builder_get_children; ///
  long function(GArrowArrayBuilder* builder) c_garrow_array_builder_get_length; ///
  long function(GArrowArrayBuilder* builder) c_garrow_array_builder_get_n_nulls; ///
  GArrowDataType* function(GArrowArrayBuilder* builder) c_garrow_array_builder_get_value_data_type; ///
  GArrowType function(GArrowArrayBuilder* builder) c_garrow_array_builder_get_value_type; ///
  gboolean function(GArrowArrayBuilder* builder, long additionalCapacity, GError** _err) c_garrow_array_builder_reserve; ///
  void function(GArrowArrayBuilder* builder) c_garrow_array_builder_reset; ///
  gboolean function(GArrowArrayBuilder* builder, long capacity, GError** _err) c_garrow_array_builder_resize; ///

  // ArrayDatum
  GType function() c_garrow_array_datum_get_type; ///
  GArrowArrayDatum* function(GArrowArray* value) c_garrow_array_datum_new; ///

  // ArraySortOptions
  GType function() c_garrow_array_sort_options_get_type; ///
  GArrowArraySortOptions* function(GArrowSortOrder order) c_garrow_array_sort_options_new; ///
  gboolean function(GArrowArraySortOptions* options, GArrowArraySortOptions* otherOptions) c_garrow_array_sort_options_equal; ///

  // AzureFileSystem
  GType function() c_garrow_azure_file_system_get_type; ///

  // BaseBinaryScalar
  GType function() c_garrow_base_binary_scalar_get_type; ///
  GArrowBuffer* function(GArrowBaseBinaryScalar* scalar) c_garrow_base_binary_scalar_get_value; ///

  // BaseListScalar
  GType function() c_garrow_base_list_scalar_get_type; ///
  GArrowArray* function(GArrowBaseListScalar* scalar) c_garrow_base_list_scalar_get_value; ///

  // BinaryArray
  GType function() c_garrow_binary_array_get_type; ///
  GArrowBinaryArray* function(long length, GArrowBuffer* valueOffsets, GArrowBuffer* valueData, GArrowBuffer* nullBitmap, long nNulls) c_garrow_binary_array_new; ///
  GArrowBuffer* function(GArrowBinaryArray* array) c_garrow_binary_array_get_buffer; ///
  GArrowBuffer* function(GArrowBinaryArray* array) c_garrow_binary_array_get_data_buffer; ///
  GArrowBuffer* function(GArrowBinaryArray* array) c_garrow_binary_array_get_offsets_buffer; ///
  GBytes* function(GArrowBinaryArray* array, long i) c_garrow_binary_array_get_value; ///

  // BinaryArrayBuilder
  GType function() c_garrow_binary_array_builder_get_type; ///
  GArrowBinaryArrayBuilder* function() c_garrow_binary_array_builder_new; ///
  gboolean function(GArrowBinaryArrayBuilder* builder, const(ubyte)* value, int length, GError** _err) c_garrow_binary_array_builder_append; ///
  gboolean function(GArrowBinaryArrayBuilder* builder, GError** _err) c_garrow_binary_array_builder_append_null; ///
  gboolean function(GArrowBinaryArrayBuilder* builder, long n, GError** _err) c_garrow_binary_array_builder_append_nulls; ///
  gboolean function(GArrowBinaryArrayBuilder* builder, const(ubyte)* value, int length, GError** _err) c_garrow_binary_array_builder_append_value; ///
  gboolean function(GArrowBinaryArrayBuilder* builder, GBytes* value, GError** _err) c_garrow_binary_array_builder_append_value_bytes; ///
  gboolean function(GArrowBinaryArrayBuilder* builder, GBytes** values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_binary_array_builder_append_values; ///

  // BinaryDataType
  GType function() c_garrow_binary_data_type_get_type; ///
  GArrowBinaryDataType* function() c_garrow_binary_data_type_new; ///

  // BinaryDictionaryArrayBuilder
  GType function() c_garrow_binary_dictionary_array_builder_get_type; ///
  GArrowBinaryDictionaryArrayBuilder* function() c_garrow_binary_dictionary_array_builder_new; ///
  gboolean function(GArrowBinaryDictionaryArrayBuilder* builder, GArrowBinaryArray* array, GError** _err) c_garrow_binary_dictionary_array_builder_append_array; ///
  gboolean function(GArrowBinaryDictionaryArrayBuilder* builder, const(long)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_binary_dictionary_array_builder_append_indices; ///
  gboolean function(GArrowBinaryDictionaryArrayBuilder* builder, GError** _err) c_garrow_binary_dictionary_array_builder_append_null; ///
  gboolean function(GArrowBinaryDictionaryArrayBuilder* builder, const(ubyte)* value, int length, GError** _err) c_garrow_binary_dictionary_array_builder_append_value; ///
  gboolean function(GArrowBinaryDictionaryArrayBuilder* builder, GBytes* value, GError** _err) c_garrow_binary_dictionary_array_builder_append_value_bytes; ///
  gboolean function(GArrowBinaryDictionaryArrayBuilder* builder, GArrowArray** outIndices, GArrowArray** outDelta, GError** _err) c_garrow_binary_dictionary_array_builder_finish_delta; ///
  long function(GArrowBinaryDictionaryArrayBuilder* builder) c_garrow_binary_dictionary_array_builder_get_dictionary_length; ///
  gboolean function(GArrowBinaryDictionaryArrayBuilder* builder, GArrowBinaryArray* values, GError** _err) c_garrow_binary_dictionary_array_builder_insert_memo_values; ///
  void function(GArrowBinaryDictionaryArrayBuilder* builder) c_garrow_binary_dictionary_array_builder_reset_full; ///

  // BinaryScalar
  GType function() c_garrow_binary_scalar_get_type; ///
  GArrowBinaryScalar* function(GArrowBuffer* value) c_garrow_binary_scalar_new; ///

  // BinaryViewDataType
  GType function() c_garrow_binary_view_data_type_get_type; ///
  GArrowBinaryViewDataType* function() c_garrow_binary_view_data_type_new; ///

  // BooleanArray
  GType function() c_garrow_boolean_array_get_type; ///
  GArrowBooleanArray* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_boolean_array_new; ///
  GArrowBooleanArray* function(GArrowBooleanArray* left, GArrowBooleanArray* right, GError** _err) c_garrow_boolean_array_and; ///
  gboolean function(GArrowBooleanArray* array, long i) c_garrow_boolean_array_get_value; ///
  gboolean* function(GArrowBooleanArray* array, long* length) c_garrow_boolean_array_get_values; ///
  GArrowBooleanArray* function(GArrowBooleanArray* array, GError** _err) c_garrow_boolean_array_invert; ///
  GArrowBooleanArray* function(GArrowBooleanArray* left, GArrowBooleanArray* right, GError** _err) c_garrow_boolean_array_or; ///
  GArrowBooleanArray* function(GArrowBooleanArray* left, GArrowBooleanArray* right, GError** _err) c_garrow_boolean_array_xor; ///

  // BooleanArrayBuilder
  GType function() c_garrow_boolean_array_builder_get_type; ///
  GArrowBooleanArrayBuilder* function() c_garrow_boolean_array_builder_new; ///
  gboolean function(GArrowBooleanArrayBuilder* builder, gboolean value, GError** _err) c_garrow_boolean_array_builder_append; ///
  gboolean function(GArrowBooleanArrayBuilder* builder, GError** _err) c_garrow_boolean_array_builder_append_null; ///
  gboolean function(GArrowBooleanArrayBuilder* builder, long n, GError** _err) c_garrow_boolean_array_builder_append_nulls; ///
  gboolean function(GArrowBooleanArrayBuilder* builder, gboolean value, GError** _err) c_garrow_boolean_array_builder_append_value; ///
  gboolean function(GArrowBooleanArrayBuilder* builder, const(gboolean)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_boolean_array_builder_append_values; ///

  // BooleanDataType
  GType function() c_garrow_boolean_data_type_get_type; ///
  GArrowBooleanDataType* function() c_garrow_boolean_data_type_new; ///

  // BooleanScalar
  GType function() c_garrow_boolean_scalar_get_type; ///
  GArrowBooleanScalar* function(gboolean value) c_garrow_boolean_scalar_new; ///
  gboolean function(GArrowBooleanScalar* scalar) c_garrow_boolean_scalar_get_value; ///

  // Buffer
  GType function() c_garrow_buffer_get_type; ///
  GArrowBuffer* function(const(ubyte)* data, long size) c_garrow_buffer_new; ///
  GArrowBuffer* function(GBytes* data) c_garrow_buffer_new_bytes; ///
  GArrowBuffer* function(GArrowBuffer* buffer, long start, long size, GError** _err) c_garrow_buffer_copy; ///
  gboolean function(GArrowBuffer* buffer, GArrowBuffer* otherBuffer) c_garrow_buffer_equal; ///
  gboolean function(GArrowBuffer* buffer, GArrowBuffer* otherBuffer, long nBytes) c_garrow_buffer_equal_n_bytes; ///
  long function(GArrowBuffer* buffer) c_garrow_buffer_get_capacity; ///
  GBytes* function(GArrowBuffer* buffer) c_garrow_buffer_get_data; ///
  GBytes* function(GArrowBuffer* buffer) c_garrow_buffer_get_mutable_data; ///
  GArrowBuffer* function(GArrowBuffer* buffer) c_garrow_buffer_get_parent; ///
  long function(GArrowBuffer* buffer) c_garrow_buffer_get_size; ///
  gboolean function(GArrowBuffer* buffer) c_garrow_buffer_is_mutable; ///
  GArrowBuffer* function(GArrowBuffer* buffer, long offset, long size) c_garrow_buffer_slice; ///

  // BufferInputStream
  GType function() c_garrow_buffer_input_stream_get_type; ///
  GArrowBufferInputStream* function(GArrowBuffer* buffer) c_garrow_buffer_input_stream_new; ///
  GArrowBuffer* function(GArrowBufferInputStream* inputStream) c_garrow_buffer_input_stream_get_buffer; ///

  // BufferOutputStream
  GType function() c_garrow_buffer_output_stream_get_type; ///
  GArrowBufferOutputStream* function(GArrowResizableBuffer* buffer) c_garrow_buffer_output_stream_new; ///

  // CSVReadOptions
  GType function() c_garrow_csv_read_options_get_type; ///
  GArrowCSVReadOptions* function() c_garrow_csv_read_options_new; ///
  void function(GArrowCSVReadOptions* options, const(char)* columnName) c_garrow_csv_read_options_add_column_name; ///
  void function(GArrowCSVReadOptions* options, const(char)* name, GArrowDataType* dataType) c_garrow_csv_read_options_add_column_type; ///
  void function(GArrowCSVReadOptions* options, const(char)* falseValue) c_garrow_csv_read_options_add_false_value; ///
  void function(GArrowCSVReadOptions* options, const(char)* nullValue) c_garrow_csv_read_options_add_null_value; ///
  void function(GArrowCSVReadOptions* options, GArrowSchema* schema) c_garrow_csv_read_options_add_schema; ///
  void function(GArrowCSVReadOptions* options, GArrowTimestampParser* parser) c_garrow_csv_read_options_add_timestamp_parser; ///
  void function(GArrowCSVReadOptions* options, const(char)* trueValue) c_garrow_csv_read_options_add_true_value; ///
  char** function(GArrowCSVReadOptions* options) c_garrow_csv_read_options_get_column_names; ///
  GHashTable* function(GArrowCSVReadOptions* options) c_garrow_csv_read_options_get_column_types; ///
  char** function(GArrowCSVReadOptions* options) c_garrow_csv_read_options_get_false_values; ///
  char** function(GArrowCSVReadOptions* options) c_garrow_csv_read_options_get_null_values; ///
  GList* function(GArrowCSVReadOptions* options) c_garrow_csv_read_options_get_timestamp_parsers; ///
  char** function(GArrowCSVReadOptions* options) c_garrow_csv_read_options_get_true_values; ///
  void function(GArrowCSVReadOptions* options, const(char*)* columnNames, size_t nColumnNames) c_garrow_csv_read_options_set_column_names; ///
  void function(GArrowCSVReadOptions* options, const(char*)* falseValues, size_t nFalseValues) c_garrow_csv_read_options_set_false_values; ///
  void function(GArrowCSVReadOptions* options, const(char*)* nullValues, size_t nNullValues) c_garrow_csv_read_options_set_null_values; ///
  void function(GArrowCSVReadOptions* options, GList* parsers) c_garrow_csv_read_options_set_timestamp_parsers; ///
  void function(GArrowCSVReadOptions* options, const(char*)* trueValues, size_t nTrueValues) c_garrow_csv_read_options_set_true_values; ///

  // CSVReader
  GType function() c_garrow_csv_reader_get_type; ///
  GArrowCSVReader* function(GArrowInputStream* input, GArrowCSVReadOptions* options, GError** _err) c_garrow_csv_reader_new; ///
  GArrowTable* function(GArrowCSVReader* reader, GError** _err) c_garrow_csv_reader_read; ///

  // CallExpression
  GType function() c_garrow_call_expression_get_type; ///
  GArrowCallExpression* function(const(char)* function_, GList* arguments, GArrowFunctionOptions* options) c_garrow_call_expression_new; ///

  // CastOptions
  GType function() c_garrow_cast_options_get_type; ///
  GArrowCastOptions* function() c_garrow_cast_options_new; ///

  // ChunkedArray
  GType function() c_garrow_chunked_array_get_type; ///
  GArrowChunkedArray* function(GList* chunks, GError** _err) c_garrow_chunked_array_new; ///
  GArrowChunkedArray* function(GArrowDataType* dataType, GError** _err) c_garrow_chunked_array_new_empty; ///
  GArrowArray* function(GArrowChunkedArray* chunkedArray, GError** _err) c_garrow_chunked_array_combine; ///
  gboolean function(GArrowChunkedArray* chunkedArray, GArrowChunkedArray* otherChunkedArray) c_garrow_chunked_array_equal; ///
  GArrowChunkedArray* function(GArrowChunkedArray* chunkedArray, GArrowBooleanArray* filter, GArrowFilterOptions* options, GError** _err) c_garrow_chunked_array_filter; ///
  GArrowChunkedArray* function(GArrowChunkedArray* chunkedArray, GArrowChunkedArray* filter, GArrowFilterOptions* options, GError** _err) c_garrow_chunked_array_filter_chunked_array; ///
  GArrowArray* function(GArrowChunkedArray* chunkedArray, uint i) c_garrow_chunked_array_get_chunk; ///
  GList* function(GArrowChunkedArray* chunkedArray) c_garrow_chunked_array_get_chunks; ///
  ulong function(GArrowChunkedArray* chunkedArray) c_garrow_chunked_array_get_length; ///
  uint function(GArrowChunkedArray* chunkedArray) c_garrow_chunked_array_get_n_chunks; ///
  ulong function(GArrowChunkedArray* chunkedArray) c_garrow_chunked_array_get_n_nulls; ///
  ulong function(GArrowChunkedArray* chunkedArray) c_garrow_chunked_array_get_n_rows; ///
  GArrowDataType* function(GArrowChunkedArray* chunkedArray) c_garrow_chunked_array_get_value_data_type; ///
  GArrowType function(GArrowChunkedArray* chunkedArray) c_garrow_chunked_array_get_value_type; ///
  GArrowChunkedArray* function(GArrowChunkedArray* chunkedArray, ulong offset, ulong length) c_garrow_chunked_array_slice; ///
  GArrowUInt64Array* function(GArrowChunkedArray* chunkedArray, GArrowSortOrder order, GError** _err) c_garrow_chunked_array_sort_indices; ///
  GArrowChunkedArray* function(GArrowChunkedArray* chunkedArray, GArrowArray* indices, GArrowTakeOptions* options, GError** _err) c_garrow_chunked_array_take; ///
  GArrowChunkedArray* function(GArrowChunkedArray* chunkedArray, GArrowChunkedArray* indices, GArrowTakeOptions* options, GError** _err) c_garrow_chunked_array_take_chunked_array; ///
  char* function(GArrowChunkedArray* chunkedArray, GError** _err) c_garrow_chunked_array_to_string; ///

  // ChunkedArrayDatum
  GType function() c_garrow_chunked_array_datum_get_type; ///
  GArrowChunkedArrayDatum* function(GArrowChunkedArray* value) c_garrow_chunked_array_datum_new; ///

  // Codec
  GType function() c_garrow_codec_get_type; ///
  GArrowCodec* function(GArrowCompressionType type, GError** _err) c_garrow_codec_new; ///
  int function(GArrowCodec* codec) c_garrow_codec_get_compression_level; ///
  GArrowCompressionType function(GArrowCodec* codec) c_garrow_codec_get_compression_type; ///
  const(char)* function(GArrowCodec* codec) c_garrow_codec_get_name; ///

  // CompressedInputStream
  GType function() c_garrow_compressed_input_stream_get_type; ///
  GArrowCompressedInputStream* function(GArrowCodec* codec, GArrowInputStream* raw, GError** _err) c_garrow_compressed_input_stream_new; ///

  // CompressedOutputStream
  GType function() c_garrow_compressed_output_stream_get_type; ///
  GArrowCompressedOutputStream* function(GArrowCodec* codec, GArrowOutputStream* raw, GError** _err) c_garrow_compressed_output_stream_new; ///

  // CountOptions
  GType function() c_garrow_count_options_get_type; ///
  GArrowCountOptions* function() c_garrow_count_options_new; ///

  // DataType
  GType function() c_garrow_data_type_get_type; ///
  GArrowDataType* function(void* cAbiSchema, GError** _err) c_garrow_data_type_import; ///
  gboolean function(GArrowDataType* dataType, GArrowDataType* otherDataType) c_garrow_data_type_equal; ///
  void* function(GArrowDataType* dataType, GError** _err) c_garrow_data_type_export; ///
  GArrowType function(GArrowDataType* dataType) c_garrow_data_type_get_id; ///
  char* function(GArrowDataType* dataType) c_garrow_data_type_get_name; ///
  char* function(GArrowDataType* dataType) c_garrow_data_type_to_string; ///

  // Date32Array
  GType function() c_garrow_date32_array_get_type; ///
  GArrowDate32Array* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_date32_array_new; ///
  int function(GArrowDate32Array* array, long i) c_garrow_date32_array_get_value; ///
  const(int)* function(GArrowDate32Array* array, long* length) c_garrow_date32_array_get_values; ///

  // Date32ArrayBuilder
  GType function() c_garrow_date32_array_builder_get_type; ///
  GArrowDate32ArrayBuilder* function() c_garrow_date32_array_builder_new; ///
  gboolean function(GArrowDate32ArrayBuilder* builder, int value, GError** _err) c_garrow_date32_array_builder_append; ///
  gboolean function(GArrowDate32ArrayBuilder* builder, GError** _err) c_garrow_date32_array_builder_append_null; ///
  gboolean function(GArrowDate32ArrayBuilder* builder, long n, GError** _err) c_garrow_date32_array_builder_append_nulls; ///
  gboolean function(GArrowDate32ArrayBuilder* builder, int value, GError** _err) c_garrow_date32_array_builder_append_value; ///
  gboolean function(GArrowDate32ArrayBuilder* builder, const(int)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_date32_array_builder_append_values; ///

  // Date32DataType
  GType function() c_garrow_date32_data_type_get_type; ///
  GArrowDate32DataType* function() c_garrow_date32_data_type_new; ///

  // Date32Scalar
  GType function() c_garrow_date32_scalar_get_type; ///
  GArrowDate32Scalar* function(int value) c_garrow_date32_scalar_new; ///
  int function(GArrowDate32Scalar* scalar) c_garrow_date32_scalar_get_value; ///

  // Date64Array
  GType function() c_garrow_date64_array_get_type; ///
  GArrowDate64Array* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_date64_array_new; ///
  long function(GArrowDate64Array* array, long i) c_garrow_date64_array_get_value; ///
  const(long)* function(GArrowDate64Array* array, long* length) c_garrow_date64_array_get_values; ///

  // Date64ArrayBuilder
  GType function() c_garrow_date64_array_builder_get_type; ///
  GArrowDate64ArrayBuilder* function() c_garrow_date64_array_builder_new; ///
  gboolean function(GArrowDate64ArrayBuilder* builder, long value, GError** _err) c_garrow_date64_array_builder_append; ///
  gboolean function(GArrowDate64ArrayBuilder* builder, GError** _err) c_garrow_date64_array_builder_append_null; ///
  gboolean function(GArrowDate64ArrayBuilder* builder, long n, GError** _err) c_garrow_date64_array_builder_append_nulls; ///
  gboolean function(GArrowDate64ArrayBuilder* builder, long value, GError** _err) c_garrow_date64_array_builder_append_value; ///
  gboolean function(GArrowDate64ArrayBuilder* builder, const(long)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_date64_array_builder_append_values; ///

  // Date64DataType
  GType function() c_garrow_date64_data_type_get_type; ///
  GArrowDate64DataType* function() c_garrow_date64_data_type_new; ///

  // Date64Scalar
  GType function() c_garrow_date64_scalar_get_type; ///
  GArrowDate64Scalar* function(long value) c_garrow_date64_scalar_new; ///
  long function(GArrowDate64Scalar* scalar) c_garrow_date64_scalar_get_value; ///

  // Datum
  GType function() c_garrow_datum_get_type; ///
  gboolean function(GArrowDatum* datum, GArrowDatum* otherDatum) c_garrow_datum_equal; ///
  gboolean function(GArrowDatum* datum) c_garrow_datum_is_array; ///
  gboolean function(GArrowDatum* datum) c_garrow_datum_is_array_like; ///
  gboolean function(GArrowDatum* datum) c_garrow_datum_is_scalar; ///
  gboolean function(GArrowDatum* datum) c_garrow_datum_is_value; ///
  char* function(GArrowDatum* datum) c_garrow_datum_to_string; ///

  // DayMillisecond
  GType function() c_garrow_day_millisecond_get_type; ///
  GArrowDayMillisecond* function(int day, int millisecond) c_garrow_day_millisecond_new; ///
  gboolean function(GArrowDayMillisecond* dayMillisecond, GArrowDayMillisecond* otherDayMillisecond) c_garrow_day_millisecond_equal; ///
  gboolean function(GArrowDayMillisecond* dayMillisecond, GArrowDayMillisecond* otherDayMillisecond) c_garrow_day_millisecond_less_than; ///

  // DayTimeIntervalArray
  GType function() c_garrow_day_time_interval_array_get_type; ///
  GArrowDayTimeIntervalArray* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_day_time_interval_array_new; ///
  GArrowDayMillisecond* function(GArrowDayTimeIntervalArray* array, long i) c_garrow_day_time_interval_array_get_value; ///
  GList* function(GArrowDayTimeIntervalArray* array) c_garrow_day_time_interval_array_get_values; ///

  // DayTimeIntervalArrayBuilder
  GType function() c_garrow_day_time_interval_array_builder_get_type; ///
  GArrowDayTimeIntervalArrayBuilder* function() c_garrow_day_time_interval_array_builder_new; ///
  gboolean function(GArrowDayTimeIntervalArrayBuilder* builder, GArrowDayMillisecond* value, GError** _err) c_garrow_day_time_interval_array_builder_append_value; ///
  gboolean function(GArrowDayTimeIntervalArrayBuilder* builder, const(GArrowDayMillisecond*)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_day_time_interval_array_builder_append_values; ///

  // DayTimeIntervalDataType
  GType function() c_garrow_day_time_interval_data_type_get_type; ///
  GArrowDayTimeIntervalDataType* function() c_garrow_day_time_interval_data_type_new; ///

  // DayTimeIntervalScalar
  GType function() c_garrow_day_time_interval_scalar_get_type; ///
  GArrowDayTimeIntervalScalar* function(GArrowDayMillisecond* value) c_garrow_day_time_interval_scalar_new; ///
  GArrowDayMillisecond* function(GArrowDayTimeIntervalScalar* scalar) c_garrow_day_time_interval_scalar_get_value; ///

  // Decimal128
  GType function() c_garrow_decimal128_get_type; ///
  GArrowDecimal128* function(long data) c_garrow_decimal128_new_integer; ///
  GArrowDecimal128* function(const(char)* data, GError** _err) c_garrow_decimal128_new_string; ///
  void function(GArrowDecimal128* decimal) c_garrow_decimal128_abs; ///
  GArrowDecimal128* function(GArrowDecimal128* decimal) c_garrow_decimal128_copy; ///
  GArrowDecimal128* function(GArrowDecimal128* left, GArrowDecimal128* right, GArrowDecimal128** remainder, GError** _err) c_garrow_decimal128_divide; ///
  gboolean function(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal) c_garrow_decimal128_equal; ///
  gboolean function(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal) c_garrow_decimal128_greater_than; ///
  gboolean function(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal) c_garrow_decimal128_greater_than_or_equal; ///
  gboolean function(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal) c_garrow_decimal128_less_than; ///
  gboolean function(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal) c_garrow_decimal128_less_than_or_equal; ///
  GArrowDecimal128* function(GArrowDecimal128* left, GArrowDecimal128* right) c_garrow_decimal128_minus; ///
  GArrowDecimal128* function(GArrowDecimal128* left, GArrowDecimal128* right) c_garrow_decimal128_multiply; ///
  void function(GArrowDecimal128* decimal) c_garrow_decimal128_negate; ///
  gboolean function(GArrowDecimal128* decimal, GArrowDecimal128* otherDecimal) c_garrow_decimal128_not_equal; ///
  GArrowDecimal128* function(GArrowDecimal128* left, GArrowDecimal128* right) c_garrow_decimal128_plus; ///
  GArrowDecimal128* function(GArrowDecimal128* decimal, int originalScale, int newScale, GError** _err) c_garrow_decimal128_rescale; ///
  GBytes* function(GArrowDecimal128* decimal) c_garrow_decimal128_to_bytes; ///
  long function(GArrowDecimal128* decimal) c_garrow_decimal128_to_integer; ///
  char* function(GArrowDecimal128* decimal) c_garrow_decimal128_to_string; ///
  char* function(GArrowDecimal128* decimal, int scale) c_garrow_decimal128_to_string_scale; ///

  // Decimal128Array
  GType function() c_garrow_decimal128_array_get_type; ///
  char* function(GArrowDecimal128Array* array, long i) c_garrow_decimal128_array_format_value; ///
  GArrowDecimal128* function(GArrowDecimal128Array* array, long i) c_garrow_decimal128_array_get_value; ///

  // Decimal128ArrayBuilder
  GType function() c_garrow_decimal128_array_builder_get_type; ///
  GArrowDecimal128ArrayBuilder* function(GArrowDecimal128DataType* dataType) c_garrow_decimal128_array_builder_new; ///
  gboolean function(GArrowDecimal128ArrayBuilder* builder, GArrowDecimal128* value, GError** _err) c_garrow_decimal128_array_builder_append; ///
  gboolean function(GArrowDecimal128ArrayBuilder* builder, GError** _err) c_garrow_decimal128_array_builder_append_null; ///
  gboolean function(GArrowDecimal128ArrayBuilder* builder, GArrowDecimal128* value, GError** _err) c_garrow_decimal128_array_builder_append_value; ///
  gboolean function(GArrowDecimal128ArrayBuilder* builder, GArrowDecimal128** values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_decimal128_array_builder_append_values; ///

  // Decimal128DataType
  GType function() c_garrow_decimal128_data_type_get_type; ///
  GArrowDecimal128DataType* function(int precision, int scale, GError** _err) c_garrow_decimal128_data_type_new; ///
  int function() c_garrow_decimal128_data_type_max_precision; ///

  // Decimal128Scalar
  GType function() c_garrow_decimal128_scalar_get_type; ///
  GArrowDecimal128Scalar* function(GArrowDecimal128DataType* dataType, GArrowDecimal128* value) c_garrow_decimal128_scalar_new; ///
  GArrowDecimal128* function(GArrowDecimal128Scalar* scalar) c_garrow_decimal128_scalar_get_value; ///

  // Decimal256
  GType function() c_garrow_decimal256_get_type; ///
  GArrowDecimal256* function(long data) c_garrow_decimal256_new_integer; ///
  GArrowDecimal256* function(const(char)* data, GError** _err) c_garrow_decimal256_new_string; ///
  void function(GArrowDecimal256* decimal) c_garrow_decimal256_abs; ///
  GArrowDecimal256* function(GArrowDecimal256* decimal) c_garrow_decimal256_copy; ///
  GArrowDecimal256* function(GArrowDecimal256* left, GArrowDecimal256* right, GArrowDecimal256** remainder, GError** _err) c_garrow_decimal256_divide; ///
  gboolean function(GArrowDecimal256* decimal, GArrowDecimal256* otherDecimal) c_garrow_decimal256_equal; ///
  gboolean function(GArrowDecimal256* decimal, GArrowDecimal256* otherDecimal) c_garrow_decimal256_greater_than; ///
  gboolean function(GArrowDecimal256* decimal, GArrowDecimal256* otherDecimal) c_garrow_decimal256_greater_than_or_equal; ///
  gboolean function(GArrowDecimal256* decimal, GArrowDecimal256* otherDecimal) c_garrow_decimal256_less_than; ///
  gboolean function(GArrowDecimal256* decimal, GArrowDecimal256* otherDecimal) c_garrow_decimal256_less_than_or_equal; ///
  GArrowDecimal256* function(GArrowDecimal256* left, GArrowDecimal256* right) c_garrow_decimal256_multiply; ///
  void function(GArrowDecimal256* decimal) c_garrow_decimal256_negate; ///
  gboolean function(GArrowDecimal256* decimal, GArrowDecimal256* otherDecimal) c_garrow_decimal256_not_equal; ///
  GArrowDecimal256* function(GArrowDecimal256* left, GArrowDecimal256* right) c_garrow_decimal256_plus; ///
  GArrowDecimal256* function(GArrowDecimal256* decimal, int originalScale, int newScale, GError** _err) c_garrow_decimal256_rescale; ///
  GBytes* function(GArrowDecimal256* decimal) c_garrow_decimal256_to_bytes; ///
  char* function(GArrowDecimal256* decimal) c_garrow_decimal256_to_string; ///
  char* function(GArrowDecimal256* decimal, int scale) c_garrow_decimal256_to_string_scale; ///

  // Decimal256Array
  GType function() c_garrow_decimal256_array_get_type; ///
  char* function(GArrowDecimal256Array* array, long i) c_garrow_decimal256_array_format_value; ///
  GArrowDecimal256* function(GArrowDecimal256Array* array, long i) c_garrow_decimal256_array_get_value; ///

  // Decimal256ArrayBuilder
  GType function() c_garrow_decimal256_array_builder_get_type; ///
  GArrowDecimal256ArrayBuilder* function(GArrowDecimal256DataType* dataType) c_garrow_decimal256_array_builder_new; ///
  gboolean function(GArrowDecimal256ArrayBuilder* builder, GArrowDecimal256* value, GError** _err) c_garrow_decimal256_array_builder_append_value; ///
  gboolean function(GArrowDecimal256ArrayBuilder* builder, GArrowDecimal256** values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_decimal256_array_builder_append_values; ///

  // Decimal256DataType
  GType function() c_garrow_decimal256_data_type_get_type; ///
  GArrowDecimal256DataType* function(int precision, int scale, GError** _err) c_garrow_decimal256_data_type_new; ///
  int function() c_garrow_decimal256_data_type_max_precision; ///

  // Decimal256Scalar
  GType function() c_garrow_decimal256_scalar_get_type; ///
  GArrowDecimal256Scalar* function(GArrowDecimal256DataType* dataType, GArrowDecimal256* value) c_garrow_decimal256_scalar_new; ///
  GArrowDecimal256* function(GArrowDecimal256Scalar* scalar) c_garrow_decimal256_scalar_get_value; ///

  // Decimal32
  GType function() c_garrow_decimal32_get_type; ///
  GArrowDecimal32* function(long data) c_garrow_decimal32_new_integer; ///
  GArrowDecimal32* function(const(char)* data, GError** _err) c_garrow_decimal32_new_string; ///
  void function(GArrowDecimal32* decimal) c_garrow_decimal32_abs; ///
  GArrowDecimal32* function(GArrowDecimal32* decimal) c_garrow_decimal32_copy; ///
  GArrowDecimal32* function(GArrowDecimal32* left, GArrowDecimal32* right, GArrowDecimal32** remainder, GError** _err) c_garrow_decimal32_divide; ///
  gboolean function(GArrowDecimal32* decimal, GArrowDecimal32* otherDecimal) c_garrow_decimal32_equal; ///
  gboolean function(GArrowDecimal32* decimal, GArrowDecimal32* otherDecimal) c_garrow_decimal32_greater_than; ///
  gboolean function(GArrowDecimal32* decimal, GArrowDecimal32* otherDecimal) c_garrow_decimal32_greater_than_or_equal; ///
  gboolean function(GArrowDecimal32* decimal, GArrowDecimal32* otherDecimal) c_garrow_decimal32_less_than; ///
  gboolean function(GArrowDecimal32* decimal, GArrowDecimal32* otherDecimal) c_garrow_decimal32_less_than_or_equal; ///
  GArrowDecimal32* function(GArrowDecimal32* left, GArrowDecimal32* right) c_garrow_decimal32_minus; ///
  GArrowDecimal32* function(GArrowDecimal32* left, GArrowDecimal32* right) c_garrow_decimal32_multiply; ///
  void function(GArrowDecimal32* decimal) c_garrow_decimal32_negate; ///
  gboolean function(GArrowDecimal32* decimal, GArrowDecimal32* otherDecimal) c_garrow_decimal32_not_equal; ///
  GArrowDecimal32* function(GArrowDecimal32* left, GArrowDecimal32* right) c_garrow_decimal32_plus; ///
  GArrowDecimal32* function(GArrowDecimal32* decimal, int originalScale, int newScale, GError** _err) c_garrow_decimal32_rescale; ///
  GBytes* function(GArrowDecimal32* decimal) c_garrow_decimal32_to_bytes; ///
  long function(GArrowDecimal32* decimal) c_garrow_decimal32_to_integer; ///
  char* function(GArrowDecimal32* decimal) c_garrow_decimal32_to_string; ///
  char* function(GArrowDecimal32* decimal, int scale) c_garrow_decimal32_to_string_scale; ///

  // Decimal32Array
  GType function() c_garrow_decimal32_array_get_type; ///
  char* function(GArrowDecimal32Array* array, long i) c_garrow_decimal32_array_format_value; ///
  GArrowDecimal32* function(GArrowDecimal32Array* array, long i) c_garrow_decimal32_array_get_value; ///

  // Decimal32ArrayBuilder
  GType function() c_garrow_decimal32_array_builder_get_type; ///
  GArrowDecimal32ArrayBuilder* function(GArrowDecimal32DataType* dataType) c_garrow_decimal32_array_builder_new; ///
  gboolean function(GArrowDecimal32ArrayBuilder* builder, GArrowDecimal32* value, GError** _err) c_garrow_decimal32_array_builder_append_value; ///
  gboolean function(GArrowDecimal32ArrayBuilder* builder, GArrowDecimal32** values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_decimal32_array_builder_append_values; ///

  // Decimal32DataType
  GType function() c_garrow_decimal32_data_type_get_type; ///
  GArrowDecimal32DataType* function(int precision, int scale, GError** _err) c_garrow_decimal32_data_type_new; ///
  int function() c_garrow_decimal32_data_type_max_precision; ///

  // Decimal32Scalar
  GType function() c_garrow_decimal32_scalar_get_type; ///
  GArrowDecimal32Scalar* function(GArrowDecimal32DataType* dataType, GArrowDecimal32* value) c_garrow_decimal32_scalar_new; ///
  GArrowDecimal32* function(GArrowDecimal32Scalar* scalar) c_garrow_decimal32_scalar_get_value; ///

  // Decimal64
  GType function() c_garrow_decimal64_get_type; ///
  GArrowDecimal64* function(long data) c_garrow_decimal64_new_integer; ///
  GArrowDecimal64* function(const(char)* data, GError** _err) c_garrow_decimal64_new_string; ///
  void function(GArrowDecimal64* decimal) c_garrow_decimal64_abs; ///
  GArrowDecimal64* function(GArrowDecimal64* decimal) c_garrow_decimal64_copy; ///
  GArrowDecimal64* function(GArrowDecimal64* left, GArrowDecimal64* right, GArrowDecimal64** remainder, GError** _err) c_garrow_decimal64_divide; ///
  gboolean function(GArrowDecimal64* decimal, GArrowDecimal64* otherDecimal) c_garrow_decimal64_equal; ///
  gboolean function(GArrowDecimal64* decimal, GArrowDecimal64* otherDecimal) c_garrow_decimal64_greater_than; ///
  gboolean function(GArrowDecimal64* decimal, GArrowDecimal64* otherDecimal) c_garrow_decimal64_greater_than_or_equal; ///
  gboolean function(GArrowDecimal64* decimal, GArrowDecimal64* otherDecimal) c_garrow_decimal64_less_than; ///
  gboolean function(GArrowDecimal64* decimal, GArrowDecimal64* otherDecimal) c_garrow_decimal64_less_than_or_equal; ///
  GArrowDecimal64* function(GArrowDecimal64* left, GArrowDecimal64* right) c_garrow_decimal64_minus; ///
  GArrowDecimal64* function(GArrowDecimal64* left, GArrowDecimal64* right) c_garrow_decimal64_multiply; ///
  void function(GArrowDecimal64* decimal) c_garrow_decimal64_negate; ///
  gboolean function(GArrowDecimal64* decimal, GArrowDecimal64* otherDecimal) c_garrow_decimal64_not_equal; ///
  GArrowDecimal64* function(GArrowDecimal64* left, GArrowDecimal64* right) c_garrow_decimal64_plus; ///
  GArrowDecimal64* function(GArrowDecimal64* decimal, int originalScale, int newScale, GError** _err) c_garrow_decimal64_rescale; ///
  GBytes* function(GArrowDecimal64* decimal) c_garrow_decimal64_to_bytes; ///
  long function(GArrowDecimal64* decimal) c_garrow_decimal64_to_integer; ///
  char* function(GArrowDecimal64* decimal) c_garrow_decimal64_to_string; ///
  char* function(GArrowDecimal64* decimal, int scale) c_garrow_decimal64_to_string_scale; ///

  // Decimal64Array
  GType function() c_garrow_decimal64_array_get_type; ///
  char* function(GArrowDecimal64Array* array, long i) c_garrow_decimal64_array_format_value; ///
  GArrowDecimal64* function(GArrowDecimal64Array* array, long i) c_garrow_decimal64_array_get_value; ///

  // Decimal64ArrayBuilder
  GType function() c_garrow_decimal64_array_builder_get_type; ///
  GArrowDecimal64ArrayBuilder* function(GArrowDecimal64DataType* dataType) c_garrow_decimal64_array_builder_new; ///
  gboolean function(GArrowDecimal64ArrayBuilder* builder, GArrowDecimal64* value, GError** _err) c_garrow_decimal64_array_builder_append_value; ///
  gboolean function(GArrowDecimal64ArrayBuilder* builder, GArrowDecimal64** values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_decimal64_array_builder_append_values; ///

  // Decimal64DataType
  GType function() c_garrow_decimal64_data_type_get_type; ///
  GArrowDecimal64DataType* function(int precision, int scale, GError** _err) c_garrow_decimal64_data_type_new; ///
  int function() c_garrow_decimal64_data_type_max_precision; ///

  // Decimal64Scalar
  GType function() c_garrow_decimal64_scalar_get_type; ///
  GArrowDecimal64Scalar* function(GArrowDecimal64DataType* dataType, GArrowDecimal64* value) c_garrow_decimal64_scalar_new; ///
  GArrowDecimal64* function(GArrowDecimal64Scalar* scalar) c_garrow_decimal64_scalar_get_value; ///

  // DecimalDataType
  GType function() c_garrow_decimal_data_type_get_type; ///
  GArrowDecimalDataType* function(int precision, int scale, GError** _err) c_garrow_decimal_data_type_new; ///
  int function(GArrowDecimalDataType* decimalDataType) c_garrow_decimal_data_type_get_precision; ///
  int function(GArrowDecimalDataType* decimalDataType) c_garrow_decimal_data_type_get_scale; ///

  // DenseUnionArray
  GType function() c_garrow_dense_union_array_get_type; ///
  GArrowDenseUnionArray* function(GArrowInt8Array* typeIds, GArrowInt32Array* valueOffsets, GList* fields, GError** _err) c_garrow_dense_union_array_new; ///
  GArrowDenseUnionArray* function(GArrowDenseUnionDataType* dataType, GArrowInt8Array* typeIds, GArrowInt32Array* valueOffsets, GList* fields, GError** _err) c_garrow_dense_union_array_new_data_type; ///
  int function(GArrowDenseUnionArray* array, long i) c_garrow_dense_union_array_get_value_offset; ///

  // DenseUnionArrayBuilder
  GType function() c_garrow_dense_union_array_builder_get_type; ///
  GArrowDenseUnionArrayBuilder* function(GArrowDenseUnionDataType* dataType, GError** _err) c_garrow_dense_union_array_builder_new; ///

  // DenseUnionDataType
  GType function() c_garrow_dense_union_data_type_get_type; ///
  GArrowDenseUnionDataType* function(GList* fields, byte* typeCodes, size_t nTypeCodes) c_garrow_dense_union_data_type_new; ///

  // DenseUnionScalar
  GType function() c_garrow_dense_union_scalar_get_type; ///
  GArrowDenseUnionScalar* function(GArrowDenseUnionDataType* dataType, byte typeCode, GArrowScalar* value) c_garrow_dense_union_scalar_new; ///

  // DictionaryArray
  GType function() c_garrow_dictionary_array_get_type; ///
  GArrowDictionaryArray* function(GArrowDataType* dataType, GArrowArray* indices, GArrowArray* dictionary, GError** _err) c_garrow_dictionary_array_new; ///
  GArrowArray* function(GArrowDictionaryArray* array) c_garrow_dictionary_array_get_dictionary; ///
  GArrowDictionaryDataType* function(GArrowDictionaryArray* array) c_garrow_dictionary_array_get_dictionary_data_type; ///
  GArrowArray* function(GArrowDictionaryArray* array) c_garrow_dictionary_array_get_indices; ///

  // DictionaryDataType
  GType function() c_garrow_dictionary_data_type_get_type; ///
  GArrowDictionaryDataType* function(GArrowDataType* indexDataType, GArrowDataType* valueDataType, gboolean ordered) c_garrow_dictionary_data_type_new; ///
  GArrowDataType* function(GArrowDictionaryDataType* dictionaryDataType) c_garrow_dictionary_data_type_get_index_data_type; ///
  GArrowDataType* function(GArrowDictionaryDataType* dictionaryDataType) c_garrow_dictionary_data_type_get_value_data_type; ///
  gboolean function(GArrowDictionaryDataType* dictionaryDataType) c_garrow_dictionary_data_type_is_ordered; ///

  // DoubleArray
  GType function() c_garrow_double_array_get_type; ///
  GArrowDoubleArray* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_double_array_new; ///
  double function(GArrowDoubleArray* array, long i) c_garrow_double_array_get_value; ///
  const(double)* function(GArrowDoubleArray* array, long* length) c_garrow_double_array_get_values; ///
  double function(GArrowDoubleArray* array, GError** _err) c_garrow_double_array_sum; ///

  // DoubleArrayBuilder
  GType function() c_garrow_double_array_builder_get_type; ///
  GArrowDoubleArrayBuilder* function() c_garrow_double_array_builder_new; ///
  gboolean function(GArrowDoubleArrayBuilder* builder, double value, GError** _err) c_garrow_double_array_builder_append; ///
  gboolean function(GArrowDoubleArrayBuilder* builder, GError** _err) c_garrow_double_array_builder_append_null; ///
  gboolean function(GArrowDoubleArrayBuilder* builder, long n, GError** _err) c_garrow_double_array_builder_append_nulls; ///
  gboolean function(GArrowDoubleArrayBuilder* builder, double value, GError** _err) c_garrow_double_array_builder_append_value; ///
  gboolean function(GArrowDoubleArrayBuilder* builder, const(double)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_double_array_builder_append_values; ///

  // DoubleDataType
  GType function() c_garrow_double_data_type_get_type; ///
  GArrowDoubleDataType* function() c_garrow_double_data_type_new; ///

  // DoubleScalar
  GType function() c_garrow_double_scalar_get_type; ///
  GArrowDoubleScalar* function(double value) c_garrow_double_scalar_new; ///
  double function(GArrowDoubleScalar* scalar) c_garrow_double_scalar_get_value; ///

  // EqualOptions
  GType function() c_garrow_equal_options_get_type; ///
  GArrowEqualOptions* function() c_garrow_equal_options_new; ///
  gboolean function(GArrowEqualOptions* options) c_garrow_equal_options_is_approx; ///

  // ExecuteContext
  GType function() c_garrow_execute_context_get_type; ///
  GArrowExecuteContext* function() c_garrow_execute_context_new; ///

  // ExecuteNode
  GType function() c_garrow_execute_node_get_type; ///
  const(char)* function(GArrowExecuteNode* node) c_garrow_execute_node_get_kind_name; ///
  GArrowSchema* function(GArrowExecuteNode* node) c_garrow_execute_node_get_output_schema; ///

  // ExecuteNodeOptions
  GType function() c_garrow_execute_node_options_get_type; ///

  // ExecutePlan
  GType function() c_garrow_execute_plan_get_type; ///
  GArrowExecutePlan* function(GError** _err) c_garrow_execute_plan_new; ///
  GArrowExecuteNode* function(GArrowExecutePlan* plan, GArrowExecuteNode* input, GArrowAggregateNodeOptions* options, GError** _err) c_garrow_execute_plan_build_aggregate_node; ///
  GArrowExecuteNode* function(GArrowExecutePlan* plan, GArrowExecuteNode* input, GArrowFilterNodeOptions* options, GError** _err) c_garrow_execute_plan_build_filter_node; ///
  GArrowExecuteNode* function(GArrowExecutePlan* plan, GArrowExecuteNode* left, GArrowExecuteNode* right, GArrowHashJoinNodeOptions* options, GError** _err) c_garrow_execute_plan_build_hash_join_node; ///
  GArrowExecuteNode* function(GArrowExecutePlan* plan, const(char)* factoryName, GList* inputs, GArrowExecuteNodeOptions* options, GError** _err) c_garrow_execute_plan_build_node; ///
  GArrowExecuteNode* function(GArrowExecutePlan* plan, GArrowExecuteNode* input, GArrowProjectNodeOptions* options, GError** _err) c_garrow_execute_plan_build_project_node; ///
  GArrowExecuteNode* function(GArrowExecutePlan* plan, GArrowExecuteNode* input, GArrowSinkNodeOptions* options, GError** _err) c_garrow_execute_plan_build_sink_node; ///
  GArrowExecuteNode* function(GArrowExecutePlan* plan, GArrowSourceNodeOptions* options, GError** _err) c_garrow_execute_plan_build_source_node; ///
  GList* function(GArrowExecutePlan* plan) c_garrow_execute_plan_get_nodes; ///
  void function(GArrowExecutePlan* plan) c_garrow_execute_plan_start; ///
  void function(GArrowExecutePlan* plan) c_garrow_execute_plan_stop; ///
  gboolean function(GArrowExecutePlan* plan, GError** _err) c_garrow_execute_plan_validate; ///
  gboolean function(GArrowExecutePlan* plan, GError** _err) c_garrow_execute_plan_wait; ///

  // Expression
  GType function() c_garrow_expression_get_type; ///
  gboolean function(GArrowExpression* expression, GArrowExpression* otherExpression) c_garrow_expression_equal; ///
  char* function(GArrowExpression* expression) c_garrow_expression_to_string; ///

  // ExtensionArray
  GType function() c_garrow_extension_array_get_type; ///
  GArrowArray* function(GArrowExtensionArray* array) c_garrow_extension_array_get_storage; ///

  // ExtensionDataType
  GType function() c_garrow_extension_data_type_get_type; ///
  char* function(GArrowExtensionDataType* dataType) c_garrow_extension_data_type_get_extension_name; ///
  GArrowExtensionArray* function(GArrowExtensionDataType* dataType, GArrowArray* storage) c_garrow_extension_data_type_wrap_array; ///
  GArrowChunkedArray* function(GArrowExtensionDataType* dataType, GArrowChunkedArray* storage) c_garrow_extension_data_type_wrap_chunked_array; ///

  // ExtensionDataTypeRegistry
  GType function() c_garrow_extension_data_type_registry_get_type; ///
  GArrowExtensionDataTypeRegistry* function() c_garrow_extension_data_type_registry_default; ///
  GArrowExtensionDataType* function(GArrowExtensionDataTypeRegistry* registry, const(char)* name) c_garrow_extension_data_type_registry_lookup; ///
  gboolean function(GArrowExtensionDataTypeRegistry* registry, GArrowExtensionDataType* dataType, GError** _err) c_garrow_extension_data_type_registry_register; ///
  gboolean function(GArrowExtensionDataTypeRegistry* registry, const(char)* name, GError** _err) c_garrow_extension_data_type_registry_unregister; ///

  // ExtensionScalar
  GType function() c_garrow_extension_scalar_get_type; ///

  // FeatherFileReader
  GType function() c_garrow_feather_file_reader_get_type; ///
  GArrowFeatherFileReader* function(GArrowSeekableInputStream* file, GError** _err) c_garrow_feather_file_reader_new; ///
  int function(GArrowFeatherFileReader* reader) c_garrow_feather_file_reader_get_version; ///
  GArrowTable* function(GArrowFeatherFileReader* reader, GError** _err) c_garrow_feather_file_reader_read; ///
  GArrowTable* function(GArrowFeatherFileReader* reader, const(int)* indices, uint nIndices, GError** _err) c_garrow_feather_file_reader_read_indices; ///
  GArrowTable* function(GArrowFeatherFileReader* reader, const(char*)* names, uint nNames, GError** _err) c_garrow_feather_file_reader_read_names; ///

  // FeatherWriteProperties
  GType function() c_garrow_feather_write_properties_get_type; ///
  GArrowFeatherWriteProperties* function() c_garrow_feather_write_properties_new; ///

  // Field
  GType function() c_garrow_field_get_type; ///
  GArrowField* function(const(char)* name, GArrowDataType* dataType) c_garrow_field_new; ///
  GArrowField* function(const(char)* name, GArrowDataType* dataType, gboolean nullable) c_garrow_field_new_full; ///
  GArrowField* function(void* cAbiSchema, GError** _err) c_garrow_field_import; ///
  gboolean function(GArrowField* field, GArrowField* otherField) c_garrow_field_equal; ///
  void* function(GArrowField* field, GError** _err) c_garrow_field_export; ///
  GArrowDataType* function(GArrowField* field) c_garrow_field_get_data_type; ///
  GHashTable* function(GArrowField* field) c_garrow_field_get_metadata; ///
  const(char)* function(GArrowField* field) c_garrow_field_get_name; ///
  gboolean function(GArrowField* field) c_garrow_field_has_metadata; ///
  gboolean function(GArrowField* field) c_garrow_field_is_nullable; ///
  GArrowField* function(GArrowField* field) c_garrow_field_remove_metadata; ///
  char* function(GArrowField* field) c_garrow_field_to_string; ///
  char* function(GArrowField* field, gboolean showMetadata) c_garrow_field_to_string_metadata; ///
  GArrowField* function(GArrowField* field, GHashTable* metadata) c_garrow_field_with_merged_metadata; ///
  GArrowField* function(GArrowField* field, GHashTable* metadata) c_garrow_field_with_metadata; ///

  // FieldExpression
  GType function() c_garrow_field_expression_get_type; ///
  GArrowFieldExpression* function(const(char)* reference, GError** _err) c_garrow_field_expression_new; ///

  // File
  GType function() c_garrow_file_get_type; ///
  gboolean function(GArrowFile* file, GError** _err) c_garrow_file_close; ///
  GArrowFileMode function(GArrowFile* file) c_garrow_file_get_mode; ///
  gboolean function(GArrowFile* file) c_garrow_file_is_closed; ///
  long function(GArrowFile* file, GError** _err) c_garrow_file_tell; ///

  // FileInfo
  GType function() c_garrow_file_info_get_type; ///
  GArrowFileInfo* function() c_garrow_file_info_new; ///
  gboolean function(GArrowFileInfo* fileInfo, GArrowFileInfo* otherFileInfo) c_garrow_file_info_equal; ///
  gboolean function(GArrowFileInfo* fileInfo) c_garrow_file_info_is_dir; ///
  gboolean function(GArrowFileInfo* fileInfo) c_garrow_file_info_is_file; ///
  char* function(GArrowFileInfo* fileInfo) c_garrow_file_info_to_string; ///

  // FileInputStream
  GType function() c_garrow_file_input_stream_get_type; ///
  GArrowFileInputStream* function(const(char)* path, GError** _err) c_garrow_file_input_stream_new; ///
  GArrowFileInputStream* function(int fileDescriptor, GError** _err) c_garrow_file_input_stream_new_file_descriptor; ///
  int function(GArrowFileInputStream* stream) c_garrow_file_input_stream_get_file_descriptor; ///

  // FileOutputStream
  GType function() c_garrow_file_output_stream_get_type; ///
  GArrowFileOutputStream* function(const(char)* path, gboolean append, GError** _err) c_garrow_file_output_stream_new; ///

  // FileSelector
  GType function() c_garrow_file_selector_get_type; ///

  // FileSystem
  GType function() c_garrow_file_system_get_type; ///
  GArrowFileSystem* function(const(char)* uri, GError** _err) c_garrow_file_system_create; ///
  gboolean function(GArrowFileSystem* fileSystem, const(char)* src, const(char)* dest, GError** _err) c_garrow_file_system_copy_file; ///
  gboolean function(GArrowFileSystem* fileSystem, const(char)* path, gboolean recursive, GError** _err) c_garrow_file_system_create_dir; ///
  gboolean function(GArrowFileSystem* fileSystem, const(char)* path, GError** _err) c_garrow_file_system_delete_dir; ///
  gboolean function(GArrowFileSystem* fileSystem, const(char)* path, GError** _err) c_garrow_file_system_delete_dir_contents; ///
  gboolean function(GArrowFileSystem* fileSystem, const(char)* path, GError** _err) c_garrow_file_system_delete_file; ///
  gboolean function(GArrowFileSystem* fileSystem, const(char*)* paths, size_t nPaths, GError** _err) c_garrow_file_system_delete_files; ///
  GArrowFileInfo* function(GArrowFileSystem* fileSystem, const(char)* path, GError** _err) c_garrow_file_system_get_file_info; ///
  GList* function(GArrowFileSystem* fileSystem, const(char*)* paths, size_t nPaths, GError** _err) c_garrow_file_system_get_file_infos_paths; ///
  GList* function(GArrowFileSystem* fileSystem, GArrowFileSelector* fileSelector, GError** _err) c_garrow_file_system_get_file_infos_selector; ///
  char* function(GArrowFileSystem* fileSystem) c_garrow_file_system_get_type_name; ///
  gboolean function(GArrowFileSystem* fileSystem, const(char)* src, const(char)* dest, GError** _err) c_garrow_file_system_move; ///
  GArrowOutputStream* function(GArrowFileSystem* fileSystem, const(char)* path, GError** _err) c_garrow_file_system_open_append_stream; ///
  GArrowSeekableInputStream* function(GArrowFileSystem* fileSystem, const(char)* path, GError** _err) c_garrow_file_system_open_input_file; ///
  GArrowInputStream* function(GArrowFileSystem* fileSystem, const(char)* path, GError** _err) c_garrow_file_system_open_input_stream; ///
  GArrowOutputStream* function(GArrowFileSystem* fileSystem, const(char)* path, GError** _err) c_garrow_file_system_open_output_stream; ///

  // FilterNodeOptions
  GType function() c_garrow_filter_node_options_get_type; ///
  GArrowFilterNodeOptions* function(GArrowExpression* expression) c_garrow_filter_node_options_new; ///

  // FilterOptions
  GType function() c_garrow_filter_options_get_type; ///
  GArrowFilterOptions* function() c_garrow_filter_options_new; ///

  // FixedSizeBinaryArray
  GType function() c_garrow_fixed_size_binary_array_get_type; ///
  GArrowFixedSizeBinaryArray* function(GArrowFixedSizeBinaryDataType* dataType, long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_fixed_size_binary_array_new; ///
  int function(GArrowFixedSizeBinaryArray* array) c_garrow_fixed_size_binary_array_get_byte_width; ///
  GBytes* function(GArrowFixedSizeBinaryArray* array, long i) c_garrow_fixed_size_binary_array_get_value; ///
  GBytes* function(GArrowFixedSizeBinaryArray* array) c_garrow_fixed_size_binary_array_get_values_bytes; ///

  // FixedSizeBinaryArrayBuilder
  GType function() c_garrow_fixed_size_binary_array_builder_get_type; ///
  GArrowFixedSizeBinaryArrayBuilder* function(GArrowFixedSizeBinaryDataType* dataType) c_garrow_fixed_size_binary_array_builder_new; ///
  gboolean function(GArrowFixedSizeBinaryArrayBuilder* builder, const(ubyte)* value, int length, GError** _err) c_garrow_fixed_size_binary_array_builder_append_value; ///
  gboolean function(GArrowFixedSizeBinaryArrayBuilder* builder, GBytes* value, GError** _err) c_garrow_fixed_size_binary_array_builder_append_value_bytes; ///
  gboolean function(GArrowFixedSizeBinaryArrayBuilder* builder, GBytes** values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_fixed_size_binary_array_builder_append_values; ///
  gboolean function(GArrowFixedSizeBinaryArrayBuilder* builder, GBytes* values, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_fixed_size_binary_array_builder_append_values_packed; ///

  // FixedSizeBinaryDataType
  GType function() c_garrow_fixed_size_binary_data_type_get_type; ///
  GArrowFixedSizeBinaryDataType* function(int byteWidth) c_garrow_fixed_size_binary_data_type_new; ///
  int function(GArrowFixedSizeBinaryDataType* dataType) c_garrow_fixed_size_binary_data_type_get_byte_width; ///

  // FixedSizeBinaryScalar
  GType function() c_garrow_fixed_size_binary_scalar_get_type; ///
  GArrowFixedSizeBinaryScalar* function(GArrowFixedSizeBinaryDataType* dataType, GArrowBuffer* value) c_garrow_fixed_size_binary_scalar_new; ///

  // FixedWidthDataType
  GType function() c_garrow_fixed_width_data_type_get_type; ///
  int function(GArrowFixedWidthDataType* dataType) c_garrow_fixed_width_data_type_get_bit_width; ///

  // FloatArray
  GType function() c_garrow_float_array_get_type; ///
  GArrowFloatArray* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_float_array_new; ///
  float function(GArrowFloatArray* array, long i) c_garrow_float_array_get_value; ///
  const(float)* function(GArrowFloatArray* array, long* length) c_garrow_float_array_get_values; ///
  double function(GArrowFloatArray* array, GError** _err) c_garrow_float_array_sum; ///

  // FloatArrayBuilder
  GType function() c_garrow_float_array_builder_get_type; ///
  GArrowFloatArrayBuilder* function() c_garrow_float_array_builder_new; ///
  gboolean function(GArrowFloatArrayBuilder* builder, float value, GError** _err) c_garrow_float_array_builder_append; ///
  gboolean function(GArrowFloatArrayBuilder* builder, GError** _err) c_garrow_float_array_builder_append_null; ///
  gboolean function(GArrowFloatArrayBuilder* builder, long n, GError** _err) c_garrow_float_array_builder_append_nulls; ///
  gboolean function(GArrowFloatArrayBuilder* builder, float value, GError** _err) c_garrow_float_array_builder_append_value; ///
  gboolean function(GArrowFloatArrayBuilder* builder, const(float)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_float_array_builder_append_values; ///

  // FloatDataType
  GType function() c_garrow_float_data_type_get_type; ///
  GArrowFloatDataType* function() c_garrow_float_data_type_new; ///

  // FloatScalar
  GType function() c_garrow_float_scalar_get_type; ///
  GArrowFloatScalar* function(float value) c_garrow_float_scalar_new; ///
  float function(GArrowFloatScalar* scalar) c_garrow_float_scalar_get_value; ///

  // FloatingPointDataType
  GType function() c_garrow_floating_point_data_type_get_type; ///

  // Function
  GType function() c_garrow_function_get_type; ///
  GList* function() c_garrow_function_all; ///
  GArrowFunction* function(const(char)* name) c_garrow_function_find; ///
  gboolean function(GArrowFunction* function_, GArrowFunction* otherFunction) c_garrow_function_equal; ///
  GArrowDatum* function(GArrowFunction* function_, GList* args, GArrowFunctionOptions* options, GArrowExecuteContext* context, GError** _err) c_garrow_function_execute; ///
  GArrowFunctionOptions* function(GArrowFunction* function_) c_garrow_function_get_default_options; ///
  GArrowFunctionDoc* function(GArrowFunction* function_) c_garrow_function_get_doc; ///
  const(char)* function(GArrowFunction* function_) c_garrow_function_get_name; ///
  GType function(GArrowFunction* function_) c_garrow_function_get_options_type; ///
  char* function(GArrowFunction* function_) c_garrow_function_to_string; ///

  // FunctionDoc
  GType function() c_garrow_function_doc_get_type; ///
  char** function(GArrowFunctionDoc* doc) c_garrow_function_doc_get_arg_names; ///
  char* function(GArrowFunctionDoc* doc) c_garrow_function_doc_get_description; ///
  char* function(GArrowFunctionDoc* doc) c_garrow_function_doc_get_options_class_name; ///
  char* function(GArrowFunctionDoc* doc) c_garrow_function_doc_get_summary; ///

  // FunctionOptions
  GType function() c_garrow_function_options_get_type; ///
  gboolean function(GArrowFunctionOptions* options, GArrowFunctionOptions* otherOptions) c_garrow_function_options_equal; ///
  char* function(GArrowFunctionOptions* options) c_garrow_function_options_to_string; ///

  // GCSFileSystem
  GType function() c_garrow_gcs_file_system_get_type; ///

  // GIOInputStream
  GType function() c_garrow_gio_input_stream_get_type; ///
  GArrowGIOInputStream* function(GInputStream* gioInputStream) c_garrow_gio_input_stream_new; ///
  GInputStream* function(GArrowGIOInputStream* inputStream) c_garrow_gio_input_stream_get_raw; ///

  // GIOOutputStream
  GType function() c_garrow_gio_output_stream_get_type; ///
  GArrowGIOOutputStream* function(GOutputStream* gioOutputStream) c_garrow_gio_output_stream_new; ///
  GOutputStream* function(GArrowGIOOutputStream* outputStream) c_garrow_gio_output_stream_get_raw; ///

  // HDFSFileSystem
  GType function() c_garrow_hdfs_file_system_get_type; ///

  // HalfFloatArray
  GType function() c_garrow_half_float_array_get_type; ///
  GArrowHalfFloatArray* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_half_float_array_new; ///
  ushort function(GArrowHalfFloatArray* array, long i) c_garrow_half_float_array_get_value; ///
  const(ushort)* function(GArrowHalfFloatArray* array, long* length) c_garrow_half_float_array_get_values; ///

  // HalfFloatArrayBuilder
  GType function() c_garrow_half_float_array_builder_get_type; ///
  GArrowHalfFloatArrayBuilder* function() c_garrow_half_float_array_builder_new; ///
  gboolean function(GArrowHalfFloatArrayBuilder* builder, ushort value, GError** _err) c_garrow_half_float_array_builder_append_value; ///
  gboolean function(GArrowHalfFloatArrayBuilder* builder, const(ushort)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_half_float_array_builder_append_values; ///

  // HalfFloatDataType
  GType function() c_garrow_half_float_data_type_get_type; ///
  GArrowHalfFloatDataType* function() c_garrow_half_float_data_type_new; ///

  // HalfFloatScalar
  GType function() c_garrow_half_float_scalar_get_type; ///
  GArrowHalfFloatScalar* function(ushort value) c_garrow_half_float_scalar_new; ///
  ushort function(GArrowHalfFloatScalar* scalar) c_garrow_half_float_scalar_get_value; ///

  // HashJoinNodeOptions
  GType function() c_garrow_hash_join_node_options_get_type; ///
  GArrowHashJoinNodeOptions* function(GArrowJoinType type, const(char*)* leftKeys, size_t nLeftKeys, const(char*)* rightKeys, size_t nRightKeys, GError** _err) c_garrow_hash_join_node_options_new; ///
  gboolean function(GArrowHashJoinNodeOptions* options, const(char*)* outputs, size_t nOutputs, GError** _err) c_garrow_hash_join_node_options_set_left_outputs; ///
  gboolean function(GArrowHashJoinNodeOptions* options, const(char*)* outputs, size_t nOutputs, GError** _err) c_garrow_hash_join_node_options_set_right_outputs; ///

  // ISO8601TimestampParser
  GType function() c_garrow_iso8601_timestamp_parser_get_type; ///
  GArrowISO8601TimestampParser* function() c_garrow_iso8601_timestamp_parser_new; ///

  // IndexOptions
  GType function() c_garrow_index_options_get_type; ///
  GArrowIndexOptions* function() c_garrow_index_options_new; ///

  // InputStream
  GType function() c_garrow_input_stream_get_type; ///
  gboolean function(GArrowInputStream* inputStream, long nBytes, GError** _err) c_garrow_input_stream_advance; ///
  gboolean function(GArrowInputStream* inputStream, int alignment, GError** _err) c_garrow_input_stream_align; ///
  GArrowRecordBatch* function(GArrowInputStream* inputStream, GArrowSchema* schema, GArrowReadOptions* options, GError** _err) c_garrow_input_stream_read_record_batch; ///
  GArrowTensor* function(GArrowInputStream* inputStream, GError** _err) c_garrow_input_stream_read_tensor; ///

  // Int16Array
  GType function() c_garrow_int16_array_get_type; ///
  GArrowInt16Array* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_int16_array_new; ///
  short function(GArrowInt16Array* array, long i) c_garrow_int16_array_get_value; ///
  const(short)* function(GArrowInt16Array* array, long* length) c_garrow_int16_array_get_values; ///
  long function(GArrowInt16Array* array, GError** _err) c_garrow_int16_array_sum; ///

  // Int16ArrayBuilder
  GType function() c_garrow_int16_array_builder_get_type; ///
  GArrowInt16ArrayBuilder* function() c_garrow_int16_array_builder_new; ///
  gboolean function(GArrowInt16ArrayBuilder* builder, short value, GError** _err) c_garrow_int16_array_builder_append; ///
  gboolean function(GArrowInt16ArrayBuilder* builder, GError** _err) c_garrow_int16_array_builder_append_null; ///
  gboolean function(GArrowInt16ArrayBuilder* builder, long n, GError** _err) c_garrow_int16_array_builder_append_nulls; ///
  gboolean function(GArrowInt16ArrayBuilder* builder, short value, GError** _err) c_garrow_int16_array_builder_append_value; ///
  gboolean function(GArrowInt16ArrayBuilder* builder, const(short)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_int16_array_builder_append_values; ///

  // Int16DataType
  GType function() c_garrow_int16_data_type_get_type; ///
  GArrowInt16DataType* function() c_garrow_int16_data_type_new; ///

  // Int16Scalar
  GType function() c_garrow_int16_scalar_get_type; ///
  GArrowInt16Scalar* function(short value) c_garrow_int16_scalar_new; ///
  short function(GArrowInt16Scalar* scalar) c_garrow_int16_scalar_get_value; ///

  // Int32Array
  GType function() c_garrow_int32_array_get_type; ///
  GArrowInt32Array* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_int32_array_new; ///
  int function(GArrowInt32Array* array, long i) c_garrow_int32_array_get_value; ///
  const(int)* function(GArrowInt32Array* array, long* length) c_garrow_int32_array_get_values; ///
  long function(GArrowInt32Array* array, GError** _err) c_garrow_int32_array_sum; ///

  // Int32ArrayBuilder
  GType function() c_garrow_int32_array_builder_get_type; ///
  GArrowInt32ArrayBuilder* function() c_garrow_int32_array_builder_new; ///
  gboolean function(GArrowInt32ArrayBuilder* builder, int value, GError** _err) c_garrow_int32_array_builder_append; ///
  gboolean function(GArrowInt32ArrayBuilder* builder, GError** _err) c_garrow_int32_array_builder_append_null; ///
  gboolean function(GArrowInt32ArrayBuilder* builder, long n, GError** _err) c_garrow_int32_array_builder_append_nulls; ///
  gboolean function(GArrowInt32ArrayBuilder* builder, int value, GError** _err) c_garrow_int32_array_builder_append_value; ///
  gboolean function(GArrowInt32ArrayBuilder* builder, const(int)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_int32_array_builder_append_values; ///

  // Int32DataType
  GType function() c_garrow_int32_data_type_get_type; ///
  GArrowInt32DataType* function() c_garrow_int32_data_type_new; ///

  // Int32Scalar
  GType function() c_garrow_int32_scalar_get_type; ///
  GArrowInt32Scalar* function(int value) c_garrow_int32_scalar_new; ///
  int function(GArrowInt32Scalar* scalar) c_garrow_int32_scalar_get_value; ///

  // Int64Array
  GType function() c_garrow_int64_array_get_type; ///
  GArrowInt64Array* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_int64_array_new; ///
  long function(GArrowInt64Array* array, long i) c_garrow_int64_array_get_value; ///
  const(long)* function(GArrowInt64Array* array, long* length) c_garrow_int64_array_get_values; ///
  long function(GArrowInt64Array* array, GError** _err) c_garrow_int64_array_sum; ///

  // Int64ArrayBuilder
  GType function() c_garrow_int64_array_builder_get_type; ///
  GArrowInt64ArrayBuilder* function() c_garrow_int64_array_builder_new; ///
  gboolean function(GArrowInt64ArrayBuilder* builder, long value, GError** _err) c_garrow_int64_array_builder_append; ///
  gboolean function(GArrowInt64ArrayBuilder* builder, GError** _err) c_garrow_int64_array_builder_append_null; ///
  gboolean function(GArrowInt64ArrayBuilder* builder, long n, GError** _err) c_garrow_int64_array_builder_append_nulls; ///
  gboolean function(GArrowInt64ArrayBuilder* builder, long value, GError** _err) c_garrow_int64_array_builder_append_value; ///
  gboolean function(GArrowInt64ArrayBuilder* builder, const(long)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_int64_array_builder_append_values; ///

  // Int64DataType
  GType function() c_garrow_int64_data_type_get_type; ///
  GArrowInt64DataType* function() c_garrow_int64_data_type_new; ///

  // Int64Scalar
  GType function() c_garrow_int64_scalar_get_type; ///
  GArrowInt64Scalar* function(long value) c_garrow_int64_scalar_new; ///
  long function(GArrowInt64Scalar* scalar) c_garrow_int64_scalar_get_value; ///

  // Int8Array
  GType function() c_garrow_int8_array_get_type; ///
  GArrowInt8Array* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_int8_array_new; ///
  byte function(GArrowInt8Array* array, long i) c_garrow_int8_array_get_value; ///
  const(byte)* function(GArrowInt8Array* array, long* length) c_garrow_int8_array_get_values; ///
  long function(GArrowInt8Array* array, GError** _err) c_garrow_int8_array_sum; ///

  // Int8ArrayBuilder
  GType function() c_garrow_int8_array_builder_get_type; ///
  GArrowInt8ArrayBuilder* function() c_garrow_int8_array_builder_new; ///
  gboolean function(GArrowInt8ArrayBuilder* builder, byte value, GError** _err) c_garrow_int8_array_builder_append; ///
  gboolean function(GArrowInt8ArrayBuilder* builder, GError** _err) c_garrow_int8_array_builder_append_null; ///
  gboolean function(GArrowInt8ArrayBuilder* builder, long n, GError** _err) c_garrow_int8_array_builder_append_nulls; ///
  gboolean function(GArrowInt8ArrayBuilder* builder, byte value, GError** _err) c_garrow_int8_array_builder_append_value; ///
  gboolean function(GArrowInt8ArrayBuilder* builder, const(byte)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_int8_array_builder_append_values; ///

  // Int8DataType
  GType function() c_garrow_int8_data_type_get_type; ///
  GArrowInt8DataType* function() c_garrow_int8_data_type_new; ///

  // Int8Scalar
  GType function() c_garrow_int8_scalar_get_type; ///
  GArrowInt8Scalar* function(byte value) c_garrow_int8_scalar_new; ///
  byte function(GArrowInt8Scalar* scalar) c_garrow_int8_scalar_get_value; ///

  // IntArrayBuilder
  GType function() c_garrow_int_array_builder_get_type; ///
  GArrowIntArrayBuilder* function() c_garrow_int_array_builder_new; ///
  gboolean function(GArrowIntArrayBuilder* builder, long value, GError** _err) c_garrow_int_array_builder_append; ///
  gboolean function(GArrowIntArrayBuilder* builder, GError** _err) c_garrow_int_array_builder_append_null; ///
  gboolean function(GArrowIntArrayBuilder* builder, long n, GError** _err) c_garrow_int_array_builder_append_nulls; ///
  gboolean function(GArrowIntArrayBuilder* builder, long value, GError** _err) c_garrow_int_array_builder_append_value; ///
  gboolean function(GArrowIntArrayBuilder* builder, const(long)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_int_array_builder_append_values; ///

  // IntegerDataType
  GType function() c_garrow_integer_data_type_get_type; ///
  gboolean function(GArrowIntegerDataType* dataType) c_garrow_integer_data_type_is_signed; ///

  // IntervalDataType
  GType function() c_garrow_interval_data_type_get_type; ///
  GArrowIntervalType function(GArrowIntervalDataType* type) c_garrow_interval_data_type_get_interval_type; ///

  // JSONReadOptions
  GType function() c_garrow_json_read_options_get_type; ///
  GArrowJSONReadOptions* function() c_garrow_json_read_options_new; ///

  // JSONReader
  GType function() c_garrow_json_reader_get_type; ///
  GArrowJSONReader* function(GArrowInputStream* input, GArrowJSONReadOptions* options, GError** _err) c_garrow_json_reader_new; ///
  GArrowTable* function(GArrowJSONReader* reader, GError** _err) c_garrow_json_reader_read; ///

  // LargeBinaryArray
  GType function() c_garrow_large_binary_array_get_type; ///
  GArrowLargeBinaryArray* function(long length, GArrowBuffer* valueOffsets, GArrowBuffer* valueData, GArrowBuffer* nullBitmap, long nNulls) c_garrow_large_binary_array_new; ///
  GArrowBuffer* function(GArrowLargeBinaryArray* array) c_garrow_large_binary_array_get_buffer; ///
  GArrowBuffer* function(GArrowLargeBinaryArray* array) c_garrow_large_binary_array_get_data_buffer; ///
  GArrowBuffer* function(GArrowLargeBinaryArray* array) c_garrow_large_binary_array_get_offsets_buffer; ///
  GBytes* function(GArrowLargeBinaryArray* array, long i) c_garrow_large_binary_array_get_value; ///

  // LargeBinaryArrayBuilder
  GType function() c_garrow_large_binary_array_builder_get_type; ///
  GArrowLargeBinaryArrayBuilder* function() c_garrow_large_binary_array_builder_new; ///
  gboolean function(GArrowLargeBinaryArrayBuilder* builder, GError** _err) c_garrow_large_binary_array_builder_append_null; ///
  gboolean function(GArrowLargeBinaryArrayBuilder* builder, long n, GError** _err) c_garrow_large_binary_array_builder_append_nulls; ///
  gboolean function(GArrowLargeBinaryArrayBuilder* builder, const(ubyte)* value, long length, GError** _err) c_garrow_large_binary_array_builder_append_value; ///
  gboolean function(GArrowLargeBinaryArrayBuilder* builder, GBytes* value, GError** _err) c_garrow_large_binary_array_builder_append_value_bytes; ///
  gboolean function(GArrowLargeBinaryArrayBuilder* builder, GBytes** values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_large_binary_array_builder_append_values; ///

  // LargeBinaryDataType
  GType function() c_garrow_large_binary_data_type_get_type; ///
  GArrowLargeBinaryDataType* function() c_garrow_large_binary_data_type_new; ///

  // LargeBinaryScalar
  GType function() c_garrow_large_binary_scalar_get_type; ///
  GArrowLargeBinaryScalar* function(GArrowBuffer* value) c_garrow_large_binary_scalar_new; ///

  // LargeListArray
  GType function() c_garrow_large_list_array_get_type; ///
  GArrowLargeListArray* function(GArrowDataType* dataType, long length, GArrowBuffer* valueOffsets, GArrowArray* values, GArrowBuffer* nullBitmap, long nNulls) c_garrow_large_list_array_new; ///
  GArrowArray* function(GArrowLargeListArray* array, long i) c_garrow_large_list_array_get_value; ///
  long function(GArrowLargeListArray* array, long i) c_garrow_large_list_array_get_value_length; ///
  long function(GArrowLargeListArray* array, long i) c_garrow_large_list_array_get_value_offset; ///
  const(long)* function(GArrowLargeListArray* array, long* nOffsets) c_garrow_large_list_array_get_value_offsets; ///
  GArrowDataType* function(GArrowLargeListArray* array) c_garrow_large_list_array_get_value_type; ///
  GArrowArray* function(GArrowLargeListArray* array) c_garrow_large_list_array_get_values; ///

  // LargeListArrayBuilder
  GType function() c_garrow_large_list_array_builder_get_type; ///
  GArrowLargeListArrayBuilder* function(GArrowLargeListDataType* dataType, GError** _err) c_garrow_large_list_array_builder_new; ///
  gboolean function(GArrowLargeListArrayBuilder* builder, GError** _err) c_garrow_large_list_array_builder_append_null; ///
  gboolean function(GArrowLargeListArrayBuilder* builder, GError** _err) c_garrow_large_list_array_builder_append_value; ///
  GArrowArrayBuilder* function(GArrowLargeListArrayBuilder* builder) c_garrow_large_list_array_builder_get_value_builder; ///

  // LargeListDataType
  GType function() c_garrow_large_list_data_type_get_type; ///
  GArrowLargeListDataType* function(GArrowField* field) c_garrow_large_list_data_type_new; ///
  GArrowField* function(GArrowLargeListDataType* largeListDataType) c_garrow_large_list_data_type_get_field; ///

  // LargeListScalar
  GType function() c_garrow_large_list_scalar_get_type; ///
  GArrowLargeListScalar* function(GArrowLargeListArray* value) c_garrow_large_list_scalar_new; ///

  // LargeStringArray
  GType function() c_garrow_large_string_array_get_type; ///
  GArrowLargeStringArray* function(long length, GArrowBuffer* valueOffsets, GArrowBuffer* valueData, GArrowBuffer* nullBitmap, long nNulls) c_garrow_large_string_array_new; ///
  char* function(GArrowLargeStringArray* array, long i) c_garrow_large_string_array_get_string; ///

  // LargeStringArrayBuilder
  GType function() c_garrow_large_string_array_builder_get_type; ///
  GArrowLargeStringArrayBuilder* function() c_garrow_large_string_array_builder_new; ///
  gboolean function(GArrowLargeStringArrayBuilder* builder, const(char)* value, GError** _err) c_garrow_large_string_array_builder_append_string; ///
  gboolean function(GArrowLargeStringArrayBuilder* builder, const(char)* value, long length, GError** _err) c_garrow_large_string_array_builder_append_string_len; ///
  gboolean function(GArrowLargeStringArrayBuilder* builder, const(char*)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_large_string_array_builder_append_strings; ///

  // LargeStringDataType
  GType function() c_garrow_large_string_data_type_get_type; ///
  GArrowLargeStringDataType* function() c_garrow_large_string_data_type_new; ///

  // LargeStringScalar
  GType function() c_garrow_large_string_scalar_get_type; ///
  GArrowLargeStringScalar* function(GArrowBuffer* value) c_garrow_large_string_scalar_new; ///

  // ListArray
  GType function() c_garrow_list_array_get_type; ///
  GArrowListArray* function(GArrowDataType* dataType, long length, GArrowBuffer* valueOffsets, GArrowArray* values, GArrowBuffer* nullBitmap, long nNulls) c_garrow_list_array_new; ///
  GArrowArray* function(GArrowListArray* array, long i) c_garrow_list_array_get_value; ///
  int function(GArrowListArray* array, long i) c_garrow_list_array_get_value_length; ///
  int function(GArrowListArray* array, long i) c_garrow_list_array_get_value_offset; ///
  const(int)* function(GArrowListArray* array, long* nOffsets) c_garrow_list_array_get_value_offsets; ///
  GArrowDataType* function(GArrowListArray* array) c_garrow_list_array_get_value_type; ///
  GArrowArray* function(GArrowListArray* array) c_garrow_list_array_get_values; ///

  // ListArrayBuilder
  GType function() c_garrow_list_array_builder_get_type; ///
  GArrowListArrayBuilder* function(GArrowListDataType* dataType, GError** _err) c_garrow_list_array_builder_new; ///
  gboolean function(GArrowListArrayBuilder* builder, GError** _err) c_garrow_list_array_builder_append; ///
  gboolean function(GArrowListArrayBuilder* builder, GError** _err) c_garrow_list_array_builder_append_null; ///
  gboolean function(GArrowListArrayBuilder* builder, GError** _err) c_garrow_list_array_builder_append_value; ///
  GArrowArrayBuilder* function(GArrowListArrayBuilder* builder) c_garrow_list_array_builder_get_value_builder; ///

  // ListDataType
  GType function() c_garrow_list_data_type_get_type; ///
  GArrowListDataType* function(GArrowField* field) c_garrow_list_data_type_new; ///
  GArrowField* function(GArrowListDataType* listDataType) c_garrow_list_data_type_get_field; ///
  GArrowField* function(GArrowListDataType* listDataType) c_garrow_list_data_type_get_value_field; ///

  // ListScalar
  GType function() c_garrow_list_scalar_get_type; ///
  GArrowListScalar* function(GArrowListArray* value) c_garrow_list_scalar_new; ///

  // LiteralExpression
  GType function() c_garrow_literal_expression_get_type; ///
  GArrowLiteralExpression* function(GArrowDatum* datum) c_garrow_literal_expression_new; ///

  // LocalFileSystem
  GType function() c_garrow_local_file_system_get_type; ///
  GArrowLocalFileSystem* function(GArrowLocalFileSystemOptions* options) c_garrow_local_file_system_new; ///

  // LocalFileSystemOptions
  GType function() c_garrow_local_file_system_options_get_type; ///
  GArrowLocalFileSystemOptions* function() c_garrow_local_file_system_options_new; ///

  // MapArray
  GType function() c_garrow_map_array_get_type; ///
  GArrowMapArray* function(GArrowArray* offsets, GArrowArray* keys, GArrowArray* items, GError** _err) c_garrow_map_array_new; ///
  GArrowArray* function(GArrowMapArray* array) c_garrow_map_array_get_items; ///
  GArrowArray* function(GArrowMapArray* array) c_garrow_map_array_get_keys; ///

  // MapArrayBuilder
  GType function() c_garrow_map_array_builder_get_type; ///
  GArrowMapArrayBuilder* function(GArrowMapDataType* dataType, GError** _err) c_garrow_map_array_builder_new; ///
  gboolean function(GArrowMapArrayBuilder* builder, GError** _err) c_garrow_map_array_builder_append_null; ///
  gboolean function(GArrowMapArrayBuilder* builder, long n, GError** _err) c_garrow_map_array_builder_append_nulls; ///
  gboolean function(GArrowMapArrayBuilder* builder, GError** _err) c_garrow_map_array_builder_append_value; ///
  gboolean function(GArrowMapArrayBuilder* builder, const(int)* offsets, long offsetsLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_map_array_builder_append_values; ///
  GArrowArrayBuilder* function(GArrowMapArrayBuilder* builder) c_garrow_map_array_builder_get_item_builder; ///
  GArrowArrayBuilder* function(GArrowMapArrayBuilder* builder) c_garrow_map_array_builder_get_key_builder; ///
  GArrowArrayBuilder* function(GArrowMapArrayBuilder* builder) c_garrow_map_array_builder_get_value_builder; ///

  // MapDataType
  GType function() c_garrow_map_data_type_get_type; ///
  GArrowMapDataType* function(GArrowDataType* keyType, GArrowDataType* itemType) c_garrow_map_data_type_new; ///
  GArrowDataType* function(GArrowMapDataType* mapDataType) c_garrow_map_data_type_get_item_type; ///
  GArrowDataType* function(GArrowMapDataType* mapDataType) c_garrow_map_data_type_get_key_type; ///

  // MapScalar
  GType function() c_garrow_map_scalar_get_type; ///
  GArrowMapScalar* function(GArrowStructArray* value) c_garrow_map_scalar_new; ///

  // MatchSubstringOptions
  GType function() c_garrow_match_substring_options_get_type; ///
  GArrowMatchSubstringOptions* function() c_garrow_match_substring_options_new; ///

  // MemoryMappedInputStream
  GType function() c_garrow_memory_mapped_input_stream_get_type; ///
  GArrowMemoryMappedInputStream* function(const(char)* path, GError** _err) c_garrow_memory_mapped_input_stream_new; ///

  // MemoryPool
  GType function() c_garrow_memory_pool_get_type; ///
  GArrowMemoryPool* function() c_garrow_memory_pool_default; ///
  char* function(GArrowMemoryPool* memoryPool) c_garrow_memory_pool_get_backend_name; ///
  long function(GArrowMemoryPool* memoryPool) c_garrow_memory_pool_get_bytes_allocated; ///
  long function(GArrowMemoryPool* memoryPool) c_garrow_memory_pool_get_max_memory; ///

  // MockFileSystem
  GType function() c_garrow_mock_file_system_get_type; ///

  // MonthDayNano
  GType function() c_garrow_month_day_nano_get_type; ///
  GArrowMonthDayNano* function(int month, int day, long nanosecond) c_garrow_month_day_nano_new; ///
  gboolean function(GArrowMonthDayNano* monthNanoDay, GArrowMonthDayNano* otherMonthNanoDay) c_garrow_month_day_nano_equal; ///

  // MonthDayNanoIntervalArray
  GType function() c_garrow_month_day_nano_interval_array_get_type; ///
  GArrowMonthDayNanoIntervalArray* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_month_day_nano_interval_array_new; ///
  GArrowMonthDayNano* function(GArrowMonthDayNanoIntervalArray* array, long i) c_garrow_month_day_nano_interval_array_get_value; ///
  GList* function(GArrowMonthDayNanoIntervalArray* array) c_garrow_month_day_nano_interval_array_get_values; ///

  // MonthDayNanoIntervalArrayBuilder
  GType function() c_garrow_month_day_nano_interval_array_builder_get_type; ///
  GArrowMonthDayNanoIntervalArrayBuilder* function() c_garrow_month_day_nano_interval_array_builder_new; ///
  gboolean function(GArrowMonthDayNanoIntervalArrayBuilder* builder, GArrowMonthDayNano* value, GError** _err) c_garrow_month_day_nano_interval_array_builder_append_value; ///
  gboolean function(GArrowMonthDayNanoIntervalArrayBuilder* builder, const(GArrowMonthDayNano*)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_month_day_nano_interval_array_builder_append_values; ///

  // MonthDayNanoIntervalDataType
  GType function() c_garrow_month_day_nano_interval_data_type_get_type; ///
  GArrowMonthDayNanoIntervalDataType* function() c_garrow_month_day_nano_interval_data_type_new; ///

  // MonthDayNanoIntervalScalar
  GType function() c_garrow_month_day_nano_interval_scalar_get_type; ///
  GArrowMonthDayNanoIntervalScalar* function(GArrowMonthDayNano* value) c_garrow_month_day_nano_interval_scalar_new; ///
  GArrowMonthDayNano* function(GArrowMonthDayNanoIntervalScalar* scalar) c_garrow_month_day_nano_interval_scalar_get_value; ///

  // MonthIntervalArray
  GType function() c_garrow_month_interval_array_get_type; ///
  GArrowMonthIntervalArray* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_month_interval_array_new; ///
  int function(GArrowMonthIntervalArray* array, long i) c_garrow_month_interval_array_get_value; ///
  const(int)* function(GArrowMonthIntervalArray* array, long* length) c_garrow_month_interval_array_get_values; ///

  // MonthIntervalArrayBuilder
  GType function() c_garrow_month_interval_array_builder_get_type; ///
  GArrowMonthIntervalArrayBuilder* function() c_garrow_month_interval_array_builder_new; ///
  gboolean function(GArrowMonthIntervalArrayBuilder* builder, int value, GError** _err) c_garrow_month_interval_array_builder_append_value; ///
  gboolean function(GArrowMonthIntervalArrayBuilder* builder, const(int)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_month_interval_array_builder_append_values; ///

  // MonthIntervalDataType
  GType function() c_garrow_month_interval_data_type_get_type; ///
  GArrowMonthIntervalDataType* function() c_garrow_month_interval_data_type_new; ///

  // MonthIntervalScalar
  GType function() c_garrow_month_interval_scalar_get_type; ///
  GArrowMonthIntervalScalar* function(int value) c_garrow_month_interval_scalar_new; ///
  int function(GArrowMonthIntervalScalar* scalar) c_garrow_month_interval_scalar_get_value; ///

  // MutableBuffer
  GType function() c_garrow_mutable_buffer_get_type; ///
  GArrowMutableBuffer* function(ubyte* data, long size) c_garrow_mutable_buffer_new; ///
  GArrowMutableBuffer* function(GBytes* data) c_garrow_mutable_buffer_new_bytes; ///
  gboolean function(GArrowMutableBuffer* buffer, long offset, const(ubyte)* data, long size, GError** _err) c_garrow_mutable_buffer_set_data; ///
  GArrowMutableBuffer* function(GArrowMutableBuffer* buffer, long offset, long size) c_garrow_mutable_buffer_slice; ///

  // NullArray
  GType function() c_garrow_null_array_get_type; ///
  GArrowNullArray* function(long length) c_garrow_null_array_new; ///

  // NullArrayBuilder
  GType function() c_garrow_null_array_builder_get_type; ///
  GArrowNullArrayBuilder* function() c_garrow_null_array_builder_new; ///
  gboolean function(GArrowNullArrayBuilder* builder, GError** _err) c_garrow_null_array_builder_append_null; ///
  gboolean function(GArrowNullArrayBuilder* builder, long n, GError** _err) c_garrow_null_array_builder_append_nulls; ///

  // NullDataType
  GType function() c_garrow_null_data_type_get_type; ///
  GArrowNullDataType* function() c_garrow_null_data_type_new; ///

  // NullScalar
  GType function() c_garrow_null_scalar_get_type; ///
  GArrowNullScalar* function() c_garrow_null_scalar_new; ///

  // NumericArray
  GType function() c_garrow_numeric_array_get_type; ///
  double function(GArrowNumericArray* array, GError** _err) c_garrow_numeric_array_mean; ///

  // NumericDataType
  GType function() c_garrow_numeric_data_type_get_type; ///

  // OutputStream
  GType function() c_garrow_output_stream_get_type; ///
  gboolean function(GArrowOutputStream* stream, int alignment, GError** _err) c_garrow_output_stream_align; ///
  long function(GArrowOutputStream* stream, GArrowRecordBatch* recordBatch, GArrowWriteOptions* options, GError** _err) c_garrow_output_stream_write_record_batch; ///
  long function(GArrowOutputStream* stream, GArrowTensor* tensor, GError** _err) c_garrow_output_stream_write_tensor; ///

  // PrimitiveArray
  GType function() c_garrow_primitive_array_get_type; ///
  GArrowBuffer* function(GArrowPrimitiveArray* array) c_garrow_primitive_array_get_buffer; ///
  GArrowBuffer* function(GArrowPrimitiveArray* array) c_garrow_primitive_array_get_data_buffer; ///

  // ProjectNodeOptions
  GType function() c_garrow_project_node_options_get_type; ///
  GArrowProjectNodeOptions* function(GList* expressions, char** names, size_t nNames) c_garrow_project_node_options_new; ///

  // QuantileOptions
  GType function() c_garrow_quantile_options_get_type; ///
  GArrowQuantileOptions* function() c_garrow_quantile_options_new; ///
  const(double)* function(GArrowQuantileOptions* options, size_t* n) c_garrow_quantile_options_get_qs; ///
  void function(GArrowQuantileOptions* options, double q) c_garrow_quantile_options_set_q; ///
  void function(GArrowQuantileOptions* options, const(double)* qs, size_t n) c_garrow_quantile_options_set_qs; ///

  // RankOptions
  GType function() c_garrow_rank_options_get_type; ///
  GArrowRankOptions* function() c_garrow_rank_options_new; ///
  void function(GArrowRankOptions* options, GArrowSortKey* sortKey) c_garrow_rank_options_add_sort_key; ///
  gboolean function(GArrowRankOptions* options, GArrowRankOptions* otherOptions) c_garrow_rank_options_equal; ///
  GList* function(GArrowRankOptions* options) c_garrow_rank_options_get_sort_keys; ///
  void function(GArrowRankOptions* options, GList* sortKeys) c_garrow_rank_options_set_sort_keys; ///

  // ReadOptions
  GType function() c_garrow_read_options_get_type; ///
  GArrowReadOptions* function() c_garrow_read_options_new; ///
  int* function(GArrowReadOptions* options, size_t* nFields) c_garrow_read_options_get_included_fields; ///
  void function(GArrowReadOptions* options, int* fields, size_t nFields) c_garrow_read_options_set_included_fields; ///

  // Readable
  GType function() c_garrow_readable_get_type; ///
  GArrowBuffer* function(GArrowReadable* readable, long nBytes, GError** _err) c_garrow_readable_read; ///
  GBytes* function(GArrowReadable* readable, long nBytes, GError** _err) c_garrow_readable_read_bytes; ///

  // RecordBatch
  GType function() c_garrow_record_batch_get_type; ///
  GArrowRecordBatch* function(GArrowSchema* schema, uint nRows, GList* columns, GError** _err) c_garrow_record_batch_new; ///
  GArrowRecordBatch* function(void* cAbiArray, GArrowSchema* schema, GError** _err) c_garrow_record_batch_import; ///
  GArrowRecordBatch* function(GArrowRecordBatch* recordBatch, uint i, GArrowField* field, GArrowArray* column, GError** _err) c_garrow_record_batch_add_column; ///
  gboolean function(GArrowRecordBatch* recordBatch, GArrowRecordBatch* otherRecordBatch) c_garrow_record_batch_equal; ///
  gboolean function(GArrowRecordBatch* recordBatch, GArrowRecordBatch* otherRecordBatch, gboolean checkMetadata) c_garrow_record_batch_equal_metadata; ///
  gboolean function(GArrowRecordBatch* recordBatch, void** cAbiArray, void** cAbiSchema, GError** _err) c_garrow_record_batch_export; ///
  GArrowRecordBatch* function(GArrowRecordBatch* recordBatch, GArrowBooleanArray* filter, GArrowFilterOptions* options, GError** _err) c_garrow_record_batch_filter; ///
  GArrowArray* function(GArrowRecordBatch* recordBatch, int i) c_garrow_record_batch_get_column_data; ///
  const(char)* function(GArrowRecordBatch* recordBatch, int i) c_garrow_record_batch_get_column_name; ///
  uint function(GArrowRecordBatch* recordBatch) c_garrow_record_batch_get_n_columns; ///
  long function(GArrowRecordBatch* recordBatch) c_garrow_record_batch_get_n_rows; ///
  GArrowSchema* function(GArrowRecordBatch* recordBatch) c_garrow_record_batch_get_schema; ///
  GArrowRecordBatch* function(GArrowRecordBatch* recordBatch, uint i, GError** _err) c_garrow_record_batch_remove_column; ///
  GArrowBuffer* function(GArrowRecordBatch* recordBatch, GArrowWriteOptions* options, GError** _err) c_garrow_record_batch_serialize; ///
  GArrowRecordBatch* function(GArrowRecordBatch* recordBatch, long offset, long length) c_garrow_record_batch_slice; ///
  GArrowUInt64Array* function(GArrowRecordBatch* recordBatch, GArrowSortOptions* options, GError** _err) c_garrow_record_batch_sort_indices; ///
  GArrowRecordBatch* function(GArrowRecordBatch* recordBatch, GArrowArray* indices, GArrowTakeOptions* options, GError** _err) c_garrow_record_batch_take; ///
  char* function(GArrowRecordBatch* recordBatch, GError** _err) c_garrow_record_batch_to_string; ///

  // RecordBatchBuilder
  GType function() c_garrow_record_batch_builder_get_type; ///
  GArrowRecordBatchBuilder* function(GArrowSchema* schema, GError** _err) c_garrow_record_batch_builder_new; ///
  GArrowRecordBatch* function(GArrowRecordBatchBuilder* builder, GError** _err) c_garrow_record_batch_builder_flush; ///
  GArrowArrayBuilder* function(GArrowRecordBatchBuilder* builder, int i) c_garrow_record_batch_builder_get_column_builder; ///
  GArrowArrayBuilder* function(GArrowRecordBatchBuilder* builder, int i) c_garrow_record_batch_builder_get_field; ///
  long function(GArrowRecordBatchBuilder* builder) c_garrow_record_batch_builder_get_initial_capacity; ///
  int function(GArrowRecordBatchBuilder* builder) c_garrow_record_batch_builder_get_n_columns; ///
  int function(GArrowRecordBatchBuilder* builder) c_garrow_record_batch_builder_get_n_fields; ///
  GArrowSchema* function(GArrowRecordBatchBuilder* builder) c_garrow_record_batch_builder_get_schema; ///
  void function(GArrowRecordBatchBuilder* builder, long capacity) c_garrow_record_batch_builder_set_initial_capacity; ///

  // RecordBatchDatum
  GType function() c_garrow_record_batch_datum_get_type; ///
  GArrowRecordBatchDatum* function(GArrowRecordBatch* value) c_garrow_record_batch_datum_new; ///

  // RecordBatchFileReader
  GType function() c_garrow_record_batch_file_reader_get_type; ///
  GArrowRecordBatchFileReader* function(GArrowSeekableInputStream* file, GError** _err) c_garrow_record_batch_file_reader_new; ///
  uint function(GArrowRecordBatchFileReader* reader) c_garrow_record_batch_file_reader_get_n_record_batches; ///
  GArrowRecordBatch* function(GArrowRecordBatchFileReader* reader, uint i, GError** _err) c_garrow_record_batch_file_reader_get_record_batch; ///
  GArrowSchema* function(GArrowRecordBatchFileReader* reader) c_garrow_record_batch_file_reader_get_schema; ///
  GArrowMetadataVersion function(GArrowRecordBatchFileReader* reader) c_garrow_record_batch_file_reader_get_version; ///
  GArrowRecordBatch* function(GArrowRecordBatchFileReader* reader, uint i, GError** _err) c_garrow_record_batch_file_reader_read_record_batch; ///

  // RecordBatchFileWriter
  GType function() c_garrow_record_batch_file_writer_get_type; ///
  GArrowRecordBatchFileWriter* function(GArrowOutputStream* sink, GArrowSchema* schema, GError** _err) c_garrow_record_batch_file_writer_new; ///

  // RecordBatchIterator
  GType function() c_garrow_record_batch_iterator_get_type; ///
  GArrowRecordBatchIterator* function(GList* recordBatches) c_garrow_record_batch_iterator_new; ///
  gboolean function(GArrowRecordBatchIterator* iterator, GArrowRecordBatchIterator* otherIterator) c_garrow_record_batch_iterator_equal; ///
  GArrowRecordBatch* function(GArrowRecordBatchIterator* iterator, GError** _err) c_garrow_record_batch_iterator_next; ///
  GList* function(GArrowRecordBatchIterator* iterator, GError** _err) c_garrow_record_batch_iterator_to_list; ///

  // RecordBatchReader
  GType function() c_garrow_record_batch_reader_get_type; ///
  GArrowRecordBatchReader* function(GList* recordBatches, GArrowSchema* schema, GError** _err) c_garrow_record_batch_reader_new; ///
  GArrowRecordBatchReader* function(void* cAbiArrayStream, GError** _err) c_garrow_record_batch_reader_import; ///
  void* function(GArrowRecordBatchReader* reader, GError** _err) c_garrow_record_batch_reader_export; ///
  GArrowRecordBatch* function(GArrowRecordBatchReader* reader, GError** _err) c_garrow_record_batch_reader_get_next_record_batch; ///
  GArrowSchema* function(GArrowRecordBatchReader* reader) c_garrow_record_batch_reader_get_schema; ///
  GList* function(GArrowRecordBatchReader* reader) c_garrow_record_batch_reader_get_sources; ///
  GArrowTable* function(GArrowRecordBatchReader* reader, GError** _err) c_garrow_record_batch_reader_read_all; ///
  GArrowRecordBatch* function(GArrowRecordBatchReader* reader, GError** _err) c_garrow_record_batch_reader_read_next; ///
  GArrowRecordBatch* function(GArrowRecordBatchReader* reader, GError** _err) c_garrow_record_batch_reader_read_next_record_batch; ///

  // RecordBatchStreamReader
  GType function() c_garrow_record_batch_stream_reader_get_type; ///
  GArrowRecordBatchStreamReader* function(GArrowInputStream* stream, GError** _err) c_garrow_record_batch_stream_reader_new; ///

  // RecordBatchStreamWriter
  GType function() c_garrow_record_batch_stream_writer_get_type; ///
  GArrowRecordBatchStreamWriter* function(GArrowOutputStream* sink, GArrowSchema* schema, GError** _err) c_garrow_record_batch_stream_writer_new; ///

  // RecordBatchWriter
  GType function() c_garrow_record_batch_writer_get_type; ///
  gboolean function(GArrowRecordBatchWriter* writer, GError** _err) c_garrow_record_batch_writer_close; ///
  gboolean function(GArrowRecordBatchWriter* writer) c_garrow_record_batch_writer_is_closed; ///
  gboolean function(GArrowRecordBatchWriter* writer, GArrowRecordBatch* recordBatch, GError** _err) c_garrow_record_batch_writer_write_record_batch; ///
  gboolean function(GArrowRecordBatchWriter* writer, GArrowTable* table, GError** _err) c_garrow_record_batch_writer_write_table; ///

  // ResizableBuffer
  GType function() c_garrow_resizable_buffer_get_type; ///
  GArrowResizableBuffer* function(long initialSize, GError** _err) c_garrow_resizable_buffer_new; ///
  gboolean function(GArrowResizableBuffer* buffer, long newCapacity, GError** _err) c_garrow_resizable_buffer_reserve; ///
  gboolean function(GArrowResizableBuffer* buffer, long newSize, GError** _err) c_garrow_resizable_buffer_resize; ///

  // RoundOptions
  GType function() c_garrow_round_options_get_type; ///
  GArrowRoundOptions* function() c_garrow_round_options_new; ///

  // RoundToMultipleOptions
  GType function() c_garrow_round_to_multiple_options_get_type; ///
  GArrowRoundToMultipleOptions* function() c_garrow_round_to_multiple_options_new; ///

  // RunEndEncodeOptions
  GType function() c_garrow_run_end_encode_options_get_type; ///
  GArrowRunEndEncodeOptions* function(GArrowDataType* runEndDataType) c_garrow_run_end_encode_options_new; ///

  // RunEndEncodedArray
  GType function() c_garrow_run_end_encoded_array_get_type; ///
  GArrowRunEndEncodedArray* function(GArrowDataType* dataType, long logicalLength, GArrowArray* runEnds, GArrowArray* values, long logicalOffset, GError** _err) c_garrow_run_end_encoded_array_new; ///
  GArrowArray* function(GArrowRunEndEncodedArray* array, GError** _err) c_garrow_run_end_encoded_array_decode; ///
  long function(GArrowRunEndEncodedArray* array) c_garrow_run_end_encoded_array_find_physical_length; ///
  long function(GArrowRunEndEncodedArray* array) c_garrow_run_end_encoded_array_find_physical_offset; ///
  GArrowArray* function(GArrowRunEndEncodedArray* array, GError** _err) c_garrow_run_end_encoded_array_get_logical_run_ends; ///
  GArrowArray* function(GArrowRunEndEncodedArray* array) c_garrow_run_end_encoded_array_get_logical_values; ///
  GArrowArray* function(GArrowRunEndEncodedArray* array) c_garrow_run_end_encoded_array_get_run_ends; ///
  GArrowArray* function(GArrowRunEndEncodedArray* array) c_garrow_run_end_encoded_array_get_values; ///

  // RunEndEncodedDataType
  GType function() c_garrow_run_end_encoded_data_type_get_type; ///
  GArrowRunEndEncodedDataType* function(GArrowDataType* runEndDataType, GArrowDataType* valueDataType) c_garrow_run_end_encoded_data_type_new; ///
  GArrowDataType* function(GArrowRunEndEncodedDataType* dataType) c_garrow_run_end_encoded_data_type_get_run_end_data_type; ///
  GArrowDataType* function(GArrowRunEndEncodedDataType* dataType) c_garrow_run_end_encoded_data_type_get_value_data_type; ///

  // S3FileSystem
  GType function() c_garrow_s3_file_system_get_type; ///

  // S3GlobalOptions
  GType function() c_garrow_s3_global_options_get_type; ///
  GArrowS3GlobalOptions* function() c_garrow_s3_global_options_new; ///

  // Scalar
  GType function() c_garrow_scalar_get_type; ///
  GArrowScalar* function(GArrowDataType* dataType, const(ubyte)* data, size_t size, GError** _err) c_garrow_scalar_parse; ///
  GArrowScalar* function(GArrowScalar* scalar, GArrowDataType* dataType, GArrowCastOptions* options, GError** _err) c_garrow_scalar_cast; ///
  gboolean function(GArrowScalar* scalar, GArrowScalar* otherScalar) c_garrow_scalar_equal; ///
  gboolean function(GArrowScalar* scalar, GArrowScalar* otherScalar, GArrowEqualOptions* options) c_garrow_scalar_equal_options; ///
  GArrowDataType* function(GArrowScalar* scalar) c_garrow_scalar_get_data_type; ///
  gboolean function(GArrowScalar* scalar) c_garrow_scalar_is_valid; ///
  char* function(GArrowScalar* scalar) c_garrow_scalar_to_string; ///

  // ScalarAggregateOptions
  GType function() c_garrow_scalar_aggregate_options_get_type; ///
  GArrowScalarAggregateOptions* function() c_garrow_scalar_aggregate_options_new; ///

  // ScalarDatum
  GType function() c_garrow_scalar_datum_get_type; ///
  GArrowScalarDatum* function(GArrowScalar* value) c_garrow_scalar_datum_new; ///

  // Schema
  GType function() c_garrow_schema_get_type; ///
  GArrowSchema* function(GList* fields) c_garrow_schema_new; ///
  GArrowSchema* function(void* cAbiSchema, GError** _err) c_garrow_schema_import; ///
  GArrowSchema* function(GArrowSchema* schema, uint i, GArrowField* field, GError** _err) c_garrow_schema_add_field; ///
  gboolean function(GArrowSchema* schema, GArrowSchema* otherSchema) c_garrow_schema_equal; ///
  void* function(GArrowSchema* schema, GError** _err) c_garrow_schema_export; ///
  GArrowField* function(GArrowSchema* schema, uint i) c_garrow_schema_get_field; ///
  GArrowField* function(GArrowSchema* schema, const(char)* name) c_garrow_schema_get_field_by_name; ///
  int function(GArrowSchema* schema, const(char)* name) c_garrow_schema_get_field_index; ///
  GList* function(GArrowSchema* schema) c_garrow_schema_get_fields; ///
  GHashTable* function(GArrowSchema* schema) c_garrow_schema_get_metadata; ///
  gboolean function(GArrowSchema* schema) c_garrow_schema_has_metadata; ///
  uint function(GArrowSchema* schema) c_garrow_schema_n_fields; ///
  GArrowSchema* function(GArrowSchema* schema, uint i, GError** _err) c_garrow_schema_remove_field; ///
  GArrowSchema* function(GArrowSchema* schema, uint i, GArrowField* field, GError** _err) c_garrow_schema_replace_field; ///
  char* function(GArrowSchema* schema) c_garrow_schema_to_string; ///
  char* function(GArrowSchema* schema, gboolean showMetadata) c_garrow_schema_to_string_metadata; ///
  GArrowSchema* function(GArrowSchema* schema, GHashTable* metadata) c_garrow_schema_with_metadata; ///

  // SeekableInputStream
  GType function() c_garrow_seekable_input_stream_get_type; ///
  ulong function(GArrowSeekableInputStream* inputStream, GError** _err) c_garrow_seekable_input_stream_get_size; ///
  gboolean function(GArrowSeekableInputStream* inputStream) c_garrow_seekable_input_stream_get_support_zero_copy; ///
  GBytes* function(GArrowSeekableInputStream* inputStream, long nBytes, GError** _err) c_garrow_seekable_input_stream_peek; ///
  GArrowBuffer* function(GArrowSeekableInputStream* inputStream, long position, long nBytes, GError** _err) c_garrow_seekable_input_stream_read_at; ///
  GBytes* function(GArrowSeekableInputStream* inputStream, long position, long nBytes, GError** _err) c_garrow_seekable_input_stream_read_at_bytes; ///

  // SetLookupOptions
  GType function() c_garrow_set_lookup_options_get_type; ///
  GArrowSetLookupOptions* function(GArrowDatum* valueSet) c_garrow_set_lookup_options_new; ///

  // SinkNodeOptions
  GType function() c_garrow_sink_node_options_get_type; ///
  GArrowSinkNodeOptions* function() c_garrow_sink_node_options_new; ///
  GArrowRecordBatchReader* function(GArrowSinkNodeOptions* options, GArrowSchema* schema) c_garrow_sink_node_options_get_reader; ///

  // SlowFileSystem
  GType function() c_garrow_slow_file_system_get_type; ///
  GArrowSlowFileSystem* function(GArrowFileSystem* baseFileSystem, double averageLatency) c_garrow_slow_file_system_new_average_latency; ///
  GArrowSlowFileSystem* function(GArrowFileSystem* baseFileSystem, double averageLatency, int seed) c_garrow_slow_file_system_new_average_latency_and_seed; ///

  // SortKey
  GType function() c_garrow_sort_key_get_type; ///
  GArrowSortKey* function(const(char)* target, GArrowSortOrder order, GError** _err) c_garrow_sort_key_new; ///
  gboolean function(GArrowSortKey* sortKey, GArrowSortKey* otherSortKey) c_garrow_sort_key_equal; ///

  // SortOptions
  GType function() c_garrow_sort_options_get_type; ///
  GArrowSortOptions* function(GList* sortKeys) c_garrow_sort_options_new; ///
  void function(GArrowSortOptions* options, GArrowSortKey* sortKey) c_garrow_sort_options_add_sort_key; ///
  gboolean function(GArrowSortOptions* options, GArrowSortOptions* otherOptions) c_garrow_sort_options_equal; ///
  GList* function(GArrowSortOptions* options) c_garrow_sort_options_get_sort_keys; ///
  void function(GArrowSortOptions* options, GList* sortKeys) c_garrow_sort_options_set_sort_keys; ///

  // SourceNodeOptions
  GType function() c_garrow_source_node_options_get_type; ///
  GArrowSourceNodeOptions* function(GArrowRecordBatch* recordBatch) c_garrow_source_node_options_new_record_batch; ///
  GArrowSourceNodeOptions* function(GArrowRecordBatchReader* reader) c_garrow_source_node_options_new_record_batch_reader; ///
  GArrowSourceNodeOptions* function(GArrowTable* table) c_garrow_source_node_options_new_table; ///

  // SparseUnionArray
  GType function() c_garrow_sparse_union_array_get_type; ///
  GArrowSparseUnionArray* function(GArrowInt8Array* typeIds, GList* fields, GError** _err) c_garrow_sparse_union_array_new; ///
  GArrowSparseUnionArray* function(GArrowSparseUnionDataType* dataType, GArrowInt8Array* typeIds, GList* fields, GError** _err) c_garrow_sparse_union_array_new_data_type; ///

  // SparseUnionArrayBuilder
  GType function() c_garrow_sparse_union_array_builder_get_type; ///
  GArrowSparseUnionArrayBuilder* function(GArrowSparseUnionDataType* dataType, GError** _err) c_garrow_sparse_union_array_builder_new; ///

  // SparseUnionDataType
  GType function() c_garrow_sparse_union_data_type_get_type; ///
  GArrowSparseUnionDataType* function(GList* fields, byte* typeCodes, size_t nTypeCodes) c_garrow_sparse_union_data_type_new; ///

  // SparseUnionScalar
  GType function() c_garrow_sparse_union_scalar_get_type; ///
  GArrowSparseUnionScalar* function(GArrowSparseUnionDataType* dataType, byte typeCode, GArrowScalar* value) c_garrow_sparse_union_scalar_new; ///

  // SplitPatternOptions
  GType function() c_garrow_split_pattern_options_get_type; ///
  GArrowSplitPatternOptions* function() c_garrow_split_pattern_options_new; ///

  // StreamDecoder
  GType function() c_garrow_stream_decoder_get_type; ///
  GArrowStreamDecoder* function(GArrowStreamListener* listener, GArrowReadOptions* options) c_garrow_stream_decoder_new; ///
  gboolean function(GArrowStreamDecoder* decoder, GArrowBuffer* buffer, GError** _err) c_garrow_stream_decoder_consume_buffer; ///
  gboolean function(GArrowStreamDecoder* decoder, GBytes* bytes, GError** _err) c_garrow_stream_decoder_consume_bytes; ///
  size_t function(GArrowStreamDecoder* decoder) c_garrow_stream_decoder_get_next_required_size; ///
  GArrowSchema* function(GArrowStreamDecoder* decoder) c_garrow_stream_decoder_get_schema; ///
  gboolean function(GArrowStreamDecoder* decoder, GError** _err) c_garrow_stream_decoder_reset; ///

  // StreamListener
  GType function() c_garrow_stream_listener_get_type; ///
  gboolean function(GArrowStreamListener* listener, GError** _err) c_garrow_stream_listener_on_eos; ///
  gboolean function(GArrowStreamListener* listener, GArrowRecordBatch* recordBatch, GHashTable* metadata, GError** _err) c_garrow_stream_listener_on_record_batch_decoded; ///
  gboolean function(GArrowStreamListener* listener, GArrowSchema* schema, GArrowSchema* filteredSchema, GError** _err) c_garrow_stream_listener_on_schema_decoded; ///

  // StrftimeOptions
  GType function() c_garrow_strftime_options_get_type; ///
  GArrowStrftimeOptions* function() c_garrow_strftime_options_new; ///

  // StringArray
  GType function() c_garrow_string_array_get_type; ///
  GArrowStringArray* function(long length, GArrowBuffer* valueOffsets, GArrowBuffer* valueData, GArrowBuffer* nullBitmap, long nNulls) c_garrow_string_array_new; ///
  char* function(GArrowStringArray* array, long i) c_garrow_string_array_get_string; ///

  // StringArrayBuilder
  GType function() c_garrow_string_array_builder_get_type; ///
  GArrowStringArrayBuilder* function() c_garrow_string_array_builder_new; ///
  gboolean function(GArrowStringArrayBuilder* builder, const(char)* value, GError** _err) c_garrow_string_array_builder_append; ///
  gboolean function(GArrowStringArrayBuilder* builder, const(char)* value, GError** _err) c_garrow_string_array_builder_append_string; ///
  gboolean function(GArrowStringArrayBuilder* builder, const(char)* value, int length, GError** _err) c_garrow_string_array_builder_append_string_len; ///
  gboolean function(GArrowStringArrayBuilder* builder, const(char*)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_string_array_builder_append_strings; ///
  gboolean function(GArrowStringArrayBuilder* builder, const(char)* value, GError** _err) c_garrow_string_array_builder_append_value; ///
  gboolean function(GArrowStringArrayBuilder* builder, const(char*)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_string_array_builder_append_values; ///

  // StringDataType
  GType function() c_garrow_string_data_type_get_type; ///
  GArrowStringDataType* function() c_garrow_string_data_type_new; ///

  // StringDictionaryArrayBuilder
  GType function() c_garrow_string_dictionary_array_builder_get_type; ///
  GArrowStringDictionaryArrayBuilder* function() c_garrow_string_dictionary_array_builder_new; ///
  gboolean function(GArrowStringDictionaryArrayBuilder* builder, GArrowStringArray* array, GError** _err) c_garrow_string_dictionary_array_builder_append_array; ///
  gboolean function(GArrowStringDictionaryArrayBuilder* builder, const(long)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_string_dictionary_array_builder_append_indices; ///
  gboolean function(GArrowStringDictionaryArrayBuilder* builder, GError** _err) c_garrow_string_dictionary_array_builder_append_null; ///
  gboolean function(GArrowStringDictionaryArrayBuilder* builder, const(char)* value, GError** _err) c_garrow_string_dictionary_array_builder_append_string; ///
  gboolean function(GArrowStringDictionaryArrayBuilder* builder, GArrowArray** outIndices, GArrowArray** outDelta, GError** _err) c_garrow_string_dictionary_array_builder_finish_delta; ///
  long function(GArrowStringDictionaryArrayBuilder* builder) c_garrow_string_dictionary_array_builder_get_dictionary_length; ///
  gboolean function(GArrowStringDictionaryArrayBuilder* builder, GArrowStringArray* values, GError** _err) c_garrow_string_dictionary_array_builder_insert_memo_values; ///
  void function(GArrowStringDictionaryArrayBuilder* builder) c_garrow_string_dictionary_array_builder_reset_full; ///

  // StringScalar
  GType function() c_garrow_string_scalar_get_type; ///
  GArrowStringScalar* function(GArrowBuffer* value) c_garrow_string_scalar_new; ///

  // StringViewDataType
  GType function() c_garrow_string_view_data_type_get_type; ///
  GArrowStringViewDataType* function() c_garrow_string_view_data_type_new; ///

  // StrptimeOptions
  GType function() c_garrow_strptime_options_get_type; ///
  GArrowStrptimeOptions* function() c_garrow_strptime_options_new; ///

  // StrptimeTimestampParser
  GType function() c_garrow_strptime_timestamp_parser_get_type; ///
  GArrowStrptimeTimestampParser* function(const(char)* format) c_garrow_strptime_timestamp_parser_new; ///
  const(char)* function(GArrowStrptimeTimestampParser* parser) c_garrow_strptime_timestamp_parser_get_format; ///

  // StructArray
  GType function() c_garrow_struct_array_get_type; ///
  GArrowStructArray* function(GArrowDataType* dataType, long length, GList* fields, GArrowBuffer* nullBitmap, long nNulls) c_garrow_struct_array_new; ///
  GList* function(GArrowStructArray* array, GError** _err) c_garrow_struct_array_flatten; ///
  GArrowArray* function(GArrowStructArray* array, int i) c_garrow_struct_array_get_field; ///
  GList* function(GArrowStructArray* array) c_garrow_struct_array_get_fields; ///

  // StructArrayBuilder
  GType function() c_garrow_struct_array_builder_get_type; ///
  GArrowStructArrayBuilder* function(GArrowStructDataType* dataType, GError** _err) c_garrow_struct_array_builder_new; ///
  gboolean function(GArrowStructArrayBuilder* builder, GError** _err) c_garrow_struct_array_builder_append; ///
  gboolean function(GArrowStructArrayBuilder* builder, GError** _err) c_garrow_struct_array_builder_append_null; ///
  gboolean function(GArrowStructArrayBuilder* builder, GError** _err) c_garrow_struct_array_builder_append_value; ///
  GArrowArrayBuilder* function(GArrowStructArrayBuilder* builder, int i) c_garrow_struct_array_builder_get_field_builder; ///
  GList* function(GArrowStructArrayBuilder* builder) c_garrow_struct_array_builder_get_field_builders; ///

  // StructDataType
  GType function() c_garrow_struct_data_type_get_type; ///
  GArrowStructDataType* function(GList* fields) c_garrow_struct_data_type_new; ///
  GArrowField* function(GArrowStructDataType* structDataType, int i) c_garrow_struct_data_type_get_field; ///
  GArrowField* function(GArrowStructDataType* structDataType, const(char)* name) c_garrow_struct_data_type_get_field_by_name; ///
  int function(GArrowStructDataType* structDataType, const(char)* name) c_garrow_struct_data_type_get_field_index; ///
  GList* function(GArrowStructDataType* structDataType) c_garrow_struct_data_type_get_fields; ///
  int function(GArrowStructDataType* structDataType) c_garrow_struct_data_type_get_n_fields; ///

  // StructFieldOptions
  GType function() c_garrow_struct_field_options_get_type; ///
  GArrowStructFieldOptions* function() c_garrow_struct_field_options_new; ///
  void function(GArrowStructFieldOptions* options, const(char)* fieldRef, GError** _err) c_garrow_struct_field_options_set_field_ref; ///

  // StructScalar
  GType function() c_garrow_struct_scalar_get_type; ///
  GArrowStructScalar* function(GArrowStructDataType* dataType, GList* value) c_garrow_struct_scalar_new; ///
  GList* function(GArrowStructScalar* scalar) c_garrow_struct_scalar_get_value; ///

  // SubTreeFileSystem
  GType function() c_garrow_sub_tree_file_system_get_type; ///
  GArrowSubTreeFileSystem* function(const(char)* basePath, GArrowFileSystem* baseFileSystem) c_garrow_sub_tree_file_system_new; ///

  // Table
  GType function() c_garrow_table_get_type; ///
  GArrowTable* function(GArrowSchema* schema, GArrowArray** arrays, size_t nArrays, GError** _err) c_garrow_table_new_arrays; ///
  GArrowTable* function(GArrowSchema* schema, GArrowChunkedArray** chunkedArrays, size_t nChunkedArrays, GError** _err) c_garrow_table_new_chunked_arrays; ///
  GArrowTable* function(GArrowSchema* schema, GArrowRecordBatch** recordBatches, size_t nRecordBatches, GError** _err) c_garrow_table_new_record_batches; ///
  GArrowTable* function(GArrowSchema* schema, GList* values, GError** _err) c_garrow_table_new_values; ///
  GArrowTable* function(GArrowTable* table, uint i, GArrowField* field, GArrowChunkedArray* chunkedArray, GError** _err) c_garrow_table_add_column; ///
  GArrowTable* function(GArrowTable* table, GError** _err) c_garrow_table_combine_chunks; ///
  GArrowTable* function(GArrowTable* table, GList* otherTables, GArrowTableConcatenateOptions* options, GError** _err) c_garrow_table_concatenate; ///
  gboolean function(GArrowTable* table, GArrowTable* otherTable) c_garrow_table_equal; ///
  gboolean function(GArrowTable* table, GArrowTable* otherTable, gboolean checkMetadata) c_garrow_table_equal_metadata; ///
  GArrowTable* function(GArrowTable* table, GArrowBooleanArray* filter, GArrowFilterOptions* options, GError** _err) c_garrow_table_filter; ///
  GArrowTable* function(GArrowTable* table, GArrowChunkedArray* filter, GArrowFilterOptions* options, GError** _err) c_garrow_table_filter_chunked_array; ///
  GArrowChunkedArray* function(GArrowTable* table, int i) c_garrow_table_get_column_data; ///
  uint function(GArrowTable* table) c_garrow_table_get_n_columns; ///
  ulong function(GArrowTable* table) c_garrow_table_get_n_rows; ///
  GArrowSchema* function(GArrowTable* table) c_garrow_table_get_schema; ///
  GArrowTable* function(GArrowTable* table, uint i, GError** _err) c_garrow_table_remove_column; ///
  GArrowTable* function(GArrowTable* table, uint i, GArrowField* field, GArrowChunkedArray* chunkedArray, GError** _err) c_garrow_table_replace_column; ///
  GArrowTable* function(GArrowTable* table, long offset, long length) c_garrow_table_slice; ///
  GArrowUInt64Array* function(GArrowTable* table, GArrowSortOptions* options, GError** _err) c_garrow_table_sort_indices; ///
  GArrowTable* function(GArrowTable* table, GArrowArray* indices, GArrowTakeOptions* options, GError** _err) c_garrow_table_take; ///
  GArrowTable* function(GArrowTable* table, GArrowChunkedArray* indices, GArrowTakeOptions* options, GError** _err) c_garrow_table_take_chunked_array; ///
  char* function(GArrowTable* table, GError** _err) c_garrow_table_to_string; ///
  gboolean function(GArrowTable* table, GArrowOutputStream* sink, GArrowFeatherWriteProperties* properties, GError** _err) c_garrow_table_write_as_feather; ///

  // TableBatchReader
  GType function() c_garrow_table_batch_reader_get_type; ///
  GArrowTableBatchReader* function(GArrowTable* table) c_garrow_table_batch_reader_new; ///
  void function(GArrowTableBatchReader* reader, long maxChunkSize) c_garrow_table_batch_reader_set_max_chunk_size; ///

  // TableConcatenateOptions
  GType function() c_garrow_table_concatenate_options_get_type; ///
  GArrowTableConcatenateOptions* function() c_garrow_table_concatenate_options_new; ///

  // TableDatum
  GType function() c_garrow_table_datum_get_type; ///
  GArrowTableDatum* function(GArrowTable* value) c_garrow_table_datum_new; ///

  // TakeOptions
  GType function() c_garrow_take_options_get_type; ///
  GArrowTakeOptions* function() c_garrow_take_options_new; ///

  // TemporalDataType
  GType function() c_garrow_temporal_data_type_get_type; ///

  // Tensor
  GType function() c_garrow_tensor_get_type; ///
  GArrowTensor* function(GArrowDataType* dataType, GArrowBuffer* data, long* shape, size_t nDimensions, long* strides, size_t nStrides, char** dimensionNames, size_t nDimensionNames) c_garrow_tensor_new; ///
  gboolean function(GArrowTensor* tensor, GArrowTensor* otherTensor) c_garrow_tensor_equal; ///
  GArrowBuffer* function(GArrowTensor* tensor) c_garrow_tensor_get_buffer; ///
  const(char)* function(GArrowTensor* tensor, int i) c_garrow_tensor_get_dimension_name; ///
  int function(GArrowTensor* tensor) c_garrow_tensor_get_n_dimensions; ///
  long* function(GArrowTensor* tensor, int* nDimensions) c_garrow_tensor_get_shape; ///
  long function(GArrowTensor* tensor) c_garrow_tensor_get_size; ///
  long* function(GArrowTensor* tensor, int* nStrides) c_garrow_tensor_get_strides; ///
  GArrowDataType* function(GArrowTensor* tensor) c_garrow_tensor_get_value_data_type; ///
  GArrowType function(GArrowTensor* tensor) c_garrow_tensor_get_value_type; ///
  gboolean function(GArrowTensor* tensor) c_garrow_tensor_is_column_major; ///
  gboolean function(GArrowTensor* tensor) c_garrow_tensor_is_contiguous; ///
  gboolean function(GArrowTensor* tensor) c_garrow_tensor_is_mutable; ///
  gboolean function(GArrowTensor* tensor) c_garrow_tensor_is_row_major; ///

  // Time32Array
  GType function() c_garrow_time32_array_get_type; ///
  GArrowTime32Array* function(GArrowTime32DataType* dataType, long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_time32_array_new; ///
  int function(GArrowTime32Array* array, long i) c_garrow_time32_array_get_value; ///
  const(int)* function(GArrowTime32Array* array, long* length) c_garrow_time32_array_get_values; ///

  // Time32ArrayBuilder
  GType function() c_garrow_time32_array_builder_get_type; ///
  GArrowTime32ArrayBuilder* function(GArrowTime32DataType* dataType) c_garrow_time32_array_builder_new; ///
  gboolean function(GArrowTime32ArrayBuilder* builder, int value, GError** _err) c_garrow_time32_array_builder_append; ///
  gboolean function(GArrowTime32ArrayBuilder* builder, GError** _err) c_garrow_time32_array_builder_append_null; ///
  gboolean function(GArrowTime32ArrayBuilder* builder, long n, GError** _err) c_garrow_time32_array_builder_append_nulls; ///
  gboolean function(GArrowTime32ArrayBuilder* builder, int value, GError** _err) c_garrow_time32_array_builder_append_value; ///
  gboolean function(GArrowTime32ArrayBuilder* builder, const(int)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_time32_array_builder_append_values; ///

  // Time32DataType
  GType function() c_garrow_time32_data_type_get_type; ///
  GArrowTime32DataType* function(GArrowTimeUnit unit, GError** _err) c_garrow_time32_data_type_new; ///

  // Time32Scalar
  GType function() c_garrow_time32_scalar_get_type; ///
  GArrowTime32Scalar* function(GArrowTime32DataType* dataType, int value) c_garrow_time32_scalar_new; ///
  int function(GArrowTime32Scalar* scalar) c_garrow_time32_scalar_get_value; ///

  // Time64Array
  GType function() c_garrow_time64_array_get_type; ///
  GArrowTime64Array* function(GArrowTime64DataType* dataType, long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_time64_array_new; ///
  long function(GArrowTime64Array* array, long i) c_garrow_time64_array_get_value; ///
  const(long)* function(GArrowTime64Array* array, long* length) c_garrow_time64_array_get_values; ///

  // Time64ArrayBuilder
  GType function() c_garrow_time64_array_builder_get_type; ///
  GArrowTime64ArrayBuilder* function(GArrowTime64DataType* dataType) c_garrow_time64_array_builder_new; ///
  gboolean function(GArrowTime64ArrayBuilder* builder, long value, GError** _err) c_garrow_time64_array_builder_append; ///
  gboolean function(GArrowTime64ArrayBuilder* builder, GError** _err) c_garrow_time64_array_builder_append_null; ///
  gboolean function(GArrowTime64ArrayBuilder* builder, long n, GError** _err) c_garrow_time64_array_builder_append_nulls; ///
  gboolean function(GArrowTime64ArrayBuilder* builder, long value, GError** _err) c_garrow_time64_array_builder_append_value; ///
  gboolean function(GArrowTime64ArrayBuilder* builder, const(long)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_time64_array_builder_append_values; ///

  // Time64DataType
  GType function() c_garrow_time64_data_type_get_type; ///
  GArrowTime64DataType* function(GArrowTimeUnit unit, GError** _err) c_garrow_time64_data_type_new; ///

  // Time64Scalar
  GType function() c_garrow_time64_scalar_get_type; ///
  GArrowTime64Scalar* function(GArrowTime64DataType* dataType, long value) c_garrow_time64_scalar_new; ///
  long function(GArrowTime64Scalar* scalar) c_garrow_time64_scalar_get_value; ///

  // TimeDataType
  GType function() c_garrow_time_data_type_get_type; ///
  GArrowTimeUnit function(GArrowTimeDataType* timeDataType) c_garrow_time_data_type_get_unit; ///

  // TimestampArray
  GType function() c_garrow_timestamp_array_get_type; ///
  GArrowTimestampArray* function(GArrowTimestampDataType* dataType, long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_timestamp_array_new; ///
  long function(GArrowTimestampArray* array, long i) c_garrow_timestamp_array_get_value; ///
  const(long)* function(GArrowTimestampArray* array, long* length) c_garrow_timestamp_array_get_values; ///

  // TimestampArrayBuilder
  GType function() c_garrow_timestamp_array_builder_get_type; ///
  GArrowTimestampArrayBuilder* function(GArrowTimestampDataType* dataType) c_garrow_timestamp_array_builder_new; ///
  gboolean function(GArrowTimestampArrayBuilder* builder, long value, GError** _err) c_garrow_timestamp_array_builder_append; ///
  gboolean function(GArrowTimestampArrayBuilder* builder, GError** _err) c_garrow_timestamp_array_builder_append_null; ///
  gboolean function(GArrowTimestampArrayBuilder* builder, long n, GError** _err) c_garrow_timestamp_array_builder_append_nulls; ///
  gboolean function(GArrowTimestampArrayBuilder* builder, long value, GError** _err) c_garrow_timestamp_array_builder_append_value; ///
  gboolean function(GArrowTimestampArrayBuilder* builder, const(long)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_timestamp_array_builder_append_values; ///

  // TimestampDataType
  GType function() c_garrow_timestamp_data_type_get_type; ///
  GArrowTimestampDataType* function(GArrowTimeUnit unit, GTimeZone* timeZone) c_garrow_timestamp_data_type_new; ///
  GArrowTimeUnit function(GArrowTimestampDataType* dataType) c_garrow_timestamp_data_type_get_unit; ///

  // TimestampParser
  GType function() c_garrow_timestamp_parser_get_type; ///
  const(char)* function(GArrowTimestampParser* parser) c_garrow_timestamp_parser_get_kind; ///

  // TimestampScalar
  GType function() c_garrow_timestamp_scalar_get_type; ///
  GArrowTimestampScalar* function(GArrowTimestampDataType* dataType, long value) c_garrow_timestamp_scalar_new; ///
  long function(GArrowTimestampScalar* scalar) c_garrow_timestamp_scalar_get_value; ///

  // UInt16Array
  GType function() c_garrow_uint16_array_get_type; ///
  GArrowUInt16Array* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_uint16_array_new; ///
  ushort function(GArrowUInt16Array* array, long i) c_garrow_uint16_array_get_value; ///
  const(ushort)* function(GArrowUInt16Array* array, long* length) c_garrow_uint16_array_get_values; ///
  ulong function(GArrowUInt16Array* array, GError** _err) c_garrow_uint16_array_sum; ///

  // UInt16ArrayBuilder
  GType function() c_garrow_uint16_array_builder_get_type; ///
  GArrowUInt16ArrayBuilder* function() c_garrow_uint16_array_builder_new; ///
  gboolean function(GArrowUInt16ArrayBuilder* builder, ushort value, GError** _err) c_garrow_uint16_array_builder_append; ///
  gboolean function(GArrowUInt16ArrayBuilder* builder, GError** _err) c_garrow_uint16_array_builder_append_null; ///
  gboolean function(GArrowUInt16ArrayBuilder* builder, long n, GError** _err) c_garrow_uint16_array_builder_append_nulls; ///
  gboolean function(GArrowUInt16ArrayBuilder* builder, ushort value, GError** _err) c_garrow_uint16_array_builder_append_value; ///
  gboolean function(GArrowUInt16ArrayBuilder* builder, const(ushort)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_uint16_array_builder_append_values; ///

  // UInt16DataType
  GType function() c_garrow_uint16_data_type_get_type; ///
  GArrowUInt16DataType* function() c_garrow_uint16_data_type_new; ///

  // UInt16Scalar
  GType function() c_garrow_uint16_scalar_get_type; ///
  GArrowUInt16Scalar* function(ushort value) c_garrow_uint16_scalar_new; ///
  ushort function(GArrowUInt16Scalar* scalar) c_garrow_uint16_scalar_get_value; ///

  // UInt32Array
  GType function() c_garrow_uint32_array_get_type; ///
  GArrowUInt32Array* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_uint32_array_new; ///
  uint function(GArrowUInt32Array* array, long i) c_garrow_uint32_array_get_value; ///
  const(uint)* function(GArrowUInt32Array* array, long* length) c_garrow_uint32_array_get_values; ///
  ulong function(GArrowUInt32Array* array, GError** _err) c_garrow_uint32_array_sum; ///

  // UInt32ArrayBuilder
  GType function() c_garrow_uint32_array_builder_get_type; ///
  GArrowUInt32ArrayBuilder* function() c_garrow_uint32_array_builder_new; ///
  gboolean function(GArrowUInt32ArrayBuilder* builder, uint value, GError** _err) c_garrow_uint32_array_builder_append; ///
  gboolean function(GArrowUInt32ArrayBuilder* builder, GError** _err) c_garrow_uint32_array_builder_append_null; ///
  gboolean function(GArrowUInt32ArrayBuilder* builder, long n, GError** _err) c_garrow_uint32_array_builder_append_nulls; ///
  gboolean function(GArrowUInt32ArrayBuilder* builder, uint value, GError** _err) c_garrow_uint32_array_builder_append_value; ///
  gboolean function(GArrowUInt32ArrayBuilder* builder, const(uint)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_uint32_array_builder_append_values; ///

  // UInt32DataType
  GType function() c_garrow_uint32_data_type_get_type; ///
  GArrowUInt32DataType* function() c_garrow_uint32_data_type_new; ///

  // UInt32Scalar
  GType function() c_garrow_uint32_scalar_get_type; ///
  GArrowUInt32Scalar* function(uint value) c_garrow_uint32_scalar_new; ///
  uint function(GArrowUInt32Scalar* scalar) c_garrow_uint32_scalar_get_value; ///

  // UInt64Array
  GType function() c_garrow_uint64_array_get_type; ///
  GArrowUInt64Array* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_uint64_array_new; ///
  ulong function(GArrowUInt64Array* array, long i) c_garrow_uint64_array_get_value; ///
  const(ulong)* function(GArrowUInt64Array* array, long* length) c_garrow_uint64_array_get_values; ///
  ulong function(GArrowUInt64Array* array, GError** _err) c_garrow_uint64_array_sum; ///

  // UInt64ArrayBuilder
  GType function() c_garrow_uint64_array_builder_get_type; ///
  GArrowUInt64ArrayBuilder* function() c_garrow_uint64_array_builder_new; ///
  gboolean function(GArrowUInt64ArrayBuilder* builder, ulong value, GError** _err) c_garrow_uint64_array_builder_append; ///
  gboolean function(GArrowUInt64ArrayBuilder* builder, GError** _err) c_garrow_uint64_array_builder_append_null; ///
  gboolean function(GArrowUInt64ArrayBuilder* builder, long n, GError** _err) c_garrow_uint64_array_builder_append_nulls; ///
  gboolean function(GArrowUInt64ArrayBuilder* builder, ulong value, GError** _err) c_garrow_uint64_array_builder_append_value; ///
  gboolean function(GArrowUInt64ArrayBuilder* builder, const(ulong)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_uint64_array_builder_append_values; ///

  // UInt64DataType
  GType function() c_garrow_uint64_data_type_get_type; ///
  GArrowUInt64DataType* function() c_garrow_uint64_data_type_new; ///

  // UInt64Scalar
  GType function() c_garrow_uint64_scalar_get_type; ///
  GArrowUInt64Scalar* function(ulong value) c_garrow_uint64_scalar_new; ///
  ulong function(GArrowUInt64Scalar* scalar) c_garrow_uint64_scalar_get_value; ///

  // UInt8Array
  GType function() c_garrow_uint8_array_get_type; ///
  GArrowUInt8Array* function(long length, GArrowBuffer* data, GArrowBuffer* nullBitmap, long nNulls) c_garrow_uint8_array_new; ///
  ubyte function(GArrowUInt8Array* array, long i) c_garrow_uint8_array_get_value; ///
  const(ubyte)* function(GArrowUInt8Array* array, long* length) c_garrow_uint8_array_get_values; ///
  ulong function(GArrowUInt8Array* array, GError** _err) c_garrow_uint8_array_sum; ///

  // UInt8ArrayBuilder
  GType function() c_garrow_uint8_array_builder_get_type; ///
  GArrowUInt8ArrayBuilder* function() c_garrow_uint8_array_builder_new; ///
  gboolean function(GArrowUInt8ArrayBuilder* builder, ubyte value, GError** _err) c_garrow_uint8_array_builder_append; ///
  gboolean function(GArrowUInt8ArrayBuilder* builder, GError** _err) c_garrow_uint8_array_builder_append_null; ///
  gboolean function(GArrowUInt8ArrayBuilder* builder, long n, GError** _err) c_garrow_uint8_array_builder_append_nulls; ///
  gboolean function(GArrowUInt8ArrayBuilder* builder, ubyte value, GError** _err) c_garrow_uint8_array_builder_append_value; ///
  gboolean function(GArrowUInt8ArrayBuilder* builder, const(ubyte)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_uint8_array_builder_append_values; ///

  // UInt8DataType
  GType function() c_garrow_uint8_data_type_get_type; ///
  GArrowUInt8DataType* function() c_garrow_uint8_data_type_new; ///

  // UInt8Scalar
  GType function() c_garrow_uint8_scalar_get_type; ///
  GArrowUInt8Scalar* function(ubyte value) c_garrow_uint8_scalar_new; ///
  ubyte function(GArrowUInt8Scalar* scalar) c_garrow_uint8_scalar_get_value; ///

  // UIntArrayBuilder
  GType function() c_garrow_uint_array_builder_get_type; ///
  GArrowUIntArrayBuilder* function() c_garrow_uint_array_builder_new; ///
  gboolean function(GArrowUIntArrayBuilder* builder, ulong value, GError** _err) c_garrow_uint_array_builder_append; ///
  gboolean function(GArrowUIntArrayBuilder* builder, GError** _err) c_garrow_uint_array_builder_append_null; ///
  gboolean function(GArrowUIntArrayBuilder* builder, long n, GError** _err) c_garrow_uint_array_builder_append_nulls; ///
  gboolean function(GArrowUIntArrayBuilder* builder, ulong value, GError** _err) c_garrow_uint_array_builder_append_value; ///
  gboolean function(GArrowUIntArrayBuilder* builder, const(ulong)* values, long valuesLength, const(gboolean)* isValids, long isValidsLength, GError** _err) c_garrow_uint_array_builder_append_values; ///

  // UTF8NormalizeOptions
  GType function() c_garrow_utf8_normalize_options_get_type; ///
  GArrowUTF8NormalizeOptions* function() c_garrow_utf8_normalize_options_new; ///

  // UnionArray
  GType function() c_garrow_union_array_get_type; ///
  int function(GArrowUnionArray* array, long i) c_garrow_union_array_get_child_id; ///
  GArrowArray* function(GArrowUnionArray* array, int i) c_garrow_union_array_get_field; ///
  byte function(GArrowUnionArray* array, long i) c_garrow_union_array_get_type_code; ///

  // UnionArrayBuilder
  GType function() c_garrow_union_array_builder_get_type; ///
  byte function(GArrowUnionArrayBuilder* builder, GArrowArrayBuilder* child, const(char)* fieldName) c_garrow_union_array_builder_append_child; ///
  gboolean function(GArrowUnionArrayBuilder* builder, byte value, GError** _err) c_garrow_union_array_builder_append_value; ///

  // UnionDataType
  GType function() c_garrow_union_data_type_get_type; ///
  GArrowField* function(GArrowUnionDataType* unionDataType, int i) c_garrow_union_data_type_get_field; ///
  GList* function(GArrowUnionDataType* unionDataType) c_garrow_union_data_type_get_fields; ///
  int function(GArrowUnionDataType* unionDataType) c_garrow_union_data_type_get_n_fields; ///
  byte* function(GArrowUnionDataType* unionDataType, size_t* nTypeCodes) c_garrow_union_data_type_get_type_codes; ///

  // UnionScalar
  GType function() c_garrow_union_scalar_get_type; ///
  byte function(GArrowUnionScalar* scalar) c_garrow_union_scalar_get_type_code; ///
  GArrowScalar* function(GArrowUnionScalar* scalar) c_garrow_union_scalar_get_value; ///

  // VarianceOptions
  GType function() c_garrow_variance_options_get_type; ///
  GArrowVarianceOptions* function() c_garrow_variance_options_new; ///

  // Writable
  GType function() c_garrow_writable_get_type; ///
  gboolean function(GArrowWritable* writable, GError** _err) c_garrow_writable_flush; ///
  gboolean function(GArrowWritable* writable, const(ubyte)* data, long nBytes, GError** _err) c_garrow_writable_write; ///

  // WritableFile
  GType function() c_garrow_writable_file_get_type; ///
  gboolean function(GArrowWritableFile* writableFile, long position, const(ubyte)* data, long nBytes, GError** _err) c_garrow_writable_file_write_at; ///

  // WriteOptions
  GType function() c_garrow_write_options_get_type; ///
  GArrowWriteOptions* function() c_garrow_write_options_new; ///

  // global
  gboolean function(GError** _err) c_garrow_s3_finalize; ///
  gboolean function(GArrowS3GlobalOptions* options, GError** _err) c_garrow_s3_initialize; ///
  gboolean function() c_garrow_s3_is_enabled; ///

  // Error
  GQuark function() c_garrow_error_quark; ///
}

// AggregateNodeOptions

/** */
alias garrow_aggregate_node_options_get_type = c_garrow_aggregate_node_options_get_type;

/** */
alias garrow_aggregate_node_options_new = c_garrow_aggregate_node_options_new;

// Aggregation

/** */
alias garrow_aggregation_get_type = c_garrow_aggregation_get_type;

/** */
alias garrow_aggregation_new = c_garrow_aggregation_new;

// Array

/** */
alias garrow_array_get_type = c_garrow_array_get_type;

/** */
alias garrow_array_import = c_garrow_array_import;

/** */
alias garrow_array_cast = c_garrow_array_cast;

/** */
alias garrow_array_concatenate = c_garrow_array_concatenate;

/** */
alias garrow_array_count = c_garrow_array_count;

/** */
alias garrow_array_count_values = c_garrow_array_count_values;

/** */
alias garrow_array_dictionary_encode = c_garrow_array_dictionary_encode;

/** */
alias garrow_array_diff_unified = c_garrow_array_diff_unified;

/** */
alias garrow_array_equal = c_garrow_array_equal;

/** */
alias garrow_array_equal_approx = c_garrow_array_equal_approx;

/** */
alias garrow_array_equal_options = c_garrow_array_equal_options;

/** */
alias garrow_array_equal_range = c_garrow_array_equal_range;

/** */
alias garrow_array_export = c_garrow_array_export;

/** */
alias garrow_array_filter = c_garrow_array_filter;

/** */
alias garrow_array_get_length = c_garrow_array_get_length;

/** */
alias garrow_array_get_n_nulls = c_garrow_array_get_n_nulls;

/** */
alias garrow_array_get_null_bitmap = c_garrow_array_get_null_bitmap;

/** */
alias garrow_array_get_offset = c_garrow_array_get_offset;

/** */
alias garrow_array_get_value_data_type = c_garrow_array_get_value_data_type;

/** */
alias garrow_array_get_value_type = c_garrow_array_get_value_type;

/** */
alias garrow_array_is_in = c_garrow_array_is_in;

/** */
alias garrow_array_is_in_chunked_array = c_garrow_array_is_in_chunked_array;

/** */
alias garrow_array_is_null = c_garrow_array_is_null;

/** */
alias garrow_array_is_valid = c_garrow_array_is_valid;

/** */
alias garrow_array_run_end_encode = c_garrow_array_run_end_encode;

/** */
alias garrow_array_slice = c_garrow_array_slice;

/** */
alias garrow_array_sort_indices = c_garrow_array_sort_indices;

/** */
alias garrow_array_sort_to_indices = c_garrow_array_sort_to_indices;

/** */
alias garrow_array_take = c_garrow_array_take;

/** */
alias garrow_array_take_chunked_array = c_garrow_array_take_chunked_array;

/** */
alias garrow_array_to_string = c_garrow_array_to_string;

/** */
alias garrow_array_unique = c_garrow_array_unique;

/** */
alias garrow_array_view = c_garrow_array_view;

// ArrayBuilder

/** */
alias garrow_array_builder_get_type = c_garrow_array_builder_get_type;

/** */
alias garrow_array_builder_append_empty_value = c_garrow_array_builder_append_empty_value;

/** */
alias garrow_array_builder_append_empty_values = c_garrow_array_builder_append_empty_values;

/** */
alias garrow_array_builder_append_null = c_garrow_array_builder_append_null;

/** */
alias garrow_array_builder_append_nulls = c_garrow_array_builder_append_nulls;

/** */
alias garrow_array_builder_finish = c_garrow_array_builder_finish;

/** */
alias garrow_array_builder_get_capacity = c_garrow_array_builder_get_capacity;

/** */
alias garrow_array_builder_get_child = c_garrow_array_builder_get_child;

/** */
alias garrow_array_builder_get_children = c_garrow_array_builder_get_children;

/** */
alias garrow_array_builder_get_length = c_garrow_array_builder_get_length;

/** */
alias garrow_array_builder_get_n_nulls = c_garrow_array_builder_get_n_nulls;

/** */
alias garrow_array_builder_get_value_data_type = c_garrow_array_builder_get_value_data_type;

/** */
alias garrow_array_builder_get_value_type = c_garrow_array_builder_get_value_type;

/** */
alias garrow_array_builder_reserve = c_garrow_array_builder_reserve;

/** */
alias garrow_array_builder_reset = c_garrow_array_builder_reset;

/** */
alias garrow_array_builder_resize = c_garrow_array_builder_resize;

// ArrayDatum

/** */
alias garrow_array_datum_get_type = c_garrow_array_datum_get_type;

/** */
alias garrow_array_datum_new = c_garrow_array_datum_new;

// ArraySortOptions

/** */
alias garrow_array_sort_options_get_type = c_garrow_array_sort_options_get_type;

/** */
alias garrow_array_sort_options_new = c_garrow_array_sort_options_new;

/** */
alias garrow_array_sort_options_equal = c_garrow_array_sort_options_equal;

// AzureFileSystem

/** */
alias garrow_azure_file_system_get_type = c_garrow_azure_file_system_get_type;

// BaseBinaryScalar

/** */
alias garrow_base_binary_scalar_get_type = c_garrow_base_binary_scalar_get_type;

/** */
alias garrow_base_binary_scalar_get_value = c_garrow_base_binary_scalar_get_value;

// BaseListScalar

/** */
alias garrow_base_list_scalar_get_type = c_garrow_base_list_scalar_get_type;

/** */
alias garrow_base_list_scalar_get_value = c_garrow_base_list_scalar_get_value;

// BinaryArray

/** */
alias garrow_binary_array_get_type = c_garrow_binary_array_get_type;

/** */
alias garrow_binary_array_new = c_garrow_binary_array_new;

/** */
alias garrow_binary_array_get_buffer = c_garrow_binary_array_get_buffer;

/** */
alias garrow_binary_array_get_data_buffer = c_garrow_binary_array_get_data_buffer;

/** */
alias garrow_binary_array_get_offsets_buffer = c_garrow_binary_array_get_offsets_buffer;

/** */
alias garrow_binary_array_get_value = c_garrow_binary_array_get_value;

// BinaryArrayBuilder

/** */
alias garrow_binary_array_builder_get_type = c_garrow_binary_array_builder_get_type;

/** */
alias garrow_binary_array_builder_new = c_garrow_binary_array_builder_new;

/** */
alias garrow_binary_array_builder_append = c_garrow_binary_array_builder_append;

/** */
alias garrow_binary_array_builder_append_null = c_garrow_binary_array_builder_append_null;

/** */
alias garrow_binary_array_builder_append_nulls = c_garrow_binary_array_builder_append_nulls;

/** */
alias garrow_binary_array_builder_append_value = c_garrow_binary_array_builder_append_value;

/** */
alias garrow_binary_array_builder_append_value_bytes = c_garrow_binary_array_builder_append_value_bytes;

/** */
alias garrow_binary_array_builder_append_values = c_garrow_binary_array_builder_append_values;

// BinaryDataType

/** */
alias garrow_binary_data_type_get_type = c_garrow_binary_data_type_get_type;

/** */
alias garrow_binary_data_type_new = c_garrow_binary_data_type_new;

// BinaryDictionaryArrayBuilder

/** */
alias garrow_binary_dictionary_array_builder_get_type = c_garrow_binary_dictionary_array_builder_get_type;

/** */
alias garrow_binary_dictionary_array_builder_new = c_garrow_binary_dictionary_array_builder_new;

/** */
alias garrow_binary_dictionary_array_builder_append_array = c_garrow_binary_dictionary_array_builder_append_array;

/** */
alias garrow_binary_dictionary_array_builder_append_indices = c_garrow_binary_dictionary_array_builder_append_indices;

/** */
alias garrow_binary_dictionary_array_builder_append_null = c_garrow_binary_dictionary_array_builder_append_null;

/** */
alias garrow_binary_dictionary_array_builder_append_value = c_garrow_binary_dictionary_array_builder_append_value;

/** */
alias garrow_binary_dictionary_array_builder_append_value_bytes = c_garrow_binary_dictionary_array_builder_append_value_bytes;

/** */
alias garrow_binary_dictionary_array_builder_finish_delta = c_garrow_binary_dictionary_array_builder_finish_delta;

/** */
alias garrow_binary_dictionary_array_builder_get_dictionary_length = c_garrow_binary_dictionary_array_builder_get_dictionary_length;

/** */
alias garrow_binary_dictionary_array_builder_insert_memo_values = c_garrow_binary_dictionary_array_builder_insert_memo_values;

/** */
alias garrow_binary_dictionary_array_builder_reset_full = c_garrow_binary_dictionary_array_builder_reset_full;

// BinaryScalar

/** */
alias garrow_binary_scalar_get_type = c_garrow_binary_scalar_get_type;

/** */
alias garrow_binary_scalar_new = c_garrow_binary_scalar_new;

// BinaryViewDataType

/** */
alias garrow_binary_view_data_type_get_type = c_garrow_binary_view_data_type_get_type;

/** */
alias garrow_binary_view_data_type_new = c_garrow_binary_view_data_type_new;

// BooleanArray

/** */
alias garrow_boolean_array_get_type = c_garrow_boolean_array_get_type;

/** */
alias garrow_boolean_array_new = c_garrow_boolean_array_new;

/** */
alias garrow_boolean_array_and = c_garrow_boolean_array_and;

/** */
alias garrow_boolean_array_get_value = c_garrow_boolean_array_get_value;

/** */
alias garrow_boolean_array_get_values = c_garrow_boolean_array_get_values;

/** */
alias garrow_boolean_array_invert = c_garrow_boolean_array_invert;

/** */
alias garrow_boolean_array_or = c_garrow_boolean_array_or;

/** */
alias garrow_boolean_array_xor = c_garrow_boolean_array_xor;

// BooleanArrayBuilder

/** */
alias garrow_boolean_array_builder_get_type = c_garrow_boolean_array_builder_get_type;

/** */
alias garrow_boolean_array_builder_new = c_garrow_boolean_array_builder_new;

/** */
alias garrow_boolean_array_builder_append = c_garrow_boolean_array_builder_append;

/** */
alias garrow_boolean_array_builder_append_null = c_garrow_boolean_array_builder_append_null;

/** */
alias garrow_boolean_array_builder_append_nulls = c_garrow_boolean_array_builder_append_nulls;

/** */
alias garrow_boolean_array_builder_append_value = c_garrow_boolean_array_builder_append_value;

/** */
alias garrow_boolean_array_builder_append_values = c_garrow_boolean_array_builder_append_values;

// BooleanDataType

/** */
alias garrow_boolean_data_type_get_type = c_garrow_boolean_data_type_get_type;

/** */
alias garrow_boolean_data_type_new = c_garrow_boolean_data_type_new;

// BooleanScalar

/** */
alias garrow_boolean_scalar_get_type = c_garrow_boolean_scalar_get_type;

/** */
alias garrow_boolean_scalar_new = c_garrow_boolean_scalar_new;

/** */
alias garrow_boolean_scalar_get_value = c_garrow_boolean_scalar_get_value;

// Buffer

/** */
alias garrow_buffer_get_type = c_garrow_buffer_get_type;

/** */
alias garrow_buffer_new = c_garrow_buffer_new;

/** */
alias garrow_buffer_new_bytes = c_garrow_buffer_new_bytes;

/** */
alias garrow_buffer_copy = c_garrow_buffer_copy;

/** */
alias garrow_buffer_equal = c_garrow_buffer_equal;

/** */
alias garrow_buffer_equal_n_bytes = c_garrow_buffer_equal_n_bytes;

/** */
alias garrow_buffer_get_capacity = c_garrow_buffer_get_capacity;

/** */
alias garrow_buffer_get_data = c_garrow_buffer_get_data;

/** */
alias garrow_buffer_get_mutable_data = c_garrow_buffer_get_mutable_data;

/** */
alias garrow_buffer_get_parent = c_garrow_buffer_get_parent;

/** */
alias garrow_buffer_get_size = c_garrow_buffer_get_size;

/** */
alias garrow_buffer_is_mutable = c_garrow_buffer_is_mutable;

/** */
alias garrow_buffer_slice = c_garrow_buffer_slice;

// BufferInputStream

/** */
alias garrow_buffer_input_stream_get_type = c_garrow_buffer_input_stream_get_type;

/** */
alias garrow_buffer_input_stream_new = c_garrow_buffer_input_stream_new;

/** */
alias garrow_buffer_input_stream_get_buffer = c_garrow_buffer_input_stream_get_buffer;

// BufferOutputStream

/** */
alias garrow_buffer_output_stream_get_type = c_garrow_buffer_output_stream_get_type;

/** */
alias garrow_buffer_output_stream_new = c_garrow_buffer_output_stream_new;

// CSVReadOptions

/** */
alias garrow_csv_read_options_get_type = c_garrow_csv_read_options_get_type;

/** */
alias garrow_csv_read_options_new = c_garrow_csv_read_options_new;

/** */
alias garrow_csv_read_options_add_column_name = c_garrow_csv_read_options_add_column_name;

/** */
alias garrow_csv_read_options_add_column_type = c_garrow_csv_read_options_add_column_type;

/** */
alias garrow_csv_read_options_add_false_value = c_garrow_csv_read_options_add_false_value;

/** */
alias garrow_csv_read_options_add_null_value = c_garrow_csv_read_options_add_null_value;

/** */
alias garrow_csv_read_options_add_schema = c_garrow_csv_read_options_add_schema;

/** */
alias garrow_csv_read_options_add_timestamp_parser = c_garrow_csv_read_options_add_timestamp_parser;

/** */
alias garrow_csv_read_options_add_true_value = c_garrow_csv_read_options_add_true_value;

/** */
alias garrow_csv_read_options_get_column_names = c_garrow_csv_read_options_get_column_names;

/** */
alias garrow_csv_read_options_get_column_types = c_garrow_csv_read_options_get_column_types;

/** */
alias garrow_csv_read_options_get_false_values = c_garrow_csv_read_options_get_false_values;

/** */
alias garrow_csv_read_options_get_null_values = c_garrow_csv_read_options_get_null_values;

/** */
alias garrow_csv_read_options_get_timestamp_parsers = c_garrow_csv_read_options_get_timestamp_parsers;

/** */
alias garrow_csv_read_options_get_true_values = c_garrow_csv_read_options_get_true_values;

/** */
alias garrow_csv_read_options_set_column_names = c_garrow_csv_read_options_set_column_names;

/** */
alias garrow_csv_read_options_set_false_values = c_garrow_csv_read_options_set_false_values;

/** */
alias garrow_csv_read_options_set_null_values = c_garrow_csv_read_options_set_null_values;

/** */
alias garrow_csv_read_options_set_timestamp_parsers = c_garrow_csv_read_options_set_timestamp_parsers;

/** */
alias garrow_csv_read_options_set_true_values = c_garrow_csv_read_options_set_true_values;

// CSVReader

/** */
alias garrow_csv_reader_get_type = c_garrow_csv_reader_get_type;

/** */
alias garrow_csv_reader_new = c_garrow_csv_reader_new;

/** */
alias garrow_csv_reader_read = c_garrow_csv_reader_read;

// CallExpression

/** */
alias garrow_call_expression_get_type = c_garrow_call_expression_get_type;

/** */
alias garrow_call_expression_new = c_garrow_call_expression_new;

// CastOptions

/** */
alias garrow_cast_options_get_type = c_garrow_cast_options_get_type;

/** */
alias garrow_cast_options_new = c_garrow_cast_options_new;

// ChunkedArray

/** */
alias garrow_chunked_array_get_type = c_garrow_chunked_array_get_type;

/** */
alias garrow_chunked_array_new = c_garrow_chunked_array_new;

/** */
alias garrow_chunked_array_new_empty = c_garrow_chunked_array_new_empty;

/** */
alias garrow_chunked_array_combine = c_garrow_chunked_array_combine;

/** */
alias garrow_chunked_array_equal = c_garrow_chunked_array_equal;

/** */
alias garrow_chunked_array_filter = c_garrow_chunked_array_filter;

/** */
alias garrow_chunked_array_filter_chunked_array = c_garrow_chunked_array_filter_chunked_array;

/** */
alias garrow_chunked_array_get_chunk = c_garrow_chunked_array_get_chunk;

/** */
alias garrow_chunked_array_get_chunks = c_garrow_chunked_array_get_chunks;

/** */
alias garrow_chunked_array_get_length = c_garrow_chunked_array_get_length;

/** */
alias garrow_chunked_array_get_n_chunks = c_garrow_chunked_array_get_n_chunks;

/** */
alias garrow_chunked_array_get_n_nulls = c_garrow_chunked_array_get_n_nulls;

/** */
alias garrow_chunked_array_get_n_rows = c_garrow_chunked_array_get_n_rows;

/** */
alias garrow_chunked_array_get_value_data_type = c_garrow_chunked_array_get_value_data_type;

/** */
alias garrow_chunked_array_get_value_type = c_garrow_chunked_array_get_value_type;

/** */
alias garrow_chunked_array_slice = c_garrow_chunked_array_slice;

/** */
alias garrow_chunked_array_sort_indices = c_garrow_chunked_array_sort_indices;

/** */
alias garrow_chunked_array_take = c_garrow_chunked_array_take;

/** */
alias garrow_chunked_array_take_chunked_array = c_garrow_chunked_array_take_chunked_array;

/** */
alias garrow_chunked_array_to_string = c_garrow_chunked_array_to_string;

// ChunkedArrayDatum

/** */
alias garrow_chunked_array_datum_get_type = c_garrow_chunked_array_datum_get_type;

/** */
alias garrow_chunked_array_datum_new = c_garrow_chunked_array_datum_new;

// Codec

/** */
alias garrow_codec_get_type = c_garrow_codec_get_type;

/** */
alias garrow_codec_new = c_garrow_codec_new;

/** */
alias garrow_codec_get_compression_level = c_garrow_codec_get_compression_level;

/** */
alias garrow_codec_get_compression_type = c_garrow_codec_get_compression_type;

/** */
alias garrow_codec_get_name = c_garrow_codec_get_name;

// CompressedInputStream

/** */
alias garrow_compressed_input_stream_get_type = c_garrow_compressed_input_stream_get_type;

/** */
alias garrow_compressed_input_stream_new = c_garrow_compressed_input_stream_new;

// CompressedOutputStream

/** */
alias garrow_compressed_output_stream_get_type = c_garrow_compressed_output_stream_get_type;

/** */
alias garrow_compressed_output_stream_new = c_garrow_compressed_output_stream_new;

// CountOptions

/** */
alias garrow_count_options_get_type = c_garrow_count_options_get_type;

/** */
alias garrow_count_options_new = c_garrow_count_options_new;

// DataType

/** */
alias garrow_data_type_get_type = c_garrow_data_type_get_type;

/** */
alias garrow_data_type_import = c_garrow_data_type_import;

/** */
alias garrow_data_type_equal = c_garrow_data_type_equal;

/** */
alias garrow_data_type_export = c_garrow_data_type_export;

/** */
alias garrow_data_type_get_id = c_garrow_data_type_get_id;

/** */
alias garrow_data_type_get_name = c_garrow_data_type_get_name;

/** */
alias garrow_data_type_to_string = c_garrow_data_type_to_string;

// Date32Array

/** */
alias garrow_date32_array_get_type = c_garrow_date32_array_get_type;

/** */
alias garrow_date32_array_new = c_garrow_date32_array_new;

/** */
alias garrow_date32_array_get_value = c_garrow_date32_array_get_value;

/** */
alias garrow_date32_array_get_values = c_garrow_date32_array_get_values;

// Date32ArrayBuilder

/** */
alias garrow_date32_array_builder_get_type = c_garrow_date32_array_builder_get_type;

/** */
alias garrow_date32_array_builder_new = c_garrow_date32_array_builder_new;

/** */
alias garrow_date32_array_builder_append = c_garrow_date32_array_builder_append;

/** */
alias garrow_date32_array_builder_append_null = c_garrow_date32_array_builder_append_null;

/** */
alias garrow_date32_array_builder_append_nulls = c_garrow_date32_array_builder_append_nulls;

/** */
alias garrow_date32_array_builder_append_value = c_garrow_date32_array_builder_append_value;

/** */
alias garrow_date32_array_builder_append_values = c_garrow_date32_array_builder_append_values;

// Date32DataType

/** */
alias garrow_date32_data_type_get_type = c_garrow_date32_data_type_get_type;

/** */
alias garrow_date32_data_type_new = c_garrow_date32_data_type_new;

// Date32Scalar

/** */
alias garrow_date32_scalar_get_type = c_garrow_date32_scalar_get_type;

/** */
alias garrow_date32_scalar_new = c_garrow_date32_scalar_new;

/** */
alias garrow_date32_scalar_get_value = c_garrow_date32_scalar_get_value;

// Date64Array

/** */
alias garrow_date64_array_get_type = c_garrow_date64_array_get_type;

/** */
alias garrow_date64_array_new = c_garrow_date64_array_new;

/** */
alias garrow_date64_array_get_value = c_garrow_date64_array_get_value;

/** */
alias garrow_date64_array_get_values = c_garrow_date64_array_get_values;

// Date64ArrayBuilder

/** */
alias garrow_date64_array_builder_get_type = c_garrow_date64_array_builder_get_type;

/** */
alias garrow_date64_array_builder_new = c_garrow_date64_array_builder_new;

/** */
alias garrow_date64_array_builder_append = c_garrow_date64_array_builder_append;

/** */
alias garrow_date64_array_builder_append_null = c_garrow_date64_array_builder_append_null;

/** */
alias garrow_date64_array_builder_append_nulls = c_garrow_date64_array_builder_append_nulls;

/** */
alias garrow_date64_array_builder_append_value = c_garrow_date64_array_builder_append_value;

/** */
alias garrow_date64_array_builder_append_values = c_garrow_date64_array_builder_append_values;

// Date64DataType

/** */
alias garrow_date64_data_type_get_type = c_garrow_date64_data_type_get_type;

/** */
alias garrow_date64_data_type_new = c_garrow_date64_data_type_new;

// Date64Scalar

/** */
alias garrow_date64_scalar_get_type = c_garrow_date64_scalar_get_type;

/** */
alias garrow_date64_scalar_new = c_garrow_date64_scalar_new;

/** */
alias garrow_date64_scalar_get_value = c_garrow_date64_scalar_get_value;

// Datum

/** */
alias garrow_datum_get_type = c_garrow_datum_get_type;

/** */
alias garrow_datum_equal = c_garrow_datum_equal;

/** */
alias garrow_datum_is_array = c_garrow_datum_is_array;

/** */
alias garrow_datum_is_array_like = c_garrow_datum_is_array_like;

/** */
alias garrow_datum_is_scalar = c_garrow_datum_is_scalar;

/** */
alias garrow_datum_is_value = c_garrow_datum_is_value;

/** */
alias garrow_datum_to_string = c_garrow_datum_to_string;

// DayMillisecond

/** */
alias garrow_day_millisecond_get_type = c_garrow_day_millisecond_get_type;

/** */
alias garrow_day_millisecond_new = c_garrow_day_millisecond_new;

/** */
alias garrow_day_millisecond_equal = c_garrow_day_millisecond_equal;

/** */
alias garrow_day_millisecond_less_than = c_garrow_day_millisecond_less_than;

// DayTimeIntervalArray

/** */
alias garrow_day_time_interval_array_get_type = c_garrow_day_time_interval_array_get_type;

/** */
alias garrow_day_time_interval_array_new = c_garrow_day_time_interval_array_new;

/** */
alias garrow_day_time_interval_array_get_value = c_garrow_day_time_interval_array_get_value;

/** */
alias garrow_day_time_interval_array_get_values = c_garrow_day_time_interval_array_get_values;

// DayTimeIntervalArrayBuilder

/** */
alias garrow_day_time_interval_array_builder_get_type = c_garrow_day_time_interval_array_builder_get_type;

/** */
alias garrow_day_time_interval_array_builder_new = c_garrow_day_time_interval_array_builder_new;

/** */
alias garrow_day_time_interval_array_builder_append_value = c_garrow_day_time_interval_array_builder_append_value;

/** */
alias garrow_day_time_interval_array_builder_append_values = c_garrow_day_time_interval_array_builder_append_values;

// DayTimeIntervalDataType

/** */
alias garrow_day_time_interval_data_type_get_type = c_garrow_day_time_interval_data_type_get_type;

/** */
alias garrow_day_time_interval_data_type_new = c_garrow_day_time_interval_data_type_new;

// DayTimeIntervalScalar

/** */
alias garrow_day_time_interval_scalar_get_type = c_garrow_day_time_interval_scalar_get_type;

/** */
alias garrow_day_time_interval_scalar_new = c_garrow_day_time_interval_scalar_new;

/** */
alias garrow_day_time_interval_scalar_get_value = c_garrow_day_time_interval_scalar_get_value;

// Decimal128

/** */
alias garrow_decimal128_get_type = c_garrow_decimal128_get_type;

/** */
alias garrow_decimal128_new_integer = c_garrow_decimal128_new_integer;

/** */
alias garrow_decimal128_new_string = c_garrow_decimal128_new_string;

/** */
alias garrow_decimal128_abs = c_garrow_decimal128_abs;

/** */
alias garrow_decimal128_copy = c_garrow_decimal128_copy;

/** */
alias garrow_decimal128_divide = c_garrow_decimal128_divide;

/** */
alias garrow_decimal128_equal = c_garrow_decimal128_equal;

/** */
alias garrow_decimal128_greater_than = c_garrow_decimal128_greater_than;

/** */
alias garrow_decimal128_greater_than_or_equal = c_garrow_decimal128_greater_than_or_equal;

/** */
alias garrow_decimal128_less_than = c_garrow_decimal128_less_than;

/** */
alias garrow_decimal128_less_than_or_equal = c_garrow_decimal128_less_than_or_equal;

/** */
alias garrow_decimal128_minus = c_garrow_decimal128_minus;

/** */
alias garrow_decimal128_multiply = c_garrow_decimal128_multiply;

/** */
alias garrow_decimal128_negate = c_garrow_decimal128_negate;

/** */
alias garrow_decimal128_not_equal = c_garrow_decimal128_not_equal;

/** */
alias garrow_decimal128_plus = c_garrow_decimal128_plus;

/** */
alias garrow_decimal128_rescale = c_garrow_decimal128_rescale;

/** */
alias garrow_decimal128_to_bytes = c_garrow_decimal128_to_bytes;

/** */
alias garrow_decimal128_to_integer = c_garrow_decimal128_to_integer;

/** */
alias garrow_decimal128_to_string = c_garrow_decimal128_to_string;

/** */
alias garrow_decimal128_to_string_scale = c_garrow_decimal128_to_string_scale;

// Decimal128Array

/** */
alias garrow_decimal128_array_get_type = c_garrow_decimal128_array_get_type;

/** */
alias garrow_decimal128_array_format_value = c_garrow_decimal128_array_format_value;

/** */
alias garrow_decimal128_array_get_value = c_garrow_decimal128_array_get_value;

// Decimal128ArrayBuilder

/** */
alias garrow_decimal128_array_builder_get_type = c_garrow_decimal128_array_builder_get_type;

/** */
alias garrow_decimal128_array_builder_new = c_garrow_decimal128_array_builder_new;

/** */
alias garrow_decimal128_array_builder_append = c_garrow_decimal128_array_builder_append;

/** */
alias garrow_decimal128_array_builder_append_null = c_garrow_decimal128_array_builder_append_null;

/** */
alias garrow_decimal128_array_builder_append_value = c_garrow_decimal128_array_builder_append_value;

/** */
alias garrow_decimal128_array_builder_append_values = c_garrow_decimal128_array_builder_append_values;

// Decimal128DataType

/** */
alias garrow_decimal128_data_type_get_type = c_garrow_decimal128_data_type_get_type;

/** */
alias garrow_decimal128_data_type_new = c_garrow_decimal128_data_type_new;

/** */
alias garrow_decimal128_data_type_max_precision = c_garrow_decimal128_data_type_max_precision;

// Decimal128Scalar

/** */
alias garrow_decimal128_scalar_get_type = c_garrow_decimal128_scalar_get_type;

/** */
alias garrow_decimal128_scalar_new = c_garrow_decimal128_scalar_new;

/** */
alias garrow_decimal128_scalar_get_value = c_garrow_decimal128_scalar_get_value;

// Decimal256

/** */
alias garrow_decimal256_get_type = c_garrow_decimal256_get_type;

/** */
alias garrow_decimal256_new_integer = c_garrow_decimal256_new_integer;

/** */
alias garrow_decimal256_new_string = c_garrow_decimal256_new_string;

/** */
alias garrow_decimal256_abs = c_garrow_decimal256_abs;

/** */
alias garrow_decimal256_copy = c_garrow_decimal256_copy;

/** */
alias garrow_decimal256_divide = c_garrow_decimal256_divide;

/** */
alias garrow_decimal256_equal = c_garrow_decimal256_equal;

/** */
alias garrow_decimal256_greater_than = c_garrow_decimal256_greater_than;

/** */
alias garrow_decimal256_greater_than_or_equal = c_garrow_decimal256_greater_than_or_equal;

/** */
alias garrow_decimal256_less_than = c_garrow_decimal256_less_than;

/** */
alias garrow_decimal256_less_than_or_equal = c_garrow_decimal256_less_than_or_equal;

/** */
alias garrow_decimal256_multiply = c_garrow_decimal256_multiply;

/** */
alias garrow_decimal256_negate = c_garrow_decimal256_negate;

/** */
alias garrow_decimal256_not_equal = c_garrow_decimal256_not_equal;

/** */
alias garrow_decimal256_plus = c_garrow_decimal256_plus;

/** */
alias garrow_decimal256_rescale = c_garrow_decimal256_rescale;

/** */
alias garrow_decimal256_to_bytes = c_garrow_decimal256_to_bytes;

/** */
alias garrow_decimal256_to_string = c_garrow_decimal256_to_string;

/** */
alias garrow_decimal256_to_string_scale = c_garrow_decimal256_to_string_scale;

// Decimal256Array

/** */
alias garrow_decimal256_array_get_type = c_garrow_decimal256_array_get_type;

/** */
alias garrow_decimal256_array_format_value = c_garrow_decimal256_array_format_value;

/** */
alias garrow_decimal256_array_get_value = c_garrow_decimal256_array_get_value;

// Decimal256ArrayBuilder

/** */
alias garrow_decimal256_array_builder_get_type = c_garrow_decimal256_array_builder_get_type;

/** */
alias garrow_decimal256_array_builder_new = c_garrow_decimal256_array_builder_new;

/** */
alias garrow_decimal256_array_builder_append_value = c_garrow_decimal256_array_builder_append_value;

/** */
alias garrow_decimal256_array_builder_append_values = c_garrow_decimal256_array_builder_append_values;

// Decimal256DataType

/** */
alias garrow_decimal256_data_type_get_type = c_garrow_decimal256_data_type_get_type;

/** */
alias garrow_decimal256_data_type_new = c_garrow_decimal256_data_type_new;

/** */
alias garrow_decimal256_data_type_max_precision = c_garrow_decimal256_data_type_max_precision;

// Decimal256Scalar

/** */
alias garrow_decimal256_scalar_get_type = c_garrow_decimal256_scalar_get_type;

/** */
alias garrow_decimal256_scalar_new = c_garrow_decimal256_scalar_new;

/** */
alias garrow_decimal256_scalar_get_value = c_garrow_decimal256_scalar_get_value;

// Decimal32

/** */
alias garrow_decimal32_get_type = c_garrow_decimal32_get_type;

/** */
alias garrow_decimal32_new_integer = c_garrow_decimal32_new_integer;

/** */
alias garrow_decimal32_new_string = c_garrow_decimal32_new_string;

/** */
alias garrow_decimal32_abs = c_garrow_decimal32_abs;

/** */
alias garrow_decimal32_copy = c_garrow_decimal32_copy;

/** */
alias garrow_decimal32_divide = c_garrow_decimal32_divide;

/** */
alias garrow_decimal32_equal = c_garrow_decimal32_equal;

/** */
alias garrow_decimal32_greater_than = c_garrow_decimal32_greater_than;

/** */
alias garrow_decimal32_greater_than_or_equal = c_garrow_decimal32_greater_than_or_equal;

/** */
alias garrow_decimal32_less_than = c_garrow_decimal32_less_than;

/** */
alias garrow_decimal32_less_than_or_equal = c_garrow_decimal32_less_than_or_equal;

/** */
alias garrow_decimal32_minus = c_garrow_decimal32_minus;

/** */
alias garrow_decimal32_multiply = c_garrow_decimal32_multiply;

/** */
alias garrow_decimal32_negate = c_garrow_decimal32_negate;

/** */
alias garrow_decimal32_not_equal = c_garrow_decimal32_not_equal;

/** */
alias garrow_decimal32_plus = c_garrow_decimal32_plus;

/** */
alias garrow_decimal32_rescale = c_garrow_decimal32_rescale;

/** */
alias garrow_decimal32_to_bytes = c_garrow_decimal32_to_bytes;

/** */
alias garrow_decimal32_to_integer = c_garrow_decimal32_to_integer;

/** */
alias garrow_decimal32_to_string = c_garrow_decimal32_to_string;

/** */
alias garrow_decimal32_to_string_scale = c_garrow_decimal32_to_string_scale;

// Decimal32Array

/** */
alias garrow_decimal32_array_get_type = c_garrow_decimal32_array_get_type;

/** */
alias garrow_decimal32_array_format_value = c_garrow_decimal32_array_format_value;

/** */
alias garrow_decimal32_array_get_value = c_garrow_decimal32_array_get_value;

// Decimal32ArrayBuilder

/** */
alias garrow_decimal32_array_builder_get_type = c_garrow_decimal32_array_builder_get_type;

/** */
alias garrow_decimal32_array_builder_new = c_garrow_decimal32_array_builder_new;

/** */
alias garrow_decimal32_array_builder_append_value = c_garrow_decimal32_array_builder_append_value;

/** */
alias garrow_decimal32_array_builder_append_values = c_garrow_decimal32_array_builder_append_values;

// Decimal32DataType

/** */
alias garrow_decimal32_data_type_get_type = c_garrow_decimal32_data_type_get_type;

/** */
alias garrow_decimal32_data_type_new = c_garrow_decimal32_data_type_new;

/** */
alias garrow_decimal32_data_type_max_precision = c_garrow_decimal32_data_type_max_precision;

// Decimal32Scalar

/** */
alias garrow_decimal32_scalar_get_type = c_garrow_decimal32_scalar_get_type;

/** */
alias garrow_decimal32_scalar_new = c_garrow_decimal32_scalar_new;

/** */
alias garrow_decimal32_scalar_get_value = c_garrow_decimal32_scalar_get_value;

// Decimal64

/** */
alias garrow_decimal64_get_type = c_garrow_decimal64_get_type;

/** */
alias garrow_decimal64_new_integer = c_garrow_decimal64_new_integer;

/** */
alias garrow_decimal64_new_string = c_garrow_decimal64_new_string;

/** */
alias garrow_decimal64_abs = c_garrow_decimal64_abs;

/** */
alias garrow_decimal64_copy = c_garrow_decimal64_copy;

/** */
alias garrow_decimal64_divide = c_garrow_decimal64_divide;

/** */
alias garrow_decimal64_equal = c_garrow_decimal64_equal;

/** */
alias garrow_decimal64_greater_than = c_garrow_decimal64_greater_than;

/** */
alias garrow_decimal64_greater_than_or_equal = c_garrow_decimal64_greater_than_or_equal;

/** */
alias garrow_decimal64_less_than = c_garrow_decimal64_less_than;

/** */
alias garrow_decimal64_less_than_or_equal = c_garrow_decimal64_less_than_or_equal;

/** */
alias garrow_decimal64_minus = c_garrow_decimal64_minus;

/** */
alias garrow_decimal64_multiply = c_garrow_decimal64_multiply;

/** */
alias garrow_decimal64_negate = c_garrow_decimal64_negate;

/** */
alias garrow_decimal64_not_equal = c_garrow_decimal64_not_equal;

/** */
alias garrow_decimal64_plus = c_garrow_decimal64_plus;

/** */
alias garrow_decimal64_rescale = c_garrow_decimal64_rescale;

/** */
alias garrow_decimal64_to_bytes = c_garrow_decimal64_to_bytes;

/** */
alias garrow_decimal64_to_integer = c_garrow_decimal64_to_integer;

/** */
alias garrow_decimal64_to_string = c_garrow_decimal64_to_string;

/** */
alias garrow_decimal64_to_string_scale = c_garrow_decimal64_to_string_scale;

// Decimal64Array

/** */
alias garrow_decimal64_array_get_type = c_garrow_decimal64_array_get_type;

/** */
alias garrow_decimal64_array_format_value = c_garrow_decimal64_array_format_value;

/** */
alias garrow_decimal64_array_get_value = c_garrow_decimal64_array_get_value;

// Decimal64ArrayBuilder

/** */
alias garrow_decimal64_array_builder_get_type = c_garrow_decimal64_array_builder_get_type;

/** */
alias garrow_decimal64_array_builder_new = c_garrow_decimal64_array_builder_new;

/** */
alias garrow_decimal64_array_builder_append_value = c_garrow_decimal64_array_builder_append_value;

/** */
alias garrow_decimal64_array_builder_append_values = c_garrow_decimal64_array_builder_append_values;

// Decimal64DataType

/** */
alias garrow_decimal64_data_type_get_type = c_garrow_decimal64_data_type_get_type;

/** */
alias garrow_decimal64_data_type_new = c_garrow_decimal64_data_type_new;

/** */
alias garrow_decimal64_data_type_max_precision = c_garrow_decimal64_data_type_max_precision;

// Decimal64Scalar

/** */
alias garrow_decimal64_scalar_get_type = c_garrow_decimal64_scalar_get_type;

/** */
alias garrow_decimal64_scalar_new = c_garrow_decimal64_scalar_new;

/** */
alias garrow_decimal64_scalar_get_value = c_garrow_decimal64_scalar_get_value;

// DecimalDataType

/** */
alias garrow_decimal_data_type_get_type = c_garrow_decimal_data_type_get_type;

/** */
alias garrow_decimal_data_type_new = c_garrow_decimal_data_type_new;

/** */
alias garrow_decimal_data_type_get_precision = c_garrow_decimal_data_type_get_precision;

/** */
alias garrow_decimal_data_type_get_scale = c_garrow_decimal_data_type_get_scale;

// DenseUnionArray

/** */
alias garrow_dense_union_array_get_type = c_garrow_dense_union_array_get_type;

/** */
alias garrow_dense_union_array_new = c_garrow_dense_union_array_new;

/** */
alias garrow_dense_union_array_new_data_type = c_garrow_dense_union_array_new_data_type;

/** */
alias garrow_dense_union_array_get_value_offset = c_garrow_dense_union_array_get_value_offset;

// DenseUnionArrayBuilder

/** */
alias garrow_dense_union_array_builder_get_type = c_garrow_dense_union_array_builder_get_type;

/** */
alias garrow_dense_union_array_builder_new = c_garrow_dense_union_array_builder_new;

// DenseUnionDataType

/** */
alias garrow_dense_union_data_type_get_type = c_garrow_dense_union_data_type_get_type;

/** */
alias garrow_dense_union_data_type_new = c_garrow_dense_union_data_type_new;

// DenseUnionScalar

/** */
alias garrow_dense_union_scalar_get_type = c_garrow_dense_union_scalar_get_type;

/** */
alias garrow_dense_union_scalar_new = c_garrow_dense_union_scalar_new;

// DictionaryArray

/** */
alias garrow_dictionary_array_get_type = c_garrow_dictionary_array_get_type;

/** */
alias garrow_dictionary_array_new = c_garrow_dictionary_array_new;

/** */
alias garrow_dictionary_array_get_dictionary = c_garrow_dictionary_array_get_dictionary;

/** */
alias garrow_dictionary_array_get_dictionary_data_type = c_garrow_dictionary_array_get_dictionary_data_type;

/** */
alias garrow_dictionary_array_get_indices = c_garrow_dictionary_array_get_indices;

// DictionaryDataType

/** */
alias garrow_dictionary_data_type_get_type = c_garrow_dictionary_data_type_get_type;

/** */
alias garrow_dictionary_data_type_new = c_garrow_dictionary_data_type_new;

/** */
alias garrow_dictionary_data_type_get_index_data_type = c_garrow_dictionary_data_type_get_index_data_type;

/** */
alias garrow_dictionary_data_type_get_value_data_type = c_garrow_dictionary_data_type_get_value_data_type;

/** */
alias garrow_dictionary_data_type_is_ordered = c_garrow_dictionary_data_type_is_ordered;

// DoubleArray

/** */
alias garrow_double_array_get_type = c_garrow_double_array_get_type;

/** */
alias garrow_double_array_new = c_garrow_double_array_new;

/** */
alias garrow_double_array_get_value = c_garrow_double_array_get_value;

/** */
alias garrow_double_array_get_values = c_garrow_double_array_get_values;

/** */
alias garrow_double_array_sum = c_garrow_double_array_sum;

// DoubleArrayBuilder

/** */
alias garrow_double_array_builder_get_type = c_garrow_double_array_builder_get_type;

/** */
alias garrow_double_array_builder_new = c_garrow_double_array_builder_new;

/** */
alias garrow_double_array_builder_append = c_garrow_double_array_builder_append;

/** */
alias garrow_double_array_builder_append_null = c_garrow_double_array_builder_append_null;

/** */
alias garrow_double_array_builder_append_nulls = c_garrow_double_array_builder_append_nulls;

/** */
alias garrow_double_array_builder_append_value = c_garrow_double_array_builder_append_value;

/** */
alias garrow_double_array_builder_append_values = c_garrow_double_array_builder_append_values;

// DoubleDataType

/** */
alias garrow_double_data_type_get_type = c_garrow_double_data_type_get_type;

/** */
alias garrow_double_data_type_new = c_garrow_double_data_type_new;

// DoubleScalar

/** */
alias garrow_double_scalar_get_type = c_garrow_double_scalar_get_type;

/** */
alias garrow_double_scalar_new = c_garrow_double_scalar_new;

/** */
alias garrow_double_scalar_get_value = c_garrow_double_scalar_get_value;

// EqualOptions

/** */
alias garrow_equal_options_get_type = c_garrow_equal_options_get_type;

/** */
alias garrow_equal_options_new = c_garrow_equal_options_new;

/** */
alias garrow_equal_options_is_approx = c_garrow_equal_options_is_approx;

// ExecuteContext

/** */
alias garrow_execute_context_get_type = c_garrow_execute_context_get_type;

/** */
alias garrow_execute_context_new = c_garrow_execute_context_new;

// ExecuteNode

/** */
alias garrow_execute_node_get_type = c_garrow_execute_node_get_type;

/** */
alias garrow_execute_node_get_kind_name = c_garrow_execute_node_get_kind_name;

/** */
alias garrow_execute_node_get_output_schema = c_garrow_execute_node_get_output_schema;

// ExecuteNodeOptions

/** */
alias garrow_execute_node_options_get_type = c_garrow_execute_node_options_get_type;

// ExecutePlan

/** */
alias garrow_execute_plan_get_type = c_garrow_execute_plan_get_type;

/** */
alias garrow_execute_plan_new = c_garrow_execute_plan_new;

/** */
alias garrow_execute_plan_build_aggregate_node = c_garrow_execute_plan_build_aggregate_node;

/** */
alias garrow_execute_plan_build_filter_node = c_garrow_execute_plan_build_filter_node;

/** */
alias garrow_execute_plan_build_hash_join_node = c_garrow_execute_plan_build_hash_join_node;

/** */
alias garrow_execute_plan_build_node = c_garrow_execute_plan_build_node;

/** */
alias garrow_execute_plan_build_project_node = c_garrow_execute_plan_build_project_node;

/** */
alias garrow_execute_plan_build_sink_node = c_garrow_execute_plan_build_sink_node;

/** */
alias garrow_execute_plan_build_source_node = c_garrow_execute_plan_build_source_node;

/** */
alias garrow_execute_plan_get_nodes = c_garrow_execute_plan_get_nodes;

/** */
alias garrow_execute_plan_start = c_garrow_execute_plan_start;

/** */
alias garrow_execute_plan_stop = c_garrow_execute_plan_stop;

/** */
alias garrow_execute_plan_validate = c_garrow_execute_plan_validate;

/** */
alias garrow_execute_plan_wait = c_garrow_execute_plan_wait;

// Expression

/** */
alias garrow_expression_get_type = c_garrow_expression_get_type;

/** */
alias garrow_expression_equal = c_garrow_expression_equal;

/** */
alias garrow_expression_to_string = c_garrow_expression_to_string;

// ExtensionArray

/** */
alias garrow_extension_array_get_type = c_garrow_extension_array_get_type;

/** */
alias garrow_extension_array_get_storage = c_garrow_extension_array_get_storage;

// ExtensionDataType

/** */
alias garrow_extension_data_type_get_type = c_garrow_extension_data_type_get_type;

/** */
alias garrow_extension_data_type_get_extension_name = c_garrow_extension_data_type_get_extension_name;

/** */
alias garrow_extension_data_type_wrap_array = c_garrow_extension_data_type_wrap_array;

/** */
alias garrow_extension_data_type_wrap_chunked_array = c_garrow_extension_data_type_wrap_chunked_array;

// ExtensionDataTypeRegistry

/** */
alias garrow_extension_data_type_registry_get_type = c_garrow_extension_data_type_registry_get_type;

/** */
alias garrow_extension_data_type_registry_default = c_garrow_extension_data_type_registry_default;

/** */
alias garrow_extension_data_type_registry_lookup = c_garrow_extension_data_type_registry_lookup;

/** */
alias garrow_extension_data_type_registry_register = c_garrow_extension_data_type_registry_register;

/** */
alias garrow_extension_data_type_registry_unregister = c_garrow_extension_data_type_registry_unregister;

// ExtensionScalar

/** */
alias garrow_extension_scalar_get_type = c_garrow_extension_scalar_get_type;

// FeatherFileReader

/** */
alias garrow_feather_file_reader_get_type = c_garrow_feather_file_reader_get_type;

/** */
alias garrow_feather_file_reader_new = c_garrow_feather_file_reader_new;

/** */
alias garrow_feather_file_reader_get_version = c_garrow_feather_file_reader_get_version;

/** */
alias garrow_feather_file_reader_read = c_garrow_feather_file_reader_read;

/** */
alias garrow_feather_file_reader_read_indices = c_garrow_feather_file_reader_read_indices;

/** */
alias garrow_feather_file_reader_read_names = c_garrow_feather_file_reader_read_names;

// FeatherWriteProperties

/** */
alias garrow_feather_write_properties_get_type = c_garrow_feather_write_properties_get_type;

/** */
alias garrow_feather_write_properties_new = c_garrow_feather_write_properties_new;

// Field

/** */
alias garrow_field_get_type = c_garrow_field_get_type;

/** */
alias garrow_field_new = c_garrow_field_new;

/** */
alias garrow_field_new_full = c_garrow_field_new_full;

/** */
alias garrow_field_import = c_garrow_field_import;

/** */
alias garrow_field_equal = c_garrow_field_equal;

/** */
alias garrow_field_export = c_garrow_field_export;

/** */
alias garrow_field_get_data_type = c_garrow_field_get_data_type;

/** */
alias garrow_field_get_metadata = c_garrow_field_get_metadata;

/** */
alias garrow_field_get_name = c_garrow_field_get_name;

/** */
alias garrow_field_has_metadata = c_garrow_field_has_metadata;

/** */
alias garrow_field_is_nullable = c_garrow_field_is_nullable;

/** */
alias garrow_field_remove_metadata = c_garrow_field_remove_metadata;

/** */
alias garrow_field_to_string = c_garrow_field_to_string;

/** */
alias garrow_field_to_string_metadata = c_garrow_field_to_string_metadata;

/** */
alias garrow_field_with_merged_metadata = c_garrow_field_with_merged_metadata;

/** */
alias garrow_field_with_metadata = c_garrow_field_with_metadata;

// FieldExpression

/** */
alias garrow_field_expression_get_type = c_garrow_field_expression_get_type;

/** */
alias garrow_field_expression_new = c_garrow_field_expression_new;

// File

/** */
alias garrow_file_get_type = c_garrow_file_get_type;

/** */
alias garrow_file_close = c_garrow_file_close;

/** */
alias garrow_file_get_mode = c_garrow_file_get_mode;

/** */
alias garrow_file_is_closed = c_garrow_file_is_closed;

/** */
alias garrow_file_tell = c_garrow_file_tell;

// FileInfo

/** */
alias garrow_file_info_get_type = c_garrow_file_info_get_type;

/** */
alias garrow_file_info_new = c_garrow_file_info_new;

/** */
alias garrow_file_info_equal = c_garrow_file_info_equal;

/** */
alias garrow_file_info_is_dir = c_garrow_file_info_is_dir;

/** */
alias garrow_file_info_is_file = c_garrow_file_info_is_file;

/** */
alias garrow_file_info_to_string = c_garrow_file_info_to_string;

// FileInputStream

/** */
alias garrow_file_input_stream_get_type = c_garrow_file_input_stream_get_type;

/** */
alias garrow_file_input_stream_new = c_garrow_file_input_stream_new;

/** */
alias garrow_file_input_stream_new_file_descriptor = c_garrow_file_input_stream_new_file_descriptor;

/** */
alias garrow_file_input_stream_get_file_descriptor = c_garrow_file_input_stream_get_file_descriptor;

// FileOutputStream

/** */
alias garrow_file_output_stream_get_type = c_garrow_file_output_stream_get_type;

/** */
alias garrow_file_output_stream_new = c_garrow_file_output_stream_new;

// FileSelector

/** */
alias garrow_file_selector_get_type = c_garrow_file_selector_get_type;

// FileSystem

/** */
alias garrow_file_system_get_type = c_garrow_file_system_get_type;

/** */
alias garrow_file_system_create = c_garrow_file_system_create;

/** */
alias garrow_file_system_copy_file = c_garrow_file_system_copy_file;

/** */
alias garrow_file_system_create_dir = c_garrow_file_system_create_dir;

/** */
alias garrow_file_system_delete_dir = c_garrow_file_system_delete_dir;

/** */
alias garrow_file_system_delete_dir_contents = c_garrow_file_system_delete_dir_contents;

/** */
alias garrow_file_system_delete_file = c_garrow_file_system_delete_file;

/** */
alias garrow_file_system_delete_files = c_garrow_file_system_delete_files;

/** */
alias garrow_file_system_get_file_info = c_garrow_file_system_get_file_info;

/** */
alias garrow_file_system_get_file_infos_paths = c_garrow_file_system_get_file_infos_paths;

/** */
alias garrow_file_system_get_file_infos_selector = c_garrow_file_system_get_file_infos_selector;

/** */
alias garrow_file_system_get_type_name = c_garrow_file_system_get_type_name;

/** */
alias garrow_file_system_move = c_garrow_file_system_move;

/** */
alias garrow_file_system_open_append_stream = c_garrow_file_system_open_append_stream;

/** */
alias garrow_file_system_open_input_file = c_garrow_file_system_open_input_file;

/** */
alias garrow_file_system_open_input_stream = c_garrow_file_system_open_input_stream;

/** */
alias garrow_file_system_open_output_stream = c_garrow_file_system_open_output_stream;

// FilterNodeOptions

/** */
alias garrow_filter_node_options_get_type = c_garrow_filter_node_options_get_type;

/** */
alias garrow_filter_node_options_new = c_garrow_filter_node_options_new;

// FilterOptions

/** */
alias garrow_filter_options_get_type = c_garrow_filter_options_get_type;

/** */
alias garrow_filter_options_new = c_garrow_filter_options_new;

// FixedSizeBinaryArray

/** */
alias garrow_fixed_size_binary_array_get_type = c_garrow_fixed_size_binary_array_get_type;

/** */
alias garrow_fixed_size_binary_array_new = c_garrow_fixed_size_binary_array_new;

/** */
alias garrow_fixed_size_binary_array_get_byte_width = c_garrow_fixed_size_binary_array_get_byte_width;

/** */
alias garrow_fixed_size_binary_array_get_value = c_garrow_fixed_size_binary_array_get_value;

/** */
alias garrow_fixed_size_binary_array_get_values_bytes = c_garrow_fixed_size_binary_array_get_values_bytes;

// FixedSizeBinaryArrayBuilder

/** */
alias garrow_fixed_size_binary_array_builder_get_type = c_garrow_fixed_size_binary_array_builder_get_type;

/** */
alias garrow_fixed_size_binary_array_builder_new = c_garrow_fixed_size_binary_array_builder_new;

/** */
alias garrow_fixed_size_binary_array_builder_append_value = c_garrow_fixed_size_binary_array_builder_append_value;

/** */
alias garrow_fixed_size_binary_array_builder_append_value_bytes = c_garrow_fixed_size_binary_array_builder_append_value_bytes;

/** */
alias garrow_fixed_size_binary_array_builder_append_values = c_garrow_fixed_size_binary_array_builder_append_values;

/** */
alias garrow_fixed_size_binary_array_builder_append_values_packed = c_garrow_fixed_size_binary_array_builder_append_values_packed;

// FixedSizeBinaryDataType

/** */
alias garrow_fixed_size_binary_data_type_get_type = c_garrow_fixed_size_binary_data_type_get_type;

/** */
alias garrow_fixed_size_binary_data_type_new = c_garrow_fixed_size_binary_data_type_new;

/** */
alias garrow_fixed_size_binary_data_type_get_byte_width = c_garrow_fixed_size_binary_data_type_get_byte_width;

// FixedSizeBinaryScalar

/** */
alias garrow_fixed_size_binary_scalar_get_type = c_garrow_fixed_size_binary_scalar_get_type;

/** */
alias garrow_fixed_size_binary_scalar_new = c_garrow_fixed_size_binary_scalar_new;

// FixedWidthDataType

/** */
alias garrow_fixed_width_data_type_get_type = c_garrow_fixed_width_data_type_get_type;

/** */
alias garrow_fixed_width_data_type_get_bit_width = c_garrow_fixed_width_data_type_get_bit_width;

// FloatArray

/** */
alias garrow_float_array_get_type = c_garrow_float_array_get_type;

/** */
alias garrow_float_array_new = c_garrow_float_array_new;

/** */
alias garrow_float_array_get_value = c_garrow_float_array_get_value;

/** */
alias garrow_float_array_get_values = c_garrow_float_array_get_values;

/** */
alias garrow_float_array_sum = c_garrow_float_array_sum;

// FloatArrayBuilder

/** */
alias garrow_float_array_builder_get_type = c_garrow_float_array_builder_get_type;

/** */
alias garrow_float_array_builder_new = c_garrow_float_array_builder_new;

/** */
alias garrow_float_array_builder_append = c_garrow_float_array_builder_append;

/** */
alias garrow_float_array_builder_append_null = c_garrow_float_array_builder_append_null;

/** */
alias garrow_float_array_builder_append_nulls = c_garrow_float_array_builder_append_nulls;

/** */
alias garrow_float_array_builder_append_value = c_garrow_float_array_builder_append_value;

/** */
alias garrow_float_array_builder_append_values = c_garrow_float_array_builder_append_values;

// FloatDataType

/** */
alias garrow_float_data_type_get_type = c_garrow_float_data_type_get_type;

/** */
alias garrow_float_data_type_new = c_garrow_float_data_type_new;

// FloatScalar

/** */
alias garrow_float_scalar_get_type = c_garrow_float_scalar_get_type;

/** */
alias garrow_float_scalar_new = c_garrow_float_scalar_new;

/** */
alias garrow_float_scalar_get_value = c_garrow_float_scalar_get_value;

// FloatingPointDataType

/** */
alias garrow_floating_point_data_type_get_type = c_garrow_floating_point_data_type_get_type;

// Function

/** */
alias garrow_function_get_type = c_garrow_function_get_type;

/** */
alias garrow_function_all = c_garrow_function_all;

/** */
alias garrow_function_find = c_garrow_function_find;

/** */
alias garrow_function_equal = c_garrow_function_equal;

/** */
alias garrow_function_execute = c_garrow_function_execute;

/** */
alias garrow_function_get_default_options = c_garrow_function_get_default_options;

/** */
alias garrow_function_get_doc = c_garrow_function_get_doc;

/** */
alias garrow_function_get_name = c_garrow_function_get_name;

/** */
alias garrow_function_get_options_type = c_garrow_function_get_options_type;

/** */
alias garrow_function_to_string = c_garrow_function_to_string;

// FunctionDoc

/** */
alias garrow_function_doc_get_type = c_garrow_function_doc_get_type;

/** */
alias garrow_function_doc_get_arg_names = c_garrow_function_doc_get_arg_names;

/** */
alias garrow_function_doc_get_description = c_garrow_function_doc_get_description;

/** */
alias garrow_function_doc_get_options_class_name = c_garrow_function_doc_get_options_class_name;

/** */
alias garrow_function_doc_get_summary = c_garrow_function_doc_get_summary;

// FunctionOptions

/** */
alias garrow_function_options_get_type = c_garrow_function_options_get_type;

/** */
alias garrow_function_options_equal = c_garrow_function_options_equal;

/** */
alias garrow_function_options_to_string = c_garrow_function_options_to_string;

// GCSFileSystem

/** */
alias garrow_gcs_file_system_get_type = c_garrow_gcs_file_system_get_type;

// GIOInputStream

/** */
alias garrow_gio_input_stream_get_type = c_garrow_gio_input_stream_get_type;

/** */
alias garrow_gio_input_stream_new = c_garrow_gio_input_stream_new;

/** */
alias garrow_gio_input_stream_get_raw = c_garrow_gio_input_stream_get_raw;

// GIOOutputStream

/** */
alias garrow_gio_output_stream_get_type = c_garrow_gio_output_stream_get_type;

/** */
alias garrow_gio_output_stream_new = c_garrow_gio_output_stream_new;

/** */
alias garrow_gio_output_stream_get_raw = c_garrow_gio_output_stream_get_raw;

// HDFSFileSystem

/** */
alias garrow_hdfs_file_system_get_type = c_garrow_hdfs_file_system_get_type;

// HalfFloatArray

/** */
alias garrow_half_float_array_get_type = c_garrow_half_float_array_get_type;

/** */
alias garrow_half_float_array_new = c_garrow_half_float_array_new;

/** */
alias garrow_half_float_array_get_value = c_garrow_half_float_array_get_value;

/** */
alias garrow_half_float_array_get_values = c_garrow_half_float_array_get_values;

// HalfFloatArrayBuilder

/** */
alias garrow_half_float_array_builder_get_type = c_garrow_half_float_array_builder_get_type;

/** */
alias garrow_half_float_array_builder_new = c_garrow_half_float_array_builder_new;

/** */
alias garrow_half_float_array_builder_append_value = c_garrow_half_float_array_builder_append_value;

/** */
alias garrow_half_float_array_builder_append_values = c_garrow_half_float_array_builder_append_values;

// HalfFloatDataType

/** */
alias garrow_half_float_data_type_get_type = c_garrow_half_float_data_type_get_type;

/** */
alias garrow_half_float_data_type_new = c_garrow_half_float_data_type_new;

// HalfFloatScalar

/** */
alias garrow_half_float_scalar_get_type = c_garrow_half_float_scalar_get_type;

/** */
alias garrow_half_float_scalar_new = c_garrow_half_float_scalar_new;

/** */
alias garrow_half_float_scalar_get_value = c_garrow_half_float_scalar_get_value;

// HashJoinNodeOptions

/** */
alias garrow_hash_join_node_options_get_type = c_garrow_hash_join_node_options_get_type;

/** */
alias garrow_hash_join_node_options_new = c_garrow_hash_join_node_options_new;

/** */
alias garrow_hash_join_node_options_set_left_outputs = c_garrow_hash_join_node_options_set_left_outputs;

/** */
alias garrow_hash_join_node_options_set_right_outputs = c_garrow_hash_join_node_options_set_right_outputs;

// ISO8601TimestampParser

/** */
alias garrow_iso8601_timestamp_parser_get_type = c_garrow_iso8601_timestamp_parser_get_type;

/** */
alias garrow_iso8601_timestamp_parser_new = c_garrow_iso8601_timestamp_parser_new;

// IndexOptions

/** */
alias garrow_index_options_get_type = c_garrow_index_options_get_type;

/** */
alias garrow_index_options_new = c_garrow_index_options_new;

// InputStream

/** */
alias garrow_input_stream_get_type = c_garrow_input_stream_get_type;

/** */
alias garrow_input_stream_advance = c_garrow_input_stream_advance;

/** */
alias garrow_input_stream_align = c_garrow_input_stream_align;

/** */
alias garrow_input_stream_read_record_batch = c_garrow_input_stream_read_record_batch;

/** */
alias garrow_input_stream_read_tensor = c_garrow_input_stream_read_tensor;

// Int16Array

/** */
alias garrow_int16_array_get_type = c_garrow_int16_array_get_type;

/** */
alias garrow_int16_array_new = c_garrow_int16_array_new;

/** */
alias garrow_int16_array_get_value = c_garrow_int16_array_get_value;

/** */
alias garrow_int16_array_get_values = c_garrow_int16_array_get_values;

/** */
alias garrow_int16_array_sum = c_garrow_int16_array_sum;

// Int16ArrayBuilder

/** */
alias garrow_int16_array_builder_get_type = c_garrow_int16_array_builder_get_type;

/** */
alias garrow_int16_array_builder_new = c_garrow_int16_array_builder_new;

/** */
alias garrow_int16_array_builder_append = c_garrow_int16_array_builder_append;

/** */
alias garrow_int16_array_builder_append_null = c_garrow_int16_array_builder_append_null;

/** */
alias garrow_int16_array_builder_append_nulls = c_garrow_int16_array_builder_append_nulls;

/** */
alias garrow_int16_array_builder_append_value = c_garrow_int16_array_builder_append_value;

/** */
alias garrow_int16_array_builder_append_values = c_garrow_int16_array_builder_append_values;

// Int16DataType

/** */
alias garrow_int16_data_type_get_type = c_garrow_int16_data_type_get_type;

/** */
alias garrow_int16_data_type_new = c_garrow_int16_data_type_new;

// Int16Scalar

/** */
alias garrow_int16_scalar_get_type = c_garrow_int16_scalar_get_type;

/** */
alias garrow_int16_scalar_new = c_garrow_int16_scalar_new;

/** */
alias garrow_int16_scalar_get_value = c_garrow_int16_scalar_get_value;

// Int32Array

/** */
alias garrow_int32_array_get_type = c_garrow_int32_array_get_type;

/** */
alias garrow_int32_array_new = c_garrow_int32_array_new;

/** */
alias garrow_int32_array_get_value = c_garrow_int32_array_get_value;

/** */
alias garrow_int32_array_get_values = c_garrow_int32_array_get_values;

/** */
alias garrow_int32_array_sum = c_garrow_int32_array_sum;

// Int32ArrayBuilder

/** */
alias garrow_int32_array_builder_get_type = c_garrow_int32_array_builder_get_type;

/** */
alias garrow_int32_array_builder_new = c_garrow_int32_array_builder_new;

/** */
alias garrow_int32_array_builder_append = c_garrow_int32_array_builder_append;

/** */
alias garrow_int32_array_builder_append_null = c_garrow_int32_array_builder_append_null;

/** */
alias garrow_int32_array_builder_append_nulls = c_garrow_int32_array_builder_append_nulls;

/** */
alias garrow_int32_array_builder_append_value = c_garrow_int32_array_builder_append_value;

/** */
alias garrow_int32_array_builder_append_values = c_garrow_int32_array_builder_append_values;

// Int32DataType

/** */
alias garrow_int32_data_type_get_type = c_garrow_int32_data_type_get_type;

/** */
alias garrow_int32_data_type_new = c_garrow_int32_data_type_new;

// Int32Scalar

/** */
alias garrow_int32_scalar_get_type = c_garrow_int32_scalar_get_type;

/** */
alias garrow_int32_scalar_new = c_garrow_int32_scalar_new;

/** */
alias garrow_int32_scalar_get_value = c_garrow_int32_scalar_get_value;

// Int64Array

/** */
alias garrow_int64_array_get_type = c_garrow_int64_array_get_type;

/** */
alias garrow_int64_array_new = c_garrow_int64_array_new;

/** */
alias garrow_int64_array_get_value = c_garrow_int64_array_get_value;

/** */
alias garrow_int64_array_get_values = c_garrow_int64_array_get_values;

/** */
alias garrow_int64_array_sum = c_garrow_int64_array_sum;

// Int64ArrayBuilder

/** */
alias garrow_int64_array_builder_get_type = c_garrow_int64_array_builder_get_type;

/** */
alias garrow_int64_array_builder_new = c_garrow_int64_array_builder_new;

/** */
alias garrow_int64_array_builder_append = c_garrow_int64_array_builder_append;

/** */
alias garrow_int64_array_builder_append_null = c_garrow_int64_array_builder_append_null;

/** */
alias garrow_int64_array_builder_append_nulls = c_garrow_int64_array_builder_append_nulls;

/** */
alias garrow_int64_array_builder_append_value = c_garrow_int64_array_builder_append_value;

/** */
alias garrow_int64_array_builder_append_values = c_garrow_int64_array_builder_append_values;

// Int64DataType

/** */
alias garrow_int64_data_type_get_type = c_garrow_int64_data_type_get_type;

/** */
alias garrow_int64_data_type_new = c_garrow_int64_data_type_new;

// Int64Scalar

/** */
alias garrow_int64_scalar_get_type = c_garrow_int64_scalar_get_type;

/** */
alias garrow_int64_scalar_new = c_garrow_int64_scalar_new;

/** */
alias garrow_int64_scalar_get_value = c_garrow_int64_scalar_get_value;

// Int8Array

/** */
alias garrow_int8_array_get_type = c_garrow_int8_array_get_type;

/** */
alias garrow_int8_array_new = c_garrow_int8_array_new;

/** */
alias garrow_int8_array_get_value = c_garrow_int8_array_get_value;

/** */
alias garrow_int8_array_get_values = c_garrow_int8_array_get_values;

/** */
alias garrow_int8_array_sum = c_garrow_int8_array_sum;

// Int8ArrayBuilder

/** */
alias garrow_int8_array_builder_get_type = c_garrow_int8_array_builder_get_type;

/** */
alias garrow_int8_array_builder_new = c_garrow_int8_array_builder_new;

/** */
alias garrow_int8_array_builder_append = c_garrow_int8_array_builder_append;

/** */
alias garrow_int8_array_builder_append_null = c_garrow_int8_array_builder_append_null;

/** */
alias garrow_int8_array_builder_append_nulls = c_garrow_int8_array_builder_append_nulls;

/** */
alias garrow_int8_array_builder_append_value = c_garrow_int8_array_builder_append_value;

/** */
alias garrow_int8_array_builder_append_values = c_garrow_int8_array_builder_append_values;

// Int8DataType

/** */
alias garrow_int8_data_type_get_type = c_garrow_int8_data_type_get_type;

/** */
alias garrow_int8_data_type_new = c_garrow_int8_data_type_new;

// Int8Scalar

/** */
alias garrow_int8_scalar_get_type = c_garrow_int8_scalar_get_type;

/** */
alias garrow_int8_scalar_new = c_garrow_int8_scalar_new;

/** */
alias garrow_int8_scalar_get_value = c_garrow_int8_scalar_get_value;

// IntArrayBuilder

/** */
alias garrow_int_array_builder_get_type = c_garrow_int_array_builder_get_type;

/** */
alias garrow_int_array_builder_new = c_garrow_int_array_builder_new;

/** */
alias garrow_int_array_builder_append = c_garrow_int_array_builder_append;

/** */
alias garrow_int_array_builder_append_null = c_garrow_int_array_builder_append_null;

/** */
alias garrow_int_array_builder_append_nulls = c_garrow_int_array_builder_append_nulls;

/** */
alias garrow_int_array_builder_append_value = c_garrow_int_array_builder_append_value;

/** */
alias garrow_int_array_builder_append_values = c_garrow_int_array_builder_append_values;

// IntegerDataType

/** */
alias garrow_integer_data_type_get_type = c_garrow_integer_data_type_get_type;

/** */
alias garrow_integer_data_type_is_signed = c_garrow_integer_data_type_is_signed;

// IntervalDataType

/** */
alias garrow_interval_data_type_get_type = c_garrow_interval_data_type_get_type;

/** */
alias garrow_interval_data_type_get_interval_type = c_garrow_interval_data_type_get_interval_type;

// JSONReadOptions

/** */
alias garrow_json_read_options_get_type = c_garrow_json_read_options_get_type;

/** */
alias garrow_json_read_options_new = c_garrow_json_read_options_new;

// JSONReader

/** */
alias garrow_json_reader_get_type = c_garrow_json_reader_get_type;

/** */
alias garrow_json_reader_new = c_garrow_json_reader_new;

/** */
alias garrow_json_reader_read = c_garrow_json_reader_read;

// LargeBinaryArray

/** */
alias garrow_large_binary_array_get_type = c_garrow_large_binary_array_get_type;

/** */
alias garrow_large_binary_array_new = c_garrow_large_binary_array_new;

/** */
alias garrow_large_binary_array_get_buffer = c_garrow_large_binary_array_get_buffer;

/** */
alias garrow_large_binary_array_get_data_buffer = c_garrow_large_binary_array_get_data_buffer;

/** */
alias garrow_large_binary_array_get_offsets_buffer = c_garrow_large_binary_array_get_offsets_buffer;

/** */
alias garrow_large_binary_array_get_value = c_garrow_large_binary_array_get_value;

// LargeBinaryArrayBuilder

/** */
alias garrow_large_binary_array_builder_get_type = c_garrow_large_binary_array_builder_get_type;

/** */
alias garrow_large_binary_array_builder_new = c_garrow_large_binary_array_builder_new;

/** */
alias garrow_large_binary_array_builder_append_null = c_garrow_large_binary_array_builder_append_null;

/** */
alias garrow_large_binary_array_builder_append_nulls = c_garrow_large_binary_array_builder_append_nulls;

/** */
alias garrow_large_binary_array_builder_append_value = c_garrow_large_binary_array_builder_append_value;

/** */
alias garrow_large_binary_array_builder_append_value_bytes = c_garrow_large_binary_array_builder_append_value_bytes;

/** */
alias garrow_large_binary_array_builder_append_values = c_garrow_large_binary_array_builder_append_values;

// LargeBinaryDataType

/** */
alias garrow_large_binary_data_type_get_type = c_garrow_large_binary_data_type_get_type;

/** */
alias garrow_large_binary_data_type_new = c_garrow_large_binary_data_type_new;

// LargeBinaryScalar

/** */
alias garrow_large_binary_scalar_get_type = c_garrow_large_binary_scalar_get_type;

/** */
alias garrow_large_binary_scalar_new = c_garrow_large_binary_scalar_new;

// LargeListArray

/** */
alias garrow_large_list_array_get_type = c_garrow_large_list_array_get_type;

/** */
alias garrow_large_list_array_new = c_garrow_large_list_array_new;

/** */
alias garrow_large_list_array_get_value = c_garrow_large_list_array_get_value;

/** */
alias garrow_large_list_array_get_value_length = c_garrow_large_list_array_get_value_length;

/** */
alias garrow_large_list_array_get_value_offset = c_garrow_large_list_array_get_value_offset;

/** */
alias garrow_large_list_array_get_value_offsets = c_garrow_large_list_array_get_value_offsets;

/** */
alias garrow_large_list_array_get_value_type = c_garrow_large_list_array_get_value_type;

/** */
alias garrow_large_list_array_get_values = c_garrow_large_list_array_get_values;

// LargeListArrayBuilder

/** */
alias garrow_large_list_array_builder_get_type = c_garrow_large_list_array_builder_get_type;

/** */
alias garrow_large_list_array_builder_new = c_garrow_large_list_array_builder_new;

/** */
alias garrow_large_list_array_builder_append_null = c_garrow_large_list_array_builder_append_null;

/** */
alias garrow_large_list_array_builder_append_value = c_garrow_large_list_array_builder_append_value;

/** */
alias garrow_large_list_array_builder_get_value_builder = c_garrow_large_list_array_builder_get_value_builder;

// LargeListDataType

/** */
alias garrow_large_list_data_type_get_type = c_garrow_large_list_data_type_get_type;

/** */
alias garrow_large_list_data_type_new = c_garrow_large_list_data_type_new;

/** */
alias garrow_large_list_data_type_get_field = c_garrow_large_list_data_type_get_field;

// LargeListScalar

/** */
alias garrow_large_list_scalar_get_type = c_garrow_large_list_scalar_get_type;

/** */
alias garrow_large_list_scalar_new = c_garrow_large_list_scalar_new;

// LargeStringArray

/** */
alias garrow_large_string_array_get_type = c_garrow_large_string_array_get_type;

/** */
alias garrow_large_string_array_new = c_garrow_large_string_array_new;

/** */
alias garrow_large_string_array_get_string = c_garrow_large_string_array_get_string;

// LargeStringArrayBuilder

/** */
alias garrow_large_string_array_builder_get_type = c_garrow_large_string_array_builder_get_type;

/** */
alias garrow_large_string_array_builder_new = c_garrow_large_string_array_builder_new;

/** */
alias garrow_large_string_array_builder_append_string = c_garrow_large_string_array_builder_append_string;

/** */
alias garrow_large_string_array_builder_append_string_len = c_garrow_large_string_array_builder_append_string_len;

/** */
alias garrow_large_string_array_builder_append_strings = c_garrow_large_string_array_builder_append_strings;

// LargeStringDataType

/** */
alias garrow_large_string_data_type_get_type = c_garrow_large_string_data_type_get_type;

/** */
alias garrow_large_string_data_type_new = c_garrow_large_string_data_type_new;

// LargeStringScalar

/** */
alias garrow_large_string_scalar_get_type = c_garrow_large_string_scalar_get_type;

/** */
alias garrow_large_string_scalar_new = c_garrow_large_string_scalar_new;

// ListArray

/** */
alias garrow_list_array_get_type = c_garrow_list_array_get_type;

/** */
alias garrow_list_array_new = c_garrow_list_array_new;

/** */
alias garrow_list_array_get_value = c_garrow_list_array_get_value;

/** */
alias garrow_list_array_get_value_length = c_garrow_list_array_get_value_length;

/** */
alias garrow_list_array_get_value_offset = c_garrow_list_array_get_value_offset;

/** */
alias garrow_list_array_get_value_offsets = c_garrow_list_array_get_value_offsets;

/** */
alias garrow_list_array_get_value_type = c_garrow_list_array_get_value_type;

/** */
alias garrow_list_array_get_values = c_garrow_list_array_get_values;

// ListArrayBuilder

/** */
alias garrow_list_array_builder_get_type = c_garrow_list_array_builder_get_type;

/** */
alias garrow_list_array_builder_new = c_garrow_list_array_builder_new;

/** */
alias garrow_list_array_builder_append = c_garrow_list_array_builder_append;

/** */
alias garrow_list_array_builder_append_null = c_garrow_list_array_builder_append_null;

/** */
alias garrow_list_array_builder_append_value = c_garrow_list_array_builder_append_value;

/** */
alias garrow_list_array_builder_get_value_builder = c_garrow_list_array_builder_get_value_builder;

// ListDataType

/** */
alias garrow_list_data_type_get_type = c_garrow_list_data_type_get_type;

/** */
alias garrow_list_data_type_new = c_garrow_list_data_type_new;

/** */
alias garrow_list_data_type_get_field = c_garrow_list_data_type_get_field;

/** */
alias garrow_list_data_type_get_value_field = c_garrow_list_data_type_get_value_field;

// ListScalar

/** */
alias garrow_list_scalar_get_type = c_garrow_list_scalar_get_type;

/** */
alias garrow_list_scalar_new = c_garrow_list_scalar_new;

// LiteralExpression

/** */
alias garrow_literal_expression_get_type = c_garrow_literal_expression_get_type;

/** */
alias garrow_literal_expression_new = c_garrow_literal_expression_new;

// LocalFileSystem

/** */
alias garrow_local_file_system_get_type = c_garrow_local_file_system_get_type;

/** */
alias garrow_local_file_system_new = c_garrow_local_file_system_new;

// LocalFileSystemOptions

/** */
alias garrow_local_file_system_options_get_type = c_garrow_local_file_system_options_get_type;

/** */
alias garrow_local_file_system_options_new = c_garrow_local_file_system_options_new;

// MapArray

/** */
alias garrow_map_array_get_type = c_garrow_map_array_get_type;

/** */
alias garrow_map_array_new = c_garrow_map_array_new;

/** */
alias garrow_map_array_get_items = c_garrow_map_array_get_items;

/** */
alias garrow_map_array_get_keys = c_garrow_map_array_get_keys;

// MapArrayBuilder

/** */
alias garrow_map_array_builder_get_type = c_garrow_map_array_builder_get_type;

/** */
alias garrow_map_array_builder_new = c_garrow_map_array_builder_new;

/** */
alias garrow_map_array_builder_append_null = c_garrow_map_array_builder_append_null;

/** */
alias garrow_map_array_builder_append_nulls = c_garrow_map_array_builder_append_nulls;

/** */
alias garrow_map_array_builder_append_value = c_garrow_map_array_builder_append_value;

/** */
alias garrow_map_array_builder_append_values = c_garrow_map_array_builder_append_values;

/** */
alias garrow_map_array_builder_get_item_builder = c_garrow_map_array_builder_get_item_builder;

/** */
alias garrow_map_array_builder_get_key_builder = c_garrow_map_array_builder_get_key_builder;

/** */
alias garrow_map_array_builder_get_value_builder = c_garrow_map_array_builder_get_value_builder;

// MapDataType

/** */
alias garrow_map_data_type_get_type = c_garrow_map_data_type_get_type;

/** */
alias garrow_map_data_type_new = c_garrow_map_data_type_new;

/** */
alias garrow_map_data_type_get_item_type = c_garrow_map_data_type_get_item_type;

/** */
alias garrow_map_data_type_get_key_type = c_garrow_map_data_type_get_key_type;

// MapScalar

/** */
alias garrow_map_scalar_get_type = c_garrow_map_scalar_get_type;

/** */
alias garrow_map_scalar_new = c_garrow_map_scalar_new;

// MatchSubstringOptions

/** */
alias garrow_match_substring_options_get_type = c_garrow_match_substring_options_get_type;

/** */
alias garrow_match_substring_options_new = c_garrow_match_substring_options_new;

// MemoryMappedInputStream

/** */
alias garrow_memory_mapped_input_stream_get_type = c_garrow_memory_mapped_input_stream_get_type;

/** */
alias garrow_memory_mapped_input_stream_new = c_garrow_memory_mapped_input_stream_new;

// MemoryPool

/** */
alias garrow_memory_pool_get_type = c_garrow_memory_pool_get_type;

/** */
alias garrow_memory_pool_default = c_garrow_memory_pool_default;

/** */
alias garrow_memory_pool_get_backend_name = c_garrow_memory_pool_get_backend_name;

/** */
alias garrow_memory_pool_get_bytes_allocated = c_garrow_memory_pool_get_bytes_allocated;

/** */
alias garrow_memory_pool_get_max_memory = c_garrow_memory_pool_get_max_memory;

// MockFileSystem

/** */
alias garrow_mock_file_system_get_type = c_garrow_mock_file_system_get_type;

// MonthDayNano

/** */
alias garrow_month_day_nano_get_type = c_garrow_month_day_nano_get_type;

/** */
alias garrow_month_day_nano_new = c_garrow_month_day_nano_new;

/** */
alias garrow_month_day_nano_equal = c_garrow_month_day_nano_equal;

// MonthDayNanoIntervalArray

/** */
alias garrow_month_day_nano_interval_array_get_type = c_garrow_month_day_nano_interval_array_get_type;

/** */
alias garrow_month_day_nano_interval_array_new = c_garrow_month_day_nano_interval_array_new;

/** */
alias garrow_month_day_nano_interval_array_get_value = c_garrow_month_day_nano_interval_array_get_value;

/** */
alias garrow_month_day_nano_interval_array_get_values = c_garrow_month_day_nano_interval_array_get_values;

// MonthDayNanoIntervalArrayBuilder

/** */
alias garrow_month_day_nano_interval_array_builder_get_type = c_garrow_month_day_nano_interval_array_builder_get_type;

/** */
alias garrow_month_day_nano_interval_array_builder_new = c_garrow_month_day_nano_interval_array_builder_new;

/** */
alias garrow_month_day_nano_interval_array_builder_append_value = c_garrow_month_day_nano_interval_array_builder_append_value;

/** */
alias garrow_month_day_nano_interval_array_builder_append_values = c_garrow_month_day_nano_interval_array_builder_append_values;

// MonthDayNanoIntervalDataType

/** */
alias garrow_month_day_nano_interval_data_type_get_type = c_garrow_month_day_nano_interval_data_type_get_type;

/** */
alias garrow_month_day_nano_interval_data_type_new = c_garrow_month_day_nano_interval_data_type_new;

// MonthDayNanoIntervalScalar

/** */
alias garrow_month_day_nano_interval_scalar_get_type = c_garrow_month_day_nano_interval_scalar_get_type;

/** */
alias garrow_month_day_nano_interval_scalar_new = c_garrow_month_day_nano_interval_scalar_new;

/** */
alias garrow_month_day_nano_interval_scalar_get_value = c_garrow_month_day_nano_interval_scalar_get_value;

// MonthIntervalArray

/** */
alias garrow_month_interval_array_get_type = c_garrow_month_interval_array_get_type;

/** */
alias garrow_month_interval_array_new = c_garrow_month_interval_array_new;

/** */
alias garrow_month_interval_array_get_value = c_garrow_month_interval_array_get_value;

/** */
alias garrow_month_interval_array_get_values = c_garrow_month_interval_array_get_values;

// MonthIntervalArrayBuilder

/** */
alias garrow_month_interval_array_builder_get_type = c_garrow_month_interval_array_builder_get_type;

/** */
alias garrow_month_interval_array_builder_new = c_garrow_month_interval_array_builder_new;

/** */
alias garrow_month_interval_array_builder_append_value = c_garrow_month_interval_array_builder_append_value;

/** */
alias garrow_month_interval_array_builder_append_values = c_garrow_month_interval_array_builder_append_values;

// MonthIntervalDataType

/** */
alias garrow_month_interval_data_type_get_type = c_garrow_month_interval_data_type_get_type;

/** */
alias garrow_month_interval_data_type_new = c_garrow_month_interval_data_type_new;

// MonthIntervalScalar

/** */
alias garrow_month_interval_scalar_get_type = c_garrow_month_interval_scalar_get_type;

/** */
alias garrow_month_interval_scalar_new = c_garrow_month_interval_scalar_new;

/** */
alias garrow_month_interval_scalar_get_value = c_garrow_month_interval_scalar_get_value;

// MutableBuffer

/** */
alias garrow_mutable_buffer_get_type = c_garrow_mutable_buffer_get_type;

/** */
alias garrow_mutable_buffer_new = c_garrow_mutable_buffer_new;

/** */
alias garrow_mutable_buffer_new_bytes = c_garrow_mutable_buffer_new_bytes;

/** */
alias garrow_mutable_buffer_set_data = c_garrow_mutable_buffer_set_data;

/** */
alias garrow_mutable_buffer_slice = c_garrow_mutable_buffer_slice;

// NullArray

/** */
alias garrow_null_array_get_type = c_garrow_null_array_get_type;

/** */
alias garrow_null_array_new = c_garrow_null_array_new;

// NullArrayBuilder

/** */
alias garrow_null_array_builder_get_type = c_garrow_null_array_builder_get_type;

/** */
alias garrow_null_array_builder_new = c_garrow_null_array_builder_new;

/** */
alias garrow_null_array_builder_append_null = c_garrow_null_array_builder_append_null;

/** */
alias garrow_null_array_builder_append_nulls = c_garrow_null_array_builder_append_nulls;

// NullDataType

/** */
alias garrow_null_data_type_get_type = c_garrow_null_data_type_get_type;

/** */
alias garrow_null_data_type_new = c_garrow_null_data_type_new;

// NullScalar

/** */
alias garrow_null_scalar_get_type = c_garrow_null_scalar_get_type;

/** */
alias garrow_null_scalar_new = c_garrow_null_scalar_new;

// NumericArray

/** */
alias garrow_numeric_array_get_type = c_garrow_numeric_array_get_type;

/** */
alias garrow_numeric_array_mean = c_garrow_numeric_array_mean;

// NumericDataType

/** */
alias garrow_numeric_data_type_get_type = c_garrow_numeric_data_type_get_type;

// OutputStream

/** */
alias garrow_output_stream_get_type = c_garrow_output_stream_get_type;

/** */
alias garrow_output_stream_align = c_garrow_output_stream_align;

/** */
alias garrow_output_stream_write_record_batch = c_garrow_output_stream_write_record_batch;

/** */
alias garrow_output_stream_write_tensor = c_garrow_output_stream_write_tensor;

// PrimitiveArray

/** */
alias garrow_primitive_array_get_type = c_garrow_primitive_array_get_type;

/** */
alias garrow_primitive_array_get_buffer = c_garrow_primitive_array_get_buffer;

/** */
alias garrow_primitive_array_get_data_buffer = c_garrow_primitive_array_get_data_buffer;

// ProjectNodeOptions

/** */
alias garrow_project_node_options_get_type = c_garrow_project_node_options_get_type;

/** */
alias garrow_project_node_options_new = c_garrow_project_node_options_new;

// QuantileOptions

/** */
alias garrow_quantile_options_get_type = c_garrow_quantile_options_get_type;

/** */
alias garrow_quantile_options_new = c_garrow_quantile_options_new;

/** */
alias garrow_quantile_options_get_qs = c_garrow_quantile_options_get_qs;

/** */
alias garrow_quantile_options_set_q = c_garrow_quantile_options_set_q;

/** */
alias garrow_quantile_options_set_qs = c_garrow_quantile_options_set_qs;

// RankOptions

/** */
alias garrow_rank_options_get_type = c_garrow_rank_options_get_type;

/** */
alias garrow_rank_options_new = c_garrow_rank_options_new;

/** */
alias garrow_rank_options_add_sort_key = c_garrow_rank_options_add_sort_key;

/** */
alias garrow_rank_options_equal = c_garrow_rank_options_equal;

/** */
alias garrow_rank_options_get_sort_keys = c_garrow_rank_options_get_sort_keys;

/** */
alias garrow_rank_options_set_sort_keys = c_garrow_rank_options_set_sort_keys;

// ReadOptions

/** */
alias garrow_read_options_get_type = c_garrow_read_options_get_type;

/** */
alias garrow_read_options_new = c_garrow_read_options_new;

/** */
alias garrow_read_options_get_included_fields = c_garrow_read_options_get_included_fields;

/** */
alias garrow_read_options_set_included_fields = c_garrow_read_options_set_included_fields;

// Readable

/** */
alias garrow_readable_get_type = c_garrow_readable_get_type;

/** */
alias garrow_readable_read = c_garrow_readable_read;

/** */
alias garrow_readable_read_bytes = c_garrow_readable_read_bytes;

// RecordBatch

/** */
alias garrow_record_batch_get_type = c_garrow_record_batch_get_type;

/** */
alias garrow_record_batch_new = c_garrow_record_batch_new;

/** */
alias garrow_record_batch_import = c_garrow_record_batch_import;

/** */
alias garrow_record_batch_add_column = c_garrow_record_batch_add_column;

/** */
alias garrow_record_batch_equal = c_garrow_record_batch_equal;

/** */
alias garrow_record_batch_equal_metadata = c_garrow_record_batch_equal_metadata;

/** */
alias garrow_record_batch_export = c_garrow_record_batch_export;

/** */
alias garrow_record_batch_filter = c_garrow_record_batch_filter;

/** */
alias garrow_record_batch_get_column_data = c_garrow_record_batch_get_column_data;

/** */
alias garrow_record_batch_get_column_name = c_garrow_record_batch_get_column_name;

/** */
alias garrow_record_batch_get_n_columns = c_garrow_record_batch_get_n_columns;

/** */
alias garrow_record_batch_get_n_rows = c_garrow_record_batch_get_n_rows;

/** */
alias garrow_record_batch_get_schema = c_garrow_record_batch_get_schema;

/** */
alias garrow_record_batch_remove_column = c_garrow_record_batch_remove_column;

/** */
alias garrow_record_batch_serialize = c_garrow_record_batch_serialize;

/** */
alias garrow_record_batch_slice = c_garrow_record_batch_slice;

/** */
alias garrow_record_batch_sort_indices = c_garrow_record_batch_sort_indices;

/** */
alias garrow_record_batch_take = c_garrow_record_batch_take;

/** */
alias garrow_record_batch_to_string = c_garrow_record_batch_to_string;

// RecordBatchBuilder

/** */
alias garrow_record_batch_builder_get_type = c_garrow_record_batch_builder_get_type;

/** */
alias garrow_record_batch_builder_new = c_garrow_record_batch_builder_new;

/** */
alias garrow_record_batch_builder_flush = c_garrow_record_batch_builder_flush;

/** */
alias garrow_record_batch_builder_get_column_builder = c_garrow_record_batch_builder_get_column_builder;

/** */
alias garrow_record_batch_builder_get_field = c_garrow_record_batch_builder_get_field;

/** */
alias garrow_record_batch_builder_get_initial_capacity = c_garrow_record_batch_builder_get_initial_capacity;

/** */
alias garrow_record_batch_builder_get_n_columns = c_garrow_record_batch_builder_get_n_columns;

/** */
alias garrow_record_batch_builder_get_n_fields = c_garrow_record_batch_builder_get_n_fields;

/** */
alias garrow_record_batch_builder_get_schema = c_garrow_record_batch_builder_get_schema;

/** */
alias garrow_record_batch_builder_set_initial_capacity = c_garrow_record_batch_builder_set_initial_capacity;

// RecordBatchDatum

/** */
alias garrow_record_batch_datum_get_type = c_garrow_record_batch_datum_get_type;

/** */
alias garrow_record_batch_datum_new = c_garrow_record_batch_datum_new;

// RecordBatchFileReader

/** */
alias garrow_record_batch_file_reader_get_type = c_garrow_record_batch_file_reader_get_type;

/** */
alias garrow_record_batch_file_reader_new = c_garrow_record_batch_file_reader_new;

/** */
alias garrow_record_batch_file_reader_get_n_record_batches = c_garrow_record_batch_file_reader_get_n_record_batches;

/** */
alias garrow_record_batch_file_reader_get_record_batch = c_garrow_record_batch_file_reader_get_record_batch;

/** */
alias garrow_record_batch_file_reader_get_schema = c_garrow_record_batch_file_reader_get_schema;

/** */
alias garrow_record_batch_file_reader_get_version = c_garrow_record_batch_file_reader_get_version;

/** */
alias garrow_record_batch_file_reader_read_record_batch = c_garrow_record_batch_file_reader_read_record_batch;

// RecordBatchFileWriter

/** */
alias garrow_record_batch_file_writer_get_type = c_garrow_record_batch_file_writer_get_type;

/** */
alias garrow_record_batch_file_writer_new = c_garrow_record_batch_file_writer_new;

// RecordBatchIterator

/** */
alias garrow_record_batch_iterator_get_type = c_garrow_record_batch_iterator_get_type;

/** */
alias garrow_record_batch_iterator_new = c_garrow_record_batch_iterator_new;

/** */
alias garrow_record_batch_iterator_equal = c_garrow_record_batch_iterator_equal;

/** */
alias garrow_record_batch_iterator_next = c_garrow_record_batch_iterator_next;

/** */
alias garrow_record_batch_iterator_to_list = c_garrow_record_batch_iterator_to_list;

// RecordBatchReader

/** */
alias garrow_record_batch_reader_get_type = c_garrow_record_batch_reader_get_type;

/** */
alias garrow_record_batch_reader_new = c_garrow_record_batch_reader_new;

/** */
alias garrow_record_batch_reader_import = c_garrow_record_batch_reader_import;

/** */
alias garrow_record_batch_reader_export = c_garrow_record_batch_reader_export;

/** */
alias garrow_record_batch_reader_get_next_record_batch = c_garrow_record_batch_reader_get_next_record_batch;

/** */
alias garrow_record_batch_reader_get_schema = c_garrow_record_batch_reader_get_schema;

/** */
alias garrow_record_batch_reader_get_sources = c_garrow_record_batch_reader_get_sources;

/** */
alias garrow_record_batch_reader_read_all = c_garrow_record_batch_reader_read_all;

/** */
alias garrow_record_batch_reader_read_next = c_garrow_record_batch_reader_read_next;

/** */
alias garrow_record_batch_reader_read_next_record_batch = c_garrow_record_batch_reader_read_next_record_batch;

// RecordBatchStreamReader

/** */
alias garrow_record_batch_stream_reader_get_type = c_garrow_record_batch_stream_reader_get_type;

/** */
alias garrow_record_batch_stream_reader_new = c_garrow_record_batch_stream_reader_new;

// RecordBatchStreamWriter

/** */
alias garrow_record_batch_stream_writer_get_type = c_garrow_record_batch_stream_writer_get_type;

/** */
alias garrow_record_batch_stream_writer_new = c_garrow_record_batch_stream_writer_new;

// RecordBatchWriter

/** */
alias garrow_record_batch_writer_get_type = c_garrow_record_batch_writer_get_type;

/** */
alias garrow_record_batch_writer_close = c_garrow_record_batch_writer_close;

/** */
alias garrow_record_batch_writer_is_closed = c_garrow_record_batch_writer_is_closed;

/** */
alias garrow_record_batch_writer_write_record_batch = c_garrow_record_batch_writer_write_record_batch;

/** */
alias garrow_record_batch_writer_write_table = c_garrow_record_batch_writer_write_table;

// ResizableBuffer

/** */
alias garrow_resizable_buffer_get_type = c_garrow_resizable_buffer_get_type;

/** */
alias garrow_resizable_buffer_new = c_garrow_resizable_buffer_new;

/** */
alias garrow_resizable_buffer_reserve = c_garrow_resizable_buffer_reserve;

/** */
alias garrow_resizable_buffer_resize = c_garrow_resizable_buffer_resize;

// RoundOptions

/** */
alias garrow_round_options_get_type = c_garrow_round_options_get_type;

/** */
alias garrow_round_options_new = c_garrow_round_options_new;

// RoundToMultipleOptions

/** */
alias garrow_round_to_multiple_options_get_type = c_garrow_round_to_multiple_options_get_type;

/** */
alias garrow_round_to_multiple_options_new = c_garrow_round_to_multiple_options_new;

// RunEndEncodeOptions

/** */
alias garrow_run_end_encode_options_get_type = c_garrow_run_end_encode_options_get_type;

/** */
alias garrow_run_end_encode_options_new = c_garrow_run_end_encode_options_new;

// RunEndEncodedArray

/** */
alias garrow_run_end_encoded_array_get_type = c_garrow_run_end_encoded_array_get_type;

/** */
alias garrow_run_end_encoded_array_new = c_garrow_run_end_encoded_array_new;

/** */
alias garrow_run_end_encoded_array_decode = c_garrow_run_end_encoded_array_decode;

/** */
alias garrow_run_end_encoded_array_find_physical_length = c_garrow_run_end_encoded_array_find_physical_length;

/** */
alias garrow_run_end_encoded_array_find_physical_offset = c_garrow_run_end_encoded_array_find_physical_offset;

/** */
alias garrow_run_end_encoded_array_get_logical_run_ends = c_garrow_run_end_encoded_array_get_logical_run_ends;

/** */
alias garrow_run_end_encoded_array_get_logical_values = c_garrow_run_end_encoded_array_get_logical_values;

/** */
alias garrow_run_end_encoded_array_get_run_ends = c_garrow_run_end_encoded_array_get_run_ends;

/** */
alias garrow_run_end_encoded_array_get_values = c_garrow_run_end_encoded_array_get_values;

// RunEndEncodedDataType

/** */
alias garrow_run_end_encoded_data_type_get_type = c_garrow_run_end_encoded_data_type_get_type;

/** */
alias garrow_run_end_encoded_data_type_new = c_garrow_run_end_encoded_data_type_new;

/** */
alias garrow_run_end_encoded_data_type_get_run_end_data_type = c_garrow_run_end_encoded_data_type_get_run_end_data_type;

/** */
alias garrow_run_end_encoded_data_type_get_value_data_type = c_garrow_run_end_encoded_data_type_get_value_data_type;

// S3FileSystem

/** */
alias garrow_s3_file_system_get_type = c_garrow_s3_file_system_get_type;

// S3GlobalOptions

/** */
alias garrow_s3_global_options_get_type = c_garrow_s3_global_options_get_type;

/** */
alias garrow_s3_global_options_new = c_garrow_s3_global_options_new;

// Scalar

/** */
alias garrow_scalar_get_type = c_garrow_scalar_get_type;

/** */
alias garrow_scalar_parse = c_garrow_scalar_parse;

/** */
alias garrow_scalar_cast = c_garrow_scalar_cast;

/** */
alias garrow_scalar_equal = c_garrow_scalar_equal;

/** */
alias garrow_scalar_equal_options = c_garrow_scalar_equal_options;

/** */
alias garrow_scalar_get_data_type = c_garrow_scalar_get_data_type;

/** */
alias garrow_scalar_is_valid = c_garrow_scalar_is_valid;

/** */
alias garrow_scalar_to_string = c_garrow_scalar_to_string;

// ScalarAggregateOptions

/** */
alias garrow_scalar_aggregate_options_get_type = c_garrow_scalar_aggregate_options_get_type;

/** */
alias garrow_scalar_aggregate_options_new = c_garrow_scalar_aggregate_options_new;

// ScalarDatum

/** */
alias garrow_scalar_datum_get_type = c_garrow_scalar_datum_get_type;

/** */
alias garrow_scalar_datum_new = c_garrow_scalar_datum_new;

// Schema

/** */
alias garrow_schema_get_type = c_garrow_schema_get_type;

/** */
alias garrow_schema_new = c_garrow_schema_new;

/** */
alias garrow_schema_import = c_garrow_schema_import;

/** */
alias garrow_schema_add_field = c_garrow_schema_add_field;

/** */
alias garrow_schema_equal = c_garrow_schema_equal;

/** */
alias garrow_schema_export = c_garrow_schema_export;

/** */
alias garrow_schema_get_field = c_garrow_schema_get_field;

/** */
alias garrow_schema_get_field_by_name = c_garrow_schema_get_field_by_name;

/** */
alias garrow_schema_get_field_index = c_garrow_schema_get_field_index;

/** */
alias garrow_schema_get_fields = c_garrow_schema_get_fields;

/** */
alias garrow_schema_get_metadata = c_garrow_schema_get_metadata;

/** */
alias garrow_schema_has_metadata = c_garrow_schema_has_metadata;

/** */
alias garrow_schema_n_fields = c_garrow_schema_n_fields;

/** */
alias garrow_schema_remove_field = c_garrow_schema_remove_field;

/** */
alias garrow_schema_replace_field = c_garrow_schema_replace_field;

/** */
alias garrow_schema_to_string = c_garrow_schema_to_string;

/** */
alias garrow_schema_to_string_metadata = c_garrow_schema_to_string_metadata;

/** */
alias garrow_schema_with_metadata = c_garrow_schema_with_metadata;

// SeekableInputStream

/** */
alias garrow_seekable_input_stream_get_type = c_garrow_seekable_input_stream_get_type;

/** */
alias garrow_seekable_input_stream_get_size = c_garrow_seekable_input_stream_get_size;

/** */
alias garrow_seekable_input_stream_get_support_zero_copy = c_garrow_seekable_input_stream_get_support_zero_copy;

/** */
alias garrow_seekable_input_stream_peek = c_garrow_seekable_input_stream_peek;

/** */
alias garrow_seekable_input_stream_read_at = c_garrow_seekable_input_stream_read_at;

/** */
alias garrow_seekable_input_stream_read_at_bytes = c_garrow_seekable_input_stream_read_at_bytes;

// SetLookupOptions

/** */
alias garrow_set_lookup_options_get_type = c_garrow_set_lookup_options_get_type;

/** */
alias garrow_set_lookup_options_new = c_garrow_set_lookup_options_new;

// SinkNodeOptions

/** */
alias garrow_sink_node_options_get_type = c_garrow_sink_node_options_get_type;

/** */
alias garrow_sink_node_options_new = c_garrow_sink_node_options_new;

/** */
alias garrow_sink_node_options_get_reader = c_garrow_sink_node_options_get_reader;

// SlowFileSystem

/** */
alias garrow_slow_file_system_get_type = c_garrow_slow_file_system_get_type;

/** */
alias garrow_slow_file_system_new_average_latency = c_garrow_slow_file_system_new_average_latency;

/** */
alias garrow_slow_file_system_new_average_latency_and_seed = c_garrow_slow_file_system_new_average_latency_and_seed;

// SortKey

/** */
alias garrow_sort_key_get_type = c_garrow_sort_key_get_type;

/** */
alias garrow_sort_key_new = c_garrow_sort_key_new;

/** */
alias garrow_sort_key_equal = c_garrow_sort_key_equal;

// SortOptions

/** */
alias garrow_sort_options_get_type = c_garrow_sort_options_get_type;

/** */
alias garrow_sort_options_new = c_garrow_sort_options_new;

/** */
alias garrow_sort_options_add_sort_key = c_garrow_sort_options_add_sort_key;

/** */
alias garrow_sort_options_equal = c_garrow_sort_options_equal;

/** */
alias garrow_sort_options_get_sort_keys = c_garrow_sort_options_get_sort_keys;

/** */
alias garrow_sort_options_set_sort_keys = c_garrow_sort_options_set_sort_keys;

// SourceNodeOptions

/** */
alias garrow_source_node_options_get_type = c_garrow_source_node_options_get_type;

/** */
alias garrow_source_node_options_new_record_batch = c_garrow_source_node_options_new_record_batch;

/** */
alias garrow_source_node_options_new_record_batch_reader = c_garrow_source_node_options_new_record_batch_reader;

/** */
alias garrow_source_node_options_new_table = c_garrow_source_node_options_new_table;

// SparseUnionArray

/** */
alias garrow_sparse_union_array_get_type = c_garrow_sparse_union_array_get_type;

/** */
alias garrow_sparse_union_array_new = c_garrow_sparse_union_array_new;

/** */
alias garrow_sparse_union_array_new_data_type = c_garrow_sparse_union_array_new_data_type;

// SparseUnionArrayBuilder

/** */
alias garrow_sparse_union_array_builder_get_type = c_garrow_sparse_union_array_builder_get_type;

/** */
alias garrow_sparse_union_array_builder_new = c_garrow_sparse_union_array_builder_new;

// SparseUnionDataType

/** */
alias garrow_sparse_union_data_type_get_type = c_garrow_sparse_union_data_type_get_type;

/** */
alias garrow_sparse_union_data_type_new = c_garrow_sparse_union_data_type_new;

// SparseUnionScalar

/** */
alias garrow_sparse_union_scalar_get_type = c_garrow_sparse_union_scalar_get_type;

/** */
alias garrow_sparse_union_scalar_new = c_garrow_sparse_union_scalar_new;

// SplitPatternOptions

/** */
alias garrow_split_pattern_options_get_type = c_garrow_split_pattern_options_get_type;

/** */
alias garrow_split_pattern_options_new = c_garrow_split_pattern_options_new;

// StreamDecoder

/** */
alias garrow_stream_decoder_get_type = c_garrow_stream_decoder_get_type;

/** */
alias garrow_stream_decoder_new = c_garrow_stream_decoder_new;

/** */
alias garrow_stream_decoder_consume_buffer = c_garrow_stream_decoder_consume_buffer;

/** */
alias garrow_stream_decoder_consume_bytes = c_garrow_stream_decoder_consume_bytes;

/** */
alias garrow_stream_decoder_get_next_required_size = c_garrow_stream_decoder_get_next_required_size;

/** */
alias garrow_stream_decoder_get_schema = c_garrow_stream_decoder_get_schema;

/** */
alias garrow_stream_decoder_reset = c_garrow_stream_decoder_reset;

// StreamListener

/** */
alias garrow_stream_listener_get_type = c_garrow_stream_listener_get_type;

/** */
alias garrow_stream_listener_on_eos = c_garrow_stream_listener_on_eos;

/** */
alias garrow_stream_listener_on_record_batch_decoded = c_garrow_stream_listener_on_record_batch_decoded;

/** */
alias garrow_stream_listener_on_schema_decoded = c_garrow_stream_listener_on_schema_decoded;

// StrftimeOptions

/** */
alias garrow_strftime_options_get_type = c_garrow_strftime_options_get_type;

/** */
alias garrow_strftime_options_new = c_garrow_strftime_options_new;

// StringArray

/** */
alias garrow_string_array_get_type = c_garrow_string_array_get_type;

/** */
alias garrow_string_array_new = c_garrow_string_array_new;

/** */
alias garrow_string_array_get_string = c_garrow_string_array_get_string;

// StringArrayBuilder

/** */
alias garrow_string_array_builder_get_type = c_garrow_string_array_builder_get_type;

/** */
alias garrow_string_array_builder_new = c_garrow_string_array_builder_new;

/** */
alias garrow_string_array_builder_append = c_garrow_string_array_builder_append;

/** */
alias garrow_string_array_builder_append_string = c_garrow_string_array_builder_append_string;

/** */
alias garrow_string_array_builder_append_string_len = c_garrow_string_array_builder_append_string_len;

/** */
alias garrow_string_array_builder_append_strings = c_garrow_string_array_builder_append_strings;

/** */
alias garrow_string_array_builder_append_value = c_garrow_string_array_builder_append_value;

/** */
alias garrow_string_array_builder_append_values = c_garrow_string_array_builder_append_values;

// StringDataType

/** */
alias garrow_string_data_type_get_type = c_garrow_string_data_type_get_type;

/** */
alias garrow_string_data_type_new = c_garrow_string_data_type_new;

// StringDictionaryArrayBuilder

/** */
alias garrow_string_dictionary_array_builder_get_type = c_garrow_string_dictionary_array_builder_get_type;

/** */
alias garrow_string_dictionary_array_builder_new = c_garrow_string_dictionary_array_builder_new;

/** */
alias garrow_string_dictionary_array_builder_append_array = c_garrow_string_dictionary_array_builder_append_array;

/** */
alias garrow_string_dictionary_array_builder_append_indices = c_garrow_string_dictionary_array_builder_append_indices;

/** */
alias garrow_string_dictionary_array_builder_append_null = c_garrow_string_dictionary_array_builder_append_null;

/** */
alias garrow_string_dictionary_array_builder_append_string = c_garrow_string_dictionary_array_builder_append_string;

/** */
alias garrow_string_dictionary_array_builder_finish_delta = c_garrow_string_dictionary_array_builder_finish_delta;

/** */
alias garrow_string_dictionary_array_builder_get_dictionary_length = c_garrow_string_dictionary_array_builder_get_dictionary_length;

/** */
alias garrow_string_dictionary_array_builder_insert_memo_values = c_garrow_string_dictionary_array_builder_insert_memo_values;

/** */
alias garrow_string_dictionary_array_builder_reset_full = c_garrow_string_dictionary_array_builder_reset_full;

// StringScalar

/** */
alias garrow_string_scalar_get_type = c_garrow_string_scalar_get_type;

/** */
alias garrow_string_scalar_new = c_garrow_string_scalar_new;

// StringViewDataType

/** */
alias garrow_string_view_data_type_get_type = c_garrow_string_view_data_type_get_type;

/** */
alias garrow_string_view_data_type_new = c_garrow_string_view_data_type_new;

// StrptimeOptions

/** */
alias garrow_strptime_options_get_type = c_garrow_strptime_options_get_type;

/** */
alias garrow_strptime_options_new = c_garrow_strptime_options_new;

// StrptimeTimestampParser

/** */
alias garrow_strptime_timestamp_parser_get_type = c_garrow_strptime_timestamp_parser_get_type;

/** */
alias garrow_strptime_timestamp_parser_new = c_garrow_strptime_timestamp_parser_new;

/** */
alias garrow_strptime_timestamp_parser_get_format = c_garrow_strptime_timestamp_parser_get_format;

// StructArray

/** */
alias garrow_struct_array_get_type = c_garrow_struct_array_get_type;

/** */
alias garrow_struct_array_new = c_garrow_struct_array_new;

/** */
alias garrow_struct_array_flatten = c_garrow_struct_array_flatten;

/** */
alias garrow_struct_array_get_field = c_garrow_struct_array_get_field;

/** */
alias garrow_struct_array_get_fields = c_garrow_struct_array_get_fields;

// StructArrayBuilder

/** */
alias garrow_struct_array_builder_get_type = c_garrow_struct_array_builder_get_type;

/** */
alias garrow_struct_array_builder_new = c_garrow_struct_array_builder_new;

/** */
alias garrow_struct_array_builder_append = c_garrow_struct_array_builder_append;

/** */
alias garrow_struct_array_builder_append_null = c_garrow_struct_array_builder_append_null;

/** */
alias garrow_struct_array_builder_append_value = c_garrow_struct_array_builder_append_value;

/** */
alias garrow_struct_array_builder_get_field_builder = c_garrow_struct_array_builder_get_field_builder;

/** */
alias garrow_struct_array_builder_get_field_builders = c_garrow_struct_array_builder_get_field_builders;

// StructDataType

/** */
alias garrow_struct_data_type_get_type = c_garrow_struct_data_type_get_type;

/** */
alias garrow_struct_data_type_new = c_garrow_struct_data_type_new;

/** */
alias garrow_struct_data_type_get_field = c_garrow_struct_data_type_get_field;

/** */
alias garrow_struct_data_type_get_field_by_name = c_garrow_struct_data_type_get_field_by_name;

/** */
alias garrow_struct_data_type_get_field_index = c_garrow_struct_data_type_get_field_index;

/** */
alias garrow_struct_data_type_get_fields = c_garrow_struct_data_type_get_fields;

/** */
alias garrow_struct_data_type_get_n_fields = c_garrow_struct_data_type_get_n_fields;

// StructFieldOptions

/** */
alias garrow_struct_field_options_get_type = c_garrow_struct_field_options_get_type;

/** */
alias garrow_struct_field_options_new = c_garrow_struct_field_options_new;

/** */
alias garrow_struct_field_options_set_field_ref = c_garrow_struct_field_options_set_field_ref;

// StructScalar

/** */
alias garrow_struct_scalar_get_type = c_garrow_struct_scalar_get_type;

/** */
alias garrow_struct_scalar_new = c_garrow_struct_scalar_new;

/** */
alias garrow_struct_scalar_get_value = c_garrow_struct_scalar_get_value;

// SubTreeFileSystem

/** */
alias garrow_sub_tree_file_system_get_type = c_garrow_sub_tree_file_system_get_type;

/** */
alias garrow_sub_tree_file_system_new = c_garrow_sub_tree_file_system_new;

// Table

/** */
alias garrow_table_get_type = c_garrow_table_get_type;

/** */
alias garrow_table_new_arrays = c_garrow_table_new_arrays;

/** */
alias garrow_table_new_chunked_arrays = c_garrow_table_new_chunked_arrays;

/** */
alias garrow_table_new_record_batches = c_garrow_table_new_record_batches;

/** */
alias garrow_table_new_values = c_garrow_table_new_values;

/** */
alias garrow_table_add_column = c_garrow_table_add_column;

/** */
alias garrow_table_combine_chunks = c_garrow_table_combine_chunks;

/** */
alias garrow_table_concatenate = c_garrow_table_concatenate;

/** */
alias garrow_table_equal = c_garrow_table_equal;

/** */
alias garrow_table_equal_metadata = c_garrow_table_equal_metadata;

/** */
alias garrow_table_filter = c_garrow_table_filter;

/** */
alias garrow_table_filter_chunked_array = c_garrow_table_filter_chunked_array;

/** */
alias garrow_table_get_column_data = c_garrow_table_get_column_data;

/** */
alias garrow_table_get_n_columns = c_garrow_table_get_n_columns;

/** */
alias garrow_table_get_n_rows = c_garrow_table_get_n_rows;

/** */
alias garrow_table_get_schema = c_garrow_table_get_schema;

/** */
alias garrow_table_remove_column = c_garrow_table_remove_column;

/** */
alias garrow_table_replace_column = c_garrow_table_replace_column;

/** */
alias garrow_table_slice = c_garrow_table_slice;

/** */
alias garrow_table_sort_indices = c_garrow_table_sort_indices;

/** */
alias garrow_table_take = c_garrow_table_take;

/** */
alias garrow_table_take_chunked_array = c_garrow_table_take_chunked_array;

/** */
alias garrow_table_to_string = c_garrow_table_to_string;

/** */
alias garrow_table_write_as_feather = c_garrow_table_write_as_feather;

// TableBatchReader

/** */
alias garrow_table_batch_reader_get_type = c_garrow_table_batch_reader_get_type;

/** */
alias garrow_table_batch_reader_new = c_garrow_table_batch_reader_new;

/** */
alias garrow_table_batch_reader_set_max_chunk_size = c_garrow_table_batch_reader_set_max_chunk_size;

// TableConcatenateOptions

/** */
alias garrow_table_concatenate_options_get_type = c_garrow_table_concatenate_options_get_type;

/** */
alias garrow_table_concatenate_options_new = c_garrow_table_concatenate_options_new;

// TableDatum

/** */
alias garrow_table_datum_get_type = c_garrow_table_datum_get_type;

/** */
alias garrow_table_datum_new = c_garrow_table_datum_new;

// TakeOptions

/** */
alias garrow_take_options_get_type = c_garrow_take_options_get_type;

/** */
alias garrow_take_options_new = c_garrow_take_options_new;

// TemporalDataType

/** */
alias garrow_temporal_data_type_get_type = c_garrow_temporal_data_type_get_type;

// Tensor

/** */
alias garrow_tensor_get_type = c_garrow_tensor_get_type;

/** */
alias garrow_tensor_new = c_garrow_tensor_new;

/** */
alias garrow_tensor_equal = c_garrow_tensor_equal;

/** */
alias garrow_tensor_get_buffer = c_garrow_tensor_get_buffer;

/** */
alias garrow_tensor_get_dimension_name = c_garrow_tensor_get_dimension_name;

/** */
alias garrow_tensor_get_n_dimensions = c_garrow_tensor_get_n_dimensions;

/** */
alias garrow_tensor_get_shape = c_garrow_tensor_get_shape;

/** */
alias garrow_tensor_get_size = c_garrow_tensor_get_size;

/** */
alias garrow_tensor_get_strides = c_garrow_tensor_get_strides;

/** */
alias garrow_tensor_get_value_data_type = c_garrow_tensor_get_value_data_type;

/** */
alias garrow_tensor_get_value_type = c_garrow_tensor_get_value_type;

/** */
alias garrow_tensor_is_column_major = c_garrow_tensor_is_column_major;

/** */
alias garrow_tensor_is_contiguous = c_garrow_tensor_is_contiguous;

/** */
alias garrow_tensor_is_mutable = c_garrow_tensor_is_mutable;

/** */
alias garrow_tensor_is_row_major = c_garrow_tensor_is_row_major;

// Time32Array

/** */
alias garrow_time32_array_get_type = c_garrow_time32_array_get_type;

/** */
alias garrow_time32_array_new = c_garrow_time32_array_new;

/** */
alias garrow_time32_array_get_value = c_garrow_time32_array_get_value;

/** */
alias garrow_time32_array_get_values = c_garrow_time32_array_get_values;

// Time32ArrayBuilder

/** */
alias garrow_time32_array_builder_get_type = c_garrow_time32_array_builder_get_type;

/** */
alias garrow_time32_array_builder_new = c_garrow_time32_array_builder_new;

/** */
alias garrow_time32_array_builder_append = c_garrow_time32_array_builder_append;

/** */
alias garrow_time32_array_builder_append_null = c_garrow_time32_array_builder_append_null;

/** */
alias garrow_time32_array_builder_append_nulls = c_garrow_time32_array_builder_append_nulls;

/** */
alias garrow_time32_array_builder_append_value = c_garrow_time32_array_builder_append_value;

/** */
alias garrow_time32_array_builder_append_values = c_garrow_time32_array_builder_append_values;

// Time32DataType

/** */
alias garrow_time32_data_type_get_type = c_garrow_time32_data_type_get_type;

/** */
alias garrow_time32_data_type_new = c_garrow_time32_data_type_new;

// Time32Scalar

/** */
alias garrow_time32_scalar_get_type = c_garrow_time32_scalar_get_type;

/** */
alias garrow_time32_scalar_new = c_garrow_time32_scalar_new;

/** */
alias garrow_time32_scalar_get_value = c_garrow_time32_scalar_get_value;

// Time64Array

/** */
alias garrow_time64_array_get_type = c_garrow_time64_array_get_type;

/** */
alias garrow_time64_array_new = c_garrow_time64_array_new;

/** */
alias garrow_time64_array_get_value = c_garrow_time64_array_get_value;

/** */
alias garrow_time64_array_get_values = c_garrow_time64_array_get_values;

// Time64ArrayBuilder

/** */
alias garrow_time64_array_builder_get_type = c_garrow_time64_array_builder_get_type;

/** */
alias garrow_time64_array_builder_new = c_garrow_time64_array_builder_new;

/** */
alias garrow_time64_array_builder_append = c_garrow_time64_array_builder_append;

/** */
alias garrow_time64_array_builder_append_null = c_garrow_time64_array_builder_append_null;

/** */
alias garrow_time64_array_builder_append_nulls = c_garrow_time64_array_builder_append_nulls;

/** */
alias garrow_time64_array_builder_append_value = c_garrow_time64_array_builder_append_value;

/** */
alias garrow_time64_array_builder_append_values = c_garrow_time64_array_builder_append_values;

// Time64DataType

/** */
alias garrow_time64_data_type_get_type = c_garrow_time64_data_type_get_type;

/** */
alias garrow_time64_data_type_new = c_garrow_time64_data_type_new;

// Time64Scalar

/** */
alias garrow_time64_scalar_get_type = c_garrow_time64_scalar_get_type;

/** */
alias garrow_time64_scalar_new = c_garrow_time64_scalar_new;

/** */
alias garrow_time64_scalar_get_value = c_garrow_time64_scalar_get_value;

// TimeDataType

/** */
alias garrow_time_data_type_get_type = c_garrow_time_data_type_get_type;

/** */
alias garrow_time_data_type_get_unit = c_garrow_time_data_type_get_unit;

// TimestampArray

/** */
alias garrow_timestamp_array_get_type = c_garrow_timestamp_array_get_type;

/** */
alias garrow_timestamp_array_new = c_garrow_timestamp_array_new;

/** */
alias garrow_timestamp_array_get_value = c_garrow_timestamp_array_get_value;

/** */
alias garrow_timestamp_array_get_values = c_garrow_timestamp_array_get_values;

// TimestampArrayBuilder

/** */
alias garrow_timestamp_array_builder_get_type = c_garrow_timestamp_array_builder_get_type;

/** */
alias garrow_timestamp_array_builder_new = c_garrow_timestamp_array_builder_new;

/** */
alias garrow_timestamp_array_builder_append = c_garrow_timestamp_array_builder_append;

/** */
alias garrow_timestamp_array_builder_append_null = c_garrow_timestamp_array_builder_append_null;

/** */
alias garrow_timestamp_array_builder_append_nulls = c_garrow_timestamp_array_builder_append_nulls;

/** */
alias garrow_timestamp_array_builder_append_value = c_garrow_timestamp_array_builder_append_value;

/** */
alias garrow_timestamp_array_builder_append_values = c_garrow_timestamp_array_builder_append_values;

// TimestampDataType

/** */
alias garrow_timestamp_data_type_get_type = c_garrow_timestamp_data_type_get_type;

/** */
alias garrow_timestamp_data_type_new = c_garrow_timestamp_data_type_new;

/** */
alias garrow_timestamp_data_type_get_unit = c_garrow_timestamp_data_type_get_unit;

// TimestampParser

/** */
alias garrow_timestamp_parser_get_type = c_garrow_timestamp_parser_get_type;

/** */
alias garrow_timestamp_parser_get_kind = c_garrow_timestamp_parser_get_kind;

// TimestampScalar

/** */
alias garrow_timestamp_scalar_get_type = c_garrow_timestamp_scalar_get_type;

/** */
alias garrow_timestamp_scalar_new = c_garrow_timestamp_scalar_new;

/** */
alias garrow_timestamp_scalar_get_value = c_garrow_timestamp_scalar_get_value;

// UInt16Array

/** */
alias garrow_uint16_array_get_type = c_garrow_uint16_array_get_type;

/** */
alias garrow_uint16_array_new = c_garrow_uint16_array_new;

/** */
alias garrow_uint16_array_get_value = c_garrow_uint16_array_get_value;

/** */
alias garrow_uint16_array_get_values = c_garrow_uint16_array_get_values;

/** */
alias garrow_uint16_array_sum = c_garrow_uint16_array_sum;

// UInt16ArrayBuilder

/** */
alias garrow_uint16_array_builder_get_type = c_garrow_uint16_array_builder_get_type;

/** */
alias garrow_uint16_array_builder_new = c_garrow_uint16_array_builder_new;

/** */
alias garrow_uint16_array_builder_append = c_garrow_uint16_array_builder_append;

/** */
alias garrow_uint16_array_builder_append_null = c_garrow_uint16_array_builder_append_null;

/** */
alias garrow_uint16_array_builder_append_nulls = c_garrow_uint16_array_builder_append_nulls;

/** */
alias garrow_uint16_array_builder_append_value = c_garrow_uint16_array_builder_append_value;

/** */
alias garrow_uint16_array_builder_append_values = c_garrow_uint16_array_builder_append_values;

// UInt16DataType

/** */
alias garrow_uint16_data_type_get_type = c_garrow_uint16_data_type_get_type;

/** */
alias garrow_uint16_data_type_new = c_garrow_uint16_data_type_new;

// UInt16Scalar

/** */
alias garrow_uint16_scalar_get_type = c_garrow_uint16_scalar_get_type;

/** */
alias garrow_uint16_scalar_new = c_garrow_uint16_scalar_new;

/** */
alias garrow_uint16_scalar_get_value = c_garrow_uint16_scalar_get_value;

// UInt32Array

/** */
alias garrow_uint32_array_get_type = c_garrow_uint32_array_get_type;

/** */
alias garrow_uint32_array_new = c_garrow_uint32_array_new;

/** */
alias garrow_uint32_array_get_value = c_garrow_uint32_array_get_value;

/** */
alias garrow_uint32_array_get_values = c_garrow_uint32_array_get_values;

/** */
alias garrow_uint32_array_sum = c_garrow_uint32_array_sum;

// UInt32ArrayBuilder

/** */
alias garrow_uint32_array_builder_get_type = c_garrow_uint32_array_builder_get_type;

/** */
alias garrow_uint32_array_builder_new = c_garrow_uint32_array_builder_new;

/** */
alias garrow_uint32_array_builder_append = c_garrow_uint32_array_builder_append;

/** */
alias garrow_uint32_array_builder_append_null = c_garrow_uint32_array_builder_append_null;

/** */
alias garrow_uint32_array_builder_append_nulls = c_garrow_uint32_array_builder_append_nulls;

/** */
alias garrow_uint32_array_builder_append_value = c_garrow_uint32_array_builder_append_value;

/** */
alias garrow_uint32_array_builder_append_values = c_garrow_uint32_array_builder_append_values;

// UInt32DataType

/** */
alias garrow_uint32_data_type_get_type = c_garrow_uint32_data_type_get_type;

/** */
alias garrow_uint32_data_type_new = c_garrow_uint32_data_type_new;

// UInt32Scalar

/** */
alias garrow_uint32_scalar_get_type = c_garrow_uint32_scalar_get_type;

/** */
alias garrow_uint32_scalar_new = c_garrow_uint32_scalar_new;

/** */
alias garrow_uint32_scalar_get_value = c_garrow_uint32_scalar_get_value;

// UInt64Array

/** */
alias garrow_uint64_array_get_type = c_garrow_uint64_array_get_type;

/** */
alias garrow_uint64_array_new = c_garrow_uint64_array_new;

/** */
alias garrow_uint64_array_get_value = c_garrow_uint64_array_get_value;

/** */
alias garrow_uint64_array_get_values = c_garrow_uint64_array_get_values;

/** */
alias garrow_uint64_array_sum = c_garrow_uint64_array_sum;

// UInt64ArrayBuilder

/** */
alias garrow_uint64_array_builder_get_type = c_garrow_uint64_array_builder_get_type;

/** */
alias garrow_uint64_array_builder_new = c_garrow_uint64_array_builder_new;

/** */
alias garrow_uint64_array_builder_append = c_garrow_uint64_array_builder_append;

/** */
alias garrow_uint64_array_builder_append_null = c_garrow_uint64_array_builder_append_null;

/** */
alias garrow_uint64_array_builder_append_nulls = c_garrow_uint64_array_builder_append_nulls;

/** */
alias garrow_uint64_array_builder_append_value = c_garrow_uint64_array_builder_append_value;

/** */
alias garrow_uint64_array_builder_append_values = c_garrow_uint64_array_builder_append_values;

// UInt64DataType

/** */
alias garrow_uint64_data_type_get_type = c_garrow_uint64_data_type_get_type;

/** */
alias garrow_uint64_data_type_new = c_garrow_uint64_data_type_new;

// UInt64Scalar

/** */
alias garrow_uint64_scalar_get_type = c_garrow_uint64_scalar_get_type;

/** */
alias garrow_uint64_scalar_new = c_garrow_uint64_scalar_new;

/** */
alias garrow_uint64_scalar_get_value = c_garrow_uint64_scalar_get_value;

// UInt8Array

/** */
alias garrow_uint8_array_get_type = c_garrow_uint8_array_get_type;

/** */
alias garrow_uint8_array_new = c_garrow_uint8_array_new;

/** */
alias garrow_uint8_array_get_value = c_garrow_uint8_array_get_value;

/** */
alias garrow_uint8_array_get_values = c_garrow_uint8_array_get_values;

/** */
alias garrow_uint8_array_sum = c_garrow_uint8_array_sum;

// UInt8ArrayBuilder

/** */
alias garrow_uint8_array_builder_get_type = c_garrow_uint8_array_builder_get_type;

/** */
alias garrow_uint8_array_builder_new = c_garrow_uint8_array_builder_new;

/** */
alias garrow_uint8_array_builder_append = c_garrow_uint8_array_builder_append;

/** */
alias garrow_uint8_array_builder_append_null = c_garrow_uint8_array_builder_append_null;

/** */
alias garrow_uint8_array_builder_append_nulls = c_garrow_uint8_array_builder_append_nulls;

/** */
alias garrow_uint8_array_builder_append_value = c_garrow_uint8_array_builder_append_value;

/** */
alias garrow_uint8_array_builder_append_values = c_garrow_uint8_array_builder_append_values;

// UInt8DataType

/** */
alias garrow_uint8_data_type_get_type = c_garrow_uint8_data_type_get_type;

/** */
alias garrow_uint8_data_type_new = c_garrow_uint8_data_type_new;

// UInt8Scalar

/** */
alias garrow_uint8_scalar_get_type = c_garrow_uint8_scalar_get_type;

/** */
alias garrow_uint8_scalar_new = c_garrow_uint8_scalar_new;

/** */
alias garrow_uint8_scalar_get_value = c_garrow_uint8_scalar_get_value;

// UIntArrayBuilder

/** */
alias garrow_uint_array_builder_get_type = c_garrow_uint_array_builder_get_type;

/** */
alias garrow_uint_array_builder_new = c_garrow_uint_array_builder_new;

/** */
alias garrow_uint_array_builder_append = c_garrow_uint_array_builder_append;

/** */
alias garrow_uint_array_builder_append_null = c_garrow_uint_array_builder_append_null;

/** */
alias garrow_uint_array_builder_append_nulls = c_garrow_uint_array_builder_append_nulls;

/** */
alias garrow_uint_array_builder_append_value = c_garrow_uint_array_builder_append_value;

/** */
alias garrow_uint_array_builder_append_values = c_garrow_uint_array_builder_append_values;

// UTF8NormalizeOptions

/** */
alias garrow_utf8_normalize_options_get_type = c_garrow_utf8_normalize_options_get_type;

/** */
alias garrow_utf8_normalize_options_new = c_garrow_utf8_normalize_options_new;

// UnionArray

/** */
alias garrow_union_array_get_type = c_garrow_union_array_get_type;

/** */
alias garrow_union_array_get_child_id = c_garrow_union_array_get_child_id;

/** */
alias garrow_union_array_get_field = c_garrow_union_array_get_field;

/** */
alias garrow_union_array_get_type_code = c_garrow_union_array_get_type_code;

// UnionArrayBuilder

/** */
alias garrow_union_array_builder_get_type = c_garrow_union_array_builder_get_type;

/** */
alias garrow_union_array_builder_append_child = c_garrow_union_array_builder_append_child;

/** */
alias garrow_union_array_builder_append_value = c_garrow_union_array_builder_append_value;

// UnionDataType

/** */
alias garrow_union_data_type_get_type = c_garrow_union_data_type_get_type;

/** */
alias garrow_union_data_type_get_field = c_garrow_union_data_type_get_field;

/** */
alias garrow_union_data_type_get_fields = c_garrow_union_data_type_get_fields;

/** */
alias garrow_union_data_type_get_n_fields = c_garrow_union_data_type_get_n_fields;

/** */
alias garrow_union_data_type_get_type_codes = c_garrow_union_data_type_get_type_codes;

// UnionScalar

/** */
alias garrow_union_scalar_get_type = c_garrow_union_scalar_get_type;

/** */
alias garrow_union_scalar_get_type_code = c_garrow_union_scalar_get_type_code;

/** */
alias garrow_union_scalar_get_value = c_garrow_union_scalar_get_value;

// VarianceOptions

/** */
alias garrow_variance_options_get_type = c_garrow_variance_options_get_type;

/** */
alias garrow_variance_options_new = c_garrow_variance_options_new;

// Writable

/** */
alias garrow_writable_get_type = c_garrow_writable_get_type;

/** */
alias garrow_writable_flush = c_garrow_writable_flush;

/** */
alias garrow_writable_write = c_garrow_writable_write;

// WritableFile

/** */
alias garrow_writable_file_get_type = c_garrow_writable_file_get_type;

/** */
alias garrow_writable_file_write_at = c_garrow_writable_file_write_at;

// WriteOptions

/** */
alias garrow_write_options_get_type = c_garrow_write_options_get_type;

/** */
alias garrow_write_options_new = c_garrow_write_options_new;

// global

/** */
alias garrow_s3_finalize = c_garrow_s3_finalize;

/** */
alias garrow_s3_initialize = c_garrow_s3_initialize;

/** */
alias garrow_s3_is_enabled = c_garrow_s3_is_enabled;

// Error

/** */
alias garrow_error_quark = c_garrow_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // AggregateNodeOptions
  gidLink(cast(void**)&garrow_aggregate_node_options_get_type, "garrow_aggregate_node_options_get_type", libs);
  gidLink(cast(void**)&garrow_aggregate_node_options_new, "garrow_aggregate_node_options_new", libs);

  // Aggregation
  gidLink(cast(void**)&garrow_aggregation_get_type, "garrow_aggregation_get_type", libs);
  gidLink(cast(void**)&garrow_aggregation_new, "garrow_aggregation_new", libs);

  // Array
  gidLink(cast(void**)&garrow_array_get_type, "garrow_array_get_type", libs);
  gidLink(cast(void**)&garrow_array_import, "garrow_array_import", libs);
  gidLink(cast(void**)&garrow_array_cast, "garrow_array_cast", libs);
  gidLink(cast(void**)&garrow_array_concatenate, "garrow_array_concatenate", libs);
  gidLink(cast(void**)&garrow_array_count, "garrow_array_count", libs);
  gidLink(cast(void**)&garrow_array_count_values, "garrow_array_count_values", libs);
  gidLink(cast(void**)&garrow_array_dictionary_encode, "garrow_array_dictionary_encode", libs);
  gidLink(cast(void**)&garrow_array_diff_unified, "garrow_array_diff_unified", libs);
  gidLink(cast(void**)&garrow_array_equal, "garrow_array_equal", libs);
  gidLink(cast(void**)&garrow_array_equal_approx, "garrow_array_equal_approx", libs);
  gidLink(cast(void**)&garrow_array_equal_options, "garrow_array_equal_options", libs);
  gidLink(cast(void**)&garrow_array_equal_range, "garrow_array_equal_range", libs);
  gidLink(cast(void**)&garrow_array_export, "garrow_array_export", libs);
  gidLink(cast(void**)&garrow_array_filter, "garrow_array_filter", libs);
  gidLink(cast(void**)&garrow_array_get_length, "garrow_array_get_length", libs);
  gidLink(cast(void**)&garrow_array_get_n_nulls, "garrow_array_get_n_nulls", libs);
  gidLink(cast(void**)&garrow_array_get_null_bitmap, "garrow_array_get_null_bitmap", libs);
  gidLink(cast(void**)&garrow_array_get_offset, "garrow_array_get_offset", libs);
  gidLink(cast(void**)&garrow_array_get_value_data_type, "garrow_array_get_value_data_type", libs);
  gidLink(cast(void**)&garrow_array_get_value_type, "garrow_array_get_value_type", libs);
  gidLink(cast(void**)&garrow_array_is_in, "garrow_array_is_in", libs);
  gidLink(cast(void**)&garrow_array_is_in_chunked_array, "garrow_array_is_in_chunked_array", libs);
  gidLink(cast(void**)&garrow_array_is_null, "garrow_array_is_null", libs);
  gidLink(cast(void**)&garrow_array_is_valid, "garrow_array_is_valid", libs);
  gidLink(cast(void**)&garrow_array_run_end_encode, "garrow_array_run_end_encode", libs);
  gidLink(cast(void**)&garrow_array_slice, "garrow_array_slice", libs);
  gidLink(cast(void**)&garrow_array_sort_indices, "garrow_array_sort_indices", libs);
  gidLink(cast(void**)&garrow_array_sort_to_indices, "garrow_array_sort_to_indices", libs);
  gidLink(cast(void**)&garrow_array_take, "garrow_array_take", libs);
  gidLink(cast(void**)&garrow_array_take_chunked_array, "garrow_array_take_chunked_array", libs);
  gidLink(cast(void**)&garrow_array_to_string, "garrow_array_to_string", libs);
  gidLink(cast(void**)&garrow_array_unique, "garrow_array_unique", libs);
  gidLink(cast(void**)&garrow_array_view, "garrow_array_view", libs);

  // ArrayBuilder
  gidLink(cast(void**)&garrow_array_builder_get_type, "garrow_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_array_builder_append_empty_value, "garrow_array_builder_append_empty_value", libs);
  gidLink(cast(void**)&garrow_array_builder_append_empty_values, "garrow_array_builder_append_empty_values", libs);
  gidLink(cast(void**)&garrow_array_builder_append_null, "garrow_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_array_builder_append_nulls, "garrow_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_array_builder_finish, "garrow_array_builder_finish", libs);
  gidLink(cast(void**)&garrow_array_builder_get_capacity, "garrow_array_builder_get_capacity", libs);
  gidLink(cast(void**)&garrow_array_builder_get_child, "garrow_array_builder_get_child", libs);
  gidLink(cast(void**)&garrow_array_builder_get_children, "garrow_array_builder_get_children", libs);
  gidLink(cast(void**)&garrow_array_builder_get_length, "garrow_array_builder_get_length", libs);
  gidLink(cast(void**)&garrow_array_builder_get_n_nulls, "garrow_array_builder_get_n_nulls", libs);
  gidLink(cast(void**)&garrow_array_builder_get_value_data_type, "garrow_array_builder_get_value_data_type", libs);
  gidLink(cast(void**)&garrow_array_builder_get_value_type, "garrow_array_builder_get_value_type", libs);
  gidLink(cast(void**)&garrow_array_builder_reserve, "garrow_array_builder_reserve", libs);
  gidLink(cast(void**)&garrow_array_builder_reset, "garrow_array_builder_reset", libs);
  gidLink(cast(void**)&garrow_array_builder_resize, "garrow_array_builder_resize", libs);

  // ArrayDatum
  gidLink(cast(void**)&garrow_array_datum_get_type, "garrow_array_datum_get_type", libs);
  gidLink(cast(void**)&garrow_array_datum_new, "garrow_array_datum_new", libs);

  // ArraySortOptions
  gidLink(cast(void**)&garrow_array_sort_options_get_type, "garrow_array_sort_options_get_type", libs);
  gidLink(cast(void**)&garrow_array_sort_options_new, "garrow_array_sort_options_new", libs);
  gidLink(cast(void**)&garrow_array_sort_options_equal, "garrow_array_sort_options_equal", libs);

  // AzureFileSystem
  gidLink(cast(void**)&garrow_azure_file_system_get_type, "garrow_azure_file_system_get_type", libs);

  // BaseBinaryScalar
  gidLink(cast(void**)&garrow_base_binary_scalar_get_type, "garrow_base_binary_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_base_binary_scalar_get_value, "garrow_base_binary_scalar_get_value", libs);

  // BaseListScalar
  gidLink(cast(void**)&garrow_base_list_scalar_get_type, "garrow_base_list_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_base_list_scalar_get_value, "garrow_base_list_scalar_get_value", libs);

  // BinaryArray
  gidLink(cast(void**)&garrow_binary_array_get_type, "garrow_binary_array_get_type", libs);
  gidLink(cast(void**)&garrow_binary_array_new, "garrow_binary_array_new", libs);
  gidLink(cast(void**)&garrow_binary_array_get_buffer, "garrow_binary_array_get_buffer", libs);
  gidLink(cast(void**)&garrow_binary_array_get_data_buffer, "garrow_binary_array_get_data_buffer", libs);
  gidLink(cast(void**)&garrow_binary_array_get_offsets_buffer, "garrow_binary_array_get_offsets_buffer", libs);
  gidLink(cast(void**)&garrow_binary_array_get_value, "garrow_binary_array_get_value", libs);

  // BinaryArrayBuilder
  gidLink(cast(void**)&garrow_binary_array_builder_get_type, "garrow_binary_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_binary_array_builder_new, "garrow_binary_array_builder_new", libs);
  gidLink(cast(void**)&garrow_binary_array_builder_append, "garrow_binary_array_builder_append", libs);
  gidLink(cast(void**)&garrow_binary_array_builder_append_null, "garrow_binary_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_binary_array_builder_append_nulls, "garrow_binary_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_binary_array_builder_append_value, "garrow_binary_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_binary_array_builder_append_value_bytes, "garrow_binary_array_builder_append_value_bytes", libs);
  gidLink(cast(void**)&garrow_binary_array_builder_append_values, "garrow_binary_array_builder_append_values", libs);

  // BinaryDataType
  gidLink(cast(void**)&garrow_binary_data_type_get_type, "garrow_binary_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_binary_data_type_new, "garrow_binary_data_type_new", libs);

  // BinaryDictionaryArrayBuilder
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_get_type, "garrow_binary_dictionary_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_new, "garrow_binary_dictionary_array_builder_new", libs);
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_append_array, "garrow_binary_dictionary_array_builder_append_array", libs);
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_append_indices, "garrow_binary_dictionary_array_builder_append_indices", libs);
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_append_null, "garrow_binary_dictionary_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_append_value, "garrow_binary_dictionary_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_append_value_bytes, "garrow_binary_dictionary_array_builder_append_value_bytes", libs);
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_finish_delta, "garrow_binary_dictionary_array_builder_finish_delta", libs);
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_get_dictionary_length, "garrow_binary_dictionary_array_builder_get_dictionary_length", libs);
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_insert_memo_values, "garrow_binary_dictionary_array_builder_insert_memo_values", libs);
  gidLink(cast(void**)&garrow_binary_dictionary_array_builder_reset_full, "garrow_binary_dictionary_array_builder_reset_full", libs);

  // BinaryScalar
  gidLink(cast(void**)&garrow_binary_scalar_get_type, "garrow_binary_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_binary_scalar_new, "garrow_binary_scalar_new", libs);

  // BinaryViewDataType
  gidLink(cast(void**)&garrow_binary_view_data_type_get_type, "garrow_binary_view_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_binary_view_data_type_new, "garrow_binary_view_data_type_new", libs);

  // BooleanArray
  gidLink(cast(void**)&garrow_boolean_array_get_type, "garrow_boolean_array_get_type", libs);
  gidLink(cast(void**)&garrow_boolean_array_new, "garrow_boolean_array_new", libs);
  gidLink(cast(void**)&garrow_boolean_array_and, "garrow_boolean_array_and", libs);
  gidLink(cast(void**)&garrow_boolean_array_get_value, "garrow_boolean_array_get_value", libs);
  gidLink(cast(void**)&garrow_boolean_array_get_values, "garrow_boolean_array_get_values", libs);
  gidLink(cast(void**)&garrow_boolean_array_invert, "garrow_boolean_array_invert", libs);
  gidLink(cast(void**)&garrow_boolean_array_or, "garrow_boolean_array_or", libs);
  gidLink(cast(void**)&garrow_boolean_array_xor, "garrow_boolean_array_xor", libs);

  // BooleanArrayBuilder
  gidLink(cast(void**)&garrow_boolean_array_builder_get_type, "garrow_boolean_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_boolean_array_builder_new, "garrow_boolean_array_builder_new", libs);
  gidLink(cast(void**)&garrow_boolean_array_builder_append, "garrow_boolean_array_builder_append", libs);
  gidLink(cast(void**)&garrow_boolean_array_builder_append_null, "garrow_boolean_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_boolean_array_builder_append_nulls, "garrow_boolean_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_boolean_array_builder_append_value, "garrow_boolean_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_boolean_array_builder_append_values, "garrow_boolean_array_builder_append_values", libs);

  // BooleanDataType
  gidLink(cast(void**)&garrow_boolean_data_type_get_type, "garrow_boolean_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_boolean_data_type_new, "garrow_boolean_data_type_new", libs);

  // BooleanScalar
  gidLink(cast(void**)&garrow_boolean_scalar_get_type, "garrow_boolean_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_boolean_scalar_new, "garrow_boolean_scalar_new", libs);
  gidLink(cast(void**)&garrow_boolean_scalar_get_value, "garrow_boolean_scalar_get_value", libs);

  // Buffer
  gidLink(cast(void**)&garrow_buffer_get_type, "garrow_buffer_get_type", libs);
  gidLink(cast(void**)&garrow_buffer_new, "garrow_buffer_new", libs);
  gidLink(cast(void**)&garrow_buffer_new_bytes, "garrow_buffer_new_bytes", libs);
  gidLink(cast(void**)&garrow_buffer_copy, "garrow_buffer_copy", libs);
  gidLink(cast(void**)&garrow_buffer_equal, "garrow_buffer_equal", libs);
  gidLink(cast(void**)&garrow_buffer_equal_n_bytes, "garrow_buffer_equal_n_bytes", libs);
  gidLink(cast(void**)&garrow_buffer_get_capacity, "garrow_buffer_get_capacity", libs);
  gidLink(cast(void**)&garrow_buffer_get_data, "garrow_buffer_get_data", libs);
  gidLink(cast(void**)&garrow_buffer_get_mutable_data, "garrow_buffer_get_mutable_data", libs);
  gidLink(cast(void**)&garrow_buffer_get_parent, "garrow_buffer_get_parent", libs);
  gidLink(cast(void**)&garrow_buffer_get_size, "garrow_buffer_get_size", libs);
  gidLink(cast(void**)&garrow_buffer_is_mutable, "garrow_buffer_is_mutable", libs);
  gidLink(cast(void**)&garrow_buffer_slice, "garrow_buffer_slice", libs);

  // BufferInputStream
  gidLink(cast(void**)&garrow_buffer_input_stream_get_type, "garrow_buffer_input_stream_get_type", libs);
  gidLink(cast(void**)&garrow_buffer_input_stream_new, "garrow_buffer_input_stream_new", libs);
  gidLink(cast(void**)&garrow_buffer_input_stream_get_buffer, "garrow_buffer_input_stream_get_buffer", libs);

  // BufferOutputStream
  gidLink(cast(void**)&garrow_buffer_output_stream_get_type, "garrow_buffer_output_stream_get_type", libs);
  gidLink(cast(void**)&garrow_buffer_output_stream_new, "garrow_buffer_output_stream_new", libs);

  // CSVReadOptions
  gidLink(cast(void**)&garrow_csv_read_options_get_type, "garrow_csv_read_options_get_type", libs);
  gidLink(cast(void**)&garrow_csv_read_options_new, "garrow_csv_read_options_new", libs);
  gidLink(cast(void**)&garrow_csv_read_options_add_column_name, "garrow_csv_read_options_add_column_name", libs);
  gidLink(cast(void**)&garrow_csv_read_options_add_column_type, "garrow_csv_read_options_add_column_type", libs);
  gidLink(cast(void**)&garrow_csv_read_options_add_false_value, "garrow_csv_read_options_add_false_value", libs);
  gidLink(cast(void**)&garrow_csv_read_options_add_null_value, "garrow_csv_read_options_add_null_value", libs);
  gidLink(cast(void**)&garrow_csv_read_options_add_schema, "garrow_csv_read_options_add_schema", libs);
  gidLink(cast(void**)&garrow_csv_read_options_add_timestamp_parser, "garrow_csv_read_options_add_timestamp_parser", libs);
  gidLink(cast(void**)&garrow_csv_read_options_add_true_value, "garrow_csv_read_options_add_true_value", libs);
  gidLink(cast(void**)&garrow_csv_read_options_get_column_names, "garrow_csv_read_options_get_column_names", libs);
  gidLink(cast(void**)&garrow_csv_read_options_get_column_types, "garrow_csv_read_options_get_column_types", libs);
  gidLink(cast(void**)&garrow_csv_read_options_get_false_values, "garrow_csv_read_options_get_false_values", libs);
  gidLink(cast(void**)&garrow_csv_read_options_get_null_values, "garrow_csv_read_options_get_null_values", libs);
  gidLink(cast(void**)&garrow_csv_read_options_get_timestamp_parsers, "garrow_csv_read_options_get_timestamp_parsers", libs);
  gidLink(cast(void**)&garrow_csv_read_options_get_true_values, "garrow_csv_read_options_get_true_values", libs);
  gidLink(cast(void**)&garrow_csv_read_options_set_column_names, "garrow_csv_read_options_set_column_names", libs);
  gidLink(cast(void**)&garrow_csv_read_options_set_false_values, "garrow_csv_read_options_set_false_values", libs);
  gidLink(cast(void**)&garrow_csv_read_options_set_null_values, "garrow_csv_read_options_set_null_values", libs);
  gidLink(cast(void**)&garrow_csv_read_options_set_timestamp_parsers, "garrow_csv_read_options_set_timestamp_parsers", libs);
  gidLink(cast(void**)&garrow_csv_read_options_set_true_values, "garrow_csv_read_options_set_true_values", libs);

  // CSVReader
  gidLink(cast(void**)&garrow_csv_reader_get_type, "garrow_csv_reader_get_type", libs);
  gidLink(cast(void**)&garrow_csv_reader_new, "garrow_csv_reader_new", libs);
  gidLink(cast(void**)&garrow_csv_reader_read, "garrow_csv_reader_read", libs);

  // CallExpression
  gidLink(cast(void**)&garrow_call_expression_get_type, "garrow_call_expression_get_type", libs);
  gidLink(cast(void**)&garrow_call_expression_new, "garrow_call_expression_new", libs);

  // CastOptions
  gidLink(cast(void**)&garrow_cast_options_get_type, "garrow_cast_options_get_type", libs);
  gidLink(cast(void**)&garrow_cast_options_new, "garrow_cast_options_new", libs);

  // ChunkedArray
  gidLink(cast(void**)&garrow_chunked_array_get_type, "garrow_chunked_array_get_type", libs);
  gidLink(cast(void**)&garrow_chunked_array_new, "garrow_chunked_array_new", libs);
  gidLink(cast(void**)&garrow_chunked_array_new_empty, "garrow_chunked_array_new_empty", libs);
  gidLink(cast(void**)&garrow_chunked_array_combine, "garrow_chunked_array_combine", libs);
  gidLink(cast(void**)&garrow_chunked_array_equal, "garrow_chunked_array_equal", libs);
  gidLink(cast(void**)&garrow_chunked_array_filter, "garrow_chunked_array_filter", libs);
  gidLink(cast(void**)&garrow_chunked_array_filter_chunked_array, "garrow_chunked_array_filter_chunked_array", libs);
  gidLink(cast(void**)&garrow_chunked_array_get_chunk, "garrow_chunked_array_get_chunk", libs);
  gidLink(cast(void**)&garrow_chunked_array_get_chunks, "garrow_chunked_array_get_chunks", libs);
  gidLink(cast(void**)&garrow_chunked_array_get_length, "garrow_chunked_array_get_length", libs);
  gidLink(cast(void**)&garrow_chunked_array_get_n_chunks, "garrow_chunked_array_get_n_chunks", libs);
  gidLink(cast(void**)&garrow_chunked_array_get_n_nulls, "garrow_chunked_array_get_n_nulls", libs);
  gidLink(cast(void**)&garrow_chunked_array_get_n_rows, "garrow_chunked_array_get_n_rows", libs);
  gidLink(cast(void**)&garrow_chunked_array_get_value_data_type, "garrow_chunked_array_get_value_data_type", libs);
  gidLink(cast(void**)&garrow_chunked_array_get_value_type, "garrow_chunked_array_get_value_type", libs);
  gidLink(cast(void**)&garrow_chunked_array_slice, "garrow_chunked_array_slice", libs);
  gidLink(cast(void**)&garrow_chunked_array_sort_indices, "garrow_chunked_array_sort_indices", libs);
  gidLink(cast(void**)&garrow_chunked_array_take, "garrow_chunked_array_take", libs);
  gidLink(cast(void**)&garrow_chunked_array_take_chunked_array, "garrow_chunked_array_take_chunked_array", libs);
  gidLink(cast(void**)&garrow_chunked_array_to_string, "garrow_chunked_array_to_string", libs);

  // ChunkedArrayDatum
  gidLink(cast(void**)&garrow_chunked_array_datum_get_type, "garrow_chunked_array_datum_get_type", libs);
  gidLink(cast(void**)&garrow_chunked_array_datum_new, "garrow_chunked_array_datum_new", libs);

  // Codec
  gidLink(cast(void**)&garrow_codec_get_type, "garrow_codec_get_type", libs);
  gidLink(cast(void**)&garrow_codec_new, "garrow_codec_new", libs);
  gidLink(cast(void**)&garrow_codec_get_compression_level, "garrow_codec_get_compression_level", libs);
  gidLink(cast(void**)&garrow_codec_get_compression_type, "garrow_codec_get_compression_type", libs);
  gidLink(cast(void**)&garrow_codec_get_name, "garrow_codec_get_name", libs);

  // CompressedInputStream
  gidLink(cast(void**)&garrow_compressed_input_stream_get_type, "garrow_compressed_input_stream_get_type", libs);
  gidLink(cast(void**)&garrow_compressed_input_stream_new, "garrow_compressed_input_stream_new", libs);

  // CompressedOutputStream
  gidLink(cast(void**)&garrow_compressed_output_stream_get_type, "garrow_compressed_output_stream_get_type", libs);
  gidLink(cast(void**)&garrow_compressed_output_stream_new, "garrow_compressed_output_stream_new", libs);

  // CountOptions
  gidLink(cast(void**)&garrow_count_options_get_type, "garrow_count_options_get_type", libs);
  gidLink(cast(void**)&garrow_count_options_new, "garrow_count_options_new", libs);

  // DataType
  gidLink(cast(void**)&garrow_data_type_get_type, "garrow_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_data_type_import, "garrow_data_type_import", libs);
  gidLink(cast(void**)&garrow_data_type_equal, "garrow_data_type_equal", libs);
  gidLink(cast(void**)&garrow_data_type_export, "garrow_data_type_export", libs);
  gidLink(cast(void**)&garrow_data_type_get_id, "garrow_data_type_get_id", libs);
  gidLink(cast(void**)&garrow_data_type_get_name, "garrow_data_type_get_name", libs);
  gidLink(cast(void**)&garrow_data_type_to_string, "garrow_data_type_to_string", libs);

  // Date32Array
  gidLink(cast(void**)&garrow_date32_array_get_type, "garrow_date32_array_get_type", libs);
  gidLink(cast(void**)&garrow_date32_array_new, "garrow_date32_array_new", libs);
  gidLink(cast(void**)&garrow_date32_array_get_value, "garrow_date32_array_get_value", libs);
  gidLink(cast(void**)&garrow_date32_array_get_values, "garrow_date32_array_get_values", libs);

  // Date32ArrayBuilder
  gidLink(cast(void**)&garrow_date32_array_builder_get_type, "garrow_date32_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_date32_array_builder_new, "garrow_date32_array_builder_new", libs);
  gidLink(cast(void**)&garrow_date32_array_builder_append, "garrow_date32_array_builder_append", libs);
  gidLink(cast(void**)&garrow_date32_array_builder_append_null, "garrow_date32_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_date32_array_builder_append_nulls, "garrow_date32_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_date32_array_builder_append_value, "garrow_date32_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_date32_array_builder_append_values, "garrow_date32_array_builder_append_values", libs);

  // Date32DataType
  gidLink(cast(void**)&garrow_date32_data_type_get_type, "garrow_date32_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_date32_data_type_new, "garrow_date32_data_type_new", libs);

  // Date32Scalar
  gidLink(cast(void**)&garrow_date32_scalar_get_type, "garrow_date32_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_date32_scalar_new, "garrow_date32_scalar_new", libs);
  gidLink(cast(void**)&garrow_date32_scalar_get_value, "garrow_date32_scalar_get_value", libs);

  // Date64Array
  gidLink(cast(void**)&garrow_date64_array_get_type, "garrow_date64_array_get_type", libs);
  gidLink(cast(void**)&garrow_date64_array_new, "garrow_date64_array_new", libs);
  gidLink(cast(void**)&garrow_date64_array_get_value, "garrow_date64_array_get_value", libs);
  gidLink(cast(void**)&garrow_date64_array_get_values, "garrow_date64_array_get_values", libs);

  // Date64ArrayBuilder
  gidLink(cast(void**)&garrow_date64_array_builder_get_type, "garrow_date64_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_date64_array_builder_new, "garrow_date64_array_builder_new", libs);
  gidLink(cast(void**)&garrow_date64_array_builder_append, "garrow_date64_array_builder_append", libs);
  gidLink(cast(void**)&garrow_date64_array_builder_append_null, "garrow_date64_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_date64_array_builder_append_nulls, "garrow_date64_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_date64_array_builder_append_value, "garrow_date64_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_date64_array_builder_append_values, "garrow_date64_array_builder_append_values", libs);

  // Date64DataType
  gidLink(cast(void**)&garrow_date64_data_type_get_type, "garrow_date64_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_date64_data_type_new, "garrow_date64_data_type_new", libs);

  // Date64Scalar
  gidLink(cast(void**)&garrow_date64_scalar_get_type, "garrow_date64_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_date64_scalar_new, "garrow_date64_scalar_new", libs);
  gidLink(cast(void**)&garrow_date64_scalar_get_value, "garrow_date64_scalar_get_value", libs);

  // Datum
  gidLink(cast(void**)&garrow_datum_get_type, "garrow_datum_get_type", libs);
  gidLink(cast(void**)&garrow_datum_equal, "garrow_datum_equal", libs);
  gidLink(cast(void**)&garrow_datum_is_array, "garrow_datum_is_array", libs);
  gidLink(cast(void**)&garrow_datum_is_array_like, "garrow_datum_is_array_like", libs);
  gidLink(cast(void**)&garrow_datum_is_scalar, "garrow_datum_is_scalar", libs);
  gidLink(cast(void**)&garrow_datum_is_value, "garrow_datum_is_value", libs);
  gidLink(cast(void**)&garrow_datum_to_string, "garrow_datum_to_string", libs);

  // DayMillisecond
  gidLink(cast(void**)&garrow_day_millisecond_get_type, "garrow_day_millisecond_get_type", libs);
  gidLink(cast(void**)&garrow_day_millisecond_new, "garrow_day_millisecond_new", libs);
  gidLink(cast(void**)&garrow_day_millisecond_equal, "garrow_day_millisecond_equal", libs);
  gidLink(cast(void**)&garrow_day_millisecond_less_than, "garrow_day_millisecond_less_than", libs);

  // DayTimeIntervalArray
  gidLink(cast(void**)&garrow_day_time_interval_array_get_type, "garrow_day_time_interval_array_get_type", libs);
  gidLink(cast(void**)&garrow_day_time_interval_array_new, "garrow_day_time_interval_array_new", libs);
  gidLink(cast(void**)&garrow_day_time_interval_array_get_value, "garrow_day_time_interval_array_get_value", libs);
  gidLink(cast(void**)&garrow_day_time_interval_array_get_values, "garrow_day_time_interval_array_get_values", libs);

  // DayTimeIntervalArrayBuilder
  gidLink(cast(void**)&garrow_day_time_interval_array_builder_get_type, "garrow_day_time_interval_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_day_time_interval_array_builder_new, "garrow_day_time_interval_array_builder_new", libs);
  gidLink(cast(void**)&garrow_day_time_interval_array_builder_append_value, "garrow_day_time_interval_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_day_time_interval_array_builder_append_values, "garrow_day_time_interval_array_builder_append_values", libs);

  // DayTimeIntervalDataType
  gidLink(cast(void**)&garrow_day_time_interval_data_type_get_type, "garrow_day_time_interval_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_day_time_interval_data_type_new, "garrow_day_time_interval_data_type_new", libs);

  // DayTimeIntervalScalar
  gidLink(cast(void**)&garrow_day_time_interval_scalar_get_type, "garrow_day_time_interval_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_day_time_interval_scalar_new, "garrow_day_time_interval_scalar_new", libs);
  gidLink(cast(void**)&garrow_day_time_interval_scalar_get_value, "garrow_day_time_interval_scalar_get_value", libs);

  // Decimal128
  gidLink(cast(void**)&garrow_decimal128_get_type, "garrow_decimal128_get_type", libs);
  gidLink(cast(void**)&garrow_decimal128_new_integer, "garrow_decimal128_new_integer", libs);
  gidLink(cast(void**)&garrow_decimal128_new_string, "garrow_decimal128_new_string", libs);
  gidLink(cast(void**)&garrow_decimal128_abs, "garrow_decimal128_abs", libs);
  gidLink(cast(void**)&garrow_decimal128_copy, "garrow_decimal128_copy", libs);
  gidLink(cast(void**)&garrow_decimal128_divide, "garrow_decimal128_divide", libs);
  gidLink(cast(void**)&garrow_decimal128_equal, "garrow_decimal128_equal", libs);
  gidLink(cast(void**)&garrow_decimal128_greater_than, "garrow_decimal128_greater_than", libs);
  gidLink(cast(void**)&garrow_decimal128_greater_than_or_equal, "garrow_decimal128_greater_than_or_equal", libs);
  gidLink(cast(void**)&garrow_decimal128_less_than, "garrow_decimal128_less_than", libs);
  gidLink(cast(void**)&garrow_decimal128_less_than_or_equal, "garrow_decimal128_less_than_or_equal", libs);
  gidLink(cast(void**)&garrow_decimal128_minus, "garrow_decimal128_minus", libs);
  gidLink(cast(void**)&garrow_decimal128_multiply, "garrow_decimal128_multiply", libs);
  gidLink(cast(void**)&garrow_decimal128_negate, "garrow_decimal128_negate", libs);
  gidLink(cast(void**)&garrow_decimal128_not_equal, "garrow_decimal128_not_equal", libs);
  gidLink(cast(void**)&garrow_decimal128_plus, "garrow_decimal128_plus", libs);
  gidLink(cast(void**)&garrow_decimal128_rescale, "garrow_decimal128_rescale", libs);
  gidLink(cast(void**)&garrow_decimal128_to_bytes, "garrow_decimal128_to_bytes", libs);
  gidLink(cast(void**)&garrow_decimal128_to_integer, "garrow_decimal128_to_integer", libs);
  gidLink(cast(void**)&garrow_decimal128_to_string, "garrow_decimal128_to_string", libs);
  gidLink(cast(void**)&garrow_decimal128_to_string_scale, "garrow_decimal128_to_string_scale", libs);

  // Decimal128Array
  gidLink(cast(void**)&garrow_decimal128_array_get_type, "garrow_decimal128_array_get_type", libs);
  gidLink(cast(void**)&garrow_decimal128_array_format_value, "garrow_decimal128_array_format_value", libs);
  gidLink(cast(void**)&garrow_decimal128_array_get_value, "garrow_decimal128_array_get_value", libs);

  // Decimal128ArrayBuilder
  gidLink(cast(void**)&garrow_decimal128_array_builder_get_type, "garrow_decimal128_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_decimal128_array_builder_new, "garrow_decimal128_array_builder_new", libs);
  gidLink(cast(void**)&garrow_decimal128_array_builder_append, "garrow_decimal128_array_builder_append", libs);
  gidLink(cast(void**)&garrow_decimal128_array_builder_append_null, "garrow_decimal128_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_decimal128_array_builder_append_value, "garrow_decimal128_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_decimal128_array_builder_append_values, "garrow_decimal128_array_builder_append_values", libs);

  // Decimal128DataType
  gidLink(cast(void**)&garrow_decimal128_data_type_get_type, "garrow_decimal128_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_decimal128_data_type_new, "garrow_decimal128_data_type_new", libs);
  gidLink(cast(void**)&garrow_decimal128_data_type_max_precision, "garrow_decimal128_data_type_max_precision", libs);

  // Decimal128Scalar
  gidLink(cast(void**)&garrow_decimal128_scalar_get_type, "garrow_decimal128_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_decimal128_scalar_new, "garrow_decimal128_scalar_new", libs);
  gidLink(cast(void**)&garrow_decimal128_scalar_get_value, "garrow_decimal128_scalar_get_value", libs);

  // Decimal256
  gidLink(cast(void**)&garrow_decimal256_get_type, "garrow_decimal256_get_type", libs);
  gidLink(cast(void**)&garrow_decimal256_new_integer, "garrow_decimal256_new_integer", libs);
  gidLink(cast(void**)&garrow_decimal256_new_string, "garrow_decimal256_new_string", libs);
  gidLink(cast(void**)&garrow_decimal256_abs, "garrow_decimal256_abs", libs);
  gidLink(cast(void**)&garrow_decimal256_copy, "garrow_decimal256_copy", libs);
  gidLink(cast(void**)&garrow_decimal256_divide, "garrow_decimal256_divide", libs);
  gidLink(cast(void**)&garrow_decimal256_equal, "garrow_decimal256_equal", libs);
  gidLink(cast(void**)&garrow_decimal256_greater_than, "garrow_decimal256_greater_than", libs);
  gidLink(cast(void**)&garrow_decimal256_greater_than_or_equal, "garrow_decimal256_greater_than_or_equal", libs);
  gidLink(cast(void**)&garrow_decimal256_less_than, "garrow_decimal256_less_than", libs);
  gidLink(cast(void**)&garrow_decimal256_less_than_or_equal, "garrow_decimal256_less_than_or_equal", libs);
  gidLink(cast(void**)&garrow_decimal256_multiply, "garrow_decimal256_multiply", libs);
  gidLink(cast(void**)&garrow_decimal256_negate, "garrow_decimal256_negate", libs);
  gidLink(cast(void**)&garrow_decimal256_not_equal, "garrow_decimal256_not_equal", libs);
  gidLink(cast(void**)&garrow_decimal256_plus, "garrow_decimal256_plus", libs);
  gidLink(cast(void**)&garrow_decimal256_rescale, "garrow_decimal256_rescale", libs);
  gidLink(cast(void**)&garrow_decimal256_to_bytes, "garrow_decimal256_to_bytes", libs);
  gidLink(cast(void**)&garrow_decimal256_to_string, "garrow_decimal256_to_string", libs);
  gidLink(cast(void**)&garrow_decimal256_to_string_scale, "garrow_decimal256_to_string_scale", libs);

  // Decimal256Array
  gidLink(cast(void**)&garrow_decimal256_array_get_type, "garrow_decimal256_array_get_type", libs);
  gidLink(cast(void**)&garrow_decimal256_array_format_value, "garrow_decimal256_array_format_value", libs);
  gidLink(cast(void**)&garrow_decimal256_array_get_value, "garrow_decimal256_array_get_value", libs);

  // Decimal256ArrayBuilder
  gidLink(cast(void**)&garrow_decimal256_array_builder_get_type, "garrow_decimal256_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_decimal256_array_builder_new, "garrow_decimal256_array_builder_new", libs);
  gidLink(cast(void**)&garrow_decimal256_array_builder_append_value, "garrow_decimal256_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_decimal256_array_builder_append_values, "garrow_decimal256_array_builder_append_values", libs);

  // Decimal256DataType
  gidLink(cast(void**)&garrow_decimal256_data_type_get_type, "garrow_decimal256_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_decimal256_data_type_new, "garrow_decimal256_data_type_new", libs);
  gidLink(cast(void**)&garrow_decimal256_data_type_max_precision, "garrow_decimal256_data_type_max_precision", libs);

  // Decimal256Scalar
  gidLink(cast(void**)&garrow_decimal256_scalar_get_type, "garrow_decimal256_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_decimal256_scalar_new, "garrow_decimal256_scalar_new", libs);
  gidLink(cast(void**)&garrow_decimal256_scalar_get_value, "garrow_decimal256_scalar_get_value", libs);

  // Decimal32
  gidLink(cast(void**)&garrow_decimal32_get_type, "garrow_decimal32_get_type", libs);
  gidLink(cast(void**)&garrow_decimal32_new_integer, "garrow_decimal32_new_integer", libs);
  gidLink(cast(void**)&garrow_decimal32_new_string, "garrow_decimal32_new_string", libs);
  gidLink(cast(void**)&garrow_decimal32_abs, "garrow_decimal32_abs", libs);
  gidLink(cast(void**)&garrow_decimal32_copy, "garrow_decimal32_copy", libs);
  gidLink(cast(void**)&garrow_decimal32_divide, "garrow_decimal32_divide", libs);
  gidLink(cast(void**)&garrow_decimal32_equal, "garrow_decimal32_equal", libs);
  gidLink(cast(void**)&garrow_decimal32_greater_than, "garrow_decimal32_greater_than", libs);
  gidLink(cast(void**)&garrow_decimal32_greater_than_or_equal, "garrow_decimal32_greater_than_or_equal", libs);
  gidLink(cast(void**)&garrow_decimal32_less_than, "garrow_decimal32_less_than", libs);
  gidLink(cast(void**)&garrow_decimal32_less_than_or_equal, "garrow_decimal32_less_than_or_equal", libs);
  gidLink(cast(void**)&garrow_decimal32_minus, "garrow_decimal32_minus", libs);
  gidLink(cast(void**)&garrow_decimal32_multiply, "garrow_decimal32_multiply", libs);
  gidLink(cast(void**)&garrow_decimal32_negate, "garrow_decimal32_negate", libs);
  gidLink(cast(void**)&garrow_decimal32_not_equal, "garrow_decimal32_not_equal", libs);
  gidLink(cast(void**)&garrow_decimal32_plus, "garrow_decimal32_plus", libs);
  gidLink(cast(void**)&garrow_decimal32_rescale, "garrow_decimal32_rescale", libs);
  gidLink(cast(void**)&garrow_decimal32_to_bytes, "garrow_decimal32_to_bytes", libs);
  gidLink(cast(void**)&garrow_decimal32_to_integer, "garrow_decimal32_to_integer", libs);
  gidLink(cast(void**)&garrow_decimal32_to_string, "garrow_decimal32_to_string", libs);
  gidLink(cast(void**)&garrow_decimal32_to_string_scale, "garrow_decimal32_to_string_scale", libs);

  // Decimal32Array
  gidLink(cast(void**)&garrow_decimal32_array_get_type, "garrow_decimal32_array_get_type", libs);
  gidLink(cast(void**)&garrow_decimal32_array_format_value, "garrow_decimal32_array_format_value", libs);
  gidLink(cast(void**)&garrow_decimal32_array_get_value, "garrow_decimal32_array_get_value", libs);

  // Decimal32ArrayBuilder
  gidLink(cast(void**)&garrow_decimal32_array_builder_get_type, "garrow_decimal32_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_decimal32_array_builder_new, "garrow_decimal32_array_builder_new", libs);
  gidLink(cast(void**)&garrow_decimal32_array_builder_append_value, "garrow_decimal32_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_decimal32_array_builder_append_values, "garrow_decimal32_array_builder_append_values", libs);

  // Decimal32DataType
  gidLink(cast(void**)&garrow_decimal32_data_type_get_type, "garrow_decimal32_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_decimal32_data_type_new, "garrow_decimal32_data_type_new", libs);
  gidLink(cast(void**)&garrow_decimal32_data_type_max_precision, "garrow_decimal32_data_type_max_precision", libs);

  // Decimal32Scalar
  gidLink(cast(void**)&garrow_decimal32_scalar_get_type, "garrow_decimal32_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_decimal32_scalar_new, "garrow_decimal32_scalar_new", libs);
  gidLink(cast(void**)&garrow_decimal32_scalar_get_value, "garrow_decimal32_scalar_get_value", libs);

  // Decimal64
  gidLink(cast(void**)&garrow_decimal64_get_type, "garrow_decimal64_get_type", libs);
  gidLink(cast(void**)&garrow_decimal64_new_integer, "garrow_decimal64_new_integer", libs);
  gidLink(cast(void**)&garrow_decimal64_new_string, "garrow_decimal64_new_string", libs);
  gidLink(cast(void**)&garrow_decimal64_abs, "garrow_decimal64_abs", libs);
  gidLink(cast(void**)&garrow_decimal64_copy, "garrow_decimal64_copy", libs);
  gidLink(cast(void**)&garrow_decimal64_divide, "garrow_decimal64_divide", libs);
  gidLink(cast(void**)&garrow_decimal64_equal, "garrow_decimal64_equal", libs);
  gidLink(cast(void**)&garrow_decimal64_greater_than, "garrow_decimal64_greater_than", libs);
  gidLink(cast(void**)&garrow_decimal64_greater_than_or_equal, "garrow_decimal64_greater_than_or_equal", libs);
  gidLink(cast(void**)&garrow_decimal64_less_than, "garrow_decimal64_less_than", libs);
  gidLink(cast(void**)&garrow_decimal64_less_than_or_equal, "garrow_decimal64_less_than_or_equal", libs);
  gidLink(cast(void**)&garrow_decimal64_minus, "garrow_decimal64_minus", libs);
  gidLink(cast(void**)&garrow_decimal64_multiply, "garrow_decimal64_multiply", libs);
  gidLink(cast(void**)&garrow_decimal64_negate, "garrow_decimal64_negate", libs);
  gidLink(cast(void**)&garrow_decimal64_not_equal, "garrow_decimal64_not_equal", libs);
  gidLink(cast(void**)&garrow_decimal64_plus, "garrow_decimal64_plus", libs);
  gidLink(cast(void**)&garrow_decimal64_rescale, "garrow_decimal64_rescale", libs);
  gidLink(cast(void**)&garrow_decimal64_to_bytes, "garrow_decimal64_to_bytes", libs);
  gidLink(cast(void**)&garrow_decimal64_to_integer, "garrow_decimal64_to_integer", libs);
  gidLink(cast(void**)&garrow_decimal64_to_string, "garrow_decimal64_to_string", libs);
  gidLink(cast(void**)&garrow_decimal64_to_string_scale, "garrow_decimal64_to_string_scale", libs);

  // Decimal64Array
  gidLink(cast(void**)&garrow_decimal64_array_get_type, "garrow_decimal64_array_get_type", libs);
  gidLink(cast(void**)&garrow_decimal64_array_format_value, "garrow_decimal64_array_format_value", libs);
  gidLink(cast(void**)&garrow_decimal64_array_get_value, "garrow_decimal64_array_get_value", libs);

  // Decimal64ArrayBuilder
  gidLink(cast(void**)&garrow_decimal64_array_builder_get_type, "garrow_decimal64_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_decimal64_array_builder_new, "garrow_decimal64_array_builder_new", libs);
  gidLink(cast(void**)&garrow_decimal64_array_builder_append_value, "garrow_decimal64_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_decimal64_array_builder_append_values, "garrow_decimal64_array_builder_append_values", libs);

  // Decimal64DataType
  gidLink(cast(void**)&garrow_decimal64_data_type_get_type, "garrow_decimal64_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_decimal64_data_type_new, "garrow_decimal64_data_type_new", libs);
  gidLink(cast(void**)&garrow_decimal64_data_type_max_precision, "garrow_decimal64_data_type_max_precision", libs);

  // Decimal64Scalar
  gidLink(cast(void**)&garrow_decimal64_scalar_get_type, "garrow_decimal64_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_decimal64_scalar_new, "garrow_decimal64_scalar_new", libs);
  gidLink(cast(void**)&garrow_decimal64_scalar_get_value, "garrow_decimal64_scalar_get_value", libs);

  // DecimalDataType
  gidLink(cast(void**)&garrow_decimal_data_type_get_type, "garrow_decimal_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_decimal_data_type_new, "garrow_decimal_data_type_new", libs);
  gidLink(cast(void**)&garrow_decimal_data_type_get_precision, "garrow_decimal_data_type_get_precision", libs);
  gidLink(cast(void**)&garrow_decimal_data_type_get_scale, "garrow_decimal_data_type_get_scale", libs);

  // DenseUnionArray
  gidLink(cast(void**)&garrow_dense_union_array_get_type, "garrow_dense_union_array_get_type", libs);
  gidLink(cast(void**)&garrow_dense_union_array_new, "garrow_dense_union_array_new", libs);
  gidLink(cast(void**)&garrow_dense_union_array_new_data_type, "garrow_dense_union_array_new_data_type", libs);
  gidLink(cast(void**)&garrow_dense_union_array_get_value_offset, "garrow_dense_union_array_get_value_offset", libs);

  // DenseUnionArrayBuilder
  gidLink(cast(void**)&garrow_dense_union_array_builder_get_type, "garrow_dense_union_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_dense_union_array_builder_new, "garrow_dense_union_array_builder_new", libs);

  // DenseUnionDataType
  gidLink(cast(void**)&garrow_dense_union_data_type_get_type, "garrow_dense_union_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_dense_union_data_type_new, "garrow_dense_union_data_type_new", libs);

  // DenseUnionScalar
  gidLink(cast(void**)&garrow_dense_union_scalar_get_type, "garrow_dense_union_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_dense_union_scalar_new, "garrow_dense_union_scalar_new", libs);

  // DictionaryArray
  gidLink(cast(void**)&garrow_dictionary_array_get_type, "garrow_dictionary_array_get_type", libs);
  gidLink(cast(void**)&garrow_dictionary_array_new, "garrow_dictionary_array_new", libs);
  gidLink(cast(void**)&garrow_dictionary_array_get_dictionary, "garrow_dictionary_array_get_dictionary", libs);
  gidLink(cast(void**)&garrow_dictionary_array_get_dictionary_data_type, "garrow_dictionary_array_get_dictionary_data_type", libs);
  gidLink(cast(void**)&garrow_dictionary_array_get_indices, "garrow_dictionary_array_get_indices", libs);

  // DictionaryDataType
  gidLink(cast(void**)&garrow_dictionary_data_type_get_type, "garrow_dictionary_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_dictionary_data_type_new, "garrow_dictionary_data_type_new", libs);
  gidLink(cast(void**)&garrow_dictionary_data_type_get_index_data_type, "garrow_dictionary_data_type_get_index_data_type", libs);
  gidLink(cast(void**)&garrow_dictionary_data_type_get_value_data_type, "garrow_dictionary_data_type_get_value_data_type", libs);
  gidLink(cast(void**)&garrow_dictionary_data_type_is_ordered, "garrow_dictionary_data_type_is_ordered", libs);

  // DoubleArray
  gidLink(cast(void**)&garrow_double_array_get_type, "garrow_double_array_get_type", libs);
  gidLink(cast(void**)&garrow_double_array_new, "garrow_double_array_new", libs);
  gidLink(cast(void**)&garrow_double_array_get_value, "garrow_double_array_get_value", libs);
  gidLink(cast(void**)&garrow_double_array_get_values, "garrow_double_array_get_values", libs);
  gidLink(cast(void**)&garrow_double_array_sum, "garrow_double_array_sum", libs);

  // DoubleArrayBuilder
  gidLink(cast(void**)&garrow_double_array_builder_get_type, "garrow_double_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_double_array_builder_new, "garrow_double_array_builder_new", libs);
  gidLink(cast(void**)&garrow_double_array_builder_append, "garrow_double_array_builder_append", libs);
  gidLink(cast(void**)&garrow_double_array_builder_append_null, "garrow_double_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_double_array_builder_append_nulls, "garrow_double_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_double_array_builder_append_value, "garrow_double_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_double_array_builder_append_values, "garrow_double_array_builder_append_values", libs);

  // DoubleDataType
  gidLink(cast(void**)&garrow_double_data_type_get_type, "garrow_double_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_double_data_type_new, "garrow_double_data_type_new", libs);

  // DoubleScalar
  gidLink(cast(void**)&garrow_double_scalar_get_type, "garrow_double_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_double_scalar_new, "garrow_double_scalar_new", libs);
  gidLink(cast(void**)&garrow_double_scalar_get_value, "garrow_double_scalar_get_value", libs);

  // EqualOptions
  gidLink(cast(void**)&garrow_equal_options_get_type, "garrow_equal_options_get_type", libs);
  gidLink(cast(void**)&garrow_equal_options_new, "garrow_equal_options_new", libs);
  gidLink(cast(void**)&garrow_equal_options_is_approx, "garrow_equal_options_is_approx", libs);

  // ExecuteContext
  gidLink(cast(void**)&garrow_execute_context_get_type, "garrow_execute_context_get_type", libs);
  gidLink(cast(void**)&garrow_execute_context_new, "garrow_execute_context_new", libs);

  // ExecuteNode
  gidLink(cast(void**)&garrow_execute_node_get_type, "garrow_execute_node_get_type", libs);
  gidLink(cast(void**)&garrow_execute_node_get_kind_name, "garrow_execute_node_get_kind_name", libs);
  gidLink(cast(void**)&garrow_execute_node_get_output_schema, "garrow_execute_node_get_output_schema", libs);

  // ExecuteNodeOptions
  gidLink(cast(void**)&garrow_execute_node_options_get_type, "garrow_execute_node_options_get_type", libs);

  // ExecutePlan
  gidLink(cast(void**)&garrow_execute_plan_get_type, "garrow_execute_plan_get_type", libs);
  gidLink(cast(void**)&garrow_execute_plan_new, "garrow_execute_plan_new", libs);
  gidLink(cast(void**)&garrow_execute_plan_build_aggregate_node, "garrow_execute_plan_build_aggregate_node", libs);
  gidLink(cast(void**)&garrow_execute_plan_build_filter_node, "garrow_execute_plan_build_filter_node", libs);
  gidLink(cast(void**)&garrow_execute_plan_build_hash_join_node, "garrow_execute_plan_build_hash_join_node", libs);
  gidLink(cast(void**)&garrow_execute_plan_build_node, "garrow_execute_plan_build_node", libs);
  gidLink(cast(void**)&garrow_execute_plan_build_project_node, "garrow_execute_plan_build_project_node", libs);
  gidLink(cast(void**)&garrow_execute_plan_build_sink_node, "garrow_execute_plan_build_sink_node", libs);
  gidLink(cast(void**)&garrow_execute_plan_build_source_node, "garrow_execute_plan_build_source_node", libs);
  gidLink(cast(void**)&garrow_execute_plan_get_nodes, "garrow_execute_plan_get_nodes", libs);
  gidLink(cast(void**)&garrow_execute_plan_start, "garrow_execute_plan_start", libs);
  gidLink(cast(void**)&garrow_execute_plan_stop, "garrow_execute_plan_stop", libs);
  gidLink(cast(void**)&garrow_execute_plan_validate, "garrow_execute_plan_validate", libs);
  gidLink(cast(void**)&garrow_execute_plan_wait, "garrow_execute_plan_wait", libs);

  // Expression
  gidLink(cast(void**)&garrow_expression_get_type, "garrow_expression_get_type", libs);
  gidLink(cast(void**)&garrow_expression_equal, "garrow_expression_equal", libs);
  gidLink(cast(void**)&garrow_expression_to_string, "garrow_expression_to_string", libs);

  // ExtensionArray
  gidLink(cast(void**)&garrow_extension_array_get_type, "garrow_extension_array_get_type", libs);
  gidLink(cast(void**)&garrow_extension_array_get_storage, "garrow_extension_array_get_storage", libs);

  // ExtensionDataType
  gidLink(cast(void**)&garrow_extension_data_type_get_type, "garrow_extension_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_extension_data_type_get_extension_name, "garrow_extension_data_type_get_extension_name", libs);
  gidLink(cast(void**)&garrow_extension_data_type_wrap_array, "garrow_extension_data_type_wrap_array", libs);
  gidLink(cast(void**)&garrow_extension_data_type_wrap_chunked_array, "garrow_extension_data_type_wrap_chunked_array", libs);

  // ExtensionDataTypeRegistry
  gidLink(cast(void**)&garrow_extension_data_type_registry_get_type, "garrow_extension_data_type_registry_get_type", libs);
  gidLink(cast(void**)&garrow_extension_data_type_registry_default, "garrow_extension_data_type_registry_default", libs);
  gidLink(cast(void**)&garrow_extension_data_type_registry_lookup, "garrow_extension_data_type_registry_lookup", libs);
  gidLink(cast(void**)&garrow_extension_data_type_registry_register, "garrow_extension_data_type_registry_register", libs);
  gidLink(cast(void**)&garrow_extension_data_type_registry_unregister, "garrow_extension_data_type_registry_unregister", libs);

  // ExtensionScalar
  gidLink(cast(void**)&garrow_extension_scalar_get_type, "garrow_extension_scalar_get_type", libs);

  // FeatherFileReader
  gidLink(cast(void**)&garrow_feather_file_reader_get_type, "garrow_feather_file_reader_get_type", libs);
  gidLink(cast(void**)&garrow_feather_file_reader_new, "garrow_feather_file_reader_new", libs);
  gidLink(cast(void**)&garrow_feather_file_reader_get_version, "garrow_feather_file_reader_get_version", libs);
  gidLink(cast(void**)&garrow_feather_file_reader_read, "garrow_feather_file_reader_read", libs);
  gidLink(cast(void**)&garrow_feather_file_reader_read_indices, "garrow_feather_file_reader_read_indices", libs);
  gidLink(cast(void**)&garrow_feather_file_reader_read_names, "garrow_feather_file_reader_read_names", libs);

  // FeatherWriteProperties
  gidLink(cast(void**)&garrow_feather_write_properties_get_type, "garrow_feather_write_properties_get_type", libs);
  gidLink(cast(void**)&garrow_feather_write_properties_new, "garrow_feather_write_properties_new", libs);

  // Field
  gidLink(cast(void**)&garrow_field_get_type, "garrow_field_get_type", libs);
  gidLink(cast(void**)&garrow_field_new, "garrow_field_new", libs);
  gidLink(cast(void**)&garrow_field_new_full, "garrow_field_new_full", libs);
  gidLink(cast(void**)&garrow_field_import, "garrow_field_import", libs);
  gidLink(cast(void**)&garrow_field_equal, "garrow_field_equal", libs);
  gidLink(cast(void**)&garrow_field_export, "garrow_field_export", libs);
  gidLink(cast(void**)&garrow_field_get_data_type, "garrow_field_get_data_type", libs);
  gidLink(cast(void**)&garrow_field_get_metadata, "garrow_field_get_metadata", libs);
  gidLink(cast(void**)&garrow_field_get_name, "garrow_field_get_name", libs);
  gidLink(cast(void**)&garrow_field_has_metadata, "garrow_field_has_metadata", libs);
  gidLink(cast(void**)&garrow_field_is_nullable, "garrow_field_is_nullable", libs);
  gidLink(cast(void**)&garrow_field_remove_metadata, "garrow_field_remove_metadata", libs);
  gidLink(cast(void**)&garrow_field_to_string, "garrow_field_to_string", libs);
  gidLink(cast(void**)&garrow_field_to_string_metadata, "garrow_field_to_string_metadata", libs);
  gidLink(cast(void**)&garrow_field_with_merged_metadata, "garrow_field_with_merged_metadata", libs);
  gidLink(cast(void**)&garrow_field_with_metadata, "garrow_field_with_metadata", libs);

  // FieldExpression
  gidLink(cast(void**)&garrow_field_expression_get_type, "garrow_field_expression_get_type", libs);
  gidLink(cast(void**)&garrow_field_expression_new, "garrow_field_expression_new", libs);

  // File
  gidLink(cast(void**)&garrow_file_get_type, "garrow_file_get_type", libs);
  gidLink(cast(void**)&garrow_file_close, "garrow_file_close", libs);
  gidLink(cast(void**)&garrow_file_get_mode, "garrow_file_get_mode", libs);
  gidLink(cast(void**)&garrow_file_is_closed, "garrow_file_is_closed", libs);
  gidLink(cast(void**)&garrow_file_tell, "garrow_file_tell", libs);

  // FileInfo
  gidLink(cast(void**)&garrow_file_info_get_type, "garrow_file_info_get_type", libs);
  gidLink(cast(void**)&garrow_file_info_new, "garrow_file_info_new", libs);
  gidLink(cast(void**)&garrow_file_info_equal, "garrow_file_info_equal", libs);
  gidLink(cast(void**)&garrow_file_info_is_dir, "garrow_file_info_is_dir", libs);
  gidLink(cast(void**)&garrow_file_info_is_file, "garrow_file_info_is_file", libs);
  gidLink(cast(void**)&garrow_file_info_to_string, "garrow_file_info_to_string", libs);

  // FileInputStream
  gidLink(cast(void**)&garrow_file_input_stream_get_type, "garrow_file_input_stream_get_type", libs);
  gidLink(cast(void**)&garrow_file_input_stream_new, "garrow_file_input_stream_new", libs);
  gidLink(cast(void**)&garrow_file_input_stream_new_file_descriptor, "garrow_file_input_stream_new_file_descriptor", libs);
  gidLink(cast(void**)&garrow_file_input_stream_get_file_descriptor, "garrow_file_input_stream_get_file_descriptor", libs);

  // FileOutputStream
  gidLink(cast(void**)&garrow_file_output_stream_get_type, "garrow_file_output_stream_get_type", libs);
  gidLink(cast(void**)&garrow_file_output_stream_new, "garrow_file_output_stream_new", libs);

  // FileSelector
  gidLink(cast(void**)&garrow_file_selector_get_type, "garrow_file_selector_get_type", libs);

  // FileSystem
  gidLink(cast(void**)&garrow_file_system_get_type, "garrow_file_system_get_type", libs);
  gidLink(cast(void**)&garrow_file_system_create, "garrow_file_system_create", libs);
  gidLink(cast(void**)&garrow_file_system_copy_file, "garrow_file_system_copy_file", libs);
  gidLink(cast(void**)&garrow_file_system_create_dir, "garrow_file_system_create_dir", libs);
  gidLink(cast(void**)&garrow_file_system_delete_dir, "garrow_file_system_delete_dir", libs);
  gidLink(cast(void**)&garrow_file_system_delete_dir_contents, "garrow_file_system_delete_dir_contents", libs);
  gidLink(cast(void**)&garrow_file_system_delete_file, "garrow_file_system_delete_file", libs);
  gidLink(cast(void**)&garrow_file_system_delete_files, "garrow_file_system_delete_files", libs);
  gidLink(cast(void**)&garrow_file_system_get_file_info, "garrow_file_system_get_file_info", libs);
  gidLink(cast(void**)&garrow_file_system_get_file_infos_paths, "garrow_file_system_get_file_infos_paths", libs);
  gidLink(cast(void**)&garrow_file_system_get_file_infos_selector, "garrow_file_system_get_file_infos_selector", libs);
  gidLink(cast(void**)&garrow_file_system_get_type_name, "garrow_file_system_get_type_name", libs);
  gidLink(cast(void**)&garrow_file_system_move, "garrow_file_system_move", libs);
  gidLink(cast(void**)&garrow_file_system_open_append_stream, "garrow_file_system_open_append_stream", libs);
  gidLink(cast(void**)&garrow_file_system_open_input_file, "garrow_file_system_open_input_file", libs);
  gidLink(cast(void**)&garrow_file_system_open_input_stream, "garrow_file_system_open_input_stream", libs);
  gidLink(cast(void**)&garrow_file_system_open_output_stream, "garrow_file_system_open_output_stream", libs);

  // FilterNodeOptions
  gidLink(cast(void**)&garrow_filter_node_options_get_type, "garrow_filter_node_options_get_type", libs);
  gidLink(cast(void**)&garrow_filter_node_options_new, "garrow_filter_node_options_new", libs);

  // FilterOptions
  gidLink(cast(void**)&garrow_filter_options_get_type, "garrow_filter_options_get_type", libs);
  gidLink(cast(void**)&garrow_filter_options_new, "garrow_filter_options_new", libs);

  // FixedSizeBinaryArray
  gidLink(cast(void**)&garrow_fixed_size_binary_array_get_type, "garrow_fixed_size_binary_array_get_type", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_array_new, "garrow_fixed_size_binary_array_new", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_array_get_byte_width, "garrow_fixed_size_binary_array_get_byte_width", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_array_get_value, "garrow_fixed_size_binary_array_get_value", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_array_get_values_bytes, "garrow_fixed_size_binary_array_get_values_bytes", libs);

  // FixedSizeBinaryArrayBuilder
  gidLink(cast(void**)&garrow_fixed_size_binary_array_builder_get_type, "garrow_fixed_size_binary_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_array_builder_new, "garrow_fixed_size_binary_array_builder_new", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_array_builder_append_value, "garrow_fixed_size_binary_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_array_builder_append_value_bytes, "garrow_fixed_size_binary_array_builder_append_value_bytes", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_array_builder_append_values, "garrow_fixed_size_binary_array_builder_append_values", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_array_builder_append_values_packed, "garrow_fixed_size_binary_array_builder_append_values_packed", libs);

  // FixedSizeBinaryDataType
  gidLink(cast(void**)&garrow_fixed_size_binary_data_type_get_type, "garrow_fixed_size_binary_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_data_type_new, "garrow_fixed_size_binary_data_type_new", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_data_type_get_byte_width, "garrow_fixed_size_binary_data_type_get_byte_width", libs);

  // FixedSizeBinaryScalar
  gidLink(cast(void**)&garrow_fixed_size_binary_scalar_get_type, "garrow_fixed_size_binary_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_fixed_size_binary_scalar_new, "garrow_fixed_size_binary_scalar_new", libs);

  // FixedWidthDataType
  gidLink(cast(void**)&garrow_fixed_width_data_type_get_type, "garrow_fixed_width_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_fixed_width_data_type_get_bit_width, "garrow_fixed_width_data_type_get_bit_width", libs);

  // FloatArray
  gidLink(cast(void**)&garrow_float_array_get_type, "garrow_float_array_get_type", libs);
  gidLink(cast(void**)&garrow_float_array_new, "garrow_float_array_new", libs);
  gidLink(cast(void**)&garrow_float_array_get_value, "garrow_float_array_get_value", libs);
  gidLink(cast(void**)&garrow_float_array_get_values, "garrow_float_array_get_values", libs);
  gidLink(cast(void**)&garrow_float_array_sum, "garrow_float_array_sum", libs);

  // FloatArrayBuilder
  gidLink(cast(void**)&garrow_float_array_builder_get_type, "garrow_float_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_float_array_builder_new, "garrow_float_array_builder_new", libs);
  gidLink(cast(void**)&garrow_float_array_builder_append, "garrow_float_array_builder_append", libs);
  gidLink(cast(void**)&garrow_float_array_builder_append_null, "garrow_float_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_float_array_builder_append_nulls, "garrow_float_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_float_array_builder_append_value, "garrow_float_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_float_array_builder_append_values, "garrow_float_array_builder_append_values", libs);

  // FloatDataType
  gidLink(cast(void**)&garrow_float_data_type_get_type, "garrow_float_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_float_data_type_new, "garrow_float_data_type_new", libs);

  // FloatScalar
  gidLink(cast(void**)&garrow_float_scalar_get_type, "garrow_float_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_float_scalar_new, "garrow_float_scalar_new", libs);
  gidLink(cast(void**)&garrow_float_scalar_get_value, "garrow_float_scalar_get_value", libs);

  // FloatingPointDataType
  gidLink(cast(void**)&garrow_floating_point_data_type_get_type, "garrow_floating_point_data_type_get_type", libs);

  // Function
  gidLink(cast(void**)&garrow_function_get_type, "garrow_function_get_type", libs);
  gidLink(cast(void**)&garrow_function_all, "garrow_function_all", libs);
  gidLink(cast(void**)&garrow_function_find, "garrow_function_find", libs);
  gidLink(cast(void**)&garrow_function_equal, "garrow_function_equal", libs);
  gidLink(cast(void**)&garrow_function_execute, "garrow_function_execute", libs);
  gidLink(cast(void**)&garrow_function_get_default_options, "garrow_function_get_default_options", libs);
  gidLink(cast(void**)&garrow_function_get_doc, "garrow_function_get_doc", libs);
  gidLink(cast(void**)&garrow_function_get_name, "garrow_function_get_name", libs);
  gidLink(cast(void**)&garrow_function_get_options_type, "garrow_function_get_options_type", libs);
  gidLink(cast(void**)&garrow_function_to_string, "garrow_function_to_string", libs);

  // FunctionDoc
  gidLink(cast(void**)&garrow_function_doc_get_type, "garrow_function_doc_get_type", libs);
  gidLink(cast(void**)&garrow_function_doc_get_arg_names, "garrow_function_doc_get_arg_names", libs);
  gidLink(cast(void**)&garrow_function_doc_get_description, "garrow_function_doc_get_description", libs);
  gidLink(cast(void**)&garrow_function_doc_get_options_class_name, "garrow_function_doc_get_options_class_name", libs);
  gidLink(cast(void**)&garrow_function_doc_get_summary, "garrow_function_doc_get_summary", libs);

  // FunctionOptions
  gidLink(cast(void**)&garrow_function_options_get_type, "garrow_function_options_get_type", libs);
  gidLink(cast(void**)&garrow_function_options_equal, "garrow_function_options_equal", libs);
  gidLink(cast(void**)&garrow_function_options_to_string, "garrow_function_options_to_string", libs);

  // GCSFileSystem
  gidLink(cast(void**)&garrow_gcs_file_system_get_type, "garrow_gcs_file_system_get_type", libs);

  // GIOInputStream
  gidLink(cast(void**)&garrow_gio_input_stream_get_type, "garrow_gio_input_stream_get_type", libs);
  gidLink(cast(void**)&garrow_gio_input_stream_new, "garrow_gio_input_stream_new", libs);
  gidLink(cast(void**)&garrow_gio_input_stream_get_raw, "garrow_gio_input_stream_get_raw", libs);

  // GIOOutputStream
  gidLink(cast(void**)&garrow_gio_output_stream_get_type, "garrow_gio_output_stream_get_type", libs);
  gidLink(cast(void**)&garrow_gio_output_stream_new, "garrow_gio_output_stream_new", libs);
  gidLink(cast(void**)&garrow_gio_output_stream_get_raw, "garrow_gio_output_stream_get_raw", libs);

  // HDFSFileSystem
  gidLink(cast(void**)&garrow_hdfs_file_system_get_type, "garrow_hdfs_file_system_get_type", libs);

  // HalfFloatArray
  gidLink(cast(void**)&garrow_half_float_array_get_type, "garrow_half_float_array_get_type", libs);
  gidLink(cast(void**)&garrow_half_float_array_new, "garrow_half_float_array_new", libs);
  gidLink(cast(void**)&garrow_half_float_array_get_value, "garrow_half_float_array_get_value", libs);
  gidLink(cast(void**)&garrow_half_float_array_get_values, "garrow_half_float_array_get_values", libs);

  // HalfFloatArrayBuilder
  gidLink(cast(void**)&garrow_half_float_array_builder_get_type, "garrow_half_float_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_half_float_array_builder_new, "garrow_half_float_array_builder_new", libs);
  gidLink(cast(void**)&garrow_half_float_array_builder_append_value, "garrow_half_float_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_half_float_array_builder_append_values, "garrow_half_float_array_builder_append_values", libs);

  // HalfFloatDataType
  gidLink(cast(void**)&garrow_half_float_data_type_get_type, "garrow_half_float_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_half_float_data_type_new, "garrow_half_float_data_type_new", libs);

  // HalfFloatScalar
  gidLink(cast(void**)&garrow_half_float_scalar_get_type, "garrow_half_float_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_half_float_scalar_new, "garrow_half_float_scalar_new", libs);
  gidLink(cast(void**)&garrow_half_float_scalar_get_value, "garrow_half_float_scalar_get_value", libs);

  // HashJoinNodeOptions
  gidLink(cast(void**)&garrow_hash_join_node_options_get_type, "garrow_hash_join_node_options_get_type", libs);
  gidLink(cast(void**)&garrow_hash_join_node_options_new, "garrow_hash_join_node_options_new", libs);
  gidLink(cast(void**)&garrow_hash_join_node_options_set_left_outputs, "garrow_hash_join_node_options_set_left_outputs", libs);
  gidLink(cast(void**)&garrow_hash_join_node_options_set_right_outputs, "garrow_hash_join_node_options_set_right_outputs", libs);

  // ISO8601TimestampParser
  gidLink(cast(void**)&garrow_iso8601_timestamp_parser_get_type, "garrow_iso8601_timestamp_parser_get_type", libs);
  gidLink(cast(void**)&garrow_iso8601_timestamp_parser_new, "garrow_iso8601_timestamp_parser_new", libs);

  // IndexOptions
  gidLink(cast(void**)&garrow_index_options_get_type, "garrow_index_options_get_type", libs);
  gidLink(cast(void**)&garrow_index_options_new, "garrow_index_options_new", libs);

  // InputStream
  gidLink(cast(void**)&garrow_input_stream_get_type, "garrow_input_stream_get_type", libs);
  gidLink(cast(void**)&garrow_input_stream_advance, "garrow_input_stream_advance", libs);
  gidLink(cast(void**)&garrow_input_stream_align, "garrow_input_stream_align", libs);
  gidLink(cast(void**)&garrow_input_stream_read_record_batch, "garrow_input_stream_read_record_batch", libs);
  gidLink(cast(void**)&garrow_input_stream_read_tensor, "garrow_input_stream_read_tensor", libs);

  // Int16Array
  gidLink(cast(void**)&garrow_int16_array_get_type, "garrow_int16_array_get_type", libs);
  gidLink(cast(void**)&garrow_int16_array_new, "garrow_int16_array_new", libs);
  gidLink(cast(void**)&garrow_int16_array_get_value, "garrow_int16_array_get_value", libs);
  gidLink(cast(void**)&garrow_int16_array_get_values, "garrow_int16_array_get_values", libs);
  gidLink(cast(void**)&garrow_int16_array_sum, "garrow_int16_array_sum", libs);

  // Int16ArrayBuilder
  gidLink(cast(void**)&garrow_int16_array_builder_get_type, "garrow_int16_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_int16_array_builder_new, "garrow_int16_array_builder_new", libs);
  gidLink(cast(void**)&garrow_int16_array_builder_append, "garrow_int16_array_builder_append", libs);
  gidLink(cast(void**)&garrow_int16_array_builder_append_null, "garrow_int16_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_int16_array_builder_append_nulls, "garrow_int16_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_int16_array_builder_append_value, "garrow_int16_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_int16_array_builder_append_values, "garrow_int16_array_builder_append_values", libs);

  // Int16DataType
  gidLink(cast(void**)&garrow_int16_data_type_get_type, "garrow_int16_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_int16_data_type_new, "garrow_int16_data_type_new", libs);

  // Int16Scalar
  gidLink(cast(void**)&garrow_int16_scalar_get_type, "garrow_int16_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_int16_scalar_new, "garrow_int16_scalar_new", libs);
  gidLink(cast(void**)&garrow_int16_scalar_get_value, "garrow_int16_scalar_get_value", libs);

  // Int32Array
  gidLink(cast(void**)&garrow_int32_array_get_type, "garrow_int32_array_get_type", libs);
  gidLink(cast(void**)&garrow_int32_array_new, "garrow_int32_array_new", libs);
  gidLink(cast(void**)&garrow_int32_array_get_value, "garrow_int32_array_get_value", libs);
  gidLink(cast(void**)&garrow_int32_array_get_values, "garrow_int32_array_get_values", libs);
  gidLink(cast(void**)&garrow_int32_array_sum, "garrow_int32_array_sum", libs);

  // Int32ArrayBuilder
  gidLink(cast(void**)&garrow_int32_array_builder_get_type, "garrow_int32_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_int32_array_builder_new, "garrow_int32_array_builder_new", libs);
  gidLink(cast(void**)&garrow_int32_array_builder_append, "garrow_int32_array_builder_append", libs);
  gidLink(cast(void**)&garrow_int32_array_builder_append_null, "garrow_int32_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_int32_array_builder_append_nulls, "garrow_int32_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_int32_array_builder_append_value, "garrow_int32_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_int32_array_builder_append_values, "garrow_int32_array_builder_append_values", libs);

  // Int32DataType
  gidLink(cast(void**)&garrow_int32_data_type_get_type, "garrow_int32_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_int32_data_type_new, "garrow_int32_data_type_new", libs);

  // Int32Scalar
  gidLink(cast(void**)&garrow_int32_scalar_get_type, "garrow_int32_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_int32_scalar_new, "garrow_int32_scalar_new", libs);
  gidLink(cast(void**)&garrow_int32_scalar_get_value, "garrow_int32_scalar_get_value", libs);

  // Int64Array
  gidLink(cast(void**)&garrow_int64_array_get_type, "garrow_int64_array_get_type", libs);
  gidLink(cast(void**)&garrow_int64_array_new, "garrow_int64_array_new", libs);
  gidLink(cast(void**)&garrow_int64_array_get_value, "garrow_int64_array_get_value", libs);
  gidLink(cast(void**)&garrow_int64_array_get_values, "garrow_int64_array_get_values", libs);
  gidLink(cast(void**)&garrow_int64_array_sum, "garrow_int64_array_sum", libs);

  // Int64ArrayBuilder
  gidLink(cast(void**)&garrow_int64_array_builder_get_type, "garrow_int64_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_int64_array_builder_new, "garrow_int64_array_builder_new", libs);
  gidLink(cast(void**)&garrow_int64_array_builder_append, "garrow_int64_array_builder_append", libs);
  gidLink(cast(void**)&garrow_int64_array_builder_append_null, "garrow_int64_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_int64_array_builder_append_nulls, "garrow_int64_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_int64_array_builder_append_value, "garrow_int64_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_int64_array_builder_append_values, "garrow_int64_array_builder_append_values", libs);

  // Int64DataType
  gidLink(cast(void**)&garrow_int64_data_type_get_type, "garrow_int64_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_int64_data_type_new, "garrow_int64_data_type_new", libs);

  // Int64Scalar
  gidLink(cast(void**)&garrow_int64_scalar_get_type, "garrow_int64_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_int64_scalar_new, "garrow_int64_scalar_new", libs);
  gidLink(cast(void**)&garrow_int64_scalar_get_value, "garrow_int64_scalar_get_value", libs);

  // Int8Array
  gidLink(cast(void**)&garrow_int8_array_get_type, "garrow_int8_array_get_type", libs);
  gidLink(cast(void**)&garrow_int8_array_new, "garrow_int8_array_new", libs);
  gidLink(cast(void**)&garrow_int8_array_get_value, "garrow_int8_array_get_value", libs);
  gidLink(cast(void**)&garrow_int8_array_get_values, "garrow_int8_array_get_values", libs);
  gidLink(cast(void**)&garrow_int8_array_sum, "garrow_int8_array_sum", libs);

  // Int8ArrayBuilder
  gidLink(cast(void**)&garrow_int8_array_builder_get_type, "garrow_int8_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_int8_array_builder_new, "garrow_int8_array_builder_new", libs);
  gidLink(cast(void**)&garrow_int8_array_builder_append, "garrow_int8_array_builder_append", libs);
  gidLink(cast(void**)&garrow_int8_array_builder_append_null, "garrow_int8_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_int8_array_builder_append_nulls, "garrow_int8_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_int8_array_builder_append_value, "garrow_int8_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_int8_array_builder_append_values, "garrow_int8_array_builder_append_values", libs);

  // Int8DataType
  gidLink(cast(void**)&garrow_int8_data_type_get_type, "garrow_int8_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_int8_data_type_new, "garrow_int8_data_type_new", libs);

  // Int8Scalar
  gidLink(cast(void**)&garrow_int8_scalar_get_type, "garrow_int8_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_int8_scalar_new, "garrow_int8_scalar_new", libs);
  gidLink(cast(void**)&garrow_int8_scalar_get_value, "garrow_int8_scalar_get_value", libs);

  // IntArrayBuilder
  gidLink(cast(void**)&garrow_int_array_builder_get_type, "garrow_int_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_int_array_builder_new, "garrow_int_array_builder_new", libs);
  gidLink(cast(void**)&garrow_int_array_builder_append, "garrow_int_array_builder_append", libs);
  gidLink(cast(void**)&garrow_int_array_builder_append_null, "garrow_int_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_int_array_builder_append_nulls, "garrow_int_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_int_array_builder_append_value, "garrow_int_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_int_array_builder_append_values, "garrow_int_array_builder_append_values", libs);

  // IntegerDataType
  gidLink(cast(void**)&garrow_integer_data_type_get_type, "garrow_integer_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_integer_data_type_is_signed, "garrow_integer_data_type_is_signed", libs);

  // IntervalDataType
  gidLink(cast(void**)&garrow_interval_data_type_get_type, "garrow_interval_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_interval_data_type_get_interval_type, "garrow_interval_data_type_get_interval_type", libs);

  // JSONReadOptions
  gidLink(cast(void**)&garrow_json_read_options_get_type, "garrow_json_read_options_get_type", libs);
  gidLink(cast(void**)&garrow_json_read_options_new, "garrow_json_read_options_new", libs);

  // JSONReader
  gidLink(cast(void**)&garrow_json_reader_get_type, "garrow_json_reader_get_type", libs);
  gidLink(cast(void**)&garrow_json_reader_new, "garrow_json_reader_new", libs);
  gidLink(cast(void**)&garrow_json_reader_read, "garrow_json_reader_read", libs);

  // LargeBinaryArray
  gidLink(cast(void**)&garrow_large_binary_array_get_type, "garrow_large_binary_array_get_type", libs);
  gidLink(cast(void**)&garrow_large_binary_array_new, "garrow_large_binary_array_new", libs);
  gidLink(cast(void**)&garrow_large_binary_array_get_buffer, "garrow_large_binary_array_get_buffer", libs);
  gidLink(cast(void**)&garrow_large_binary_array_get_data_buffer, "garrow_large_binary_array_get_data_buffer", libs);
  gidLink(cast(void**)&garrow_large_binary_array_get_offsets_buffer, "garrow_large_binary_array_get_offsets_buffer", libs);
  gidLink(cast(void**)&garrow_large_binary_array_get_value, "garrow_large_binary_array_get_value", libs);

  // LargeBinaryArrayBuilder
  gidLink(cast(void**)&garrow_large_binary_array_builder_get_type, "garrow_large_binary_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_large_binary_array_builder_new, "garrow_large_binary_array_builder_new", libs);
  gidLink(cast(void**)&garrow_large_binary_array_builder_append_null, "garrow_large_binary_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_large_binary_array_builder_append_nulls, "garrow_large_binary_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_large_binary_array_builder_append_value, "garrow_large_binary_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_large_binary_array_builder_append_value_bytes, "garrow_large_binary_array_builder_append_value_bytes", libs);
  gidLink(cast(void**)&garrow_large_binary_array_builder_append_values, "garrow_large_binary_array_builder_append_values", libs);

  // LargeBinaryDataType
  gidLink(cast(void**)&garrow_large_binary_data_type_get_type, "garrow_large_binary_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_large_binary_data_type_new, "garrow_large_binary_data_type_new", libs);

  // LargeBinaryScalar
  gidLink(cast(void**)&garrow_large_binary_scalar_get_type, "garrow_large_binary_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_large_binary_scalar_new, "garrow_large_binary_scalar_new", libs);

  // LargeListArray
  gidLink(cast(void**)&garrow_large_list_array_get_type, "garrow_large_list_array_get_type", libs);
  gidLink(cast(void**)&garrow_large_list_array_new, "garrow_large_list_array_new", libs);
  gidLink(cast(void**)&garrow_large_list_array_get_value, "garrow_large_list_array_get_value", libs);
  gidLink(cast(void**)&garrow_large_list_array_get_value_length, "garrow_large_list_array_get_value_length", libs);
  gidLink(cast(void**)&garrow_large_list_array_get_value_offset, "garrow_large_list_array_get_value_offset", libs);
  gidLink(cast(void**)&garrow_large_list_array_get_value_offsets, "garrow_large_list_array_get_value_offsets", libs);
  gidLink(cast(void**)&garrow_large_list_array_get_value_type, "garrow_large_list_array_get_value_type", libs);
  gidLink(cast(void**)&garrow_large_list_array_get_values, "garrow_large_list_array_get_values", libs);

  // LargeListArrayBuilder
  gidLink(cast(void**)&garrow_large_list_array_builder_get_type, "garrow_large_list_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_large_list_array_builder_new, "garrow_large_list_array_builder_new", libs);
  gidLink(cast(void**)&garrow_large_list_array_builder_append_null, "garrow_large_list_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_large_list_array_builder_append_value, "garrow_large_list_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_large_list_array_builder_get_value_builder, "garrow_large_list_array_builder_get_value_builder", libs);

  // LargeListDataType
  gidLink(cast(void**)&garrow_large_list_data_type_get_type, "garrow_large_list_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_large_list_data_type_new, "garrow_large_list_data_type_new", libs);
  gidLink(cast(void**)&garrow_large_list_data_type_get_field, "garrow_large_list_data_type_get_field", libs);

  // LargeListScalar
  gidLink(cast(void**)&garrow_large_list_scalar_get_type, "garrow_large_list_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_large_list_scalar_new, "garrow_large_list_scalar_new", libs);

  // LargeStringArray
  gidLink(cast(void**)&garrow_large_string_array_get_type, "garrow_large_string_array_get_type", libs);
  gidLink(cast(void**)&garrow_large_string_array_new, "garrow_large_string_array_new", libs);
  gidLink(cast(void**)&garrow_large_string_array_get_string, "garrow_large_string_array_get_string", libs);

  // LargeStringArrayBuilder
  gidLink(cast(void**)&garrow_large_string_array_builder_get_type, "garrow_large_string_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_large_string_array_builder_new, "garrow_large_string_array_builder_new", libs);
  gidLink(cast(void**)&garrow_large_string_array_builder_append_string, "garrow_large_string_array_builder_append_string", libs);
  gidLink(cast(void**)&garrow_large_string_array_builder_append_string_len, "garrow_large_string_array_builder_append_string_len", libs);
  gidLink(cast(void**)&garrow_large_string_array_builder_append_strings, "garrow_large_string_array_builder_append_strings", libs);

  // LargeStringDataType
  gidLink(cast(void**)&garrow_large_string_data_type_get_type, "garrow_large_string_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_large_string_data_type_new, "garrow_large_string_data_type_new", libs);

  // LargeStringScalar
  gidLink(cast(void**)&garrow_large_string_scalar_get_type, "garrow_large_string_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_large_string_scalar_new, "garrow_large_string_scalar_new", libs);

  // ListArray
  gidLink(cast(void**)&garrow_list_array_get_type, "garrow_list_array_get_type", libs);
  gidLink(cast(void**)&garrow_list_array_new, "garrow_list_array_new", libs);
  gidLink(cast(void**)&garrow_list_array_get_value, "garrow_list_array_get_value", libs);
  gidLink(cast(void**)&garrow_list_array_get_value_length, "garrow_list_array_get_value_length", libs);
  gidLink(cast(void**)&garrow_list_array_get_value_offset, "garrow_list_array_get_value_offset", libs);
  gidLink(cast(void**)&garrow_list_array_get_value_offsets, "garrow_list_array_get_value_offsets", libs);
  gidLink(cast(void**)&garrow_list_array_get_value_type, "garrow_list_array_get_value_type", libs);
  gidLink(cast(void**)&garrow_list_array_get_values, "garrow_list_array_get_values", libs);

  // ListArrayBuilder
  gidLink(cast(void**)&garrow_list_array_builder_get_type, "garrow_list_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_list_array_builder_new, "garrow_list_array_builder_new", libs);
  gidLink(cast(void**)&garrow_list_array_builder_append, "garrow_list_array_builder_append", libs);
  gidLink(cast(void**)&garrow_list_array_builder_append_null, "garrow_list_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_list_array_builder_append_value, "garrow_list_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_list_array_builder_get_value_builder, "garrow_list_array_builder_get_value_builder", libs);

  // ListDataType
  gidLink(cast(void**)&garrow_list_data_type_get_type, "garrow_list_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_list_data_type_new, "garrow_list_data_type_new", libs);
  gidLink(cast(void**)&garrow_list_data_type_get_field, "garrow_list_data_type_get_field", libs);
  gidLink(cast(void**)&garrow_list_data_type_get_value_field, "garrow_list_data_type_get_value_field", libs);

  // ListScalar
  gidLink(cast(void**)&garrow_list_scalar_get_type, "garrow_list_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_list_scalar_new, "garrow_list_scalar_new", libs);

  // LiteralExpression
  gidLink(cast(void**)&garrow_literal_expression_get_type, "garrow_literal_expression_get_type", libs);
  gidLink(cast(void**)&garrow_literal_expression_new, "garrow_literal_expression_new", libs);

  // LocalFileSystem
  gidLink(cast(void**)&garrow_local_file_system_get_type, "garrow_local_file_system_get_type", libs);
  gidLink(cast(void**)&garrow_local_file_system_new, "garrow_local_file_system_new", libs);

  // LocalFileSystemOptions
  gidLink(cast(void**)&garrow_local_file_system_options_get_type, "garrow_local_file_system_options_get_type", libs);
  gidLink(cast(void**)&garrow_local_file_system_options_new, "garrow_local_file_system_options_new", libs);

  // MapArray
  gidLink(cast(void**)&garrow_map_array_get_type, "garrow_map_array_get_type", libs);
  gidLink(cast(void**)&garrow_map_array_new, "garrow_map_array_new", libs);
  gidLink(cast(void**)&garrow_map_array_get_items, "garrow_map_array_get_items", libs);
  gidLink(cast(void**)&garrow_map_array_get_keys, "garrow_map_array_get_keys", libs);

  // MapArrayBuilder
  gidLink(cast(void**)&garrow_map_array_builder_get_type, "garrow_map_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_map_array_builder_new, "garrow_map_array_builder_new", libs);
  gidLink(cast(void**)&garrow_map_array_builder_append_null, "garrow_map_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_map_array_builder_append_nulls, "garrow_map_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_map_array_builder_append_value, "garrow_map_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_map_array_builder_append_values, "garrow_map_array_builder_append_values", libs);
  gidLink(cast(void**)&garrow_map_array_builder_get_item_builder, "garrow_map_array_builder_get_item_builder", libs);
  gidLink(cast(void**)&garrow_map_array_builder_get_key_builder, "garrow_map_array_builder_get_key_builder", libs);
  gidLink(cast(void**)&garrow_map_array_builder_get_value_builder, "garrow_map_array_builder_get_value_builder", libs);

  // MapDataType
  gidLink(cast(void**)&garrow_map_data_type_get_type, "garrow_map_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_map_data_type_new, "garrow_map_data_type_new", libs);
  gidLink(cast(void**)&garrow_map_data_type_get_item_type, "garrow_map_data_type_get_item_type", libs);
  gidLink(cast(void**)&garrow_map_data_type_get_key_type, "garrow_map_data_type_get_key_type", libs);

  // MapScalar
  gidLink(cast(void**)&garrow_map_scalar_get_type, "garrow_map_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_map_scalar_new, "garrow_map_scalar_new", libs);

  // MatchSubstringOptions
  gidLink(cast(void**)&garrow_match_substring_options_get_type, "garrow_match_substring_options_get_type", libs);
  gidLink(cast(void**)&garrow_match_substring_options_new, "garrow_match_substring_options_new", libs);

  // MemoryMappedInputStream
  gidLink(cast(void**)&garrow_memory_mapped_input_stream_get_type, "garrow_memory_mapped_input_stream_get_type", libs);
  gidLink(cast(void**)&garrow_memory_mapped_input_stream_new, "garrow_memory_mapped_input_stream_new", libs);

  // MemoryPool
  gidLink(cast(void**)&garrow_memory_pool_get_type, "garrow_memory_pool_get_type", libs);
  gidLink(cast(void**)&garrow_memory_pool_default, "garrow_memory_pool_default", libs);
  gidLink(cast(void**)&garrow_memory_pool_get_backend_name, "garrow_memory_pool_get_backend_name", libs);
  gidLink(cast(void**)&garrow_memory_pool_get_bytes_allocated, "garrow_memory_pool_get_bytes_allocated", libs);
  gidLink(cast(void**)&garrow_memory_pool_get_max_memory, "garrow_memory_pool_get_max_memory", libs);

  // MockFileSystem
  gidLink(cast(void**)&garrow_mock_file_system_get_type, "garrow_mock_file_system_get_type", libs);

  // MonthDayNano
  gidLink(cast(void**)&garrow_month_day_nano_get_type, "garrow_month_day_nano_get_type", libs);
  gidLink(cast(void**)&garrow_month_day_nano_new, "garrow_month_day_nano_new", libs);
  gidLink(cast(void**)&garrow_month_day_nano_equal, "garrow_month_day_nano_equal", libs);

  // MonthDayNanoIntervalArray
  gidLink(cast(void**)&garrow_month_day_nano_interval_array_get_type, "garrow_month_day_nano_interval_array_get_type", libs);
  gidLink(cast(void**)&garrow_month_day_nano_interval_array_new, "garrow_month_day_nano_interval_array_new", libs);
  gidLink(cast(void**)&garrow_month_day_nano_interval_array_get_value, "garrow_month_day_nano_interval_array_get_value", libs);
  gidLink(cast(void**)&garrow_month_day_nano_interval_array_get_values, "garrow_month_day_nano_interval_array_get_values", libs);

  // MonthDayNanoIntervalArrayBuilder
  gidLink(cast(void**)&garrow_month_day_nano_interval_array_builder_get_type, "garrow_month_day_nano_interval_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_month_day_nano_interval_array_builder_new, "garrow_month_day_nano_interval_array_builder_new", libs);
  gidLink(cast(void**)&garrow_month_day_nano_interval_array_builder_append_value, "garrow_month_day_nano_interval_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_month_day_nano_interval_array_builder_append_values, "garrow_month_day_nano_interval_array_builder_append_values", libs);

  // MonthDayNanoIntervalDataType
  gidLink(cast(void**)&garrow_month_day_nano_interval_data_type_get_type, "garrow_month_day_nano_interval_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_month_day_nano_interval_data_type_new, "garrow_month_day_nano_interval_data_type_new", libs);

  // MonthDayNanoIntervalScalar
  gidLink(cast(void**)&garrow_month_day_nano_interval_scalar_get_type, "garrow_month_day_nano_interval_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_month_day_nano_interval_scalar_new, "garrow_month_day_nano_interval_scalar_new", libs);
  gidLink(cast(void**)&garrow_month_day_nano_interval_scalar_get_value, "garrow_month_day_nano_interval_scalar_get_value", libs);

  // MonthIntervalArray
  gidLink(cast(void**)&garrow_month_interval_array_get_type, "garrow_month_interval_array_get_type", libs);
  gidLink(cast(void**)&garrow_month_interval_array_new, "garrow_month_interval_array_new", libs);
  gidLink(cast(void**)&garrow_month_interval_array_get_value, "garrow_month_interval_array_get_value", libs);
  gidLink(cast(void**)&garrow_month_interval_array_get_values, "garrow_month_interval_array_get_values", libs);

  // MonthIntervalArrayBuilder
  gidLink(cast(void**)&garrow_month_interval_array_builder_get_type, "garrow_month_interval_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_month_interval_array_builder_new, "garrow_month_interval_array_builder_new", libs);
  gidLink(cast(void**)&garrow_month_interval_array_builder_append_value, "garrow_month_interval_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_month_interval_array_builder_append_values, "garrow_month_interval_array_builder_append_values", libs);

  // MonthIntervalDataType
  gidLink(cast(void**)&garrow_month_interval_data_type_get_type, "garrow_month_interval_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_month_interval_data_type_new, "garrow_month_interval_data_type_new", libs);

  // MonthIntervalScalar
  gidLink(cast(void**)&garrow_month_interval_scalar_get_type, "garrow_month_interval_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_month_interval_scalar_new, "garrow_month_interval_scalar_new", libs);
  gidLink(cast(void**)&garrow_month_interval_scalar_get_value, "garrow_month_interval_scalar_get_value", libs);

  // MutableBuffer
  gidLink(cast(void**)&garrow_mutable_buffer_get_type, "garrow_mutable_buffer_get_type", libs);
  gidLink(cast(void**)&garrow_mutable_buffer_new, "garrow_mutable_buffer_new", libs);
  gidLink(cast(void**)&garrow_mutable_buffer_new_bytes, "garrow_mutable_buffer_new_bytes", libs);
  gidLink(cast(void**)&garrow_mutable_buffer_set_data, "garrow_mutable_buffer_set_data", libs);
  gidLink(cast(void**)&garrow_mutable_buffer_slice, "garrow_mutable_buffer_slice", libs);

  // NullArray
  gidLink(cast(void**)&garrow_null_array_get_type, "garrow_null_array_get_type", libs);
  gidLink(cast(void**)&garrow_null_array_new, "garrow_null_array_new", libs);

  // NullArrayBuilder
  gidLink(cast(void**)&garrow_null_array_builder_get_type, "garrow_null_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_null_array_builder_new, "garrow_null_array_builder_new", libs);
  gidLink(cast(void**)&garrow_null_array_builder_append_null, "garrow_null_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_null_array_builder_append_nulls, "garrow_null_array_builder_append_nulls", libs);

  // NullDataType
  gidLink(cast(void**)&garrow_null_data_type_get_type, "garrow_null_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_null_data_type_new, "garrow_null_data_type_new", libs);

  // NullScalar
  gidLink(cast(void**)&garrow_null_scalar_get_type, "garrow_null_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_null_scalar_new, "garrow_null_scalar_new", libs);

  // NumericArray
  gidLink(cast(void**)&garrow_numeric_array_get_type, "garrow_numeric_array_get_type", libs);
  gidLink(cast(void**)&garrow_numeric_array_mean, "garrow_numeric_array_mean", libs);

  // NumericDataType
  gidLink(cast(void**)&garrow_numeric_data_type_get_type, "garrow_numeric_data_type_get_type", libs);

  // OutputStream
  gidLink(cast(void**)&garrow_output_stream_get_type, "garrow_output_stream_get_type", libs);
  gidLink(cast(void**)&garrow_output_stream_align, "garrow_output_stream_align", libs);
  gidLink(cast(void**)&garrow_output_stream_write_record_batch, "garrow_output_stream_write_record_batch", libs);
  gidLink(cast(void**)&garrow_output_stream_write_tensor, "garrow_output_stream_write_tensor", libs);

  // PrimitiveArray
  gidLink(cast(void**)&garrow_primitive_array_get_type, "garrow_primitive_array_get_type", libs);
  gidLink(cast(void**)&garrow_primitive_array_get_buffer, "garrow_primitive_array_get_buffer", libs);
  gidLink(cast(void**)&garrow_primitive_array_get_data_buffer, "garrow_primitive_array_get_data_buffer", libs);

  // ProjectNodeOptions
  gidLink(cast(void**)&garrow_project_node_options_get_type, "garrow_project_node_options_get_type", libs);
  gidLink(cast(void**)&garrow_project_node_options_new, "garrow_project_node_options_new", libs);

  // QuantileOptions
  gidLink(cast(void**)&garrow_quantile_options_get_type, "garrow_quantile_options_get_type", libs);
  gidLink(cast(void**)&garrow_quantile_options_new, "garrow_quantile_options_new", libs);
  gidLink(cast(void**)&garrow_quantile_options_get_qs, "garrow_quantile_options_get_qs", libs);
  gidLink(cast(void**)&garrow_quantile_options_set_q, "garrow_quantile_options_set_q", libs);
  gidLink(cast(void**)&garrow_quantile_options_set_qs, "garrow_quantile_options_set_qs", libs);

  // RankOptions
  gidLink(cast(void**)&garrow_rank_options_get_type, "garrow_rank_options_get_type", libs);
  gidLink(cast(void**)&garrow_rank_options_new, "garrow_rank_options_new", libs);
  gidLink(cast(void**)&garrow_rank_options_add_sort_key, "garrow_rank_options_add_sort_key", libs);
  gidLink(cast(void**)&garrow_rank_options_equal, "garrow_rank_options_equal", libs);
  gidLink(cast(void**)&garrow_rank_options_get_sort_keys, "garrow_rank_options_get_sort_keys", libs);
  gidLink(cast(void**)&garrow_rank_options_set_sort_keys, "garrow_rank_options_set_sort_keys", libs);

  // ReadOptions
  gidLink(cast(void**)&garrow_read_options_get_type, "garrow_read_options_get_type", libs);
  gidLink(cast(void**)&garrow_read_options_new, "garrow_read_options_new", libs);
  gidLink(cast(void**)&garrow_read_options_get_included_fields, "garrow_read_options_get_included_fields", libs);
  gidLink(cast(void**)&garrow_read_options_set_included_fields, "garrow_read_options_set_included_fields", libs);

  // Readable
  gidLink(cast(void**)&garrow_readable_get_type, "garrow_readable_get_type", libs);
  gidLink(cast(void**)&garrow_readable_read, "garrow_readable_read", libs);
  gidLink(cast(void**)&garrow_readable_read_bytes, "garrow_readable_read_bytes", libs);

  // RecordBatch
  gidLink(cast(void**)&garrow_record_batch_get_type, "garrow_record_batch_get_type", libs);
  gidLink(cast(void**)&garrow_record_batch_new, "garrow_record_batch_new", libs);
  gidLink(cast(void**)&garrow_record_batch_import, "garrow_record_batch_import", libs);
  gidLink(cast(void**)&garrow_record_batch_add_column, "garrow_record_batch_add_column", libs);
  gidLink(cast(void**)&garrow_record_batch_equal, "garrow_record_batch_equal", libs);
  gidLink(cast(void**)&garrow_record_batch_equal_metadata, "garrow_record_batch_equal_metadata", libs);
  gidLink(cast(void**)&garrow_record_batch_export, "garrow_record_batch_export", libs);
  gidLink(cast(void**)&garrow_record_batch_filter, "garrow_record_batch_filter", libs);
  gidLink(cast(void**)&garrow_record_batch_get_column_data, "garrow_record_batch_get_column_data", libs);
  gidLink(cast(void**)&garrow_record_batch_get_column_name, "garrow_record_batch_get_column_name", libs);
  gidLink(cast(void**)&garrow_record_batch_get_n_columns, "garrow_record_batch_get_n_columns", libs);
  gidLink(cast(void**)&garrow_record_batch_get_n_rows, "garrow_record_batch_get_n_rows", libs);
  gidLink(cast(void**)&garrow_record_batch_get_schema, "garrow_record_batch_get_schema", libs);
  gidLink(cast(void**)&garrow_record_batch_remove_column, "garrow_record_batch_remove_column", libs);
  gidLink(cast(void**)&garrow_record_batch_serialize, "garrow_record_batch_serialize", libs);
  gidLink(cast(void**)&garrow_record_batch_slice, "garrow_record_batch_slice", libs);
  gidLink(cast(void**)&garrow_record_batch_sort_indices, "garrow_record_batch_sort_indices", libs);
  gidLink(cast(void**)&garrow_record_batch_take, "garrow_record_batch_take", libs);
  gidLink(cast(void**)&garrow_record_batch_to_string, "garrow_record_batch_to_string", libs);

  // RecordBatchBuilder
  gidLink(cast(void**)&garrow_record_batch_builder_get_type, "garrow_record_batch_builder_get_type", libs);
  gidLink(cast(void**)&garrow_record_batch_builder_new, "garrow_record_batch_builder_new", libs);
  gidLink(cast(void**)&garrow_record_batch_builder_flush, "garrow_record_batch_builder_flush", libs);
  gidLink(cast(void**)&garrow_record_batch_builder_get_column_builder, "garrow_record_batch_builder_get_column_builder", libs);
  gidLink(cast(void**)&garrow_record_batch_builder_get_field, "garrow_record_batch_builder_get_field", libs);
  gidLink(cast(void**)&garrow_record_batch_builder_get_initial_capacity, "garrow_record_batch_builder_get_initial_capacity", libs);
  gidLink(cast(void**)&garrow_record_batch_builder_get_n_columns, "garrow_record_batch_builder_get_n_columns", libs);
  gidLink(cast(void**)&garrow_record_batch_builder_get_n_fields, "garrow_record_batch_builder_get_n_fields", libs);
  gidLink(cast(void**)&garrow_record_batch_builder_get_schema, "garrow_record_batch_builder_get_schema", libs);
  gidLink(cast(void**)&garrow_record_batch_builder_set_initial_capacity, "garrow_record_batch_builder_set_initial_capacity", libs);

  // RecordBatchDatum
  gidLink(cast(void**)&garrow_record_batch_datum_get_type, "garrow_record_batch_datum_get_type", libs);
  gidLink(cast(void**)&garrow_record_batch_datum_new, "garrow_record_batch_datum_new", libs);

  // RecordBatchFileReader
  gidLink(cast(void**)&garrow_record_batch_file_reader_get_type, "garrow_record_batch_file_reader_get_type", libs);
  gidLink(cast(void**)&garrow_record_batch_file_reader_new, "garrow_record_batch_file_reader_new", libs);
  gidLink(cast(void**)&garrow_record_batch_file_reader_get_n_record_batches, "garrow_record_batch_file_reader_get_n_record_batches", libs);
  gidLink(cast(void**)&garrow_record_batch_file_reader_get_record_batch, "garrow_record_batch_file_reader_get_record_batch", libs);
  gidLink(cast(void**)&garrow_record_batch_file_reader_get_schema, "garrow_record_batch_file_reader_get_schema", libs);
  gidLink(cast(void**)&garrow_record_batch_file_reader_get_version, "garrow_record_batch_file_reader_get_version", libs);
  gidLink(cast(void**)&garrow_record_batch_file_reader_read_record_batch, "garrow_record_batch_file_reader_read_record_batch", libs);

  // RecordBatchFileWriter
  gidLink(cast(void**)&garrow_record_batch_file_writer_get_type, "garrow_record_batch_file_writer_get_type", libs);
  gidLink(cast(void**)&garrow_record_batch_file_writer_new, "garrow_record_batch_file_writer_new", libs);

  // RecordBatchIterator
  gidLink(cast(void**)&garrow_record_batch_iterator_get_type, "garrow_record_batch_iterator_get_type", libs);
  gidLink(cast(void**)&garrow_record_batch_iterator_new, "garrow_record_batch_iterator_new", libs);
  gidLink(cast(void**)&garrow_record_batch_iterator_equal, "garrow_record_batch_iterator_equal", libs);
  gidLink(cast(void**)&garrow_record_batch_iterator_next, "garrow_record_batch_iterator_next", libs);
  gidLink(cast(void**)&garrow_record_batch_iterator_to_list, "garrow_record_batch_iterator_to_list", libs);

  // RecordBatchReader
  gidLink(cast(void**)&garrow_record_batch_reader_get_type, "garrow_record_batch_reader_get_type", libs);
  gidLink(cast(void**)&garrow_record_batch_reader_new, "garrow_record_batch_reader_new", libs);
  gidLink(cast(void**)&garrow_record_batch_reader_import, "garrow_record_batch_reader_import", libs);
  gidLink(cast(void**)&garrow_record_batch_reader_export, "garrow_record_batch_reader_export", libs);
  gidLink(cast(void**)&garrow_record_batch_reader_get_next_record_batch, "garrow_record_batch_reader_get_next_record_batch", libs);
  gidLink(cast(void**)&garrow_record_batch_reader_get_schema, "garrow_record_batch_reader_get_schema", libs);
  gidLink(cast(void**)&garrow_record_batch_reader_get_sources, "garrow_record_batch_reader_get_sources", libs);
  gidLink(cast(void**)&garrow_record_batch_reader_read_all, "garrow_record_batch_reader_read_all", libs);
  gidLink(cast(void**)&garrow_record_batch_reader_read_next, "garrow_record_batch_reader_read_next", libs);
  gidLink(cast(void**)&garrow_record_batch_reader_read_next_record_batch, "garrow_record_batch_reader_read_next_record_batch", libs);

  // RecordBatchStreamReader
  gidLink(cast(void**)&garrow_record_batch_stream_reader_get_type, "garrow_record_batch_stream_reader_get_type", libs);
  gidLink(cast(void**)&garrow_record_batch_stream_reader_new, "garrow_record_batch_stream_reader_new", libs);

  // RecordBatchStreamWriter
  gidLink(cast(void**)&garrow_record_batch_stream_writer_get_type, "garrow_record_batch_stream_writer_get_type", libs);
  gidLink(cast(void**)&garrow_record_batch_stream_writer_new, "garrow_record_batch_stream_writer_new", libs);

  // RecordBatchWriter
  gidLink(cast(void**)&garrow_record_batch_writer_get_type, "garrow_record_batch_writer_get_type", libs);
  gidLink(cast(void**)&garrow_record_batch_writer_close, "garrow_record_batch_writer_close", libs);
  gidLink(cast(void**)&garrow_record_batch_writer_is_closed, "garrow_record_batch_writer_is_closed", libs);
  gidLink(cast(void**)&garrow_record_batch_writer_write_record_batch, "garrow_record_batch_writer_write_record_batch", libs);
  gidLink(cast(void**)&garrow_record_batch_writer_write_table, "garrow_record_batch_writer_write_table", libs);

  // ResizableBuffer
  gidLink(cast(void**)&garrow_resizable_buffer_get_type, "garrow_resizable_buffer_get_type", libs);
  gidLink(cast(void**)&garrow_resizable_buffer_new, "garrow_resizable_buffer_new", libs);
  gidLink(cast(void**)&garrow_resizable_buffer_reserve, "garrow_resizable_buffer_reserve", libs);
  gidLink(cast(void**)&garrow_resizable_buffer_resize, "garrow_resizable_buffer_resize", libs);

  // RoundOptions
  gidLink(cast(void**)&garrow_round_options_get_type, "garrow_round_options_get_type", libs);
  gidLink(cast(void**)&garrow_round_options_new, "garrow_round_options_new", libs);

  // RoundToMultipleOptions
  gidLink(cast(void**)&garrow_round_to_multiple_options_get_type, "garrow_round_to_multiple_options_get_type", libs);
  gidLink(cast(void**)&garrow_round_to_multiple_options_new, "garrow_round_to_multiple_options_new", libs);

  // RunEndEncodeOptions
  gidLink(cast(void**)&garrow_run_end_encode_options_get_type, "garrow_run_end_encode_options_get_type", libs);
  gidLink(cast(void**)&garrow_run_end_encode_options_new, "garrow_run_end_encode_options_new", libs);

  // RunEndEncodedArray
  gidLink(cast(void**)&garrow_run_end_encoded_array_get_type, "garrow_run_end_encoded_array_get_type", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_array_new, "garrow_run_end_encoded_array_new", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_array_decode, "garrow_run_end_encoded_array_decode", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_array_find_physical_length, "garrow_run_end_encoded_array_find_physical_length", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_array_find_physical_offset, "garrow_run_end_encoded_array_find_physical_offset", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_array_get_logical_run_ends, "garrow_run_end_encoded_array_get_logical_run_ends", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_array_get_logical_values, "garrow_run_end_encoded_array_get_logical_values", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_array_get_run_ends, "garrow_run_end_encoded_array_get_run_ends", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_array_get_values, "garrow_run_end_encoded_array_get_values", libs);

  // RunEndEncodedDataType
  gidLink(cast(void**)&garrow_run_end_encoded_data_type_get_type, "garrow_run_end_encoded_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_data_type_new, "garrow_run_end_encoded_data_type_new", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_data_type_get_run_end_data_type, "garrow_run_end_encoded_data_type_get_run_end_data_type", libs);
  gidLink(cast(void**)&garrow_run_end_encoded_data_type_get_value_data_type, "garrow_run_end_encoded_data_type_get_value_data_type", libs);

  // S3FileSystem
  gidLink(cast(void**)&garrow_s3_file_system_get_type, "garrow_s3_file_system_get_type", libs);

  // S3GlobalOptions
  gidLink(cast(void**)&garrow_s3_global_options_get_type, "garrow_s3_global_options_get_type", libs);
  gidLink(cast(void**)&garrow_s3_global_options_new, "garrow_s3_global_options_new", libs);

  // Scalar
  gidLink(cast(void**)&garrow_scalar_get_type, "garrow_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_scalar_parse, "garrow_scalar_parse", libs);
  gidLink(cast(void**)&garrow_scalar_cast, "garrow_scalar_cast", libs);
  gidLink(cast(void**)&garrow_scalar_equal, "garrow_scalar_equal", libs);
  gidLink(cast(void**)&garrow_scalar_equal_options, "garrow_scalar_equal_options", libs);
  gidLink(cast(void**)&garrow_scalar_get_data_type, "garrow_scalar_get_data_type", libs);
  gidLink(cast(void**)&garrow_scalar_is_valid, "garrow_scalar_is_valid", libs);
  gidLink(cast(void**)&garrow_scalar_to_string, "garrow_scalar_to_string", libs);

  // ScalarAggregateOptions
  gidLink(cast(void**)&garrow_scalar_aggregate_options_get_type, "garrow_scalar_aggregate_options_get_type", libs);
  gidLink(cast(void**)&garrow_scalar_aggregate_options_new, "garrow_scalar_aggregate_options_new", libs);

  // ScalarDatum
  gidLink(cast(void**)&garrow_scalar_datum_get_type, "garrow_scalar_datum_get_type", libs);
  gidLink(cast(void**)&garrow_scalar_datum_new, "garrow_scalar_datum_new", libs);

  // Schema
  gidLink(cast(void**)&garrow_schema_get_type, "garrow_schema_get_type", libs);
  gidLink(cast(void**)&garrow_schema_new, "garrow_schema_new", libs);
  gidLink(cast(void**)&garrow_schema_import, "garrow_schema_import", libs);
  gidLink(cast(void**)&garrow_schema_add_field, "garrow_schema_add_field", libs);
  gidLink(cast(void**)&garrow_schema_equal, "garrow_schema_equal", libs);
  gidLink(cast(void**)&garrow_schema_export, "garrow_schema_export", libs);
  gidLink(cast(void**)&garrow_schema_get_field, "garrow_schema_get_field", libs);
  gidLink(cast(void**)&garrow_schema_get_field_by_name, "garrow_schema_get_field_by_name", libs);
  gidLink(cast(void**)&garrow_schema_get_field_index, "garrow_schema_get_field_index", libs);
  gidLink(cast(void**)&garrow_schema_get_fields, "garrow_schema_get_fields", libs);
  gidLink(cast(void**)&garrow_schema_get_metadata, "garrow_schema_get_metadata", libs);
  gidLink(cast(void**)&garrow_schema_has_metadata, "garrow_schema_has_metadata", libs);
  gidLink(cast(void**)&garrow_schema_n_fields, "garrow_schema_n_fields", libs);
  gidLink(cast(void**)&garrow_schema_remove_field, "garrow_schema_remove_field", libs);
  gidLink(cast(void**)&garrow_schema_replace_field, "garrow_schema_replace_field", libs);
  gidLink(cast(void**)&garrow_schema_to_string, "garrow_schema_to_string", libs);
  gidLink(cast(void**)&garrow_schema_to_string_metadata, "garrow_schema_to_string_metadata", libs);
  gidLink(cast(void**)&garrow_schema_with_metadata, "garrow_schema_with_metadata", libs);

  // SeekableInputStream
  gidLink(cast(void**)&garrow_seekable_input_stream_get_type, "garrow_seekable_input_stream_get_type", libs);
  gidLink(cast(void**)&garrow_seekable_input_stream_get_size, "garrow_seekable_input_stream_get_size", libs);
  gidLink(cast(void**)&garrow_seekable_input_stream_get_support_zero_copy, "garrow_seekable_input_stream_get_support_zero_copy", libs);
  gidLink(cast(void**)&garrow_seekable_input_stream_peek, "garrow_seekable_input_stream_peek", libs);
  gidLink(cast(void**)&garrow_seekable_input_stream_read_at, "garrow_seekable_input_stream_read_at", libs);
  gidLink(cast(void**)&garrow_seekable_input_stream_read_at_bytes, "garrow_seekable_input_stream_read_at_bytes", libs);

  // SetLookupOptions
  gidLink(cast(void**)&garrow_set_lookup_options_get_type, "garrow_set_lookup_options_get_type", libs);
  gidLink(cast(void**)&garrow_set_lookup_options_new, "garrow_set_lookup_options_new", libs);

  // SinkNodeOptions
  gidLink(cast(void**)&garrow_sink_node_options_get_type, "garrow_sink_node_options_get_type", libs);
  gidLink(cast(void**)&garrow_sink_node_options_new, "garrow_sink_node_options_new", libs);
  gidLink(cast(void**)&garrow_sink_node_options_get_reader, "garrow_sink_node_options_get_reader", libs);

  // SlowFileSystem
  gidLink(cast(void**)&garrow_slow_file_system_get_type, "garrow_slow_file_system_get_type", libs);
  gidLink(cast(void**)&garrow_slow_file_system_new_average_latency, "garrow_slow_file_system_new_average_latency", libs);
  gidLink(cast(void**)&garrow_slow_file_system_new_average_latency_and_seed, "garrow_slow_file_system_new_average_latency_and_seed", libs);

  // SortKey
  gidLink(cast(void**)&garrow_sort_key_get_type, "garrow_sort_key_get_type", libs);
  gidLink(cast(void**)&garrow_sort_key_new, "garrow_sort_key_new", libs);
  gidLink(cast(void**)&garrow_sort_key_equal, "garrow_sort_key_equal", libs);

  // SortOptions
  gidLink(cast(void**)&garrow_sort_options_get_type, "garrow_sort_options_get_type", libs);
  gidLink(cast(void**)&garrow_sort_options_new, "garrow_sort_options_new", libs);
  gidLink(cast(void**)&garrow_sort_options_add_sort_key, "garrow_sort_options_add_sort_key", libs);
  gidLink(cast(void**)&garrow_sort_options_equal, "garrow_sort_options_equal", libs);
  gidLink(cast(void**)&garrow_sort_options_get_sort_keys, "garrow_sort_options_get_sort_keys", libs);
  gidLink(cast(void**)&garrow_sort_options_set_sort_keys, "garrow_sort_options_set_sort_keys", libs);

  // SourceNodeOptions
  gidLink(cast(void**)&garrow_source_node_options_get_type, "garrow_source_node_options_get_type", libs);
  gidLink(cast(void**)&garrow_source_node_options_new_record_batch, "garrow_source_node_options_new_record_batch", libs);
  gidLink(cast(void**)&garrow_source_node_options_new_record_batch_reader, "garrow_source_node_options_new_record_batch_reader", libs);
  gidLink(cast(void**)&garrow_source_node_options_new_table, "garrow_source_node_options_new_table", libs);

  // SparseUnionArray
  gidLink(cast(void**)&garrow_sparse_union_array_get_type, "garrow_sparse_union_array_get_type", libs);
  gidLink(cast(void**)&garrow_sparse_union_array_new, "garrow_sparse_union_array_new", libs);
  gidLink(cast(void**)&garrow_sparse_union_array_new_data_type, "garrow_sparse_union_array_new_data_type", libs);

  // SparseUnionArrayBuilder
  gidLink(cast(void**)&garrow_sparse_union_array_builder_get_type, "garrow_sparse_union_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_sparse_union_array_builder_new, "garrow_sparse_union_array_builder_new", libs);

  // SparseUnionDataType
  gidLink(cast(void**)&garrow_sparse_union_data_type_get_type, "garrow_sparse_union_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_sparse_union_data_type_new, "garrow_sparse_union_data_type_new", libs);

  // SparseUnionScalar
  gidLink(cast(void**)&garrow_sparse_union_scalar_get_type, "garrow_sparse_union_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_sparse_union_scalar_new, "garrow_sparse_union_scalar_new", libs);

  // SplitPatternOptions
  gidLink(cast(void**)&garrow_split_pattern_options_get_type, "garrow_split_pattern_options_get_type", libs);
  gidLink(cast(void**)&garrow_split_pattern_options_new, "garrow_split_pattern_options_new", libs);

  // StreamDecoder
  gidLink(cast(void**)&garrow_stream_decoder_get_type, "garrow_stream_decoder_get_type", libs);
  gidLink(cast(void**)&garrow_stream_decoder_new, "garrow_stream_decoder_new", libs);
  gidLink(cast(void**)&garrow_stream_decoder_consume_buffer, "garrow_stream_decoder_consume_buffer", libs);
  gidLink(cast(void**)&garrow_stream_decoder_consume_bytes, "garrow_stream_decoder_consume_bytes", libs);
  gidLink(cast(void**)&garrow_stream_decoder_get_next_required_size, "garrow_stream_decoder_get_next_required_size", libs);
  gidLink(cast(void**)&garrow_stream_decoder_get_schema, "garrow_stream_decoder_get_schema", libs);
  gidLink(cast(void**)&garrow_stream_decoder_reset, "garrow_stream_decoder_reset", libs);

  // StreamListener
  gidLink(cast(void**)&garrow_stream_listener_get_type, "garrow_stream_listener_get_type", libs);
  gidLink(cast(void**)&garrow_stream_listener_on_eos, "garrow_stream_listener_on_eos", libs);
  gidLink(cast(void**)&garrow_stream_listener_on_record_batch_decoded, "garrow_stream_listener_on_record_batch_decoded", libs);
  gidLink(cast(void**)&garrow_stream_listener_on_schema_decoded, "garrow_stream_listener_on_schema_decoded", libs);

  // StrftimeOptions
  gidLink(cast(void**)&garrow_strftime_options_get_type, "garrow_strftime_options_get_type", libs);
  gidLink(cast(void**)&garrow_strftime_options_new, "garrow_strftime_options_new", libs);

  // StringArray
  gidLink(cast(void**)&garrow_string_array_get_type, "garrow_string_array_get_type", libs);
  gidLink(cast(void**)&garrow_string_array_new, "garrow_string_array_new", libs);
  gidLink(cast(void**)&garrow_string_array_get_string, "garrow_string_array_get_string", libs);

  // StringArrayBuilder
  gidLink(cast(void**)&garrow_string_array_builder_get_type, "garrow_string_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_string_array_builder_new, "garrow_string_array_builder_new", libs);
  gidLink(cast(void**)&garrow_string_array_builder_append, "garrow_string_array_builder_append", libs);
  gidLink(cast(void**)&garrow_string_array_builder_append_string, "garrow_string_array_builder_append_string", libs);
  gidLink(cast(void**)&garrow_string_array_builder_append_string_len, "garrow_string_array_builder_append_string_len", libs);
  gidLink(cast(void**)&garrow_string_array_builder_append_strings, "garrow_string_array_builder_append_strings", libs);
  gidLink(cast(void**)&garrow_string_array_builder_append_value, "garrow_string_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_string_array_builder_append_values, "garrow_string_array_builder_append_values", libs);

  // StringDataType
  gidLink(cast(void**)&garrow_string_data_type_get_type, "garrow_string_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_string_data_type_new, "garrow_string_data_type_new", libs);

  // StringDictionaryArrayBuilder
  gidLink(cast(void**)&garrow_string_dictionary_array_builder_get_type, "garrow_string_dictionary_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_string_dictionary_array_builder_new, "garrow_string_dictionary_array_builder_new", libs);
  gidLink(cast(void**)&garrow_string_dictionary_array_builder_append_array, "garrow_string_dictionary_array_builder_append_array", libs);
  gidLink(cast(void**)&garrow_string_dictionary_array_builder_append_indices, "garrow_string_dictionary_array_builder_append_indices", libs);
  gidLink(cast(void**)&garrow_string_dictionary_array_builder_append_null, "garrow_string_dictionary_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_string_dictionary_array_builder_append_string, "garrow_string_dictionary_array_builder_append_string", libs);
  gidLink(cast(void**)&garrow_string_dictionary_array_builder_finish_delta, "garrow_string_dictionary_array_builder_finish_delta", libs);
  gidLink(cast(void**)&garrow_string_dictionary_array_builder_get_dictionary_length, "garrow_string_dictionary_array_builder_get_dictionary_length", libs);
  gidLink(cast(void**)&garrow_string_dictionary_array_builder_insert_memo_values, "garrow_string_dictionary_array_builder_insert_memo_values", libs);
  gidLink(cast(void**)&garrow_string_dictionary_array_builder_reset_full, "garrow_string_dictionary_array_builder_reset_full", libs);

  // StringScalar
  gidLink(cast(void**)&garrow_string_scalar_get_type, "garrow_string_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_string_scalar_new, "garrow_string_scalar_new", libs);

  // StringViewDataType
  gidLink(cast(void**)&garrow_string_view_data_type_get_type, "garrow_string_view_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_string_view_data_type_new, "garrow_string_view_data_type_new", libs);

  // StrptimeOptions
  gidLink(cast(void**)&garrow_strptime_options_get_type, "garrow_strptime_options_get_type", libs);
  gidLink(cast(void**)&garrow_strptime_options_new, "garrow_strptime_options_new", libs);

  // StrptimeTimestampParser
  gidLink(cast(void**)&garrow_strptime_timestamp_parser_get_type, "garrow_strptime_timestamp_parser_get_type", libs);
  gidLink(cast(void**)&garrow_strptime_timestamp_parser_new, "garrow_strptime_timestamp_parser_new", libs);
  gidLink(cast(void**)&garrow_strptime_timestamp_parser_get_format, "garrow_strptime_timestamp_parser_get_format", libs);

  // StructArray
  gidLink(cast(void**)&garrow_struct_array_get_type, "garrow_struct_array_get_type", libs);
  gidLink(cast(void**)&garrow_struct_array_new, "garrow_struct_array_new", libs);
  gidLink(cast(void**)&garrow_struct_array_flatten, "garrow_struct_array_flatten", libs);
  gidLink(cast(void**)&garrow_struct_array_get_field, "garrow_struct_array_get_field", libs);
  gidLink(cast(void**)&garrow_struct_array_get_fields, "garrow_struct_array_get_fields", libs);

  // StructArrayBuilder
  gidLink(cast(void**)&garrow_struct_array_builder_get_type, "garrow_struct_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_struct_array_builder_new, "garrow_struct_array_builder_new", libs);
  gidLink(cast(void**)&garrow_struct_array_builder_append, "garrow_struct_array_builder_append", libs);
  gidLink(cast(void**)&garrow_struct_array_builder_append_null, "garrow_struct_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_struct_array_builder_append_value, "garrow_struct_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_struct_array_builder_get_field_builder, "garrow_struct_array_builder_get_field_builder", libs);
  gidLink(cast(void**)&garrow_struct_array_builder_get_field_builders, "garrow_struct_array_builder_get_field_builders", libs);

  // StructDataType
  gidLink(cast(void**)&garrow_struct_data_type_get_type, "garrow_struct_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_struct_data_type_new, "garrow_struct_data_type_new", libs);
  gidLink(cast(void**)&garrow_struct_data_type_get_field, "garrow_struct_data_type_get_field", libs);
  gidLink(cast(void**)&garrow_struct_data_type_get_field_by_name, "garrow_struct_data_type_get_field_by_name", libs);
  gidLink(cast(void**)&garrow_struct_data_type_get_field_index, "garrow_struct_data_type_get_field_index", libs);
  gidLink(cast(void**)&garrow_struct_data_type_get_fields, "garrow_struct_data_type_get_fields", libs);
  gidLink(cast(void**)&garrow_struct_data_type_get_n_fields, "garrow_struct_data_type_get_n_fields", libs);

  // StructFieldOptions
  gidLink(cast(void**)&garrow_struct_field_options_get_type, "garrow_struct_field_options_get_type", libs);
  gidLink(cast(void**)&garrow_struct_field_options_new, "garrow_struct_field_options_new", libs);
  gidLink(cast(void**)&garrow_struct_field_options_set_field_ref, "garrow_struct_field_options_set_field_ref", libs);

  // StructScalar
  gidLink(cast(void**)&garrow_struct_scalar_get_type, "garrow_struct_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_struct_scalar_new, "garrow_struct_scalar_new", libs);
  gidLink(cast(void**)&garrow_struct_scalar_get_value, "garrow_struct_scalar_get_value", libs);

  // SubTreeFileSystem
  gidLink(cast(void**)&garrow_sub_tree_file_system_get_type, "garrow_sub_tree_file_system_get_type", libs);
  gidLink(cast(void**)&garrow_sub_tree_file_system_new, "garrow_sub_tree_file_system_new", libs);

  // Table
  gidLink(cast(void**)&garrow_table_get_type, "garrow_table_get_type", libs);
  gidLink(cast(void**)&garrow_table_new_arrays, "garrow_table_new_arrays", libs);
  gidLink(cast(void**)&garrow_table_new_chunked_arrays, "garrow_table_new_chunked_arrays", libs);
  gidLink(cast(void**)&garrow_table_new_record_batches, "garrow_table_new_record_batches", libs);
  gidLink(cast(void**)&garrow_table_new_values, "garrow_table_new_values", libs);
  gidLink(cast(void**)&garrow_table_add_column, "garrow_table_add_column", libs);
  gidLink(cast(void**)&garrow_table_combine_chunks, "garrow_table_combine_chunks", libs);
  gidLink(cast(void**)&garrow_table_concatenate, "garrow_table_concatenate", libs);
  gidLink(cast(void**)&garrow_table_equal, "garrow_table_equal", libs);
  gidLink(cast(void**)&garrow_table_equal_metadata, "garrow_table_equal_metadata", libs);
  gidLink(cast(void**)&garrow_table_filter, "garrow_table_filter", libs);
  gidLink(cast(void**)&garrow_table_filter_chunked_array, "garrow_table_filter_chunked_array", libs);
  gidLink(cast(void**)&garrow_table_get_column_data, "garrow_table_get_column_data", libs);
  gidLink(cast(void**)&garrow_table_get_n_columns, "garrow_table_get_n_columns", libs);
  gidLink(cast(void**)&garrow_table_get_n_rows, "garrow_table_get_n_rows", libs);
  gidLink(cast(void**)&garrow_table_get_schema, "garrow_table_get_schema", libs);
  gidLink(cast(void**)&garrow_table_remove_column, "garrow_table_remove_column", libs);
  gidLink(cast(void**)&garrow_table_replace_column, "garrow_table_replace_column", libs);
  gidLink(cast(void**)&garrow_table_slice, "garrow_table_slice", libs);
  gidLink(cast(void**)&garrow_table_sort_indices, "garrow_table_sort_indices", libs);
  gidLink(cast(void**)&garrow_table_take, "garrow_table_take", libs);
  gidLink(cast(void**)&garrow_table_take_chunked_array, "garrow_table_take_chunked_array", libs);
  gidLink(cast(void**)&garrow_table_to_string, "garrow_table_to_string", libs);
  gidLink(cast(void**)&garrow_table_write_as_feather, "garrow_table_write_as_feather", libs);

  // TableBatchReader
  gidLink(cast(void**)&garrow_table_batch_reader_get_type, "garrow_table_batch_reader_get_type", libs);
  gidLink(cast(void**)&garrow_table_batch_reader_new, "garrow_table_batch_reader_new", libs);
  gidLink(cast(void**)&garrow_table_batch_reader_set_max_chunk_size, "garrow_table_batch_reader_set_max_chunk_size", libs);

  // TableConcatenateOptions
  gidLink(cast(void**)&garrow_table_concatenate_options_get_type, "garrow_table_concatenate_options_get_type", libs);
  gidLink(cast(void**)&garrow_table_concatenate_options_new, "garrow_table_concatenate_options_new", libs);

  // TableDatum
  gidLink(cast(void**)&garrow_table_datum_get_type, "garrow_table_datum_get_type", libs);
  gidLink(cast(void**)&garrow_table_datum_new, "garrow_table_datum_new", libs);

  // TakeOptions
  gidLink(cast(void**)&garrow_take_options_get_type, "garrow_take_options_get_type", libs);
  gidLink(cast(void**)&garrow_take_options_new, "garrow_take_options_new", libs);

  // TemporalDataType
  gidLink(cast(void**)&garrow_temporal_data_type_get_type, "garrow_temporal_data_type_get_type", libs);

  // Tensor
  gidLink(cast(void**)&garrow_tensor_get_type, "garrow_tensor_get_type", libs);
  gidLink(cast(void**)&garrow_tensor_new, "garrow_tensor_new", libs);
  gidLink(cast(void**)&garrow_tensor_equal, "garrow_tensor_equal", libs);
  gidLink(cast(void**)&garrow_tensor_get_buffer, "garrow_tensor_get_buffer", libs);
  gidLink(cast(void**)&garrow_tensor_get_dimension_name, "garrow_tensor_get_dimension_name", libs);
  gidLink(cast(void**)&garrow_tensor_get_n_dimensions, "garrow_tensor_get_n_dimensions", libs);
  gidLink(cast(void**)&garrow_tensor_get_shape, "garrow_tensor_get_shape", libs);
  gidLink(cast(void**)&garrow_tensor_get_size, "garrow_tensor_get_size", libs);
  gidLink(cast(void**)&garrow_tensor_get_strides, "garrow_tensor_get_strides", libs);
  gidLink(cast(void**)&garrow_tensor_get_value_data_type, "garrow_tensor_get_value_data_type", libs);
  gidLink(cast(void**)&garrow_tensor_get_value_type, "garrow_tensor_get_value_type", libs);
  gidLink(cast(void**)&garrow_tensor_is_column_major, "garrow_tensor_is_column_major", libs);
  gidLink(cast(void**)&garrow_tensor_is_contiguous, "garrow_tensor_is_contiguous", libs);
  gidLink(cast(void**)&garrow_tensor_is_mutable, "garrow_tensor_is_mutable", libs);
  gidLink(cast(void**)&garrow_tensor_is_row_major, "garrow_tensor_is_row_major", libs);

  // Time32Array
  gidLink(cast(void**)&garrow_time32_array_get_type, "garrow_time32_array_get_type", libs);
  gidLink(cast(void**)&garrow_time32_array_new, "garrow_time32_array_new", libs);
  gidLink(cast(void**)&garrow_time32_array_get_value, "garrow_time32_array_get_value", libs);
  gidLink(cast(void**)&garrow_time32_array_get_values, "garrow_time32_array_get_values", libs);

  // Time32ArrayBuilder
  gidLink(cast(void**)&garrow_time32_array_builder_get_type, "garrow_time32_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_time32_array_builder_new, "garrow_time32_array_builder_new", libs);
  gidLink(cast(void**)&garrow_time32_array_builder_append, "garrow_time32_array_builder_append", libs);
  gidLink(cast(void**)&garrow_time32_array_builder_append_null, "garrow_time32_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_time32_array_builder_append_nulls, "garrow_time32_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_time32_array_builder_append_value, "garrow_time32_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_time32_array_builder_append_values, "garrow_time32_array_builder_append_values", libs);

  // Time32DataType
  gidLink(cast(void**)&garrow_time32_data_type_get_type, "garrow_time32_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_time32_data_type_new, "garrow_time32_data_type_new", libs);

  // Time32Scalar
  gidLink(cast(void**)&garrow_time32_scalar_get_type, "garrow_time32_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_time32_scalar_new, "garrow_time32_scalar_new", libs);
  gidLink(cast(void**)&garrow_time32_scalar_get_value, "garrow_time32_scalar_get_value", libs);

  // Time64Array
  gidLink(cast(void**)&garrow_time64_array_get_type, "garrow_time64_array_get_type", libs);
  gidLink(cast(void**)&garrow_time64_array_new, "garrow_time64_array_new", libs);
  gidLink(cast(void**)&garrow_time64_array_get_value, "garrow_time64_array_get_value", libs);
  gidLink(cast(void**)&garrow_time64_array_get_values, "garrow_time64_array_get_values", libs);

  // Time64ArrayBuilder
  gidLink(cast(void**)&garrow_time64_array_builder_get_type, "garrow_time64_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_time64_array_builder_new, "garrow_time64_array_builder_new", libs);
  gidLink(cast(void**)&garrow_time64_array_builder_append, "garrow_time64_array_builder_append", libs);
  gidLink(cast(void**)&garrow_time64_array_builder_append_null, "garrow_time64_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_time64_array_builder_append_nulls, "garrow_time64_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_time64_array_builder_append_value, "garrow_time64_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_time64_array_builder_append_values, "garrow_time64_array_builder_append_values", libs);

  // Time64DataType
  gidLink(cast(void**)&garrow_time64_data_type_get_type, "garrow_time64_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_time64_data_type_new, "garrow_time64_data_type_new", libs);

  // Time64Scalar
  gidLink(cast(void**)&garrow_time64_scalar_get_type, "garrow_time64_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_time64_scalar_new, "garrow_time64_scalar_new", libs);
  gidLink(cast(void**)&garrow_time64_scalar_get_value, "garrow_time64_scalar_get_value", libs);

  // TimeDataType
  gidLink(cast(void**)&garrow_time_data_type_get_type, "garrow_time_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_time_data_type_get_unit, "garrow_time_data_type_get_unit", libs);

  // TimestampArray
  gidLink(cast(void**)&garrow_timestamp_array_get_type, "garrow_timestamp_array_get_type", libs);
  gidLink(cast(void**)&garrow_timestamp_array_new, "garrow_timestamp_array_new", libs);
  gidLink(cast(void**)&garrow_timestamp_array_get_value, "garrow_timestamp_array_get_value", libs);
  gidLink(cast(void**)&garrow_timestamp_array_get_values, "garrow_timestamp_array_get_values", libs);

  // TimestampArrayBuilder
  gidLink(cast(void**)&garrow_timestamp_array_builder_get_type, "garrow_timestamp_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_timestamp_array_builder_new, "garrow_timestamp_array_builder_new", libs);
  gidLink(cast(void**)&garrow_timestamp_array_builder_append, "garrow_timestamp_array_builder_append", libs);
  gidLink(cast(void**)&garrow_timestamp_array_builder_append_null, "garrow_timestamp_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_timestamp_array_builder_append_nulls, "garrow_timestamp_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_timestamp_array_builder_append_value, "garrow_timestamp_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_timestamp_array_builder_append_values, "garrow_timestamp_array_builder_append_values", libs);

  // TimestampDataType
  gidLink(cast(void**)&garrow_timestamp_data_type_get_type, "garrow_timestamp_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_timestamp_data_type_new, "garrow_timestamp_data_type_new", libs);
  gidLink(cast(void**)&garrow_timestamp_data_type_get_unit, "garrow_timestamp_data_type_get_unit", libs);

  // TimestampParser
  gidLink(cast(void**)&garrow_timestamp_parser_get_type, "garrow_timestamp_parser_get_type", libs);
  gidLink(cast(void**)&garrow_timestamp_parser_get_kind, "garrow_timestamp_parser_get_kind", libs);

  // TimestampScalar
  gidLink(cast(void**)&garrow_timestamp_scalar_get_type, "garrow_timestamp_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_timestamp_scalar_new, "garrow_timestamp_scalar_new", libs);
  gidLink(cast(void**)&garrow_timestamp_scalar_get_value, "garrow_timestamp_scalar_get_value", libs);

  // UInt16Array
  gidLink(cast(void**)&garrow_uint16_array_get_type, "garrow_uint16_array_get_type", libs);
  gidLink(cast(void**)&garrow_uint16_array_new, "garrow_uint16_array_new", libs);
  gidLink(cast(void**)&garrow_uint16_array_get_value, "garrow_uint16_array_get_value", libs);
  gidLink(cast(void**)&garrow_uint16_array_get_values, "garrow_uint16_array_get_values", libs);
  gidLink(cast(void**)&garrow_uint16_array_sum, "garrow_uint16_array_sum", libs);

  // UInt16ArrayBuilder
  gidLink(cast(void**)&garrow_uint16_array_builder_get_type, "garrow_uint16_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_uint16_array_builder_new, "garrow_uint16_array_builder_new", libs);
  gidLink(cast(void**)&garrow_uint16_array_builder_append, "garrow_uint16_array_builder_append", libs);
  gidLink(cast(void**)&garrow_uint16_array_builder_append_null, "garrow_uint16_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_uint16_array_builder_append_nulls, "garrow_uint16_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_uint16_array_builder_append_value, "garrow_uint16_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_uint16_array_builder_append_values, "garrow_uint16_array_builder_append_values", libs);

  // UInt16DataType
  gidLink(cast(void**)&garrow_uint16_data_type_get_type, "garrow_uint16_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_uint16_data_type_new, "garrow_uint16_data_type_new", libs);

  // UInt16Scalar
  gidLink(cast(void**)&garrow_uint16_scalar_get_type, "garrow_uint16_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_uint16_scalar_new, "garrow_uint16_scalar_new", libs);
  gidLink(cast(void**)&garrow_uint16_scalar_get_value, "garrow_uint16_scalar_get_value", libs);

  // UInt32Array
  gidLink(cast(void**)&garrow_uint32_array_get_type, "garrow_uint32_array_get_type", libs);
  gidLink(cast(void**)&garrow_uint32_array_new, "garrow_uint32_array_new", libs);
  gidLink(cast(void**)&garrow_uint32_array_get_value, "garrow_uint32_array_get_value", libs);
  gidLink(cast(void**)&garrow_uint32_array_get_values, "garrow_uint32_array_get_values", libs);
  gidLink(cast(void**)&garrow_uint32_array_sum, "garrow_uint32_array_sum", libs);

  // UInt32ArrayBuilder
  gidLink(cast(void**)&garrow_uint32_array_builder_get_type, "garrow_uint32_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_uint32_array_builder_new, "garrow_uint32_array_builder_new", libs);
  gidLink(cast(void**)&garrow_uint32_array_builder_append, "garrow_uint32_array_builder_append", libs);
  gidLink(cast(void**)&garrow_uint32_array_builder_append_null, "garrow_uint32_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_uint32_array_builder_append_nulls, "garrow_uint32_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_uint32_array_builder_append_value, "garrow_uint32_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_uint32_array_builder_append_values, "garrow_uint32_array_builder_append_values", libs);

  // UInt32DataType
  gidLink(cast(void**)&garrow_uint32_data_type_get_type, "garrow_uint32_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_uint32_data_type_new, "garrow_uint32_data_type_new", libs);

  // UInt32Scalar
  gidLink(cast(void**)&garrow_uint32_scalar_get_type, "garrow_uint32_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_uint32_scalar_new, "garrow_uint32_scalar_new", libs);
  gidLink(cast(void**)&garrow_uint32_scalar_get_value, "garrow_uint32_scalar_get_value", libs);

  // UInt64Array
  gidLink(cast(void**)&garrow_uint64_array_get_type, "garrow_uint64_array_get_type", libs);
  gidLink(cast(void**)&garrow_uint64_array_new, "garrow_uint64_array_new", libs);
  gidLink(cast(void**)&garrow_uint64_array_get_value, "garrow_uint64_array_get_value", libs);
  gidLink(cast(void**)&garrow_uint64_array_get_values, "garrow_uint64_array_get_values", libs);
  gidLink(cast(void**)&garrow_uint64_array_sum, "garrow_uint64_array_sum", libs);

  // UInt64ArrayBuilder
  gidLink(cast(void**)&garrow_uint64_array_builder_get_type, "garrow_uint64_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_uint64_array_builder_new, "garrow_uint64_array_builder_new", libs);
  gidLink(cast(void**)&garrow_uint64_array_builder_append, "garrow_uint64_array_builder_append", libs);
  gidLink(cast(void**)&garrow_uint64_array_builder_append_null, "garrow_uint64_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_uint64_array_builder_append_nulls, "garrow_uint64_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_uint64_array_builder_append_value, "garrow_uint64_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_uint64_array_builder_append_values, "garrow_uint64_array_builder_append_values", libs);

  // UInt64DataType
  gidLink(cast(void**)&garrow_uint64_data_type_get_type, "garrow_uint64_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_uint64_data_type_new, "garrow_uint64_data_type_new", libs);

  // UInt64Scalar
  gidLink(cast(void**)&garrow_uint64_scalar_get_type, "garrow_uint64_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_uint64_scalar_new, "garrow_uint64_scalar_new", libs);
  gidLink(cast(void**)&garrow_uint64_scalar_get_value, "garrow_uint64_scalar_get_value", libs);

  // UInt8Array
  gidLink(cast(void**)&garrow_uint8_array_get_type, "garrow_uint8_array_get_type", libs);
  gidLink(cast(void**)&garrow_uint8_array_new, "garrow_uint8_array_new", libs);
  gidLink(cast(void**)&garrow_uint8_array_get_value, "garrow_uint8_array_get_value", libs);
  gidLink(cast(void**)&garrow_uint8_array_get_values, "garrow_uint8_array_get_values", libs);
  gidLink(cast(void**)&garrow_uint8_array_sum, "garrow_uint8_array_sum", libs);

  // UInt8ArrayBuilder
  gidLink(cast(void**)&garrow_uint8_array_builder_get_type, "garrow_uint8_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_uint8_array_builder_new, "garrow_uint8_array_builder_new", libs);
  gidLink(cast(void**)&garrow_uint8_array_builder_append, "garrow_uint8_array_builder_append", libs);
  gidLink(cast(void**)&garrow_uint8_array_builder_append_null, "garrow_uint8_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_uint8_array_builder_append_nulls, "garrow_uint8_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_uint8_array_builder_append_value, "garrow_uint8_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_uint8_array_builder_append_values, "garrow_uint8_array_builder_append_values", libs);

  // UInt8DataType
  gidLink(cast(void**)&garrow_uint8_data_type_get_type, "garrow_uint8_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_uint8_data_type_new, "garrow_uint8_data_type_new", libs);

  // UInt8Scalar
  gidLink(cast(void**)&garrow_uint8_scalar_get_type, "garrow_uint8_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_uint8_scalar_new, "garrow_uint8_scalar_new", libs);
  gidLink(cast(void**)&garrow_uint8_scalar_get_value, "garrow_uint8_scalar_get_value", libs);

  // UIntArrayBuilder
  gidLink(cast(void**)&garrow_uint_array_builder_get_type, "garrow_uint_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_uint_array_builder_new, "garrow_uint_array_builder_new", libs);
  gidLink(cast(void**)&garrow_uint_array_builder_append, "garrow_uint_array_builder_append", libs);
  gidLink(cast(void**)&garrow_uint_array_builder_append_null, "garrow_uint_array_builder_append_null", libs);
  gidLink(cast(void**)&garrow_uint_array_builder_append_nulls, "garrow_uint_array_builder_append_nulls", libs);
  gidLink(cast(void**)&garrow_uint_array_builder_append_value, "garrow_uint_array_builder_append_value", libs);
  gidLink(cast(void**)&garrow_uint_array_builder_append_values, "garrow_uint_array_builder_append_values", libs);

  // UTF8NormalizeOptions
  gidLink(cast(void**)&garrow_utf8_normalize_options_get_type, "garrow_utf8_normalize_options_get_type", libs);
  gidLink(cast(void**)&garrow_utf8_normalize_options_new, "garrow_utf8_normalize_options_new", libs);

  // UnionArray
  gidLink(cast(void**)&garrow_union_array_get_type, "garrow_union_array_get_type", libs);
  gidLink(cast(void**)&garrow_union_array_get_child_id, "garrow_union_array_get_child_id", libs);
  gidLink(cast(void**)&garrow_union_array_get_field, "garrow_union_array_get_field", libs);
  gidLink(cast(void**)&garrow_union_array_get_type_code, "garrow_union_array_get_type_code", libs);

  // UnionArrayBuilder
  gidLink(cast(void**)&garrow_union_array_builder_get_type, "garrow_union_array_builder_get_type", libs);
  gidLink(cast(void**)&garrow_union_array_builder_append_child, "garrow_union_array_builder_append_child", libs);
  gidLink(cast(void**)&garrow_union_array_builder_append_value, "garrow_union_array_builder_append_value", libs);

  // UnionDataType
  gidLink(cast(void**)&garrow_union_data_type_get_type, "garrow_union_data_type_get_type", libs);
  gidLink(cast(void**)&garrow_union_data_type_get_field, "garrow_union_data_type_get_field", libs);
  gidLink(cast(void**)&garrow_union_data_type_get_fields, "garrow_union_data_type_get_fields", libs);
  gidLink(cast(void**)&garrow_union_data_type_get_n_fields, "garrow_union_data_type_get_n_fields", libs);
  gidLink(cast(void**)&garrow_union_data_type_get_type_codes, "garrow_union_data_type_get_type_codes", libs);

  // UnionScalar
  gidLink(cast(void**)&garrow_union_scalar_get_type, "garrow_union_scalar_get_type", libs);
  gidLink(cast(void**)&garrow_union_scalar_get_type_code, "garrow_union_scalar_get_type_code", libs);
  gidLink(cast(void**)&garrow_union_scalar_get_value, "garrow_union_scalar_get_value", libs);

  // VarianceOptions
  gidLink(cast(void**)&garrow_variance_options_get_type, "garrow_variance_options_get_type", libs);
  gidLink(cast(void**)&garrow_variance_options_new, "garrow_variance_options_new", libs);

  // Writable
  gidLink(cast(void**)&garrow_writable_get_type, "garrow_writable_get_type", libs);
  gidLink(cast(void**)&garrow_writable_flush, "garrow_writable_flush", libs);
  gidLink(cast(void**)&garrow_writable_write, "garrow_writable_write", libs);

  // WritableFile
  gidLink(cast(void**)&garrow_writable_file_get_type, "garrow_writable_file_get_type", libs);
  gidLink(cast(void**)&garrow_writable_file_write_at, "garrow_writable_file_write_at", libs);

  // WriteOptions
  gidLink(cast(void**)&garrow_write_options_get_type, "garrow_write_options_get_type", libs);
  gidLink(cast(void**)&garrow_write_options_new, "garrow_write_options_new", libs);

  // global
  gidLink(cast(void**)&garrow_s3_finalize, "garrow_s3_finalize", libs);
  gidLink(cast(void**)&garrow_s3_initialize, "garrow_s3_initialize", libs);
  gidLink(cast(void**)&garrow_s3_is_enabled, "garrow_s3_is_enabled", libs);

  // Error
  gidLink(cast(void**)&garrow_error_quark, "garrow_error_quark", libs);
}
