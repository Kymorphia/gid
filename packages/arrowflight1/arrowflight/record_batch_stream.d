/// Module for [RecordBatchStream] class
module arrowflight.record_batch_stream;

import arrow.record_batch_reader;
import arrow.write_options;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.data_stream;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class RecordBatchStream : arrowflight.data_stream.DataStream
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
    return cast(void function())gaflight_record_batch_stream_get_type != &gidSymbolNotFound ? gaflight_record_batch_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchStream self()
  {
    return this;
  }

  /**
      Get builder for [arrowflight.record_batch_stream.RecordBatchStream]
      Returns: New builder object
  */
  static RecordBatchStreamGidBuilder builder()
  {
    return new RecordBatchStreamGidBuilder;
  }

  /**
      Get `reader` property.
      Returns: The reader that produces record batches.
  */
  @property arrow.record_batch_reader.RecordBatchReader reader()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.record_batch_reader.RecordBatchReader)("reader");
  }

  /** */
  this(arrow.record_batch_reader.RecordBatchReader reader, arrow.write_options.WriteOptions options = null)
  {
    GAFlightRecordBatchStream* _cretval;
    _cretval = gaflight_record_batch_stream_new(reader ? cast(GArrowRecordBatchReader*)reader._cPtr(No.Dup) : null, options ? cast(GArrowWriteOptions*)options._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrowflight.record_batch_stream.RecordBatchStream]
class RecordBatchStreamGidBuilderImpl(T) : arrowflight.data_stream.DataStreamGidBuilderImpl!T
{

  /**
      Set `reader` property.
      Params:
        propval = The reader that produces record batches.
      Returns: Builder instance for fluent chaining
  */
  T reader(arrow.record_batch_reader.RecordBatchReader propval)
  {
    return setProperty("reader", propval);
  }
}

/// Fluent builder for [arrowflight.record_batch_stream.RecordBatchStream]
final class RecordBatchStreamGidBuilder : RecordBatchStreamGidBuilderImpl!RecordBatchStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RecordBatchStream build()
  {
    return new RecordBatchStream(cast(void*)createGObject(RecordBatchStream._getGType), Yes.Take);
  }
}
