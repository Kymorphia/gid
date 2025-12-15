/// Module for [WriterProperties] class
module parquet.writer_properties;

import arrow.types;
import gid.gid;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.types;

/** */
class WriterProperties : gobject.object.ObjectWrap
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
    return cast(void function())gparquet_writer_properties_get_type != &gidSymbolNotFound ? gparquet_writer_properties_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WriterProperties self()
  {
    return this;
  }

  /** */
  this()
  {
    GParquetWriterProperties* _cretval;
    _cretval = gparquet_writer_properties_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void disableDictionary(string path = null)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gparquet_writer_properties_disable_dictionary(cast(GParquetWriterProperties*)this._cPtr, _path);
  }

  /** */
  void enableDictionary(string path = null)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gparquet_writer_properties_enable_dictionary(cast(GParquetWriterProperties*)this._cPtr, _path);
  }

  /** */
  long getBatchSize()
  {
    long _retval;
    _retval = gparquet_writer_properties_get_batch_size(cast(GParquetWriterProperties*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.types.CompressionType getCompressionPath(string path)
  {
    GArrowCompressionType _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = gparquet_writer_properties_get_compression_path(cast(GParquetWriterProperties*)this._cPtr, _path);
    arrow.types.CompressionType _retval = cast(arrow.types.CompressionType)_cretval;
    return _retval;
  }

  /** */
  long getDataPageSize()
  {
    long _retval;
    _retval = gparquet_writer_properties_get_data_page_size(cast(GParquetWriterProperties*)this._cPtr);
    return _retval;
  }

  /** */
  long getDictionaryPageSizeLimit()
  {
    long _retval;
    _retval = gparquet_writer_properties_get_dictionary_page_size_limit(cast(GParquetWriterProperties*)this._cPtr);
    return _retval;
  }

  /** */
  long getMaxRowGroupLength()
  {
    long _retval;
    _retval = gparquet_writer_properties_get_max_row_group_length(cast(GParquetWriterProperties*)this._cPtr);
    return _retval;
  }

  /** */
  bool isDictionaryEnabled(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    _retval = cast(bool)gparquet_writer_properties_is_dictionary_enabled(cast(GParquetWriterProperties*)this._cPtr, _path);
    return _retval;
  }

  /** */
  void setBatchSize(long batchSize)
  {
    gparquet_writer_properties_set_batch_size(cast(GParquetWriterProperties*)this._cPtr, batchSize);
  }

  /** */
  void setCompression(arrow.types.CompressionType compressionType, string path = null)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gparquet_writer_properties_set_compression(cast(GParquetWriterProperties*)this._cPtr, compressionType, _path);
  }

  /** */
  void setDataPageSize(long dataPageSize)
  {
    gparquet_writer_properties_set_data_page_size(cast(GParquetWriterProperties*)this._cPtr, dataPageSize);
  }

  /** */
  void setDictionaryPageSizeLimit(long limit)
  {
    gparquet_writer_properties_set_dictionary_page_size_limit(cast(GParquetWriterProperties*)this._cPtr, limit);
  }

  /** */
  void setMaxRowGroupLength(long length)
  {
    gparquet_writer_properties_set_max_row_group_length(cast(GParquetWriterProperties*)this._cPtr, length);
  }
}
