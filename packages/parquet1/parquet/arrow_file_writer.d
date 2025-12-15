/// Module for [ArrowFileWriter] class
module parquet.arrow_file_writer;

import arrow.chunked_array;
import arrow.output_stream;
import arrow.record_batch;
import arrow.schema;
import arrow.table;
import gid.gid;
import glib.error;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.types;
import parquet.writer_properties;

/** */
class ArrowFileWriter : gobject.object.ObjectWrap
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
    return cast(void function())gparquet_arrow_file_writer_get_type != &gidSymbolNotFound ? gparquet_arrow_file_writer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ArrowFileWriter self()
  {
    return this;
  }

  /** */
  static parquet.arrow_file_writer.ArrowFileWriter newArrow(arrow.schema.Schema schema, arrow.output_stream.OutputStream sink, parquet.writer_properties.WriterProperties writerProperties = null)
  {
    GParquetArrowFileWriter* _cretval;
    GError *_err;
    _cretval = gparquet_arrow_file_writer_new_arrow(schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, sink ? cast(GArrowOutputStream*)sink._cPtr(No.Dup) : null, writerProperties ? cast(GParquetWriterProperties*)writerProperties._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(parquet.arrow_file_writer.ArrowFileWriter)(cast(GParquetArrowFileWriter*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static parquet.arrow_file_writer.ArrowFileWriter newPath(arrow.schema.Schema schema, string path, parquet.writer_properties.WriterProperties writerProperties = null)
  {
    GParquetArrowFileWriter* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = gparquet_arrow_file_writer_new_path(schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, _path, writerProperties ? cast(GParquetWriterProperties*)writerProperties._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(parquet.arrow_file_writer.ArrowFileWriter)(cast(GParquetArrowFileWriter*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool close()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gparquet_arrow_file_writer_close(cast(GParquetArrowFileWriter*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = gparquet_arrow_file_writer_get_schema(cast(GParquetArrowFileWriter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Start a new buffered row group.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool newBufferedRowGroup()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gparquet_arrow_file_writer_new_buffered_row_group(cast(GParquetArrowFileWriter*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Start a new row group.
  
      Params:
        chunkSize = The max number of rows in a row group.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool newRowGroup(size_t chunkSize)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gparquet_arrow_file_writer_new_row_group(cast(GParquetArrowFileWriter*)this._cPtr, chunkSize, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Start a chunked array as a column chunk.
  
      Params:
        chunkedArray = A #GArrowChunkedArray to be written.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool writeChunkedArray(arrow.chunked_array.ChunkedArray chunkedArray)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gparquet_arrow_file_writer_write_chunked_array(cast(GParquetArrowFileWriter*)this._cPtr, chunkedArray ? cast(GArrowChunkedArray*)chunkedArray._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Write a record batch into the buffered row group.
      
      Multiple record batches can be written into the same row group
      through this function.
      
      [parquet.writer_properties.WriterProperties.getMaxRowGroupLength] is respected
      and a new row group will be created if the current row group
      exceeds the limit.
      
      Record batches get flushed to the output stream once
      gparquet_file_writer_new_buffered_row_group() or
      gparquet_file_writer_close() is called.
  
      Params:
        recordBatch = A record batch to be written.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool writeRecordBatch(arrow.record_batch.RecordBatch recordBatch)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gparquet_arrow_file_writer_write_record_batch(cast(GParquetArrowFileWriter*)this._cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool writeTable(arrow.table.Table table, size_t chunkSize)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gparquet_arrow_file_writer_write_table(cast(GParquetArrowFileWriter*)this._cPtr, table ? cast(GArrowTable*)table._cPtr(No.Dup) : null, chunkSize, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
