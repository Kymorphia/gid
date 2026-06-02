/// Module for [ColumnChunkMetadata] class
module parquet.column_chunk_metadata;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.row_group_metadata;
import parquet.statistics;
import parquet.types;

/** */
class ColumnChunkMetadata : gobject.object.ObjectWrap
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
    return cast(void function())gparquet_column_chunk_metadata_get_type != &gidSymbolNotFound ? gparquet_column_chunk_metadata_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColumnChunkMetadata self() nothrow
  {
    return this;
  }

  /**
      Get builder for [parquet.column_chunk_metadata.ColumnChunkMetadata]
      Returns: New builder object
  */
  static ColumnChunkMetadataGidBuilder builder() nothrow
  {
    return new ColumnChunkMetadataGidBuilder;
  }

  /** */
  bool canDecompress() nothrow
  {
    bool _retval;
    _retval = cast(bool)gparquet_column_chunk_metadata_can_decompress(cast(GParquetColumnChunkMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  bool equal(parquet.column_chunk_metadata.ColumnChunkMetadata otherMetadata) nothrow
  {
    bool _retval;
    _retval = cast(bool)gparquet_column_chunk_metadata_equal(cast(GParquetColumnChunkMetadata*)this._cPtr, otherMetadata ? cast(GParquetColumnChunkMetadata*)otherMetadata._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  long getFileOffset() nothrow
  {
    long _retval;
    _retval = gparquet_column_chunk_metadata_get_file_offset(cast(GParquetColumnChunkMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  parquet.statistics.Statistics getStatistics() nothrow
  {
    GParquetStatistics* _cretval;
    _cretval = gparquet_column_chunk_metadata_get_statistics(cast(GParquetColumnChunkMetadata*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(parquet.statistics.Statistics)(cast(GParquetStatistics*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getTotalCompressedSize() nothrow
  {
    long _retval;
    _retval = gparquet_column_chunk_metadata_get_total_compressed_size(cast(GParquetColumnChunkMetadata*)this._cPtr);
    return _retval;
  }

  /** */
  long getTotalSize() nothrow
  {
    long _retval;
    _retval = gparquet_column_chunk_metadata_get_total_size(cast(GParquetColumnChunkMetadata*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [parquet.column_chunk_metadata.ColumnChunkMetadata]
class ColumnChunkMetadataGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T metadata(void* propval) nothrow
  {
    return setProperty("metadata", propval);
  }

  /** */
  T owner(parquet.row_group_metadata.RowGroupMetadata propval) nothrow
  {
    return setProperty("owner", propval);
  }
}

/// Fluent builder for [parquet.column_chunk_metadata.ColumnChunkMetadata]
final class ColumnChunkMetadataGidBuilder : ColumnChunkMetadataGidBuilderImpl!ColumnChunkMetadataGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColumnChunkMetadata build() nothrow
  {
    return new ColumnChunkMetadata(cast(void*)createGObject(ColumnChunkMetadata._getGType), No.Take);
  }
}
