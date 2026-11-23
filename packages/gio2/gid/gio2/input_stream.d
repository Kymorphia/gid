/// Module for [InputStream] class
module gid.gio2.input_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.input_stream.InputStream] is a base class for implementing streaming input.
    
    It has functions to read from a stream ([gid.gio2.input_stream.InputStream.read]),
    to close a stream ([gid.gio2.input_stream.InputStream.close]) and to skip some content
    ([gid.gio2.input_stream.InputStream.skip]).
    
    To copy the content of an input stream to an output stream without
    manually handling the reads and writes, use [gid.gio2.output_stream.OutputStream.splice].
    
    See the documentation for [gid.gio2.iostream.IOStream] for details of thread safety
    of streaming APIs.
    
    All of these functions have async variants too.
*/
class InputStream : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_input_stream_get_type != &gidSymbolNotFound ? g_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GInputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override InputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.input_stream.InputStream]
      Returns: New builder object
  */
  static InputStreamGidBuilder builder() nothrow
  {
    return new InputStreamGidBuilder;
  }

  /**
      Requests an asynchronous closes of the stream, releasing resources related to it.
      When the operation is finished callback will be called.
      You can then call [gid.gio2.input_stream.InputStream.closeFinish] to get the result of the
      operation.
      
      For behaviour details see [gid.gio2.input_stream.InputStream.close].
      
      The asynchronous methods have a default fallback that uses threads to implement
      asynchronicity, so they are optional for inheriting classes. However, if you
      override one you must override all.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional cancellable object
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCloseAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncCloseAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GInputStreamClass*)_vfuncClass;
    if (!_klass.closeAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.closeAsync(cast(GInputStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes closing a stream asynchronously, started from [gid.gio2.input_stream.InputStream.closeAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the stream was closed successfully.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCloseFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncCloseFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GInputStreamClass*)_vfuncClass;
    if (!_klass.closeFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.closeFinish(cast(GInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  protected bool vfuncCloseFn(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GInputStreamClass*)_vfuncClass;
    if (!_klass.closeFn)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.closeFn(cast(GInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous read of count bytes from the stream into the buffer
      starting at buffer. When the operation is finished callback will be called.
      You can then call [gid.gio2.input_stream.InputStream.readFinish] to get the result of the
      operation.
      
      During an async request no other sync and async calls are allowed on stream, and will
      result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      A value of count larger than `G_MAXSSIZE` will cause a [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes read into the buffer will be passed to the
      callback. It is not an error if this is not the same as the requested size, as it
      can happen e.g. near the end of a file, but generally we try to read
      as many bytes as requested. Zero is returned on end of file
      (or if count is zero),  but never otherwise.
      
      Any outstanding i/o request with higher priority (lower numerical value) will
      be executed before an outstanding request with lower priority. Default
      priority is [gid.glib2.types.PRIORITY_DEFAULT].
      
      The asynchronous methods have a default fallback that uses threads to implement
      asynchronicity, so they are optional for inheriting classes. However, if you
      override one you must override all.
  
      Params:
        buffer = a buffer to read data into (which should be at least count bytes long).
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority)
          of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReadAsync` to chain up from an override.
      Overriding it from D is not supported (caller allocated output array parameter 'buffer' in callback is not supported).
  */
  protected void vfuncReadAsync(ref ubyte[] buffer, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GInputStreamClass*)_vfuncClass;
    if (!_klass.readAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    size_t _count;
    _count = cast(size_t)buffer.length;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.readAsync(cast(GInputStream*)this._cPtr, buffer.ptr, _count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream read operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: number of bytes read in, or -1 on error, or 0 on end of file.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReadFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncReadFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GInputStreamClass*)_vfuncClass;
    if (!_klass.readFinish)
      return typeof(return).init;

    ptrdiff_t _retval;
    GError *_err;
    _retval = _klass.readFinish(cast(GInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  protected ptrdiff_t vfuncReadFn(void* buffer, size_t count, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GInputStreamClass*)_vfuncClass;
    if (!_klass.readFn)
      return typeof(return).init;

    ptrdiff_t _retval;
    GError *_err;
    _retval = _klass.readFn(cast(GInputStream*)this._cPtr, buffer, count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Tries to skip count bytes from the stream. Will block during the operation.
      
      This is identical to [gid.gio2.input_stream.InputStream.read], from a behaviour standpoint,
      but the bytes that are skipped are not returned to the user. Some
      streams have an implementation that is more efficient than reading the data.
      
      This function is optional for inherited classes, as the default implementation
      emulates it using read.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
  
      Params:
        count = the number of bytes that will be skipped from the stream
        cancellable = optional #GCancellable object, null to ignore.
      Returns: Number of bytes skipped, or -1 on error
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSkip` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncSkip(size_t count, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GInputStreamClass*)_vfuncClass;
    if (!_klass.skip)
      return typeof(return).init;

    ptrdiff_t _retval;
    GError *_err;
    _retval = _klass.skip(cast(GInputStream*)this._cPtr, count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous skip of count bytes from the stream.
      When the operation is finished callback will be called.
      You can then call [gid.gio2.input_stream.InputStream.skipFinish] to get the result
      of the operation.
      
      During an async request no other sync and async calls are allowed,
      and will result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      A value of count larger than `G_MAXSSIZE` will cause a [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes skipped will be passed to the callback.
      It is not an error if this is not the same as the requested size, as it
      can happen e.g. near the end of a file, but generally we try to skip
      as many bytes as requested. Zero is returned on end of file
      (or if count is zero), but never otherwise.
      
      Any outstanding i/o request with higher priority (lower numerical value)
      will be executed before an outstanding request with lower priority.
      Default priority is [gid.glib2.types.PRIORITY_DEFAULT].
      
      The asynchronous methods have a default fallback that uses threads to
      implement asynchronicity, so they are optional for inheriting classes.
      However, if you override one, you must override all.
  
      Params:
        count = the number of bytes that will be skipped from the stream
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSkipAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncSkipAsync(size_t count, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GInputStreamClass*)_vfuncClass;
    if (!_klass.skipAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.skipAsync(cast(GInputStream*)this._cPtr, count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a stream skip operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: the size of the bytes skipped, or `-1` on error.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSkipFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncSkipFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GInputStreamClass*)_vfuncClass;
    if (!_klass.skipFinish)
      return typeof(return).init;

    ptrdiff_t _retval;
    GError *_err;
    _retval = _klass.skipFinish(cast(GInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Clears the pending flag on stream.
  */
  void clearPending() nothrow
  {
    g_input_stream_clear_pending(cast(GInputStream*)this._cPtr);
  }

  /**
      Closes the stream, releasing resources related to it.
      
      Once the stream is closed, all other operations will return [gid.gio2.types.IOErrorEnum.Closed].
      Closing a stream multiple times will not return an error.
      
      Streams will be automatically closed when the last reference
      is dropped, but you might want to call this function to make sure
      resources are released as early as possible.
      
      Some streams might keep the backing store of the stream (e.g. a file descriptor)
      open after the stream is closed. See the documentation for the individual
      stream for details.
      
      On failure the first error that happened will be reported, but the close
      operation will finish as much as possible. A stream that failed to
      close will still return [gid.gio2.types.IOErrorEnum.Closed] for all operations. Still, it
      is important to check and report the error to the user.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      Cancelling a close will still leave the stream closed, but some streams
      can use a faster close that doesn't block to e.g. check errors.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true on success, false on failure
      Throws: [ErrorWrap]
  */
  bool close(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_input_stream_close(cast(GInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Requests an asynchronous closes of the stream, releasing resources related to it.
      When the operation is finished callback will be called.
      You can then call [gid.gio2.input_stream.InputStream.closeFinish] to get the result of the
      operation.
      
      For behaviour details see [gid.gio2.input_stream.InputStream.close].
      
      The asynchronous methods have a default fallback that uses threads to implement
      asynchronicity, so they are optional for inheriting classes. However, if you
      override one you must override all.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional cancellable object
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void closeAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_input_stream_close_async(cast(GInputStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes closing a stream asynchronously, started from [gid.gio2.input_stream.InputStream.closeAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the stream was closed successfully.
      Throws: [ErrorWrap]
  */
  bool closeFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_input_stream_close_finish(cast(GInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Checks if an input stream has pending actions.
      Returns: true if stream has pending actions.
  */
  bool hasPending() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_input_stream_has_pending(cast(GInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Checks if an input stream is closed.
      Returns: true if the stream is closed.
  */
  bool isClosed() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_input_stream_is_closed(cast(GInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Tries to read count bytes from the stream into the buffer starting at
      buffer. Will block during this read.
      
      If count is zero returns zero and does nothing. A value of count
      larger than `G_MAXSSIZE` will cause a [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes read into the buffer is returned.
      It is not an error if this is not the same as the requested size, as it
      can happen e.g. near the end of a file. Zero is returned on end of file
      (or if count is zero),  but never otherwise.
      
      The returned buffer is not a nul-terminated string, it can contain nul bytes
      at any position, and this function doesn't nul-terminate the buffer.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      On error -1 is returned and error is set accordingly.
  
      Params:
        buffer = a buffer to read data into (which should be at least count bytes long).
        cancellable = optional #GCancellable object, null to ignore.
      Returns: Number of bytes read, or -1 on error, or 0 on end of file.
      Throws: [ErrorWrap]
  */
  ptrdiff_t read(ref ubyte[] buffer, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    size_t _count;
    _count = cast(size_t)buffer.length;
    GError *_err;
    _retval = g_input_stream_read(cast(GInputStream*)this._cPtr, buffer.ptr, _count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Tries to read count bytes from the stream into the buffer starting at
      buffer. Will block during this read.
      
      This function is similar to [gid.gio2.input_stream.InputStream.read], except it tries to
      read as many bytes as requested, only stopping on an error or end of stream.
      
      On a successful read of count bytes, or if we reached the end of the
      stream,  true is returned, and bytes_read is set to the number of bytes
      read into buffer.
      
      If there is an error during the operation false is returned and error
      is set to indicate the error status.
      
      As a special exception to the normal conventions for functions that
      use #GError, if this function returns false (and sets error) then
      bytes_read will be set to the number of bytes that were successfully
      read before the error was encountered.  This functionality is only
      available from C.  If you need it from another language then you must
      write your own loop around [gid.gio2.input_stream.InputStream.read].
  
      Params:
        buffer = a buffer to read data into (which should be at least count bytes long).
        bytesRead = location to store the number of bytes that was read from the stream
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool readAll(ref ubyte[] buffer, out size_t bytesRead, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    size_t _count;
    _count = cast(size_t)buffer.length;
    GError *_err;
    _retval = cast(bool)g_input_stream_read_all(cast(GInputStream*)this._cPtr, buffer.ptr, _count, cast(size_t*)&bytesRead, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous read of count bytes from the stream into the
      buffer starting at buffer.
      
      This is the asynchronous equivalent of [gid.gio2.input_stream.InputStream.readAll].
      
      Call [gid.gio2.input_stream.InputStream.readAllFinish] to collect the result.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is [gid.glib2.types.PRIORITY_DEFAULT].
  
      Params:
        buffer = a buffer to read data into (which should be at least count bytes long)
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void readAllAsync(ref ubyte[] buffer, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    size_t _count;
    _count = cast(size_t)buffer.length;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_input_stream_read_all_async(cast(GInputStream*)this._cPtr, buffer.ptr, _count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream read operation started with
      [gid.gio2.input_stream.InputStream.readAllAsync].
      
      As a special exception to the normal conventions for functions that
      use #GError, if this function returns false (and sets error) then
      bytes_read will be set to the number of bytes that were successfully
      read before the error was encountered.  This functionality is only
      available from C.  If you need it from another language then you must
      write your own loop around [gid.gio2.input_stream.InputStream.readAsync].
  
      Params:
        result = a #GAsyncResult
        bytesRead = location to store the number of bytes that was read from the stream
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool readAllFinish(gid.gio2.async_result.AsyncResult result, out size_t bytesRead)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_input_stream_read_all_finish(cast(GInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&bytesRead, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous read of count bytes from the stream into the buffer
      starting at buffer. When the operation is finished callback will be called.
      You can then call [gid.gio2.input_stream.InputStream.readFinish] to get the result of the
      operation.
      
      During an async request no other sync and async calls are allowed on stream, and will
      result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      A value of count larger than `G_MAXSSIZE` will cause a [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes read into the buffer will be passed to the
      callback. It is not an error if this is not the same as the requested size, as it
      can happen e.g. near the end of a file, but generally we try to read
      as many bytes as requested. Zero is returned on end of file
      (or if count is zero),  but never otherwise.
      
      Any outstanding i/o request with higher priority (lower numerical value) will
      be executed before an outstanding request with lower priority. Default
      priority is [gid.glib2.types.PRIORITY_DEFAULT].
      
      The asynchronous methods have a default fallback that uses threads to implement
      asynchronicity, so they are optional for inheriting classes. However, if you
      override one you must override all.
  
      Params:
        buffer = a buffer to read data into (which should be at least count bytes long).
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority)
          of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void readAsync(ref ubyte[] buffer, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    size_t _count;
    _count = cast(size_t)buffer.length;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_input_stream_read_async(cast(GInputStream*)this._cPtr, buffer.ptr, _count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Like [gid.gio2.input_stream.InputStream.read], this tries to read count bytes from
      the stream in a blocking fashion. However, rather than reading into
      a user-supplied buffer, this will create a new #GBytes containing
      the data that was read. This may be easier to use from language
      bindings.
      
      If count is zero, returns a zero-length #GBytes and does nothing. A
      value of count larger than `G_MAXSSIZE` will cause a
      [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, a new #GBytes is returned. It is not an error if the
      size of this object is not the same as the requested size, as it
      can happen e.g. near the end of a file. A zero-length #GBytes is
      returned on end of file (or if count is zero), but never
      otherwise.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      On error null is returned and error is set accordingly.
  
      Params:
        count = maximum number of bytes that will be read from the stream. Common
          values include 4096 and 8192.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a new #GBytes, or null on error
      Throws: [ErrorWrap]
  */
  gid.glib2.bytes.Bytes readBytes(size_t count, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = g_input_stream_read_bytes(cast(GInputStream*)this._cPtr, count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Request an asynchronous read of count bytes from the stream into a
      new #GBytes. When the operation is finished callback will be
      called. You can then call [gid.gio2.input_stream.InputStream.readBytesFinish] to get the
      result of the operation.
      
      During an async request no other sync and async calls are allowed
      on stream, and will result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      A value of count larger than `G_MAXSSIZE` will cause a
      [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the new #GBytes will be passed to the callback. It is
      not an error if this is smaller than the requested size, as it can
      happen e.g. near the end of a file, but generally we try to read as
      many bytes as requested. Zero is returned on end of file (or if
      count is zero), but never otherwise.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is [gid.glib2.types.PRIORITY_DEFAULT].
  
      Params:
        count = the number of bytes that will be read from the stream
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void readBytesAsync(size_t count, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_input_stream_read_bytes_async(cast(GInputStream*)this._cPtr, count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream read-into-#GBytes operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: the newly-allocated #GBytes, or null on error
      Throws: [ErrorWrap]
  */
  gid.glib2.bytes.Bytes readBytesFinish(gid.gio2.async_result.AsyncResult result)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = g_input_stream_read_bytes_finish(cast(GInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Finishes an asynchronous stream read operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: number of bytes read in, or -1 on error, or 0 on end of file.
      Throws: [ErrorWrap]
  */
  ptrdiff_t readFinish(gid.gio2.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_input_stream_read_finish(cast(GInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
    _retval = cast(bool)g_input_stream_set_pending(cast(GInputStream*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Tries to skip count bytes from the stream. Will block during the operation.
      
      This is identical to [gid.gio2.input_stream.InputStream.read], from a behaviour standpoint,
      but the bytes that are skipped are not returned to the user. Some
      streams have an implementation that is more efficient than reading the data.
      
      This function is optional for inherited classes, as the default implementation
      emulates it using read.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
  
      Params:
        count = the number of bytes that will be skipped from the stream
        cancellable = optional #GCancellable object, null to ignore.
      Returns: Number of bytes skipped, or -1 on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t skip(size_t count, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_input_stream_skip(cast(GInputStream*)this._cPtr, count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous skip of count bytes from the stream.
      When the operation is finished callback will be called.
      You can then call [gid.gio2.input_stream.InputStream.skipFinish] to get the result
      of the operation.
      
      During an async request no other sync and async calls are allowed,
      and will result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      A value of count larger than `G_MAXSSIZE` will cause a [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes skipped will be passed to the callback.
      It is not an error if this is not the same as the requested size, as it
      can happen e.g. near the end of a file, but generally we try to skip
      as many bytes as requested. Zero is returned on end of file
      (or if count is zero), but never otherwise.
      
      Any outstanding i/o request with higher priority (lower numerical value)
      will be executed before an outstanding request with lower priority.
      Default priority is [gid.glib2.types.PRIORITY_DEFAULT].
      
      The asynchronous methods have a default fallback that uses threads to
      implement asynchronicity, so they are optional for inheriting classes.
      However, if you override one, you must override all.
  
      Params:
        count = the number of bytes that will be skipped from the stream
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void skipAsync(size_t count, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_input_stream_skip_async(cast(GInputStream*)this._cPtr, count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a stream skip operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: the size of the bytes skipped, or `-1` on error.
      Throws: [ErrorWrap]
  */
  ptrdiff_t skipFinish(gid.gio2.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_input_stream_skip_finish(cast(GInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from InputStream
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.input_stream.InputStream), T.stringof ~ " is not derived from gid.gio2.input_stream.InputStream");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseAsync", true)[0]) == gid.gio2.input_stream.InputStream))
      static assert(0, "Overriding gid.gio2.input_stream.InputStream.vfuncCloseAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseFinish", true)[0]) == gid.gio2.input_stream.InputStream))
      _installVfunc(klass, "close_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseFn", true)[0]) == gid.gio2.input_stream.InputStream))
      _installVfunc(klass, "close_fn");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReadAsync", true)[0]) == gid.gio2.input_stream.InputStream))
      static assert(0, "Overriding gid.gio2.input_stream.InputStream.vfuncReadAsync is not supported: caller allocated output array parameter 'buffer' in callback is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReadFinish", true)[0]) == gid.gio2.input_stream.InputStream))
      _installVfunc(klass, "read_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReadFn", true)[0]) == gid.gio2.input_stream.InputStream))
      _installVfunc(klass, "read_fn");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSkip", true)[0]) == gid.gio2.input_stream.InputStream))
      _installVfunc(klass, "skip");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSkipAsync", true)[0]) == gid.gio2.input_stream.InputStream))
      static assert(0, "Overriding gid.gio2.input_stream.InputStream.vfuncSkipAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSkipFinish", true)[0]) == gid.gio2.input_stream.InputStream))
      _installVfunc(klass, "skip_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GInputStreamClass*)klass;

    switch (vfunc)
    {
      case "close_finish":
      {
        static extern(C) gboolean _vfuncCloseFinishTramp(GInputStream* stream, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.input_stream.InputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.closeFinish)
              return (cast(typeof(&_vfuncCloseFinishTramp))_klass.closeFinish)(stream, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCloseFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.closeFinish = cast(typeof(_klass.closeFinish))&_vfuncCloseFinishTramp;
        break;
      }
      case "close_fn":
      {
        static extern(C) gboolean _vfuncCloseFnTramp(GInputStream* stream, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.input_stream.InputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.closeFn)
              return (cast(typeof(&_vfuncCloseFnTramp))_klass.closeFn)(stream, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCloseFn(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.closeFn = cast(typeof(_klass.closeFn))&_vfuncCloseFnTramp;
        break;
      }
      case "read_finish":
      {
        static extern(C) ptrdiff_t _vfuncReadFinishTramp(GInputStream* stream, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.input_stream.InputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.readFinish)
              return (cast(typeof(&_vfuncReadFinishTramp))_klass.readFinish)(stream, result, _err);
            return typeof(return).init;
          }

          ptrdiff_t _retval;

          try
          {
            _retval = _obj.vfuncReadFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.readFinish = cast(typeof(_klass.readFinish))&_vfuncReadFinishTramp;
        break;
      }
      case "read_fn":
      {
        static extern(C) ptrdiff_t _vfuncReadFnTramp(GInputStream* stream, void* buffer, size_t count, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.input_stream.InputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.readFn)
              return (cast(typeof(&_vfuncReadFnTramp))_klass.readFn)(stream, buffer, count, cancellable, _err);
            return typeof(return).init;
          }

          ptrdiff_t _retval;

          try
          {
            _retval = _obj.vfuncReadFn(buffer, count, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.readFn = cast(typeof(_klass.readFn))&_vfuncReadFnTramp;
        break;
      }
      case "skip":
      {
        static extern(C) ptrdiff_t _vfuncSkipTramp(GInputStream* stream, size_t count, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.input_stream.InputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.skip)
              return (cast(typeof(&_vfuncSkipTramp))_klass.skip)(stream, count, cancellable, _err);
            return typeof(return).init;
          }

          ptrdiff_t _retval;

          try
          {
            _retval = _obj.vfuncSkip(count, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.skip = cast(typeof(_klass.skip))&_vfuncSkipTramp;
        break;
      }
      case "skip_finish":
      {
        static extern(C) ptrdiff_t _vfuncSkipFinishTramp(GInputStream* stream, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.input_stream.InputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.skipFinish)
              return (cast(typeof(&_vfuncSkipFinishTramp))_klass.skipFinish)(stream, result, _err);
            return typeof(return).init;
          }

          ptrdiff_t _retval;

          try
          {
            _retval = _obj.vfuncSkipFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.skipFinish = cast(typeof(_klass.skipFinish))&_vfuncSkipFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.input_stream.InputStream]
class InputStreamGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.input_stream.InputStream]
final class InputStreamGidBuilder : InputStreamGidBuilderImpl!InputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InputStream build() nothrow
  {
    return new InputStream(cast(void*)createGObject(InputStream._getGType), Yes.Take);
  }
}
