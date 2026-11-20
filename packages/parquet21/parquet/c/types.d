/// C types for parquet21 library
module parquet.c.types;

public import gid.basictypes;
public import arrow.c.types;

/** */
struct GParquetArrowFileReader
{
  /** */
  GObject parentInstance;
}

/** */
struct GParquetArrowFileReaderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GParquetArrowFileWriter
{
  /** */
  GObject parentInstance;
}

/** */
struct GParquetArrowFileWriterClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GParquetBooleanStatistics
{
  /** */
  GParquetStatistics parentInstance;
}

/** */
struct GParquetBooleanStatisticsClass
{
  /** */
  GParquetStatisticsClass parentClass;
}

/** */
struct GParquetByteArrayStatistics
{
  /** */
  GParquetStatistics parentInstance;
}

/** */
struct GParquetByteArrayStatisticsClass
{
  /** */
  GParquetStatisticsClass parentClass;
}

/** */
struct GParquetColumnChunkMetadata
{
  /** */
  GObject parentInstance;
}

/** */
struct GParquetColumnChunkMetadataClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GParquetDoubleStatistics
{
  /** */
  GParquetStatistics parentInstance;
}

/** */
struct GParquetDoubleStatisticsClass
{
  /** */
  GParquetStatisticsClass parentClass;
}

/** */
struct GParquetFileMetadata
{
  /** */
  GObject parentInstance;
}

/** */
struct GParquetFileMetadataClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GParquetFixedLengthByteArrayStatistics
{
  /** */
  GParquetStatistics parentInstance;
}

/** */
struct GParquetFixedLengthByteArrayStatisticsClass
{
  /** */
  GParquetStatisticsClass parentClass;
}

/** */
struct GParquetFloatStatistics
{
  /** */
  GParquetStatistics parentInstance;
}

/** */
struct GParquetFloatStatisticsClass
{
  /** */
  GParquetStatisticsClass parentClass;
}

/** */
struct GParquetInt32Statistics
{
  /** */
  GParquetStatistics parentInstance;
}

/** */
struct GParquetInt32StatisticsClass
{
  /** */
  GParquetStatisticsClass parentClass;
}

/** */
struct GParquetInt64Statistics
{
  /** */
  GParquetStatistics parentInstance;
}

/** */
struct GParquetInt64StatisticsClass
{
  /** */
  GParquetStatisticsClass parentClass;
}

/** */
struct GParquetRowGroupMetadata
{
  /** */
  GObject parentInstance;
}

/** */
struct GParquetRowGroupMetadataClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GParquetStatistics
{
  /** */
  GObject parentInstance;
}

/** */
struct GParquetStatisticsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GParquetWriterProperties
{
  /** */
  GObject parentInstance;
}

/** */
struct GParquetWriterPropertiesClass
{
  /** */
  GObjectClass parentClass;
}

