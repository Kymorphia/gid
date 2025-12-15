/// Module for [RecordBatchIterator] class
module arrow.record_batch_iterator;

import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class RecordBatchIterator : gobject.object.ObjectWrap
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
    return cast(void function())garrow_record_batch_iterator_get_type != &gidSymbolNotFound ? garrow_record_batch_iterator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchIterator self()
  {
    return this;
  }

  /** */
  this(arrow.record_batch.RecordBatch[] recordBatches)
  {
    GArrowRecordBatchIterator* _cretval;
    auto _recordBatches = gListFromD!(arrow.record_batch.RecordBatch)(recordBatches);
    scope(exit) containerFree!(GList*, arrow.record_batch.RecordBatch, GidOwnership.None)(_recordBatches);
    _cretval = garrow_record_batch_iterator_new(_recordBatches);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.record_batch_iterator.RecordBatchIterator otherIterator)
  {
    bool _retval;
    _retval = cast(bool)garrow_record_batch_iterator_equal(cast(GArrowRecordBatchIterator*)this._cPtr, otherIterator ? cast(GArrowRecordBatchIterator*)otherIterator._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch next()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_iterator_next(cast(GArrowRecordBatchIterator*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch[] toList()
  {
    GList* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_iterator_to_list(cast(GArrowRecordBatchIterator*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(arrow.record_batch.RecordBatch, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}
