/// Module for [OutputStream] class
module gid.gio2.output_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.input_stream;
import gid.gio2.types;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.output_stream.OutputStream] is a base class for implementing streaming output.
    
    It has functions to write to a stream ([gid.gio2.output_stream.OutputStream.write]),
    to close a stream ([gid.gio2.output_stream.OutputStream.close]) and to flush pending
    writes ([gid.gio2.output_stream.OutputStream.flush]).
    
    To copy the content of an input stream to an output stream without
    manually handling the reads and writes, use [gid.gio2.output_stream.OutputStream.splice].
    
    See the documentation for [gid.gio2.iostream.IOStream] for details of thread safety
    of streaming APIs.
    
    All of these functions have async variants too.
    
    All classes derived from [gid.gio2.output_stream.OutputStream] *should* implement synchronous
    writing, splicing, flushing and closing streams, but *may* implement
    asynchronous versions.
*/
class OutputStream : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_output_stream_get_type != &gidSymbolNotFound ? g_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GOutputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override OutputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.output_stream.OutputStream]
      Returns: New builder object
  */
  static OutputStreamGidBuilder builder() nothrow
  {
    return new OutputStreamGidBuilder;
  }

  /**
      Requests an asynchronous close of the stream, releasing resources
      related to it. When the operation is finished callback will be
      called. You can then call [gid.gio2.output_stream.OutputStream.closeFinish] to get
      the result of the operation.
      
      For behaviour details see [gid.gio2.output_stream.OutputStream.close].
      
      The asynchronous methods have a default fallback that uses threads
      to implement asynchronicity, so they are optional for inheriting
      classes. However, if you override one you must override all.
  
      Params:
        ioPriority = the io priority of the request.
        cancellable = optional cancellable object
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCloseAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncCloseAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
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
    _klass.closeAsync(cast(GOutputStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Closes an output stream.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if stream was successfully closed, false otherwise.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCloseFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncCloseFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.closeFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.closeFinish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  protected bool vfuncCloseFn(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.closeFn)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.closeFn(cast(GOutputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Forces a write of all user-space buffered data for the given
      stream. Will block during the operation. Closing the stream will
      implicitly cause a flush.
      
      This function is optional for inherited classes.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional cancellable object
      Returns: true on success, false on error
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlush` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFlush(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.flush)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.flush(cast(GOutputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Forces an asynchronous write of all user-space buffered data for
      the given stream.
      For behaviour details see [gid.gio2.output_stream.OutputStream.flush].
      
      When the operation is finished callback will be
      called. You can then call [gid.gio2.output_stream.OutputStream.flushFinish] to get the
      result of the operation.
  
      Params:
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlushAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncFlushAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.flushAsync)
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
    _klass.flushAsync(cast(GOutputStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes flushing an output stream.
  
      Params:
        result = a GAsyncResult.
      Returns: true if flush operation succeeded, false otherwise.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlushFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFlushFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.flushFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.flushFinish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSplice` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncSplice(gid.gio2.input_stream.InputStream source, gid.gio2.types.OutputStreamSpliceFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.splice)
      return typeof(return).init;

    ptrdiff_t _retval;
    GError *_err;
    _retval = _klass.splice(cast(GOutputStream*)this._cPtr, source ? cast(GInputStream*)source._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Splices a stream asynchronously.
      When the operation is finished callback will be called.
      You can then call [gid.gio2.output_stream.OutputStream.spliceFinish] to get the
      result of the operation.
      
      For the synchronous, blocking version of this function, see
      [gid.gio2.output_stream.OutputStream.splice].
  
      Params:
        source = a #GInputStream.
        flags = a set of #GOutputStreamSpliceFlags.
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSpliceAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncSpliceAsync(gid.gio2.input_stream.InputStream source, gid.gio2.types.OutputStreamSpliceFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.spliceAsync)
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
    _klass.spliceAsync(cast(GOutputStream*)this._cPtr, source ? cast(GInputStream*)source._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSpliceFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncSpliceFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.spliceFinish)
      return typeof(return).init;

    ptrdiff_t _retval;
    GError *_err;
    _retval = _klass.spliceFinish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous write of count bytes from buffer into
      the stream. When the operation is finished callback will be called.
      You can then call [gid.gio2.output_stream.OutputStream.writeFinish] to get the result of the
      operation.
      
      During an async request no other sync and async calls are allowed,
      and will result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      A value of count larger than `G_MAXSSIZE` will cause a
      [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes written will be passed to the
      callback. It is not an error if this is not the same as the
      requested size, as it can happen e.g. on a partial I/O error,
      but generally we try to write as many bytes as requested.
      
      You are guaranteed that this method will never fail with
      [gid.gio2.types.IOErrorEnum.WouldBlock] - if stream can't accept more data, the
      method will just wait until this changes.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is [gid.glib2.types.PRIORITY_DEFAULT].
      
      The asynchronous methods have a default fallback that uses threads
      to implement asynchronicity, so they are optional for inheriting
      classes. However, if you override one you must override all.
      
      For the synchronous, blocking version of this function, see
      [gid.gio2.output_stream.OutputStream.write].
      
      Note that no copy of buffer will be made, so it must stay valid
      until callback is called. See [gid.gio2.output_stream.OutputStream.writeBytesAsync]
      for a #GBytes version that will automatically hold a reference to
      the contents (without copying) for the duration of the call.
  
      Params:
        buffer = the buffer containing the data to write.
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWriteAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncWriteAsync(ubyte[] buffer, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.writeAsync)
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
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(ubyte*)buffer.ptr;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.writeAsync(cast(GOutputStream*)this._cPtr, _buffer, _count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a stream write operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: a #gssize containing the number of bytes written to the stream.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWriteFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncWriteFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.writeFinish)
      return typeof(return).init;

    ptrdiff_t _retval;
    GError *_err;
    _retval = _klass.writeFinish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Tries to write count bytes from buffer into the stream. Will block
      during the operation.
      
      If count is 0, returns 0 and does nothing. A value of count
      larger than `G_MAXSSIZE` will cause a [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes written to the stream is returned.
      It is not an error if this is not the same as the requested size, as it
      can happen e.g. on a partial I/O error, or if there is not enough
      storage in the stream. All writes block until at least one byte
      is written or an error occurs; 0 is never returned (unless
      count is 0).
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      On error -1 is returned and error is set accordingly.
  
      Params:
        buffer = the buffer containing the data to write.
        cancellable = optional cancellable object
      Returns: Number of bytes written, or -1 on error
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWriteFn` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncWriteFn(ubyte[] buffer = null, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.writeFn)
      return typeof(return).init;

    ptrdiff_t _retval;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(ubyte*)buffer.ptr;
    GError *_err;
    _retval = _klass.writeFn(cast(GOutputStream*)this._cPtr, _buffer, _count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous write of the bytes contained in n_vectors vectors into
      the stream. When the operation is finished callback will be called.
      You can then call [gid.gio2.output_stream.OutputStream.writevFinish] to get the result of the
      operation.
      
      During an async request no other sync and async calls are allowed,
      and will result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      On success, the number of bytes written will be passed to the
      callback. It is not an error if this is not the same as the
      requested size, as it can happen e.g. on a partial I/O error,
      but generally we try to write as many bytes as requested.
      
      You are guaranteed that this method will never fail with
      [gid.gio2.types.IOErrorEnum.WouldBlock] — if stream can't accept more data, the
      method will just wait until this changes.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is [gid.glib2.types.PRIORITY_DEFAULT].
      
      The asynchronous methods have a default fallback that uses threads
      to implement asynchronicity, so they are optional for inheriting
      classes. However, if you override one you must override all.
      
      For the synchronous, blocking version of this function, see
      [gid.gio2.output_stream.OutputStream.writev].
      
      Note that no copy of vectors will be made, so it must stay valid
      until callback is called.
  
      Params:
        vectors = the buffer containing the #GOutputVectors to write.
        ioPriority = the I/O priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWritevAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncWritevAsync(gid.gio2.types.OutputVector[] vectors, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.writevAsync)
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
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.writevAsync(cast(GOutputStream*)this._cPtr, _vectors, _nVectors, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a stream writev operation.
  
      Params:
        result = a #GAsyncResult.
        bytesWritten = location to store the number of bytes that were written to the stream
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWritevFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncWritevFinish(gid.gio2.async_result.AsyncResult result, out size_t bytesWritten)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.writevFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.writevFinish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      Some implementations of [gid.gio2.output_stream.OutputStream.writev] may have limitations on the
      aggregate buffer size, and will return [gid.gio2.types.IOErrorEnum.InvalidArgument] if these
      are exceeded. For example, when writing to a local file on UNIX platforms,
      the aggregate buffer size must not exceed `G_MAXSSIZE` bytes.
  
      Params:
        vectors = the buffer containing the #GOutputVectors to write.
        bytesWritten = location to store the number of bytes that were
              written to the stream
        cancellable = optional cancellable object
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWritevFn` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncWritevFn(gid.gio2.types.OutputVector[] vectors, out size_t bytesWritten, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GOutputStreamClass*)_vfuncClass;
    if (!_klass.writevFn)
      return typeof(return).init;

    bool _retval;
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
    GError *_err;
    _retval = cast(bool)_klass.writevFn(cast(GOutputStream*)this._cPtr, _vectors, _nVectors, cast(size_t*)&bytesWritten, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Clears the pending flag on stream.
  */
  void clearPending() nothrow
  {
    g_output_stream_clear_pending(cast(GOutputStream*)this._cPtr);
  }

  /**
      Closes the stream, releasing resources related to it.
      
      Once the stream is closed, all other operations will return [gid.gio2.types.IOErrorEnum.Closed].
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
      close will still return [gid.gio2.types.IOErrorEnum.Closed] for all operations. Still, it
      is important to check and report the error to the user, otherwise
      there might be a loss of data as all data might not be written.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      Cancelling a close will still leave the stream closed, but there some streams
      can use a faster close that doesn't block to e.g. check errors. On
      cancellation (as with any error) there is no guarantee that all written
      data will reach the target.
  
      Params:
        cancellable = optional cancellable object
      Returns: true on success, false on failure
      Throws: [ErrorWrap]
  */
  bool close(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_close(cast(GOutputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Requests an asynchronous close of the stream, releasing resources
      related to it. When the operation is finished callback will be
      called. You can then call [gid.gio2.output_stream.OutputStream.closeFinish] to get
      the result of the operation.
      
      For behaviour details see [gid.gio2.output_stream.OutputStream.close].
      
      The asynchronous methods have a default fallback that uses threads
      to implement asynchronicity, so they are optional for inheriting
      classes. However, if you override one you must override all.
  
      Params:
        ioPriority = the io priority of the request.
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
    g_output_stream_close_async(cast(GOutputStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Closes an output stream.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if stream was successfully closed, false otherwise.
      Throws: [ErrorWrap]
  */
  bool closeFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_close_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Forces a write of all user-space buffered data for the given
      stream. Will block during the operation. Closing the stream will
      implicitly cause a flush.
      
      This function is optional for inherited classes.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional cancellable object
      Returns: true on success, false on error
      Throws: [ErrorWrap]
  */
  bool flush(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_flush(cast(GOutputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Forces an asynchronous write of all user-space buffered data for
      the given stream.
      For behaviour details see [gid.gio2.output_stream.OutputStream.flush].
      
      When the operation is finished callback will be
      called. You can then call [gid.gio2.output_stream.OutputStream.flushFinish] to get the
      result of the operation.
  
      Params:
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void flushAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_output_stream_flush_async(cast(GOutputStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes flushing an output stream.
  
      Params:
        result = a GAsyncResult.
      Returns: true if flush operation succeeded, false otherwise.
      Throws: [ErrorWrap]
  */
  bool flushFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_flush_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Checks if an output stream has pending actions.
      Returns: true if stream has pending actions.
  */
  bool hasPending() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_output_stream_has_pending(cast(GOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Checks if an output stream has already been closed.
      Returns: true if stream is closed. false otherwise.
  */
  bool isClosed() nothrow
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
  bool isClosing() nothrow
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
      throw new ErrorWrap(_err, Yes.Take);
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
  ptrdiff_t splice(gid.gio2.input_stream.InputStream source, gid.gio2.types.OutputStreamSpliceFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_output_stream_splice(cast(GOutputStream*)this._cPtr, source ? cast(GInputStream*)source._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Splices a stream asynchronously.
      When the operation is finished callback will be called.
      You can then call [gid.gio2.output_stream.OutputStream.spliceFinish] to get the
      result of the operation.
      
      For the synchronous, blocking version of this function, see
      [gid.gio2.output_stream.OutputStream.splice].
  
      Params:
        source = a #GInputStream.
        flags = a set of #GOutputStreamSpliceFlags.
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void spliceAsync(gid.gio2.input_stream.InputStream source, gid.gio2.types.OutputStreamSpliceFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
  ptrdiff_t spliceFinish(gid.gio2.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_output_stream_splice_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Tries to write count bytes from buffer into the stream. Will block
      during the operation.
      
      If count is 0, returns 0 and does nothing. A value of count
      larger than `G_MAXSSIZE` will cause a [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes written to the stream is returned.
      It is not an error if this is not the same as the requested size, as it
      can happen e.g. on a partial I/O error, or if there is not enough
      storage in the stream. All writes block until at least one byte
      is written or an error occurs; 0 is never returned (unless
      count is 0).
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      On error -1 is returned and error is set accordingly.
  
      Params:
        buffer = the buffer containing the data to write.
        cancellable = optional cancellable object
      Returns: Number of bytes written, or -1 on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t write(ubyte[] buffer, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(ubyte*)buffer.ptr;
    GError *_err;
    _retval = g_output_stream_write(cast(GOutputStream*)this._cPtr, _buffer, _count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Tries to write count bytes from buffer into the stream. Will block
      during the operation.
      
      This function is similar to [gid.gio2.output_stream.OutputStream.write], except it tries to
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
      [gid.gio2.output_stream.OutputStream.write].
  
      Params:
        buffer = the buffer containing the data to write.
        bytesWritten = location to store the number of bytes that was
              written to the stream
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool writeAll(ubyte[] buffer, out size_t bytesWritten, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(ubyte*)buffer.ptr;
    GError *_err;
    _retval = cast(bool)g_output_stream_write_all(cast(GOutputStream*)this._cPtr, _buffer, _count, cast(size_t*)&bytesWritten, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous write of count bytes from buffer into
      the stream. When the operation is finished callback will be called.
      You can then call [gid.gio2.output_stream.OutputStream.writeAllFinish] to get the result of the
      operation.
      
      This is the asynchronous version of [gid.gio2.output_stream.OutputStream.writeAll].
      
      Call [gid.gio2.output_stream.OutputStream.writeAllFinish] to collect the result.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is [gid.glib2.types.PRIORITY_DEFAULT].
      
      Note that no copy of buffer will be made, so it must stay valid
      until callback is called.
  
      Params:
        buffer = the buffer containing the data to write
        ioPriority = the io priority of the request
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  */
  void writeAllAsync(ubyte[] buffer, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(ubyte*)buffer.ptr;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_write_all_async(cast(GOutputStream*)this._cPtr, _buffer, _count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream write operation started with
      [gid.gio2.output_stream.OutputStream.writeAllAsync].
      
      As a special exception to the normal conventions for functions that
      use #GError, if this function returns false (and sets error) then
      bytes_written will be set to the number of bytes that were
      successfully written before the error was encountered.  This
      functionality is only available from C.  If you need it from another
      language then you must write your own loop around
      [gid.gio2.output_stream.OutputStream.writeAsync].
  
      Params:
        result = a #GAsyncResult
        bytesWritten = location to store the number of bytes that was written to the stream
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool writeAllFinish(gid.gio2.async_result.AsyncResult result, out size_t bytesWritten)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_write_all_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous write of count bytes from buffer into
      the stream. When the operation is finished callback will be called.
      You can then call [gid.gio2.output_stream.OutputStream.writeFinish] to get the result of the
      operation.
      
      During an async request no other sync and async calls are allowed,
      and will result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      A value of count larger than `G_MAXSSIZE` will cause a
      [gid.gio2.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes written will be passed to the
      callback. It is not an error if this is not the same as the
      requested size, as it can happen e.g. on a partial I/O error,
      but generally we try to write as many bytes as requested.
      
      You are guaranteed that this method will never fail with
      [gid.gio2.types.IOErrorEnum.WouldBlock] - if stream can't accept more data, the
      method will just wait until this changes.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is [gid.glib2.types.PRIORITY_DEFAULT].
      
      The asynchronous methods have a default fallback that uses threads
      to implement asynchronicity, so they are optional for inheriting
      classes. However, if you override one you must override all.
      
      For the synchronous, blocking version of this function, see
      [gid.gio2.output_stream.OutputStream.write].
      
      Note that no copy of buffer will be made, so it must stay valid
      until callback is called. See [gid.gio2.output_stream.OutputStream.writeBytesAsync]
      for a #GBytes version that will automatically hold a reference to
      the contents (without copying) for the duration of the call.
  
      Params:
        buffer = the buffer containing the data to write.
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  */
  void writeAsync(ubyte[] buffer, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(ubyte*)buffer.ptr;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_write_async(cast(GOutputStream*)this._cPtr, _buffer, _count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      A wrapper function for [gid.gio2.output_stream.OutputStream.write] which takes a
      #GBytes as input.  This can be more convenient for use by language
      bindings or in other cases where the refcounted nature of #GBytes
      is helpful over a bare pointer interface.
      
      However, note that this function may still perform partial writes,
      just like [gid.gio2.output_stream.OutputStream.write].  If that occurs, to continue
      writing, you will need to create a new #GBytes containing just the
      remaining bytes, using [gid.glib2.bytes.Bytes.newFromBytes]. Passing the same
      #GBytes instance multiple times potentially can result in duplicated
      data in the output stream.
  
      Params:
        bytes = the #GBytes to write
        cancellable = optional cancellable object
      Returns: Number of bytes written, or -1 on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t writeBytes(gid.glib2.bytes.Bytes bytes, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_output_stream_write_bytes(cast(GOutputStream*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      This function is similar to [gid.gio2.output_stream.OutputStream.writeAsync], but
      takes a #GBytes as input.  Due to the refcounted nature of #GBytes,
      this allows the stream to avoid taking a copy of the data.
      
      However, note that this function may still perform partial writes,
      just like [gid.gio2.output_stream.OutputStream.writeAsync]. If that occurs, to continue
      writing, you will need to create a new #GBytes containing just the
      remaining bytes, using [gid.glib2.bytes.Bytes.newFromBytes]. Passing the same
      #GBytes instance multiple times potentially can result in duplicated
      data in the output stream.
      
      For the synchronous, blocking version of this function, see
      [gid.gio2.output_stream.OutputStream.writeBytes].
  
      Params:
        bytes = The bytes to write
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void writeBytesAsync(gid.glib2.bytes.Bytes bytes, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_output_stream_write_bytes_async(cast(GOutputStream*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a stream write-from-#GBytes operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: a #gssize containing the number of bytes written to the stream.
      Throws: [ErrorWrap]
  */
  ptrdiff_t writeBytesFinish(gid.gio2.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_output_stream_write_bytes_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Finishes a stream write operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: a #gssize containing the number of bytes written to the stream.
      Throws: [ErrorWrap]
  */
  ptrdiff_t writeFinish(gid.gio2.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_output_stream_write_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      Some implementations of [gid.gio2.output_stream.OutputStream.writev] may have limitations on the
      aggregate buffer size, and will return [gid.gio2.types.IOErrorEnum.InvalidArgument] if these
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
  bool writev(gid.gio2.types.OutputVector[] vectors, out size_t bytesWritten, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
    GError *_err;
    _retval = cast(bool)g_output_stream_writev(cast(GOutputStream*)this._cPtr, _vectors, _nVectors, cast(size_t*)&bytesWritten, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Tries to write the bytes contained in the n_vectors vectors into the
      stream. Will block during the operation.
      
      This function is similar to [gid.gio2.output_stream.OutputStream.writev], except it tries to
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
      [gid.gio2.output_stream.OutputStream.write].
      
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
  bool writevAll(gid.gio2.types.OutputVector[] vectors, out size_t bytesWritten, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
    GError *_err;
    _retval = cast(bool)g_output_stream_writev_all(cast(GOutputStream*)this._cPtr, _vectors, _nVectors, cast(size_t*)&bytesWritten, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous write of the bytes contained in the n_vectors vectors into
      the stream. When the operation is finished callback will be called.
      You can then call [gid.gio2.output_stream.OutputStream.writevAllFinish] to get the result of the
      operation.
      
      This is the asynchronous version of [gid.gio2.output_stream.OutputStream.writevAll].
      
      Call [gid.gio2.output_stream.OutputStream.writevAllFinish] to collect the result.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is [gid.glib2.types.PRIORITY_DEFAULT].
      
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
  void writevAllAsync(gid.gio2.types.OutputVector[] vectors, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_output_stream_writev_all_async(cast(GOutputStream*)this._cPtr, _vectors, _nVectors, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous stream write operation started with
      [gid.gio2.output_stream.OutputStream.writevAllAsync].
      
      As a special exception to the normal conventions for functions that
      use #GError, if this function returns false (and sets error) then
      bytes_written will be set to the number of bytes that were
      successfully written before the error was encountered.  This
      functionality is only available from C.  If you need it from another
      language then you must write your own loop around
      [gid.gio2.output_stream.OutputStream.writevAsync].
  
      Params:
        result = a #GAsyncResult
        bytesWritten = location to store the number of bytes that were written to the stream
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool writevAllFinish(gid.gio2.async_result.AsyncResult result, out size_t bytesWritten)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_writev_all_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Request an asynchronous write of the bytes contained in n_vectors vectors into
      the stream. When the operation is finished callback will be called.
      You can then call [gid.gio2.output_stream.OutputStream.writevFinish] to get the result of the
      operation.
      
      During an async request no other sync and async calls are allowed,
      and will result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      On success, the number of bytes written will be passed to the
      callback. It is not an error if this is not the same as the
      requested size, as it can happen e.g. on a partial I/O error,
      but generally we try to write as many bytes as requested.
      
      You are guaranteed that this method will never fail with
      [gid.gio2.types.IOErrorEnum.WouldBlock] — if stream can't accept more data, the
      method will just wait until this changes.
      
      Any outstanding I/O request with higher priority (lower numerical
      value) will be executed before an outstanding request with lower
      priority. Default priority is [gid.glib2.types.PRIORITY_DEFAULT].
      
      The asynchronous methods have a default fallback that uses threads
      to implement asynchronicity, so they are optional for inheriting
      classes. However, if you override one you must override all.
      
      For the synchronous, blocking version of this function, see
      [gid.gio2.output_stream.OutputStream.writev].
      
      Note that no copy of vectors will be made, so it must stay valid
      until callback is called.
  
      Params:
        vectors = the buffer containing the #GOutputVectors to write.
        ioPriority = the I/O priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
              to call when the request is satisfied
  */
  void writevAsync(gid.gio2.types.OutputVector[] vectors, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
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
  bool writevFinish(gid.gio2.async_result.AsyncResult result, out size_t bytesWritten)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_output_stream_writev_finish(cast(GOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from OutputStream
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.output_stream.OutputStream), T.stringof ~ " is not derived from gid.gio2.output_stream.OutputStream");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseAsync", true)[0]) == gid.gio2.output_stream.OutputStream))
      static assert(0, "Overriding gid.gio2.output_stream.OutputStream.vfuncCloseAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseFinish", true)[0]) == gid.gio2.output_stream.OutputStream))
      _installVfunc(klass, "close_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseFn", true)[0]) == gid.gio2.output_stream.OutputStream))
      _installVfunc(klass, "close_fn");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlush", true)[0]) == gid.gio2.output_stream.OutputStream))
      _installVfunc(klass, "flush");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlushAsync", true)[0]) == gid.gio2.output_stream.OutputStream))
      static assert(0, "Overriding gid.gio2.output_stream.OutputStream.vfuncFlushAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlushFinish", true)[0]) == gid.gio2.output_stream.OutputStream))
      _installVfunc(klass, "flush_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSplice", true)[0]) == gid.gio2.output_stream.OutputStream))
      _installVfunc(klass, "splice");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSpliceAsync", true)[0]) == gid.gio2.output_stream.OutputStream))
      static assert(0, "Overriding gid.gio2.output_stream.OutputStream.vfuncSpliceAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSpliceFinish", true)[0]) == gid.gio2.output_stream.OutputStream))
      _installVfunc(klass, "splice_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWriteAsync", true)[0]) == gid.gio2.output_stream.OutputStream))
      static assert(0, "Overriding gid.gio2.output_stream.OutputStream.vfuncWriteAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWriteFinish", true)[0]) == gid.gio2.output_stream.OutputStream))
      _installVfunc(klass, "write_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWriteFn", true)[0]) == gid.gio2.output_stream.OutputStream))
      _installVfunc(klass, "write_fn");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWritevAsync", true)[0]) == gid.gio2.output_stream.OutputStream))
      static assert(0, "Overriding gid.gio2.output_stream.OutputStream.vfuncWritevAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWritevFinish", true)[0]) == gid.gio2.output_stream.OutputStream))
      _installVfunc(klass, "writev_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWritevFn", true)[0]) == gid.gio2.output_stream.OutputStream))
      _installVfunc(klass, "writev_fn");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GOutputStreamClass*)klass;

    switch (vfunc)
    {
      case "close_finish":
      {
        static extern(C) gboolean _vfuncCloseFinishTramp(GOutputStream* stream, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.output_stream.OutputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GOutputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
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
        static extern(C) gboolean _vfuncCloseFnTramp(GOutputStream* stream, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.output_stream.OutputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GOutputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
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
      case "flush":
      {
        static extern(C) gboolean _vfuncFlushTramp(GOutputStream* stream, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.output_stream.OutputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GOutputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.flush)
              return (cast(typeof(&_vfuncFlushTramp))_klass.flush)(stream, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncFlush(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.flush = cast(typeof(_klass.flush))&_vfuncFlushTramp;
        break;
      }
      case "flush_finish":
      {
        static extern(C) gboolean _vfuncFlushFinishTramp(GOutputStream* stream, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.output_stream.OutputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GOutputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.flushFinish)
              return (cast(typeof(&_vfuncFlushFinishTramp))_klass.flushFinish)(stream, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncFlushFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.flushFinish = cast(typeof(_klass.flushFinish))&_vfuncFlushFinishTramp;
        break;
      }
      case "splice":
      {
        static extern(C) ptrdiff_t _vfuncSpliceTramp(GOutputStream* stream, GInputStream* source, GOutputStreamSpliceFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.output_stream.OutputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GOutputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.splice)
              return (cast(typeof(&_vfuncSpliceTramp))_klass.splice)(stream, source, flags, cancellable, _err);
            return typeof(return).init;
          }

          ptrdiff_t _retval;

          try
          {
            _retval = _obj.vfuncSplice(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(void*)source, No.Take), flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.splice = cast(typeof(_klass.splice))&_vfuncSpliceTramp;
        break;
      }
      case "splice_finish":
      {
        static extern(C) ptrdiff_t _vfuncSpliceFinishTramp(GOutputStream* stream, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.output_stream.OutputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GOutputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.spliceFinish)
              return (cast(typeof(&_vfuncSpliceFinishTramp))_klass.spliceFinish)(stream, result, _err);
            return typeof(return).init;
          }

          ptrdiff_t _retval;

          try
          {
            _retval = _obj.vfuncSpliceFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.spliceFinish = cast(typeof(_klass.spliceFinish))&_vfuncSpliceFinishTramp;
        break;
      }
      case "write_finish":
      {
        static extern(C) ptrdiff_t _vfuncWriteFinishTramp(GOutputStream* stream, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.output_stream.OutputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GOutputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.writeFinish)
              return (cast(typeof(&_vfuncWriteFinishTramp))_klass.writeFinish)(stream, result, _err);
            return typeof(return).init;
          }

          ptrdiff_t _retval;

          try
          {
            _retval = _obj.vfuncWriteFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.writeFinish = cast(typeof(_klass.writeFinish))&_vfuncWriteFinishTramp;
        break;
      }
      case "write_fn":
      {
        static extern(C) ptrdiff_t _vfuncWriteFnTramp(GOutputStream* stream, void* buffer, size_t count, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.output_stream.OutputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GOutputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.writeFn)
              return (cast(typeof(&_vfuncWriteFnTramp))_klass.writeFn)(stream, buffer, count, cancellable, _err);
            return typeof(return).init;
          }

          ptrdiff_t _retval;
          ubyte[] _buffer;
          _buffer.length = count;
          _buffer[0 .. count] = (cast(const(ubyte)*)buffer)[0 .. count];

          try
          {
            _retval = _obj.vfuncWriteFn(_buffer, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.writeFn = cast(typeof(_klass.writeFn))&_vfuncWriteFnTramp;
        break;
      }
      case "writev_finish":
      {
        static extern(C) gboolean _vfuncWritevFinishTramp(GOutputStream* stream, GAsyncResult* result, size_t* bytesWritten, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.output_stream.OutputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GOutputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.writevFinish)
              return (cast(typeof(&_vfuncWritevFinishTramp))_klass.writevFinish)(stream, result, bytesWritten, _err);
            return typeof(return).init;
          }

          typeof(*bytesWritten) _bytesWrittenNull;
          if (!bytesWritten)
            bytesWritten = &_bytesWrittenNull;

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncWritevFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take), *bytesWritten);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.writevFinish = cast(typeof(_klass.writevFinish))&_vfuncWritevFinishTramp;
        break;
      }
      case "writev_fn":
      {
        static extern(C) gboolean _vfuncWritevFnTramp(GOutputStream* stream, const(GOutputVector)* vectors, size_t nVectors, size_t* bytesWritten, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.output_stream.OutputStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GOutputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.writevFn)
              return (cast(typeof(&_vfuncWritevFnTramp))_klass.writevFn)(stream, vectors, nVectors, bytesWritten, cancellable, _err);
            return typeof(return).init;
          }

          typeof(*bytesWritten) _bytesWrittenNull;
          if (!bytesWritten)
            bytesWritten = &_bytesWrittenNull;

          bool _dretval;
          gid.gio2.types.OutputVector[] _vectors;
          _vectors.length = nVectors;
          _vectors[0 .. nVectors] = vectors[0 .. nVectors];

          try
          {
            _dretval = _obj.vfuncWritevFn(_vectors, *bytesWritten, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.writevFn = cast(typeof(_klass.writevFn))&_vfuncWritevFnTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.output_stream.OutputStream]
class OutputStreamGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.output_stream.OutputStream]
final class OutputStreamGidBuilder : OutputStreamGidBuilderImpl!OutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  OutputStream build() nothrow
  {
    return new OutputStream(cast(void*)createGObject(OutputStream._getGType), Yes.Take);
  }
}
