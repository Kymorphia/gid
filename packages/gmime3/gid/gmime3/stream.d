/// Module for [Stream] class
module gid.gmime3.stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Abstract I/O stream class.
*/
@gidGir("Stream", "StreamClass")
class Stream : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_stream_get_type != &gidSymbolNotFound ? g_mime_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override Stream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.stream.Stream]
      Returns: New builder object
  */
  static StreamGidBuilder builder() nothrow
  {
    return new StreamGidBuilder;
  }

  /**
      Closes the stream.
      Returns: `0` on success or %-1 on fail.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClose` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncClose()
  {
    auto _klass = cast(GMimeStreamClass*)_vfuncClass;
    if (!_klass.close)
      return typeof(return).init;

    int _retval;
    _retval = _klass.close(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Tests the end-of-stream indicator for stream.
      Returns: true on EOS or false otherwise.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEos` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncEos()
  {
    auto _klass = cast(GMimeStreamClass*)_vfuncClass;
    if (!_klass.eos)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.eos(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Sync's the stream to disk.
      Returns: `0` on success or %-1 on fail.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlush` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncFlush()
  {
    auto _klass = cast(GMimeStreamClass*)_vfuncClass;
    if (!_klass.flush)
      return typeof(return).init;

    int _retval;
    _retval = _klass.flush(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length of the stream.
      Returns: the length of the stream or %-1 if unknown.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLength` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected long vfuncLength()
  {
    auto _klass = cast(GMimeStreamClass*)_vfuncClass;
    if (!_klass.length)
      return typeof(return).init;

    long _retval;
    _retval = _klass.length(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Attempts to read up to len bytes from stream into buf.
  
      Params:
        buf = buffer
      Returns: the number of bytes read or %-1 on fail.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRead` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncRead(ubyte[] buf)
  {
    auto _klass = cast(GMimeStreamClass*)_vfuncClass;
    if (!_klass.read)
      return typeof(return).init;

    ptrdiff_t _retval;
    size_t _len;
    if (buf)
      _len = cast(size_t)buf.length;

    auto _buf = cast(ubyte*)buf.ptr;
    _retval = _klass.read(cast(GMimeStream*)this._cPtr, _buf, _len);
    return _retval;
  }

  /**
      Resets the stream.
      Returns: `0` on success or %-1 on fail.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReset` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncReset()
  {
    auto _klass = cast(GMimeStreamClass*)_vfuncClass;
    if (!_klass.reset)
      return typeof(return).init;

    int _retval;
    _retval = _klass.reset(cast(GMimeStream*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSeek` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected long vfuncSeek(long offset, gid.gmime3.types.SeekWhence whence)
  {
    auto _klass = cast(GMimeStreamClass*)_vfuncClass;
    if (!_klass.seek)
      return typeof(return).init;

    long _retval;
    _retval = _klass.seek(cast(GMimeStream*)this._cPtr, offset, whence);
    return _retval;
  }

  /**
      Creates a new substream of stream with bounds start and end.
  
      Params:
        start = start boundary
        end = end boundary
      Returns: a substream of stream with bounds start
        and end.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSubstream` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gmime3.stream.Stream vfuncSubstream(long start, long end)
  {
    auto _klass = cast(GMimeStreamClass*)_vfuncClass;
    if (!_klass.substream)
      return typeof(return).init;

    GMimeStream* _cretval;
    _cretval = _klass.substream(cast(GMimeStream*)this._cPtr, start, end);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream.Stream)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the current offset within the stream.
      Returns: the current position within the stream or %-1 on fail.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTell` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected long vfuncTell()
  {
    auto _klass = cast(GMimeStreamClass*)_vfuncClass;
    if (!_klass.tell)
      return typeof(return).init;

    long _retval;
    _retval = _klass.tell(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Attempts to write up to len bytes of buf to stream.
  
      Params:
        buf = buffer
      Returns: the number of bytes written or %-1 on fail.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWrite` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncWrite(ubyte[] buf)
  {
    auto _klass = cast(GMimeStreamClass*)_vfuncClass;
    if (!_klass.write)
      return typeof(return).init;

    ptrdiff_t _retval;
    size_t _len;
    if (buf)
      _len = cast(size_t)buf.length;

    auto _buf = cast(ubyte*)buf.ptr;
    _retval = _klass.write(cast(GMimeStream*)this._cPtr, _buf, _len);
    return _retval;
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
  ptrdiff_t bufferGets(ubyte[] buf) nothrow
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
  void bufferReadln(ubyte[] buffer) nothrow
  {
    auto _buffer = gByteArrayFromD(buffer);
    scope(exit) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_buffer);
    g_mime_stream_buffer_readln(cast(GMimeStream*)this._cPtr, _buffer);
  }

  /**
      Closes the stream.
      Returns: `0` on success or %-1 on fail.
  */
  int close() nothrow
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
  void construct(long start, long end) nothrow
  {
    g_mime_stream_construct(cast(GMimeStream*)this._cPtr, start, end);
  }

  /**
      Tests the end-of-stream indicator for stream.
      Returns: true on EOS or false otherwise.
  */
  bool eos() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_stream_eos(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Sync's the stream to disk.
      Returns: `0` on success or %-1 on fail.
  */
  int flush() nothrow
  {
    int _retval;
    _retval = g_mime_stream_flush(cast(GMimeStream*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length of the stream.
      Returns: the length of the stream or %-1 if unknown.
  */
  long length() nothrow
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
  ptrdiff_t read(ubyte[] buf) nothrow
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
  int reset() nothrow
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
  long seek(long offset, gid.gmime3.types.SeekWhence whence) nothrow
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
  void setBounds(long start, long end) nothrow
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
  gid.gmime3.stream.Stream substream(long start, long end) nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_substream(cast(GMimeStream*)this._cPtr, start, end);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream.Stream)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the current offset within the stream.
      Returns: the current position within the stream or %-1 on fail.
  */
  long tell() nothrow
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
  ptrdiff_t write(ubyte[] buf) nothrow
  {
    ptrdiff_t _retval;
    size_t _len;
    if (buf)
      _len = cast(size_t)buf.length;

    auto _buf = cast(ubyte*)buf.ptr;
    _retval = g_mime_stream_write(cast(GMimeStream*)this._cPtr, _buf, _len);
    return _retval;
  }

  /**
      Writes string to stream.
  
      Params:
        str = string to write
      Returns: the number of bytes written or %-1 on fail.
  */
  ptrdiff_t writeString(string str) nothrow
  {
    ptrdiff_t _retval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _retval = g_mime_stream_write_string(cast(GMimeStream*)this._cPtr, _str);
    return _retval;
  }

  /**
      Attempts to write the source stream to the destination stream.
  
      Params:
        dest = destination stream
      Returns: the number of bytes written or %-1 on fail.
  */
  long writeToStream(gid.gmime3.stream.Stream dest) nothrow
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
  long writev(gid.gmime3.types.StreamIOVector[] vector) nothrow
  {
    long _retval;
    size_t _count;
    if (vector)
      _count = cast(size_t)vector.length;

    auto _vector = cast(GMimeStreamIOVector*)vector.ptr;
    _retval = g_mime_stream_writev(cast(GMimeStream*)this._cPtr, _vector, _count);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Stream
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gmime3.stream.Stream), T.stringof ~ " is not derived from gid.gmime3.stream.Stream");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gmime3.stream.Stream))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEos", true)[0]) == gid.gmime3.stream.Stream))
      _installVfunc(klass, "eos");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlush", true)[0]) == gid.gmime3.stream.Stream))
      _installVfunc(klass, "flush");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLength", true)[0]) == gid.gmime3.stream.Stream))
      _installVfunc(klass, "length");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRead", true)[0]) == gid.gmime3.stream.Stream))
      _installVfunc(klass, "read");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReset", true)[0]) == gid.gmime3.stream.Stream))
      _installVfunc(klass, "reset");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSeek", true)[0]) == gid.gmime3.stream.Stream))
      _installVfunc(klass, "seek");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSubstream", true)[0]) == gid.gmime3.stream.Stream))
      _installVfunc(klass, "substream");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTell", true)[0]) == gid.gmime3.stream.Stream))
      _installVfunc(klass, "tell");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWrite", true)[0]) == gid.gmime3.stream.Stream))
      _installVfunc(klass, "write");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GMimeStreamClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) int _vfuncCloseTramp(GMimeStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.stream.Stream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GMimeStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(stream);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.stream.Stream.vfuncClose");
          }
          return _retval;
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "eos":
      {
        static extern(C) gboolean _vfuncEosTramp(GMimeStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.stream.Stream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GMimeStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.eos)
              return (cast(typeof(&_vfuncEosTramp))_klass.eos)(stream);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEos();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.stream.Stream.vfuncEos");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.eos = cast(typeof(_klass.eos))&_vfuncEosTramp;
        break;
      }
      case "flush":
      {
        static extern(C) int _vfuncFlushTramp(GMimeStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.stream.Stream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GMimeStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.flush)
              return (cast(typeof(&_vfuncFlushTramp))_klass.flush)(stream);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncFlush();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.stream.Stream.vfuncFlush");
          }
          return _retval;
        }

        _klass.flush = cast(typeof(_klass.flush))&_vfuncFlushTramp;
        break;
      }
      case "length":
      {
        static extern(C) long _vfuncLengthTramp(GMimeStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.stream.Stream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GMimeStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.length)
              return (cast(typeof(&_vfuncLengthTramp))_klass.length)(stream);
            return typeof(return).init;
          }

          long _retval;

          try
          {
            _retval = _obj.vfuncLength();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.stream.Stream.vfuncLength");
          }
          return _retval;
        }

        _klass.length = cast(typeof(_klass.length))&_vfuncLengthTramp;
        break;
      }
      case "read":
      {
        static extern(C) ptrdiff_t _vfuncReadTramp(GMimeStream* stream, ubyte* buf, size_t len) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.stream.Stream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GMimeStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.read)
              return (cast(typeof(&_vfuncReadTramp))_klass.read)(stream, buf, len);
            return typeof(return).init;
          }

          ptrdiff_t _retval;
          ubyte[] _buf;
          _buf.length = len;
          _buf[0 .. len] = buf[0 .. len];

          try
          {
            _retval = _obj.vfuncRead(_buf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.stream.Stream.vfuncRead");
          }
          return _retval;
        }

        _klass.read = cast(typeof(_klass.read))&_vfuncReadTramp;
        break;
      }
      case "reset":
      {
        static extern(C) int _vfuncResetTramp(GMimeStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.stream.Stream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GMimeStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(stream);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncReset();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.stream.Stream.vfuncReset");
          }
          return _retval;
        }

        _klass.reset = cast(typeof(_klass.reset))&_vfuncResetTramp;
        break;
      }
      case "seek":
      {
        static extern(C) long _vfuncSeekTramp(GMimeStream* stream, long offset, GMimeSeekWhence whence) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.stream.Stream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GMimeStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.seek)
              return (cast(typeof(&_vfuncSeekTramp))_klass.seek)(stream, offset, whence);
            return typeof(return).init;
          }

          long _retval;

          try
          {
            _retval = _obj.vfuncSeek(offset, whence);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.stream.Stream.vfuncSeek");
          }
          return _retval;
        }

        _klass.seek = cast(typeof(_klass.seek))&_vfuncSeekTramp;
        break;
      }
      case "substream":
      {
        static extern(C) GMimeStream* _vfuncSubstreamTramp(GMimeStream* stream, long start, long end) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.stream.Stream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GMimeStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.substream)
              return (cast(typeof(&_vfuncSubstreamTramp))_klass.substream)(stream, start, end);
            return typeof(return).init;
          }

          gid.gmime3.stream.Stream _dretval;

          try
          {
            _dretval = _obj.vfuncSubstream(start, end);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.stream.Stream.vfuncSubstream");
          }
          auto _retval = _dretval ? cast(GMimeStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.substream = cast(typeof(_klass.substream))&_vfuncSubstreamTramp;
        break;
      }
      case "tell":
      {
        static extern(C) long _vfuncTellTramp(GMimeStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.stream.Stream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GMimeStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.tell)
              return (cast(typeof(&_vfuncTellTramp))_klass.tell)(stream);
            return typeof(return).init;
          }

          long _retval;

          try
          {
            _retval = _obj.vfuncTell();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.stream.Stream.vfuncTell");
          }
          return _retval;
        }

        _klass.tell = cast(typeof(_klass.tell))&_vfuncTellTramp;
        break;
      }
      case "write":
      {
        static extern(C) ptrdiff_t _vfuncWriteTramp(GMimeStream* stream, const(ubyte)* buf, size_t len) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.stream.Stream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GMimeStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.write)
              return (cast(typeof(&_vfuncWriteTramp))_klass.write)(stream, buf, len);
            return typeof(return).init;
          }

          ptrdiff_t _retval;
          ubyte[] _buf;
          _buf.length = len;
          _buf[0 .. len] = buf[0 .. len];

          try
          {
            _retval = _obj.vfuncWrite(_buf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.stream.Stream.vfuncWrite");
          }
          return _retval;
        }

        _klass.write = cast(typeof(_klass.write))&_vfuncWriteTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.stream.Stream]
class StreamGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.stream.Stream]
final class StreamGidBuilder : StreamGidBuilderImpl!StreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Stream build() nothrow
  {
    return new Stream(cast(void*)createGObject(Stream._getGType), Yes.Take);
  }
}
