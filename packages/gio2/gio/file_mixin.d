/// Module for [File] interface mixin
module gio.file_mixin;

public import gio.file_iface_proxy;
public import gid.gid;
public import gio.app_info;
public import gio.async_result;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.file_attribute_info_list;
public import gio.file_enumerator;
public import gio.file_info;
public import gio.file_input_stream;
public import gio.file_iostream;
public import gio.file_monitor;
public import gio.file_output_stream;
public import gio.mount;
public import gio.mount_operation;
public import gio.types;
public import glib.bytes;
public import glib.error;
public import gobject.object;

/**
    [gio.file.File] is a high level abstraction for manipulating files on a
    virtual file system. [gio.file.File]s are lightweight, immutable objects
    that do no I/O upon creation. It is necessary to understand that
    [gio.file.File] objects do not represent files, merely an identifier for a
    file. All file content I/O is implemented as streaming operations
    (see [gio.input_stream.InputStream] and [gio.output_stream.OutputStream]).
    
    To construct a [gio.file.File], you can use:
    
    $(LIST
      * [gio.file.File.newForPath] if you have a path.
      * [gio.file.File.newForUri] if you have a URI.
      * [gio.file.File.newForCommandlineArg] or
        [gio.file.File.newForCommandlineArgAndCwd] for a command line
        argument.
      * [gio.file.File.newTmp] to create a temporary file from a template.
      * [gio.file.File.newTmpAsync] to asynchronously create a temporary file.
      * [gio.file.File.newTmpDirAsync] to asynchronously create a temporary
        directory.
      * [gio.file.File.parseName] from a UTF-8 string gotten from
        [gio.file.File.getParseName].
      * [gio.file.File.newBuildFilename] or [gio.file.File.newBuildFilenamev]
        to create a file from path elements.
    )
      
    One way to think of a [gio.file.File] is as an abstraction of a pathname. For
    normal files the system pathname is what is stored internally, but as
    [gio.file.File]s are extensible it could also be something else that corresponds
    to a pathname in a userspace implementation of a filesystem.
    
    [gio.file.File]s make up hierarchies of directories and files that correspond to
    the files on a filesystem. You can move through the file system with
    [gio.file.File] using [gio.file.File.getParent] to get an identifier for the
    parent directory, [gio.file.File.getChild] to get a child within a
    directory, and [gio.file.File.resolveRelativePath] to resolve a relative
    path between two [gio.file.File]s. There can be multiple hierarchies, so you may not
    end up at the same root if you repeatedly call [gio.file.File.getParent]
    on two different files.
    
    All [gio.file.File]s have a basename (get with [gio.file.File.getBasename]). These
    names are byte strings that are used to identify the file on the filesystem
    (relative to its parent directory) and there is no guarantees that they
    have any particular charset encoding or even make any sense at all. If
    you want to use filenames in a user interface you should use the display
    name that you can get by requesting the
    `G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME` attribute with
    [gio.file.File.queryInfo]. This is guaranteed to be in UTF-8 and can be
    used in a user interface. But always store the real basename or the [gio.file.File]
    to use to actually access the file, because there is no way to go from a
    display name to the actual name.
    
    Using [gio.file.File] as an identifier has the same weaknesses as using a path
    in that there may be multiple aliases for the same file. For instance,
    hard or soft links may cause two different [gio.file.File]s to refer to the same
    file. Other possible causes for aliases are: case insensitive filesystems,
    short and long names on FAT/NTFS, or bind mounts in Linux. If you want to
    check if two [gio.file.File]s point to the same file you can query for the
    `G_FILE_ATTRIBUTE_ID_FILE` attribute. Note that [gio.file.File] does some trivial
    canonicalization of pathnames passed in, so that trivial differences in
    the path string used at creation (duplicated slashes, slash at end of
    path, `.` or `..` path segments, etc) does not create different [gio.file.File]s.
    
    Many [gio.file.File] operations have both synchronous and asynchronous versions
    to suit your application. Asynchronous versions of synchronous functions
    simply have `_async()` appended to their function names. The asynchronous
    I/O functions call a [gio.types.AsyncReadyCallback] which is then used to
    finalize the operation, producing a [gio.async_result.AsyncResult] which is then
    passed to the function’s matching `_finish()` operation.
    
    It is highly recommended to use asynchronous calls when running within a
    shared main loop, such as in the main thread of an application. This avoids
    I/O operations blocking other sources on the main loop from being dispatched.
    Synchronous I/O operations should be performed from worker threads. See the
    [introduction to asynchronous programming section](overview.html#asynchronous-programming)
    for more.
    
    Some [gio.file.File] operations almost always take a noticeable amount of time, and
    so do not have synchronous analogs. Notable cases include:
    
    $(LIST
      * [gio.file.File.mountMountable] to mount a mountable file.
      * [gio.file.File.unmountMountableWithOperation] to unmount a mountable
        file.
      * [gio.file.File.ejectMountableWithOperation] to eject a mountable file.
    )
      
    ## Entity Tags
    
    One notable feature of [gio.file.File]s are entity tags, or ‘etags’ for
    short. Entity tags are somewhat like a more abstract version of the
    traditional mtime, and can be used to quickly determine if the file
    has been modified from the version on the file system. See the
    HTTP 1.1
    [specification](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html)
    for HTTP `ETag` headers, which are a very similar concept.
*/
template FileT()
{












  /**
      Gets an output stream for appending data to the file.
      If the file doesn't already exist it is created.
      
      By default files created are generally readable by everyone,
      but if you pass [gio.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level that
      is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be
      returned.
      
      Some file systems don't allow all file names, and may return an
      [gio.types.IOErrorEnum.InvalidFilename] error. If the file is a directory the
      [gio.types.IOErrorEnum.IsDirectory] error will be returned. Other errors are
      possible too, and depend on what kind of filesystem the file is on.
  
      Params:
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileOutputStream, or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_output_stream.FileOutputStream appendTo(gio.types.FileCreateFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = g_file_append_to(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously opens file for appending.
      
      For more details, see [gio.file.File.appendTo] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.appendToFinish] to get the result
      of the operation.
  
      Params:
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void appendToAsync(gio.types.FileCreateFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_append_to_async(cast(GFile*)this._cPtr, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file append operation started with
      [gio.file.File.appendToAsync].
  
      Params:
        res = #GAsyncResult
      Returns: a valid #GFileOutputStream
          or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_output_stream.FileOutputStream appendToFinish(gio.async_result.AsyncResult res)
  {
    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = g_file_append_to_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Prepares the file attribute query string for copying to file.
      
      This function prepares an attribute query string to be
      passed to [gio.file.File.queryInfo] to get a list of attributes
      normally copied with the file (see [gio.file.File.copyAttributes]
      for the detailed description). This function is used by the
      implementation of [gio.file.File.copyAttributes] and is useful
      when one needs to query and set the attributes in two
      stages (e.g., for recursive move of a directory).
  
      Params:
        flags = a set of #GFileCopyFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: an attribute query string for [gio.file.File.queryInfo],
          or null if an error occurs.
      Throws: [ErrorWrap]
  */
  override string buildAttributeListForCopy(gio.types.FileCopyFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    char* _cretval;
    GError *_err;
    _cretval = g_file_build_attribute_list_for_copy(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Copies the file source to the location specified by destination.
      Can not handle recursive copies of directories.
      
      If the flag [gio.types.FileCopyFlags.Overwrite] is specified an already
      existing destination file is overwritten.
      
      If the flag [gio.types.FileCopyFlags.NofollowSymlinks] is specified then symlinks
      will be copied as symlinks, otherwise the target of the
      source symlink will be copied.
      
      If the flag [gio.types.FileCopyFlags.AllMetadata] is specified then all the metadata
      that is possible to copy is copied, not just the default subset (which,
      for instance, does not include the owner, see #GFileInfo).
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      If progress_callback is not null, then the operation can be monitored
      by setting this to a #GFileProgressCallback function.
      progress_callback_data will be passed to this function. It is guaranteed
      that this callback will be called after all data has been transferred with
      the total number of bytes copied during the operation.
      
      If the source file does not exist, then the [gio.types.IOErrorEnum.NotFound] error
      is returned, independent on the status of the destination.
      
      If [gio.types.FileCopyFlags.Overwrite] is not specified and the target exists, then
      the error [gio.types.IOErrorEnum.Exists] is returned.
      
      If trying to overwrite a file over a directory, the [gio.types.IOErrorEnum.IsDirectory]
      error is returned. If trying to overwrite a directory with a directory the
      [gio.types.IOErrorEnum.WouldMerge] error is returned.
      
      If the source is a directory and the target does not exist, or
      [gio.types.FileCopyFlags.Overwrite] is specified and the target is a file, then the
      [gio.types.IOErrorEnum.WouldRecurse] error is returned.
      
      If you are interested in copying the #GFile object itself (not the on-disk
      file), see [gio.file.File.dup].
  
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
  override bool copy(gio.file.File destination, gio.types.FileCopyFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.FileProgressCallback progressCallback = null)
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data)
    {
      auto _dlg = cast(gio.types.FileProgressCallback*)data;

      (*_dlg)(currentNumBytes, totalNumBytes);
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;

    bool _retval;
    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    GError *_err;
    _retval = cast(bool)g_file_copy(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gobject.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Copies the file source to the location specified by destination
      asynchronously. For details of the behaviour, see [gio.file.File.copy].
      
      If progress_callback is not null, then that function that will be called
      just like in [gio.file.File.copy]. The callback will run in the default main context
      of the thread calling [gio.file.File.copyAsync] — the same context as callback is
      run in.
      
      When the operation is finished, callback will be called. You can then call
      [gio.file.File.copyFinish] to get the result of the operation.
  
      Params:
        destination = destination #GFile
        flags = set of #GFileCopyFlags
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        progressCallback = function to callback with progress information, or null if
            progress information is not needed
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void copyAsync(gio.file.File destination, gio.types.FileCopyFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.FileProgressCallback progressCallback = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data)
    {
      auto _dlg = cast(gio.types.FileProgressCallback*)data;

      (*_dlg)(currentNumBytes, totalNumBytes);
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _progressCallback = progressCallback ? freezeDelegate(cast(void*)&progressCallback) : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_copy_async(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gobject.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, _callbackCB, _callback);
  }

  /**
      Copies the file attributes from source to destination.
      
      Normally only a subset of the file attributes are copied,
      those that are copies in a normal file copy operation
      (which for instance does not include e.g. owner). However
      if [gio.types.FileCopyFlags.AllMetadata] is specified in flags, then
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
  override bool copyAttributes(gio.file.File destination, gio.types.FileCopyFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_copy_attributes(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gobject.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Finishes copying the file started with [gio.file.File.copyAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a true on success, false on error.
      Throws: [ErrorWrap]
  */
  override bool copyFinish(gio.async_result.AsyncResult res)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_copy_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates a new file and returns an output stream for writing to it.
      The file must not already exist.
      
      By default files created are generally readable by everyone,
      but if you pass [gio.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level
      that is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If a file or directory with this name already exists the
      [gio.types.IOErrorEnum.Exists] error will be returned. Some file systems don't
      allow all file names, and may return an [gio.types.IOErrorEnum.InvalidFilename]
      error, and if the name is to long [gio.types.IOErrorEnum.FilenameTooLong] will
      be returned. Other errors are possible too, and depend on what kind
      of filesystem the file is on.
  
      Params:
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileOutputStream for the newly created
          file, or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_output_stream.FileOutputStream create(gio.types.FileCreateFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = g_file_create(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a new file and returns an output stream
      for writing to it. The file must not already exist.
      
      For more details, see [gio.file.File.create] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.createFinish] to get the result
      of the operation.
  
      Params:
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void createAsync(gio.types.FileCreateFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_create_async(cast(GFile*)this._cPtr, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file create operation started with
      [gio.file.File.createAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileOutputStream or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_output_stream.FileOutputStream createFinish(gio.async_result.AsyncResult res)
  {
    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = g_file_create_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new file and returns a stream for reading and
      writing to it. The file must not already exist.
      
      By default files created are generally readable by everyone,
      but if you pass [gio.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level
      that is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If a file or directory with this name already exists, the
      [gio.types.IOErrorEnum.Exists] error will be returned. Some file systems don't
      allow all file names, and may return an [gio.types.IOErrorEnum.InvalidFilename]
      error, and if the name is too long, [gio.types.IOErrorEnum.FilenameTooLong]
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
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_iostream.FileIOStream createReadwrite(gio.types.FileCreateFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileIOStream* _cretval;
    GError *_err;
    _cretval = g_file_create_readwrite(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously creates a new file and returns a stream
      for reading and writing to it. The file must not already exist.
      
      For more details, see [gio.file.File.createReadwrite] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.createReadwriteFinish] to get
      the result of the operation.
  
      Params:
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void createReadwriteAsync(gio.types.FileCreateFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_create_readwrite_async(cast(GFile*)this._cPtr, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file create operation started with
      [gio.file.File.createReadwriteAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileIOStream or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_iostream.FileIOStream createReadwriteFinish(gio.async_result.AsyncResult res)
  {
    GFileIOStream* _cretval;
    GError *_err;
    _cretval = g_file_create_readwrite_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Deletes a file. If the file is a directory, it will only be
      deleted if it is empty. This has the same semantics as [glib.global.unlink].
      
      If file doesn’t exist, [gio.types.IOErrorEnum.NotFound] will be returned. This allows
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
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the file was deleted. false otherwise.
      Throws: [ErrorWrap]
  */
  override bool delete_(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_delete(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously delete a file. If the file is a directory, it will
      only be deleted if it is empty.  This has the same semantics as
      [glib.global.unlink].
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  override void deleteAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_delete_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes deleting a file started with [gio.file.File.deleteAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the file was deleted. false otherwise.
      Throws: [ErrorWrap]
  */
  override bool deleteFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_delete_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Duplicates a #GFile handle. This operation does not duplicate
      the actual file or directory represented by the #GFile; see
      [gio.file.File.copy] if attempting to copy a file.
      
      [gio.file.File.dup] is useful when a second handle is needed to the same underlying
      file, for use in a separate thread (#GFile is not thread-safe). For use
      within the same thread, use [gobject.object.ObjectWrap.ref_] to increment the existing object’s
      reference count.
      
      This call does no blocking I/O.
      Returns: a new #GFile that is a duplicate
          of the given #GFile.
  */
  override gio.file.File dup()
  {
    GFile* _cretval;
    _cretval = g_file_dup(cast(GFile*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Starts an asynchronous eject on a mountable.
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gio.file.File.ejectMountableFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = flags affecting the operation
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Deprecated: Use [gio.file.File.ejectMountableWithOperation] instead.
  */
  override void ejectMountable(gio.types.MountUnmountFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_eject_mountable(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous eject operation started by
      [gio.file.File.ejectMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the file was ejected successfully.
          false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gio.file.File.ejectMountableWithOperationFinish]
          instead.
  */
  override bool ejectMountableFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_eject_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Starts an asynchronous eject on a mountable.
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gio.file.File.ejectMountableWithOperationFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation,
            or null to avoid user interaction
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void ejectMountableWithOperation(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_eject_mountable_with_operation(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous eject operation started by
      [gio.file.File.ejectMountableWithOperation].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the file was ejected successfully.
          false otherwise.
      Throws: [ErrorWrap]
  */
  override bool ejectMountableWithOperationFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_eject_mountable_with_operation_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the requested information about the files in a directory.
      The result is a #GFileEnumerator object that will give out
      #GFileInfo objects for all the files in the directory.
      
      The attributes value is a string that specifies the file
      attributes that should be gathered. It is not an error if
      it's not possible to read a particular requested attribute
      from a file - it just won't be set. attributes should
      be a comma-separated list of attributes or attribute wildcards.
      The wildcard "*" means all attributes, and a wildcard like
      "standard::*" means all attributes in the standard namespace.
      An example attribute query be "standard::*,owner::user".
      The standard attributes are available as defines, like
      `G_FILE_ATTRIBUTE_STANDARD_NAME`. `G_FILE_ATTRIBUTE_STANDARD_NAME` should
      always be specified if you plan to call [gio.file_enumerator.FileEnumerator.getChild] or
      [gio.file_enumerator.FileEnumerator.iterate] on the returned enumerator.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If the file does not exist, the [gio.types.IOErrorEnum.NotFound] error will
      be returned. If the file is not a directory, the [gio.types.IOErrorEnum.NotDirectory]
      error will be returned. Other errors are possible too.
  
      Params:
        attributes = an attribute query string
        flags = a set of #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: A #GFileEnumerator if successful,
          null on error. Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_enumerator.FileEnumerator enumerateChildren(string attributes, gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileEnumerator* _cretval;
    const(char)* _attributes = attributes.toCString(No.Alloc);
    GError *_err;
    _cretval = g_file_enumerate_children(cast(GFile*)this._cPtr, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_enumerator.FileEnumerator)(cast(GFileEnumerator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the requested information about the files
      in a directory. The result is a #GFileEnumerator object that will
      give out #GFileInfo objects for all the files in the directory.
      
      For more details, see [gio.file.File.enumerateChildren] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called. You can
      then call [gio.file.File.enumerateChildrenFinish] to get the result of
      the operation.
  
      Params:
        attributes = an attribute query string
        flags = a set of #GFileQueryInfoFlags
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void enumerateChildrenAsync(string attributes, gio.types.FileQueryInfoFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
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
    g_file_enumerate_children_async(cast(GFile*)this._cPtr, _attributes, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async enumerate children operation.
      See [gio.file.File.enumerateChildrenAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileEnumerator or null
          if an error occurred.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_enumerator.FileEnumerator enumerateChildrenFinish(gio.async_result.AsyncResult res)
  {
    GFileEnumerator* _cretval;
    GError *_err;
    _cretval = g_file_enumerate_children_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_enumerator.FileEnumerator)(cast(GFileEnumerator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if the two given #GFiles refer to the same file.
      
      Note that two #GFiles that differ can still refer to the same
      file on the filesystem due to various forms of filename
      aliasing.
      
      This call does no blocking I/O.
  
      Params:
        file2 = the second #GFile
      Returns: true if file1 and file2 are equal.
  */
  override bool equal(gio.file.File file2)
  {
    bool _retval;
    _retval = cast(bool)g_file_equal(cast(GFile*)this._cPtr, file2 ? cast(GFile*)(cast(gobject.object.ObjectWrap)file2)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets a #GMount for the #GFile.
      
      #GMount is returned only for user interesting locations, see
      #GVolumeMonitor. If the #GFileIface for file does not have a #mount,
      error will be set to [gio.types.IOErrorEnum.NotFound] and null #will be returned.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GMount where the file is located
          or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.mount.Mount findEnclosingMount(gio.cancellable.Cancellable cancellable = null)
  {
    GMount* _cretval;
    GError *_err;
    _cretval = g_file_find_enclosing_mount(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the mount for the file.
      
      For more details, see [gio.file.File.findEnclosingMount] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.findEnclosingMountFinish] to
      get the result of the operation.
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void findEnclosingMountAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_find_enclosing_mount_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous find mount request.
      See [gio.file.File.findEnclosingMountAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: #GMount for given file or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.mount.Mount findEnclosingMountFinish(gio.async_result.AsyncResult res)
  {
    GMount* _cretval;
    GError *_err;
    _cretval = g_file_find_enclosing_mount_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.mount.Mount)(cast(GMount*)_cretval, Yes.Take);
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
      can get by requesting the `G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME`
      attribute with [gio.file.File.queryInfo].
      
      This call does no blocking I/O.
      Returns: string containing the #GFile's
          base name, or null if given #GFile is invalid. The returned string
          should be freed with [glib.global.gfree] when no longer needed.
  */
  override string getBasename()
  {
    char* _cretval;
    _cretval = g_file_get_basename(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
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
          Free the returned object with [gobject.object.ObjectWrap.unref].
  */
  override gio.file.File getChild(string name)
  {
    GFile* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_file_get_child(cast(GFile*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
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
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file.File getChildForDisplayName(string displayName)
  {
    GFile* _cretval;
    const(char)* _displayName = displayName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_file_get_child_for_display_name(cast(GFile*)this._cPtr, _displayName, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the parent directory for the file.
      If the file represents the root directory of the
      file system, then null will be returned.
      
      This call does no blocking I/O.
      Returns: a #GFile structure to the
          parent of the given #GFile or null if there is no parent. Free
          the returned object with [gobject.object.ObjectWrap.unref].
  */
  override gio.file.File getParent()
  {
    GFile* _cretval;
    _cretval = g_file_get_parent(cast(GFile*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the parse name of the file.
      A parse name is a UTF-8 string that describes the
      file such that one can get the #GFile back using
      [gio.file.File.parseName].
      
      This is generally used to show the #GFile as a nice
      full-pathname kind of string in a user interface,
      like in a location entry.
      
      For local files with names that can safely be converted
      to UTF-8 the pathname is used, otherwise the IRI is used
      (a form of URI that allows UTF-8 characters unescaped).
      
      This call does no blocking I/O.
      Returns: a string containing the #GFile's parse name.
          The returned string should be freed with [glib.global.gfree]
          when no longer needed.
  */
  override string getParseName()
  {
    char* _cretval;
    _cretval = g_file_get_parse_name(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the local pathname for #GFile, if one exists. If non-null, this is
      guaranteed to be an absolute, canonical path. It might contain symlinks.
      
      This call does no blocking I/O.
      Returns: string containing the #GFile's path,
          or null if no such path exists. The returned string should be freed
          with [glib.global.gfree] when no longer needed.
  */
  override string getPath()
  {
    char* _cretval;
    _cretval = g_file_get_path(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the path for descendant relative to parent.
      
      This call does no blocking I/O.
  
      Params:
        descendant = input #GFile
      Returns: string with the relative path from
          descendant to parent, or null if descendant doesn't have parent as
          prefix. The returned string should be freed with [glib.global.gfree] when
          no longer needed.
  */
  override string getRelativePath(gio.file.File descendant)
  {
    char* _cretval;
    _cretval = g_file_get_relative_path(cast(GFile*)this._cPtr, descendant ? cast(GFile*)(cast(gobject.object.ObjectWrap)descendant)._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the URI for the file.
      
      This call does no blocking I/O.
      Returns: a string containing the #GFile's URI. If the #GFile was constructed
          with an invalid URI, an invalid URI is returned.
          The returned string should be freed with [glib.global.gfree]
          when no longer needed.
  */
  override string getUri()
  {
    char* _cretval;
    _cretval = g_file_get_uri(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
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
          returned string should be freed with [glib.global.gfree] when no longer needed.
  */
  override string getUriScheme()
  {
    char* _cretval;
    _cretval = g_file_get_uri_scheme(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
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
  override bool hasParent(gio.file.File parent = null)
  {
    bool _retval;
    _retval = cast(bool)g_file_has_parent(cast(GFile*)this._cPtr, parent ? cast(GFile*)(cast(gobject.object.ObjectWrap)parent)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether file has the prefix specified by prefix.
      
      In other words, if the names of initial elements of file's
      pathname match prefix. Only full pathname elements are matched,
      so a path like /foo is not considered a prefix of /foobar, only
      of /foo/bar.
      
      A #GFile is not a prefix of itself. If you want to check for
      equality, use [gio.file.File.equal].
      
      This call does no I/O, as it works purely on names. As such it can
      sometimes return false even if file is inside a prefix (from a
      filesystem point of view), because the prefix of file is an alias
      of prefix.
  
      Params:
        prefix = input #GFile
      Returns: true if the file's parent, grandparent, etc is prefix,
          false otherwise.
  */
  override bool hasPrefix(gio.file.File prefix)
  {
    bool _retval;
    _retval = cast(bool)g_file_has_prefix(cast(GFile*)this._cPtr, prefix ? cast(GFile*)(cast(gobject.object.ObjectWrap)prefix)._cPtr(No.Dup) : null);
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
  override bool hasUriScheme(string uriScheme)
  {
    bool _retval;
    const(char)* _uriScheme = uriScheme.toCString(No.Alloc);
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
  override uint hash()
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
      will return false, but [gio.file.File.getPath] will still return a native path.
      
      This call does no blocking I/O.
      Returns: true if file is native
  */
  override bool isNative()
  {
    bool _retval;
    _retval = cast(bool)g_file_is_native(cast(GFile*)this._cPtr);
    return _retval;
  }

  /**
      Loads the contents of file and returns it as #GBytes.
      
      If file is a resource:// based URI, the resulting bytes will reference the
      embedded resource instead of a copy. Otherwise, this is equivalent to calling
      [gio.file.File.loadContents] and [glib.bytes.Bytes.newTake].
      
      For resources, etag_out will be set to null.
      
      The data contained in the resulting #GBytes is always zero-terminated, but
      this is not included in the #GBytes length. The resulting #GBytes should be
      freed with [glib.bytes.Bytes.unref] when no longer in use.
  
      Params:
        cancellable = a #GCancellable or null
        etagOut = a location to place the current
            entity tag for the file, or null if the entity tag is not needed
      Returns: a #GBytes or null and error is set
      Throws: [ErrorWrap]
  */
  override glib.bytes.Bytes loadBytes(gio.cancellable.Cancellable cancellable, out string etagOut)
  {
    GBytes* _cretval;
    char* _etagOut;
    GError *_err;
    _cretval = g_file_load_bytes(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_etagOut, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    etagOut = _etagOut.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Asynchronously loads the contents of file as #GBytes.
      
      If file is a resource:// based URI, the resulting bytes will reference the
      embedded resource instead of a copy. Otherwise, this is equivalent to calling
      [gio.file.File.loadContentsAsync] and [glib.bytes.Bytes.newTake].
      
      callback should call [gio.file.File.loadBytesFinish] to get the result of this
      asynchronous operation.
      
      See [gio.file.File.loadBytes] for more information.
  
      Params:
        cancellable = a #GCancellable or null
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void loadBytesAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_load_bytes_async(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Completes an asynchronous request to [gio.file.File.loadBytesAsync].
      
      For resources, etag_out will be set to null.
      
      The data contained in the resulting #GBytes is always zero-terminated, but
      this is not included in the #GBytes length. The resulting #GBytes should be
      freed with [glib.bytes.Bytes.unref] when no longer in use.
      
      See [gio.file.File.loadBytes] for more information.
  
      Params:
        result = a #GAsyncResult provided to the callback
        etagOut = a location to place the current
            entity tag for the file, or null if the entity tag is not needed
      Returns: a #GBytes or null and error is set
      Throws: [ErrorWrap]
  */
  override glib.bytes.Bytes loadBytesFinish(gio.async_result.AsyncResult result, out string etagOut)
  {
    GBytes* _cretval;
    char* _etagOut;
    GError *_err;
    _cretval = g_file_load_bytes_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_etagOut, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    etagOut = _etagOut.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Loads the content of the file into memory. The data is always
      zero-terminated, but this is not included in the resultant length.
      The returned contents should be freed with [glib.global.gfree] when no longer
      needed.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
        contents = a location to place the contents of the file
        etagOut = a location to place the current entity tag for the file,
            or null if the entity tag is not needed
      Returns: true if the file's contents were successfully loaded.
          false if there were errors.
      Throws: [ErrorWrap]
  */
  override bool loadContents(gio.cancellable.Cancellable cancellable, out ubyte[] contents, out string etagOut)
  {
    bool _retval;
    size_t _length;
    ubyte* _contents;
    char* _etagOut;
    GError *_err;
    _retval = cast(bool)g_file_load_contents(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_contents, &_length, &_etagOut, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    contents.length = _length;
    contents[0 .. $] = (cast(ubyte*)_contents)[0 .. _length];
    gFree(cast(void*)_contents);
    etagOut = _etagOut.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Starts an asynchronous load of the file's contents.
      
      For more details, see [gio.file.File.loadContents] which is
      the synchronous version of this call.
      
      When the load operation has completed, callback will be called
      with user data. To finish the operation, call
      [gio.file.File.loadContentsFinish] with the #GAsyncResult returned by
      the callback.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  override void loadContentsAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_load_contents_async(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous load of the file's contents.
      The contents are placed in contents, and length is set to the
      size of the contents string. The contents should be freed with
      [glib.global.gfree] when no longer needed. If etag_out is present, it will be
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
  override bool loadContentsFinish(gio.async_result.AsyncResult res, out ubyte[] contents, out string etagOut)
  {
    bool _retval;
    size_t _length;
    ubyte* _contents;
    char* _etagOut;
    GError *_err;
    _retval = cast(bool)g_file_load_contents_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_contents, &_length, &_etagOut, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    contents.length = _length;
    contents[0 .. $] = (cast(ubyte*)_contents)[0 .. _length];
    gFree(cast(void*)_contents);
    etagOut = _etagOut.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Finishes an asynchronous partial load operation that was started
      with [gio.file.File.loadPartialContentsAsync]. The data is always
      zero-terminated, but this is not included in the resultant length.
      The returned contents should be freed with [glib.global.gfree] when no longer
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
  override bool loadPartialContentsFinish(gio.async_result.AsyncResult res, out ubyte[] contents, out string etagOut)
  {
    bool _retval;
    size_t _length;
    ubyte* _contents;
    char* _etagOut;
    GError *_err;
    _retval = cast(bool)g_file_load_partial_contents_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_contents, &_length, &_etagOut, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    contents.length = _length;
    contents[0 .. $] = (cast(ubyte*)_contents)[0 .. _length];
    gFree(cast(void*)_contents);
    etagOut = _etagOut.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a directory. Note that this will only create a child directory
      of the immediate parent directory of the path or URI given by the #GFile.
      To recursively create directories, see [gio.file.File.makeDirectoryWithParents].
      This function will fail if the parent directory does not exist, setting
      error to [gio.types.IOErrorEnum.NotFound]. If the file system doesn't support
      creating directories, this function will fail, setting error to
      [gio.types.IOErrorEnum.NotSupported].
      
      For a local #GFile the newly created directory will have the default
      (current) ownership and permissions of the current process.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true on successful creation, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool makeDirectory(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_make_directory(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously creates a directory.
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  override void makeDirectoryAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_make_directory_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous directory creation, started with
      [gio.file.File.makeDirectoryAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful directory creation, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool makeDirectoryFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_make_directory_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates a directory and any parent directories that may not
      exist similar to 'mkdir -p'. If the file system does not support
      creating directories, this function will fail, setting error to
      [gio.types.IOErrorEnum.NotSupported]. If the directory itself already exists,
      this function will fail setting error to [gio.types.IOErrorEnum.Exists], unlike
      the similar [glib.global.mkdirWithParents].
      
      For a local #GFile the newly created directories will have the default
      (current) ownership and permissions of the current process.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if all directories have been successfully created, false
        otherwise.
      Throws: [ErrorWrap]
  */
  override bool makeDirectoryWithParents(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_make_directory_with_parents(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates a symbolic link named file which contains the string
      symlink_value.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        symlinkValue = a string with the path for the target
            of the new symlink
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true on the creation of a new symlink, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool makeSymbolicLink(string symlinkValue, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _symlinkValue = symlinkValue.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_file_make_symbolic_link(cast(GFile*)this._cPtr, _symlinkValue, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously creates a symbolic link named file which contains the
      string symlink_value.
  
      Params:
        symlinkValue = a string with the path for the target
            of the new symlink
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  override void makeSymbolicLinkAsync(string symlinkValue, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _symlinkValue = symlinkValue.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_make_symbolic_link_async(cast(GFile*)this._cPtr, _symlinkValue, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous symbolic link creation, started with
      [gio.file.File.makeSymbolicLinkAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful directory creation, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool makeSymbolicLinkFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_make_symbolic_link_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Recursively measures the disk usage of file.
      
      This is essentially an analog of the 'du' command, but it also
      reports the number of directories and non-directory files encountered
      (including things like symbolic links).
      
      By default, errors are only reported against the toplevel file
      itself.  Errors found while recursing are silently ignored, unless
      [gio.types.FileMeasureFlags.ReportAnyError] is given in flags.
      
      The returned size, disk_usage, is in bytes and should be formatted
      with [glib.global.formatSize] in order to get something reasonable for showing
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
  override bool measureDiskUsage(gio.types.FileMeasureFlags flags, gio.cancellable.Cancellable cancellable, gio.types.FileMeasureProgressCallback progressCallback, out ulong diskUsage, out ulong numDirs, out ulong numFiles)
  {
    extern(C) void _progressCallbackCallback(gboolean reporting, ulong currentSize, ulong numDirs, ulong numFiles, void* data)
    {
      auto _dlg = cast(gio.types.FileMeasureProgressCallback*)data;

      (*_dlg)(cast(bool)reporting, currentSize, numDirs, numFiles);
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;

    bool _retval;
    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    GError *_err;
    _retval = cast(bool)g_file_measure_disk_usage(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, cast(ulong*)&diskUsage, cast(ulong*)&numDirs, cast(ulong*)&numFiles, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Collects the results from an earlier call to
      [gio.file.File.measureDiskUsageAsync].  See [gio.file.File.measureDiskUsage] for
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
  override bool measureDiskUsageFinish(gio.async_result.AsyncResult result, out ulong diskUsage, out ulong numDirs, out ulong numFiles)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_measure_disk_usage_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, cast(ulong*)&diskUsage, cast(ulong*)&numDirs, cast(ulong*)&numFiles, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Obtains a file or directory monitor for the given file,
      depending on the type of the file.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = a set of #GFileMonitorFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileMonitor for the given file,
          or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_monitor.FileMonitor monitor(gio.types.FileMonitorFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileMonitor* _cretval;
    GError *_err;
    _cretval = g_file_monitor(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_monitor.FileMonitor)(cast(GFileMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains a directory monitor for the given file.
      This may fail if directory monitoring is not supported.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      It does not make sense for flags to contain
      [gio.types.FileMonitorFlags.WatchHardLinks], since hard links can not be made to
      directories.  It is not possible to monitor all the files in a
      directory for changes made via hard links; if you want to do this then
      you must register individual watches with [gio.file.File.monitor].
  
      Params:
        flags = a set of #GFileMonitorFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileMonitor for the given file,
          or null on error. Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_monitor.FileMonitor monitorDirectory(gio.types.FileMonitorFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileMonitor* _cretval;
    GError *_err;
    _cretval = g_file_monitor_directory(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_monitor.FileMonitor)(cast(GFileMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains a file monitor for the given file. If no file notification
      mechanism exists, then regular polling of the file is used.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      If flags contains [gio.types.FileMonitorFlags.WatchHardLinks] then the monitor
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
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_monitor.FileMonitor monitorFile(gio.types.FileMonitorFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileMonitor* _cretval;
    GError *_err;
    _cretval = g_file_monitor_file(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_monitor.FileMonitor)(cast(GFileMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Starts a mount_operation, mounting the volume that contains
      the file location.
      
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gio.file.File.mountEnclosingVolumeFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        flags = flags affecting the operation
        mountOperation = a #GMountOperation
            or null to avoid user interaction
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied, or null
  */
  override void mountEnclosingVolume(gio.types.MountMountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_mount_enclosing_volume(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a mount operation started by [gio.file.File.mountEnclosingVolume].
  
      Params:
        result = a #GAsyncResult
      Returns: true if successful. If an error has occurred,
          this function will return false and set error
          appropriately if present.
      Throws: [ErrorWrap]
  */
  override bool mountEnclosingVolumeFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_mount_enclosing_volume_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Mounts a file of type G_FILE_TYPE_MOUNTABLE.
      Using mount_operation, you can request callbacks when, for instance,
      passwords are needed during authentication.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.mountMountableFinish] to get
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
  override void mountMountable(gio.types.MountMountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_mount_mountable(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a mount operation. See [gio.file.File.mountMountable] for details.
      
      Finish an asynchronous mount operation that was started
      with [gio.file.File.mountMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GFile or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file.File mountMountableFinish(gio.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = g_file_mount_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tries to move the file or directory source to the location specified
      by destination. If native move operations are supported then this is
      used, otherwise a copy + delete fallback is used. The native
      implementation may support moving directories (for instance on moves
      inside the same filesystem), but the fallback code does not.
      
      If the flag [gio.types.FileCopyFlags.Overwrite] is specified an already
      existing destination file is overwritten.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      If progress_callback is not null, then the operation can be monitored
      by setting this to a #GFileProgressCallback function.
      progress_callback_data will be passed to this function. It is
      guaranteed that this callback will be called after all data has been
      transferred with the total number of bytes copied during the operation.
      
      If the source file does not exist, then the [gio.types.IOErrorEnum.NotFound]
      error is returned, independent on the status of the destination.
      
      If [gio.types.FileCopyFlags.Overwrite] is not specified and the target exists,
      then the error [gio.types.IOErrorEnum.Exists] is returned.
      
      If trying to overwrite a file over a directory, the [gio.types.IOErrorEnum.IsDirectory]
      error is returned. If trying to overwrite a directory with a directory the
      [gio.types.IOErrorEnum.WouldMerge] error is returned.
      
      If the source is a directory and the target does not exist, or
      [gio.types.FileCopyFlags.Overwrite] is specified and the target is a file, then
      the [gio.types.IOErrorEnum.WouldRecurse] error may be returned (if the native
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
  override bool move(gio.file.File destination, gio.types.FileCopyFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.FileProgressCallback progressCallback = null)
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data)
    {
      auto _dlg = cast(gio.types.FileProgressCallback*)data;

      (*_dlg)(currentNumBytes, totalNumBytes);
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;

    bool _retval;
    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    GError *_err;
    _retval = cast(bool)g_file_move(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gobject.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously moves a file source to the location of destination. For details of the behaviour, see [gio.file.File.move].
      
      If progress_callback is not null, then that function that will be called
      just like in [gio.file.File.move]. The callback will run in the default main context
      of the thread calling [gio.file.File.moveAsync] — the same context as callback is
      run in.
      
      When the operation is finished, callback will be called. You can then call
      [gio.file.File.moveFinish] to get the result of the operation.
  
      Params:
        destination = #GFile pointing to the destination location
        flags = set of #GFileCopyFlags
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        progressCallback = #GFileProgressCallback function for updates
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void moveAsync(gio.file.File destination, gio.types.FileCopyFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.FileProgressCallback progressCallback = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data)
    {
      auto _dlg = cast(gio.types.FileProgressCallback*)data;

      (*_dlg)(currentNumBytes, totalNumBytes);
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _progressCallback = progressCallback ? cast(void*)&(progressCallback) : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_move_async(cast(GFile*)this._cPtr, destination ? cast(GFile*)(cast(gobject.object.ObjectWrap)destination)._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file movement, started with
      [gio.file.File.moveAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful file move, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool moveFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_move_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Opens an existing file for reading and writing. The result is
      a #GFileIOStream that can be used to read and write the contents
      of the file.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If the file does not exist, the [gio.types.IOErrorEnum.NotFound] error will
      be returned. If the file is a directory, the [gio.types.IOErrorEnum.IsDirectory]
      error will be returned. Other errors are possible too, and depend on
      what kind of filesystem the file is on. Note that in many non-local
      file cases read and write streams are not supported, so make sure you
      really need to do read and write streaming, rather than just opening
      for reading or writing.
  
      Params:
        cancellable = a #GCancellable
      Returns: #GFileIOStream or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_iostream.FileIOStream openReadwrite(gio.cancellable.Cancellable cancellable = null)
  {
    GFileIOStream* _cretval;
    GError *_err;
    _cretval = g_file_open_readwrite(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously opens file for reading and writing.
      
      For more details, see [gio.file.File.openReadwrite] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.openReadwriteFinish] to get
      the result of the operation.
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void openReadwriteAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_open_readwrite_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file read operation started with
      [gio.file.File.openReadwriteAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileIOStream or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_iostream.FileIOStream openReadwriteFinish(gio.async_result.AsyncResult res)
  {
    GFileIOStream* _cretval;
    GError *_err;
    _cretval = g_file_open_readwrite_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Exactly like [gio.file.File.getPath], but caches the result via
      [gobject.object.ObjectWrap.setQdataFull].  This is useful for example in C
      applications which mix `g_file_*` APIs with native ones.  It
      also avoids an extra duplicated string when possible, so will be
      generally more efficient.
      
      This call does no blocking I/O.
      Returns: string containing the #GFile's path,
          or null if no such path exists. The returned string is owned by file.
  */
  override string peekPath()
  {
    const(char)* _cretval;
    _cretval = g_file_peek_path(cast(GFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Polls a file of type [gio.types.FileType.Mountable].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.mountMountableFinish] to get
      the result of the operation.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied, or null
  */
  override void pollMountable(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_poll_mountable(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a poll operation. See [gio.file.File.pollMountable] for details.
      
      Finish an asynchronous poll operation that was polled
      with [gio.file.File.pollMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully. false
        otherwise.
      Throws: [ErrorWrap]
  */
  override bool pollMountableFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_poll_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Returns the #GAppInfo that is registered as the default
      application to handle the file specified by file.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
      Returns: a #GAppInfo if the handle was found,
          null if there were errors.
          When you are done with it, release it with [gobject.object.ObjectWrap.unref]
      Throws: [ErrorWrap]
  */
  override gio.app_info.AppInfo queryDefaultHandler(gio.cancellable.Cancellable cancellable = null)
  {
    GAppInfo* _cretval;
    GError *_err;
    _cretval = g_file_query_default_handler(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Async version of [gio.file.File.queryDefaultHandler].
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is done
  */
  override void queryDefaultHandlerAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_query_default_handler_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a [gio.file.File.queryDefaultHandlerAsync] operation.
  
      Params:
        result = a #GAsyncResult
      Returns: a #GAppInfo if the handle was found,
          null if there were errors.
          When you are done with it, release it with [gobject.object.ObjectWrap.unref]
      Throws: [ErrorWrap]
  */
  override gio.app_info.AppInfo queryDefaultHandlerFinish(gio.async_result.AsyncResult result)
  {
    GAppInfo* _cretval;
    GError *_err;
    _cretval = g_file_query_default_handler_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Utility function to check if a particular file exists. This is
      implemented using [gio.file.File.queryInfo] and as such does blocking I/O.
      
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
      always try to create the file with [gio.file.File.create] which will either
      atomically create the file or fail with a [gio.types.IOErrorEnum.Exists] error.
      
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
  override bool queryExists(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    _retval = cast(bool)g_file_query_exists(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Utility function to inspect the #GFileType of a file. This is
      implemented using [gio.file.File.queryInfo] and as such does blocking I/O.
      
      The primary use case of this method is to check if a file is
      a regular file, directory, or symlink.
  
      Params:
        flags = a set of #GFileQueryInfoFlags passed to [gio.file.File.queryInfo]
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: The #GFileType of the file and [gio.types.FileType.Unknown]
          if the file does not exist
  */
  override gio.types.FileType queryFileType(gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileType _cretval;
    _cretval = g_file_query_file_type(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    gio.types.FileType _retval = cast(gio.types.FileType)_cretval;
    return _retval;
  }

  /**
      Similar to [gio.file.File.queryInfo], but obtains information
      about the filesystem the file is on, rather than the file itself.
      For instance the amount of space available and the type of
      the filesystem.
      
      The attributes value is a string that specifies the attributes
      that should be gathered. It is not an error if it's not possible
      to read a particular requested attribute from a file - it just
      won't be set. attributes should be a comma-separated list of
      attributes or attribute wildcards. The wildcard "*" means all
      attributes, and a wildcard like "filesystem::*" means all attributes
      in the filesystem namespace. The standard namespace for filesystem
      attributes is "filesystem". Common attributes of interest are
      `G_FILE_ATTRIBUTE_FILESYSTEM_SIZE` (the total size of the filesystem
      in bytes), `G_FILE_ATTRIBUTE_FILESYSTEM_FREE` (number of bytes available),
      and `G_FILE_ATTRIBUTE_FILESYSTEM_TYPE` (type of the filesystem).
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If the file does not exist, the [gio.types.IOErrorEnum.NotFound] error will
      be returned. Other errors are possible too, and depend on what
      kind of filesystem the file is on.
  
      Params:
        attributes = an attribute query string
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileInfo or null if there was an error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_info.FileInfo queryFilesystemInfo(string attributes, gio.cancellable.Cancellable cancellable = null)
  {
    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString(No.Alloc);
    GError *_err;
    _cretval = g_file_query_filesystem_info(cast(GFile*)this._cPtr, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the requested information about the filesystem
      that the specified file is on. The result is a #GFileInfo object
      that contains key-value attributes (such as type or size for the
      file).
      
      For more details, see [gio.file.File.queryFilesystemInfo] which is the
      synchronous version of this call.
      
      When the operation is finished, callback will be called. You can
      then call [gio.file.File.queryInfoFinish] to get the result of the
      operation.
  
      Params:
        attributes = an attribute query string
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void queryFilesystemInfoAsync(string attributes, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
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
    g_file_query_filesystem_info_async(cast(GFile*)this._cPtr, _attributes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous filesystem info query.
      See [gio.file.File.queryFilesystemInfoAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: #GFileInfo for given file
          or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_info.FileInfo queryFilesystemInfoFinish(gio.async_result.AsyncResult res)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_query_filesystem_info_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the requested information about specified file.
      The result is a #GFileInfo object that contains key-value
      attributes (such as the type or size of the file).
      
      The attributes value is a string that specifies the file
      attributes that should be gathered. It is not an error if
      it's not possible to read a particular requested attribute
      from a file - it just won't be set. attributes should be a
      comma-separated list of attributes or attribute wildcards.
      The wildcard "*" means all attributes, and a wildcard like
      "standard::*" means all attributes in the standard namespace.
      An example attribute query be "standard::*,owner::user".
      The standard attributes are available as defines, like
      `G_FILE_ATTRIBUTE_STANDARD_NAME`.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be
      returned.
      
      For symlinks, normally the information about the target of the
      symlink is returned, rather than information about the symlink
      itself. However if you pass [gio.types.FileQueryInfoFlags.NofollowSymlinks]
      in flags the information about the symlink itself will be returned.
      Also, for symlinks that point to non-existing files the information
      about the symlink itself will be returned.
      
      If the file does not exist, the [gio.types.IOErrorEnum.NotFound] error will be
      returned. Other errors are possible too, and depend on what kind of
      filesystem the file is on.
  
      Params:
        attributes = an attribute query string
        flags = a set of #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileInfo for the given file, or null
          on error. Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_info.FileInfo queryInfo(string attributes, gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileInfo* _cretval;
    const(char)* _attributes = attributes.toCString(No.Alloc);
    GError *_err;
    _cretval = g_file_query_info(cast(GFile*)this._cPtr, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the requested information about specified file.
      The result is a #GFileInfo object that contains key-value attributes
      (such as type or size for the file).
      
      For more details, see [gio.file.File.queryInfo] which is the synchronous
      version of this call.
      
      When the operation is finished, callback will be called. You can
      then call [gio.file.File.queryInfoFinish] to get the result of the operation.
  
      Params:
        attributes = an attribute query string
        flags = a set of #GFileQueryInfoFlags
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void queryInfoAsync(string attributes, gio.types.FileQueryInfoFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
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
    g_file_query_info_async(cast(GFile*)this._cPtr, _attributes, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file info query.
      See [gio.file.File.queryInfoAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: #GFileInfo for given file
          or null on error. Free the returned object with
          [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_info.FileInfo queryInfoFinish(gio.async_result.AsyncResult res)
  {
    GFileInfo* _cretval;
    GError *_err;
    _cretval = g_file_query_info_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
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
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileAttributeInfoList describing the settable attributes.
          When you are done with it, release it with
          [gio.file_attribute_info_list.FileAttributeInfoList.unref]
      Throws: [ErrorWrap]
  */
  override gio.file_attribute_info_list.FileAttributeInfoList querySettableAttributes(gio.cancellable.Cancellable cancellable = null)
  {
    GFileAttributeInfoList* _cretval;
    GError *_err;
    _cretval = g_file_query_settable_attributes(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gio.file_attribute_info_list.FileAttributeInfoList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Obtain the list of attribute namespaces where new attributes
      can be created by a user. An example of this is extended
      attributes (in the "xattr" namespace).
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileAttributeInfoList describing the writable namespaces.
          When you are done with it, release it with
          [gio.file_attribute_info_list.FileAttributeInfoList.unref]
      Throws: [ErrorWrap]
  */
  override gio.file_attribute_info_list.FileAttributeInfoList queryWritableNamespaces(gio.cancellable.Cancellable cancellable = null)
  {
    GFileAttributeInfoList* _cretval;
    GError *_err;
    _cretval = g_file_query_writable_namespaces(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gio.file_attribute_info_list.FileAttributeInfoList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Opens a file for reading. The result is a #GFileInputStream that
      can be used to read the contents of the file.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      If the file does not exist, the [gio.types.IOErrorEnum.NotFound] error will be
      returned. If the file is a directory, the [gio.types.IOErrorEnum.IsDirectory]
      error will be returned. Other errors are possible too, and depend
      on what kind of filesystem the file is on.
  
      Params:
        cancellable = a #GCancellable
      Returns: #GFileInputStream or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_input_stream.FileInputStream read(gio.cancellable.Cancellable cancellable = null)
  {
    GFileInputStream* _cretval;
    GError *_err;
    _cretval = g_file_read(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_input_stream.FileInputStream)(cast(GFileInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously opens file for reading.
      
      For more details, see [gio.file.File.read] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.readFinish] to get the result
      of the operation.
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void readAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_read_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file read operation started with
      [gio.file.File.readAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileInputStream or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_input_stream.FileInputStream readFinish(gio.async_result.AsyncResult res)
  {
    GFileInputStream* _cretval;
    GError *_err;
    _cretval = g_file_read_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_input_stream.FileInputStream)(cast(GFileInputStream*)_cretval, Yes.Take);
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
      but if you pass [gio.types.FileCreateFlags.Private] in flags the file
      will be made readable only to the current user, to the level that
      is supported on the target filesystem.
      
      If cancellable is not null, then the operation can be cancelled
      by triggering the cancellable object from another thread. If the
      operation was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be
      returned.
      
      If you pass in a non-null etag value and file already exists, then
      this value is compared to the current entity tag of the file, and if
      they differ an [gio.types.IOErrorEnum.WrongEtag] error is returned. This
      generally means that the file has been changed since you last read
      it. You can get the new etag from [gio.file_output_stream.FileOutputStream.getEtag]
      after you've finished writing and closed the #GFileOutputStream. When
      you load a new file you can use [gio.file_input_stream.FileInputStream.queryInfo] to
      get the etag of the file.
      
      If make_backup is true, this function will attempt to make a
      backup of the current file before overwriting it. If this fails
      a [gio.types.IOErrorEnum.CantCreateBackup] error will be returned. If you
      want to replace anyway, try again with make_backup set to false.
      
      If the file is a directory the [gio.types.IOErrorEnum.IsDirectory] error will
      be returned, and if the file is some other form of non-regular file
      then a [gio.types.IOErrorEnum.NotRegularFile] error will be returned. Some
      file systems don't allow all file names, and may return an
      [gio.types.IOErrorEnum.InvalidFilename] error, and if the name is to long
      [gio.types.IOErrorEnum.FilenameTooLong] will be returned. Other errors are
      possible too, and depend on what kind of filesystem the file is on.
  
      Params:
        etag = an optional [entity tag](#entity-tags)
            for the current #GFile, or #NULL to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFileOutputStream or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_output_stream.FileOutputStream replace(string etag, bool makeBackup, gio.types.FileCreateFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileOutputStream* _cretval;
    const(char)* _etag = etag.toCString(No.Alloc);
    GError *_err;
    _cretval = g_file_replace(cast(GFile*)this._cPtr, _etag, makeBackup, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously overwrites the file, replacing the contents,
      possibly creating a backup copy of the file first.
      
      For more details, see [gio.file.File.replace] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.replaceFinish] to get the result
      of the operation.
  
      Params:
        etag = an [entity tag](#entity-tags) for the current #GFile,
            or null to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void replaceAsync(string etag, bool makeBackup, gio.types.FileCreateFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _etag = etag.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_replace_async(cast(GFile*)this._cPtr, _etag, makeBackup, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Replaces the contents of file with contents of length bytes.
      
      If etag is specified (not null), any existing file must have that etag,
      or the error [gio.types.IOErrorEnum.WrongEtag] will be returned.
      
      If make_backup is true, this function will attempt to make a backup
      of file. Internally, it uses [gio.file.File.replace], so will try to replace the
      file contents in the safest way possible. For example, atomic renames are
      used when replacing local files’ contents.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      The returned new_etag can be used to verify that the file hasn't
      changed the next time it is saved over.
  
      Params:
        contents = a string containing the new contents for file
        etag = the old [entity-tag](#entity-tags) for the document,
            or null
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        newEtag = a location to a new [entity tag](#entity-tags)
            for the document. This should be freed with [glib.global.gfree] when no longer
            needed, or null
        cancellable = optional #GCancellable object, null to ignore
      Returns: true if successful. If an error has occurred, this function
          will return false and set error appropriately if present.
      Throws: [ErrorWrap]
  */
  override bool replaceContents(ubyte[] contents, string etag, bool makeBackup, gio.types.FileCreateFlags flags, out string newEtag, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    size_t _length;
    if (contents)
      _length = cast(size_t)contents.length;

    auto _contents = cast(const(ubyte)*)contents.ptr;
    const(char)* _etag = etag.toCString(No.Alloc);
    char* _newEtag;
    GError *_err;
    _retval = cast(bool)g_file_replace_contents(cast(GFile*)this._cPtr, _contents, _length, _etag, makeBackup, flags, &_newEtag, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    newEtag = _newEtag.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Starts an asynchronous replacement of file with the given
      contents of length bytes. etag will replace the document's
      current entity tag.
      
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gio.file.File.replaceContentsFinish].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      If make_backup is true, this function will attempt to
      make a backup of file.
      
      Note that no copy of contents will be made, so it must stay valid
      until callback is called. See [gio.file.File.replaceContentsBytesAsync]
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
  override void replaceContentsAsync(ubyte[] contents, string etag, bool makeBackup, gio.types.FileCreateFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    size_t _length;
    if (contents)
      _length = cast(size_t)contents.length;

    auto _contents = cast(const(ubyte)*)contents.ptr;
    const(char)* _etag = etag.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_replace_contents_async(cast(GFile*)this._cPtr, _contents, _length, _etag, makeBackup, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Same as [gio.file.File.replaceContentsAsync] but takes a #GBytes input instead.
      This function will keep a ref on contents until the operation is done.
      Unlike [gio.file.File.replaceContentsAsync] this allows forgetting about the
      content without waiting for the callback.
      
      When this operation has completed, callback will be called with
      user_user data, and the operation can be finalized with
      [gio.file.File.replaceContentsFinish].
  
      Params:
        contents = a #GBytes
        etag = a new [entity tag](#entity-tags) for the file, or null
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  override void replaceContentsBytesAsync(glib.bytes.Bytes contents, string etag, bool makeBackup, gio.types.FileCreateFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _etag = etag.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_replace_contents_bytes_async(cast(GFile*)this._cPtr, contents ? cast(GBytes*)contents._cPtr(No.Dup) : null, _etag, makeBackup, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous replace of the given file. See
      [gio.file.File.replaceContentsAsync]. Sets new_etag to the new entity
      tag for the document, if present.
  
      Params:
        res = a #GAsyncResult
        newEtag = a location of a new [entity tag](#entity-tags)
            for the document. This should be freed with [glib.global.gfree] when it is no
            longer needed, or null
      Returns: true on success, false on failure.
      Throws: [ErrorWrap]
  */
  override bool replaceContentsFinish(gio.async_result.AsyncResult res, out string newEtag)
  {
    bool _retval;
    char* _newEtag;
    GError *_err;
    _retval = cast(bool)g_file_replace_contents_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_newEtag, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    newEtag = _newEtag.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Finishes an asynchronous file replace operation started with
      [gio.file.File.replaceAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileOutputStream, or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_output_stream.FileOutputStream replaceFinish(gio.async_result.AsyncResult res)
  {
    GFileOutputStream* _cretval;
    GError *_err;
    _cretval = g_file_replace_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_output_stream.FileOutputStream)(cast(GFileOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns an output stream for overwriting the file in readwrite mode,
      possibly creating a backup copy of the file first. If the file doesn't
      exist, it will be created.
      
      For details about the behaviour, see [gio.file.File.replace] which does the
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
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_iostream.FileIOStream replaceReadwrite(string etag, bool makeBackup, gio.types.FileCreateFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GFileIOStream* _cretval;
    const(char)* _etag = etag.toCString(No.Alloc);
    GError *_err;
    _cretval = g_file_replace_readwrite(cast(GFile*)this._cPtr, _etag, makeBackup, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously overwrites the file in read-write mode,
      replacing the contents, possibly creating a backup copy
      of the file first.
      
      For more details, see [gio.file.File.replaceReadwrite] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.replaceReadwriteFinish] to get
      the result of the operation.
  
      Params:
        etag = an [entity tag](#entity-tags) for the current #GFile,
            or null to ignore
        makeBackup = true if a backup should be created
        flags = a set of #GFileCreateFlags
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void replaceReadwriteAsync(string etag, bool makeBackup, gio.types.FileCreateFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _etag = etag.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_replace_readwrite_async(cast(GFile*)this._cPtr, _etag, makeBackup, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file replace operation started with
      [gio.file.File.replaceReadwriteAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFileIOStream, or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file_iostream.FileIOStream replaceReadwriteFinish(gio.async_result.AsyncResult res)
  {
    GFileIOStream* _cretval;
    GError *_err;
    _cretval = g_file_replace_readwrite_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_iostream.FileIOStream)(cast(GFileIOStream*)_cretval, Yes.Take);
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
  override gio.file.File resolveRelativePath(string relativePath)
  {
    GFile* _cretval;
    const(char)* _relativePath = relativePath.toCString(No.Alloc);
    _cretval = g_file_resolve_relative_path(cast(GFile*)this._cPtr, _relativePath);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets an attribute in the file with attribute name attribute to value_p.
      
      Some attributes can be unset by setting type to
      [gio.types.FileAttributeType.Invalid] and value_p to null.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
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
  override bool setAttribute(string attribute, gio.types.FileAttributeType type, void* valueP, gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute(cast(GFile*)this._cPtr, _attribute, type, valueP, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets attribute of type [gio.types.FileAttributeType.ByteString] to value.
      If attribute is of a different type, this operation will fail,
      returning false.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
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
  override bool setAttributeByteString(string attribute, string value, gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_byte_string(cast(GFile*)this._cPtr, _attribute, _value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets attribute of type [gio.types.FileAttributeType.Int32] to value.
      If attribute is of a different type, this operation will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
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
  override bool setAttributeInt32(string attribute, int value, gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_int32(cast(GFile*)this._cPtr, _attribute, value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets attribute of type [gio.types.FileAttributeType.Int64] to value.
      If attribute is of a different type, this operation will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        attribute = a string containing the attribute's name
        value = a #guint64 containing the attribute's new value
        flags = a #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attribute was successfully set, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributeInt64(string attribute, long value, gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_int64(cast(GFile*)this._cPtr, _attribute, value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets attribute of type [gio.types.FileAttributeType.String] to value.
      If attribute is of a different type, this operation will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        attribute = a string containing the attribute's name
        value = a string containing the attribute's value
        flags = #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true if the attribute was successfully set, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributeString(string attribute, string value, gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_string(cast(GFile*)this._cPtr, _attribute, _value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets attribute of type [gio.types.FileAttributeType.Uint32] to value.
      If attribute is of a different type, this operation will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
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
  override bool setAttributeUint32(string attribute, uint value, gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_uint32(cast(GFile*)this._cPtr, _attribute, value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets attribute of type [gio.types.FileAttributeType.Uint64] to value.
      If attribute is of a different type, this operation will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
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
  override bool setAttributeUint64(string attribute, ulong value, gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_file_set_attribute_uint64(cast(GFile*)this._cPtr, _attribute, value, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously sets the attributes of file with info.
      
      For more details, see [gio.file.File.setAttributesFromInfo],
      which is the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.setAttributesFinish] to get
      the result of the operation.
  
      Params:
        info = a #GFileInfo
        flags = a #GFileQueryInfoFlags
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void setAttributesAsync(gio.file_info.FileInfo info, gio.types.FileQueryInfoFlags flags, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_set_attributes_async(cast(GFile*)this._cPtr, info ? cast(GFileInfo*)info._cPtr(No.Dup) : null, flags, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes setting an attribute started in [gio.file.File.setAttributesAsync].
  
      Params:
        result = a #GAsyncResult
        info = a #GFileInfo
      Returns: true if the attributes were set correctly, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributesFinish(gio.async_result.AsyncResult result, out gio.file_info.FileInfo info)
  {
    bool _retval;
    GFileInfo* _info;
    GError *_err;
    _retval = cast(bool)g_file_set_attributes_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_info, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    info = new gio.file_info.FileInfo(cast(void*)_info, Yes.Take);
    return _retval;
  }

  /**
      Tries to set all attributes in the #GFileInfo on the target
      values, not stopping on the first error.
      
      If there is any error during this operation then error will
      be set to the first error. Error on particular fields are flagged
      by setting the "status" field in the attribute value to
      [gio.types.FileAttributeStatus.ErrorSetting], which means you can
      also detect further errors.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        info = a #GFileInfo
        flags = #GFileQueryInfoFlags
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: false if there was any error, true otherwise.
      Throws: [ErrorWrap]
  */
  override bool setAttributesFromInfo(gio.file_info.FileInfo info, gio.types.FileQueryInfoFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_set_attributes_from_info(cast(GFile*)this._cPtr, info ? cast(GFileInfo*)info._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Renames file to the specified display name.
      
      The display name is converted from UTF-8 to the correct encoding
      for the target filesystem if possible and the file is renamed to this.
      
      If you want to implement a rename operation in the user interface the
      edit name (`G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME`) should be used as the
      initial value in the rename widget, and then the result after editing
      should be passed to [gio.file.File.setDisplayName].
      
      On success the resulting converted filename is returned.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        displayName = a string
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: a #GFile specifying what file was renamed to,
          or null if there was an error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file.File setDisplayName(string displayName, gio.cancellable.Cancellable cancellable = null)
  {
    GFile* _cretval;
    const(char)* _displayName = displayName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_file_set_display_name(cast(GFile*)this._cPtr, _displayName, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously sets the display name for a given #GFile.
      
      For more details, see [gio.file.File.setDisplayName] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.setDisplayNameFinish] to get
      the result of the operation.
  
      Params:
        displayName = a string
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void setDisplayNameAsync(string displayName, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _displayName = displayName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_set_display_name_async(cast(GFile*)this._cPtr, _displayName, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes setting a display name started with
      [gio.file.File.setDisplayNameAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: a #GFile or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gio.file.File setDisplayNameFinish(gio.async_result.AsyncResult res)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = g_file_set_display_name_finish(cast(GFile*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Starts a file of type [gio.types.FileType.Mountable].
      Using start_operation, you can request callbacks when, for instance,
      passwords are needed during authentication.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.mountMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        startOperation = a #GMountOperation, or null to avoid user interaction
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied, or null
  */
  override void startMountable(gio.types.DriveStartFlags flags, gio.mount_operation.MountOperation startOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_start_mountable(cast(GFile*)this._cPtr, flags, startOperation ? cast(GMountOperation*)startOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a start operation. See [gio.file.File.startMountable] for details.
      
      Finish an asynchronous start operation that was started
      with [gio.file.File.startMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully. false
        otherwise.
      Throws: [ErrorWrap]
  */
  override bool startMountableFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_start_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Stops a file of type [gio.types.FileType.Mountable].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.stopMountableFinish] to get
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
  override void stopMountable(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_stop_mountable(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a stop operation, see [gio.file.File.stopMountable] for details.
      
      Finish an asynchronous stop operation that was started
      with [gio.file.File.stopMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully.
          false otherwise.
      Throws: [ErrorWrap]
  */
  override bool stopMountableFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_stop_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Checks if file supports
      [thread-default contexts][g-main-context-push-thread-default-context].
      If this returns false, you cannot perform asynchronous operations on
      file in a thread that has a thread-default context.
      Returns: Whether or not file supports thread-default contexts.
  */
  override bool supportsThreadContexts()
  {
    bool _retval;
    _retval = cast(bool)g_file_supports_thread_contexts(cast(GFile*)this._cPtr);
    return _retval;
  }

  /**
      Sends file to the "Trashcan", if possible. This is similar to
      deleting it, but the user can recover it before emptying the trashcan.
      Not all file systems support trashing, so this call can return the
      [gio.types.IOErrorEnum.NotSupported] error. Since GLib 2.66, the `x-gvfs-notrash` unix
      mount option can be used to disable [gio.file.File.trash] support for certain
      mounts, the [gio.types.IOErrorEnum.NotSupported] error will be returned in that case.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        cancellable = optional #GCancellable object,
            null to ignore
      Returns: true on successful trash, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool trash(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_trash(cast(GFile*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously sends file to the Trash location, if possible.
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  override void trashAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_trash_async(cast(GFile*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous file trashing operation, started with
      [gio.file.File.trashAsync].
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful trash, false otherwise.
      Throws: [ErrorWrap]
  */
  override bool trashFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_trash_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Unmounts a file of type G_FILE_TYPE_MOUNTABLE.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.unmountMountableFinish] to get
      the result of the operation.
  
      Params:
        flags = flags affecting the operation
        cancellable = optional #GCancellable object,
            null to ignore
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Deprecated: Use [gio.file.File.unmountMountableWithOperation] instead.
  */
  override void unmountMountable(gio.types.MountUnmountFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_unmount_mountable(cast(GFile*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an unmount operation, see [gio.file.File.unmountMountable] for details.
      
      Finish an asynchronous unmount operation that was started
      with [gio.file.File.unmountMountable].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully.
          false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use [gio.file.File.unmountMountableWithOperationFinish]
          instead.
  */
  override bool unmountMountableFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_unmount_mountable_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Unmounts a file of type [gio.types.FileType.Mountable].
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
      
      When the operation is finished, callback will be called.
      You can then call [gio.file.File.unmountMountableFinish] to get
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
  override void unmountMountableWithOperation(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_file_unmount_mountable_with_operation(cast(GFile*)this._cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an unmount operation,
      see [gio.file.File.unmountMountableWithOperation] for details.
      
      Finish an asynchronous unmount operation that was started
      with [gio.file.File.unmountMountableWithOperation].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the operation finished successfully.
          false otherwise.
      Throws: [ErrorWrap]
  */
  override bool unmountMountableWithOperationFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_file_unmount_mountable_with_operation_finish(cast(GFile*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
