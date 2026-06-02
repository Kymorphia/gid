/// Module for [StreamWriter] class
module arrowflight.stream_writer;

public import gid.basictypes;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.record_batch_writer;
import arrowflight.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class StreamWriter : arrowflight.record_batch_writer.RecordBatchWriter
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_stream_writer_get_type != &gidSymbolNotFound ? gaflight_stream_writer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamWriter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowflight.stream_writer.StreamWriter]
      Returns: New builder object
  */
  static StreamWriterGidBuilder builder() nothrow
  {
    return new StreamWriterGidBuilder;
  }

  /** */
  bool doneWriting()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gaflight_stream_writer_done_writing(cast(GAFlightStreamWriter*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrowflight.stream_writer.StreamWriter]
class StreamWriterGidBuilderImpl(T) : arrowflight.record_batch_writer.RecordBatchWriterGidBuilderImpl!T
{
}

/// Fluent builder for [arrowflight.stream_writer.StreamWriter]
final class StreamWriterGidBuilder : StreamWriterGidBuilderImpl!StreamWriterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamWriter build() nothrow
  {
    return new StreamWriter(cast(void*)createGObject(StreamWriter._getGType), No.Take);
  }
}
