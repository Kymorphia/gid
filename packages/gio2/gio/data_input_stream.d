/// Module for [DataInputStream] class
module gio.data_input_stream;

import gid.gid;
import gio.async_result;
import gio.buffered_input_stream;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.input_stream;
import gio.seekable;
import gio.seekable_mixin;
import gio.types;
import glib.error;
import gobject.object;

/**
    Data input stream implements [gio.input_stream.InputStream] and includes functions
    for reading structured data directly from a binary input stream.
*/
class DataInputStream : gio.buffered_input_stream.BufferedInputStream
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
    return cast(void function())g_data_input_stream_get_type != &gidSymbolNotFound ? g_data_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataInputStream self()
  {
    return this;
  }

  /**
      Get `byteOrder` property.
      Returns: The :byte-order property determines the byte ordering that
        is used when reading multi-byte entities (such as integers)
        from the stream.
  */
  @property gio.types.DataStreamByteOrder byteOrder()
  {
    return getByteOrder();
  }

  /**
      Set `byteOrder` property.
      Params:
        propval = The :byte-order property determines the byte ordering that
          is used when reading multi-byte entities (such as integers)
          from the stream.
  */
  @property void byteOrder(gio.types.DataStreamByteOrder propval)
  {
    return setByteOrder(propval);
  }

  /**
      Get `newlineType` property.
      Returns: The :newline-type property determines what is considered
        as a line ending when reading complete lines from the stream.
  */
  @property gio.types.DataStreamNewlineType newlineType()
  {
    return getNewlineType();
  }

  /**
      Set `newlineType` property.
      Params:
        propval = The :newline-type property determines what is considered
          as a line ending when reading complete lines from the stream.
  */
  @property void newlineType(gio.types.DataStreamNewlineType propval)
  {
    return setNewlineType(propval);
  }

  /**
      Creates a new data input stream for the base_stream.
  
      Params:
        baseStream = a #GInputStream.
      Returns: a new #GDataInputStream.
  */
  this(gio.input_stream.InputStream baseStream)
  {
    GDataInputStream* _cretval;
    _cretval = g_data_input_stream_new(baseStream ? cast(GInputStream*)baseStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the byte order for the data input stream.
      Returns: the stream's current #GDataStreamByteOrder.
  */
  gio.types.DataStreamByteOrder getByteOrder()
  {
    GDataStreamByteOrder _cretval;
    _cretval = g_data_input_stream_get_byte_order(cast(GDataInputStream*)this._cPtr);
    gio.types.DataStreamByteOrder _retval = cast(gio.types.DataStreamByteOrder)_cretval;
    return _retval;
  }

  /**
      Gets the current newline type for the stream.
      Returns: #GDataStreamNewlineType for the given stream.
  */
  gio.types.DataStreamNewlineType getNewlineType()
  {
    GDataStreamNewlineType _cretval;
    _cretval = g_data_input_stream_get_newline_type(cast(GDataInputStream*)this._cPtr);
    gio.types.DataStreamNewlineType _retval = cast(gio.types.DataStreamNewlineType)_cretval;
    return _retval;
  }

  /**
      Reads an unsigned 8-bit/1-byte value from stream.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: an unsigned 8-bit/1-byte value read from the stream or `0`
        if an error occurred.
      Throws: [ErrorWrap]
  */
  ubyte readByteData(gio.cancellable.Cancellable cancellable = null)
  {
    ubyte _retval;
    GError *_err;
    _retval = g_data_input_stream_read_byte(cast(GDataInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Reads a 16-bit/2-byte value from stream.
      
      In order to get the correct byte order for this read operation,
      see [gio.data_input_stream.DataInputStream.getByteOrder] and [gio.data_input_stream.DataInputStream.setByteOrder].
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a signed 16-bit/2-byte value read from stream or `0` if
        an error occurred.
      Throws: [ErrorWrap]
  */
  short readInt16(gio.cancellable.Cancellable cancellable = null)
  {
    short _retval;
    GError *_err;
    _retval = g_data_input_stream_read_int16(cast(GDataInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Reads a signed 32-bit/4-byte value from stream.
      
      In order to get the correct byte order for this read operation,
      see [gio.data_input_stream.DataInputStream.getByteOrder] and [gio.data_input_stream.DataInputStream.setByteOrder].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a signed 32-bit/4-byte value read from the stream or `0` if
        an error occurred.
      Throws: [ErrorWrap]
  */
  int readInt32(gio.cancellable.Cancellable cancellable = null)
  {
    int _retval;
    GError *_err;
    _retval = g_data_input_stream_read_int32(cast(GDataInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Reads a 64-bit/8-byte value from stream.
      
      In order to get the correct byte order for this read operation,
      see [gio.data_input_stream.DataInputStream.getByteOrder] and [gio.data_input_stream.DataInputStream.setByteOrder].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a signed 64-bit/8-byte value read from stream or `0` if
        an error occurred.
      Throws: [ErrorWrap]
  */
  long readInt64(gio.cancellable.Cancellable cancellable = null)
  {
    long _retval;
    GError *_err;
    _retval = g_data_input_stream_read_int64(cast(GDataInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      The asynchronous version of [gio.data_input_stream.DataInputStream.readLine].  It is
      an error to have two outstanding calls to this function.
      
      When the operation is finished, callback will be called. You
      can then call [gio.data_input_stream.DataInputStream.readLineFinish] to get
      the result of the operation.
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = callback to call when the request is satisfied.
  */
  void readLineAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_data_input_stream_read_line_async(cast(GDataInputStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous call started by
      [gio.data_input_stream.DataInputStream.readLineAsync].
  
      Params:
        result = the #GAsyncResult that was provided to the callback.
        length = a #gsize to get the length of the data read in.
      Returns: a string with the line that
         was read in (without the newlines).  Set length to a #gsize to
         get the length of the read line.  On an error, it will return
         null and error will be set. For UTF-8 conversion errors, the set
         error domain is `G_CONVERT_ERROR`.  If there's no content to read,
         it will still return null, but error won't be set.
      Throws: [ErrorWrap]
  */
  string readLineFinishUtf8(gio.async_result.AsyncResult result, out size_t length)
  {
    char* _cretval;
    GError *_err;
    _cretval = g_data_input_stream_read_line_finish_utf8(cast(GDataInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Reads a UTF-8 encoded line from the data input stream.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        length = a #gsize to get the length of the data read in.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a NUL terminated UTF-8 string
         with the line that was read in (without the newlines).  Set
         length to a #gsize to get the length of the read line.  On an
         error, it will return null and error will be set.  For UTF-8
         conversion errors, the set error domain is `G_CONVERT_ERROR`.  If
         there's no content to read, it will still return null, but error
         won't be set.
      Throws: [ErrorWrap]
  */
  string readLineUtf8(out size_t length, gio.cancellable.Cancellable cancellable = null)
  {
    char* _cretval;
    GError *_err;
    _cretval = g_data_input_stream_read_line_utf8(cast(GDataInputStream*)this._cPtr, cast(size_t*)&length, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Reads an unsigned 16-bit/2-byte value from stream.
      
      In order to get the correct byte order for this read operation,
      see [gio.data_input_stream.DataInputStream.getByteOrder] and [gio.data_input_stream.DataInputStream.setByteOrder].
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: an unsigned 16-bit/2-byte value read from the stream or `0` if
        an error occurred.
      Throws: [ErrorWrap]
  */
  ushort readUint16(gio.cancellable.Cancellable cancellable = null)
  {
    ushort _retval;
    GError *_err;
    _retval = g_data_input_stream_read_uint16(cast(GDataInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Reads an unsigned 32-bit/4-byte value from stream.
      
      In order to get the correct byte order for this read operation,
      see [gio.data_input_stream.DataInputStream.getByteOrder] and [gio.data_input_stream.DataInputStream.setByteOrder].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: an unsigned 32-bit/4-byte value read from the stream or `0` if
        an error occurred.
      Throws: [ErrorWrap]
  */
  uint readUint32(gio.cancellable.Cancellable cancellable = null)
  {
    uint _retval;
    GError *_err;
    _retval = g_data_input_stream_read_uint32(cast(GDataInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Reads an unsigned 64-bit/8-byte value from stream.
      
      In order to get the correct byte order for this read operation,
      see [gio.data_input_stream.DataInputStream.getByteOrder].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: an unsigned 64-bit/8-byte read from stream or `0` if
        an error occurred.
      Throws: [ErrorWrap]
  */
  ulong readUint64(gio.cancellable.Cancellable cancellable = null)
  {
    ulong _retval;
    GError *_err;
    _retval = g_data_input_stream_read_uint64(cast(GDataInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Reads a string from the data input stream, up to the first
      occurrence of any of the stop characters.
      
      Note that, in contrast to [gio.data_input_stream.DataInputStream.readUntilAsync],
      this function consumes the stop character that it finds.
      
      Don't use this function in new code.  Its functionality is
      inconsistent with [gio.data_input_stream.DataInputStream.readUntilAsync].  Both
      functions will be marked as deprecated in a future release.  Use
      [gio.data_input_stream.DataInputStream.readUpto] instead, but note that that function
      does not consume the stop character.
  
      Params:
        stopChars = characters to terminate the read.
        length = a #gsize to get the length of the data read in.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a string with the data that was read
            before encountering any of the stop characters. Set length to
            a #gsize to get the length of the string. This function will
            return null on an error.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gio.data_input_stream.DataInputStream.readUpto] instead, which has more
            consistent behaviour regarding the stop character.
  */
  string readUntil(string stopChars, out size_t length, gio.cancellable.Cancellable cancellable = null)
  {
    char* _cretval;
    const(char)* _stopChars = stopChars.toCString(No.Alloc);
    GError *_err;
    _cretval = g_data_input_stream_read_until(cast(GDataInputStream*)this._cPtr, _stopChars, cast(size_t*)&length, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      The asynchronous version of [gio.data_input_stream.DataInputStream.readUntil].
      It is an error to have two outstanding calls to this function.
      
      Note that, in contrast to [gio.data_input_stream.DataInputStream.readUntil],
      this function does not consume the stop character that it finds.  You
      must read it for yourself.
      
      When the operation is finished, callback will be called. You
      can then call [gio.data_input_stream.DataInputStream.readUntilFinish] to get
      the result of the operation.
      
      Don't use this function in new code.  Its functionality is
      inconsistent with [gio.data_input_stream.DataInputStream.readUntil].  Both functions
      will be marked as deprecated in a future release.  Use
      [gio.data_input_stream.DataInputStream.readUptoAsync] instead.
  
      Params:
        stopChars = characters to terminate the read.
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = callback to call when the request is satisfied.
  
      Deprecated: Use [gio.data_input_stream.DataInputStream.readUptoAsync] instead, which
            has more consistent behaviour regarding the stop character.
  */
  void readUntilAsync(string stopChars, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _stopChars = stopChars.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_data_input_stream_read_until_async(cast(GDataInputStream*)this._cPtr, _stopChars, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous call started by
      [gio.data_input_stream.DataInputStream.readUntilAsync].
  
      Params:
        result = the #GAsyncResult that was provided to the callback.
        length = a #gsize to get the length of the data read in.
      Returns: a string with the data that was read
            before encountering any of the stop characters. Set length to
            a #gsize to get the length of the string. This function will
            return null on an error.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gio.data_input_stream.DataInputStream.readUptoFinish] instead, which
            has more consistent behaviour regarding the stop character.
  */
  string readUntilFinish(gio.async_result.AsyncResult result, out size_t length)
  {
    char* _cretval;
    GError *_err;
    _cretval = g_data_input_stream_read_until_finish(cast(GDataInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Reads a string from the data input stream, up to the first
      occurrence of any of the stop characters.
      
      In contrast to [gio.data_input_stream.DataInputStream.readUntil], this function
      does not consume the stop character. You have to use
      [gio.data_input_stream.DataInputStream.readByteData] to get it before calling
      [gio.data_input_stream.DataInputStream.readUpto] again.
      
      Note that stop_chars may contain '\0' if stop_chars_len is
      specified.
      
      The returned string will always be nul-terminated on success.
  
      Params:
        stopChars = characters to terminate the read
        stopCharsLen = length of stop_chars. May be -1 if stop_chars is
              nul-terminated
        length = a #gsize to get the length of the data read in
        cancellable = optional #GCancellable object, null to ignore
      Returns: a string with the data that was read
            before encountering any of the stop characters. Set length to
            a #gsize to get the length of the string. This function will
            return null on an error
      Throws: [ErrorWrap]
  */
  string readUpto(string stopChars, ptrdiff_t stopCharsLen, out size_t length, gio.cancellable.Cancellable cancellable = null)
  {
    char* _cretval;
    const(char)* _stopChars = stopChars.toCString(No.Alloc);
    GError *_err;
    _cretval = g_data_input_stream_read_upto(cast(GDataInputStream*)this._cPtr, _stopChars, stopCharsLen, cast(size_t*)&length, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      The asynchronous version of [gio.data_input_stream.DataInputStream.readUpto].
      It is an error to have two outstanding calls to this function.
      
      In contrast to [gio.data_input_stream.DataInputStream.readUntil], this function
      does not consume the stop character. You have to use
      [gio.data_input_stream.DataInputStream.readByteData] to get it before calling
      [gio.data_input_stream.DataInputStream.readUpto] again.
      
      Note that stop_chars may contain '\0' if stop_chars_len is
      specified.
      
      When the operation is finished, callback will be called. You
      can then call [gio.data_input_stream.DataInputStream.readUptoFinish] to get
      the result of the operation.
  
      Params:
        stopChars = characters to terminate the read
        stopCharsLen = length of stop_chars. May be -1 if stop_chars is
              nul-terminated
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object, null to ignore
        callback = callback to call when the request is satisfied
  */
  void readUptoAsync(string stopChars, ptrdiff_t stopCharsLen, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _stopChars = stopChars.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_data_input_stream_read_upto_async(cast(GDataInputStream*)this._cPtr, _stopChars, stopCharsLen, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous call started by
      [gio.data_input_stream.DataInputStream.readUptoAsync].
      
      Note that this function does not consume the stop character. You
      have to use [gio.data_input_stream.DataInputStream.readByteData] to get it before calling
      [gio.data_input_stream.DataInputStream.readUptoAsync] again.
      
      The returned string will always be nul-terminated on success.
  
      Params:
        result = the #GAsyncResult that was provided to the callback
        length = a #gsize to get the length of the data read in
      Returns: a string with the data that was read
            before encountering any of the stop characters. Set length to
            a #gsize to get the length of the string. This function will
            return null on an error.
      Throws: [ErrorWrap]
  */
  string readUptoFinish(gio.async_result.AsyncResult result, out size_t length)
  {
    char* _cretval;
    GError *_err;
    _cretval = g_data_input_stream_read_upto_finish(cast(GDataInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(size_t*)&length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      This function sets the byte order for the given stream. All subsequent
      reads from the stream will be read in the given order.
  
      Params:
        order = a #GDataStreamByteOrder to set.
  */
  void setByteOrder(gio.types.DataStreamByteOrder order)
  {
    g_data_input_stream_set_byte_order(cast(GDataInputStream*)this._cPtr, order);
  }

  /**
      Sets the newline type for the stream.
      
      Note that using G_DATA_STREAM_NEWLINE_TYPE_ANY is slightly unsafe. If a read
      chunk ends in "CR" we must read an additional byte to know if this is "CR" or
      "CR LF", and this might block if there is no more data available.
  
      Params:
        type = the type of new line return as #GDataStreamNewlineType.
  */
  void setNewlineType(gio.types.DataStreamNewlineType type)
  {
    g_data_input_stream_set_newline_type(cast(GDataInputStream*)this._cPtr, type);
  }
}
