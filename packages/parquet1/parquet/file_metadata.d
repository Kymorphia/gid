/// Module for [FileMetadata] class
module parquet.file_metadata;

public import gid.basictypes;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.row_group_metadata;
import parquet.types;

/** */
class FileMetadata : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_file_metadata_get_type != &gidSymbolNotFound ? gparquet_file_metadata_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileMetadata self() nothrow
  {
    return this;
  }

  /**
      Get builder for [parquet.file_metadata.FileMetadata]
      Returns: New builder object
  */
  static FileMetadataGidBuilder builder() nothrow
  {
    return new FileMetadataGidBuilder;
  }

  /** */
  bool canDecompress() nothrow
  {
    bool _retval;
    _retval = cast(bool)gparquet_file_metadata_can_decompress(cast(GParquetFileMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  bool equal(parquet.file_metadata.FileMetadata otherMetadata) nothrow
  {
    bool _retval;
    _retval = cast(bool)gparquet_file_metadata_equal(cast(GParquetFileMetadata*)this._cPtr, otherMetadata ? cast(GParquetFileMetadata*)otherMetadata._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string getCreatedBy() nothrow
  {
    const(char)* _cretval;
    _cretval = gparquet_file_metadata_get_created_by(cast(GParquetFileMetadata*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  int getNColumns() nothrow
  {
    int _retval;
    _retval = gparquet_file_metadata_get_n_columns(cast(GParquetFileMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  int getNRowGroups() nothrow
  {
    int _retval;
    _retval = gparquet_file_metadata_get_n_row_groups(cast(GParquetFileMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  long getNRows() nothrow
  {
    long _retval;
    _retval = gparquet_file_metadata_get_n_rows(cast(GParquetFileMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  int getNSchemaElements() nothrow
  {
    int _retval;
    _retval = gparquet_file_metadata_get_n_schema_elements(cast(GParquetFileMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  parquet.row_group_metadata.RowGroupMetadata getRowGroup(int index)
  {
    GParquetRowGroupMetadata* _cretval;
    GError *_err;
    _cretval = gparquet_file_metadata_get_row_group(cast(GParquetFileMetadata*)this._cPtr, index, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(parquet.row_group_metadata.RowGroupMetadata)(cast(GParquetRowGroupMetadata*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  uint getSize() nothrow
  {
    uint _retval;
    _retval = gparquet_file_metadata_get_size(cast(GParquetFileMetadata*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [parquet.file_metadata.FileMetadata]
class FileMetadataGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T metadata(void* propval) nothrow
  {
    return setProperty("metadata", propval);
  }
}

/// Fluent builder for [parquet.file_metadata.FileMetadata]
final class FileMetadataGidBuilder : FileMetadataGidBuilderImpl!FileMetadataGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileMetadata build() nothrow
  {
    return new FileMetadata(cast(void*)createGObject(FileMetadata._getGType), No.Take);
  }
}
