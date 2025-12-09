/// Module for [BufferedInputStream] class
module gio.buffered_input_stream;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.filter_input_stream;
import gio.input_stream;
import gio.seekable;
import gio.seekable_mixin;
import gio.types;
import glib.error;
import gobject.object;

/**
    Buffered input stream implements #GFilterInputStream and provides
    for buffered reads.
    
    By default, [gio.buffered_input_stream.BufferedInputStream]'s buffer size is set at 4 kilobytes.
    
    To create a buffered input stream, use [gio.buffered_input_stream.BufferedInputStream.new_],
    or [gio.buffered_input_stream.BufferedInputStream.newSized] to specify the buffer's size at
    construction.
    
    To get the size of a buffer within a buffered input stream, use
    [gio.buffered_input_stream.BufferedInputStream.getBufferSize]. To change the size of a
    buffered input stream's buffer, use [gio.buffered_input_stream.BufferedInputStream.setBufferSize].
    Note that the buffer's size cannot be reduced below the size of the data within the buffer.
*/
class BufferedInputStream : gio.filter_input_stream.FilterInputStream, gio.seekable.Seekable
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
    return cast(void function())g_buffered_input_stream_get_type != &gidSymbolNotFound ? g_buffered_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BufferedInputStream self()
  {
    return this;
  }

  /**
      Get `bufferSize` property.
      Returns: The size of the backend buffer, in bytes.
  */
  @property uint bufferSize()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("buffer-size");
  }

  /**
      Set `bufferSize` property.
      Params:
        propval = The size of the backend buffer, in bytes.
  */
  @property void bufferSize(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("buffer-size", propval);
  }

  mixin SeekableT!();

  /**
      Creates a new #GInputStream from the given base_stream, with
      a buffer set to the default size (4 kilobytes).
  
      Params:
        baseStream = a #GInputStream
      Returns: a #GInputStream for the given base_stream.
  */
  this(gio.input_stream.InputStream baseStream)
  {
    GInputStream* _cretval;
    _cretval = g_buffered_input_stream_new(baseStream ? cast(GInputStream*)baseStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GBufferedInputStream from the given base_stream,
      with a buffer set to size.
  
      Params:
        baseStream = a #GInputStream
        size = a #gsize
      Returns: a #GInputStream.
  */
  static gio.buffered_input_stream.BufferedInputStream newSized(gio.input_stream.InputStream baseStream, size_t size)
  {
    GInputStream* _cretval;
    _cretval = g_buffered_input_stream_new_sized(baseStream ? cast(GInputStream*)baseStream._cPtr(No.Dup) : null, size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.buffered_input_stream.BufferedInputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tries to read count bytes from the stream into the buffer.
      Will block during this read.
      
      If count is zero, returns zero and does nothing. A value of count
      larger than `G_MAXSSIZE` will cause a [gio.types.IOErrorEnum.InvalidArgument] error.
      
      On success, the number of bytes read into the buffer is returned.
      It is not an error if this is not the same as the requested size, as it
      can happen e.g. near the end of a file. Zero is returned on end of file
      (or if count is zero),  but never otherwise.
      
      If count is -1 then the attempted read size is equal to the number of
      bytes that are required to fill the buffer.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      On error -1 is returned and error is set accordingly.
      
      For the asynchronous, non-blocking, version of this function, see
      [gio.buffered_input_stream.BufferedInputStream.fillAsync].
  
      Params:
        count = the number of bytes that will be read from the stream
        cancellable = optional #GCancellable object, null to ignore
      Returns: the number of bytes read into stream's buffer, up to count,
            or -1 on error.
      Throws: [ErrorWrap]
  */
  ptrdiff_t fill(ptrdiff_t count, gio.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_buffered_input_stream_fill(cast(GBufferedInputStream*)this._cPtr, count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Reads data into stream's buffer asynchronously, up to count size.
      io_priority can be used to prioritize reads. For the synchronous
      version of this function, see [gio.buffered_input_stream.BufferedInputStream.fill].
      
      If count is -1 then the attempted read size is equal to the number
      of bytes that are required to fill the buffer.
  
      Params:
        count = the number of bytes that will be read from the stream
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object
        callback = a #GAsyncReadyCallback
  */
  void fillAsync(ptrdiff_t count, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_buffered_input_stream_fill_async(cast(GBufferedInputStream*)this._cPtr, count, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous read.
  
      Params:
        result = a #GAsyncResult
      Returns: a #gssize of the read stream, or `-1` on an error.
      Throws: [ErrorWrap]
  */
  ptrdiff_t fillFinish(gio.async_result.AsyncResult result)
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_buffered_input_stream_fill_finish(cast(GBufferedInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the size of the available data within the stream.
      Returns: size of the available stream.
  */
  size_t getAvailable()
  {
    size_t _retval;
    _retval = g_buffered_input_stream_get_available(cast(GBufferedInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size of the input buffer.
      Returns: the current buffer size.
  */
  size_t getBufferSize()
  {
    size_t _retval;
    _retval = g_buffered_input_stream_get_buffer_size(cast(GBufferedInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Peeks in the buffer, copying data of size count into buffer,
      offset offset bytes.
  
      Params:
        buffer = a pointer to
            an allocated chunk of memory
        offset = a #gsize
      Returns: a #gsize of the number of bytes peeked, or -1 on error.
  */
  size_t peek(ubyte[] buffer, size_t offset)
  {
    size_t _retval;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(void*)buffer.ptr;
    _retval = g_buffered_input_stream_peek(cast(GBufferedInputStream*)this._cPtr, _buffer, offset, _count);
    return _retval;
  }

  /**
      Returns the buffer with the currently available bytes. The returned
      buffer must not be modified and will become invalid when reading from
      the stream or filling the buffer.
      Returns: read-only buffer
  */
  ubyte[] peekBuffer()
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
      -1 is returned but it's not an exceptional error and error is not set.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
      
      On error -1 is returned and error is set accordingly.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
      Returns: the byte read from the stream, or -1 on end of stream or error.
      Throws: [ErrorWrap]
  */
  int readByte(gio.cancellable.Cancellable cancellable = null)
  {
    int _retval;
    GError *_err;
    _retval = g_buffered_input_stream_read_byte(cast(GBufferedInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets the size of the internal buffer of stream to size, or to the
      size of the contents of the buffer. The buffer can never be resized
      smaller than its current contents.
  
      Params:
        size = a #gsize
  */
  void setBufferSize(size_t size)
  {
    g_buffered_input_stream_set_buffer_size(cast(GBufferedInputStream*)this._cPtr, size);
  }
}
