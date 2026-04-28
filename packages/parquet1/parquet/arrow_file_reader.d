/// Module for [ArrowFileReader] class
module parquet.arrow_file_reader;

import arrow.chunked_array;
import arrow.schema;
import arrow.seekable_input_stream;
import arrow.table;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.file_metadata;
import parquet.types;

/** */
class ArrowFileReader : gobject.object.ObjectWrap
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
    return cast(void function())gparquet_arrow_file_reader_get_type != &gidSymbolNotFound ? gparquet_arrow_file_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ArrowFileReader self()
  {
    return this;
  }

  /**
      Get builder for [parquet.arrow_file_reader.ArrowFileReader]
      Returns: New builder object
  */
  static ArrowFileReaderGidBuilder builder()
  {
    return new ArrowFileReaderGidBuilder;
  }

  /** */
  static parquet.arrow_file_reader.ArrowFileReader newArrow(arrow.seekable_input_stream.SeekableInputStream source)
  {
    GParquetArrowFileReader* _cretval;
    GError *_err;
    _cretval = gparquet_arrow_file_reader_new_arrow(source ? cast(GArrowSeekableInputStream*)source._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(parquet.arrow_file_reader.ArrowFileReader)(cast(GParquetArrowFileReader*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static parquet.arrow_file_reader.ArrowFileReader newPath(string path)
  {
    GParquetArrowFileReader* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = gparquet_arrow_file_reader_new_path(_path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(parquet.arrow_file_reader.ArrowFileReader)(cast(GParquetArrowFileReader*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  parquet.file_metadata.FileMetadata getMetadata()
  {
    GParquetFileMetadata* _cretval;
    _cretval = gparquet_arrow_file_reader_get_metadata(cast(GParquetArrowFileReader*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(parquet.file_metadata.FileMetadata)(cast(GParquetFileMetadata*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  int getNRowGroups()
  {
    int _retval;
    _retval = gparquet_arrow_file_reader_get_n_row_groups(cast(GParquetArrowFileReader*)this._cPtr);
    return _retval;
  }

  /** */
  long getNRows()
  {
    long _retval;
    _retval = gparquet_arrow_file_reader_get_n_rows(cast(GParquetArrowFileReader*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema()
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = gparquet_arrow_file_reader_get_schema(cast(GParquetArrowFileReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray readColumnData(int i)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = gparquet_arrow_file_reader_read_column_data(cast(GParquetArrowFileReader*)this._cPtr, i, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table readRowGroup(int rowGroupIndex, int[] columnIndices = null)
  {
    GArrowTable* _cretval;
    size_t _nColumnIndices;
    if (columnIndices)
      _nColumnIndices = cast(size_t)columnIndices.length;

    auto _columnIndices = columnIndices.ptr ? cast(int*)columnIndices.ptr : [int.init].ptr;
    GError *_err;
    _cretval = gparquet_arrow_file_reader_read_row_group(cast(GParquetArrowFileReader*)this._cPtr, rowGroupIndex, _columnIndices, _nColumnIndices, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table readTable()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = gparquet_arrow_file_reader_read_table(cast(GParquetArrowFileReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void setUseThreads(bool useThreads)
  {
    gparquet_arrow_file_reader_set_use_threads(cast(GParquetArrowFileReader*)this._cPtr, useThreads);
  }
}

/// Fluent builder implementation template for [parquet.arrow_file_reader.ArrowFileReader]
class ArrowFileReaderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T arrowFileReader(void* propval)
  {
    return setProperty("arrow-file-reader", propval);
  }
}

/// Fluent builder for [parquet.arrow_file_reader.ArrowFileReader]
final class ArrowFileReaderGidBuilder : ArrowFileReaderGidBuilderImpl!ArrowFileReaderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ArrowFileReader build()
  {
    return new ArrowFileReader(cast(void*)createGObject(ArrowFileReader._getGType), No.Take);
  }
}
