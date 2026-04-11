/// Module for [RecordBatchFileReader] class
module arrow.record_batch_file_reader;

import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.schema;
import arrow.seekable_input_stream;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class RecordBatchFileReader : gobject.object.ObjectWrap
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
    return cast(void function())garrow_record_batch_file_reader_get_type != &gidSymbolNotFound ? garrow_record_batch_file_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchFileReader self()
  {
    return this;
  }

  /**
      Get builder for [arrow.record_batch_file_reader.RecordBatchFileReader]
      Returns: New builder object
  */
  static RecordBatchFileReaderGidBuilder builder()
  {
    return new RecordBatchFileReaderGidBuilder;
  }

  /** */
  this(arrow.seekable_input_stream.SeekableInputStream file)
  {
    GArrowRecordBatchFileReader* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_file_reader_new(file ? cast(GArrowSeekableInputStream*)file._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  uint getNRecordBatches()
  {
    uint _retval;
    _retval = garrow_record_batch_file_reader_get_n_record_batches(cast(GArrowRecordBatchFileReader*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch getRecordBatch(uint i)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_file_reader_get_record_batch(cast(GArrowRecordBatchFileReader*)this._cPtr, i, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_record_batch_file_reader_get_schema(cast(GArrowRecordBatchFileReader*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.types.MetadataVersion getVersion()
  {
    GArrowMetadataVersion _cretval;
    _cretval = garrow_record_batch_file_reader_get_version(cast(GArrowRecordBatchFileReader*)this._cPtr);
    arrow.types.MetadataVersion _retval = cast(arrow.types.MetadataVersion)_cretval;
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch readRecordBatch(uint i)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_file_reader_read_record_batch(cast(GArrowRecordBatchFileReader*)this._cPtr, i, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.record_batch_file_reader.RecordBatchFileReader]
class RecordBatchFileReaderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T recordBatchFileReader(void* propval)
  {
    return setProperty("record-batch-file-reader", propval);
  }
}

/// Fluent builder for [arrow.record_batch_file_reader.RecordBatchFileReader]
final class RecordBatchFileReaderGidBuilder : RecordBatchFileReaderGidBuilderImpl!RecordBatchFileReaderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RecordBatchFileReader build()
  {
    return new RecordBatchFileReader(cast(void*)createGObject(RecordBatchFileReader._getGType), Yes.Take);
  }
}
