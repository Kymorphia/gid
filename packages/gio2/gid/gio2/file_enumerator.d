/// Module for [FileEnumerator] class
module gid.gio2.file_enumerator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.file;
import gid.gio2.file_info;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.file_enumerator.FileEnumerator] allows you to operate on a set of [gid.gio2.file.File] objects,
    returning a [gid.gio2.file_info.FileInfo] structure for each file enumerated (e.g.
    [gid.gio2.file.File.enumerateChildren] will return a [gid.gio2.file_enumerator.FileEnumerator] for each
    of the children within a directory).
    
    To get the next file's information from a [gid.gio2.file_enumerator.FileEnumerator], use
    [gid.gio2.file_enumerator.FileEnumerator.nextFile] or its asynchronous version,
    [gid.gio2.file_enumerator.FileEnumerator.nextFilesAsync]. Note that the asynchronous
    version will return a list of [gid.gio2.file_info.FileInfo] objects, whereas the
    synchronous will only return the next file in the enumerator.
    
    The ordering of returned files is unspecified for non-Unix
    platforms; for more information, see [gid.glib2.dir.Dir.readName].  On Unix,
    when operating on local files, returned files will be sorted by
    inode number.  Effectively you can assume that the ordering of
    returned files will be stable between successive calls (and
    applications) assuming the directory is unchanged.
    
    If your application needs a specific ordering, such as by name or
    modification time, you will have to implement that in your
    application code.
    
    To close a [gid.gio2.file_enumerator.FileEnumerator], use [gid.gio2.file_enumerator.FileEnumerator.close], or
    its asynchronous version, [gid.gio2.file_enumerator.FileEnumerator.closeAsync]. Once
    a [gid.gio2.file_enumerator.FileEnumerator] is closed, no further actions may be performed
    on it, and it should be freed with [gid.gobject2.object.ObjectWrap.unref].
*/
class FileEnumerator : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_file_enumerator_get_type != &gidSymbolNotFound ? g_file_enumerator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GFileEnumerator";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileEnumerator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.file_enumerator.FileEnumerator]
      Returns: New builder object
  */
  static FileEnumeratorGidBuilder builder() nothrow
  {
    return new FileEnumeratorGidBuilder;
  }

  /**
      Asynchronously closes the file enumerator.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned in
      [gid.gio2.file_enumerator.FileEnumerator.closeFinish].
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCloseAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncCloseAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileEnumeratorClass*)_vfuncClass;
    if (!_klass.closeAsync)
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.closeAsync(cast(GFileEnumerator*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes closing a file enumerator, started from [gid.gio2.file_enumerator.FileEnumerator.closeAsync].
      
      If the file enumerator was already closed when [gid.gio2.file_enumerator.FileEnumerator.closeAsync]
      was called, then this function will report [gid.gio2.types.IOErrorEnum.Closed] in error, and
      return false. If the file enumerator had pending operation when the close
      operation was started, then this function will report [gid.gio2.types.IOErrorEnum.Pending], and
      return false.  If cancellable was not null, then the operation may have been
      cancelled by triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be set, and false will be
      returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the close operation has finished successfully.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCloseFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncCloseFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileEnumeratorClass*)_vfuncClass;
    if (!_klass.closeFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.closeFinish(cast(GFileEnumerator*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  protected bool vfuncCloseFn(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileEnumeratorClass*)_vfuncClass;
    if (!_klass.closeFn)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.closeFn(cast(GFileEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
           [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNextFile` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.file_info.FileInfo vfuncNextFile(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileEnumeratorClass*)_vfuncClass;
    if (!_klass.nextFile)
      return typeof(return).init;

    GFileInfo* _cretval;
    GError *_err;
    _cretval = _klass.nextFile(cast(GFileEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
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
      to [gid.gio2.file_enumerator.FileEnumerator.nextFilesAsync] will typically have returned fewer
      than num_files items.
      
      If a request is cancelled the callback will be called with
      [gid.gio2.types.IOErrorEnum.Cancelled].
      
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
      result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      Any outstanding I/O request with higher priority (lower numerical value) will
      be executed before an outstanding request with lower priority. Default
      priority is [gid.glib2.types.PRIORITY_DEFAULT].
  
      Params:
        numFiles = the number of file info objects to request
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNextFilesAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncNextFilesAsync(int numFiles, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileEnumeratorClass*)_vfuncClass;
    if (!_klass.nextFilesAsync)
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.nextFilesAsync(cast(GFileEnumerator*)this._cPtr, numFiles, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the asynchronous operation started with [gid.gio2.file_enumerator.FileEnumerator.nextFilesAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: a #GList of #GFileInfos. You must free the list with
            [gid.glib2.list.List.free] and unref the infos with [gid.gobject2.object.ObjectWrap.unref] when you're
            done with them.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNextFilesFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gio2.file_info.FileInfo[] vfuncNextFilesFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileEnumeratorClass*)_vfuncClass;
    if (!_klass.nextFilesFinish)
      return typeof(return).init;

    GList* _cretval;
    GError *_err;
    _cretval = _klass.nextFilesFinish(cast(GFileEnumerator*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.file_info.FileInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Releases all resources used by this enumerator, making the
      enumerator return [gid.gio2.types.IOErrorEnum.Closed] on all calls.
      
      This will be automatically called when the last reference
      is dropped, but you might want to call this function to make
      sure resources are released as early as possible.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: #TRUE on success or #FALSE on error.
      Throws: [ErrorWrap]
  */
  bool close(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_enumerator_close(cast(GFileEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously closes the file enumerator.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned in
      [gid.gio2.file_enumerator.FileEnumerator.closeFinish].
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void closeAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_enumerator_close_async(cast(GFileEnumerator*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes closing a file enumerator, started from [gid.gio2.file_enumerator.FileEnumerator.closeAsync].
      
      If the file enumerator was already closed when [gid.gio2.file_enumerator.FileEnumerator.closeAsync]
      was called, then this function will report [gid.gio2.types.IOErrorEnum.Closed] in error, and
      return false. If the file enumerator had pending operation when the close
      operation was started, then this function will report [gid.gio2.types.IOErrorEnum.Pending], and
      return false.  If cancellable was not null, then the operation may have been
      cancelled by triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be set, and false will be
      returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the close operation has finished successfully.
      Throws: [ErrorWrap]
  */
  bool closeFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_enumerator_close_finish(cast(GFileEnumerator*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Return a new #GFile which refers to the file named by info in the source
      directory of enumerator.  This function is primarily intended to be used
      inside loops with [gid.gio2.file_enumerator.FileEnumerator.nextFile].
      
      To use this, [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME] must have been listed in the
      attributes list used when creating the #GFileEnumerator.
      
      This is a convenience method that's equivalent to:
      ```c
        gchar *name = g_file_info_get_name (info);
        GFile *child = g_file_get_child (g_file_enumerator_get_container (enumr),
                                         name);
      ```
  
      Params:
        info = a #GFileInfo gotten from [gid.gio2.file_enumerator.FileEnumerator.nextFile]
            or the async equivalents.
      Returns: a #GFile for the #GFileInfo passed it.
  */
  gid.gio2.file.File getChild(gid.gio2.file_info.FileInfo info) nothrow
  {
    GFile* _cretval;
    _cretval = g_file_enumerator_get_child(cast(GFileEnumerator*)this._cPtr, info ? cast(GFileInfo*)info._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the #GFile container which is being enumerated.
      Returns: the #GFile which is being enumerated.
  */
  gid.gio2.file.File getContainer() nothrow
  {
    GFile* _cretval;
    _cretval = g_file_enumerator_get_container(cast(GFileEnumerator*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if the file enumerator has pending operations.
      Returns: true if the enumerator has pending operations.
  */
  bool hasPending() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_enumerator_has_pending(cast(GFileEnumerator*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the file enumerator has been closed.
      Returns: true if the enumerator is closed.
  */
  bool isClosed() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_enumerator_is_closed(cast(GFileEnumerator*)this._cPtr);
    return _retval;
  }

  /**
      This is a version of [gid.gio2.file_enumerator.FileEnumerator.nextFile] that's easier to
      use correctly from C programs.  With [gid.gio2.file_enumerator.FileEnumerator.nextFile],
      the gboolean return value signifies "end of iteration or error", which
      requires allocation of a temporary #GError.
      
      In contrast, with this function, a false return from
      [gid.gio2.file_enumerator.FileEnumerator.iterate] *always* means
      "error".  End of iteration is signaled by out_info or out_child being null.
      
      Another crucial difference is that the references for out_info and
      out_child are owned by direnum (they are cached as hidden
      properties).  You must not unref them in your own code.  This makes
      memory management significantly easier for C code in combination
      with loops.
      
      Finally, this function optionally allows retrieving a #GFile as
      well.
      
      You must specify at least one of out_info or out_child.
      
      The code pattern for correctly using [gid.gio2.file_enumerator.FileEnumerator.iterate] from C
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
  bool iterate(out gid.gio2.file_info.FileInfo outInfo, out gid.gio2.file.File outChild, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GFileInfo* _outInfo;
    GFile* _outChild;
    GError *_err;
    _retval = cast(bool)g_file_enumerator_iterate(cast(GFileEnumerator*)this._cPtr, &_outInfo, &_outChild, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    outInfo = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(_outInfo, No.Take);
    outChild = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(_outChild, No.Take);
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
           [gid.gobject2.object.ObjectWrap.unref] when no longer needed.
      Throws: [ErrorWrap]
  */
  gid.gio2.file_info.FileInfo nextFile(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_enumerator_next_file(cast(GFileEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
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
      to [gid.gio2.file_enumerator.FileEnumerator.nextFilesAsync] will typically have returned fewer
      than num_files items.
      
      If a request is cancelled the callback will be called with
      [gid.gio2.types.IOErrorEnum.Cancelled].
      
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
      result in [gid.gio2.types.IOErrorEnum.Pending] errors.
      
      Any outstanding I/O request with higher priority (lower numerical value) will
      be executed before an outstanding request with lower priority. Default
      priority is [gid.glib2.types.PRIORITY_DEFAULT].
  
      Params:
        numFiles = the number of file info objects to request
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void nextFilesAsync(int numFiles, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_enumerator_next_files_async(cast(GFileEnumerator*)this._cPtr, numFiles, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the asynchronous operation started with [gid.gio2.file_enumerator.FileEnumerator.nextFilesAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: a #GList of #GFileInfos. You must free the list with
            [gid.glib2.list.List.free] and unref the infos with [gid.gobject2.object.ObjectWrap.unref] when you're
            done with them.
      Throws: [ErrorWrap]
  */
  gid.gio2.file_info.FileInfo[] nextFilesFinish(gid.gio2.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_file_enumerator_next_files_finish(cast(GFileEnumerator*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.file_info.FileInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets the file enumerator as having pending operations.
  
      Params:
        pending = a boolean value.
  */
  void setPending(bool pending) nothrow
  {
    g_file_enumerator_set_pending(cast(GFileEnumerator*)this._cPtr, pending);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from FileEnumerator
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.file_enumerator.FileEnumerator), T.stringof ~ " is not derived from gid.gio2.file_enumerator.FileEnumerator");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseAsync", true)[0]) == gid.gio2.file_enumerator.FileEnumerator))
      static assert(0, "Overriding gid.gio2.file_enumerator.FileEnumerator.vfuncCloseAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseFinish", true)[0]) == gid.gio2.file_enumerator.FileEnumerator))
      _installVfunc(klass, "close_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseFn", true)[0]) == gid.gio2.file_enumerator.FileEnumerator))
      _installVfunc(klass, "close_fn");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNextFile", true)[0]) == gid.gio2.file_enumerator.FileEnumerator))
      _installVfunc(klass, "next_file");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNextFilesAsync", true)[0]) == gid.gio2.file_enumerator.FileEnumerator))
      static assert(0, "Overriding gid.gio2.file_enumerator.FileEnumerator.vfuncNextFilesAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNextFilesFinish", true)[0]) == gid.gio2.file_enumerator.FileEnumerator))
      _installVfunc(klass, "next_files_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GFileEnumeratorClass*)klass;

    switch (vfunc)
    {
      case "close_finish":
      {
        static extern(C) gboolean _vfuncCloseFinishTramp(GFileEnumerator* enumerator, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_enumerator.FileEnumerator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enumerator);
          if (!_obj)
          {
            auto _klass = cast(GFileEnumeratorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enumerator);
            if (_klass.closeFinish)
              return (cast(typeof(&_vfuncCloseFinishTramp))_klass.closeFinish)(enumerator, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCloseFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.closeFinish = cast(typeof(_klass.closeFinish))&_vfuncCloseFinishTramp;
        break;
      }
      case "close_fn":
      {
        static extern(C) gboolean _vfuncCloseFnTramp(GFileEnumerator* enumerator, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_enumerator.FileEnumerator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enumerator);
          if (!_obj)
          {
            auto _klass = cast(GFileEnumeratorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enumerator);
            if (_klass.closeFn)
              return (cast(typeof(&_vfuncCloseFnTramp))_klass.closeFn)(enumerator, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCloseFn(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.closeFn = cast(typeof(_klass.closeFn))&_vfuncCloseFnTramp;
        break;
      }
      case "next_file":
      {
        static extern(C) GFileInfo* _vfuncNextFileTramp(GFileEnumerator* enumerator, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_enumerator.FileEnumerator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enumerator);
          if (!_obj)
          {
            auto _klass = cast(GFileEnumeratorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enumerator);
            if (_klass.nextFile)
              return (cast(typeof(&_vfuncNextFileTramp))_klass.nextFile)(enumerator, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_info.FileInfo _dretval;

          try
          {
            _dretval = _obj.vfuncNextFile(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileInfo*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.nextFile = cast(typeof(_klass.nextFile))&_vfuncNextFileTramp;
        break;
      }
      case "next_files_finish":
      {
        static extern(C) GList* _vfuncNextFilesFinishTramp(GFileEnumerator* enumerator, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.file_enumerator.FileEnumerator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)enumerator);
          if (!_obj)
          {
            auto _klass = cast(GFileEnumeratorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enumerator);
            if (_klass.nextFilesFinish)
              return (cast(typeof(&_vfuncNextFilesFinishTramp))_klass.nextFilesFinish)(enumerator, result, _err);
            return typeof(return).init;
          }

          gid.gio2.file_info.FileInfo[] _dretval;

          try
          {
            _dretval = _obj.vfuncNextFilesFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = gListFromD!(gid.gio2.file_info.FileInfo)(_dretval);

          return _retval;
        }

        _klass.nextFilesFinish = cast(typeof(_klass.nextFilesFinish))&_vfuncNextFilesFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.file_enumerator.FileEnumerator]
class FileEnumeratorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `container` property.
      Params:
        propval = The container that is being enumerated.
      Returns: Builder instance for fluent chaining
  */
  T container(gid.gio2.file.File propval) nothrow
  {
    return setProperty("container", propval);
  }
}

/// Fluent builder for [gid.gio2.file_enumerator.FileEnumerator]
final class FileEnumeratorGidBuilder : FileEnumeratorGidBuilderImpl!FileEnumeratorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileEnumerator build() nothrow
  {
    return new FileEnumerator(cast(void*)createGObject(FileEnumerator._getGType), Yes.Take);
  }
}
