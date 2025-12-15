/// C functions for arrowdataset1 library
module arrowdataset.c.functions;

public import gid.basictypes;
import gid.loader;
import arrowdataset.c.types;
public import arrow.c.types;

version(Windows)
  private immutable LIBS = ["libarrow-dataset-glib-2000.dll;arrow-dataset-glib-2000.dll;arrow-dataset-glib.dll"];
else version(OSX)
  private immutable LIBS = ["libarrow-dataset-glib.2000.dylib"];
else
  private immutable LIBS = ["libarrow-dataset-glib.so.2000"];

__gshared extern(C)
{
  // CSVFileFormat
  GType function() c_gadataset_csv_file_format_get_type; ///
  GADatasetCSVFileFormat* function() c_gadataset_csv_file_format_new; ///

  // Dataset
  GType function() c_gadataset_dataset_get_type; ///
  GADatasetScannerBuilder* function(GADatasetDataset* dataset, GError** _err) c_gadataset_dataset_begin_scan; ///
  char* function(GADatasetDataset* dataset) c_gadataset_dataset_get_type_name; ///
  GArrowRecordBatchReader* function(GADatasetDataset* dataset, GError** _err) c_gadataset_dataset_to_record_batch_reader; ///
  GArrowTable* function(GADatasetDataset* dataset, GError** _err) c_gadataset_dataset_to_table; ///

  // DatasetFactory
  GType function() c_gadataset_dataset_factory_get_type; ///
  GADatasetDataset* function(GADatasetDatasetFactory* factory, GADatasetFinishOptions* options, GError** _err) c_gadataset_dataset_factory_finish; ///

  // DirectoryPartitioning
  GType function() c_gadataset_directory_partitioning_get_type; ///
  GADatasetDirectoryPartitioning* function(GArrowSchema* schema, GList* dictionaries, GADatasetKeyValuePartitioningOptions* options, GError** _err) c_gadataset_directory_partitioning_new; ///

  // FileFormat
  GType function() c_gadataset_file_format_get_type; ///
  gboolean function(GADatasetFileFormat* format, GADatasetFileFormat* otherFormat) c_gadataset_file_format_equal; ///
  GADatasetFileWriteOptions* function(GADatasetFileFormat* format) c_gadataset_file_format_get_default_write_options; ///
  char* function(GADatasetFileFormat* format) c_gadataset_file_format_get_type_name; ///
  GADatasetFileWriter* function(GADatasetFileFormat* format, GArrowOutputStream* destination, GArrowFileSystem* fileSystem, const(char)* path, GArrowSchema* schema, GADatasetFileWriteOptions* options, GError** _err) c_gadataset_file_format_open_writer; ///

  // FileSystemDataset
  GType function() c_gadataset_file_system_dataset_get_type; ///
  gboolean function(GADatasetScanner* scanner, GADatasetFileSystemDatasetWriteOptions* options, GError** _err) c_gadataset_file_system_dataset_write_scanner; ///

  // FileSystemDatasetFactory
  GType function() c_gadataset_file_system_dataset_factory_get_type; ///
  GADatasetFileSystemDatasetFactory* function(GADatasetFileFormat* fileFormat) c_gadataset_file_system_dataset_factory_new; ///
  gboolean function(GADatasetFileSystemDatasetFactory* factory, const(char)* path, GError** _err) c_gadataset_file_system_dataset_factory_add_path; ///
  GADatasetFileSystemDataset* function(GADatasetFileSystemDatasetFactory* factory, GADatasetFinishOptions* options, GError** _err) c_gadataset_file_system_dataset_factory_finish; ///
  gboolean function(GADatasetFileSystemDatasetFactory* factory, GArrowFileSystem* fileSystem, GError** _err) c_gadataset_file_system_dataset_factory_set_file_system; ///
  gboolean function(GADatasetFileSystemDatasetFactory* factory, const(char)* uri, GError** _err) c_gadataset_file_system_dataset_factory_set_file_system_uri; ///

  // FileSystemDatasetWriteOptions
  GType function() c_gadataset_file_system_dataset_write_options_get_type; ///
  GADatasetFileSystemDatasetWriteOptions* function() c_gadataset_file_system_dataset_write_options_new; ///

  // FileWriteOptions
  GType function() c_gadataset_file_write_options_get_type; ///

  // FileWriter
  GType function() c_gadataset_file_writer_get_type; ///
  gboolean function(GADatasetFileWriter* writer, GError** _err) c_gadataset_file_writer_finish; ///
  gboolean function(GADatasetFileWriter* writer, GArrowRecordBatch* recordBatch, GError** _err) c_gadataset_file_writer_write_record_batch; ///
  gboolean function(GADatasetFileWriter* writer, GArrowRecordBatchReader* reader, GError** _err) c_gadataset_file_writer_write_record_batch_reader; ///

  // FinishOptions
  GType function() c_gadataset_finish_options_get_type; ///
  GADatasetFinishOptions* function() c_gadataset_finish_options_new; ///

  // Fragment
  GType function() c_gadataset_fragment_get_type; ///

  // HivePartitioning
  GType function() c_gadataset_hive_partitioning_get_type; ///
  GADatasetHivePartitioning* function(GArrowSchema* schema, GList* dictionaries, GADatasetHivePartitioningOptions* options, GError** _err) c_gadataset_hive_partitioning_new; ///
  char* function(GADatasetHivePartitioning* partitioning) c_gadataset_hive_partitioning_get_null_fallback; ///

  // HivePartitioningOptions
  GType function() c_gadataset_hive_partitioning_options_get_type; ///
  GADatasetHivePartitioningOptions* function() c_gadataset_hive_partitioning_options_new; ///

  // IPCFileFormat
  GType function() c_gadataset_ipc_file_format_get_type; ///
  GADatasetIPCFileFormat* function() c_gadataset_ipc_file_format_new; ///

  // InMemoryFragment
  GType function() c_gadataset_in_memory_fragment_get_type; ///
  GADatasetInMemoryFragment* function(GArrowSchema* schema, GArrowRecordBatch** recordBatches, size_t nRecordBatches) c_gadataset_in_memory_fragment_new; ///

  // KeyValuePartitioning
  GType function() c_gadataset_key_value_partitioning_get_type; ///

  // KeyValuePartitioningOptions
  GType function() c_gadataset_key_value_partitioning_options_get_type; ///
  GADatasetKeyValuePartitioningOptions* function() c_gadataset_key_value_partitioning_options_new; ///

  // ParquetFileFormat
  GType function() c_gadataset_parquet_file_format_get_type; ///
  GADatasetParquetFileFormat* function() c_gadataset_parquet_file_format_new; ///

  // Partitioning
  GType function() c_gadataset_partitioning_get_type; ///
  GADatasetPartitioning* function() c_gadataset_partitioning_create_default; ///
  char* function(GADatasetPartitioning* partitioning) c_gadataset_partitioning_get_type_name; ///

  // PartitioningFactoryOptions
  GType function() c_gadataset_partitioning_factory_options_get_type; ///
  GADatasetPartitioningFactoryOptions* function() c_gadataset_partitioning_factory_options_new; ///

  // Scanner
  GType function() c_gadataset_scanner_get_type; ///
  GArrowRecordBatchReader* function(GADatasetScanner* scanner, GError** _err) c_gadataset_scanner_to_record_batch_reader; ///
  GArrowTable* function(GADatasetScanner* scanner, GError** _err) c_gadataset_scanner_to_table; ///

  // ScannerBuilder
  GType function() c_gadataset_scanner_builder_get_type; ///
  GADatasetScannerBuilder* function(GADatasetDataset* dataset, GError** _err) c_gadataset_scanner_builder_new; ///
  GADatasetScannerBuilder* function(GArrowRecordBatchReader* reader) c_gadataset_scanner_builder_new_record_batch_reader; ///
  GADatasetScanner* function(GADatasetScannerBuilder* builder, GError** _err) c_gadataset_scanner_builder_finish; ///
  gboolean function(GADatasetScannerBuilder* builder, GArrowExpression* expression, GError** _err) c_gadataset_scanner_builder_set_filter; ///
}

// CSVFileFormat

/** */
alias gadataset_csv_file_format_get_type = c_gadataset_csv_file_format_get_type;

/** */
alias gadataset_csv_file_format_new = c_gadataset_csv_file_format_new;

// Dataset

/** */
alias gadataset_dataset_get_type = c_gadataset_dataset_get_type;

/** */
alias gadataset_dataset_begin_scan = c_gadataset_dataset_begin_scan;

/** */
alias gadataset_dataset_get_type_name = c_gadataset_dataset_get_type_name;

/** */
alias gadataset_dataset_to_record_batch_reader = c_gadataset_dataset_to_record_batch_reader;

/** */
alias gadataset_dataset_to_table = c_gadataset_dataset_to_table;

// DatasetFactory

/** */
alias gadataset_dataset_factory_get_type = c_gadataset_dataset_factory_get_type;

/** */
alias gadataset_dataset_factory_finish = c_gadataset_dataset_factory_finish;

// DirectoryPartitioning

/** */
alias gadataset_directory_partitioning_get_type = c_gadataset_directory_partitioning_get_type;

/** */
alias gadataset_directory_partitioning_new = c_gadataset_directory_partitioning_new;

// FileFormat

/** */
alias gadataset_file_format_get_type = c_gadataset_file_format_get_type;

/** */
alias gadataset_file_format_equal = c_gadataset_file_format_equal;

/** */
alias gadataset_file_format_get_default_write_options = c_gadataset_file_format_get_default_write_options;

/** */
alias gadataset_file_format_get_type_name = c_gadataset_file_format_get_type_name;

/** */
alias gadataset_file_format_open_writer = c_gadataset_file_format_open_writer;

// FileSystemDataset

/** */
alias gadataset_file_system_dataset_get_type = c_gadataset_file_system_dataset_get_type;

/** */
alias gadataset_file_system_dataset_write_scanner = c_gadataset_file_system_dataset_write_scanner;

// FileSystemDatasetFactory

/** */
alias gadataset_file_system_dataset_factory_get_type = c_gadataset_file_system_dataset_factory_get_type;

/** */
alias gadataset_file_system_dataset_factory_new = c_gadataset_file_system_dataset_factory_new;

/** */
alias gadataset_file_system_dataset_factory_add_path = c_gadataset_file_system_dataset_factory_add_path;

/** */
alias gadataset_file_system_dataset_factory_finish = c_gadataset_file_system_dataset_factory_finish;

/** */
alias gadataset_file_system_dataset_factory_set_file_system = c_gadataset_file_system_dataset_factory_set_file_system;

/** */
alias gadataset_file_system_dataset_factory_set_file_system_uri = c_gadataset_file_system_dataset_factory_set_file_system_uri;

// FileSystemDatasetWriteOptions

/** */
alias gadataset_file_system_dataset_write_options_get_type = c_gadataset_file_system_dataset_write_options_get_type;

/** */
alias gadataset_file_system_dataset_write_options_new = c_gadataset_file_system_dataset_write_options_new;

// FileWriteOptions

/** */
alias gadataset_file_write_options_get_type = c_gadataset_file_write_options_get_type;

// FileWriter

/** */
alias gadataset_file_writer_get_type = c_gadataset_file_writer_get_type;

/** */
alias gadataset_file_writer_finish = c_gadataset_file_writer_finish;

/** */
alias gadataset_file_writer_write_record_batch = c_gadataset_file_writer_write_record_batch;

/** */
alias gadataset_file_writer_write_record_batch_reader = c_gadataset_file_writer_write_record_batch_reader;

// FinishOptions

/** */
alias gadataset_finish_options_get_type = c_gadataset_finish_options_get_type;

/** */
alias gadataset_finish_options_new = c_gadataset_finish_options_new;

// Fragment

/** */
alias gadataset_fragment_get_type = c_gadataset_fragment_get_type;

// HivePartitioning

/** */
alias gadataset_hive_partitioning_get_type = c_gadataset_hive_partitioning_get_type;

/** */
alias gadataset_hive_partitioning_new = c_gadataset_hive_partitioning_new;

/** */
alias gadataset_hive_partitioning_get_null_fallback = c_gadataset_hive_partitioning_get_null_fallback;

// HivePartitioningOptions

/** */
alias gadataset_hive_partitioning_options_get_type = c_gadataset_hive_partitioning_options_get_type;

/** */
alias gadataset_hive_partitioning_options_new = c_gadataset_hive_partitioning_options_new;

// IPCFileFormat

/** */
alias gadataset_ipc_file_format_get_type = c_gadataset_ipc_file_format_get_type;

/** */
alias gadataset_ipc_file_format_new = c_gadataset_ipc_file_format_new;

// InMemoryFragment

/** */
alias gadataset_in_memory_fragment_get_type = c_gadataset_in_memory_fragment_get_type;

/** */
alias gadataset_in_memory_fragment_new = c_gadataset_in_memory_fragment_new;

// KeyValuePartitioning

/** */
alias gadataset_key_value_partitioning_get_type = c_gadataset_key_value_partitioning_get_type;

// KeyValuePartitioningOptions

/** */
alias gadataset_key_value_partitioning_options_get_type = c_gadataset_key_value_partitioning_options_get_type;

/** */
alias gadataset_key_value_partitioning_options_new = c_gadataset_key_value_partitioning_options_new;

// ParquetFileFormat

/** */
alias gadataset_parquet_file_format_get_type = c_gadataset_parquet_file_format_get_type;

/** */
alias gadataset_parquet_file_format_new = c_gadataset_parquet_file_format_new;

// Partitioning

/** */
alias gadataset_partitioning_get_type = c_gadataset_partitioning_get_type;

/** */
alias gadataset_partitioning_create_default = c_gadataset_partitioning_create_default;

/** */
alias gadataset_partitioning_get_type_name = c_gadataset_partitioning_get_type_name;

// PartitioningFactoryOptions

/** */
alias gadataset_partitioning_factory_options_get_type = c_gadataset_partitioning_factory_options_get_type;

/** */
alias gadataset_partitioning_factory_options_new = c_gadataset_partitioning_factory_options_new;

// Scanner

/** */
alias gadataset_scanner_get_type = c_gadataset_scanner_get_type;

/** */
alias gadataset_scanner_to_record_batch_reader = c_gadataset_scanner_to_record_batch_reader;

/** */
alias gadataset_scanner_to_table = c_gadataset_scanner_to_table;

// ScannerBuilder

/** */
alias gadataset_scanner_builder_get_type = c_gadataset_scanner_builder_get_type;

/** */
alias gadataset_scanner_builder_new = c_gadataset_scanner_builder_new;

/** */
alias gadataset_scanner_builder_new_record_batch_reader = c_gadataset_scanner_builder_new_record_batch_reader;

/** */
alias gadataset_scanner_builder_finish = c_gadataset_scanner_builder_finish;

/** */
alias gadataset_scanner_builder_set_filter = c_gadataset_scanner_builder_set_filter;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // CSVFileFormat
  gidLink(cast(void**)&gadataset_csv_file_format_get_type, "gadataset_csv_file_format_get_type", libs);
  gidLink(cast(void**)&gadataset_csv_file_format_new, "gadataset_csv_file_format_new", libs);

  // Dataset
  gidLink(cast(void**)&gadataset_dataset_get_type, "gadataset_dataset_get_type", libs);
  gidLink(cast(void**)&gadataset_dataset_begin_scan, "gadataset_dataset_begin_scan", libs);
  gidLink(cast(void**)&gadataset_dataset_get_type_name, "gadataset_dataset_get_type_name", libs);
  gidLink(cast(void**)&gadataset_dataset_to_record_batch_reader, "gadataset_dataset_to_record_batch_reader", libs);
  gidLink(cast(void**)&gadataset_dataset_to_table, "gadataset_dataset_to_table", libs);

  // DatasetFactory
  gidLink(cast(void**)&gadataset_dataset_factory_get_type, "gadataset_dataset_factory_get_type", libs);
  gidLink(cast(void**)&gadataset_dataset_factory_finish, "gadataset_dataset_factory_finish", libs);

  // DirectoryPartitioning
  gidLink(cast(void**)&gadataset_directory_partitioning_get_type, "gadataset_directory_partitioning_get_type", libs);
  gidLink(cast(void**)&gadataset_directory_partitioning_new, "gadataset_directory_partitioning_new", libs);

  // FileFormat
  gidLink(cast(void**)&gadataset_file_format_get_type, "gadataset_file_format_get_type", libs);
  gidLink(cast(void**)&gadataset_file_format_equal, "gadataset_file_format_equal", libs);
  gidLink(cast(void**)&gadataset_file_format_get_default_write_options, "gadataset_file_format_get_default_write_options", libs);
  gidLink(cast(void**)&gadataset_file_format_get_type_name, "gadataset_file_format_get_type_name", libs);
  gidLink(cast(void**)&gadataset_file_format_open_writer, "gadataset_file_format_open_writer", libs);

  // FileSystemDataset
  gidLink(cast(void**)&gadataset_file_system_dataset_get_type, "gadataset_file_system_dataset_get_type", libs);
  gidLink(cast(void**)&gadataset_file_system_dataset_write_scanner, "gadataset_file_system_dataset_write_scanner", libs);

  // FileSystemDatasetFactory
  gidLink(cast(void**)&gadataset_file_system_dataset_factory_get_type, "gadataset_file_system_dataset_factory_get_type", libs);
  gidLink(cast(void**)&gadataset_file_system_dataset_factory_new, "gadataset_file_system_dataset_factory_new", libs);
  gidLink(cast(void**)&gadataset_file_system_dataset_factory_add_path, "gadataset_file_system_dataset_factory_add_path", libs);
  gidLink(cast(void**)&gadataset_file_system_dataset_factory_finish, "gadataset_file_system_dataset_factory_finish", libs);
  gidLink(cast(void**)&gadataset_file_system_dataset_factory_set_file_system, "gadataset_file_system_dataset_factory_set_file_system", libs);
  gidLink(cast(void**)&gadataset_file_system_dataset_factory_set_file_system_uri, "gadataset_file_system_dataset_factory_set_file_system_uri", libs);

  // FileSystemDatasetWriteOptions
  gidLink(cast(void**)&gadataset_file_system_dataset_write_options_get_type, "gadataset_file_system_dataset_write_options_get_type", libs);
  gidLink(cast(void**)&gadataset_file_system_dataset_write_options_new, "gadataset_file_system_dataset_write_options_new", libs);

  // FileWriteOptions
  gidLink(cast(void**)&gadataset_file_write_options_get_type, "gadataset_file_write_options_get_type", libs);

  // FileWriter
  gidLink(cast(void**)&gadataset_file_writer_get_type, "gadataset_file_writer_get_type", libs);
  gidLink(cast(void**)&gadataset_file_writer_finish, "gadataset_file_writer_finish", libs);
  gidLink(cast(void**)&gadataset_file_writer_write_record_batch, "gadataset_file_writer_write_record_batch", libs);
  gidLink(cast(void**)&gadataset_file_writer_write_record_batch_reader, "gadataset_file_writer_write_record_batch_reader", libs);

  // FinishOptions
  gidLink(cast(void**)&gadataset_finish_options_get_type, "gadataset_finish_options_get_type", libs);
  gidLink(cast(void**)&gadataset_finish_options_new, "gadataset_finish_options_new", libs);

  // Fragment
  gidLink(cast(void**)&gadataset_fragment_get_type, "gadataset_fragment_get_type", libs);

  // HivePartitioning
  gidLink(cast(void**)&gadataset_hive_partitioning_get_type, "gadataset_hive_partitioning_get_type", libs);
  gidLink(cast(void**)&gadataset_hive_partitioning_new, "gadataset_hive_partitioning_new", libs);
  gidLink(cast(void**)&gadataset_hive_partitioning_get_null_fallback, "gadataset_hive_partitioning_get_null_fallback", libs);

  // HivePartitioningOptions
  gidLink(cast(void**)&gadataset_hive_partitioning_options_get_type, "gadataset_hive_partitioning_options_get_type", libs);
  gidLink(cast(void**)&gadataset_hive_partitioning_options_new, "gadataset_hive_partitioning_options_new", libs);

  // IPCFileFormat
  gidLink(cast(void**)&gadataset_ipc_file_format_get_type, "gadataset_ipc_file_format_get_type", libs);
  gidLink(cast(void**)&gadataset_ipc_file_format_new, "gadataset_ipc_file_format_new", libs);

  // InMemoryFragment
  gidLink(cast(void**)&gadataset_in_memory_fragment_get_type, "gadataset_in_memory_fragment_get_type", libs);
  gidLink(cast(void**)&gadataset_in_memory_fragment_new, "gadataset_in_memory_fragment_new", libs);

  // KeyValuePartitioning
  gidLink(cast(void**)&gadataset_key_value_partitioning_get_type, "gadataset_key_value_partitioning_get_type", libs);

  // KeyValuePartitioningOptions
  gidLink(cast(void**)&gadataset_key_value_partitioning_options_get_type, "gadataset_key_value_partitioning_options_get_type", libs);
  gidLink(cast(void**)&gadataset_key_value_partitioning_options_new, "gadataset_key_value_partitioning_options_new", libs);

  // ParquetFileFormat
  gidLink(cast(void**)&gadataset_parquet_file_format_get_type, "gadataset_parquet_file_format_get_type", libs);
  gidLink(cast(void**)&gadataset_parquet_file_format_new, "gadataset_parquet_file_format_new", libs);

  // Partitioning
  gidLink(cast(void**)&gadataset_partitioning_get_type, "gadataset_partitioning_get_type", libs);
  gidLink(cast(void**)&gadataset_partitioning_create_default, "gadataset_partitioning_create_default", libs);
  gidLink(cast(void**)&gadataset_partitioning_get_type_name, "gadataset_partitioning_get_type_name", libs);

  // PartitioningFactoryOptions
  gidLink(cast(void**)&gadataset_partitioning_factory_options_get_type, "gadataset_partitioning_factory_options_get_type", libs);
  gidLink(cast(void**)&gadataset_partitioning_factory_options_new, "gadataset_partitioning_factory_options_new", libs);

  // Scanner
  gidLink(cast(void**)&gadataset_scanner_get_type, "gadataset_scanner_get_type", libs);
  gidLink(cast(void**)&gadataset_scanner_to_record_batch_reader, "gadataset_scanner_to_record_batch_reader", libs);
  gidLink(cast(void**)&gadataset_scanner_to_table, "gadataset_scanner_to_table", libs);

  // ScannerBuilder
  gidLink(cast(void**)&gadataset_scanner_builder_get_type, "gadataset_scanner_builder_get_type", libs);
  gidLink(cast(void**)&gadataset_scanner_builder_new, "gadataset_scanner_builder_new", libs);
  gidLink(cast(void**)&gadataset_scanner_builder_new_record_batch_reader, "gadataset_scanner_builder_new_record_batch_reader", libs);
  gidLink(cast(void**)&gadataset_scanner_builder_finish, "gadataset_scanner_builder_finish", libs);
  gidLink(cast(void**)&gadataset_scanner_builder_set_filter, "gadataset_scanner_builder_set_filter", libs);
}
