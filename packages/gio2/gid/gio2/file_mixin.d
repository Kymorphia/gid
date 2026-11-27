/// Module for [File] interface mixin
module gid.gio2.file_mixin;

public import gid.core.basictypes;
public import gid.gio2.file;
public import gid.gio2.file_iface_proxy;
public import gid.core.utils;
public import gid.gio2.app_info;
public import gid.gio2.async_result;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.file_attribute_info_list;
public import gid.gio2.file_enumerator;
public import gid.gio2.file_info;
public import gid.gio2.file_input_stream;
public import gid.gio2.file_iostream;
public import gid.gio2.file_monitor;
public import gid.gio2.file_output_stream;
public import gid.gio2.mount;
public import gid.gio2.mount_operation;
public import gid.gio2.types;
public import gid.glib2.bytes;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.closure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.file.File] is a high level abstraction for manipulating files on a
    virtual file system. [gid.gio2.file.File]s are lightweight, immutable objects
    that do no I/O upon creation. It is necessary to understand that
    [gid.gio2.file.File] objects do not represent files, merely an identifier for a
    file. All file content I/O is implemented as streaming operations
    (see [gid.gio2.input_stream.InputStream] and [gid.gio2.output_stream.OutputStream]).
    
    To construct a [gid.gio2.file.File], you can use:
    
    - [gid.gio2.file.File.newForPath] if you have a path.
    - [gid.gio2.file.File.newForUri] if you have a URI.
    - [gid.gio2.file.File.newForCommandlineArg] or
      [gid.gio2.file.File.newForCommandlineArgAndCwd] for a command line
      argument.
    - [gid.gio2.file.File.newTmp] to create a temporary file from a template.
    - [gid.gio2.file.File.newTmpAsync] to asynchronously create a temporary file.
    - [gid.gio2.file.File.newTmpDirAsync] to asynchronously create a temporary
      directory.
    - [gid.gio2.file.File.parseName] from a UTF-8 string gotten from
      [gid.gio2.file.File.getParseName].
    - [gid.gio2.file.File.newBuildFilename] or [gid.gio2.file.File.newBuildFilenamev]
      to create a file from path elements.
    
    One way to think of a [gid.gio2.file.File] is as an abstraction of a pathname. For
    normal files the system pathname is what is stored internally, but as
    [gid.gio2.file.File]s are extensible it could also be something else that corresponds
    to a pathname in a userspace implementation of a filesystem.
    
    [gid.gio2.file.File]s make up hierarchies of directories and files that correspond to
    the files on a filesystem. You can move through the file system with
    [gid.gio2.file.File] using [gid.gio2.file.File.getParent] to get an identifier for the
    parent directory, [gid.gio2.file.File.getChild] to get a child within a
    directory, and [gid.gio2.file.File.resolveRelativePath] to resolve a relative
    path between two [gid.gio2.file.File]s. There can be multiple hierarchies, so you may not
    end up at the same root if you repeatedly call [gid.gio2.file.File.getParent]
    on two different files.
    
    All [gid.gio2.file.File]s have a basename (get with [gid.gio2.file.File.getBasename]). These
    names are byte strings that are used to identify the file on the filesystem
    (relative to its parent directory) and there is no guarantees that they
    have any particular charset encoding or even make any sense at all. If
    you want to use filenames in a user interface you should use the display
    name that you can get by requesting the
    [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME] attribute with
    [gid.gio2.file.File.queryInfo]. This is guaranteed to be in UTF-8 and can be
    used in a user interface. But always store the real basename or the [gid.gio2.file.File]
    to use to actually access the file, because there is no way to go from a
    display name to the actual name.
    
    Using [gid.gio2.file.File] as an identifier has the same weaknesses as using a path
    in that there may be multiple aliases for the same file. For instance,
    hard or soft links may cause two different [gid.gio2.file.File]s to refer to the same
    file. Other possible causes for aliases are: case insensitive filesystems,
    short and long names on FAT/NTFS, or bind mounts in Linux. If you want to
    check if two [gid.gio2.file.File]s point to the same file you can query for the
    [gid.gio2.types.FILE_ATTRIBUTE_ID_FILE] attribute. Note that [gid.gio2.file.File] does some trivial
    canonicalization of pathnames passed in, so that trivial differences in
    the path string used at creation (duplicated slashes, slash at end of
    path, `.` or `..` path segments, etc) does not create different [gid.gio2.file.File]s.
    
    Many [gid.gio2.file.File] operations have both synchronous and asynchronous versions
    to suit your application. Asynchronous versions of synchronous functions
    simply have `_async()` appended to their function names. The asynchronous
    I/O functions call a [gid.gio2.types.AsyncReadyCallback] which is then used to
    finalize the operation, producing a [gid.gio2.async_result.AsyncResult] which is then
    passed to the function’s matching `_finish()` operation.
    
    It is highly recommended to use asynchronous calls when running within a
    shared main loop, such as in the main thread of an application. This avoids
    I/O operations blocking other sources on the main loop from being dispatched.
    Synchronous I/O operations should be performed from worker threads. See the
    [introduction to asynchronous programming section](overview.html#asynchronous-programming)
    for more.
    
    Some [gid.gio2.file.File] operations almost always take a noticeable amount of time, and
    so do not have synchronous analogs. Notable cases include:
    
    - [gid.gio2.file.File.mountMountable] to mount a mountable file.
    - [gid.gio2.file.File.unmountMountableWithOperation] to unmount a mountable
      file.
    - [gid.gio2.file.File.ejectMountableWithOperation] to eject a mountable file.
    
    ## Entity Tags
    
    One notable feature of [gid.gio2.file.File]s are entity tags, or ‘etags’ for
    short. Entity tags are somewhat like a more abstract version of the
    traditional mtime, and can be used to quickly determine if the file
    has been modified from the version on the file system. See the
    description of HTTP ETags in
    [RFC9110](https://www.rfc-editor.org/rfc/rfc9110.html#name-etag).
    [gid.gio2.file.File] Entity Tags are a very similar concept.
*/
template FileT()
{












  /**
      Gets an output stream for appending data to the file.
      If the file doesn't already exist it is created.
      
      By default files created are generally readable by everyone,
      but if you pass [gid.gio2.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level that
      is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      Some file systems don't allow all file names, and may return an
      [gid.gio2.types.IOErrorEnum.InvalidFilename] error. If the file is a directory the
      [gid.gio2.types.IOErrorEnum.IsDirectory] error will be returned. Other errors are
      possible too, and depend on what kind of filesystem the file is on.
  
      Params:
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileOutputStream, or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAppendTo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_output_stream.FileOutputStream vfuncAppendTo(gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.appendTo)
      return typeof(return).init;

    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = _klass.appendTo(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously opens file for appending.
      
      For more details, see [gid.gio2.file.File.appendTo] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.appendToFinish] to get the result
      of the operation.
  
      Params:
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAppendToAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncAppendToAsync(gid.gio2.types.FileCreateFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.appendToAsync)
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
    _klass.appendToAsync(cast(GFile*)this._cPtr, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file append operation started with
      [gid.gio2.file.File.appendToAsync].
  
      Params:
        res = #GAsyncResult
      Returns: a valid #GFileOutputStream
          or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAppendToFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_output_stream.FileOutputStream vfuncAppendToFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.appendToFinish)
      return typeof(return).init;

    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = _klass.appendToFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Copies the file source to the location specified by destination.
      Can not handle recursive copies of directories.
      
      If the flag [gid.gio2.types.FileCopyFlags.Overwrite] is specified an already
      existing destination file is overwritten.
      
      If the flag [gid.gio2.types.FileCopyFlags.NofollowSymlinks] is specified then symlinks
      will be copied as symlinks, otherwise the target of the
      source symlink will be copied.
      
      If the flag [gid.gio2.types.FileCopyFlags.AllMetadata] is specified then all the metadata
      that is possible to copy is copied, not just the default subset (which,
      for instance, does not include the owner, see #GFileInfo).
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      If progress_callback is not null, then the operation can be monitored
      by setting this to a #GFileProgressCallback function.
      progress_callback_data will be passed to this function. It is guaranteed
      that this callback will be called after all data has been transferred with
      the total number of bytes copied during the operation.
      
      If the source file does not exist, then the [gid.gio2.types.IOErrorEnum.NotFound] error
      is returned, independent on the status of the destination.
      
      If [gid.gio2.types.FileCopyFlags.Overwrite] is not specified and the target exists, then
      the error [gid.gio2.types.IOErrorEnum.Exists] is returned.
      
      If trying to overwrite a file over a directory, the [gid.gio2.types.IOErrorEnum.IsDirectory]
      error is returned. If trying to overwrite a directory with a directory the
      [gid.gio2.types.IOErrorEnum.WouldMerge] error is returned.
      
      If the source is a directory and the target does not exist, or
      [gid.gio2.types.FileCopyFlags.Overwrite] is specified and the target is a file, then the
      [gid.gio2.types.IOErrorEnum.WouldRecurse] error is returned.
      
      If you are interested in copying the #GFile object itself (not the on-disk
      file), see [gid.gio2.file.File.dup].
  
      Params:
        destination = destination #GFile
        flags = set of #GFileCopyFlags
        cancellable = optional #GCancellable object,
            null to ignore
        progressCallback = function to callback with
            progress information, or null if progress information is not needed
      Returns: true on success, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCopy`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'progress_callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCopy(gid.gio2.file.File destination, gid.gio2.types.FileCopyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.FileProgressCallback progressCallback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.copy)
      return typeof(return).init;

    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gio2.types.FileProgressCallback*)data;

      try
      {
        (*_dlg)(currentNumBytes, totalNumBytes);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.FileProgressCallback");
      }
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;
    bool _retval;
    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    GError *_err;
    _retval = cast(bool)_klass.copy(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Copies the file source to the location specified by destination
      asynchronously. For details of the behaviour, see [gid.gio2.file.File.copy].
      
      If progress_callback is not null, then that function that will be called
      just like in [gid.gio2.file.File.copy]. The callback will run in the default main context
      of the thread calling [gid.gio2.file.File.copyAsync] — the same context as callback is
      run in.
      
      When the operation is finished, callback will be called. You can then call
      [gid.gio2.file.File.copyFinish] to get the result of the operation.
  
      Params:
        destination = destination #GFile
        flags = set of #GFileCopyFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        progressCallback = function to callback with progress information, or null if
            progress information is not needed
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCopyAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'progress_callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCopyAsync(gid.gio2.file.File destination, gid.gio2.types.FileCopyFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.FileProgressCallback progressCallback = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.copyAsync)
      return;

    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gio2.types.FileProgressCallback*)data;

      try
      {
        (*_dlg)(currentNumBytes, totalNumBytes);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.FileProgressCallback");
      }
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;
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
    auto _progressCallback = progressCallback ? freezeDelegate(cast(void*)&progressCallback) : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.copyAsync(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, _callbackCB, _callback);
  }

  /**
      Finishes copying the file started with [gid.gio2.file.File.copyAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a true on success, false on error.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCopyFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCopyFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.copyFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.copyFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Creates a new file and returns an output stream for writing to it.
      The file must not already exist.
      
      By default files created are generally readable by everyone,
      but if you pass [gid.gio2.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level
      that is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If a file or directory with this name already exists the
      [gid.gio2.types.IOErrorEnum.Exists] error will be returned. Some file systems don't
      allow all file names, and may return an [gid.gio2.types.IOErrorEnum.InvalidFilename]
      error, and if the name is to long [gid.gio2.types.IOErrorEnum.FilenameTooLong] will
      be returned. Other errors are possible too, and depend on what kind
      of filesystem the file is on.
  
      Params:
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileOutputStream for the newly created
          file, or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCreate`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_output_stream.FileOutputStream vfuncCreate(gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.create)
      return typeof(return).init;

    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = _klass.create(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a new file and returns an output stream
      for writing to it. The file must not already exist.
      
      For more details, see [gid.gio2.file.File.create] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.createFinish] to get the result
      of the operation.
  
      Params:
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCreateAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCreateAsync(gid.gio2.types.FileCreateFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.createAsync)
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
    _klass.createAsync(cast(GFile*)this._cPtr, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file create operation started with
      [gid.gio2.file.File.createAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileOutputStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCreateFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_output_stream.FileOutputStream vfuncCreateFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.createFinish)
      return typeof(return).init;

    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = _klass.createFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new file and returns a stream for reading and
      writing to it. The file must not already exist.
      
      By default files created are generally readable by everyone,
      but if you pass [gid.gio2.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level
      that is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If a file or directory with this name already exists, the
      [gid.gio2.types.IOErrorEnum.Exists] error will be returned. Some file systems don't
      allow all file names, and may return an [gid.gio2.types.IOErrorEnum.InvalidFilename]
      error, and if the name is too long, [gid.gio2.types.IOErrorEnum.FilenameTooLong]
      will be returned. Other errors are possible too, and depend on what
      kind of filesystem the file is on.
      
      Note that in many non-local file cases read and write streams are
      not supported, so make sure you really need to do read and write
      streaming, rather than just opening for reading or writing.
  
      Params:
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileIOStream for the newly created
          file, or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCreateReadwrite`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_iostream.FileIOStream vfuncCreateReadwrite(gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.createReadwrite)
      return typeof(return).init;

    GFileIOStream* _cretval;
    GError *_err;
    _cretval = _klass.createReadwrite(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a new file and returns a stream
      for reading and writing to it. The file must not already exist.
      
      For more details, see [gid.gio2.file.File.createReadwrite] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.createReadwriteFinish] to get
      the result of the operation.
  
      Params:
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCreateReadwriteAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCreateReadwriteAsync(gid.gio2.types.FileCreateFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.createReadwriteAsync)
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
    _klass.createReadwriteAsync(cast(GFile*)this._cPtr, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file create operation started with
      [gid.gio2.file.File.createReadwriteAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileIOStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCreateReadwriteFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_iostream.FileIOStream vfuncCreateReadwriteFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.createReadwriteFinish)
      return typeof(return).init;

    GFileIOStream* _cretval;
    GError *_err;
    _cretval = _klass.createReadwriteFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Deletes a file. If the file is a directory, it will only be
      deleted if it is empty. This has the same semantics as [gid.glib2.global.unlink].
      
      If file doesn’t exist, [gid.gio2.types.IOErrorEnum.NotFound] will be returned. This allows
      for deletion to be implemented avoiding
      [time-of-check to time-of-use races](https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use):
      ```
      g_autoptr(GError) local_error = NULL;
      if (!g_file_delete (my_file, my_cancellable, &local_error) &&
          !g_error_matches (local_error, G_IO_ERROR, G_IO_ERROR_NOT_FOUND))
        {
          // deletion failed for some reason other than the file not existing:
          // so report the error
          g_warning ("Failed to delete %s: %s",
                     g_file_peek_path (my_file), local_error->message);
        }
      ```
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the file was deleted. false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDeleteFile`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDeleteFile(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.deleteFile)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.deleteFile(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously delete a file. If the file is a directory, it will
      only be deleted if it is empty.  This has the same semantics as
      [gid.glib2.global.unlink].
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDeleteFileAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncDeleteFileAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.deleteFileAsync)
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
    _klass.deleteFileAsync(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes deleting a file started with [gid.gio2.file.File.deleteAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the file was deleted. false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDeleteFileFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDeleteFileFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.deleteFileFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.deleteFileFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Duplicates a #GFile handle. This operation does not duplicate
      the actual file or directory represented by the #GFile; see
      [gid.gio2.file.File.copy] if attempting to copy a file.
      
      [gid.gio2.file.File.dup] is useful when a second handle is needed to the same underlying
      file, for use in a separate thread (#GFile is not thread-safe). For use
      within the same thread, use [gid.gobject2.object.ObjectWrap.ref_] to increment the existing object’s
      reference count.
      
      This call does no blocking I/O.
      Returns: a new #GFile that is a duplicate
          of the given #GFile.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDup`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file.File vfuncDup()
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.dup)
      return typeof(return).init;

    GFile* _cretval;
    _cretval = _klass.dup(cast(GFile*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Starts an asynchronous eject on a mountable.
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gid.gio2.file.File.ejectMountableFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = flags affecting the operation
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectMountable`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  
      Deprecated: Use [gid.gio2.file.File.ejectMountableWithOperation] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEjectMountable(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.ejectMountable)
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
    _klass.ejectMountable(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous eject operation started by
      [gid.gio2.file.File.ejectMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the file was ejected successfully.
          false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectMountableFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gio2.file.File.ejectMountableWithOperationFinish]
          instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEjectMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.ejectMountableFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.ejectMountableFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Starts an asynchronous eject on a mountable.
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gid.gio2.file.File.ejectMountableWithOperationFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation,
            or null to avoid user interaction
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectMountableWithOperation`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEjectMountableWithOperation(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.ejectMountableWithOperation)
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
    _klass.ejectMountableWithOperation(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous eject operation started by
      [gid.gio2.file.File.ejectMountableWithOperation].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the file was ejected successfully.
          false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEjectMountableWithOperationFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEjectMountableWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.ejectMountableWithOperationFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.ejectMountableWithOperationFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the requested information about the files in a directory.
      The result is a [gid.gio2.file_enumerator.FileEnumerator] object that will give out
      [gid.gio2.file_info.FileInfo] objects for all the files in the directory.
      
      The attributes value is a string that specifies the file
      attributes that should be gathered. It is not an error if
      it's not possible to read a particular requested attribute
      from a file - it just won't be set. attributes should
      be a comma-separated list of attributes or attribute wildcards.
      The wildcard `*` means all attributes, and a wildcard like
      `"standard::*"` means all attributes in the standard namespace.
      An example attribute query be `"standard::*,owner::user"`.
      The standard attributes are available as defines, like
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME]. [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME] should
      always be specified if you plan to call [gid.gio2.file_enumerator.FileEnumerator.getChild] or
      [gid.gio2.file_enumerator.FileEnumerator.iterate] on the returned enumerator.
      
      If cancellable is not `NULL`, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error `errorGio.IOErrorEnum.CANCELLED` will be
      returned.
      
      If the file does not exist, the `errorGio.IOErrorEnum.NOT_FOUND` error will
      be returned. If the file is not a directory, the `errorGio.IOErrorEnum.NOT_DIRECTORY`
      error will be returned. Other errors are possible too.
  
      Params:
        attributes = an attribute query string
        flags = a set of #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: A #GFileEnumerator if successful,
          null on error. Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEnumerateChildren`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_enumerator.FileEnumerator vfuncEnumerateChildren(string attributes, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.enumerateChildren)
      return typeof(return).init;

    GFileEnumerator* _cretval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.enumerateChildren(cast(GFile*)this._cPtr, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_enumerator.FileEnumerator)(cast(GFileEnumerator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the requested information about the files
      in a directory. The result is a #GFileEnumerator object that will
      give out #GFileInfo objects for all the files in the directory.
      
      For more details, see [gid.gio2.file.File.enumerateChildren] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called. You can
      then call [gid.gio2.file.File.enumerateChildrenFinish] to get the result of
      the operation.
  
      Params:
        attributes = an attribute query string
        flags = a set of #GFileQueryInfoFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEnumerateChildrenAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEnumerateChildrenAsync(string attributes, gid.gio2.types.FileQueryInfoFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.enumerateChildrenAsync)
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
    _klass.enumerateChildrenAsync(cast(GFile*)this._cPtr, _attributes, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async enumerate children operation.
      See [gid.gio2.file.File.enumerateChildrenAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileEnumerator or null
          if an error occurred.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEnumerateChildrenFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_enumerator.FileEnumerator vfuncEnumerateChildrenFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.enumerateChildrenFinish)
      return typeof(return).init;

    GFileEnumerator* _cretval;
    GError *_err;
    _cretval = _klass.enumerateChildrenFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_enumerator.FileEnumerator)(cast(GFileEnumerator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if the two given #GFiles refer to the same file.
      
      This function can be used with [gid.gio2.file.File.hash] to insert
      [gid.gio2.file.File]s efficiently in a hash table.
      
      Note that two #GFiles that differ can still refer to the same
      file on the filesystem due to various forms of filename
      aliasing. For local files, this function essentially compares the file paths,
      so two [gid.gio2.file.File]s which point to different hard or soft links will not
      be considered equal, despite pointing to the same content.
      
      For determining whether two files are hardlinked, see
      [gid.gio2.types.FILE_ATTRIBUTE_ID_FILE].
      
      This call does no blocking I/O.
  
      Params:
        file2 = the second #GFile
      Returns: true if file1 and file2 are equal.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEqual`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEqual(gid.gio2.file.File file2)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.equal)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.equal(cast(GFile*)this._cPtr, file2 ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file2)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets a #GMount for the #GFile.
      
      #GMount is returned only for user interesting locations, see
      #GVolumeMonitor. If the #GFileIface for file does not have a #mount,
      error will be set to [gid.gio2.types.IOErrorEnum.NotFound] and null #will be returned.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GMount where the file is located
          or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncFindEnclosingMount`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.mount.Mount vfuncFindEnclosingMount(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.findEnclosingMount)
      return typeof(return).init;

    GMount* _cretval;
    GError *_err;
    _cretval = _klass.findEnclosingMount(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the mount for the file.
      
      For more details, see [gid.gio2.file.File.findEnclosingMount] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.findEnclosingMountFinish] to
      get the result of the operation.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncFindEnclosingMountAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncFindEnclosingMountAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.findEnclosingMountAsync)
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
    _klass.findEnclosingMountAsync(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous find mount request.
      See [gid.gio2.file.File.findEnclosingMountAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: #GMount for given file or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncFindEnclosingMountFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.mount.Mount vfuncFindEnclosingMountFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.findEnclosingMountFinish)
      return typeof(return).init;

    GMount* _cretval;
    GError *_err;
    _cretval = _klass.findEnclosingMountFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the base name (the last component of the path) for a given #GFile.
      
      If called for the top level of a system (such as the filesystem root
      or a uri like sftp://host/) it will return a single directory separator
      (and on Windows, possibly a drive letter).
      
      The base name is a byte string (not UTF-8). It has no defined encoding
      or rules other than it may not contain zero bytes.  If you want to use
      filenames in a user interface you should use the display name that you
      can get by requesting the [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME]
      attribute with [gid.gio2.file.File.queryInfo].
      
      This call does no blocking I/O.
      Returns: string containing the #GFile's
          base name, or null if given #GFile is invalid. The returned string
          should be freed with [gid.glib2.global.gfree] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetBasename`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetBasename()
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.getBasename)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getBasename(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the child of file for a given display_name (i.e. a UTF-8
      version of the name). If this function fails, it returns null
      and error will be set. This is very useful when constructing a
      #GFile for a new file and the user entered the filename in the
      user interface, for instance when you select a directory and
      type a filename in the file selector.
      
      This call does no blocking I/O.
  
      Params:
        displayName = string to a possible child
      Returns: a #GFile to the specified child, or
          null if the display name couldn't be converted.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetChildForDisplayName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file.File vfuncGetChildForDisplayName(string displayName)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.getChildForDisplayName)
      return typeof(return).init;

    GFile* _cretval;
    const(char)* _displayName = displayName.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.getChildForDisplayName(cast(GFile*)this._cPtr, _displayName, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the parent directory for the file.
      If the file represents the root directory of the
      file system, then null will be returned.
      
      This call does no blocking I/O.
      Returns: a #GFile structure to the
          parent of the given #GFile or null if there is no parent. Free
          the returned object with [gid.gobject2.object.ObjectWrap.unref].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetParent`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file.File vfuncGetParent()
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.getParent)
      return typeof(return).init;

    GFile* _cretval;
    _cretval = _klass.getParent(cast(GFile*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the parse name of the file.
      A parse name is a UTF-8 string that describes the
      file such that one can get the #GFile back using
      [gid.gio2.file.File.parseName].
      
      This is generally used to show the #GFile as a nice
      full-pathname kind of string in a user interface,
      like in a location entry.
      
      For local files with names that can safely be converted
      to UTF-8 the pathname is used, otherwise the IRI is used
      (a form of URI that allows UTF-8 characters unescaped).
      
      This call does no blocking I/O.
      Returns: a string containing the #GFile's parse name.
          The returned string should be freed with [gid.glib2.global.gfree]
          when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetParseName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetParseName()
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.getParseName)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getParseName(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the local pathname for #GFile, if one exists. If non-null, this is
      guaranteed to be an absolute, canonical path. It might contain symlinks.
      
      This call does no blocking I/O.
      Returns: string containing the #GFile's path,
          or null if no such path exists. The returned string should be freed
          with [gid.glib2.global.gfree] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetPath`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetPath()
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.getPath)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getPath(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the path for descendant relative to parent.
      
      This call does no blocking I/O.
  
      Params:
        descendant = input #GFile
      Returns: string with the relative path from
          descendant to parent, or null if descendant doesn't have parent as
          prefix. The returned string should be freed with [gid.glib2.global.gfree] when
          no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRelativePath`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetRelativePath(gid.gio2.file.File descendant)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.getRelativePath)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getRelativePath(cast(GFile*)this._cPtr, descendant ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)descendant)._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the URI for the file.
      
      This call does no blocking I/O.
      Returns: a string containing the #GFile's URI. If the #GFile was constructed
          with an invalid URI, an invalid URI is returned.
          The returned string should be freed with [gid.glib2.global.gfree]
          when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetUri`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetUri()
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.getUri)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getUri(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the URI scheme for a #GFile.
      RFC 3986 decodes the scheme as:
      ```
      URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ]
      ```
      Common schemes include "file", "http", "ftp", etc.
      
      The scheme can be different from the one used to construct the #GFile,
      in that it might be replaced with one that is logically equivalent to the #GFile.
      
      This call does no blocking I/O.
      Returns: a string containing the URI scheme for the given
          #GFile or null if the #GFile was constructed with an invalid URI. The
          returned string should be freed with [gid.glib2.global.gfree] when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetUriScheme`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetUriScheme()
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.getUriScheme)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getUriScheme(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Checks to see if a #GFile has a given URI scheme.
      
      This call does no blocking I/O.
  
      Params:
        uriScheme = a string containing a URI scheme
      Returns: true if #GFile's backend supports the
          given URI scheme, false if URI scheme is null,
          not supported, or #GFile is invalid.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncHasUriScheme`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncHasUriScheme(string uriScheme)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.hasUriScheme)
      return typeof(return).init;

    bool _retval;
    const(char)* _uriScheme = uriScheme.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.hasUriScheme(cast(GFile*)this._cPtr, _uriScheme);
    return _retval;
  }

  /**
      Creates a hash value for a #GFile.
      
      This call does no blocking I/O.
      Returns: 0 if file is not a valid #GFile, otherwise an
          integer that can be used as hash value for the #GFile.
          This function is intended for easily hashing a #GFile to
          add to a #GHashTable or similar data structure.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncHash`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected uint vfuncHash()
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.hash)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.hash(cast(GFile*)this._cPtr);
    return _retval;
  }

  /**
      Checks to see if a file is native to the platform.
      
      A native file is one expressed in the platform-native filename format,
      e.g. "C:\Windows" or "/usr/bin/". This does not mean the file is local,
      as it might be on a locally mounted remote filesystem.
      
      On some systems non-native files may be available using the native
      filesystem via a userspace filesystem (FUSE), in these cases this call
      will return false, but [gid.gio2.file.File.getPath] will still return a native path.
      
      This call does no blocking I/O.
      Returns: true if file is native
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsNative`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsNative()
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.isNative)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isNative(cast(GFile*)this._cPtr);
    return _retval;
  }

  /**
      Creates a directory.
      
      Note that this will only create a child directory
      of the immediate parent directory of the path or URI given by the #GFile.
      To recursively create directories, see [gid.gio2.file.File.makeDirectoryWithParents].
      
      This function will fail if the parent directory does not exist, setting
      error to [gid.gio2.types.IOErrorEnum.NotFound]. If the file system doesn't support
      creating directories, this function will fail, setting error to
      [gid.gio2.types.IOErrorEnum.NotSupported]. If the directory already exists,
      `errorGio.IOErrorEnum.EXISTS` will be returned.
      
      For a local #GFile the newly created directory will have the default
      (current) ownership and permissions of the current process.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true on successful creation, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMakeDirectory`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMakeDirectory(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.makeDirectory)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.makeDirectory(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a directory.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMakeDirectoryAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncMakeDirectoryAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.makeDirectoryAsync)
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
    _klass.makeDirectoryAsync(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous directory creation, started with
      [gid.gio2.file.File.makeDirectoryAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful directory creation, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMakeDirectoryFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMakeDirectoryFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.makeDirectoryFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.makeDirectoryFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Creates a symbolic link named file which contains the string
      symlink_value.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        symlinkValue = a string with the path for the target
            of the new symlink
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true on the creation of a new symlink, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMakeSymbolicLink`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMakeSymbolicLink(string symlinkValue, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.makeSymbolicLink)
      return typeof(return).init;

    bool _retval;
    const(char)* _symlinkValue = symlinkValue.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.makeSymbolicLink(cast(GFile*)this._cPtr, _symlinkValue, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a symbolic link named file which contains the
      string symlink_value.
  
      Params:
        symlinkValue = a string with the path for the target
            of the new symlink
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMakeSymbolicLinkAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncMakeSymbolicLinkAsync(string symlinkValue, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.makeSymbolicLinkAsync)
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
    const(char)* _symlinkValue = symlinkValue.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.makeSymbolicLinkAsync(cast(GFile*)this._cPtr, _symlinkValue, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous symbolic link creation, started with
      [gid.gio2.file.File.makeSymbolicLinkAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful directory creation, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMakeSymbolicLinkFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMakeSymbolicLinkFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.makeSymbolicLinkFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.makeSymbolicLinkFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Recursively measures the disk usage of file.
      
      This is essentially an analog of the 'du' command, but it also
      reports the number of directories and non-directory files encountered
      (including things like symbolic links).
      
      By default, errors are only reported against the toplevel file
      itself.  Errors found while recursing are silently ignored, unless
      [gid.gio2.types.FileMeasureFlags.ReportAnyError] is given in flags.
      
      The returned size, disk_usage, is in bytes and should be formatted
      with [gid.glib2.global.formatSize] in order to get something reasonable for showing
      in a user interface.
      
      progress_callback and progress_data can be given to request
      periodic progress updates while scanning.  See the documentation for
      #GFileMeasureProgressCallback for information about when and how the
      callback will be invoked.
  
      Params:
        flags = #GFileMeasureFlags
        cancellable = optional #GCancellable
        progressCallback = a #GFileMeasureProgressCallback
        diskUsage = the number of bytes of disk space used
        numDirs = the number of directories encountered
        numFiles = the number of non-directories encountered
      Returns: true if successful, with the out parameters set.
          false otherwise, with error set.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMeasureDiskUsage`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'progress_callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMeasureDiskUsage(gid.gio2.types.FileMeasureFlags flags, gid.gio2.cancellable.Cancellable cancellable, gid.gio2.types.FileMeasureProgressCallback progressCallback, out ulong diskUsage, out ulong numDirs, out ulong numFiles)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.measureDiskUsage)
      return typeof(return).init;

    extern(C) void _progressCallbackCallback(gboolean reporting, ulong currentSize, ulong numDirs, ulong numFiles, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gio2.types.FileMeasureProgressCallback*)data;

      try
      {
        (*_dlg)(cast(bool)reporting, currentSize, numDirs, numFiles);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.FileMeasureProgressCallback");
      }
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;
    bool _retval;
    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    GError *_err;
    _retval = cast(bool)_klass.measureDiskUsage(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, cast(ulong*)&diskUsage, cast(ulong*)&numDirs, cast(ulong*)&numFiles, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Collects the results from an earlier call to
      [gid.gio2.file.File.measureDiskUsageAsync].  See [gid.gio2.file.File.measureDiskUsage] for
      more information.
  
      Params:
        result = the #GAsyncResult passed to your #GAsyncReadyCallback
        diskUsage = the number of bytes of disk space used
        numDirs = the number of directories encountered
        numFiles = the number of non-directories encountered
      Returns: true if successful, with the out parameters set.
          false otherwise, with error set.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMeasureDiskUsageFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMeasureDiskUsageFinish(gid.gio2.async_result.AsyncResult result, out ulong diskUsage, out ulong numDirs, out ulong numFiles)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.measureDiskUsageFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.measureDiskUsageFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(ulong*)&diskUsage, cast(ulong*)&numDirs, cast(ulong*)&numFiles, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Obtains a directory monitor for the given file.
      This may fail if directory monitoring is not supported.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      It does not make sense for flags to contain
      [gid.gio2.types.FileMonitorFlags.WatchHardLinks], since hard links can not be made to
      directories.  It is not possible to monitor all the files in a
      directory for changes made via hard links; if you want to do this then
      you must register individual watches with [gid.gio2.file.File.monitor].
  
      Params:
        flags = a set of #GFileMonitorFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileMonitor for the given file,
          or null on error. Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMonitorDir`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_monitor.FileMonitor vfuncMonitorDir(gid.gio2.types.FileMonitorFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.monitorDir)
      return typeof(return).init;

    GFileMonitor* _cretval;
    GError *_err;
    _cretval = _klass.monitorDir(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_monitor.FileMonitor)(cast(GFileMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains a file monitor for the given file. If no file notification
      mechanism exists, then regular polling of the file is used.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      If flags contains [gid.gio2.types.FileMonitorFlags.WatchHardLinks] then the monitor
      will also attempt to report changes made to the file via another
      filename (ie, a hard link). Without this flag, you can only rely on
      changes made through the filename contained in file to be
      reported. Using this flag may result in an increase in resource
      usage, and may not have any effect depending on the #GFileMonitor
      backend and/or filesystem type.
  
      Params:
        flags = a set of #GFileMonitorFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileMonitor for the given file,
          or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMonitorFile`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_monitor.FileMonitor vfuncMonitorFile(gid.gio2.types.FileMonitorFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.monitorFile)
      return typeof(return).init;

    GFileMonitor* _cretval;
    GError *_err;
    _cretval = _klass.monitorFile(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_monitor.FileMonitor)(cast(GFileMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Starts a mount_operation, mounting the volume that contains
      the file location.
      
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gid.gio2.file.File.mountEnclosingVolumeFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation
            or null to avoid user interaction
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied, or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMountEnclosingVolume`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncMountEnclosingVolume(gid.gio2.types.MountMountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.mountEnclosingVolume)
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
    _klass.mountEnclosingVolume(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a mount operation started by [gid.gio2.file.File.mountEnclosingVolume].
  
      Params:
        result = a #GAsyncResult
      Returns: true if successful. If an error has occurred,
          this function will return false and set error
          appropriately if present.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMountEnclosingVolumeFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMountEnclosingVolumeFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.mountEnclosingVolumeFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.mountEnclosingVolumeFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Mounts a file of type G_FILE_TYPE_MOUNTABLE.
      Using mount_operation, you can request callbacks when, for instance,
      passwords are needed during authentication.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.mountMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation,
            or null to avoid user interaction
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMountMountable`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncMountMountable(gid.gio2.types.MountMountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.mountMountable)
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
    _klass.mountMountable(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a mount operation. See [gid.gio2.file.File.mountMountable] for details.
      
      Finish an asynchronous mount operation that was started
      with [gid.gio2.file.File.mountMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GFile or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMountMountableFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file.File vfuncMountMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.mountMountableFinish)
      return typeof(return).init;

    GFile* _cretval;
    GError *_err;
    _cretval = _klass.mountMountableFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tries to move the file or directory source to the location specified
      by destination. If native move operations are supported then this is
      used, otherwise a copy + delete fallback is used. The native
      implementation may support moving directories (for instance on moves
      inside the same filesystem), but the fallback code does not.
      
      If the flag [gid.gio2.types.FileCopyFlags.Overwrite] is specified an already
      existing destination file is overwritten.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      If progress_callback is not null, then the operation can be monitored
      by setting this to a #GFileProgressCallback function.
      progress_callback_data will be passed to this function. It is
      guaranteed that this callback will be called after all data has been
      transferred with the total number of bytes copied during the operation.
      
      If the source file does not exist, then the [gid.gio2.types.IOErrorEnum.NotFound]
      error is returned, independent on the status of the destination.
      
      If [gid.gio2.types.FileCopyFlags.Overwrite] is not specified and the target exists,
      then the error [gid.gio2.types.IOErrorEnum.Exists] is returned.
      
      If trying to overwrite a file over a directory, the [gid.gio2.types.IOErrorEnum.IsDirectory]
      error is returned. If trying to overwrite a directory with a directory the
      [gid.gio2.types.IOErrorEnum.WouldMerge] error is returned.
      
      If the source is a directory and the target does not exist, or
      [gid.gio2.types.FileCopyFlags.Overwrite] is specified and the target is a file, then
      the [gid.gio2.types.IOErrorEnum.WouldRecurse] error may be returned (if the native
      move operation isn't available).
  
      Params:
        destination = #GFile pointing to the destination location
        flags = set of #GFileCopyFlags
        cancellable = optional #GCancellable object,
            null to ignore
        progressCallback = #GFileProgressCallback
            function for updates
      Returns: true on successful move, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMove`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'progress_callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMove(gid.gio2.file.File destination, gid.gio2.types.FileCopyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.FileProgressCallback progressCallback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.move)
      return typeof(return).init;

    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gio2.types.FileProgressCallback*)data;

      try
      {
        (*_dlg)(currentNumBytes, totalNumBytes);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.FileProgressCallback");
      }
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;
    bool _retval;
    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    GError *_err;
    _retval = cast(bool)_klass.move(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously moves a file source to the location of destination. For details of the behaviour, see [gid.gio2.file.File.move].
      
      If progress_callback is not null, then that function that will be called
      just like in [gid.gio2.file.File.move]. The callback will run in the default main context
      of the thread calling [gid.gio2.file.File.moveAsync] — the same context as callback is
      run in.
      
      When the operation is finished, callback will be called. You can then call
      [gid.gio2.file.File.moveFinish] to get the result of the operation.
  
      Params:
        destination = #GFile pointing to the destination location
        flags = set of #GFileCopyFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        progressCallback = #GFileProgressCallback function for updates
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMoveAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'progress_callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncMoveAsync(gid.gio2.file.File destination, gid.gio2.types.FileCopyFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.FileProgressCallback progressCallback = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.moveAsync)
      return;

    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gio2.types.FileProgressCallback*)data;

      try
      {
        (*_dlg)(currentNumBytes, totalNumBytes);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.FileProgressCallback");
      }
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;
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
    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.moveAsync(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file movement, started with
      [gid.gio2.file.File.moveAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful file move, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncMoveFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncMoveFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.moveFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.moveFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Opens an existing file for reading and writing. The result is
      a #GFileIOStream that can be used to read and write the contents
      of the file.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If the file does not exist, the [gid.gio2.types.IOErrorEnum.NotFound] error will
      be returned. If the file is a directory, the [gid.gio2.types.IOErrorEnum.IsDirectory]
      error will be returned. Other errors are possible too, and depend on
      what kind of filesystem the file is on. Note that in many non-local
      file cases read and write streams are not supported, so make sure you
      really need to do read and write streaming, rather than just opening
      for reading or writing.
  
      Params:
        cancellable = a #GCancellable
      Returns: #GFileIOStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncOpenReadwrite`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_iostream.FileIOStream vfuncOpenReadwrite(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.openReadwrite)
      return typeof(return).init;

    GFileIOStream* _cretval;
    GError *_err;
    _cretval = _klass.openReadwrite(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously opens file for reading and writing.
      
      For more details, see [gid.gio2.file.File.openReadwrite] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.openReadwriteFinish] to get
      the result of the operation.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncOpenReadwriteAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncOpenReadwriteAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.openReadwriteAsync)
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
    _klass.openReadwriteAsync(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file read operation started with
      [gid.gio2.file.File.openReadwriteAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileIOStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncOpenReadwriteFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_iostream.FileIOStream vfuncOpenReadwriteFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.openReadwriteFinish)
      return typeof(return).init;

    GFileIOStream* _cretval;
    GError *_err;
    _cretval = _klass.openReadwriteFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Polls a file of type [gid.gio2.types.FileType.Mountable].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.mountMountableFinish] to get
      the result of the operation.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied, or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPollMountable`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncPollMountable(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.pollMountable)
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
    _klass.pollMountable(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a poll operation. See [gid.gio2.file.File.pollMountable] for details.
      
      Finish an asynchronous poll operation that was polled
      with [gid.gio2.file.File.pollMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully. false
        otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPollMountableFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncPollMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.pollMountableFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.pollMountableFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Checks whether file has the prefix specified by prefix.
      
      In other words, if the names of initial elements of file's
      pathname match prefix. Only full pathname elements are matched,
      so a path like /foo is not considered a prefix of /foobar, only
      of /foo/bar.
      
      A #GFile is not a prefix of itself. If you want to check for
      equality, use [gid.gio2.file.File.equal].
      
      This call does no I/O, as it works purely on names. As such it can
      sometimes return false even if file is inside a prefix (from a
      filesystem point of view), because the prefix of file is an alias
      of prefix.
  
      Params:
        file = input #GFile
      Returns: true if the file's parent, grandparent, etc is prefix,
          false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPrefixMatches`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncPrefixMatches(gid.gio2.file.File file)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.prefixMatches)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.prefixMatches(cast(GFile*)this._cPtr, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Utility function to check if a particular file exists.
      
      The fallback implementation of this API is using [gid.gio2.file.File.queryInfo]
      and therefore may do blocking I/O. To asynchronously query the existence
      of a file, use [gid.gio2.file.File.queryInfoAsync].
      
      Note that in many cases it is [racy to first check for file existence](https://en.wikipedia.org/wiki/Time_of_check_to_time_of_use)
      and then execute something based on the outcome of that, because the
      file might have been created or removed in between the operations. The
      general approach to handling that is to not check, but just do the
      operation and handle the errors as they come.
      
      As an example of race-free checking, take the case of reading a file,
      and if it doesn't exist, creating it. There are two racy versions: read
      it, and on error create it; and: check if it exists, if not create it.
      These can both result in two processes creating the file (with perhaps
      a partially written file as the result). The correct approach is to
      always try to create the file with [gid.gio2.file.File.create] which will either
      atomically create the file or fail with a [gid.gio2.types.IOErrorEnum.Exists] error.
      
      However, in many cases an existence check is useful in a user interface,
      for instance to make a menu item sensitive/insensitive, so that you don't
      have to fool users that something is possible and then just show an error
      dialog. If you do this, you should make sure to also handle the errors
      that can happen due to races when you execute the operation.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the file exists (and can be detected without error),
          false otherwise (or if cancelled).
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncQueryExists`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncQueryExists(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.queryExists)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.queryExists(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Similar to [gid.gio2.file.File.queryInfo], but obtains information
      about the filesystem the file is on, rather than the file itself.
      For instance the amount of space available and the type of
      the filesystem.
      
      The attributes value is a string that specifies the attributes
      that should be gathered. It is not an error if it's not possible
      to read a particular requested attribute from a file - it just
      won't be set. attributes should be a comma-separated list of
      attributes or attribute wildcards. The wildcard "\*" means all
      attributes, and a wildcard like "filesystem::*" means all attributes
      in the filesystem namespace. The standard namespace for filesystem
      attributes is "filesystem". Common attributes of interest are
      [gid.gio2.types.FILE_ATTRIBUTE_FILESYSTEM_SIZE] (the total size of the filesystem
      in bytes), [gid.gio2.types.FILE_ATTRIBUTE_FILESYSTEM_FREE] (number of bytes available),
      and [gid.gio2.types.FILE_ATTRIBUTE_FILESYSTEM_TYPE] (type of the filesystem).
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If the file does not exist, the [gid.gio2.types.IOErrorEnum.NotFound] error will
      be returned. Other errors are possible too, and depend on what
      kind of filesystem the file is on.
  
      Params:
        attributes = an attribute query string
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileInfo or null if there was an error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncQueryFilesystemInfo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_info.FileInfo vfuncQueryFilesystemInfo(string attributes, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.queryFilesystemInfo)
      return typeof(return).init;

    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.queryFilesystemInfo(cast(GFile*)this._cPtr, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the requested information about the filesystem
      that the specified file is on. The result is a #GFileInfo object
      that contains key-value attributes (such as type or size for the
      file).
      
      For more details, see [gid.gio2.file.File.queryFilesystemInfo] which is the
      synchronous version of this call.
      
      When the operation is finished, callback will be called. You can
      then call [gid.gio2.file.File.queryInfoFinish] to get the result of the
      operation.
  
      Params:
        attributes = an attribute query string
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncQueryFilesystemInfoAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncQueryFilesystemInfoAsync(string attributes, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.queryFilesystemInfoAsync)
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
    _klass.queryFilesystemInfoAsync(cast(GFile*)this._cPtr, _attributes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous filesystem info query.
      See [gid.gio2.file.File.queryFilesystemInfoAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: #GFileInfo for given file
          or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncQueryFilesystemInfoFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_info.FileInfo vfuncQueryFilesystemInfoFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.queryFilesystemInfoFinish)
      return typeof(return).init;

    GFileInfo* _cretval;
    GError *_err;
    _cretval = _klass.queryFilesystemInfoFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the requested information about specified file.
      
      The result is a [gid.gio2.file_info.FileInfo] object that contains key-value
      attributes (such as the type or size of the file).
      
      The attributes value is a string that specifies the file
      attributes that should be gathered. It is not an error if
      it’s not possible to read a particular requested attribute
      from a file — it just won't be set. In particular this means that if a file
      is inaccessible (due to being in a folder with restrictive permissions), for
      example, you can expect the returned [gid.gio2.file_info.FileInfo] to have very few
      attributes set. You should check whether an attribute is set using
      [gid.gio2.file_info.FileInfo.hasAttribute] before trying to retrieve its value.
      
      It is guaranteed that if any of the following attributes are listed in
      attributes, they will always be set in the returned [gid.gio2.file_info.FileInfo],
      even if the user doesn’t have permissions to access the file:
      
       - [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME]
       - [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME]
      
      attributes should be a comma-separated list of attributes or attribute
      wildcards. The wildcard `"\*"` means all attributes, and a wildcard like
      `"standard::*"` means all attributes in the standard namespace.
      An example attribute query might be `"standard::*,owner::user"`.
      The standard attributes are available as defines, like
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME].
      
      If cancellable is not `NULL`, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error `errorGio.IOErrorEnum.CANCELLED` will be
      returned.
      
      For symlinks, normally the information about the target of the
      symlink is returned, rather than information about the symlink
      itself. However if you pass `flagsGio.FileQueryInfoFlags.NOFOLLOW_SYMLINKS`
      in flags the information about the symlink itself will be returned.
      Also, for symlinks that point to non-existing files the information
      about the symlink itself will be returned.
      
      If the file does not exist, the `errorGio.IOErrorEnum.NOT_FOUND` error will be
      returned. Other errors are possible too, and depend on what kind of
      file system the file is on.
  
      Params:
        attributes = an attribute query string
        flags = flags to affect the query operation
        cancellable = optional cancellable object
      Returns: a [gid.gio2.file_info.FileInfo] for the given file
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncQueryInfo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_info.FileInfo vfuncQueryInfo(string attributes, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.queryInfo)
      return typeof(return).init;

    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.queryInfo(cast(GFile*)this._cPtr, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the requested information about specified file.
      The result is a #GFileInfo object that contains key-value attributes
      (such as type or size for the file).
      
      For more details, see [gid.gio2.file.File.queryInfo] which is the synchronous
      version of this call.
      
      When the operation is finished, callback will be called. You can
      then call [gid.gio2.file.File.queryInfoFinish] to get the result of the operation.
  
      Params:
        attributes = an attribute query string
        flags = a set of #GFileQueryInfoFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncQueryInfoAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncQueryInfoAsync(string attributes, gid.gio2.types.FileQueryInfoFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.queryInfoAsync)
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
    _klass.queryInfoAsync(cast(GFile*)this._cPtr, _attributes, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file info query.
      See [gid.gio2.file.File.queryInfoAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: #GFileInfo for given file
          or null on error. Free the returned object with
          [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncQueryInfoFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_info.FileInfo vfuncQueryInfoFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.queryInfoFinish)
      return typeof(return).init;

    GFileInfo* _cretval;
    GError *_err;
    _cretval = _klass.queryInfoFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtain the list of settable attributes for the file.
      
      Returns the type and full attribute name of all the attributes
      that can be set on this file. This doesn't mean setting it will
      always succeed though, you might get an access failure, or some
      specific file may not support a specific attribute.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileAttributeInfoList describing the settable attributes.
          When you are done with it, release it with
          [gid.gio2.file_attribute_info_list.FileAttributeInfoList.unref]
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncQuerySettableAttributes`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_attribute_info_list.FileAttributeInfoList vfuncQuerySettableAttributes(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.querySettableAttributes)
      return typeof(return).init;

    GFileAttributeInfoList* _cretval;
    GError *_err;
    _cretval = _klass.querySettableAttributes(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.gio2.file_attribute_info_list.FileAttributeInfoList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Obtain the list of attribute namespaces where new attributes
      can be created by a user. An example of this is extended
      attributes (in the "xattr" namespace).
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileAttributeInfoList describing the writable namespaces.
          When you are done with it, release it with
          [gid.gio2.file_attribute_info_list.FileAttributeInfoList.unref]
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncQueryWritableNamespaces`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_attribute_info_list.FileAttributeInfoList vfuncQueryWritableNamespaces(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.queryWritableNamespaces)
      return typeof(return).init;

    GFileAttributeInfoList* _cretval;
    GError *_err;
    _cretval = _klass.queryWritableNamespaces(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.gio2.file_attribute_info_list.FileAttributeInfoList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asynchronously opens file for reading.
      
      For more details, see [gid.gio2.file.File.read] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.readFinish] to get the result
      of the operation.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReadAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncReadAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.readAsync)
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
    _klass.readAsync(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file read operation started with
      [gid.gio2.file.File.readAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileInputStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReadFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_input_stream.FileInputStream vfuncReadFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.readFinish)
      return typeof(return).init;

    GFileInputStream* _cretval;
    GError *_err;
    _cretval = _klass.readFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_input_stream.FileInputStream)(cast(GFileInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Opens a file for reading. The result is a #GFileInputStream that
      can be used to read the contents of the file.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      If the file does not exist, the [gid.gio2.types.IOErrorEnum.NotFound] error will be
      returned. If the file is a directory, the [gid.gio2.types.IOErrorEnum.IsDirectory]
      error will be returned. Other errors are possible too, and depend
      on what kind of filesystem the file is on.
  
      Params:
        cancellable = a #GCancellable
      Returns: #GFileInputStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReadFn`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_input_stream.FileInputStream vfuncReadFn(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.readFn)
      return typeof(return).init;

    GFileInputStream* _cretval;
    GError *_err;
    _cretval = _klass.readFn(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_input_stream.FileInputStream)(cast(GFileInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns an output stream for overwriting the file, possibly
      creating a backup copy of the file first. If the file doesn't exist,
      it will be created.
      
      This will try to replace the file in the safest way possible so
      that any errors during the writing will not affect an already
      existing copy of the file. For instance, for local files it
      may write to a temporary file and then atomically rename over
      the destination when the stream is closed.
      
      By default files created are generally readable by everyone,
      but if you pass [gid.gio2.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level that
      is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If you pass in a non-null etag value and file already exists, then
      this value is compared to the current entity tag of the file, and if
      they differ an [gid.gio2.types.IOErrorEnum.WrongEtag] error is returned. This
      generally means that the file has been changed since you last read
      it. You can get the new etag from [gid.gio2.file_output_stream.FileOutputStream.getEtag]
      after you've finished writing and closed the #GFileOutputStream. When
      you load a new file you can use [gid.gio2.file_input_stream.FileInputStream.queryInfo] to
      get the etag of the file.
      
      If make_backup is true, this function will attempt to make a
      backup of the current file before overwriting it. If this fails
      a [gid.gio2.types.IOErrorEnum.CantCreateBackup] error will be returned. If you
      want to replace anyway, try again with make_backup set to false.
      
      If the file is a directory the [gid.gio2.types.IOErrorEnum.IsDirectory] error will
      be returned, and if the file is some other form of non-regular file
      then a [gid.gio2.types.IOErrorEnum.NotRegularFile] error will be returned. Some
      file systems don't allow all file names, and may return an
      [gid.gio2.types.IOErrorEnum.InvalidFilename] error, and if the name is to long
      [gid.gio2.types.IOErrorEnum.FilenameTooLong] will be returned. Other errors are
      possible too, and depend on what kind of filesystem the file is on.
  
      Params:
        etag = an optional [entity tag](#entity-tags)
            for the current #GFile, or #NULL to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileOutputStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReplace`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_output_stream.FileOutputStream vfuncReplace(string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.replace)
      return typeof(return).init;

    GFileOutputStream* _cretval;
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = _klass.replace(cast(GFile*)this._cPtr, _etag, makeBackup, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously overwrites the file, replacing the contents,
      possibly creating a backup copy of the file first.
      
      For more details, see [gid.gio2.file.File.replace] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.replaceFinish] to get the result
      of the operation.
  
      Params:
        etag = an [entity tag](#entity-tags) for the current #GFile,
            or null to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReplaceAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncReplaceAsync(string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.replaceAsync)
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
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.replaceAsync(cast(GFile*)this._cPtr, _etag, makeBackup, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file replace operation started with
      [gid.gio2.file.File.replaceAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileOutputStream, or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReplaceFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_output_stream.FileOutputStream vfuncReplaceFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.replaceFinish)
      return typeof(return).init;

    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = _klass.replaceFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns an output stream for overwriting the file in readwrite mode,
      possibly creating a backup copy of the file first. If the file doesn't
      exist, it will be created.
      
      For details about the behaviour, see [gid.gio2.file.File.replace] which does the
      same thing but returns an output stream only.
      
      Note that in many non-local file cases read and write streams are not
      supported, so make sure you really need to do read and write streaming,
      rather than just opening for reading or writing.
  
      Params:
        etag = an optional [entity tag](#entity-tags)
            for the current #GFile, or #NULL to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileIOStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReplaceReadwrite`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_iostream.FileIOStream vfuncReplaceReadwrite(string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.replaceReadwrite)
      return typeof(return).init;

    GFileIOStream* _cretval;
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = _klass.replaceReadwrite(cast(GFile*)this._cPtr, _etag, makeBackup, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously overwrites the file in read-write mode,
      replacing the contents, possibly creating a backup copy
      of the file first.
      
      For more details, see [gid.gio2.file.File.replaceReadwrite] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.replaceReadwriteFinish] to get
      the result of the operation.
  
      Params:
        etag = an [entity tag](#entity-tags) for the current #GFile,
            or null to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReplaceReadwriteAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncReplaceReadwriteAsync(string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.replaceReadwriteAsync)
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
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.replaceReadwriteAsync(cast(GFile*)this._cPtr, _etag, makeBackup, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file replace operation started with
      [gid.gio2.file.File.replaceReadwriteAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileIOStream, or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReplaceReadwriteFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file_iostream.FileIOStream vfuncReplaceReadwriteFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.replaceReadwriteFinish)
      return typeof(return).init;

    GFileIOStream* _cretval;
    GError *_err;
    _cretval = _klass.replaceReadwriteFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Resolves a relative path for file to an absolute path.
      
      This call does no blocking I/O.
      
      If the relative_path is an absolute path name, the resolution
      is done absolutely (without taking file path as base).
  
      Params:
        relativePath = a given relative path string
      Returns: a #GFile for the resolved path.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncResolveRelativePath`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file.File vfuncResolveRelativePath(string relativePath)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.resolveRelativePath)
      return typeof(return).init;

    GFile* _cretval;
    const(char)* _relativePath = relativePath.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.resolveRelativePath(cast(GFile*)this._cPtr, _relativePath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets an attribute in the file with attribute name attribute to value_p.
      
      Some attributes can be unset by setting type to
      [gid.gio2.types.FileAttributeType.Invalid] and value_p to null.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        attribute = a string containing the attribute's name
        type = The type of the attribute
        valueP = a pointer to the value (or the pointer
            itself if the type is a pointer type)
        flags = a set of #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attribute was set, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetAttribute`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetAttribute(string attribute, gid.gio2.types.FileAttributeType type, void* valueP, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.setAttribute)
      return typeof(return).init;

    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.setAttribute(cast(GFile*)this._cPtr, _attribute, type, valueP, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously sets the attributes of file with info.
      
      For more details, see [gid.gio2.file.File.setAttributesFromInfo],
      which is the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.setAttributesFinish] to get
      the result of the operation.
  
      Params:
        info = a #GFileInfo
        flags = a #GFileQueryInfoFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetAttributesAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetAttributesAsync(gid.gio2.file_info.FileInfo info, gid.gio2.types.FileQueryInfoFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.setAttributesAsync)
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
    _klass.setAttributesAsync(cast(GFile*)this._cPtr, info ? cast(GFileInfo*)info._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes setting an attribute started in [gid.gio2.file.File.setAttributesAsync].
  
      Params:
        result = a #GAsyncResult
        info = a #GFileInfo
      Returns: true if the attributes were set correctly, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetAttributesFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetAttributesFinish(gid.gio2.async_result.AsyncResult result, out gid.gio2.file_info.FileInfo info)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.setAttributesFinish)
      return typeof(return).init;

    bool _retval;
    GFileInfo* _info;
    GError *_err;
    _retval = cast(bool)_klass.setAttributesFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_info, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    info = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(_info, Yes.Take);
    return _retval;
  }

  /**
      Tries to set all attributes in the #GFileInfo on the target
      values, not stopping on the first error.
      
      If there is any error during this operation then error will
      be set to the first error. Error on particular fields are flagged
      by setting the "status" field in the attribute value to
      [gid.gio2.types.FileAttributeStatus.ErrorSetting], which means you can
      also detect further errors.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        info = a #GFileInfo
        flags = #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: false if there was any error, true otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetAttributesFromInfo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetAttributesFromInfo(gid.gio2.file_info.FileInfo info, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.setAttributesFromInfo)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.setAttributesFromInfo(cast(GFile*)this._cPtr, info ? cast(GFileInfo*)info._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Renames file to the specified display name.
      
      The display name is converted from UTF-8 to the correct encoding
      for the target filesystem if possible and the file is renamed to this.
      
      If you want to implement a rename operation in the user interface the
      edit name ([gid.gio2.types.FILE_ATTRIBUTE_STANDARD_EDIT_NAME]) should be used as the
      initial value in the rename widget, and then the result after editing
      should be passed to [gid.gio2.file.File.setDisplayName].
      
      On success the resulting converted filename is returned.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        displayName = a string
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFile specifying what file was renamed to,
          or null if there was an error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetDisplayName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file.File vfuncSetDisplayName(string displayName, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.setDisplayName)
      return typeof(return).init;

    GFile* _cretval;
    const(char)* _displayName = displayName.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.setDisplayName(cast(GFile*)this._cPtr, _displayName, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously sets the display name for a given #GFile.
      
      For more details, see [gid.gio2.file.File.setDisplayName] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.setDisplayNameFinish] to get
      the result of the operation.
  
      Params:
        displayName = a string
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetDisplayNameAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetDisplayNameAsync(string displayName, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.setDisplayNameAsync)
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
    const(char)* _displayName = displayName.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.setDisplayNameAsync(cast(GFile*)this._cPtr, _displayName, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes setting a display name started with
      [gid.gio2.file.File.setDisplayNameAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFile or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetDisplayNameFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.file.File vfuncSetDisplayNameFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.setDisplayNameFinish)
      return typeof(return).init;

    GFile* _cretval;
    GError *_err;
    _cretval = _klass.setDisplayNameFinish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Starts a file of type [gid.gio2.types.FileType.Mountable].
      Using start_operation, you can request callbacks when, for instance,
      passwords are needed during authentication.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.mountMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        startOperation = a #GMountOperation, or null to avoid user interaction
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied, or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStartMountable`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncStartMountable(gid.gio2.types.DriveStartFlags flags, gid.gio2.mount_operation.MountOperation startOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.startMountable)
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
    _klass.startMountable(cast(GFile*)this._cPtr, flags, startOperation ? cast(GMountOperation*)startOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a start operation. See [gid.gio2.file.File.startMountable] for details.
      
      Finish an asynchronous start operation that was started
      with [gid.gio2.file.File.startMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully. false
        otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStartMountableFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncStartMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.startMountableFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.startMountableFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Stops a file of type [gid.gio2.types.FileType.Mountable].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.stopMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation,
            or null to avoid user interaction.
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied, or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStopMountable`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncStopMountable(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.stopMountable)
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
    _klass.stopMountable(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a stop operation, see [gid.gio2.file.File.stopMountable] for details.
      
      Finish an asynchronous stop operation that was started
      with [gid.gio2.file.File.stopMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully.
          false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStopMountableFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncStopMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.stopMountableFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.stopMountableFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sends file to the "Trashcan", if possible. This is similar to
      deleting it, but the user can recover it before emptying the trashcan.
      Trashing is disabled for system mounts by default (see
      [gid.giounix2.mount_entry.MountEntry.isSystemInternal]), so this call can return the
      [gid.gio2.types.IOErrorEnum.NotSupported] error. Since GLib 2.66, the `x-gvfs-notrash` unix
      mount option can be used to disable [gid.gio2.file.File.trash] support for particular
      mounts, the [gid.gio2.types.IOErrorEnum.NotSupported] error will be returned in that case.
      Since 2.82, the `x-gvfs-trash` unix mount option can be used to enable
      [gid.gio2.file.File.trash] support for particular system mounts.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true on successful trash, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncTrash`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncTrash(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.trash)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.trash(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously sends file to the Trash location, if possible.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncTrashAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncTrashAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.trashAsync)
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
    _klass.trashAsync(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file trashing operation, started with
      [gid.gio2.file.File.trashAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful trash, false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncTrashFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncTrashFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.trashFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.trashFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Unmounts a file of type G_FILE_TYPE_MOUNTABLE.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.unmountMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnmountMountable`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  
      Deprecated: Use [gid.gio2.file.File.unmountMountableWithOperation] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUnmountMountable(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.unmountMountable)
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
    _klass.unmountMountable(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an unmount operation, see [gid.gio2.file.File.unmountMountable] for details.
      
      Finish an asynchronous unmount operation that was started
      with [gid.gio2.file.File.unmountMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully.
          false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnmountMountableFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gio2.file.File.unmountMountableWithOperationFinish]
          instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncUnmountMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.unmountMountableFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.unmountMountableFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Unmounts a file of type [gid.gio2.types.FileType.Mountable].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.unmountMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation,
            or null to avoid user interaction
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnmountMountableWithOperation`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUnmountMountableWithOperation(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.unmountMountableWithOperation)
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
    _klass.unmountMountableWithOperation(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an unmount operation,
      see [gid.gio2.file.File.unmountMountableWithOperation] for details.
      
      Finish an asynchronous unmount operation that was started
      with [gid.gio2.file.File.unmountMountableWithOperation].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully.
          false otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnmountMountableWithOperationFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncUnmountMountableWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.file.File._getGType);
    if (!_klass || !_klass.unmountMountableWithOperationFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.unmountMountableWithOperationFinish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets an output stream for appending data to the file.
      If the file doesn't already exist it is created.
      
      By default files created are generally readable by everyone,
      but if you pass [gid.gio2.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level that
      is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      Some file systems don't allow all file names, and may return an
      [gid.gio2.types.IOErrorEnum.InvalidFilename] error. If the file is a directory the
      [gid.gio2.types.IOErrorEnum.IsDirectory] error will be returned. Other errors are
      possible too, and depend on what kind of filesystem the file is on.
  
      Params:
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileOutputStream, or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_output_stream.FileOutputStream appendTo(gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = g_file_append_to(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously opens file for appending.
      
      For more details, see [gid.gio2.file.File.appendTo] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.appendToFinish] to get the result
      of the operation.
  
      Params:
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void appendToAsync(gid.gio2.types.FileCreateFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_append_to_async(cast(GFile*)this._cPtr, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file append operation started with
      [gid.gio2.file.File.appendToAsync].
  
      Params:
        res = #GAsyncResult
      Returns: a valid #GFileOutputStream
          or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_output_stream.FileOutputStream appendToFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = g_file_append_to_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Prepares the file attribute query string for copying to file.
      
      This function prepares an attribute query string to be
      passed to [gid.gio2.file.File.queryInfo] to get a list of attributes
      normally copied with the file (see [gid.gio2.file.File.copyAttributes]
      for the detailed description). This function is used by the
      implementation of [gid.gio2.file.File.copyAttributes] and is useful
      when one needs to query and set the attributes in two
      stages (e.g., for recursive move of a directory).
  
      Params:
        flags = a set of #GFileCopyFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: an attribute query string for [gid.gio2.file.File.queryInfo],
          or null if an error occurs.
      Throws: [ErrorWrap]
  */
  override string buildAttributeListForCopy(gid.gio2.types.FileCopyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    char* _cretval;
    GError *_err;
    _cretval = g_file_build_attribute_list_for_copy(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Copies the file source to the location specified by destination.
      Can not handle recursive copies of directories.
      
      If the flag [gid.gio2.types.FileCopyFlags.Overwrite] is specified an already
      existing destination file is overwritten.
      
      If the flag [gid.gio2.types.FileCopyFlags.NofollowSymlinks] is specified then symlinks
      will be copied as symlinks, otherwise the target of the
      source symlink will be copied.
      
      If the flag [gid.gio2.types.FileCopyFlags.AllMetadata] is specified then all the metadata
      that is possible to copy is copied, not just the default subset (which,
      for instance, does not include the owner, see #GFileInfo).
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      If progress_callback is not null, then the operation can be monitored
      by setting this to a #GFileProgressCallback function.
      progress_callback_data will be passed to this function. It is guaranteed
      that this callback will be called after all data has been transferred with
      the total number of bytes copied during the operation.
      
      If the source file does not exist, then the [gid.gio2.types.IOErrorEnum.NotFound] error
      is returned, independent on the status of the destination.
      
      If [gid.gio2.types.FileCopyFlags.Overwrite] is not specified and the target exists, then
      the error [gid.gio2.types.IOErrorEnum.Exists] is returned.
      
      If trying to overwrite a file over a directory, the [gid.gio2.types.IOErrorEnum.IsDirectory]
      error is returned. If trying to overwrite a directory with a directory the
      [gid.gio2.types.IOErrorEnum.WouldMerge] error is returned.
      
      If the source is a directory and the target does not exist, or
      [gid.gio2.types.FileCopyFlags.Overwrite] is specified and the target is a file, then the
      [gid.gio2.types.IOErrorEnum.WouldRecurse] error is returned.
      
      If you are interested in copying the #GFile object itself (not the on-disk
      file), see [gid.gio2.file.File.dup].
  
      Params:
        destination = destination #GFile
        flags = set of #GFileCopyFlags
        cancellable = optional #GCancellable object,
            null to ignore
        progressCallback = function to callback with
            progress information, or null if progress information is not needed
      Returns: true on success, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool copy(gid.gio2.file.File destination, gid.gio2.types.FileCopyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.FileProgressCallback progressCallback = null)
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gio2.types.FileProgressCallback*)data;

      try
      {
        (*_dlg)(currentNumBytes, totalNumBytes);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.FileProgressCallback");
      }
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;
    bool _retval;
    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    GError *_err;
    _retval = cast(bool)g_file_copy(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Version of [gid.gio2.file.File.copyAsync] using closures instead of callbacks for
      easier binding in other languages.
  
      Params:
        destination = destination [gid.gio2.file.File]
        flags = set of [gid.gio2.types.FileCopyFlags]
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional [gid.gio2.cancellable.Cancellable] object,
            `NULL` to ignore
        progressCallbackClosure = [gid.gobject2.closure.Closure] to invoke with progress
            information, or `NULL` if progress information is not needed
        readyCallbackClosure = [gid.gobject2.closure.Closure] to invoke when the request is satisfied
  */
  override void copyAsync(gid.gio2.file.File destination, gid.gio2.types.FileCopyFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable, gid.gobject2.closure.Closure progressCallbackClosure, gid.gobject2.closure.Closure readyCallbackClosure) nothrow
  {
    g_file_copy_async_with_closures(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, progressCallbackClosure ? cast(GClosure*)progressCallbackClosure._cPtr(No.Dup) : null, readyCallbackClosure ? cast(GClosure*)readyCallbackClosure._cPtr(No.Dup) : null);
  }

  /**
      Copies the file attributes from source to destination.
      
      Normally only a subset of the file attributes are copied,
      those that are copies in a normal file copy operation
      (which for instance does not include e.g. owner). However
      if [gid.gio2.types.FileCopyFlags.AllMetadata] is specified in flags, then
      all the metadata that is possible to copy is copied. This
      is useful when implementing move by copy + delete source.
  
      Params:
        destination = a #GFile to copy attributes to
        flags = a set of #GFileCopyFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attributes were copied successfully,
          false otherwise.
      Throws: [ErrorWrap]
  */
  override bool copyAttributes(gid.gio2.file.File destination, gid.gio2.types.FileCopyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_copy_attributes(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Finishes copying the file started with [gid.gio2.file.File.copyAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a true on success, false on error.
      Throws: [ErrorWrap]
  */
  override bool copyFinish(gid.gio2.async_result.AsyncResult res)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_copy_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Creates a new file and returns an output stream for writing to it.
      The file must not already exist.
      
      By default files created are generally readable by everyone,
      but if you pass [gid.gio2.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level
      that is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If a file or directory with this name already exists the
      [gid.gio2.types.IOErrorEnum.Exists] error will be returned. Some file systems don't
      allow all file names, and may return an [gid.gio2.types.IOErrorEnum.InvalidFilename]
      error, and if the name is to long [gid.gio2.types.IOErrorEnum.FilenameTooLong] will
      be returned. Other errors are possible too, and depend on what kind
      of filesystem the file is on.
  
      Params:
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileOutputStream for the newly created
          file, or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_output_stream.FileOutputStream create(gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = g_file_create(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a new file and returns an output stream
      for writing to it. The file must not already exist.
      
      For more details, see [gid.gio2.file.File.create] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.createFinish] to get the result
      of the operation.
  
      Params:
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void createAsync(gid.gio2.types.FileCreateFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_create_async(cast(GFile*)this._cPtr, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file create operation started with
      [gid.gio2.file.File.createAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileOutputStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_output_stream.FileOutputStream createFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = g_file_create_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new file and returns a stream for reading and
      writing to it. The file must not already exist.
      
      By default files created are generally readable by everyone,
      but if you pass [gid.gio2.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level
      that is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If a file or directory with this name already exists, the
      [gid.gio2.types.IOErrorEnum.Exists] error will be returned. Some file systems don't
      allow all file names, and may return an [gid.gio2.types.IOErrorEnum.InvalidFilename]
      error, and if the name is too long, [gid.gio2.types.IOErrorEnum.FilenameTooLong]
      will be returned. Other errors are possible too, and depend on what
      kind of filesystem the file is on.
      
      Note that in many non-local file cases read and write streams are
      not supported, so make sure you really need to do read and write
      streaming, rather than just opening for reading or writing.
  
      Params:
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileIOStream for the newly created
          file, or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_iostream.FileIOStream createReadwrite(gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileIOStream* _cretval;
    GError *_err;
    _cretval = g_file_create_readwrite(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a new file and returns a stream
      for reading and writing to it. The file must not already exist.
      
      For more details, see [gid.gio2.file.File.createReadwrite] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.createReadwriteFinish] to get
      the result of the operation.
  
      Params:
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void createReadwriteAsync(gid.gio2.types.FileCreateFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_create_readwrite_async(cast(GFile*)this._cPtr, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file create operation started with
      [gid.gio2.file.File.createReadwriteAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileIOStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_iostream.FileIOStream createReadwriteFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFileIOStream* _cretval;
    GError *_err;
    _cretval = g_file_create_readwrite_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Deletes a file. If the file is a directory, it will only be
      deleted if it is empty. This has the same semantics as [gid.glib2.global.unlink].
      
      If file doesn’t exist, [gid.gio2.types.IOErrorEnum.NotFound] will be returned. This allows
      for deletion to be implemented avoiding
      [time-of-check to time-of-use races](https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use):
      ```
      g_autoptr(GError) local_error = NULL;
      if (!g_file_delete (my_file, my_cancellable, &local_error) &&
          !g_error_matches (local_error, G_IO_ERROR, G_IO_ERROR_NOT_FOUND))
        {
          // deletion failed for some reason other than the file not existing:
          // so report the error
          g_warning ("Failed to delete %s: %s",
                     g_file_peek_path (my_file), local_error->message);
        }
      ```
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the file was deleted. false otherwise.
      Throws: [ErrorWrap]
  */
  override bool delete_(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_delete(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously delete a file. If the file is a directory, it will
      only be deleted if it is empty.  This has the same semantics as
      [gid.glib2.global.unlink].
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  override void deleteAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_delete_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes deleting a file started with [gid.gio2.file.File.deleteAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the file was deleted. false otherwise.
      Throws: [ErrorWrap]
  */
  override bool deleteFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_delete_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Duplicates a #GFile handle. This operation does not duplicate
      the actual file or directory represented by the #GFile; see
      [gid.gio2.file.File.copy] if attempting to copy a file.
      
      [gid.gio2.file.File.dup] is useful when a second handle is needed to the same underlying
      file, for use in a separate thread (#GFile is not thread-safe). For use
      within the same thread, use [gid.gobject2.object.ObjectWrap.ref_] to increment the existing object’s
      reference count.
      
      This call does no blocking I/O.
      Returns: a new #GFile that is a duplicate
          of the given #GFile.
  */
  override gid.gio2.file.File dup() nothrow
  {
    GFile* _cretval;
    _cretval = g_file_dup(cast(GFile*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Starts an asynchronous eject on a mountable.
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gid.gio2.file.File.ejectMountableFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = flags affecting the operation
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Deprecated: Use [gid.gio2.file.File.ejectMountableWithOperation] instead.
  */
  override void ejectMountable(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_eject_mountable(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous eject operation started by
      [gid.gio2.file.File.ejectMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the file was ejected successfully.
          false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gio2.file.File.ejectMountableWithOperationFinish]
          instead.
  */
  override bool ejectMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_eject_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Starts an asynchronous eject on a mountable.
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gid.gio2.file.File.ejectMountableWithOperationFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation,
            or null to avoid user interaction
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void ejectMountableWithOperation(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_eject_mountable_with_operation(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous eject operation started by
      [gid.gio2.file.File.ejectMountableWithOperation].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the file was ejected successfully.
          false otherwise.
      Throws: [ErrorWrap]
  */
  override bool ejectMountableWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_eject_mountable_with_operation_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the requested information about the files in a directory.
      The result is a [gid.gio2.file_enumerator.FileEnumerator] object that will give out
      [gid.gio2.file_info.FileInfo] objects for all the files in the directory.
      
      The attributes value is a string that specifies the file
      attributes that should be gathered. It is not an error if
      it's not possible to read a particular requested attribute
      from a file - it just won't be set. attributes should
      be a comma-separated list of attributes or attribute wildcards.
      The wildcard `*` means all attributes, and a wildcard like
      `"standard::*"` means all attributes in the standard namespace.
      An example attribute query be `"standard::*,owner::user"`.
      The standard attributes are available as defines, like
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME]. [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME] should
      always be specified if you plan to call [gid.gio2.file_enumerator.FileEnumerator.getChild] or
      [gid.gio2.file_enumerator.FileEnumerator.iterate] on the returned enumerator.
      
      If cancellable is not `NULL`, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error `errorGio.IOErrorEnum.CANCELLED` will be
      returned.
      
      If the file does not exist, the `errorGio.IOErrorEnum.NOT_FOUND` error will
      be returned. If the file is not a directory, the `errorGio.IOErrorEnum.NOT_DIRECTORY`
      error will be returned. Other errors are possible too.
  
      Params:
        attributes = an attribute query string
        flags = a set of #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: A #GFileEnumerator if successful,
          null on error. Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_enumerator.FileEnumerator enumerateChildren(string attributes, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileEnumerator* _cretval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_file_enumerate_children(cast(GFile*)this._cPtr, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_enumerator.FileEnumerator)(cast(GFileEnumerator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the requested information about the files
      in a directory. The result is a #GFileEnumerator object that will
      give out #GFileInfo objects for all the files in the directory.
      
      For more details, see [gid.gio2.file.File.enumerateChildren] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called. You can
      then call [gid.gio2.file.File.enumerateChildrenFinish] to get the result of
      the operation.
  
      Params:
        attributes = an attribute query string
        flags = a set of #GFileQueryInfoFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void enumerateChildrenAsync(string attributes, gid.gio2.types.FileQueryInfoFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_enumerate_children_async(cast(GFile*)this._cPtr, _attributes, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async enumerate children operation.
      See [gid.gio2.file.File.enumerateChildrenAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileEnumerator or null
          if an error occurred.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_enumerator.FileEnumerator enumerateChildrenFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFileEnumerator* _cretval;
    GError *_err;
    _cretval = g_file_enumerate_children_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_enumerator.FileEnumerator)(cast(GFileEnumerator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if the two given #GFiles refer to the same file.
      
      This function can be used with [gid.gio2.file.File.hash] to insert
      [gid.gio2.file.File]s efficiently in a hash table.
      
      Note that two #GFiles that differ can still refer to the same
      file on the filesystem due to various forms of filename
      aliasing. For local files, this function essentially compares the file paths,
      so two [gid.gio2.file.File]s which point to different hard or soft links will not
      be considered equal, despite pointing to the same content.
      
      For determining whether two files are hardlinked, see
      [gid.gio2.types.FILE_ATTRIBUTE_ID_FILE].
      
      This call does no blocking I/O.
  
      Params:
        file2 = the second #GFile
      Returns: true if file1 and file2 are equal.
  */
  override bool equal(gid.gio2.file.File file2) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_equal(cast(GFile*)this._cPtr, file2 ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file2)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets a #GMount for the #GFile.
      
      #GMount is returned only for user interesting locations, see
      #GVolumeMonitor. If the #GFileIface for file does not have a #mount,
      error will be set to [gid.gio2.types.IOErrorEnum.NotFound] and null #will be returned.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GMount where the file is located
          or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.mount.Mount findEnclosingMount(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GMount* _cretval;
    GError *_err;
    _cretval = g_file_find_enclosing_mount(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the mount for the file.
      
      For more details, see [gid.gio2.file.File.findEnclosingMount] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.findEnclosingMountFinish] to
      get the result of the operation.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void findEnclosingMountAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_find_enclosing_mount_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous find mount request.
      See [gid.gio2.file.File.findEnclosingMountAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: #GMount for given file or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.mount.Mount findEnclosingMountFinish(gid.gio2.async_result.AsyncResult res)
  {
    GMount* _cretval;
    GError *_err;
    _cretval = g_file_find_enclosing_mount_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the base name (the last component of the path) for a given #GFile.
      
      If called for the top level of a system (such as the filesystem root
      or a uri like sftp://host/) it will return a single directory separator
      (and on Windows, possibly a drive letter).
      
      The base name is a byte string (not UTF-8). It has no defined encoding
      or rules other than it may not contain zero bytes.  If you want to use
      filenames in a user interface you should use the display name that you
      can get by requesting the [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME]
      attribute with [gid.gio2.file.File.queryInfo].
      
      This call does no blocking I/O.
      Returns: string containing the #GFile's
          base name, or null if given #GFile is invalid. The returned string
          should be freed with [gid.glib2.global.gfree] when no longer needed.
  */
  override string getBasename() nothrow
  {
    char* _cretval;
    _cretval = g_file_get_basename(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets a child of file with basename equal to name.
      
      Note that the file with that specific name might not exist, but
      you can still have a #GFile that points to it. You can use this
      for instance to create that file.
      
      This call does no blocking I/O.
  
      Params:
        name = string containing the child's basename
      Returns: a #GFile to a child specified by name.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  override gid.gio2.file.File getChild(string name) nothrow
  {
    GFile* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_get_child(cast(GFile*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the child of file for a given display_name (i.e. a UTF-8
      version of the name). If this function fails, it returns null
      and error will be set. This is very useful when constructing a
      #GFile for a new file and the user entered the filename in the
      user interface, for instance when you select a directory and
      type a filename in the file selector.
      
      This call does no blocking I/O.
  
      Params:
        displayName = string to a possible child
      Returns: a #GFile to the specified child, or
          null if the display name couldn't be converted.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file.File getChildForDisplayName(string displayName)
  {
    GFile* _cretval;
    const(char)* _displayName = displayName.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_file_get_child_for_display_name(cast(GFile*)this._cPtr, _displayName, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the parent directory for the file.
      If the file represents the root directory of the
      file system, then null will be returned.
      
      This call does no blocking I/O.
      Returns: a #GFile structure to the
          parent of the given #GFile or null if there is no parent. Free
          the returned object with [gid.gobject2.object.ObjectWrap.unref].
  */
  override gid.gio2.file.File getParent() nothrow
  {
    GFile* _cretval;
    _cretval = g_file_get_parent(cast(GFile*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the parse name of the file.
      A parse name is a UTF-8 string that describes the
      file such that one can get the #GFile back using
      [gid.gio2.file.File.parseName].
      
      This is generally used to show the #GFile as a nice
      full-pathname kind of string in a user interface,
      like in a location entry.
      
      For local files with names that can safely be converted
      to UTF-8 the pathname is used, otherwise the IRI is used
      (a form of URI that allows UTF-8 characters unescaped).
      
      This call does no blocking I/O.
      Returns: a string containing the #GFile's parse name.
          The returned string should be freed with [gid.glib2.global.gfree]
          when no longer needed.
  */
  override string getParseName() nothrow
  {
    char* _cretval;
    _cretval = g_file_get_parse_name(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the local pathname for #GFile, if one exists. If non-null, this is
      guaranteed to be an absolute, canonical path. It might contain symlinks.
      
      This call does no blocking I/O.
      Returns: string containing the #GFile's path,
          or null if no such path exists. The returned string should be freed
          with [gid.glib2.global.gfree] when no longer needed.
  */
  override string getPath() nothrow
  {
    char* _cretval;
    _cretval = g_file_get_path(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the path for descendant relative to parent.
      
      This call does no blocking I/O.
  
      Params:
        descendant = input #GFile
      Returns: string with the relative path from
          descendant to parent, or null if descendant doesn't have parent as
          prefix. The returned string should be freed with [gid.glib2.global.gfree] when
          no longer needed.
  */
  override string getRelativePath(gid.gio2.file.File descendant) nothrow
  {
    char* _cretval;
    _cretval = g_file_get_relative_path(cast(GFile*)this._cPtr, descendant ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)descendant)._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the URI for the file.
      
      This call does no blocking I/O.
      Returns: a string containing the #GFile's URI. If the #GFile was constructed
          with an invalid URI, an invalid URI is returned.
          The returned string should be freed with [gid.glib2.global.gfree]
          when no longer needed.
  */
  override string getUri() nothrow
  {
    char* _cretval;
    _cretval = g_file_get_uri(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the URI scheme for a #GFile.
      RFC 3986 decodes the scheme as:
      ```
      URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ]
      ```
      Common schemes include "file", "http", "ftp", etc.
      
      The scheme can be different from the one used to construct the #GFile,
      in that it might be replaced with one that is logically equivalent to the #GFile.
      
      This call does no blocking I/O.
      Returns: a string containing the URI scheme for the given
          #GFile or null if the #GFile was constructed with an invalid URI. The
          returned string should be freed with [gid.glib2.global.gfree] when no longer needed.
  */
  override string getUriScheme() nothrow
  {
    char* _cretval;
    _cretval = g_file_get_uri_scheme(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Checks if file has a parent, and optionally, if it is parent.
      
      If parent is null then this function returns true if file has any
      parent at all.  If parent is non-null then true is only returned
      if file is an immediate child of parent.
  
      Params:
        parent = the parent to check for, or null
      Returns: true if file is an immediate child of parent (or any parent in
          the case that parent is null).
  */
  override bool hasParent(gid.gio2.file.File parent = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_has_parent(cast(GFile*)this._cPtr, parent ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)parent)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether file has the prefix specified by prefix.
      
      In other words, if the names of initial elements of file's
      pathname match prefix. Only full pathname elements are matched,
      so a path like /foo is not considered a prefix of /foobar, only
      of /foo/bar.
      
      A #GFile is not a prefix of itself. If you want to check for
      equality, use [gid.gio2.file.File.equal].
      
      This call does no I/O, as it works purely on names. As such it can
      sometimes return false even if file is inside a prefix (from a
      filesystem point of view), because the prefix of file is an alias
      of prefix.
  
      Params:
        prefix = input #GFile
      Returns: true if the file's parent, grandparent, etc is prefix,
          false otherwise.
  */
  override bool hasPrefix(gid.gio2.file.File prefix) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_has_prefix(cast(GFile*)this._cPtr, prefix ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)prefix)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks to see if a #GFile has a given URI scheme.
      
      This call does no blocking I/O.
  
      Params:
        uriScheme = a string containing a URI scheme
      Returns: true if #GFile's backend supports the
          given URI scheme, false if URI scheme is null,
          not supported, or #GFile is invalid.
  */
  override bool hasUriScheme(string uriScheme) nothrow
  {
    bool _retval;
    const(char)* _uriScheme = uriScheme.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_file_has_uri_scheme(cast(GFile*)this._cPtr, _uriScheme);
    return _retval;
  }

  /**
      Creates a hash value for a #GFile.
      
      This call does no blocking I/O.
      Returns: 0 if file is not a valid #GFile, otherwise an
          integer that can be used as hash value for the #GFile.
          This function is intended for easily hashing a #GFile to
          add to a #GHashTable or similar data structure.
  */
  override uint hash() nothrow
  {
    uint _retval;
    _retval = g_file_hash(cast(GFile*)this._cPtr);
    return _retval;
  }

  /**
      Checks to see if a file is native to the platform.
      
      A native file is one expressed in the platform-native filename format,
      e.g. "C:\Windows" or "/usr/bin/". This does not mean the file is local,
      as it might be on a locally mounted remote filesystem.
      
      On some systems non-native files may be available using the native
      filesystem via a userspace filesystem (FUSE), in these cases this call
      will return false, but [gid.gio2.file.File.getPath] will still return a native path.
      
      This call does no blocking I/O.
      Returns: true if file is native
  */
  override bool isNative() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_is_native(cast(GFile*)this._cPtr);
    return _retval;
  }

  /**
      Loads the contents of file and returns it as #GBytes.
      
      If file is a resource:// based URI, the resulting bytes will reference the
      embedded resource instead of a copy. Otherwise, this is equivalent to calling
      [gid.gio2.file.File.loadContents] and [gid.glib2.bytes.Bytes.newTake].
      
      For resources, etag_out will be set to null.
      
      The data contained in the resulting #GBytes is always zero-terminated, but
      this is not included in the #GBytes length. The resulting #GBytes should be
      freed with [gid.glib2.bytes.Bytes.unref] when no longer in use.
  
      Params:
        cancellable = a #GCancellable or null
        etagOut = a location to place the current
            entity tag for the file, or null if the entity tag is not needed
      Returns: a #GBytes or null and error is set
      Throws: [ErrorWrap]
  */
  override gid.glib2.bytes.Bytes loadBytes(gid.gio2.cancellable.Cancellable cancellable, out string etagOut)
  {
    GBytes* _cretval;
    char* _etagOut;
    GError *_err;
    _cretval = g_file_load_bytes(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_etagOut, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    etagOut = _etagOut.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Asynchronously loads the contents of file as #GBytes.
      
      If file is a resource:// based URI, the resulting bytes will reference the
      embedded resource instead of a copy. Otherwise, this is equivalent to calling
      [gid.gio2.file.File.loadContentsAsync] and [gid.glib2.bytes.Bytes.newTake].
      
      callback should call [gid.gio2.file.File.loadBytesFinish] to get the result of this
      asynchronous operation.
      
      See [gid.gio2.file.File.loadBytes] for more information.
  
      Params:
        cancellable = a #GCancellable or null
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void loadBytesAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_load_bytes_async(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Completes an asynchronous request to [gid.gio2.file.File.loadBytesAsync].
      
      For resources, etag_out will be set to null.
      
      The data contained in the resulting #GBytes is always zero-terminated, but
      this is not included in the #GBytes length. The resulting #GBytes should be
      freed with [gid.glib2.bytes.Bytes.unref] when no longer in use.
      
      See [gid.gio2.file.File.loadBytes] for more information.
  
      Params:
        result = a #GAsyncResult provided to the callback
        etagOut = a location to place the current
            entity tag for the file, or null if the entity tag is not needed
      Returns: a #GBytes or null and error is set
      Throws: [ErrorWrap]
  */
  override gid.glib2.bytes.Bytes loadBytesFinish(gid.gio2.async_result.AsyncResult result, out string etagOut)
  {
    GBytes* _cretval;
    char* _etagOut;
    GError *_err;
    _cretval = g_file_load_bytes_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_etagOut, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    etagOut = _etagOut.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Loads the content of the file into memory. The data is always
      zero-terminated, but this is not included in the resultant length.
      The returned contents should be freed with [gid.glib2.global.gfree] when no longer
      needed.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
        contents = a location to place the contents of the file
        etagOut = a location to place the current entity tag for the file,
            or null if the entity tag is not needed
      Returns: true if the file's contents were successfully loaded.
          false if there were errors.
      Throws: [ErrorWrap]
  */
  override bool loadContents(gid.gio2.cancellable.Cancellable cancellable, out ubyte[] contents, out string etagOut)
  {
    bool _retval;
    size_t _length;
    ubyte* _contents;
    char* _etagOut;
    GError *_err;
    _retval = cast(bool)g_file_load_contents(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_contents, &_length, &_etagOut, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    contents.length = _length;
    contents[0 .. $] = (cast(ubyte*)_contents)[0 .. _length];
    gFree(cast(void*)_contents);
    etagOut = _etagOut.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Starts an asynchronous load of the file's contents.
      
      For more details, see [gid.gio2.file.File.loadContents] which is
      the synchronous version of this call.
      
      When the load operation has completed, callback will be called
      with user data. To finish the operation, call
      [gid.gio2.file.File.loadContentsFinish] with the #GAsyncResult returned by
      the callback.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  override void loadContentsAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_load_contents_async(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous load of the file's contents.
      The contents are placed in contents, and length is set to the
      size of the contents string. The contents should be freed with
      [gid.glib2.global.gfree] when no longer needed. If etag_out is present, it will be
      set to the new entity tag for the file.
  
      Params:
        res = a #GAsyncResult
        contents = a location to place the contents of the file
        etagOut = a location to place the current entity tag for the file,
            or null if the entity tag is not needed
      Returns: true if the load was successful. If false and error is
          present, it will be set appropriately.
      Throws: [ErrorWrap]
  */
  override bool loadContentsFinish(gid.gio2.async_result.AsyncResult res, out ubyte[] contents, out string etagOut)
  {
    bool _retval;
    size_t _length;
    ubyte* _contents;
    char* _etagOut;
    GError *_err;
    _retval = cast(bool)g_file_load_contents_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_contents, &_length, &_etagOut, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    contents.length = _length;
    contents[0 .. $] = (cast(ubyte*)_contents)[0 .. _length];
    gFree(cast(void*)_contents);
    etagOut = _etagOut.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Finishes an asynchronous partial load operation that was started
      with [gid.gio2.file.File.loadPartialContentsAsync]. The data is always
      zero-terminated, but this is not included in the resultant length.
      The returned contents should be freed with [gid.glib2.global.gfree] when no longer
      needed.
  
      Params:
        res = a #GAsyncResult
        contents = a location to place the contents of the file
        etagOut = a location to place the current entity tag for the file,
            or null if the entity tag is not needed
      Returns: true if the load was successful. If false and error is
          present, it will be set appropriately.
      Throws: [ErrorWrap]
  */
  override bool loadPartialContentsFinish(gid.gio2.async_result.AsyncResult res, out ubyte[] contents, out string etagOut)
  {
    bool _retval;
    size_t _length;
    ubyte* _contents;
    char* _etagOut;
    GError *_err;
    _retval = cast(bool)g_file_load_partial_contents_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_contents, &_length, &_etagOut, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    contents.length = _length;
    contents[0 .. $] = (cast(ubyte*)_contents)[0 .. _length];
    gFree(cast(void*)_contents);
    etagOut = _etagOut.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Creates a directory.
      
      Note that this will only create a child directory
      of the immediate parent directory of the path or URI given by the #GFile.
      To recursively create directories, see [gid.gio2.file.File.makeDirectoryWithParents].
      
      This function will fail if the parent directory does not exist, setting
      error to [gid.gio2.types.IOErrorEnum.NotFound]. If the file system doesn't support
      creating directories, this function will fail, setting error to
      [gid.gio2.types.IOErrorEnum.NotSupported]. If the directory already exists,
      `errorGio.IOErrorEnum.EXISTS` will be returned.
      
      For a local #GFile the newly created directory will have the default
      (current) ownership and permissions of the current process.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true on successful creation, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool makeDirectory(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_make_directory(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a directory.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  override void makeDirectoryAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_make_directory_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous directory creation, started with
      [gid.gio2.file.File.makeDirectoryAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful directory creation, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool makeDirectoryFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_make_directory_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Creates a directory and any parent directories that may not
      exist similar to 'mkdir -p'. If the file system does not support
      creating directories, this function will fail, setting error to
      [gid.gio2.types.IOErrorEnum.NotSupported]. If the directory itself already exists,
      this function will fail setting error to [gid.gio2.types.IOErrorEnum.Exists], unlike
      the similar [gid.glib2.global.mkdirWithParents].
      
      For a local #GFile the newly created directories will have the default
      (current) ownership and permissions of the current process.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if all directories have been successfully created, false
        otherwise.
      Throws: [ErrorWrap]
  */
  override bool makeDirectoryWithParents(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_make_directory_with_parents(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Creates a symbolic link named file which contains the string
      symlink_value.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        symlinkValue = a string with the path for the target
            of the new symlink
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true on the creation of a new symlink, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool makeSymbolicLink(string symlinkValue, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _symlinkValue = symlinkValue.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_file_make_symbolic_link(cast(GFile*)this._cPtr, _symlinkValue, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a symbolic link named file which contains the
      string symlink_value.
  
      Params:
        symlinkValue = a string with the path for the target
            of the new symlink
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  override void makeSymbolicLinkAsync(string symlinkValue, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _symlinkValue = symlinkValue.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_make_symbolic_link_async(cast(GFile*)this._cPtr, _symlinkValue, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous symbolic link creation, started with
      [gid.gio2.file.File.makeSymbolicLinkAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful directory creation, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool makeSymbolicLinkFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_make_symbolic_link_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Recursively measures the disk usage of file.
      
      This is essentially an analog of the 'du' command, but it also
      reports the number of directories and non-directory files encountered
      (including things like symbolic links).
      
      By default, errors are only reported against the toplevel file
      itself.  Errors found while recursing are silently ignored, unless
      [gid.gio2.types.FileMeasureFlags.ReportAnyError] is given in flags.
      
      The returned size, disk_usage, is in bytes and should be formatted
      with [gid.glib2.global.formatSize] in order to get something reasonable for showing
      in a user interface.
      
      progress_callback and progress_data can be given to request
      periodic progress updates while scanning.  See the documentation for
      #GFileMeasureProgressCallback for information about when and how the
      callback will be invoked.
  
      Params:
        flags = #GFileMeasureFlags
        cancellable = optional #GCancellable
        progressCallback = a #GFileMeasureProgressCallback
        diskUsage = the number of bytes of disk space used
        numDirs = the number of directories encountered
        numFiles = the number of non-directories encountered
      Returns: true if successful, with the out parameters set.
          false otherwise, with error set.
      Throws: [ErrorWrap]
  */
  override bool measureDiskUsage(gid.gio2.types.FileMeasureFlags flags, gid.gio2.cancellable.Cancellable cancellable, gid.gio2.types.FileMeasureProgressCallback progressCallback, out ulong diskUsage, out ulong numDirs, out ulong numFiles)
  {
    extern(C) void _progressCallbackCallback(gboolean reporting, ulong currentSize, ulong numDirs, ulong numFiles, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gio2.types.FileMeasureProgressCallback*)data;

      try
      {
        (*_dlg)(cast(bool)reporting, currentSize, numDirs, numFiles);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.FileMeasureProgressCallback");
      }
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;
    bool _retval;
    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    GError *_err;
    _retval = cast(bool)g_file_measure_disk_usage(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, cast(ulong*)&diskUsage, cast(ulong*)&numDirs, cast(ulong*)&numFiles, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Collects the results from an earlier call to
      [gid.gio2.file.File.measureDiskUsageAsync].  See [gid.gio2.file.File.measureDiskUsage] for
      more information.
  
      Params:
        result = the #GAsyncResult passed to your #GAsyncReadyCallback
        diskUsage = the number of bytes of disk space used
        numDirs = the number of directories encountered
        numFiles = the number of non-directories encountered
      Returns: true if successful, with the out parameters set.
          false otherwise, with error set.
      Throws: [ErrorWrap]
  */
  override bool measureDiskUsageFinish(gid.gio2.async_result.AsyncResult result, out ulong diskUsage, out ulong numDirs, out ulong numFiles)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_measure_disk_usage_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(ulong*)&diskUsage, cast(ulong*)&numDirs, cast(ulong*)&numFiles, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Obtains a file or directory monitor for the given file,
      depending on the type of the file.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = a set of #GFileMonitorFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileMonitor for the given file,
          or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_monitor.FileMonitor monitor(gid.gio2.types.FileMonitorFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileMonitor* _cretval;
    GError *_err;
    _cretval = g_file_monitor(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_monitor.FileMonitor)(cast(GFileMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains a directory monitor for the given file.
      This may fail if directory monitoring is not supported.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      It does not make sense for flags to contain
      [gid.gio2.types.FileMonitorFlags.WatchHardLinks], since hard links can not be made to
      directories.  It is not possible to monitor all the files in a
      directory for changes made via hard links; if you want to do this then
      you must register individual watches with [gid.gio2.file.File.monitor].
  
      Params:
        flags = a set of #GFileMonitorFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileMonitor for the given file,
          or null on error. Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_monitor.FileMonitor monitorDirectory(gid.gio2.types.FileMonitorFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileMonitor* _cretval;
    GError *_err;
    _cretval = g_file_monitor_directory(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_monitor.FileMonitor)(cast(GFileMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains a file monitor for the given file. If no file notification
      mechanism exists, then regular polling of the file is used.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      If flags contains [gid.gio2.types.FileMonitorFlags.WatchHardLinks] then the monitor
      will also attempt to report changes made to the file via another
      filename (ie, a hard link). Without this flag, you can only rely on
      changes made through the filename contained in file to be
      reported. Using this flag may result in an increase in resource
      usage, and may not have any effect depending on the #GFileMonitor
      backend and/or filesystem type.
  
      Params:
        flags = a set of #GFileMonitorFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileMonitor for the given file,
          or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_monitor.FileMonitor monitorFile(gid.gio2.types.FileMonitorFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileMonitor* _cretval;
    GError *_err;
    _cretval = g_file_monitor_file(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_monitor.FileMonitor)(cast(GFileMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Starts a mount_operation, mounting the volume that contains
      the file location.
      
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gid.gio2.file.File.mountEnclosingVolumeFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation
            or null to avoid user interaction
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied, or null
  */
  override void mountEnclosingVolume(gid.gio2.types.MountMountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_mount_enclosing_volume(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a mount operation started by [gid.gio2.file.File.mountEnclosingVolume].
  
      Params:
        result = a #GAsyncResult
      Returns: true if successful. If an error has occurred,
          this function will return false and set error
          appropriately if present.
      Throws: [ErrorWrap]
  */
  override bool mountEnclosingVolumeFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_mount_enclosing_volume_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Mounts a file of type G_FILE_TYPE_MOUNTABLE.
      Using mount_operation, you can request callbacks when, for instance,
      passwords are needed during authentication.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.mountMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation,
            or null to avoid user interaction
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void mountMountable(gid.gio2.types.MountMountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_mount_mountable(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a mount operation. See [gid.gio2.file.File.mountMountable] for details.
      
      Finish an asynchronous mount operation that was started
      with [gid.gio2.file.File.mountMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GFile or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file.File mountMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = g_file_mount_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tries to move the file or directory source to the location specified
      by destination. If native move operations are supported then this is
      used, otherwise a copy + delete fallback is used. The native
      implementation may support moving directories (for instance on moves
      inside the same filesystem), but the fallback code does not.
      
      If the flag [gid.gio2.types.FileCopyFlags.Overwrite] is specified an already
      existing destination file is overwritten.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      If progress_callback is not null, then the operation can be monitored
      by setting this to a #GFileProgressCallback function.
      progress_callback_data will be passed to this function. It is
      guaranteed that this callback will be called after all data has been
      transferred with the total number of bytes copied during the operation.
      
      If the source file does not exist, then the [gid.gio2.types.IOErrorEnum.NotFound]
      error is returned, independent on the status of the destination.
      
      If [gid.gio2.types.FileCopyFlags.Overwrite] is not specified and the target exists,
      then the error [gid.gio2.types.IOErrorEnum.Exists] is returned.
      
      If trying to overwrite a file over a directory, the [gid.gio2.types.IOErrorEnum.IsDirectory]
      error is returned. If trying to overwrite a directory with a directory the
      [gid.gio2.types.IOErrorEnum.WouldMerge] error is returned.
      
      If the source is a directory and the target does not exist, or
      [gid.gio2.types.FileCopyFlags.Overwrite] is specified and the target is a file, then
      the [gid.gio2.types.IOErrorEnum.WouldRecurse] error may be returned (if the native
      move operation isn't available).
  
      Params:
        destination = #GFile pointing to the destination location
        flags = set of #GFileCopyFlags
        cancellable = optional #GCancellable object,
            null to ignore
        progressCallback = #GFileProgressCallback
            function for updates
      Returns: true on successful move, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool move(gid.gio2.file.File destination, gid.gio2.types.FileCopyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.FileProgressCallback progressCallback = null)
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gio2.types.FileProgressCallback*)data;

      try
      {
        (*_dlg)(currentNumBytes, totalNumBytes);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.FileProgressCallback");
      }
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;
    bool _retval;
    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    GError *_err;
    _retval = cast(bool)g_file_move(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Version of [gid.gio2.file.File.moveAsync] using closures instead of callbacks for
      easier binding in other languages.
  
      Params:
        destination = destination [gid.gio2.file.File]
        flags = set of [gid.gio2.types.FileCopyFlags]
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional [gid.gio2.cancellable.Cancellable] object,
            `NULL` to ignore
        progressCallbackClosure = [gid.gobject2.closure.Closure] to invoke with progress
            information, or `NULL` if progress information is not needed
        readyCallbackClosure = [gid.gobject2.closure.Closure] to invoke when the request is satisfied
  */
  override void moveAsync(gid.gio2.file.File destination, gid.gio2.types.FileCopyFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable, gid.gobject2.closure.Closure progressCallbackClosure, gid.gobject2.closure.Closure readyCallbackClosure) nothrow
  {
    g_file_move_async_with_closures(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, progressCallbackClosure ? cast(GClosure*)progressCallbackClosure._cPtr(No.Dup) : null, readyCallbackClosure ? cast(GClosure*)readyCallbackClosure._cPtr(No.Dup) : null);
  }

  /**
      Finishes an asynchronous file movement, started with
      [gid.gio2.file.File.moveAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful file move, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool moveFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_move_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Opens an existing file for reading and writing. The result is
      a #GFileIOStream that can be used to read and write the contents
      of the file.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If the file does not exist, the [gid.gio2.types.IOErrorEnum.NotFound] error will
      be returned. If the file is a directory, the [gid.gio2.types.IOErrorEnum.IsDirectory]
      error will be returned. Other errors are possible too, and depend on
      what kind of filesystem the file is on. Note that in many non-local
      file cases read and write streams are not supported, so make sure you
      really need to do read and write streaming, rather than just opening
      for reading or writing.
  
      Params:
        cancellable = a #GCancellable
      Returns: #GFileIOStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_iostream.FileIOStream openReadwrite(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileIOStream* _cretval;
    GError *_err;
    _cretval = g_file_open_readwrite(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously opens file for reading and writing.
      
      For more details, see [gid.gio2.file.File.openReadwrite] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.openReadwriteFinish] to get
      the result of the operation.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void openReadwriteAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_open_readwrite_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file read operation started with
      [gid.gio2.file.File.openReadwriteAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileIOStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_iostream.FileIOStream openReadwriteFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFileIOStream* _cretval;
    GError *_err;
    _cretval = g_file_open_readwrite_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Exactly like [gid.gio2.file.File.getPath], but caches the result via
      [gid.gobject2.object.ObjectWrap.setQdataFull].  This is useful for example in C
      applications which mix `g_file_*` APIs with native ones.  It
      also avoids an extra duplicated string when possible, so will be
      generally more efficient.
      
      This call does no blocking I/O.
      Returns: string containing the #GFile's path,
          or null if no such path exists. The returned string is owned by file.
  */
  override string peekPath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_file_peek_path(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Polls a file of type [gid.gio2.types.FileType.Mountable].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.mountMountableFinish] to get
      the result of the operation.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied, or null
  */
  override void pollMountable(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_poll_mountable(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a poll operation. See [gid.gio2.file.File.pollMountable] for details.
      
      Finish an asynchronous poll operation that was polled
      with [gid.gio2.file.File.pollMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully. false
        otherwise.
      Throws: [ErrorWrap]
  */
  override bool pollMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_poll_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Returns the #GAppInfo that is registered as the default
      application to handle the file specified by file.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
      Returns: a #GAppInfo if the handle was found,
          null if there were errors.
          When you are done with it, release it with [gid.gobject2.object.ObjectWrap.unref]
      Throws: [ErrorWrap]
  */
  override gid.gio2.app_info.AppInfo queryDefaultHandler(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GAppInfo* _cretval;
    GError *_err;
    _cretval = g_file_query_default_handler(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Async version of [gid.gio2.file.File.queryDefaultHandler].
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is done
  */
  override void queryDefaultHandlerAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_query_default_handler_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a [gid.gio2.file.File.queryDefaultHandlerAsync] operation.
  
      Params:
        result = a #GAsyncResult
      Returns: a #GAppInfo if the handle was found,
          null if there were errors.
          When you are done with it, release it with [gid.gobject2.object.ObjectWrap.unref]
      Throws: [ErrorWrap]
  */
  override gid.gio2.app_info.AppInfo queryDefaultHandlerFinish(gid.gio2.async_result.AsyncResult result)
  {
    GAppInfo* _cretval;
    GError *_err;
    _cretval = g_file_query_default_handler_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Utility function to check if a particular file exists.
      
      The fallback implementation of this API is using [gid.gio2.file.File.queryInfo]
      and therefore may do blocking I/O. To asynchronously query the existence
      of a file, use [gid.gio2.file.File.queryInfoAsync].
      
      Note that in many cases it is [racy to first check for file existence](https://en.wikipedia.org/wiki/Time_of_check_to_time_of_use)
      and then execute something based on the outcome of that, because the
      file might have been created or removed in between the operations. The
      general approach to handling that is to not check, but just do the
      operation and handle the errors as they come.
      
      As an example of race-free checking, take the case of reading a file,
      and if it doesn't exist, creating it. There are two racy versions: read
      it, and on error create it; and: check if it exists, if not create it.
      These can both result in two processes creating the file (with perhaps
      a partially written file as the result). The correct approach is to
      always try to create the file with [gid.gio2.file.File.create] which will either
      atomically create the file or fail with a [gid.gio2.types.IOErrorEnum.Exists] error.
      
      However, in many cases an existence check is useful in a user interface,
      for instance to make a menu item sensitive/insensitive, so that you don't
      have to fool users that something is possible and then just show an error
      dialog. If you do this, you should make sure to also handle the errors
      that can happen due to races when you execute the operation.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the file exists (and can be detected without error),
          false otherwise (or if cancelled).
  */
  override bool queryExists(gid.gio2.cancellable.Cancellable cancellable = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_query_exists(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Utility function to inspect the #GFileType of a file. This is
      implemented using [gid.gio2.file.File.queryInfo] and as such does blocking I/O.
      
      The primary use case of this method is to check if a file is
      a regular file, directory, or symlink.
  
      Params:
        flags = a set of #GFileQueryInfoFlags passed to [gid.gio2.file.File.queryInfo]
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: The #GFileType of the file and [gid.gio2.types.FileType.Unknown]
          if the file does not exist
  */
  override gid.gio2.types.FileType queryFileType(gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null) nothrow
  {
    GFileType _cretval;
    _cretval = g_file_query_file_type(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    gid.gio2.types.FileType _retval = cast(gid.gio2.types.FileType)_cretval;
    return _retval;
  }

  /**
      Similar to [gid.gio2.file.File.queryInfo], but obtains information
      about the filesystem the file is on, rather than the file itself.
      For instance the amount of space available and the type of
      the filesystem.
      
      The attributes value is a string that specifies the attributes
      that should be gathered. It is not an error if it's not possible
      to read a particular requested attribute from a file - it just
      won't be set. attributes should be a comma-separated list of
      attributes or attribute wildcards. The wildcard "\*" means all
      attributes, and a wildcard like "filesystem::*" means all attributes
      in the filesystem namespace. The standard namespace for filesystem
      attributes is "filesystem". Common attributes of interest are
      [gid.gio2.types.FILE_ATTRIBUTE_FILESYSTEM_SIZE] (the total size of the filesystem
      in bytes), [gid.gio2.types.FILE_ATTRIBUTE_FILESYSTEM_FREE] (number of bytes available),
      and [gid.gio2.types.FILE_ATTRIBUTE_FILESYSTEM_TYPE] (type of the filesystem).
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If the file does not exist, the [gid.gio2.types.IOErrorEnum.NotFound] error will
      be returned. Other errors are possible too, and depend on what
      kind of filesystem the file is on.
  
      Params:
        attributes = an attribute query string
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileInfo or null if there was an error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_info.FileInfo queryFilesystemInfo(string attributes, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_file_query_filesystem_info(cast(GFile*)this._cPtr, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the requested information about the filesystem
      that the specified file is on. The result is a #GFileInfo object
      that contains key-value attributes (such as type or size for the
      file).
      
      For more details, see [gid.gio2.file.File.queryFilesystemInfo] which is the
      synchronous version of this call.
      
      When the operation is finished, callback will be called. You can
      then call [gid.gio2.file.File.queryInfoFinish] to get the result of the
      operation.
  
      Params:
        attributes = an attribute query string
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void queryFilesystemInfoAsync(string attributes, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_query_filesystem_info_async(cast(GFile*)this._cPtr, _attributes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous filesystem info query.
      See [gid.gio2.file.File.queryFilesystemInfoAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: #GFileInfo for given file
          or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_info.FileInfo queryFilesystemInfoFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_query_filesystem_info_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the requested information about specified file.
      
      The result is a [gid.gio2.file_info.FileInfo] object that contains key-value
      attributes (such as the type or size of the file).
      
      The attributes value is a string that specifies the file
      attributes that should be gathered. It is not an error if
      it’s not possible to read a particular requested attribute
      from a file — it just won't be set. In particular this means that if a file
      is inaccessible (due to being in a folder with restrictive permissions), for
      example, you can expect the returned [gid.gio2.file_info.FileInfo] to have very few
      attributes set. You should check whether an attribute is set using
      [gid.gio2.file_info.FileInfo.hasAttribute] before trying to retrieve its value.
      
      It is guaranteed that if any of the following attributes are listed in
      attributes, they will always be set in the returned [gid.gio2.file_info.FileInfo],
      even if the user doesn’t have permissions to access the file:
      
       - [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME]
       - [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME]
      
      attributes should be a comma-separated list of attributes or attribute
      wildcards. The wildcard `"\*"` means all attributes, and a wildcard like
      `"standard::*"` means all attributes in the standard namespace.
      An example attribute query might be `"standard::*,owner::user"`.
      The standard attributes are available as defines, like
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME].
      
      If cancellable is not `NULL`, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error `errorGio.IOErrorEnum.CANCELLED` will be
      returned.
      
      For symlinks, normally the information about the target of the
      symlink is returned, rather than information about the symlink
      itself. However if you pass `flagsGio.FileQueryInfoFlags.NOFOLLOW_SYMLINKS`
      in flags the information about the symlink itself will be returned.
      Also, for symlinks that point to non-existing files the information
      about the symlink itself will be returned.
      
      If the file does not exist, the `errorGio.IOErrorEnum.NOT_FOUND` error will be
      returned. Other errors are possible too, and depend on what kind of
      file system the file is on.
  
      Params:
        attributes = an attribute query string
        flags = flags to affect the query operation
        cancellable = optional cancellable object
      Returns: a [gid.gio2.file_info.FileInfo] for the given file
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_info.FileInfo queryInfo(string attributes, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_file_query_info(cast(GFile*)this._cPtr, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the requested information about specified file.
      The result is a #GFileInfo object that contains key-value attributes
      (such as type or size for the file).
      
      For more details, see [gid.gio2.file.File.queryInfo] which is the synchronous
      version of this call.
      
      When the operation is finished, callback will be called. You can
      then call [gid.gio2.file.File.queryInfoFinish] to get the result of the operation.
  
      Params:
        attributes = an attribute query string
        flags = a set of #GFileQueryInfoFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void queryInfoAsync(string attributes, gid.gio2.types.FileQueryInfoFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_query_info_async(cast(GFile*)this._cPtr, _attributes, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file info query.
      See [gid.gio2.file.File.queryInfoAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: #GFileInfo for given file
          or null on error. Free the returned object with
          [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_info.FileInfo queryInfoFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_query_info_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtain the list of settable attributes for the file.
      
      Returns the type and full attribute name of all the attributes
      that can be set on this file. This doesn't mean setting it will
      always succeed though, you might get an access failure, or some
      specific file may not support a specific attribute.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileAttributeInfoList describing the settable attributes.
          When you are done with it, release it with
          [gid.gio2.file_attribute_info_list.FileAttributeInfoList.unref]
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_attribute_info_list.FileAttributeInfoList querySettableAttributes(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileAttributeInfoList* _cretval;
    GError *_err;
    _cretval = g_file_query_settable_attributes(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.gio2.file_attribute_info_list.FileAttributeInfoList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Obtain the list of attribute namespaces where new attributes
      can be created by a user. An example of this is extended
      attributes (in the "xattr" namespace).
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileAttributeInfoList describing the writable namespaces.
          When you are done with it, release it with
          [gid.gio2.file_attribute_info_list.FileAttributeInfoList.unref]
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_attribute_info_list.FileAttributeInfoList queryWritableNamespaces(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileAttributeInfoList* _cretval;
    GError *_err;
    _cretval = g_file_query_writable_namespaces(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.gio2.file_attribute_info_list.FileAttributeInfoList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Opens a file for reading. The result is a #GFileInputStream that
      can be used to read the contents of the file.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      If the file does not exist, the [gid.gio2.types.IOErrorEnum.NotFound] error will be
      returned. If the file is a directory, the [gid.gio2.types.IOErrorEnum.IsDirectory]
      error will be returned. Other errors are possible too, and depend
      on what kind of filesystem the file is on.
  
      Params:
        cancellable = a #GCancellable
      Returns: #GFileInputStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_input_stream.FileInputStream read(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileInputStream* _cretval;
    GError *_err;
    _cretval = g_file_read(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_input_stream.FileInputStream)(cast(GFileInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously opens file for reading.
      
      For more details, see [gid.gio2.file.File.read] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.readFinish] to get the result
      of the operation.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void readAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_read_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file read operation started with
      [gid.gio2.file.File.readAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileInputStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_input_stream.FileInputStream readFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFileInputStream* _cretval;
    GError *_err;
    _cretval = g_file_read_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_input_stream.FileInputStream)(cast(GFileInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns an output stream for overwriting the file, possibly
      creating a backup copy of the file first. If the file doesn't exist,
      it will be created.
      
      This will try to replace the file in the safest way possible so
      that any errors during the writing will not affect an already
      existing copy of the file. For instance, for local files it
      may write to a temporary file and then atomically rename over
      the destination when the stream is closed.
      
      By default files created are generally readable by everyone,
      but if you pass [gid.gio2.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level that
      is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If you pass in a non-null etag value and file already exists, then
      this value is compared to the current entity tag of the file, and if
      they differ an [gid.gio2.types.IOErrorEnum.WrongEtag] error is returned. This
      generally means that the file has been changed since you last read
      it. You can get the new etag from [gid.gio2.file_output_stream.FileOutputStream.getEtag]
      after you've finished writing and closed the #GFileOutputStream. When
      you load a new file you can use [gid.gio2.file_input_stream.FileInputStream.queryInfo] to
      get the etag of the file.
      
      If make_backup is true, this function will attempt to make a
      backup of the current file before overwriting it. If this fails
      a [gid.gio2.types.IOErrorEnum.CantCreateBackup] error will be returned. If you
      want to replace anyway, try again with make_backup set to false.
      
      If the file is a directory the [gid.gio2.types.IOErrorEnum.IsDirectory] error will
      be returned, and if the file is some other form of non-regular file
      then a [gid.gio2.types.IOErrorEnum.NotRegularFile] error will be returned. Some
      file systems don't allow all file names, and may return an
      [gid.gio2.types.IOErrorEnum.InvalidFilename] error, and if the name is to long
      [gid.gio2.types.IOErrorEnum.FilenameTooLong] will be returned. Other errors are
      possible too, and depend on what kind of filesystem the file is on.
  
      Params:
        etag = an optional [entity tag](#entity-tags)
            for the current #GFile, or #NULL to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileOutputStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_output_stream.FileOutputStream replace(string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileOutputStream* _cretval;
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = g_file_replace(cast(GFile*)this._cPtr, _etag, makeBackup, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously overwrites the file, replacing the contents,
      possibly creating a backup copy of the file first.
      
      For more details, see [gid.gio2.file.File.replace] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.replaceFinish] to get the result
      of the operation.
  
      Params:
        etag = an [entity tag](#entity-tags) for the current #GFile,
            or null to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void replaceAsync(string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_replace_async(cast(GFile*)this._cPtr, _etag, makeBackup, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Replaces the contents of file with contents of length bytes.
      
      If etag is specified (not null), any existing file must have that etag,
      or the error [gid.gio2.types.IOErrorEnum.WrongEtag] will be returned.
      
      If make_backup is true, this function will attempt to make a backup
      of file. Internally, it uses [gid.gio2.file.File.replace], so will try to replace the
      file contents in the safest way possible. For example, atomic renames are
      used when replacing local files’ contents.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      The returned new_etag can be used to verify that the file hasn't
      changed the next time it is saved over.
  
      Params:
        contents = a string containing the new contents for file
        etag = the old [entity-tag](#entity-tags) for the document,
            or null
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        newEtag = a location to a new [entity tag](#entity-tags)
            for the document. This should be freed with [gid.glib2.global.gfree] when no longer
            needed, or null
        cancellable = optional #GCancellable object, null to ignore
      Returns: true if successful. If an error has occurred, this function
          will return false and set error appropriately if present.
      Throws: [ErrorWrap]
  */
  override bool replaceContents(ubyte[] contents, string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, out string newEtag, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    size_t _length;
    if (contents)
      _length = cast(size_t)contents.length;

    auto _contents = cast(ubyte*)contents.ptr;
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    char* _newEtag;
    GError *_err;
    _retval = cast(bool)g_file_replace_contents(cast(GFile*)this._cPtr, _contents, _length, _etag, makeBackup, flags, &_newEtag, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    newEtag = _newEtag.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Starts an asynchronous replacement of file with the given
      contents of length bytes. etag will replace the document's
      current entity tag.
      
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gid.gio2.file.File.replaceContentsFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      If make_backup is true, this function will attempt to
      make a backup of file.
      
      Note that no copy of contents will be made, so it must stay valid
      until callback is called. See [gid.gio2.file.File.replaceContentsBytesAsync]
      for a #GBytes version that will automatically hold a reference to the
      contents (without copying) for the duration of the call.
  
      Params:
        contents = string of contents to replace the file with
        etag = a new [entity tag](#entity-tags) for the file, or null
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  override void replaceContentsAsync(ubyte[] contents, string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    size_t _length;
    if (contents)
      _length = cast(size_t)contents.length;

    auto _contents = cast(ubyte*)contents.ptr;
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_replace_contents_async(cast(GFile*)this._cPtr, _contents, _length, _etag, makeBackup, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Same as [gid.gio2.file.File.replaceContentsAsync] but takes a #GBytes input instead.
      This function will keep a ref on contents until the operation is done.
      Unlike [gid.gio2.file.File.replaceContentsAsync] this allows forgetting about the
      content without waiting for the callback.
      
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gid.gio2.file.File.replaceContentsFinish].
  
      Params:
        contents = a #GBytes
        etag = a new [entity tag](#entity-tags) for the file, or null
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  override void replaceContentsBytesAsync(gid.glib2.bytes.Bytes contents, string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_replace_contents_bytes_async(cast(GFile*)this._cPtr, contents ? cast(GBytes*)contents._cPtr(No.Dup) : null, _etag, makeBackup, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous replace of the given file. See
      [gid.gio2.file.File.replaceContentsAsync]. Sets new_etag to the new entity
      tag for the document, if present.
  
      Params:
        res = a #GAsyncResult
        newEtag = a location of a new [entity tag](#entity-tags)
            for the document. This should be freed with [gid.glib2.global.gfree] when it is no
            longer needed, or null
      Returns: true on success, false on failure.
      Throws: [ErrorWrap]
  */
  override bool replaceContentsFinish(gid.gio2.async_result.AsyncResult res, out string newEtag)
  {
    bool _retval;
    char* _newEtag;
    GError *_err;
    _retval = cast(bool)g_file_replace_contents_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_newEtag, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    newEtag = _newEtag.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Finishes an asynchronous file replace operation started with
      [gid.gio2.file.File.replaceAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileOutputStream, or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_output_stream.FileOutputStream replaceFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = g_file_replace_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns an output stream for overwriting the file in readwrite mode,
      possibly creating a backup copy of the file first. If the file doesn't
      exist, it will be created.
      
      For details about the behaviour, see [gid.gio2.file.File.replace] which does the
      same thing but returns an output stream only.
      
      Note that in many non-local file cases read and write streams are not
      supported, so make sure you really need to do read and write streaming,
      rather than just opening for reading or writing.
  
      Params:
        etag = an optional [entity tag](#entity-tags)
            for the current #GFile, or #NULL to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileIOStream or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_iostream.FileIOStream replaceReadwrite(string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFileIOStream* _cretval;
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = g_file_replace_readwrite(cast(GFile*)this._cPtr, _etag, makeBackup, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously overwrites the file in read-write mode,
      replacing the contents, possibly creating a backup copy
      of the file first.
      
      For more details, see [gid.gio2.file.File.replaceReadwrite] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.replaceReadwriteFinish] to get
      the result of the operation.
  
      Params:
        etag = an [entity tag](#entity-tags) for the current #GFile,
            or null to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void replaceReadwriteAsync(string etag, bool makeBackup, gid.gio2.types.FileCreateFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _etag = etag.toCString!(No.Malloc, Yes.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_replace_readwrite_async(cast(GFile*)this._cPtr, _etag, makeBackup, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file replace operation started with
      [gid.gio2.file.File.replaceReadwriteAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileIOStream, or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file_iostream.FileIOStream replaceReadwriteFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFileIOStream* _cretval;
    GError *_err;
    _cretval = g_file_replace_readwrite_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Resolves a relative path for file to an absolute path.
      
      This call does no blocking I/O.
      
      If the relative_path is an absolute path name, the resolution
      is done absolutely (without taking file path as base).
  
      Params:
        relativePath = a given relative path string
      Returns: a #GFile for the resolved path.
  */
  override gid.gio2.file.File resolveRelativePath(string relativePath) nothrow
  {
    GFile* _cretval;
    const(char)* _relativePath = relativePath.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_resolve_relative_path(cast(GFile*)this._cPtr, _relativePath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets an attribute in the file with attribute name attribute to value_p.
      
      Some attributes can be unset by setting type to
      [gid.gio2.types.FileAttributeType.Invalid] and value_p to null.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        attribute = a string containing the attribute's name
        type = The type of the attribute
        valueP = a pointer to the value (or the pointer
            itself if the type is a pointer type)
        flags = a set of #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attribute was set, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttribute(string attribute, gid.gio2.types.FileAttributeType type, void* valueP, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute(cast(GFile*)this._cPtr, _attribute, type, valueP, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets attribute of type [gid.gio2.types.FileAttributeType.ByteString] to value.
      If attribute is of a different type, this operation will fail,
      returning false.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        attribute = a string containing the attribute's name
        value = a string containing the attribute's new value
        flags = a #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attribute was successfully set to value
          in the file, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributeByteString(string attribute, string value, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_byte_string(cast(GFile*)this._cPtr, _attribute, _value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets attribute of type [gid.gio2.types.FileAttributeType.Int32] to value.
      If attribute is of a different type, this operation will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        attribute = a string containing the attribute's name
        value = a #gint32 containing the attribute's new value
        flags = a #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attribute was successfully set to value
          in the file, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributeInt32(string attribute, int value, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_int32(cast(GFile*)this._cPtr, _attribute, value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets attribute of type [gid.gio2.types.FileAttributeType.Int64] to value.
      If attribute is of a different type, this operation will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        attribute = a string containing the attribute's name
        value = a #guint64 containing the attribute's new value
        flags = a #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attribute was successfully set, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributeInt64(string attribute, long value, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_int64(cast(GFile*)this._cPtr, _attribute, value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets attribute of type [gid.gio2.types.FileAttributeType.String] to value.
      If attribute is of a different type, this operation will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        attribute = a string containing the attribute's name
        value = a string containing the attribute's value
        flags = #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attribute was successfully set, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributeString(string attribute, string value, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_string(cast(GFile*)this._cPtr, _attribute, _value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets attribute of type [gid.gio2.types.FileAttributeType.Uint32] to value.
      If attribute is of a different type, this operation will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        attribute = a string containing the attribute's name
        value = a #guint32 containing the attribute's new value
        flags = a #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attribute was successfully set to value
          in the file, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributeUint32(string attribute, uint value, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_uint32(cast(GFile*)this._cPtr, _attribute, value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets attribute of type [gid.gio2.types.FileAttributeType.Uint64] to value.
      If attribute is of a different type, this operation will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        attribute = a string containing the attribute's name
        value = a #guint64 containing the attribute's new value
        flags = a #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attribute was successfully set to value
          in the file, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributeUint64(string attribute, ulong value, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_uint64(cast(GFile*)this._cPtr, _attribute, value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously sets the attributes of file with info.
      
      For more details, see [gid.gio2.file.File.setAttributesFromInfo],
      which is the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.setAttributesFinish] to get
      the result of the operation.
  
      Params:
        info = a #GFileInfo
        flags = a #GFileQueryInfoFlags
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void setAttributesAsync(gid.gio2.file_info.FileInfo info, gid.gio2.types.FileQueryInfoFlags flags, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_set_attributes_async(cast(GFile*)this._cPtr, info ? cast(GFileInfo*)info._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes setting an attribute started in [gid.gio2.file.File.setAttributesAsync].
  
      Params:
        result = a #GAsyncResult
        info = a #GFileInfo
      Returns: true if the attributes were set correctly, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributesFinish(gid.gio2.async_result.AsyncResult result, out gid.gio2.file_info.FileInfo info)
  {
    bool _retval;
    GFileInfo* _info;
    GError *_err;
    _retval = cast(bool)g_file_set_attributes_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_info, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    info = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(_info, Yes.Take);
    return _retval;
  }

  /**
      Tries to set all attributes in the #GFileInfo on the target
      values, not stopping on the first error.
      
      If there is any error during this operation then error will
      be set to the first error. Error on particular fields are flagged
      by setting the "status" field in the attribute value to
      [gid.gio2.types.FileAttributeStatus.ErrorSetting], which means you can
      also detect further errors.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        info = a #GFileInfo
        flags = #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: false if there was any error, true otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributesFromInfo(gid.gio2.file_info.FileInfo info, gid.gio2.types.FileQueryInfoFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_set_attributes_from_info(cast(GFile*)this._cPtr, info ? cast(GFileInfo*)info._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Renames file to the specified display name.
      
      The display name is converted from UTF-8 to the correct encoding
      for the target filesystem if possible and the file is renamed to this.
      
      If you want to implement a rename operation in the user interface the
      edit name ([gid.gio2.types.FILE_ATTRIBUTE_STANDARD_EDIT_NAME]) should be used as the
      initial value in the rename widget, and then the result after editing
      should be passed to [gid.gio2.file.File.setDisplayName].
      
      On success the resulting converted filename is returned.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        displayName = a string
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFile specifying what file was renamed to,
          or null if there was an error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file.File setDisplayName(string displayName, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GFile* _cretval;
    const(char)* _displayName = displayName.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_file_set_display_name(cast(GFile*)this._cPtr, _displayName, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously sets the display name for a given #GFile.
      
      For more details, see [gid.gio2.file.File.setDisplayName] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.setDisplayNameFinish] to get
      the result of the operation.
  
      Params:
        displayName = a string
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void setDisplayNameAsync(string displayName, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _displayName = displayName.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_set_display_name_async(cast(GFile*)this._cPtr, _displayName, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes setting a display name started with
      [gid.gio2.file.File.setDisplayNameAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFile or null on error.
          Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gio2.file.File setDisplayNameFinish(gid.gio2.async_result.AsyncResult res)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = g_file_set_display_name_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Starts a file of type [gid.gio2.types.FileType.Mountable].
      Using start_operation, you can request callbacks when, for instance,
      passwords are needed during authentication.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.mountMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        startOperation = a #GMountOperation, or null to avoid user interaction
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied, or null
  */
  override void startMountable(gid.gio2.types.DriveStartFlags flags, gid.gio2.mount_operation.MountOperation startOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_start_mountable(cast(GFile*)this._cPtr, flags, startOperation ? cast(GMountOperation*)startOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a start operation. See [gid.gio2.file.File.startMountable] for details.
      
      Finish an asynchronous start operation that was started
      with [gid.gio2.file.File.startMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully. false
        otherwise.
      Throws: [ErrorWrap]
  */
  override bool startMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_start_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Stops a file of type [gid.gio2.types.FileType.Mountable].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.stopMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation,
            or null to avoid user interaction.
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied, or null
  */
  override void stopMountable(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_stop_mountable(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a stop operation, see [gid.gio2.file.File.stopMountable] for details.
      
      Finish an asynchronous stop operation that was started
      with [gid.gio2.file.File.stopMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully.
          false otherwise.
      Throws: [ErrorWrap]
  */
  override bool stopMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_stop_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Checks if file supports thread-default main contexts
      (see [gid.glib2.main_context.MainContext.pushThreadDefault])
      If this returns false, you cannot perform asynchronous operations on
      file in a thread that has a thread-default context.
      Returns: Whether or not file supports thread-default contexts.
  */
  override bool supportsThreadContexts() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_supports_thread_contexts(cast(GFile*)this._cPtr);
    return _retval;
  }

  /**
      Sends file to the "Trashcan", if possible. This is similar to
      deleting it, but the user can recover it before emptying the trashcan.
      Trashing is disabled for system mounts by default (see
      [gid.giounix2.mount_entry.MountEntry.isSystemInternal]), so this call can return the
      [gid.gio2.types.IOErrorEnum.NotSupported] error. Since GLib 2.66, the `x-gvfs-notrash` unix
      mount option can be used to disable [gid.gio2.file.File.trash] support for particular
      mounts, the [gid.gio2.types.IOErrorEnum.NotSupported] error will be returned in that case.
      Since 2.82, the `x-gvfs-trash` unix mount option can be used to enable
      [gid.gio2.file.File.trash] support for particular system mounts.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true on successful trash, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool trash(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_trash(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously sends file to the Trash location, if possible.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  override void trashAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_trash_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file trashing operation, started with
      [gid.gio2.file.File.trashAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful trash, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool trashFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_trash_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Unmounts a file of type G_FILE_TYPE_MOUNTABLE.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.unmountMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Deprecated: Use [gid.gio2.file.File.unmountMountableWithOperation] instead.
  */
  override void unmountMountable(gid.gio2.types.MountUnmountFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_unmount_mountable(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an unmount operation, see [gid.gio2.file.File.unmountMountable] for details.
      
      Finish an asynchronous unmount operation that was started
      with [gid.gio2.file.File.unmountMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully.
          false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.gio2.file.File.unmountMountableWithOperationFinish]
          instead.
  */
  override bool unmountMountableFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_unmount_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Unmounts a file of type [gid.gio2.types.FileType.Mountable].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gid.gio2.file.File.unmountMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation,
            or null to avoid user interaction
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void unmountMountableWithOperation(gid.gio2.types.MountUnmountFlags flags, gid.gio2.mount_operation.MountOperation mountOperation = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_file_unmount_mountable_with_operation(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an unmount operation,
      see [gid.gio2.file.File.unmountMountableWithOperation] for details.
      
      Finish an asynchronous unmount operation that was started
      with [gid.gio2.file.File.unmountMountableWithOperation].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully.
          false otherwise.
      Throws: [ErrorWrap]
  */
  override bool unmountMountableWithOperationFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_unmount_mountable_with_operation_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.file.File (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_file_File(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAppendTo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAppendToAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAppendToFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCopy", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCopyAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCopyFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreate", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateReadwrite", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateReadwriteAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateReadwriteFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeleteFile", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeleteFileAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeleteFileFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDup", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectMountable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectMountableWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectMountableWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerateChildren", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerateChildrenAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerateChildrenFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEqual", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncFindEnclosingMount", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncFindEnclosingMountAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncFindEnclosingMountFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetBasename", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetChildForDisplayName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetParent", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetParseName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPath", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRelativePath", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUri", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUriScheme", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHasUriScheme", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHash", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsNative", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeDirectory", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeDirectoryAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeDirectoryFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeSymbolicLink", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeSymbolicLinkAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeSymbolicLinkFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMeasureDiskUsage", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMeasureDiskUsageFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMonitorDir", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMonitorFile", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountEnclosingVolume", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountEnclosingVolumeFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountMountable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMove", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMoveAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMoveFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncOpenReadwrite", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncOpenReadwriteAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncOpenReadwriteFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPollMountable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPollMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPrefixMatches", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryExists", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryFilesystemInfo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryFilesystemInfoAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryFilesystemInfoFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryInfo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryInfoAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryInfoFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQuerySettableAttributes", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryWritableNamespaces", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReadAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReadFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReadFn", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplace", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplaceAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplaceFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplaceReadwrite", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplaceReadwriteAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplaceReadwriteFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncResolveRelativePath", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAttribute", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAttributesAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAttributesFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAttributesFromInfo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetDisplayName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetDisplayNameAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetDisplayNameFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStartMountable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStartMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStopMountable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStopMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTrash", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTrashAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTrashFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountMountable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountMountableWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountMountableWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.file.File vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_file_File(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAppendTo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "append_to");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAppendToAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncAppendToAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAppendToFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "append_to_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCopy", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncCopy is not supported: parameter 'progress_callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCopyAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncCopyAsync is not supported: parameter 'progress_callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCopyFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "copy_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreate", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "create");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncCreateAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "create_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateReadwrite", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "create_readwrite");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateReadwriteAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncCreateReadwriteAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateReadwriteFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "create_readwrite_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeleteFile", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "delete_file");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeleteFileAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncDeleteFileAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeleteFileFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "delete_file_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDup", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "dup");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectMountable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncEjectMountable is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "eject_mountable_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectMountableWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncEjectMountableWithOperation is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEjectMountableWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "eject_mountable_with_operation_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerateChildren", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "enumerate_children");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerateChildrenAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncEnumerateChildrenAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerateChildrenFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "enumerate_children_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEqual", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "equal");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncFindEnclosingMount", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "find_enclosing_mount");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncFindEnclosingMountAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncFindEnclosingMountAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncFindEnclosingMountFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "find_enclosing_mount_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetBasename", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "get_basename");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetChildForDisplayName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "get_child_for_display_name");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetParent", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "get_parent");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetParseName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "get_parse_name");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPath", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "get_path");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRelativePath", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "get_relative_path");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUri", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "get_uri");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUriScheme", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "get_uri_scheme");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHasUriScheme", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "has_uri_scheme");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHash", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "hash");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsNative", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "is_native");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeDirectory", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "make_directory");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeDirectoryAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncMakeDirectoryAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeDirectoryFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "make_directory_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeSymbolicLink", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "make_symbolic_link");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeSymbolicLinkAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncMakeSymbolicLinkAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMakeSymbolicLinkFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "make_symbolic_link_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMeasureDiskUsage", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncMeasureDiskUsage is not supported: parameter 'progress_callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMeasureDiskUsageFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "measure_disk_usage_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMonitorDir", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "monitor_dir");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMonitorFile", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "monitor_file");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountEnclosingVolume", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncMountEnclosingVolume is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountEnclosingVolumeFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "mount_enclosing_volume_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountMountable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncMountMountable is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMountMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "mount_mountable_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMove", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncMove is not supported: parameter 'progress_callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMoveAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncMoveAsync is not supported: parameter 'progress_callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncMoveFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "move_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncOpenReadwrite", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "open_readwrite");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncOpenReadwriteAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncOpenReadwriteAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncOpenReadwriteFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "open_readwrite_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPollMountable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncPollMountable is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPollMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "poll_mountable_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPrefixMatches", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "prefix_matches");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryExists", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "query_exists");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryFilesystemInfo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "query_filesystem_info");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryFilesystemInfoAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncQueryFilesystemInfoAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryFilesystemInfoFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "query_filesystem_info_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryInfo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "query_info");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryInfoAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncQueryInfoAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryInfoFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "query_info_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQuerySettableAttributes", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "query_settable_attributes");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryWritableNamespaces", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "query_writable_namespaces");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReadAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncReadAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReadFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "read_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReadFn", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "read_fn");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplace", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "replace");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplaceAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncReplaceAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplaceFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "replace_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplaceReadwrite", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "replace_readwrite");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplaceReadwriteAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncReplaceReadwriteAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReplaceReadwriteFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "replace_readwrite_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncResolveRelativePath", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "resolve_relative_path");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAttribute", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "set_attribute");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAttributesAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncSetAttributesAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAttributesFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "set_attributes_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAttributesFromInfo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "set_attributes_from_info");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetDisplayName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "set_display_name");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetDisplayNameAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncSetDisplayNameAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetDisplayNameFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "set_display_name_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStartMountable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncStartMountable is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStartMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "start_mountable_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStopMountable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncStopMountable is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStopMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "stop_mountable_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTrash", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "trash");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTrashAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncTrashAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTrashFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "trash_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountMountable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncUnmountMountable is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountMountableFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "unmount_mountable_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountMountableWithOperation", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.file.File.vfuncUnmountMountableWithOperation is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnmountMountableWithOperationFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_file_File(iface, "unmount_mountable_with_operation_finish");
  }

  private static void _installIfaceVfunc_gid_gio2_file_File(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GFileIface*)iface;

    switch (vfunc)
    {
      case "append_to":
      {
        static extern(C) GFileOutputStream* _vfuncAppendToTramp(GFile* file, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.appendTo)
              return (cast(typeof(&_vfuncAppendToTramp))_klass.appendTo)(file, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_output_stream.FileOutputStream _dretval;

          try
          {
            _dretval = _obj.vfuncAppendTo(flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileOutputStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.appendTo = cast(typeof(_klass.appendTo))&_vfuncAppendToTramp;
        break;
      }
      case "append_to_finish":
      {
        static extern(C) GFileOutputStream* _vfuncAppendToFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.appendToFinish)
              return (cast(typeof(&_vfuncAppendToFinishTramp))_klass.appendToFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file_output_stream.FileOutputStream _dretval;

          try
          {
            _dretval = _obj.vfuncAppendToFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileOutputStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.appendToFinish = cast(typeof(_klass.appendToFinish))&_vfuncAppendToFinishTramp;
        break;
      }
      case "copy_finish":
      {
        static extern(C) gboolean _vfuncCopyFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.copyFinish)
              return (cast(typeof(&_vfuncCopyFinishTramp))_klass.copyFinish)(file, res, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCopyFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.copyFinish = cast(typeof(_klass.copyFinish))&_vfuncCopyFinishTramp;
        break;
      }
      case "create":
      {
        static extern(C) GFileOutputStream* _vfuncCreateTramp(GFile* file, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.create)
              return (cast(typeof(&_vfuncCreateTramp))_klass.create)(file, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_output_stream.FileOutputStream _dretval;

          try
          {
            _dretval = _obj.vfuncCreate(flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileOutputStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.create = cast(typeof(_klass.create))&_vfuncCreateTramp;
        break;
      }
      case "create_finish":
      {
        static extern(C) GFileOutputStream* _vfuncCreateFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.createFinish)
              return (cast(typeof(&_vfuncCreateFinishTramp))_klass.createFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file_output_stream.FileOutputStream _dretval;

          try
          {
            _dretval = _obj.vfuncCreateFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileOutputStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.createFinish = cast(typeof(_klass.createFinish))&_vfuncCreateFinishTramp;
        break;
      }
      case "create_readwrite":
      {
        static extern(C) GFileIOStream* _vfuncCreateReadwriteTramp(GFile* file, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.createReadwrite)
              return (cast(typeof(&_vfuncCreateReadwriteTramp))_klass.createReadwrite)(file, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_iostream.FileIOStream _dretval;

          try
          {
            _dretval = _obj.vfuncCreateReadwrite(flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileIOStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.createReadwrite = cast(typeof(_klass.createReadwrite))&_vfuncCreateReadwriteTramp;
        break;
      }
      case "create_readwrite_finish":
      {
        static extern(C) GFileIOStream* _vfuncCreateReadwriteFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.createReadwriteFinish)
              return (cast(typeof(&_vfuncCreateReadwriteFinishTramp))_klass.createReadwriteFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file_iostream.FileIOStream _dretval;

          try
          {
            _dretval = _obj.vfuncCreateReadwriteFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileIOStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.createReadwriteFinish = cast(typeof(_klass.createReadwriteFinish))&_vfuncCreateReadwriteFinishTramp;
        break;
      }
      case "delete_file":
      {
        static extern(C) gboolean _vfuncDeleteFileTramp(GFile* file, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.deleteFile)
              return (cast(typeof(&_vfuncDeleteFileTramp))_klass.deleteFile)(file, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncDeleteFile(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.deleteFile = cast(typeof(_klass.deleteFile))&_vfuncDeleteFileTramp;
        break;
      }
      case "delete_file_finish":
      {
        static extern(C) gboolean _vfuncDeleteFileFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.deleteFileFinish)
              return (cast(typeof(&_vfuncDeleteFileFinishTramp))_klass.deleteFileFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncDeleteFileFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.deleteFileFinish = cast(typeof(_klass.deleteFileFinish))&_vfuncDeleteFileFinishTramp;
        break;
      }
      case "dup":
      {
        static extern(C) GFile* _vfuncDupTramp(GFile* file) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.dup)
              return (cast(typeof(&_vfuncDupTramp))_klass.dup)(file);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;

          try
          {
            _dretval = _obj.vfuncDup();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncDup");
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.dup = cast(typeof(_klass.dup))&_vfuncDupTramp;
        break;
      }
      case "eject_mountable_finish":
      {
        static extern(C) gboolean _vfuncEjectMountableFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.ejectMountableFinish)
              return (cast(typeof(&_vfuncEjectMountableFinishTramp))_klass.ejectMountableFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEjectMountableFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.ejectMountableFinish = cast(typeof(_klass.ejectMountableFinish))&_vfuncEjectMountableFinishTramp;
        break;
      }
      case "eject_mountable_with_operation_finish":
      {
        static extern(C) gboolean _vfuncEjectMountableWithOperationFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.ejectMountableWithOperationFinish)
              return (cast(typeof(&_vfuncEjectMountableWithOperationFinishTramp))_klass.ejectMountableWithOperationFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEjectMountableWithOperationFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.ejectMountableWithOperationFinish = cast(typeof(_klass.ejectMountableWithOperationFinish))&_vfuncEjectMountableWithOperationFinishTramp;
        break;
      }
      case "enumerate_children":
      {
        static extern(C) GFileEnumerator* _vfuncEnumerateChildrenTramp(GFile* file, const(char)* attributes, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.enumerateChildren)
              return (cast(typeof(&_vfuncEnumerateChildrenTramp))_klass.enumerateChildren)(file, attributes, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_enumerator.FileEnumerator _dretval;
          string _attributes = attributes.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncEnumerateChildren(_attributes, flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileEnumerator*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.enumerateChildren = cast(typeof(_klass.enumerateChildren))&_vfuncEnumerateChildrenTramp;
        break;
      }
      case "enumerate_children_finish":
      {
        static extern(C) GFileEnumerator* _vfuncEnumerateChildrenFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.enumerateChildrenFinish)
              return (cast(typeof(&_vfuncEnumerateChildrenFinishTramp))_klass.enumerateChildrenFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file_enumerator.FileEnumerator _dretval;

          try
          {
            _dretval = _obj.vfuncEnumerateChildrenFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileEnumerator*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.enumerateChildrenFinish = cast(typeof(_klass.enumerateChildrenFinish))&_vfuncEnumerateChildrenFinishTramp;
        break;
      }
      case "equal":
      {
        static extern(C) gboolean _vfuncEqualTramp(GFile* file1, GFile* file2) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file1);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file1), gid.gio2.file.File._getGType);
            if (_klass && _klass.equal)
              return (cast(typeof(&_vfuncEqualTramp))_klass.equal)(file1, file2);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEqual(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(void*)file2, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncEqual");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.equal = cast(typeof(_klass.equal))&_vfuncEqualTramp;
        break;
      }
      case "find_enclosing_mount":
      {
        static extern(C) GMount* _vfuncFindEnclosingMountTramp(GFile* file, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.findEnclosingMount)
              return (cast(typeof(&_vfuncFindEnclosingMountTramp))_klass.findEnclosingMount)(file, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.mount.Mount _dretval;

          try
          {
            _dretval = _obj.vfuncFindEnclosingMount(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GMount*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.findEnclosingMount = cast(typeof(_klass.findEnclosingMount))&_vfuncFindEnclosingMountTramp;
        break;
      }
      case "find_enclosing_mount_finish":
      {
        static extern(C) GMount* _vfuncFindEnclosingMountFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.findEnclosingMountFinish)
              return (cast(typeof(&_vfuncFindEnclosingMountFinishTramp))_klass.findEnclosingMountFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.mount.Mount _dretval;

          try
          {
            _dretval = _obj.vfuncFindEnclosingMountFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GMount*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.findEnclosingMountFinish = cast(typeof(_klass.findEnclosingMountFinish))&_vfuncFindEnclosingMountFinishTramp;
        break;
      }
      case "get_basename":
      {
        static extern(C) char* _vfuncGetBasenameTramp(GFile* file) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.getBasename)
              return (cast(typeof(&_vfuncGetBasenameTramp))_klass.getBasename)(file);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetBasename();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncGetBasename");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getBasename = cast(typeof(_klass.getBasename))&_vfuncGetBasenameTramp;
        break;
      }
      case "get_child_for_display_name":
      {
        static extern(C) GFile* _vfuncGetChildForDisplayNameTramp(GFile* file, const(char)* displayName, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.getChildForDisplayName)
              return (cast(typeof(&_vfuncGetChildForDisplayNameTramp))_klass.getChildForDisplayName)(file, displayName, _err);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;
          string _displayName = displayName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetChildForDisplayName(_displayName);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getChildForDisplayName = cast(typeof(_klass.getChildForDisplayName))&_vfuncGetChildForDisplayNameTramp;
        break;
      }
      case "get_parent":
      {
        static extern(C) GFile* _vfuncGetParentTramp(GFile* file) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.getParent)
              return (cast(typeof(&_vfuncGetParentTramp))_klass.getParent)(file);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;

          try
          {
            _dretval = _obj.vfuncGetParent();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncGetParent");
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getParent = cast(typeof(_klass.getParent))&_vfuncGetParentTramp;
        break;
      }
      case "get_parse_name":
      {
        static extern(C) char* _vfuncGetParseNameTramp(GFile* file) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.getParseName)
              return (cast(typeof(&_vfuncGetParseNameTramp))_klass.getParseName)(file);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetParseName();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncGetParseName");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getParseName = cast(typeof(_klass.getParseName))&_vfuncGetParseNameTramp;
        break;
      }
      case "get_path":
      {
        static extern(C) char* _vfuncGetPathTramp(GFile* file) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.getPath)
              return (cast(typeof(&_vfuncGetPathTramp))_klass.getPath)(file);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetPath();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncGetPath");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getPath = cast(typeof(_klass.getPath))&_vfuncGetPathTramp;
        break;
      }
      case "get_relative_path":
      {
        static extern(C) char* _vfuncGetRelativePathTramp(GFile* parent, GFile* descendant) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gio2.file.File._getGType);
            if (_klass && _klass.getRelativePath)
              return (cast(typeof(&_vfuncGetRelativePathTramp))_klass.getRelativePath)(parent, descendant);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetRelativePath(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(void*)descendant, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncGetRelativePath");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getRelativePath = cast(typeof(_klass.getRelativePath))&_vfuncGetRelativePathTramp;
        break;
      }
      case "get_uri":
      {
        static extern(C) char* _vfuncGetUriTramp(GFile* file) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.getUri)
              return (cast(typeof(&_vfuncGetUriTramp))_klass.getUri)(file);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetUri();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncGetUri");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getUri = cast(typeof(_klass.getUri))&_vfuncGetUriTramp;
        break;
      }
      case "get_uri_scheme":
      {
        static extern(C) char* _vfuncGetUriSchemeTramp(GFile* file) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.getUriScheme)
              return (cast(typeof(&_vfuncGetUriSchemeTramp))_klass.getUriScheme)(file);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetUriScheme();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncGetUriScheme");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getUriScheme = cast(typeof(_klass.getUriScheme))&_vfuncGetUriSchemeTramp;
        break;
      }
      case "has_uri_scheme":
      {
        static extern(C) gboolean _vfuncHasUriSchemeTramp(GFile* file, const(char)* uriScheme) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.hasUriScheme)
              return (cast(typeof(&_vfuncHasUriSchemeTramp))_klass.hasUriScheme)(file, uriScheme);
            return typeof(return).init;
          }

          bool _dretval;
          string _uriScheme = uriScheme.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncHasUriScheme(_uriScheme);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncHasUriScheme");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.hasUriScheme = cast(typeof(_klass.hasUriScheme))&_vfuncHasUriSchemeTramp;
        break;
      }
      case "hash":
      {
        static extern(C) uint _vfuncHashTramp(GFile* file) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.hash)
              return (cast(typeof(&_vfuncHashTramp))_klass.hash)(file);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncHash();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncHash");
          }
          return _retval;
        }

        _klass.hash = cast(typeof(_klass.hash))&_vfuncHashTramp;
        break;
      }
      case "is_native":
      {
        static extern(C) gboolean _vfuncIsNativeTramp(GFile* file) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.isNative)
              return (cast(typeof(&_vfuncIsNativeTramp))_klass.isNative)(file);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsNative();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncIsNative");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isNative = cast(typeof(_klass.isNative))&_vfuncIsNativeTramp;
        break;
      }
      case "make_directory":
      {
        static extern(C) gboolean _vfuncMakeDirectoryTramp(GFile* file, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.makeDirectory)
              return (cast(typeof(&_vfuncMakeDirectoryTramp))_klass.makeDirectory)(file, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMakeDirectory(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.makeDirectory = cast(typeof(_klass.makeDirectory))&_vfuncMakeDirectoryTramp;
        break;
      }
      case "make_directory_finish":
      {
        static extern(C) gboolean _vfuncMakeDirectoryFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.makeDirectoryFinish)
              return (cast(typeof(&_vfuncMakeDirectoryFinishTramp))_klass.makeDirectoryFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMakeDirectoryFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.makeDirectoryFinish = cast(typeof(_klass.makeDirectoryFinish))&_vfuncMakeDirectoryFinishTramp;
        break;
      }
      case "make_symbolic_link":
      {
        static extern(C) gboolean _vfuncMakeSymbolicLinkTramp(GFile* file, const(char)* symlinkValue, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.makeSymbolicLink)
              return (cast(typeof(&_vfuncMakeSymbolicLinkTramp))_klass.makeSymbolicLink)(file, symlinkValue, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _symlinkValue = symlinkValue.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncMakeSymbolicLink(_symlinkValue, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.makeSymbolicLink = cast(typeof(_klass.makeSymbolicLink))&_vfuncMakeSymbolicLinkTramp;
        break;
      }
      case "make_symbolic_link_finish":
      {
        static extern(C) gboolean _vfuncMakeSymbolicLinkFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.makeSymbolicLinkFinish)
              return (cast(typeof(&_vfuncMakeSymbolicLinkFinishTramp))_klass.makeSymbolicLinkFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMakeSymbolicLinkFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.makeSymbolicLinkFinish = cast(typeof(_klass.makeSymbolicLinkFinish))&_vfuncMakeSymbolicLinkFinishTramp;
        break;
      }
      case "measure_disk_usage_finish":
      {
        static extern(C) gboolean _vfuncMeasureDiskUsageFinishTramp(GFile* file, GAsyncResult* result, ulong* diskUsage, ulong* numDirs, ulong* numFiles, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.measureDiskUsageFinish)
              return (cast(typeof(&_vfuncMeasureDiskUsageFinishTramp))_klass.measureDiskUsageFinish)(file, result, diskUsage, numDirs, numFiles, _err);
            return typeof(return).init;
          }

          typeof(*diskUsage) _diskUsageNull;
          if (!diskUsage)
            diskUsage = &_diskUsageNull;

          typeof(*numDirs) _numDirsNull;
          if (!numDirs)
            numDirs = &_numDirsNull;

          typeof(*numFiles) _numFilesNull;
          if (!numFiles)
            numFiles = &_numFilesNull;

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMeasureDiskUsageFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take), *diskUsage, *numDirs, *numFiles);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.measureDiskUsageFinish = cast(typeof(_klass.measureDiskUsageFinish))&_vfuncMeasureDiskUsageFinishTramp;
        break;
      }
      case "monitor_dir":
      {
        static extern(C) GFileMonitor* _vfuncMonitorDirTramp(GFile* file, GFileMonitorFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.monitorDir)
              return (cast(typeof(&_vfuncMonitorDirTramp))_klass.monitorDir)(file, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_monitor.FileMonitor _dretval;

          try
          {
            _dretval = _obj.vfuncMonitorDir(flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileMonitor*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.monitorDir = cast(typeof(_klass.monitorDir))&_vfuncMonitorDirTramp;
        break;
      }
      case "monitor_file":
      {
        static extern(C) GFileMonitor* _vfuncMonitorFileTramp(GFile* file, GFileMonitorFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.monitorFile)
              return (cast(typeof(&_vfuncMonitorFileTramp))_klass.monitorFile)(file, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_monitor.FileMonitor _dretval;

          try
          {
            _dretval = _obj.vfuncMonitorFile(flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileMonitor*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.monitorFile = cast(typeof(_klass.monitorFile))&_vfuncMonitorFileTramp;
        break;
      }
      case "mount_enclosing_volume_finish":
      {
        static extern(C) gboolean _vfuncMountEnclosingVolumeFinishTramp(GFile* location, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)location);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)location), gid.gio2.file.File._getGType);
            if (_klass && _klass.mountEnclosingVolumeFinish)
              return (cast(typeof(&_vfuncMountEnclosingVolumeFinishTramp))_klass.mountEnclosingVolumeFinish)(location, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMountEnclosingVolumeFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.mountEnclosingVolumeFinish = cast(typeof(_klass.mountEnclosingVolumeFinish))&_vfuncMountEnclosingVolumeFinishTramp;
        break;
      }
      case "mount_mountable_finish":
      {
        static extern(C) GFile* _vfuncMountMountableFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.mountMountableFinish)
              return (cast(typeof(&_vfuncMountMountableFinishTramp))_klass.mountMountableFinish)(file, result, _err);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;

          try
          {
            _dretval = _obj.vfuncMountMountableFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.mountMountableFinish = cast(typeof(_klass.mountMountableFinish))&_vfuncMountMountableFinishTramp;
        break;
      }
      case "move_finish":
      {
        static extern(C) gboolean _vfuncMoveFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.moveFinish)
              return (cast(typeof(&_vfuncMoveFinishTramp))_klass.moveFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMoveFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.moveFinish = cast(typeof(_klass.moveFinish))&_vfuncMoveFinishTramp;
        break;
      }
      case "open_readwrite":
      {
        static extern(C) GFileIOStream* _vfuncOpenReadwriteTramp(GFile* file, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.openReadwrite)
              return (cast(typeof(&_vfuncOpenReadwriteTramp))_klass.openReadwrite)(file, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_iostream.FileIOStream _dretval;

          try
          {
            _dretval = _obj.vfuncOpenReadwrite(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileIOStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.openReadwrite = cast(typeof(_klass.openReadwrite))&_vfuncOpenReadwriteTramp;
        break;
      }
      case "open_readwrite_finish":
      {
        static extern(C) GFileIOStream* _vfuncOpenReadwriteFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.openReadwriteFinish)
              return (cast(typeof(&_vfuncOpenReadwriteFinishTramp))_klass.openReadwriteFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file_iostream.FileIOStream _dretval;

          try
          {
            _dretval = _obj.vfuncOpenReadwriteFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileIOStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.openReadwriteFinish = cast(typeof(_klass.openReadwriteFinish))&_vfuncOpenReadwriteFinishTramp;
        break;
      }
      case "poll_mountable_finish":
      {
        static extern(C) gboolean _vfuncPollMountableFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.pollMountableFinish)
              return (cast(typeof(&_vfuncPollMountableFinishTramp))_klass.pollMountableFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncPollMountableFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.pollMountableFinish = cast(typeof(_klass.pollMountableFinish))&_vfuncPollMountableFinishTramp;
        break;
      }
      case "prefix_matches":
      {
        static extern(C) gboolean _vfuncPrefixMatchesTramp(GFile* prefix, GFile* file) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)prefix);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)prefix), gid.gio2.file.File._getGType);
            if (_klass && _klass.prefixMatches)
              return (cast(typeof(&_vfuncPrefixMatchesTramp))_klass.prefixMatches)(prefix, file);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncPrefixMatches(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(void*)file, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncPrefixMatches");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.prefixMatches = cast(typeof(_klass.prefixMatches))&_vfuncPrefixMatchesTramp;
        break;
      }
      case "query_exists":
      {
        static extern(C) gboolean _vfuncQueryExistsTramp(GFile* file, GCancellable* cancellable) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.queryExists)
              return (cast(typeof(&_vfuncQueryExistsTramp))_klass.queryExists)(file, cancellable);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncQueryExists(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncQueryExists");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.queryExists = cast(typeof(_klass.queryExists))&_vfuncQueryExistsTramp;
        break;
      }
      case "query_filesystem_info":
      {
        static extern(C) GFileInfo* _vfuncQueryFilesystemInfoTramp(GFile* file, const(char)* attributes, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.queryFilesystemInfo)
              return (cast(typeof(&_vfuncQueryFilesystemInfoTramp))_klass.queryFilesystemInfo)(file, attributes, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_info.FileInfo _dretval;
          string _attributes = attributes.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncQueryFilesystemInfo(_attributes, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileInfo*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.queryFilesystemInfo = cast(typeof(_klass.queryFilesystemInfo))&_vfuncQueryFilesystemInfoTramp;
        break;
      }
      case "query_filesystem_info_finish":
      {
        static extern(C) GFileInfo* _vfuncQueryFilesystemInfoFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.queryFilesystemInfoFinish)
              return (cast(typeof(&_vfuncQueryFilesystemInfoFinishTramp))_klass.queryFilesystemInfoFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file_info.FileInfo _dretval;

          try
          {
            _dretval = _obj.vfuncQueryFilesystemInfoFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileInfo*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.queryFilesystemInfoFinish = cast(typeof(_klass.queryFilesystemInfoFinish))&_vfuncQueryFilesystemInfoFinishTramp;
        break;
      }
      case "query_info":
      {
        static extern(C) GFileInfo* _vfuncQueryInfoTramp(GFile* file, const(char)* attributes, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.queryInfo)
              return (cast(typeof(&_vfuncQueryInfoTramp))_klass.queryInfo)(file, attributes, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_info.FileInfo _dretval;
          string _attributes = attributes.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncQueryInfo(_attributes, flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
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
        static extern(C) GFileInfo* _vfuncQueryInfoFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.queryInfoFinish)
              return (cast(typeof(&_vfuncQueryInfoFinishTramp))_klass.queryInfoFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file_info.FileInfo _dretval;

          try
          {
            _dretval = _obj.vfuncQueryInfoFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
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
      case "query_settable_attributes":
      {
        static extern(C) GFileAttributeInfoList* _vfuncQuerySettableAttributesTramp(GFile* file, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.querySettableAttributes)
              return (cast(typeof(&_vfuncQuerySettableAttributesTramp))_klass.querySettableAttributes)(file, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_attribute_info_list.FileAttributeInfoList _dretval;

          try
          {
            _dretval = _obj.vfuncQuerySettableAttributes(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileAttributeInfoList*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.querySettableAttributes = cast(typeof(_klass.querySettableAttributes))&_vfuncQuerySettableAttributesTramp;
        break;
      }
      case "query_writable_namespaces":
      {
        static extern(C) GFileAttributeInfoList* _vfuncQueryWritableNamespacesTramp(GFile* file, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.queryWritableNamespaces)
              return (cast(typeof(&_vfuncQueryWritableNamespacesTramp))_klass.queryWritableNamespaces)(file, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_attribute_info_list.FileAttributeInfoList _dretval;

          try
          {
            _dretval = _obj.vfuncQueryWritableNamespaces(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileAttributeInfoList*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.queryWritableNamespaces = cast(typeof(_klass.queryWritableNamespaces))&_vfuncQueryWritableNamespacesTramp;
        break;
      }
      case "read_finish":
      {
        static extern(C) GFileInputStream* _vfuncReadFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.readFinish)
              return (cast(typeof(&_vfuncReadFinishTramp))_klass.readFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file_input_stream.FileInputStream _dretval;

          try
          {
            _dretval = _obj.vfuncReadFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileInputStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.readFinish = cast(typeof(_klass.readFinish))&_vfuncReadFinishTramp;
        break;
      }
      case "read_fn":
      {
        static extern(C) GFileInputStream* _vfuncReadFnTramp(GFile* file, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.readFn)
              return (cast(typeof(&_vfuncReadFnTramp))_klass.readFn)(file, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_input_stream.FileInputStream _dretval;

          try
          {
            _dretval = _obj.vfuncReadFn(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileInputStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.readFn = cast(typeof(_klass.readFn))&_vfuncReadFnTramp;
        break;
      }
      case "replace":
      {
        static extern(C) GFileOutputStream* _vfuncReplaceTramp(GFile* file, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.replace)
              return (cast(typeof(&_vfuncReplaceTramp))_klass.replace)(file, etag, makeBackup, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_output_stream.FileOutputStream _dretval;
          string _etag = etag.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncReplace(_etag, cast(bool)makeBackup, flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileOutputStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.replace = cast(typeof(_klass.replace))&_vfuncReplaceTramp;
        break;
      }
      case "replace_finish":
      {
        static extern(C) GFileOutputStream* _vfuncReplaceFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.replaceFinish)
              return (cast(typeof(&_vfuncReplaceFinishTramp))_klass.replaceFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file_output_stream.FileOutputStream _dretval;

          try
          {
            _dretval = _obj.vfuncReplaceFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileOutputStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.replaceFinish = cast(typeof(_klass.replaceFinish))&_vfuncReplaceFinishTramp;
        break;
      }
      case "replace_readwrite":
      {
        static extern(C) GFileIOStream* _vfuncReplaceReadwriteTramp(GFile* file, const(char)* etag, gboolean makeBackup, GFileCreateFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.replaceReadwrite)
              return (cast(typeof(&_vfuncReplaceReadwriteTramp))_klass.replaceReadwrite)(file, etag, makeBackup, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file_iostream.FileIOStream _dretval;
          string _etag = etag.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncReplaceReadwrite(_etag, cast(bool)makeBackup, flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileIOStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.replaceReadwrite = cast(typeof(_klass.replaceReadwrite))&_vfuncReplaceReadwriteTramp;
        break;
      }
      case "replace_readwrite_finish":
      {
        static extern(C) GFileIOStream* _vfuncReplaceReadwriteFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.replaceReadwriteFinish)
              return (cast(typeof(&_vfuncReplaceReadwriteFinishTramp))_klass.replaceReadwriteFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file_iostream.FileIOStream _dretval;

          try
          {
            _dretval = _obj.vfuncReplaceReadwriteFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFileIOStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.replaceReadwriteFinish = cast(typeof(_klass.replaceReadwriteFinish))&_vfuncReplaceReadwriteFinishTramp;
        break;
      }
      case "resolve_relative_path":
      {
        static extern(C) GFile* _vfuncResolveRelativePathTramp(GFile* file, const(char)* relativePath) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.resolveRelativePath)
              return (cast(typeof(&_vfuncResolveRelativePathTramp))_klass.resolveRelativePath)(file, relativePath);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;
          string _relativePath = relativePath.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncResolveRelativePath(_relativePath);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.file.File.vfuncResolveRelativePath");
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.resolveRelativePath = cast(typeof(_klass.resolveRelativePath))&_vfuncResolveRelativePathTramp;
        break;
      }
      case "set_attribute":
      {
        static extern(C) gboolean _vfuncSetAttributeTramp(GFile* file, const(char)* attribute, GFileAttributeType type, void* valueP, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.setAttribute)
              return (cast(typeof(&_vfuncSetAttributeTramp))_klass.setAttribute)(file, attribute, type, valueP, flags, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _attribute = attribute.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetAttribute(_attribute, type, valueP, flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setAttribute = cast(typeof(_klass.setAttribute))&_vfuncSetAttributeTramp;
        break;
      }
      case "set_attributes_finish":
      {
        static extern(C) gboolean _vfuncSetAttributesFinishTramp(GFile* file, GAsyncResult* result, GFileInfo** info, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.setAttributesFinish)
              return (cast(typeof(&_vfuncSetAttributesFinishTramp))_klass.setAttributesFinish)(file, result, info, _err);
            return typeof(return).init;
          }

          bool _dretval;
          gid.gio2.file_info.FileInfo _info;

          try
          {
            _dretval = _obj.vfuncSetAttributesFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take), _info);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;
          *info = _info ? cast(GFileInfo*)_info._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.setAttributesFinish = cast(typeof(_klass.setAttributesFinish))&_vfuncSetAttributesFinishTramp;
        break;
      }
      case "set_attributes_from_info":
      {
        static extern(C) gboolean _vfuncSetAttributesFromInfoTramp(GFile* file, GFileInfo* info, GFileQueryInfoFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.setAttributesFromInfo)
              return (cast(typeof(&_vfuncSetAttributesFromInfoTramp))_klass.setAttributesFromInfo)(file, info, flags, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetAttributesFromInfo(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(void*)info, No.Take), flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setAttributesFromInfo = cast(typeof(_klass.setAttributesFromInfo))&_vfuncSetAttributesFromInfoTramp;
        break;
      }
      case "set_display_name":
      {
        static extern(C) GFile* _vfuncSetDisplayNameTramp(GFile* file, const(char)* displayName, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.setDisplayName)
              return (cast(typeof(&_vfuncSetDisplayNameTramp))_klass.setDisplayName)(file, displayName, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;
          string _displayName = displayName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetDisplayName(_displayName, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.setDisplayName = cast(typeof(_klass.setDisplayName))&_vfuncSetDisplayNameTramp;
        break;
      }
      case "set_display_name_finish":
      {
        static extern(C) GFile* _vfuncSetDisplayNameFinishTramp(GFile* file, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.setDisplayNameFinish)
              return (cast(typeof(&_vfuncSetDisplayNameFinishTramp))_klass.setDisplayNameFinish)(file, res, _err);
            return typeof(return).init;
          }

          gid.gio2.file.File _dretval;

          try
          {
            _dretval = _obj.vfuncSetDisplayNameFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.setDisplayNameFinish = cast(typeof(_klass.setDisplayNameFinish))&_vfuncSetDisplayNameFinishTramp;
        break;
      }
      case "start_mountable_finish":
      {
        static extern(C) gboolean _vfuncStartMountableFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.startMountableFinish)
              return (cast(typeof(&_vfuncStartMountableFinishTramp))_klass.startMountableFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStartMountableFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.startMountableFinish = cast(typeof(_klass.startMountableFinish))&_vfuncStartMountableFinishTramp;
        break;
      }
      case "stop_mountable_finish":
      {
        static extern(C) gboolean _vfuncStopMountableFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.stopMountableFinish)
              return (cast(typeof(&_vfuncStopMountableFinishTramp))_klass.stopMountableFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStopMountableFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stopMountableFinish = cast(typeof(_klass.stopMountableFinish))&_vfuncStopMountableFinishTramp;
        break;
      }
      case "trash":
      {
        static extern(C) gboolean _vfuncTrashTramp(GFile* file, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.trash)
              return (cast(typeof(&_vfuncTrashTramp))_klass.trash)(file, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncTrash(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.trash = cast(typeof(_klass.trash))&_vfuncTrashTramp;
        break;
      }
      case "trash_finish":
      {
        static extern(C) gboolean _vfuncTrashFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.trashFinish)
              return (cast(typeof(&_vfuncTrashFinishTramp))_klass.trashFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncTrashFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.trashFinish = cast(typeof(_klass.trashFinish))&_vfuncTrashFinishTramp;
        break;
      }
      case "unmount_mountable_finish":
      {
        static extern(C) gboolean _vfuncUnmountMountableFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.unmountMountableFinish)
              return (cast(typeof(&_vfuncUnmountMountableFinishTramp))_klass.unmountMountableFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnmountMountableFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unmountMountableFinish = cast(typeof(_klass.unmountMountableFinish))&_vfuncUnmountMountableFinishTramp;
        break;
      }
      case "unmount_mountable_with_operation_finish":
      {
        static extern(C) gboolean _vfuncUnmountMountableWithOperationFinishTramp(GFile* file, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)file);
          if (!_obj)
          {
            auto _klass = cast(GFileIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)file), gid.gio2.file.File._getGType);
            if (_klass && _klass.unmountMountableWithOperationFinish)
              return (cast(typeof(&_vfuncUnmountMountableWithOperationFinishTramp))_klass.unmountMountableWithOperationFinish)(file, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnmountMountableWithOperationFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unmountMountableWithOperationFinish = cast(typeof(_klass.unmountMountableWithOperationFinish))&_vfuncUnmountMountableWithOperationFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.file.File]
template FileGidBuilderT()
{
}
