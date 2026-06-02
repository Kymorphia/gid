/// Module for [StreamReader] class
module arrowflight.stream_reader;

public import gid.basictypes;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.record_batch_reader;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;

/** */
class StreamReader : arrowflight.record_batch_reader.RecordBatchReader
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
    return cast(void function())gaflight_stream_reader_get_type != &gidSymbolNotFound ? gaflight_stream_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamReader self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowflight.stream_reader.StreamReader]
      Returns: New builder object
  */
  static StreamReaderGidBuilder builder() nothrow
  {
    return new StreamReaderGidBuilder;
  }
}

/// Fluent builder implementation template for [arrowflight.stream_reader.StreamReader]
class StreamReaderGidBuilderImpl(T) : arrowflight.record_batch_reader.RecordBatchReaderGidBuilderImpl!T
{
}

/// Fluent builder for [arrowflight.stream_reader.StreamReader]
final class StreamReaderGidBuilder : StreamReaderGidBuilderImpl!StreamReaderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamReader build() nothrow
  {
    return new StreamReader(cast(void*)createGObject(StreamReader._getGType), No.Take);
  }
}
