/// C types for arrowdataset19 library
module arrowdataset.c.types;

public import gid.basictypes;
public import arrow.c.types;

/**
    They are corresponding to `arrow::dataset::SegmentEncoding` values.
*/
enum GADatasetSegmentEncoding
{
  /**
      No encoding.
  */
  None = 0,

  /**
      Segment values are URL-encoded.
  */
  Uri = 1,
}

/** */
struct GADatasetCSVFileFormat
{
  /** */
  GADatasetFileFormat parentInstance;
}

/** */
struct GADatasetCSVFileFormatClass
{
  /** */
  GADatasetFileFormatClass parentClass;
}

/** */
struct GADatasetDataset
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetDatasetClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetDatasetFactory
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetDatasetFactoryClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetDirectoryPartitioning
{
  /** */
  GADatasetKeyValuePartitioning parentInstance;
}

/** */
struct GADatasetDirectoryPartitioningClass
{
  /** */
  GADatasetKeyValuePartitioningClass parentClass;
}

/** */
struct GADatasetFileFormat
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetFileFormatClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetFileSystemDataset
{
  /** */
  GADatasetDataset parentInstance;
}

/** */
struct GADatasetFileSystemDatasetClass
{
  /** */
  GADatasetDatasetClass parentClass;
}

/** */
struct GADatasetFileSystemDatasetFactory
{
  /** */
  GADatasetDatasetFactory parentInstance;
}

/** */
struct GADatasetFileSystemDatasetFactoryClass
{
  /** */
  GADatasetDatasetFactoryClass parentClass;
}

/** */
struct GADatasetFileSystemDatasetWriteOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetFileSystemDatasetWriteOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetFileWriteOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetFileWriteOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetFileWriter
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetFileWriterClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetFinishOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetFinishOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetFragment
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetFragmentClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetHivePartitioning
{
  /** */
  GADatasetKeyValuePartitioning parentInstance;
}

/** */
struct GADatasetHivePartitioningClass
{
  /** */
  GADatasetKeyValuePartitioningClass parentClass;
}

/** */
struct GADatasetHivePartitioningOptions
{
  /** */
  GADatasetKeyValuePartitioningOptions parentInstance;
}

/** */
struct GADatasetHivePartitioningOptionsClass
{
  /** */
  GADatasetKeyValuePartitioningOptionsClass parentClass;
}

/** */
struct GADatasetIPCFileFormat
{
  /** */
  GADatasetFileFormat parentInstance;
}

/** */
struct GADatasetIPCFileFormatClass
{
  /** */
  GADatasetFileFormatClass parentClass;
}

/** */
struct GADatasetInMemoryFragment
{
  /** */
  GADatasetFragment parentInstance;
}

/** */
struct GADatasetInMemoryFragmentClass
{
  /** */
  GADatasetFragmentClass parentClass;
}

/** */
struct GADatasetKeyValuePartitioning
{
  /** */
  GADatasetPartitioning parentInstance;
}

/** */
struct GADatasetKeyValuePartitioningClass
{
  /** */
  GADatasetPartitioningClass parentClass;
}

/** */
struct GADatasetKeyValuePartitioningOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetKeyValuePartitioningOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetParquetFileFormat
{
  /** */
  GADatasetFileFormat parentInstance;
}

/** */
struct GADatasetParquetFileFormatClass
{
  /** */
  GADatasetFileFormatClass parentClass;
}

/** */
struct GADatasetPartitioning
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetPartitioningClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetPartitioningFactoryOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetPartitioningFactoryOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetScanner
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetScannerBuilder
{
  /** */
  GObject parentInstance;
}

/** */
struct GADatasetScannerBuilderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GADatasetScannerClass
{
  /** */
  GObjectClass parentClass;
}

