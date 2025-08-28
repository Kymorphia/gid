/// Module for [Stream] class
module gmime.stream;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.types;
import gobject.object;

/**
    Abstract I/O stream class.
*/
class Stream : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_stream_get_type != &gidSymbolNotFound ? g_mime_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Stream self()
  {
    return this;
  }

  /**
      Reads in at most one less than max characters from stream and
      stores them into the buffer pointed to by buf. Reading stops after
      an EOS or newline ('\n'). If a newline is read, it is stored into
      the buffer. A '\0' is stored after the last character in the
      buffer.
  
      Params:
        buf = line buffer
      Returns: the number of characters read into buf on success or %-1
        on fail.
  */
  ptrdiff_t bufferGets(ubyte[] buf)
  {
    ptrdiff_t _retval;
    size_t _max;
    if (buf)
      _max = cast(size_t)buf.length;

    auto _buf = cast(ubyte*)buf.ptr;
    _retval = g_mime_stream_buffer_gets(cast(GMimeStream*)this._cPtr, _buf, _max);
    return _retval;
  }

  /**
      Reads a single line into buffer.
  
      Params:
        buffer = output buffer
  */
  void bufferReadln(ubyte[] buffer)
  {
    auto _buffer = gByteArrayFromD(buffer);
    scope(exit) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_buffer);
    g_mime_stream_buffer_readln(cast(GMimeStream*)this._cPtr, _buffer);
  }

  /**
      Closes the stream.
      Returns: `0` on success or %-1 on fail.
  */
  int close()
  {
    int _retval;
    _retval = g_mime_stream_close(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Initializes a new stream with bounds start and end.
  
      Params:
        start = start boundary
        end = end boundary
  */
  void construct(long start, long end)
  {
    g_mime_stream_construct(cast(GMimeStream*)this._cPtr, start, end);
  }

  /**
      Tests the end-of-stream indicator for stream.
      Returns: true on EOS or false otherwise.
  */
  bool eos()
  {
    bool _retval;
    _retval = g_mime_stream_eos(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Sync's the stream to disk.
      Returns: `0` on success or %-1 on fail.
  */
  int flush()
  {
    int _retval;
    _retval = g_mime_stream_flush(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length of the stream.
      Returns: the length of the stream or %-1 if unknown.
  */
  long length()
  {
    long _retval;
    _retval = g_mime_stream_length(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Attempts to read up to len bytes from stream into buf.
  
      Params:
        buf = buffer
      Returns: the number of bytes read or %-1 on fail.
  */
  ptrdiff_t read(ubyte[] buf)
  {
    ptrdiff_t _retval;
    size_t _len;
    if (buf)
      _len = cast(size_t)buf.length;

    auto _buf = cast(ubyte*)buf.ptr;
    _retval = g_mime_stream_read(cast(GMimeStream*)this._cPtr, _buf, _len);
    return _retval;
  }

  /**
      Resets the stream.
      Returns: `0` on success or %-1 on fail.
  */
  int reset()
  {
    int _retval;
    _retval = g_mime_stream_reset(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Repositions the offset of the stream stream to
      the argument offset according to the
      directive whence as follows:
      
          #GMIME_STREAM_SEEK_SET: Seek offset bytes relative to
          the beginning (bound_start) of the stream.
      
          #GMIME_STREAM_SEEK_CUR: Seek offset bytes relative to the
          current offset of the stream.
      
          #GMIME_STREAM_SEEK_END: Seek offset bytes relative to the
          end of the stream (bound_end if non-negative).
  
      Params:
        offset = positional offset
        whence = seek directive
      Returns: the resultant position on success or %-1 on fail.
  */
  long seek(long offset, gmime.types.SeekWhence whence)
  {
    long _retval;
    _retval = g_mime_stream_seek(cast(GMimeStream*)this._cPtr, offset, whence);
    return _retval;
  }

  /**
      Set the bounds on a stream.
  
      Params:
        start = start boundary
        end = end boundary
  */
  void setBounds(long start, long end)
  {
    g_mime_stream_set_bounds(cast(GMimeStream*)this._cPtr, start, end);
  }

  /**
      Creates a new substream of stream with bounds start and end.
  
      Params:
        start = start boundary
        end = end boundary
      Returns: a substream of stream with bounds start
        and end.
  */
  gmime.stream.Stream substream(long start, long end)
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_substream(cast(GMimeStream*)this._cPtr, start, end);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.stream.Stream)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the current offset within the stream.
      Returns: the current position within the stream or %-1 on fail.
  */
  long tell()
  {
    long _retval;
    _retval = g_mime_stream_tell(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Attempts to write up to len bytes of buf to stream.
  
      Params:
        buf = buffer
      Returns: the number of bytes written or %-1 on fail.
  */
  ptrdiff_t write(ubyte[] buf)
  {
    ptrdiff_t _retval;
    size_t _len;
    if (buf)
      _len = cast(size_t)buf.length;

    auto _buf = cast(const(ubyte)*)buf.ptr;
    _retval = g_mime_stream_write(cast(GMimeStream*)this._cPtr, _buf, _len);
    return _retval;
  }

  /**
      Writes string to stream.
  
      Params:
        str = string to write
      Returns: the number of bytes written or %-1 on fail.
  */
  ptrdiff_t writeString(string str)
  {
    ptrdiff_t _retval;
    const(char)* _str = str.toCString(No.Alloc);
    _retval = g_mime_stream_write_string(cast(GMimeStream*)this._cPtr, _str);
    return _retval;
  }

  /**
      Attempts to write the source stream to the destination stream.
  
      Params:
        dest = destination stream
      Returns: the number of bytes written or %-1 on fail.
  */
  long writeToStream(gmime.stream.Stream dest)
  {
    long _retval;
    _retval = g_mime_stream_write_to_stream(cast(GMimeStream*)this._cPtr, dest ? cast(GMimeStream*)dest._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Writes at most count blocks described by vector to stream.
  
      Params:
        vector = a #GMimeStreamIOVector
      Returns: the number of bytes written or %-1 on fail.
  */
  long writev(gmime.types.StreamIOVector[] vector)
  {
    long _retval;
    size_t _count;
    if (vector)
      _count = cast(size_t)vector.length;

    auto _vector = cast(GMimeStreamIOVector*)vector.ptr;
    _retval = g_mime_stream_writev(cast(GMimeStream*)this._cPtr, _vector, _count);
    return _retval;
  }
}
