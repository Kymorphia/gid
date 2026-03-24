/// Module for [RecordBatchFileWriter] class
module arrow.record_batch_file_writer;

import arrow.c.functions;
import arrow.c.types;
import arrow.output_stream;
import arrow.record_batch_stream_writer;
import arrow.schema;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class RecordBatchFileWriter : arrow.record_batch_stream_writer.RecordBatchStreamWriter
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
    return cast(void function())garrow_record_batch_file_writer_get_type != &gidSymbolNotFound ? garrow_record_batch_file_writer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchFileWriter self()
  {
    return this;
  }

  /**
  Get builder for [arrow.record_batch_file_writer.RecordBatchFileWriter]
  Returns: New builder object
  */
  static RecordBatchFileWriterGidBuilder builder()
  {
    return new RecordBatchFileWriterGidBuilder;
  }

  /** */
  this(arrow.output_stream.OutputStream sink, arrow.schema.Schema schema)
  {
    GArrowRecordBatchFileWriter* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_file_writer_new(sink ? cast(GArrowOutputStream*)sink._cPtr(No.Dup) : null, schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

class RecordBatchFileWriterGidBuilderImpl(T) : arrow.record_batch_stream_writer.RecordBatchStreamWriterGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.record_batch_file_writer.RecordBatchFileWriter]
final class RecordBatchFileWriterGidBuilder : RecordBatchFileWriterGidBuilderImpl!RecordBatchFileWriterGidBuilder
{
  RecordBatchFileWriter build()
  {
    return new RecordBatchFileWriter(cast(void*)createGObject(RecordBatchFileWriter._getGType), Yes.Take);
  }
}
