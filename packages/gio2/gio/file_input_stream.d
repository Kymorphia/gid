/// Module for [FileInputStream] class
module gio.file_input_stream;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.file_info;
import gio.input_stream;
import gio.seekable;
import gio.seekable_mixin;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.file_input_stream.FileInputStream] provides input streams that take their
    content from a file.
    
    [gio.file_input_stream.FileInputStream] implements [gio.seekable.Seekable], which allows the input
    stream to jump to arbitrary positions in the file, provided the
    filesystem of the file allows it. To find the position of a file
    input stream, use [gio.seekable.Seekable.tell]. To find out if a file input
    stream supports seeking, use `vfunc@Gio.Seekable.can_seek`.
    To position a file input stream, use `vfunc@Gio.Seekable.seek`.
*/
class FileInputStream : gio.input_stream.InputStream, gio.seekable.Seekable
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
    return cast(void function())g_file_input_stream_get_type != &gidSymbolNotFound ? g_file_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileInputStream self()
  {
    return this;
  }

  mixin SeekableT!();

  /**
      Queries a file input stream the given attributes. This function blocks
      while querying the stream. For the asynchronous (non-blocking) version
      of this function, see [gio.file_input_stream.FileInputStream.queryInfoAsync]. While the
      stream is blocked, the stream will set the pending flag internally, and
      any other operations on the stream will fail with [gio.types.IOErrorEnum.Pending].
  
      Params:
        attributes = a file attribute query string.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GFileInfo, or null on error.
      Throws: [ErrorWrap]
  */
  gio.file_info.FileInfo queryInfo(string attributes, gio.cancellable.Cancellable cancellable = null)
  {
    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString(No.Alloc);
    GError *_err;
    _cretval = g_file_input_stream_query_info(cast(GFileInputStream*)this._cPtr, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Queries the stream information asynchronously.
      When the operation is finished callback will be called.
      You can then call [gio.file_input_stream.FileInputStream.queryInfoFinish]
      to get the result of the operation.
      
      For the synchronous version of this function,
      see [gio.file_input_stream.FileInputStream.queryInfo].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be set
  
      Params:
        attributes = a file attribute query string.
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void queryInfoAsync(string attributes, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _attributes = attributes.toCString(No.Alloc);
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
  gio.file_info.FileInfo queryInfoFinish(gio.async_result.AsyncResult result)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_input_stream_query_info_finish(cast(GFileInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }
}
