/// Module for [FileEnumerator] class
module gio.file_enumerator;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.file;
import gio.file_info;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.file_enumerator.FileEnumerator] allows you to operate on a set of [gio.file.File] objects,
    returning a [gio.file_info.FileInfo] structure for each file enumerated (e.g.
    [gio.file.File.enumerateChildren] will return a [gio.file_enumerator.FileEnumerator] for each
    of the children within a directory).
    
    To get the next file's information from a [gio.file_enumerator.FileEnumerator], use
    [gio.file_enumerator.FileEnumerator.nextFile] or its asynchronous version,
    [gio.file_enumerator.FileEnumerator.nextFilesAsync]. Note that the asynchronous
    version will return a list of [gio.file_info.FileInfo] objects, whereas the
    synchronous will only return the next file in the enumerator.
    
    The ordering of returned files is unspecified for non-Unix
    platforms; for more information, see [glib.dir.Dir.readName].  On Unix,
    when operating on local files, returned files will be sorted by
    inode number.  Effectively you can assume that the ordering of
    returned files will be stable between successive calls (and
    applications) assuming the directory is unchanged.
    
    If your application needs a specific ordering, such as by name or
    modification time, you will have to implement that in your
    application code.
    
    To close a [gio.file_enumerator.FileEnumerator], use [gio.file_enumerator.FileEnumerator.close], or
    its asynchronous version, [gio.file_enumerator.FileEnumerator.closeAsync]. Once
    a [gio.file_enumerator.FileEnumerator] is closed, no further actions may be performed
    on it, and it should be freed with [gobject.object.ObjectWrap.unref].
*/
class FileEnumerator : gobject.object.ObjectWrap
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
    return cast(void function())g_file_enumerator_get_type != &gidSymbolNotFound ? g_file_enumerator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileEnumerator self()
  {
    return this;
  }

  /**
      Releases all resources used by this enumerator, making the
      enumerator return [gio.types.IOErrorEnum.Closed] on all calls.
      
      This will be automatically called when the last reference
      is dropped, but you might want to call this function to make
      sure resources are released as early as possible.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: #TRUE on success or #FALSE on error.
      Throws: [ErrorWrap]
  */
  bool close(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_enumerator_close(cast(GFileEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously closes the file enumerator.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned in
      [gio.file_enumerator.FileEnumerator.closeFinish].
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void closeAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_enumerator_close_async(cast(GFileEnumerator*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes closing a file enumerator, started from [gio.file_enumerator.FileEnumerator.closeAsync].
      
      If the file enumerator was already closed when [gio.file_enumerator.FileEnumerator.closeAsync]
      was called, then this function will report [gio.types.IOErrorEnum.Closed] in error, and
      return false. If the file enumerator had pending operation when the close
      operation was started, then this function will report [gio.types.IOErrorEnum.Pending], and
      return false.  If cancellable was not null, then the operation may have been
      cancelled by triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be set, and false will be
      returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the close operation has finished successfully.
      Throws: [ErrorWrap]
  */
  bool closeFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_enumerator_close_finish(cast(GFileEnumerator*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Return a new #GFile which refers to the file named by info in the source
      directory of enumerator.  This function is primarily intended to be used
      inside loops with [gio.file_enumerator.FileEnumerator.nextFile].
      
      To use this, [gio.types.FILE_ATTRIBUTE_STANDARD_NAME] must have been listed in the
      attributes list used when creating the #GFileEnumerator.
      
      This is a convenience method that's equivalent to:
      ```c
        gchar *name = g_file_info_get_name (info);
        GFile *child = g_file_get_child (g_file_enumerator_get_container (enumr),
                                         name);
      ```
  
      Params:
        info = a #GFileInfo gotten from [gio.file_enumerator.FileEnumerator.nextFile]
            or the async equivalents.
      Returns: a #GFile for the #GFileInfo passed it.
  */
  gio.file.File getChild(gio.file_info.FileInfo info)
  {
    GFile* _cretval;
    _cretval = g_file_enumerator_get_child(cast(GFileEnumerator*)this._cPtr, info ? cast(GFileInfo*)info._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the #GFile container which is being enumerated.
      Returns: the #GFile which is being enumerated.
  */
  gio.file.File getContainer()
  {
    GFile* _cretval;
    _cretval = g_file_enumerator_get_container(cast(GFileEnumerator*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if the file enumerator has pending operations.
      Returns: true if the enumerator has pending operations.
  */
  bool hasPending()
  {
    bool _retval;
    _retval = cast(bool)g_file_enumerator_has_pending(cast(GFileEnumerator*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the file enumerator has been closed.
      Returns: true if the enumerator is closed.
  */
  bool isClosed()
  {
    bool _retval;
    _retval = cast(bool)g_file_enumerator_is_closed(cast(GFileEnumerator*)this._cPtr);
    return _retval;
  }

  /**
      This is a version of [gio.file_enumerator.FileEnumerator.nextFile] that's easier to
      use correctly from C programs.  With [gio.file_enumerator.FileEnumerator.nextFile],
      the gboolean return value signifies "end of iteration or error", which
      requires allocation of a temporary #GError.
      
      In contrast, with this function, a false return from
      [gio.file_enumerator.FileEnumerator.iterate] *always* means
      "error".  End of iteration is signaled by out_info or out_child being null.
      
      Another crucial difference is that the references for out_info and
      out_child are owned by direnum (they are cached as hidden
      properties).  You must not unref them in your own code.  This makes
      memory management significantly easier for C code in combination
      with loops.
      
      Finally, this function optionally allows retrieving a #GFile as
      well.
      
      You must specify at least one of out_info or out_child.
      
      The code pattern for correctly using [gio.file_enumerator.FileEnumerator.iterate] from C
      is:
      
      ```
      direnum = g_file_enumerate_children (file, ...);
      while (TRUE)
        {
          GFileInfo *info;
          if (!g_file_enumerator_iterate (direnum, &info, NULL, cancellable, error))
            goto out;
          if (!info)
            break;
          ... do stuff with "info"; do not unref it! ...
        }
      
      out:
        g_object_unref (direnum); // Note: frees the last info
      ```
  
      Params:
        outInfo = Output location for the next #GFileInfo, or null
        outChild = Output location for the next #GFile, or null
        cancellable = a #GCancellable
      Returns: 
      Throws: [ErrorWrap]
  */
  bool iterate(out gio.file_info.FileInfo outInfo, out gio.file.File outChild, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GFileInfo* _outInfo;
    GFile* _outChild;
    GError *_err;
    _retval = cast(bool)g_file_enumerator_iterate(cast(GFileEnumerator*)this._cPtr, &_outInfo, &_outChild, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    outInfo = new gio.file_info.FileInfo(cast(void*)_outInfo, No.Take);
    outChild = gobject.object.ObjectWrap._getDObject!(gio.file.File)(_outChild, No.Take);
    return _retval;
  }

  /**
      Returns information for the next file in the enumerated object.
      Will block until the information is available. The #GFileInfo
      returned from this function will contain attributes that match the
      attribute string that was passed when the #GFileEnumerator was created.
      
      See the documentation of #GFileEnumerator for information about the
      order of returned files.
      
      On error, returns null and sets error to the error. If the
      enumerator is at the end, null will be returned and error will
      be unset.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: A #GFileInfo or null on error
           or end of enumerator.  Free the returned object with
           [gobject.object.ObjectWrap.unref] when no longer needed.
      Throws: [ErrorWrap]
  */
  gio.file_info.FileInfo nextFile(gio.cancellable.Cancellable cancellable = null)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_enumerator_next_file(cast(GFileEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Request information for a number of files from the enumerator asynchronously.
      When all I/O for the operation is finished the callback will be called with
      the requested information.
      
      See the documentation of #GFileEnumerator for information about the
      order of returned files.
      
      Once the end of the enumerator is reached, or if an error occurs, the
      callback will be called with an empty list. In this case, the previous call
      to [gio.file_enumerator.FileEnumerator.nextFilesAsync] will typically have returned fewer
      than num_files items.
      
      If a request is cancelled the callback will be called with
      [gio.types.IOErrorEnum.Cancelled].
      
      This leads to the following pseudo-code usage:
      ```
      g_autoptr(GFile) dir = get_directory ();
      g_autoptr(GFileEnumerator) enumerator = NULL;
      g_autolist(GFileInfo) files = NULL;
      g_autoptr(GError) local_error = NULL;
      
      enumerator = yield g_file_enumerate_children_async (dir,
                                                          G_FILE_ATTRIBUTE_STANDARD_NAME ","
                                                          G_FILE_ATTRIBUTE_STANDARD_TYPE,
                                                          G_FILE_QUERY_INFO_NONE,
                                                          G_PRIORITY_DEFAULT,
                                                          cancellable,
                                                          …,
                                                          &local_error);
      if (enumerator == NULL)
        g_error ("Error enumerating: %s", local_error->message);
      
      // Loop until no files are returned, either because the end of the enumerator
      // has been reached, or an error was returned.
      do
        {
          files = yield g_file_enumerator_next_files_async (enumerator,
                                                            5,  // number of files to request
                                                            G_PRIORITY_DEFAULT,
                                                            cancellable,
                                                            …,
                                                            &local_error);
      
          // Process the returned files, but don’t assume that exactly 5 were returned.
          for (GList *l = files; l != NULL; l = l->next)
            {
              GFileInfo *info = l->data;
              handle_file_info (info);
            }
        }
      while (files != NULL);
      
      if (local_error != NULL &&
          !g_error_matches (local_error, G_IO_ERROR, G_IO_ERROR_CANCELLED))
        g_error ("Error while enumerating: %s", local_error->message);
      ```
      
      During an async request no other sync and async calls are allowed, and will
      result in [gio.types.IOErrorEnum.Pending] errors.
      
      Any outstanding I/O request with higher priority (lower numerical value) will
      be executed before an outstanding request with lower priority. Default
      priority is [glib.types.PRIORITY_DEFAULT].
  
      Params:
        numFiles = the number of file info objects to request
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void nextFilesAsync(int numFiles, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_enumerator_next_files_async(cast(GFileEnumerator*)this._cPtr, numFiles, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the asynchronous operation started with [gio.file_enumerator.FileEnumerator.nextFilesAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: a #GList of #GFileInfos. You must free the list with
            [glib.list.List.free] and unref the infos with [gobject.object.ObjectWrap.unref] when you're
            done with them.
      Throws: [ErrorWrap]
  */
  gio.file_info.FileInfo[] nextFilesFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_file_enumerator_next_files_finish(cast(GFileEnumerator*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(gio.file_info.FileInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets the file enumerator as having pending operations.
  
      Params:
        pending = a boolean value.
  */
  void setPending(bool pending)
  {
    g_file_enumerator_set_pending(cast(GFileEnumerator*)this._cPtr, pending);
  }
}
