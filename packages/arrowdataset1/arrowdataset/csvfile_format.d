/// Module for [CSVFileFormat] class
module arrowdataset.csvfile_format;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.file_format;
import arrowdataset.types;
import gid.gid;
import gobject.gid_builder;

/** */
class CSVFileFormat : arrowdataset.file_format.FileFormat
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
    return cast(void function())gadataset_csv_file_format_get_type != &gidSymbolNotFound ? gadataset_csv_file_format_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CSVFileFormat self()
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.csvfile_format.CSVFileFormat]
      Returns: New builder object
  */
  static CSVFileFormatGidBuilder builder()
  {
    return new CSVFileFormatGidBuilder;
  }

  /** */
  this()
  {
    GADatasetCSVFileFormat* _cretval;
    _cretval = gadataset_csv_file_format_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrowdataset.csvfile_format.CSVFileFormat]
class CSVFileFormatGidBuilderImpl(T) : arrowdataset.file_format.FileFormatGidBuilderImpl!T
{
}

/// Fluent builder for [arrowdataset.csvfile_format.CSVFileFormat]
final class CSVFileFormatGidBuilder : CSVFileFormatGidBuilderImpl!CSVFileFormatGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CSVFileFormat build()
  {
    return new CSVFileFormat(cast(void*)createGObject(CSVFileFormat._getGType), Yes.Take);
  }
}
