/// Module for [RecordBatchDatum] class
module arrow.record_batch_datum;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.record_batch;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

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

  /**
      Get builder for [arrow.record_batch_datum.RecordBatchDatum]
      Returns: New builder object
  */
  static RecordBatchDatumGidBuilder builder()
  {
    return new RecordBatchDatumGidBuilder;
  }

  /** */
  @property arrow.record_batch.RecordBatch value()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.record_batch.RecordBatch)("value");
  }

  /** */
  this(arrow.record_batch.RecordBatch value)
  {
    GArrowRecordBatchDatum* _cretval;
    _cretval = garrow_record_batch_datum_new(value ? cast(GArrowRecordBatch*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.record_batch_datum.RecordBatchDatum]
class RecordBatchDatumGidBuilderImpl(T) : arrow.datum.DatumGidBuilderImpl!T
{

  /** */
  T value(arrow.record_batch.RecordBatch propval)
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [arrow.record_batch_datum.RecordBatchDatum]
final class RecordBatchDatumGidBuilder : RecordBatchDatumGidBuilderImpl!RecordBatchDatumGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RecordBatchDatum build()
  {
    return new RecordBatchDatum(cast(void*)createGObject(RecordBatchDatum._getGType), Yes.Take);
  }
}
