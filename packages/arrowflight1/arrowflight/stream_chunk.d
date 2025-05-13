/// Module for [StreamChunk] class
module arrowflight.stream_chunk;

import arrow.buffer;
import arrow.record_batch;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class StreamChunk : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_stream_chunk_get_type != &gidSymbolNotFound ? gaflight_stream_chunk_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamChunk self()
  {
    return this;
  }

  alias getData = gobject.object.ObjectWrap.getData;

  /** */
  arrow.record_batch.RecordBatch getData()
  {
    GArrowRecordBatch* _cretval;
    _cretval = gaflight_stream_chunk_get_data(cast(GAFlightStreamChunk*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getMetadata()
  {
    GArrowBuffer* _cretval;
    _cretval = gaflight_stream_chunk_get_metadata(cast(GAFlightStreamChunk*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
