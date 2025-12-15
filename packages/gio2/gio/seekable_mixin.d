/// Module for [Seekable] interface mixin
module gio.seekable_mixin;

public import gio.seekable_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.types;
public import glib.error;
public import glib.types;

/**
    [gio.seekable.Seekable] is implemented by streams (implementations of
    [gio.input_stream.InputStream] or [gio.output_stream.OutputStream]) that support seeking.
    
    Seekable streams largely fall into two categories: resizable and
    fixed-size.
    
    [gio.seekable.Seekable] on fixed-sized streams is approximately the same as POSIX
    [`lseek()`](man:lseek(2)) on a block device (for example: attempting to seek
    past the end of the device is an error).  Fixed streams typically cannot be
    truncated.
    
    [gio.seekable.Seekable] on resizable streams is approximately the same as POSIX
    [`lseek()`](man:lseek(2)) on a normal file.  Seeking past the end and writing
    data will usually cause the stream to resize by introducing zero bytes.
*/
template SeekableT()
{

  /**
      Tests if the stream supports the #GSeekableIface.
      Returns: true if seekable can be seeked. false otherwise.
  */
  override bool canSeek()
  {
    bool _retval;
    _retval = cast(bool)g_seekable_can_seek(cast(GSeekable*)this._cPtr);
    return _retval;
  }

  /**
      Tests if the length of the stream can be adjusted with
      [gio.seekable.Seekable.truncate].
      Returns: true if the stream can be truncated, false otherwise.
  */
  override bool canTruncate()
  {
    bool _retval;
    _retval = cast(bool)g_seekable_can_truncate(cast(GSeekable*)this._cPtr);
    return _retval;
  }

  /**
      Seeks in the stream by the given offset, modified by type.
      
      Attempting to seek past the end of the stream will have different
      results depending on if the stream is fixed-sized or resizable.  If
      the stream is resizable then seeking past the end and then writing
      will result in zeros filling the empty space.  Seeking past the end
      of a resizable stream and reading will result in EOF.  Seeking past
      the end of a fixed-sized stream will fail.
      
      Any operation that would result in a negative offset will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        offset = a #goffset.
        type = a #GSeekType.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if successful. If an error
            has occurred, this function will return false and set error
            appropriately if present.
      Throws: [ErrorWrap]
  */
  override bool seek(long offset, glib.types.SeekType type, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_seekable_seek(cast(GSeekable*)this._cPtr, offset, type, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Tells the current position within the stream.
      Returns: the (positive or zero) offset from the beginning of the
        buffer, zero if the target is not seekable.
  */
  override long tell()
  {
    long _retval;
    _retval = g_seekable_tell(cast(GSeekable*)this._cPtr);
    return _retval;
  }

  /**
      Sets the length of the stream to offset. If the stream was previously
      larger than offset, the extra data is discarded. If the stream was
      previously shorter than offset, it is extended with NUL ('\0') bytes.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
  
      Params:
        offset = new length for seekable, in bytes.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if successful. If an error
            has occurred, this function will return false and set error
            appropriately if present.
      Throws: [ErrorWrap]
  */
  override bool truncate(long offset, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_seekable_truncate(cast(GSeekable*)this._cPtr, offset, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
