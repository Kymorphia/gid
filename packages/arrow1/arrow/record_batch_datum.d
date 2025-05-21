/// Module for [RecordBatchDatum] class
module arrow.record_batch_datum;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.record_batch;
import arrow.types;
import gid.gid;

/** */
class RecordBatchDatum : arrow.datum.Datum
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
    return cast(void function())garrow_record_batch_datum_get_type != &gidSymbolNotFound ? garrow_record_batch_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchDatum self()
  {
    return this;
  }

  /** */
  this(arrow.record_batch.RecordBatch value)
  {
    GArrowRecordBatchDatum* _cretval;
    _cretval = garrow_record_batch_datum_new(value ? cast(GArrowRecordBatch*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
