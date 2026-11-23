/// Module for [FileIOStream] class
module gid.gio2.file_iostream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.file_info;
import gid.gio2.iostream;
import gid.gio2.seekable;
import gid.gio2.seekable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.file_iostream.FileIOStream] provides I/O streams that both read and write to the same
    file handle.
    
    [gid.gio2.file_iostream.FileIOStream] implements [gid.gio2.seekable.Seekable], which allows the I/O
    stream to jump to arbitrary positions in the file and to truncate
    the file, provided the filesystem of the file supports these
    operations.
    
    To find the position of a file I/O stream, use [gid.gio2.seekable.Seekable.tell].
    
    To find out if a file I/O stream supports seeking, use
    [gid.gio2.seekable.Seekable.canSeek]. To position a file I/O stream, use
    [gid.gio2.seekable.Seekable.seek]. To find out if a file I/O stream supports
    truncating, use [gid.gio2.seekable.Seekable.canTruncate]. To truncate a file I/O
    stream, use [gid.gio2.seekable.Seekable.truncate].
    
    The default implementation of all the [gid.gio2.file_iostream.FileIOStream] operations
    and the implementation of [gid.gio2.seekable.Seekable] just call into the same
    operations on the output stream.
*/
class FileIOStream : gid.gio2.iostream.IOStream, gid.gio2.seekable.Seekable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_file_io_stream_get_type != &gidSymbolNotFound ? g_file_io_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GFileIOStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileIOStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.file_iostream.FileIOStream]
      Returns: New builder object
  */
  static FileIOStreamGidBuilder builder() nothrow
  {
    return new FileIOStreamGidBuilder;
  }

  mixin SeekableT!();

  /** */
  protected bool vfuncCanSeek()
  {
    auto _klass = cast(GFileIOStreamClass*)_vfuncClass;
    if (!_klass.canSeek)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canSeek(cast(GFileIOStream*)this._cPtr);
    return _retval;
  }

  /** */
  protected bool vfuncCanTruncate()
  {
    auto _klass = cast(GFileIOStreamClass*)_vfuncClass;
    if (!_klass.canTruncate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canTruncate(cast(GFileIOStream*)this._cPtr);
    return _retval;
  }

  /**
      Gets the entity tag for the file when it has been written.
      This must be called after the stream has been written
      and closed, as the etag can change while writing.
      Returns: the entity tag for the stream.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetEtag` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected string vfuncGetEtag()
  {
    auto _klass = cast(GFileIOStreamClass*)_vfuncClass;
    if (!_klass.getEtag)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getEtag(cast(GFileIOStream*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Queries a file io stream for the given attributes.
      This function blocks while querying the stream. For the asynchronous
      version of this function, see [gid.gio2.file_iostream.FileIOStream.queryInfoAsync].
      While the stream is blocked, the stream will set the pending flag
      internally, and any other operations on the stream will fail with
      [gid.gio2.types.IOErrorEnum.Pending].
      
      Can fail if the stream was already closed (with error being set to
      [gid.gio2.types.IOErrorEnum.Closed]), the stream has pending operations (with error being
      set to [gid.gio2.types.IOErrorEnum.Pending]), or if querying info is not supported for
      the stream's interface (with error being set to [gid.gio2.types.IOErrorEnum.NotSupported]). I
      all cases of failure, null will be returned.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be set, and null will
      be returned.
  
      Params:
        attributes = a file attribute query string.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GFileInfo for the stream, or null on error.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryInfo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.file_info.FileInfo vfuncQueryInfo(string attributes, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIOStreamClass*)_vfuncClass;
    if (!_klass.queryInfo)
      return typeof(return).init;

    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.queryInfo(cast(GFileIOStream*)this._cPtr, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously queries the stream for a #GFileInfo. When completed,
      callback will be called with a #GAsyncResult which can be used to
      finish the operation with [gid.gio2.file_iostream.FileIOStream.queryInfoFinish].
      
      For the synchronous version of this function, see
      [gid.gio2.file_iostream.FileIOStream.queryInfo].
  
      Params:
        attributes = a file attribute query string.
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the
            request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryInfoAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncQueryInfoAsync(string attributes, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIOStreamClass*)_vfuncClass;
    if (!_klass.queryInfoAsync)
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
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.queryInfoAsync(cast(GFileIOStream*)this._cPtr, _attributes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finalizes the asynchronous query started
      by [gid.gio2.file_iostream.FileIOStream.queryInfoAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: A #GFileInfo for the finished query.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryInfoFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.file_info.FileInfo vfuncQueryInfoFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIOStreamClass*)_vfuncClass;
    if (!_klass.queryInfoFinish)
      return typeof(return).init;

    GFileInfo* _cretval;
    GError *_err;
    _cretval = _klass.queryInfoFinish(cast(GFileIOStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  protected bool vfuncSeek(long offset, gid.glib2.types.SeekType type, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIOStreamClass*)_vfuncClass;
    if (!_klass.seek)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.seek(cast(GFileIOStream*)this._cPtr, offset, type, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  protected long vfuncTell()
  {
    auto _klass = cast(GFileIOStreamClass*)_vfuncClass;
    if (!_klass.tell)
      return typeof(return).init;

    long _retval;
    _retval = _klass.tell(cast(GFileIOStream*)this._cPtr);
    return _retval;
  }

  /** */
  protected bool vfuncTruncateFn(long size, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIOStreamClass*)_vfuncClass;
    if (!_klass.truncateFn)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.truncateFn(cast(GFileIOStream*)this._cPtr, size, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the entity tag for the file when it has been written.
      This must be called after the stream has been written
      and closed, as the etag can change while writing.
      Returns: the entity tag for the stream.
  */
  string getEtag() nothrow
  {
    char* _cretval;
    _cretval = g_file_io_stream_get_etag(cast(GFileIOStream*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Queries a file io stream for the given attributes.
      This function blocks while querying the stream. For the asynchronous
      version of this function, see [gid.gio2.file_iostream.FileIOStream.queryInfoAsync].
      While the stream is blocked, the stream will set the pending flag
      internally, and any other operations on the stream will fail with
      [gid.gio2.types.IOErrorEnum.Pending].
      
      Can fail if the stream was already closed (with error being set to
      [gid.gio2.types.IOErrorEnum.Closed]), the stream has pending operations (with error being
      set to [gid.gio2.types.IOErrorEnum.Pending]), or if querying info is not supported for
      the stream's interface (with error being set to [gid.gio2.types.IOErrorEnum.NotSupported]). I
      all cases of failure, null will be returned.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be set, and null will
      be returned.
  
      Params:
        attributes = a file attribute query string.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GFileInfo for the stream, or null on error.
      Throws: [ErrorWrap]
  */
  gid.gio2.file_info.FileInfo queryInfo(string attributes, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_file_io_stream_query_info(cast(GFileIOStream*)this._cPtr, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously queries the stream for a #GFileInfo. When completed,
      callback will be called with a #GAsyncResult which can be used to
      finish the operation with [gid.gio2.file_iostream.FileIOStream.queryInfoFinish].
      
      For the synchronous version of this function, see
      [gid.gio2.file_iostream.FileIOStream.queryInfo].
  
      Params:
        attributes = a file attribute query string.
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the
            request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void queryInfoAsync(string attributes, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_io_stream_query_info_async(cast(GFileIOStream*)this._cPtr, _attributes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finalizes the asynchronous query started
      by [gid.gio2.file_iostream.FileIOStream.queryInfoAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: A #GFileInfo for the finished query.
      Throws: [ErrorWrap]
  */
  gid.gio2.file_info.FileInfo queryInfoFinish(gid.gio2.async_result.AsyncResult result)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_io_stream_query_info_finish(cast(GFileIOStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from FileIOStream
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.file_iostream.FileIOStream), T.stringof ~ " is not derived from gid.gio2.file_iostream.FileIOStream");

    gid.gio2.iostream.IOStream._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCanSeek", true)[0]) == gid.gio2.file_iostream.FileIOStream))
      _installVfunc(klass, "can_seek");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCanTruncate", true)[0]) == gid.gio2.file_iostream.FileIOStream))
      _installVfunc(klass, "can_truncate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetEtag", true)[0]) == gid.gio2.file_iostream.FileIOStream))
      _installVfunc(klass, "get_etag");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryInfo", true)[0]) == gid.gio2.file_iostream.FileIOStream))
      _installVfunc(klass, "query_info");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryInfoAsync", true)[0]) == gid.gio2.file_iostream.FileIOStream))
      static assert(0, "Overriding gid.gio2.file_iostream.FileIOStream.vfuncQueryInfoAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryInfoFinish", true)[0]) == gid.gio2.file_iostream.FileIOStream))
      _installVfunc(klass, "query_info_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSeek", true)[0]) == gid.gio2.file_iostream.FileIOStream))
      _installVfunc(klass, "seek");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTell", true)[0]) == gid.gio2.file_iostream.FileIOStream))
      _installVfunc(klass, "tell");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTruncateFn", true)[0]) == gid.gio2.file_iostream.FileIOStream))
      _installVfunc(klass, "truncate_fn");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GFileIOStreamClass*)klass;

    switch (vfunc)
    {
      case "can_seek":
      {
        static extern(C) gboolean _vfuncCanSeekTramp(GFileIOStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_iostream.FileIOStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileIOStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.canSeek)
              return (cast(typeof(&_vfuncCanSeekTramp))_klass.canSeek)(stream);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanSeek();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file_iostream.FileIOStream.vfuncCanSeek");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canSeek = cast(typeof(_klass.canSeek))&_vfuncCanSeekTramp;
        break;
      }
      case "can_truncate":
      {
        static extern(C) gboolean _vfuncCanTruncateTramp(GFileIOStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_iostream.FileIOStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileIOStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.canTruncate)
              return (cast(typeof(&_vfuncCanTruncateTramp))_klass.canTruncate)(stream);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanTruncate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file_iostream.FileIOStream.vfuncCanTruncate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canTruncate = cast(typeof(_klass.canTruncate))&_vfuncCanTruncateTramp;
        break;
      }
      case "get_etag":
      {
        static extern(C) char* _vfuncGetEtagTramp(GFileIOStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_iostream.FileIOStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileIOStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.getEtag)
              return (cast(typeof(&_vfuncGetEtagTramp))_klass.getEtag)(stream);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetEtag();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file_iostream.FileIOStream.vfuncGetEtag");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getEtag = cast(typeof(_klass.getEtag))&_vfuncGetEtagTramp;
        break;
      }
      case "query_info":
      {
        static extern(C) GFileInfo* _vfuncQueryInfoTramp(GFileIOStream* stream, const(char)* attributes, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_iostream.FileIOStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileIOStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.queryInfo)
              return (cast(typeof(&_vfuncQueryInfoTramp))_klass.queryInfo)(stream, attributes, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_info.FileInfo _dretval;
          string _attributes = attributes.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncQueryInfo(_attributes, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileInfo*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.queryInfo = cast(typeof(_klass.queryInfo))&_vfuncQueryInfoTramp;
        break;
      }
      case "query_info_finish":
      {
        static extern(C) GFileInfo* _vfuncQueryInfoFinishTramp(GFileIOStream* stream, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_iostream.FileIOStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileIOStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.queryInfoFinish)
              return (cast(typeof(&_vfuncQueryInfoFinishTramp))_klass.queryInfoFinish)(stream, result, _err);
            return typeof(return).init;
          }

          gid.gio2.file_info.FileInfo _dretval;

          try
          {
            _dretval = _obj.vfuncQueryInfoFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileInfo*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.queryInfoFinish = cast(typeof(_klass.queryInfoFinish))&_vfuncQueryInfoFinishTramp;
        break;
      }
      case "seek":
      {
        static extern(C) gboolean _vfuncSeekTramp(GFileIOStream* stream, long offset, GSeekType type, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_iostream.FileIOStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileIOStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.seek)
              return (cast(typeof(&_vfuncSeekTramp))_klass.seek)(stream, offset, type, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSeek(offset, type, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.seek = cast(typeof(_klass.seek))&_vfuncSeekTramp;
        break;
      }
      case "tell":
      {
        static extern(C) long _vfuncTellTramp(GFileIOStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_iostream.FileIOStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileIOStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file_iostream.FileIOStream.vfuncTell");
          }
          return _retval;
        }

        _klass.tell = cast(typeof(_klass.tell))&_vfuncTellTramp;
        break;
      }
      case "truncate_fn":
      {
        static extern(C) gboolean _vfuncTruncateFnTramp(GFileIOStream* stream, long size, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_iostream.FileIOStream)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileIOStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
            if (_klass.truncateFn)
              return (cast(typeof(&_vfuncTruncateFnTramp))_klass.truncateFn)(stream, size, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncTruncateFn(size, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.truncateFn = cast(typeof(_klass.truncateFn))&_vfuncTruncateFnTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.file_iostream.FileIOStream]
class FileIOStreamGidBuilderImpl(T) : gid.gio2.iostream.IOStreamGidBuilderImpl!T, gid.gio2.seekable.SeekableGidBuilderImpl!T
{

  mixin SeekableGidBuilderT!();
}

/// Fluent builder for [gid.gio2.file_iostream.FileIOStream]
final class FileIOStreamGidBuilder : FileIOStreamGidBuilderImpl!FileIOStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileIOStream build() nothrow
  {
    return new FileIOStream(cast(void*)createGObject(FileIOStream._getGType), Yes.Take);
  }
}
