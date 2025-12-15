/// Module for [RowGroupMetadata] class
module parquet.row_group_metadata;

import gid.gid;
import glib.error;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.column_chunk_metadata;
import parquet.types;

/** */
class RowGroupMetadata : gobject.object.ObjectWrap
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
    return cast(void function())gparquet_row_group_metadata_get_type != &gidSymbolNotFound ? gparquet_row_group_metadata_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RowGroupMetadata self()
  {
    return this;
  }

  /** */
  bool canDecompress()
  {
    bool _retval;
    _retval = cast(bool)gparquet_row_group_metadata_can_decompress(cast(GParquetRowGroupMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  bool equal(parquet.row_group_metadata.RowGroupMetadata otherMetadata)
  {
    bool _retval;
    _retval = cast(bool)gparquet_row_group_metadata_equal(cast(GParquetRowGroupMetadata*)this._cPtr, otherMetadata ? cast(GParquetRowGroupMetadata*)otherMetadata._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  parquet.column_chunk_metadata.ColumnChunkMetadata getColumnChunk(int index)
  {
    GParquetColumnChunkMetadata* _cretval;
    GError *_err;
    _cretval = gparquet_row_group_metadata_get_column_chunk(cast(GParquetRowGroupMetadata*)this._cPtr, index, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(parquet.column_chunk_metadata.ColumnChunkMetadata)(cast(GParquetColumnChunkMetadata*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getFileOffset()
  {
    long _retval;
    _retval = gparquet_row_group_metadata_get_file_offset(cast(GParquetRowGroupMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  int getNColumns()
  {
    int _retval;
    _retval = gparquet_row_group_metadata_get_n_columns(cast(GParquetRowGroupMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  long getNRows()
  {
    long _retval;
    _retval = gparquet_row_group_metadata_get_n_rows(cast(GParquetRowGroupMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  long getTotalCompressedSize()
  {
    long _retval;
    _retval = gparquet_row_group_metadata_get_total_compressed_size(cast(GParquetRowGroupMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  long getTotalSize()
  {
    long _retval;
    _retval = gparquet_row_group_metadata_get_total_size(cast(GParquetRowGroupMetadata*)this._cPtr);
    return _retval;
  }
}
