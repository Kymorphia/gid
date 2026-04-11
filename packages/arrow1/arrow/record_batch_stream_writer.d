/// Module for [RecordBatchStreamWriter] class
module arrow.record_batch_stream_writer;

import arrow.c.functions;
import arrow.c.types;
import arrow.output_stream;
import arrow.record_batch_writer;
import arrow.schema;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class RecordBatchStreamWriter : arrow.record_batch_writer.RecordBatchWriter
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
    return cast(void function())garrow_record_batch_stream_writer_get_type != &gidSymbolNotFound ? garrow_record_batch_stream_writer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchStreamWriter self()
  {
    return this;
  }

  /**
      Get builder for [arrow.record_batch_stream_writer.RecordBatchStreamWriter]
      Returns: New builder object
  */
  static RecordBatchStreamWriterGidBuilder builder()
  {
    return new RecordBatchStreamWriterGidBuilder;
  }

  /** */
  this(arrow.output_stream.OutputStream sink, arrow.schema.Schema schema)
  {
    GArrowRecordBatchStreamWriter* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_stream_writer_new(sink ? cast(GArrowOutputStream*)sink._cPtr(No.Dup) : null, schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.record_batch_stream_writer.RecordBatchStreamWriter]
class RecordBatchStreamWriterGidBuilderImpl(T) : arrow.record_batch_writer.RecordBatchWriterGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.record_batch_stream_writer.RecordBatchStreamWriter]
final class RecordBatchStreamWriterGidBuilder : RecordBatchStreamWriterGidBuilderImpl!RecordBatchStreamWriterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RecordBatchStreamWriter build()
  {
    return new RecordBatchStreamWriter(cast(void*)createGObject(RecordBatchStreamWriter._getGType), Yes.Take);
  }
}
