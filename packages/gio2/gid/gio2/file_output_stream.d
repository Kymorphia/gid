/// Module for [FileOutputStream] class
module gid.gio2.file_output_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.file_info;
import gid.gio2.output_stream;
import gid.gio2.seekable;
import gid.gio2.seekable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.file_output_stream.FileOutputStream] provides output streams that write their
    content to a file.
    
    [gid.gio2.file_output_stream.FileOutputStream] implements [gid.gio2.seekable.Seekable], which allows the output
    stream to jump to arbitrary positions in the file and to truncate
    the file, provided the filesystem of the file supports these
    operations.
    
    To find the position of a file output stream, use [gid.gio2.seekable.Seekable.tell].
    To find out if a file output stream supports seeking, use
    [gid.gio2.seekable.Seekable.canSeek].To position a file output stream, use
    [gid.gio2.seekable.Seekable.seek]. To find out if a file output stream supports
    truncating, use [gid.gio2.seekable.Seekable.canTruncate]. To truncate a file output
    stream, use [gid.gio2.seekable.Seekable.truncate].
*/
class FileOutputStream : gid.gio2.output_stream.OutputStream, gid.gio2.seekable.Seekable
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
    return cast(void function())g_file_output_stream_get_type != &gidSymbolNotFound ? g_file_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GFileOutputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileOutputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.file_output_stream.FileOutputStream]
      Returns: New builder object
  */
  static FileOutputStreamGidBuilder builder() nothrow
  {
    return new FileOutputStreamGidBuilder;
  }

  mixin SeekableT!();

  /**
      Gets the entity tag for the file when it has been written.
      This must be called after the stream has been written
      and closed, as the etag can change while writing.
      Returns: the entity tag for the stream.
  */
  string getEtag() nothrow
  {
    char* _cretval;
    _cretval = g_file_output_stream_get_etag(cast(GFileOutputStream*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Queries a file output stream for the given attributes.
      This function blocks while querying the stream. For the asynchronous
      version of this function, see [gid.gio2.file_output_stream.FileOutputStream.queryInfoAsync].
      While the stream is blocked, the stream will set the pending flag
      internally, and any other operations on the stream will fail with
      [gid.gio2.types.IOErrorEnum.Pending].
      
      Can fail if the stream was already closed (with error being set to
      [gid.gio2.types.IOErrorEnum.Closed]), the stream has pending operations (with error being
      set to [gid.gio2.types.IOErrorEnum.Pending]), or if querying info is not supported for
      the stream's interface (with error being set to [gid.gio2.types.IOErrorEnum.NotSupported]). In
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
    _cretval = g_file_output_stream_query_info(cast(GFileOutputStream*)this._cPtr, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously queries the stream for a #GFileInfo. When completed,
      callback will be called with a #GAsyncResult which can be used to
      finish the operation with [gid.gio2.file_output_stream.FileOutputStream.queryInfoFinish].
      
      For the synchronous version of this function, see
      [gid.gio2.file_output_stream.FileOutputStream.queryInfo].
  
      Params:
        attributes = a file attribute query string.
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the
            request
        cancellable = optional #GCancellable object, null to ignore.
        callback = callback to call when the request is satisfied
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
    g_file_output_stream_query_info_async(cast(GFileOutputStream*)this._cPtr, _attributes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finalizes the asynchronous query started
      by [gid.gio2.file_output_stream.FileOutputStream.queryInfoAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: A #GFileInfo for the finished query.
      Throws: [ErrorWrap]
  */
  gid.gio2.file_info.FileInfo queryInfoFinish(gid.gio2.async_result.AsyncResult result)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_output_stream_query_info_finish(cast(GFileOutputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.file_output_stream.FileOutputStream]
class FileOutputStreamGidBuilderImpl(T) : gid.gio2.output_stream.OutputStreamGidBuilderImpl!T, gid.gio2.seekable.SeekableGidBuilderImpl!T
{

  mixin SeekableGidBuilderT!();
}

/// Fluent builder for [gid.gio2.file_output_stream.FileOutputStream]
final class FileOutputStreamGidBuilder : FileOutputStreamGidBuilderImpl!FileOutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileOutputStream build() nothrow
  {
    return new FileOutputStream(cast(void*)createGObject(FileOutputStream._getGType), Yes.Take);
  }
}
