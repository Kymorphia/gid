/// Module for [SeekableInputStream] class
module arrow.seekable_input_stream;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.input_stream;
import arrow.readable;
import arrow.readable_mixin;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

/** */
class SeekableInputStream : arrow.input_stream.InputStream
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
    return cast(void function())garrow_seekable_input_stream_get_type != &gidSymbolNotFound ? garrow_seekable_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SeekableInputStream self()
  {
    return this;
  }

  /** */
  ulong getSize()
  {
    ulong _retval;
    GError *_err;
    _retval = garrow_seekable_input_stream_get_size(cast(GArrowSeekableInputStream*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool getSupportZeroCopy()
  {
    bool _retval;
    _retval = cast(bool)garrow_seekable_input_stream_get_support_zero_copy(cast(GArrowSeekableInputStream*)this._cPtr);
    return _retval;
  }

  /** */
  glib.bytes.Bytes peek(long nBytes)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = garrow_seekable_input_stream_peek(cast(GArrowSeekableInputStream*)this._cPtr, nBytes, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  arrow.buffer.Buffer readAt(long position, long nBytes)
  {
    GArrowBuffer* _cretval;
    GError *_err;
    _cretval = garrow_seekable_input_stream_read_at(cast(GArrowSeekableInputStream*)this._cPtr, position, nBytes, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  glib.bytes.Bytes readAtBytes(long position, long nBytes)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = garrow_seekable_input_stream_read_at_bytes(cast(GArrowSeekableInputStream*)this._cPtr, position, nBytes, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
