/// Module for [IOStream] class
module gid.gio2.iostream;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.input_stream;
import gid.gio2.output_stream;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.iostream.IOStream] represents an object that has both read and write streams.
    Generally the two streams act as separate input and output streams,
    but they share some common resources and state. For instance, for
    seekable streams, both streams may use the same position.
    
    Examples of [gid.gio2.iostream.IOStream] objects are [gid.gio2.socket_connection.SocketConnection], which represents
    a two-way network connection; and [gid.gio2.file_iostream.FileIOStream], which represents a
    file handle opened in read-write mode.
    
    To do the actual reading and writing you need to get the substreams
    with [gid.gio2.iostream.IOStream.getInputStream] and
    [gid.gio2.iostream.IOStream.getOutputStream].
    
    The [gid.gio2.iostream.IOStream] object owns the input and the output streams, not the other
    way around, so keeping the substreams alive will not keep the [gid.gio2.iostream.IOStream]
    object alive. If the [gid.gio2.iostream.IOStream] object is freed it will be closed, thus
    closing the substreams, so even if the substreams stay alive they will
    always return [gid.gio2.types.IOErrorEnum.Closed] for all operations.
    
    To close a stream use [gid.gio2.iostream.IOStream.close] which will close the common
    stream object and also the individual substreams. You can also close
    the substreams themselves. In most cases this only marks the
    substream as closed, so further I/O on it fails but common state in the
    [gid.gio2.iostream.IOStream] may still be open. However, some streams may support
    ‘half-closed’ states where one direction of the stream is actually shut down.
    
    Operations on [gid.gio2.iostream.IOStream]s cannot be started while another operation on the
    [gid.gio2.iostream.IOStream] or its substreams is in progress. Specifically, an application can
    read from the [gid.gio2.input_stream.InputStream] and write to the
    [gid.gio2.output_stream.OutputStream] simultaneously (either in separate threads, or as
    asynchronous operations in the same thread), but an application cannot start
    any [gid.gio2.iostream.IOStream] operation while there is a [gid.gio2.iostream.IOStream], [gid.gio2.input_stream.InputStream] or
    [gid.gio2.output_stream.OutputStream] operation in progress, and an application can’t start any
    [gid.gio2.input_stream.InputStream] or [gid.gio2.output_stream.OutputStream] operation while there is a [gid.gio2.iostream.IOStream]
    operation in progress.
    
    This is a product of individual stream operations being associated with a
    given [gid.glib2.main_context.MainContext] (the thread-default context at the time the
    operation was started), rather than entire streams being associated with a
    single [gid.glib2.main_context.MainContext].
    
    GIO may run operations on [gid.gio2.iostream.IOStream]s from other (worker) threads, and this
    may be exposed to application code in the behaviour of wrapper streams, such
    as [gid.gio2.buffered_input_stream.BufferedInputStream] or [gid.gio2.tls_connection.TlsConnection]. With such
    wrapper APIs, application code may only run operations on the base (wrapped)
    stream when the wrapper stream is idle. Note that the semantics of such
    operations may not be well-defined due to the state the wrapper stream leaves
    the base stream in (though they are guaranteed not to crash).
*/
class IOStream : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_io_stream_get_type != &gidSymbolNotFound ? g_io_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GIOStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override IOStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.iostream.IOStream]
      Returns: New builder object
  */
  static IOStreamGidBuilder builder() nothrow
  {
    return new IOStreamGidBuilder;
  }

  /**
      Get `closed` property.
      Returns: Whether the stream is closed.
  */
  @property bool closed() nothrow
  {
    return isClosed();
  }

  /**
      Get `inputStream` property.
      Returns: The [gid.gio2.input_stream.InputStream] to read from.
  */
  @property gid.gio2.input_stream.InputStream inputStream() nothrow
  {
    return getInputStream();
  }

  /**
      Get `outputStream` property.
      Returns: The [gid.gio2.output_stream.OutputStream] to write to.
  */
  @property gid.gio2.output_stream.OutputStream outputStream() nothrow
  {
    return getOutputStream();
  }

  /**
      Finishes an asynchronous io stream splice operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: true on success, false otherwise.
      Throws: [ErrorWrap]
  */
  static bool spliceFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_io_stream_splice_finish(result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Clears the pending flag on stream.
  */
  void clearPending() nothrow
  {
    g_io_stream_clear_pending(cast(GIOStream*)this._cPtr);
  }

  /**
      Closes the stream, releasing resources related to it. This will also
      close the individual input and output streams, if they are not already
      closed.
      
      Once the stream is closed, all other operations will return
      [gid.gio2.types.IOErrorEnum.Closed]. Closing a stream multiple times will not
      return an error.
      
      Closing a stream will automatically flush any outstanding buffers
      in the stream.
      
      Streams will be automatically closed when the last reference
      is dropped, but you might want to call this function to make sure
      resources are released as early as possible.
      
      Some streams might keep the backing store of the stream (e.g. a file
      descriptor) open after the stream is closed. See the documentation for
      the individual stream for details.
      
      On failure the first error that happened will be reported, but the
      close operation will finish as much as possible. A stream that failed
      to close will still return [gid.gio2.types.IOErrorEnum.Closed] for all operations.
      Still, it is important to check and report the error to the user,
      otherwise there might be a loss of data as all data might not be written.
      
      If cancellable is not NULL, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      Cancelling a close will still leave the stream closed, but some streams
      can use a faster close that doesn't block to e.g. check errors.
      
      The default implementation of this method just calls close on the
      individual input/output streams.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
      Returns: true on success, false on failure
      Throws: [ErrorWrap]
  */
  bool close(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_io_stream_close(cast(GIOStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Requests an asynchronous close of the stream, releasing resources
      related to it. When the operation is finished callback will be
      called. You can then call [gid.gio2.iostream.IOStream.closeFinish] to get
      the result of the operation.
      
      For behaviour details see [gid.gio2.iostream.IOStream.close].
      
      The asynchronous methods have a default fallback that uses threads
      to implement asynchronicity, so they are optional for inheriting
      classes. However, if you override one you must override all.
  
      Params:
        ioPriority = the io priority of the request
        cancellable = optional cancellable object
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void closeAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    g_io_stream_close_async(cast(GIOStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Closes a stream.
  
      Params:
        result = a #GAsyncResult
      Returns: true if stream was successfully closed, false otherwise.
      Throws: [ErrorWrap]
  */
  bool closeFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_io_stream_close_finish(cast(GIOStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the input stream for this object. This is used
      for reading.
      Returns: a #GInputStream, owned by the #GIOStream.
        Do not free.
  */
  gid.gio2.input_stream.InputStream getInputStream() nothrow
  {
    GInputStream* _cretval;
    _cretval = g_io_stream_get_input_stream(cast(GIOStream*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the output stream for this object. This is used for
      writing.
      Returns: a #GOutputStream, owned by the #GIOStream.
        Do not free.
  */
  gid.gio2.output_stream.OutputStream getOutputStream() nothrow
  {
    GOutputStream* _cretval;
    _cretval = g_io_stream_get_output_stream(cast(GIOStream*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.output_stream.OutputStream)(cast(GOutputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if a stream has pending actions.
      Returns: true if stream has pending actions.
  */
  bool hasPending() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_io_stream_has_pending(cast(GIOStream*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a stream is closed.
      Returns: true if the stream is closed.
  */
  bool isClosed() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_io_stream_is_closed(cast(GIOStream*)this._cPtr);
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
    _retval = cast(bool)g_io_stream_set_pending(cast(GIOStream*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously splice the output stream of stream1 to the input stream of
      stream2, and splice the output stream of stream2 to the input stream of
      stream1.
      
      When the operation is finished callback will be called.
      You can then call [gid.gio2.iostream.IOStream.spliceFinish] to get the
      result of the operation.
  
      Params:
        stream2 = a #GIOStream.
        flags = a set of #GIOStreamSpliceFlags.
        ioPriority = the io priority of the request.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void spliceAsync(gid.gio2.iostream.IOStream stream2, gid.gio2.types.IOStreamSpliceFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    g_io_stream_splice_async(cast(GIOStream*)this._cPtr, stream2 ? cast(GIOStream*)stream2._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }
}

/// Fluent builder implementation template for [gid.gio2.iostream.IOStream]
class IOStreamGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.iostream.IOStream]
final class IOStreamGidBuilder : IOStreamGidBuilderImpl!IOStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IOStream build() nothrow
  {
    return new IOStream(cast(void*)createGObject(IOStream._getGType), Yes.Take);
  }
}
