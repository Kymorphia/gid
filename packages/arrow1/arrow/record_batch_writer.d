/// Module for [RecordBatchWriter] class
module arrow.record_batch_writer;

import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class RecordBatchWriter : gobject.object.ObjectWrap
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
    return cast(void function())garrow_record_batch_writer_get_type != &gidSymbolNotFound ? garrow_record_batch_writer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchWriter self()
  {
    return this;
  }

  /** */
  bool close()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_record_batch_writer_close(cast(GArrowRecordBatchWriter*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool isClosed()
  {
    bool _retval;
    _retval = cast(bool)garrow_record_batch_writer_is_closed(cast(GArrowRecordBatchWriter*)this._cPtr);
    return _retval;
  }

  /** */
  bool writeRecordBatch(arrow.record_batch.RecordBatch recordBatch)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_record_batch_writer_write_record_batch(cast(GArrowRecordBatchWriter*)this._cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool writeTable(arrow.table.Table table)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_record_batch_writer_write_table(cast(GArrowRecordBatchWriter*)this._cPtr, table ? cast(GArrowTable*)table._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
