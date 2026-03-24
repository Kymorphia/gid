/// Module for [RecordBatchStreamReader] class
module arrow.record_batch_stream_reader;

import arrow.c.functions;
import arrow.c.types;
import arrow.input_stream;
import arrow.record_batch_reader;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class RecordBatchStreamReader : arrow.record_batch_reader.RecordBatchReader
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
    return cast(void function())garrow_record_batch_stream_reader_get_type != &gidSymbolNotFound ? garrow_record_batch_stream_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchStreamReader self()
  {
    return this;
  }

  /**
  Get builder for [arrow.record_batch_stream_reader.RecordBatchStreamReader]
  Returns: New builder object
  */
  static RecordBatchStreamReaderGidBuilder builder()
  {
    return new RecordBatchStreamReaderGidBuilder;
  }

  /** */
  this(arrow.input_stream.InputStream stream)
  {
    GArrowRecordBatchStreamReader* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_stream_reader_new(stream ? cast(GArrowInputStream*)stream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

class RecordBatchStreamReaderGidBuilderImpl(T) : arrow.record_batch_reader.RecordBatchReaderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.record_batch_stream_reader.RecordBatchStreamReader]
final class RecordBatchStreamReaderGidBuilder : RecordBatchStreamReaderGidBuilderImpl!RecordBatchStreamReaderGidBuilder
{
  RecordBatchStreamReader build()
  {
    return new RecordBatchStreamReader(cast(void*)createGObject(RecordBatchStreamReader._getGType), Yes.Take);
  }
}
