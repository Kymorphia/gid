/// Module for [OutputStream] class
module gio.output_stream;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.input_stream;
import gio.types;
import glib.bytes;
import glib.error;
import gobject.object;

/**
    [gio.output_stream.OutputStream] is a base class for implementing streaming output.
    
    It has functions to write to a stream ([gio.output_stream.OutputStream.write]),
    to close a stream ([gio.output_stream.OutputStream.close]) and to flush pending
    writes ([gio.output_stream.OutputStream.flush]).
    
    To copy the content of an input stream to an output stream without
    manually handling the reads and writes, use [gio.output_stream.OutputStream.splice].
    
    See the documentation for [gio.iostream.IOStream] for details of thread safety
    of streaming APIs.
    
    All of these functions have async variants too.
    
    All classes derived from [gio.output_stream.OutputStream] *should* implement synchronous
    writing, splicing, flushing and closing streams, but *may* implement
    asynchronous versions.
*/
class OutputStream : gobject.object.ObjectWrap
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
    return cast(void function())g_output_stream_get_type != &gidSymbolNotFound ? g_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OutputStream self()
  {
    return this;
  }

  /**
      Clears the pending flag on stream.
  */
  void clearPending()
  {
    g_output_stream_clear_pending(cast(GOutputStream*)this._cPtr);
  }

  /**
      Closes the stream, releasing resources related to it.
      
      Once the stream is closed, all other operations will return [gio.types.IOErrorEnum.Closed].
      Closing a stream multiple times will not return an error.
      
      Closing a stream will automatically flush any outstanding buffers in the
      stream.
      
      Streams will be automatically closed when the last reference
      is dropped, but you might want to call this function to make sure
      resources are released as early as possible.
      
      Some streams might keep the backing store of the stream (e.g. a file descriptor)
      open after the stream is closed. See the documentation for the individual
      stream for details.
      
      On failure the first error that happened will be reported, but the close
      operation will finish as much as possible. A stream that failed to
      close will still return [gio.types.IOErrorEnum.Closed] for all operations. Still, it
      is important to check and report the error to the user, otherwise
      there might be a loss of data as all data might not be written.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      Cancelling a close will still leave the stream closed, but there some streams
      can use a faster close that doesn't block to e.g. check errors. On
      cancellation (as with any error) there is no guarantee that all written
      data will reach the target.
  
      Params:
        cancellable = optional cancellable object
      Returns: true on success, false on failure
      Throws: [ErrorWrap]
  */
  bool close(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_close(cast(GOutputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Requests an asynchronous close of the stream, releasing resources
      related to it. When the operation is finished callback will be
      called. You can then call [gio.output_stream.OutputStream.closeFinish] to get
      the result of the operation.
      
      For behaviour details see [gio.output_stream.OutputStream.close].
      
      The asynchronous methods have a default fallback that uses threads
      to implement asynchronicity, so they are optional for inheriting
      classes. However, if you override one you must override all.
  
      Params:
        ioPriority = the io priority of the request.
        cancellable = optional cancellable object
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void closeAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_close_async(cast(GOutputStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Closes an output stream.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if stream was successfully closed, false otherwise.
      Throws: [ErrorWrap]
  */
  bool closeFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_close_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Forces a write of all user-space buffered data for the given
      stream. Will block during the operation. Closing the stream will
      implicitly cause a flush.
      
      This function is optional for inherited classes.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional cancellable object
      Returns: true on success, false on error
      Throws: [ErrorWrap]
  */
  bool flush(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_flush(cast(GOutputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Forces an asynchronous write of all user-space buffered data for
      the given stream.
      For behaviour details see [gio.output_stream.OutputStream.flush].
      
      When the operation is finished callback will be
      called. You can then call [gio.output_stream.OutputStream.flushFinish] to get the
      result of the operation.
  
      Params:
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void flushAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_flush_async(cast(GOutputStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes flushing an output stream.
  
      Params:
        result = a GAsyncResult.
      Returns: true if flush operation succeeded, false otherwise.
      Throws: [ErrorWrap]
  */
  bool flushFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_flush_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Checks if an output stream has pending actions.
      Returns: true if stream has pending actions.
  */
  bool hasPending()
  {
    bool _retval;
    _retval = cast(bool)g_output_stream_has_pending(cast(GOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Checks if an output stream has already been closed.
      Returns: true if stream is closed. false otherwise.
  */
  bool isClosed()
  {
    bool _retval;
    _retval = cast(bool)g_output_stream_is_closed(cast(GOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Checks if an output stream is being closed. This can be
      used inside e.g. a flush implementation to see if the
      flush (or other i/o operation) is called from within
      the closing operation.
      Returns: true if stream is being closed. false otherwise.
  */
  bool isClosing()
  {
    bool _retval;
    _retval = cast(bool)g_output_stream_is_closing(cast(GOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Sets stream to have actions pending. If the pending flag is
      already set or stream is closed, it will return false and set
      error.
      Returns: true if pending was previously unset and is now set.
      Throws: [ErrorWrap]
  */
  bool setPending()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_set_pending(cast(GOutputStream*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Splices an input stream into an output stream.
  
      Params:
        source = a #GInputStream.
        flags = a set of #GOutputStreamSpliceFlags.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #gssize containing the size of the data spliced, or
            -1 if an error occurred. Note that if the number of bytes
            spliced is greater than `G_MAXSSIZE`, then that will be
            returned, and there is no way to determine the actual number
            of bytes spliced.
      Throws: [ErrorWrap]
  */
  ptrdiff_t splice(gio.input_stream.InputStream source, gio.types.OutputStreamSpliceFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_output_stream_splice(cast(GOutputStream*)this._cPtr, source ? cast(GInputStream*)source._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Splices a stream asynchronously.
      When the operation is finished callback will be called.
      You can then call [gio.output_stream.OutputStream.spliceFinish] to get the
      result of the operation.
      
      For the synchronous, blocking version of this function, see
      [gio.output_stream.OutputStream.splice].
  
      Params:
        source = a #GInputStream.
        flags = a set of #GOutputStreamSpliceFlags.
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void spliceAsync(gio.input_stream.InputStream source, gio.types.OutputStreamSpliceFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_splice_async(cast(GOutputStream*)this._cPtr, source ? cast(GInputStream*)source._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream splice operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: a #gssize of the number of bytes spliced. Note that if the
            number of bytes spliced is greater than `G_MAXSSIZE`, then that
            will be returned, and there is no way to determine the actual
            number of bytes spliced.
      Throws: [ErrorWrap]
  */
  ptrdiff_t spliceFinish(gio.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_output_stream_splice_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Tries to write count bytes from buffer into the stream. Will block
      during the operation.
      
      If count is 0, returns 0 and does nothing. A value of count
      larger than `G_MAXSSIZE` will cause a [gio.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes written to the stream is returned.
      It is not an error if this is not the same as the requested size, as it
      can happen e.g. on a partial I/O error, or if there is not enough
      storage in the stream. All writes block until at least one byte
      is written or an error occurs; 0 is never returned (unless
      count is 0).
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      On error -1 is returned and error is set accordingly.
  
      Params:
        buffer = the buffer containing the data to write.
        cancellable = optional cancellable object
      Returns: Number of bytes written, or -1 on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t write(ubyte[] buffer, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(void*)buffer.ptr;
    GError *_err;
    _retval = g_output_stream_write(cast(GOutputStream*)this._cPtr, _buffer, _count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Tries to write count bytes from buffer into the stream. Will block
      during the operation.
      
      This function is similar to [gio.output_stream.OutputStream.write], except it tries to
      write as many bytes as requested, only stopping on an error.
      
      On a successful write of count bytes, true is returned, and bytes_written
      is set to count.
      
      If there is an error during the operation false is returned and error
      is set to indicate the error status.
      
      As a special exception to the normal conventions for functions that
      use #GError, if this function returns false (and sets error) then
      bytes_written will be set to the number of bytes that were
      successfully written before the error was encountered.  This
      functionality is only available from C.  If you need it from another
      language then you must write your own loop around
      [gio.output_stream.OutputStream.write].
  
      Params:
        buffer = the buffer containing the data to write.
        bytesWritten = location to store the number of bytes that was
              written to the stream
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool writeAll(ubyte[] buffer, out size_t bytesWritten, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(void*)buffer.ptr;
    GError *_err;
    _retval = cast(bool)g_output_stream_write_all(cast(GOutputStream*)this._cPtr, _buffer, _count, cast(size_t*)&bytesWritten, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Request an asynchronous write of count bytes from buffer into
      the stream. When the operation is finished callback will be called.
      You can then call [gio.output_stream.OutputStream.writeAllFinish] to get the result of the
      operation.
      
      This is the asynchronous version of [gio.output_stream.OutputStream.writeAll].
      
      Call [gio.output_stream.OutputStream.writeAllFinish] to collect the result.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is `G_PRIORITY_DEFAULT`.
      
      Note that no copy of buffer will be made, so it must stay valid
      until callback is called.
  
      Params:
        buffer = the buffer containing the data to write
        ioPriority = the io priority of the request
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  */
  void writeAllAsync(ubyte[] buffer, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(void*)buffer.ptr;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_write_all_async(cast(GOutputStream*)this._cPtr, _buffer, _count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream write operation started with
      [gio.output_stream.OutputStream.writeAllAsync].
      
      As a special exception to the normal conventions for functions that
      use #GError, if this function returns false (and sets error) then
      bytes_written will be set to the number of bytes that were
      successfully written before the error was encountered.  This
      functionality is only available from C.  If you need it from another
      language then you must write your own loop around
      [gio.output_stream.OutputStream.writeAsync].
  
      Params:
        result = a #GAsyncResult
        bytesWritten = location to store the number of bytes that was written to the stream
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool writeAllFinish(gio.async_result.AsyncResult result, out size_t bytesWritten)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_write_all_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Request an asynchronous write of count bytes from buffer into
      the stream. When the operation is finished callback will be called.
      You can then call [gio.output_stream.OutputStream.writeFinish] to get the result of the
      operation.
      
      During an async request no other sync and async calls are allowed,
      and will result in [gio.types.IOErrorEnum.Pending] errors.
      
      A value of count larger than `G_MAXSSIZE` will cause a
      [gio.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes written will be passed to the
      callback. It is not an error if this is not the same as the
      requested size, as it can happen e.g. on a partial I/O error,
      but generally we try to write as many bytes as requested.
      
      You are guaranteed that this method will never fail with
      [gio.types.IOErrorEnum.WouldBlock] - if stream can't accept more data, the
      method will just wait until this changes.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is `G_PRIORITY_DEFAULT`.
      
      The asynchronous methods have a default fallback that uses threads
      to implement asynchronicity, so they are optional for inheriting
      classes. However, if you override one you must override all.
      
      For the synchronous, blocking version of this function, see
      [gio.output_stream.OutputStream.write].
      
      Note that no copy of buffer will be made, so it must stay valid
      until callback is called. See [gio.output_stream.OutputStream.writeBytesAsync]
      for a #GBytes version that will automatically hold a reference to
      the contents (without copying) for the duration of the call.
  
      Params:
        buffer = the buffer containing the data to write.
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  */
  void writeAsync(ubyte[] buffer, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(void*)buffer.ptr;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_write_async(cast(GOutputStream*)this._cPtr, _buffer, _count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      A wrapper function for [gio.output_stream.OutputStream.write] which takes a
      #GBytes as input.  This can be more convenient for use by language
      bindings or in other cases where the refcounted nature of #GBytes
      is helpful over a bare pointer interface.
      
      However, note that this function may still perform partial writes,
      just like [gio.output_stream.OutputStream.write].  If that occurs, to continue
      writing, you will need to create a new #GBytes containing just the
      remaining bytes, using [glib.bytes.Bytes.newFromBytes]. Passing the same
      #GBytes instance multiple times potentially can result in duplicated
      data in the output stream.
  
      Params:
        bytes = the #GBytes to write
        cancellable = optional cancellable object
      Returns: Number of bytes written, or -1 on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t writeBytes(glib.bytes.Bytes bytes, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_output_stream_write_bytes(cast(GOutputStream*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      This function is similar to [gio.output_stream.OutputStream.writeAsync], but
      takes a #GBytes as input.  Due to the refcounted nature of #GBytes,
      this allows the stream to avoid taking a copy of the data.
      
      However, note that this function may still perform partial writes,
      just like [gio.output_stream.OutputStream.writeAsync]. If that occurs, to continue
      writing, you will need to create a new #GBytes containing just the
      remaining bytes, using [glib.bytes.Bytes.newFromBytes]. Passing the same
      #GBytes instance multiple times potentially can result in duplicated
      data in the output stream.
      
      For the synchronous, blocking version of this function, see
      [gio.output_stream.OutputStream.writeBytes].
  
      Params:
        bytes = The bytes to write
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void writeBytesAsync(glib.bytes.Bytes bytes, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_write_bytes_async(cast(GOutputStream*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a stream write-from-#GBytes operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: a #gssize containing the number of bytes written to the stream.
      Throws: [ErrorWrap]
  */
  ptrdiff_t writeBytesFinish(gio.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_output_stream_write_bytes_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Finishes a stream write operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: a #gssize containing the number of bytes written to the stream.
      Throws: [ErrorWrap]
  */
  ptrdiff_t writeFinish(gio.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_output_stream_write_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Tries to write the bytes contained in the n_vectors vectors into the
      stream. Will block during the operation.
      
      If n_vectors is 0 or the sum of all bytes in vectors is 0, returns 0 and
      does nothing.
      
      On success, the number of bytes written to the stream is returned.
      It is not an error if this is not the same as the requested size, as it
      can happen e.g. on a partial I/O error, or if there is not enough
      storage in the stream. All writes block until at least one byte
      is written or an error occurs; 0 is never returned (unless
      n_vectors is 0 or the sum of all bytes in vectors is 0).
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      Some implementations of [gio.output_stream.OutputStream.writev] may have limitations on the
      aggregate buffer size, and will return [gio.types.IOErrorEnum.InvalidArgument] if these
      are exceeded. For example, when writing to a local file on UNIX platforms,
      the aggregate buffer size must not exceed `G_MAXSSIZE` bytes.
  
      Params:
        vectors = the buffer containing the #GOutputVectors to write.
        bytesWritten = location to store the number of bytes that were
              written to the stream
        cancellable = optional cancellable object
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool writev(gio.types.OutputVector[] vectors, out size_t bytesWritten, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(const(GOutputVector)*)vectors.ptr;
    GError *_err;
    _retval = cast(bool)g_output_stream_writev(cast(GOutputStream*)this._cPtr, _vectors, _nVectors, cast(size_t*)&bytesWritten, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Tries to write the bytes contained in the n_vectors vectors into the
      stream. Will block during the operation.
      
      This function is similar to [gio.output_stream.OutputStream.writev], except it tries to
      write as many bytes as requested, only stopping on an error.
      
      On a successful write of all n_vectors vectors, true is returned, and
      bytes_written is set to the sum of all the sizes of vectors.
      
      If there is an error during the operation false is returned and error
      is set to indicate the error status.
      
      As a special exception to the normal conventions for functions that
      use #GError, if this function returns false (and sets error) then
      bytes_written will be set to the number of bytes that were
      successfully written before the error was encountered.  This
      functionality is only available from C. If you need it from another
      language then you must write your own loop around
      [gio.output_stream.OutputStream.write].
      
      The content of the individual elements of vectors might be changed by this
      function.
  
      Params:
        vectors = the buffer containing the #GOutputVectors to write.
        bytesWritten = location to store the number of bytes that were
              written to the stream
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool writevAll(gio.types.OutputVector[] vectors, out size_t bytesWritten, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
    GError *_err;
    _retval = cast(bool)g_output_stream_writev_all(cast(GOutputStream*)this._cPtr, _vectors, _nVectors, cast(size_t*)&bytesWritten, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Request an asynchronous write of the bytes contained in the n_vectors vectors into
      the stream. When the operation is finished callback will be called.
      You can then call [gio.output_stream.OutputStream.writevAllFinish] to get the result of the
      operation.
      
      This is the asynchronous version of [gio.output_stream.OutputStream.writevAll].
      
      Call [gio.output_stream.OutputStream.writevAllFinish] to collect the result.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is `G_PRIORITY_DEFAULT`.
      
      Note that no copy of vectors will be made, so it must stay valid
      until callback is called. The content of the individual elements
      of vectors might be changed by this function.
  
      Params:
        vectors = the buffer containing the #GOutputVectors to write.
        ioPriority = the I/O priority of the request
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  */
  void writevAllAsync(gio.types.OutputVector[] vectors, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_writev_all_async(cast(GOutputStream*)this._cPtr, _vectors, _nVectors, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream write operation started with
      [gio.output_stream.OutputStream.writevAllAsync].
      
      As a special exception to the normal conventions for functions that
      use #GError, if this function returns false (and sets error) then
      bytes_written will be set to the number of bytes that were
      successfully written before the error was encountered.  This
      functionality is only available from C.  If you need it from another
      language then you must write your own loop around
      [gio.output_stream.OutputStream.writevAsync].
  
      Params:
        result = a #GAsyncResult
        bytesWritten = location to store the number of bytes that were written to the stream
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool writevAllFinish(gio.async_result.AsyncResult result, out size_t bytesWritten)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_writev_all_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Request an asynchronous write of the bytes contained in n_vectors vectors into
      the stream. When the operation is finished callback will be called.
      You can then call [gio.output_stream.OutputStream.writevFinish] to get the result of the
      operation.
      
      During an async request no other sync and async calls are allowed,
      and will result in [gio.types.IOErrorEnum.Pending] errors.
      
      On success, the number of bytes written will be passed to the
      callback. It is not an error if this is not the same as the
      requested size, as it can happen e.g. on a partial I/O error,
      but generally we try to write as many bytes as requested.
      
      You are guaranteed that this method will never fail with
      [gio.types.IOErrorEnum.WouldBlock] — if stream can't accept more data, the
      method will just wait until this changes.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is `G_PRIORITY_DEFAULT`.
      
      The asynchronous methods have a default fallback that uses threads
      to implement asynchronicity, so they are optional for inheriting
      classes. However, if you override one you must override all.
      
      For the synchronous, blocking version of this function, see
      [gio.output_stream.OutputStream.writev].
      
      Note that no copy of vectors will be made, so it must stay valid
      until callback is called.
  
      Params:
        vectors = the buffer containing the #GOutputVectors to write.
        ioPriority = the I/O priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  */
  void writevAsync(gio.types.OutputVector[] vectors, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(const(GOutputVector)*)vectors.ptr;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_writev_async(cast(GOutputStream*)this._cPtr, _vectors, _nVectors, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a stream writev operation.
  
      Params:
        result = a #GAsyncResult.
        bytesWritten = location to store the number of bytes that were written to the stream
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool writevFinish(gio.async_result.AsyncResult result, out size_t bytesWritten)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_writev_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
