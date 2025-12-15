/// Module for [StreamListener] class
module arrow.stream_listener;

import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.schema;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class StreamListener : gobject.object.ObjectWrap
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
    return cast(void function())garrow_stream_listener_get_type != &gidSymbolNotFound ? garrow_stream_listener_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamListener self()
  {
    return this;
  }

  /**
      Processes an EOS event.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool onEos()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_stream_listener_on_eos(cast(GArrowStreamListener*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Processes a decoded record batch.
  
      Params:
        recordBatch = A decoded #GArrowRecordBatch.
        metadata = A decoded metadata.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool onRecordBatchDecoded(arrow.record_batch.RecordBatch recordBatch, string[string] metadata = null)
  {
    bool _retval;
    auto _metadata = gHashTableFromD!(string, string)(metadata);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_metadata);
    GError *_err;
    _retval = cast(bool)garrow_stream_listener_on_record_batch_decoded(cast(GArrowStreamListener*)this._cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch._cPtr(No.Dup) : null, _metadata, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Processes a decoded schema.
  
      Params:
        schema = A decoded #GArrowSchema.
        filteredSchema = A decoded #GArrowSchema that only has read fields.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool onSchemaDecoded(arrow.schema.Schema schema, arrow.schema.Schema filteredSchema)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_stream_listener_on_schema_decoded(cast(GArrowStreamListener*)this._cPtr, schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, filteredSchema ? cast(GArrowSchema*)filteredSchema._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
