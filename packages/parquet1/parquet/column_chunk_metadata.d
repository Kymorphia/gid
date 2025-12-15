/// Module for [ColumnChunkMetadata] class
module parquet.column_chunk_metadata;

import gid.gid;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class ColumnChunkMetadata : gobject.object.ObjectWrap
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
    return cast(void function())gparquet_column_chunk_metadata_get_type != &gidSymbolNotFound ? gparquet_column_chunk_metadata_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColumnChunkMetadata self()
  {
    return this;
  }

  /** */
  bool canDecompress()
  {
    bool _retval;
    _retval = cast(bool)gparquet_column_chunk_metadata_can_decompress(cast(GParquetColumnChunkMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  bool equal(parquet.column_chunk_metadata.ColumnChunkMetadata otherMetadata)
  {
    bool _retval;
    _retval = cast(bool)gparquet_column_chunk_metadata_equal(cast(GParquetColumnChunkMetadata*)this._cPtr, otherMetadata ? cast(GParquetColumnChunkMetadata*)otherMetadata._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  long getFileOffset()
  {
    long _retval;
    _retval = gparquet_column_chunk_metadata_get_file_offset(cast(GParquetColumnChunkMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  parquet.statistics.Statistics getStatistics()
  {
    GParquetStatistics* _cretval;
    _cretval = gparquet_column_chunk_metadata_get_statistics(cast(GParquetColumnChunkMetadata*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(parquet.statistics.Statistics)(cast(GParquetStatistics*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getTotalCompressedSize()
  {
    long _retval;
    _retval = gparquet_column_chunk_metadata_get_total_compressed_size(cast(GParquetColumnChunkMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  long getTotalSize()
  {
    long _retval;
    _retval = gparquet_column_chunk_metadata_get_total_size(cast(GParquetColumnChunkMetadata*)this._cPtr);
    return _retval;
  }
}
