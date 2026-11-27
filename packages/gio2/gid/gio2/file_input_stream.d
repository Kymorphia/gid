/// Module for [FileInputStream] class
module gid.gio2.file_input_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.file_info;
import gid.gio2.input_stream;
import gid.gio2.seekable;
import gid.gio2.seekable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.file_input_stream.FileInputStream] provides input streams that take their
    content from a file.
    
    [gid.gio2.file_input_stream.FileInputStream] implements [gid.gio2.seekable.Seekable], which allows the input
    stream to jump to arbitrary positions in the file, provided the
    filesystem of the file allows it. To find the position of a file
    input stream, use [gid.gio2.seekable.Seekable.tell]. To find out if a file input
    stream supports seeking, use `vfunc@Gio.Seekable.can_seek`.
    To position a file input stream, use `vfunc@Gio.Seekable.seek`.
*/
@gidGir("FileInputStream", "FileInputStreamClass")
class FileInputStream : gid.gio2.input_stream.InputStream, gid.gio2.seekable.Seekable
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
    return cast(void function())g_file_input_stream_get_type != &gidSymbolNotFound ? g_file_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GFileInputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileInputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.file_input_stream.FileInputStream]
      Returns: New builder object
  */
  static FileInputStreamGidBuilder builder() nothrow
  {
    return new FileInputStreamGidBuilder;
  }

  mixin SeekableT!();

  /** */
  protected bool vfuncCanSeek()
  {
    auto _klass = cast(GFileInputStreamClass*)_vfuncClass;
    if (!_klass.canSeek)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canSeek(cast(GFileInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Queries a file input stream the given attributes. This function blocks
      while querying the stream. For the asynchronous (non-blocking) version
      of this function, see [gid.gio2.file_input_stream.FileInputStream.queryInfoAsync]. While the
      stream is blocked, the stream will set the pending flag internally, and
      any other operations on the stream will fail with [gid.gio2.types.IOErrorEnum.Pending].
  
      Params:
        attributes = a file attribute query string.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GFileInfo, or null on error.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryInfo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.file_info.FileInfo vfuncQueryInfo(string attributes, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileInputStreamClass*)_vfuncClass;
    if (!_klass.queryInfo)
      return typeof(return).init;

    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.queryInfo(cast(GFileInputStream*)this._cPtr, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Queries the stream information asynchronously.
      When the operation is finished callback will be called.
      You can then call [gid.gio2.file_input_stream.FileInputStream.queryInfoFinish]
      to get the result of the operation.
      
      For the synchronous version of this function,
      see [gid.gio2.file_input_stream.FileInputStream.queryInfo].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be set
  
      Params:
        attributes = a file attribute query string.
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryInfoAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncQueryInfoAsync(string attributes, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileInputStreamClass*)_vfuncClass;
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
    _klass.queryInfoAsync(cast(GFileInputStream*)this._cPtr, _attributes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous info query operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: #GFileInfo.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryInfoFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.file_info.FileInfo vfuncQueryInfoFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileInputStreamClass*)_vfuncClass;
    if (!_klass.queryInfoFinish)
      return typeof(return).init;

    GFileInfo* _cretval;
    GError *_err;
    _cretval = _klass.queryInfoFinish(cast(GFileInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  protected bool vfuncSeek(long offset, gid.glib2.types.SeekType type, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileInputStreamClass*)_vfuncClass;
    if (!_klass.seek)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.seek(cast(GFileInputStream*)this._cPtr, offset, type, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  protected long vfuncTell()
  {
    auto _klass = cast(GFileInputStreamClass*)_vfuncClass;
    if (!_klass.tell)
      return typeof(return).init;

    long _retval;
    _retval = _klass.tell(cast(GFileInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Queries a file input stream the given attributes. This function blocks
      while querying the stream. For the asynchronous (non-blocking) version
      of this function, see [gid.gio2.file_input_stream.FileInputStream.queryInfoAsync]. While the
      stream is blocked, the stream will set the pending flag internally, and
      any other operations on the stream will fail with [gid.gio2.types.IOErrorEnum.Pending].
  
      Params:
        attributes = a file attribute query string.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GFileInfo, or null on error.
      Throws: [ErrorWrap]
  */
  gid.gio2.file_info.FileInfo queryInfo(string attributes, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_file_input_stream_query_info(cast(GFileInputStream*)this._cPtr, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Queries the stream information asynchronously.
      When the operation is finished callback will be called.
      You can then call [gid.gio2.file_input_stream.FileInputStream.queryInfoFinish]
      to get the result of the operation.
      
      For the synchronous version of this function,
      see [gid.gio2.file_input_stream.FileInputStream.queryInfo].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be set
  
      Params:
        attributes = a file attribute query string.
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
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
    g_file_input_stream_query_info_async(cast(GFileInputStream*)this._cPtr, _attributes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous info query operation.
  
      Params:
        result = a #GAsyncResult.
      Returns: #GFileInfo.
      Throws: [ErrorWrap]
  */
  gid.gio2.file_info.FileInfo queryInfoFinish(gid.gio2.async_result.AsyncResult result)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_input_stream_query_info_finish(cast(GFileInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from FileInputStream
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.file_input_stream.FileInputStream), T.stringof ~ " is not derived from gid.gio2.file_input_stream.FileInputStream");

    gid.gio2.input_stream.InputStream._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCanSeek", true)[0]) == gid.gio2.file_input_stream.FileInputStream))
      _installVfunc(klass, "can_seek");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryInfo", true)[0]) == gid.gio2.file_input_stream.FileInputStream))
      _installVfunc(klass, "query_info");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryInfoAsync", true)[0]) == gid.gio2.file_input_stream.FileInputStream))
      static assert(0, "Overriding gid.gio2.file_input_stream.FileInputStream.vfuncQueryInfoAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryInfoFinish", true)[0]) == gid.gio2.file_input_stream.FileInputStream))
      _installVfunc(klass, "query_info_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSeek", true)[0]) == gid.gio2.file_input_stream.FileInputStream))
      _installVfunc(klass, "seek");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTell", true)[0]) == gid.gio2.file_input_stream.FileInputStream))
      _installVfunc(klass, "tell");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GFileInputStreamClass*)klass;

    switch (vfunc)
    {
      case "can_seek":
      {
        static extern(C) gboolean _vfuncCanSeekTramp(GFileInputStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.file_input_stream.FileInputStream)(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file_input_stream.FileInputStream.vfuncCanSeek");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canSeek = cast(typeof(_klass.canSeek))&_vfuncCanSeekTramp;
        break;
      }
      case "query_info":
      {
        static extern(C) GFileInfo* _vfuncQueryInfoTramp(GFileInputStream* stream, const(char)* attributes, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.file_input_stream.FileInputStream)(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
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
        static extern(C) GFileInfo* _vfuncQueryInfoFinishTramp(GFileInputStream* stream, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.file_input_stream.FileInputStream)(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
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
        static extern(C) gboolean _vfuncSeekTramp(GFileInputStream* stream, long offset, GSeekType type, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.file_input_stream.FileInputStream)(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
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
        static extern(C) long _vfuncTellTramp(GFileInputStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.file_input_stream.FileInputStream)(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GFileInputStreamClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file_input_stream.FileInputStream.vfuncTell");
          }
          return _retval;
        }

        _klass.tell = cast(typeof(_klass.tell))&_vfuncTellTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.file_input_stream.FileInputStream]
class FileInputStreamGidBuilderImpl(T) : gid.gio2.input_stream.InputStreamGidBuilderImpl!T, gid.gio2.seekable.SeekableGidBuilderImpl!T
{

  mixin SeekableGidBuilderT!();
}

/// Fluent builder for [gid.gio2.file_input_stream.FileInputStream]
final class FileInputStreamGidBuilder : FileInputStreamGidBuilderImpl!FileInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileInputStream build() nothrow
  {
    return new FileInputStream(cast(void*)createGObject(FileInputStream._getGType), Yes.Take);
  }
}
