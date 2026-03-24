/// Module for [RecordBatchBuilder] class
module arrow.record_batch_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.schema;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class RecordBatchBuilder : gobject.object.ObjectWrap
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
    return cast(void function())garrow_record_batch_builder_get_type != &gidSymbolNotFound ? garrow_record_batch_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchBuilder self()
  {
    return this;
  }

  /**
  Get builder for [arrow.record_batch_builder.RecordBatchBuilder]
  Returns: New builder object
  */
  static RecordBatchBuilderGidBuilder builder()
  {
    return new RecordBatchBuilderGidBuilder;
  }

  /** */
  this(arrow.schema.Schema schema)
  {
    GArrowRecordBatchBuilder* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_builder_new(schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.record_batch.RecordBatch flush()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_builder_flush(cast(GArrowRecordBatchBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getColumnBuilder(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_record_batch_builder_get_column_builder(cast(GArrowRecordBatchBuilder*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getField(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_record_batch_builder_get_field(cast(GArrowRecordBatchBuilder*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  /** */
  long getInitialCapacity()
  {
    long _retval;
    _retval = garrow_record_batch_builder_get_initial_capacity(cast(GArrowRecordBatchBuilder*)this._cPtr);
    return _retval;
  }

  /** */
  int getNColumns()
  {
    int _retval;
    _retval = garrow_record_batch_builder_get_n_columns(cast(GArrowRecordBatchBuilder*)this._cPtr);
    return _retval;
  }

  /** */
  int getNFields()
  {
    int _retval;
    _retval = garrow_record_batch_builder_get_n_fields(cast(GArrowRecordBatchBuilder*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_record_batch_builder_get_schema(cast(GArrowRecordBatchBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void setInitialCapacity(long capacity)
  {
    garrow_record_batch_builder_set_initial_capacity(cast(GArrowRecordBatchBuilder*)this._cPtr, capacity);
  }
}

class RecordBatchBuilderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T recordBatchBuilder(void* propval)
  {
    return setProperty("record-batch-builder", propval);
  }
}

/// Fluent builder for [arrow.record_batch_builder.RecordBatchBuilder]
final class RecordBatchBuilderGidBuilder : RecordBatchBuilderGidBuilderImpl!RecordBatchBuilderGidBuilder
{
  RecordBatchBuilder build()
  {
    return new RecordBatchBuilder(cast(void*)createGObject(RecordBatchBuilder._getGType), Yes.Take);
  }
}
