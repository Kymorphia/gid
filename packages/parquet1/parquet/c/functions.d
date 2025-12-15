/// C functions for parquet1 library
module parquet.c.functions;

public import gid.basictypes;
import gid.loader;
import parquet.c.types;
public import arrow.c.types;

version(Windows)
  private immutable LIBS = ["libparquet-glib-1900.dll;parquet-glib-1900.dll;parquet-glib.dll"];
else version(OSX)
  private immutable LIBS = ["libparquet-glib.1900.dylib"];
else
  private immutable LIBS = ["libparquet-glib.so.1900"];

__gshared extern(C)
{
  // ArrowFileReader
  GType function() c_gparquet_arrow_file_reader_get_type; ///
  GParquetArrowFileReader* function(GArrowSeekableInputStream* source, GError** _err) c_gparquet_arrow_file_reader_new_arrow; ///
  GParquetArrowFileReader* function(const(char)* path, GError** _err) c_gparquet_arrow_file_reader_new_path; ///
  GParquetFileMetadata* function(GParquetArrowFileReader* reader) c_gparquet_arrow_file_reader_get_metadata; ///
  int function(GParquetArrowFileReader* reader) c_gparquet_arrow_file_reader_get_n_row_groups; ///
  long function(GParquetArrowFileReader* reader) c_gparquet_arrow_file_reader_get_n_rows; ///
  GArrowSchema* function(GParquetArrowFileReader* reader, GError** _err) c_gparquet_arrow_file_reader_get_schema; ///
  GArrowChunkedArray* function(GParquetArrowFileReader* reader, int i, GError** _err) c_gparquet_arrow_file_reader_read_column_data; ///
  GArrowTable* function(GParquetArrowFileReader* reader, int rowGroupIndex, int* columnIndices, size_t nColumnIndices, GError** _err) c_gparquet_arrow_file_reader_read_row_group; ///
  GArrowTable* function(GParquetArrowFileReader* reader, GError** _err) c_gparquet_arrow_file_reader_read_table; ///
  void function(GParquetArrowFileReader* reader, gboolean useThreads) c_gparquet_arrow_file_reader_set_use_threads; ///

  // ArrowFileWriter
  GType function() c_gparquet_arrow_file_writer_get_type; ///
  GParquetArrowFileWriter* function(GArrowSchema* schema, GArrowOutputStream* sink, GParquetWriterProperties* writerProperties, GError** _err) c_gparquet_arrow_file_writer_new_arrow; ///
  GParquetArrowFileWriter* function(GArrowSchema* schema, const(char)* path, GParquetWriterProperties* writerProperties, GError** _err) c_gparquet_arrow_file_writer_new_path; ///
  gboolean function(GParquetArrowFileWriter* writer, GError** _err) c_gparquet_arrow_file_writer_close; ///
  GArrowSchema* function(GParquetArrowFileWriter* writer) c_gparquet_arrow_file_writer_get_schema; ///
  gboolean function(GParquetArrowFileWriter* writer, GError** _err) c_gparquet_arrow_file_writer_new_buffered_row_group; ///
  gboolean function(GParquetArrowFileWriter* writer, size_t chunkSize, GError** _err) c_gparquet_arrow_file_writer_new_row_group; ///
  gboolean function(GParquetArrowFileWriter* writer, GArrowChunkedArray* chunkedArray, GError** _err) c_gparquet_arrow_file_writer_write_chunked_array; ///
  gboolean function(GParquetArrowFileWriter* writer, GArrowRecordBatch* recordBatch, GError** _err) c_gparquet_arrow_file_writer_write_record_batch; ///
  gboolean function(GParquetArrowFileWriter* writer, GArrowTable* table, size_t chunkSize, GError** _err) c_gparquet_arrow_file_writer_write_table; ///

  // BooleanStatistics
  GType function() c_gparquet_boolean_statistics_get_type; ///
  gboolean function(GParquetBooleanStatistics* statistics) c_gparquet_boolean_statistics_get_max; ///
  gboolean function(GParquetBooleanStatistics* statistics) c_gparquet_boolean_statistics_get_min; ///

  // ByteArrayStatistics
  GType function() c_gparquet_byte_array_statistics_get_type; ///
  GBytes* function(GParquetByteArrayStatistics* statistics) c_gparquet_byte_array_statistics_get_max; ///
  GBytes* function(GParquetByteArrayStatistics* statistics) c_gparquet_byte_array_statistics_get_min; ///

  // ColumnChunkMetadata
  GType function() c_gparquet_column_chunk_metadata_get_type; ///
  gboolean function(GParquetColumnChunkMetadata* metadata) c_gparquet_column_chunk_metadata_can_decompress; ///
  gboolean function(GParquetColumnChunkMetadata* metadata, GParquetColumnChunkMetadata* otherMetadata) c_gparquet_column_chunk_metadata_equal; ///
  long function(GParquetColumnChunkMetadata* metadata) c_gparquet_column_chunk_metadata_get_file_offset; ///
  GParquetStatistics* function(GParquetColumnChunkMetadata* metadata) c_gparquet_column_chunk_metadata_get_statistics; ///
  long function(GParquetColumnChunkMetadata* metadata) c_gparquet_column_chunk_metadata_get_total_compressed_size; ///
  long function(GParquetColumnChunkMetadata* metadata) c_gparquet_column_chunk_metadata_get_total_size; ///

  // DoubleStatistics
  GType function() c_gparquet_double_statistics_get_type; ///
  double function(GParquetDoubleStatistics* statistics) c_gparquet_double_statistics_get_max; ///
  double function(GParquetDoubleStatistics* statistics) c_gparquet_double_statistics_get_min; ///

  // FileMetadata
  GType function() c_gparquet_file_metadata_get_type; ///
  gboolean function(GParquetFileMetadata* metadata) c_gparquet_file_metadata_can_decompress; ///
  gboolean function(GParquetFileMetadata* metadata, GParquetFileMetadata* otherMetadata) c_gparquet_file_metadata_equal; ///
  const(char)* function(GParquetFileMetadata* metadata) c_gparquet_file_metadata_get_created_by; ///
  int function(GParquetFileMetadata* metadata) c_gparquet_file_metadata_get_n_columns; ///
  int function(GParquetFileMetadata* metadata) c_gparquet_file_metadata_get_n_row_groups; ///
  long function(GParquetFileMetadata* metadata) c_gparquet_file_metadata_get_n_rows; ///
  int function(GParquetFileMetadata* metadata) c_gparquet_file_metadata_get_n_schema_elements; ///
  GParquetRowGroupMetadata* function(GParquetFileMetadata* metadata, int index, GError** _err) c_gparquet_file_metadata_get_row_group; ///
  uint function(GParquetFileMetadata* metadata) c_gparquet_file_metadata_get_size; ///

  // FixedLengthByteArrayStatistics
  GType function() c_gparquet_fixed_length_byte_array_statistics_get_type; ///
  GBytes* function(GParquetFixedLengthByteArrayStatistics* statistics) c_gparquet_fixed_length_byte_array_statistics_get_max; ///
  GBytes* function(GParquetFixedLengthByteArrayStatistics* statistics) c_gparquet_fixed_length_byte_array_statistics_get_min; ///

  // FloatStatistics
  GType function() c_gparquet_float_statistics_get_type; ///
  float function(GParquetFloatStatistics* statistics) c_gparquet_float_statistics_get_max; ///
  float function(GParquetFloatStatistics* statistics) c_gparquet_float_statistics_get_min; ///

  // Int32Statistics
  GType function() c_gparquet_int32_statistics_get_type; ///
  int function(GParquetInt32Statistics* statistics) c_gparquet_int32_statistics_get_max; ///
  int function(GParquetInt32Statistics* statistics) c_gparquet_int32_statistics_get_min; ///

  // Int64Statistics
  GType function() c_gparquet_int64_statistics_get_type; ///
  long function(GParquetInt64Statistics* statistics) c_gparquet_int64_statistics_get_max; ///
  long function(GParquetInt64Statistics* statistics) c_gparquet_int64_statistics_get_min; ///

  // RowGroupMetadata
  GType function() c_gparquet_row_group_metadata_get_type; ///
  gboolean function(GParquetRowGroupMetadata* metadata) c_gparquet_row_group_metadata_can_decompress; ///
  gboolean function(GParquetRowGroupMetadata* metadata, GParquetRowGroupMetadata* otherMetadata) c_gparquet_row_group_metadata_equal; ///
  GParquetColumnChunkMetadata* function(GParquetRowGroupMetadata* metadata, int index, GError** _err) c_gparquet_row_group_metadata_get_column_chunk; ///
  long function(GParquetRowGroupMetadata* metadata) c_gparquet_row_group_metadata_get_file_offset; ///
  int function(GParquetRowGroupMetadata* metadata) c_gparquet_row_group_metadata_get_n_columns; ///
  long function(GParquetRowGroupMetadata* metadata) c_gparquet_row_group_metadata_get_n_rows; ///
  long function(GParquetRowGroupMetadata* metadata) c_gparquet_row_group_metadata_get_total_compressed_size; ///
  long function(GParquetRowGroupMetadata* metadata) c_gparquet_row_group_metadata_get_total_size; ///

  // Statistics
  GType function() c_gparquet_statistics_get_type; ///
  gboolean function(GParquetStatistics* statistics, GParquetStatistics* otherStatistics) c_gparquet_statistics_equal; ///
  long function(GParquetStatistics* statistics) c_gparquet_statistics_get_n_distinct_values; ///
  long function(GParquetStatistics* statistics) c_gparquet_statistics_get_n_nulls; ///
  long function(GParquetStatistics* statistics) c_gparquet_statistics_get_n_values; ///
  gboolean function(GParquetStatistics* statistics) c_gparquet_statistics_has_min_max; ///
  gboolean function(GParquetStatistics* statistics) c_gparquet_statistics_has_n_distinct_values; ///
  gboolean function(GParquetStatistics* statistics) c_gparquet_statistics_has_n_nulls; ///

  // WriterProperties
  GType function() c_gparquet_writer_properties_get_type; ///
  GParquetWriterProperties* function() c_gparquet_writer_properties_new; ///
  void function(GParquetWriterProperties* properties, const(char)* path) c_gparquet_writer_properties_disable_dictionary; ///
  void function(GParquetWriterProperties* properties, const(char)* path) c_gparquet_writer_properties_enable_dictionary; ///
  long function(GParquetWriterProperties* properties) c_gparquet_writer_properties_get_batch_size; ///
  GArrowCompressionType function(GParquetWriterProperties* properties, const(char)* path) c_gparquet_writer_properties_get_compression_path; ///
  long function(GParquetWriterProperties* properties) c_gparquet_writer_properties_get_data_page_size; ///
  long function(GParquetWriterProperties* properties) c_gparquet_writer_properties_get_dictionary_page_size_limit; ///
  long function(GParquetWriterProperties* properties) c_gparquet_writer_properties_get_max_row_group_length; ///
  gboolean function(GParquetWriterProperties* properties, const(char)* path) c_gparquet_writer_properties_is_dictionary_enabled; ///
  void function(GParquetWriterProperties* properties, long batchSize) c_gparquet_writer_properties_set_batch_size; ///
  void function(GParquetWriterProperties* properties, GArrowCompressionType compressionType, const(char)* path) c_gparquet_writer_properties_set_compression; ///
  void function(GParquetWriterProperties* properties, long dataPageSize) c_gparquet_writer_properties_set_data_page_size; ///
  void function(GParquetWriterProperties* properties, long limit) c_gparquet_writer_properties_set_dictionary_page_size_limit; ///
  void function(GParquetWriterProperties* properties, long length) c_gparquet_writer_properties_set_max_row_group_length; ///
}

// ArrowFileReader

/** */
alias gparquet_arrow_file_reader_get_type = c_gparquet_arrow_file_reader_get_type;

/** */
alias gparquet_arrow_file_reader_new_arrow = c_gparquet_arrow_file_reader_new_arrow;

/** */
alias gparquet_arrow_file_reader_new_path = c_gparquet_arrow_file_reader_new_path;

/** */
alias gparquet_arrow_file_reader_get_metadata = c_gparquet_arrow_file_reader_get_metadata;

/** */
alias gparquet_arrow_file_reader_get_n_row_groups = c_gparquet_arrow_file_reader_get_n_row_groups;

/** */
alias gparquet_arrow_file_reader_get_n_rows = c_gparquet_arrow_file_reader_get_n_rows;

/** */
alias gparquet_arrow_file_reader_get_schema = c_gparquet_arrow_file_reader_get_schema;

/** */
alias gparquet_arrow_file_reader_read_column_data = c_gparquet_arrow_file_reader_read_column_data;

/** */
alias gparquet_arrow_file_reader_read_row_group = c_gparquet_arrow_file_reader_read_row_group;

/** */
alias gparquet_arrow_file_reader_read_table = c_gparquet_arrow_file_reader_read_table;

/** */
alias gparquet_arrow_file_reader_set_use_threads = c_gparquet_arrow_file_reader_set_use_threads;

// ArrowFileWriter

/** */
alias gparquet_arrow_file_writer_get_type = c_gparquet_arrow_file_writer_get_type;

/** */
alias gparquet_arrow_file_writer_new_arrow = c_gparquet_arrow_file_writer_new_arrow;

/** */
alias gparquet_arrow_file_writer_new_path = c_gparquet_arrow_file_writer_new_path;

/** */
alias gparquet_arrow_file_writer_close = c_gparquet_arrow_file_writer_close;

/** */
alias gparquet_arrow_file_writer_get_schema = c_gparquet_arrow_file_writer_get_schema;

/** */
alias gparquet_arrow_file_writer_new_buffered_row_group = c_gparquet_arrow_file_writer_new_buffered_row_group;

/** */
alias gparquet_arrow_file_writer_new_row_group = c_gparquet_arrow_file_writer_new_row_group;

/** */
alias gparquet_arrow_file_writer_write_chunked_array = c_gparquet_arrow_file_writer_write_chunked_array;

/** */
alias gparquet_arrow_file_writer_write_record_batch = c_gparquet_arrow_file_writer_write_record_batch;

/** */
alias gparquet_arrow_file_writer_write_table = c_gparquet_arrow_file_writer_write_table;

// BooleanStatistics

/** */
alias gparquet_boolean_statistics_get_type = c_gparquet_boolean_statistics_get_type;

/** */
alias gparquet_boolean_statistics_get_max = c_gparquet_boolean_statistics_get_max;

/** */
alias gparquet_boolean_statistics_get_min = c_gparquet_boolean_statistics_get_min;

// ByteArrayStatistics

/** */
alias gparquet_byte_array_statistics_get_type = c_gparquet_byte_array_statistics_get_type;

/** */
alias gparquet_byte_array_statistics_get_max = c_gparquet_byte_array_statistics_get_max;

/** */
alias gparquet_byte_array_statistics_get_min = c_gparquet_byte_array_statistics_get_min;

// ColumnChunkMetadata

/** */
alias gparquet_column_chunk_metadata_get_type = c_gparquet_column_chunk_metadata_get_type;

/** */
alias gparquet_column_chunk_metadata_can_decompress = c_gparquet_column_chunk_metadata_can_decompress;

/** */
alias gparquet_column_chunk_metadata_equal = c_gparquet_column_chunk_metadata_equal;

/** */
alias gparquet_column_chunk_metadata_get_file_offset = c_gparquet_column_chunk_metadata_get_file_offset;

/** */
alias gparquet_column_chunk_metadata_get_statistics = c_gparquet_column_chunk_metadata_get_statistics;

/** */
alias gparquet_column_chunk_metadata_get_total_compressed_size = c_gparquet_column_chunk_metadata_get_total_compressed_size;

/** */
alias gparquet_column_chunk_metadata_get_total_size = c_gparquet_column_chunk_metadata_get_total_size;

// DoubleStatistics

/** */
alias gparquet_double_statistics_get_type = c_gparquet_double_statistics_get_type;

/** */
alias gparquet_double_statistics_get_max = c_gparquet_double_statistics_get_max;

/** */
alias gparquet_double_statistics_get_min = c_gparquet_double_statistics_get_min;

// FileMetadata

/** */
alias gparquet_file_metadata_get_type = c_gparquet_file_metadata_get_type;

/** */
alias gparquet_file_metadata_can_decompress = c_gparquet_file_metadata_can_decompress;

/** */
alias gparquet_file_metadata_equal = c_gparquet_file_metadata_equal;

/** */
alias gparquet_file_metadata_get_created_by = c_gparquet_file_metadata_get_created_by;

/** */
alias gparquet_file_metadata_get_n_columns = c_gparquet_file_metadata_get_n_columns;

/** */
alias gparquet_file_metadata_get_n_row_groups = c_gparquet_file_metadata_get_n_row_groups;

/** */
alias gparquet_file_metadata_get_n_rows = c_gparquet_file_metadata_get_n_rows;

/** */
alias gparquet_file_metadata_get_n_schema_elements = c_gparquet_file_metadata_get_n_schema_elements;

/** */
alias gparquet_file_metadata_get_row_group = c_gparquet_file_metadata_get_row_group;

/** */
alias gparquet_file_metadata_get_size = c_gparquet_file_metadata_get_size;

// FixedLengthByteArrayStatistics

/** */
alias gparquet_fixed_length_byte_array_statistics_get_type = c_gparquet_fixed_length_byte_array_statistics_get_type;

/** */
alias gparquet_fixed_length_byte_array_statistics_get_max = c_gparquet_fixed_length_byte_array_statistics_get_max;

/** */
alias gparquet_fixed_length_byte_array_statistics_get_min = c_gparquet_fixed_length_byte_array_statistics_get_min;

// FloatStatistics

/** */
alias gparquet_float_statistics_get_type = c_gparquet_float_statistics_get_type;

/** */
alias gparquet_float_statistics_get_max = c_gparquet_float_statistics_get_max;

/** */
alias gparquet_float_statistics_get_min = c_gparquet_float_statistics_get_min;

// Int32Statistics

/** */
alias gparquet_int32_statistics_get_type = c_gparquet_int32_statistics_get_type;

/** */
alias gparquet_int32_statistics_get_max = c_gparquet_int32_statistics_get_max;

/** */
alias gparquet_int32_statistics_get_min = c_gparquet_int32_statistics_get_min;

// Int64Statistics

/** */
alias gparquet_int64_statistics_get_type = c_gparquet_int64_statistics_get_type;

/** */
alias gparquet_int64_statistics_get_max = c_gparquet_int64_statistics_get_max;

/** */
alias gparquet_int64_statistics_get_min = c_gparquet_int64_statistics_get_min;

// RowGroupMetadata

/** */
alias gparquet_row_group_metadata_get_type = c_gparquet_row_group_metadata_get_type;

/** */
alias gparquet_row_group_metadata_can_decompress = c_gparquet_row_group_metadata_can_decompress;

/** */
alias gparquet_row_group_metadata_equal = c_gparquet_row_group_metadata_equal;

/** */
alias gparquet_row_group_metadata_get_column_chunk = c_gparquet_row_group_metadata_get_column_chunk;

/** */
alias gparquet_row_group_metadata_get_file_offset = c_gparquet_row_group_metadata_get_file_offset;

/** */
alias gparquet_row_group_metadata_get_n_columns = c_gparquet_row_group_metadata_get_n_columns;

/** */
alias gparquet_row_group_metadata_get_n_rows = c_gparquet_row_group_metadata_get_n_rows;

/** */
alias gparquet_row_group_metadata_get_total_compressed_size = c_gparquet_row_group_metadata_get_total_compressed_size;

/** */
alias gparquet_row_group_metadata_get_total_size = c_gparquet_row_group_metadata_get_total_size;

// Statistics

/** */
alias gparquet_statistics_get_type = c_gparquet_statistics_get_type;

/** */
alias gparquet_statistics_equal = c_gparquet_statistics_equal;

/** */
alias gparquet_statistics_get_n_distinct_values = c_gparquet_statistics_get_n_distinct_values;

/** */
alias gparquet_statistics_get_n_nulls = c_gparquet_statistics_get_n_nulls;

/** */
alias gparquet_statistics_get_n_values = c_gparquet_statistics_get_n_values;

/** */
alias gparquet_statistics_has_min_max = c_gparquet_statistics_has_min_max;

/** */
alias gparquet_statistics_has_n_distinct_values = c_gparquet_statistics_has_n_distinct_values;

/** */
alias gparquet_statistics_has_n_nulls = c_gparquet_statistics_has_n_nulls;

// WriterProperties

/** */
alias gparquet_writer_properties_get_type = c_gparquet_writer_properties_get_type;

/** */
alias gparquet_writer_properties_new = c_gparquet_writer_properties_new;

/** */
alias gparquet_writer_properties_disable_dictionary = c_gparquet_writer_properties_disable_dictionary;

/** */
alias gparquet_writer_properties_enable_dictionary = c_gparquet_writer_properties_enable_dictionary;

/** */
alias gparquet_writer_properties_get_batch_size = c_gparquet_writer_properties_get_batch_size;

/** */
alias gparquet_writer_properties_get_compression_path = c_gparquet_writer_properties_get_compression_path;

/** */
alias gparquet_writer_properties_get_data_page_size = c_gparquet_writer_properties_get_data_page_size;

/** */
alias gparquet_writer_properties_get_dictionary_page_size_limit = c_gparquet_writer_properties_get_dictionary_page_size_limit;

/** */
alias gparquet_writer_properties_get_max_row_group_length = c_gparquet_writer_properties_get_max_row_group_length;

/** */
alias gparquet_writer_properties_is_dictionary_enabled = c_gparquet_writer_properties_is_dictionary_enabled;

/** */
alias gparquet_writer_properties_set_batch_size = c_gparquet_writer_properties_set_batch_size;

/** */
alias gparquet_writer_properties_set_compression = c_gparquet_writer_properties_set_compression;

/** */
alias gparquet_writer_properties_set_data_page_size = c_gparquet_writer_properties_set_data_page_size;

/** */
alias gparquet_writer_properties_set_dictionary_page_size_limit = c_gparquet_writer_properties_set_dictionary_page_size_limit;

/** */
alias gparquet_writer_properties_set_max_row_group_length = c_gparquet_writer_properties_set_max_row_group_length;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // ArrowFileReader
  gidLink(cast(void**)&gparquet_arrow_file_reader_get_type, "gparquet_arrow_file_reader_get_type", libs);
  gidLink(cast(void**)&gparquet_arrow_file_reader_new_arrow, "gparquet_arrow_file_reader_new_arrow", libs);
  gidLink(cast(void**)&gparquet_arrow_file_reader_new_path, "gparquet_arrow_file_reader_new_path", libs);
  gidLink(cast(void**)&gparquet_arrow_file_reader_get_metadata, "gparquet_arrow_file_reader_get_metadata", libs);
  gidLink(cast(void**)&gparquet_arrow_file_reader_get_n_row_groups, "gparquet_arrow_file_reader_get_n_row_groups", libs);
  gidLink(cast(void**)&gparquet_arrow_file_reader_get_n_rows, "gparquet_arrow_file_reader_get_n_rows", libs);
  gidLink(cast(void**)&gparquet_arrow_file_reader_get_schema, "gparquet_arrow_file_reader_get_schema", libs);
  gidLink(cast(void**)&gparquet_arrow_file_reader_read_column_data, "gparquet_arrow_file_reader_read_column_data", libs);
  gidLink(cast(void**)&gparquet_arrow_file_reader_read_row_group, "gparquet_arrow_file_reader_read_row_group", libs);
  gidLink(cast(void**)&gparquet_arrow_file_reader_read_table, "gparquet_arrow_file_reader_read_table", libs);
  gidLink(cast(void**)&gparquet_arrow_file_reader_set_use_threads, "gparquet_arrow_file_reader_set_use_threads", libs);

  // ArrowFileWriter
  gidLink(cast(void**)&gparquet_arrow_file_writer_get_type, "gparquet_arrow_file_writer_get_type", libs);
  gidLink(cast(void**)&gparquet_arrow_file_writer_new_arrow, "gparquet_arrow_file_writer_new_arrow", libs);
  gidLink(cast(void**)&gparquet_arrow_file_writer_new_path, "gparquet_arrow_file_writer_new_path", libs);
  gidLink(cast(void**)&gparquet_arrow_file_writer_close, "gparquet_arrow_file_writer_close", libs);
  gidLink(cast(void**)&gparquet_arrow_file_writer_get_schema, "gparquet_arrow_file_writer_get_schema", libs);
  gidLink(cast(void**)&gparquet_arrow_file_writer_new_buffered_row_group, "gparquet_arrow_file_writer_new_buffered_row_group", libs);
  gidLink(cast(void**)&gparquet_arrow_file_writer_new_row_group, "gparquet_arrow_file_writer_new_row_group", libs);
  gidLink(cast(void**)&gparquet_arrow_file_writer_write_chunked_array, "gparquet_arrow_file_writer_write_chunked_array", libs);
  gidLink(cast(void**)&gparquet_arrow_file_writer_write_record_batch, "gparquet_arrow_file_writer_write_record_batch", libs);
  gidLink(cast(void**)&gparquet_arrow_file_writer_write_table, "gparquet_arrow_file_writer_write_table", libs);

  // BooleanStatistics
  gidLink(cast(void**)&gparquet_boolean_statistics_get_type, "gparquet_boolean_statistics_get_type", libs);
  gidLink(cast(void**)&gparquet_boolean_statistics_get_max, "gparquet_boolean_statistics_get_max", libs);
  gidLink(cast(void**)&gparquet_boolean_statistics_get_min, "gparquet_boolean_statistics_get_min", libs);

  // ByteArrayStatistics
  gidLink(cast(void**)&gparquet_byte_array_statistics_get_type, "gparquet_byte_array_statistics_get_type", libs);
  gidLink(cast(void**)&gparquet_byte_array_statistics_get_max, "gparquet_byte_array_statistics_get_max", libs);
  gidLink(cast(void**)&gparquet_byte_array_statistics_get_min, "gparquet_byte_array_statistics_get_min", libs);

  // ColumnChunkMetadata
  gidLink(cast(void**)&gparquet_column_chunk_metadata_get_type, "gparquet_column_chunk_metadata_get_type", libs);
  gidLink(cast(void**)&gparquet_column_chunk_metadata_can_decompress, "gparquet_column_chunk_metadata_can_decompress", libs);
  gidLink(cast(void**)&gparquet_column_chunk_metadata_equal, "gparquet_column_chunk_metadata_equal", libs);
  gidLink(cast(void**)&gparquet_column_chunk_metadata_get_file_offset, "gparquet_column_chunk_metadata_get_file_offset", libs);
  gidLink(cast(void**)&gparquet_column_chunk_metadata_get_statistics, "gparquet_column_chunk_metadata_get_statistics", libs);
  gidLink(cast(void**)&gparquet_column_chunk_metadata_get_total_compressed_size, "gparquet_column_chunk_metadata_get_total_compressed_size", libs);
  gidLink(cast(void**)&gparquet_column_chunk_metadata_get_total_size, "gparquet_column_chunk_metadata_get_total_size", libs);

  // DoubleStatistics
  gidLink(cast(void**)&gparquet_double_statistics_get_type, "gparquet_double_statistics_get_type", libs);
  gidLink(cast(void**)&gparquet_double_statistics_get_max, "gparquet_double_statistics_get_max", libs);
  gidLink(cast(void**)&gparquet_double_statistics_get_min, "gparquet_double_statistics_get_min", libs);

  // FileMetadata
  gidLink(cast(void**)&gparquet_file_metadata_get_type, "gparquet_file_metadata_get_type", libs);
  gidLink(cast(void**)&gparquet_file_metadata_can_decompress, "gparquet_file_metadata_can_decompress", libs);
  gidLink(cast(void**)&gparquet_file_metadata_equal, "gparquet_file_metadata_equal", libs);
  gidLink(cast(void**)&gparquet_file_metadata_get_created_by, "gparquet_file_metadata_get_created_by", libs);
  gidLink(cast(void**)&gparquet_file_metadata_get_n_columns, "gparquet_file_metadata_get_n_columns", libs);
  gidLink(cast(void**)&gparquet_file_metadata_get_n_row_groups, "gparquet_file_metadata_get_n_row_groups", libs);
  gidLink(cast(void**)&gparquet_file_metadata_get_n_rows, "gparquet_file_metadata_get_n_rows", libs);
  gidLink(cast(void**)&gparquet_file_metadata_get_n_schema_elements, "gparquet_file_metadata_get_n_schema_elements", libs);
  gidLink(cast(void**)&gparquet_file_metadata_get_row_group, "gparquet_file_metadata_get_row_group", libs);
  gidLink(cast(void**)&gparquet_file_metadata_get_size, "gparquet_file_metadata_get_size", libs);

  // FixedLengthByteArrayStatistics
  gidLink(cast(void**)&gparquet_fixed_length_byte_array_statistics_get_type, "gparquet_fixed_length_byte_array_statistics_get_type", libs);
  gidLink(cast(void**)&gparquet_fixed_length_byte_array_statistics_get_max, "gparquet_fixed_length_byte_array_statistics_get_max", libs);
  gidLink(cast(void**)&gparquet_fixed_length_byte_array_statistics_get_min, "gparquet_fixed_length_byte_array_statistics_get_min", libs);

  // FloatStatistics
  gidLink(cast(void**)&gparquet_float_statistics_get_type, "gparquet_float_statistics_get_type", libs);
  gidLink(cast(void**)&gparquet_float_statistics_get_max, "gparquet_float_statistics_get_max", libs);
  gidLink(cast(void**)&gparquet_float_statistics_get_min, "gparquet_float_statistics_get_min", libs);

  // Int32Statistics
  gidLink(cast(void**)&gparquet_int32_statistics_get_type, "gparquet_int32_statistics_get_type", libs);
  gidLink(cast(void**)&gparquet_int32_statistics_get_max, "gparquet_int32_statistics_get_max", libs);
  gidLink(cast(void**)&gparquet_int32_statistics_get_min, "gparquet_int32_statistics_get_min", libs);

  // Int64Statistics
  gidLink(cast(void**)&gparquet_int64_statistics_get_type, "gparquet_int64_statistics_get_type", libs);
  gidLink(cast(void**)&gparquet_int64_statistics_get_max, "gparquet_int64_statistics_get_max", libs);
  gidLink(cast(void**)&gparquet_int64_statistics_get_min, "gparquet_int64_statistics_get_min", libs);

  // RowGroupMetadata
  gidLink(cast(void**)&gparquet_row_group_metadata_get_type, "gparquet_row_group_metadata_get_type", libs);
  gidLink(cast(void**)&gparquet_row_group_metadata_can_decompress, "gparquet_row_group_metadata_can_decompress", libs);
  gidLink(cast(void**)&gparquet_row_group_metadata_equal, "gparquet_row_group_metadata_equal", libs);
  gidLink(cast(void**)&gparquet_row_group_metadata_get_column_chunk, "gparquet_row_group_metadata_get_column_chunk", libs);
  gidLink(cast(void**)&gparquet_row_group_metadata_get_file_offset, "gparquet_row_group_metadata_get_file_offset", libs);
  gidLink(cast(void**)&gparquet_row_group_metadata_get_n_columns, "gparquet_row_group_metadata_get_n_columns", libs);
  gidLink(cast(void**)&gparquet_row_group_metadata_get_n_rows, "gparquet_row_group_metadata_get_n_rows", libs);
  gidLink(cast(void**)&gparquet_row_group_metadata_get_total_compressed_size, "gparquet_row_group_metadata_get_total_compressed_size", libs);
  gidLink(cast(void**)&gparquet_row_group_metadata_get_total_size, "gparquet_row_group_metadata_get_total_size", libs);

  // Statistics
  gidLink(cast(void**)&gparquet_statistics_get_type, "gparquet_statistics_get_type", libs);
  gidLink(cast(void**)&gparquet_statistics_equal, "gparquet_statistics_equal", libs);
  gidLink(cast(void**)&gparquet_statistics_get_n_distinct_values, "gparquet_statistics_get_n_distinct_values", libs);
  gidLink(cast(void**)&gparquet_statistics_get_n_nulls, "gparquet_statistics_get_n_nulls", libs);
  gidLink(cast(void**)&gparquet_statistics_get_n_values, "gparquet_statistics_get_n_values", libs);
  gidLink(cast(void**)&gparquet_statistics_has_min_max, "gparquet_statistics_has_min_max", libs);
  gidLink(cast(void**)&gparquet_statistics_has_n_distinct_values, "gparquet_statistics_has_n_distinct_values", libs);
  gidLink(cast(void**)&gparquet_statistics_has_n_nulls, "gparquet_statistics_has_n_nulls", libs);

  // WriterProperties
  gidLink(cast(void**)&gparquet_writer_properties_get_type, "gparquet_writer_properties_get_type", libs);
  gidLink(cast(void**)&gparquet_writer_properties_new, "gparquet_writer_properties_new", libs);
  gidLink(cast(void**)&gparquet_writer_properties_disable_dictionary, "gparquet_writer_properties_disable_dictionary", libs);
  gidLink(cast(void**)&gparquet_writer_properties_enable_dictionary, "gparquet_writer_properties_enable_dictionary", libs);
  gidLink(cast(void**)&gparquet_writer_properties_get_batch_size, "gparquet_writer_properties_get_batch_size", libs);
  gidLink(cast(void**)&gparquet_writer_properties_get_compression_path, "gparquet_writer_properties_get_compression_path", libs);
  gidLink(cast(void**)&gparquet_writer_properties_get_data_page_size, "gparquet_writer_properties_get_data_page_size", libs);
  gidLink(cast(void**)&gparquet_writer_properties_get_dictionary_page_size_limit, "gparquet_writer_properties_get_dictionary_page_size_limit", libs);
  gidLink(cast(void**)&gparquet_writer_properties_get_max_row_group_length, "gparquet_writer_properties_get_max_row_group_length", libs);
  gidLink(cast(void**)&gparquet_writer_properties_is_dictionary_enabled, "gparquet_writer_properties_is_dictionary_enabled", libs);
  gidLink(cast(void**)&gparquet_writer_properties_set_batch_size, "gparquet_writer_properties_set_batch_size", libs);
  gidLink(cast(void**)&gparquet_writer_properties_set_compression, "gparquet_writer_properties_set_compression", libs);
  gidLink(cast(void**)&gparquet_writer_properties_set_data_page_size, "gparquet_writer_properties_set_data_page_size", libs);
  gidLink(cast(void**)&gparquet_writer_properties_set_dictionary_page_size_limit, "gparquet_writer_properties_set_dictionary_page_size_limit", libs);
  gidLink(cast(void**)&gparquet_writer_properties_set_max_row_group_length, "gparquet_writer_properties_set_max_row_group_length", libs);
}
