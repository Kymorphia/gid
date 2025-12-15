/// Module for [StreamDecoder] class
module arrow.stream_decoder;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.read_options;
import arrow.schema;
import arrow.stream_listener;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

/** */
class StreamDecoder : gobject.object.ObjectWrap
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
    return cast(void function())garrow_stream_decoder_get_type != &gidSymbolNotFound ? garrow_stream_decoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamDecoder self()
  {
    return this;
  }

  /** */
  this(arrow.stream_listener.StreamListener listener, arrow.read_options.ReadOptions options = null)
  {
    GArrowStreamDecoder* _cretval;
    _cretval = garrow_stream_decoder_new(listener ? cast(GArrowStreamListener*)listener._cPtr(No.Dup) : null, options ? cast(GArrowReadOptions*)options._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Feed data to the decoder as a #GArrowBuffer.
      
      If the decoder can read one or more record batches by the data, the
      decoder calls `vfuncGArrowStreamListener.on_record_batch_decoded`
      with a decoded record batch multiple times.
  
      Params:
        buffer = A #GArrowBuffer to be decoded.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool consumeBuffer(arrow.buffer.Buffer buffer)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_stream_decoder_consume_buffer(cast(GArrowStreamDecoder*)this._cPtr, buffer ? cast(GArrowBuffer*)buffer._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Feed data to the decoder as a raw data.
      
      If the decoder can read one or more record batches by the data, the
      decoder calls `vfuncGArrowStreamListener.on_record_batch_decoded`
      with a decoded record batch multiple times.
  
      Params:
        bytes = A #GBytes to be decoded.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool consumeBytes(glib.bytes.Bytes bytes)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_stream_decoder_consume_bytes(cast(GArrowStreamDecoder*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      This method is provided for users who want to optimize performance.
      Normal users don't need to use this method.
      
      Here is an example usage for normal users:
      
          garrow_stream_decoder_consume_buffer(decoder, buffer1);
          garrow_stream_decoder_consume_buffer(decoder, buffer2);
          garrow_stream_decoder_consume_buffer(decoder, buffer3);
      
      Decoder has internal buffer. If consumed data isn't enough to
      advance the state of the decoder, consumed data is buffered to
      the internal buffer. It causes performance overhead.
      
      If you pass garrow_stream_decoer_get_next_required_size() size data
      to each
      [arrow.stream_decoder.StreamDecoder.consumeBytes]/[arrow.stream_decoder.StreamDecoder.consumeBuffer]
      call, the decoder doesn't use its internal buffer. It improves
      performance.
      
      Here is an example usage to avoid using internal buffer:
      
          buffer1 = get_data(garrow_stream_decoder_get_next_required_size(decoder));
          garrow_stream_decoder_consume_buffer(buffer1);
          buffer2 = get_data(garrow_stream_decoder_get_next_required_size(decoder));
          garrow_stream_decoder_consume_buffer(buffer2);
      
      Users can use this method to avoid creating small chunks. Record
      batch data must be contiguous data. If users pass small chunks to
      the decoder, the decoder needs concatenate small chunks
      internally. It causes performance overhead.
      
      Here is an example usage to reduce small chunks:
      
          GArrowResizablBuffer *buffer = garrow_resizable_buffer_new(1024, NULL);
          while ((small_chunk = get_data(&small_chunk_size))) {
            size_t current_buffer_size = garrow_buffer_get_size(GARROW_BUFFER(buffer));
            garrow_resizable_buffer_resize(buffer, current_buffer_size + small_chunk_size,
      NULL);
            garrow_mutable_buffer_set_data(GARROW_MUTABLE_BUFFER(buffer),
                                           current_buffer_size,
                                           small_chunk,
                                           small_chunk_size,
                                           NULL);
            if (garrow_buffer_get_size(GARROW_BUFFER(buffer)) <
                garrow_stream_decoder_get_next_required_size(decoder)) {
              continue;
            }
            garrow_stream_decoder_consume_buffer(decoder, GARROW_BUFFER(buffer), NULL);
            g_object_unref(buffer);
            buffer = garrow_resizable_buffer_new(1024, NULL);
          }
          if (garrow_buffer_get_size(GARROW_BUFFER(buffer)) > 0) {
            garrow_stream_decoder_consume_buffer(decoder, GARROW_BUFFER(buffer), NULL);
          }
          g_object_unref(buffer);
      Returns: The number of bytes needed to advance the state of
          the decoder.
  */
  size_t getNextRequiredSize()
  {
    size_t _retval;
    _retval = garrow_stream_decoder_get_next_required_size(cast(GArrowStreamDecoder*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_stream_decoder_get_schema(cast(GArrowStreamDecoder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Reset the internal status.
      
      You can reuse this decoder for new stream after calling this.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool reset()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_stream_decoder_reset(cast(GArrowStreamDecoder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
