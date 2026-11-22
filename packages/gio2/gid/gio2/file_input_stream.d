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
class FileInputStream : gid.gio2.input_stream.InputStream, gid.gio2.seekable.Seekable
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
