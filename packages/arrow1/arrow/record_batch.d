module arrow.record_batch;

import arrow.array;
import arrow.boolean_array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.field;
import arrow.filter_options;
import arrow.schema;
import arrow.sort_options;
import arrow.take_options;
import arrow.types;
import arrow.uint64_array;
import arrow.write_options;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class RecordBatch : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_get_type != &gidSymbolNotFound ? garrow_record_batch_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(arrow.schema.Schema schema, uint nRows, arrow.array.Array[] columns)
  {
    GArrowRecordBatch* _cretval;
    auto _columns = gListFromD!(arrow.array.Array)(columns);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_columns);
    GError *_err;
    _cretval = garrow_record_batch_new(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, nRows, _columns, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.record_batch.RecordBatch import_(void* cAbiArray, arrow.schema.Schema schema)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_import(cAbiArray, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch addColumn(uint i, arrow.field.Field field, arrow.array.Array column)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_add_column(cast(GArrowRecordBatch*)cPtr, i, field ? cast(GArrowField*)field.cPtr(No.Dup) : null, column ? cast(GArrowArray*)column.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.record_batch.RecordBatch otherRecordBatch)
  {
    bool _retval;
    _retval = garrow_record_batch_equal(cast(GArrowRecordBatch*)cPtr, otherRecordBatch ? cast(GArrowRecordBatch*)otherRecordBatch.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalMetadata(arrow.record_batch.RecordBatch otherRecordBatch, bool checkMetadata)
  {
    bool _retval;
    _retval = garrow_record_batch_equal_metadata(cast(GArrowRecordBatch*)cPtr, otherRecordBatch ? cast(GArrowRecordBatch*)otherRecordBatch.cPtr(No.Dup) : null, checkMetadata);
    return _retval;
  }

  /** */
  bool export_(out void* cAbiArray, out void* cAbiSchema)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_record_batch_export(cast(GArrowRecordBatch*)cPtr, cast(void**)&cAbiArray, cast(void**)&cAbiSchema, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch filter(arrow.boolean_array.BooleanArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_filter(cast(GArrowRecordBatch*)cPtr, filter ? cast(GArrowBooleanArray*)filter.cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getColumnData(int i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_record_batch_get_column_data(cast(GArrowRecordBatch*)cPtr, i);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string getColumnName(int i)
  {
    const(char)* _cretval;
    _cretval = garrow_record_batch_get_column_name(cast(GArrowRecordBatch*)cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  uint getNColumns()
  {
    uint _retval;
    _retval = garrow_record_batch_get_n_columns(cast(GArrowRecordBatch*)cPtr);
    return _retval;
  }

  /** */
  long getNRows()
  {
    long _retval;
    _retval = garrow_record_batch_get_n_rows(cast(GArrowRecordBatch*)cPtr);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_record_batch_get_schema(cast(GArrowRecordBatch*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch removeColumn(uint i)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_remove_column(cast(GArrowRecordBatch*)cPtr, i, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer serialize(arrow.write_options.WriteOptions options = null)
  {
    GArrowBuffer* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_serialize(cast(GArrowRecordBatch*)cPtr, options ? cast(GArrowWriteOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch slice(long offset, long length)
  {
    GArrowRecordBatch* _cretval;
    _cretval = garrow_record_batch_slice(cast(GArrowRecordBatch*)cPtr, offset, length);
    auto _retval = ObjectG.getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.uint64_array.UInt64Array sortIndices(arrow.sort_options.SortOptions options)
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_sort_indices(cast(GArrowRecordBatch*)cPtr, options ? cast(GArrowSortOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.uint64_array.UInt64Array)(cast(GArrowUInt64Array*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch take(arrow.array.Array indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_take(cast(GArrowRecordBatch*)cPtr, indices ? cast(GArrowArray*)indices.cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_to_string(cast(GArrowRecordBatch*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
