/// Module for [BufferedInputStream] class
module gid.gio2.buffered_input_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.filter_input_stream;
import gid.gio2.input_stream;
import gid.gio2.seekable;
import gid.gio2.seekable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Buffered input stream implements [gid.gio2.filter_input_stream.FilterInputStream] and provides
    for buffered reads.
    
    By default, [gid.gio2.buffered_input_stream.BufferedInputStream]'s buffer size is set at 4 kilobytes.
    
    To create a buffered input stream, use [gid.gio2.buffered_input_stream.BufferedInputStream.new_],
    or [gid.gio2.buffered_input_stream.BufferedInputStream.newSized] to specify the buffer's size at
    construction.
    
    To get the size of a buffer within a buffered input stream, use
    [gid.gio2.buffered_input_stream.BufferedInputStream.getBufferSize]. To change the size of a
    buffered input stream's buffer, use [gid.gio2.buffered_input_stream.BufferedInputStream.setBufferSize].
    Note that the buffer's size cannot be reduced below the size of the data within the buffer.
*/
class BufferedInputStream : gid.gio2.filter_input_stream.FilterInputStream, gid.gio2.seekable.Seekable
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
    return cast(void function())g_buffered_input_stream_get_type != &gidSymbolNotFound ? g_buffered_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GBufferedInputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override BufferedInputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.buffered_input_stream.BufferedInputStream]
      Returns: New builder object
  */
  static BufferedInputStreamGidBuilder builder() nothrow
  {
    return new BufferedInputStreamGidBuilder;
  }

  /**
      Get `bufferSize` property.
      Returns: The size of the backend buffer, in bytes.
  */
  @property uint bufferSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("buffer-size");
  }

  /**
      Set `bufferSize` property.
      Params:
        propval = The size of the backend buffer, in bytes.
  */
  @property void bufferSize(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("buffer-size", propval);
  }

  mixin SeekableT!();

  /**
      Creates a new [gid.gio2.input_stream.InputStream] from the given base_stream, with
      a buffer set to the default size (4 kilobytes).
  
      Params:
        baseStream = a [gid.gio2.input_stream.InputStream]
      Returns: a [gid.gio2.input_stream.InputStream] for the given base_stream.
  */
  this(gid.gio2.input_stream.InputStream baseStream) nothrow
  {
    GInputStream* _cretval;
    _cretval = g_buffered_input_stream_new(baseStream ? cast(GInputStream*)baseStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [gid.gio2.buffered_input_stream.BufferedInputStream] from the given base_stream,
      with a buffer set to size.
  
      Params:
        baseStream = a [gid.gio2.input_stream.InputStream]
        size = a #gsize
      Returns: a [gid.gio2.input_stream.InputStream].
  */
  static gid.gio2.buffered_input_stream.BufferedInputStream newSized(gid.gio2.input_stream.InputStream baseStream, size_t size) nothrow
  {
    GInputStream* _cretval;
    _cretval = g_buffered_input_stream_new_sized(baseStream ? cast(GInputStream*)baseStream._cPtr(No.Dup) : null, size);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.buffered_input_stream.BufferedInputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tries to read count bytes from the stream into the buffer.
      Will block during this read.
      
      If count is zero, returns zero and does nothing. A value of count
      larger than `G_MAXSSIZE` will cause a
      `errorGio.IOErrorEnum.INVALID_ARGUMENT` error.
      
      On success, the number of bytes read into the buffer is returned.
      It is not an error if this is not the same as the requested size, as it
      can happen e.g. near the end of a file. Zero is returned on end of file
      (or if count is zero),  but never otherwise.
      
      If count is -1 then the attempted read size is equal to the number of
      bytes that are required to fill the buffer.
      
      If cancellable is not `NULL`, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error `errorGio.IOErrorEnum.CANCELLED` will be returned.
      If an operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      On error `-1` is returned and error is set accordingly.
      
      For the asynchronous, non-blocking, version of this function, see
      [gid.gio2.buffered_input_stream.BufferedInputStream.fillAsync].
  
      Params:
        count = the number of bytes that will be read from the stream
        cancellable = optional [gid.gio2.cancellable.Cancellable] object, `NULL` to ignore
      Returns: the number of bytes read into stream's buffer, up to count,
            or `-1` on error.
      Throws: [ErrorWrap]
  */
  ptrdiff_t fill(ptrdiff_t count, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_buffered_input_stream_fill(cast(GBufferedInputStream*)this._cPtr, count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Reads data into stream's buffer asynchronously, up to count size.
      io_priority can be used to prioritize reads. For the synchronous
      version of this function, see [gid.gio2.buffered_input_stream.BufferedInputStream.fill].
      
      If count is `-1` then the attempted read size is equal to the number
      of bytes that are required to fill the buffer.
  
      Params:
        count = the number of bytes that will be read from the stream
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional [gid.gio2.cancellable.Cancellable] object
        callback = a [gid.gio2.types.AsyncReadyCallback]
  */
  void fillAsync(ptrdiff_t count, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_buffered_input_stream_fill_async(cast(GBufferedInputStream*)this._cPtr, count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous read.
  
      Params:
        result = a [gid.gio2.async_result.AsyncResult]
      Returns: a #gssize of the read stream, or `-1` on an error.
      Throws: [ErrorWrap]
  */
  ptrdiff_t fillFinish(gid.gio2.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_buffered_input_stream_fill_finish(cast(GBufferedInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the size of the available data within the stream.
      Returns: size of the available stream.
  */
  size_t getAvailable() nothrow
  {
    size_t _retval;
    _retval = g_buffered_input_stream_get_available(cast(GBufferedInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size of the input buffer.
      Returns: the current buffer size.
  */
  size_t getBufferSize() nothrow
  {
    size_t _retval;
    _retval = g_buffered_input_stream_get_buffer_size(cast(GBufferedInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Peeks in the buffered input, copying count bytes of data from offset bytes
      in the buffered input into buffer.
  
      Params:
        buffer = a pointer to
            an allocated chunk of memory, which must be at least count bytes long
        offset = offset into the buffered input to peek from, or zero to peek from
            the next byte in the buffered input onwards
      Returns: the number of bytes copied, which may be zero
  */
  size_t peek(ubyte[] buffer, size_t offset) nothrow
  {
    size_t _retval;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(ubyte*)buffer.ptr;
    _retval = g_buffered_input_stream_peek(cast(GBufferedInputStream*)this._cPtr, _buffer, offset, _count);
    return _retval;
  }

  /**
      Returns the buffer with the currently available bytes. The returned
      buffer must not be modified and will become invalid when reading from
      the stream or filling the buffer.
      Returns: read-only buffer
  */
  ubyte[] peekBuffer() nothrow
  {
    void* _cretval;
    size_t _cretlength;
    _cretval = g_buffered_input_stream_peek_buffer(cast(GBufferedInputStream*)this._cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Tries to read a single byte from the stream or the buffer. Will block
      during this read.
      
      On success, the byte read from the stream is returned. On end of stream
      `-1` is returned but it's not an exceptional error and error is not set.
      
      If cancellable is not `NULL`, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error `errorGio.IOErrorEnum.CANCELLED` will be returned.
      If an operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      On error `-1` is returned and error is set accordingly.
  
      Params:
        cancellable = optional [gid.gio2.cancellable.Cancellable] object, `NULL` to ignore
      Returns: the byte read from the stream, or `-1` on end of stream or error.
      Throws: [ErrorWrap]
  */
  int readByte(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    int _retval;
    GError *_err;
    _retval = g_buffered_input_stream_read_byte(cast(GBufferedInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the size of the internal buffer of stream to size, or to the
      size of the contents of the buffer. The buffer can never be resized
      smaller than its current contents.
  
      Params:
        size = a #gsize
  */
  void setBufferSize(size_t size) nothrow
  {
    g_buffered_input_stream_set_buffer_size(cast(GBufferedInputStream*)this._cPtr, size);
  }
}

/// Fluent builder implementation template for [gid.gio2.buffered_input_stream.BufferedInputStream]
class BufferedInputStreamGidBuilderImpl(T) : gid.gio2.filter_input_stream.FilterInputStreamGidBuilderImpl!T, gid.gio2.seekable.SeekableGidBuilderImpl!T
{

  mixin SeekableGidBuilderT!();

  /**
      Set `bufferSize` property.
      Params:
        propval = The size of the backend buffer, in bytes.
      Returns: Builder instance for fluent chaining
  */
  T bufferSize(uint propval) nothrow
  {
    return setProperty("buffer-size", propval);
  }
}

/// Fluent builder for [gid.gio2.buffered_input_stream.BufferedInputStream]
final class BufferedInputStreamGidBuilder : BufferedInputStreamGidBuilderImpl!BufferedInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BufferedInputStream build() nothrow
  {
    return new BufferedInputStream(cast(void*)createGObject(BufferedInputStream._getGType), Yes.Take);
  }
}
