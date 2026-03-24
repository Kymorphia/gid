/// Module for [RecordBatchReader] class
module arrowflight.record_batch_reader;

import arrow.table;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.stream_chunk;
import arrowflight.types;
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
    return cast(void function())gaflight_record_batch_reader_get_type != &gidSymbolNotFound ? gaflight_record_batch_reader_get_type() : cast(GType)0;
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
  Get builder for [arrowflight.record_batch_reader.RecordBatchReader]
  Returns: New builder object
  */
  static RecordBatchReaderGidBuilder builder()
  {
    return new RecordBatchReaderGidBuilder;
  }

  /** */
  arrow.table.Table readAll()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = gaflight_record_batch_reader_read_all(cast(GAFlightRecordBatchReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrowflight.stream_chunk.StreamChunk readNext()
  {
    GAFlightStreamChunk* _cretval;
    GError *_err;
    _cretval = gaflight_record_batch_reader_read_next(cast(GAFlightRecordBatchReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowflight.stream_chunk.StreamChunk)(cast(GAFlightStreamChunk*)_cretval, Yes.Take);
    return _retval;
  }
}

class RecordBatchReaderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T isOwner(bool propval)
  {
    return setProperty("is-owner", propval);
  }

  /** */
  T reader(void* propval)
  {
    return setProperty("reader", propval);
  }
}

/// Fluent builder for [arrowflight.record_batch_reader.RecordBatchReader]
final class RecordBatchReaderGidBuilder : RecordBatchReaderGidBuilderImpl!RecordBatchReaderGidBuilder
{
  RecordBatchReader build()
  {
    return new RecordBatchReader(cast(void*)createGObject(RecordBatchReader._getGType), No.Take);
  }
}
