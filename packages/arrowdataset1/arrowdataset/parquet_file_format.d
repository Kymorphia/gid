/// Module for [ParquetFileFormat] class
module arrowdataset.parquet_file_format;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.file_format;
import arrowdataset.types;
import gid.gid;
import gobject.gid_builder;

/** */
class ParquetFileFormat : arrowdataset.file_format.FileFormat
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_parquet_file_format_get_type != &gidSymbolNotFound ? gadataset_parquet_file_format_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ParquetFileFormat self()
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.parquet_file_format.ParquetFileFormat]
      Returns: New builder object
  */
  static ParquetFileFormatGidBuilder builder()
  {
    return new ParquetFileFormatGidBuilder;
  }

  /** */
  this()
  {
    GADatasetParquetFileFormat* _cretval;
    _cretval = gadataset_parquet_file_format_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrowdataset.parquet_file_format.ParquetFileFormat]
class ParquetFileFormatGidBuilderImpl(T) : arrowdataset.file_format.FileFormatGidBuilderImpl!T
{
}

/// Fluent builder for [arrowdataset.parquet_file_format.ParquetFileFormat]
final class ParquetFileFormatGidBuilder : ParquetFileFormatGidBuilderImpl!ParquetFileFormatGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ParquetFileFormat build()
  {
    return new ParquetFileFormat(cast(void*)createGObject(ParquetFileFormat._getGType), Yes.Take);
  }
}
