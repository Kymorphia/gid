/// Module for [RecordBatchReader] class
module arrow.record_batch_reader;

import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.schema;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class RecordBatchReader : gobject.object.ObjectWrap
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
    return cast(void function())garrow_record_batch_reader_get_type != &gidSymbolNotFound ? garrow_record_batch_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchReader self()
  {
    return this;
  }

  /**
  Get builder for [arrow.record_batch_reader.RecordBatchReader]
  Returns: New builder object
  */
  static RecordBatchReaderGidBuilder builder()
  {
    return new RecordBatchReaderGidBuilder;
  }

  /** */
  this(arrow.record_batch.RecordBatch[] recordBatches, arrow.schema.Schema schema = null)
  {
    GArrowRecordBatchReader* _cretval;
    auto _recordBatches = gListFromD!(arrow.record_batch.RecordBatch)(recordBatches);
    scope(exit) containerFree!(GList*, arrow.record_batch.RecordBatch, GidOwnership.None)(_recordBatches);
    GError *_err;
    _cretval = garrow_record_batch_reader_new(_recordBatches, schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.record_batch_reader.RecordBatchReader import_(void* cAbiArrayStream)
  {
    GArrowRecordBatchReader* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_reader_import(cAbiArrayStream, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch_reader.RecordBatchReader)(cast(GArrowRecordBatchReader*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void* export_()
  {
    GError *_err;
    auto _retval = garrow_record_batch_reader_export(cast(GArrowRecordBatchReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch getNextRecordBatch()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_reader_get_next_record_batch(cast(GArrowRecordBatchReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_record_batch_reader_get_schema(cast(GArrowRecordBatchReader*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gobject.object.ObjectWrap[] getSources()
  {
    GList* _cretval;
    _cretval = garrow_record_batch_reader_get_sources(cast(GArrowRecordBatchReader*)this._cPtr);
    auto _retval = gListToD!(gobject.object.ObjectWrap, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  arrow.table.Table readAll()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_reader_read_all(cast(GArrowRecordBatchReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch readNext()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_reader_read_next(cast(GArrowRecordBatchReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch readNextRecordBatch()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_reader_read_next_record_batch(cast(GArrowRecordBatchReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }
}

class RecordBatchReaderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T recordBatchReader(void* propval)
  {
    return setProperty("record-batch-reader", propval);
  }

  /** */
  T sources(void* propval)
  {
    return setProperty("sources", propval);
  }
}

/// Fluent builder for [arrow.record_batch_reader.RecordBatchReader]
final class RecordBatchReaderGidBuilder : RecordBatchReaderGidBuilderImpl!RecordBatchReaderGidBuilder
{
  RecordBatchReader build()
  {
    return new RecordBatchReader(cast(void*)createGObject(RecordBatchReader._getGType), Yes.Take);
  }
}
