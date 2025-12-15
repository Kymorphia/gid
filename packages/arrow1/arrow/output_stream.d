/// Module for [OutputStream] class
module arrow.output_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.record_batch;
import arrow.tensor;
import arrow.types;
import arrow.writable;
import arrow.writable_mixin;
import arrow.write_options;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class OutputStream : gobject.object.ObjectWrap, arrow.file.File, arrow.writable.Writable
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
    return cast(void function())garrow_output_stream_get_type != &gidSymbolNotFound ? garrow_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OutputStream self()
  {
    return this;
  }

  mixin FileT!();
  mixin WritableT!();

  /** */
  bool align_(int alignment)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_output_stream_align(cast(GArrowOutputStream*)this._cPtr, alignment, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  long writeRecordBatch(arrow.record_batch.RecordBatch recordBatch, arrow.write_options.WriteOptions options = null)
  {
    long _retval;
    GError *_err;
    _retval = garrow_output_stream_write_record_batch(cast(GArrowOutputStream*)this._cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch._cPtr(No.Dup) : null, options ? cast(GArrowWriteOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  long writeTensor(arrow.tensor.Tensor tensor)
  {
    long _retval;
    GError *_err;
    _retval = garrow_output_stream_write_tensor(cast(GArrowOutputStream*)this._cPtr, tensor ? cast(GArrowTensor*)tensor._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
