/// Module for [Table] class
module arrow.table;

import arrow.array;
import arrow.boolean_array;
import arrow.c.functions;
import arrow.c.types;
import arrow.chunked_array;
import arrow.feather_write_properties;
import arrow.field;
import arrow.filter_options;
import arrow.output_stream;
import arrow.record_batch;
import arrow.schema;
import arrow.sort_options;
import arrow.table_concatenate_options;
import arrow.take_options;
import arrow.types;
import arrow.uint64_array;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Table : gobject.object.ObjectWrap
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
    return cast(void function())garrow_table_get_type != &gidSymbolNotFound ? garrow_table_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Table self()
  {
    return this;
  }

  /** */
  static arrow.table.Table newArrays(arrow.schema.Schema schema, arrow.array.Array[] arrays)
  {
    GArrowTable* _cretval;
    size_t _nArrays;
    if (arrays)
      _nArrays = cast(size_t)arrays.length;

    GArrowArray*[] _tmparrays;
    foreach (obj; arrays)
      _tmparrays ~= obj ? cast(GArrowArray*)obj._cPtr : null;
    GArrowArray** _arrays = cast(GArrowArray**)_tmparrays.ptr;

    GError *_err;
    _cretval = garrow_table_new_arrays(schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, _arrays, _nArrays, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.table.Table newChunkedArrays(arrow.schema.Schema schema, arrow.chunked_array.ChunkedArray[] chunkedArrays)
  {
    GArrowTable* _cretval;
    size_t _nChunkedArrays;
    if (chunkedArrays)
      _nChunkedArrays = cast(size_t)chunkedArrays.length;

    GArrowChunkedArray*[] _tmpchunkedArrays;
    foreach (obj; chunkedArrays)
      _tmpchunkedArrays ~= obj ? cast(GArrowChunkedArray*)obj._cPtr : null;
    GArrowChunkedArray** _chunkedArrays = cast(GArrowChunkedArray**)_tmpchunkedArrays.ptr;

    GError *_err;
    _cretval = garrow_table_new_chunked_arrays(schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, _chunkedArrays, _nChunkedArrays, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.table.Table newRecordBatches(arrow.schema.Schema schema, arrow.record_batch.RecordBatch[] recordBatches)
  {
    GArrowTable* _cretval;
    size_t _nRecordBatches;
    if (recordBatches)
      _nRecordBatches = cast(size_t)recordBatches.length;

    GArrowRecordBatch*[] _tmprecordBatches;
    foreach (obj; recordBatches)
      _tmprecordBatches ~= obj ? cast(GArrowRecordBatch*)obj._cPtr : null;
    GArrowRecordBatch** _recordBatches = cast(GArrowRecordBatch**)_tmprecordBatches.ptr;

    GError *_err;
    _cretval = garrow_table_new_record_batches(schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, _recordBatches, _nRecordBatches, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table addColumn(uint i, arrow.field.Field field, arrow.chunked_array.ChunkedArray chunkedArray)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_add_column(cast(GArrowTable*)this._cPtr, i, field ? cast(GArrowField*)field._cPtr(No.Dup) : null, chunkedArray ? cast(GArrowChunkedArray*)chunkedArray._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table combineChunks()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_combine_chunks(cast(GArrowTable*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table concatenate(arrow.table.Table[] otherTables, arrow.table_concatenate_options.TableConcatenateOptions options = null)
  {
    GArrowTable* _cretval;
    auto _otherTables = gListFromD!(arrow.table.Table)(otherTables);
    scope(exit) containerFree!(GList*, arrow.table.Table, GidOwnership.None)(_otherTables);
    GError *_err;
    _cretval = garrow_table_concatenate(cast(GArrowTable*)this._cPtr, _otherTables, options ? cast(GArrowTableConcatenateOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.table.Table otherTable)
  {
    bool _retval;
    _retval = cast(bool)garrow_table_equal(cast(GArrowTable*)this._cPtr, otherTable ? cast(GArrowTable*)otherTable._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalMetadata(arrow.table.Table otherTable, bool checkMetadata)
  {
    bool _retval;
    _retval = cast(bool)garrow_table_equal_metadata(cast(GArrowTable*)this._cPtr, otherTable ? cast(GArrowTable*)otherTable._cPtr(No.Dup) : null, checkMetadata);
    return _retval;
  }

  /** */
  arrow.table.Table filter(arrow.boolean_array.BooleanArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_filter(cast(GArrowTable*)this._cPtr, filter ? cast(GArrowBooleanArray*)filter._cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table filterChunkedArray(arrow.chunked_array.ChunkedArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_filter_chunked_array(cast(GArrowTable*)this._cPtr, filter ? cast(GArrowChunkedArray*)filter._cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray getColumnData(int i)
  {
    GArrowChunkedArray* _cretval;
    _cretval = garrow_table_get_column_data(cast(GArrowTable*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  uint getNColumns()
  {
    uint _retval;
    _retval = garrow_table_get_n_columns(cast(GArrowTable*)this._cPtr);
    return _retval;
  }

  /** */
  ulong getNRows()
  {
    ulong _retval;
    _retval = garrow_table_get_n_rows(cast(GArrowTable*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_table_get_schema(cast(GArrowTable*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table removeColumn(uint i)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_remove_column(cast(GArrowTable*)this._cPtr, i, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table replaceColumn(uint i, arrow.field.Field field, arrow.chunked_array.ChunkedArray chunkedArray)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_replace_column(cast(GArrowTable*)this._cPtr, i, field ? cast(GArrowField*)field._cPtr(No.Dup) : null, chunkedArray ? cast(GArrowChunkedArray*)chunkedArray._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table slice(long offset, long length)
  {
    GArrowTable* _cretval;
    _cretval = garrow_table_slice(cast(GArrowTable*)this._cPtr, offset, length);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.uint64_array.UInt64Array sortIndices(arrow.sort_options.SortOptions options)
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_table_sort_indices(cast(GArrowTable*)this._cPtr, options ? cast(GArrowSortOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.uint64_array.UInt64Array)(cast(GArrowUInt64Array*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table take(arrow.array.Array indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_take(cast(GArrowTable*)this._cPtr, indices ? cast(GArrowArray*)indices._cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table takeChunkedArray(arrow.chunked_array.ChunkedArray indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_table_take_chunked_array(cast(GArrowTable*)this._cPtr, indices ? cast(GArrowChunkedArray*)indices._cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    GError *_err;
    _cretval = garrow_table_to_string(cast(GArrowTable*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Writes the table as Feather format data to the sink.
  
      Params:
        sink = The output.
        properties = The properties for this write.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool writeAsFeather(arrow.output_stream.OutputStream sink, arrow.feather_write_properties.FeatherWriteProperties properties = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_table_write_as_feather(cast(GArrowTable*)this._cPtr, sink ? cast(GArrowOutputStream*)sink._cPtr(No.Dup) : null, properties ? cast(GArrowFeatherWriteProperties*)properties._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
