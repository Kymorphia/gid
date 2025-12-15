/// Module for [FileWriter] class
module arrowdataset.file_writer;

import arrow.record_batch;
import arrow.record_batch_reader;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class FileWriter : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_file_writer_get_type != &gidSymbolNotFound ? gadataset_file_writer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileWriter self()
  {
    return this;
  }

  /** */
  bool finish()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gadataset_file_writer_finish(cast(GADatasetFileWriter*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool writeRecordBatch(arrow.record_batch.RecordBatch recordBatch)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gadataset_file_writer_write_record_batch(cast(GADatasetFileWriter*)this._cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool writeRecordBatchReader(arrow.record_batch_reader.RecordBatchReader reader)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gadataset_file_writer_write_record_batch_reader(cast(GADatasetFileWriter*)this._cPtr, reader ? cast(GArrowRecordBatchReader*)reader._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
