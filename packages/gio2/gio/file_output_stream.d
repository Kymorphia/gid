/// Module for [FileOutputStream] class
module gio.file_output_stream;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.file_info;
import gio.output_stream;
import gio.seekable;
import gio.seekable_mixin;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.file_output_stream.FileOutputStream] provides output streams that write their
    content to a file.
    
    [gio.file_output_stream.FileOutputStream] implements [gio.seekable.Seekable], which allows the output
    stream to jump to arbitrary positions in the file and to truncate
    the file, provided the filesystem of the file supports these
    operations.
    
    To find the position of a file output stream, use [gio.seekable.Seekable.tell].
    To find out if a file output stream supports seeking, use
    [gio.seekable.Seekable.canSeek].To position a file output stream, use
    [gio.seekable.Seekable.seek]. To find out if a file output stream supports
    truncating, use [gio.seekable.Seekable.canTruncate]. To truncate a file output
    stream, use [gio.seekable.Seekable.truncate].
*/
class FileOutputStream : gio.output_stream.OutputStream, gio.seekable.Seekable
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
    return cast(void function())g_file_output_stream_get_type != &gidSymbolNotFound ? g_file_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileOutputStream self()
  {
    return this;
  }

  mixin SeekableT!();

  /**
      Gets the entity tag for the file when it has been written.
      This must be called after the stream has been written
      and closed, as the etag can change while writing.
      Returns: the entity tag for the stream.
  */
  string getEtag()
  {
    char* _cretval;
    _cretval = g_file_output_stream_get_etag(cast(GFileOutputStream*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Queries a file output stream for the given attributes.
      This function blocks while querying the stream. For the asynchronous
      version of this function, see [gio.file_output_stream.FileOutputStream.queryInfoAsync].
      While the stream is blocked, the stream will set the pending flag
      internally, and any other operations on the stream will fail with
      [gio.types.IOErrorEnum.Pending].
      
      Can fail if the stream was already closed (with error being set to
      [gio.types.IOErrorEnum.Closed]), the stream has pending operations (with error being
      set to [gio.types.IOErrorEnum.Pending]), or if querying info is not supported for
      the stream's interface (with error being set to [gio.types.IOErrorEnum.NotSupported]). In
      all cases of failure, null will be returned.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be set, and null will
      be returned.
  
      Params:
        attributes = a file attribute query string.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GFileInfo for the stream, or null on error.
      Throws: [ErrorWrap]
  */
  gio.file_info.FileInfo queryInfo(string attributes, gio.cancellable.Cancellable cancellable = null)
  {
    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString(No.Alloc);
    GError *_err;
    _cretval = g_file_output_stream_query_info(cast(GFileOutputStream*)this._cPtr, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously queries the stream for a #GFileInfo. When completed,
      callback will be called with a #GAsyncResult which can be used to
      finish the operation with [gio.file_output_stream.FileOutputStream.queryInfoFinish].
      
      For the synchronous version of this function, see
      [gio.file_output_stream.FileOutputStream.queryInfo].
  
      Params:
        attributes = a file attribute query string.
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the
            request
        cancellable = optional #GCancellable object, null to ignore.
        callback = callback to call when the request is satisfied
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
    g_file_output_stream_query_info_async(cast(GFileOutputStream*)this._cPtr, _attributes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finalizes the asynchronous query started
      by [gio.file_output_stream.FileOutputStream.queryInfoAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: A #GFileInfo for the finished query.
      Throws: [ErrorWrap]
  */
  gio.file_info.FileInfo queryInfoFinish(gio.async_result.AsyncResult result)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_output_stream_query_info_finish(cast(GFileOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }
}
